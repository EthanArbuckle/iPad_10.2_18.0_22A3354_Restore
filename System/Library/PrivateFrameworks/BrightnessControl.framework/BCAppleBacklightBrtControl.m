@implementation BCAppleBacklightBrtControl

- (BOOL)setNits:(double)a3 error:(id *)a4
{
  OS_dispatch_queue *v7;
  BOOL v8;
  _QWORD v10[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  if (self->_isDFR || self->_override)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 1;
    v7 = -[BCBrtControl queue](self, "queue");
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __44__BCAppleBacklightBrtControl_setNits_error___block_invoke;
    v10[3] = &unk_24F2A7110;
    v10[5] = &v11;
    v10[6] = a4;
    v10[4] = self;
    *(double *)&v10[7] = a3;
    dispatch_sync((dispatch_queue_t)v7, v10);
    v8 = *((_BYTE *)v12 + 24) != 0;
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v8 = 0;
    if (a4)
      *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithBCError:", 16);
  }
  return v8;
}

+ (id)newMonitorWithHandler:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  NSObject *v8;
  IONotificationPort *v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *inited;
  BCBrtMonitor *v16;
  _QWORD v18[5];
  io_iterator_t v19;
  _QWORD v20[2];
  __n128 (*v21)(uint64_t);
  void *v22;
  NSObject *v23;
  void *v24;
  IONotificationPort *v25;
  _QWORD *v26;
  _QWORD v27[5];
  io_iterator_t notification;

  v6 = (void *)MEMORY[0x22E2D4EA4](a1, a2);
  v7 = &unk_24F2A8FE8;
  objc_autoreleasePoolPop(v6);
  v8 = dispatch_queue_create("com.apple.BCAppleBacklightBrtControl.global", 0);
  v9 = IONotificationPortCreate(*MEMORY[0x24BDD8B20]);
  IONotificationPortSetDispatchQueue(v9, v8);
  if (a3)
    v10 = _Block_copy(a3);
  else
    v10 = 0;
  v11 = MEMORY[0x24BDAC760];
  notification = 0;
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __58__BCAppleBacklightBrtControl_newMonitorWithHandler_error___block_invoke;
  v27[3] = &unk_24F2A7050;
  v27[4] = v10;
  v12 = _newBlockWrapper(v27);
  v20[0] = v11;
  v20[1] = 3221225472;
  v21 = __58__BCAppleBacklightBrtControl_newMonitorWithHandler_error___block_invoke_2;
  v22 = &unk_24F2A7078;
  v25 = v9;
  v26 = v12;
  v23 = v8;
  v24 = v10;
  v13 = IOServiceAddMatchingNotification(v9, "IOServiceFirstMatch", (CFDictionaryRef)&unk_24F2A8FE8, (IOServiceMatchingCallback)_iokitCallback, v12, &notification);
  if (!(_DWORD)v13)
  {
    v18[0] = v11;
    v18[1] = 3221225472;
    v18[2] = __58__BCAppleBacklightBrtControl_newMonitorWithHandler_error___block_invoke_6;
    v18[3] = &__block_descriptor_44_e5_v8__0l;
    v18[4] = v12;
    v19 = notification;
    dispatch_async(v8, v18);
    v16 = objc_alloc_init(BCBrtMonitor);
    -[BCBrtMonitor setCancelHandler:](v16, "setCancelHandler:", v20);
    return v16;
  }
  v14 = v13;
  inited = _COREBRIGHTNESS_LOG_DEFAULT;
  if (!_COREBRIGHTNESS_LOG_DEFAULT)
    inited = init_default_corebrightness_log();
  if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
  {
    +[BCAppleBacklightBrtControl newMonitorWithHandler:error:].cold.1();
    if (!a4)
      goto LABEL_10;
    goto LABEL_9;
  }
  if (a4)
LABEL_9:
    *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithIOKitError:", v14);
LABEL_10:
  v21((uint64_t)v20);
  return 0;
}

uint64_t __58__BCAppleBacklightBrtControl_newMonitorWithHandler_error___block_invoke(uint64_t a1, io_iterator_t iterator)
{
  uint64_t result;
  uint64_t v5;
  NSObject *inited;
  BCAppleBacklightBrtControl *v7;
  uint64_t v8;
  uint8_t buf[4];
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    v5 = result;
    do
    {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT)
        inited = init_default_corebrightness_log();
      if (os_log_type_enabled(inited, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v10 = v5;
        _os_log_impl(&dword_229A2F000, inited, OS_LOG_TYPE_DEFAULT, "BCAppleBacklightBrtControl: got back service %u", buf, 8u);
      }
      v7 = -[BCAppleBacklightBrtControl initWithService:]([BCAppleBacklightBrtControl alloc], "initWithService:", v5);
      v8 = *(_QWORD *)(a1 + 32);
      if (v8)
        (*(void (**)(uint64_t, BCAppleBacklightBrtControl *))(v8 + 16))(v8, v7);

      result = IOIteratorNext(iterator);
      v5 = result;
    }
    while ((_DWORD)result);
  }
  return result;
}

__n128 __58__BCAppleBacklightBrtControl_newMonitorWithHandler_error___block_invoke_2(uint64_t a1)
{
  __int128 v1;
  __n128 result;
  _QWORD v3[4];
  __int128 v4;
  __int128 v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __58__BCAppleBacklightBrtControl_newMonitorWithHandler_error___block_invoke_2;
  v3[3] = &unk_24F2A7078;
  v1 = *(_OWORD *)(a1 + 48);
  v4 = *(_OWORD *)(a1 + 32);
  v5 = v1;
  dispatch_async((dispatch_queue_t)v4, v3);
  return result;
}

void __58__BCAppleBacklightBrtControl_newMonitorWithHandler_error___block_invoke_2(uint64_t a1)
{
  NSObject *inited;
  uint8_t v3[16];

  inited = _COREBRIGHTNESS_LOG_DEFAULT;
  if (!_COREBRIGHTNESS_LOG_DEFAULT)
    inited = init_default_corebrightness_log();
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_229A2F000, inited, OS_LOG_TYPE_DEFAULT, "BCAppleBacklightBrtControl: cleaning up monitor", v3, 2u);
  }
  IONotificationPortDestroy(*(IONotificationPortRef *)(a1 + 48));
  _freeBlockWrapper(*(const void ***)(a1 + 56));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
  _Block_release(*(const void **)(a1 + 40));
}

uint64_t __58__BCAppleBacklightBrtControl_newMonitorWithHandler_error___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 32) + 16))(**(_QWORD **)(a1 + 32), *(unsigned int *)(a1 + 40));
}

- (id)copyModuleIdentifier
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", CFSTR("com.apple.BCBrtControl.AppleBacklight"));
}

