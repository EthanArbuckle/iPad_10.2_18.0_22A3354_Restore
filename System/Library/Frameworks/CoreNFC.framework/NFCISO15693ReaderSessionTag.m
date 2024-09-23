@implementation NFCISO15693ReaderSessionTag

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NFCISO15693ReaderSessionTag;
  return -[NFCTag copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (BOOL)_transceiveWithData:(id)a3 receivedData:(id *)a4 commandConfig:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  unint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  unint64_t v18;
  unint64_t v19;
  id v20;
  unint64_t v21;
  void *v22;
  double v23;
  void *v25;
  id v26;

  v10 = a3;
  v11 = a5;
  v12 = objc_msgSend(v11, "maximumRetries");
  if (v12 <= +[NFCTag _MaxRetry](NFCTag, "_MaxRetry")
    && (objc_msgSend(v11, "retryInterval"),
        v14 = v13,
        +[NFCTag _MaxRetryInterval](NFCTag, "_MaxRetryInterval"),
        v14 <= v15)
    && (objc_msgSend(v11, "retryInterval"), v16 >= 0.0))
  {
    v18 = objc_msgSend(v11, "maximumRetries");
    -[NFCTag _getInternalReaderSession](self, "_getInternalReaderSession");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v19 = 0;
      v20 = 0;
      v21 = v18 + 1;
      if (v18 != -1)
      {
        while (1)
        {
          v22 = v20;
          v26 = v20;
          -[NFCTag _transceiveWithSession:sendData:receivedData:error:](self, "_transceiveWithSession:sendData:receivedData:error:", v25, v10, a4, &v26, v25);
          v20 = v26;

          if (a6)
            *a6 = objc_retainAutorelease(v20);
          if (!v20 || objc_msgSend(v20, "code") == 202)
            break;
          if (v19 < v18)
          {
            objc_msgSend(v11, "retryInterval");
            usleep((v23 * 1000000.0));
          }
          if (v21 == ++v19)
          {
            v19 = v18 + 1;
            break;
          }
        }
      }
      if (a6 && v19 == v21)
      {
        +[NFCError errorWithCode:](NFCError, "errorWithCode:", 101);
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      v17 = v20 == 0;

    }
    else if (a6)
    {
      +[NFCError errorWithCode:](NFCError, "errorWithCode:", 103);
      v17 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }

  }
  else if (a6)
  {
    +[NFCError errorWithCode:](NFCError, "errorWithCode:", 300);
    v17 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (unint64_t)_parseResponseErrorWithData:(id)a3
{
  _BYTE *v3;

  v3 = (_BYTE *)objc_msgSend(objc_retainAutorelease(a3), "bytes");
  if ((*v3 & 1) != 0)
    return v3[1];
  else
    return 0;
}

+ (id)reverseByteOrder:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = objc_retainAutorelease(a3);
  v4 = objc_msgSend(v3, "bytes");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", objc_msgSend(v3, "length"));
  v6 = objc_msgSend(v3, "length");
  if (v6 - 1 >= 0)
  {
    v7 = v6;
    v8 = v4 - 1;
    do
      objc_msgSend(v5, "appendBytes:length:", v8 + v7--, 1);
    while (v7);
  }

  return v5;
}

+ (BOOL)decodeIdentifier:(id)a3 manufacturerCode:(unint64_t *)a4 serialNumber:(id *)a5
{
  id v9;
  uint64_t v10;
  void *v12;

  v9 = a3;
  if (objc_msgSend(v9, "length") != 8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NFCISO15693ReaderSessionTag.m"), 242, CFSTR("Invalid UID length"));

  }
  v10 = objc_msgSend(v9, "length");
  if (v10 == 8)
  {
    if (a4)
      *a4 = *(unsigned __int8 *)(objc_msgSend(objc_retainAutorelease(v9), "bytes") + 1);
    if (a5)
    {
      objc_msgSend(v9, "subdataWithRange:", 2, 6);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v10 == 8;
}

- (NSData)identifier
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NFCISO15693ReaderSessionTag;
  -[NFCTag identifier](&v5, sel_identifier);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[NFCISO15693ReaderSessionTag reverseByteOrder:](NFCISO15693ReaderSessionTag, "reverseByteOrder:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (unint64_t)icManufacturerCode
{
  void *v2;
  _BOOL4 v3;
  unint64_t v5;

  v5 = 0;
  -[NFCISO15693ReaderSessionTag identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[NFCISO15693ReaderSessionTag decodeIdentifier:manufacturerCode:serialNumber:](NFCISO15693ReaderSessionTag, "decodeIdentifier:manufacturerCode:serialNumber:", v2, &v5, 0);

  if (v3)
    return v5;
  else
    return 0;
}

- (NSData)icSerialNumber
{
  void *v2;
  _BOOL4 v3;
  id v4;
  id v5;
  void *v6;
  id v8;

  -[NFCISO15693ReaderSessionTag identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v3 = +[NFCISO15693ReaderSessionTag decodeIdentifier:manufacturerCode:serialNumber:](NFCISO15693ReaderSessionTag, "decodeIdentifier:manufacturerCode:serialNumber:", v2, 0, &v8);
  v4 = v8;

  if (v3)
    v5 = v4;
  else
    v5 = (id)objc_opt_new();
  v6 = v5;

  return (NSData *)v6;
}

- (id)_parseResponseData:(id)a3 outError:(id *)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = -[NFCISO15693ReaderSessionTag _parseResponseErrorWithData:](self, "_parseResponseErrorWithData:", v6);
  if (v7)
  {
    if (a4)
    {
      v13 = CFSTR("ISO15693TagResponseErrorCode");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[NFCError errorWithCode:userInfo:](NFCError, "errorWithCode:userInfo:", 102, v9);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v10 = objc_opt_new();
  }
  else
  {
    if (a4)
      *a4 = 0;
    objc_msgSend(v6, "subdataWithRange:", 1, objc_msgSend(v6, "length") - 1);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;

  return v11;
}

- (void)sendCustomCommandWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t Logger;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  const char *v19;
  const char *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void (*v25)(uint64_t, const char *, ...);
  objc_class *v26;
  _BOOL4 v27;
  uint64_t v28;
  NSObject *v29;
  objc_class *v30;
  int v31;
  const char *v32;
  const char *v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  void (*v38)(uint64_t, const char *, ...);
  objc_class *v39;
  _BOOL4 v40;
  id v41;
  void *v42;
  id v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  NSObject *v47;
  objc_class *v48;
  int v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  id v53;
  id v54;
  id v55;
  const char *v56;
  const char *v57;
  const char *Name;
  const char *v59;
  uint64_t v60;
  const char *sel;
  _QWORD v62[4];
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  _BYTE state[18];
  __int16 v71;
  const char *v72;
  __int16 v73;
  int v74;
  __int16 v75;
  id v76;
  __int16 v77;
  uint64_t v78;
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = _os_activity_create(&dword_215BBD000, "NFCISO15693ReaderSessionTag sendCustomCommandWithConfiguration:completionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  *(_QWORD *)state = 0;
  *(_QWORD *)&state[8] = 0;
  os_activity_scope_enter(v9, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  Logger = NFLogGetLogger();
  if (Logger)
  {
    v11 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v15 = 45;
    if (isMetaClass)
      v15 = 43;
    v11(6, "%c[%{public}s %{public}s]:%i ", v15, ClassName, Name, 303);
  }
  NFSharedLogGetLogger();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = object_getClass(self);
    if (class_isMetaClass(v17))
      v18 = 43;
    else
      v18 = 45;
    v19 = object_getClassName(self);
    v20 = sel_getName(a2);
    *(_DWORD *)state = 67109890;
    *(_DWORD *)&state[4] = v18;
    *(_WORD *)&state[8] = 2082;
    *(_QWORD *)&state[10] = v19;
    v71 = 2082;
    v72 = v20;
    v73 = 1024;
    v74 = 303;
    _os_log_impl(&dword_215BBD000, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", state, 0x22u);
  }

  v69 = 0;
  objc_msgSend(v7, "asNSDataWithError:", &v69);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v69;
  if (v22)
  {
    v23 = v22;
    v24 = NFLogGetLogger();
    if (v24)
    {
      v25 = (void (*)(uint64_t, const char *, ...))v24;
      v26 = object_getClass(self);
      v27 = class_isMetaClass(v26);
      v56 = object_getClassName(self);
      v59 = sel_getName(a2);
      v28 = 45;
      if (v27)
        v28 = 43;
      v25(3, "%c[%{public}s %{public}s]:%i %@ in commandConfiguration asNSDataWithError", v28, v56, v59, 320, v23);
    }
    NFSharedLogGetLogger();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = object_getClass(self);
      if (class_isMetaClass(v30))
        v31 = 43;
      else
        v31 = 45;
      v32 = object_getClassName(self);
      v33 = sel_getName(a2);
      *(_DWORD *)state = 67110146;
      *(_DWORD *)&state[4] = v31;
      *(_WORD *)&state[8] = 2082;
      *(_QWORD *)&state[10] = v32;
      v71 = 2082;
      v72 = v33;
      v73 = 1024;
      v74 = 320;
      v75 = 2112;
      v76 = v23;
      _os_log_impl(&dword_215BBD000, v29, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %@ in commandConfiguration asNSDataWithError", state, 0x2Cu);
    }

    v34 = 0;
    v35 = 0;
  }
  else
  {
    v67 = 0;
    v68 = 0;
    -[NFCISO15693ReaderSessionTag _transceiveWithData:receivedData:commandConfig:error:](self, "_transceiveWithData:receivedData:commandConfig:error:", v21, &v68, v7, &v67);
    v35 = v68;
    v36 = v67;
    if (v36 || (unint64_t)objc_msgSend(v35, "length") < 2)
    {
      sel = a2;
      +[NFCError errorWithCode:](NFCError, "errorWithCode:", 100);
      v23 = (id)objc_claimAutoreleasedReturnValue();

      v37 = NFLogGetLogger();
      if (v37)
      {
        v38 = (void (*)(uint64_t, const char *, ...))v37;
        v39 = object_getClass(self);
        v40 = class_isMetaClass(v39);
        v41 = v7;
        v42 = v21;
        v43 = v8;
        v44 = object_getClassName(self);
        v45 = sel_getName(sel);
        v60 = objc_msgSend(v35, "length");
        v46 = 45;
        if (v40)
          v46 = 43;
        v57 = v44;
        v8 = v43;
        v21 = v42;
        v7 = v41;
        v38(3, "%c[%{public}s %{public}s]:%i %@ with response length = %lu", v46, v57, v45, 316, v23, v60);
      }
      NFSharedLogGetLogger();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        v48 = object_getClass(self);
        if (class_isMetaClass(v48))
          v49 = 43;
        else
          v49 = 45;
        v50 = object_getClassName(self);
        v51 = sel_getName(sel);
        v52 = objc_msgSend(v35, "length");
        *(_DWORD *)state = 67110402;
        *(_DWORD *)&state[4] = v49;
        *(_WORD *)&state[8] = 2082;
        *(_QWORD *)&state[10] = v50;
        v71 = 2082;
        v72 = v51;
        v73 = 1024;
        v74 = 316;
        v75 = 2112;
        v76 = v23;
        v77 = 2048;
        v78 = v52;
        _os_log_impl(&dword_215BBD000, v47, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %@ with response length = %lu", state, 0x36u);
      }

      v34 = 0;
    }
    else
    {
      v66 = 0;
      -[NFCISO15693ReaderSessionTag _parseResponseData:outError:](self, "_parseResponseData:outError:", v35, &v66);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v66;
    }
  }
  v62[0] = MEMORY[0x24BDAC760];
  v62[1] = 3221225472;
  v62[2] = __84__NFCISO15693ReaderSessionTag_sendCustomCommandWithConfiguration_completionHandler___block_invoke;
  v62[3] = &unk_24D44F8D8;
  v64 = v23;
  v65 = v8;
  v63 = v34;
  v53 = v23;
  v54 = v34;
  v55 = v8;
  -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v62);

}

uint64_t __84__NFCISO15693ReaderSessionTag_sendCustomCommandWithConfiguration_completionHandler___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)readMultipleBlocksWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t Logger;
  void (*v12)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  const char *v20;
  const char *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void (*v26)(uint64_t, const char *, ...);
  objc_class *v27;
  _BOOL4 v28;
  uint64_t v29;
  NSObject *v30;
  objc_class *v31;
  void *v32;
  int v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  uint64_t v40;
  id v41;
  unint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(uint64_t, const char *, ...);
  objc_class *v48;
  _BOOL4 v49;
  uint64_t v50;
  NSObject *v51;
  objc_class *v52;
  int v53;
  const char *v54;
  const char *v55;
  id v56;
  id v57;
  id v58;
  const char *v59;
  const char *v60;
  const char *Name;
  const char *v62;
  const char *v63;
  void *v64;
  id v65;
  const char *sel;
  void *v67;
  void *v68;
  _QWORD v69[4];
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  id v79;
  objc_super v80;
  _BYTE state[18];
  __int16 v82;
  const char *v83;
  __int16 v84;
  int v85;
  __int16 v86;
  id v87;
  const __CFString *v88;
  void *v89;
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = _os_activity_create(&dword_215BBD000, "NFCISO15693ReaderSessionTag readMultipleBlocksWithConfiguration:completionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  *(_QWORD *)state = 0;
  *(_QWORD *)&state[8] = 0;
  os_activity_scope_enter(v9, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  v10 = (void *)objc_opt_new();
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v12 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v16 = 45;
    if (isMetaClass)
      v16 = 43;
    v12(6, "%c[%{public}s %{public}s]:%i ", v16, ClassName, Name, 336);
  }
  NFSharedLogGetLogger();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = object_getClass(self);
    if (class_isMetaClass(v18))
      v19 = 43;
    else
      v19 = 45;
    v20 = object_getClassName(self);
    v21 = sel_getName(a2);
    *(_DWORD *)state = 67109890;
    *(_DWORD *)&state[4] = v19;
    *(_WORD *)&state[8] = 2082;
    *(_QWORD *)&state[10] = v20;
    v82 = 2082;
    v83 = v21;
    v84 = 1024;
    v85 = 336;
    _os_log_impl(&dword_215BBD000, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", state, 0x22u);
  }

  v80.receiver = self;
  v80.super_class = (Class)NFCISO15693ReaderSessionTag;
  -[NFCTag identifier](&v80, sel_identifier);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = 0;
  objc_msgSend(v7, "asNSDataArrayWithUID:error:", v22, &v79);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v79;

  v68 = v7;
  if (v24)
  {
    v25 = NFLogGetLogger();
    if (v25)
    {
      v26 = (void (*)(uint64_t, const char *, ...))v25;
      v27 = object_getClass(self);
      v28 = class_isMetaClass(v27);
      v59 = object_getClassName(self);
      v62 = sel_getName(a2);
      v29 = 45;
      if (v28)
        v29 = 43;
      v26(3, "%c[%{public}s %{public}s]:%i %@ in readConfiguration asNSDataArrayWithUID", v29, v59, v62, 366, v24);
    }
    NFSharedLogGetLogger();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = object_getClass(self);
      v32 = v23;
      if (class_isMetaClass(v31))
        v33 = 43;
      else
        v33 = 45;
      v34 = object_getClassName(self);
      v35 = sel_getName(a2);
      *(_DWORD *)state = 67110146;
      *(_DWORD *)&state[4] = v33;
      v23 = v32;
      *(_WORD *)&state[8] = 2082;
      *(_QWORD *)&state[10] = v34;
      v82 = 2082;
      v83 = v35;
      v84 = 1024;
      v85 = 366;
      v86 = 2112;
      v87 = v24;
      _os_log_impl(&dword_215BBD000, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %@ in readConfiguration asNSDataArrayWithUID", state, 0x2Cu);
    }
  }
  else
  {
    sel = a2;
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v30 = v23;
    v36 = -[NSObject countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v75, v90, 16);
    if (v36)
    {
      v37 = v36;
      v64 = v23;
      v65 = v8;
      v67 = v10;
      v38 = *(_QWORD *)v76;
      while (2)
      {
        for (i = 0; i != v37; ++i)
        {
          if (*(_QWORD *)v76 != v38)
            objc_enumerationMutation(v30);
          v40 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * i);
          v73 = 0;
          v74 = 0;
          -[NFCISO15693ReaderSessionTag _transceiveWithData:receivedData:commandConfig:error:](self, "_transceiveWithData:receivedData:commandConfig:error:", v40, &v74, v7, &v73);
          v41 = v74;
          v24 = v73;
          if ((unint64_t)objc_msgSend(v41, "length") >= 2)
          {
            v42 = -[NFCISO15693ReaderSessionTag _parseResponseErrorWithData:](self, "_parseResponseErrorWithData:", v41);
            if (v42)
            {
              v88 = CFSTR("ISO15693TagResponseErrorCode");
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v42);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v89 = v43;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              +[NFCError errorWithCode:userInfo:](NFCError, "errorWithCode:userInfo:", 102, v44);
              v45 = objc_claimAutoreleasedReturnValue();

              v7 = v68;
              v24 = (id)v45;
            }
            else
            {
              objc_msgSend(v41, "subdataWithRange:", 1, objc_msgSend(v41, "length") - 1);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "appendData:", v43);
            }

          }
          if (v24)
          {
            v46 = NFLogGetLogger();
            if (v46)
            {
              v47 = (void (*)(uint64_t, const char *, ...))v46;
              v48 = object_getClass(self);
              v49 = class_isMetaClass(v48);
              v60 = object_getClassName(self);
              v63 = sel_getName(sel);
              v50 = 45;
              if (v49)
                v50 = 43;
              v47(3, "%c[%{public}s %{public}s]:%i %@", v50, v60, v63, 360, v24);
            }
            NFSharedLogGetLogger();
            v51 = objc_claimAutoreleasedReturnValue();
            v10 = v67;
            if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            {
              v52 = object_getClass(self);
              if (class_isMetaClass(v52))
                v53 = 43;
              else
                v53 = 45;
              v54 = object_getClassName(self);
              v55 = sel_getName(sel);
              *(_DWORD *)state = 67110146;
              *(_DWORD *)&state[4] = v53;
              *(_WORD *)&state[8] = 2082;
              *(_QWORD *)&state[10] = v54;
              v82 = 2082;
              v83 = v55;
              v84 = 1024;
              v85 = 360;
              v86 = 2112;
              v87 = v24;
              _os_log_impl(&dword_215BBD000, v51, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %@", state, 0x2Cu);
            }

            v23 = v64;
            v8 = v65;
            goto LABEL_45;
          }

        }
        v37 = -[NSObject countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v75, v90, 16);
        if (v37)
          continue;
        break;
      }
      v24 = 0;
      v23 = v64;
      v8 = v65;
      v10 = v67;
    }
    else
    {
      v24 = 0;
    }
  }
LABEL_45:

  v69[0] = MEMORY[0x24BDAC760];
  v69[1] = 3221225472;
  v69[2] = __85__NFCISO15693ReaderSessionTag_readMultipleBlocksWithConfiguration_completionHandler___block_invoke;
  v69[3] = &unk_24D44F8D8;
  v71 = v24;
  v72 = v8;
  v70 = v10;
  v56 = v24;
  v57 = v10;
  v58 = v8;
  -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v69);

}

void __85__NFCISO15693ReaderSessionTag_readMultipleBlocksWithConfiguration_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(a1 + 40));

}

- (void)stayQuietWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __62__NFCISO15693ReaderSessionTag_stayQuietWithCompletionHandler___block_invoke;
  v6[3] = &unk_24D44F8B0;
  v7 = v4;
  v5 = v4;
  -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v6);

}

