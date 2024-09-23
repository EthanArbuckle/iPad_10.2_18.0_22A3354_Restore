@implementation BCHIDBrtControl

+ (id)newMonitorWithHandler:(id)a3 error:(id *)a4
{
  const __CFDictionary *v6;
  NSObject *inited;
  NSObject *v8;
  IONotificationPort *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BCBrtMonitor *v21;
  _QWORD v23[5];
  int v24;
  _QWORD v25[2];
  void (*v26)(uint64_t);
  void *v27;
  NSObject *v28;
  IONotificationPort *v29;
  _QWORD *v30;
  _QWORD v31[5];
  uint8_t buf[4];
  const __CFDictionary *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = (const __CFDictionary *)_copyMatchingDict();
  inited = _COREBRIGHTNESS_LOG_DEFAULT;
  if (!_COREBRIGHTNESS_LOG_DEFAULT)
    inited = init_default_corebrightness_log();
  if (os_log_type_enabled(inited, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v6;
    _os_log_impl(&dword_229A2F000, inited, OS_LOG_TYPE_INFO, "matching dictionary = %@", buf, 0xCu);
  }
  v8 = dispatch_queue_create("com.apple.BCHIDBrtControl.global", 0);
  v9 = IONotificationPortCreate(*MEMORY[0x24BDD8B20]);
  IONotificationPortSetDispatchQueue(v9, v8);
  v10 = MEMORY[0x24BDAC760];
  *(_DWORD *)buf = 0;
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __47__BCHIDBrtControl_newMonitorWithHandler_error___block_invoke;
  v31[3] = &unk_24F2A7050;
  v31[4] = a3;
  v11 = _newBlockWrapper(v31);
  v25[0] = v10;
  v25[1] = 3221225472;
  v26 = __47__BCHIDBrtControl_newMonitorWithHandler_error___block_invoke_2;
  v27 = &unk_24F2A7160;
  v28 = v8;
  v29 = v9;
  v30 = v11;
  v12 = IOServiceAddMatchingNotification(v9, "IOServiceFirstMatch", v6, (IOServiceMatchingCallback)_iokitCallback, v11, (io_iterator_t *)buf);
  if (!(_DWORD)v12)
  {
    v23[0] = v10;
    v23[1] = 3221225472;
    v23[2] = __47__BCHIDBrtControl_newMonitorWithHandler_error___block_invoke_5;
    v23[3] = &__block_descriptor_44_e5_v8__0l;
    v23[4] = v11;
    v24 = *(_DWORD *)buf;
    dispatch_async(v8, v23);
    v21 = objc_alloc_init(BCBrtMonitor);
    -[BCBrtMonitor setCancelHandler:](v21, "setCancelHandler:", v25);
    return v21;
  }
  v13 = v12;
  v14 = _COREBRIGHTNESS_LOG_DEFAULT;
  if (!_COREBRIGHTNESS_LOG_DEFAULT)
    v14 = init_default_corebrightness_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    +[BCHIDBrtControl newMonitorWithHandler:error:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
    if (!a4)
      goto LABEL_11;
    goto LABEL_10;
  }
  if (a4)
LABEL_10:
    *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithIOKitError:", v13);
LABEL_11:
  v26((uint64_t)v25);
  return 0;
}

uint64_t __47__BCHIDBrtControl_newMonitorWithHandler_error___block_invoke(uint64_t a1, io_iterator_t iterator)
{
  uint64_t result;
  uint64_t v5;
  BCHIDBrtControl *v6;

  result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    v5 = result;
    do
    {
      v6 = -[BCHIDBrtControl initWithService:]([BCHIDBrtControl alloc], "initWithService:", v5);
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

      result = IOIteratorNext(iterator);
      v5 = result;
    }
    while ((_DWORD)result);
  }
  return result;
}

void __47__BCHIDBrtControl_newMonitorWithHandler_error___block_invoke_2(uint64_t a1)
{
  _QWORD block[7];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__BCHIDBrtControl_newMonitorWithHandler_error___block_invoke_3;
  block[3] = &unk_24F2A7160;
  block[6] = *(_QWORD *)(a1 + 48);
  dispatch_async(*(dispatch_queue_t *)(a1 + 32), block);
}

void __47__BCHIDBrtControl_newMonitorWithHandler_error___block_invoke_3(uint64_t a1)
{
  IONotificationPortDestroy(*(IONotificationPortRef *)(a1 + 40));
  _freeBlockWrapper(*(const void ***)(a1 + 48));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

uint64_t __47__BCHIDBrtControl_newMonitorWithHandler_error___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 32) + 16))(**(_QWORD **)(a1 + 32), *(unsigned int *)(a1 + 40));
}

