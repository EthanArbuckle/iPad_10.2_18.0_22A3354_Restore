@implementation DMCBacktraceLogger

+ (id)callerOfCurrentMethod
{
  void *v2;
  __CFString *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v2, "count") >= 3)
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dmc_substringWithPattern:", CFSTR(".*0x[a-f0-9]*\\s(.*)\\s\\+.*"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = CFSTR("Unknown");
  }

  return v3;
}

+ (BOOL)dumpStackshotToPath:(id)a3 fileName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  BOOL v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v33;
  BOOL v34;
  void *v35;
  void *v36;
  id obj;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  uint8_t v44[128];
  uint8_t buf[4];
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "callerOfCurrentMethod");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("Requested by: %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = WriteStackshotReport();

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0;
    objc_msgSend(v12, "contentsOfDirectoryAtPath:error:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter"), &v43);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v43;
    v15 = v14 == 0;
    if (v14)
    {
      v16 = *DMCLogObjects();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v46 = v14;
        _os_log_impl(&dword_1A4951000, v16, OS_LOG_TYPE_ERROR, "Failed to grab all files under crash report folder: %{public}@", buf, 0xCu);
      }
      goto LABEL_24;
    }
    v38 = (void *)objc_opt_new();
    objc_msgSend(v38, "setDateFormat:", CFSTR("yyyy-MM-dd-HHmmss"));
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = v13;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v18)
    {
      v19 = v18;
      v33 = v13;
      v34 = v14 == 0;
      v35 = v12;
      v36 = v6;
      v20 = 0;
      v21 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v40 != v21)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v23, "dmc_substringWithPattern:", CFSTR("stacks-([0-9-]*).*ips"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "dateFromString:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "laterDate:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26 != v17)
          {
            v27 = v25;

            v28 = v23;
            v20 = v28;
            v17 = v27;
          }

        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v19);

      if (!v20)
      {
        v6 = v36;
        v12 = v35;
        v15 = v34;
        v14 = 0;
        v13 = v33;
        goto LABEL_23;
      }
      v12 = v35;
      v6 = v36;
      v14 = 0;
      if ((objc_msgSend(v35, "fileExistsAtPath:isDirectory:", v36, 0) & 1) == 0)
        objc_msgSend(v35, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v36, 1, 0, 0);
      objc_msgSend(v36, "stringByAppendingPathComponent:", v7);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("/private/var/mobile/Library/Logs/CrashReporter"), "stringByAppendingPathComponent:", v20);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      DMCSafelyCopyItemAtPathToDestinationPathFM(v35, v30, v29, 0);

      v31 = *DMCLogObjects();
      v15 = v34;
      v13 = v33;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v46 = v29;
        _os_log_impl(&dword_1A4951000, v31, OS_LOG_TYPE_DEFAULT, "DMCBacktraceLogger: stackshot collected. Location: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      v20 = 0;
      v29 = obj;
    }

LABEL_23:
LABEL_24:

    goto LABEL_25;
  }
  v15 = 0;
LABEL_25:

  return v15;
}

- (void)trackCurrentThread
{
  -[DMCBacktraceLogger setTrackedThread:](self, "setTrackedThread:", MEMORY[0x1A85A39E8](self, a2));
}

- (id)getBacktraceFromTrackedThread
{
  return +[DMCBacktraceLogger _getBacktraceFromThread:bufferSize:](DMCBacktraceLogger, "_getBacktraceFromThread:bufferSize:", -[DMCBacktraceLogger trackedThread](self, "trackedThread"), 15);
}

