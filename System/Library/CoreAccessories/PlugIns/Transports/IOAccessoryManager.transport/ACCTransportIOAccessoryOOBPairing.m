@implementation ACCTransportIOAccessoryOOBPairing

- (ACCTransportIOAccessoryOOBPairing)initWithDelegate:(id)a3 andIOService:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  ACCTransportIOAccessoryOOBPairing *v7;
  ACCTransportIOAccessoryOOBPairing *v8;
  NSString *endpointUUID;
  objc_super v11;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACCTransportIOAccessoryOOBPairing;
  v7 = -[ACCTransportIOAccessoryBase initWithIOAccessoryClass:ioService:](&v11, sel_initWithIOAccessoryClass_ioService_, 4, v4);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_parentConnectionUUID, 0);
    endpointUUID = v8->_endpointUUID;
    v8->_endpointUUID = 0;

    objc_storeWeak((id *)&v8->_delegate, v6);
    v8->super._ioConnect = 0;
    v8->_oobPairingInfoReadBuffer = (char *)malloc_type_malloc(0x400uLL, 0x6BAB4F8uLL);
    v8->_oobPairingInfoReadBufferLength = 1024;
    v8->_oobPairingDataReadBuffer = (char *)malloc_type_malloc(0x400uLL, 0xD991719EuLL);
    v8->_oobPairingDataReadBufferLength = 1024;
    -[ACCTransportIOAccessoryOOBPairing _checkAccInfo](v8, "_checkAccInfo");
  }

  return v8;
}

