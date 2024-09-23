@implementation DSP_ADM

- (DSP_ADM)init
{
  DSP_ADM *v2;
  DSP_ADM *v3;
  NSObject *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  _opaque_pthread_t *v8;
  mach_port_t v9;
  void *v10;
  char *v11;
  NSObject *v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  _opaque_pthread_t *v17;
  mach_port_t v18;
  objc_super v19;
  uint8_t buf[8];
  _BYTE v21[10];
  __int16 v22;
  int v23;
  __int16 v24;
  char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)DSP_ADM;
  v2 = -[DSP_ADM init](&v19, sel_init);
  v3 = v2;
  if (v2)
  {
    AMCP::Log::Scope_Registry::get((AMCP::Log::Scope_Registry *)v2);
    AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)buf, "com.apple.coreaudio", "AMCP");
    v4 = **(NSObject ***)buf;
    AMCP::Log::Scope::get_os_log_t(**(id **)buf);
    objc_claimAutoreleasedReturnValue();
    v5 = *(std::__shared_weak_count **)v21;
    if (*(_QWORD *)v21)
    {
      v6 = (unint64_t *)(*(_QWORD *)v21 + 8);
      do
        v7 = __ldaxr(v6);
      while (__stlxr(v7 - 1, v6));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v8 = pthread_self();
      v9 = pthread_mach_thread_np(v8);
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = v9;
      *(_WORD *)v21 = 2080;
      *(_QWORD *)&v21[2] = "DSP_ADM.mm";
      v22 = 1024;
      v23 = 22;
      _os_log_impl(&dword_1B57BA000, v4, OS_LOG_TYPE_INFO, "%6u %32s:%-5d [hal_dsp] Calling dlopen() on ADM.", buf, 0x18u);
    }

    v10 = dlopen("/System/Library/PrivateFrameworks/AudioDSPManager.framework/AudioDSPManager", 1);
    v3->_admLibrary = v10;
    if (!v10)
    {
      v11 = dlerror();
      AMCP::Log::Scope_Registry::get((AMCP::Log::Scope_Registry *)v11);
      AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)buf, "com.apple.coreaudio", "AMCP");
      v12 = **(NSObject ***)buf;
      AMCP::Log::Scope::get_os_log_t(**(id **)buf);
      objc_claimAutoreleasedReturnValue();
      v13 = *(std::__shared_weak_count **)v21;
      if (*(_QWORD *)v21)
      {
        v14 = (unint64_t *)(*(_QWORD *)v21 + 8);
        do
          v15 = __ldaxr(v14);
        while (__stlxr(v15 - 1, v14));
        if (!v15)
        {
          ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
          std::__shared_weak_count::__release_weak(v13);
        }
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v17 = pthread_self();
        v18 = pthread_mach_thread_np(v17);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&buf[4] = v18;
        *(_WORD *)v21 = 2080;
        *(_QWORD *)&v21[2] = "DSP_ADM.mm";
        v22 = 1024;
        v23 = 28;
        v24 = 2080;
        v25 = v11;
        _os_log_error_impl(&dword_1B57BA000, v12, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d [hal_dsp] ADM dlopen() failed: %s", buf, 0x22u);
      }

    }
  }
  return v3;
}

- (void)dealloc
{
  NSObject *v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  _opaque_pthread_t *v7;
  mach_port_t v8;
  objc_super v9;
  uint8_t buf[8];
  _BYTE v11[10];
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_admLibrary)
  {
    AMCP::Log::Scope_Registry::get((AMCP::Log::Scope_Registry *)self);
    AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)buf, "com.apple.coreaudio", "AMCP");
    v3 = **(NSObject ***)buf;
    AMCP::Log::Scope::get_os_log_t(**(id **)buf);
    objc_claimAutoreleasedReturnValue();
    v4 = *(std::__shared_weak_count **)v11;
    if (*(_QWORD *)v11)
    {
      v5 = (unint64_t *)(*(_QWORD *)v11 + 8);
      do
        v6 = __ldaxr(v5);
      while (__stlxr(v6 - 1, v5));
      if (!v6)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v7 = pthread_self();
      v8 = pthread_mach_thread_np(v7);
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = v8;
      *(_WORD *)v11 = 2080;
      *(_QWORD *)&v11[2] = "DSP_ADM.mm";
      v12 = 1024;
      v13 = 38;
      _os_log_impl(&dword_1B57BA000, v3, OS_LOG_TYPE_INFO, "%6u %32s:%-5d [hal_dsp] Calling dlclose() on ADM.", buf, 0x18u);
    }

    dlclose(self->_admLibrary);
    self->_admLibrary = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)DSP_ADM;
  -[DSP_ADM dealloc](&v9, sel_dealloc);
}

