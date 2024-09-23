@implementation DSP_HAL_Mock_PropertySet

- (DSP_HAL_Mock_PropertySet)init
{
  DSP_HAL_Mock_PropertySet *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DSP_HAL_Mock_PropertySet;
  result = -[DSP_HAL_Mock_PropertySet init](&v3, sel_init);
  if (result)
  {
    result->_propAvailableOffloadsInput = 0;
    result->_propVoiceActivityState = 0;
    result->_propDSPGraphParam = 0;
  }
  return result;
}

- (void)dealloc
{
  DSP_HAL_Mock_Property *propVoiceActivityState;
  DSP_HAL_Mock_Property *propAvailableOffloadsInput;
  DSP_HAL_Mock_Property *propDSPGraphParam;
  objc_super v6;

  propVoiceActivityState = self->_propVoiceActivityState;
  if (propVoiceActivityState)
  {
    (*((void (**)(DSP_HAL_Mock_Property *, SEL))propVoiceActivityState->var0 + 1))(propVoiceActivityState, a2);
    self->_propVoiceActivityState = 0;
  }
  propAvailableOffloadsInput = self->_propAvailableOffloadsInput;
  if (propAvailableOffloadsInput)
  {
    (*((void (**)(DSP_HAL_Mock_Property *, SEL))propAvailableOffloadsInput->var0 + 1))(propAvailableOffloadsInput, a2);
    self->_propAvailableOffloadsInput = 0;
  }
  propDSPGraphParam = self->_propDSPGraphParam;
  if (propDSPGraphParam)
  {
    (*((void (**)(DSP_HAL_Mock_Property *, SEL))propDSPGraphParam->var0 + 1))(propDSPGraphParam, a2);
    self->_propDSPGraphParam = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)DSP_HAL_Mock_PropertySet;
  -[DSP_HAL_Mock_PropertySet dealloc](&v6, sel_dealloc);
}

- (void)configureForProcessor:(function<void (unsigned)int
{
  DSP_HAL_Mock_Property *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _BYTE v14[24];
  _BYTE *v15;
  _QWORD v16[3];
  _QWORD *v17;
  _BYTE v18[24];
  _BYTE *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!-[DSP_HAL_Mock_PropertySet propVoiceActivityState](self, "propVoiceActivityState"))
  {
    v7 = operator new();
    std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)v16, (uint64_t)a3);
    *(_QWORD *)v7 = &off_1E6970388;
    v8 = (uint64_t)v17;
    if (v17)
    {
      if (v17 == v16)
      {
        *(_QWORD *)(v7 + 32) = v7 + 8;
        (*(void (**)(_QWORD *, uint64_t))(v16[0] + 24))(v16, v7 + 8);
LABEL_13:
        *(_QWORD *)(v7 + 40) = 0;
        *(_QWORD *)(v7 + 48) = 1018212795;
        *(_OWORD *)(v7 + 56) = 0u;
        *(_OWORD *)(v7 + 72) = 0u;
        *(_QWORD *)(v7 + 88) = 0;
        *(_QWORD *)(v7 + 96) = 850045863;
        *(_OWORD *)(v7 + 104) = 0u;
        *(_OWORD *)(v7 + 120) = 0u;
        *(_OWORD *)(v7 + 136) = 0u;
        *(_QWORD *)(v7 + 152) = 0;
        *(_QWORD *)(v7 + 160) = 0x696E707476416453;
        *(_DWORD *)(v7 + 168) = 0;
        *(_BYTE *)(v7 + 172) = 1;
        *(_OWORD *)(v7 + 176) = xmmword_1B5D68B50;
        *(_QWORD *)(v7 + 176) = std::chrono::steady_clock::now().__d_.__rep_ - 1000000 * *(_QWORD *)(v7 + 184);
        v11 = (uint64_t)v17;
        if (v17)
        {
          if (v17 == v16)
          {
            v19 = v18;
            (*(void (**)(_QWORD *, _BYTE *))(v16[0] + 24))(v16, v18);
LABEL_18:
            DSP_TemplatedProperty<1983997011u,1768845428u,unsigned int>::setNotifyCallback((_QWORD *)v7, (uint64_t)v18);
            v12 = v19;
            if (v19 == v18)
            {
              v13 = 4;
              v12 = v18;
            }
            else
            {
              if (!v19)
                goto LABEL_23;
              v13 = 5;
            }
            (*(void (**)(void))(*v12 + 8 * v13))();
LABEL_23:
            -[DSP_HAL_Mock_PropertySet setPropVoiceActivityState:](self, "setPropVoiceActivityState:", v7);
            v9 = v17;
            if (v17 == v16)
            {
              v10 = 4;
              v9 = v16;
              goto LABEL_27;
            }
            goto LABEL_24;
          }
          v11 = (*(uint64_t (**)(void))(*v17 + 16))();
        }
        v19 = (_BYTE *)v11;
        goto LABEL_18;
      }
      v8 = (*(uint64_t (**)(void))(*v17 + 16))();
    }
    *(_QWORD *)(v7 + 32) = v8;
    goto LABEL_13;
  }
  if (!a3->var0.var1)
    return;
  v5 = -[DSP_HAL_Mock_PropertySet propVoiceActivityState](self, "propVoiceActivityState");
  if (v5)
  else
    v6 = 0;
  std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)v14, (uint64_t)a3);
  DSP_TemplatedProperty<1983997011u,1768845428u,unsigned int>::setNotifyCallback(v6, (uint64_t)v14);
  v9 = v15;
  if (v15 == v14)
  {
    v10 = 4;
    v9 = v14;
    goto LABEL_27;
  }
