@implementation AccessoryIAPInterface

- (AccessoryIAPInterface)initWithInterface:(unsigned int)a3 andDataInHandler:(id)a4
{
  return -[AccessoryIAPInterface initWithInterface:vid:pid:aidInfo:andDataInHandler:](self, "initWithInterface:vid:pid:aidInfo:andDataInHandler:", *(_QWORD *)&a3, 0, 0, 0, a4);
}

- (AccessoryIAPInterface)initWithInterface:(unsigned int)a3 vid:(unsigned __int16)a4 pid:(unsigned __int16)a5 aidInfo:(id)a6 andDataInHandler:(id)a7
{
  int v9;
  int v10;
  uint64_t v11;
  id v13;
  id v14;
  char *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  id v25;
  int v26;
  uint64_t v27;
  void *v28;
  objc_super v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v9 = a5;
  v10 = a4;
  v11 = *(_QWORD *)&a3;
  v37 = *MEMORY[0x24BDAC8D0];
  v13 = a6;
  v14 = a7;
  v30.receiver = self;
  v30.super_class = (Class)AccessoryIAPInterface;
  v15 = -[AccessoryIAPInterface init](&v30, sel_init);
  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSince1970");
    *((_QWORD *)v15 + 10) = v17;

    *(_WORD *)(v15 + 9) = 0;
    *((_WORD *)v15 + 9) = 0;
    *((_DWORD *)v15 + 5) = 0;
    v15[11] = 0;
    *((_QWORD *)v15 + 13) = 0;
    *((_QWORD *)v15 + 14) = 0;
    v18 = (void *)*((_QWORD *)v15 + 15);
    *((_QWORD *)v15 + 15) = 0;

    *((_QWORD *)v15 + 7) = 0;
    v15[12] = 0;
    v19 = MEMORY[0x219A078D4](v14);
    v20 = (void *)*((_QWORD *)v15 + 9);
    *((_QWORD *)v15 + 9) = v19;

    *((_DWORD *)v15 + 9) = 0;
    *((_DWORD *)v15 + 10) = 0;
    *((_WORD *)v15 + 7) = v10;
    *((_WORD *)v15 + 8) = v9;
    *((_DWORD *)v15 + 8) = v9 | (v10 << 16);
    v15[13] = 0;
    objc_storeStrong((id *)v15 + 12, a6);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x"), *((unsigned __int16 *)v15 + 8) | (*((unsigned __int16 *)v15 + 7) << 16));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    acc_userNotifications_generateIdentifier((uint64_t)CFSTR("iap-interface-registry"), (uint64_t)v21);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)*((_QWORD *)v15 + 11);
    *((_QWORD *)v15 + 11) = v22;

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v24 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v24 = MEMORY[0x24BDACB70];
      v25 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v26 = *((_DWORD *)v15 + 8);
      v27 = *((_QWORD *)v15 + 12);
      *(_DWORD *)buf = 136315650;
      v32 = "-[AccessoryIAPInterface initWithInterface:vid:pid:aidInfo:andDataInHandler:]";
      v33 = 1024;
      v34 = v26;
      v35 = 2112;
      v36 = v27;
      _os_log_impl(&dword_2171C1000, v24, OS_LOG_TYPE_INFO, "%s: vidpid 0x%X, aidInfo %@", buf, 0x1Cu);
    }

    if (objc_msgSend(v15, "configureInterface:skipPipeSetup:", v11, 0))
    {
      v28 = (void *)*((_QWORD *)v15 + 15);
      *((_QWORD *)v15 + 15) = 0;
    }
    else
    {
      v28 = v15;
      v15 = 0;
    }

  }
  return (AccessoryIAPInterface *)v15;
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_2_1(&dword_2171C1000, v0, v1, "USBInterfaceClose returned: %08x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (BOOL)configureInterface:(unsigned int)a3 skipPipeSetup:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  BOOL v7;
  id v8;
  NSObject *v9;
  io_service_t ParentOfClass;
  BOOL v11;
  int v12;
  io_service_t v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  int v36;
  uint64_t v37;
  NSObject *v38;
  NSObject *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *InterfaceAndNameString;
  BOOL v48;
  id v50;
  BOOL v51;
  const __CFUUID *v52;
  const __CFUUID *v53;
  void *v54;
  NSDictionary *ioregProperties;
  const __CFUUID *v56;
  const __CFUUID *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, _QWORD, _QWORD, IOUSBInterfaceStruct942 ***);
  const __CFUUID *v60;
  CFUUIDBytes v61;
  IOUSBInterfaceStruct942 **v62;
  NSObject *v63;
  id v64;
  id v65;
  id v66;
  NSObject *v67;
  NSObject *v68;
  kern_return_t RegistryEntryID;
  NSObject *v70;
  unint64_t parentDeviceRegistryEntryID;
  NSObject *v72;
  NSObject *v73;
  int Pipe;
  NSObject *v75;
  NSObject *v76;
  int v77;
  NSObject *v78;
  NSObject *v79;
  int v80;
  NSObject *v81;
  NSObject *v82;
  NSObject *v83;
  NSLock *v84;
  NSLock *dataBufLock;
  NSMutableArray *v86;
  NSMutableArray *inUseDataBufArray;
  NSMutableArray *v88;
  NSMutableArray *interruptBulkReadList;
  IAPDataBuffer *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  int v95;
  IAPDataBuffer *v96;
  void *v97;
  int v98;
  int v99;
  NSObject *v100;
  NSObject *v101;
  BOOL v102;
  BOOL v103;
  IONotificationPort *v105;
  NSObject *v106;
  NSObject *v107;
  NSObject *v108;
  NSObject *v109;
  int bulkOutPipeRef;
  int bulkOutPipeMaxPacketSize;
  int bulkInPipeRef;
  int bulkInPipeMaxPacketSize;
  int interruptInPipeRef;
  int interruptInPipeMaxPacketSize;
  _QWORD block[5];
  int v117;
  io_registry_entry_t entry;
  unsigned __int8 v119;
  __int16 v120;
  SInt32 theScore;
  IOUSBInterfaceStruct942 **v122;
  uint32_t busyState[2];
  _BYTE v124[12];
  __int16 v125;
  uint8_t *v126;
  uint8_t buf[32];
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  uint64_t v134;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v134 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v7 = gNumLogObjects < 1;
  else
    v7 = 1;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v9 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  else
  {
    v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[AccessoryIAPInterface configureInterface:skipPipeSetup:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v5;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v4;
    _os_log_impl(&dword_2171C1000, v9, OS_LOG_TYPE_DEFAULT, "%s: service %d, skipPipeSetup %d", buf, 0x18u);
  }

  ParentOfClass = usbUtil_findParentOfClass(v5, "IOUSBDevice", "IOService");
  if (gLogObjects)
    v11 = gNumLogObjects <= 0;
  else
    v11 = 1;
  v12 = !v11;
  if (!ParentOfClass)
  {
    if (v12)
    {
      v15 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v15 = MEMORY[0x24BDACB70];
      v18 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[AccessoryIAPInterface configureInterface:skipPipeSetup:].cold.1();

    goto LABEL_70;
  }
  v13 = ParentOfClass;
  if (v12)
  {
    v14 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v14 = MEMORY[0x24BDACB70];
    v16 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[AccessoryIAPInterface configureInterface:skipPipeSetup:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v13;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v5;
    _os_log_impl(&dword_2171C1000, v14, OS_LOG_TYPE_DEFAULT, "%s: Found parent (%d) of iAP Interface (%d)", buf, 0x18u);
  }

  busyState[0] = 0;
  if (!IOServiceGetBusyState(v13, busyState))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v17 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v17 = MEMORY[0x24BDACB70];
      v19 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[AccessoryIAPInterface configureInterface:skipPipeSetup:].cold.29((uint64_t)busyState, v17, v20, v21, v22, v23, v24, v25);

    if (!IOServiceWaitQuiet(v13, 0))
    {
      busyState[0] = 0;
      if (!IOServiceGetBusyState(v13, busyState))
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v26 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
          v26 = MEMORY[0x24BDACB70];
          v27 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          -[AccessoryIAPInterface configureInterface:skipPipeSetup:].cold.29((uint64_t)busyState, v26, v28, v29, v30, v31, v32, v33);

      }
    }
  }
  v132 = 0u;
  v133 = 0u;
  v130 = 0u;
  v131 = 0u;
  v128 = 0u;
  v129 = 0u;
  memset(buf, 0, sizeof(buf));
  v34 = MEMORY[0x219A07508](v5, buf);
  if (gLogObjects)
    v35 = gNumLogObjects <= 0;
  else
    v35 = 1;
  v36 = !v35;
  if (!(_DWORD)v34)
  {
    if (v36)
    {
      v39 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v39 = MEMORY[0x24BDACB70];
      v50 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v124 = 136315394;
      *(_QWORD *)&v124[4] = "-[AccessoryIAPInterface configureInterface:skipPipeSetup:]";
      v125 = 2080;
      v126 = buf;
      _os_log_impl(&dword_2171C1000, v39, OS_LOG_TYPE_DEFAULT, "%s: Registry entry name: '%s'", v124, 0x16u);
    }

    if (buf[0]
      && (*(_QWORD *)buf == 0x65746E4920504169 ? (v51 = *(_QWORD *)&buf[6] == 0x65636166726574) : (v51 = 0), v51))
    {
      InterfaceAndNameString = 0;
    }
    else
    {
      v52 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 1u, 0xA2u, 0xD0u, 0xE9u, 0x42u, 0xF6u, 0x4Au, 0x87u, 0x8Bu, 0x8Bu, 0x77u, 5u, 0x7Cu, 0x8Cu, 0xE0u, 0xCEu);
      v53 = CFUUIDGetConstantUUIDWithBytes(0, 0x2Au, 0x41u, 0x5Au, 0x15u, 0x1Au, 0x7Bu, 0x4Bu, 0x5Bu, 0x86u, 0x9Cu, 0x69u, 0x4Fu, 0xEEu, 0xCu, 0x6Cu, 0x6Bu);
      InterfaceAndNameString = (void *)usbUtil_getInterfaceAndNameString(v13, v52, v5, v53, 0);
    }
    IOObjectRelease(v13);
    if (!(_DWORD)v5)
      goto LABEL_71;
    self->_registryEntryID = +[AccessoryIAPInterface getRegistryEntryIDFromService:](AccessoryIAPInterface, "getRegistryEntryIDFromService:", v5);
    *(_QWORD *)v124 = 0;
    if (IORegistryEntryCreateCFProperties(v5, (CFMutableDictionaryRef *)v124, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0)
      || !*(_QWORD *)v124)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v63 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
        v63 = MEMORY[0x24BDACB70];
        v64 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        -[AccessoryIAPInterface configureInterface:skipPipeSetup:].cold.24();
    }
    else
    {
      objc_msgSend(*(id *)v124, "objectForKey:", CFSTR("locationID"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      self->_locationID = objc_msgSend(v54, "intValue");

      ioregProperties = self->_ioregProperties;
      self->_ioregProperties = *(NSDictionary **)v124;

      v122 = 0;
      *(_QWORD *)busyState = 0;
      theScore = 0;
      v120 = 0;
      v119 = 0;
      v56 = CFUUIDGetConstantUUIDWithBytes(0, 0x2Du, 0x97u, 0x86u, 0xC6u, 0x9Eu, 0xF3u, 0x11u, 0xD4u, 0xADu, 0x51u, 0, 0xAu, 0x27u, 5u, 0x28u, 0x61u);
      v57 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
      if (IOCreatePlugInInterfaceForService(v5, v56, v57, (IOCFPlugInInterface ***)busyState, &theScore)
        || (v58 = *(_QWORD *)busyState) == 0)
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v63 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
          v63 = MEMORY[0x24BDACB70];
          v65 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          -[AccessoryIAPInterface configureInterface:skipPipeSetup:].cold.22();
      }
      else
      {
        v59 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, IOUSBInterfaceStruct942 ***))(**(_QWORD **)busyState
                                                                                             + 8);
        v60 = CFUUIDGetConstantUUIDWithBytes(0, 0x2Au, 0x41u, 0x5Au, 0x15u, 0x1Au, 0x7Bu, 0x4Bu, 0x5Bu, 0x86u, 0x9Cu, 0x69u, 0x4Fu, 0xEEu, 0xCu, 0x6Cu, 0x6Bu);
        v61 = CFUUIDGetUUIDBytes(v60);
        LODWORD(v59) = v59(v58, *(_QWORD *)&v61.byte0, *(_QWORD *)&v61.byte8, &v122);
        (*(void (**)(_QWORD))(**(_QWORD **)busyState + 24))(*(_QWORD *)busyState);
        if (!(_DWORD)v59)
        {
          v62 = v122;
          if (v122)
          {
            self->_interface = v122;
            if (v4)
            {
LABEL_93:
              v48 = 1;
              goto LABEL_72;
            }
            if (!((unsigned int (*)(IOUSBInterfaceStruct942 **, char *))(*v62)->GetInterfaceClass)(v62, (char *)&v120 + 1)&& !((unsigned int (*)(IOUSBInterfaceStruct942 **, __int16 *))(*self->_interface)->GetInterfaceSubClass)(self->_interface, &v120))
            {
              logObjectForModule();
              v67 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
                -[AccessoryIAPInterface configureInterface:skipPipeSetup:].cold.19((unsigned __int8 *)&v120 + 1, (unsigned __int8 *)&v120, v67);

            }
            entry = 0;
            if (((unsigned int (*)(IOUSBInterfaceStruct942 **, io_registry_entry_t *))(*self->_interface)->GetDevice)(self->_interface, &entry))
            {
              logObjectForModule();
              v68 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
                -[AccessoryIAPInterface configureInterface:skipPipeSetup:].cold.18();
            }
            else
            {
              RegistryEntryID = IORegistryEntryGetRegistryEntryID(entry, &self->_parentDeviceRegistryEntryID);
              logObjectForModule();
              v70 = objc_claimAutoreleasedReturnValue();
              v68 = v70;
              if (RegistryEntryID)
              {
                if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
                  -[AccessoryIAPInterface configureInterface:skipPipeSetup:].cold.17();
              }
              else if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
              {
                parentDeviceRegistryEntryID = self->_parentDeviceRegistryEntryID;
                *(_DWORD *)buf = 134217984;
                *(_QWORD *)&buf[4] = parentDeviceRegistryEntryID;
                _os_log_impl(&dword_2171C1000, v68, OS_LOG_TYPE_DEFAULT, "_parentDeviceRegistryEntryID = 0x%llX", buf, 0xCu);
              }
            }

            if (((unsigned int (*)(IOUSBInterfaceStruct942 **))(*self->_interface)->USBInterfaceOpen)(self->_interface))
            {
              logObjectForModule();
              v72 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                -[AccessoryIAPInterface configureInterface:skipPipeSetup:].cold.16();
              goto LABEL_135;
            }
            if (((unsigned int (*)(IOUSBInterfaceStruct942 **, unsigned __int8 *))(*self->_interface)->GetNumEndpoints)(self->_interface, &v119))
            {
              logObjectForModule();
              v73 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
                -[AccessoryIAPInterface configureInterface:skipPipeSetup:].cold.15();

              if (!((unsigned int (*)(IOUSBInterfaceStruct942 **))(*self->_interface)->USBInterfaceClose)(self->_interface))
                goto LABEL_136;
              logObjectForModule();
              v72 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                goto LABEL_135;
            }
            else
            {
              Pipe = findPipe((uint64_t)self->_interface, v119, 0, 2, &self->_bulkOutPipeRef, &self->_bulkOutPipeMaxPacketSize);
              if (!self->_bulkOutPipeRef)
              {
                logObjectForModule();
                v75 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
                  -[AccessoryIAPInterface configureInterface:skipPipeSetup:].cold.13();

              }
              if (Pipe)
              {
                logObjectForModule();
                v76 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
                  -[AccessoryIAPInterface configureInterface:skipPipeSetup:].cold.12();

                if (!((unsigned int (*)(IOUSBInterfaceStruct942 **))(*self->_interface)->USBInterfaceClose)(self->_interface))
                  goto LABEL_136;
                logObjectForModule();
                v72 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                  goto LABEL_135;
              }
              else
              {
                v77 = findPipe((uint64_t)self->_interface, v119, 1, 2, &self->_bulkInPipeRef, &self->_bulkInPipeMaxPacketSize);
                if (!self->_bulkInPipeRef)
                {
                  logObjectForModule();
                  v78 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
                    -[AccessoryIAPInterface configureInterface:skipPipeSetup:].cold.10();

                }
                if (!v77)
                {
                  v80 = findPipe((uint64_t)self->_interface, v119, 1, 3, &self->_interruptInPipeRef, &self->_interruptInPipeMaxPacketSize);
                  if (self->_interruptInPipeRef)
                  {
                    logObjectForModule();
                    v81 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_2171C1000, v81, OS_LOG_TYPE_DEFAULT, "Found interrupt in endpoint!", buf, 2u);
                    }

                  }
                  if (v80)
                  {
                    logObjectForModule();
                    v82 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
                      -[AccessoryIAPInterface configureInterface:skipPipeSetup:].cold.7();

                  }
                  logObjectForModule();
                  v83 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
                  {
                    bulkOutPipeRef = self->_bulkOutPipeRef;
                    bulkOutPipeMaxPacketSize = self->_bulkOutPipeMaxPacketSize;
                    bulkInPipeRef = self->_bulkInPipeRef;
                    bulkInPipeMaxPacketSize = self->_bulkInPipeMaxPacketSize;
                    interruptInPipeRef = self->_interruptInPipeRef;
                    interruptInPipeMaxPacketSize = self->_interruptInPipeMaxPacketSize;
                    *(_DWORD *)buf = 67110400;
                    *(_DWORD *)&buf[4] = bulkOutPipeRef;
                    *(_WORD *)&buf[8] = 1024;
                    *(_DWORD *)&buf[10] = bulkOutPipeMaxPacketSize;
                    *(_WORD *)&buf[14] = 1024;
                    *(_DWORD *)&buf[16] = bulkInPipeRef;
                    *(_WORD *)&buf[20] = 1024;
                    *(_DWORD *)&buf[22] = bulkInPipeMaxPacketSize;
                    *(_WORD *)&buf[26] = 1024;
                    *(_DWORD *)&buf[28] = interruptInPipeRef;
                    LOWORD(v128) = 1024;
                    *(_DWORD *)((char *)&v128 + 2) = interruptInPipeMaxPacketSize;
                    _os_log_debug_impl(&dword_2171C1000, v83, OS_LOG_TYPE_DEBUG, "Bulk out pipe: %d maxPacketSize: %d, Bulk in pipe: %d, maxPacketSize: %d, Interrupt in pipe: %d, maxPacketSize: %d", buf, 0x26u);
                  }

                  v84 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
                  dataBufLock = self->_dataBufLock;
                  self->_dataBufLock = v84;

                  v86 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 8);
                  inUseDataBufArray = self->_inUseDataBufArray;
                  self->_inUseDataBufArray = v86;

                  v88 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 8);
                  interruptBulkReadList = self->_interruptBulkReadList;
                  self->_interruptBulkReadList = v88;

                  if (self->_interruptInPipeRef)
                  {
                    v90 = -[IAPDataBuffer initWithiAPInterface:]([IAPDataBuffer alloc], "initWithiAPInterface:", self);
                    -[AccessoryIAPInterface dataBufLock](self, "dataBufLock");
                    v91 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v91, "lock");

                    -[AccessoryIAPInterface inUseDataBufArray](self, "inUseDataBufArray");
                    v92 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v92, "addObject:", v90);

                    -[AccessoryIAPInterface dataBufLock](self, "dataBufLock");
                    v93 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v93, "unlock");

                  }
                  else
                  {
                    -[AccessoryIAPInterface dataBufLock](self, "dataBufLock");
                    v94 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v94, "lock");

                    v95 = 8;
                    do
                    {
                      v96 = -[IAPDataBuffer initWithiAPInterface:]([IAPDataBuffer alloc], "initWithiAPInterface:", self);
                      -[AccessoryIAPInterface inUseDataBufArray](self, "inUseDataBufArray");
                      v97 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v97, "addObject:", v96);

                      --v95;
                    }
                    while (v95);
                    -[AccessoryIAPInterface dataBufLock](self, "dataBufLock");
                    v90 = (IAPDataBuffer *)objc_claimAutoreleasedReturnValue();
                    -[IAPDataBuffer unlock](v90, "unlock");
                  }

                  v117 = 0;
                  v98 = ((uint64_t (*)(IOUSBInterfaceStruct942 **, int *))(*self->_interface)->CreateInterfaceAsyncPort)(self->_interface, &v117);
                  v99 = v117;
                  logObjectForModule();
                  v100 = objc_claimAutoreleasedReturnValue();
                  v101 = v100;
                  if (v98)
                    v102 = 1;
                  else
                    v102 = v99 == 0;
                  if (v102)
                  {
                    if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
                      -[AccessoryIAPInterface configureInterface:skipPipeSetup:].cold.6();

                    v103 = 0;
                  }
                  else
                  {
                    if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_2171C1000, v101, OS_LOG_TYPE_DEFAULT, "Casting to IOUSBInterfaceInterface400", buf, 2u);
                    }

                    v105 = (IONotificationPort *)((uint64_t (*)(IOUSBInterfaceStruct942 **))(*self->_interface)->GetEndpointPropertiesV3)(self->_interface);
                    logObjectForModule();
                    v106 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 134217984;
                      *(_QWORD *)&buf[4] = v105;
                      _os_log_impl(&dword_2171C1000, v106, OS_LOG_TYPE_DEFAULT, "notificationPort = %p", buf, 0xCu);
                    }

                    if (v105)
                    {
                      IONotificationPortSetDispatchQueue(v105, (dispatch_queue_t)usbHostNotificationQ);
                      logObjectForModule();
                      v107 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG))
                        -[AccessoryIAPInterface configureInterface:skipPipeSetup:].cold.5();

                      block[0] = MEMORY[0x24BDAC760];
                      block[1] = 3221225472;
                      block[2] = __58__AccessoryIAPInterface_configureInterface_skipPipeSetup___block_invoke;
                      block[3] = &unk_24D706A58;
                      block[4] = self;
                      dispatch_async((dispatch_queue_t)usbHostNotificationQ, block);
                      v103 = 1;
                    }
                    else
                    {
                      logObjectForModule();
                      v108 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
                        -[AccessoryIAPInterface configureInterface:skipPipeSetup:].cold.4();

                      if (((unsigned int (*)(IOUSBInterfaceStruct942 **))(*self->_interface)->USBInterfaceClose)(self->_interface))
                      {
                        logObjectForModule();
                        v109 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
                          -[AccessoryIAPInterface dealloc].cold.1();

                      }
                      ((void (*)(IOUSBInterfaceStruct942 **))(*self->_interface)->Release)(self->_interface);
                      v103 = 0;
                      self->_interface = 0;
                    }
                  }
                  self->_interfaceConfigured = v103;
                  goto LABEL_93;
                }
                logObjectForModule();
                v79 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
                  -[AccessoryIAPInterface configureInterface:skipPipeSetup:].cold.9();

                if (!((unsigned int (*)(IOUSBInterfaceStruct942 **))(*self->_interface)->USBInterfaceClose)(self->_interface))
                {
LABEL_136:
                  ((void (*)(IOUSBInterfaceStruct942 **))(*self->_interface)->Release)(self->_interface);
                  v48 = 0;
                  self->_interface = 0;
                  goto LABEL_72;
                }
                logObjectForModule();
                v72 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                {
LABEL_135:

                  goto LABEL_136;
                }
              }
            }
            -[AccessoryIAPInterface dealloc].cold.1();
            goto LABEL_135;
          }
        }
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v63 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
          v63 = MEMORY[0x24BDACB70];
          v66 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          -[AccessoryIAPInterface configureInterface:skipPipeSetup:].cold.20();
      }
    }

    goto LABEL_71;
  }
  v37 = v34;
  if (v36)
  {
    v38 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v38 = MEMORY[0x24BDACB70];
    v40 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    -[AccessoryIAPInterface configureInterface:skipPipeSetup:].cold.27(v37, v38, v41, v42, v43, v44, v45, v46);

  IOObjectRelease(v13);
LABEL_70:
  InterfaceAndNameString = 0;
LABEL_71:
  v48 = 0;
LABEL_72:

  return v48;
}