- (BCAppleBacklightBrtControl)initWithService:(unsigned int)a3
{
  char *v4;
  const __CFAllocator *v5;
  void *CFProperty;
  id v7;
  os_log_t v8;
  NSObject *v9;
  os_log_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  double v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  id v38;
  NSObject *inited;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  void *v43;
  double v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  unint64_t v48;
  void *v49;
  void *v50;
  double v51;
  uint64_t i;
  double v53;
  float v54;
  NSObject *v55;
  double v56;
  float v57;
  NSObject *v58;
  double v59;
  NSObject *v60;
  float v61;
  double v62;
  NSObject *v63;
  float v64;
  void *v65;
  void *v66;
  uint64_t v67;
  NSObject *v68;
  uint64_t v69;
  NSObject *v70;
  uint64_t v71;
  NSObject *v72;
  uint64_t v73;
  NSObject *v74;
  void *v75;
  id v76;
  double v77;
  NSObject *v78;
  uint64_t v79;
  void *v80;
  id v81;
  double v82;
  NSObject *v83;
  uint64_t v84;
  os_log_t v85;
  NSObject *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  NSObject *v101;
  void *v102;
  id v103;
  double v104;
  void *v105;
  id v106;
  void *v107;
  id v108;
  double v109;
  void *v110;
  id v111;
  double v112;
  void *v113;
  id v114;
  double v115;
  void *v116;
  id v117;
  os_log_t v118;
  NSObject *v119;
  uint64_t v120;
  IONotificationPort *v121;
  IONotificationPort *v122;
  void *v123;
  id v124;
  os_log_t v125;
  NSObject *v126;
  void *context;
  _QWORD v129[5];
  int v130;
  int v131;
  void *v132;
  objc_super v133;
  _BYTE buf[24];
  void (*v135)(uint64_t, uint64_t);
  void (*v136)(uint64_t);
  char *v137;
  uint64_t v138;

  v138 = *MEMORY[0x24BDAC8D0];
  v133.receiver = self;
  v133.super_class = (Class)BCAppleBacklightBrtControl;
  v4 = -[BCBrtControl init](&v133, sel_init);
  if (v4)
  {
    context = (void *)MEMORY[0x22E2D4EA4]();
    *((_DWORD *)v4 + 29) = a3;
    if (a3)
    {
      v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, CFSTR("IODisplayParameters"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
      v7 = CFProperty;
      if (objc_msgSend(v4, "logHandle"))
      {
        v8 = (os_log_t)objc_msgSend(v4, "logHandle");
      }
      else
      {
        v9 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (_COREBRIGHTNESS_LOG_DEFAULT)
        {
LABEL_10:
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = CFProperty;
            _os_log_impl(&dword_229A2F000, v9, OS_LOG_TYPE_DEFAULT, "driver params = %{public}@", buf, 0xCu);
          }
          if (CFProperty)
          {
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(CFProperty, "objectForKeyedSubscript:", CFSTR("brightness")), "objectForKeyedSubscript:", CFSTR("min")), "doubleValue");
            *((_QWORD *)v4 + 15) = v12;
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(CFProperty, "objectForKeyedSubscript:", CFSTR("brightness")), "objectForKeyedSubscript:", CFSTR("max")), "doubleValue");
            *((_QWORD *)v4 + 16) = v13;
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(CFProperty, "objectForKeyedSubscript:", CFSTR("BrightnessMilliNits")), "objectForKeyedSubscript:", CFSTR("min")), "doubleValue");
            *((double *)v4 + 8) = v14 / 1000.0;
            *((_QWORD *)v4 + 7) = 0;
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(CFProperty, "objectForKeyedSubscript:", CFSTR("BrightnessMilliNits")), "objectForKeyedSubscript:", CFSTR("max")), "doubleValue");
            *((double *)v4 + 6) = v15 / 1000.0;
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(CFProperty, "objectForKeyedSubscript:", CFSTR("BrightnessMicroAmps")), "objectForKeyedSubscript:", CFSTR("min")), "doubleValue");
            *((double *)v4 + 17) = v16 * 1000.0;
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(CFProperty, "objectForKeyedSubscript:", CFSTR("BrightnessMicroAmps")), "objectForKeyedSubscript:", CFSTR("max")), "doubleValue");
            *((double *)v4 + 18) = v17 * 1000.0;
            if (*((double *)v4 + 16) < *((double *)v4 + 15))
              -[BCAppleBacklightBrtControl initWithService:].cold.3();
            if (*((double *)v4 + 6) < *((double *)v4 + 8))
              -[BCAppleBacklightBrtControl initWithService:].cold.4();
            v4[32] = 1;
            v18 = (void *)IORegistryEntrySearchCFProperty(*((_DWORD *)v4 + 29), "IOService", CFSTR("dfr-brightness-control"), v5, 3u);
            v19 = v18;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v18, "getBytes:length:", v4 + 160, 1);
              if (v4[160])
                v20 = MEMORY[0x24BDBD1C8];
              else
                v20 = MEMORY[0x24BDBD1C0];
              objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", v20, CFSTR("DFR"));
            }
            v21 = (void *)IORegistryEntrySearchCFProperty(*((_DWORD *)v4 + 29), "IOService", CFSTR("dcp-brightness-node"), v5, 3u);
            v22 = v21;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v21, "getBytes:length:", v4 + 161, 1);
              if (v4[161])
                v23 = MEMORY[0x24BDBD1C8];
              else
                v23 = MEMORY[0x24BDBD1C0];
              objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", v23, CFSTR("DCP"));
            }
            if (!v4[160])
            {
              v24 = (void *)IORegistryEntrySearchCFProperty(*((_DWORD *)v4 + 29), "IOService", CFSTR("energy-saving"), v5, 3u);
              v25 = v24;
              v4[163] = 1;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(v24, "getBytes:length:", v4 + 163, 1);
              if (v4[163])
                v26 = MEMORY[0x24BDBD1C8];
              else
                v26 = MEMORY[0x24BDBD1C0];
              objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", v26, CFSTR("BatterySavingFeatures"));
            }
            v27 = (void *)IORegistryEntrySearchCFProperty(*((_DWORD *)v4 + 29), "IOService", CFSTR("thermal-mitigation"), v5, 3u);
            v28 = v27;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v27, "getBytes:length:", v4 + 168, 8);
              objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *((_QWORD *)v4 + 21)), CFSTR("ThermalMitigation"));
              v29 = (void *)IORegistryEntrySearchCFProperty(*((_DWORD *)v4 + 29), "IOService", CFSTR("thermal-mitigation-min-cap"), v5, 3u);
              v30 = v29;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                *(_DWORD *)buf = 0;
                if ((unint64_t)objc_msgSend(v29, "length") >= 4)
                {
                  objc_msgSend(v29, "getBytes:length:", buf, 4);
                  *(float *)&v31 = (float)*(int *)buf * 0.000015259;
                  objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v31), CFSTR("ThermalMitigationMinCap"));
                }
              }
            }
            v32 = (void *)IORegistryEntrySearchCFProperty(*((_DWORD *)v4 + 29), "IOService", CFSTR("force-brightness-control"), v5, 3u);
            v33 = v32;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v32, "getBytes:length:", v4 + 162, 1);
            v34 = (void *)IORegistryEntrySearchCFProperty(*((_DWORD *)v4 + 29), "IOService", CFSTR("backlight-marketing-table-force"), v5, 3u);
            v35 = v34;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              buf[0] = 0;
              objc_msgSend(v34, "getBytes:length:", buf, 1);
              if (buf[0])
                v36 = MEMORY[0x24BDBD1C8];
              else
                v36 = MEMORY[0x24BDBD1C0];
              objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", v36, CFSTR("NitsToUserBrightnessTableForce"));
            }
            v37 = (void *)IORegistryEntrySearchCFProperty(*((_DWORD *)v4 + 29), "IOService", CFSTR("backlight-marketing-table"), v5, 3u);
            v38 = v37;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              inited = *((_QWORD *)v4 + 1);
              if (!inited)
              {
                inited = _COREBRIGHTNESS_LOG_DEFAULT;
                if (!_COREBRIGHTNESS_LOG_DEFAULT)
                  inited = init_default_corebrightness_log();
              }
              if (os_log_type_enabled(inited, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_229A2F000, inited, OS_LOG_TYPE_INFO, "slider mapping retrieved from the backlight driver", buf, 2u);
              }
              v40 = objc_msgSend(v37, "length");
              if (v40 >= 4)
              {
                v41 = objc_msgSend(v37, "bytes");
                if (v41)
                {
                  v42 = v40 >> 2;
                  v43 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v40 >> 2);
                  v45 = 0;
                  if (v42 <= 1)
                    v42 = 1;
                  do
                  {
                    *(float *)&v44 = (float)*(int *)(v41 + 4 * v45) * 0.000015259;
                    objc_msgSend(v43, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v44), v45++);
                  }
                  while (v42 != v45);
                  v46 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v43);
                  if (v46)
                    objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", v46, CFSTR("NitsToUserBrightnessTable"));
                }
              }
            }
            if (!objc_msgSend(*((id *)v4 + 5), "objectForKeyedSubscript:", CFSTR("NitsToUserBrightnessTable")))
            {
              v47 = *((_QWORD *)v4 + 1);
              if (!v47)
              {
                v47 = _COREBRIGHTNESS_LOG_DEFAULT;
                if (!_COREBRIGHTNESS_LOG_DEFAULT)
                  v47 = init_default_corebrightness_log();
              }
              if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_229A2F000, v47, OS_LOG_TYPE_INFO, "artificial slider mapping", buf, 2u);
              }
              objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", (id)copyNitsToUserMapping(), CFSTR("NitsToUserBrightnessTable"));
            }
            v132 = 0;
            v48 = load_float_array_from_edt(*((_DWORD *)v4 + 29), CFSTR("pil-aab-curve"), &v132);
            v49 = v132;
            if (v132 && v48)
            {
              v50 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v48);
              for (i = 0; i != v48; ++i)
              {
                LODWORD(v51) = *((_DWORD *)v132 + i);
                objc_msgSend(v50, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v51), i);
              }
              objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v50), CFSTR("PILAABCurve"));
              v49 = v132;
            }
            free(v49);
            *(float *)&v53 = load_fixed_float_from_edt(*((_DWORD *)v4 + 29), CFSTR("EDRSecondsPerStopRapid"));
            v54 = *(float *)&v53;
            objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v53), CFSTR("EDRSecondsPerStopRapid"));
            v55 = *((_QWORD *)v4 + 1);
            if (!v55)
            {
              v55 = _COREBRIGHTNESS_LOG_DEFAULT;
              if (!_COREBRIGHTNESS_LOG_DEFAULT)
                v55 = init_default_corebrightness_log();
            }
            if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              *(double *)&buf[4] = v54;
              _os_log_impl(&dword_229A2F000, v55, OS_LOG_TYPE_INFO, "EDR APT seconds per stop default override to %f", buf, 0xCu);
            }
            *(float *)&v56 = load_fixed_float_from_edt(*((_DWORD *)v4 + 29), CFSTR("EDRSecondsPerStopDefault"));
            v57 = *(float *)&v56;
            objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v56), CFSTR("EDRSecondsPerStopDefault"));
            v58 = *((_QWORD *)v4 + 1);
            if (!v58)
            {
              v58 = _COREBRIGHTNESS_LOG_DEFAULT;
              if (!_COREBRIGHTNESS_LOG_DEFAULT)
                v58 = init_default_corebrightness_log();
            }
            if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              *(double *)&buf[4] = v57;
              _os_log_impl(&dword_229A2F000, v58, OS_LOG_TYPE_INFO, "EDR seconds per stop default override to %f", buf, 0xCu);
            }
            *(float *)&v59 = load_fixed_float_from_edt(*((_DWORD *)v4 + 29), CFSTR("EDRExitSecondsPerStop"));
            objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v59), CFSTR("EDRExitSecondsPerStop"));
            v60 = *((_QWORD *)v4 + 1);
            if (!v60)
            {
              v60 = _COREBRIGHTNESS_LOG_DEFAULT;
              if (!_COREBRIGHTNESS_LOG_DEFAULT)
                v60 = init_default_corebrightness_log();
            }
            if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
            {
              objc_msgSend((id)objc_msgSend(*((id *)v4 + 5), "objectForKeyedSubscript:", CFSTR("EDRExitSecondsPerStop")), "floatValue");
              *(_DWORD *)buf = 134217984;
              *(double *)&buf[4] = v61;
              _os_log_impl(&dword_229A2F000, v60, OS_LOG_TYPE_INFO, "EDR EXIT seconds per stop default override to %f", buf, 0xCu);
            }
            *(float *)&v62 = load_fixed_float_from_edt(*((_DWORD *)v4 + 29), CFSTR("EDRAuroraSecondsPerStop"));
            objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v62), CFSTR("EDRAuroraSecondsPerStop"));
            v63 = *((_QWORD *)v4 + 1);
            if (!v63)
            {
              v63 = _COREBRIGHTNESS_LOG_DEFAULT;
              if (!_COREBRIGHTNESS_LOG_DEFAULT)
                v63 = init_default_corebrightness_log();
            }
            if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
            {
              objc_msgSend((id)objc_msgSend(*((id *)v4 + 5), "objectForKeyedSubscript:", CFSTR("EDRAuroraSecondsPerStop")), "floatValue");
              *(_DWORD *)buf = 134217984;
              *(double *)&buf[4] = v64;
              _os_log_impl(&dword_229A2F000, v63, OS_LOG_TYPE_INFO, "EDR Aurora seconds per stop default override to %f", buf, 0xCu);
            }
            v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.CoreBrightness"));
            v66 = v65;
            if (v65)
            {
              objc_msgSend(v65, "synchronize");
              v67 = objc_msgSend(v66, "objectForKey:", CFSTR("EDRSecondsPerStopRapid"));
              if (v67)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", v67, CFSTR("EDRSecondsPerStopRapid"));
                  v68 = *((_QWORD *)v4 + 1);
                  if (!v68)
                  {
                    v68 = _COREBRIGHTNESS_LOG_DEFAULT;
                    if (!_COREBRIGHTNESS_LOG_DEFAULT)
                      v68 = init_default_corebrightness_log();
                  }
                  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(_QWORD *)&buf[4] = CFSTR("EDRSecondsPerStopDefault");
                    *(_WORD *)&buf[12] = 2112;
                    *(_QWORD *)&buf[14] = v67;
                    _os_log_impl(&dword_229A2F000, v68, OS_LOG_TYPE_DEFAULT, "EDR APT seconds per stop overrided in Defaults %@ = %@ \n", buf, 0x16u);
                  }
                }
              }
              v69 = objc_msgSend(v66, "objectForKey:", CFSTR("EDRSecondsPerStopDefault"));
              if (v69)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", v69, CFSTR("EDRSecondsPerStopDefault"));
                  v70 = *((_QWORD *)v4 + 1);
                  if (!v70)
                  {
                    v70 = _COREBRIGHTNESS_LOG_DEFAULT;
                    if (!_COREBRIGHTNESS_LOG_DEFAULT)
                      v70 = init_default_corebrightness_log();
                  }
                  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(_QWORD *)&buf[4] = CFSTR("EDRSecondsPerStopDefault");
                    *(_WORD *)&buf[12] = 2112;
                    *(_QWORD *)&buf[14] = v69;
                    _os_log_impl(&dword_229A2F000, v70, OS_LOG_TYPE_DEFAULT, "EDR seconds per stop overrided in Defaults %@ = %@ \n", buf, 0x16u);
                  }
                }
              }
              v71 = objc_msgSend(v66, "objectForKey:", CFSTR("EDRExitSecondsPerStop"));
              if (v71)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", v71, CFSTR("EDRExitSecondsPerStop"));
                  v72 = *((_QWORD *)v4 + 1);
                  if (!v72)
                  {
                    v72 = _COREBRIGHTNESS_LOG_DEFAULT;
                    if (!_COREBRIGHTNESS_LOG_DEFAULT)
                      v72 = init_default_corebrightness_log();
                  }
                  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(_QWORD *)&buf[4] = CFSTR("EDRExitSecondsPerStop");
                    *(_WORD *)&buf[12] = 2112;
                    *(_QWORD *)&buf[14] = v71;
                    _os_log_impl(&dword_229A2F000, v72, OS_LOG_TYPE_DEFAULT, "EDR EXIT seconds per stop overrided in Defaults %@ = %@ \n", buf, 0x16u);
                  }
                }
              }
              v73 = objc_msgSend(v66, "objectForKey:", CFSTR("EDRAuroraSecondsPerStop"));
              if (v73)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", v73, CFSTR("EDRAuroraSecondsPerStop"));
                  v74 = *((_QWORD *)v4 + 1);
                  if (!v74)
                  {
                    v74 = _COREBRIGHTNESS_LOG_DEFAULT;
                    if (!_COREBRIGHTNESS_LOG_DEFAULT)
                      v74 = init_default_corebrightness_log();
                  }
                  if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(_QWORD *)&buf[4] = CFSTR("EDRAuroraSecondsPerStop");
                    *(_WORD *)&buf[12] = 2112;
                    *(_QWORD *)&buf[14] = v73;
                    _os_log_impl(&dword_229A2F000, v74, OS_LOG_TYPE_DEFAULT, "EDR Aurora seconds per stop overrided in Defaults %@ = %@ \n", buf, 0x16u);
                  }
                }
              }

            }
            v75 = (void *)IORegistryEntrySearchCFProperty(*((_DWORD *)v4 + 29), "IOService", CFSTR("EDRPotentialHeadroom"), v5, 3u);
            v76 = v75;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && (v131 = 0, (unint64_t)objc_msgSend(v75, "length") >= 4))
            {
              objc_msgSend(v75, "getBytes:length:", &v131, 4);
              *(float *)&v77 = (float)v131 * 0.000015259;
              objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v77), CFSTR("EDRPotentialHeadroom"));
              v78 = *((_QWORD *)v4 + 1);
              if (!v78)
              {
                v78 = _COREBRIGHTNESS_LOG_DEFAULT;
                if (!_COREBRIGHTNESS_LOG_DEFAULT)
                  v78 = init_default_corebrightness_log();
              }
              if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
              {
                v79 = objc_msgSend(*((id *)v4 + 5), "objectForKeyedSubscript:", CFSTR("EDRPotentialHeadroom"));
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v79;
                _os_log_impl(&dword_229A2F000, v78, OS_LOG_TYPE_INFO, "EDR POTENTIAL headroom retrieved from brightness node (%@)", buf, 0xCu);
              }
              v80 = (void *)IORegistryEntrySearchCFProperty(*((_DWORD *)v4 + 29), "IOService", CFSTR("EDRReferenceHeadroom"), v5, 3u);
              v81 = v80;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && (v130 = 0, (unint64_t)objc_msgSend(v80, "length") >= 4))
              {
                objc_msgSend(v80, "getBytes:length:", &v130, 8);
                *(float *)&v82 = (float)v130 * 0.000015259;
                objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v82), CFSTR("EDRReferenceHeadroom"));
                v83 = *((_QWORD *)v4 + 1);
                if (!v83)
                {
                  v83 = _COREBRIGHTNESS_LOG_DEFAULT;
                  if (!_COREBRIGHTNESS_LOG_DEFAULT)
                    v83 = init_default_corebrightness_log();
                }
                if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
                {
                  v84 = objc_msgSend(*((id *)v4 + 5), "objectForKeyedSubscript:", CFSTR("EDRReferenceHeadroom"));
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)&buf[4] = v84;
                  _os_log_impl(&dword_229A2F000, v83, OS_LOG_TYPE_INFO, "EDR REFERENCE headroom retrieved from brightness node (%@)", buf, 0xCu);
                }
              }
              else
              {
                v101 = *((_QWORD *)v4 + 1);
                if (!v101)
                {
                  v101 = _COREBRIGHTNESS_LOG_DEFAULT;
                  if (!_COREBRIGHTNESS_LOG_DEFAULT)
                    v101 = init_default_corebrightness_log();
                }
                if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 134217984;
                  *(_QWORD *)&buf[4] = 0;
                  _os_log_impl(&dword_229A2F000, v101, OS_LOG_TYPE_INFO, "EDR REFERENCE headroom not found in brightness node - use default (%f)", buf, 0xCu);
                }
                objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", &unk_24F2A8F80, CFSTR("EDRReferenceHeadroom"));
              }
            }
            else
            {
              if (v4[160])
                goto LABEL_153;
              objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", &unk_24F2A8F90, CFSTR("EDRPotentialHeadroom"));
              objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", &unk_24F2A8F80, CFSTR("EDRReferenceHeadroom"));
            }
            if (!v4[160])
              objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("BuiltIn"));
