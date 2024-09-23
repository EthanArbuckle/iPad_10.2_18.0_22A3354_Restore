@implementation DSP_HAL_Mock_IOProcessor

- (DSP_HAL_Mock_IOProcessor)init
{
  DSP_HAL_Mock_IOProcessor *v2;
  DSP_HAL_Mock_IOProcessor *v3;
  DSP_HAL_Mock_IOProcessor *v4;
  HAL_DSP_HostCallbacks *hostCallbacks;
  DSP_HAL_Mock_PropertySet *processorProperties;
  function<DSP_HAL_Mock_TestHooks ()> *f;
  uint64_t v8;
  DSP_HAL_Mock_PropertySet *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  objc_super v14;
  _BYTE v15[24];
  _BYTE *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)DSP_HAL_Mock_IOProcessor;
  v2 = -[DSP_HAL_Mock_IOProcessor init](&v14, sel_init);
  v3 = v2;
  v4 = v2;
  if (v2)
  {
    hostCallbacks = v2->_hostCallbacks;
    v2->_dspCallbacks = 0;
    v2->_hostCallbacks = 0;

    processorProperties = v4->_processorProperties;
    v4->_processorProperties = 0;

    v4->_featureFlag = 97;
    f = (function<DSP_HAL_Mock_TestHooks ()> *)v4->_testHookFetcher.__f_.__f_;
    v4->_testHookFetcher.__f_.__f_ = 0;
    if (f == &v3->_testHookFetcher)
    {
      v8 = 4;
      f = &v3->_testHookFetcher;
    }
    else
    {
      if (!f)
        goto LABEL_7;
      v8 = 5;
    }
    (*(void (**)(void))(*(_QWORD *)f->__f_.__buf_.__lx + 8 * v8))();
LABEL_7:
    v9 = objc_alloc_init(DSP_HAL_Mock_PropertySet);
    -[DSP_HAL_Mock_IOProcessor setProcessorProperties:](v4, "setProcessorProperties:", v9);

    -[DSP_HAL_Mock_IOProcessor processorProperties](v4, "processorProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v10, "configureForProcessor:", v15);
    v11 = v16;
    if (v16 == v15)
    {
      v12 = 4;
      v11 = v15;
    }
    else
    {
      if (!v16)
      {
LABEL_12:

        return v4;
      }
      v12 = 5;
    }
    (*(void (**)(void))(*v11 + 8 * v12))();
    goto LABEL_12;
  }
  return v4;
}

- (void)dealloc
{
  DSP_HAL_Mock_PropertySet *processorProperties;
  void *dspCallbacks;
  HAL_DSP_HostCallbacks *hostCallbacks;
  objc_super v6;

  processorProperties = self->_processorProperties;
  self->_processorProperties = 0;

  dspCallbacks = self->_dspCallbacks;
  if (dspCallbacks)
  {
    (*(void (**)(void *))(*(_QWORD *)dspCallbacks + 8))(dspCallbacks);
    self->_dspCallbacks = 0;
  }
  hostCallbacks = self->_hostCallbacks;
  self->_hostCallbacks = 0;

  v6.receiver = self;
  v6.super_class = (Class)DSP_HAL_Mock_IOProcessor;
  -[DSP_HAL_Mock_IOProcessor dealloc](&v6, sel_dealloc);
}

- (BOOL)callNegotiateHook:(const void *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  char v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  _BYTE v34[24];
  _BYTE *v35;
  _QWORD v36[3];
  _QWORD *v37;
  _BYTE v38[24];
  _BYTE *v39;
  _BYTE v40[24];
  _BYTE *v41;
  _BYTE v42[24];
  _BYTE *v43;
  _BYTE v44[24];
  _BYTE *v45;
  _BYTE v46[24];
  _BYTE *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  -[DSP_HAL_Mock_IOProcessor testHookFetcher](self, "testHookFetcher");
  if (!v47)
    return 1;
  -[DSP_HAL_Mock_IOProcessor testHookFetcher](self, "testHookFetcher");
  if (!v35)
    std::__throw_bad_function_call[abi:ne180100]();
  (*(void (**)(_QWORD *__return_ptr))(*(_QWORD *)v35 + 48))(v36);
  v5 = v37;
  v6 = v45;
  if (v45 == v44)
  {
    v7 = 4;
    v6 = v44;
  }
  else
  {
    if (!v45)
      goto LABEL_8;
    v7 = 5;
  }
  (*(void (**)(void))(*v6 + 8 * v7))();
LABEL_8:
  v8 = v43;
  if (v43 == v42)
  {
    v9 = 4;
    v8 = v42;
  }
  else
  {
    if (!v43)
      goto LABEL_13;
    v9 = 5;
  }
  (*(void (**)(void))(*v8 + 8 * v9))();
LABEL_13:
  v10 = v41;
  if (v41 == v40)
  {
    v11 = 4;
    v10 = v40;
  }
  else
  {
    if (!v41)
      goto LABEL_18;
    v11 = 5;
  }
  (*(void (**)(void))(*v10 + 8 * v11))();
LABEL_18:
  v12 = v39;
  if (v39 == v38)
  {
    v13 = 4;
    v12 = v38;
  }
  else
  {
    if (!v39)
      goto LABEL_23;
    v13 = 5;
  }
  (*(void (**)(void))(*v12 + 8 * v13))();
LABEL_23:
  v14 = v37;
  if (v37 == v36)
  {
    v15 = 4;
    v14 = v36;
  }
  else
  {
    if (!v37)
      goto LABEL_28;
    v15 = 5;
  }
  (*(void (**)(void))(*v14 + 8 * v15))();
LABEL_28:
  v16 = v35;
  if (v35 == v34)
  {
    v17 = 4;
    v16 = v34;
  }
  else
  {
    v17 = 5;
  }
  (*(void (**)(void))(*v16 + 8 * v17))();
  v18 = v47;
  if (v47 == v46)
  {
    v19 = 4;
    v18 = v46;
  }
  else
  {
    if (!v47)
      goto LABEL_36;
    v19 = 5;
  }
  (*(void (**)(void))(*v18 + 8 * v19))();
LABEL_36:
  if (!v5)
    return 1;
  -[DSP_HAL_Mock_IOProcessor testHookFetcher](self, "testHookFetcher");
  if (!v47)
    std::__throw_bad_function_call[abi:ne180100]();
  (*(void (**)(_QWORD *__return_ptr))(*(_QWORD *)v47 + 48))(v36);
  if (!v37)
    std::__throw_bad_function_call[abi:ne180100]();
  v20 = (*(uint64_t (**)(_QWORD *, const void *))(*v37 + 48))(v37, a3);
  v21 = v45;
  if (v45 == v44)
  {
    v22 = 4;
    v21 = v44;
  }
  else
  {
    if (!v45)
      goto LABEL_45;
    v22 = 5;
  }
  (*(void (**)(void))(*v21 + 8 * v22))();
LABEL_45:
  v23 = v43;
  if (v43 == v42)
  {
    v24 = 4;
    v23 = v42;
  }
  else
  {
    if (!v43)
      goto LABEL_50;
    v24 = 5;
  }
  (*(void (**)(void))(*v23 + 8 * v24))();
LABEL_50:
  v25 = v41;
  if (v41 == v40)
  {
    v26 = 4;
    v25 = v40;
  }
  else
  {
    if (!v41)
      goto LABEL_55;
    v26 = 5;
  }
  (*(void (**)(void))(*v25 + 8 * v26))();
LABEL_55:
  v27 = v39;
  if (v39 == v38)
  {
    v28 = 4;
    v27 = v38;
  }
  else
  {
    if (!v39)
      goto LABEL_60;
    v28 = 5;
  }
  (*(void (**)(void))(*v27 + 8 * v28))();
LABEL_60:
  v29 = v37;
  if (v37 == v36)
  {
    v30 = 4;
    v29 = v36;
    goto LABEL_64;
  }
  if (v37)
  {
    v30 = 5;
LABEL_64:
    (*(void (**)(void))(*v29 + 8 * v30))();
  }
  v31 = v47;
  if (v47 == v46)
  {
    v32 = 4;
    v31 = v46;
    goto LABEL_69;
  }
  if (v47)
  {
    v32 = 5;
LABEL_69:
    (*(void (**)(void))(*v31 + 8 * v32))();
  }
  return v20;
}

- (void)setFeatureFlag:(int)a3
{
  uint64_t v3;
  void *v5;
  id v6;

  v3 = *(_QWORD *)&a3;
  self->_featureFlag = a3;
  -[DSP_HAL_Mock_IOProcessor processorProperties](self, "processorProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DSP_HAL_Mock_IOProcessor processorProperties](self, "processorProperties");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "configureForFeatureFlag:", v3);

  }
}

- (BOOL)callAdaptHook:(const void *)a3
{
  _BYTE *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  char v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  _BYTE v34[24];
  _BYTE *v35;
  _QWORD v36[3];
  _QWORD *v37;
  _BYTE v38[24];
  _BYTE *v39;
  _BYTE v40[24];
  _BYTE *v41;
  _BYTE v42[24];
  _BYTE *v43;
  _BYTE v44[24];
  _BYTE *v45;
  _BYTE v46[24];
  _BYTE *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  -[DSP_HAL_Mock_IOProcessor testHookFetcher](self, "testHookFetcher");
  if (!v47)
    return 1;
  -[DSP_HAL_Mock_IOProcessor testHookFetcher](self, "testHookFetcher");
  if (!v35)
    std::__throw_bad_function_call[abi:ne180100]();
  (*(void (**)(_QWORD *__return_ptr))(*(_QWORD *)v35 + 48))(v36);
  v5 = v39;
  v6 = v45;
  if (v45 == v44)
  {
    v7 = 4;
    v6 = v44;
  }
  else
  {
    if (!v45)
      goto LABEL_8;
    v7 = 5;
  }
  (*(void (**)(void))(*v6 + 8 * v7))();
LABEL_8:
  v8 = v43;
  if (v43 == v42)
  {
    v9 = 4;
    v8 = v42;
  }
  else
  {
    if (!v43)
      goto LABEL_13;
    v9 = 5;
  }
  (*(void (**)(void))(*v8 + 8 * v9))();
LABEL_13:
  v10 = v41;
  if (v41 == v40)
  {
    v11 = 4;
    v10 = v40;
  }
  else
  {
    if (!v41)
      goto LABEL_18;
    v11 = 5;
  }
  (*(void (**)(void))(*v10 + 8 * v11))();
LABEL_18:
  v12 = v39;
  if (v39 == v38)
  {
    v13 = 4;
    v12 = v38;
  }
  else
  {
    if (!v39)
      goto LABEL_23;
    v13 = 5;
  }
  (*(void (**)(void))(*v12 + 8 * v13))();
LABEL_23:
  v14 = v37;
  if (v37 == v36)
  {
    v15 = 4;
    v14 = v36;
  }
  else
  {
    if (!v37)
      goto LABEL_28;
    v15 = 5;
  }
  (*(void (**)(void))(*v14 + 8 * v15))();
LABEL_28:
  v16 = v35;
  if (v35 == v34)
  {
    v17 = 4;
    v16 = v34;
  }
  else
  {
    v17 = 5;
  }
  (*(void (**)(void))(*v16 + 8 * v17))();
  v18 = v47;
  if (v47 == v46)
  {
    v19 = 4;
    v18 = v46;
  }
  else
  {
    if (!v47)
      goto LABEL_36;
    v19 = 5;
  }
  (*(void (**)(void))(*v18 + 8 * v19))();
LABEL_36:
  if (!v5)
    return 1;
  -[DSP_HAL_Mock_IOProcessor testHookFetcher](self, "testHookFetcher");
  if (!v47)
    std::__throw_bad_function_call[abi:ne180100]();
  (*(void (**)(_QWORD *__return_ptr))(*(_QWORD *)v47 + 48))(v36);
  if (!v39)
    std::__throw_bad_function_call[abi:ne180100]();
  v20 = (*(uint64_t (**)(_BYTE *, const void *))(*(_QWORD *)v39 + 48))(v39, a3);
  v21 = v45;
  if (v45 == v44)
  {
    v22 = 4;
    v21 = v44;
  }
  else
  {
    if (!v45)
      goto LABEL_45;
    v22 = 5;
  }
  (*(void (**)(void))(*v21 + 8 * v22))();
LABEL_45:
  v23 = v43;
  if (v43 == v42)
  {
    v24 = 4;
    v23 = v42;
  }
  else
  {
    if (!v43)
      goto LABEL_50;
    v24 = 5;
  }
  (*(void (**)(void))(*v23 + 8 * v24))();
LABEL_50:
  v25 = v41;
  if (v41 == v40)
  {
    v26 = 4;
    v25 = v40;
  }
  else
  {
    if (!v41)
      goto LABEL_55;
    v26 = 5;
  }
  (*(void (**)(void))(*v25 + 8 * v26))();
LABEL_55:
  v27 = v39;
  if (v39 == v38)
  {
    v28 = 4;
    v27 = v38;
  }
  else
  {
    if (!v39)
      goto LABEL_60;
    v28 = 5;
  }
  (*(void (**)(void))(*v27 + 8 * v28))();
LABEL_60:
  v29 = v37;
  if (v37 == v36)
  {
    v30 = 4;
    v29 = v36;
    goto LABEL_64;
  }
  if (v37)
  {
    v30 = 5;
LABEL_64:
    (*(void (**)(void))(*v29 + 8 * v30))();
  }
  v31 = v47;
  if (v47 == v46)
  {
    v32 = 4;
    v31 = v46;
    goto LABEL_69;
  }
  if (v47)
  {
    v32 = 5;
LABEL_69:
    (*(void (**)(void))(*v31 + 8 * v32))();
  }
  return v20;
}

