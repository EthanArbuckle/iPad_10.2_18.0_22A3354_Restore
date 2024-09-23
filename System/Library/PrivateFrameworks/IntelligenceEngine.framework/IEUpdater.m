@implementation IEUpdater

- (id)getFileVersion:(id)a3
{
  id v3;
  void *v4;
  std::string *v5;
  __CFString *v6;
  std::string __p;
  std::string v9;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
    siri::intelligence::Updater::GetFileVersion(&__p, &v9);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if ((v9.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v5 = &v9;
    else
      v5 = (std::string *)v9.__r_.__value_.__r.__words[0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v9.__r_.__value_.__l.__data_);
  }
  else
  {
    v6 = &stru_24F544478;
  }

  return v6;
}

- (BOOL)updateToLatest:(id)a3
{
  id v3;
  unsigned __int8 v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  void *__p[2];
  char v16;
  _QWORD v17[4];
  void (**v18)(siri::intelligence::Timer *__hidden);
  _QWORD v19[2];
  void (**v20)(void);
  std::string buf;
  const std::string *v22;
  uint64_t v23;

  v3 = a3;
  v4 = atomic_load((unsigned __int8 *)&qword_253F46E90);
  if ((v4 & 1) == 0 && __cxa_guard_acquire(&qword_253F46E90))
  {
    _MergedGlobals_26 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_253F46E90);
  }
  v5 = os_signpost_id_generate((os_log_t)_MergedGlobals_26);
  v6 = (id)_MergedGlobals_26;
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "updateToLatest(flowFile:)", (const char *)&unk_22B0CB3EF, (uint8_t *)&buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(&buf, "updateToLatest(flowFile:)");
  siri::intelligence::Timer::Timer(&v22, &buf);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"> Entering function 'updateToLatest(flowFile:)'", v8);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3321888768;
  v17[2] = __28__IEUpdater_updateToLatest___block_invoke;
  v17[3] = &__block_descriptor_56_ea8_32c31_ZTSN4siri12intelligence5TimerE_e5_v8__0l;
  siri::intelligence::Timer::Timer((siri::intelligence::Timer *)&v18, &v22);
  v19[1] = v5;
  v20 = (void (**)(void))MEMORY[0x22E2EA050](v17);
  if (v3)
    v10 = (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
  else
    v10 = "null";
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %s", v9, "flowFile", v10);
  if (v3)
  {
    std::string::basic_string[abi:ne180100]<0>(&buf, (char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
    std::string::basic_string[abi:ne180100]<0>(__p, "");
    v11 = siri::intelligence::Updater::UpdateToVersion((uint64_t)&buf, (uint64_t)__p, 0);
    if (v16 < 0)
      operator delete(__p[0]);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
  }
  else
  {
    v11 = 0;
  }
  IEDefer::~IEDefer(&v20);
  v12 = v19[0];
  v18 = &off_24F543888;
  v19[0] = 0;
  if (v12)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)v19, v12);
  v13 = v23;
  v22 = (const std::string *)&off_24F543888;
  v23 = 0;
  if (v13)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)&v23, v13);

  return v11;
}

void __28__IEUpdater_updateToLatest___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t buf[16];

  SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'updateToLatest(flowFile:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((_QWORD *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)_MergedGlobals_26;
  v5 = v4;
  v6 = *((_QWORD *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v5, OS_SIGNPOST_INTERVAL_END, v6, "updateToLatest(flowFile:)", (const char *)&unk_22B0CB3EF, buf, 2u);
  }

}

