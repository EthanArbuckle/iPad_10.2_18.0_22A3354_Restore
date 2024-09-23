@implementation VCNWConnectionMonitor

void __VCNWConnectionMonitor_Create_block_invoke(uint64_t a1)
{
  NSObject *v2;
  _DWORD *v3;
  _DWORD *v4;
  uint64_t interface_status_monitor;
  int AppIntegerValue;
  Boolean keyExistsAndHasValidFormat;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = VTP_NWConnectionQueue();
  dispatch_assert_queue_V2(v2);
  v3 = malloc_type_calloc(1uLL, 0x5E68uLL, 0x10A0040E7F0E380uLL);
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __VCNWConnectionMonitor_Create_block_invoke_cold_1();
    }
    goto LABEL_12;
  }
  v4 = v3;
  interface_status_monitor = nw_connection_create_interface_status_monitor();
  *(_QWORD *)v4 = interface_status_monitor;
  if (!interface_status_monitor)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __VCNWConnectionMonitor_Create_block_invoke_cold_2();
    }
    free(v4);
LABEL_12:
    v4 = 0;
    goto LABEL_13;
  }
  v4[6041] = 5000;
  keyExistsAndHasValidFormat = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("ReportingFrequency"), CFSTR("com.apple.VideoConference"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v4[6041] = 1000 * AppIntegerValue;
LABEL_13:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
}

void __VCNWConnectionMonitor_CreateWithInterfaceName_block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  const char *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int ErrorLogLevelForModule;
  os_log_t *v9;
  uint64_t v10;
  NSObject *v11;
  FILE **v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *secure_udp;
  NSObject *v20;
  const char *v21;
  NSObject *host;
  nw_connection_t v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  char v29;
  uint8_t v30[4];
  uint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  const char *v39;
  char __str[8];
  _QWORD v41[3];
  _BYTE buf[24];
  __int128 v43;
  const char *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 64);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(const char **)(a1 + 48);
  v5 = *(NSObject **)(a1 + 56);
  v6 = VTP_NWConnectionQueue();
  dispatch_assert_queue_V2(v6);
  v7 = malloc_type_calloc(1uLL, 0x5E68uLL, 0x10A0040E7F0E380uLL);
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v7)
  {
    v9 = (os_log_t *)MEMORY[0x1E0CF2758];
    if (ErrorLogLevelForModule >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = v10;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "_VCNWConnectionMonitor_DispatchedCreateWithInterfaceName";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v43) = 106;
        WORD2(v43) = 2048;
        *(_QWORD *)((char *)&v43 + 6) = v7;
        HIWORD(v43) = 2080;
        v44 = v4;
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Creating monitor=%p with interfaceName=%s", buf, 0x30u);
      }
    }
    memset(v41, 170, 22);
    *(_QWORD *)__str = 0xAAAAAAAAAAAAAAAALL;
    snprintf(__str, 0x1EuLL, "%p-%s", v7, v4);
    v12 = LogDump_OpenLog((uint64_t)__str, (uint64_t)"VCNWConnectionMonitor", (uint64_t)".nwmonitordump", (char)", 9, (char)");
    *((_QWORD *)v7 + 2) = v12;
    VRLogfilePrintSync(v12, "STime\tTimestamp\tVersion\tDirection\tByteCount\tQSize1\tQSize2\tDelay\tThroughput\tTxRate\tRateTrend\tFrequencyBand\tIntermittentState\tIntermittentPeriod\tSingleOutagePeriod\tBtCoex\tRadioCoex\tScoreDelayTx\tScoreDelayRx\tScoreLossTx\tScoreLossRx\tScoreChannel\tOffChannelRatio\tWlanDutyCycle\tWifiObservedTxBitrate(BE)\tWifiObservedTxBitrate(BK)\tWifiObservedTxBitrate(VI)\tWifiObservedTxBitrate(VO)\tWifiObservedTxBitrate(LLW0)\tWifiObservedTxBitrate(LLW1)\n", v13, v14, v15, v16, v17, v18, v29);
    secure_udp = nw_parameters_create_secure_udp((nw_parameters_configure_protocol_block_t)*MEMORY[0x1E0CCED20], (nw_parameters_configure_protocol_block_t)*MEMORY[0x1E0CCED18]);
    VTP_NWConnectionContext();
    nw_parameters_set_context();
    v20 = nw_interface_create_with_name();
    nw_parameters_require_interface(secure_udp, v20);
    if (v2)
      v21 = "1234::1234";
    else
      v21 = "120.0.0.1";
    host = nw_endpoint_create_host(v21, "1234");
    v23 = nw_connection_create(host, secure_udp);
    *((_QWORD *)v7 + 1) = v23;
    if (v5)
    {
      *((_QWORD *)v7 + 3017) = v5;
      dispatch_retain(v5);
      v24 = *((_QWORD *)v7 + 1);
    }
    else
    {
      v24 = v23;
    }
    v25 = VTP_NWConnectionQueue();
    nw_connection_set_queue(v24, v25);
    v26 = *((_QWORD *)v7 + 1);
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 0x40000000;
    *(_QWORD *)&buf[16] = ___VCNWConnectionMonitor_DispatchedCreateWithInterfaceName_block_invoke;
    *(_QWORD *)&v43 = &unk_1E9E53990;
    *((_QWORD *)&v43 + 1) = v3;
    v44 = (const char *)v7;
    nw_connection_set_state_changed_handler(v26, buf);
    nw_connection_start(*((nw_connection_t *)v7 + 1));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v27 = VRTraceErrorLogLevelToCSTR();
      v28 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v30 = 136316162;
        v31 = v27;
        v32 = 2080;
        v33 = "_VCNWConnectionMonitor_DispatchedCreateWithInterfaceName";
        v34 = 1024;
        v35 = 161;
        v36 = 2048;
        v37 = v7;
        v38 = 2080;
        v39 = v4;
        _os_log_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Starting NWConnection for monitor=%p with interfaceName=%s", v30, 0x30u);
      }
    }
    nw_release(v20);
    nw_release(secure_udp);
    nw_release(host);
  }
  else if (ErrorLogLevelForModule >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __VCNWConnectionMonitor_CreateWithInterfaceName_block_invoke_cold_1();
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v7;
}