LABEL_24:
  if (!v9)
    return;
  v10 = 5;
LABEL_27:
  (*(void (**)(void))(*v9 + 8 * v10))();
}

- (void)toggleVoiceActivityAndNotify
{
  DSP_HAL_Mock_Property *v3;
  char *v4;
  char *v5;
  void (*v6)(void);
  unsigned int *v7;
  unsigned int v8;
  int v9;
  _QWORD *v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int *v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  uint64_t v19;
  int v20;
  _BOOL4 v21;
  _QWORD v22[3];
  _QWORD *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = -[DSP_HAL_Mock_PropertySet propVoiceActivityState](self, "propVoiceActivityState");
  if (!v3)
    return;
  if (!v4)
    return;
  v5 = v4;
  -[DSP_HAL_Mock_PropertySet propertyUpdater](self, "propertyUpdater");
  if (v23 == v22)
  {
    v6 = *(void (**)(void))(v22[0] + 32);
  }
  else
  {
    if (!v23)
    {
      if ((double)(std::chrono::steady_clock::now().__d_.__rep_ - *((_QWORD *)v5 + 22)) / 1000000000.0 * 1000.0 <= (double)*((uint64_t *)v5 + 23))
        return;
      *((std::chrono::steady_clock::time_point *)v5 + 22) = std::chrono::steady_clock::now();
      v15 = (unsigned int *)(v5 + 168);
      v16 = atomic_load((unsigned int *)v5 + 42);
      v17 = v16 == 0;
      do
        v18 = __ldaxr(v15);
      while (__stlxr(v17, v15));
      if (v18 == v17)
        return;
LABEL_21:
      std::condition_variable::notify_one((std::condition_variable *)v5 + 1);
      return;
    }
    v6 = *(void (**)(void))(*v23 + 40);
  }
  v6();
  -[DSP_HAL_Mock_PropertySet propertyUpdater](self, "propertyUpdater");
  v19 = 1983997011;
  v7 = (unsigned int *)(v5 + 168);
  v8 = atomic_load((unsigned int *)v5 + 42);
  v20 = 0;
  v21 = v8 != 0;
  if (!v23)
    std::__throw_bad_function_call[abi:ne180100]();
  v9 = (*(uint64_t (**)(_QWORD *, uint64_t *, _BOOL4 *))(*v23 + 48))(v23, &v19, &v21);
  v10 = v23;
  if (v23 == v22)
  {
    v11 = 4;
    v10 = v22;
    goto LABEL_12;
  }
  if (v23)
  {
    v11 = 5;
LABEL_12:
    (*(void (**)(void))(*v10 + 8 * v11))();
  }
  v12 = v9 != 0;
  v13 = atomic_load(v7);
  if (v13 != v12)
  {
    do
      v14 = __ldaxr(v7);
    while (__stlxr(v12, v7));
    if (v14 != v12)
      goto LABEL_21;
  }
}

- (unsigned)getVoiceActivityState
{
  DSP_HAL_Mock_Property *v2;
  unsigned int v3;

  v2 = -[DSP_HAL_Mock_PropertySet propVoiceActivityState](self, "propVoiceActivityState");
  if (v2)
  {
    if (v2)
    {
      v3 = atomic_load((unsigned int *)&v2[21]);
      LODWORD(v2) = v3 != 0;
    }
  }
  return v2;
}

