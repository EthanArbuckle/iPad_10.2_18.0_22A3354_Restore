@implementation ACCTransportIOAccessoryPort

- (ACCTransportIOAccessoryPort)initWithDelegate:(id)a3 andIOService:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  ACCTransportIOAccessoryPort *v7;
  ACCTransportIOAccessoryPort *v8;
  NSString *ioAccPortEndpointUUID;
  io_service_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const __CFAllocator *v21;
  const __CFNumber *CFProperty;
  const __CFNumber *v23;
  const __CFNumber *v24;
  int v25;
  NSObject *v27;
  id v28;
  int portStreamType;
  NSObject *v30;
  id v31;
  int portIDNumber;
  int portTransportType;
  int v34;
  uint64_t valuePtr;
  objc_super v37;
  uint8_t buf[4];
  _BYTE v39[10];
  _BYTE v40[6];
  _BYTE v41[6];
  int v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v4 = *(_QWORD *)&a4;
  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v37.receiver = self;
  v37.super_class = (Class)ACCTransportIOAccessoryPort;
  v7 = -[ACCTransportIOAccessoryBase initWithIOAccessoryClass:ioService:](&v37, sel_initWithIOAccessoryClass_ioService_, 1, v4);
  v8 = v7;
  if (v7)
  {
    v7->_isAuthenticated = 0;
    ioAccPortEndpointUUID = v7->_ioAccPortEndpointUUID;
    v7->_ioAccPortEndpointUUID = 0;

    objc_storeWeak((id *)&v8->_ioAccPortParentConnectionUUID, 0);
    v8->_notificationRunLoopSource = 0;
    v8->_resistorID = 100;
    objc_storeWeak((id *)&v8->_delegate, v6);
    v10 = -[ACCTransportIOAccessoryBase ioService](v8, "ioService");
    v11 = IOServiceOpen(v10, *MEMORY[0x24BDAEC58], 0, &v8->super._ioConnect);
    if ((_DWORD)v11)
    {
      v12 = v11;
      if (gLogObjects && gNumLogObjects >= 5)
      {
        v13 = *(id *)(gLogObjects + 32);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v13 = MEMORY[0x24BDACB70];
        v14 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryPort initWithDelegate:andIOService:].cold.3(v12, v13, v15, v16, v17, v18, v19, v20);

    }
    v8->_portIDNumber = IOAccessoryPortGetPort();
    v8->_portTransportType = IOAccessoryPortGetTransportType();
    v21 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v4, CFSTR("StreamType"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    v23 = (const __CFNumber *)IORegistryEntryCreateCFProperty(v4, CFSTR("ProtocolType"), v21, 0);
    valuePtr = 0;
    if (CFProperty && (v24 = v23) != 0)
    {
      CFNumberGetValue(CFProperty, kCFNumberSInt32Type, (char *)&valuePtr + 4);
      CFNumberGetValue(v24, kCFNumberSInt32Type, &valuePtr);
      if ((_DWORD)valuePtr == 1)
      {
        v25 = HIDWORD(valuePtr) == 1;
      }
      else if ((_DWORD)valuePtr == 2 && HIDWORD(valuePtr) == 1)
      {
        v25 = 5;
      }
      else
      {
        v25 = 0;
      }
      v8->_portStreamType = v25;
      if (gLogObjects && gNumLogObjects >= 5)
      {
        v27 = *(id *)(gLogObjects + 32);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v27 = MEMORY[0x24BDACB70];
        v28 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        portStreamType = v8->_portStreamType;
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v39 = "-[ACCTransportIOAccessoryPort initWithDelegate:andIOService:]";
        *(_WORD *)&v39[8] = 1024;
        *(_DWORD *)v40 = v4;
        *(_WORD *)&v40[4] = 1024;
        *(_DWORD *)v41 = HIDWORD(valuePtr);
        *(_WORD *)&v41[4] = 1024;
        v42 = valuePtr;
        v43 = 1024;
        v44 = portStreamType;
        _os_log_impl(&dword_21722C000, v27, OS_LOG_TYPE_DEFAULT, "%s: init, service %d, (streamType %d, protocolType %d) -> portStreamType %d", buf, 0x24u);
      }

    }
    else
    {
      v8->_portStreamType = IOAccessoryPortGetStreamType();
    }
    if (gLogObjects && gNumLogObjects >= 5)
    {
      v30 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v30 = MEMORY[0x24BDACB70];
      v31 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      portIDNumber = v8->_portIDNumber;
      portTransportType = v8->_portTransportType;
      v34 = v8->_portStreamType;
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v39 = v4;
      *(_WORD *)&v39[4] = 1024;
      *(_DWORD *)&v39[6] = portIDNumber;
      *(_WORD *)v40 = 1024;
      *(_DWORD *)&v40[2] = portTransportType;
      *(_WORD *)v41 = 1024;
      *(_DWORD *)&v41[2] = v34;
      _os_log_impl(&dword_21722C000, v30, OS_LOG_TYPE_DEFAULT, "ACCTransportIOAccessoryPort: init, service %d, portID %d, portTransportType %d, portStreamType %d", buf, 0x1Au);
    }

    -[ACCTransportIOAccessoryPort _registerForIOAccessoryPortInterestNotifications](v8, "_registerForIOAccessoryPortInterestNotifications");
  }

  return v8;
}