void __62__NFCISO15693ReaderSessionTag_stayQuietWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)readSingleBlockWithRequestFlags:(unsigned __int8)a3 blockNumber:(unsigned __int8)a4 completionHandler:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a5;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __93__NFCISO15693ReaderSessionTag_readSingleBlockWithRequestFlags_blockNumber_completionHandler___block_invoke;
  v8[3] = &unk_24D44F8B0;
  v9 = v6;
  v7 = v6;
  -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v8);

}

void __93__NFCISO15693ReaderSessionTag_readSingleBlockWithRequestFlags_blockNumber_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3 = (id)objc_opt_new();
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v3, v2);

}

- (void)writeSingleBlockWithRequestFlags:(unsigned __int8)a3 blockNumber:(unsigned __int8)a4 dataBlock:(id)a5 completionHandler:(id)a6
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v7 = a6;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __104__NFCISO15693ReaderSessionTag_writeSingleBlockWithRequestFlags_blockNumber_dataBlock_completionHandler___block_invoke;
  v9[3] = &unk_24D44F8B0;
  v10 = v7;
  v8 = v7;
  -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v9);

}

void __104__NFCISO15693ReaderSessionTag_writeSingleBlockWithRequestFlags_blockNumber_dataBlock_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)lockBlockWithRequestFlags:(unsigned __int8)a3 blockNumber:(unsigned __int8)a4 completionHandler:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a5;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __87__NFCISO15693ReaderSessionTag_lockBlockWithRequestFlags_blockNumber_completionHandler___block_invoke;
  v8[3] = &unk_24D44F8B0;
  v9 = v6;
  v7 = v6;
  -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v8);

}

