@implementation IEValidator

- (id)validate:(id)a3
{
  -[IEValidator validate:srcFilename:](self, "validate:srcFilename:", a3, &stru_24F544478);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)validate:(id)a3 srcFilename:(id)a4
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
  void *v16;
  void *v17;
  id v18;
  char *v19;
  id v20;
  __int128 *v21;
  __int128 *v22;
  void *v23;
  void *v24;
  __int128 *v25;
  int v26;
  const __CFString *v27;
  const __CFString *v28;
  void *v29;
  __int128 v30;
  std::string *v31;
  void *v32;
  void *v33;
  __int128 v34;
  std::string *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  id v41;
  id v42;
  void *v43;
  std::string buf;
  char *v45[4];
  __int128 *v46;
  __int128 *v47;
  uint64_t v48;
  void *__p[2];
  char v50;
  void *v51[2];
  char v52;
  _QWORD v53[4];
  void (**v54)(siri::intelligence::Timer *__hidden);
  _QWORD v55[2];
  void (**v56)(void);
  const std::string *v57;
  uint64_t v58;
  std::string *p_buf;

  v5 = a3;
  v6 = a4;
  v7 = atomic_load((unsigned __int8 *)&qword_253F467D0);
  if ((v7 & 1) == 0 && __cxa_guard_acquire(&qword_253F467D0))
  {
    _MergedGlobals_19 = (uint64_t)os_log_create("com.apple.siri.AuthoredFlow", "FlowEngine");
    __cxa_guard_release(&qword_253F467D0);
  }
  v8 = os_signpost_id_generate((os_log_t)_MergedGlobals_19);
  v9 = (id)_MergedGlobals_19;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "validate(filename:srcFilename:)", (const char *)&unk_22B0CB3EF, (uint8_t *)&buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(&buf, "validate(filename:srcFilename:)");
  siri::intelligence::Timer::Timer(&v57, &buf);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"> Entering function 'validate(filename:srcFilename:)'", v11);
  v53[0] = MEMORY[0x24BDAC760];
  v53[1] = 3321888768;
  v53[2] = __36__IEValidator_validate_srcFilename___block_invoke;
  v53[3] = &__block_descriptor_56_ea8_32c31_ZTSN4siri12intelligence5TimerE_e5_v8__0l;
  siri::intelligence::Timer::Timer((siri::intelligence::Timer *)&v54, &v57);
  v55[1] = v8;
  v56 = (void (**)(void))MEMORY[0x22E2EA050](v53);
  if (v5)
    v13 = (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
  else
    v13 = "null";
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %s", v12, "filename", v13);
  if (v6)
    v15 = (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  else
    v15 = "null";
  siri::intelligence::Log::Info((siri::intelligence::Log *)"- Argument '%s' = %s", v14, "srcFilename", v15);
  v16 = (void *)objc_opt_new();
  v17 = v16;
  if (v5)
  {
    v18 = objc_retainAutorelease(v5);
    v42 = v5;
    v43 = v17;
    v41 = v6;
    std::string::basic_string[abi:ne180100]<0>(v51, (char *)objc_msgSend(v18, "UTF8String"));
    if (v6)
      v19 = (char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    else
      v19 = "";
    std::string::basic_string[abi:ne180100]<0>(__p, v19);
    siri::intelligence::Validator::Validate((uint64_t)v51, (uint64_t)__p, (uint64_t *)&buf);
    v46 = 0;
    v47 = 0;
    v48 = 0;
    std::vector<siri::intelligence::ValidationResult>::__init_with_size[abi:ne180100]<siri::intelligence::ValidationResult*,siri::intelligence::ValidationResult*>(&v46, (uint64_t)buf.__r_.__value_.__l.__data_, buf.__r_.__value_.__l.__size_, (uint64_t)(buf.__r_.__value_.__l.__size_ - buf.__r_.__value_.__r.__words[0]) >> 6);
    std::__tree<std::string>::destroy((uint64_t)v45, v45[1]);
    p_buf = &buf;
    std::vector<siri::intelligence::ValidationResult>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_buf);
    v21 = v47;
    if (v46 != v47)
    {
      v22 = v46 + 2;
      do
      {
        v23 = (void *)objc_opt_new();
        v24 = v23;
        v25 = v22 - 2;
        v26 = *((_DWORD *)v22 - 8);
        v27 = CFSTR("info");
        if (!v26)
          v27 = CFSTR("error");
        if (v26 == 1)
          v28 = CFSTR("warning");
        else
          v28 = v27;
        objc_msgSend(v23, "setType:", v28);
        v29 = (void *)MEMORY[0x24BDD17C8];
        if (*((char *)v22 - 1) < 0)
        {
          std::string::__init_copy_ctor_external(&buf, *((const std::string::value_type **)v22 - 3), *((_QWORD *)v22 - 2));
        }
        else
        {
          v30 = *(__int128 *)((char *)v22 - 24);
          buf.__r_.__value_.__r.__words[2] = *((_QWORD *)v22 - 1);
          *(_OWORD *)&buf.__r_.__value_.__l.__data_ = v30;
        }
        if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v31 = &buf;
        else
          v31 = (std::string *)buf.__r_.__value_.__r.__words[0];
        objc_msgSend(v29, "stringWithUTF8String:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setCode:", v32);

        if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
          operator delete(buf.__r_.__value_.__l.__data_);
        v33 = (void *)MEMORY[0x24BDD17C8];
        if (*((char *)v22 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(&buf, *(const std::string::value_type **)v22, *((_QWORD *)v22 + 1));
        }
        else
        {
          v34 = *v22;
          buf.__r_.__value_.__r.__words[2] = *((_QWORD *)v22 + 2);
          *(_OWORD *)&buf.__r_.__value_.__l.__data_ = v34;
        }
        if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v35 = &buf;
        else
          v35 = (std::string *)buf.__r_.__value_.__r.__words[0];
        objc_msgSend(v33, "stringWithUTF8String:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setText:", v36);

        if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
          operator delete(buf.__r_.__value_.__l.__data_);
        v17 = v43;
        objc_msgSend(v24, "setFilename:", v18);
        objc_msgSend(v24, "setLineNumber:", *((unsigned int *)v22 + 6));
        objc_msgSend(v43, "addObject:", v24);

        v22 += 4;
      }
      while (v25 + 4 != v21);
    }
    buf.__r_.__value_.__r.__words[0] = (std::string::size_type)&v46;
    std::vector<siri::intelligence::ValidationResult>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
    v37 = v17;
    if (v50 < 0)
      operator delete(__p[0]);
    v6 = v41;
    v5 = v42;
    if (v52 < 0)
      operator delete(v51[0]);
  }
  else
  {
    v20 = v16;
  }

  IEDefer::~IEDefer(&v56);
  v38 = v55[0];
  v54 = &off_24F543888;
  v55[0] = 0;
  if (v38)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)v55, v38);
  v39 = v58;
  v57 = (const std::string *)&off_24F543888;
  v58 = 0;
  if (v39)
    std::default_delete<siri::intelligence::Timer::Impl>::operator()[abi:ne180100]((uint64_t)&v58, v39);

  return v17;
}

void __36__IEValidator_validate_srcFilename___block_invoke(siri::intelligence::Utils *a1)
{
  double SecsSinceStart;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t buf[16];

  SecsSinceStart = siri::intelligence::Utils::GetSecsSinceStart(a1);
  siri::intelligence::Log::Info((siri::intelligence::Log *)"< Exiting function 'validate(filename:srcFilename:)' (took %1.1f ms)", v3, (SecsSinceStart - *(double *)(*((_QWORD *)a1 + 5) + 24)) * 10000.0);
  v4 = (id)_MergedGlobals_19;
  v5 = v4;
  v6 = *((_QWORD *)a1 + 6);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22AEC9000, v5, OS_SIGNPOST_INTERVAL_END, v6, "validate(filename:srcFilename:)", (const char *)&unk_22B0CB3EF, buf, 2u);
  }

}

@end