- (void)dealloc
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21722C000, MEMORY[0x24BDACB70], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (BOOL)openServiceSession
{
  BOOL v3;
  id v4;
  NSObject *v5;
  unsigned int v6;
  void *v7;
  NSObject *v8;
  io_service_t v9;
  kern_return_t v10;
  kern_return_t v11;
  id v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  BOOL v17;
  id v18;
  void *v19;
  id v21;
  unsigned int v22;
  int v23;
  _BYTE v24[20];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v3 = gNumLogObjects < 8;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
    -[ACCTransportIOAccessoryOOBPairing endpointUUID](self, "endpointUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 67109378;
    *(_DWORD *)v24 = v6;
    *(_WORD *)&v24[4] = 2112;
    *(_QWORD *)&v24[6] = v7;
    _os_log_impl(&dword_21722C000, v5, OS_LOG_TYPE_DEFAULT, "OOBPairing openServiceSession, ioService = %d, endpointUUID %@", (uint8_t *)&v23, 0x12u);

  }
  if (self->super._ioConnect)
  {
    if (gLogObjects && gNumLogObjects >= 8)
    {
      v8 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v8 = MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    -[ACCTransportIOAccessoryOOBPairing endpointUUID](self, "endpointUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412290;
    *(_QWORD *)v24 = v13;
    v14 = "OOB Pairing is already open (endpointUUID %@)";
    v15 = v8;
    v16 = 12;
LABEL_24:
    _os_log_impl(&dword_21722C000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v23, v16);

LABEL_25:
    v17 = 1;
    goto LABEL_35;
  }
  v9 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
  v10 = IOServiceOpen(v9, *MEMORY[0x24BDAEC58], 0, &self->super._ioConnect);
  if (!v10)
  {
    -[ACCTransportIOAccessoryOOBPairing _registerReadCallback](self, "_registerReadCallback");
    if (gLogObjects && gNumLogObjects >= 8)
    {
      v8 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v8 = MEMORY[0x24BDACB70];
      v21 = MEMORY[0x24BDACB70];
    }
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    v22 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
    -[ACCTransportIOAccessoryOOBPairing endpointUUID](self, "endpointUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 67109634;
    *(_DWORD *)v24 = v22;
    *(_WORD *)&v24[4] = 1024;
    *(_DWORD *)&v24[6] = 0;
    *(_WORD *)&v24[10] = 2112;
    *(_QWORD *)&v24[12] = v13;
    v14 = "OOB Pairing for self.ioService %d is open, result = 0x%X (endpointUUID %@)";
    v15 = v8;
    v16 = 24;
    goto LABEL_24;
  }
  v11 = v10;
  if (gLogObjects && gNumLogObjects >= 8)
  {
    v8 = *(id *)(gLogObjects + 56);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v8 = MEMORY[0x24BDACB70];
    v18 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[ACCTransportIOAccessoryOOBPairing endpointUUID](self, "endpointUUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 67109378;
    *(_DWORD *)v24 = v11;
    *(_WORD *)&v24[4] = 2112;
    *(_QWORD *)&v24[6] = v19;
    _os_log_impl(&dword_21722C000, v8, OS_LOG_TYPE_DEFAULT, "ERROR: OOB Pairing open failed! result %xh (endpointUUID %@)", (uint8_t *)&v23, 0x12u);

  }
  v17 = 0;
LABEL_35:

  return v17;
}

- (void)closeServiceSession
{
  io_connect_t ioConnect;
  BOOL v4;
  id v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  ioConnect = self->super._ioConnect;
  if (ioConnect)
  {
    IOServiceClose(ioConnect);
    self->super._ioConnect = 0;
    if (gLogObjects)
      v4 = gNumLogObjects < 8;
    else
      v4 = 1;
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v8 = MEMORY[0x24BDACB70];
      v5 = MEMORY[0x24BDACB70];
    }
    else
    {
      v8 = *(id *)(gLogObjects + 56);
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[ACCTransportIOAccessoryOOBPairing endpointUUID](self, "endpointUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v9;
      v10 = "OOB Pairing is closed (endpointUUID %@)";
LABEL_22:
      _os_log_impl(&dword_21722C000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v11, 0xCu);

    }
  }
  else
  {
    if (gLogObjects)
      v6 = gNumLogObjects < 8;
    else
      v6 = 1;
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v8 = MEMORY[0x24BDACB70];
      v7 = MEMORY[0x24BDACB70];
    }
    else
    {
      v8 = *(id *)(gLogObjects + 56);
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[ACCTransportIOAccessoryOOBPairing endpointUUID](self, "endpointUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v9;
      v10 = "OOB Pairing is already closed (endpointUUID %@)";
      goto LABEL_22;
    }
  }

}

- (BOOL)supportsType:(int)a3
{
  unint64_t v5;
  int v6;
  BOOL v7;

  if (a3 > 1 || !-[NSMutableData length](self->_deviceSupportedTypes, "length"))
    return 0;
  v5 = 0;
  do
  {
    v6 = *(unsigned __int8 *)(-[NSMutableData bytes](self->_deviceSupportedTypes, "bytes") + v5);
    v7 = v6 == a3;
    if (v6 == a3)
      break;
    ++v5;
  }
  while (-[NSMutableData length](self->_deviceSupportedTypes, "length") > v5);
  return v7;
}

- (BOOL)_handleIncomingOOBPairingInfoData:(int)a3
{
  BOOL v5;
  id v6;
  BOOL v7;
  id v8;
  unint64_t v9;
  BOOL v10;
  id v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  unint64_t *p_oobPairingInfoReadBufferLength;
  NSObject *v17;
  uint64_t v18;
  int v19;
  BOOL v20;
  NSObject *v21;
  NSObject *v22;
  int PairingInfo;
  uint64_t v24;
  int v25;
  NSObject *v26;
  uint64_t v27;
  int v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  char v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  int v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  unint64_t v44;
  void *v45;
  unsigned int ioConnect;
  unint64_t v47;
  unint64_t oobPairingDataReadBufferLength;
  void *v49;
  void *v50;
  unsigned int v51;
  void *v52;
  uint64_t v53;
  void *v54;
  unsigned int v55;
  NSObject *v56;
  int v57;
  unint64_t *p_oobPairingDataReadBufferLength;
  NSObject *v59;
  uint64_t v60;
  int v61;
  NSObject *v63;
  NSObject *v64;
  int PairingData;
  uint64_t v66;
  int v67;
  NSObject *v68;
  NSObject *v69;
  unint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  char v74;
  id v75;
  void *v76;
  void *v77;
  uint64_t v78;
  int v79;
  NSObject *v80;
  NSObject *v81;
  unint64_t v82;
  void *v83;
  int v84;
  unint64_t v85;
  void *v86;
  unint64_t v87;
  void *v88;
  void *v89;
  NSObject *v90;
  uint64_t ActivePairingType;
  NSObject *v92;
  id v93;
  NSObject *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  int v99;
  NSObject *v100;
  uint64_t v101;
  int v102;
  NSObject *v103;
  id v104;
  id v105;
  id v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  char v111;
  int *p_ioConnect;
  __int16 activeType;
  uint8_t buf[4];
  _BYTE v115[30];
  int v116;
  uint64_t v117;

  v117 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    if (a3 == 1)
    {
      v9 = 0x253E63000uLL;
      if (gLogObjects)
        v10 = gNumLogObjects < 8;
      else
        v10 = 1;
      if (v10)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v56 = MEMORY[0x24BDACB70];
        v11 = MEMORY[0x24BDACB70];
      }
      else
      {
        v56 = *(id *)(gLogObjects + 56);
      }
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
        -[ACCTransportIOAccessoryOOBPairing _handleIncomingOOBPairingInfoData:].cold.10(self);

      p_ioConnect = (int *)&self->super._ioConnect;
      if (self->super._ioConnect)
      {
        v57 = 0;
        p_oobPairingDataReadBufferLength = &self->_oobPairingDataReadBufferLength;
        v59 = MEMORY[0x24BDACB70];
        while (1)
        {
          *p_oobPairingDataReadBufferLength = 1024;
          v60 = gLogObjects;
          v61 = *(_DWORD *)(v9 + 2776);
          if (!gLogObjects || v61 < 8)
          {
            if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              *(_QWORD *)v115 = v60;
              *(_WORD *)&v115[8] = 1024;
              *(_DWORD *)&v115[10] = v61;
              _os_log_error_impl(&dword_21722C000, v59, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v63 = v59;
            v64 = v59;
          }
          else
          {
            v64 = *(id *)(gLogObjects + 56);
          }
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
          {
            v82 = *p_oobPairingDataReadBufferLength;
            -[ACCTransportIOAccessoryOOBPairing endpointUUID](self, "endpointUUID");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            v84 = *p_ioConnect;
            *(_DWORD *)buf = 134218498;
            *(_QWORD *)v115 = v82;
            *(_WORD *)&v115[8] = 2112;
            *(_QWORD *)&v115[10] = v83;
            *(_WORD *)&v115[18] = 1024;
            *(_DWORD *)&v115[20] = v84;
            _os_log_debug_impl(&dword_21722C000, v64, OS_LOG_TYPE_DEBUG, "read upto %zu bytes for OOB Pairing Data (endpointUUID %@), call IOAccessoryOOBPairingInterfaceGetPairingData, ioConnect %d", buf, 0x1Cu);

          }
          PairingData = IOAccessoryOOBPairingInterfaceGetPairingData();
          v66 = gLogObjects;
          v67 = *(_DWORD *)(v9 + 2776);
          if (gLogObjects && v67 >= 8)
          {
            v68 = *(id *)(gLogObjects + 56);
          }
          else
          {
            if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              *(_QWORD *)v115 = v66;
              *(_WORD *)&v115[8] = 1024;
              *(_DWORD *)&v115[10] = v67;
              _os_log_error_impl(&dword_21722C000, v59, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v69 = v59;
            v68 = v59;
          }
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
          {
            v85 = *p_oobPairingDataReadBufferLength;
            -[ACCTransportIOAccessoryOOBPairing endpointUUID](self, "endpointUUID");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218498;
            *(_QWORD *)v115 = v85;
            *(_WORD *)&v115[8] = 2112;
            *(_QWORD *)&v115[10] = v86;
            *(_WORD *)&v115[18] = 1024;
            *(_DWORD *)&v115[20] = PairingData;
            _os_log_debug_impl(&dword_21722C000, v68, OS_LOG_TYPE_DEBUG, "read %zu bytes for OOB Pairing Data (endpointUUID %@), result = 0x%X", buf, 0x1Cu);

            v9 = 0x253E63000;
          }

          if (PairingData)
            break;
          v70 = *p_oobPairingDataReadBufferLength;
          if (!*p_oobPairingDataReadBufferLength)
            goto LABEL_110;
          -[ACCTransportIOAccessoryOOBPairing delegate](self, "delegate");
          v71 = objc_claimAutoreleasedReturnValue();
          if (!v71)
            goto LABEL_110;
          v72 = (void *)v71;
          -[ACCTransportIOAccessoryOOBPairing delegate](self, "delegate");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = objc_opt_respondsToSelector();

          v9 = 0x253E63000;
          if ((v74 & 1) != 0)
          {
            *(_WORD *)buf = 5;
            activeType = self->_activeType;
            v75 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
            objc_msgSend(v75, "appendBytes:length:", buf, 2);
            objc_msgSend(v75, "appendBytes:length:", &activeType, 2);
            objc_msgSend(v75, "appendBytes:length:", self->_oobPairingDataReadBuffer, *p_oobPairingDataReadBufferLength);
            -[ACCTransportIOAccessoryOOBPairing delegate](self, "delegate");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            -[ACCTransportIOAccessoryOOBPairing endpointUUID](self, "endpointUUID");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "IOAccessoryOOBPairingDataArrived:endpointUUID:", v75, v77);

            v9 = 0x253E63000;
          }
          else
          {
LABEL_110:
            v78 = gLogObjects;
            v79 = *(_DWORD *)(v9 + 2776);
            if (gLogObjects && v79 >= 8)
            {
              v80 = *(id *)(gLogObjects + 56);
            }
            else
            {
              if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                *(_QWORD *)v115 = v78;
                *(_WORD *)&v115[8] = 1024;
                *(_DWORD *)&v115[10] = v79;
                _os_log_error_impl(&dword_21722C000, v59, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              v81 = v59;
              v80 = v59;
            }
            if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
            {
              v87 = *p_oobPairingDataReadBufferLength;
              -[ACCTransportIOAccessoryOOBPairing endpointUUID](self, "endpointUUID");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              -[ACCTransportIOAccessoryOOBPairing parentConnectionUUID](self, "parentConnectionUUID");
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218754;
              *(_QWORD *)v115 = v87;
              *(_WORD *)&v115[8] = 2112;
              *(_QWORD *)&v115[10] = v88;
              *(_WORD *)&v115[18] = 2112;
              *(_QWORD *)&v115[20] = v89;
              *(_WORD *)&v115[28] = 1024;
              v116 = 0;
              _os_log_error_impl(&dword_21722C000, v80, OS_LOG_TYPE_ERROR, "received OOB Pairing Data (%zu) but delegate doesn't handle it or no data, endpointUUID %@, parentUUID %@, result %d", buf, 0x26u);

              v9 = 0x253E63000;
            }

          }
          v57 = 1;
          if (v70 != 1024)
            return v57 != 0;
        }
        v101 = gLogObjects;
        v102 = *(_DWORD *)(v9 + 2776);
        if (gLogObjects && v102 >= 8)
        {
          v103 = *(id *)(gLogObjects + 56);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(_QWORD *)v115 = v101;
            *(_WORD *)&v115[8] = 1024;
            *(_DWORD *)&v115[10] = v102;
            _os_log_error_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v103 = MEMORY[0x24BDACB70];
          v106 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
        {
          -[ACCTransportIOAccessoryOOBPairing endpointUUID](self, "endpointUUID");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          -[ACCTransportIOAccessoryOOBPairing parentConnectionUUID](self, "parentConnectionUUID");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)v115 = v109;
          *(_WORD *)&v115[8] = 2112;
          *(_QWORD *)&v115[10] = v110;
          *(_WORD *)&v115[18] = 1024;
          *(_DWORD *)&v115[20] = PairingData;
          _os_log_error_impl(&dword_21722C000, v103, OS_LOG_TYPE_ERROR, "error reading OOB Pairing Data, endpointUUID %@, parentUUID %@, result %d", buf, 0x1Cu);

        }
        return v57 != 0;
      }
      if (gLogObjects && gNumLogObjects >= 8)
      {
        v95 = *(id *)(gLogObjects + 56);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v95 = MEMORY[0x24BDACB70];
        v105 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing _handleIncomingOOBPairingInfoData:].cold.8(p_ioConnect, self, v95);
    }
    else
    {
      if (a3 == 2)
      {
        if (gLogObjects)
          v5 = gNumLogObjects < 8;
        else
          v5 = 1;
        if (v5)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v90 = MEMORY[0x24BDACB70];
          v6 = MEMORY[0x24BDACB70];
        }
        else
        {
          v90 = *(id *)(gLogObjects + 56);
        }
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
          -[ACCTransportIOAccessoryOOBPairing _handleIncomingOOBPairingInfoData:].cold.4(self);

        -[ACCTransportIOAccessoryBase ioService](self, "ioService");
        ActivePairingType = IOAccessoryOOBPairingInterfaceGetActivePairingType();
        if (gLogObjects && gNumLogObjects >= 8)
        {
          v92 = *(id *)(gLogObjects + 56);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v92 = MEMORY[0x24BDACB70];
          v93 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
          -[ACCTransportIOAccessoryOOBPairing _handleIncomingOOBPairingInfoData:].cold.2(self, ActivePairingType, v92);

        self->_activeType = -[ACCTransportIOAccessoryOOBPairing _convertOOBPairingTypeFromIOAccessory:](self, "_convertOOBPairingTypeFromIOAccessory:", ActivePairingType);
        return 1;
      }
      if (gLogObjects)
        v12 = gNumLogObjects < 8;
      else
        v12 = 1;
      if (v12)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v95 = MEMORY[0x24BDACB70];
        v13 = MEMORY[0x24BDACB70];
      }
      else
      {
        v95 = *(id *)(gLogObjects + 56);
      }
      if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
      {
        -[ACCTransportIOAccessoryOOBPairing endpointUUID](self, "endpointUUID");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        -[ACCTransportIOAccessoryOOBPairing parentConnectionUUID](self, "parentConnectionUUID");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v115 = a3;
        *(_WORD *)&v115[4] = 2112;
        *(_QWORD *)&v115[6] = v96;
        *(_WORD *)&v115[14] = 2112;
        *(_QWORD *)&v115[16] = v97;
        _os_log_impl(&dword_21722C000, v95, OS_LOG_TYPE_DEFAULT, "Wrong OOB Pairing data type (%d), endpointUUID %@, parentUUID %@", buf, 0x1Cu);

      }
    }

    return 0;
  }
  if (gLogObjects)
    v7 = gNumLogObjects < 8;
  else
    v7 = 1;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v14 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  else
  {
    v14 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[ACCTransportIOAccessoryOOBPairing _handleIncomingOOBPairingInfoData:].cold.6(self);

  v15 = 0;
  p_oobPairingInfoReadBufferLength = &self->_oobPairingInfoReadBufferLength;
  v17 = MEMORY[0x24BDACB70];
  while (1)
  {
    *p_oobPairingInfoReadBufferLength = 1024;
    v18 = gLogObjects;
    v19 = gNumLogObjects;
    if (gLogObjects)
      v20 = gNumLogObjects < 8;
    else
      v20 = 1;
    if (v20)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)v115 = v18;
        *(_WORD *)&v115[8] = 1024;
        *(_DWORD *)&v115[10] = v19;
        _os_log_error_impl(&dword_21722C000, v17, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
      }
      v21 = v17;
      v22 = v17;
    }
    else
    {
      v22 = *(id *)(gLogObjects + 56);
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v44 = *p_oobPairingInfoReadBufferLength;
      -[ACCTransportIOAccessoryOOBPairing endpointUUID](self, "endpointUUID");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      ioConnect = self->super._ioConnect;
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)v115 = v44;
      *(_WORD *)&v115[8] = 2112;
      *(_QWORD *)&v115[10] = v45;
      *(_WORD *)&v115[18] = 1024;
      *(_DWORD *)&v115[20] = ioConnect;
      _os_log_debug_impl(&dword_21722C000, v22, OS_LOG_TYPE_DEBUG, "read upto %zu bytes for OOB Pairing Info (endpointUUID %@), call IOAccessoryOOBPairingInterfaceGetPairingInfo, ioConnect %d", buf, 0x1Cu);

    }
    if (!self->super._ioConnect)
    {
      v27 = gLogObjects;
      v28 = gNumLogObjects;
      if (gLogObjects && gNumLogObjects >= 8)
      {
        v29 = *(id *)(gLogObjects + 56);
      }
      else
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)v115 = v27;
          *(_WORD *)&v115[8] = 1024;
          *(_DWORD *)&v115[10] = v28;
          _os_log_error_impl(&dword_21722C000, v17, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v43 = v17;
        v29 = v17;
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v51 = self->super._ioConnect;
        -[ACCTransportIOAccessoryOOBPairing endpointUUID](self, "endpointUUID");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[ACCTransportIOAccessoryOOBPairing parentConnectionUUID](self, "parentConnectionUUID");
        v53 = v15;
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v115 = v51;
        *(_WORD *)&v115[4] = 2112;
        *(_QWORD *)&v115[6] = v52;
        *(_WORD *)&v115[14] = 2112;
        *(_QWORD *)&v115[16] = v54;
        *(_WORD *)&v115[24] = 1024;
        *(_DWORD *)&v115[26] = v55;
        _os_log_error_impl(&dword_21722C000, v29, OS_LOG_TYPE_ERROR, "ERROR: No _ioConnect(%d) while trying to get OOB Pairing Info, endpointUUID %@, parentUUID %@, ioService %d", buf, 0x22u);

        v15 = v53;
      }

      v31 = 1024;
      goto LABEL_81;
    }
    PairingInfo = IOAccessoryOOBPairingInterfaceGetPairingInfo();
    v24 = gLogObjects;
    v25 = gNumLogObjects;
    if (gLogObjects && gNumLogObjects >= 8)
    {
      v26 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)v115 = v24;
        *(_WORD *)&v115[8] = 1024;
        *(_DWORD *)&v115[10] = v25;
        _os_log_error_impl(&dword_21722C000, v17, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
      }
      v30 = v17;
      v26 = v17;
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      v47 = *p_oobPairingInfoReadBufferLength;
      -[ACCTransportIOAccessoryOOBPairing endpointUUID](self, "endpointUUID");
      v111 = v15;
      v15 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)v115 = v47;
      *(_WORD *)&v115[8] = 2112;
      *(_QWORD *)&v115[10] = v15;
      *(_WORD *)&v115[18] = 1024;
      *(_DWORD *)&v115[20] = PairingInfo;
      _os_log_debug_impl(&dword_21722C000, v26, OS_LOG_TYPE_DEBUG, "read %zu bytes for OOB Pairing Info (endpointUUID %@), result = 0x%X", buf, 0x1Cu);

      LOBYTE(v15) = v111;
    }

    if (PairingInfo)
      break;
    v31 = *p_oobPairingInfoReadBufferLength;
    -[ACCTransportIOAccessoryOOBPairing delegate](self, "delegate");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v32
      && (v33 = (void *)v32,
          -[ACCTransportIOAccessoryOOBPairing delegate](self, "delegate"),
          v34 = (void *)objc_claimAutoreleasedReturnValue(),
          v35 = objc_opt_respondsToSelector(),
          v34,
          v33,
          (v35 & 1) != 0))
    {
      *(_WORD *)buf = 4;
      activeType = self->_activeType;
      v36 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      objc_msgSend(v36, "appendBytes:length:", buf, 2);
      objc_msgSend(v36, "appendBytes:length:", &activeType, 2);
      objc_msgSend(v36, "appendBytes:length:", self->_oobPairingInfoReadBuffer, *p_oobPairingInfoReadBufferLength);
      -[ACCTransportIOAccessoryOOBPairing delegate](self, "delegate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACCTransportIOAccessoryOOBPairing endpointUUID](self, "endpointUUID");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "IOAccessoryOOBPairingInfoArrived:endpointUUID:", v36, v38);

    }
    else
    {
      v39 = gLogObjects;
      v40 = gNumLogObjects;
      if (gLogObjects && gNumLogObjects >= 8)
      {
        v41 = *(id *)(gLogObjects + 56);
      }
      else
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)v115 = v39;
          *(_WORD *)&v115[8] = 1024;
          *(_DWORD *)&v115[10] = v40;
          _os_log_error_impl(&dword_21722C000, v17, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v42 = v17;
        v41 = v17;
      }
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        oobPairingDataReadBufferLength = self->_oobPairingDataReadBufferLength;
        -[ACCTransportIOAccessoryOOBPairing endpointUUID](self, "endpointUUID");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[ACCTransportIOAccessoryOOBPairing parentConnectionUUID](self, "parentConnectionUUID");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        *(_QWORD *)v115 = oobPairingDataReadBufferLength;
        *(_WORD *)&v115[8] = 2112;
        *(_QWORD *)&v115[10] = v49;
        *(_WORD *)&v115[18] = 2112;
        *(_QWORD *)&v115[20] = v50;
        *(_WORD *)&v115[28] = 1024;
        v116 = 0;
        _os_log_error_impl(&dword_21722C000, v41, OS_LOG_TYPE_ERROR, "received OOB Pairing Info (%zu) but delegate doesn't handle it, endpointUUID %@, parentUUID %@, result = %02x", buf, 0x26u);

      }
    }
    v15 = 1;