- (void)dealloc
{
  BOOL v3;
  id v4;
  NSObject *v5;
  NSString *ioAccPortEndpointUUID;
  __CFRunLoop *Main;
  objc_super v8;
  uint8_t buf[4];
  unsigned int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v3 = gNumLogObjects < 5;
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
    v5 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v10 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
    _os_log_impl(&dword_21722C000, v5, OS_LOG_TYPE_DEFAULT, "Deallocating IOAccessoryPort with service: %d", buf, 8u);
  }

  ioAccPortEndpointUUID = self->_ioAccPortEndpointUUID;
  self->_ioAccPortEndpointUUID = 0;

  objc_storeWeak((id *)&self->_ioAccPortParentConnectionUUID, 0);
  objc_storeWeak((id *)&self->_delegate, 0);
  self->_portIDNumber = -1;
  if (self->_notificationRunLoopSource)
  {
    Main = CFRunLoopGetMain();
    CFRunLoopRemoveSource(Main, self->_notificationRunLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD598]);
    CFRelease(self->_notificationRunLoopSource);
    self->_notificationRunLoopSource = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)ACCTransportIOAccessoryPort;
  -[ACCTransportIOAccessoryBase dealloc](&v8, sel_dealloc);
}

- (void)portServiceRegistrationComplete
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  int portStreamType;
  uint64_t v9;
  char v10;
  uint64_t v11;
  int v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSString *v17;
  NSString *ioAccPortEndpointUUID;
  NSObject *v19;
  id v20;
  id v21;
  const char *v22;
  NSObject *v23;
  os_log_type_t v24;
  id v25;
  int v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[ACCTransportIOAccessoryPort delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ACCTransportIOAccessoryPort delegate](self, "delegate");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      -[ACCTransportIOAccessoryPort delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        portStreamType = self->_portStreamType;
        switch(portStreamType)
        {
          case 1:
            v9 = 0;
            v10 = 0;
            v11 = 10;
            break;
          case 4:
            v10 = 0;
            v11 = 15;
            v9 = 1;
            break;
          case 5:
            v9 = 0;
            v10 = 0;
            v11 = 16;
            break;
          default:
            v9 = 0;
            v12 = 0;
            v11 = 0;
            v10 = 1;
            goto LABEL_12;
        }
        v12 = 1;
LABEL_12:
        if (gLogObjects && gNumLogObjects >= 5)
        {
          v13 = *(id *)(gLogObjects + 32);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v13 = MEMORY[0x24BDACB70];
          v14 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v26 = 67109120;
          v27 = v11;
          _os_log_impl(&dword_21722C000, v13, OS_LOG_TYPE_INFO, " protocol:%{coreacc:ACCEndpoint_Protocol_t}d", (uint8_t *)&v26, 8u);
        }

        if ((v10 & 1) != 0)
        {
          if (gLogObjects && gNumLogObjects >= 5)
          {
            v15 = *(id *)(gLogObjects + 32);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
            v15 = MEMORY[0x24BDACB70];
            v20 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v26 = 67109120;
            v27 = 0;
            _os_log_impl(&dword_21722C000, v15, OS_LOG_TYPE_DEFAULT, "Failed to create endpointUUID! wrong protocol! protocol:%{coreacc:ACCEndpoint_Protocol_t}d", (uint8_t *)&v26, 8u);
          }
          goto LABEL_50;
        }
        -[ACCTransportIOAccessoryPort delegate](self, "delegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "IOAccessoryPortArrived:withEndpointProtocol:publish:", self, v11, v9);
        v15 = objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v15);
          v17 = (NSString *)objc_claimAutoreleasedReturnValue();
          ioAccPortEndpointUUID = self->_ioAccPortEndpointUUID;
          self->_ioAccPortEndpointUUID = v17;

          if (v12)
          {
            -[ACCTransportIOAccessoryPort delegate](self, "delegate");
            v19 = objc_claimAutoreleasedReturnValue();
            -[NSObject IOAccessoryPortPublish:](v19, "IOAccessoryPortPublish:", self);
LABEL_49:

LABEL_50:
            return;
          }
          if (gLogObjects && gNumLogObjects >= 5)
          {
            v19 = *(id *)(gLogObjects + 32);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
            v19 = MEMORY[0x24BDACB70];
            v25 = MEMORY[0x24BDACB70];
          }
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            goto LABEL_49;
          v26 = 67109120;
          v27 = v11;
          v22 = "Did not publish endpoint for protocol:%{coreacc:ACCEndpoint_Protocol_t}d";
          v23 = v19;
          v24 = OS_LOG_TYPE_INFO;
        }
        else
        {
          if (gLogObjects && gNumLogObjects >= 5)
          {
            v19 = *(id *)(gLogObjects + 32);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
            v19 = MEMORY[0x24BDACB70];
            v21 = MEMORY[0x24BDACB70];
          }
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            goto LABEL_49;
          v26 = 67109120;
          v27 = v11;
          v22 = "Failed to create endpointUUID! protocol:%{coreacc:ACCEndpoint_Protocol_t}d";
          v23 = v19;
          v24 = OS_LOG_TYPE_DEFAULT;
        }
        _os_log_impl(&dword_21722C000, v23, v24, v22, (uint8_t *)&v26, 8u);
        goto LABEL_49;
      }
    }
  }
}

