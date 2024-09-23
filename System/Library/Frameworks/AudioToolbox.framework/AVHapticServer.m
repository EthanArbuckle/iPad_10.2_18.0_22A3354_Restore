@implementation AVHapticServer

- (AVHapticServer)init
{
  char *v3;
  id v4;
  ServerManager *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  double v10;
  double v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  AVHapticServer *v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  _QWORD *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  id v28;
  id v30;
  _QWORD v31[4];
  id v32;
  objc_super v33;
  BOOL v34;
  id location[6];
  _BYTE buf[40];
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (setupServerLogScopes(void)::once != -1)
    dispatch_once(&setupServerLogScopes(void)::once, &__block_literal_global_290);
  v33.receiver = self;
  v33.super_class = (Class)AVHapticServer;
  v3 = -[AVHapticServer init](&v33, sel_init);
  v4 = v3;
  if (!v3)
    goto LABEL_39;
  *(_OWORD *)(v3 + 168) = 0u;
  *(_OWORD *)(v3 + 152) = 0u;
  *((_QWORD *)v3 + 23) = 0;
  *((_QWORD *)v3 + 24) = 1792;
  v5 = (ServerManager *)operator new();
  ServerManager::ServerManager(v5);
  *((_QWORD *)v4 + 15) = v5;
  if ((objc_msgSend(v4, "setupSSSClient") & 1) != 0)
  {
    objc_initWeak(location, v4);
    v6 = operator new();
    v7 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __22__AVHapticServer_init__block_invoke;
    v31[3] = &unk_1E450C8E8;
    objc_copyWeak(&v32, location);
    v8 = v31;
    v9 = dispatch_queue_create("PowerTimerDispatchQueue", 0);
    *(_QWORD *)v6 = v9;
    *(_QWORD *)(v6 + 8) = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v9);
    *(_BYTE *)(v6 + 16) = 0;
    v34 = 0;
    CACFPreferencesGetAppFloatValue(CFSTR("haptic_ontime_threshold"), CFSTR("com.apple.coreaudio"), &v34);
    if (!v34 || (v11 = v10, v10 <= 0.0))
    {
LABEL_31:
      v19 = *(NSObject **)(v6 + 8);
      *(_QWORD *)buf = v7;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = ___ZN10PowerTimerC2EU13block_pointerFvvE_block_invoke;
      *(_QWORD *)&buf[24] = &unk_1E450C5F8;
      *(_QWORD *)&buf[32] = v8;
      v37 = v6;
      v20 = v8;
      dispatch_source_set_event_handler(v19, buf);
      dispatch_resume(*(dispatch_object_t *)(v6 + 8));

      *((_QWORD *)v4 + 27) = v6;
      v30 = v4;
      CACentralStateDumpRegisterSubsystem();
      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5F07E8);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)*((_QWORD *)v30 + 14);
      *((_QWORD *)v30 + 14) = v21;

      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5F4998);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)*((_QWORD *)v30 + 13);
      *((_QWORD *)v30 + 13) = v23;

      v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.audio.hapticd"));
      v26 = (void *)*((_QWORD *)v30 + 1);
      *((_QWORD *)v30 + 1) = v25;

      objc_msgSend(*((id *)v30 + 1), "setDelegate:", v30);
      objc_msgSend(*((id *)v30 + 1), "resume");
      PowerTimer::start(*((PowerTimer **)v4 + 27), *(double *)&PowerTimer::_sTimeout);
      if (kHSRVScope)
      {
        v27 = *(id *)kHSRVScope;
        if (!v27)
        {
LABEL_38:

          objc_destroyWeak(&v32);
          objc_destroyWeak(location);
LABEL_39:
          v15 = (AVHapticServer *)v4;
          goto LABEL_40;
        }
      }
      else
      {
        v27 = MEMORY[0x1E0C81028];
        v28 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "AVHapticServer.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 1764;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = "-[AVHapticServer init]";
        _os_log_impl(&dword_1A0F4D000, v27, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Server ready", buf, 0x1Cu);
      }

      goto LABEL_38;
    }
    if (kHSRVScope)
    {
      v12 = *(id *)kHSRVScope;
      if (!v12)
        goto LABEL_22;
    }
    else
    {
      v12 = MEMORY[0x1E0C81028];
      v16 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "AVHapticServer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 141;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "PowerTimer";
      *(_WORD *)&buf[28] = 2048;
      *(double *)&buf[30] = v11;
      _os_log_impl(&dword_1A0F4D000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: PowerTimer using on-time threshold of %.1f seconds", buf, 0x26u);
    }

LABEL_22:
    PowerTimer::_sOnTimeThreshold = *(_QWORD *)&v11;
    if (v11 >= *(double *)&PowerTimer::_sTimeout)
      goto LABEL_31;
    if (kHSRVScope)
    {
      v17 = *(id *)kHSRVScope;
      if (!v17)
      {
LABEL_30:
        PowerTimer::_sTimeout = PowerTimer::_sOnTimeThreshold;
        goto LABEL_31;
      }
    }
    else
    {
      v17 = MEMORY[0x1E0C81028];
      v18 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "AVHapticServer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 144;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "PowerTimer";
      _os_log_impl(&dword_1A0F4D000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: PowerTimer timeout set to match threshold", buf, 0x1Cu);
    }

    goto LABEL_30;
  }
  if (!kHSRVScope)
  {
    v13 = MEMORY[0x1E0C81028];
    v14 = MEMORY[0x1E0C81028];
    goto LABEL_14;
  }
  v13 = *(id *)kHSRVScope;
  if (v13)
  {
LABEL_14:
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "AVHapticServer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1697;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "-[AVHapticServer init]";
      _os_log_impl(&dword_1A0F4D000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Failed to set up SSS client -- server bailing out", buf, 0x1Cu);
    }

  }
  objc_msgSend(v4, "cleanup");
  v15 = 0;
LABEL_40:

  return v15;
}

- (void)cleanup
{
  char *manager;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  _BYTE *v7;
  ClientEntry *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char v24;
  char *v25;
  _BYTE *v26;
  uint64_t v27;

  manager = (char *)self->_manager;
  if (manager)
  {
    v4 = *((_QWORD *)manager + 25);
    v23 = manager + 24;
    v24 = 1;
    std::__shared_mutex_base::lock((std::__shared_mutex_base *)(manager + 24));
    v25 = manager;
    v26 = manager + 192;
    v27 = v4;
    manager[192] = 1;
    v5 = *(_QWORD **)manager;
    v6 = manager + 8;
    v7 = manager + 192;
    if (*(char **)manager != manager + 8)
    {
      do
      {
        v8 = (ClientEntry *)v5[5];
        v9 = (std::__shared_weak_count *)v5[6];
        if (v9)
        {
          p_shared_owners = (unint64_t *)&v9->__shared_owners_;
          do
            v11 = __ldxr(p_shared_owners);
          while (__stxr(v11 + 1, p_shared_owners));
        }
        ClientEntry::uninitialize(v8);
        if (v9)
        {
          v12 = (unint64_t *)&v9->__shared_owners_;
          do
            v13 = __ldaxr(v12);
          while (__stlxr(v13 - 1, v12));
          if (!v13)
          {
            ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
            std::__shared_weak_count::__release_weak(v9);
          }
        }
        v14 = (_QWORD *)v5[1];
        if (v14)
        {
          do
          {
            v15 = v14;
            v14 = (_QWORD *)*v14;
          }
          while (v14);
        }
        else
        {
          do
          {
            v15 = (_QWORD *)v5[2];
            v16 = *v15 == (_QWORD)v5;
            v5 = v15;
          }
          while (!v16);
        }
        v5 = v15;
      }
      while (v15 != v6);
      v7 = v26;
    }
    *v7 = 0;
    std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v23);
    v17 = *((_QWORD *)manager + 25);
    v23 = manager + 24;
    v24 = 1;
    std::__shared_mutex_base::lock((std::__shared_mutex_base *)(manager + 24));
    v25 = manager;
    v26 = manager + 192;
    v27 = v17;
    manager[192] = 1;
    std::__tree<std::__value_type<unsigned long,std::shared_ptr<ClientEntry>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::shared_ptr<ClientEntry>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::shared_ptr<ClientEntry>>>>::destroy(*((_QWORD **)manager + 1));
    *((_QWORD *)manager + 1) = 0;
    *((_QWORD *)manager + 2) = 0;
    *(_QWORD *)manager = v6;
    manager[192] = 0;
    std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v23);
    if (HapticMessenger::_sMessenger)
    {
      v18 = MEMORY[0x1A1B07324]();
      MEMORY[0x1A1B07B34](v18, 0x20C40A4A59CD2);
    }
    HapticMessenger::_sMessenger = 0;
    v19 = (void *)*((_QWORD *)manager + 60);
    *((_QWORD *)manager + 60) = 0;

    std::shared_ptr<PowerUsageWatchdog::ClientDescription>::~shared_ptr[abi:ne180100]((uint64_t)(manager + 456));
    std::shared_ptr<PowerUsageWatchdog::ClientDescription>::~shared_ptr[abi:ne180100]((uint64_t)(manager + 440));
    v20 = *((_QWORD *)manager + 54);
    *((_QWORD *)manager + 54) = 0;
    if (v20)
      (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
    std::unique_ptr<AudioEventManager>::reset[abi:ne180100]((uint64_t *)manager + 53);
    CADeprecated::CAMutex::~CAMutex((CADeprecated::CAMutex *)(manager + 328));
    CADeprecated::CAMutex::~CAMutex((CADeprecated::CAMutex *)(manager + 240));
    v21 = *((_QWORD *)manager + 29);
    *((_QWORD *)manager + 29) = 0;
    if (v21)
      (*(void (**)(uint64_t))(*(_QWORD *)v21 + 8))(v21);
    std::__list_imp<ServerManager::SynthCommand,caulk::rt_allocator<ServerManager::SynthCommand>>::clear((_QWORD *)manager + 26);
    v22 = RTLocked<std::map,unsigned long,std::shared_ptr<ClientEntry>>::~RTLocked((uint64_t)manager);
    MEMORY[0x1A1B07B34](v22, 0x10F0C4046860FD6);
  }
  self->_manager = 0;
}

- (void)dealloc
{
  objc_super v3;

  -[AVHapticServer cleanup](self, "cleanup");
  v3.receiver = self;
  v3.super_class = (Class)AVHapticServer;
  -[AVHapticServer dealloc](&v3, sel_dealloc);
}