void __87__NFCISO15693ReaderSessionTag_lockBlockWithRequestFlags_blockNumber_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)readMultipleBlocksWithRequestFlags:(unsigned __int8)a3 blockRange:(_NSRange)a4 completionHandler:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a5;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __95__NFCISO15693ReaderSessionTag_readMultipleBlocksWithRequestFlags_blockRange_completionHandler___block_invoke;
  v8[3] = &unk_24D44F8B0;
  v9 = v6;
  v7 = v6;
  -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v8);

}

void __95__NFCISO15693ReaderSessionTag_readMultipleBlocksWithRequestFlags_blockRange_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3 = (id)objc_opt_new();
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v3, v2);

}

- (void)writeMultipleBlocksWithRequestFlags:(unsigned __int8)a3 blockRange:(_NSRange)a4 dataBlocks:(id)a5 completionHandler:(id)a6
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v7 = a6;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __107__NFCISO15693ReaderSessionTag_writeMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke;
  v9[3] = &unk_24D44F8B0;
  v10 = v7;
  v8 = v7;
  -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v9);

}

void __107__NFCISO15693ReaderSessionTag_writeMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)selectWithRequestFlags:(unsigned __int8)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__NFCISO15693ReaderSessionTag_selectWithRequestFlags_completionHandler___block_invoke;
  v7[3] = &unk_24D44F8B0;
  v8 = v5;
  v6 = v5;
  -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v7);

}