- (void)_registerForIOAccessoryPortInterestNotifications
{
  OUTLINED_FUNCTION_6(&dword_21722C000, a2, a3, "error 0X%X creating IOServiceAddInterestNotification", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

- (void)_handleIncomingData:(id)a3
{
  id v4;
  NSObject *notificationPortQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  ACCTransportIOAccessoryPort *v9;

  v4 = a3;
  notificationPortQueue = self->super._notificationPortQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__ACCTransportIOAccessoryPort__handleIncomingData___block_invoke;
  v7[3] = &unk_24D71A1D8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(notificationPortQueue, v7);

}

void __51__ACCTransportIOAccessoryPort__handleIncomingData___block_invoke(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  id *v6;
  void *v7;
  NSObject *v8;
  id v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  id v50;
  _DWORD v51[2];
  __int16 v52;
  int v53;
  __int16 v54;
  int v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v2 = gNumLogObjects < 5;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v4 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v4 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __51__ACCTransportIOAccessoryPort__handleIncomingData___block_invoke_cold_9(a1, v4, v5);

  v6 = (id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 40), "ioAccPortEndpointUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (gLogObjects && gNumLogObjects >= 5)
    {
      v8 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v8 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *((_DWORD *)*v6 + 17);
      v11 = *((_DWORD *)*v6 + 18);
      v12 = *((_DWORD *)*v6 + 20);
      v51[0] = 67109632;
      v51[1] = v10;
      v52 = 1024;
      v53 = v11;
      v54 = 1024;
      v55 = v12;
      _os_log_impl(&dword_21722C000, v8, OS_LOG_TYPE_DEFAULT, "_handleIncomingData: on incoming data, endpoint not created yet, portID %d, portTransportType %d, portStreamType %d", (uint8_t *)v51, 0x14u);
    }

    objc_msgSend(*v6, "delegate");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13
      && (v14 = (void *)v13,
          objc_msgSend(*v6, "delegate"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_opt_respondsToSelector(),
          v15,
          v14,
          (v16 & 1) != 0))
    {
      v17 = *((_DWORD *)*v6 + 20) - 1;
      if (v17 > 4)
        v18 = 0;
      else
        v18 = dword_21728F230[v17];
      objc_msgSend(*v6, "delegate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "IOAccessoryPortArrived:withEndpointProtocol:publish:", *v6, v18, 1);
      v19 = objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v19);
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = *((_QWORD *)*v6 + 12);
        *((_QWORD *)*v6 + 12) = v29;
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 5)
        {
          v30 = *(id *)(gLogObjects + 32);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v30 = MEMORY[0x24BDACB70];
          v31 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v51[0]) = 0;
          _os_log_impl(&dword_21722C000, v30, OS_LOG_TYPE_DEFAULT, "Failed to create endpointUUID!", (uint8_t *)v51, 2u);
        }
      }

    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 5)
      {
        v19 = *(id *)(gLogObjects + 32);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v19 = MEMORY[0x24BDACB70];
        v20 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        __51__ACCTransportIOAccessoryPort__handleIncomingData___block_invoke_cold_5(v19, v21, v22, v23, v24, v25, v26, v27);
    }

  }
  objc_msgSend(*v6, "ioAccPortEndpointUUID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(*v6, "delegate");
    v33 = objc_claimAutoreleasedReturnValue();
    if (v33
      && (v34 = (void *)v33,
          objc_msgSend(*v6, "delegate"),
          v35 = (void *)objc_claimAutoreleasedReturnValue(),
          v36 = objc_opt_respondsToSelector(),
          v35,
          v34,
          (v36 & 1) != 0))
    {
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "ioAccPortEndpointUUID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v38) = objc_msgSend(v37, "IOAccessoryPortDataArrived:endpointUUID:", v38, v39);

      if ((v38 & 1) != 0)
        return;
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 5)
      {
        v40 = *(id *)(gLogObjects + 32);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v40 = MEMORY[0x24BDACB70];
        v41 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        __51__ACCTransportIOAccessoryPort__handleIncomingData___block_invoke_cold_3(v40, v42, v43, v44, v45, v46, v47, v48);

    }
  }
  if (gLogObjects && gNumLogObjects >= 5)
  {
    v49 = *(id *)(gLogObjects + 32);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v49 = MEMORY[0x24BDACB70];
    v50 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
    __51__ACCTransportIOAccessoryPort__handleIncomingData___block_invoke_cold_1(v6, v49);

}

