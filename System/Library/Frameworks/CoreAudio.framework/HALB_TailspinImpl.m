@implementation HALB_TailspinImpl

+ (id)initOptionsDictionary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  get_TSPDumpOptions_MinTimestamp();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_8;
  get_TSPDumpOptions_MaxTimestamp();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
LABEL_7:

LABEL_8:
    v5 = 0;
    return v5;
  }
  get_TSPDumpOptions_ReasonString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {

    goto LABEL_7;
  }
  get_TSPDumpOptions_MinTraceBufferDurationSec();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E00];
    v7 = (void *)MEMORY[0x1E0C99D88];
    get_TSPDumpOptions_MinTimestamp();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v8;
    get_TSPDumpOptions_MaxTimestamp();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v9;
    get_TSPDumpOptions_MinTraceBufferDurationSec();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2] = v10;
    get_TSPDumpOptions_ReasonString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[3] = v11;
    objc_msgSend(MEMORY[0x1E0C99D18], "arrayWithObjects:count:", v16, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sharedKeySetForKeys:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithSharedKeySet:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    return v14;
  }
  return v5;
}

+ (void)prepareDumpOptions:(unint64_t)a3 outDict:(id *)a4
{
  void *v6;
  void *v7;
  unsigned int v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  unint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  get_TSPDumpOptions_MaxTimestamp();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    get_TSPDumpOptions_MinTimestamp();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = dword_1EF12F934;
      if (!dword_1EF12F934)
      {
        mach_timebase_info((mach_timebase_info_t)&+[HALB_TailspinImpl prepareDumpOptions:outDict:]::s_timebase_info);
        v8 = dword_1EF12F934;
      }
      v9 = 5000000000 * v8;
      v10 = +[HALB_TailspinImpl prepareDumpOptions:outDict:]::s_timebase_info;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v22 = 136315650;
        v23 = "HALB_Tailspin.mm";
        v24 = 1024;
        v25 = 191;
        v26 = 2048;
        v27 = a3;
        _os_log_impl(&dword_1B57BA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%25s:%-5d  HALB_TailspinImpl::dumpTailspin: Current mach time is %llu", (uint8_t *)&v22, 0x1Cu);
      }
      endMachTimeOfLastDump = a3;
      v11 = v9 / v10;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v22 = 136315906;
        v12 = a3 - v11;
        v23 = "HALB_Tailspin.mm";
        v24 = 1024;
        v25 = 195;
        v26 = 2048;
        v27 = 5000;
        v28 = 2048;
        v29 = v12;
        _os_log_impl(&dword_1B57BA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%25s:%-5d  HALB_TailspinImpl::dumpTailspin: Looking back %llu ms to time %llu", (uint8_t *)&v22, 0x26u);
      }
      else
      {
        v12 = a3 - v11;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v22 = 136315906;
        v23 = "HALB_Tailspin.mm";
        v24 = 1024;
        v25 = 198;
        v26 = 2048;
        v27 = 0;
        v28 = 2048;
        v29 = a3;
        _os_log_impl(&dword_1B57BA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%25s:%-5d  HALB_TailspinImpl::dumpTailspin: Looking forward %llu ms to time %llu", (uint8_t *)&v22, 0x26u);
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", endMachTimeOfLastDump);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *a4;
      get_TSPDumpOptions_MaxTimestamp();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setValue:forKey:", v14, v16);

      v17 = *a4;
      get_TSPDumpOptions_MinTimestamp();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setValue:forKey:", v13, v18);

      v19 = *a4;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      get_TSPDumpOptions_MinTraceBufferDurationSec();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setValue:forKey:", v20, v21);

    }
  }
}

