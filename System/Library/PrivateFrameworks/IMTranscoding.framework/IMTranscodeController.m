@implementation IMTranscodeController

+ (id)sharedInstance
{
  if (qword_253E79A58 != -1)
    dispatch_once(&qword_253E79A58, &unk_24C719B20);
  return (id)qword_253E79A60;
}

- (IMTranscodeController)init
{
  IMTranscodeController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *connectionQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMTranscodeController;
  v2 = -[IMTranscodeController init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.messages.transcoding-connection", 0);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)_disconnected
{
  NSObject *v3;
  NSObject *v4;
  OS_xpc_object *connection;
  uint8_t v6[16];
  uint8_t buf[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D4BC000, v3, OS_LOG_TYPE_INFO, "Clearing out _connection, we're disconnected", buf, 2u);
    }

  }
  if (self->_connection)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_20D4BC000, v4, OS_LOG_TYPE_INFO, "Forcing a disconnect, terminating connection", v6, 2u);
      }

    }
    xpc_connection_cancel(self->_connection);
    connection = self->_connection;
    self->_connection = 0;

  }
}

- (BOOL)_connect
{
  OS_xpc_object *connection;
  NSObject *v4;
  OS_xpc_object *v5;
  OS_xpc_object *v6;
  OS_xpc_object *v7;
  _QWORD handler[5];
  uint8_t buf[16];

  connection = self->_connection;
  if (!connection)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D4BC000, v4, OS_LOG_TYPE_INFO, "Connecting to transcoder agent", buf, 2u);
      }

    }
    v5 = xpc_connection_create("com.apple.imtranscoding.IMTranscoderAgent", (dispatch_queue_t)self->_connectionQueue);
    v6 = self->_connection;
    self->_connection = v5;

    v7 = self->_connection;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = sub_20D4BDF40;
    handler[3] = &unk_24C719B90;
    handler[4] = self;
    xpc_connection_set_event_handler(v7, handler);
    xpc_connection_resume(self->_connection);
    connection = self->_connection;
  }
  return connection != 0;
}

- (void)_insertSandboxExtensionIntoXPCMessage:(id)a3 withKey:(id)a4 forFileURL:(id)a5 readOnly:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  int *v17;
  const __CFString *v18;
  int v19;
  uint8_t buf[4];
  const __CFString *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v6 = a6;
  v26 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = objc_retainAutorelease(a5);
  objc_msgSend(v11, "fileSystemRepresentation");
  v12 = sandbox_extension_issue_file();
  if (v12)
  {
    v13 = (void *)v12;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v12, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    v15 = objc_retainAutorelease(v14);
    objc_msgSend(v15, "UTF8String");
    IMInsertStringsToXPCDictionary();
    free(v13);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = __error();
      v18 = CFSTR("read-write");
      v19 = *v17;
      *(_DWORD *)buf = 138412802;
      if (v6)
        v18 = CFSTR("read");
      v21 = v18;
      v22 = 2112;
      v23 = v11;
      v24 = 1024;
      v25 = v19;
      _os_log_impl(&dword_20D4BC000, v16, OS_LOG_TYPE_INFO, "Could not generate sandbox %@ extension for path %@, errno %d", buf, 0x1Cu);
    }

  }
}

- (void)generateSafeRender:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  _BYTE v8[40];

  v6 = a4;
  v7 = a3;
  IMClientPreviewConstraints();
  -[IMTranscodeController generateSafeRender:constraints:completionBlock:](self, "generateSafeRender:constraints:completionBlock:", v7, v8, v6);

}

- (void)generateSafeRender:(id)a3 constraints:(IMPreviewConstraints *)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  __int128 v11;
  _OWORD v12[2];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LODWORD(v12[0]) = 138412290;
      *(_QWORD *)((char *)v12 + 4) = v8;
      _os_log_impl(&dword_20D4BC000, v10, OS_LOG_TYPE_INFO, "Generating safe render for file transfer: %@", (uint8_t *)v12, 0xCu);
    }

  }
  v11 = *(_OWORD *)&a4->var1.height;
  v12[0] = *(_OWORD *)&a4->var0;
  v12[1] = v11;
  v13 = *(_QWORD *)&a4->var3;
  -[IMTranscodeController _generateSafeRender:constraints:retries:completionBlock:](self, "_generateSafeRender:constraints:retries:completionBlock:", v8, v12, 0, v9);

}

