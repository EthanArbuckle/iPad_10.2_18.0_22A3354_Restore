@implementation DSP_HALBypass_IOProcessor

- (DSP_HALBypass_IOProcessor)init
{
  DSP_HALBypass_IOProcessor *v2;
  DSP_HALBypass_IOProcessor *v3;
  HAL_DSP_HostCallbacks *hostCallbacks;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DSP_HALBypass_IOProcessor;
  v2 = -[DSP_HALBypass_IOProcessor init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    hostCallbacks = v2->_hostCallbacks;
    v2->_dspCallbacks = 0;
    v2->_hostCallbacks = 0;

  }
  return v3;
}

- (void)dealloc
{
  void *dspCallbacks;
  HAL_DSP_HostCallbacks *hostCallbacks;
  objc_super v5;

  dspCallbacks = self->_dspCallbacks;
  if (dspCallbacks)
  {
    (*(void (**)(void *, SEL))(*(_QWORD *)dspCallbacks + 8))(dspCallbacks, a2);
    self->_dspCallbacks = 0;
  }
  hostCallbacks = self->_hostCallbacks;
  self->_hostCallbacks = 0;

  v5.receiver = self;
  v5.super_class = (Class)DSP_HALBypass_IOProcessor;
  -[DSP_HALBypass_IOProcessor dealloc](&v5, sel_dealloc);
}

- (id)getProcessorPropertySet
{
  return 0;
}

- (id)simulateConfigurationChange:(id)a3 error:(id *)a4
{
  return objc_alloc_init(MEMORY[0x1E0C99D88]);
}

- (id)negotiateConfigurationChange:(id)a3 error:(id *)a4
{
  return objc_alloc_init(MEMORY[0x1E0C99D88]);
}

