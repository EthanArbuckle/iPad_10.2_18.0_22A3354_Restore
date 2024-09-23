void sub_100004968(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t sub_10000561C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a2, a3));
  v5 = (void *)objc_opt_new(CRPreflightController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inputs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "signingKeyBlob"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sign:keyBlob:", v4, v7));

  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "base64EncodedStringWithOptions:", 0));
  return v9;
}

void sub_100005870(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100005880(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

uint64_t sub_100005898()
{
  const __CFDictionary *v0;
  io_service_t MatchingService;
  io_object_t v2;
  uint64_t v3;
  NSObject *v5;
  NSObject *v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;

  v0 = IOServiceMatching("ApplePearlSEPDriver");
  MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v0);
  if (MatchingService)
  {
    v2 = MatchingService;
    v3 = IOServiceOpen(MatchingService, mach_task_self_, 0, (io_connect_t *)&dword_1000149A8);
    if ((_DWORD)v3)
    {
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v3, (const char *)&unk_10000DEDF, "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 129);
      if (qword_1000149B0 != -1)
        dispatch_once(&qword_1000149B0, &stru_1000104B8);
      if (__osLogPearlLib)
        v6 = __osLogPearlLib;
      else
        v6 = &_os_log_default;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v8 = "err == 0 ";
        v9 = 2048;
        v10 = (int)v3;
        v11 = 2080;
        v12 = &unk_10000DEDF;
        v13 = 2080;
        v14 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        v15 = 1024;
        v16 = 129;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    IOObjectRelease(v2);
  }
  else
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "service", 0, (const char *)&unk_10000DEDF, "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 126);
    if (qword_1000149B0 != -1)
      dispatch_once(&qword_1000149B0, &stru_1000104B8);
    v3 = 3758097084;
    if (__osLogPearlLib)
      v5 = __osLogPearlLib;
    else
      v5 = &_os_log_default;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v8 = "service";
      v9 = 2048;
      v10 = 0;
      v11 = 2080;
      v12 = &unk_10000DEDF;
      v13 = 2080;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v15 = 1024;
      v16 = 126;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  return v3;
}

uint64_t sub_100005B54(mach_port_t a1, __int16 a2, __int16 a3, const void *a4, size_t a5, void *a6, _QWORD *a7)
{
  size_t v14;
  _WORD *v15;
  void *v16;
  uint64_t v17;
  NSObject *v19;
  _BYTE outputStructCnt[12];
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;

  v14 = a5 + 8;
  v15 = calloc(a5 + 8, 1uLL);
  if (v15)
  {
    v16 = v15;
    *v15 = 21072;
    v15[1] = a2;
    v15[2] = 1;
    v15[3] = a3;
    if (a5)
      memmove(v15 + 4, a4, a5);
    if (a7)
    {
      *(_QWORD *)outputStructCnt = *a7;
      v17 = IOConnectCallStructMethod(a1, 0, v16, v14, a6, (size_t *)outputStructCnt);
      *a7 = *(_QWORD *)outputStructCnt;
    }
    else
    {
      *(_QWORD *)outputStructCnt = 0;
      v17 = IOConnectCallStructMethod(a1, 0, v16, v14, a6, (size_t *)outputStructCnt);
    }
    free(v16);
  }
  else
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "cmd", 0, (const char *)&unk_10000DEDF, "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 99);
    if (qword_1000149B0 != -1)
      dispatch_once(&qword_1000149B0, &stru_1000104B8);
    if (__osLogPearlLib)
      v19 = __osLogPearlLib;
    else
      v19 = &_os_log_default;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)outputStructCnt = 136316162;
      *(_QWORD *)&outputStructCnt[4] = "cmd";
      v21 = 2048;
      v22 = 0;
      v23 = 2080;
      v24 = &unk_10000DEDF;
      v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v27 = 1024;
      v28 = 99;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", outputStructCnt, 0x30u);
    }
    return 260;
  }
  return v17;
}

uint64_t pearlSeaCookieHandleMessage(int a1, const void *a2, size_t a3, void *a4, _QWORD *a5, id a6)
{
  __objc2_meth_list *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  size_t v15;
  char *v16;
  _BYTE *v17;
  __objc2_meth_list *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  io_connect_t entrysize;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  id v41;
  uint8_t buf[4];
  _BYTE v43[44];

  v41 = a6;
  if (qword_1000149B0 != -1)
    dispatch_once(&qword_1000149B0, &stru_1000104B8);
  v11 = &OBJC_INSTANCE_METHODS_NSObject;
  if (__osLogPearlLibTrace)
    v12 = __osLogPearlLibTrace;
  else
    v12 = &_os_log_default;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110144;
    *(_DWORD *)v43 = a1;
    *(_WORD *)&v43[4] = 2048;
    *(_QWORD *)&v43[6] = a2;
    *(_WORD *)&v43[14] = 2048;
    *(_QWORD *)&v43[16] = a3;
    *(_WORD *)&v43[24] = 2048;
    *(_QWORD *)&v43[26] = a4;
    *(_WORD *)&v43[34] = 2048;
    *(_QWORD *)&v43[36] = a5;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "pearlSeaCookieHandleMessage %d %p %zu %p %p\n", buf, 0x30u);
  }
  if (a1 && a1 != 7)
  {
    if (!a2)
    {
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "(type == kPearlFactorySeaCookieMessageS0) || (type == kPearlFactorySeaCookieGenerateNonce) || message", 0, (const char *)&unk_10000DEDF, "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 776);
      if (qword_1000149B0 != -1)
        dispatch_once(&qword_1000149B0, &stru_1000104B8);
      v18 = &OBJC_INSTANCE_METHODS_NSObject;
      v20 = v41;
      if (__osLogPearlLib)
        v29 = __osLogPearlLib;
      else
        v29 = &_os_log_default;
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        goto LABEL_110;
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v43 = "(type == kPearlFactorySeaCookieMessageS0) || (type == kPearlFactorySeaCookieGenerateNonce) || message";
      *(_WORD *)&v43[8] = 2048;
      *(_QWORD *)&v43[10] = 0;
      *(_WORD *)&v43[18] = 2080;
      *(_QWORD *)&v43[20] = &unk_10000DEDF;
      *(_WORD *)&v43[28] = 2080;
      *(_QWORD *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v43[38] = 1024;
      *(_DWORD *)&v43[40] = 776;
      goto LABEL_109;
    }
    if (!a3)
    {
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "(type == kPearlFactorySeaCookieMessageS0) || (type == kPearlFactorySeaCookieGenerateNonce) || messageSize", 0, (const char *)&unk_10000DEDF, "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 777);
      if (qword_1000149B0 != -1)
        dispatch_once(&qword_1000149B0, &stru_1000104B8);
      if (__osLogPearlLib)
        v40 = __osLogPearlLib;
      else
        v40 = &_os_log_default;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v43 = "(type == kPearlFactorySeaCookieMessageS0) || (type == kPearlFactorySeaCookieGenerateNonce) || messageSize";
        *(_WORD *)&v43[8] = 2048;
        *(_QWORD *)&v43[10] = 0;
        *(_WORD *)&v43[18] = 2080;
        *(_QWORD *)&v43[20] = &unk_10000DEDF;
        *(_WORD *)&v43[28] = 2080;
        *(_QWORD *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        *(_WORD *)&v43[38] = 1024;
        *(_DWORD *)&v43[40] = 777;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v17 = 0;
      v26 = 258;
      goto LABEL_71;
    }
  }
  if (a1 != 8 && !a4)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "(type == kPearlFactorySeaCookieValidateTatsuTicket) || reply", 0, (const char *)&unk_10000DEDF, "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 778);
    if (qword_1000149B0 != -1)
      dispatch_once(&qword_1000149B0, &stru_1000104B8);
    v18 = &OBJC_INSTANCE_METHODS_NSObject;
    v20 = v41;
    if (__osLogPearlLib)
      v29 = __osLogPearlLib;
    else
      v29 = &_os_log_default;
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      goto LABEL_110;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v43 = "(type == kPearlFactorySeaCookieValidateTatsuTicket) || reply";
    *(_WORD *)&v43[8] = 2048;
    *(_QWORD *)&v43[10] = 0;
    *(_WORD *)&v43[18] = 2080;
    *(_QWORD *)&v43[20] = &unk_10000DEDF;
    *(_WORD *)&v43[28] = 2080;
    *(_QWORD *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v43[38] = 1024;
    *(_DWORD *)&v43[40] = 778;
    goto LABEL_109;
  }
  if (a1 != 8 && !a5)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "(type == kPearlFactorySeaCookieValidateTatsuTicket) || replySize", 0, (const char *)&unk_10000DEDF, "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 779);
    if (qword_1000149B0 != -1)
      dispatch_once(&qword_1000149B0, &stru_1000104B8);
    v18 = &OBJC_INSTANCE_METHODS_NSObject;
    v20 = v41;
    if (__osLogPearlLib)
      v29 = __osLogPearlLib;
    else
      v29 = &_os_log_default;
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      goto LABEL_110;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v43 = "(type == kPearlFactorySeaCookieValidateTatsuTicket) || replySize";
    *(_WORD *)&v43[8] = 2048;
    *(_QWORD *)&v43[10] = 0;
    *(_WORD *)&v43[18] = 2080;
    *(_QWORD *)&v43[20] = &unk_10000DEDF;
    *(_WORD *)&v43[28] = 2080;
    *(_QWORD *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v43[38] = 1024;
    *(_DWORD *)&v43[40] = 779;
LABEL_109:
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_110:
    v17 = 0;
    v26 = 258;
    goto LABEL_129;
  }
  if (a5)
    v13 = *a5;
  else
    v13 = 0;
  v14 = sub_100005898();
  if ((_DWORD)v14)
  {
    v26 = v14;
    v30 = (int)v14;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v14, (const char *)&unk_10000DEDF, "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 786);
    if (qword_1000149B0 != -1)
      dispatch_once(&qword_1000149B0, &stru_1000104B8);
    if (__osLogPearlLib)
      v31 = __osLogPearlLib;
    else
      v31 = &_os_log_default;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v43 = "err == 0 ";
      *(_WORD *)&v43[8] = 2048;
      *(_QWORD *)&v43[10] = v30;
      *(_WORD *)&v43[18] = 2080;
      *(_QWORD *)&v43[20] = &unk_10000DEDF;
      *(_WORD *)&v43[28] = 2080;
      *(_QWORD *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v43[38] = 1024;
      *(_DWORD *)&v43[40] = 786;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v17 = 0;
LABEL_71:
    v18 = &OBJC_INSTANCE_METHODS_NSObject;
LABEL_119:
    v20 = v41;
    goto LABEL_129;
  }
  v15 = a3 + 13;
  if (a3 >= 0xFFFFFFFFFFFFFFF3)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", a3 >= 0xFFFFFFFFFFFFFFF3, (const char *)&unk_10000DEDF, "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 789);
    if (qword_1000149B0 != -1)
      dispatch_once(&qword_1000149B0, &stru_1000104B8);
    v18 = &OBJC_INSTANCE_METHODS_NSObject;
    v11 = &OBJC_INSTANCE_METHODS_NSObject;
    if (__osLogPearlLib)
      v32 = __osLogPearlLib;
    else
      v32 = &_os_log_default;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v43 = "err == 0 ";
      *(_WORD *)&v43[8] = 2048;
      *(_QWORD *)&v43[10] = a3 >= 0xFFFFFFFFFFFFFFF3;
      *(_WORD *)&v43[18] = 2080;
      *(_QWORD *)&v43[20] = &unk_10000DEDF;
      *(_WORD *)&v43[28] = 2080;
      *(_QWORD *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v43[38] = 1024;
      *(_DWORD *)&v43[40] = 789;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v17 = 0;
    v26 = 1;
    goto LABEL_119;
  }
  v16 = (char *)malloc(a3 + 13);
  if (!v16)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "inData", 0, (const char *)&unk_10000DEDF, "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 792);
    if (qword_1000149B0 != -1)
      dispatch_once(&qword_1000149B0, &stru_1000104B8);
    v18 = &OBJC_INSTANCE_METHODS_NSObject;
    v11 = &OBJC_INSTANCE_METHODS_NSObject;
    v26 = 3758097085;
    if (__osLogPearlLib)
      v33 = __osLogPearlLib;
    else
      v33 = &_os_log_default;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v43 = "inData";
      *(_WORD *)&v43[8] = 2048;
      *(_QWORD *)&v43[10] = 0;
      *(_WORD *)&v43[18] = 2080;
      *(_QWORD *)&v43[20] = &unk_10000DEDF;
      *(_WORD *)&v43[28] = 2080;
      *(_QWORD *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v43[38] = 1024;
      *(_DWORD *)&v43[40] = 792;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v17 = 0;
    goto LABEL_119;
  }
  v17 = v16;
  *(_DWORD *)v16 = a1;
  v16[4] = 1;
  *(_QWORD *)(v16 + 5) = a3;
  memcpy(v16 + 13, a2, a3);
  v18 = &OBJC_INSTANCE_METHODS_NSObject;
  v19 = sub_100005B54(dword_1000149A8, 70, 0, v17, a3 + 13, a4, a5);
  if ((_DWORD)v19)
  {
    v26 = v19;
    v34 = (int)v19;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v19, (const char *)&unk_10000DEDF, "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 800);
    if (qword_1000149B0 != -1)
      dispatch_once(&qword_1000149B0, &stru_1000104B8);
    if (__osLogPearlLib)
      v35 = __osLogPearlLib;
    else
      v35 = &_os_log_default;
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      goto LABEL_128;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v43 = "err == 0 ";
    *(_WORD *)&v43[8] = 2048;
    *(_QWORD *)&v43[10] = v34;
    *(_WORD *)&v43[18] = 2080;
    *(_QWORD *)&v43[20] = &unk_10000DEDF;
    *(_WORD *)&v43[28] = 2080;
    *(_QWORD *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v43[38] = 1024;
    *(_DWORD *)&v43[40] = 800;
    goto LABEL_127;
  }
  v20 = v41;
  if (a1 == 2)
    goto LABEL_27;
  if (a1 != 5)
    goto LABEL_28;
  if (!v41)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "callback", 0, (const char *)&unk_10000DEDF, "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 804);
    if (qword_1000149B0 != -1)
      dispatch_once(&qword_1000149B0, &stru_1000104B8);
    v11 = &OBJC_INSTANCE_METHODS_NSObject;
    if (__osLogPearlLib)
      v37 = __osLogPearlLib;
    else
      v37 = &_os_log_default;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v43 = "callback";
      *(_WORD *)&v43[8] = 2048;
      *(_QWORD *)&v43[10] = 0;
      *(_WORD *)&v43[18] = 2080;
      *(_QWORD *)&v43[20] = &unk_10000DEDF;
      *(_WORD *)&v43[28] = 2080;
      *(_QWORD *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v43[38] = 1024;
      *(_DWORD *)&v43[40] = 804;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v26 = 258;
    goto LABEL_119;
  }
  v21 = (*((uint64_t (**)(id, _QWORD, void *, _QWORD))v41 + 2))(v41, 0, a4, *a5);
  if (!(_DWORD)v21)
  {
LABEL_27:
    v17[4] = 0;
    *a5 = v13;
    v22 = sub_100005B54(dword_1000149A8, 70, 0, v17, v15, a4, a5);
    if (!(_DWORD)v22)
    {
LABEL_28:
      if (a4 && a5)
      {
        if (qword_1000149B0 != -1)
          dispatch_once(&qword_1000149B0, &stru_1000104B8);
        if (__osLogPearlLib)
          v23 = __osLogPearlLib;
        else
          v23 = &_os_log_default;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = *a5;
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)v43 = a1;
          *(_WORD *)&v43[4] = 2048;
          *(_QWORD *)&v43[6] = v24;
          *(_WORD *)&v43[14] = 1040;
          *(_DWORD *)&v43[16] = v24;
          *(_WORD *)&v43[20] = 2096;
          *(_QWORD *)&v43[22] = a4;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "pearlSeaCookieHandleMessage, type=%d reply[%zu] %.*P\n", buf, 0x22u);
        }
      }
      if (qword_1000149B0 != -1)
        dispatch_once(&qword_1000149B0, &stru_1000104B8);
      if (__osLogPearlLibTrace)
        v25 = __osLogPearlLibTrace;
      else
        v25 = &_os_log_default;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v43 = a1;
        *(_WORD *)&v43[4] = 1024;
        *(_DWORD *)&v43[6] = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "pearlSeaCookieHandleMessage, type=%d -> 0x%x\n", buf, 0xEu);
      }
      v26 = 0;
