@implementation ACCTransportIOAccessoryConfigStream

- (ACCTransportIOAccessoryConfigStream)initWithDelegate:(id)a3 andIOService:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  ACCTransportIOAccessoryConfigStream *v7;
  ACCTransportIOAccessoryConfigStream *v8;
  NSString *endpointUUID;
  dispatch_source_t v10;
  OS_dispatch_source *requestTimer;
  NSObject *v12;
  ACCTransportIOAccessoryConfigStream *v13;
  _QWORD handler[4];
  ACCTransportIOAccessoryConfigStream *v16;
  objc_super v17;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ACCTransportIOAccessoryConfigStream;
  v7 = -[ACCTransportIOAccessoryBase initWithIOAccessoryClass:ioService:](&v17, sel_initWithIOAccessoryClass_ioService_, 6, v4);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_parentConnectionUUID, 0);
    endpointUUID = v8->_endpointUUID;
    v8->_endpointUUID = 0;

    objc_storeWeak((id *)&v8->_delegate, v6);
    v8->super._ioConnect = 0;
    v8->_categoriesAvailable = 0;
    v10 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
    requestTimer = v8->_requestTimer;
    v8->_requestTimer = (OS_dispatch_source *)v10;

    v12 = v8->_requestTimer;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __69__ACCTransportIOAccessoryConfigStream_initWithDelegate_andIOService___block_invoke;
    handler[3] = &unk_24D719E68;
    v13 = v8;
    v16 = v13;
    dispatch_source_set_event_handler(v12, handler);
    dispatch_source_set_timer((dispatch_source_t)v8->_requestTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)v8->_requestTimer);
    -[ACCTransportIOAccessoryConfigStream _registerForInterestNotifications](v13, "_registerForInterestNotifications");
    -[ACCTransportIOAccessoryConfigStream _checkAccInfo](v13, "_checkAccInfo");

  }
  return v8;
}

void __69__ACCTransportIOAccessoryConfigStream_initWithDelegate_andIOService___block_invoke(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id WeakRetained;
  uint64_t v8;
  id v9;
  id v10;
  int v11;
  int v12;
  _DWORD v13[4];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v2 = gNumLogObjects < 10;
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
    v4 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(unsigned __int16 *)(v5 + 60);
    LODWORD(v5) = *(unsigned __int8 *)(v5 + 58);
    v11 = 67109376;
    v12 = v6;
    LOWORD(v13[0]) = 1024;
    *(_DWORD *)((char *)v13 + 2) = v5;
    _os_log_impl(&dword_21722C000, v4, OS_LOG_TYPE_DEFAULT, "ConfigStream request timed out! categoryID 0x%x, propertyID %u", (uint8_t *)&v11, 0xEu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  if (WeakRetained)
  {
    LOWORD(v11) = 6;
    v8 = *(_QWORD *)(a1 + 32);
    HIWORD(v11) = *(_WORD *)(v8 + 60);
    v12 = *(unsigned __int8 *)(v8 + 58);
    v13[0] = -536870186;
    v9 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(v9, "appendBytes:length:", &v11, 12);
    v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
    objc_msgSend(v10, "IOAccessoryConfigStreamMessageArrived:endpointUUID:", v9, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136));

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 57) = 0;
}