- (void)_generateSafeRender:(id)a3 constraints:(IMPreviewConstraints *)a4 retries:(int)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  xpc_object_t v12;
  __int128 v13;
  void *v14;
  id v15;
  __int128 v16;
  void (**v17)(_QWORD, _QWORD);
  NSObject *v18;
  xpc_object_t v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  IMTranscodeController *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  int v28;
  uint8_t buf[16];
  __int128 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  if (-[IMTranscodeController _connect](self, "_connect"))
  {
    v12 = xpc_dictionary_create(0, 0, 0);
    IMInsertCodableObjectsToXPCDictionary();
    v13 = *(_OWORD *)&a4->var1.height;
    *(_OWORD *)buf = *(_OWORD *)&a4->var0;
    v30 = v13;
    v31 = *(_QWORD *)&a4->var3;
    IMPreviewConstraintsDictionaryFromConstraint();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    IMInsertDictionariesToXPCDictionary();

    IMInsertIntsToXPCDictionary();
    -[IMTranscodeController _insertSandboxExtensionIntoXPCMessage:withKey:forFileURL:readOnly:](self, "_insertSandboxExtensionIntoXPCMessage:withKey:forFileURL:readOnly:", v12, CFSTR("read-extension"), v10, 1, 1, 0);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = sub_20D4BE788;
    v21[3] = &unk_24C719BE0;
    v28 = a5;
    v15 = v10;
    v22 = v15;
    v23 = self;
    v16 = *(_OWORD *)&a4->var1.height;
    v25 = *(_OWORD *)&a4->var0;
    v26 = v16;
    v27 = *(_QWORD *)&a4->var3;
    v24 = v11;
    v17 = (void (**)(_QWORD, _QWORD))MEMORY[0x212BA1D84](v21);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v15;
        _os_log_impl(&dword_20D4BC000, v18, OS_LOG_TYPE_INFO, "sending request to GenerateSafeRender for %@", buf, 0xCu);
      }

    }
    v19 = xpc_connection_send_message_with_reply_sync(self->_connection, v12);
    ((void (**)(_QWORD, xpc_object_t))v17)[2](v17, v19);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D4BC000, v20, OS_LOG_TYPE_INFO, "Unable to connect to transcoding service when generating safe render", buf, 2u);
    }

  }
}

