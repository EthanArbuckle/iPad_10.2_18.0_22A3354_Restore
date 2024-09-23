@implementation ACCFeaturePluginHIDDescriptor

- (ACCFeaturePluginHIDDescriptor)initWithDecriptorInfo:(id)a3 sendOutReport:(id)a4 sendGetReport:(id)a5 sendComponentUpdate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BOOL v14;
  id v15;
  NSObject *v16;
  ACCFeaturePluginHIDDescriptor *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  const __CFString *v71;
  void *v72;
  NSObject *v73;
  dispatch_queue_t v74;
  void *v75;
  dispatch_source_t v76;
  void *v77;
  NSObject *v78;
  ACCFeaturePluginHIDDescriptor *v79;
  uint64_t v80;
  dispatch_semaphore_t v81;
  OS_dispatch_semaphore *getReportSemaphore;
  uint64_t v83;
  id sendOutReport;
  uint64_t v85;
  id sendGetReport;
  uint64_t v87;
  void *sendComponentUpdate;
  NSObject *v89;
  id v90;
  id v91;
  _QWORD handler[4];
  ACCFeaturePluginHIDDescriptor *v94;
  objc_super v95;
  uint8_t buf[4];
  const char *v97;
  __int16 v98;
  id v99;
  uint64_t v100;

  v100 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (gLogObjects)
    v14 = gNumLogObjects < 1;
  else
    v14 = 1;
  if (v14)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCFeaturePluginHIDDescriptor initWithDecriptorInfo:sendOutReport:sendGetReport:sendComponentUpdate:].cold.2();
    v16 = MEMORY[0x24BDACB70];
    v15 = MEMORY[0x24BDACB70];
  }
  else
  {
    v16 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v97 = "-[ACCFeaturePluginHIDDescriptor initWithDecriptorInfo:sendOutReport:sendGetReport:sendComponentUpdate:]";
    v98 = 2112;
    v99 = v10;
    _os_log_impl(&dword_21A9A3000, v16, OS_LOG_TYPE_DEFAULT, "%s: descriptorInfo %@ ", buf, 0x16u);
  }

  v95.receiver = self;
  v95.super_class = (Class)ACCFeaturePluginHIDDescriptor;
  v17 = -[ACCFeaturePluginHIDDescriptor init](&v95, sel_init);
  if (v17)
  {
    v18 = (uint64_t)v17;
    v17->_isShuttingDown = 0;
    v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v20 = *(void **)(v18 + 104);
    *(_QWORD *)(v18 + 104) = v19;

    *(_BYTE *)(v18 + 10) = 0;
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "UUIDString");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(void **)(v18 + 24);
    *(_QWORD *)(v18 + 24) = v22;

    v24 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    if (v24)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKey:", v28, CFSTR("Transport"));

      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKey:", v32, CFSTR("VendorID"));

      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKey:", v36, CFSTR("ProductID"));

      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 3);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 3);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKey:", v40, CFSTR("VersionNumber"));

      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 4);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (v42)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 4);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKey:", v44, CFSTR("Manufacturer"));

      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 12);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (v46)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 12);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKey:", v48, CFSTR("Product"));

      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 6);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      if (v50)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 6);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKey:", v52, CFSTR("SerialNumber"));

      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 7);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      if (v54)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 7);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKey:", v56, CFSTR("CountryCode"));

      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 9);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      if (v58)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 9);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKey:", v60, CFSTR("ReportDescriptor"));

      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 10);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      if (v62)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 10);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKey:", v64, CFSTR("IAPHIDAccessoryCategory"));

      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 11);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      if (v66)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 11);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKey:", v68, CFSTR("Authenticated"));

      }
      objc_msgSend(v24, "setObject:forKey:", *(_QWORD *)(v18 + 24), CFSTR("PhysicalDeviceUniqueID"));
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 12);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v69);
      v70 = objc_claimAutoreleasedReturnValue();

      if (v70)
        v71 = (const __CFString *)v70;
      else
        v71 = &stru_24DD6B9B8;
      objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "appendFormat:", CFSTR("HIDDeviceQueue%@"), *(_QWORD *)(v18 + 24));
      v73 = objc_retainAutorelease(v72);
      v74 = dispatch_queue_create((const char *)-[NSObject UTF8String](v73, "UTF8String"), 0);
      v75 = *(void **)(v18 + 48);
      *(_QWORD *)(v18 + 48) = v74;

      v76 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *(dispatch_queue_t *)(v18 + 48));
      v77 = *(void **)(v18 + 64);
      *(_QWORD *)(v18 + 64) = v76;

      v78 = *(NSObject **)(v18 + 64);
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __103__ACCFeaturePluginHIDDescriptor_initWithDecriptorInfo_sendOutReport_sendGetReport_sendComponentUpdate___block_invoke;
      handler[3] = &unk_24DD6B6B8;
      v79 = (ACCFeaturePluginHIDDescriptor *)(id)v18;
      v94 = v79;
      dispatch_source_set_event_handler(v78, handler);
      dispatch_source_set_timer(*(dispatch_source_t *)(v18 + 64), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
      dispatch_resume(*(dispatch_object_t *)(v18 + 64));
      -[ACCFeaturePluginHIDDescriptor startHIDEventSystemListener:](v79, "startHIDEventSystemListener:", *(_QWORD *)(v18 + 24));
      v80 = IOHIDUserDeviceCreate();
      v79->_deviceRef = (__IOHIDUserDevice *)v80;
      if (v80)
      {
        IOHIDUserDeviceScheduleWithDispatchQueue();
        IOHIDUserDeviceRegisterGetReportCallback();
        IOHIDUserDeviceRegisterSetReportCallback();
        v81 = dispatch_semaphore_create(0);
        getReportSemaphore = v79->_getReportSemaphore;
        v79->_getReportSemaphore = (OS_dispatch_semaphore *)v81;

        v83 = MEMORY[0x22074D47C](v11);
        sendOutReport = v79->_sendOutReport;
        v79->_sendOutReport = (id)v83;

        v85 = MEMORY[0x22074D47C](v12);
        sendGetReport = v79->_sendGetReport;
        v79->_sendGetReport = (id)v85;

        v87 = MEMORY[0x22074D47C](v13);
        sendComponentUpdate = v79->_sendComponentUpdate;
        v79->_sendComponentUpdate = (id)v87;
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v89 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCFeaturePluginHIDDescriptor initWithDecriptorInfo:sendOutReport:sendGetReport:sendComponentUpdate:].cold.2();
          v89 = MEMORY[0x24BDACB70];
          v91 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
          -[ACCFeaturePluginHIDDescriptor initWithDecriptorInfo:sendOutReport:sendGetReport:sendComponentUpdate:].cold.3();

        sendComponentUpdate = v79;
        v79 = 0;
      }

      v18 = v70;
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v73 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCFeaturePluginHIDDescriptor initWithDecriptorInfo:sendOutReport:sendGetReport:sendComponentUpdate:].cold.2();
        v73 = MEMORY[0x24BDACB70];
        v90 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        -[ACCFeaturePluginHIDDescriptor initWithDecriptorInfo:sendOutReport:sendGetReport:sendComponentUpdate:].cold.1();
      v79 = 0;
    }

  }
  else
  {
    v79 = 0;
  }

  return v79;
}