LABEL_45:
      free(v17);
      goto LABEL_46;
    }
    v26 = v22;
    v36 = (int)v22;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v22, (const char *)&unk_10000DEDF, "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 814);
    if (qword_1000149B0 != -1)
      dispatch_once(&qword_1000149B0, &stru_1000104B8);
    if (__osLogPearlLib)
      v35 = __osLogPearlLib;
    else
      v35 = &_os_log_default;
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      goto LABEL_128;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v43 = "err == 0 ";
    *(_WORD *)&v43[8] = 2048;
    *(_QWORD *)&v43[10] = v36;
    *(_WORD *)&v43[18] = 2080;
    *(_QWORD *)&v43[20] = &unk_10000DEDF;
    *(_WORD *)&v43[28] = 2080;
    *(_QWORD *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v43[38] = 1024;
    *(_DWORD *)&v43[40] = 814;
    goto LABEL_127;
  }
  v26 = v21;
  v38 = (int)v21;
  fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v21, (const char *)&unk_10000DEDF, "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 807);
  if (qword_1000149B0 != -1)
    dispatch_once(&qword_1000149B0, &stru_1000104B8);
  if (__osLogPearlLib)
    v35 = __osLogPearlLib;
  else
    v35 = &_os_log_default;
  if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    goto LABEL_128;
  *(_DWORD *)buf = 136316162;
  *(_QWORD *)v43 = "err == 0 ";
  *(_WORD *)&v43[8] = 2048;
  *(_QWORD *)&v43[10] = v38;
  *(_WORD *)&v43[18] = 2080;
  *(_QWORD *)&v43[20] = &unk_10000DEDF;
  *(_WORD *)&v43[28] = 2080;
  *(_QWORD *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
  *(_WORD *)&v43[38] = 1024;
  *(_DWORD *)&v43[40] = 807;
LABEL_127:
  _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_128:
  v18 = &OBJC_INSTANCE_METHODS_NSObject;
  v20 = v41;
  v11 = &OBJC_INSTANCE_METHODS_NSObject;
LABEL_129:
  if (qword_1000149B0 != -1)
    dispatch_once(&qword_1000149B0, &stru_1000104B8);
  if (v11[304])
    v39 = v11[304];
  else
    v39 = &_os_log_default;
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v43 = a1;
    *(_WORD *)&v43[4] = 1024;
    *(_DWORD *)&v43[6] = v26;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "pearlSeaCookieHandleMessage, type=%d -> 0x%x\n", buf, 0xEu);
  }
  if (v17)
    goto LABEL_45;
LABEL_46:
  entrysize = v18[309].entrysize;
  if (entrysize)
  {
    IOServiceClose(entrysize);
    v18[309].entrysize = 0;
  }

  return v26;
}

void sub_100006C40(id a1)
{
  os_log_t v1;
  void *v2;
  void *v3;

  v1 = os_log_create("com.apple.BiometricKit", "Library-PearlFactory");
  v2 = (void *)__osLogPearlLib;
  __osLogPearlLib = (uint64_t)v1;

  v3 = (void *)__osLogPearlLib;
  if (!__osLogPearlLib)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100006CB0();
    v3 = (void *)__osLogPearlLib;
  }
  objc_storeStrong((id *)&__osLogPearlLibTrace, v3);
}

void sub_100006CB0()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Couldn't create OS Log for 'com.apple.BiometricKit.Library-PearlFactory'!\n", v0, 2u);
}

uint64_t sub_100006CF4(int a1, const void *a2, size_t a3, _QWORD *a4, size_t *a5)
{
  mach_port_t v10;
  mach_port_t v11;
  uint64_t v12;
  void *v13;
  size_t __count;
  uint64_t input;
  _BYTE __src[32768];

  v10 = sub_100007040();
  if (v10)
  {
    if (a2)
    {
      v11 = v10;
      v12 = 3758097090;
      if (sub_100007288((uint64_t)a2, (uint64_t)a2 + a3) == a3)
      {
        bzero(__src, 0x8000uLL);
        __count = 0x8000;
        input = a1;
        v12 = IOConnectCallMethod(v11, 0x2Bu, &input, 1u, a2, a3, 0, 0, __src, &__count);
        if (!(_DWORD)v12 && a4 && a5)
        {
          v13 = calloc(__count, 1uLL);
          *a4 = v13;
          if (v13)
          {
            memcpy(v13, __src, __count);
            v12 = 0;
            *a5 = __count;
          }
          else
          {
            v12 = 3758097085;
          }
        }
      }
    }
    else
    {
      v12 = 3758097090;
    }
  }
  else
  {
    fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_10000DEDF, (const char *)&unk_10000DEDF, (const char *)&unk_10000DEDF, "_aks_operation", ":", 457, (const char *)&unk_10000DEDF, 0, (const char *)&unk_10000DEDF, (const char *)&unk_10000DEDF);
    v12 = 3758097084;
  }
  memset_s(__src, 0x8000uLL, 0, 0x8000uLL);
  return v12;
}

uint64_t sub_100006ECC(unsigned int a1, unsigned int a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6)
{
  uint64_t v12;
  void *v13;
  void **v14;
  uint64_t v16;
  size_t v17;
  void *__s;
  rsize_t __n;

  v12 = 3758097090;
  v13 = off_1000148C0;
  v14 = (void **)calloc(8uLL, 1uLL);
  *v14 = 0;
  sub_100007A80(v14, (uint64_t)off_1000148B8, (uint64_t)v13);
  __s = 0;
  __n = 0;
  v16 = 0;
  v17 = 0;
  if ((!a3 || !sub_100007648((uint64_t)v14, a3, a3 + a4))
    && !sub_100007A90(v14, (uint64_t)off_1000148C8, a1)
    && !sub_100007A90(v14, (uint64_t)off_1000148D0, a2)
    && !sub_100007750(v14, &__s, &__n))
  {
    v12 = sub_100006CF4(-1, __s, __n, &v16, &v17);
    if (!(_DWORD)v12)
    {
      *a5 = v16;
      *a6 = v17;
    }
  }
  sub_1000073C0(v14);
  memset_s(v14, 8uLL, 0, 8uLL);
  free(v14);
  if (__s)
  {
    memset_s(__s, __n, 0, __n);
    free(__s);
  }
  return v12;
}

uint64_t sub_100007040()
{
  uint64_t result;

  if (qword_1000149C0 != -1)
    dispatch_once(&qword_1000149C0, &stru_100010538);
  dispatch_sync((dispatch_queue_t)qword_1000149C8, &stru_1000104F8);
  result = dword_1000149B8;
  if (!dword_1000149B8)
  {
    syslog(3, "failed to open connection to %s\n", "AppleKeyStore");
    return dword_1000149B8;
  }
  return result;
}

void sub_1000070C8(id a1)
{
  if (!dword_1000149B8)
    dword_1000149B8 = sub_10000712C("IOService:/IOResources/AppleKeyStore", "AppleKeyStore");
}

void sub_100007104(id a1)
{
  qword_1000149C8 = (uint64_t)dispatch_queue_create("aks-client-queue", 0);
}

uint64_t sub_10000712C(char *path, const char *a2)
{
  io_service_t v3;
  io_object_t v4;
  kern_return_t v5;
  const __CFDictionary *v6;
  io_service_t MatchingService;
  io_object_t v8;
  uint64_t result;
  kern_return_t v10;
  io_connect_t connect;

  connect = 0;
  v3 = IORegistryEntryFromPath(kIOMasterPortDefault, path);
  if (!v3 || (v4 = v3, v5 = IOServiceOpen(v3, mach_task_self_, 0, &connect), IOObjectRelease(v4), v5))
  {
    v6 = IOServiceMatching(a2);
    MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v6);
    if (MatchingService)
    {
      v8 = MatchingService;
      IOServiceOpen(MatchingService, mach_task_self_, 0, &connect);
      IOObjectRelease(v8);
    }
  }
  result = connect;
  if (connect)
  {
    v10 = IOConnectCallMethod(connect, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    result = connect;
    if (v10)
    {
      IOServiceClose(connect);
      return 0;
    }
  }
  return result;
}

BOOL sub_100007220(const void *a1, uint64_t a2, const void *a3, uint64_t a4)
{
  size_t v7;

  v7 = sub_100007288((uint64_t)a1, a2);
  return v7 == sub_100007288((uint64_t)a3, a4) && memcmp(a1, a3, v7) == 0;
}

uint64_t sub_100007288(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[0] = a1;
  v6[1] = a2;
  v4 = 0;
  v5 = 0;
  if (ccder_blob_decode_tag(v6, &v5) && ccder_blob_decode_len(v6, &v4))
    return v6[0] + v4 - a1;
  else
    return 0;
}

uint64_t sub_1000072EC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[0] = a1;
  v11[1] = a2;
  v9 = 0;
  v10 = 0;
  v8 = 0;
  result = ccder_blob_decode_range(v11, 0x2000000000000011, v11);
  if ((_DWORD)result)
  {
    if (ccder_blob_decode_sequence_tl(v11, &v9))
    {
      while (1)
      {
        v7 = v9;
        result = ccder_blob_decode_tl(&v9, 12, &v8);
        if (!(_DWORD)result)
          break;
        if (v9 - v7 != 2)
          return 0;
        result = a3(v7, v10 - v7, v9 + v8, v10 - (v9 + v8), a4);
        if (!(_DWORD)result)
          return result;
        v11[0] = v10;
        if ((ccder_blob_decode_sequence_tl(v11, &v9) & 1) == 0)
          return 1;
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t sub_1000073C0(void **a1)
{
  void *v2;
  void *v3;

  if (!a1)
    return 0xFFFFFFFFLL;
  while (1)
  {
    v2 = *a1;
    if (!*a1)
      break;
    v3 = (void *)*((_QWORD *)v2 + 1);
    *a1 = *(void **)v2;
    if (v3)
    {
      memset_s(v3, *((_QWORD *)v2 + 2), 0, *((_QWORD *)v2 + 2));
      free(*((void **)v2 + 1));
    }
    memset_s(v2, 0x18uLL, 0, 0x18uLL);
    free(v2);
  }
  return 0;
}

uint64_t sub_100007438(_QWORD *a1, unsigned __int8 *a2)
{
  _QWORD **v2;
  uint64_t result;
  uint64_t v4;
  _QWORD *i;
  void *v6;

  if (!a1)
    return 0xFFFFFFFFLL;
  v2 = (_QWORD **)a1;
  result = (uint64_t)sub_1000074CC(a1, a2);
  if (result)
  {
    v4 = result;
    for (i = *v2; i != (_QWORD *)result; i = (_QWORD *)*i)
      v2 = (_QWORD **)i;
    *v2 = *(_QWORD **)result;
    v6 = *(void **)(result + 8);
    if (v6)
    {
      memset_s(v6, *(_QWORD *)(v4 + 16), 0, *(_QWORD *)(v4 + 16));
      free(*(void **)(v4 + 8));
    }
    memset_s((void *)v4, 0x18uLL, 0, 0x18uLL);
    free((void *)v4);
    return 0;
  }
  return result;
}

_QWORD *sub_1000074CC(_QWORD *a1, unsigned __int8 *a2)
{
  _QWORD *v2;
  uint64_t v4;
  const void *v6;
  uint64_t v7;

  if (!a1)
    return 0;
  v6 = 0;
  v7 = 0;
  v2 = (_QWORD *)*a1;
  if (*a1)
  {
    do
    {
      v4 = v2[1] + v2[2];
      v6 = (const void *)v2[1];
      v7 = v4;
      if (ccder_blob_decode_sequence_tl(&v6, &v6) && sub_100007220(a2, (uint64_t)&a2[a2[1] + 2], v6, v7))
        break;
      v2 = (_QWORD *)*v2;
    }
    while (v2);
  }
  return v2;
}

uint64_t sub_10000754C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD v4[2];
  unint64_t v5;

  v2 = a1;
  v4[1] = a2;
  v5 = 0;
  v4[0] = a1;
  if ((ccder_blob_decode_tl(v4, 12, &v5) & 1) == 0)
  {
    fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s bad 1%s\n", "aks", &unk_10000DEDF, &unk_10000DEDF, &unk_10000DEDF, "der_key_validate");
    return 0;
  }
  if (v5 >= 0x11)
  {
    fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s bad 2%s\n", "aks", &unk_10000DEDF, &unk_10000DEDF, &unk_10000DEDF, "der_key_validate");
    return 0;
  }
  return v2;
}

uint64_t sub_100007648(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
    return sub_1000072EC(a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100007684, a1)- 1;
  else
    return 4294967285;
}

uint64_t sub_100007684(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  unsigned __int8 *v8;
  uint64_t v9;

  v8 = (unsigned __int8 *)sub_10000754C(a1, a1 + a2);
  if (v8)
  {
    v9 = (uint64_t)v8;
    if (!sub_100007438(a5, v8) && !sub_100007914(a5, v9, a3, a3 + a4))
      return 1;
  }
  fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s fail%s\n", "aks", (const char *)&unk_10000DEDF, (const char *)&unk_10000DEDF, (const char *)&unk_10000DEDF, "_merge_dict_cb", ":", 647, (const char *)&unk_10000DEDF, 0, (const char *)&unk_10000DEDF, (const char *)&unk_10000DEDF);
  return 0;
}

uint64_t sub_100007750(_QWORD *a1, _QWORD *a2, size_t *a3)
{
  uint64_t v3;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  rsize_t v11;
  char *v12;
  char *v13;
  _QWORD *v14;
  char *v15;
  size_t v16;
  char *v17;
  void *v18;
  unint64_t v19;
  char *v20;
  char *v22;
  char v23;
  char *v25;
  char *v26;

  v3 = 0xFFFFFFFFLL;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        v7 = (_QWORD *)*a1;
        if (*a1)
        {
          v8 = 0;
          v9 = 0;
          v10 = 0;
          do
          {
            v10 += v7[2];
            v7 = (_QWORD *)*v7;
            v9 -= 16;
            --v8;
          }
          while (v7);
          if (v8 >= 0xF000000000000001 && (v11 = -v9, (v12 = (char *)calloc(-v9, 1uLL)) != 0))
          {
            v13 = v12;
            v14 = (_QWORD *)*a1;
            if (*a1)
            {
              v15 = v12;
              do
              {
                *(_OWORD *)v15 = *(_OWORD *)(v14 + 1);
                v15 += 16;
                v14 = (_QWORD *)*v14;
              }
              while (v14);
            }
            qsort(v12, -(uint64_t)v8, 0x10uLL, (int (__cdecl *)(const void *, const void *))sub_100007CA4);
            v16 = ccder_sizeof(0x2000000000000011, v10);
            v17 = (char *)calloc(v16, 1uLL);
            v18 = v17;
            if (v17)
            {
              v25 = v17;
              v26 = &v17[v16];
              v19 = v8 - 1;
              v20 = &v13[-v9 - 8];
              while (!__CFADD__(v19++, 1))
              {
                v22 = v20 - 16;
                v23 = ccder_blob_encode_body(&v25, *(_QWORD *)v20, *((_QWORD *)v20 - 1));
                v20 = v22;
                if ((v23 & 1) == 0)
                  goto LABEL_16;
              }
              if (!ccder_blob_encode_tl(&v25, 0x2000000000000011, v10) || v25 != v26)
              {
LABEL_16:
                v3 = 0xFFFFFFFFLL;
                goto LABEL_20;
              }
              v3 = 0;
              *a2 = v18;
              *a3 = v16;
              v18 = 0;
            }
            else
            {
              v3 = 4294967279;
            }
LABEL_20:
            memset_s(v13, v11, 0, v11);
            free(v13);
            if (v18)
            {
              memset_s(v18, v16, 0, v16);
              free(v18);
            }
          }
          else
          {
            return 0xFFFFFFFFLL;
          }
        }
      }
    }
  }
  return v3;
}

