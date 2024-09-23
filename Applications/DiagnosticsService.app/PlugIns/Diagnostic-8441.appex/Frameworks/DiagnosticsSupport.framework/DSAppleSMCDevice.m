@implementation DSAppleSMCDevice

- (DSAppleSMCDevice)init
{
  DSAppleSMCDevice *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DSAppleSMCDevice;
  result = -[DSAppleSMCDevice init](&v3, "init");
  if (result)
  {
    result->_dataPort = 0;
    result->_isConnectionOpen = 0;
  }
  return result;
}

- (BOOL)openAppleSMC:(int)a3
{
  unsigned int v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  BOOL result;
  id v10;
  NSObject *v11;
  mach_port_t v12;
  const __CFDictionary *v13;
  id v14;
  io_service_t v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  io_connect_t v20;
  uint8_t v21[4];
  io_connect_t connect;
  mach_port_t mainPort[2];

  *(_QWORD *)mainPort = 0;
  connect = 0;
  if (self->_isConnectionOpen)
  {
    v5 = -[DSAppleSMCDevice closeAppleSMC](self, "closeAppleSMC");
    v6 = DiagnosticLogHandleForCategory(6);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[DSAppleSMCDevice openAppleSMC:].cold.5();

      return 0;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Closed an existing SMC connection.", v21, 2u);
    }

  }
  if (IOMainPort(0, &mainPort[1]))
  {
    v10 = DiagnosticLogHandleForCategory(6);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[DSAppleSMCDevice openAppleSMC:].cold.4();
LABEL_16:

    result = 0;
    self->_dataPort = 0;
    return result;
  }
  v12 = mainPort[1];
  v13 = IOServiceMatching("AppleSMC");
  if (IOServiceGetMatchingServices(v12, v13, mainPort))
  {
    v14 = DiagnosticLogHandleForCategory(6);
    v11 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[DSAppleSMCDevice openAppleSMC:].cold.3();
    goto LABEL_16;
  }
  v15 = IOIteratorNext(mainPort[0]);
  IOObjectRelease(mainPort[0]);
  if (v15)
  {
    if (IOServiceOpen(v15, mach_task_self_, a3, &connect))
    {
      v16 = DiagnosticLogHandleForCategory(6);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[DSAppleSMCDevice openAppleSMC:].cold.2();

      return 0;
    }
    v20 = connect;
  }
  else
  {
    v18 = DiagnosticLogHandleForCategory(6);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[DSAppleSMCDevice openAppleSMC:].cold.1(v19);

    v20 = 0;
  }
  self->_dataPort = v20;
  result = 1;
  self->_isConnectionOpen = 1;
  return result;
}

- (BOOL)closeAppleSMC
{
  id v3;
  NSObject *v4;
  id v5;

  if (IOConnectCallScalarMethod(self->_dataPort, 1u, 0, 0, 0, 0))
  {
    v3 = DiagnosticLogHandleForCategory(6);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[DSAppleSMCDevice closeAppleSMC].cold.2();
LABEL_7:

    return 0;
  }
  if (IOServiceClose(self->_dataPort))
  {
    v5 = DiagnosticLogHandleForCategory(6);
    v4 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[DSAppleSMCDevice closeAppleSMC].cold.1();
    goto LABEL_7;
  }
  self->_dataPort = 0;
  self->_isConnectionOpen = 0;
  return 1;
}

- (double)readValueFor:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  const char *v8;
  int v9;
  int v10;
  int v11;
  double v12;
  double v13;
  id v14;
  NSObject *v15;
  id v17;
  const char *v18;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  _OWORD v25[2];
  __int128 v26;
  _OWORD v27[7];
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  int v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  int v51;
  int v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  int v63;

  v4 = a3;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0;
  v39 = 0;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  memset(v25, 0, sizeof(v25));
  v26 = 0u;
  memset(v27, 0, sizeof(v27));
  v28 = 0;
  if (!-[DSAppleSMCDevice isConnectionOpen](self, "isConnectionOpen"))
  {
    v5 = DiagnosticLogHandleForCategory(6);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[DSAppleSMCDevice readValueFor:].cold.1();

  }
  v7 = objc_retainAutorelease(v4);
  v8 = (const char *)objc_msgSend(v7, "cStringUsingEncoding:", 4);
  v52 = smckSMCMakeUInt32Key(v8);
  BYTE6(v55) = 9;
  v9 = callIOFunction(2, -[DSAppleSMCDevice dataPort](self, "dataPort"), &v52, &v29);
  if (v9 || BYTE8(v31))
  {
    v14 = DiagnosticLogHandleForCategory(6);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v19 = 136315650;
      v20 = v8;
      v21 = 1024;
      v22 = v9;
      v23 = 1024;
      v24 = BYTE8(v31);
      v18 = "Could not retrieve Key info from AppleSMC for key: %s (0x%X, 0x%X)";
      goto LABEL_18;
    }
