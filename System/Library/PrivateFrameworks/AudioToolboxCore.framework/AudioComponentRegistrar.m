@implementation AudioComponentRegistrar

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  void *impl;
  id v6;
  id v7;
  void *v8;
  id v9;
  os_log_t v10;
  _QWORD *v11;
  NSObject *v12;
  AudioComponentPrefRegConnection *v13;
  uint64_t v14;
  _QWORD v16[4];
  id v17[2];
  id location;
  _BYTE buf[24];
  void *v20;
  id v21[4];

  v21[3] = *(id *)MEMORY[0x1E0C80C00];
  impl = self->_impl;
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "_queue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setQueue:", v8);

  v9 = (id)*((_QWORD *)impl + 13);
  if (gAudioComponentLogCategory)
  {
    v10 = *(os_log_t *)gAudioComponentLogCategory;
  }
  else
  {
    v11 = (_QWORD *)operator new();
    v11[1] = 0;
    v10 = os_log_create("com.apple.coreaudio", "audiocomp");
    *v11 = v10;
    gAudioComponentLogCategory = (uint64_t)v11;
  }
  v12 = objc_retainAutorelease(v10);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "AudioComponentRegistrar.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 195;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v9 != v6;
    LOWORD(v20) = 1024;
    *(_DWORD *)((char *)&v20 + 2) = objc_msgSend(v7, "processIdentifier");
    _os_log_impl(&dword_18EE07000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d (main %d  pid %d)", buf, 0x1Eu);
  }

  if (v9 == v6)
  {
    objc_msgSend(v7, "setExportedInterface:", *((_QWORD *)impl + 14));
    v13 = -[AudioComponentPrefRegConnection initWithRegistrar:connection:]([AudioComponentPrefRegConnection alloc], "initWithRegistrar:connection:", impl, v7);
    objc_msgSend(v7, "setExportedObject:", v13);
  }
  else
  {
    objc_msgSend(v7, "setExportedInterface:", *((_QWORD *)impl + 11));
    objc_msgSend(v7, "setRemoteObjectInterface:", *((_QWORD *)impl + 12));
    v13 = -[AudioComponentMainRegConnection initWithRegistrar:connection:]([AudioComponentMainRegConnection alloc], "initWithRegistrar:connection:", impl, v7);
    objc_msgSend(*((id *)impl + 16), "addObject:", v13);
    objc_initWeak(&location, v13);
    v14 = MEMORY[0x1E0C809B0];
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = ___ZN27AudioComponentRegistrarImpl33listenerShouldAcceptNewConnectionEP13NSXPCListenerP15NSXPCConnection_block_invoke;
    v20 = &unk_1E2922218;
    v21[1] = impl;
    objc_copyWeak(v21, &location);
    objc_msgSend(v7, "setInterruptionHandler:", buf);
    v16[0] = v14;
    v16[1] = 3221225472;
    v16[2] = ___ZN27AudioComponentRegistrarImpl33listenerShouldAcceptNewConnectionEP13NSXPCListenerP15NSXPCConnection_block_invoke_2;
    v16[3] = &unk_1E2922218;
    v17[1] = impl;
    objc_copyWeak(v17, &location);
    objc_msgSend(v7, "setInvalidationHandler:", v16);
    objc_msgSend(v7, "setExportedObject:", v13);
    objc_destroyWeak(v17);
    objc_destroyWeak(v21);
    objc_destroyWeak(&location);
  }

  objc_msgSend(v7, "resume");
  return 1;
}

