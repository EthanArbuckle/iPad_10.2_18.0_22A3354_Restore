@implementation AUHostingService

- (AUHostingService)initWithConnection:(id)a3
{
  id v4;
  AUHostingService *v5;
  AUHostingService *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  id v10;
  unsigned __int8 v11;
  NSObject *v12;
  __long *p_instanceUUID;
  unsigned __int8 v14;
  NSObject *v15;
  __long *v16;
  AUHostingService *v17;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  __long *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AUHostingService;
  v5 = -[AUHostingService init](&v19, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_connection, v4);
    do
      v7 = __ldaxr((unsigned int *)&g_number_of_connections);
    while (__stlxr(v7 + 1, (unsigned int *)&g_number_of_connections));
    objc_msgSend(MEMORY[0x1E0CB3B58], "_UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "UUIDString");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::string::__assign_external((std::string *)&v6->_instanceUUID, (const std::string::value_type *)objc_msgSend(v10, "UTF8String"));

    }
    if (!v7)
    {
      {
        caulk::log_category::log_category((caulk::log_category *)&auhs_log_category(void)::category, "com.apple.coreaudio", "AUHostingService");
      }
      v12 = objc_retainAutorelease((id)auhs_log_category(void)::category);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        p_instanceUUID = (__long *)&v6->_instanceUUID;
        if (*((char *)&v6->_instanceUUID.__r_.__value_.var0.__l + 23) < 0)
          p_instanceUUID = (__long *)p_instanceUUID->__data_;
        *(_DWORD *)buf = 136315650;
        v21 = "AUHostingService.mm";
        v22 = 1024;
        v23 = 96;
        v24 = 2080;
        v25 = p_instanceUUID;
        _os_log_impl(&dword_18EE07000, v12, OS_LOG_TYPE_INFO, "%25s:%-5d Launched new Audio Unit Hosting Service %s", buf, 0x1Cu);
      }
    }
    {
      caulk::log_category::log_category((caulk::log_category *)&auhs_log_category(void)::category, "com.apple.coreaudio", "AUHostingService");
    }
    v15 = objc_retainAutorelease((id)auhs_log_category(void)::category);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = (__long *)&v6->_instanceUUID;
      if (*((char *)&v6->_instanceUUID.__r_.__value_.var0.__l + 23) < 0)
        v16 = (__long *)v16->__data_;
      *(_DWORD *)buf = 136315650;
      v21 = "AUHostingService.mm";
      v22 = 1024;
      v23 = 100;
      v24 = 2080;
      v25 = v16;
      _os_log_impl(&dword_18EE07000, v15, OS_LOG_TYPE_INFO, "%25s:%-5d New connection with Audio Unit Hosting Service %s", buf, 0x1Cu);
    }
    v17 = v6;
  }

  return v6;
}

- (void)establishConnection:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  AURemoteHost *host;

  host = self->_host;
  if (host)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      host = self->_host;
    else
      host = 0;
  }
  return host;
}

