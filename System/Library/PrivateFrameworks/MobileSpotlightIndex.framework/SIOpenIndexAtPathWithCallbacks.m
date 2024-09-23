@implementation SIOpenIndexAtPathWithCallbacks

void __SIOpenIndexAtPathWithCallbacks_block_invoke_23()
{
  const __CFArray *v0;
  const __CFArray *v1;
  const __CFString *ValueAtIndex;

  v0 = CFLocaleCopyPreferredLanguages();
  v1 = v0;
  if (v0)
  {
    if (CFArrayGetCount(v0))
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v1, 0);
      if (CFStringFind(ValueAtIndex, CFSTR("ja"), 9uLL).length || CFStringFind(ValueAtIndex, CFSTR("zh"), 9uLL).length)
        SIOpenIndexAtPathWithCallbacks_isCJPrimary = 1;
    }
  }
  CFRelease(v1);
}

void *__SIOpenIndexAtPathWithCallbacks_block_invoke()
{
  void *result;

  result = (void *)g_prot_error_callback;
  if ((_UNKNOWN *)g_prot_error_callback != &__block_literal_global_13_8846)
  {
    if (g_prot_error_callback)
      _Block_release((const void *)g_prot_error_callback);
    result = _Block_copy(&__block_literal_global_13_8846);
    g_prot_error_callback = (uint64_t)result;
  }
  return result;
}

uint64_t __SIOpenIndexAtPathWithCallbacks_block_invoke_2(uint64_t a1, int a2, int a3, int a4)
{
  int v7;
  NSObject *v8;
  os_log_type_t v9;
  NSObject *v10;
  os_log_type_t v11;
  NSObject *v12;
  thread_read_t *v13;
  mach_port_name_t v14;
  uint64_t v15;
  double *v16;
  double Current;
  unsigned int v18;
  int v19;
  NSObject *v20;
  void (*v22[4])(_QWORD, _QWORD);
  int v23;
  int v24;
  uint8_t buf[4];
  _BYTE v26[10];
  _DWORD v27[2];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a3 == 17 || a3 == 2)
  {
    v7 = *__error();
    v8 = _SILogForLogForCategory(10);
    v9 = 2 * (dword_1EF19FCB4 < 4);
    if (!os_log_type_enabled(v8, v9))
      goto LABEL_8;
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v26 = a2;
    *(_WORD *)&v26[4] = 1024;
    *(_DWORD *)&v26[6] = a3;
    LOWORD(v27[0]) = 1024;
    *(_DWORD *)((char *)v27 + 2) = a4;
    v10 = v8;
    v11 = v9;
  }
  else
  {
    v7 = *__error();
    v12 = _SILogForLogForCategory(10);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v26 = a2;
    *(_WORD *)&v26[4] = 1024;
    *(_DWORD *)&v26[6] = a3;
    LOWORD(v27[0]) = 1024;
    *(_DWORD *)((char *)v27 + 2) = a4;
    v10 = v12;
    v11 = OS_LOG_TYPE_DEFAULT;
  }
  _os_log_impl(&dword_1B8270000, v10, v11, "fd_error_callback (%d, %d, %d)", buf, 0x14u);
LABEL_8:
  *__error() = v7;
  if (a2 == -1)
    return 0;
  if (a3 == 14 || a3 == 1)
  {
    v13 = (thread_read_t *)MEMORY[0x1BCCB104C]();
    v14 = v13;
    v22[0] = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
    v22[1] = (void (*)(_QWORD, _QWORD))0x40000000;
    v22[2] = (void (*)(_QWORD, _QWORD))__SIOpenIndexAtPathWithCallbacks_block_invoke_14;
    v22[3] = (void (*)(_QWORD, _QWORD))&__block_descriptor_tmp_18_8851;
    v23 = a2;
    v24 = a3;
    v15 = _SISuspendThreadIfLocked(v13, v22);
    mach_port_deallocate(*MEMORY[0x1E0C83DA0], v14);
  }
  else
  {
    v15 = 0;
  }
  if (a3 == 14 && (v15 & 1) == 0)
  {
    if (kIndexOptionPriorityPC_block_invoke_sOnce != -1)
      dispatch_once(&kIndexOptionPriorityPC_block_invoke_sOnce, &__block_literal_global_21_8852);
    v16 = (double *)pthread_getspecific(kIndexOptionPriorityPC_block_invoke_error_key);
    if (!v16)
    {
      v16 = (double *)malloc_type_calloc(1uLL, 0x10uLL, 0x1000040D9A13B51uLL);
      pthread_setspecific(kIndexOptionPriorityPC_block_invoke_error_key, v16);
    }
    Current = CFAbsoluteTimeGetCurrent();
    if (Current - *v16 > 1.0)
    {
      *v16 = Current;
      *((_DWORD *)v16 + 2) = 1;
LABEL_23:
      v19 = *__error();
      v20 = _SILogForLogForCategory(10);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)v26 = "SIOpenIndexAtPathWithCallbacks_block_invoke_2";
        *(_WORD *)&v26[8] = 1024;
        v27[0] = 335;
        _os_log_error_impl(&dword_1B8270000, v20, OS_LOG_TYPE_ERROR, "%s:%d: EFAULT: Retry operation", buf, 0x12u);
      }
      *__error() = v19;
      usleep(0x7D0u);
      return 1;
    }
    v18 = *((_DWORD *)v16 + 2);
    *((_DWORD *)v16 + 2) = v18 + 1;
    if (v18 <= 9)
    {
      *v16 = Current;
      goto LABEL_23;
    }
    return 0;
  }
  return v15;
}

int *__SIOpenIndexAtPathWithCallbacks_block_invoke_14(uint64_t a1, int a2)
{
  int v4;
  NSObject *v5;
  os_log_type_t v6;
  const char *v7;
  int v8;
  int v9;
  int *result;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = *__error();
  v5 = _SILogForLogForCategory(10);
  v6 = 2 * (dword_1EF19FCB4 < 4);
  if (os_log_type_enabled(v5, v6))
  {
    v7 = "Resume";
    v8 = *(_DWORD *)(a1 + 32);
    v9 = *(_DWORD *)(a1 + 36);
    if (a2)
      v7 = "Suspend";
    v11 = 136315650;
    v12 = v7;
    v13 = 1024;
    v14 = v8;
    v15 = 1024;
    v16 = v9;
    _os_log_impl(&dword_1B8270000, v5, v6, "%s fd:%d, error:%d (Check if background assertion required, maybe?)", (uint8_t *)&v11, 0x18u);
  }
  result = __error();
  *result = v4;
  return result;
}

uint64_t __SIOpenIndexAtPathWithCallbacks_block_invoke_19()
{
  return pthread_key_create((pthread_key_t *)&kIndexOptionPriorityPC_block_invoke_error_key, (void (__cdecl *)(void *))MEMORY[0x1E0C834A8]);
}

@end
