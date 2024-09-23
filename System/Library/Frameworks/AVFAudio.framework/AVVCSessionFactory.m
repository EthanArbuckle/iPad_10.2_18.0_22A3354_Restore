@implementation AVVCSessionFactory

- (AVVCSessionFactory)init
{
  AVVCSessionFactory *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *workQueue;
  NSMutableDictionary *v6;
  NSMutableDictionary *sessionManagerMap;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVVCSessionFactory;
  v2 = -[AVVCSessionFactory init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("AVVCSessionFactory Work Queue", v3);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sessionManagerMap = v2->_sessionManagerMap;
    v2->_sessionManagerMap = v6;

  }
  return v2;
}

- (void)_wqCreateAuxSessionAndManagerForDeviceUID:(id)a3 clientType:(int64_t)a4 session:(id *)a5 manager:(id *)a6 error:(id *)a7
{
  id v9;
  int v10;
  int v11;
  int v12;
  void *v13;
  NSMutableDictionary *sessionManagerMap;
  void *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  NSMutableDictionary *v20;
  void *v21;
  NSMutableDictionary *v22;
  void *v23;
  void *v24;
  AVVCSessionManager *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  NSObject *v33;
  int v34;
  AVVCSessionManager *v35;
  NSMutableDictionary *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  NSObject *v41;
  NSMutableDictionary *v42;
  void *v43;
  void *v44;
  NSMutableDictionary *v45;
  void *v46;
  id v47;
  id v48;
  NSObject *v49;
  void *v50;
  void (**sessionWasCreatedBlock)(id, AVVCSessionManager *, id *);
  void *v52;
  uint8_t v56[16];
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  int v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  AVVCSessionManager *v64;
  __int16 v65;
  uint8_t *v66;
  __int16 v67;
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if ((MGGetSInt32Answer() == 4
     || ((v10 = MGGetSInt32Answer(), v11 = MGGetBoolAnswer(), v10 == 7) ? (v12 = 1) : (v12 = v11), v12 == 1))
    && (MGGetBoolAnswer() & 1) == 0)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CFF1C0], "auxiliarySession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  sessionManagerMap = self->_sessionManagerMap;
  objc_msgSend(v9, "activationDeviceUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](sessionManagerMap, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    if (kAVVCScope)
    {
      v17 = *(id *)kAVVCScope;
      if (!v17)
        goto LABEL_17;
    }
    else
    {
      v17 = (id)MEMORY[0x1E0C81028];
      v18 = MEMORY[0x1E0C81028];
    }
    v19 = v17;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = self->_sessionManagerMap;
      objc_msgSend(v9, "activationDeviceUID");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", v52);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = self->_sessionManagerMap;
      objc_msgSend(v9, "activationDeviceUID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "audioSession");
      v25 = (AVVCSessionManager *)objc_claimAutoreleasedReturnValue();
      CAX4CCString::CAX4CCString((CAX4CCString *)v56, objc_msgSend(v9, "activationMode"));
      objc_msgSend(v9, "activationDeviceUID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316418;
      v58 = "AVVCSessionFactory.mm";
      v59 = 1024;
      v60 = 129;
      v61 = 2048;
      v62 = v21;
      v63 = 2048;
      v64 = v25;
      v65 = 2080;
      v66 = v56;
      v67 = 2112;
      v68 = v26;
      _os_log_impl(&dword_19B733000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d _wqCreateAuxSessionAndManagerForDeviceUID: unexpected existing session manager(%p) audioSession(%p) for context(%s, %@)", buf, 0x3Au);

    }
  }
LABEL_17:
  v27 = objc_alloc(MEMORY[0x1E0C99D80]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "activationMode"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activationDeviceUID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v27, "initWithObjectsAndKeys:", v28, CFSTR("activation trigger"), v29, CFSTR("activation device uid"), 0);

  objc_msgSend(v13, "setActivationContext:error:", v30, a7);
  if (*a7 && objc_msgSend(*a7, "code"))
  {
    if (kAVVCScope)
    {
      v31 = *(id *)kAVVCScope;
      if (!v31)
        goto LABEL_26;
    }
    else
    {
      v31 = (id)MEMORY[0x1E0C81028];
      v32 = MEMORY[0x1E0C81028];
    }
    v33 = v31;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = objc_msgSend(*a7, "code");
      *(_DWORD *)buf = 136315650;
      v58 = "AVVCSessionFactory.mm";
      v59 = 1024;
      v60 = 140;
      v61 = 1024;
      LODWORD(v62) = v34;
      _os_log_impl(&dword_19B733000, v33, OS_LOG_TYPE_ERROR, "%25s:%-5d _wqCreateAuxSessionAndManagerForDeviceUID: setActivationContext returned error(%d)", buf, 0x18u);
    }

  }
LABEL_26:
  v35 = -[AVVCSessionManager initWithSession:]([AVVCSessionManager alloc], "initWithSession:", v13);
  -[AVVCSessionManager setupOneTimeSessionSettingsForClient:](v35, "setupOneTimeSessionSettingsForClient:", a4);
  v36 = self->_sessionManagerMap;
  objc_msgSend(v9, "activationDeviceUID");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v36, "objectForKeyedSubscript:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v36) = v38 == 0;

  if ((v36 & 1) != 0)
    goto LABEL_34;
  if (kAVVCScope)
  {
    v39 = *(id *)kAVVCScope;
    if (!v39)
      goto LABEL_34;
  }
  else
  {
    v39 = (id)MEMORY[0x1E0C81028];
    v40 = MEMORY[0x1E0C81028];
  }
  v41 = v39;
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    v42 = self->_sessionManagerMap;
    objc_msgSend(v9, "activationDeviceUID");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v42, "objectForKeyedSubscript:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v58 = "AVVCSessionFactory.mm";
    v59 = 1024;
    v60 = 146;
    v61 = 2048;
    v62 = v44;
    _os_log_impl(&dword_19B733000, v41, OS_LOG_TYPE_ERROR, "%25s:%-5d _wqCreateAuxSessionAndManagerForDeviceUID: unexpected existing sessionManager(%p)", buf, 0x1Cu);

  }