+ (id)copyAvailableControls
{
  id v2;
  mach_port_t v3;
  const __CFDictionary *v4;
  BOOL v5;
  uint64_t v6;
  BCHIDBrtControl *v7;
  io_iterator_t existing;

  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  existing = 0;
  v3 = *MEMORY[0x24BDD8B20];
  v4 = (const __CFDictionary *)_copyMatchingDict();
  if (IOServiceGetMatchingServices(v3, v4, &existing))
    v5 = 1;
  else
    v5 = existing == 0;
  if (!v5)
  {
    v6 = IOIteratorNext(existing);
    if ((_DWORD)v6)
    {
      v7 = -[BCHIDBrtControl initWithService:]([BCHIDBrtControl alloc], "initWithService:", v6);
      if (v7)
        objc_msgSend(v2, "addObject:", v7);

    }
  }
  return v2;
}

- (id)copyModuleIdentifier
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", CFSTR("com.apple.BCBrtControl.HID"));
}

- (BCHIDBrtControl)initWithService:(unsigned int)a3
{
  char *v5;
  os_log_t v6;
  NSObject *v7;
  OS_os_log *inited;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CFTypeRef v16;
  os_log_t v17;
  NSObject *v18;
  dispatch_queue_t v19;
  os_log_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  id v30;
  int *v31;
  float v32;
  double v33;
  os_log_t v34;
  NSObject *v35;
  uint64_t *v36;
  os_log_t v37;
  NSObject *v38;
  os_log_t v39;
  NSObject *v40;
  os_log_t v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  float v47;
  uint64_t v48;
  void *v49;
  os_log_t v50;
  NSObject *v51;
  uint64_t v52;
  io_registry_entry_t v53;
  os_log_t v54;
  NSObject *v55;
  uint64_t v56;
  char *v57;
  _QWORD *v58;
  void *context;
  io_registry_entry_t *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[5];
  _QWORD v66[6];
  objc_super v67;
  uint8_t buf[4];
  uint64_t v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  double v75;
  __int16 v76;
  uint64_t v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  if (!a3)
  {
    if (-[BCBrtControl logHandle](self, "logHandle"))
    {
      inited = -[BCBrtControl logHandle](self, "logHandle");
    }
    else
    {
      v9 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (_COREBRIGHTNESS_LOG_DEFAULT)
      {
LABEL_11:
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[BCHIDBrtControl initWithService:].cold.1();
        return 0;
      }
      inited = (OS_os_log *)init_default_corebrightness_log();
    }
    v9 = inited;
    goto LABEL_11;
  }
  v67.receiver = self;
  v67.super_class = (Class)BCHIDBrtControl;
  v5 = -[BCBrtControl init](&v67, sel_init);
  if (!v5)
    return (BCHIDBrtControl *)v5;
  context = (void *)MEMORY[0x22E2D4EA4]();
  *((_DWORD *)v5 + 49) = 1065353216;
  v60 = (io_registry_entry_t *)(v5 + 116);
  *((_DWORD *)v5 + 29) = a3;
  v57 = v5 + 200;
  if (IORegistryEntryGetRegistryEntryID(a3, (uint64_t *)v5 + 25))
  {
    if (objc_msgSend(v5, "logHandle"))
    {
      v6 = (os_log_t)objc_msgSend(v5, "logHandle");
    }
    else
    {
      v7 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (_COREBRIGHTNESS_LOG_DEFAULT)
      {
LABEL_14:
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[BCHIDBrtControl initWithService:].cold.7((uint64_t)v60, v7, v10, v11, v12, v13, v14, v15);
        goto LABEL_16;
      }
      v6 = init_default_corebrightness_log();
    }
    v7 = v6;
    goto LABEL_14;
  }
LABEL_16:
  v16 = IORegistryEntrySearchCFProperty(*v60, "IOService", CFSTR("kUSBContainerID"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 3u);
  if (v16)
  {
    *((_QWORD *)v5 + 9) = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v16);
    CFRelease(v16);
    goto LABEL_24;
  }
  *((_QWORD *)v5 + 9) = 0;
  if (objc_msgSend(v5, "logHandle"))
  {
    v17 = (os_log_t)objc_msgSend(v5, "logHandle");
LABEL_20:
    v18 = v17;
    goto LABEL_22;
  }
  v18 = _COREBRIGHTNESS_LOG_DEFAULT;
  if (!_COREBRIGHTNESS_LOG_DEFAULT)
  {
    v17 = init_default_corebrightness_log();
    goto LABEL_20;
  }
LABEL_22:
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    -[BCHIDBrtControl initWithService:].cold.6();
LABEL_24:
  v19 = dispatch_queue_create("com.apple.BCBrtControl.HID.BrtUpdate", 0);
  *((_QWORD *)v5 + 22) = v19;
  if (v19)
    goto LABEL_32;
  if (objc_msgSend(v5, "logHandle"))
  {
    v20 = (os_log_t)objc_msgSend(v5, "logHandle");
  }
  else
  {
    v21 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      goto LABEL_29;
    v20 = init_default_corebrightness_log();
  }
  v21 = v20;
LABEL_29:
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    -[BCHIDBrtControl initWithService:].cold.5();
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("Resource unavailable"), CFSTR("Invalid queue"), v57, context);
LABEL_32:
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x3052000000;
  v66[3] = __Block_byref_object_copy__0;
  v66[4] = __Block_byref_object_dispose__0;
  v66[5] = v5;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD8A38]), "initWithService:", *v60);
  *((_QWORD *)v5 + 15) = v22;
  if (!v22)
  {
    if (objc_msgSend(v5, "logHandle"))
    {
      v34 = (os_log_t)objc_msgSend(v5, "logHandle");
    }
    else
    {
      v35 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        goto LABEL_67;
      v34 = init_default_corebrightness_log();
    }
    v35 = v34;
LABEL_67:
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[BCHIDBrtControl initWithService:].cold.2();

    goto LABEL_76;
  }
  objc_msgSend(v22, "setDispatchQueue:", objc_msgSend(v5, "queue"));
  v23 = (void *)*((_QWORD *)v5 + 15);
  v65[0] = MEMORY[0x24BDAC760];
  v65[1] = 3221225472;
  v65[2] = __35__BCHIDBrtControl_initWithService___block_invoke;
  v65[3] = &unk_24F2A70C0;
  v65[4] = v66;
  objc_msgSend(v23, "setRemovalHandler:", v65);
  objc_msgSend(*((id *)v5 + 15), "open");
  objc_msgSend(*((id *)v5 + 15), "activate");
  v24 = objc_alloc_init(MEMORY[0x24BDBCE70]);
  v25 = (void *)objc_msgSend(*((id *)v5 + 15), "elementsMatching:", v24);
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v61, v78, 16);
  if (!v26)
    goto LABEL_49;
  v27 = *(_QWORD *)v62;
  do
  {
    for (i = 0; i != v26; ++i)
    {
      if (*(_QWORD *)v62 != v27)
        objc_enumerationMutation(v25);
      v29 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
      if (objc_msgSend(v29, "type", v57) == 257
        && objc_msgSend(v29, "usage") == 16
        && objc_msgSend(v29, "usagePage") == 130)
      {
        v30 = v29;
        v31 = &OBJC_IVAR___BCHIDBrtControl__brightnessElement;
LABEL_46:
        *(_QWORD *)&v5[*v31] = v30;
        continue;
      }
      if (objc_msgSend(v29, "type") == 257 && objc_msgSend(v29, "usage") == 80 && objc_msgSend(v29, "usagePage") == 15)
      {
        v30 = v29;
        v31 = &OBJC_IVAR___BCHIDBrtControl__brightnessFadeElement;
        goto LABEL_46;
      }
    }
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v61, v78, 16);
  }
  while (v26);