- (void)retrieveAudioUnitInstanceID:(id)a3
{
  AURemoteHost *host;
  void *v5;
  void (**v6)(id, _QWORD, void *);

  v6 = (void (**)(id, _QWORD, void *))a3;
  host = self->_host;
  if (host)
  {
    -[AURemoteHost audioUnitUUID](host, "audioUnitUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -10867, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v6)[2](v6, v5, 0);
  }

}

- (void)loadAudioUnitInRemoteHost:(AudioComponentDescription *)a3 config:(id)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  UInt32 componentFlagsMask;
  id v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  NSObject *v15;
  void *v16;
  AURemoteHost *v17;
  AURemoteHost *host;
  unsigned __int8 v19;
  NSObject *v20;
  void *v21;
  void *v22;
  AURemoteHost *v23;
  AURemoteHost *v24;
  id WeakRetained;
  AURemoteHost *v26;
  AURemoteHost *v27;
  unsigned __int8 v28;
  NSObject *v29;
  void *v30;
  void *v31;
  AURemoteHost *v32;
  void *v33;
  unsigned __int8 v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  AURemoteHost *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  componentFlagsMask = a3->componentFlagsMask;
  *(_OWORD *)&self->_componentDescription.componentType = *(_OWORD *)&a3->componentType;
  self->_componentDescription.componentFlagsMask = componentFlagsMask;
  v11 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("audioUnitInstanceUUID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithUUIDString:", v12);

  if (v13)
  {
    {
      caulk::log_category::log_category((caulk::log_category *)&auhs_log_category(void)::category, "com.apple.coreaudio", "AUHostingService");
    }
    v15 = objc_retainAutorelease((id)auhs_log_category(void)::category);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v39 = "AUHostingService.mm";
      v40 = 1024;
      v41 = 148;
      v42 = 2112;
      v43 = v13;
      _os_log_impl(&dword_18EE07000, v15, OS_LOG_TYPE_INFO, "%25s:%-5d Attempting to retrieve %@", buf, 0x1Cu);
    }
    +[AUHostingServiceInstanceMap sharedInstance](AUHostingServiceInstanceMap, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "retrieveInstance:", v13);
    v17 = (AURemoteHost *)objc_claimAutoreleasedReturnValue();
    host = self->_host;
    self->_host = v17;

    {
      caulk::log_category::log_category((caulk::log_category *)&auhs_log_category(void)::category, "com.apple.coreaudio", "AUHostingService");
    }
    v20 = objc_retainAutorelease((id)auhs_log_category(void)::category);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      -[AURemoteHost audioUnitUUID](self->_host, "audioUnitUUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "UUIDString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = self->_host;
      *(_DWORD *)buf = 136315906;
      v39 = "AUHostingService.mm";
      v40 = 1024;
      v41 = 150;
      v42 = 2112;
      v43 = v22;
      v44 = 2112;
      v45 = v23;
      _os_log_impl(&dword_18EE07000, v20, OS_LOG_TYPE_INFO, "%25s:%-5d Connected to Audio Unit with UUID: %@ host instance: %@", buf, 0x26u);

    }
  }
  else
  {
    v24 = [AURemoteHost alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    v26 = -[AURemoteHost initWithConnection:config:](v24, "initWithConnection:config:", WeakRetained, v8);
    v27 = self->_host;
    self->_host = v26;

    {
      caulk::log_category::log_category((caulk::log_category *)&auhs_log_category(void)::category, "com.apple.coreaudio", "AUHostingService");
    }
    v29 = objc_retainAutorelease((id)auhs_log_category(void)::category);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      -[AURemoteHost audioUnitUUID](self->_host, "audioUnitUUID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "UUIDString");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = self->_host;
      *(_DWORD *)buf = 136315906;
      v39 = "AUHostingService.mm";
      v40 = 1024;
      v41 = 153;
      v42 = 2112;
      v43 = v31;
      v44 = 2112;
      v45 = v32;
      _os_log_impl(&dword_18EE07000, v29, OS_LOG_TYPE_INFO, "%25s:%-5d Hosting Audio Unit with UUID: %@ host instance: %@", buf, 0x26u);

    }
    +[AUHostingServiceInstanceMap sharedInstance](AUHostingServiceInstanceMap, "sharedInstance");
    v20 = objc_claimAutoreleasedReturnValue();
    -[AURemoteHost audioUnitUUID](self->_host, "audioUnitUUID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject registerInstance:instance:](v20, "registerInstance:instance:", v33, self->_host);

  }
  if (self->_host)
  {
    CAFormatter::CAFormatter((CAFormatter *)&v37, &self->_componentDescription);
    {
      caulk::log_category::log_category((caulk::log_category *)&auhs_log_category(void)::category, "com.apple.coreaudio", "AUHostingService");
    }
    v35 = objc_retainAutorelease((id)auhs_log_category(void)::category);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v39 = "AUHostingService.mm";
      v40 = 1024;
      v41 = 164;
      v42 = 2080;
      v43 = v37;
      _os_log_impl(&dword_18EE07000, v35, OS_LOG_TYPE_INFO, "%25s:%-5d Hosting Audio Unit: %s", buf, 0x1Cu);
    }
    v9[2](v9, 0);
    if (v37)
      free(v37);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -10875, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v9)[2](v9, v36);

  }
}

