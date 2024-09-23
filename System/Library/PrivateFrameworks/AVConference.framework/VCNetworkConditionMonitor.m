@implementation VCNetworkConditionMonitor

uint64_t __VCNetworkConditionMonitor_Invalidate_block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 24) = 0;
  return result;
}

void __VCNetworkConditionMonitor_SetBrokenNetworkStatus_block_invoke(uint64_t a1)
{
  _BYTE *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  int v9;
  _BYTE *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = (_BYTE *)(a1 + 41);
  v3 = *(unsigned __int8 *)(a1 + 41);
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
  {
    if (v3 == *(unsigned __int8 *)(v4 + 122))
      return;
  }
  else
  {
    if (v3 == *(unsigned __int8 *)(v4 + 123))
      return;
    LOBYTE(v3) = *(_BYTE *)(v4 + 122);
  }
  *(_BYTE *)(v4 + 122) = v3;
  if (*(_BYTE *)(a1 + 40))
    v2 = (_BYTE *)(v4 + 123);
  *(_BYTE *)(v4 + 123) = *v2;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(unsigned __int8 *)(a1 + 40);
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(unsigned __int8 *)(v8 + 122);
      LODWORD(v8) = *(unsigned __int8 *)(v8 + 123);
      v11 = 136316674;
      v12 = v5;
      v13 = 2080;
      v14 = "VCNetworkConditionMonitor_SetBrokenNetworkStatus_block_invoke";
      v15 = 1024;
      v16 = 203;
      v17 = 1024;
      v18 = 203;
      v19 = 1024;
      v20 = v7;
      v21 = 1024;
      v22 = v9;
      v23 = 1024;
      v24 = v8;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/ConnectionManager/VCNetworkConditionMonitor.c:%d: NetworkConditionMonitor: isLocal=%d isLocalNetworkBroken=%d isRemoteNetworkBroken=%d", (uint8_t *)&v11, 0x34u);
    }
  }
  v10 = *(_BYTE **)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
    _VCNetworkConditionMonitor_RunLocalNetworkDetectionAlgorithm(v10);
  else
    _VCNetworkConditionMonitor_triggerNetworkConditionCallback((uint64_t)v10, 0);
}

void __VCNetworkConditionMonitor_SetWiFiChannelQualityScore_block_invoke(uint64_t a1, double a2)
{
  double v2;
  uint64_t v3;
  double v4;
  uint64_t v5;
  double v6;
  int v7;
  int v8;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  LOBYTE(a2) = *(_BYTE *)(a1 + 40);
  v2 = (double)*(unint64_t *)&a2;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(double *)(v3 + 104);
  v5 = 72;
  if (v4 < v2)
    v5 = 80;
  v6 = v4 * (1.0 - *(double *)(v3 + v5)) + v2 * *(double *)(v3 + v5);
  *(double *)(v3 + 104) = v6;
  v7 = *(unsigned __int8 *)(v3 + 120);
  v8 = v6 <= *(double *)(v3 + 40);
  *(_BYTE *)(v3 + 120) = v8;
  if (v7 != v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 32);
        v13 = "degraded";
        v14 = *(unsigned __int8 *)(a1 + 40);
        if (!*(_BYTE *)(v12 + 120))
          v13 = "recovered";
        v15 = *(_QWORD *)(v12 + 104);
        v16 = 136316418;
        v17 = v10;
        v18 = 2080;
        v19 = "VCNetworkConditionMonitor_SetWiFiChannelQualityScore_block_invoke";
        v20 = 1024;
        v21 = 224;
        v22 = 2080;
        v23 = v13;
        v24 = 1024;
        v25 = v14;
        v26 = 2048;
        v27 = v15;
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d NetworkConditionMonitor: LocalWiFiQuality=%s. latestWiFiChannelQualityScore=%d WifiChannelQualityScoreEnvelopeValue=%.2f", (uint8_t *)&v16, 0x36u);
      }
    }
    _VCNetworkConditionMonitor_RunLocalNetworkDetectionAlgorithm(*(_BYTE **)(a1 + 32));
  }
}