- (BOOL)setupSSSClient
{
  AVHapticServer *v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t **manager;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  std::__shared_weak_count *v10;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t *p_shared_weak_owners;
  unint64_t v16;
  unint64_t v17;
  char v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  BOOL v22;
  id v23;
  id v24;
  int v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  CAXException *exception;
  id v31;
  uint64_t v32;
  std::__shared_weak_count *v33;
  uint8_t buf[40];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v3 = -[AVHapticServer addProcessEntry:](v2, "addProcessEntry:", getpid());
  if (v3 == -1)
  {
    v25 = 1;
    goto LABEL_41;
  }
  if (kHSRVScope)
  {
    v4 = *(id *)kHSRVScope;
    if (!v4)
      goto LABEL_9;
  }
  else
  {
    v4 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "AVHapticServer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1787;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[AVHapticServer setupSSSClient]";
    *(_WORD *)&buf[28] = 2048;
    *(_QWORD *)&buf[30] = v3;
    _os_log_impl(&dword_1A0F4D000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Setting up persistant client for SSS: ID: 0x%lx", buf, 0x26u);
  }

LABEL_9:
  v6 = operator new();
  manager = (uint64_t **)v2->_manager;
  memset(buf, 0, 32);
  ClientEntry::ClientEntry(v6, v3, buf, (uint64_t)manager, 1, 1);
  *(_QWORD *)v6 = &off_1E4515C68;
  *(_DWORD *)(v6 + 1304) = 0;
  *(_QWORD *)(v6 + 1312) = -1;
  *(_QWORD *)(v6 + 1320) = -1;
  *(_BYTE *)(v6 + 1328) = 0;
  v32 = v6;
  v8 = (std::__shared_weak_count *)operator new();
  v8->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v8->__shared_owners_;
  v8->__vftable = (std::__shared_weak_count_vtbl *)&off_1E4516078;
  v8->__shared_weak_owners_ = 0;
  v8[1].__vftable = (std::__shared_weak_count_vtbl *)v6;
  v33 = v8;
  v10 = *(std::__shared_weak_count **)(v6 + 16);
  if (!v10)
  {
    do
      v14 = __ldxr(p_shared_owners);
    while (__stxr(v14 + 1, p_shared_owners));
    p_shared_weak_owners = (unint64_t *)&v8->__shared_weak_owners_;
    do
      v16 = __ldxr(p_shared_weak_owners);
    while (__stxr(v16 + 1, p_shared_weak_owners));
    *(_QWORD *)(v6 + 8) = v6;
    *(_QWORD *)(v6 + 16) = v8;
    do
LABEL_19:
      v17 = __ldaxr(p_shared_owners);
    while (__stlxr(v17 - 1, p_shared_owners));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
    goto LABEL_22;
  }
  if (v10->__shared_owners_ == -1)
  {
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
    v12 = (unint64_t *)&v8->__shared_weak_owners_;
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
    *(_QWORD *)(v6 + 8) = v6;
    *(_QWORD *)(v6 + 16) = v8;
    std::__shared_weak_count::__release_weak(v10);
    goto LABEL_19;
  }
LABEL_22:
  v18 = ServerManager::addEntry(manager, &v32, 0);
  v19 = v33;
  if (v33)
  {
    v20 = (unint64_t *)&v33->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  if ((v18 & 1) == 0)
  {
    exception = (CAXException *)__cxa_allocate_exception(0x110uLL);
    CAXException::CAXException(exception, "Failed to add SSSClientEntry to parent", -4898);
  }
  if (_os_feature_enabled_impl())
    *(_BYTE *)(v6 + 1328) = 1;
  v31 = 0;
  v22 = -[AVHapticServer incrementInit:](v2, "incrementInit:", &v31);
  v23 = v31;
  v24 = v31;
  if (v22)
  {
    v25 = 0;
    v2->_SSSClientID = v3;
  }
  else
  {
    ServerManager::entryForID((ServerManager *)buf, (uint64_t)v2->_manager, v3);
    ClientEntry::uninitialize(*(ClientEntry **)buf);
    objc_storeStrong((id *)&v2->_savedError, v23);
    v26 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v27 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v28 = __ldaxr(v27);
      while (__stlxr(v28 - 1, v27));
      if (!v28)
      {
        ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
        std::__shared_weak_count::__release_weak(v26);
      }
    }
    v25 = 1;
  }

LABEL_41:
  objc_sync_exit(v2);

  return v25 == 0;
}

- (int)loadSynthPreset
{
  PlatformUtilities *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  int TuningInSubdirs;
  PlatformUtilities_iOS *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  const __CFString *AUPListByName;
  const __CFString *v13;
  _QWORD *manager;
  char *v15;
  int v16;
  HapticSynth *v17;
  NSObject *v18;
  id v19;
  int v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  OpaqueAudioComponentInstance *v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  id v28;
  id v29;
  NSObject *v30;
  id v31;
  int Count;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  id v36;
  id v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  int UInt32;
  NSObject *v42;
  NSObject *v43;
  unsigned int v44;
  int v45;
  id v46;
  id v47;
  id v48;
  unsigned int v49;
  NSObject *v50;
  id v51;
  int v52;
  id v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v56;
  id v57;
  id v58;
  id v59;
  const char *v60;
  id v61;
  id v63;
  int v64;
  const __CFString *v65;
  __int16 v66;
  uint64_t v67;
  char v68;
  _BYTE v69[56];
  CFArrayRef v70;
  __int16 v71;
  unsigned int v72;
  void *Mutable;
  __int16 v74;
  CFArrayRef theArray;
  __int16 v76;
  CFStringRef v77;
  __int16 v78;
  int inData;
  _BYTE buf[40];
  __int16 v81;
  unsigned int v82;
  __int16 v83;
  int v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  TuningPListMgr::TuningPListMgr((TuningPListMgr *)v69, "/Library/Audio/Tunings");
  v4 = PlatformUtilities::CopyHardwareModelShortName(v3);
  v67 = v4;
  v68 = 1;
  if (kHSRVScope)
  {
    v5 = *(id *)kHSRVScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "AVHapticServer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1812;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[AVHapticServer loadSynthPreset]";
    *(_WORD *)&buf[28] = 2112;
    *(_QWORD *)&buf[30] = v4;
    _os_log_impl(&dword_1A0F4D000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Product: '%@'", buf, 0x26u);
  }

LABEL_8:
  v77 = CFStringCreateWithCString(0, "Haptics", 0x600u);
  LOBYTE(v78) = 1;
  theArray = (CFArrayRef)CFStringCreateWithCString(0, "hapticengineconfig", 0x600u);
  LOBYTE(v76) = 1;
  *(_QWORD *)buf = &v67;
  *(_QWORD *)&buf[8] = &v77;
  *(_QWORD *)&buf[16] = &theArray;
  TuningInSubdirs = TuningPListMgr::loadTuningInSubdirs_();
  CACFString::~CACFString((CACFString *)&theArray);
  CACFString::~CACFString((CACFString *)&v77);
  if (!TuningInSubdirs)
    goto LABEL_21;
  if ((PlatformUtilities_iOS::ProductSupportsClosedLoopHaptics(v8) & 1) != 0)
    goto LABEL_18;
  if (kHSRVScope)
  {
    v9 = *(id *)kHSRVScope;
    if (!v9)
      goto LABEL_17;
  }
  else
  {
    v9 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "AVHapticServer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1815;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[AVHapticServer loadSynthPreset]";
    _os_log_impl(&dword_1A0F4D000, v9, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Product does not support closed loop haptics, loading generic config", buf, 0x1Cu);
  }

LABEL_17:
  v77 = CFStringCreateWithCString(0, "Generic", 0x600u);
  LOBYTE(v78) = 1;
  theArray = (CFArrayRef)CFStringCreateWithCString(0, "Haptics", 0x600u);
  LOBYTE(v76) = 1;
  Mutable = (void *)CFStringCreateWithCString(0, "Config", 0x600u);
  LOBYTE(v74) = 1;
  v70 = (CFArrayRef)CFStringCreateWithCString(0, "hapticengineconfig", 0x600u);
  LOBYTE(v71) = 1;
  *(_QWORD *)buf = &v77;
  *(_QWORD *)&buf[8] = &theArray;
  *(_QWORD *)&buf[16] = &Mutable;
  *(_QWORD *)&buf[24] = &v70;
  TuningInSubdirs = TuningPListMgr::loadTuningInSubdirs_();
  CACFString::~CACFString((CACFString *)&v70);
  CACFString::~CACFString((CACFString *)&Mutable);
  CACFString::~CACFString((CACFString *)&theArray);
  CACFString::~CACFString((CACFString *)&v77);
  if (TuningInSubdirs)
  {
LABEL_18:
    if (kHSRVScope)
    {
      v11 = *(id *)kHSRVScope;
      if (!v11)
      {
LABEL_29:
        v20 = -43;
        goto LABEL_190;
      }
    }
    else
    {
      v11 = MEMORY[0x1E0C81028];
      v19 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "AVHapticServer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1819;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "-[AVHapticServer loadSynthPreset]";
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = TuningInSubdirs;
      _os_log_impl(&dword_1A0F4D000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unable to load the configuration plist: err %d", buf, 0x22u);
    }

    goto LABEL_29;
  }
LABEL_21:
  AUPListByName = (const __CFString *)TuningPListMgr::getAUPListByName((TuningPListMgr *)v69, "hapticengineconfig");
  v13 = AUPListByName;
  if (!AUPListByName)
  {
    if (kHSRVScope)
    {
      v21 = *(id *)kHSRVScope;
      if (!v21)
      {
LABEL_58:
        v20 = -50;
        goto LABEL_190;
      }
    }
    else
    {
      v21 = MEMORY[0x1E0C81028];
      v28 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "AVHapticServer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1824;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "-[AVHapticServer loadSynthPreset]";
      _os_log_impl(&dword_1A0F4D000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unable to access the configuration dictionary", buf, 0x1Cu);
    }

    goto LABEL_58;
  }
  CFRetain(AUPListByName);
  v65 = v13;
  v66 = 1;
  manager = self->_manager;
  v15 = (char *)(manager + 30);
  v16 = (*(uint64_t (**)(_QWORD *))(manager[30] + 16))(manager + 30);
  v17 = (HapticSynth *)manager[29];
  inData = 1;
  if (kHSYNScope)
  {
    v18 = *(id *)kHSYNScope;
    if (!v18)
      goto LABEL_37;
  }
  else
  {
    v18 = MEMORY[0x1E0C81028];
    v22 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "HapticSynth_Parser.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 224;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "loadPresetDictionary";
    _os_log_impl(&dword_1A0F4D000, v18, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Cleaning out all old preset data", buf, 0x1Cu);
  }

LABEL_37:
  v23 = *((_QWORD *)v17 + 24);
  if (v23)
    v24 = *(OpaqueAudioComponentInstance **)(v23 + 16);
  else
    v24 = 0;
  v20 = AudioUnitSetProperty(v24, 0x1029u, 0, 0, &inData, 4u);
  if (v20)
  {
    if (kHPRSScope)
    {
      v25 = *(id *)kHPRSScope;
      if (!v25)
        goto LABEL_52;
    }
    else
    {
      v25 = MEMORY[0x1E0C81028];
      v27 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "HapticSynth_Parser.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 227;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "loadPresetDictionary";
      _os_log_impl(&dword_1A0F4D000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Unable to clean the AU state", buf, 0x1Cu);
    }

LABEL_52:
    if (v16)
      goto LABEL_188;
    goto LABEL_189;
  }
  v77 = v13;
  v78 = 0;
  if (CACFDictionary::HasKey((CACFDictionary *)&v77, CFSTR("Configuration")))
  {
    if (kHPRSScope)
    {
      v26 = *(id *)kHPRSScope;
      if (!v26)
        goto LABEL_63;
    }
    else
    {
      v26 = MEMORY[0x1E0C81028];
      v29 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "HapticSynth_Parser.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 237;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "loadPresetDictionary";
      _os_log_impl(&dword_1A0F4D000, v26, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Preset includes configuration dict", buf, 0x1Cu);
    }

LABEL_63:
    theArray = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v76 = 257;
    CACFDictionary::GetCACFDictionary((CACFDictionary *)&v77, CFSTR("Configuration"), (CACFDictionary *)&theArray);
    LODWORD(Mutable) = 0;
    if (!CACFDictionary::GetFloat32((CACFDictionary *)&theArray, CFSTR("BaseSineFrequency"), (float *)&Mutable))
    {
LABEL_73:
      CACFDictionary::~CACFDictionary((CACFDictionary *)&theArray);
      goto LABEL_74;
    }
    if (kHPRSScope)
    {
      v30 = *(id *)kHPRSScope;
      if (!v30)
        goto LABEL_71;
    }
    else
    {
      v30 = MEMORY[0x1E0C81028];
      v31 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "HapticSynth_Parser.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 242;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "loadPresetDictionary";
      *(_WORD *)&buf[28] = 2048;
      *(double *)&buf[30] = *(float *)&Mutable;
      _os_log_impl(&dword_1A0F4D000, v30, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: baseSineFreq: %f", buf, 0x26u);
    }

LABEL_71:
    if (*(float *)&Mutable > 0.0)
    {
      ServerConfiguration::sSineFrequency = (int)Mutable;
      goto LABEL_73;
    }
    if (kHPRSScope)
    {
      v35 = *(id *)kHPRSScope;
      if (!v35)
      {
LABEL_150:
        CACFDictionary::~CACFDictionary((CACFDictionary *)&theArray);
        v20 = -50;
        goto LABEL_187;
      }
    }
    else
    {
      v35 = MEMORY[0x1E0C81028];
      v53 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "HapticSynth_Parser.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 247;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "loadPresetDictionary";
      *(_WORD *)&buf[28] = 2048;
      *(double *)&buf[30] = *(float *)&Mutable;
      _os_log_impl(&dword_1A0F4D000, v35, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Illegal base sine frequency: %f", buf, 0x26u);
    }

    goto LABEL_150;
  }
LABEL_74:
  if (!CACFDictionary::HasKey((CACFDictionary *)&v77, CFSTR("Events")))
  {
LABEL_145:
    v20 = 0;
    goto LABEL_187;
  }
  theArray = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  v76 = 257;
  CACFDictionary::GetCACFArray((CACFDictionary *)&v77, CFSTR("Events"), (CACFArray *)&theArray);
  if (!theArray || (Count = CFArrayGetCount(theArray)) == 0)
  {
    if (kHPRSScope)
    {
      v34 = *(id *)kHPRSScope;
      if (!v34)
      {
LABEL_90:
        v20 = -50;
        goto LABEL_186;
      }
    }
    else
    {
      v34 = MEMORY[0x1E0C81028];
      v36 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "HapticSynth_Parser.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 258;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "loadPresetDictionary";
      _os_log_impl(&dword_1A0F4D000, v34, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Empty events array", buf, 0x1Cu);
    }

    goto LABEL_90;
  }
  v64 = Count;
  if (!kHPRSScope)
  {
    v33 = MEMORY[0x1E0C81028];
    v37 = MEMORY[0x1E0C81028];
    goto LABEL_92;
  }
  v33 = *(id *)kHPRSScope;
  if (v33)
  {
LABEL_92:
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "HapticSynth_Parser.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 261;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "loadPresetDictionary";
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v64;
      _os_log_impl(&dword_1A0F4D000, v33, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Preset has %u events", buf, 0x22u);
    }

  }
  v38 = 0;
  while (1)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v74 = 257;
    CACFArray::GetCACFDictionary((CACFArray *)&theArray, v38, (CACFDictionary *)&Mutable);
    if (!Mutable)
    {
      if (kHPRSScope)
      {
        v54 = *(id *)kHPRSScope;
        if (!v54)
        {
LABEL_170:
          CACFDictionary::~CACFDictionary((CACFDictionary *)&Mutable);
          goto LABEL_90;
        }
      }
      else
      {
        v54 = MEMORY[0x1E0C81028];
        v57 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "HapticSynth_Parser.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 314;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = "loadPresetDictionary";
        _os_log_impl(&dword_1A0F4D000, v54, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Invalid event dictionary entry", buf, 0x1Cu);
      }

      goto LABEL_170;
    }
    if (kHPRSScope)
    {
      if ((*(_BYTE *)(kHPRSScope + 8) & 1) != 0)
      {
        v39 = *(id *)kHPRSScope;
        if (v39)
        {
          v40 = v39;
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)&buf[4] = "HapticSynth_Parser.mm";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 267;
            *(_WORD *)&buf[18] = 2080;
            *(_QWORD *)&buf[20] = "loadPresetDictionary";
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = v38;
            _os_log_impl(&dword_1A0F4D000, v40, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Event %d:", buf, 0x22u);
          }

        }
      }
    }
    v72 = 0;
    UInt32 = CACFDictionary::GetUInt32((CACFDictionary *)&Mutable, CFSTR("TypeID"), &v72);
    if (!UInt32)
    {
      if (kHPRSScope)
      {
        v43 = *(id *)kHPRSScope;
        if (!v43)
        {
          v44 = -1;
          v45 = -1;
          goto LABEL_126;
        }
      }
      else
      {
        v43 = MEMORY[0x1E0C81028];
        v47 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "HapticSynth_Parser.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 284;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = "loadPresetDictionary";
        _os_log_impl(&dword_1A0F4D000, v43, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: No top-level type ID -- we'll search in the Layers", buf, 0x1Cu);
      }
      v44 = -1;
      v45 = -1;
      goto LABEL_125;
    }
    if (kHPRSScope)
    {
      v42 = *(id *)kHPRSScope;
      if (!v42)
        goto LABEL_114;
    }
    else
    {
      v42 = MEMORY[0x1E0C81028];
      v46 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "HapticSynth_Parser.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 273;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "loadPresetDictionary";
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v72;
      *(_WORD *)&buf[34] = 1024;
      *(_DWORD *)&buf[36] = v72;
      _os_log_impl(&dword_1A0F4D000, v42, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: ID: %u (0x%x)", buf, 0x28u);
    }

LABEL_114:
    v44 = v72;
    v45 = BYTE1(v72);
    if ((BYTE1(v72) | v72) >= 0x80)
      break;
    if (!kHPRSScope)
    {
      v43 = MEMORY[0x1E0C81028];
      v48 = MEMORY[0x1E0C81028];
LABEL_123:
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136316674;
        *(_QWORD *)&buf[4] = "HapticSynth_Parser.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 281;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = "loadPresetDictionary";
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = v44 < 0x55;
        *(_WORD *)&buf[34] = 1024;
        *(_DWORD *)&buf[36] = v44 > 0x2C;
        v81 = 1024;
        v82 = v44;
        v83 = 1024;
        v84 = v45;
        _os_log_impl(&dword_1A0F4D000, v43, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: audio: %d haptic: %d keynum: %d velocity: %d", buf, 0x34u);
      }
LABEL_125:

      goto LABEL_126;
    }
    v43 = *(id *)kHPRSScope;
    if (v43)
      goto LABEL_123;
LABEL_126:
    if (!CACFDictionary::HasKey((CACFDictionary *)&Mutable, CFSTR("Layers")))
    {
      if (kHPRSScope)
      {
        v55 = *(id *)kHPRSScope;
        if (!v55)
          goto LABEL_184;
      }
      else
      {
        v55 = MEMORY[0x1E0C81028];
        v58 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "HapticSynth_Parser.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 305;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = "loadPresetDictionary";
        _os_log_impl(&dword_1A0F4D000, v55, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: No layers array", buf, 0x1Cu);
      }
      goto LABEL_174;
    }
    v70 = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
    v71 = 257;
    CACFDictionary::GetCACFArray((CACFDictionary *)&Mutable, CFSTR("Layers"), (CACFArray *)&v70);
    if (v70)
      v49 = CFArrayGetCount(v70);
    else
      v49 = 0;
    if (kHPRSScope)
    {
      v50 = *(id *)kHPRSScope;
      if (!v50)
        goto LABEL_137;
    }
    else
    {
      v50 = MEMORY[0x1E0C81028];
      v51 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "HapticSynth_Parser.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 291;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "loadPresetDictionary";
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v49;
      _os_log_impl(&dword_1A0F4D000, v50, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Event has %u layers", buf, 0x22u);
    }

LABEL_137:
    if (!v49)
    {
      if (kHPRSScope)
      {
        v56 = *(id *)kHPRSScope;
        if (!v56)
          goto LABEL_183;
      }
      else
      {
        v56 = MEMORY[0x1E0C81028];
        v59 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "HapticSynth_Parser.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 293;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = "loadPresetDictionary";
        v60 = "%25s:%-5d %s: Empty layers array";
        goto LABEL_181;
      }
LABEL_182:

      goto LABEL_183;
    }
    if (v49 > 2)
      v52 = UInt32;
    else
      v52 = 0;
    if (v52 == 1)
    {
      if (kHPRSScope)
      {
        v56 = *(id *)kHPRSScope;
        if (!v56)
        {
LABEL_183:
          CACFArray::~CACFArray((CACFArray *)&v70);
          goto LABEL_184;
        }
      }
      else
      {
        v56 = MEMORY[0x1E0C81028];
        v61 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "HapticSynth_Parser.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 297;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = "loadPresetDictionary";
        v60 = "%25s:%-5d %s: Cannot have more than 2 layers";
LABEL_181:
        _os_log_impl(&dword_1A0F4D000, v56, OS_LOG_TYPE_ERROR, v60, buf, 0x1Cu);
      }
      goto LABEL_182;
    }
    v20 = HapticSynth::walkLayerList(v17, &v70, v44, v45);
    CACFArray::~CACFArray((CACFArray *)&v70);
    if (v20)
      goto LABEL_185;
    *(_DWORD *)buf = 0;
    CACFDictionary::GetFloat32((CACFDictionary *)&Mutable, CFSTR("Gain"), (float *)buf);
    CACFDictionary::~CACFDictionary((CACFDictionary *)&Mutable);
    v38 = (v38 + 1);
    if (v64 == (_DWORD)v38)
    {
      CACFArray::~CACFArray((CACFArray *)&theArray);
      goto LABEL_145;
    }
  }
  if (kHPRSScope)
  {
    v55 = *(id *)kHPRSScope;
    if (!v55)
      goto LABEL_184;
  }
  else
  {
    v55 = MEMORY[0x1E0C81028];
    v63 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "HapticSynth_Parser.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 276;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "loadPresetDictionary";
    _os_log_impl(&dword_1A0F4D000, v55, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Illegal Event ID", buf, 0x1Cu);
  }
LABEL_174:

LABEL_184:
  v20 = -50;
LABEL_185:
  CACFDictionary::~CACFDictionary((CACFDictionary *)&Mutable);
LABEL_186:
  CACFArray::~CACFArray((CACFArray *)&theArray);
LABEL_187:
  CACFDictionary::~CACFDictionary((CACFDictionary *)&v77);
  if (v16)
LABEL_188:
    (*(void (**)(char *))(*(_QWORD *)v15 + 24))(v15);
LABEL_189:
  CACFDictionary::~CACFDictionary((CACFDictionary *)&v65);
LABEL_190:
  CACFString::~CACFString((CACFString *)&v67);
  MEMORY[0x1A1B06F28](v69);
  return v20;
}

- (BOOL)incrementInit:(id *)a3
{
  unint64_t initCount;
  NSObject *v6;
  NSObject *v7;
  unint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD *manager;
  char *v12;
  int v13;
  int v14;
  NSObject *v15;
  id v16;
  const char *v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  id v26;
  unint64_t runningChannelIDCount;
  int v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  initCount = self->_initCount;
  self->_initCount = initCount + 1;
  if (initCount)
  {
    if (kHSRVScope)
    {
      if ((*(_BYTE *)(kHSRVScope + 8) & 1) != 0)
      {
        v6 = *(id *)kHSRVScope;
        if (v6)
        {
          v7 = v6;
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          {
            v8 = self->_initCount;
            v29 = 136315906;
            v30 = "AVHapticServer.mm";
            v31 = 1024;
            v32 = 1848;
            v33 = 2080;
            v34 = "-[AVHapticServer incrementInit:]";
            v35 = 1024;
            LODWORD(v36) = v8;
            _os_log_impl(&dword_1A0F4D000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: init count -> %u", (uint8_t *)&v29, 0x22u);
          }

        }
      }
    }
    goto LABEL_35;
  }
  if (kHSRVScope)
  {
    v9 = *(id *)kHSRVScope;
    if (!v9)
      goto LABEL_15;
  }
  else
  {
    v9 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v29 = 136315650;
    v30 = "AVHapticServer.mm";
    v31 = 1024;
    v32 = 1836;
    v33 = 2080;
    v34 = "-[AVHapticServer incrementInit:]";
    _os_log_impl(&dword_1A0F4D000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: init count now 1 -- initializing and loading synth", (uint8_t *)&v29, 0x1Cu);
  }

LABEL_15:
  manager = self->_manager;
  v12 = (char *)(manager + 30);
  v13 = (*(uint64_t (**)(_QWORD *))(manager[30] + 16))(manager + 30);
  v14 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)manager[29] + 16))(manager[29]);
  if (v13)
    (*(void (**)(char *))(*(_QWORD *)v12 + 24))(v12);
  if (v14)
  {
    if (kHSRVScope)
    {
      v15 = *(id *)kHSRVScope;
      if (!v15)
        goto LABEL_33;
    }
    else
    {
      v15 = MEMORY[0x1E0C81028];
      v16 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v29 = 136315650;
      v30 = "AVHapticServer.mm";
      v31 = 1024;
      v32 = 1838;
      v33 = 2080;
      v34 = "-[AVHapticServer incrementInit:]";
      v17 = "%25s:%-5d %s: ERROR: failed to initialize haptic synth AU";
LABEL_31:
      _os_log_impl(&dword_1A0F4D000, v15, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v29, 0x1Cu);
      goto LABEL_32;
    }
    goto LABEL_32;
  }
  v14 = -[AVHapticServer loadSynthPreset](self, "loadSynthPreset");
  if (!v14)
    goto LABEL_35;
  if (!kHSRVScope)
  {
    v15 = MEMORY[0x1E0C81028];
    v18 = MEMORY[0x1E0C81028];
LABEL_29:
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v29 = 136315650;
      v30 = "AVHapticServer.mm";
      v31 = 1024;
      v32 = 1841;
      v33 = 2080;
      v34 = "-[AVHapticServer incrementInit:]";
      v17 = "%25s:%-5d %s: ERROR: failed to load haptic preset";
      goto LABEL_31;
    }
LABEL_32:

    goto LABEL_33;
  }
  v15 = *(id *)kHSRVScope;
  if (v15)
    goto LABEL_29;
LABEL_33:
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), v14, 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    *a3 = v19;
    goto LABEL_36;
  }
LABEL_35:
  v19 = *a3;
LABEL_36:
  if (!v19)
  {
    if (kHSRVScope)
    {
      v20 = *(id *)kHSRVScope;
      if (!v20)
        return v19 == 0;
    }
    else
    {
      v20 = MEMORY[0x1E0C81028];
      v26 = MEMORY[0x1E0C81028];
    }
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      goto LABEL_50;
    runningChannelIDCount = self->_runningChannelIDCount;
    v29 = 136315906;
    v30 = "AVHapticServer.mm";
    v31 = 1024;
    v32 = 1854;
    v33 = 2080;
    v34 = "-[AVHapticServer incrementInit:]";
    v35 = 1024;
    LODWORD(v36) = runningChannelIDCount;
    v23 = "%25s:%-5d %s: _runningChannelIDCount at 0x%x";
    v24 = v20;
    v25 = 34;
    goto LABEL_49;
  }
  if (kHSRVScope)
  {
    v20 = *(id *)kHSRVScope;
    if (!v20)
      return v19 == 0;
  }
  else
  {
    v20 = MEMORY[0x1E0C81028];
    v21 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v22 = *a3;
    v29 = 136315906;
    v30 = "AVHapticServer.mm";
    v31 = 1024;
    v32 = 1851;
    v33 = 2080;
    v34 = "-[AVHapticServer incrementInit:]";
    v35 = 2112;
    v36 = v22;
    v23 = "%25s:%-5d %s: Returning outError %@";
    v24 = v20;
    v25 = 38;
LABEL_49:
    _os_log_impl(&dword_1A0F4D000, v24, OS_LOG_TYPE_INFO, v23, (uint8_t *)&v29, v25);
  }
LABEL_50:

  return v19 == 0;
}

- (void)decrementInit
{
  unint64_t initCount;
  uint64_t v4;
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;
  unint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD *manager;
  int v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  initCount = self->_initCount;
  if (!initCount)
  {
    if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
    {
      v13 = 136315394;
      v14 = "AVHapticServer.mm";
      v15 = 1024;
      v16 = 1860;
      _os_log_impl(&dword_1A0F4D000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d ASSERTION FAILURE [(_initCount > 0) != 0 is false]: ", (uint8_t *)&v13, 0x12u);
    }
    __break(1u);
  }
  v4 = kHSRVScope;
  v5 = initCount - 1;
  self->_initCount = v5;
  if (v5)
  {
    if (v4)
    {
      if ((*(_BYTE *)(v4 + 8) & 1) != 0)
      {
        v6 = *(id *)v4;
        if (v6)
        {
          v7 = v6;
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          {
            v8 = self->_initCount;
            v13 = 136315906;
            v14 = "AVHapticServer.mm";
            v15 = 1024;
            v16 = 1866;
            v17 = 2080;
            v18 = "-[AVHapticServer decrementInit]";
            v19 = 1024;
            v20 = v8;
            _os_log_impl(&dword_1A0F4D000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: init count -> %u", (uint8_t *)&v13, 0x22u);
          }

        }
      }
    }
    return;
  }
  if (!v4)
  {
    v9 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
    goto LABEL_13;
  }
  v9 = *(id *)v4;
  if (v9)
  {
LABEL_13:
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v13 = 136315650;
      v14 = "AVHapticServer.mm";
      v15 = 1024;
      v16 = 1862;
      v17 = 2080;
      v18 = "-[AVHapticServer decrementInit]";
      _os_log_impl(&dword_1A0F4D000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: init count now 0 -- uninit'ing synth", (uint8_t *)&v13, 0x1Cu);
    }

  }
  manager = self->_manager;
  v12 = (*(uint64_t (**)(_QWORD *))(manager[30] + 16))(manager + 30);
  (*(void (**)(_QWORD))(*(_QWORD *)manager[29] + 24))(manager[29]);
  if (v12)
    (*(void (**)(_QWORD *))(manager[30] + 24))(manager + 30);
}

- (void)incrementPrewarmCountForAudio:(BOOL)a3 haptics:(BOOL)a4 entry:(shared_ptr<ClientEntry>)a5
{
  ClientEntry *var0;
  _BOOL4 v6;
  uint64_t v8;
  NSObject *v9;
  id v10;
  int v11;
  _BOOL8 v12;
  NSObject *v13;
  unint64_t hapticsPrewarmCount;
  id v15;
  _BOOL4 v16;
  uint64_t *p_hapticsPrewarmCount;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  int v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  var0 = a5.var0;
  v6 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (a3)
  {
    if (kHSRVScope)
    {
      v9 = *(id *)kHSRVScope;
      if (!v9)
        goto LABEL_9;
    }
    else
    {
      v9 = MEMORY[0x1E0C81028];
      v10 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = LODWORD(self->_audioPrewarmCount) + v8;
      v23 = 136315906;
      v24 = "AVHapticServer.mm";
      v25 = 1024;
      v26 = 1875;
      v27 = 2080;
      v28 = "-[AVHapticServer incrementPrewarmCountForAudio:haptics:entry:]";
      v29 = 1024;
      v30 = v11;
      _os_log_impl(&dword_1A0F4D000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: audio prewarm count will be %u", (uint8_t *)&v23, 0x22u);
    }

  }
LABEL_9:
  v12 = v6;
  if (!v6)
  {
    hapticsPrewarmCount = self->_hapticsPrewarmCount;
    self->_audioPrewarmCount += v8;
    self->_hapticsPrewarmCount = hapticsPrewarmCount;
    return;
  }
  if (kHSRVScope)
  {
    v13 = *(id *)kHSRVScope;
    if (!v13)
      goto LABEL_18;
  }
  else
  {
    v13 = MEMORY[0x1E0C81028];
    v15 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v16 = LODWORD(self->_hapticsPrewarmCount) + v12;
    v23 = 136315906;
    v24 = "AVHapticServer.mm";
    v25 = 1024;
    v26 = 1876;
    v27 = 2080;
    v28 = "-[AVHapticServer incrementPrewarmCountForAudio:haptics:entry:]";
    v29 = 1024;
    v30 = v16;
    _os_log_impl(&dword_1A0F4D000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: haptics prewarm count will be %u", (uint8_t *)&v23, 0x22u);
  }

LABEL_18:
  v18 = self->_hapticsPrewarmCount;
  p_hapticsPrewarmCount = (uint64_t *)&self->_hapticsPrewarmCount;
  *(p_hapticsPrewarmCount - 1) += v8;
  *p_hapticsPrewarmCount = v18 + v12;
  v19 = *(_QWORD *)(*(_QWORD *)var0 + 24);
  CADeprecated::TSingleton<HapticMetrics>::instance();
  HapticMetrics::logPowerLogEvent(1, *p_hapticsPrewarmCount, (PlatformUtilities *)(v19 & 0xFFFFFF), *(unsigned int *)(*(_QWORD *)var0 + 112));
  v20 = CADeprecated::TSingleton<HapticMetrics>::instance();
  if (*(_BYTE *)(v20 + 18))
    return;
  if (!kHMETScope)
  {
    v21 = MEMORY[0x1E0C81028];
    v22 = MEMORY[0x1E0C81028];
    goto LABEL_23;
  }
  v21 = *(id *)kHMETScope;
  if (v21)
  {
LABEL_23:
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v23 = 136315650;
      v24 = "HapticMetrics.mm";
      v25 = 1024;
      v26 = 100;
      v27 = 2080;
      v28 = "markEnginePrewarmOn";
      _os_log_impl(&dword_1A0F4D000, v21, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: marking engine prewarm on and reset prewarm timer", (uint8_t *)&v23, 0x1Cu);
    }

  }
  std::mutex::lock((std::mutex *)(v20 + 32));
  *(double *)(v20 + 8) = (double)mach_absolute_time() * 0.0000000416666667;
  *(_BYTE *)(v20 + 17) = 1;
  std::mutex::unlock((std::mutex *)(v20 + 32));
}

- (void)decrementPrewarmCountAndStopAudio:(BOOL)a3 stopHaptics:(BOOL)a4 entry:(shared_ptr<ClientEntry>)a5
{
  ClientEntry *var0;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v9;
  _BOOL4 v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  int v14;
  unint64_t *p_audioPrewarmCount;
  unint64_t *p_hapticsPrewarmCount;
  _BOOL8 v17;
  _BOOL8 v18;
  id v19;
  int v20;
  unint64_t hapticsPrewarmCount;
  PlatformUtilities *v22;
  NSObject *v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  const char *v30;
  int v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  uint64_t v39;

  var0 = a5.var0;
  v6 = a4;
  v7 = a3;
  v39 = *MEMORY[0x1E0C80C00];
  if (a3 && !self->_audioPrewarmCount)
  {
    if (!os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
      goto LABEL_54;
    v31 = 136315394;
    v32 = "AVHapticServer.mm";
    v33 = 1024;
    v34 = 1888;
    v30 = "%25s:%-5d ASSERTION FAILURE [(!audio || _audioPrewarmCount > 0) != 0 is false]: ";
    goto LABEL_53;
  }
  if (a4 && !self->_hapticsPrewarmCount)
  {
    if (!os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
      goto LABEL_54;
    v31 = 136315394;
    v32 = "AVHapticServer.mm";
    v33 = 1024;
    v34 = 1889;
    v30 = "%25s:%-5d ASSERTION FAILURE [(!haptics || _hapticsPrewarmCount > 0) != 0 is false]: ";
LABEL_53:
    _os_log_impl(&dword_1A0F4D000, 0, OS_LOG_TYPE_ERROR, v30, (uint8_t *)&v31, 0x12u);
LABEL_54:
    __break(1u);
  }
  v9 = a3;
  v10 = a4;
  if (!a3)
    goto LABEL_8;
  if (kHSRVScope)
  {
    v11 = *(id *)kHSRVScope;
    if (!v11)
    {
LABEL_8:
      if (v6)
        goto LABEL_9;
LABEL_16:
      p_audioPrewarmCount = &self->_audioPrewarmCount;
      self->_audioPrewarmCount -= v7;
      p_hapticsPrewarmCount = &self->_hapticsPrewarmCount;
      self->_hapticsPrewarmCount -= v6;
      if (v7)
        goto LABEL_24;
      goto LABEL_17;
    }
  }
  else
  {
    v11 = MEMORY[0x1E0C81028];
    v13 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14 = LODWORD(self->_audioPrewarmCount) - v9;
    v31 = 136315906;
    v32 = "AVHapticServer.mm";
    v33 = 1024;
    v34 = 1892;
    v35 = 2080;
    v36 = "-[AVHapticServer decrementPrewarmCountAndStopAudio:stopHaptics:entry:]";
    v37 = 1024;
    LODWORD(v38) = v14;
    _os_log_impl(&dword_1A0F4D000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: audio prewarm count will be %u", (uint8_t *)&v31, 0x22u);
  }

  if (!v6)
    goto LABEL_16;
LABEL_9:
  if (kHSRVScope)
  {
    v12 = *(id *)kHSRVScope;
    if (!v12)
      goto LABEL_23;
  }
  else
  {
    v12 = MEMORY[0x1E0C81028];
    v19 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v20 = LODWORD(self->_hapticsPrewarmCount) - v10;
    v31 = 136315906;
    v32 = "AVHapticServer.mm";
    v33 = 1024;
    v34 = 1893;
    v35 = 2080;
    v36 = "-[AVHapticServer decrementPrewarmCountAndStopAudio:stopHaptics:entry:]";
    v37 = 1024;
    LODWORD(v38) = v20;
    _os_log_impl(&dword_1A0F4D000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: haptics prewarm count will be %u", (uint8_t *)&v31, 0x22u);
  }

LABEL_23:
  p_audioPrewarmCount = &self->_audioPrewarmCount;
  p_hapticsPrewarmCount = &self->_hapticsPrewarmCount;
  hapticsPrewarmCount = self->_hapticsPrewarmCount;
  self->_audioPrewarmCount -= v7;
  self->_hapticsPrewarmCount = hapticsPrewarmCount - v6;
  v22 = (PlatformUtilities *)(*(_QWORD *)(*(_QWORD *)var0 + 24) & 0xFFFFFFLL);
  CADeprecated::TSingleton<HapticMetrics>::instance();
  HapticMetrics::logPowerLogEvent(1, self->_hapticsPrewarmCount, v22, *(unsigned int *)(*(_QWORD *)var0 + 112));
  if (v7)
  {
LABEL_24:
    v17 = *p_audioPrewarmCount == 0;
    if (v6)
      goto LABEL_25;
LABEL_18:
    v18 = 0;
    goto LABEL_26;
  }
LABEL_17:
  v17 = 0;
  if (!v6)
    goto LABEL_18;
LABEL_25:
  v18 = *p_hapticsPrewarmCount == 0;
LABEL_26:
  if (!v17 && !v18)
    return;
  if (kHSRVScope)
  {
    v23 = *(id *)kHSRVScope;
    if (!v23)
      goto LABEL_38;
  }
  else
  {
    v23 = MEMORY[0x1E0C81028];
    v24 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v25 = "audio prewarm count";
    if (v6)
      v25 = "audio and haptics prewarm counts";
    v31 = 136315906;
    v32 = "AVHapticServer.mm";
    v33 = 1024;
    v34 = 1904;
    v35 = 2080;
    v36 = "-[AVHapticServer decrementPrewarmCountAndStopAudio:stopHaptics:entry:]";
    if (!v7)
      v25 = "haptics prewarm count";
    v37 = 2080;
    v38 = v25;
    _os_log_impl(&dword_1A0F4D000, v23, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: %s at zero, calling stopPrewarm on synth", (uint8_t *)&v31, 0x26u);
  }

LABEL_38:
  ServerManager::stopSynthPrewarm((ServerManager *)self->_manager, v17, v18, 9999999);
  if (v18)
  {
    v26 = CADeprecated::TSingleton<HapticMetrics>::instance();
    if (!*(_BYTE *)(v26 + 18))
    {
      v27 = v26;
      if (kHMETScope)
      {
        v28 = *(id *)kHMETScope;
        if (!v28)
        {
LABEL_47:
          std::mutex::lock((std::mutex *)(v27 + 32));
          *(_BYTE *)(v27 + 17) = 0;
          *(_QWORD *)(v27 + 8) = 0;
          std::mutex::unlock((std::mutex *)(v27 + 32));
          return;
        }
      }
      else
      {
        v28 = MEMORY[0x1E0C81028];
        v29 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        v31 = 136315650;
        v32 = "HapticMetrics.mm";
        v33 = 1024;
        v34 = 112;
        v35 = 2080;
        v36 = "markEnginePrewarmOff";
        _os_log_impl(&dword_1A0F4D000, v28, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: marking engine prewarm off", (uint8_t *)&v31, 0x1Cu);
      }

      goto LABEL_47;
    }
  }
}

- (void)incrementRunningCountForAudio:(BOOL)a3 haptics:(BOOL)a4 entry:(shared_ptr<ClientEntry>)a5
{
  ClientEntry *var0;
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v9;
  NSObject *v10;
  id v11;
  _BOOL4 v12;
  NSObject *v13;
  id v14;
  _BOOL4 v15;
  unint64_t v16;
  unint64_t v17;
  BOOL v18;
  NSObject *v19;
  id v20;
  _BOOL8 v21;
  void *manager;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  _QWORD v30[3];
  _QWORD *v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  _BOOL4 v39;
  uint64_t v40;

  var0 = a5.var0;
  v6 = a4;
  v7 = a3;
  v40 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (a3)
  {
    if (kHSRVScope)
    {
      v10 = *(id *)kHSRVScope;
      if (!v10)
        goto LABEL_9;
    }
    else
    {
      v10 = MEMORY[0x1E0C81028];
      v11 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = LODWORD(self->_audioRunningCount) + v9;
      *(_DWORD *)buf = 136315906;
      v33 = "AVHapticServer.mm";
      v34 = 1024;
      v35 = 1916;
      v36 = 2080;
      v37 = "-[AVHapticServer incrementRunningCountForAudio:haptics:entry:]";
      v38 = 1024;
      v39 = v12;
      _os_log_impl(&dword_1A0F4D000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: audio running count will be %u", buf, 0x22u);
    }

  }
LABEL_9:
  if (!v6)
    goto LABEL_17;
  if (kHSRVScope)
  {
    v13 = *(id *)kHSRVScope;
    if (!v13)
      goto LABEL_17;
  }
  else
  {
    v13 = MEMORY[0x1E0C81028];
    v14 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = LODWORD(self->_hapticsRunningCount) + v6;
    *(_DWORD *)buf = 136315906;
    v33 = "AVHapticServer.mm";
    v34 = 1024;
    v35 = 1917;
    v36 = 2080;
    v37 = "-[AVHapticServer incrementRunningCountForAudio:haptics:entry:]";
    v38 = 1024;
    v39 = v15;
    _os_log_impl(&dword_1A0F4D000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: haptics running count will be %u", buf, 0x22u);
  }

LABEL_17:
  v16 = self->_audioRunningCount + v9;
  v17 = self->_hapticsRunningCount + v6;
  self->_audioRunningCount = v16;
  self->_hapticsRunningCount = v17;
  v18 = v16 == 1 || v17 == 1;
  if (!v18
    || ((*(uint64_t (**)(_QWORD, _BOOL8, _BOOL8, _QWORD, ClientEntry *, __shared_weak_count *))(**((_QWORD **)self->_manager + 29) + 64))(*((_QWORD *)self->_manager + 29), v7, v6, *(unsigned int *)(*(_QWORD *)var0 + 24), a5.var0, a5.var1) & 1) != 0)
  {
    goto LABEL_35;
  }
  if (!kHSRVScope)
  {
    v19 = MEMORY[0x1E0C81028];
    v20 = MEMORY[0x1E0C81028];
    goto LABEL_27;
  }
  v19 = *(id *)kHSRVScope;
  if (v19)
  {
LABEL_27:
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v33 = "AVHapticServer.mm";
      v34 = 1024;
      v35 = 1925;
      v36 = 2080;
      v37 = "-[AVHapticServer incrementRunningCountForAudio:haptics:entry:]";
      _os_log_impl(&dword_1A0F4D000, v19, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Synth was stopped due to interruption. Restarting synth", buf, 0x1Cu);
    }

  }
  v21 = (*(_QWORD *)(*(_QWORD *)var0 + 96) & 4) == 0;
  manager = self->_manager;
  v23 = *(unsigned int *)(*(_QWORD *)var0 + 24);
  v30[0] = &off_1E450CAE0;
  v31 = v30;
  ServerManager::startSynthRunning((uint64_t)manager, v7, v6, v21, v23, (uint64_t)v30);
  v24 = v31;
  if (v31 == v30)
  {
    v25 = 4;
    v24 = v30;
    goto LABEL_34;
  }
  if (v31)
  {
    v25 = 5;
LABEL_34:
    (*(void (**)(void))(*v24 + 8 * v25))();
  }
LABEL_35:
  if (v6)
  {
    v26 = *(_QWORD *)(*(_QWORD *)var0 + 24);
    CADeprecated::TSingleton<HapticMetrics>::instance();
    HapticMetrics::logPowerLogEvent(0, self->_hapticsRunningCount, (PlatformUtilities *)(v26 & 0xFFFFFF), *(unsigned int *)(*(_QWORD *)var0 + 112));
    v27 = CADeprecated::TSingleton<HapticMetrics>::instance();
    if (!*(_BYTE *)(v27 + 18))
    {
      if (kHMETScope)
      {
        v28 = *(id *)kHMETScope;
        if (!v28)
        {
LABEL_44:
          objc_msgSend(*(id *)(v27 + 24), "start");
          std::mutex::lock((std::mutex *)(v27 + 32));
          *(double *)v27 = (double)mach_absolute_time() * 0.0000000416666667;
          *(_BYTE *)(v27 + 16) = 1;
          std::mutex::unlock((std::mutex *)(v27 + 32));
          return;
        }
      }
      else
      {
        v28 = MEMORY[0x1E0C81028];
        v29 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        v33 = "HapticMetrics.mm";
        v34 = 1024;
        v35 = 65;
        v36 = 2080;
        v37 = "markEngineOn";
        _os_log_impl(&dword_1A0F4D000, v28, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: marking engine on", buf, 0x1Cu);
      }

      goto LABEL_44;
    }
  }
}

- (void)decrementRunningCountAndStopAudio:(BOOL)a3 stopHaptics:(BOOL)a4 entry:(shared_ptr<ClientEntry>)a5
{
  ClientEntry *var0;
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL4 v9;
  _BOOL4 v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  int v14;
  unint64_t *p_audioRunningCount;
  unint64_t *p_hapticsRunningCount;
  id v17;
  int v18;
  unint64_t hapticsRunningCount;
  PlatformUtilities *v20;
  NSObject *v21;
  id v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  id v26;
  const char *v27;
  HapticMetrics *v28;
  const char *v29;
  int v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  uint64_t v38;

  var0 = a5.var0;
  v6 = a4;
  v7 = a3;
  v38 = *MEMORY[0x1E0C80C00];
  if (a3 && !self->_audioRunningCount)
  {
    if (!os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
      goto LABEL_52;
    v30 = 136315394;
    v31 = "AVHapticServer.mm";
    v32 = 1024;
    v33 = 1942;
    v29 = "%25s:%-5d ASSERTION FAILURE [(!audio || _audioRunningCount > 0) != 0 is false]: ";
    goto LABEL_51;
  }
  if (a4 && !self->_hapticsRunningCount)
  {
    if (!os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
      goto LABEL_52;
    v30 = 136315394;
    v31 = "AVHapticServer.mm";
    v32 = 1024;
    v33 = 1943;
    v29 = "%25s:%-5d ASSERTION FAILURE [(!haptics || _hapticsRunningCount > 0) != 0 is false]: ";
LABEL_51:
    _os_log_impl(&dword_1A0F4D000, 0, OS_LOG_TYPE_ERROR, v29, (uint8_t *)&v30, 0x12u);
LABEL_52:
    __break(1u);
  }
  v9 = a3;
  v10 = a4;
  if (!a3)
    goto LABEL_8;
  if (kHSRVScope)
  {
    v11 = *(id *)kHSRVScope;
    if (!v11)
    {
LABEL_8:
      if (v6)
        goto LABEL_9;
      goto LABEL_16;
    }
  }
  else
  {
    v11 = MEMORY[0x1E0C81028];
    v13 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14 = LODWORD(self->_audioRunningCount) - v9;
    v30 = 136315906;
    v31 = "AVHapticServer.mm";
    v32 = 1024;
    v33 = 1946;
    v34 = 2080;
    v35 = "-[AVHapticServer decrementRunningCountAndStopAudio:stopHaptics:entry:]";
    v36 = 1024;
    LODWORD(v37) = v14;
    _os_log_impl(&dword_1A0F4D000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: audio running count will be %u", (uint8_t *)&v30, 0x22u);
  }

  if (v6)
  {
LABEL_9:
    if (kHSRVScope)
    {
      v12 = *(id *)kHSRVScope;
      if (!v12)
        goto LABEL_22;
    }
    else
    {
      v12 = MEMORY[0x1E0C81028];
      v17 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v18 = LODWORD(self->_hapticsRunningCount) - v10;
      v30 = 136315906;
      v31 = "AVHapticServer.mm";
      v32 = 1024;
      v33 = 1947;
      v34 = 2080;
      v35 = "-[AVHapticServer decrementRunningCountAndStopAudio:stopHaptics:entry:]";
      v36 = 1024;
      LODWORD(v37) = v18;
      _os_log_impl(&dword_1A0F4D000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: haptics running count will be %u", (uint8_t *)&v30, 0x22u);
    }

LABEL_22:
    p_audioRunningCount = &self->_audioRunningCount;
    p_hapticsRunningCount = &self->_hapticsRunningCount;
    hapticsRunningCount = self->_hapticsRunningCount;
    self->_audioRunningCount -= v7;
    self->_hapticsRunningCount = hapticsRunningCount - v6;
    v20 = (PlatformUtilities *)(*(_QWORD *)(*(_QWORD *)var0 + 24) & 0xFFFFFFLL);
    CADeprecated::TSingleton<HapticMetrics>::instance();
    HapticMetrics::logPowerLogEvent(0, self->_hapticsRunningCount, v20, *(unsigned int *)(*(_QWORD *)var0 + 112));
    if (!v7)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_16:
  p_audioRunningCount = &self->_audioRunningCount;
  self->_audioRunningCount -= v7;
  p_hapticsRunningCount = &self->_hapticsRunningCount;
  self->_hapticsRunningCount -= v6;
  if (v7)
LABEL_23:
    v7 = *p_audioRunningCount == 0;
LABEL_24:
  if (v6)
    v6 = *p_hapticsRunningCount == 0;
  if (v7 || v6)
  {
    if (v7 && v6)
    {
      if (kHSRVScope)
      {
        v21 = *(id *)kHSRVScope;
        if (!v21)
          goto LABEL_44;
      }
      else
      {
        v21 = MEMORY[0x1E0C81028];
        v22 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v30 = 136315650;
        v31 = "AVHapticServer.mm";
        v32 = 1024;
        v33 = 1958;
        v34 = 2080;
        v35 = "-[AVHapticServer decrementRunningCountAndStopAudio:stopHaptics:entry:]";
        v23 = "%25s:%-5d %s: audio and haptics running counts at zero and stopping synth";
        v24 = v21;
        v25 = 28;
LABEL_42:
        _os_log_impl(&dword_1A0F4D000, v24, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v30, v25);
      }
    }
    else
    {
      if (kHSRVScope)
      {
        v21 = *(id *)kHSRVScope;
        if (!v21)
        {
LABEL_44:
          ServerManager::stopSynthRunning((ServerManager *)self->_manager, v7, v6, 9999999);
          if (v6)
          {
            v28 = (HapticMetrics *)CADeprecated::TSingleton<HapticMetrics>::instance();
            HapticMetrics::markEngineOff(v28);
          }
          return;
        }
      }
      else
      {
        v21 = MEMORY[0x1E0C81028];
        v26 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v27 = "haptics running count";
        v30 = 136315906;
        v31 = "AVHapticServer.mm";
        v32 = 1024;
        v33 = 1962;
        v35 = "-[AVHapticServer decrementRunningCountAndStopAudio:stopHaptics:entry:]";
        v34 = 2080;
        if (v7)
          v27 = "audio running count";
        v36 = 2080;
        v37 = v27;
        v23 = "%25s:%-5d %s: %s at zero, stopping synth";
        v24 = v21;
        v25 = 38;
        goto LABEL_42;
      }
    }

    goto LABEL_44;
  }
}

- (unint64_t)getChannelID
{
  return self->_runningChannelIDCount;
}

- (void)incrementChannelID
{
  ++self->_runningChannelIDCount;
}

- (void)addListener:(id)a3 forAudioSessionID:(unsigned int)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  recursive_mutex *p_instanceMutex;
  char *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, NSMutableArray<AVServerWrapper *> *>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, NSMutableArray<AVServerWrapper *> *>, void *>>> *v14;
  unsigned int v15;
  BOOL v16;
  char **v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, NSMutableArray<AVServerWrapper *> *>, void *>>> *v23;
  unsigned int v24;
  _DWORD *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  int v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  unsigned int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (kHSRVScope)
  {
    v7 = *(id *)kHSRVScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = (id)MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "serverInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 136316162;
    v31 = "AVHapticServer.mm";
    v32 = 1024;
    v33 = 1984;
    v34 = 2080;
    v35 = "-[AVHapticServer addListener:forAudioSessionID:]";
    v36 = 2048;
    v37 = v10;
    v38 = 1024;
    v39 = a4;
    _os_log_impl(&dword_1A0F4D000, v9, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Adding listener containing AVHapticServerInstance %p for audio session ID %u", (uint8_t *)&v30, 0x2Cu);

  }
LABEL_8:
  p_instanceMutex = &self->_instanceMutex;
  std::recursive_mutex::lock((std::recursive_mutex *)&self->_instanceMutex);
  p_pair1 = &self->_instanceMap.__tree_.__pair1_;
  left = (char *)self->_instanceMap.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    v14 = &self->_instanceMap.__tree_.__pair1_;
    do
    {
      v15 = *((_DWORD *)left + 8);
      v16 = v15 >= a4;
      if (v15 >= a4)
        v17 = (char **)left;
      else
        v17 = (char **)(left + 8);
      if (v16)
        v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, NSMutableArray<AVServerWrapper *> *>, void *>>> *)left;
      left = *v17;
    }
    while (*v17);
    if (v14 != p_pair1 && LODWORD(v14[4].__value_.__left_) <= a4)
    {
      if (kHSRVScope)
      {
        v28 = *(id *)kHSRVScope;
        if (!v28)
        {
LABEL_46:
          v21 = v14[5].__value_.__left_;
          goto LABEL_41;
        }
      }
      else
      {
        v28 = MEMORY[0x1E0C81028];
        v29 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        v30 = 136315650;
        v31 = "AVHapticServer.mm";
        v32 = 1024;
        v33 = 1994;
        v34 = 2080;
        v35 = "-[AVHapticServer addListener:forAudioSessionID:]";
        _os_log_impl(&dword_1A0F4D000, v28, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Adding to existing listeners for this session", (uint8_t *)&v30, 0x1Cu);
      }

      goto LABEL_46;
    }
  }
  if (!kHSRVScope)
  {
    v18 = MEMORY[0x1E0C81028];
    v19 = MEMORY[0x1E0C81028];
    goto LABEL_23;
  }
  v18 = *(id *)kHSRVScope;
  if (v18)
  {
LABEL_23:
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v30 = 136315650;
      v31 = "AVHapticServer.mm";
      v32 = 1024;
      v33 = 1989;
      v34 = 2080;
      v35 = "-[AVHapticServer addListener:forAudioSessionID:]";
      _os_log_impl(&dword_1A0F4D000, v18, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: First listener for this session", (uint8_t *)&v30, 0x1Cu);
    }

  }
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = v20;
  v22 = p_pair1->__value_.__left_;
  v23 = &self->_instanceMap.__tree_.__pair1_;
  if (p_pair1->__value_.__left_)
  {
    while (1)
    {
      while (1)
      {
        v23 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, NSMutableArray<AVServerWrapper *> *>, void *>>> *)v22;
        v24 = *((_DWORD *)v22 + 8);
        if (v24 <= a4)
          break;
        v22 = v23->__value_.__left_;
        p_pair1 = v23;
        if (!v23->__value_.__left_)
          goto LABEL_33;
      }
      if (v24 >= a4)
        break;
      v22 = v23[1].__value_.__left_;
      if (!v22)
      {
        p_pair1 = v23 + 1;
        goto LABEL_33;
      }
    }
    v27 = v20;
  }
  else
  {
LABEL_33:
    v25 = operator new(0x30uLL);
    v25[8] = a4;
    *((_QWORD *)v25 + 5) = v21;
    *(_QWORD *)v25 = 0;
    *((_QWORD *)v25 + 1) = 0;
    *((_QWORD *)v25 + 2) = v23;
    p_pair1->__value_.__left_ = v25;
    v26 = *(void **)self->_instanceMap.__tree_.__begin_node_;
    if (v26)
    {
      self->_instanceMap.__tree_.__begin_node_ = v26;
      v25 = p_pair1->__value_.__left_;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)self->_instanceMap.__tree_.__pair1_.__value_.__left_, (uint64_t *)v25);
    v27 = 0;
    ++self->_instanceMap.__tree_.__pair3_.__value_;
  }

LABEL_41:
  objc_msgSend(v21, "addObject:", v6);
  std::recursive_mutex::unlock((std::recursive_mutex *)p_instanceMutex);

}

- (void)removeListener:(id)a3 withAudioSessionID:(unsigned int)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  char *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, NSMutableArray<AVServerWrapper *> *>, void *>>> *p_pair1;
  unsigned int v13;
  BOOL v14;
  char **v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  id v19;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, NSMutableArray<AVServerWrapper *> *>, void *>>> *v20;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, NSMutableArray<AVServerWrapper *> *>, void *>>> **v21;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, NSMutableArray<AVServerWrapper *> *>, void *>>> *v22;
  BOOL v23;
  uint64_t *v24;
  int v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  unsigned int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (kHSRVScope)
  {
    v7 = *(id *)kHSRVScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = (id)MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "serverInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 136316162;
    v26 = "AVHapticServer.mm";
    v27 = 1024;
    v28 = 2002;
    v29 = 2080;
    v30 = "-[AVHapticServer removeListener:withAudioSessionID:]";
    v31 = 2048;
    v32 = v10;
    v33 = 1024;
    v34 = a4;
    _os_log_impl(&dword_1A0F4D000, v9, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Removing listener containing AVHapticServerInstance %p for audio session ID %u", (uint8_t *)&v25, 0x2Cu);

  }
LABEL_8:
  std::recursive_mutex::lock((std::recursive_mutex *)&self->_instanceMutex);
  left = (char *)self->_instanceMap.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    p_pair1 = &self->_instanceMap.__tree_.__pair1_;
    do
    {
      v13 = *((_DWORD *)left + 8);
      v14 = v13 >= a4;
      if (v13 >= a4)
        v15 = (char **)left;
      else
        v15 = (char **)(left + 8);
      if (v14)
        p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, NSMutableArray<AVServerWrapper *> *>, void *>>> *)left;
      left = *v15;
    }
    while (*v15);
    if (p_pair1 != &self->_instanceMap.__tree_.__pair1_ && LODWORD(p_pair1[4].__value_.__left_) <= a4)
    {
      v16 = p_pair1[5].__value_.__left_;
      -[NSObject removeObject:](v16, "removeObject:", v6);
      if (-[NSObject count](v16, "count"))
        goto LABEL_42;
      if (kHSRVScope)
      {
        v18 = *(id *)kHSRVScope;
        if (!v18)
        {
LABEL_33:
          v20 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, NSMutableArray<AVServerWrapper *> *>, void *>>> *)p_pair1[1].__value_.__left_;
          if (v20)
          {
            do
            {
              v21 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, NSMutableArray<AVServerWrapper *> *>, void *>>> **)v20;
              v20 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, NSMutableArray<AVServerWrapper *> *>, void *>>> *)v20->__value_.__left_;
            }
            while (v20);
          }
          else
          {
            v22 = p_pair1;
            do
            {
              v21 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, NSMutableArray<AVServerWrapper *> *>, void *>>> **)v22[2].__value_.__left_;
              v23 = *v21 == v22;
              v22 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, NSMutableArray<AVServerWrapper *> *>, void *>>> *)v21;
            }
            while (!v23);
          }
          if (self->_instanceMap.__tree_.__begin_node_ == p_pair1)
            self->_instanceMap.__tree_.__begin_node_ = v21;
          v24 = (uint64_t *)self->_instanceMap.__tree_.__pair1_.__value_.__left_;
          --self->_instanceMap.__tree_.__pair3_.__value_;
          std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v24, (uint64_t *)p_pair1);

          operator delete(p_pair1);
          goto LABEL_42;
        }
      }
      else
      {
        v18 = MEMORY[0x1E0C81028];
        v19 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v25 = 136315650;
        v26 = "AVHapticServer.mm";
        v27 = 1024;
        v28 = 2009;
        v29 = 2080;
        v30 = "-[AVHapticServer removeListener:withAudioSessionID:]";
        _os_log_impl(&dword_1A0F4D000, v18, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: No more listeners for this session", (uint8_t *)&v25, 0x1Cu);
      }

      goto LABEL_33;
    }
  }
  if (kHSRVScope)
  {
    v16 = *(id *)kHSRVScope;
    if (!v16)
      goto LABEL_43;
  }
  else
  {
    v16 = MEMORY[0x1E0C81028];
    v17 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v25 = 136315906;
    v26 = "AVHapticServer.mm";
    v27 = 1024;
    v28 = 2014;
    v29 = 2080;
    v30 = "-[AVHapticServer removeListener:withAudioSessionID:]";
    v31 = 1024;
    LODWORD(v32) = a4;
    _os_log_impl(&dword_1A0F4D000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: No listeners found for audio session ID %u", (uint8_t *)&v25, 0x22u);
  }
LABEL_42:

LABEL_43:
  std::recursive_mutex::unlock((std::recursive_mutex *)&self->_instanceMutex);

}

- (void)HandleInterruptionForSession:(const void *)a3 command:(unsigned int)a4 dictionary:(__CFDictionary *)a5
{
  uint64_t v6;
  id v9;
  id v10;
  NSObject *v11;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, NSMutableArray<AVServerWrapper *> *>, void *>>> *begin_node;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __CFDictionary *v18;
  void *v19;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, NSMutableArray<AVServerWrapper *> *>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, NSMutableArray<AVServerWrapper *> *>, void *>>> *v21;
  BOOL v22;
  std::recursive_mutex *p_instanceMutex;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, NSMutableArray<AVServerWrapper *> *>, void *>>> *p_pair1;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v6 = *(_QWORD *)&a4;
  v40 = *MEMORY[0x1E0C80C00];
  if (kHSRVScope)
  {
    v9 = *(id *)kHSRVScope;
    if (!v9)
      goto LABEL_8;
  }
  else
  {
    v9 = (id)MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  v11 = v9;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    v31 = "AVHapticServer.mm";
    v33 = 2020;
    v34 = 2080;
    v32 = 1024;
    v35 = "-[AVHapticServer HandleInterruptionForSession:command:dictionary:]";
    v36 = 1024;
    v37 = AQMESession::sessionID((AQMESession *)a3);
    v38 = 1024;
    v39 = v6;
    _os_log_impl(&dword_1A0F4D000, v11, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Session ID %u, interruptionCommand %u", buf, 0x28u);
  }

LABEL_8:
  p_instanceMutex = (std::recursive_mutex *)&self->_instanceMutex;
  std::recursive_mutex::lock((std::recursive_mutex *)&self->_instanceMutex);
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, NSMutableArray<AVServerWrapper *> *>, void *>>> *)self->_instanceMap.__tree_.__begin_node_;
  p_pair1 = &self->_instanceMap.__tree_.__pair1_;
  if (begin_node != &self->_instanceMap.__tree_.__pair1_)
  {
    do
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v13 = begin_node[5].__value_.__left_;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16, p_instanceMutex);
      if (v14)
      {
        v15 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v26 != v15)
              objc_enumerationMutation(v13);
            v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            v18 = a5;
            objc_msgSend(v17, "serverInstance");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "handleInterruptionForSession:command:dictionary:", a3, v6, v18);

          }
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v14);
      }

      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, NSMutableArray<AVServerWrapper *> *>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v21 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, NSMutableArray<AVServerWrapper *> *>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          v21 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, NSMutableArray<AVServerWrapper *> *>, void *>>> *)begin_node[2].__value_.__left_;
          v22 = v21->__value_.__left_ == begin_node;
          begin_node = v21;
        }
        while (!v22);
      }
      begin_node = v21;
    }
    while (v21 != p_pair1);
  }
  std::recursive_mutex::unlock(p_instanceMutex);
}

- (unint64_t)addProcessEntry:(int)a3
{
  int *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *v7;
  char *v8;
  int v9;
  BOOL v10;
  char **v11;
  int v12;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *v13;
  void *v14;
  uint64_t *v15;
  unint64_t v16;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *v17;
  unint64_t v18;
  NSObject *v19;
  unint64_t v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  int v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  _WORD v33[9];

  *(_QWORD *)&v33[5] = *MEMORY[0x1E0C80C00];
  p_pair1 = &self->_processIndexMap.__tree_.__pair1_;
  left = (int *)self->_processIndexMap.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    v7 = &self->_processIndexMap.__tree_.__pair1_;
    v8 = (char *)self->_processIndexMap.__tree_.__pair1_.__value_.__left_;
    do
    {
      v9 = *((_DWORD *)v8 + 8);
      v10 = v9 < a3;
      if (v9 >= a3)
        v11 = (char **)v8;
      else
        v11 = (char **)(v8 + 8);
      if (!v10)
        v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)v8;
      v8 = *v11;
    }
    while (*v11);
    if (v7 == p_pair1 || SLODWORD(v7[4].__value_.__left_) > a3)
    {
      while (1)
      {
        while (1)
        {
          v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)left;
          v12 = left[8];
          if (v12 <= a3)
            break;
          left = (int *)v7->__value_.__left_;
          p_pair1 = v7;
          if (!v7->__value_.__left_)
            goto LABEL_18;
        }
        if (v12 >= a3)
          break;
        left = (int *)v7[1].__value_.__left_;
        if (!left)
        {
          p_pair1 = v7 + 1;
          goto LABEL_18;
        }
      }
    }
  }
  else
  {
    v7 = &self->_processIndexMap.__tree_.__pair1_;
LABEL_18:
    v13 = v7;
    v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)operator new(0x48uLL);
    LODWORD(v7[4].__value_.__left_) = a3;
    *(_OWORD *)&v7[5].__value_.__left_ = 0u;
    *(_OWORD *)&v7[7].__value_.__left_ = 0u;
    v7->__value_.__left_ = 0;
    v7[1].__value_.__left_ = 0;
    v7[2].__value_.__left_ = v13;
    p_pair1->__value_.__left_ = v7;
    v14 = *(void **)self->_processIndexMap.__tree_.__begin_node_;
    v15 = (uint64_t *)v7;
    if (v14)
    {
      self->_processIndexMap.__tree_.__begin_node_ = v14;
      v15 = (uint64_t *)p_pair1->__value_.__left_;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)self->_processIndexMap.__tree_.__pair1_.__value_.__left_, v15);
    ++self->_processIndexMap.__tree_.__pair3_.__value_;
  }
  v16 = 0;
  v17 = v7 + 5;
  while (1)
  {
    v18 = (unint64_t)v17[v16 >> 6].__value_.__left_;
    if ((v18 & (1 << v16)) == 0)
      break;
    if (++v16 == 255)
    {
      if (kHSRVScope)
      {
        v19 = *(id *)kHSRVScope;
        if (!v19)
          return -1;
      }
      else
      {
        v19 = MEMORY[0x1E0C81028];
        v24 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v26 = 136315906;
        v27 = "AVHapticServer.mm";
        v28 = 1024;
        v29 = 2050;
        v30 = 2080;
        v31 = "-[AVHapticServer addProcessEntry:]";
        v32 = 1024;
        *(_DWORD *)v33 = a3;
        _os_log_impl(&dword_1A0F4D000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Exceeded the maximum number of players for PID %u!", (uint8_t *)&v26, 0x22u);
      }
      v20 = -1;
      goto LABEL_44;
    }
  }
  v17[v16 >> 6].__value_.__left_ = (void *)(v18 | (1 << v16));
  if (!kHSRVScope)
  {
    v21 = MEMORY[0x1E0C81028];
    v22 = MEMORY[0x1E0C81028];
    goto LABEL_31;
  }
  v21 = *(id *)kHSRVScope;
  if (v21)
  {
LABEL_31:
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v26 = 136316162;
      v27 = "AVHapticServer.mm";
      v29 = 2054;
      v30 = 2080;
      v28 = 1024;
      v31 = "-[AVHapticServer addProcessEntry:]";
      v32 = 1024;
      *(_DWORD *)v33 = a3;
      v33[2] = 1024;
      *(_DWORD *)&v33[3] = v16;
      _os_log_impl(&dword_1A0F4D000, v21, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: New client added to PID %u with index %u", (uint8_t *)&v26, 0x28u);
    }

  }
  v20 = ((v16 << 24) + 0x1000000) | a3;
  if (kHSRVScope)
  {
    v19 = *(id *)kHSRVScope;
    if (!v19)
      return v20;
  }
  else
  {
    v19 = MEMORY[0x1E0C81028];
    v23 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v26 = 136315906;
    v27 = "AVHapticServer.mm";
    v28 = 1024;
    v29 = 2057;
    v30 = 2080;
    v31 = "-[AVHapticServer addProcessEntry:]";
    v32 = 2048;
    *(_QWORD *)v33 = v20;
    _os_log_impl(&dword_1A0F4D000, v19, OS_LOG_TYPE_INFO, "%25s:%-5d %s: New client ID: 0x%lx", (uint8_t *)&v26, 0x26u);
  }
LABEL_44:

  return v20;
}

- (void)removeProcessEntry:(unint64_t)a3
{
  char *left;
  int v5;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *p_pair1;
  int v7;
  BOOL v8;
  char **v9;
  unint64_t v10;
  NSObject *v11;
  id v12;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *v13;
  unint64_t v14;
  unint64_t v15;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  int v21;
  unint64_t i;
  int8x8_t v23;
  uint8x8_t v24;
  uint64_t v25;
  uint8x8_t v26;
  id v27;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *v28;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> **v29;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *v30;
  BOOL v31;
  uint64_t *v32;
  int v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  left = (char *)self->_processIndexMap.__tree_.__pair1_.__value_.__left_;
  if (!left)
    goto LABEL_53;
  v5 = a3 & 0xFFFFFF;
  p_pair1 = &self->_processIndexMap.__tree_.__pair1_;
  do
  {
    v7 = *((_DWORD *)left + 8);
    v8 = v7 < v5;
    if (v7 >= v5)
      v9 = (char **)left;
    else
      v9 = (char **)(left + 8);
    if (!v8)
      p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)left;
    left = *v9;
  }
  while (*v9);
  if (p_pair1 == &self->_processIndexMap.__tree_.__pair1_ || v5 < SLODWORD(p_pair1[4].__value_.__left_))
  {
LABEL_53:
    if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
    {
      v33 = 136315394;
      v34 = "AVHapticServer.mm";
      v35 = 1024;
      v36 = 2065;
      _os_log_impl(&dword_1A0F4D000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d ASSERTION FAILURE [(clientsWithProcess != _processIndexMap.end()) != 0 is false]: ", (uint8_t *)&v33, 0x12u);
    }
    __break(1u);
  }
  v10 = (a3 & 0xFF000000) - 1;
  if (kHSRVScope)
  {
    v11 = *(id *)kHSRVScope;
    if (!v11)
      goto LABEL_18;
  }
  else
  {
    v11 = MEMORY[0x1E0C81028];
    v12 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v33 = 136316162;
    v34 = "AVHapticServer.mm";
    v36 = 2067;
    v37 = 2080;
    v35 = 1024;
    v38 = "-[AVHapticServer removeProcessEntry:]";
    v39 = 1024;
    v40 = v5;
    v41 = 1024;
    v42 = v10 >> 24;
    _os_log_impl(&dword_1A0F4D000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Removing client from PID %u at index %u", (uint8_t *)&v33, 0x28u);
  }

LABEL_18:
  v13 = p_pair1 + 5;
  v14 = (unint64_t)p_pair1[(v10 >> 30) + 5].__value_.__left_;
  if ((v14 & (1 << SBYTE3(v10))) != 0)
  {
    v13[v10 >> 30].__value_.__left_ = (void *)(v14 & ~(1 << SBYTE3(v10)));
    v15 = 255;
    v16 = p_pair1 + 5;
    while (!v16->__value_.__left_)
    {
      ++v16;
      v15 -= 64;
      if (v15 <= 0x3F)
      {
        if (((uint64_t)p_pair1[8].__value_.__left_ & 0x7FFFFFFFFFFFFFFFLL) == 0)
        {
          v28 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)p_pair1[1].__value_.__left_;
          if (v28)
          {
            do
            {
              v29 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> **)v28;
              v28 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)v28->__value_.__left_;
            }
            while (v28);
          }
          else
          {
            v30 = p_pair1;
            do
            {
              v29 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> **)v30[2].__value_.__left_;
              v31 = *v29 == v30;
              v30 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)v29;
            }
            while (!v31);
          }
          if (self->_processIndexMap.__tree_.__begin_node_ == p_pair1)
            self->_processIndexMap.__tree_.__begin_node_ = v29;
          v32 = (uint64_t *)self->_processIndexMap.__tree_.__pair1_.__value_.__left_;
          --self->_processIndexMap.__tree_.__pair3_.__value_;
          std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v32, (uint64_t *)p_pair1);
          operator delete(p_pair1);
          return;
        }
        break;
      }
    }
    if (kHSRVScope)
    {
      v17 = *(id *)kHSRVScope;
      if (!v17)
        return;
    }
    else
    {
      v17 = (id)MEMORY[0x1E0C81028];
      v19 = MEMORY[0x1E0C81028];
    }
    v20 = v17;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v21 = 0;
      for (i = 255; i > 0x3F; i -= 64)
      {
        v23 = (int8x8_t)v13->__value_.__left_;
        ++v13;
        v24 = (uint8x8_t)vcnt_s8(v23);
        v24.i16[0] = vaddlv_u8(v24);
        v21 += v24.i32[0];
      }
      v25 = (uint64_t)p_pair1[8].__value_.__left_ & 0x7FFFFFFFFFFFFFFFLL;
      v33 = 136315906;
      v26 = (uint8x8_t)vcnt_s8((int8x8_t)v25);
      v26.i16[0] = vaddlv_u8(v26);
      v34 = "AVHapticServer.mm";
      v35 = 1024;
      v36 = 2075;
      v37 = 2080;
      v38 = "-[AVHapticServer removeProcessEntry:]";
      v39 = 1024;
      v40 = v26.i32[0] + v21;
      _os_log_impl(&dword_1A0F4D000, v20, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: %u clients still associated with PID", (uint8_t *)&v33, 0x22u);
    }

  }
  else
  {
    if (kHSRVScope)
    {
      v18 = *(id *)kHSRVScope;
      if (!v18)
        return;
    }
    else
    {
      v18 = MEMORY[0x1E0C81028];
      v27 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v33 = 136315906;
      v34 = "AVHapticServer.mm";
      v35 = 1024;
      v36 = 2079;
      v37 = 2080;
      v38 = "-[AVHapticServer removeProcessEntry:]";
      v39 = 1024;
      v40 = v10 >> 24;
      _os_log_impl(&dword_1A0F4D000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Attempting to remove nonexistant entry at index %u", (uint8_t *)&v33, 0x22u);
    }

  }
}

- (void)displayRunningProcessEntriesWithOnTime:(unint64_t)a3
{
  AVHapticServer *v4;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *begin_node;
  unint64_t v6;
  PlatformUtilities *left_low;
  unint64_t v8;
  unsigned int v9;
  FILE *v10;
  unsigned __int8 *base;
  const char *v12;
  int ur;
  const char *v14;
  _BYTE *v15;
  void *v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *v21;
  BOOL v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  FILE *v28;
  __n128 v29;
  id v30;
  id v31;
  NSObject *v32;
  FILE *v33;
  double v34;
  double v35;
  double v36;
  NSObject *v37;
  id v38;
  uint64_t v39;
  unsigned __int8 v40;
  NSObject *v41;
  NSObject *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  HapticMetrics *v48;
  id v49;
  id v50;
  NSObject *v51;
  FILE *v52;
  std::__shared_weak_count *v53;
  unint64_t *p_shared_owners;
  unint64_t v55;
  id v57;
  FILE *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  ClientEntry *v62;
  std::__shared_weak_count *v63;
  const __CFString *v64;
  void *v65;
  _BYTE __p[12];
  __int16 v67;
  int v68;
  __int16 v69;
  const char *v70;
  __int16 v71;
  _QWORD v72[8];
  _QWORD v73[2];
  _QWORD v74[4];

  v74[2] = *MEMORY[0x1E0C80C00];
  v57 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v62 = 0;
  v63 = 0;
  v4 = self;
  objc_sync_enter(v4);
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)v4->_processIndexMap.__tree_.__begin_node_;
  if (begin_node != &v4->_processIndexMap.__tree_.__pair1_)
  {
    do
    {
      v6 = 0;
      left_low = (PlatformUtilities *)SLODWORD(begin_node[4].__value_.__left_);
      do
      {
        if (((*(unint64_t *)((char *)&begin_node[5].__value_.__left_ + ((v6 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
        {
          v8 = ((v6 << 24) + 0x1000000) | (unint64_t)left_low;
          ServerManager::entryForID((ServerManager *)&v58, (uint64_t)v4->_manager, v8);
          if (v58)
          {
            v9 = atomic_load((unsigned int *)&v58->_lb);
            if (v9 != 1)
            {
              v10 = v58;
              base = v58->_bf._base;
              if (((unint64_t)base & 0xFFFFFF) != getpid() || (v12 = "ToneLib", LODWORD(v10->_extra) != 1003))
              {
                v12 = "SSS";
                if (v8 != v4->_SSSClientID)
                {
                  ur = v10->_ur;
                  v14 = "CH";
                  if (ur == 2)
                    v14 = "iOSKeyboard";
                  if (ur == 1)
                    v12 = "UIFeedback";
                  else
                    v12 = v14;
                }
              }
              std::shared_ptr<ClientEntry>::operator=[abi:ne180100](&v62, (uint64_t)v10, (uint64_t)v59);
              PlatformUtilities::processName(left_low);
              v15 = __p;
              if (SBYTE3(v70) < 0)
                v15 = *(_BYTE **)__p;
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:0x%x:%s"), v15, v8, v12);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "appendString:", v16);

              if (SBYTE3(v70) < 0)
                operator delete(*(void **)__p);
            }
          }
          v17 = (std::__shared_weak_count *)v59;
          if (v59)
          {
            v18 = (unint64_t *)((char *)v59 + 8);
            do
              v19 = __ldaxr(v18);
            while (__stlxr(v19 - 1, v18));
            if (!v19)
            {
              ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
              std::__shared_weak_count::__release_weak(v17);
            }
          }
        }
        ++v6;
      }
      while (v6 != 255);
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v21 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          v21 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)begin_node[2].__value_.__left_;
          v22 = v21->__value_.__left_ == begin_node;
          begin_node = v21;
        }
        while (!v22);
      }
      begin_node = v21;
    }
    while (v21 != &v4->_processIndexMap.__tree_.__pair1_);
  }
  objc_sync_exit(v4);

  if (objc_msgSend(v57, "length"))
  {
    if (kHSRVScope)
    {
      v23 = *(id *)kHSRVScope;
      if (!v23)
        goto LABEL_38;
    }
    else
    {
      v23 = MEMORY[0x1E0C81028];
      v24 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__p = 136316162;
      *(_QWORD *)&__p[4] = "AVHapticServer.mm";
      v67 = 1024;
      v68 = 2146;
      v69 = 2080;
      v70 = "-[AVHapticServer displayRunningProcessEntriesWithOnTime:]";
      v71 = 1024;
      LODWORD(v72[0]) = a3;
      WORD2(v72[0]) = 2112;
      *(_QWORD *)((char *)v72 + 6) = v57;
      _os_log_impl(&dword_1A0F4D000, v23, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: << POWER LOG: Haptic_Active_Hardware_Time_Seconds: %u, Active_Clients: %@ >>", __p, 0x2Cu);
    }

LABEL_38:
    v25 = (void *)MEMORY[0x1E0DDE8B8];
    v73[0] = CFSTR("Haptic_Active_Hardware_Time_Seconds");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v73[1] = CFSTR("Active_Clients");
    v74[0] = v26;
    v74[1] = v57;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, v73, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "sendSingleMessage:category:type:", v27, 1, 8);

    v59 = 0;
    v60 = 0;
    v61 = 0;
    v28 = funopen(&v58, 0, (int (__cdecl *)(void *, const char *, int))CAMemoryStream::Write, 0, 0);
    v58 = v28;
    if (!v62)
      goto LABEL_71;
    ClientEntry::dump(v62, v28);
    if (kHSRVScope)
    {
      v30 = *(id *)kHSRVScope;
      if (!v30)
        goto LABEL_46;
    }
    else
    {
      v30 = (id)MEMORY[0x1E0C81028];
      v31 = MEMORY[0x1E0C81028];
    }
    v32 = v30;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = CAMemoryStream::cstr(&v58);
      *(_DWORD *)__p = 136315906;
      *(_QWORD *)&__p[4] = "AVHapticServer.mm";
      v67 = 1024;
      v68 = 2152;
      v69 = 2080;
      v70 = "-[AVHapticServer displayRunningProcessEntriesWithOnTime:]";
      v71 = 2080;
      v72[0] = v33;
      _os_log_impl(&dword_1A0F4D000, v32, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Active Client Dump:\n%s\n", __p, 0x26u);
    }

LABEL_46:
    if (*((_DWORD *)v62 + 28) != 1
      || (v34 = COERCE_DOUBLE(atomic_load((unint64_t *)v62 + 155)), v29.n128_f64[0] = v34, v34 <= 0.0)
      || (v29.n128_f64[0] = CFAbsoluteTimeGetCurrent(),
          v35 = COERCE_DOUBLE(atomic_load((unint64_t *)v62 + 155)),
          v36 = v29.n128_f64[0] - v35,
          v29.n128_u64[0] = 0x4082C00000000000,
          v36 < 600.0))
    {
LABEL_71:
      if ((*(unsigned int (**)(_QWORD, _QWORD, _QWORD, uint64_t, __n128))(**((_QWORD **)v4->_manager + 29)
                                                                                   + 64))(*((_QWORD *)v4->_manager + 29), 0, 0, 9999999, v29))
      {
        (*(void (**)(_QWORD, FILE *))(**((_QWORD **)v4->_manager + 29) + 152))(*((_QWORD *)v4->_manager + 29), v58);
        if (kHSRVScope)
        {
          v49 = *(id *)kHSRVScope;
          if (!v49)
            goto LABEL_79;
        }
        else
        {
          v49 = (id)MEMORY[0x1E0C81028];
          v50 = MEMORY[0x1E0C81028];
        }
        v51 = v49;
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          v52 = CAMemoryStream::cstr(&v58);
          *(_DWORD *)__p = 136315906;
          *(_QWORD *)&__p[4] = "AVHapticServer.mm";
          v67 = 1024;
          v68 = 2173;
          v69 = 2080;
          v70 = "-[AVHapticServer displayRunningProcessEntriesWithOnTime:]";
          v71 = 2080;
          v72[0] = v52;
          _os_log_impl(&dword_1A0F4D000, v51, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Running Synth Dump:\n%s\n", __p, 0x26u);
        }

      }
LABEL_79:
      fclose(v58);
      free(v59);
      goto LABEL_80;
    }
    if (kHSRVScope)
    {
      v37 = *(id *)kHSRVScope;
      if (!v37)
        goto LABEL_56;
    }
    else
    {
      v37 = MEMORY[0x1E0C81028];
      v38 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v39 = *((_QWORD *)v62 + 3);
      *(_DWORD *)__p = 136316162;
      *(_QWORD *)&__p[4] = "AVHapticServer.mm";
      v67 = 1024;
      v68 = 2157;
      v69 = 2080;
      v70 = "-[AVHapticServer displayRunningProcessEntriesWithOnTime:]";
      v71 = 1024;
      LODWORD(v72[0]) = v39;
      WORD2(v72[0]) = 2048;
      *(double *)((char *)v72 + 6) = v36;
      _os_log_impl(&dword_1A0F4D000, v37, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: UIFeedback engine 0x%x has been running for %.1f seconds!", __p, 0x2Cu);
    }

LABEL_56:
    HapticMetrics::HapticMetrics((HapticMetrics *)__p);
    CADeprecated::TSingleton<HapticMetrics>::instance();
    v40 = atomic_load(HapticMetrics::sHapticAutoBugCaptureAvailable);
    HapticMetrics::~HapticMetrics((HapticMetrics *)__p);
    if ((v40 & 1) == 0)
    {
      if (kHSRVScope)
      {
        v41 = *(id *)kHSRVScope;
        if (!v41)
        {
LABEL_66:

          goto LABEL_71;
        }
      }
      else
      {
        v41 = MEMORY[0x1E0C81028];
        v43 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__p = 136315650;
        *(_QWORD *)&__p[4] = "AVHapticServer.mm";
        v67 = 1024;
        v68 = 2166;
        v69 = 2080;
        v70 = "-[AVHapticServer displayRunningProcessEntriesWithOnTime:]";
        _os_log_impl(&dword_1A0F4D000, v41, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Stuck UIFeedback engine encountered but haptic AutoBugCapture has filed within 24 hours", __p, 0x1Cu);
      }
      goto LABEL_66;
    }
    if (kHSRVScope)
    {
      v42 = *(id *)kHSRVScope;
      if (!v42)
      {
LABEL_70:

        v45 = (void *)MEMORY[0x1E0DDE8B8];
        v64 = CFSTR("Haptic_Stuck_UIFeedback_Client_Time_Seconds");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v36);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = v46;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "sendSingleMessage:category:type:", v47, 1, 8);

        v48 = (HapticMetrics *)CADeprecated::TSingleton<HapticMetrics>::instance();
        HapticMetrics::markHapticAutoBugCaptureFiled(v48);
        goto LABEL_71;
      }
    }
    else
    {
      v42 = MEMORY[0x1E0C81028];
      v44 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 136315650;
      *(_QWORD *)&__p[4] = "AVHapticServer.mm";
      v67 = 1024;
      v68 = 2159;
      v69 = 2080;
      v70 = "-[AVHapticServer displayRunningProcessEntriesWithOnTime:]";
      _os_log_impl(&dword_1A0F4D000, v42, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: << Stuck UIFeedback engine encountered. Filing ABC >>", __p, 0x1Cu);
    }
    goto LABEL_70;
  }
LABEL_80:
  v53 = v63;
  if (v63)
  {
    p_shared_owners = (unint64_t *)&v63->__shared_owners_;
    do
      v55 = __ldaxr(p_shared_owners);
    while (__stlxr(v55 - 1, p_shared_owners));
    if (!v55)
    {
      ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
      std::__shared_weak_count::__release_weak(v53);
    }
  }

}

- (BOOL)shouldUnprewarmAllClientsAfterDisplayingPrewarmedProcessEntriesWithPrewarmTime:(unint64_t)a3
{
  AVHapticServer *v4;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *begin_node;
  unint64_t v6;
  PlatformUtilities *left_low;
  unint64_t v8;
  FILE *v9;
  unsigned __int8 *base;
  const char *v11;
  int ur;
  const char *v13;
  _BYTE *v14;
  void *v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *v20;
  NSObject *v21;
  id v22;
  unsigned __int8 v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  HapticMetrics *v31;
  FILE *v32;
  id v33;
  id v34;
  NSObject *v35;
  FILE *v36;
  uint64_t v37;
  std::__shared_weak_count *v38;
  unint64_t *p_shared_owners;
  unint64_t v40;
  BOOL v41;
  BOOL v42;
  id v45;
  FILE *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  ClientEntry *v50;
  std::__shared_weak_count *v51;
  _QWORD v52[2];
  _QWORD v53[2];
  _BYTE __p[12];
  __int16 v55;
  int v56;
  __int16 v57;
  const char *v58;
  __int16 v59;
  _QWORD v60[4];

  *(_QWORD *)((char *)&v60[2] + 2) = *MEMORY[0x1E0C80C00];
  v45 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v50 = 0;
  v51 = 0;
  v4 = self;
  objc_sync_enter(v4);
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)v4->_processIndexMap.__tree_.__begin_node_;
  if (begin_node != &v4->_processIndexMap.__tree_.__pair1_)
  {
    do
    {
      v6 = 0;
      left_low = (PlatformUtilities *)SLODWORD(begin_node[4].__value_.__left_);
      do
      {
        if (((*(unint64_t *)((char *)&begin_node[5].__value_.__left_ + ((v6 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
        {
          v8 = ((v6 << 24) + 0x1000000) | (unint64_t)left_low;
          ServerManager::entryForID((ServerManager *)&v46, (uint64_t)v4->_manager, v8);
          v9 = v46;
          if (v46 && v46->_ubuf[0])
          {
            base = v46->_bf._base;
            if (((unint64_t)base & 0xFFFFFF) != getpid() || (v11 = "ToneLib", LODWORD(v9->_extra) != 1003))
            {
              v11 = "SSS";
              if (v8 != v4->_SSSClientID)
              {
                ur = v9->_ur;
                v13 = "CH";
                if (ur == 2)
                  v13 = "iOSKeyboard";
                if (ur == 1)
                  v11 = "UIFeedback";
                else
                  v11 = v13;
              }
            }
            std::shared_ptr<ClientEntry>::operator=[abi:ne180100](&v50, (uint64_t)v9, (uint64_t)v47);
            PlatformUtilities::processName(left_low);
            v14 = __p;
            if (SBYTE3(v58) < 0)
              v14 = *(_BYTE **)__p;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:0x%x:%s"), v14, v8, v11);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "appendString:", v15);

            if (SBYTE3(v58) < 0)
              operator delete(*(void **)__p);
          }
          v16 = (std::__shared_weak_count *)v47;
          if (v47)
          {
            v17 = (unint64_t *)((char *)v47 + 8);
            do
              v18 = __ldaxr(v17);
            while (__stlxr(v18 - 1, v17));
            if (!v18)
            {
              ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
              std::__shared_weak_count::__release_weak(v16);
            }
          }
        }
        ++v6;
      }
      while (v6 != 255);
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v20 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          v20 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)begin_node[2].__value_.__left_;
          v41 = v20->__value_.__left_ == begin_node;
          begin_node = v20;
        }
        while (!v41);
      }
      begin_node = v20;
    }
    while (v20 != &v4->_processIndexMap.__tree_.__pair1_);
  }
  objc_sync_exit(v4);

  if (objc_msgSend(v45, "length"))
  {
    if (kHSRVScope)
    {
      v21 = *(id *)kHSRVScope;
      if (!v21)
        goto LABEL_38;
    }
    else
    {
      v21 = MEMORY[0x1E0C81028];
      v22 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__p = 136316162;
      *(_QWORD *)&__p[4] = "AVHapticServer.mm";
      v55 = 1024;
      v56 = 2218;
      v57 = 2080;
      v58 = "-[AVHapticServer shouldUnprewarmAllClientsAfterDisplayingPrewarmedProcessEntriesWithPrewarmTime:]";
      v59 = 1024;
      LODWORD(v60[0]) = a3;
      WORD2(v60[0]) = 2112;
      *(_QWORD *)((char *)v60 + 6) = v45;
      _os_log_impl(&dword_1A0F4D000, v21, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: << POWER LOG: Haptic_Prewarmed_Hardware_Time_Seconds: %u, Prewarmed_Clients: %@ >>", __p, 0x2Cu);
    }

LABEL_38:
    CADeprecated::TSingleton<HapticMetrics>::instance();
    v23 = atomic_load(HapticMetrics::sHapticAutoBugCaptureAvailable);
    if ((v23 & 1) == 0)
    {
      if (kHSRVScope)
      {
        v24 = *(id *)kHSRVScope;
        if (!v24)
          goto LABEL_54;
      }
      else
      {
        v24 = MEMORY[0x1E0C81028];
        v26 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__p = 136315650;
        *(_QWORD *)&__p[4] = "AVHapticServer.mm";
        v55 = 1024;
        v56 = 2227;
        v57 = 2080;
        v58 = "-[AVHapticServer shouldUnprewarmAllClientsAfterDisplayingPrewarmedProcessEntriesWithPrewarmTime:]";
        _os_log_impl(&dword_1A0F4D000, v24, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Stuck haptic prewarm encountered but haptic AutoBugCapture has filed within 24 hours", __p, 0x1Cu);
      }

LABEL_54:
      v47 = 0;
      v48 = 0;
      v49 = 0;
      v32 = funopen(&v46, 0, (int (__cdecl *)(void *, const char *, int))CAMemoryStream::Write, 0, 0);
      v46 = v32;
      if (!v50)
      {
LABEL_63:
        fclose(v32);
        free(v47);
        goto LABEL_64;
      }
      ClientEntry::dump(v50, v32);
      if (kHSRVScope)
      {
        v33 = *(id *)kHSRVScope;
        if (!v33)
        {
LABEL_62:
          v32 = v46;
          goto LABEL_63;
        }
      }
      else
      {
        v33 = (id)MEMORY[0x1E0C81028];
        v34 = MEMORY[0x1E0C81028];
      }
      v35 = v33;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = CAMemoryStream::cstr(&v46);
        *(_DWORD *)__p = 136315906;
        *(_QWORD *)&__p[4] = "AVHapticServer.mm";
        v55 = 1024;
        v56 = 2232;
        v57 = 2080;
        v58 = "-[AVHapticServer shouldUnprewarmAllClientsAfterDisplayingPrewarmedProcessEntriesWithPrewarmTime:]";
        v59 = 2080;
        v60[0] = v36;
        _os_log_impl(&dword_1A0F4D000, v35, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Prewarmed Client Dump:\n%s\n", __p, 0x26u);
      }

      goto LABEL_62;
    }
    if (kHSRVScope)
    {
      v25 = *(id *)kHSRVScope;
      if (!v25)
      {
LABEL_53:
        v28 = (void *)MEMORY[0x1E0DDE8B8];
        v52[0] = CFSTR("Haptic_Prewarmed_Hardware_Time_Seconds");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v52[1] = CFSTR("Prewarmed_Clients");
        v53[0] = v29;
        v53[1] = v45;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "sendSingleMessage:category:type:", v30, 1, 8);

        v31 = (HapticMetrics *)CADeprecated::TSingleton<HapticMetrics>::instance();
        HapticMetrics::markHapticAutoBugCaptureFiled(v31);
        goto LABEL_54;
      }
    }
    else
    {
      v25 = MEMORY[0x1E0C81028];
      v27 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 136315650;
      *(_QWORD *)&__p[4] = "AVHapticServer.mm";
      v55 = 1024;
      v56 = 2220;
      v57 = 2080;
      v58 = "-[AVHapticServer shouldUnprewarmAllClientsAfterDisplayingPrewarmedProcessEntriesWithPrewarmTime:]";
      _os_log_impl(&dword_1A0F4D000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: << Stuck haptic prewarm encountered. Filing ABC >> ", __p, 0x1Cu);
    }

    goto LABEL_53;
  }
LABEL_64:
  v37 = objc_msgSend(v45, "length");
  v38 = v51;
  if (v51)
  {
    p_shared_owners = (unint64_t *)&v51->__shared_owners_;
    do
      v40 = __ldaxr(p_shared_owners);
    while (__stlxr(v40 - 1, p_shared_owners));
    if (!v40)
    {
      ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
      std::__shared_weak_count::__release_weak(v38);
    }
  }
  v41 = a3 <= 0x707 || v37 == 0;
  v42 = !v41;

  return v42;
}

- (void)dumpProcessEntries:(__sFILE *)a3
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *begin_node;
  unsigned int left;
  const char *p_p;
  AVHapticServer *isa;
  AVHapticServer *v9;
  BOOL v10;
  void *__p;
  char v12;

  fwrite("\tRegistered clients:\n", 0x15uLL, 1uLL, a3);
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)self->_processIndexMap.__tree_.__begin_node_;
  if (begin_node != &self->_processIndexMap.__tree_.__pair1_)
  {
    do
    {
      left = begin_node[4].__value_.__left_;
      PlatformUtilities::processName((PlatformUtilities *)left);
      if (v12 >= 0)
        p_p = (const char *)&__p;
      else
        p_p = (const char *)__p;
      fprintf(a3, "\t\tPID %u (0x%x):\t\t\"%s\"\n", left, left, p_p);
      if (v12 < 0)
        operator delete(__p);
      isa = (AVHapticServer *)begin_node[1].__value_.__left_;
      if (isa)
      {
        do
        {
          v9 = isa;
          isa = (AVHapticServer *)isa->super.isa;
        }
        while (isa);
      }
      else
      {
        do
        {
          v9 = (AVHapticServer *)begin_node[2].__value_.__left_;
          v10 = v9->super.isa == (Class)begin_node;
          begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)v9;
        }
        while (!v10);
      }
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)v9;
    }
    while (v9 != (AVHapticServer *)&self->_processIndexMap.__tree_.__pair1_);
  }
}

- (shared_ptr<ClientEntry>)entryWithID:(unint64_t)a3
{
  ServerManager *v3;
  ClientEntry *v4;
  __shared_weak_count *v5;
  shared_ptr<ClientEntry> result;

  ServerManager::entryForID(v3, (uint64_t)self->_manager, a3);
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (int)doPrewarm:(shared_ptr<ClientEntry>)a3
{
  NSObject *v3;
  ClientEntry *var0;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  uint64_t v10;
  _QWORD **manager;
  std::__shared_weak_count *v12;
  uint64_t v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  double Current;
  uint64_t v25;
  unint64_t *v26;
  unint64_t v27;
  std::__shared_weak_count *v29;
  unint64_t v30;
  unint64_t *v31;
  unint64_t v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  uint64_t v36;
  std::__shared_weak_count *v37;
  uint64_t v38;
  std::__shared_weak_count *v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  _BYTE v47[10];
  __int16 v48;
  int v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)a3.var0 + 116))
  {
    if (kHSRVScope)
    {
      v3 = *(id *)kHSRVScope;
      if (!v3)
        return 0;
    }
    else
    {
      v3 = MEMORY[0x1E0C81028];
      v7 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v41 = "AVHapticServer.mm";
      v42 = 1024;
      v43 = 2265;
      v44 = 2080;
      v45 = "-[AVHapticServer doPrewarm:]";
      _os_log_impl(&dword_1A0F4D000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Client was already prewarmed -- noop", buf, 0x1Cu);
    }

    return 0;
  }
  var0 = a3.var0;
  if (kHSRVScope)
  {
    v6 = *(id *)kHSRVScope;
    if (!v6)
      goto LABEL_17;
  }
  else
  {
    v6 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(*(_QWORD *)var0 + 24);
    *(_DWORD *)buf = 136315906;
    v41 = "AVHapticServer.mm";
    v42 = 1024;
    v43 = 2257;
    v44 = 2080;
    v45 = "-[AVHapticServer doPrewarm:]";
    v46 = 2048;
    *(_QWORD *)v47 = v10;
    _os_log_impl(&dword_1A0F4D000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Starting prewarm on cold client ID: 0x%lx", buf, 0x26u);
  }

LABEL_17:
  manager = (_QWORD **)self->_manager;
  v13 = *(_QWORD *)var0;
  v12 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
  v38 = *(_QWORD *)var0;
  v39 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v15 = __ldxr(p_shared_owners);
    while (__stxr(v15 + 1, p_shared_owners));
  }
  if (kHSRVScope)
  {
    if ((*(_BYTE *)(kHSRVScope + 8) & 1) != 0)
    {
      v16 = *(id *)kHSRVScope;
      if (v16)
      {
        v17 = v16;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          v18 = *(_QWORD *)(v13 + 24);
          *(_DWORD *)buf = 136315906;
          v41 = "ServerManager.mm";
          v42 = 1024;
          v43 = 989;
          v44 = 2080;
          v45 = "prewarmEntry";
          v46 = 2048;
          *(_QWORD *)v47 = v18;
          _os_log_impl(&dword_1A0F4D000, v17, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Client ID: 0x%lx", buf, 0x26u);
        }

      }
    }
  }
  v19 = *(_QWORD *)(v13 + 96) & 2;
  v20 = *(_QWORD *)(v13 + 96) & 1;
  v21 = *(_QWORD *)(v13 + 24);
  if (!kHSRVScope)
  {
    v22 = MEMORY[0x1E0C81028];
    v23 = MEMORY[0x1E0C81028];
    goto LABEL_30;
  }
  v22 = *(id *)kHSRVScope;
  if (v22)
  {
LABEL_30:
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v41 = "ServerManager.mm";
      v42 = 1024;
      v43 = 270;
      v44 = 2080;
      v45 = "startSynthPrewarm";
      v46 = 1024;
      *(_DWORD *)v47 = v19 >> 1;
      *(_WORD *)&v47[4] = 1024;
      *(_DWORD *)&v47[6] = v20;
      v48 = 1024;
      v49 = v21;
      _os_log_impl(&dword_1A0F4D000, v22, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Calling startPrewarm(%d, %d) on synth, requested by clientID 0x%x", buf, 0x2Eu);
    }

  }
  v8 = (*(uint64_t (**)(_QWORD *, BOOL, uint64_t, uint64_t))(*manager[29] + 48))(manager[29], v19 != 0, v20, v21);
  *(_BYTE *)(v13 + 116) = v8 == 0;
  Current = CFAbsoluteTimeGetCurrent();
  v25 = 1232;
  if (!v8)
    v25 = 1224;
  *(double *)(v13 + v25) = Current;
  if (!v12)
    goto LABEL_39;
  v26 = (unint64_t *)&v12->__shared_owners_;
  do
    v27 = __ldaxr(v26);
  while (__stlxr(v27 - 1, v26));
  if (!v27)
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
    if (v8)
      return v8;
  }
  else
  {
LABEL_39:
    if (v8)
      return v8;
  }
  v29 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
  v30 = *(_QWORD *)(*(_QWORD *)var0 + 96);
  v36 = *(_QWORD *)var0;
  v37 = v29;
  if (v29)
  {
    v31 = (unint64_t *)&v29->__shared_owners_;
    do
      v32 = __ldxr(v31);
    while (__stxr(v32 + 1, v31));
  }
  -[AVHapticServer incrementPrewarmCountForAudio:haptics:entry:](self, "incrementPrewarmCountForAudio:haptics:entry:", (v30 >> 1) & 1, v30 & 1, &v36);
  v33 = v37;
  if (v37)
  {
    v34 = (unint64_t *)&v37->__shared_owners_;
    do
      v35 = __ldaxr(v34);
    while (__stlxr(v35 - 1, v34));
    if (!v35)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }
  return 0;
}

- (void)doStopPrewarm:(shared_ptr<ClientEntry>)a3 audio:(BOOL)a4 haptics:(BOOL)a5
{
  _BOOL8 v5;
  __shared_weak_count *var1;
  ClientEntry *var0;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  ServerManager *manager;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  id v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  uint64_t v28[2];
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)a3.var0 + 116))
  {
    v5 = a4;
    var1 = a3.var1;
    var0 = a3.var0;
    if (kHSRVScope)
    {
      v9 = *(id *)kHSRVScope;
      if (!v9)
      {
LABEL_12:
        manager = (ServerManager *)self->_manager;
        v14 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
        v28[0] = *(_QWORD *)var0;
        v28[1] = (uint64_t)v14;
        if (v14)
        {
          p_shared_owners = (unint64_t *)&v14->__shared_owners_;
          do
            v16 = __ldxr(p_shared_owners);
          while (__stxr(v16 + 1, p_shared_owners));
        }
        ServerManager::stopPrewarmEntry(manager, v28);
        if (v14)
        {
          v17 = (unint64_t *)&v14->__shared_owners_;
          do
            v18 = __ldaxr(v17);
          while (__stlxr(v18 - 1, v17));
          if (!v18)
          {
            ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
            std::__shared_weak_count::__release_weak(v14);
          }
        }
        v19 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
        v26 = *(_QWORD *)var0;
        v27 = v19;
        if (v19)
        {
          v20 = (unint64_t *)&v19->__shared_owners_;
          do
            v21 = __ldxr(v20);
          while (__stxr(v21 + 1, v20));
        }
        -[AVHapticServer decrementPrewarmCountAndStopAudio:stopHaptics:entry:](self, "decrementPrewarmCountAndStopAudio:stopHaptics:entry:", var1, v5, &v26);
        v22 = v27;
        if (v27)
        {
          v23 = (unint64_t *)&v27->__shared_owners_;
          do
            v24 = __ldaxr(v23);
          while (__stlxr(v24 - 1, v23));
          if (!v24)
          {
            ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
            std::__shared_weak_count::__release_weak(v22);
          }
        }
        return;
      }
    }
    else
    {
      v9 = MEMORY[0x1E0C81028];
      v11 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(*(_QWORD *)var0 + 24);
      *(_DWORD *)buf = 136315906;
      v30 = "AVHapticServer.mm";
      v31 = 1024;
      v32 = 2273;
      v33 = 2080;
      v34 = "-[AVHapticServer doStopPrewarm:audio:haptics:]";
      v35 = 2048;
      v36 = v12;
      _os_log_impl(&dword_1A0F4D000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Stopping prewarmed client ID: 0x%lx", buf, 0x26u);
    }

    goto LABEL_12;
  }
  if (kHSRVScope)
  {
    v10 = *(id *)kHSRVScope;
    if (!v10)
      return;
  }
  else
  {
    v10 = MEMORY[0x1E0C81028];
    v25 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v30 = "AVHapticServer.mm";
    v31 = 1024;
    v32 = 2278;
    v33 = 2080;
    v34 = "-[AVHapticServer doStopPrewarm:audio:haptics:]";
    _os_log_impl(&dword_1A0F4D000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Client was not prewarmed -- noop", buf, 0x1Cu);
  }

}

- (int)doStartRunning:(shared_ptr<ClientEntry>)a3 completedBlock:(id)a4
{
  ClientEntry *var0;
  __shared_weak_count *v6;
  NSObject *v7;
  NSObject *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  __shared_weak_count *v12;
  id v13;
  int v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  _QWORD v19[4];
  __shared_weak_count *v20;
  uint64_t *v21;
  id v22[2];
  std::__shared_weak_count *v23;
  id location;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const char *v34;
  uint64_t v35;

  var0 = a3.var0;
  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3.var1;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  objc_initWeak(&location, self);
  if (kHSRVScope)
  {
    if ((*(_BYTE *)(kHSRVScope + 8) & 1) != 0)
    {
      v7 = *(id *)kHSRVScope;
      if (v7)
      {
        v8 = v7;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v30 = "AVHapticServer.mm";
          v31 = 1024;
          v32 = 2286;
          v33 = 2080;
          v34 = "-[AVHapticServer doStartRunning:completedBlock:]";
          _os_log_impl(&dword_1A0F4D000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Dispatching startEntry on ACQ", buf, 0x1Cu);
        }

      }
    }
  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3321888768;
  v19[2] = __48__AVHapticServer_doStartRunning_completedBlock___block_invoke;
  v19[3] = &unk_1E450C958;
  v9 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
  v22[1] = *(id *)var0;
  v23 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }
  v21 = &v25;
  objc_copyWeak(v22, &location);
  v12 = v6;
  v20 = v12;
  if (AudioControlQueue(void)::once != -1)
    dispatch_once(&AudioControlQueue(void)::once, &__block_literal_global_5);
  v13 = (id)AudioControlQueue(void)::gAudioControlQueue;
  AT::DispatchBlock(v13, v19, 0, (uint64_t)"-[AVHapticServer doStartRunning:completedBlock:]", (uint64_t)"AVHapticServer.mm", 2306);

  v14 = *((_DWORD *)v26 + 6);
  objc_destroyWeak(v22);
  v15 = v23;
  if (v23)
  {
    v16 = (unint64_t *)&v23->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  objc_destroyWeak(&location);
  _Block_object_dispose(&v25, 8);

  return v14;
}

- (void)doStopRunning:(shared_ptr<ClientEntry>)a3 audio:(BOOL)a4 haptics:(BOOL)a5
{
  int v5;
  ClientEntry *var0;
  unsigned int v7;
  NSObject *v8;
  id v9;
  _BOOL8 v10;
  __shared_weak_count *var1;
  NSObject *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  ServerManager *manager;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  uint64_t v29;
  std::__shared_weak_count *v30;
  _QWORD v31[2];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = atomic_load((unsigned int *)(*(_QWORD *)a3.var0 + 120));
  if (v5 >= 2)
  {
    var0 = a3.var0;
    v7 = atomic_load((unsigned int *)(*(_QWORD *)a3.var0 + 120));
    if (v7 != 2)
    {
      v10 = a4;
      var1 = a3.var1;
      if (kHSRVScope)
      {
        v13 = *(id *)kHSRVScope;
        if (!v13)
        {
LABEL_20:
          manager = (ServerManager *)self->_manager;
          v18 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
          v31[0] = *(_QWORD *)var0;
          v31[1] = v18;
          if (v18)
          {
            p_shared_owners = (unint64_t *)&v18->__shared_owners_;
            do
              v20 = __ldxr(p_shared_owners);
            while (__stxr(v20 + 1, p_shared_owners));
          }
          ServerManager::stopEntry(manager, v31, 0);
          if (v18)
          {
            v21 = (unint64_t *)&v18->__shared_owners_;
            do
              v22 = __ldaxr(v21);
            while (__stlxr(v22 - 1, v21));
            if (!v22)
            {
              ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
              std::__shared_weak_count::__release_weak(v18);
            }
          }
          v23 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
          v29 = *(_QWORD *)var0;
          v30 = v23;
          if (v23)
          {
            v24 = (unint64_t *)&v23->__shared_owners_;
            do
              v25 = __ldxr(v24);
            while (__stxr(v25 + 1, v24));
          }
          -[AVHapticServer decrementRunningCountAndStopAudio:stopHaptics:entry:](self, "decrementRunningCountAndStopAudio:stopHaptics:entry:", var1, v10, &v29);
          v26 = v30;
          if (v30)
          {
            v27 = (unint64_t *)&v30->__shared_owners_;
            do
              v28 = __ldaxr(v27);
            while (__stlxr(v28 - 1, v27));
            if (!v28)
            {
              ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
              std::__shared_weak_count::__release_weak(v26);
            }
          }
          return;
        }
      }
      else
      {
        v13 = MEMORY[0x1E0C81028];
        v14 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v15 = "haptics";
        v16 = *(_QWORD *)(*(_QWORD *)var0 + 24);
        if ((_DWORD)var1)
          v15 = "audio+haptics";
        *(_DWORD *)buf = 136316162;
        v33 = "AVHapticServer.mm";
        v34 = 1024;
        v35 = 2314;
        v36 = 2080;
        v37 = "-[AVHapticServer doStopRunning:audio:haptics:]";
        v38 = 2080;
        v39 = v15;
        v40 = 2048;
        v41 = v16;
        _os_log_impl(&dword_1A0F4D000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Stopping running %s for client ID: 0x%lx", buf, 0x30u);
      }

      goto LABEL_20;
    }
  }
  if (kHSRVScope)
  {
    v8 = *(id *)kHSRVScope;
    if (!v8)
      return;
  }
  else
  {
    v8 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v33 = "AVHapticServer.mm";
    v34 = 1024;
    v35 = 2320;
    v36 = 2080;
    v37 = "-[AVHapticServer doStopRunning:audio:haptics:]";
    _os_log_impl(&dword_1A0F4D000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: entry was not running or flushing -- noop", buf, 0x1Cu);
  }

}

- (void)doStopRunningForInterrupt:(shared_ptr<ClientEntry>)a3 audio:(BOOL)a4 haptics:(BOOL)a5
{
  ClientEntry *var0;
  int v6;
  unsigned int v7;
  unsigned int v8;
  NSObject *v9;
  _BOOL8 v10;
  __shared_weak_count *var1;
  NSObject *v13;
  id v14;
  const char *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  ServerManager *manager;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  uint64_t v31;
  std::__shared_weak_count *v32;
  _QWORD v33[2];
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  var0 = a3.var0;
  v44 = *MEMORY[0x1E0C80C00];
  v6 = atomic_load((unsigned int *)(*(_QWORD *)a3.var0 + 120));
  if (v6 >= 2)
  {
    v7 = atomic_load((unsigned int *)(*(_QWORD *)a3.var0 + 120));
    if (v7 != 2)
    {
      v10 = a4;
      var1 = a3.var1;
      if (kHSRVScope)
      {
        v13 = *(id *)kHSRVScope;
        if (!v13)
        {
LABEL_20:
          manager = (ServerManager *)self->_manager;
          v20 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
          v33[0] = *(_QWORD *)var0;
          v33[1] = v20;
          if (v20)
          {
            p_shared_owners = (unint64_t *)&v20->__shared_owners_;
            do
              v22 = __ldxr(p_shared_owners);
            while (__stxr(v22 + 1, p_shared_owners));
          }
          ServerManager::stopEntry(manager, v33, 1);
          if (v20)
          {
            v23 = (unint64_t *)&v20->__shared_owners_;
            do
              v24 = __ldaxr(v23);
            while (__stlxr(v24 - 1, v23));
            if (!v24)
            {
              ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
              std::__shared_weak_count::__release_weak(v20);
            }
          }
          v25 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
          v31 = *(_QWORD *)var0;
          v32 = v25;
          if (v25)
          {
            v26 = (unint64_t *)&v25->__shared_owners_;
            do
              v27 = __ldxr(v26);
            while (__stxr(v27 + 1, v26));
          }
          -[AVHapticServer decrementRunningCountAndStopAudio:stopHaptics:entry:](self, "decrementRunningCountAndStopAudio:stopHaptics:entry:", var1, v10, &v31);
          v28 = v32;
          if (v32)
          {
            v29 = (unint64_t *)&v32->__shared_owners_;
            do
              v30 = __ldaxr(v29);
            while (__stlxr(v30 - 1, v29));
            if (!v30)
            {
              ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
              std::__shared_weak_count::__release_weak(v28);
            }
          }
          return;
        }
      }
      else
      {
        v13 = MEMORY[0x1E0C81028];
        v16 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v17 = "haptics";
        v18 = *(_QWORD *)(*(_QWORD *)var0 + 24);
        if ((_DWORD)var1)
          v17 = "audio+haptics";
        *(_DWORD *)buf = 136316162;
        v35 = "AVHapticServer.mm";
        v36 = 1024;
        v37 = 2330;
        v38 = 2080;
        v39 = "-[AVHapticServer doStopRunningForInterrupt:audio:haptics:]";
        v40 = 2080;
        v41 = v17;
        v42 = 2048;
        v43 = v18;
        _os_log_impl(&dword_1A0F4D000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Stopping running %s for client ID: 0x%lx due to interrupt", buf, 0x30u);
      }

      goto LABEL_20;
    }
  }
  v8 = atomic_load((unsigned int *)(*(_QWORD *)a3.var0 + 120));
  if (v8 != 2)
    return;
  if (kHSRVScope)
  {
    v9 = *(id *)kHSRVScope;
    if (!v9)
      return;
  }
  else
  {
    v9 = MEMORY[0x1E0C81028];
    v14 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(const char **)(*(_QWORD *)var0 + 24);
    *(_DWORD *)buf = 136315906;
    v35 = "AVHapticServer.mm";
    v36 = 1024;
    v37 = 2336;
    v38 = 2080;
    v39 = "-[AVHapticServer doStopRunningForInterrupt:audio:haptics:]";
    v40 = 2048;
    v41 = v15;
    _os_log_impl(&dword_1A0F4D000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client ID: 0x%lx was already stopping when interrupted -- noop", buf, 0x26u);
  }

}

- (void)doReleaseClientResources:(shared_ptr<ClientEntry>)a3
{
  ClientEntry **var0;
  NSObject *v5;
  id v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  NSObject *v10;
  id v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  var0 = (ClientEntry **)a3.var0;
  v20 = *MEMORY[0x1E0C80C00];
  if (kHSRVScope)
  {
    v5 = *(id *)kHSRVScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = *((_QWORD *)*var0 + 3);
    v12 = 136315906;
    v13 = "AVHapticServer.mm";
    v14 = 1024;
    v15 = 2342;
    v16 = 2080;
    v17 = "-[AVHapticServer doReleaseClientResources:]";
    v18 = 2048;
    v19 = v7;
    _os_log_impl(&dword_1A0F4D000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: clientID: 0x%lx", (uint8_t *)&v12, 0x26u);
  }

LABEL_8:
  if (*var0 && (v8 = atomic_load((unsigned int *)*var0 + 30), v8 >= 1))
  {
    v9 = atomic_load((unsigned int *)*var0 + 30);
    if (v9 != 1)
    {
      if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
      {
        v12 = 136315394;
        v13 = "AVHapticServer.mm";
        v14 = 1024;
        v15 = 2344;
        _os_log_impl(&dword_1A0F4D000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d ASSERTION FAILURE [(entry->stopped()) != 0 is false]: ", (uint8_t *)&v12, 0x12u);
      }
      __break(1u);
    }
    ClientEntry::uninitialize(*var0);
    -[AVHapticServer decrementInit](self, "decrementInit");
  }
  else
  {
    if (kHSRVScope)
    {
      v10 = *(id *)kHSRVScope;
      if (!v10)
        return;
    }
    else
    {
      v10 = MEMORY[0x1E0C81028];
      v11 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v12 = 136315650;
      v13 = "AVHapticServer.mm";
      v14 = 1024;
      v15 = 2349;
      v16 = 2080;
      v17 = "-[AVHapticServer doReleaseClientResources:]";
      _os_log_impl(&dword_1A0F4D000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: client was not initialized", (uint8_t *)&v12, 0x1Cu);
    }

  }
}

- (void)unprewarmAllClientEntries
{
  AVHapticServer *v2;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *begin_node;
  unint64_t v4;
  uint64_t left_low;
  uint64_t v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *v16;
  BOOL v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  uint64_t v20;
  std::__shared_weak_count *v21;

  v2 = self;
  objc_sync_enter(v2);
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)v2->_processIndexMap.__tree_.__begin_node_;
  if (begin_node != &v2->_processIndexMap.__tree_.__pair1_)
  {
    do
    {
      v4 = 0;
      left_low = SLODWORD(begin_node[4].__value_.__left_);
      do
      {
        if (((*(unint64_t *)((char *)&begin_node[5].__value_.__left_ + ((v4 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
        {
          ServerManager::entryForID((ServerManager *)&v20, (uint64_t)v2->_manager, ((v4 << 24) + 0x1000000) | left_low);
          v6 = v20;
          if (v20 && *(_BYTE *)(v20 + 116))
          {
            v18 = v20;
            v19 = v21;
            if (v21)
            {
              p_shared_owners = (unint64_t *)&v21->__shared_owners_;
              do
                v8 = __ldxr(p_shared_owners);
              while (__stxr(v8 + 1, p_shared_owners));
            }
            -[AVHapticServer doStopPrewarm:audio:haptics:](v2, "doStopPrewarm:audio:haptics:", &v18, (*(_QWORD *)(v6 + 96) >> 1) & 1, *(_QWORD *)(v6 + 96) & 1);
            v9 = v19;
            if (v19)
            {
              v10 = (unint64_t *)&v19->__shared_owners_;
              do
                v11 = __ldaxr(v10);
              while (__stlxr(v11 - 1, v10));
              if (!v11)
              {
                ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
                std::__shared_weak_count::__release_weak(v9);
              }
            }
          }
          v12 = v21;
          if (v21)
          {
            v13 = (unint64_t *)&v21->__shared_owners_;
            do
              v14 = __ldaxr(v13);
            while (__stlxr(v14 - 1, v13));
            if (!v14)
            {
              ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
              std::__shared_weak_count::__release_weak(v12);
            }
          }
        }
        ++v4;
      }
      while (v4 != 255);
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v16 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          v16 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::bitset<255>>, void *>>> *)begin_node[2].__value_.__left_;
          v17 = v16->__value_.__left_ == begin_node;
          begin_node = v16;
        }
        while (!v17);
      }
      begin_node = v16;
    }
    while (v16 != &v2->_processIndexMap.__tree_.__pair1_);
  }
  objc_sync_exit(v2);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  AVHapticServer *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t manager;
  std::__shared_weak_count *v19;
  unint64_t *p_shared_owners;
  std::__shared_weak_count *v21;
  unint64_t v22;
  unint64_t *p_shared_weak_owners;
  unint64_t v24;
  unint64_t v25;
  unint64_t *v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  AVHapticServerInstance *v33;
  uint64_t v34;
  AVHapticServerInstance *v35;
  id v36;
  void *v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  unint64_t *v41;
  unint64_t v42;
  uint64_t v43;
  _BYTE *v44;
  _BYTE *v45;
  _BYTE *v46;
  _BOOL4 v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  std::__shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  void *v54;
  NSObject *v55;
  id v56;
  CAXException *exception;
  id v59;
  void *v60;
  void *v61;
  _QWORD v62[4];
  id v63;
  _QWORD v64[4];
  id v65;
  _QWORD aBlock[4];
  id v67[2];
  id location;
  id v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  std::__shared_weak_count *v73;
  _BYTE v74[12];
  __int16 v75;
  int v76;
  __int16 v77;
  const char *v78;
  _QWORD v79[3];
  _QWORD *v80;
  _BYTE buf[38];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v59 = a3;
  v7 = a4;
  if (kHSRVScope)
  {
    v8 = *(id *)kHSRVScope;
    if (!v8)
      goto LABEL_8;
  }
  else
  {
    v8 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "AVHapticServer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2384;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[AVHapticServer listener:shouldAcceptNewConnection:]";
    *(_WORD *)&buf[28] = 2112;
    *(_QWORD *)&buf[30] = v7;
    _os_log_impl(&dword_1A0F4D000, v8, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [xpc] newConnection: %@", buf, 0x26u);
  }

LABEL_8:
  v10 = objc_msgSend(v7, "processIdentifier", v59);
  v70 = 0u;
  v71 = 0u;
  if (v7)
    objc_msgSend(v7, "auditToken");
  v11 = self;
  objc_sync_enter(v11);
  objc_msgSend(v7, "setExportedInterface:", v11->_cachedServerInterface);
  objc_msgSend(v7, "setRemoteObjectInterface:", v11->_cachedClientInterface);
  objc_msgSend(v7, "exportedInterface");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "classesForSelector:argumentIndex:ofReply:", sel_loadHapticSequenceFromEvents_reply_, 0, 0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v61, "mutableCopy");
  objc_msgSend(v13, "addObject:", objc_opt_class());
  objc_msgSend(v7, "exportedInterface");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_loadHapticSequenceFromEvents_reply_, 0, 0);

  v15 = -[AVHapticServer addProcessEntry:](v11, "addProcessEntry:", v10);
  v16 = MEMORY[0x1E0C809B0];
  if (v15 == -1)
  {
    v47 = 0;
    goto LABEL_64;
  }
  v17 = operator new();
  *(_OWORD *)buf = v70;
  *(_OWORD *)&buf[16] = v71;
  manager = (uint64_t)v11->_manager;
  ClientEntry::ClientEntry(v17, v15, buf, manager, 0, 16 * (*(_QWORD *)(*(_QWORD *)(manager + 232) + 536) == 0));
  v72 = v17;
  v19 = (std::__shared_weak_count *)operator new();
  v19->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v19->__shared_owners_;
  v19->__vftable = (std::__shared_weak_count_vtbl *)&off_1E4515DB0;
  v19->__shared_weak_owners_ = 0;
  v19[1].__vftable = (std::__shared_weak_count_vtbl *)v17;
  v73 = v19;
  v21 = *(std::__shared_weak_count **)(v17 + 16);
  if (v21)
  {
    if (v21->__shared_owners_ != -1)
      goto LABEL_24;
    do
      v22 = __ldxr(p_shared_owners);
    while (__stxr(v22 + 1, p_shared_owners));
    p_shared_weak_owners = (unint64_t *)&v19->__shared_weak_owners_;
    do
      v24 = __ldxr(p_shared_weak_owners);
    while (__stxr(v24 + 1, p_shared_weak_owners));
    *(_QWORD *)(v17 + 8) = v17;
    *(_QWORD *)(v17 + 16) = v19;
    std::__shared_weak_count::__release_weak(v21);
  }
  else
  {
    do
      v25 = __ldxr(p_shared_owners);
    while (__stxr(v25 + 1, p_shared_owners));
    v26 = (unint64_t *)&v19->__shared_weak_owners_;
    do
      v27 = __ldxr(v26);
    while (__stxr(v27 + 1, v26));
    *(_QWORD *)(v17 + 8) = v17;
    *(_QWORD *)(v17 + 16) = v19;
  }
  do
    v28 = __ldaxr(p_shared_owners);
  while (__stlxr(v28 - 1, p_shared_owners));
  if (!v28)
  {
    ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
    std::__shared_weak_count::__release_weak(v19);
  }
LABEL_24:
  v29 = ServerManager::addEntry((uint64_t **)manager, &v72, 1);
  v30 = v73;
  if (v73)
  {
    v31 = (unint64_t *)&v73->__shared_owners_;
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }
  if ((v29 & 1) == 0)
  {
    exception = (CAXException *)__cxa_allocate_exception(0x110uLL);
    CAXException::CAXException(exception, "Failed to add ClientEntry to parent", -4898);
  }
  v33 = [AVHapticServerInstance alloc];
  v34 = MEMORY[0x1E0C809B0];
  v69 = 0;
  v35 = -[AVHapticServerInstance initWithMaster:id:connection:outError:](v33, "initWithMaster:id:connection:outError:", v11, v15, v7, &v69);
  v36 = v69;
  objc_msgSend(v7, "setExportedObject:", v35);

  ServerManager::entryForID((ServerManager *)&v72, (uint64_t)v11->_manager, v15);
  objc_msgSend(v7, "exportedObject");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v37);

  std::shared_ptr<PowerUsageWatchdog::Impl>::shared_ptr[abi:ne180100]<PowerUsageWatchdog::Impl,void>(buf, *(_QWORD *)(v72 + 8), *(std::__shared_weak_count **)(v72 + 16));
  v38 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v39 = (unint64_t *)(*(_QWORD *)&buf[8] + 16);
    do
      v40 = __ldxr(v39);
    while (__stxr(v40 + 1, v39));
    v41 = (unint64_t *)&v38->__shared_owners_;
    do
      v42 = __ldaxr(v41);
    while (__stlxr(v42 - 1, v41));
    if (!v42)
    {
      ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
      std::__shared_weak_count::__release_weak(v38);
    }
  }
  v43 = v72;
  aBlock[0] = v34;
  aBlock[1] = 3221225472;
  aBlock[2] = __53__AVHapticServer_listener_shouldAcceptNewConnection___block_invoke;
  aBlock[3] = &unk_1E450C9B0;
  objc_copyWeak(v67, &location);
  v67[1] = (id)a2;
  v80 = 0;
  v79[0] = &off_1E450CB28;
  v79[1] = _Block_copy(aBlock);
  v80 = v79;
  *(_QWORD *)&buf[24] = buf;
  (*(void (**)(uint64_t, _QWORD *))(v79[0] + 24))((uint64_t)v79, buf);
  v44 = (_BYTE *)(v43 + 928);
  v45 = *(_BYTE **)&buf[24];
  if ((_BYTE *)(v43 + 928) != buf)
  {
    v46 = *(_BYTE **)(v43 + 952);
    if (*(_BYTE **)&buf[24] == buf)
    {
      if (v46 == v44)
      {
        (*(void (**)(_BYTE *, _BYTE *))(*(_QWORD *)buf + 24))(buf, v74);
        (*(void (**)(_QWORD))(**(_QWORD **)&buf[24] + 32))(*(_QWORD *)&buf[24]);
        *(_QWORD *)&buf[24] = 0;
        (*(void (**)(_QWORD, _BYTE *))(**(_QWORD **)(v43 + 952) + 24))(*(_QWORD *)(v43 + 952), buf);
        (*(void (**)(_QWORD))(**(_QWORD **)(v43 + 952) + 32))(*(_QWORD *)(v43 + 952));
        *(_QWORD *)(v43 + 952) = 0;
        *(_QWORD *)&buf[24] = buf;
        (*(void (**)(_BYTE *, uint64_t))(*(_QWORD *)v74 + 24))(v74, v43 + 928);
        (*(void (**)(_BYTE *))(*(_QWORD *)v74 + 32))(v74);
        *(_QWORD *)(v43 + 952) = v44;
        v45 = *(_BYTE **)&buf[24];
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t))(*(_QWORD *)buf + 24))(buf, v43 + 928);
        (*(void (**)(_QWORD))(**(_QWORD **)&buf[24] + 32))(*(_QWORD *)&buf[24]);
        v45 = *(_BYTE **)(v43 + 952);
        *(_QWORD *)&buf[24] = v45;
        *(_QWORD *)(v43 + 952) = v44;
      }
    }
    else
    {
      if (v46 == v44)
      {
        v45 = buf;
        (*(void (**)(uint64_t, _BYTE *))(*(_QWORD *)v44 + 24))(v43 + 928, buf);
        (*(void (**)(_QWORD))(**(_QWORD **)(v43 + 952) + 32))(*(_QWORD *)(v43 + 952));
        *(_QWORD *)(v43 + 952) = *(_QWORD *)&buf[24];
        *(_QWORD *)&buf[24] = buf;
        v48 = 4;
        goto LABEL_50;
      }
      *(_QWORD *)&buf[24] = *(_QWORD *)(v43 + 952);
      *(_QWORD *)(v43 + 952) = v45;
      v45 = v46;
    }
  }
  if (v45 == buf)
  {
    v48 = 4;
    v45 = buf;
  }
  else
  {
    if (!v45)
      goto LABEL_51;
    v48 = 5;
  }
LABEL_50:
  (*(void (**)(_BYTE *))(*(_QWORD *)v45 + 8 * v48))(v45);
LABEL_51:
  v49 = v80;
  if (v80 == v79)
  {
    v50 = 4;
    v49 = v79;
    v16 = MEMORY[0x1E0C809B0];
    goto LABEL_55;
  }
  v16 = MEMORY[0x1E0C809B0];
  if (v80)
  {
    v50 = 5;
LABEL_55:
    (*(void (**)(void))(*v49 + 8 * v50))();
  }
  objc_destroyWeak(v67);
  if (v38)
    std::__shared_weak_count::__release_weak(v38);
  objc_destroyWeak(&location);
  v51 = v73;
  if (v73)
  {
    v52 = (unint64_t *)&v73->__shared_owners_;
    do
      v53 = __ldaxr(v52);
    while (__stlxr(v53 - 1, v52));
    if (!v53)
    {
      ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
      std::__shared_weak_count::__release_weak(v51);
    }
  }

  v47 = 1;
LABEL_64:

  objc_sync_exit(v11);
  if (v47)
  {
    objc_msgSend(v7, "exportedObject");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v54);

    v64[0] = v16;
    v64[1] = 3221225472;
    v64[2] = __53__AVHapticServer_listener_shouldAcceptNewConnection___block_invoke_391;
    v64[3] = &unk_1E450C8E8;
    objc_copyWeak(&v65, &location);
    objc_msgSend(v7, "setInterruptionHandler:", v64);
    v62[0] = v16;
    v62[1] = 3221225472;
    v62[2] = __53__AVHapticServer_listener_shouldAcceptNewConnection___block_invoke_392;
    v62[3] = &unk_1E450C8E8;
    objc_copyWeak(&v63, &location);
    objc_msgSend(v7, "setInvalidationHandler:", v62);
    objc_msgSend(v7, "resume");
    if (kHSRVScope)
    {
      v55 = *(id *)kHSRVScope;
      if (!v55)
      {
LABEL_72:
        objc_destroyWeak(&v63);
        objc_destroyWeak(&v65);
        objc_destroyWeak(&location);
        goto LABEL_73;
      }
    }
    else
    {
      v55 = MEMORY[0x1E0C81028];
      v56 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v74 = 136315650;
      *(_QWORD *)&v74[4] = "AVHapticServer.mm";
      v75 = 1024;
      v76 = 2456;
      v77 = 2080;
      v78 = "-[AVHapticServer listener:shouldAcceptNewConnection:]";
      _os_log_impl(&dword_1A0F4D000, v55, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [xpc] Done", v74, 0x1Cu);
    }

    goto LABEL_72;
  }
LABEL_73:

  return v47;
}

- (unint64_t)initCount
{
  return self->_initCount;
}

- (void)manager
{
  return self->_manager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedError, 0);
  std::__tree<std::__value_type<unsigned long,caulk::alloc::consolidating_free_map<AQ::SharedPageAllocator,10485760ul>::FreelistOfSize>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,caulk::alloc::consolidating_free_map<AQ::SharedPageAllocator,10485760ul>::FreelistOfSize>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,caulk::alloc::consolidating_free_map<AQ::SharedPageAllocator,10485760ul>::FreelistOfSize>>>::destroy((_QWORD *)self->_processIndexMap.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_cachedServerInterface, 0);
  objc_storeStrong((id *)&self->_cachedClientInterface, 0);
  std::recursive_mutex::~recursive_mutex((std::recursive_mutex *)&self->_instanceMutex);
  std::__tree<std::__value_type<unsigned int,NSMutableArray<AVServerWrapper *> * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,NSMutableArray<AVServerWrapper *> * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,NSMutableArray<AVServerWrapper *> * {__strong}>>>::destroy((_QWORD *)self->_instanceMap.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (id).cxx_construct
{
  self->_instanceMap.__tree_.__pair3_.__value_ = 0;
  self->_instanceMap.__tree_.__pair1_.__value_.__left_ = 0;
  self->_instanceMap.__tree_.__begin_node_ = &self->_instanceMap.__tree_.__pair1_;
  MEMORY[0x1A1B07918](&self->_instanceMutex, a2);
  self->_processIndexMap.__tree_.__pair3_.__value_ = 0;
  self->_processIndexMap.__tree_.__pair1_.__value_.__left_ = 0;
  self->_processIndexMap.__tree_.__begin_node_ = &self->_processIndexMap.__tree_.__pair1_;
  return self;
}

void __53__AVHapticServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  id v16;
  id v17;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (kHSRVScope)
    {
      v3 = *(id *)kHSRVScope;
      if (!v3)
        goto LABEL_12;
    }
    else
    {
      v3 = (id)MEMORY[0x1E0C81028];
      v5 = MEMORY[0x1E0C81028];
    }
    v6 = v3;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 136315906;
      v19 = "AVHapticServer.mm";
      v20 = 1024;
      v21 = 2421;
      v22 = 2080;
      v23 = "-[AVHapticServer listener:shouldAcceptNewConnection:]_block_invoke";
      v24 = 2048;
      v25 = objc_msgSend(WeakRetained, "clientID");
      _os_log_impl(&dword_1A0F4D000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: <Client ID 0x%lx finish callback>", (uint8_t *)&v18, 0x26u);
    }

LABEL_12:
    v7 = (void *)MEMORY[0x1A1B082CC]();
    objc_msgSend(WeakRetained, "getAsyncDelegateForMethod:errorHandler:", *(_QWORD *)(a1 + 40), &__block_literal_global_389);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      if (kHSRVScope)
      {
        v10 = *(id *)kHSRVScope;
        if (!v10)
          goto LABEL_38;
      }
      else
      {
        v10 = MEMORY[0x1E0C81028];
        v17 = MEMORY[0x1E0C81028];
      }
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
LABEL_37:

LABEL_38:
        objc_autoreleasePoolPop(v7);
        goto LABEL_39;
      }
      v18 = 136315650;
      v19 = "AVHapticServer.mm";
      v20 = 1024;
      v21 = 2433;
      v22 = 2080;
      v23 = "-[AVHapticServer listener:shouldAcceptNewConnection:]_block_invoke";
      v13 = "%25s:%-5d %s: <WARNING: Async delegate for client was nil!>";
      v14 = v10;
      v15 = OS_LOG_TYPE_DEFAULT;
LABEL_36:
      _os_log_impl(&dword_1A0F4D000, v14, v15, v13, (uint8_t *)&v18, 0x1Cu);
      goto LABEL_37;
    }
    if (kHSRVScope)
    {
      v9 = *(id *)kHSRVScope;
      if (!v9)
      {
LABEL_23:
        objc_msgSend(v8, "clientCompletedWithError:", 0);
        if (kHSRVScope)
        {
          v10 = *(id *)kHSRVScope;
          if (!v10)
            goto LABEL_38;
        }
        else
        {
          v10 = MEMORY[0x1E0C81028];
          v12 = MEMORY[0x1E0C81028];
        }
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          goto LABEL_37;
        v18 = 136315650;
        v19 = "AVHapticServer.mm";
        v20 = 1024;
        v21 = 2430;
        v22 = 2080;
        v23 = "-[AVHapticServer listener:shouldAcceptNewConnection:]_block_invoke";
        v13 = "%25s:%-5d %s: <Done calling clientCompletedWithError:>";
        v14 = v10;
        v15 = OS_LOG_TYPE_INFO;
        goto LABEL_36;
      }
    }
    else
    {
      v9 = MEMORY[0x1E0C81028];
      v11 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 136315650;
      v19 = "AVHapticServer.mm";
      v20 = 1024;
      v21 = 2428;
      v22 = 2080;
      v23 = "-[AVHapticServer listener:shouldAcceptNewConnection:]_block_invoke";
      _os_log_impl(&dword_1A0F4D000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: <Calling clientCompletedWithError: on client delegate>", (uint8_t *)&v18, 0x1Cu);
    }

    goto LABEL_23;
  }
  if (kHSRVScope)
  {
    v4 = *(id *)kHSRVScope;
    if (!v4)
      goto LABEL_39;
  }
  else
  {
    v4 = MEMORY[0x1E0C81028];
    v16 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136315650;
    v19 = "AVHapticServer.mm";
    v20 = 1024;
    v21 = 2438;
    v22 = 2080;
    v23 = "-[AVHapticServer listener:shouldAcceptNewConnection:]_block_invoke";
    _os_log_impl(&dword_1A0F4D000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: <WARNING: Weak AVHapticServerInstance was nil!>", (uint8_t *)&v18, 0x1Cu);
  }

LABEL_39:
}

void __53__AVHapticServer_listener_shouldAcceptNewConnection___block_invoke_391(uint64_t a1)
{
  id v2;
  id v3;
  NSObject *v4;
  id WeakRetained;
  id v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (kHSRVScope)
  {
    v2 = *(id *)kHSRVScope;
    if (!v2)
      goto LABEL_8;
  }
  else
  {
    v2 = (id)MEMORY[0x1E0C81028];
    v3 = MEMORY[0x1E0C81028];
  }
  v4 = v2;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v7 = 136315906;
    v8 = "AVHapticServer.mm";
    v9 = 1024;
    v10 = 2446;
    v11 = 2080;
    v12 = "-[AVHapticServer listener:shouldAcceptNewConnection:]_block_invoke";
    v13 = 1024;
    v14 = objc_msgSend(WeakRetained, "clientID");
    _os_log_impl(&dword_1A0F4D000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: [xpc] InterruptionHandler: client 0x%x", (uint8_t *)&v7, 0x22u);

  }
LABEL_8:
  v6 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v6, "handleConnectionError");

}

void __53__AVHapticServer_listener_shouldAcceptNewConnection___block_invoke_392(uint64_t a1)
{
  id v2;
  id v3;
  NSObject *v4;
  id WeakRetained;
  id v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (kHSRVScope)
  {
    v2 = *(id *)kHSRVScope;
    if (!v2)
      goto LABEL_8;
  }
  else
  {
    v2 = (id)MEMORY[0x1E0C81028];
    v3 = MEMORY[0x1E0C81028];
  }
  v4 = v2;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v7 = 136315906;
    v8 = "AVHapticServer.mm";
    v9 = 1024;
    v10 = 2450;
    v11 = 2080;
    v12 = "-[AVHapticServer listener:shouldAcceptNewConnection:]_block_invoke";
    v13 = 1024;
    v14 = objc_msgSend(WeakRetained, "clientID");
    _os_log_impl(&dword_1A0F4D000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: [xpc] InvalidationHandler: client 0x%x", (uint8_t *)&v7, 0x22u);

  }
LABEL_8:
  v6 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v6, "handleConnectionError");

}

void __53__AVHapticServer_listener_shouldAcceptNewConnection___block_invoke_388(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (kHSRVScope)
  {
    v3 = *(id *)kHSRVScope;
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    v3 = (id)MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  v5 = v3;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v2, "localizedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315906;
    v8 = "AVHapticServer.mm";
    v9 = 1024;
    v10 = 2424;
    v11 = 2080;
    v12 = "-[AVHapticServer listener:shouldAcceptNewConnection:]_block_invoke";
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1A0F4D000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unable to notify client of finish: %@", (uint8_t *)&v7, 0x26u);

  }
LABEL_8:

}

void __48__AVHapticServer_doStartRunning_completedBlock___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  id WeakRetained;
  BOOL v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  id v22;
  void *v23;
  std::__shared_weak_count *v24;
  unint64_t v25;
  unint64_t *v26;
  unint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  uint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  uint64_t v38;
  std::__shared_weak_count *v39;
  uint64_t v40;
  std::__shared_weak_count *v41;
  _QWORD v42[2];
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v2 = atomic_load((unsigned int *)(*(_QWORD *)(a1 + 56) + 120));
  if (v2 < 1)
  {
    if (kHSRVScope)
    {
      v5 = *(id *)kHSRVScope;
      if (!v5)
      {
LABEL_16:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -4807;
        return;
      }
    }
    else
    {
      v5 = MEMORY[0x1E0C81028];
      v7 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 24);
      *(_DWORD *)buf = 136315906;
      v44 = "AVHapticServer.mm";
      v45 = 1024;
      v46 = 2289;
      v47 = 2080;
      v48 = "-[AVHapticServer doStartRunning:completedBlock:]_block_invoke";
      v49 = 2048;
      v50 = v8;
      _os_log_impl(&dword_1A0F4D000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: ERROR: Attempting to start uninitialized client (ID 0x%lx)", buf, 0x26u);
    }

    goto LABEL_16;
  }
  v3 = atomic_load((unsigned int *)(*(_QWORD *)(a1 + 56) + 120));
  if (v3 <= 1)
  {
    if (kHSRVScope)
    {
      v6 = *(id *)kHSRVScope;
      if (!v6)
      {
LABEL_25:
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
        v13 = WeakRetained == 0;

        if (!v13)
        {
          v14 = objc_loadWeakRetained((id *)(a1 + 48));
          v15 = objc_msgSend(v14, "manager");
          v16 = *(_QWORD *)(a1 + 56);
          v17 = *(std::__shared_weak_count **)(a1 + 64);
          v42[0] = v16;
          v42[1] = v17;
          if (v17)
          {
            p_shared_owners = (unint64_t *)&v17->__shared_owners_;
            do
              v19 = __ldxr(p_shared_owners);
            while (__stxr(v19 + 1, p_shared_owners));
            v16 = *(_QWORD *)(a1 + 56);
          }
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = ServerManager::startEntry(v15, v42, 0, *(unsigned __int8 *)(v16 + 108));
          if (v17)
          {
            v20 = (unint64_t *)&v17->__shared_owners_;
            do
              v21 = __ldaxr(v20);
            while (__stlxr(v21 - 1, v20));
            if (!v21)
            {
              ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
              std::__shared_weak_count::__release_weak(v17);
            }
          }

          if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
          {
            v22 = objc_loadWeakRetained((id *)(a1 + 48));
            v23 = v22;
            v24 = *(std::__shared_weak_count **)(a1 + 64);
            v25 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 96);
            v40 = *(_QWORD *)(a1 + 56);
            v41 = v24;
            if (v24)
            {
              v26 = (unint64_t *)&v24->__shared_owners_;
              do
                v27 = __ldxr(v26);
              while (__stxr(v27 + 1, v26));
            }
            objc_msgSend(v22, "incrementRunningCountForAudio:haptics:entry:", (v25 >> 1) & 1, v25 & 1, &v40);
            v28 = v41;
            if (v41)
            {
              v29 = (unint64_t *)&v41->__shared_owners_;
              do
                v30 = __ldaxr(v29);
              while (__stlxr(v30 - 1, v29));
              if (!v30)
              {
                ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
                std::__shared_weak_count::__release_weak(v28);
              }
            }

            v31 = *(_QWORD *)(a1 + 32);
            v32 = *(std::__shared_weak_count **)(a1 + 64);
            v38 = *(_QWORD *)(a1 + 56);
            v39 = v32;
            if (v32)
            {
              v33 = (unint64_t *)&v32->__shared_owners_;
              do
                v34 = __ldxr(v33);
              while (__stxr(v34 + 1, v33));
            }
            (*(void (**)(uint64_t, uint64_t *, _QWORD))(v31 + 16))(v31, &v38, *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
            v35 = v39;
            if (v39)
            {
              v36 = (unint64_t *)&v39->__shared_owners_;
              do
                v37 = __ldaxr(v36);
              while (__stlxr(v37 - 1, v36));
              if (!v37)
              {
                ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
                std::__shared_weak_count::__release_weak(v35);
              }
            }
          }
        }
        return;
      }
    }
    else
    {
      v6 = MEMORY[0x1E0C81028];
      v10 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 24);
      *(_DWORD *)buf = 136315906;
      v44 = "AVHapticServer.mm";
      v45 = 1024;
      v46 = 2293;
      v47 = 2080;
      v48 = "-[AVHapticServer doStartRunning:completedBlock:]_block_invoke";
      v49 = 2048;
      v50 = v11;
      _os_log_impl(&dword_1A0F4D000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Starting stopped client ID: 0x%lx", buf, 0x26u);
    }

    goto LABEL_25;
  }
  if (kHSRVScope)
  {
    v4 = *(id *)kHSRVScope;
    if (!v4)
      return;
  }
  else
  {
    v4 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v44 = "AVHapticServer.mm";
    v45 = 1024;
    v46 = 2304;
    v47 = 2080;
    v48 = "-[AVHapticServer doStartRunning:completedBlock:]_block_invoke";
    _os_log_impl(&dword_1A0F4D000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: WARNING: Client already running or flushing -- no call to notifyFinished", buf, 0x1Cu);
  }

}

- (void)incrementRunningCountForAudio:haptics:entry:
{
  *a2 = &off_1E450CAE0;
}

- (_QWORD)incrementRunningCountForAudio:haptics:entry:
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_1E450CAE0;
  return result;
}

- (uint64_t)incrementRunningCountForAudio:haptics:entry:
{
  NSObject *v0;
  id v1;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (kHSRVScope)
  {
    v0 = *(id *)kHSRVScope;
    if (!v0)
      return 0;
  }
  else
  {
    v0 = MEMORY[0x1E0C81028];
    v1 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    v3 = 136315650;
    v4 = "AVHapticServer.mm";
    v5 = 1024;
    v6 = 1928;
    v7 = 2080;
    v8 = "operator()";
    _os_log_impl(&dword_1A0F4D000, v0, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Synth restarting due to interruption. No-op on session activator", (uint8_t *)&v3, 0x1Cu);
  }

  return 0;
}

void __22__AVHapticServer_init__block_invoke(uint64_t a1)
{
  HapticMetrics *v2;
  double v3;
  uint64_t v4;
  double v5;
  BOOL v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id WeakRetained;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = (HapticMetrics *)CADeprecated::TSingleton<HapticMetrics>::instance();
  v3 = HapticMetrics::onTime(v2);
  v4 = CADeprecated::TSingleton<HapticMetrics>::instance();
  std::mutex::lock((std::mutex *)(v4 + 32));
  v5 = 0.0;
  if (*(_BYTE *)(v4 + 18))
    v6 = 1;
  else
    v6 = *(_BYTE *)(v4 + 17) == 0;
  if (!v6)
    v5 = (double)mach_absolute_time() * 0.0000000416666667 - *(double *)(v4 + 8);
  std::mutex::unlock((std::mutex *)(v4 + 32));
  if (v3 > 0.0)
  {
    if (kHSRVScope)
    {
      if ((*(_BYTE *)(kHSRVScope + 8) & 1) != 0)
      {
        v7 = *(id *)kHSRVScope;
        if (v7)
        {
          v8 = v7;
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315906;
            v19 = "AVHapticServer.mm";
            v20 = 1024;
            v21 = 1722;
            v22 = 2080;
            v23 = "-[AVHapticServer init]_block_invoke";
            v24 = 2048;
            v25 = v3;
            _os_log_impl(&dword_1A0F4D000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: <Haptic on time: %.1f seconds>", buf, 0x26u);
          }

        }
      }
    }
  }
  if (v5 > 0.0)
  {
    if (kHSRVScope)
    {
      if ((*(_BYTE *)(kHSRVScope + 8) & 1) != 0)
      {
        v9 = *(id *)kHSRVScope;
        if (v9)
        {
          v10 = v9;
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315906;
            v19 = "AVHapticServer.mm";
            v20 = 1024;
            v21 = 1723;
            v22 = 2080;
            v23 = "-[AVHapticServer init]_block_invoke";
            v24 = 2048;
            v25 = v5;
            _os_log_impl(&dword_1A0F4D000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: <Haptic prewarm time: %.1f seconds>", buf, 0x26u);
          }

        }
      }
    }
  }
  if (v3 > *(double *)&PowerTimer::_sOnTimeThreshold)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v12 = WeakRetained;
    if (WeakRetained)
      objc_msgSend(WeakRetained, "displayRunningProcessEntriesWithOnTime:", (unint64_t)v3);

  }
  if (v5 > 600.0)
  {
    v13 = objc_loadWeakRetained((id *)(a1 + 32));
    v14 = v13;
    if (v13
      && objc_msgSend(v13, "shouldUnprewarmAllClientsAfterDisplayingPrewarmedProcessEntriesWithPrewarmTime:", (unint64_t)v5))
    {
      objc_initWeak((id *)buf, v14);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __22__AVHapticServer_init__block_invoke_333;
      v16[3] = &unk_1E450C8E8;
      objc_copyWeak(&v17, (id *)buf);
      if (AudioControlQueue(void)::once != -1)
        dispatch_once(&AudioControlQueue(void)::once, &__block_literal_global_5);
      v15 = (id)AudioControlQueue(void)::gAudioControlQueue;
      AT::DispatchBlock(v15, v16, 1, (uint64_t)"-[AVHapticServer init]_block_invoke", (uint64_t)"AVHapticServer.mm", 1739);

      objc_destroyWeak(&v17);
      objc_destroyWeak((id *)buf);
    }

  }
}

uint64_t __22__AVHapticServer_init__block_invoke_2(uint64_t a1, FILE *__stream)
{
  uint64_t v4;
  HapticMetrics *v5;
  double v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  unsigned __int8 v11;
  int v12;
  int v13;
  int v14;
  int AppBooleanValue;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  ClientEntry *v20;
  std::__shared_weak_count *v21;
  unint64_t *p_shared_owners;
  unint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t result;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  Boolean keyExistsAndHasValidFormat;

  fwrite("Server:\n", 8uLL, 1uLL, __stream);
  v4 = *(_QWORD *)(a1 + 32);
  fprintf(__stream, "\tinit count: %d, prewarm count: audio %d haptics %d running count: audio %d haptics %d\n", *(_OWORD *)(v4 + 152), *(_QWORD *)(v4 + 160), *(_OWORD *)(v4 + 168), *(_QWORD *)(v4 + 176), *(_QWORD *)(v4 + 184));
  v5 = (HapticMetrics *)CADeprecated::TSingleton<HapticMetrics>::instance();
  v6 = HapticMetrics::onTime(v5);
  fprintf(__stream, "\tHaptics on-time: %.1f seconds\n", v6);
  objc_msgSend(*(id *)(a1 + 32), "dumpProcessEntries:", __stream);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
  fwrite("\nServerManager:\n", 0x10uLL, 1uLL, __stream);
  v8 = *(unsigned __int8 *)(v7 + 472);
  v9 = *(unsigned __int8 *)(v7 + 474);
  v10 = *(unsigned __int8 *)(v7 + 475);
  v11 = atomic_load((unsigned __int8 *)(v7 + 478));
  v12 = v11 & 1;
  v13 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(v7 + 456) + 64))(*(_QWORD *)(v7 + 456));
  v14 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(v7 + 456) + 72))(*(_QWORD *)(v7 + 456));
  fprintf(__stream, "\tGlobal: mVibrationDisabled: %d mPhoneCallActive: %d mMicIsActive: %d mContinuityScreenOn: %d mActiveHighPriorityClientCount: %d, mActiveMediumPriorityClientCount: %d\n", v8, v9, v10, v12, v13, v14);
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("effects-haptic"), CFSTR("com.apple.preferences.sounds"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    fprintf(__stream, "\tSystem Haptics Enabled: %d\n", AppBooleanValue);
  v16 = *(_QWORD *)(v7 + 224);
  v17 = *(_QWORD *)(v7 + 200);
  v33 = v7 + 24;
  v34 = 1;
  std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)(v7 + 24));
  v35 = v7;
  v36 = v17;
  fprintf(__stream, "\tCommand list length: %d\n\t%d clients:\n", v16, *(_QWORD *)(v7 + 16));
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v33);
  v18 = *(_QWORD *)(v7 + 200);
  v33 = v7 + 24;
  v34 = 1;
  std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)(v7 + 24));
  v35 = v7;
  v36 = v18;
  v19 = *(_QWORD **)v7;
  if (*(_QWORD *)v7 != v7 + 8)
  {
    do
    {
      v20 = (ClientEntry *)v19[5];
      v21 = (std::__shared_weak_count *)v19[6];
      if (v21)
      {
        p_shared_owners = (unint64_t *)&v21->__shared_owners_;
        do
          v23 = __ldxr(p_shared_owners);
        while (__stxr(v23 + 1, p_shared_owners));
      }
      ClientEntry::dump(v20, __stream);
      if (v21)
      {
        v24 = (unint64_t *)&v21->__shared_owners_;
        do
          v25 = __ldaxr(v24);
        while (__stlxr(v25 - 1, v24));
        if (!v25)
        {
          ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
          std::__shared_weak_count::__release_weak(v21);
        }
      }
      v26 = (_QWORD *)v19[1];
      if (v26)
      {
        do
        {
          v27 = v26;
          v26 = (_QWORD *)*v26;
        }
        while (v26);
      }
      else
      {
        do
        {
          v27 = (_QWORD *)v19[2];
          v28 = *v27 == (_QWORD)v19;
          v19 = v27;
        }
        while (!v28);
      }
      v19 = v27;
    }
    while (v27 != (_QWORD *)(v7 + 8));
  }
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v33);
  v30 = *(_QWORD *)(v7 + 240);
  v29 = v7 + 240;
  v31 = (*(uint64_t (**)(uint64_t))(v30 + 16))(v29);
  result = (*(uint64_t (**)(_QWORD, FILE *))(**(_QWORD **)(v29 - 8) + 152))(*(_QWORD *)(v29 - 8), __stream);
  if (v31)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v29 + 24))(v29);
  return result;
}

