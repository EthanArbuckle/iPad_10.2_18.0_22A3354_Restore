@implementation DTXConnection

+ (void)initialize
{
  dispatch_queue_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  os_log_t v9;
  void *v10;
  os_log_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  void *v26;
  void *v27;
  const char *v28;
  id v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  char *v33;
  int v34;
  void *v35;
  NSObject *v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  pid_t v40;
  __int16 v41;
  char *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  if ((id)objc_opt_class() == a1)
  {
    objc_opt_class();
    v2 = dispatch_queue_create("connection transport registry guard", 0);
    v3 = (void *)qword_253F42638;
    qword_253F42638 = (uint64_t)v2;

    v4 = objc_opt_new();
    v5 = (void *)qword_253F42650;
    qword_253F42650 = v4;

    objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x24BDBCE60], v6, v7);
    qword_253F42618 = v8;
    v9 = os_log_create("com.apple.dt.DTXConnectionServices", "DTXConnection");
    v10 = (void *)qword_253F42648;
    qword_253F42648 = (uint64_t)v9;

    v11 = os_log_create("com.apple.dt.DTXConnectionServices", "Capabilities");
    v12 = (void *)qword_253F42620;
    qword_253F42620 = (uint64_t)v11;

    v13 = objc_opt_new();
    v14 = (void *)qword_253F42610;
    qword_253F42610 = v13;

    objc_msgSend_setErrorStatus_((void *)qword_253F42610, v15, 2);
    objc_msgSend__makeImmutable((void *)qword_253F42610, v16, v17);
    pthread_key_create((pthread_key_t *)&qword_253F42628, 0);
    objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    byte_253F42658 = objc_msgSend_BOOLForKey_(v20, v21, (uint64_t)CFSTR("DTXConnectionTracer"));

    if (byte_253F42658)
    {
      v22 = (void *)MEMORY[0x24BDD17C8];
      v23 = getprogname();
      v24 = getpid();
      objc_msgSend_stringWithFormat_(v22, v25, (uint64_t)CFSTR("%s[%d].DTXConnection.XXXXXX.log"), v23, v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      NSTemporaryDirectory();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByAppendingPathComponent_(v27, v28, (uint64_t)v26);
      v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v32 = (const char *)objc_msgSend_fileSystemRepresentation(v29, v30, v31);

      v33 = strdup(v32);
      v34 = mkstemps(v33, 4);
      qword_2553ACB10 = (uint64_t)fdopen(v34, "we");
      setlinebuf((FILE *)qword_2553ACB10);
      v35 = (void *)qword_253F42648;
      if (os_log_type_enabled((os_log_t)qword_253F42648, OS_LOG_TYPE_ERROR))
      {
        v36 = v35;
        *(_DWORD *)buf = 136315650;
        v38 = getprogname();
        v39 = 1024;
        v40 = getpid();
        v41 = 2080;
        v42 = v33;
        _os_log_impl(&dword_21DC85000, v36, OS_LOG_TYPE_ERROR, "%s[%d]: Global DTXConnection log enabled - also written to '%s'", buf, 0x1Cu);

      }
      free(v33);

    }
  }
}

+ (void)registerTransport:(Class)a3 forScheme:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  Class v10;

  v5 = a4;
  if (a3 && v5)
  {
    v6 = qword_253F42638;
    block[1] = 3221225472;
    block[2] = sub_21DC8D55C;
    block[3] = &unk_24E1AAD90;
    v10 = a3;
    v7 = v5;
    block[0] = MEMORY[0x24BDAC760];
    v9 = v5;
    dispatch_sync(v6, block);

    v5 = v7;
  }

}

- (void)publishServicesInImagePath:(id)a3
{
  char *v4;
  const char *v5;
  uint64_t v6;
  char *v7;
  NSObject *v8;
  char *v9;
  const char *v10;
  uint64_t v11;
  char *v12;
  objc_class *v13;
  uint64_t v14;
  char *v15;
  const char *v16;
  uint64_t v17;
  char *v18;
  _QWORD *v19;
  Protocol *v20;
  char *v21;
  const char **v22;
  NSObject *v23;
  const char *v24;
  unint64_t i;
  NSObject *v26;
  const char *v27;
  const char *v28;
  objc_class *Class;
  NSObject *v30;
  _QWORD v31[2];
  uint64_t (*v32)(uint64_t, objc_class *);
  void *v33;
  DTXConnection *v34;
  _QWORD v35[5];
  unsigned int outCount;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  unsigned int v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)a3;
  v7 = v4;
  if (v4 && objc_msgSend_length(v4, v5, v6))
  {
    v8 = qword_253F42620;
    if (os_log_type_enabled((os_log_t)qword_253F42620, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v38 = v7;
      _os_log_impl(&dword_21DC85000, v8, OS_LOG_TYPE_INFO, "registering capabilities in image: %{public}@", buf, 0xCu);
    }
    v9 = objc_retainAutorelease(v7);
    v12 = (char *)objc_msgSend_UTF8String(v9, v10, v11);
    v13 = (objc_class *)objc_opt_class();
    v14 = MEMORY[0x24BDAC760];
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = sub_21DC8DBC0;
    v35[3] = &unk_24E1AADB8;
    v35[4] = self;
    sub_21DC8D918(v12, sel_registerCapabilities_, v13, v35);
    v15 = objc_retainAutorelease(v9);
    v18 = (char *)objc_msgSend_UTF8String(v15, v16, v17);
    v31[0] = v14;
    v31[1] = 3221225472;
    v32 = sub_21DC8DCA8;
    v33 = &unk_24E1AADB8;
    v34 = self;
    v19 = v31;
    objc_getProtocol("DTTapServiceDelegate");
    v20 = (Protocol *)objc_claimAutoreleasedReturnValue();
    if (!v20)
      goto LABEL_25;
    v21 = sub_21DC949C4(v18);
    outCount = 0;
    v22 = objc_copyClassNamesForImage(v21, &outCount);
    v23 = qword_253F42620;
    if (os_log_type_enabled((os_log_t)qword_253F42620, OS_LOG_TYPE_DEBUG))
    {
      v24 = "<nil image?>";
      if (v18)
        v24 = v18;
      *(_DWORD *)buf = 136315394;
      v38 = v24;
      v39 = 1024;
      v40 = outCount;
      _os_log_impl(&dword_21DC85000, v23, OS_LOG_TYPE_DEBUG, "scanning image %s (%u classes)", buf, 0x12u);
    }
    if (outCount)
    {
      for (i = 0; i < outCount; ++i)
      {
        v26 = qword_253F42620;
        if (os_log_type_enabled((os_log_t)qword_253F42620, OS_LOG_TYPE_DEBUG))
        {
          v27 = v22[i];
          if (!v27)
            v27 = "<nil className>";
          *(_DWORD *)buf = 136315138;
          v38 = v27;
          _os_log_impl(&dword_21DC85000, v26, OS_LOG_TYPE_DEBUG, "checking class %s", buf, 0xCu);
        }
        v28 = v22[i];
        if (v28)
        {
          Class = objc_getClass(v28);
          if (class_conformsToProtocol(Class, v20))
          {
            v30 = qword_253F42620;
            if (os_log_type_enabled((os_log_t)qword_253F42620, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21DC85000, v30, OS_LOG_TYPE_DEBUG, "protocol matched for class, calling block", buf, 2u);
            }
            v32((uint64_t)v19, Class);
          }
        }
      }
    }
    else if (!v22)
    {
LABEL_25:

      goto LABEL_26;
    }
    free(v22);
    goto LABEL_25;
  }
LABEL_26:

}

- (void)setCompressionHint:(int)a3 forChannel:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *handler_queue;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  id v13;
  _QWORD block[5];
  id v15;
  int v16;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  handler_queue = self->_handler_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21DC8DE74;
  block[3] = &unk_24E1AADE0;
  block[4] = self;
  v16 = v4;
  v13 = v6;
  v15 = v13;
  dispatch_sync(handler_queue, block);
  v10 = (uint64_t)v13;
  if (v13)
    v10 = objc_msgSend_channelCode(v13, v8, v9);
  objc_msgSend_messageWithSelector_typesAndArguments_(DTXMessage, v8, (uint64_t)sel__notifyCompressionHint_forChannelCode_, 3, v4, 3, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sendMessage_fromChannel_sendMode_syncWithReply_replyHandler_(self, v12, (uint64_t)v11, 0, 2, 0, 0);

}

