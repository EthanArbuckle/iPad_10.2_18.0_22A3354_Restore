@implementation IEPatternizer

- (BOOL)generatePatterns:(id)a3 noOverwrite:(BOOL)a4 deleteText:(BOOL)a5 userParamTypes:(id)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v9;
  id v10;
  unsigned __int8 v11;
  char *v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  char *v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  NSDictionary v27;
  _QWORD *v28;
  _QWORD v29[4];
  void (**v30)(siri::intelligence::Timer *__hidden);
  _QWORD v31[2];
  void (**v32)(void);
  std::string buf;
  const std::string *v34;
  uint64_t v35;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = a6;
  v11 = atomic_load((unsigned __int8 *)&qword_253F46418);
  if ((v11 & 1) == 0 && __cxa_guard_acquire(&qword_253F46418))
  {
    _MergedGlobals_11 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_253F46418);
  }
  v12 = (char *)os_signpost_id_generate((os_log_t)_MergedGlobals_11);
  v13 = (id)_MergedGlobals_11;
  v14 = v13;
  if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v14, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v12, "generatePatterns(flowFile:noOverwrite:deleteText:userParamTypes:)", (const char *)&unk_22B0CB3EF, (uint8_t *)&buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(&buf, "generatePatterns(flowFile:noOverwrite:deleteText:userParamTypes:)");
  siri::intelligence::Timer::Timer(&v34, &buf);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"> Entering function 'generatePatterns(flowFile:noOverwrite:deleteText:userParamTypes:)'", v15);
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3321888768;
  v29[2] = __72__IEPatternizer_generatePatterns_noOverwrite_deleteText_userParamTypes___block_invoke;
  v29[3] = &__block_descriptor_56_ea8_32c31_ZTSN4siri12intelligence5TimerE_e5_v8__0l;
  siri::intelligence::Timer::Timer((siri::intelligence::Timer *)&v30, &v34);
  v31[1] = v12;
  v32 = (void (**)(void))MEMORY[0x22E2EA050](v29);
  if (v9)
    v17 = (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
  else
    v17 = "null";
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %s", v16, "flowFile", v17);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %d", v18, "noOverwrite", v8);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %d", v19, "deleteText", v7);
  if (v10)
  {
    objc_msgSend(v10, "description");
    v12 = (char *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = (const char *)objc_msgSend(v12, "UTF8String");
  }
  else
  {
    v21 = "null";
  }
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %s", v20, "userParamTypes", v21);
  if (v10)

  if (v9)
    v22 = (char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
  else
    v22 = "";
  std::string::basic_string[abi:ne180100]<0>(&buf, v22);
  NSDictionaryToStringMap(&v27, v10);
  v23 = GenerateFiles(&buf, 0, v8, v7, (uint64_t)&v27);
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v27, v28);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  IEDefer::~IEDefer(&v32);
  v24 = v31[0];
  v30 = &off_24F543888;
  v31[0] = 0;
  if (v24)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)v31, v24);
  v25 = v35;
  v34 = (const std::string *)&off_24F543888;
  v35 = 0;
  if (v25)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)&v35, v25);

  return v23;
}

void __72__IEPatternizer_generatePatterns_noOverwrite_deleteText_userParamTypes___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t buf[16];

  SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'generatePatterns(flowFile:noOverwrite:deleteText:userParamTypes:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((_QWORD *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)_MergedGlobals_11;
  v5 = v4;
  v6 = *((_QWORD *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v5, OS_SIGNPOST_INTERVAL_END, v6, "generatePatterns(flowFile:noOverwrite:deleteText:userParamTypes:)", (const char *)&unk_22B0CB3EF, buf, 2u);
  }

}