+ (BOOL)enableTailspinSync
{
  uint64_t v2;
  BOOL v3;
  unint64_t v5;
  unint64_t v6;
  int v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t (**v10)(_QWORD, _QWORD);
  _BYTE *v11;
  _BYTE buf[12];
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  Symbol<void (*)(tailspin_config *,BOOL)>::initialize();
  if (weak_tailspin_enabled_set
    && Symbol<void (*)(tailspin_config *)>::operator BOOL()
    && Symbol<tailspin_config * (*)(void)>::operator BOOL())
  {
    Symbol<tailspin_config * (*)(void)>::initialize();
    if (weak_tailspin_config_create_with_current_state)
      v2 = weak_tailspin_config_create_with_current_state();
    else
      v2 = 0;
    v9 = v2;
    Symbol<void (*)(tailspin_config *,BOOL)>::initialize();
    if (weak_tailspin_enabled_set)
      ((void (*)(uint64_t, uint64_t))weak_tailspin_enabled_set)(v2, 1);
    *(_DWORD *)buf = 1000000;
    Symbol<void (*)(tailspin_config *,unsigned long long)>::operator()<tailspin_config *&,int>(weak_tailspin_oncore_sampling_period_set, &v9, (int *)buf);
    *(_DWORD *)buf = 0;
    Symbol<void (*)(tailspin_config *,unsigned long long)>::operator()<tailspin_config *&,int>(weak_tailspin_full_sampling_period_set, &v9, (int *)buf);
    v10 = &weak_tailspin_buffer_size_set;
    v5 = atomic_load(&qword_1EF12F268);
    if (v5 != -1)
    {
      v11 = buf;
      *(_QWORD *)buf = &v10;
      std::__call_once(&qword_1EF12F268, &v11, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<Symbol<void (*)(tailspin_config *,unsigned long)>::initialize(void)::{lambda(void)#1} &&>>);
    }
    if (weak_tailspin_buffer_size_set)
      weak_tailspin_buffer_size_set(v9, 1024);
    *(_DWORD *)buf = 1;
    LODWORD(v11) = 64;
    LOBYTE(v10) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v9, buf, (unsigned __int8 *)&v11, (unsigned __int8 *)&v10);
    v10 = (uint64_t (**)(_QWORD, _QWORD))&weak_tailspin_sampling_option_set;
    v6 = atomic_load(&qword_1EF12F298);
    if (v6 != -1)
    {
      v11 = buf;
      *(_QWORD *)buf = &v10;
      std::__call_once(&qword_1EF12F298, &v11, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<Symbol<void (*)(tailspin_config *,int,BOOL)>::initialize(void)::{lambda(void)#1} &&>>);
    }
    if (weak_tailspin_sampling_option_set)
      weak_tailspin_sampling_option_set(v9, 2, 1);
    Symbol<void (*)(tailspin_config *)>::operator()<tailspin_config *&>(weak_tailspin_kdbg_filter_clear, &v9);
    *(_DWORD *)buf = 1;
    LOBYTE(v11) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,BOOL)>::operator()<tailspin_config *&,int,BOOL>(&v9, buf, (unsigned __int8 *)&v11);
    *(_DWORD *)buf = 1;
    LODWORD(v11) = 3;
    LOBYTE(v10) = 0;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v9, buf, (unsigned __int8 *)&v11, (unsigned __int8 *)&v10);
    *(_DWORD *)buf = 1;
    LODWORD(v11) = 169;
    LOBYTE(v10) = 0;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v9, buf, (unsigned __int8 *)&v11, (unsigned __int8 *)&v10);
    *(_DWORD *)buf = 3;
    LOBYTE(v11) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,BOOL)>::operator()<tailspin_config *&,int,BOOL>(&v9, buf, (unsigned __int8 *)&v11);
    *(_DWORD *)buf = 4;
    LOBYTE(v11) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,BOOL)>::operator()<tailspin_config *&,int,BOOL>(&v9, buf, (unsigned __int8 *)&v11);
    *(_DWORD *)buf = 5;
    LODWORD(v11) = 7;
    LOBYTE(v10) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v9, buf, (unsigned __int8 *)&v11, (unsigned __int8 *)&v10);
    *(_DWORD *)buf = 5;
    LODWORD(v11) = 36;
    LOBYTE(v10) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v9, buf, (unsigned __int8 *)&v11, (unsigned __int8 *)&v10);
    *(_DWORD *)buf = 5;
    LODWORD(v11) = 42;
    LOBYTE(v10) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v9, buf, (unsigned __int8 *)&v11, (unsigned __int8 *)&v10);
    *(_DWORD *)buf = 6;
    LODWORD(v11) = 11;
    LOBYTE(v10) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v9, buf, (unsigned __int8 *)&v11, (unsigned __int8 *)&v10);
    *(_DWORD *)buf = 6;
    LODWORD(v11) = 21;
    LOBYTE(v10) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v9, buf, (unsigned __int8 *)&v11, (unsigned __int8 *)&v10);
    *(_DWORD *)buf = 6;
    LODWORD(v11) = 42;
    LOBYTE(v10) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v9, buf, (unsigned __int8 *)&v11, (unsigned __int8 *)&v10);
    *(_DWORD *)buf = 7;
    LOBYTE(v11) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,BOOL)>::operator()<tailspin_config *&,int,BOOL>(&v9, buf, (unsigned __int8 *)&v11);
    *(_DWORD *)buf = 8;
    LODWORD(v11) = 16;
    LOBYTE(v10) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v9, buf, (unsigned __int8 *)&v11, (unsigned __int8 *)&v10);
    *(_DWORD *)buf = 9;
    LODWORD(v11) = 2;
    LOBYTE(v10) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v9, buf, (unsigned __int8 *)&v11, (unsigned __int8 *)&v10);
    *(_DWORD *)buf = 10;
    LOBYTE(v11) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,BOOL)>::operator()<tailspin_config *&,int,BOOL>(&v9, buf, (unsigned __int8 *)&v11);
    *(_DWORD *)buf = 12;
    LODWORD(v11) = 1;
    LOBYTE(v10) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v9, buf, (unsigned __int8 *)&v11, (unsigned __int8 *)&v10);
    *(_DWORD *)buf = 31;
    LODWORD(v11) = 5;
    LOBYTE(v10) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v9, buf, (unsigned __int8 *)&v11, (unsigned __int8 *)&v10);
    *(_DWORD *)buf = 31;
    LODWORD(v11) = 7;
    LOBYTE(v10) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v9, buf, (unsigned __int8 *)&v11, (unsigned __int8 *)&v10);
    *(_DWORD *)buf = 31;
    LODWORD(v11) = 8;
    LOBYTE(v10) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v9, buf, (unsigned __int8 *)&v11, (unsigned __int8 *)&v10);
    *(_DWORD *)buf = 32;
    LOBYTE(v11) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,BOOL)>::operator()<tailspin_config *&,int,BOOL>(&v9, buf, (unsigned __int8 *)&v11);
    *(_DWORD *)buf = 33;
    LOBYTE(v11) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,BOOL)>::operator()<tailspin_config *&,int,BOOL>(&v9, buf, (unsigned __int8 *)&v11);
    *(_DWORD *)buf = 36;
    LOBYTE(v11) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,BOOL)>::operator()<tailspin_config *&,int,BOOL>(&v9, buf, (unsigned __int8 *)&v11);
    *(_DWORD *)buf = 37;
    LOBYTE(v11) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,BOOL)>::operator()<tailspin_config *&,int,BOOL>(&v9, buf, (unsigned __int8 *)&v11);
    *(_DWORD *)buf = 39;
    LODWORD(v11) = 240;
    LOBYTE(v10) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v9, buf, (unsigned __int8 *)&v11, (unsigned __int8 *)&v10);
    *(_DWORD *)buf = 41;
    LOBYTE(v11) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,BOOL)>::operator()<tailspin_config *&,int,BOOL>(&v9, buf, (unsigned __int8 *)&v11);
    *(_DWORD *)buf = 43;
    LOBYTE(v11) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,BOOL)>::operator()<tailspin_config *&,int,BOOL>(&v9, buf, (unsigned __int8 *)&v11);
    *(_DWORD *)buf = 46;
    LODWORD(v11) = 2;
    LOBYTE(v10) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v9, buf, (unsigned __int8 *)&v11, (unsigned __int8 *)&v10);
    *(_DWORD *)buf = 49;
    LOBYTE(v11) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,BOOL)>::operator()<tailspin_config *&,int,BOOL>(&v9, buf, (unsigned __int8 *)&v11);
    *(_DWORD *)buf = 50;
    LOBYTE(v11) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,BOOL)>::operator()<tailspin_config *&,int,BOOL>(&v9, buf, (unsigned __int8 *)&v11);
    *(_DWORD *)buf = 128;
    LODWORD(v11) = 1;
    LOBYTE(v10) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v9, buf, (unsigned __int8 *)&v11, (unsigned __int8 *)&v10);
    *(_DWORD *)buf = 130;
    LODWORD(v11) = 0;
    LOBYTE(v10) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v9, buf, (unsigned __int8 *)&v11, (unsigned __int8 *)&v10);
    *(_DWORD *)buf = 130;
    LODWORD(v11) = 5;
    LOBYTE(v10) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v9, buf, (unsigned __int8 *)&v11, (unsigned __int8 *)&v10);
    *(_DWORD *)buf = 130;
    LODWORD(v11) = 6;
    LOBYTE(v10) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v9, buf, (unsigned __int8 *)&v11, (unsigned __int8 *)&v10);
    *(_DWORD *)buf = 130;
    LODWORD(v11) = 40;
    LOBYTE(v10) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v9, buf, (unsigned __int8 *)&v11, (unsigned __int8 *)&v10);
    *(_DWORD *)buf = 133;
    LOBYTE(v11) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,BOOL)>::operator()<tailspin_config *&,int,BOOL>(&v9, buf, (unsigned __int8 *)&v11);
    *(_DWORD *)buf = 134;
    LODWORD(v11) = 143;
    LOBYTE(v10) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v9, buf, (unsigned __int8 *)&v11, (unsigned __int8 *)&v10);
    *(_DWORD *)buf = 135;
    LODWORD(v11) = 0;
    LOBYTE(v10) = 1;
    Symbol<void (*)(tailspin_config *,unsigned char,unsigned char,BOOL)>::operator()<tailspin_config *&,int,int,BOOL>(&v9, buf, (unsigned __int8 *)&v11, (unsigned __int8 *)&v10);
    Symbol<BOOL (*)(tailspin_config *)>::initialize((uint64_t)&weak_tailspin_config_apply_sync);
    if (weak_tailspin_config_apply_sync)
    {
      v7 = weak_tailspin_config_apply_sync(v9);
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
      if (v7)
      {
        if (v8)
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "HALB_Tailspin.mm";
          v13 = 1024;
          v14 = 297;
          _os_log_impl(&dword_1B57BA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%25s:%-5d  HALB_TailspinImpl::enableTailspin: Enabled tailspin.", buf, 0x12u);
        }
        v3 = 1;
        goto LABEL_29;
      }
      if (!v8)
        goto LABEL_28;
    }
    else
    {
      v3 = 0;
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_29;
    }
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "HALB_Tailspin.mm";
    v13 = 1024;
    v14 = 300;
    _os_log_impl(&dword_1B57BA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%25s:%-5d  HALB_TailspinImpl::enableTailspin: Failed to enable tailspin.", buf, 0x12u);
LABEL_28:
    v3 = 0;
LABEL_29:
    Symbol<void (*)(tailspin_config *)>::operator()<tailspin_config *&>((void (**)(_QWORD))&weak_tailspin_config_free, &v9);
    return v3;
  }
  return 1;
}