+ (id)connectionToAddress:(id)a3
{
  id v4;
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v6 = v4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v27 = 0;
  objc_msgSend_scheme(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = qword_253F42638;
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = sub_21DC94AD4;
  v21 = &unk_24E1AAC78;
  v23 = &v24;
  v11 = v9;
  v22 = v11;
  dispatch_sync(v10, &v18);
  v12 = objc_alloc((Class)v25[3]);
  v14 = (void *)objc_msgSend_initWithRemoteAddress_(v12, v13, (uint64_t)v6, v18, v19, v20, v21);

  _Block_object_dispose(&v24, 8);
  v16 = (void *)objc_msgSend_initWithTransport_(v5, v15, (uint64_t)v14);

  return v16;
}

- (void)_handleMessageParseException:(id)a3 forChannelCode:(unsigned int)a4 messageID:(unsigned int)a5 fragmentCount:(unsigned int)a6 withPayloadBytes:(const void *)a7 ofLength:(unint64_t)a8
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  void *v29;
  id v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  const char *v35;
  void *v36;
  id v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  const char *v44;
  int v45;
  id v46;
  const char *v47;
  uint64_t v48;
  id v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  pid_t v53;
  int v54;
  int v55;
  id v56;
  const char *v57;
  id v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  int *v62;
  char *v63;
  NSObject *v64;
  id v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  id v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  NSObject *v77;
  const char *v78;
  uint8_t *v79;
  uint32_t v80;
  id v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  int *v85;
  char *v86;
  const char *v87;
  uint64_t v88;
  id v89;
  id v90;
  id v91;
  uint8_t v92[4];
  uint8_t *v93;
  __int16 v94;
  char *v95;
  uint8_t buf[4];
  _QWORD v97[128];
  _QWORD v98[6];
  _QWORD v99[7];

  v10 = *(_QWORD *)&a6;
  v11 = *(_QWORD *)&a5;
  v12 = *(_QWORD *)&a4;
  v99[6] = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109376;
    LODWORD(v97[0]) = v12;
    WORD2(v97[0]) = 2048;
    *(_QWORD *)((char *)v97 + 6) = a8;
    _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "exception handler called for message parsing: channel code:%u, payload length:%llu", buf, 0x12u);
  }
  if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
LABEL_38:
    objc_exception_throw(objc_retainAutorelease(v13));
  v99[0] = &unk_24E1B0370;
  v98[0] = CFSTR("Version");
  v98[1] = CFSTR("ChannelCode");
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v14, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v99[1] = v15;
  v98[2] = CFSTR("MessageID");
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v16, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v99[2] = v17;
  v98[3] = CFSTR("FragmentCount");
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v18, v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v99[3] = v19;
  v98[4] = CFSTR("SerializedDataRawLength");
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v20, a8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v99[4] = v21;
  v98[5] = CFSTR("SerializedDataBase64");
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x24BDBCE50], v22, (uint64_t)a7, a8, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(v23, v24, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v99[5] = v25;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v26, (uint64_t)v99, v98, 6);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v91 = 0;
  objc_msgSend_dataWithJSONObject_options_error_(MEMORY[0x24BDD1608], v28, (uint64_t)v27, 1, &v91);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v91;
  v33 = v30;
  if (!v29 || v30)
  {
    v64 = MEMORY[0x24BDACB70];
    v65 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      goto LABEL_37;
    if (v33)
    {
      objc_msgSend_localizedDescription(v33, v66, v67);
      v64 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v70 = (const char *)objc_msgSend_UTF8String(v64, v68, v69);
    }
    else
    {
      v70 = "{no error available}";
    }
    *(_DWORD *)buf = 136315138;
    v97[0] = v70;
    _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed to serialize log content to JSON: %s", buf, 0xCu);
    if (!v33)
      goto LABEL_37;
LABEL_36:

LABEL_37:
    goto LABEL_38;
  }
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v31, v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = 0;
  objc_msgSend_URLForDirectory_inDomain_appropriateForURL_create_error_(v34, v35, 5, 1, 0, 0, &v90);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v90;

  if (v37)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_localizedDescription(v37, v71, v72);
      v73 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v76 = objc_msgSend_UTF8String(v73, v74, v75);
      *(_DWORD *)buf = 136315138;
      v97[0] = v76;
      _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed to get ~/Library NSURL, nowhere to write to failure log: %s", buf, 0xCu);

    }
    goto LABEL_38;
  }
  objc_msgSend_URLWithString_relativeToURL_(MEMORY[0x24BDBCF48], v38, (uint64_t)CFSTR("Logs/DTXConnection"), v36);
  v39 = objc_claimAutoreleasedReturnValue();
  if (!v39)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_38;
    *(_WORD *)buf = 0;
    v77 = MEMORY[0x24BDACB70];
    v78 = "failed to build DTXConnection log dir URL, nowhere to write to failure log";
    v79 = buf;
    v80 = 2;
LABEL_33:
    _os_log_impl(&dword_21DC85000, v77, OS_LOG_TYPE_ERROR, v78, v79, v80);
    goto LABEL_38;
  }
  v42 = (void *)v39;
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v40, v41);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = 0;
  v45 = objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v43, v44, (uint64_t)v42, 1, 0, &v89);
  v46 = v89;

  if (!v45 || v46)
  {
    v64 = MEMORY[0x24BDACB70];
    v81 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      goto LABEL_37;
    if (v46)
    {
      objc_msgSend_localizedDescription(v46, v82, v83);
      v64 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v84 = (const char *)objc_msgSend_UTF8String(v64, v87, v88);
    }
    else
    {
      v84 = "<no error returned>";
    }
    *(_DWORD *)buf = 136315138;
    v97[0] = v84;
    _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed to create DTXConnection log dir, nowhere to write to failure log: %s", buf, 0xCu);
    if (!v46)
      goto LABEL_37;
    goto LABEL_36;
  }
  objc_msgSend_path(v42, v47, v48);
  v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v52 = (const char *)objc_msgSend_UTF8String(v49, v50, v51);
  v53 = getpid();
  snprintf((char *)buf, 0x400uLL, "%s/FailedDecompression-%d-XXXXXX.log", v52, v53);

  v54 = mkstemps((char *)buf, 4);
  if (v54 == -1)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_38;
    v85 = __error();
    v86 = strerror(*v85);
    *(_DWORD *)v92 = 136315394;
    v93 = buf;
    v94 = 2080;
    v95 = v86;
    v77 = MEMORY[0x24BDACB70];
    v78 = "failed to create file '%s': %s";
    v79 = v92;
    v80 = 22;
    goto LABEL_33;
  }
  v55 = v54;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v92 = 136315138;
    v93 = buf;
    _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "writing failed decompression log to '%s'", v92, 0xCu);
  }
  v56 = objc_alloc(MEMORY[0x24BDD17C8]);
  v58 = objc_retainAutorelease((id)objc_msgSend_initWithData_encoding_(v56, v57, (uint64_t)v29, 4));
  v61 = (const char *)objc_msgSend_UTF8String(v58, v59, v60);
  dprintf(v55, "%s", v61);

  if ((v55 & 0x80000000) == 0 && close(v55) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v62 = __error();
    v63 = strerror(*v62);
    *(_DWORD *)v92 = 136315394;
    v93 = buf;
    v94 = 2080;
    v95 = v63;
    _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed to close file '%s': %s", v92, 0x16u);
  }
  if (!qword_2553ACB18 || (*(unsigned int (**)(void))(qword_2553ACB18 + 16))())
    goto LABEL_38;

}