void __58__AccessoryIAPInterface_configureInterface_skipPipeSetup___block_invoke(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  _BYTE *v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint8_t v9[16];

  if (gLogObjects)
    v2 = gNumLogObjects < 1;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v4 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_2171C1000, v4, OS_LOG_TYPE_DEFAULT, "Trigger start of reading on dispatch_queue", v9, 2u);
  }

  v5 = *(_BYTE **)(a1 + 32);
  if (v5[11])
  {
    InterruptReadCompletion(v5, 0, 0);
  }
  else
  {
    for (i = 0; i != 8; ++i)
    {
      objc_msgSend(*(id *)(a1 + 32), "inUseDataBufArray");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      ReadCompletion(v8, 0, 0);
    }
  }
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<USBInfo: %p, regEntryID: %llu>"), self, -[AccessoryIAPInterface registryEntryID](self, "registryEntryID"));
}

- (BOOL)writeData:(id)a3
{
  id v4;
  uint64_t (*v5)(IOUSBInterfaceStruct942 **, uint64_t, uint64_t, _QWORD);
  IOUSBInterfaceStruct942 **v6;
  uint64_t v7;
  id v8;
  int v9;
  NSObject *v10;
  id v11;
  uint64_t (*v12)(IOUSBInterfaceStruct942 **, uint64_t, uint64_t, _QWORD);
  IOUSBInterfaceStruct942 **v13;
  uint64_t v14;
  id v15;
  BOOL v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  BOOL v21;
  id v23;
  uint64_t v24;
  unint64_t v25;
  uint8_t v26[16];

  v4 = a3;
  if (!-[AccessoryIAPInterface interface](self, "interface") || !*-[AccessoryIAPInterface interface](self, "interface"))
    goto LABEL_30;
  v5 = (uint64_t (*)(IOUSBInterfaceStruct942 **, uint64_t, uint64_t, _QWORD))(*-[AccessoryIAPInterface interface](self, "interface"))[256];
  v6 = -[AccessoryIAPInterface interface](self, "interface");
  v7 = -[AccessoryIAPInterface bulkOutPipeRef](self, "bulkOutPipeRef");
  v8 = objc_retainAutorelease(v4);
  v9 = v5(v6, v7, objc_msgSend(v8, "bytes"), (unsigned __int16)objc_msgSend(v8, "length"));
  if (v9 == -536850432)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v10 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_2171C1000, v10, OS_LOG_TYPE_INFO, "USB Pipe stalled, clear and retry!", v26, 2u);
    }

    ((void (*)(IOUSBInterfaceStruct942 **, _QWORD))(*-[AccessoryIAPInterface interface](self, "interface"))[240])(-[AccessoryIAPInterface interface](self, "interface"), -[AccessoryIAPInterface bulkOutPipeRef](self, "bulkOutPipeRef"));
    v12 = (uint64_t (*)(IOUSBInterfaceStruct942 **, uint64_t, uint64_t, _QWORD))(*-[AccessoryIAPInterface interface](self, "interface"))[256];
    v13 = -[AccessoryIAPInterface interface](self, "interface");
    v14 = -[AccessoryIAPInterface bulkOutPipeRef](self, "bulkOutPipeRef");
    v15 = objc_retainAutorelease(v8);
    v9 = v12(v13, v14, objc_msgSend(v15, "bytes"), (unsigned __int16)objc_msgSend(v15, "length"));
  }
  if (gLogObjects)
    v16 = gNumLogObjects <= 0;
  else
    v16 = 1;
  v17 = !v16;
  if (v9)
  {
    if (v17)
    {
      v18 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v18 = MEMORY[0x24BDACB70];
      v20 = MEMORY[0x24BDACB70];
    }
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
  }
  else
  {
    if (v17)
    {
      v19 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v19 = MEMORY[0x24BDACB70];
      v23 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[AccessoryIAPInterface writeData:].cold.2(v8, v19);

    if (!-[AccessoryIAPInterface needOutZLP](self, "needOutZLP")
      || !objc_msgSend(v8, "length")
      || (v24 = objc_msgSend(v8, "length"), v24 == -[AccessoryIAPInterface maxOutLength](self, "maxOutLength"))
      || (v25 = objc_msgSend(v8, "length"),
          v25 % -[AccessoryIAPInterface bulkOutPipeMaxPacketSize](self, "bulkOutPipeMaxPacketSize"))
      || !((unsigned int (*)(IOUSBInterfaceStruct942 **, _QWORD, void *, _QWORD))(*-[AccessoryIAPInterface interface](self, "interface"))[256])(-[AccessoryIAPInterface interface](self, "interface"), -[AccessoryIAPInterface bulkOutPipeRef](self, "bulkOutPipeRef"), &writeData__zlpBuffer, 0))
    {
      v21 = 1;
      goto LABEL_31;
    }
    logObjectForModule();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
  }
  -[AccessoryIAPInterface writeData:].cold.1();
LABEL_29:

LABEL_30:
  v21 = 0;
LABEL_31:

  return v21;
}

