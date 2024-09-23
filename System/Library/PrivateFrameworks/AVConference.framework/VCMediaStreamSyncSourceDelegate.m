@implementation VCMediaStreamSyncSourceDelegate

void __VCMediaStreamSyncSourceDelegate_updateSourceState_block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  _BOOL4 v5;
  int v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(a1 + 40) != *(_DWORD *)(*(_QWORD *)(a1 + 32) + 100))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v2 = VRTraceErrorLogLevelToCSTR();
      v3 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v4 = *(_QWORD *)(a1 + 32);
        v5 = *(_DWORD *)(a1 + 40) == 0;
        v7 = 136316162;
        v8 = v2;
        v9 = 2080;
        v10 = "VCMediaStreamSyncSourceDelegate_updateSourceState_block_invoke";
        v11 = 1024;
        v12 = 310;
        v13 = 2048;
        v14 = v4;
        v15 = 1024;
        v16 = v5;
        _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "VCMediaStreamSynchronizer [%s] %s:%d VCMediaStreamSynchronizer[%p]: isSourceActive:%d", (uint8_t *)&v7, 0x2Cu);
      }
    }
    v6 = *(_DWORD *)(a1 + 40);
    if (v6 == 1)
    {
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 64) = 0;
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 96) = 0;
      v6 = *(_DWORD *)(a1 + 40);
    }
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 100) = v6;
  }
}

void __VCMediaStreamSyncSourceDelegate_resetSourceState_block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 136315906;
      v6 = v2;
      v7 = 2080;
      v8 = "VCMediaStreamSyncSourceDelegate_resetSourceState_block_invoke";
      v9 = 1024;
      v10 = 327;
      v11 = 2048;
      v12 = v4;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "VCMediaStreamSynchronizer [%s] %s:%d VCMediaStreamSynchronizer[%p]: resetting source state", (uint8_t *)&v5, 0x26u);
    }
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 64) = 0;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 96) = 0;
}

double __VCMediaStreamSyncSourceDelegate_updateSourcePlayoutSampleRTPTimestamp_block_invoke(uint64_t a1)
{
  double result;
  CMTime v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  _VCMediaStreamSynchronizer_updateSourcePlayoutSampleRTPTimestampInternal(*(_QWORD *)(a1 + 32), *(_DWORD *)(a1 + 56), &v3, *(double *)(a1 + 48));
  result = *(double *)&v3.value;
  *(CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = v3;
  return result;
}

CMTime *__VCMediaStreamSyncSourceDelegate_updateSourcePlayoutSampleRTPTimestamp_block_invoke_2(uint64_t a1)
{
  CMTime v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  return _VCMediaStreamSynchronizer_updateSourcePlayoutSampleRTPTimestampInternal(*(_QWORD *)(a1 + 32), *(_DWORD *)(a1 + 48), &v2, *(double *)(a1 + 40));
}

double __VCMediaStreamSyncSourceDelegate_updateSourceNTPTimeWithRTPTimeStamp_block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 48) = result;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 64) = *(_DWORD *)(a1 + 48);
  return result;
}

@end