- (void)_setupWireProtocols
{
  uint64_t v2;
  id *p_incomingParser;
  id v5;
  id v6;
  DTXMessageTransmitter *outgoingTransmitter;
  const char *v8;
  uint64_t v9;
  void *v10;
  DTXMessageParser *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  DTXMessageTransmitter *v17;
  DTXMessageTransmitter *v18;
  const char *v19;
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;
  DTXConnection *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  p_incomingParser = (id *)&self->_incomingParser;
  v5 = (id)objc_msgSend_parsingComplete(self->_incomingParser, a2, v2);
  v6 = *p_incomingParser;
  *p_incomingParser = 0;

  outgoingTransmitter = self->_outgoingTransmitter;
  self->_outgoingTransmitter = 0;

  objc_msgSend_resourceTracker(self->_controlTransport, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_21DC8E814;
  v29 = sub_21DC8E824;
  v30 = 0;
  v11 = [DTXMessageParser alloc];
  v12 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = sub_21DC8E82C;
  v21[3] = &unk_24E1AAE30;
  v13 = v10;
  v22 = v13;
  v23 = self;
  v24 = &v25;
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = sub_21DC8E93C;
  v20[3] = &unk_24E1AAE58;
  v20[4] = self;
  v15 = objc_msgSend_initWithMessageHandler_andParseExceptionHandler_(v11, v14, (uint64_t)v21, v20);
  v16 = (void *)v26[5];
  v26[5] = v15;

  objc_storeStrong(p_incomingParser, (id)v26[5]);
  v17 = (DTXMessageTransmitter *)objc_opt_new();
  v18 = self->_outgoingTransmitter;
  self->_outgoingTransmitter = v17;

  objc_msgSend_setSuggestedFragmentSize_(self->_outgoingTransmitter, v19, 0x10000);
  _Block_object_dispose(&v25, 8);

}

- (DTXConnection)initWithTransport:(id)a3
{
  id v5;
  DTXConnection *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  dispatch_queue_t v26;
  void *v27;
  dispatch_queue_t v28;
  void *v29;
  dispatch_queue_t v30;
  void *v31;
  NSObject *v32;
  dispatch_queue_t v33;
  void *v34;
  dispatch_semaphore_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  unsigned int v43;
  unsigned int v44;
  const char *v45;
  uint64_t v46;
  int v47;
  void *v48;
  const char *v49;
  int v50;
  const char *v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  DTXChannel *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  uint64_t BlockCompressor;
  void *v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  objc_super v69;

  v5 = a3;
  v69.receiver = self;
  v69.super_class = (Class)DTXConnection;
  v6 = -[DTXConnection init](&v69, sel_init);
  v7 = (uint64_t)v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_controlTransport, a3);
      objc_msgSend_permittedBlockCompressionTypes(v5, v8, v9);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v10;

      objc_msgSend_resourceTracker(*(void **)(v7 + 32), v12, v13);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(void **)(v7 + 144);
      *(_QWORD *)(v7 + 144) = v14;

      v16 = objc_opt_new();
      v17 = *(void **)(v7 + 88);
      *(_QWORD *)(v7 + 88) = v16;

      v18 = objc_opt_new();
      v19 = *(void **)(v7 + 96);
      *(_QWORD *)(v7 + 96) = v18;

      v20 = objc_opt_new();
      v21 = *(void **)(v7 + 72);
      *(_QWORD *)(v7 + 72) = v20;

      v22 = objc_opt_new();
      v23 = *(void **)(v7 + 80);
      *(_QWORD *)(v7 + 80) = v22;

      v24 = objc_opt_new();
      v25 = *(void **)(v7 + 136);
      *(_QWORD *)(v7 + 136) = v24;

      v26 = dispatch_queue_create("connection control queue", 0);
      v27 = *(void **)(v7 + 24);
      *(_QWORD *)(v7 + 24) = v26;

      v28 = dispatch_queue_create_with_target_V2("connection data queue", 0, *(dispatch_queue_t *)(v7 + 24));
      v29 = *(void **)(v7 + 16);
      *(_QWORD *)(v7 + 16) = v28;

      v30 = dispatch_queue_create("connection handler queue", 0);
      v31 = *(void **)(v7 + 56);
      *(_QWORD *)(v7 + 56) = v30;

      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = dispatch_queue_create_with_target_V2("connection receive queue", v32, *(dispatch_queue_t *)(v7 + 56));
      v34 = *(void **)(v7 + 48);
      *(_QWORD *)(v7 + 48) = v33;

      v35 = dispatch_semaphore_create(0);
      v36 = *(void **)(v7 + 152);
      *(_QWORD *)(v7 + 152) = v35;

      v37 = objc_opt_new();
      v38 = *(void **)(v7 + 104);
      *(_QWORD *)(v7 + 104) = v37;

      v39 = objc_opt_new();
      v40 = *(void **)(v7 + 112);
      *(_QWORD *)(v7 + 112) = v39;

      do
      {
        v43 = __ldaxr((unsigned int *)&unk_253F425F8);
        v44 = v43 + 1;
      }
      while (__stlxr(v44, (unsigned int *)&unk_253F425F8));
      *(_DWORD *)(v7 + 188) = v44;
      objc_msgSend_suspend((void *)v7, v41, v42);
      v47 = byte_253F42658;
      *(_BYTE *)(v7 + 184) = byte_253F42658;
      if (v47)
        *(_QWORD *)(v7 + 200) = 0x80000;
      objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], v45, v46);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend_integerForKey_(v48, v49, (uint64_t)CFSTR("DefaultBlockCompressionType"));
      if (v50)
        v52 = v50;
      else
        v52 = 3;
      *(_DWORD *)(v7 + 216) = v52;
      v53 = objc_msgSend_integerForKey_(v48, v51, (uint64_t)CFSTR("CompressionMinSizeThreshold"));
      v54 = 0x4000;
      if (v53)
        v54 = v53;
      *(_QWORD *)(v7 + 224) = v54;
      *(_DWORD *)(v7 + 212) = 1;
      *(_DWORD *)(v7 + 64) = 1;
      v55 = [DTXChannel alloc];
      v57 = objc_msgSend_initWithConnection_channelIdentifier_label_(v55, v56, v7, 0, 0);
      v58 = *(void **)(v7 + 176);
      *(_QWORD *)(v7 + 176) = v57;

      objc_msgSend_setObject_forKeyedSubscript_(*(void **)(v7 + 72), v59, *(_QWORD *)(v7 + 176), &unk_24E1B0388);
      BlockCompressor = objc_msgSend_createBlockCompressor(DTXBlockCompressorFactory, v60, v61);
      v63 = *(void **)(v7 + 232);
      *(_QWORD *)(v7 + 232) = BlockCompressor;

      if (objc_msgSend_supportedDirections(v5, v64, v65) == 2)
        *(_DWORD *)(v7 + 208) = 2;
      objc_msgSend__setupWireProtocols((void *)v7, v66, v67);
    }
    else
    {
      v48 = v6;
      v7 = 0;
    }

  }
  return (DTXConnection *)v7;
}

- (void)dealloc
{
  NSObject *firstMessageSem;
  objc_super v4;

  firstMessageSem = self->_firstMessageSem;
  if (firstMessageSem && self->_remoteCapabilityVersions)
    dispatch_semaphore_wait(firstMessageSem, 0xFFFFFFFFFFFFFFFFLL);
  v4.receiver = self;
  v4.super_class = (Class)DTXConnection;
  -[DTXConnection dealloc](&v4, sel_dealloc);
}

- (id)publishedAddresses
{
  return (id)((uint64_t (*)(DTXTransport *, char *))MEMORY[0x24BEDD108])(self->_controlTransport, sel_localAddresses);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  const char *Name;
  const char *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  Name = class_getName(v4);
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%s %p : x%d>"), Name, self, self->_connectionIndex);
}

- (void)setMaximumEnqueueSize:(unint64_t)a3
{
  unint64_t v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  id v9;

  if (*MEMORY[0x24BDB03C8] <= a3)
  {
    v4 = a3;
    objc_msgSend_setTotalSize_(self->_resourceTracker, a2, a3);
  }
  else
  {
    v4 = *MEMORY[0x24BDB03C8];
    objc_msgSend_setTotalSize_(self->_resourceTracker, a2, *MEMORY[0x24BDB03C8]);
  }
  objc_msgSend_setMaxChunkSize_(self->_resourceTracker, v5, v4 >> 3);
  objc_msgSend_resourceTracker(self->_controlTransport, v6, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTotalSize_(v9, v8, v4);

}

- (unint64_t)maximumEnqueueSize
{
  return ((uint64_t (*)(DTXResourceTracker *, char *))MEMORY[0x24BEDD108])(self->_resourceTracker, sel_totalSize);
}

- (void)publishCapability:(id)a3 withVersion:(int)a4 forClass:(Class)a5
{
  char v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  v5 = objc_msgSend_publishCapability_withVersion_forClass_error_(self, a2, (uint64_t)a3, *(_QWORD *)&a4, a5, &v13);
  v6 = v13;
  v7 = v6;
  if ((v5 & 1) == 0)
  {
    if (v6)
    {
      v8 = (void *)qword_253F42648;
      if (os_log_type_enabled((os_log_t)qword_253F42648, OS_LOG_TYPE_ERROR))
      {
        v9 = v8;
        objc_msgSend_localizedDescription(v7, v10, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v15 = v12;
        _os_log_impl(&dword_21DC85000, v9, OS_LOG_TYPE_ERROR, "Failed to publish capability: %{public}@", buf, 0xCu);

      }
    }
  }

}

- (BOOL)publishCapability:(id)a3 withVersion:(int)a4 forClass:(Class)a5 error:(id *)a6
{
  id v10;
  NSObject *handler_queue;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  BOOL v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, const char *, uint64_t);
  void *v23;
  DTXConnection *v24;
  id v25;
  uint64_t *v26;
  Class v27;
  int v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_21DC8E814;
  v33 = sub_21DC8E824;
  v34 = 0;
  handler_queue = self->_handler_queue;
  v20 = MEMORY[0x24BDAC760];
  v21 = 3221225472;
  v22 = sub_21DC8F01C;
  v23 = &unk_24E1AAE80;
  v24 = self;
  v26 = &v29;
  v28 = a4;
  v12 = v10;
  v25 = v12;
  v27 = a5;
  dispatch_sync(handler_queue, &v20);
  v14 = v30[5];
  if (a6 && v14)
  {
    v15 = (void *)MEMORY[0x24BDD1540];
    v35 = *MEMORY[0x24BDD0FC8];
    v36[0] = v14;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v13, (uint64_t)v36, &v35, 1, v20, v21, v22, v23, v24);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v15, v17, (uint64_t)CFSTR("DTXConnection"), 2, v16);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    v14 = v30[5];
  }
  v18 = v14 == 0;

  _Block_object_dispose(&v29, 8);
  return v18;
}