LABEL_49:

  if (!*((_QWORD *)v5 + 16))
  {
    if (objc_msgSend(v5, "logHandle"))
    {
      v39 = (os_log_t)objc_msgSend(v5, "logHandle");
    }
    else
    {
      v40 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        goto LABEL_73;
      v39 = init_default_corebrightness_log();
    }
    v40 = v39;
LABEL_73:
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      -[BCHIDBrtControl initWithService:].cold.3();

LABEL_76:
    _Block_object_dispose(v66, 8);
    objc_autoreleasePoolPop(context);
    return 0;
  }
  *((_DWORD *)v5 + 36) = 1120403456;
  if (objc_msgSend(*((id *)v5 + 16), "physicalMax") < 2001 || objc_msgSend(*((id *)v5 + 16), "unitExponent") < 1)
  {
    *((double *)v5 + 6) = (double)objc_msgSend(*((id *)v5 + 16), "physicalMax", v57);
    v33 = (double)objc_msgSend(*((id *)v5 + 16), "physicalMin");
LABEL_58:
    *((double *)v5 + 8) = v33;
  }
  else
  {
    v32 = scaleForExponent(objc_msgSend(*((id *)v5 + 16), "unitExponent"));
    *((float *)v5 + 36) = v32;
    if (v32 > 0.0)
    {
      *((double *)v5 + 6) = (float)((float)objc_msgSend(*((id *)v5 + 16), "physicalMax") / *((float *)v5 + 36));
      v33 = (float)((float)objc_msgSend(*((id *)v5 + 16), "physicalMin") / *((float *)v5 + 36));
      goto LABEL_58;
    }
  }
  v36 = (uint64_t *)(v5 + 152);
  if ((objc_msgSend(v5, "_getDeviceNits:", v5 + 152, v57) & 1) == 0)
  {
    if (objc_msgSend(v5, "logHandle"))
    {
      v37 = (os_log_t)objc_msgSend(v5, "logHandle");
      goto LABEL_62;
    }
    v38 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT)
    {
      v37 = init_default_corebrightness_log();
LABEL_62:
      v38 = v37;
    }
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      -[BCHIDBrtControl initWithService:].cold.4();
    *v36 = 0x4062C00000000000;
  }
  if (objc_msgSend(v5, "logHandle"))
  {
    v42 = (os_log_t)objc_msgSend(v5, "logHandle");
    goto LABEL_85;
  }
  v43 = _COREBRIGHTNESS_LOG_DEFAULT;
  if (!_COREBRIGHTNESS_LOG_DEFAULT)
  {
    v42 = init_default_corebrightness_log();
LABEL_85:
    v43 = v42;
  }
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    v44 = *v36;
    v45 = *((_QWORD *)v5 + 6);
    v46 = *((_QWORD *)v5 + 8);
    v47 = *((float *)v5 + 36);
    v48 = objc_msgSend(*((id *)v5 + 16), "unitExponent");
    *(_DWORD *)buf = 134219008;
    v69 = v44;
    v70 = 2048;
    v71 = v45;
    v72 = 2048;
    v73 = v46;
    v74 = 2048;
    v75 = v47;
    v76 = 2048;
    v77 = v48;
    _os_log_impl(&dword_229A2F000, v43, OS_LOG_TYPE_DEFAULT, "nits = %f, maxNits = %f, minNits = %f, nitsScaler = %f, exponent = %ld", buf, 0x34u);
  }
  if (*((_QWORD *)v5 + 9))
  {
    v49 = (void *)MEMORY[0x22E2D4EA4]();
    objc_msgSend(*((id *)v5 + 5), "setValue:forKey:", objc_msgSend(*((id *)v5 + 9), "UUIDString"), CFSTR("kUSBContainerID"));
    objc_autoreleasePoolPop(v49);
  }
  objc_msgSend(*((id *)v5 + 5), "setValue:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *v58), CFSTR("RegistryID"));
  objc_msgSend(*((id *)v5 + 5), "setValue:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)v5 + 8)), CFSTR("MinNits"));
  objc_msgSend(*((id *)v5 + 5), "setValue:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)v5 + 6)), CFSTR("MaxNits"));
  objc_msgSend(*((id *)v5 + 5), "setValue:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0), CFSTR("BuiltIn"));
  v5[32] = 1;
  if (objc_msgSend(v5, "logHandle"))
  {
    v50 = (os_log_t)objc_msgSend(v5, "logHandle");
    goto LABEL_93;
  }
  v51 = _COREBRIGHTNESS_LOG_DEFAULT;
  if (!_COREBRIGHTNESS_LOG_DEFAULT)
  {
    v50 = init_default_corebrightness_log();
LABEL_93:
    v51 = v50;
  }
  if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
  {
    v52 = *((_QWORD *)v5 + 15);
    v53 = *v60;
    *(_DWORD *)buf = 138543618;
    v69 = v52;
    v70 = 1024;
    LODWORD(v71) = v53;
    _os_log_impl(&dword_229A2F000, v51, OS_LOG_TYPE_INFO, "successfully created HID device (%{public}@) for service %ul", buf, 0x12u);
  }
  if (objc_msgSend(v5, "logHandle"))
  {
    v54 = (os_log_t)objc_msgSend(v5, "logHandle");
    goto LABEL_99;
  }
  v55 = _COREBRIGHTNESS_LOG_DEFAULT;
  if (!_COREBRIGHTNESS_LOG_DEFAULT)
  {
    v54 = init_default_corebrightness_log();
LABEL_99:
    v55 = v54;
  }
  if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
  {
    v56 = *((_QWORD *)v5 + 5);
    *(_DWORD *)buf = 138543362;
    v69 = v56;
    _os_log_impl(&dword_229A2F000, v55, OS_LOG_TYPE_INFO, "capabilities = %{public}@", buf, 0xCu);
  }
  _Block_object_dispose(v66, 8);
  objc_autoreleasePoolPop(context);
  return (BCHIDBrtControl *)v5;
}

void __35__BCHIDBrtControl_initWithService___block_invoke(uint64_t a1)
{
  os_log_t inited;
  NSObject *v3;
  os_log_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *global_queue;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 32) = 0;
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "logHandle"))
  {
    inited = (os_log_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "logHandle");
LABEL_3:
    v3 = inited;
    goto LABEL_5;
  }
  v3 = _COREBRIGHTNESS_LOG_DEFAULT;
  if (!_COREBRIGHTNESS_LOG_DEFAULT)
  {
    inited = init_default_corebrightness_log();
    goto LABEL_3;
  }
LABEL_5:
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_229A2F000, v3, OS_LOG_TYPE_INFO, "device removed", buf, 2u);
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "logHandle"))
  {
    v4 = (os_log_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "logHandle");
LABEL_9:
    v5 = v4;
    goto LABEL_11;
  }
  v5 = _COREBRIGHTNESS_LOG_DEFAULT;
  if (!_COREBRIGHTNESS_LOG_DEFAULT)
  {
    v4 = init_default_corebrightness_log();
    goto LABEL_9;
  }