- (void)dealloc
{
  BOOL v3;
  id v4;
  NSObject *v5;
  NSString *endpointUUID;
  NSString *deviceIdentifier;
  NSString *deviceName;
  NSString *deviceManufacturer;
  NSString *deviceModel;
  NSString *deviceHardwareVersion;
  NSString *deviceFirmwareVersion;
  NSString *deviceSerialNumber;
  objc_super v14;
  uint8_t buf[4];
  unsigned int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v3 = gNumLogObjects < 10;
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
    v5 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v16 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
    _os_log_impl(&dword_21722C000, v5, OS_LOG_TYPE_DEFAULT, "deallocing ConfigStream %d", buf, 8u);
  }

  dispatch_source_cancel((dispatch_source_t)self->_requestTimer);
  objc_storeWeak((id *)&self->_delegate, 0);
  objc_storeWeak((id *)&self->_parentConnectionUUID, 0);
  endpointUUID = self->_endpointUUID;
  self->_endpointUUID = 0;

  deviceIdentifier = self->_deviceIdentifier;
  self->_deviceIdentifier = 0;

  deviceName = self->_deviceName;
  self->_deviceName = 0;

  deviceManufacturer = self->_deviceManufacturer;
  self->_deviceManufacturer = 0;

  deviceModel = self->_deviceModel;
  self->_deviceModel = 0;

  deviceHardwareVersion = self->_deviceHardwareVersion;
  self->_deviceHardwareVersion = 0;

  deviceFirmwareVersion = self->_deviceFirmwareVersion;
  self->_deviceFirmwareVersion = 0;

  deviceSerialNumber = self->_deviceSerialNumber;
  self->_deviceSerialNumber = 0;

  v14.receiver = self;
  v14.super_class = (Class)ACCTransportIOAccessoryConfigStream;
  -[ACCTransportIOAccessoryBase dealloc](&v14, sel_dealloc);
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
  BOOL v11;
  int v12;
  kern_return_t v13;
  id v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  BOOL v19;
  id v20;
  void *v21;
  id v23;
  unsigned int v24;
  int v25;
  _BYTE v26[20];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v3 = gNumLogObjects < 10;
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
    v5 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
    -[ACCTransportIOAccessoryConfigStream endpointUUID](self, "endpointUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 67109378;
    *(_DWORD *)v26 = v6;
    *(_WORD *)&v26[4] = 2112;
    *(_QWORD *)&v26[6] = v7;
    _os_log_impl(&dword_21722C000, v5, OS_LOG_TYPE_DEFAULT, "ConfigStream openServiceSession, ioService = %d, endpointUUID %@", (uint8_t *)&v25, 0x12u);

  }
  if (self->super._ioConnect)
  {
    if (gLogObjects && gNumLogObjects >= 10)
    {
      v8 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v8 = MEMORY[0x24BDACB70];
      v14 = MEMORY[0x24BDACB70];
    }
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_30;
    -[ACCTransportIOAccessoryConfigStream endpointUUID](self, "endpointUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412290;
    *(_QWORD *)v26 = v15;
    v16 = "ConfigStream is already open (endpointUUID %@)";
    v17 = v8;
    v18 = 12;
LABEL_29:
    _os_log_impl(&dword_21722C000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v25, v18);

LABEL_30:
    v19 = 1;
    goto LABEL_39;
  }
  v9 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
  v10 = IOServiceOpen(v9, *MEMORY[0x24BDAEC58], 0, &self->super._ioConnect);
  if (gLogObjects)
    v11 = gNumLogObjects <= 9;
  else
    v11 = 1;
  v12 = !v11;
  if (!v10)
  {
    if (v12)
    {
      v8 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v8 = MEMORY[0x24BDACB70];
      v23 = MEMORY[0x24BDACB70];
    }
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_30;
    v24 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
    -[ACCTransportIOAccessoryConfigStream endpointUUID](self, "endpointUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 67109634;
    *(_DWORD *)v26 = v24;
    *(_WORD *)&v26[4] = 1024;
    *(_DWORD *)&v26[6] = 0;
    *(_WORD *)&v26[10] = 2112;
    *(_QWORD *)&v26[12] = v15;
    v16 = "ConfigStream for self.ioService %d is open, result = 0x%X (endpointUUID %@)";
    v17 = v8;
    v18 = 24;
    goto LABEL_29;
  }
  v13 = v10;
  if (v12)
  {
    v8 = *(id *)(gLogObjects + 72);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v8 = MEMORY[0x24BDACB70];
    v20 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[ACCTransportIOAccessoryConfigStream endpointUUID](self, "endpointUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 67109378;
    *(_DWORD *)v26 = v13;
    *(_WORD *)&v26[4] = 2112;
    *(_QWORD *)&v26[6] = v21;
    _os_log_impl(&dword_21722C000, v8, OS_LOG_TYPE_DEFAULT, "ERROR: ConfigStream open failed! result %xh (endpointUUID %@)", (uint8_t *)&v25, 0x12u);

  }
  v19 = 0;
LABEL_39:

  return v19;
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
      v4 = gNumLogObjects < 10;
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
      v8 = *(id *)(gLogObjects + 72);
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[ACCTransportIOAccessoryConfigStream endpointUUID](self, "endpointUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v9;
      v10 = "ConfigStream is closed (endpointUUID %@)";
LABEL_22:
      _os_log_impl(&dword_21722C000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v11, 0xCu);

    }
  }
  else
  {
    if (gLogObjects)
      v6 = gNumLogObjects < 10;
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
      v8 = *(id *)(gLogObjects + 72);
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[ACCTransportIOAccessoryConfigStream endpointUUID](self, "endpointUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v9;
      v10 = "ConfigStream is already closed (endpointUUID %@)";
      goto LABEL_22;
    }
  }

}

- (id)_getCategories
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;
  int Categories;
  NSObject *v7;
  id v8;
  NSObject *v9;
  unint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  int CategoryProperties;
  int v19;
  uint64_t v20;
  int v21;
  NSObject *v22;
  int v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  unint64_t k;
  void *v29;
  NSString *v30;
  int v31;
  void *v32;
  id v33;
  NSString *deviceIdentifier;
  NSObject *v35;
  id v36;
  NSString *v37;
  int v38;
  id v39;
  id v41;
  __int128 v42;
  id obj;
  void *v44;
  uint64_t v45;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  unsigned int v51;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  _BYTE v55[14];
  __int16 v56;
  _BYTE v57[74];
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  int v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v51 = 8;
  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (gLogObjects)
    v3 = gNumLogObjects < 10;
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
    v5 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ACCTransportIOAccessoryConfigStream _getCategories].cold.8(self, v5);

  -[ACCTransportIOAccessoryBase ioService](self, "ioService");
  Categories = IOAccessoryConfigStreamInterfaceGetCategories();
  if (gLogObjects && gNumLogObjects >= 10)
  {
    v7 = *(id *)(gLogObjects + 72);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136317698;
    v53 = "-[ACCTransportIOAccessoryConfigStream _getCategories]";
    v54 = 1024;
    *(_DWORD *)v55 = v51;
    *(_WORD *)&v55[4] = 2048;
    *(_QWORD *)&v55[6] = v87;
    v56 = 2048;
    *(_QWORD *)v57 = *((_QWORD *)&v87 + 1);
    *(_WORD *)&v57[8] = 2048;
    *(_QWORD *)&v57[10] = v88;
    *(_WORD *)&v57[18] = 2048;
    *(_QWORD *)&v57[20] = *((_QWORD *)&v88 + 1);
    *(_WORD *)&v57[28] = 2048;
    *(_QWORD *)&v57[30] = v89;
    *(_WORD *)&v57[38] = 2048;
    *(_QWORD *)&v57[40] = *((_QWORD *)&v89 + 1);
    *(_WORD *)&v57[48] = 2048;
    *(_QWORD *)&v57[50] = v90;
    *(_WORD *)&v57[58] = 2048;
    *(_QWORD *)&v57[60] = *((_QWORD *)&v90 + 1);
    *(_WORD *)&v57[68] = 1024;
    *(_DWORD *)&v57[70] = Categories;
    _os_log_debug_impl(&dword_21722C000, v7, OS_LOG_TYPE_DEBUG, "%s: after GetCategories: categoryIDsCount %u. [%llx %llx %llx %llx %llx %llx %llx %llx], ret %x \n", buf, 0x68u);
  }

  if (Categories)
  {
    if (gLogObjects && gNumLogObjects >= 10)
    {
      v9 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v9 = MEMORY[0x24BDACB70];
      v33 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      deviceIdentifier = self->_deviceIdentifier;
      *(_DWORD *)buf = 138412546;
      v53 = (const char *)deviceIdentifier;
      v54 = 1024;
      *(_DWORD *)v55 = Categories;
      _os_log_impl(&dword_21722C000, v9, OS_LOG_TYPE_DEFAULT, "Error retrieving categories for deviceIdentifier %@, ret %x \n", buf, 0x12u);
    }
LABEL_67:
    v32 = 0;
  }
  else
  {
    for (i = 0; i < v51; ++i)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (unsigned __int16)*((_QWORD *)&v87 + i));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      objc_msgSend(v2, "setObject:forKey:", v12, v11);

    }
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    objc_msgSend(v2, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v86, 16);
    if (v13)
    {
      v15 = v13;
      v45 = *(_QWORD *)v48;
      *(_QWORD *)&v14 = 134218240;
      v42 = v14;
      v44 = v2;
      while (2)
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v48 != v45)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
          v84 = 0u;
          v85 = 0u;
          v82 = 0u;
          v83 = 0u;
          v80 = 0u;
          v81 = 0u;
          v78 = 0u;
          v79 = 0u;
          -[ACCTransportIOAccessoryBase ioService](self, "ioService", v42);
          objc_msgSend(v17, "unsignedIntValue");
          CategoryProperties = IOAccessoryConfigStreamInterfaceGetCategoryProperties();
          v19 = CategoryProperties;
          v20 = gLogObjects;
          v21 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 10)
          {
            v22 = *(id *)(gLogObjects + 72);
          }
          else
          {
            v23 = CategoryProperties;
            v24 = v15;
            v25 = MEMORY[0x24BDACB70];
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v42;
              v53 = (const char *)v20;
              v54 = 1024;
              *(_DWORD *)v55 = v21;
              _os_log_error_impl(&dword_21722C000, v25, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v26 = v25;
            v22 = v25;
            v15 = v24;
            v19 = v23;
          }
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            v30 = self->_deviceIdentifier;
            v31 = objc_msgSend(v17, "unsignedIntValue");
            *(_DWORD *)buf = 136320258;
            v53 = "-[ACCTransportIOAccessoryConfigStream _getCategories]";
            v54 = 2112;
            *(_QWORD *)v55 = v30;
            *(_WORD *)&v55[8] = 1024;
            *(_DWORD *)&v55[10] = v31;
            v56 = 1024;
            *(_DWORD *)v57 = 16;
            *(_WORD *)&v57[4] = 2048;
            *(_QWORD *)&v57[6] = v78;
            *(_WORD *)&v57[14] = 2048;
            *(_QWORD *)&v57[16] = *((_QWORD *)&v78 + 1);
            *(_WORD *)&v57[24] = 2048;
            *(_QWORD *)&v57[26] = v79;
            *(_WORD *)&v57[34] = 2048;
            *(_QWORD *)&v57[36] = *((_QWORD *)&v79 + 1);
            *(_WORD *)&v57[44] = 2048;
            *(_QWORD *)&v57[46] = v80;
            *(_WORD *)&v57[54] = 2048;
            *(_QWORD *)&v57[56] = *((_QWORD *)&v80 + 1);
            *(_WORD *)&v57[64] = 2048;
            *(_QWORD *)&v57[66] = v81;
            v58 = 2048;
            v59 = *((_QWORD *)&v81 + 1);
            v60 = 2048;
            v61 = v82;
            v62 = 2048;
            v63 = *((_QWORD *)&v82 + 1);
            v64 = 2048;
            v65 = v83;
            v66 = 2048;
            v67 = *((_QWORD *)&v83 + 1);
            v68 = 2048;
            v69 = v84;
            v70 = 2048;
            v71 = *((_QWORD *)&v84 + 1);
            v72 = 2048;
            v73 = v85;
            v74 = 2048;
            v75 = *((_QWORD *)&v85 + 1);
            v76 = 1024;
            v77 = v19;
            _os_log_debug_impl(&dword_21722C000, v22, OS_LOG_TYPE_DEBUG, "%s: after GetCategoryProperties: deviceIdentifier %@, categoryID %04x, propertyIDsCount %u. [%llx %llx %llx %llx %llx %llx %llx %llx %llx %llx %llx %llx %llx %llx %llx %llx], ret %x \n", buf, 0xC8u);
          }

          if (v19)
          {
            if (gLogObjects && gNumLogObjects >= 10)
            {
              v35 = *(id *)(gLogObjects + 72);
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
              v35 = MEMORY[0x24BDACB70];
              v36 = MEMORY[0x24BDACB70];
            }
            v2 = v44;
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              v37 = self->_deviceIdentifier;
              v38 = objc_msgSend(v17, "unsignedIntValue");
              *(_DWORD *)buf = 138412802;
              v53 = (const char *)v37;
              v54 = 1024;
              *(_DWORD *)v55 = v38;
              *(_WORD *)&v55[4] = 1024;
              *(_DWORD *)&v55[6] = v19;
              _os_log_impl(&dword_21722C000, v35, OS_LOG_TYPE_DEFAULT, "Error retrieving properties for deviceIdentifier %@, categoryID %04x, ret %x \n", buf, 0x18u);
            }

            if (gLogObjects && gNumLogObjects > 9)
            {
              v9 = *(id *)(gLogObjects + 72);
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
              v9 = MEMORY[0x24BDACB70];
              v39 = MEMORY[0x24BDACB70];
            }
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
              -[ACCTransportIOAccessoryConfigStream _getCategories].cold.3();
            goto LABEL_67;
          }
          v27 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          for (k = 0; k < 0x10; ++k)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (unsigned __int16)*((_QWORD *)&v78 + k));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "addObject:", v29);

          }
          v2 = v44;
          objc_msgSend(v44, "setObject:forKey:", v27, v17);

        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v86, 16);
        if (v15)
          continue;
        break;
      }
    }

    v32 = (void *)objc_msgSend(v2, "copy");
    if (gLogObjects && gNumLogObjects >= 10)
    {
      v9 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v9 = MEMORY[0x24BDACB70];
      v41 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[ACCTransportIOAccessoryConfigStream _getCategories].cold.1();
  }

  return v32;
}