- (id)initForMode:(BOOL)a3
{
  _BOOL4 v3;
  AudioComponentRegistrar *v4;
  uint64_t v5;
  AudioComponentRegistrar *v6;
  std::mutex **v7;
  id *v8;
  std::mutex *p_buf;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  std::mutex *v13;
  uint64_t v14;
  _QWORD *v15;
  os_log_t v16;
  NSObject *v17;
  uid_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  std::mutex *v27;
  uint64_t v28;
  std::mutex *v29;
  uint64_t v30;
  NSObject *v31;
  id *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  id v37;
  id *v39;
  objc_super v40;
  id *block[8];
  std::mutex buf;
  uint64_t v43;

  v3 = a3;
  v43 = *MEMORY[0x1E0C80C00];
  v40.receiver = self;
  v40.super_class = (Class)AudioComponentRegistrar;
  v4 = -[AudioComponentRegistrar init](&v40, sel_init);
  if (!v4)
    return v4;
  v5 = operator new();
  v6 = v4;
  *(_BYTE *)v5 = v3;
  *(_WORD *)(v5 + 1) = 0;
  *(_QWORD *)(v5 + 8) = dispatch_queue_create("AUExtensionScannerQueue", 0);
  *(_QWORD *)(v5 + 40) = 0;
  *(_OWORD *)(v5 + 72) = 0u;
  v7 = (std::mutex **)(v5 + 72);
  *(_OWORD *)(v5 + 104) = 0u;
  v8 = (id *)(v5 + 104);
  *(_OWORD *)(v5 + 136) = 0u;
  *(_OWORD *)(v5 + 88) = 0u;
  *(_OWORD *)(v5 + 120) = 0u;
  *(_QWORD *)(v5 + 152) = 0;
  *(_BYTE *)(v5 + 160) = 1;
  buf.__m_.__sig = (uint64_t)&off_1E2915CC0;
  *(_QWORD *)buf.__m_.__opaque = v5;
  *(_QWORD *)&buf.__m_.__opaque[16] = &buf;
  std::__function::__value_func<NSData * ()(void)>::__value_func[abi:ne180100](v5 + 168, (uint64_t)&buf);
  *(_QWORD *)(v5 + 200) = 0;
  p_buf = *(std::mutex **)&buf.__m_.__opaque[16];
  if (*(std::mutex **)&buf.__m_.__opaque[16] == &buf)
  {
    v10 = 4;
    p_buf = &buf;
  }
  else
  {
    if (!*(_QWORD *)&buf.__m_.__opaque[16])
      goto LABEL_7;
    v10 = 5;
  }
  (*(void (**)(void))(p_buf->__m_.__sig + 8 * v10))();
LABEL_7:
  v11 = v5 + 16;
  v12 = v5 + 48;
  buf.__m_.__sig = (uint64_t)&off_1E2915D08;
  *(_QWORD *)buf.__m_.__opaque = v5;
  *(_QWORD *)&buf.__m_.__opaque[16] = &buf;
  std::__function::__value_func<NSData * ()(void)>::__value_func[abi:ne180100](v5 + 208, (uint64_t)&buf);
  *(_QWORD *)(v5 + 240) = 0;
  v13 = *(std::mutex **)&buf.__m_.__opaque[16];
  if (*(std::mutex **)&buf.__m_.__opaque[16] == &buf)
  {
    v14 = 4;
    v13 = &buf;
  }
  else
  {
    if (!*(_QWORD *)&buf.__m_.__opaque[16])
      goto LABEL_12;
    v14 = 5;
  }
  (*(void (**)(void))(v13->__m_.__sig + 8 * v14))();
LABEL_12:
  v39 = (id *)(v5 + 80);
  *(_QWORD *)(v5 + 248) = 0;
  *(_QWORD *)(v5 + 256) = 0;
  *(_QWORD *)(v5 + 264) = 0;
  v15 = (_QWORD *)operator new();
  v15[1] = 0;
  v16 = os_log_create("com.apple.coreaudio", "AudioCompReg");
  *v15 = v16;
  gAudioComponentLogCategory = (uint64_t)v15;
  v17 = objc_retainAutorelease(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = getuid();
    LODWORD(buf.__m_.__sig) = 136315906;
    *(uint64_t *)((char *)&buf.__m_.__sig + 4) = (uint64_t)"AudioComponentRegistrar.mm";
    *(_WORD *)&buf.__m_.__opaque[4] = 1024;
    *(_DWORD *)&buf.__m_.__opaque[6] = 65;
    *(_WORD *)&buf.__m_.__opaque[10] = 1024;
    *(_DWORD *)&buf.__m_.__opaque[12] = v18;
    *(_WORD *)&buf.__m_.__opaque[16] = 1024;
    *(_DWORD *)&buf.__m_.__opaque[18] = v3;
    _os_log_impl(&dword_18EE07000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AudioComponentRegistrar starting (%d %d)", (uint8_t *)&buf, 0x1Eu);
  }

  AudioComponentRegistrarProtocol_XPCInterface();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v19;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE169798);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v21;

  v23 = objc_opt_new();
  v24 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v23;

  v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.audio.AudioComponentRegistrar"));
  v26 = *v39;
  *v39 = (id)v25;

  objc_msgSend(*v39, "setDelegate:", v6);
  buf.__m_.__sig = (uint64_t)&off_1E2915D50;
  *(_QWORD *)&buf.__m_.__opaque[16] = &buf;
  if (*v7 == (std::mutex *)v12)
  {
    std::__function::__func<AudioComponentRegistrarImpl::AudioComponentRegistrarImpl(BOOL,AudioComponentRegistrar *)::$_2,std::allocator<AudioComponentRegistrarImpl::AudioComponentRegistrarImpl(BOOL,AudioComponentRegistrar *)::$_2>,BOOL ()(void)>::__clone((uint64_t)&buf, block);
    *(_QWORD *)&buf.__m_.__opaque[16] = 0;
    (*(void (**)(uint64_t, std::mutex *))(*(_QWORD *)v12 + 24))(v5 + 48, &buf);
    (*(void (**)(std::mutex *))((*v7)->__m_.__sig + 32))(*v7);
    *v7 = 0;
    *(_QWORD *)&buf.__m_.__opaque[16] = &buf;
    (*((void (**)(id **, uint64_t))block[0] + 3))(block, v5 + 48);
    (*((void (**)(id **))block[0] + 4))(block);
    *v7 = (std::mutex *)v12;
    v27 = *(std::mutex **)&buf.__m_.__opaque[16];
  }
  else
  {
    std::__function::__func<AudioComponentRegistrarImpl::AudioComponentRegistrarImpl(BOOL,AudioComponentRegistrar *)::$_2,std::allocator<AudioComponentRegistrarImpl::AudioComponentRegistrarImpl(BOOL,AudioComponentRegistrar *)::$_2>,BOOL ()(void)>::__clone((uint64_t)&buf, (_QWORD *)(v5 + 48));
    v27 = *v7;
    *(_QWORD *)&buf.__m_.__opaque[16] = *v7;
    *v7 = (std::mutex *)v12;
  }
  if (v27 == &buf)
  {
    v28 = 4;
    v27 = &buf;
  }
  else
  {
    if (!v27)
      goto LABEL_22;
    v28 = 5;
  }
  (*(void (**)(void))(v27->__m_.__sig + 8 * v28))();
LABEL_22:
  buf.__m_.__sig = (uint64_t)&off_1E2915C30;
  *(_QWORD *)buf.__m_.__opaque = v5;
  *(_QWORD *)&buf.__m_.__opaque[16] = &buf;
  if (*(_QWORD *)(v5 + 40) == v11)
  {
    std::__function::__func<AudioComponentRegistrarImpl::_initSubsystems(void)::$_0,std::allocator<AudioComponentRegistrarImpl::_initSubsystems(void)::$_0>,void ()(AudioComponentVector const&,AudioComponentVector&)>::__clone((uint64_t)&buf, block);
    *(_QWORD *)&buf.__m_.__opaque[16] = 0;
    (*(void (**)(uint64_t, std::mutex *))(*(_QWORD *)v11 + 24))(v5 + 16, &buf);
    (*(void (**)(_QWORD))(**(_QWORD **)(v5 + 40) + 32))(*(_QWORD *)(v5 + 40));
    *(_QWORD *)(v5 + 40) = 0;
    *(_QWORD *)&buf.__m_.__opaque[16] = &buf;
    (*((void (**)(id **, uint64_t))block[0] + 3))(block, v5 + 16);
    (*((void (**)(id **))block[0] + 4))(block);
    *(_QWORD *)(v5 + 40) = v11;
    v29 = *(std::mutex **)&buf.__m_.__opaque[16];
  }
  else
  {
    std::__function::__func<AudioComponentRegistrarImpl::_initSubsystems(void)::$_0,std::allocator<AudioComponentRegistrarImpl::_initSubsystems(void)::$_0>,void ()(AudioComponentVector const&,AudioComponentVector&)>::__clone((uint64_t)&buf, (_QWORD *)(v5 + 16));
    v29 = *(std::mutex **)(v5 + 40);
    *(_QWORD *)&buf.__m_.__opaque[16] = v29;
    *(_QWORD *)(v5 + 40) = v11;
  }
  if (v29 == &buf)
  {
    v30 = 4;
    v29 = &buf;
  }
  else
  {
    if (!v29)
      goto LABEL_30;
    v30 = 5;
  }
  v29 = (std::mutex *)(*(uint64_t (**)(void))(v29->__m_.__sig + 8 * v30))();
LABEL_30:
  buf.__m_.__sig = 850045863;
  memset(buf.__m_.__opaque, 0, sizeof(buf.__m_.__opaque));
  if (PlatformUtilities_iOS::IsInternalBuild((PlatformUtilities_iOS *)v29))
  {
    v31 = dispatch_group_create();
    v32 = (id *)operator new();
    *v32 = 0;
    block[0] = 0;
    std::unique_ptr<AudioComponentPluginScanner>::reset[abi:ne180100]((id **)(v5 + 248), v32);
    std::unique_ptr<AudioComponentPluginScanner>::reset[abi:ne180100](block, 0);
    dispatch_get_global_queue(25, 0);
    v33 = objc_claimAutoreleasedReturnValue();
    block[0] = (id *)MEMORY[0x1E0C809B0];
    block[1] = (id *)3221225472;
    block[2] = (id *)___ZN27AudioComponentRegistrarImpl15_initSubsystemsEv_block_invoke;
    block[3] = (id *)&__block_descriptor_57_e5_v8__0l;
    block[4] = (id *)v5;
    block[5] = (id *)&buf;
    block[6] = (id *)v5;
    dispatch_group_async(v31, v33, block);

    if (v31)
    {
      dispatch_group_wait(v31, 0xFFFFFFFFFFFFFFFFLL);

    }
  }
  std::mutex::~mutex(&buf);
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE16F950);
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = *(void **)(v5 + 112);
    *(_QWORD *)(v5 + 112) = v34;

    v36 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.audio.AudioComponentPrefs"));
    v37 = *v8;
    *v8 = (id)v36;

    objc_msgSend(*v8, "setDelegate:", v6);
  }

  v6->_impl = (void *)v5;
  return v4;
}