- (id)localCapabilities
{
  NSObject *handler_queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_21DC8E814;
  v10 = sub_21DC8E824;
  v11 = 0;
  handler_queue = self->_handler_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_21DC8F3E0;
  v5[3] = &unk_24E1AAC78;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(handler_queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_sendHeartbeatAsyncWithTimeout:(double)a3
{
  void *v5;
  uint64_t v6;
  DTXChannel *defaultChannel;
  id v8;
  const char *v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  _QWORD *v15;
  double v16;
  _QWORD v17[4];

  v5 = (void *)objc_opt_new();
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  v6 = kDTXHeartbeatMessage;
  defaultChannel = self->_defaultChannel;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_21DC8F520;
  v13[3] = &unk_24E1AAEA8;
  v16 = a3;
  v15 = v17;
  v13[4] = self;
  v8 = v5;
  v14 = v8;
  objc_msgSend_sendMessage_fromChannel_sendMode_syncWithReply_replyHandler_(self, v9, v6, defaultChannel, 2, 0, v13);
  v10 = v14;
  v11 = v8;

  _Block_object_dispose(v17, 8);
  return v11;
}

- (double)preflightSynchronouslyWithTimeout:(double)a3
{
  dispatch_semaphore_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  double v11;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  uint64_t v16;
  double *v17;
  uint64_t v18;
  uint64_t v19;

  v16 = 0;
  v17 = (double *)&v16;
  v18 = 0x2020000000;
  v19 = 0;
  v5 = dispatch_semaphore_create(0);
  objc_msgSend__sendHeartbeatAsyncWithTimeout_(self, v6, v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_21DC8F7B4;
  v13[3] = &unk_24E1AAED0;
  v15 = &v16;
  v9 = v5;
  v14 = v9;
  objc_msgSend_handleCompletion_(v8, v10, (uint64_t)v13);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  v11 = v17[3];

  _Block_object_dispose(&v16, 8);
  return v11;
}

- (void)_handleMissingRemoteCapabilities
{
  NSObject *receive_queue;
  const char *v4;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  receive_queue = self->_receive_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_21DC8F8C8;
  v5[3] = &unk_24E1AAA28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(receive_queue, v5);
  if (*((_BYTE *)v7 + 24))
  {
    objc_msgSend_sendMessage_fromChannel_sendMode_syncWithReply_replyHandler_(self, v4, kDTXAckBarrierMessage, self->_defaultChannel, 2, 0, 0);
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_firstMessageSem, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_firstMessageSem);
  }
  _Block_object_dispose(&v6, 8);
}

- (int)remoteCapabilityVersion:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  NSDictionary *remoteCapabilityVersions;
  NSDictionary *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  int v14;

  v6 = a3;
  remoteCapabilityVersions = self->_remoteCapabilityVersions;
  if (!remoteCapabilityVersions)
  {
    objc_msgSend__handleMissingRemoteCapabilities(self, v4, v5);
    remoteCapabilityVersions = self->_remoteCapabilityVersions;
  }
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v4, v5);
  v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  if (remoteCapabilityVersions == v8
    || (objc_msgSend_objectForKey_(self->_remoteCapabilityVersions, v9, (uint64_t)v6),
        (v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v14 = 0x80000000;
  }
  else
  {
    v13 = v10;
    v14 = objc_msgSend_intValue(v10, v11, v12);

  }
  return v14;
}

- (void)registerCapabilityOverrideBlock:(id)a3
{
  id v4;
  NSObject *handler_queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    handler_queue = self->_handler_queue;
    block[1] = 3221225472;
    block[2] = sub_21DC8FA58;
    block[3] = &unk_24E1AA9B0;
    block[4] = self;
    v6 = v4;
    block[0] = MEMORY[0x24BDAC760];
    v8 = v4;
    dispatch_sync(handler_queue, block);

    v4 = v6;
  }

}

- (id)remoteCapabilityVersions
{
  uint64_t v2;
  void *v4;
  NSDictionary *remoteCapabilityVersions;
  const char *v6;
  uint64_t v7;
  NSDictionary *v8;
  const char *v9;
  void *v10;
  id v11;
  const char *v12;
  const char *v13;
  _QWORD v15[4];
  id v16;

  if (!self->_remoteCapabilityVersions)
    objc_msgSend__handleMissingRemoteCapabilities(self, a2, v2);
  v4 = (void *)objc_opt_new();
  remoteCapabilityVersions = self->_remoteCapabilityVersions;
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v6, v7);
  v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  if (remoteCapabilityVersions != v8)
    objc_msgSend_addEntriesFromDictionary_(v4, v9, (uint64_t)self->_remoteCapabilityVersions);
  v10 = (void *)objc_opt_new();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_21DC8FBE8;
  v15[3] = &unk_24E1AAEF8;
  v16 = v10;
  v11 = v10;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v4, v12, (uint64_t)v15);
  objc_msgSend_removeObjectsForKeys_(v4, v13, (uint64_t)v11);

  return v4;
}

- (void)suspend
{
  dispatch_suspend((dispatch_object_t)self->_outgoing_control_queue);
  dispatch_suspend((dispatch_object_t)self->_receive_queue);
}

- (void)resume
{
  NSObject *handler_queue;
  _QWORD block[5];

  handler_queue = self->_handler_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21DC8FCBC;
  block[3] = &unk_24E1AAAC8;
  block[4] = self;
  dispatch_sync(handler_queue, block);
}

- (void)setMessageHandler:(id)a3
{
  objc_msgSend_setMessageHandler_(self->_defaultChannel, a2, (uint64_t)a3);
}

- (void)setDispatchTarget:(id)a3
{
  objc_msgSend_setDispatchTarget_(self->_defaultChannel, a2, (uint64_t)a3);
}

- (void)setChannelHandler:(id)a3
{
  id v4;
  NSObject *handler_queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  handler_queue = self->_handler_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21DC90158;
  block[3] = &unk_24E1AA9B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(handler_queue, block);

}

- (void)registerDisconnectHandler:(id)a3
{
  MEMORY[0x24BEDD108](self->_defaultChannel, sel_registerDisconnectHandler_, a3);
}

- (void)cancel
{
  objc_msgSend__cancelInternal_(self, a2, 0);
}

- (void)cancelWithSerializedTransport:(id)a3
{
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  char *v9;

  v5 = (const char *)a3;
  v9 = (char *)v5;
  if (v5)
  {
    objc_msgSend__cancelInternal_(self, v5, (uint64_t)v5);
  }
  else
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], 0, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v8, (uint64_t)a2, self, CFSTR("DTXConnection.m"), 881, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transportCallback != nil"));

    objc_msgSend__cancelInternal_(self, 0, 0);
  }

}

- (void)_cancelInternal:(id)a3
{
  id v4;
  NSObject *receive_queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  receive_queue = self->_receive_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_21DC902B0;
  v7[3] = &unk_24E1AA9B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(receive_queue, v7);

}

- (void)sendControlAsync:(id)a3 replyHandler:(id)a4
{
  objc_msgSend_sendControlAsync_replyHandler_(self->_defaultChannel, a2, (uint64_t)a3, a4);
}

- (void)sendControlSync:(id)a3 replyHandler:(id)a4
{
  MEMORY[0x24BEDD108](self->_defaultChannel, sel_sendControlSync_replyHandler_, a3);
}

- (BOOL)sendMessageAsync:(id)a3 replyHandler:(id)a4
{
  return MEMORY[0x24BEDD108](self->_defaultChannel, sel_sendMessageAsync_replyHandler_, a3);
}

- (void)sendMessage:(id)a3 replyHandler:(id)a4
{
  MEMORY[0x24BEDD108](self->_defaultChannel, sel_sendMessage_replyHandler_, a3);
}

- (void)sendMessageSync:(id)a3 replyHandler:(id)a4
{
  MEMORY[0x24BEDD108](self->_defaultChannel, sel_sendMessageSync_replyHandler_, a3);
}

