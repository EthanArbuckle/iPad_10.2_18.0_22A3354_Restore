@implementation MFSocket

intptr_t __37___MFSocket__evaluateTrust_errorPtr___block_invoke(uint64_t a1, int a2)
{
  MFError *v3;
  NSObject *v4;

  switch(a2)
  {
    case 2:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
      objc_msgSend(*(id *)(a1 + 32), "_setCertificateIsTrusted:forAccount:", 1, *(_QWORD *)(a1 + 40));
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D0D588], "defaultTrustManager"), "allowTrust:forHost:service:", *(_QWORD *)(a1 + 80), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
      break;
    case 1:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
      break;
    case 0:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
      v3 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", *MEMORY[0x1E0CB31B0], -9825, 0);
      if (!v3)
        v3 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1029, 0);
      **(_QWORD **)(a1 + 72) = v3;
      v4 = MFLogGeneral();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __37___MFSocket__evaluateTrust_errorPtr___block_invoke_cold_1(a1, v3);
      break;
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

void __17___MFSocket_init__block_invoke()
{
  void *v0;
  int v1;
  NSObject *v2;
  const char *v3;
  NSObject *v4;
  uint32_t v5;
  NSObject *v6;
  int v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  if (objc_msgSend(v0, "objectForKey:", CFSTR("SocketTimeout")))
  {
    v1 = objc_msgSend(v0, "integerForKey:", CFSTR("SocketTimeout"));
    _DefaultTimeout = v1 & ~(v1 >> 31);
  }
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("DisableThroughputMonitoring")))
  {
    _LowThroughputThreshold = 1;
    v2 = MFLogGeneral();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      return;
    LOWORD(v8[0]) = 0;
    v3 = "#Streams throughput monitoring is OFF";
    v4 = v2;
    v5 = 2;
  }
  else
  {
    v6 = MFLogGeneral();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      return;
    if (_LowThroughputThreshold)
      v7 = 0;
    else
      v7 = 512;
    v8[0] = 67109120;
    v8[1] = v7;
    v3 = "#Streams low throughput threshold is %d bytes/sec";
    v4 = v6;
    v5 = 8;
  }
  _os_log_impl(&dword_1C8839000, v4, OS_LOG_TYPE_INFO, v3, (uint8_t *)v8, v5);
}

uint64_t __44___MFSocket_connectToHost_withPort_service___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;
  int v7;
  uint64_t v8;
  id v9;
  uint64_t v10;

  result = objc_msgSend(*(id *)(a1 + 32), "stream");
  if (result == a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "lock");
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("MFStreamEventCanAcceptBytes")))
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 75) = 1;
    }
    else
    {
      v7 = objc_msgSend(a3, "isEqualToString:", CFSTR("MFStreamEventHasBytesAvailable"));
      v8 = *(_QWORD *)(a1 + 32);
      if (v7)
      {
        *(_BYTE *)(v8 + 74) = 1;
        objc_msgSend(*(id *)(a1 + 32), "mf_lock");
        v9 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
        objc_msgSend(*(id *)(a1 + 32), "mf_unlock");
        if (v9)
        {
          v10 = 2;
          objc_msgSend(v9, "setArgument:atIndex:", &v10, 2);
          objc_msgSend(v9, "invoke");

        }
      }
      else
      {
        *(_BYTE *)(v8 + 75) = 0;
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 74) = 0;
      }
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "broadcast");
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "unlock");
  }
  return result;
}

void __44___MFSocket_connectToHost_withPort_service___block_invoke_2(uint64_t a1, uint64_t a2)
{
  int *Weak;
  int *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  MFError *v9;
  MFError *v10;
  NSObject *v11;
  _QWORD v12[2];
  _QWORD v13[2];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend((id)MFUserAgent(), "isForeground") & 1) != 0)
    return;
  Weak = (int *)objc_loadWeak((id *)(a1 + 40));
  v5 = Weak;
  if (Weak)
    ++Weak[16];
  v6 = MFLogGeneral();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    __44___MFSocket_connectToHost_withPort_service___block_invoke_2_cold_2();
    if (v5)
    {
LABEL_6:
      if (v5[16] < 11)
        return;
    }
  }
  else if (v5)
  {
    goto LABEL_6;
  }
  v7 = MFLogGeneral();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v15 = a2;
    v16 = 2112;
    v17 = objc_msgSend(v5, "stream");
    _os_log_impl(&dword_1C8839000, v7, OS_LOG_TYPE_INFO, "#Streams (%p) tearing down connection %@ due to low throughput", buf, 0x16u);
  }
  v12[0] = CFSTR("stream");
  v12[1] = CFSTR("threshold");
  v13[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), objc_msgSend(v5, "stream"));
  if (_LowThroughputThreshold)
    v8 = 0;
  else
    v8 = 512;
  v13[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
  +[MFPowerController powerlog:eventData:](MFPowerController, "powerlog:eventData:", CFSTR("LowThroughput"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2));
  v9 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", *MEMORY[0x1E0CB2FE0], 60, 0);
  if (!v9)
    v9 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1029, 0);
  v10 = v9;
  v11 = MFLogGeneral();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    __44___MFSocket_connectToHost_withPort_service___block_invoke_2_cold_1();
  objc_msgSend(*(id *)(a1 + 32), "setError:", v10);

  objc_msgSend(v5, "abort");
}

void __37___MFSocket__evaluateTrust_errorPtr___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a2, "domain");
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1C8839000, v2, v3, "*** _NSSocket.m:%s failed; socket=%p error=(%@,%ld)",
    v4,
    v5,
    v6,
    v7,
    2u);
  OUTLINED_FUNCTION_4();
}

void __44___MFSocket_connectToHost_withPort_service___block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_7(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1C8839000, v1, v2, "*** _NSSocket.m:%s failed; socket=%p error=(%@,%ld)",
    v3,
    v4,
    v5,
    v6,
    2u);
  OUTLINED_FUNCTION_4();
}

void __44___MFSocket_connectToHost_withPort_service___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_12(&dword_1C8839000, v0, v1, "#Streams (%p) received low throughput notification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

@end