- (BOOL)setProperty:(id)a3 forInterfaceNum:(unsigned __int8)a4
{
  unsigned int v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  _DWORD v20[2];
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v4 = a4;
  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[AccessoryIAPInterface interfacePropertiesArray](self, "interfacePropertiesArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AccessoryIAPInterface setInterfacePropertiesArray:](self, "setInterfacePropertiesArray:", v8);

  }
  -[AccessoryIAPInterface interfacePropertiesArray](self, "interfacePropertiesArray");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[AccessoryIAPInterface interfacePropertiesArray](self, "interfacePropertiesArray");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11 <= v4)
    {
      v12 = v4 - v11 + 1;
      do
      {
        -[AccessoryIAPInterface interfacePropertiesArray](self, "interfacePropertiesArray");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v14);

        --v12;
      }
      while (v12);
    }
    -[AccessoryIAPInterface interfacePropertiesArray](self, "interfacePropertiesArray");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:atIndexedSubscript:", v6, v4);

  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v16 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v16 = MEMORY[0x24BDACB70];
    v17 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    -[AccessoryIAPInterface interfacePropertiesArray](self, "interfacePropertiesArray");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = 67109634;
    v20[1] = v4;
    v21 = 2112;
    v22 = v6;
    v23 = 2112;
    v24 = v18;
    _os_log_impl(&dword_2171C1000, v16, OS_LOG_TYPE_INFO, "Set property for interface number %u: %@\ninterfacePropertiesArray: %@", (uint8_t *)v20, 0x1Cu);

  }
  return v9 != 0;
}

