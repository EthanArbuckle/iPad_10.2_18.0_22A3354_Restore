void sub_1D33CC634(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void PPMCallbackHandler(void *a1, uint64_t a2, int a3, unint64_t a4)
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void (**v22)(void);
  void *v23;
  char *v24;
  uint64_t v25;
  _DWORD *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  NSObject *v35;
  const char *v36;
  unint64_t v37;
  char *v38;
  char v39;
  int v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  const __CFString *v45;
  uint64_t v46;
  int v47;
  NSObject *v48;
  uint64_t j;
  _BYTE *v50;
  _QWORD *v51;
  uint64_t v52;
  _BYTE *v53;
  uint64_t k;
  uint64_t v55;
  void *v56;
  NSObject *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  NSObject *v62;
  uint64_t v63;
  void (**v64)(_QWORD, _QWORD);
  void *v65;
  uint64_t input;
  size_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t buf[4];
  uint64_t v77;
  __int16 v78;
  id v79;
  _BYTE v80[9];
  _BYTE inputStruct[18];
  __int16 v82;
  unint64_t v83;
  unsigned __int8 v84;
  _BYTE v85[341];
  int v86;
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  if (a3 != -528318201 && a3 != -528318206)
    return;
  v6 = a1;
  if (a3 != -528318201)
  {
    if (a3 == -528318206)
    {
      v7 = (void *)MEMORY[0x1D824E9A0]();
      v72 = 0u;
      v73 = 0u;
      v74 = 0u;
      v75 = 0u;
      objc_msgSend(v6, "clientSet");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v72, v88, 16);
      if (v9)
      {
        v10 = v9;
        v11 = v7;
        v12 = HIBYTE(a4);
        v13 = *(_QWORD *)v73;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v73 != v13)
              objc_enumerationMutation(v8);
            v15 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
            if ((_DWORD)v12 == objc_msgSend((id)objc_opt_class(), "CPMSClientIdToPPMClientId:", objc_msgSend(v15, "clientId")))
            {
              objc_msgSend(v15, "getCurrentPower");
              v22 = (void (**)(void))objc_claimAutoreleasedReturnValue();
              v22[2]();
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = (void *)objc_msgSend(v23, "copy");

              +[CPMSAgent log](CPMSAgent, "log");
              v24 = (char *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEBUG))
                PPMCallbackHandler_cold_2(v15, v24);

              v25 = 0;
              *(_QWORD *)&inputStruct[9] = 0;
              *(_QWORD *)&inputStruct[2] = 0;
              inputStruct[0] = v12;
              inputStruct[1] = 3;
              v26 = &inputStruct[3];
              do
              {
                objc_msgSend(v6, "PPMIndexToCPMSPowerTimeScale:", (char)v25);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "valueForKey:", v27);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                if (v28)
                {
                  objc_msgSend(v16, "objectForKeyedSubscript:", v27);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v29 = 0;
                }

                *((_BYTE *)v26 - 1) = v25;
                *v26 = objc_msgSend(v29, "unsignedIntValue");
                v26 = (_DWORD *)((char *)v26 + 5);

                ++v25;
              }
              while (v25 != 3);
              if (IOConnectCallStructMethod(objc_msgSend(v6, "connect"), 0x21u, inputStruct, 0x11uLL, 0, 0))
              {
                +[CPMSAgent log](CPMSAgent, "log");
                v30 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                  PPMCallbackHandler_cold_1();

              }
              v7 = v11;
              goto LABEL_80;
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v72, v88, 16);
          if (v10)
            continue;
          break;
        }
        v7 = v11;
      }
      goto LABEL_81;
    }
    goto LABEL_82;
  }
  v7 = (void *)MEMORY[0x1D824E9A0]();
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  objc_msgSend(v6, "clientSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v68, v87, 16);
  if (!v17)
    goto LABEL_80;
  v18 = v17;
  v65 = v7;
  v19 = *(_QWORD *)v69;
LABEL_16:
  v20 = 0;
  while (1)
  {
    if (*(_QWORD *)v69 != v19)
      objc_enumerationMutation(v16);
    v21 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v20);
    if (HIBYTE(a4) == objc_msgSend((id)objc_opt_class(), "CPMSClientIdToPPMClientId:", objc_msgSend(v21, "clientId")))break;
    if (v18 == ++v20)
    {
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v68, v87, 16);
      if (!v18)
        goto LABEL_80;
      goto LABEL_16;
    }
  }
  +[CPMSAgent log](CPMSAgent, "log");
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    v32 = objc_msgSend(v21, "clientId");
    *(_DWORD *)inputStruct = 134218496;
    *(_QWORD *)&inputStruct[4] = v32;
    *(_WORD *)&inputStruct[12] = 1024;
    *(_DWORD *)&inputStruct[14] = -528318201;
    v82 = 2048;
    v83 = a4;
    _os_log_impl(&dword_1D33CB000, v31, OS_LOG_TYPE_INFO, "<Info> CPMS clientId %llu msg type 0x%x, msg 0x%016llx\n", inputStruct, 0x1Cu);
  }

  bzero(inputStruct, 0x610uLL);
  input = HIBYTE(a4);
  v67 = 1552;
  v33 = (const char *)IOConnectCallMethod(objc_msgSend(v6, "connect"), 0x1Du, &input, 1u, 0, 0, 0, 0, inputStruct, &v67);
  if ((_DWORD)v33)
  {
    v34 = v33;
    +[CPMSAgent log](CPMSAgent, "log");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      PPMCallbackHandler_cold_4(v21, v34, v35);
    goto LABEL_77;
  }
  v36 = (const char *)a4;
  if (!v84)
  {
    if ((a4 & 8) == 0)
      goto LABEL_58;
    goto LABEL_61;
  }
  v37 = 0;
  v38 = v85;
  v39 = 1;
  do
  {
    v40 = *v38;
    if (((a4 >> *v38) & 1) == 0)
      goto LABEL_53;
    v41 = *(unsigned int *)(v38 + 1);
    if (v40 == 2)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v41);
      v42 = objc_claimAutoreleasedReturnValue();
      v43 = v8;
      v44 = v42;
      v45 = CFSTR("cpms_ts_1000");
    }
    else if (v40 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v41);
      v42 = objc_claimAutoreleasedReturnValue();
      v43 = v8;
      v44 = v42;
      v45 = CFSTR("cpms_ts_100");
    }
    else
    {
      if (*v38)
      {
        +[CPMSAgent log](CPMSAgent, "log", v41);
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          v46 = objc_msgSend(v21, "clientId");
          v47 = *v38;
          *(_DWORD *)buf = 134218240;
          v77 = v46;
          v78 = 1024;
          LODWORD(v79) = v47;
          _os_log_error_impl(&dword_1D33CB000, v42, OS_LOG_TYPE_ERROR, "<Error> CPMS clientId %lu timescale %d", buf, 0x12u);
        }
        goto LABEL_52;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v41);
      v42 = objc_claimAutoreleasedReturnValue();
      v43 = v8;
      v44 = v42;
      v45 = CFSTR("cpms_ts_i");
    }
    objc_msgSend(v43, "setObject:forKeyedSubscript:", v44, v45);