- (void)setDspCallbacks:(void *)a3
{
  void *dspCallbacks;

  dspCallbacks = self->_dspCallbacks;
  if (dspCallbacks)
  {
    (*(void (**)(void *, SEL))(*(_QWORD *)dspCallbacks + 8))(dspCallbacks, a2);
    self->_dspCallbacks = 0;
  }
  if (a3)
    self->_dspCallbacks = a3;
}

- (id)spatial_negotiateConfigurationChange:(void *)a3 error:(id *)a4
{
  int v7;
  CFTypeRef **v8;
  void **p_p;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  CFTypeRef *p_cf;
  uint64_t v18;
  CFMutableDictionaryRef *v19;
  uint64_t v20;
  void (***v21)();
  uint64_t v22;
  char v23;
  uint64_t *i;
  uint64_t v25;
  id v26;
  id v27;
  int v28;
  unint64_t v29;
  int v30;
  BOOL v31;
  id v32;
  id v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  CFTypeRef *v37;
  uint64_t v38;
  BOOL v40;
  _BOOL4 v41;
  __int128 v42;
  _OWORD *v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  char *v47;
  uint64_t v48;
  char *v49;
  _QWORD *v50;
  _QWORD *v51;
  char *v52;
  __int128 v53;
  int64x2_t v54;
  __CFDictionary **v55;
  __int128 v56;
  void (**v57)();
  _QWORD v58[2];
  _OWORD v59[3];
  __int128 v60;
  uint64_t v61;
  uint64_t v62;
  CFTypeRef cf;
  uint64_t v64;
  CFTypeRef *v65;
  _BYTE v66[24];
  _BYTE *v67;
  uint64_t v68;
  int v69;
  char v70;
  uint64_t v71;
  uint64_t *v72;
  _BYTE v73[8];
  uint64_t v74;
  _BYTE *v75;
  void *__p;
  _BYTE *v77;
  void **v78;
  _BYTE v79[24];
  CFTypeRef *v80;
  CFMutableDictionaryRef Mutable;
  int64x2_t v82;
  __CFDictionary **v83;
  char *v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  if (*((_BYTE *)a3 + 41))
    v7 = *((unsigned __int8 *)a3 + 40);
  else
    v7 = 0;
  -[DSP_HAL_Mock_IOProcessor testHookFetcher](self, "testHookFetcher");
  if (!*(_QWORD *)&v59[0])
  {
    v80 = 0;
    goto LABEL_48;
  }
  -[DSP_HAL_Mock_IOProcessor testHookFetcher](self, "testHookFetcher");
  if (!v83)
    std::__throw_bad_function_call[abi:ne180100]();
  (*((void (**)(CFTypeRef *__return_ptr))*v83 + 6))(&cf);
  if (!v65)
  {
    v8 = &v80;
    goto LABEL_11;
  }
  if (v65 != &cf)
  {
    v8 = &v65;
    v80 = v65;
LABEL_11:
    *v8 = 0;
    goto LABEL_13;
  }
  v80 = (CFTypeRef *)v79;
  (*((void (**)(CFTypeRef *, _BYTE *))cf + 3))(&cf, v79);
LABEL_13:
  p_p = v78;
  if (v78 == &__p)
  {
    v10 = 4;
    p_p = &__p;
  }
  else
  {
    if (!v78)
      goto LABEL_18;
    v10 = 5;
  }
  (*((void (**)(void))*p_p + v10))();
LABEL_18:
  v11 = v75;
  if (v75 == v73)
  {
    v12 = 4;
    v11 = v73;
  }
  else
  {
    if (!v75)
      goto LABEL_23;
    v12 = 5;
  }
  (*(void (**)(void))(*v11 + 8 * v12))();
LABEL_23:
  v13 = v72;
  if (v72 == &v68)
  {
    v14 = 4;
    v13 = &v68;
  }
  else
  {
    if (!v72)
      goto LABEL_28;
    v14 = 5;
  }
  (*(void (**)(void))(*v13 + 8 * v14))();
LABEL_28:
  v15 = v67;
  if (v67 == v66)
  {
    v16 = 4;
    v15 = v66;
  }
  else
  {
    if (!v67)
      goto LABEL_33;
    v16 = 5;
  }
  (*(void (**)(void))(*v15 + 8 * v16))();
LABEL_33:
  p_cf = v65;
  if (v65 == &cf)
  {
    v18 = 4;
    p_cf = &cf;
  }
  else
  {
    if (!v65)
      goto LABEL_38;
    v18 = 5;
  }
  (*((void (**)(void))*p_cf + v18))();
LABEL_38:
  v19 = v83;
  if (v83 == &Mutable)
  {
    v20 = 4;
    v19 = &Mutable;
  }
  else
  {
    if (!v83)
      goto LABEL_43;
    v20 = 5;
  }
  (*((void (**)(void))*v19 + v20))();
LABEL_43:
  v21 = *(void (****)())&v59[0];
  if (*(void (****)())&v59[0] == &v57)
  {
    v22 = 4;
    v21 = &v57;
  }
  else
  {
    if (!*(_QWORD *)&v59[0])
      goto LABEL_48;
    v22 = 5;
  }
  (*v21)[v22]();
LABEL_48:
  if (v80)
  {
    DSP_Host_Types::DSP_Host_DictionaryData<DSP_Host_Types::ConfigurationChangeRequest>::operator applesauce::CF::DictionaryRef((applesauce::CF::DictionaryRef *)&cf, (uint64_t)a3);
    if (!v80)
      std::__throw_bad_function_call[abi:ne180100]();
    v23 = (*((uint64_t (**)(CFTypeRef *, CFTypeRef *))*v80 + 6))(v80, &cf);
    if (cf)
      CFRelease(cf);
    if ((v23 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MockDSP Failure"), -1, 0);
      v27 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_93;
    }
  }
  for (i = (uint64_t *)*((_QWORD *)a3 + 82); ; i += 2)
  {
    if (i == *((uint64_t **)a3 + 83))
    {
      if (a4)
      {
        v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
        *a4 = (id)objc_msgSend(v26, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 2003329396, 0);
      }
      goto LABEL_60;
    }
    v25 = *i;
    if (*(_BYTE *)(*i + 64))
    {
      if (*(_BYTE *)(v25 + 240))
        break;
    }
  }
  if (*(_QWORD *)(v25 + 688) == *(_QWORD *)(v25 + 696))
  {
    if (a4)
    {
      v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
      *a4 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 2003329396, 0);
    }
LABEL_60:
    v27 = objc_alloc_init(MEMORY[0x1E0C99D88]);
    goto LABEL_93;
  }
  v58[0] = 0;
  v58[1] = 0;
  v57 = (void (**)())&off_1E699E820;
  memset(v59, 0, sizeof(v59));
  v60 = 0u;
  v61 = 0;
  v62 = -1;
  DSP_Host_Types::FormatDescription::FormatDescription((DSP_Host_Types::FormatDescription *)&cf, (const DSP_Host_Types::FormatDescription *)((char *)a3 + 272));
  if (v7)
  {
    if (*((_BYTE *)a3 + 516))
    {
      v28 = *((_DWORD *)a3 + 128);
      if (v28)
      {
        if (v28 != 0x10000)
        {
          v30 = (unsigned __int16)*((_DWORD *)a3 + 128);
          goto LABEL_82;
        }
        if (*((_BYTE *)a3 + 540))
        {
          v29 = *((unsigned int *)a3 + 134);
          if ((_DWORD)v29)
          {
            v30 = 0;
            do
            {
              v30 += v29 & 1;
              v31 = v29 >= 2;
              v29 >>= 1;
            }
            while (v31);
          }
          else
          {
            v30 = 0;
          }
LABEL_82:
          v69 = v30;
          v70 = 1;
        }
      }
      else if (*((_BYTE *)a3 + 564))
      {
        v30 = *((_DWORD *)a3 + 140);
        goto LABEL_82;
      }
    }
    v35 = __p;
    v34 = v77;
    v36 = (v77 - (_BYTE *)__p) >> 3;
    if (v77 != __p)
    {
      do
      {
        v36 -= (*(unsigned int (**)(_QWORD))(*(_QWORD *)*v35 + 32))(*v35);
        ++v35;
      }
      while (v35 != v34);
    }
    if (!v36 && v70 && BYTE4(v75) && v73[1])
    {
      v40 = v73[0] || v69 == 1;
      v41 = v40;
      if ((_DWORD)v75 == 1 && v41)
      {
        std::allocate_shared[abi:ne180100]<DSP_Host_Types::FormatDescription,std::allocator<DSP_Host_Types::FormatDescription>,DSP_Host_Types::FormatDescription&,void>((uint64_t *)&v56, (const DSP_Host_Types::FormatDescription *)&cf);
        v42 = v59[2];
        if (*(_QWORD *)&v59[2] >= *((_QWORD *)&v59[2] + 1))
        {
          v44 = (uint64_t)(*(_QWORD *)&v59[2] - *((_QWORD *)&v59[1] + 1)) >> 4;
          if ((unint64_t)(v44 + 1) >> 60)
            std::vector<std::tuple<std::pair<std::string,std::string>,std::shared_ptr<AMCP::Log::Scope>>>::__throw_length_error[abi:ne180100]();
          v45 = (uint64_t)(*((_QWORD *)&v59[2] + 1) - *((_QWORD *)&v59[1] + 1)) >> 3;
          if (v45 <= v44 + 1)
            v45 = v44 + 1;
          if (*((_QWORD *)&v59[2] + 1) - *((_QWORD *)&v59[1] + 1) >= 0x7FFFFFFFFFFFFFF0uLL)
            v46 = 0xFFFFFFFFFFFFFFFLL;
          else
            v46 = v45;
          v84 = (char *)&v59[2] + 8;
          v47 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CA::ValueRange>>(v46);
          v49 = &v47[16 * v44];
          *(_OWORD *)v49 = v56;
          v56 = 0uLL;
          v51 = (_QWORD *)*((_QWORD *)&v59[1] + 1);
          v50 = *(_QWORD **)&v59[2];
          if (*(_QWORD *)&v59[2] == *((_QWORD *)&v59[1] + 1))
          {
            v54 = vdupq_n_s64(*(unint64_t *)&v59[2]);
            v52 = &v47[16 * v44];
          }
          else
          {
            v52 = &v47[16 * v44];
            do
            {
              v53 = *((_OWORD *)v50 - 1);
              v50 -= 2;
              *((_OWORD *)v52 - 1) = v53;
              v52 -= 16;
              *v50 = 0;
              v50[1] = 0;
            }
            while (v50 != v51);
            v54 = *(int64x2_t *)((char *)&v59[1] + 8);
          }
          v43 = v49 + 16;
          *((_QWORD *)&v59[1] + 1) = v52;
          *(_QWORD *)&v59[2] = v49 + 16;
          v82 = v54;
          v55 = (__CFDictionary **)*((_QWORD *)&v59[2] + 1);
          *((_QWORD *)&v59[2] + 1) = &v47[16 * v48];
          v83 = v55;
          Mutable = (CFMutableDictionaryRef)v54.i64[0];
          std::__split_buffer<std::shared_ptr<DSP_Host_Types::FormatDescription>>::~__split_buffer((uint64_t)&Mutable);
        }
        else
        {
          **(_OWORD **)&v59[2] = v56;
          v43 = (_OWORD *)(v42 + 16);
        }
        *(_QWORD *)&v59[2] = v43;
      }
    }
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B398], MEMORY[0x1E0C9B3A8]);
    ((void (*)(DSP_Host_Types::NegotiateResponse *, __CFDictionary **))v57[3])((DSP_Host_Types::NegotiateResponse *)&v57, &Mutable);
    mcp_applesauce::CF::Dictionary_Builder::get_dictionary((applesauce::CF::DictionaryRef *)&v56, Mutable);
    if (Mutable)
      CFRelease(Mutable);
    v33 = (id)v56;
    v27 = v33;
    if (v33)
