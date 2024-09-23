@implementation IEIntelligence

- (IEIntelligence)init
{
  IEIntelligence *v3;
  siri::intelligence::Intelligence *v4;
  NSString *mFlowId;
  objc_super v7;

  if ((ModuleInitialization(void)::sModuleInitialized & 1) == 0)
  {
    ModuleInitialization(void)::sModuleInitialized = 1;
    siri::intelligence::Utils::SetRandomNumberGeneratorSeed((siri::intelligence::Utils *)self);
  }
  v7.receiver = self;
  v7.super_class = (Class)IEIntelligence;
  v3 = -[IEIntelligence init](&v7, sel_init);
  if (v3)
  {
    v4 = (siri::intelligence::Intelligence *)operator new();
    siri::intelligence::Intelligence::Intelligence(v4);
    mFlowId = v3->mFlowId;
    v3->mIntelligence = v4;
    v3->mFlowId = (NSString *)&stru_24F544478;

  }
  return v3;
}

- (void)dealloc
{
  void *mIntelligence;
  uint64_t v4;
  objc_super v5;

  mIntelligence = self->mIntelligence;
  if (mIntelligence)
  {
    v4 = std::shared_ptr<YAML::detail::memory_holder>::~shared_ptr[abi:ne180100]((uint64_t)mIntelligence);
    MEMORY[0x22E2E9CCC](v4, 0x20C40A4A59CD2);
  }
  v5.receiver = self;
  v5.super_class = (Class)IEIntelligence;
  -[IEIntelligence dealloc](&v5, sel_dealloc);
}

- (BOOL)load:(id)a3
{
  id v4;
  unsigned __int8 v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  id v13;
  _QWORD *v14;
  int FormatForFilename;
  protobuf::Intelligence *v16;
  NSString *mFlowId;
  uint64_t v18;
  const char *v19;
  BOOL v20;
  uint64_t v21;
  const char *v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v29;
  _QWORD v30[4];
  void (**v31)(siri::intelligence::Timer *__hidden);
  _QWORD v32[2];
  void (**v33)(void);
  std::string buf;
  const std::string *v35;
  uint64_t v36;

  v4 = a3;
  v5 = atomic_load((unsigned __int8 *)&qword_253F45E70);
  if ((v5 & 1) == 0 && __cxa_guard_acquire(&qword_253F45E70))
  {
    _MergedGlobals_1 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_253F45E70);
  }
  v6 = os_signpost_id_generate((os_log_t)_MergedGlobals_1);
  v7 = (id)_MergedGlobals_1;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "load(filename:)", (const char *)&unk_22B0CB3EF, (uint8_t *)&buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(&buf, "load(filename:)");
  siri::intelligence::Timer::Timer(&v35, &buf);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"> Entering function 'load(filename:)'", v9);
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3321888768;
  v30[2] = __23__IEIntelligence_load___block_invoke;
  v30[3] = &__block_descriptor_56_ea8_32c31_ZTSN4siri12intelligence5TimerE_e5_v8__0l;
  siri::intelligence::Timer::Timer((siri::intelligence::Timer *)&v31, &v35);
  v32[1] = v6;
  v33 = (void (**)(void))MEMORY[0x22E2EA050](v30);
  if (v4)
    v11 = (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  else
    v11 = "null";
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %s", v10, "filename", v11);
  if (v4)
  {
    v13 = objc_retainAutorelease(v4);
    v14 = std::string::basic_string[abi:ne180100]<0>(&buf, (char *)objc_msgSend(v13, "UTF8String"));
    FormatForFilename = siri::intelligence::GetFormatForFilename((uint64_t)v14);
    siri::intelligence::Loader::LoadFile(&buf, FormatForFilename, 0, &v29);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    v16 = (protobuf::Intelligence *)v29;
    if ((_QWORD)v29)
    {
      mFlowId = self->mFlowId;
      self->mFlowId = (NSString *)&stru_24F544478;

      v18 = objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
      siri::intelligence::Log::Info((siri::intelligence::Log *)"Loading flow file: %s", v19, v18);
      v20 = siri::intelligence::Intelligence::Load((std::string **)self->mIntelligence, v16);
    }
    else
    {
      v21 = objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
      siri::intelligence::Log::Error((siri::intelligence::Log *)"Failed to load flow file from: %s", v22, v21);
      v20 = 0;
    }
    v23 = (std::__shared_weak_count *)*((_QWORD *)&v29 + 1);
    if (*((_QWORD *)&v29 + 1))
    {
      v24 = (unint64_t *)(*((_QWORD *)&v29 + 1) + 8);
      do
        v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
    }
  }
  else
  {
    siri::intelligence::Log::Error((siri::intelligence::Log *)"No flow filename provided to load function", v12);
    v20 = 0;
  }
  IEDefer::~IEDefer(&v33);
  v26 = v32[0];
  v31 = &off_24F543888;
  v32[0] = 0;
  if (v26)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)v32, v26);
  v27 = v36;
  v35 = (const std::string *)&off_24F543888;
  v36 = 0;
  if (v27)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)&v36, v27);

  return v20;
}

void __23__IEIntelligence_load___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t buf[16];

  SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'load(filename:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((_QWORD *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)_MergedGlobals_1;
  v5 = v4;
  v6 = *((_QWORD *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v5, OS_SIGNPOST_INTERVAL_END, v6, "load(filename:)", (const char *)&unk_22B0CB3EF, buf, 2u);
  }

}

- (BOOL)load:(id)a3 withFlowId:(id)a4
{
  id v6;
  id v7;
  unsigned __int8 v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  id v18;
  const char *v19;
  std::string::size_type size;
  int FormatForFilename;
  const char *v22;
  protobuf::Intelligence *v23;
  const char *v24;
  std::string *p_p;
  BOOL v26;
  void **v27;
  std::string *p_buf;
  std::string *v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v36;
  std::string __p;
  void *v38[2];
  char v39;
  _QWORD v40[4];
  void (**v41)(siri::intelligence::Timer *__hidden);
  _QWORD v42[2];
  void (**v43)(void);
  std::string buf;
  const std::string *v45;
  uint64_t v46;

  v6 = a3;
  v7 = a4;
  v8 = atomic_load((unsigned __int8 *)&qword_253F45E80);
  if ((v8 & 1) == 0 && __cxa_guard_acquire(&qword_253F45E80))
  {
    qword_253F45E78 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_253F45E80);
  }
  v9 = os_signpost_id_generate((os_log_t)qword_253F45E78);
  v10 = (id)qword_253F45E78;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "load(templateDir:flowId:)", (const char *)&unk_22B0CB3EF, (uint8_t *)&buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(&buf, "load(templateDir:flowId:)");
  siri::intelligence::Timer::Timer(&v45, &buf);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"> Entering function 'load(templateDir:flowId:)'", v12);
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3321888768;
  v40[2] = __34__IEIntelligence_load_withFlowId___block_invoke;
  v40[3] = &__block_descriptor_56_ea8_32c31_ZTSN4siri12intelligence5TimerE_e5_v8__0l;
  siri::intelligence::Timer::Timer((siri::intelligence::Timer *)&v41, &v45);
  v42[1] = v9;
  v43 = (void (**)(void))MEMORY[0x22E2EA050](v40);
  if (v6)
    v14 = (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  else
    v14 = "null";
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %s", v13, "templateDir", v14);
  if (v7)
    v16 = (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
  else
    v16 = "null";
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %s", v15, "flowId", v16);
  if (v6 && v7)
  {
    std::string::basic_string[abi:ne180100]<0>(&buf, (char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
    v18 = objc_retainAutorelease(v7);
    std::string::basic_string[abi:ne180100]<0>(v38, (char *)objc_msgSend(v18, "UTF8String"));
    siri::intelligence::FindFileForFlowId((uint64_t)&buf, (unsigned __int8 *)v38, (uint64_t)&__p);
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      size = __p.__r_.__value_.__l.__size_;
    if (size)
    {
      FormatForFilename = siri::intelligence::GetFormatForFilename((uint64_t)&__p);
      siri::intelligence::Loader::LoadFile(&__p, FormatForFilename, 0, &v36);
      v23 = (protobuf::Intelligence *)v36;
      if ((_QWORD)v36)
      {
        objc_storeStrong((id *)&self->mFlowId, v18);
        p_p = &__p;
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        siri::intelligence::Log::Info((siri::intelligence::Log *)"Loading flow file: %s", v24, p_p);
        v26 = siri::intelligence::Intelligence::Load((std::string **)self->mIntelligence, v23);
      }
      else
      {
        v29 = &__p;
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          v29 = (std::string *)__p.__r_.__value_.__r.__words[0];
        siri::intelligence::Log::Error((siri::intelligence::Log *)"Failed to load flow file from: %s", v22, v29);
        v26 = 0;
      }
      v30 = (std::__shared_weak_count *)*((_QWORD *)&v36 + 1);
      if (*((_QWORD *)&v36 + 1))
      {
        v31 = (unint64_t *)(*((_QWORD *)&v36 + 1) + 8);
        do
          v32 = __ldaxr(v31);
        while (__stlxr(v32 - 1, v31));
        if (!v32)
        {
          ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
          std::__shared_weak_count::__release_weak(v30);
        }
      }
    }
    else
    {
      v27 = v38;
      if (v39 < 0)
        v27 = (void **)v38[0];
      p_buf = &buf;
      if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        p_buf = (std::string *)buf.__r_.__value_.__r.__words[0];
      siri::intelligence::Log::Error((siri::intelligence::Log *)"Cannot find flow file with flowId '%s' under directory: %s", v19, v27, p_buf);
      v26 = 0;
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (v39 < 0)
      operator delete(v38[0]);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
  }
  else
  {
    siri::intelligence::Log::Error((siri::intelligence::Log *)"Failed to load flow: one of templateDir or flowId not specified", v17);
    v26 = 0;
  }
  IEDefer::~IEDefer(&v43);
  v33 = v42[0];
  v41 = &off_24F543888;
  v42[0] = 0;
  if (v33)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)v42, v33);
  v34 = v46;
  v45 = (const std::string *)&off_24F543888;
  v46 = 0;
  if (v34)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)&v46, v34);

  return v26;
}

void __34__IEIntelligence_load_withFlowId___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t buf[16];

  SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'load(templateDir:flowId:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((_QWORD *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)qword_253F45E78;
  v5 = v4;
  v6 = *((_QWORD *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v5, OS_SIGNPOST_INTERVAL_END, v6, "load(templateDir:flowId:)", (const char *)&unk_22B0CB3EF, buf, 2u);
  }

}

- (BOOL)load:(id)a3 withId:(id)a4
{
  NSBundle *v6;
  id v7;
  unsigned __int8 v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  const char *v13;
  void *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  std::string::size_type size;
  id v20;
  const char *v21;
  std::string::size_type v22;
  int FormatForFilename;
  const char *v24;
  protobuf::Intelligence *v25;
  const char *v26;
  std::string *p_p;
  BOOL v28;
  void **v29;
  std::string *p_buf;
  std::string *v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v38;
  std::string __p;
  void *v40[2];
  char v41;
  _QWORD v42[4];
  void (**v43)(siri::intelligence::Timer *__hidden);
  _QWORD v44[2];
  void (**v45)(void);
  std::string buf;
  const std::string *v47;
  uint64_t v48;

  v6 = (NSBundle *)a3;
  v7 = a4;
  v8 = atomic_load((unsigned __int8 *)&qword_253F45E90);
  if ((v8 & 1) == 0 && __cxa_guard_acquire(&qword_253F45E90))
  {
    qword_253F45E88 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_253F45E90);
  }
  v9 = os_signpost_id_generate((os_log_t)qword_253F45E88);
  v10 = (id)qword_253F45E88;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "load(bundle:flowId:)", (const char *)&unk_22B0CB3EF, (uint8_t *)&buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(&buf, "load(bundle:flowId:)");
  siri::intelligence::Timer::Timer(&v47, &buf);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"> Entering function 'load(bundle:flowId:)'", v12);
  v42[0] = MEMORY[0x24BDAC760];
  v42[1] = 3321888768;
  v42[2] = __30__IEIntelligence_load_withId___block_invoke;
  v42[3] = &__block_descriptor_56_ea8_32c31_ZTSN4siri12intelligence5TimerE_e5_v8__0l;
  siri::intelligence::Timer::Timer((siri::intelligence::Timer *)&v43, &v47);
  v44[1] = v9;
  v45 = (void (**)(void))MEMORY[0x22E2EA050](v42);
  -[NSBundle resourcePath](v6, "resourcePath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[NSBundle resourcePath](v6, "resourcePath");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = (const char *)-[NSObject UTF8String](v11, "UTF8String");
  }
  else
  {
    v15 = "null";
  }
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %s", v13, "bundle", v15);
  if (v14)

  if (v7)
    v17 = (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
  else
    v17 = "null";
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %s", v16, "flowId", v17);
  IE_GetTemplateDirFromBundle(v6, &buf);
  size = HIBYTE(buf.__r_.__value_.__r.__words[2]);
  if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = buf.__r_.__value_.__l.__size_;
  if (v7 && size)
  {
    v20 = objc_retainAutorelease(v7);
    std::string::basic_string[abi:ne180100]<0>(v40, (char *)objc_msgSend(v20, "UTF8String"));
    siri::intelligence::FindFileForFlowId((uint64_t)&buf, (unsigned __int8 *)v40, (uint64_t)&__p);
    v22 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v22 = __p.__r_.__value_.__l.__size_;
    if (v22)
    {
      FormatForFilename = siri::intelligence::GetFormatForFilename((uint64_t)&__p);
      siri::intelligence::Loader::LoadFile(&__p, FormatForFilename, 0, &v38);
      v25 = (protobuf::Intelligence *)v38;
      if ((_QWORD)v38)
      {
        objc_storeStrong((id *)&self->mFlowId, v20);
        p_p = &__p;
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        siri::intelligence::Log::Info((siri::intelligence::Log *)"Loading bundle flow file: %s", v26, p_p);
        v28 = siri::intelligence::Intelligence::Load((std::string **)self->mIntelligence, v25);
      }
      else
      {
        v31 = &__p;
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          v31 = (std::string *)__p.__r_.__value_.__r.__words[0];
        siri::intelligence::Log::Error((siri::intelligence::Log *)"Failed to load flow file from: %s", v24, v31);
        v28 = 0;
      }
      v32 = (std::__shared_weak_count *)*((_QWORD *)&v38 + 1);
      if (*((_QWORD *)&v38 + 1))
      {
        v33 = (unint64_t *)(*((_QWORD *)&v38 + 1) + 8);
        do
          v34 = __ldaxr(v33);
        while (__stlxr(v34 - 1, v33));
        if (!v34)
        {
          ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
          std::__shared_weak_count::__release_weak(v32);
        }
      }
    }
    else
    {
      v29 = v40;
      if (v41 < 0)
        v29 = (void **)v40[0];
      p_buf = &buf;
      if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        p_buf = (std::string *)buf.__r_.__value_.__r.__words[0];
      siri::intelligence::Log::Error((siri::intelligence::Log *)"Cannot find flow file with flowId '%s' under directory: %s", v21, v29, p_buf);
      v28 = 0;
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (v41 < 0)
      operator delete(v40[0]);
  }
  else
  {
    siri::intelligence::Log::Error((siri::intelligence::Log *)"Invalid flow load request: no template dir or flowId defined", v18);
    v28 = 0;
  }
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  IEDefer::~IEDefer(&v45);
  v35 = v44[0];
  v43 = &off_24F543888;
  v44[0] = 0;
  if (v35)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)v44, v35);
  v36 = v48;
  v47 = (const std::string *)&off_24F543888;
  v48 = 0;
  if (v36)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)&v48, v36);

  return v28;
}