LABEL_52:

    v39 = 0;
LABEL_53:
    ++v37;
    v38 += 5;
  }
  while (v37 < v84);
  if ((a4 & 8) != 0)
  {
LABEL_61:
    if (v86 >= 1)
    {
      for (j = 0; j < v86; ++j)
      {
        v50 = &v85[16 * j + 213];
        v52 = *((_QWORD *)v50 + 1);
        v51 = v50 + 8;
        if (v52)
        {
          v53 = v80;
          for (k = 56; k != -8; k -= 8)
          {
            v55 = *v51 >> k;
            if ((_BYTE)v55)
              *v53++ = v55;
          }
          *v53 = 0;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%s"), CFSTR("cpms_ts_thermal"), v80);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          +[CPMSAgent log](CPMSAgent, "log");
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
          {
            v58 = objc_msgSend(v21, "clientId");
            *(_DWORD *)buf = 134218242;
            v77 = v58;
            v78 = 2112;
            v79 = v56;
            _os_log_impl(&dword_1D33CB000, v57, OS_LOG_TYPE_INFO, "<Info> CPMS clientId %lu, adding budget for %@", buf, 0x16u);
          }

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)&v85[16 * j + 217]);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v59, v56);

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)&v85[16 * j + 217]);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v60, CFSTR("cpms_ts_thermal"));

        }
      }
    }
    goto LABEL_73;
  }
  if ((v39 & 1) == 0)
    goto LABEL_73;
LABEL_58:
  +[CPMSAgent log](CPMSAgent, "log");
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    PPMCallbackHandler_cold_3(v21, v36, v48);

LABEL_73:
  +[CPMSAgent log](CPMSAgent, "log");
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    v61 = objc_msgSend(v21, "clientId");
    *(_DWORD *)buf = 134218242;
    v77 = v61;
    v78 = 2112;
    v79 = v8;
    _os_log_impl(&dword_1D33CB000, v35, OS_LOG_TYPE_INFO, "<Info> CPMS clientId %lu, budget dictionary %@", buf, 0x16u);
  }
  v7 = v65;
LABEL_77:

  +[CPMSAgent log](CPMSAgent, "log");
  v62 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
  {
    v63 = objc_msgSend(v21, "clientId");
    *(_DWORD *)buf = 134217984;
    v77 = v63;
    _os_log_impl(&dword_1D33CB000, v62, OS_LOG_TYPE_INFO, "<Info> Sending budget notification for CPMS clientId %lu", buf, 0xCu);
  }

  objc_msgSend(v21, "notificationCallback");
  v64 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v64)[2](v64, v8);