LABEL_34:
  v45 = self->_sessionManagerMap;
  objc_msgSend(v9, "activationDeviceUID");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v45, "setObject:forKeyedSubscript:", v35, v46);

  if (kAVVCScope)
  {
    v47 = *(id *)kAVVCScope;
    if (!v47)
      goto LABEL_41;
  }
  else
  {
    v47 = (id)MEMORY[0x1E0C81028];
    v48 = MEMORY[0x1E0C81028];
  }
  v49 = v47;
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    CAX4CCString::CAX4CCString((CAX4CCString *)v56, objc_msgSend(v9, "activationMode"));
    objc_msgSend(v9, "activationDeviceUID");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316418;
    v58 = "AVVCSessionFactory.mm";
    v59 = 1024;
    v60 = 150;
    v61 = 2048;
    v62 = v13;
    v63 = 2048;
    v64 = v35;
    v65 = 2080;
    v66 = v56;
    v67 = 2112;
    v68 = v50;
    _os_log_impl(&dword_19B733000, v49, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Created aux session (%p) and session manager (%p) and setup onetime settings for context(%s, %@)", buf, 0x3Au);

  }
LABEL_41:
  sessionWasCreatedBlock = (void (**)(id, AVVCSessionManager *, id *))self->_sessionWasCreatedBlock;
  if (sessionWasCreatedBlock)
    sessionWasCreatedBlock[2](sessionWasCreatedBlock, v35, a7);
  if (a5)
    *a5 = objc_retainAutorelease(v13);
  if (a6)
    *a6 = objc_retainAutorelease(v35);

}