void __30__IEIntelligence_load_withId___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t buf[16];

  SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'load(bundle:flowId:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((_QWORD *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)qword_253F45E88;
  v5 = v4;
  v6 = *((_QWORD *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v5, OS_SIGNPOST_INTERVAL_END, v6, "load(bundle:flowId:)", (const char *)&unk_22B0CB3EF, buf, 2u);
  }

}

- (BOOL)loadFromString:(id)a3
{
  id v4;
  unsigned __int8 v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  char *v12;
  std::string::size_type size;
  NSString *mFlowId;
  std::string *p_buf;
  void *v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  void *__p[2];
  char v22;
  void *v23[2];
  char v24;
  _QWORD v25[4];
  void (**v26)(siri::intelligence::Timer *__hidden);
  _QWORD v27[2];
  void (**v28)(void);
  std::string buf;
  const std::string *v30;
  uint64_t v31;

  v4 = a3;
  v5 = atomic_load((unsigned __int8 *)&qword_253F45EA0);
  if ((v5 & 1) == 0 && __cxa_guard_acquire(&qword_253F45EA0))
  {
    qword_253F45E98 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_253F45EA0);
  }
  v6 = os_signpost_id_generate((os_log_t)qword_253F45E98);
  v7 = (id)qword_253F45E98;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "load(string:)", (const char *)&unk_22B0CB3EF, (uint8_t *)&buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(&buf, "load(string:)");
  siri::intelligence::Timer::Timer(&v30, &buf);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"> Entering function 'load(string:)'", v9);
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3321888768;
  v25[2] = __33__IEIntelligence_loadFromString___block_invoke;
  v25[3] = &__block_descriptor_56_ea8_32c31_ZTSN4siri12intelligence5TimerE_e5_v8__0l;
  siri::intelligence::Timer::Timer((siri::intelligence::Timer *)&v26, &v30);
  v27[1] = v6;
  v28 = (void (**)(void))MEMORY[0x22E2EA050](v25);
  if (v4)
    v11 = (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  else
    v11 = "null";
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %s", v10, "string", v11);
  if (v4)
    v12 = (char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  else
    v12 = "";
  std::string::basic_string[abi:ne180100]<0>(v23, v12);
  std::string::basic_string[abi:ne180100]<0>(__p, ".yamlflow");
  siri::intelligence::WriteTempFileFromString((const void **)v23, (uint64_t)__p, &buf);
  if (v22 < 0)
    operator delete(__p[0]);
  if (v24 < 0)
    operator delete(v23[0]);
  size = HIBYTE(buf.__r_.__value_.__r.__words[2]);
  if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = buf.__r_.__value_.__l.__size_;
  if (size)
  {
    mFlowId = self->mFlowId;
    self->mFlowId = (NSString *)&stru_24F544478;

    if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_buf = &buf;
    else
      p_buf = (std::string *)buf.__r_.__value_.__r.__words[0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", p_buf);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[IEIntelligence load:](self, "load:", v16);

    siri::intelligence::DeleteFile((const char *)&buf);
    if ((*((_BYTE *)&buf.__r_.__value_.__s + 23) & 0x80) != 0)
      goto LABEL_24;
  }
  else
  {
    v17 = 0;
    if ((*((_BYTE *)&buf.__r_.__value_.__s + 23) & 0x80) != 0)
LABEL_24:
      operator delete(buf.__r_.__value_.__l.__data_);
  }
  IEDefer::~IEDefer(&v28);
  v18 = v27[0];
  v26 = &off_24F543888;
  v27[0] = 0;
  if (v18)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)v27, v18);
  v19 = v31;
  v30 = (const std::string *)&off_24F543888;
  v31 = 0;
  if (v19)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)&v31, v19);

  return v17;
}

void __33__IEIntelligence_loadFromString___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t buf[16];

  SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'load(string:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((_QWORD *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)qword_253F45E98;
  v5 = v4;
  v6 = *((_QWORD *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v5, OS_SIGNPOST_INTERVAL_END, v6, "load(string:)", (const char *)&unk_22B0CB3EF, buf, 2u);
  }

}

- (id)flowId
{
  return self->mFlowId;
}

- (id)find:(id)a3 withId:(id)a4
{
  id v4;
  NSBundle *v6;
  id v7;
  unsigned __int8 v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  const char *v13;
  void *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  std::string::size_type size;
  void **v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *__p[2];
  char v26;
  void *v27[2];
  char v28;
  _QWORD v29[4];
  void (**v30)(siri::intelligence::Timer *__hidden);
  _QWORD v31[2];
  void (**v32)(void);
  std::string buf;
  const std::string *v34;
  uint64_t v35;

  v6 = (NSBundle *)a3;
  v7 = a4;
  v8 = atomic_load((unsigned __int8 *)&qword_253F45EB0);
  if ((v8 & 1) == 0 && __cxa_guard_acquire(&qword_253F45EB0))
  {
    qword_253F45EA8 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_253F45EB0);
  }
  v9 = os_signpost_id_generate((os_log_t)qword_253F45EA8);
  v10 = (id)qword_253F45EA8;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "find(bundle:flowId:)", (const char *)&unk_22B0CB3EF, (uint8_t *)&buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(&buf, "find(bundle:flowId:)");
  siri::intelligence::Timer::Timer(&v34, &buf);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"> Entering function 'find(bundle:flowId:)'", v12);
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3321888768;
  v29[2] = __30__IEIntelligence_find_withId___block_invoke;
  v29[3] = &__block_descriptor_56_ea8_32c31_ZTSN4siri12intelligence5TimerE_e5_v8__0l;
  siri::intelligence::Timer::Timer((siri::intelligence::Timer *)&v30, &v34);
  v31[1] = v9;
  v32 = (void (**)(void))MEMORY[0x22E2EA050](v29);
  -[NSBundle resourcePath](v6, "resourcePath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[NSBundle resourcePath](v6, "resourcePath");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = (const char *)objc_msgSend(v4, "UTF8String");
  }
  else
  {
    v15 = "null";
  }
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %s", v13, "bundle", v15);
  if (v14)

  if (v7)
    v17 = (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
  else
    v17 = "null";
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %s", v16, "flowId", v17);
  IE_GetTemplateDirFromBundle(v6, &buf);
  size = HIBYTE(buf.__r_.__value_.__r.__words[2]);
  if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = buf.__r_.__value_.__l.__size_;
  if (v7 && size)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
    siri::intelligence::FindFileForFlowId((uint64_t)&buf, (unsigned __int8 *)__p, (uint64_t)v27);
    if (v26 < 0)
      operator delete(__p[0]);
    if (v28 >= 0)
      v20 = v27;
    else
      v20 = (void **)v27[0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28 < 0)
      operator delete(v27[0]);
  }
  else
  {
    siri::intelligence::Log::Error((siri::intelligence::Log *)"Invalid flow find request: no template dir or flowId defined", v18);
    v21 = (void *)objc_opt_new();
  }
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  IEDefer::~IEDefer(&v32);
  v22 = v31[0];
  v30 = &off_24F543888;
  v31[0] = 0;
  if (v22)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)v31, v22);
  v23 = v35;
  v34 = (const std::string *)&off_24F543888;
  v35 = 0;
  if (v23)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)&v35, v23);

  return v21;
}

void __30__IEIntelligence_find_withId___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t buf[16];

  SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'find(bundle:flowId:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((_QWORD *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)qword_253F45EA8;
  v5 = v4;
  v6 = *((_QWORD *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v5, OS_SIGNPOST_INTERVAL_END, v6, "find(bundle:flowId:)", (const char *)&unk_22B0CB3EF, buf, 2u);
  }

}

- (id)findInTemplateDir:(id)a3 withId:(id)a4
{
  id v5;
  id v6;
  unsigned __int8 v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  __CFString *v16;
  std::string *p_buf;
  uint64_t v18;
  uint64_t v19;
  void *__p[2];
  char v22;
  void *v23[2];
  char v24;
  _QWORD v25[4];
  void (**v26)(siri::intelligence::Timer *__hidden);
  _QWORD v27[2];
  void (**v28)(void);
  std::string buf;
  const std::string *v30;
  uint64_t v31;

  v5 = a3;
  v6 = a4;
  v7 = atomic_load((unsigned __int8 *)&qword_253F45EC0);
  if ((v7 & 1) == 0 && __cxa_guard_acquire(&qword_253F45EC0))
  {
    qword_253F45EB8 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_253F45EC0);
  }
  v8 = os_signpost_id_generate((os_log_t)qword_253F45EB8);
  v9 = (id)qword_253F45EB8;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "find(templateDir:flowId:)", (const char *)&unk_22B0CB3EF, (uint8_t *)&buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(&buf, "find(templateDir:flowId:)");
  siri::intelligence::Timer::Timer(&v30, &buf);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"> Entering function 'find(templateDir:flowId:)'", v11);
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3321888768;
  v25[2] = __43__IEIntelligence_findInTemplateDir_withId___block_invoke;
  v25[3] = &__block_descriptor_56_ea8_32c31_ZTSN4siri12intelligence5TimerE_e5_v8__0l;
  siri::intelligence::Timer::Timer((siri::intelligence::Timer *)&v26, &v30);
  v27[1] = v8;
  v28 = (void (**)(void))MEMORY[0x22E2EA050](v25);
  if (v5)
    v13 = (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
  else
    v13 = "null";
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %s", v12, "templateDir", v13);
  if (v6)
    v15 = (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  else
    v15 = "null";
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %s", v14, "flowId", v15);
  v16 = &stru_24F544478;
  if (v5 && v6)
  {
    std::string::basic_string[abi:ne180100]<0>(v23, (char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
    siri::intelligence::FindFileForFlowId((uint64_t)v23, (unsigned __int8 *)__p, (uint64_t)&buf);
    if (v22 < 0)
      operator delete(__p[0]);
    if (v24 < 0)
      operator delete(v23[0]);
    if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_buf = &buf;
    else
      p_buf = (std::string *)buf.__r_.__value_.__r.__words[0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", p_buf);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
  }
  IEDefer::~IEDefer(&v28);
  v18 = v27[0];
  v26 = &off_24F543888;
  v27[0] = 0;
  if (v18)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)v27, v18);
  v19 = v31;
  v30 = (const std::string *)&off_24F543888;
  v31 = 0;
  if (v19)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)&v31, v19);

  return v16;
}

void __43__IEIntelligence_findInTemplateDir_withId___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t buf[16];

  SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'find(templateDir:flowId:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((_QWORD *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)qword_253F45EB8;
  v5 = v4;
  v6 = *((_QWORD *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v5, OS_SIGNPOST_INTERVAL_END, v6, "find(templateDir:flowId:)", (const char *)&unk_22B0CB3EF, buf, 2u);
  }

}