- (BOOL)isUpdateAvailable:(id)a3
{
  id v3;
  unsigned __int8 v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  BOOL IsUpdateAvailable;
  uint64_t v12;
  uint64_t v13;
  void *__p[2];
  char v16;
  _QWORD v17[4];
  void (**v18)(siri::intelligence::Timer *__hidden);
  _QWORD v19[2];
  void (**v20)(void);
  std::string buf;
  const std::string *v22;
  uint64_t v23;

  v3 = a3;
  v4 = atomic_load((unsigned __int8 *)&qword_253F46EA0);
  if ((v4 & 1) == 0 && __cxa_guard_acquire(&qword_253F46EA0))
  {
    qword_253F46E98 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_253F46EA0);
  }
  v5 = os_signpost_id_generate((os_log_t)qword_253F46E98);
  v6 = (id)qword_253F46E98;
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "isUpdateAvailable(version:)", (const char *)&unk_22B0CB3EF, (uint8_t *)&buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(&buf, "isUpdateAvailable(version:)");
  siri::intelligence::Timer::Timer(&v22, &buf);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"> Entering function 'isUpdateAvailable(version:)'", v8);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3321888768;
  v17[2] = __31__IEUpdater_isUpdateAvailable___block_invoke;
  v17[3] = &__block_descriptor_56_ea8_32c31_ZTSN4siri12intelligence5TimerE_e5_v8__0l;
  siri::intelligence::Timer::Timer((siri::intelligence::Timer *)&v18, &v22);
  v19[1] = v5;
  v20 = (void (**)(void))MEMORY[0x22E2EA050](v17);
  if (v3)
    v10 = (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
  else
    v10 = "null";
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %s", v9, "version", v10);
  if (v3)
  {
    std::string::basic_string[abi:ne180100]<0>(&buf, (char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
    std::string::basic_string[abi:ne180100]<0>(__p, "");
    IsUpdateAvailable = siri::intelligence::Updater::IsUpdateAvailable((unsigned __int8 *)&buf, (uint64_t)__p);
    if (v16 < 0)
      operator delete(__p[0]);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
  }
  else
  {
    IsUpdateAvailable = 0;
  }
  IEDefer::~IEDefer(&v20);
  v12 = v19[0];
  v18 = &off_24F543888;
  v19[0] = 0;
  if (v12)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)v19, v12);
  v13 = v23;
  v22 = (const std::string *)&off_24F543888;
  v23 = 0;
  if (v13)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)&v23, v13);

  return IsUpdateAvailable;
}

void __31__IEUpdater_isUpdateAvailable___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t buf[16];

  SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'isUpdateAvailable(version:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((_QWORD *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)qword_253F46E98;
  v5 = v4;
  v6 = *((_QWORD *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v5, OS_SIGNPOST_INTERVAL_END, v6, "isUpdateAvailable(version:)", (const char *)&unk_22B0CB3EF, buf, 2u);
  }

}

- (id)getHighestVersionWithinRelease:(id)a3
{
  id v3;
  unsigned __int8 v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  std::string *p_buf;
  __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  void *__p[2];
  char v17;
  _QWORD v18[4];
  void (**v19)(siri::intelligence::Timer *__hidden);
  _QWORD v20[2];
  void (**v21)(void);
  std::string buf;
  const std::string *v23;
  uint64_t v24;

  v3 = a3;
  v4 = atomic_load((unsigned __int8 *)&qword_253F46EB0);
  if ((v4 & 1) == 0 && __cxa_guard_acquire(&qword_253F46EB0))
  {
    qword_253F46EA8 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_253F46EB0);
  }
  v5 = os_signpost_id_generate((os_log_t)qword_253F46EA8);
  v6 = (id)qword_253F46EA8;
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "highestVersionWithinRelease(version:)", (const char *)&unk_22B0CB3EF, (uint8_t *)&buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(&buf, "highestVersionWithinRelease(version:)");
  siri::intelligence::Timer::Timer(&v23, &buf);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"> Entering function 'highestVersionWithinRelease(version:)'", v8);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3321888768;
  v18[2] = __44__IEUpdater_getHighestVersionWithinRelease___block_invoke;
  v18[3] = &__block_descriptor_56_ea8_32c31_ZTSN4siri12intelligence5TimerE_e5_v8__0l;
  siri::intelligence::Timer::Timer((siri::intelligence::Timer *)&v19, &v23);
  v20[1] = v5;
  v21 = (void (**)(void))MEMORY[0x22E2EA050](v18);
  if (v3)
    v10 = (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
  else
    v10 = "null";
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %s", v9, "version", v10);
  if (v3)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
    siri::intelligence::Updater::GetHighestVersionWithinRelease((uint64_t)__p, &buf);
    if (v17 < 0)
      operator delete(__p[0]);
    if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_buf = &buf;
    else
      p_buf = (std::string *)buf.__r_.__value_.__r.__words[0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", p_buf);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
  }
  else
  {
    v12 = &stru_24F544478;
  }
  IEDefer::~IEDefer(&v21);
  v13 = v20[0];
  v19 = &off_24F543888;
  v20[0] = 0;
  if (v13)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)v20, v13);
  v14 = v24;
  v23 = (const std::string *)&off_24F543888;
  v24 = 0;
  if (v14)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)&v24, v14);

  return v12;
}

void __44__IEUpdater_getHighestVersionWithinRelease___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t buf[16];

  SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'highestVersionWithinRelease(version:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((_QWORD *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)qword_253F46EA8;
  v5 = v4;
  v6 = *((_QWORD *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v5, OS_SIGNPOST_INTERVAL_END, v6, "highestVersionWithinRelease(version:)", (const char *)&unk_22B0CB3EF, buf, 2u);
  }

}

@end