- (id)_getPropertyData:(unsigned __int8)a3 forCategory:(unsigned __int16)a4
{
  int v4;
  int v5;
  int Property;
  int v8;
  BOOL v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSString *deviceIdentifier;
  NSString *v16;
  uint8_t __b[1024];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  NSString *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v4 = a4;
  v5 = a3;
  v30 = *MEMORY[0x24BDAC8D0];
  memset(__b, 170, sizeof(__b));
  -[ACCTransportIOAccessoryBase ioService](self, "ioService");
  Property = IOAccessoryConfigStreamInterfaceGetProperty();
  if (Property)
  {
    v8 = Property;
    if (gLogObjects)
      v9 = gNumLogObjects < 10;
    else
      v9 = 1;
    if (v9)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v10 = MEMORY[0x24BDACB70];
    }
    else
    {
      v12 = *(id *)(gLogObjects + 72);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      deviceIdentifier = self->_deviceIdentifier;
      *(_DWORD *)buf = 136316162;
      v19 = "-[ACCTransportIOAccessoryConfigStream _getPropertyData:forCategory:]";
      v20 = 2112;
      v21 = deviceIdentifier;
      v22 = 1024;
      v23 = v4;
      v24 = 1024;
      v25 = v5;
      v26 = 1024;
      LODWORD(v27) = v8;
      _os_log_debug_impl(&dword_21722C000, v12, OS_LOG_TYPE_DEBUG, "%s: Failed to got property data: device %@, categoryID 0x%04x, propertyID 0x%02x, ret %x \n", buf, 0x28u);
    }
    v11 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", __b);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogObjects && gNumLogObjects >= 10)
    {
      v12 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v16 = self->_deviceIdentifier;
      *(_DWORD *)buf = 136316418;
      v19 = "-[ACCTransportIOAccessoryConfigStream _getPropertyData:forCategory:]";
      v20 = 2112;
      v21 = v16;
      v22 = 1024;
      v23 = v4;
      v24 = 1024;
      v25 = v5;
      v26 = 2048;
      v27 = 1024;
      v28 = 2112;
      v29 = v11;
      _os_log_debug_impl(&dword_21722C000, v12, OS_LOG_TYPE_DEBUG, "%s: Got property data: device %@, categoryID 0x%04x, propertyID 0x%02x, dataLen %zu, result %@ \n", buf, 0x36u);
    }
  }

  return v11;
}

- (id)_getStringProperty:(unsigned __int8)a3 forCategory:(unsigned __int16)a4
{
  int v4;
  int v5;
  int Property;
  BOOL v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  void *v16;
  NSString *v17;
  NSString *v18;
  NSString *deviceIdentifier;
  _BYTE __b[1025];
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  NSString *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  _BYTE v30[24];
  uint64_t v31;

  v4 = a4;
  v5 = a3;
  v31 = *MEMORY[0x24BDAC8D0];
  memset(__b, 170, sizeof(__b));
  -[ACCTransportIOAccessoryBase ioService](self, "ioService");
  Property = IOAccessoryConfigStreamInterfaceGetProperty();
  if (gLogObjects)
    v8 = gNumLogObjects < 10;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    deviceIdentifier = self->_deviceIdentifier;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", __b, 1024);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316674;
    v22 = "-[ACCTransportIOAccessoryConfigStream _getStringProperty:forCategory:]";
    v23 = 2112;
    v24 = deviceIdentifier;
    v25 = 1024;
    v26 = v4;
    v27 = 1024;
    v28 = v5;
    v29 = 1024;
    *(_DWORD *)v30 = Property;
    *(_WORD *)&v30[4] = 2048;
    *(_QWORD *)&v30[6] = 1024;
    *(_WORD *)&v30[14] = 2112;
    *(_QWORD *)&v30[16] = v16;
    _os_log_debug_impl(&dword_21722C000, v10, OS_LOG_TYPE_DEBUG, "%s: device %@, categoryID 0x%04x, propertyID 0x%02x, ret %x, dataLen %zu, data = %@ \n", buf, 0x3Cu);

  }
  if (Property)
  {
    if (gLogObjects && gNumLogObjects >= 10)
    {
      v11 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v11 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v17 = self->_deviceIdentifier;
      *(_DWORD *)buf = 136316162;
      v22 = "-[ACCTransportIOAccessoryConfigStream _getStringProperty:forCategory:]";
      v23 = 2112;
      v24 = v17;
      v25 = 1024;
      v26 = v4;
      v27 = 1024;
      v28 = v5;
      v29 = 1024;
      *(_DWORD *)v30 = Property;
      _os_log_debug_impl(&dword_21722C000, v11, OS_LOG_TYPE_DEBUG, "%s: Failed to get string property: device %@, categoryID 0x%04x, propertyID 0x%02x, ret %x \n", buf, 0x28u);
    }
    v12 = 0;
  }
  else
  {
    __b[1024] = 0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", __b);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogObjects && gNumLogObjects >= 10)
    {
      v11 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v11 = MEMORY[0x24BDACB70];
      v14 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v18 = self->_deviceIdentifier;
      *(_DWORD *)buf = 136316418;
      v22 = "-[ACCTransportIOAccessoryConfigStream _getStringProperty:forCategory:]";
      v23 = 2112;
      v24 = v18;
      v25 = 1024;
      v26 = v4;
      v27 = 1024;
      v28 = v5;
      v29 = 2048;
      *(_QWORD *)v30 = 1024;
      *(_WORD *)&v30[8] = 2112;
      *(_QWORD *)&v30[10] = v12;
      _os_log_debug_impl(&dword_21722C000, v11, OS_LOG_TYPE_DEBUG, "%s: Got string property: device %@, categoryID 0x%04x, propertyID 0x%02x, dataLen %zu, result %@ \n", buf, 0x36u);
    }
  }

  return v12;
}