LABEL_81:
    if (v31 != 1024)
      return v15;
  }
  v98 = gLogObjects;
  v99 = gNumLogObjects;
  if (gLogObjects && gNumLogObjects >= 8)
  {
    v100 = *(id *)(gLogObjects + 56);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)v115 = v98;
      *(_WORD *)&v115[8] = 1024;
      *(_DWORD *)&v115[10] = v99;
      _os_log_error_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
    }
    v100 = MEMORY[0x24BDACB70];
    v104 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
  {
    -[ACCTransportIOAccessoryOOBPairing endpointUUID](self, "endpointUUID");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACCTransportIOAccessoryOOBPairing parentConnectionUUID](self, "parentConnectionUUID");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)v115 = v107;
    *(_WORD *)&v115[8] = 2112;
    *(_QWORD *)&v115[10] = v108;
    *(_WORD *)&v115[18] = 1024;
    *(_DWORD *)&v115[20] = PairingInfo;
    _os_log_error_impl(&dword_21722C000, v100, OS_LOG_TYPE_ERROR, "error reading OOB Pairing Info, endpointUUID %@, parentUUID %@, result = %02x", buf, 0x1Cu);

  }
  return v15;
}

- (void)_registerReadCallback
{
  OUTLINED_FUNCTION_6(&dword_21722C000, a2, a3, "ERROR registering OOBPairingReceiveCallback: 0x%x", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

- (void)_checkAccInfo
{
  NSString *v3;
  NSString *deviceVendorName;
  NSString *v5;
  NSString *deviceName;
  NSString *v7;
  NSString *deviceModelNumber;
  NSString *v9;
  NSString *deviceHardwareRevision;
  NSString *v11;
  NSString *deviceFirmwareRevision;
  NSString *v13;
  NSString *deviceSerialNumber;
  NSString *v15;
  NSString *deviceDockType;
  NSMutableData *SupportedPairingTypes;
  NSMutableData *deviceSupportedTypes;
  NSMutableData *v19;
  NSMutableData *v20;
  NSNumber *v21;
  NSNumber *supports2way;
  NSNumber *v23;
  NSNumber *devicePlatformID;
  NSObject *v25;
  id v26;
  unsigned int v27;
  uint64_t v28;
  NSString *v29;
  NSString *v30;
  NSString *v31;
  NSString *v32;
  NSString *v33;
  NSString *v34;
  NSString *v35;
  NSMutableData *v36;
  int activeType;
  NSNumber *v38;
  NSNumber *v39;
  void *v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  unsigned int v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  NSString *v50;
  __int16 v51;
  NSString *v52;
  __int16 v53;
  NSString *v54;
  __int16 v55;
  NSString *v56;
  __int16 v57;
  NSString *v58;
  __int16 v59;
  NSString *v60;
  __int16 v61;
  NSString *v62;
  __int16 v63;
  NSMutableData *v64;
  __int16 v65;
  int v66;
  __int16 v67;
  NSNumber *v68;
  __int16 v69;
  NSNumber *v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  -[ACCTransportIOAccessoryBase ioService](self, "ioService");
  v3 = (NSString *)IOAccessoryOOBPairingInterfaceCopyDeviceVendorName();
  deviceVendorName = self->_deviceVendorName;
  self->_deviceVendorName = v3;

  if (!self->_deviceVendorName)
  {
    self->_deviceVendorName = (NSString *)CFSTR("Unknown");

  }
  -[ACCTransportIOAccessoryBase ioService](self, "ioService");
  v5 = (NSString *)IOAccessoryOOBPairingInterfaceCopyDeviceName();
  deviceName = self->_deviceName;
  self->_deviceName = v5;

  if (!self->_deviceName)
  {
    self->_deviceName = (NSString *)CFSTR("Unknown");

  }
  -[ACCTransportIOAccessoryBase ioService](self, "ioService");
  v7 = (NSString *)IOAccessoryOOBPairingInterfaceCopyDeviceModelNumber();
  deviceModelNumber = self->_deviceModelNumber;
  self->_deviceModelNumber = v7;

  if (!self->_deviceModelNumber)
  {
    self->_deviceModelNumber = (NSString *)CFSTR("Unknown");

  }
  -[ACCTransportIOAccessoryBase ioService](self, "ioService");
  v9 = (NSString *)IOAccessoryOOBPairingInterfaceCopyDeviceHardwareRevision();
  deviceHardwareRevision = self->_deviceHardwareRevision;
  self->_deviceHardwareRevision = v9;

  if (!self->_deviceHardwareRevision)
  {
    self->_deviceHardwareRevision = (NSString *)CFSTR("Unknown");

  }
  -[ACCTransportIOAccessoryBase ioService](self, "ioService");
  v11 = (NSString *)IOAccessoryOOBPairingInterfaceCopyDeviceFirmwareRevision();
  deviceFirmwareRevision = self->_deviceFirmwareRevision;
  self->_deviceFirmwareRevision = v11;

  if (!self->_deviceFirmwareRevision)
  {
    self->_deviceFirmwareRevision = (NSString *)CFSTR("Unknown");

  }
  -[ACCTransportIOAccessoryBase ioService](self, "ioService");
  v13 = (NSString *)IOAccessoryOOBPairingInterfaceCopyDeviceSerialNumber();
  deviceSerialNumber = self->_deviceSerialNumber;
  self->_deviceSerialNumber = v13;

  if (!self->_deviceSerialNumber)
  {
    self->_deviceSerialNumber = (NSString *)CFSTR("Unknown");

  }
  -[ACCTransportIOAccessoryBase ioService](self, "ioService");
  v15 = (NSString *)IOAccessoryOOBPairingInterfaceCopyDeviceDockType();
  deviceDockType = self->_deviceDockType;
  self->_deviceDockType = v15;

  if (!self->_deviceDockType)
  {
    self->_deviceDockType = (NSString *)CFSTR("Unknown");

  }
  -[ACCTransportIOAccessoryBase ioService](self, "ioService");
  SupportedPairingTypes = (NSMutableData *)IOAccessoryOOBPairingInterfaceGetSupportedPairingTypes();
  deviceSupportedTypes = self->_deviceSupportedTypes;
  self->_deviceSupportedTypes = SupportedPairingTypes;

  if (!self->_deviceSupportedTypes)
  {
    v19 = (NSMutableData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
    v20 = self->_deviceSupportedTypes;
    self->_deviceSupportedTypes = v19;

  }
  -[ACCTransportIOAccessoryBase ioService](self, "ioService");
  self->_activeType = -[ACCTransportIOAccessoryOOBPairing _convertOOBPairingTypeFromIOAccessory:](self, "_convertOOBPairingTypeFromIOAccessory:", IOAccessoryOOBPairingInterfaceGetActivePairingType());
  -[ACCTransportIOAccessoryBase ioService](self, "ioService");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", IOAccessoryOOBPairingInterfaceSupports2Way() != 0);
  v21 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  supports2way = self->_supports2way;
  self->_supports2way = v21;

  -[ACCTransportIOAccessoryBase ioService](self, "ioService");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", IOAccessoryOOBPairingInterfaceCopyDevicePlatformID());
  v23 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  devicePlatformID = self->_devicePlatformID;
  self->_devicePlatformID = v23;

  if (gLogObjects && gNumLogObjects >= 8)
  {
    v25 = *(id *)(gLogObjects + 56);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v25 = MEMORY[0x24BDACB70];
    v26 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    v27 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
    -[ACCTransportIOAccessoryOOBPairing endpointUUID](self, "endpointUUID");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = self->_deviceVendorName;
    v30 = self->_deviceName;
    v31 = self->_deviceModelNumber;
    v32 = self->_deviceHardwareRevision;
    v33 = self->_deviceFirmwareRevision;
    v34 = self->_deviceSerialNumber;
    v35 = self->_deviceDockType;
    v36 = self->_deviceSupportedTypes;
    activeType = self->_activeType;
    v38 = self->_supports2way;
    v39 = self->_devicePlatformID;
    *(_DWORD *)buf = 136318722;
    v42 = "-[ACCTransportIOAccessoryOOBPairing _checkAccInfo]";
    v43 = 1024;
    v44 = 437;
    v45 = 1024;
    v46 = v27;
    v47 = 2112;
    v48 = v28;
    v40 = (void *)v28;
    v49 = 2112;
    v50 = v29;
    v51 = 2112;
    v52 = v30;
    v53 = 2112;
    v54 = v31;
    v55 = 2112;
    v56 = v32;
    v57 = 2112;
    v58 = v33;
    v59 = 2112;
    v60 = v34;
    v61 = 2112;
    v62 = v35;
    v63 = 2112;
    v64 = v36;
    v65 = 1024;
    v66 = activeType;
    v67 = 2112;
    v68 = v38;
    v69 = 2112;
    v70 = v39;
    _os_log_impl(&dword_21722C000, v25, OS_LOG_TYPE_INFO, "%s:%d ioService = %d, endpointUUID %@, vendorName %@, name %@, model %@, hwRev %@, fwRev %@, ser %@, dock %@, supported %@, active %d, 2way %@, platformID %@", buf, 0x8Cu);

  }
}

- (int)_convertOOBPairingTypeFromIOAccessory:(int)a3
{
  int v3;

  if (a3 == 1)
    v3 = 1;
  else
    v3 = 2;
  if (a3)
    return v3;
  else
    return 0;
}

- (BOOL)transmitData:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  id v8;
  unsigned __int16 *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned int v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  NSString *endpointUUID;
  id v19;
  void *v20;
  char v21;
  NSObject *v22;
  char v23;
  int v24;
  BOOL v25;
  id v26;
  NSString *v27;
  const char *v28;
  id v29;
  NSString *v30;
  id v31;
  NSString *v33;
  unsigned int ioConnect;
  int v35;
  _BYTE v36[20];
  __int16 v37;
  unint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 8;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ACCTransportIOAccessoryOOBPairing transmitData:].cold.7();

  if (!v4)
    goto LABEL_68;
  v8 = objc_retainAutorelease(v4);
  v9 = (unsigned __int16 *)objc_msgSend(v8, "bytes");
  v10 = objc_msgSend(v8, "length");
  v11 = v10;
  if (!v9 || (v12 = v10 - 4, v10 < 4))
  {
    if (gLogObjects && gNumLogObjects >= 8)
    {
      v16 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v16 = MEMORY[0x24BDACB70];
      v17 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      endpointUUID = self->_endpointUUID;
      v35 = 134218242;
      *(_QWORD *)v36 = v11;
      *(_WORD *)&v36[8] = 2112;
      *(_QWORD *)&v36[10] = endpointUUID;
      _os_log_impl(&dword_21722C000, v16, OS_LOG_TYPE_DEFAULT, "ERROR: Not enough bytes (%lu) for message header for OOBPairing transmit, endpointUUID %@", (uint8_t *)&v35, 0x16u);
    }
    goto LABEL_67;
  }
  v13 = *v9;
  if (v13 >= 2)
  {
    v14 = v9[1];
    if (!-[ACCTransportIOAccessoryOOBPairing supportsType:](self, "supportsType:", v9[1]))
    {
      if (gLogObjects && gNumLogObjects >= 8)
      {
        v22 = *(id *)(gLogObjects + 56);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v22 = MEMORY[0x24BDACB70];
        v26 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v27 = self->_endpointUUID;
        v35 = 67109378;
        *(_DWORD *)v36 = v14;
        *(_WORD *)&v36[4] = 2112;
        *(_QWORD *)&v36[6] = v27;
        v28 = "ERROR: PairingType (%d) not supported for OOBPairing transmit, endpointUUID %@";
LABEL_57:
        _os_log_impl(&dword_21722C000, v22, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)&v35, 0x12u);
      }
LABEL_58:

LABEL_59:
      if (gLogObjects && gNumLogObjects >= 8)
      {
        v16 = *(id *)(gLogObjects + 56);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v16 = MEMORY[0x24BDACB70];
        v31 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing transmitData:].cold.1();
LABEL_67:

LABEL_68:
      v25 = 0;
      goto LABEL_69;
    }
  }
  if (gLogObjects && gNumLogObjects >= 8)
  {
    v15 = *(id *)(gLogObjects + 56);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v15 = MEMORY[0x24BDACB70];
    v19 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v33 = self->_endpointUUID;
    ioConnect = self->super._ioConnect;
    v35 = 138413058;
    *(_QWORD *)v36 = v33;
    *(_WORD *)&v36[8] = 1024;
    *(_DWORD *)&v36[10] = ioConnect;
    *(_WORD *)&v36[14] = 1024;
    *(_DWORD *)&v36[16] = v13;
    v37 = 2048;
    v38 = v12;
    _os_log_debug_impl(&dword_21722C000, v15, OS_LOG_TYPE_DEBUG, "OOBPairing: endpointUUID %@, ioConnect %d, transmitData: messageID %d, payloadLen %lu", (uint8_t *)&v35, 0x22u);
  }

  switch(v13)
  {
    case 0u:
      -[ACCTransportIOAccessoryOOBPairing delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "IOAccessoryOOBPairingDataStartedForEndpointUUID:", self->_endpointUUID);
      goto LABEL_38;
    case 1u:
      -[ACCTransportIOAccessoryOOBPairing delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "IOAccessoryOOBPairingDataFinishedForEndpointUUID:", self->_endpointUUID);
LABEL_38:
      v23 = v21;

      if ((v23 & 1) == 0)
        goto LABEL_59;
      goto LABEL_43;
    case 2u:
      v24 = IOAccessoryOOBPairingInterfaceSendPairingInfo();
      goto LABEL_42;
    case 3u:
      v24 = IOAccessoryOOBPairingInterfaceSendPairingData();
LABEL_42:
      if (v24)
        goto LABEL_59;
LABEL_43:
      v25 = 1;
      break;
    default:
      if (gLogObjects && gNumLogObjects >= 8)
      {
        v22 = *(id *)(gLogObjects + 56);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v22 = MEMORY[0x24BDACB70];
        v29 = MEMORY[0x24BDACB70];
      }
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        goto LABEL_58;
      v30 = self->_endpointUUID;
      v35 = 67109378;
      *(_DWORD *)v36 = v13;
      *(_WORD *)&v36[4] = 2112;
      *(_QWORD *)&v36[6] = v30;
      v28 = "ERROR: Invalid messageID (%d) for OOBPairing transmit, endpointUUID %@";
      goto LABEL_57;
  }
LABEL_69:

  return v25;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[ACCTransportIOAccessoryOOBPairing endpointUUID](self, "endpointUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("OOBPairing %@\n"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v6);

  v7 = (void *)MEMORY[0x24BDD17C8];
  -[ACCTransportIOAccessoryOOBPairing deviceVendorName](self, "deviceVendorName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("    deviceVendorName %@\n"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v9);

  v10 = (void *)MEMORY[0x24BDD17C8];
  -[ACCTransportIOAccessoryOOBPairing deviceName](self, "deviceName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("    deviceName %@\n"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v12);

  v13 = (void *)MEMORY[0x24BDD17C8];
  -[ACCTransportIOAccessoryOOBPairing deviceModelNumber](self, "deviceModelNumber");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("    deviceModelNumber %@\n"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v15);

  v16 = (void *)MEMORY[0x24BDD17C8];
  -[ACCTransportIOAccessoryOOBPairing deviceHardwareRevision](self, "deviceHardwareRevision");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("    deviceHardwareRevision %@\n"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v18);

  v19 = (void *)MEMORY[0x24BDD17C8];
  -[ACCTransportIOAccessoryOOBPairing deviceFirmwareRevision](self, "deviceFirmwareRevision");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("    deviceFirmwareRevision %@\n"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v21);

  v22 = (void *)MEMORY[0x24BDD17C8];
  -[ACCTransportIOAccessoryOOBPairing deviceSerialNumber](self, "deviceSerialNumber");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("    deviceSerialNumber %@\n"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v24);

  v25 = (void *)MEMORY[0x24BDD17C8];
  -[ACCTransportIOAccessoryOOBPairing deviceDockType](self, "deviceDockType");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", CFSTR("    deviceDockType %@\n"), v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v27);

  v28 = (void *)MEMORY[0x24BDD17C8];
  -[ACCTransportIOAccessoryOOBPairing deviceUID](self, "deviceUID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringWithFormat:", CFSTR("    deviceUID %@\n"), v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v30);

  v31 = (void *)MEMORY[0x24BDD17C8];
  -[ACCTransportIOAccessoryOOBPairing deviceSupportedTypes](self, "deviceSupportedTypes");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringWithFormat:", CFSTR("    deviceSupportedTypes %@\n"), v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v33);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("    activeType %d\n"), -[ACCTransportIOAccessoryOOBPairing activeType](self, "activeType"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v34);

  v35 = (void *)MEMORY[0x24BDD17C8];
  -[ACCTransportIOAccessoryOOBPairing supports2way](self, "supports2way");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "stringWithFormat:", CFSTR("    Supports2Way %@\n"), v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v37);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("    IOService %d\n"), -[ACCTransportIOAccessoryBase ioService](self, "ioService"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v38);

  return v3;
}

- (NSString)deviceVendorName
{
  NSString *deviceVendorName;
  NSString *v4;
  NSString *v5;

  deviceVendorName = self->_deviceVendorName;
  if (!deviceVendorName || -[NSString isEqualToString:](deviceVendorName, "isEqualToString:", CFSTR("Unknown")))
  {
    -[ACCTransportIOAccessoryBase ioService](self, "ioService");
    v4 = (NSString *)IOAccessoryOOBPairingInterfaceCopyDeviceVendorName();
    v5 = self->_deviceVendorName;
    self->_deviceVendorName = v4;

    if (!self->_deviceVendorName)
    {
      self->_deviceVendorName = (NSString *)CFSTR("Unknown");

    }
  }
  return self->_deviceVendorName;
}

- (NSString)deviceName
{
  NSString *deviceName;
  NSString *v4;
  NSString *v5;

  deviceName = self->_deviceName;
  if (!deviceName || -[NSString isEqualToString:](deviceName, "isEqualToString:", CFSTR("Unknown")))
  {
    -[ACCTransportIOAccessoryBase ioService](self, "ioService");
    v4 = (NSString *)IOAccessoryOOBPairingInterfaceCopyDeviceName();
    v5 = self->_deviceName;
    self->_deviceName = v4;

    if (!self->_deviceName)
    {
      self->_deviceName = (NSString *)CFSTR("Unknown");

    }
  }
  return self->_deviceName;
}

- (NSString)deviceModelNumber
{
  NSString *deviceModelNumber;
  NSString *v4;
  NSString *v5;

  deviceModelNumber = self->_deviceModelNumber;
  if (!deviceModelNumber || -[NSString isEqualToString:](deviceModelNumber, "isEqualToString:", CFSTR("Unknown")))
  {
    -[ACCTransportIOAccessoryBase ioService](self, "ioService");
    v4 = (NSString *)IOAccessoryOOBPairingInterfaceCopyDeviceModelNumber();
    v5 = self->_deviceModelNumber;
    self->_deviceModelNumber = v4;

    if (!self->_deviceModelNumber)
    {
      self->_deviceModelNumber = (NSString *)CFSTR("Unknown");

    }
  }
  return self->_deviceModelNumber;
}

- (NSString)deviceHardwareRevision
{
  NSString *deviceHardwareRevision;
  NSString *v4;
  NSString *v5;

  deviceHardwareRevision = self->_deviceHardwareRevision;
  if (!deviceHardwareRevision
    || -[NSString isEqualToString:](deviceHardwareRevision, "isEqualToString:", CFSTR("Unknown")))
  {
    -[ACCTransportIOAccessoryBase ioService](self, "ioService");
    v4 = (NSString *)IOAccessoryOOBPairingInterfaceCopyDeviceHardwareRevision();
    v5 = self->_deviceHardwareRevision;
    self->_deviceHardwareRevision = v4;

    if (!self->_deviceHardwareRevision)
    {
      self->_deviceHardwareRevision = (NSString *)CFSTR("Unknown");

    }
  }
  return self->_deviceHardwareRevision;
}

- (NSString)deviceFirmwareRevision
{
  NSString *deviceFirmwareRevision;
  NSString *v4;
  NSString *v5;

  deviceFirmwareRevision = self->_deviceFirmwareRevision;
  if (!deviceFirmwareRevision
    || -[NSString isEqualToString:](deviceFirmwareRevision, "isEqualToString:", CFSTR("Unknown")))
  {
    -[ACCTransportIOAccessoryBase ioService](self, "ioService");
    v4 = (NSString *)IOAccessoryOOBPairingInterfaceCopyDeviceFirmwareRevision();
    v5 = self->_deviceFirmwareRevision;
    self->_deviceFirmwareRevision = v4;

    if (!self->_deviceFirmwareRevision)
    {
      self->_deviceFirmwareRevision = (NSString *)CFSTR("Unknown");

    }
  }
  return self->_deviceFirmwareRevision;
}

- (NSString)deviceSerialNumber
{
  NSString *deviceSerialNumber;
  NSString *v4;
  NSString *v5;

  deviceSerialNumber = self->_deviceSerialNumber;
  if (!deviceSerialNumber || -[NSString isEqualToString:](deviceSerialNumber, "isEqualToString:", CFSTR("Unknown")))
  {
    -[ACCTransportIOAccessoryBase ioService](self, "ioService");
    v4 = (NSString *)IOAccessoryOOBPairingInterfaceCopyDeviceSerialNumber();
    v5 = self->_deviceSerialNumber;
    self->_deviceSerialNumber = v4;

    if (!self->_deviceSerialNumber)
    {
      self->_deviceSerialNumber = (NSString *)CFSTR("Unknown");

    }
  }
  return self->_deviceSerialNumber;
}

- (NSString)deviceDockType
{
  NSString *deviceDockType;
  NSString *v4;
  NSString *v5;

  deviceDockType = self->_deviceDockType;
  if (!deviceDockType || -[NSString isEqualToString:](deviceDockType, "isEqualToString:", CFSTR("Unknown")))
  {
    -[ACCTransportIOAccessoryBase ioService](self, "ioService");
    v4 = (NSString *)IOAccessoryOOBPairingInterfaceCopyDeviceDockType();
    v5 = self->_deviceDockType;
    self->_deviceDockType = v4;

    if (!self->_deviceDockType)
    {
      self->_deviceDockType = (NSString *)CFSTR("Unknown");

    }
  }
  return self->_deviceDockType;
}

- (NSString)deviceUID
{
  NSString *deviceUID;
  NSString *v4;
  NSString *v5;
  NSObject *v6;
  BOOL v7;
  id v8;
  id v9;
  NSString *v10;
  NSObject *v11;
  NSString *v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  NSString *v16;
  int v18;
  NSString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  deviceUID = self->_deviceUID;
  if (deviceUID && !-[NSString isEqualToString:](deviceUID, "isEqualToString:", CFSTR("Unknown")))
    goto LABEL_26;
  -[ACCTransportIOAccessoryBase upstreamManagerService](self, "upstreamManagerService");
  v4 = (NSString *)IOAccessoryManagerCopyAccessoryDeviceUID();
  if (!v4)
  {
    if (gLogObjects)
      v7 = gNumLogObjects < 8;
    else
      v7 = 1;
    if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v11 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    else
    {
      v11 = *(id *)(gLogObjects + 56);
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_21722C000, v11, OS_LOG_TYPE_DEFAULT, "ERROR: IOAccessoryManagerCopyAccessoryDeviceUID failed", (uint8_t *)&v18, 2u);
    }

    goto LABEL_25;
  }
  v5 = self->_deviceUID;
  self->_deviceUID = v4;

  if (gLogObjects && gNumLogObjects >= 8)
  {
    v6 = *(id *)(gLogObjects + 56);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v10 = self->_deviceUID;
    v18 = 138412290;
    v19 = v10;
    _os_log_impl(&dword_21722C000, v6, OS_LOG_TYPE_INFO, "from IOAccessoryManagerCopyAccessoryDeviceUID, _deviceUID: %@", (uint8_t *)&v18, 0xCu);
  }

  if (!self->_deviceUID)
  {
LABEL_25:
    v12 = self->_deviceUID;
    self->_deviceUID = (NSString *)CFSTR("Unknown");

  }
LABEL_26:
  if (gLogObjects)
    v13 = gNumLogObjects < 8;
  else
    v13 = 1;
  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v15 = MEMORY[0x24BDACB70];
    v14 = MEMORY[0x24BDACB70];
  }
  else
  {
    v15 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = self->_deviceUID;
    v18 = 138412290;
    v19 = v16;
    _os_log_impl(&dword_21722C000, v15, OS_LOG_TYPE_INFO, "return _deviceUID: %@", (uint8_t *)&v18, 0xCu);
  }

  return self->_deviceUID;
}