LABEL_153:
            objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)v4 + 6)), CFSTR("MaxNits"));
            objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)v4 + 6)), CFSTR("MaxNitsPanel"));
            objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)v4 + 8)), CFSTR("MinNits"));
            objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "registryID")), CFSTR("RegistryID"));
            *((_QWORD *)v4 + 19) = *((_QWORD *)v4 + 6);
            v102 = (void *)IORegistryEntrySearchCFProperty(*((_DWORD *)v4 + 29), "IOService", CFSTR("edr-max-nits"), v5, 3u);
            v103 = v102;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              *(_DWORD *)buf = 0;
              objc_msgSend(v102, "getBytes:length:", buf, 4);
              v104 = (float)((float)*(int *)buf * 0.000015259);
              *((double *)v4 + 19) = v104;
            }
            else
            {
              v104 = *((double *)v4 + 19);
            }
            objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v104), CFSTR("MaxNitsEDR"));
            v105 = (void *)IORegistryEntrySearchCFProperty(*((_DWORD *)v4 + 29), "IOService", CFSTR("user-accessible-max-nits"), v5, 3u);
            v106 = v105;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              *(_DWORD *)buf = 0;
              objc_msgSend(v105, "getBytes:length:", buf, 4);
              *((double *)v4 + 6) = (float)((float)*(int *)buf * 0.000015259);
              objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:"), CFSTR("MaxNits"));
            }
            v107 = (void *)IORegistryEntrySearchCFProperty(*((_DWORD *)v4 + 29), "IOService", CFSTR("pcc-table"), v5, 3u);
            v108 = v107;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              *(_DWORD *)buf = 0;
              objc_msgSend(v107, "getBytes:length:", buf, 4);
              *(float *)&v109 = (float)*(int *)buf * 0.000015259;
              objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v109), CFSTR("PCCTable"));
            }
            v110 = (void *)IORegistryEntrySearchCFProperty(*((_DWORD *)v4 + 29), "IOService", CFSTR("pcc-ramp-time"), v5, 3u);
            v111 = v110;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              *(_DWORD *)buf = 0;
              objc_msgSend(v110, "getBytes:length:", buf, 4);
              *(float *)&v112 = (float)*(int *)buf * 0.000015259;
              objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v112), CFSTR("PCCRampTime"));
            }
            v113 = (void *)IORegistryEntrySearchCFProperty(*((_DWORD *)v4 + 29), "IOService", CFSTR("LmaxProduct"), v5, 3u);
            v114 = v113;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              *(_DWORD *)buf = 0;
              objc_msgSend(v113, "getBytes:length:", buf, 4);
              *(float *)&v115 = (float)*(int *)buf * 0.000015259;
              objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v115), CFSTR("LmaxProduct"));
            }
            objc_msgSend(v4, "parseAuroraCapabilities");
            v116 = (void *)IORegistryEntrySearchCFProperty(*((_DWORD *)v4 + 29), "IOService", CFSTR("supports-dynamic-pil"), v5, 3u);
            v117 = v116;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              buf[0] = 0;
              objc_msgSend(v116, "getBytes:length:", buf, 1);
              objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", buf[0]), CFSTR("DynamicPIL"));
            }
            if (objc_msgSend(v4, "logHandle"))
            {
              v118 = (os_log_t)objc_msgSend(v4, "logHandle");
            }
            else
            {
              v119 = _COREBRIGHTNESS_LOG_DEFAULT;
              if (_COREBRIGHTNESS_LOG_DEFAULT)
              {
LABEL_170:
                if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
                {
                  v120 = *((_QWORD *)v4 + 5);
                  *(_DWORD *)buf = 138543362;
                  *(_QWORD *)&buf[4] = v120;
                  _os_log_impl(&dword_229A2F000, v119, OS_LOG_TYPE_DEFAULT, "capabilities = %{public}@", buf, 0xCu);
                }
                *(_QWORD *)buf = 0;
                *(_QWORD *)&buf[8] = buf;
                *(_QWORD *)&buf[16] = 0x3052000000;
                v135 = __Block_byref_object_copy_;
                v136 = __Block_byref_object_dispose_;
                v137 = v4;
                v129[0] = MEMORY[0x24BDAC760];
                v129[1] = 3221225472;
                v129[2] = __46__BCAppleBacklightBrtControl_initWithService___block_invoke;
                v129[3] = &unk_24F2A70E8;
                v129[4] = buf;
                *((_QWORD *)v4 + 22) = _newBlockWrapper(v129);
                v121 = IONotificationPortCreate(*MEMORY[0x24BDD8B20]);
                *((_QWORD *)v4 + 23) = v121;
                IONotificationPortSetDispatchQueue(v121, (dispatch_queue_t)objc_msgSend(v4, "queue"));
                *((_DWORD *)v4 + 48) = 0;
                v122 = (IONotificationPort *)*((_QWORD *)v4 + 23);
                v123 = (void *)MEMORY[0x22E2D4EA4]();
                v124 = &unk_24F2A8FE8;
                objc_autoreleasePoolPop(v123);
                if (!IOServiceAddMatchingNotification(v122, "IOServiceTerminate", (CFDictionaryRef)&unk_24F2A8FE8, (IOServiceMatchingCallback)_iokitCallback, *((void **)v4 + 22), (io_iterator_t *)v4 + 48))goto LABEL_179;
                if (objc_msgSend(v4, "logHandle"))
                {
                  v125 = (os_log_t)objc_msgSend(v4, "logHandle");
                }
                else
                {
                  v126 = _COREBRIGHTNESS_LOG_DEFAULT;
                  if (_COREBRIGHTNESS_LOG_DEFAULT)
                  {
LABEL_177:
                    if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
                      -[BCAppleBacklightBrtControl initWithService:].cold.5();
LABEL_179:
                    _Block_object_dispose(buf, 8);
                    goto LABEL_180;
                  }
                  v125 = init_default_corebrightness_log();
                }
                v126 = v125;
                goto LABEL_177;
              }
              v118 = init_default_corebrightness_log();
            }
            v119 = v118;
            goto LABEL_170;
          }
          if (objc_msgSend(v4, "logHandle"))
          {
            v85 = (os_log_t)objc_msgSend(v4, "logHandle");
          }
          else
          {
            v86 = _COREBRIGHTNESS_LOG_DEFAULT;
            if (_COREBRIGHTNESS_LOG_DEFAULT)
            {
LABEL_142:
              if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
                -[BCAppleBacklightBrtControl initWithService:].cold.2(v86, v94, v95, v96, v97, v98, v99, v100);
LABEL_144:

              v4 = 0;
LABEL_180:
              objc_autoreleasePoolPop(context);
              return (BCAppleBacklightBrtControl *)v4;
            }
            v85 = init_default_corebrightness_log();
          }
          v86 = v85;
          goto LABEL_142;
        }
        v8 = init_default_corebrightness_log();
      }
      v9 = v8;
      goto LABEL_10;
    }
    if (objc_msgSend(v4, "logHandle"))
    {
      v10 = (os_log_t)objc_msgSend(v4, "logHandle");
    }
    else
    {
      v11 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (_COREBRIGHTNESS_LOG_DEFAULT)
      {
LABEL_138:
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[BCAppleBacklightBrtControl initWithService:].cold.1(v11, v87, v88, v89, v90, v91, v92, v93);
        goto LABEL_144;
      }
      v10 = init_default_corebrightness_log();
    }
    v11 = v10;
    goto LABEL_138;
  }
  return (BCAppleBacklightBrtControl *)v4;
}