+ (id)_getBacktraceFromThread:(unsigned int)a3 bufferSize:(int)a4
{
  uint64_t v5;
  _QWORD *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  _BYTE v22[272];
  _OWORD v23[17];
  uint64_t v24;

  v5 = *(_QWORD *)&a3;
  v24 = *MEMORY[0x1E0C80C00];
  v7 = &v22[-((8 * a4 + 15) & 0xFFFFFFFF0) - 16];
  v8 = (void *)objc_opt_new();
  memset(v22, 0, sizeof(v22));
  objc_msgSend(a1, "_getThreadStateForThread:", v5);
  memcpy(v23, v22, sizeof(v23));
  v9 = (id)objc_msgSend(a1, "_getPCFromThreadState:", v23);
  v10 = *DMCLogObjects();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LODWORD(v23[0]) = 134217984;
    *(_QWORD *)((char *)v23 + 4) = v9;
    _os_log_impl(&dword_1A4951000, v10, OS_LOG_TYPE_INFO, "program counter: 0x%lx", (uint8_t *)v23, 0xCu);
  }
  if (v9)
  {
    *v7 = v9;
    memcpy(v23, v22, sizeof(v23));
    v9 = (id)objc_msgSend(a1, "_getLRFromThreadState:", v23);
    v11 = *DMCLogObjects();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LODWORD(v23[0]) = 134217984;
      *(_QWORD *)((char *)v23 + 4) = v9;
      _os_log_impl(&dword_1A4951000, v11, OS_LOG_TYPE_INFO, "link register: 0x%lx", (uint8_t *)v23, 0xCu);
    }
    if (v9)
    {
      v7[1] = v9;
      memcpy(v23, v22, sizeof(v23));
      v9 = (id)objc_msgSend(a1, "_getFPFromThreadState:", v23);
      v12 = *DMCLogObjects();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LODWORD(v23[0]) = 134217984;
        *(_QWORD *)((char *)v23 + 4) = v9;
        _os_log_impl(&dword_1A4951000, v12, OS_LOG_TYPE_INFO, "frame pointer: 0x%lx", (uint8_t *)v23, 0xCu);
      }
      if (v9)
      {
        v23[0] = 0uLL;
        v13 = objc_msgSend(a1, "_copyFrameInformation:destination:size:", v9, v23, 16);
        v9 = 0;
        if (v13)
        {
          v14 = 2;
          if (a4 >= 3 && (v15 = *((_QWORD *)&v23[0] + 1)) != 0 && *(_QWORD *)&v23[0])
          {
            v14 = 2;
            while (1)
            {
              v7[v14] = v15;
              if (!objc_msgSend(a1, "_copyFrameInformation:destination:size:", 0, 0))
                break;
              ++v14;
              v23[0] = v21;
              if (v14 < a4)
              {
                v15 = *((_QWORD *)&v23[0] + 1);
                if (*((_QWORD *)&v23[0] + 1))
                {
                  if (*(_QWORD *)&v23[0])
                    continue;
                }
              }
              goto LABEL_19;
            }
            v9 = 0;
          }
          else
          {
LABEL_19:
            v16 = v14;
            v17 = &v22[-32 * v14 - 16];
            bzero(v17, 32 * v14);
            objc_msgSend(a1, "_symbolicateBuffer:symbolsBuffer:count:", v7, v17, v14);
            v18 = 0;
            do
            {
              if (v17[2])
              {
                objc_msgSend(a1, "_logWithSymbol:address:index:", v17, v7[v18], v18);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "addObject:", v19);

              }
              ++v18;
              v17 += 4;
            }
            while (v16 != v18);
            v9 = v8;
          }
        }
      }
    }
  }

  return v9;
}