- (void)dealloc
{
  os_log_t v3;
  _QWORD *v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (gAudioComponentLogCategory)
  {
    v3 = *(os_log_t *)gAudioComponentLogCategory;
  }
  else
  {
    v4 = (_QWORD *)operator new();
    v4[1] = 0;
    v3 = os_log_create("com.apple.coreaudio", "audiocomp");
    *v4 = v3;
    gAudioComponentLogCategory = (uint64_t)v4;
  }
  v5 = objc_retainAutorelease(v3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "AudioComponentRegistrar.mm";
    v9 = 1024;
    v10 = 565;
    _os_log_impl(&dword_18EE07000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AudioComponentRegistrar stopping", buf, 0x12u);
  }
  v6.receiver = self;
  v6.super_class = (Class)AudioComponentRegistrar;
  -[AudioComponentRegistrar dealloc](&v6, sel_dealloc);
}

- (void)resumeListeners
{
  id *impl;

  impl = (id *)self->_impl;
  objc_msgSend(impl[10], "resume");
  if (!*(_BYTE *)impl)
    objc_msgSend(impl[13], "resume");
}

- (void)impl
{
  return self->_impl;
}

- (id)replaceListener:(id)a3 withListener:(id)a4
{
  char *impl;
  id v6;
  id v7;
  id *v8;
  id v9;

  impl = (char *)self->_impl;
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.audio.AudioComponentRegistrar")))
  {
    v8 = (id *)(impl + 80);
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.audio.AudioComponentPrefs")))
    {
      v9 = 0;
      goto LABEL_7;
    }
    v8 = (id *)(impl + 104);
  }
  v9 = *v8;
  objc_storeStrong(v8, a4);
LABEL_7:

  return v9;
}

@end