LABEL_11:
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "displayInvalidHandler");
    *(_DWORD *)buf = 138412290;
    v10 = v6;
    _os_log_impl(&dword_229A2F000, v5, OS_LOG_TYPE_INFO, "weakSelf.displayInvalidHandler = %@", buf, 0xCu);
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "callbackQueue"))
    global_queue = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "callbackQueue");
  else
    global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__BCHIDBrtControl_initWithService___block_invoke_21;
  block[3] = &unk_24F2A70C0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(global_queue, block);
}

uint64_t __35__BCHIDBrtControl_initWithService___block_invoke_21(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "displayInvalidHandler");
  if (result)
  {
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "displayInvalidHandler");
    return (*(uint64_t (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  }
  return result;
}

- (BCHIDBrtControl)init
{
  void *v3;
  const __CFDictionary *v4;
  uint64_t MatchingService;

  v3 = (void *)MEMORY[0x22E2D4EA4](self, a2);
  v4 = (const __CFDictionary *)_copyMatchingDict();
  MatchingService = IOServiceGetMatchingService(*MEMORY[0x24BDD8B20], v4);
  objc_autoreleasePoolPop(v3);
  return -[BCHIDBrtControl initWithService:](self, "initWithService:", MatchingService);
}

- (void)dealloc
{
  OS_os_log *inited;
  NSObject *v4;
  NSObject *brightnessUpdateQueue;
  objc_super v6;
  uint8_t buf[16];

  if (-[BCBrtControl logHandle](self, "logHandle"))
  {
    inited = -[BCBrtControl logHandle](self, "logHandle");
LABEL_3:
    v4 = inited;
    goto LABEL_5;
  }
  v4 = _COREBRIGHTNESS_LOG_DEFAULT;
  if (!_COREBRIGHTNESS_LOG_DEFAULT)
  {
    inited = (OS_os_log *)init_default_corebrightness_log();
    goto LABEL_3;
  }
LABEL_5:
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_229A2F000, v4, OS_LOG_TYPE_DEFAULT, "dealloc", buf, 2u);
  }
  -[BCHIDBrtControl removeDisplayService](self, "removeDisplayService");
  brightnessUpdateQueue = self->_brightnessUpdateQueue;
  if (brightnessUpdateQueue)
  {
    dispatch_release(brightnessUpdateQueue);
    self->_brightnessUpdateQueue = 0;
  }

  -[HIDDevice cancel](self->_hidBrightnessDevice, "cancel");
  -[HIDDevice close](self->_hidBrightnessDevice, "close");

  v6.receiver = self;
  v6.super_class = (Class)BCHIDBrtControl;
  -[BCBrtControl dealloc](&v6, sel_dealloc);
}