_BYTE *__103__ACCFeaturePluginHIDDescriptor_initWithDecriptorInfo_sendOutReport_sendGetReport_sendComponentUpdate___block_invoke(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  _BYTE *result;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v2 = gNumLogObjects < 1;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCFeaturePluginHIDDescriptor initWithDecriptorInfo:sendOutReport:sendGetReport:sendComponentUpdate:].cold.2();
    v4 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_21A9A3000, v4, OS_LOG_TYPE_DEFAULT, "registerDeviceMatchingTimer fired! %@ call handleHIDComponentUpdate true", (uint8_t *)&v7, 0xCu);
  }

  result = *(_BYTE **)(a1 + 32);
  if (!result[8])
    return (_BYTE *)objc_msgSend(result, "handleHIDComponentUpdate:", 1);
  return result;
}

- (void)removeDescriptor
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21A9A3000, v0, v1, "ERROR: _hidEventSystemClientRef not NULL after CFReleaseSafe", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ACCFeaturePluginHIDDescriptor;
  -[ACCFeaturePluginHIDDescriptor dealloc](&v2, sel_dealloc);
}

- (void)startHIDEventSystemListener:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  NSString *hidDeviceUUIDStr;
  NSObject *registerDeviceMatchingTimerSource;
  dispatch_time_t v11;
  int v12;
  NSString *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!self->_hidEventSystemClientRef)
  {
    v14 = CFSTR("PhysicalDeviceUniqueID");
    v15[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_hidEventSystemClientRef = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate();
    IOHIDEventSystemClientScheduleWithDispatchQueue();
    IOHIDEventSystemClientSetMatching();
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCFeaturePluginHIDDescriptor initWithDecriptorInfo:sendOutReport:sendGetReport:sendComponentUpdate:].cold.2();
      v7 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      hidDeviceUUIDStr = self->_hidDeviceUUIDStr;
      v12 = 138412290;
      v13 = hidDeviceUUIDStr;
      _os_log_impl(&dword_21A9A3000, v7, OS_LOG_TYPE_DEFAULT, "start registerDeviceMatchingTimer, %@", (uint8_t *)&v12, 0xCu);
    }

    registerDeviceMatchingTimerSource = self->_registerDeviceMatchingTimerSource;
    v11 = dispatch_time(0, 2000000000);
    dispatch_source_set_timer(registerDeviceMatchingTimerSource, v11, 0xFFFFFFFFFFFFFFFFLL, 0);
    IOHIDEventSystemClientRegisterDeviceMatchingCallback();

  }
}