void __22__AVHapticServer_init__block_invoke_333(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  id v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (kHSRVScope)
  {
    v2 = *(id *)kHSRVScope;
    if (!v2)
      goto LABEL_8;
  }
  else
  {
    v2 = MEMORY[0x1E0C81028];
    v3 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315650;
    v5 = "AVHapticServer.mm";
    v6 = 1024;
    v7 = 1737;
    v8 = 2080;
    v9 = "-[AVHapticServer init]_block_invoke";
    _os_log_impl(&dword_1A0F4D000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Synth has been prewarmed beyond threshold time. Unprewarming all clients", (uint8_t *)&v4, 0x1Cu);
  }

LABEL_8:
  objc_msgSend(WeakRetained, "unprewarmAllClientEntries");

}

- (int)startPrewarm
{
  NSObject *v3;
  id v4;
  unint64_t *v5;
  unint64_t v6;
  int v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v15;
  std::__shared_weak_count *v16;
  _BYTE buf[18];
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (kHSRVScope)
  {
    v3 = *(id *)kHSRVScope;
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "AVHapticServer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1511;
    v18 = 2080;
    v19 = "-[AVHapticServer(VibeSynthEngine) startPrewarm]";
    _os_log_impl(&dword_1A0F4D000, v3, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Starting prewarm on SSS client", buf, 0x1Cu);
  }

LABEL_8:
  ServerManager::entryForID((ServerManager *)buf, (uint64_t)self->_manager, self->_SSSClientID);
  if (*(_QWORD *)buf)
  {
    v15 = *(_QWORD *)buf;
    v16 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v5 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v6 = __ldxr(v5);
      while (__stxr(v6 + 1, v5));
    }
    v7 = -[AVHapticServer doPrewarm:](self, "doPrewarm:", &v15);
    v8 = v16;
    if (v16)
    {
      p_shared_owners = (unint64_t *)&v16->__shared_owners_;
      do
        v10 = __ldaxr(p_shared_owners);
      while (__stlxr(v10 - 1, p_shared_owners));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
  }
  else
  {
    v7 = -4810;
  }
  v11 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v12 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  return v7;
}

- (int)stopPrewarm
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  ServerManager *manager;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  id v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26[2];
  uint64_t v27;
  uint64_t v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (kHSRVScope)
  {
    v3 = *(id *)kHSRVScope;
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v30 = "AVHapticServer.mm";
    v31 = 1024;
    v32 = 1525;
    v33 = 2080;
    v34 = "-[AVHapticServer(VibeSynthEngine) stopPrewarm]";
    _os_log_impl(&dword_1A0F4D000, v3, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Stopping prewarm on SSS client", buf, 0x1Cu);
  }

LABEL_8:
  ServerManager::entryForID((ServerManager *)&v27, (uint64_t)self->_manager, self->_SSSClientID);
  v5 = v27;
  if (!v27)
  {
    LODWORD(v7) = -4810;
    goto LABEL_42;
  }
  if (!*(_BYTE *)(v27 + 116))
  {
    if (kHSRVScope)
    {
      v7 = *(id *)kHSRVScope;
      if (!v7)
        goto LABEL_42;
    }
    else
    {
      v7 = MEMORY[0x1E0C81028];
      v19 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v30 = "AVHapticServer.mm";
      v31 = 1024;
      v32 = 1535;
      v33 = 2080;
      v34 = "-[AVHapticServer(VibeSynthEngine) stopPrewarm]";
      _os_log_impl(&dword_1A0F4D000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: SSS client was not prewarmed -- noop", buf, 0x1Cu);
    }

    goto LABEL_41;
  }
  if (kHSRVScope)
  {
    v6 = *(id *)kHSRVScope;
    if (!v6)
      goto LABEL_21;
  }
  else
  {
    v6 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v30 = "AVHapticServer.mm";
    v31 = 1024;
    v32 = 1530;
    v33 = 2080;
    v34 = "-[AVHapticServer(VibeSynthEngine) stopPrewarm]";
    _os_log_impl(&dword_1A0F4D000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: SSS client was prewarmed", buf, 0x1Cu);
  }

LABEL_21:
  manager = (ServerManager *)self->_manager;
  v10 = (std::__shared_weak_count *)v28;
  v26[0] = v5;
  v26[1] = v28;
  if (v28)
  {
    v11 = (unint64_t *)(v28 + 8);
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }
  ServerManager::stopPrewarmEntry(manager, v26);
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  v24 = v27;
  v25 = v28;
  if (v28)
  {
    v15 = (unint64_t *)(v28 + 8);
    do
      v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
  }
  -[AVHapticServer decrementPrewarmCountAndStopAudio:stopHaptics:entry:](self, "decrementPrewarmCountAndStopAudio:stopHaptics:entry:", 0, 1, &v24);
  v7 = v25;
  if (v25)
  {
    v17 = (unint64_t *)(v25 + 8);
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      (*((void (**))v7->isa + 2))(v7);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v7);
    }
LABEL_41:
    LODWORD(v7) = 0;
  }
LABEL_42:
  v20 = (std::__shared_weak_count *)v28;
  if (v28)
  {
    v21 = (unint64_t *)(v28 + 8);
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  return (int)v7;
}

- (void)checkRunningCountAndStopSynth
{
  unint64_t hapticsRunningCount;
  unint64_t audioRunningCount;
  BOOL v4;
  NSObject *v6;
  NSObject *v7;
  id v8;
  id v9;
  const char *v10;
  HapticMetrics *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  audioRunningCount = self->_audioRunningCount;
  hapticsRunningCount = self->_hapticsRunningCount;
  if (audioRunningCount)
    v4 = hapticsRunningCount == 0;
  else
    v4 = 1;
  if (v4)
  {
    if (!(audioRunningCount | hapticsRunningCount))
    {
      if (kHSRVScope)
      {
        v6 = *(id *)kHSRVScope;
        if (!v6)
        {
LABEL_17:
          ServerManager::stopSynthRunning((ServerManager *)self->_manager, 1, 1, 9999999);
LABEL_25:
          v11 = (HapticMetrics *)CADeprecated::TSingleton<HapticMetrics>::instance();
          HapticMetrics::markEngineOff(v11);
          return;
        }
      }
      else
      {
        v6 = MEMORY[0x1E0C81028];
        v8 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315650;
        v13 = "AVHapticServer.mm";
        v14 = 1024;
        v15 = 1550;
        v16 = 2080;
        v17 = "-[AVHapticServer(VibeSynthEngine) checkRunningCountAndStopSynth]";
        _os_log_impl(&dword_1A0F4D000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: audio and haptics running counts at zero and stopping synth", (uint8_t *)&v12, 0x1Cu);
      }

      goto LABEL_17;
    }
    if (kHSRVScope)
    {
      v7 = *(id *)kHSRVScope;
      if (!v7)
        goto LABEL_24;
    }
    else
    {
      v7 = MEMORY[0x1E0C81028];
      v9 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = "haptics running count";
      v12 = 136315906;
      v13 = "AVHapticServer.mm";
      v14 = 1024;
      v15 = 1554;
      v17 = "-[AVHapticServer(VibeSynthEngine) checkRunningCountAndStopSynth]";
      v16 = 2080;
      if (!audioRunningCount)
        v10 = "audio running count";
      v18 = 2080;
      v19 = v10;
      _os_log_impl(&dword_1A0F4D000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: %s at zero, stopping synth", (uint8_t *)&v12, 0x26u);
    }

LABEL_24:
    ServerManager::stopSynthRunning((ServerManager *)self->_manager, audioRunningCount == 0, hapticsRunningCount == 0, 9999999);
    if (hapticsRunningCount)
      return;
    goto LABEL_25;
  }
}

- (int)playVibePattern:(void *)a3 gain:(float)a4 synchronizer:(SSPlayerSynchronizer *)a5 flags:(unsigned int)a6 atTime:(double)a7 completionHandler:(id)a8
{
  uint64_t v8;
  id v12;
  ClientEntry *v13;
  NSObject *v14;
  int v15;
  id v16;
  unint64_t SSSClientID;
  void *manager;
  std::__shared_weak_count *v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  int started;
  unint64_t *v23;
  unint64_t v24;
  NSObject *v25;
  NSObject *v26;
  unint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  NSObject *v32;
  id v33;
  ClientEntry *v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  unint64_t *v38;
  unint64_t v39;
  NSObject *v40;
  id v41;
  CFTypeID v42;
  void *v43;
  unint64_t *v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t *v47;
  unint64_t v48;
  unint64_t *v49;
  unint64_t v50;
  unint64_t *v51;
  unint64_t v52;
  uint64_t v53;
  std::__shared_weak_count *v54;
  unint64_t *v55;
  unint64_t v56;
  unint64_t *v57;
  unint64_t v58;
  std::__shared_weak_count *v59;
  unint64_t *v60;
  unint64_t v61;
  uint64_t v62;
  id v63;
  id v64;
  id v65;
  unint64_t *p_shared_weak_owners;
  unint64_t v67;
  _QWORD *v68;
  unsigned int *v69;
  uint64_t v70;
  _QWORD *v71;
  uint64_t v72;
  unint64_t *v73;
  unint64_t v74;
  uint64_t v75;
  std::__shared_weak_count *v76;
  unint64_t *v77;
  unint64_t v78;
  NSObject *v79;
  unint64_t *v80;
  unint64_t v81;
  NSObject *v82;
  id v83;
  NSObject *v84;
  id v85;
  _QWORD *v86;
  uint64_t v87;
  std::__shared_weak_count *v88;
  unint64_t *v89;
  unint64_t v90;
  NSObject *v91;
  id v92;
  unint64_t *v93;
  unint64_t v94;
  std::__shared_weak_count *v95;
  unint64_t *v96;
  unint64_t v97;
  std::__shared_weak_count *v98;
  unint64_t *v99;
  unint64_t v100;
  NSObject *v101;
  id v102;
  std::__shared_weak_count *v103;
  unint64_t *v104;
  unint64_t v105;
  NSObject *log;
  SSPlayerSynchronizer *v108;
  _QWORD *v109;
  _QWORD v110[4];
  id v111;
  ClientEntry *v112;
  std::__shared_weak_count *v113;
  _QWORD aBlock[4];
  id v115;
  id v116[2];
  std::__shared_weak_count *v117;
  uint64_t v118;
  uint64_t v119;
  id location;
  ClientEntry *v121;
  std::__shared_weak_count *v122;
  _QWORD v123[2];
  ClientEntry *v124;
  std::__shared_weak_count *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128[2];
  ClientEntry *v129;
  std::__shared_weak_count *v130;
  _QWORD v131[3];
  _QWORD *v132;
  _BYTE buf[18];
  __int16 v134;
  _BYTE v135[20];
  __int128 v136;
  unsigned int v137[6];
  unsigned int *v138;
  uint8_t v139[4];
  const char *v140;
  __int16 v141;
  int v142;
  __int16 v143;
  const char *v144;
  __int16 v145;
  _BYTE v146[14];
  uint64_t v147;

  v8 = *(_QWORD *)&a6;
  v147 = *MEMORY[0x1E0C80C00];
  v12 = a8;
  ServerManager::entryForID((ServerManager *)&v124, (uint64_t)self->_manager, self->_SSSClientID);
  v13 = v124;
  if (!v124)
  {
    v15 = -4810;
    goto LABEL_187;
  }
  v108 = a5;
  if (kHSRVScope)
  {
    v14 = *(id *)kHSRVScope;
    if (!v14)
      goto LABEL_10;
  }
  else
  {
    v14 = MEMORY[0x1E0C81028];
    v16 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    SSSClientID = self->_SSSClientID;
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "AVHapticServer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1573;
    v134 = 2080;
    *(_QWORD *)v135 = "-[AVHapticServer(VibeSynthEngine) playVibePattern:gain:synchronizer:flags:atTime:completionHandler:]";
    *(_WORD *)&v135[8] = 1024;
    *(_DWORD *)&v135[10] = SSSClientID;
    _os_log_impl(&dword_1A0F4D000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Request to play SSS pattern on client 0x%x", buf, 0x22u);
  }

LABEL_10:
  manager = self->_manager;
  v19 = v125;
  v123[0] = v13;
  v123[1] = v125;
  if (v125)
  {
    p_shared_owners = (unint64_t *)&v125->__shared_owners_;
    do
      v21 = __ldxr(p_shared_owners);
    while (__stxr(v21 + 1, p_shared_owners));
  }
  started = ServerManager::startEntry((uint64_t)manager, v123, (v8 >> 1) & 1, (v8 >> 2) & 1);
  v15 = started;
  if (!v19)
    goto LABEL_17;
  v23 = (unint64_t *)&v19->__shared_owners_;
  do
    v24 = __ldaxr(v23);
  while (__stlxr(v24 - 1, v23));
  if (!v24)
  {
    ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
    std::__shared_weak_count::__release_weak(v19);
    if (!v15)
    {
LABEL_27:
      v121 = v124;
      v122 = v125;
      if (v125)
      {
        v27 = (unint64_t *)&v125->__shared_owners_;
        do
          v28 = __ldxr(v27);
        while (__stxr(v28 + 1, v27));
      }
      -[AVHapticServer incrementRunningCountForAudio:haptics:entry:](self, "incrementRunningCountForAudio:haptics:entry:", 0, 1, &v121);
      v29 = v122;
      if (v122)
      {
        v30 = (unint64_t *)&v122->__shared_owners_;
        do
          v31 = __ldaxr(v30);
        while (__stlxr(v31 - 1, v30));
        if (!v31)
        {
          ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
          std::__shared_weak_count::__release_weak(v29);
        }
      }
      if (kHSRVScope)
      {
        v32 = *(id *)kHSRVScope;
        if (!v32)
          goto LABEL_42;
      }
      else
      {
        v32 = MEMORY[0x1E0C81028];
        v33 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "AVHapticServer.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 1582;
        v134 = 2080;
        *(_QWORD *)v135 = "-[AVHapticServer(VibeSynthEngine) playVibePattern:gain:synchronizer:flags:atTime:completionHandler:]";
        _os_log_impl(&dword_1A0F4D000, v32, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Starting SSS pattern playback", buf, 0x1Cu);
      }

LABEL_42:
      objc_initWeak(&location, self);
      v109 = self->_manager;
      v34 = v124;
      v35 = v125;
      v118 = (uint64_t)v124;
      v119 = (uint64_t)v125;
      if (v125)
      {
        v36 = (unint64_t *)&v125->__shared_owners_;
        do
          v37 = __ldxr(v36);
        while (__stxr(v37 + 1, v36));
      }
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3321888768;
      aBlock[2] = __100__AVHapticServer_VibeSynthEngine__playVibePattern_gain_synchronizer_flags_atTime_completionHandler___block_invoke;
      aBlock[3] = &unk_1E450C8B0;
      objc_copyWeak(v116, &location);
      v116[1] = v34;
      v117 = v35;
      if (v35)
      {
        v38 = (unint64_t *)&v35->__shared_owners_;
        do
          v39 = __ldxr(v38);
        while (__stxr(v39 + 1, v38));
      }
      v115 = v12;
      v132 = 0;
      v131[0] = &off_1E450CA98;
      v131[1] = _Block_copy(aBlock);
      v132 = v131;
      if (kHSEQScope)
      {
        v40 = *(id *)kHSEQScope;
        if (!v40)
          goto LABEL_55;
      }
      else
      {
        v40 = MEMORY[0x1E0C81028];
        v41 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "ServerManager.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 1341;
        v134 = 2080;
        *(_QWORD *)v135 = "playAlertPattern";
        _os_log_impl(&dword_1A0F4D000, v40, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Request for System Sound pattern playback", buf, 0x1Cu);
      }

LABEL_55:
      v42 = CFGetTypeID(a3);
      if (v42 == CFDictionaryGetTypeID())
      {
        v43 = a3;
        v129 = v34;
        v130 = v35;
        if (v35)
        {
          v44 = (unint64_t *)&v35->__shared_owners_;
          do
            v45 = __ldxr(v44);
          while (__stxr(v45 + 1, v44));
        }
        *(_QWORD *)buf = -1;
        v15 = (*(uint64_t (**)(ClientEntry *, void *, _BYTE *))(*(_QWORD *)v34 + 56))(v34, v43, buf);
        v46 = *(_QWORD *)buf;
        if (v35)
        {
          v47 = (unint64_t *)&v35->__shared_owners_;
          do
            v48 = __ldaxr(v47);
          while (__stlxr(v48 - 1, v47));
          if (!v48)
          {
            ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
            std::__shared_weak_count::__release_weak(v35);
          }
        }

      }
      else
      {
        v129 = v34;
        v130 = v35;
        if (v35)
        {
          v49 = (unint64_t *)&v35->__shared_owners_;
          do
            v50 = __ldxr(v49);
          while (__stxr(v50 + 1, v49));
        }
        *(_QWORD *)buf = -1;
        v15 = ClientEntry::loadAndAddSequence(v34, (NSArray *)a3, (unint64_t *)buf, (double *)v139, v137);
        v46 = *(_QWORD *)buf;
        if (v35)
        {
          v51 = (unint64_t *)&v35->__shared_owners_;
          do
            v52 = __ldaxr(v51);
          while (__stlxr(v52 - 1, v51));
          if (!v52)
          {
            ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
            std::__shared_weak_count::__release_weak(v35);
          }
        }
      }
      if (v15)
        goto LABEL_146;
      std::shared_ptr<PowerUsageWatchdog::Impl>::shared_ptr[abi:ne180100]<PowerUsageWatchdog::Impl,void>(buf, *(_QWORD *)(v118 + 8), *(std::__shared_weak_count **)(v118 + 16));
      v53 = *(_QWORD *)buf;
      v54 = *(std::__shared_weak_count **)&buf[8];
      if (*(_QWORD *)&buf[8])
      {
        v55 = (unint64_t *)(*(_QWORD *)&buf[8] + 16);
        do
          v56 = __ldxr(v55);
        while (__stxr(v56 + 1, v55));
        v57 = (unint64_t *)&v54->__shared_owners_;
        do
          v58 = __ldaxr(v57);
        while (__stlxr(v58 - 1, v57));
        if (!v58)
        {
          ((void (*)(std::__shared_weak_count *))v54->__on_zero_shared)(v54);
          std::__shared_weak_count::__release_weak(v54);
        }
      }
      v59 = (std::__shared_weak_count *)v119;
      v128[0] = v118;
      v128[1] = v119;
      if (v119)
      {
        v60 = (unint64_t *)(v119 + 8);
        do
          v61 = __ldxr(v60);
        while (__stxr(v61 + 1, v60));
      }
      v62 = (uint64_t)v132;
      if (v132)
      {
        if (v132 == v131)
        {
          *(_QWORD *)&v135[4] = buf;
          (*(void (**)(uint64_t, _QWORD *))(v131[0] + 24))((uint64_t)v131, buf);
LABEL_100:
          *(_QWORD *)&v135[12] = v46;
          *(_QWORD *)&v136 = v53;
          *((_QWORD *)&v136 + 1) = v54;
          if (v54)
          {
            p_shared_weak_owners = (unint64_t *)&v54->__shared_weak_owners_;
            do
              v67 = __ldxr(p_shared_weak_owners);
            while (__stxr(v67 + 1, p_shared_weak_owners));
          }
          v138 = 0;
          v68 = operator new(0x40uLL);
          *v68 = &off_1E4514D08;
          std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)(v68 + 1), (uint64_t)buf);
          v68[5] = *(_QWORD *)&v135[12];
          *((_OWORD *)v68 + 3) = v136;
          v136 = 0uLL;
          v138 = (unsigned int *)v68;
          v15 = ServerManager::prepareSequence((uint64_t)v109, v128, v46, (uint64_t)v137);
          v69 = v138;
          if (v138 == v137)
          {
            v70 = 4;
            v69 = v137;
          }
          else
          {
            if (!v138)
              goto LABEL_108;
            v70 = 5;
          }
          (*(void (**)(void))(*(_QWORD *)v69 + 8 * v70))();
LABEL_108:
          if (*((_QWORD *)&v136 + 1))
            std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v136 + 1));
          v71 = *(_QWORD **)&v135[4];
          if (*(_BYTE **)&v135[4] == buf)
          {
            v72 = 4;
            v71 = buf;
          }
          else
          {
            if (!*(_QWORD *)&v135[4])
            {
LABEL_115:
              if (v59)
              {
                v73 = (unint64_t *)&v59->__shared_owners_;
                do
                  v74 = __ldaxr(v73);
                while (__stlxr(v74 - 1, v73));
                if (!v74)
                {
                  ((void (*)(std::__shared_weak_count *))v59->__on_zero_shared)(v59);
                  std::__shared_weak_count::__release_weak(v59);
                }
              }
              if (v15)
              {
LABEL_143:
                if (v54)
                  std::__shared_weak_count::__release_weak(v54);
                if (!v15)
                {
LABEL_154:
                  v86 = v132;
                  if (v132 == v131)
                  {
                    v87 = 4;
                    v86 = v131;
                  }
                  else
                  {
                    if (!v132)
                    {
LABEL_159:
                      v88 = (std::__shared_weak_count *)v119;
                      if (!v119)
                        goto LABEL_163;
                      v89 = (unint64_t *)(v119 + 8);
                      do
                        v90 = __ldaxr(v89);
                      while (__stlxr(v90 - 1, v89));
                      if (!v90)
                      {
                        ((void (*)(std::__shared_weak_count *))v88->__on_zero_shared)(v88);
                        std::__shared_weak_count::__release_weak(v88);
                        if (v15)
                        {
LABEL_164:
                          if (kHSRVScope)
                          {
                            v91 = *(id *)kHSRVScope;
                            if (!v91)
                            {
LABEL_173:
                              v112 = v124;
                              v113 = v125;
                              if (v125)
                              {
                                v93 = (unint64_t *)&v125->__shared_owners_;
                                do
                                  v94 = __ldxr(v93);
                                while (__stxr(v94 + 1, v93));
                              }
                              -[AVHapticServer doStopRunning:audio:haptics:](self, "doStopRunning:audio:haptics:", &v112, 0, 1);
                              v95 = v113;
                              if (v113)
                              {
                                v96 = (unint64_t *)&v113->__shared_owners_;
                                do
                                  v97 = __ldaxr(v96);
                                while (__stlxr(v97 - 1, v96));
                                if (!v97)
                                {
                                  ((void (*)(std::__shared_weak_count *))v95->__on_zero_shared)(v95);
                                  std::__shared_weak_count::__release_weak(v95);
                                }
                              }
                              goto LABEL_181;
                            }
                          }
                          else
                          {
                            v91 = MEMORY[0x1E0C81028];
                            v92 = MEMORY[0x1E0C81028];
                          }
                          if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)buf = 136315650;
                            *(_QWORD *)&buf[4] = "AVHapticServer.mm";
                            *(_WORD *)&buf[12] = 1024;
                            *(_DWORD *)&buf[14] = 1598;
                            v134 = 2080;
                            *(_QWORD *)v135 = "-[AVHapticServer(VibeSynthEngine) playVibePattern:gain:synchronizer:flags:"
                                              "atTime:completionHandler:]";
                            _os_log_impl(&dword_1A0F4D000, v91, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Failed to play SSS pattern.  calling doStopRunning (we are on the ACQ).", buf, 0x1Cu);
                          }

                          goto LABEL_173;
                        }
                      }
                      else
                      {
LABEL_163:
                        if (v15)
                          goto LABEL_164;
                      }
LABEL_181:

                      v98 = v117;
                      if (v117)
                      {
                        v99 = (unint64_t *)&v117->__shared_owners_;
                        do
                          v100 = __ldaxr(v99);
                        while (__stlxr(v100 - 1, v99));
                        if (!v100)
                        {
                          ((void (*)(std::__shared_weak_count *))v98->__on_zero_shared)(v98);
                          std::__shared_weak_count::__release_weak(v98);
                        }
                      }
                      objc_destroyWeak(v116);
                      objc_destroyWeak(&location);
                      goto LABEL_187;
                    }
                    v87 = 5;
                  }
                  (*(void (**)(void))(*v86 + 8 * v87))();
                  goto LABEL_159;
                }
LABEL_146:
                if (kHSEQScope)
                {
                  v84 = *(id *)kHSEQScope;
                  if (!v84)
                  {
LABEL_153:
                    v109[61] = -1;
                    goto LABEL_154;
                  }
                }
                else
                {
                  v84 = MEMORY[0x1E0C81028];
                  v85 = MEMORY[0x1E0C81028];
                }
                if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v139 = 136315906;
                  v140 = "ServerManager.mm";
                  v141 = 1024;
                  v142 = 1387;
                  v143 = 2080;
                  v144 = "playAlertPattern";
                  v145 = 1024;
                  *(_DWORD *)v146 = v15;
                  _os_log_impl(&dword_1A0F4D000, v84, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR %u: System Sound pattern load failed - clearing mLegacyPatternSeqID", v139, 0x22u);
                }

                goto LABEL_153;
              }
              v75 = v118;
              v76 = (std::__shared_weak_count *)v119;
              v126 = v118;
              v127 = v119;
              if (v119)
              {
                v77 = (unint64_t *)(v119 + 8);
                do
                  v78 = __ldxr(v77);
                while (__stxr(v78 + 1, v77));
              }
              if (kHSEQScope)
              {
                if ((*(_BYTE *)(kHSEQScope + 8) & 1) != 0)
                {
                  v79 = *(id *)kHSEQScope;
                  if (v79)
                  {
                    log = v79;
                    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)v139 = 136316162;
                      v140 = "ServerManager.mm";
                      v141 = 1024;
                      v142 = 868;
                      v143 = 2080;
                      v144 = "startAlertSequence";
                      v145 = 1024;
                      *(_DWORD *)v146 = v46;
                      *(_WORD *)&v146[4] = 2048;
                      *(_QWORD *)&v146[6] = v108;
                      _os_log_impl(&dword_1A0F4D000, log, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Asynchronous call to play sequence %u with synchronizer %p", v139, 0x2Cu);
                    }

                  }
                }
              }
              (*(void (**)(uint64_t, uint64_t, uint64_t, SSPlayerSynchronizer *))(*(_QWORD *)v75 + 72))(v75, v46, v8, v108);
              if (v76)
              {
                v80 = (unint64_t *)&v76->__shared_owners_;
                do
                  v81 = __ldaxr(v80);
                while (__stlxr(v81 - 1, v80));
                if (!v81)
                {
                  ((void (*)(std::__shared_weak_count *))v76->__on_zero_shared)(v76);
                  std::__shared_weak_count::__release_weak(v76);
                }
              }
              if (kHSEQScope)
              {
                v82 = *(id *)kHSEQScope;
                if (!v82)
                {
LABEL_142:
                  v109[61] = v46;
                  goto LABEL_143;
                }
              }
              else
              {
                v82 = MEMORY[0x1E0C81028];
                v83 = MEMORY[0x1E0C81028];
              }
              if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v139 = 136315906;
                v140 = "ServerManager.mm";
                v141 = 1024;
                v142 = 1382;
                v143 = 2080;
                v144 = "playAlertPattern";
                v145 = 2048;
                *(_QWORD *)v146 = v46;
                _os_log_impl(&dword_1A0F4D000, v82, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Setting mLegacyPatternSeqID to %lu", v139, 0x26u);
              }

              goto LABEL_142;
            }
            v72 = 5;
          }
          (*(void (**)(void))(*v71 + 8 * v72))();
          goto LABEL_115;
        }
        v62 = (*(uint64_t (**)(void))(*v132 + 16))();
      }
      *(_QWORD *)&v135[4] = v62;
      goto LABEL_100;
    }
  }
  else
  {
LABEL_17:
    if (!started)
      goto LABEL_27;
  }
  if (v15 == 1634497134)
    goto LABEL_27;
  if (v15 != 1651864441)
  {
    if (kHSRVScope)
    {
      v26 = *(id *)kHSRVScope;
      if (!v26)
      {
LABEL_96:
        objc_initWeak((id *)buf, self);
        v110[0] = MEMORY[0x1E0C809B0];
        v110[1] = 3221225472;
        v110[2] = __100__AVHapticServer_VibeSynthEngine__playVibePattern_gain_synchronizer_flags_atTime_completionHandler___block_invoke_281;
        v110[3] = &unk_1E450C8E8;
        objc_copyWeak(&v111, (id *)buf);
        if (AudioControlQueue(void)::once != -1)
          dispatch_once(&AudioControlQueue(void)::once, &__block_literal_global_5);
        v65 = (id)AudioControlQueue(void)::gAudioControlQueue;
        AT::DispatchBlock(v65, v110, 1, (uint64_t)"-[AVHapticServer(VibeSynthEngine) playVibePattern:gain:synchronizer:flags:atTime:completionHandler:]", (uint64_t)"AVHapticServer.mm", 1611);

        objc_destroyWeak(&v111);
        objc_destroyWeak((id *)buf);
        goto LABEL_187;
      }
    }
    else
    {
      v26 = MEMORY[0x1E0C81028];
      v64 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "AVHapticServer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1607;
      v134 = 2080;
      *(_QWORD *)v135 = "-[AVHapticServer(VibeSynthEngine) playVibePattern:gain:synchronizer:flags:atTime:completionHandler:]";
      *(_WORD *)&v135[8] = 1024;
      *(_DWORD *)&v135[10] = v15;
      _os_log_impl(&dword_1A0F4D000, v26, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Call to start SSS haptic returned status %d", buf, 0x22u);
    }

    goto LABEL_96;
  }
  v15 = 1651864441;
  if (kHSRVScope)
  {
    v25 = *(id *)kHSRVScope;
    if (!v25)
      goto LABEL_187;
  }
  else
  {
    v25 = MEMORY[0x1E0C81028];
    v63 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "AVHapticServer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1604;
    v134 = 2080;
    *(_QWORD *)v135 = "-[AVHapticServer(VibeSynthEngine) playVibePattern:gain:synchronizer:flags:atTime:completionHandler:]";
    _os_log_impl(&dword_1A0F4D000, v25, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: WARNING: Call to start SSS haptic returned BUSY", buf, 0x1Cu);
  }

LABEL_187:
  if (kHSRVScope)
  {
    v101 = *(id *)kHSRVScope;
    if (!v101)
      goto LABEL_194;
  }
  else
  {
    v101 = MEMORY[0x1E0C81028];
    v102 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "AVHapticServer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1618;
    v134 = 2080;
    *(_QWORD *)v135 = "-[AVHapticServer(VibeSynthEngine) playVibePattern:gain:synchronizer:flags:atTime:completionHandler:]";
    *(_WORD *)&v135[8] = 1024;
    *(_DWORD *)&v135[10] = v15;
    _os_log_impl(&dword_1A0F4D000, v101, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Finished request to play SSS pattern: result %d", buf, 0x22u);
  }

LABEL_194:
  v103 = v125;
  if (v125)
  {
    v104 = (unint64_t *)&v125->__shared_owners_;
    do
      v105 = __ldaxr(v104);
    while (__stlxr(v105 - 1, v104));
    if (!v105)
    {
      ((void (*)(std::__shared_weak_count *))v103->__on_zero_shared)(v103);
      std::__shared_weak_count::__release_weak(v103);
    }
  }

  return v15;
}

- (int)cancelPatternWithOptions:(__CFDictionary *)a3
{
  NSObject *v5;
  id v6;
  uint64_t v7;
  _QWORD *manager;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t Bool;
  unint64_t *v16;
  unint64_t v17;
  NSObject *v18;
  id v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t v24;
  std::__shared_weak_count *v25;
  BOOL v26;
  _BYTE buf[12];
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (kHSRVScope)
  {
    v5 = *(id *)kHSRVScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "AVHapticServer.mm";
    v28 = 1024;
    v29 = 1624;
    v30 = 2080;
    v31 = "-[AVHapticServer(VibeSynthEngine) cancelPatternWithOptions:]";
    _os_log_impl(&dword_1A0F4D000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Cancelling vibe pattern on SSS client", buf, 0x1Cu);
  }

LABEL_8:
  ServerManager::entryForID((ServerManager *)&v24, (uint64_t)self->_manager, self->_SSSClientID);
  v7 = v24;
  if (!v24)
  {
    v13 = -4810;
    goto LABEL_25;
  }
  manager = self->_manager;
  v9 = v25;
  if (v25)
  {
    p_shared_owners = (unint64_t *)&v25->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }
  if (!kHSRVScope)
  {
    v12 = MEMORY[0x1E0C81028];
    v14 = MEMORY[0x1E0C81028];
    goto LABEL_17;
  }
  v12 = *(id *)kHSRVScope;
  if (v12)
  {
LABEL_17:
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "ServerManager.mm";
      v28 = 1024;
      v29 = 1401;
      v30 = 2080;
      v31 = "cancelAlertPattern";
      _os_log_impl(&dword_1A0F4D000, v12, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Cancelling System Sound pattern playback", buf, 0x1Cu);
    }

  }
  *(_QWORD *)buf = a3;
  *(_WORD *)&buf[8] = 0;
  v26 = 0;
  Bool = CACFDictionary::GetBool((CACFDictionary *)buf, CFSTR("CancelAtLoopEnd"), &v26);
  v26 = Bool;
  v13 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)v7 + 80))(v7, manager[61], Bool);
  CACFDictionary::~CACFDictionary((CACFDictionary *)buf);
  if (v9)
  {
    v16 = (unint64_t *)&v9->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
LABEL_25:
  if (kHSRVScope)
  {
    v18 = *(id *)kHSRVScope;
    if (!v18)
      goto LABEL_32;
  }
  else
  {
    v18 = MEMORY[0x1E0C81028];
    v19 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "AVHapticServer.mm";
    v28 = 1024;
    v29 = 1633;
    v30 = 2080;
    v31 = "-[AVHapticServer(VibeSynthEngine) cancelPatternWithOptions:]";
    _os_log_impl(&dword_1A0F4D000, v18, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Done cancelling vibe pattern", buf, 0x1Cu);
  }

LABEL_32:
  v20 = v25;
  if (v25)
  {
    v21 = (unint64_t *)&v25->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  return v13;
}

void __100__AVHapticServer_VibeSynthEngine__playVibePattern_gain_synchronizer_flags_atTime_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  id v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13[2];
  std::__shared_weak_count *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (kHSRVScope)
  {
    v2 = *(id *)kHSRVScope;
    if (!v2)
      goto LABEL_8;
  }
  else
  {
    v2 = MEMORY[0x1E0C81028];
    v3 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "AVHapticServer.mm";
    v17 = 1024;
    v18 = 1585;
    v19 = 2080;
    v20 = "-[AVHapticServer(VibeSynthEngine) playVibePattern:gain:synchronizer:flags:atTime:completionHandler:]_block_invoke";
    _os_log_impl(&dword_1A0F4D000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: SSS pattern completion callback: Calling doStopRunning and client completion handler ASYNCH on ACQ", buf, 0x1Cu);
  }

LABEL_8:
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3321888768;
  v11[2] = __100__AVHapticServer_VibeSynthEngine__playVibePattern_gain_synchronizer_flags_atTime_completionHandler___block_invoke_280;
  v11[3] = &unk_1E450C8B0;
  objc_copyWeak(v13, (id *)(a1 + 40));
  v4 = *(std::__shared_weak_count **)(a1 + 56);
  v13[1] = *(id *)(a1 + 48);
  v14 = v4;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  v12 = *(id *)(a1 + 32);
  if (AudioControlQueue(void)::once != -1)
    dispatch_once(&AudioControlQueue(void)::once, &__block_literal_global_5);
  v7 = (id)AudioControlQueue(void)::gAudioControlQueue;
  AT::DispatchBlock(v7, v11, 1, (uint64_t)"-[AVHapticServer(VibeSynthEngine) playVibePattern:gain:synchronizer:flags:atTime:completionHandler:]_block_invoke", (uint64_t)"AVHapticServer.mm", 1594);

  v8 = v14;
  if (v14)
  {
    v9 = (unint64_t *)&v14->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  objc_destroyWeak(v13);
}

void __100__AVHapticServer_VibeSynthEngine__playVibePattern_gain_synchronizer_flags_atTime_completionHandler___block_invoke_281(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "checkRunningCountAndStopSynth");

}

void __100__AVHapticServer_VibeSynthEngine__playVibePattern_gain_synchronizer_flags_atTime_completionHandler___block_invoke_280(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  v4 = *(std::__shared_weak_count **)(a1 + 56);
  v16 = *(_QWORD *)(a1 + 48);
  v17 = v4;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  objc_msgSend(WeakRetained, "doStopRunning:audio:haptics:", &v16, 0, 1);
  v7 = v17;
  if (v17)
  {
    v8 = (unint64_t *)&v17->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

  if (kHSRVScope)
  {
    v10 = *(id *)kHSRVScope;
    if (!v10)
      goto LABEL_16;
  }
  else
  {
    v10 = (id)MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }
  v12 = v10;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = _Block_copy(*(const void **)(a1 + 32));
    *(_DWORD *)buf = 136315906;
    v19 = "AVHapticServer.mm";
    v20 = 1024;
    v21 = 1591;
    v22 = 2080;
    v23 = "-[AVHapticServer(VibeSynthEngine) playVibePattern:gain:synchronizer:flags:atTime:completionHandler:]_block_invoke";
    v24 = 2048;
    v25 = v13;
    _os_log_impl(&dword_1A0F4D000, v12, OS_LOG_TYPE_INFO, "%25s:%-5d %s: SSS pattern completion callback: Calling external client's completion handler block %p", buf, 0x26u);

  }
LABEL_16:
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
  if (kHSRVScope)
  {
    if ((*(_BYTE *)(kHSRVScope + 8) & 1) != 0)
    {
      v14 = *(id *)kHSRVScope;
      if (v14)
      {
        v15 = v14;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v19 = "AVHapticServer.mm";
          v20 = 1024;
          v21 = 1593;
          v22 = 2080;
          v23 = "-[AVHapticServer(VibeSynthEngine) playVibePattern:gain:synchronizer:flags:atTime:completionHandler:]_block_invoke";
          _os_log_impl(&dword_1A0F4D000, v15, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: SSS pattern completion callback: Returned from external clients completion handler", buf, 0x1Cu);
        }

      }
    }
  }
}

@end