- (void)configureForFeatureFlag:(int)a3
{
  uint64_t v5;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v7;
  CFTypeRef v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  CFTypeRef cf;
  CFTypeRef v16[3];
  _BYTE v17[24];
  _BYTE *v18;
  _BYTE v19[24];
  _BYTE *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((~a3 & 0x101) == 0 && !-[DSP_HAL_Mock_PropertySet propAvailableOffloadsInput](self, "propAvailableOffloadsInput"))
  {
    v5 = operator new();
    *(_QWORD *)v5 = &off_1E69703C8;
    *(_QWORD *)(v5 + 32) = 0;
    *(_QWORD *)(v5 + 40) = 0;
    *(_QWORD *)(v5 + 48) = 1018212795;
    *(_OWORD *)(v5 + 56) = 0u;
    *(_OWORD *)(v5 + 72) = 0u;
    *(_QWORD *)(v5 + 88) = 0;
    *(_QWORD *)(v5 + 96) = 850045863;
    *(_OWORD *)(v5 + 104) = 0u;
    *(_OWORD *)(v5 + 120) = 0u;
    *(_OWORD *)(v5 + 136) = 0u;
    *(_QWORD *)(v5 + 152) = 0;
    *(_QWORD *)(v5 + 160) = 0x696E707464734F61;
    *(_QWORD *)(v5 + 168) = 0;
    *(_BYTE *)(v5 + 176) = 1;
    *(_OWORD *)(v5 + 184) = xmmword_1B5D68B50;
    *(_QWORD *)(v5 + 184) = std::chrono::steady_clock::now().__d_.__rep_ - 1000000 * *(_QWORD *)(v5 + 192);
    *(_QWORD *)v5 = &off_1E69703A8;
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B398], MEMORY[0x1E0C9B3A8]);
    v16[2] = Mutable;
    v7 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B398], MEMORY[0x1E0C9B3A8]);
    v16[1] = v7;
    applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)v16, "airpods noise suppression");
    mcp_applesauce::CF::Dictionary_Builder::get_dictionary((applesauce::CF::DictionaryRef *)&cf, v7);
    mcp_applesauce::CF::Dictionary_Builder::add_value<applesauce::CF::StringRef,applesauce::CF::DictionaryRef>(Mutable, v16[0], cf);
    if (cf)
      CFRelease(cf);
    if (v16[0])
      CFRelease(v16[0]);
    mcp_applesauce::CF::Dictionary_Builder::get_dictionary((applesauce::CF::DictionaryRef *)v16, Mutable);
    v8 = v16[0];
    v16[0] = 0;
    atomic_store((unint64_t)v8, (unint64_t *)(v5 + 168));
    if (v7)
      CFRelease(v7);
    if (Mutable)
      CFRelease(Mutable);
    -[DSP_HAL_Mock_PropertySet setPropAvailableOffloadsInput:](self, "setPropAvailableOffloadsInput:", v5);
  }
  if ((~a3 & 0x201) == 0 && !-[DSP_HAL_Mock_PropertySet propDSPGraphParam](self, "propDSPGraphParam"))
  {
    v9 = operator new();
    v20 = 0;
    DSP_TemplatedProperty<1684500589u,1768845428u,float>::DSP_TemplatedProperty(v9, (uint64_t)v19, 1);
    -[DSP_HAL_Mock_PropertySet setPropDSPGraphParam:](self, "setPropDSPGraphParam:", v9);
    v10 = v20;
    if (v20 == v19)
    {
      v11 = 4;
      v10 = v19;
      goto LABEL_18;
    }
    if (v20)
    {
      v11 = 5;
LABEL_18:
      (*(void (**)(void))(*v10 + 8 * v11))();
    }
  }
  if ((~a3 & 0x401) == 0 && !-[DSP_HAL_Mock_PropertySet propDSPGraphParam](self, "propDSPGraphParam"))
  {
    v12 = operator new();
    v18 = 0;
    DSP_TemplatedProperty<1684500589u,1768845428u,float>::DSP_TemplatedProperty(v12, (uint64_t)v17, 0);
    -[DSP_HAL_Mock_PropertySet setPropDSPGraphParam:](self, "setPropDSPGraphParam:", v12);
    v13 = v18;
    if (v18 == v17)
    {
      v14 = 4;
      v13 = v17;
    }
    else
    {
      if (!v18)
        return;
      v14 = 5;
    }
    (*(void (**)(void))(*v13 + 8 * v14))();
  }
}