- (BOOL)handleInReport:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  NSObject *v8;
  NSMutableArray *initialReportCache;
  BOOL v10;
  id v11;
  BOOL v12;
  id v13;
  NSObject *v14;

  v4 = a3;
  if (!self->_isReady)
  {
    initialReportCache = self->_initialReportCache;
    if (initialReportCache)
    {
      -[NSMutableArray addObject:](initialReportCache, "addObject:", v4);
    }
    else
    {
      if (gLogObjects)
        v12 = gNumLogObjects < 1;
      else
        v12 = 1;
      if (v12)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCFeaturePluginHIDDescriptor initWithDecriptorInfo:sendOutReport:sendGetReport:sendComponentUpdate:].cold.2();
        v14 = MEMORY[0x24BDACB70];
        v13 = MEMORY[0x24BDACB70];
      }
      else
      {
        v14 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[ACCFeaturePluginHIDDescriptor handleInReport:].cold.1();

    }
    goto LABEL_26;
  }
  -[ACCFeaturePluginHIDDescriptor deviceRef](self, "deviceRef");
  v5 = objc_retainAutorelease(v4);
  objc_msgSend(v5, "bytes");
  objc_msgSend(v5, "length");
  v6 = IOHIDUserDeviceHandleReport();
  if (v6)
  {
    v7 = v6;
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v8 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCFeaturePluginHIDDescriptor initWithDecriptorInfo:sendOutReport:sendGetReport:sendComponentUpdate:].cold.2();
      v8 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ACCFeaturePluginHIDDescriptor handleInReport:].cold.3(v7, v8);

LABEL_26:
    v10 = 0;
    goto LABEL_27;
  }
  v10 = 1;
LABEL_27:

  return v10;
}

- (BOOL)handleOutReport:(id)a3
{
  id v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;

  if (a3)
  {
    v5 = a3;
    -[ACCFeaturePluginHIDDescriptor sendOutReport](self, "sendOutReport");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[ACCFeaturePluginHIDDescriptor hidDeviceUUIDStr](self, "hidDeviceUUIDStr");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, id))v6)[2](v6, v7, v5);

  }
  return a3 != 0;
}

