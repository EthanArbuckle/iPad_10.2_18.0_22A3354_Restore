@implementation NFCNDEFReaderSession

- (NFCNDEFReaderSession)initWithDelegate:(id)a3 sessionDelegateType:(int64_t)a4 queue:(id)a5 pollMethod:(unint64_t)a6 sessionConfig:(unint64_t)a7
{
  id v8;
  id v9;
  id v10;

  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("Unavailable initializer"), CFSTR("Not available"), 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v10);
}

- (void)didTerminate:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NFCNDEFReaderSession;
  -[NFCReaderSession didTerminate:](&v3, sel_didTerminate_, a3);
}

- (void)didDetectNDEFMessages:(id)a3 fromTags:(id)a4 connectedTagIndex:(unint64_t)a5 updateUICallback:(id)a6
{
  id v11;
  id v12;
  void (**v13)(id, _QWORD);
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  NFCNDEFTag *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  int v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  unint64_t v39;
  unint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  int v47;
  void *v48;
  void *v49;
  unint64_t v50;
  NFCNDEFPayload *v51;
  void *v52;
  unint64_t v53;
  NFCNDEFMessage *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t Logger;
  void (*v60)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  BOOL v64;
  uint64_t v65;
  NSObject *v66;
  objc_class *v67;
  int v68;
  const char *v69;
  const char *v70;
  const char *Name;
  NFCNDEFReaderSession *v72;
  id v73;
  id v74;
  void *v75;
  id obj;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  _QWORD v84[5];
  id v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _QWORD v90[5];
  id v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  uint8_t v96[128];
  uint8_t buf[4];
  int v98;
  __int16 v99;
  const char *v100;
  __int16 v101;
  const char *v102;
  __int16 v103;
  int v104;
  _BYTE v105[128];
  uint64_t v106;

  v106 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = (void (**)(id, _QWORD))a6;
  v74 = v13;
  v75 = v12;
  if (-[NFCReaderSession delegateType](self, "delegateType") == 5)
  {
    v14 = v11;
    v13[2](v13, 0);
    -[NFCReaderSession didDetectTags:connectedTagIndex:](self, "didDetectTags:connectedTagIndex:", v12, a5);
    v15 = (void *)objc_opt_new();
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    v16 = v12;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v92, v105, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v93;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v93 != v19)
            objc_enumerationMutation(v16);
          v21 = -[NFCNDEFTag initWithSession:tag:startupConfig:]([NFCNDEFTag alloc], "initWithSession:tag:startupConfig:", self, *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * i), 0);
          objc_msgSend(v15, "addObject:", v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v92, v105, 16);
      }
      while (v18);
    }

    v22 = v15;
    if (objc_msgSend(v15, "count"))
    {
      v90[0] = MEMORY[0x24BDAC760];
      v90[1] = 3221225472;
      v90[2] = __90__NFCNDEFReaderSession_didDetectNDEFMessages_fromTags_connectedTagIndex_updateUICallback___block_invoke;
      v90[3] = &unk_24D44FAF0;
      v90[4] = self;
      v22 = v15;
      v91 = v22;
      -[NFCReaderSession submitBlockOnDelegateQueue:](self, "submitBlockOnDelegateQueue:", v90);

    }
    else
    {
      Logger = NFLogGetLogger();
      if (Logger)
      {
        v60 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v64 = !isMetaClass;
        v22 = v15;
        v65 = 45;
        if (!v64)
          v65 = 43;
        v60(4, "%c[%{public}s %{public}s]:%i No suitable NDEF tag found", v65, ClassName, Name, 75);
      }
      NFSharedLogGetLogger();
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        v67 = object_getClass(self);
        if (class_isMetaClass(v67))
          v68 = 43;
        else
          v68 = 45;
        v69 = object_getClassName(self);
        v70 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v98 = v68;
        v99 = 2082;
        v100 = v69;
        v22 = v15;
        v101 = 2082;
        v102 = v70;
        v103 = 1024;
        v104 = 75;
        _os_log_impl(&dword_215BBD000, v66, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i No suitable NDEF tag found", buf, 0x22u);
      }

    }
    v58 = v74;
    v57 = v75;
  }
  else
  {
    v72 = self;
    v77 = (void *)objc_opt_new();
    v13[2](v13, 1);
    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    v73 = v11;
    obj = v11;
    v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v96, 16);
    if (v79)
    {
      v78 = *(_QWORD *)v87;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v87 != v78)
            objc_enumerationMutation(obj);
          v80 = v23;
          v24 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v23);
          v81 = (void *)objc_opt_new();
          objc_msgSend(v24, "records");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "count");

          if (v26)
          {
            v27 = 0;
            v28 = 0;
            do
            {
              objc_msgSend(v24, "records");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "objectAtIndexedSubscript:", v27);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              v31 = objc_msgSend(v30, "typeNameFormat");
              objc_msgSend(v30, "type");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "identifier");
              v33 = objc_claimAutoreleasedReturnValue();
              v34 = objc_alloc(MEMORY[0x24BDBCEC8]);
              objc_msgSend(v30, "payload");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = (void *)objc_msgSend(v34, "initWithData:", v35);

              v83 = (void *)v33;
              if (objc_msgSend(v30, "chunked") && objc_msgSend(v32, "length"))
              {
                v37 = v28 + 1;
                objc_msgSend(v24, "records");
                v82 = v36;
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = objc_msgSend(v38, "count");

                v36 = v82;
                if (v39 > v28 + 1)
                {
                  v40 = v37;
                  while (1)
                  {
                    objc_msgSend(v24, "records");
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v41, "objectAtIndexedSubscript:", v40);
                    v42 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v42, "identifier");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v43, "length"))
                      goto LABEL_32;
                    v44 = v24;
                    objc_msgSend(v42, "type");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v45, "length"))
                    {

                      v24 = v44;
LABEL_32:

                      goto LABEL_36;
                    }
                    v46 = v31;
                    v47 = objc_msgSend(v42, "typeNameFormat");

                    if (v47 != 6)
                    {
                      v24 = v44;
                      goto LABEL_35;
                    }
                    objc_msgSend(v42, "payload");
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v82, "appendData:", v48);

                    v24 = v44;
                    if ((objc_msgSend(v42, "chunked") & 1) == 0)
                      break;

                    ++v40;
                    objc_msgSend(v44, "records");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    v50 = objc_msgSend(v49, "count");

                    ++v28;
                    v31 = v46;
                    if (v50 <= v40)
                    {
                      v37 = v28 + 1;
                      goto LABEL_37;
                    }
                  }
                  ++v28;