- (id)_wqCreatePrimarySessionManagerIfNeeded:(id)a3 clientType:(int64_t)a4 error:(id *)a5
{
  id v8;
  AVVCSessionManager *primarySessionManager;
  AVVCSessionManager *v10;
  void *v11;
  AVVCSessionManager *v12;
  AVVCSessionManager *v13;
  int v14;
  id v15;
  id v16;
  NSObject *v17;
  AVVCSessionManager *v18;
  void *v19;
  AVVCSessionManager *v20;
  _BYTE v22[16];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  AVVCSessionManager *v28;
  __int16 v29;
  _BYTE *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  primarySessionManager = self->_primarySessionManager;
  if (!primarySessionManager)
  {
    v10 = [AVVCSessionManager alloc];
    objc_msgSend(MEMORY[0x1E0CFF1C0], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[AVVCSessionManager initWithSession:](v10, "initWithSession:", v11);
    v13 = self->_primarySessionManager;
    self->_primarySessionManager = v12;

    v14 = -[AVVCSessionManager setupOneTimeSessionSettingsForClient:](self->_primarySessionManager, "setupOneTimeSessionSettingsForClient:", a4);
    if (a5 && v14)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v14, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (kAVVCScope)
    {
      v15 = *(id *)kAVVCScope;
      if (!v15)
      {
LABEL_12:
        primarySessionManager = self->_primarySessionManager;
        goto LABEL_13;
      }
    }
    else
    {
      v15 = (id)MEMORY[0x1E0C81028];
      v16 = MEMORY[0x1E0C81028];
    }
    v17 = v15;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = self->_primarySessionManager;
      CAX4CCString::CAX4CCString((CAX4CCString *)v22, objc_msgSend(v8, "activationMode"));
      objc_msgSend(v8, "activationDeviceUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v24 = "AVVCSessionFactory.mm";
      v25 = 1024;
      v26 = 175;
      v27 = 2048;
      v28 = v18;
      v29 = 2080;
      v30 = v22;
      v31 = 2112;
      v32 = v19;
      _os_log_impl(&dword_19B733000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Created primary session manager (%p) and setup onetime settings for context(%s, %@)", buf, 0x30u);

    }
    goto LABEL_12;
  }
LABEL_13:
  v20 = primarySessionManager;

  return v20;
}

- (void)_wqSessionAndManagerForContext:(id)a3 clientType:(int64_t)a4 session:(id *)a5 manager:(id *)a6 error:(id *)a7
{
  AVVCContextSettings *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSMutableDictionary *sessionManagerMap;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  AVVCContextSettings *v24;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  void *v34;
  id v35;
  AVVCContextSettings *v36;
  id v37;
  id v38;
  uint8_t v39[16];
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  uint8_t *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v12 = (AVVCContextSettings *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (contextIsRemora(v12))
  {
    -[AVVCContextSettings activationDeviceUID](v12, "activationDeviceUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[AVVCContextSettings activationDeviceUID](v12, "activationDeviceUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "length");

      if (v15)
      {
        sessionManagerMap = self->_sessionManagerMap;
        -[AVVCContextSettings activationDeviceUID](v12, "activationDeviceUID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](sessionManagerMap, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "audioSession");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (!v19 || !v18)
        {
          v37 = v18;
          v38 = v19;
          -[AVVCSessionFactory _wqCreateAuxSessionAndManagerForDeviceUID:clientType:session:manager:error:](self, "_wqCreateAuxSessionAndManagerForDeviceUID:clientType:session:manager:error:", v12, a4, &v38, &v37, a7);
          v21 = v38;

          v22 = v37;
          v18 = v22;
          v20 = v21;
        }
        goto LABEL_18;
      }
    }
    if (kAVVCScope)
    {
      v25 = *(id *)kAVVCScope;
      if (!v25)
      {
LABEL_17:
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, 0);
        v18 = 0;
        v20 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
    }
    else
    {
      v25 = MEMORY[0x1E0C81028];
      v26 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v41 = "AVVCSessionFactory.mm";
      v42 = 1024;
      v43 = 200;
      _os_log_impl(&dword_19B733000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d _wqSessionForContext: activationDeviceUID must be specified for this mode", buf, 0x12u);
    }

    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CFF1C0], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = MEMORY[0x1E0C809B0];
  v32 = 3221225472;
  v33 = __86__AVVCSessionFactory__wqSessionAndManagerForContext_clientType_session_manager_error___block_invoke;
  v34 = &unk_1E3BEB5F0;
  v20 = v23;
  v35 = v20;
  v24 = v12;
  v36 = v24;
  if (-[AVVCSessionFactory _wqSessionAndManagerForContext:clientType:session:manager:error:]::onceToken != -1)
    dispatch_once(&-[AVVCSessionFactory _wqSessionAndManagerForContext:clientType:session:manager:error:]::onceToken, &v31);
  -[AVVCSessionFactory _wqCreatePrimarySessionManagerIfNeeded:clientType:error:](self, "_wqCreatePrimarySessionManagerIfNeeded:clientType:error:", v24, a4, a7, v31, v32, v33, v34);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
  if (kAVVCScope)
  {
    v27 = *(id *)kAVVCScope;
    if (!v27)
      goto LABEL_25;
  }
  else
  {
    v27 = (id)MEMORY[0x1E0C81028];
    v28 = MEMORY[0x1E0C81028];
  }
  v29 = v27;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    CAX4CCString::CAX4CCString((CAX4CCString *)v39, -[AVVCContextSettings activationMode](v12, "activationMode"));
    -[AVVCContextSettings activationDeviceUID](v12, "activationDeviceUID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316418;
    v41 = "AVVCSessionFactory.mm";
    v42 = 1024;
    v43 = 217;
    v44 = 2048;
    v45 = v20;
    v46 = 2048;
    v47 = v18;
    v48 = 2080;
    v49 = v39;
    v50 = 2112;
    v51 = v30;
    _os_log_impl(&dword_19B733000, v29, OS_LOG_TYPE_DEBUG, "%25s:%-5d retrieved session (%p) and sessionManager (%p) for context(%s, %@)", buf, 0x3Au);

  }
LABEL_25:
  if (a5)
    *a5 = objc_retainAutorelease(v20);
  if (a6)
    *a6 = objc_retainAutorelease(v18);

}

- (void)sessionForContext:(id)a3 completion:(id)a4
{
  -[AVVCSessionFactory sessionForContext:clientType:completion:](self, "sessionForContext:clientType:completion:", a3, 1, a4);
}

- (id)sessionForContext:(id)a3 error:(id *)a4
{
  -[AVVCSessionFactory sessionForContext:clientType:error:](self, "sessionForContext:clientType:error:", a3, 1, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)sessionForContext:(id)a3 clientType:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *workQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a5;
  workQueue = self->_workQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__AVVCSessionFactory_sessionForContext_clientType_completion___block_invoke;
  v13[3] = &unk_1E3BEB618;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(workQueue, v13);

}

- (id)sessionForContext:(id)a3 clientType:(int64_t)a4 error:(id *)a5
{
  id v8;
  NSObject *workQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  int64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1241;
  v28 = __Block_byref_object_dispose__1242;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1241;
  v22 = __Block_byref_object_dispose__1242;
  v23 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__AVVCSessionFactory_sessionForContext_clientType_error___block_invoke;
  block[3] = &unk_1E3BEB640;
  block[4] = self;
  v10 = v8;
  v14 = v10;
  v15 = &v24;
  v16 = &v18;
  v17 = a4;
  dispatch_sync(workQueue, block);
  if (a5)
    *a5 = objc_retainAutorelease((id)v19[5]);
  v11 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

- (void)sessionManagerForContext:(id)a3 clientType:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *workQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a5;
  workQueue = self->_workQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__AVVCSessionFactory_sessionManagerForContext_clientType_completion___block_invoke;
  v13[3] = &unk_1E3BEB618;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(workQueue, v13);

}

- (id)sessionManagerForContext:(id)a3 clientType:(int64_t)a4 error:(id *)a5
{
  id v8;
  NSObject *workQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  int64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1241;
  v28 = __Block_byref_object_dispose__1242;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1241;
  v22 = __Block_byref_object_dispose__1242;
  v23 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__AVVCSessionFactory_sessionManagerForContext_clientType_error___block_invoke;
  block[3] = &unk_1E3BEB640;
  block[4] = self;
  v10 = v8;
  v14 = v10;
  v15 = &v24;
  v16 = &v18;
  v17 = a4;
  dispatch_sync(workQueue, block);
  if (a5)
    *a5 = objc_retainAutorelease((id)v19[5]);
  v11 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

- (void)cleanupContext:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  AVVCSessionFactory *v9;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__AVVCSessionFactory_cleanupContext___block_invoke;
  v7[3] = &unk_1E3BEB5F0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (id)auxSessionManagers
{
  NSObject *workQueue;
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
  v9 = __Block_byref_object_copy__1241;
  v10 = __Block_byref_object_dispose__1242;
  v11 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__AVVCSessionFactory_auxSessionManagers__block_invoke;
  v5[3] = &unk_1E3BEB668;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)releasePrimarySessionManager
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__AVVCSessionFactory_releasePrimarySessionManager__block_invoke;
  block[3] = &unk_1E3BECBE0;
  block[4] = self;
  dispatch_sync(workQueue, block);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (NSMutableDictionary)sessionManagerMap
{
  return self->_sessionManagerMap;
}

- (void)setSessionManagerMap:(id)a3
{
  objc_storeStrong((id *)&self->_sessionManagerMap, a3);
}

- (AVVCSessionManager)primarySessionManager
{
  return self->_primarySessionManager;
}

- (void)setPrimarySessionManager:(id)a3
{
  objc_storeStrong((id *)&self->_primarySessionManager, a3);
}

- (id)sessionWasCreatedBlock
{
  return self->_sessionWasCreatedBlock;
}

- (void)setSessionWasCreatedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)sessionWillBeDestroyedBlock
{
  return self->_sessionWillBeDestroyedBlock;
}

- (void)setSessionWillBeDestroyedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sessionWillBeDestroyedBlock, 0);
  objc_storeStrong(&self->_sessionWasCreatedBlock, 0);
  objc_storeStrong((id *)&self->_primarySessionManager, 0);
  objc_storeStrong((id *)&self->_sessionManagerMap, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

uint64_t __50__AVVCSessionFactory_releasePrimarySessionManager__block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (kAVVCScope)
  {
    v2 = *(id *)kAVVCScope;
    if (!v2)
      return objc_msgSend(*(id *)(a1 + 32), "setPrimarySessionManager:", 0);
  }
  else
  {
    v2 = (id)MEMORY[0x1E0C81028];
    v3 = MEMORY[0x1E0C81028];
  }
  v4 = v2;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "primarySessionManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315650;
    v8 = "AVVCSessionFactory.mm";
    v9 = 1024;
    v10 = 351;
    v11 = 2048;
    v12 = v5;
    _os_log_impl(&dword_19B733000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Releasing primary session manager (%p)", (uint8_t *)&v7, 0x1Cu);

  }
  return objc_msgSend(*(id *)(a1 + 32), "setPrimarySessionManager:", 0);
}

void __40__AVVCSessionFactory_auxSessionManagers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "sessionManagerMap");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __37__AVVCSessionFactory_cleanupContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  NSObject *v23;
  NSObject *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  uint8_t v30[16];
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  uint8_t *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!contextIsRemora(*(AVVCContextSettings **)(a1 + 32)))
  {
    if (kAVVCScope)
    {
      v10 = *(id *)kAVVCScope;
      if (!v10)
        return;
    }
    else
    {
      v10 = (id)MEMORY[0x1E0C81028];
      v12 = MEMORY[0x1E0C81028];
    }
    v8 = v10;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v30, objc_msgSend(*(id *)(a1 + 32), "activationMode"));
      objc_msgSend(*(id *)(a1 + 32), "activationDeviceUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v32 = "AVVCSessionFactory.mm";
      v33 = 1024;
      v34 = 333;
      v35 = 2080;
      v36 = v30;
      v37 = 2112;
      v38 = v13;
      _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Nothing to clean up for context(%s, %@)", buf, 0x26u);

    }
LABEL_19:
    v7 = v8;
LABEL_42:

    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "activationDeviceUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "activationDeviceUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length");

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 40), "sessionManagerMap");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "activationDeviceUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "audioSession");
      v8 = objc_claimAutoreleasedReturnValue();
      if (kAVVCScope)
      {
        v9 = *(id *)kAVVCScope;
        if (!v9)
          goto LABEL_24;
      }
      else
      {
        v9 = (id)MEMORY[0x1E0C81028];
        v16 = MEMORY[0x1E0C81028];
      }
      v17 = v9;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        CAX4CCString::CAX4CCString((CAX4CCString *)v30, objc_msgSend(*(id *)(a1 + 32), "activationMode"));
        objc_msgSend(*(id *)(a1 + 32), "activationDeviceUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "audioSession");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136316418;
        v32 = "AVVCSessionFactory.mm";
        v33 = 1024;
        v34 = 311;
        v35 = 2080;
        v36 = v30;
        v37 = 2112;
        v38 = v18;
        v39 = 2048;
        v40 = v19;
        v41 = 2048;
        v42 = v7;
        _os_log_impl(&dword_19B733000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Clean up context(%s, %@), about to release session(%p) and manager(%p)", buf, 0x3Au);

      }
LABEL_24:
      if (!v8)
      {
        if (kAVVCScope)
        {
          v23 = *(id *)kAVVCScope;
          if (!v23)
            goto LABEL_41;
        }
        else
        {
          v23 = MEMORY[0x1E0C81028];
          v25 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v32 = "AVVCSessionFactory.mm";
          v33 = 1024;
          v34 = 323;
          _os_log_impl(&dword_19B733000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d Unexpected missing session when cleaning up context", buf, 0x12u);
        }
        goto LABEL_40;
      }
      objc_msgSend(*(id *)(a1 + 40), "sessionWillBeDestroyedBlock");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20 == 0;

      if (v21)
      {
LABEL_41:
        objc_msgSend(*(id *)(a1 + 40), "sessionManagerMap");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "activationDeviceUID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKeyedSubscript:", 0, v28);

        goto LABEL_42;
      }
      objc_msgSend(*(id *)(a1 + 40), "sessionWillBeDestroyedBlock");
      v22 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v29 = 0;
      ((void (**)(_QWORD, void *, id *))v22)[2](v22, v7, &v29);
      v23 = v29;

      if (v23)
      {
        if (kAVVCScope)
        {
          v24 = *(id *)kAVVCScope;
          if (!v24)
            goto LABEL_40;
        }
        else
        {
          v24 = MEMORY[0x1E0C81028];
          v26 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v32 = "AVVCSessionFactory.mm";
          v33 = 1024;
          v34 = 318;
          v35 = 2112;
          v36 = (uint8_t *)v23;
          _os_log_impl(&dword_19B733000, v24, OS_LOG_TYPE_ERROR, "%25s:%-5d Unexpected error cleaning up context: %@", buf, 0x1Cu);
        }

      }
LABEL_40:

      goto LABEL_41;
    }
  }
  if (!kAVVCScope)
  {
    v11 = (id)MEMORY[0x1E0C81028];
    v14 = MEMORY[0x1E0C81028];
LABEL_17:
    v8 = v11;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v30, objc_msgSend(*(id *)(a1 + 32), "activationMode"));
      objc_msgSend(*(id *)(a1 + 32), "activationDeviceUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v32 = "AVVCSessionFactory.mm";
      v33 = 1024;
      v34 = 328;
      v35 = 2080;
      v36 = v30;
      v37 = 2112;
      v38 = v15;
      _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d Can't cleanup because devID is missing in context(%s, %@)", buf, 0x26u);

    }
    goto LABEL_19;
  }
  v11 = *(id *)kAVVCScope;
  if (v11)
    goto LABEL_17;
}