- (BOOL)setInterfaceProperties:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *v6;
  BOOL v7;
  id v8;
  kern_return_t v9;
  BOOL v10;
  int v11;
  NSObject *v12;
  BOOL v13;
  id v14;
  id v15;
  id v17;
  uint64_t v18;
  io_registry_entry_t entry;

  v4 = a3;
  if (-[AccessoryIAPInterface interface](self, "interface"))
  {
    entry = 0;
    if (((unsigned int (*)(IOUSBInterfaceStruct942 **, io_registry_entry_t *))(*-[AccessoryIAPInterface interface](self, "interface"))[168])(-[AccessoryIAPInterface interface](self, "interface"), &entry))
    {
      v5 = 1;
    }
    else
    {
      v5 = entry == 0;
    }
    if (v5)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v6 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
        v6 = MEMORY[0x24BDACB70];
        v14 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[AccessoryIAPInterface setInterfaceProperties:].cold.7();
    }
    else
    {
      v9 = IORegistryEntrySetCFProperties(entry, v4);
      if (gLogObjects)
        v10 = gNumLogObjects <= 0;
      else
        v10 = 1;
      v11 = !v10;
      if (!v9)
      {
        if (v11)
        {
          v6 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
          v6 = MEMORY[0x24BDACB70];
          v17 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          -[AccessoryIAPInterface setInterfaceProperties:].cold.3((uint64_t)v4, v6, v18);
        v13 = 1;
        goto LABEL_43;
      }
      if (v11)
      {
        v6 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
        v6 = MEMORY[0x24BDACB70];
        v15 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[AccessoryIAPInterface setInterfaceProperties:].cold.5();
    }
    v13 = 0;
LABEL_43:

    goto LABEL_44;
  }
  if (gLogObjects)
    v7 = gNumLogObjects < 1;
  else
    v7 = 1;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v12 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  else
  {
    v12 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[AccessoryIAPInterface setInterfaceProperties:].cold.1();

  v13 = 0;
LABEL_44:

  return v13;
}

- (BOOL)setUSBHostHIDInterface:(unsigned __int8)a3 withHIDFunction:(unsigned int)a4
{
  uint64_t v5;
  BOOL v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  BOOL v12;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  unsigned int v19;
  uint64_t v20;

  v5 = a3;
  v20 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v7 = gNumLogObjects < 1;
  else
    v7 = 1;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v9 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  else
  {
    v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    v17 = v5;
    v18 = 1024;
    v19 = a4;
    _os_log_impl(&dword_2171C1000, v9, OS_LOG_TYPE_INFO, "Setting USBHost HID interface: %d with HIDFunctionType: %d", buf, 0xEu);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a4, CFSTR("IAPHIDAccessoryCategoryKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[AccessoryIAPInterface setProperty:forInterfaceNum:](self, "setProperty:forInterfaceNum:", v11, v5);

  return v12;
}

- (BOOL)clearUSBHostHIDInterfaces
{
  BOOL v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[AccessoryIAPInterface setInterfacePropertiesArray:](self, "setInterfacePropertiesArray:", 0);
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[AccessoryIAPInterface interfacePropertiesArray](self, "interfacePropertiesArray");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_2171C1000, v5, OS_LOG_TYPE_INFO, "interfacePropertiesArray %@...", (uint8_t *)&v8, 0xCu);

  }
  return 1;
}

- (BOOL)configureNCMInterface:(unsigned __int8)a3 asCarPlay:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  void *v7;
  void *v8;
  NSObject *v9;
  BOOL v10;
  id v11;
  _DWORD v13[2];
  uint64_t v14;

  v4 = a4;
  v5 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)objc_opt_new();
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", 0x20000000);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("NetworkInterfaceFlags"));

    if (v4)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("CarPlay"), CFSTR("InterfaceRole"));
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v9 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v9 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v13[0] = 67109120;
      v13[1] = v5;
      _os_log_impl(&dword_2171C1000, v9, OS_LOG_TYPE_INFO, "Setting NCM interface number to %u...", (uint8_t *)v13, 8u);
    }

    v10 = -[AccessoryIAPInterface setProperty:forInterfaceNum:](self, "setProperty:forInterfaceNum:", v7, v5);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)unlockOtherInterfaces
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AccessoryIAPInterface interfacePropertiesArray](self, "interfacePropertiesArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AccessoryIAPInterface interfacePropertiesArray](self, "interfacePropertiesArray");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("InterfaceProperties"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("Authenticated"));

  v7 = -[AccessoryIAPInterface setInterfaceProperties:](self, "setInterfaceProperties:", v3);
  return v7;
}