LABEL_35:
                  v31 = v46;
LABEL_36:

                  v37 = v28;
LABEL_37:
                  v36 = v82;
                }
              }
              else
              {
                v37 = v28;
              }
              v51 = -[NFCNDEFPayload initWithFormat:type:identifier:payload:chunkSize:]([NFCNDEFPayload alloc], "initWithFormat:type:identifier:payload:chunkSize:", v31, v32, v83, v36, 0);
              objc_msgSend(v81, "addObject:", v51);

              v28 = v37 + 1;
              v27 = v37 + 1;
              objc_msgSend(v24, "records");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v53 = objc_msgSend(v52, "count");

            }
            while (v53 > v27);
          }
          v54 = -[NFCNDEFMessage initWithNDEFRecords:]([NFCNDEFMessage alloc], "initWithNDEFRecords:", v81);
          -[NFCNDEFMessage records](v54, "records");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v55, "count");

          if (v56)
            objc_msgSend(v77, "addObject:", v54);

          v23 = v80 + 1;
        }
        while (v80 + 1 != v79);
        v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v96, 16);
      }
      while (v79);
    }

    v22 = v77;
    v57 = v75;
    if (objc_msgSend(v77, "count"))
    {
      v72->_tagsRead += objc_msgSend(v75, "count");
      if (-[NFCReaderSession delegateType](v72, "delegateType") == 4)
      {
        v84[0] = MEMORY[0x24BDAC760];
        v84[1] = 3221225472;
        v84[2] = __90__NFCNDEFReaderSession_didDetectNDEFMessages_fromTags_connectedTagIndex_updateUICallback___block_invoke_19;
        v84[3] = &unk_24D44FAF0;
        v84[4] = v72;
        v85 = v77;
        -[NFCReaderSession submitBlockOnDelegateQueue:](v72, "submitBlockOnDelegateQueue:", v84);

      }
    }
    v14 = v73;
    v58 = v74;
    if (v72->_invalidateAfterFirstRead)
      -[NFCReaderSession invalidateSessionWithReason:](v72, "invalidateSessionWithReason:", 204);
  }

}