- (NSNumber)devicePlatformID
{
  NSNumber *v3;
  NSNumber *devicePlatformID;
  BOOL v5;
  id v6;
  NSObject *v7;
  NSNumber *v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  NSNumber *v12;
  int v14;
  NSNumber *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!self->_devicePlatformID)
  {
    -[ACCTransportIOAccessoryBase ioService](self, "ioService");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", IOAccessoryOOBPairingInterfaceCopyDevicePlatformID());
    v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    devicePlatformID = self->_devicePlatformID;
    self->_devicePlatformID = v3;

    if (gLogObjects)
      v5 = gNumLogObjects < 8;
    else
      v5 = 1;
    if (v5)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v6 = MEMORY[0x24BDACB70];
    }
    else
    {
      v7 = *(id *)(gLogObjects + 56);
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = self->_devicePlatformID;
      v14 = 138412290;
      v15 = v8;
      _os_log_impl(&dword_21722C000, v7, OS_LOG_TYPE_INFO, "from IOAccessoryOOBPairingInterfaceCopyDevicePlatformID, _devicePlatformID: %@", (uint8_t *)&v14, 0xCu);
    }

  }
  if (gLogObjects)
    v9 = gNumLogObjects < 8;
  else
    v9 = 1;
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v11 = MEMORY[0x24BDACB70];
    v10 = MEMORY[0x24BDACB70];
  }
  else
  {
    v11 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = self->_devicePlatformID;
    v14 = 138412290;
    v15 = v12;
    _os_log_impl(&dword_21722C000, v11, OS_LOG_TYPE_INFO, "return _devicePlatformID: %@", (uint8_t *)&v14, 0xCu);
  }

  return self->_devicePlatformID;
}