void __72__NFCISO15693ReaderSessionTag_selectWithRequestFlags_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)resetToReadyWithRequestFlags:(unsigned __int8)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __78__NFCISO15693ReaderSessionTag_resetToReadyWithRequestFlags_completionHandler___block_invoke;
  v7[3] = &unk_24D44F8B0;
  v8 = v5;
  v6 = v5;
  -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v7);

}

void __78__NFCISO15693ReaderSessionTag_resetToReadyWithRequestFlags_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)writeAFIWithRequestFlag:(unsigned __int8)a3 afi:(unsigned __int8)a4 completionHandler:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a5;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __77__NFCISO15693ReaderSessionTag_writeAFIWithRequestFlag_afi_completionHandler___block_invoke;
  v8[3] = &unk_24D44F8B0;
  v9 = v6;
  v7 = v6;
  -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v8);

}

void __77__NFCISO15693ReaderSessionTag_writeAFIWithRequestFlag_afi_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)lockAFIWithRequestFlag:(unsigned __int8)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__NFCISO15693ReaderSessionTag_lockAFIWithRequestFlag_completionHandler___block_invoke;
  v7[3] = &unk_24D44F8B0;
  v8 = v5;
  v6 = v5;
  -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v7);

}

void __72__NFCISO15693ReaderSessionTag_lockAFIWithRequestFlag_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)writeDSFIDWithRequestFlag:(unsigned __int8)a3 dsfid:(unsigned __int8)a4 completionHandler:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a5;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __81__NFCISO15693ReaderSessionTag_writeDSFIDWithRequestFlag_dsfid_completionHandler___block_invoke;
  v8[3] = &unk_24D44F8B0;
  v9 = v6;
  v7 = v6;
  -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v8);

}