uint64_t sub_100007914(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  unint64_t v9;
  unint64_t v10;
  size_t v11;
  char *v12;
  char *v13;
  char *v14;
  int v15;
  char *v16;
  int v17;
  char *v18;
  _QWORD *v20;
  _QWORD *v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3 && a4)
  {
    v9 = sub_100007288(a3, a4);
    if (v9 <= a4 - a3)
    {
      v10 = v9;
      v11 = ccder_sizeof(0x2000000000000010, v9 + *(unsigned __int8 *)(a2 + 1) + 2);
      v12 = (char *)calloc(v11, 1uLL);
      if (!v12)
        return 4294967279;
      v13 = v12;
      v14 = &v12[v11];
      v22 = v12;
      v23 = &v12[v11];
      if (ccder_blob_encode_body(&v22, v10, a3))
      {
        v24 = v13;
        v25 = v23;
        v15 = ccder_blob_encode_body(&v24, *(unsigned __int8 *)(a2 + 1) + 2, a2);
        v16 = v25;
        if (!v15)
          v16 = 0;
        v24 = v13;
        v25 = v16;
        v17 = ccder_blob_encode_tl(&v24, 0x2000000000000010, v14 - v16);
        v18 = v25;
        if (!v17)
          v18 = 0;
        if (v18 && v18 == v13)
        {
          v20 = calloc(0x18uLL, 1uLL);
          if (v20)
          {
            v21 = v20;
            result = 0;
            v21[1] = v13;
            v21[2] = v11;
            *v21 = *a1;
            *a1 = v21;
            return result;
          }
        }
      }
      memset_s(v13, v11, 0, v11);
      free(v13);
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t sub_100007A80(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_100007914(a1, a2, a3, a3 + *(unsigned __int8 *)(a3 + 1) + 2);
}

uint64_t sub_100007A90(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  size_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  int v19;
  char *v20;
  int v21;
  char *v22;
  BOOL v23;
  _QWORD *v24;
  _QWORD *v25;
  char *v26;
  char *v27;
  char *v28;
  char *v29;
  uint64_t v30;

  v3 = a3;
  v6 = HIBYTE(a3);
  if ((HIBYTE(a3) + 1) > 1u)
  {
    v11 = 8;
  }
  else
  {
    v7 = 9;
    v8 = 48;
    v9 = 1;
    while ((unint64_t)(v7 - 2) >= 2)
    {
      v10 = a3 >> v8;
      --v7;
      v8 -= 8;
      if ((_DWORD)v6 != v10)
      {
        v9 = v7 - 1;
        goto LABEL_8;
      }
    }
    v7 = 2;
LABEL_8:
    if ((((a3 >> (8 * v9 - 8)) ^ v6) & 0x80) != 0)
      v11 = v7;
    else
      v11 = v9;
  }
  v30 = 0;
  result = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    v13 = *(unsigned __int8 *)(a2 + 1);
    v14 = ccder_sizeof(2, v11);
    v15 = ccder_sizeof(0x2000000000000010, v13 + v14 + 2);
    v16 = (char *)calloc(v15, 1uLL);
    if (v16)
    {
      v17 = v16;
      v18 = v11;
      do
      {
        *((_BYTE *)&v30 + v18 - 1) = v3;
        v3 >>= 8;
        --v18;
      }
      while (v18);
      v26 = v16;
      v27 = &v16[v15];
      if ((ccder_blob_encode_body(&v26, v11, &v30) & 1) == 0 || !ccder_blob_encode_tl(&v26, 2, v11))
        goto LABEL_30;
      v28 = v17;
      v29 = v27;
      v19 = ccder_blob_encode_body(&v28, *(unsigned __int8 *)(a2 + 1) + 2, a2);
      v20 = v29;
      if (!v19)
        v20 = 0;
      v28 = v17;
      v29 = v20;
      v21 = ccder_blob_encode_tl(&v28, 0x2000000000000010, &v17[v15] - v20);
      v22 = v29;
      if (!v21)
        v22 = 0;
      v23 = v22 && v22 == v17;
      if (v23 && (v24 = calloc(0x18uLL, 1uLL)) != 0)
      {
        v25 = v24;
        result = 0;
        v25[1] = v17;
        v25[2] = v15;
        *v25 = *a1;
        *a1 = v25;
      }
      else
      {
LABEL_30:
        memset_s(v17, v15, 0, v15);
        free(v17);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 4294967279;
    }
  }
  return result;
}

uint64_t sub_100007CA4(_QWORD *a1, void **a2)
{
  uint64_t v2;
  char *v3;
  const void *v4;
  unint64_t v6;
  unint64_t v7;
  size_t v8;
  int v9;
  int v11;
  void *__s2[2];
  _QWORD v13[2];
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;

  v2 = *a1 + a1[1];
  v13[0] = *a1;
  v13[1] = v2;
  v3 = (char *)a2[1] + (_QWORD)*a2;
  __s2[0] = *a2;
  __s2[1] = v3;
  if (!ccder_blob_decode_sequence_tl(v13, v13))
    return 4294967293;
  if (!ccder_blob_decode_sequence_tl(__s2, __s2))
    return 4294967293;
  v17 = 0;
  v15 = 0;
  v16 = 0;
  v14 = 0;
  if (!ccder_blob_decode_tag(v13, &v17))
    return 4294967293;
  if (!ccder_blob_decode_len(v13, &v16))
    return 4294967293;
  v4 = (const void *)v13[0];
  if (!v13[0]
    || !ccder_blob_decode_tag(__s2, &v15)
    || !ccder_blob_decode_len(__s2, &v14)
    || !__s2[0])
  {
    return 4294967293;
  }
  if (v17 > v15)
    return 1;
  if (v15 > v17)
    return 0xFFFFFFFFLL;
  v6 = v16;
  v7 = v14;
  v8 = v16 >= v14 ? v14 : v16;
  v9 = memcmp(v4, __s2[0], v8);
  if (v9 > 0 || !v9 && v6 > v7)
    return 1;
  v11 = v9 < 0 || v6 < v7;
  return (v11 << 31 >> 31);
}

BOOL sub_100007DCC()
{
  io_registry_entry_t v0;
  io_object_t v1;
  const __CFData *CFProperty;
  const __CFData *v3;
  CFTypeID v4;
  CFIndex Length;
  UInt8 buffer[4];
  CFRange v8;

  *(_DWORD *)buffer = 0;
  v0 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/chosen");
  if (!v0)
    return 1;
  v1 = v0;
  CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v0, CFSTR("development-cert"), kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    v3 = CFProperty;
    v4 = CFGetTypeID(CFProperty);
    if (v4 == CFDataGetTypeID())
    {
      Length = CFDataGetLength(v3);
      if ((unint64_t)(Length - 1) <= 3)
      {
        v8.length = Length;
        v8.location = 0;
        CFDataGetBytes(v3, v8, buffer);
      }
    }
    CFRelease(v3);
  }
  IOObjectRelease(v1);
  return *(_DWORD *)buffer == 0;
}

uint64_t sub_100007E9C(const void *a1, CFMutableDictionaryRef *a2, CFErrorRef *a3, int a4)
{
  CFMutableDictionaryRef Mutable;
  int v9;
  __CFString *v11;
  __CFString *v12;
  CFNullRef v13;
  __CFString *v14;
  __CFString *v15;
  CFNullRef v16;
  __CFString *v17;
  __CFString *v18;
  CFNullRef v19;
  __CFString *v20;
  __CFString *v21;
  CFNullRef v22;
  __CFString *v23;
  __CFString *v24;
  CFNullRef v25;
  __CFString *v26;
  __CFString *v27;
  CFNullRef v28;
  uint64_t v29;
  CFNullRef v30;
  CFNullRef v31;
  CFNullRef v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  _OWORD v36[2];
  __int128 v37;
  uint64_t v38;

  v33 = 88;
  if (!a1 || !a2)
  {
    AMSupportLogInternal(3, "_HSCGetPearlInfo", "Invalid Arguments");
    return 0;
  }
  v38 = 0;
  v37 = 0u;
  v35 = 0u;
  memset(v36, 0, sizeof(v36));
  v34 = 0u;
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v9 = sub_100008760(2, 0, 0, 0, &v34, &v33, 0, 0);
  AMSupportLogInternal(6, "_HSCGetPearlInfo", "pearlStatus: %d Size: %d", v9, v33);
  AMSupportLogInternal(6, "_HSCGetPearlInfo", "chipID: %u Size: %llu", &v34 + 4, (char *)&v34 + 4);
  AMSupportLogDumpMemory(7, "_HSCGetPearlInfo", "pearlInfo", &v34, v33);
  if (v9)
  {
    if (a3)
      *a3 = sub_100008688(11, CFSTR("Unable to get Pearl Information"));
    if (Mutable)
      CFRelease(Mutable);
    return 0;
  }
  CFDictionarySetValue(Mutable, CFSTR("Command"), a1);
  v11 = sub_100008680((unsigned __int8 *)&v34 + 4, 4u);
  v12 = v11;
  if (v11)
    v13 = (CFNullRef)v11;
  else
    v13 = kCFNull;
  CFDictionarySetValue(Mutable, CFSTR("ApChipID"), v13);
  AMSupportLogInternal(6, "_HSCGetPearlInfo", "ApChipID: %@", v12);
  if (v12)
    CFRelease(v12);
  v14 = sub_100008680((unsigned __int8 *)&v34 + 8, 8u);
  v15 = v14;
  if (v14)
    v16 = (CFNullRef)v14;
  else
    v16 = kCFNull;
  CFDictionarySetValue(Mutable, CFSTR("ApECID"), v16);
  AMSupportLogInternal(6, "_HSCGetPearlInfo", "ApECID: %@", v15);
  if (v15)
    CFRelease(v15);
  v17 = sub_100008680((unsigned __int8 *)&v35, 0x10u);
  v18 = v17;
  if (v17)
    v19 = (CFNullRef)v17;
  else
    v19 = kCFNull;
  CFDictionarySetValue(Mutable, CFSTR("SensorUID"), v19);
  AMSupportLogInternal(6, "_HSCGetPearlInfo", "SensorUID: %@", v18);
  if (v18)
    CFRelease(v18);
  v20 = sub_100008680((unsigned __int8 *)v36, 0x20u);
  v21 = v20;
  if (v20)
    v22 = (CFNullRef)v20;
  else
    v22 = kCFNull;
  CFDictionarySetValue(Mutable, CFSTR("SepNonce"), v22);
  AMSupportLogInternal(6, "_HSCGetPearlInfo", "SepNonce : %@", v21);
  if (v21)
    CFRelease(v21);
  v23 = sub_100008680((unsigned __int8 *)&v37, 4u);
  v24 = v23;
  if (v23)
    v25 = (CFNullRef)v23;
  else
    v25 = kCFNull;
  CFDictionarySetValue(Mutable, CFSTR("SensorChipID"), v25);
  AMSupportLogInternal(6, "_HSCGetPearlInfo", "SensorChipID: %@", v24);
  if (v24)
    CFRelease(v24);
  v26 = sub_100008680((unsigned __int8 *)&v37 + 4, 0x14u);
  v27 = v26;
  if (v26)
    v28 = (CFNullRef)v26;
  else
    v28 = kCFNull;
  CFDictionarySetValue(Mutable, CFSTR("SensorSNUM"), v28);
  v29 = AMSupportLogInternal(6, "_HSCGetPearlInfo", "SensorSNUM: %@", v27);
  if (v27)
    CFRelease(v27);
  if (AMFDRSealingMapGetFDRDataVersionForDevice(v29) == 2)
  {
    v30 = (CFNullRef)sub_10000841C(kCFAllocatorDefault);
    v31 = v30;
    v32 = v30 ? v30 : kCFNull;
    CFDictionarySetValue(Mutable, CFSTR("SIK"), v32);
    AMSupportLogInternal(6, "_HSCGetPearlInfo", "SIK : %@", v31);
    if (v31)
      CFRelease(v31);
  }
  if (a4)
    CFDictionarySetValue(Mutable, CFSTR("isSSR"), kCFBooleanTrue);
  if (!sub_100007DCC())
    CFDictionarySetValue(Mutable, CFSTR("useProdMasterKey"), kCFBooleanFalse);
  *a2 = Mutable;
  return 1;
}

uint64_t sub_1000082EC(int a1, const void *a2, size_t a3, void *a4, _QWORD *a5, uint64_t a6)
{
  _QWORD v13[5];

  AMSupportLogInternal(6, "_HSCHandlePearlMessage", "PearlFactoryLib seacookie message handling.");
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 0x40000000;
  v13[2] = sub_100008398;
  v13[3] = &unk_100010560;
  v13[4] = a6;
  return pearlSeaCookieHandleMessage(a1, a2, a3, a4, a5, v13);
}

uint64_t sub_100008398(uint64_t a1, int a2)
{
  if (a2)
  {
    AMSupportLogInternal(3, "_HSCHandlePearlMessage_block_invoke", "Unknown callback type.");
    return 1;
  }
  else
  {
    AMSupportLogInternal(6, "_HSCHandlePearlMessage_block_invoke", "Calling pearl patch loading.");
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

uint64_t sub_10000841C(const __CFAllocator *a1)
{
  UInt8 *v2;
  UInt8 *v3;
  uint64_t v4;
  CFDataRef v5;
  CFDataRef v6;
  uint64_t v7;
  CFIndex length;
  UInt8 *bytes;

  length = 0;
  bytes = 0;
  if (sub_100006ECC(1u, 1u, 0, 0, &bytes, &length))
  {
    AMSupportLogInternal(3, "getSIKString", "aksStatus is %d");
  }
  else if (bytes)
  {
    if (length)
    {
      if ((unint64_t)length < 0x42)
      {
        v6 = CFDataCreate(a1, bytes, length);
        v7 = AMSupportCopyHexStringFromData(a1, v6);
        if (!v6)
          goto LABEL_10;
        goto LABEL_9;
      }
      v2 = (UInt8 *)malloc_type_calloc(1uLL, 0x30uLL, 0xC6F6CF06uLL);
      if (v2)
      {
        v3 = v2;
        v4 = ccsha384_di();
        ccdigest(v4, length, bytes, v3);
        v5 = CFDataCreateWithBytesNoCopy(a1, v3, 48, kCFAllocatorMalloc);
        if (v5)
        {
          v6 = v5;
          v7 = AMSupportCopyHexStringFromData(a1, v5);
LABEL_9:
          CFRelease(v6);
          goto LABEL_10;
        }
        free(v3);
        AMSupportLogInternal(3, "getSIKString", "CFDataCreate sik_digest failed");
      }
      else
      {
        AMSupportLogInternal(3, "getSIKString", "sik_digest is NULL");
      }
    }
    else
    {
      AMSupportLogInternal(3, "getSIKString", "sik_pub_key_len is 0");
    }
  }
  else
  {
    AMSupportLogInternal(3, "getSIKString", "sik_pub_key is NULL");
  }
  v7 = 0;
LABEL_10:
  if (bytes)
    free(bytes);
  return v7;
}

__CFString *sub_10000859C(unsigned __int8 *a1, unsigned int a2, unsigned int a3)
{
  __CFString *MutableCopy;
  __CFString *result;
  int v8;
  uint64_t v9;
  unsigned int v10;
  const __CFString *v11;

  MutableCopy = CFStringCreateMutableCopy(kCFAllocatorDefault, 0, CFSTR("0x"));
  result = 0;
  if (a2 && a3)
  {
    v8 = a3 - a2;
    if (a3 > a2 && v8 >= 1)
    {
      do
      {
        CFStringAppend(MutableCopy, CFSTR("00"));
        --v8;
      }
      while (v8);
    }
    v9 = a2;
    do
    {
      v10 = *a1++;
      v11 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%.2X"), v10);
      CFStringAppend(MutableCopy, v11);
      if (v11)
        CFRelease(v11);
      --v9;
    }
    while (v9);
    return MutableCopy;
  }
  return result;
}

__CFString *sub_100008680(unsigned __int8 *a1, unsigned int a2)
{
  return sub_10000859C(a1, a2, a2);
}

CFErrorRef sub_100008688(int a1, const void *a2)
{
  __CFDictionary *Mutable;

  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  AMSupportLogInternal(3, "createError", "ErrorString : %@\n", a2);
  if (Mutable)
  {
    CFDictionarySetValue(Mutable, kCFErrorLocalizedDescriptionKey, a2);
    return CFErrorCreate(kCFAllocatorDefault, CFSTR("HorizonSeaCookieErrorDomain"), a1, Mutable);
  }
  else
  {
    AMSupportLogInternal(3, "createError", "Unable to create Error object\n");
    return 0;
  }
}

uint64_t sub_100008760(int a1, int a2, const void *a3, size_t a4, void *a5, uint64_t *a6, uint64_t a7, uint64_t a8)
{
  if (a1 == 2)
    return sub_1000082EC(a2, a3, a4, a5, a6, a8);
  if (a1 != 1)
  {
    AMSupportLogInternal(3, "_HSCHandleMessage", "Unknown SeaCookie type");
    return 1;
  }
  if (a7)
  {
    AMSupportLogInternal(6, "_HSCHandleMesaMessage", "TrustedAccessoryFactory seacookie message handling.");
    AMSupportLogInternal(3, "_HSCHandleMesaMessage", "Not supported.");
    return 1;
  }
  AMSupportLogInternal(6, "_HSCHandleMesaMessage", "MesaFactoryC seacookie message handling.");
  return sub_10000C1D4(a2, a3, a4, a5, a6);
}

CFComparisonResult sub_100008868(CFComparisonResult result, int a2)
{
  uint64_t v2;
  CFStringRef *v3;

  if (a2)
  {
    v2 = a2;
    v3 = (CFStringRef *)(result + 24);
    do
    {
      if (CFStringCompare(*v3, CFSTR("C4"), 0) == kCFCompareEqualTo)
        *(v3 - 2) = CFSTR("ReprovisionSensor");
      if (CFStringCompare(*v3, CFSTR("C6"), 0) == kCFCompareEqualTo)
        *(v3 - 2) = CFSTR("RePairingSessionKeyExchange");
      result = CFStringCompare(*v3, CFSTR("C7"), 0);
      if (result == kCFCompareEqualTo)
        *(v3 - 2) = CFSTR("ReprovisionSensor");
      v3 += 5;
      --v2;
    }
    while (v2);
  }
  return result;
}

uint64_t sub_100008920(int a1, const void *a2, CFMutableDictionaryRef *a3, CFErrorRef *a4, int a5, int a6, _DWORD *a7, uint64_t a8)
{
  CFMutableDictionaryRef Mutable;
  int v14;
  uint64_t result;
  CFErrorRef v16;
  __CFString *v17;
  __CFString *v18;
  CFNullRef v19;
  __CFString *v20;
  __CFString *v21;
  CFNullRef v22;
  __CFString *v23;
  __CFString *v24;
  CFNullRef v25;
  __CFString *v26;
  __CFString *v27;
  CFNullRef v28;
  int v29;
  uint64_t v30;
  CFStringRef v31;
  CFStringRef v32;
  CFNullRef v33;
  __CFString *v34;
  __CFString *v35;
  CFNullRef v36;
  __CFString *v37;
  __CFString *v38;
  CFNullRef v39;
  uint64_t v40;
  CFNullRef v41;
  CFNullRef v42;
  CFNullRef v43;
  __CFString *v44;
  __CFString *v45;
  CFNullRef v46;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  _OWORD v52[2];
  _OWORD v53[3];

  if (a1 == 2)
    return sub_100007E9C(a2, a3, a4, a6);
  if (a1 != 1)
  {
    AMSupportLogInternal(3, "_HSCGetModuleInfo", "Unknown SeaCookie type");
    if (a4)
    {
      v16 = sub_100008688(-1, CFSTR("Unknown SeaCookie type"));
      result = 0;
      *a4 = v16;
      return result;
    }
    return 0;
  }
  v49 = 102;
  if (!a2 || !a3)
  {
    AMSupportLogInternal(3, "_HSCGetMesaInfo", "Invalid Arguments");
    return 0;
  }
  memset(v53, 0, 38);
  memset(v52, 0, sizeof(v52));
  v50 = 0u;
  v51 = 0u;
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v14 = sub_100008760(1, 0, 0, 0, &v50, &v49, a8, 0);
  AMSupportLogInternal(6, "_HSCGetMesaInfo", "mesaStatus: %d Size: %d", v14, v49);
  AMSupportLogInternal(6, "_HSCGetMesaInfo", "chipID: %u Size: %llu", &v50 + 4, (char *)&v50 + 4);
  AMSupportLogDumpMemory(7, "_HSCGetMesaInfo", "mesaInfo", &v50, v49);
  if (v14)
  {
    if (a4)
      *a4 = sub_100008688(11, CFSTR("Unable to get Mesa Information"));
    if (Mutable)
      CFRelease(Mutable);
    return 0;
  }
  CFDictionarySetValue(Mutable, CFSTR("Command"), a2);
  v17 = sub_10000859C((unsigned __int8 *)&v50 + 4, 4u, 4u);
  v18 = v17;
  if (v17)
    v19 = (CFNullRef)v17;
  else
    v19 = kCFNull;
  CFDictionarySetValue(Mutable, CFSTR("ApChipID"), v19);
  AMSupportLogInternal(6, "_HSCGetMesaInfo", "ApChipID: %@", v18);
  if (v18)
    CFRelease(v18);
  v20 = sub_10000859C((unsigned __int8 *)&v50 + 8, 8u, 8u);
  v21 = v20;
  if (v20)
    v22 = (CFNullRef)v20;
  else
    v22 = kCFNull;
  CFDictionarySetValue(Mutable, CFSTR("ApECID"), v22);
  AMSupportLogInternal(6, "_HSCGetMesaInfo", "ApECID: %@", v21);
  if (v21)
    CFRelease(v21);
  v23 = sub_10000859C((unsigned __int8 *)&v51, 0x10u, 0x10u);
  v24 = v23;
  if (v23)
    v25 = (CFNullRef)v23;
  else
    v25 = kCFNull;
  CFDictionarySetValue(Mutable, CFSTR("SensorSN"), v25);
  AMSupportLogInternal(6, "_HSCGetMesaInfo", "SensorSN: %@", v24);
  if (v24)
    CFRelease(v24);
  v26 = sub_10000859C((unsigned __int8 *)v52, 0x20u, 0x20u);
  v27 = v26;
  if (v26)
    v28 = (CFNullRef)v26;
  else
    v28 = kCFNull;
  CFDictionarySetValue(Mutable, CFSTR("SepNonce"), v28);
  AMSupportLogInternal(6, "_HSCGetMesaInfo", "SepNonce : %@", v27);
  if (v27)
    CFRelease(v27);
  v29 = *(_DWORD *)((char *)v53 + 2);
  v30 = bswap32(*(unsigned int *)((char *)v53 + 2));
  v31 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%d"), v30);
  v32 = v31;
  if (v31)
    v33 = (CFNullRef)v31;
  else
    v33 = kCFNull;
  CFDictionarySetValue(Mutable, CFSTR("Version"), v33);
  AMSupportLogInternal(6, "_HSCGetMesaInfo", "Protocol Version : %@", v32);
  if (v32)
    CFRelease(v32);
  if (v29 == 0x2000000)
  {
    v34 = sub_10000859C((unsigned __int8 *)v53 + 6, 0x20u, 0x20u);
    v35 = v34;
    v36 = v34 ? (CFNullRef)v34 : kCFNull;
    CFDictionarySetValue(Mutable, CFSTR("SensorNonce"), v36);
    AMSupportLogInternal(6, "_HSCGetMesaInfo", "SensorNonce : %@", v35);
    if (v35)
      CFRelease(v35);
  }
  v37 = sub_10000859C((unsigned __int8 *)v53, 2u, 4u);
  v38 = v37;
  if (v37)
    v39 = (CFNullRef)v37;
  else
    v39 = kCFNull;
  CFDictionarySetValue(Mutable, CFSTR("SensorChipID"), v39);
  v40 = AMSupportLogInternal(6, "_HSCGetMesaInfo", "SensorChipID : %@", v38);
  if (v38)
    CFRelease(v38);
  if (!a8 && AMFDRSealingMapGetFDRDataVersionForDevice(v40) >= 2)
  {
    v41 = (CFNullRef)sub_10000841C(kCFAllocatorDefault);
    v42 = v41;
    v43 = v41 ? v41 : kCFNull;
    CFDictionarySetValue(Mutable, CFSTR("SIK"), v43);
    AMSupportLogInternal(6, "_HSCGetMesaInfo", "SIK : %@", v42);
    if (v42)
      CFRelease(v42);
  }
  if (a5)
  {
    v44 = sub_10000859C((unsigned __int8 *)v53, 2u, 2u);
    v45 = v44;
    v46 = v44 ? (CFNullRef)v44 : kCFNull;
    CFDictionarySetValue(Mutable, CFSTR("SensorType"), v46);
    AMSupportLogInternal(6, "_HSCGetMesaInfo", "SensorType : %@", v45);
    if (v45)
      CFRelease(v45);
  }
  if (a6)
    CFDictionarySetValue(Mutable, CFSTR("isSSR"), kCFBooleanTrue);
  if (a7)
    *a7 = v30;
  *a3 = Mutable;
  return 1;
}

uint64_t sub_100008EEC(int a1, uint64_t a2, const __CFDictionary *a3, __CFDictionary **a4, CFErrorRef *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __CFDictionary *Mutable;
  const __CFData *Value;
  const UInt8 *BytePtr;
  CFIndex v19;
  size_t v20;
  const UInt8 *v21;
  int v22;
  CFDataRef v23;
  const __CFString *v24;
  const __CFString *v25;
  uint64_t result;
  const __CFString *v27;
  CFErrorRef v28;
  CFNullRef v29;
  CFNullRef v30;
  CFNullRef v31;
  uint64_t v32;
  __CFDictionary **v33;
  CFIndex length;
  UInt8 bytes[8192];

  if (!a2 || !a3)
  {
    AMSupportLogInternal(3, "_HSCSeaCookieHandler", "Invalid Argument");
    return 0;
  }
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  AMSupportLogInternal(3, "_HSCSeaCookieHandler", "Processing Message  %@ --> %@", *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 8));
  if (!CFDictionaryContainsKey(a3, *(const void **)(a2 + 16)))
  {
    AMSupportLogInternal(3, "_HSCSeaCookieHandler", "appropriate command is not present");
    if (a5)
    {
      v27 = CFSTR("appropriate command is not present");
LABEL_16:
      v28 = sub_100008688(11, v27);
      result = 0;
      *a5 = v28;
      return result;
    }
    return 0;
  }
  v32 = a7;
  v33 = a4;
  Value = (const __CFData *)CFDictionaryGetValue(a3, *(const void **)(a2 + 16));
  BytePtr = CFDataGetBytePtr(Value);
  v19 = CFDataGetLength(Value);
  AMSupportLogDumpMemory(7, "_HSCSeaCookieHandler", "inputData", BytePtr, v19);
  v20 = CFDataGetLength(Value);
  v21 = CFDataGetBytePtr(Value);
  AMSupportLogInternal(6, "_HSCSeaCookieHandler", "inputData --> %@ inputSize --> %lu", Value, v20);
  bzero(bytes, 0x2000uLL);
  length = 0x2000;
  v22 = sub_100008760(a1, *(_DWORD *)a2, v21, v20, bytes, &length, a6, a8);
  if (v22 || (unint64_t)length >> 13)
  {
    AMSupportLogInternal(3, "_HSCSeaCookieHandler", "_HSCHandleMessage returned : %d", v22);
    if (a5)
    {
      v27 = CFSTR("_HSCHandleMessage Failed");
      goto LABEL_16;
    }
    return 0;
  }
  AMSupportLogInternal(6, "_HSCSeaCookieHandler", "moduleStatus = %d reply[%lu] \n", 0, length);
  v23 = CFDataCreate(kCFAllocatorDefault, bytes, length);
  CFDictionarySetValue(Mutable, *(const void **)(a2 + 24), v23);
  AMSupportLogInternal(6, "_HSCSeaCookieHandler", "Payload = %@\n", *(_QWORD *)(a2 + 24));
  if (v32)
  {
    if (a1 == 2)
    {
      v24 = *(const __CFString **)(a2 + 24);
      v25 = CFSTR("C4");
      goto LABEL_18;
    }
    if (a1 == 1)
    {
      v24 = *(const __CFString **)(a2 + 24);
      v25 = CFSTR("C5");
LABEL_18:
      if (CFStringCompare(v24, v25, 0) == kCFCompareEqualTo)
      {
        v29 = (CFNullRef)(*(uint64_t (**)(uint64_t, UInt8 *, CFIndex))(v32 + 16))(v32, bytes, length);
        v30 = v29;
        v31 = v29 ? v29 : kCFNull;
        CFDictionarySetValue(Mutable, CFSTR("signature"), v31);
        AMSupportLogInternal(6, "_HSCSeaCookieHandler", "Signature = %@\n", v30);
        if (v30)
          CFRelease(v30);
      }
    }
  }
  AMSupportLogInternal(6, "_HSCSeaCookieHandler", "Command = %@\n", *(_QWORD *)(a2 + 8));
  CFDictionarySetValue(Mutable, CFSTR("Command"), *(const void **)(a2 + 8));
  *v33 = Mutable;
  if (v23)
    CFRelease(v23);
  AMSupportLogInternal(6, "_HSCSeaCookieHandler", "Output - Module Function = %@\n", Mutable);
  return 1;
}

uint64_t sub_1000092B0(int a1, const __CFURL *a2, const void *a3, CFComparisonResult a4, int a5, CFErrorRef *a6, uint64_t a7, uint64_t a8)
{
  const __CFUUID *v15;
  CFStringRef v16;
  uint64_t v17;
  int v18;
  __CFDictionary *v19;
  uint64_t v20;
  const char *v22;
  const __CFUUID *v23;
  int v25;
  CFDataRef v26;
  CFTypeRef v27;
  __CFDictionary *v28;
  CFTypeRef v29;
  CFTypeRef cf;
  CFTypeRef v31;

  cf = 0;
  v31 = 0;
  v28 = 0;
  v29 = 0;
  v26 = 0;
  v27 = 0;
  v25 = -1;
  if (sub_100008920(a1, CFSTR("startPairing"), (CFMutableDictionaryRef *)&v29, a6, 0, a7 != 0, &v25, 0) == 1)
  {
    v15 = CFUUIDCreate(kCFAllocatorDefault);
    v16 = CFUUIDCreateString(kCFAllocatorDefault, v15);
    if (sub_1000099C8(v16, v26, v29, 1, (const __CFData **)&cf, a6) == 1)
    {
      if (sub_100009C4C(a2, (const __CFData *)cf, (CFDataRef *)&v31, a3, a6, 1) == 1)
      {
        AMSupportLogInternal(6, "_HSCPairProxy", "requestData : %@ responseData : %@", cf, v31);
        if (sub_10000A2E0((CFDataRef)v31, (CFDictionaryRef *)&v27, &v26, a6) == 1)
        {
          if (cf)
          {
            CFRelease(cf);
            cf = 0;
          }
          if (v31)
          {
            CFRelease(v31);
            v31 = 0;
          }
          if (a1 == 1 && v25 == 2)
            sub_100008868(a4, a5);
          if (a5 < 1)
          {
            v20 = 1;
            goto LABEL_31;
          }
          v23 = v15;
          v17 = a5;
          while (1)
          {
            v18 = sub_100008EEC(a1, a4, (const __CFDictionary *)v27, &v28, a6, 0, a7, a8);
            if (v27)
            {
              CFRelease(v27);
              v27 = 0;
            }
            if (!v18)
            {
              v15 = v23;
              AMSupportLogInternal(3, "_HSCPairProxy", "Unable to relay response to SEP and obtain information \n");
              goto LABEL_43;
            }
            v19 = v28;
            if (sub_1000099C8(v16, v26, v28, 0, (const __CFData **)&cf, a6) != 1)
            {
              v22 = "unable to create a request \n";
              goto LABEL_42;
            }
            if (sub_100009C4C(a2, (const __CFData *)cf, (CFDataRef *)&v31, a3, a6, 0) != 1)
            {
              v22 = "Unable to send/receive data with SeaCookie server\n";
              goto LABEL_42;
            }
            AMSupportLogInternal(6, "_HSCPairProxy", "requestData : %@ responseData : %@", cf, v31);
            if (sub_10000A2E0((CFDataRef)v31, (CFDictionaryRef *)&v27, &v26, a6) != 1)
              break;
            if (v27)
              AMSupportLogInternal(6, "_HSCPairProxy", "responseDict : %@", v27);
            if (cf)
            {
              CFRelease(cf);
              cf = 0;
            }
            if (v31)
            {
              CFRelease(v31);
              v31 = 0;
            }
            if (v19)
            {
              CFRelease(v19);
              v28 = 0;
            }
            a4 += 40;
            if (!--v17)
            {
              v20 = 1;
              v15 = v23;
              goto LABEL_31;
            }
          }
          v22 = "Unable to parse response data from SeaCookie server\n";
LABEL_42:
          v15 = v23;
          AMSupportLogInternal(3, "_HSCPairProxy", v22);
        }
        else
        {
          AMSupportLogInternal(3, "_HSCPairProxy", "Unable to parse response data from SeaCookie server\n");
        }
      }
      else
      {
        AMSupportLogInternal(3, "_HSCPairProxy", "Unable to send/receive data with SeaCookie server\n");
      }
    }
    else
    {
      AMSupportLogInternal(3, "_HSCPairProxy", "unable to create a request \n");
    }
  }
  else
  {
    v15 = 0;
    v16 = 0;
    AMSupportLogInternal(3, "_HSCPairProxy", "Unable to receive Module Information\n");
  }
LABEL_43:
  v20 = 0;
LABEL_31:
  if (v29)
  {
    CFRelease(v29);
    v29 = 0;
  }
  if (v16)
    CFRelease(v16);
  if (v15)
    CFRelease(v15);
  AMSupportLogInternal(6, "_HSCPairProxy", "result : %d", v20);
  return v20;
}

uint64_t HSCGetMesaNonce(CFDataRef *a1, CFErrorRef *a2)
{
  const __CFString *v4;
  int v5;
  CFErrorRef v6;
  uint64_t result;
  CFIndex length;
  UInt8 bytes[8192];

  bzero(bytes, 0x2000uLL);
  length = 0x2000;
  if (!a1)
  {
    if (a2)
    {
      v4 = CFSTR("Invalid Arguments");
      v5 = 1;
      goto LABEL_7;
    }
    return 0;
  }
  AMSupportLogInternal(6, "_HSCHandleMesaMessage", "MesaFactoryC seacookie message handling.");
  if (sub_10000C1D4(8, 0, 0, bytes, &length))
  {
    if (a2)
    {
      v4 = CFSTR("Unable to get mesa nonce");
      v5 = 11;
LABEL_7:
      v6 = sub_100008688(v5, v4);
      result = 0;
      *a2 = v6;
      return result;
    }
    return 0;
  }
  *a1 = CFDataCreate(kCFAllocatorDefault, bytes, length);
  AMSupportLogInternal(6, "HSCGetMesaNonce", "Mesa Nonce Size: %d", length);
  AMSupportLogInternal(6, "HSCGetMesaNonce", "Mesa Nonce: %@", *a1);
  return 1;
}

uint64_t HSCSecureProvisionMesaWithUID(const __CFURL *a1, CFDataRef theData, CFErrorRef *a3, uint64_t a4)
{
  return HSCSecureProvisionMesaWithUIDProxy(a1, 0, theData, a3, a4);
}

uint64_t HSCSecureProvisionMesaWithUIDProxy(const __CFURL *a1, const void *a2, CFDataRef theData, CFErrorRef *a4, uint64_t a5)
{
  const UInt8 *BytePtr;
  size_t Length;
  const __CFString *v12;
  int v13;

  if (!theData)
  {
    if (a4)
    {
      v12 = CFSTR("Invalid Arguments");
      v13 = 1;
      goto LABEL_7;
    }
    return 0;
  }
  BytePtr = CFDataGetBytePtr(theData);
  Length = CFDataGetLength(theData);
  AMSupportLogInternal(6, "_HSCHandleMesaMessage", "MesaFactoryC seacookie message handling.");
  if (sub_10000C1D4(9, BytePtr, Length, 0, 0))
  {
    if (a4)
    {
      v12 = CFSTR("Unable to validate tatsu ticket");
      v13 = 11;
LABEL_7:
      *a4 = sub_100008688(v13, v12);
      return 0;
    }
    return 0;
  }
  AMSupportLogInternal(6, "HSCSecureProvisionMesaWithUIDProxy", "Validate tatsu ticket succeeded.");
  return sub_1000092B0(1, a1, a2, (CFComparisonResult)&unk_1000148D8, 3, a4, a5, 0);
}

CFDataRef sub_1000098D0(const __CFData *a1)
{
  size_t Length;
  UInt8 *v3;
  size_t v4;
  UInt8 *v5;
  CFIndex v6;
  int v7;
  int v8;
  CFDataRef v9;
  CFRange v11;

  Length = CFDataGetLength(a1);
  v3 = (UInt8 *)malloc_type_malloc(Length, 0x2A0CAA11uLL);
  v4 = CFDataGetLength(a1);
  v5 = (UInt8 *)malloc_type_malloc(v4, 0x8AD36680uLL);
  v11.length = CFDataGetLength(a1);
  v11.location = 0;
  CFDataGetBytes(a1, v11, v5);
  if (v3 && CFDataGetLength(a1) >= 1)
  {
    v6 = 0;
    v7 = 0;
    do
    {
      v8 = v5[v6];
      if ((v8 - 9) >= 2)
        v3[v7++] = v8;
      ++v6;
    }
    while (CFDataGetLength(a1) > v6);
  }
  else
  {
    v7 = 0;
  }
  v9 = CFDataCreate(kCFAllocatorDefault, v3, v7);
  free(v3);
  free(v5);
  return v9;
}

uint64_t sub_1000099C8(const void *a1, const void *a2, const void *a3, int a4, const __CFData **a5, CFErrorRef *a6)
{
  __CFDictionary *Mutable;
  uint64_t v13;
  const __CFString *v14;
  const __CFData *v15;
  const __CFData *v16;
  CFIndex Length;
  const void *Value;
  CFStringRef v19;
  CFErrorRef error;

  error = 0;
  if (!a6)
    return 0;
  if (a3)
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
    {
      v13 = 1;
    }
    else
    {
      v13 = 0;
      *a6 = sub_100008688(3, CFSTR("Request Dictionary Creation failed\n"));
    }
    CFDictionarySetValue(Mutable, CFSTR("SpecVersion"), CFSTR("1.2"));
    CFDictionarySetValue(Mutable, CFSTR("UUID"), a1);
    if (a4)
    {
      AMSupportLogInternal(6, "createRequestData", "Resetting session\n");
      v14 = CFSTR("Request");
    }
    else
    {
      CFDictionarySetValue(Mutable, CFSTR("Session"), a2);
      v14 = CFSTR("Response");
    }
    CFDictionarySetValue(Mutable, v14, a3);
    AMSupportLogInternal(6, "createRequestData", "--------------------------------------------------------------\n", Mutable);
    AMSupportLogInternal(6, "createRequestData", "Request data is : %@\n", Mutable);
    AMSupportLogInternal(6, "createRequestData", "--------------------------------------------------------------\n", Mutable);
    v15 = CFPropertyListCreateData(kCFAllocatorDefault, Mutable, kCFPropertyListXMLFormat_v1_0, 0, &error);
    if (v15)
    {
      v16 = v15;
      Length = CFDataGetLength(v15);
      AMSupportLogInternal(6, "createRequestData", "XML datalen: %lu data is : %@\n", Length, v16);
      *a5 = v16;
      if (CFDictionaryContainsKey((CFDictionaryRef)a3, CFSTR("Command")))
      {
        Value = CFDictionaryGetValue((CFDictionaryRef)a3, CFSTR("Command"));
        v19 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("/tmp/%@"), Value);
        if (v19)
          CFRelease(v19);
      }
    }
    else
    {
      AMSupportLogInternal(3, "createRequestData", "CFPropertyListCreateData failed : %@\n", error);
      v13 = 0;
      *a6 = sub_100008688(10, CFSTR("CFPropertyListCreateData failed\n"));
    }
    if (Mutable)
      CFRelease(Mutable);
  }
  else
  {
    v13 = 0;
    *a6 = sub_100008688(1, CFSTR("Input argument req_dict is empty or NULL\n"));
  }
  if (error)
    CFRelease(error);
  return v13;
}