void __90__NFCNDEFReaderSession_didDetectNDEFMessages_fromTags_connectedTagIndex_updateUICallback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "readerSession:didDetectTags:", v2, v3);

}

void __90__NFCNDEFReaderSession_didDetectNDEFMessages_fromTags_connectedTagIndex_updateUICallback___block_invoke_19(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(v4, "readerSession:didDetectNDEFs:", v2, v3);

}

- (NFCNDEFReaderSession)initWithDelegate:(id)a3 queue:(id)a4 pollMethod:(unint64_t)a5
{
  return -[NFCNDEFReaderSession initWithDelegate:queue:invalidateAfterFirstRead:](self, "initWithDelegate:queue:invalidateAfterFirstRead:", a3, a4, 0);
}

- (NFCNDEFReaderSession)initWithDelegate:(id)delegate queue:(dispatch_queue_t)queue invalidateAfterFirstRead:(BOOL)invalidateAfterFirstRead
{
  _BOOL4 v5;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NFCNDEFReaderSession *v12;
  NFCNDEFReaderSession *v13;
  objc_super v15;

  v5 = invalidateAfterFirstRead;
  v8 = delegate;
  v9 = queue;
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_254E04238) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    LOBYTE(v5) = 0;
    v10 = 528;
    v11 = 5;
  }
  else
  {
    if (v5)
      v10 = 64;
    else
      v10 = 0;
    v11 = 4;
  }
  v15.receiver = self;
  v15.super_class = (Class)NFCNDEFReaderSession;
  v12 = -[NFCReaderSession initWithDelegate:sessionDelegateType:queue:pollMethod:sessionConfig:](&v15, sel_initWithDelegate_sessionDelegateType_queue_pollMethod_sessionConfig_, v8, v11, v9, 2, v10);
  v13 = v12;
  if (v12)
    v12->_invalidateAfterFirstRead = v5;

  return v13;
}

+ (BOOL)readingAvailable
{
  return +[NFCReaderSession featureAvailable:](NFCReaderSession, "featureAvailable:", 6);
}

- (void)restartPolling
{
  NSObject *v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *Name;
  objc_super v17;
  _BYTE state[18];
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = _os_activity_create(&dword_215BBD000, "NFCNDEFReaderSession restartPolling", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  *(_QWORD *)state = 0;
  *(_QWORD *)&state[8] = 0;
  os_activity_scope_enter(v4, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  if (-[NFCReaderSession delegateType](self, "delegateType") == 5)
  {
    v17.receiver = self;
    v17.super_class = (Class)NFCNDEFReaderSession;
    -[NFCReaderSession restartPolling](&v17, sel_restartPolling);
  }
  else
  {
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v10 = 45;
      if (isMetaClass)
        v10 = 43;
      v6(5, "%c[%{public}s %{public}s]:%i Delegate conforms to [NFCNDEFReaderSessionDelegate readerSession:didDetectTags]; po"
        "lling is auto restarted.",
        v10,
        ClassName,
        Name,
        182);
    }
    NFSharedLogGetLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = object_getClass(self);
      if (class_isMetaClass(v12))
        v13 = 43;
      else
        v13 = 45;
      v14 = object_getClassName(self);
      v15 = sel_getName(a2);
      *(_DWORD *)state = 67109890;
      *(_DWORD *)&state[4] = v13;
      *(_WORD *)&state[8] = 2082;
      *(_QWORD *)&state[10] = v14;
      v19 = 2082;
      v20 = v15;
      v21 = 1024;
      v22 = 182;
      _os_log_impl(&dword_215BBD000, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Delegate conforms to [NFCNDEFReaderSessionDelegate readerSession:didDetectTags]; po"
        "lling is auto restarted.",
        state,
        0x22u);
    }

  }
}

