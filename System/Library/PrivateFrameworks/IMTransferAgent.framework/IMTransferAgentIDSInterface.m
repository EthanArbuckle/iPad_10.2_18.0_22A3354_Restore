@implementation IMTransferAgentIDSInterface

+ (id)sharedInstance
{
  if (qword_2540D93A8 != -1)
    dispatch_once(&qword_2540D93A8, &unk_24F979E20);
  return (id)qword_2540D93D0;
}

- (IMTransferAgentIDSInterface)init
{
  IMTransferAgentIDSInterface *v2;
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  IDSService *idsService;
  IDSService *v8;
  void *v9;
  uint8_t v11[16];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)IMTransferAgentIDSInterface;
  v2 = -[IMTransferAgentIDSInterface init](&v12, sel_init);
  if (v2)
  {
    IMSetEmbeddedTempDirectory();
    v3 = objc_alloc_init(MEMORY[0x24BDD1580]);
    NSTemporaryDirectory();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "changeCurrentDirectoryPath:", v4);

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_22D97D000, v5, OS_LOG_TYPE_INFO, "IMTransfer Agent IDS Interface starting", v11, 2u);
      }

    }
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BE4FCB8]), "initWithService:", CFSTR("com.apple.private.alloy.idstransfers"));
    idsService = v2->_idsService;
    v2->_idsService = (IDSService *)v6;

    v8 = v2->_idsService;
    im_primary_queue();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IDSService addDelegate:queue:](v8, "addDelegate:queue:", v2, v9);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[IDSService removeDelegate:](self->_idsService, "removeDelegate:", self);
  v3.receiver = self;
  v3.super_class = (Class)IMTransferAgentIDSInterface;
  -[IMTransferAgentIDSInterface dealloc](&v3, sel_dealloc);
}

- (BOOL)isLocalDevicePresent
{
  return 1;
}

- (void)remoteUploadFileRequest:(id)a3 topic:(id)a4 transferID:(id)a5 sourceAppID:(id)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *uniqueIDToTransferCompletionBlockMap;
  NSMutableDictionary *v20;
  NSMutableDictionary *uniqueIDToFilePathMap;
  NSMutableDictionary *v22;
  void *v23;
  int v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v24 = 138412546;
      v25 = v12;
      v26 = 2112;
      v27 = v15;
      _os_log_impl(&dword_22D97D000, v17, OS_LOG_TYPE_INFO, "Received Request to Remote Upload an Attachment at %@ sourceApp %@", (uint8_t *)&v24, 0x16u);
    }

  }
  im_assert_primary_queue();
  if (!v14)
  {
    StringGUID();
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!self->_uniqueIDToTransferCompletionBlockMap)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    uniqueIDToTransferCompletionBlockMap = self->_uniqueIDToTransferCompletionBlockMap;
    self->_uniqueIDToTransferCompletionBlockMap = Mutable;

  }
  if (!self->_uniqueIDToFilePathMap)
  {
    v20 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    uniqueIDToFilePathMap = self->_uniqueIDToFilePathMap;
    self->_uniqueIDToFilePathMap = v20;

  }
  v22 = self->_uniqueIDToTransferCompletionBlockMap;
  v23 = (void *)MEMORY[0x22E31D724](v16);
  -[NSMutableDictionary setObject:forKey:](v22, "setObject:forKey:", v23, v14);

  -[NSMutableDictionary setObject:forKey:](self->_uniqueIDToFilePathMap, "setObject:forKey:", v12, v14);
  -[IMTransferAgentIDSInterface _sendUploadRequest:topic:transferID:sourceAppID:allowReauthorize:](self, "_sendUploadRequest:topic:transferID:sourceAppID:allowReauthorize:", v12, v13, v14, v15, 0);

}