LABEL_89:
      CFRelease(v33);
  }
  else
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B398], MEMORY[0x1E0C9B3A8]);
    ((void (*)(DSP_Host_Types::NegotiateResponse *, __CFDictionary **))v57[3])((DSP_Host_Types::NegotiateResponse *)&v57, &Mutable);
    mcp_applesauce::CF::Dictionary_Builder::get_dictionary((applesauce::CF::DictionaryRef *)&v56, Mutable);
    if (Mutable)
      CFRelease(Mutable);
    v33 = (id)v56;
    v27 = v33;
    if (v33)
      goto LABEL_89;
  }
  cf = &off_1E699D270;
  if (__p)
  {
    v77 = __p;
    operator delete(__p);
  }
  DSP_Dictionariable::DictionariableKvp::~DictionariableKvp((DSP_Dictionariable::DictionariableKvp *)&v74);
  DSP_Dictionariable::DictionariableKvp::~DictionariableKvp((DSP_Dictionariable::DictionariableKvp *)&v71);
  DSP_Dictionariable::DictionariableKvp::~DictionariableKvp((DSP_Dictionariable::DictionariableKvp *)&v67);
  DSP_Dictionariable::DictionariableKvp::~DictionariableKvp((DSP_Dictionariable::DictionariableKvp *)&v65);
  cf = off_1E699D2B0;
  std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v64);
  v57 = (void (**)())&off_1E699E820;
  cf = &v60;
  std::vector<std::shared_ptr<unsigned long long>>::__destroy_vector::operator()[abi:ne180100]((void ***)&cf);
  cf = (char *)&v59[1] + 8;
  std::vector<std::shared_ptr<unsigned long long>>::__destroy_vector::operator()[abi:ne180100]((void ***)&cf);
  cf = v59;
  std::vector<std::shared_ptr<unsigned long long>>::__destroy_vector::operator()[abi:ne180100]((void ***)&cf);
  v57 = off_1E699E860;
  std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)v58);
LABEL_93:
  v37 = v80;
  if (v80 == (CFTypeRef *)v79)
  {
    v38 = 4;
    v37 = (CFTypeRef *)v79;
LABEL_97:
    (*((void (**)(void))*v37 + v38))();
  }
  else if (v80)
  {
    v38 = 5;
    goto LABEL_97;
  }
  return v27;
}

- (id)conference_negotiateConfigurationChange:(void *)a3 error:(id *)a4
{
  int v7;
  int v8;
  BOOL v9;
  _BOOL4 v10;
  AMCP::Log::Scope_Registry *v11;
  _BOOL4 v12;
  NSObject *v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  int v23;
  double v24;
  _QWORD *v25;
  uint64_t *i;
  uint64_t v28;
  uint64_t *j;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  BOOL v35;
  _BOOL4 v36;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  _OWORD *v42;
  uint64_t v43;
  _QWORD *v44;
  _QWORD *v45;
  _OWORD *v46;
  __int128 v47;
  int64x2_t v48;
  _OWORD *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t *v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  _QWORD *v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  _OWORD *v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  char *v66;
  uint64_t v67;
  char *v68;
  _QWORD *v69;
  _QWORD *v70;
  char *v71;
  __int128 v72;
  int64x2_t v73;
  _opaque_pthread_t *v74;
  mach_port_t v75;
  unint64_t v76;
  char *v77;
  int v78;
  char *v79;
  const char *v81;
  uint64_t v82;
  _QWORD *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  __int16 v87;
  uint64_t v88;
  uint64_t v89;
  char v90;
  BOOL v91;
  BOOL v93;
  _BOOL4 v94;
  BOOL v95;
  uint64_t v96;
  std::__shared_weak_count *v97;
  unint64_t *v98;
  unint64_t v99;
  uint64_t v100;
  _OWORD *v101;
  uint64_t v102;
  unint64_t v103;
  unint64_t v104;
  char *v105;
  uint64_t v106;
  char *v107;
  _QWORD *v108;
  _QWORD *v109;
  char *v110;
  __int128 v111;
  int64x2_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t *v116;
  unint64_t v117;
  unint64_t *p_shared_owners;
  unint64_t v119;
  double v120;
  double v121;
  uint64_t v122;
  std::__shared_weak_count *v123;
  unint64_t *v124;
  unint64_t v125;
  id v126;
  std::__shared_weak_count *v127;
  unint64_t *v128;
  unint64_t v129;
  __int128 v131;
  __int128 v132;
  void (**v133)();
  _QWORD v134[2];
  int64x2_t v135;
  _OWORD v136[2];
  int64x2_t v137;
  _QWORD v138[2];
  _BYTE v139[24];
  uint64_t v140;
  _OWORD *v141;
  CFTypeRef cf;
  int64x2_t v143;
  uint64_t v144;
  _QWORD *v145;
  double v146;
  char v147;
  uint64_t v148;
  int v149;
  char v150;
  uint64_t v151;
  uint64_t v152;
  void *__p;
  _BYTE *v154;
  uint64_t v155;

  v155 = *MEMORY[0x1E0C80C00];
  if (*((_BYTE *)a3 + 41))
    v7 = *((unsigned __int8 *)a3 + 40);
  else
    v7 = 0;
  if (*((_QWORD *)a3 + 14))
    v8 = *(_DWORD *)(*((_QWORD *)a3 + 12) + 28);
  else
    v8 = 1;
  DSP_Host_Types::DSP_Host_DictionaryData<DSP_Host_Types::ConfigurationChangeRequest>::operator applesauce::CF::DictionaryRef((applesauce::CF::DictionaryRef *)&cf, (uint64_t)a3);
  v9 = -[DSP_HAL_Mock_IOProcessor callNegotiateHook:](self, "callNegotiateHook:", &cf);
  if (cf)
    CFRelease(cf);
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MockDSP Failure"), -1, 0);
    v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    return v18;
  }
  if (v7)
  {
    v10 = (~-[DSP_HAL_Mock_IOProcessor featureFlag](self, "featureFlag") & 0x21) != 0 && v8 != 6;
    v11 = (AMCP::Log::Scope_Registry *)-[DSP_HAL_Mock_IOProcessor featureFlag](self, "featureFlag");
    v12 = (v11 & 0x41) == 65;
    if ((v11 & 0x41) == 0x41 && v8 == 6)
    {
      AMCP::Log::Scope_Registry::get(v11);
      AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&cf, "com.apple.coreaudio", "AMCP");
      v14 = *(NSObject **)cf;
      AMCP::Log::Scope::get_os_log_t(*(id *)cf);
      objc_claimAutoreleasedReturnValue();
      v15 = (std::__shared_weak_count *)v143.i64[0];
      if (v143.i64[0])
      {
        v16 = (unint64_t *)(v143.i64[0] + 8);
        do
          v17 = __ldaxr(v16);
        while (__stlxr(v17 - 1, v16));
        if (!v17)
        {
          ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
          std::__shared_weak_count::__release_weak(v15);
        }
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v74 = pthread_self();
        v75 = pthread_mach_thread_np(v74);
        v76 = 0;
        v77 = 0;
        v78 = 47;
        do
        {
          v79 = &aLibraryCachesC_10[v76];
          if (v78 == 47)
            v77 = &aLibraryCachesC_10[v76];
          v78 = v79[1];
          if (!v79[1])
            break;
        }
        while (v76++ < 0xFFF);
        if (v77)
          v81 = v77 + 1;
        else
          v81 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/DSP/Factories/DSP_HAL_MockFeature_Processors.mm";
        LODWORD(cf) = 67109634;
        HIDWORD(cf) = v75;
        v143.i16[0] = 2080;
        *(uint64_t *)((char *)v143.i64 + 2) = (uint64_t)v81;
        v143.i16[5] = 1024;
        v143.i32[3] = 455;
        _os_log_debug_impl(&dword_1B57BA000, v14, OS_LOG_TYPE_DEBUG, "%6u %32s:%-5d [hal_dsp] MOCK WARNING: It is not normal for VAD to request format changes.", (uint8_t *)&cf, 0x18u);
      }

    }
  }
  else
  {
    v12 = 0;
    v10 = 0;
  }
  v19 = *((_QWORD *)a3 + 82);
  v20 = *((_QWORD *)a3 + 83);
  if (v19 == v20)
    goto LABEL_92;
  v21 = 0;
  v22 = 0;
  v23 = 0;
  v24 = 0.0;
  while (1)
  {
    v25 = *(_QWORD **)v19;
    if (*(_BYTE *)(*(_QWORD *)v19 + 64) && *((_BYTE *)v25 + 240))
    {
      if (v24 == 0.0 && v25[83] != v25[84])
        v21 = *(_QWORD **)v19;
      if (v25[89] != v25[90])
        v22 = *(_QWORD **)v19;
      if (v21)
      {
        for (i = (uint64_t *)v21[89]; i != (uint64_t *)v21[90]; i += 2)
        {
          v28 = *i;
          if (*(_BYTE *)(*i + 44) && *(_DWORD *)(v28 + 40) == 2)
          {
            if (*(_BYTE *)(v28 + 188))
              v23 = *(_DWORD *)(v28 + 184);
            else
              v23 = 0;
            break;
          }
        }
        for (j = (uint64_t *)v21[83]; j != (uint64_t *)v21[84] && v24 == 0.0; j += 2)
        {
          v30 = *j;
          v31 = *(_QWORD *)(*j + 336);
          v32 = *(_QWORD *)(*j + 344);
          if (v31 != v32 && *(_BYTE *)(v30 + 160) && *(_BYTE *)(v30 + 44) && *(_DWORD *)(v30 + 40) == 1)
          {
            if (!v10)
            {
              v24 = *(double *)(v30 + 152);
              break;
            }
            while (1)
            {
              if (*(_BYTE *)(v31 + 48))
              {
                v33 = !*(_BYTE *)(v31 + 76) || *(_BYTE *)(v31 + 124) == 0;
                if (!v33 && *(_BYTE *)(v31 + 97) != 0)
                {
                  v35 = *(_BYTE *)(v31 + 96) || *(_DWORD *)(v31 + 72) == 1;
                  v36 = v35;
                  if (*(_DWORD *)(v31 + 120) == 1 && v36)
                  {
                    v24 = *(double *)(v31 + 40);
                    if (v24 != *(double *)(v30 + 152))
                      break;
                  }
                }
              }
              v31 += 152;
              if (v31 == v32)
              {
                v24 = *(double *)(v30 + 152);
                break;
              }
            }
          }
        }
      }
      if (v22)
        break;
    }
LABEL_90:
    v19 += 16;
    if (v19 == v20)
      goto LABEL_91;
  }
  v38 = *((_BYTE *)v22 + 64) ? v22 : 0;
  v39 = v38[89];
  v40 = v38[90];
  while (v39 != v40)
  {
    if (!*(_BYTE *)(*(_QWORD *)v39 + 44) || *(_DWORD *)(*(_QWORD *)v39 + 40) != 2)
    {
      v22 = 0;
      goto LABEL_90;
    }
    v39 += 16;
  }
  if (v24 == 0.0)
    goto LABEL_90;