- (BOOL)handleGetReport:(int)a3 reportID:(unsigned __int8)a4 report:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  dispatch_time_t v13;
  NSObject *v14;
  intptr_t v15;
  BOOL v16;
  void *v17;
  id v18;

  v5 = a4;
  v6 = *(_QWORD *)&a3;
  v8 = a5;
  -[ACCFeaturePluginHIDDescriptor setGetReportResult:](self, "setGetReportResult:", 3758097084);
  -[ACCFeaturePluginHIDDescriptor setGetReportType:](self, "setGetReportType:", v6);
  -[ACCFeaturePluginHIDDescriptor setGetReportID:](self, "setGetReportID:", v5);
  -[ACCFeaturePluginHIDDescriptor setGetReportBuffer:](self, "setGetReportBuffer:", v8);
  -[ACCFeaturePluginHIDDescriptor sendGetReport](self, "sendGetReport");
  v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[ACCFeaturePluginHIDDescriptor hidDeviceUUIDStr](self, "hidDeviceUUIDStr");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, void *, void *))v9)[2](v9, v10, v11, v12);

  v13 = dispatch_time(0, 1000000000);
  -[ACCFeaturePluginHIDDescriptor getReportSemaphore](self, "getReportSemaphore");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = dispatch_semaphore_wait(v14, v13);

  v16 = 0;
  if (!-[ACCFeaturePluginHIDDescriptor isShuttingDown](self, "isShuttingDown") && !v15)
  {
    if (-[ACCFeaturePluginHIDDescriptor getReportResult](self, "getReportResult"))
    {
      v16 = 0;
    }
    else
    {
      -[ACCFeaturePluginHIDDescriptor getReportBuffer](self, "getReportBuffer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_retainAutorelease(v8);
      objc_msgSend(v17, "getBytes:length:", objc_msgSend(v18, "bytes"), objc_msgSend(v18, "length"));

      v16 = 1;
    }
  }
  -[ACCFeaturePluginHIDDescriptor setGetReportType:](self, "setGetReportType:", 3);
  -[ACCFeaturePluginHIDDescriptor setGetReportID:](self, "setGetReportID:", 0);
  -[ACCFeaturePluginHIDDescriptor setGetReportBuffer:](self, "setGetReportBuffer:", 0);

  return v16;
}

