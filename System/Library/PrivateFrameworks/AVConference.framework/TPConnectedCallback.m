@implementation TPConnectedCallback

void __TPConnectedCallback_block_invoke(uint64_t a1)
{
  uint64_t v2;
  int ErrorLogLevelForModule;
  os_log_t *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  int v28;
  int v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  NSObject *v35;
  int *v36;
  int v37;
  uint64_t v38;
  NSObject *v39;
  _DWORD *v40;
  int v41;
  int v42;
  uint64_t v43;
  __int16 CellularMTU;
  void (*v45)(_QWORD, _QWORD, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD);
  int v46;
  uint64_t v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  _BYTE v53[10];
  __int16 v54;
  int v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v2 = CheckInHandleDebug();
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v2)
  {
    v4 = (os_log_t *)MEMORY[0x1E0CF2758];
    if (ErrorLogLevelForModule >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 40);
        v8 = *(_DWORD *)(a1 + 64);
        v9 = *(_DWORD *)(a1 + 68);
        v46 = 136316418;
        v47 = v5;
        v48 = 2080;
        v49 = "TPConnectedCallback_block_invoke";
        v50 = 1024;
        v51 = 4511;
        v52 = 1024;
        *(_DWORD *)v53 = v7;
        *(_WORD *)&v53[4] = 1024;
        *(_DWORD *)&v53[6] = v8;
        v54 = 1024;
        v55 = v9;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "SIP [%s] %s:%d TPConnectedCallback: theCCResult == %08X, ifDidRecvPacket = %d fUseRelay = %d ...", (uint8_t *)&v46, 0x2Eu);
      }
    }
    if (*(_QWORD *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
        {
          v12 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 4);
          v46 = 136315906;
          v47 = v10;
          v48 = 2080;
          v49 = "TPConnectedCallback_block_invoke";
          v50 = 1024;
          v51 = 4515;
          v52 = 1024;
          *(_DWORD *)v53 = v12;
          _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "SIP [%s] %s:%d TPConnectedCallback:: result#%d", (uint8_t *)&v46, 0x22u);
        }
      }
      IPPORTToStringWithSize();
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
        {
          v46 = 136315906;
          v47 = v13;
          v48 = 2080;
          v49 = "TPConnectedCallback_block_invoke";
          v50 = 1024;
          v51 = 4517;
          v52 = 2080;
          *(_QWORD *)v53 = &g_SIPICERetryParams_block_invoke_ip;
          _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, "SIP [%s] %s:%d TPConnectedCallback:: local = %s", (uint8_t *)&v46, 0x26u);
        }
      }
      IPPORTToStringWithSize();
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
        {
          v46 = 136315906;
          v47 = v15;
          v48 = 2080;
          v49 = "TPConnectedCallback_block_invoke";
          v50 = 1024;
          v51 = 4519;
          v52 = 2080;
          *(_QWORD *)v53 = &g_SIPICERetryParams_block_invoke_ip;
          _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, "SIP [%s] %s:%d TPConnectedCallback:: remote = %s", (uint8_t *)&v46, 0x26u);
        }
      }
      IPPORTToStringWithSize();
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
        {
          v46 = 136315906;
          v47 = v17;
          v48 = 2080;
          v49 = "TPConnectedCallback_block_invoke";
          v50 = 1024;
          v51 = 4521;
          v52 = 2080;
          *(_QWORD *)v53 = &g_SIPICERetryParams_block_invoke_ip;
          _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, "SIP [%s] %s:%d TPConnectedCallback:: src = %s", (uint8_t *)&v46, 0x26u);
        }
      }
      IPPORTToStringWithSize();
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v19 = VRTraceErrorLogLevelToCSTR();
        v20 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
        {
          v46 = 136315906;
          v47 = v19;
          v48 = 2080;
          v49 = "TPConnectedCallback_block_invoke";
          v50 = 1024;
          v51 = 4523;
          v52 = 2080;
          *(_QWORD *)v53 = &g_SIPICERetryParams_block_invoke_ip;
          _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, "SIP [%s] %s:%d TPConnectedCallback:: dst = %s", (uint8_t *)&v46, 0x26u);
        }
      }
      IPPORTToStringWithSize();
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v21 = VRTraceErrorLogLevelToCSTR();
        v22 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
        {
          v46 = 136315906;
          v47 = v21;
          v48 = 2080;
          v49 = "TPConnectedCallback_block_invoke";
          v50 = 1024;
          v51 = 4525;
          v52 = 2080;
          *(_QWORD *)v53 = &g_SIPICERetryParams_block_invoke_ip;
          _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, "SIP [%s] %s:%d TPConnectedCallback:: remoteSrc = %s", (uint8_t *)&v46, 0x26u);
        }
      }
      IPPORTToStringWithSize();
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v23 = VRTraceErrorLogLevelToCSTR();
        v24 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
        {
          v46 = 136315906;
          v47 = v23;
          v48 = 2080;
          v49 = "TPConnectedCallback_block_invoke";
          v50 = 1024;
          v51 = 4527;
          v52 = 2080;
          *(_QWORD *)v53 = &g_SIPICERetryParams_block_invoke_ip;
          _os_log_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEFAULT, "SIP [%s] %s:%d TPConnectedCallback:: relay ext = %s", (uint8_t *)&v46, 0x26u);
        }
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v25 = VRTraceErrorLogLevelToCSTR();
        v26 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
        {
          v27 = *(_QWORD *)(a1 + 40);
          v28 = *(_DWORD *)(v27 + 20);
          v29 = *(unsigned __int16 *)(v27 + 24);
          LODWORD(v27) = *(unsigned __int16 *)(v27 + 26);
          v46 = 136316418;
          v47 = v25;
          v48 = 2080;
          v49 = "TPConnectedCallback_block_invoke";
          v50 = 1024;
          v51 = 4529;
          v52 = 1024;
          *(_DWORD *)v53 = v28;
          *(_WORD *)&v53[4] = 1024;
          *(_DWORD *)&v53[6] = v29;
          v54 = 1024;
          v55 = v27;
          _os_log_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_DEFAULT, "SIP [%s] %s:%d TPConnectedCallback:: bIfRelay = %d wRelayServType = %d wChannelNumber = %04x", (uint8_t *)&v46, 0x2Eu);
        }
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v30 = VRTraceErrorLogLevelToCSTR();
        v31 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
        {
          v32 = *(_QWORD *)(a1 + 40);
          v33 = *(_DWORD *)(v32 + 280);
          LODWORD(v32) = *(_DWORD *)(v32 + 284);
          v46 = 136316162;
          v47 = v30;
          v48 = 2080;
          v49 = "TPConnectedCallback_block_invoke";
          v50 = 1024;
          v51 = 4531;
          v52 = 1024;
          *(_DWORD *)v53 = v33;
          *(_WORD *)&v53[4] = 1024;
          *(_DWORD *)&v53[6] = v32;
          _os_log_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_DEFAULT, "SIP [%s] %s:%d TPConnectedCallback:: cell_tech (local:%d, remote:%d)", (uint8_t *)&v46, 0x28u);
        }
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v34 = VRTraceErrorLogLevelToCSTR();
        v35 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
        {
          v36 = *(int **)(a1 + 40);
          v37 = *v36;
          LODWORD(v36) = v36[3];
          v46 = 136316162;
          v47 = v34;
          v48 = 2080;
          v49 = "TPConnectedCallback_block_invoke";
          v50 = 1024;
          v51 = 4533;
          v52 = 1024;
          *(_DWORD *)v53 = v37;
          *(_WORD *)&v53[4] = 1024;
          *(_DWORD *)&v53[6] = (_DWORD)v36;
          _os_log_impl(&dword_1D8A54000, v35, OS_LOG_TYPE_DEFAULT, "SIP [%s] %s:%d TPConnectedCallback:: dwCallID = %08X iRemoteCallID = %08X", (uint8_t *)&v46, 0x28u);
        }
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v38 = VRTraceErrorLogLevelToCSTR();
        v39 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
        {
          v40 = *(_DWORD **)(a1 + 40);
          v41 = v40[73];
          v42 = v40[74];
          LODWORD(v40) = v40[75];
          v46 = 136316418;
          v47 = v38;
          v48 = 2080;
          v49 = "TPConnectedCallback_block_invoke";
          v50 = 1024;
          v51 = 4535;
          v52 = 1024;
          *(_DWORD *)v53 = v41;
          *(_WORD *)&v53[4] = 1024;
          *(_DWORD *)&v53[6] = v42;
          v54 = 1024;
          v55 = (int)v40;
          _os_log_impl(&dword_1D8A54000, v39, OS_LOG_TYPE_DEFAULT, "SIP [%s] %s:%d TPConnectedCallback:: upgrade = %d primary = %d, replace = %d", (uint8_t *)&v46, 0x2Eu);
        }
      }
      v43 = *(_QWORD *)(a1 + 40);
      *(_WORD *)(v43 + 288) = 0;
      if ((*(_BYTE *)(v43 + 28) & 4) != 0)
      {
        CellularMTU = GetCellularMTU(v2, 0);
        v43 = *(_QWORD *)(a1 + 40);
        *(_WORD *)(v43 + 288) = CellularMTU;
      }
    }
    else
    {
      v43 = 0;
    }
    v45 = *(void (**)(_QWORD, _QWORD, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(v2 + 34336);
    if (v45)
    {
      v45(*(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 72), v43, *(unsigned int *)(a1 + 64), *(unsigned int *)(a1 + 68), *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 76));
      v43 = *(_QWORD *)(a1 + 40);
    }
    if (v43)
      free((void *)v43);
    CheckOutHandleDebug();
  }
  else if (ErrorLogLevelForModule >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __TPConnectedCallback_block_invoke_cold_1();
  }
}

void __TPConnectedCallback_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v0, v1, "SIP [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/SIP/Transport.c:%d: TPConnectedCallback: CheckInHandle failed in the dispatched block", v2);
  OUTLINED_FUNCTION_3();
}

@end