LABEL_12:

    goto LABEL_13;
  }
  if (HIDWORD(v30) > 0x78)
  {
LABEL_13:
    v13 = NAN;
    goto LABEL_14;
  }
  BYTE4(v43) = 0;
  v40 = smckSMCMakeUInt32Key(v8);
  DWORD2(v42) = HIDWORD(v30);
  BYTE6(v43) = 5;
  v10 = callIOFunction(2, -[DSAppleSMCDevice dataPort](self, "dataPort"), &v40, v25);
  if (v10 || BYTE8(v26))
  {
    v17 = DiagnosticLogHandleForCategory(6);
    v15 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v19 = 136315650;
      v20 = v8;
      v21 = 1024;
      v22 = v10;
      v23 = 1024;
      v24 = BYTE8(v26);
      v18 = "Could not read data value from AppleSMC for key: %s (0x%X, 0x%X)";
LABEL_18:
      _os_log_error_impl(&dword_0, v15, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v19, 0x18u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  v11 = returnEnumForDataTypeStr(v31);
  v13 = convertKeyToValueMiniT(v11, DWORD2(v42), v27, v12);
LABEL_14:

  return v13;
}

- (int)readDataFor:(id)a3 value:(void *)a4 size:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  const char *v12;
  int v13;
  int v14;
  int v15;
  id v16;
  NSObject *v17;
  id v19;
  const char *v20;
  int v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  _OWORD v27[2];
  __int128 v28;
  _OWORD v29[7];
  uint64_t v30;
  __int128 v31;
  size_t __n[2];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  int v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  int v53;
  int v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  int v65;

  v8 = a3;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0;
  v41 = 0;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  *(_OWORD *)__n = 0u;
  memset(v27, 0, sizeof(v27));
  v28 = 0u;
  memset(v29, 0, sizeof(v29));
  v30 = 0;
  if (!-[DSAppleSMCDevice isConnectionOpen](self, "isConnectionOpen"))
  {
    v9 = DiagnosticLogHandleForCategory(6);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[DSAppleSMCDevice readValueFor:].cold.1();

  }
  v11 = objc_retainAutorelease(v8);
  v12 = (const char *)objc_msgSend(v11, "cStringUsingEncoding:", 4);
  v54 = smckSMCMakeUInt32Key(v12);
  BYTE6(v57) = 9;
  v13 = callIOFunction(2, -[DSAppleSMCDevice dataPort](self, "dataPort"), &v54, &v31);
  if (v13 || BYTE8(v33))
  {
    v16 = DiagnosticLogHandleForCategory(6);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v21 = 136315650;
      v22 = v12;
      v23 = 1024;
      v24 = v13;
      v25 = 1024;
      v26 = BYTE8(v33);
      v20 = "Could not retrieve Key info from AppleSMC for key: %s (0x%X, 0x%X)";
      goto LABEL_18;
    }
LABEL_13:

    v14 = 0;
    goto LABEL_14;
  }
  v14 = 0;
  if (HIDWORD(__n[1]) <= 0x78 && HIDWORD(__n[1]) <= a5)
  {
    BYTE4(v45) = 0;
    v42 = smckSMCMakeUInt32Key(v12);
    DWORD2(v44) = HIDWORD(__n[1]);
    BYTE6(v45) = 5;
    v15 = callIOFunction(2, -[DSAppleSMCDevice dataPort](self, "dataPort"), &v42, v27);
    if (!v15 && !BYTE8(v28))
    {
      memcpy(a4, v29, HIDWORD(__n[1]));
      v14 = 1;
      goto LABEL_14;
    }
    v19 = DiagnosticLogHandleForCategory(6);
    v17 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v21 = 136315650;
      v22 = v12;
      v23 = 1024;
      v24 = v15;
      v25 = 1024;
      v26 = BYTE8(v28);
      v20 = "Could not read data value from AppleSMC for key: %s (0x%X, 0x%X)";
LABEL_18:
      _os_log_error_impl(&dword_0, v17, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v21, 0x18u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
LABEL_14:

  return v14;
}

- (BOOL)writeValueFor:(id)a3 andValue:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  const char *v11;
  int v12;
  BOOL v13;
  uint64_t v14;
  float v15;
  int v16;
  id v17;
  NSObject *v18;
  id v20;
  id v21;
  const char *v22;
  int v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  _OWORD v29[2];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  _OWORD v39[10];
  uint64_t v40;
  int v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  int v45;
  int v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  int v57;

  v6 = a3;
  v7 = a4;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0;
  v42 = 0u;
  v43 = 0u;
  memset(v44, 0, sizeof(v44));
  v45 = 0;
  v40 = 0;
  memset(v39, 0, sizeof(v39));
  memset(v29, 0, sizeof(v29));
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0;
  if (!-[DSAppleSMCDevice isConnectionOpen](self, "isConnectionOpen"))
  {
    v8 = DiagnosticLogHandleForCategory(6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[DSAppleSMCDevice writeValueFor:andValue:].cold.2();

  }
  v10 = objc_retainAutorelease(v6);
  v11 = (const char *)objc_msgSend(v10, "cStringUsingEncoding:", 4);
  v46 = smckSMCMakeUInt32Key(v11);
  BYTE6(v49) = 9;
  v12 = callIOFunction(2, -[DSAppleSMCDevice dataPort](self, "dataPort"), &v46, v39);
  if (v12 || BYTE8(v39[2]))
  {
    v17 = DiagnosticLogHandleForCategory(6);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v23 = 136315650;
      v24 = v11;
      v25 = 1024;
      v26 = v12;
      v27 = 1024;
      v28 = BYTE8(v39[2]);
      v22 = "Could not retrieve Key info from AppleSMC for key: %s (0x%X, 0x%X)";
      goto LABEL_20;
    }
LABEL_13:

    v13 = 0;
    goto LABEL_14;
  }
  v44[4] = 0;
  v13 = 0;
  v41 = smckSMCMakeUInt32Key(v11);
  *((_QWORD *)&v43 + 1) = *(_QWORD *)((char *)&v39[1] + 12);
  v44[6] = 6;
  if (BYTE12(v39[1]) <= 0x78u)
  {
    v14 = returnEnumForDataTypeStr(v39[2]);
    objc_msgSend(v7, "floatValue");
    if (translateFloatToFixed(v14, &v44[12], HIDWORD(v39[1]), v15) != 1)
    {
      v20 = DiagnosticLogHandleForCategory(6);
      v18 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[DSAppleSMCDevice writeValueFor:andValue:].cold.1();
      goto LABEL_13;
    }
    v16 = callIOFunction(2, -[DSAppleSMCDevice dataPort](self, "dataPort"), &v41, v29);
    if (!v16 && !BYTE8(v30))
    {
      v13 = 1;
      goto LABEL_14;
    }
    v21 = DiagnosticLogHandleForCategory(6);
    v18 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v23 = 136315650;
      v24 = v11;
      v25 = 1024;
      v26 = v16;
      v27 = 1024;
      v28 = BYTE8(v30);
      v22 = "Could not write data value from AppleSMC for key: %s (0x%X, 0x%X)";
LABEL_20:
      _os_log_error_impl(&dword_0, v18, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&v23, 0x18u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
LABEL_14:

  return v13;
}

- (BOOL)writeDataFor:(id)a3 value:(void *)a4 size:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  const char *v12;
  unint64_t v13;
  int v14;
  int v15;
  BOOL v16;
  int v17;
  id v18;
  NSObject *v19;
  int v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  _OWORD v27[2];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  int v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  int v41;

  v8 = a3;
  v38 = 0u;
  v39 = 0u;
  memset(v40, 0, sizeof(v40));
  v41 = 0;
  memset(v27, 0, sizeof(v27));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0;
  if (!-[DSAppleSMCDevice isConnectionOpen](self, "isConnectionOpen"))
  {
    v9 = DiagnosticLogHandleForCategory(6);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[DSAppleSMCDevice writeValueFor:andValue:].cold.2();

  }
  v11 = objc_retainAutorelease(v8);
  v12 = (const char *)objc_msgSend(v11, "cStringUsingEncoding:", 4);
  v40[6] = 6;
  v37 = smckSMCMakeUInt32Key(v12);
  DWORD2(v39) = a5;
  if (a5)
  {
    v13 = a5 - 1;
    if (a5 - 1 >= 0x1F)
      v13 = 31;
    memcpy(&v40[12], a4, v13 + 1);
  }
  v14 = callIOFunction(2, -[DSAppleSMCDevice dataPort](self, "dataPort"), &v37, v27);
  v15 = v14 | BYTE8(v28);
  v16 = v15 == 0;
  if (v15)
  {
    v17 = v14;
    v18 = DiagnosticLogHandleForCategory(6);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v21 = 136315650;
      v22 = v12;
      v23 = 1024;
      v24 = v17;
      v25 = 1024;
      v26 = BYTE8(v28);
      _os_log_error_impl(&dword_0, v19, OS_LOG_TYPE_ERROR, "Failed to write AppleSMC data for key: %s (0x%X, 0x%X)", (uint8_t *)&v21, 0x18u);
    }

  }
  return v16;
}

- (unsigned)dataPort
{
  return self->_dataPort;
}

- (void)setDataPort:(unsigned int)a3
{
  self->_dataPort = a3;
}

- (BOOL)isConnectionOpen
{
  return self->_isConnectionOpen;
}

- (void)setIsConnectionOpen:(BOOL)a3
{
  self->_isConnectionOpen = a3;
}

- (void)openAppleSMC:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "ServiceObject for AppleSMC service is NULL", v1, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)openAppleSMC:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_0, v0, v1, "Error opening AppleSMC service: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)openAppleSMC:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_0, v0, v1, "Error finding AppleSMC service: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)openAppleSMC:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_0, v0, v1, "Error obtaining main IO port error: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)openAppleSMC:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_0, v0, v1, "Failed to closed an existing SMC connection. Aborting Open. %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)closeAppleSMC
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_0, v0, v1, "Could not close AppleSMC dataPort: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)readValueFor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_0, v0, v1, "Could not read value for key: %@. AppleSMC Connection is not active.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)writeValueFor:andValue:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_0, v0, v1, "Could not translate write value into proper write format for key: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)writeValueFor:andValue:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_0, v0, v1, "Could not write value for key: %@. AppleSMC Connection is not active.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

@end