uint64_t sub_100009C4C(CFURLRef url, const __CFData *a2, CFDataRef *a3, const void *a4, CFErrorRef *a5, int a6)
{
  const void *v8;
  __CFHTTPMessage *Request;
  __CFHTTPMessage *v13;
  __CFDictionary *v14;
  uint64_t v15;
  const __CFData *v16;
  CFIndex Length;
  const __CFString *v18;
  __CFDictionary *Mutable;
  const void *SetFromCFIndexArray;
  CFNumberRef v21;
  CFDictionaryRef v22;
  uint64_t v23;
  uint64_t v24;
  CFStringRef v25;
  int v26;
  const void *Value;
  CFIndex v28;
  int v29;
  const char *BytePtr;
  CFErrorRef v31;
  const __CFString *v33;
  int v34;
  const __CFString *v35;
  CFDataRef *v36;
  CFDictionaryRef theDict;
  uint64_t v38;
  CFDataRef theData;
  CFTypeRef cf;

  theData = 0;
  cf = 0;
  theDict = 0;
  v38 = 0;
  if (!a5)
  {
    AMSupportLogInternal(3, "sendRequestSync", "Error is empty");
    v14 = 0;
    v15 = 1;
    goto LABEL_53;
  }
  v8 = a4;
  if (!a4)
  {
    v8 = (const void *)AMSupportHttpCopyProxySettings(url, 0);
    if (!v8)
      AMSupportLogInternal(6, "sendRequestSync", "Could not create proxy settings, system default proxy will be used.");
  }
  Request = CFHTTPMessageCreateRequest(kCFAllocatorDefault, CFSTR("POST"), url, kCFHTTPVersion1_1);
  if (!Request)
  {
    v15 = 0;
    v14 = 0;
    *a5 = sub_100008688(3, CFSTR("could not create httpRequest\n"));
    goto LABEL_53;
  }
  v13 = Request;
  CFHTTPMessageSetHeaderFieldValue(Request, CFSTR("Content-Type"), CFSTR("application/xml"));
  v36 = a3;
  if (a6)
  {
    if (qword_1000149D0)
      CFRelease((CFTypeRef)qword_1000149D0);
    qword_1000149D0 = 0;
  }
  else if (qword_1000149D0)
  {
    CFHTTPMessageSetHeaderFieldValue(v13, CFSTR("X-Apple-SeaCookie-IP"), (CFStringRef)qword_1000149D0);
  }
  v16 = sub_1000098D0(a2);
  CFHTTPMessageSetBody(v13, v16);
  Length = CFDataGetLength(v16);
  v18 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%lu"), Length);
  if (!v18)
  {
    v31 = sub_100008688(3, CFSTR("could not create contentLengthStr\n"));
    v14 = 0;
LABEL_70:
    v15 = 0;
    v21 = 0;
    goto LABEL_74;
  }
  CFHTTPMessageSetHeaderFieldValue(v13, CFSTR("Content-Length"), v18);
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v14 = Mutable;
  if (!Mutable)
  {
    v31 = sub_100008688(3, CFSTR("Failed to create connection options dictionary.\n"));
    goto LABEL_70;
  }
  if (v8)
    CFDictionarySetValue(Mutable, kAMSupportHttpOptionSocksProxySettings, v8);
  SetFromCFIndexArray = (const void *)AMSupportCreateSetFromCFIndexArray(&unk_100014950, 4);
  CFDictionaryAddValue(v14, kAMSupportHttpOptionValidResponses, SetFromCFIndexArray);
  if (SetFromCFIndexArray)
    CFRelease(SetFromCFIndexArray);
  v21 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &unk_100014970);
  if (v21)
  {
    CFDictionaryAddValue(v14, kAMSupportHttpOptionTimeout, v21);
    CFRelease(v21);
    v21 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &unk_100014974);
    if (v21)
    {
      CFDictionaryAddValue(v14, kAMSupportHttpOptionMaxAttempts, v21);
      CFRelease(v21);
      AMSupportLogInternal(6, "sendRequestSync", "Disabling SSL validation");
      CFDictionarySetValue(v14, kAMSupportHttpOptionDisableSSLValidation, kCFBooleanTrue);
      AMSupportLogInternal(6, "sendRequestSync", "------- CLIENT REQUEST -------\n");
      v22 = CFHTTPMessageCopyAllHeaderFields(v13);
      v21 = v22;
      if (v22)
      {
        AMSupportLogInternal(6, "sendRequestSync", "%@\n", v22);
        AMSupportLogInternal(6, "sendRequestSync", "%@\n", v16);
      }
      AMSupportLogInternal(6, "sendRequestSync", "------- END CLIENT REQUEST -------\n");
      v23 = AMSupportHttpSendSync(v13, v14, &theData, &theDict, &v38, &cf);
      if ((_DWORD)v23)
      {
        v24 = v23;
        AMSupportLogInternal(3, "sendRequestSync", "Send request status: %d http status: %ld error: %@\n", v23, v38, cf);
        v25 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("HTTP send error: %d\n"), v24);
        switch((_DWORD)v24)
        {
          case 0xB:
            v26 = 13;
            goto LABEL_44;
          case 0xC:
            v26 = 14;
            goto LABEL_44;
          case 0x10:
            v26 = 12;
LABEL_44:
            v31 = sub_100008688(v26, v25);
            v15 = 0;
            goto LABEL_45;
        }
        if (!v38 || v38 == 200)
        {
          v26 = 15;
          goto LABEL_44;
        }
LABEL_43:
        v26 = 16;
        goto LABEL_44;
      }
      if (v38 != 200)
      {
        AMSupportLogInternal(3, "sendRequestSync", "SeaCookie server returned HTTP status: %ld\n", v38);
        v25 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("SeaCookie server returned HTTP status: %ld\n"), v38);
        goto LABEL_43;
      }
      AMSupportLogInternal(6, "sendRequestSync", "HTTP Status == 200. OK\n");
      AMSupportLogInternal(6, "sendRequestSync", "------- SERVER RESPONSE -------\n");
      if (theDict)
      {
        AMSupportLogInternal(6, "sendRequestSync", "%@\n", theDict);
        if (qword_1000149D0)
        {
          CFRelease((CFTypeRef)qword_1000149D0);
          qword_1000149D0 = 0;
        }
        Value = CFDictionaryGetValue(theDict, CFSTR("X-Apple-SeaCookie-IP"));
        qword_1000149D0 = (uint64_t)Value;
        if (Value)
          CFRetain(Value);
      }
      if (theData)
      {
        v28 = CFDataGetLength(theData);
        if (v28)
        {
          v29 = v28;
          BytePtr = (const char *)CFDataGetBytePtr(theData);
          AMSupportLogInternal(6, "sendRequestSync", "%.*s", v29, BytePtr);
          *v36 = CFDataCreateCopy(kCFAllocatorDefault, theData);
          v15 = 1;
          goto LABEL_65;
        }
        AMSupportLogInternal(3, "sendRequestSync", "Content Length -- empty \n");
        *v36 = 0;
        v33 = CFSTR("Content Length Empty");
        v34 = 5;
      }
      else
      {
        *v36 = 0;
        v33 = CFSTR("SERVER RESPONSE is NULL\n");
        v34 = 4;
      }
      v15 = 0;
      *a5 = sub_100008688(v34, v33);