- (BOOL)sendMessage:(id)a3 fromChannel:(id)a4 sendMode:(int)a5 syncWithReply:(BOOL)a6 replyHandler:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  id v16;
  BOOL v17;
  unint64_t v18;
  const char *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t logMessageCallstackSizeThreshold;
  void *v23;
  const char *v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t compressionTypeForUnspecified;
  NSSet *permittedBlockCompressors;
  void *v30;
  const char *v31;
  int v32;
  int remoteCompressionCapabilityVersion;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unsigned int v44;
  const char *v45;
  uint64_t v46;
  unsigned int v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  unsigned int v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  dispatch_semaphore_t v64;
  BOOL v66;
  uint64_t v67;
  id v68;
  NSObject *v69;
  const char *v70;
  void (**v71)(_QWORD, _QWORD);
  void *v72;
  const char *v73;
  uint64_t v74;
  id v75;
  const char *v76;
  uint64_t v77;
  void *v79;
  void *v80;
  _BOOL4 v81;
  _QWORD v82[5];
  id v83;
  id v84;
  NSObject *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  BOOL v90;
  BOOL v91;
  uint8_t buf[4];
  double v93;
  __int16 v94;
  uint64_t v95;
  uint64_t v96;

  v8 = a6;
  v96 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v16 = a7;
  v17 = 0;
  if (v12 && (id)kDTXInterruptionMessage != v12)
  {
    v18 = objc_msgSend_serializedLength(v12, v14, v15);
    v21 = v18;
    logMessageCallstackSizeThreshold = self->_logMessageCallstackSizeThreshold;
    if (logMessageCallstackSizeThreshold
      && v18 > logMessageCallstackSizeThreshold
      && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      objc_msgSend_callStackSymbols(MEMORY[0x24BDD17F0], v19, v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_componentsJoinedByString_(v23, v24, (uint64_t)CFSTR("\n"));
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 134218242;
      v93 = (double)v21 * 0.000000953674316;
      v94 = 2080;
      v95 = objc_msgSend_UTF8String(v25, v26, v27);
      _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "large message (%.2lf MB) from:\n%s", buf, 0x16u);

    }
    if (v21 >= self->_compressionMinSizeThreshold && self->_remoteCompressionCapabilityVersion >= 1)
    {
      compressionTypeForUnspecified = objc_msgSend_compressionTypeHint(v13, v19, v20);
      if (compressionTypeForUnspecified <= 1)
        compressionTypeForUnspecified = self->_compressionTypeForUnspecified;
      if ((_DWORD)compressionTypeForUnspecified != 2)
      {
        permittedBlockCompressors = self->_permittedBlockCompressors;
        if (permittedBlockCompressors)
        {
          objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v19, compressionTypeForUnspecified);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend_containsObject_(permittedBlockCompressors, v31, (uint64_t)v30);

          if (v32)
          {
            remoteCompressionCapabilityVersion = self->_remoteCompressionCapabilityVersion;
            if (remoteCompressionCapabilityVersion >= 2)
              remoteCompressionCapabilityVersion = 2;
            objc_msgSend_compressWithCompressor_usingType_forCompatibilityWithVersion_(v12, v19, (uint64_t)self->_compressor, compressionTypeForUnspecified, remoteCompressionCapabilityVersion);
          }
        }
      }
    }
    v81 = v8;
    if ((id)kDTXAckBarrierMessage == v12)
    {
      objc_msgSend_message(DTXMessage, v19, v20);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend__makeBarrier(v34, v35, v36);
      v12 = v34;
    }
    objc_msgSend__makeImmutable(v12, v19, v20);
    v39 = objc_msgSend_serializedLength(v12, v37, v38);
    v41 = v39;
    if (v12 == (id)kDTXBarrierMessage)
      v42 = 0;
    else
      v42 = v39;
    if (a5)
    {
      v43 = 0;
      v44 = objc_msgSend_acquireSize_(self->_resourceTracker, v40, 0);
    }
    else
    {
      v43 = v42;
      v44 = objc_msgSend_acquireSize_(self->_resourceTracker, v40, v42);
    }
    if (v44)
    {
      v47 = v44;
      v80 = v13;
      if (objc_msgSend_conversationIndex(v12, v45, v46))
      {
        if ((objc_msgSend_deserialized(v12, v48, v49) & 1) != 0)
        {
          v52 = 0;
          v53 = objc_msgSend_channelCode(v80, v50, v51);
        }
        else
        {
          v47 = objc_msgSend_identifier(v12, v50, v51);
          v52 = objc_msgSend_conversationIndex(v12, v57, v58) << 32;
          v53 = objc_msgSend_channelCode(v12, v59, v60);
        }
      }
      else
      {
        v56 = v13;
        v52 = 0;
        v53 = objc_msgSend_channelCode(v56, v48, v49);
      }
      v61 = v53;
      v62 = 0x100000000;
      v79 = v16;
      if (!v16 && (objc_msgSend_isDispatch(v12, v54, v55) & v81) == 0)
        v62 = 0;
      v63 = v62 | v61;
      if (a5 == 1)
        v64 = dispatch_semaphore_create(0);
      else
        v64 = 0;
      v66 = v12 == (id)kDTXBarrierMessage || v12 == (id)kDTXHeartbeatMessage;
      v82[0] = MEMORY[0x24BDAC760];
      v82[1] = 3221225472;
      v82[2] = sub_21DC90C50;
      v82[3] = &unk_24E1AB038;
      v82[4] = self;
      v86 = v41;
      v90 = a5 == 2;
      v91 = v66;
      v12 = v12;
      v67 = v52 | v47;
      v83 = v12;
      v88 = v67;
      v89 = v63;
      v13 = v80;
      v68 = v80;
      v84 = v68;
      v87 = v43;
      v69 = v64;
      v85 = v69;
      v71 = (void (**)(_QWORD, _QWORD))MEMORY[0x22079E258](v82);
      if (self->_tracer)
      {
        objc_msgSend_descriptionWithRoutingInformation_(v12, v70, v67, v63);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        sub_21DC8FE68("  sent  ", self, v68, v72);

      }
      if (v81 && v62)
      {
        pthread_getspecific(qword_253F42628);
        v75 = (id)objc_claimAutoreleasedReturnValue();
        v16 = v79;
        if (v75 == v68 && v12 != (id)kDTXBarrierMessage)
          objc_msgSend_raise_format_(MEMORY[0x24BDBCE88], v73, (uint64_t)CFSTR("DTXConnectionException"), CFSTR("API misuse: client attempted to synchronously send a message and wait for response while already executing in channel's asynchronous handler context."));
        if (v75)
        {
          objc_msgSend_suspendLimits(self->_incomingResourceTracker, v73, v74);
          sub_21DC91100(v79, v71);
          objc_msgSend_resumeLimits(self->_incomingResourceTracker, v76, v77);
        }
        else
        {
          sub_21DC91100(v79, v71);
        }

        if (!v69)
          goto LABEL_55;
      }
      else
      {
        v16 = v79;
        ((void (**)(_QWORD, void *))v71)[2](v71, v79);
        if (!v69)
        {
LABEL_55:

          v17 = 0;
          goto LABEL_56;
        }
      }
      dispatch_semaphore_wait(v69, 0xFFFFFFFFFFFFFFFFLL);
      goto LABEL_55;
    }
    v17 = 1;
  }
LABEL_56:

  return v17;
}

- (BOOL)_addHandler:(id)a3 forMessage:(unsigned int)a4 channel:(id)a5
{
  id v8;
  DTXChannel *v9;
  const char *v10;
  uint64_t v11;
  DTXChannel *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  NSObject *handler_queue;
  id v17;
  BOOL v18;
  _QWORD v20[5];
  DTXChannel *v21;
  id v22;
  id v23;
  uint64_t *v24;
  int v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v8 = a3;
  v9 = (DTXChannel *)a5;
  v12 = v9;
  if (v8)
  {
    if (!v9)
      v12 = self->_defaultChannel;
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 1;
    v13 = objc_msgSend_channelCode(v12, v10, v11);
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v14, a4 | (unint64_t)(v13 << 32));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    handler_queue = self->_handler_queue;
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = sub_21DC913B8;
    v20[3] = &unk_24E1AB060;
    v20[4] = self;
    v24 = &v27;
    v25 = v13;
    v12 = v12;
    v21 = v12;
    v22 = v15;
    v23 = v8;
    v26 = a4;
    v17 = v15;
    dispatch_sync(handler_queue, v20);
    v18 = *((_BYTE *)v28 + 24) != 0;

    _Block_object_dispose(&v27, 8);
  }
  else
  {
    v18 = 1;
  }

  return v18;
}

- (void)_routeMessage:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  char v7;
  const char *v8;
  uint64_t v9;
  unsigned int v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  DTXChannel *v15;
  const char *v16;
  DTXChannel *v17;
  DTXChannel *v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  id v26;

  v4 = a3;
  v26 = v4;
  if ((id)kDTXInterruptionMessage == v4)
  {
    objc_msgSend_cancel(self, v5, v6);
  }
  else
  {
    v7 = objc_msgSend_conversationIndex(v4, v5, v6);
    v10 = objc_msgSend_channelCode(v26, v8, v9);
    if ((v7 & 1) != 0)
    {
      LODWORD(v12) = v10;
      objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v11, v10);
    }
    else
    {
      v12 = -v10;
      objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v11, v12);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v12)
    {
      objc_msgSend_objectForKey_(self->_channelsByCode, v13, (uint64_t)v14);
      v15 = (DTXChannel *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = self->_defaultChannel;
    }
    v17 = v15;
    if (!v15)
    {
      objc_msgSend_objectForKey_(self->_unconfiguredChannelsByCode, v16, (uint64_t)v14);
      v18 = (DTXChannel *)objc_claimAutoreleasedReturnValue();
      v17 = v18;
      if (v18)
      {
        objc_msgSend_resume(v18, v16, v19);
        objc_msgSend_removeObjectForKey_(self->_unconfiguredChannelsByCode, v20, (uint64_t)v14);
        objc_msgSend_setObject_forKey_(self->_channelsByCode, v21, (uint64_t)v17, v14);
      }
    }
    objc_msgSend__scheduleMessage_toChannel_(self, v16, (uint64_t)v26, v17);
    if (!self->_remoteCapabilityVersions)
    {
      objc_msgSend_dictionary(MEMORY[0x24BDBCE70], v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__notifyOfPublishedCapabilities_(self, v25, (uint64_t)v24);

    }
  }

}