void __81__NFCISO15693ReaderSessionTag_writeDSFIDWithRequestFlag_dsfid_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)lockDFSIDWithRequestFlag:(unsigned __int8)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __74__NFCISO15693ReaderSessionTag_lockDFSIDWithRequestFlag_completionHandler___block_invoke;
  v7[3] = &unk_24D44F8B0;
  v8 = v5;
  v6 = v5;
  -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v7);

}

void __74__NFCISO15693ReaderSessionTag_lockDFSIDWithRequestFlag_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)lockDSFIDWithRequestFlag:(unsigned __int8)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __74__NFCISO15693ReaderSessionTag_lockDSFIDWithRequestFlag_completionHandler___block_invoke;
  v7[3] = &unk_24D44F8B0;
  v8 = v5;
  v6 = v5;
  -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v7);

}

void __74__NFCISO15693ReaderSessionTag_lockDSFIDWithRequestFlag_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)getSystemInfoWithRequestFlag:(unsigned __int8)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __78__NFCISO15693ReaderSessionTag_getSystemInfoWithRequestFlag_completionHandler___block_invoke;
  v7[3] = &unk_24D44F8B0;
  v8 = v5;
  v6 = v5;
  -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v7);

}

void __78__NFCISO15693ReaderSessionTag_getSystemInfoWithRequestFlag_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id))(v1 + 16))(v1, -1, -1, -1, -1, -1, v2);

}