- (void)_checkAccInfo
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_21722C000, v0, OS_LOG_TYPE_DEBUG, "%s: _deviceIdentifier %@ \n", (uint8_t *)v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)_registerForInterestNotifications
{
  OUTLINED_FUNCTION_6(&dword_21722C000, a2, a3, "error 0X%X  IOServiceAddInterestNotification", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
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

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[ACCTransportIOAccessoryConfigStream endpointUUID](self, "endpointUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("ConfigStream %@\n"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v6);

  v7 = (void *)MEMORY[0x24BDD17C8];
  -[ACCTransportIOAccessoryConfigStream deviceIdentifier](self, "deviceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("    deviceIdentifier %@\n"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v9);

  v10 = (void *)MEMORY[0x24BDD17C8];
  -[ACCTransportIOAccessoryConfigStream deviceName](self, "deviceName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("    deviceName %@\n"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v12);

  v13 = (void *)MEMORY[0x24BDD17C8];
  -[ACCTransportIOAccessoryConfigStream deviceManufacturer](self, "deviceManufacturer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("    deviceManufacturer %@\n"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v15);

  v16 = (void *)MEMORY[0x24BDD17C8];
  -[ACCTransportIOAccessoryConfigStream deviceModel](self, "deviceModel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("    deviceModel %@\n"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v18);

  v19 = (void *)MEMORY[0x24BDD17C8];
  -[ACCTransportIOAccessoryConfigStream deviceHardwareVersion](self, "deviceHardwareVersion");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("    deviceHardwareVersion %@\n"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v21);

  v22 = (void *)MEMORY[0x24BDD17C8];
  -[ACCTransportIOAccessoryConfigStream deviceFirmwareVersion](self, "deviceFirmwareVersion");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("    deviceFirmwareVersion %@\n"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v24);

  v25 = (void *)MEMORY[0x24BDD17C8];
  -[ACCTransportIOAccessoryConfigStream deviceSerialNumber](self, "deviceSerialNumber");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", CFSTR("    deviceSerialNumber %@\n"), v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v27);

  v28 = (void *)MEMORY[0x24BDD17C8];
  -[ACCTransportIOAccessoryConfigStream devicePPID](self, "devicePPID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringWithFormat:", CFSTR("    devicePPID %@\n"), v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v30);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("    IOService %d\n"), -[ACCTransportIOAccessoryBase ioService](self, "ioService"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v31);

  return v3;
}

- (id)IOAccessoryConfigStreamCopyDataForCategoryID:(unsigned __int16)a3 propertyID:(unsigned __int8)a4
{
  return -[ACCTransportIOAccessoryConfigStream _getPropertyData:forCategory:](self, "_getPropertyData:forCategory:", a4, a3);
}

- (BOOL)IOAccessoryConfigStreamRequestGetPropertyForCategoryID:(unsigned __int16)a3 propertyID:(unsigned __int8)a4
{
  uint64_t Property;
  int v5;
  int v6;
  BOOL v8;
  id v9;
  NSObject *v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *requestTimer;
  dispatch_time_t v22;
  _DWORD v23[2];
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (self->_requestPending)
  {
    Property = 3758097109;
  }
  else
  {
    v5 = a4;
    v6 = a3;
    self->_requestPending = 1;
    self->_requestedCategoryID = a3;
    self->_requestedPropertyID = a4;
    -[ACCTransportIOAccessoryBase ioService](self, "ioService");
    Property = IOAccessoryConfigStreamInterfaceRequestGetProperty();
    if (gLogObjects)
      v8 = gNumLogObjects < 4;
    else
      v8 = 1;
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    else
    {
      v10 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v23[0] = 67109632;
      v23[1] = v6;
      v24 = 1024;
      v25 = v5;
      v26 = 1024;
      v27 = Property;
      _os_log_debug_impl(&dword_21722C000, v10, OS_LOG_TYPE_DEBUG, "IOAccessoryConfigStreamRequestGetPropertyForCategoryID: called IOAccessoryConfigStreamInterfaceRequestGetProperty, categoryID 0x%x, propertyID %u, ret 0X%X", (uint8_t *)v23, 0x14u);
    }

    if (!(_DWORD)Property)
    {
      requestTimer = self->_requestTimer;
      v22 = dispatch_time(0, 15000000000);
      dispatch_source_set_timer(requestTimer, v22, 0xFFFFFFFFFFFFFFFFLL, 0);
      return 1;
    }
  }
  if (gLogObjects)
    v11 = gNumLogObjects < 4;
  else
    v11 = 1;
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v13 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  else
  {
    v13 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[ACCTransportIOAccessoryConfigStream IOAccessoryConfigStreamRequestGetPropertyForCategoryID:propertyID:].cold.1(Property, v13, v14, v15, v16, v17, v18, v19);

  return 0;
}

- (BOOL)IOAccessoryConfigStreamSetPropertyData:(id)a3 categoryID:(unsigned __int16)a4 propertyID:(unsigned __int8)a5
{
  int v5;
  int v6;
  id v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  BOOL v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  BOOL v17;
  id v18;
  uint8_t v20[1024];
  uint8_t buf[4];
  _BYTE v22[10];
  _BYTE v23[10];
  _BYTE v24[6];
  int v25;
  uint64_t v26;

  v5 = a5;
  v6 = a4;
  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  memset(v20, 170, sizeof(v20));
  if ((unint64_t)objc_msgSend(v8, "length") > 0x400)
  {
    if (gLogObjects)
      v12 = gNumLogObjects < 4;
    else
      v12 = 1;
    if (v12)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v15 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    else
    {
      v15 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_msgSend(v8, "length");
      *(_DWORD *)buf = 134218752;
      *(_QWORD *)v22 = v16;
      *(_WORD *)&v22[8] = 2048;
      *(_QWORD *)v23 = 1024;
      *(_WORD *)&v23[8] = 1024;
      *(_DWORD *)v24 = v6;
      *(_WORD *)&v24[4] = 1024;
      v25 = v5;
      _os_log_impl(&dword_21722C000, v15, OS_LOG_TYPE_DEFAULT, "IOAccessoryConfigStreamSetPropertyData: dataLen too large! (%lu > %lu) categoryID 0x%x, propertyID %u", buf, 0x22u);
    }
    goto LABEL_30;
  }
  objc_msgSend(v8, "getBytes:length:", v20, 1024);
  v9 = objc_msgSend(v8, "length");
  -[ACCTransportIOAccessoryBase ioService](self, "ioService");
  v10 = IOAccessoryConfigStreamInterfaceSetProperty();
  if (gLogObjects && gNumLogObjects >= 4)
  {
    v11 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v11 = MEMORY[0x24BDACB70];
    v14 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)v22 = v6;
    *(_WORD *)&v22[4] = 1024;
    *(_DWORD *)&v22[6] = v5;
    *(_WORD *)v23 = 2048;
    *(_QWORD *)&v23[2] = v9;
    *(_WORD *)v24 = 1024;
    *(_DWORD *)&v24[2] = v10;
    _os_log_debug_impl(&dword_21722C000, v11, OS_LOG_TYPE_DEBUG, "IOAccessoryConfigStreamSetPropertyData: called IOAccessoryConfigStreamInterfaceSetProperty, categoryID 0x%x, propertyID %u, dataLen %lu, ret 0X%X", buf, 0x1Eu);
  }

  if (v10)
  {
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v15 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v15 = MEMORY[0x24BDACB70];
      v18 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v22 = v6;
      *(_WORD *)&v22[4] = 1024;
      *(_DWORD *)&v22[6] = v5;
      *(_WORD *)v23 = 2048;
      *(_QWORD *)&v23[2] = v9;
      *(_WORD *)v24 = 1024;
      *(_DWORD *)&v24[2] = v10;
      _os_log_error_impl(&dword_21722C000, v15, OS_LOG_TYPE_ERROR, "IOAccessoryConfigStreamSetPropertyData: Failed call to IOAccessoryConfigStreamInterfaceSetProperty, categoryID 0x%x, propertyID %u, dataLen %lu, error 0X%X", buf, 0x1Eu);
    }
LABEL_30:

    v17 = 0;
    goto LABEL_31;
  }
  v17 = 1;
LABEL_31:

  return v17;
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
  NSObject *v13;
  NSObject *v14;
  id v15;
  _BOOL4 categoriesAvailable;
  NSString *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  id v21;
  NSString *v22;
  id v23;
  uint64_t v24;
  id v25;
  int v26;
  id WeakRetained;
  __int128 v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  int v35;
  void *v36;
  BOOL v37;
  NSObject *v38;
  NSObject *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  _BYTE *v48;
  void *v49;
  uint64_t v50;
  int v51;
  NSObject *v53;
  NSObject *v54;
  int v55;
  int v56;
  __int16 v57;
  uint64_t v58;
  int v59;
  NSObject *v60;
  NSObject *v61;
  int v62;
  int v63;
  int v64;
  NSObject *v65;
  uint64_t v66;
  int v67;
  id v68;
  id v69;
  ACCTransportIOAccessoryConfigStreamProtocol **p_delegate;
  id v71;
  id v72;
  void *v73;
  BOOL v74;
  int v75;
  id v76;
  int v77;
  NSString *v78;
  NSString *endpointUUID;
  unsigned int ioConnect;
  int v81;
  NSObject *v82;
  id v83;
  NSObject *v84;
  id v85;
  void *v86;
  id v87;
  BOOL v88;
  id v89;
  int v91;
  NSString *v92;
  ACCTransportIOAccessoryConfigStream *v93;
  id v94;
  ACCTransportIOAccessoryConfigStreamProtocol **location;
  uint64_t v96;
  int v97;
  id obj;
  unsigned __int16 *v99;
  id v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  ACCTransportIOAccessoryConfigStream *v104;
  int v105;
  void *v106;
  _BYTE *v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _BYTE buf[48];
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int16 v124;
  uint8_t v125[4];
  _BYTE v126[10];
  _BYTE v127[6];
  __int16 v128;
  int v129;
  _BYTE v130[128];
  __int16 v131;
  int v132;
  __int16 v133;
  int v134;
  uint64_t v135;

  v135 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 10;
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
    v7 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ACCTransportIOAccessoryConfigStream transmitData:].cold.10();

  if (v4 && self->_categoriesAvailable)
  {
    v8 = objc_retainAutorelease(v4);
    v9 = (unsigned __int16 *)objc_msgSend(v8, "bytes");
    v10 = objc_msgSend(v8, "length");
    v11 = v10;
    if (v9)
    {
      v12 = v10 - 12;
      if (v10 >= 0xC)
      {
        if (gLogObjects && gNumLogObjects >= 10)
        {
          v13 = *(id *)(gLogObjects + 72);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v13 = MEMORY[0x24BDACB70];
          v23 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          endpointUUID = self->_endpointUUID;
          ioConnect = self->super._ioConnect;
          v81 = *v9;
          *(_DWORD *)buf = 138413058;
          *(_QWORD *)&buf[4] = endpointUUID;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = ioConnect;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v81;
          *(_WORD *)&buf[24] = 2048;
          *(_QWORD *)&buf[26] = v12;
          _os_log_debug_impl(&dword_21722C000, v13, OS_LOG_TYPE_DEBUG, "ConfigStream: endpointUUID %@, ioConnect %d, transmitData: messageID %d, payloadLen %lu", buf, 0x22u);
        }

        switch(*v9)
        {
          case 1u:
            -[ACCTransportIOAccessoryConfigStream IOAccessoryConfigStreamCopyCategories](self, "IOAccessoryConfigStreamCopyCategories");
            v24 = objc_claimAutoreleasedReturnValue();
            v25 = (id)v24;
            if (v24)
              v26 = 0;
            else
              v26 = -536870212;
            v97 = v26;
            if (!v24)
              goto LABEL_140;
            location = &self->_delegate;
            WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

            if (!WeakRetained)
              goto LABEL_140;
            v124 = -21846;
            *(_QWORD *)&v28 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v28 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v122 = v28;
            v123 = v28;
            v120 = v28;
            v121 = v28;
            v118 = v28;
            v119 = v28;
            *(_OWORD *)&buf[32] = v28;
            v117 = v28;
            *(_OWORD *)buf = v28;
            *(_OWORD *)&buf[16] = v28;
            v25 = v25;
            v112 = 0u;
            v113 = 0u;
            v114 = 0u;
            v115 = 0u;
            objc_msgSend(v25, "allKeys");
            obj = (id)objc_claimAutoreleasedReturnValue();
            v102 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v112, &v131, 16);
            if (v102)
            {
              v93 = self;
              v94 = v4;
              LODWORD(self) = 0;
              v29 = *(_QWORD *)v113;
              v30 = MEMORY[0x24BDACB70];
              v99 = v9;
              v100 = v25;
              v96 = *(_QWORD *)v113;
              do
              {
                v31 = 0;
                self = (ACCTransportIOAccessoryConfigStream *)(int)self;
                v107 = &buf[20 * (int)self + 6];
                do
                {
                  if (*(_QWORD *)v113 != v29)
                    objc_enumerationMutation(obj);
                  v106 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * v31);
                  objc_msgSend(v25, "objectForKey:");
                  v32 = objc_claimAutoreleasedReturnValue();
                  v33 = (void *)v32;
                  if (v32)
                  {
                    v103 = v31;
                    v34 = gLogObjects;
                    v35 = gNumLogObjects;
                    v36 = (void *)v32;
                    if (gLogObjects)
                      v37 = gNumLogObjects < 10;
                    else
                      v37 = 1;
                    if (v37)
                    {
                      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)v125 = 134218240;
                        *(_QWORD *)v126 = v34;
                        *(_WORD *)&v126[8] = 1024;
                        *(_DWORD *)v127 = v35;
                        _os_log_error_impl(&dword_21722C000, v30, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v125, 0x12u);
                      }
                      v38 = v30;
                      v39 = v30;
                    }
                    else
                    {
                      v39 = *(id *)(gLogObjects + 72);
                    }
                    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
                    {
                      v62 = objc_msgSend(v106, "unsignedIntValue");
                      *(_DWORD *)v125 = 67109376;
                      *(_DWORD *)v126 = (_DWORD)self;
                      *(_WORD *)&v126[4] = 1024;
                      *(_DWORD *)&v126[6] = v62;
                      _os_log_debug_impl(&dword_21722C000, v39, OS_LOG_TYPE_DEBUG, "ConfigStream _fillCategoryList [%d] categoryID 0x%x", v125, 0xEu);
                    }

                    if ((uint64_t)self > 7)
                    {
                      v64 = (int)self;
                      if (gLogObjects && gNumLogObjects >= 10)
                      {
                        v82 = *(id *)(gLogObjects + 72);
                        self = v93;
                        v4 = v94;
                      }
                      else
                      {
                        self = v93;
                        v4 = v94;
                        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
                        v82 = MEMORY[0x24BDACB70];
                        v83 = MEMORY[0x24BDACB70];
                      }
                      if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
                        -[ACCTransportIOAccessoryConfigStream transmitData:].cold.5(v64, v82);

                      v25 = v100;
                      goto LABEL_130;
                    }
                    *(_WORD *)&buf[20 * (_QWORD)self + 2] = objc_msgSend(v106, "unsignedIntValue");
                    v108 = 0u;
                    v109 = 0u;
                    v110 = 0u;
                    v111 = 0u;
                    v33 = v36;
                    v40 = v36;
                    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v108, v130, 16);
                    if (!v41)
                    {
                      v57 = 0;
                      v25 = v100;
                      goto LABEL_96;
                    }
                    v42 = v41;
                    v101 = v36;
                    v104 = self;
                    v43 = 0;
                    v44 = *(_QWORD *)v109;
LABEL_65:
                    v45 = 0;
                    if (v43 <= 16)
                      v46 = 16;
                    else
                      v46 = v43;
                    v47 = (v46 - v43);
                    v105 = v43;
                    v48 = &v107[v43];
                    while (1)
                    {
                      if (*(_QWORD *)v109 != v44)
                        objc_enumerationMutation(v40);
                      v49 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * v45);
                      v50 = gLogObjects;
                      v51 = gNumLogObjects;
                      if (!gLogObjects || gNumLogObjects < 10)
                      {
                        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)v125 = 134218240;
                          *(_QWORD *)v126 = v50;
                          *(_WORD *)&v126[8] = 1024;
                          *(_DWORD *)v127 = v51;
                          _os_log_error_impl(&dword_21722C000, v30, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v125, 0x12u);
                        }
                        v53 = v30;
                        v54 = v30;
                      }
                      else
                      {
                        v54 = *(id *)(gLogObjects + 72);
                      }
                      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
                      {
                        v55 = objc_msgSend(v106, "unsignedIntValue");
                        v56 = objc_msgSend(v49, "unsignedIntValue");
                        *(_DWORD *)v125 = 67109888;
                        *(_DWORD *)v126 = (_DWORD)v104;
                        *(_WORD *)&v126[4] = 1024;
                        *(_DWORD *)&v126[6] = v105 + v45;
                        *(_WORD *)v127 = 1024;
                        *(_DWORD *)&v127[2] = v55;
                        v128 = 1024;
                        v129 = v56;
                        _os_log_debug_impl(&dword_21722C000, v54, OS_LOG_TYPE_DEBUG, "ConfigStream _fillCategoryList [%d, %d] categoryID 0x%x, propertyID %d", v125, 0x1Au);
                      }

                      if (v47 == v45)
                        break;
                      v48[v45++] = objc_msgSend(v49, "unsignedIntValue");
                      if (v42 == v45)
                      {
                        v43 = v105 + v45;
                        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v108, v130, 16);
                        if (!v42)
                        {
                          v57 = v105 + v45;
                          v25 = v100;
                          self = v104;
                          v29 = v96;
                          goto LABEL_95;
                        }
                        goto LABEL_65;
                      }
                    }
                    v58 = gLogObjects;
                    v59 = gNumLogObjects;
                    if (gLogObjects && gNumLogObjects >= 10)
                    {
                      v60 = *(id *)(gLogObjects + 72);
                      v25 = v100;
                      self = v104;
                    }
                    else
                    {
                      v25 = v100;
                      self = v104;
                      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)v125 = 134218240;
                        *(_QWORD *)v126 = v58;
                        *(_WORD *)&v126[8] = 1024;
                        *(_DWORD *)v127 = v59;
                        _os_log_error_impl(&dword_21722C000, v30, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v125, 0x12u);
                      }
                      v61 = v30;
                      v60 = v30;
                    }
                    v57 = v105 + v45;
                    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
                    {
                      v63 = objc_msgSend(v106, "unsignedIntValue");
                      *(_DWORD *)v125 = 67109888;
                      *(_DWORD *)v126 = (_DWORD)self;
                      *(_WORD *)&v126[4] = 1024;
                      *(_DWORD *)&v126[6] = v63;
                      *(_WORD *)v127 = 1024;
                      *(_DWORD *)&v127[2] = v105 + v45;
                      v128 = 1024;
                      v129 = 16;
                      _os_log_error_impl(&dword_21722C000, v60, OS_LOG_TYPE_ERROR, "ConfigStream _fillCategoryList [%d] categoryID 0x%x, propertyIndex too large!  %d >= %d", v125, 0x1Au);
                    }

                    v29 = v96;
LABEL_95:
                    v33 = v101;
LABEL_96:

                    *(_WORD *)&buf[20 * (_QWORD)self + 4] = v57;
                    v9 = v99;
                    v31 = v103;
                  }
                  self = (ACCTransportIOAccessoryConfigStream *)((char *)self + 1);

                  ++v31;
                  v107 += 20;
                }
                while (v31 != v102);
                v102 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v112, &v131, 16);
              }
              while (v102);
              LOWORD(v64) = (_WORD)self;
              self = v93;
              v4 = v94;
            }
            else
            {
              LOWORD(v64) = 0;
            }