uint64_t __46__BCAppleBacklightBrtControl_initWithService___block_invoke(uint64_t a1, io_iterator_t iterator)
{
  uint64_t result;
  uint64_t v5;
  _DWORD *v6;
  _QWORD v7[5];

  result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    while (1)
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_DWORD **)(*(_QWORD *)(v5 + 8) + 40);
      if (v6)
      {
        if ((_DWORD)result == v6[29])
          break;
      }
      IOObjectRelease(result);
      result = IOIteratorNext(iterator);
      if (!(_DWORD)result)
        return result;
    }
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __46__BCAppleBacklightBrtControl_initWithService___block_invoke_2;
    v7[3] = &unk_24F2A70C0;
    v7[4] = v5;
    return objc_msgSend(v6, "_runOnCallbackQueue:", v7);
  }
  return result;
}

uint64_t __46__BCAppleBacklightBrtControl_initWithService___block_invoke_2(uint64_t a1)
{
  os_log_t inited;
  NSObject *v3;
  uint64_t result;
  uint64_t v5;
  uint8_t v6[16];

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
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_229A2F000, v3, OS_LOG_TYPE_DEFAULT, "Display disconnected", v6, 2u);
  }
  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "displayInvalidHandler");
  if (result)
  {
    v5 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "displayInvalidHandler");
    return (*(uint64_t (**)(uint64_t, _QWORD))(v5 + 16))(v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  }
  return result;
}