void __VCNWConnectionMonitor_Destroy_block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = VTP_NWConnectionQueue();
  dispatch_assert_queue_V2(v2);
  if (*(_BYTE *)(v1 + 24128))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __VCNWConnectionMonitor_Destroy_block_invoke_cold_1();
    }
  }
  else
  {
    *(_BYTE *)(v1 + 24128) = 1;
    if (*(_QWORD *)v1)
      nw_interface_status_monitor_cancel();
    v3 = *(NSObject **)(v1 + 8);
    if (v3)
      nw_connection_cancel(v3);
    v4 = *(_QWORD *)(v1 + 16);
    if (v4)
    {
      LogDump_CloseLog(v4);
      *(_QWORD *)(v1 + 16) = 0;
    }
  }
}

uint64_t __VCNWConnectionMonitor_SetNotificationHandler_block_invoke()
{
  NSObject *v0;

  v0 = VTP_NWConnectionQueue();
  dispatch_assert_queue_V2(v0);
  VTP_NWConnectionQueue();
  return nw_interface_status_monitor_set_update_handler();
}

uint64_t __VCNWConnectionMonitor_SetPacketEventHandler_block_invoke()
{
  NSObject *v0;

  v0 = VTP_NWConnectionQueue();
  dispatch_assert_queue_V2(v0);
  VTP_NWConnectionQueue();
  return nw_interface_status_monitor_set_packet_event_handler();
}

uint64_t __VCNWConnectionMonitor_SetStatisticsHandler_block_invoke()
{
  NSObject *v0;

  v0 = VTP_NWConnectionQueue();
  dispatch_assert_queue_V2(v0);
  VTP_NWConnectionQueue();
  return nw_interface_status_monitor_set_update_handler();
}