- (void)_transcodeFileTransferContents:(id)a3 utiType:(id)a4 isSticker:(BOOL)a5 allowUnfilteredUTIs:(id)a6 target:(int64_t)a7 sizes:(id)a8 commonCapabilities:(id)a9 maxDimension:(unint64_t)a10 transcoderUserInfo:(id)a11 representations:(int64_t)a12 fallBack:(BOOL)a13 retries:(int)a14 isLQMEnabled:(BOOL)a15 completionBlock:(id)a16
{
  id v19;
  id v20;
  id v21;
  void (**v22)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  char v32;
  id v33;
  xpc_object_t v34;
  id v35;
  id v36;
  void *v37;
  NSObject *v38;
  OS_xpc_object *connection;
  NSObject *v40;
  id v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  id v45;
  uint64_t v46;
  id v47;
  _BOOL4 v48;
  NSObject *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  _QWORD v57[4];
  id v58;
  IMTranscodeController *v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  void (**v66)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  int64_t v67;
  unint64_t v68;
  int64_t v69;
  int v70;
  BOOL v71;
  BOOL v72;
  BOOL v73;
  id v74;
  _QWORD v75[4];
  id v76;
  uint64_t *v77;
  uint64_t v78;
  os_activity_scope_state_s *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint8_t buf[4];
  id v85;
  __int16 v86;
  void *v87;
  uint64_t v88;

  v48 = a5;
  v88 = *MEMORY[0x24BDAC8D0];
  v19 = a3;
  v52 = a4;
  v54 = a6;
  v53 = a8;
  v55 = a9;
  v56 = a11;
  v20 = a16;
  v78 = 0;
  v79 = (os_activity_scope_state_s *)&v78;
  v80 = 0x3010000000;
  v82 = 0;
  v83 = 0;
  v81 = "";
  v51 = _os_activity_create(&dword_20D4BC000, "com.apple.messages.AttachmentTranscodeForSend", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v51, v79 + 2);
  v75[0] = MEMORY[0x24BDAC760];
  v75[1] = 3221225472;
  v75[2] = sub_20D4BF4C4;
  v75[3] = &unk_24C719C08;
  v77 = &v78;
  v21 = v20;
  v76 = v21;
  v22 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x212BA1D84](v75);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v85 = v19;
      _os_log_impl(&dword_20D4BC000, v23, OS_LOG_TYPE_INFO, "Transcoder received request to transcode %@", buf, 0xCu);
    }

  }
  if (v19)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lastPathComponent");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringByDeletingPathExtension");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "pathExtension");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringByAppendingPathExtension:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "im_randomTemporaryFileURLWithFileName:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v85 = v19;
      v86 = 2112;
      v87 = v29;
      _os_log_impl(&dword_20D4BC000, v30, OS_LOG_TYPE_INFO, "Attempting to copy current transfer URL %@ to new URL %@", buf, 0x16u);
    }

  }
  if (v19)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = 0;
    v32 = objc_msgSend(v31, "copyItemAtURL:toURL:error:", v19, v29, &v74);
    v33 = v74;

    if ((v32 & 1) != 0)
    {
      if (-[IMTranscodeController _connect](self, "_connect"))
      {
        v34 = xpc_dictionary_create(0, 0, 0);
        IMInsertCodableObjectsToXPCDictionary();
        objc_msgSend(v29, "path", v54, 0);
        v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v35, "UTF8String");
        v47 = objc_retainAutorelease(v52);
        objc_msgSend(v47, "UTF8String");
        IMInsertStringsToXPCDictionary();

        IMInsertIntsToXPCDictionary();
        IMInsertArraysToXPCDictionary();
        IMInsertDictionariesToXPCDictionary();
        IMInsertBoolsToXPCDictionary();
        IMInsertBoolsToXPCDictionary();
        IMInsertBoolsToXPCDictionary();
        if (objc_msgSend(v56, "count", v48, 0, a10, "target", a7, "message_type", 0, 0))
        {
          v45 = v56;
          v46 = 0;
          IMInsertDictionariesToXPCDictionary();
        }
        -[IMTranscodeController _insertSandboxExtensionIntoXPCMessage:withKey:forFileURL:readOnly:](self, "_insertSandboxExtensionIntoXPCMessage:withKey:forFileURL:readOnly:", v34, CFSTR("read-extension"), v29, 1, v45, v46);
        v57[0] = MEMORY[0x24BDAC760];
        v57[1] = 3221225472;
        v57[2] = sub_20D4BF590;
        v57[3] = &unk_24C719C58;
        v70 = a14;
        v36 = v19;
        v58 = v36;
        v59 = self;
        v60 = v47;
        v71 = v48;
        v61 = v54;
        v67 = a7;
        v62 = v53;
        v63 = v55;
        v68 = a10;
        v64 = v56;
        v69 = a12;
        v72 = a13;
        v73 = a15;
        v66 = v22;
        v65 = v29;
        v37 = (void *)MEMORY[0x212BA1D84](v57);
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v85 = v36;
            _os_log_impl(&dword_20D4BC000, v38, OS_LOG_TYPE_INFO, "sending request to TranscodeFile for %@", buf, 0xCu);
          }

        }
        connection = self->_connection;
        v40 = MEMORY[0x24BDAC9B8];
        v41 = MEMORY[0x24BDAC9B8];
        xpc_connection_send_message_with_reply(connection, v34, v40, v37);

      }
      else if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20D4BC000, v42, OS_LOG_TYPE_INFO, "Unable to connect to transcoding service", buf, 2u);
        }

      }
      goto LABEL_32;
    }
  }
  else
  {
    v33 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v85 = v33;
      _os_log_impl(&dword_20D4BC000, v43, OS_LOG_TYPE_INFO, "Linking failed with error %@, giving up since we're not guaranteed to get a file", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("__kIMTranscodeErrorDomain"), -2, 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, _QWORD, _QWORD, void *, _QWORD, uint64_t, _QWORD))v22)[2](v22, v19, 0, 0, v44, 0, 1, 0);

LABEL_32:
  _Block_object_dispose(&v78, 8);

}