- (unint64_t)registryID
{
  OS_dispatch_queue *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v3 = -[BCBrtControl queue](self, "queue");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __29__BCHIDBrtControl_registryID__block_invoke;
  v6[3] = &unk_24F2A7188;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync((dispatch_queue_t)v3, v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __29__BCHIDBrtControl_registryID__block_invoke(uint64_t a1)
{
  return IORegistryEntryGetRegistryEntryID(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 116), (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

- (BOOL)_getDeviceNits:(double *)a3
{
  unsigned int v4;
  void *v5;
  OS_os_log *inited;
  NSObject *v7;
  OS_os_log *v8;
  NSObject *v9;
  double v10;
  double v11;
  OS_os_log *v12;
  NSObject *v13;
  _BOOL4 v14;
  double minNits;
  double maxNits;
  id v19;
  uint8_t buf[4];
  double v21;
  __int16 v22;
  double v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v4 = 0;
  v26 = *MEMORY[0x24BDAC8D0];
  while (1)
  {
    v5 = (void *)MEMORY[0x22E2D4EA4](self, a2);
    v19 = 0;
    if ((-[HIDDevice commitElements:direction:error:](self->_hidBrightnessDevice, "commitElements:direction:error:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", self->_brightnessElement), 0, &v19) & 1) != 0)break;
    if (-[BCBrtControl logHandle](self, "logHandle"))
    {
      inited = -[BCBrtControl logHandle](self, "logHandle");
LABEL_5:
      v7 = inited;
      goto LABEL_7;
    }
    v7 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT)
    {
      inited = (OS_os_log *)init_default_corebrightness_log();
      goto LABEL_5;
    }
LABEL_7:
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v21 = *(double *)&v19;
      _os_log_error_impl(&dword_229A2F000, v7, OS_LOG_TYPE_ERROR, "failed to commit elements %{public}@", buf, 0xCu);
    }
    if (objc_msgSend(v19, "retIOKitError") != -536850432)
      ++v4;
    if (v4 > 8)
      break;
    if (-[BCBrtControl logHandle](self, "logHandle"))
    {
      v8 = -[BCBrtControl logHandle](self, "logHandle");
LABEL_14:
      v9 = v8;
      goto LABEL_16;
    }
    v9 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT)
    {
      v8 = (OS_os_log *)init_default_corebrightness_log();
      goto LABEL_14;
    }
LABEL_16:
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v21) = v4;
      _os_log_error_impl(&dword_229A2F000, v9, OS_LOG_TYPE_ERROR, "retrying commit attempt No.%d", buf, 8u);
    }
    usleep(0xC350u);
    objc_autoreleasePoolPop(v5);
  }
  objc_autoreleasePoolPop(v5);
  -[HIDElement scaleValue:](self->_brightnessElement, "scaleValue:", 2);
  *(float *)&v10 = v10;
  v11 = *(float *)&v10;
  if (self->super._maxNits >= *(float *)&v10 && self->super._minNits <= v11)
  {
    *a3 = v11;
    LOBYTE(v14) = 1;
  }
  else
  {
    if (-[BCBrtControl logHandle](self, "logHandle"))
    {
      v12 = -[BCBrtControl logHandle](self, "logHandle");
      goto LABEL_25;
    }
    v13 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT)
    {
      v12 = (OS_os_log *)init_default_corebrightness_log();
LABEL_25:
      v13 = v12;
    }
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (v14)
    {
      minNits = self->super._minNits;
      maxNits = self->super._maxNits;
      *(_DWORD *)buf = 134218496;
      v21 = v11;
      v22 = 2048;
      v23 = minNits;
      v24 = 2048;
      v25 = maxNits;
      _os_log_error_impl(&dword_229A2F000, v13, OS_LOG_TYPE_ERROR, "error: value (%f) out of bounds (%f-%f)", buf, 0x20u);
      LOBYTE(v14) = 0;
    }
  }
  return v14;
}