- (id)getHostedDSPPropertyInfoArray
{
  char *v3;
  char *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  char *v12;
  __int128 v13;
  int64x2_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char *v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  char *v29;
  __int128 v30;
  int64x2_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned __int8 v37;
  char *v38;
  char *v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  char *v43;
  uint64_t v44;
  _QWORD *v45;
  _QWORD *v46;
  char *v47;
  __int128 v48;
  int64x2_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  void *v56;
  __int128 v58;
  void (**v59)();
  _QWORD v60[2];
  int64x2_t v61;
  char *v62;
  CFTypeRef cf;
  int64x2_t v64;
  char *v65;
  char **v66;

  v59 = (void (**)())&off_1E699E778;
  v60[0] = 0;
  v60[1] = 0;
  v61 = 0uLL;
  v62 = 0;
  if (-[DSP_HAL_Mock_PropertySet propVoiceActivityState](self, "propVoiceActivityState"))
  {
    std::allocate_shared[abi:ne180100]<DSP_Host_Types::DSPPropertyInfo,std::allocator<DSP_Host_Types::DSPPropertyInfo>,char const(&)[1],void>(&v58, "");
    v3 = (char *)v61.i64[1];
    if (v61.i64[1] >= (unint64_t)v62)
    {
      v5 = (v61.i64[1] - v61.i64[0]) >> 4;
      if ((unint64_t)(v5 + 1) >> 60)
        std::vector<std::tuple<std::pair<std::string,std::string>,std::shared_ptr<AMCP::Log::Scope>>>::__throw_length_error[abi:ne180100]();
      v6 = (uint64_t)&v62[-v61.i64[0]] >> 3;
      if (v6 <= v5 + 1)
        v6 = v5 + 1;
      if ((unint64_t)&v62[-v61.i64[0]] >= 0x7FFFFFFFFFFFFFF0)
        v7 = 0xFFFFFFFFFFFFFFFLL;
      else
        v7 = v6;
      v66 = &v62;
      v8 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CA::ValueRange>>(v7);
      v3 = &v8[16 * v5];
      *(_OWORD *)v3 = v58;
      v58 = 0uLL;
      v10 = (_QWORD *)v61.i64[1];
      v11 = (_QWORD *)v61.i64[0];
      if (v61.i64[1] == v61.i64[0])
      {
        v14 = vdupq_n_s64(v61.u64[1]);
        v12 = v3;
      }
      else
      {
        v12 = v3;
        do
        {
          v13 = *((_OWORD *)v10 - 1);
          v10 -= 2;
          *((_OWORD *)v12 - 1) = v13;
          v12 -= 16;
          *v10 = 0;
          v10[1] = 0;
        }
        while (v10 != v11);
        v14 = v61;
      }
      v4 = v3 + 16;
      v61.i64[0] = (uint64_t)v12;
      v61.i64[1] = (uint64_t)(v3 + 16);
      v64 = v14;
      v15 = v62;
      v62 = &v8[16 * v9];
      v65 = v15;
      cf = (CFTypeRef)v14.i64[0];
      std::__split_buffer<std::shared_ptr<DSP_Host_Types::FormatDescription>>::~__split_buffer((uint64_t)&cf);
    }
    else
    {
      *(_OWORD *)v61.i64[1] = v58;
      v4 = v3 + 16;
    }
    v61.i64[1] = (uint64_t)v4;
    v16 = *(_QWORD *)v3;
    *(_DWORD *)(v16 + 40) = 1983997011;
    *(_BYTE *)(v16 + 44) = 1;
    v17 = *(_QWORD *)v3;
    *(_DWORD *)(v17 + 64) = 1768845428;
    *(_BYTE *)(v17 + 68) = 1;
    *(_WORD *)(*(_QWORD *)v3 + 112) = 256;
    *(_WORD *)(*(_QWORD *)v3 + 88) = 256;
    v18 = *(_QWORD *)v3;
    *(_DWORD *)(v18 + 136) = 5;
    *(_BYTE *)(v18 + 140) = 1;
    v19 = *(_QWORD *)v3;
    *(_DWORD *)(v19 + 224) = 1;
    *(_BYTE *)(v19 + 228) = 1;
  }
  if (-[DSP_HAL_Mock_PropertySet propAvailableOffloadsInput](self, "propAvailableOffloadsInput", (_QWORD)v58))
  {
    std::allocate_shared[abi:ne180100]<DSP_Host_Types::DSPPropertyInfo,std::allocator<DSP_Host_Types::DSPPropertyInfo>,char const(&)[1],void>(&v58, "");
    v20 = (char *)v61.i64[1];
    if (v61.i64[1] >= (unint64_t)v62)
    {
      v22 = (v61.i64[1] - v61.i64[0]) >> 4;
      if ((unint64_t)(v22 + 1) >> 60)
        std::vector<std::tuple<std::pair<std::string,std::string>,std::shared_ptr<AMCP::Log::Scope>>>::__throw_length_error[abi:ne180100]();
      v23 = (uint64_t)&v62[-v61.i64[0]] >> 3;
      if (v23 <= v22 + 1)
        v23 = v22 + 1;
      if ((unint64_t)&v62[-v61.i64[0]] >= 0x7FFFFFFFFFFFFFF0)
        v24 = 0xFFFFFFFFFFFFFFFLL;
      else
        v24 = v23;
      v66 = &v62;
      v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CA::ValueRange>>(v24);
      v20 = &v25[16 * v22];
      *(_OWORD *)v20 = v58;
      v58 = 0uLL;
      v27 = (_QWORD *)v61.i64[1];
      v28 = (_QWORD *)v61.i64[0];
      if (v61.i64[1] == v61.i64[0])
      {
        v31 = vdupq_n_s64(v61.u64[1]);
        v29 = v20;
      }
      else
      {
        v29 = v20;
        do
        {
          v30 = *((_OWORD *)v27 - 1);
          v27 -= 2;
          *((_OWORD *)v29 - 1) = v30;
          v29 -= 16;
          *v27 = 0;
          v27[1] = 0;
        }
        while (v27 != v28);
        v31 = v61;
      }
      v21 = v20 + 16;
      v61.i64[0] = (uint64_t)v29;
      v61.i64[1] = (uint64_t)(v20 + 16);
      v64 = v31;
      v32 = v62;
      v62 = &v25[16 * v26];
      v65 = v32;
      cf = (CFTypeRef)v31.i64[0];
      std::__split_buffer<std::shared_ptr<DSP_Host_Types::FormatDescription>>::~__split_buffer((uint64_t)&cf);
    }
    else
    {
      *(_OWORD *)v61.i64[1] = v58;
      v21 = v20 + 16;
    }
    v61.i64[1] = (uint64_t)v21;
    v33 = *(_QWORD *)v20;
    *(_DWORD *)(v33 + 40) = 1685278561;
    *(_BYTE *)(v33 + 44) = 1;
    v34 = *(_QWORD *)v20;
    *(_DWORD *)(v34 + 64) = 1768845428;
    *(_BYTE *)(v34 + 68) = 1;
    *(_WORD *)(*(_QWORD *)v20 + 112) = 256;
    *(_WORD *)(*(_QWORD *)v20 + 88) = 257;
    v35 = *(_QWORD *)v20;
    *(_DWORD *)(v35 + 136) = 7;
    *(_BYTE *)(v35 + 140) = 1;
    v36 = *(_QWORD *)v20;
    *(_DWORD *)(v36 + 224) = 7;
    *(_BYTE *)(v36 + 228) = 1;
  }
  if (-[DSP_HAL_Mock_PropertySet propDSPGraphParam](self, "propDSPGraphParam", (_QWORD)v58))
  {
    std::allocate_shared[abi:ne180100]<DSP_Host_Types::DSPPropertyInfo,std::allocator<DSP_Host_Types::DSPPropertyInfo>,char const(&)[1],void>(&v58, "");
    v38 = (char *)v61.i64[1];
    if (v61.i64[1] >= (unint64_t)v62)
    {
      v40 = (v61.i64[1] - v61.i64[0]) >> 4;
      if ((unint64_t)(v40 + 1) >> 60)
        std::vector<std::tuple<std::pair<std::string,std::string>,std::shared_ptr<AMCP::Log::Scope>>>::__throw_length_error[abi:ne180100]();
      v41 = (uint64_t)&v62[-v61.i64[0]] >> 3;
      if (v41 <= v40 + 1)
        v41 = v40 + 1;
      if ((unint64_t)&v62[-v61.i64[0]] >= 0x7FFFFFFFFFFFFFF0)
        v42 = 0xFFFFFFFFFFFFFFFLL;
      else
        v42 = v41;
      v66 = &v62;
      v43 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CA::ValueRange>>(v42);
      v38 = &v43[16 * v40];
      *(_OWORD *)v38 = v58;
      v58 = 0uLL;
      v45 = (_QWORD *)v61.i64[1];
      v46 = (_QWORD *)v61.i64[0];
      if (v61.i64[1] == v61.i64[0])
      {
        v49 = vdupq_n_s64(v61.u64[1]);
        v47 = v38;
      }
      else
      {
        v47 = v38;
        do
        {
          v48 = *((_OWORD *)v45 - 1);
          v45 -= 2;
          *((_OWORD *)v47 - 1) = v48;
          v47 -= 16;
          *v45 = 0;
          v45[1] = 0;
        }
        while (v45 != v46);
        v49 = v61;
      }
      v39 = v38 + 16;
      v61.i64[0] = (uint64_t)v47;
      v61.i64[1] = (uint64_t)(v38 + 16);
      v64 = v49;
      v50 = v62;
      v62 = &v43[16 * v44];
      v65 = v50;
      cf = (CFTypeRef)v49.i64[0];
      std::__split_buffer<std::shared_ptr<DSP_Host_Types::FormatDescription>>::~__split_buffer((uint64_t)&cf);
    }
    else
    {
      *(_OWORD *)v61.i64[1] = v58;
      v39 = v38 + 16;
    }
    v61.i64[1] = (uint64_t)v39;
    v51 = *(_QWORD *)v38;
    *(_DWORD *)(v51 + 40) = 1684500589;
    *(_BYTE *)(v51 + 44) = 1;
    v52 = *(_QWORD *)v38;
    *(_DWORD *)(v52 + 64) = 707406378;
    *(_BYTE *)(v52 + 68) = 1;
    *(_WORD *)(*(_QWORD *)v38 + 112) = v37 & 1 | 0x100;
    *(_WORD *)(*(_QWORD *)v38 + 88) = 256;
    v53 = *(_QWORD *)v38;
    *(_DWORD *)(v53 + 136) = 4;
    *(_BYTE *)(v53 + 140) = 1;
    v54 = *(_QWORD *)v38;
    *(_DWORD *)(v54 + 224) = 5;
    *(_BYTE *)(v54 + 228) = 1;
  }
  cf = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B398], MEMORY[0x1E0C9B3A8]);
  ((void (*)(void (***)(), CFTypeRef *))v59[3])(&v59, &cf);
  mcp_applesauce::CF::Dictionary_Builder::get_dictionary((applesauce::CF::DictionaryRef *)&v58, cf);
  if (cf)
    CFRelease(cf);
  v55 = (id)v58;
  v56 = v55;
  if (v55)
    CFRelease(v55);
  v59 = (void (**)())&off_1E699E778;
  cf = &v61;
  std::vector<std::shared_ptr<unsigned long long>>::__destroy_vector::operator()[abi:ne180100]((void ***)&cf);
  v59 = off_1E699E7B8;
  std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)v60);
  return v56;
}