- (void)_scheduleMessage:(id)a3 toChannel:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  DTXChannel *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  DTXResourceTracker *incomingResourceTracker;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  DTXResourceTracker *v29;
  uint64_t v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  void *v35;
  void *v36;
  const char *v37;
  DTXResourceTracker *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  char v45;
  const char *v46;
  uint64_t v47;
  unsigned int v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  unsigned int v53;
  const char *v54;
  void *v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  void *v61;
  NSMutableDictionary *handlersByIdentifier;
  NSMutableDictionary *v63;
  const char *v64;
  NSMutableDictionary *v65;
  NSMutableDictionary *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  void *v75;
  const char *v76;
  void *v77;
  const char *v78;
  void *v79;
  const char *v80;
  DTXResourceTracker *v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  void (*v86)(uint64_t, void *, uint64_t);
  void *v87;
  DTXChannel *v88;
  NSMutableDictionary *v89;
  DTXConnection *v90;
  id v91;
  _QWORD v92[5];
  DTXChannel *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  _QWORD v97[3];

  v97[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v9 = (DTXChannel *)a4;
  if (self->_tracer)
  {
    objc_msgSend_description(v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    sub_21DC8FE68("received", self, v9, v10);

  }
  if (v9)
  {
    if (objc_msgSend_isBarrier(v6, v7, v8))
    {
      incomingResourceTracker = self->_incomingResourceTracker;
      v92[0] = MEMORY[0x24BDAC760];
      v92[1] = 3221225472;
      v92[2] = sub_21DC91B78;
      v92[3] = &unk_24E1AAAA0;
      v92[4] = self;
      v93 = v9;
      objc_msgSend__scheduleMessage_tracker_withHandler_(v93, v14, (uint64_t)v6, incomingResourceTracker, v92);

    }
    else if (objc_msgSend_isDispatch(v6, v11, v12))
    {
      v35 = (void *)MEMORY[0x22079E084]();
      if (self->_defaultChannel == v9 && objc_msgSend_shouldInvokeWithTarget_(v6, v34, (uint64_t)self))
      {
        v36 = pthread_getspecific(qword_253F42628);
        pthread_setspecific(qword_253F42628, self->_defaultChannel);
        objc_msgSend_invokeWithTarget_replyChannel_validator_(v6, v37, (uint64_t)self, v9, 0);
        pthread_setspecific(qword_253F42628, v36);
        v38 = self->_incomingResourceTracker;
        v41 = objc_msgSend_cost(v6, v39, v40);
        objc_msgSend_releaseSize_(v38, v42, v41);
      }
      else
      {
        objc_msgSend__scheduleMessage_tracker_withHandler_(v9, v34, (uint64_t)v6, self->_incomingResourceTracker, 0);
      }
      objc_autoreleasePoolPop(v35);
    }
    else if (objc_msgSend_conversationIndex(v6, v32, v33))
    {
      v45 = objc_msgSend_conversationIndex(v6, v43, v44);
      v48 = objc_msgSend_channelCode(v6, v46, v47);
      if ((v45 & 1) != 0)
        v51 = v48;
      else
        v51 = -v48;
      v52 = (void *)MEMORY[0x24BDD16E0];
      v53 = objc_msgSend_identifier(v6, v49, v50);
      objc_msgSend_numberWithUnsignedLongLong_(v52, v54, v53 | (unint64_t)(v51 << 32));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(self->_handlersByIdentifier, v56, (uint64_t)v55);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      if (v59)
      {
        objc_msgSend__scheduleMessage_tracker_withHandler_(v9, v57, (uint64_t)v6, self->_incomingResourceTracker, v59);
        objc_msgSend_removeObjectForKey_(self->_handlersByIdentifier, v60, (uint64_t)v55);
      }
      else
      {
        if (objc_msgSend_expectsReply(v6, v57, v58))
        {
          objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], v67, (uint64_t)CFSTR("DTXMissingReplyBlockException"), CFSTR("Peer was not expecting a reply for the provided message and dropped it"), 0);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = (void *)MEMORY[0x24BDD1540];
          v94 = *MEMORY[0x24BDD0FC8];
          objc_msgSend_description(v69, v71, v72);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = v73;
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v74, (uint64_t)&v95, &v94, 1);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_userInfo_(v70, v76, (uint64_t)CFSTR("DTXConnection"), 1, v75);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = (void *)objc_msgSend_newReplyWithError_(v6, v78, (uint64_t)v77);

          objc_msgSend_sendMessage_fromChannel_sendMode_syncWithReply_replyHandler_(self, v80, (uint64_t)v79, v9, 2, 0, 0);
        }
        v81 = self->_incomingResourceTracker;
        v82 = objc_msgSend_cost(v6, v67, v68);
        objc_msgSend_releaseSize_(v81, v83, v82);
      }

    }
    else
    {
      if (!v6)
      {
        v61 = (void *)objc_msgSend_mutableCopy(self->_handlersByIdentifier, v43, v44);
        handlersByIdentifier = self->_handlersByIdentifier;
        v84 = MEMORY[0x24BDAC760];
        v85 = 3221225472;
        v86 = sub_21DC91BC4;
        v87 = &unk_24E1AB088;
        v88 = v9;
        v63 = v61;
        v89 = v63;
        v90 = self;
        v91 = 0;
        objc_msgSend_enumerateKeysAndObjectsUsingBlock_(handlersByIdentifier, v64, (uint64_t)&v84);
        v65 = self->_handlersByIdentifier;
        self->_handlersByIdentifier = v63;
        v66 = v63;

      }
      objc_msgSend__scheduleMessage_tracker_withHandler_(v9, v43, (uint64_t)v6, self->_incomingResourceTracker, 0, v84, v85, v86, v87);
    }
  }
  else
  {
    if (objc_msgSend_expectsReply(v6, v7, v8))
    {
      objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], v15, (uint64_t)CFSTR("DTXMissingChannelException"), CFSTR("Unable to invoke message sent to invalid channel"), 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x24BDD1540];
      v96 = *MEMORY[0x24BDD0FC8];
      objc_msgSend_description(v17, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v97[0] = v21;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v22, (uint64_t)v97, &v96, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v18, v24, (uint64_t)CFSTR("DTXConnection"), 1, v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend_newReplyWithError_(v6, v26, (uint64_t)v25);

      objc_msgSend_sendMessage_fromChannel_sendMode_syncWithReply_replyHandler_(self, v28, (uint64_t)v27, 0, 2, 0, 0);
    }
    v29 = self->_incomingResourceTracker;
    v30 = objc_msgSend_cost(v6, v15, v16);
    objc_msgSend_releaseSize_(v29, v31, v30);
  }

}

- (id)makeChannelWithIdentifier:(id)a3
{
  id v4;
  NSObject *handler_queue;
  uint64_t v6;
  id v7;
  const char *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  const char *v13;
  const char *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v4 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_21DC8E814;
  v32 = sub_21DC8E824;
  v33 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  handler_queue = self->_handler_queue;
  v6 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21DC91E8C;
  block[3] = &unk_24E1AB0B0;
  v22 = &v24;
  v23 = &v28;
  block[4] = self;
  v7 = v4;
  v21 = v7;
  dispatch_sync(handler_queue, block);
  objc_msgSend_messageWithSelector_typesAndArguments_(DTXMessage, v8, (uint64_t)sel__requestChannelWithCode_identifier_, 3, *((unsigned int *)v25 + 6), 11, v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)v29[5];
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = sub_21DC91F40;
  v17[3] = &unk_24E1AAAA0;
  v11 = v7;
  v18 = v11;
  v12 = v10;
  v19 = v12;
  objc_msgSend_sendMessage_fromChannel_sendMode_syncWithReply_replyHandler_(self, v13, (uint64_t)v9, 0, 2, 0, v17);
  objc_msgSend_setCompressionTypeHint_((void *)v29[5], v14, self->_newChannelCompressionHint);
  v15 = (id)v29[5];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  return v15;
}