LABEL_80:
LABEL_81:

  objc_autoreleasePoolPop(v7);
LABEL_82:

}

void sub_1D33CDAF8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_1()
{
  return _os_log_send_and_compose_impl();
}

double OUTLINED_FUNCTION_2(_QWORD *a1, _OWORD *a2)
{
  double result;

  *a1 = 0;
  result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

BOOL OUTLINED_FUNCTION_5()
{
  NSObject *v0;

  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

uint64_t OUTLINED_FUNCTION_6()
{
  return _os_crash_msg();
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_11(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, a3, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_13(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "count");
}

void OUTLINED_FUNCTION_15(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x12u);
}

uint64_t OUTLINED_FUNCTION_16(void *a1, const char *a2)
{
  return objc_msgSend(a1, "clientId");
}

uint64_t OUTLINED_FUNCTION_21()
{
  void *v0;

  return objc_msgSend(v0, "count");
}

uint64_t openIOConnectObjectForApplePPM(io_service_t *a1, io_connect_t *a2)
{
  const __CFDictionary *v4;
  io_service_t MatchingService;
  uint64_t v6;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (a1 && a2)
  {
    v4 = IOServiceMatching("ApplePPM");
    MatchingService = IOServiceGetMatchingService(*MEMORY[0x1E0CBBAA8], v4);
    *a1 = MatchingService;
    if (MatchingService)
    {
      v6 = IOServiceOpen(MatchingService, *MEMORY[0x1E0C83DA0], 0, a2);
      if (!(_DWORD)v6)
        return 1;
      v9 = v6;
      +[CPMSStateReader log](CPMSStateReader, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        openIOConnectObjectForApplePPM_cold_3(v9, v8, v10, v11, v12, v13, v14, v15);
    }
    else
    {
      +[CPMSStateReader log](CPMSStateReader, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        openIOConnectObjectForApplePPM_cold_2();
    }
  }
  else
  {
    +[CPMSStateReader log](CPMSStateReader, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      openIOConnectObjectForApplePPM_cold_1();
  }

  closeIOConnectObjectForApplePPM((unint64_t)a1, a2);
  return 0;
}

unint64_t closeIOConnectObjectForApplePPM(unint64_t result, _DWORD *a2)
{
  _DWORD *v2;

  v2 = (_DWORD *)result;
  if (a2)
  {
    result = *a2;
    if ((_DWORD)result)
    {
      result = IOObjectRelease(result);
      *a2 = 0;
    }
  }
  if (v2)
  {
    result = *v2;
    if ((_DWORD)result)
    {
      result = IOObjectRelease(result);
      *v2 = 0;
    }
  }
  return result;
}

void PPMCallbackHandler_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1D33CB000, v0, v1, "<Error> set client current power consumption call failed with err 0x%08x\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void PPMCallbackHandler_cold_2(void *a1, char *a2)
{
  uint8_t v3[24];

  OUTLINED_FUNCTION_16(a1, a2);
  OUTLINED_FUNCTION_14();
  _os_log_debug_impl(&dword_1D33CB000, (os_log_t)a2, OS_LOG_TYPE_DEBUG, "<Debug> Getting current power consumption for CPMS clientId %lu\n", v3, 0xCu);
  OUTLINED_FUNCTION_10();
}

void PPMCallbackHandler_cold_3(void *a1, const char *a2, NSObject *a3)
{
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_16(a1, a2);
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_15(&dword_1D33CB000, a3, v4, "<Error> CPMS clientId %lu, unsupported timescalesAvailable 0x%x", v5);
  OUTLINED_FUNCTION_10();
}

void PPMCallbackHandler_cold_4(void *a1, const char *a2, NSObject *a3)
{
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_16(a1, a2);
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_15(&dword_1D33CB000, a3, v4, "<Error> CPMS clientId %lu ret 0x%08x", v5);
  OUTLINED_FUNCTION_10();
}

void openIOConnectObjectForApplePPM_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1D33CB000, v0, v1, "<Error> NULL arguments passed in to function", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void openIOConnectObjectForApplePPM_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1D33CB000, v0, v1, "<Error> no matching service found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void openIOConnectObjectForApplePPM_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1D33CB000, a2, a3, "<Error> failed to open service (0x%08x)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1E0CBAD80](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1E0CBAD90](*(_QWORD *)&connection, *(_QWORD *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1E0CBB668](*(_QWORD *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x1E0CBB698](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x1E0CBB6A0](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x1E0CBB6B8](notify, queue);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x1E0CBB9C0](notifyPort, *(_QWORD *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1E0CBB9D0](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x1E0CBB9F0](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x1E0CBBA10](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t _os_crash()
{
  return MEMORY[0x1E0C81000]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x1E0C81008]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1E0C81068]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