void ___VCNWConnectionMonitor_DispatchedCreateWithInterfaceName_block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t **v6;
  uint64_t *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  switch(a2)
  {
    case 5:
      v7 = (uint64_t *)(a1 + 40);
      if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v8 = VRTraceErrorLogLevelToCSTR();
          v9 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v10 = *v7;
            v11 = *(_QWORD *)(*v7 + 8);
            *(_DWORD *)buf = 136316162;
            v19 = v8;
            v20 = 2080;
            v21 = "_VCNWConnectionMonitor_DispatchedCreateWithInterfaceName_block_invoke";
            v22 = 1024;
            v23 = 150;
            v24 = 2048;
            v25 = v10;
            v26 = 2048;
            v27 = v11;
            _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d NWConnection state cancelled! monitor=%p and monitor->NWConnection=%p is released.", buf, 0x30u);
          }
        }
        nw_release(*(void **)(*v7 + 8));
        *(_QWORD *)(*v7 + 8) = 0;
      }
      _VCNWConnectionMonitor_CheckAndReleaseNWMonitor((_QWORD **)v7);
      break;
    case 4:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          ___VCNWConnectionMonitor_DispatchedCreateWithInterfaceName_block_invoke_cold_3(v12, a1, v13);
      }
      break;
    case 3:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v3 = VRTraceErrorLogLevelToCSTR();
        v4 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v5 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 136315906;
          v19 = v3;
          v20 = 2080;
          v21 = "_VCNWConnectionMonitor_DispatchedCreateWithInterfaceName_block_invoke";
          v22 = 1024;
          v23 = 131;
          v24 = 2048;
          v25 = v5;
          _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d NWConnection state ready and setting status monitor! monitor=%p", buf, 0x26u);
        }
      }
      v6 = (uint64_t **)(a1 + 40);
      if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 24128))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            ___VCNWConnectionMonitor_DispatchedCreateWithInterfaceName_block_invoke_cold_2();
        }
      }
      else
      {
        **v6 = nw_connection_create_interface_status_monitor();
        v14 = *v6;
        if (**v6)
        {
          v15 = *(_QWORD *)(a1 + 32);
          if (v15 && !*((_BYTE *)v14 + 24128))
          {
            v16 = v14[3017];
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 0x40000000;
            block[2] = ___VCNWConnectionMonitor_DispatchedCreateWithInterfaceName_block_invoke_18;
            block[3] = &unk_1E9E53968;
            block[4] = v15;
            dispatch_async(v16, block);
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            ___VCNWConnectionMonitor_DispatchedCreateWithInterfaceName_block_invoke_cold_1();
        }
      }
      break;
  }
}

uint64_t ___VCNWConnectionMonitor_DispatchedCreateWithInterfaceName_block_invoke_18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void ___VCNWConnectionMonitor_DispatchedSetNotificationHandler_block_invoke(uint64_t a1, __int128 *a2, uint64_t a3, int a4)
{
  NSObject *v8;
  uint64_t v9;
  void ***v10;
  uint64_t v11;
  NSObject *v12;
  void **v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  void **v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  _BYTE v30[20];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = VTP_NWConnectionQueue();
  dispatch_assert_queue_V2(v8);
  v10 = (void ***)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
  {
    if (a4)
    {
      if (a4 == 89)
      {
        if (*(_QWORD *)v9)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v11 = VRTraceErrorLogLevelToCSTR();
            v12 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              v13 = *v10;
              v14 = **v10;
              v23 = 136316162;
              v24 = v11;
              v25 = 2080;
              v26 = "_VCNWConnectionMonitor_DispatchedSetNotificationHandler_block_invoke";
              v27 = 1024;
              v28 = 246;
              v29 = 2048;
              *(_QWORD *)v30 = v14;
              *(_WORD *)&v30[8] = 2048;
              *(_QWORD *)&v30[10] = v13;
              _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d monitor->nwMonitor=%p is released, monitor=%p", (uint8_t *)&v23, 0x30u);
            }
          }
          nw_release(**v10);
          **v10 = 0;
        }
        _VCNWConnectionMonitor_CheckAndReleaseNWMonitor((_QWORD **)(a1 + 32));
        return;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        return;
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        return;
      v22 = *v10;
      v23 = 136316162;
      v24 = v15;
      v25 = 2080;
      v26 = "_VCNWConnectionMonitor_DispatchedSetNotificationHandler_block_invoke";
      v27 = 1024;
      v28 = 252;
      v29 = 1024;
      *(_DWORD *)v30 = a4;
      *(_WORD *)&v30[4] = 2048;
      *(_QWORD *)&v30[6] = v22;
      v19 = " [%s] %s:%d NWConnection notification returns error %d, monitor=%p";
      v20 = v16;
      v21 = 44;
LABEL_27:
      _os_log_error_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v23, v21);
      return;
    }
    if (*(_BYTE *)(v9 + 24128))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          ___VCNWConnectionMonitor_DispatchedSetNotificationHandler_block_invoke_cold_2();
      }
    }
    else
    {
      if (a2 && a3 == 96)
      {
        _VCNWConnectionMonitor_DispatchedProcessInterfaceAdvisoryNotification(*(_QWORD *)(a1 + 40), *(void (**)(uint64_t, void *))(a1 + 48), a2);
        return;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v23 = 136316418;
          v24 = v17;
          v25 = 2080;
          v26 = "_VCNWConnectionMonitor_DispatchedSetNotificationHandler_block_invoke";
          v27 = 1024;
          v28 = 262;
          v29 = 1024;
          *(_DWORD *)v30 = 96;
          *(_WORD *)&v30[4] = 1024;
          *(_DWORD *)&v30[6] = a3;
          *(_WORD *)&v30[10] = 2048;
          *(_QWORD *)&v30[12] = a2;
          v19 = " [%s] %s:%d NWConnection notification size mismatch. (expected size: %u, actual size: %u) status_data: %p";
          v20 = v18;
          v21 = 50;
          goto LABEL_27;
        }
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      ___VCNWConnectionMonitor_DispatchedSetNotificationHandler_block_invoke_cold_1();
  }
}