- (id)startConversation
{
  unsigned __int8 v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[4];
  void (**v13)(siri::intelligence::Timer *__hidden);
  _QWORD v14[2];
  std::string buf;
  const std::string *v16;
  uint64_t v17;

  v3 = atomic_load((unsigned __int8 *)&qword_253F45ED0);
  if ((v3 & 1) == 0 && __cxa_guard_acquire(&qword_253F45ED0))
  {
    qword_253F45EC8 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_253F45ED0);
  }
  v4 = os_signpost_id_generate((os_log_t)qword_253F45EC8);
  v5 = (id)qword_253F45EC8;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "start()", (const char *)&unk_22B0CB3EF, (uint8_t *)&buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(&buf, "start()");
  siri::intelligence::Timer::Timer(&v16, &buf);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"> Entering function 'start()'", v7);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3321888768;
  v12[2] = __35__IEIntelligence_startConversation__block_invoke;
  v12[3] = &__block_descriptor_56_ea8_32c31_ZTSN4siri12intelligence5TimerE_e5_v8__0l;
  siri::intelligence::Timer::Timer((siri::intelligence::Timer *)&v13, &v16);
  v14[1] = v4;
  buf.__r_.__value_.__r.__words[0] = MEMORY[0x22E2EA050](v12);
  siri::intelligence::Intelligence::StartConversation((std::string **)self->mIntelligence);
  -[IEIntelligence getRemainingResponses](self, "getRemainingResponses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  IEDefer::~IEDefer((void (***)(void))&buf);
  v9 = v14[0];
  v13 = &off_24F543888;
  v14[0] = 0;
  if (v9)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)v14, v9);
  v10 = v17;
  v16 = (const std::string *)&off_24F543888;
  v17 = 0;
  if (v10)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)&v17, v10);
  return v8;
}

void __35__IEIntelligence_startConversation__block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t buf[16];

  SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'start()' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((_QWORD *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)qword_253F45EC8;
  v5 = v4;
  v6 = *((_QWORD *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v5, OS_SIGNPOST_INTERVAL_END, v6, "start()", (const char *)&unk_22B0CB3EF, buf, 2u);
  }

}

- (id)processEvent:(id)a3
{
  IEEvent *v4;
  unsigned __int8 v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  const char *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  void *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  uint64_t *i;
  std::string::size_type v21;
  std::__shared_weak_count *v22;
  uint64_t v23;
  unint64_t *p_shared_owners;
  unint64_t v25;
  uint64_t v26;
  __int128 v27;
  unint64_t *v28;
  unint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  siri::intelligence::Intelligence::Impl **mIntelligence;
  void *v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  std::string buf[11];
  uint64_t v45;
  std::__shared_weak_count *v46;
  std::string v47;
  uint64_t v48;
  std::__shared_weak_count *v49;
  uint64_t v50;
  std::string::size_type size;
  _QWORD v52[4];
  void (**v53)(siri::intelligence::Timer *__hidden);
  _QWORD v54[2];
  void (**v55)(void);
  const std::string *v56;
  uint64_t v57;

  v4 = (IEEvent *)a3;
  v5 = atomic_load((unsigned __int8 *)&qword_253F45EE0);
  if ((v5 & 1) == 0 && __cxa_guard_acquire(&qword_253F45EE0))
  {
    qword_253F45ED8 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_253F45EE0);
  }
  v6 = os_signpost_id_generate((os_log_t)qword_253F45ED8);
  v7 = (id)qword_253F45ED8;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "process(event:)", (const char *)&unk_22B0CB3EF, (uint8_t *)buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "process(event:)");
  siri::intelligence::Timer::Timer(&v56, buf);
  if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf[0].__r_.__value_.__l.__data_);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"> Entering function 'process(event:)'", v9);
  v52[0] = MEMORY[0x24BDAC760];
  v52[1] = 3321888768;
  v52[2] = __31__IEIntelligence_processEvent___block_invoke;
  v52[3] = &__block_descriptor_56_ea8_32c31_ZTSN4siri12intelligence5TimerE_e5_v8__0l;
  siri::intelligence::Timer::Timer((siri::intelligence::Timer *)&v53, &v56);
  v54[1] = v6;
  v55 = (void (**)(void))MEMORY[0x22E2EA050](v52);
  -[IEEvent eventId](v4, "eventId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[IEEvent eventId](v4, "eventId");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = (const char *)-[NSObject UTF8String](v8, "UTF8String");
  }
  else
  {
    v12 = "null";
  }
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %s", v10, "eventId", v12);
  if (v11)

  if (v4)
  {
    -[IEEvent slots](v4, "slots");
    v13 = objc_claimAutoreleasedReturnValue();
    IE_NSObjectToVariable(v13, buf);
    if (buf[0].__r_.__value_.__r.__words[0]
    {
      v50 = (uint64_t)v14;
      size = buf[0].__r_.__value_.__l.__size_;
      if (buf[0].__r_.__value_.__l.__size_)
      {
        v15 = (unint64_t *)(buf[0].__r_.__value_.__l.__size_ + 8);
        do
          v16 = __ldxr(v15);
        while (__stxr(v16 + 1, v15));
      }
    }
    else
    {
      v50 = 0;
      size = 0;
    }
    v17 = (std::__shared_weak_count *)buf[0].__r_.__value_.__l.__size_;
    if (buf[0].__r_.__value_.__l.__size_)
    {
      v18 = (unint64_t *)(buf[0].__r_.__value_.__l.__size_ + 8);
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }

    if (v50)
    {
      siri::intelligence::VariableDictionary::GetValues(v50, (uint64_t)buf);
      v21 = buf[0].__r_.__value_.__l.__size_;
      for (i = (uint64_t *)buf[0].__r_.__value_.__r.__words[0]; i != (uint64_t *)v21; i += 2)
      {
        v23 = *i;
        v22 = (std::__shared_weak_count *)i[1];
        v48 = *i;
        v49 = v22;
        if (v22)
        {
          p_shared_owners = (unint64_t *)&v22->__shared_owners_;
          do
            v25 = __ldxr(p_shared_owners);
          while (__stxr(v25 + 1, p_shared_owners));
        }
        v26 = *(_QWORD *)self->mIntelligence;
        if (*(char *)(v23 + 31) < 0)
        {
          std::string::__init_copy_ctor_external(&v47, *(const std::string::value_type **)(v23 + 8), *(_QWORD *)(v23 + 16));
        }
        else
        {
          v27 = *(_OWORD *)(v23 + 8);
          v47.__r_.__value_.__r.__words[2] = *(_QWORD *)(v23 + 24);
          *(_OWORD *)&v47.__r_.__value_.__l.__data_ = v27;
        }
        v45 = v23;
        v46 = v22;
        if (v22)
        {
          v28 = (unint64_t *)&v22->__shared_owners_;
          do
            v29 = __ldxr(v28);
          while (__stxr(v29 + 1, v28));
        }
        siri::intelligence::Memory::SetVariable(v26 + 24, (uint64_t)&v47, &v45);
        v30 = v46;
        if (v46)
        {
          v31 = (unint64_t *)&v46->__shared_owners_;
          do
            v32 = __ldaxr(v31);
          while (__stlxr(v32 - 1, v31));
          if (!v32)
          {
            ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
            std::__shared_weak_count::__release_weak(v30);
          }
        }
        if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v47.__r_.__value_.__l.__data_);
        v33 = v49;
        if (v49)
        {
          v34 = (unint64_t *)&v49->__shared_owners_;
          do
            v35 = __ldaxr(v34);
          while (__stlxr(v35 - 1, v34));
          if (!v35)
          {
            ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
            std::__shared_weak_count::__release_weak(v33);
          }
        }
      }
      v47.__r_.__value_.__r.__words[0] = (std::string::size_type)buf;
      std::vector<std::shared_ptr<siri::intelligence::Variable>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v47);
    }
    mIntelligence = (siri::intelligence::Intelligence::Impl **)self->mIntelligence;
    IE_IEEventToIntent(v4, buf);
    siri::intelligence::Intelligence::SendIntent(mIntelligence, (const siri::intelligence::Intent *)buf, 0);
    siri::intelligence::Intent::~Intent((void **)&buf[0].__r_.__value_.__l.__data_);
    -[IEIntelligence getRemainingResponses](self, "getRemainingResponses");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (std::__shared_weak_count *)size;
    if (size)
    {
      v39 = (unint64_t *)(size + 8);
      do
        v40 = __ldaxr(v39);
      while (__stlxr(v40 - 1, v39));
      if (!v40)
      {
        ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
        std::__shared_weak_count::__release_weak(v38);
      }
    }
  }
  else
  {
    v37 = (void *)objc_opt_new();
  }
  IEDefer::~IEDefer(&v55);
  v41 = v54[0];
  v53 = &off_24F543888;
  v54[0] = 0;
  if (v41)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)v54, v41);
  v42 = v57;
  v56 = (const std::string *)&off_24F543888;
  v57 = 0;
  if (v42)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)&v57, v42);

  return v37;
}

void __31__IEIntelligence_processEvent___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t buf[16];

  SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'process(event:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((_QWORD *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)qword_253F45ED8;
  v5 = v4;
  v6 = *((_QWORD *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v5, OS_SIGNPOST_INTERVAL_END, v6, "process(event:)", (const char *)&unk_22B0CB3EF, buf, 2u);
  }

}

- (id)processText:(id)a3 withMode:(unint64_t)a4 withFallback:(unint64_t)a5
{
  id v8;
  unsigned __int8 v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  _BOOL4 v18;
  _BOOL4 v19;
  char *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(siri::intelligence::Utils *);
  void *v29;
  void (**v30)(siri::intelligence::Timer *__hidden);
  _QWORD v31[2];
  void (**v32)(void);
  std::string buf;
  const std::string *v34;
  uint64_t v35;

  v8 = a3;
  v9 = atomic_load((unsigned __int8 *)&qword_253F45EF0);
  if ((v9 & 1) == 0 && __cxa_guard_acquire(&qword_253F45EF0))
  {
    qword_253F45EE8 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_253F45EF0);
  }
  v10 = os_signpost_id_generate((os_log_t)qword_253F45EE8);
  v11 = (id)qword_253F45EE8;
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "process(text:mode:)", (const char *)&unk_22B0CB3EF, (uint8_t *)&buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(&buf, "process(text:mode:)");
  siri::intelligence::Timer::Timer(&v34, &buf);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"> Entering function 'process(text:mode:)'", v13);
  v26 = MEMORY[0x24BDAC760];
  v27 = 3321888768;
  v28 = __52__IEIntelligence_processText_withMode_withFallback___block_invoke;
  v29 = &__block_descriptor_56_ea8_32c31_ZTSN4siri12intelligence5TimerE_e5_v8__0l;
  siri::intelligence::Timer::Timer((siri::intelligence::Timer *)&v30, &v34);
  v31[1] = v10;
  v32 = (void (**)(void))MEMORY[0x22E2EA050](&v26);
  if (v8)
    v15 = (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
  else
    v15 = "null";
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %s", v14, "text", v15, v26, v27, v28, v29);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %d", v16, "mode", a4);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %d", v17, "fallback", a5);
  v18 = a4 == 1;
  v19 = a5 == 1;
  if (v8)
    v20 = (char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
  else
    v20 = "";
  std::string::basic_string[abi:ne180100]<0>(&buf, v20);
  if (siri::intelligence::Intelligence::SendText((uint64_t *)self->mIntelligence, &buf, v18, v19, 0))
  {
    -[IEIntelligence getRemainingResponses](self, "getRemainingResponses");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = objc_opt_new();
  }
  v22 = (void *)v21;
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  IEDefer::~IEDefer(&v32);
  v23 = v31[0];
  v30 = &off_24F543888;
  v31[0] = 0;
  if (v23)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)v31, v23);
  v24 = v35;
  v34 = (const std::string *)&off_24F543888;
  v35 = 0;
  if (v24)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)&v35, v24);

  return v22;
}

void __52__IEIntelligence_processText_withMode_withFallback___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t buf[16];

  SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'process(text:mode:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((_QWORD *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)qword_253F45EE8;
  v5 = v4;
  v6 = *((_QWORD *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v5, OS_SIGNPOST_INTERVAL_END, v6, "process(text:mode:)", (const char *)&unk_22B0CB3EF, buf, 2u);
  }

}

- (id)processText:(id)a3
{
  -[IEIntelligence processText:withMode:withFallback:](self, "processText:withMode:withFallback:", a3, 1, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)processActivity:(id)a3
{
  id v4;
  unsigned __int8 v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  std::string **mIntelligence;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(siri::intelligence::Utils *);
  void *v21;
  void (**v22)(siri::intelligence::Timer *__hidden);
  _QWORD v23[2];
  void (**v24)(void);
  std::string buf;
  const std::string *v26;
  uint64_t v27;

  v4 = a3;
  v5 = atomic_load((unsigned __int8 *)&qword_253F45F00);
  if ((v5 & 1) == 0 && __cxa_guard_acquire(&qword_253F45F00))
  {
    qword_253F45EF8 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_253F45F00);
  }
  v6 = os_signpost_id_generate((os_log_t)qword_253F45EF8);
  v7 = (id)qword_253F45EF8;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "process(activityId:)", (const char *)&unk_22B0CB3EF, (uint8_t *)&buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(&buf, "process(activityId:)");
  siri::intelligence::Timer::Timer(&v26, &buf);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"> Entering function 'process(activityId:)'", v9);
  v18 = MEMORY[0x24BDAC760];
  v19 = 3321888768;
  v20 = __34__IEIntelligence_processActivity___block_invoke;
  v21 = &__block_descriptor_56_ea8_32c31_ZTSN4siri12intelligence5TimerE_e5_v8__0l;
  siri::intelligence::Timer::Timer((siri::intelligence::Timer *)&v22, &v26);
  v23[1] = v6;
  v24 = (void (**)(void))MEMORY[0x22E2EA050](&v18);
  if (v4)
    v11 = (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  else
    v11 = "null";
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %s", v10, "activityId", v11, v18, v19, v20, v21);
  if (v4)
  {
    mIntelligence = (std::string **)self->mIntelligence;
    std::string::basic_string[abi:ne180100]<0>(&buf, (char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
    siri::intelligence::Intelligence::SendActivity(mIntelligence, (const char *)&buf);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    -[IEIntelligence getRemainingResponses](self, "getRemainingResponses");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = objc_opt_new();
  }
  v14 = (void *)v13;
  IEDefer::~IEDefer(&v24);
  v15 = v23[0];
  v22 = &off_24F543888;
  v23[0] = 0;
  if (v15)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)v23, v15);
  v16 = v27;
  v26 = (const std::string *)&off_24F543888;
  v27 = 0;
  if (v16)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)&v27, v16);

  return v14;
}

