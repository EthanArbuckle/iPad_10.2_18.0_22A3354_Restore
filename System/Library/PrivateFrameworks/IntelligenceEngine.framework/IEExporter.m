@implementation IEExporter

- (BOOL)exportFile:(id)a3 withExportFile:(id)a4 withFormat:(unint64_t)a5 withOptions:(id)a6
{
  id v9;
  id v10;
  id v11;
  unsigned __int8 v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  BOOL v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  std::string buf;
  uint64_t v28;
  int v29;
  void *v30[2];
  char v31;
  void *v32[2];
  char v33;
  void *v34[2];
  char v35;
  _QWORD v36[4];
  void (**v37)(siri::intelligence::Timer *__hidden);
  _QWORD v38[2];
  void (**v39)(void);
  const std::string *v40;
  uint64_t v41;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = atomic_load((unsigned __int8 *)&qword_253F46E20);
  if ((v12 & 1) == 0 && __cxa_guard_acquire(&qword_253F46E20))
  {
    _MergedGlobals_23 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_253F46E20);
  }
  v13 = os_signpost_id_generate((os_log_t)_MergedGlobals_23);
  v14 = (id)_MergedGlobals_23;
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "exportFile(flowFile:exportFile:format:options:)", (const char *)&unk_22B0CB3EF, (uint8_t *)&buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(&buf, "exportFile(flowFile:exportFile:format:options:)");
  siri::intelligence::Timer::Timer(&v40, &buf);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"> Entering function 'exportFile(flowFile:exportFile:format:options:)'", v16);
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3321888768;
  v36[2] = __63__IEExporter_exportFile_withExportFile_withFormat_withOptions___block_invoke;
  v36[3] = &__block_descriptor_56_ea8_32c31_ZTSN4siri12intelligence5TimerE_e5_v8__0l;
  siri::intelligence::Timer::Timer((siri::intelligence::Timer *)&v37, &v40);
  v38[1] = v13;
  v39 = (void (**)(void))MEMORY[0x22E2EA050](v36);
  if (v9)
    v18 = (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
  else
    v18 = "null";
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %s", v17, "flowFile", v18);
  if (v10)
    v20 = (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
  else
    v20 = "null";
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %s", v19, "exportFile", v20);
  v21 = 0;
  if (v9 && v10)
  {
    std::string::basic_string[abi:ne180100]<0>(v34, (char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
    std::string::basic_string[abi:ne180100]<0>(v32, (char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"));
    std::string::basic_string[abi:ne180100]<0>(v30, "");
    if (a5 - 1 >= 3)
    {
      v21 = 0;
    }
    else
    {
      MEMORY[0x22E2E99E4](v30, off_24F5443B0[a5 - 1]);
      *(_OWORD *)&buf.__r_.__value_.__r.__words[1] = 0uLL;
      v28 = 0;
      LODWORD(buf.__r_.__value_.__l.__data_) = 0;
      v29 = 100;
      if (v11)
      {
        buf.__r_.__value_.__s.__data_[0] = objc_msgSend(v11, "transparent");
        buf.__r_.__value_.__s.__data_[1] = objc_msgSend(v11, "lightMode");
        buf.__r_.__value_.__s.__data_[2] = objc_msgSend(v11, "darkMode");
        buf.__r_.__value_.__s.__data_[3] = objc_msgSend(v11, "conditions");
        if ((int)objc_msgSend(v11, "dotsPerInch") >= 1)
          v29 = objc_msgSend(v11, "dotsPerInch");
        objc_msgSend(v11, "highlightResponse");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          objc_msgSend(v11, "highlightResponse");
          v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          MEMORY[0x22E2E99E4](&buf.__r_.__value_.__r.__words[1], objc_msgSend(v23, "UTF8String"));

        }
      }
      v21 = siri::intelligence::Exporter::ExportFile((uint64_t)v34, (uint64_t)v32, (uint64_t)v30, (uint64_t)&buf);
      if (SHIBYTE(v28) < 0)
        operator delete((void *)buf.__r_.__value_.__l.__size_);
    }
    if (v31 < 0)
      operator delete(v30[0]);
    if (v33 < 0)
      operator delete(v32[0]);
    if (v35 < 0)
      operator delete(v34[0]);
  }
  IEDefer::~IEDefer(&v39);
  v24 = v38[0];
  v37 = &off_24F543888;
  v38[0] = 0;
  if (v24)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)v38, v24);
  v25 = v41;
  v40 = (const std::string *)&off_24F543888;
  v41 = 0;
  if (v25)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)&v41, v25);

  return v21;
}

void __63__IEExporter_exportFile_withExportFile_withFormat_withOptions___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t buf[16];

  SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'exportFile(flowFile:exportFile:format:options:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((_QWORD *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)_MergedGlobals_23;
  v5 = v4;
  v6 = *((_QWORD *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v5, OS_SIGNPOST_INTERVAL_END, v6, "exportFile(flowFile:exportFile:format:options:)", (const char *)&unk_22B0CB3EF, buf, 2u);
  }

}

@end