- (BOOL)lockOtherInterfaces
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("Authenticated"));

  LOBYTE(self) = -[AccessoryIAPInterface setInterfaceProperties:](self, "setInterfaceProperties:", v3);
  return (char)self;
}

- (void)presentNotSupportNotification
{
  void *v3;
  void *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  int vid;
  int pid;
  unint64_t registryEntryID;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  acc_userNotifications_accessoryNotSupported();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)-[NSString copy](self->_identifier, "copy");
  objc_msgSend(v3, "setGroupIdentifier:", v4);

  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    vid = self->_vid;
    pid = self->_pid;
    registryEntryID = self->_registryEntryID;
    objc_msgSend(v3, "groupIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136316418;
    v14 = "-[AccessoryIAPInterface presentNotSupportNotification]";
    v15 = 1024;
    v16 = vid;
    v17 = 1024;
    v18 = pid;
    v19 = 2048;
    v20 = registryEntryID;
    v21 = 2112;
    v22 = v11;
    v23 = 2112;
    v24 = v3;
    _os_log_impl(&dword_2171C1000, v7, OS_LOG_TYPE_DEFAULT, "%s: vid/pid 0x%X/0x%X, registryID 0x%llx, groupidentifer %@, pAccErrorNotification %@", (uint8_t *)&v13, 0x36u);

  }
  +[ACCUserNotificationManager sharedManager](ACCUserNotificationManager, "sharedManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "presentNotification:completionHandler:", v3, 0);

}