- (void)transcodeFileTransferContents:(id)a3 utiType:(id)a4 isSticker:(BOOL)a5 allowUnfilteredUTIs:(id)a6 target:(int64_t)a7 sizes:(id)a8 commonCapabilities:(id)a9 maxDimension:(unint64_t)a10 transcoderUserInfo:(id)a11 representations:(int64_t)a12 isLQMEnabled:(BOOL)a13 completionBlock:(id)a14
{
  unsigned int v14;
  uint64_t v15;

  LOBYTE(v15) = a13;
  LOBYTE(v14) = 0;
  -[IMTranscodeController _transcodeFileTransferContents:utiType:isSticker:allowUnfilteredUTIs:target:sizes:commonCapabilities:maxDimension:transcoderUserInfo:representations:fallBack:retries:isLQMEnabled:completionBlock:](self, "_transcodeFileTransferContents:utiType:isSticker:allowUnfilteredUTIs:target:sizes:commonCapabilities:maxDimension:transcoderUserInfo:representations:fallBack:retries:isLQMEnabled:completionBlock:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, v14, v15, a14);
}

- (void)transcodeFallbackFileTransferContents:(id)a3 utiType:(id)a4 allowUnfilteredUTIs:(id)a5 target:(int64_t)a6 sizes:(id)a7 commonCapabilities:(id)a8 maxDimension:(unint64_t)a9 transcoderUserInfo:(id)a10 representations:(int64_t)a11 isLQMEnabled:(BOOL)a12 completionBlock:(id)a13
{
  unsigned int v13;
  uint64_t v14;

  LOBYTE(v14) = a12;
  LOBYTE(v13) = 1;
  -[IMTranscodeController _transcodeFileTransferContents:utiType:isSticker:allowUnfilteredUTIs:target:sizes:commonCapabilities:maxDimension:transcoderUserInfo:representations:fallBack:retries:isLQMEnabled:completionBlock:](self, "_transcodeFileTransferContents:utiType:isSticker:allowUnfilteredUTIs:target:sizes:commonCapabilities:maxDimension:transcoderUserInfo:representations:fallBack:retries:isLQMEnabled:completionBlock:", a3, a4, 0, a5, a6, a7, a8, a9, a10, a11, v13, v14, a13);
}

- (void)_transcodeFileTransferPayloadData:(id)a3 balloonBundleID:(id)a4 attachments:(id)a5 retries:(unint64_t)a6 fallBack:(BOOL)a7 completionBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  xpc_object_t v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  _QWORD v28[4];
  id v29;
  IMTranscodeController *v30;
  id v31;
  id v32;
  id v33;
  unint64_t v34;
  BOOL v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  if (v14 && v15)
  {
    if (-[IMTranscodeController _connect](self, "_connect"))
    {
      v18 = xpc_dictionary_create(0, 0, 0);
      IMInsertDatasToXPCDictionary();
      IMInsertArraysToXPCDictionary();
      v19 = objc_retainAutorelease(v15);
      objc_msgSend(v19, "UTF8String", v16, 0);
      IMInsertStringsToXPCDictionary();
      IMInsertBoolsToXPCDictionary();
      IMInsertIntsToXPCDictionary();
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = sub_20D4C0478;
      v28[3] = &unk_24C719CA8;
      v34 = a6;
      v20 = v19;
      v29 = v20;
      v30 = self;
      v21 = v14;
      v31 = v21;
      v32 = v16;
      v35 = a7;
      v33 = v17;
      v22 = (void *)MEMORY[0x212BA1D84](v28);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v24 = objc_msgSend(v21, "length", 0, 0);
          *(_DWORD *)buf = 138412546;
          v37 = (uint64_t)v20;
          v38 = 2048;
          v39 = v24;
          _os_log_impl(&dword_20D4BC000, v23, OS_LOG_TYPE_INFO, "sending request to TranscodePayloadData for %@, data length: %lu", buf, 0x16u);
        }

      }
      xpc_connection_send_message_with_reply(self->_connection, v18, MEMORY[0x24BDAC9B8], v22);

    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D4BC000, v27, OS_LOG_TYPE_INFO, "Unable to connect to transcoding service", buf, 2u);
      }

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218242;
        v37 = objc_msgSend(v14, "length");
        v38 = 2112;
        v39 = (uint64_t)v15;
        _os_log_impl(&dword_20D4BC000, v25, OS_LOG_TYPE_INFO, "request error in TranscodingPayloadData: nil data (len=%lu) or balloonBundleID %@", buf, 0x16u);
      }

    }
    if (v17)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("__kIMTranscodeErrorDomain"), -2, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *, _QWORD, _QWORD))v17 + 2))(v17, 0, 0, v26, 0, 0);

    }
  }

}

- (void)transcodeFallbackFileTransferPayloadData:(id)a3 balloonBundleID:(id)a4 attachments:(id)a5 completionBlock:(id)a6
{
  MEMORY[0x24BEDD108](self, sel__transcodeFileTransferPayloadData_balloonBundleID_attachments_retries_fallBack_completionBlock_);
}

- (void)transcodeLocalTransferPayloadData:(id)a3 balloonBundleID:(id)a4 completionBlock:(id)a5
{
  MEMORY[0x24BEDD108](self, sel__transcodeFileTransferPayloadData_balloonBundleID_attachments_retries_fallBack_completionBlock_);
}