- (void)getSystemInfoAndUIDWithRequestFlag:(unsigned __int8)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __84__NFCISO15693ReaderSessionTag_getSystemInfoAndUIDWithRequestFlag_completionHandler___block_invoke;
  v7[3] = &unk_24D44F8B0;
  v8 = v5;
  v6 = v5;
  -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v7);

}

void __84__NFCISO15693ReaderSessionTag_getSystemInfoAndUIDWithRequestFlag_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id))(v1 + 16))(v1, 0, -1, -1, -1, -1, -1, v2);

}

- (void)getMultipleBlockSecurityStatusWithRequestFlag:(unsigned __int8)a3 blockRange:(_NSRange)a4 completionHandler:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a5;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __106__NFCISO15693ReaderSessionTag_getMultipleBlockSecurityStatusWithRequestFlag_blockRange_completionHandler___block_invoke;
  v8[3] = &unk_24D44F8B0;
  v9 = v6;
  v7 = v6;
  -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v8);

}

void __106__NFCISO15693ReaderSessionTag_getMultipleBlockSecurityStatusWithRequestFlag_blockRange_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3 = (id)objc_opt_new();
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v3, v2);

}

- (void)fastReadMultipleBlocksWithRequestFlag:(unsigned __int8)a3 blockRange:(_NSRange)a4 completionHandler:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a5;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __98__NFCISO15693ReaderSessionTag_fastReadMultipleBlocksWithRequestFlag_blockRange_completionHandler___block_invoke;
  v8[3] = &unk_24D44F8B0;
  v9 = v6;
  v7 = v6;
  -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v8);

}