- (void)dismissNotSupportNotification
{
  void *v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  int vid;
  int pid;
  unint64_t registryEntryID;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  unint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)-[NSString copy](self->_identifier, "copy");
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    vid = self->_vid;
    pid = self->_pid;
    registryEntryID = self->_registryEntryID;
    v11 = 136316162;
    v12 = "-[AccessoryIAPInterface dismissNotSupportNotification]";
    v13 = 1024;
    v14 = vid;
    v15 = 1024;
    v16 = pid;
    v17 = 2048;
    v18 = registryEntryID;
    v19 = 2112;
    v20 = v3;
    _os_log_impl(&dword_2171C1000, v6, OS_LOG_TYPE_DEFAULT, "%s: vid/pid 0x%X/0x%X, registryID 0x%llx, groupidentifer %@", (uint8_t *)&v11, 0x2Cu);
  }

  +[ACCUserNotificationManager sharedManager](ACCUserNotificationManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dismissNotificationsWithGroupIdentifier:", v3);

}

+ (unint64_t)getRegistryEntryIDFromService:(unsigned int)a3
{
  uint64_t entryID;

  entryID = 0;
  if (IORegistryEntryGetRegistryEntryID(a3, &entryID))
    return 0;
  else
    return entryID;
}

- (unint64_t)registryEntryID
{
  return self->_registryEntryID;
}