- (void)generateSnapshotForMessageGUID:(id)a3 payloadURL:(id)a4 balloonBundleID:(id)a5 senderContext:(id)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  xpc_object_t v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v13 && v14)
  {
    if (-[IMTranscodeController _connect](self, "_connect"))
    {
      v17 = xpc_dictionary_create(0, 0, 0);
      v25 = objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
      IMInsertStringsToXPCDictionary();
      objc_msgSend(v13, "absoluteString", v25, 0);
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v26 = objc_msgSend(v18, "UTF8String");
      IMInsertStringsToXPCDictionary();

      objc_msgSend(objc_retainAutorelease(v14), "UTF8String", v26, 0);
      IMInsertStringsToXPCDictionary();
      IMInsertKeyedCodableObjectsToXPCDictionary();
      IMInsertIntsToXPCDictionary();
      -[IMTranscodeController _insertSandboxExtensionIntoXPCMessage:withKey:forFileURL:readOnly:](self, "_insertSandboxExtensionIntoXPCMessage:withKey:forFileURL:readOnly:", v17, CFSTR("read-extension"), v13, 1, 2, 0);
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = sub_20D4C0FF0;
      v27[3] = &unk_24C719CD0;
      v19 = v13;
      v28 = v19;
      v29 = v16;
      v20 = (void *)MEMORY[0x212BA1D84](v27);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v31 = v19;
          _os_log_impl(&dword_20D4BC000, v21, OS_LOG_TYPE_INFO, "sending request to GenerateSnapshot for %@", buf, 0xCu);
        }

      }
      xpc_connection_send_message_with_reply(self->_connection, v17, MEMORY[0x24BDAC9B8], v20);

    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D4BC000, v24, OS_LOG_TYPE_INFO, "Unable to connect to transcoding service", buf, 2u);
      }

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v31 = v13;
        v32 = 2112;
        v33 = v14;
        _os_log_impl(&dword_20D4BC000, v22, OS_LOG_TYPE_INFO, "request error in GenerateSnapshot, nil payloadURL %@ or balloonBundleID %@", buf, 0x16u);
      }

    }
    if (v16)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("__kIMTranscodeErrorDomain"), -2, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v16 + 2))(v16, 0, v23);

    }
  }

}

- (void)generatePreview:(id)a3 previewURL:(id)a4 senderContext:(id)a5 constraints:(IMPreviewConstraints *)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  _OWORD v27[2];
  uint64_t v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    v16 = *(_OWORD *)&a6->var1.height;
    v27[0] = *(_OWORD *)&a6->var0;
    v27[1] = v16;
    v28 = *(_QWORD *)&a6->var3;
    LOBYTE(v18) = 0;
    -[IMTranscodeController _generatePreview:previewURL:senderContext:constraints:retries:balloonBundleID:completionBlock:blockUntilReply:](self, "_generatePreview:previewURL:senderContext:constraints:retries:balloonBundleID:completionBlock:blockUntilReply:", v12, v13, v14, v27, 0, 0, v15, v18);
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_20D4C14B4;
    block[3] = &unk_24C719CF8;
    block[4] = self;
    v20 = v12;
    v21 = v13;
    v22 = v14;
    v17 = *(_OWORD *)&a6->var1.height;
    v24 = *(_OWORD *)&a6->var0;
    v25 = v17;
    v26 = *(_QWORD *)&a6->var3;
    v23 = v15;
    dispatch_sync(MEMORY[0x24BDAC9B8], block);

  }
}

- (void)generatePreview:(id)a3 previewURL:(id)a4 senderContext:(id)a5 constraints:(IMPreviewConstraints *)a6 balloonBundleID:(id)a7 completionBlock:(id)a8 blockUntilReply:(BOOL)a9
{
  __int128 v9;
  uint64_t v10;
  _OWORD v11[2];
  uint64_t v12;

  v9 = *(_OWORD *)&a6->var1.height;
  v11[0] = *(_OWORD *)&a6->var0;
  v11[1] = v9;
  v12 = *(_QWORD *)&a6->var3;
  LOBYTE(v10) = a9;
  -[IMTranscodeController _generatePreview:previewURL:senderContext:constraints:retries:balloonBundleID:completionBlock:blockUntilReply:](self, "_generatePreview:previewURL:senderContext:constraints:retries:balloonBundleID:completionBlock:blockUntilReply:", a3, a4, a5, v11, 0, a7, a8, v10);
}

- (void)generatePreview:(id)a3 previewURL:(id)a4 senderContext:(id)a5 constraints:(IMPreviewConstraints *)a6 completionBlock:(id)a7 blockUntilReply:(BOOL)a8
{
  __int128 v8;
  uint64_t v9;
  _OWORD v10[2];
  uint64_t v11;

  v8 = *(_OWORD *)&a6->var1.height;
  v10[0] = *(_OWORD *)&a6->var0;
  v10[1] = v8;
  v11 = *(_QWORD *)&a6->var3;
  LOBYTE(v9) = a8;
  -[IMTranscodeController _generatePreview:previewURL:senderContext:constraints:retries:balloonBundleID:completionBlock:blockUntilReply:](self, "_generatePreview:previewURL:senderContext:constraints:retries:balloonBundleID:completionBlock:blockUntilReply:", a3, a4, a5, v10, 0, 0, a7, v9);
}

