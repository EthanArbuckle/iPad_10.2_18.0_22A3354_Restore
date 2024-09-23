@implementation ACCTransportIOAccessoryEA

- (ACCTransportIOAccessoryEA)initWithDelegate:(id)a3 andIOService:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  ACCTransportIOAccessoryEA *v7;
  ACCTransportIOAccessoryEA *v8;
  NSString *endpointUUID;
  objc_super v11;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACCTransportIOAccessoryEA;
  v7 = -[ACCTransportIOAccessoryBase initWithIOAccessoryClass:ioService:](&v11, sel_initWithIOAccessoryClass_ioService_, 2, v4);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_parentConnectionUUID, 0);
    endpointUUID = v8->_endpointUUID;
    v8->_endpointUUID = 0;

    v8->_sessionOpen = 0;
    objc_storeWeak((id *)&v8->_delegate, v6);
    -[ACCTransportIOAccessoryEA _checkEAInfo](v8, "_checkEAInfo");
    v8->_eaDataReadBuffer = (char *)malloc_type_malloc(0x400uLL, 0x98873154uLL);
    v8->_eaDataReadBufferDataLength = 1024;
  }

  return v8;
}

- (void)dealloc
{
  BOOL v3;
  id v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  unsigned int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v3 = gNumLogObjects < 6;
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
    v5 = *(id *)(gLogObjects + 40);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v8 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
    _os_log_impl(&dword_21722C000, v5, OS_LOG_TYPE_DEFAULT, "deallocing EA service %d", buf, 8u);
  }

  -[ACCTransportIOAccessoryEA closeEAServiceSession](self, "closeEAServiceSession");
  objc_storeWeak((id *)&self->_delegate, 0);
  free(self->_eaDataReadBuffer);
  v6.receiver = self;
  v6.super_class = (Class)ACCTransportIOAccessoryEA;
  -[ACCTransportIOAccessoryBase dealloc](&v6, sel_dealloc);
}

- (BOOL)openEAServiceSession
{
  BOOL v3;
  id v4;
  io_service_t v5;
  kern_return_t v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  _BYTE v20[10];
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (-[ACCTransportIOAccessoryEA sessionOpen](self, "sessionOpen"))
  {
    if (gLogObjects)
      v3 = gNumLogObjects < 6;
    else
      v3 = 1;
    if (v3)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v9 = MEMORY[0x24BDACB70];
      v4 = MEMORY[0x24BDACB70];
    }
    else
    {
      v9 = *(id *)(gLogObjects + 40);
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[ACCTransportIOAccessoryEA eaProtocol](self, "eaProtocol");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACCTransportIOAccessoryEA endpointUUID](self, "endpointUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v10;
      v19 = 2112;
      *(_QWORD *)v20 = v11;
      _os_log_impl(&dword_21722C000, v9, OS_LOG_TYPE_DEFAULT, "EA session for protocol %@ is already open (endpointUUID %@)", (uint8_t *)&v17, 0x16u);

    }
  }
  else
  {
    v5 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
    v6 = IOServiceOpen(v5, *MEMORY[0x24BDAEC58], 0, &self->super._ioConnect);
    -[ACCTransportIOAccessoryEA _registerEAReadCallback](self, "_registerEAReadCallback");
    if (gLogObjects)
      v7 = gNumLogObjects < 6;
    else
      v7 = 1;
    if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    else
    {
      v12 = *(id *)(gLogObjects + 40);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[ACCTransportIOAccessoryEA eaProtocol](self, "eaProtocol");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
      -[ACCTransportIOAccessoryEA endpointUUID](self, "endpointUUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138413058;
      v18 = v13;
      v19 = 1024;
      *(_DWORD *)v20 = v14;
      *(_WORD *)&v20[4] = 1024;
      *(_DWORD *)&v20[6] = v6;
      v21 = 2112;
      v22 = v15;
      _os_log_impl(&dword_21722C000, v12, OS_LOG_TYPE_DEFAULT, "EA session for protocol %@ self.ioService %d is open result = 0x%X (endpointUUID %@)", (uint8_t *)&v17, 0x22u);

    }
    self->_sessionOpen = 1;
  }
  return -[ACCTransportIOAccessoryEA sessionOpen](self, "sessionOpen");
}