- (unsigned)locationID
{
  return self->_locationID;
}

- (unint64_t)parentDeviceRegistryEntryID
{
  return self->_parentDeviceRegistryEntryID;
}

- (NSDictionary)ioregProperties
{
  return self->_ioregProperties;
}

- (id)dataInHandler
{
  return self->_dataInHandler;
}

- (void)setDataInHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)needOutZLP
{
  return self->_needOutZLP;
}

- (void)setNeedOutZLP:(BOOL)a3
{
  self->_needOutZLP = a3;
}

- (unsigned)maxOutLength
{
  return self->_maxOutLength;
}

- (void)setMaxOutLength:(unsigned int)a3
{
  self->_maxOutLength = a3;
}

- (unsigned)vid
{
  return self->_vid;
}

- (unsigned)pid
{
  return self->_pid;
}

- (unsigned)vidpid
{
  return self->_vidpid;
}

- (double)creationTime
{
  return self->_creationTime;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)aidInfo
{
  return self->_aidInfo;
}

- (void)setAidInfo:(id)a3
{
  objc_storeStrong((id *)&self->_aidInfo, a3);
}

- (IOUSBInterfaceStruct942)interface
{
  return self->_interface;
}

- (void)setInterface:(IOUSBInterfaceStruct942 *)a3
{
  self->_interface = a3;
}

- (unsigned)bulkOutPipeRef
{
  return self->_bulkOutPipeRef;
}

- (void)setBulkOutPipeRef:(unsigned __int8)a3
{
  self->_bulkOutPipeRef = a3;
}

- (unsigned)bulkOutPipeMaxPacketSize
{
  return self->_bulkOutPipeMaxPacketSize;
}

- (void)setBulkOutPipeMaxPacketSize:(unsigned __int16)a3
{
  self->_bulkOutPipeMaxPacketSize = a3;
}

- (unsigned)bulkInPipeRef
{
  return self->_bulkInPipeRef;
}

- (void)setBulkInPipeRef:(unsigned __int8)a3
{
  self->_bulkInPipeRef = a3;
}

- (unsigned)bulkInPipeMaxPacketSize
{
  return self->_bulkInPipeMaxPacketSize;
}

- (void)setBulkInPipeMaxPacketSize:(unsigned __int16)a3
{
  self->_bulkInPipeMaxPacketSize = a3;
}

- (unsigned)interruptInPipeRef
{
  return self->_interruptInPipeRef;
}

- (void)setInterruptInPipeRef:(unsigned __int8)a3
{
  self->_interruptInPipeRef = a3;
}

- (unsigned)interruptInPipeMaxPacketSize
{
  return self->_interruptInPipeMaxPacketSize;
}

- (void)setInterruptInPipeMaxPacketSize:(unsigned __int16)a3
{
  self->_interruptInPipeMaxPacketSize = a3;
}

- (char)interruptInPipeBuffer
{
  return self->_interruptInPipeBuffer;
}

- (void)setInterruptInPipeBuffer:(char *)a3
{
  self->_interruptInPipeBuffer = a3;
}

- (NSMutableArray)interfacePropertiesArray
{
  return self->_interfacePropertiesArray;
}

- (void)setInterfacePropertiesArray:(id)a3
{
  objc_storeStrong((id *)&self->_interfacePropertiesArray, a3);
}

- (NSMutableArray)inUseDataBufArray
{
  return self->_inUseDataBufArray;
}

- (void)setInUseDataBufArray:(id)a3
{
  objc_storeStrong((id *)&self->_inUseDataBufArray, a3);
}