- (BOOL)handleGetReportResponse:(unsigned __int8)a3 reportID:(unsigned __int8)a4 report:(id)a5
{
  int v5;
  int v6;
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  size_t v13;
  id v14;
  void *v15;
  NSObject *v16;
  BOOL v17;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  if (-[ACCFeaturePluginHIDDescriptor getReportType](self, "getReportType") == v6
    && -[ACCFeaturePluginHIDDescriptor getReportID](self, "getReportID") == v5
    && (-[ACCFeaturePluginHIDDescriptor getReportBuffer](self, "getReportBuffer"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    -[ACCFeaturePluginHIDDescriptor setGetReportResult:](self, "setGetReportResult:", 0);
    -[ACCFeaturePluginHIDDescriptor getReportBuffer](self, "getReportBuffer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    v12 = objc_msgSend(v8, "length");
    if (v11 >= v12)
      v13 = v12;
    else
      v13 = v11;
    -[ACCFeaturePluginHIDDescriptor getReportBuffer](self, "getReportBuffer");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    memcpy((void *)objc_msgSend(v14, "mutableBytes"), (const void *)objc_msgSend(objc_retainAutorelease(v8), "bytes"), v13);

    -[ACCFeaturePluginHIDDescriptor getReportBuffer](self, "getReportBuffer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setLength:", v13);

    -[ACCFeaturePluginHIDDescriptor getReportSemaphore](self, "getReportSemaphore");
    v16 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v16);

    v17 = 1;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)handleHIDComponentUpdate:(BOOL)a3
{
  _BOOL8 v3;
  BOOL v5;
  id v6;
  NSObject *v7;
  NSString *hidDeviceUUIDStr;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  uint64_t v11;
  BOOL v12;
  int v13;
  NSObject *v14;
  NSMutableArray *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  uint64_t v33;
  uint64_t v34;

  v3 = a3;
  v34 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCFeaturePluginHIDDescriptor initWithDecriptorInfo:sendOutReport:sendGetReport:sendComponentUpdate:].cold.2();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    hidDeviceUUIDStr = self->_hidDeviceUUIDStr;
    *(_DWORD *)buf = 138412290;
    v33 = (uint64_t)hidDeviceUUIDStr;
    _os_log_impl(&dword_21A9A3000, v7, OS_LOG_TYPE_DEFAULT, "stop registerDeviceMatchingTimer, %@", buf, 0xCu);
  }

  dispatch_source_set_timer((dispatch_source_t)self->_registerDeviceMatchingTimerSource, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  -[ACCFeaturePluginHIDDescriptor sendComponentUpdate](self, "sendComponentUpdate");
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[ACCFeaturePluginHIDDescriptor hidDeviceUUIDStr](self, "hidDeviceUUIDStr");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, _BOOL8))v9)[2](v9, v10, v3);

  self->_isReady = v3;
  if (!v3)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v15 = (NSMutableArray *)*(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCFeaturePluginHIDDescriptor initWithDecriptorInfo:sendOutReport:sendGetReport:sendComponentUpdate:].cold.2();
      v15 = (NSMutableArray *)MEMORY[0x24BDACB70];
      v16 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(&v15->super.super, OS_LOG_TYPE_DEFAULT))
    {
      v17 = -[NSMutableArray count](self->_initialReportCache, "count");
      *(_DWORD *)buf = 134217984;
      v33 = v17;
      _os_log_impl(&dword_21A9A3000, &v15->super.super, OS_LOG_TYPE_DEFAULT, "handleHIDComponentUpdate: not ready, remove %lu cached reports.", buf, 0xCu);
    }
    goto LABEL_43;
  }
  v11 = -[NSMutableArray count](self->_initialReportCache, "count");
  if (gLogObjects)
    v12 = gNumLogObjects <= 0;
  else
    v12 = 1;
  v13 = !v12;
  if (v11)
  {
    if (v13)
    {
      v14 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCFeaturePluginHIDDescriptor initWithDecriptorInfo:sendOutReport:sendGetReport:sendComponentUpdate:].cold.2();
      v14 = MEMORY[0x24BDACB70];
      v19 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v20 = -[NSMutableArray count](self->_initialReportCache, "count");
      *(_DWORD *)buf = 134217984;
      v33 = v20;
      _os_log_impl(&dword_21A9A3000, v14, OS_LOG_TYPE_DEFAULT, "handleHIDComponentUpdate: ready, handle %lu cached reports.", buf, 0xCu);
    }

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v15 = self->_initialReportCache;
    v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v28 != v23)
            objc_enumerationMutation(v15);
          -[ACCFeaturePluginHIDDescriptor handleInReport:](self, "handleInReport:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i), (_QWORD)v27);
        }
        v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v22);
    }
LABEL_43:

    -[NSMutableArray removeAllObjects](self->_initialReportCache, "removeAllObjects");
    return 1;
  }
  if (v13)
  {
    v18 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCFeaturePluginHIDDescriptor initWithDecriptorInfo:sendOutReport:sendGetReport:sendComponentUpdate:].cold.2();
    v18 = MEMORY[0x24BDACB70];
    v26 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A9A3000, v18, OS_LOG_TYPE_DEFAULT, "handleHIDComponentUpdate: ready, no cached reports.", buf, 2u);
  }

  return 1;
}

- (BOOL)isShuttingDown
{
  return self->_isShuttingDown;
}

- (void)setIsShuttingDown:(BOOL)a3
{
  self->_isShuttingDown = a3;
}