LABEL_65:
      AMSupportLogInternal(6, "sendRequestSync", "------- END SERVER RESPONSE -------\n");
      v25 = 0;
      if (!v16)
        goto LABEL_47;
      goto LABEL_46;
    }
    v35 = CFSTR("Failed to create max attempts\n");
  }
  else
  {
    v35 = CFSTR("Failed to create timeout\n");
  }
  v31 = sub_100008688(3, v35);
  v15 = 0;
LABEL_74:
  v25 = 0;
LABEL_45:
  *a5 = v31;
  if (v16)
LABEL_46:
    CFRelease(v16);
LABEL_47:
  if (v25)
    CFRelease(v25);
  if (v18)
    CFRelease(v18);
  CFRelease(v13);
  if (v21)
    CFRelease(v21);
LABEL_53:
  if (theData)
  {
    CFRelease(theData);
    theData = 0;
  }
  if (theDict)
  {
    CFRelease(theDict);
    theDict = 0;
  }
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  if (v14)
    CFRelease(v14);
  AMSupportLogInternal(3, "sendRequestSync", "result = %d\n", v15);
  return v15;
}

uint64_t sub_10000A2E0(CFDataRef data, CFDictionaryRef *a2, CFDataRef *a3, CFErrorRef *a4)
{
  CFPropertyListRef v7;
  uint64_t v8;
  CFTypeID v9;
  int v10;
  int v11;
  int v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFData *Value;
  const __CFString *v17;
  const __CFDictionary *v18;
  CFDictionaryRef Copy;
  const __CFDictionary *v20;
  const void *v21;
  CFStringRef v22;
  const __CFString *v23;
  int v24;
  __CFString *Mutable;
  CFTypeID v26;
  CFErrorRef error;

  error = 0;
  if (!a4)
  {
    v8 = 0;
    goto LABEL_42;
  }
  if (!data || !a2)
  {
    v8 = 0;
    *a4 = sub_100008688(1, CFSTR("DataRef or responseDict is NULL."));
    goto LABEL_40;
  }
  v7 = CFPropertyListCreateWithData(kCFAllocatorDefault, data, 0x64uLL, 0, &error);
  v8 = (uint64_t)v7;
  if (!v7)
  {
    AMSupportLogInternal(3, "parseResponse", "Create xmlData failed, error: %@", error);
    *a4 = sub_100008688(7, CFSTR("Create xmlData failed."));
    *a2 = 0;
    goto LABEL_40;
  }
  v9 = CFGetTypeID(v7);
  if (v9 == CFDictionaryGetTypeID())
  {
    AMSupportLogInternal(6, "parseResponse", "xmlData : %@", v8);
    v10 = CFDictionaryContainsKey((CFDictionaryRef)v8, CFSTR("ErrorCode"));
    v11 = CFDictionaryContainsKey((CFDictionaryRef)v8, CFSTR("ErrorMessage"));
    if (v10 != 1 && v11 != 1)
    {
      if (a3 && !*a3)
      {
        if (!CFDictionaryContainsKey((CFDictionaryRef)v8, CFSTR("Session")))
        {
          v23 = CFSTR("Server did not return session cookie");
          v24 = 9;
LABEL_29:
          *a4 = sub_100008688(v24, v23);
          goto LABEL_39;
        }
        Value = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)v8, CFSTR("Session"));
        *a3 = CFDataCreateCopy(kCFAllocatorDefault, Value);
      }
      v17 = CFSTR("Request");
      if (CFDictionaryContainsKey((CFDictionaryRef)v8, CFSTR("Request")) == 1
        || (v17 = CFSTR("Response"), CFDictionaryContainsKey((CFDictionaryRef)v8, CFSTR("Response")) == 1))
      {
        v18 = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)v8, v17);
        Copy = CFDictionaryCreateCopy(kCFAllocatorDefault, v18);
        if (Copy)
        {
          v20 = Copy;
          AMSupportLogInternal(6, "parseResponse", "Response Dictionary : %@\n", Copy);
          if (CFDictionaryContainsKey(v20, CFSTR("Command")))
          {
            v21 = CFDictionaryGetValue(v20, CFSTR("Command"));
            v22 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("/tmp/%@-from-server"), v21);
            *a2 = CFDictionaryCreateCopy(kCFAllocatorDefault, v20);
            if (v22)
              CFRelease(v22);
          }
          else
          {
            *a2 = CFDictionaryCreateCopy(kCFAllocatorDefault, v20);
          }
          CFRelease((CFTypeRef)v8);
          CFRelease(v20);
          v8 = 1;
          goto LABEL_40;
        }
      }
      AMSupportLogInternal(3, "parseResponse", "responseDict NULL. Unable to parse Response\n");
      v23 = CFSTR("responseDict NULL. Unable to parse Response\n");
      v24 = 8;
      goto LABEL_29;
    }
    v13 = v11;
    if (v10)
    {
      v14 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v8, CFSTR("ErrorCode"));
      if (v13)
      {
LABEL_13:
        v15 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v8, CFSTR("ErrorMessage"));
        AMSupportLogInternal(3, "parseResponse", "ErrorMessage - %@", v15);
        goto LABEL_32;
      }
    }
    else
    {
      v14 = 0;
      if (v11)
        goto LABEL_13;
    }
    v15 = 0;