- (id)adaptToConfigurationChange:(id)a3 withCallbacks:(void *)a4 error:(id *)a5
{
  id v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  unsigned __int8 v11;
  NSObject *v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  AMCP::Log::Scope_Registry *v19;
  NSObject *v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  id v24;
  id v25;
  void *v26;
  _opaque_pthread_t *v28;
  mach_port_t v29;
  _opaque_pthread_t *v30;
  mach_port_t v31;
  id v32;
  CFTypeRef cf;
  CFTypeRef Mutable;
  uint8_t buf[8];
  _BYTE v36[10];
  __int16 v37;
  int v38;
  _DWORD v39[5];
  char v40;
  void *__p;
  void *v42;
  uint8_t v43[8];
  _BYTE v44[10];
  __int16 v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[4];

  v50[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = -[DSP_HALBypass_IOProcessor dspCallbacks](self, "dspCallbacks");
  v10 = v9;
  if (v9)
  {
    v11 = atomic_load(v9 + 316);
    if ((v11 & 1) != 0)
    {
      AMCP::Log::Scope_Registry::get((AMCP::Log::Scope_Registry *)v9);
      AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)v43, "com.apple.coreaudio", "AMCP");
      v12 = **(NSObject ***)v43;
      AMCP::Log::Scope::get_os_log_t(**(id **)v43);
      objc_claimAutoreleasedReturnValue();
      v13 = *(std::__shared_weak_count **)v44;
      if (*(_QWORD *)v44)
      {
        v14 = (unint64_t *)(*(_QWORD *)v44 + 8);
        do
          v15 = __ldaxr(v14);
        while (__stlxr(v15 - 1, v14));
        if (!v15)
        {
          ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
          std::__shared_weak_count::__release_weak(v13);
        }
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v30 = pthread_self();
        v31 = pthread_mach_thread_np(v30);
        *(_DWORD *)v43 = 67109634;
        *(_DWORD *)&v43[4] = v31;
        *(_WORD *)v44 = 2080;
        *(_QWORD *)&v44[2] = "DSP_HAL_Bypass.mm";
        v45 = 1024;
        v46 = 84;
        _os_log_debug_impl(&dword_1B57BA000, v12, OS_LOG_TYPE_DEBUG, "%6u %32s:%-5d [hal_dsp] DSP HAL Bypass adaptToConfigurationChange - existing callbacks are still registered.", v43, 0x18u);
      }

    }
    (*(void (**)(unsigned __int8 *))(*(_QWORD *)v10 + 8))(v10);
    -[DSP_HALBypass_IOProcessor setDspCallbacks:](self, "setDspCallbacks:", 0);
  }
  v16 = operator new();
  DSP_HAL_BypassCallbacks::DSP_HAL_BypassCallbacks(v16, a4);
  DSP_Host_Types::ConfigurationChangeRequest::ConfigurationChangeRequest((DSP_Host_Types::ConfigurationChangeRequest *)v43);
  *(_QWORD *)v43 = &off_1E699A370;
  v17 = v8;
  v18 = v17;
  if (v17)
    CFRetain(v17);
  applesauce::CF::DictionaryRef::DictionaryRef((applesauce::CF::DictionaryRef *)&cf, v18);

  (*(void (**)(DSP_Host_Types::ConfigurationChangeRequest *, CFDictionaryRef *))(*(_QWORD *)v43 + 32))((DSP_Host_Types::ConfigurationChangeRequest *)v43, (CFDictionaryRef *)&cf);
  if (cf)
    CFRelease(cf);
  v19 = (AMCP::Log::Scope_Registry *)(*(uint64_t (**)(uint64_t, uint8_t *))(*(_QWORD *)v16 + 16))(v16, v43);
  if ((v19 & 1) == 0)
  {
    AMCP::Log::Scope_Registry::get(v19);
    AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)buf, "com.apple.coreaudio", "AMCP");
    v20 = **(NSObject ***)buf;
    AMCP::Log::Scope::get_os_log_t(**(id **)buf);
    objc_claimAutoreleasedReturnValue();
    v21 = *(std::__shared_weak_count **)v36;
    if (*(_QWORD *)v36)
    {
      v22 = (unint64_t *)(*(_QWORD *)v36 + 8);
      do
        v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v28 = pthread_self();
      v29 = pthread_mach_thread_np(v28);
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = v29;
      *(_WORD *)v36 = 2080;
      *(_QWORD *)&v36[2] = "DSP_HAL_Bypass.mm";
      v37 = 1024;
      v38 = 97;
      _os_log_debug_impl(&dword_1B57BA000, v20, OS_LOG_TYPE_DEBUG, "%6u %32s:%-5d DSP HAL Bypass adaptToConfigurationChange - WARNING: the expected format is not compatible.", buf, 0x18u);
    }

    if (a5)
    {
      v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
      *a5 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 1, 0);
    }
  }
  -[DSP_HALBypass_IOProcessor setDspCallbacks:](self, "setDspCallbacks:", v16);
  DSP_Host_Types::AdaptResponse::AdaptResponse((DSP_Host_Types::AdaptResponse *)buf);
  v39[4] = 0;
  v40 = 1;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B398], MEMORY[0x1E0C9B3A8]);
  (*(void (**)(uint8_t *, CFTypeRef *))(*(_QWORD *)buf + 24))(buf, &Mutable);
  mcp_applesauce::CF::Dictionary_Builder::get_dictionary((applesauce::CF::DictionaryRef *)&v32, Mutable);
  if (Mutable)
    CFRelease(Mutable);
  v25 = v32;
  v26 = v25;
  if (v25)
    CFRelease(v25);
  *(_QWORD *)buf = &off_1E699E8B8;
  if (__p)
  {
    v42 = __p;
    operator delete(__p);
  }
  DSP_Dictionariable::DictionariableKvp::~DictionariableKvp((DSP_Dictionariable::DictionariableKvp *)v39);
  *(_QWORD *)buf = off_1E699E8F8;
  std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)v36);
  *(_QWORD *)v43 = &off_1E699D0D8;
  *(_QWORD *)buf = v50;
  std::vector<std::shared_ptr<unsigned long long>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  DSP_Host_Types::IOContextDescription::~IOContextDescription((DSP_Host_Types::IOContextDescription *)&v49);
  DSP_Dictionariable::DictionariableKvp::~DictionariableKvp((DSP_Dictionariable::DictionariableKvp *)&v48);
  DSP_Dictionariable::DictionariableKvp::~DictionariableKvp((DSP_Dictionariable::DictionariableKvp *)&v47);
  *(_QWORD *)v43 = off_1E699D128;
  std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)v44);

  return v26;
}

- (void)dspCallbacks
{
  return self->_dspCallbacks;
}

- (void)setDspCallbacks:(void *)a3
{
  self->_dspCallbacks = a3;
}

- (HAL_DSP_HostCallbacks)hostCallbacks
{
  return self->_hostCallbacks;
}

- (void)setHostCallbacks:(id)a3
{
  objc_storeStrong((id *)&self->_hostCallbacks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostCallbacks, 0);
}

@end
