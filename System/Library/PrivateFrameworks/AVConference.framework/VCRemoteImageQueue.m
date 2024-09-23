@implementation VCRemoteImageQueue

uint64_t ___VCRemoteImageQueue_Enqueue_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_DWORD *)(a4 + 16);
      v11 = 136316162;
      v12 = v6;
      v13 = 2080;
      v14 = "_VCRemoteImageQueue_Enqueue_block_invoke";
      v15 = 1024;
      v16 = 130;
      v17 = 2048;
      v18 = v8;
      v19 = 1024;
      v20 = v9;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d remoteImageQueue=%p msgType=%d Queue is full. Resetting....", (uint8_t *)&v11, 0x2Cu);
    }
  }
  return 0;
}

@end