- (BOOL)transmitData:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 5;
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
    v7 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ACCTransportIOAccessoryPort transmitData:].cold.3((uint64_t)v4, self, v7);

  v8 = objc_retainAutorelease(v4);
  objc_msgSend(v8, "bytes");
  objc_msgSend(v8, "length");
  v9 = IOAccessoryPortTransmitData();
  if ((_DWORD)v9)
  {
    if (gLogObjects && gNumLogObjects >= 5)
    {
      v10 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryPort transmitData:].cold.1(v9, v10, v12, v13, v14, v15, v16, v17);

  }
  return (_DWORD)v9 == 0;
}

- (void)_handleAccessoryPortDetach
{
  void *v3;
  BOOL v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[ACCTransportIOAccessoryPort ioAccPortEndpointUUID](self, "ioAccPortEndpointUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (gLogObjects)
    v4 = gNumLogObjects <= 4;
  else
    v4 = 1;
  v5 = !v4;
  if (v3)
  {
    if (v5)
    {
      v6 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v6 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[ACCTransportIOAccessoryPort ioAccPortEndpointUUID](self, "ioAccPortEndpointUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v9;
      _os_log_impl(&dword_21722C000, v6, OS_LOG_TYPE_DEFAULT, "detaching endpointUUID %@", (uint8_t *)&v16, 0xCu);

    }
    -[ACCTransportIOAccessoryPort delegate](self, "delegate");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      -[ACCTransportIOAccessoryPort delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) != 0)
      {
        -[ACCTransportIOAccessoryPort delegate](self, "delegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "IOAccessoryPortDetach:", self);

      }
    }
    -[ACCTransportIOAccessoryPort setIoAccPortEndpointUUID:](self, "setIoAccPortEndpointUUID:", 0);
    -[ACCTransportIOAccessoryPort setIoAccPortParentConnectionUUID:](self, "setIoAccPortParentConnectionUUID:", 0);
  }
  else
  {
    if (v5)
    {
      v7 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v15 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_21722C000, v7, OS_LOG_TYPE_DEFAULT, "no endpointUUID to detach", (uint8_t *)&v16, 2u);
    }

  }
}