void __64__AVVCSessionFactory_sessionManagerForContext_clientType_error___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id obj;

  v2 = (void *)a1[4];
  v1 = a1[5];
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  v5 = a1[8];
  v6 = *(_QWORD *)(a1[7] + 8);
  v7 = *(id *)(v6 + 40);
  obj = v4;
  objc_msgSend(v2, "_wqSessionAndManagerForContext:clientType:session:manager:error:", v1, v5, 0, &obj, &v7);
  objc_storeStrong((id *)(v3 + 40), obj);
  objc_storeStrong((id *)(v6 + 40), v7);
}

void __69__AVVCSessionFactory_sessionManagerForContext_clientType_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[7];
  v8 = 0;
  v9 = 0;
  objc_msgSend(v2, "_wqSessionAndManagerForContext:clientType:session:manager:error:", v3, v4, 0, &v9, &v8);
  v5 = v9;
  v6 = v8;
  v7 = a1[6];
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);

}

void __57__AVVCSessionFactory_sessionForContext_clientType_error___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id obj;

  v2 = (void *)a1[4];
  v1 = a1[5];
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  v5 = a1[8];
  v6 = *(_QWORD *)(a1[7] + 8);
  v7 = *(id *)(v6 + 40);
  obj = v4;
  objc_msgSend(v2, "_wqSessionAndManagerForContext:clientType:session:manager:error:", v1, v5, &obj, 0, &v7);
  objc_storeStrong((id *)(v3 + 40), obj);
  objc_storeStrong((id *)(v6 + 40), v7);
}