- (void)setRemoteTracer:(BOOL)a3
{
  const char *v4;
  id v5;

  self->_remoteTracer = a3;
  objc_msgSend_messageWithSelector_typesAndArguments_(DTXMessage, a2, (uint64_t)sel__setTracerState_, 3, a3, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sendMessage_fromChannel_sendMode_syncWithReply_replyHandler_(self, v4, (uint64_t)v5, 0, 2, 0, 0);

}

- (void)_unregisterChannel:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  const char *v12;
  NSObject *receive_queue;
  _QWORD block[4];
  id v15;
  DTXConnection *v16;

  v4 = a3;
  v7 = v4;
  if (v4)
  {
    v8 = objc_msgSend_channelCode(v4, v5, v6);
    objc_msgSend_messageWithSelector_typesAndArguments_(DTXMessage, v9, (uint64_t)sel__channelCanceled_, 3, v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sendMessage_fromChannel_sendMode_syncWithReply_replyHandler_(self, v11, (uint64_t)v10, 0, 2, 0, 0);
    objc_msgSend_sendMessage_fromChannel_sendMode_syncWithReply_replyHandler_(self, v12, kDTXBarrierMessage, 0, 2, 0, 0);
    receive_queue = self->_receive_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_21DC92184;
    block[3] = &unk_24E1AB0D8;
    v15 = v7;
    v16 = self;
    dispatch_async(receive_queue, block);

  }
}

- (void)_requestChannelWithCode:(unsigned int)a3 identifier:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  DTXChannel *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  void *v16;
  const char *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  const char *v24;
  int isEqualToString;
  const char *v26;
  void *v27;
  id v28;
  const char *v29;
  void *v30;
  id v31;
  int v32;
  id v33;
  id v34;
  NSMutableArray *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t i;
  void *v42;
  const char *v43;
  const char *v44;
  NSObject *v45;
  const char *v46;
  uint64_t v47;
  NSObject *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  _QWORD v53[4];
  id v54;
  id v55;
  DTXConnection *v56;
  id v57;
  _QWORD v58[4];
  id v59;
  __int128 *p_buf;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t v65[4];
  id v66;
  uint8_t v67[128];
  __int128 buf;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)MEMORY[0x22079E084]();
  v8 = -a3;
  v9 = [DTXChannel alloc];
  v11 = (void *)objc_msgSend_initWithConnection_channelIdentifier_label_(v9, v10, (uint64_t)self, v8, v6);
  objc_msgSend_suspend(v11, v12, v13);
  objc_msgSend_setCompressionTypeHint_(v11, v14, self->_newChannelCompressionHint);
  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v15, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(self->_unconfiguredChannelsByCode, v17, (uint64_t)v11, v16);
  v52 = (void *)MEMORY[0x22079E258](self->_channelHandler);
  objc_msgSend_componentsSeparatedByString_(v6, v18, (uint64_t)CFSTR(":"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v19, v20, v21) == 3
    && (objc_msgSend_objectAtIndex_(v19, v22, 0),
        v23 = (void *)objc_claimAutoreleasedReturnValue(),
        isEqualToString = objc_msgSend_isEqualToString_(v23, v24, (uint64_t)CFSTR("dtxproxy")),
        v23,
        isEqualToString))
  {
    objc_msgSend_objectAtIndex_(v19, v26, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    sub_21DC94BA0(v27);
    v28 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend_objectAtIndex_(v19, v29, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    sub_21DC94BA0(v30);
    v31 = (id)objc_claimAutoreleasedReturnValue();

    v32 = 1;
  }
  else
  {
    v28 = 0;
    v31 = 0;
    v32 = 0;
  }

  v33 = v28;
  v34 = v31;
  if (v32)
  {
    v51 = v16;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v69 = 0x3032000000;
    v70 = sub_21DC8E814;
    v71 = sub_21DC8E824;
    v72 = 0;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v35 = self->_protocolHandlers;
    v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v61, v67, 16);
    if (v38)
    {
      v39 = *(_QWORD *)v62;
      while (2)
      {
        v40 = v7;
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v62 != v39)
            objc_enumerationMutation(v35);
          v42 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
          if (objc_msgSend_matchesPublishedProtocolName_peerProtocolName_(v42, v37, (uint64_t)v34, v33, v51))
          {
            objc_storeStrong((id *)(*((_QWORD *)&buf + 1) + 40), v42);
            v7 = v40;
            goto LABEL_18;
          }
        }
        v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v37, (uint64_t)&v61, v67, 16);
        v7 = v40;
        if (v38)
          continue;
        break;
      }
    }
LABEL_18:

    v16 = v51;
    if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
    {
      v58[0] = MEMORY[0x24BDAC760];
      v58[1] = 3221225472;
      v58[2] = sub_21DC926D0;
      v58[3] = &unk_24E1AAA28;
      v59 = v11;
      p_buf = &buf;
      objc_msgSend__scheduleBlock_(v59, v44, (uint64_t)v58);

    }
    else
    {
      v48 = qword_253F42648;
      if (os_log_type_enabled((os_log_t)qword_253F42648, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v65 = 138543362;
        v66 = v6;
        _os_log_impl(&dword_21DC85000, v48, OS_LOG_TYPE_ERROR, "Protocol handler unavailable for specified channel: %{public}@", v65, 0xCu);
      }
      objc_msgSend_cancel(v11, v49, v50, v51);
    }
    _Block_object_dispose(&buf, 8);

  }
  else if (v52)
  {
    v53[0] = MEMORY[0x24BDAC760];
    v53[1] = 3221225472;
    v53[2] = sub_21DC92790;
    v53[3] = &unk_24E1AB100;
    v57 = v52;
    v54 = v11;
    v55 = v6;
    v56 = self;
    objc_msgSend__scheduleBlock_(v54, v43, (uint64_t)v53);

  }
  else
  {
    v45 = qword_253F42648;
    if (os_log_type_enabled((os_log_t)qword_253F42648, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_21DC85000, v45, OS_LOG_TYPE_ERROR, "No channel handler specified; channel canceled. %{public}@",
        (uint8_t *)&buf,
        0xCu);
    }
    objc_msgSend_cancel(v11, v46, v47);
  }

  objc_autoreleasePoolPop(v7);
}

- (void)_notifyOfPublishedCapabilities:(id)a3
{
  NSDictionary **p_remoteCapabilityVersions;
  NSDictionary *remoteCapabilityVersions;
  void *v6;
  NSDictionary *v7;
  const char *v8;
  NSMutableArray *capabilityOverrideBlocks;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  int v15;
  id obj;
  _QWORD v17[4];
  id v18;

  p_remoteCapabilityVersions = &self->_remoteCapabilityVersions;
  remoteCapabilityVersions = self->_remoteCapabilityVersions;
  v6 = (void *)objc_msgSend_mutableCopy(a3, a2, (uint64_t)a3);
  v7 = p_remoteCapabilityVersions[1];
  obj = v6;
  if (v7)
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = sub_21DC928CC;
    v17[3] = &unk_24E1AB128;
    v18 = v6;
    objc_msgSend_enumerateObjectsUsingBlock_(v7, v8, (uint64_t)v17);
    capabilityOverrideBlocks = self->_capabilityOverrideBlocks;
    self->_capabilityOverrideBlocks = 0;

    v6 = obj;
  }
  objc_storeStrong((id *)p_remoteCapabilityVersions, v6);
  objc_msgSend_objectForKeyedSubscript_(*p_remoteCapabilityVersions, v10, (uint64_t)CFSTR("com.apple.private.DTXBlockCompression"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v11;
  if (v11)
    v15 = objc_msgSend_intValue(v11, v12, v13);
  else
    v15 = 0x80000000;
  self->_remoteCompressionCapabilityVersion = v15;
  if (!remoteCapabilityVersions)
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_firstMessageSem);

}

- (void)_channelCanceled:(unsigned int)a3
{
  void **p_channelsByCode;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  id v14;

  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], a2, -a3);
  p_channelsByCode = (void **)&self->_channelsByCode;
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(self->_channelsByCode, v5, (uint64_t)v14);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v8 = (void *)v6;
    objc_msgSend__scheduleMessage_toChannel_(self, v7, 0, v6);
LABEL_5:
    objc_msgSend_removeObjectForKey_(*p_channelsByCode, v9, (uint64_t)v14);

    goto LABEL_6;
  }
  p_channelsByCode = (void **)&self->_unconfiguredChannelsByCode;
  objc_msgSend_objectForKey_(self->_unconfiguredChannelsByCode, v7, (uint64_t)v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v8 = v10;
    objc_msgSend_resume(v10, v11, v12);
    objc_msgSend__scheduleMessage_toChannel_(self, v13, 0, v8);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_setTracerState:(unsigned int)a3
{
  self->_tracer = a3 != 0;
}

- (void)_receiveQueueSetCompressionHint:(unsigned int)a3 onChannel:(id)a4
{
  uint64_t v4;
  uint64_t v6;
  NSMutableDictionary *channelsByCode;
  NSMutableDictionary *unconfiguredChannelsByCode;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, void *);
  void *v13;
  unsigned int v14;

  v4 = *(_QWORD *)&a3;
  if (a4)
  {
    sub_21DC92A68(a4, *(uint64_t *)&a3);
  }
  else
  {
    v6 = MEMORY[0x24BDAC760];
    channelsByCode = self->_channelsByCode;
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = sub_21DC94BF4;
    v13 = &unk_24E1AB2D0;
    v14 = a3;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(channelsByCode, a2, (uint64_t)&v10);
    unconfiguredChannelsByCode = self->_unconfiguredChannelsByCode;
    v10 = v6;
    v11 = 3221225472;
    v12 = sub_21DC94BF4;
    v13 = &unk_24E1AB2D0;
    v14 = v4;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(unconfiguredChannelsByCode, v9, (uint64_t)&v10);
    sub_21DC92A68(self->_defaultChannel, v4);
    self->_newChannelCompressionHint = v4;
  }
}