LABEL_91:
  if (v24 == 0.0)
  {
LABEL_92:
    if (a4)
    {
      v41 = objc_alloc(MEMORY[0x1E0CB35C8]);
      *a4 = (id)objc_msgSend(v41, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 2003329396, 0);
    }
    v18 = objc_alloc_init(MEMORY[0x1E0C99D88]);
    return v18;
  }
  v134[0] = 0;
  v134[1] = 0;
  v133 = (void (**)())&off_1E699E820;
  v135 = 0u;
  memset(v136, 0, sizeof(v136));
  v137 = 0u;
  v138[0] = 0;
  v138[1] = -1;
  std::allocate_shared[abi:ne180100]<DSP_Host_Types::DeviceConfiguration,std::allocator<DSP_Host_Types::DeviceConfiguration>,char const(&)[1],void>(v139, "");
  v145 = v138;
  v42 = std::__allocate_at_least[abi:ne180100]<std::allocator<CA::ValueRange>>(1uLL);
  *v42 = *(_OWORD *)v139;
  *(_OWORD *)v139 = 0uLL;
  v44 = (_QWORD *)v137.i64[1];
  v45 = (_QWORD *)v137.i64[0];
  if (v137.i64[1] == v137.i64[0])
  {
    v48 = vdupq_n_s64(v137.u64[1]);
    v46 = v42;
  }
  else
  {
    v46 = v42;
    do
    {
      v47 = *((_OWORD *)v44 - 1);
      v44 -= 2;
      *--v46 = v47;
      *v44 = 0;
      v44[1] = 0;
    }
    while (v44 != v45);
    v48 = v137;
  }
  v49 = v42 + 1;
  v137.i64[0] = (uint64_t)v46;
  v143 = v48;
  v50 = v138[0];
  v138[0] = &v42[v43];
  v144 = v50;
  cf = (CFTypeRef)v48.i64[0];
  std::__split_buffer<std::shared_ptr<DSP_Host_Types::FormatDescription>>::~__split_buffer((uint64_t)&cf);
  v137.i64[1] = (uint64_t)v49;
  v51 = *((_QWORD *)v49 - 2);
  *(_QWORD *)&v132 = v51;
  v52 = *((_QWORD *)v49 - 1);
  *((_QWORD *)&v132 + 1) = v52;
  if (v52)
  {
    v53 = (unint64_t *)(v52 + 8);
    do
      v54 = __ldxr(v53);
    while (__stxr(v54 + 1, v53));
  }
  DSP_Dictionariable::SingleKvp<std::string>::operator=(v51 + 24, (uint64_t)(v21 + 3));
  if (v10)
  {
    v55 = v132;
    *(double *)(v132 + 88) = v24;
    *(_BYTE *)(v55 + 96) = 1;
  }
  if (v23)
  {
    v56 = v132;
    *(_WORD *)(v132 + 120) = v7 | 0x100;
    *(_DWORD *)(v56 + 168) = v23;
    LOBYTE(v10) = 1;
    *(_BYTE *)(v56 + 172) = 1;
  }
  if (v12)
  {
    DSP_Host_Types::FormatDescription::FormatDescription((DSP_Host_Types::FormatDescription *)&cf, (const DSP_Host_Types::FormatDescription *)((char *)a3 + 120));
    v58 = __p;
    v57 = v154;
    v59 = (v154 - (_BYTE *)__p) >> 3;
    if (v154 != __p)
    {
      do
      {
        v59 -= (*(unsigned int (**)(_QWORD))(*(_QWORD *)*v58 + 32))(*v58);
        ++v58;
      }
      while (v58 != v57);
    }
    if (!v59)
    {
      v146 = v24;
      v147 = 1;
      if (!v150)
        std::__throw_bad_optional_access[abi:ne180100]();
      if (v149 == 1)
        v60 = 2;
      else
        v60 = 1;
      v149 = v60;
      v150 = 1;
      std::allocate_shared[abi:ne180100]<DSP_Host_Types::FormatDescription,std::allocator<DSP_Host_Types::FormatDescription>,DSP_Host_Types::FormatDescription&,void>((uint64_t *)&v131, (const DSP_Host_Types::FormatDescription *)&cf);
      v61 = v135.i64[1];
      if (v135.i64[1] >= *(_QWORD *)&v136[0])
      {
        v63 = (v135.i64[1] - v135.i64[0]) >> 4;
        if ((unint64_t)(v63 + 1) >> 60)
          std::vector<std::tuple<std::pair<std::string,std::string>,std::shared_ptr<AMCP::Log::Scope>>>::__throw_length_error[abi:ne180100]();
        v64 = (*(_QWORD *)&v136[0] - v135.i64[0]) >> 3;
        if (v64 <= v63 + 1)
          v64 = v63 + 1;
        if (*(_QWORD *)&v136[0] - v135.i64[0] >= 0x7FFFFFFFFFFFFFF0uLL)
          v65 = 0xFFFFFFFFFFFFFFFLL;
        else
          v65 = v64;
        v141 = v136;
        v66 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CA::ValueRange>>(v65);
        v68 = &v66[16 * v63];
        *(_OWORD *)v68 = v131;
        v131 = 0uLL;
        v69 = (_QWORD *)v135.i64[1];
        v70 = (_QWORD *)v135.i64[0];
        if (v135.i64[1] == v135.i64[0])
        {
          v73 = vdupq_n_s64(v135.u64[1]);
          v71 = &v66[16 * v63];
        }
        else
        {
          v71 = &v66[16 * v63];
          do
          {
            v72 = *((_OWORD *)v69 - 1);
            v69 -= 2;
            *((_OWORD *)v71 - 1) = v72;
            v71 -= 16;
            *v69 = 0;
            v69[1] = 0;
          }
          while (v69 != v70);
          v73 = v135;
        }
        v62 = v68 + 16;
        v135.i64[0] = (uint64_t)v71;
        v135.i64[1] = (uint64_t)(v68 + 16);
        *(int64x2_t *)&v139[8] = v73;
        v82 = *(_QWORD *)&v136[0];
        *(_QWORD *)&v136[0] = &v66[16 * v67];
        v140 = v82;
        *(_QWORD *)v139 = v73.i64[0];
        std::__split_buffer<std::shared_ptr<DSP_Host_Types::FormatDescription>>::~__split_buffer((uint64_t)v139);
      }
      else
      {
        *(_OWORD *)v135.i64[1] = v131;
        v62 = (_OWORD *)(v61 + 16);
      }
      v135.i64[1] = (uint64_t)v62;
    }
    cf = &off_1E699D270;
    if (__p)
    {
      v154 = __p;
      operator delete(__p);
    }
    DSP_Dictionariable::DictionariableKvp::~DictionariableKvp((DSP_Dictionariable::DictionariableKvp *)&v152);
    DSP_Dictionariable::DictionariableKvp::~DictionariableKvp((DSP_Dictionariable::DictionariableKvp *)&v151);
    DSP_Dictionariable::DictionariableKvp::~DictionariableKvp((DSP_Dictionariable::DictionariableKvp *)&v148);
    DSP_Dictionariable::DictionariableKvp::~DictionariableKvp((DSP_Dictionariable::DictionariableKvp *)&v144);
    cf = off_1E699D2B0;
    std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v143);
  }
  if (!v10)
    v137.i64[1] = std::shared_ptr<AMCP::Log::Scope>::~shared_ptr[abi:ne180100](v137.i64[1] - 16);
  if (v22)
  {
    v83 = v22 + 89;
    v84 = 89;
    if (v22[89] == v22[90])
    {
      v84 = 86;
      v83 = v22 + 86;
    }
    v85 = v22[v84];
    v86 = v83[1];
    if (v85 != v86)
    {
      v87 = v7 | 0x100;
      do
      {
        v89 = *(_QWORD *)(*(_QWORD *)v85 + 336);
        v88 = *(_QWORD *)(*(_QWORD *)v85 + 344);
        if (v89 == v88)
        {
          v90 = 0;
        }
        else
        {
          v90 = 0;
          do
          {
            if (*(_BYTE *)(v89 + 76))
              v91 = *(_BYTE *)(v89 + 124) == 0;
            else
              v91 = 1;
            if (!v91 && *(_BYTE *)(v89 + 97) != 0)
            {
              v93 = *(_BYTE *)(v89 + 96) || *(_DWORD *)(v89 + 72) == 1;
              v94 = v93;
              v95 = *(_DWORD *)(v89 + 120) != 1 || !v94;
              if (!v95 && *(_BYTE *)(v89 + 48) && *(double *)(v89 + 40) == v24)
              {
                v97 = (std::__shared_weak_count *)*((_QWORD *)&v132 + 1);
                v96 = v132;
                *(_OWORD *)v139 = v132;
                if (*((_QWORD *)&v132 + 1))
                {
                  v98 = (unint64_t *)(*((_QWORD *)&v132 + 1) + 8);
                  do
                    v99 = __ldxr(v98);
                  while (__stxr(v99 + 1, v98));
                }
                if (v21 != v22)
                {
                  std::allocate_shared[abi:ne180100]<DSP_Host_Types::DeviceConfiguration,std::allocator<DSP_Host_Types::DeviceConfiguration>,char const(&)[1],void>(&v131, "");
                  v100 = v137.i64[1];
                  if (v137.i64[1] >= v138[0])
                  {
                    v102 = (v137.i64[1] - v137.i64[0]) >> 4;
                    if ((unint64_t)(v102 + 1) >> 60)
                      std::vector<std::tuple<std::pair<std::string,std::string>,std::shared_ptr<AMCP::Log::Scope>>>::__throw_length_error[abi:ne180100]();
                    v103 = (v138[0] - v137.i64[0]) >> 3;
                    if (v103 <= v102 + 1)
                      v103 = v102 + 1;
                    if (v138[0] - v137.i64[0] >= 0x7FFFFFFFFFFFFFF0uLL)
                      v104 = 0xFFFFFFFFFFFFFFFLL;
                    else
                      v104 = v103;
                    v145 = v138;
                    v105 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CA::ValueRange>>(v104);
                    v107 = &v105[16 * v102];
                    *(_OWORD *)v107 = v131;
                    v131 = 0uLL;
                    v108 = (_QWORD *)v137.i64[1];
                    v109 = (_QWORD *)v137.i64[0];
                    if (v137.i64[1] == v137.i64[0])
                    {
                      v112 = vdupq_n_s64(v137.u64[1]);
                      v110 = &v105[16 * v102];
                    }
                    else
                    {
                      v110 = &v105[16 * v102];
                      do
                      {
                        v111 = *((_OWORD *)v108 - 1);
                        v108 -= 2;
                        *((_OWORD *)v110 - 1) = v111;
                        v110 -= 16;
                        *v108 = 0;
                        v108[1] = 0;
                      }
                      while (v108 != v109);
                      v112 = v137;
                    }
                    v101 = v107 + 16;
                    v137.i64[0] = (uint64_t)v110;
                    v137.i64[1] = (uint64_t)(v107 + 16);
                    v143 = v112;
                    v113 = v138[0];
                    v138[0] = &v105[16 * v106];
                    v144 = v113;
                    cf = (CFTypeRef)v112.i64[0];
                    std::__split_buffer<std::shared_ptr<DSP_Host_Types::FormatDescription>>::~__split_buffer((uint64_t)&cf);
                  }
                  else
                  {
                    *(_OWORD *)v137.i64[1] = v131;
                    v101 = (_OWORD *)(v100 + 16);
                  }
                  v137.i64[1] = (uint64_t)v101;
                  v115 = *((_QWORD *)v101 - 2);
                  v114 = *((_QWORD *)v101 - 1);
                  if (v114)
                  {
                    v116 = (unint64_t *)(v114 + 8);
                    do
                      v117 = __ldxr(v116);
                    while (__stxr(v117 + 1, v116));
                  }
                  *(_QWORD *)v139 = v115;
                  *(_QWORD *)&v139[8] = v114;
                  if (v97)
                  {
                    p_shared_owners = (unint64_t *)&v97->__shared_owners_;
                    do
                      v119 = __ldaxr(p_shared_owners);
                    while (__stlxr(v119 - 1, p_shared_owners));
                    if (!v119)
                    {
                      ((void (*)(std::__shared_weak_count *))v97->__on_zero_shared)(v97);
                      std::__shared_weak_count::__release_weak(v97);
                    }
                  }
                  v96 = *(_QWORD *)v139;
                }
                DSP_Dictionariable::SingleKvp<std::string>::operator=(v96 + 24, (uint64_t)(v22 + 3));
                v120 = 0.0;
                v121 = 0.0;
                if (*(_BYTE *)(*(_QWORD *)v85 + 160))
                  v121 = *(double *)(*(_QWORD *)v85 + 152);
                if (*(_BYTE *)(v89 + 48))
                  v120 = *(double *)(v89 + 40);
                v122 = *(_QWORD *)v139;
                if (v121 != v120)
                  DSP_Dictionariable::SingleKvp<double>::operator=(*(_QWORD *)v139 + 72, v89 + 24);
                *(_WORD *)(v122 + 120) = v87;
                if (!*(_BYTE *)(v89 + 76))
                  std::__throw_bad_optional_access[abi:ne180100]();
                *(_DWORD *)(v122 + 168) = *(_DWORD *)(v89 + 72);
                *(_BYTE *)(v122 + 172) = 1;
                v123 = *(std::__shared_weak_count **)&v139[8];
                if (*(_QWORD *)&v139[8])
                {
                  v124 = (unint64_t *)(*(_QWORD *)&v139[8] + 8);
                  do
                    v125 = __ldaxr(v124);
                  while (__stlxr(v125 - 1, v124));
                  if (!v125)
                  {
                    ((void (*)(std::__shared_weak_count *))v123->__on_zero_shared)(v123);
                    std::__shared_weak_count::__release_weak(v123);
                  }
                }
                v90 = 1;
              }
            }
            v89 += 152;
          }
          while (v89 != v88);
        }
        v85 += 16;
      }
      while (v85 != v86 && (v90 & 1) == 0);
    }
    cf = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B398], MEMORY[0x1E0C9B3A8]);
    ((void (*)(DSP_Host_Types::NegotiateResponse *, __CFDictionary **))v133[3])((DSP_Host_Types::NegotiateResponse *)&v133, (__CFDictionary **)&cf);
    mcp_applesauce::CF::Dictionary_Builder::get_dictionary((applesauce::CF::DictionaryRef *)v139, cf);
    if (cf)
      CFRelease(cf);
    v126 = *(id *)v139;
    v18 = v126;
    if (!v126)
      goto LABEL_224;
  }
  else
  {
    cf = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B398], MEMORY[0x1E0C9B3A8]);
    ((void (*)(DSP_Host_Types::NegotiateResponse *, __CFDictionary **))v133[3])((DSP_Host_Types::NegotiateResponse *)&v133, (__CFDictionary **)&cf);
    mcp_applesauce::CF::Dictionary_Builder::get_dictionary((applesauce::CF::DictionaryRef *)v139, cf);
    if (cf)
      CFRelease(cf);
    v126 = *(id *)v139;
    v18 = v126;
    if (!v126)
      goto LABEL_224;
  }
  CFRelease(v126);