- (BCAppleBacklightBrtControl)init
{
  void *v3;
  id v4;
  kern_return_t MatchingServices;
  uint64_t v6;
  io_iterator_t existing;

  v3 = (void *)MEMORY[0x22E2D4EA4](self, a2);
  v4 = &unk_24F2A8FE8;
  objc_autoreleasePoolPop(v3);
  existing = 0;
  MatchingServices = IOServiceGetMatchingServices(*MEMORY[0x24BDD8B20], (CFDictionaryRef)&unk_24F2A8FE8, &existing);
  v6 = 0;
  if (!MatchingServices)
    v6 = IOIteratorNext(existing);
  return -[BCAppleBacklightBrtControl initWithService:](self, "initWithService:", v6);
}

+ (id)copyAvailableControls
{
  id v2;
  mach_port_t v3;
  void *v4;
  id v5;
  BOOL v6;
  NSObject *inited;
  uint64_t v8;
  uint64_t v9;
  BCAppleBacklightBrtControl *v10;
  BCAppleBacklightBrtControl *v11;
  io_iterator_t existing;

  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  existing = 0;
  v3 = *MEMORY[0x24BDD8B20];
  v4 = (void *)MEMORY[0x22E2D4EA4]();
  v5 = &unk_24F2A8FE8;
  objc_autoreleasePoolPop(v4);
  if (IOServiceGetMatchingServices(v3, (CFDictionaryRef)&unk_24F2A8FE8, &existing))
    v6 = 1;
  else
    v6 = existing == 0;
  if (v6)
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT)
      inited = init_default_corebrightness_log();
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
      +[BCAppleBacklightBrtControl copyAvailableControls].cold.1();
  }
  else
  {
    v8 = IOIteratorNext(existing);
    if ((_DWORD)v8)
    {
      v9 = v8;
      do
      {
        v10 = -[BCAppleBacklightBrtControl initWithService:]([BCAppleBacklightBrtControl alloc], "initWithService:", v9);
        if (v10)
        {
          v11 = v10;
          objc_msgSend(v2, "addObject:", v10);

        }
        v9 = IOIteratorNext(existing);
      }
      while ((_DWORD)v9);
    }
  }
  if (existing)
    IOObjectRelease(existing);
  return v2;
}