void __34__IEIntelligence_processActivity___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t buf[16];

  SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'process(activityId:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((_QWORD *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)qword_253F45EF8;
  v5 = v4;
  v6 = *((_QWORD *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v5, OS_SIGNPOST_INTERVAL_END, v6, "process(activityId:)", (const char *)&unk_22B0CB3EF, buf, 2u);
  }

}

- (id)getRemainingResponses
{
  unsigned __int8 v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  siri::intelligence::ExecStateResponse *v8;
  std::string::size_type size;
  const char *v10;
  std::string *v11;
  const char *v12;
  std::string *p_p;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  std::string __p;
  _QWORD v19[4];
  void (**v20)(siri::intelligence::Timer *__hidden);
  _QWORD v21[2];
  void (**v22)(void);
  std::string buf;
  const std::string *v24;
  uint64_t v25;

  v3 = atomic_load((unsigned __int8 *)&qword_253F45F10);
  if ((v3 & 1) == 0 && __cxa_guard_acquire(&qword_253F45F10))
  {
    qword_253F45F08 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_253F45F10);
  }
  v4 = os_signpost_id_generate((os_log_t)qword_253F45F08);
  v5 = (id)qword_253F45F08;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "remainingResponses()", (const char *)&unk_22B0CB3EF, (uint8_t *)&buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(&buf, "remainingResponses()");
  siri::intelligence::Timer::Timer(&v24, &buf);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"> Entering function 'remainingResponses()'", v7);
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3321888768;
  v19[2] = __39__IEIntelligence_getRemainingResponses__block_invoke;
  v19[3] = &__block_descriptor_56_ea8_32c31_ZTSN4siri12intelligence5TimerE_e5_v8__0l;
  siri::intelligence::Timer::Timer((siri::intelligence::Timer *)&v20, &v24);
  v21[1] = v4;
  v22 = (void (**)(void))MEMORY[0x22E2EA050](v19);
  siri::intelligence::Intelligence::ContinueConversationUntil((std::string **)self->mIntelligence, 1, (int64x2_t *)&buf);
  size = buf.__r_.__value_.__l.__size_;
  v8 = (siri::intelligence::ExecStateResponse *)buf.__r_.__value_.__r.__words[0];
  if (buf.__r_.__value_.__r.__words[0] == buf.__r_.__value_.__l.__size_)
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, "empty response array");
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    siri::intelligence::Log::Info((siri::intelligence::Log *)"- Returning %s", v12, p_p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  else
  {
    do
    {
      siri::intelligence::ExecStateResponse::GetDebugString(v8, &__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v11 = &__p;
      else
        v11 = (std::string *)__p.__r_.__value_.__r.__words[0];
      siri::intelligence::Log::Info((siri::intelligence::Log *)"- Returning %s", v10, v11);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      v8 = (siri::intelligence::ExecStateResponse *)((char *)v8 + 312);
    }
    while (v8 != (siri::intelligence::ExecStateResponse *)size);
  }
  IE_ResponseToIEResponse((const siri::intelligence::ExecStateResponse **)&buf);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&buf;
  std::vector<siri::intelligence::ExecStateResponse>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  IEDefer::~IEDefer(&v22);
  v15 = v21[0];
  v20 = &off_24F543888;
  v21[0] = 0;
  if (v15)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)v21, v15);
  v16 = v25;
  v24 = (const std::string *)&off_24F543888;
  v25 = 0;
  if (v16)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)&v25, v16);
  return v14;
}

void __39__IEIntelligence_getRemainingResponses__block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t buf[16];

  SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'remainingResponses()' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((_QWORD *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)qword_253F45F08;
  v5 = v4;
  v6 = *((_QWORD *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v5, OS_SIGNPOST_INTERVAL_END, v6, "remainingResponses()", (const char *)&unk_22B0CB3EF, buf, 2u);
  }

}

- (id)goTo:(id)a3
{
  id v4;
  unsigned __int8 v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  siri::intelligence::Intelligence::Impl **mIntelligence;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(siri::intelligence::Utils *);
  void *v21;
  void (**v22)(siri::intelligence::Timer *__hidden);
  _QWORD v23[2];
  void (**v24)(void);
  std::string buf;
  const std::string *v26;
  uint64_t v27;

  v4 = a3;
  v5 = atomic_load((unsigned __int8 *)&qword_253F45F20);
  if ((v5 & 1) == 0 && __cxa_guard_acquire(&qword_253F45F20))
  {
    qword_253F45F18 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_253F45F20);
  }
  v6 = os_signpost_id_generate((os_log_t)qword_253F45F18);
  v7 = (id)qword_253F45F18;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "goTo(responseId:)", (const char *)&unk_22B0CB3EF, (uint8_t *)&buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(&buf, "goTo(responseId:)");
  siri::intelligence::Timer::Timer(&v26, &buf);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"> Entering function 'goTo(responseId:)'", v9);
  v18 = MEMORY[0x24BDAC760];
  v19 = 3321888768;
  v20 = __23__IEIntelligence_goTo___block_invoke;
  v21 = &__block_descriptor_56_ea8_32c31_ZTSN4siri12intelligence5TimerE_e5_v8__0l;
  siri::intelligence::Timer::Timer((siri::intelligence::Timer *)&v22, &v26);
  v23[1] = v6;
  v24 = (void (**)(void))MEMORY[0x22E2EA050](&v18);
  if (v4)
    v11 = (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  else
    v11 = "null";
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %s", v10, "responseId", v11, v18, v19, v20, v21);
  if (v4)
  {
    mIntelligence = (siri::intelligence::Intelligence::Impl **)self->mIntelligence;
    std::string::basic_string[abi:ne180100]<0>(&buf, (char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
    siri::intelligence::Intelligence::Impl::GotoResponse(*mIntelligence, (uint64_t)&buf, 0);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    -[IEIntelligence getRemainingResponses](self, "getRemainingResponses");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = objc_opt_new();
  }
  v14 = (void *)v13;
  IEDefer::~IEDefer(&v24);
  v15 = v23[0];
  v22 = &off_24F543888;
  v23[0] = 0;
  if (v15)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)v23, v15);
  v16 = v27;
  v26 = (const std::string *)&off_24F543888;
  v27 = 0;
  if (v16)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)&v27, v16);

  return v14;
}

void __23__IEIntelligence_goTo___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t buf[16];

  SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'goTo(responseId:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((_QWORD *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)qword_253F45F18;
  v5 = v4;
  v6 = *((_QWORD *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v5, OS_SIGNPOST_INTERVAL_END, v6, "goTo(responseId:)", (const char *)&unk_22B0CB3EF, buf, 2u);
  }

}

- (BOOL)willHandleEvent:(id)a3
{
  IEEvent *v4;
  unsigned __int8 v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  const char *v10;
  void *v11;
  const char *v12;
  siri::intelligence::Intelligence::Impl **mIntelligence;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  std::string buf[11];
  _QWORD v19[4];
  void (**v20)(siri::intelligence::Timer *__hidden);
  _QWORD v21[2];
  void (**v22)(void);
  const std::string *v23;
  uint64_t v24;

  v4 = (IEEvent *)a3;
  v5 = atomic_load((unsigned __int8 *)&qword_253F45F30);
  if ((v5 & 1) == 0 && __cxa_guard_acquire(&qword_253F45F30))
  {
    qword_253F45F28 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_253F45F30);
  }
  v6 = os_signpost_id_generate((os_log_t)qword_253F45F28);
  v7 = (id)qword_253F45F28;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "willHandle(event:)", (const char *)&unk_22B0CB3EF, (uint8_t *)buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "willHandle(event:)");
  siri::intelligence::Timer::Timer(&v23, buf);
  if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf[0].__r_.__value_.__l.__data_);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"> Entering function 'willHandle(event:)'", v9);
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3321888768;
  v19[2] = __34__IEIntelligence_willHandleEvent___block_invoke;
  v19[3] = &__block_descriptor_56_ea8_32c31_ZTSN4siri12intelligence5TimerE_e5_v8__0l;
  siri::intelligence::Timer::Timer((siri::intelligence::Timer *)&v20, &v23);
  v21[1] = v6;
  v22 = (void (**)(void))MEMORY[0x22E2EA050](v19);
  -[IEEvent eventId](v4, "eventId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[IEEvent eventId](v4, "eventId");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = (const char *)-[NSObject UTF8String](v8, "UTF8String");
  }
  else
  {
    v12 = "null";
  }
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %s", v10, "eventId", v12);
  if (v11)

  if (v4 && -[IEIntelligence isActive](self, "isActive"))
  {
    mIntelligence = (siri::intelligence::Intelligence::Impl **)self->mIntelligence;
    IE_IEEventToIntent(v4, buf);
    v14 = siri::intelligence::Intelligence::WillHandleIntent(mIntelligence, (const siri::intelligence::Intent *)buf);
    siri::intelligence::Intent::~Intent((void **)&buf[0].__r_.__value_.__l.__data_);
  }
  else
  {
    v14 = 0;
  }
  IEDefer::~IEDefer(&v22);
  v15 = v21[0];
  v20 = &off_24F543888;
  v21[0] = 0;
  if (v15)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)v21, v15);
  v16 = v24;
  v23 = (const std::string *)&off_24F543888;
  v24 = 0;
  if (v16)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)&v24, v16);

  return v14;
}

void __34__IEIntelligence_willHandleEvent___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t buf[16];

  SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'willHandle(event:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((_QWORD *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)qword_253F45F28;
  v5 = v4;
  v6 = *((_QWORD *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v5, OS_SIGNPOST_INTERVAL_END, v6, "willHandle(event:)", (const char *)&unk_22B0CB3EF, buf, 2u);
  }

}

- (id)getEvents
{
  unsigned __int8 v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  std::string::size_type i;
  std::string::size_type size;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  void *v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  siri::intelligence::Intent *v21;
  std::__shared_weak_count *v22;
  _QWORD v23[4];
  void (**v24)(siri::intelligence::Timer *__hidden);
  _QWORD v25[2];
  void (**v26)(void);
  std::string buf;
  const std::string *v28;
  uint64_t v29;
  std::string *p_buf;

  v3 = atomic_load((unsigned __int8 *)&qword_253F45F40);
  if ((v3 & 1) == 0 && __cxa_guard_acquire(&qword_253F45F40))
  {
    qword_253F45F38 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_253F45F40);
  }
  v4 = os_signpost_id_generate((os_log_t)qword_253F45F38);
  v5 = (id)qword_253F45F38;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "events()", (const char *)&unk_22B0CB3EF, (uint8_t *)&buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(&buf, "events()");
  siri::intelligence::Timer::Timer(&v28, &buf);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"> Entering function 'events()'", v7);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3321888768;
  v23[2] = __27__IEIntelligence_getEvents__block_invoke;
  v23[3] = &__block_descriptor_56_ea8_32c31_ZTSN4siri12intelligence5TimerE_e5_v8__0l;
  siri::intelligence::Timer::Timer((siri::intelligence::Timer *)&v24, &v28);
  v25[1] = v4;
  v26 = (void (**)(void))MEMORY[0x22E2EA050](v23);
  v8 = (void *)objc_opt_new();
  siri::intelligence::FlowGraph::GetIntents(*(_QWORD *)self->mIntelligence + 8, (uint64_t)&buf);
  size = buf.__r_.__value_.__l.__size_;
  for (i = buf.__r_.__value_.__r.__words[0]; i != size; i += 16)
  {
    v11 = *(std::__shared_weak_count **)(i + 8);
    v21 = *(siri::intelligence::Intent **)i;
    v22 = v11;
    if (v11)
    {
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      do
        v13 = __ldxr(p_shared_owners);
      while (__stxr(v13 + 1, p_shared_owners));
    }
    IE_IntentToIEEvent(&v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v14, v21);

    v15 = v22;
    if (v22)
    {
      v16 = (unint64_t *)&v22->__shared_owners_;
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
  }
  p_buf = &buf;
  std::vector<std::shared_ptr<siri::intelligence::Variable>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_buf);
  IEDefer::~IEDefer(&v26);
  v18 = v25[0];
  v24 = &off_24F543888;
  v25[0] = 0;
  if (v18)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)v25, v18);
  v19 = v29;
  v28 = (const std::string *)&off_24F543888;
  v29 = 0;
  if (v19)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)&v29, v19);
  return v8;
}