- (BOOL)_setDeviceNits:(double)minNits
{
  unint64_t brighntessUpdateCounter;
  float v4;
  NSObject *brightnessUpdateQueue;
  _QWORD block[5];

  if (self->super._minNits >= minNits)
    minNits = self->super._minNits;
  if (self->super._maxNits < minNits)
    minNits = self->super._maxNits;
  brighntessUpdateCounter = self->_brighntessUpdateCounter;
  self->_brighntessUpdateCounter = brighntessUpdateCounter + 1;
  v4 = minNits;
  self->_brightnessUpdateTarget = v4;
  self->_nits = minNits;
  if (!brighntessUpdateCounter)
  {
    brightnessUpdateQueue = self->_brightnessUpdateQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __34__BCHIDBrtControl__setDeviceNits___block_invoke;
    block[3] = &unk_24F2A71B0;
    block[4] = self;
    dispatch_async(brightnessUpdateQueue, block);
  }
  return 1;
}

void __34__BCHIDBrtControl__setDeviceNits___block_invoke(uint64_t a1)
{
  id *v1;
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  id *v6;
  char v7;
  id v8;
  os_log_t inited;
  NSObject *v10;
  os_log_t v11;
  NSObject *v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  _QWORD block[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v1 = (id *)(a1 + 32);
  v2 = objc_msgSend(*(id *)(a1 + 32), "queue");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__BCHIDBrtControl__setDeviceNits___block_invoke_2;
  block[3] = &unk_24F2A7188;
  block[4] = *v1;
  block[5] = &v17;
  dispatch_sync(v2, block);
  if (*((_BYTE *)v18 + 24))
  {
    v3 = (void *)MEMORY[0x22E2D4EA4]();
    v15 = 0;
    v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", *((_QWORD *)*v1 + 16));
    v5 = v4;
    v6 = (id *)*v1;
    if (*((_QWORD *)*v1 + 17))
    {
      objc_msgSend(v4, "addObject:");
      v6 = (id *)*v1;
    }
    v7 = objc_msgSend(v6[15], "commitElements:direction:error:", v5, 1, &v15);
    v8 = *v1;
    if ((v7 & 1) != 0)
    {
      if (objc_msgSend(v8, "logHandle"))
      {
        inited = (os_log_t)objc_msgSend(*v1, "logHandle");
      }
      else
      {
        v10 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (_COREBRIGHTNESS_LOG_DEFAULT)
        {
LABEL_12:
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            v13 = *((_QWORD *)*v1 + 19);
            v14 = *((float *)*v1 + 49);
            *(_DWORD *)buf = 134218240;
            v22 = v13;
            v23 = 2048;
            v24 = v14;
            _os_log_impl(&dword_229A2F000, v10, OS_LOG_TYPE_INFO, "setting nits %f X %f boost factor", buf, 0x16u);
          }
LABEL_17:
          objc_autoreleasePoolPop(v3);
          goto LABEL_18;
        }
        inited = init_default_corebrightness_log();
      }
      v10 = inited;
      goto LABEL_12;
    }
    if (objc_msgSend(v8, "logHandle"))
    {
      v11 = (os_log_t)objc_msgSend(*v1, "logHandle");
    }
    else
    {
      v12 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (_COREBRIGHTNESS_LOG_DEFAULT)
      {
LABEL_15:
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          __34__BCHIDBrtControl__setDeviceNits___block_invoke_cold_1((uint64_t)v1, &v15, v12);
        goto LABEL_17;
      }
      v11 = init_default_corebrightness_log();
    }
    v12 = v11;
    goto LABEL_15;
  }
LABEL_18:
  _Block_object_dispose(&v17, 8);
}

