@implementation VCNAT64ResolveNAT64Prefix

void __VCNAT64ResolveNAT64Prefix_block_invoke(uint64_t a1, int a2, __int128 *a3)
{
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  const __CFArray *v10;
  int Count;
  CFIndex v12;
  _QWORD *ValueAtIndex;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  unsigned int v17;
  int ErrorLogLevelForModule;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  dispatch_time_t v26;
  NSObject *v27;
  _QWORD v28[4];
  __int128 v29;
  NSObject *v30;
  int v31;
  __int128 v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock(&sharedInstanceLock);
  v6 = *(_QWORD *)(a1 + 32);
  *(_BYTE *)(v6 + 32) = 1;
  if (*(_BYTE *)(v6 + 33))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
        *(_DWORD *)buf = 136315906;
        v34 = v7;
        v35 = 2080;
        v36 = "VCNAT64ResolveNAT64Prefix_block_invoke";
        v37 = 1024;
        v38 = 188;
        v39 = 2080;
        v40 = v9;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCNAT64ResolveNAT64Prefix: DNS callback context has already been released for nterface %s", buf, 0x26u);
      }
    }
    VCNAT64ReleaseCallBackContext(*(CFArrayRef **)(a1 + 32));
    pthread_mutex_unlock(&sharedInstanceLock);
    dispatch_release(*(dispatch_object_t *)(a1 + 40));
    dispatch_release(*(dispatch_object_t *)(a1 + 48));
    return;
  }
  if (a2 <= 0)
  {
    if (a2)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __VCNAT64ResolveNAT64Prefix_block_invoke_cold_1();
      }
    }
    else
    {
      v17 = *(_DWORD *)(v6 + 36);
      *(_DWORD *)(v6 + 36) = v17 + 1;
      ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if (v17 < 3)
      {
        if (ErrorLogLevelForModule >= 7)
        {
          v22 = VRTraceErrorLogLevelToCSTR();
          v23 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v24 = *(_QWORD *)(a1 + 32);
            v25 = *(_QWORD *)(v24 + 24);
            LODWORD(v24) = *(_DWORD *)(v24 + 36);
            *(_DWORD *)buf = 136316418;
            v34 = v22;
            v35 = 2080;
            v36 = "VCNAT64ResolveNAT64Prefix_block_invoke";
            v37 = 1024;
            v38 = 201;
            v39 = 2080;
            v40 = v25;
            v41 = 1024;
            v42 = v24;
            v43 = 1024;
            v44 = 3;
            _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCNAT64ResolveNAT64Prefix: Re-trying in 1 second for Interface %s, attempt %d out of %d", buf, 0x32u);
          }
        }
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 0;
        v26 = dispatch_time(0, 1000000000);
        v27 = *(NSObject **)(a1 + 48);
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 0x40000000;
        v28[2] = __VCNAT64ResolveNAT64Prefix_block_invoke_4;
        v28[3] = &__block_descriptor_tmp_17;
        v31 = *(_DWORD *)(a1 + 56);
        v29 = *(_OWORD *)(a1 + 32);
        v30 = v27;
        dispatch_after(v26, v27, v28);
        goto LABEL_25;
      }
      if (ErrorLogLevelForModule >= 7)
      {
        v19 = VRTraceErrorLogLevelToCSTR();
        v20 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
          *(_DWORD *)buf = 136315906;
          v34 = v19;
          v35 = 2080;
          v36 = "VCNAT64ResolveNAT64Prefix_block_invoke";
          v37 = 1024;
          v38 = 199;
          v39 = 2080;
          v40 = v21;
          _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCNAT64ResolveNAT64Prefix: Interface %s IS NOT behind NAT 64", buf, 0x26u);
        }
      }
    }
    dispatch_release(*(dispatch_object_t *)(a1 + 40));
    dispatch_release(*(dispatch_object_t *)(a1 + 48));
LABEL_25:
    pthread_mutex_unlock(&sharedInstanceLock);
    return;
  }
  v32 = *a3;
  *(_OWORD *)(v6 + 8) = v32;
  v10 = **(const __CFArray ***)(a1 + 32);
  Count = CFArrayGetCount(v10);
  v12 = (Count - 1);
  if (Count - 1 >= 0)
  {
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v10, v12);
      if (ValueAtIndex && *ValueAtIndex)
        ((void (*)(_QWORD, _QWORD, __int128 *))*ValueAtIndex)(ValueAtIndex[1], *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), &v32);
      --Count;
      --v12;
    }
    while (Count > 0);
  }
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  dispatch_release(*(dispatch_object_t *)(a1 + 48));
  pthread_mutex_unlock(&sharedInstanceLock);
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      *(_DWORD *)buf = 136315906;
      v34 = v14;
      v35 = 2080;
      v36 = "VCNAT64ResolveNAT64Prefix_block_invoke";
      v37 = 1024;
      v38 = 234;
      v39 = 2080;
      v40 = v16;
      _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCNAT64ResolveNAT64Prefix: Interface %s IS behind NAT 64", buf, 0x26u);
    }
  }
}

void __VCNAT64ResolveNAT64Prefix_block_invoke_4(uint64_t a1)
{
  VCNAT64ResolveNAT64Prefix(*(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 32), *(NSObject **)(a1 + 40), *(NSObject **)(a1 + 48));
}

void __VCNAT64ResolveNAT64Prefix_block_invoke_cold_1()
{
  int v0;
  os_log_t v1;
  uint8_t v2[14];
  const char *v3;
  __int16 v4;
  int v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = "VCNAT64ResolveNAT64Prefix_block_invoke_2";
  v4 = 1024;
  v5 = 210;
  v6 = 1024;
  v7 = v0;
  _os_log_error_impl(&dword_1D8A54000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d VCNAT64ResolveNAT64Prefix: NAT64 prefix resolution failed with error %d", v2, 0x22u);
  OUTLINED_FUNCTION_3();
}

@end