void __27__IEIntelligence_getEvents__block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t buf[16];

  SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'events()' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((_QWORD *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)qword_253F45F38;
  v5 = v4;
  v6 = *((_QWORD *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v5, OS_SIGNPOST_INTERVAL_END, v6, "events()", (const char *)&unk_22B0CB3EF, buf, 2u);
  }

}

- (id)getActiveEventsWithScope:(int)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  void *v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  siri::intelligence::Intent *v16;
  std::__shared_weak_count *v17;
  _QWORD v18[3];
  void **v19;

  v5 = (void *)objc_opt_new();
  if (-[IEIntelligence isActive](self, "isActive"))
  {
    siri::intelligence::Intelligence::GetActiveIntents((siri::intelligence::Intelligence::Impl **)self->mIntelligence, a3, (uint64_t)v18);
    v6 = v18[0];
    v7 = v18[1];
    while (v6 != v7)
    {
      v8 = *(std::__shared_weak_count **)(v6 + 8);
      v16 = *(siri::intelligence::Intent **)v6;
      v17 = v8;
      if (v8)
      {
        p_shared_owners = (unint64_t *)&v8->__shared_owners_;
        do
          v10 = __ldxr(p_shared_owners);
        while (__stxr(v10 + 1, p_shared_owners));
      }
      IE_IntentToIEEvent(&v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v11, v16);

      v12 = v17;
      if (v17)
      {
        v13 = (unint64_t *)&v17->__shared_owners_;
        do
          v14 = __ldaxr(v13);
        while (__stlxr(v14 - 1, v13));
        if (!v14)
        {
          ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
          std::__shared_weak_count::__release_weak(v12);
        }
      }
      v6 += 16;
    }
    v19 = (void **)v18;
    std::vector<std::shared_ptr<siri::intelligence::Variable>>::__destroy_vector::operator()[abi:ne180100](&v19);
  }
  return v5;
}

- (id)activeEvents
{
  unsigned __int8 v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[4];
  void (**v13)(siri::intelligence::Timer *__hidden);
  _QWORD v14[2];
  std::string buf;
  const std::string *v16;
  uint64_t v17;

  v3 = atomic_load((unsigned __int8 *)&qword_253F45F50);
  if ((v3 & 1) == 0 && __cxa_guard_acquire(&qword_253F45F50))
  {
    qword_253F45F48 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_253F45F50);
  }
  v4 = os_signpost_id_generate((os_log_t)qword_253F45F48);
  v5 = (id)qword_253F45F48;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "activeEvents()", (const char *)&unk_22B0CB3EF, (uint8_t *)&buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(&buf, "activeEvents()");
  siri::intelligence::Timer::Timer(&v16, &buf);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"> Entering function 'activeEvents()'", v7);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3321888768;
  v12[2] = __30__IEIntelligence_activeEvents__block_invoke;
  v12[3] = &__block_descriptor_56_ea8_32c31_ZTSN4siri12intelligence5TimerE_e5_v8__0l;
  siri::intelligence::Timer::Timer((siri::intelligence::Timer *)&v13, &v16);
  v14[1] = v4;
  buf.__r_.__value_.__r.__words[0] = MEMORY[0x22E2EA050](v12);
  -[IEIntelligence getActiveEventsWithScope:](self, "getActiveEventsWithScope:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  IEDefer::~IEDefer((void (***)(void))&buf);
  v9 = v14[0];
  v13 = &off_24F543888;
  v14[0] = 0;
  if (v9)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)v14, v9);
  v10 = v17;
  v16 = (const std::string *)&off_24F543888;
  v17 = 0;
  if (v10)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)&v17, v10);
  return v8;
}

void __30__IEIntelligence_activeEvents__block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t buf[16];

  SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'activeEvents()' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((_QWORD *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)qword_253F45F48;
  v5 = v4;
  v6 = *((_QWORD *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v5, OS_SIGNPOST_INTERVAL_END, v6, "activeEvents()", (const char *)&unk_22B0CB3EF, buf, 2u);
  }

}

- (id)activeLocalEvents
{
  unsigned __int8 v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[4];
  void (**v13)(siri::intelligence::Timer *__hidden);
  _QWORD v14[2];
  std::string buf;
  const std::string *v16;
  uint64_t v17;

  v3 = atomic_load((unsigned __int8 *)&qword_253F45F60);
  if ((v3 & 1) == 0 && __cxa_guard_acquire(&qword_253F45F60))
  {
    qword_253F45F58 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_253F45F60);
  }
  v4 = os_signpost_id_generate((os_log_t)qword_253F45F58);
  v5 = (id)qword_253F45F58;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "activeLocalEvents()", (const char *)&unk_22B0CB3EF, (uint8_t *)&buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(&buf, "activeLocalEvents()");
  siri::intelligence::Timer::Timer(&v16, &buf);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"> Entering function 'activeLocalEvents()'", v7);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3321888768;
  v12[2] = __35__IEIntelligence_activeLocalEvents__block_invoke;
  v12[3] = &__block_descriptor_56_ea8_32c31_ZTSN4siri12intelligence5TimerE_e5_v8__0l;
  siri::intelligence::Timer::Timer((siri::intelligence::Timer *)&v13, &v16);
  v14[1] = v4;
  buf.__r_.__value_.__r.__words[0] = MEMORY[0x22E2EA050](v12);
  -[IEIntelligence getActiveEventsWithScope:](self, "getActiveEventsWithScope:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  IEDefer::~IEDefer((void (***)(void))&buf);
  v9 = v14[0];
  v13 = &off_24F543888;
  v14[0] = 0;
  if (v9)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)v14, v9);
  v10 = v17;
  v16 = (const std::string *)&off_24F543888;
  v17 = 0;
  if (v10)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)&v17, v10);
  return v8;
}

void __35__IEIntelligence_activeLocalEvents__block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t buf[16];

  SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'activeLocalEvents()' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((_QWORD *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)qword_253F45F58;
  v5 = v4;
  v6 = *((_QWORD *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v5, OS_SIGNPOST_INTERVAL_END, v6, "activeLocalEvents()", (const char *)&unk_22B0CB3EF, buf, 2u);
  }

}

- (BOOL)hasActiveFallback
{
  unsigned __int8 v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  siri::intelligence::Intelligence::Impl **mIntelligence;
  char HasActiveFallback;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[4];
  void (**v14)(siri::intelligence::Timer *__hidden);
  _QWORD v15[2];
  std::string buf;
  const std::string *v17;
  uint64_t v18;

  v3 = atomic_load((unsigned __int8 *)&qword_253F45F70);
  if ((v3 & 1) == 0 && __cxa_guard_acquire(&qword_253F45F70))
  {
    qword_253F45F68 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_253F45F70);
  }
  v4 = os_signpost_id_generate((os_log_t)qword_253F45F68);
  v5 = (id)qword_253F45F68;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "hasActiveFallback()", (const char *)&unk_22B0CB3EF, (uint8_t *)&buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(&buf, "hasActiveFallback()");
  siri::intelligence::Timer::Timer(&v17, &buf);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"> Entering function 'hasActiveFallback()'", v7);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3321888768;
  v13[2] = __35__IEIntelligence_hasActiveFallback__block_invoke;
  v13[3] = &__block_descriptor_56_ea8_32c31_ZTSN4siri12intelligence5TimerE_e5_v8__0l;
  siri::intelligence::Timer::Timer((siri::intelligence::Timer *)&v14, &v17);
  v15[1] = v4;
  buf.__r_.__value_.__r.__words[0] = MEMORY[0x22E2EA050](v13);
  mIntelligence = (siri::intelligence::Intelligence::Impl **)self->mIntelligence;
  if (mIntelligence)
    HasActiveFallback = siri::intelligence::Intelligence::HasActiveFallback(mIntelligence, 0);
  else
    HasActiveFallback = 0;
  IEDefer::~IEDefer((void (***)(void))&buf);
  v10 = v15[0];
  v14 = &off_24F543888;
  v15[0] = 0;
  if (v10)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)v15, v10);
  v11 = v18;
  v17 = (const std::string *)&off_24F543888;
  v18 = 0;
  if (v11)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)&v18, v11);
  return HasActiveFallback;
}

void __35__IEIntelligence_hasActiveFallback__block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t buf[16];

  SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'hasActiveFallback()' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((_QWORD *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)qword_253F45F68;
  v5 = v4;
  v6 = *((_QWORD *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v5, OS_SIGNPOST_INTERVAL_END, v6, "hasActiveFallback()", (const char *)&unk_22B0CB3EF, buf, 2u);
  }

}

- (BOOL)willHandleDirectInvocation:(id)a3
{
  IEDirectInvocation *v4;
  unsigned __int8 v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  const char *v10;
  void *v11;
  const char *v12;
  siri::intelligence::Intelligence::Impl **mIntelligence;
  BOOL v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  std::string buf;
  std::__shared_weak_count *v22;
  _QWORD v23[4];
  void (**v24)(siri::intelligence::Timer *__hidden);
  _QWORD v25[2];
  void (**v26)(void);
  const std::string *v27;
  uint64_t v28;

  v4 = (IEDirectInvocation *)a3;
  v5 = atomic_load((unsigned __int8 *)&qword_253F45F80);
  if ((v5 & 1) == 0 && __cxa_guard_acquire(&qword_253F45F80))
  {
    qword_253F45F78 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_253F45F80);
  }
  v6 = os_signpost_id_generate((os_log_t)qword_253F45F78);
  v7 = (id)qword_253F45F78;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "willHandle(invocation:)", (const char *)&unk_22B0CB3EF, (uint8_t *)&buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(&buf, "willHandle(invocation:)");
  siri::intelligence::Timer::Timer(&v27, &buf);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"> Entering function 'willHandle(invocation:)'", v9);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3321888768;
  v23[2] = __45__IEIntelligence_willHandleDirectInvocation___block_invoke;
  v23[3] = &__block_descriptor_56_ea8_32c31_ZTSN4siri12intelligence5TimerE_e5_v8__0l;
  siri::intelligence::Timer::Timer((siri::intelligence::Timer *)&v24, &v27);
  v25[1] = v6;
  v26 = (void (**)(void))MEMORY[0x22E2EA050](v23);
  -[IEDirectInvocation identifier](v4, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[IEDirectInvocation identifier](v4, "identifier");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = (const char *)-[NSObject UTF8String](v8, "UTF8String");
  }
  else
  {
    v12 = "null";
  }
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %s", v10, "invocationId", v12);
  if (v11)

  if (v4 && -[IEIntelligence isActive](self, "isActive"))
  {
    mIntelligence = (siri::intelligence::Intelligence::Impl **)self->mIntelligence;
    IE_IEDirectInvocationToDirectInvocation(v4, (uint64_t)&buf);
    v14 = siri::intelligence::Intelligence::WillHandleDirectInvocation(mIntelligence, &buf);
    v15 = v22;
    if (v22)
    {
      p_shared_owners = (unint64_t *)&v22->__shared_owners_;
      do
        v17 = __ldaxr(p_shared_owners);
      while (__stlxr(v17 - 1, p_shared_owners));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
  }
  else
  {
    v14 = 0;
  }
  IEDefer::~IEDefer(&v26);
  v18 = v25[0];
  v24 = &off_24F543888;
  v25[0] = 0;
  if (v18)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)v25, v18);
  v19 = v28;
  v27 = (const std::string *)&off_24F543888;
  v28 = 0;
  if (v19)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)&v28, v19);

  return v14;
}

void __45__IEIntelligence_willHandleDirectInvocation___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t buf[16];

  SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'willHandle(invocation:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((_QWORD *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)qword_253F45F78;
  v5 = v4;
  v6 = *((_QWORD *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v5, OS_SIGNPOST_INTERVAL_END, v6, "willHandle(invocation:)", (const char *)&unk_22B0CB3EF, buf, 2u);
  }

}