LABEL_130:

            *(_WORD *)buf = v64;
            if (gLogObjects && gNumLogObjects >= 10)
            {
              v84 = *(id *)(gLogObjects + 72);
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
              v84 = MEMORY[0x24BDACB70];
              v85 = MEMORY[0x24BDACB70];
            }
            if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
              -[ACCTransportIOAccessoryConfigStream transmitData:].cold.3(v84);

            v131 = 5;
            v132 = *(_DWORD *)(v9 + 1);
            v133 = 162;
            v134 = v97;
            v69 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
            objc_msgSend(v69, "appendBytes:length:", &v131, 12);
            objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", buf, 162);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "appendData:", v86);

            p_delegate = location;
            goto LABEL_139;
          case 2u:
            -[ACCTransportIOAccessoryConfigStream IOAccessoryConfigStreamCopyDataForCategoryID:propertyID:](self, "IOAccessoryConfigStreamCopyDataForCategoryID:propertyID:", v9[1], *((unsigned __int8 *)v9 + 4));
            v66 = objc_claimAutoreleasedReturnValue();
            v25 = (id)v66;
            if (v66)
              v67 = 0;
            else
              v67 = -536870212;
            v97 = v67;
            if (v66)
            {
              v68 = objc_loadWeakRetained((id *)&self->_delegate);

              if (v68)
              {
                *(_WORD *)buf = 6;
                *(_DWORD *)&buf[2] = *(_DWORD *)(v9 + 1);
                *(_WORD *)&buf[6] = objc_msgSend(v25, "length");
                *(_DWORD *)&buf[8] = 0;
                v69 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
                objc_msgSend(v69, "appendBytes:length:", buf, 12);
                objc_msgSend(v69, "appendData:", v25);
                p_delegate = &self->_delegate;
LABEL_139:
                v87 = objc_loadWeakRetained((id *)p_delegate);
                objc_msgSend(v87, "IOAccessoryConfigStreamMessageArrived:endpointUUID:", v69, self->_endpointUUID);

              }
            }