void ___VCNWConnectionMonitor_DispatchedSetPacketEventHandler_block_invoke(_QWORD *a1, int a2, uint64_t a3, unint64_t a4, int a5)
{
  NSObject *v10;
  unint64_t v11;
  unsigned int v12;
  uint64_t v13;
  _OWORD *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD block[7];
  _BYTE buf[24];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v10 = VTP_NWConnectionQueue();
  dispatch_assert_queue_V2(v10);
  if (a5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        ___VCNWConnectionMonitor_DispatchedSetPacketEventHandler_block_invoke_cold_2();
    }
    return;
  }
  if (a2 == 1)
  {
    if (!a4)
      return;
    v11 = 0;
    v12 = 1;
    v13 = MEMORY[0x1E0C809B0];
    while (1)
    {
      if (a1[4])
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2000000000;
        v21[0] = 0xAAAAAAAAAAAAAAAALL;
        v21[0] = malloc_type_calloc(1uLL, 0x10uLL, 0x1000040451B5BE8uLL);
        v14 = *(_OWORD **)(*(_QWORD *)&buf[8] + 24);
        if (!v14)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              ___VCNWConnectionMonitor_DispatchedSetPacketEventHandler_block_invoke_cold_1();
          }
          _Block_object_dispose(buf, 8);
          return;
        }
        *v14 = *(_OWORD *)(a3 + 16 * v11);
        block[0] = v13;
        block[1] = 0x40000000;
        block[2] = ___VCNWConnectionMonitor_DispatchedSetPacketEventHandler_block_invoke_25;
        block[3] = &unk_1E9E539D8;
        v15 = a1[5];
        v16 = a1[6];
        block[5] = a1[4];
        block[6] = v16;
        block[4] = buf;
        dispatch_async(v15, block);
        _Block_object_dispose(buf, 8);
      }
      v11 = v12++;
      if (v11 >= a4)
        return;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "_VCNWConnectionMonitor_DispatchedSetPacketEventHandler_block_invoke_2";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v21[0]) = 308;
      WORD2(v21[0]) = 1024;
      *(_DWORD *)((char *)v21 + 6) = a2;
      _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Receive other unknown event type %d", buf, 0x22u);
    }
  }
}

