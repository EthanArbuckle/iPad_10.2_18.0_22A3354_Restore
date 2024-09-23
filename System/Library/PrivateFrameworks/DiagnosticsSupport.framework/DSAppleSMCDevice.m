@implementation DSAppleSMCDevice

- (DSAppleSMCDevice)init
{
  DSAppleSMCDevice *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DSAppleSMCDevice;
  result = -[DSAppleSMCDevice init](&v3, sel_init);
  if (result)
  {
    result->_dataPort = 0;
    result->_isConnectionOpen = 0;
  }
  return result;
}

- (BOOL)openAppleSMC:(int)a3
{
  _BOOL4 v5;
  NSObject *v6;
  NSObject *v7;
  BOOL result;
  NSObject *v9;
  mach_port_t v10;
  const __CFDictionary *v11;
  io_service_t v12;
  NSObject *v13;
  NSObject *v14;
  io_connect_t v15;
  uint8_t v16[4];
  io_connect_t connect;
  io_iterator_t existing[2];

  *(_QWORD *)existing = 0;
  connect = 0;
  if (self->_isConnectionOpen)
  {
    v5 = -[DSAppleSMCDevice closeAppleSMC](self, "closeAppleSMC");
    DiagnosticLogHandleForCategory(6);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[DSAppleSMCDevice openAppleSMC:].cold.5();

      return 0;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_21F54F000, v7, OS_LOG_TYPE_DEFAULT, "Closed an existing SMC connection.", v16, 2u);
    }

  }
  if (MEMORY[0x2207CA148](0, &existing[1]))
  {
    DiagnosticLogHandleForCategory(6);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[DSAppleSMCDevice openAppleSMC:].cold.4();
LABEL_16:

    result = 0;
    self->_dataPort = 0;
    return result;
  }
  v10 = existing[1];
  v11 = IOServiceMatching("AppleSMC");
  if (IOServiceGetMatchingServices(v10, v11, existing))
  {
    DiagnosticLogHandleForCategory(6);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[DSAppleSMCDevice openAppleSMC:].cold.3();
    goto LABEL_16;
  }
  v12 = IOIteratorNext(existing[0]);
  IOObjectRelease(existing[0]);
  if (v12)
  {
    if (IOServiceOpen(v12, *MEMORY[0x24BDAEC58], a3, &connect))
    {
      DiagnosticLogHandleForCategory(6);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[DSAppleSMCDevice openAppleSMC:].cold.2();

      return 0;
    }
    v15 = connect;
  }
  else
  {
    DiagnosticLogHandleForCategory(6);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[DSAppleSMCDevice openAppleSMC:].cold.1(v14);

    v15 = 0;
  }
  self->_dataPort = v15;
  result = 1;
  self->_isConnectionOpen = 1;
  return result;
}