void __VCNetworkConditionMonitor_SetCellSignalStrengthBars_block_invoke(uint64_t a1, double a2)
{
  double v2;
  uint64_t v3;
  double v4;
  uint64_t v5;
  double v6;
  unint64_t v7;
  double v8;
  double v9;
  int v10;
  int v11;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  const char *v16;
  int v17;
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  LOBYTE(a2) = *(_BYTE *)(a1 + 40);
  v2 = (double)*(unint64_t *)&a2;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(double *)(v3 + 112);
  v5 = 88;
  if (v4 < v2)
    v5 = 96;
  v6 = *(double *)(v3 + v5);
  *(double *)&v7 = v4 * (1.0 - v6);
  v8 = *(double *)&v7 + v2 * v6;
  *(double *)(v3 + 112) = v8;
  LOBYTE(v7) = *(_BYTE *)(a1 + 41);
  v9 = (double)v7;
  *(double *)(v3 + 56) = v9;
  v10 = *(unsigned __int8 *)(v3 + 121);
  v11 = v8 <= *(double *)(v3 + 64) + *(double *)(v3 + 48) * v9;
  *(_BYTE *)(v3 + 121) = v11;
  if (v10 != v11)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(_QWORD *)(a1 + 32);
        v16 = "degraded";
        v17 = *(unsigned __int8 *)(a1 + 40);
        if (!*(_BYTE *)(v15 + 121))
          v16 = "recovered";
        v18 = *(unsigned __int8 *)(a1 + 41);
        v19 = *(_QWORD *)(v15 + 112);
        v20 = 136316674;
        v21 = v13;
        v22 = 2080;
        v23 = "VCNetworkConditionMonitor_SetCellSignalStrengthBars_block_invoke";
        v24 = 1024;
        v25 = 247;
        v26 = 2080;
        v27 = v16;
        v28 = 1024;
        v29 = v17;
        v30 = 1024;
        v31 = v18;
        v32 = 2048;
        v33 = v19;
        _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d NetworkConditionMonitor: LocalCellQuality=%s. latestCellSignalStrengthBars=%d latestMaxCellSignalStrengthBars=%d cellSignalStrengthBarsEnvelopeValue=%.2f", (uint8_t *)&v20, 0x3Cu);
      }
    }
    _VCNetworkConditionMonitor_RunLocalNetworkDetectionAlgorithm(*(_BYTE **)(a1 + 32));
  }
}

void __VCNetworkConditionMonitor_SetRemoteNetworkQuality_block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v4;
  NSObject *v5;
  int v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 125) != v2)
  {
    *(_BYTE *)(v1 + 125) = v2;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 125);
        v7 = 136316162;
        v8 = v4;
        v9 = 2080;
        v10 = "VCNetworkConditionMonitor_SetRemoteNetworkQuality_block_invoke";
        v11 = 1024;
        v12 = 263;
        v13 = 1024;
        v14 = 263;
        v15 = 1024;
        v16 = v6;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/ConnectionManager/VCNetworkConditionMonitor.c:%d: NetworkConditionMonitor: isRemoteNetworkQualityBad=%d", (uint8_t *)&v7, 0x28u);
      }
    }
    _VCNetworkConditionMonitor_triggerNetworkConditionCallback(*(_QWORD *)(a1 + 32), 0);
  }
}

void __VCNetworkConditionMonitor_SetIsLocalActiveOnCellular_block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v4;
  NSObject *v5;
  int v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 126) != v2)
  {
    *(_BYTE *)(v1 + 126) = v2;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 126);
        v7 = 136316162;
        v8 = v4;
        v9 = 2080;
        v10 = "VCNetworkConditionMonitor_SetIsLocalActiveOnCellular_block_invoke";
        v11 = 1024;
        v12 = 277;
        v13 = 1024;
        v14 = 277;
        v15 = 1024;
        v16 = v6;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/ConnectionManager/VCNetworkConditionMonitor.c:%d: NetworkConditionMonitor: isLocalActiveOnCellular=%d", (uint8_t *)&v7, 0x28u);
      }
    }
    _VCNetworkConditionMonitor_RunLocalNetworkDetectionAlgorithm(*(_BYTE **)(a1 + 32));
  }
}

@end
