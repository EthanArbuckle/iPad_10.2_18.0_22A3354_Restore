@implementation IEConverter

- (BOOL)convertFile:(id)a3 withFormat:(unint64_t)a4
{
  id v5;
  unsigned __int8 v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  int v13;
  char v14;
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

  v5 = a3;
  v6 = atomic_load((unsigned __int8 *)&qword_253F46230);
  if ((v6 & 1) == 0 && __cxa_guard_acquire(&qword_253F46230))
  {
    _MergedGlobals_6 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_253F46230);
  }
  v7 = os_signpost_id_generate((os_log_t)_MergedGlobals_6);
  v8 = (id)_MergedGlobals_6;
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "convertFile(flowFile:format:)", (const char *)&unk_22B0CB3EF, (uint8_t *)&buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(&buf, "convertFile(flowFile:format:)");
  siri::intelligence::Timer::Timer(&v26, &buf);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"> Entering function 'convertFile(flowFile:format:)'", v10);
  v18 = MEMORY[0x24BDAC760];
  v19 = 3321888768;
  v20 = __38__IEConverter_convertFile_withFormat___block_invoke;
  v21 = &__block_descriptor_56_ea8_32c31_ZTSN4siri12intelligence5TimerE_e5_v8__0l;
  siri::intelligence::Timer::Timer((siri::intelligence::Timer *)&v22, &v26);
  v23[1] = v7;
  v24 = (void (**)(void))MEMORY[0x22E2EA050](&v18);
  if (v5)
    v12 = (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
  else
    v12 = "null";
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %s", v11, "flowFile", v12, v18, v19, v20, v21);
  if (!v5)
  {
    v14 = 0;
    goto LABEL_20;
  }
  std::string::basic_string[abi:ne180100]<0>(&buf, (char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
  if (a4 == 1)
  {
    v13 = 2;
    goto LABEL_16;
  }
  if (a4 == 2)
  {
    v13 = 1;
LABEL_16:
    v14 = siri::intelligence::Converter::ConvertFile(v13, (uint64_t)&buf);
    goto LABEL_18;
  }
  v14 = 0;
LABEL_18:
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
LABEL_20:
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

void __38__IEConverter_convertFile_withFormat___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t buf[16];

  SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'convertFile(flowFile:format:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((_QWORD *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)_MergedGlobals_6;
  v5 = v4;
  v6 = *((_QWORD *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v5, OS_SIGNPOST_INTERVAL_END, v6, "convertFile(flowFile:format:)", (const char *)&unk_22B0CB3EF, buf, 2u);
  }

}

@end