- (void)closeHost:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  pid_t v7;
  int v8;
  BOOL v9;
  id v10;
  void *v11;
  void *v12;
  unsigned int v13;
  _QWORD aBlock[5];
  id v15;
  BOOL v16;
  audit_token_t task_info_out[2];
  audit_token_t v18;
  audit_token_t v19;
  audit_token_t atoken;
  audit_token_t task_info_outCnt;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v6 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "auditToken");
  else
    memset(&task_info_out[1], 0, sizeof(audit_token_t));
  task_info_outCnt.val[0] = 8;
  if (task_info(*MEMORY[0x1E0C83DA0], 0xFu, (task_info_t)task_info_out, task_info_outCnt.val))
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  else
  {
    task_info_outCnt = task_info_out[1];
    v7 = audit_token_to_pid(&task_info_outCnt);
    atoken = task_info_out[0];
    if (v7 == audit_token_to_pid(&atoken))
    {
      v19 = task_info_out[1];
      v8 = audit_token_to_pidversion(&v19);
      v18 = task_info_out[0];
      v9 = v8 == audit_token_to_pidversion(&v18);
    }
    else
    {
      v9 = 0;
    }

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __30__AUHostingService_closeHost___block_invoke;
    aBlock[3] = &unk_1E2921F08;
    aBlock[4] = self;
    v16 = v9;
    v10 = v4;
    v15 = v10;
    v11 = _Block_copy(aBlock);
    v12 = v11;
    if (v9)
    {
      (*((void (**)(void *))v11 + 2))(v11);
    }
    else
    {
      do
        v13 = __ldaxr((unsigned int *)&g_number_of_connections);
      while (__stlxr(v13 - 1, (unsigned int *)&g_number_of_connections));
      (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
      dispatch_async(MEMORY[0x1E0C80D38], v12);
    }

  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  AURemoteHost *host;
  objc_super v6;

  if (self->_host)
  {
    +[AUHostingServiceInstanceMap sharedInstance](AUHostingServiceInstanceMap, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AURemoteHost audioUnitUUID](self->_host, "audioUnitUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unregisterInstance:", v4);

    host = self->_host;
    self->_host = 0;

  }
  v6.receiver = self;
  v6.super_class = (Class)AUHostingService;
  -[AUHostingService dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  if (*((char *)&self->_instanceUUID.__r_.__value_.var0.__l + 23) < 0)
    operator delete(self->_instanceUUID.__r_.__value_.var0.__l.__data_);
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong((id *)&self->_host, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 3) = 0uLL;
  *((_QWORD *)self + 8) = 0;
  return self;
}

void __30__AUHostingService_closeHost___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  unsigned __int8 v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;
  id v12;
  uint64_t v13;
  unsigned int v14;
  unsigned __int8 v16;
  NSObject *v17;
  unsigned __int8 v18;
  void *v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  _QWORD *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)(a1 + 32);
  CAFormatter::CAFormatter((CAFormatter *)&v19, (const AudioComponentDescription *)(*(_QWORD *)(a1 + 32) + 24));
  v3 = *v2;
  v4 = (_QWORD *)(*v2 + 48);
  if (*(char *)(v3 + 71) < 0)
    v4 = (_QWORD *)*v4;
  {
    caulk::log_category::log_category((caulk::log_category *)&auhs_log_category(void)::category, "com.apple.coreaudio", "AUHostingService");
  }
  v6 = objc_retainAutorelease((id)auhs_log_category(void)::category);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v21 = "AUHostingService.mm";
    v22 = 1024;
    v23 = 185;
    v24 = 2080;
    v25 = v19;
    v26 = 2080;
    v27 = v4;
    _os_log_impl(&dword_18EE07000, v6, OS_LOG_TYPE_INFO, "%25s:%-5d Releasing Audio Unit %s and disconnecting from Hosting Service %s", buf, 0x26u);
  }
  +[AUHostingServiceInstanceMap sharedInstance](AUHostingServiceInstanceMap, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "audioUnitUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unregisterInstance:", v8);

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 8);
  *(_QWORD *)(v9 + 8) = 0;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "invalidate");

  v12 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(v12, "setExportedObject:", 0);

  if (*(_BYTE *)(a1 + 48))
  {
    v13 = *(_QWORD *)(a1 + 40);
    do
      v14 = __ldaxr((unsigned int *)&g_number_of_connections);
    while (__stlxr(v14 - 1, (unsigned int *)&g_number_of_connections));
    (*(void (**)(uint64_t, _QWORD))(v13 + 16))(v13, 0);
  }
  if (!atomic_load((unsigned int *)&g_number_of_connections))
  {
    {
      caulk::log_category::log_category((caulk::log_category *)&auhs_log_category(void)::category, "com.apple.coreaudio", "AUHostingService");
    }
    v17 = objc_retainAutorelease((id)auhs_log_category(void)::category);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v21 = "AUHostingService.mm";
      v22 = 1024;
      v23 = 200;
      v24 = 2080;
      v25 = v4;
      _os_log_impl(&dword_18EE07000, v17, OS_LOG_TYPE_INFO, "%25s:%-5d Shutting down Audio Unit Hosting Service %s", buf, 0x1Cu);
    }
    {
      AUHostingService_exit_handler(void)::handler = 0;
      qword_1EE168AF8 = (uint64_t)&off_1E2913908;
      qword_1EE168B10 = (uint64_t)&qword_1EE168AF8;
    }
    os_unfair_lock_lock((os_unfair_lock_t)&AUHostingService_exit_handler(void)::handler);
    if (!qword_1EE168B10)
      std::__throw_bad_function_call[abi:ne180100]();
    (*(void (**)(uint64_t))(*(_QWORD *)qword_1EE168B10 + 48))(qword_1EE168B10);
    os_unfair_lock_unlock((os_unfair_lock_t)&AUHostingService_exit_handler(void)::handler);
  }
  if (v19)
    free(v19);
}

+ (BOOL)conformsToProtocol:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if ((+[AURemoteHost conformsToProtocol:](AURemoteHost, "conformsToProtocol:", v4) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend((id)objc_msgSend(a1, "superclass"), "conformsToProtocol:", v4);

  return v5;
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  if ((+[AURemoteHost instancesRespondToSelector:](AURemoteHost, "instancesRespondToSelector:") & 1) != 0)
    return 1;
  else
    return objc_msgSend((id)objc_msgSend(a1, "superclass"), "instancesRespondToSelector:", a3);
}

@end
