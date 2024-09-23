@implementation IENLGenerator

- (BOOL)fromCATI:(id)a3 withOutputFile:(id)a4
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
  char v17;
  uint64_t v18;
  uint64_t v19;
  void *__p[2];
  char v22;
  _QWORD v23[4];
  void (**v24)(siri::intelligence::Timer *__hidden);
  _QWORD v25[2];
  void (**v26)(void);
  std::string buf;
  const std::string *v28;
  uint64_t v29;

  v5 = a3;
  v6 = a4;
  v7 = atomic_load((unsigned __int8 *)&qword_253F461F0);
  if ((v7 & 1) == 0 && __cxa_guard_acquire(&qword_253F461F0))
  {
    _MergedGlobals_4 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_253F461F0);
  }
  v8 = os_signpost_id_generate((os_log_t)_MergedGlobals_4);
  v9 = (id)_MergedGlobals_4;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "fromCATI(flowFile:outputFile:ensemble:)", (const char *)&unk_22B0CB3EF, (uint8_t *)&buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(&buf, "fromCATI(flowFile:outputFile:ensemble:)");
  siri::intelligence::Timer::Timer(&v28, &buf);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"> Entering function 'fromCATI(flowFile:outputFile:ensemble:)'", v11);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3321888768;
  v23[2] = __41__IENLGenerator_fromCATI_withOutputFile___block_invoke;
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
    v15 = (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  else
    v15 = "null";
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %s", v14, "outputFile", v15);
  if (v5)
  {
    std::string::basic_string[abi:ne180100]<0>(&buf, (char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
    if (v6)
      v16 = (char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    else
      v16 = "";
    std::string::basic_string[abi:ne180100]<0>(__p, v16);
    v17 = siri::intelligence::NLGenerator::FromCATI((uint64_t)&buf, (uint64_t)__p);
    if (v22 < 0)
      operator delete(__p[0]);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
  }
  else
  {
    v17 = 0;
  }
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

  return v17;
}

void __41__IENLGenerator_fromCATI_withOutputFile___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t buf[16];

  SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'fromCATI(flowFile:outputFile:ensemble:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((_QWORD *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)_MergedGlobals_4;
  v5 = v4;
  v6 = *((_QWORD *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v5, OS_SIGNPOST_INTERVAL_END, v6, "fromCATI(flowFile:outputFile:ensemble:)", (const char *)&unk_22B0CB3EF, buf, 2u);
  }

}

- (BOOL)fromCATI:(id)a3 withOutputFile:(id)a4 withCATIManifest:(id)a5 withEnsemble:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  unsigned __int8 v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  char v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  void *__p[2];
  char v33;
  void *v34[2];
  char v35;
  void *v36[2];
  char v37;
  _QWORD v38[4];
  void (**v39)(siri::intelligence::Timer *__hidden);
  _QWORD v40[2];
  void (**v41)(void);
  std::string buf;
  const std::string *v43;
  uint64_t v44;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = atomic_load((unsigned __int8 *)&qword_253F46200);
  if ((v13 & 1) == 0 && __cxa_guard_acquire(&qword_253F46200))
  {
    qword_253F461F8 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_253F46200);
  }
  v14 = os_signpost_id_generate((os_log_t)qword_253F461F8);
  v15 = (id)qword_253F461F8;
  v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "fromCATI(flowFile:outputFile:manifestFile:ensemble:)", (const char *)&unk_22B0CB3EF, (uint8_t *)&buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(&buf, "fromCATI(flowFile:outputFile:manifestFile:ensemble:)");
  siri::intelligence::Timer::Timer(&v43, &buf);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"> Entering function 'fromCATI(flowFile:outputFile:manifestFile:ensemble:)'", v17);
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3321888768;
  v38[2] = __71__IENLGenerator_fromCATI_withOutputFile_withCATIManifest_withEnsemble___block_invoke;
  v38[3] = &__block_descriptor_56_ea8_32c31_ZTSN4siri12intelligence5TimerE_e5_v8__0l;
  siri::intelligence::Timer::Timer((siri::intelligence::Timer *)&v39, &v43);
  v40[1] = v14;
  v41 = (void (**)(void))MEMORY[0x22E2EA050](v38);
  if (v9)
    v19 = (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
  else
    v19 = "null";
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %s", v18, "flowFile", v19);
  if (v10)
    v21 = (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
  else
    v21 = "null";
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %s", v20, "outputFile", v21);
  if (v11)
    v23 = (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
  else
    v23 = "null";
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %s", v22, "manifestFile", v23);
  if (v12)
    v25 = (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
  else
    v25 = "null";
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %s", v24, "ensemble", v25);
  v26 = 0;
  if (v9 && v11)
  {
    std::string::basic_string[abi:ne180100]<0>(&buf, (char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
    std::string::basic_string[abi:ne180100]<0>(v36, (char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"));
    if (v12)
      v27 = (char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    else
      v27 = "";
    std::string::basic_string[abi:ne180100]<0>(v34, v27);
    if (v10)
      v28 = (char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    else
      v28 = "";
    std::string::basic_string[abi:ne180100]<0>(__p, v28);
    v26 = siri::intelligence::NLGenerator::FromCATI((uint64_t)&buf, (uint64_t)__p, (uint64_t)v36, (uint64_t)v34);
    if (v33 < 0)
      operator delete(__p[0]);
    if (v35 < 0)
      operator delete(v34[0]);
    if (v37 < 0)
      operator delete(v36[0]);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
  }
  IEDefer::~IEDefer(&v41);
  v29 = v40[0];
  v39 = &off_24F543888;
  v40[0] = 0;
  if (v29)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)v40, v29);
  v30 = v44;
  v43 = (const std::string *)&off_24F543888;
  v44 = 0;
  if (v30)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)&v44, v30);

  return v26;
}

void __71__IENLGenerator_fromCATI_withOutputFile_withCATIManifest_withEnsemble___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t buf[16];

  SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'fromCATI(flowFile:outputFile:manifestFile:ensemble:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((_QWORD *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)qword_253F461F8;
  v5 = v4;
  v6 = *((_QWORD *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v5, OS_SIGNPOST_INTERVAL_END, v6, "fromCATI(flowFile:outputFile:manifestFile:ensemble:)", (const char *)&unk_22B0CB3EF, buf, 2u);
  }

}

@end