- (void)connectToTag:(id)tag completionHandler:(void *)completionHandler
{
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  char v11;
  id v12;
  uint64_t v13;
  void (*v14)(uint64_t, const char *, ...);
  objc_class *v15;
  _BOOL4 v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  const char *v22;
  const char *v23;
  uint64_t Logger;
  void (*v25)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v29;
  NSObject *v30;
  objc_class *v31;
  int v32;
  const char *v33;
  const char *v34;
  const char *v35;
  const char *Name;
  uint64_t v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t);
  void *v40;
  id v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  _BYTE state[18];
  __int16 v47;
  const char *v48;
  __int16 v49;
  int v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v7 = tag;
  v8 = completionHandler;
  v9 = _os_activity_create(&dword_215BBD000, "NFCNDEFReaderSession connectToTag:completionHandler", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  *(_QWORD *)state = 0;
  *(_QWORD *)&state[8] = 0;
  os_activity_scope_enter(v9, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v7;
    v43 = 0;
    v11 = objc_msgSend(v10, "isMatchingSession:outError:", self, &v43);
    v12 = v43;
    if ((v11 & 1) != 0)
    {
      objc_msgSend(v10, "_connectWithCompletionHandler:", v8);
    }
    else
    {
      v37 = MEMORY[0x24BDAC760];
      v38 = 3221225472;
      v39 = __55__NFCNDEFReaderSession_connectToTag_completionHandler___block_invoke_79;
      v40 = &unk_24D44F9D8;
      v42 = v8;
      v41 = v12;
      -[NFCReaderSession submitBlockOnDelegateQueue:](self, "submitBlockOnDelegateQueue:", &v37);
      Logger = NFLogGetLogger();
      if (Logger)
      {
        v25 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v29 = 45;
        if (isMetaClass)
          v29 = 43;
        v25(3, "%c[%{public}s %{public}s]:%i Only tag from the current session is allowed", v29, ClassName, Name, 204, v37, v38, v39, v40);
      }
      NFSharedLogGetLogger();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = object_getClass(self);
        if (class_isMetaClass(v31))
          v32 = 43;
        else
          v32 = 45;
        v33 = object_getClassName(self);
        v34 = sel_getName(a2);
        *(_DWORD *)state = 67109890;
        *(_DWORD *)&state[4] = v32;
        *(_WORD *)&state[8] = 2082;
        *(_QWORD *)&state[10] = v33;
        v47 = 2082;
        v48 = v34;
        v49 = 1024;
        v50 = 204;
        _os_log_impl(&dword_215BBD000, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Only tag from the current session is allowed", state, 0x22u);
      }

    }
  }
  else
  {
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __55__NFCNDEFReaderSession_connectToTag_completionHandler___block_invoke;
    v44[3] = &unk_24D44F8B0;
    v45 = v8;
    -[NFCReaderSession submitBlockOnDelegateQueue:](self, "submitBlockOnDelegateQueue:", v44);
    v13 = NFLogGetLogger();
    if (v13)
    {
      v14 = (void (*)(uint64_t, const char *, ...))v13;
      v15 = object_getClass(self);
      v16 = class_isMetaClass(v15);
      v17 = object_getClassName(self);
      v35 = sel_getName(a2);
      v18 = 45;
      if (v16)
        v18 = 43;
      v14(3, "%c[%{public}s %{public}s]:%i Invalid tag object", v18, v17, v35, 194);
    }
    NFSharedLogGetLogger();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = object_getClass(self);
      if (class_isMetaClass(v20))
        v21 = 43;
      else
        v21 = 45;
      v22 = object_getClassName(self);
      v23 = sel_getName(a2);
      *(_DWORD *)state = 67109890;
      *(_DWORD *)&state[4] = v21;
      *(_WORD *)&state[8] = 2082;
      *(_QWORD *)&state[10] = v22;
      v47 = 2082;
      v48 = v23;
      v49 = 1024;
      v50 = 194;
      _os_log_impl(&dword_215BBD000, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid tag object", state, 0x22u);
    }

    v10 = v45;
  }

}