- (id)createFactory
{
  AMCP::Log::Scope_Registry *v3;
  NSObject *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  _opaque_pthread_t *v8;
  mach_port_t v9;
  void (*v10)(void);
  void *v11;
  NSObject *v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  char *v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  _opaque_pthread_t *v21;
  mach_port_t v22;
  _opaque_pthread_t *v23;
  mach_port_t v24;
  id *v25;
  _BYTE v26[10];
  __int16 v27;
  int v28;
  __int16 v29;
  char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = -[DSP_ADM admLibrary](self, "admLibrary");
  if (!v3)
  {
    AMCP::Log::Scope_Registry::get(0);
    AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v25, "com.apple.coreaudio", "AMCP");
    v12 = *v25;
    AMCP::Log::Scope::get_os_log_t(*v25);
    objc_claimAutoreleasedReturnValue();
    v13 = *(std::__shared_weak_count **)v26;
    if (*(_QWORD *)v26)
    {
      v14 = (unint64_t *)(*(_QWORD *)v26 + 8);
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v21 = pthread_self();
      v22 = pthread_mach_thread_np(v21);
      LODWORD(v25) = 67109634;
      HIDWORD(v25) = v22;
      *(_WORD *)v26 = 2080;
      *(_QWORD *)&v26[2] = "DSP_ADM.mm";
      v27 = 1024;
      v28 = 48;
      _os_log_error_impl(&dword_1B57BA000, v12, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d [hal_dsp] ADM library unavailable.  Cannot call createFactory.", (uint8_t *)&v25, 0x18u);
    }
    goto LABEL_26;
  }
  AMCP::Log::Scope_Registry::get(v3);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v25, "com.apple.coreaudio", "AMCP");
  v4 = *v25;
  AMCP::Log::Scope::get_os_log_t(*v25);
  objc_claimAutoreleasedReturnValue();
  v5 = *(std::__shared_weak_count **)v26;
  if (*(_QWORD *)v26)
  {
    v6 = (unint64_t *)(*(_QWORD *)v26 + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v8 = pthread_self();
    v9 = pthread_mach_thread_np(v8);
    LODWORD(v25) = 67109634;
    HIDWORD(v25) = v9;
    *(_WORD *)v26 = 2080;
    *(_QWORD *)&v26[2] = "DSP_ADM.mm";
    v27 = 1024;
    v28 = 52;
    _os_log_impl(&dword_1B57BA000, v4, OS_LOG_TYPE_INFO, "%6u %32s:%-5d [hal_dsp] Calling dlsym() on ADM.", (uint8_t *)&v25, 0x18u);
  }

  v10 = (void (*)(void))dlsym(-[DSP_ADM admLibrary](self, "admLibrary"), "CreateAudioDSPManager");
  if (!v10)
  {
    v16 = dlerror();
    AMCP::Log::Scope_Registry::get((AMCP::Log::Scope_Registry *)v16);
    AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v25, "com.apple.coreaudio", "AMCP");
    v12 = *v25;
    AMCP::Log::Scope::get_os_log_t(*v25);
    objc_claimAutoreleasedReturnValue();
    v17 = *(std::__shared_weak_count **)v26;
    if (*(_QWORD *)v26)
    {
      v18 = (unint64_t *)(*(_QWORD *)v26 + 8);
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v23 = pthread_self();
      v24 = pthread_mach_thread_np(v23);
      LODWORD(v25) = 67109890;
      HIDWORD(v25) = v24;
      *(_WORD *)v26 = 2080;
      *(_QWORD *)&v26[2] = "DSP_ADM.mm";
      v27 = 1024;
      v28 = 58;
      v29 = 2080;
      v30 = v16;
      _os_log_error_impl(&dword_1B57BA000, v12, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d [hal_dsp] ADM dlsym failed: %s", (uint8_t *)&v25, 0x22u);
    }
LABEL_26:

    v11 = 0;
    return v11;
  }
  v10();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  return v11;
}

- (void)admLibrary
{
  return self->_admLibrary;
}

- (void)setAdmLibrary:(void *)a3
{
  self->_admLibrary = a3;
}

@end