LABEL_224:
  v127 = (std::__shared_weak_count *)*((_QWORD *)&v132 + 1);
  if (*((_QWORD *)&v132 + 1))
  {
    v128 = (unint64_t *)(*((_QWORD *)&v132 + 1) + 8);
    do
      v129 = __ldaxr(v128);
    while (__stlxr(v129 - 1, v128));
    if (!v129)
    {
      ((void (*)(std::__shared_weak_count *))v127->__on_zero_shared)(v127);
      std::__shared_weak_count::__release_weak(v127);
    }
  }
  v133 = (void (**)())&off_1E699E820;
  cf = &v137;
  std::vector<std::shared_ptr<unsigned long long>>::__destroy_vector::operator()[abi:ne180100]((void ***)&cf);
  cf = (char *)v136 + 8;
  std::vector<std::shared_ptr<unsigned long long>>::__destroy_vector::operator()[abi:ne180100]((void ***)&cf);
  cf = &v135;
  std::vector<std::shared_ptr<unsigned long long>>::__destroy_vector::operator()[abi:ne180100]((void ***)&cf);
  v133 = off_1E699E860;
  std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)v134);
  return v18;
}

- (id)basic_negotiateConfigurationChange:(void *)a3 error:(id *)a4
{
  int v7;
  BOOL v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  id v20;
  BOOL v21;
  _BOOL4 v22;
  uint64_t v23;
  _OWORD *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  _QWORD *v31;
  _QWORD *v32;
  char *v33;
  __int128 v34;
  int64x2_t v35;
  uint64_t v36;
  __int128 v37;
  CFTypeRef cf;
  uint64_t v39;
  uint64_t v40;
  _DWORD v41[5];
  char v42;
  _BYTE v43[24];
  _DWORD v44[5];
  char v45;
  void *__p;
  _BYTE *v47;
  void (**v48)();
  _QWORD v49[2];
  int64x2_t v50;
  _QWORD v51[4];
  __int128 v52;
  uint64_t v53;
  uint64_t v54;
  CFMutableDictionaryRef Mutable;
  int64x2_t v56;
  uint64_t v57;
  _QWORD *v58;

  if (*((_BYTE *)a3 + 41))
    v7 = *((unsigned __int8 *)a3 + 40);
  else
    v7 = 0;
  DSP_Host_Types::DSP_Host_DictionaryData<DSP_Host_Types::ConfigurationChangeRequest>::operator applesauce::CF::DictionaryRef((applesauce::CF::DictionaryRef *)&cf, (uint64_t)a3);
  v8 = -[DSP_HAL_Mock_IOProcessor callNegotiateHook:](self, "callNegotiateHook:", &cf);
  if (cf)
    CFRelease(cf);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MockDSP Failure"), -1, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    return 0;
  }
  if (v7)
  {
    v9 = (uint64_t *)*((_QWORD *)a3 + 82);
    v10 = (uint64_t *)*((_QWORD *)a3 + 83);
    if (v9 != v10)
    {
      while (1)
      {
        v11 = *v9;
        if (*(_BYTE *)(*v9 + 64))
        {
          if (*(_BYTE *)(v11 + 240))
            break;
        }
        v9 += 2;
        if (v9 == v10)
          goto LABEL_12;
      }
      if (*(_QWORD *)(v11 + 664) != *(_QWORD *)(v11 + 672))
      {
        v48 = (void (**)())&off_1E699E820;
        v49[0] = 0;
        v50 = 0u;
        memset(v51, 0, sizeof(v51));
        v52 = 0u;
        v49[1] = 0;
        v53 = 0;
        v54 = -1;
        DSP_Host_Types::FormatDescription::FormatDescription((DSP_Host_Types::FormatDescription *)&cf, (const DSP_Host_Types::FormatDescription *)((char *)a3 + 120));
        v18 = __p;
        v17 = v47;
        v19 = (v47 - (_BYTE *)__p) >> 3;
        if (v47 != __p)
        {
          do
          {
            v19 -= (*(unsigned int (**)(_QWORD))(*(_QWORD *)*v18 + 32))(*v18);
            ++v18;
          }
          while (v18 != v17);
        }
        if (!v19 && v42 && v45 && v43[17])
        {
          v21 = v43[16] || v41[4] == 1;
          v22 = v21;
          if (v44[4] == 1 && v22)
          {
            std::allocate_shared[abi:ne180100]<DSP_Host_Types::FormatDescription,std::allocator<DSP_Host_Types::FormatDescription>,DSP_Host_Types::FormatDescription&,void>((uint64_t *)&v37, (const DSP_Host_Types::FormatDescription *)&cf);
            v23 = v50.i64[1];
            if (v50.i64[1] >= v51[0])
            {
              v25 = (v50.i64[1] - v50.i64[0]) >> 4;
              if ((unint64_t)(v25 + 1) >> 60)
                std::vector<std::tuple<std::pair<std::string,std::string>,std::shared_ptr<AMCP::Log::Scope>>>::__throw_length_error[abi:ne180100]();
              v26 = (v51[0] - v50.i64[0]) >> 3;
              if (v26 <= v25 + 1)
                v26 = v25 + 1;
              if (v51[0] - v50.i64[0] >= 0x7FFFFFFFFFFFFFF0uLL)
                v27 = 0xFFFFFFFFFFFFFFFLL;
              else
                v27 = v26;
              v58 = v51;
              v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CA::ValueRange>>(v27);
              v30 = &v28[16 * v25];
              *(_OWORD *)v30 = v37;
              v37 = 0uLL;
              v31 = (_QWORD *)v50.i64[1];
              v32 = (_QWORD *)v50.i64[0];
              if (v50.i64[1] == v50.i64[0])
              {
                v35 = vdupq_n_s64(v50.u64[1]);
                v33 = &v28[16 * v25];
              }
              else
              {
                v33 = &v28[16 * v25];
                do
                {
                  v34 = *((_OWORD *)v31 - 1);
                  v31 -= 2;
                  *((_OWORD *)v33 - 1) = v34;
                  v33 -= 16;
                  *v31 = 0;
                  v31[1] = 0;
                }
                while (v31 != v32);
                v35 = v50;
              }
              v24 = v30 + 16;
              v50.i64[0] = (uint64_t)v33;
              v50.i64[1] = (uint64_t)(v30 + 16);
              v56 = v35;
              v36 = v51[0];
              v51[0] = &v28[16 * v29];
              v57 = v36;
              Mutable = (CFMutableDictionaryRef)v35.i64[0];
              std::__split_buffer<std::shared_ptr<DSP_Host_Types::FormatDescription>>::~__split_buffer((uint64_t)&Mutable);
            }
            else
            {
              *(_OWORD *)v50.i64[1] = v37;
              v24 = (_OWORD *)(v23 + 16);
            }
            v50.i64[1] = (uint64_t)v24;
          }
        }
        Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B398], MEMORY[0x1E0C9B3A8]);
        ((void (*)(void (***)(), CFMutableDictionaryRef *))v48[3])(&v48, &Mutable);
        mcp_applesauce::CF::Dictionary_Builder::get_dictionary((applesauce::CF::DictionaryRef *)&v37, Mutable);
        if (Mutable)
          CFRelease(Mutable);
        v20 = (id)v37;
        v16 = v20;
        if (v20)
          CFRelease(v20);
        cf = &off_1E699D270;
        if (__p)
        {
          v47 = __p;
          operator delete(__p);
        }
        DSP_Dictionariable::DictionariableKvp::~DictionariableKvp((DSP_Dictionariable::DictionariableKvp *)v44);
        DSP_Dictionariable::DictionariableKvp::~DictionariableKvp((DSP_Dictionariable::DictionariableKvp *)v43);
        DSP_Dictionariable::DictionariableKvp::~DictionariableKvp((DSP_Dictionariable::DictionariableKvp *)v41);
        DSP_Dictionariable::DictionariableKvp::~DictionariableKvp((DSP_Dictionariable::DictionariableKvp *)&v40);
        cf = off_1E699D2B0;
        std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v39);
        v48 = (void (**)())&off_1E699E820;
        cf = &v52;
        std::vector<std::shared_ptr<unsigned long long>>::__destroy_vector::operator()[abi:ne180100]((void ***)&cf);
        cf = &v51[1];
        std::vector<std::shared_ptr<unsigned long long>>::__destroy_vector::operator()[abi:ne180100]((void ***)&cf);
        cf = &v50;
        std::vector<std::shared_ptr<unsigned long long>>::__destroy_vector::operator()[abi:ne180100]((void ***)&cf);
        v48 = off_1E699E860;
        std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)v49);
        return v16;
      }
    }
LABEL_12:
    if (a4)
    {
      v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v13 = *MEMORY[0x1E0CB2FE0];
      v14 = 2003329396;
LABEL_17:
      *a4 = (id)objc_msgSend(v12, "initWithDomain:code:userInfo:", v13, v14, 0);
    }
  }
  else if (a4)
  {
    v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v13 = *MEMORY[0x1E0CB2FE0];
    v14 = 0;
    goto LABEL_17;
  }
  v16 = objc_alloc_init(MEMORY[0x1E0C99D88]);
  return v16;
}