void __55__NFCNDEFReaderSession_connectToTag_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 3);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

uint64_t __55__NFCNDEFReaderSession_connectToTag_completionHandler___block_invoke_79(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_callbackDidBecomeActive
{
  void *v4;
  char v5;
  uint64_t v6;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *v8;
  _BOOL4 v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  int v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t Logger;
  void (*v19)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v24;
  objc_class *v25;
  int v26;
  const char *v27;
  int64_t v28;
  _QWORD v29[5];
  uint8_t buf[4];
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  if (-[NFCReaderSession delegateType](self, "delegateType") != 4
    && -[NFCReaderSession delegateType](self, "delegateType") != 5)
  {
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v19 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v28 = -[NFCReaderSession delegateType](self, "delegateType");
      v24 = 45;
      if (isMetaClass)
        v24 = 43;
      v19(4, "%c[%{public}s %{public}s]:%i Unknown delegate type: %ld", v24, ClassName, Name, 223, v28);
    }
    NFSharedLogGetLogger();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    v25 = object_getClass(self);
    if (class_isMetaClass(v25))
      v26 = 43;
    else
      v26 = 45;
    *(_DWORD *)buf = 67110146;
    v31 = v26;
    v32 = 2082;
    v33 = object_getClassName(self);
    v34 = 2082;
    v35 = sel_getName(a2);
    v36 = 1024;
    v37 = 223;
    v38 = 2048;
    v39 = -[NFCReaderSession delegateType](self, "delegateType");
    v15 = "%c[%{public}s %{public}s]:%i Unknown delegate type: %ld";
    v16 = v12;
    v17 = 44;
    goto LABEL_23;
  }
  -[NFCReaderSession delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __48__NFCNDEFReaderSession__callbackDidBecomeActive__block_invoke;
    v29[3] = &unk_24D44FB90;
    v29[4] = self;
    -[NFCReaderSession submitBlockOnDelegateQueue:](self, "submitBlockOnDelegateQueue:", v29);
    return;
  }
  v6 = NFLogGetLogger();
  if (v6)
  {
    v7 = (void (*)(uint64_t, const char *, ...))v6;
    v8 = object_getClass(self);
    v9 = class_isMetaClass(v8);
    v10 = object_getClassName(self);
    v27 = sel_getName(a2);
    v11 = 45;
    if (v9)
      v11 = 43;
    v7(4, "%c[%{public}s %{public}s]:%i Delegate does not implement -readerSessionDidBecomeActive: method", v11, v10, v27, 220);
  }
  NFSharedLogGetLogger();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = object_getClass(self);
    if (class_isMetaClass(v13))
      v14 = 43;
    else
      v14 = 45;
    *(_DWORD *)buf = 67109890;
    v31 = v14;
    v32 = 2082;
    v33 = object_getClassName(self);
    v34 = 2082;
    v35 = sel_getName(a2);
    v36 = 1024;
    v37 = 220;
    v15 = "%c[%{public}s %{public}s]:%i Delegate does not implement -readerSessionDidBecomeActive: method";
    v16 = v12;
    v17 = 34;
LABEL_23:
    _os_log_impl(&dword_215BBD000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
  }
LABEL_24:

}

void __48__NFCNDEFReaderSession__callbackDidBecomeActive__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "readerSessionDidBecomeActive:", *(_QWORD *)(a1 + 32));

}

@end