- (BOOL)hasHostedDSPPropertyAtAddress:(AudioObjectPropertyAddress)a3
{
  unint64_t v3;
  DSP_HAL_Mock_Property *v4;
  AudioObjectPropertyElement mElement;
  DSP_HAL_Mock_Property *v6;
  BOOL v7;

  v3 = *(_QWORD *)&a3.mSelector;
  switch(a3.mSelector)
  {
    case 0x6467706Du:
      mElement = a3.mElement;
      v6 = -[DSP_HAL_Mock_PropertySet propDSPGraphParam](self, "propDSPGraphParam");
      v7 = mElement == 0;
      if (!v6)
        v7 = 0;
      return HIDWORD(v3) == 1768845428 && v7;
    case 0x64734F61u:
      v4 = -[DSP_HAL_Mock_PropertySet propAvailableOffloadsInput](self, "propAvailableOffloadsInput", *(_QWORD *)&a3.mSelector, *(_QWORD *)&a3.mElement);
      return v4 != 0;
    case 0x76416453u:
      v4 = -[DSP_HAL_Mock_PropertySet propVoiceActivityState](self, "propVoiceActivityState");
      return v4 != 0;
    default:
      return 0;
  }
}

- (BOOL)setHostedDSPPropertyAtAddress:(AudioObjectPropertyAddress)a3 withData:(id)a4 withQualifier:(id)a5 error:(id *)a6
{
  AudioObjectPropertyElement mElement;
  uint64_t v8;
  id v10;
  id v11;
  BOOL v12;
  DSP_HAL_Mock_Property *v13;
  std::condition_variable *v14;
  float v16;
  unsigned int *v17;
  unsigned int v18;
  float v19;
  float v20;
  int v21;

  mElement = a3.mElement;
  v8 = *(_QWORD *)&a3.mSelector;
  v10 = a4;
  v11 = a5;
  if (!-[DSP_HAL_Mock_PropertySet propDSPGraphParam](self, "propDSPGraphParam")
    || (_DWORD)v8 != 1684500589 && (_DWORD)v8 != 707406378
    || HIDWORD(v8) != 1768845428 && HIDWORD(v8) != 707406378)
  {
    goto LABEL_14;
  }
  v12 = 0;
  if (!v11 || mElement + 1 > 1)
    goto LABEL_15;
  if (objc_msgSend(v11, "length") != 4
    || (v21 = 0, objc_msgSend(v11, "getBytes:length:", &v21, 4), !v10)
    || v21 != 1651797616
    || objc_msgSend(v10, "length") != 4)
  {
LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
  v13 = -[DSP_HAL_Mock_PropertySet propDSPGraphParam](self, "propDSPGraphParam");
  if (v13)
  else
    v14 = 0;
  v20 = 0.0;
  objc_msgSend(v10, "getBytes:length:", &v20, 4);
  v16 = v20;
  v17 = (unsigned int *)&v14[3].__cv_.__opaque[16];
  v18 = LODWORD(v20);
  do
    v19 = COERCE_FLOAT(__ldaxr(v17));
  while (__stlxr(v18, v17));
  if (v16 != v19)
    std::condition_variable::notify_one(v14 + 1);
  v12 = 1;
LABEL_15:

  return v12;
}

- (id)getHostedDSPPropertyAtAddress:(AudioObjectPropertyAddress)a3 withQualifierData:(id)a4
{
  AudioObjectPropertyElement mElement;
  AudioObjectPropertySelector mSelector;
  AudioObjectPropertyScope mScope;
  id v8;
  DSP_HAL_Mock_Property *v9;
  unsigned int *v10;
  unsigned int v11;
  DSP_HAL_Mock_Property *v12;
  unint64_t *v13;
  const void *v14;
  id v15;
  void *v16;
  void *v17;
  DSP_HAL_Mock_Property *v18;
  unsigned int *v19;
  unsigned int v20;
  unsigned int v21;
  CFDataRef v23;
  id v24;
  CFDataRef v25;
  UInt8 v26[4];
  id v27;
  UInt8 bytes[4];

  mElement = a3.mElement;
  mSelector = a3.mSelector;
  mScope = a3.mScope;
  v8 = a4;
  if (mSelector == 1983997011 && mScope == 1768845428)
  {
    if (!mElement)
    {
      v9 = -[DSP_HAL_Mock_PropertySet propVoiceActivityState](self, "propVoiceActivityState");
      if (v9
      {
        v11 = atomic_load(v10 + 42);
      }
      else
      {
        v11 = 0;
      }
      *(_DWORD *)bytes = v11;
      v23 = CFDataCreate(0, bytes, 4);
      applesauce::CF::DataRef::DataRef((applesauce::CF::DataRef *)&v27, v23);
      v24 = v27;
      v17 = v24;
      if (v24)
        CFRelease(v24);
      goto LABEL_29;
    }
LABEL_16:
    if (-[DSP_HAL_Mock_PropertySet propDSPGraphParam](self, "propDSPGraphParam")
      && (mSelector == 1684500589 || mSelector == 707406378)
      && (mScope == 1768845428 || mScope == 707406378))
    {
      v17 = 0;
      if (!v8 || mElement + 1 > 1)
        goto LABEL_29;
      if (objc_msgSend(v8, "length") == 4)
      {
        *(_DWORD *)bytes = 0;
        objc_msgSend(v8, "getBytes:length:", bytes, 4);
        if (*(_DWORD *)bytes == 1651797616)
        {
          v18 = -[DSP_HAL_Mock_PropertySet propDSPGraphParam](self, "propDSPGraphParam");
          if (v18
          {
            v20 = atomic_load(v19 + 42);
            v21 = v20;
          }
          else
          {
            v21 = 0;
          }
          *(_DWORD *)v26 = v21;
          v25 = CFDataCreate(0, v26, 4);
          applesauce::CF::DataRef::DataRef((applesauce::CF::DataRef *)&v27, v25);
          v17 = v27;
          AMCP::Log::Scope::get_os_log_t(v27);
          objc_claimAutoreleasedReturnValue();
          applesauce::CF::DataRef::~DataRef((const void **)&v27);
          goto LABEL_29;
        }
      }
    }
LABEL_28:
    v17 = 0;
    goto LABEL_29;
  }
  if (mSelector != 1685278561 || mScope != 1768845428 || mElement)
    goto LABEL_16;
  v12 = -[DSP_HAL_Mock_PropertySet propAvailableOffloadsInput](self, "propAvailableOffloadsInput");
  if (!v12)
    goto LABEL_28;
  if (!v13)
    goto LABEL_28;
  v14 = (const void *)atomic_load(v13 + 21);
  if (!v14)
    goto LABEL_28;
  CFRetain(v14);
  applesauce::CF::DictionaryRef::DictionaryRef((applesauce::CF::DictionaryRef *)&v27, v14);
  v15 = v27;
  v16 = v15;
  if (v15)
    CFRelease(v15);
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v16, 200, 0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_29:
  return v17;
}

- (DSP_HAL_Mock_Property)propAvailableOffloadsInput
{
  return self->_propAvailableOffloadsInput;
}

- (void)setPropAvailableOffloadsInput:(DSP_HAL_Mock_Property *)a3
{
  self->_propAvailableOffloadsInput = a3;
}

- (DSP_HAL_Mock_Property)propVoiceActivityState
{
  return self->_propVoiceActivityState;
}

- (void)setPropVoiceActivityState:(DSP_HAL_Mock_Property *)a3
{
  self->_propVoiceActivityState = a3;
}

- (DSP_HAL_Mock_Property)propDSPGraphParam
{
  return self->_propDSPGraphParam;
}

- (void)setPropDSPGraphParam:(DSP_HAL_Mock_Property *)a3
{
  self->_propDSPGraphParam = a3;
}

- (function<unsigned)propertyUpdater
{
  return (function<unsigned int (const AudioObjectPropertyAddress &, unsigned int)> *)std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)retstr, (uint64_t)&self->_propertyUpdater);
}

- (void)setPropertyUpdater:(function<unsigned int (const AudioObjectPropertyAddress)&
{
  function<unsigned int (const AudioObjectPropertyAddress &, unsigned int)> *p_propertyUpdater;
  void *v5;
  function<unsigned int (const AudioObjectPropertyAddress &, unsigned int)> *f;
  _QWORD *v7;
  uint64_t v8;
  _QWORD v9[3];
  _QWORD *v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)v9, (uint64_t)a3);
  p_propertyUpdater = &self->_propertyUpdater;
  if (&self->_propertyUpdater != (function<unsigned int (const AudioObjectPropertyAddress &, unsigned int)> *)v9)
  {
    v5 = v10;
    f = (function<unsigned int (const AudioObjectPropertyAddress &, unsigned int)> *)self->_propertyUpdater.__f_.__f_;
    if (v10 == v9)
    {
      if (f == p_propertyUpdater)
      {
        (*(void (**)(_QWORD *, _QWORD *))(v9[0] + 24))(v9, v11);
        (*(void (**)(_QWORD *))(*v10 + 32))(v10);
        v10 = 0;
        (*(void (**)(void *, _QWORD *))(*(_QWORD *)self->_propertyUpdater.__f_.__f_ + 24))(self->_propertyUpdater.__f_.__f_, v9);
        (*(void (**)(void *))(*(_QWORD *)self->_propertyUpdater.__f_.__f_ + 32))(self->_propertyUpdater.__f_.__f_);
        self->_propertyUpdater.__f_.__f_ = 0;
        v10 = v9;
        (*(void (**)(_QWORD *, function<unsigned int (const AudioObjectPropertyAddress &, unsigned int)> *))(v11[0] + 24))(v11, &self->_propertyUpdater);
        (*(void (**)(_QWORD *))(v11[0] + 32))(v11);
      }
      else
      {
        (*(void (**)(_QWORD *, function<unsigned int (const AudioObjectPropertyAddress &, unsigned int)> *))(v9[0] + 24))(v9, &self->_propertyUpdater);
        (*(void (**)(_QWORD *))(*v10 + 32))(v10);
        v10 = self->_propertyUpdater.__f_.__f_;
      }
      self->_propertyUpdater.__f_.__f_ = p_propertyUpdater;
    }
    else if (f == p_propertyUpdater)
    {
      (*(void (**)(function<unsigned int (const AudioObjectPropertyAddress &, unsigned int)> *, _QWORD *))(*(_QWORD *)p_propertyUpdater->__f_.__buf_.__lx + 24))(&self->_propertyUpdater, v9);
      (*(void (**)(void *))(*(_QWORD *)self->_propertyUpdater.__f_.__f_ + 32))(self->_propertyUpdater.__f_.__f_);
      self->_propertyUpdater.__f_.__f_ = v10;
      v10 = v9;
    }
    else
    {
      v10 = self->_propertyUpdater.__f_.__f_;
      self->_propertyUpdater.__f_.__f_ = v5;
    }
  }
  v7 = v10;
  if (v10 == v9)
  {
    v8 = 4;
    v7 = v9;
  }
  else
  {
    if (!v10)
      return;
    v8 = 5;
  }
  (*(void (**)(void))(*v7 + 8 * v8))();
}

- (void).cxx_destruct
{
  function<unsigned int (const AudioObjectPropertyAddress &, unsigned int)> *p_propertyUpdater;
  function<unsigned int (const AudioObjectPropertyAddress &, unsigned int)> *f;
  uint64_t v4;

  p_propertyUpdater = &self->_propertyUpdater;
  f = (function<unsigned int (const AudioObjectPropertyAddress &, unsigned int)> *)self->_propertyUpdater.__f_.__f_;
  if (f == p_propertyUpdater)
  {
    v4 = 4;
    f = p_propertyUpdater;
  }
  else
  {
    if (!f)
      return;
    v4 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)f->__f_.__buf_.__lx + 8 * v4))();
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  return self;
}

@end