_QWORD *__34__BCHIDBrtControl__setDeviceNits___block_invoke_2(_QWORD *result)
{
  uint64_t v1;
  _QWORD *v2;
  double v3;

  v1 = result[4];
  if (*(_QWORD *)(v1 + 168))
  {
    v2 = result;
    v3 = *(double *)(v1 + 152) * *(float *)(v1 + 196);
    if (*(double *)(v1 + 48) < v3)
      v3 = *(double *)(v1 + 48);
    if (*(double *)(v1 + 64) >= v3)
      v3 = *(double *)(v1 + 64);
    objc_msgSend(*(id *)(v1 + 128), "setIntegerValue:", (uint64_t)(v3 * *(float *)(v1 + 144)));
    result = *(_QWORD **)(v2[4] + 136);
    if (result)
      result = (_QWORD *)objc_msgSend(result, "setIntegerValue:", 0);
    *(_BYTE *)(*(_QWORD *)(v2[5] + 8) + 24) = 1;
    v1 = v2[4];
  }
  *(_QWORD *)(v1 + 168) = 0;
  return result;
}

- (BOOL)setNits:(double)a3 error:(id *)a4
{
  OS_dispatch_queue *v6;
  _QWORD v8[6];

  v6 = -[BCBrtControl queue](self, "queue", a4);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __33__BCHIDBrtControl_setNits_error___block_invoke;
  v8[3] = &unk_24F2A71D8;
  v8[4] = self;
  *(double *)&v8[5] = a3;
  dispatch_sync((dispatch_queue_t)v6, v8);
  return 1;
}

uint64_t __33__BCHIDBrtControl_setNits_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setDeviceNits:", *(double *)(a1 + 40));
}

- (double)getNitsWithError:(id *)a3
{
  OS_dispatch_queue *v5;
  double v6;
  _QWORD block[7];
  uint64_t v9;
  double *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x2020000000;
  v12 = 0xBFF0000000000000;
  v5 = -[BCBrtControl queue](self, "queue");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__BCHIDBrtControl_getNitsWithError___block_invoke;
  block[3] = &unk_24F2A7200;
  block[4] = self;
  block[5] = &v13;
  block[6] = &v9;
  dispatch_sync((dispatch_queue_t)v5, block);
  if (a3 && !*((_BYTE *)v14 + 24))
    *a3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithBCError:", 19);
  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  return v6;
}

uint64_t __36__BCHIDBrtControl_getNitsWithError___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_getDeviceNits:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)setProperty:(id)a3 value:(id)a4 error:(id *)a5
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("NotSupported"), CFSTR("This class doesn't support setProperty"), a5);
  return 0;
}

- (id)copyProperty:(id)a3 error:(id *)a4
{
  OS_dispatch_queue *v6;
  void *v7;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  v15 = 0;
  v6 = -[BCBrtControl queue](self, "queue", a3, a4);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__BCHIDBrtControl_copyProperty_error___block_invoke;
  block[3] = &unk_24F2A7228;
  block[5] = self;
  block[6] = &v10;
  block[4] = a3;
  dispatch_sync((dispatch_queue_t)v6, block);
  v7 = (void *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __38__BCHIDBrtControl_copyProperty_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    result = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 120), "propertyForKey:", *(_QWORD *)(a1 + 32)), "copy");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      result = (uint64_t)IORegistryEntrySearchCFProperty(*(_DWORD *)(*(_QWORD *)(a1 + 40) + 116), "IOService", *(CFStringRef *)(a1 + 32), (CFAllocatorRef)*MEMORY[0x24BDBD240], 3u);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
    }
  }
  return result;
}