- (NSMutableData)deviceSupportedTypes
{
  NSMutableData *deviceSupportedTypes;
  NSMutableData *v4;
  NSMutableData *v5;

  deviceSupportedTypes = self->_deviceSupportedTypes;
  if (!deviceSupportedTypes)
  {
    v4 = (NSMutableData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
    v5 = self->_deviceSupportedTypes;
    self->_deviceSupportedTypes = v4;

    deviceSupportedTypes = self->_deviceSupportedTypes;
  }
  return deviceSupportedTypes;
}

- (NSNumber)supports2way
{
  NSNumber *supports2way;
  NSNumber *v4;
  NSNumber *v5;

  supports2way = self->_supports2way;
  if (!supports2way)
  {
    -[ACCTransportIOAccessoryBase ioService](self, "ioService");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", IOAccessoryOOBPairingInterfaceSupports2Way() != 0);
    v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v5 = self->_supports2way;
    self->_supports2way = v4;

    supports2way = self->_supports2way;
  }
  return supports2way;
}

- (ACCTransportIOAccessoryOOBPairingProtocol)delegate
{
  return (ACCTransportIOAccessoryOOBPairingProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setDeviceVendorName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceVendorName, a3);
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
}

- (void)setDeviceModelNumber:(id)a3
{
  objc_storeStrong((id *)&self->_deviceModelNumber, a3);
}

- (void)setDeviceHardwareRevision:(id)a3
{
  objc_storeStrong((id *)&self->_deviceHardwareRevision, a3);
}

- (void)setDeviceFirmwareRevision:(id)a3
{
  objc_storeStrong((id *)&self->_deviceFirmwareRevision, a3);
}

- (void)setDeviceSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_deviceSerialNumber, a3);
}