- (void)closeEAServiceSession
{
  BOOL v3;
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (-[ACCTransportIOAccessoryEA sessionOpen](self, "sessionOpen"))
  {
    IOServiceClose(self->super._ioConnect);
    self->super._ioConnect = 0;
    self->_sessionOpen = 0;
    if (gLogObjects)
      v3 = gNumLogObjects < 6;
    else
      v3 = 1;
    if (v3)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v4 = MEMORY[0x24BDACB70];
    }
    else
    {
      v7 = *(id *)(gLogObjects + 40);
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[ACCTransportIOAccessoryEA eaProtocol](self, "eaProtocol");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v8;
      v9 = "EA session for protocol %@ is closed";
LABEL_22:
      _os_log_impl(&dword_21722C000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v10, 0xCu);

    }
  }
  else
  {
    if (gLogObjects)
      v5 = gNumLogObjects < 6;
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
      v7 = *(id *)(gLogObjects + 40);
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[ACCTransportIOAccessoryEA eaProtocol](self, "eaProtocol");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v8;
      v9 = "EA session for protocol %@ is already closed";
      goto LABEL_22;
    }
  }

}

- (BOOL)_handleIncomingEAData
{
  void *v3;
  int v4;
  BOOL v5;
  unint64_t *p_eaDataReadBufferDataLength;
  NSObject *v7;
  uint64_t v8;
  int v9;
  BOOL v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  BOOL v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v29;
  id v30;
  NSObject *v31;
  unint64_t v32;
  uint8_t buf[4];
  unint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  -[ACCTransportIOAccessoryEA parentConnectionUUID](self, "parentConnectionUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = 0;
    v5 = 0;
    p_eaDataReadBufferDataLength = &self->_eaDataReadBufferDataLength;
    v7 = MEMORY[0x24BDACB70];
    while (1)
    {
      *p_eaDataReadBufferDataLength = 1024;
      if (v4)
      {
        v8 = gLogObjects;
        v9 = gNumLogObjects;
        if (gLogObjects)
          v10 = gNumLogObjects < 6;
        else
          v10 = 1;
        if (v10)
        {
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            v34 = v8;
            v35 = 1024;
            LODWORD(v36) = v9;
            _os_log_error_impl(&dword_21722C000, v7, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v11 = v7;
          v16 = v7;
        }
        else
        {
          v16 = *(id *)(gLogObjects + 40);
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          -[ACCTransportIOAccessoryEA parentConnectionUUID](self, "parentConnectionUUID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[ACCTransportIOAccessoryEA eaProtocol](self, "eaProtocol");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v34 = (unint64_t)v24;
          v35 = 2112;
          v36 = v25;
          _os_log_error_impl(&dword_21722C000, v16, OS_LOG_TYPE_ERROR, "error reading from EA session UUID %@, protocol %@", buf, 0x16u);

        }
      }
      else
      {
        v4 = IOAccessoryEAInterfaceReceiveData();
        v12 = gLogObjects;
        v13 = gNumLogObjects;
        if (gLogObjects)
          v14 = gNumLogObjects < 6;
        else
          v14 = 1;
        if (v14)
        {
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            v34 = v12;
            v35 = 1024;
            LODWORD(v36) = v13;
            _os_log_error_impl(&dword_21722C000, v7, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v15 = v7;
          v17 = v7;
        }
        else
        {
          v17 = *(id *)(gLogObjects + 40);
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          v32 = *p_eaDataReadBufferDataLength;
          -[ACCTransportIOAccessoryEA endpointUUID](self, "endpointUUID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[ACCTransportIOAccessoryEA eaProtocol](self, "eaProtocol");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218754;
          v34 = v32;
          v35 = 2112;
          v36 = v26;
          v37 = 2112;
          v38 = v27;
          v39 = 1024;
          v40 = v4;
          _os_log_debug_impl(&dword_21722C000, v17, OS_LOG_TYPE_DEBUG, "read %zu bytes from EA session UUID %@, protocol %@, result = 0x%X", buf, 0x26u);

        }
        -[ACCTransportIOAccessoryEA delegate](self, "delegate");
        v18 = objc_claimAutoreleasedReturnValue();
        if (!v18
          || (v19 = (void *)v18,
              -[ACCTransportIOAccessoryEA delegate](self, "delegate"),
              v20 = (void *)objc_claimAutoreleasedReturnValue(),
              v21 = objc_opt_respondsToSelector(),
              v20,
              v19,
              (v21 & 1) == 0))
        {
          v5 = 1;
          goto LABEL_29;
        }
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", self->_eaDataReadBuffer, *p_eaDataReadBufferDataLength);
        v16 = objc_claimAutoreleasedReturnValue();
        -[ACCTransportIOAccessoryEA delegate](self, "delegate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[ACCTransportIOAccessoryEA endpointUUID](self, "endpointUUID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "IOAccessoryEADataArrived:eaEndpointUUID:", v16, v23);

        v5 = 1;
      }

LABEL_29:
      if (*p_eaDataReadBufferDataLength != 1024)
        return v5;
    }
  }
  if (gLogObjects)
    v29 = gNumLogObjects < 6;
  else
    v29 = 1;
  if (v29)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v31 = MEMORY[0x24BDACB70];
    v30 = MEMORY[0x24BDACB70];
  }
  else
  {
    v31 = *(id *)(gLogObjects + 40);
  }
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    -[ACCTransportIOAccessoryEA _handleIncomingEAData].cold.1(self);

  return 0;
}

- (void)_registerEAReadCallback
{
  OUTLINED_FUNCTION_6(&dword_21722C000, a2, a3, "ERROR registering EAReadCallback: 0x%x", a5, a6, a7, a8, 0);
}

- (void)_checkEAInfo
{
  NSString *v3;
  NSString *eaProtocol;
  NSString *v5;
  NSString *deviceVendorName;
  NSString *v7;
  NSString *deviceName;
  NSString *v9;
  NSString *deviceModelNumber;
  NSString *v11;
  NSString *deviceHardwareRevision;
  NSString *v13;
  NSString *deviceFirmwareRevision;
  NSString *v15;
  NSString *deviceSerialNumber;
  NSString *v17;
  NSString *deviceDockType;

  -[ACCTransportIOAccessoryBase ioService](self, "ioService");
  v3 = (NSString *)IOAccessoryEAInterfaceCopyProtocolString();
  eaProtocol = self->_eaProtocol;
  self->_eaProtocol = v3;

  if (!self->_eaProtocol)
  {
    self->_eaProtocol = (NSString *)CFSTR("Unknown");

  }
  -[ACCTransportIOAccessoryBase ioService](self, "ioService");
  v5 = (NSString *)IOAccessoryEAInterfaceCopyDeviceVendorName();
  deviceVendorName = self->_deviceVendorName;
  self->_deviceVendorName = v5;

  if (!self->_deviceVendorName)
  {
    self->_deviceVendorName = (NSString *)CFSTR("Unknown");

  }
  -[ACCTransportIOAccessoryBase ioService](self, "ioService");
  v7 = (NSString *)IOAccessoryEAInterfaceCopyDeviceName();
  deviceName = self->_deviceName;
  self->_deviceName = v7;

  if (!self->_deviceName)
  {
    self->_deviceName = (NSString *)CFSTR("Unknown");

  }
  -[ACCTransportIOAccessoryBase ioService](self, "ioService");
  v9 = (NSString *)IOAccessoryEAInterfaceCopyDeviceModelNumber();
  deviceModelNumber = self->_deviceModelNumber;
  self->_deviceModelNumber = v9;

  if (!self->_deviceModelNumber)
  {
    self->_deviceModelNumber = (NSString *)CFSTR("Unknown");

  }
  -[ACCTransportIOAccessoryBase ioService](self, "ioService");
  v11 = (NSString *)IOAccessoryEAInterfaceCopyDeviceHardwareRevision();
  deviceHardwareRevision = self->_deviceHardwareRevision;
  self->_deviceHardwareRevision = v11;

  if (!self->_deviceHardwareRevision)
  {
    self->_deviceHardwareRevision = (NSString *)CFSTR("Unknown");

  }
  -[ACCTransportIOAccessoryBase ioService](self, "ioService");
  v13 = (NSString *)IOAccessoryEAInterfaceCopyDeviceFirmwareRevision();
  deviceFirmwareRevision = self->_deviceFirmwareRevision;
  self->_deviceFirmwareRevision = v13;

  if (!self->_deviceFirmwareRevision)
  {
    self->_deviceFirmwareRevision = (NSString *)CFSTR("Unknown");

  }
  -[ACCTransportIOAccessoryBase ioService](self, "ioService");
  v15 = (NSString *)IOAccessoryEAInterfaceCopyDeviceSerialNumber();
  deviceSerialNumber = self->_deviceSerialNumber;
  self->_deviceSerialNumber = v15;

  if (!self->_deviceSerialNumber)
  {
    self->_deviceSerialNumber = (NSString *)CFSTR("Unknown");

  }
  -[ACCTransportIOAccessoryBase ioService](self, "ioService");
  v17 = (NSString *)IOAccessoryEAInterfaceCopyDeviceDockType();
  deviceDockType = self->_deviceDockType;
  self->_deviceDockType = v17;

  if (!self->_deviceDockType)
  {
    self->_deviceDockType = (NSString *)CFSTR("Unknown");

  }
}

- (BOOL)transmitData:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  id v8;
  int v9;
  NSObject *v10;
  id v11;

  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 6;
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
    v7 = *(id *)(gLogObjects + 40);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ACCTransportIOAccessoryEA transmitData:].cold.3(v4, self, v7);

  v8 = objc_retainAutorelease(v4);
  objc_msgSend(v8, "bytes");
  objc_msgSend(v8, "length");
  v9 = IOAccessoryEAInterfaceSendData();
  if (v9)
  {
    if (gLogObjects && gNumLogObjects >= 6)
    {
      v10 = *(id *)(gLogObjects + 40);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryEA transmitData:].cold.1(self, v9, v10);

  }
  return v9 == 0;
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

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[ACCTransportIOAccessoryEA eaProtocol](self, "eaProtocol");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("EAProtocol %@\n"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v6);

  v7 = (void *)MEMORY[0x24BDD17C8];
  -[ACCTransportIOAccessoryEA deviceVendorName](self, "deviceVendorName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("    deviceVendorName %@\n"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v9);

  v10 = (void *)MEMORY[0x24BDD17C8];
  -[ACCTransportIOAccessoryEA deviceName](self, "deviceName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("    deviceName %@\n"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v12);

  v13 = (void *)MEMORY[0x24BDD17C8];
  -[ACCTransportIOAccessoryEA deviceModelNumber](self, "deviceModelNumber");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("    deviceModelNumber %@\n"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v15);

  v16 = (void *)MEMORY[0x24BDD17C8];
  -[ACCTransportIOAccessoryEA deviceHardwareRevision](self, "deviceHardwareRevision");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("    deviceHardwareRevision %@\n"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v18);

  v19 = (void *)MEMORY[0x24BDD17C8];
  -[ACCTransportIOAccessoryEA deviceFirmwareRevision](self, "deviceFirmwareRevision");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("    deviceFirmwareRevision %@\n"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v21);

  v22 = (void *)MEMORY[0x24BDD17C8];
  -[ACCTransportIOAccessoryEA deviceSerialNumber](self, "deviceSerialNumber");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("    deviceSerialNumber %@\n"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v24);

  v25 = (void *)MEMORY[0x24BDD17C8];
  -[ACCTransportIOAccessoryEA deviceDockType](self, "deviceDockType");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", CFSTR("    deviceDockType %@\n"), v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v27);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("    IOService %d\n"), -[ACCTransportIOAccessoryBase ioService](self, "ioService"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v28);

  return v3;
}

- (NSString)eaProtocol
{
  NSString *eaProtocol;
  NSString *v4;
  NSString *v5;

  eaProtocol = self->_eaProtocol;
  if (!eaProtocol || -[NSString isEqualToString:](eaProtocol, "isEqualToString:", CFSTR("Unknown")))
  {
    -[ACCTransportIOAccessoryBase ioService](self, "ioService");
    v4 = (NSString *)IOAccessoryEAInterfaceCopyProtocolString();
    v5 = self->_eaProtocol;
    self->_eaProtocol = v4;

    if (!self->_eaProtocol)
    {
      self->_eaProtocol = (NSString *)CFSTR("Unknown");

    }
  }
  return self->_eaProtocol;
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
    v4 = (NSString *)IOAccessoryEAInterfaceCopyDeviceVendorName();
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
    v4 = (NSString *)IOAccessoryEAInterfaceCopyDeviceName();
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
    v4 = (NSString *)IOAccessoryEAInterfaceCopyDeviceModelNumber();
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
    v4 = (NSString *)IOAccessoryEAInterfaceCopyDeviceHardwareRevision();
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
    v4 = (NSString *)IOAccessoryEAInterfaceCopyDeviceFirmwareRevision();
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
    v4 = (NSString *)IOAccessoryEAInterfaceCopyDeviceSerialNumber();
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
    v4 = (NSString *)IOAccessoryEAInterfaceCopyDeviceDockType();
    v5 = self->_deviceDockType;
    self->_deviceDockType = v4;

    if (!self->_deviceDockType)
    {
      self->_deviceDockType = (NSString *)CFSTR("Unknown");

    }
  }
  return self->_deviceDockType;
}

- (ACCTransportIOAccessoryEAProtocol)delegate
{
  return (ACCTransportIOAccessoryEAProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setEaProtocol:(id)a3
{
  objc_storeStrong((id *)&self->_eaProtocol, a3);
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

- (BOOL)sessionOpen
{
  return self->_sessionOpen;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentConnectionUUID);
  objc_storeStrong((id *)&self->_endpointUUID, 0);
  objc_storeStrong((id *)&self->_deviceDockType, 0);
  objc_storeStrong((id *)&self->_deviceSerialNumber, 0);
  objc_storeStrong((id *)&self->_deviceFirmwareRevision, 0);
  objc_storeStrong((id *)&self->_deviceHardwareRevision, 0);
  objc_storeStrong((id *)&self->_deviceModelNumber, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceVendorName, 0);
  objc_storeStrong((id *)&self->_eaProtocol, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_handleIncomingEAData
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "eaProtocol");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_1(&dword_21722C000, v2, v3, "EA session for protocol %@ is not open", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_6_1();
}

- (void)transmitData:(NSObject *)a3 .cold.1(void *a1, int a2, NSObject *a3)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "eaProtocol");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "parentConnectionUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  v12 = 1024;
  v13 = a2;
  _os_log_error_impl(&dword_21722C000, a3, OS_LOG_TYPE_ERROR, "ERROR sending data to EA protocol %@, (UUID %@) 0x%X", (uint8_t *)&v8, 0x1Cu);

  OUTLINED_FUNCTION_30();
}

- (void)transmitData:(NSObject *)a3 .cold.3(void *a1, void *a2, NSObject *a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(a1, "length");
  objc_msgSend(a2, "eaProtocol");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "parentConnectionUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 134218498;
  v9 = v5;
  v10 = 2112;
  v11 = v6;
  v12 = 2112;
  v13 = v7;
  _os_log_debug_impl(&dword_21722C000, a3, OS_LOG_TYPE_DEBUG, "transmitting EA data length %lu for protocol %@ (Connection UUID %@)", (uint8_t *)&v8, 0x20u);

  OUTLINED_FUNCTION_30();
}

@end