- (void)setDisplayService:(unsigned int)a3
{
  uint64_t v3;
  OS_os_log *inited;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v3 = *(_QWORD *)&a3;
  v8 = *MEMORY[0x24BDAC8D0];
  if (self->super._displayService)
  {
    -[BCHIDBrtControl removeDisplayService](self, "removeDisplayService");
    -[BCHIDBrtControl _setDeviceNits:](self, "_setDeviceNits:", self->_nits);
  }
  if ((_DWORD)v3)
  {
    if (-[BCBrtControl logHandle](self, "logHandle"))
    {
      inited = -[BCBrtControl logHandle](self, "logHandle");
    }
    else
    {
      v6 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        goto LABEL_8;
      inited = (OS_os_log *)init_default_corebrightness_log();
    }
    v6 = inited;
LABEL_8:
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl(&dword_229A2F000, v6, OS_LOG_TYPE_INFO, "adding display service (0x%X)", (uint8_t *)v7, 8u);
    }
    -[BCHIDBrtControl addDisplayService:](self, "addDisplayService:", v3);
  }
}

- (void)removeDisplayService
{
  IONotificationPort *boostFactorNotificationPort;
  io_object_t boostFactorNotification;

  boostFactorNotificationPort = self->_boostFactorNotificationPort;
  if (boostFactorNotificationPort)
  {
    IONotificationPortDestroy(boostFactorNotificationPort);
    self->_boostFactorNotificationPort = 0;
  }
  boostFactorNotification = self->_boostFactorNotification;
  if (boostFactorNotification)
  {
    IOObjectRelease(boostFactorNotification);
    self->_boostFactorNotification = 0;
  }
  self->super._displayService = 0;
  self->_nitsBoostFactor = 1.0;
}

- (void)addDisplayService:(unsigned int)a3
{
  IONotificationPort *v4;
  NSObject *queue;

  self->super._displayService = a3;
  v4 = IONotificationPortCreate(*MEMORY[0x24BDD8B20]);
  self->_boostFactorNotificationPort = v4;
  if (v4)
  {
    queue = self->super._queue;
    if (queue)
    {
      IONotificationPortSetDispatchQueue(v4, queue);
      IOServiceAddInterestNotification(self->_boostFactorNotificationPort, self->super._displayService, "IOGeneralInterest", (IOServiceInterestCallback)BoostFactorUpdateNotificationCallback, self, &self->_boostFactorNotification);
      -[BCHIDBrtControl refreshBoostFactor](self, "refreshBoostFactor");
    }
  }
}

- (void)setBoostFactor:(float)a3
{
  float *p_nitsBoostFactor;
  OS_os_log *inited;
  NSObject *v6;

  p_nitsBoostFactor = &self->_nitsBoostFactor;
  self->_nitsBoostFactor = a3;
  if (-[BCBrtControl logHandle](self, "logHandle"))
  {
    inited = -[BCBrtControl logHandle](self, "logHandle");
LABEL_3:
    v6 = inited;
    goto LABEL_5;
  }
  v6 = _COREBRIGHTNESS_LOG_DEFAULT;
  if (!_COREBRIGHTNESS_LOG_DEFAULT)
  {
    inited = (OS_os_log *)init_default_corebrightness_log();
    goto LABEL_3;
  }
LABEL_5:
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BCHIDBrtControl setBoostFactor:].cold.1(p_nitsBoostFactor, v6);
  -[BCHIDBrtControl _setDeviceNits:](self, "_setDeviceNits:", self->_nits);
}

- (void)refreshBoostFactor
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_229A2F000, a2, OS_LOG_TYPE_ERROR, "error: invalid boost factor retrieved from IOMFB (%@)", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_5();
}

- (float)boostFactorFromIOFixed:(int)a3
{
  return (float)a3 * 0.000015259;
}

+ (void)newMonitorWithHandler:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_229A2F000, a2, a3, "Unable to setup IO notifications (error = %d)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithService:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_229A2F000, v0, v1, "Invalid service", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithService:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_229A2F000, v0, v1, "failed to create HID brightness device", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithService:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_229A2F000, v0, v1, "error: can't find brightness element - abort", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithService:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_229A2F000, v0, v1, "error: failed to retrieve current nits - defaulting to 150 nits", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithService:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_229A2F000, v0, v1, "Invalid queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithService:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_229A2F000, v0, v1, "missing container ID. Defaulting to nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithService:(uint64_t)a3 .cold.7(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_229A2F000, a2, a3, "failed to retrieve registry ID for brightness service (%u)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __34__BCHIDBrtControl__setDeviceNits___block_invoke_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 152);
  v4 = *a2;
  v5 = 134218242;
  v6 = v3;
  v7 = 2114;
  v8 = v4;
  _os_log_error_impl(&dword_229A2F000, log, OS_LOG_TYPE_ERROR, "failed to set %f nits (%{public}@)", (uint8_t *)&v5, 0x16u);
  OUTLINED_FUNCTION_5();
}

- (void)setBoostFactor:(float *)a1 .cold.1(float *a1, NSObject *a2)
{
  double v2;
  int v3;
  double v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 134217984;
  v4 = v2;
  _os_log_debug_impl(&dword_229A2F000, a2, OS_LOG_TYPE_DEBUG, "updated boost factor: %f", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_5();
}

@end