- (unint64_t)registryID
{
  uint64_t entryID;

  entryID = 0;
  IORegistryEntryGetRegistryEntryID(*(&self->_backlightService + 1), &entryID);
  return entryID;
}

- (id)ID
{
  id result;
  id v4;
  objc_class *v5;

  result = self->super._id;
  if (!result)
  {
    v4 = objc_alloc(MEMORY[0x24BDD17C8]);
    v5 = (objc_class *)objc_opt_class();
    result = (id)objc_msgSend(v4, "initWithFormat:", CFSTR("%@-%llu"), NSStringFromClass(v5), -[BCAppleBacklightBrtControl registryID](self, "registryID"));
    self->super._id = (NSString *)result;
  }
  return result;
}

- (void)dealloc
{
  io_object_t v3;
  IONotificationPort *terminationNotifPort;
  io_object_t terminationIterator;
  objc_super v6;

  v3 = *(&self->_backlightService + 1);
  if (v3)
    IOObjectRelease(v3);
  _freeBlockWrapper((const void **)&self->_terminationCallback->var0);
  terminationNotifPort = self->_terminationNotifPort;
  if (terminationNotifPort)
    IONotificationPortDestroy(terminationNotifPort);
  terminationIterator = self->_terminationIterator;
  if (terminationIterator)
    IOObjectRelease(terminationIterator);
  v6.receiver = self;
  v6.super_class = (Class)BCAppleBacklightBrtControl;
  -[BCBrtControl dealloc](&v6, sel_dealloc);
}

void __44__BCAppleBacklightBrtControl_setNits_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  io_registry_entry_t v4;
  uint64_t v5;
  uint64_t v6;
  os_log_t inited;
  NSObject *v8;
  os_log_t v9;
  NSObject *v10;
  char v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22E2D4EA4]();
  if (!objc_msgSend(*(id *)(a1 + 32), "_checkIsValid:", *(_QWORD *)(a1 + 48)))
    goto LABEL_14;
  v4 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 116);
  v15 = CFSTR("brightness-nits");
  LODWORD(v3) = vcvtd_n_s64_f64(*(double *)(a1 + 56), 0x10uLL);
  v16[0] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  v5 = IORegistryEntrySetCFProperties(v4, (CFTypeRef)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1));
  v6 = objc_msgSend(*(id *)(a1 + 32), "logHandle");
  if ((_DWORD)v5)
  {
    if (v6)
    {
      inited = (os_log_t)objc_msgSend(*(id *)(a1 + 32), "logHandle");
    }
    else
    {
      v8 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (_COREBRIGHTNESS_LOG_DEFAULT)
      {
LABEL_10:
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          __44__BCAppleBacklightBrtControl_setNits_error___block_invoke_cold_1();
        if (*(_QWORD *)(a1 + 48))
        {
          v11 = 0;
          **(_QWORD **)(a1 + 48) = objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithIOKitError:", v5);
          goto LABEL_15;
        }
LABEL_14:
        v11 = 0;
        goto LABEL_15;
      }
      inited = init_default_corebrightness_log();
    }
    v8 = inited;
    goto LABEL_10;
  }
  if (v6)
  {
    v9 = (os_log_t)objc_msgSend(*(id *)(a1 + 32), "logHandle");
LABEL_8:
    v10 = v9;
    goto LABEL_17;
  }
  v10 = _COREBRIGHTNESS_LOG_DEFAULT;
  if (!_COREBRIGHTNESS_LOG_DEFAULT)
  {
    v9 = init_default_corebrightness_log();
    goto LABEL_8;
  }