- (id)simulateConfigurationChange:(id)a3 error:(id *)a4
{
  -[DSP_HAL_Mock_IOProcessor negotiateConfigurationChange:error:](self, "negotiateConfigurationChange:error:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)negotiateConfigurationChange:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  void *v12;
  CFTypeRef cf;
  void (**v15)(DSP_Host_Types::NegotiateRequest *__hidden);
  uint64_t v16;
  _BYTE v17[24];
  uint64_t v18;
  _QWORD v19[73];
  uint64_t v20;
  void **v21;

  v6 = a3;
  DSP_Host_Types::ConfigurationChangeRequest::ConfigurationChangeRequest((DSP_Host_Types::ConfigurationChangeRequest *)&v15);
  v15 = &off_1E69948D8;
  v7 = v6;
  v8 = v7;
  if (v7)
    CFRetain(v7);
  applesauce::CF::DictionaryRef::DictionaryRef((applesauce::CF::DictionaryRef *)&cf, v8);

  ((void (*)(DSP_Host_Types::ConfigurationChangeRequest *, CFDictionaryRef *))v15[4])((DSP_Host_Types::ConfigurationChangeRequest *)&v15, (CFDictionaryRef *)&cf);
  if (cf)
    CFRelease(cf);
  if (!v17[17] || !v17[16])
    -[DSP_HAL_Mock_IOProcessor setDspCallbacks:](self, "setDspCallbacks:", 0);
  if (!v19[5])
    goto LABEL_11;
  v9 = *(_DWORD *)(v19[3] + 28);
  if (v9 > 8)
  {
LABEL_14:
    -[DSP_HAL_Mock_IOProcessor conference_negotiateConfigurationChange:error:](self, "conference_negotiateConfigurationChange:error:", &v15, a4);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v10 = 1 << v9;
  if ((v10 & 0x10A) == 0)
  {
    if ((v10 & 0x30) != 0)
    {
      -[DSP_HAL_Mock_IOProcessor spatial_negotiateConfigurationChange:error:](self, "spatial_negotiateConfigurationChange:error:", &v15, a4);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_11:
  -[DSP_HAL_Mock_IOProcessor basic_negotiateConfigurationChange:error:](self, "basic_negotiateConfigurationChange:error:", &v15, a4);
  v11 = objc_claimAutoreleasedReturnValue();
LABEL_15:
  v12 = (void *)v11;
  v15 = &off_1E699D0D8;
  v21 = (void **)&v20;
  std::vector<std::shared_ptr<unsigned long long>>::__destroy_vector::operator()[abi:ne180100](&v21);
  DSP_Host_Types::IOContextDescription::~IOContextDescription((DSP_Host_Types::IOContextDescription *)v19);
  DSP_Dictionariable::DictionariableKvp::~DictionariableKvp((DSP_Dictionariable::DictionariableKvp *)&v18);
  DSP_Dictionariable::DictionariableKvp::~DictionariableKvp((DSP_Dictionariable::DictionariableKvp *)v17);
  v15 = (void (**)(DSP_Host_Types::NegotiateRequest *__hidden))off_1E699D128;
  std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v16);

  return v12;
}

- (id)adaptToConfigurationChange:(id)a3 withCallbacks:(void *)a4 error:(id *)a5
{
  id v8;
  char v9;
  id v10;
  void *v11;
  BOOL v12;
  id v13;
  id v14;
  unsigned __int8 *v15;
  uint64_t v16;
  int v17;
  AMCP::Log::Scope_Registry *v18;
  caulk::concurrent::messenger *v19;
  _opaque_pthread_t *v20;
  mach_port_t v21;
  unint64_t v22;
  char *v23;
  int v24;
  char *v25;
  uint64_t v27;
  const char *v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  int v32;
  char *v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  std::string *p_str;
  uint64_t v52;
  id *v53;
  uint64_t v54;
  id *v55;
  uint64_t v56;
  _QWORD *v57;
  _QWORD *v58;
  id *v59;
  id *v60;
  id *v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD *v68;
  uint64_t v69;
  _QWORD *v70;
  uint64_t v71;
  std::string *v72;
  uint64_t v73;
  id *v74;
  uint64_t v75;
  _QWORD *v76;
  _QWORD *v77;
  uint64_t v78;
  _QWORD *v79;
  uint64_t v80;
  _QWORD *v81;
  uint64_t v82;
  _QWORD *v83;
  uint64_t v84;
  std::string *v85;
  uint64_t v86;
  id *v87;
  uint64_t v88;
  id *v89;
  uint64_t v90;
  _QWORD *v91;
  _QWORD *v92;
  id *v93;
  id *v94;
  id *v95;
  uint64_t v96;
  _QWORD *v97;
  uint64_t v98;
  _QWORD *v99;
  uint64_t v100;
  _QWORD *v101;
  uint64_t v102;
  uint64_t v103;
  _QWORD *v104;
  uint64_t v105;
  std::string *v106;
  uint64_t v107;
  id *v108;
  uint64_t v109;
  int v110;
  void *v111;
  uint64_t (***v112)();
  uint64_t v113;
  DSP_HAL_Mock_IOProcessor *v114;
  std::string *v115;
  uint64_t v116;
  int v117;
  id v118;
  id **v120;
  id to;
  CFTypeRef v122;
  CFTypeRef cf;
  _QWORD v124[2];
  _QWORD v125[3];
  uint64_t v126;
  _QWORD v127[73];
  uint64_t v128;
  uint64_t (**v129)();
  id v130;
  uint64_t (***v131)();
  _QWORD v132[3];
  _QWORD *v133;
  _QWORD v134[3];
  _QWORD *v135;
  id v136[3];
  id *v137;
  std::string __str;
  std::string *v139;
  _DWORD v140[3];
  char v141;
  void *__p;
  _DWORD *v143;
  _QWORD v144[3];
  _QWORD *v145;
  _QWORD v146[3];
  _QWORD *v147;
  _BYTE v148[24];
  _BYTE *v149;
  id location[3];
  id *v151;
  _QWORD v152[5];

  v152[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = -[DSP_HAL_Mock_IOProcessor featureFlag](self, "featureFlag");
  v10 = v8;
  v11 = v10;
  if (v10)
    CFRetain(v10);
  applesauce::CF::DictionaryRef::DictionaryRef((applesauce::CF::DictionaryRef *)&cf, v11);

  v12 = -[DSP_HAL_Mock_IOProcessor callAdaptHook:](self, "callAdaptHook:", &cf);
  if (cf)
    CFRelease(cf);
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MockDSP Failure"), -1, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if ((v9 & 0x81) != 0x81)
  {
    v15 = -[DSP_HAL_Mock_IOProcessor dspCallbacks](self, "dspCallbacks", v8);
    if (v15)
    {
      atomic_load(v15 + 316);
      -[DSP_HAL_Mock_IOProcessor setDspCallbacks:](self, "setDspCallbacks:", 0);
    }
    v16 = operator new();
    v17 = -[DSP_HAL_Mock_IOProcessor featureFlag](self, "featureFlag");
    DSP_HAL_BypassCallbacks::DSP_HAL_BypassCallbacks(v16, a4);
    *(_QWORD *)v16 = &off_1E696DFC0;
    *(_QWORD *)(v16 + 344) = 0;
    *(_DWORD *)(v16 + 352) = v17;
    *(_OWORD *)(v16 + 360) = 0u;
    *(_OWORD *)(v16 + 376) = 0u;
    v18 = (AMCP::Log::Scope_Registry *)std::string::basic_string[abi:ne180100]<0>((_QWORD *)(v16 + 392), "");
    *(_BYTE *)(v16 + 416) = 0;
    *(_QWORD *)(v16 + 448) = 0;
    v120 = (id **)(v16 + 480);
    *(_QWORD *)(v16 + 480) = 0;
    *(_QWORD *)(v16 + 488) = 0;
    *(_DWORD *)(v16 + 496) = 1;
    AMCP::Log::Scope_Registry::get(v18);
    AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&cf, "com.apple.coreaudio", "AMCP");
    v19 = (caulk::concurrent::messenger *)*((_QWORD *)cf + 1);
    v20 = pthread_self();
    v21 = pthread_mach_thread_np(v20);
    v22 = 0;
    v23 = 0;
    v24 = 47;
    do
    {
      v25 = &aLibraryCachesC_11[v22];
      if (v24 == 47)
        v23 = &aLibraryCachesC_11[v22];
      v24 = v25[1];
      if (!v25[1])
        break;
    }
    while (v22++ < 0xFFF);
    v27 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)*MEMORY[0x1E0DDB688] + 16))(*MEMORY[0x1E0DDB688], 48, 8);
    *(_DWORD *)(v27 + 16) = 0;
    if (v23)
      v28 = v23 + 1;
    else
      v28 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/DSP/Factories/DSP_HAL_MockFeature_Processors.h";
    *(_BYTE *)(v27 + 20) = 2;
    *(_DWORD *)(v27 + 24) = v21;
    *(_QWORD *)(v27 + 32) = v28;
    *(_DWORD *)(v27 + 40) = 37;
    *(_DWORD *)(v27 + 44) = v17;
    *(_QWORD *)v27 = &off_1E696E078;
    *(_QWORD *)(v27 + 8) = 0;
    caulk::concurrent::messenger::enqueue(v19, (caulk::concurrent::message *)v27);
    v29 = (std::__shared_weak_count *)v124[0];
    if (v124[0])
    {
      v30 = (unint64_t *)(v124[0] + 8);
      do
        v31 = __ldaxr(v30);
      while (__stlxr(v31 - 1, v30));
      if (!v31)
      {
        ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
        std::__shared_weak_count::__release_weak(v29);
      }
    }
    v32 = *(_DWORD *)(v16 + 352);
    v33 = *(char **)(v16 + 360);
    v34 = *(char **)(v16 + 368);
    v35 = v33;
    if (v34 != v33)
    {
      do
      {
        v37 = *((_QWORD *)v34 - 1);
        v34 -= 8;
        v36 = v37;
        *(_QWORD *)v34 = 0;
        if (v37)
          std::default_delete<DSP_HAL_Bypass_Utils::SimulatedLatency<float,(DSP_HAL_Bypass_Utils::InterleavePolicy)0>::InterleavedDelayLine>::operator()[abi:ne180100](v36);
      }
      while (v34 != v33);
      v35 = *(char **)(v16 + 360);
    }
    *(_QWORD *)(v16 + 368) = v33;
    if (*(_QWORD *)(v16 + 376) - (_QWORD)v35 <= 0x9FuLL)
    {
      v125[1] = v16 + 376;
      cf = operator new(0xA0uLL);
      v124[0] = (char *)cf + v33 - v35;
      v124[1] = v124[0];
      v125[0] = (char *)cf + 160;
      std::vector<std::unique_ptr<DSP_HAL_Bypass_Utils::SimulatedLatency<float,(DSP_HAL_Bypass_Utils::InterleavePolicy)0>::InterleavedDelayLine,std::default_delete<DSP_HAL_Bypass_Utils::SimulatedLatency<float,(DSP_HAL_Bypass_Utils::InterleavePolicy)0>::InterleavedDelayLine>>>::__swap_out_circular_buffer((_QWORD *)(v16 + 360), &cf);
      std::__split_buffer<std::unique_ptr<DSP_HAL_Bypass_Utils::SimulatedLatency<float,(DSP_HAL_Bypass_Utils::InterleavePolicy)0>::InterleavedDelayLine,std::default_delete<DSP_HAL_Bypass_Utils::SimulatedLatency<float,(DSP_HAL_Bypass_Utils::InterleavePolicy)0>::InterleavedDelayLine>>>::~__split_buffer((uint64_t)&cf);
    }
    v38 = 100;
    if ((~v32 & 0x11) != 0)
      v38 = 0;
    *(_QWORD *)(v16 + 384) = v38;
    DSP_Host_Types::ConfigurationChangeRequest::ConfigurationChangeRequest((DSP_Host_Types::ConfigurationChangeRequest *)&cf);
    cf = &off_1E699A370;
    v39 = v11;
    v40 = v39;
    if (v11)
      CFRetain(v39);
    applesauce::CF::DictionaryRef::DictionaryRef((applesauce::CF::DictionaryRef *)&v122, v40);

    (*((void (**)(DSP_Host_Types::ConfigurationChangeRequest *, CFDictionaryRef *))cf + 4))((DSP_Host_Types::ConfigurationChangeRequest *)&cf, (CFDictionaryRef *)&v122);
    if (v122)
      CFRelease(v122);
    if (((*(uint64_t (**)(uint64_t, CFTypeRef *))(*(_QWORD *)v16 + 16))(v16, &cf) & 1) == 0)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v16 + 8))(v16);
      if (a5)
      {
        v45 = objc_alloc(MEMORY[0x1E0CB35C8]);
        *a5 = (id)objc_msgSend(v45, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 2003329396, 0);
      }
      v14 = objc_alloc_init(MEMORY[0x1E0C99D88]);
      goto LABEL_265;
    }
    -[DSP_HAL_Mock_IOProcessor testHookFetcher](self, "testHookFetcher");
    if (!v151)
      goto LABEL_141;
    -[DSP_HAL_Mock_IOProcessor testHookFetcher](self, "testHookFetcher");
    if (!v137)
      std::__throw_bad_function_call[abi:ne180100]();
    (*((void (**)(std::string *__return_ptr))*v137 + 6))(&__str);
    v41 = v147;
    v42 = v149;
    if (v149 == v148)
    {
      v44 = 4;
      v42 = v148;
    }
    else
    {
      v43 = v147;
      if (!v149)
        goto LABEL_50;
      v44 = 5;
    }
    (*(void (**)(_QWORD *))(*v42 + 8 * v44))(v42);
    v43 = v147;