LABEL_32:
    *a2 = 0;
    Mutable = CFStringCreateMutable(kCFAllocatorDefault, 1024);
    CFStringAppend(Mutable, CFSTR("Server returned an "));
    if (v14)
    {
      v26 = CFGetTypeID(v14);
      if (v26 == CFStringGetTypeID())
      {
        AMSupportLogInternal(3, "parseResponse", "ErrorCode is String Type");
        CFStringAppend(Mutable, CFSTR("\terrorCode: "));
        CFStringAppend(Mutable, v14);
      }
    }
    if (v15)
    {
      CFStringAppend(Mutable, CFSTR("\terrorString: "));
      CFStringAppend(Mutable, v15);
    }
    *a4 = sub_100008688(6, Mutable);
    if (Mutable)
      CFRelease(Mutable);
    goto LABEL_39;
  }
  *a4 = sub_100008688(7, CFSTR("xmlData is not CFDictionary type."));
  *a2 = 0;
LABEL_39:
  CFRelease((CFTypeRef)v8);
  v8 = 0;
LABEL_40:
  if (error)
  {
    CFRelease(error);
    error = 0;
  }
LABEL_42:
  AMSupportLogInternal(6, "parseResponse", "Exiting parse_response : %d", v8);
  return v8;
}

void sub_10000A708(id a1)
{
  os_log_t v1;
  NSObject *v2;

  v1 = os_log_create("com.apple.BiometricKit", "Library-MesaFactory");
  qword_100014990 = (uint64_t)v1;
  if (!v1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10000CD38(&v2);
      v1 = v2;
    }
    else
    {
      v1 = 0;
    }
  }
  qword_100014998 = (uint64_t)v1;
}

uint64_t sub_10000A770(mach_port_t a1, __int16 a2, __int16 a3, const void *a4, size_t a5, void *a6, _QWORD *a7)
{
  size_t v7;
  _BOOL8 v8;
  _WORD *v16;
  void *v17;
  uint64_t v18;
  NSObject *v20;
  NSObject *v21;
  _BYTE v22[12];
  __int16 v23;
  _BOOL8 v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;

  v7 = a5 + 8;
  v8 = a5 >= 0xFFFFFFFFFFFFFFF8;
  if (a5 >= 0xFFFFFFFFFFFFFFF8)
  {
    if (qword_1000149D8 != -1)
      dispatch_once(&qword_1000149D8, &stru_1000105A0);
    if (qword_100014990)
      v20 = qword_100014990;
    else
      v20 = &_os_log_default;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v22 = 136316162;
      *(_QWORD *)&v22[4] = "err == 0 ";
      v23 = 2048;
      v24 = v8;
      v25 = 2080;
      v26 = &unk_10000DEDF;
      v27 = 2080;
      v28 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      v29 = 1024;
      v30 = 64;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v22, 0x30u);
    }
    return 1;
  }
  else
  {
    v16 = malloc_type_malloc(a5 + 8, 0x6EB58E55uLL);
    if (v16)
    {
      v17 = v16;
      *v16 = 19778;
      v16[1] = a2;
      v16[2] = 1;
      v16[3] = a3;
      if (a5)
        memmove(v16 + 4, a4, a5);
      if (a7)
      {
        *(_QWORD *)v22 = *a7;
        v18 = IOConnectCallStructMethod(a1, 0, v17, v7, a6, (size_t *)v22);
        *a7 = *(_QWORD *)v22;
      }
      else
      {
        *(_QWORD *)v22 = 0;
        v18 = IOConnectCallStructMethod(a1, 0, v17, v7, a6, (size_t *)v22);
      }
      free(v17);
    }
    else
    {
      if (qword_1000149D8 != -1)
        dispatch_once(&qword_1000149D8, &stru_1000105A0);
      if (qword_100014990)
        v21 = qword_100014990;
      else
        v21 = &_os_log_default;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v22 = 136316162;
        *(_QWORD *)&v22[4] = "cmd";
        v23 = 2048;
        v24 = 0;
        v25 = 2080;
        v26 = &unk_10000DEDF;
        v27 = 2080;
        v28 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
        v29 = 1024;
        v30 = 67;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v22, 0x30u);
      }
      return 12;
    }
  }
  return v18;
}

uint64_t sub_10000AA58()
{
  int v0;
  uint64_t v1;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;

  v0 = sub_10000A770(dword_1000149A4, 2, 1, 0, 0, 0, 0);
  v1 = v0;
  if (v0)
  {
    if (qword_1000149D8 != -1)
      dispatch_once(&qword_1000149D8, &stru_1000105A0);
    if (qword_100014990)
      v3 = qword_100014990;
    else
      v3 = &_os_log_default;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136316162;
      v5 = "err == 0 ";
      v6 = 2048;
      v7 = v1;
      v8 = 2080;
      v9 = &unk_10000DEDF;
      v10 = 2080;
      v11 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      v12 = 1024;
      v13 = 95;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v4, 0x30u);
    }
  }
  return v1;
}

uint64_t sub_10000ABA4()
{
  int v0;
  int v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  unsigned int v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;

  v6 = 0;
  v5 = 4;
  v0 = sub_10000A770(dword_1000149A4, 16, 0, 0, 0, &v6, &v5);
  if (v0)
  {
    v2 = v0;
    if (qword_1000149D8 != -1)
      dispatch_once(&qword_1000149D8, &stru_1000105A0);
    if (qword_100014990)
      v3 = qword_100014990;
    else
      v3 = &_os_log_default;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v8 = "err == 0 ";
      v9 = 2048;
      v10 = v2;
      v11 = 2080;
      v12 = &unk_10000DEDF;
      v13 = 2080;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      v15 = 1024;
      v16 = 114;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else if (v5 != 4)
  {
    if (qword_1000149D8 != -1)
      dispatch_once(&qword_1000149D8, &stru_1000105A0);
    if (qword_100014990)
      v4 = qword_100014990;
    else
      v4 = &_os_log_default;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v8 = "size == sizeof(state)";
      v9 = 2048;
      v10 = 0;
      v11 = 2080;
      v12 = &unk_10000DEDF;
      v13 = 2080;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      v15 = 1024;
      v16 = 115;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    return 0;
  }
  return v6;
}

uint64_t sub_10000ADE0()
{
  const __CFDictionary *v0;
  io_service_t MatchingService;
  io_object_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;

  if (dword_1000149A4)
    goto LABEL_5;
  v0 = IOServiceMatching("AppleBiometricServices");
  MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v0);
  if (MatchingService)
  {
    v2 = MatchingService;
    v3 = IOServiceOpen(MatchingService, mach_task_self_, 0, (io_connect_t *)&dword_1000149A4);
    if (!(_DWORD)v3)
    {
      IOObjectRelease(v2);
LABEL_5:
      if (!sub_10000ABA4())
        sub_10000AA58();
      return 0;
    }
    v4 = v3;
    if (qword_1000149D8 != -1)
      dispatch_once(&qword_1000149D8, &stru_1000105A0);
    if (qword_100014990)
      v6 = qword_100014990;
    else
      v6 = &_os_log_default;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136316162;
      v8 = "err == 0 ";
      v9 = 2048;
      v10 = (int)v4;
      v11 = 2080;
      v12 = &unk_10000DEDF;
      v13 = 2080;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      v15 = 1024;
      v16 = 135;
      goto LABEL_23;
    }
  }
  else
  {
    if (qword_1000149D8 != -1)
      dispatch_once(&qword_1000149D8, &stru_1000105A0);
    v4 = 3758097084;
    if (qword_100014990)
      v6 = qword_100014990;
    else
      v6 = &_os_log_default;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136316162;
      v8 = "service";
      v9 = 2048;
      v10 = 0;
      v11 = 2080;
      v12 = &unk_10000DEDF;
      v13 = 2080;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      v15 = 1024;
      v16 = 132;
LABEL_23:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v7, 0x30u);
    }
  }
  return v4;
}