- (id)processDirectInvocation:(id)a3
{
  IEDirectInvocation *v4;
  unsigned __int8 v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  const char *v10;
  void *v11;
  const char *v12;
  siri::intelligence::Intelligence::Impl **mIntelligence;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  std::string buf;
  std::__shared_weak_count *v23;
  _QWORD v24[4];
  void (**v25)(siri::intelligence::Timer *__hidden);
  _QWORD v26[2];
  void (**v27)(void);
  const std::string *v28;
  uint64_t v29;

  v4 = (IEDirectInvocation *)a3;
  v5 = atomic_load((unsigned __int8 *)&qword_253F45F90);
  if ((v5 & 1) == 0 && __cxa_guard_acquire(&qword_253F45F90))
  {
    qword_253F45F88 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_253F45F90);
  }
  v6 = os_signpost_id_generate((os_log_t)qword_253F45F88);
  v7 = (id)qword_253F45F88;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "process(invocation:)", (const char *)&unk_22B0CB3EF, (uint8_t *)&buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(&buf, "process(invocation:)");
  siri::intelligence::Timer::Timer(&v28, &buf);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"> Entering function 'process(invocation:)'", v9);
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3321888768;
  v24[2] = __42__IEIntelligence_processDirectInvocation___block_invoke;
  v24[3] = &__block_descriptor_56_ea8_32c31_ZTSN4siri12intelligence5TimerE_e5_v8__0l;
  siri::intelligence::Timer::Timer((siri::intelligence::Timer *)&v25, &v28);
  v26[1] = v6;
  v27 = (void (**)(void))MEMORY[0x22E2EA050](v24);
  -[IEDirectInvocation identifier](v4, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[IEDirectInvocation identifier](v4, "identifier");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = (const char *)-[NSObject UTF8String](v8, "UTF8String");
  }
  else
  {
    v12 = "null";
  }
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %s", v10, "invocationId", v12);
  if (v11)

  if (v4 && -[IEIntelligence isActive](self, "isActive"))
  {
    mIntelligence = (siri::intelligence::Intelligence::Impl **)self->mIntelligence;
    IE_IEDirectInvocationToDirectInvocation(v4, (uint64_t)&buf);
    siri::intelligence::Intelligence::SendDirectInvocation(mIntelligence, &buf);
    v14 = v23;
    if (v23)
    {
      p_shared_owners = (unint64_t *)&v23->__shared_owners_;
      do
        v16 = __ldaxr(p_shared_owners);
      while (__stlxr(v16 - 1, p_shared_owners));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    -[IEIntelligence getRemainingResponses](self, "getRemainingResponses");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = objc_opt_new();
  }
  v18 = (void *)v17;
  IEDefer::~IEDefer(&v27);
  v19 = v26[0];
  v25 = &off_24F543888;
  v26[0] = 0;
  if (v19)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)v26, v19);
  v20 = v29;
  v28 = (const std::string *)&off_24F543888;
  v29 = 0;
  if (v20)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)&v29, v20);

  return v18;
}

void __42__IEIntelligence_processDirectInvocation___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t buf[16];

  SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'process(invocation:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((_QWORD *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)qword_253F45F88;
  v5 = v4;
  v6 = *((_QWORD *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v5, OS_SIGNPOST_INTERVAL_END, v6, "process(invocation:)", (const char *)&unk_22B0CB3EF, buf, 2u);
  }

}

- (id)getInputGroup:(id)a3
{
  id v4;
  unsigned __int8 v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  void *mIntelligence;
  uint64_t *v13;
  const char *v14;
  std::string *p_buf;
  void *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v28;
  std::__shared_weak_count *v29;
  siri::intelligence::InputGroup *v30;
  std::__shared_weak_count *v31;
  _QWORD v32[4];
  void (**v33)(siri::intelligence::Timer *__hidden);
  _QWORD v34[2];
  void (**v35)(void);
  std::string buf;
  const std::string *v37;
  uint64_t v38;

  v4 = a3;
  v5 = atomic_load((unsigned __int8 *)&qword_253F45FA0);
  if ((v5 & 1) == 0 && __cxa_guard_acquire(&qword_253F45FA0))
  {
    qword_253F45F98 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_253F45FA0);
  }
  v6 = os_signpost_id_generate((os_log_t)qword_253F45F98);
  v7 = (id)qword_253F45F98;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "inputGroup(id:)", (const char *)&unk_22B0CB3EF, (uint8_t *)&buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(&buf, "inputGroup(id:)");
  siri::intelligence::Timer::Timer(&v37, &buf);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"> Entering function 'inputGroup(id:)'", v9);
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3321888768;
  v32[2] = __32__IEIntelligence_getInputGroup___block_invoke;
  v32[3] = &__block_descriptor_56_ea8_32c31_ZTSN4siri12intelligence5TimerE_e5_v8__0l;
  siri::intelligence::Timer::Timer((siri::intelligence::Timer *)&v33, &v37);
  v34[1] = v6;
  v35 = (void (**)(void))MEMORY[0x22E2EA050](v32);
  if (v4)
    v11 = (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  else
    v11 = "null";
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %s", v10, "id", v11);
  if (v4)
  {
    mIntelligence = self->mIntelligence;
    std::string::basic_string[abi:ne180100]<0>(&buf, (char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
    siri::intelligence::FlowGraph::GetInputGroup((_QWORD *)(*(_QWORD *)mIntelligence + 8), (uint64_t)&buf, &v30);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    v13 = (uint64_t *)v30;
    if (v30)
    {
      siri::intelligence::InputGroup::GetDebugString(v30, &buf);
      if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_buf = &buf;
      else
        p_buf = (std::string *)buf.__r_.__value_.__r.__words[0];
    }
    else
    {
      std::string::basic_string[abi:ne180100]<0>(&buf, "null input group");
      if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_buf = &buf;
      else
        p_buf = (std::string *)buf.__r_.__value_.__r.__words[0];
    }
    siri::intelligence::Log::Info((siri::intelligence::Log *)"- Returning %s", v14, p_buf);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    v28 = v13;
    v29 = v31;
    if (v31)
    {
      p_shared_owners = (unint64_t *)&v31->__shared_owners_;
      do
        v18 = __ldxr(p_shared_owners);
      while (__stxr(v18 + 1, p_shared_owners));
    }
    IE_InputGroupToIEInputGroup(&v28);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v29;
    if (v29)
    {
      v20 = (unint64_t *)&v29->__shared_owners_;
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
    v22 = v31;
    if (v31)
    {
      v23 = (unint64_t *)&v31->__shared_owners_;
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
  }
  else
  {
    v16 = 0;
  }
  IEDefer::~IEDefer(&v35);
  v25 = v34[0];
  v33 = &off_24F543888;
  v34[0] = 0;
  if (v25)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)v34, v25);
  v26 = v38;
  v37 = (const std::string *)&off_24F543888;
  v38 = 0;
  if (v26)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)&v38, v26);

  return v16;
}

void __32__IEIntelligence_getInputGroup___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t buf[16];

  SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'inputGroup(id:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((_QWORD *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)qword_253F45F98;
  v5 = v4;
  v6 = *((_QWORD *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v5, OS_SIGNPOST_INTERVAL_END, v6, "inputGroup(id:)", (const char *)&unk_22B0CB3EF, buf, 2u);
  }

}

- (BOOL)isActive
{
  unsigned __int8 v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  BOOL IsDeadEnd;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[4];
  void (**v13)(siri::intelligence::Timer *__hidden);
  _QWORD v14[2];
  std::string buf;
  const std::string *v16;
  uint64_t v17;

  v3 = atomic_load((unsigned __int8 *)&qword_253F45FB0);
  if ((v3 & 1) == 0 && __cxa_guard_acquire(&qword_253F45FB0))
  {
    qword_253F45FA8 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_253F45FB0);
  }
  v4 = os_signpost_id_generate((os_log_t)qword_253F45FA8);
  v5 = (id)qword_253F45FA8;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "isActive()", (const char *)&unk_22B0CB3EF, (uint8_t *)&buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(&buf, "isActive()");
  siri::intelligence::Timer::Timer(&v16, &buf);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"> Entering function 'isActive()'", v7);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3321888768;
  v12[2] = __26__IEIntelligence_isActive__block_invoke;
  v12[3] = &__block_descriptor_56_ea8_32c31_ZTSN4siri12intelligence5TimerE_e5_v8__0l;
  siri::intelligence::Timer::Timer((siri::intelligence::Timer *)&v13, &v16);
  v14[1] = v4;
  buf.__r_.__value_.__r.__words[0] = MEMORY[0x22E2EA050](v12);
  IsDeadEnd = siri::intelligence::ExecutionState::IsDeadEnd((uint64_t **)(*(_QWORD *)self->mIntelligence + 96));
  IEDefer::~IEDefer((void (***)(void))&buf);
  v9 = v14[0];
  v13 = &off_24F543888;
  v14[0] = 0;
  if (v9)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)v14, v9);
  v10 = v17;
  v16 = (const std::string *)&off_24F543888;
  v17 = 0;
  if (v10)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)&v17, v10);
  return !IsDeadEnd;
}

void __26__IEIntelligence_isActive__block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t buf[16];

  SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'isActive()' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((_QWORD *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)qword_253F45FA8;
  v5 = v4;
  v6 = *((_QWORD *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v5, OS_SIGNPOST_INTERVAL_END, v6, "isActive()", (const char *)&unk_22B0CB3EF, buf, 2u);
  }

}

- (id)getVariables
{
  unsigned __int8 v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  std::string::size_type v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  __int128 *v17;
  char IsGlobalVariable;
  char v19;
  unint64_t *v20;
  unint64_t v21;
  void *v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  void *v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  __int128 *v30;
  __int128 *v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  siri::intelligence::Variable *v36;
  std::__shared_weak_count *v37;
  void *__p[2];
  char v39;
  std::string buf;
  siri::intelligence::Variable *v41;
  std::__shared_weak_count *v42;
  __int128 *v43;
  _QWORD *v44[2];
  uint64_t v45[3];
  _QWORD v46[4];
  void (**v47)(siri::intelligence::Timer *__hidden);
  _QWORD v48[2];
  void (**v49)(void);
  const std::string *v50;
  uint64_t v51;

  v3 = atomic_load((unsigned __int8 *)&qword_253F45FC0);
  if ((v3 & 1) == 0 && __cxa_guard_acquire(&qword_253F45FC0))
  {
    qword_253F45FB8 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_253F45FC0);
  }
  v4 = os_signpost_id_generate((os_log_t)qword_253F45FB8);
  v5 = (id)qword_253F45FB8;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "variables()", (const char *)&unk_22B0CB3EF, (uint8_t *)&buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(&buf, "variables()");
  siri::intelligence::Timer::Timer(&v50, &buf);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"> Entering function 'variables()'", v7);
  v46[0] = MEMORY[0x24BDAC760];
  v46[1] = 3321888768;
  v46[2] = __30__IEIntelligence_getVariables__block_invoke;
  v46[3] = &__block_descriptor_56_ea8_32c31_ZTSN4siri12intelligence5TimerE_e5_v8__0l;
  siri::intelligence::Timer::Timer((siri::intelligence::Timer *)&v47, &v50);
  v48[1] = v4;
  v49 = (void (**)(void))MEMORY[0x22E2EA050](v46);
  v8 = (void *)objc_opt_new();
  siri::intelligence::Intelligence::GetGlobalVariables(v45);
  v9 = *(_QWORD *)self->mIntelligence;
  v10 = *(_QWORD *)(v9 + 24);
  v12 = *(std::__shared_weak_count **)(v9 + 32);
  v11 = v9 + 24;
  buf.__r_.__value_.__r.__words[0] = v10;
  buf.__r_.__value_.__l.__size_ = (std::string::size_type)v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v14 = __ldxr(p_shared_owners);
    while (__stxr(v14 + 1, p_shared_owners));
  }
  std::map<std::string,std::shared_ptr<siri::intelligence::Variable>>::map[abi:ne180100]((uint64_t *)&v43, (const void ***)(v10 + 72));
  if (v12)
  {
    v15 = (unint64_t *)&v12->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  v17 = v43;
  if (v43 != (__int128 *)v44)
  {
    do
    {
      std::pair<std::string const,std::shared_ptr<siri::intelligence::Variable>>::pair[abi:ne180100](&buf, v17 + 2);
      siri::intelligence::Variable::GetFullKey(v41, (uint64_t)__p);
      IsGlobalVariable = siri::intelligence::Memory::IsGlobalVariable(v11, (unsigned __int8 *)__p);
      v19 = IsGlobalVariable;
      if (v39 < 0)
      {
        operator delete(__p[0]);
        if ((v19 & 1) == 0)
        {
LABEL_20:
          v36 = v41;
          v37 = v42;
          if (v42)
          {
            v20 = (unint64_t *)&v42->__shared_owners_;
            do
              v21 = __ldxr(v20);
            while (__stxr(v21 + 1, v20));
          }
          IE_VariableToIEVariable((uint64_t *)&v36);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v37;
          if (v37)
          {
            v24 = (unint64_t *)&v37->__shared_owners_;
            do
              v25 = __ldaxr(v24);
            while (__stlxr(v25 - 1, v24));
            if (!v25)
            {
              ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
              std::__shared_weak_count::__release_weak(v23);
            }
          }
          objc_msgSend(v22, "name");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKey:", v22, v26);

        }
      }
      else if ((IsGlobalVariable & 1) == 0)
      {
        goto LABEL_20;
      }
      v27 = v42;
      if (v42)
      {
        v28 = (unint64_t *)&v42->__shared_owners_;
        do
          v29 = __ldaxr(v28);
        while (__stlxr(v29 - 1, v28));
        if (!v29)
        {
          ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
          std::__shared_weak_count::__release_weak(v27);
        }
      }
      if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf.__r_.__value_.__l.__data_);
      v30 = (__int128 *)*((_QWORD *)v17 + 1);
      if (v30)
      {
        do
        {
          v31 = v30;
          v30 = *(__int128 **)v30;
        }
        while (v30);
      }
      else
      {
        do
        {
          v31 = (__int128 *)*((_QWORD *)v17 + 2);
          v32 = *(_QWORD *)v31 == (_QWORD)v17;
          v17 = v31;
        }
        while (!v32);
      }
      v17 = v31;
    }
    while (v31 != (__int128 *)v44);
  }
  std::__tree<std::__value_type<std::string,std::shared_ptr<siri::intelligence::Variable>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<siri::intelligence::Variable>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<siri::intelligence::Variable>>>>::destroy((uint64_t)&v43, v44[0]);
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)v45, (_QWORD *)v45[1]);
  IEDefer::~IEDefer(&v49);
  v33 = v48[0];
  v47 = &off_24F543888;
  v48[0] = 0;
  if (v33)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)v48, v33);
  v34 = v51;
  v50 = (const std::string *)&off_24F543888;
  v51 = 0;
  if (v34)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)&v51, v34);
  return v8;
}