- (NSLock)dataBufLock
{
  return self->_dataBufLock;
}

- (void)setDataBufLock:(id)a3
{
  objc_storeStrong((id *)&self->_dataBufLock, a3);
}

- (BOOL)hasReadInterruptPipe
{
  return self->_hasReadInterruptPipe;
}

- (void)setHasReadInterruptPipe:(BOOL)a3
{
  self->_hasReadInterruptPipe = a3;
}

- (NSMutableArray)interruptBulkReadList
{
  return self->_interruptBulkReadList;
}

- (void)setInterruptBulkReadList:(id)a3
{
  objc_storeStrong((id *)&self->_interruptBulkReadList, a3);
}

- (unsigned)interruptBulkReadAllocCount
{
  return self->_interruptBulkReadAllocCount;
}

- (void)setInterruptBulkReadAllocCount:(unsigned int)a3
{
  self->_interruptBulkReadAllocCount = a3;
}

- (unsigned)interruptBulkReadReleaseCount
{
  return self->_interruptBulkReadReleaseCount;
}

- (void)setInterruptBulkReadReleaseCount:(unsigned int)a3
{
  self->_interruptBulkReadReleaseCount = a3;
}

- (BOOL)interfaceConfigured
{
  return self->_interfaceConfigured;
}

- (void)setInterfaceConfigured:(BOOL)a3
{
  self->_interfaceConfigured = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interruptBulkReadList, 0);
  objc_storeStrong((id *)&self->_dataBufLock, 0);
  objc_storeStrong((id *)&self->_inUseDataBufArray, 0);
  objc_storeStrong((id *)&self->_interfacePropertiesArray, 0);
  objc_storeStrong((id *)&self->_aidInfo, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_dataInHandler, 0);
  objc_storeStrong((id *)&self->_ioregProperties, 0);
}

- (void)configureInterface:skipPipeSetup:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6_0(&dword_2171C1000, v0, v1, "findParentOfClass returned IO_OBJECT_NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)configureInterface:skipPipeSetup:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6_0(&dword_2171C1000, v0, v1, "Unable to retrieve asynchronous port", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)configureInterface:skipPipeSetup:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0(&dword_2171C1000, v0, v1, "Asynchronous event source added to run loop", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)configureInterface:skipPipeSetup:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_2_1(&dword_2171C1000, v0, v1, "failed to create async port 0x%08x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)configureInterface:skipPipeSetup:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_2_1(&dword_2171C1000, v0, v1, "Error getting interrupt pipe properties (%08x), but ignoring", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)configureInterface:skipPipeSetup:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_2_1(&dword_2171C1000, v0, v1, "Error getting kUSBIn kUSBBulk pipe properties (%08x)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)configureInterface:skipPipeSetup:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6_0(&dword_2171C1000, v0, v1, "Unable to find bulk in endpoint!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)configureInterface:skipPipeSetup:.cold.12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_2_1(&dword_2171C1000, v0, v1, "Error getting kUSBOut kUSBBulk pipe properties (%08x)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)configureInterface:skipPipeSetup:.cold.13()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6_0(&dword_2171C1000, v0, v1, "Unable to find bulk out endpoint!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)configureInterface:skipPipeSetup:.cold.15()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_2_1(&dword_2171C1000, v0, v1, "Unable to get number of endpoints (%08x)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)configureInterface:skipPipeSetup:.cold.16()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_2_1(&dword_2171C1000, v0, v1, "Unable to open interface (%08x)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)configureInterface:skipPipeSetup:.cold.17()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_2_1(&dword_2171C1000, v0, v1, "Error getting usb device ID: %u", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)configureInterface:skipPipeSetup:.cold.18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6_0(&dword_2171C1000, v0, v1, "Unable to get parent USB device ID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)configureInterface:(os_log_t)log skipPipeSetup:.cold.19(unsigned __int8 *a1, unsigned __int8 *a2, os_log_t log)
{
  int v3;
  int v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = *a2;
  v5[0] = 67109376;
  v5[1] = v3;
  v6 = 1024;
  v7 = v4;
  _os_log_debug_impl(&dword_2171C1000, log, OS_LOG_TYPE_DEBUG, "Interface class %d, subclass %d", (uint8_t *)v5, 0xEu);
  OUTLINED_FUNCTION_1();
}

- (void)configureInterface:skipPipeSetup:.cold.20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_2_1(&dword_2171C1000, v0, v1, "Couldn’t create a device interface for the interface (%08x)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)configureInterface:skipPipeSetup:.cold.22()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_2_1(&dword_2171C1000, v0, v1, "Unable to create a plug-in (%08x)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)configureInterface:skipPipeSetup:.cold.24()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_2_1(&dword_2171C1000, v0, v1, "Failed to get serviceProperties error: %08x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)configureInterface:(uint64_t)a3 skipPipeSetup:(uint64_t)a4 .cold.27(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_2171C1000, a2, a3, "%s: IORegistryEntryGetName failed: %08x", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)configureInterface:(uint64_t)a3 skipPipeSetup:(uint64_t)a4 .cold.29(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_0(&dword_2171C1000, a2, a3, "IOUSBDevice Busy: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

- (void)writeData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_2_1(&dword_2171C1000, v0, v1, "Unable to perform bulk write (%08x)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)writeData:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = 134217984;
  v5 = objc_msgSend(a1, "length");
  OUTLINED_FUNCTION_9_0(&dword_2171C1000, a2, v3, "Wrote %lu bytes to USB!", (uint8_t *)&v4);
}

- (void)setInterfaceProperties:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6_0(&dword_2171C1000, v0, v1, "Error, USB Host interface not found!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)setInterfaceProperties:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_9_0(&dword_2171C1000, a2, a3, "Set USB Host interface properties:\n%@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)setInterfaceProperties:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_2_1(&dword_2171C1000, v0, v1, "Error setting USB Host interface properties: 0x%x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)setInterfaceProperties:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_2_1(&dword_2171C1000, v0, v1, "Error getting USB Host interface: 0x%x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

@end