LABEL_140:

            if (v97)
              goto LABEL_141;
            goto LABEL_144;
          case 3u:
            if (-[ACCTransportIOAccessoryConfigStream IOAccessoryConfigStreamRequestGetPropertyForCategoryID:propertyID:](self, "IOAccessoryConfigStreamRequestGetPropertyForCategoryID:propertyID:", v9[1], *((unsigned __int8 *)v9 + 4)))
            {
              goto LABEL_144;
            }
            *(_WORD *)buf = 6;
            *(_DWORD *)&buf[2] = *(_DWORD *)(v9 + 1);
            *(_WORD *)&buf[6] = 0;
            v97 = -536870212;
            *(_DWORD *)&buf[8] = -536870212;
            v71 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
            objc_msgSend(v71, "appendBytes:length:", buf, 12);
            v72 = objc_loadWeakRetained((id *)&self->_delegate);
            objc_msgSend(v72, "IOAccessoryConfigStreamMessageArrived:endpointUUID:", v71, self->_endpointUUID);

            goto LABEL_141;
          case 4u:
            objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v9 + 6, v12);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            v74 = -[ACCTransportIOAccessoryConfigStream IOAccessoryConfigStreamSetPropertyData:categoryID:propertyID:](self, "IOAccessoryConfigStreamSetPropertyData:categoryID:propertyID:", v73, v9[1], *((unsigned __int8 *)v9 + 4));

            if (v74)
            {
LABEL_144:
              v88 = 1;
              goto LABEL_151;
            }
            v75 = -536870212;
LABEL_119:
            v97 = v75;