LABEL_50:
    if (v43 == v146)
    {
      v46 = 4;
    }
    else
    {
      if (!v43)
        goto LABEL_55;
      v46 = 5;
    }
    (*(void (**)(void))(*v43 + 8 * v46))();
LABEL_55:
    v47 = v145;
    if (v145 == v144)
    {
      v48 = 4;
      v47 = v144;
    }
    else
    {
      if (!v145)
        goto LABEL_60;
      v48 = 5;
    }
    (*(void (**)(void))(*v47 + 8 * v48))();
LABEL_60:
    v49 = v143;
    if (v143 == v140)
    {
      v50 = 4;
      v49 = v140;
    }
    else
    {
      if (!v143)
        goto LABEL_65;
      v50 = 5;
    }
    (*(void (**)(void))(*v49 + 8 * v50))();
LABEL_65:
    p_str = v139;
    if (v139 == &__str)
    {
      v52 = 4;
      p_str = &__str;
    }
    else
    {
      if (!v139)
        goto LABEL_70;
      v52 = 5;
    }
    (*(void (**)(void))(p_str->__r_.__value_.__r.__words[0] + 8 * v52))();
LABEL_70:
    v53 = v137;
    if (v137 == v136)
    {
      v54 = 4;
      v53 = v136;
    }
    else
    {
      if (!v137)
        goto LABEL_75;
      v54 = 5;
    }
    (*((void (**)(void))*v53 + v54))();
LABEL_75:
    v55 = v151;
    if (v151 == location)
    {
      v56 = 4;
      v55 = location;
    }
    else
    {
      if (!v151)
        goto LABEL_80;
      v56 = 5;
    }
    (*((void (**)(void))*v55 + v56))();
LABEL_80:
    if (!v41)
      goto LABEL_141;
    -[DSP_HAL_Mock_IOProcessor testHookFetcher](self, "testHookFetcher");
    if (!v137)
      std::__throw_bad_function_call[abi:ne180100]();
    (*((void (**)(std::string *__return_ptr))*v137 + 6))(&__str);
    v57 = v146;
    if (v147)
    {
      if (v147 == v146)
      {
        v135 = v134;
        (*(void (**)(_QWORD *, _QWORD *))(v146[0] + 24))(v146, v134);
        v59 = (id *)(v16 + 424);
LABEL_88:
        if (v135)
        {
          if (v135 == v134)
          {
            v151 = location;
            (*(void (**)(_QWORD *, id *))(v134[0] + 24))(v134, location);
            v60 = v151;
          }
          else
          {
            v60 = (id *)(*(uint64_t (**)(void))(*v135 + 16))();
            v151 = v60;
          }
          v61 = *(id **)(v16 + 448);
          if (v60 == location)
          {
            if (v61 == v59)
            {
              (*((void (**)(id *, _QWORD *))location[0] + 3))(location, v152);
              (*((void (**)(id *))*v151 + 4))(v151);
              v151 = 0;
              (*(void (**)(_QWORD, id *))(**(_QWORD **)(v16 + 448) + 24))(*(_QWORD *)(v16 + 448), location);
              (*(void (**)(_QWORD))(**(_QWORD **)(v16 + 448) + 32))(*(_QWORD *)(v16 + 448));
              *(_QWORD *)(v16 + 448) = 0;
              v151 = location;
              (*(void (**)(_QWORD *, id *))(v152[0] + 24))(v152, v59);
              (*(void (**)(_QWORD *))(v152[0] + 32))(v152);
              *(_QWORD *)(v16 + 448) = v59;
              v61 = v151;
            }
            else
            {
              (*((void (**)(id *, id *))location[0] + 3))(location, v59);
              (*((void (**)(id *))*v151 + 4))(v151);
              v61 = *(id **)(v16 + 448);
              v151 = v61;
              *(_QWORD *)(v16 + 448) = v59;
            }
LABEL_101:
            if (v61 == location)
            {
              v62 = 4;
              v61 = location;
            }
            else
            {
              if (!v61)
                goto LABEL_106;
              v62 = 5;
            }
LABEL_105:
            (*((void (**)(id *))*v61 + v62))(v61);
LABEL_106:
            v63 = v135;
            if (v135 == v134)
            {
              v64 = 4;
              v63 = v134;
            }
            else
            {
              if (!v135)
                goto LABEL_111;
              v64 = 5;
            }
            (*(void (**)(void))(*v63 + 8 * v64))();
LABEL_111:
            v65 = v149;
            if (v149 == v148)
            {
              v66 = 4;
              v65 = v148;
            }
            else
            {
              if (!v149)
                goto LABEL_116;
              v66 = 5;
            }
            (*(void (**)(void))(*v65 + 8 * v66))();
LABEL_116:
            if (v147 == v146)
            {
              v67 = 4;
            }
            else
            {
              if (!v147)
                goto LABEL_121;
              v67 = 5;
              v57 = v147;
            }
            (*(void (**)(_QWORD *))(*v57 + 8 * v67))(v57);
LABEL_121:
            v68 = v145;
            if (v145 == v144)
            {
              v69 = 4;
              v68 = v144;
            }
            else
            {
              if (!v145)
                goto LABEL_126;
              v69 = 5;
            }
            (*(void (**)(void))(*v68 + 8 * v69))();
LABEL_126:
            v70 = v143;
            if (v143 == v140)
            {
              v71 = 4;
              v70 = v140;
            }
            else
            {
              if (!v143)
                goto LABEL_131;
              v71 = 5;
            }
            (*(void (**)(void))(*v70 + 8 * v71))();
LABEL_131:
            v72 = v139;
            if (v139 == &__str)
            {
              v73 = 4;
              v72 = &__str;
            }
            else
            {
              if (!v139)
              {
LABEL_136:
                v74 = v137;
                if (v137 == v136)
                {
                  v75 = 4;
                  v74 = v136;
                }
                else
                {
                  if (!v137)
                    goto LABEL_141;
                  v75 = 5;
                }
                (*((void (**)(void))*v74 + v75))();
LABEL_141:
                DSP_Host_Types::ConfigurationChangeRequest::debug_device_list((DSP_Host_Types::ConfigurationChangeRequest *)&cf, &__str);
                std::string::operator=((std::string *)(v16 + 392), &__str);
                if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(__str.__r_.__value_.__l.__data_);
                -[DSP_HAL_Mock_IOProcessor testHookFetcher](self, "testHookFetcher");
                if (!v151)
                  goto LABEL_241;
                -[DSP_HAL_Mock_IOProcessor testHookFetcher](self, "testHookFetcher");
                if (!v137)
                  std::__throw_bad_function_call[abi:ne180100]();
                (*((void (**)(std::string *__return_ptr))*v137 + 6))(&__str);
                v76 = v145;
                v77 = v149;
                if (v149 == v148)
                {
                  v78 = 4;
                  v77 = v148;
                }
                else
                {
                  if (!v149)
                    goto LABEL_150;
                  v78 = 5;
                }
                (*(void (**)(void))(*v77 + 8 * v78))();
LABEL_150:
                v79 = v147;
                if (v147 == v146)
                {
                  v80 = 4;
                  v79 = v146;
                }
                else
                {
                  if (!v147)
                    goto LABEL_155;
                  v80 = 5;
                }
                (*(void (**)(void))(*v79 + 8 * v80))();
LABEL_155:
                v81 = v145;
                if (v145 == v144)
                {
                  v82 = 4;
                  v81 = v144;
                }
                else
                {
                  if (!v145)
                    goto LABEL_160;
                  v82 = 5;
                }
                (*(void (**)(void))(*v81 + 8 * v82))();
LABEL_160:
                v83 = v143;
                if (v143 == v140)
                {
                  v84 = 4;
                  v83 = v140;
                }
                else
                {
                  if (!v143)
                    goto LABEL_165;
                  v84 = 5;
                }
                (*(void (**)(void))(*v83 + 8 * v84))();
LABEL_165:
                v85 = v139;
                if (v139 == &__str)
                {
                  v86 = 4;
                  v85 = &__str;
                }
                else
                {
                  if (!v139)
                    goto LABEL_170;
                  v86 = 5;
                }
                (*(void (**)(void))(v85->__r_.__value_.__r.__words[0] + 8 * v86))();
LABEL_170:
                v87 = v137;
                if (v137 == v136)
                {
                  v88 = 4;
                  v87 = v136;
                }
                else
                {
                  if (!v137)
                    goto LABEL_175;
                  v88 = 5;
                }
                (*((void (**)(void))*v87 + v88))();
LABEL_175:
                v89 = v151;
                if (v151 == location)
                {
                  v90 = 4;
                  v89 = location;
                }
                else
                {
                  if (!v151)
                    goto LABEL_180;
                  v90 = 5;
                }
                (*((void (**)(void))*v89 + v90))();
LABEL_180:
                if (!v76)
                  goto LABEL_241;
                -[DSP_HAL_Mock_IOProcessor testHookFetcher](self, "testHookFetcher");
                if (!v137)
                  std::__throw_bad_function_call[abi:ne180100]();
                (*((void (**)(std::string *__return_ptr))*v137 + 6))(&__str);
                v91 = v144;
                if (v145)
                {
                  if (v145 == v144)
                  {
                    v133 = v132;
                    (*(void (**)(_QWORD *, _QWORD *))(v144[0] + 24))(v144, v132);
                    v93 = (id *)(v16 + 456);
LABEL_188:
                    if (v133)
                    {
                      if (v133 == v132)
                      {
                        v151 = location;
                        (*(void (**)(_QWORD *, id *))(v132[0] + 24))(v132, location);
                        v94 = v151;
                      }
                      else
                      {
                        v94 = (id *)(*(uint64_t (**)(void))(*v133 + 16))();
                        v151 = v94;
                      }
                      v95 = *v120;
                      if (v94 == location)
                      {
                        if (v95 == v93)
                        {
                          (*((void (**)(id *, _QWORD *))location[0] + 3))(location, v152);
                          (*((void (**)(id *))*v151 + 4))(v151);
                          v151 = 0;
                          (*((void (**)(id *, id *))**v120 + 3))(*v120, location);
                          (*((void (**)(id *))**v120 + 4))(*v120);
                          *v120 = 0;
                          v151 = location;
                          (*(void (**)(_QWORD *, id *))(v152[0] + 24))(v152, v93);
                          (*(void (**)(_QWORD *))(v152[0] + 32))(v152);
                          *v120 = v93;
                          v95 = v151;
                        }
                        else
                        {
                          (*((void (**)(id *, id *))location[0] + 3))(location, v93);
                          (*((void (**)(id *))*v151 + 4))(v151);
                          v95 = *v120;
                          v151 = *v120;
                          *v120 = v93;
                        }
LABEL_201:
                        if (v95 == location)
                        {
                          v96 = 4;
                          v95 = location;
                        }
                        else
                        {
                          if (!v95)
                            goto LABEL_206;
                          v96 = 5;
                        }
LABEL_205:
                        (*((void (**)(id *))*v95 + v96))(v95);
LABEL_206:
                        v97 = v133;
                        if (v133 == v132)
                        {
                          v98 = 4;
                          v97 = v132;
                        }
                        else
                        {
                          if (!v133)
                            goto LABEL_211;
                          v98 = 5;
                        }
                        (*(void (**)(void))(*v97 + 8 * v98))();
LABEL_211:
                        v99 = v149;
                        if (v149 == v148)
                        {
                          v100 = 4;
                          v99 = v148;
                        }
                        else
                        {
                          if (!v149)
                            goto LABEL_216;
                          v100 = 5;
                        }
                        (*(void (**)(void))(*v99 + 8 * v100))();
LABEL_216:
                        v101 = v147;
                        if (v147 == v146)
                        {
                          v102 = 4;
                          v101 = v146;
                        }
                        else
                        {
                          if (!v147)
                            goto LABEL_221;
                          v102 = 5;
                        }
                        (*(void (**)(void))(*v101 + 8 * v102))();
LABEL_221:
                        if (v145 == v144)
                        {
                          v103 = 4;
                        }
                        else
                        {
                          if (!v145)
                            goto LABEL_226;
                          v103 = 5;
                          v91 = v145;
                        }
                        (*(void (**)(_QWORD *))(*v91 + 8 * v103))(v91);
LABEL_226:
                        v104 = v143;
                        if (v143 == v140)
                        {
                          v105 = 4;
                          v104 = v140;
                        }
                        else
                        {
                          if (!v143)
                            goto LABEL_231;
                          v105 = 5;
                        }
                        (*(void (**)(void))(*v104 + 8 * v105))();
LABEL_231:
                        v106 = v139;
                        if (v139 == &__str)
                        {
                          v107 = 4;
                          v106 = &__str;
                        }
                        else
                        {
                          if (!v139)
                          {
LABEL_236:
                            v108 = v137;
                            if (v137 == v136)
                            {
                              v109 = 4;
                              v108 = v136;
                            }
                            else
                            {
                              if (!v137)
                                goto LABEL_241;
                              v109 = 5;
                            }
                            (*((void (**)(void))*v108 + v109))();
LABEL_241:
                            if (v127[5])
                            {
                              v110 = *(_DWORD *)(v127[3] + 28);
                              *(_DWORD *)(v16 + 496) = v110;
                              if (v110 == 6)
                              {
                                objc_initWeak(location, self);
                                -[DSP_HAL_Mock_IOProcessor processorProperties](self, "processorProperties");
                                v111 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_copyWeak(&to, location);
                                v131 = 0;
                                v129 = &off_1E696E5D8;
                                objc_moveWeak(&v130, &to);
                                v131 = &v129;
                                objc_destroyWeak(&to);
                                objc_msgSend(v111, "configureForProcessor:", &v129);
                                v112 = v131;
                                if (v131 == &v129)
                                {
                                  v113 = 4;
                                  v112 = &v129;
                                }
                                else
                                {
                                  if (!v131)
                                    goto LABEL_249;
                                  v113 = 5;
                                }
                                (*v112)[v113]();
LABEL_249:

                                v114 = self;
                                __str.__r_.__value_.__r.__words[0] = (std::string::size_type)&off_1E696E668;
                                __str.__r_.__value_.__l.__size_ = (std::string::size_type)v114;
                                v139 = &__str;
                                std::__function::__value_func<void ()(void)>::swap[abi:ne180100](&__str, (_QWORD *)(v16 + 320));
                                v115 = v139;
                                if (v139 == &__str)
                                {
                                  v116 = 4;
                                  v115 = &__str;
                                }
                                else
                                {
                                  if (!v139)
                                  {
LABEL_254:

                                    objc_destroyWeak(location);
                                    goto LABEL_255;
                                  }
                                  v116 = 5;
                                }
                                (*(void (**)(void))(v115->__r_.__value_.__r.__words[0] + 8 * v116))();
                                goto LABEL_254;
                              }
                            }
                            else
                            {
                              *(_DWORD *)(v16 + 496) = 1;
                            }
LABEL_255:
                            -[DSP_HAL_Mock_IOProcessor setDspCallbacks:](self, "setDspCallbacks:", v16);
                            DSP_Host_Types::AdaptResponse::AdaptResponse((DSP_Host_Types::AdaptResponse *)&__str);
                            if ((~*(_DWORD *)(v16 + 352) & 0x11) != 0)
                              v117 = 0;
                            else
                              v117 = 100;
                            v140[2] = v117;
                            v141 = 1;
                            location[0] = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B398], MEMORY[0x1E0C9B3A8]);
                            (*(void (**)(std::string *, id *))(__str.__r_.__value_.__r.__words[0] + 24))(&__str, location);
                            mcp_applesauce::CF::Dictionary_Builder::get_dictionary((applesauce::CF::DictionaryRef *)v136, location[0]);
                            if (location[0])
                              CFRelease(location[0]);
                            v118 = v136[0];
                            v14 = v118;
                            if (v118)
                              CFRelease(v118);
                            __str.__r_.__value_.__r.__words[0] = (std::string::size_type)&off_1E699E8B8;
                            if (__p)
                            {
                              v143 = __p;
                              operator delete(__p);
                            }
                            DSP_Dictionariable::DictionariableKvp::~DictionariableKvp((DSP_Dictionariable::DictionariableKvp *)&v139);
                            __str.__r_.__value_.__r.__words[0] = (std::string::size_type)off_1E699E8F8;
                            std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&__str.__r_.__value_.__l.__size_);
LABEL_265:
                            cf = &off_1E699D0D8;
                            __str.__r_.__value_.__r.__words[0] = (std::string::size_type)&v128;
                            std::vector<std::shared_ptr<unsigned long long>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__str);
                            DSP_Host_Types::IOContextDescription::~IOContextDescription((DSP_Host_Types::IOContextDescription *)v127);
                            DSP_Dictionariable::DictionariableKvp::~DictionariableKvp((DSP_Dictionariable::DictionariableKvp *)&v126);
                            DSP_Dictionariable::DictionariableKvp::~DictionariableKvp((DSP_Dictionariable::DictionariableKvp *)v125);
                            cf = off_1E699D128;
                            std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)v124);
                            goto LABEL_266;
                          }
                          v107 = 5;
                        }
                        (*(void (**)(void))(v106->__r_.__value_.__r.__words[0] + 8 * v107))();
                        goto LABEL_236;
                      }
                      if (v95 != v93)
                      {
LABEL_196:
                        v151 = v95;
                        *v120 = v94;
                        goto LABEL_201;
                      }
                    }
                    else
                    {
                      v151 = 0;
                      v95 = *v120;
                      if (*v120 != v93)
                      {
                        v94 = 0;
                        goto LABEL_196;
                      }
                    }
                    v95 = location;
                    (*((void (**)(id *, id *))*v93 + 3))(v93, location);
                    (*((void (**)(id *))**v120 + 4))(*v120);
                    *v120 = v151;
                    v151 = location;
                    v96 = 4;
                    goto LABEL_205;
                  }
                  v92 = &v145;
                  v133 = v145;
                }
                else
                {
                  v92 = &v133;
                }
                *v92 = 0;
                v93 = (id *)(v16 + 456);
                goto LABEL_188;
              }
              v73 = 5;
            }
            (*(void (**)(void))(v72->__r_.__value_.__r.__words[0] + 8 * v73))();
            goto LABEL_136;
          }
          if (v61 != v59)
          {
LABEL_96:
            v151 = v61;
            *(_QWORD *)(v16 + 448) = v60;
            goto LABEL_101;
          }
        }
        else
        {
          v151 = 0;
          v61 = *(id **)(v16 + 448);
          if (v61 != v59)
          {
            v60 = 0;
            goto LABEL_96;
          }
        }
        v61 = location;
        (*((void (**)(id *, id *))*v59 + 3))(v59, location);
        (*(void (**)(_QWORD))(**(_QWORD **)(v16 + 448) + 32))(*(_QWORD *)(v16 + 448));
        *(_QWORD *)(v16 + 448) = v151;
        v151 = location;
        v62 = 4;
        goto LABEL_105;
      }
      v58 = &v147;
      v135 = v147;
    }
    else
    {
      v58 = &v135;
    }
    *v58 = 0;
    v59 = (id *)(v16 + 424);
    goto LABEL_88;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MockDSP Force Fail Adapt"), -1, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
  v14 = 0;
  *a5 = v13;