void __98__NFCISO15693ReaderSessionTag_fastReadMultipleBlocksWithRequestFlag_blockRange_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3 = (id)objc_opt_new();
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v3, v2);

}

- (void)customCommandWithRequestFlag:(unsigned __int8)a3 customCommandCode:(int64_t)a4 customRequestParameters:(id)a5 completionHandler:(id)a6
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v7 = a6;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __120__NFCISO15693ReaderSessionTag_customCommandWithRequestFlag_customCommandCode_customRequestParameters_completionHandler___block_invoke;
  v9[3] = &unk_24D44F8B0;
  v10 = v7;
  v8 = v7;
  -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v9);

}

void __120__NFCISO15693ReaderSessionTag_customCommandWithRequestFlag_customCommandCode_customRequestParameters_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3 = (id)objc_opt_new();
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v3, v2);

}

- (void)extendedReadSingleBlockWithRequestFlags:(unsigned __int8)a3 blockNumber:(int64_t)a4 completionHandler:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a5;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __101__NFCISO15693ReaderSessionTag_extendedReadSingleBlockWithRequestFlags_blockNumber_completionHandler___block_invoke;
  v8[3] = &unk_24D44F8B0;
  v9 = v6;
  v7 = v6;
  -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v8);

}

void __101__NFCISO15693ReaderSessionTag_extendedReadSingleBlockWithRequestFlags_blockNumber_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3 = (id)objc_opt_new();
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v3, v2);

}

- (void)extendedWriteSingleBlockWithRequestFlags:(unsigned __int8)a3 blockNumber:(int64_t)a4 dataBlock:(id)a5 completionHandler:(id)a6
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v7 = a6;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __112__NFCISO15693ReaderSessionTag_extendedWriteSingleBlockWithRequestFlags_blockNumber_dataBlock_completionHandler___block_invoke;
  v9[3] = &unk_24D44F8B0;
  v10 = v7;
  v8 = v7;
  -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v9);

}

void __112__NFCISO15693ReaderSessionTag_extendedWriteSingleBlockWithRequestFlags_blockNumber_dataBlock_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)extendedLockBlockWithRequestFlags:(unsigned __int8)a3 blockNumber:(int64_t)a4 completionHandler:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a5;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __95__NFCISO15693ReaderSessionTag_extendedLockBlockWithRequestFlags_blockNumber_completionHandler___block_invoke;
  v8[3] = &unk_24D44F8B0;
  v9 = v6;
  v7 = v6;
  -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v8);

}

void __95__NFCISO15693ReaderSessionTag_extendedLockBlockWithRequestFlags_blockNumber_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)extendedReadMultipleBlocksWithRequestFlags:(unsigned __int8)a3 blockRange:(_NSRange)a4 completionHandler:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a5;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __103__NFCISO15693ReaderSessionTag_extendedReadMultipleBlocksWithRequestFlags_blockRange_completionHandler___block_invoke;
  v8[3] = &unk_24D44F8B0;
  v9 = v6;
  v7 = v6;
  -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v8);

}

void __103__NFCISO15693ReaderSessionTag_extendedReadMultipleBlocksWithRequestFlags_blockRange_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3 = (id)objc_opt_new();
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v3, v2);

}

- (void)extendedWriteMultipleBlocksWithRequestFlags:(unsigned __int8)a3 blockRange:(_NSRange)a4 dataBlocks:(id)a5 completionHandler:(id)a6
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v7 = a6;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __115__NFCISO15693ReaderSessionTag_extendedWriteMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke;
  v9[3] = &unk_24D44F8B0;
  v10 = v7;
  v8 = v7;
  -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v9);

}