void ___VCNWConnectionMonitor_DispatchedSetPacketEventHandler_block_invoke_25(uint64_t a1)
{
  (*(void (**)(_QWORD, _QWORD))(a1 + 40))(*(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  free(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
}

void ___VCNWConnectionMonitor_DispatchedSetStatisticsHandler_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  NSObject *v8;
  uint64_t v9;
  void ***v10;
  uint64_t v11;
  NSObject *v12;
  void **v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  void **v25;
  _QWORD block[6];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  uint8_t buf[80];
  __int128 v38;
  _OWORD v39[2];
  __int128 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = VTP_NWConnectionQueue();
  dispatch_assert_queue_V2(v8);
  v10 = (void ***)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
  {
    if (a4)
    {
      if (a4 == 89)
      {
        if (*(_QWORD *)v9)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v11 = VRTraceErrorLogLevelToCSTR();
            v12 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              v13 = *v10;
              v14 = **v10;
              *(_DWORD *)buf = 136316162;
              *(_QWORD *)&buf[4] = v11;
              *(_WORD *)&buf[12] = 2080;
              *(_QWORD *)&buf[14] = "_VCNWConnectionMonitor_DispatchedSetStatisticsHandler_block_invoke";
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = 503;
              *(_WORD *)&buf[28] = 2048;
              *(_QWORD *)&buf[30] = v14;
              *(_WORD *)&buf[38] = 2048;
              *(_QWORD *)&buf[40] = v13;
              _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d monitor->nwMonitor=%p is released, monitor=%p", buf, 0x30u);
            }
          }
          nw_release(**v10);
          **v10 = 0;
        }
        _VCNWConnectionMonitor_CheckAndReleaseNWMonitor((_QWORD **)(a1 + 32));
        return;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        return;
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        return;
      v25 = *v10;
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "_VCNWConnectionMonitor_DispatchedSetStatisticsHandler_block_invoke";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 509;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = a4;
      *(_WORD *)&buf[34] = 2048;
      *(_QWORD *)&buf[36] = v25;
      v22 = " [%s] %s:%d NWConnection notification returns error %d, monitor=%p";
      v23 = v16;
      v24 = 44;
LABEL_29:
      _os_log_error_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_ERROR, v22, buf, v24);
      return;
    }
    if (*(_BYTE *)(v9 + 24128))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          ___VCNWConnectionMonitor_DispatchedSetStatisticsHandler_block_invoke_cold_2();
      }
    }
    else
    {
      if (!a2 || a3 != 96)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          return;
        v20 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          return;
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = v20;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "_VCNWConnectionMonitor_DispatchedSetStatisticsHandler_block_invoke";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 519;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = 96;
        *(_WORD *)&buf[34] = 1024;
        *(_DWORD *)&buf[36] = a3;
        *(_WORD *)&buf[40] = 2048;
        *(_QWORD *)&buf[42] = a2;
        v22 = " [%s] %s:%d NWConnection notification size mismatch. (expected size: %u, actual size: %u) status_data: %p";
        v23 = v21;
        v24 = 50;
        goto LABEL_29;
      }
      memset(v39, 170, sizeof(v39));
      v40 = xmmword_1D910ADB0;
      v41 = -1;
      v38 = unk_1D910AD80;
      memset(buf, 170, sizeof(buf));
      _VCNWConnectionMonitor_ProcessNotification(v9, a2, (uint64_t)buf);
      v17 = *(_QWORD *)(a1 + 40);
      if (v17 && *(_QWORD *)&buf[8])
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 0x40000000;
        block[2] = ___VCNWConnectionMonitor_DispatchedSetStatisticsHandler_block_invoke_30;
        block[3] = &__block_descriptor_tmp_31;
        v18 = *(NSObject **)(a1 + 48);
        v19 = *(_QWORD *)(a1 + 56);
        block[4] = v17;
        block[5] = v19;
        v33 = v39[0];
        v34 = v39[1];
        v35 = v40;
        v36 = v41;
        v29 = *(_OWORD *)&buf[32];
        v30 = *(_OWORD *)&buf[48];
        v31 = *(_OWORD *)&buf[64];
        v32 = v38;
        v27 = *(_OWORD *)buf;
        v28 = *(_OWORD *)&buf[16];
        dispatch_async(v18, block);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      ___VCNWConnectionMonitor_DispatchedSetStatisticsHandler_block_invoke_cold_1();
  }
}