- (void)incrementTransferCount
{
  NSObject *v3;
  int numTransfers;
  int totalTransfers;
  _DWORD v6[2];
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  im_assert_primary_queue();
  *(int32x2_t *)&self->_numTransfers = vadd_s32(*(int32x2_t *)&self->_numTransfers, (int32x2_t)0x100000001);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      numTransfers = self->_numTransfers;
      totalTransfers = self->_totalTransfers;
      v6[0] = 67109376;
      v6[1] = numTransfers;
      v7 = 1024;
      v8 = totalTransfers;
      _os_log_impl(&dword_22D97D000, v3, OS_LOG_TYPE_INFO, "(Incremented) Transfer Count is now %d, total at %d", (uint8_t *)v6, 0xEu);
    }

  }
}

- (void)decrementTransferCount
{
  NSObject *v3;
  int numTransfers;
  NSObject *v5;
  uint8_t buf[4];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  im_assert_primary_queue();
  --self->_numTransfers;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      numTransfers = self->_numTransfers;
      *(_DWORD *)buf = 67109120;
      v7 = numTransfers;
      _os_log_impl(&dword_22D97D000, v3, OS_LOG_TYPE_INFO, "(Decremented) Transfer Count is now %d", buf, 8u);
    }

  }
  if (self->_numTransfers <= 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D97D000, v5, OS_LOG_TYPE_INFO, "We Have No More Transfers Remaining, We will shut down in 1 hour", buf, 2u);
      }

    }
    im_dispatch_after_primary_queue();
  }
}

- (void)_sendUploadRequest:(id)a3 topic:(id)a4 transferID:(id)a5 sourceAppID:(id)a6 allowReauthorize:(BOOL)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  __CFDictionary *v16;
  id v17;
  id v18;
  id v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  im_assert_primary_queue();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  v17 = v15;
  if (v17)
  {
    CFDictionarySetValue(v16, (const void *)qword_255DA8CA8, v17);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22D994CF8();
  }

  v18 = v12;
  if (v18)
  {
    CFDictionarySetValue(v16, (const void *)qword_255DA8CB8, v18);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22D994C7C();
  }

  v19 = v13;
  if (v19)
  {
    CFDictionarySetValue(v16, (const void *)qword_255DA8CC0, v19);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22D994C00();
  }

  CFDictionarySetValue(v16, (const void *)qword_255DA8CA0, &unk_24F97D390);
  if (v14)
    CFDictionarySetValue(v16, (const void *)qword_255DA8CC8, v14);
  -[IMTransferAgentIDSInterface _sendIDSMessage:topic:localPath:](self, "_sendIDSMessage:topic:localPath:", v16, v18, v11);

}

- (void)_sendUploadResponse:(id)a3 topic:(id)a4 success:(BOOL)a5 error:(id)a6 ownerID:(id)a7 signature:(id)a8 requestURLString:(id)a9 transferID:(id)a10
{
  _BOOL8 v12;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  __CFDictionary *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v12 = a5;
  v15 = a3;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v19 = a10;
  v20 = a4;
  im_assert_primary_queue();
  v21 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  v22 = v15;
  if (v22)
  {
    CFDictionarySetValue(v21, (const void *)qword_255DA8CD8, v22);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22D994F64();
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    CFDictionarySetValue(v21, (const void *)qword_255DA8CE0, v23);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22D994EE8();
  }

  v24 = v16;
  if (v24)
  {
    CFDictionarySetValue(v21, (const void *)qword_255DA8CF0, v24);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22D994E6C();
  }

  v25 = v17;
  if (v25)
  {
    CFDictionarySetValue(v21, (const void *)qword_255DA8CF8, v25);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22D994DF0();
  }

  v26 = v18;
  if (v26)
  {
    CFDictionarySetValue(v21, (const void *)qword_255DA8D00, v26);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22D994D74();
  }

  v27 = v19;
  if (v27)
  {
    CFDictionarySetValue(v21, (const void *)qword_255DA8CC0, v27);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    sub_22D994C00();
  }

  CFDictionarySetValue(v21, (const void *)qword_255DA8CA0, &unk_24F97D3A8);
  -[IMTransferAgentIDSInterface _sendIDSMessage:topic:localPath:](self, "_sendIDSMessage:topic:localPath:", v21, v20, v22);

  -[IMTransferAgentIDSInterface decrementTransferCount](self, "decrementTransferCount");
}