- (BOOL)generateCATs:(id)a3 noOverwrite:(BOOL)a4 deleteText:(BOOL)a5 userParamTypes:(id)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v9;
  id v10;
  unsigned __int8 v11;
  char *v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  char *v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  NSDictionary v27;
  _QWORD *v28;
  _QWORD v29[4];
  void (**v30)(siri::intelligence::Timer *__hidden);
  _QWORD v31[2];
  void (**v32)(void);
  std::string buf;
  const std::string *v34;
  uint64_t v35;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = a6;
  v11 = atomic_load((unsigned __int8 *)&qword_253F46428);
  if ((v11 & 1) == 0 && __cxa_guard_acquire(&qword_253F46428))
  {
    qword_253F46420 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_253F46428);
  }
  v12 = (char *)os_signpost_id_generate((os_log_t)qword_253F46420);
  v13 = (id)qword_253F46420;
  v14 = v13;
  if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v14, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v12, "generateCATs(flowFile:noOverwrite:deleteText:userParamTypes:)", (const char *)&unk_22B0CB3EF, (uint8_t *)&buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(&buf, "generateCATs(flowFile:noOverwrite:deleteText:userParamTypes:)");
  siri::intelligence::Timer::Timer(&v34, &buf);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"> Entering function 'generateCATs(flowFile:noOverwrite:deleteText:userParamTypes:)'", v15);
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3321888768;
  v29[2] = __68__IEPatternizer_generateCATs_noOverwrite_deleteText_userParamTypes___block_invoke;
  v29[3] = &__block_descriptor_56_ea8_32c31_ZTSN4siri12intelligence5TimerE_e5_v8__0l;
  siri::intelligence::Timer::Timer((siri::intelligence::Timer *)&v30, &v34);
  v31[1] = v12;
  v32 = (void (**)(void))MEMORY[0x22E2EA050](v29);
  if (v9)
    v17 = (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
  else
    v17 = "null";
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %s", v16, "flowFile", v17);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %d", v18, "noOverwrite", v8);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %d", v19, "deleteText", v7);
  if (v10)
  {
    objc_msgSend(v10, "description");
    v12 = (char *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = (const char *)objc_msgSend(v12, "UTF8String");
  }
  else
  {
    v21 = "null";
  }
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %s", v20, "userParamTypes", v21);
  if (v10)

  if (v9)
    v22 = (char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
  else
    v22 = "";
  std::string::basic_string[abi:ne180100]<0>(&buf, v22);
  NSDictionaryToStringMap(&v27, v10);
  v23 = GenerateFiles(&buf, 1, v8, v7, (uint64_t)&v27);
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v27, v28);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  IEDefer::~IEDefer(&v32);
  v24 = v31[0];
  v30 = &off_24F543888;
  v31[0] = 0;
  if (v24)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)v31, v24);
  v25 = v35;
  v34 = (const std::string *)&off_24F543888;
  v35 = 0;
  if (v25)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)&v35, v25);

  return v23;
}

void __68__IEPatternizer_generateCATs_noOverwrite_deleteText_userParamTypes___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t buf[16];

  SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'generateCATs(flowFile:noOverwrite:deleteText:userParamTypes:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((_QWORD *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)qword_253F46420;
  v5 = v4;
  v6 = *((_QWORD *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v5, OS_SIGNPOST_INTERVAL_END, v6, "generateCATs(flowFile:noOverwrite:deleteText:userParamTypes:)", (const char *)&unk_22B0CB3EF, buf, 2u);
  }

}

- (BOOL)updateCATMetadata:(id)a3 withMeta:(id)a4
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
  char *v16;
  char updated;
  uint64_t v18;
  uint64_t v19;
  NSDictionary v21;
  _QWORD *v22;
  _QWORD v23[4];
  void (**v24)(siri::intelligence::Timer *__hidden);
  _QWORD v25[2];
  void (**v26)(void);
  std::string buf;
  const std::string *v28;
  uint64_t v29;

  v5 = a3;
  v6 = a4;
  v7 = atomic_load((unsigned __int8 *)&qword_253F46438);
  if ((v7 & 1) == 0 && __cxa_guard_acquire(&qword_253F46438))
  {
    qword_253F46430 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_253F46438);
  }
  v8 = os_signpost_id_generate((os_log_t)qword_253F46430);
  v9 = (id)qword_253F46430;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "updateCATMetadata(flowFile:meta:)", (const char *)&unk_22B0CB3EF, (uint8_t *)&buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(&buf, "updateCATMetadata(flowFile:meta:)");
  siri::intelligence::Timer::Timer(&v28, &buf);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"> Entering function 'updateCATMetadata(flowFile:meta:)'", v11);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3321888768;
  v23[2] = __44__IEPatternizer_updateCATMetadata_withMeta___block_invoke;
  v23[3] = &__block_descriptor_56_ea8_32c31_ZTSN4siri12intelligence5TimerE_e5_v8__0l;
  siri::intelligence::Timer::Timer((siri::intelligence::Timer *)&v24, &v28);
  v25[1] = v8;
  v26 = (void (**)(void))MEMORY[0x22E2EA050](v23);
  if (v5)
    v13 = (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
  else
    v13 = "null";
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %s", v12, "flowFile", v13);
  if (v6)
  {
    objc_msgSend(v6, "description");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = (const char *)-[NSObject UTF8String](v10, "UTF8String");
  }
  else
  {
    v15 = "null";
  }
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %s", v14, "meta", v15);
  if (v6)

  if (v5)
    v16 = (char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
  else
    v16 = "";
  std::string::basic_string[abi:ne180100]<0>(&buf, v16);
  NSDictionaryToStringMap(&v21, v6);
  updated = siri::intelligence::Patternizer::UpdateCATMetadata(&buf, (const void ***)&v21);
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v21, v22);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
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

  return updated;
}

void __44__IEPatternizer_updateCATMetadata_withMeta___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t buf[16];

  SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'updateCATMetadata(flowFile:meta:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((_QWORD *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)qword_253F46430;
  v5 = v4;
  v6 = *((_QWORD *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v5, OS_SIGNPOST_INTERVAL_END, v6, "updateCATMetadata(flowFile:meta:)", (const char *)&unk_22B0CB3EF, buf, 2u);
  }

}

@end