void __30__IEIntelligence_getVariables__block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t buf[16];

  SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'variables()' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((_QWORD *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)qword_253F45FB8;
  v5 = v4;
  v6 = *((_QWORD *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v5, OS_SIGNPOST_INTERVAL_END, v6, "variables()", (const char *)&unk_22B0CB3EF, buf, 2u);
  }

}

- (BOOL)setVariable:(id)a3 withValue:(id)a4
{
  id v6;
  NSObject *v7;
  unsigned __int8 v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  std::string *p_buf;
  char v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  std::__shared_weak_count *v32;
  void *__p[2];
  char v34;
  uint64_t v35;
  std::__shared_weak_count *v36;
  _QWORD v37[4];
  void (**v38)(siri::intelligence::Timer *__hidden);
  _QWORD v39[2];
  void (**v40)(void);
  std::string buf;
  const std::string *v42;
  uint64_t v43;

  v6 = a3;
  v7 = a4;
  v8 = atomic_load((unsigned __int8 *)&qword_253F45FD0);
  if ((v8 & 1) == 0 && __cxa_guard_acquire(&qword_253F45FD0))
  {
    qword_253F45FC8 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_253F45FD0);
  }
  v9 = os_signpost_id_generate((os_log_t)qword_253F45FC8);
  v10 = (id)qword_253F45FC8;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "setVariable(name:value:)", (const char *)&unk_22B0CB3EF, (uint8_t *)&buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(&buf, "setVariable(name:value:)");
  siri::intelligence::Timer::Timer(&v42, &buf);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"> Entering function 'setVariable(name:value:)'", v12);
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3321888768;
  v37[2] = __40__IEIntelligence_setVariable_withValue___block_invoke;
  v37[3] = &__block_descriptor_56_ea8_32c31_ZTSN4siri12intelligence5TimerE_e5_v8__0l;
  siri::intelligence::Timer::Timer((siri::intelligence::Timer *)&v38, &v42);
  v39[1] = v9;
  v40 = (void (**)(void))MEMORY[0x22E2EA050](v37);
  if (v6)
    v14 = (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  else
    v14 = "null";
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %s", v13, "name", v14);
  if (v6)
  {
    v15 = *(_QWORD *)self->mIntelligence;
    IE_NSObjectToVariable(v7, &v35);
    v17 = v35;
    if (v35)
    {
      (*(void (**)(std::string *__return_ptr, uint64_t))(*(_QWORD *)v35 + 56))(&buf, v35);
      if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_buf = &buf;
      else
        p_buf = (std::string *)buf.__r_.__value_.__r.__words[0];
    }
    else
    {
      p_buf = (std::string *)"null";
    }
    siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %s", v16, "value", p_buf);
    if (v17 && SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
    v31 = v35;
    v32 = v36;
    if (v36)
    {
      p_shared_owners = (unint64_t *)&v36->__shared_owners_;
      do
        v21 = __ldxr(p_shared_owners);
      while (__stxr(v21 + 1, p_shared_owners));
    }
    v19 = siri::intelligence::Memory::SetVariable(v15 + 24, (uint64_t)__p, &v31);
    v22 = v32;
    if (v32)
    {
      v23 = (unint64_t *)&v32->__shared_owners_;
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
    if (v34 < 0)
      operator delete(__p[0]);
    v25 = v36;
    if (v36)
    {
      v26 = (unint64_t *)&v36->__shared_owners_;
      do
        v27 = __ldaxr(v26);
      while (__stlxr(v27 - 1, v26));
      if (!v27)
      {
        ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
        std::__shared_weak_count::__release_weak(v25);
      }
    }
  }
  else
  {
    v19 = 0;
  }
  IEDefer::~IEDefer(&v40);
  v28 = v39[0];
  v38 = &off_24F543888;
  v39[0] = 0;
  if (v28)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)v39, v28);
  v29 = v43;
  v42 = (const std::string *)&off_24F543888;
  v43 = 0;
  if (v29)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)&v43, v29);

  return v19;
}

void __40__IEIntelligence_setVariable_withValue___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t buf[16];

  SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'setVariable(name:value:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((_QWORD *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)qword_253F45FC8;
  v5 = v4;
  v6 = *((_QWORD *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v5, OS_SIGNPOST_INTERVAL_END, v6, "setVariable(name:value:)", (const char *)&unk_22B0CB3EF, buf, 2u);
  }

}

- (id)getChangedPersistentVariables
{
  unsigned __int8 v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  std::string::size_type v10;
  uint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  void *v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  void *v18;
  std::__shared_weak_count *size;
  unint64_t *v20;
  unint64_t v21;
  std::string *v22;
  std::string *v23;
  BOOL v24;
  std::string *v25;
  __int128 v26;
  std::string *v27;
  const char *v28;
  __int128 v29;
  std::string *p_buf;
  uint64_t v31;
  uint64_t v32;
  std::string v34;
  __int128 v35;
  std::string v36;
  _QWORD v37[4];
  void (**v38)(siri::intelligence::Timer *__hidden);
  _QWORD v39[2];
  void (**v40)(void);
  std::string buf;
  const std::string *v42;
  uint64_t v43;

  v3 = atomic_load((unsigned __int8 *)&qword_253F45FE0);
  if ((v3 & 1) == 0 && __cxa_guard_acquire(&qword_253F45FE0))
  {
    qword_253F45FD8 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_253F45FE0);
  }
  v4 = os_signpost_id_generate((os_log_t)qword_253F45FD8);
  v5 = (id)qword_253F45FD8;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "changedPersistentVariables()", (const char *)&unk_22B0CB3EF, (uint8_t *)&buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(&buf, "changedPersistentVariables()");
  siri::intelligence::Timer::Timer(&v42, &buf);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"> Entering function 'changedPersistentVariables()'", v7);
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3321888768;
  v37[2] = __47__IEIntelligence_getChangedPersistentVariables__block_invoke;
  v37[3] = &__block_descriptor_56_ea8_32c31_ZTSN4siri12intelligence5TimerE_e5_v8__0l;
  siri::intelligence::Timer::Timer((siri::intelligence::Timer *)&v38, &v42);
  v39[1] = v4;
  v40 = (void (**)(void))MEMORY[0x22E2EA050](v37);
  v8 = (void *)objc_opt_new();
  v9 = *(_QWORD *)self->mIntelligence;
  std::set<std::string>::set[abi:ne180100]((uint64_t *)&buf, (const void ***)(v9 + 72));
  v10 = buf.__r_.__value_.__r.__words[0];
  if ((std::string::size_type *)buf.__r_.__value_.__l.__data_ != &buf.__r_.__value_.__r.__words[1])
  {
    v11 = v9 + 24;
    do
    {
      if (*(char *)(v10 + 55) < 0)
        std::string::__init_copy_ctor_external(&v36, *(const std::string::value_type **)(v10 + 32), *(_QWORD *)(v10 + 40));
      else
        v36 = *(std::string *)(v10 + 32);
      siri::intelligence::Memory::GetVariable(v11, (uint64_t)&v36, &v34);
      if (v34.__r_.__value_.__r.__words[0]
        && *(_BYTE *)(v34.__r_.__value_.__r.__words[0] + 65)
        && (siri::intelligence::Memory::IsGlobalVariable(v11, (unsigned __int8 *)&v36) & 1) == 0)
      {
        v35 = *(_OWORD *)&v34.__r_.__value_.__l.__data_;
        if (v34.__r_.__value_.__l.__size_)
        {
          v12 = (unint64_t *)(v34.__r_.__value_.__l.__size_ + 8);
          do
            v13 = __ldxr(v12);
          while (__stxr(v13 + 1, v12));
        }
        IE_VariableToIEVariable((uint64_t *)&v35);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (std::__shared_weak_count *)*((_QWORD *)&v35 + 1);
        if (*((_QWORD *)&v35 + 1))
        {
          v16 = (unint64_t *)(*((_QWORD *)&v35 + 1) + 8);
          do
            v17 = __ldaxr(v16);
          while (__stlxr(v17 - 1, v16));
          if (!v17)
          {
            ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
            std::__shared_weak_count::__release_weak(v15);
          }
        }
        objc_msgSend(v14, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKey:", v14, v18);

      }
      size = (std::__shared_weak_count *)v34.__r_.__value_.__l.__size_;
      if (v34.__r_.__value_.__l.__size_)
      {
        v20 = (unint64_t *)(v34.__r_.__value_.__l.__size_ + 8);
        do
          v21 = __ldaxr(v20);
        while (__stlxr(v21 - 1, v20));
        if (!v21)
        {
          ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
          std::__shared_weak_count::__release_weak(size);
        }
      }
      if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v36.__r_.__value_.__l.__data_);
      v22 = *(std::string **)(v10 + 8);
      if (v22)
      {
        do
        {
          v23 = v22;
          v22 = (std::string *)v22->__r_.__value_.__r.__words[0];
        }
        while (v22);
      }
      else
      {
        do
        {
          v23 = *(std::string **)(v10 + 16);
          v24 = v23->__r_.__value_.__r.__words[0] == v10;
          v10 = (std::string::size_type)v23;
        }
        while (!v24);
      }
      v10 = (std::string::size_type)v23;
    }
    while (v23 != (std::string *)&buf.__r_.__value_.__r.__words[1]);
  }
  std::__tree<std::string>::destroy((uint64_t)&buf, (char *)buf.__r_.__value_.__l.__size_);
  std::to_string(&v34, objc_msgSend(v8, "count"));
  v25 = std::string::insert(&v34, 0, "Found ");
  v26 = *(_OWORD *)&v25->__r_.__value_.__l.__data_;
  v36.__r_.__value_.__r.__words[2] = v25->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v36.__r_.__value_.__l.__data_ = v26;
  v25->__r_.__value_.__l.__size_ = 0;
  v25->__r_.__value_.__r.__words[2] = 0;
  v25->__r_.__value_.__r.__words[0] = 0;
  v27 = std::string::append(&v36, " changed persistent variables");
  v29 = *(_OWORD *)&v27->__r_.__value_.__l.__data_;
  buf.__r_.__value_.__r.__words[2] = v27->__r_.__value_.__r.__words[2];
  *(_OWORD *)&buf.__r_.__value_.__l.__data_ = v29;
  v27->__r_.__value_.__l.__size_ = 0;
  v27->__r_.__value_.__r.__words[2] = 0;
  v27->__r_.__value_.__r.__words[0] = 0;
  p_buf = &buf;
  if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    p_buf = (std::string *)buf.__r_.__value_.__r.__words[0];
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Returning %s", v28, p_buf);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v36.__r_.__value_.__l.__data_);
  if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v34.__r_.__value_.__l.__data_);
  IEDefer::~IEDefer(&v40);
  v31 = v39[0];
  v38 = &off_24F543888;
  v39[0] = 0;
  if (v31)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)v39, v31);
  v32 = v43;
  v42 = (const std::string *)&off_24F543888;
  v43 = 0;
  if (v32)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)&v43, v32);
  return v8;
}

void __47__IEIntelligence_getChangedPersistentVariables__block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t buf[16];

  SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'changedPersistentVariables()' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((_QWORD *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)qword_253F45FD8;
  v5 = v4;
  v6 = *((_QWORD *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v5, OS_SIGNPOST_INTERVAL_END, v6, "changedPersistentVariables()", (const char *)&unk_22B0CB3EF, buf, 2u);
  }

}

- (id)getConditions
{
  unsigned __int8 v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  std::string **mIntelligence;
  std::string *v10;
  const std::string **v11;
  const std::string **v12;
  std::string *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  std::string __p;
  void *v19;
  char v20;
  uint64_t v21;
  const std::string **v22;
  const std::string **v23;
  _QWORD v24[4];
  void (**v25)(siri::intelligence::Timer *__hidden);
  _QWORD v26[2];
  void (**v27)(void);
  const std::string *v28;
  uint64_t v29;
  void **v30;

  v3 = atomic_load((unsigned __int8 *)&qword_253F45FF0);
  if ((v3 & 1) == 0 && __cxa_guard_acquire(&qword_253F45FF0))
  {
    qword_253F45FE8 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_253F45FF0);
  }
  v4 = os_signpost_id_generate((os_log_t)qword_253F45FE8);
  v5 = (id)qword_253F45FE8;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(__p.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "conditions()", (const char *)&unk_22B0CB3EF, (uint8_t *)&__p, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(&__p, "conditions()");
  siri::intelligence::Timer::Timer(&v28, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"> Entering function 'conditions()'", v7);
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3321888768;
  v24[2] = __31__IEIntelligence_getConditions__block_invoke;
  v24[3] = &__block_descriptor_56_ea8_32c31_ZTSN4siri12intelligence5TimerE_e5_v8__0l;
  siri::intelligence::Timer::Timer((siri::intelligence::Timer *)&v25, &v28);
  v26[1] = v4;
  v27 = (void (**)(void))MEMORY[0x22E2EA050](v24);
  v8 = (void *)objc_opt_new();
  mIntelligence = (std::string **)self->mIntelligence;
  if (mIntelligence)
  {
    v10 = *mIntelligence;
    siri::intelligence::FlowGraph::GetConditions((siri::intelligence::FlowGraph *)&(*mIntelligence)->__r_.__value_.__r.__words[1], (uint64_t)&v22);
    v11 = v22;
    v12 = v23;
    if (v22 != v23)
    {
      v13 = v10 + 1;
      do
      {
        siri::intelligence::ResolvedCondition::ResolvedCondition((uint64_t)&__p, *v11, (uint64_t)&(*v11)[1], v13);
        IE_ExpandedConditionToIECondition((const siri::intelligence::ResolvedCondition *)&__p);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        v30 = (void **)&v21;
        std::vector<siri::intelligence::ResolvedCondition>::__destroy_vector::operator()[abi:ne180100](&v30);
        if (v20 < 0)
          operator delete(v19);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        v11 += 2;
      }
      while (v11 != v12);
    }
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v22;
    std::vector<std::shared_ptr<siri::intelligence::Variable>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  }
  IEDefer::~IEDefer(&v27);
  v15 = v26[0];
  v25 = &off_24F543888;
  v26[0] = 0;
  if (v15)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)v26, v15);
  v16 = v29;
  v28 = (const std::string *)&off_24F543888;
  v29 = 0;
  if (v16)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)&v29, v16);
  return v8;
}