uint64_t sub_10000B03C(void *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t result;
  NSObject *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;

  if (!a1)
  {
    if (qword_1000149D8 != -1)
      dispatch_once(&qword_1000149D8, &stru_1000105A0);
    if (qword_100014990)
      v4 = qword_100014990;
    else
      v4 = &_os_log_default;
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      return 22;
    v6 = 136316162;
    v7 = "buffer";
    v8 = 2048;
    v9 = 0;
    v10 = 2080;
    v11 = &unk_10000DEDF;
    v12 = 2080;
    v13 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
    v14 = 1024;
    v15 = 298;
    goto LABEL_27;
  }
  if (!a2)
  {
    if (qword_1000149D8 != -1)
      dispatch_once(&qword_1000149D8, &stru_1000105A0);
    if (qword_100014990)
      v4 = qword_100014990;
    else
      v4 = &_os_log_default;
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      return 22;
    v6 = 136316162;
    v7 = "bufferSize";
    v8 = 2048;
    v9 = 0;
    v10 = 2080;
    v11 = &unk_10000DEDF;
    v12 = 2080;
    v13 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
    v14 = 1024;
    v15 = 299;
    goto LABEL_27;
  }
  if (!*a2)
  {
    if (qword_1000149D8 != -1)
      dispatch_once(&qword_1000149D8, &stru_1000105A0);
    if (qword_100014990)
      v4 = qword_100014990;
    else
      v4 = &_os_log_default;
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      return 22;
    v6 = 136316162;
    v7 = "*bufferSize";
    v8 = 2048;
    v9 = 0;
    v10 = 2080;
    v11 = &unk_10000DEDF;
    v12 = 2080;
    v13 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
    v14 = 1024;
    v15 = 300;
LABEL_27:
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v6, 0x30u);
    return 22;
  }
  v2 = sub_10000A770(dword_1000149A4, 34, 0, 0, 0, a1, a2);
  result = 0;
  if ((_DWORD)v2)
  {
    if (qword_1000149D8 != -1)
      dispatch_once(&qword_1000149D8, &stru_1000105A0);
    if (qword_100014990)
      v5 = qword_100014990;
    else
      v5 = &_os_log_default;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136316162;
      v7 = "err == 0 ";
      v8 = 2048;
      v9 = (int)v2;
      v10 = 2080;
      v11 = &unk_10000DEDF;
      v12 = 2080;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      v14 = 1024;
      v15 = 303;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v6, 0x30u);
    }
    return v2;
  }
  return result;
}

uint64_t sub_10000B3EC(void *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t result;
  NSObject *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;

  if (!a1)
  {
    if (qword_1000149D8 != -1)
      dispatch_once(&qword_1000149D8, &stru_1000105A0);
    if (qword_100014990)
      v4 = qword_100014990;
    else
      v4 = &_os_log_default;
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      return 22;
    v6 = 136316162;
    v7 = "buffer";
    v8 = 2048;
    v9 = 0;
    v10 = 2080;
    v11 = &unk_10000DEDF;
    v12 = 2080;
    v13 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
    v14 = 1024;
    v15 = 317;
    goto LABEL_27;
  }
  if (!a2)
  {
    if (qword_1000149D8 != -1)
      dispatch_once(&qword_1000149D8, &stru_1000105A0);
    if (qword_100014990)
      v4 = qword_100014990;
    else
      v4 = &_os_log_default;
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      return 22;
    v6 = 136316162;
    v7 = "bufferSize";
    v8 = 2048;
    v9 = 0;
    v10 = 2080;
    v11 = &unk_10000DEDF;
    v12 = 2080;
    v13 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
    v14 = 1024;
    v15 = 318;
    goto LABEL_27;
  }
  if (!*a2)
  {
    if (qword_1000149D8 != -1)
      dispatch_once(&qword_1000149D8, &stru_1000105A0);
    if (qword_100014990)
      v4 = qword_100014990;
    else
      v4 = &_os_log_default;
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      return 22;
    v6 = 136316162;
    v7 = "*bufferSize";
    v8 = 2048;
    v9 = 0;
    v10 = 2080;
    v11 = &unk_10000DEDF;
    v12 = 2080;
    v13 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
    v14 = 1024;
    v15 = 319;
LABEL_27:
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v6, 0x30u);
    return 22;
  }
  v2 = sub_10000A770(dword_1000149A4, 59, 0, 0, 0, a1, a2);
  result = 0;
  if ((_DWORD)v2)
  {
    if (qword_1000149D8 != -1)
      dispatch_once(&qword_1000149D8, &stru_1000105A0);
    if (qword_100014990)
      v5 = qword_100014990;
    else
      v5 = &_os_log_default;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136316162;
      v7 = "err == 0 ";
      v8 = 2048;
      v9 = (int)v2;
      v10 = 2080;
      v11 = &unk_10000DEDF;
      v12 = 2080;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      v14 = 1024;
      v15 = 322;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v6, 0x30u);
    }
    return v2;
  }
  return result;
}

uint64_t sub_10000B79C(int *a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  os_log_type_t v9;
  NSObject *v11;
  int v12;
  _BYTE v13[10];
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;

  if (qword_1000149D8 != -1)
    dispatch_once(&qword_1000149D8, &stru_1000105A0);
  if (qword_100014998)
    v2 = qword_100014998;
  else
    v2 = &_os_log_default;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 134217984;
    *(_QWORD *)v13 = a1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "getSensorProvisioningState %p\n", (uint8_t *)&v12, 0xCu);
  }
  if (a1)
  {
    if (byte_1000149A1)
    {
      v3 = 0;
      *a1 = dword_100014978;
    }
    else
    {
      v3 = sub_10000ADE0();
      if ((_DWORD)v3)
      {
        if (qword_1000149D8 != -1)
          dispatch_once(&qword_1000149D8, &stru_1000105A0);
        if (qword_100014990)
          v11 = qword_100014990;
        else
          v11 = &_os_log_default;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v12 = 136316162;
          *(_QWORD *)v13 = "err == 0 ";
          *(_WORD *)&v13[8] = 2048;
          v14 = (int)v3;
          v15 = 2080;
          v16 = &unk_10000DEDF;
          v17 = 2080;
          v18 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
          v19 = 1024;
          v20 = 402;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v12, 0x30u);
        }
      }
      else
      {
        *a1 = sub_10000ABA4();
      }
    }
  }
  else
  {
    v3 = 3758097090;
  }
  if (dword_1000149A4)
  {
    IOServiceClose(dword_1000149A4);
    dword_1000149A4 = 0;
  }
  if ((_DWORD)v3)
  {
    if (qword_1000149D8 != -1)
      dispatch_once(&qword_1000149D8, &stru_1000105A0);
    if (qword_100014998)
      v4 = qword_100014998;
    else
      v4 = &_os_log_default;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      if (a1)
        v5 = *a1;
      else
        v5 = -1;
      v12 = 67109376;
      *(_DWORD *)v13 = v3;
      *(_WORD *)&v13[4] = 1024;
      *(_DWORD *)&v13[6] = v5;
      v8 = v4;
      v9 = OS_LOG_TYPE_ERROR;
LABEL_36:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "getSensorProvisioningState -> %{errno}d %d\n", (uint8_t *)&v12, 0xEu);
    }
  }
  else
  {
    if (qword_1000149D8 != -1)
      dispatch_once(&qword_1000149D8, &stru_1000105A0);
    if (qword_100014998)
      v6 = qword_100014998;
    else
      v6 = &_os_log_default;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (a1)
        v7 = *a1;
      else
        v7 = -1;
      v12 = 67109376;
      *(_DWORD *)v13 = 0;
      *(_WORD *)&v13[4] = 1024;
      *(_DWORD *)&v13[6] = v7;
      v8 = v6;
      v9 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_36;
    }
  }
  return v3;
}

uint64_t sub_10000BABC(char *a1, _QWORD *a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  NSObject *v10;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  _QWORD *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;

  if (qword_1000149D8 != -1)
    dispatch_once(&qword_1000149D8, &stru_1000105A0);
  if (qword_100014998)
    v4 = qword_100014998;
  else
    v4 = &_os_log_default;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134218240;
    v14 = a1;
    v15 = 2048;
    v16 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "getModuleSerialNumber %p %p\n", (uint8_t *)&v13, 0x16u);
  }
  v5 = sub_10000ADE0();
  if ((_DWORD)v5)
  {
    v6 = v5;
    if (qword_1000149D8 != -1)
      dispatch_once(&qword_1000149D8, &stru_1000105A0);
    if (qword_100014990)
      v12 = qword_100014990;
    else
      v12 = &_os_log_default;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 136316162;
      v14 = "err == 0 ";
      v15 = 2048;
      v16 = (_QWORD *)(int)v6;
      v17 = 2080;
      v18 = &unk_10000DEDF;
      v19 = 2080;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      v21 = 1024;
      v22 = 622;
LABEL_43:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v13, 0x30u);
    }
  }
  else
  {
    v6 = sub_10000B03C(a1, a2);
    if ((_DWORD)v6)
    {
      if (qword_1000149D8 != -1)
        dispatch_once(&qword_1000149D8, &stru_1000105A0);
      v12 = qword_100014990 ? qword_100014990 : &_os_log_default;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = 136316162;
        v14 = "err == 0 ";
        v15 = 2048;
        v16 = (_QWORD *)(int)v6;
        v17 = 2080;
        v18 = &unk_10000DEDF;
        v19 = 2080;
        v20 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
        v21 = 1024;
        v22 = 624;
        goto LABEL_43;
      }
    }
  }
  if (dword_1000149A4)
  {
    IOServiceClose(dword_1000149A4);
    dword_1000149A4 = 0;
  }
  if ((_DWORD)v6)
  {
    if (qword_1000149D8 != -1)
      dispatch_once(&qword_1000149D8, &stru_1000105A0);
    if (qword_100014998)
      v7 = qword_100014998;
    else
      v7 = &_os_log_default;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v13 = 67109120;
      LODWORD(v14) = v6;
      v8 = v7;
      v9 = OS_LOG_TYPE_ERROR;
LABEL_27:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "getModuleSerialNumber -> %{errno}d\n", (uint8_t *)&v13, 8u);
    }
  }
  else
  {
    if (qword_1000149D8 != -1)
      dispatch_once(&qword_1000149D8, &stru_1000105A0);
    if (qword_100014998)
      v10 = qword_100014998;
    else
      v10 = &_os_log_default;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 67109120;
      LODWORD(v14) = 0;
      v8 = v10;
      v9 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_27;
    }
  }
  return v6;
}

uint64_t sub_10000BE48(char *a1, _QWORD *a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  NSObject *v10;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  _QWORD *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;

  if (qword_1000149D8 != -1)
    dispatch_once(&qword_1000149D8, &stru_1000105A0);
  if (qword_100014998)
    v4 = qword_100014998;
  else
    v4 = &_os_log_default;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134218240;
    v14 = a1;
    v15 = 2048;
    v16 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "getSensorSerialNumber %p %p\n", (uint8_t *)&v13, 0x16u);
  }
  v5 = sub_10000ADE0();
  if ((_DWORD)v5)
  {
    v6 = v5;
    if (qword_1000149D8 != -1)
      dispatch_once(&qword_1000149D8, &stru_1000105A0);
    if (qword_100014990)
      v12 = qword_100014990;
    else
      v12 = &_os_log_default;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 136316162;
      v14 = "err == 0 ";
      v15 = 2048;
      v16 = (_QWORD *)(int)v6;
      v17 = 2080;
      v18 = &unk_10000DEDF;
      v19 = 2080;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      v21 = 1024;
      v22 = 645;
LABEL_43:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v13, 0x30u);
    }
  }
  else
  {
    v6 = sub_10000B3EC(a1, a2);
    if ((_DWORD)v6)
    {
      if (qword_1000149D8 != -1)
        dispatch_once(&qword_1000149D8, &stru_1000105A0);
      v12 = qword_100014990 ? qword_100014990 : &_os_log_default;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = 136316162;
        v14 = "err == 0 ";
        v15 = 2048;
        v16 = (_QWORD *)(int)v6;
        v17 = 2080;
        v18 = &unk_10000DEDF;
        v19 = 2080;
        v20 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
        v21 = 1024;
        v22 = 647;
        goto LABEL_43;
      }
    }
  }
  if (dword_1000149A4)
  {
    IOServiceClose(dword_1000149A4);
    dword_1000149A4 = 0;
  }
  if ((_DWORD)v6)
  {
    if (qword_1000149D8 != -1)
      dispatch_once(&qword_1000149D8, &stru_1000105A0);
    if (qword_100014998)
      v7 = qword_100014998;
    else
      v7 = &_os_log_default;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v13 = 67109120;
      LODWORD(v14) = v6;
      v8 = v7;
      v9 = OS_LOG_TYPE_ERROR;
LABEL_27:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "getSensorSerialNumber -> %{errno}d\n", (uint8_t *)&v13, 8u);
    }
  }
  else
  {
    if (qword_1000149D8 != -1)
      dispatch_once(&qword_1000149D8, &stru_1000105A0);
    if (qword_100014998)
      v10 = qword_100014998;
    else
      v10 = &_os_log_default;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 67109120;
      LODWORD(v14) = 0;
      v8 = v10;
      v9 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_27;
    }
  }
  return v6;
}