- (void)_handleResistorIDChange:(int)a3
{
  BOOL v4;
  id v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  self->_resistorID = a3;
  if (gLogObjects)
    v4 = gNumLogObjects < 5;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = -[ACCTransportIOAccessoryPort resistorID](self, "resistorID");
    _os_log_impl(&dword_21722C000, v6, OS_LOG_TYPE_DEFAULT, "IO Accessory Port Connected resistorID %d, not doing anything with it", (uint8_t *)v7, 8u);
  }

}

- (void)_handlePropertyChange
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21722C000, log, OS_LOG_TYPE_ERROR, "delegate does not handle IOAccessoryPortPropertyChanged!", v1, 2u);
  OUTLINED_FUNCTION_9();
}

- (NSString)ioAccPortParentConnectionUUID
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_ioAccPortParentConnectionUUID);
  v3 = (void *)objc_msgSend(WeakRetained, "copy");

  return (NSString *)v3;
}

- (ACCTransportIOAccessoryPortProtocol)delegate
{
  return (ACCTransportIOAccessoryPortProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isAuthenticated
{
  return self->_isAuthenticated;
}

- (void)setIsAuthenticated:(BOOL)a3
{
  self->_isAuthenticated = a3;
}

- (int)portIDNumber
{
  return self->_portIDNumber;
}

- (int)portTransportType
{
  return self->_portTransportType;
}

- (int)resistorID
{
  return self->_resistorID;
}

- (int)portStreamType
{
  return self->_portStreamType;
}

- (NSString)ioAccPortEndpointUUID
{
  return self->_ioAccPortEndpointUUID;
}

- (void)setIoAccPortEndpointUUID:(id)a3
{
  objc_storeStrong((id *)&self->_ioAccPortEndpointUUID, a3);
}

- (void)setIoAccPortParentConnectionUUID:(id)a3
{
  objc_storeWeak((id *)&self->_ioAccPortParentConnectionUUID, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ioAccPortParentConnectionUUID);
  objc_storeStrong((id *)&self->_ioAccPortEndpointUUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithDelegate:(uint64_t)a3 andIOService:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_21722C000, a2, a3, "IOServiceOpen failed %#x", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

void __51__ACCTransportIOAccessoryPort__handleIncomingData___block_invoke_cold_1(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "ioAccPortEndpointUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_6_0(&dword_21722C000, a2, v4, "dataReceivedSuccessfully failed for endpointUUID %@", (uint8_t *)&v5);

}

void __51__ACCTransportIOAccessoryPort__handleIncomingData___block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_1(&dword_21722C000, a1, a3, "delegate does not handle portDataArrived!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

void __51__ACCTransportIOAccessoryPort__handleIncomingData___block_invoke_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_1(&dword_21722C000, a1, a3, "delegate does not handle portArrived!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

void __51__ACCTransportIOAccessoryPort__handleIncomingData___block_invoke_cold_9(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_6_0(&dword_21722C000, a2, a3, "Received data %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

- (void)transmitData:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_21722C000, a2, a3, "status when transmitting data = 0x%X", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

- (void)transmitData:(NSObject *)a3 .cold.3(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "ioAccPortEndpointUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_debug_impl(&dword_21722C000, a3, OS_LOG_TYPE_DEBUG, "IOAccessoryPort (lowest level of data); transmitting data %@ for endpointUUID %@",
    (uint8_t *)&v6,
    0x16u);

}

@end