- (void)_handleUploadRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D97D000, v5, OS_LOG_TYPE_INFO, "RECEIVED Remote Attachment IDS Message", buf, 2u);
    }

  }
  im_assert_primary_queue();
  -[IMTransferAgentIDSInterface incrementTransferCount](self, "incrementTransferCount");
  objc_msgSend(v4, "_dataForKey:", qword_255DA8CA8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_stringForKey:", qword_255DA8CD0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_stringForKey:", qword_255DA8CB8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_stringForKey:", qword_255DA8CC0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_stringForKey:", qword_255DA8CC8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "im_randomTemporaryFileURLWithFileName:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "writeToFile:atomically:", v13, 1);
    +[IMTransferAgentController sharedInstance](IMTransferAgentController, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = sub_22D97F684;
    v15[3] = &unk_24F979F50;
    v15[4] = self;
    v16 = v8;
    v17 = v9;
    objc_msgSend(v14, "sendFilePath:encrypt:topic:transferID:sourceAppID:userInfo:progressBlock:completionBlock:", v13, 0, v16, v17, v10, 0, 0, v15);

  }
}

- (void)_handleUploadResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  NSMutableDictionary *uniqueIDToTransferCompletionBlockMap;
  NSMutableDictionary *uniqueIDToFilePathMap;
  void (**v27)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v28;
  uint8_t v29[16];
  uint8_t buf[16];

  v4 = a3;
  im_assert_primary_queue();
  objc_msgSend(v4, "_stringForKey:", qword_255DA8CC0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", qword_255DA8CE0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v4, "_stringForKey:", qword_255DA8CF0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", qword_255DA8CF8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_stringForKey:", qword_255DA8D00);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_uniqueIDToTransferCompletionBlockMap, "objectForKey:", v5);
  v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_uniqueIDToFilePathMap, "objectForKey:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = IMOSLoggingEnabled();
  if (v11)
  {
    if (v13)
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D97D000, v14, OS_LOG_TYPE_INFO, " Found completion block for attachment", buf, 2u);
      }

    }
    if (v12)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "attributesOfItemAtPath:error:", v12, 0);
      v27 = v11;
      v28 = v5;
      v16 = v12;
      v17 = v10;
      v18 = v9;
      v19 = v8;
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x24BDD0D08]);
      v21 = v7;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "unsignedIntegerValue");

      v7 = v21;
      v8 = v19;
      v9 = v18;
      v10 = v17;
      v12 = v16;
      v11 = v27;
      v5 = v28;
    }
    else
    {
      v23 = 0;
    }
    ((void (**)(_QWORD, uint64_t, void *, uint64_t, void *, void *, void *, _QWORD, _QWORD))v11)[2](v11, v7, v12, v23, v8, v9, v10, 0, 0);
    -[NSMutableDictionary removeObjectForKey:](self->_uniqueIDToTransferCompletionBlockMap, "removeObjectForKey:", v5);
    -[NSMutableDictionary removeObjectForKey:](self->_uniqueIDToFilePathMap, "removeObjectForKey:", v5);
  }
  else if (v13)
  {
    OSLogHandleForIMFoundationCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_22D97D000, v24, OS_LOG_TYPE_INFO, " No completion block for attachment found", v29, 2u);
    }

  }
  if (!-[NSMutableDictionary count](self->_uniqueIDToTransferCompletionBlockMap, "count"))
  {
    uniqueIDToTransferCompletionBlockMap = self->_uniqueIDToTransferCompletionBlockMap;
    self->_uniqueIDToTransferCompletionBlockMap = 0;

  }
  if (!-[NSMutableDictionary count](self->_uniqueIDToFilePathMap, "count"))
  {
    uniqueIDToFilePathMap = self->_uniqueIDToFilePathMap;
    self->_uniqueIDToFilePathMap = 0;

  }
}