LABEL_17:
  v11 = 1;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v12 = *(_QWORD *)(a1 + 56);
    v13 = 134217984;
    v14 = v12;
    _os_log_impl(&dword_229A2F000, v10, OS_LOG_TYPE_INFO, "Setting nits to %f", (uint8_t *)&v13, 0xCu);
  }
LABEL_15:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v11;
  objc_autoreleasePoolPop(v2);
}

- (double)getNitsWithError:(id *)a3
{
  OS_dispatch_queue *v5;
  double v6;
  _QWORD block[7];
  uint64_t v9;
  double *v10;
  uint64_t v11;
  uint64_t v12;

  if (self->_isDFR || self->_override)
  {
    v9 = 0;
    v10 = (double *)&v9;
    v11 = 0x2020000000;
    v12 = 0;
    v5 = -[BCBrtControl queue](self, "queue");
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__BCAppleBacklightBrtControl_getNitsWithError___block_invoke;
    block[3] = &unk_24F2A7138;
    block[5] = &v9;
    block[6] = a3;
    block[4] = self;
    dispatch_sync((dispatch_queue_t)v5, block);
    v6 = v10[3];
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    v6 = -1.0;
    if (a3)
      *a3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithBCError:", 16);
  }
  return v6;
}

void __47__BCAppleBacklightBrtControl_getNitsWithError___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  void *CFProperty;
  id v5;
  double v6;

  v2 = (void *)MEMORY[0x22E2D4EA4]();
  v3 = -1.0;
  if (objc_msgSend(*(id *)(a1 + 32), "_checkIsValid:", *(_QWORD *)(a1 + 48)))
  {
    CFProperty = (void *)IORegistryEntryCreateCFProperty(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 116), CFSTR("IODisplayParameters"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    v5 = CFProperty;
    if (CFProperty)
    {
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(CFProperty, "objectForKeyedSubscript:", CFSTR("BrightnessMilliNits")), "objectForKeyedSubscript:", CFSTR("value")), "doubleValue");
      v3 = v6 / 1000.0;
    }
    else if (*(_QWORD *)(a1 + 48))
    {
      **(_QWORD **)(a1 + 48) = objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithBCError:", 19);
    }
  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  objc_autoreleasePoolPop(v2);
}

- (BOOL)setProperty:(id)a3 value:(id)a4 error:(id *)a5
{
  uint64_t v9;
  BOOL result;
  void *v11;

  if (!_isIOKitCompatible((uint64_t)a4))
  {
    if (!a5)
      return 0;
    v9 = 18;
LABEL_7:
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithIOKitError:", v9);
    result = 0;
    *a5 = v11;
    return result;
  }
  v9 = IORegistryEntrySetCFProperty(*(&self->_backlightService + 1), (CFStringRef)a3, a4);
  result = (_DWORD)v9 == 0;
  if (a5 && (_DWORD)v9)
    goto LABEL_7;
  return result;
}

- (id)copyProperty:(id)a3 error:(id *)a4
{
  CFTypeRef CFProperty;
  OS_os_log *inited;
  NSObject *v9;
  id v10;
  int v12;
  id v13;
  __int16 v14;
  CFTypeRef v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (_isIOKitCompatible((uint64_t)a3))
  {
    CFProperty = IORegistryEntryCreateCFProperty(*(&self->_backlightService + 1), (CFStringRef)a3, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  }
  else
  {
    CFProperty = 0;
    if (a4)
      *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithIOKitError:", 18);
  }
  if (-[BCBrtControl logHandle](self, "logHandle"))
  {
    inited = -[BCBrtControl logHandle](self, "logHandle");
LABEL_7:
    v9 = inited;
    goto LABEL_9;
  }
  v9 = _COREBRIGHTNESS_LOG_DEFAULT;
  if (!_COREBRIGHTNESS_LOG_DEFAULT)
  {
    inited = (OS_os_log *)init_default_corebrightness_log();
    goto LABEL_7;
  }
LABEL_9:
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    if (a4)
      v10 = *a4;
    else
      v10 = 0;
    v12 = 138412802;
    v13 = a3;
    v14 = 2112;
    v15 = CFProperty;
    v16 = 2112;
    v17 = v10;
    _os_log_impl(&dword_229A2F000, v9, OS_LOG_TYPE_INFO, "copyProperty(%@) = %@ (error: %@)", (uint8_t *)&v12, 0x20u);
  }
  return (id)CFProperty;
}

