uint64_t ec_log()
{
  if (ec_log_onceToken != -1)
    dispatch_once(&ec_log_onceToken, &__block_literal_global);
  return ec_log___logger;
}

os_log_t __ec_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.multipeerconnectivity", "EventCallback");
  ec_log___logger = (uint64_t)result;
  return result;
}

uint64_t agps_log()
{
  if (agps_log_onceToken != -1)
    dispatch_once(&agps_log_onceToken, &__block_literal_global_6);
  return agps_log___logger;
}

os_log_t __agps_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.multipeerconnectivity", "AGPSession");
  agps_log___logger = (uint64_t)result;
  return result;
}

uint64_t gcks_log()
{
  if (gcks_log_onceToken != -1)
    dispatch_once(&gcks_log_onceToken, &__block_literal_global_8);
  return gcks_log___logger;
}

os_log_t __gcks_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.multipeerconnectivity", "GCKSession");
  gcks_log___logger = (uint64_t)result;
  return result;
}

uint64_t mcadvertiser_log()
{
  if (mcadvertiser_log_onceToken != -1)
    dispatch_once(&mcadvertiser_log_onceToken, &__block_literal_global_10);
  return mcadvertiser_log___logger;
}

os_log_t __mcadvertiser_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.multipeerconnectivity", "MCNearbyServiceAdvertiser");
  mcadvertiser_log___logger = (uint64_t)result;
  return result;
}

uint64_t mcadvertiser_ui_log()
{
  if (mcadvertiser_ui_log_onceToken != -1)
    dispatch_once(&mcadvertiser_ui_log_onceToken, &__block_literal_global_12);
  return mcadvertiser_ui_log___logger;
}

os_log_t __mcadvertiser_ui_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.multipeerconnectivity", "MCAdvertiserAssistant");
  mcadvertiser_ui_log___logger = (uint64_t)result;
  return result;
}

uint64_t mcbrowser_log()
{
  if (mcbrowser_log_onceToken != -1)
    dispatch_once(&mcbrowser_log_onceToken, &__block_literal_global_14);
  return mcbrowser_log___logger;
}

os_log_t __mcbrowser_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.multipeerconnectivity", "MCNearbyServiceBrowser");
  mcbrowser_log___logger = (uint64_t)result;
  return result;
}

uint64_t mcbrowser_ui_log()
{
  if (mcbrowser_ui_log_onceToken != -1)
    dispatch_once(&mcbrowser_ui_log_onceToken, &__block_literal_global_16);
  return mcbrowser_ui_log___logger;
}

os_log_t __mcbrowser_ui_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.multipeerconnectivity", "MCBrowserViewController");
  mcbrowser_ui_log___logger = (uint64_t)result;
  return result;
}

uint64_t mcdp_log()
{
  if (mcdp_log_onceToken != -1)
    dispatch_once(&mcdp_log_onceToken, &__block_literal_global_18);
  return mcdp_log___logger;
}

os_log_t __mcdp_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.multipeerconnectivity", "MCNearbyDiscoveryPeer");
  mcdp_log___logger = (uint64_t)result;
  return result;
}

uint64_t mcdpc_log()
{
  if (mcdpc_log_onceToken != -1)
    dispatch_once(&mcdpc_log_onceToken, &__block_literal_global_20);
  return mcdpc_log___logger;
}

os_log_t __mcdpc_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.multipeerconnectivity", "MCNearbyDiscoveryPeerConnection");
  mcdpc_log___logger = (uint64_t)result;
  return result;
}

uint64_t mcpid_log()
{
  if (mcpid_log_onceToken != -1)
    dispatch_once(&mcpid_log_onceToken, &__block_literal_global_22);
  return mcpid_log___logger;
}

os_log_t __mcpid_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.multipeerconnectivity", "MCPeerID");
  mcpid_log___logger = (uint64_t)result;
  return result;
}

uint64_t mcs_log()
{
  if (mcs_log_onceToken != -1)
    dispatch_once(&mcs_log_onceToken, &__block_literal_global_24);
  return mcs_log___logger;
}

os_log_t __mcs_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.multipeerconnectivity", "MCSession");
  mcs_log___logger = (uint64_t)result;
  return result;
}

uint64_t ospf_log()
{
  if (ospf_log_onceToken != -1)
    dispatch_once(&ospf_log_onceToken, &__block_literal_global_26);
  return ospf_log___logger;
}

os_log_t __ospf_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.multipeerconnectivity", "OSPF");
  ospf_log___logger = (uint64_t)result;
  return result;
}

uint64_t MCDashboardLog(char *__format, ...)
{
  void *v2;
  char __str[1024];
  uint64_t v5;
  va_list va;

  va_start(va, __format);
  v5 = *MEMORY[0x24BDAC8D0];
  if (MCDashboardClient_onceToken != -1)
    dispatch_once(&MCDashboardClient_onceToken, &__block_literal_global_36);
  v2 = (void *)MCDashboardClient_client;
  vsnprintf(__str, 0x400uLL, __format, va);
  return objc_msgSend(v2, "logf:", "MC: p=%{pid}; %s", getpid(), __str, va);
}

uint64_t MCDashboardLogJSON(uint64_t a1, __CFString *a2, void *a3)
{
  void *v6;
  void *v7;

  if (MCDashboardClient_onceToken != -1)
    dispatch_once(&MCDashboardClient_onceToken, &__block_literal_global_36);
  v6 = (void *)MCDashboardClient_client;
  if (!-[__CFString length](a2, "length"))
    a2 = CFSTR("MC");
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", a1);
  objc_msgSend(v7, "setObject:forKey:", a2, CFSTR("_cat"));
  objc_msgSend(v7, "setObject:forKey:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1760], "processInfo"), "processName"), CFSTR("pid"));
  if (objc_msgSend(a3, "length"))
    objc_msgSend(v7, "setObject:forKey:", a3, CFSTR("_op"));
  return objc_msgSend(v6, "logJSON:", v7);
}

void MCMetricsLog(__CFString *a1, uint64_t a2, int a3)
{
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  __CFString *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (-[__CFString length](a1, "length"))
  {
    if (a2)
    {
      if (metrics_log_onceToken != -1)
        dispatch_once(&metrics_log_onceToken, &__block_literal_global_38);
      v6 = metrics_log___logger;
      if (os_log_type_enabled((os_log_t)metrics_log___logger, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138412546;
        v10 = a1;
        v11 = 2112;
        v12 = a2;
        _os_log_impl(&dword_20DC1A000, v6, OS_LOG_TYPE_DEFAULT, "MetricEvent '%@' : %@\n", (uint8_t *)&v9, 0x16u);
      }
      AnalyticsSendEvent();
      if (a3)
        MCDashboardLogJSON(a2, a1, CFSTR("metrics"));
    }
    else
    {
      if (metrics_log_onceToken != -1)
        dispatch_once(&metrics_log_onceToken, &__block_literal_global_38);
      v8 = metrics_log___logger;
      if (os_log_type_enabled((os_log_t)metrics_log___logger, OS_LOG_TYPE_ERROR))
        MCMetricsLog_cold_2(v8);
    }
  }
  else
  {
    if (metrics_log_onceToken != -1)
      dispatch_once(&metrics_log_onceToken, &__block_literal_global_38);
    v7 = metrics_log___logger;
    if (os_log_type_enabled((os_log_t)metrics_log___logger, OS_LOG_TYPE_ERROR))
      MCMetricsLog_cold_1((uint64_t)a1, v7);
  }
}

os_log_t __metrics_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.multipeerconnectivity", "Metrics");
  metrics_log___logger = (uint64_t)result;
  return result;
}

const char *XDataControlTypeName(int a1)
{
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (a1 > 30)
  {
    switch(a1)
    {
      case 31:
        return "XDataStreamCloseFromReceiver";
      case 40:
        return "XDataPeerIDPush";
      case 41:
        return "XDataConnectionBlobPush";
    }
  }
  else
  {
    switch(a1)
    {
      case 20:
        return "XDataStreamOpenRequest";
      case 21:
        return "XDataStreamOpenResponse";
      case 30:
        return "XDataStreamCloseFromSender";
    }
  }
  v3 = mcs_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = a1;
    _os_log_impl(&dword_20DC1A000, v3, OS_LOG_TYPE_DEFAULT, "Unrecognized type [%d].", (uint8_t *)v4, 8u);
  }
  return "invalid";
}

void sub_20DC22DE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void GCKEventListenerForMCSession(void *a1, uint64_t a2, __int128 *a3)
{
  NSObject *v6;
  id v7;
  uint64_t v8;
  const char *v9;
  int v10;
  int v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = mcs_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(int *)a3;
    if (v8 > 6)
      v9 = "?";
    else
      v9 = off_24C840B38[v8];
    v10 = *((_DWORD *)a3 + 4);
    v11 = *((_DWORD *)a3 + 5);
    v12 = 136316162;
    v13 = v9;
    v14 = 1024;
    v15 = v10;
    v16 = 1024;
    v17 = v11;
    v18 = 2048;
    v19 = a1;
    v20 = 1024;
    v21 = a2;
    _os_log_debug_impl(&dword_20DC1A000, v6, OS_LOG_TYPE_DEBUG, "Event %s size=%d status=%d (%p) from pid[%08X].", (uint8_t *)&v12, 0x28u);
  }
  v7 = objc_alloc_init(MEMORY[0x24BDD1460]);
  AGPSessionEvent(objc_msgSend(a1, "agpSession"), a2, a3);

}

void AGPEventListenerForMCSession(void *a1, int a2, int *a3)
{
  NSObject *v6;
  id v7;
  _QWORD *v8;
  _QWORD *v9;
  __int128 v10;
  size_t v11;
  const void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  const char *v16;
  int v17;
  int v18;
  _QWORD block[6];
  int v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = mcs_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v15 = *a3;
    if (v15 > 6)
      v16 = "?";
    else
      v16 = off_24C840B38[v15];
    v17 = a3[4];
    v18 = a3[5];
    *(_DWORD *)buf = 136316162;
    v22 = v16;
    v23 = 1024;
    v24 = v17;
    v25 = 1024;
    v26 = v18;
    v27 = 2048;
    v28 = a1;
    v29 = 1024;
    v30 = a2;
    _os_log_debug_impl(&dword_20DC1A000, v6, OS_LOG_TYPE_DEBUG, "Event %s size=%d status=%d (%p) from pid[%08X].", buf, 0x28u);
  }
  v7 = objc_alloc_init(MEMORY[0x24BDD1460]);
  v8 = malloc_type_malloc(a3[4] + 24, 0x31869B4BuLL);
  if (v8)
  {
    v9 = v8;
    v10 = *(_OWORD *)a3;
    v8[2] = *((_QWORD *)a3 + 2);
    *(_OWORD *)v8 = v10;
    v11 = a3[4];
    if ((int)v11 >= 1)
    {
      v12 = (const void *)*((_QWORD *)a3 + 1);
      if (v12)
      {
        memcpy(v8 + 3, v12, v11);
        v9[1] = v9 + 3;
      }
    }
    v13 = objc_msgSend(a1, "syncQueue");
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __AGPEventListenerForMCSession_block_invoke;
    block[3] = &unk_24C840AE0;
    block[4] = a1;
    block[5] = v9;
    v20 = a2;
    dispatch_async(v13, block);

  }
  else
  {
    v14 = mcs_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      AGPEventListenerForMCSession_cold_1();
  }
}

void sub_20DC24024(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_20DC246F4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_20DC25750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0xEu);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xEu);
}

void OUTLINED_FUNCTION_15(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_16(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_18(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x30u);
}

void OUTLINED_FUNCTION_3_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

void OUTLINED_FUNCTION_6_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_8_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x34u);
}

uint64_t UpdateRTO(unsigned int *a1, int a2)
{
  int v2;
  unsigned int v3;
  unsigned int v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;

  if (a2 >= 1)
  {
    v3 = *a1;
    v2 = a1[1];
    v4 = *a1 + 1;
    *a1 = v4;
    if (v3 <= 0x3F)
    {
      v5 = v2 + a2;
      v6 = (v2 + a2) / v4;
      v7 = a2 - v6;
      if ((int)(a2 - v6) < 0)
        v7 = v6 - a2;
      v8 = a1[2] - ((int)a1[2] >> 5) + v7;
      a1[1] = v5;
      a1[2] = v8;
      goto LABEL_11;
    }
    v9 = a2 - (v2 >> 6);
    if (v9 >= 0)
      v10 = a2 - (v2 >> 6);
    else
      v10 = (v2 >> 6) - a2;
    v11 = a1[2];
    if (v10 < (3 * v11) >> 5)
    {
      v12 = v9 + v2;
      v13 = v10 - (v11 >> 5) + v11;
      a1[1] = v12;
      a1[2] = v13;
      v6 = (v13 >> 5) + (v12 >> 6);
LABEL_11:
      a1[3] = v6;
    }
  }
  return a1[3];
}

void TracePrintNodes(uint64_t a1, int a2, uint64_t a3, int a4, int a5)
{
  double v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  _BOOL4 v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  int *v18;
  NSObject *v19;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  int *v29;
  int *v30;
  NSObject *v31;
  int v32;
  int v33;
  uint8_t buf[4];
  int v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v9 = micro();
  if (v9 - *(double *)(a1 + 7160) > 1.0)
  {
    *(double *)(a1 + 7160) = v9;
    *(_DWORD *)(a1 + 7152) = 1;
    goto LABEL_6;
  }
  v10 = *(_DWORD *)(a1 + 7152);
  *(_DWORD *)(a1 + 7152) = v10 + 1;
  if (v10 < 201)
  {
LABEL_6:
    v12 = gcks_log();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (a4)
    {
      if (!v13)
        goto LABEL_12;
      *(_DWORD *)buf = 67109120;
      v36 = a2;
      v14 = "My routing table: %d nodes.";
      v15 = v12;
      v16 = 8;
    }
    else
    {
      if (!v13)
        goto LABEL_12;
      *(_DWORD *)buf = 67109376;
      v36 = a5;
      v37 = 1024;
      v38 = a2;
      v14 = "Participant %08X routing table: %d nodes.";
      v15 = v12;
      v16 = 14;
    }
    _os_log_impl(&dword_20DC1A000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
LABEL_12:
    if (a2 >= 1)
    {
      v17 = 0;
      v18 = (int *)(a3 + 292);
      do
      {
        v19 = gcks_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = a3 + 416 * v17;
          v21 = *(_DWORD *)v20;
          v22 = *(_DWORD *)(v20 + 4);
          v23 = *(unsigned __int16 *)(v20 + 272);
          v24 = *(unsigned __int16 *)(v20 + 274);
          v25 = *(_DWORD *)(v20 + 276);
          v26 = *(_DWORD *)(v20 + 280);
          LODWORD(v20) = *(_DWORD *)(v20 + 284);
          *(_DWORD *)buf = 67110912;
          v36 = v17;
          v37 = 1024;
          v38 = v21;
          v39 = 1024;
          v40 = v22;
          v41 = 1024;
          v42 = v23;
          v43 = 1024;
          v44 = v24;
          v45 = 1024;
          v46 = v25;
          v47 = 1024;
          v48 = v26;
          v49 = 1024;
          v50 = v20;
          _os_log_impl(&dword_20DC1A000, v19, OS_LOG_TYPE_DEFAULT, "Node %d [%08X]: NextHop[%08X], SN[%u], LSASN [%u], New flag[%d], From[%08X], # of neighbors [%d]", buf, 0x32u);
        }
        v27 = a3 + 416 * v17;
        if (*(int *)(v27 + 284) >= 1)
        {
          v28 = 0;
          v29 = (int *)(v27 + 284);
          v30 = v18;
          do
          {
            v31 = gcks_log();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              v32 = *(v30 - 1);
              v33 = *v30;
              *(_DWORD *)buf = 67109632;
              v36 = v28;
              v37 = 1024;
              v38 = v32;
              v39 = 1024;
              v40 = v33;
              _os_log_impl(&dword_20DC1A000, v31, OS_LOG_TYPE_DEFAULT, "\tneighbor %d: %08X - RTT[%u]", buf, 0x14u);
            }
            ++v28;
            v30 += 2;
          }
          while (v28 < *v29);
        }
        ++v17;
        v18 += 104;
      }
      while (v17 != a2);
    }
    return;
  }
  v11 = gcks_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    TracePrintNodes_cold_1((int *)(a1 + 7152), v11);
}

void gckSessionUpdateRoutingTable(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  unsigned int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _DWORD *v25;
  int v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _DWORD *v32;
  uint64_t i;
  int v34;
  int v35;
  int v36;
  NSObject *v37;
  uint8_t buf[8];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v3 = *(int *)(a1 + 420);
  v4 = a1 + 424;
  v5 = *(unsigned int *)(a1 + 420);
  v6 = MEMORY[0x24BDAC7A8](a1, a2);
  v8 = &buf[-((v7 + 15) & 0x7FFFFFFF0)];
  v10 = MEMORY[0x24BDAC7A8](v6, v9);
  v12 = &buf[-v11];
  v14 = MEMORY[0x24BDAC7A8](v10, v13);
  v16 = &buf[-v15];
  TracePrintNodes(v14, v3, v4, 1, *(_DWORD *)(v14 + 416));
  memset(v8, 255, 4 * v3);
  memset(v12, 255, 4 * v3);
  bzero(v16, 4 * v3);
  *(_DWORD *)v8 = 0;
  if ((int)v3 >= 1)
  {
    v17 = 0;
    v18 = -1;
    v19 = -1;
    do
    {
      do
      {
        if (!*(_DWORD *)&v16[4 * v17] && *(_DWORD *)&v8[4 * v17] < v18)
        {
          v19 = v17;
          v18 = *(_DWORD *)&v8[4 * v17];
        }
        ++v17;
      }
      while (v17 != v5);
      if (v19 == -1)
        break;
      *(_DWORD *)&v16[4 * v19] = 1;
      v20 = v4 + 416 * v19;
      v21 = *(unsigned int *)(v20 + 284);
      if ((int)v21 >= 1)
      {
        v22 = 0;
        v23 = v20 + 288;
        do
        {
          if ((int)v5 < 1)
          {
            LODWORD(v24) = 0;
          }
          else
          {
            v24 = 0;
            v25 = (_DWORD *)v4;
            while (*v25 != *(_DWORD *)(v23 + 8 * v22))
            {
              v25 += 104;
              if (v5 == ++v24)
                goto LABEL_18;
            }
          }
          if ((_DWORD)v24 != (_DWORD)v5 && !*(_DWORD *)&v16[4 * v24])
          {
            v26 = *(_DWORD *)(v23 + 8 * v22 + 4);
            if (v26 != -1)
            {
              v27 = v26 + v18;
              if (v27 < *(_DWORD *)&v8[4 * v24])
              {
                *(_DWORD *)&v8[4 * v24] = v27;
                *(_DWORD *)&v12[4 * v24] = v19;
              }
            }
          }
LABEL_18:
          ++v22;
        }
        while (v22 != v21);
      }
      v17 = 0;
      v18 = -1;
      v19 = -1;
    }
    while ((int)v5 >= 1);
  }
  v28 = *(unsigned int *)(a1 + 708);
  if ((int)v28 >= 1)
  {
    v29 = 0;
    v30 = a1 + 712;
    do
    {
      if ((int)v5 < 1)
      {
        LODWORD(v31) = 0;
      }
      else
      {
        v31 = 0;
        v32 = (_DWORD *)v4;
        while (*v32 != *(_DWORD *)(v30 + 8 * v29))
        {
          v32 += 104;
          if (v5 == ++v31)
            goto LABEL_35;
        }
      }
      if ((_DWORD)v31 != (_DWORD)v5 && *(_DWORD *)(v30 + 8 * v29 + 4) != -1)
        *(_DWORD *)&v12[4 * v31] = 0;
LABEL_35:
      ++v29;
    }
    while (v29 != v28);
  }
  if ((int)v5 > 1)
  {
    for (i = 1; i != v5; ++i)
    {
      v34 = i;
      while (1)
      {
        v35 = v34;
        v34 = *(_DWORD *)&v12[4 * v34];
        if (v34 == -1)
          break;
        if (!v34)
        {
          *(_DWORD *)(v4 + 416 * i + 4) = *(_DWORD *)(v4 + 416 * v35);
          v36 = *(_DWORD *)&v8[4 * i];
          goto LABEL_43;
        }
      }
      v36 = -1;
      *(_DWORD *)(v4 + 416 * i + 4) = -1;
LABEL_43:
      *(_DWORD *)(v4 + 416 * i + 268) = v36;
    }
  }
  v37 = gcks_log();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DC1A000, v37, OS_LOG_TYPE_DEFAULT, "Updated routing table.", buf, 2u);
  }
  TracePrintNodes(a1, *(_DWORD *)(a1 + 420), v4, 1, *(_DWORD *)(a1 + 416));
}

const char *GCKSessionInterfaceNameForPriority(int a1)
{
  int v2;
  NSObject *v3;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a1 - 1;
  if ((a1 - 1) < 7 && ((0x7Du >> v2) & 1) != 0)
    return off_24C840D48[v2];
  v3 = gcks_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = a1;
    _os_log_impl(&dword_20DC1A000, v3, OS_LOG_TYPE_DEFAULT, "Unrecognized interface priority type [%d].", (uint8_t *)v5, 8u);
  }
  return "UNKNOWN";
}

uint64_t GCKSessionCreate(int a1, const void *a2, uint64_t a3, uint64_t a4, const void *a5, _QWORD *a6)
{
  char *v12;
  char *v13;
  uint64_t v14;
  void *v15;
  uint64_t Handle;
  void *v17;
  _QWORD *v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  int v31;
  NSObject *v32;
  NSObject *v33;
  _BYTE buf[24];
  uint64_t (*v35)();
  uint64_t v36;
  uint64_t (*v37)(uint64_t, int);
  __int128 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  if ((GCKSessionCreate_s_fInit & 1) == 0)
    GCKSessionCreate_s_fInit = 1;
  v12 = (char *)malloc_type_calloc(1uLL, 0x1D80uLL, 0x10E0040C953D487uLL);
  if (!v12)
  {
    v14 = 2149187587;
    v21 = gcks_log();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      return v14;
LABEL_14:
    GCKSessionCreate_cold_1(v21, v22, v23, v24, v25, v26, v27, v28);
    return v14;
  }
  v13 = v12;
  v14 = 2149187587;
  v15 = malloc_type_calloc(1uLL, 0x138uLL, 0x10A00406F2D52ADuLL);
  *((_QWORD *)v13 + 51) = v15;
  if (!v15)
  {
    free(v13);
    v21 = gcks_log();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      return v14;
    goto LABEL_14;
  }
  Handle = CreateHandle();
  if (Handle == 0xFFFFFFFFLL)
  {
    free(v13);
    return 2149187589;
  }
  v17 = (void *)Handle;
  *((_DWORD *)v13 + 104) = a1;
  v18 = (_QWORD *)*((_QWORD *)v13 + 51);
  v18[1] = a3;
  v18[2] = a4;
  v18[3] = 0;
  v18[4] = 0;
  *((_DWORD *)v13 + 4) = -1;
  *((_QWORD *)v13 + 9) = 0xFFFFFFFFLL;
  *((_DWORD *)v13 + 100) = 0;
  *((_OWORD *)v13 + 3) = xmmword_20DC4CA50;
  *((_DWORD *)v13 + 16) = 1;
  *(_OWORD *)(v13 + 24) = xmmword_20DC4CA60;
  *((_DWORD *)v13 + 10) = 1;
  *((_DWORD *)v13 + 1884) = 0;
  pthread_mutex_init((pthread_mutex_t *)(v13 + 80), 0);
  pthread_mutex_init((pthread_mutex_t *)(v13 + 7080), 0);
  pthread_rwlock_init((pthread_rwlock_t *)(v13 + 7192), 0);
  pthread_mutex_init((pthread_mutex_t *)(v13 + 7400), 0);
  pthread_cond_init((pthread_cond_t *)(v13 + 7464), 0);
  pthread_cond_init((pthread_cond_t *)(*((_QWORD *)v13 + 51) + 112), 0);
  pthread_mutex_init((pthread_mutex_t *)(*((_QWORD *)v13 + 51) + 48), 0);
  pthread_mutex_init((pthread_mutex_t *)(*((_QWORD *)v13 + 51) + 248), 0);
  __sprintf_chk(v13 + 433, 0, 0x100uLL, "%08X", a1);
  v13[432] = 8;
  *((_DWORD *)v13 + 106) = a1;
  *((_DWORD *)v13 + 107) = a1;
  *((_DWORD *)v13 + 173) = 0;
  *((_WORD *)v13 + 348) = 0;
  *((_DWORD *)v13 + 175) = 0;
  *((_DWORD *)v13 + 176) = a1;
  *((_DWORD *)v13 + 177) = 0;
  *((_DWORD *)v13 + 105) = 1;
  *((_DWORD *)v13 + 1788) = 0;
  *((double *)v13 + 895) = micro();
  *((_QWORD *)v13 + 940) = a2;
  if (a2)
    CFRetain(a2);
  if (!CheckInHandleDebug())
  {
    v14 = 2149187586;
LABEL_19:
    v29 = gcks_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      GCKSessionCreate_cold_3();
    goto LABEL_21;
  }
  qword_2549DD710 = 0x404E000000000000;
  v36 = 0;
  v38 = 0u;
  *(_QWORD *)buf = gckSessionSendICEPacket;
  *(_QWORD *)&buf[8] = gckSessionRecvICEPacketWithTimeout;
  *(_QWORD *)&buf[16] = gckSessionConnectedCallback;
  v35 = gckSessionCancelRecvUDP;
  v39 = 0;
  v37 = gckSessionICEListRemoveCallback;
  v14 = ICECreateHandleWithCallback();
  ICEDisableCandidatePairFilter();
  CheckOutHandleDebug();
  if ((v14 & 0x80000000) != 0)
    goto LABEL_19;
  v19 = pthread_create((pthread_t *)v13 + 896, 0, (void *(__cdecl *)(void *))gckSessionRecvProc, v17);
  if (v19)
  {
    v14 = v19 | 0xC01A0000;
    v20 = gcks_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      GCKSessionCreate_cold_5();
LABEL_21:
    GCKSessionRelease();
    return v14;
  }
  v31 = pthread_create((pthread_t *)v13 + 897, 0, (void *(__cdecl *)(void *))gckSessionSendProc, v17);
  if (v31)
  {
    v14 = v31 | 0xC01A0000;
    v32 = gcks_log();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      GCKSessionCreate_cold_4();
    goto LABEL_21;
  }
  *((_DWORD *)v13 + 1886) = 0;
  *((_QWORD *)v13 + 941) = a5;
  if (a5)
    CFRetain(a5);
  *a6 = v17;
  v33 = gcks_log();
  v14 = 0;
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "Aug  3 2024";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "10:08:06";
    _os_log_impl(&dword_20DC1A000, v33, OS_LOG_TYPE_DEFAULT, "GCKSessionCreate: [GKS: %s - %s].", buf, 0x16u);
    return 0;
  }
  return v14;
}

double micro()
{
  double v0;
  unint64_t v2;
  unint64_t v3;
  mach_timebase_info info;

  if ((micro_did_init & 1) == 0)
  {
    info = 0;
    mach_timebase_info(&info);
    LODWORD(v3) = info.denom;
    LODWORD(v2) = info.numer;
    *(double *)&micro_rate = (double)v2 / (double)v3 / 1000000000.0;
    __dmb(0xBu);
    micro_did_init = 1;
  }
  v0 = *(double *)&micro_rate;
  return v0 * (double)(uint64_t)mach_absolute_time();
}

uint64_t GCKSessionRelease()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t i;
  int v8;
  uint64_t v9;
  pthread_rwlock_t *v10;
  uint64_t j;
  _opaque_pthread_t *v12;
  _opaque_pthread_t *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  const void *v18;
  const void *v19;
  timeval v21;
  _BYTE buf[12];
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v21.tv_sec = 0;
  *(_QWORD *)&v21.tv_usec = 50000;
  v0 = CheckInHandleDebug();
  if (!v0)
    return 2149187586;
  v1 = v0;
  v2 = gcks_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "Aug  3 2024";
    v23 = 2080;
    v24 = "10:08:06";
    _os_log_impl(&dword_20DC1A000, v2, OS_LOG_TYPE_DEFAULT, "GCKSessionRelease: Disposing all connections [GKS: %s - %s].", buf, 0x16u);
  }
  gckSessionDisposeAllConnections(v1);
  v3 = micro() + 1.0;
  while (1)
  {
    pthread_rwlock_rdlock((pthread_rwlock_t *)(v1 + 7192));
    v4 = *(_QWORD *)(v1 + 7184);
    if (!v4)
      break;
    while (1)
    {
      pthread_mutex_lock((pthread_mutex_t *)(v4 + 768));
      v5 = *(_QWORD *)(v4 + 600);
      if (v5)
        break;
LABEL_9:
      pthread_mutex_unlock((pthread_mutex_t *)(v4 + 768));
      v4 = *(_QWORD *)(v4 + 832);
      if (!v4)
        goto LABEL_13;
    }
    while (*(_BYTE *)v5 != 4)
    {
      v5 = *(_QWORD *)(v5 + 64);
      if (!v5)
        goto LABEL_9;
    }
    pthread_mutex_unlock((pthread_mutex_t *)(v4 + 768));
    pthread_rwlock_unlock((pthread_rwlock_t *)(v1 + 7192));
    select(0, 0, 0, 0, &v21);
    if (micro() >= v3)
      goto LABEL_14;
  }
LABEL_13:
  pthread_rwlock_unlock((pthread_rwlock_t *)(v1 + 7192));
LABEL_14:
  v6 = gcks_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "Aug  3 2024";
    v23 = 2080;
    v24 = "10:08:06";
    _os_log_impl(&dword_20DC1A000, v6, OS_LOG_TYPE_DEFAULT, "Stop ICE connectionchecks [GKS: %s - %s].", buf, 0x16u);
  }
  pthread_rwlock_rdlock((pthread_rwlock_t *)(v1 + 7192));
  for (i = *(_QWORD *)(v1 + 7184); i; i = *(_QWORD *)(i + 832))
    ICEStopConnectivityCheck();
  *(_QWORD *)v1 = 0x100000001;
  v8 = *(_DWORD *)(v1 + 16);
  if (v8 != -1)
  {
    *(_DWORD *)(v1 + 16) = -1;
    close(v8);
  }
  pthread_rwlock_unlock((pthread_rwlock_t *)(v1 + 7192));
  do
  {
    do
      select(0, 0, 0, 0, &v21);
    while (*(_QWORD *)(v1 + 7176) && !*(_DWORD *)(v1 + 7516));
  }
  while (*(_QWORD *)(v1 + 7168) && !*(_DWORD *)(v1 + 7512));
  CheckOutHandleDebug();
  v9 = CheckInHandleDebug();
  v10 = (pthread_rwlock_t *)(v9 + 7192);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(v9 + 7192));
  for (j = *(_QWORD *)(v9 + 7184); j; j = *(_QWORD *)(j + 832))
    *(_DWORD *)j = -1;
  pthread_rwlock_unlock(v10);
  v12 = *(_opaque_pthread_t **)(v9 + 7168);
  if (v12)
  {
    *(_QWORD *)buf = 0;
    pthread_join(v12, (void **)buf);
  }
  v13 = *(_opaque_pthread_t **)(v9 + 7176);
  if (v13)
  {
    *(_QWORD *)buf = 0;
    pthread_join(v13, (void **)buf);
  }
  CheckOutHandleDebug();
  StopEventCallbackThread(*(char **)(v9 + 408));
  *(_QWORD *)(v9 + 408) = 0;
  ICECloseHandle();
  pthread_rwlock_wrlock(v10);
  v14 = *(_QWORD *)(v9 + 7184);
  if (v14)
  {
    do
    {
      v15 = *(_QWORD *)(v14 + 832);
      gckSessionFreeCList(v14);
      v14 = v15;
    }
    while (v15);
  }
  pthread_rwlock_unlock(v10);
  pthread_mutex_lock((pthread_mutex_t *)(v9 + 7400));
  v16 = *(_QWORD **)(v9 + 7392);
  if (v16)
  {
    do
    {
      v17 = (_QWORD *)v16[525];
      free(v16);
      v16 = v17;
    }
    while (v17);
  }
  pthread_mutex_unlock((pthread_mutex_t *)(v9 + 7400));
  pthread_mutex_destroy((pthread_mutex_t *)(v9 + 80));
  pthread_mutex_destroy((pthread_mutex_t *)(v9 + 7080));
  pthread_rwlock_destroy(v10);
  pthread_mutex_destroy((pthread_mutex_t *)(v9 + 7400));
  pthread_cond_destroy((pthread_cond_t *)(v9 + 7464));
  v18 = *(const void **)(v9 + 7520);
  if (v18)
    CFRelease(v18);
  v19 = *(const void **)(v9 + 7528);
  if (v19)
    CFRelease(v19);
  free((void *)v9);
  return 0;
}

uint64_t gckSessionRecvProc()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *global_queue;
  NSObject *v4;
  int v5;
  double v6;
  uint64_t v7;
  double v8;
  int v9;
  double v10;
  int v11;
  uint64_t v12;
  double v13;
  uint64_t *v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t i;
  NSObject *v23;
  int v24;
  int v25;
  int v26;
  uint64_t v27;
  unsigned __int8 *j;
  NSObject *v29;
  const char *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  _QWORD *v37;
  _BYTE *v38;
  uint64_t v39;
  NSObject *v40;
  const char *v41;
  int v42;
  int v43;
  int v44;
  int v45;
  double v46;
  uint32_t v47;
  double v48;
  int v49;
  NSObject *v50;
  const char *v51;
  int v52;
  int v53;
  int v54;
  double v55;
  double v56;
  double v57;
  double v58;
  NSObject *v59;
  int v60;
  int v61;
  int v62;
  NSObject *v63;
  const char *v64;
  void *v65;
  NSObject *v66;
  int v67;
  int v68;
  const char *v69;
  NSObject *v70;
  int v71;
  int v72;
  const char *v73;
  NSObject *v74;
  int v75;
  int v76;
  const char *v77;
  NSObject *v78;
  int v79;
  int v80;
  const char *v81;
  NSObject *v82;
  int v83;
  int v84;
  const char *v85;
  NSObject *v86;
  int v87;
  int v88;
  const char *v89;
  NSObject *v90;
  int v91;
  int v92;
  int v93;
  const char *v94;
  const char *v95;
  int v96;
  NSObject *v97;
  NSObject *v98;
  NSObject *v99;
  int v100;
  int v101;
  int v102;
  NSObject *v103;
  int v104;
  int v105;
  int v106;
  double v107;
  double v108;
  NSObject *v109;
  double v110;
  NSObject *v111;
  NSObject *v112;
  const char *v113;
  uint32_t v114;
  NSObject *v115;
  NSObject *v116;
  int v117;
  int v118;
  int v119;
  int v120;
  int v121;
  double v122;
  double v123;
  int v124;
  int v125;
  int v126;
  void *v127;
  NSObject *v128;
  NSObject *v129;
  const char *v130;
  int v131;
  NSObject *v132;
  int v133;
  int v134;
  int v135;
  int v136;
  int v137;
  uint64_t v138;
  uint64_t v139;
  double v140;
  unsigned __int8 *v141;
  unsigned __int8 *v142;
  int v143;
  BOOL v144;
  unsigned __int8 *v145;
  void *v146;
  NSObject *v147;
  int v148;
  int v149;
  int v150;
  int v151;
  int v152;
  NSObject *v153;
  int v154;
  int v155;
  int v156;
  int v157;
  double v158;
  dispatch_time_t v159;
  int v160;
  double v161;
  double v162;
  unint64_t v163;
  NSObject *v164;
  uint64_t k;
  int v166;
  int v167;
  int v168;
  NSObject *v169;
  int v170;
  NSObject *v171;
  uint64_t v172;
  uint64_t v173;
  NSObject *v174;
  NSObject *v176;
  NSObject *v177;
  NSObject *v178;
  pthread_mutex_t *v180;
  NSObject *source;
  double v182;
  pthread_rwlock_t *v183;
  uint64_t *v184;
  int v185;
  unsigned __int8 **v186;
  double v187;
  uint64_t *v188;
  pthread_mutex_t *v189;
  _QWORD handler[5];
  timeval v191;
  timeval v192;
  fd_set v193;
  uint8_t v194[4];
  _BYTE v195[10];
  double v196;
  _BYTE v197[10];
  __int16 v198;
  double v199;
  uint8_t buf[4];
  _BYTE v201[26];
  uint64_t v202;
  uint64_t v203;

  v203 = *MEMORY[0x24BDAC8D0];
  v0 = -2145779708;
  v191.tv_sec = 0;
  *(_QWORD *)&v191.tv_usec = 0;
  pthread_setname_np("com.apple.multipeerconnectivity.gcksession.recvproc");
  v1 = CheckInHandleDebug();
  if (!v1)
    return -2145779710;
  v2 = v1;
  memset(&v193, 0, sizeof(v193));
  v192.tv_sec = 0;
  *(_QWORD *)&v192.tv_usec = 0;
  global_queue = dispatch_get_global_queue(2, 0);
  v4 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 1uLL, global_queue);
  if (!v4)
  {
    v171 = gcks_log();
    if (os_log_type_enabled(v171, OS_LOG_TYPE_ERROR))
      gckSessionRecvProc_cold_1(v171, v172, v173);
    return v0;
  }
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 0x40000000;
  handler[2] = __gckSessionRecvProc_block_invoke;
  handler[3] = &__block_descriptor_tmp_91;
  handler[4] = v2;
  source = v4;
  dispatch_source_set_event_handler(v4, handler);
  v5 = 0;
  v180 = (pthread_mutex_t *)(v2 + 7080);
  v182 = micro() + 30.0;
  v183 = (pthread_rwlock_t *)(v2 + 7192);
  v184 = (uint64_t *)(v2 + 7184);
  while (1)
  {
    v6 = micro();
    if (v6 - *(double *)(v2 + 7144) > 15.0)
    {
      pthread_mutex_lock(v180);
      *(double *)(v2 + 7144) = v6;
      TracePrintNodes(v2, *(_DWORD *)(v2 + 420), v2 + 424, 1, *(_DWORD *)(v2 + 416));
      pthread_mutex_unlock(v180);
    }
    memset(&v193, 0, sizeof(v193));
    v7 = *(_QWORD *)(v2 + 408);
    v8 = micro();
    ServiceWaitEventCallbacks(v7, v8);
    pthread_rwlock_wrlock(v183);
    if (*(_DWORD *)v2)
    {
      pthread_rwlock_unlock(v183);
LABEL_292:
      v176 = source;
      goto LABEL_296;
    }
    if (*(_DWORD *)(v2 + 16) == -1)
    {
      v9 = socket(2, 1, 6);
      *(_DWORD *)(v2 + 16) = v9;
      if (v9 == -1)
        break;
    }
    v10 = micro();
    if (v10 >= v182)
    {
      v182 = v10 + 30.0;
      goto LABEL_285;
    }
    v11 = *(_DWORD *)(v2 + 16);
    if (__darwin_check_fd_set_overflow(v11, &v193, 0))
      *(__int32_t *)((char *)v193.fds_bits + (((unint64_t)v11 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v11;
    v185 = *(_DWORD *)(v2 + 16);
    v12 = *(_QWORD *)(v2 + 7184);
    if (v12)
    {
      v13 = v10 + 0.015;
      v187 = v10 + 0.5;
      v14 = (uint64_t *)(v2 + 7184);
      v15 = v182;
      while (1)
      {
        v188 = v14;
        v189 = (pthread_mutex_t *)(v12 + 768);
        pthread_mutex_lock((pthread_mutex_t *)(v12 + 768));
        if ((*(_BYTE *)(v12 + 40) & 2) != 0 && (*(_DWORD *)(v12 + 80) & 0x80000000) == 0)
        {
          v16 = *(_QWORD *)(v12 + 600);
          if (!v16)
            goto LABEL_28;
          v17 = 0;
          v18 = (_QWORD *)(v12 + 600);
          do
          {
            if (*(_BYTE *)v16 == 8)
            {
              if (v17)
              {
                v19 = gcks_log();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_20DC1A000, v19, OS_LOG_TYPE_DEFAULT, "Removing duplicate heartbeat.", buf, 2u);
                }
                free(*(void **)(v17 + 40));
                free((void *)v17);
              }
              v20 = *(_QWORD *)(v16 + 64);
              *v18 = v20;
              v17 = v16;
            }
            else
            {
              v20 = *(_QWORD *)(v16 + 64);
              v18 = (_QWORD *)(v16 + 64);
            }
            v16 = v20;
          }
          while (v20);
          if (v17)
          {
            *v18 = v17;
            *(_QWORD *)(v17 + 64) = 0;
          }
          else
          {
LABEL_28:
            v21 = gcks_log();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              v156 = *(_DWORD *)(v12 + 88);
              v157 = *(_DWORD *)(v12 + 72);
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)v201 = v156;
              *(_WORD *)&v201[4] = 1024;
              *(_DWORD *)&v201[6] = v157;
              _os_log_error_impl(&dword_20DC1A000, v21, OS_LOG_TYPE_ERROR, "Expected heartbeat in the retry list not found for participant [%08X] channel [%d].", buf, 0xEu);
            }
            for (i = *v184; i; i = *(_QWORD *)(i + 832))
            {
              v23 = gcks_log();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                v24 = *(_DWORD *)(i + 88);
                v26 = *(_DWORD *)(i + 60);
                v25 = *(_DWORD *)(i + 64);
                v27 = IPPORTToString();
                *(_DWORD *)v194 = 67109890;
                *(_DWORD *)v195 = v24;
                *(_WORD *)&v195[4] = 1024;
                *(_DWORD *)&v195[6] = v26;
                LOWORD(v196) = 1024;
                *(_DWORD *)((char *)&v196 + 2) = v25;
                HIWORD(v196) = 2080;
                *(_QWORD *)v197 = v27;
                _os_log_impl(&dword_20DC1A000, v23, OS_LOG_TYPE_DEFAULT, "Participant %08X: sentDD [%d], receivedDD [%d] address [%s].", v194, 0x1Eu);
              }
              for (j = *(unsigned __int8 **)(i + 600); j; j = (unsigned __int8 *)*((_QWORD *)j + 8))
              {
                v29 = gcks_log();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                {
                  v30 = gckWaitForString(*j);
                  v31 = *((double *)j + 1);
                  v32 = *((double *)j + 2);
                  if (v31 == 0.0)
                    v33 = 0.0;
                  else
                    v33 = v10 - v31;
                  if (v32 == 0.0)
                    v34 = 0.0;
                  else
                    v34 = v32 - v10;
                  v35 = *((double *)j + 4);
                  *(_DWORD *)v194 = 136315906;
                  *(_QWORD *)v195 = v30;
                  if (v35 == 0.0)
                    v36 = 0.0;
                  else
                    v36 = v35 - v10;
                  *(_WORD *)&v195[8] = 2048;
                  v196 = v33;
                  *(_WORD *)v197 = 2048;
                  *(double *)&v197[2] = v34;
                  v198 = 2048;
                  v199 = v36;
                  _os_log_impl(&dword_20DC1A000, v29, OS_LOG_TYPE_DEFAULT, "    WaitFor [%s] timerAdd [%.1lf] nextFire [%.1lf] waitUntil [%.1lf].", v194, 0x2Au);
                }
              }
            }
          }
        }
        v37 = (_QWORD *)(v12 + 600);
        v38 = *(_BYTE **)(v12 + 600);
        v186 = (unsigned __int8 **)(v12 + 600);
        if (v38)
        {
          while (1)
          {
            if (*((double *)v38 + 2) != 0.0)
              goto LABEL_73;
            v39 = *((_QWORD *)v38 + 5);
            if (v39)
              break;
            v44 = *v38;
            if (v44 == 12)
              goto LABEL_61;
            if (v44 == 11)
            {
              v45 = gckSessionPerformDTLSHandshake(v2, v12);
              v5 = v45;
              if (*(_DWORD *)(v12 + 640) == 1)
                goto LABEL_157;
              if (v45 < 0)
              {
                *v37 = *((_QWORD *)v38 + 8);
                free(v38);
                v115 = gcks_log();
                if (!os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
                  goto LABEL_212;
LABEL_162:
                v125 = *(_DWORD *)(v12 + 88);
                v126 = *(_DWORD *)(v12 + 72);
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)v201 = v125;
                *(_WORD *)&v201[4] = 1024;
                *(_DWORD *)&v201[6] = v126;
                *(_WORD *)&v201[10] = 2048;
                *(_QWORD *)&v201[12] = v5;
                v112 = v115;
                v113 = "Perform DTLS Handshake for participant [%08X] on channel [%d] failed with hResult [%ld].";
                v114 = 24;
                goto LABEL_211;
              }
              v5 = 0;
LABEL_61:
              *((double *)v38 + 4) = v10 + *((double *)v38 + 4);
              *((double *)v38 + 2) = v10 + *((double *)v38 + 1);
LABEL_73:
              v44 = *v38;
            }
            v54 = v44 - 1;
            if (v44 == 1 && !*((_QWORD *)v38 + 5) && v10 >= *((double *)v38 + 4))
            {
              v55 = *(double *)(v12 + 16);
              v56 = *(double *)(v12 + 352);
              if (v10 - v55 < v56)
              {
                *((_QWORD *)v38 + 1) = 0x3FB0A3D70A3D70A4;
                v57 = v55 + v56;
                *((double *)v38 + 4) = v57;
                *((double *)v38 + 2) = v57;
              }
            }
            if (v10 >= *((double *)v38 + 4))
            {
              *v37 = *((_QWORD *)v38 + 8);
              v65 = (void *)*((_QWORD *)v38 + 5);
              if (v65)
                free(v65);
              free(v38);
              switch(v54)
              {
                case 0:
                  v66 = gcks_log();
                  if (!os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
                    goto LABEL_222;
                  v67 = *(_DWORD *)(v12 + 88);
                  v68 = *(_DWORD *)(v12 + 72);
                  v69 = "Created";
                  switch(*(_DWORD *)(v12 + 376))
                  {
                    case 0:
                      break;
                    case 1:
                      v69 = "ICE";
                      break;
                    case 2:
                      v69 = "Connecting";
                      break;
                    case 3:
                      v69 = "Connected";
                      break;
                    case 4:
                      v69 = "Disconnected";
                      break;
                    default:
                      if ("Created" == 255)
                        v69 = "Invalid";
                      else
                        v69 = "?";
                      break;
                  }
                  *(_DWORD *)buf = 67109634;
                  *(_DWORD *)v201 = v67;
                  *(_WORD *)&v201[4] = 1024;
                  *(_DWORD *)&v201[6] = v68;
                  *(_WORD *)&v201[10] = 2080;
                  *(_QWORD *)&v201[12] = v69;
                  v129 = v66;
                  v130 = "Hello timeout expired for participant [%08X] on channel [%d] state [%s].";
                  goto LABEL_221;
                case 1:
                  v78 = gcks_log();
                  if (!os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
                    goto LABEL_222;
                  v79 = *(_DWORD *)(v12 + 88);
                  v80 = *(_DWORD *)(v12 + 72);
                  v81 = "Created";
                  switch(*(_DWORD *)(v12 + 376))
                  {
                    case 0:
                      break;
                    case 1:
                      v81 = "ICE";
                      break;
                    case 2:
                      v81 = "Connecting";
                      break;
                    case 3:
                      v81 = "Connected";
                      break;
                    case 4:
                      v81 = "Disconnected";
                      break;
                    default:
                      if ("Created" == 255)
                        v81 = "Invalid";
                      else
                        v81 = "?";
                      break;
                  }
                  *(_DWORD *)buf = 67109634;
                  *(_DWORD *)v201 = v79;
                  *(_WORD *)&v201[4] = 1024;
                  *(_DWORD *)&v201[6] = v80;
                  *(_WORD *)&v201[10] = 2080;
                  *(_QWORD *)&v201[12] = v81;
                  v129 = v78;
                  v130 = "DD timeout expired for participant [%08X] on channel [%d] state [%s].";
                  goto LABEL_221;
                case 3:
                  v70 = gcks_log();
                  if (!os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
                    goto LABEL_222;
                  v71 = *(_DWORD *)(v12 + 88);
                  v72 = *(_DWORD *)(v12 + 72);
                  v73 = "Created";
                  switch(*(_DWORD *)(v12 + 376))
                  {
                    case 0:
                      break;
                    case 1:
                      v73 = "ICE";
                      break;
                    case 2:
                      v73 = "Connecting";
                      break;
                    case 3:
                      v73 = "Connected";
                      break;
                    case 4:
                      v73 = "Disconnected";
                      break;
                    default:
                      if ("Created" == 255)
                        v73 = "Invalid";
                      else
                        v73 = "?";
                      break;
                  }
                  *(_DWORD *)buf = 67109634;
                  *(_DWORD *)v201 = v71;
                  *(_WORD *)&v201[4] = 1024;
                  *(_DWORD *)&v201[6] = v72;
                  *(_WORD *)&v201[10] = 2080;
                  *(_QWORD *)&v201[12] = v73;
                  v129 = v70;
                  v130 = "LSAACK timeout expired for participant [%08X] on channel [%d] state [%s].";
                  goto LABEL_221;
                case 7:
                  v86 = gcks_log();
                  if (!os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
                    goto LABEL_222;
                  v87 = *(_DWORD *)(v12 + 88);
                  v88 = *(_DWORD *)(v12 + 72);
                  v89 = "Created";
                  switch(*(_DWORD *)(v12 + 376))
                  {
                    case 0:
                      break;
                    case 1:
                      v89 = "ICE";
                      break;
                    case 2:
                      v89 = "Connecting";
                      break;
                    case 3:
                      v89 = "Connected";
                      break;
                    case 4:
                      v89 = "Disconnected";
                      break;
                    default:
                      if ("Created" == 255)
                        v89 = "Invalid";
                      else
                        v89 = "?";
                      break;
                  }
                  *(_DWORD *)buf = 67109634;
                  *(_DWORD *)v201 = v87;
                  *(_WORD *)&v201[4] = 1024;
                  *(_DWORD *)&v201[6] = v88;
                  *(_WORD *)&v201[10] = 2080;
                  *(_QWORD *)&v201[12] = v89;
                  v129 = v86;
                  v130 = "Heartbeat timeout expired for participant [%08X] on channel [%d] state [%s].";
                  goto LABEL_221;
                case 10:
                  v90 = gcks_log();
                  if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
                  {
                    v91 = *(_DWORD *)(v12 + 88);
                    v92 = *(_DWORD *)(v12 + 72);
                    v93 = *(_DWORD *)(v12 + 640);
                    v94 = "?";
                    if (!v93)
                      v94 = "DTLSNotConnected";
                    v144 = v93 == 1;
                    v95 = "DTLSConnected";
                    if (!v144)
                      v95 = v94;
                    *(_DWORD *)buf = 67109634;
                    *(_DWORD *)v201 = v91;
                    *(_WORD *)&v201[4] = 1024;
                    *(_DWORD *)&v201[6] = v92;
                    *(_WORD *)&v201[10] = 2080;
                    *(_QWORD *)&v201[12] = v95;
                    _os_log_impl(&dword_20DC1A000, v90, OS_LOG_TYPE_DEFAULT, "DTLS Handshake timeout expired for participant [%08X] on channel [%d] DTLS state [%s].", buf, 0x18u);
                  }
                  v96 = *(_DWORD *)(v12 + 640);
                  v97 = gcks_log();
                  v98 = v97;
                  if (v96 == 1)
                  {
                    if (!os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
                      goto LABEL_223;
                    goto LABEL_208;
                  }
                  if (!os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
                    goto LABEL_212;
                  goto LABEL_210;
                case 11:
                  v74 = gcks_log();
                  if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
                  {
                    v75 = *(_DWORD *)(v12 + 88);
                    v76 = *(_DWORD *)(v12 + 72);
                    v77 = "Created";
                    switch(*(_DWORD *)(v12 + 376))
                    {
                      case 0:
                        break;
                      case 1:
                        v77 = "ICE";
                        break;
                      case 2:
                        v77 = "Connecting";
                        break;
                      case 3:
                        v77 = "Connected";
                        break;
                      case 4:
                        v77 = "Disconnected";
                        break;
                      default:
                        if ("Created" == 255)
                          v77 = "Invalid";
                        else
                          v77 = "?";
                        break;
                    }
                    *(_DWORD *)buf = 67109634;
                    *(_DWORD *)v201 = v75;
                    *(_WORD *)&v201[4] = 1024;
                    *(_DWORD *)&v201[6] = v76;
                    *(_WORD *)&v201[10] = 2080;
                    *(_QWORD *)&v201[12] = v77;
                    _os_log_impl(&dword_20DC1A000, v74, OS_LOG_TYPE_DEFAULT, "ICE timeout expired for participant [%08X] on channel [%d] state [%s].", buf, 0x18u);
                  }
                  v131 = *(_DWORD *)(v12 + 376);
                  v132 = gcks_log();
                  v98 = v132;
                  if (v131 == 3)
                  {
                    if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
                    {
LABEL_208:
                      v133 = *(_DWORD *)(v12 + 88);
                      v134 = *(_DWORD *)(v12 + 72);
                      *(_DWORD *)buf = 67109376;
                      *(_DWORD *)v201 = v133;
                      *(_WORD *)&v201[4] = 1024;
                      *(_DWORD *)&v201[6] = v134;
                      _os_log_impl(&dword_20DC1A000, v98, OS_LOG_TYPE_DEFAULT, "Participant [%08X] on channel [%d] already connected, ignore this timeout.", buf, 0xEu);
                    }
                    goto LABEL_223;
                  }
                  if (!os_log_type_enabled(v132, OS_LOG_TYPE_ERROR))
                    goto LABEL_212;
LABEL_210:
                  v135 = *(_DWORD *)(v12 + 88);
                  v136 = *(_DWORD *)(v12 + 72);
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)v201 = v135;
                  *(_WORD *)&v201[4] = 1024;
                  *(_DWORD *)&v201[6] = v136;
                  v112 = v98;
                  v113 = "Not in connected state, so giving up for participant [%08X] on channel [%d].";
                  v114 = 14;
                  break;
                default:
                  v82 = gcks_log();
                  if (!os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
                    goto LABEL_222;
                  v83 = *(_DWORD *)(v12 + 88);
                  v84 = *(_DWORD *)(v12 + 72);
                  v85 = "Created";
                  switch(*(_DWORD *)(v12 + 376))
                  {
                    case 0:
                      break;
                    case 1:
                      v85 = "ICE";
                      break;
                    case 2:
                      v85 = "Connecting";
                      break;
                    case 3:
                      v85 = "Connected";
                      break;
                    case 4:
                      v85 = "Disconnected";
                      break;
                    default:
                      if ("Created" == 255)
                        v85 = "Invalid";
                      else
                        v85 = "?";
                      break;
                  }
                  *(_DWORD *)buf = 67109634;
                  *(_DWORD *)v201 = v83;
                  *(_WORD *)&v201[4] = 1024;
                  *(_DWORD *)&v201[6] = v84;
                  *(_WORD *)&v201[10] = 2080;
                  *(_QWORD *)&v201[12] = v85;
                  v129 = v82;
                  v130 = "Unknown timeout expired for participant [%08X] on channel [%d] state [%s].";
LABEL_221:
                  _os_log_impl(&dword_20DC1A000, v129, OS_LOG_TYPE_DEFAULT, v130, buf, 0x18u);
                  goto LABEL_222;
              }
LABEL_211:
              _os_log_error_impl(&dword_20DC1A000, v112, OS_LOG_TYPE_ERROR, v113, buf, v114);
LABEL_212:
              gckSessionChangeStateCList(v2, v12);
              goto LABEL_223;
            }
            v58 = *((double *)v38 + 2);
            if (v10 >= v58 && *((_QWORD *)v38 + 5))
            {
              switch(v44)
              {
                case 1:
                  v59 = gcks_log();
                  if (!os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                    goto LABEL_137;
                  v60 = *((unsigned __int16 *)v38 + 28);
                  v61 = *(_DWORD *)(v12 + 88);
                  v62 = *(_DWORD *)(v12 + 72);
                  *(_DWORD *)buf = 67109632;
                  *(_DWORD *)v201 = v60;
                  *(_WORD *)&v201[4] = 1024;
                  *(_DWORD *)&v201[6] = v61;
                  *(_WORD *)&v201[10] = 1024;
                  *(_DWORD *)&v201[12] = v62;
                  v63 = v59;
                  v64 = "Retransmitting Hello with SN [%d] to participant [%08X] over channel [%d].";
                  goto LABEL_136;
                case 2:
                  v103 = gcks_log();
                  if (!os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
                    goto LABEL_137;
                  v104 = *((unsigned __int16 *)v38 + 28);
                  v105 = *(_DWORD *)(v12 + 88);
                  v106 = *(_DWORD *)(v12 + 72);
                  *(_DWORD *)buf = 67109632;
                  *(_DWORD *)v201 = v104;
                  *(_WORD *)&v201[4] = 1024;
                  *(_DWORD *)&v201[6] = v105;
                  *(_WORD *)&v201[10] = 1024;
                  *(_DWORD *)&v201[12] = v106;
                  v63 = v103;
                  v64 = "Retransmitting DD with SN [%d] to participant [%08X] over channel [%d].";
                  goto LABEL_136;
                case 4:
                  v99 = gcks_log();
                  if (!os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
                    goto LABEL_137;
                  v100 = *((unsigned __int16 *)v38 + 28);
                  v101 = *(_DWORD *)(v12 + 88);
                  v102 = *(_DWORD *)(v12 + 72);
                  *(_DWORD *)buf = 67109632;
                  *(_DWORD *)v201 = v100;
                  *(_WORD *)&v201[4] = 1024;
                  *(_DWORD *)&v201[6] = v101;
                  *(_WORD *)&v201[10] = 1024;
                  *(_DWORD *)&v201[12] = v102;
                  v63 = v99;
                  v64 = "Retransmitting LSA with SN [%d] to participant [%08X] over channel [%d].";
                  goto LABEL_136;
                case 8:
                  v107 = *(double *)(v12 + 360);
                  v108 = *(double *)(v12 + 48) + v107 * 0.5;
                  if (v108 >= *(double *)(v12 + 16) + v107 * 0.5)
                    v108 = *(double *)(v12 + 16) + v107 * 0.5;
                  *((double *)v38 + 2) = v108;
                  *((double *)v38 + 4) = v108 + v107 * 0.5;
                  v109 = gcks_log();
                  if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG))
                  {
                    v137 = *(_DWORD *)(v12 + 88);
                    v138 = *((_QWORD *)v38 + 2);
                    v139 = *((_QWORD *)v38 + 4);
                    *(_DWORD *)buf = 67109888;
                    *(_DWORD *)v201 = v137;
                    *(_WORD *)&v201[4] = 2048;
                    *(double *)&v201[6] = v10;
                    *(_WORD *)&v201[14] = 2048;
                    *(_QWORD *)&v201[16] = v138;
                    *(_WORD *)&v201[24] = 2048;
                    v202 = v139;
                    _os_log_debug_impl(&dword_20DC1A000, v109, OS_LOG_TYPE_DEBUG, "Heartbeat state for [%08X]: Now [%.3lf] NextFire [%.3lf] WaitUntil [%.3lf].", buf, 0x26u);
                  }
                  v110 = *((double *)v38 + 2);
                  if (v10 < v110)
                  {
                    v37 = v38 + 64;
                    if (v15 > v110)
                      v15 = *((double *)v38 + 2);
                    goto LABEL_223;
                  }
                  v116 = gcks_log();
                  if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
                  {
                    v117 = *((unsigned __int16 *)v38 + 28);
                    v118 = *(_DWORD *)(v12 + 88);
                    v119 = *(_DWORD *)(v12 + 72);
                    *(_DWORD *)buf = 67109632;
                    *(_DWORD *)v201 = v117;
                    *(_WORD *)&v201[4] = 1024;
                    *(_DWORD *)&v201[6] = v118;
                    *(_WORD *)&v201[10] = 1024;
                    *(_DWORD *)&v201[12] = v119;
                    v63 = v116;
                    v64 = "Retransmitting Heartbeat with SN [%d] to participant [%08X] over channel [%d].";
LABEL_136:
                    _os_log_impl(&dword_20DC1A000, v63, OS_LOG_TYPE_DEFAULT, v64, buf, 0x14u);
                  }
LABEL_137:
                  v120 = SendUDPPacketCList(v12, *((_QWORD *)v38 + 5), *((_DWORD *)v38 + 12), 0, 1);
                  v5 = v120;
                  if ((v120 & 0x80000000) == 0)
                  {
                    v121 = *v38;
LABEL_139:
                    if (v121 == 1 && *((_DWORD *)v38 + 6))
                    {
                      v58 = v13 + (double)(arc4random() & 0x7FFFFFFF) * 4.65661287e-10 * 0.005;
                      *((double *)v38 + 2) = v58;
                      --*((_DWORD *)v38 + 6);
                    }
                    else
                    {
                      *((_DWORD *)v38 + 6) = 0;
                      v122 = v10 + *((double *)v38 + 1);
                      v58 = v122 + (double)(arc4random() & 0x7FFFFFFF) * 4.65661287e-10 * 0.02;
                      v123 = *((double *)v38 + 1) + *((double *)v38 + 1);
                      *((double *)v38 + 1) = v123;
                      *((double *)v38 + 2) = v58;
                      if (v123 > 1.0)
                      {
                        *((double *)v38 + 1) = (double)(arc4random() & 0x7FFFFFFF) * 4.65661287e-10 * 0.02 + 1.0;
                        v58 = *((double *)v38 + 2);
                      }
                    }
                    goto LABEL_149;
                  }
                  if (v120 == -1072037876 || v120 == -1072037833)
                  {
                    v121 = *v38;
                    if (v120 == -1072037876 && v121 != 8)
                    {
                      *((double *)v38 + 4) = v10 + *((double *)v38 + 4) - *((double *)v38 + 2) + 0.5;
                      v58 = v10 + 0.5;
                      *((double *)v38 + 2) = v187;
                      v5 = -1072037876;
                      goto LABEL_149;
                    }
                    goto LABEL_139;
                  }
                  v121 = *v38;
                  if ((v121 == 8 || v121 == 1) && *(_DWORD *)(v12 + 80))
                  {
                    *(_DWORD *)(v12 + 80) = -1;
                    goto LABEL_139;
                  }
                  *v37 = *((_QWORD *)v38 + 8);
                  v127 = (void *)*((_QWORD *)v38 + 5);
                  if (v127)
                    free(v127);
                  free(v38);
                  if (v121 == 8)
                  {
LABEL_222:
                    attempt_failover(v2, (_DWORD *)v12);
                    goto LABEL_223;
                  }
                  v128 = gcks_log();
                  if (!os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
                    goto LABEL_212;
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)v201 = v5;
                  v112 = v128;
                  v113 = "SendUDPPacketCList failed with error (%X).";
                  break;
                default:
                  goto LABEL_137;
              }
              goto LABEL_131;
            }
LABEL_149:
            if (v10 < v58 || *v38 != 11)
              goto LABEL_154;
            v124 = gckSessionPerformDTLSHandshake(v2, v12);
            v5 = v124;
            if (*(_DWORD *)(v12 + 640) != 1)
            {
              if (v124 < 0)
              {
                *v37 = *((_QWORD *)v38 + 8);
                free(v38);
                v115 = gcks_log();
                if (!os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
                  goto LABEL_212;
                goto LABEL_162;
              }
              v5 = 0;
              v58 = v10 + *((double *)v38 + 1);
              *((double *)v38 + 2) = v58;
LABEL_154:
              if (v10 < v58 || *v38 != 12)
                goto LABEL_159;
              if (*(_DWORD *)(v12 + 376) != 3)
              {
                v58 = v10 + *((double *)v38 + 1);
                *((double *)v38 + 2) = v58;
LABEL_159:
                v37 = v38 + 64;
                if (v15 > v58)
                  v15 = v58;
                goto LABEL_223;
              }
            }
LABEL_157:
            *v37 = *((_QWORD *)v38 + 8);
            free(v38);
LABEL_223:
            v38 = (_BYTE *)*v37;
            if (!*v37)
              goto LABEL_224;
          }
          v5 = SendUDPPacketCList(v12, v39, *((_DWORD *)v38 + 12), 0, 1);
          v40 = gcks_log();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            v41 = gckWaitForString(*v38);
            v42 = *(_DWORD *)(v12 + 88);
            v43 = *(_DWORD *)(v12 + 72);
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)v201 = v41;
            *(_WORD *)&v201[8] = 1024;
            *(_DWORD *)&v201[10] = v42;
            *(_WORD *)&v201[14] = 1024;
            *(_DWORD *)&v201[16] = v43;
            *(_WORD *)&v201[20] = 1024;
            *(_DWORD *)&v201[22] = v5;
            _os_log_impl(&dword_20DC1A000, v40, OS_LOG_TYPE_DEFAULT, "Sent %s packet to participant %08X on channel %d with error %d.", buf, 0x1Eu);
          }
          if (v5 < 0)
          {
            if (v5 == -1072037876)
            {
              *((double *)v38 + 4) = v10 + *((double *)v38 + 4) - *((double *)v38 + 2) + 0.5;
              *((double *)v38 + 2) = v187;
              v5 = -1072037876;
              goto LABEL_73;
            }
            if (v5 != -1072037833)
            {
              v49 = *v38;
              if (v49 != 8 && v49 != 1 || !*(_DWORD *)(v12 + 80))
              {
                *v37 = *((_QWORD *)v38 + 8);
                free(*((void **)v38 + 5));
                free(v38);
                v111 = gcks_log();
                if (!os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
                  goto LABEL_212;
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)v201 = v5;
                v112 = v111;
                v113 = "Send UDP packet failed with error (%X).";
LABEL_131:
                v114 = 8;
                goto LABEL_211;
              }
              v50 = gcks_log();
              if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
              {
                v51 = gckWaitForString(*v38);
                v52 = *(_DWORD *)(v12 + 88);
                v53 = *(_DWORD *)(v12 + 72);
                *(_DWORD *)buf = 136315650;
                *(_QWORD *)v201 = v51;
                *(_WORD *)&v201[8] = 1024;
                *(_DWORD *)&v201[10] = v52;
                *(_WORD *)&v201[14] = 1024;
                *(_DWORD *)&v201[16] = v53;
                _os_log_impl(&dword_20DC1A000, v50, OS_LOG_TYPE_DEFAULT, "Failed to send %s packet to participant %08X. Will mark channel %d as invalid.", buf, 0x18u);
              }
              *(_DWORD *)(v12 + 80) = -1;
            }
          }
          if (*v38 == 1 && *((_DWORD *)v38 + 6))
          {
            *((double *)v38 + 2) = v13 + (double)(arc4random() & 0x7FFFFFFF) * 4.65661287e-10 * 0.005;
            *((double *)v38 + 4) = v10 + *((double *)v38 + 4);
            --*((_DWORD *)v38 + 6);
          }
          else
          {
            *((_DWORD *)v38 + 6) = 0;
            v46 = v10 + *((double *)v38 + 1);
            v47 = arc4random();
            *((double *)v38 + 4) = v10 + *((double *)v38 + 4);
            v48 = *((double *)v38 + 1) + *((double *)v38 + 1);
            *((double *)v38 + 1) = v48;
            *((double *)v38 + 2) = v46 + (double)(v47 & 0x7FFFFFFF) * 4.65661287e-10 * 0.02;
            if (v48 > 1.0)
              *((double *)v38 + 1) = (double)(arc4random() & 0x7FFFFFFF) * 4.65661287e-10 * 0.02 + 1.0;
          }
          goto LABEL_73;
        }
LABEL_224:
        v140 = *(double *)(v12 + 8);
        if (*(_DWORD *)(v12 + 56) && v140 == 0.0)
        {
          v141 = *v186;
          if (!*v186)
          {
LABEL_238:
            *(_QWORD *)(v12 + 600) = 0;
            pthread_mutex_unlock(v189);
            goto LABEL_239;
          }
          v142 = *v186;
          while (1)
          {
            v143 = *v142;
            v144 = v143 == 8 || v143 == 1;
            if (!v144)
              break;
            v142 = (unsigned __int8 *)*((_QWORD *)v142 + 8);
            if (!v142)
            {
              if (v141)
              {
                do
                {
                  v145 = (unsigned __int8 *)*((_QWORD *)v141 + 8);
                  v146 = (void *)*((_QWORD *)v141 + 5);
                  if (v146)
                    free(v146);
                  free(v141);
                  v141 = v145;
                }
                while (v145);
              }
              goto LABEL_238;
            }
          }
        }
        if (v140 == 0.0 || v140 > micro())
        {
          pthread_mutex_unlock(v189);
          if (*(_DWORD *)(v12 + 376) == 4)
          {
            v147 = gcks_log();
            if (os_log_type_enabled(v147, OS_LOG_TYPE_DEFAULT))
            {
              v148 = *(_DWORD *)v12;
              v149 = *(_DWORD *)(v12 + 72);
              v150 = *(_DWORD *)(v12 + 88);
              *(_DWORD *)buf = 67109632;
              *(_DWORD *)v201 = v148;
              *(_WORD *)&v201[4] = 1024;
              *(_DWORD *)&v201[6] = v149;
              *(_WORD *)&v201[10] = 1024;
              *(_DWORD *)&v201[12] = v150;
              _os_log_impl(&dword_20DC1A000, v147, OS_LOG_TYPE_DEFAULT, "Don't read from socket %d channel %d for disconnected participant %08X.", buf, 0x14u);
            }
          }
          else
          {
            v151 = *(_DWORD *)v12;
            if (__darwin_check_fd_set_overflow(*(_DWORD *)v12, &v193, 0))
              *(__int32_t *)((char *)v193.fds_bits + (((unint64_t)v151 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v151;
          }
          v14 = (uint64_t *)(v12 + 832);
          v152 = v185;
          if (*(_DWORD *)v12 > v185)
            v152 = *(_DWORD *)v12;
          v185 = v152;
          goto LABEL_250;
        }
        pthread_mutex_unlock(v189);
        v153 = gcks_log();
        if (os_log_type_enabled(v153, OS_LOG_TYPE_DEFAULT))
        {
          v154 = *(_DWORD *)(v12 + 88);
          v155 = *(_DWORD *)(v12 + 72);
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v201 = v154;
          *(_WORD *)&v201[4] = 1024;
          *(_DWORD *)&v201[6] = v155;
          _os_log_impl(&dword_20DC1A000, v153, OS_LOG_TYPE_DEFAULT, "Closing connection to participant [%08X] on channel [%d].", buf, 0xEu);
        }
LABEL_239:
        v14 = v188;
        *v188 = *(_QWORD *)(v12 + 832);
        gckSessionFreeCList(v12);
LABEL_250:
        v12 = *v14;
        if (!*v14)
          goto LABEL_255;
      }
    }
    v15 = v182;
LABEL_255:
    pthread_rwlock_unlock(v183);
    v158 = v15 - v10;
    if (v158 > 0.0)
    {
      v159 = dispatch_time(0, (uint64_t)(v158 * 1000000000.0));
      dispatch_source_set_timer(source, v159, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v158 / 10.0 * 1000000000.0));
      dispatch_resume(source);
      v192.tv_sec = (int)v158;
      v192.tv_usec = (int)((v158 - (double)(int)v158) * 1000000.0);
      v160 = select(v185 + 1, &v193, 0, 0, &v192);
      dispatch_suspend(source);
      v161 = micro();
      if (v160 == -1)
      {
        if (*__error() != 9)
        {
          v5 = *__error() | 0xC01A0000;
          v174 = gcks_log();
          if (os_log_type_enabled(v174, OS_LOG_TYPE_ERROR))
            gckSessionRecvProc_cold_3();
          goto LABEL_292;
        }
      }
      else
      {
        v162 = v161;
        if (v160)
          gettimeofday(&v191, 0);
        if (v162 > v15)
          v182 = micro() + 30.0;
        if (v160)
        {
          v163 = *(int *)(v2 + 16);
          if ((_DWORD)v163 != -1)
          {
            if (__darwin_check_fd_set_overflow(*(_DWORD *)(v2 + 16), &v193, 0))
            {
              if (((*(unsigned int *)((char *)v193.fds_bits + ((v163 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v163) & 1) != 0)
              {
                close(*(_DWORD *)(v2 + 16));
                *(_DWORD *)(v2 + 16) = -1;
                v164 = gcks_log();
                if (os_log_type_enabled(v164, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_20DC1A000, v164, OS_LOG_TYPE_DEFAULT, "Read condition for pGCKSession->sReset.", buf, 2u);
                }
              }
            }
          }
          pthread_rwlock_rdlock(v183);
          for (k = *v184; k; k = *(_QWORD *)(k + 832))
          {
            v166 = *(_DWORD *)k;
            if (__darwin_check_fd_set_overflow(*(_DWORD *)k, &v193, 0)
              && ((*(unsigned int *)((char *)v193.fds_bits + (((unint64_t)v166 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v166) & 1) != 0)
            {
              v192.tv_sec = 0;
              v192.tv_usec = 0;
              do
              {
                v167 = *(_DWORD *)k;
                if (!__darwin_check_fd_set_overflow(*(_DWORD *)k, &v193, 0)
                  || ((*(unsigned int *)((char *)v193.fds_bits + (((unint64_t)v167 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v167) & 1) == 0)
                {
                  break;
                }
                micro();
                v168 = gckSessionRecvMessage(v2, k);
                if (v168 < 0 && (v168 == -1072037831 || v168 == -2145779679))
                {
                  v169 = gcks_log();
                  if (os_log_type_enabled(v169, OS_LOG_TYPE_DEFAULT))
                  {
                    v170 = *(_DWORD *)k;
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)v201 = v170;
                    _os_log_impl(&dword_20DC1A000, v169, OS_LOG_TYPE_DEFAULT, "Socket %d is no longer connected.", buf, 8u);
                  }
                  pthread_mutex_lock((pthread_mutex_t *)(k + 768));
                  gckSessionChangeStateCList(v2, k);
                  pthread_mutex_unlock((pthread_mutex_t *)(k + 768));
                  break;
                }
              }
              while (select(v185 + 1, &v193, 0, 0, &v192) > 0);
            }
          }
LABEL_285:
          pthread_rwlock_unlock(v183);
        }
      }
    }
  }
  v5 = *__error() | 0xC01A0000;
  v177 = gcks_log();
  v176 = source;
  if (os_log_type_enabled(v177, OS_LOG_TYPE_ERROR))
    gckSessionRecvProc_cold_2();
  pthread_rwlock_unlock(v183);
LABEL_296:
  v178 = gcks_log();
  if (os_log_type_enabled(v178, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v201 = v5;
    _os_log_impl(&dword_20DC1A000, v178, OS_LOG_TYPE_DEFAULT, "RecvProc thread end (%X).", buf, 8u);
  }
  *(_DWORD *)(v2 + 7512) = 1;
  dispatch_resume(v176);
  dispatch_source_cancel(v176);
  dispatch_release(v176);
  CheckOutHandleDebug();
  return v5;
}

uint64_t gckSessionSendProc()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  BOOL v6;
  uint64_t v7;
  uint8_t *v8;
  NSObject *v9;
  uint64_t v11;
  timeval v12;
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  pthread_setname_np("com.apple.multipeerconnectivity.gcksession.sendproc");
  v0 = CheckInHandleDebug();
  if (!v0)
    return -2145779710;
  v1 = v0;
  v12.tv_sec = 0;
  *(_QWORD *)&v12.tv_usec = 0;
  while (!*(_DWORD *)(v1 + 4))
  {
    v2 = *(_QWORD *)(v1 + 408);
    if (v2 && *(_QWORD *)(v2 + 24))
    {
      pthread_mutex_lock((pthread_mutex_t *)(v1 + 7080));
      v3 = *(_QWORD *)(v1 + 408);
      v4 = *(_DWORD *)(v3 + 168);
      if (v4 < 1)
      {
        pthread_mutex_unlock((pthread_mutex_t *)(v1 + 7080));
      }
      else
      {
        v5 = 0;
        do
        {
          if (v4 <= 0x10)
          {
            *(_DWORD *)&buf[4 * v5++] = *(_DWORD *)(v3 + 4 * (v4 - 1) + 172);
            v4 = *(_DWORD *)(v3 + 168);
          }
          v6 = __OFSUB__(v4--, 1);
          *(_DWORD *)(v3 + 168) = v4;
        }
        while (!((v4 < 0) ^ v6 | (v4 == 0)));
        pthread_mutex_unlock((pthread_mutex_t *)(v1 + 7080));
        if (v5 >= 1)
        {
          v7 = v5;
          v8 = buf;
          do
          {
            HIDWORD(v11) = 1;
            BYTE2(v11) = 0;
            LOWORD(v11) = 0;
            (*(void (**)(_QWORD, uint8_t *, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(v1 + 408) + 24))(*(_QWORD *)(*(_QWORD *)(v1 + 408) + 32), v8, 0xFFFFFFFFLL, 0, 0, 0, 0, 0, v11);
            v8 += 4;
            --v7;
          }
          while (v7);
        }
      }
      HIDWORD(v11) = 1;
      BYTE2(v11) = 0;
      LOWORD(v11) = 0;
      (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(v1 + 408) + 24))(*(_QWORD *)(*(_QWORD *)(v1 + 408) + 32), 0, 0, 0, 0, 0, 0, 0, v11);
    }
    v12.tv_sec = 0;
    v12.tv_usec = 25000;
    select(0, 0, 0, 0, &v12);
  }
  v9 = gcks_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v14 = 0;
    _os_log_impl(&dword_20DC1A000, v9, OS_LOG_TYPE_DEFAULT, "SendProc thread end (%X).", buf, 8u);
  }
  *(_DWORD *)(v1 + 7516) = 1;
  CheckOutHandleDebug();
  return 0;
}

uint64_t gckSessionDisposeAllConnections(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  int v7;
  uint64_t v8;
  _DWORD *v9;
  uint64_t v10;
  int v11;
  pthread_rwlock_t *v13;
  uint8_t buf[416];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v13 = (pthread_rwlock_t *)(a1 + 7192);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 7192));
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 7080));
  v2 = *(unsigned int *)(a1 + 708);
  if ((int)v2 >= 1)
  {
    v3 = 0;
    v4 = a1 + 712;
    do
    {
      v5 = gcks_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_DWORD *)(v4 + 8 * v3);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v6;
        _os_log_impl(&dword_20DC1A000, v5, OS_LOG_TYPE_DEFAULT, "Disposing connection to participant %08X. Stop ICE check.", buf, 8u);
      }
      ICEStopConnectivityCheck();
      v7 = *(_DWORD *)(v4 + 8 * v3);
      v8 = *(unsigned int *)(a1 + 420);
      v9 = (_DWORD *)(a1 + 424);
      if ((int)v8 < 1)
      {
LABEL_8:
        gckSessionDisconnectParticipant(a1, v7, 0, 0, 1);
      }
      else
      {
        while (*v9 != v7)
        {
          v9 += 104;
          if (!--v8)
            goto LABEL_8;
        }
      }
      ++v3;
    }
    while (v3 != v2);
  }
  if ((_DWORD)v2)
    gckSessionCancelRecvUDPInternal(a1);
  memcpy(buf, (const void *)(a1 + 424), sizeof(buf));
  *(_DWORD *)&buf[284] = 0;
  gckSessionRequestLSAUpdateForNode((int *)buf);
  gckSessionSendLSA(a1, 1u, (uint64_t)buf, -1, 1);
  while (1)
  {
    v11 = *(_DWORD *)(a1 + 708);
    if (!v11)
      break;
    gckSessionDeleteNeighbor(a1, (int *)(a1 + 8 * v11 + 704));
  }
  *(_WORD *)(a1 + 696) = *(_WORD *)&buf[272];
  gckSessionUpdateRoutingTable(a1, v10);
  gckSessionHandleRemainingDisconnectedNodes(a1, 1);
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 7080));
  return pthread_rwlock_unlock(v13);
}

void gckSessionFreeCList(uint64_t a1)
{
  NSObject *v2;
  int v3;
  int v4;
  SSLContext *v5;
  const void *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  _DWORD v12[2];
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = gcks_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_DWORD *)(a1 + 88);
    v4 = *(_DWORD *)(a1 + 72);
    v12[0] = 67109376;
    v12[1] = v3;
    v13 = 1024;
    v14 = v4;
    _os_log_impl(&dword_20DC1A000, v2, OS_LOG_TYPE_DEFAULT, "Closing clist for participant [%08X] channel [%d].", (uint8_t *)v12, 0xEu);
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 768));
  v5 = *(SSLContext **)(a1 + 632);
  if (v5)
  {
    SSLClose(v5);
    CFRelease(*(CFTypeRef *)(a1 + 632));
    *(_QWORD *)(a1 + 632) = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 768));
  v6 = *(const void **)(a1 + 648);
  if (v6)
  {
    _Block_release(v6);
    *(_QWORD *)(a1 + 648) = 0;
  }
  v7 = *(_QWORD **)(a1 + 656);
  if (v7)
  {
    do
    {
      v8 = (_QWORD *)v7[525];
      free(v7);
      v7 = v8;
    }
    while (v8);
  }
  v9 = *(_QWORD **)(a1 + 600);
  if (v9)
  {
    do
    {
      v10 = (_QWORD *)v9[8];
      v11 = (void *)v9[5];
      if (v11)
        free(v11);
      free(v9);
      v9 = v10;
    }
    while (v10);
  }
  close(*(_DWORD *)a1);
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 768));
  free(*(void **)(a1 + 688));
  free((void *)a1);
}

uint64_t GCKSessionPrepareConnection(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  int v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t *v19;
  NSObject *global_queue;
  NSObject *v21;
  dispatch_time_t v22;
  double v23;
  NSObject *v24;
  int LocalInterfaceListWithOptions;
  int v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  unsigned int v32;
  uint64_t v33;
  int v34;
  int *v35;
  int *v36;
  __int128 *v37;
  __int128 v38;
  __int128 v39;
  int v40;
  int ai_family;
  _QWORD *v42;
  const char *v43;
  NSObject *v44;
  int v46;
  int v47;
  NSObject *v48;
  addrinfo *v49;
  addrinfo *v50;
  NSObject *v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  NSObject *v57;
  sockaddr *ai_addr;
  unsigned int v59;
  int v60;
  int v61;
  NSObject *v62;
  NSObject *v63;
  const char *v64;
  NSObject *v65;
  uint64_t v66;
  int v67;
  NSObject *v68;
  int v69;
  NSObject *v70;
  NSObject *v71;
  int **v72;
  int **v73;
  int *v74;
  double v75;
  uint64_t v76;
  uint64_t v77;
  double **v78;
  double *v79;
  NSObject *v80;
  int v81;
  int v82;
  int v83;
  int v84;
  NSObject *v85;
  uint64_t v86;
  uint64_t v87;
  NSObject *v88;
  uint64_t v89;
  NSObject *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  int **v98;
  pthread_rwlock_t *v99;
  int v100;
  int v101;
  uint64_t v102;
  uint64_t v103;
  _QWORD handler[5];
  int v105;
  _QWORD aBlock[5];
  uint64_t v107;
  int v108;
  int v109;
  int v110;
  uint8_t v111;
  char v112[7];
  addrinfo *v113;
  addrinfo v114;
  socklen_t v115;
  char v116[6];
  uint8_t v117[4];
  int v118[3];
  uint8_t v119[8];
  _BYTE v120[10];
  __int16 v121;
  _DWORD *v122;
  __int16 v123;
  int v124;
  uint8_t v125[4];
  int v126[3];
  sockaddr buf[10];
  uint64_t v128;
  uint8_t v129[4];
  uint64_t v130;
  uint64_t v131;

  v131 = *MEMORY[0x24BDAC8D0];
  v3 = CheckInHandleDebug();
  if (!v3)
    return 2149187586;
  v4 = v3;
  v107 = 0;
  *(_DWORD *)(v3 + 64) = 0;
  v5 = micro();
  v6 = dispatch_semaphore_create(0);
  v7 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 0x40000000;
  aBlock[2] = __GCKSessionPrepareConnection_block_invoke;
  aBlock[3] = &__block_descriptor_tmp;
  aBlock[4] = v6;
  v8 = _Block_copy(aBlock);
  pthread_mutex_lock((pthread_mutex_t *)(v4 + 80));
  v9 = 0;
  v10 = (_QWORD *)(v4 + 152);
  v11 = 16;
  do
  {
    if (*((_DWORD *)v10 - 2) == a2 && *v10)
    {
      pthread_mutex_unlock((pthread_mutex_t *)(v4 + 80));
      dispatch_release(v6);
      v12 = gcks_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)&buf[0].sa_len = 67109120;
        *(_DWORD *)&buf[0].sa_data[2] = a2;
        v13 = "Another PrepareConnection is already waiting for participant [%08X], bailing.";
LABEL_16:
        _os_log_impl(&dword_20DC1A000, v12, OS_LOG_TYPE_DEFAULT, v13, &buf[0].sa_len, 8u);
      }
LABEL_130:
      v14 = 2149187606;
      goto LABEL_131;
    }
    if (v11 == 16)
    {
      if (*v10)
        v11 = 16;
      else
        v11 = v9;
    }
    v10 += 2;
    ++v9;
  }
  while (v9 != 16);
  if (v11 == 16)
  {
    pthread_mutex_unlock((pthread_mutex_t *)(v4 + 80));
    dispatch_release(v6);
    v12 = gcks_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)&buf[0].sa_len = 67109120;
      *(_DWORD *)&buf[0].sa_data[2] = a2;
      v13 = "No empty signal block slot for participant [%08X].";
      goto LABEL_16;
    }
    goto LABEL_130;
  }
  v15 = gcks_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)&buf[0].sa_len = 67109376;
    *(_DWORD *)&buf[0].sa_data[2] = a2;
    *(_WORD *)&buf[0].sa_data[6] = 1024;
    *(_DWORD *)&buf[0].sa_data[8] = v11;
    _os_log_impl(&dword_20DC1A000, v15, OS_LOG_TYPE_DEFAULT, "Insert signal block for participant [%08X] at slot %d.", &buf[0].sa_len, 0xEu);
  }
  v16 = v4 + 16 * v11;
  *(_DWORD *)(v16 + 144) = a2;
  *(_QWORD *)(v16 + 152) = v8;
  pthread_mutex_unlock((pthread_mutex_t *)(v4 + 80));
  if (ICEStopConnectivityCheck() == -2146107370)
  {
    gckCallICEListRemoveSignalBlock(v4, a2);
    v17 = 0;
  }
  else
  {
    gckSessionCancelRecvUDPInternal(v4);
    pthread_rwlock_wrlock((pthread_rwlock_t *)(v4 + 7192));
    v18 = *(_QWORD *)(v4 + 7184);
    if (v18)
    {
      v19 = (uint64_t *)(v4 + 7184);
      do
      {
        if (*(_DWORD *)(v18 + 88) == a2)
        {
          *v19 = *(_QWORD *)(v18 + 832);
          gckSessionFreeCList(v18);
        }
        else
        {
          v19 = (uint64_t *)(v18 + 832);
        }
        v18 = *v19;
      }
      while (*v19);
    }
    pthread_rwlock_unlock((pthread_rwlock_t *)(v4 + 7192));
    global_queue = dispatch_get_global_queue(2, 0);
    v21 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 1uLL, global_queue);
    v17 = v21;
    if (v21)
    {
      handler[0] = v7;
      handler[1] = 0x40000000;
      handler[2] = __GCKSessionPrepareConnection_block_invoke_11;
      handler[3] = &__block_descriptor_tmp_12;
      v105 = a2;
      handler[4] = v4;
      dispatch_source_set_event_handler(v21, handler);
      v22 = dispatch_time(0, 10000000000);
      dispatch_source_set_timer(v17, v22, 0xFFFFFFFFFFFFFFFFLL, 0);
      dispatch_resume(v17);
    }
  }
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v6);
  if (v17)
  {
    dispatch_source_cancel(v17);
    dispatch_release(v17);
  }
  v23 = micro();
  v24 = gcks_log();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)&buf[0].sa_len = 134218240;
    *(double *)&buf[0].sa_data[2] = v23 - v5;
    *(_WORD *)&buf[0].sa_data[10] = 1024;
    *(_DWORD *)&buf[0].sa_data[12] = a2;
    _os_log_impl(&dword_20DC1A000, v24, OS_LOG_TYPE_DEFAULT, "ICE StopConnectivityCheck took (%0.6f seconds) for participant [%08X].", &buf[0].sa_len, 0x12u);
  }
  LocalInterfaceListWithOptions = GetLocalInterfaceListWithOptions();
  if (!LocalInterfaceListWithOptions)
  {
    FreeLocalInterfaceList();
    v85 = gcks_log();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
      GCKSessionPrepareConnection_cold_1(v85, v86, v87);
    goto LABEL_130;
  }
  v26 = LocalInterfaceListWithOptions;
  v27 = gcks_log();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)&buf[0].sa_len = 67109376;
    *(_DWORD *)&buf[0].sa_data[2] = v26;
    *(_WORD *)&buf[0].sa_data[6] = 1024;
    *(_DWORD *)&buf[0].sa_data[8] = a2;
    _os_log_impl(&dword_20DC1A000, v27, OS_LOG_TYPE_DEFAULT, "%d interfaces found for participant [%08X].", &buf[0].sa_len, 0xEu);
  }
  if (v26 < 1)
  {
    v101 = 0;
    goto LABEL_125;
  }
  v28 = 0;
  v100 = 0;
  v101 = 0;
  v99 = (pthread_rwlock_t *)(v4 + 7192);
  v98 = (int **)(v4 + 7184);
  v29 = v26;
  v102 = v4;
  v103 = v26;
  do
  {
    if ((*(_BYTE *)(v107 + 40 * v28 + 1) & 1) != 0 && *(_DWORD *)(v4 + 7536))
    {
      v30 = gcks_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = IPPORTToString();
        *(_DWORD *)v129 = 136315138;
        v130 = v31;
        _os_log_impl(&dword_20DC1A000, v30, OS_LOG_TYPE_DEFAULT, "AWDL is disabled. Will not create socket for %s.", v129, 0xCu);
      }
      goto LABEL_61;
    }
    v32 = if_nametoindex((const char *)(v107 + 40 * v28 + 4));
    v33 = v107;
    v34 = *(_DWORD *)(v4 + 400);
    v128 = 0;
    v115 = 0;
    memset(&v114, 0, sizeof(v114));
    v113 = 0;
    memset(buf, 0, sizeof(buf));
    v35 = (int *)malloc_type_calloc(1uLL, 0x348uLL, 0x10B0040FFDF9BCEuLL);
    if (!v35)
    {
      v44 = gcks_log();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        GCKSessionPrepareConnection_cold_3(v125, v126, v44);
      goto LABEL_61;
    }
    v36 = v35;
    v37 = (__int128 *)(v33 + 40 * v28);
    v35[22] = a2;
    v35[18] = v34;
    *((_QWORD *)v35 + 10) = -1;
    v35[94] = 0;
    v38 = *v37;
    v39 = v37[1];
    *((_QWORD *)v35 + 52) = *((_QWORD *)v37 + 4);
    *((_OWORD *)v35 + 24) = v38;
    *((_OWORD *)v35 + 25) = v39;
    v40 = *(_DWORD *)v37;
    if ((*(_DWORD *)v37 & 1) != 0)
      ai_family = 30;
    else
      ai_family = 2;
    memset(&v114.ai_socktype, 0, 40);
    v114.ai_flags = 5;
    v114.ai_family = ai_family;
    v114.ai_socktype = 2;
    v42 = (_QWORD *)(v33 + 40 * v28 + 20);
    if ((v40 & 1) != 0)
    {
      if (*v42 == *MEMORY[0x24BDAE878] && *(_QWORD *)(v33 + 40 * v28 + 28) == *(_QWORD *)(MEMORY[0x24BDAE878] + 8))
      {
LABEL_56:
        v43 = 0;
        goto LABEL_57;
      }
    }
    else if (!*(_DWORD *)v42)
    {
      goto LABEL_56;
    }
    v43 = (const char *)IPToString();
LABEL_57:
    __sprintf_chk(v116, 0, 6uLL, "%u", *(unsigned __int16 *)(v33 + 40 * v28 + 36));
    v46 = getaddrinfo(v43, v116, &v114, &v113);
    if (v46)
    {
      v47 = v46;
      v48 = gcks_log();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v119 = 67109120;
        *(_DWORD *)&v119[4] = v47 | 0xB01A0000;
        _os_log_error_impl(&dword_20DC1A000, v48, OS_LOG_TYPE_ERROR, "Getaddrinfo failed (%X).", v119, 8u);
      }
LABEL_60:
      free(v36);
      v4 = v102;
      v29 = v103;
      goto LABEL_61;
    }
    v49 = v113;
    if (!v113)
    {
      v51 = gcks_log();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        GCKSessionPrepareConnection_cold_4(&v111, v112, v51);
      goto LABEL_60;
    }
    v50 = v113;
    while (v50->ai_family != ai_family)
    {
      v50 = v50->ai_next;
      if (!v50)
      {
        ai_family = v113->ai_family;
        goto LABEL_71;
      }
    }
    v49 = v50;
LABEL_71:
    v52 = socket(ai_family, v49->ai_socktype, v49->ai_protocol);
    *v36 = v52;
    if (v52 == -1)
    {
      v56 = *__error();
      v57 = gcks_log();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v119 = 67109120;
        *(_DWORD *)&v119[4] = v56 | 0xC00F0000;
        _os_log_error_impl(&dword_20DC1A000, v57, OS_LOG_TYPE_ERROR, "Socket failed (%X).", v119, 8u);
      }
      freeaddrinfo(v113);
      goto LABEL_60;
    }
    v110 = 1;
    if ((v40 & 1) != 0)
    {
      setsockopt(v52, 41, 27, &v110, 4u);
      if ((*((_BYTE *)v37 + 1) & 1) != 0)
      {
        *(_DWORD *)v119 = 1;
        setsockopt(*v36, 0xFFFF, 4356, v119, 4u);
      }
      v53 = *v36;
      v54 = 41;
      v55 = 61;
    }
    else
    {
      *(_DWORD *)v119 = if_nametoindex((const char *)(v33 + 40 * v28 + 4));
      setsockopt(*v36, 0, 25, v119, 4u);
      setsockopt(*v36, 0, 7, &v110, 4u);
      v53 = *v36;
      v54 = 0;
      v55 = 20;
    }
    setsockopt(v53, v54, v55, &v110, 4u);
    v109 = 1;
    setsockopt(*v36, 0xFFFF, 4130, &v109, 4u);
    v108 = 500;
    setsockopt(*v36, 0xFFFF, 4230, &v108, 4u);
    ai_addr = v49->ai_addr;
    v59 = 16402;
    do
    {
      *(_WORD *)ai_addr->sa_data = bswap32(v59) >> 16;
      if (!bind(*v36, v49->ai_addr, v49->ai_addrlen))
      {
        freeaddrinfo(v113);
        goto LABEL_87;
      }
      --v59;
    }
    while ((unsigned __int16)v59 >= 0x4000u);
    *(_WORD *)ai_addr->sa_data = 0;
    v60 = bind(*v36, v49->ai_addr, v49->ai_addrlen);
    freeaddrinfo(v113);
    if (v60)
    {
      v61 = *__error();
      v62 = gcks_log();
      v29 = v103;
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v119 = 67109120;
        *(_DWORD *)&v119[4] = v61 | 0xC00F0000;
        v63 = v62;
        v64 = "Bind failed (%X) for all ports in range.";
        goto LABEL_117;
      }
      goto LABEL_94;
    }
LABEL_87:
    v115 = 128;
    v29 = v103;
    if (getsockname(*v36, buf, &v115) == -1)
    {
      v69 = *__error();
      v70 = gcks_log();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v119 = 67109120;
        *(_DWORD *)&v119[4] = v69 | 0xC01A0000;
        v63 = v70;
        v64 = "Getsockname failed (%X).";
LABEL_117:
        _os_log_error_impl(&dword_20DC1A000, v63, OS_LOG_TYPE_ERROR, v64, v119, 8u);
      }
LABEL_94:
      close(*v36);
      free(v36);
      v4 = v102;
      goto LABEL_61;
    }
    SAToIPPORT();
    *((_WORD *)v36 + 210) = WORD2(v128);
    v65 = gcks_log();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      v66 = IPPORTToString();
      v67 = *v36;
      *(_DWORD *)v119 = 67109890;
      *(_DWORD *)&v119[4] = a2;
      *(_WORD *)v120 = 2080;
      *(_QWORD *)&v120[2] = v66;
      v121 = 2080;
      v122 = v36 + 97;
      v123 = 1024;
      v124 = v67;
      _os_log_impl(&dword_20DC1A000, v65, OS_LOG_TYPE_DEFAULT, "For remoteID[%08X]: Start listening on %s (%s) sock %d.", v119, 0x22u);
    }
    *((_QWORD *)v36 + 46) = 0;
    *(_QWORD *)v119 = 0;
    *(_QWORD *)v120 = 0;
    if (pthread_mutexattr_init((pthread_mutexattr_t *)v119))
    {
      v68 = gcks_log();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        GCKSessionPrepareConnection_cold_5(v117, v118, v68);
      goto LABEL_94;
    }
    pthread_mutexattr_settype((pthread_mutexattr_t *)v119, 2);
    pthread_mutex_init((pthread_mutex_t *)v36 + 12, (const pthread_mutexattr_t *)v119);
    pthread_mutexattr_destroy((pthread_mutexattr_t *)v119);
    *((_QWORD *)v36 + 86) = malloc_type_calloc(0x10uLL, 0x1A0uLL, 0x10000405F3595DEuLL);
    *((_QWORD *)v36 + 45) = 0x404DFEB851EB851FLL;
    *((_QWORD *)v36 + 44) = *(_QWORD *)(v102 + 24);
    v36[19] = v32;
    v4 = v102;
    if ((ICEAddOneInterface() & 0x80000000) != 0)
    {
      gckSessionFreeCList((uint64_t)v36);
    }
    else
    {
      v71 = gcks_log();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)&buf[0].sa_len = 67109376;
        *(_DWORD *)&buf[0].sa_data[2] = a2;
        *(_WORD *)&buf[0].sa_data[6] = 1024;
        *(_DWORD *)&buf[0].sa_data[8] = 6;
        _os_log_impl(&dword_20DC1A000, v71, OS_LOG_TYPE_DEFAULT, "Added interface for participant [%08X]: proto %d.", &buf[0].sa_len, 0xEu);
      }
      pthread_rwlock_wrlock(v99);
      v72 = v98;
      do
      {
        v73 = v72;
        v74 = *v72;
        v72 = (int **)(*v72 + 208);
      }
      while (v74);
      *v73 = v36;
      pthread_mutex_lock((pthread_mutex_t *)v36 + 12);
      if (*(_DWORD *)(v102 + 7544))
        v75 = 13.0;
      else
        v75 = 1.0;
      v76 = *((_QWORD *)v36 + 75);
      if (v76)
      {
        while (1)
        {
          v77 = v76;
          if (*(_BYTE *)v76 == 12)
            break;
          v76 = *(_QWORD *)(v76 + 64);
          if (!v76)
          {
            v78 = (double **)(v77 + 64);
            goto LABEL_109;
          }
        }
        *(double *)(v76 + 8) = v75;
        *(_QWORD *)(v76 + 16) = 0;
        *(_QWORD *)(v76 + 32) = 0x4024000000000000;
        *(_DWORD *)(v76 + 52) = v36[22];
      }
      else
      {
        v78 = (double **)(v36 + 150);
LABEL_109:
        v79 = (double *)malloc_type_calloc(1uLL, 0x48uLL, 0x10200409EACE7F9uLL);
        *(_BYTE *)v79 = 12;
        v79[1] = v75;
        v79[2] = 0.0;
        v79[4] = 10.0;
        *((_DWORD *)v79 + 13) = v36[22];
        *v78 = v79;
      }
      v80 = gcks_log();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      {
        v81 = v36[22];
        v82 = v36[18];
        *(_DWORD *)&buf[0].sa_len = 67109376;
        *(_DWORD *)&buf[0].sa_data[2] = v81;
        *(_WORD *)&buf[0].sa_data[6] = 1024;
        *(_DWORD *)&buf[0].sa_data[8] = v82;
        _os_log_impl(&dword_20DC1A000, v80, OS_LOG_TYPE_DEFAULT, "Scheduling ICE connection timeout for participant [%08X] on channel [%d].", &buf[0].sa_len, 0xEu);
      }
      pthread_mutex_unlock((pthread_mutex_t *)v36 + 12);
      v83 = *(_DWORD *)(v102 + 16);
      if (v83 != -1)
      {
        *(_DWORD *)(v102 + 16) = -1;
        close(v83);
      }
      pthread_rwlock_unlock(v99);
      ++*(_DWORD *)(v102 + 400);
      ++v101;
      v100 = 1;
    }
LABEL_61:
    ++v28;
  }
  while (v28 != v29);
  if (v100)
  {
    pthread_rwlock_rdlock(v99);
    v84 = *(_DWORD *)(v4 + 16);
    if (v84 != -1)
    {
      *(_DWORD *)(v4 + 16) = -1;
      close(v84);
    }
    pthread_rwlock_unlock(v99);
  }
LABEL_125:
  FreeLocalInterfaceList();
  v88 = gcks_log();
  if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)&buf[0].sa_len = 67109376;
    *(_DWORD *)&buf[0].sa_data[2] = v101;
    *(_WORD *)&buf[0].sa_data[6] = 1024;
    *(_DWORD *)&buf[0].sa_data[8] = a2;
    _os_log_impl(&dword_20DC1A000, v88, OS_LOG_TYPE_DEFAULT, "%d valid interfaces found for participant [%08X].", &buf[0].sa_len, 0xEu);
  }
  if (!v101)
    goto LABEL_130;
  v89 = ICEGetCandidates();
  if ((v89 & 0x80000000) != 0)
  {
    v14 = v89;
    v91 = gcks_log();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
      GCKSessionPrepareConnection_cold_2(v14, v91, v92, v93, v94, v95, v96, v97);
  }
  else
  {
    v14 = 0;
  }
LABEL_131:
  CheckOutHandleDebug();
  return v14;
}

void gckCallICEListRemoveSignalBlock(uint64_t a1, int a2)
{
  pthread_mutex_t *v4;
  uint64_t v5;
  _QWORD *v6;
  NSObject *v7;
  NSObject *v8;
  void (**v9)(_QWORD);
  int v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = (pthread_mutex_t *)(a1 + 80);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 80));
  v5 = 0;
  v6 = (_QWORD *)(a1 + 152);
  while (*((_DWORD *)v6 - 2) != a2 || !*v6)
  {
    ++v5;
    v6 += 2;
    if (v5 == 16)
    {
      pthread_mutex_unlock(v4);
      goto LABEL_6;
    }
  }
  v8 = gcks_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 67109376;
    v11 = a2;
    v12 = 1024;
    v13 = v5;
    _os_log_impl(&dword_20DC1A000, v8, OS_LOG_TYPE_DEFAULT, "Remove signal block for participant [%08X] at slot %d.", (uint8_t *)&v10, 0xEu);
  }
  v9 = (void (**)(_QWORD))*v6;
  *v6 = 0;
  *((_DWORD *)v6 - 2) = -1;
  pthread_mutex_unlock(v4);
  if (v9)
  {
    v9[2](v9);
    _Block_release(v9);
    return;
  }
LABEL_6:
  v7 = gcks_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 67109120;
    v11 = a2;
    _os_log_impl(&dword_20DC1A000, v7, OS_LOG_TYPE_DEFAULT, "No signal block found for participant [%08X].", (uint8_t *)&v10, 8u);
  }
}

uint64_t gckSessionCancelRecvUDPInternal(uint64_t a1)
{
  pthread_mutex_t *v2;

  if (!a1)
    return 2149187588;
  v2 = (pthread_mutex_t *)(a1 + 7400);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 7400));
  *(_DWORD *)(a1 + 8) = 1;
  pthread_cond_broadcast((pthread_cond_t *)(a1 + 7464));
  pthread_mutex_unlock(v2);
  return 0;
}

uint64_t GCKSessionCertificateDecision(uint64_t a1, int a2, int a3)
{
  uint64_t v5;
  uint64_t v6;
  pthread_rwlock_t *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  int v12;
  NSObject *v13;
  int v14;
  int v15;
  uint64_t v16;
  void (**v17)(_QWORD);
  _DWORD v19[2];
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = CheckInHandleDebug();
  if (!v5)
    return 2149187586;
  v6 = v5;
  v7 = (pthread_rwlock_t *)(v5 + 7192);
  pthread_rwlock_rdlock((pthread_rwlock_t *)(v5 + 7192));
  v8 = *(_QWORD *)(v6 + 7184);
  if (v8)
  {
    v9 = 0;
    v10 = *(_QWORD *)(v6 + 7184);
    do
    {
      if (*(_DWORD *)(v10 + 88) == a2)
      {
        v11 = *(_DWORD *)(v10 + 80);
        if (v11 >= v9)
          v9 = v11 + 1;
      }
      v10 = *(_QWORD *)(v10 + 832);
    }
    while (v10);
    v12 = 0;
    do
    {
      if (*(_DWORD *)(v8 + 88) == a2)
      {
        pthread_mutex_lock((pthread_mutex_t *)(v8 + 768));
        if (*(_DWORD *)(v8 + 628) == 1 && *(_QWORD *)(v8 + 648))
        {
          if (a3)
          {
            v13 = gcks_log();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              v14 = *(_DWORD *)(v8 + 88);
              v15 = *(_DWORD *)(v8 + 72);
              v16 = *(_QWORD *)(v8 + 632);
              v19[0] = 67109888;
              v19[1] = v14;
              v20 = 1024;
              v21 = v15;
              v22 = 2048;
              v23 = v16;
              v24 = 2048;
              v25 = v8;
              _os_log_impl(&dword_20DC1A000, v13, OS_LOG_TYPE_DEFAULT, "Starting OSPF Hello protocol with participant [%08X] channelID [%d] DTLS context [%p] pCList [%p].", (uint8_t *)v19, 0x22u);
            }
            *(_DWORD *)(v8 + 80) = v9;
            *(_DWORD *)(v8 + 84) = v9++;
            v17 = (void (**)(_QWORD))_Block_copy(*(const void **)(v8 + 648));
            v12 = 1;
          }
          else
          {
            gckSessionChangeStateCList(v6, v8);
            v17 = 0;
          }
          *(_DWORD *)(v8 + 628) = 0;
          _Block_release(*(const void **)(v8 + 648));
          *(_QWORD *)(v8 + 648) = 0;
          pthread_mutex_unlock((pthread_mutex_t *)(v8 + 768));
          if (v17)
          {
            v17[2](v17);
            _Block_release(v17);
          }
        }
        else
        {
          if (!a3)
            gckSessionChangeStateCList(v6, v8);
          pthread_mutex_unlock((pthread_mutex_t *)(v8 + 768));
        }
      }
      v8 = *(_QWORD *)(v8 + 832);
    }
    while (v8);
    if (v12)
      gckSessionReconcileChannelPriority(v6, a2);
  }
  pthread_rwlock_unlock(v7);
  CheckOutHandleDebug();
  return 0;
}

uint64_t gckSessionChangeStateCList(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  _DWORD *v6;
  uint64_t v7;
  uint64_t result;
  unsigned int v9;
  int v10;
  NSObject *v12;
  const char *v13;
  int v14;
  int v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  NSObject *v23;
  int v24;
  int v25;
  NSObject *v26;
  int v27;
  int v28;
  NSObject *v29;
  int v30;
  int v31;
  int InterfacePriorityForCList;
  int v33;
  int v34;
  NSObject *v35;
  _BOOL4 v36;
  int v37;
  uint64_t v38;
  NSObject *v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  int v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  _DWORD *v49;
  uint64_t v50;
  _BOOL4 v51;
  int v52;
  _DWORD *v53;
  NSObject *v54;
  const char *v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  int *v59;
  int v60;
  uint64_t v61;
  _DWORD *v62;
  int v63;
  uint64_t v64;
  _DWORD *v65;
  NSObject *v66;
  int v67;
  _BOOL4 v68;
  uint64_t v69;
  uint64_t v70;
  uint8_t *v71;
  int v72;
  int v73;
  uint64_t i;
  uint64_t v75;
  pthread_mutex_t *v76;
  int v77;
  NSObject *v78;
  int v79;
  int v80;
  int v81;
  NSObject *v82;
  int v83;
  int v84;
  NSObject *v85;
  int v86;
  uint64_t v87;
  int v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  int v92;
  int v93;
  uint64_t v94;
  uint64_t v95;
  pthread_mutex_t *v96;
  int v97;
  int v98;
  int v99;
  int v100;
  uint8_t buf[4];
  _BYTE v102[10];
  _BYTE v103[10];
  __int16 v104;
  const char *v105;
  __int16 v106;
  const char *v107;
  uint64_t v108;

  v2 = MEMORY[0x24BDAC7A8](a1, a2);
  v5 = v4;
  v6 = (_DWORD *)v3;
  v7 = v2;
  v108 = *MEMORY[0x24BDAC8D0];
  result = 2149187628;
  v9 = *(_DWORD *)(v3 + 376);
  switch(v4)
  {
    case 0u:
      if (!v9)
      {
        *(double *)(v3 + 696) = micro();
        v10 = 1;
        goto LABEL_18;
      }
      return result;
    case 1u:
    case 2u:
      if (v9 == 1)
        v10 = 2;
      else
        v10 = *(_DWORD *)(v3 + 376);
      goto LABEL_11;
    case 3u:
      if (v9 <= 3)
        v10 = 3;
      else
        v10 = *(_DWORD *)(v3 + 376);
      goto LABEL_11;
    case 4u:
      if (v9 > 3 || v9 == 1)
        return result;
      v10 = 4;
      goto LABEL_18;
    default:
      v10 = 4;
LABEL_11:
      if (v9 == v10)
        return result;
LABEL_18:
      v12 = gcks_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        if (v5 > 5)
          v13 = "?";
        else
          v13 = off_24C840D80[v5];
        v14 = v6[22];
        v15 = v6[18];
        v16 = "Created";
        switch(v9)
        {
          case 0u:
            break;
          case 1u:
            v16 = "ICE";
            break;
          case 2u:
            v16 = "Connecting";
            break;
          case 3u:
            v16 = "Connected";
            break;
          case 4u:
            v16 = "Disconnected";
            break;
          default:
            if (v9 == 255)
              v16 = "Invalid";
            else
              v16 = "?";
            break;
        }
        v17 = "Created";
        switch(v10)
        {
          case 0:
            break;
          case 1:
            v17 = "ICE";
            break;
          case 2:
            v17 = "Connecting";
            break;
          case 3:
            v17 = "Connected";
            break;
          case 4:
            v17 = "Disconnected";
            break;
          default:
            if (v10 == 255)
              v17 = "Invalid";
            else
              v17 = "?";
            break;
        }
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)v102 = v14;
        *(_WORD *)&v102[4] = 1024;
        *(_DWORD *)&v102[6] = v15;
        *(_WORD *)v103 = 2080;
        *(_QWORD *)&v103[2] = v13;
        v104 = 2080;
        v105 = v16;
        v106 = 2080;
        v107 = v17;
        _os_log_impl(&dword_20DC1A000, v12, OS_LOG_TYPE_DEFAULT, "Participant %08X, channel [%d]: State Change with event %s: %s -> %s.", buf, 0x2Cu);
      }
      v6[94] = v10;
      if (v10 != 3)
      {
        if (v10 != 4)
          return 0;
        pthread_mutex_lock((pthread_mutex_t *)(v7 + 7080));
        if ((v9 & 0xFFFFFFFE) == 2 && !v6[20])
        {
          v43 = gcks_log();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            v44 = v6[18];
            v45 = v6[22];
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v102 = v44;
            *(_WORD *)&v102[4] = 1024;
            *(_DWORD *)&v102[6] = v45;
            _os_log_impl(&dword_20DC1A000, v43, OS_LOG_TYPE_DEFAULT, "The disconnected channel [%d] was the active channel for participant [%08X].", buf, 0xEu);
          }
          v99 = 1;
        }
        else
        {
          v99 = 0;
        }
        v96 = (pthread_mutex_t *)(v7 + 7080);
        v6[20] = -1;
        gckSessionReconcileChannelPriority(v7, v6[22]);
        v19 = *(_QWORD *)(v7 + 7184);
        if (v19)
        {
          v97 = 0;
          v20 = 0;
          v21 = 0;
          do
          {
            if ((_DWORD *)v19 != v6 && *(_DWORD *)(v19 + 88) == v6[22])
            {
              v22 = *(_DWORD *)(v19 + 376);
              switch(v22)
              {
                case 3:
                  if (!*(_DWORD *)(v19 + 80))
                  {
                    v26 = gcks_log();
                    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                    {
                      v27 = *(_DWORD *)(v19 + 72);
                      v28 = *(_DWORD *)(v19 + 88);
                      *(_DWORD *)buf = 67109376;
                      *(_DWORD *)v102 = v27;
                      *(_WORD *)&v102[4] = 1024;
                      *(_DWORD *)&v102[6] = v28;
                      _os_log_impl(&dword_20DC1A000, v26, OS_LOG_TYPE_DEFAULT, "Channel [%d] is active and connected for participant [%08X].", buf, 0xEu);
                    }
                    v99 = 0;
                    v97 = 1;
                  }
                  break;
                case 2:
                  v29 = gcks_log();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                  {
                    v30 = *(_DWORD *)(v19 + 72);
                    v31 = *(_DWORD *)(v19 + 88);
                    *(_DWORD *)buf = 67109376;
                    *(_DWORD *)v102 = v30;
                    *(_WORD *)&v102[4] = 1024;
                    *(_DWORD *)&v102[6] = v31;
                    _os_log_impl(&dword_20DC1A000, v29, OS_LOG_TYPE_DEFAULT, "Connection attempt in progress on channel [%d] for participant [%08X].", buf, 0xEu);
                  }
                  v20 = 1;
                  break;
                case 1:
                  v23 = gcks_log();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                  {
                    v24 = *(_DWORD *)(v19 + 72);
                    v25 = *(_DWORD *)(v19 + 88);
                    *(_DWORD *)buf = 67109376;
                    *(_DWORD *)v102 = v24;
                    *(_WORD *)&v102[4] = 1024;
                    *(_DWORD *)&v102[6] = v25;
                    _os_log_impl(&dword_20DC1A000, v23, OS_LOG_TYPE_DEFAULT, "ICE is still in progress on channel [%d] for participant [%08X].", buf, 0xEu);
                  }
                  v21 = 1;
                  break;
              }
            }
            v19 = *(_QWORD *)(v19 + 832);
          }
          while (v19);
        }
        else
        {
          v21 = 0;
          v20 = 0;
          v97 = 0;
        }
        v37 = 0;
        if (!v21 && !v20 && !v97)
        {
          v38 = *(unsigned int *)(v7 + 708);
          v39 = gcks_log();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            v40 = v6[22];
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v102 = v40;
            _os_log_impl(&dword_20DC1A000, v39, OS_LOG_TYPE_DEFAULT, "No connected or connecting cList to [%08X].", buf, 8u);
          }
          if ((int)v38 < 1)
          {
LABEL_78:
            v37 = 0;
          }
          else
          {
            v41 = 0;
            v42 = v7 + 712;
            while (*(_DWORD *)(v42 + v41) != v6[22])
            {
              v41 += 8;
              if (8 * v38 == v41)
                goto LABEL_78;
            }
            gckSessionDeleteNeighbor(v7, (int *)(v42 + v41));
            gckSessionUpdateRoutingTable(v7, v46);
            gckSessionRequestLSAUpdateForNode((int *)(v7 + 424));
            v37 = 1;
          }
        }
        v47 = *(unsigned int *)(v7 + 420);
        v98 = v37;
        if ((int)v47 < 1)
        {
LABEL_87:
          v51 = 0;
          v52 = 1;
        }
        else
        {
          v48 = v6[22];
          v49 = (_DWORD *)(v7 + 424);
          v50 = *(unsigned int *)(v7 + 420);
          while (*v49 != v48)
          {
            v49 += 104;
            if (!--v50)
              goto LABEL_87;
          }
          v53 = (_DWORD *)(v7 + 428);
          while (*(v53 - 1) != v48)
          {
            v53 += 104;
            if (!--v47)
            {
              v51 = 0;
              goto LABEL_93;
            }
          }
          v51 = *v53 != -1;
LABEL_93:
          v54 = gcks_log();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            v55 = "a";
            v56 = v6[22];
            if (!v51)
              v55 = "NO";
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)v102 = v55;
            *(_WORD *)&v102[8] = 1024;
            *(_DWORD *)v103 = v56;
            _os_log_impl(&dword_20DC1A000, v54, OS_LOG_TYPE_DEFAULT, "There is %s valid route to participant [%08X].", buf, 0x12u);
          }
          v52 = 0;
        }
        if ((v5 & 0xFFFFFFFE) == 4 && v99 && v9 == 3)
        {
          v57 = *(unsigned int *)(v7 + 708);
          if ((int)v57 < 1)
          {
            LODWORD(v58) = 0;
          }
          else
          {
            v58 = 0;
            v59 = (int *)(v7 + 712);
            while (1)
            {
              v60 = *v59;
              v59 += 2;
              if (v60 == v6[22])
                break;
              if (v57 == ++v58)
                goto LABEL_114;
            }
          }
          if ((_DWORD)v58 == (_DWORD)v57
            || (v61 = v7 + 712 + 8 * v58,
                v63 = *(_DWORD *)(v61 + 4),
                v62 = (_DWORD *)(v61 + 4),
                v63 == -1))
          {
LABEL_114:
            if (!v51)
              goto LABEL_134;
          }
          else
          {
            *v62 = -1;
            gckSessionUpdateRoutingTable(v7, v18);
            v64 = *(unsigned int *)(v7 + 420);
            if ((int)v64 < 1)
              goto LABEL_134;
            v65 = (_DWORD *)(v7 + 428);
            while (*(v65 - 1) != v6[22])
            {
              v65 += 104;
              if (!--v64)
                goto LABEL_134;
            }
            if (*v65 == -1)
              goto LABEL_134;
          }
          v66 = gcks_log();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
          {
            v67 = v6[22];
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v102 = v67;
            _os_log_impl(&dword_20DC1A000, v66, OS_LOG_TYPE_DEFAULT, "Remain (indirectly) connected to participant %08X.", buf, 8u);
          }
          gckSessionRequestLSAUpdateForNode((int *)(v7 + 424));
          gckSessionSendLSA(v7, *(_DWORD *)(v7 + 420), v7 + 424, v6[22], 0);
          v100 = 0;
          gckSessionFindAndRemoveDisconnectedNodes((_DWORD *)v7, (uint64_t)buf, &v100);
          v68 = v5 == 4;
          v69 = v100;
          if (v100 >= 1)
          {
            v70 = 0;
            do
            {
              v71 = &buf[416 * v70];
              v72 = *(_DWORD *)v71;
              v73 = *(_DWORD *)v71 == v6[22] && v68;
              gckSessionDisconnectParticipant(v7, *(_DWORD *)v71, v71 + 9, v71[8], v73);
              for (i = *(_QWORD *)(v7 + 7184); i; i = *(_QWORD *)(i + 832))
              {
                if (*(_DWORD *)(i + 88) == v72)
                  gckSessionScheduleCListClose(i, v73);
              }
              ++v70;
            }
            while (v70 != v69);
          }
          v75 = *(_QWORD *)(v7 + 7184);
          v76 = v96;
          if (v75)
          {
            v77 = v6[22];
            do
            {
              if (*(_DWORD *)(v75 + 88) == v77)
                gckSessionScheduleCListClose(v75, v68);
              v75 = *(_QWORD *)(v75 + 832);
            }
            while (v75);
          }
          goto LABEL_174;
        }
LABEL_134:
        if (v99)
        {
          if (!v51 || v9 != 2)
          {
LABEL_154:
            v85 = gcks_log();
            if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
            {
              v86 = v6[22];
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)v102 = v86;
              _os_log_impl(&dword_20DC1A000, v85, OS_LOG_TYPE_DEFAULT, "Disconnected from a participant %08X. Stop ICE check.", buf, 8u);
            }
            ICEStopConnectivityCheck();
            if (v52)
            {
              v87 = *(unsigned int *)(v7 + 708);
              v88 = v6[22];
              if ((int)v87 < 1)
              {
                v76 = (pthread_mutex_t *)(v7 + 7080);
                v81 = v98;
              }
              else
              {
                v89 = 0;
                v90 = v7 + 712;
                v91 = 8 * v87;
                v76 = (pthread_mutex_t *)(v7 + 7080);
                v81 = v98;
                while (*(_DWORD *)(v90 + v89) != v88)
                {
                  v89 += 8;
                  if (v91 == v89)
                    goto LABEL_171;
                }
                gckSessionDeleteNeighbor(v7, (int *)(v90 + v89));
                gckSessionRequestLSAUpdateForNode((int *)(v7 + 424));
                v88 = v6[22];
                v81 = 1;
              }
LABEL_171:
              gckSessionDisconnectParticipant(v7, v88, 0, 0, 1);
              goto LABEL_172;
            }
            v92 = gckSessionHandleDeletedNode((_DWORD *)v7, v6[22], (v5 & 0xFFFFFFFE) == 4);
            gckSessionSendLSA(v7, *(_DWORD *)(v7 + 420), v7 + 424, v6[22], 0);
            gckSessionHandleRemainingDisconnectedNodes(v7, 0);
            v76 = (pthread_mutex_t *)(v7 + 7080);
            if (v5 == 4 && v92 == -2145779690)
            {
              v93 = *(_DWORD *)(v7 + 420);
              if (v93 >= 1)
              {
                v94 = 0;
                v95 = 416 * v93;
                while (*(_DWORD *)(v7 + 424 + v94) != v6[22])
                {
                  v94 += 416;
                  if (v95 == v94)
                    goto LABEL_174;
                }
                gckSessionDeleteDisconnectedNode(v7, (int *)(v7 + v94 + 424));
              }
            }
LABEL_174:
            pthread_mutex_unlock(v76);
            return 0;
          }
        }
        else if (!v97 && !(v20 | v21) && !v51)
        {
          if (v9 == 3)
          {
            v78 = gcks_log();
            if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
            {
              v79 = v6[18];
              v80 = v6[22];
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)v102 = v79;
              *(_WORD *)&v102[4] = 1024;
              *(_DWORD *)&v102[6] = v80;
              _os_log_impl(&dword_20DC1A000, v78, OS_LOG_TYPE_DEFAULT, "Channel [%d] wasn't active for participant [%08X]. Keeping connection open.", buf, 0xEu);
            }
            v76 = (pthread_mutex_t *)(v7 + 7080);
            v81 = v98;
LABEL_172:
            if (v81)
              gckSessionSendLSA(v7, *(_DWORD *)(v7 + 420), v7 + 424, v6[22], 0);
            goto LABEL_174;
          }
          goto LABEL_154;
        }
        if (!v21 && ICEStopConnectivityCheck() != -2146107370)
          gckSessionCancelRecvUDPInternal(v7);
        v76 = (pthread_mutex_t *)(v7 + 7080);
        if (v99)
        {
          if (v51 && v9 == 2)
          {
            v82 = gcks_log();
            if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
            {
              v83 = v6[18];
              v84 = v6[22];
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)v102 = v83;
              *(_WORD *)&v102[4] = 1024;
              *(_DWORD *)&v102[6] = v84;
              _os_log_impl(&dword_20DC1A000, v82, OS_LOG_TYPE_DEFAULT, "Last channel [%d] closed for participant [%08X], but we are still indirectly connected.", buf, 0xEu);
            }
          }
        }
        gckSessionScheduleCListClose((uint64_t)v6, 1);
        goto LABEL_174;
      }
      InterfacePriorityForCList = gckSessionGetInterfacePriorityForCList(v7, (uint64_t)v6);
      if ((InterfacePriorityForCList - 3) >= 5)
      {
        v34 = InterfacePriorityForCList;
        v35 = gcks_log();
        v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
        v33 = 0;
        if (v36)
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v102 = v34;
          _os_log_impl(&dword_20DC1A000, v35, OS_LOG_TYPE_DEFAULT, "Unexpected interface interface priority [%d].", buf, 8u);
          v33 = 0;
        }
      }
      else
      {
        v33 = dword_20DC4CBA4[InterfacePriorityForCList - 3];
      }
      v6[95] = v33;
      gckSessionReconcileChannelPriority(v7, v6[22]);
      return 0;
  }
}

void gckSessionReconcileChannelPriority(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  int InterfacePriorityForCList;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v12;
  int v13;
  _DWORD *v14;
  NSObject *v15;
  int v16;
  int v17;
  int v18;
  NSObject *v19;
  int v20;
  NSObject *v21;
  _DWORD *v22;
  int v23;
  int v24;
  int v25;
  const char *v26;
  NSObject *v27;
  const char *v28;
  NSObject *v29;
  _BOOL4 v30;
  const char *v31;
  const char *v32;
  NSObject *v33;
  int v34;
  int v35;
  int v36;
  NSObject *v37;
  const char *v38;
  int v39;
  int v40;
  const char *v41;
  NSObject *v42;
  uint32_t v43;
  NSObject *v44;
  int v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  int v49;
  uint8_t buf[4];
  _BYTE v51[32];
  __int16 v52;
  const char *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v4 = gcks_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v51 = a2;
    _os_log_impl(&dword_20DC1A000, v4, OS_LOG_TYPE_DEFAULT, "Reconcile Channel Priority for participant [%08X].", buf, 8u);
  }
  v5 = *(_QWORD *)(a1 + 7184);
  if (!v5)
    goto LABEL_60;
  v6 = 0;
  InterfacePriorityForCList = 0;
  v8 = 0;
  v9 = 0;
  do
  {
    if (*(_DWORD *)(v5 + 88) == a2)
    {
      v10 = *(_DWORD *)(v5 + 80);
      if (*(_DWORD *)(v5 + 376) == 3 && v10 >= 0)
        ++v8;
      if (v10)
      {
        v6 = 1;
      }
      else
      {
        InterfacePriorityForCList = gckSessionGetInterfacePriorityForCList(a1, v5);
        v6 = 1;
        v9 = v5;
      }
    }
    v5 = *(_QWORD *)(v5 + 832);
  }
  while (v5);
  v46 = v9;
  v12 = *(_QWORD *)(a1 + 7184);
  if (!v12)
  {
    if (v6)
      goto LABEL_58;
LABEL_60:
    v44 = gcks_log();
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v51 = a2;
    v41 = "Couldn't find a clist for participant [%08X].";
    goto LABEL_62;
  }
  v47 = v6;
  v45 = InterfacePriorityForCList;
  v13 = 0;
  v14 = 0;
  v48 = a1;
  do
  {
    if (*(_DWORD *)(v12 + 88) == a2)
    {
      v15 = gcks_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = *(_DWORD *)(v12 + 72);
        v17 = *(_DWORD *)(v12 + 80);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v51 = v16;
        *(_WORD *)&v51[4] = 1024;
        *(_DWORD *)&v51[6] = v17;
        _os_log_impl(&dword_20DC1A000, v15, OS_LOG_TYPE_DEFAULT, "Channel [%d] priority [%d].", buf, 0xEu);
      }
      if (v8 && *(_DWORD *)(v12 + 376) != 3)
      {
        v27 = gcks_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = "Created";
          switch(*(_DWORD *)(v12 + 376))
          {
            case 0:
              break;
            case 1:
              v28 = "ICE";
              break;
            case 2:
              v28 = "Connecting";
              break;
            case 3:
              v28 = "Connected";
              break;
            case 4:
              v28 = "Disconnected";
              break;
            default:
              if ("Created" == 255)
                v28 = "Invalid";
              else
                v28 = "?";
              break;
          }
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)v51 = v28;
          _os_log_impl(&dword_20DC1A000, v27, OS_LOG_TYPE_DEFAULT, "Not in connected state, currently %s. Skipping.", buf, 0xCu);
        }
      }
      else if ((*(_DWORD *)(v12 + 80) & 0x80000000) == 0)
      {
        v18 = gckSessionGetInterfacePriorityForCList(a1, v12);
        if (!v18)
        {
          v19 = gcks_log();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            v20 = *(_DWORD *)(v12 + 384);
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)v51 = v12 + 388;
            *(_WORD *)&v51[8] = 1024;
            *(_DWORD *)&v51[10] = v20;
            _os_log_impl(&dword_20DC1A000, v19, OS_LOG_TYPE_DEFAULT, "Failed to find a valid priority for interface [%s] flags [%08X].", buf, 0x12u);
          }
        }
        v21 = gcks_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v49 = v13;
          v22 = v14;
          v23 = *(_DWORD *)(v12 + 72);
          v24 = *(_DWORD *)(v12 + 80);
          v25 = *(_DWORD *)(v12 + 384);
          v26 = GCKSessionInterfaceNameForPriority(v18);
          *(_DWORD *)buf = 136316418;
          *(_QWORD *)v51 = v12 + 388;
          *(_WORD *)&v51[8] = 1024;
          *(_DWORD *)&v51[10] = v23;
          v14 = v22;
          v13 = v49;
          *(_WORD *)&v51[14] = 1024;
          *(_DWORD *)&v51[16] = v24;
          *(_WORD *)&v51[20] = 1024;
          *(_DWORD *)&v51[22] = v25;
          a1 = v48;
          *(_WORD *)&v51[26] = 1024;
          *(_DWORD *)&v51[28] = v18;
          v52 = 2080;
          v53 = v26;
          _os_log_impl(&dword_20DC1A000, v21, OS_LOG_TYPE_DEFAULT, "Checking pCList if[%s] chan[%d] cList priority [%d] flags[%08X] interface priority [%d-%s].", buf, 0x2Eu);
        }
        if (v13 < v18)
          v14 = (_DWORD *)v12;
        if (v13 <= v18)
          v13 = v18;
      }
    }
    v12 = *(_QWORD *)(v12 + 832);
  }
  while (v12);
  if (!v47)
    goto LABEL_60;
  if (!v13)
  {
LABEL_58:
    v44 = gcks_log();
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v51 = a2;
    v41 = "Unknown interface for participant [%08X].";
LABEL_62:
    v42 = v44;
    goto LABEL_63;
  }
  v29 = gcks_log();
  v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
  if (!v14)
  {
    if (!v30)
      return;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v51 = a2;
    v41 = "No clist with iPriority >= 0 and interface priority < GCK_IF_PRIORITY_NONE for participant [%08X].";
    v42 = v29;
LABEL_63:
    v43 = 8;
    goto LABEL_64;
  }
  if (v30)
  {
    v31 = GCKSessionInterfaceNameForPriority(v45);
    v32 = GCKSessionInterfaceNameForPriority(v13);
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v51 = v45;
    *(_WORD *)&v51[4] = 2080;
    *(_QWORD *)&v51[6] = v31;
    *(_WORD *)&v51[14] = 1024;
    *(_DWORD *)&v51[16] = v13;
    *(_WORD *)&v51[20] = 2080;
    *(_QWORD *)&v51[22] = v32;
    _os_log_impl(&dword_20DC1A000, v29, OS_LOG_TYPE_DEFAULT, "Currently active clist priority %d-%s; highest interface priority %d-%s.",
      buf,
      0x22u);
  }
  if (v13 > v45)
  {
    if (v14[20])
    {
      if (v46)
      {
        v33 = gcks_log();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v34 = v14[18];
          v35 = *(_DWORD *)(v46 + 72);
          v36 = v14[20];
          *(_DWORD *)buf = 67109888;
          *(_DWORD *)v51 = v34;
          *(_WORD *)&v51[4] = 1024;
          *(_DWORD *)&v51[6] = 0;
          *(_WORD *)&v51[10] = 1024;
          *(_DWORD *)&v51[12] = v35;
          *(_WORD *)&v51[16] = 1024;
          *(_DWORD *)&v51[18] = v36;
          _os_log_impl(&dword_20DC1A000, v33, OS_LOG_TYPE_DEFAULT, "Interface Switch! Setting priority of channel [%d] to [%d] and [%d] to [%d].", buf, 0x1Au);
        }
        *(_DWORD *)(v46 + 80) = v14[20];
      }
      v14[20] = 0;
    }
    v37 = gcks_log();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = GCKSessionInterfaceNameForPriority(v13);
      v39 = v14[18];
      v40 = v14[96];
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)v51 = v38;
      *(_WORD *)&v51[8] = 2080;
      *(_QWORD *)&v51[10] = v14 + 97;
      *(_WORD *)&v51[18] = 1024;
      *(_DWORD *)&v51[20] = v39;
      *(_WORD *)&v51[24] = 1024;
      *(_DWORD *)&v51[26] = v40;
      v41 = "Now connected over interface [%s]; Active pCList: if[%s] chan[%d] flags[%08X].";
      v42 = v37;
      v43 = 34;
LABEL_64:
      _os_log_impl(&dword_20DC1A000, v42, OS_LOG_TYPE_DEFAULT, v41, buf, v43);
    }
  }
}

uint64_t GCKSessionEstablishConnection(uint64_t a1, int a2, int a3, int a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  _BOOL4 v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  int *v20;
  int v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  uint8_t buf[4];
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = 2149187603;
  v8 = CheckInHandleDebug();
  if (!v8)
    return 2149187586;
  v9 = v8;
  v10 = ICEGetCallInfoForConnectionData();
  if ((v10 & 0x80000000) != 0)
    goto LABEL_34;
  pthread_rwlock_rdlock((pthread_rwlock_t *)(v9 + 7192));
  for (i = *(_QWORD *)(v9 + 7184); i; i = *(_QWORD *)(i + 832))
  {
    if (*(_DWORD *)(i + 88) == a2)
    {
      pthread_mutex_lock((pthread_mutex_t *)(i + 768));
      *(_DWORD *)(i + 612) = a4;
      *(_DWORD *)(i + 620) = a3;
      if (a3)
        v12 = 1;
      else
        v12 = *(_QWORD *)(v9 + 7520) != 0;
      *(_DWORD *)(i + 616) = v12;
      if (a4)
        v12 = 1;
      *(_DWORD *)(i + 624) = v12;
      pthread_mutex_unlock((pthread_mutex_t *)(i + 768));
    }
  }
  pthread_rwlock_unlock((pthread_rwlock_t *)(v9 + 7192));
  if (*(_DWORD *)(v9 + 416))
  {
    v18 = gcks_log();
    v7 = 2149187616;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      GCKSessionEstablishConnection_cold_2();
    goto LABEL_35;
  }
  pthread_mutex_lock((pthread_mutex_t *)(v9 + 7080));
  v13 = *(unsigned int *)(v9 + 708);
  if ((int)v13 > 15)
  {
    v14 = gcks_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DC1A000, v14, OS_LOG_TYPE_DEFAULT, "Max number of nodes reached.", buf, 2u);
    }
    pthread_mutex_unlock((pthread_mutex_t *)(v9 + 7080));
    v15 = gcks_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      GCKSessionEstablishConnection_cold_1(v15, v16, v17);
    goto LABEL_35;
  }
  if ((int)v13 < 1)
  {
    LODWORD(v19) = 0;
  }
  else
  {
    v19 = 0;
    v20 = (int *)(v9 + 712);
    while (1)
    {
      v21 = *v20;
      v20 += 2;
      if (v21 == a2)
        break;
      if (v13 == ++v19)
        goto LABEL_28;
    }
  }
  if ((_DWORD)v19 == (_DWORD)v13)
  {
LABEL_28:
    v22 = v9 + 8 * v13;
    *(_DWORD *)(v22 + 712) = a2;
    *(_DWORD *)(v22 + 716) = -1;
    *(_DWORD *)(v9 + 708) = v13 + 1;
  }
  pthread_mutex_unlock((pthread_mutex_t *)(v9 + 7080));
  v23 = gcks_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v27 = a2;
    _os_log_impl(&dword_20DC1A000, v23, OS_LOG_TYPE_DEFAULT, "Update ICE role for participant %08X.", buf, 8u);
  }
  ICEUpdateRole();
  v10 = ICEStartConnectivityCheck();
  if ((v10 & 0x80000000) != 0)
  {
LABEL_34:
    v7 = v10;
LABEL_35:
    CheckOutHandleDebug();
    return v7;
  }
  gckSessionChangeState(v9, a2);
  CheckOutHandleDebug();
  v24 = gcks_log();
  v7 = 0;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v27 = a2;
    _os_log_impl(&dword_20DC1A000, v24, OS_LOG_TYPE_DEFAULT, "ICE started with participant %08X.", buf, 8u);
    return 0;
  }
  return v7;
}

uint64_t gckSessionChangeState(uint64_t a1, int a2)
{
  uint64_t v4;
  pthread_rwlock_t *v5;
  uint64_t i;

  v4 = 2149187606;
  v5 = (pthread_rwlock_t *)(a1 + 7192);
  pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 7192));
  for (i = *(_QWORD *)(a1 + 7184); i; i = *(_QWORD *)(i + 832))
  {
    if (*(_DWORD *)(i + 88) == a2)
    {
      pthread_mutex_lock((pthread_mutex_t *)(i + 768));
      v4 = gckSessionChangeStateCList(a1, i);
      pthread_mutex_unlock((pthread_mutex_t *)(i + 768));
    }
  }
  pthread_rwlock_unlock(v5);
  return v4;
}

uint64_t GCKSessionDisposeConnection(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;

  v3 = CheckInHandleDebug();
  if (!v3)
    return 2149187586;
  v4 = gckSessionChangeState(v3, a2);
  if ((v4 & 0x80000000) != 0)
  {
    v5 = gcks_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      GCKSessionDisposeConnection_cold_1();
  }
  CheckOutHandleDebug();
  return v4;
}

uint64_t GCKSessionDisposeAllConnections()
{
  uint64_t v0;

  v0 = CheckInHandleDebug();
  if (!v0)
    return 2149187586;
  gckSessionDisposeAllConnections(v0);
  CheckOutHandleDebug();
  return 0;
}

uint64_t GCKSessionSendTo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9, unsigned int a10, int a11)
{
  uint64_t v11;
  int v12;
  int v13;
  _DWORD *v14;
  _DWORD *v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  int *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  int *v27;
  uint64_t v28;
  _DWORD *v29;
  _DWORD *v30;
  uint64_t NextHop;
  uint64_t v32;
  NSObject *v33;
  int v34;
  uint64_t v35;
  _DWORD *v36;
  unsigned int *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  unsigned int *v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  unsigned int *v50;
  _DWORD *v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  int *v61;
  _QWORD v63[2];
  char *v64;
  os_log_t v65;
  __int128 v66;
  pthread_mutex_t *v67;
  unsigned int v68;
  int v69;
  unsigned int v70;
  int v71;
  uint64_t v72;
  int v73;
  int v74;
  int *v75;
  uint64_t v76;
  char *v77;
  _QWORD *v78;
  _OWORD v79[2];
  _DWORD v80[4];
  _DWORD v81[1024];
  uint64_t v82;

  v11 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v73 = v12;
  v74 = v13;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v75 = v22;
  v23 = v11;
  v82 = *MEMORY[0x24BDAC8D0];
  memset(v79, 0, sizeof(v79));
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v77 = (char *)v63 - v24;
  v76 = CheckInHandleDebug();
  if (!v76)
    return 2149187586;
  v63[0] = v23;
  v63[1] = v63;
  *(_QWORD *)&v79[0] = v19;
  DWORD2(v79[0]) = v17;
  if (v21 < 1)
  {
    v68 = -2145779666;
  }
  else
  {
    v71 = a11;
    v70 = a10;
    v69 = a9;
    v26 = v21;
    *(_QWORD *)&v25 = 67109120;
    v66 = v25;
    v72 = v21;
    v27 = v75;
    v28 = v76;
    v29 = v77;
    v30 = v15;
    do
    {
      NextHop = gckSessionFindNextHop(v28, *v27);
      *v29 = NextHop;
      if ((_DWORD)NextHop == -1)
      {
        v33 = gcks_log();
        NextHop = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
        if ((_DWORD)NextHop)
        {
          v34 = *v27;
          v81[0] = v66;
          v81[1] = v34;
          _os_log_impl(&dword_20DC1A000, v33, OS_LOG_TYPE_DEFAULT, "No next hop for participant [%08X] in the routing table.", (uint8_t *)v81, 8u);
        }
        if (v15)
          *v30 = -2145779666;
      }
      ++v30;
      ++v29;
      ++v27;
      --v26;
    }
    while (v26);
    v35 = 0;
    v67 = (pthread_mutex_t *)(v28 + 7080);
    v36 = v15 + 1;
    v37 = (unsigned int *)(v75 + 1);
    v38 = v77 + 4;
    v64 = (char *)(v28 + 433);
    v39 = 1;
    v68 = -2145779666;
    v40 = v72;
    do
    {
      v41 = *(_DWORD *)&v77[4 * v35];
      if (v41 == -1)
      {
        ++v35;
      }
      else
      {
        v78 = v63;
        MEMORY[0x24BDAC7A8](NextHop, v32);
        v45 = (unsigned int *)((char *)v63 - ((v44 + 15) & 0x7FFFFFFF0));
        *v45 = v75[v35];
        if (v15)
          v15[v35] = v43;
        ++v35;
        v46 = v71;
        if (v35 >= v42)
        {
          v52 = 1;
        }
        else
        {
          v47 = 1;
          v48 = v42;
          v49 = v38;
          v50 = v37;
          v51 = v36;
          do
          {
            if (*(_DWORD *)v49 == v41)
            {
              v52 = (v47 + 1);
              v45[(int)v47] = *v50;
              *(_DWORD *)v49 = v43;
              if (v15)
                *v51 = v43;
            }
            else
            {
              v52 = v47;
            }
            ++v51;
            ++v50;
            v49 += 4;
            --v48;
            v47 = v52;
          }
          while (v39 != v48);
        }
        v53 = v76;
        NextHop = OSPFMakeData((char *)v81, 4096, (uint64_t)v79, 0, v70, *(_DWORD *)(v76 + 416), v45, v52, *(uint64_t (**)(uint64_t, unsigned int *, uint64_t, char *, _QWORD, uint64_t, _QWORD, _QWORD, int))(*(_QWORD *)(v76 + 408) + 24), *(_QWORD *)(*(_QWORD *)(v76 + 408) + 32), v73, v74, v69);
        if ((int)NextHop < 1)
        {
          v54 = -2145779698;
        }
        else
        {
          NextHop = SendUDPPacketToParticipantChannelID(v53, (uint64_t)v81, NextHop, v41, v46, -1, 1);
          v54 = -2145779670;
          if ((_DWORD)NextHop == -2145779670)
          {
            v65 = (os_log_t)gcks_log();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
            {
              v80[0] = v66;
              v80[1] = v41;
              _os_log_impl(&dword_20DC1A000, v65, OS_LOG_TYPE_DEFAULT, "SendUDPPacket failed with error GCK_E_INVALIDSOCKET (nextHop == %08X).", (uint8_t *)v80, 8u);
            }
            pthread_mutex_lock(v67);
            v55 = *(_QWORD *)(v76 + 408);
            v56 = *(unsigned int *)(v55 + 168);
            if ((int)v56 < 1)
            {
              LODWORD(v57) = 0;
            }
            else
            {
              v57 = 0;
              while (*(_DWORD *)(v55 + 172 + 4 * v57) != v41)
              {
                if (v56 == ++v57)
                {
                  LODWORD(v57) = *(_DWORD *)(v55 + 168);
                  break;
                }
              }
            }
            if (v57 <= 0xF && (_DWORD)v57 == (_DWORD)v56)
            {
              *(_DWORD *)(v55 + 4 * v56 + 172) = v41;
              *(_DWORD *)(v55 + 168) = v56 + 1;
            }
            v58 = *(unsigned int *)(v76 + 420);
            v59 = v64;
            if ((int)v58 >= 1)
            {
              while (*(_DWORD *)(v59 - 9) != v41)
              {
                v59 += 416;
                if (!--v58)
                  goto LABEL_44;
              }
              PostEventCallback(v55, v41, 2, v59, *(v59 - 1), 0);
            }
LABEL_44:
            NextHop = pthread_mutex_unlock(v67);
          }
          else
          {
            v68 &= (int)NextHop >> 31;
            v54 = NextHop;
          }
        }
        v40 = v72;
        v60 = v72;
        v61 = v15;
        do
        {
          if (v15)
          {
            if (*v61 == -1)
              *v61 = v54;
          }
          ++v61;
          --v60;
        }
        while (v60);
      }
      ++v39;
      ++v36;
      ++v37;
      v38 += 4;
    }
    while (v35 != v40);
  }
  CheckOutHandleDebug();
  return v68;
}

uint64_t gckSessionFindNextHop(uint64_t a1, int a2)
{
  pthread_mutex_t *v4;
  uint64_t v5;
  unsigned int *v6;
  uint64_t v7;

  v4 = (pthread_mutex_t *)(a1 + 7080);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 7080));
  v5 = *(unsigned int *)(a1 + 420);
  if ((int)v5 < 1)
  {
LABEL_5:
    v7 = 0xFFFFFFFFLL;
  }
  else
  {
    v6 = (unsigned int *)(a1 + 428);
    while (*(v6 - 1) != a2)
    {
      v6 += 104;
      if (!--v5)
        goto LABEL_5;
    }
    v7 = *v6;
  }
  pthread_mutex_unlock(v4);
  return v7;
}

uint64_t GCKSessionRegisterReliableTransportCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = CheckInHandleDebug();
  if (!v5)
    return 2149187586;
  v6 = *(_QWORD *)(v5 + 408);
  *(_QWORD *)(v6 + 24) = a2;
  *(_QWORD *)(v6 + 32) = a3;
  CheckOutHandleDebug();
  return 0;
}

uint64_t GCKSessionStartEventCallbacks()
{
  uint64_t v0;
  uint64_t started;
  NSObject *v2;

  v0 = CheckInHandleDebug();
  if (!v0)
    return 2149187586;
  started = StartEventCallbackThread(*(_DWORD **)(v0 + 408));
  if ((started & 0x80000000) != 0)
  {
    v2 = gcks_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      GCKSessionStartEventCallbacks_cold_1();
  }
  CheckOutHandleDebug();
  return started;
}

uint64_t GCKSessionGetInterfacesForParticipant(uint64_t a1, int a2, _DWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  uint8_t buf[4];
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = CheckInHandleDebug();
  if (v5)
  {
    v6 = v5;
    v7 = gcks_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v15 = a2;
      _os_log_impl(&dword_20DC1A000, v7, OS_LOG_TYPE_DEFAULT, "Getting interfaces for participant %08X.", buf, 8u);
    }
    pthread_rwlock_rdlock((pthread_rwlock_t *)(v6 + 7192));
    v8 = *(_QWORD *)(v6 + 7184);
    if (v8)
    {
      v9 = 0;
      do
      {
        if (*(_DWORD *)(v8 + 88) == a2)
        {
          v9 |= *(_DWORD *)(v8 + 380);
          v10 = gcks_log();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            v11 = *(_DWORD *)(v8 + 380);
            *(_DWORD *)buf = 67109120;
            v15 = v11;
            _os_log_impl(&dword_20DC1A000, v10, OS_LOG_TYPE_DEFAULT, "Available interface type: %d.", buf, 8u);
          }
        }
        v8 = *(_QWORD *)(v8 + 832);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }
    pthread_rwlock_unlock((pthread_rwlock_t *)(v6 + 7192));
    CheckOutHandleDebug();
    v12 = gcks_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v15 = v9;
      _os_log_impl(&dword_20DC1A000, v12, OS_LOG_TYPE_DEFAULT, "All available interface types: %d.", buf, 8u);
    }
    *a3 = v9;
  }
  return 0;
}

uint64_t GCKSessionSetHeartbeatTimeout(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = 2149187586;
  v4 = CheckInHandleDebug();
  if (v4)
  {
    if (*(_DWORD *)(v4 + 64))
    {
      *(double *)(v4 + 48) = (double)a2 / 55.0;
      *(double *)(v4 + 56) = (double)a2;
      CheckOutHandleDebug();
      return 0;
    }
    else
    {
      return 2149187588;
    }
  }
  return v3;
}

CFMutableStringRef gckSessionPListCopyDetailedDescription(pthread_mutex_t *a1)
{
  pthread_mutex_t *v1;
  CFMutableStringRef Mutable;

  v1 = a1 + 12;
  pthread_mutex_lock(a1 + 12);
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  IPPORTToString();
  IPPORTToString();
  CFStringAppendF();
  pthread_mutex_unlock(v1);
  return Mutable;
}

CFMutableStringRef GCKSessionCopyDetailedDescription()
{
  uint64_t v0;
  uint64_t v1;
  CFMutableStringRef Mutable;
  const __CFArray *v3;
  pthread_rwlock_t *v4;
  pthread_mutex_t *i;
  CFMutableStringRef v6;
  CFMutableStringRef v7;

  v0 = CheckInHandleDebug();
  if (!v0)
    return 0;
  v1 = v0;
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  CFStringAppendF();
  CFStringAppendF();
  CFStringAppendF();
  v3 = *(const __CFArray **)(v1 + 7520);
  if (v3)
    CFArrayGetCount(v3);
  CFStringAppendF();
  CFStringAppendF();
  v4 = (pthread_rwlock_t *)(v1 + 7192);
  pthread_rwlock_rdlock((pthread_rwlock_t *)(v1 + 7192));
  if (*(_QWORD *)(v1 + 7184))
  {
    CFStringAppendF();
    for (i = *(pthread_mutex_t **)(v1 + 7184); i; i = (pthread_mutex_t *)i[13].__sig)
    {
      v6 = gckSessionPListCopyDetailedDescription(i);
      if (v6)
      {
        v7 = v6;
        CFStringAppendF();
        CFRelease(v7);
      }
    }
  }
  pthread_rwlock_unlock(v4);
  CheckOutHandleDebug();
  return Mutable;
}

uint64_t GCKSessionSetAWDLDisabled(uint64_t a1, int a2)
{
  uint64_t v3;

  v3 = CheckInHandleDebug();
  if (!v3)
    return 2149187586;
  *(_DWORD *)(v3 + 7536) = a2;
  CheckOutHandleDebug();
  return 0;
}

uint64_t GCKSessionSetPreferNCMOverEthernet(uint64_t a1, int a2)
{
  uint64_t v3;

  v3 = CheckInHandleDebug();
  if (!v3)
    return 2149187586;
  *(_DWORD *)(v3 + 7540) = a2;
  CheckOutHandleDebug();
  return 0;
}

uint64_t GCKSessionSetICETimeoutForced(uint64_t a1, int a2)
{
  uint64_t v3;

  v3 = CheckInHandleDebug();
  if (!v3)
    return 2149187586;
  *(_DWORD *)(v3 + 7544) = a2;
  CheckOutHandleDebug();
  return 0;
}

uint64_t GCKSessionCloseDirectConnectionsWithPeer(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = CheckInHandleDebug();
  if (!v3)
    return 2149187586;
  v4 = gckSessionChangeState(v3, a2);
  CheckOutHandleDebug();
  return v4;
}

uint64_t gckSessionSendICEPacket(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, __int128 *a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int *v17;
  int v18;
  int v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v10 = 2149187606;
  v11 = CheckInHandleDebug();
  if (!v11)
    return 2149187586;
  v12 = v11;
  if (a5)
  {
    if (a6)
    {
      v13 = gcks_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v22 = 136315394;
        v23 = IPPORTToString();
        v24 = 2080;
        v25 = IPPORTToString();
        _os_log_impl(&dword_20DC1A000, v13, OS_LOG_TYPE_DEFAULT, "Send ICE packet from %s to %s.", (uint8_t *)&v22, 0x16u);
      }
    }
  }
  v14 = 2149187585;
  if (!a5)
    goto LABEL_37;
  if (!a6)
    goto LABEL_37;
  v14 = 0;
  if (!a3 || !a4)
    goto LABEL_37;
  pthread_rwlock_rdlock((pthread_rwlock_t *)(v12 + 7192));
  v15 = *(_QWORD *)(v12 + 7184);
  if (!v15)
    goto LABEL_36;
  v16 = *(_DWORD *)a5 & 1;
  while ((*(_DWORD *)(v15 + 384) & 1) != v16)
  {
LABEL_23:
    if ((*(_DWORD *)(v15 + 384) & 1) != 0)
      goto LABEL_26;
    if (!*(_DWORD *)(v15 + 404))
      goto LABEL_31;
LABEL_32:
    v15 = *(_QWORD *)(v15 + 832);
    if (!v15)
      goto LABEL_36;
  }
  v17 = (int *)(v15 + 404);
  if (!v16)
  {
    v18 = *v17;
    if (v18 != *(_DWORD *)(a5 + 20))
    {
      if (!v18)
        goto LABEL_31;
      goto LABEL_32;
    }
    goto LABEL_22;
  }
  if (*(_QWORD *)v17 == *(_QWORD *)(a5 + 20) && *(_QWORD *)(v15 + 412) == *(_QWORD *)(a5 + 28))
  {
LABEL_22:
    if (*(unsigned __int16 *)(v15 + 420) == *(unsigned __int16 *)(a5 + 36))
      goto LABEL_35;
    goto LABEL_23;
  }
LABEL_26:
  if (*(_QWORD *)(v15 + 404) != *MEMORY[0x24BDAE878]
    || *(_QWORD *)(v15 + 412) != *(_QWORD *)(MEMORY[0x24BDAE878] + 8))
  {
    goto LABEL_32;
  }
LABEL_31:
  if (*(unsigned __int16 *)(v15 + 420) != *(unsigned __int16 *)(a5 + 36))
    goto LABEL_32;
LABEL_35:
  v10 = SendUDPPacketCList(v15, a3, a4, a6, 0);
LABEL_36:
  pthread_rwlock_unlock((pthread_rwlock_t *)(v12 + 7192));
  v14 = v10;
LABEL_37:
  CheckOutHandleDebug();
  return v14;
}

uint64_t gckSessionRecvICEPacketWithTimeout(uint64_t a1, int a2, void *a3, _DWORD *a4, uint64_t a5, uint64_t a6, _QWORD *a7, int a8)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  pthread_mutex_t *v19;
  _QWORD *v20;
  double v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  double v26;
  int v27;
  int v28;
  _QWORD *v29;
  size_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v39;
  void *__dst;
  timespec v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v15 = 2149187614;
  v16 = CheckInHandleDebug();
  if (!v16)
    return 2149187586;
  v17 = v16;
  __dst = a3;
  v18 = micro();
  v19 = (pthread_mutex_t *)(v17 + 7400);
  pthread_mutex_lock((pthread_mutex_t *)(v17 + 7400));
  if (*(_DWORD *)(v17 + 8))
  {
LABEL_3:
    if (!*(_DWORD *)(v17 + 12))
      *(_DWORD *)(v17 + 8) = 0;
    pthread_mutex_unlock((pthread_mutex_t *)(v17 + 7400));
    CheckOutHandleDebug();
  }
  else
  {
    v20 = (_QWORD *)(v17 + 7392);
    v21 = (double)a8 / 1000.0;
    while (1)
    {
      v41.tv_sec = 0;
      v41.tv_nsec = 0;
      v22 = *v20;
      if (*v20)
        break;
LABEL_13:
      v25 = v20;
      v26 = v21 - (micro() - v18);
      if (v26 < 0.0)
      {
        v39 = 0;
LABEL_33:
        if (*(_DWORD *)(v17 + 8))
          v15 = 2149187614;
        else
          v15 = v39;
        goto LABEL_3;
      }
      v41.tv_sec = (int)v26;
      v41.tv_nsec = (uint64_t)((v26 - (double)(int)v26) * 1000000000.0);
      ++*(_DWORD *)(v17 + 12);
      v27 = pthread_cond_timedwait_relative_np((pthread_cond_t *)(v17 + 7464), (pthread_mutex_t *)(v17 + 7400), &v41);
      --*(_DWORD *)(v17 + 12);
      if (v27)
      {
        v39 = v27 | 0xC01A0000;
        if (v27 == 60)
          v39 = -2145779689;
        goto LABEL_33;
      }
      v28 = *(_DWORD *)(v17 + 8);
      if (*(_DWORD *)v17)
      {
        if (v28)
          v39 = -2145779682;
        else
          v39 = 0;
        goto LABEL_33;
      }
      v20 = v25;
      if (v28)
        goto LABEL_3;
    }
    v23 = v20;
    v24 = *v20;
    if (a2)
    {
      while (*(_DWORD *)(v24 + 4108) != a2)
      {
        if (!*(_QWORD *)(v24 + 4200))
          goto LABEL_13;
        v23 = (_QWORD *)(v24 + 4200);
        v24 = *(_QWORD *)(v24 + 4200);
      }
      v22 = v24;
      v29 = v23;
    }
    else
    {
      v29 = v20;
    }
    v30 = *(int *)(v22 + 4104);
    *a4 = v30;
    memcpy(__dst, (const void *)v22, v30);
    v31 = *(_QWORD *)(v22 + 4144);
    v32 = *(_OWORD *)(v22 + 4128);
    *(_OWORD *)a5 = *(_OWORD *)(v22 + 4112);
    *(_OWORD *)(a5 + 16) = v32;
    *(_QWORD *)(a5 + 32) = v31;
    v34 = *(_OWORD *)(v22 + 4152);
    v33 = *(_OWORD *)(v22 + 4168);
    *(_QWORD *)(a6 + 32) = *(_QWORD *)(v22 + 4184);
    *(_OWORD *)a6 = v34;
    *(_OWORD *)(a6 + 16) = v33;
    if (a7)
      *a7 = *(_QWORD *)(v22 + 4192);
    v35 = gcks_log();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = IPPORTToString();
      v37 = IPPORTToString();
      *(_DWORD *)buf = 136315394;
      v43 = v36;
      v44 = 2080;
      v45 = v37;
      _os_log_impl(&dword_20DC1A000, v35, OS_LOG_TYPE_DEFAULT, "Received ICE packet from %s to %s.", buf, 0x16u);
    }
    *v29 = *(_QWORD *)(v22 + 4200);
    free((void *)v22);
    pthread_mutex_unlock(v19);
    CheckOutHandleDebug();
    return 0;
  }
  return v15;
}

uint64_t gckSessionConnectedCallback(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int i;
  unsigned int *v9;
  uint64_t v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _DWORD *v26;
  uint64_t v27;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const __CFAllocator *v40;
  _BOOL4 v41;
  int v42;
  uint64_t CListFromParticipantChanId;
  uint64_t v44;
  NSObject *v45;
  NSObject *v46;
  int v47;
  int v48;
  NSObject *v49;
  int v50;
  _BOOL4 v51;
  NSObject *v52;
  int v53;
  int v54;
  int v55;
  int v56;
  const __CFArray *v57;
  SSLContextRef v58;
  SSLContext *v59;
  OSStatus v60;
  OSStatus v61;
  NSObject *v62;
  int v63;
  NSObject *v64;
  const char *v65;
  NSObject *v66;
  NSObject *v67;
  int v68;
  uint32_t v69;
  OSStatus v70;
  OSStatus v71;
  NSObject *v72;
  int v73;
  OSStatus v74;
  OSStatus v75;
  NSObject *v76;
  int v77;
  NSObject *v78;
  int v79;
  int v80;
  uint64_t v81;
  NSObject *v82;
  int v83;
  OSStatus v84;
  OSStatus v85;
  NSObject *v86;
  int v87;
  NSObject *v88;
  int v89;
  OSStatus v90;
  OSStatus v91;
  NSObject *v92;
  int v93;
  SSLSessionOption v94;
  OSStatus v95;
  OSStatus v96;
  NSObject *v97;
  int v98;
  int v99;
  NSObject *v100;
  _BOOL4 v101;
  const char *v102;
  OSStatus v103;
  OSStatus v104;
  NSObject *v105;
  int v106;
  NSObject *v107;
  const char *CStringPtr;
  OSStatus v109;
  int v110;
  OSStatus v111;
  OSStatus v112;
  NSObject *v113;
  int v114;
  NSObject *v115;
  int v116;
  int v117;
  uint64_t v118;
  const __CFString *config;
  const __CFString *theString;
  int v121;
  uint64_t v122;
  pthread_rwlock_t *v123;
  int v124;
  uint8_t buf[8];
  uint64_t v126;
  uint64_t (*v127)(uint64_t);
  _BYTE v128[20];
  _BYTE v129[12];
  uint64_t v130;
  __int16 v131;
  int v132;
  uint8_t v133[4];
  int v134;
  __int16 v135;
  int v136;
  __int16 v137;
  uint64_t v138;
  __int16 v139;
  uint64_t v140;
  __int16 v141;
  uint64_t v142;
  __int16 v143;
  uint64_t v144;
  SSLCipherSuite ciphers[28];
  uint8_t v146[4];
  _BYTE v147[10];
  __int16 v148;
  _BYTE v149[10];
  uint64_t v150;
  _BOOL4 v151;
  uint64_t v152;

  v152 = *MEMORY[0x24BDAC8D0];
  v5 = CheckInHandleDebug();
  if (!v5)
    return 2149187586;
  v6 = v5;
  v123 = (pthread_rwlock_t *)(v5 + 7192);
  pthread_rwlock_rdlock((pthread_rwlock_t *)(v5 + 7192));
  v7 = *(_QWORD *)(v6 + 7184);
  for (i = 1; v7; v7 = *(_QWORD *)(v7 + 832))
  {
    if (*(_DWORD *)(v7 + 88) == a2)
    {
      v9 = (unsigned int *)(v7 + 68);
      while (!__ldxr(v9))
      {
        i = 1;
        if (!__stxr(1u, v9))
          goto LABEL_9;
      }
      i = 0;
      __clrex();
    }
LABEL_9:
    ;
  }
  pthread_rwlock_unlock(v123);
  if (a3)
  {
    v124 = a2;
    v11 = 0;
    v122 = v6;
    do
    {
      v12 = gcks_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_DWORD *)(a3 + 16);
        v14 = IPPORTToString();
        v15 = IPPORTToString();
        v16 = IPPORTToString();
        v17 = IPPORTToString();
        *(_DWORD *)buf = 67110914;
        *(_DWORD *)&buf[4] = v124;
        LOWORD(v126) = 1024;
        *(_DWORD *)((char *)&v126 + 2) = v13;
        HIWORD(v126) = 2080;
        v127 = (uint64_t (*)(uint64_t))v14;
        *(_WORD *)v128 = 2080;
        *(_QWORD *)&v128[2] = v15;
        v6 = v122;
        *(_WORD *)&v128[10] = 2080;
        *(_QWORD *)&v128[12] = v16;
        *(_WORD *)v129 = 2080;
        *(_QWORD *)&v129[2] = v17;
        *(_WORD *)&v129[10] = 2080;
        v130 = a3 + 32;
        v131 = 1024;
        v132 = i;
        _os_log_impl(&dword_20DC1A000, v12, OS_LOG_TYPE_DEFAULT, "ICE check succeeded with participant %08X: proto %d local[%s], src[%s] <-> dst[%s], remote[%s] (on interface[%s]), first ICE result [%d].", buf, 0x46u);
      }
      if (*(_DWORD *)(a3 + 16) == 6)
      {
        v18 = gcks_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20DC1A000, v18, OS_LOG_TYPE_DEFAULT, "Proto GCK found.", buf, 2u);
        }
        if (!v11)
          v11 = a3;
      }
      a3 = *(_QWORD *)(a3 + 304);
    }
    while (a3);
    a2 = v124;
    if (v11)
    {
      v19 = gcks_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = *(_DWORD *)(v6 + 416);
        v21 = IPPORTToString();
        v22 = IPPORTToString();
        v23 = IPPORTToString();
        v24 = IPPORTToString();
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)&buf[4] = v124;
        LOWORD(v126) = 1024;
        *(_DWORD *)((char *)&v126 + 2) = v20;
        HIWORD(v126) = 2080;
        v127 = (uint64_t (*)(uint64_t))v21;
        *(_WORD *)v128 = 2080;
        *(_QWORD *)&v128[2] = v22;
        *(_WORD *)&v128[10] = 2080;
        *(_QWORD *)&v128[12] = v23;
        a2 = v124;
        *(_WORD *)v129 = 2080;
        *(_QWORD *)&v129[2] = v24;
        _os_log_impl(&dword_20DC1A000, v19, OS_LOG_TYPE_DEFAULT, "ICE completed with participant %08X (I am %08X): local[%s], src[%s] <-> dst[%s], remote[%s].", buf, 0x36u);
      }
      v25 = v11;
      do
      {
        if (*(_DWORD *)(v25 + 16) != 6)
          goto LABEL_43;
        v26 = (_DWORD *)(v25 + 28);
        pthread_rwlock_wrlock(v123);
        v27 = *(_QWORD *)(v122 + 7184);
        if (!v27)
        {
LABEL_39:
          pthread_rwlock_unlock(v123);
          v29 = gcks_log();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            v30 = IPPORTToString();
            v31 = IPPORTToString();
            v32 = IPPORTToString();
            v33 = IPPORTToString();
            *(_DWORD *)v133 = 67110402;
            v134 = -1;
            v135 = 1024;
            v136 = v124;
            v137 = 2080;
            v138 = v30;
            v139 = 2080;
            v140 = v31;
            v141 = 2080;
            v142 = v32;
            v143 = 2080;
            v144 = v33;
            _os_log_impl(&dword_20DC1A000, v29, OS_LOG_TYPE_DEFAULT, "Failed to setup channel %d with participant %08X: local[%s], src[%s] <-> dst[%s], remote[%s].", v133, 0x36u);
          }
          *(_DWORD *)v25 = -1;
          goto LABEL_42;
        }
        while (1)
        {
          if ((*(_DWORD *)(v27 + 84) & 0x80000000) == 0
            || *(_DWORD *)(v27 + 88) != a2
            || (*v26 & 1) != (*(_DWORD *)(v27 + 384) & 1))
          {
            goto LABEL_38;
          }
          if ((*v26 & 1) != 0)
          {
            if (*(_QWORD *)(v25 + 48) != *(_QWORD *)(v27 + 404) || *(_QWORD *)(v25 + 56) != *(_QWORD *)(v27 + 412))
              goto LABEL_38;
          }
          else if (*(_DWORD *)(v25 + 48) != *(_DWORD *)(v27 + 404))
          {
            goto LABEL_38;
          }
          if (*(unsigned __int16 *)(v25 + 64) == *(unsigned __int16 *)(v27 + 420))
            break;
LABEL_38:
          v27 = *(_QWORD *)(v27 + 832);
          if (!v27)
            goto LABEL_39;
        }
        v34 = gcks_log();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v121 = *(_DWORD *)(v27 + 72);
          v35 = IPPORTToString();
          v36 = IPPORTToString();
          v37 = IPPORTToString();
          v38 = IPPORTToString();
          *(_DWORD *)v133 = 67110402;
          v134 = v121;
          v135 = 1024;
          v136 = v124;
          v137 = 2080;
          v138 = v35;
          v139 = 2080;
          v140 = v36;
          v141 = 2080;
          v142 = v37;
          v143 = 2080;
          v144 = v38;
          _os_log_impl(&dword_20DC1A000, v34, OS_LOG_TYPE_DEFAULT, "Setup channel %d with participant %08X: local[%s], src[%s] <-> dst[%s], remote[%s].", v133, 0x36u);
        }
        gckSessionUpdateDstIPPortAndSockAddrForCList(v27, (__int128 *)(v25 + 148));
        *(_DWORD *)(v27 + 84) = 0;
        *(_DWORD *)(v27 + 608) = *(_DWORD *)(v25 + 268);
        *(double *)(v27 + 704) = micro();
        *(_DWORD *)(v27 + 712) = 1;
        *(_DWORD *)v25 = *(_DWORD *)(v27 + 72);
        if (!*(_DWORD *)(v27 + 68))
          *(_DWORD *)(v27 + 68) = 1;
        pthread_rwlock_unlock(v123);
LABEL_42:
        a2 = v124;
LABEL_43:
        v25 = *(_QWORD *)(v25 + 304);
      }
      while (v25);
      v6 = v122;
      gckSessionUpdateNode(v122, a2, *(_DWORD *)(v11 + 268), 0);
      if (i)
        gckSessionChangeState(v122, a2);
      v40 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      theString = (const __CFString *)*MEMORY[0x24BDE8F28];
      config = (const __CFString *)*MEMORY[0x24BDE8F30];
      while (1)
      {
        if (*(_DWORD *)(v11 + 16) == 6)
        {
          v41 = (*(_BYTE *)(v11 + 28) & 4) == 0 && ((*(_DWORD *)(v11 + 68) >> 2) & 1) == 0;
          v42 = *(_DWORD *)v11;
          pthread_rwlock_rdlock(v123);
          CListFromParticipantChanId = FindCListFromParticipantChanId(v6, v124, v42);
          if (!CListFromParticipantChanId)
          {
            v66 = gcks_log();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v124;
              LOWORD(v126) = 1024;
              *(_DWORD *)((char *)&v126 + 2) = v42;
              _os_log_error_impl(&dword_20DC1A000, v66, OS_LOG_TYPE_ERROR, "Something is terribly wrong; no clist for remoteID [%d] channelID [%d].",
                buf,
                0xEu);
            }
            goto LABEL_96;
          }
          v44 = CListFromParticipantChanId;
          if ((v42 & 0x80000000) == 0)
          {
            v45 = gcks_log();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v124;
              LOWORD(v126) = 1024;
              *(_DWORD *)((char *)&v126 + 2) = v42;
              _os_log_impl(&dword_20DC1A000, v45, OS_LOG_TYPE_DEFAULT, "Connected to participant %08X on channel %d.", buf, 0xEu);
            }
            if (v41)
            {
              v46 = gcks_log();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&buf[4] = v42;
                _os_log_impl(&dword_20DC1A000, v46, OS_LOG_TYPE_DEFAULT, "Quick disconnect enabled on channel %d.", buf, 8u);
              }
              *(_QWORD *)(v44 + 360) = *(_QWORD *)(v6 + 56);
            }
          }
          v47 = *(_DWORD *)(v6 + 416);
          v48 = *(_DWORD *)(v44 + 88);
          *(_QWORD *)buf = MEMORY[0x24BDAC760];
          v126 = 0x40000000;
          v127 = __gckSessionSetupChannelWithDTLS_block_invoke;
          *(_QWORD *)v128 = &__block_descriptor_tmp_87;
          *(_QWORD *)&v128[8] = v6;
          *(_DWORD *)&v128[16] = v124;
          *(_DWORD *)v129 = v42;
          *(_DWORD *)&v129[4] = v47;
          *(_DWORD *)&v129[8] = v48;
          if (*(_DWORD *)(v44 + 624))
          {
            v49 = gcks_log();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v146 = 0;
              _os_log_impl(&dword_20DC1A000, v49, OS_LOG_TYPE_DEFAULT, "Initialization. Changing state to DTLSNotConnected.", v146, 2u);
            }
            *(_DWORD *)(v44 + 640) = 0;
            v50 = *(_QWORD *)(v6 + 7520) != 0;
            v51 = v50;
            if (*(_DWORD *)(v44 + 620) == v50)
              v51 = *(_DWORD *)(v44 + 88) < *(_DWORD *)(v6 + 416);
            v52 = gcks_log();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
            {
              v53 = *(_DWORD *)(v44 + 88);
              v54 = *(_DWORD *)(v44 + 616);
              v55 = *(_DWORD *)(v44 + 612);
              v56 = *(_DWORD *)(v44 + 620);
              *(_DWORD *)v146 = 67110400;
              *(_DWORD *)v147 = v53;
              *(_WORD *)&v147[4] = 1024;
              *(_DWORD *)&v147[6] = v54;
              v148 = 1024;
              *(_DWORD *)v149 = v55;
              *(_WORD *)&v149[4] = 1024;
              *(_DWORD *)&v149[6] = v50;
              LOWORD(v150) = 1024;
              *(_DWORD *)((char *)&v150 + 2) = v56;
              HIWORD(v150) = 1024;
              v151 = v51;
              _os_log_impl(&dword_20DC1A000, v52, OS_LOG_TYPE_DEFAULT, "DTLS Settings for participant [%08X]: authentication [%d] encryption [%d] localIdentitySet [%d] remoteIdentitySet [%d], isServer [%d].", v146, 0x26u);
            }
            v57 = *(const __CFArray **)(v6 + 7520);
            pthread_mutex_lock((pthread_mutex_t *)(v44 + 768));
            v58 = SSLCreateContext(v40, (SSLProtocolSide)!v51, kSSLDatagramType);
            if (v58)
            {
              v59 = v58;
              *(_QWORD *)(v44 + 632) = v58;
              *(_QWORD *)(v44 + 648) = _Block_copy(buf);
              v60 = SSLSetMaxDatagramRecordSize(v59, 0x4C7uLL);
              if (v60)
              {
                v61 = v60;
                v62 = gcks_log();
                if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                {
                  v63 = *(_DWORD *)(v44 + 88);
                  *(_DWORD *)v146 = 67109376;
                  *(_DWORD *)v147 = v63;
                  *(_WORD *)&v147[4] = 1024;
                  *(_DWORD *)&v147[6] = v61;
                  v64 = v62;
                  v65 = "Failed to set maximum datagram size for participant [%08X] with error %d.";
                  goto LABEL_91;
                }
LABEL_93:
                pthread_mutex_unlock((pthread_mutex_t *)(v44 + 768));
                v78 = gcks_log();
                if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
                {
                  v79 = *(_DWORD *)(v44 + 88);
                  v80 = *(_DWORD *)(v44 + 72);
                  v81 = *(_QWORD *)(v44 + 632);
                  *(_DWORD *)v146 = 67109888;
                  *(_DWORD *)v147 = v79;
                  *(_WORD *)&v147[4] = 1024;
                  *(_DWORD *)&v147[6] = v80;
                  v148 = 2048;
                  *(_QWORD *)v149 = v81;
                  *(_WORD *)&v149[8] = 2048;
                  v150 = v44;
                  _os_log_error_impl(&dword_20DC1A000, v78, OS_LOG_TYPE_ERROR, "SetupDTLSContext failed for participant [%08X] channelID [%d] DTLS context [%p] pCList [%p].", v146, 0x22u);
                }
                pthread_mutex_lock((pthread_mutex_t *)(v44 + 768));
                gckSessionChangeStateCList(v122, v44);
                v6 = v122;
                pthread_mutex_unlock((pthread_mutex_t *)(v44 + 768));
LABEL_96:
                pthread_rwlock_unlock(v123);
                goto LABEL_97;
              }
              v70 = SSLSetIOFuncs(v59, (SSLReadFunc)DTLS_SocketRead, (SSLWriteFunc)DTLS_SocketWrite);
              if (v70)
              {
                v71 = v70;
                v72 = gcks_log();
                if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                  goto LABEL_93;
                v73 = *(_DWORD *)(v44 + 88);
                *(_DWORD *)v146 = 67109376;
                *(_DWORD *)v147 = v73;
                *(_WORD *)&v147[4] = 1024;
                *(_DWORD *)&v147[6] = v71;
                v64 = v72;
                v65 = "Failed to set IO functions for participant [%08X] with error %d.";
                goto LABEL_91;
              }
              v74 = SSLSetConnection(v59, (SSLConnectionRef)v44);
              if (v74)
              {
                v75 = v74;
                v76 = gcks_log();
                if (!os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
                  goto LABEL_93;
                v77 = *(_DWORD *)(v44 + 88);
                *(_DWORD *)v146 = 67109376;
                *(_DWORD *)v147 = v77;
                *(_WORD *)&v147[4] = 1024;
                *(_DWORD *)&v147[6] = v75;
                v64 = v76;
                v65 = "Failed to set connection for participant [%08X] with error %d.";
                goto LABEL_91;
              }
              if (v57)
              {
                v82 = gcks_log();
                if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
                {
                  v83 = *(_DWORD *)(v44 + 88);
                  *(_DWORD *)v146 = 67109120;
                  *(_DWORD *)v147 = v83;
                  _os_log_impl(&dword_20DC1A000, v82, OS_LOG_TYPE_DEFAULT, "Setting certificate for participant [%08X].", v146, 8u);
                }
                v84 = SSLSetCertificate(v59, v57);
                if (v84)
                {
                  v85 = v84;
                  v86 = gcks_log();
                  if (!os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
                    goto LABEL_93;
                  v87 = *(_DWORD *)(v44 + 88);
                  *(_DWORD *)v146 = 67109376;
                  *(_DWORD *)v147 = v87;
                  *(_WORD *)&v147[4] = 1024;
                  *(_DWORD *)&v147[6] = v85;
                  v64 = v86;
                  v65 = "Failed to set certificate for participant [%08X] with error %d.";
                  goto LABEL_91;
                }
              }
              if (*(_DWORD *)(v44 + 620))
              {
                if (v51)
                {
                  v88 = gcks_log();
                  if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
                  {
                    v89 = *(_DWORD *)(v44 + 88);
                    *(_DWORD *)v146 = 67109120;
                    *(_DWORD *)v147 = v89;
                    _os_log_impl(&dword_20DC1A000, v88, OS_LOG_TYPE_DEFAULT, "Setting client side authentication for participant [%08X].", v146, 8u);
                  }
                  v90 = SSLSetClientSideAuthenticate(v59, kAlwaysAuthenticate);
                  if (v90)
                  {
                    v91 = v90;
                    v92 = gcks_log();
                    if (!os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
                      goto LABEL_93;
                    v93 = *(_DWORD *)(v44 + 88);
                    *(_DWORD *)v146 = 67109376;
                    *(_DWORD *)v147 = v93;
                    *(_WORD *)&v147[4] = 1024;
                    *(_DWORD *)&v147[6] = v91;
                    v64 = v92;
                    v65 = "Failed to set client side authentication for participant [%08X] with error %d.";
                    goto LABEL_91;
                  }
                  v94 = kSSLSessionOptionBreakOnClientAuth;
                }
                else
                {
                  v94 = kSSLSessionOptionBreakOnServerAuth;
                }
                v95 = SSLSetSessionOption(v59, v94, 1u);
                if (v95)
                {
                  v96 = v95;
                  v97 = gcks_log();
                  if (!os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
                    goto LABEL_93;
                  v98 = *(_DWORD *)(v44 + 88);
                  *(_DWORD *)v146 = 67109376;
                  *(_DWORD *)v147 = v98;
                  *(_WORD *)&v147[4] = 1024;
                  *(_DWORD *)&v147[6] = v96;
                  v64 = v97;
                  v65 = "Failed to set session option for participant [%08X] with error %d.";
                  goto LABEL_91;
                }
              }
              v99 = *(_DWORD *)(v44 + 612);
              if (!*(_DWORD *)(v44 + 616))
              {
                if (v99)
                {
                  v107 = gcks_log();
                  if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
                  {
                    CStringPtr = CFStringGetCStringPtr(config, 0x8000100u);
                    *(_DWORD *)v146 = 136315138;
                    *(_QWORD *)v147 = CStringPtr;
                    _os_log_impl(&dword_20DC1A000, v107, OS_LOG_TYPE_DEFAULT, "Auth=yes, encryption=no: setting session config to %s.", v146, 0xCu);
                  }
                  v109 = SSLSetSessionConfig(v59, config);
                  if (v109)
                  {
                    v104 = v109;
                    v105 = gcks_log();
                    if (!os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
                      goto LABEL_93;
                    goto LABEL_123;
                  }
                }
LABEL_135:
                pthread_mutex_unlock((pthread_mutex_t *)(v44 + 768));
                v115 = gcks_log();
                if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
                {
                  v116 = *(_DWORD *)(v44 + 88);
                  v117 = *(_DWORD *)(v44 + 72);
                  v118 = *(_QWORD *)(v44 + 632);
                  *(_DWORD *)v146 = 67109888;
                  *(_DWORD *)v147 = v116;
                  *(_WORD *)&v147[4] = 1024;
                  *(_DWORD *)&v147[6] = v117;
                  v148 = 2048;
                  *(_QWORD *)v149 = v118;
                  *(_WORD *)&v149[8] = 2048;
                  v150 = v44;
                  _os_log_impl(&dword_20DC1A000, v115, OS_LOG_TYPE_DEFAULT, "DTLSContext has been set up for participant [%08X] channelID [%d] DTLS context [%p] pCList [%p].", v146, 0x22u);
                }
                *(double *)(v44 + 720) = micro();
                v6 = v122;
                gckSessionScheduleDTLSHandshake(v122, v44);
                goto LABEL_96;
              }
              v100 = gcks_log();
              v101 = os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT);
              if (v99)
              {
                if (v101)
                {
                  v102 = CFStringGetCStringPtr(theString, 0x8000100u);
                  *(_DWORD *)v146 = 136315138;
                  *(_QWORD *)v147 = v102;
                  _os_log_impl(&dword_20DC1A000, v100, OS_LOG_TYPE_DEFAULT, "Auth=yes, encryption=yes: setting session config to %s.", v146, 0xCu);
                }
                v103 = SSLSetSessionConfig(v59, theString);
                if (v103)
                {
                  v104 = v103;
                  v105 = gcks_log();
                  if (!os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
                    goto LABEL_93;
LABEL_123:
                  v106 = *(_DWORD *)(v44 + 88);
                  *(_DWORD *)v146 = 67109376;
                  *(_DWORD *)v147 = v106;
                  *(_WORD *)&v147[4] = 1024;
                  *(_DWORD *)&v147[6] = v104;
                  v64 = v105;
                  v65 = "Failed to set session config for participant [%08X] with error %d.";
                  goto LABEL_91;
                }
                goto LABEL_135;
              }
              if (v101)
              {
                v110 = *(_DWORD *)(v44 + 88);
                *(_DWORD *)v146 = 67109120;
                *(_DWORD *)v147 = v110;
                _os_log_impl(&dword_20DC1A000, v100, OS_LOG_TYPE_DEFAULT, "Setting ciphers for: Authentication YES, encryption NO for participant [%08X].", v146, 8u);
              }
              *(_DWORD *)ciphers = 131131;
              v111 = SSLSetEnabledCiphers(v59, ciphers, 2uLL);
              if (!v111)
                goto LABEL_135;
              v112 = v111;
              v113 = gcks_log();
              if (!os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
                goto LABEL_93;
              v114 = *(_DWORD *)(v44 + 88);
              *(_DWORD *)v146 = 67109376;
              *(_DWORD *)v147 = v114;
              *(_WORD *)&v147[4] = 1024;
              *(_DWORD *)&v147[6] = v112;
              v64 = v113;
              v65 = "Failed to set enabled ciphers for participant [%08X] with error %d.";
LABEL_91:
              v69 = 14;
            }
            else
            {
              v67 = gcks_log();
              if (!os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
                goto LABEL_93;
              v68 = *(_DWORD *)(v44 + 88);
              *(_DWORD *)v146 = 67109120;
              *(_DWORD *)v147 = v68;
              v64 = v67;
              v65 = "Failed to create context for participant [%08X].";
              v69 = 8;
            }
            _os_log_error_impl(&dword_20DC1A000, v64, OS_LOG_TYPE_ERROR, v65, v146, v69);
            goto LABEL_93;
          }
          *(_QWORD *)(v44 + 648) = _Block_copy(buf);
          pthread_mutex_lock((pthread_mutex_t *)(v44 + 768));
          *(_DWORD *)(v44 + 628) = 1;
          pthread_mutex_unlock((pthread_mutex_t *)(v44 + 768));
          pthread_rwlock_unlock(v123);
          PostEventCallback(*(_QWORD *)(v6 + 408), v124, 6, 0, 0, 0);
        }
LABEL_97:
        v11 = *(_QWORD *)(v11 + 304);
        if (!v11)
          goto LABEL_51;
      }
    }
  }
  *(_DWORD *)buf = 0;
  gckSessionUpdateNode(v6, a2, -1, (int *)buf);
  gckSessionChangeState(v6, a2);
LABEL_51:
  gckSessionCheckPendingConnections(v6, 1);
  CheckOutHandleDebug();
  return 0;
}

uint64_t gckSessionCancelRecvUDP()
{
  uint64_t v0;
  uint64_t v1;

  v0 = CheckInHandleDebug();
  if (!v0)
    return 2149187586;
  v1 = gckSessionCancelRecvUDPInternal(v0);
  CheckOutHandleDebug();
  return v1;
}

uint64_t gckSessionICEListRemoveCallback(uint64_t a1, int a2)
{
  uint64_t v3;

  v3 = CheckInHandleDebug();
  if (!v3)
    return 2149187586;
  gckCallICEListRemoveSignalBlock(v3, a2);
  CheckOutHandleDebug();
  return 0;
}

uint64_t SendUDPPacketCList(uint64_t a1, uint64_t a2, int a3, __int128 *a4, int a5)
{
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[8];
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  _QWORD v24[4];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v25 = 0;
  v26 = &v25;
  v27 = 0x2000000000;
  v28 = -2145779690;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2000000000;
  v24[3] = 0;
  v29 = 0;
  v30 = 0;
  v19 = 0;
  v20 = 0;
  v22 = 0;
  v21 = 0;
  if (!a4)
  {
    a4 = (__int128 *)(a1 + 424);
    v10 = (_QWORD *)(a1 + 444);
    if ((*(_BYTE *)(a1 + 424) & 1) != 0)
    {
      if (*v10 != *MEMORY[0x24BDAE878] || *(_QWORD *)(a1 + 452) != *(_QWORD *)(MEMORY[0x24BDAE878] + 8))
        goto LABEL_2;
    }
    else if (*(_DWORD *)v10)
    {
      goto LABEL_2;
    }
    v12 = 0;
    goto LABEL_21;
  }
LABEL_2:
  if (a5)
  {
    gckSessionUpdateDstIPPortAndSockAddrForCList(a1, a4);
    v23 = *(_DWORD *)(a1 + 592);
    v9 = a1 + 464;
  }
  else if ((*(_BYTE *)(a1 + 384) & 1) != 0)
  {
    v23 = 28;
    v9 = IPPORTToSA6();
  }
  else
  {
    v23 = 16;
    v9 = IPPORTToSA();
  }
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 0x40000000;
  v16[2] = __SendUDPPacketCList_block_invoke;
  v16[3] = &unk_24C840CE8;
  v16[6] = a1;
  v16[7] = v9;
  v17 = a5;
  v18 = v23;
  v16[4] = &v25;
  v16[5] = v24;
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 768));
  v13 = OSPFAddDynamicOptions(a2, a3, (uint64_t)v16);
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 768));
  if (v13)
  {
    do
    {
      v14 = *(_QWORD *)(v13 + 8);
      if (*(_QWORD *)v13)
        free(*(void **)v13);
      free((void *)v13);
      v13 = v14;
    }
    while (v14);
  }
  v12 = *((unsigned int *)v26 + 6);
LABEL_21:
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v25, 8);
  return v12;
}

void gckSessionUpdateDstIPPortAndSockAddrForCList(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  NSObject *v6;
  int v7;
  int v8;
  __int128 v9;
  __int128 v10;
  NSObject *v11;
  _DWORD v12[2];
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v4 = a1 + 424;
    if ((*(_DWORD *)a2 & 1) == (*(_DWORD *)(a1 + 424) & 1))
    {
      if ((*(_DWORD *)a2 & 1) != 0)
      {
        if (*(_QWORD *)((char *)a2 + 20) != *(_QWORD *)(a1 + 444)
          || *(_QWORD *)((char *)a2 + 28) != *(_QWORD *)(a1 + 452))
        {
          goto LABEL_12;
        }
      }
      else if (*((_DWORD *)a2 + 5) != *(_DWORD *)(a1 + 444))
      {
        goto LABEL_12;
      }
      if (*((unsigned __int16 *)a2 + 18) == *(unsigned __int16 *)(a1 + 460))
        return;
    }
LABEL_12:
    v6 = gcks_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_DWORD *)(a1 + 88);
      v8 = *(_DWORD *)(a1 + 72);
      v12[0] = 67109890;
      v12[1] = v7;
      v13 = 1024;
      v14 = v8;
      v15 = 2080;
      v16 = IPPORTToString();
      v17 = 2080;
      v18 = IPPORTToString();
      _os_log_impl(&dword_20DC1A000, v6, OS_LOG_TYPE_DEFAULT, "Update destination IPPort for participant %08X, channel %d from %s to %s.", (uint8_t *)v12, 0x22u);
    }
    v9 = *a2;
    v10 = a2[1];
    *(_QWORD *)(v4 + 32) = *((_QWORD *)a2 + 4);
    *(_OWORD *)v4 = v9;
    *(_OWORD *)(v4 + 16) = v10;
    if ((*(_BYTE *)(a1 + 384) & 1) != 0)
    {
      v12[0] = 28;
      IPPORTToSA6();
    }
    else
    {
      v12[0] = 16;
      IPPORTToSA();
    }
    *(_DWORD *)(a1 + 592) = v12[0];
    return;
  }
  v11 = gcks_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12[0]) = 0;
    _os_log_impl(&dword_20DC1A000, v11, OS_LOG_TYPE_DEFAULT, "Invalid parameter.", (uint8_t *)v12, 2u);
  }
}

const char *DTLSErrorName(int a1)
{
  if ((a1 + 9851) > 0x33)
    return "?";
  else
    return off_24C840E10[a1 + 9851];
}

uint64_t gckSessionUpdateNode(uint64_t a1, int a2, int a3, int *a4)
{
  pthread_mutex_t *v8;
  uint64_t v9;
  uint64_t v10;
  _DWORD *v11;
  _BOOL4 v12;
  int v14;

  v8 = (pthread_mutex_t *)(a1 + 7080);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 7080));
  v9 = *(unsigned int *)(a1 + 708);
  if ((int)v9 < 1)
  {
    LODWORD(v10) = 0;
    v12 = 0;
    if (!a4)
      return pthread_mutex_unlock(v8);
  }
  else
  {
    v10 = 0;
    v11 = (_DWORD *)(a1 + 716);
    while (*(v11 - 1) != a2)
    {
      ++v10;
      v11 += 2;
      if (v9 == v10)
      {
        v12 = 0;
        LODWORD(v10) = *(_DWORD *)(a1 + 708);
        if (a4)
          goto LABEL_10;
        return pthread_mutex_unlock(v8);
      }
    }
    *v11 = a3;
    v12 = (int)v9 > 1;
    if (!a4)
      return pthread_mutex_unlock(v8);
  }
LABEL_10:
  v14 = (_DWORD)v10 == (_DWORD)v9 && (int)v9 > 0 || v12;
  *a4 = v14;
  return pthread_mutex_unlock(v8);
}

void gckSessionCheckPendingConnections(uint64_t a1, int a2)
{
  uint64_t v4;
  int v5;
  _DWORD *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  _DWORD v12[2];
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (a2)
    pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 7192));
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 7080));
  v4 = *(unsigned int *)(a1 + 420);
  if ((int)v4 < 1)
  {
    v5 = 0;
  }
  else
  {
    v5 = 0;
    v6 = (_DWORD *)(a1 + 428);
    do
    {
      if (*v6 == -1)
        ++v5;
      v6 += 104;
      --v4;
    }
    while (v4);
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 7080));
  v7 = *(_QWORD *)(a1 + 7184);
  if (v7)
  {
    v8 = 0;
    v9 = *(_QWORD *)(a1 + 7184);
    do
    {
      if (!*(_DWORD *)(v9 + 68))
        ++v8;
      v9 = *(_QWORD *)(v9 + 832);
    }
    while (v9);
    v10 = 0;
    do
    {
      if (!*(_DWORD *)(v7 + 64))
        ++v10;
      v7 = *(_QWORD *)(v7 + 832);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
    v10 = 0;
  }
  v11 = gcks_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109632;
    v12[1] = v8;
    v13 = 1024;
    v14 = v5;
    v15 = 1024;
    v16 = v10;
    _os_log_impl(&dword_20DC1A000, v11, OS_LOG_TYPE_DEFAULT, "Pending connections state: iICEChecksLeft=%d, iUnconnectedNodeCount=%d, iDDsExpected=%d.", (uint8_t *)v12, 0x14u);
  }
  if (!v8 && !v5 && !v10)
    PostEventCallback(*(_QWORD *)(a1 + 408), 0, 4, 0, 0, 0);
  if (a2)
    pthread_rwlock_unlock((pthread_rwlock_t *)(a1 + 7192));
}

uint64_t FindCListFromParticipantChanId(uint64_t a1, int a2, int a3)
{
  uint64_t result;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  result = *(_QWORD *)(a1 + 7184);
  if (result)
  {
    while (*(_DWORD *)(result + 88) != a2 || *(_DWORD *)(result + 72) != a3)
    {
      result = *(_QWORD *)(result + 832);
      if (!result)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v6 = gcks_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109376;
      v7[1] = a2;
      v8 = 1024;
      v9 = a3;
      _os_log_impl(&dword_20DC1A000, v6, OS_LOG_TYPE_DEFAULT, "No CList for participant [%08X] and channel [%d]", (uint8_t *)v7, 0xEu);
    }
    return 0;
  }
  return result;
}

uint64_t __gckSessionSetupChannelWithDTLS_block_invoke(uint64_t a1)
{
  uint64_t CListFromParticipantChanId;
  unsigned int v3;
  unsigned int v4;
  NSObject *v5;
  _BOOL4 v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  NSObject *v26;
  pthread_mutex_t *v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  double **v31;
  NSObject *v32;
  double *v33;
  int v34;
  int v36;
  int v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  CListFromParticipantChanId = FindCListFromParticipantChanId(*(_QWORD *)(a1 + 32), *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44));
  if (CListFromParticipantChanId)
    *(double *)(CListFromParticipantChanId + 744) = micro();
  v3 = *(_DWORD *)(a1 + 48);
  v4 = *(_DWORD *)(a1 + 52);
  v5 = gcks_log();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3 <= v4)
  {
    if (v6)
    {
      v24 = *(_DWORD *)(a1 + 40);
      v25 = *(_DWORD *)(a1 + 44);
      v36 = 67109376;
      v37 = v24;
      v38 = 1024;
      v39 = v25;
      _os_log_impl(&dword_20DC1A000, v5, OS_LOG_TYPE_DEFAULT, "Sending first Hello to participant %08X on channel %d.", (uint8_t *)&v36, 0xEu);
    }
    v23 = gckSessionSendHello(*(_QWORD *)(a1 + 32), *(_DWORD *)(a1 + 40), 1, (int)*(double *)(*(_QWORD *)(a1 + 32) + 24), *(_DWORD *)(a1 + 44));
    if ((v23 & 0x80000000) != 0)
    {
      v26 = gcks_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        __gckSessionSetupChannelWithDTLS_block_invoke_cold_3();
      gckSessionChangeStateForParticipantAndChannel(*(_QWORD *)(a1 + 32), *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44));
    }
    return v23;
  }
  if (v6)
  {
    v7 = *(_DWORD *)(a1 + 40);
    v8 = *(_DWORD *)(a1 + 44);
    v36 = 67109376;
    v37 = v7;
    v38 = 1024;
    v39 = v8;
    _os_log_impl(&dword_20DC1A000, v5, OS_LOG_TYPE_DEFAULT, "Waiting for first Hello from participant %08X on channel %d.", (uint8_t *)&v36, 0xEu);
  }
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_DWORD *)(a1 + 40);
  v11 = *(_DWORD *)(a1 + 44);
  v12 = gcks_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v36 = 67109376;
    v37 = v10;
    v38 = 1024;
    v39 = 60;
    _os_log_impl(&dword_20DC1A000, v12, OS_LOG_TYPE_DEFAULT, "Waiting for Hello from participant %08X for %d seconds.", (uint8_t *)&v36, 0xEu);
  }
  v13 = *(_QWORD *)(v9 + 7184);
  if (!v13)
  {
LABEL_15:
    v14 = gcks_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __gckSessionSetupChannelWithDTLS_block_invoke_cold_2();
    v15 = gcks_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __gckSessionSetupChannelWithDTLS_block_invoke_cold_1(v15, v16, v17, v18, v19, v20, v21, v22);
    gckSessionChangeStateForParticipantAndChannel(*(_QWORD *)(a1 + 32), *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44));
    return 2149187606;
  }
  while (1)
  {
    if (*(_DWORD *)(v13 + 88) != v10)
      goto LABEL_14;
    if (v11 < 0)
      break;
    if (*(_DWORD *)(v13 + 72) == v11)
      goto LABEL_26;
LABEL_14:
    v13 = *(_QWORD *)(v13 + 832);
    if (!v13)
      goto LABEL_15;
  }
  if (*(_DWORD *)(v13 + 80))
    goto LABEL_14;
LABEL_26:
  v27 = (pthread_mutex_t *)(v13 + 768);
  pthread_mutex_lock((pthread_mutex_t *)(v13 + 768));
  if ((*(_QWORD *)(v13 + 40) & 0x8000000000000000) != 0)
  {
    v32 = gcks_log();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v36 = 67109120;
      v37 = v10;
      _os_log_impl(&dword_20DC1A000, v32, OS_LOG_TYPE_DEFAULT, "Hello already received from participant %08X, no need to schedule a Hello timeout.", (uint8_t *)&v36, 8u);
    }
  }
  else
  {
    v28 = micro();
    v29 = *(_QWORD *)(v13 + 600);
    if (v29)
    {
      while (1)
      {
        v30 = v29;
        if (*(_BYTE *)v29 == 1)
          break;
        v29 = *(_QWORD *)(v29 + 64);
        if (!v29)
        {
          v31 = (double **)(v30 + 64);
          goto LABEL_34;
        }
      }
    }
    else
    {
      v31 = (double **)(v13 + 600);
LABEL_34:
      v33 = (double *)malloc_type_calloc(1uLL, 0x48uLL, 0x10200409EACE7F9uLL);
      *(_BYTE *)v33 = 1;
      v33[1] = 0.065;
      v33[2] = v28 + 60.0;
      v33[4] = v28 + 60.0;
      v33[5] = 0.0;
      *((_DWORD *)v33 + 12) = 0;
      *((_DWORD *)v33 + 13) = v10;
      *v31 = v33;
      v34 = *(_DWORD *)(v9 + 16);
      if (v34 != -1)
      {
        *(_DWORD *)(v9 + 16) = -1;
        close(v34);
      }
    }
  }
  pthread_mutex_unlock(v27);
  return 0;
}

pthread_mutex_t *gckSessionChangeStateForParticipantAndChannel(uint64_t a1, int a2, int a3)
{
  pthread_mutex_t *result;
  uint64_t v5;
  pthread_mutex_t *v6;

  result = (pthread_mutex_t *)FindCListFromParticipantChanId(a1, a2, a3);
  if (result)
  {
    v5 = (uint64_t)result;
    v6 = result + 12;
    pthread_mutex_lock(result + 12);
    gckSessionChangeStateCList(a1, v5);
    return (pthread_mutex_t *)pthread_mutex_unlock(v6);
  }
  return result;
}

uint64_t gckSessionSendHello(uint64_t a1, unsigned int a2, int a3, __int16 a4, int a5)
{
  NSObject *v9;
  const char *v10;
  int v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  pthread_mutex_t *v17;
  _BYTE *v18;
  char *v19;
  _QWORD *v20;
  int v21;
  void *v22;
  NSObject *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;
  void *v30;
  _OWORD v31[2];
  uint8_t buf[4];
  _BYTE v33[24];
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v31[0] = 0u;
  v30 = 0;
  WORD6(v31[0]) = a4;
  v31[1] = 0x8000000000000002;
  v9 = gcks_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = "";
    *(_DWORD *)buf = 136315906;
    if (!a3)
      v10 = " back";
    *(_QWORD *)v33 = v10;
    *(_WORD *)&v33[8] = 2048;
    *(_QWORD *)&v33[10] = 0x8000000000000002;
    *(_WORD *)&v33[18] = 1024;
    *(_DWORD *)&v33[20] = a2;
    v34 = 1024;
    v35 = a5;
    _os_log_impl(&dword_20DC1A000, v9, OS_LOG_TYPE_DEFAULT, "Sending Hello%s with flags [%llX] to participant %08X over channel %d.", buf, 0x22u);
  }
  v11 = OSPFMakeHello(&v30, (uint64_t)v31, *(_DWORD *)(a1 + 416), a2);
  if (v11 < 0)
  {
    v15 = 2149187618;
    v16 = gcks_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      gckSessionSendHello_cold_1();
    return v15;
  }
  v12 = v11;
  if (!a3)
  {
    v15 = SendUDPPacketToParticipantChannelID(a1, (uint64_t)v30, v11, a2, 0, a5, 0);
    free(v30);
    return v15;
  }
  v13 = *(_QWORD *)(a1 + 7184);
  if (!v13)
  {
LABEL_14:
    v14 = gcks_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __gckSessionSetupChannelWithDTLS_block_invoke_cold_2();
    free(v30);
    return 2149187606;
  }
  while (1)
  {
    if (*(_DWORD *)(v13 + 88) != a2)
      goto LABEL_13;
    if (a5 < 0)
      break;
    if (*(_DWORD *)(v13 + 72) == a5)
      goto LABEL_20;
LABEL_13:
    v13 = *(_QWORD *)(v13 + 832);
    if (!v13)
      goto LABEL_14;
  }
  if (*(_DWORD *)(v13 + 80))
    goto LABEL_13;
LABEL_20:
  v17 = (pthread_mutex_t *)(v13 + 768);
  pthread_mutex_lock((pthread_mutex_t *)(v13 + 768));
  v18 = *(_BYTE **)(v13 + 600);
  if (v18)
  {
    while (1)
    {
      v19 = v18;
      if (*v18 == 1)
        break;
      v18 = (_BYTE *)*((_QWORD *)v18 + 8);
      if (!v18)
      {
        v20 = v19 + 64;
        goto LABEL_25;
      }
    }
    *(_OWORD *)(v18 + 8) = xmmword_20DC4CA70;
    *((_QWORD *)v18 + 4) = *(_QWORD *)(a1 + 32);
    *((_DWORD *)v18 + 6) = 1;
    v22 = (void *)*((_QWORD *)v18 + 5);
    if (v22)
      free(v22);
    v21 = 0;
    *((_QWORD *)v19 + 5) = v30;
    *((_DWORD *)v19 + 12) = v12;
    *((_DWORD *)v19 + 13) = a2;
  }
  else
  {
    v20 = (_QWORD *)(v13 + 600);
LABEL_25:
    v21 = 1;
    v19 = (char *)malloc_type_calloc(1uLL, 0x48uLL, 0x10200409EACE7F9uLL);
    *v19 = 1;
    *(_OWORD *)(v19 + 8) = xmmword_20DC4CA70;
    *((_QWORD *)v19 + 4) = *(_QWORD *)(a1 + 32);
    *((_QWORD *)v19 + 5) = v30;
    *((_DWORD *)v19 + 12) = v12;
    *((_DWORD *)v19 + 13) = a2;
    *v20 = v19;
  }
  v23 = gcks_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = *((_DWORD *)v19 + 12);
    v25 = *((_QWORD *)v19 + 2);
    v26 = *((_QWORD *)v19 + 4);
    v27 = *((_DWORD *)v19 + 6);
    *(_DWORD *)buf = 67110144;
    *(_DWORD *)v33 = v24;
    *(_WORD *)&v33[4] = 2048;
    *(_QWORD *)&v33[6] = v25;
    *(_WORD *)&v33[14] = 2048;
    *(_QWORD *)&v33[16] = v26;
    v34 = 1024;
    v35 = v27;
    v36 = 1024;
    v37 = v21;
    _os_log_impl(&dword_20DC1A000, v23, OS_LOG_TYPE_DEFAULT, "Scheduled OSPF Hello packet: length=%d nextFire=%g waitUntil=%g rapidFireCount=%d newItem=%d.", buf, 0x28u);
  }
  pthread_mutex_unlock(v17);
  v28 = *(_DWORD *)(a1 + 16);
  if (v28 != -1)
  {
    *(_DWORD *)(a1 + 16) = -1;
    close(v28);
  }
  return 0;
}

uint64_t gckSessionScheduleDTLSHandshake(uint64_t a1, uint64_t a2)
{
  pthread_mutex_t *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  char *v8;
  uint64_t result;

  v4 = (pthread_mutex_t *)(a2 + 768);
  pthread_mutex_lock((pthread_mutex_t *)(a2 + 768));
  v5 = *(_QWORD *)(a2 + 600);
  if (v5)
  {
    while (1)
    {
      v6 = v5;
      if (*(_BYTE *)v5 == 11)
        break;
      v5 = *(_QWORD *)(v5 + 64);
      if (!v5)
      {
        v7 = (_QWORD *)(v6 + 64);
        goto LABEL_6;
      }
    }
    *(_OWORD *)(v5 + 8) = xmmword_20DC4CA70;
    *(_QWORD *)(v5 + 32) = 0x404E000000000000;
    *(_DWORD *)(v5 + 52) = *(_DWORD *)(a2 + 88);
  }
  else
  {
    v7 = (_QWORD *)(a2 + 600);
LABEL_6:
    v8 = (char *)malloc_type_calloc(1uLL, 0x48uLL, 0x10200409EACE7F9uLL);
    *v8 = 11;
    *(_OWORD *)(v8 + 8) = xmmword_20DC4CA70;
    *((_QWORD *)v8 + 4) = 0x404E000000000000;
    *((_DWORD *)v8 + 13) = *(_DWORD *)(a2 + 88);
    *v7 = v8;
  }
  pthread_mutex_unlock(v4);
  result = *(unsigned int *)(a1 + 16);
  if ((_DWORD)result != -1)
  {
    *(_DWORD *)(a1 + 16) = -1;
    return close(result);
  }
  return result;
}

uint64_t SendUDPPacketToParticipantChannelID(uint64_t a1, uint64_t a2, int a3, int a4, int a5, int a6, int a7)
{
  uint64_t v7;
  uint64_t i;
  NSObject *v17;
  double v18;
  unsigned int v19;
  NSObject *v20;
  _DWORD v21[2];
  uint64_t v22;

  v7 = 0;
  v22 = *MEMORY[0x24BDAC8D0];
  if (a2 && a3)
  {
    if (a5)
      pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 7192));
    v7 = 2149187606;
    for (i = *(_QWORD *)(a1 + 7184); i; i = *(_QWORD *)(i + 832))
    {
      if (*(_DWORD *)(i + 88) == a4)
      {
        if (a6 < 0)
        {
          if (*(_DWORD *)(i + 80))
            continue;
        }
        else if (*(_DWORD *)(i + 72) != a6)
        {
          continue;
        }
        if ((*(_DWORD *)(i + 376) & 0xFFFFFFFE) == 2)
        {
          v17 = gcks_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            SendUDPPacketToParticipantChannelID_cold_1(i, a6, v17);
          v18 = micro();
          if (a7 && v18 <= *(double *)(i + 24))
          {
            v20 = gcks_log();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              v21[0] = 67109120;
              v21[1] = a4;
              _os_log_impl(&dword_20DC1A000, v20, OS_LOG_TYPE_DEFAULT, "Dropped packet for participant %08X.", (uint8_t *)v21, 8u);
            }
          }
          else
          {
            v19 = SendUDPPacketCList(i, a2, a3, 0, 1);
            if (v19 == -1072037876)
              *(double *)(i + 24) = v18 + 3.0;
            if (v19 == -1072037856)
              v7 = 2149187626;
            else
              v7 = v19;
          }
          break;
        }
      }
    }
    if (a5)
      pthread_rwlock_unlock((pthread_rwlock_t *)(a1 + 7192));
  }
  return v7;
}

uint64_t DTLS_SocketRead(uint64_t a1, void *__dst, int *a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  NSObject *v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  _DWORD v15[2];
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a1 + 656);
  if (v5)
  {
    v6 = *(int *)(v5 + 4100);
    if (*(_DWORD *)(v5 + 4104) - (int)v6 >= *a3)
      v7 = *a3;
    else
      v7 = *(_DWORD *)(v5 + 4104) - v6;
    memcpy(__dst, (const void *)(v5 + v6), v7);
    *(_QWORD *)a3 = v7;
    v8 = *(_DWORD *)(v5 + 4100) + v7;
    *(_DWORD *)(v5 + 4100) = v8;
    if (v8 == *(_DWORD *)(v5 + 4104))
    {
      *(_QWORD *)(a1 + 656) = *(_QWORD *)(v5 + 4200);
      free((void *)v5);
    }
    return 0;
  }
  else
  {
    v10 = gcks_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)a3;
      v12 = *(_DWORD *)(a1 + 88);
      v13 = *(_DWORD *)(a1 + 72);
      v14 = *(_QWORD *)(a1 + 632);
      v15[0] = 67110144;
      v15[1] = v11;
      v16 = 1024;
      v17 = v12;
      v18 = 1024;
      v19 = v13;
      v20 = 2048;
      v21 = v14;
      v22 = 2048;
      v23 = a1;
      _os_log_impl(&dword_20DC1A000, v10, OS_LOG_TYPE_DEFAULT, "No packets available (%d bytes requested) for participant [%08X] channelID [%d] DTLS context [%p] pCList [%p]. Have to wait for more data.", (uint8_t *)v15, 0x28u);
    }
    *(_QWORD *)a3 = 0;
    return 4294957493;
  }
}

uint64_t DTLS_SocketWrite(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  double v7;
  uint64_t result;
  NSObject *v9;
  char v10;
  msghdr v11;
  _QWORD v12[7];

  v12[6] = *MEMORY[0x24BDAC8D0];
  v6 = *a3;
  gckSessionUpdateDstIPPortAndSockAddrForCList(a1, (__int128 *)(a1 + 424));
  memset(&v11.msg_namelen, 0, 40);
  v12[4] = 0;
  v12[5] = 0;
  v11.msg_name = (void *)(a1 + 464);
  v11.msg_namelen = *(_DWORD *)(a1 + 592);
  v10 = -48;
  v12[0] = &v10;
  v12[1] = 1;
  v12[2] = a2;
  v12[3] = (int)v6;
  v11.msg_iovlen = 2;
  v11.msg_iov = (iovec *)v12;
  if (sendmsg(*(_DWORD *)a1, &v11, 0) == -1)
  {
    v9 = gcks_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      DTLS_SocketWrite_cold_1(v6 + 1, v9);
    __error();
    *a3 = 0;
    return 4294957493;
  }
  else
  {
    v7 = micro();
    result = 0;
    *(double *)(a1 + 48) = v7;
  }
  return result;
}

uint64_t __gckSessionRecvProc_block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;

  pthread_rwlock_rdlock((pthread_rwlock_t *)(*(_QWORD *)(a1 + 32) + 7192));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 16);
  if (v3 != -1)
  {
    *(_DWORD *)(v2 + 16) = -1;
    close(v3);
    v2 = *(_QWORD *)(a1 + 32);
  }
  return pthread_rwlock_unlock((pthread_rwlock_t *)(v2 + 7192));
}

const char *gckWaitForString(int a1)
{
  if ((a1 - 1) > 0xB)
    return "UNHANDLED WAIT FOR TYPE";
  else
    return off_24C840DB0[(char)(a1 - 1)];
}

uint64_t gckSessionPerformDTLSHandshake(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  int v22;
  int v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t CertificateCount;
  CFMutableArrayRef Mutable;
  __CFArray *v34;
  CFIndex i;
  SecCertificateRef CertificateAtIndex;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  CFMutableArrayRef v45;
  uint8_t buf[8];
  __int16 v47;
  int v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v4 = SSLHandshake(*(SSLContextRef *)(a2 + 632));
  v5 = gcks_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_DWORD *)(a2 + 88);
    v7 = *(_DWORD *)(a2 + 72);
    v8 = *(_QWORD *)(a2 + 632);
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)&buf[4] = v6;
    v47 = 1024;
    v48 = v7;
    v49 = 2048;
    v50 = v8;
    v51 = 1024;
    LODWORD(v52) = v4;
    _os_log_impl(&dword_20DC1A000, v5, OS_LOG_TYPE_DEFAULT, "Perform handshake with participant [%08X] channelID [%d] DTLS context [%p] completed with error %d.", buf, 0x1Eu);
  }
  switch((_DWORD)v4)
  {
    case 0xFFFFD98F:
      v21 = gcks_log();
      v20 = 0;
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        return v20;
      v22 = *(_DWORD *)(a2 + 88);
      v23 = *(_DWORD *)(a2 + 72);
      v24 = *(_QWORD *)(a2 + 632);
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)&buf[4] = v22;
      v47 = 1024;
      v48 = v23;
      v49 = 2048;
      v50 = v24;
      v51 = 2048;
      v52 = a2;
      _os_log_impl(&dword_20DC1A000, v21, OS_LOG_TYPE_DEFAULT, "Peer Authentication Completed for participant [%08X] channelID [%d] DTLS context [%p] pCList [%p].", buf, 0x22u);
      return 0;
    case 0xFFFFD9B5:
      return 0;
    case 0:
      v9 = gcks_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_DWORD *)(a2 + 88);
        v11 = *(_DWORD *)(a2 + 72);
        v12 = *(_QWORD *)(a2 + 632);
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)&buf[4] = v10;
        v47 = 1024;
        v48 = v11;
        v49 = 2048;
        v50 = v12;
        v51 = 2048;
        v52 = a2;
        _os_log_impl(&dword_20DC1A000, v9, OS_LOG_TYPE_DEFAULT, "Completed handshake with participant [%08X] channelID [%d] DTLS context [%p] pCList [%p]. Changing status to DTLSCONNECTED.", buf, 0x22u);
      }
      *(_DWORD *)(a2 + 640) = 1;
      *(double *)(a2 + 728) = micro();
      *(_DWORD *)(a2 + 736) = 1;
      if (*(_DWORD *)(a2 + 620))
      {
        *(_QWORD *)buf = 0;
        if (SSLCopyPeerTrust(*(SSLContextRef *)(a2 + 632), (SecTrustRef *)buf))
        {
          v13 = gcks_log();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            gckSessionPerformDTLSHandshake_cold_3(a2, v13, v14, v15, v16, v17, v18, v19);
          return 2149777412;
        }
        if (!*(_QWORD *)buf)
        {
          v38 = gcks_log();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            gckSessionPerformDTLSHandshake_cold_2(a2, v38, v39, v40, v41, v42, v43, v44);
          return 2149777412;
        }
        CertificateCount = SecTrustGetCertificateCount(*(SecTrustRef *)buf);
        Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], CertificateCount, MEMORY[0x24BDBD690]);
        v45 = Mutable;
        if (CertificateCount >= 1)
        {
          v34 = Mutable;
          for (i = 0; i != CertificateCount; ++i)
          {
            CertificateAtIndex = SecTrustGetCertificateAtIndex(*(SecTrustRef *)buf, i);
            CFArrayAppendValue(v34, CertificateAtIndex);
          }
        }
        *(_DWORD *)(a2 + 628) = 1;
        PostEventCallback(*(_QWORD *)(a1 + 408), *(_DWORD *)(a2 + 88), 6, &v45, 8, 0);
        CFRelease(*(CFTypeRef *)buf);
      }
      else
      {
        *(_DWORD *)(a2 + 628) = 1;
        PostEventCallback(*(_QWORD *)(a1 + 408), *(_DWORD *)(a2 + 88), 6, 0, 0, 0);
      }
      return 0;
  }
  v20 = 2149777412;
  v25 = gcks_log();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    gckSessionPerformDTLSHandshake_cold_1(v4, v25, v26, v27, v28, v29, v30, v31);
  return v20;
}

void attempt_failover(uint64_t a1, _DWORD *a2)
{
  NSObject *v4;
  int v5;
  NSObject *v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  _DWORD *v11;
  NSObject *v12;
  int v13;
  int v14;
  int v15;
  NSObject *v16;
  int v17;
  int v18;
  const char *v19;
  int v20;
  int v21;
  __int16 v22;
  _WORD v23[11];

  *(_QWORD *)&v23[7] = *MEMORY[0x24BDAC8D0];
  v4 = gcks_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a2[22];
    v20 = 67109120;
    v21 = v5;
    _os_log_impl(&dword_20DC1A000, v4, OS_LOG_TYPE_DEFAULT, "Attempting failover for participant %08X.", (uint8_t *)&v20, 8u);
  }
  if (a2[20])
    goto LABEL_4;
  v10 = *(_QWORD *)(a1 + 7184);
  if (v10)
  {
    v11 = 0;
    do
    {
      if ((_DWORD *)v10 != a2 && *(_DWORD *)(v10 + 88) == a2[22] && *(int *)(v10 + 80) >= 0)
        v11 = (_DWORD *)v10;
      v10 = *(_QWORD *)(v10 + 832);
    }
    while (v10);
    if (v11)
    {
      if (v11 != a2)
      {
        v11[20] = 0;
        gckSessionUpdateNode(a1, v11[22], v11[152], 0);
        v12 = gcks_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = v11[18];
          v15 = v11[21];
          v14 = v11[22];
          v20 = 67109632;
          v21 = v13;
          v22 = 1024;
          *(_DWORD *)v23 = v14;
          v23[2] = 1024;
          *(_DWORD *)&v23[3] = v15;
          _os_log_impl(&dword_20DC1A000, v12, OS_LOG_TYPE_DEFAULT, "Promoted channel %d for participant %08X to active status: original priority %d.", (uint8_t *)&v20, 0x14u);
        }
      }
LABEL_4:
      a2[20] = -1;
      v6 = gcks_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = a2[18];
        v9 = a2[21];
        v8 = a2[22];
        v20 = 67109632;
        v21 = v7;
        v22 = 1024;
        *(_DWORD *)v23 = v8;
        v23[2] = 1024;
        *(_DWORD *)&v23[3] = v9;
        _os_log_impl(&dword_20DC1A000, v6, OS_LOG_TYPE_DEFAULT, "Demoted channel %d for participant %08X to inactive status: original priority %d.", (uint8_t *)&v20, 0x14u);
      }
      gckSessionReconcileChannelPriority(a1, a2[22]);
      return;
    }
  }
  v16 = gcks_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = a2[22];
    v18 = a2[94];
    v19 = "Created";
    switch(v18)
    {
      case 0:
        break;
      case 1:
        v19 = "ICE";
        break;
      case 2:
        v19 = "Connecting";
        break;
      case 3:
        v19 = "Connected";
        break;
      case 4:
        v19 = "Disconnected";
        break;
      default:
        v19 = "Invalid";
        if (v18 != 255)
          v19 = "?";
        break;
    }
    v20 = 67109378;
    v21 = v17;
    v22 = 2080;
    *(_QWORD *)v23 = v19;
    _os_log_impl(&dword_20DC1A000, v16, OS_LOG_TYPE_DEFAULT, "Connection timed out for participant [%08X] (%s).", (uint8_t *)&v20, 0x12u);
  }
  gckSessionChangeStateCList(a1, (uint64_t)a2);
}

uint64_t gckSessionRecvMessage(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  uint64_t v6;
  ssize_t v7;
  unint64_t v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  NSObject *v15;
  int v16;
  const char *v17;
  int *v18;
  NSObject *v19;
  uint32_t v20;
  __int128 v21;
  unsigned int *msg_control;
  unsigned int v23;
  __int128 v24;
  _DWORD *v25;
  _DWORD *v26;
  size_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  int v35;
  OSStatus v36;
  NSObject *v37;
  int v38;
  int v39;
  uint64_t v40;
  const char *v41;
  unsigned __int8 *v42;
  int v43;
  uint64_t v44;
  int v45;
  NSObject *v46;
  _BOOL8 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unsigned int *v51;
  unint64_t v52;
  uint64_t v53;
  _BYTE *v54;
  int v55;
  unint64_t v56;
  unsigned int *v57;
  int *v58;
  uint64_t v59;
  unsigned int v60;
  int NextHop;
  unsigned int *v62;
  _DWORD *v63;
  uint64_t v64;
  int v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unsigned int *v69;
  uint64_t v70;
  unint64_t v71;
  _DWORD *v72;
  unsigned int *v73;
  unint64_t v74;
  unsigned int *v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  unint64_t v79;
  int v80;
  uint64_t v81;
  _BOOL4 v82;
  const char *v83;
  NSObject *v84;
  int v85;
  int v86;
  int v87;
  const char *v88;
  NSObject *v89;
  const char *v90;
  int *v91;
  NSObject *v92;
  uint32_t v93;
  NSObject *v94;
  NSObject *v95;
  int v96;
  int v97;
  int *v98;
  uint64_t v99;
  unint64_t v100;
  int v101;
  int v102;
  unsigned __int16 *v103;
  NSObject *v104;
  int v105;
  uint64_t v106;
  int v107;
  uint64_t v108;
  int v109;
  NSObject *v110;
  int v111;
  int v112;
  uint64_t v113;
  int v114;
  const char *v115;
  const char *v116;
  _DWORD *v117;
  _DWORD *v118;
  NSObject *v119;
  __int128 v120;
  __int128 v121;
  uint64_t v122;
  _QWORD *v123;
  _QWORD *v124;
  uint64_t v125;
  NSObject *v126;
  NSObject *v127;
  int v128;
  int v129;
  int v130;
  int v131;
  int v132;
  _BYTE *v133;
  _QWORD *v134;
  void *v135;
  pthread_mutex_t *v136;
  double v137;
  NSObject *v138;
  const char *v139;
  int v140;
  int v141;
  int v142;
  uint64_t v143;
  unsigned int v144;
  unsigned int v145;
  int v146;
  int v147;
  NSObject *v148;
  NSObject *v149;
  double v150;
  NSObject *v151;
  int v152;
  int v153;
  _BYTE v155[4];
  int v156;
  _BYTE *v157;
  uint64_t v158;
  _BYTE *v159;
  int v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  int v164;
  uint64_t v165;
  uint64_t v166;
  msghdr v167;
  void *v168;
  int v169;
  _BYTE v170[10];
  _DWORD v171[5];
  __int16 v172;
  _QWORD v173[514];
  size_t v174[7];
  int v175;
  int v176;
  __int16 v177;
  int v178;
  _QWORD v179[2];
  _BYTE v180[32];
  _BYTE v181[128];
  __int128 v182;
  __int128 v183;
  uint64_t v184;
  __int128 v185;
  _OWORD v186[2];
  _BYTE v187[4097];
  uint64_t v188;

  v2 = MEMORY[0x24BDAC7A8](a1, a2);
  v4 = v3;
  v6 = (uint64_t)v5;
  v163 = v2;
  v188 = *MEMORY[0x24BDAC8D0];
  v185 = 0u;
  memset(v186, 0, 24);
  v184 = 0;
  v182 = 0u;
  v183 = 0u;
  memset(v181, 0, sizeof(v181));
  *(_QWORD *)&v167.msg_iovlen = 1;
  memset(v180, 0, sizeof(v180));
  v179[0] = v187;
  v179[1] = 4096;
  v167.msg_name = v181;
  *(_QWORD *)&v167.msg_namelen = 128;
  v167.msg_iov = (iovec *)v179;
  v167.msg_control = v180;
  *(_QWORD *)&v167.msg_controllen = 32;
  v7 = recvmsg(*v5, &v167, 0);
  if (v7 == -1)
  {
    v10 = *__error() | 0xC01A0000;
    v15 = gcks_log();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      return v10;
    v16 = *(_DWORD *)v6;
    v175 = 67109376;
    v176 = v16;
    v177 = 1024;
    v178 = v10;
    v17 = "Recvmsg on socket %d failed (%X).";
    v18 = &v175;
    v19 = v15;
LABEL_8:
    v20 = 14;
LABEL_9:
    _os_log_impl(&dword_20DC1A000, v19, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)v18, v20);
    return v10;
  }
  v8 = v7;
  if (!v7)
  {
    v9 = gcks_log();
    v10 = 0;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_DWORD *)v6;
      v175 = 67109120;
      v176 = v11;
      v12 = "Recvmsg on socket %d returned 0 (empty message).";
      v13 = v9;
      v14 = 8;
LABEL_5:
      _os_log_impl(&dword_20DC1A000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v175, v14);
      return 0;
    }
    return v10;
  }
  v21 = *(_OWORD *)(v6 + 400);
  v185 = *(_OWORD *)(v6 + 384);
  v186[0] = v21;
  *(_QWORD *)&v186[1] = *(_QWORD *)(v6 + 416);
  if (v167.msg_controllen >= 0xC)
  {
    msg_control = (unsigned int *)v167.msg_control;
    if (v167.msg_control)
    {
      while (msg_control[1] != 41 || msg_control[2] != 46)
      {
        msg_control = (unsigned int *)((char *)msg_control + ((*msg_control + 3) & 0x1FFFFFFFCLL));
        if ((char *)(msg_control + 3) > (char *)v167.msg_control + v167.msg_controllen)
          goto LABEL_21;
      }
      if (msg_control[3] || msg_control[4] || msg_control[5] != -65536)
      {
        LODWORD(v185) = 1;
        *(_OWORD *)((char *)v186 + 4) = *(_OWORD *)(msg_control + 3);
      }
      else
      {
        v23 = bswap32(msg_control[6]);
        LODWORD(v185) = v185 & 0xFFFFFFFE;
        DWORD1(v186[0]) = v23;
      }
    }
  }
LABEL_21:
  if (SockAddrCompareAddr())
  {
    SAToIPPORT();
  }
  else
  {
    v184 = *(_QWORD *)(v6 + 456);
    v24 = *(_OWORD *)(v6 + 440);
    v182 = *(_OWORD *)(v6 + 424);
    v183 = v24;
  }
  v165 = 0;
  v166 = 0;
  if (v187[0] != 208)
  {
    v42 = v187;
LABEL_35:
    v164 = 0;
    v43 = OSPFParse(&v166, &v165, v42, v8, 0, 0, &v164);
    if (v43 >= 1)
    {
      v44 = v166;
      v45 = *(unsigned __int8 *)(v166 + 1);
      *(_QWORD *)(v6 + 16) = v4;
      v160 = v45;
      if (v45 == 1 && (*(_WORD *)(v44 + 4) & 1) != 0)
        *(_DWORD *)(v6 + 32) = 1;
      v158 = v6;
      v46 = gcks_log();
      v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG);
      v49 = v163;
      if (v47)
      {
        v106 = IPPORTToString();
        v107 = *(_DWORD *)(v166 + 12);
        v108 = IPPORTToString();
        v109 = *(_DWORD *)(v166 + 8);
        v169 = 136316418;
        *(_QWORD *)v170 = v106;
        *(_WORD *)&v170[8] = 1024;
        v171[0] = v107;
        LOWORD(v171[1]) = 2080;
        *(_QWORD *)((char *)&v171[1] + 2) = v108;
        HIWORD(v171[3]) = 1024;
        v171[4] = v109;
        v172 = 1024;
        LODWORD(v173[0]) = v8;
        WORD2(v173[0]) = 1024;
        *(_DWORD *)((char *)v173 + 6) = v160;
        _os_log_debug_impl(&dword_20DC1A000, v46, OS_LOG_TYPE_DEBUG, "[%s] %08X <= [%s] %08X: %d bytes(%d).", (uint8_t *)&v169, 0x2Eu);
      }
      v50 = v166;
      v51 = (unsigned int *)(v166 + 12);
      v52 = *(_BYTE *)v166 & 0xF;
      v161 = 4 * v52;
      MEMORY[0x24BDAC7A8](v47, v48);
      v54 = &v155[-v53];
      if ((_DWORD)v52)
      {
        v157 = v155;
        v55 = 0;
        v56 = v52;
        v57 = v51;
        v58 = (int *)&v155[-v53];
        do
        {
          v60 = *v57++;
          v59 = v60;
          if (v60 == *(_DWORD *)(v49 + 416))
          {
            v55 = 1;
            NextHop = -1;
          }
          else
          {
            NextHop = gckSessionFindNextHop(v49, v59);
          }
          *v58++ = NextHop;
          --v56;
        }
        while (v56);
        v156 = v55;
        v62 = (unsigned int *)(v50 + 16);
        v63 = v54 + 4;
        v64 = 1;
        v159 = v54;
        do
        {
          v65 = *(_DWORD *)&v54[4 * v56];
          if (v65 == -1)
          {
            ++v56;
          }
          else
          {
            v66 = MEMORY[0x24BDAC7A8](v155, v59);
            v69 = (unsigned int *)&v155[-v68];
            *(_DWORD *)&v155[-v68] = v51[v56++];
            v70 = 1;
            if (v56 < v52)
            {
              v71 = v52;
              v72 = v63;
              v73 = v62;
              do
              {
                if (*v72 == v65)
                {
                  v69[(int)v70] = *v73;
                  v70 = (v70 + 1);
                  *v72 = -1;
                }
                ++v73;
                ++v72;
                --v71;
              }
              while (v64 != v71);
            }
            if ((_DWORD)v67 == 10 || (_DWORD)v67 == 5)
            {
              v162 = v66;
              v74 = v52;
              v75 = v51;
              v76 = v163;
              v77 = OSPFMakeData((char *)&v169, 4096, v165, 0, v67, *(_DWORD *)(v166 + 8), v69, v70, *(uint64_t (**)(uint64_t, unsigned int *, uint64_t, char *, _QWORD, uint64_t, _QWORD, _QWORD, int))(*(_QWORD *)(v163 + 408) + 24), *(_QWORD *)(*(_QWORD *)(v163 + 408) + 32), 64, 0, 0);
              if (v77 >= 1)
                SendUDPPacketToParticipantChannelID(v76, (uint64_t)&v169, v77, v65, 0, -1, 1);
              v51 = v75;
              v52 = v74;
              v54 = v159;
            }
          }
          ++v64;
          ++v62;
          ++v63;
        }
        while (v56 != v52);
        v78 = v163;
        if (v156)
        {
          pthread_mutex_lock((pthread_mutex_t *)(v163 + 7080));
          v79 = *(unsigned int *)(v78 + 420);
          if ((int)v79 < 1)
          {
            v82 = 0;
            v81 = v158;
          }
          else
          {
            v80 = *(_DWORD *)(v166 + 8);
            v81 = v158;
            if (*(_DWORD *)(v78 + 424) == v80)
            {
              v82 = 1;
            }
            else
            {
              v98 = (int *)(v78 + 840);
              v99 = 1;
              do
              {
                v100 = v99;
                if (v79 == v99)
                  break;
                v101 = *v98;
                ++v99;
                v98 += 104;
              }
              while (v101 != v80);
              v82 = v100 < v79;
            }
          }
          pthread_mutex_unlock((pthread_mutex_t *)(v78 + 7080));
          if (v160 == 10 || v160 == 5)
          {
            if (v82)
            {
              if (v160 == 10)
                v102 = 5;
              else
                v102 = 3;
              PostEventCallback(*(_QWORD *)(v78 + 408), *(_DWORD *)(v166 + 8), v102, *(const void **)v165, *(_DWORD *)(v165 + 8), 0);
            }
            else
            {
              v104 = gcks_log();
              if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
              {
                v105 = *(_DWORD *)(v166 + 8);
                v169 = 67109120;
                *(_DWORD *)v170 = v105;
                _os_log_impl(&dword_20DC1A000, v104, OS_LOG_TYPE_DEFAULT, "Skipping data from unroutable peer (OSPF source ID [%08X]).", (uint8_t *)&v169, 8u);
              }
            }
          }
          else
          {
            v103 = (unsigned __int16 *)v165;
            switch(*(_BYTE *)(v166 + 1))
            {
              case 1:
                gckSessionProcessHello(v78, v81, v165, 1);
                goto LABEL_167;
              case 2:
                gckSessionProcessDD(v78, v81, v165);
                goto LABEL_167;
              case 3:
                gckSessionProcessLSA(v78, v81, v165);
                goto LABEL_167;
              case 4:
                v127 = gcks_log();
                if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
                {
                  v128 = *(_DWORD *)(v78 + 416);
                  v129 = *(_DWORD *)(v81 + 88);
                  v130 = v103[6];
                  v131 = *(_DWORD *)(v81 + 72);
                  v132 = *(_DWORD *)(v81 + 80);
                  v169 = 67110144;
                  *(_DWORD *)v170 = v128;
                  *(_WORD *)&v170[4] = 1024;
                  *(_DWORD *)&v170[6] = v129;
                  LOWORD(v171[0]) = 1024;
                  *(_DWORD *)((char *)v171 + 2) = v130;
                  HIWORD(v171[1]) = 1024;
                  v171[2] = v131;
                  LOWORD(v171[3]) = 1024;
                  *(_DWORD *)((char *)&v171[3] + 2) = v132;
                  _os_log_impl(&dword_20DC1A000, v127, OS_LOG_TYPE_DEFAULT, "I am %08X. Received LSAACK from particpant %08X with SN [%d] channel [%d] priority [%d].", (uint8_t *)&v169, 0x20u);
                }
                pthread_mutex_lock((pthread_mutex_t *)(v81 + 768));
                v133 = *(_BYTE **)(v81 + 600);
                if (v133)
                {
                  v134 = (_QWORD *)(v81 + 600);
                  do
                  {
                    if (*v133 == 4 && *((unsigned __int16 *)v133 + 28) == v103[6])
                    {
                      *v134 = *((_QWORD *)v133 + 8);
                      v135 = (void *)*((_QWORD *)v133 + 5);
                      if (v135)
                        free(v135);
                      free(v133);
                    }
                    else
                    {
                      v134 = v133 + 64;
                    }
                    v133 = (_BYTE *)*v134;
                  }
                  while (*v134);
                }
                v136 = (pthread_mutex_t *)(v81 + 768);
                goto LABEL_166;
              case 8:
                v137 = micro();
                v138 = gcks_log();
                if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
                {
                  if ((v103[6] & 2) != 0)
                    v139 = "request";
                  else
                    v139 = "response";
                  v140 = v103[7];
                  v141 = *(_DWORD *)(v81 + 88);
                  v142 = *(_DWORD *)(v81 + 72);
                  v169 = 136315906;
                  *(_QWORD *)v170 = v139;
                  *(_WORD *)&v170[8] = 1024;
                  v171[0] = v140;
                  LOWORD(v171[1]) = 1024;
                  *(_DWORD *)((char *)&v171[1] + 2) = v141;
                  HIWORD(v171[2]) = 1024;
                  v171[3] = v142;
                  _os_log_impl(&dword_20DC1A000, v138, OS_LOG_TYPE_DEFAULT, "Received Heartbeat (%s) with SN [%d] from participant [%08X] over channel [%d].", (uint8_t *)&v169, 0x1Eu);
                }
                if ((v103[6] & 2) != 0)
                {
                  v144 = *(_DWORD *)(v81 + 88);
                  v145 = v103[7];
                  v146 = *(_DWORD *)(v81 + 72);
                  v168 = 0;
                  v147 = OSPFMakeHeartbeat(&v168, *(_DWORD *)(v78 + 416), v144, 0, v145);
                  v148 = gcks_log();
                  v149 = v148;
                  if (v147 < 0)
                  {
                    if (os_log_type_enabled(v148, OS_LOG_TYPE_ERROR))
                    {
                      v169 = 67109632;
                      *(_DWORD *)v170 = v144;
                      *(_WORD *)&v170[4] = 1024;
                      *(_DWORD *)&v170[6] = v145;
                      LOWORD(v171[0]) = 1024;
                      *(_DWORD *)((char *)v171 + 2) = v146;
                      _os_log_error_impl(&dword_20DC1A000, v149, OS_LOG_TYPE_ERROR, "OSPFMakeHeartbeat failed for participant %08X, SN [%d], channel [%d].", (uint8_t *)&v169, 0x14u);
                    }
                  }
                  else
                  {
                    if (os_log_type_enabled(v148, OS_LOG_TYPE_DEFAULT))
                    {
                      v169 = 136315906;
                      *(_QWORD *)v170 = "response";
                      *(_WORD *)&v170[8] = 1024;
                      v171[0] = v145;
                      LOWORD(v171[1]) = 1024;
                      *(_DWORD *)((char *)&v171[1] + 2) = v144;
                      HIWORD(v171[2]) = 1024;
                      v171[3] = v146;
                      _os_log_impl(&dword_20DC1A000, v149, OS_LOG_TYPE_DEFAULT, "Sending Heartbeat (%s) with SN [%d] to participant [%08X] over channel [%d].", (uint8_t *)&v169, 0x1Eu);
                    }
                    SendUDPPacketToParticipantChannelID(v78, (uint64_t)v168, v147, v144, 0, v146, 0);
                    free(v168);
                  }
                  goto LABEL_167;
                }
                pthread_mutex_lock((pthread_mutex_t *)(v81 + 768));
                v143 = *(_QWORD *)(v81 + 600);
                if (!v143)
                  goto LABEL_165;
                break;
              default:
                goto LABEL_168;
            }
            while (*(_BYTE *)v143 != 8)
            {
              v143 = *(_QWORD *)(v143 + 64);
              if (!v143)
                goto LABEL_165;
            }
            if (*(unsigned __int16 *)(v143 + 56) == v103[7])
            {
              *(_QWORD *)(v143 + 8) = *(_QWORD *)(v78 + 48);
              v150 = *(double *)(v81 + 360);
              *(double *)(v143 + 32) = v137 + v150;
              *(double *)(v143 + 16) = v137 + v150 * 0.5;
            }
            else
            {
              v151 = gcks_log();
              if (os_log_type_enabled(v151, OS_LOG_TYPE_DEFAULT))
              {
                v152 = v103[7];
                v153 = *(unsigned __int16 *)(v143 + 56);
                v169 = 67109376;
                *(_DWORD *)v170 = v152;
                *(_WORD *)&v170[4] = 1024;
                *(_DWORD *)&v170[6] = v153;
                _os_log_impl(&dword_20DC1A000, v151, OS_LOG_TYPE_DEFAULT, "Received SN [%u] doesn't match the expected SN [%u].", (uint8_t *)&v169, 0xEu);
              }
            }
LABEL_165:
            v136 = (pthread_mutex_t *)(v81 + 768);
LABEL_166:
            pthread_mutex_unlock(v136);
          }
        }
      }
LABEL_167:
      v103 = (unsigned __int16 *)v165;
LABEL_168:
      if (v103)
        free(v103);
      return 0;
    }
    if (!v43)
    {
      if (*(_BYTE *)(v166 + 1) == 1)
        gckSessionProcessHello(v163, v6, v165, 0);
      if (v165)
        free((void *)v165);
      return 0;
    }
    v83 = "?";
    if ((v164 + 3010) <= 9)
      v83 = off_24C840FB0[v164 + 3010];
    v84 = gcks_log();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
    {
      v85 = *(_DWORD *)(v6 + 88);
      v86 = *(_DWORD *)(v6 + 72);
      v87 = *(_DWORD *)(v6 + 376);
      v88 = "Created";
      switch(v87)
      {
        case 0:
          break;
        case 1:
          v88 = "ICE";
          break;
        case 2:
          v88 = "Connecting";
          break;
        case 3:
          v88 = "Connected";
          break;
        case 4:
          v88 = "Disconnected";
          break;
        default:
          if (v87 == 255)
            v88 = "Invalid";
          else
            v88 = "?";
          break;
      }
      v114 = *(_DWORD *)(v6 + 640);
      v115 = "DTLSNotConnected";
      if (v114)
        v115 = "?";
      v169 = 67110146;
      *(_DWORD *)v170 = v85;
      *(_WORD *)&v170[4] = 1024;
      if (v114 == 1)
        v116 = "DTLSConnected";
      else
        v116 = v115;
      *(_DWORD *)&v170[6] = v86;
      LOWORD(v171[0]) = 2080;
      *(_QWORD *)((char *)v171 + 2) = v88;
      HIWORD(v171[2]) = 2080;
      *(_QWORD *)&v171[3] = v116;
      v172 = 2080;
      v173[0] = v83;
      _os_log_impl(&dword_20DC1A000, v84, OS_LOG_TYPE_DEFAULT, "Non-OSPF packet received from participant %08X on channel %d. State=%s DTLSState=%s OSPFParse err=%s.", (uint8_t *)&v169, 0x2Cu);
    }
    v117 = malloc_type_calloc(1uLL, 0x1070uLL, 0x1020040E1A74566uLL);
    if (v117)
    {
      v118 = v117;
      v117[1027] = *(_DWORD *)(v6 + 88);
      if (v8 >> 1 >= 0x801)
      {
        v119 = gcks_log();
        if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
          gckSessionRecvMessage_cold_1();
        MCDashboardLog("MC: iLenClearText=%ld (out of bounds) OSPFParse err=%s - <rdar://problem/26050877>.", v8, v83);
        LODWORD(v8) = 0;
      }
      __memcpy_chk();
      v118[1026] = v8;
      v120 = v186[0];
      *((_OWORD *)v118 + 257) = v185;
      *((_OWORD *)v118 + 258) = v120;
      *((_QWORD *)v118 + 518) = *(_QWORD *)&v186[1];
      v121 = v183;
      *(_OWORD *)(v118 + 1038) = v182;
      *(_OWORD *)(v118 + 1042) = v121;
      *((_QWORD *)v118 + 523) = v184;
      v122 = v163;
      *((_QWORD *)v118 + 524) = v4;
      pthread_mutex_lock((pthread_mutex_t *)(v122 + 7400));
      v123 = (_QWORD *)(v122 + 7392);
      do
      {
        v124 = v123;
        v125 = *v123;
        v123 = (_QWORD *)(*v123 + 4200);
      }
      while (v125);
      *v124 = v118;
      pthread_cond_broadcast((pthread_cond_t *)(v122 + 7464));
      pthread_mutex_unlock((pthread_mutex_t *)(v122 + 7400));
      return 0;
    }
    v10 = 2149187587;
    v126 = gcks_log();
    if (!os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
      return v10;
    v169 = 67109376;
    *(_DWORD *)v170 = 4208;
    *(_WORD *)&v170[4] = 1024;
    *(_DWORD *)&v170[6] = -2145779709;
    v17 = "Calloc (%d bytes) failed with error (%X).";
    v18 = &v169;
    v19 = v126;
    goto LABEL_8;
  }
  v174[0] = 0;
  v25 = malloc_type_calloc(1uLL, 0x1070uLL, 0x1020040E1A74566uLL);
  if (!v25)
  {
    v10 = 2149187587;
    v89 = gcks_log();
    if (!os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
    {
LABEL_75:
      v94 = gcks_log();
      if (!os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
        return v10;
      v169 = 134217984;
      *(_QWORD *)v170 = (int)v10;
      v17 = "Failed to process DTLS packet with error %ld.";
      v18 = &v169;
      v19 = v94;
      v20 = 12;
      goto LABEL_9;
    }
    v175 = 67109376;
    v176 = 4208;
    v177 = 1024;
    v178 = -2145779709;
    v90 = "Calloc (%d bytes) failed (%X).";
    v91 = &v175;
    v92 = v89;
    v93 = 14;
LABEL_74:
    _os_log_impl(&dword_20DC1A000, v92, OS_LOG_TYPE_DEFAULT, v90, (uint8_t *)v91, v93);
    goto LABEL_75;
  }
  v26 = v25;
  v27 = v8 - 1;
  v25[1027] = *(_DWORD *)(v6 + 88);
  __memcpy_chk();
  v26[1025] = 0;
  v26[1026] = v27;
  v28 = *(_QWORD *)(v6 + 416);
  v29 = *(_OWORD *)(v6 + 400);
  *((_OWORD *)v26 + 257) = *(_OWORD *)(v6 + 384);
  *((_OWORD *)v26 + 258) = v29;
  *((_QWORD *)v26 + 518) = v28;
  v31 = *(_OWORD *)(v6 + 424);
  v30 = *(_OWORD *)(v6 + 440);
  *((_QWORD *)v26 + 523) = *(_QWORD *)(v6 + 456);
  *(_OWORD *)(v26 + 1038) = v31;
  *(_OWORD *)(v26 + 1042) = v30;
  *((_QWORD *)v26 + 524) = v4;
  pthread_mutex_lock((pthread_mutex_t *)(v6 + 768));
  v32 = (_QWORD *)(v6 + 656);
  do
  {
    v33 = v32;
    v34 = *v32;
    v32 = (_QWORD *)(*v32 + 4200);
  }
  while (v34);
  *v33 = v26;
  v35 = *(_DWORD *)(v6 + 640);
  v10 = *(_QWORD *)(v6 + 632);
  pthread_mutex_unlock((pthread_mutex_t *)(v6 + 768));
  if (v10)
  {
    if (v35 != 1)
    {
      gckSessionScheduleDTLSHandshake(v163, v6);
      return 0;
    }
    pthread_mutex_lock((pthread_mutex_t *)(v6 + 768));
    v36 = SSLRead(*(SSLContextRef *)(v6 + 632), &v175, v27, v174);
    pthread_mutex_unlock((pthread_mutex_t *)(v6 + 768));
    if (v36)
    {
      v37 = gcks_log();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = *(_DWORD *)(v6 + 88);
        v39 = *(_DWORD *)(v6 + 72);
        v40 = *(_QWORD *)(v6 + 632);
        if ((v36 + 9851) > 0x33)
          v41 = "?";
        else
          v41 = off_24C840E10[v36 + 9851];
        v169 = 67110146;
        *(_DWORD *)v170 = v38;
        *(_WORD *)&v170[4] = 1024;
        *(_DWORD *)&v170[6] = v39;
        LOWORD(v171[0]) = 2048;
        *(_QWORD *)((char *)v171 + 2) = v40;
        HIWORD(v171[2]) = 2080;
        *(_QWORD *)&v171[3] = v41;
        v172 = 2048;
        v173[0] = v36;
        _os_log_impl(&dword_20DC1A000, v37, OS_LOG_TYPE_DEFAULT, "SSLRead for participant [%08X] channelID [%d] DTLS context [%p] returned with error %s (%ld).", (uint8_t *)&v169, 0x2Cu);
      }
      v10 = 2149187618;
      if ((v36 + 9816) > 0xB)
        goto LABEL_75;
      if (((1 << (v36 + 88)) & 0xC01) == 0)
        goto LABEL_75;
      v110 = gcks_log();
      v10 = 2149187617;
      if (!os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
        goto LABEL_75;
      v111 = *(_DWORD *)(v6 + 88);
      v112 = *(_DWORD *)(v6 + 72);
      v113 = *(_QWORD *)(v6 + 632);
      v169 = 67109632;
      *(_DWORD *)v170 = v111;
      *(_WORD *)&v170[4] = 1024;
      *(_DWORD *)&v170[6] = v112;
      LOWORD(v171[0]) = 2048;
      *(_QWORD *)((char *)v171 + 2) = v113;
      v90 = "DTLS connection closed gracefully for participant [%08X] channelID [%d] DTLS context [%p].";
      v91 = &v169;
      v92 = v110;
      v93 = 24;
      goto LABEL_74;
    }
    if (!v174[0])
      return 0;
    v8 = SLODWORD(v174[0]);
    v42 = (unsigned __int8 *)&v175;
    goto LABEL_35;
  }
  v95 = gcks_log();
  if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
  {
    v96 = *(_DWORD *)(v6 + 88);
    v97 = *(_DWORD *)(v6 + 72);
    v175 = 67109376;
    v176 = v96;
    v177 = 1024;
    v178 = v97;
    v12 = "DTLS context isn't set up yet for participant [%08X] on channel [%d]. Drop this packet.";
    v13 = v95;
    v14 = 14;
    goto LABEL_5;
  }
  return v10;
}

void gckSessionProcessHello(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v8;
  NSObject *v9;
  int v10;
  int v11;
  uint64_t v12;
  double v13;
  int v14;
  unsigned int v15;
  double v16;
  unsigned int v17;
  unsigned int v18;
  int v19;
  NSObject *v20;
  uint64_t v21;
  double **v22;
  double *v23;
  double *v24;
  double *v25;
  double v26;
  int v27;
  NSObject *v28;
  int v29;
  int v30;
  void *v31;
  int v32;
  int v33;
  double *v34;
  double v35;
  NSObject *v36;
  int v37;
  int v38;
  int v39;
  double v40;
  double v41;
  double v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  unsigned int v47;
  uint64_t v48;
  uint8_t buf[4];
  _BYTE v50[10];
  _WORD v51[9];

  *(_QWORD *)&v51[5] = *MEMORY[0x24BDAC8D0];
  v8 = *(_DWORD *)(a2 + 376);
  v9 = gcks_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_DWORD *)(a2 + 88);
    v11 = *(_DWORD *)(a2 + 72);
    v12 = *(_QWORD *)(a3 + 16);
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v50 = v10;
    *(_WORD *)&v50[4] = 1024;
    *(_DWORD *)&v50[6] = v11;
    v51[0] = 2048;
    *(_QWORD *)&v51[1] = v12;
    _os_log_impl(&dword_20DC1A000, v9, OS_LOG_TYPE_DEFAULT, "Received Hello from participant [%08X] over channel [%d]. Hello Flags [%llX].", buf, 0x18u);
  }
  v13 = micro();
  if (a4)
  {
    pthread_mutex_lock((pthread_mutex_t *)(a2 + 768));
    v14 = gckSessionChangeStateCList(a1, a2);
    pthread_mutex_unlock((pthread_mutex_t *)(a2 + 768));
    v15 = *(unsigned __int16 *)(a3 + 12);
    v16 = *(double *)(a1 + 24);
    if (v16 < (double)v15)
      v15 = (int)v16;
    if (v15 <= 5)
      v17 = 5;
    else
      v17 = v15;
  }
  else
  {
    v14 = 0;
    v17 = 0;
  }
  v18 = *(_DWORD *)(a2 + 88);
  if (*(_DWORD *)(a1 + 416) <= v18
    || (v19 = gckSessionSendHello(a1, v18, 0, v17, *(_DWORD *)(a2 + 72)), (v19 & 0x80000000) == 0)
    || v19 == -1072037876)
  {
    if (!a4)
      return;
  }
  else
  {
    v20 = gcks_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      gckSessionProcessHello_cold_1();
      if (!a4)
        return;
    }
    else if (!a4)
    {
      return;
    }
    pthread_mutex_lock((pthread_mutex_t *)(a2 + 768));
    gckSessionChangeStateCList(a1, a2);
    pthread_mutex_unlock((pthread_mutex_t *)(a2 + 768));
  }
  pthread_mutex_lock((pthread_mutex_t *)(a2 + 768));
  v21 = *(_QWORD *)(a3 + 16);
  *(_QWORD *)(a2 + 40) = v21;
  v22 = (double **)(a2 + 600);
  v23 = *(double **)(a2 + 600);
  if ((v21 & 2) != 0)
  {
    if (!v23)
    {
LABEL_33:
      v48 = 0;
      v32 = OSPFMakeHeartbeat(&v48, *(_DWORD *)(a1 + 416), *(_DWORD *)(a2 + 88), 1, 1u);
      if ((v32 & 0x80000000) == 0)
      {
        v33 = v32;
        v34 = (double *)malloc_type_calloc(1uLL, 0x48uLL, 0x10200409EACE7F9uLL);
        *(_BYTE *)v34 = 8;
        v34[1] = *(double *)(a1 + 48);
        v35 = *(double *)(a2 + 360);
        v34[4] = v13 + v35;
        v34[2] = v13 + v35 * 0.5;
        *((_QWORD *)v34 + 5) = v48;
        *((_DWORD *)v34 + 12) = v33;
        *((_WORD *)v34 + 28) = 1;
        *((_DWORD *)v34 + 13) = *(_DWORD *)(a2 + 88);
        *v22 = v34;
        v36 = gcks_log();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          v37 = *((unsigned __int16 *)v34 + 28);
          v38 = *(_DWORD *)(a2 + 88);
          v39 = *(_DWORD *)(a2 + 72);
          *(_DWORD *)buf = 67109632;
          *(_DWORD *)v50 = v37;
          *(_WORD *)&v50[4] = 1024;
          *(_DWORD *)&v50[6] = v38;
          v51[0] = 1024;
          *(_DWORD *)&v51[1] = v39;
          _os_log_impl(&dword_20DC1A000, v36, OS_LOG_TYPE_DEFAULT, "Schedule a Heartbeat with SN [%d] for participant [%08X] over channel [%d].", buf, 0x14u);
        }
      }
      goto LABEL_43;
    }
    while (1)
    {
      v27 = *(unsigned __int8 *)v23;
      if (v27 == 1)
      {
        v28 = gcks_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = *(_DWORD *)(a2 + 88);
          v30 = *(_DWORD *)(a2 + 72);
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v50 = v29;
          *(_WORD *)&v50[4] = 1024;
          *(_DWORD *)&v50[6] = v30;
          _os_log_impl(&dword_20DC1A000, v28, OS_LOG_TYPE_DEFAULT, "Remove Hello from the retry list for participant [%08X] channel [%d].", buf, 0xEu);
        }
        *v22 = (double *)*((_QWORD *)v23 + 8);
        v31 = (void *)*((_QWORD *)v23 + 5);
        if (v31)
          free(v31);
        free(v23);
      }
      else
      {
        if (v27 == 8)
        {
          v23[1] = *(double *)(a1 + 48);
          v42 = *(double *)(a2 + 360);
          v23[4] = v13 + v42;
          v23[2] = v13 + v42 * 0.5;
          v43 = gcks_log();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            v44 = *((_QWORD *)v23 + 2);
            v45 = *((_QWORD *)v23 + 4);
            *(_DWORD *)buf = 134218240;
            *(_QWORD *)v50 = v44;
            *(_WORD *)&v50[8] = 2048;
            *(_QWORD *)v51 = v45;
            _os_log_impl(&dword_20DC1A000, v43, OS_LOG_TYPE_DEFAULT, "Heartbeat queued. Updated state to: nextFire [%.1lf] waitUntil [%.1lf].", buf, 0x16u);
          }
          goto LABEL_43;
        }
        v22 = (double **)(v23 + 8);
      }
      v23 = *v22;
      if (!*v22)
        goto LABEL_33;
    }
  }
  if (v23)
  {
    while (1)
    {
      v24 = v23;
      if (*(_BYTE *)v23 == 1)
        break;
      v23 = (double *)*((_QWORD *)v23 + 8);
      if (!v23)
      {
        v22 = (double **)(v24 + 8);
        goto LABEL_22;
      }
    }
    v23[1] = 0.065;
    v40 = v13 + (double)v17;
    v23[4] = v40;
    if (*((_QWORD *)v23 + 5))
      v41 = *(double *)(a1 + 32);
    else
      v41 = 0.0;
    v23[2] = v40 - v41;
  }
  else
  {
LABEL_22:
    v25 = (double *)malloc_type_calloc(1uLL, 0x48uLL, 0x10200409EACE7F9uLL);
    *(_BYTE *)v25 = 1;
    v25[1] = 0.065;
    v26 = v13 + (double)v17;
    v25[4] = v26;
    v25[2] = v26;
    v25[5] = 0.0;
    *((_DWORD *)v25 + 12) = 0;
    *((_DWORD *)v25 + 13) = *(_DWORD *)(a2 + 88);
    *v22 = v25;
  }
LABEL_43:
  v46 = *(_DWORD *)(a1 + 16);
  if (v46 != -1)
  {
    *(_DWORD *)(a1 + 16) = -1;
    close(v46);
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a2 + 768));
  if ((v14 & 0x80000000) == 0 && v8 != 3)
  {
    v47 = *(_DWORD *)(a2 + 88);
    if (*(_DWORD *)(a1 + 416) < v47)
      gckSessionSendDD(a1, v47, -1, 1);
  }
}

void gckSessionProcessDD(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  NSObject *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  unsigned int v12;
  NSObject *v13;
  double v14;
  double v15;
  double v16;
  NSObject *v17;
  _QWORD *v18;
  _QWORD *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _DWORD *v32;
  unsigned __int16 *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  int v38;
  int v39;
  int v40;
  NSObject *v41;
  _BOOL4 v42;
  int v43;
  _DWORD *v44;
  int v45;
  int v46;
  NSObject *v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  os_log_t v51;
  os_log_t v52;
  int v53;
  NSObject *v54;
  NSObject *v55;
  const char *v56;
  NSObject *v57;
  uint64_t v58;
  _BOOL4 IsNewInformationAvailableForParticipant;
  __int128 v60;
  pthread_mutex_t *v61;
  uint64_t v62;
  os_log_t v63;
  __int128 v64;
  uint64_t v65;
  __int128 v66;
  _BYTE buf[14];
  double v68;
  int v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v6 = a1 + 424;
  IsNewInformationAvailableForParticipant = gckIsNewInformationAvailableForParticipant(*(_DWORD *)(a1 + 420), a1 + 424, *(_DWORD *)(a2 + 88));
  v7 = gcks_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_DWORD *)(a1 + 416);
    v9 = *(_DWORD *)(a2 + 88);
    v10 = *(_DWORD *)(a2 + 72);
    v11 = *(_DWORD *)(a2 + 80);
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)&buf[4] = v8;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v9;
    LOWORD(v68) = 1024;
    *(_DWORD *)((char *)&v68 + 2) = v10;
    HIWORD(v68) = 1024;
    v69 = v11;
    _os_log_impl(&dword_20DC1A000, v7, OS_LOG_TYPE_DEFAULT, "I am %08X. Received DD from participant %08X on channel [%d] priority [%d].", buf, 0x1Au);
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 7080));
  TracePrintNodes(a1, *(_DWORD *)(a3 + 12), *(_QWORD *)(a3 + 16), 0, *(_DWORD *)(a2 + 88));
  v61 = (pthread_mutex_t *)(a1 + 7080);
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 7080));
  v12 = *(_DWORD *)(a2 + 88);
  if (*(_DWORD *)(a1 + 416) > v12)
    gckSessionSendDD(a1, v12, *(_DWORD *)(a2 + 72), 0);
  pthread_mutex_lock((pthread_mutex_t *)(a2 + 768));
  if (*(double *)(a2 + 752) == 0.0)
  {
    *(double *)(a2 + 752) = micro();
    v13 = gcks_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(double *)(a2 + 752);
      v15 = v14 - *(double *)(a2 + 744);
      v16 = v14 - *(double *)(a2 + 696);
      *(_DWORD *)buf = 134218240;
      *(double *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2048;
      v68 = v16;
      _os_log_impl(&dword_20DC1A000, v13, OS_LOG_TYPE_DEFAULT, "OSPF setup took %g seconds. Overall connection establishment took %g.", buf, 0x16u);
    }
    *(_QWORD *)buf = 0;
    if (CFPropertyListCreateFormatted())
    {
      v17 = gcks_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        gckSessionProcessDD_cold_1();
    }
    else
    {
      MCMetricsLog(CFSTR("com.apple.multipeerconnectivity.gcksession.connectivityinfo"), *(uint64_t *)buf, 0);
      MCDashboardLogJSON(*(uint64_t *)buf, 0, CFSTR("ConnectivityInfo"));
      if (*(_QWORD *)buf)
        CFRelease(*(CFTypeRef *)buf);
    }
  }
  v18 = *(_QWORD **)(a2 + 600);
  if (v18)
  {
    v19 = (_QWORD *)(a2 + 600);
    do
    {
      if (*(_BYTE *)v18 == 2)
      {
        *v19 = v18[8];
        v20 = (void *)v18[5];
        if (v20)
          free(v20);
        free(v18);
      }
      else
      {
        v19 = v18 + 8;
      }
      v18 = (_QWORD *)*v19;
    }
    while (*v19);
  }
  v21 = pthread_mutex_unlock((pthread_mutex_t *)(a2 + 768));
  v22 = *(unsigned int *)(a3 + 12);
  *(_QWORD *)&v66 = *(_QWORD *)(a3 + 16);
  MEMORY[0x24BDAC7A8](v21, v23);
  v25 = (char *)&v58 - ((v24 + 15) & 0x7FFFFFFF0);
  pthread_mutex_lock(v61);
  v65 = v22;
  if ((int)v22 < 1)
  {
    LODWORD(v29) = 0;
  }
  else
  {
    v28 = 0;
    v29 = 0;
    *(_QWORD *)&v27 = 67109632;
    v60 = v27;
    *(_QWORD *)&v27 = 67109120;
    v64 = v27;
    v62 = a1 + 424;
    do
    {
      v30 = *(unsigned int *)(a1 + 420);
      if ((int)v30 < 1)
      {
        LODWORD(v31) = 0;
      }
      else
      {
        v31 = 0;
        v32 = (_DWORD *)(v66 + 416 * v28);
        v33 = (unsigned __int16 *)v6;
        while (*v32 != *(_DWORD *)v33)
        {
          ++v31;
          v33 += 208;
          if (v30 == v31)
            goto LABEL_35;
        }
        v34 = v6;
        v35 = v29;
        v36 = v66 + 416 * v28;
        if (*(unsigned __int16 *)(v36 + 272) <= v33[136])
        {
          v29 = v35;
          v6 = v34;
        }
        else
        {
          v63 = (os_log_t)gcks_log();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
          {
            v37 = *(unsigned __int16 *)(v36 + 272);
            v38 = v33[136];
            v39 = *(_DWORD *)v33;
            *(_DWORD *)buf = v60;
            *(_DWORD *)&buf[4] = v37;
            *(_WORD *)&buf[8] = 1024;
            *(_DWORD *)&buf[10] = v38;
            LOWORD(v68) = 1024;
            *(_DWORD *)((char *)&v68 + 2) = v39;
            _os_log_impl(&dword_20DC1A000, v63, OS_LOG_TYPE_DEFAULT, "DD has newer information (DD SN [%d]/our SN [%d]) about participant [%08X]. Updating the routing table.", buf, 0x14u);
          }
          memcpy(v33, v32, 0x1A0uLL);
          v29 = v35;
          v6 = v62;
        }
      }
      if ((_DWORD)v31 == (_DWORD)v30)
      {
LABEL_35:
        v40 = *(_DWORD *)(a1 + 420);
        v41 = gcks_log();
        v42 = os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
        if (v40 > 15)
        {
          if (v42)
          {
            v45 = *(_DWORD *)(v66 + 416 * v28);
            *(_DWORD *)buf = v64;
            *(_DWORD *)&buf[4] = v45;
            _os_log_impl(&dword_20DC1A000, v41, OS_LOG_TYPE_DEFAULT, "Maximum number of nodes reached. Ignoring node for participant [%08X].", buf, 8u);
          }
        }
        else
        {
          if (v42)
          {
            v43 = *(_DWORD *)(v66 + 416 * v28);
            *(_DWORD *)buf = v64;
            *(_DWORD *)&buf[4] = v43;
            _os_log_impl(&dword_20DC1A000, v41, OS_LOG_TYPE_DEFAULT, "Adding participant [%08X] to the routing table.", buf, 8u);
          }
          v44 = (_DWORD *)(v66 + 416 * v28);
          memcpy((void *)(v6 + 416 * *(int *)(a1 + 420)), v44, 0x1A0uLL);
          ++*(_DWORD *)(a1 + 420);
          *(_DWORD *)&v25[4 * (int)v29] = *v44;
          v29 = (v29 + 1);
        }
      }
      ++v28;
    }
    while (v28 != v65);
  }
  gckSessionUpdateRoutingTable(a1, v26);
  gckPreemptivelyClearFlagsForTransientNodes(a1, (uint64_t)v25, v29);
  if (IsNewInformationAvailableForParticipant)
    v46 = -1;
  else
    v46 = *(_DWORD *)(a2 + 88);
  gckSessionSendLSA(a1, *(_DWORD *)(a1 + 420), v6, v46, 0);
  gckSessionHandleRemainingDisconnectedNodes(a1, 0);
  v65 = *(unsigned int *)(a1 + 420);
  v47 = gcks_log();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v65;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v29;
    _os_log_impl(&dword_20DC1A000, v47, OS_LOG_TYPE_DEFAULT, "Number of nodes in the routing table [%d]. New nodes [%d].", buf, 0xEu);
  }
  if ((int)v29 >= 1)
  {
    v49 = 0;
    v63 = (os_log_t)(a1 + 433);
    *(_QWORD *)&v64 = v29;
    *(_QWORD *)&v48 = 136315138;
    v66 = v48;
    while ((int)v65 < 1)
    {
LABEL_64:
      if (++v49 == (_QWORD)v64)
        goto LABEL_65;
    }
    v50 = v65;
    v51 = v63;
    v52 = v63;
    while (1)
    {
      v53 = *(_DWORD *)&v25[4 * v49];
      if (v53 != *(_DWORD *)((char *)&v51[-2].isa + 7) || *(_DWORD *)((char *)&v51[-1].isa + 3) == -1)
        goto LABEL_63;
      if (*(_DWORD *)(a2 + 80) || *(_DWORD *)(a2 + 88) != v53)
      {
        v57 = gcks_log();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v66;
          *(_QWORD *)&buf[4] = v52;
          v55 = v57;
          v56 = "DD: Connected to participant %s (new connection).";
          goto LABEL_61;
        }
      }
      else
      {
        v54 = gcks_log();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v66;
          *(_QWORD *)&buf[4] = v52;
          v55 = v54;
          v56 = "DD: Connected to participant %s (direct connection).";
LABEL_61:
          _os_log_impl(&dword_20DC1A000, v55, OS_LOG_TYPE_DEFAULT, v56, buf, 0xCu);
        }
      }
      PostEventCallback(*(_QWORD *)(a1 + 408), *(_DWORD *)((char *)&v51[-2].isa + 7), 0, v51, HIBYTE(v51[-1].isa), 0);
LABEL_63:
      v51 += 52;
      v52 += 52;
      if (!--v50)
        goto LABEL_64;
    }
  }
LABEL_65:
  *(_DWORD *)(a2 + 64) = 1;
  pthread_mutex_unlock(v61);
  gckSessionCheckPendingConnections(a1, 0);
}

void gckSessionProcessLSA(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  pthread_mutex_t *v10;
  NSObject *v11;
  int v12;
  unsigned int v13;
  int v14;
  int v15;
  int v16;
  NSObject *v17;
  int v18;
  int v19;
  NSObject *v20;
  uint64_t v21;
  __int128 v22;
  unint64_t v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  _DWORD *v28;
  _DWORD *v29;
  uint64_t v30;
  _DWORD *v31;
  _DWORD *v32;
  NSObject *v33;
  int v34;
  pthread_mutex_t *v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _DWORD *v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  int *v46;
  uint64_t v47;
  int *v48;
  int v49;
  NSObject *v50;
  int v51;
  NSObject *v52;
  unint64_t v53;
  int *v54;
  uint64_t v55;
  unint64_t v56;
  int v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _DWORD *v63;
  int *v64;
  _DWORD *v65;
  int v66;
  unsigned int v67;
  int v68;
  int *v69;
  int v70;
  NSObject *v71;
  _BOOL4 v72;
  int v73;
  unsigned int v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  NSObject *v79;
  _BOOL4 v80;
  int v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  BOOL IsNewInformationAvailableForParticipant;
  int v86;
  int v87;
  __int128 v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  NSObject *v94;
  int v95;
  NSObject *v96;
  uint64_t v97;
  pthread_mutex_t *v98;
  __int128 v99;
  os_log_t v100;
  __int128 v101;
  uint64_t v102;
  unsigned int v103;
  uint64_t v104;
  unsigned int *v105;
  __int128 v106;
  uint8_t buf[4];
  int v108;
  __int16 v109;
  unsigned int v110;
  __int16 v111;
  int v112;
  __int16 v113;
  int v114;
  __int16 v115;
  int v116;
  uint64_t v117;

  v117 = *MEMORY[0x24BDAC8D0];
  v6 = *(unsigned int *)(a3 + 16);
  v105 = *(unsigned int **)(a3 + 24);
  v7 = MEMORY[0x24BDAC7A8](a1, a2);
  v9 = (char *)&v97 - ((v8 + 15) & 0x7FFFFFFF0);
  v10 = (pthread_mutex_t *)(v7 + 7080);
  pthread_mutex_lock((pthread_mutex_t *)(v7 + 7080));
  v11 = gcks_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_DWORD *)(a1 + 416);
    v13 = *(_DWORD *)(a2 + 88);
    v14 = *(unsigned __int16 *)(a3 + 12);
    v15 = *(_DWORD *)(a2 + 72);
    v16 = *(_DWORD *)(a2 + 80);
    *(_DWORD *)buf = 67110144;
    v108 = v12;
    v109 = 1024;
    v110 = v13;
    v111 = 1024;
    v112 = v14;
    v113 = 1024;
    v114 = v15;
    v115 = 1024;
    v116 = v16;
    _os_log_impl(&dword_20DC1A000, v11, OS_LOG_TYPE_DEFAULT, "I am %08X. Received LSA from particpant %08X with SN [%d] channel [%d] priority [%d].", buf, 0x20u);
  }
  v17 = gcks_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DC1A000, v17, OS_LOG_TYPE_DEFAULT, "My nodes:", buf, 2u);
  }
  v18 = *(_DWORD *)(a1 + 420);
  v19 = *(_DWORD *)(a1 + 416);
  *(_QWORD *)&v106 = a1 + 424;
  TracePrintNodes(a1, v18, a1 + 424, 1, v19);
  v20 = gcks_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DC1A000, v20, OS_LOG_TYPE_DEFAULT, "LSA nodes:", buf, 2u);
  }
  TracePrintNodes(a1, *(_DWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), 0, *(_DWORD *)(a2 + 88));
  v23 = *(unsigned int *)(a3 + 16);
  if ((_DWORD)v23 == *(_DWORD *)(a2 + 680))
  {
    if ((int)v23 < 1)
      goto LABEL_20;
    v24 = 0;
    v25 = 0;
    v26 = *(_QWORD *)(a3 + 24);
    v27 = *(_QWORD *)(a2 + 688);
    v28 = (_DWORD *)(v26 + 292);
    v29 = (_DWORD *)(v27 + 292);
    do
    {
      if (*(_DWORD *)(v26 + 416 * v24) != *(_DWORD *)(v27 + 416 * v24))
        break;
      if (*(_DWORD *)(v26 + 416 * v24 + 4) != *(_DWORD *)(v27 + 416 * v24 + 4))
        break;
      if (*(_DWORD *)(v26 + 416 * v24 + 280) != *(_DWORD *)(v27 + 416 * v24 + 280))
        break;
      v30 = *(unsigned int *)(v26 + 416 * v24 + 284);
      if ((_DWORD)v30 != *(_DWORD *)(v27 + 416 * v24 + 284))
        break;
      v31 = v29;
      v32 = v28;
      if ((int)v30 >= 1)
      {
        do
        {
          v21 = (uint64_t)(v31 + 2);
          if (*v32 != *v31 || *(v32 - 1) != *(v31 - 1))
            goto LABEL_19;
          v32 += 2;
          v31 += 2;
        }
        while (--v30);
      }
      ++v24;
      v28 += 104;
      v29 += 104;
      v25 = v24 >= v23;
    }
    while (v24 != v23);
LABEL_19:
    if (v25)
    {
LABEL_20:
      gckSessionSendLSAACK(a1, *(_DWORD *)(a2 + 88), *(_DWORD *)(a2 + 72), *(unsigned __int16 *)(a3 + 12));
      v33 = gcks_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = *(_DWORD *)(a2 + 88);
        *(_DWORD *)buf = 67109120;
        v108 = v34;
        _os_log_impl(&dword_20DC1A000, v33, OS_LOG_TYPE_DEFAULT, "Duplicate LSA from participant %08X: ignoring.", buf, 8u);
      }
      v35 = v10;
LABEL_117:
      pthread_mutex_unlock(v35);
      return;
    }
  }
  *(_DWORD *)(a2 + 680) = v23;
  v36 = *(_DWORD *)(a3 + 16);
  if (v36 < 1)
  {
    v40 = v105;
  }
  else
  {
    v37 = 0;
    v38 = *(_QWORD *)(a3 + 24);
    v39 = 288;
    v40 = v105;
    do
    {
      v41 = v38 + 416 * v37;
      v42 = (_QWORD *)(*(_QWORD *)(a2 + 688) + 416 * v37);
      *v42 = *(_QWORD *)v41;
      v42[35] = *(_QWORD *)(v41 + 280);
      if (*(int *)(v41 + 284) >= 1)
      {
        v43 = 0;
        do
        {
          *(_QWORD *)(*(_QWORD *)(a2 + 688) + v39 + 8 * v43) = *(_QWORD *)(v38 + v39 + 8 * v43);
          ++v43;
          v38 = *(_QWORD *)(a3 + 24);
        }
        while (v43 < *(int *)(v38 + 416 * v37 + 284));
        v36 = *(_DWORD *)(a3 + 16);
      }
      ++v37;
      v39 += 416;
    }
    while (v37 < v36);
  }
  if ((int)v6 < 1)
  {
    v45 = 0;
  }
  else
  {
    v44 = 0;
    v45 = 0;
    v46 = v40 + 72;
    do
    {
      v47 = v40[104 * v44 + 71];
      v48 = v46;
      if ((int)v47 >= 1)
      {
        while (1)
        {
          v49 = *v48;
          v48 += 2;
          if (v49 == *(_DWORD *)(a1 + 416))
            break;
          if (!--v47)
            goto LABEL_39;
        }
        v45 = 1;
      }
LABEL_39:
      ++v44;
      v46 += 104;
    }
    while (v44 != v6);
  }
  if (v36 == 1 && !((*v40 != *(_DWORD *)(a2 + 88)) | v45 & 1))
  {
    v52 = gcks_log();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DC1A000, v52, OS_LOG_TYPE_DEFAULT, "Got declining LSA.", buf, 2u);
    }
    v53 = *(unsigned int *)(a1 + 420);
    v40 = v105;
    v21 = *v105;
    if ((int)v53 < 1)
      goto LABEL_55;
    if (*(_DWORD *)v106 != (_DWORD)v21)
    {
      v54 = (int *)(a1 + 840);
      v55 = 1;
      do
      {
        v56 = v55;
        if (v53 == v55)
          break;
        v57 = *v54;
        ++v55;
        v54 += 104;
      }
      while (v57 != (_DWORD)v21);
      if (v56 >= v53)
      {
LABEL_55:
        PostEventCallback(*(_QWORD *)(a1 + 408), v21, 2, (char *)v105 + 9, *((unsigned __int8 *)v105 + 8), 0);
        v40 = v105;
      }
    }
    *(_DWORD *)(a2 + 56) = 1;
    v58 = *(_DWORD *)(a1 + 16);
    if (v58 != -1)
    {
      *(_DWORD *)(a1 + 16) = -1;
      close(v58);
      v40 = v105;
    }
    goto LABEL_58;
  }
  if (*(_DWORD *)(a2 + 64))
  {
LABEL_58:
    v98 = v10;
    if ((int)v6 < 1)
    {
      v103 = 0;
LABEL_100:
      gckSessionUpdateRoutingTable(a1, v21);
      gckSessionSendLSAACK(a1, *(_DWORD *)(a2 + 88), *(_DWORD *)(a2 + 72), *(unsigned __int16 *)(a3 + 12));
      IsNewInformationAvailableForParticipant = gckIsNewInformationAvailableForParticipant(*(_DWORD *)(a1 + 420), v106, *(_DWORD *)(a2 + 88));
      gckPreemptivelyClearFlagsForTransientNodes(a1, (uint64_t)v9, v103);
      if (IsNewInformationAvailableForParticipant)
        v86 = -1;
      else
        v86 = *(_DWORD *)(a2 + 88);
      gckSessionSendLSA(a1, *(_DWORD *)(a1 + 420), v106, v86, 0);
      v87 = v103;
      gckSessionHandleRemainingDisconnectedNodes(a1, 0);
      v89 = *(unsigned int *)(a1 + 420);
      if (v87 >= 1)
      {
        v90 = 0;
        v91 = v103;
        v105 = (unsigned int *)(a1 + 433);
        *(_QWORD *)&v88 = 67109120;
        v106 = v88;
        do
        {
          if ((int)v89 >= 1)
          {
            v92 = v89;
            v93 = (char *)v105;
            do
            {
              if (*(_DWORD *)&v9[4 * v90] == *(_DWORD *)(v93 - 9) && *(_DWORD *)(v93 - 5) != -1)
              {
                v94 = gcks_log();
                if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
                {
                  v95 = *(_DWORD *)(v93 - 9);
                  *(_DWORD *)buf = v106;
                  v108 = v95;
                  _os_log_impl(&dword_20DC1A000, v94, OS_LOG_TYPE_DEFAULT, "Connected to participant [%08X] (new connection).", buf, 8u);
                }
                PostEventCallback(*(_QWORD *)(a1 + 408), *(_DWORD *)(v93 - 9), 0, v93, *(v93 - 1), 0);
              }
              v93 += 416;
              --v92;
            }
            while (v92);
          }
          ++v90;
        }
        while (v90 != v91);
      }
      v96 = gcks_log();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        v108 = v89;
        v109 = 1024;
        v110 = v103;
        _os_log_impl(&dword_20DC1A000, v96, OS_LOG_TYPE_DEFAULT, "Number of nodes in the routing table [%d] -- New nodes [%d].", buf, 0xEu);
      }
      v35 = v98;
      goto LABEL_117;
    }
    v59 = 0;
    v103 = 0;
    v60 = a1 + 712;
    *(_QWORD *)&v22 = 67109632;
    v99 = v22;
    *(_QWORD *)&v22 = 67109120;
    v101 = v22;
    v104 = a1 + 712;
    v102 = v6;
    while (1)
    {
      v61 = *(unsigned int *)(a1 + 420);
      if ((int)v61 < 1)
      {
        LODWORD(v62) = 0;
      }
      else
      {
        v62 = 0;
        v63 = &v40[104 * v59];
        v64 = (int *)v106;
        while (*v63 != *v64)
        {
          ++v62;
          v64 += 104;
          if (v61 == v62)
            goto LABEL_74;
        }
        v65 = &v40[104 * v59];
        if (*((unsigned __int16 *)v65 + 136) <= *((unsigned __int16 *)v64 + 136))
        {
          v6 = v102;
        }
        else
        {
          v100 = (os_log_t)gcks_log();
          if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
          {
            v66 = *((unsigned __int16 *)v65 + 136);
            v67 = *((unsigned __int16 *)v64 + 136);
            v68 = *v64;
            *(_DWORD *)buf = v99;
            v108 = v66;
            v109 = 1024;
            v110 = v67;
            v111 = 1024;
            v112 = v68;
            _os_log_impl(&dword_20DC1A000, v100, OS_LOG_TYPE_DEFAULT, "LSA has newer information (LSA SN [%d]/our SN [%d]) about participant [%08X]. Updating the routing table.", buf, 0x14u);
          }
          memcpy(v64, v63, 0x1A0uLL);
          if (v64[71])
          {
            v6 = v102;
            v40 = v105;
          }
          else
          {
            v79 = gcks_log();
            v80 = os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT);
            v6 = v102;
            if (v80)
            {
              v81 = *v64;
              *(_DWORD *)buf = v101;
              v108 = v81;
              _os_log_impl(&dword_20DC1A000, v79, OS_LOG_TYPE_DEFAULT, "Participant [%08X] is disconnected.", buf, 8u);
            }
            v82 = *(unsigned int *)(a1 + 708);
            v40 = v105;
            if ((int)v82 > 0)
            {
              v83 = 0;
              v84 = 8 * v82;
              v60 = v104;
              while (*(_DWORD *)(v104 + v83) != *v64)
              {
                v83 += 8;
                if (v84 == v83)
                  goto LABEL_73;
              }
              gckSessionDeleteNeighbor(a1, (int *)(v104 + v83));
              gckSessionRequestLSAUpdateForNode((int *)v106);
              v60 = v104;
              v40 = v105;
              goto LABEL_73;
            }
          }
          v60 = v104;
        }
      }
LABEL_73:
      if ((_DWORD)v62 == (_DWORD)v61)
      {
LABEL_74:
        v69 = &v40[104 * v59];
        if (v69[71])
        {
          v70 = *(_DWORD *)(a1 + 420);
          v71 = gcks_log();
          v72 = os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT);
          if (v70 > 15)
          {
            if (v72)
            {
              v78 = *v69;
              *(_DWORD *)buf = v101;
              v108 = v78;
              _os_log_impl(&dword_20DC1A000, v71, OS_LOG_TYPE_DEFAULT, "Maximum number of nodes reached. Ignoring node [%08X].", buf, 8u);
            }
          }
          else
          {
            if (v72)
            {
              v73 = *v69;
              *(_DWORD *)buf = v101;
              v108 = v73;
              _os_log_impl(&dword_20DC1A000, v71, OS_LOG_TYPE_DEFAULT, "Adding participant [%08X] to the routing table.", buf, 8u);
            }
            memcpy((void *)(v106 + 416 * *(int *)(a1 + 420)), v69, 0x1A0uLL);
            ++*(_DWORD *)(a1 + 420);
            v74 = v103;
            *(_DWORD *)&v9[4 * v103] = *v69;
            v103 = v74 + 1;
          }
          v60 = v104;
          v40 = v105;
        }
        else
        {
          v75 = *(unsigned int *)(a1 + 708);
          if ((int)v75 >= 1)
          {
            v76 = 0;
            v77 = 8 * v75;
            while (*(_DWORD *)(v60 + v76) != *v69)
            {
              v76 += 8;
              if (v77 == v76)
                goto LABEL_88;
            }
            gckSessionDeleteNeighbor(a1, (int *)(v60 + v76));
            gckSessionRequestLSAUpdateForNode((int *)v106);
            v60 = v104;
LABEL_88:
            v40 = v105;
          }
        }
      }
      if (++v59 == v6)
        goto LABEL_100;
    }
  }
  pthread_mutex_unlock(v10);
  v50 = gcks_log();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    v51 = *(_DWORD *)(a2 + 88);
    *(_DWORD *)buf = 67109120;
    v108 = v51;
    _os_log_impl(&dword_20DC1A000, v50, OS_LOG_TYPE_DEFAULT, "Premature LSA from participant %08X: ignoring.", buf, 8u);
  }
}

BOOL gckIsNewInformationAvailableForParticipant(int a1, uint64_t a2, int a3)
{
  uint64_t v4;
  _DWORD *v5;
  BOOL v6;
  NSObject *v7;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a1 < 1)
  {
    return 0;
  }
  else
  {
    v4 = 0;
    v5 = (_DWORD *)(a2 + 280);
    v6 = 1;
    while (!*(v5 - 1) || *v5 == a3)
    {
      v5 += 104;
      v6 = ++v4 < (unint64_t)a1;
      if (a1 == v4)
        return v6;
    }
    v7 = gcks_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = a3;
      _os_log_impl(&dword_20DC1A000, v7, OS_LOG_TYPE_DEFAULT, "New information is available for participant [%08X].", (uint8_t *)v9, 8u);
    }
  }
  return v6;
}

void gckSessionSendDD(uint64_t a1, unsigned int a2, int a3, int a4)
{
  pthread_mutex_t *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  pthread_mutex_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  char *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  unsigned int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v25 = 0u;
  v26 = 0u;
  v24 = 0;
  v8 = (pthread_mutex_t *)(a1 + 7080);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 7080));
  HIDWORD(v25) = *(_DWORD *)(a1 + 420);
  *(_QWORD *)&v26 = a1 + 424;
  v9 = *(_QWORD *)(a1 + 7184);
  if (!v9)
  {
LABEL_5:
    v10 = gcks_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v28) = a2;
      _os_log_impl(&dword_20DC1A000, v10, OS_LOG_TYPE_DEFAULT, "Couldn't find cList with iPriority == 0 for participant [%08X].", buf, 8u);
    }
    pthread_mutex_unlock(v8);
    return;
  }
  while (*(_DWORD *)(v9 + 88) != a2 || *(_DWORD *)(v9 + 80))
  {
    v9 = *(_QWORD *)(v9 + 832);
    if (!v9)
      goto LABEL_5;
  }
  if (!*(_DWORD *)(v9 + 60))
    gckSessionRequestLSAUpdateForNode((int *)(a1 + 424));
  v11 = OSPFMakeDD(&v24, (uint64_t)&v25, 0, *(_DWORD *)(a1 + 416), a2, *(_DWORD *)(v9 + 32));
  *(_DWORD *)(v9 + 60) = 1;
  pthread_mutex_unlock(v8);
  if (v11 < 0)
  {
    v14 = gcks_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      gckSessionSendDD_cold_1();
    return;
  }
  if (!a4)
  {
    v15 = gcks_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v28 = " back";
      v29 = 1024;
      v30 = v11;
      v31 = 1024;
      v32 = a2;
      _os_log_impl(&dword_20DC1A000, v15, OS_LOG_TYPE_DEFAULT, "Sending DD%s with %d bytes to participant %08X.", buf, 0x18u);
    }
    pthread_mutex_lock(v8);
    TracePrintNodes(a1, *(_DWORD *)(a1 + 420), a1 + 424, 1, *(_DWORD *)(a1 + 416));
    pthread_mutex_unlock(v8);
    SendUDPPacketToParticipantChannelID(a1, (uint64_t)v24, v11, a2, 0, a3, 0);
    goto LABEL_24;
  }
  v12 = *(_QWORD *)(a1 + 7184);
  if (!v12)
  {
LABEL_17:
    v13 = gcks_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v28) = a2;
      _os_log_impl(&dword_20DC1A000, v13, OS_LOG_TYPE_DEFAULT, "Couldn't find cList with iPriority == 0 for participant [%08X].", buf, 8u);
    }
LABEL_24:
    free(v24);
    return;
  }
  while (*(_DWORD *)(v12 + 88) != a2 || *(_DWORD *)(v12 + 80))
  {
    v12 = *(_QWORD *)(v12 + 832);
    if (!v12)
      goto LABEL_17;
  }
  v16 = (pthread_mutex_t *)(v12 + 768);
  pthread_mutex_lock((pthread_mutex_t *)(v12 + 768));
  v17 = *(_QWORD *)(v12 + 600);
  if (v17)
  {
    while (1)
    {
      v18 = v17;
      if (*(_BYTE *)v17 == 2)
        break;
      v17 = *(_QWORD *)(v17 + 64);
      if (!v17)
      {
        v19 = (_QWORD *)(v18 + 64);
        goto LABEL_30;
      }
    }
    *(_OWORD *)(v17 + 8) = xmmword_20DC4CA80;
    *(_QWORD *)(v17 + 32) = 0x4082BFEB851EB852;
    v22 = *(void **)(v17 + 40);
    if (v22)
      free(v22);
    *(_QWORD *)(v18 + 40) = v24;
    *(_DWORD *)(v18 + 48) = v11;
    *(_DWORD *)(v18 + 52) = a2;
  }
  else
  {
    v19 = (_QWORD *)(v12 + 600);
LABEL_30:
    v20 = (char *)malloc_type_calloc(1uLL, 0x48uLL, 0x10200409EACE7F9uLL);
    *v20 = 2;
    *(_OWORD *)(v20 + 8) = xmmword_20DC4CA80;
    v21 = v24;
    *((_QWORD *)v20 + 4) = 0x4082BFEB851EB852;
    *((_QWORD *)v20 + 5) = v21;
    *((_DWORD *)v20 + 12) = v11;
    *((_DWORD *)v20 + 13) = a2;
    *v19 = v20;
  }
  pthread_mutex_unlock(v16);
  v23 = *(_DWORD *)(a1 + 16);
  if (v23 != -1)
  {
    *(_DWORD *)(a1 + 16) = -1;
    close(v23);
  }
}

void gckPreemptivelyClearFlagsForTransientNodes(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  NSObject *v9;
  int v10;
  uint8_t buf[4];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a2 && a3 >= 1)
  {
    v4 = 0;
    v5 = (int *)(a1 + 424);
    v6 = a3;
    do
    {
      v7 = v6;
      v8 = v5;
      do
      {
        if (*(_DWORD *)(a2 + 4 * v4) == *v8 && v8[1] == -1)
        {
          v9 = gcks_log();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            v10 = *v8;
            *(_DWORD *)buf = 67109120;
            v12 = v10;
            _os_log_impl(&dword_20DC1A000, v9, OS_LOG_TYPE_DEFAULT, "Received LSA with no route to previously unknown participant [%08X] (no old connection).", buf, 8u);
          }
          v8[69] = 0;
        }
        v8 += 104;
        --v7;
      }
      while (v7);
      ++v4;
    }
    while (v4 != v6);
  }
}

__n128 gckSessionSendLSA(uint64_t a1, unsigned int a2, uint64_t a3, int a4, int a5)
{
  uint64_t v9;
  unsigned int v10;
  __n128 result;
  unsigned int v12;
  __int16 v13;
  int v14;
  uint64_t v15;
  int v16;
  NSObject *v17;
  pthread_mutex_t *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  char *v23;
  void *v24;
  NSObject *v25;
  int v26;
  NSObject *v27;
  int v28;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint8_t buf[4];
  int v36;
  __int16 v37;
  unsigned int v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v31 = 0;
  v32 = 0;
  v34 = a3;
  v33 = a2;
  if (*(int *)(a1 + 708) >= 1)
  {
    v9 = 0;
    v10 = 0;
    v30 = 0;
    result.n128_u64[0] = 67109376;
    do
    {
      v12 = *(_DWORD *)(a1 + 8 * v9 + 712);
      if (v12 != a4)
      {
        v13 = *(_WORD *)(a1 + 20);
        *(_WORD *)(a1 + 20) = v13 + 1;
        WORD2(v32) = v13;
        v14 = OSPFMakeLSA(&v30, (uint64_t)&v31, 0, *(_DWORD *)(a1 + 416), v12, 0);
        if (v14 < 0)
        {
          v17 = gcks_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_20DC1A000, v17, OS_LOG_TYPE_DEFAULT, "OSPFMakeLSA failed.", buf, 2u);
          }
        }
        else
        {
          v15 = *(_QWORD *)(a1 + 7184);
          if (!v15)
            goto LABEL_24;
          v16 = v14;
          while (v12 != *(_DWORD *)(v15 + 88) || *(_DWORD *)(v15 + 80))
          {
            v15 = *(_QWORD *)(v15 + 832);
            if (!v15)
              goto LABEL_24;
          }
          if (!*(_DWORD *)(v15 + 60) && a5 == 0)
          {
LABEL_24:
            free(v30);
          }
          else
          {
            v19 = (pthread_mutex_t *)(v15 + 768);
            pthread_mutex_lock((pthread_mutex_t *)(v15 + 768));
            v20 = (_QWORD *)(v15 + 600);
            do
            {
              v21 = v20;
              v22 = *v20;
              v20 = (_QWORD *)(*v20 + 64);
            }
            while (v22);
            v23 = (char *)malloc_type_calloc(1uLL, 0x48uLL, 0x10200409EACE7F9uLL);
            *v23 = 4;
            *(_OWORD *)(v23 + 8) = xmmword_20DC4CA80;
            v24 = v30;
            *((_QWORD *)v23 + 4) = 0x4082BFEB851EB852;
            *((_QWORD *)v23 + 5) = v24;
            *((_DWORD *)v23 + 12) = v16;
            *((_DWORD *)v23 + 13) = v12;
            *((_WORD *)v23 + 28) = WORD2(v32);
            *v21 = v23;
            pthread_mutex_unlock(v19);
            v25 = gcks_log();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              v36 = WORD2(v32);
              v37 = 1024;
              v38 = v12;
              _os_log_impl(&dword_20DC1A000, v25, OS_LOG_TYPE_DEFAULT, "Sending LSA with SN [%d] to participant [%08X].", buf, 0xEu);
            }
            v26 = *(_DWORD *)(a1 + 16);
            if (v26 != -1)
            {
              *(_DWORD *)(a1 + 16) = -1;
              close(v26);
            }
            ++v10;
          }
        }
      }
      ++v9;
    }
    while (v9 < *(int *)(a1 + 708));
    if (v10)
    {
      TracePrintNodes(a1, a2, a3, 1, *(_DWORD *)(a1 + 416));
      v27 = gcks_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = *(_DWORD *)(a1 + 416);
        *(_DWORD *)buf = 67109376;
        v36 = v28;
        v37 = 1024;
        v38 = v10;
        _os_log_impl(&dword_20DC1A000, v27, OS_LOG_TYPE_DEFAULT, "I am participant %08X. Just sent LSAs to %d participants.", buf, 0xEu);
      }
    }
  }
  return result;
}

void gckSessionHandleRemainingDisconnectedNodes(uint64_t a1, uint64_t a2)
{
  _DWORD *v2;
  int v3;
  int v4;
  int *v5;
  int *v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int *v14;
  int v15;
  uint64_t i;
  int v17;
  _DWORD v18[1664];
  uint64_t v19;

  v2 = (_DWORD *)MEMORY[0x24BDAC7A8](a1, a2);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = (uint64_t)v2;
  v19 = *MEMORY[0x24BDAC8D0];
  v17 = 0;
  gckSessionFindAndRemoveDisconnectedNodes(v2, (uint64_t)v18, &v17);
  v10 = v17;
  if (v17 >= 1)
  {
    v11 = 0;
    do
    {
      v12 = v18[104 * v11];
      v13 = v4;
      v14 = v6;
      if (v4 < 1)
      {
LABEL_6:
        gckSessionDisconnectParticipant(v9, v18[104 * v11], (char *)&v18[104 * v11 + 2] + 1, LOBYTE(v18[104 * v11 + 2]), v8);
        for (i = *(_QWORD *)(v9 + 7184); i; i = *(_QWORD *)(i + 832))
        {
          if (*(_DWORD *)(i + 88) == v12)
            gckSessionScheduleCListClose(i, v8);
        }
      }
      else
      {
        while (1)
        {
          v15 = *v14++;
          if (v15 == v12)
            break;
          if (!--v13)
            goto LABEL_6;
        }
      }
      ++v11;
    }
    while (v11 != v10);
  }
}

void gckSessionRequestLSAUpdateForNode(int *a1)
{
  NSObject *v2;
  int v3;
  int v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  ++*((_WORD *)a1 + 136);
  a1[69] = 1;
  v2 = gcks_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *a1;
    v4 = *((unsigned __int16 *)a1 + 136);
    v5[0] = 67109376;
    v5[1] = v3;
    v6 = 1024;
    v7 = v4;
    _os_log_impl(&dword_20DC1A000, v2, OS_LOG_TYPE_DEFAULT, "Requesting LSA update for node with ID [%08X] serial number [%d].", (uint8_t *)v5, 0xEu);
  }
}

_DWORD *gckSessionFindAndRemoveDisconnectedNodes(_DWORD *result, uint64_t a2, _DWORD *a3)
{
  int v3;
  uint64_t v5;
  int v6;
  int v7;
  _DWORD *v8;
  int *v9;
  NSObject *v10;
  int v11;
  int v12;
  int i;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = result[105];
  if (v3 < 1)
  {
    v7 = 0;
  }
  else
  {
    v5 = (uint64_t)result;
    v6 = 0;
    v7 = 0;
    do
    {
      v8 = (_DWORD *)(v5 + 416 * v6);
      v8[175] = 0;
      if (v8[107] == -1)
      {
        v9 = v8 + 106;
        v10 = gcks_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = *v9;
          *(_DWORD *)buf = 136315394;
          v17 = v5 + 416 * v6 + 433;
          v18 = 1024;
          v19 = v11;
          _os_log_impl(&dword_20DC1A000, v10, OS_LOG_TYPE_DEFAULT, "No route to participant \"%s\"[%08X] -- disconnected.", buf, 0x12u);
        }
        v12 = *(_DWORD *)(v5 + 708);
        if (v12 >= 1)
        {
          for (i = 0; i < v12; ++i)
          {
            v14 = v5 + 8 * i;
            if (*(_DWORD *)(v14 + 712) == *v9)
            {
              gckSessionDeleteNeighbor(v5, (int *)(v14 + 712));
              --i;
              v12 = *(_DWORD *)(v5 + 708);
            }
          }
        }
        memcpy((void *)(a2 + 416 * v7), v9, 0x1A0uLL);
        result = gckSessionDeleteDisconnectedNode(v5, v9);
        --v6;
        v3 = *(_DWORD *)(v5 + 420);
        ++v7;
      }
      ++v6;
    }
    while (v6 < v3);
  }
  *a3 = v7;
  return result;
}

void gckSessionDeleteNeighbor(uint64_t a1, int *a2)
{
  NSObject *v4;
  int v5;
  uint64_t v6;
  int *v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = gcks_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *a2;
    v8[0] = 67109120;
    v8[1] = v5;
    _os_log_impl(&dword_20DC1A000, v4, OS_LOG_TYPE_DEFAULT, "Deleting neighbor representing participant %08X.", (uint8_t *)v8, 8u);
  }
  v6 = *(int *)(a1 + 708) - 1;
  v7 = (int *)(a1 + 8 * v6 + 712);
  if (v7 != a2)
  {
    *(_QWORD *)a2 = *(_QWORD *)v7;
    LODWORD(v6) = *(_DWORD *)(a1 + 708) - 1;
  }
  *(_DWORD *)(a1 + 708) = v6;
}

void *gckSessionDeleteDisconnectedNode(uint64_t a1, int *a2)
{
  NSObject *v4;
  int v5;
  void *result;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = gcks_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *a2;
    v7[0] = 67109120;
    v7[1] = v5;
    _os_log_impl(&dword_20DC1A000, v4, OS_LOG_TYPE_DEFAULT, "Deleting node for participant %08X.", (uint8_t *)v7, 8u);
  }
  result = memmove(a2, (const void *)(a1 + 416 * *(int *)(a1 + 420) + 8), 0x1A0uLL);
  --*(_DWORD *)(a1 + 420);
  return result;
}

void gckSessionDisconnectParticipant(uint64_t a1, int a2, const void *a3, int a4, int a5)
{
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t i;
  _DWORD v16[2];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v10 = gcks_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109120;
    v16[1] = a2;
    _os_log_impl(&dword_20DC1A000, v10, OS_LOG_TYPE_DEFAULT, "Disconnecting participant [%08X].", (uint8_t *)v16, 8u);
  }
  v11 = *(_QWORD *)(a1 + 408);
  v12 = *(unsigned int *)(v11 + 168);
  if ((int)v12 < 1)
  {
    LODWORD(v13) = 0;
  }
  else
  {
    v13 = 0;
    while (*(_DWORD *)(v11 + 172 + 4 * v13) != a2)
    {
      if (v12 == ++v13)
      {
        LODWORD(v13) = *(_DWORD *)(v11 + 168);
        break;
      }
    }
  }
  if (v13 <= 0xF && (_DWORD)v13 == (_DWORD)v12)
  {
    *(_DWORD *)(v11 + 4 * v12 + 172) = a2;
    *(_DWORD *)(v11 + 168) = v12 + 1;
  }
  if (a5)
    v14 = -2145779689;
  else
    v14 = 0;
  PostEventCallback(v11, a2, 2, a3, a4, v14);
  for (i = *(_QWORD *)(a1 + 7184); i; i = *(_QWORD *)(i + 832))
  {
    if (*(_DWORD *)(i + 88) == a2)
      gckSessionScheduleCListClose(i, a5);
  }
}

void gckSessionScheduleCListClose(uint64_t a1, int a2)
{
  NSObject *v4;
  int v5;
  int v6;
  NSObject *v7;
  _DWORD v8[2];
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = gcks_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(a1 + 88);
    v6 = *(_DWORD *)(a1 + 72);
    v8[0] = 67109376;
    v8[1] = v5;
    v9 = 1024;
    v10 = v6;
    _os_log_impl(&dword_20DC1A000, v4, OS_LOG_TYPE_DEFAULT, "Scheduling to close CList corresponding to participant (%08X), channel %d.", (uint8_t *)v8, 0xEu);
  }
  *(_DWORD *)(a1 + 56) = 1;
  if (a2)
  {
    *(double *)(a1 + 8) = micro();
    v7 = gcks_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl(&dword_20DC1A000, v7, OS_LOG_TYPE_DEFAULT, "Timed out, enforcing clean up.", (uint8_t *)v8, 2u);
    }
  }
}

void gckSessionSendLSAACK(uint64_t a1, unsigned int a2, int a3, int a4)
{
  int v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  _OWORD v12[2];
  uint8_t buf[4];
  int v14;
  __int16 v15;
  unsigned int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  memset(v12, 0, sizeof(v12));
  v11 = 0;
  WORD6(v12[0]) = a4;
  v8 = OSPFMakeLSAACK(&v11, (uint64_t)v12, 0, *(_DWORD *)(a1 + 416), a2);
  v9 = gcks_log();
  v10 = v9;
  if (v8 < 0)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      gckSessionSendLSAACK_cold_1();
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v14 = a4;
      v15 = 1024;
      v16 = a2;
      _os_log_impl(&dword_20DC1A000, v10, OS_LOG_TYPE_DEFAULT, "Sending LSAACK with SN [%d] to participant [%08X].", buf, 0xEu);
    }
    SendUDPPacketToParticipantChannelID(a1, (uint64_t)v11, v8, a2, 0, a3, 0);
    free(v11);
  }
}

uint64_t gckSessionHandleDeletedNode(_DWORD *a1, int a2, int a3)
{
  uint64_t v6;
  uint64_t v7;
  int *v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  int *v12;
  int v13;
  uint64_t v15;
  int v16;
  unint64_t v17;
  uint64_t v18;
  _DWORD *v19;
  _DWORD v21[2];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a1[177];
  if ((int)v6 < 1)
  {
    LODWORD(v7) = 0;
  }
  else
  {
    v7 = 0;
    v8 = a1 + 178;
    while (1)
    {
      v9 = *v8;
      v8 += 2;
      if (v9 == a2)
        break;
      if (v6 == ++v7)
        goto LABEL_8;
    }
  }
  if ((_DWORD)v7 == (_DWORD)v6)
  {
LABEL_8:
    v10 = 2149187606;
    v11 = gcks_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v21[0] = 67109120;
      v21[1] = a2;
      _os_log_impl(&dword_20DC1A000, v11, OS_LOG_TYPE_DEFAULT, "Participant %08X not found.", (uint8_t *)v21, 8u);
    }
  }
  else
  {
    v12 = &a1[2 * v7 + 178];
    v13 = v12[1];
    gckSessionDeleteNeighbor((uint64_t)a1, v12);
    if (v13 != -1 || a3 != 0)
    {
      gckSessionRequestLSAUpdateForNode(a1 + 106);
      if (a3)
      {
        v16 = a1[105];
        if (v16 >= 1)
        {
          v17 = 0;
          v18 = 416 * v16;
          while (1)
          {
            v19 = &a1[v17 / 4];
            if (a1[v17 / 4 + 106] == a2)
              break;
            v17 += 416;
            if (v18 == v17)
              goto LABEL_21;
          }
          gckSessionDisconnectParticipant((uint64_t)a1, a2, (char *)v19 + 433, *((unsigned __int8 *)v19 + 432), 1);
          gckSessionDeleteDisconnectedNode((uint64_t)a1, v19 + 106);
        }
      }
LABEL_21:
      gckSessionUpdateRoutingTable((uint64_t)a1, v15);
    }
    return 0;
  }
  return v10;
}

uint64_t gckSessionGetInterfacePriorityForCList(uint64_t a1, uint64_t a2)
{
  int v2;
  const __CFArray *v5;
  const __CFArray *v6;
  CFIndex Count;
  CFIndex v8;
  CFIndex v9;
  const __SCNetworkInterface *ValueAtIndex;
  const __SCNetworkInterface *v11;
  const __CFString *InterfaceType;
  const __CFString *BSDName;
  const char *CStringPtr;
  NSObject *v15;
  const char *v16;
  const char *v17;
  int v18;
  int v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v23;
  const char *v24;
  int v25;
  int v26;
  uint64_t IORegistryEntryID;
  uint64_t v28;
  mach_port_t v29;
  const __CFDictionary *v30;
  io_registry_entry_t v31;
  io_object_t v32;
  io_iterator_t existing[2];
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  char buffer[256];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v2 = *(_DWORD *)(a2 + 384);
  if ((v2 & 0x100) != 0)
    return 4;
  if ((v2 & 4) != 0)
    return 1;
  v5 = SCNetworkInterfaceCopyAll();
  if (!v5)
  {
    v21 = gcks_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      gckSessionGetInterfacePriorityForCList_cold_1();
    return 0;
  }
  v6 = v5;
  Count = CFArrayGetCount(v5);
  if (Count < 1)
    goto LABEL_19;
  v8 = Count;
  v9 = 0;
  while (1)
  {
    ValueAtIndex = (const __SCNetworkInterface *)CFArrayGetValueAtIndex(v6, v9);
    if (ValueAtIndex)
    {
      v11 = ValueAtIndex;
      InterfaceType = SCNetworkInterfaceGetInterfaceType(ValueAtIndex);
      BSDName = SCNetworkInterfaceGetBSDName(v11);
      CStringPtr = CFStringGetCStringPtr(BSDName, 0x8000100u);
      if (!CStringPtr)
      {
        if (CFStringGetCString(BSDName, buffer, 256, 0x8000100u))
          CStringPtr = buffer;
        else
          CStringPtr = 0;
      }
      if (!InterfaceType || !BSDName || !CStringPtr)
      {
        v15 = gcks_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = CFStringGetCStringPtr(InterfaceType, 0x8000100u);
          v17 = CFStringGetCStringPtr(BSDName, 0x8000100u);
          v18 = *(_DWORD *)(a2 + 88);
          v19 = *(_DWORD *)(a2 + 72);
          *(_DWORD *)buf = 136315906;
          v35 = v16;
          v36 = 2080;
          v37 = v17;
          v38 = 1024;
          v39 = v18;
          v40 = 1024;
          v41 = v19;
          _os_log_impl(&dword_20DC1A000, v15, OS_LOG_TYPE_DEFAULT, "Invalid type [%s] or bsd name [%s] for participant [%08X] channelID [%d].", buf, 0x22u);
        }
        goto LABEL_18;
      }
      if (!strcmp((const char *)(a2 + 388), CStringPtr))
        break;
    }
LABEL_18:
    if (v8 == ++v9)
      goto LABEL_19;
  }
  if (CFStringCompare(InterfaceType, (CFStringRef)*MEMORY[0x24BDF5A48], 0) == kCFCompareEqualTo)
  {
    v20 = 3;
    goto LABEL_20;
  }
  if (CFStringCompare(InterfaceType, (CFStringRef)*MEMORY[0x24BDF5A40], 0) == kCFCompareEqualTo)
  {
    *(_DWORD *)buf = 0;
    *(_QWORD *)existing = 0;
    IORegistryEntryID = _SCNetworkInterfaceGetIORegistryEntryID();
    if (!IORegistryEntryID)
    {
      v29 = 0;
LABEL_44:
      if (*(_DWORD *)buf)
        mach_port_deallocate(*MEMORY[0x24BDAEC58], *(mach_port_name_t *)buf);
      if (v29)
      {
        if (*(_DWORD *)(a1 + 7540))
          v20 = 7;
        else
          v20 = 5;
      }
      else
      {
        v20 = 6;
      }
      goto LABEL_20;
    }
    v28 = IORegistryEntryID;
    IOMasterPort(*MEMORY[0x24BDAD2F0], (mach_port_t *)buf);
    v29 = *(_DWORD *)buf;
    if (*(_DWORD *)buf)
    {
      v30 = IORegistryEntryIDMatching(v28);
      IOServiceGetMatchingServices(v29, v30, &existing[1]);
      if (!existing[1])
      {
        v29 = 0;
LABEL_42:
        if (existing[0])
          IOObjectRelease(existing[0]);
        goto LABEL_44;
      }
      v31 = IOIteratorNext(existing[1]);
      v32 = v31;
      if (v31 && (IORegistryEntryGetParentEntry(v31, "IOService", existing), existing[0]))
        v29 = IOObjectConformsTo(existing[0], "AppleUSBDeviceNCMData");
      else
        v29 = 0;
    }
    else
    {
      v32 = 0;
    }
    if (existing[1])
      IOObjectRelease(existing[1]);
    if (v32)
      IOObjectRelease(v32);
    goto LABEL_42;
  }
  v23 = gcks_log();
  v20 = 0;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = CFStringGetCStringPtr(InterfaceType, 0x8000100u);
    v25 = *(_DWORD *)(a2 + 88);
    v26 = *(_DWORD *)(a2 + 72);
    *(_DWORD *)buf = 136315906;
    v35 = v24;
    v36 = 2080;
    v37 = CStringPtr;
    v38 = 1024;
    v39 = v25;
    v40 = 1024;
    v41 = v26;
    _os_log_impl(&dword_20DC1A000, v23, OS_LOG_TYPE_DEFAULT, "Unexpected type [%s] for bsd name [%s] of participant [%08X] channelID [%d].", buf, 0x22u);
LABEL_19:
    v20 = 0;
  }
LABEL_20:
  CFRelease(v6);
  return v20;
}

void OUTLINED_FUNCTION_4_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_8_2()
{
  void *v0;

  return objc_msgSend(v0, "displayNameAndPID");
}

uint64_t OUTLINED_FUNCTION_13_0(void *a1, const char *a2)
{
  return objc_msgSend(a1, "peerID");
}

uint64_t AGPSendingSetElement::buffer(CAGP **this, unsigned __int8 *a2, unsigned int a3, int a4, unsigned int a5, unsigned int a6, char a7)
{
  pthread_mutex_t *v14;
  _BOOL4 can_buffer;
  uint64_t v16;
  unsigned int v17;
  CAGP **v18;
  int v19;
  int v20;
  CAGP *v21;
  CAGP *v22;

  v14 = (pthread_mutex_t *)(this + 4);
  pthread_mutex_lock((pthread_mutex_t *)(this + 4));
  can_buffer = AGPAssociationSetElement::can_buffer((AGPAssociationSetElement *)this, 1);
  v16 = 0xFFFFFFFFLL;
  if (a5 <= a6 && a2 && a3 - 1 <= 0x5DB && can_buffer)
  {
    v17 = *((unsigned __int8 *)this + 699);
    if (v17 > 0x3F)
    {
      v16 = 0xFFFFFFFFLL;
    }
    else
    {
      *((_BYTE *)this + 699) = v17 + 1;
      v16 = *((unsigned __int8 *)this + 697);
      *((_BYTE *)this + 697) = (v16 + 1) & 0x3F;
      v18 = &this[v16];
      *((_DWORD *)v18[15] + 2) = *((_DWORD *)v18[15] + 2) & 0xFFFFFFFE | !AGPAssociationSetElement::can_buffer((AGPAssociationSetElement *)this, 1);
      *((_DWORD *)v18[15] + 2) |= 2u;
      *((_DWORD *)v18[15] + 2) = *((_DWORD *)v18[15] + 2) & 0xFFFFC0FF | ((v16 & 0x3F) << 8);
      *((_DWORD *)v18[15] + 2) = *((_DWORD *)v18[15] + 2) & 0xFFFFFF03 | (4 * (*((_BYTE *)this + 698) & 0x3F));
      *((_DWORD *)v18[15] + 2) = *((_DWORD *)v18[15] + 2) & 0x3FFFFFF | (*((unsigned __int8 *)this + 697) << 26);
      *((_DWORD *)v18[15] + 2) = *((_DWORD *)v18[15] + 2) & 0xFFFFC0FF | ((v16 & 0x3F) << 8);
      *((_DWORD *)v18[15] + 2) = *((_DWORD *)v18[15] + 2) & 0xFFF03FFF | ((a5 & 0x3F) << 14);
      *((_DWORD *)v18[15] + 2) = *((_DWORD *)v18[15] + 2) & 0xFC0FFFFF | ((a6 & 0x3F) << 20);
      v19 = *((_DWORD *)this + 27);
      *((_DWORD *)this + 27) = v19 + 1;
      *(_DWORD *)v18[15] = v19;
      v20 = CAGP::current_timestamp(this[1]);
      v21 = v18[15];
      *((_DWORD *)v21 + 1) = v20;
      *((_DWORD *)v21 + 3) = a3;
      *((_DWORD *)v21 + 379) = a4;
      *((_BYTE *)this + v16 + 632) = a7;
      memcpy((char *)v18[15] + 16, a2, a3);
      this[12] = (CAGP *)((unint64_t)this[12] | (1 << v16));
      v22 = this[1];
      ++*((_DWORD *)v22 + 92);
      *((_DWORD *)v22 + 93) += a3;
    }
  }
  pthread_mutex_unlock(v14);
  return v16;
}

BOOL AGPAssociationSetElement::can_buffer(AGPAssociationSetElement *this, _BOOL8 a2)
{
  pthread_mutex_t *v4;
  int v5;
  int v6;
  int v7;

  v4 = (pthread_mutex_t *)((char *)this + 32);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 32));
  v5 = *((unsigned __int8 *)this + 698);
  v6 = *((unsigned __int8 *)this + 696);
  if (v5 == v6)
  {
    v7 = 0;
    if (!a2)
      goto LABEL_6;
    goto LABEL_5;
  }
  v7 = ((((v6 - v5) & ~((v6 - v5) >> 31)) + v5 - v6 + 63) & 0xFFFFFFC0) + v6 - v5;
  if (a2)
LABEL_5:
    a2 = 64 - v7 - *((unsigned __int8 *)this + 699) >= a2;
LABEL_6:
  pthread_mutex_unlock(v4);
  return a2;
}

uint64_t CAGP::current_timestamp(CAGP *this)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  timeval v6;

  v2 = *((unsigned int *)this + 52);
  if (!gettimeofday(&v6, 0))
  {
    v3 = (v6.tv_usec / 1000 + 1000 * (SLODWORD(v6.tv_sec) % 604800)) % 0x240C8400u;
    v2 = *((unsigned int *)this + 52);
    if ((_DWORD)v2 == -1
      || (v2 > v3 ? (v4 = (v2 - v3) >= 0x12064201) : (v4 = 1), v4))
    {
      *((_DWORD *)this + 52) = v3;
      return v3;
    }
  }
  return v2;
}

uint64_t AGPSendingSetElement::search(AGPSendingSetElement *this, int a2)
{
  pthread_mutex_t *v4;
  int v5;
  uint64_t v6;

  v4 = (pthread_mutex_t *)((char *)this + 32);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 32));
  v5 = *((unsigned __int8 *)this + 699);
  if (*((_BYTE *)this + 699))
  {
    v6 = *((unsigned __int8 *)this + 696);
    while (**((_DWORD **)this + v6 + 15) != a2)
    {
      v6 = ((int)v6 + 1) & 0x3FLL;
      if (!--v5)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v6 = 0xFFFFFFFFLL;
  }
  pthread_mutex_unlock(v4);
  return v6;
}

uint64_t AGPSendingSetElement::remove(AGPSendingSetElement *this, unsigned int a2)
{
  pthread_mutex_t *v4;
  char *v5;
  _DWORD *v6;
  char *v7;
  _DWORD *v8;
  int v9;
  uint64_t v10;
  int v11;
  CAGP *v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  unsigned __int8 v17;
  uint64_t v18;
  int v19;
  int v20;
  unsigned __int8 v21;
  uint64_t v22;
  uint64_t v23;

  v4 = (pthread_mutex_t *)((char *)this + 32);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 32));
  if (a2 <= 0x3F
    && (v5 = (char *)this + 8 * a2, v8 = (_DWORD *)*((_QWORD *)v5 + 15), v7 = v5 + 120, v6 = v8, (v9 = v8[3]) != 0))
  {
    v10 = a2;
    v11 = v6[380];
    v12 = (CAGP *)*((_QWORD *)this + 1);
    *((_DWORD *)v12 + 94) += v11;
    *((_DWORD *)v12 + 95) += v11 * v9;
    v6[3] = 0;
    if (v6[1] != -1)
    {
      v13 = CAGP::current_timestamp(v12);
      v6 = *(_DWORD **)v7;
      v14 = v13 - *(_DWORD *)(*(_QWORD *)v7 + 4);
      v15 = v14 <= -302400000 ? v14 + 604800000 : v13 - *(_DWORD *)(*(_QWORD *)v7 + 4);
      if (v15 >= 1)
      {
        pthread_mutex_lock(v4);
        UpdateRTO((unsigned int *)this + 175, v15);
        pthread_mutex_unlock(v4);
        v6 = *(_DWORD **)v7;
      }
    }
    v6[380] = 0;
    *((_BYTE *)this + v10 + 632) = 0x80;
    *(_DWORD *)(*(_QWORD *)v7 + 4) = -1;
    v16 = 1;
    *((_QWORD *)this + 12) &= ~(1 << v10);
    if (*((_BYTE *)this + 699))
    {
      v17 = *((_BYTE *)this + 696);
LABEL_11:
      v18 = *((_QWORD *)this + v17 + 15);
      if (!*(_DWORD *)(v18 + 12))
      {
        v19 = ((*(_DWORD *)(v18 + 8) >> 20) & 0x3F) + 1;
        v20 = v19;
        v21 = v17;
        while (1)
        {
          v22 = *((_QWORD *)this + v21 + 15);
          if (*(_DWORD *)(v22 + 12) || (*(_BYTE *)(v22 + 8) & 2) == 0)
            break;
          v21 = (v21 + 1) & 0x3F;
          if (!(_BYTE)--v20)
          {
            do
            {
              --v19;
              --*((_BYTE *)this + 699);
              v23 = *((_QWORD *)this + v17 + 15);
              *(_DWORD *)(v23 + 8) &= ~2u;
              v17 = (*((_BYTE *)this + 696) + 1) & 0x3F;
              *((_BYTE *)this + 696) = v17;
            }
            while ((_BYTE)v19);
            v16 = 1;
            if (*((_BYTE *)this + 699))
              goto LABEL_11;
            goto LABEL_21;
          }
        }
      }
      v16 = 1;
    }
  }
  else
  {
    v16 = 0;
  }
LABEL_21:
  pthread_mutex_unlock(v4);
  return v16;
}

BOOL associationSetElementEqual(_DWORD *a1, _DWORD *a2)
{
  return a1[26] == a2[26];
}

uint64_t associationSetElementHashCode(unsigned int *a1)
{
  return a1[26];
}

const void *retainAssociationSetElement(const __CFAllocator *a1, const void *a2)
{
  return a2;
}

void releaseAssociationSetElement(const __CFAllocator *a1, _QWORD *a2)
{
  uint64_t v2;

  v2 = a2[1];
  a2[2] = *(_QWORD *)(v2 + 200);
  *(_QWORD *)(v2 + 200) = a2;
}

uint64_t checkSendingSet(char *a1, _DWORD *a2)
{
  uint64_t v3;
  int v4;
  pthread_mutex_t *v5;
  unsigned int i;
  uint64_t v7;
  __int16 *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  _BYTE v14[2];
  __int16 checksum;
  int v16;
  int v17;
  int v18;
  int v19;
  _QWORD v20[187];

  v20[185] = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)a2;
  v4 = a2[2];
  v5 = (pthread_mutex_t *)(*(_QWORD *)a2 + 64);
  pthread_mutex_lock(v5);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 32));
  for (i = 0; ; ++i)
  {
    v7 = ((_BYTE)i + a1[698]) & 0x3F;
    v8 = *(__int16 **)&a1[8 * v7 + 120];
    if (v8)
    {
      if (*((_DWORD *)v8 + 3) && (v8[4] & 2) != 0 && *((_DWORD *)v8 + 1) != -1)
      {
        v9 = CAGP::current_timestamp((CAGP *)v3);
        v10 = v9 - *((_DWORD *)v8 + 1);
        if (v10 <= -302400000)
          v10 += 604800000;
        v11 = *((_DWORD *)a1 + 178);
        if (v11)
        {
          if (v10 > 3 * v11)
            break;
        }
      }
    }
    if (i > 0x3E)
      goto LABEL_15;
LABEL_14:
    ;
  }
  v14[0] = 5;
  v14[1] = a1[v7 + 632];
  checksum = 0;
  v12 = *((_DWORD *)a1 + 26);
  v16 = *(_DWORD *)(v3 + 16);
  v17 = v12;
  v18 = *(_DWORD *)v8;
  v19 = *((_DWORD *)v8 + 2) & 0x3FFFF03 | (4 * (a1[698] & 0x3F)) | (a1[697] << 26);
  *((_DWORD *)v8 + 1) = v9;
  ++*((_DWORD *)v8 + 380);
  memcpy(v20, v8 + 8, *((unsigned int *)v8 + 3));
  checksum = agp_control::generate_checksum((agp_control *)v14, v8 + 8, *((_DWORD *)v8 + 3));
  if (GCKSessionSendTo(*(_QWORD *)(v3 + 24), (uint64_t)(a1 + 104), 1, (uint64_t)v14, (*((_DWORD *)v8 + 3) + 20), 0, 64, 0, 0, *((_DWORD *)v8 + 379), v4) != -1072037833&& i < 0x3F)
  {
    goto LABEL_14;
  }
LABEL_15:
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 32));
  return pthread_mutex_unlock(v5);
}

uint64_t agp_control::generate_checksum(agp_control *this, __int16 *a2, int a3)
{
  __int16 v3;
  int v4;
  __int16 v5;
  unsigned int v6;
  __int16 v7;

  if (*(_BYTE *)this)
  {
    v3 = 0;
    v4 = 2 * *(unsigned __int8 *)this;
    do
    {
      v5 = *(_WORD *)this;
      this = (agp_control *)((char *)this + 2);
      v3 += v5;
      --v4;
    }
    while (v4);
    if (!a2)
      return (unsigned __int16)~v3;
  }
  else
  {
    v3 = 0;
    if (!a2)
      return (unsigned __int16)~v3;
  }
  if (a3 >= 2)
  {
    v6 = a3 >> 1;
    do
    {
      v7 = *a2++;
      v3 += v7;
      --v6;
    }
    while (v6);
  }
  if ((a3 & 1) != 0)
    v3 += *(unsigned __int8 *)a2;
  return (unsigned __int16)~v3;
}

uint64_t AGPTransportCallback(uint64_t a1, unsigned int *a2, int a3, unsigned __int8 *a4, int a5, uint64_t a6, unsigned __int8 *a7, uint64_t a8, unsigned __int8 a9, unsigned __int8 a10, unsigned __int8 a11, int a12)
{
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int8 *v22;
  uint64_t v23;
  unsigned __int8 *v24;
  CAGP **v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  unsigned __int8 *v29;
  uint64_t v30;
  CAGP **v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  CAGP *v37;
  NSObject *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unsigned int *v43;
  int v44;
  _DWORD *v45;
  _QWORD *v46;
  int v47;
  _DWORD *v48;
  _QWORD *v49;
  pthread_mutex_t *v50;
  uint64_t v51;
  const __CFData *v52;
  uint64_t v53;
  UInt8 *BytePtr;
  int Length;
  void *v56;
  NSObject *global_queue;
  CFTypeRef *v58;
  agp_control *v60;
  unsigned __int8 *v61;
  void *value;
  int v63;

  v19 = CheckInHandleDebug();
  if (v19)
  {
    v20 = v19;
    if (a3 < 1)
    {
      if (a3)
      {
        v41 = -a3;
        AGPDataQueue::disconnect((uint64_t **)(v19 + 216), a2, -a3);
        pthread_mutex_lock((pthread_mutex_t *)(v20 + 64));
        v42 = v41;
        v43 = a2;
        do
        {
          v44 = *v43++;
          v45 = *(_DWORD **)(v20 + 48);
          v45[26] = v44;
          value = 0;
          if (CFSetGetValueIfPresent(*(CFSetRef *)(v20 + 40), v45, (const void **)&value))
            CFSetRemoveValue(*(CFMutableSetRef *)(v20 + 40), value);
          --v42;
        }
        while (v42);
        while (1)
        {
          v46 = *(_QWORD **)(v20 + 200);
          if (!v46)
            break;
          *(_QWORD *)(v20 + 200) = v46[2];
          (*(void (**)(_QWORD *))(*v46 + 8))(v46);
        }
        pthread_mutex_unlock((pthread_mutex_t *)(v20 + 64));
        pthread_mutex_lock((pthread_mutex_t *)(v20 + 128));
        do
        {
          v47 = *a2++;
          v48 = *(_DWORD **)(v20 + 56);
          v48[26] = v47;
          value = 0;
          if (CFSetGetValueIfPresent(*(CFSetRef *)(v20 + 32), v48, (const void **)&value))
            CFSetRemoveValue(*(CFMutableSetRef *)(v20 + 32), value);
          --v41;
        }
        while (v41);
        while (1)
        {
          v49 = *(_QWORD **)(v20 + 200);
          if (!v49)
            break;
          *(_QWORD *)(v20 + 200) = v49[2];
          (*(void (**)(_QWORD *))(*v49 + 8))(v49);
        }
        v50 = (pthread_mutex_t *)(v20 + 128);
      }
      else
      {
        pthread_mutex_lock((pthread_mutex_t *)(v19 + 224));
        while (1)
        {
          pthread_mutex_lock((pthread_mutex_t *)(v20 + 224));
          v51 = *(_QWORD *)(v20 + 216);
          pthread_mutex_unlock((pthread_mutex_t *)(v20 + 224));
          if (!v51)
            break;
          v52 = *(const __CFData **)(v51 + 80);
          if (v52)
          {
            v53 = *(unsigned int *)(v51 + 72);
            BytePtr = (UInt8 *)CFDataGetBytePtr(v52);
            Length = CFDataGetLength(*(CFDataRef *)(v51 + 80));
            if (AGPSessionSendTo(a1, (int *)(v51 + 8), v53, BytePtr, Length, 0, 2, *(_DWORD *)(v51 + 88), a12, 0))break;
          }
          v56 = *(void **)(v51 + 96);
          if (v56)
          {
            global_queue = dispatch_get_global_queue(0, 0);
            dispatch_async(global_queue, v56);
          }
          pthread_mutex_lock((pthread_mutex_t *)(v20 + 224));
          v58 = *(CFTypeRef **)(v20 + 216);
          *(_QWORD *)(v20 + 216) = *v58;
          pthread_mutex_unlock((pthread_mutex_t *)(v20 + 224));
          AGPDataQueueNode::~AGPDataQueueNode(v58);
          MEMORY[0x212BB16B8](v58, 0x10E0C40923426B4);
        }
        pthread_mutex_lock((pthread_mutex_t *)(v20 + 64));
        value = (void *)v20;
        v63 = a12;
        CFSetApplyFunction(*(CFSetRef *)(v20 + 40), (CFSetApplierFunction)checkSendingSet, &value);
        pthread_mutex_unlock((pthread_mutex_t *)(v20 + 64));
        v50 = (pthread_mutex_t *)(v20 + 224);
      }
      pthread_mutex_unlock(v50);
    }
    else
    {
      v21 = a9;
      if ((a9 & 0x40) == 0)
      {
        v60 = (agp_control *)a4;
        *a4 = 0;
        a4[1] = a9;
        *((_WORD *)a4 + 1) = 0;
        if ((a9 & 2) != 0)
        {
          LODWORD(v24) = (_DWORD)a4 + 4;
        }
        else
        {
          *((_DWORD *)a4 + 1) = *(_DWORD *)(v19 + 16);
          v22 = a4 + 8;
          v23 = a3;
          v24 = v22;
          do
          {
            v25 = (CAGP **)CAGP::sendingSetElement((CAGP *)v20, *a2);
            v26 = AGPSendingSetElement::buffer(v25, a7, a8, a6, a10, a11, v21);
            if (v26 < 0)
            {
              v38 = agps_log();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                AGPTransportCallback(&value, (_BYTE *)&value + 1);
            }
            else
            {
              *(_DWORD *)v22 = *a2;
              v61 = v24;
              v27 = v21;
              v28 = a6;
              v29 = a7;
              v30 = a8;
              v31 = &v25[v26];
              *((_DWORD *)v22 + 1) = *(_DWORD *)v31[15];
              v32 = *((_DWORD *)v22 + 2) & 0xFFFFFFFC | !AGPAssociationSetElement::can_buffer((AGPAssociationSetElement *)v25, 1) | 2;
              *((_DWORD *)v22 + 2) = v32;
              v33 = v32 & 0xFFFFFF03 | (4 * ((*((_DWORD *)v31[15] + 2) >> 2) & 0x3F));
              *((_DWORD *)v22 + 2) = v33;
              v34 = v33 & 0xFFFFC0FF | (((*((_DWORD *)v31[15] + 2) >> 8) & 0x3F) << 8);
              *((_DWORD *)v22 + 2) = v34;
              v35 = v34 & 0xFFF03FFF | (((*((_DWORD *)v31[15] + 2) >> 14) & 0x3F) << 14);
              *((_DWORD *)v22 + 2) = v35;
              v36 = v35 & 0xFC0FFFFF | (((*((_DWORD *)v31[15] + 2) >> 20) & 0x3F) << 20);
              *((_DWORD *)v22 + 2) = v36;
              v37 = v31[15];
              a8 = v30;
              a7 = v29;
              a6 = v28;
              v21 = v27;
              *((_DWORD *)v22 + 2) = *((_DWORD *)v37 + 2) & 0xFC000000 | v36 & 0x3FFFFFF;
              v24 = v61 + 12;
              v22 += 12;
            }
            ++a2;
            --v23;
          }
          while (v23);
        }
        *(_BYTE *)v60 = ((_DWORD)v24 - (_DWORD)v60 + 3) >> 2;
        *((_WORD *)v60 + 1) = agp_control::generate_checksum(v60, (__int16 *)a7, a8);
        v40 = 4 * *(unsigned __int8 *)v60;
        goto LABEL_43;
      }
    }
    v40 = 0;
LABEL_43:
    CheckOutHandleDebug();
    return v40;
  }
  v39 = agps_log();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    AGPTransportCallback(a3, v39);
  return 0xFFFFFFFFLL;
}

void sub_20DC41918(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BB16B8](v1, 0x10E0C40923426B4);
  _Unwind_Resume(a1);
}

void *CAGP::sendingSetElement(CAGP *this, int a2)
{
  pthread_mutex_t *v4;
  const __CFSet *v5;
  _DWORD *v6;
  AGPAssociationSetElement *v7;
  void *value;

  v4 = (pthread_mutex_t *)((char *)this + 64);
  pthread_mutex_lock((pthread_mutex_t *)this + 1);
  v5 = (const __CFSet *)*((_QWORD *)this + 5);
  v6 = (_DWORD *)*((_QWORD *)this + 6);
  v6[26] = a2;
  value = 0;
  if (!CFSetGetValueIfPresent(v5, v6, (const void **)&value))
  {
    v7 = (AGPAssociationSetElement *)operator new();
    AGPAssociationSetElement::AGPAssociationSetElement(v7, this);
    *(_QWORD *)v7 = &off_24C841248;
    value = v7;
    *((_DWORD *)v7 + 26) = a2;
    CFSetAddValue(*((CFMutableSetRef *)this + 5), v7);
  }
  pthread_mutex_unlock(v4);
  return value;
}

void sub_20DC419E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BB16B8](v1, 0x10A1C404616C3E8);
  _Unwind_Resume(a1);
}

uint64_t AGPDataQueue::disconnect(uint64_t **this, unsigned int *a2, int a3)
{
  pthread_mutex_t *v6;
  uint64_t v7;
  uint64_t *v8;
  unsigned int v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;
  _DWORD *v14;
  int v15;

  v6 = (pthread_mutex_t *)(this + 1);
  pthread_mutex_lock((pthread_mutex_t *)(this + 1));
  if (a3 >= 1)
  {
    v7 = 0;
    v8 = *this;
    do
    {
      if (v8)
      {
        v9 = a2[v7];
        v10 = v8;
        do
        {
          v11 = *((_DWORD *)v10 + 18);
          v12 = v11 - 1;
          if (v11 >= 1)
          {
            v13 = 0;
            v14 = (_DWORD *)v10 + 3;
            v15 = v11 - 1;
            while (*((_DWORD *)v10 + v13 + 2) != v9)
            {
              ++v13;
              ++v14;
              --v15;
              if ((int)v13 >= v11)
                goto LABEL_14;
            }
            if ((int)v13 < v12)
            {
              do
              {
                *(v14 - 1) = *v14;
                ++v14;
                --v15;
              }
              while (v15);
              v12 = *((_DWORD *)v10 + 18) - 1;
            }
            *((_DWORD *)v10 + 18) = v12;
          }
LABEL_14:
          v10 = (uint64_t *)*v10;
        }
        while (v10);
      }
      ++v7;
    }
    while (v7 != a3);
  }
  return pthread_mutex_unlock(v6);
}

uint64_t AGPSessionSendTo(uint64_t a1, int *a2, uint64_t a3, UInt8 *a4, int a5, uint64_t a6, int a7, unsigned int a8, int a9, void *a10)
{
  uint64_t v10;
  UInt8 *v11;
  int v12;
  uint64_t v15;
  CAGP *v17;
  void *v18;
  unint64_t v19;
  int v20;
  char v21;
  unint64_t v22;
  int v23;
  unsigned __int8 v24;
  int *v26;
  char v27;
  int v28;
  uint64_t v29;
  _BOOL4 v30;
  unsigned int v31;
  AGPAssociationSetElement *v32;
  unint64_t v33;
  char v34;
  AGPAssociationSetElement *v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  int v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *global_queue;
  uint64_t v48;
  pthread_mutex_t *v49;
  int v51;
  unsigned int v52;
  uint64_t *v53;
  _BOOL4 v54;
  UInt8 *bytes;
  char v56;
  unsigned int v57;
  int v58;
  void *v59;
  unsigned __int8 v60;
  unsigned int v62;
  char v64;
  _BYTE v65[271];
  _OWORD v66[32];
  uint64_t v67;

  v10 = 0;
  v67 = *MEMORY[0x24BDAC8D0];
  if ((int)a3 < 1)
    return v10;
  v11 = a4;
  if (!a4)
    return v10;
  v12 = a5;
  if (a5 < 1)
    return v10;
  v15 = CheckInHandleDebug();
  if (!v15)
  {
    v10 = 2149187586;
    v41 = agps_log();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      AGPSessionSendTo_cold_1(v41, v42, v43);
    return v10;
  }
  v62 = a8;
  v52 = 0;
  v53 = (uint64_t *)(v15 + 216);
  v49 = (pthread_mutex_t *)(v15 + 224);
  v51 = 1115 - 16 * a3;
  v17 = (CAGP *)v15;
  v48 = v15;
  while (1)
  {
    memset(v66, 0, sizeof(v66));
    if (v51 < 0)
    {
      v44 = agps_log();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        AGPSessionSendTo_cold_2(&v64, v65);
      goto LABEL_67;
    }
    v18 = a10;
    v19 = 0;
    v20 = 0;
    v21 = 1;
    bytes = v11;
    do
    {
      v22 = v19;
      *((_QWORD *)v66 + v19) = v11;
      if (v12 >= v51)
        v23 = 1115 - 16 * a3;
      else
        v23 = v12;
      *(_DWORD *)&v65[4 * v19 + 15] = v23;
      v24 = v21;
      v20 += v23;
      v12 -= v23;
      v11 += v23;
      ++v19;
      if (v22 > 6)
        break;
      ++v21;
    }
    while (v12 > 0);
    v60 = v19 - 1;
    if ((_BYTE)v19 != 1 && a7 == 1)
      a7 = 0;
    v59 = v18;
    v58 = a7;
    if (!a7)
    {
      v27 = 0;
      v28 = v12 > 0;
      goto LABEL_24;
    }
    if (a7 != 1)
      break;
    v27 = 1;
    v28 = 2;
LABEL_24:
    v57 = v28;
    pthread_mutex_lock(v49);
    v29 = *v53;
    pthread_mutex_unlock(v49);
    v30 = v29 != 0;
    if ((v27 & 1) == 0 && v29)
    {
      v24 = 0;
      v31 = 0;
      a10 = v59;
      a7 = v58;
      goto LABEL_42;
    }
    v26 = a2 + 1;
    v56 = v27;
    v54 = v29 != 0;
    if (v57 > 1)
    {
      v57 = 2;
LABEL_37:
      v36 = 0;
      v17 = (CAGP *)v48;
      do
      {
        ++*(_DWORD *)(v48 + 360);
        v37 = *(unsigned int *)&v65[4 * v36 + 15];
        *(_DWORD *)(v48 + 364) += v37;
        GCKSessionSendTo(*(_QWORD *)(v48 + 24), (uint64_t)a2, a3, *((_QWORD *)v66 + v36), v37, a6, v57, v36, v60, v62, a9);
        ++v36;
      }
      while (v22 + 1 != v36);
      a7 = v58;
      v31 = v52;
      a10 = v59;
      goto LABEL_40;
    }
    v18 = v59;
    a7 = v58;
LABEL_29:
    v32 = (AGPAssociationSetElement *)CAGP::sendingSetElement(v17, *a2);
    if (AGPAssociationSetElement::can_buffer(v32, v19))
    {
      v33 = 0;
      v34 = v56;
      while (a3 - 1 != v33)
      {
        v35 = (AGPAssociationSetElement *)CAGP::sendingSetElement(v17, v26[v33++]);
        if (!AGPAssociationSetElement::can_buffer(v35, v19))
        {
          if (v33 >= a3)
            goto LABEL_37;
          v24 = 0;
          v31 = -2145648639;
          a10 = v59;
          a7 = v58;
          goto LABEL_41;
        }
      }
      goto LABEL_37;
    }
    v24 = 0;
    v31 = -2145648639;
    a10 = v18;
LABEL_40:
    v34 = v56;
LABEL_41:
    v52 = v31;
    v30 = v54;
    if ((v34 & 1) != 0)
      goto LABEL_68;
LABEL_42:
    if (v30)
      v10 = v31;
    else
      v10 = 0;
    if (v31)
      v38 = 1;
    else
      v38 = v30;
    if (v12 > 0)
      v38 = 1;
    if (v24 <= v60 && v38)
    {
      v39 = operator new();
      *(_QWORD *)v39 = 0;
      *(_QWORD *)(v39 + 80) = 0;
      *(_QWORD *)(v39 + 96) = 0;
      memcpy((void *)(v39 + 8), a2, 4 * a3);
      *(_DWORD *)(v39 + 72) = a3;
      *(_DWORD *)(v39 + 88) = v62;
      if (v12)
        v40 = v20 + 1;
      else
        v40 = v20;
      *(_QWORD *)(v39 + 80) = CFDataCreate(0, bytes, v40);
      if (a10)
        *(_QWORD *)(v39 + 96) = _Block_copy(a10);
      AGPDataQueue::add_tail((uint64_t)v53, (_QWORD *)v39);
      a10 = 0;
    }
    if (v12 < 1 || (_DWORD)v10)
      goto LABEL_69;
  }
  if (a7 == 2)
  {
    v54 = 0;
    v56 = 1;
    v57 = v12 > 0;
    v26 = a2 + 1;
    goto LABEL_29;
  }
  v45 = agps_log();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
  {
    AGPSessionSendTo_cold_3(&v64, v65);
    a10 = v18;
LABEL_67:
    v52 = -2145648639;
    goto LABEL_68;
  }
  v52 = -2145648639;
  a10 = v18;
LABEL_68:
  v10 = v52;
LABEL_69:
  if (a10)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    dispatch_async(global_queue, a10);
  }
  CheckOutHandleDebug();
  return v10;
}

uint64_t AGPSessionCreate(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t Handle;
  uint64_t v13;

  v10 = 2149187586;
  if (CheckInHandleDebug())
  {
    CheckOutHandleDebug();
    v11 = operator new();
    CAGP::CAGP((CAGP *)v11);
    Handle = CreateHandle();
    if (Handle == 0xFFFFFFFFLL)
    {
      CAGP::~CAGP((pthread_mutex_t *)v11);
      MEMORY[0x212BB16B8](v11, 0x10A0C40A2D6C30DLL);
      return 2149187589;
    }
    else
    {
      v13 = Handle;
      v10 = GCKSessionRegisterReliableTransportCallback(a1, (uint64_t)AGPTransportCallback, Handle);
      if ((_DWORD)v10)
      {
        AGPSessionRelease();
      }
      else
      {
        *(_DWORD *)(v11 + 16) = a2;
        *(_QWORD *)(v11 + 24) = a1;
        *(_QWORD *)v11 = a3;
        *(_QWORD *)(v11 + 8) = a4;
        *a5 = v13;
      }
    }
  }
  return v10;
}

void sub_20DC42158(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BB16B8](v1, 0x10A0C40A2D6C30DLL);
  _Unwind_Resume(a1);
}

uint64_t AGPSessionRelease()
{
  uint64_t v0;
  pthread_mutex_t *v1;

  v0 = CheckInHandleDebug();
  if (!v0)
    return 2149187586;
  v1 = (pthread_mutex_t *)v0;
  CheckOutHandleDebug();
  CAGP::~CAGP(v1);
  MEMORY[0x212BB16B8](v1, 0x10A0C40A2D6C30DLL);
  return 0;
}

void sub_20DC42208(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BB16B8](v1, 0x10A0C40A2D6C30DLL);
  _Unwind_Resume(a1);
}

uint64_t AGPDataQueue::add_tail(uint64_t a1, _QWORD *a2)
{
  _QWORD **v3;
  pthread_mutex_t *v4;
  _QWORD *i;

  v3 = (_QWORD **)a1;
  v4 = (pthread_mutex_t *)(a1 + 8);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  for (i = *v3; i; i = (_QWORD *)*i)
  {
    v3 = (_QWORD **)i;
    if (i == a2)
      a2 = 0;
  }
  *v3 = a2;
  return pthread_mutex_unlock(v4);
}

uint64_t AGPSessionRecvFrom(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4)
{
  int v5;
  pthread_mutex_t *v8;
  pthread_mutex_t *v9;
  unsigned __int8 *v10;
  uint64_t v11;
  int v12;
  uint64_t v14;
  NSObject *v15;
  int v17;
  int checksum;
  unsigned int v19;
  uint64_t v20;
  int v21;
  int v22;
  NSObject *v23;
  uint64_t v24;
  pthread_mutex_t *v25;
  int v26;
  char *v27;
  __int128 v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  int v33;
  unsigned int v34;
  int v35;
  int v36;
  uint64_t v37;
  int v38;
  NSObject *v39;
  NSObject *v40;
  int v41;
  NSObject *v42;
  const char *v43;
  int v44;
  NSObject *v45;
  int v46;
  unsigned int v47;
  unsigned int v48;
  int v49;
  int v50;
  _BOOL4 v51;
  int v53;
  int v54;
  unsigned int v55;
  unsigned int v56;
  unsigned int v57;
  uint64_t v58;
  int v59;
  BOOL v61;
  uint64_t v62;
  uint64_t v63;
  __int16 v64;
  int v65;
  pthread_mutex_t *v66;
  unsigned __int8 *v67;
  unint64_t v68;
  unsigned int v69;
  int v70;
  int v71;
  int *v72;
  unsigned int v73;
  _BOOL4 v74;
  int v75;
  int v76;
  AGPDataQueue *v77;
  uint64_t v78;
  int v79;
  int v80;
  uint64_t v81;
  char *v82;
  pthread_mutex_t *v83;
  uint64_t v84;
  uint64_t v85;
  _DWORD *v86;
  unsigned int *v87;
  pthread_mutex_t *v88;
  __CFData *Mutable;
  AGPDataQueue *i;
  AGPDataQueue *v91;
  const __CFData *v92;
  const UInt8 *BytePtr;
  CFIndex Length;
  AGPDataQueue **v95;
  AGPDataQueue **v96;
  int v97;
  _DWORD *v98;
  int v99;
  NSObject *v100;
  uint64_t v101;
  uint64_t v102;
  int v103;
  NSObject *v104;
  const char *v105;
  NSObject *v106;
  uint32_t v107;
  NSObject *v108;
  int v109;
  int v110;
  pthread_mutex_t *v111;
  AGPDataQueue *v112;
  os_log_t v113;
  os_log_t v114;
  _BYTE *v115;
  _BYTE *v116;
  __int128 v117;
  __int128 v118;
  unint64_t v119;
  pthread_mutex_t *v120;
  char v121;
  _BYTE v122[7];
  unsigned int v123;
  _BYTE v124[1484];
  uint64_t v125;

  v5 = a2;
  v125 = *MEMORY[0x24BDAC8D0];
  v123 = a2;
  if (!a1 || !a3 || !*(_QWORD *)(a3 + 8) || (*(_DWORD *)(a3 + 16) - 1) > 0x5DB)
  {
    v15 = agps_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      if (a3)
      {
        v20 = *(_QWORD *)(a3 + 8);
        v21 = *(_DWORD *)(a3 + 16);
      }
      else
      {
        v20 = 0;
        v21 = 0;
      }
      *(_DWORD *)v124 = 67109632;
      *(_DWORD *)&v124[4] = v5;
      *(_WORD *)&v124[8] = 2048;
      *(_QWORD *)&v124[10] = v20;
      *(_WORD *)&v124[18] = 1024;
      *(_DWORD *)&v124[20] = v21;
      _os_log_error_impl(&dword_20DC1A000, v15, OS_LOG_TYPE_ERROR, "Could not process a packet for participant [%08X], event-buffer [%p], event->size [%d].", v124, 0x18u);
    }
    return 0;
  }
  v8 = (pthread_mutex_t *)(a1 + 128);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 128));
  v9 = (pthread_mutex_t *)CAGP::receiveSetElement((CAGP *)a1, v5);
  v10 = *(unsigned __int8 **)(a3 + 8);
  v11 = 4 * *v10;
  v12 = *(_DWORD *)(a3 + 16);
  if (v12 < (int)v11 || v9 == 0)
    goto LABEL_10;
  v120 = v9;
  v17 = *((unsigned __int16 *)v10 + 1);
  *((_WORD *)v10 + 1) = 0;
  checksum = agp_control::generate_checksum((agp_control *)v10, (__int16 *)&v10[v11], v12 - (int)v11);
  if (v17 != checksum)
  {
    v22 = checksum;
    v23 = agps_log();
    v14 = 0;
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    *(_DWORD *)v124 = 67109376;
    *(_DWORD *)&v124[4] = v17;
    *(_WORD *)&v124[8] = 1024;
    *(_DWORD *)&v124[10] = v22;
    _os_log_impl(&dword_20DC1A000, v23, OS_LOG_TYPE_DEFAULT, "Incoming packet for participant (%08X) failed checksum check -> given (%04x) calculated (04x).", v124, 0xEu);
    goto LABEL_10;
  }
  v19 = v10[1];
  if (v19 >= 2 && v19 != 11)
  {
    if (v19 == 2)
    {
      *(_QWORD *)(a3 + 8) += v11;
      *(_DWORD *)(a3 + 16) -= v11;
      v14 = 1;
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  v24 = 0;
  v25 = v120;
  do
  {
    if (v24 + 20 > v11)
      goto LABEL_10;
    v26 = *(_DWORD *)&v10[v24 + 8];
    v24 += 12;
  }
  while (v26 != *(_DWORD *)(a1 + 16));
  *(_QWORD *)(a3 + 8) += v11;
  *(_DWORD *)(a3 + 16) -= v11;
  if (v19 < 2)
  {
    v47 = *(_DWORD *)&v10[v24];
    v48 = *(_DWORD *)&v25[1].__opaque[36];
    if (v47 >= v48 || *(_DWORD *)&v25[1].__opaque[40] == -1)
    {
      v51 = 0;
      v14 = 1;
    }
    else
    {
      v49 = CAGP::current_timestamp((CAGP *)a1);
      v48 = *(_DWORD *)&v25[1].__opaque[36];
      v50 = v49 - *(_DWORD *)&v25[1].__opaque[40];
      if (v50 <= -302400000)
        v50 += 604800000;
      v51 = v50 > 1000;
      v14 = v50 < 1001;
      v47 = *(_DWORD *)&v10[v24];
    }
    if (v47 >= v48 || v51)
    {
      if (v51)
        goto LABEL_76;
      v66 = v25;
      v67 = &v10[v24];
      v68 = ((unint64_t)*(unsigned int *)&v10[v24 + 4] >> 8) & 0x3F;
      v14 = *(_QWORD *)&v66[1].__opaque[8 * v68 + 48];
      if (!v14)
      {
LABEL_11:
        pthread_mutex_unlock(v8);
        return v14;
      }
      if (!*(_DWORD *)(v14 + 12))
      {
        v120[9].__opaque[v68 + 48] = v10[1];
        memcpy((void *)(v14 + 16), *(const void **)(a3 + 8), *(int *)(a3 + 16));
        *(_DWORD *)v14 = *(_DWORD *)&v10[v24];
        *(_DWORD *)(v14 + 8) = *((_DWORD *)v67 + 1);
        *(_DWORD *)(v14 + 12) = *(_DWORD *)(a3 + 16);
        *(_DWORD *)(v14 + 1516) = a4;
        v69 = *((_DWORD *)v67 + 1);
        v70 = (v69 >> 14) & 0x3F;
        LODWORD(v114) = *(_DWORD *)&v10[v24] - v70;
        v119 = ((v69 >> 8) & 0x3F) - v70;
        v111 = (pthread_mutex_t *)(a1 + 296);
        v112 = (AGPDataQueue *)(a1 + 288);
        while (1)
        {
          v71 = 0;
          LODWORD(v115) = (v69 >> 20) & 0x3F;
          LODWORD(v116) = (_DWORD)v115 + 1;
          LODWORD(v118) = 1;
          v25 = v120;
          do
          {
            *(_QWORD *)&v117 = ((_BYTE)v119 + (_BYTE)v71) & 0x3F;
            v72 = *(int **)&v25[1].__opaque[8 * v117 + 48];
            if (!v72)
            {
              v104 = agps_log();
              if (!os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
                goto LABEL_144;
              *(_DWORD *)v124 = 67109120;
              *(_DWORD *)&v124[4] = v117;
              v105 = "No buffer pointer for message fragment @index %d.";
              v106 = v104;
              v107 = 8;
LABEL_149:
              _os_log_error_impl(&dword_20DC1A000, v106, OS_LOG_TYPE_ERROR, v105, v124, v107);
              goto LABEL_144;
            }
            if (!v72[3])
              goto LABEL_145;
            v73 = v72[2];
            if (((v73 >> 20) & 0x3F) != (_DWORD)v115)
            {
              v108 = agps_log();
              if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
              {
                v109 = (v72[2] >> 20) & 0x3F;
                *(_DWORD *)v124 = 67109632;
                *(_DWORD *)&v124[4] = v117;
                *(_WORD *)&v124[8] = 1024;
                *(_DWORD *)&v124[10] = v109;
                *(_WORD *)&v124[14] = 1024;
                *(_DWORD *)&v124[16] = (_DWORD)v115;
                v105 = "Fragment @index %d has incorrect maximum segment count: %d should be %d.";
                goto LABEL_148;
              }
LABEL_144:
              v25 = v120;
LABEL_145:
              v14 = 0;
              v5 = v123;
LABEL_76:
              *(_QWORD *)&v124[20] = 0;
              v53 = *(_DWORD *)(a1 + 16);
              *(_DWORD *)v124 = 2823;
              *(_DWORD *)&v124[4] = v53;
              *(_DWORD *)&v124[8] = v5;
              *(_DWORD *)&v124[12] = *(_DWORD *)&v10[v24];
              v54 = v25[10].__opaque[48];
              *(_DWORD *)&v124[16] = *(_DWORD *)&v10[v24 + 4] & 0xFFFFFF03 | (4 * (v54 & 0x3F));
              v55 = *(_DWORD *)&v10[v24 + 4];
              v56 = v55 >> 2;
              v57 = v55 >> 26;
              if ((v55 & 1) != 0 || v56 != v57)
              {
                v58 = 0;
                v59 = 0;
                v61 = (v55 & 1) == 0 || v56 != v57;
                do
                {
                  v59 |= v61 && v56 == v54;
                  if ((v59 & 1) != 0)
                  {
                    v62 = *(_QWORD *)&v25[1].__opaque[8 * v56 + 48];
                    if (v62)
                    {
                      if (*(_DWORD *)(v62 + 12) || (*(_BYTE *)(v62 + 8) & 2) != 0)
                        v58 &= ~(1 << v56);
                      else
                        v58 |= 1 << v56;
                      *(_QWORD *)&v124[20] = v58;
                    }
                  }
                  v56 = ((_BYTE)v56 + 1) & 0x3F;
                  v61 = 1;
                }
                while (v56 != v57);
              }
              v63 = 0;
              v64 = 0;
              do
              {
                v64 += *(_WORD *)&v124[v63];
                v63 += 2;
              }
              while ((_DWORD)v63 != 28);
              *(_WORD *)&v124[2] = ~v64;
              *(int32x2_t *)(a1 + 384) = vadd_s32(*(int32x2_t *)(a1 + 384), (int32x2_t)0x1C00000001);
              v65 = CAGP::current_timestamp((CAGP *)a1);
              *(_DWORD *)&v120[1].__opaque[40] = v65;
              pthread_mutex_unlock(v8);
              GCKSessionSendTo(*(_QWORD *)(a1 + 24), (uint64_t)&v123, 1, (uint64_t)v124, 28, 0, 64, 0, 0, a4, 1);
              return v14;
            }
            if ((_DWORD)v114 + v71 != *v72)
            {
              v108 = agps_log();
              if (!os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
                goto LABEL_144;
              v110 = *v72;
              *(_DWORD *)v124 = 67109632;
              *(_DWORD *)&v124[4] = v117;
              *(_WORD *)&v124[8] = 1024;
              *(_DWORD *)&v124[10] = v110;
              *(_WORD *)&v124[14] = 1024;
              *(_DWORD *)&v124[16] = (_DWORD)v114 + v71;
              v105 = "Fragment @index %d has incorrect serial number: is %08X should be %08X.";
LABEL_148:
              v106 = v108;
              v107 = 20;
              goto LABEL_149;
            }
            if (v71 != ((v73 >> 14) & 0x3F))
            {
              v113 = (os_log_t)agps_log();
              v74 = os_log_type_enabled(v113, OS_LOG_TYPE_ERROR);
              v25 = v120;
              if (v74)
              {
                v75 = *v72;
                v76 = (v72[2] >> 14) & 0x3F;
                *(_DWORD *)v124 = 67109888;
                *(_DWORD *)&v124[4] = v117;
                *(_WORD *)&v124[8] = 1024;
                *(_DWORD *)&v124[10] = v75;
                *(_WORD *)&v124[14] = 1024;
                *(_DWORD *)&v124[16] = v76;
                *(_WORD *)&v124[20] = 1024;
                *(_DWORD *)&v124[22] = v71;
                _os_log_error_impl(&dword_20DC1A000, v113, OS_LOG_TYPE_ERROR, "Message fragment @index %d serial number %08X seg_idx %d should be %d.", v124, 0x1Au);
              }
            }
            LODWORD(v118) = (v25[9].__opaque[v117 + 48] != 1) & v118;
            ++v71;
          }
          while ((_DWORD)v116 != v71);
          if ((_DWORD)v114 != *(_DWORD *)&v25[1].__opaque[36])
            goto LABEL_145;
          v77 = AGPDataQueue::peek_head_for_participant(v112, v123);
          v113 = (os_log_t)&v111;
          *(_OWORD *)v124 = *(_OWORD *)a3;
          *(_QWORD *)&v124[16] = *(_QWORD *)(a3 + 16);
          MEMORY[0x24BDAC7A8](v77, v78);
          v80 = 0;
          v82 = (char *)&v111 - v81;
          v114 = (os_log_t)((char *)&v111 - v81);
          *(_QWORD *)&v117 = (char *)&v111 - v81;
          LODWORD(v115) = v79;
          do
          {
            v83 = v120;
            v84 = *(_QWORD *)&v120[1].__opaque[8 * (((_BYTE)v119 + (_BYTE)v80) & 0x3F) + 48];
            v120[10].__opaque[48] = (v120[10].__opaque[48] + 1) & 0x3F;
            ++*(_DWORD *)&v83[1].__opaque[36];
            if (v79)
            {
              memcpy(v82, (const void *)(v84 + 16), *(unsigned int *)(v84 + 12));
              v79 = (int)v115;
            }
            else
            {
              *(_QWORD *)&v117 = v84 + 16;
            }
            v82 += *(unsigned int *)(v84 + 12);
            a4 = *(_DWORD *)(v84 + 1516);
            *(_DWORD *)v84 = 0;
            *(_QWORD *)(v84 + 8) = 0;
            ++v80;
          }
          while ((_DWORD)v116 != v80);
          *(_QWORD *)&v124[8] = v117;
          *(_DWORD *)&v124[16] = (_DWORD)v82 - (_DWORD)v114;
          if ((v79 & 1) != 0)
          {
            v85 = operator new();
            v119 = v85;
            *(_QWORD *)v85 = 0;
            *(_QWORD *)(v85 + 80) = 0;
            *(_DWORD *)(v85 + 72) = 0;
            v86 = (_DWORD *)(v85 + 72);
            *(_DWORD *)(v85 + 88) = 5;
            v87 = (unsigned int *)(v85 + 88);
            *(_QWORD *)(v85 + 96) = 0;
            *(_QWORD *)(v85 + 80) = CFDataCreate(0, *(const UInt8 **)&v124[8], *(int *)&v124[16]);
            *v87 = a4;
            v88 = (pthread_mutex_t *)v119;
            *(_DWORD *)(v119 + 8) = v123;
            *v86 = 1;
            AGPDataQueue::add_tail((uint64_t)v112, v88);
            if ((v118 & 1) == 0)
              goto LABEL_130;
            Mutable = CFDataCreateMutable(0, 0);
            pthread_mutex_lock(v111);
            for (i = AGPDataQueue::peek_head_for_participant(v112, v123);
                  ;
                  i = AGPDataQueue::peek_head_for_participant(v112, v123))
            {
              v91 = i;
              if (!i)
                break;
              v92 = (const __CFData *)*((_QWORD *)i + 10);
              if (v92)
              {
                a4 = *((_DWORD *)v91 + 22);
                BytePtr = CFDataGetBytePtr(v92);
                Length = CFDataGetLength(*((CFDataRef *)v91 + 10));
                CFDataAppendBytes(Mutable, BytePtr, Length);
              }
              v95 = AGPDataQueue::pop_head_for_participant(v112, v123);
              v96 = v95;
              if (v95)
              {
                AGPDataQueueNode::~AGPDataQueueNode((CFTypeRef *)v95);
                MEMORY[0x212BB16B8](v96, 0x10E0C40923426B4);
              }
            }
            pthread_mutex_unlock(v111);
            *(_QWORD *)&v124[8] = CFDataGetBytePtr(Mutable);
            *(_DWORD *)&v124[16] = CFDataGetLength(Mutable);
          }
          else
          {
            if ((v118 & 1) == 0)
              goto LABEL_130;
            Mutable = 0;
          }
          if (a4 == 10)
            v97 = 5;
          else
            v97 = 3;
          *(_DWORD *)v124 = v97;
          (*(void (**)(_QWORD, _QWORD, _BYTE *))a1)(*(_QWORD *)(a1 + 8), v123, v124);
          if ((_DWORD)v115)
            CFRelease(Mutable);
LABEL_130:
          v119 = v120[10].__opaque[48];
          v98 = *(_DWORD **)&v120[1].__opaque[8 * v119 + 48];
          if (!v98)
            goto LABEL_144;
          if (!v98[3])
            goto LABEL_144;
          v99 = *(_DWORD *)&v120[1].__opaque[36];
          LODWORD(v114) = *v98;
          if ((_DWORD)v114 != v99)
            goto LABEL_144;
          v69 = v98[2];
        }
      }
    }
LABEL_10:
    v14 = 0;
    goto LABEL_11;
  }
  pthread_mutex_unlock(v8);
  v119 = a1 + 64;
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 64));
  v27 = (char *)CAGP::sendingSetElement((CAGP *)a1, v5);
  v120 = (pthread_mutex_t *)(v27 + 32);
  pthread_mutex_lock((pthread_mutex_t *)(v27 + 32));
  if (!v27[699] || *(_DWORD *)&v10[v24] < **(_DWORD **)&v27[8 * v27[696] + 120])
    goto LABEL_138;
  if (*(_QWORD *)&v10[v24 + 8])
  {
    v29 = 0;
    v115 = v122;
    v116 = &v124[20];
    while (1)
    {
      if ((((unint64_t)*(unsigned int *)&v10[v24 + 8] >> (v29 + v27[698])) & 1) != 0)
      {
        v30 = ((_BYTE)v29 + v27[698]) & 0x3F;
        v31 = *(_QWORD *)&v27[8 * v30 + 120];
        if (v31)
        {
          if (*(_DWORD *)(v31 + 12) && (*(_BYTE *)(v31 + 8) & 2) != 0 && *(_DWORD *)(v31 + 4) != -1)
            break;
        }
      }
LABEL_47:
      if (++v29 == 64)
        goto LABEL_48;
    }
    v32 = CAGP::current_timestamp((CAGP *)a1);
    v33 = *(_DWORD *)(v31 + 4);
    LODWORD(v117) = v32;
    v34 = v32 - v33;
    if (v32 - v33 < 0)
    {
      if (v34 > 0xEDF9BE00)
      {
        LODWORD(v118) = v32 - v33;
        v114 = (os_log_t)agps_log();
        if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
          AGPSessionRecvFrom(&v121, v115);
        goto LABEL_45;
      }
      v34 += 604800000;
    }
    LODWORD(v118) = v34;
LABEL_45:
    if ((int)v118 > *((_DWORD *)v27 + 178))
    {
      v124[0] = 5;
      v124[1] = v27[v30 + 632];
      *(_WORD *)&v124[2] = 0;
      *(_DWORD *)&v124[4] = *(_DWORD *)(a1 + 16);
      *(_DWORD *)&v124[8] = v123;
      *(_DWORD *)&v124[12] = *(_DWORD *)v31;
      *(_DWORD *)&v124[16] = *(_DWORD *)(v31 + 8) & 0x3FFFF03 | (4 * (v27[698] & 0x3F)) | (v27[697] << 26);
      *(_DWORD *)(v31 + 4) = v117;
      ++*(_DWORD *)(v31 + 1520);
      memcpy(v116, (const void *)(v31 + 16), *(unsigned int *)(v31 + 12));
      *(_WORD *)&v124[2] = agp_control::generate_checksum((agp_control *)v124, (__int16 *)(v31 + 16), *(_DWORD *)(v31 + 12));
      GCKSessionSendTo(*(_QWORD *)(a1 + 24), (uint64_t)&v123, 1, (uint64_t)v124, (*(_DWORD *)(v31 + 12) + 20), 0, 64, 0, 0, a4, 1);
    }
    goto LABEL_47;
  }
LABEL_48:
  v35 = *(_DWORD *)&v10[v24 + 4] >> 2;
  v36 = v27[698];
  if (v35 == v36)
    goto LABEL_136;
  *(_QWORD *)&v28 = 67109632;
  v118 = v28;
  *(_QWORD *)&v28 = 67109376;
  v117 = v28;
  while (1)
  {
    v37 = *(_QWORD *)&v27[8 * v36 + 120];
    if (!v37)
      break;
    if (!*(_DWORD *)(v37 + 12) || (*(_BYTE *)(v37 + 8) & 2) == 0)
      goto LABEL_61;
    v38 = AGPSendingSetElement::search((AGPSendingSetElement *)v27, *(_DWORD *)v37);
    if (v38 != v27[698] && (v39 = agps_log(), os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)))
    {
      v44 = v27[698];
      *(_DWORD *)v124 = v117;
      *(_DWORD *)&v124[4] = v38;
      *(_WORD *)&v124[8] = 1024;
      *(_DWORD *)&v124[10] = v44;
      _os_log_error_impl(&dword_20DC1A000, v39, OS_LOG_TYPE_ERROR, "SACK buf_idx [%d] != base [%d].", v124, 0xEu);
      if ((v38 & 0x80000000) == 0)
      {
LABEL_56:
        if ((AGPSendingSetElement::remove((AGPSendingSetElement *)v27, v38) & 1) != 0)
          goto LABEL_61;
        v40 = agps_log();
        if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          goto LABEL_61;
        v41 = *(_DWORD *)v37;
        *(_DWORD *)v124 = v118;
        *(_DWORD *)&v124[4] = v38;
        *(_WORD *)&v124[8] = 1024;
        *(_DWORD *)&v124[10] = v41;
        *(_WORD *)&v124[14] = 1024;
        *(_DWORD *)&v124[16] = v123;
        v42 = v40;
        v43 = "Failed to remove index (%02d) packet serial number (%08X) from (%08X).";
        goto LABEL_64;
      }
    }
    else if ((v38 & 0x80000000) == 0)
    {
      goto LABEL_56;
    }
    v45 = agps_log();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      v46 = *(_DWORD *)v37;
      *(_DWORD *)v124 = v118;
      *(_DWORD *)&v124[4] = -1;
      *(_WORD *)&v124[8] = 1024;
      *(_DWORD *)&v124[10] = v46;
      *(_WORD *)&v124[14] = 1024;
      *(_DWORD *)&v124[16] = v123;
      v42 = v45;
      v43 = "Index (%02d) packet serial number (%08X) from (%08X) was not found in sending set.";
LABEL_64:
      _os_log_error_impl(&dword_20DC1A000, v42, OS_LOG_TYPE_ERROR, v43, v124, 0x14u);
    }
LABEL_61:
    v36 = (v27[698] + 1) & 0x3F;
    v27[698] = v36;
    if (v35 == v36)
      goto LABEL_136;
  }
  v100 = agps_log();
  if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
    AGPSessionRecvFrom(v100, v101, v102);
LABEL_136:
  v103 = AGPSendingSetElement::search((AGPSendingSetElement *)v27, *(_DWORD *)&v10[v24]);
  if ((v103 & 0x80000000) == 0)
    AGPSendingSetElement::remove((AGPSendingSetElement *)v27, v103);
LABEL_138:
  pthread_mutex_unlock(v120);
  pthread_mutex_unlock((pthread_mutex_t *)v119);
  return 0;
}

void sub_20DC430F8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BB16B8](v1, 0x10E0C40923426B4);
  _Unwind_Resume(a1);
}

void *CAGP::receiveSetElement(CAGP *this, int a2)
{
  pthread_mutex_t *v4;
  _DWORD *v5;
  AGPAssociationSetElement *v6;
  void *value;

  v4 = (pthread_mutex_t *)((char *)this + 128);
  pthread_mutex_lock((pthread_mutex_t *)this + 2);
  v5 = (_DWORD *)*((_QWORD *)this + 7);
  v5[26] = a2;
  value = 0;
  if (!CFSetGetValueIfPresent(*((CFSetRef *)this + 4), v5, (const void **)&value))
  {
    v6 = (AGPAssociationSetElement *)operator new();
    AGPAssociationSetElement::AGPAssociationSetElement(v6, this);
    *(_QWORD *)v6 = &off_24C8412C8;
    value = v6;
    *((_DWORD *)v6 + 26) = a2;
    CFSetAddValue(*((CFMutableSetRef *)this + 4), v6);
  }
  pthread_mutex_unlock(v4);
  return value;
}

void sub_20DC431CC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BB16B8](v1, 0x10A1C404616C3E8);
  _Unwind_Resume(a1);
}

AGPDataQueue *AGPDataQueue::peek_head_for_participant(AGPDataQueue *this, int a2)
{
  AGPDataQueue *v3;
  pthread_mutex_t *v4;

  v3 = this;
  v4 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  do
    v3 = *(AGPDataQueue **)v3;
  while (v3 && (*((_DWORD *)v3 + 18) != 1 || *((_DWORD *)v3 + 2) != a2));
  pthread_mutex_unlock(v4);
  return v3;
}

AGPDataQueue **AGPDataQueue::pop_head_for_participant(AGPDataQueue *this, int a2)
{
  AGPDataQueue *v3;
  pthread_mutex_t *v4;
  AGPDataQueue *v5;
  AGPDataQueue **v6;
  AGPDataQueue *v7;
  AGPDataQueue **v8;
  AGPDataQueue **v9;

  v3 = this;
  v4 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  v5 = *(AGPDataQueue **)v3;
  if (*(_QWORD *)v3)
  {
    v6 = 0;
    v7 = *(AGPDataQueue **)v3;
    v8 = (AGPDataQueue **)v3;
    while (1)
    {
      v9 = (AGPDataQueue **)v7;
      if (*((_DWORD *)v7 + 18) == 1 && *((_DWORD *)v7 + 2) == a2)
        break;
      v7 = *(AGPDataQueue **)v7;
      v6 = v8;
      v8 = v9;
      if (!*v9)
        goto LABEL_6;
    }
    if (v6)
    {
      v3 = *v6;
      v5 = v7;
    }
    *(_QWORD *)v3 = *(_QWORD *)v5;
  }
  else
  {
LABEL_6:
    v9 = 0;
  }
  pthread_mutex_unlock(v4);
  return v9;
}

uint64_t AGPSessionEvent(uint64_t a1, uint64_t a2, __int128 *a3)
{
  uint64_t result;
  void (**v6)(uint64_t, uint64_t, __int128 *);
  void (*v7)(uint64_t, uint64_t, __int128 *);
  void (*v8)(uint64_t, uint64_t, __int128 *);
  unsigned int v9;
  __int128 v10;
  uint64_t v11;

  result = CheckInHandleDebug();
  if (result)
  {
    v6 = (void (**)(uint64_t, uint64_t, __int128 *))result;
    v7 = *(void (**)(uint64_t, uint64_t, __int128 *))result;
    if (!*(_QWORD *)result)
      return CheckOutHandleDebug();
    if (!a3)
      return CheckOutHandleDebug();
    v8 = *(void (**)(uint64_t, uint64_t, __int128 *))(result + 8);
    if (!v8)
      return CheckOutHandleDebug();
    v10 = *a3;
    v11 = *((_QWORD *)a3 + 2);
    if ((_DWORD)v10 == 3)
    {
      v9 = 5;
    }
    else
    {
      if ((_DWORD)v10 != 5)
        goto LABEL_11;
      v9 = 10;
    }
    if (!AGPSessionRecvFrom((uint64_t)v6, a2, (uint64_t)&v10, v9))
      return CheckOutHandleDebug();
    v7 = *v6;
    v8 = v6[1];
LABEL_11:
    v7((uint64_t)v8, a2, &v10);
    return CheckOutHandleDebug();
  }
  return result;
}

uint64_t AGPSessionMaximumSegmentSize(int a1)
{
  return (1115 - 16 * a1);
}

CFMutableStringRef AGPSessionCopyDetailedDescription()
{
  uint64_t v0;
  CFMutableStringRef Mutable;
  CFMutableStringRef v2;

  v0 = CheckInHandleDebug();
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  v2 = Mutable;
  if (v0)
  {
    CFStringAppendF();
    CFStringAppendF();
    CheckOutHandleDebug();
  }
  else
  {
    CFRelease(Mutable);
    return 0;
  }
  return v2;
}

void AGPAssociationSetElement::AGPAssociationSetElement(AGPAssociationSetElement *this, CAGP *a2)
{
  int v3;
  uint64_t v4;
  _DWORD *v5;
  pthread_mutexattr_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 12) = 0;
  *(_QWORD *)this = &off_24C8412A8;
  *((_QWORD *)this + 1) = a2;
  *((_DWORD *)this + 27) = 0;
  *(_OWORD *)((char *)this + 696) = 0u;
  *((_DWORD *)this + 178) = 0;
  if (!pthread_mutexattr_init(&v6))
  {
    pthread_mutexattr_settype(&v6, 2);
    pthread_mutex_init((pthread_mutex_t *)((char *)this + 32), &v6);
    pthread_mutexattr_destroy(&v6);
  }
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 32));
  UpdateRTO((unsigned int *)this + 175, 250);
  pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 32));
  v3 = 0;
  v4 = 0;
  *((_DWORD *)this + 28) = -1;
  do
  {
    v5 = (_DWORD *)operator new();
    v5[380] = 0;
    v5[2] = v3;
    v5[3] = 0;
    *((_QWORD *)this + v4 + 15) = v5;
    v5[1] = -1;
    *((_BYTE *)this + v4++ + 632) = 0x80;
    v3 += 256;
  }
  while (v4 != 64);
}

void AGPSendingSetElement::~AGPSendingSetElement(AGPSendingSetElement *this)
{
  *(_QWORD *)this = &off_24C841248;
  AGPAssociationSetElement::~AGPAssociationSetElement(this);
}

{
  *(_QWORD *)this = &off_24C841248;
  AGPAssociationSetElement::~AGPAssociationSetElement(this);
  JUMPOUT(0x212BB16B8);
}

void sub_20DC43600(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BB16B8](v1, 0x10A1C404616C3E8);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void AGPAssociationSetElement::~AGPAssociationSetElement(AGPAssociationSetElement *this)
{
  AGPAssociationSetElement::~AGPAssociationSetElement(this);
  JUMPOUT(0x212BB16B8);
}

{
  uint64_t v2;
  uint64_t v3;

  v2 = 0;
  *(_QWORD *)this = &off_24C8412A8;
  do
  {
    *((_BYTE *)this + v2 + 632) = 0x80;
    v3 = *((_QWORD *)this + v2 + 15);
    if (v3)
      MEMORY[0x212BB16B8](v3, 0x1000C40049130BCLL);
    ++v2;
  }
  while (v2 != 64);
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 32));
}

void sub_20DC4366C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BB16B8](v1, 0x10A1C404616C3E8);
  _Unwind_Resume(a1);
}

void AGPDataQueueNode::~AGPDataQueueNode(CFTypeRef *this)
{
  CFTypeRef v2;

  CFRelease(this[10]);
  this[10] = 0;
  *((_DWORD *)this + 18) = 0;
  v2 = this[12];
  if (v2)
    _Block_release(v2);
}

void CAGP::CAGP(CAGP *this)
{
  AGPAssociationSetElement *v2;
  AGPAssociationSetElement *v3;
  pthread_mutexattr_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  AGPDataQueue::AGPDataQueue((CAGP *)((char *)this + 216));
  AGPDataQueue::AGPDataQueue((CAGP *)((char *)this + 288));
  *((_QWORD *)this + 24) = 0;
  *((_QWORD *)this + 25) = 0;
  *((_QWORD *)this + 4) = CFSetCreateMutable(0, 0, &associationSetCallBacks);
  *((_QWORD *)this + 5) = CFSetCreateMutable(0, 0, &associationSetCallBacks);
  v2 = (AGPAssociationSetElement *)operator new();
  AGPAssociationSetElement::AGPAssociationSetElement(v2, this);
  *(_QWORD *)v2 = &off_24C8412C8;
  *((_QWORD *)this + 7) = v2;
  v3 = (AGPAssociationSetElement *)operator new();
  AGPAssociationSetElement::AGPAssociationSetElement(v3, this);
  *(_QWORD *)v3 = &off_24C841248;
  *((_QWORD *)this + 6) = v3;
  if (!pthread_mutexattr_init(&v4))
  {
    pthread_mutexattr_settype(&v4, 2);
    pthread_mutex_init((pthread_mutex_t *)this + 1, &v4);
    pthread_mutex_init((pthread_mutex_t *)this + 2, &v4);
    pthread_mutexattr_destroy(&v4);
  }
  *((_DWORD *)this + 52) = -1;
  *(_OWORD *)((char *)this + 360) = 0u;
  *(_OWORD *)((char *)this + 376) = 0u;
  *(_OWORD *)((char *)this + 388) = 0u;
}

void sub_20DC438A4(_Unwind_Exception *a1)
{
  AGPDataQueue *v1;
  AGPDataQueue *v2;
  uint64_t v3;

  MEMORY[0x212BB16B8](v3, 0x10A1C404616C3E8);
  AGPDataQueue::~AGPDataQueue(v2);
  AGPDataQueue::~AGPDataQueue(v1);
  _Unwind_Resume(a1);
}

void AGPDataQueue::AGPDataQueue(AGPDataQueue *this)
{
  pthread_mutexattr_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)this = 0;
  if (!pthread_mutexattr_init(&v2))
  {
    pthread_mutexattr_settype(&v2, 2);
    pthread_mutex_init((pthread_mutex_t *)((char *)this + 8), &v2);
    pthread_mutexattr_destroy(&v2);
  }
}

void AGPReceiveSetElement::~AGPReceiveSetElement(AGPReceiveSetElement *this)
{
  *(_QWORD *)this = &off_24C8412C8;
  AGPAssociationSetElement::~AGPAssociationSetElement(this);
}

{
  *(_QWORD *)this = &off_24C8412C8;
  AGPAssociationSetElement::~AGPAssociationSetElement(this);
  JUMPOUT(0x212BB16B8);
}

void sub_20DC439D8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BB16B8](v1, 0x10A1C404616C3E8);
  _Unwind_Resume(a1);
}

void AGPDataQueue::~AGPDataQueue(AGPDataQueue *this)
{
  CFTypeRef *i;

  for (i = *(CFTypeRef **)this; *(_QWORD *)this; i = *(CFTypeRef **)this)
  {
    *(_QWORD *)this = *i;
    AGPDataQueueNode::~AGPDataQueueNode(i);
    MEMORY[0x212BB16B8](i, 0x10E0C40923426B4);
  }
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 8));
}

void sub_20DC43A5C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BB16B8](v1, 0x10E0C40923426B4);
  _Unwind_Resume(a1);
}

void CAGP::~CAGP(pthread_mutex_t *this)
{
  const void *v2;
  const void *v3;
  _QWORD *sig;
  __CFSet *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(const void **)&this->__opaque[32];
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)&this->__opaque[32] = 0;
  }
  v3 = *(const void **)&this->__opaque[24];
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)&this->__opaque[24] = 0;
  }
  while (1)
  {
    sig = (_QWORD *)this[3].__sig;
    if (!sig)
      break;
    v5 = (__CFSet *)sig[3];
    this[3].__sig = sig[2];
    CFSetRemoveValue(v5, sig);
  }
  while (1)
  {
    v6 = *(_QWORD **)this[3].__opaque;
    if (!v6)
      break;
    *(_QWORD *)this[3].__opaque = v6[2];
    (*(void (**)(_QWORD *))(*v6 + 8))(v6);
  }
  pthread_mutex_destroy(this + 1);
  pthread_mutex_destroy(this + 2);
  v7 = *(_QWORD *)&this->__opaque[40];
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  v8 = *(_QWORD *)&this->__opaque[48];
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  AGPDataQueue::~AGPDataQueue((AGPDataQueue *)&this[4].__opaque[24]);
  AGPDataQueue::~AGPDataQueue((AGPDataQueue *)&this[3].__opaque[16]);
}

void sub_20DC43B3C(_Unwind_Exception *a1)
{
  uint64_t v1;

  AGPDataQueue::~AGPDataQueue((AGPDataQueue *)(v1 + 216));
  _Unwind_Resume(a1);
}

_BYTE *OUTLINED_FUNCTION_1_1(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

uint64_t PostEventCallback(uint64_t a1, int a2, int a3, const void *a4, int a5, int a6)
{
  uint64_t v6;
  _DWORD *v13;
  _DWORD *v14;
  void *v15;
  _DWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;

  v6 = 2149187587;
  if (!a1)
    return 2149187585;
  if (*(_DWORD *)(a1 + 4))
    return 2149187606;
  if (a4 && a5)
  {
    v13 = malloc_type_malloc(a5 + 48, 0xD8761618uLL);
    if (!v13)
      return v6;
    v14 = v13;
    *v13 = a2;
    v13[2] = a3;
    v15 = v13 + 12;
    *((_QWORD *)v14 + 2) = v15;
    v14[6] = a5;
    v14[7] = a6;
    memcpy(v15, a4, a5);
  }
  else
  {
    v16 = malloc_type_malloc(0x30uLL, 0x103004055E16862uLL);
    if (!v16)
      return v6;
    v14 = v16;
    *v16 = a2;
    v16[2] = a3;
    *((_QWORD *)v16 + 2) = 0;
    v16[6] = 0;
    v16[7] = a6;
  }
  *((_QWORD *)v14 + 5) = 0;
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
  v17 = (_QWORD *)(a1 + 40);
  do
  {
    v18 = v17;
    v19 = *v17;
    v17 = (_QWORD *)(*v17 + 40);
  }
  while (v19);
  *v18 = v14;
  pthread_cond_signal((pthread_cond_t *)(a1 + 112));
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
  return 0;
}

uint64_t ServiceWaitEventCallbacks(uint64_t a1, double a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  NSObject *v8;
  int v9;
  int v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  result = 2149187585;
  if (a1)
  {
    if (*(_DWORD *)(a1 + 4))
    {
      return 2149187606;
    }
    else
    {
      pthread_mutex_lock((pthread_mutex_t *)(a1 + 248));
      v6 = (uint64_t *)(a1 + 240);
      v5 = *(_QWORD *)(a1 + 240);
      if (v5)
      {
        do
        {
          v7 = (uint64_t *)(v5 + 40);
          if (*(double *)(v5 + 32) <= a2)
          {
            *v6 = *v7;
            *v7 = 0;
            v8 = ec_log();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
            {
              v9 = *(_DWORD *)(v5 + 8);
              v10 = *(_DWORD *)v5;
              *(_DWORD *)buf = 67109376;
              v12 = v9;
              v13 = 1024;
              v14 = v10;
              _os_log_impl(&dword_20DC1A000, v8, OS_LOG_TYPE_DEFAULT, "ServiceWaitEventCallbacks: post delayed event of type %d to participant %08X.", buf, 0xEu);
            }
            PostEventCallback(a1, *(_DWORD *)v5, *(_DWORD *)(v5 + 8), *(const void **)(v5 + 16), *(_DWORD *)(v5 + 24), *(_DWORD *)(v5 + 28));
            free((void *)v5);
          }
          else
          {
            v6 = (uint64_t *)(v5 + 40);
          }
          v5 = *v6;
        }
        while (*v6);
      }
      pthread_mutex_unlock((pthread_mutex_t *)(a1 + 248));
      return 0;
    }
  }
  return result;
}

uint64_t CleanupWaitEventCallbacks(uint64_t a1)
{
  NSObject *v2;
  _QWORD *v3;
  uint8_t v5[16];

  v2 = ec_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20DC1A000, v2, OS_LOG_TYPE_DEFAULT, "Start cleanup.", v5, 2u);
  }
  if (!a1)
    return 2149187585;
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 248));
  while (1)
  {
    v3 = *(_QWORD **)(a1 + 240);
    if (!v3)
      break;
    *(_QWORD *)(a1 + 240) = v3[5];
    free(v3);
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 248));
  return 0;
}

uint64_t StartEventCallbackThread(_DWORD *a1)
{
  pthread_mutex_t *v2;
  uint64_t v3;
  pthread_attr_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 2149187585;
  memset(&v5, 0, sizeof(v5));
  v2 = (pthread_mutex_t *)(a1 + 12);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 12));
  pthread_attr_init(&v5);
  pthread_attr_setdetachstate(&v5, 2);
  v3 = pthread_create((pthread_t *)a1 + 20, 0, (void *(__cdecl *)(void *))EventCBProc, a1);
  pthread_attr_destroy(&v5);
  if ((_DWORD)v3)
    v3 = v3 | 0xC01A0000;
  else
    *a1 = 1;
  pthread_mutex_unlock(v2);
  return v3;
}

uint64_t EventCBProc(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;
  uint8_t v5[16];

  pthread_setname_np("com.apple.multipeerconnectivity.eventcallback.eventcbproc");
  while (1)
  {
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
    while (1)
    {
      v2 = *(_QWORD **)(a1 + 40);
      if (v2)
        break;
      if (*(_DWORD *)(a1 + 4))
        goto LABEL_8;
      pthread_cond_wait((pthread_cond_t *)(a1 + 112), (pthread_mutex_t *)(a1 + 48));
    }
    if (*(_DWORD *)(a1 + 4))
      break;
    *(_QWORD *)(a1 + 40) = v2[5];
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
    (*(void (**)(_QWORD, _QWORD, _QWORD *))(a1 + 8))(*(_QWORD *)(a1 + 16), *(unsigned int *)v2, v2 + 1);
    free(v2);
  }
LABEL_8:
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
  v3 = ec_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20DC1A000, v3, OS_LOG_TYPE_DEFAULT, "EventCallbackThread ends.", v5, 2u);
  }
  return 0;
}

uint64_t StopEventCallbackThread(char *a1)
{
  uint64_t v1;
  pthread_mutex_t *v3;
  int v4;
  _QWORD *v5;
  _QWORD *v6;

  v1 = 2149187585;
  if (a1)
  {
    v3 = (pthread_mutex_t *)(a1 + 48);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
    v4 = *(_DWORD *)a1;
    if (*(_DWORD *)a1)
    {
      *((_DWORD *)a1 + 1) = 1;
      pthread_cond_signal((pthread_cond_t *)(a1 + 112));
    }
    v5 = (_QWORD *)*((_QWORD *)a1 + 5);
    if (v5)
    {
      do
      {
        v6 = (_QWORD *)v5[5];
        free(v5);
        v5 = v6;
      }
      while (v6);
    }
    *((_QWORD *)a1 + 5) = 0;
    pthread_mutex_unlock(v3);
    pthread_join(*((pthread_t *)a1 + 20), 0);
    CleanupWaitEventCallbacks((uint64_t)a1);
    pthread_mutex_destroy(v3);
    pthread_mutex_destroy((pthread_mutex_t *)(a1 + 248));
    pthread_cond_destroy((pthread_cond_t *)(a1 + 112));
    free(a1);
    if (v4)
      return 0;
    else
      return 2149187606;
  }
  return v1;
}

uint64_t OSPFMakeHello(_QWORD *a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  char *v8;
  uint64_t v9;
  unsigned int v10;

  v8 = (char *)malloc_type_calloc(1uLL, 0x22uLL, 0x24E525CuLL);
  if (!v8)
    return 0xFFFFFFFFLL;
  v9 = 0;
  LOWORD(v10) = 0;
  *(_WORD *)v8 = 449;
  *(_DWORD *)(v8 + 2) = 50340352;
  *((_DWORD *)v8 + 2) = bswap32(a3);
  *((_DWORD *)v8 + 3) = bswap32(a4);
  *((_WORD *)v8 + 8) = bswap32(*(unsigned __int16 *)(a2 + 12)) >> 16;
  *(_DWORD *)(v8 + 18) = 268435960;
  *(_DWORD *)(v8 + 22) = 523;
  *(_QWORD *)(v8 + 26) = bswap64(*(_QWORD *)(a2 + 16));
  do
    v10 = CRC16Table[(v8[v9++] ^ v10)] ^ ((unsigned __int16)(v10 & 0xFF00) >> 8);
  while (v9 != 34);
  *((_WORD *)v8 + 3) = bswap32(v10) >> 16;
  *a1 = v8;
  return 34;
}

uint64_t OSPFMakeHeartbeat(_QWORD *a1, unsigned int a2, unsigned int a3, int a4, unsigned int a5)
{
  _DWORD *v10;
  uint64_t v11;
  unsigned int v12;

  v10 = malloc_type_calloc(1uLL, 0x14uLL, 0xFE56355EuLL);
  if (!v10)
    return 0xFFFFFFFFLL;
  v11 = 0;
  LOWORD(v12) = 0;
  *(_WORD *)v10 = 2241;
  *(_DWORD *)((char *)v10 + 2) = 5120;
  v10[2] = bswap32(a2);
  v10[3] = bswap32(a3);
  *((_WORD *)v10 + 8) = (a4 != 0) << 9;
  *((_WORD *)v10 + 9) = __rev16(a5);
  do
    v12 = CRC16Table[(*((_BYTE *)v10 + v11++) ^ v12)] ^ ((unsigned __int16)(v12 & 0xFF00) >> 8);
  while (v11 != 20);
  *((_WORD *)v10 + 3) = bswap32(v12) >> 16;
  *a1 = v10;
  return 20;
}

uint64_t OSPFMakeDD(_QWORD *a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, int a6)
{
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _WORD *v17;
  _WORD *v18;
  uint64_t v19;
  _WORD *v20;
  unsigned int *v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  unsigned int *v27;
  unsigned int v28;
  uint64_t v29;
  _QWORD *v30;
  unsigned int v31;
  uint64_t v32;
  char *v33;
  char v34;
  uint64_t v36;
  _QWORD *v37;
  int v38;
  unsigned int v39;
  _WORD *v40;

  v10 = *(unsigned int *)(a2 + 12);
  v11 = *(_QWORD *)(a2 + 16);
  if ((int)v10 < 1)
  {
    v12 = 0;
    v13 = 2;
  }
  else
  {
    v12 = 0;
    v13 = 2;
    v14 = *(unsigned int *)(a2 + 12);
    v15 = *(_QWORD *)(a2 + 16);
    do
    {
      if (*(_DWORD *)v15 != a5)
      {
        v13 += *(unsigned __int8 *)(v15 + 8) + 8 * *(_DWORD *)(v15 + 284) + 9;
        ++v12;
      }
      v15 += 416;
      --v14;
    }
    while (v14);
  }
  v16 = (v13 + 16);
  v17 = malloc_type_calloc(1uLL, (int)v16, 0xED2242E1uLL);
  if (!v17)
    return 0xFFFFFFFFLL;
  v18 = v17;
  v38 = a6;
  v36 = v16;
  v37 = a1;
  *v17 = 705;
  v17[1] = bswap32(v16) >> 16;
  *((_DWORD *)v17 + 2) = bswap32(a4);
  *((_DWORD *)v17 + 3) = bswap32(a5);
  v17[8] = bswap32(v12) >> 16;
  if ((int)v10 >= 1)
  {
    v19 = 0;
    v20 = v17 + 9;
    v21 = (unsigned int *)(v11 + 292);
    do
    {
      v22 = *(_DWORD *)(v11 + 416 * v19);
      if (v22 != a5)
      {
        v23 = v11 + 416 * v19;
        v24 = *(unsigned int *)(v23 + 284);
        *(_DWORD *)v20 = bswap32(v22);
        v20[2] = bswap32(*(unsigned __int16 *)(v23 + 272)) >> 16;
        *((_BYTE *)v20 + 6) = *(_BYTE *)(v23 + 8);
        v25 = (char *)v20 + 7;
        memcpy((char *)v20 + 7, (const void *)(v23 + 9), *(unsigned __int8 *)(v23 + 8));
        v26 = &v25[*(unsigned __int8 *)(v23 + 8)];
        *(_WORD *)v26 = bswap32(v24) >> 16;
        v20 = v26 + 2;
        if ((int)v24 >= 1)
        {
          v27 = v21;
          do
          {
            *(_DWORD *)v20 = bswap32(*(v27 - 1));
            v28 = *v27;
            v27 += 2;
            *((_DWORD *)v20 + 1) = bswap32(v28);
            v20 += 4;
            --v24;
          }
          while (v24);
        }
      }
      ++v19;
      v21 += 104;
    }
    while (v19 != v10);
  }
  if (v38)
  {
    v40 = 0;
    v39 = 0;
    v29 = v36;
    if (!ospfTryCompressPacket(&v40, &v39, (uint64_t)v18, v36))
    {
      free(v18);
      v18 = v40;
      v29 = v39;
    }
    v30 = v37;
  }
  else
  {
    v29 = v36;
    v30 = v37;
  }
  if ((int)v29 < 1)
  {
    v31 = 0;
  }
  else
  {
    LOWORD(v31) = 0;
    v32 = v29;
    v33 = (char *)v18;
    do
    {
      v34 = *v33++;
      v31 = CRC16Table[(v34 ^ v31)] ^ ((unsigned __int16)(v31 & 0xFF00) >> 8);
      --v32;
    }
    while (v32);
  }
  v18[3] = bswap32(v31) >> 16;
  *v30 = v18;
  return v29;
}

uint64_t ospfTryCompressPacket(_QWORD *a1, unsigned int *a2, uint64_t a3, int a4)
{
  signed int v8;
  void *v9;
  _WORD *v10;
  unsigned __int16 v11;
  unsigned int v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t result;
  const char *v16;
  int v17;
  unsigned int v18;
  NSObject *v19;
  int v20;
  const char *v21;
  uLongf destLen;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  signed int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  unsigned int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a4 - 16;
  destLen = compressBound(a4 - 16);
  v9 = malloc_type_malloc(destLen + 18, 0x51194D10uLL);
  if (!v9)
    return 1;
  v10 = v9;
  if (compress2((Bytef *)v9 + 18, &destLen, (const Bytef *)(a3 + 16), v8, 9) || (v11 = destLen, (int)destLen + 2 >= v8))
  {
    v19 = ospf_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *(unsigned __int8 *)(a3 + 1);
      v21 = "OSPF";
      if (v20 == 3)
        v21 = "LSA";
      *(_DWORD *)buf = 136315650;
      if (v20 == 2)
        v21 = "DD";
      v24 = v21;
      v25 = 1024;
      v26 = v8;
      v27 = 1024;
      v28 = destLen;
      _os_log_impl(&dword_20DC1A000, v19, OS_LOG_TYPE_DEFAULT, "%s compressed body %u => %u+2 (not performed).", buf, 0x18u);
    }
    free(v10);
    return 1;
  }
  *(_OWORD *)v10 = *(_OWORD *)a3;
  v10[8] = bswap32(v8) >> 16;
  v10[2] = 256;
  v12 = v11 + 18;
  v10[1] = bswap32(v12) >> 16;
  *a1 = v10;
  *a2 = v12;
  v13 = ospf_log();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v14)
  {
    v16 = "OSPF";
    v17 = *(unsigned __int8 *)(a3 + 1);
    v18 = *a2;
    if (v17 == 3)
      v16 = "LSA";
    *(_DWORD *)buf = 136316162;
    if (v17 == 2)
      v16 = "DD";
    v24 = v16;
    v25 = 1024;
    v26 = v8;
    v27 = 1024;
    v28 = v11;
    v29 = 1024;
    v30 = a4;
    v31 = 1024;
    v32 = v18;
    _os_log_impl(&dword_20DC1A000, v13, OS_LOG_TYPE_DEFAULT, "%s compressed body %u => %u+2, total size: %d => %d.", buf, 0x24u);
    return 0;
  }
  return result;
}

uint64_t OSPFMakeLSA(_QWORD *a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, int a6)
{
  uint64_t v6;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _WORD *v18;
  _WORD *v19;
  uint64_t v20;
  _WORD *v21;
  unsigned int *v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  unsigned int *v28;
  unsigned int v29;
  uint64_t v30;
  _QWORD *v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int v41;
  uint64_t v42;
  char *v43;
  char v44;
  int v46;
  uint64_t v47;
  _QWORD *v48;
  unsigned int v49;
  _WORD *v50;
  uint8_t buf[16];

  v6 = *(unsigned int *)(a2 + 16);
  if ((int)v6 < 1)
    goto LABEL_21;
  v11 = 0;
  v12 = *(unsigned __int16 *)(a2 + 12);
  v13 = *(_QWORD *)(a2 + 24);
  v14 = 4;
  v15 = *(unsigned int *)(a2 + 16);
  v16 = v13;
  do
  {
    if (*(_DWORD *)v16 != a5 && *(_DWORD *)(v16 + 276) && *(_DWORD *)(v16 + 280) != a5)
    {
      v14 += *(unsigned __int8 *)(v16 + 8) + 8 * *(_DWORD *)(v16 + 284) + 9;
      ++v11;
    }
    v16 += 416;
    --v15;
  }
  while (v15);
  if (!(_WORD)v11)
  {
LABEL_21:
    v32 = ospf_log();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DC1A000, v32, OS_LOG_TYPE_DEFAULT, "No eligible nodes.", buf, 2u);
    }
    return 0xFFFFFFFFLL;
  }
  v17 = (v14 + 16);
  v18 = malloc_type_calloc(1uLL, (int)v17, 0xA469801EuLL);
  if (!v18)
  {
    v33 = ospf_log();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      OSPFMakeLSA_cold_1(v33, v34, v35, v36, v37, v38, v39, v40);
    return 0xFFFFFFFFLL;
  }
  v19 = v18;
  v46 = a6;
  v47 = v17;
  v48 = a1;
  v20 = 0;
  *v18 = 961;
  v18[1] = bswap32(v17) >> 16;
  *((_DWORD *)v18 + 2) = bswap32(a4);
  *((_DWORD *)v18 + 3) = bswap32(a5);
  v18[8] = __rev16(v12);
  v18[9] = bswap32(v11) >> 16;
  v21 = v18 + 10;
  v22 = (unsigned int *)(v13 + 292);
  do
  {
    v23 = *(_DWORD *)(v13 + 416 * v20);
    if (v23 != a5)
    {
      if (*(_DWORD *)(v13 + 416 * v20 + 276))
      {
        if (*(_DWORD *)(v13 + 416 * v20 + 280) != a5)
        {
          v24 = v13 + 416 * v20;
          v25 = *(unsigned int *)(v24 + 284);
          *(_DWORD *)v21 = bswap32(v23);
          v21[2] = bswap32(*(unsigned __int16 *)(v24 + 272)) >> 16;
          *((_BYTE *)v21 + 6) = *(_BYTE *)(v24 + 8);
          v26 = (char *)v21 + 7;
          memcpy((char *)v21 + 7, (const void *)(v24 + 9), *(unsigned __int8 *)(v24 + 8));
          v27 = &v26[*(unsigned __int8 *)(v24 + 8)];
          *(_WORD *)v27 = bswap32(v25) >> 16;
          v21 = v27 + 2;
          if ((int)v25 >= 1)
          {
            v28 = v22;
            do
            {
              *(_DWORD *)v21 = bswap32(*(v28 - 1));
              v29 = *v28;
              v28 += 2;
              *((_DWORD *)v21 + 1) = bswap32(v29);
              v21 += 4;
              --v25;
            }
            while (v25);
          }
        }
      }
    }
    ++v20;
    v22 += 104;
  }
  while (v20 != v6);
  if (v46)
  {
    v50 = 0;
    v49 = 0;
    v30 = v47;
    v31 = v48;
    if (!ospfTryCompressPacket(&v50, &v49, (uint64_t)v19, v47))
    {
      free(v19);
      v19 = v50;
      v30 = v49;
    }
  }
  else
  {
    v30 = v47;
    v31 = v48;
  }
  if ((int)v30 < 1)
  {
    v41 = 0;
  }
  else
  {
    LOWORD(v41) = 0;
    v42 = v30;
    v43 = (char *)v19;
    do
    {
      v44 = *v43++;
      v41 = CRC16Table[(v44 ^ v41)] ^ ((unsigned __int16)(v41 & 0xFF00) >> 8);
      --v42;
    }
    while (v42);
  }
  v19[3] = bswap32(v41) >> 16;
  *v31 = v19;
  return v30;
}

uint64_t OSPFMakeLSAACK(_QWORD *a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5)
{
  _DWORD *v9;
  uint64_t v10;
  unsigned int v11;
  NSObject *v13;

  v9 = malloc_type_calloc(1uLL, 0x12uLL, 0xD528DFCFuLL);
  if (v9)
  {
    v10 = 0;
    LOWORD(v11) = 0;
    *v9 = 301991105;
    v9[2] = bswap32(a4);
    v9[3] = bswap32(a5);
    *((_WORD *)v9 + 8) = bswap32(*(unsigned __int16 *)(a2 + 12)) >> 16;
    do
      v11 = CRC16Table[(*((_BYTE *)v9 + v10++) ^ v11)] ^ ((unsigned __int16)(v11 & 0xFF00) >> 8);
    while (v10 != 18);
    *((_WORD *)v9 + 3) = bswap32(v11) >> 16;
    *a1 = v9;
    return 18;
  }
  else
  {
    v13 = ospf_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      OSPFMakeLSAACK_cold_1(a5, v13);
    return 0xFFFFFFFFLL;
  }
}

uint64_t OSPFMakeData(char *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, unsigned int *a7, uint64_t a8, uint64_t (*a9)(uint64_t, unsigned int *, uint64_t, char *, _QWORD, uint64_t, _QWORD, _QWORD, int), uint64_t a10, char a11, unsigned __int8 a12, unsigned __int8 a13)
{
  int v13;
  unsigned int *v14;
  char v16;
  char *v19;
  char *v20;
  int v21;
  uint64_t v22;
  unsigned int v23;
  _WORD *v24;
  uint64_t v25;
  _DWORD *v26;
  unsigned int v27;
  uint64_t v28;
  char v29;
  int v31;

  v13 = a8;
  v14 = a7;
  v16 = a5;
  v19 = a1;
  v20 = &a1[4 * (int)a8];
  if (a9)
  {
    *(_WORD *)((char *)&v31 + 1) = __PAIR16__(a13, a12);
    LOBYTE(v31) = a11;
    v21 = a9(a10, a7, a8, v20 + 12, (1488 - 4 * a8), a5, *(_QWORD *)a3, *(unsigned int *)(a3 + 8), v31);
    if (v21 < 0)
    {
      v22 = 0;
      v23 = 0;
      *((_WORD *)v19 + 2) = 0;
      v24 = v19 + 6;
LABEL_15:
      *v24 = bswap32(v23) >> 16;
      return v22;
    }
  }
  else
  {
    v21 = 0;
  }
  v22 = (4 * v13 + v21 + *(_DWORD *)(a3 + 8) + 12);
  if ((int)v22 <= a2)
  {
    *v19 = v13 & 0xF | 0xC0;
    v19[1] = v16;
    *((_WORD *)v19 + 1) = bswap32(v22) >> 16;
    *((_DWORD *)v19 + 2) = bswap32(a6);
    if (v13 >= 1)
    {
      v25 = v13;
      v26 = v19 + 12;
      do
      {
        v27 = *v14++;
        *v26++ = bswap32(v27);
        --v25;
      }
      while (v25);
    }
    memcpy(&v20[v21 + 12], *(const void **)a3, *(int *)(a3 + 8));
    *((_DWORD *)v19 + 1) = 0;
    v24 = v19 + 6;
    if ((int)v22 < 1)
    {
      v23 = 0;
    }
    else
    {
      LOWORD(v23) = 0;
      v28 = v22;
      do
      {
        v29 = *v19++;
        v23 = CRC16Table[(v29 ^ v23)] ^ ((unsigned __int16)(v23 & 0xFF00) >> 8);
        --v28;
      }
      while (v28);
    }
    goto LABEL_15;
  }
  return 0xFFFFFFFFLL;
}

uint64_t ospfParseOption(uint64_t a1, uint64_t a2, int *a3, _DWORD *a4)
{
  uint64_t result;
  int v7;
  NSObject *v9;
  int v10;
  int v11;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  int v18;
  NSObject *v19;
  int v20;
  int v21;
  int v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if ((*(_WORD *)(a1 + 4) & 2) == 0)
    return 0;
  v7 = *a3;
  if (!*a3)
    goto LABEL_7;
  if (v7 <= 3)
  {
    v9 = ospf_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(unsigned __int8 *)(a1 + 1);
      v11 = *a3;
      v22 = 67109376;
      v23 = v10;
      v24 = 1024;
      v25 = v11;
      _os_log_impl(&dword_20DC1A000, v9, OS_LOG_TYPE_DEFAULT, "Msg: %d: option too small: %d.", (uint8_t *)&v22, 0xEu);
    }
LABEL_7:
    result = 0;
    *a4 = 0;
    return result;
  }
  v13 = *(_BYTE **)a2;
  v14 = 4 * *(unsigned __int8 *)(*(_QWORD *)a2 + 1);
  v15 = v14 + 4;
  if ((int)v14 + 4 <= v7)
  {
    if (*v13)
    {
      if ((char)*v13 < 0)
      {
        v19 = ospf_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = *(unsigned __int8 *)(a1 + 1);
          v21 = *v13;
          v22 = 67109376;
          v23 = v20;
          v24 = 1024;
          v25 = v21;
          _os_log_impl(&dword_20DC1A000, v19, OS_LOG_TYPE_DEFAULT, "Msg: %d: unsupported required option: %d", (uint8_t *)&v22, 0xEu);
        }
        *a4 = 1;
        v13 = *(_BYTE **)a2;
      }
      else
      {
        *a4 = 0;
      }
    }
    else
    {
      *a4 = 1;
    }
    *(_QWORD *)a2 = &v13[v15];
    *a3 -= v15;
    return 1;
  }
  else
  {
    v16 = ospf_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(unsigned __int8 *)(a1 + 1);
      v18 = *a3;
      v22 = 67109632;
      v23 = v17;
      v24 = 1024;
      v25 = v15;
      v26 = 1024;
      v27 = v18;
      _os_log_impl(&dword_20DC1A000, v16, OS_LOG_TYPE_DEFAULT, "Msg: %d: incorrect option size: %d > %d.", (uint8_t *)&v22, 0x14u);
    }
    result = 1;
    *a4 = 1;
  }
  return result;
}

uint64_t ospfVerifyOptions(uint64_t a1, unsigned __int8 *a2, int a3, int *a4, _DWORD *a5)
{
  NSObject *v6;
  int v7;
  uint64_t result;
  uint64_t v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  int v15;
  int v16;
  int v17;
  unsigned __int8 *v18;
  int v19;
  int v20;
  uint64_t v21;
  unint64_t v22;
  int v23;
  NSObject *v24;
  int v25;
  NSObject *v26;
  int v27;
  NSObject *v28;
  int v29;
  int v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  if (a3 > 3)
  {
    if (*a2 == 248)
    {
      v11 = __rev16(*((unsigned __int16 *)a2 + 1));
      if (v11 <= a3)
      {
        v17 = a2[1];
        v18 = a2 + 4;
        if (a2[1])
        {
          v19 = 0;
          while (1)
          {
            v20 = (_DWORD)v18 - (_DWORD)a2;
            v21 = v11 - (v18 - a2);
            if (v21 <= 3)
              break;
            v22 = 4 * v18[1] + 4;
            if (v21 < v22)
            {
              v28 = ospf_log();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                v29 = *(unsigned __int8 *)(a1 + 1);
                v30 = 67110400;
                v31 = v29;
                v32 = 1024;
                v33 = v19;
                v34 = 1024;
                v35 = v17;
                v36 = 1024;
                v37 = v20;
                v38 = 1024;
                v39 = v11;
                v40 = 1024;
                v41 = v22;
                _os_log_impl(&dword_20DC1A000, v28, OS_LOG_TYPE_DEFAULT, "Msg: %d: option %d of %d: @%d/%d, size=%d.", (uint8_t *)&v30, 0x26u);
              }
              return 5;
            }
            v18 += v22;
            if (v17 == ++v19)
              goto LABEL_19;
          }
          v26 = ospf_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v27 = *(unsigned __int8 *)(a1 + 1);
            v30 = 67109632;
            v31 = v27;
            v32 = 1024;
            v33 = v19;
            v34 = 1024;
            v35 = v17;
            _os_log_impl(&dword_20DC1A000, v26, OS_LOG_TYPE_DEFAULT, "Msg: %d: option %d of %d: not enough option header.", (uint8_t *)&v30, 0x14u);
          }
          return 4;
        }
        else
        {
LABEL_19:
          v23 = (_DWORD)v18 - (_DWORD)a2;
          if (v18 - a2 == v11)
          {
            result = 0;
            *a4 = v17;
            *a5 = v11;
          }
          else
          {
            v24 = ospf_log();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              v25 = *(unsigned __int8 *)(a1 + 1);
              v30 = 67109888;
              v31 = v25;
              v32 = 1024;
              v33 = v17;
              v34 = 1024;
              v35 = v23;
              v36 = 1024;
              v37 = v11;
              _os_log_impl(&dword_20DC1A000, v24, OS_LOG_TYPE_DEFAULT, "Msg: %d: %d options used %d bytes != %d offset.", (uint8_t *)&v30, 0x1Au);
            }
            return 6;
          }
        }
      }
      else
      {
        v12 = ospf_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = *(unsigned __int8 *)(a1 + 1);
          v30 = 67109632;
          v31 = v13;
          v32 = 1024;
          v33 = v11;
          v34 = 1024;
          v35 = a3;
          _os_log_impl(&dword_20DC1A000, v12, OS_LOG_TYPE_DEFAULT, "Msg: %d: body offset %d > %d.", (uint8_t *)&v30, 0x14u);
        }
        return 3;
      }
    }
    else
    {
      v14 = ospf_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(unsigned __int8 *)(a1 + 1);
        v16 = *a2;
        v30 = 67109376;
        v31 = v15;
        v32 = 1024;
        v33 = v16;
        _os_log_impl(&dword_20DC1A000, v14, OS_LOG_TYPE_DEFAULT, "Msg: %d: expecting options info, got %d.", (uint8_t *)&v30, 0xEu);
      }
      return 2;
    }
  }
  else
  {
    v6 = ospf_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(unsigned __int8 *)(a1 + 1);
      v30 = 67109120;
      v31 = v7;
      _os_log_impl(&dword_20DC1A000, v6, OS_LOG_TYPE_DEFAULT, "Msg: %d: missing options info.", (uint8_t *)&v30, 8u);
    }
    return 1;
  }
  return result;
}

uint64_t OSPFParse(_QWORD *a1, _QWORD *a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5, unsigned __int8 **a6, int *a7)
{
  uint64_t v10;
  uint64_t v14;
  int v15;
  int v16;
  unsigned int v17;
  uint64_t v18;
  char *v19;
  char v20;
  int v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  unsigned int v25;
  unsigned int *v26;
  uint64_t v27;
  int v28;
  unsigned int v29;
  int v30;
  NSObject *v31;
  Bytef *v32;
  unsigned __int8 *v33;
  unsigned int *v34;
  int v35;
  _BOOL4 v36;
  int v37;
  const char *v38;
  BOOL v39;
  const char *v40;
  unsigned int v41;
  uint64_t v42;
  unsigned __int8 *v43;
  void *v44;
  void (*v45)(uint64_t, _QWORD *, uint64_t);
  uint64_t v46;
  unsigned __int8 *v47;
  unsigned __int8 *v48;
  _DWORD *v49;
  int v50;
  int v51;
  NSObject *v52;
  int v53;
  int v54;
  const char *v55;
  const char *v56;
  unsigned __int8 *v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  _QWORD *v62;
  int v63;
  unsigned __int8 *v64;
  unsigned int v65;
  NSObject *v66;
  char *v67;
  char *v68;
  os_log_t v69;
  uint64_t v70;
  char *v71;
  char *v72;
  size_t v73;
  uint64_t v74;
  char *v75;
  char *v76;
  unsigned int v77;
  uint64_t v78;
  _DWORD *v79;
  _DWORD *v80;
  unsigned __int8 *v81;
  unsigned int v82;
  NSObject *v83;
  char *v84;
  char *v85;
  os_log_t v86;
  uint64_t v87;
  char *v88;
  char *v89;
  size_t v90;
  uint64_t v91;
  char *v92;
  char *v93;
  unsigned int v94;
  uint64_t v95;
  _DWORD *v96;
  _DWORD *v97;
  unsigned __int8 *v98;
  NSObject *v99;
  int v100;
  unsigned __int8 *v101;
  NSObject *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  NSObject *v110;
  NSObject *v112;
  uint64_t v113;
  int v114;
  unsigned __int8 *v115;
  _DWORD *v116;
  NSObject *log;
  unsigned int loga;
  os_log_t logb;
  os_log_t logc;
  uint64_t v121;
  uLongf v122;
  unsigned int v123;
  _DWORD *v124;
  unsigned int v125;
  _DWORD *v126;
  uLongf v127;
  _QWORD *v128;
  Bytef *v129;
  Bytef *v130;
  int v131;
  unsigned int v132;
  uLongf destLen;
  uint64_t v134;
  uint8_t buf[4];
  _BYTE v136[10];
  int v137;
  __int16 v138;
  int v139;
  __int16 v140;
  int v141;
  uint64_t v142;

  v10 = a4;
  v142 = *MEMORY[0x24BDAC8D0];
  v134 = 0;
  if ((*a3 & 0xF0) != 0xC0 && a3[1] != 1)
  {
    v21 = -3001;
    goto LABEL_134;
  }
  v14 = *a3 & 0xF;
  if ((*a3 & 0xF) == 0)
  {
    v21 = -3002;
LABEL_134:
    v110 = ospf_log();
    if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v136 = v21;
      _os_log_impl(&dword_20DC1A000, v110, OS_LOG_TYPE_DEFAULT, "OSPFParse failed with error %d.", buf, 8u);
    }
    v10 = 0xFFFFFFFFLL;
    goto LABEL_137;
  }
  v15 = a3[1];
  if ((v15 - 1) > 9)
  {
    v21 = -3003;
    goto LABEL_134;
  }
  v16 = *((unsigned __int16 *)a3 + 3);
  *((_WORD *)a3 + 3) = 0;
  if ((int)a4 < 1)
  {
    v17 = 0;
  }
  else
  {
    LOWORD(v17) = 0;
    v18 = a4;
    v19 = (char *)a3;
    do
    {
      v20 = *v19++;
      v17 = CRC16Table[(v20 ^ v17)] ^ ((unsigned __int16)(v17 & 0xFF00) >> 8);
      --v18;
    }
    while (v18);
  }
  v22 = bswap32(v17) >> 16;
  *((_WORD *)a3 + 3) = v22;
  if (v22 != v16)
  {
    *((_WORD *)a3 + 3) = v16;
    v21 = -3004;
    goto LABEL_134;
  }
  v23 = bswap32(*((unsigned __int16 *)a3 + 1)) >> 16;
  *((_WORD *)a3 + 1) = v23;
  if (v23 != (_DWORD)a4)
  {
    v21 = -3005;
    goto LABEL_134;
  }
  v24 = 0;
  v25 = bswap32(*((unsigned __int16 *)a3 + 2)) >> 16;
  *((_WORD *)a3 + 2) = v25;
  *((_DWORD *)a3 + 2) = bswap32(*((_DWORD *)a3 + 2));
  v26 = (unsigned int *)(a3 + 12);
  if (v14 <= 1)
    v27 = 1;
  else
    v27 = v14;
  do
  {
    *(_DWORD *)&a3[v24 + 12] = bswap32(*(_DWORD *)&a3[v24 + 12]);
    v24 += 4;
  }
  while (4 * v27 != v24);
  v28 = a4 - 4 * v14;
  v29 = v28 - 12;
  if (v28 - 12 < 0)
  {
    v21 = -3006;
    goto LABEL_134;
  }
  v30 = v25 & 1;
  if (!a2 && v30)
  {
    v31 = ospf_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DC1A000, v31, OS_LOG_TYPE_DEFAULT, "Cannot pre-parse compressed packet.", buf, 2u);
    }
    *((_WORD *)a3 + 2) = bswap32(*((unsigned __int16 *)a3 + 2)) >> 16;
    *((_WORD *)a3 + 1) = bswap32(*((unsigned __int16 *)a3 + 1)) >> 16;
    *((_DWORD *)a3 + 2) = bswap32(*((_DWORD *)a3 + 2));
    v21 = -3007;
    do
    {
      *v26 = bswap32(*v26);
      ++v26;
      --v27;
    }
    while (v27);
    goto LABEL_134;
  }
  v32 = 0;
  v33 = (unsigned __int8 *)&v26[v14];
  if ((v15 & 0xFE) == 2 && v29 >= 3 && v30)
  {
    destLen = bswap32(*(unsigned __int16 *)v33) >> 16;
    v121 = (v28 - 12);
    v127 = destLen;
    v34 = &v26[v14];
    v32 = (Bytef *)malloc_type_malloc(destLen, 0x31A5B947uLL);
    if (v32)
    {
      v129 = v32;
      v114 = v121 - 2;
      v35 = uncompress(v32, &destLen, (const Bytef *)v34 + 2, v121 - 2);
      v122 = destLen;
      log = ospf_log();
      v36 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
      if (!v35 && v122 == v127)
      {
        if (v36)
        {
          v37 = a3[1];
          v38 = "OSPF";
          if (v37 == 3)
            v38 = "LSA";
          v39 = v37 == 2;
          *(_DWORD *)buf = 136315906;
          v40 = "DD";
          if (!v39)
            v40 = v38;
          *(_QWORD *)v136 = v40;
          *(_WORD *)&v136[8] = 1024;
          v137 = v114;
          v138 = 1024;
          v139 = destLen;
          v140 = 1024;
          v141 = v127;
          _os_log_impl(&dword_20DC1A000, log, OS_LOG_TYPE_DEFAULT, "%s uncompressed body %u+2 => %u (stated %u).", buf, 0x1Eu);
        }
        v29 = destLen;
        v15 = a3[1];
        v32 = v129;
        v33 = v129;
        goto LABEL_43;
      }
      if (v36)
      {
        v54 = a3[1];
        v55 = "OSPF";
        if (v54 == 3)
          v55 = "LSA";
        v39 = v54 == 2;
        *(_DWORD *)buf = 136315906;
        v56 = "DD";
        if (!v39)
          v56 = v55;
        *(_QWORD *)v136 = v56;
        *(_WORD *)&v136[8] = 1024;
        v137 = destLen;
        v138 = 1024;
        v139 = v127;
        v140 = 1024;
        v141 = v35;
        _os_log_impl(&dword_20DC1A000, log, OS_LOG_TYPE_DEFAULT, "%s uncompressed body (real %u =? %u) failed (%d).", buf, 0x1Eu);
      }
      v21 = -3008;
      v32 = v129;
    }
    else
    {
      v21 = -6728;
    }
    v44 = 0;
    if (!v32)
      goto LABEL_131;
    goto LABEL_130;
  }
LABEL_43:
  if (v15 == 1)
  {
    v41 = *(unsigned __int16 *)v33;
    v33 += 2;
    loga = bswap32(v41) >> 16;
    v29 -= 2;
  }
  else
  {
    LOWORD(loga) = 0;
  }
  v130 = v32;
  if ((*((_WORD *)a3 + 2) & 2) != 0)
  {
    destLen = 0;
    v132 = 0;
    v115 = v33;
    v50 = ospfVerifyOptions((uint64_t)a3, v33, v29, (int *)&v134 + 1, &v134);
    if (v50)
    {
      v51 = v50;
      v52 = ospf_log();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        v53 = a3[1];
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v136 = v53;
        *(_WORD *)&v136[4] = 1024;
        *(_DWORD *)&v136[6] = v51;
        _os_log_impl(&dword_20DC1A000, v52, OS_LOG_TYPE_DEFAULT, "Msg: %d: options verification failed (%d).", buf, 0xEu);
      }
      v44 = 0;
      v21 = -3009;
      goto LABEL_128;
    }
    v57 = v115;
    destLen = (uLongf)(v115 + 4);
    v132 = v29 - 4;
    v42 = HIDWORD(v134);
    if (HIDWORD(v134))
    {
      v123 = v29;
      v58 = HIDWORD(v134);
      v128 = malloc_type_malloc(8 * SHIDWORD(v134), 0x2004093837F09uLL);
      if (!v128)
      {
        v102 = ospf_log();
        if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
          OSPFParse_cold_1(v102, v103, v104, v105, v106, v107, v108, v109);
        v44 = 0;
        v21 = -6728;
        goto LABEL_128;
      }
      v131 = 0;
      v42 = v58;
      if ((int)v58 >= 1)
      {
        v59 = 0;
        v113 = v42;
        while (1)
        {
          v128[v59] = destLen;
          if (!ospfParseOption((uint64_t)a3, (uint64_t)&destLen, (int *)&v132, &v131))
            break;
          if (v131)
            goto LABEL_143;
          ++v59;
          v42 = v113;
          if (v113 == v59)
            goto LABEL_81;
        }
        v112 = ospf_log();
        if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v136 = v59;
          *(_WORD *)&v136[4] = 1024;
          *(_DWORD *)&v136[6] = v113;
          _os_log_impl(&dword_20DC1A000, v112, OS_LOG_TYPE_DEFAULT, "Expecting option %d of %d.", buf, 0xEu);
        }
LABEL_143:
        v21 = -3009;
        v44 = v128;
        v32 = v130;
        if (!v130)
          goto LABEL_131;
LABEL_130:
        free(v32);
        goto LABEL_131;
      }
LABEL_81:
      v57 = v115;
      v29 = v123;
    }
    else
    {
      v128 = 0;
    }
    v33 = &v57[(int)v134];
    v29 -= v134;
    v32 = v130;
    if (!a6)
      goto LABEL_52;
    goto LABEL_48;
  }
  v42 = 0;
  v128 = 0;
  if (!a6)
    goto LABEL_52;
LABEL_48:
  if ((*((_WORD *)a3 + 2) & 1) != 0)
    v43 = 0;
  else
    v43 = v33;
  *a6 = v43;
LABEL_52:
  v44 = v128;
  if (a5)
  {
    v45 = *(void (**)(uint64_t, _QWORD *, uint64_t))(a5 + 16);
    v46 = a5;
    v47 = v33;
    v45(v46, v128, v42);
    v33 = v47;
    v32 = v130;
  }
  if (a2)
  {
    switch(a3[1])
    {
      case 1u:
        v60 = malloc_type_calloc(1uLL, 0x20uLL, 0x1032040E8FB2772uLL);
        v49 = v60;
        *v60 = 0;
        *((_DWORD *)v60 + 2) = 0;
        *((_WORD *)v60 + 6) = loga;
        v61 = HIDWORD(v134);
        if (SHIDWORD(v134) >= 1)
        {
          v62 = v128;
          do
          {
            if (*(_BYTE *)*v62 == 11)
              v60[2] = bswap64(*(_QWORD *)(*v62 + 4));
            ++v62;
            --v61;
          }
          while (v61);
        }
        v63 = *a3 >> 4;
        if (v63 != 12)
        {
          fprintf((FILE *)*MEMORY[0x24BDAC8D8], "OSPF version mismatch: expected %d, got %d\n", 12, v63);
          v10 = 0;
        }
        goto LABEL_117;
      case 2u:
        v64 = v33;
        v65 = *(unsigned __int16 *)v33;
        v66 = __rev16(v65);
        v67 = (char *)malloc_type_malloc((416 * v66) | 0x18, 0x945627E2uLL);
        v49 = v67;
        *(_QWORD *)v67 = 0;
        *((_DWORD *)v67 + 2) = 0;
        *((_DWORD *)v67 + 3) = (_DWORD)v66;
        logb = v66;
        v68 = v67 + 24;
        *((_QWORD *)v67 + 2) = v67 + 24;
        if (!v65)
          goto LABEL_117;
        v69 = 0;
        v70 = (uint64_t)(v64 + 2);
        v116 = v67;
        v71 = v67 + 316;
        while (1)
        {
          v124 = v71;
          v72 = &v68[416 * (_QWORD)v69];
          *(_DWORD *)v72 = bswap32(*(_DWORD *)v70);
          *((_DWORD *)v72 + 1) = -1;
          *((_DWORD *)v72 + 67) = -1;
          *((_WORD *)v72 + 136) = bswap32(*(unsigned __int16 *)(v70 + 4)) >> 16;
          *((_DWORD *)v72 + 69) = 1;
          *((_DWORD *)v72 + 70) = *((_DWORD *)a3 + 2);
          v73 = *(unsigned __int8 *)(v70 + 6);
          v72[8] = v73;
          v74 = v70 + 7;
          v75 = v72 + 9;
          v76 = v68;
          memcpy(v72 + 9, (const void *)(v70 + 7), v73);
          v75[v73] = 0;
          v77 = *(unsigned __int16 *)(v74 + v73);
          v78 = __rev16(v77);
          if (v78 > 0x10)
            goto LABEL_140;
          v70 = v74 + v73 + 2;
          *(_DWORD *)&v76[416 * (_QWORD)v69 + 284] = v78;
          v68 = v76;
          if (v77)
          {
            v79 = v124;
            v80 = v124;
            do
            {
              *(v80 - 1) = bswap32(*(_DWORD *)v70);
              *v80 = bswap32(*(_DWORD *)(v70 + 4));
              v80 += 2;
              v70 += 8;
              --v78;
            }
            while (v78);
          }
          else
          {
            v79 = v124;
          }
          v69 = (os_log_t)((char *)v69 + 1);
          v71 = (char *)(v79 + 104);
          if (v69 == logb)
            goto LABEL_111;
        }
      case 3u:
        v81 = v33;
        v125 = bswap32(*(unsigned __int16 *)v33) >> 16;
        v82 = *((unsigned __int16 *)v33 + 1);
        v83 = __rev16(v82);
        v84 = (char *)malloc_type_malloc(416 * v83 + 32, 0xAC0E56CAuLL);
        v49 = v84;
        *(_QWORD *)v84 = 0;
        *((_DWORD *)v84 + 2) = 0;
        *((_WORD *)v84 + 6) = v125;
        logc = v83;
        *((_DWORD *)v84 + 4) = (_DWORD)v83;
        v85 = v84 + 32;
        *((_QWORD *)v84 + 3) = v84 + 32;
        if (!v82)
          goto LABEL_117;
        v86 = 0;
        v87 = (uint64_t)(v81 + 4);
        v116 = v84;
        v88 = v84 + 324;
        break;
      case 4u:
        v98 = v33;
        v49 = malloc_type_malloc(0x20uLL, 0x1032040E8FB2772uLL);
        *(_QWORD *)v49 = 0;
        v49[2] = 0;
        *((_WORD *)v49 + 6) = bswap32(*(unsigned __int16 *)v98) >> 16;
        goto LABEL_117;
      case 5u:
      case 0xAu:
        v48 = v33;
        v49 = malloc_type_malloc(0x20uLL, 0x1032040E8FB2772uLL);
        *(_QWORD *)v49 = v48;
        v49[2] = v29;
        goto LABEL_117;
      case 8u:
        v101 = v33;
        v49 = malloc_type_calloc(1uLL, 0x20uLL, 0x1032040E8FB2772uLL);
        *(_QWORD *)v49 = 0;
        v49[2] = 0;
        *((_WORD *)v49 + 6) = bswap32(*(unsigned __int16 *)v101) >> 16;
        *((_WORD *)v49 + 7) = bswap32(*((unsigned __int16 *)v101 + 1)) >> 16;
LABEL_117:
        v32 = v130;
        goto LABEL_118;
      default:
        v99 = ospf_log();
        if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
        {
          v100 = a3[1];
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v136 = v100;
          _os_log_impl(&dword_20DC1A000, v99, OS_LOG_TYPE_DEFAULT, "Unknown OSPF type %d.", buf, 8u);
        }
        v21 = -3003;
        goto LABEL_128;
    }
    while (1)
    {
      v126 = v88;
      v89 = &v85[416 * (_QWORD)v86];
      *(_DWORD *)v89 = bswap32(*(_DWORD *)v87);
      *((_DWORD *)v89 + 1) = -1;
      *((_DWORD *)v89 + 67) = -1;
      *((_WORD *)v89 + 136) = bswap32(*(unsigned __int16 *)(v87 + 4)) >> 16;
      *((_DWORD *)v89 + 69) = 1;
      *((_DWORD *)v89 + 70) = *((_DWORD *)a3 + 2);
      v90 = *(unsigned __int8 *)(v87 + 6);
      v89[8] = v90;
      v91 = v87 + 7;
      v92 = v89 + 9;
      v93 = v85;
      memcpy(v89 + 9, (const void *)(v87 + 7), v90);
      v92[v90] = 0;
      v94 = *(unsigned __int16 *)(v91 + v90);
      v95 = __rev16(v94);
      if (v95 > 0x10)
        break;
      v87 = v91 + v90 + 2;
      *(_DWORD *)&v93[416 * (_QWORD)v86 + 284] = v95;
      v85 = v93;
      if (v94)
      {
        v96 = v126;
        v97 = v126;
        do
        {
          *(v97 - 1) = bswap32(*(_DWORD *)v87);
          *v97 = bswap32(*(_DWORD *)(v87 + 4));
          v97 += 2;
          v87 += 8;
          --v95;
        }
        while (v95);
      }
      else
      {
        v96 = v126;
      }
      v86 = (os_log_t)((char *)v86 + 1);
      v88 = (char *)(v96 + 104);
      if (v86 == logc)
      {
LABEL_111:
        v44 = v128;
        v32 = v130;
        v49 = v116;
        goto LABEL_118;
      }
    }
LABEL_140:
    v21 = -3010;
    v44 = v128;
    v49 = v116;
LABEL_124:
    free(v49);
LABEL_128:
    v32 = v130;
LABEL_129:
    if (!v32)
      goto LABEL_131;
    goto LABEL_130;
  }
  *((_WORD *)a3 + 2) = bswap32(*((unsigned __int16 *)a3 + 2)) >> 16;
  *((_WORD *)a3 + 1) = bswap32(*((unsigned __int16 *)a3 + 1)) >> 16;
  *((_DWORD *)a3 + 2) = bswap32(*((_DWORD *)a3 + 2));
  do
  {
    *v26 = bswap32(*v26);
    ++v26;
    --v27;
  }
  while (v27);
  v49 = 0;
LABEL_118:
  if (a1)
    *a1 = a3;
  v21 = 0;
  if (!a2)
  {
    if (!v49)
      goto LABEL_129;
    goto LABEL_124;
  }
  *a2 = v49;
  if (v32)
    goto LABEL_130;
LABEL_131:
  if (v44)
    free(v44);
  if (v21)
    goto LABEL_134;
LABEL_137:
  if (a7)
    *a7 = v21;
  return v10;
}

uint64_t OSPFAddDynamicOptions(uint64_t a1, int a2, uint64_t a3)
{
  __int128 v4;
  _QWORD *v5;
  uint64_t v6;
  __int128 v7;
  _QWORD v8[2];
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = 0u;
  v7 = 0u;
  v9 = 0u;
  v10 = 0u;
  v8[0] = a1;
  v8[1] = a2;
  v6 = 1;
  v5 = v8;
  if (a3)
    (*(void (**)(uint64_t, __int128 *))(a3 + 16))(a3, &v4);
  return 0;
}

char *makebase36string(unint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  char __s1[14];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  __s1[13] = 0;
  v1 = 12;
  do
  {
    __s1[v1] = MCPeerIDBase36Digits[a1 % 0x24];
    v2 = v1-- + 1;
    a1 /= 0x24uLL;
  }
  while (v2 > 1);
  return strdup(__s1);
}

void MCMetricsLog_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20DC1A000, a2, OS_LOG_TYPE_ERROR, "Invalid name %@", (uint8_t *)&v2, 0xCu);
}

void MCMetricsLog_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20DC1A000, log, OS_LOG_TYPE_ERROR, "Payload is nil", v1, 2u);
}

void AGPEventListenerForMCSession_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_4(&dword_20DC1A000, v0, v1, "Malloc failed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void TracePrintNodes_cold_1(int *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_20DC1A000, a2, OS_LOG_TYPE_DEBUG, "TracePrintNodes throttled (last second count %d)\n", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_2();
}

void GCKSessionCreate_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20DC1A000, a1, a3, "Calloc (%d bytes) failed.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void GCKSessionCreate_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_20DC1A000, v0, v1, "Failed to create global with error (%X).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void GCKSessionCreate_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_20DC1A000, v0, v1, "Failed to create SendProc thread with error (%X).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void GCKSessionCreate_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_20DC1A000, v0, v1, "Failed to create RecvProc thread with error (%X).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void gckSessionRecvProc_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_4_1(&dword_20DC1A000, a1, a3, "Failed to create timer.", v3);
  OUTLINED_FUNCTION_2();
}

void gckSessionRecvProc_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_20DC1A000, v0, v1, "Failed to create socket with error (%X).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void gckSessionRecvProc_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_20DC1A000, v0, v1, "Select call failed with error (%X).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void GCKSessionPrepareConnection_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_4_1(&dword_20DC1A000, a1, a3, "No network interface found.", v3);
  OUTLINED_FUNCTION_2();
}

void GCKSessionPrepareConnection_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_20DC1A000, a2, a3, "ICEGetCandidates failed with hResult [%ld].", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void GCKSessionPrepareConnection_cold_3(uint8_t *a1, _DWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a2 = 840;
  OUTLINED_FUNCTION_1(&dword_20DC1A000, a3, (uint64_t)a3, "Calloc (%d bytes) failed.", a1);
}

void GCKSessionPrepareConnection_cold_4(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_4_1(&dword_20DC1A000, a3, (uint64_t)a3, "Getaddrinfo returned NULL.", a1);
}

void GCKSessionPrepareConnection_cold_5(uint8_t *a1, _DWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a2 = -2145779708;
  OUTLINED_FUNCTION_1(&dword_20DC1A000, a3, (uint64_t)a3, "Failed to initialize mutex attr with error (%X).", a1);
}

void GCKSessionEstablishConnection_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_4_1(&dword_20DC1A000, a1, a3, "Cannot add any more nodes.", v3);
  OUTLINED_FUNCTION_2();
}

void GCKSessionEstablishConnection_cold_2()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_6_1();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0xEu);
  OUTLINED_FUNCTION_6();
}

void GCKSessionDisposeConnection_cold_1()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_6_1();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x12u);
  OUTLINED_FUNCTION_6();
}

void GCKSessionStartEventCallbacks_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_20DC1A000, v0, v1, "Failed to start event callback thread with error (%X).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __gckSessionSetupChannelWithDTLS_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20DC1A000, a1, a3, "WaitForHello failed with error (%X).", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __gckSessionSetupChannelWithDTLS_block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_20DC1A000, v0, v1, "Couldn't find pCList for participant %08X.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __gckSessionSetupChannelWithDTLS_block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_20DC1A000, v0, v1, "SendHello failed with error (%X).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void gckSessionSendHello_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_20DC1A000, v0, v1, "OSPFMakeHello failed for participant %08X.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void SendUDPPacketToParticipantChannelID_cold_1(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *(_DWORD *)(a1 + 72);
  v4[0] = 67109376;
  v4[1] = a2;
  v5 = 1024;
  v6 = v3;
  _os_log_debug_impl(&dword_20DC1A000, log, OS_LOG_TYPE_DEBUG, "Channel ID %d resolved to %d.", (uint8_t *)v4, 0xEu);
  OUTLINED_FUNCTION_6();
}

void DTLS_SocketWrite_cold_1(unsigned __int16 a1, NSObject *a2)
{
  int v3;
  int *v4;
  char *v5;
  int v6;
  _DWORD v7[2];
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = __error();
  v5 = strerror(*v4);
  v6 = *__error();
  v7[0] = 67109634;
  v7[1] = v3;
  v8 = 2080;
  v9 = v5;
  v10 = 1024;
  v11 = v6;
  _os_log_error_impl(&dword_20DC1A000, a2, OS_LOG_TYPE_ERROR, "Failed to send a DTLS packet with %d bytes; sendmsg error: %s (%d).",
    (uint8_t *)v7,
    0x18u);
}

void gckSessionPerformDTLSHandshake_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_20DC1A000, a2, a3, "SSLHandshake returned with error [%ld].", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void gckSessionPerformDTLSHandshake_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20DC1A000, a2, a3, "Trust for participant [%08X] is expected but SSLCopyPeerTrust returned NULL.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void gckSessionPerformDTLSHandshake_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20DC1A000, a2, a3, "Failed to copy peer trust for participant [%08X].", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void gckSessionRecvMessage_cold_1()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_6_1();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x16u);
  OUTLINED_FUNCTION_6();
}

void gckSessionProcessHello_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_20DC1A000, v0, v1, "Failed to send Hello with error %X.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void gckSessionProcessDD_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_20DC1A000, v0, v1, "Failed to create dashboard data with error=%d.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void gckSessionSendDD_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_20DC1A000, v0, v1, "OSPFMakeDD for participant [%08X].", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void gckSessionSendLSAACK_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_20DC1A000, v0, v1, "OSPFMakeLSAACK for participant [%08X] failed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void gckSessionGetInterfacePriorityForCList_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_8_1();
  _os_log_error_impl(&dword_20DC1A000, v0, OS_LOG_TYPE_ERROR, "SCNetworkInterfaceCopyAll() failed!: participant [%08X] channelID [%d].", v1, 0xEu);
  OUTLINED_FUNCTION_6();
}

void AGPTransportCallback(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_20DC1A000, a2, OS_LOG_TYPE_ERROR, "Couldn't check in handle iDstIDs (%d).", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_2();
}

void AGPTransportCallback(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_1_1(a1, a2);
  OUTLINED_FUNCTION_4_1(&dword_20DC1A000, v2, (uint64_t)v2, "Error (bad): failed to buffer a reliable packet.", v3);
}

void AGPSessionSendTo_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_4_1(&dword_20DC1A000, a1, a3, "Unable to check-in a session handle.", v3);
  OUTLINED_FUNCTION_2();
}

void AGPSessionSendTo_cold_2(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_1_1(a1, a2);
  OUTLINED_FUNCTION_4_1(&dword_20DC1A000, v2, (uint64_t)v2, "Maximum segment size < 0.", v3);
}

void AGPSessionSendTo_cold_3(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_1_1(a1, a2);
  OUTLINED_FUNCTION_4_1(&dword_20DC1A000, v2, (uint64_t)v2, "Invalid mode!", v3);
}

void AGPSessionRecvFrom(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_4_1(&dword_20DC1A000, a1, a3, "No packet buffer at base - this shouldn't happen!", v3);
  OUTLINED_FUNCTION_2();
}

void AGPSessionRecvFrom(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_1_1(a1, a2);
  OUTLINED_FUNCTION_4_1(&dword_20DC1A000, v2, (uint64_t)v2, "Can't resend (bad timestamp)!", v3);
}

void OSPFMakeLSA_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_20DC1A000, a1, a3, "Calloc failed.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void OSPFMakeLSAACK_cold_1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_20DC1A000, a2, OS_LOG_TYPE_ERROR, "Calloc failed for participant [%08X].", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_2();
}

void OSPFParse_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_20DC1A000, a1, a3, "Malloc failed.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x24BE1A1B0]();
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC300](data, *(_QWORD *)&len, md);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x24BDBBC88](theData, bytes, length);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB0](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

uint64_t CFDictionaryGetInt64()
{
  return MEMORY[0x24BE28F88]();
}

uint64_t CFPropertyListCreateFormatted()
{
  return MEMORY[0x24BE290C0]();
}

void CFReadStreamSetDispatchQueue(CFReadStreamRef stream, dispatch_queue_t q)
{
  MEMORY[0x24BDBC278](stream, q);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x24BDBC3C0](theSet, value);
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
  MEMORY[0x24BDBC3C8](theSet, applier, context);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x24BDBC3E8](allocator, capacity, callBacks);
}

Boolean CFSetGetValueIfPresent(CFSetRef theSet, const void *candidate, const void **value)
{
  return MEMORY[0x24BDBC410](theSet, candidate, value);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x24BDBC428](theSet, value);
}

uint64_t CFStringAppendF()
{
  return MEMORY[0x24BE290D8]();
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8D0](alloc);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1;
  uint64_t v2;
  CFUUIDBytes result;

  v1 = MEMORY[0x24BDBC908](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

void CFWriteStreamSetDispatchQueue(CFWriteStreamRef stream, dispatch_queue_t q)
{
  MEMORY[0x24BDBC9C0](stream, q);
}

uint64_t CheckInHandleDebug()
{
  return MEMORY[0x24BDFDB88]();
}

uint64_t CheckOutHandleDebug()
{
  return MEMORY[0x24BDFDB90]();
}

uint64_t CreateHandle()
{
  return MEMORY[0x24BDFDB98]();
}

uint64_t FreeLocalInterfaceList()
{
  return MEMORY[0x24BDFDAC0]();
}

uint64_t GetLocalInterfaceListWithOptions()
{
  return MEMORY[0x24BDFDAD0]();
}

uint64_t ICEAddOneInterface()
{
  return MEMORY[0x24BDFDAD8]();
}

uint64_t ICECloseHandle()
{
  return MEMORY[0x24BDFDAE0]();
}

uint64_t ICECreateHandleWithCallback()
{
  return MEMORY[0x24BDFDAF0]();
}

uint64_t ICEDisableCandidatePairFilter()
{
  return MEMORY[0x24BDFDAF8]();
}

uint64_t ICEGetCallInfoForConnectionData()
{
  return MEMORY[0x24BDFDB08]();
}

uint64_t ICEGetCandidates()
{
  return MEMORY[0x24BDFDB10]();
}

uint64_t ICEStartConnectivityCheck()
{
  return MEMORY[0x24BDFDB28]();
}

uint64_t ICEStopConnectivityCheck()
{
  return MEMORY[0x24BDFDB38]();
}

uint64_t ICEUpdateRole()
{
  return MEMORY[0x24BDFDB48]();
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

kern_return_t IOMasterPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x24BDD8688](*(_QWORD *)&bootstrapPort, mainPort);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x24BDD86B8](*(_QWORD *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x24BDD88F0](*(_QWORD *)&entry, plane, parent);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD8918](entryID);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x24BDD8990](*(_QWORD *)&mainPort, matching, existing);
}

uint64_t IPPORTToSA()
{
  return MEMORY[0x24BDFDB50]();
}

uint64_t IPPORTToSA6()
{
  return MEMORY[0x24BDFDB58]();
}

uint64_t IPPORTToString()
{
  return MEMORY[0x24BDFDB60]();
}

uint64_t IPToString()
{
  return MEMORY[0x24BDFDB70]();
}

uint64_t NSAppendPrintF()
{
  return MEMORY[0x24BE29648]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

uint64_t SAToIPPORT()
{
  return MEMORY[0x24BDFDB80]();
}

CFArrayRef SCNetworkInterfaceCopyAll(void)
{
  return (CFArrayRef)MEMORY[0x24BDF5708]();
}

CFStringRef SCNetworkInterfaceGetBSDName(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x24BDF5718](interface);
}

CFStringRef SCNetworkInterfaceGetInterfaceType(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x24BDF5730](interface);
}

OSStatus SSLClose(SSLContextRef context)
{
  return MEMORY[0x24BDE8658](context);
}

OSStatus SSLCopyPeerTrust(SSLContextRef context, SecTrustRef *trust)
{
  return MEMORY[0x24BDE8660](context, trust);
}

SSLContextRef SSLCreateContext(CFAllocatorRef alloc, SSLProtocolSide protocolSide, SSLConnectionType connectionType)
{
  return (SSLContextRef)MEMORY[0x24BDE8668](alloc, *(_QWORD *)&protocolSide, *(_QWORD *)&connectionType);
}

OSStatus SSLHandshake(SSLContextRef context)
{
  return MEMORY[0x24BDE86A8](context);
}

OSStatus SSLRead(SSLContextRef context, void *data, size_t dataLength, size_t *processed)
{
  return MEMORY[0x24BDE86E0](context, data, dataLength, processed);
}

OSStatus SSLSetCertificate(SSLContextRef context, CFArrayRef certRefs)
{
  return MEMORY[0x24BDE86E8](context, certRefs);
}

OSStatus SSLSetClientSideAuthenticate(SSLContextRef context, SSLAuthenticate auth)
{
  return MEMORY[0x24BDE86F0](context, *(_QWORD *)&auth);
}

OSStatus SSLSetConnection(SSLContextRef context, SSLConnectionRef connection)
{
  return MEMORY[0x24BDE86F8](context, connection);
}

OSStatus SSLSetEnabledCiphers(SSLContextRef context, const SSLCipherSuite *ciphers, size_t numCiphers)
{
  return MEMORY[0x24BDE8700](context, ciphers, numCiphers);
}

OSStatus SSLSetIOFuncs(SSLContextRef context, SSLReadFunc readFunc, SSLWriteFunc writeFunc)
{
  return MEMORY[0x24BDE8708](context, readFunc, writeFunc);
}

OSStatus SSLSetMaxDatagramRecordSize(SSLContextRef dtlsContext, size_t maxSize)
{
  return MEMORY[0x24BDE8710](dtlsContext, maxSize);
}

OSStatus SSLSetSessionConfig(SSLContextRef context, CFStringRef config)
{
  return MEMORY[0x24BDE8740](context, config);
}

OSStatus SSLSetSessionOption(SSLContextRef context, SSLSessionOption option, Boolean value)
{
  return MEMORY[0x24BDE8748](context, *(_QWORD *)&option, value);
}

OSStatus SSLWrite(SSLContextRef context, const void *data, size_t dataLength, size_t *processed)
{
  return MEMORY[0x24BDE8750](context, data, dataLength, processed);
}

SecCertificateRef SecTrustGetCertificateAtIndex(SecTrustRef trust, CFIndex ix)
{
  return (SecCertificateRef)MEMORY[0x24BDE8DF8](trust, ix);
}

CFIndex SecTrustGetCertificateCount(SecTrustRef trust)
{
  return MEMORY[0x24BDE8E00](trust);
}

uint64_t SockAddrCompareAddr()
{
  return MEMORY[0x24BE29990]();
}

uint64_t SocketGetInterfaceInfo()
{
  return MEMORY[0x24BE299D8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _CFReadStreamCreateFromFileDescriptor()
{
  return MEMORY[0x24BDBD098]();
}

uint64_t _CFWriteStreamCreateFromFileDescriptor()
{
  return MEMORY[0x24BDBD128]();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x24BDD19C0](commaSeparatedKeysString, firstValue);
}

uint64_t _SCNetworkInterfaceGetIORegistryEntryID()
{
  return MEMORY[0x24BDF58F8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete()
{
  return off_24C83FF08();
}

uint64_t operator new()
{
  return off_24C83FF10();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  return MEMORY[0x24BDAC7B8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x24BDAC8B8](a1, *(_QWORD *)&a2, a3, a4);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x24BDAD2C8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int compress2(Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen, int level)
{
  return MEMORY[0x24BEDF1B0](dest, destLen, source, sourceLen, *(_QWORD *)&level);
}

uLong compressBound(uLong sourceLen)
{
  return MEMORY[0x24BEDF1B8](sourceLen);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x24BEDF1C0](crc, buf, *(_QWORD *)&len);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFA0](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

uint64_t dyld_get_program_sdk_version()
{
  return MEMORY[0x24BDAE0E0]();
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void freeaddrinfo(addrinfo *a1)
{
  MEMORY[0x24BDAE458](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return MEMORY[0x24BDAE5A0](a1, a2, a3, a4);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x24BDAE770](*(_QWORD *)&a1, a2, a3);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x24BDAE860](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x24BDAEBB0](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

int mkstemp(char *a1)
{
  return MEMORY[0x24BDAEF70](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x24BEDD0D8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3F0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x24BDAF420]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x24BDAF428]();
}

int pipe(int a1[2])
{
  return MEMORY[0x24BDAF5D0](a1);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x24BDAF778](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x24BDAF790](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x24BDAF7A0](a1, *(_QWORD *)&a2);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7C8](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7D0](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x24BDAF7D8](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7E0](a1);
}

int pthread_cond_timedwait_relative_np(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x24BDAF7F8](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x24BDAF800](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x24BDAF818](a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x24BDAF880](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8C0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x24BDAF8E8](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x24BDAF8F0](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x24BDAF908](a1, *(_QWORD *)&a2);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF930](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x24BDAF938](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF940](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF958](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF960](a1);
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x24BDAF998](a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

ssize_t recvmsg(int a1, msghdr *a2, int a3)
{
  return MEMORY[0x24BDAFAF0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return MEMORY[0x24BDAFC70](*(_QWORD *)&a1, a2, a3, a4, a5);
}

ssize_t sendmsg(int a1, const msghdr *a2, int a3)
{
  return MEMORY[0x24BDAFCF0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x24BDAFD78](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x24BDAFE50](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

char *__cdecl strpbrk(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x24BDAFF90](__s1, __s2);
}

size_t strspn(const char *__s, const char *__charset)
{
  return MEMORY[0x24BDAFFC0](__s, __charset);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x24BDAFFC8](__s1, __s2);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0040](__str, __endptr, *(_QWORD *)&__base);
}

int uncompress(Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen)
{
  return MEMORY[0x24BEDF298](dest, destLen, source, sourceLen);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x24BDB0448](__str, __size, __format, a4);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x24BDB0558](*(_QWORD *)&__fd, __buf, __nbyte);
}