- (void)_generatePreview:(id)a3 previewURL:(id)a4 senderContext:(id)a5 constraints:(IMPreviewConstraints *)a6 retries:(unint64_t)a7 balloonBundleID:(id)a8 completionBlock:(id)a9 blockUntilReply:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  xpc_object_t v20;
  id v21;
  id v22;
  __int128 v23;
  id v24;
  __int128 v25;
  void (**v26)(_QWORD, _QWORD);
  NSObject *v27;
  OS_xpc_object *connection;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  IMTranscodeController *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  unint64_t v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  BOOL v49;
  _BYTE buf[32];
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a4;
  v37 = a5;
  v18 = a8;
  v19 = a9;
  if (v16 && v17)
  {
    if (-[IMTranscodeController _connect](self, "_connect"))
    {
      v20 = xpc_dictionary_create(0, 0, 0);
      IMInsertIntsToXPCDictionary();
      objc_msgSend(v16, "absoluteString", 3, 0);
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v33 = objc_msgSend(v21, "UTF8String");
      IMInsertStringsToXPCDictionary();

      objc_msgSend(v17, "absoluteString", v33, 0);
      v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v34 = objc_msgSend(v22, "UTF8String");
      IMInsertStringsToXPCDictionary();

      if (v18)
      {
        objc_msgSend(objc_retainAutorelease(v18), "UTF8String", v34, 0);
        IMInsertStringsToXPCDictionary();
      }
      IMInsertKeyedCodableObjectsToXPCDictionary();
      -[IMTranscodeController _insertSandboxExtensionIntoXPCMessage:withKey:forFileURL:readOnly:](self, "_insertSandboxExtensionIntoXPCMessage:withKey:forFileURL:readOnly:", v20, CFSTR("read-extension"), v16, 1, v37, 0);
      IMCachesDirectoryURL();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMTranscodeController _insertSandboxExtensionIntoXPCMessage:withKey:forFileURL:readOnly:](self, "_insertSandboxExtensionIntoXPCMessage:withKey:forFileURL:readOnly:", v20, CFSTR("write-extension"), v36, 0);
      v23 = *(_OWORD *)&a6->var1.height;
      *(_OWORD *)buf = *(_OWORD *)&a6->var0;
      *(_OWORD *)&buf[16] = v23;
      v51 = *(_QWORD *)&a6->var3;
      IMPreviewConstraintsDictionaryFromConstraint();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      IMInsertDictionariesToXPCDictionary();
      v38[0] = MEMORY[0x24BDAC760];
      v38[1] = 3221225472;
      v38[2] = sub_20D4C1A8C;
      v38[3] = &unk_24C719D20;
      v45 = a7;
      v24 = v16;
      v39 = v24;
      v40 = self;
      v41 = v17;
      v42 = v37;
      v25 = *(_OWORD *)&a6->var1.height;
      v46 = *(_OWORD *)&a6->var0;
      v47 = v25;
      v48 = *(_QWORD *)&a6->var3;
      v43 = v18;
      v44 = v19;
      v49 = a10;
      v26 = (void (**)(_QWORD, _QWORD))MEMORY[0x212BA1D84](v38);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v24;
          _os_log_impl(&dword_20D4BC000, v27, OS_LOG_TYPE_INFO, "sending request to GeneratePreview for %@", buf, 0xCu);
        }

      }
      connection = self->_connection;
      if (a10)
      {
        v29 = xpc_connection_send_message_with_reply_sync(self->_connection, v20);
        ((void (**)(_QWORD, NSObject *))v26)[2](v26, v29);
      }
      else
      {
        dispatch_get_global_queue(0, 0);
        v29 = objc_claimAutoreleasedReturnValue();
        xpc_connection_send_message_with_reply(connection, v20, v29, v26);
      }

    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D4BC000, v32, OS_LOG_TYPE_INFO, "Unable to connect to transcoding service", buf, 2u);
      }

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v16;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v17;
        _os_log_impl(&dword_20D4BC000, v30, OS_LOG_TYPE_INFO, "request error in GeneratePreview, nil sourceURL %@ or previewURL %@", buf, 0x16u);
      }

    }
    if (v19)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("__kIMTranscodeErrorDomain"), -2, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *, double, double))v19 + 2))(v19, 0, v31, 0.0, 0.0);

    }
  }

}

- (void)generateMetadata:(id)a3 metadataURL:(id)a4 senderContext:(id)a5 constraints:(IMPreviewConstraints *)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  _OWORD v27[2];
  uint64_t v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    v16 = *(_OWORD *)&a6->var1.height;
    v27[0] = *(_OWORD *)&a6->var0;
    v27[1] = v16;
    v28 = *(_QWORD *)&a6->var3;
    LOBYTE(v18) = 0;
    -[IMTranscodeController _generateMetadata:metadataURL:senderContext:constraints:retries:completionBlock:blockUntilReply:](self, "_generateMetadata:metadataURL:senderContext:constraints:retries:completionBlock:blockUntilReply:", v12, v13, v14, v27, 0, v15, v18);
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_20D4C214C;
    block[3] = &unk_24C719CF8;
    block[4] = self;
    v20 = v12;
    v21 = v13;
    v22 = v14;
    v17 = *(_OWORD *)&a6->var1.height;
    v24 = *(_OWORD *)&a6->var0;
    v25 = v17;
    v26 = *(_QWORD *)&a6->var3;
    v23 = v15;
    dispatch_sync(MEMORY[0x24BDAC9B8], block);

  }
}