- (NSString)hidDeviceUUIDStr
{
  return self->_hidDeviceUUIDStr;
}

- (unsigned)getReportID
{
  return self->_getReportID;
}

- (void)setGetReportID:(unsigned __int8)a3
{
  self->_getReportID = a3;
}

- (int)getReportType
{
  return self->_getReportType;
}

- (void)setGetReportType:(int)a3
{
  self->_getReportType = a3;
}

- (NSMutableData)getReportBuffer
{
  return self->_getReportBuffer;
}

- (void)setGetReportBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_getReportBuffer, a3);
}

- (int)getReportResult
{
  return self->_getReportResult;
}

- (void)setGetReportResult:(int)a3
{
  self->_getReportResult = a3;
}

- (__IOHIDUserDevice)deviceRef
{
  return self->_deviceRef;
}

- (void)setDeviceRef:(__IOHIDUserDevice *)a3
{
  self->_deviceRef = a3;
}

- (OS_dispatch_queue)hidCallbackQueue
{
  return self->_hidCallbackQueue;
}

- (void)setHidCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_hidCallbackQueue, a3);
}

- (OS_dispatch_semaphore)getReportSemaphore
{
  return self->_getReportSemaphore;
}

- (void)setGetReportSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_getReportSemaphore, a3);
}

- (OS_dispatch_source)registerDeviceMatchingTimerSource
{
  return self->_registerDeviceMatchingTimerSource;
}

- (void)setRegisterDeviceMatchingTimerSource:(id)a3
{
  objc_storeStrong((id *)&self->_registerDeviceMatchingTimerSource, a3);
}

- (id)sendOutReport
{
  return self->_sendOutReport;
}

- (void)setSendOutReport:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)sendGetReport
{
  return self->_sendGetReport;
}

- (void)setSendGetReport:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)sendComponentUpdate
{
  return self->_sendComponentUpdate;
}

- (void)setSendComponentUpdate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (__IOHIDEventSystemClient)hidEventSystemClientRef
{
  return self->_hidEventSystemClientRef;
}

- (void)setHidEventSystemClientRef:(__IOHIDEventSystemClient *)a3
{
  self->_hidEventSystemClientRef = a3;
}

- (BOOL)isReady
{
  return self->_isReady;
}

- (void)setIsReady:(BOOL)a3
{
  self->_isReady = a3;
}

- (NSMutableArray)initialReportCache
{
  return self->_initialReportCache;
}

- (void)setInitialReportCache:(id)a3
{
  objc_storeStrong((id *)&self->_initialReportCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialReportCache, 0);
  objc_storeStrong(&self->_sendComponentUpdate, 0);
  objc_storeStrong(&self->_sendGetReport, 0);
  objc_storeStrong(&self->_sendOutReport, 0);
  objc_storeStrong((id *)&self->_registerDeviceMatchingTimerSource, 0);
  objc_storeStrong((id *)&self->_getReportSemaphore, 0);
  objc_storeStrong((id *)&self->_hidCallbackQueue, 0);
  objc_storeStrong((id *)&self->_getReportBuffer, 0);
  objc_storeStrong((id *)&self->_hidDeviceUUIDStr, 0);
}

- (void)initWithDecriptorInfo:sendOutReport:sendGetReport:sendComponentUpdate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21A9A3000, v0, v1, "IOHIDUserDeviceCreate failed to create hidProperties dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)initWithDecriptorInfo:sendOutReport:sendGetReport:sendComponentUpdate:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21A9A3000, MEMORY[0x24BDACB70], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)initWithDecriptorInfo:sendOutReport:sendGetReport:sendComponentUpdate:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21A9A3000, v0, v1, "IOHIDUserDeviceCreate failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)handleInReport:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21A9A3000, v0, v1, "handling HID report failed, not ready and no cache.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)handleInReport:(int)a1 .cold.3(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21A9A3000, a2, OS_LOG_TYPE_ERROR, "handling HID report failed 0x%x.", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_4();
}

@end