void __62__AVVCSessionFactory_sessionForContext_clientType_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[7];
  v8 = 0;
  v9 = 0;
  objc_msgSend(v2, "_wqSessionAndManagerForContext:clientType:session:manager:error:", v3, v4, &v9, 0, &v8);
  v5 = v9;
  v6 = v8;
  v7 = a1[6];
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);

}

void __86__AVVCSessionFactory__wqSessionAndManagerForContext_clientType_session_manager_error___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  _BYTE v7[16];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  _BYTE *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (kAVVCScope)
  {
    v2 = *(id *)kAVVCScope;
    if (!v2)
      return;
  }
  else
  {
    v2 = (id)MEMORY[0x1E0C81028];
    v3 = MEMORY[0x1E0C81028];
  }
  v4 = v2;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    CAX4CCString::CAX4CCString((CAX4CCString *)v7, objc_msgSend(*(id *)(a1 + 40), "activationMode"));
    objc_msgSend(*(id *)(a1 + 40), "activationDeviceUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v9 = "AVVCSessionFactory.mm";
    v10 = 1024;
    v11 = 211;
    v12 = 2048;
    v13 = v5;
    v14 = 2080;
    v15 = v7;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_19B733000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d First time primary session (%p) retrieved. Context(%s, %@)", buf, 0x30u);

  }
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__AVVCSessionFactory_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[AVVCSessionFactory sharedInstance]::onceToken != -1)
    dispatch_once(&+[AVVCSessionFactory sharedInstance]::onceToken, block);
  return (id)sSharedInstance;
}

void __36__AVVCSessionFactory_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  NSObject *v3;
  id v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sSharedInstance;
  sSharedInstance = (uint64_t)v1;

  if (kAVVCScope)
  {
    v3 = *(id *)kAVVCScope;
    if (!v3)
      return;
  }
  else
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315650;
    v6 = "AVVCSessionFactory.mm";
    v7 = 1024;
    v8 = 71;
    v9 = 2048;
    v10 = sSharedInstance;
    _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Created AVVCSessionFactory (%p)", (uint8_t *)&v5, 0x1Cu);
  }

}

@end