LABEL_141:
            if (gLogObjects && gNumLogObjects >= 10)
            {
              v14 = *(id *)(gLogObjects + 72);
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
              v14 = MEMORY[0x24BDACB70];
              v89 = MEMORY[0x24BDACB70];
            }
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              v91 = *v9;
              v92 = self->_endpointUUID;
              *(_DWORD *)buf = 67109634;
              *(_DWORD *)&buf[4] = v91;
              *(_WORD *)&buf[8] = 2112;
              *(_QWORD *)&buf[10] = v92;
              *(_WORD *)&buf[18] = 1024;
              *(_DWORD *)&buf[20] = v97;
              _os_log_error_impl(&dword_21722C000, v14, OS_LOG_TYPE_ERROR, "ERROR: configStream messaID %u, endpointUUID %@, error 0x%X", buf, 0x18u);
            }
            goto LABEL_150;
          default:
            if (gLogObjects && gNumLogObjects >= 10)
            {
              v65 = *(id *)(gLogObjects + 72);
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
              v65 = MEMORY[0x24BDACB70];
              v76 = MEMORY[0x24BDACB70];
            }
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
            {
              v77 = *v9;
              v78 = self->_endpointUUID;
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&buf[4] = v77;
              *(_WORD *)&buf[8] = 2112;
              *(_QWORD *)&buf[10] = v78;
              _os_log_impl(&dword_21722C000, v65, OS_LOG_TYPE_DEFAULT, "ERROR: Invalid messageID (%d) for ConfigStream transmit, endpointUUID %@", buf, 0x12u);
            }

            v75 = -536870202;
            goto LABEL_119;
        }
      }
    }
    if (gLogObjects && gNumLogObjects >= 10)
    {
      v14 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v14 = MEMORY[0x24BDACB70];
      v21 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v22 = self->_endpointUUID;
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v22;
      v18 = "ERROR: Not enough bytes (%lu) for message header for ConfigStream transmit, endpointUUID %@";
      v19 = v14;
      v20 = 22;
      goto LABEL_34;
    }
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 10)
    {
      v14 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v14 = MEMORY[0x24BDACB70];
      v15 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      categoriesAvailable = self->_categoriesAvailable;
      v17 = self->_endpointUUID;
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = categoriesAvailable;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v4 != 0;
      *(_WORD *)&buf[14] = 2112;
      *(_QWORD *)&buf[16] = v17;
      v18 = "ERROR: Not ready(%d) or no message data(%d) to handle ConfigStream transmit, endpointUUID %@";
      v19 = v14;
      v20 = 24;
LABEL_34:
      _os_log_impl(&dword_21722C000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
    }
  }
LABEL_150:

  v88 = 0;
LABEL_151:

  return v88;
}

- (void)handlePropertyDataReceived
{
  unsigned __int16 requestedCategoryID;
  __int16 requestedPropertyID;
  NSObject *v5;
  NSObject *v6;
  BOOL v7;
  id v8;
  id v9;
  _BOOL4 requestPending;
  int v11;
  int v12;
  id WeakRetained;
  id v14;
  id v15;
  _BOOL4 v16;
  int v17;
  int v18;
  uint64_t v19;
  _BYTE v20[6];
  __int16 v21;
  int v22;
  __int16 v23;
  NSObject *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (self->_requestPending)
  {
    dispatch_source_set_timer((dispatch_source_t)self->_requestTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    requestedCategoryID = self->_requestedCategoryID;
    requestedPropertyID = self->_requestedPropertyID;
    -[ACCTransportIOAccessoryConfigStream IOAccessoryConfigStreamCopyDataForCategoryID:propertyID:](self, "IOAccessoryConfigStreamCopyDataForCategoryID:propertyID:", requestedCategoryID, self->_requestedPropertyID);
    v5 = objc_claimAutoreleasedReturnValue();
    if (gLogObjects && gNumLogObjects >= 10)
    {
      v6 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v6 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      requestPending = self->_requestPending;
      v11 = self->_requestedCategoryID;
      v12 = self->_requestedPropertyID;
      LODWORD(v19) = 67109890;
      HIDWORD(v19) = requestPending;
      *(_WORD *)v20 = 1024;
      *(_DWORD *)&v20[2] = v11;
      v21 = 1024;
      v22 = v12;
      v23 = 2112;
      v24 = v5;
      _os_log_impl(&dword_21722C000, v6, OS_LOG_TYPE_DEFAULT, "handlePropertyDataReceived: _requestPending %d, _requestedCategoryID 0x%x, _requestedPropertyID %u, propertyData %@", (uint8_t *)&v19, 0x1Eu);
    }

    if (v5)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

      if (WeakRetained)
      {
        LOWORD(v19) = 6;
        WORD1(v19) = requestedCategoryID;
        WORD2(v19) = requestedPropertyID;
        HIWORD(v19) = -[NSObject length](v5, "length", v19);
        *(_DWORD *)v20 = 0;
        v14 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
        objc_msgSend(v14, "appendBytes:length:", &v19, 12);
        objc_msgSend(v14, "appendData:", v5);
        v15 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v15, "IOAccessoryConfigStreamMessageArrived:endpointUUID:", v14, self->_endpointUUID);

      }
    }
    self->_requestPending = 0;
  }
  else
  {
    if (gLogObjects)
      v7 = gNumLogObjects < 10;
    else
      v7 = 1;
    if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v5 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    else
    {
      v5 = *(id *)(gLogObjects + 72);
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v16 = self->_requestPending;
      v17 = self->_requestedCategoryID;
      v18 = self->_requestedPropertyID;
      LODWORD(v19) = 67109632;
      HIDWORD(v19) = v16;
      *(_WORD *)v20 = 1024;
      *(_DWORD *)&v20[2] = v17;
      v21 = 1024;
      v22 = v18;
      _os_log_impl(&dword_21722C000, v5, OS_LOG_TYPE_DEFAULT, "handlePropertyDataReceived: received without pending request, _requestPending %d, _requestedCategoryID 0x%x, _requestedPropertyID %u", (uint8_t *)&v19, 0x14u);
    }
  }

}