+ (__darwin_arm_thread_state64)_getThreadStateForThread:(SEL)a3
{
  __darwin_arm_thread_state64 *result;
  NSObject *v5;
  uint8_t v6[12];
  mach_msg_type_number_t old_stateCnt;

  *(_OWORD *)&retstr->__lr = 0u;
  *(_OWORD *)&retstr->__pc = 0u;
  *(_OWORD *)&retstr->__x[26] = 0u;
  *(_OWORD *)&retstr->__x[28] = 0u;
  *(_OWORD *)&retstr->__x[22] = 0u;
  *(_OWORD *)&retstr->__x[24] = 0u;
  *(_OWORD *)&retstr->__x[18] = 0u;
  *(_OWORD *)&retstr->__x[20] = 0u;
  *(_OWORD *)&retstr->__x[14] = 0u;
  *(_OWORD *)&retstr->__x[16] = 0u;
  *(_OWORD *)&retstr->__x[10] = 0u;
  *(_OWORD *)&retstr->__x[12] = 0u;
  *(_OWORD *)&retstr->__x[6] = 0u;
  *(_OWORD *)&retstr->__x[8] = 0u;
  *(_OWORD *)&retstr->__x[2] = 0u;
  *(_OWORD *)&retstr->__x[4] = 0u;
  *(_OWORD *)retstr->__x = 0u;
  old_stateCnt = 68;
  result = (__darwin_arm_thread_state64 *)thread_get_state(a4, 6, (thread_state_t)retstr, &old_stateCnt);
  if ((_DWORD)result)
  {
    v5 = *DMCLogObjects();
    result = (__darwin_arm_thread_state64 *)os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if ((_DWORD)result)
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A4951000, v5, OS_LOG_TYPE_ERROR, "Failed to get thread state", v6, 2u);
    }
  }
  return result;
}

+ (unint64_t)_getPCFromThreadState:(__darwin_arm_thread_state64 *)a3
{
  return a3->__pc;
}

+ (unint64_t)_getLRFromThreadState:(__darwin_arm_thread_state64 *)a3
{
  return a3->__lr;
}

+ (unint64_t)_getFPFromThreadState:(__darwin_arm_thread_state64 *)a3
{
  return a3->__fp;
}

+ (BOOL)_copyFrameInformation:(unint64_t)a3 destination:(unint64_t)a4 size:(unint64_t)a5
{
  kern_return_t v6;
  NSObject *v7;
  vm_size_t outsize;
  uint8_t buf[4];
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  outsize = 0;
  v6 = vm_read_overwrite(*MEMORY[0x1E0C83DA0], a3, a5, a4, &outsize);
  if (v6)
  {
    v7 = *DMCLogObjects();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v11 = a3;
      _os_log_impl(&dword_1A4951000, v7, OS_LOG_TYPE_ERROR, "Failed to copy frame information from 0x%lx", buf, 0xCu);
    }
  }
  return v6 == 0;
}

+ (void)_symbolicateBuffer:(const unint64_t *)a3 symbolsBuffer:(dl_info *)a4 count:(int)a5
{
  unint64_t v7;
  uint64_t v8;
  dl_info *v9;
  const void *v10;
  Dl_info *v11;

  if (a5 >= 1)
  {
    v7 = 0;
    v8 = 8 * a5;
    v9 = a4;
    do
    {
      if (v7)
      {
        v10 = (const void *)((a3[v7 / 8] & 0xFFFFFFFFFFFFFFFCLL) - 1);
        v11 = v9;
      }
      else
      {
        v10 = (const void *)*a3;
        v11 = a4;
      }
      dladdr(v10, v11);
      v7 += 8;
      ++v9;
    }
    while (v8 != v7);
  }
}

+ (id)_logWithSymbol:(dl_info *)a3 address:(unint64_t)a4 index:(int)a5
{
  uint64_t v5;
  const char *dli_fname;
  char *v9;
  const char *v10;

  v5 = *(_QWORD *)&a5;
  dli_fname = a3->dli_fname;
  if (a3->dli_fname)
  {
    v9 = strrchr((char *)a3->dli_fname, 47);
    if (v9)
      v10 = v9 + 1;
    else
      v10 = dli_fname;
  }
  else
  {
    v10 = 0;
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%2d %-30s  0x%08lx %s + %lu"), v5, v10, a4, a3->dli_sname, a4 - (unint64_t)a3->dli_saddr);
}

- (unsigned)trackedThread
{
  return self->_trackedThread;
}

- (void)setTrackedThread:(unsigned int)a3
{
  self->_trackedThread = a3;
}

@end
