@implementation LKBacktraceLogger

- (void)trackCurrentThread
{
  -[LKBacktraceLogger setTrackedThread:](self, "setTrackedThread:", MEMORY[0x2199FBA4C](self, a2));
}

- (id)getBacktraceFromTrackedThread
{
  return -[LKBacktraceLogger _getBacktraceFromThread:](self, "_getBacktraceFromThread:", -[LKBacktraceLogger trackedThread](self, "trackedThread"));
}

- (id)_getBacktraceFromThread:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  void *v28;
  _OWORD v30[17];
  __int128 v31;
  _OWORD v32[17];
  _QWORD v33[16];

  v3 = *(_QWORD *)&a3;
  v33[15] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_opt_new();
  memset(v30, 0, sizeof(v30));
  -[LKBacktraceLogger _getThreadStateForThread:](self, "_getThreadStateForThread:", v3);
  memcpy(v32, v30, sizeof(v32));
  v6 = -[LKBacktraceLogger _getPCFromThreadState:](self, "_getPCFromThreadState:", v32);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    LODWORD(v32[0]) = 134217984;
    *(_QWORD *)((char *)v32 + 4) = v6;
    _os_log_impl(&dword_2167FC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "program counter: 0x%lx", (uint8_t *)v32, 0xCu);
  }
  if (v6)
  {
    v33[0] = v6;
    memcpy(v32, v30, sizeof(v32));
    v6 = -[LKBacktraceLogger _getLRFromThreadState:](self, "_getLRFromThreadState:", v32);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      -[LKBacktraceLogger _getBacktraceFromThread:].cold.2((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
      if (!v6)
        goto LABEL_27;
    }
    else if (!v6)
    {
      goto LABEL_27;
    }
    v33[1] = v6;
    memcpy(v32, v30, sizeof(v32));
    v6 = -[LKBacktraceLogger _getFPFromThreadState:](self, "_getFPFromThreadState:", v32);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      -[LKBacktraceLogger _getBacktraceFromThread:].cold.1((uint64_t)v6, v14, v15, v16, v17, v18, v19, v20);
      if (!v6)
        goto LABEL_27;
    }
    else if (!v6)
    {
      goto LABEL_27;
    }
    v32[0] = 0uLL;
    v21 = -[LKBacktraceLogger _copyFrameInformation:destination:size:](self, "_copyFrameInformation:destination:size:", v6, v32, 16);
    v6 = 0;
    if (v21)
    {
      v22 = *((_QWORD *)&v32[0] + 1);
      v23 = 2;
      if (*((_QWORD *)&v32[0] + 1) && *(_QWORD *)&v32[0])
      {
        v24 = 2;
        while (1)
        {
          v33[v24] = v22;
          v31 = 0uLL;
          if (!-[LKBacktraceLogger _copyFrameInformation:destination:size:](self, "_copyFrameInformation:destination:size:"))break;
          v23 = v24 + 1;
          v32[0] = v31;
          if (v24 <= 0xD)
          {
            v22 = *((_QWORD *)&v32[0] + 1);
            if (*((_QWORD *)&v32[0] + 1))
            {
              ++v24;
              if (*(_QWORD *)&v32[0])
                continue;
            }
          }
          goto LABEL_16;
        }
        v6 = 0;
      }
      else
      {
LABEL_16:
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          LODWORD(v31) = 67109120;
          DWORD1(v31) = v23;
          _os_log_impl(&dword_2167FC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "backtrace's size: %d", (uint8_t *)&v31, 8u);
        }
        v25 = v23;
        v26 = &v30[-2 * v23];
        bzero(v26, 32 * v23);
        -[LKBacktraceLogger _symbolicateBuffer:symbolsBuffer:count:](self, "_symbolicateBuffer:symbolsBuffer:count:", v33, v26, v23);
        v27 = 0;
        do
        {
          if (v26[2])
          {
            -[LKBacktraceLogger _logWithSymbol:address:index:](self, "_logWithSymbol:address:index:", v26, v33[v27], v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v28);

          }
          ++v27;
          v26 += 4;
        }
        while (v25 != v27);
        v6 = v5;
      }
    }
  }
LABEL_27:

  return v6;
}

- (__darwin_arm_thread_state64)_getThreadStateForThread:(SEL)a3
{
  __darwin_arm_thread_state64 *result;
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
    result = (__darwin_arm_thread_state64 *)os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if ((_DWORD)result)
      -[LKBacktraceLogger _getThreadStateForThread:].cold.1();
  }
  return result;
}

- (unint64_t)_getPCFromThreadState:(__darwin_arm_thread_state64 *)a3
{
  return a3->__pc;
}

- (unint64_t)_getLRFromThreadState:(__darwin_arm_thread_state64 *)a3
{
  return a3->__lr;
}

- (unint64_t)_getFPFromThreadState:(__darwin_arm_thread_state64 *)a3
{
  return a3->__fp;
}

- (BOOL)_copyFrameInformation:(unint64_t)a3 destination:(unint64_t)a4 size:(unint64_t)a5
{
  kern_return_t v6;
  vm_size_t outsize;

  outsize = 0;
  v6 = vm_read_overwrite(*MEMORY[0x24BDAEC58], a3, a5, a4, &outsize);
  if (v6 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[LKBacktraceLogger _copyFrameInformation:destination:size:].cold.1(a3);
  return v6 == 0;
}

- (void)_symbolicateBuffer:(const unint64_t *)a3 symbolsBuffer:(dl_info *)a4 count:(int)a5
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

- (id)_logWithSymbol:(dl_info *)a3 address:(unint64_t)a4 index:(int)a5
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
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%2d %-30s  0x%08lx %s + %lu"), v5, v10, a4, a3->dli_sname, a4 - (unint64_t)a3->dli_saddr);
}

- (unsigned)trackedThread
{
  return self->_trackedThread;
}

- (void)setTrackedThread:(unsigned int)a3
{
  self->_trackedThread = a3;
}

- (void)_getBacktraceFromThread:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_2167FC000, MEMORY[0x24BDACB70], a3, "frame pointer: 0x%lx", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_2();
}

- (void)_getBacktraceFromThread:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_2167FC000, MEMORY[0x24BDACB70], a3, "link register: 0x%lx", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_2();
}

- (void)_getThreadStateForThread:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_2167FC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to get thread state", v0, 2u);
}

- (void)_copyFrameInformation:(uint64_t)a1 destination:size:.cold.1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 134217984;
  v2 = a1;
  _os_log_error_impl(&dword_2167FC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to copy frame information from 0x%lx", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1_2();
}

@end