- (void)generateMetadata:(id)a3 metadataURL:(id)a4 senderContext:(id)a5 constraints:(IMPreviewConstraints *)a6 completionBlock:(id)a7 blockUntilReply:(BOOL)a8
{
  __int128 v8;
  uint64_t v9;
  _OWORD v10[2];
  uint64_t v11;

  v8 = *(_OWORD *)&a6->var1.height;
  v10[0] = *(_OWORD *)&a6->var0;
  v10[1] = v8;
  v11 = *(_QWORD *)&a6->var3;
  LOBYTE(v9) = a8;
  -[IMTranscodeController _generateMetadata:metadataURL:senderContext:constraints:retries:completionBlock:blockUntilReply:](self, "_generateMetadata:metadataURL:senderContext:constraints:retries:completionBlock:blockUntilReply:", a3, a4, a5, v10, 0, a7, v9);
}

- (void)_generateMetadata:(id)a3 metadataURL:(id)a4 senderContext:(id)a5 constraints:(IMPreviewConstraints *)a6 retries:(unint64_t)a7 completionBlock:(id)a8 blockUntilReply:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  xpc_object_t v19;
  id v20;
  id v21;
  __int128 v22;
  id v23;
  __int128 v24;
  void (**v25)(_QWORD, _QWORD);
  NSObject *v26;
  OS_xpc_object *connection;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  IMTranscodeController *v37;
  id v38;
  id v39;
  id v40;
  unint64_t v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  BOOL v45;
  _BYTE buf[32];
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a8;
  if (v15 && v16)
  {
    if (-[IMTranscodeController _connect](self, "_connect"))
    {
      v19 = xpc_dictionary_create(0, 0, 0);
      IMInsertIntsToXPCDictionary();
      objc_msgSend(v15, "absoluteString", 6, 0);
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v32 = objc_msgSend(v20, "UTF8String");
      IMInsertStringsToXPCDictionary();

      objc_msgSend(v16, "absoluteString", v32, 0);
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v21, "UTF8String");
      IMInsertStringsToXPCDictionary();

      IMInsertKeyedCodableObjectsToXPCDictionary();
      -[IMTranscodeController _insertSandboxExtensionIntoXPCMessage:withKey:forFileURL:readOnly:](self, "_insertSandboxExtensionIntoXPCMessage:withKey:forFileURL:readOnly:", v19, CFSTR("read-extension"), v15, 1, v17, 0);
      IMCachesDirectoryURL();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMTranscodeController _insertSandboxExtensionIntoXPCMessage:withKey:forFileURL:readOnly:](self, "_insertSandboxExtensionIntoXPCMessage:withKey:forFileURL:readOnly:", v19, CFSTR("write-extension"), v34, 0);
      v22 = *(_OWORD *)&a6->var1.height;
      *(_OWORD *)buf = *(_OWORD *)&a6->var0;
      *(_OWORD *)&buf[16] = v22;
      v47 = *(_QWORD *)&a6->var3;
      IMPreviewConstraintsDictionaryFromConstraint();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      IMInsertDictionariesToXPCDictionary();
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = sub_20D4C2680;
      v35[3] = &unk_24C719D70;
      v41 = a7;
      v23 = v15;
      v36 = v23;
      v37 = self;
      v38 = v16;
      v39 = v17;
      v24 = *(_OWORD *)&a6->var1.height;
      v42 = *(_OWORD *)&a6->var0;
      v43 = v24;
      v44 = *(_QWORD *)&a6->var3;
      v40 = v18;
      v45 = a9;
      v25 = (void (**)(_QWORD, _QWORD))MEMORY[0x212BA1D84](v35);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v23;
          _os_log_impl(&dword_20D4BC000, v26, OS_LOG_TYPE_INFO, "sending request to GenerateMetadata for %@", buf, 0xCu);
        }

      }
      connection = self->_connection;
      if (a9)
      {
        v28 = xpc_connection_send_message_with_reply_sync(self->_connection, v19);
        ((void (**)(_QWORD, NSObject *))v25)[2](v25, v28);
      }
      else
      {
        dispatch_get_global_queue(0, 0);
        v28 = objc_claimAutoreleasedReturnValue();
        xpc_connection_send_message_with_reply(connection, v19, v28, v25);
      }

    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D4BC000, v31, OS_LOG_TYPE_INFO, "Unable to connect to transcoding service", buf, 2u);
      }

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v15;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v16;
        _os_log_impl(&dword_20D4BC000, v29, OS_LOG_TYPE_INFO, "request error in GenerateMetadata, nil sourceURL %@ or destinationURL %@", buf, 0x16u);
      }

    }
    if (v18)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("__kIMTranscodeErrorDomain"), -2, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *, double, double))v18 + 2))(v18, 0, v30, 0.0, 0.0);

    }
  }

}