void __115__NFCISO15693ReaderSessionTag_extendedWriteMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)authenticateWithRequestFlags:(unsigned __int8)a3 cryptoSuiteIdentifier:(int64_t)a4 message:(id)a5 completionHandler:(id)a6
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v7 = a6;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __108__NFCISO15693ReaderSessionTag_authenticateWithRequestFlags_cryptoSuiteIdentifier_message_completionHandler___block_invoke;
  v9[3] = &unk_24D44F8B0;
  v10 = v7;
  v8 = v7;
  -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v9);

}

void __108__NFCISO15693ReaderSessionTag_authenticateWithRequestFlags_cryptoSuiteIdentifier_message_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3 = (id)objc_opt_new();
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id, void *))(v1 + 16))(v1, 0, v3, v2);

}

- (void)keyUpdateWithRequestFlags:(unsigned __int8)a3 keyIdentifier:(int64_t)a4 message:(id)a5 completionHandler:(id)a6
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v7 = a6;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __97__NFCISO15693ReaderSessionTag_keyUpdateWithRequestFlags_keyIdentifier_message_completionHandler___block_invoke;
  v9[3] = &unk_24D44F8B0;
  v10 = v7;
  v8 = v7;
  -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v9);

}

void __97__NFCISO15693ReaderSessionTag_keyUpdateWithRequestFlags_keyIdentifier_message_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3 = (id)objc_opt_new();
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id, void *))(v1 + 16))(v1, 0, v3, v2);

}

- (void)challengeWithRequestFlags:(unsigned __int8)a3 cryptoSuiteIdentifier:(int64_t)a4 message:(id)a5 completionHandler:(id)a6
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v7 = a6;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __105__NFCISO15693ReaderSessionTag_challengeWithRequestFlags_cryptoSuiteIdentifier_message_completionHandler___block_invoke;
  v9[3] = &unk_24D44F8B0;
  v10 = v7;
  v8 = v7;
  -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v9);

}

void __105__NFCISO15693ReaderSessionTag_challengeWithRequestFlags_cryptoSuiteIdentifier_message_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)readBufferWithRequestFlags:(unsigned __int8)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __76__NFCISO15693ReaderSessionTag_readBufferWithRequestFlags_completionHandler___block_invoke;
  v7[3] = &unk_24D44F8B0;
  v8 = v5;
  v6 = v5;
  -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v7);

}

void __76__NFCISO15693ReaderSessionTag_readBufferWithRequestFlags_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3 = (id)objc_opt_new();
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id, void *))(v1 + 16))(v1, 0, v3, v2);

}

- (void)extendedGetMultipleBlockSecurityStatusWithRequestFlag:(unsigned __int8)a3 blockRange:(_NSRange)a4 completionHandler:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a5;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __114__NFCISO15693ReaderSessionTag_extendedGetMultipleBlockSecurityStatusWithRequestFlag_blockRange_completionHandler___block_invoke;
  v8[3] = &unk_24D44F8B0;
  v9 = v6;
  v7 = v6;
  -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v8);

}

void __114__NFCISO15693ReaderSessionTag_extendedGetMultipleBlockSecurityStatusWithRequestFlag_blockRange_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3 = (id)objc_opt_new();
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v3, v2);

}

- (void)extendedFastReadMultipleBlocksWithRequestFlag:(unsigned __int8)a3 blockRange:(_NSRange)a4 completionHandler:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a5;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __106__NFCISO15693ReaderSessionTag_extendedFastReadMultipleBlocksWithRequestFlag_blockRange_completionHandler___block_invoke;
  v8[3] = &unk_24D44F8B0;
  v9 = v6;
  v7 = v6;
  -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v8);

}

void __106__NFCISO15693ReaderSessionTag_extendedFastReadMultipleBlocksWithRequestFlag_blockRange_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3 = (id)objc_opt_new();
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v3, v2);

}

- (void)sendRequestWithFlag:(int64_t)a3 commandCode:(int64_t)a4 data:(id)a5 completionHandler:(id)a6
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v7 = a6;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __86__NFCISO15693ReaderSessionTag_sendRequestWithFlag_commandCode_data_completionHandler___block_invoke;
  v9[3] = &unk_24D44F8B0;
  v10 = v7;
  v8 = v7;
  -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v9);

}

void __86__NFCISO15693ReaderSessionTag_sendRequestWithFlag_commandCode_data_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v1 + 16))(v1, 0, 0, v2);

}

@end