void __31__IEIntelligence_getConditions__block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t buf[16];

  SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'conditions()' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((_QWORD *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)qword_253F45FE8;
  v5 = v4;
  v6 = *((_QWORD *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v5, OS_SIGNPOST_INTERVAL_END, v6, "conditions()", (const char *)&unk_22B0CB3EF, buf, 2u);
  }

}

- (id)getExitValue
{
  unsigned __int8 v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  uint64_t *mIntelligence;
  uint64_t v9;
  std::string::size_type v10;
  std::__shared_weak_count *size;
  unint64_t *p_shared_owners;
  unint64_t v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  uint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  void *v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  std::__shared_weak_count *v43;
  _QWORD v44[4];
  void (**v45)(siri::intelligence::Timer *__hidden);
  _QWORD v46[2];
  void (**v47)(void);
  std::string buf;
  const std::string *v49;
  uint64_t v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v3 = atomic_load((unsigned __int8 *)&qword_253F46000);
  if ((v3 & 1) == 0 && __cxa_guard_acquire(&qword_253F46000))
  {
    qword_253F45FF8 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_253F46000);
  }
  v4 = os_signpost_id_generate((os_log_t)qword_253F45FF8);
  v5 = (id)qword_253F45FF8;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "exitValue()", (const char *)&unk_22B0CB3EF, (uint8_t *)&buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(&buf, "exitValue()");
  siri::intelligence::Timer::Timer(&v49, &buf);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"> Entering function 'exitValue()'", v7);
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3321888768;
  v44[2] = __30__IEIntelligence_getExitValue__block_invoke;
  v44[3] = &__block_descriptor_56_ea8_32c31_ZTSN4siri12intelligence5TimerE_e5_v8__0l;
  siri::intelligence::Timer::Timer((siri::intelligence::Timer *)&v45, &v49);
  v46[1] = v4;
  v47 = (void (**)(void))MEMORY[0x22E2EA050](v44);
  mIntelligence = (uint64_t *)self->mIntelligence;
  if (mIntelligence)
  {
    v9 = *mIntelligence;
    v10 = *(_QWORD *)(*mIntelligence + 248);
    size = *(std::__shared_weak_count **)(v9 + 256);
    buf.__r_.__value_.__r.__words[0] = v10;
    buf.__r_.__value_.__l.__size_ = (std::string::size_type)size;
    if (size)
    {
      p_shared_owners = (unint64_t *)&size->__shared_owners_;
      do
        v13 = __ldxr(p_shared_owners);
      while (__stxr(v13 + 1, p_shared_owners));
    }
    if (v10)
    {
      v14 = *(_QWORD *)self->mIntelligence;
      v16 = *(_QWORD *)(v14 + 248);
      v15 = *(std::__shared_weak_count **)(v14 + 256);
      if (v15)
      {
        v17 = (unint64_t *)&v15->__shared_owners_;
        do
          v18 = __ldxr(v17);
        while (__stxr(v18 + 1, v17));
      }
      v42 = v16;
      v43 = v15;
      v40 = 0;
      v41 = 0;
      IE_VariableToNSObject((uint64_t)&v42);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v43;
      if (v43)
      {
        v21 = (unint64_t *)&v43->__shared_owners_;
        do
          v22 = __ldaxr(v21);
        while (__stlxr(v22 - 1, v21));
        if (!v22)
        {
          ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
          std::__shared_weak_count::__release_weak(v20);
        }
      }
      size = (std::__shared_weak_count *)buf.__r_.__value_.__l.__size_;
    }
    else
    {
      v19 = (void *)objc_opt_new();
      -[IEIntelligence getVariables](self, "getVariables");
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v23 = (id)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v51, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v37 != v25)
              objc_enumerationMutation(v23);
            v27 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
            objc_msgSend(v23, "objectForKey:", v27, (_QWORD)v36);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = v28;
            if (v28)
            {
              objc_msgSend(v28, "value");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v30 = 0;
            }
            objc_msgSend(v19, "setObject:forKey:", v30, v27);

          }
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v51, 16);
        }
        while (v24);
      }

    }
    if (size)
    {
      v31 = (unint64_t *)&size->__shared_owners_;
      do
        v32 = __ldaxr(v31);
      while (__stlxr(v32 - 1, v31));
      if (!v32)
      {
        ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
        std::__shared_weak_count::__release_weak(size);
      }
    }
  }
  else
  {
    v19 = (void *)objc_opt_new();
  }
  IEDefer::~IEDefer(&v47);
  v33 = v46[0];
  v45 = &off_24F543888;
  v46[0] = 0;
  if (v33)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)v46, v33);
  v34 = v50;
  v49 = (const std::string *)&off_24F543888;
  v50 = 0;
  if (v34)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)&v50, v34);
  return v19;
}

void __30__IEIntelligence_getExitValue__block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t buf[16];

  SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'exitValue()' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((_QWORD *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)qword_253F45FF8;
  v5 = v4;
  v6 = *((_QWORD *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v5, OS_SIGNPOST_INTERVAL_END, v6, "exitValue()", (const char *)&unk_22B0CB3EF, buf, 2u);
  }

}

- (id)getUndo
{
  uint64_t *mIntelligence;
  uint64_t v3;
  std::__shared_weak_count *v4;
  __int128 *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  std::string *v12;
  void *v13;
  std::__shared_weak_count *v14;
  uint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  void *v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *size;
  unint64_t *v23;
  unint64_t v24;
  unint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  std::__shared_weak_count *v28;
  std::string v29;
  __int128 *v30;
  std::__shared_weak_count *v31;

  mIntelligence = (uint64_t *)self->mIntelligence;
  if (!mIntelligence)
    return 0;
  v3 = *mIntelligence;
  v5 = *(__int128 **)(v3 + 216);
  v4 = *(std::__shared_weak_count **)(v3 + 224);
  v30 = v5;
  v31 = v4;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  if (v5)
  {
    v8 = (void *)objc_opt_new();
    v9 = (void *)MEMORY[0x24BDD17C8];
    if (*((char *)v5 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v29, *(const std::string::value_type **)v5, *((_QWORD *)v5 + 1));
    }
    else
    {
      v10 = *v5;
      v29.__r_.__value_.__r.__words[2] = *((_QWORD *)v5 + 2);
      *(_OWORD *)&v29.__r_.__value_.__l.__data_ = v10;
    }
    if ((v29.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v12 = &v29;
    else
      v12 = (std::string *)v29.__r_.__value_.__r.__words[0];
    objc_msgSend(v9, "stringWithUTF8String:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIdentifier:", v13);

    if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v29.__r_.__value_.__l.__data_);
    v15 = *((_QWORD *)v5 + 3);
    v14 = (std::__shared_weak_count *)*((_QWORD *)v5 + 4);
    if (v14)
    {
      v16 = (unint64_t *)&v14->__shared_owners_;
      do
        v17 = __ldxr(v16);
      while (__stxr(v17 + 1, v16));
    }
    v27 = v15;
    v28 = v14;
    *(_OWORD *)&v29.__r_.__value_.__l.__data_ = 0uLL;
    IE_VariableToNSObject((uint64_t)&v27);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUserData:", v18);

    v19 = v28;
    if (v28)
    {
      v20 = (unint64_t *)&v28->__shared_owners_;
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
    size = (std::__shared_weak_count *)v29.__r_.__value_.__l.__size_;
    if (v29.__r_.__value_.__l.__size_)
    {
      v23 = (unint64_t *)(v29.__r_.__value_.__l.__size_ + 8);
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
        std::__shared_weak_count::__release_weak(size);
      }
    }
    v4 = v31;
    if (!v31)
      return v8;
    goto LABEL_31;
  }
  v8 = 0;
  if (v4)
  {
LABEL_31:
    v25 = (unint64_t *)&v4->__shared_owners_;
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *, SEL))v4->__on_zero_shared)(v4, a2);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  return v8;
}

- (void)setExtensions:(id)a3
{
  id v4;
  void *mIntelligence;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  _QWORD *v18;
  std::__shared_weak_count *v19;
  _QWORD *v20;
  std::__shared_weak_count *v21;
  _QWORD v22[3];
  _QWORD *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  mIntelligence = self->mIntelligence;
  if (!mIntelligence)
    goto LABEL_22;
  v6 = (std::__shared_weak_count *)operator new(0x38uLL);
  v6->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v6->__shared_owners_;
  v6->__shared_weak_owners_ = 0;
  v6->__vftable = (std::__shared_weak_count_vtbl *)&off_24F540590;
  v6[2].__vftable = 0;
  v20 = &v6[1].__vftable;
  v21 = v6;
  if (v4)
  {
    objc_msgSend(v4, "directInvocationBuilder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v22[0] = &off_24F5405E0;
      v22[1] = v4;
      v23 = v22;
      std::function<std::string ()(std::string const&,std::shared_ptr<siri::intelligence::VariableDictionary>)>::operator=(&v6[1].__vftable, (uint64_t)v22);
      v9 = v23;
      if (v23 == v22)
      {
        v10 = 4;
        v9 = v22;
        goto LABEL_8;
      }
      if (v23)
      {
        v10 = 5;
LABEL_8:
        (*(void (**)(void))(*v9 + 8 * v10))();
      }
    }
    mIntelligence = self->mIntelligence;
  }
  v18 = &v6[1].__vftable;
  v19 = v6;
  do
    v11 = __ldxr(p_shared_owners);
  while (__stxr(v11 + 1, p_shared_owners));
  std::shared_ptr<YAML::detail::memory_holder>::operator=[abi:ne180100]((_QWORD *)(*(_QWORD *)mIntelligence + 232), (uint64_t *)&v18);
  v12 = v19;
  if (v19)
  {
    v13 = (unint64_t *)&v19->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  v15 = v21;
  if (v21)
  {
    v16 = (unint64_t *)&v21->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
LABEL_22:

}

- (id)getBuildVersion
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "3400.2.1");
}

- (id)getFormatVersion
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "2.0.7");
}

- (id)getMetadata:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  std::string *v7;
  void *v8;
  void *__p[2];
  char v11;
  std::string v12;

  v4 = a3;
  v5 = *(_QWORD *)self->mIntelligence;
  v6 = objc_retainAutorelease(v4);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v6, "UTF8String"));
  siri::intelligence::FlowGraph::GetMetaData((_QWORD *)(v5 + 8), (const void **)__p, &v12);
  if (v11 < 0)
    operator delete(__p[0]);
  if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v7 = &v12;
  else
    v7 = (std::string *)v12.__r_.__value_.__r.__words[0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v12.__r_.__value_.__l.__data_);

  return v8;
}

- (void)mIntelligence
{
  return self->mIntelligence;
}

- (void)setMIntelligence:(void *)a3
{
  self->mIntelligence = a3;
}

- (NSString)mFlowId
{
  return self->mFlowId;
}

- (void)setMFlowId:(id)a3
{
  objc_storeStrong((id *)&self->mFlowId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFlowId, 0);
}

- (uint64_t)setExtensions:
{
    return a1 + 8;
  else
    return 0;
}

- (void)setExtensions:
{
}

- (_QWORD)setExtensions:
{
  std::__shared_weak_count *v6;
  uint64_t v7;
  uint64_t *v8;
  void *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  void *v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  char *v18;
  unint64_t *v19;
  unint64_t v20;
  uint64_t v22;
  std::__shared_weak_count *v23;

  v7 = *a3;
  v6 = (std::__shared_weak_count *)a3[1];
  *a3 = 0;
  a3[1] = 0;
  if (*((char *)a2 + 23) >= 0)
    v8 = a2;
  else
    v8 = (uint64_t *)*a2;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v7;
  v23 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }
  IE_VariableToNSObject((uint64_t)&v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v23;
  if (v23)
  {
    v14 = (unint64_t *)&v23->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  objc_msgSend(*(id *)(a1 + 8), "directInvocationBuilder", v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handle:withUserData:", v9, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    v18 = (char *)objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
  else
    v18 = "";

  if (v6)
  {
    v19 = (unint64_t *)&v6->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  return std::string::basic_string[abi:ne180100]<0>(a4, v18);
}

- (id)setExtensions:
{
  id result;

  *a2 = &off_24F5405E0;
  result = *(id *)(a1 + 8);
  a2[1] = result;
  return result;
}

@end