LABEL_266:

  return v14;
}

- (void)dspCallbacks
{
  return self->_dspCallbacks;
}

- (HAL_DSP_HostCallbacks)hostCallbacks
{
  return self->_hostCallbacks;
}

- (void)setHostCallbacks:(id)a3
{
  objc_storeStrong((id *)&self->_hostCallbacks, a3);
}

- (int)featureFlag
{
  return self->_featureFlag;
}

- (DSP_HAL_Mock_PropertySet)processorProperties
{
  return self->_processorProperties;
}

- (void)setProcessorProperties:(id)a3
{
  objc_storeStrong((id *)&self->_processorProperties, a3);
}

- (function<DSP_HAL_Mock_TestHooks)testHookFetcher
{
  return (function<DSP_HAL_Mock_TestHooks ()> *)std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)retstr, (uint64_t)&self->_testHookFetcher);
}

- (void)setTestHookFetcher:(function<DSP_HAL_Mock_TestHooks)(
{
  function<DSP_HAL_Mock_TestHooks ()> *p_testHookFetcher;
  void *v5;
  function<DSP_HAL_Mock_TestHooks ()> *f;
  _QWORD *v7;
  uint64_t v8;
  _QWORD v9[3];
  _QWORD *v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)v9, (uint64_t)a3);
  p_testHookFetcher = &self->_testHookFetcher;
  if (&self->_testHookFetcher != (function<DSP_HAL_Mock_TestHooks ()> *)v9)
  {
    v5 = v10;
    f = (function<DSP_HAL_Mock_TestHooks ()> *)self->_testHookFetcher.__f_.__f_;
    if (v10 == v9)
    {
      if (f == p_testHookFetcher)
      {
        (*(void (**)(_QWORD *, _QWORD *))(v9[0] + 24))(v9, v11);
        (*(void (**)(_QWORD *))(*v10 + 32))(v10);
        v10 = 0;
        (*(void (**)(void *, _QWORD *))(*(_QWORD *)self->_testHookFetcher.__f_.__f_ + 24))(self->_testHookFetcher.__f_.__f_, v9);
        (*(void (**)(void *))(*(_QWORD *)self->_testHookFetcher.__f_.__f_ + 32))(self->_testHookFetcher.__f_.__f_);
        self->_testHookFetcher.__f_.__f_ = 0;
        v10 = v9;
        (*(void (**)(_QWORD *, function<DSP_HAL_Mock_TestHooks ()> *))(v11[0] + 24))(v11, &self->_testHookFetcher);
        (*(void (**)(_QWORD *))(v11[0] + 32))(v11);
      }
      else
      {
        (*(void (**)(_QWORD *, function<DSP_HAL_Mock_TestHooks ()> *))(v9[0] + 24))(v9, &self->_testHookFetcher);
        (*(void (**)(_QWORD *))(*v10 + 32))(v10);
        v10 = self->_testHookFetcher.__f_.__f_;
      }
      self->_testHookFetcher.__f_.__f_ = p_testHookFetcher;
    }
    else if (f == p_testHookFetcher)
    {
      (*(void (**)(function<DSP_HAL_Mock_TestHooks ()> *, _QWORD *))(*(_QWORD *)p_testHookFetcher->__f_.__buf_.__lx
                                                                              + 24))(&self->_testHookFetcher, v9);
      (*(void (**)(void *))(*(_QWORD *)self->_testHookFetcher.__f_.__f_ + 32))(self->_testHookFetcher.__f_.__f_);
      self->_testHookFetcher.__f_.__f_ = v10;
      v10 = v9;
    }
    else
    {
      v10 = self->_testHookFetcher.__f_.__f_;
      self->_testHookFetcher.__f_.__f_ = v5;
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
  function<DSP_HAL_Mock_TestHooks ()> *p_testHookFetcher;
  function<DSP_HAL_Mock_TestHooks ()> *f;
  uint64_t v5;

  p_testHookFetcher = &self->_testHookFetcher;
  f = (function<DSP_HAL_Mock_TestHooks ()> *)self->_testHookFetcher.__f_.__f_;
  if (f == p_testHookFetcher)
  {
    v5 = 4;
    f = p_testHookFetcher;
    goto LABEL_5;
  }
  if (f)
  {
    v5 = 5;
LABEL_5:
    (*(void (**)(void))(*(_QWORD *)f->__f_.__buf_.__lx + 8 * v5))();
  }
  objc_storeStrong((id *)&self->_processorProperties, 0);
  objc_storeStrong((id *)&self->_hostCallbacks, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 8) = 0;
  return self;
}

- (uint64_t)adaptToConfigurationChange:withCallbacks:error:
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"Z75-[DSP_HAL_Mock_IOProcessor adaptToConfigurationChange:withCallbacks:error:]E4$_21"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)adaptToConfigurationChange:withCallbacks:error:
{
}

- (_QWORD)adaptToConfigurationChange:withCallbacks:error:
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = &off_1E696E668;
  v2[1] = *(id *)(a1 + 8);
  return v2;
}

- (id)adaptToConfigurationChange:withCallbacks:error:
{
  id *v1;
  id *v2;

  v1 = (id *)(a1 + 8);
  v2 = (id *)operator new(0x10uLL);
  *v2 = &off_1E696E5D8;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

@end