- (NSString)deviceIdentifier
{
  NSString *deviceIdentifier;
  io_registry_entry_t v4;
  NSString *CFProperty;
  NSString *v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  NSString *v10;
  int v12;
  NSString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  deviceIdentifier = self->_deviceIdentifier;
  if (!deviceIdentifier || -[NSString isEqualToString:](deviceIdentifier, "isEqualToString:", CFSTR("Unknown")))
  {
    v4 = -[ACCTransportIOAccessoryBase ioService](self, "ioService");
    CFProperty = (NSString *)IORegistryEntryCreateCFProperty(v4, CFSTR("IOAccessoryConfigStreamIdentifier"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    if (CFProperty)
    {
      v6 = self->_deviceIdentifier;
      self->_deviceIdentifier = CFProperty;

    }
    if (!self->_deviceIdentifier)
    {
      self->_deviceIdentifier = (NSString *)CFSTR("Unknown");

    }
  }
  if (gLogObjects)
    v7 = gNumLogObjects < 10;
  else
    v7 = 1;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v9 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  else
  {
    v9 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = self->_deviceIdentifier;
    v12 = 138412290;
    v13 = v10;
    _os_log_impl(&dword_21722C000, v9, OS_LOG_TYPE_INFO, "return _deviceIdentifier: %@", (uint8_t *)&v12, 0xCu);
  }

  return self->_deviceIdentifier;
}

- (NSString)deviceName
{
  NSString *deviceName;
  NSString *v4;
  NSString *v5;

  deviceName = self->_deviceName;
  if (!deviceName || -[NSString isEqualToString:](deviceName, "isEqualToString:", CFSTR("Unknown")))
  {
    -[ACCTransportIOAccessoryConfigStream _getStringProperty:forCategory:](self, "_getStringProperty:forCategory:", 5, 0);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_deviceName;
    self->_deviceName = v4;

    if (!self->_deviceName)
    {
      self->_deviceName = (NSString *)CFSTR("Unknown");

    }
  }
  return self->_deviceName;
}

- (NSString)deviceManufacturer
{
  NSString *deviceManufacturer;
  NSString *v4;
  NSString *v5;

  deviceManufacturer = self->_deviceManufacturer;
  if (!deviceManufacturer || -[NSString isEqualToString:](deviceManufacturer, "isEqualToString:", CFSTR("Unknown")))
  {
    -[ACCTransportIOAccessoryConfigStream _getStringProperty:forCategory:](self, "_getStringProperty:forCategory:", 4, 0);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_deviceManufacturer;
    self->_deviceManufacturer = v4;

    if (!self->_deviceManufacturer)
    {
      self->_deviceManufacturer = (NSString *)CFSTR("Unknown");

    }
  }
  return self->_deviceManufacturer;
}

- (NSString)deviceModel
{
  NSString *deviceModel;
  NSString *v4;
  NSString *v5;

  deviceModel = self->_deviceModel;
  if (!deviceModel || -[NSString isEqualToString:](deviceModel, "isEqualToString:", CFSTR("Unknown")))
  {
    -[ACCTransportIOAccessoryConfigStream _getStringProperty:forCategory:](self, "_getStringProperty:forCategory:", 6, 0);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_deviceModel;
    self->_deviceModel = v4;

    if (!self->_deviceModel)
    {
      self->_deviceModel = (NSString *)CFSTR("Unknown");

    }
  }
  return self->_deviceModel;
}

- (NSString)deviceHardwareVersion
{
  NSString *deviceHardwareVersion;
  NSString *v4;
  NSString *v5;

  deviceHardwareVersion = self->_deviceHardwareVersion;
  if (!deviceHardwareVersion
    || -[NSString isEqualToString:](deviceHardwareVersion, "isEqualToString:", CFSTR("Unknown")))
  {
    -[ACCTransportIOAccessoryConfigStream _getStringProperty:forCategory:](self, "_getStringProperty:forCategory:", 2, 0);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_deviceHardwareVersion;
    self->_deviceHardwareVersion = v4;

    if (!self->_deviceHardwareVersion)
    {
      self->_deviceHardwareVersion = (NSString *)CFSTR("Unknown");

    }
  }
  return self->_deviceHardwareVersion;
}

- (NSString)deviceFirmwareVersion
{
  NSString *deviceFirmwareVersion;
  NSString *v4;
  NSString *v5;

  deviceFirmwareVersion = self->_deviceFirmwareVersion;
  if (!deviceFirmwareVersion
    || -[NSString isEqualToString:](deviceFirmwareVersion, "isEqualToString:", CFSTR("Unknown")))
  {
    -[ACCTransportIOAccessoryConfigStream _getStringProperty:forCategory:](self, "_getStringProperty:forCategory:", 3, 0);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_deviceFirmwareVersion;
    self->_deviceFirmwareVersion = v4;

    if (!self->_deviceFirmwareVersion)
    {
      self->_deviceFirmwareVersion = (NSString *)CFSTR("Unknown");

    }
  }
  return self->_deviceFirmwareVersion;
}

- (NSString)deviceSerialNumber
{
  NSString *deviceSerialNumber;
  NSString *v4;
  NSString *v5;

  deviceSerialNumber = self->_deviceSerialNumber;
  if (!deviceSerialNumber || -[NSString isEqualToString:](deviceSerialNumber, "isEqualToString:", CFSTR("Unknown")))
  {
    -[ACCTransportIOAccessoryConfigStream _getStringProperty:forCategory:](self, "_getStringProperty:forCategory:", 7, 0);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_deviceSerialNumber;
    self->_deviceSerialNumber = v4;

    if (!self->_deviceSerialNumber)
    {
      self->_deviceSerialNumber = (NSString *)CFSTR("Unknown");

    }
  }
  return self->_deviceSerialNumber;
}

- (NSString)devicePPID
{
  NSString *devicePPID;
  NSString *v4;
  NSString *v5;

  devicePPID = self->_devicePPID;
  if (!devicePPID || -[NSString isEqualToString:](devicePPID, "isEqualToString:", CFSTR("Unknown")))
  {
    -[ACCTransportIOAccessoryConfigStream _getStringProperty:forCategory:](self, "_getStringProperty:forCategory:", 1, 4096);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_devicePPID;
    self->_devicePPID = v4;

    if (!self->_devicePPID)
    {
      self->_devicePPID = (NSString *)CFSTR("Unknown");

    }
  }
  return self->_devicePPID;
}

- (ACCTransportIOAccessoryConfigStreamProtocol)delegate
{
  return (ACCTransportIOAccessoryConfigStreamProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_deviceIdentifier, a3);
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
}

- (void)setDeviceManufacturer:(id)a3
{
  objc_storeStrong((id *)&self->_deviceManufacturer, a3);
}

- (void)setDeviceModel:(id)a3
{
  objc_storeStrong((id *)&self->_deviceModel, a3);
}

- (void)setDeviceHardwareVersion:(id)a3
{
  objc_storeStrong((id *)&self->_deviceHardwareVersion, a3);
}

- (void)setDeviceFirmwareVersion:(id)a3
{
  objc_storeStrong((id *)&self->_deviceFirmwareVersion, a3);
}

- (void)setDeviceSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_deviceSerialNumber, a3);
}

- (void)setDevicePPID:(id)a3
{
  objc_storeStrong((id *)&self->_devicePPID, a3);
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

- (BOOL)categoriesAvailable
{
  return self->_categoriesAvailable;
}

- (void)setCategoriesAvailable:(BOOL)a3
{
  self->_categoriesAvailable = a3;
}

- (BOOL)requestPending
{
  return self->_requestPending;
}

- (void)setRequestPending:(BOOL)a3
{
  self->_requestPending = a3;
}

- (unsigned)requestedCategoryID
{
  return self->_requestedCategoryID;
}

- (void)setRequestedCategoryID:(unsigned __int16)a3
{
  self->_requestedCategoryID = a3;
}

- (unsigned)requestedPropertyID
{
  return self->_requestedPropertyID;
}

- (void)setRequestedPropertyID:(unsigned __int8)a3
{
  self->_requestedPropertyID = a3;
}

- (BOOL)accInfoValid
{
  return self->_accInfoValid;
}

- (void)setAccInfoValid:(BOOL)a3
{
  self->_accInfoValid = a3;
}

- (OS_dispatch_source)requestTimer
{
  return self->_requestTimer;
}

- (void)setRequestTimer:(id)a3
{
  objc_storeStrong((id *)&self->_requestTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestTimer, 0);
  objc_destroyWeak((id *)&self->_parentConnectionUUID);
  objc_storeStrong((id *)&self->_endpointUUID, 0);
  objc_storeStrong((id *)&self->_devicePPID, 0);
  objc_storeStrong((id *)&self->_deviceSerialNumber, 0);
  objc_storeStrong((id *)&self->_deviceFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_deviceHardwareVersion, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_deviceManufacturer, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_getCategories
{
  int v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(a1, "ioService");
  v5 = a1[9];
  v6 = 136315650;
  v7 = "-[ACCTransportIOAccessoryConfigStream _getCategories]";
  v8 = 1024;
  v9 = v4;
  v10 = 2112;
  v11 = v5;
  _os_log_debug_impl(&dword_21722C000, a2, OS_LOG_TYPE_DEBUG, "%s: service %d, call GetCategories for deviceIdentifier %@ \n", (uint8_t *)&v6, 0x1Cu);
}

- (void)IOAccessoryConfigStreamRequestGetPropertyForCategoryID:(uint64_t)a3 propertyID:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_21722C000, a2, a3, "IOAccessoryConfigStreamRequestGetPropertyForCategoryID: Failed call to IOAccessoryConfigStreamInterfaceRequestGetProperty, error 0X%X", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

- (void)transmitData:(os_log_t)log .cold.3(os_log_t log)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 67109120;
  v1[1] = 1;
  _os_log_debug_impl(&dword_21722C000, log, OS_LOG_TYPE_DEBUG, "ConfigStream _fillCategoryList success=%d", (uint8_t *)v1, 8u);
  OUTLINED_FUNCTION_9();
}

- (void)transmitData:(int)a1 .cold.5(int a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109376;
  v2[1] = a1;
  v3 = 1024;
  v4 = 8;
  _os_log_error_impl(&dword_21722C000, a2, OS_LOG_TYPE_ERROR, "ConfigStream _fillCategoryList categoryIndex too large!  %d >= %d", (uint8_t *)v2, 0xEu);
  OUTLINED_FUNCTION_2();
}

- (void)transmitData:.cold.10()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_5_0();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x22u);
  OUTLINED_FUNCTION_7_0();
}

@end