- (BOOL)parseAuroraCapabilities
{
  void *v3;
  unsigned __int8 v4;
  BOOL v5;
  void *v6;
  double v7;
  double v8;
  unint64_t float_array_from_edt;
  void *v10;
  void *v11;
  double v12;
  uint64_t i;
  unint64_t v14;
  void *v15;
  void *v16;
  double v17;
  uint64_t j;
  unint64_t v19;
  void *v20;
  void *v21;
  double v22;
  uint64_t k;
  double v24;
  double v25;
  double v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  double v30;
  double v31;
  OS_os_log *v32;
  NSObject *v33;
  NSObject *logHandle;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  void *v43;
  double v44;
  double v45;
  NSObject *inited;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  double v54;
  unsigned int v56;
  unsigned int v57;
  unsigned int v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint8_t buf[8];
  unsigned int v64;
  int v65;

  v3 = (void *)MEMORY[0x22E2D4EA4](self, a2);
  v65 = 0;
  v4 = load_int_from_edt(*(&self->_backlightService + 1), CFSTR("supports-aurora"), &v65);
  if (v65)
    v5 = v4;
  else
    v5 = 0;
  if (v5)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v64 = 0;
    if (load_int_from_edt(*(&self->_backlightService + 1), CFSTR("aurora-ignore-peak-apce"), &v64))
      objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v64), CFSTR("AuroraIgnorePeakAPCE"));
    *(float *)&v7 = load_float_from_edt(*(&self->_backlightService + 1), CFSTR("aurora-cpms-threshold"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7), CFSTR("AuroraCPMSThreshold"));
    *(float *)&v8 = load_float_from_edt(*(&self->_backlightService + 1), CFSTR("aurora-cpms-enter-multiplier"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8), CFSTR("AuroraCPMSEnterMultiplier"));
    *(_QWORD *)buf = 0;
    float_array_from_edt = load_float_array_from_edt(*(&self->_backlightService + 1), CFSTR("aurora-enter-lux"), buf);
    v10 = *(void **)buf;
    if (*(_QWORD *)buf && float_array_from_edt)
    {
      v11 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", float_array_from_edt);
      for (i = 0; i != float_array_from_edt; ++i)
      {
        LODWORD(v12) = *(_DWORD *)(*(_QWORD *)buf + 4 * i);
        objc_msgSend(v11, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v12), i);
      }
      objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v11), CFSTR("AuroraEnterLux"));
      v10 = *(void **)buf;
    }
    free(v10);
    v62 = 0;
    v14 = load_float_array_from_edt(*(&self->_backlightService + 1), CFSTR("aurora-exit-lux"), &v62);
    v15 = v62;
    if (v62 && v14)
    {
      v16 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v14);
      for (j = 0; j != v14; ++j)
      {
        LODWORD(v17) = *((_DWORD *)v62 + j);
        objc_msgSend(v16, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v17), j);
      }
      objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v16), CFSTR("AuroraExitLux"));
      v15 = v62;
    }
    free(v15);
    v61 = 0;
    v19 = load_float_array_from_edt(*(&self->_backlightService + 1), CFSTR("aurora-saturation-lux"), &v61);
    v20 = v61;
    if (v61 && v19)
    {
      v21 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v19);
      for (k = 0; k != v19; ++k)
      {
        LODWORD(v22) = *((_DWORD *)v61 + k);
        objc_msgSend(v21, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v22), k);
      }
      objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v21), CFSTR("AuroraSaturationLux"));
      v20 = v61;
    }
    free(v20);
    *(float *)&v24 = load_float_from_edt(*(&self->_backlightService + 1), CFSTR("aurora-avrg-apce-sampling-rate"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v24), CFSTR("AuroraAverageAPCESamplingRate"));
    *(float *)&v25 = load_float_from_edt(*(&self->_backlightService + 1), CFSTR("aurora-ramp-up-speed"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v25), CFSTR("AuroraRampUpSpeed"));
    *(float *)&v26 = load_float_from_edt(*(&self->_backlightService + 1), CFSTR("aurora-ramp-down-speed"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v26), CFSTR("AuroraRampDownSpeed"));
    v60 = 0;
    v27 = load_float_array_from_edt(*(&self->_backlightService + 1), CFSTR("aurora-ramp-up-tap-points"), &v60);
    if (v60)
    {
      v28 = v27;
      if (v27 == 2)
      {
        v29 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
        LODWORD(v30) = *(_DWORD *)v60;
        objc_msgSend(v29, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v30), 0);
        LODWORD(v31) = *((_DWORD *)v60 + 1);
        objc_msgSend(v29, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v31), 1);
        objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v29), CFSTR("AuroraRampUpTapAPCEPoints"));
      }
      else
      {
        logHandle = self->super._logHandle;
        if (!logHandle)
        {
          logHandle = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT)
            logHandle = init_default_corebrightness_log();
        }
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
          -[BCAppleBacklightBrtControl parseAuroraCapabilities].cold.2(v28, logHandle, v35, v36, v37, v38, v39, v40);
      }
    }
    free(v60);
    v59 = 0;
    v41 = load_float_array_from_edt(*(&self->_backlightService + 1), CFSTR("aurora-ramp-down-tap-points"), &v59);
    if (v59)
    {
      v42 = v41;
      if (v41 == 2)
      {
        v43 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
        LODWORD(v44) = *(_DWORD *)v59;
        objc_msgSend(v43, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v44), 0);
        LODWORD(v45) = *((_DWORD *)v59 + 1);
        objc_msgSend(v43, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v45), 1);
        objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v43), CFSTR("AuroraRampDownTapAPCEPoints"));
      }
      else
      {
        inited = self->super._logHandle;
        if (!inited)
        {
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT)
            inited = init_default_corebrightness_log();
        }
        if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
          -[BCAppleBacklightBrtControl parseAuroraCapabilities].cold.1(v42, inited, v47, v48, v49, v50, v51, v52);
      }
    }
    free(v59);
    *(float *)&v53 = load_float_from_edt(*(&self->_backlightService + 1), CFSTR("aurora-session-limit"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v53), CFSTR("AuroraSessionLimit"));
    v58 = 0;
    if (load_int_from_edt(*(&self->_backlightService + 1), CFSTR("aurora-ignore-session-limit"), &v58))
      objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v58), CFSTR("AuroraIgnoreSessionLimit"));
    *(float *)&v54 = load_float_from_edt(*(&self->_backlightService + 1), CFSTR("aurora-maximum-nits"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v54), CFSTR("AuroraMaxNits"));
    v57 = 0;
    if (load_int_from_edt(*(&self->_backlightService + 1), CFSTR("aurora-ignore-apce"), &v57))
      objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v57), CFSTR("AuroraIgnoreAPCE"));
    v56 = 0;
    if (load_int_from_edt(*(&self->_backlightService + 1), CFSTR("aurora-allow-edr"), &v56))
      objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v56), CFSTR("AuroraAllowEDR"));
    if (objc_msgSend(v6, "count"))
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._capabilities, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v6), CFSTR("Aurora"));
    goto LABEL_52;
  }
  if (-[BCBrtControl logHandle](self, "logHandle"))
  {
    v32 = -[BCBrtControl logHandle](self, "logHandle");
LABEL_27:
    v33 = v32;
    goto LABEL_29;
  }
  v33 = _COREBRIGHTNESS_LOG_DEFAULT;
  if (!_COREBRIGHTNESS_LOG_DEFAULT)
  {
    v32 = (OS_os_log *)init_default_corebrightness_log();
    goto LABEL_27;
  }
LABEL_29:
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_229A2F000, v33, OS_LOG_TYPE_INFO, "Aurora not supported, skipping Aurora capabilities", buf, 2u);
  }
LABEL_52:
  objc_autoreleasePoolPop(v3);
  return v5;
}

+ (void)newMonitorWithHandler:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_229A2F000, v0, v1, "Unable to setup IO notifications (error = %d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithService:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_229A2F000, a1, a3, "Unable to find backlight service.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithService:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_229A2F000, a1, a3, "Unable to read properties from backlight service.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithService:.cold.3()
{
  __assert_rtn("-[BCAppleBacklightBrtControl initWithService:]", "BCAppleBacklightBrtControl.m", 273, "_maxUser >= _minUser");
}

- (void)initWithService:.cold.4()
{
  __assert_rtn("-[BCAppleBacklightBrtControl initWithService:]", "BCAppleBacklightBrtControl.m", 274, "_maxNits >= _minNits");
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

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_229A2F000, v0, v1, "IOKit error registering for termination notification: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)copyAvailableControls
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_229A2F000, v0, v1, "error: failed to retrieve backlight services (%u)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __44__BCAppleBacklightBrtControl_setNits_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_229A2F000, v0, v1, "Unable to set CF properties (err = 0x%X)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)parseAuroraCapabilities
{
  OUTLINED_FUNCTION_1(&dword_229A2F000, a2, a3, "Aurora ramp up tap points - unexpected number of values(%lu), expected 2", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

@end