- (void)decodeiMessageAppPayload:(id)a3 senderContext:(id)a4 bundleID:(id)a5 completionBlock:(id)a6 blockUntilReply:(BOOL)a7
{
  MEMORY[0x24BEDD108](self, sel__decodeiMessageAppPayload_senderContext_bundleID_retries_completionBlock_blockUntilReply_);
}

- (void)_decodeiMessageAppPayload:(id)a3 senderContext:(id)a4 bundleID:(id)a5 retries:(unint64_t)a6 completionBlock:(id)a7 blockUntilReply:(BOOL)a8
{
  _BOOL4 v8;
  id v14;
  id v15;
  id v16;
  xpc_object_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void (**v22)(_QWORD, _QWORD);
  NSObject *v23;
  OS_xpc_object *connection;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  IMTranscodeController *v34;
  id v35;
  id v36;
  unint64_t v37;
  BOOL v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v8 = a8;
  v43 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v30 = a4;
  v15 = a5;
  v16 = a7;
  if (v14 && v15)
  {
    if (-[IMTranscodeController _connect](self, "_connect"))
    {
      v17 = xpc_dictionary_create(0, 0, 0);
      IMInsertIntsToXPCDictionary();
      objc_msgSend(v14, "absoluteString", 5, 0);
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v29 = objc_msgSend(v18, "UTF8String");
      IMInsertStringsToXPCDictionary();

      v19 = objc_retainAutorelease(v15);
      objc_msgSend(v19, "UTF8String", v29, 0);
      IMInsertStringsToXPCDictionary();
      IMInsertKeyedCodableObjectsToXPCDictionary();
      -[IMTranscodeController _insertSandboxExtensionIntoXPCMessage:withKey:forFileURL:readOnly:](self, "_insertSandboxExtensionIntoXPCMessage:withKey:forFileURL:readOnly:", v17, CFSTR("read-extension"), v14, 1, v30, 0);
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = sub_20D4C3120;
      v31[3] = &unk_24C719CA8;
      v37 = a6;
      v20 = v14;
      v32 = v20;
      v21 = v19;
      v33 = v21;
      v34 = self;
      v35 = v30;
      v36 = v16;
      v38 = v8;
      v22 = (void (**)(_QWORD, _QWORD))MEMORY[0x212BA1D84](v31);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v40 = v20;
          v41 = 2112;
          v42 = v21;
          _os_log_impl(&dword_20D4BC000, v23, OS_LOG_TYPE_INFO, "sending request to DecodeiMessageAppPayload for %@ bundleID %@", buf, 0x16u);
        }

      }
      connection = self->_connection;
      if (v8)
      {
        v25 = xpc_connection_send_message_with_reply_sync(connection, v17);
        ((void (**)(_QWORD, NSObject *))v22)[2](v22, v25);
      }
      else
      {
        dispatch_get_global_queue(0, 0);
        v25 = objc_claimAutoreleasedReturnValue();
        xpc_connection_send_message_with_reply(connection, v17, v25, v22);
      }

    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D4BC000, v28, OS_LOG_TYPE_INFO, "Unable to connect to transcoding service", buf, 2u);
      }

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v40 = v14;
        v41 = 2112;
        v42 = v15;
        _os_log_impl(&dword_20D4BC000, v26, OS_LOG_TYPE_INFO, "request error in DecodeiMessageAppPayload: nil sourceURL %@ or bundleID %@", buf, 0x16u);
      }

    }
    if (v16)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("__kIMTranscodeErrorDomain"), -2, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v16 + 2))(v16, 0, 0, 0, v27);

    }
  }

}

- (void)transcribeAudioForAudioTransferURL:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  xpc_object_t v8;
  id v9;
  void *v10;
  OS_xpc_object *connection;
  NSObject *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (-[IMTranscodeController _connect](self, "_connect"))
  {
    v8 = xpc_dictionary_create(0, 0, 0);
    IMInsertIntsToXPCDictionary();
    objc_msgSend(v6, "absoluteString", 7, 0);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = objc_msgSend(v9, "UTF8String");
    IMInsertStringsToXPCDictionary();

    -[IMTranscodeController _insertSandboxExtensionIntoXPCMessage:withKey:forFileURL:readOnly:](self, "_insertSandboxExtensionIntoXPCMessage:withKey:forFileURL:readOnly:", v8, CFSTR("read-extension"), v6, 1, v13, 0);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = sub_20D4C38C0;
    v14[3] = &unk_24C719CD0;
    v15 = v6;
    v16 = v7;
    v10 = (void *)MEMORY[0x212BA1D84](v14);
    connection = self->_connection;
    im_primary_queue();
    v12 = objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message_with_reply(connection, v8, v12, v10);

  }
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)setConnectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_connectionQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