- (BOOL)closeAppleSMC
{
  NSObject *v3;

  if (IOConnectCallScalarMethod(self->_dataPort, 1u, 0, 0, 0, 0))
  {
    DiagnosticLogHandleForCategory(6);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[DSAppleSMCDevice closeAppleSMC].cold.2();
LABEL_7:

    return 0;
  }
  if (IOServiceClose(self->_dataPort))
  {
    DiagnosticLogHandleForCategory(6);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
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
  NSObject *v5;
  id v6;
  const char *v7;
  int v8;
  int v9;
  int v10;
  double v11;
  double v12;
  NSObject *v13;
  const char *v15;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  _OWORD v22[2];
  __int128 v23;
  _OWORD v24[7];
  uint64_t v25;
  __int128 v26;
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
  int v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  int v48;
  int v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  int v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0;
  v36 = 0;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  memset(v22, 0, sizeof(v22));
  v23 = 0u;
  memset(v24, 0, sizeof(v24));
  v25 = 0;
  if (!-[DSAppleSMCDevice isConnectionOpen](self, "isConnectionOpen"))
  {
    DiagnosticLogHandleForCategory(6);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[DSAppleSMCDevice readValueFor:].cold.1();

  }
  v6 = objc_retainAutorelease(v4);
  v7 = (const char *)objc_msgSend(v6, "cStringUsingEncoding:", 4);
  v49 = smckSMCMakeUInt32Key(v7);
  BYTE6(v52) = 9;
  v8 = callIOFunction(2, -[DSAppleSMCDevice dataPort](self, "dataPort"), &v49, &v26);
  if (v8 || BYTE8(v28))
  {
    DiagnosticLogHandleForCategory(6);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v16 = 136315650;
      v17 = v7;
      v18 = 1024;
      v19 = v8;
      v20 = 1024;
      v21 = BYTE8(v28);
      v15 = "Could not retrieve Key info from AppleSMC for key: %s (0x%X, 0x%X)";
      goto LABEL_18;
    }
LABEL_12:

    goto LABEL_13;
  }
  if (HIDWORD(v27) > 0x78)
  {
LABEL_13:
    v12 = NAN;
    goto LABEL_14;
  }
  BYTE4(v40) = 0;
  v37 = smckSMCMakeUInt32Key(v7);
  DWORD2(v39) = HIDWORD(v27);
  BYTE6(v40) = 5;
  v9 = callIOFunction(2, -[DSAppleSMCDevice dataPort](self, "dataPort"), &v37, v22);
  if (v9 || BYTE8(v23))
  {
    DiagnosticLogHandleForCategory(6);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v16 = 136315650;
      v17 = v7;
      v18 = 1024;
      v19 = v9;
      v20 = 1024;
      v21 = BYTE8(v23);
      v15 = "Could not read data value from AppleSMC for key: %s (0x%X, 0x%X)";
LABEL_18:
      _os_log_error_impl(&dword_21F54F000, v13, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v16, 0x18u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  v10 = returnEnumForDataTypeStr(v28);
  v12 = convertKeyToValueMiniT(v10, DWORD2(v39), v24, v11);
LABEL_14:

  return v12;
}

- (int)readDataFor:(id)a3 value:(void *)a4 size:(unint64_t)a5
{
  id v8;
  NSObject *v9;
  id v10;
  const char *v11;
  int v12;
  int v13;
  int v14;
  NSObject *v15;
  const char *v17;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  _OWORD v24[2];
  __int128 v25;
  _OWORD v26[7];
  uint64_t v27;
  __int128 v28;
  size_t __n[2];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  int v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  int v50;
  int v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  int v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0;
  v38 = 0;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  *(_OWORD *)__n = 0u;
  memset(v24, 0, sizeof(v24));
  v25 = 0u;
  memset(v26, 0, sizeof(v26));
  v27 = 0;
  if (!-[DSAppleSMCDevice isConnectionOpen](self, "isConnectionOpen"))
  {
    DiagnosticLogHandleForCategory(6);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[DSAppleSMCDevice readValueFor:].cold.1();

  }
  v10 = objc_retainAutorelease(v8);
  v11 = (const char *)objc_msgSend(v10, "cStringUsingEncoding:", 4);
  v51 = smckSMCMakeUInt32Key(v11);
  BYTE6(v54) = 9;
  v12 = callIOFunction(2, -[DSAppleSMCDevice dataPort](self, "dataPort"), &v51, &v28);
  if (v12 || BYTE8(v30))
  {
    DiagnosticLogHandleForCategory(6);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v18 = 136315650;
      v19 = v11;
      v20 = 1024;
      v21 = v12;
      v22 = 1024;
      v23 = BYTE8(v30);
      v17 = "Could not retrieve Key info from AppleSMC for key: %s (0x%X, 0x%X)";
      goto LABEL_18;
    }
LABEL_13:

    v13 = 0;
    goto LABEL_14;
  }
  v13 = 0;
  if (HIDWORD(__n[1]) <= 0x78 && HIDWORD(__n[1]) <= a5)
  {
    BYTE4(v42) = 0;
    v39 = smckSMCMakeUInt32Key(v11);
    DWORD2(v41) = HIDWORD(__n[1]);
    BYTE6(v42) = 5;
    v14 = callIOFunction(2, -[DSAppleSMCDevice dataPort](self, "dataPort"), &v39, v24);
    if (!v14 && !BYTE8(v25))
    {
      memcpy(a4, v26, HIDWORD(__n[1]));
      v13 = 1;
      goto LABEL_14;
    }
    DiagnosticLogHandleForCategory(6);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v18 = 136315650;
      v19 = v11;
      v20 = 1024;
      v21 = v14;
      v22 = 1024;
      v23 = BYTE8(v25);
      v17 = "Could not read data value from AppleSMC for key: %s (0x%X, 0x%X)";
LABEL_18:
      _os_log_error_impl(&dword_21F54F000, v15, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v18, 0x18u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
LABEL_14:

  return v13;
}

- (BOOL)writeValueFor:(id)a3 andValue:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  const char *v10;
  int v11;
  BOOL v12;
  uint64_t v13;
  float v14;
  int v15;
  NSObject *v16;
  const char *v18;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  _OWORD v25[2];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  _OWORD v35[10];
  uint64_t v36;
  int v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  int v41;
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
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
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
  v38 = 0u;
  v39 = 0u;
  memset(v40, 0, sizeof(v40));
  v41 = 0;
  v36 = 0;
  memset(v35, 0, sizeof(v35));
  memset(v25, 0, sizeof(v25));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0;
  if (!-[DSAppleSMCDevice isConnectionOpen](self, "isConnectionOpen"))
  {
    DiagnosticLogHandleForCategory(6);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[DSAppleSMCDevice writeValueFor:andValue:].cold.2();

  }
  v9 = objc_retainAutorelease(v6);
  v10 = (const char *)objc_msgSend(v9, "cStringUsingEncoding:", 4);
  v42 = smckSMCMakeUInt32Key(v10);
  BYTE6(v45) = 9;
  v11 = callIOFunction(2, -[DSAppleSMCDevice dataPort](self, "dataPort"), &v42, v35);
  if (v11 || BYTE8(v35[2]))
  {
    DiagnosticLogHandleForCategory(6);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v19 = 136315650;
      v20 = v10;
      v21 = 1024;
      v22 = v11;
      v23 = 1024;
      v24 = BYTE8(v35[2]);
      v18 = "Could not retrieve Key info from AppleSMC for key: %s (0x%X, 0x%X)";
      goto LABEL_20;
    }
LABEL_13:

    v12 = 0;
    goto LABEL_14;
  }
  v40[4] = 0;
  v12 = 0;
  v37 = smckSMCMakeUInt32Key(v10);
  *((_QWORD *)&v39 + 1) = *(_QWORD *)((char *)&v35[1] + 12);
  v40[6] = 6;
  if (BYTE12(v35[1]) <= 0x78u)
  {
    v13 = returnEnumForDataTypeStr(v35[2]);
    objc_msgSend(v7, "floatValue");
    if (translateFloatToFixed(v13, &v40[12], HIDWORD(v35[1]), v14) != 1)
    {
      DiagnosticLogHandleForCategory(6);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[DSAppleSMCDevice writeValueFor:andValue:].cold.1();
      goto LABEL_13;
    }
    v15 = callIOFunction(2, -[DSAppleSMCDevice dataPort](self, "dataPort"), &v37, v25);
    if (!v15 && !BYTE8(v26))
    {
      v12 = 1;
      goto LABEL_14;
    }
    DiagnosticLogHandleForCategory(6);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v19 = 136315650;
      v20 = v10;
      v21 = 1024;
      v22 = v15;
      v23 = 1024;
      v24 = BYTE8(v26);
      v18 = "Could not write data value from AppleSMC for key: %s (0x%X, 0x%X)";
LABEL_20:
      _os_log_error_impl(&dword_21F54F000, v16, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v19, 0x18u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
LABEL_14:

  return v12;
}

- (BOOL)writeDataFor:(id)a3 value:(void *)a4 size:(unint64_t)a5
{
  id v8;
  NSObject *v9;
  id v10;
  const char *v11;
  unint64_t v12;
  int v13;
  int v14;
  BOOL v15;
  int v16;
  NSObject *v17;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  _OWORD v25[2];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  int v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v36 = 0u;
  v37 = 0u;
  memset(v38, 0, sizeof(v38));
  v39 = 0;
  memset(v25, 0, sizeof(v25));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0;
  if (!-[DSAppleSMCDevice isConnectionOpen](self, "isConnectionOpen"))
  {
    DiagnosticLogHandleForCategory(6);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[DSAppleSMCDevice writeValueFor:andValue:].cold.2();

  }
  v10 = objc_retainAutorelease(v8);
  v11 = (const char *)objc_msgSend(v10, "cStringUsingEncoding:", 4);
  v38[6] = 6;
  v35 = smckSMCMakeUInt32Key(v11);
  DWORD2(v37) = a5;
  if (a5)
  {
    v12 = a5 - 1;
    if (a5 - 1 >= 0x1F)
      v12 = 31;
    memcpy(&v38[12], a4, v12 + 1);
  }
  v13 = callIOFunction(2, -[DSAppleSMCDevice dataPort](self, "dataPort"), &v35, v25);
  v14 = v13 | BYTE8(v26);
  v15 = v14 == 0;
  if (v14)
  {
    v16 = v13;
    DiagnosticLogHandleForCategory(6);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = 136315650;
      v20 = v11;
      v21 = 1024;
      v22 = v16;
      v23 = 1024;
      v24 = BYTE8(v26);
      _os_log_error_impl(&dword_21F54F000, v17, OS_LOG_TYPE_ERROR, "Failed to write AppleSMC data for key: %s (0x%X, 0x%X)", (uint8_t *)&v19, 0x18u);
    }

  }
  return v15;
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
  _os_log_error_impl(&dword_21F54F000, log, OS_LOG_TYPE_ERROR, "ServiceObject for AppleSMC service is NULL", v1, 2u);
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
  OUTLINED_FUNCTION_3(&dword_21F54F000, v0, v1, "Error opening AppleSMC service: %d", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_3(&dword_21F54F000, v0, v1, "Error finding AppleSMC service: %d", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_3(&dword_21F54F000, v0, v1, "Error obtaining main IO port error: %d", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_3(&dword_21F54F000, v0, v1, "Failed to closed an existing SMC connection. Aborting Open. %d", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_3(&dword_21F54F000, v0, v1, "Could not close AppleSMC dataPort: %d", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_1_0(&dword_21F54F000, v0, v1, "Could not read value for key: %@. AppleSMC Connection is not active.", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_1_0(&dword_21F54F000, v0, v1, "Could not translate write value into proper write format for key: %s", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_1_0(&dword_21F54F000, v0, v1, "Could not write value for key: %@. AppleSMC Connection is not active.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

@end