- (BOOL)_sendIDSMessage:(id)a3 topic:(id)a4 localPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  IDSService *idsService;
  void *v15;
  int v16;
  id v17;
  id v18;
  NSObject *v19;
  const __CFString *v20;
  void *v21;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  const __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v8;
      _os_log_impl(&dword_22D97D000, v11, OS_LOG_TYPE_INFO, " SENDING Remote Attachment IDS Message with content %@", buf, 0xCu);
    }

  }
  im_assert_primary_queue();
  JWEncodeDictionary();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "_CUTCopyGzippedData");
  idsService = self->_idsService;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *MEMORY[0x24BE4F9C8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = 0;
  v16 = -[IDSService sendData:toDestinations:priority:options:identifier:error:](idsService, "sendData:toDestinations:priority:options:identifier:error:", v13, v15, 300, 0, &v24, &v23);
  v17 = v24;
  v18 = v23;

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = CFSTR("NO");
      *(_DWORD *)buf = 138413058;
      v26 = v17;
      if (v16)
        v20 = CFSTR("YES");
      v27 = 2112;
      v28 = v18;
      v29 = 2112;
      v30 = v8;
      v31 = 2112;
      v32 = v20;
      _os_log_impl(&dword_22D97D000, v19, OS_LOG_TYPE_INFO, "Sending message to local account (identifier %@)  (error %@)  (messageDict %@) success: %@", buf, 0x2Au);
    }

  }
  if (v16 && IMTransferRequestIsForMessages(v9, v10))
  {
    objc_msgSend(v10, "lastPathComponent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    IMGreenTeaAttachmentTransmitLoggingFormat();

  }
  return v16;
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  int v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v23 = 138413314;
      v24 = v12;
      v25 = 2112;
      v26 = v13;
      v27 = 2112;
      v28 = v14;
      v29 = 2112;
      v30 = v15;
      v31 = 2112;
      v32 = v16;
      _os_log_impl(&dword_22D97D000, v17, OS_LOG_TYPE_INFO, "incomingData on service %@, account %@ data %@ fromID %@ context %@", (uint8_t *)&v23, 0x34u);
    }

  }
  im_assert_primary_queue();
  objc_msgSend(v14, "_CUTOptionallyDecompressData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  JWDecodeDictionary();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKey:", qword_255DA8CA0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "unsignedIntValue");

  if (v21 == 2)
  {
    -[IMTransferAgentIDSInterface _handleUploadResponse:](self, "_handleUploadResponse:", v19);
  }
  else if (v21 == 1)
  {
    -[IMTransferAgentIDSInterface _handleUploadRequest:](self, "_handleUploadRequest:", v19);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = 67109120;
      LODWORD(v24) = v21;
      _os_log_impl(&dword_22D97D000, v22, OS_LOG_TYPE_INFO, "Unknown incoming IDS message for remote attachments with command %d, ignoring...", (uint8_t *)&v23, 8u);
    }

  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  _BOOL4 v8;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  const __CFString *v16;
  int v17;
  id v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v8 = a6;
  v21 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = CFSTR("NO");
      if (v8)
        v16 = CFSTR("YES");
      v17 = 138412546;
      v18 = v13;
      v19 = 2112;
      v20 = v16;
      _os_log_impl(&dword_22D97D000, v15, OS_LOG_TYPE_INFO, "Sent message with identifier %@ success %@", (uint8_t *)&v17, 0x16u);
    }

  }
  im_assert_primary_queue();

}

- (id)localCompanionDevice
{
  im_assert_primary_queue();
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIDToFilePathMap, 0);
  objc_storeStrong((id *)&self->_uniqueIDToTransferCompletionBlockMap, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
}

@end