+ (optional<std::string>)dumpTailspinSync:(optional<std::string> *__return_ptr)retstr forReason:
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  char v19;
  optional<std::string> *result;
  id v21;
  void *v22;
  void *v23;
  __int128 v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  _QWORD v29[2];

  v4 = v2;
  v5 = v1;
  v29[1] = *MEMORY[0x1E0C80C00];
  v7 = v3;
  if (Symbol<tailspin_config * (*)(void)>::operator BOOL()
    && (Symbol<BOOL (*)(tailspin_config *)>::initialize((uint64_t)&weak_tailspin_enabled_get), weak_tailspin_enabled_get)
    && Symbol<void (*)(tailspin_config *)>::operator BOOL()
    && (Symbol<BOOL (*)(int,NSDictionary *)>::initialize(), weak_tailspin_dump_output_with_options_sync))
  {
    NSTemporaryDirectory();
    v8 = objc_claimAutoreleasedReturnValue();
    v28 = *MEMORY[0x1E0CB2AA8];
    v29[0] = &unk_1E69A8D30;
    v22 = (void *)v8;
    objc_msgSend(MEMORY[0x1E0C99D88], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, v23, &v27);
    v21 = v27;

    objc_msgSend(MEMORY[0x1E0C99D60], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v11, "setDateFormat:", CFSTR("yyyy-MM-dd_HH-mm-ss"));
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v11, "stringFromDate:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("AudioHAL_%@.tailspin"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "stringByAppendingPathComponent:", v14);
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = open((const char *)objc_msgSend(v15, "UTF8String"), 514, 438);
    if ((_DWORD)v16 == -1)
      NSLog(CFSTR("Failed to create file descriptor"));
    objc_msgSend(v5, "initOptionsDictionary");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "prepareDumpOptions:outDict:", v4, &v26);
    v17 = v26;
    get_TSPDumpOptions_ReasonString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setValue:forKey:", v7, v18);

    NSLog(CFSTR("Dropping tailspin to %@"), v15);
    Symbol<BOOL (*)(int,NSDictionary *)>::initialize();
    if (weak_tailspin_dump_output_with_options_sync)
      v19 = ((uint64_t (*)(uint64_t, id))weak_tailspin_dump_output_with_options_sync)(v16, v26);
    else
      v19 = 0;
    close(v16);
    if ((v19 & 1) != 0)
    {
      std::string::basic_string[abi:ne180100]<0>(&v24, (char *)objc_msgSend(objc_retainAutorelease(v15), "UTF8String"));
      *(_OWORD *)&retstr->var0.var0 = v24;
      *((_QWORD *)&retstr->var0.var1.var0.var0.var0.var1 + 2) = v25;
      LOBYTE(retstr->var0.var1.var0.var1.var0[0]) = 1;
    }
    else
    {
      NSLog(CFSTR("Failed to drop tailspin"));
      retstr->var0.var0 = 0;
      LOBYTE(retstr->var0.var1.var0.var1.var0[0]) = 0;
    }

  }
  else
  {
    retstr->var0.var0 = 0;
    LOBYTE(retstr->var0.var1.var0.var1.var0[0]) = 0;
  }

  return result;
}

@end