- (void)_notifyCompressionHint:(unsigned int)a3 forChannelCode:(unsigned int)a4
{
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  const char *v11;
  char *v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v4 = *(_QWORD *)&a3;
  v17 = *MEMORY[0x24BDAC8D0];
  if (a3 - 11 > 0xFFFFFFF5)
  {
    if (a4)
    {
      objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], a2, -a4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(self->_channelsByCode, v7, (uint64_t)v6);
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        objc_msgSend_objectForKey_(self->_unconfiguredChannelsByCode, v9, (uint64_t)v6);
        v8 = objc_claimAutoreleasedReturnValue();
      }
      v11 = (const char *)v8;

      v10 = v11;
    }
    else
    {
      v10 = 0;
    }
    v12 = (char *)v10;
    objc_msgSend__receiveQueueSetCompressionHint_onChannel_(self, v10, v4, v10);

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109376;
    v14 = v4;
    v15 = 1024;
    v16 = 10;
    _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "attempted to set the compression type hint to an unknown compression method: specified=%u, max valid=%u", buf, 0xEu);
  }
}

- (void)setTracer:(BOOL)a3
{
  if (byte_253F42658)
    a3 = 1;
  self->_tracer = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (BOOL)tracer
{
  return self->_tracer;
}

- (BOOL)remoteTracer
{
  return self->_remoteTracer;
}

- (int)atomicConnectionNumber
{
  return self->_connectionIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compressor, 0);
  objc_storeStrong(&self->_channelHandler, 0);
  objc_storeStrong((id *)&self->_defaultChannel, 0);
  objc_storeStrong((id *)&self->_outgoingTransmitter, 0);
  objc_storeStrong((id *)&self->_incomingParser, 0);
  objc_storeStrong((id *)&self->_firstMessageSem, 0);
  objc_storeStrong((id *)&self->_incomingResourceTracker, 0);
  objc_storeStrong((id *)&self->_resourceTracker, 0);
  objc_storeStrong((id *)&self->_capabilityOverrideBlocks, 0);
  objc_storeStrong((id *)&self->_remoteCapabilityVersions, 0);
  objc_storeStrong((id *)&self->_localCapabilityClasses, 0);
  objc_storeStrong((id *)&self->_localCapabilityVersions, 0);
  objc_storeStrong((id *)&self->_protocolHandlers, 0);
  objc_storeStrong((id *)&self->_handlersByIdentifier, 0);
  objc_storeStrong((id *)&self->_unconfiguredChannelsByCode, 0);
  objc_storeStrong((id *)&self->_channelsByCode, 0);
  objc_storeStrong((id *)&self->_handler_queue, 0);
  objc_storeStrong((id *)&self->_receive_queue, 0);
  objc_storeStrong((id *)&self->_permittedBlockCompressors, 0);
  objc_storeStrong((id *)&self->_controlTransport, 0);
  objc_storeStrong((id *)&self->_outgoing_control_queue, 0);
  objc_storeStrong((id *)&self->_outgoing_message_queue, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (void)handleProxyRequestForInterface:(id)a3 peerInterface:(id)a4 handler:(id)a5
{
  Protocol *v8;
  id v9;
  const char *v10;
  void *v11;
  void *v12;
  const char *v13;
  Protocol *proto;

  proto = (Protocol *)a3;
  v8 = (Protocol *)a4;
  v9 = a5;
  NSStringFromProtocol(proto);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    NSStringFromProtocol(v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__handleProxyRequestForInterface_interfaceName_peerInterface_peerInterfaceName_handler_(self, v13, (uint64_t)proto, v11, v8, v12, v9);

  }
  else
  {
    objc_msgSend__handleProxyRequestForInterface_interfaceName_peerInterface_peerInterfaceName_handler_(self, v10, (uint64_t)proto, v11, 0, 0, v9);
  }

}

- (void)_handleProxyRequestForInterface:(id)a3 interfaceName:(id)a4 peerInterface:(id)a5 peerInterfaceName:(id)a6 handler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  id v19;
  NSObject *handler_queue;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  id v33;
  _QWORD block[4];
  id v35;
  id v36;
  id v37;
  id v38;
  DTXConnection *v39;
  id v40;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v19 = a7;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v17, v18);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v26, (uint64_t)a2, self, CFSTR("DTXConnection.m"), 1597, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("publishedProtocol != NULL"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v17, v18);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v27, v28, (uint64_t)a2, self, CFSTR("DTXConnection.m"), 1598, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("publishedProtocolName != nil"));

LABEL_3:
  if ((v15 == 0) != (v16 == 0))
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v17, v18);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v29, v30, (uint64_t)a2, self, CFSTR("DTXConnection.m"), 1599, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(peerProtocol == NULL) == (peerProtocolName == nil)"));

    if (v19)
      goto LABEL_5;
LABEL_9:
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v17, v18);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v31, v32, (uint64_t)a2, self, CFSTR("DTXConnection.m"), 1600, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler != NULL"));

    goto LABEL_5;
  }
  if (!v19)
    goto LABEL_9;
LABEL_5:
  handler_queue = self->_handler_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21DC930AC;
  block[3] = &unk_24E1AB150;
  v35 = v13;
  v36 = v14;
  v37 = v15;
  v38 = v16;
  v39 = self;
  v40 = v19;
  v21 = v19;
  v22 = v16;
  v23 = v15;
  v24 = v14;
  v33 = v13;
  dispatch_sync(handler_queue, block);

}

- (id)makeProxyChannelWithRemoteInterface:(id)a3 exportedInterface:(id)a4
{
  Protocol *v6;
  Protocol *v7;
  const char *v8;
  void *v9;
  void *v10;
  const char *v11;
  void *v12;

  v6 = (Protocol *)a3;
  v7 = (Protocol *)a4;
  NSStringFromProtocol(v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    NSStringFromProtocol(v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__makeProxyChannelWithRemoteInterface_remoteInterfaceName_exportedInterface_exportedInterfaceName_(self, v11, (uint64_t)v6, v9, v7, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend__makeProxyChannelWithRemoteInterface_remoteInterfaceName_exportedInterface_exportedInterfaceName_(self, v8, (uint64_t)v6, v9, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)_makeProxyChannelWithRemoteInterface:(id)a3 remoteInterfaceName:(id)a4 exportedInterface:(id)a5 exportedInterfaceName:(id)a6
{
  id v11;
  __CFString *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  void *v19;
  const char *v20;
  void *v21;
  DTXProxyChannel *v22;
  const char *v23;
  void *v24;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;

  v11 = a3;
  v12 = (__CFString *)a4;
  v13 = a5;
  v16 = (__CFString *)a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v14, v15);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v26, v27, (uint64_t)a2, self, CFSTR("DTXConnection.m"), 1628, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("remoteProtocol != NULL"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v14, v15);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v28, v29, (uint64_t)a2, self, CFSTR("DTXConnection.m"), 1629, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("remoteProtocolName != nil"));

LABEL_3:
  if ((v13 == 0) != (v16 == 0))
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v14, v15);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v30, v31, (uint64_t)a2, self, CFSTR("DTXConnection.m"), 1630, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(exportedInterface == NULL) == (exportedInterfaceName == nil)"));

  }
  v17 = CFSTR("*");
  if (v16)
    v18 = v16;
  else
    v18 = CFSTR("*");
  if (v12)
    v17 = v12;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v14, (uint64_t)CFSTR("%@:%@:%@"), CFSTR("dtxproxy"), v18, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_makeChannelWithIdentifier_(self, v20, (uint64_t)v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = [DTXProxyChannel alloc];
  v24 = (void *)objc_msgSend_initWithChannel_remoteProtocol_localProtocol_(v22, v23, (uint64_t)v21, v11, v13);

  return v24;
}

+ (void)observeDecompressionExceptionLogging:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = MEMORY[0x22079E258](a3, a2);
  v4 = (void *)qword_2553ACB18;
  qword_2553ACB18 = v3;

}

- (id)_testing_remoteCapabilityVersions
{
  return self->_remoteCapabilityVersions;
}

- (void)overridePermittedBlockCompressors:(id)a3
{
  objc_storeStrong((id *)&self->_permittedBlockCompressors, a3);
}

- (void)replaceCompressorForCompression:(id)a3
{
  objc_storeStrong((id *)&self->_compressor, a3);
}

- (void)replaceCompressorForDecompression:(id)a3
{
  DTXMessageParser *incomingParser;

  incomingParser = self->_incomingParser;
  if (incomingParser)
    MEMORY[0x24BEDD108](incomingParser, sel_replaceCompressor_, a3);
}

- (DTXChannel)defaultChannel
{
  return self->_defaultChannel;
}

@end