- (void)setDeviceDockType:(id)a3
{
  objc_storeStrong((id *)&self->_deviceDockType, a3);
}

- (void)setDeviceUID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceUID, a3);
}

- (void)setDevicePlatformID:(id)a3
{
  objc_storeStrong((id *)&self->_devicePlatformID, a3);
}

- (void)setDeviceSupportedTypes:(id)a3
{
  objc_storeStrong((id *)&self->_deviceSupportedTypes, a3);
}

- (int)activeType
{
  return self->_activeType;
}

- (void)setActiveType:(int)a3
{
  self->_activeType = a3;
}

- (void)setSupports2way:(id)a3
{
  objc_storeStrong((id *)&self->_supports2way, a3);
}

- (NSString)endpointUUID
{
  return self->_endpointUUID;
}

- (void)setEndpointUUID:(id)a3
{
  objc_storeStrong((id *)&self->_endpointUUID, a3);
}

- (NSString)parentConnectionUUID
{
  return (NSString *)objc_loadWeakRetained((id *)&self->_parentConnectionUUID);
}

- (void)setParentConnectionUUID:(id)a3
{
  objc_storeWeak((id *)&self->_parentConnectionUUID, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentConnectionUUID);
  objc_storeStrong((id *)&self->_endpointUUID, 0);
  objc_storeStrong((id *)&self->_supports2way, 0);
  objc_storeStrong((id *)&self->_deviceSupportedTypes, 0);
  objc_storeStrong((id *)&self->_devicePlatformID, 0);
  objc_storeStrong((id *)&self->_deviceUID, 0);
  objc_storeStrong((id *)&self->_deviceDockType, 0);
  objc_storeStrong((id *)&self->_deviceSerialNumber, 0);
  objc_storeStrong((id *)&self->_deviceFirmwareRevision, 0);
  objc_storeStrong((id *)&self->_deviceHardwareRevision, 0);
  objc_storeStrong((id *)&self->_deviceModelNumber, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceVendorName, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_handleIncomingOOBPairingInfoData:(NSObject *)a3 .cold.2(_DWORD *a1, int a2, NSObject *a3)
{
  void *v6;
  int v7;
  int v8;
  void *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "endpointUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = a1[22];
  v8 = 138412802;
  v9 = v6;
  v10 = 1024;
  v11 = v7;
  v12 = 1024;
  v13 = a2;
  _os_log_debug_impl(&dword_21722C000, a3, OS_LOG_TYPE_DEBUG, "notified of active OOB Pairing Type (endpointUUID %@), %d -> %d", (uint8_t *)&v8, 0x18u);

  OUTLINED_FUNCTION_3();
}

- (void)_handleIncomingOOBPairingInfoData:(void *)a1 .cold.4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "endpointUUID");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_21722C000, v2, v3, "notified of active OOB Pairing Type (endpointUUID %@), call IOAccessoryOOBPairingInterfaceGetActivePairingType, ioService %d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

- (void)_handleIncomingOOBPairingInfoData:(void *)a1 .cold.6(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "endpointUUID");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_21722C000, v2, v3, "notified of available OOB Pairing info (endpointUUID %@), ioService %d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

- (void)_handleIncomingOOBPairingInfoData:(NSObject *)a3 .cold.8(int *a1, void *a2, NSObject *a3)
{
  int v5;
  void *v6;
  void *v7;
  _DWORD v8[2];
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = *a1;
  objc_msgSend(a2, "endpointUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "parentConnectionUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = 67109890;
  v8[1] = v5;
  v9 = 2112;
  v10 = v6;
  v11 = 2112;
  v12 = v7;
  v13 = 1024;
  v14 = objc_msgSend(a2, "ioService");
  _os_log_error_impl(&dword_21722C000, a3, OS_LOG_TYPE_ERROR, "ERROR: No _ioConnect(%d) while trying to get OOB Pairing Data, endpointUUID %@, parentUUID %@, ioService %d", (uint8_t *)v8, 0x22u);

}

- (void)_handleIncomingOOBPairingInfoData:(void *)a1 .cold.10(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "endpointUUID");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_21722C000, v2, v3, "notified of available OOB Pairing Data (endpointUUID %@), ioService %d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

- (void)transmitData:.cold.1()
{
  int v0;
  os_log_t v1;
  uint8_t v2[14];
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_8();
  v3 = v0;
  _os_log_error_impl(&dword_21722C000, v1, OS_LOG_TYPE_ERROR, "ERROR: send OOB pairing data, endpointUUID %@, error 0x%X", v2, 0x12u);
  OUTLINED_FUNCTION_2();
}

- (void)transmitData:.cold.7()
{
  int v0;
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[14];
  int v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_8();
  v4 = v0;
  v5 = 2112;
  v6 = v1;
  _os_log_debug_impl(&dword_21722C000, v2, OS_LOG_TYPE_DEBUG, "OOBPairing: endpointUUID %@, ioConnect %d, transmitData: %@", v3, 0x1Cu);
}

@end