uint64_t ___VCNWConnectionMonitor_DispatchedSetStatisticsHandler_block_invoke_30(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, _OWORD *);
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v8[9];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(uint64_t (**)(uint64_t, _OWORD *))(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(_OWORD *)(a1 + 160);
  v8[6] = *(_OWORD *)(a1 + 144);
  v8[7] = v3;
  v8[8] = *(_OWORD *)(a1 + 176);
  v9 = *(_QWORD *)(a1 + 192);
  v4 = *(_OWORD *)(a1 + 96);
  v8[2] = *(_OWORD *)(a1 + 80);
  v8[3] = v4;
  v5 = *(_OWORD *)(a1 + 128);
  v8[4] = *(_OWORD *)(a1 + 112);
  v8[5] = v5;
  v6 = *(_OWORD *)(a1 + 64);
  v8[0] = *(_OWORD *)(a1 + 48);
  v8[1] = v6;
  return v2(v1, v8);
}

void __VCNWConnectionMonitor_Create_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate memory for monitor", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __VCNWConnectionMonitor_Create_block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  const void *v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "_VCNWConnectionMonitor_DispatchedCreate";
  LODWORD(v4) = 78;
  WORD2(v4) = 2048;
  HIWORD(v4) = v0;
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create monitor->nwMonitor for monitor=%p!", v2, *(const char **)v3, (unint64_t)"_VCNWConnectionMonitor_DispatchedCreate" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

void __VCNWConnectionMonitor_CreateWithInterfaceName_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate memory for monitor", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __VCNWConnectionMonitor_Destroy_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Monitor is already destroyed!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void ___VCNWConnectionMonitor_DispatchedCreateWithInterfaceName_block_invoke_cold_1()
{
  int v0;
  uint64_t v1;
  os_log_t v2;
  const char *v3;
  const char *v4;
  int v5;
  const void *v6;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  LODWORD(v6) = 0x8000000;
  HIDWORD(v6) = v0;
  OUTLINED_FUNCTION_5_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCNWConnectionMonitor.c:%d: Failed to create status monitor after state ready! monitor=%p", v3, v4, v5, 138, v6);
}

void ___VCNWConnectionMonitor_DispatchedCreateWithInterfaceName_block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const void *v5;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d NWConnection state ready but monitor=%p is already destroyed!", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void ___VCNWConnectionMonitor_DispatchedCreateWithInterfaceName_block_invoke_cold_3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[22];
  __int128 v4;

  *(_DWORD *)v3 = 136316162;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(_QWORD *)&v3[14] = "_VCNWConnectionMonitor_DispatchedCreateWithInterfaceName_block_invoke_2";
  LODWORD(v4) = 146;
  WORD2(v4) = 2048;
  *(_QWORD *)((char *)&v4 + 6) = *(_QWORD *)(a2 + 40);
  OUTLINED_FUNCTION_5_0(&dword_1D8A54000, a2, a3, " [%s] %s:%d NWConnection state failed, monitor=%p, state=%d", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"_VCNWConnectionMonitor_DispatchedCreateWithInterfaceName_block_invoke_2" >> 16, (const void *)v4, *(_QWORD *)((char *)&v4 + 6) >> 16);
}

void ___VCNWConnectionMonitor_DispatchedSetNotificationHandler_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d monitor is null!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void ___VCNWConnectionMonitor_DispatchedSetNotificationHandler_block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const void *v5;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d monitor is already destroyed! monitor=%p", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void ___VCNWConnectionMonitor_DispatchedSetPacketEventHandler_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate memory for packetEvent!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void ___VCNWConnectionMonitor_DispatchedSetPacketEventHandler_block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "_VCNWConnectionMonitor_DispatchedSetPacketEventHandler_block_invoke";
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d NWConnection packet event returns error %d", v2, *(const char **)v3, (unint64_t)"_VCNWConnectionMonitor_DispatchedSetPacketEventHandler_block_invoke" >> 16, 284);
  OUTLINED_FUNCTION_3();
}

void ___VCNWConnectionMonitor_DispatchedSetStatisticsHandler_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d monitor is null!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void ___VCNWConnectionMonitor_DispatchedSetStatisticsHandler_block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const void *v5;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d monitor is already destroyed! monitor=%p", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

@end