uint64_t sub_10000C1D4(int a1, const void *a2, size_t a3, void *a4, uint64_t *a5)
{
  __objc2_meth_list *v10;
  __objc2_meth_list *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  _QWORD *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v27;
  size_t size;
  uint8_t buf[4];
  _BYTE v30[44];

  v10 = &OBJC_INSTANCE_METHODS_NSObject;
  if (qword_1000149D8 != -1)
    dispatch_once(&qword_1000149D8, &stru_1000105A0);
  v11 = &OBJC_INSTANCE_METHODS_NSObject;
  if (qword_100014998)
    v12 = qword_100014998;
  else
    v12 = &_os_log_default;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110144;
    *(_DWORD *)v30 = a1;
    *(_WORD *)&v30[4] = 2048;
    *(_QWORD *)&v30[6] = a2;
    *(_WORD *)&v30[14] = 2048;
    *(_QWORD *)&v30[16] = a3;
    *(_WORD *)&v30[24] = 2048;
    *(_QWORD *)&v30[26] = a4;
    *(_WORD *)&v30[34] = 2048;
    *(_QWORD *)&v30[36] = a5;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "seaCookieHandleMessage %d %p %zu %p %p\n", buf, 0x30u);
  }
  size = 0;
  if ((a1 & 0xFFFFFFF7) != 0 && !a2)
  {
    if (qword_1000149D8 != -1)
      dispatch_once(&qword_1000149D8, &stru_1000105A0);
    v18 = 3758097090;
    if (qword_100014990)
      v21 = qword_100014990;
    else
      v21 = &_os_log_default;
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_99;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v30 = "(type == kMesaFactorySeaCookieMessageS0) || (type == kMesaFactorySeaCookieGenerateNonce) || message";
    *(_WORD *)&v30[8] = 2048;
    *(_QWORD *)&v30[10] = 0;
    *(_WORD *)&v30[18] = 2080;
    *(_QWORD *)&v30[20] = &unk_10000DEDF;
    *(_WORD *)&v30[28] = 2080;
    *(_QWORD *)&v30[30] = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
    *(_WORD *)&v30[38] = 1024;
    *(_DWORD *)&v30[40] = 801;
LABEL_88:
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_99:
    if (*(_QWORD *)&v10[315] != -1)
      dispatch_once(&qword_1000149D8, &stru_1000105A0);
    if (v11[307])
      v24 = v11[307];
    else
      v24 = &_os_log_default;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v30 = a1;
      *(_WORD *)&v30[4] = 1024;
      *(_DWORD *)&v30[6] = v18;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "seaCookieHandleMessage, type=%d -> 0x%x\n", buf, 0xEu);
    }
    return v18;
  }
  if ((a1 & 0xFFFFFFF7) != 0 && !a3)
  {
    if (qword_1000149D8 != -1)
      dispatch_once(&qword_1000149D8, &stru_1000105A0);
    v18 = 3758097090;
    if (qword_100014990)
      v21 = qword_100014990;
    else
      v21 = &_os_log_default;
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_99;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v30 = "(type == kMesaFactorySeaCookieMessageS0) || (type == kMesaFactorySeaCookieGenerateNonce) || messageLength";
    *(_WORD *)&v30[8] = 2048;
    *(_QWORD *)&v30[10] = 0;
    *(_WORD *)&v30[18] = 2080;
    *(_QWORD *)&v30[20] = &unk_10000DEDF;
    *(_WORD *)&v30[28] = 2080;
    *(_QWORD *)&v30[30] = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
    *(_WORD *)&v30[38] = 1024;
    *(_DWORD *)&v30[40] = 802;
    goto LABEL_88;
  }
  if (a1 != 9 && !a4)
  {
    if (qword_1000149D8 != -1)
      dispatch_once(&qword_1000149D8, &stru_1000105A0);
    v18 = 3758097090;
    if (qword_100014990)
      v21 = qword_100014990;
    else
      v21 = &_os_log_default;
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_99;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v30 = "(type == kMesaFactorySeaCookieValidateTatsuTicket) || reply";
    *(_WORD *)&v30[8] = 2048;
    *(_QWORD *)&v30[10] = 0;
    *(_WORD *)&v30[18] = 2080;
    *(_QWORD *)&v30[20] = &unk_10000DEDF;
    *(_WORD *)&v30[28] = 2080;
    *(_QWORD *)&v30[30] = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
    *(_WORD *)&v30[38] = 1024;
    *(_DWORD *)&v30[40] = 803;
    goto LABEL_88;
  }
  if (a1 != 9 && !a5)
  {
    if (qword_1000149D8 != -1)
      dispatch_once(&qword_1000149D8, &stru_1000105A0);
    v18 = 3758097090;
    if (qword_100014990)
      v21 = qword_100014990;
    else
      v21 = &_os_log_default;
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_99;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v30 = "(type == kMesaFactorySeaCookieValidateTatsuTicket) || replySize";
    *(_WORD *)&v30[8] = 2048;
    *(_QWORD *)&v30[10] = 0;
    *(_WORD *)&v30[18] = 2080;
    *(_QWORD *)&v30[20] = &unk_10000DEDF;
    *(_WORD *)&v30[28] = 2080;
    *(_QWORD *)&v30[30] = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
    *(_WORD *)&v30[38] = 1024;
    *(_DWORD *)&v30[40] = 804;
    goto LABEL_88;
  }
  if (qword_1000149D8 != -1)
    dispatch_once(&qword_1000149D8, &stru_1000105A0);
  if (qword_100014990)
    v13 = qword_100014990;
  else
    v13 = &_os_log_default;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)v30 = a3;
    *(_WORD *)&v30[8] = 1040;
    *(_DWORD *)&v30[10] = a3;
    *(_WORD *)&v30[14] = 2096;
    *(_QWORD *)&v30[16] = a2;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "seaCookieHandleMessage message[%zu] %.*P\n", buf, 0x1Cu);
  }
  v14 = sub_10000ADE0();
  if ((_DWORD)v14)
  {
    v18 = v14;
    if (qword_1000149D8 != -1)
      dispatch_once(&qword_1000149D8, &stru_1000105A0);
    if (qword_100014990)
      v21 = qword_100014990;
    else
      v21 = &_os_log_default;
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_99;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v30 = "err == 0 ";
    *(_WORD *)&v30[8] = 2048;
    *(_QWORD *)&v30[10] = (int)v18;
    *(_WORD *)&v30[18] = 2080;
    *(_QWORD *)&v30[20] = &unk_10000DEDF;
    *(_WORD *)&v30[28] = 2080;
    *(_QWORD *)&v30[30] = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
    *(_WORD *)&v30[38] = 1024;
    *(_DWORD *)&v30[40] = 809;
    goto LABEL_88;
  }
  if (a3 >= 0xFFFFFFFFFFFFFFF4)
  {
    if (qword_1000149D8 != -1)
      dispatch_once(&qword_1000149D8, &stru_1000105A0);
    if (qword_100014990)
      v22 = qword_100014990;
    else
      v22 = &_os_log_default;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v30 = "err == 0 ";
      *(_WORD *)&v30[8] = 2048;
      *(_QWORD *)&v30[10] = a3 >= 0xFFFFFFFFFFFFFFF4;
      *(_WORD *)&v30[18] = 2080;
      *(_QWORD *)&v30[20] = &unk_10000DEDF;
      *(_WORD *)&v30[28] = 2080;
      *(_QWORD *)&v30[30] = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      *(_WORD *)&v30[38] = 1024;
      *(_DWORD *)&v30[40] = 812;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v18 = 1;
    v10 = &OBJC_INSTANCE_METHODS_NSObject;
    goto LABEL_99;
  }
  size = 8200;
  v15 = (char *)malloc_type_malloc(a3 + 12, 0xB130E8DAuLL);
  if (!v15)
  {
    v10 = &OBJC_INSTANCE_METHODS_NSObject;
    if (qword_1000149D8 != -1)
      dispatch_once(&qword_1000149D8, &stru_1000105A0);
    if (qword_100014990)
      v21 = qword_100014990;
    else
      v21 = &_os_log_default;
    v18 = 3758097085;
    v11 = &OBJC_INSTANCE_METHODS_NSObject;
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_99;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v30 = "inData";
    *(_WORD *)&v30[8] = 2048;
    *(_QWORD *)&v30[10] = 0;
    *(_WORD *)&v30[18] = 2080;
    *(_QWORD *)&v30[20] = &unk_10000DEDF;
    *(_WORD *)&v30[28] = 2080;
    *(_QWORD *)&v30[30] = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
    *(_WORD *)&v30[38] = 1024;
    *(_DWORD *)&v30[40] = 818;
    goto LABEL_88;
  }
  v16 = v15;
  v17 = malloc_type_malloc(size, 0x5D20F1DEuLL);
  *(_DWORD *)v16 = a1;
  *(_QWORD *)(v16 + 4) = a3;
  memcpy(v16 + 12, a2, a3);
  v18 = sub_10000A770(dword_1000149A4, 77, 0, v16, a3 + 12, v17, &size);
  if ((_DWORD)v18)
  {
    if (qword_1000149D8 != -1)
      dispatch_once(&qword_1000149D8, &stru_1000105A0);
    if (qword_100014990)
      v23 = qword_100014990;
    else
      v23 = &_os_log_default;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v30 = "err == 0 ";
      *(_WORD *)&v30[8] = 2048;
      *(_QWORD *)&v30[10] = (int)v18;
      *(_WORD *)&v30[18] = 2080;
      *(_QWORD *)&v30[20] = &unk_10000DEDF;
      *(_WORD *)&v30[28] = 2080;
      *(_QWORD *)&v30[30] = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      *(_WORD *)&v30[38] = 1024;
      *(_DWORD *)&v30[40] = 828;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
LABEL_96:
    free(v16);
    if (!v17)
      goto LABEL_98;
    goto LABEL_97;
  }
  if (!a4 || !a5)
    goto LABEL_96;
  if ((unint64_t)*a5 < *v17)
  {
    if (qword_1000149D8 != -1)
      dispatch_once(&qword_1000149D8, &stru_1000105A0);
    if (qword_100014990)
      v27 = qword_100014990;
    else
      v27 = &_os_log_default;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v30 = "*replySize >= outData->dataSize";
      *(_WORD *)&v30[8] = 2048;
      *(_QWORD *)&v30[10] = 0;
      *(_WORD *)&v30[18] = 2080;
      *(_QWORD *)&v30[20] = &unk_10000DEDF;
      *(_WORD *)&v30[28] = 2080;
      *(_QWORD *)&v30[30] = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      *(_WORD *)&v30[38] = 1024;
      *(_DWORD *)&v30[40] = 832;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v18 = 3758097115;
  }
  else
  {
    memcpy(a4, v17 + 1, *v17);
    *a5 = *v17;
    if (qword_1000149D8 != -1)
      dispatch_once(&qword_1000149D8, &stru_1000105A0);
    if (qword_100014990)
      v19 = qword_100014990;
    else
      v19 = &_os_log_default;
    v18 = 0;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *a5;
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v30 = a1;
      *(_WORD *)&v30[4] = 2048;
      *(_QWORD *)&v30[6] = v20;
      *(_WORD *)&v30[14] = 1040;
      *(_DWORD *)&v30[16] = v20;
      *(_WORD *)&v30[20] = 2096;
      *(_QWORD *)&v30[22] = a4;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "seaCookieHandleMessage, type=%d reply[%zu] %.*P\n", buf, 0x22u);
      v18 = 0;
    }
  }
  free(v16);
LABEL_97:
  free(v17);
LABEL_98:
  v11 = &OBJC_INSTANCE_METHODS_NSObject;
  v10 = &OBJC_INSTANCE_METHODS_NSObject;
  if ((_DWORD)v18)
    goto LABEL_99;
  if (qword_1000149D8 != -1)
    dispatch_once(&qword_1000149D8, &stru_1000105A0);
  if (qword_100014998)
    v25 = qword_100014998;
  else
    v25 = &_os_log_default;
  v18 = 0;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v30 = a1;
    *(_WORD *)&v30[4] = 1024;
    *(_DWORD *)&v30[6] = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "seaCookieHandleMessage, type=%d -> 0x%x\n", buf, 0xEu);
    return 0;
  }
  return v18;
}

void sub_10000CD38(_QWORD *a1)
{
  uint8_t v2[16];

  *(_WORD *)v2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Couldn't create OS Log for 'com.apple.BiometricKit.Library-MesaFactory'!\n", v2, 2u);
  *a1 = qword_100014990;
}

void sub_10000CD94(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004968((void *)&_mh_execute_header, a1, a3, "URL is invalid", a5, a6, a7, a8, 0);
}

void sub_10000CDC8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005864();
  sub_100004968((void *)&_mh_execute_header, v0, v1, "Unable to get current mesa provisioning state", v2, v3, v4, v5, v6);
  sub_10000585C();
}

void sub_10000CDF4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005870((void *)&_mh_execute_header, a2, a3, "Failed to get mesa nonce with error %@", a5, a6, a7, a8, 2u);
  sub_100005890();
}

void sub_10000CE58()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005864();
  sub_100004968((void *)&_mh_execute_header, v0, v1, "Failed to get default AMAuthInstallRef", v2, v3, v4, v5, v6);
  sub_10000585C();
}

void sub_10000CE84(uint64_t a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  uint64_t v4;

  v2[0] = 67109378;
  v2[1] = 0;
  v3 = 2112;
  v4 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Fail to provision mesa: %i error: %@", (uint8_t *)v2, 0x12u);
  sub_100005890();
}

void sub_10000CF00(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005870((void *)&_mh_execute_header, a2, a3, "Failed to initialize personalization manager with error %@", a5, a6, a7, a8, 2u);
  sub_100005890();
}

void sub_10000CF64(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005880((void *)&_mh_execute_header, a2, a3, "Failed to set SEP nonce with error %d", a5, a6, a7, a8, 0);
  sub_10000585C();
}

void sub_10000CFC8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005864();
  sub_100004968((void *)&_mh_execute_header, v0, v1, "Failed to enable single sign on", v2, v3, v4, v5, v6);
  sub_10000585C();
}

void sub_10000CFF4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005880((void *)&_mh_execute_header, a2, a3, "Failed to set TATSU server URL with error %d", a5, a6, a7, a8, 0);
  sub_10000585C();
}

void sub_10000D058()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005864();
  sub_100004968((void *)&_mh_execute_header, v0, v1, "Unable to get mesa serial number", v2, v3, v4, v5, v6);
  sub_10000585C();
}

void sub_10000D084()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005864();
  sub_100004968((void *)&_mh_execute_header, v0, v1, "Unable to get mesa provisioning state", v2, v3, v4, v5, v6);
  sub_10000585C();
}

id objc_msgSend_SCPairURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SCPairURL");
}

id objc_msgSend_TatsuURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "TatsuURL");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__filterSeaCookieServerUrl_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_filterSeaCookieServerUrl:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dk_BOOLFromKey_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_BOOLFromKey:defaultValue:failed:");
}

id objc_msgSend_dk_stringFromKey_maxLength_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_stringFromKey:maxLength:defaultValue:failed:");
}

id objc_msgSend_enableSSO_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableSSO:");
}

id objc_msgSend_getApTicketForSeaCookiePairingWithOptions_pairingTicket_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getApTicketForSeaCookiePairingWithOptions:pairingTicket:error:");
}

id objc_msgSend_getDefaultAMAuthInstallRef(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDefaultAMAuthInstallRef");
}

id objc_msgSend_getInnermostNSError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getInnermostNSError:");
}

id objc_msgSend_hasEntitlementBoolForTag_inAPTicket_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasEntitlementBoolForTag:inAPTicket:");
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "host");
}

id objc_msgSend_initWithAuthInstallObj_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAuthInstallObj:");
}

id objc_msgSend_initWithBase64EncodedString_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBase64EncodedString:options:");
}

id objc_msgSend_initWithBytes_length_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytes:length:encoding:");
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputs");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheme");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setInputs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInputs:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_shouldPersonalizeWithSSOByDefault(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldPersonalizeWithSSOByDefault");
}

id objc_msgSend_sign_keyBlob_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sign:keyBlob:");
}

id objc_msgSend_signingKeyBlob(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signingKeyBlob");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_useAppleConnect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "useAppleConnect");
}
