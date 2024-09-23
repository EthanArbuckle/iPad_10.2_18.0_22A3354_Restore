@implementation ACCHWComponentAuthService

- (void)authenticateBatteryWithChallenge:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (authenticateBatteryWithChallenge_completionHandler__onceToken != -1)
    dispatch_once(&authenticateBatteryWithChallenge_completionHandler__onceToken, &__block_literal_global_0);
  v8 = authenticateBatteryWithChallenge_completionHandler__batteryQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__ACCHWComponentAuthService_authenticateBatteryWithChallenge_completionHandler___block_invoke_2;
  block[3] = &unk_24F059980;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __80__ACCHWComponentAuthService_authenticateBatteryWithChallenge_completionHandler___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;
  NSObject *v3;

  v0 = dispatch_queue_create("com.apple.ACCHWComponentAuthService.battery", 0);
  v1 = (void *)authenticateBatteryWithChallenge_completionHandler__batteryQueue;
  authenticateBatteryWithChallenge_completionHandler__batteryQueue = (uint64_t)v0;

  v2 = authenticateBatteryWithChallenge_completionHandler__batteryQueue;
  dispatch_get_global_queue(25, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_set_target_queue(v2, v3);

}

uint64_t __80__ACCHWComponentAuthService_authenticateBatteryWithChallenge_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_authenticateModuleWithChallenge:completionHandler:moduleType:updateRegistry:updateUIProperty:logToAnalytics:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, 0, 0, 0);
}

- (void)authenticateTouchControllerWithChallenge:(id)a3 completionHandler:(id)a4 updateRegistry:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a4;
  if (authenticateTouchControllerWithChallenge_completionHandler_updateRegistry__onceToken != -1)
    dispatch_once(&authenticateTouchControllerWithChallenge_completionHandler_updateRegistry__onceToken, &__block_literal_global_85);
  v10 = authenticateTouchControllerWithChallenge_completionHandler_updateRegistry__touchControllerQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __103__ACCHWComponentAuthService_authenticateTouchControllerWithChallenge_completionHandler_updateRegistry___block_invoke_2;
  v13[3] = &unk_24F0599C8;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

void __103__ACCHWComponentAuthService_authenticateTouchControllerWithChallenge_completionHandler_updateRegistry___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;
  NSObject *v3;

  v0 = dispatch_queue_create("com.apple.ACCHWComponentAuthService.touchcontroller", 0);
  v1 = (void *)authenticateTouchControllerWithChallenge_completionHandler_updateRegistry__touchControllerQueue;
  authenticateTouchControllerWithChallenge_completionHandler_updateRegistry__touchControllerQueue = (uint64_t)v0;

  v2 = authenticateTouchControllerWithChallenge_completionHandler_updateRegistry__touchControllerQueue;
  dispatch_get_global_queue(25, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_set_target_queue(v2, v3);

}

uint64_t __103__ACCHWComponentAuthService_authenticateTouchControllerWithChallenge_completionHandler_updateRegistry___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_authenticateModuleWithChallenge:completionHandler:moduleType:updateRegistry:updateUIProperty:logToAnalytics:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1, *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 56), 0);
}

- (void)authenticateVeridianWithChallenge:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (authenticateVeridianWithChallenge_completionHandler__onceToken != -1)
    dispatch_once(&authenticateVeridianWithChallenge_completionHandler__onceToken, &__block_literal_global_87);
  v8 = authenticateVeridianWithChallenge_completionHandler__veridianQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__ACCHWComponentAuthService_authenticateVeridianWithChallenge_completionHandler___block_invoke_2;
  block[3] = &unk_24F059980;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __81__ACCHWComponentAuthService_authenticateVeridianWithChallenge_completionHandler___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;
  NSObject *v3;

  v0 = dispatch_queue_create("com.apple.ACCHWComponentAuthService.veridian", 0);
  v1 = (void *)authenticateVeridianWithChallenge_completionHandler__veridianQueue;
  authenticateVeridianWithChallenge_completionHandler__veridianQueue = (uint64_t)v0;

  v2 = authenticateVeridianWithChallenge_completionHandler__veridianQueue;
  dispatch_get_global_queue(25, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_set_target_queue(v2, v3);

}

uint64_t __81__ACCHWComponentAuthService_authenticateVeridianWithChallenge_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_authenticateModuleWithChallenge:completionHandler:moduleType:updateRegistry:updateUIProperty:logToAnalytics:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 2, 0, 0, 0);
}

- (void)authenticateVeridianWithChallenge:(id)a3 completionHandler:(id)a4 updateRegistry:(BOOL)a5 updateUIProperty:(BOOL)a6 logToAnalytics:(BOOL)a7
{
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  BOOL v20;
  BOOL v21;
  BOOL v22;

  v12 = a3;
  v13 = a4;
  if (authenticateVeridianWithChallenge_completionHandler_updateRegistry_updateUIProperty_logToAnalytics__onceToken != -1)
    dispatch_once(&authenticateVeridianWithChallenge_completionHandler_updateRegistry_updateUIProperty_logToAnalytics__onceToken, &__block_literal_global_89);
  v14 = authenticateVeridianWithChallenge_completionHandler_updateRegistry_updateUIProperty_logToAnalytics__veridianQueue;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __128__ACCHWComponentAuthService_authenticateVeridianWithChallenge_completionHandler_updateRegistry_updateUIProperty_logToAnalytics___block_invoke_2;
  v17[3] = &unk_24F059A30;
  v17[4] = self;
  v18 = v12;
  v19 = v13;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v15 = v13;
  v16 = v12;
  dispatch_async(v14, v17);

}

void __128__ACCHWComponentAuthService_authenticateVeridianWithChallenge_completionHandler_updateRegistry_updateUIProperty_logToAnalytics___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;
  NSObject *v3;

  v0 = dispatch_queue_create("com.apple.ACCHWComponentAuthService.veridian", 0);
  v1 = (void *)authenticateVeridianWithChallenge_completionHandler_updateRegistry_updateUIProperty_logToAnalytics__veridianQueue;
  authenticateVeridianWithChallenge_completionHandler_updateRegistry_updateUIProperty_logToAnalytics__veridianQueue = (uint64_t)v0;

  v2 = authenticateVeridianWithChallenge_completionHandler_updateRegistry_updateUIProperty_logToAnalytics__veridianQueue;
  dispatch_get_global_queue(25, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_set_target_queue(v2, v3);

}

uint64_t __128__ACCHWComponentAuthService_authenticateVeridianWithChallenge_completionHandler_updateRegistry_updateUIProperty_logToAnalytics___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_authenticateModuleWithChallenge:completionHandler:moduleType:updateRegistry:updateUIProperty:logToAnalytics:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 2, *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), *(unsigned __int8 *)(a1 + 58));
}

- (void)_authenticateModuleWithChallenge:(id)a3 completionHandler:(id)a4 moduleType:(int)a5 updateRegistry:(BOOL)a6 updateUIProperty:(BOOL)a7 logToAnalytics:(BOOL)a8
{
  _BOOL4 v8;
  id v12;
  void (**v13)(id, _QWORD, void *, void *, _BOOL8, uint64_t);
  ACCHWComponentAuthServiceParams *v14;
  unint64_t CurrentUnixTimeMS;
  _QWORD *v16;
  unint64_t v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  _BOOL8 v22;
  id v23;
  NSObject *v24;
  id v25;
  io_registry_entry_t v26;
  const __CFAllocator *v27;
  void *v28;
  int v29;
  void *v30;
  NSObject *v31;
  const __CFNumber *CFProperty;
  __int128 v33;
  __int128 v34;
  NSObject *v35;
  id v36;
  __int128 v37;
  int v38;
  NSObject *v39;
  uint64_t v40;
  int v41;
  BOOL v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  int v46;
  NSObject *v47;
  NSObject *v48;
  uint64_t v49;
  int v50;
  NSObject *v51;
  uint64_t v52;
  int v53;
  NSObject *v54;
  NSObject *v55;
  unsigned int v56;
  uint64_t v57;
  int v58;
  NSObject *v59;
  NSObject *v60;
  int v61;
  NSObject *v62;
  uint64_t v63;
  int v64;
  BOOL v65;
  NSObject *v66;
  NSObject *v67;
  uint64_t v68;
  int v69;
  NSObject *v70;
  NSObject *v71;
  uint64_t v72;
  int v73;
  NSObject *v74;
  uint64_t v75;
  int v76;
  NSObject *v77;
  NSObject *v78;
  uint64_t v79;
  int v80;
  NSObject *v81;
  NSObject *v82;
  uint64_t v83;
  int v84;
  NSObject *v85;
  uint64_t v86;
  uint64_t v87;
  int v88;
  NSObject *v89;
  uint64_t v90;
  int v91;
  NSObject *v92;
  NSObject *v93;
  NSObject *v94;
  const char *v95;
  NSObject *v96;
  uint64_t v97;
  uint64_t v98;
  int v99;
  uint64_t v100;
  int v101;
  NSObject *v102;
  NSObject *v103;
  uint64_t v104;
  int v105;
  NSObject *v106;
  NSObject *v107;
  NSObject *v108;
  NSObject *v109;
  id v110;
  _BOOL8 v111;
  unsigned int v112;
  NSObject *v113;
  id v114;
  id v115;
  NSObject *v116;
  id v117;
  NSObject *v118;
  id v119;
  void *v120;
  int v121;
  _BOOL4 v122;
  _BOOL4 v123;
  NSObject *v124;
  id v125;
  io_service_t v126;
  NSObject *v127;
  id v128;
  int v129;
  int v130;
  NSObject *v131;
  id v132;
  int v133;
  int v134;
  NSObject *v135;
  id v136;
  int v137;
  int v138;
  NSObject *v139;
  id v140;
  int v141;
  int v142;
  NSObject *v143;
  id v144;
  const char *v145;
  const __CFString *v146;
  const __CFString *v147;
  unint64_t v148;
  uint64_t v149;
  NSObject *v150;
  id v151;
  NSObject *v152;
  id v153;
  void *v154;
  void *v155;
  NSObject *v156;
  NSObject *v157;
  __int128 v158;
  _BOOL4 v159;
  unint64_t v160;
  void *v161;
  _BOOL4 v162;
  _BOOL4 v163;
  io_connect_t connect;
  _QWORD v165[4];
  int v166;
  unsigned __int8 valuePtr;
  timespec __tp;
  unsigned int v169;
  uint8_t v170[4];
  int v171[3];
  _BYTE buf[34];
  uint64_t v173;

  v8 = a8;
  v159 = a7;
  v163 = a6;
  v173 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = (void (**)(id, _QWORD, void *, void *, _BOOL8, uint64_t))a4;
  init_logging();
  v14 = objc_alloc_init(ACCHWComponentAuthServiceParams);
  v169 = -1431655766;
  __tp.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  __tp.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  valuePtr = 0;
  CurrentUnixTimeMS = systemInfo_getCurrentUnixTimeMS();
  v165[0] = MEMORY[0x24BDAC760];
  v165[1] = 3221225472;
  v165[2] = __138__ACCHWComponentAuthService__authenticateModuleWithChallenge_completionHandler_moduleType_updateRegistry_updateUIProperty_logToAnalytics___block_invoke;
  v165[3] = &__block_descriptor_36_e5_v8__0l;
  v166 = a5;
  v16 = v165;
  if (_authenticateModuleWithChallenge_completionHandler_moduleType_updateRegistry_updateUIProperty_logToAnalytics__onceToken != -1)
    dispatch_once(&_authenticateModuleWithChallenge_completionHandler_moduleType_updateRegistry_updateUIProperty_logToAnalytics__onceToken, v16);

  v17 = 0x25591E000uLL;
  v162 = v8;
  v160 = CurrentUnixTimeMS;
  if (_authenticateModuleWithChallenge_completionHandler_moduleType_updateRegistry_updateUIProperty_logToAnalytics__disableAuth)
  {
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v18 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        ACASignVeridianChallenge_cold_1();
      v18 = MEMORY[0x24BDACB70];
      v20 = MEMORY[0x24BDACB70];
    }
    v161 = v12;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = a5;
      _os_log_impl(&dword_227BD1000, v18, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) skip component auth", buf, 8u);
    }

    -[ACCHWComponentAuthServiceParams setSignature:](v14, "setSignature:", 0);
    -[ACCHWComponentAuthServiceParams setCertificate:](v14, "setCertificate:", 0);
    -[ACCHWComponentAuthServiceParams setCertificateInfo:](v14, "setCertificateInfo:", 0);
    -[ACCHWComponentAuthServiceParams setSkipComms:](v14, "setSkipComms:", 0);
    v21 = 0;
    v22 = 1;
    goto LABEL_266;
  }
  if (gLogObjects && gNumLogObjects >= 4)
  {
    v19 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ACASignVeridianChallenge_cold_1();
    v19 = MEMORY[0x24BDACB70];
    v23 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = a5;
    _os_log_impl(&dword_227BD1000, v19, OS_LOG_TYPE_DEFAULT, "(moduleType=%d)", buf, 8u);
  }

  clock_gettime(_CLOCK_REALTIME, &__tp);
  if (gLogObjects && gNumLogObjects >= 4)
  {
    v24 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ACASignVeridianChallenge_cold_1();
    v24 = MEMORY[0x24BDACB70];
    v25 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)&buf[4] = a5;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = 338;
    *(_WORD *)&buf[14] = 2048;
    *(_QWORD *)&buf[16] = __tp.tv_sec;
    *(_WORD *)&buf[24] = 2048;
    *(_QWORD *)&buf[26] = __tp.tv_nsec / 0xF4240uLL;
    _os_log_impl(&dword_227BD1000, v24, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) %d: %ld.%03llu", buf, 0x22u);
  }

  -[ACCHWComponentAuthServiceParams setModuleAuthService:](v14, "setModuleAuthService:", -[ACCHWComponentAuthService _findModuleAuthService:withAuthFlags:](self, "_findModuleAuthService:withAuthFlags:", a5, &v169));
  if (!-[ACCHWComponentAuthServiceParams moduleAuthService](v14, "moduleAuthService"))
  {
    v161 = v12;
    logObjectForModule();
    v156 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = a5;
      _os_log_impl(&dword_227BD1000, v156, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) Error: The component AppleAuthCP was not found", buf, 8u);
    }

    v22 = 0;
    v163 = 0;
    v21 = 22;
    goto LABEL_266;
  }
  v26 = -[ACCHWComponentAuthServiceParams moduleAuthService](v14, "moduleAuthService");
  v27 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (!IORegistryEntryCreateCFProperty(v26, CFSTR("iboot-auth"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0))
  {
    if (!v12)
    {
      *(_QWORD *)&v33 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v33 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)buf = v33;
      *(_OWORD *)&buf[16] = v33;
      arc4random_buf(buf, 0x20uLL);
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", buf, 32);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_49;
  }
  IORegistryEntryCreateCFProperty(-[ACCHWComponentAuthServiceParams moduleAuthService](v14, "moduleAuthService"), CFSTR("pretend_auth"), v27, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = objc_msgSend(v28, "charValue");
      if ((v29 - 3) >= 0xFEu)
      {
        v161 = v12;
        if (v29 == 1)
        {
          v22 = 0;
          v21 = 29;
        }
        else if (v29 == 2)
        {
          v21 = 0;
          v22 = 1;
        }
        else
        {
          v22 = 0;
          v21 = 30;
        }
        -[ACCHWComponentAuthServiceParams setSignature:](v14, "setSignature:", 0);
        -[ACCHWComponentAuthServiceParams setCertificate:](v14, "setCertificate:", 0);
        -[ACCHWComponentAuthServiceParams setCertificateInfo:](v14, "setCertificateInfo:", 0);
        -[ACCHWComponentAuthServiceParams setSkipComms:](v14, "setSkipComms:", 0);

        goto LABEL_266;
      }
    }
  }

  if (v12)
    goto LABEL_49;
  IORegistryEntryCreateCFProperty(-[ACCHWComponentAuthServiceParams moduleAuthService](v14, "moduleAuthService"), CFSTR("Challenge"), v27, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v30;
      -[ACCHWComponentAuthServiceParams setChallenge:](v14, "setChallenge:", v12);
      IORegistryEntryCreateCFProperty(-[ACCHWComponentAuthServiceParams moduleAuthService](v14, "moduleAuthService"), CFSTR("Signature"), v27, 0);
      v31 = objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[ACCHWComponentAuthServiceParams setSignature:](v14, "setSignature:", v31);
          CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(-[ACCHWComponentAuthServiceParams moduleAuthService](v14, "moduleAuthService"), CFSTR("authError"), v27, 0);
          CFNumberGetValue(CFProperty, kCFNumberSInt8Type, &valuePtr);
          if (valuePtr >= 0x1Fu)
            valuePtr = 0;
          -[ACCHWComponentAuthServiceParams setCertificate:](v14, "setCertificate:", 0);
          -[ACCHWComponentAuthServiceParams setCertificateInfo:](v14, "setCertificateInfo:", 0);
          -[ACCHWComponentAuthServiceParams setSkipComms:](v14, "setSkipComms:", 1);

          goto LABEL_48;
        }
      }
      v161 = v12;
      logObjectForModule();
      v157 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v157, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = a5;
        _os_log_impl(&dword_227BD1000, v157, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) Error: signature==NULL", buf, 8u);
      }

    }
    else
    {
      logObjectForModule();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = a5;
        _os_log_impl(&dword_227BD1000, v31, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) Error: challenge==NULL", buf, 8u);
      }
      v161 = 0;
    }

    v22 = 0;
    v21 = 20;
    goto LABEL_266;
  }
  *(_QWORD *)&v34 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v34 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)buf = v34;
  *(_OWORD *)&buf[16] = v34;
  arc4random_buf(buf, 0x20uLL);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", buf, 32);
  v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_48:

LABEL_49:
  -[ACCHWComponentAuthServiceParams setChallenge:](v14, "setChallenge:", v12);
  -[ACCHWComponentAuthServiceParams setAuthFlags:](v14, "setAuthFlags:", v169);
  if (gLogObjects && gNumLogObjects >= 4)
  {
    v35 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ACASignVeridianChallenge_cold_1();
    v35 = MEMORY[0x24BDACB70];
    v36 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    -[ACCHWComponentAuthService _authenticateModuleWithChallenge:completionHandler:moduleType:updateRegistry:updateUIProperty:logToAnalytics:].cold.16(v14);
  v161 = v12;

  if (a5 == 2)
  {
    v38 = -1;
    v39 = MEMORY[0x24BDACB70];
    *(_QWORD *)&v37 = 67109376;
    v158 = v37;
    while (1)
    {
      v40 = gLogObjects;
      v41 = *(_DWORD *)(v17 + 2488);
      if (gLogObjects)
        v42 = v41 < 4;
      else
        v42 = 1;
      if (v42)
      {
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)&buf[4] = v40;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v41;
          _os_log_error_impl(&dword_227BD1000, v39, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v43 = v39;
        v44 = v39;
      }
      else
      {
        v44 = *(id *)(gLogObjects + 24);
      }
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)&buf[4] = 2;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v38 + 1;
        *(_WORD *)&buf[14] = 1024;
        *(_DWORD *)&buf[16] = 3;
        _os_log_debug_impl(&dword_227BD1000, v44, OS_LOG_TYPE_DEBUG, "(moduleType=%d) tryCount = %d (max tries %d)", buf, 0x14u);
      }

      clock_gettime(_CLOCK_REALTIME, &__tp);
      v45 = gLogObjects;
      v46 = *(_DWORD *)(v17 + 2488);
      if (gLogObjects && v46 >= 4)
      {
        v47 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)&buf[4] = v45;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v46;
          _os_log_error_impl(&dword_227BD1000, v39, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v48 = v39;
        v47 = v39;
      }
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)&buf[4] = 2;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = 437;
        *(_WORD *)&buf[14] = 2048;
        *(_QWORD *)&buf[16] = __tp.tv_sec;
        *(_WORD *)&buf[24] = 2048;
        *(_QWORD *)&buf[26] = __tp.tv_nsec / 0xF4240uLL;
        _os_log_impl(&dword_227BD1000, v47, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) %d: %ld.%03llu", buf, 0x22u);
      }

      if (-[ACCHWComponentAuthService _verifyDeviceIDSN:](self, "_verifyDeviceIDSN:", -[ACCHWComponentAuthServiceParams moduleAuthService](v14, "moduleAuthService")))
      {
        clock_gettime(_CLOCK_REALTIME, &__tp);
        v49 = gLogObjects;
        v50 = *(_DWORD *)(v17 + 2488);
        if (gLogObjects && v50 >= 4)
        {
          v51 = *(id *)(gLogObjects + 24);
        }
        else
        {
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(_QWORD *)&buf[4] = v49;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v50;
            _os_log_error_impl(&dword_227BD1000, v39, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v55 = v39;
          v51 = v39;
        }
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109888;
          *(_DWORD *)&buf[4] = 2;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = 445;
          *(_WORD *)&buf[14] = 2048;
          *(_QWORD *)&buf[16] = __tp.tv_sec;
          *(_WORD *)&buf[24] = 2048;
          *(_QWORD *)&buf[26] = __tp.tv_nsec / 0xF4240uLL;
          _os_log_impl(&dword_227BD1000, v51, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) %d: %ld.%03llu", buf, 0x22u);
        }

        v56 = -[ACCHWComponentAuthService _signChallenge:](self, "_signChallenge:", v14);
        if (!v56)
        {
LABEL_208:
          clock_gettime(_CLOCK_REALTIME, &__tp);
          if (gLogObjects && *(int *)(v17 + 2488) >= 4)
          {
            v108 = *(id *)(gLogObjects + 24);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              ACASignVeridianChallenge_cold_1();
            v108 = MEMORY[0x24BDACB70];
            v110 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109888;
            *(_DWORD *)&buf[4] = 2;
            *(_WORD *)&buf[8] = 1024;
            *(_DWORD *)&buf[10] = 458;
            *(_WORD *)&buf[14] = 2048;
            *(_QWORD *)&buf[16] = __tp.tv_sec;
            *(_WORD *)&buf[24] = 2048;
            *(_QWORD *)&buf[26] = __tp.tv_nsec / 0xF4240uLL;
            _os_log_impl(&dword_227BD1000, v108, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) %d: %ld.%03llu", buf, 0x22u);
          }

          v111 = -[ACCHWComponentAuthService _verifyModuleFDR:forModuleType:](self, "_verifyModuleFDR:forModuleType:", v14, 2);
          v22 = v111;
          if (v111)
            v112 = 0;
          else
            v112 = 21;
          if (v56)
            v21 = v56;
          else
            v21 = v112;
          if (!v56 && v111)
          {
            clock_gettime(_CLOCK_REALTIME, &__tp);
            if (gLogObjects && gNumLogObjects >= 4)
            {
              v113 = *(id *)(gLogObjects + 24);
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                ACASignVeridianChallenge_cold_1();
              v113 = MEMORY[0x24BDACB70];
              v115 = MEMORY[0x24BDACB70];
            }
            if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109888;
              *(_DWORD *)&buf[4] = 2;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = 466;
              *(_WORD *)&buf[14] = 2048;
              *(_QWORD *)&buf[16] = __tp.tv_sec;
              *(_WORD *)&buf[24] = 2048;
              *(_QWORD *)&buf[26] = __tp.tv_nsec / 0xF4240uLL;
              _os_log_impl(&dword_227BD1000, v113, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) %d: %ld.%03llu", buf, 0x22u);
            }

            v21 = -[ACCHWComponentAuthService _verifyModuleCertificate:forModuleType:](self, "_verifyModuleCertificate:forModuleType:", v14, 2);
            if ((_DWORD)v21)
            {
              if (gLogObjects && gNumLogObjects >= 4)
              {
                v116 = *(id *)(gLogObjects + 24);
              }
              else
              {
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  ACASignVeridianChallenge_cold_1();
                v116 = MEMORY[0x24BDACB70];
                v117 = MEMORY[0x24BDACB70];
              }
              if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
                -[ACCHWComponentAuthService _authenticateModuleWithChallenge:completionHandler:moduleType:updateRegistry:updateUIProperty:logToAnalytics:].cold.10(v21, v116);

            }
            v22 = 1;
          }
          goto LABEL_252;
        }
        v57 = gLogObjects;
        v58 = *(_DWORD *)(v17 + 2488);
        if (gLogObjects && v58 >= 4)
        {
          v54 = *(id *)(gLogObjects + 24);
        }
        else
        {
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(_QWORD *)&buf[4] = v57;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v58;
            _os_log_error_impl(&dword_227BD1000, v39, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v60 = v39;
          v54 = v39;
        }
        v17 = 0x25591E000;
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v158;
          *(_DWORD *)&buf[4] = 2;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = v56;
          _os_log_error_impl(&dword_227BD1000, v54, OS_LOG_TYPE_ERROR, "(moduleType=%d) authError %d after _signChallenge", buf, 0xEu);
        }
      }
      else
      {
        v52 = gLogObjects;
        v53 = *(_DWORD *)(v17 + 2488);
        if (gLogObjects && v53 >= 4)
        {
          v54 = *(id *)(gLogObjects + 24);
        }
        else
        {
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(_QWORD *)&buf[4] = v52;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v53;
            _os_log_error_impl(&dword_227BD1000, v39, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v59 = v39;
          v54 = v39;
        }
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          -[ACCHWComponentAuthService _authenticateModuleWithChallenge:completionHandler:moduleType:updateRegistry:updateUIProperty:logToAnalytics:].cold.14(v170, v171, v54);
        v56 = 18;
      }

      if (++v38 >= 2)
        goto LABEL_208;
    }
  }
  v61 = -1;
  v62 = MEMORY[0x24BDACB70];
  *(_QWORD *)&v37 = 67109376;
  v158 = v37;
  while (1)
  {
    v63 = gLogObjects;
    v64 = gNumLogObjects;
    if (gLogObjects)
      v65 = gNumLogObjects < 4;
    else
      v65 = 1;
    if (v65)
    {
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v63;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v64;
        _os_log_error_impl(&dword_227BD1000, v62, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
      }
      v66 = v62;
      v67 = v62;
    }
    else
    {
      v67 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)&buf[4] = a5;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v61 + 1;
      *(_WORD *)&buf[14] = 1024;
      *(_DWORD *)&buf[16] = 3;
      _os_log_debug_impl(&dword_227BD1000, v67, OS_LOG_TYPE_DEBUG, "(moduleType=%d) tryCount = %d (max tries %d)", buf, 0x14u);
    }

    clock_gettime(_CLOCK_REALTIME, &__tp);
    v68 = gLogObjects;
    v69 = gNumLogObjects;
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v70 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v68;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v69;
        _os_log_error_impl(&dword_227BD1000, v62, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
      }
      v71 = v62;
      v70 = v62;
    }
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)&buf[4] = a5;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = 478;
      *(_WORD *)&buf[14] = 2048;
      *(_QWORD *)&buf[16] = __tp.tv_sec;
      *(_WORD *)&buf[24] = 2048;
      *(_QWORD *)&buf[26] = __tp.tv_nsec / 0xF4240uLL;
      _os_log_impl(&dword_227BD1000, v70, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) %d: %ld.%03llu", buf, 0x22u);
    }

    if (!-[ACCHWComponentAuthService _verifyDeviceInfo:](self, "_verifyDeviceInfo:", -[ACCHWComponentAuthServiceParams moduleAuthService](v14, "moduleAuthService")))
    {
      v75 = gLogObjects;
      v76 = gNumLogObjects;
      if (gLogObjects && gNumLogObjects >= 4)
      {
        v77 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)&buf[4] = v75;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v76;
          _os_log_error_impl(&dword_227BD1000, v62, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v82 = v62;
        v77 = v62;
      }
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = a5;
        _os_log_error_impl(&dword_227BD1000, v77, OS_LOG_TYPE_ERROR, "(moduleType=%d) authError = eAuthDeviceInfoError after _verifyDeviceInfo", buf, 8u);
      }
      v21 = 1;
      goto LABEL_206;
    }
    clock_gettime(_CLOCK_REALTIME, &__tp);
    v72 = gLogObjects;
    v73 = gNumLogObjects;
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v74 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v72;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v73;
        _os_log_error_impl(&dword_227BD1000, v62, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
      }
      v78 = v62;
      v74 = v62;
    }
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)&buf[4] = a5;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = 487;
      *(_WORD *)&buf[14] = 2048;
      *(_QWORD *)&buf[16] = __tp.tv_sec;
      *(_WORD *)&buf[24] = 2048;
      *(_QWORD *)&buf[26] = __tp.tv_nsec / 0xF4240uLL;
      _os_log_impl(&dword_227BD1000, v74, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) %d: %ld.%03llu", buf, 0x22u);
    }

    if (!-[ACCHWComponentAuthService _verifyDeviceIDSN:](self, "_verifyDeviceIDSN:", -[ACCHWComponentAuthServiceParams moduleAuthService](v14, "moduleAuthService")))
    {
      v83 = gLogObjects;
      v84 = gNumLogObjects;
      if (gLogObjects && gNumLogObjects >= 4)
      {
        v77 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)&buf[4] = v83;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v84;
          _os_log_error_impl(&dword_227BD1000, v62, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v89 = v62;
        v77 = v62;
      }
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = a5;
        _os_log_error_impl(&dword_227BD1000, v77, OS_LOG_TYPE_ERROR, "(moduleType=%d) authError = eNoDeviceIDSNError after _verifyDeviceIDSN", buf, 8u);
      }
      v21 = 18;
      goto LABEL_206;
    }
    clock_gettime(_CLOCK_REALTIME, &__tp);
    v79 = gLogObjects;
    v80 = gNumLogObjects;
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v81 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v79;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v80;
        _os_log_error_impl(&dword_227BD1000, v62, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
      }
      v85 = v62;
      v81 = v62;
    }
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)&buf[4] = a5;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = 496;
      *(_WORD *)&buf[14] = 2048;
      *(_QWORD *)&buf[16] = __tp.tv_sec;
      *(_WORD *)&buf[24] = 2048;
      *(_QWORD *)&buf[26] = __tp.tv_nsec / 0xF4240uLL;
      _os_log_impl(&dword_227BD1000, v81, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) %d: %ld.%03llu", buf, 0x22u);
    }

    v86 = -[ACCHWComponentAuthService _verifyCertificate:](self, "_verifyCertificate:", v14);
    if (!(_DWORD)v86)
      break;
    v21 = v86;
    v87 = gLogObjects;
    v88 = gNumLogObjects;
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v77 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v87;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v88;
        _os_log_error_impl(&dword_227BD1000, v62, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
      }
      v93 = v62;
      v77 = v62;
    }
    if (!os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      goto LABEL_206;
    *(_DWORD *)buf = v158;
    *(_DWORD *)&buf[4] = a5;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v21;
    v94 = v77;
    v95 = "(moduleType=%d) authError %d after _verifyCertificate";
LABEL_205:
    _os_log_error_impl(&dword_227BD1000, v94, OS_LOG_TYPE_ERROR, v95, buf, 0xEu);
LABEL_206:

    if (++v61 >= 2)
      goto LABEL_211;
  }
  if (!-[ACCHWComponentAuthServiceParams skipComms](v14, "skipComms"))
  {
    clock_gettime(_CLOCK_REALTIME, &__tp);
    v90 = gLogObjects;
    v91 = gNumLogObjects;
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v92 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v90;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v91;
        _os_log_error_impl(&dword_227BD1000, v62, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
      }
      v96 = v62;
      v92 = v62;
    }
    if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)&buf[4] = a5;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = 505;
      *(_WORD *)&buf[14] = 2048;
      *(_QWORD *)&buf[16] = __tp.tv_sec;
      *(_WORD *)&buf[24] = 2048;
      *(_QWORD *)&buf[26] = __tp.tv_nsec / 0xF4240uLL;
      _os_log_impl(&dword_227BD1000, v92, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) %d: %ld.%03llu", buf, 0x22u);
    }

    v97 = -[ACCHWComponentAuthService _verifySignature:](self, "_verifySignature:", v14);
    if ((_DWORD)v97)
    {
      v21 = v97;
      v98 = gLogObjects;
      v99 = gNumLogObjects;
      if (gLogObjects && gNumLogObjects >= 4)
      {
        v77 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)&buf[4] = v98;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v99;
          _os_log_error_impl(&dword_227BD1000, v62, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v107 = v62;
        v77 = v62;
      }
      if (!os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
        goto LABEL_206;
      *(_DWORD *)buf = v158;
      *(_DWORD *)&buf[4] = a5;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v21;
      v94 = v77;
      v95 = "(moduleType=%d) authError %d after _verifySignature";
      goto LABEL_205;
    }
  }
  clock_gettime(_CLOCK_REALTIME, &__tp);
  v100 = gLogObjects;
  v101 = gNumLogObjects;
  if (gLogObjects && gNumLogObjects >= 4)
  {
    v102 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v100;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v101;
      _os_log_error_impl(&dword_227BD1000, v62, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
    }
    v103 = v62;
    v102 = v62;
  }
  if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)&buf[4] = a5;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = 514;
    *(_WORD *)&buf[14] = 2048;
    *(_QWORD *)&buf[16] = __tp.tv_sec;
    *(_WORD *)&buf[24] = 2048;
    *(_QWORD *)&buf[26] = __tp.tv_nsec / 0xF4240uLL;
    _os_log_impl(&dword_227BD1000, v102, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) %d: %ld.%03llu", buf, 0x22u);
  }

  v21 = -[ACCHWComponentAuthService _verifyModuleCertificate:forModuleType:](self, "_verifyModuleCertificate:forModuleType:", v14, a5);
  if ((_DWORD)v21)
  {
    v104 = gLogObjects;
    v105 = gNumLogObjects;
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v77 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v104;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v105;
        _os_log_error_impl(&dword_227BD1000, v62, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
      }
      v106 = v62;
      v77 = v62;
    }
    if (!os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      goto LABEL_206;
    *(_DWORD *)buf = v158;
    *(_DWORD *)&buf[4] = a5;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v21;
    v94 = v77;
    v95 = "(moduleType=%d) authError = %d after _verifyModuleCertificate";
    goto LABEL_205;
  }
LABEL_211:
  clock_gettime(_CLOCK_REALTIME, &__tp);
  if (gLogObjects && gNumLogObjects >= 4)
  {
    v109 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ACASignVeridianChallenge_cold_1();
    v109 = MEMORY[0x24BDACB70];
    v114 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)&buf[4] = a5;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = 527;
    *(_WORD *)&buf[14] = 2048;
    *(_QWORD *)&buf[16] = __tp.tv_sec;
    *(_WORD *)&buf[24] = 2048;
    *(_QWORD *)&buf[26] = __tp.tv_nsec / 0xF4240uLL;
    _os_log_impl(&dword_227BD1000, v109, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) %d: %ld.%03llu", buf, 0x22u);
  }

  v22 = -[ACCHWComponentAuthService _verifyModuleFDR:forModuleType:](self, "_verifyModuleFDR:forModuleType:", v14, a5);
LABEL_252:
  if (a5 == 2)
  {
    clock_gettime(_CLOCK_REALTIME, &__tp);
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v118 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        ACASignVeridianChallenge_cold_1();
      v118 = MEMORY[0x24BDACB70];
      v119 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)&buf[4] = 2;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = 536;
      *(_DWORD *)buf = 67109888;
      *(_QWORD *)&buf[16] = __tp.tv_sec;
      *(_WORD *)&buf[14] = 2048;
      *(_WORD *)&buf[24] = 2048;
      *(_QWORD *)&buf[26] = __tp.tv_nsec / 0xF4240uLL;
      _os_log_impl(&dword_227BD1000, v118, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) %d: %ld.%03llu", buf, 0x22u);
    }

    if (!(_DWORD)v21)
    {
      -[ACCHWComponentAuthServiceParams certificate](v14, "certificate");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[ACCHWComponentAuthService _verifyBatteryMatch:](self, "_verifyBatteryMatch:", v120);

    }
  }
LABEL_266:
  v121 = v21 == 0;
  if (-[ACCHWComponentAuthServiceParams skipComms](v14, "skipComms"))
  {
    v122 = v21 == 0;
    v121 = v122 ^ (v122 && valuePtr != 0);
    if (v122 && valuePtr != 0)
      v21 = valuePtr;
    else
      v21 = v21;
  }
  v123 = v121 & v22;
  if ((_DWORD)v21 != 22 && !v123)
    -[ACCHWComponentAuthService _notifyComponentAuthFailure](self, "_notifyComponentAuthFailure");
  if (v163)
  {
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v124 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        ACASignVeridianChallenge_cold_1();
      v124 = MEMORY[0x24BDACB70];
      v125 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = a5;
      _os_log_impl(&dword_227BD1000, v124, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) updateRegistry", buf, 8u);
    }

    if (!-[ACCHWComponentAuthServiceParams moduleAuthService](v14, "moduleAuthService"))
      -[ACCHWComponentAuthServiceParams setModuleAuthService:](v14, "setModuleAuthService:", -[ACCHWComponentAuthService _findModuleAuthService:withAuthFlags:](self, "_findModuleAuthService:withAuthFlags:", a5, &v169));
    if (-[ACCHWComponentAuthServiceParams moduleAuthService](v14, "moduleAuthService", v158))
    {
      connect = 0;
      v126 = -[ACCHWComponentAuthServiceParams moduleAuthService](v14, "moduleAuthService");
      if (!IOServiceOpen(v126, *MEMORY[0x24BDAEC58], 0, &connect))
      {
        if (gLogObjects && gNumLogObjects >= 4)
        {
          v127 = *(id *)(gLogObjects + 24);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            ACASignVeridianChallenge_cold_1();
          v127 = MEMORY[0x24BDACB70];
          v128 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = a5;
          _os_log_impl(&dword_227BD1000, v127, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) updateRegistry: cpSetAuthStatus, cpSetTrustStatus", buf, 8u);
        }

        v129 = cpSetAuthStatus(connect, v121 & 1);
        if (v129)
        {
          v130 = v129;
          if (gLogObjects && gNumLogObjects >= 4)
          {
            v131 = *(id *)(gLogObjects + 24);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              ACASignVeridianChallenge_cold_1();
            v131 = MEMORY[0x24BDACB70];
            v132 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)&buf[4] = a5;
            *(_WORD *)&buf[8] = 1024;
            *(_DWORD *)&buf[10] = v130;
            _os_log_impl(&dword_227BD1000, v131, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) cpSetAuthStatus failed: 0x%x", buf, 0xEu);
          }

        }
        v133 = cpSetTrustStatus(connect, v121 & v22);
        if (v133)
        {
          v134 = v133;
          if (gLogObjects && gNumLogObjects >= 4)
          {
            v135 = *(id *)(gLogObjects + 24);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              ACASignVeridianChallenge_cold_1();
            v135 = MEMORY[0x24BDACB70];
            v136 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)&buf[4] = a5;
            *(_WORD *)&buf[8] = 1024;
            *(_DWORD *)&buf[10] = v134;
            _os_log_impl(&dword_227BD1000, v135, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) cpSetTrustStatus failed: 0x%x", buf, 0xEu);
          }

        }
        if (v123 && v159)
        {
          v137 = cpSetTrustStatusForUI(connect, 1u);
          if (v137)
          {
            v138 = v137;
            if (gLogObjects && gNumLogObjects >= 4)
            {
              v139 = *(id *)(gLogObjects + 24);
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                ACASignVeridianChallenge_cold_1();
              v139 = MEMORY[0x24BDACB70];
              v140 = MEMORY[0x24BDACB70];
            }
            if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = a5;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v138;
              _os_log_impl(&dword_227BD1000, v139, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) cpSetTrustStatusForUI failed: 0x%x", buf, 0xEu);
            }

          }
        }
        v141 = cpSetAuthError(connect, v21);
        if (v141)
        {
          v142 = v141;
          if (gLogObjects && gNumLogObjects >= 4)
          {
            v143 = *(id *)(gLogObjects + 24);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              ACASignVeridianChallenge_cold_1();
            v143 = MEMORY[0x24BDACB70];
            v144 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)&buf[4] = a5;
            *(_WORD *)&buf[8] = 1024;
            *(_DWORD *)&buf[10] = v142;
            _os_log_impl(&dword_227BD1000, v143, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) cpSetAuthError failed: 0x%x", buf, 0xEu);
          }

        }
        if (v21 > 0x1D)
          v145 = "UninitializedAuthError";
        else
          v145 = kACCTransport_IOAccessoryAuthCP_AuthError_Strings[v21];
        v146 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], v145, 0x8000100u);
        if (v146)
        {
          v147 = v146;
          cpSetAuthErrorDescription(connect, v146);
          CFRelease(v147);
        }
        IOServiceClose(connect);
      }
    }
  }
  if (v162)
  {
    v148 = systemInfo_getCurrentUnixTimeMS() - v160;
    if (v22)
      v149 = 2;
    else
      v149 = 1;
    -[ACCHWComponentAuthService _logToAnalytics:authError:fdrValidationStatus:authDurationInMS:](self, "_logToAnalytics:authError:fdrValidationStatus:authDurationInMS:", a5, v21, v149, v148, v158);
  }
  clock_gettime(_CLOCK_REALTIME, &__tp);
  if (gLogObjects && gNumLogObjects >= 4)
  {
    v150 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ACASignVeridianChallenge_cold_1();
    v150 = MEMORY[0x24BDACB70];
    v151 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)&buf[4] = a5;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = 625;
    *(_WORD *)&buf[14] = 2048;
    *(_QWORD *)&buf[16] = __tp.tv_sec;
    *(_WORD *)&buf[24] = 2048;
    *(_QWORD *)&buf[26] = __tp.tv_nsec / 0xF4240uLL;
    _os_log_impl(&dword_227BD1000, v150, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) %d: %ld.%03llu", buf, 0x22u);
  }

  if (gLogObjects && gNumLogObjects >= 4)
  {
    v152 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ACASignVeridianChallenge_cold_1();
    v152 = MEMORY[0x24BDACB70];
    v153 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v152, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)&buf[4] = a5;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v121 & 1;
    *(_WORD *)&buf[14] = 1024;
    *(_DWORD *)&buf[16] = v22;
    *(_WORD *)&buf[20] = 1024;
    *(_DWORD *)&buf[22] = v21;
    _os_log_impl(&dword_227BD1000, v152, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) Replying with authPassed = %d, fdrValid = %d, authError = %d", buf, 0x1Au);
  }

  -[ACCHWComponentAuthServiceParams certificate](v14, "certificate");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCHWComponentAuthServiceParams signature](v14, "signature");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2](v13, v121 & 1, v154, v155, v22, v21);

}

void __138__ACCHWComponentAuthService__authenticateModuleWithChallenge_completionHandler_moduleType_updateRegistry_updateUIProperty_logToAnalytics___block_invoke(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  int v5;
  __int128 v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  char v11;
  timespec __tp;
  char v13;
  uint8_t buf[16];
  _BYTE v15[32];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
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
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  unint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  __tp.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  __tp.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  clock_gettime(_CLOCK_REALTIME, &__tp);
  if (gLogObjects)
    v2 = gNumLogObjects < 4;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ACASignVeridianChallenge_cold_1();
    v4 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v4 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(a1 + 32);
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)&buf[4] = v5;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = 312;
    *(_WORD *)&buf[14] = 2048;
    *(_QWORD *)v15 = __tp.tv_sec;
    *(_WORD *)&v15[8] = 2048;
    *(_QWORD *)&v15[10] = __tp.tv_nsec / 0xF4240uLL;
    _os_log_impl(&dword_227BD1000, v4, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) %d: %ld.%03llu", buf, 0x22u);
  }

  v41 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v39 = v6;
  v40 = v6;
  v37 = v6;
  v38 = v6;
  v35 = v6;
  v36 = v6;
  v33 = v6;
  v34 = v6;
  v31 = v6;
  v32 = v6;
  v29 = v6;
  v30 = v6;
  v27 = v6;
  v28 = v6;
  v25 = v6;
  v26 = v6;
  v23 = v6;
  v24 = v6;
  v21 = v6;
  v22 = v6;
  v20 = v6;
  v18 = v6;
  v19 = v6;
  v16 = v6;
  v17 = v6;
  *(_OWORD *)v15 = v6;
  *(_OWORD *)&v15[16] = v6;
  *(_OWORD *)buf = v6;
  v13 = 0;
  objc_msgSend(MEMORY[0x24BE63540], "sharedDataAccessor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copyPathForPersonalizedData:error:", 2, 0);

  if (v8
    && (objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v8),
        (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = objc_retainAutorelease(v9);
    if (Img4DecodeInitManifest(objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), (uint64_t)buf))
    {
      v11 = 0;
    }
    else if (Img4DecodeGetBooleanFromSection((uint64_t)buf, 0, 1684104054, (BOOL *)&v13))
    {
      v11 = 0;
      v13 = 0;
    }
    else
    {
      v11 = v13 != 0;
    }
  }
  else
  {
    v11 = 0;
    v10 = 0;
  }

  _authenticateModuleWithChallenge_completionHandler_moduleType_updateRegistry_updateUIProperty_logToAnalytics__disableAuth = v11;
}

- (unsigned)_findModuleAuthService:(int)a3 withAuthFlags:(unsigned int *)a4
{
  const __CFDictionary *v6;
  kern_return_t MatchingServices;
  mach_error_t v8;
  BOOL v9;
  id v10;
  unsigned int v11;
  NSObject *v12;
  char *v13;
  io_object_t v14;
  io_registry_entry_t v15;
  const __CFAllocator *v16;
  NSObject *v17;
  const __CFNumber *CFProperty;
  const __CFNumber *v19;
  uint64_t v20;
  int v21;
  BOOL v22;
  NSObject *v23;
  NSObject *v24;
  unsigned int *v26;
  int valuePtr;
  io_iterator_t existing;
  uint8_t buf[4];
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = IOServiceMatching("AppleAuthCP");
  v26 = a4;
  if (!a4)
    return 0;
  valuePtr = -1431655766;
  existing = -1431655766;
  MatchingServices = IOServiceGetMatchingServices(*MEMORY[0x24BDD8B20], v6, &existing);
  if (MatchingServices)
  {
    v8 = MatchingServices;
    if (gLogObjects)
      v9 = gNumLogObjects < 4;
    else
      v9 = 1;
    if (v9)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        ACASignVeridianChallenge_cold_1();
      v12 = MEMORY[0x24BDACB70];
      v10 = MEMORY[0x24BDACB70];
    }
    else
    {
      v12 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = mach_error_string(v8);
      *(_DWORD *)buf = 67109378;
      LODWORD(v30) = a3;
      WORD2(v30) = 2080;
      *(_QWORD *)((char *)&v30 + 6) = v13;
      _os_log_impl(&dword_227BD1000, v12, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) Could not find authcp services: %s\n", buf, 0x12u);
    }

  }
  v14 = IOIteratorNext(existing);
  if (v14)
  {
    v15 = v14;
    v11 = 0;
    v16 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v17 = MEMORY[0x24BDACB70];
    while (1)
    {
      CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v15, CFSTR("flags"), v16, 0);
      if (CFProperty)
        break;
LABEL_37:
      IOObjectRelease(v15);
      v15 = IOIteratorNext(existing);
      if (!v15)
        goto LABEL_42;
    }
    v19 = CFProperty;
    if (CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr))
    {
      v20 = gLogObjects;
      v21 = gNumLogObjects;
      if (gLogObjects)
        v22 = gNumLogObjects < 4;
      else
        v22 = 1;
      if (v22)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)&v30 = v20;
          WORD4(v30) = 1024;
          *(_DWORD *)((char *)&v30 + 10) = v21;
          _os_log_error_impl(&dword_227BD1000, v17, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v23 = v17;
        v24 = v17;
      }
      else
      {
        v24 = *(id *)(gLogObjects + 24);
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109632;
        LODWORD(v30) = a3;
        WORD2(v30) = 1024;
        *(_DWORD *)((char *)&v30 + 6) = v15;
        WORD5(v30) = 1024;
        HIDWORD(v30) = valuePtr;
        _os_log_impl(&dword_227BD1000, v24, OS_LOG_TYPE_INFO, "(moduleType=%d) authCP service %d tmpAuthFlags == 0x%x", buf, 0x14u);
      }

      if (!a3)
      {
        if (BYTE2(valuePtr) << 16 != 0x10000)
          goto LABEL_36;
        goto LABEL_35;
      }
      if (a3 != 2)
      {
        if (a3 != 1 || BYTE2(valuePtr) << 16 != 196608)
          goto LABEL_36;
        goto LABEL_35;
      }
      if ((valuePtr & 0xFF000C) == 0x10008)
      {
LABEL_35:
        IOObjectRetain(v15);
        *v26 = valuePtr;
        v11 = v15;
      }
    }
LABEL_36:
    CFRelease(v19);
    goto LABEL_37;
  }
  v11 = 0;
LABEL_42:
  IOObjectRelease(existing);
  return v11;
}

- (BOOL)_verifyDeviceIDSN:(unsigned int)a3
{
  mach_error_t DeviceIDSN;
  BOOL v4;
  id v5;
  NSObject *v6;
  char *v7;
  CFIndex v9;
  UInt8 *v10;
  uint8_t buf[4];
  char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v9 = 0xAAAAAAAAAAAAAAAALL;
  v10 = (UInt8 *)0xAAAAAAAAAAAAAAAALL;
  DeviceIDSN = cpGetDeviceIDSN(a3, &v10, &v9);
  if (DeviceIDSN)
  {
    if (gLogObjects)
      v4 = gNumLogObjects < 4;
    else
      v4 = 1;
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        ACASignVeridianChallenge_cold_1();
      v6 = MEMORY[0x24BDACB70];
      v5 = MEMORY[0x24BDACB70];
    }
    else
    {
      v6 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = mach_error_string(DeviceIDSN);
      *(_DWORD *)buf = 136315138;
      v12 = v7;
      _os_log_impl(&dword_227BD1000, v6, OS_LOG_TYPE_DEFAULT, "Could not cpGetDeviceInfo: %s\n", buf, 0xCu);
    }

  }
  return DeviceIDSN == 0;
}

- (BOOL)_verifyDeviceInfo:(unsigned int)a3
{
  mach_error_t DeviceInfo;
  BOOL v4;
  id v5;
  NSObject *v6;
  char *v7;
  int v9;
  char v10;
  char v11;
  char v12;
  char v13;
  uint8_t buf[4];
  char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v13 = -86;
  v12 = -86;
  v11 = -86;
  v10 = -86;
  v9 = -1431655766;
  DeviceInfo = cpGetDeviceInfo(a3, &v13, &v12, &v11, &v10, &v9);
  if (DeviceInfo)
  {
    if (gLogObjects)
      v4 = gNumLogObjects < 4;
    else
      v4 = 1;
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        ACASignVeridianChallenge_cold_1();
      v6 = MEMORY[0x24BDACB70];
      v5 = MEMORY[0x24BDACB70];
    }
    else
    {
      v6 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = mach_error_string(DeviceInfo);
      *(_DWORD *)buf = 136315138;
      v15 = v7;
      _os_log_impl(&dword_227BD1000, v6, OS_LOG_TYPE_DEFAULT, "Could not cpGetDeviceInfo: %s\n", buf, 0xCu);
    }

  }
  return DeviceInfo == 0;
}

- (int)_verifyCertificate:(id)a3
{
  id v3;
  CFTypeRef v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  int v14;
  NSObject *v16;
  NSObject *v17;
  io_service_t v18;
  io_connect_t connect[4];

  v3 = a3;
  if ((objc_msgSend(v3, "authFlags") & 0xC) == 8)
  {
    logObjectForModule();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(connect[0]) = 0;
      _os_log_impl(&dword_227BD1000, v16, OS_LOG_TYPE_DEFAULT, "Flags indicate Veridian...do not call cpCopyCertificate()", (uint8_t *)connect, 2u);
    }

    v4 = 0;
    v8 = 0;
    v10 = 0;
    v6 = 0;
    goto LABEL_7;
  }
  v4 = cpCopyCertificate(objc_msgSend(v3, "moduleAuthService"));
  if (!v4)
  {
    logObjectForModule();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(connect[0]) = 0;
      _os_log_impl(&dword_227BD1000, v17, OS_LOG_TYPE_DEFAULT, "error getting certificate", (uint8_t *)connect, 2u);
    }
    v8 = 0;
    v10 = 0;
    v6 = 0;
    v14 = 3;
    goto LABEL_38;
  }
  objc_msgSend(MEMORY[0x24BE61578], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    logObjectForModule();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(connect[0]) = 0;
      _os_log_impl(&dword_227BD1000, v17, OS_LOG_TYPE_DEFAULT, "error getting MFAACertificateManager", (uint8_t *)connect, 2u);
    }
    v8 = 0;
    v10 = 0;
    v6 = 0;
    goto LABEL_34;
  }
  v6 = v5;
  v7 = objc_msgSend(v5, "copyParsedCertificateChainInfo:", v4);
  if (!v7)
  {
    logObjectForModule();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(connect[0]) = 0;
      _os_log_impl(&dword_227BD1000, v17, OS_LOG_TYPE_DEFAULT, "error parsing certificate", (uint8_t *)connect, 2u);
    }
    v8 = 0;
    goto LABEL_33;
  }
  v8 = (void *)v7;
  v9 = objc_msgSend(v6, "copyEvaluatedCertificateChainInfo:", v7);
  if (!v9)
  {
    logObjectForModule();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(connect[0]) = 0;
      _os_log_impl(&dword_227BD1000, v17, OS_LOG_TYPE_DEFAULT, "error evaluating certificate", (uint8_t *)connect, 2u);
    }
LABEL_33:
    v10 = 0;
LABEL_34:
    v14 = 4;
    goto LABEL_38;
  }
  v10 = (void *)v9;
  if ((MFAAVerifyCertificateSerialNumber() & 1) != 0)
  {
LABEL_7:
    objc_msgSend(v10, "objectForKey:", CFSTR("LeafCertData"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCertificate:", v11);

    objc_msgSend(v3, "setCertificateInfo:", v10);
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v12 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        ACASignVeridianChallenge_cold_1();
      v12 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[ACCHWComponentAuthService _verifyCertificate:].cold.1(v3);

    v14 = 0;
    goto LABEL_16;
  }
  logObjectForModule();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(connect[0]) = 0;
    _os_log_impl(&dword_227BD1000, v17, OS_LOG_TYPE_DEFAULT, "error verifying serial number", (uint8_t *)connect, 2u);
  }
  v14 = 5;
LABEL_38:

  connect[0] = 0;
  v18 = objc_msgSend(v3, "moduleAuthService");
  if (!IOServiceOpen(v18, *MEMORY[0x24BDAEC58], 0, connect))
  {
    cpClearCertificate(connect[0]);
    IOServiceClose(connect[0]);
  }
LABEL_16:
  if (v4)
    CFRelease(v4);

  return v14;
}

- (int)_verifySignature:(id)a3
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  io_service_t v7;
  kern_return_t v8;
  mach_error_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  char *v13;
  int v14;
  id v15;
  mach_port_t v16;
  const __CFData *v17;
  mach_error_t v18;
  NSObject *v19;
  id v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  NSObject *v24;
  id v25;
  char *v26;
  id v28;
  void *v29;
  void *v30;
  int v31;
  NSObject *v32;
  id v33;
  const __CFString *v34;
  CFDataRef v35;
  timespec __tp;
  io_connect_t connect;
  uint8_t buf[4];
  _BYTE v39[14];
  __int16 v40;
  unint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  connect = -1431655766;
  __tp.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  __tp.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  clock_gettime(_CLOCK_REALTIME, &__tp);
  if (gLogObjects)
    v4 = gNumLogObjects < 4;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ACASignVeridianChallenge_cold_1();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v39 = 793;
    *(_WORD *)&v39[4] = 2048;
    *(_QWORD *)&v39[6] = __tp.tv_sec;
    v40 = 2048;
    v41 = __tp.tv_nsec / 0xF4240uLL;
    _os_log_impl(&dword_227BD1000, v6, OS_LOG_TYPE_DEFAULT, "_verifySignature %d: %ld.%03llu", buf, 0x1Cu);
  }

  v7 = objc_msgSend(v3, "moduleAuthService");
  v8 = IOServiceOpen(v7, *MEMORY[0x24BDAEC58], 0, &connect);
  if (!v8)
  {
    v35 = (CFDataRef)0xAAAAAAAAAAAAAAAALL;
    clock_gettime(_CLOCK_REALTIME, &__tp);
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v11 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        ACASignVeridianChallenge_cold_1();
      v11 = MEMORY[0x24BDACB70];
      v15 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v39 = 804;
      *(_WORD *)&v39[4] = 2048;
      *(_QWORD *)&v39[6] = __tp.tv_sec;
      v40 = 2048;
      v41 = __tp.tv_nsec / 0xF4240uLL;
      _os_log_impl(&dword_227BD1000, v11, OS_LOG_TYPE_DEFAULT, "_verifySignature %d: %ld.%03llu", buf, 0x1Cu);
    }

    v16 = connect;
    objc_msgSend(v3, "challenge");
    v17 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    v18 = cpCreateSignature(v16, v17, &v35);

    IOServiceClose(connect);
    if ((v18 & 0xE3FFBF00) == 0xE3FF8000)
    {
      if (gLogObjects && gNumLogObjects >= 4)
      {
        v19 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          ACASignVeridianChallenge_cold_1();
        v19 = MEMORY[0x24BDACB70];
        v20 = MEMORY[0x24BDACB70];
      }
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        goto LABEL_51;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v39 = v18;
      v21 = "error generating signature: auth cp error code %#x\n";
      v22 = v19;
      v23 = 8;
    }
    else
    {
      if (!v18)
      {
        clock_gettime(_CLOCK_REALTIME, &__tp);
        if (gLogObjects && gNumLogObjects >= 4)
        {
          v24 = *(id *)(gLogObjects + 24);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            ACASignVeridianChallenge_cold_1();
          v24 = MEMORY[0x24BDACB70];
          v28 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109632;
          *(_DWORD *)v39 = 817;
          *(_WORD *)&v39[4] = 2048;
          *(_QWORD *)&v39[6] = __tp.tv_sec;
          v40 = 2048;
          v41 = __tp.tv_nsec / 0xF4240uLL;
          _os_log_impl(&dword_227BD1000, v24, OS_LOG_TYPE_DEFAULT, "_verifySignature %d: %ld.%03llu", buf, 0x1Cu);
        }

        objc_msgSend(v3, "certificate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "challenge");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = MFAAVerifyNonceSignature();

        if (gLogObjects && gNumLogObjects >= 4)
        {
          v32 = *(id *)(gLogObjects + 24);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            ACASignVeridianChallenge_cold_1();
          v32 = MEMORY[0x24BDACB70];
          v33 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v34 = CFSTR("no");
          if (v31)
            v34 = CFSTR("yes");
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v39 = v34;
          _os_log_impl(&dword_227BD1000, v32, OS_LOG_TYPE_DEFAULT, "signatureValid ? %@", buf, 0xCu);
        }

        if (v31)
          v14 = 0;
        else
          v14 = 12;
        v19 = v35;
        objc_msgSend(v3, "setSignature:", v35, v35);
        goto LABEL_52;
      }
      if (gLogObjects && gNumLogObjects >= 4)
      {
        v19 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          ACASignVeridianChallenge_cold_1();
        v19 = MEMORY[0x24BDACB70];
        v25 = MEMORY[0x24BDACB70];
      }
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
LABEL_51:
        v14 = 11;
LABEL_52:

        goto LABEL_53;
      }
      v26 = mach_error_string(v18);
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v39 = v26;
      v21 = "error generating signature: %s\n";
      v22 = v19;
      v23 = 12;
    }
    _os_log_impl(&dword_227BD1000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
    goto LABEL_51;
  }
  v9 = v8;
  if (gLogObjects && gNumLogObjects >= 4)
  {
    v10 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ACASignVeridianChallenge_cold_1();
    v10 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v13 = mach_error_string(v9);
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)v39 = v13;
    _os_log_impl(&dword_227BD1000, v10, OS_LOG_TYPE_DEFAULT, "could not open service: %s\n", buf, 0xCu);
  }

  v14 = 23;
LABEL_53:

  return v14;
}

- (int)_signChallenge:(id)a3
{
  id v3;
  io_service_t v4;
  kern_return_t v5;
  mach_error_t v6;
  BOOL v7;
  id v8;
  mach_port_t v9;
  const __CFData *v10;
  mach_error_t v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  id v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  CFDataRef v19;
  void *v20;
  NSObject *v21;
  id v22;
  char *v23;
  id v25;
  char *v26;
  id v27;
  char *v28;
  CFDataRef v29;
  io_connect_t connect;
  uint8_t buf[4];
  char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  connect = -1431655766;
  v4 = objc_msgSend(v3, "moduleAuthService");
  v5 = IOServiceOpen(v4, *MEMORY[0x24BDAEC58], 0, &connect);
  if (!v5)
  {
    v29 = (CFDataRef)0xAAAAAAAAAAAAAAAALL;
    v9 = connect;
    objc_msgSend(v3, "challenge");
    v10 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    v11 = cpCreateSignature(v9, v10, &v29);

    IOServiceClose(connect);
    if ((v11 & 0xE3FFBF00) == 0xE3FF8000)
    {
      if (gLogObjects && gNumLogObjects >= 4)
      {
        v12 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          ACASignVeridianChallenge_cold_1();
        v12 = MEMORY[0x24BDACB70];
        v15 = MEMORY[0x24BDACB70];
      }
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        goto LABEL_35;
      *(_DWORD *)buf = 67109120;
      LODWORD(v32) = v11;
      v16 = "error generating signature: auth cp error code %#x\n";
      v17 = v12;
      v18 = 8;
    }
    else
    {
      if (!v11)
      {
        v19 = v29;
        objc_msgSend(v3, "setSignature:", v29);

        v20 = (void *)cpCopyDeviceNonce(objc_msgSend(v3, "moduleAuthService"));
        objc_msgSend(v3, "setDeviceNonce:", v20);

        if (gLogObjects && gNumLogObjects >= 4)
        {
          v21 = *(id *)(gLogObjects + 24);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            ACASignVeridianChallenge_cold_1();
          v21 = MEMORY[0x24BDACB70];
          v25 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v3, "signature");
          v26 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v32 = v26;
          _os_log_impl(&dword_227BD1000, v21, OS_LOG_TYPE_DEFAULT, "Battery signature = %@", buf, 0xCu);

        }
        if (gLogObjects && gNumLogObjects >= 4)
        {
          v12 = *(id *)(gLogObjects + 24);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            ACASignVeridianChallenge_cold_1();
          v12 = MEMORY[0x24BDACB70];
          v27 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v3, "deviceNonce");
          v28 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v32 = v28;
          _os_log_impl(&dword_227BD1000, v12, OS_LOG_TYPE_DEFAULT, "Battery device nonce = %@", buf, 0xCu);

        }
        v14 = 0;
        goto LABEL_36;
      }
      if (gLogObjects && gNumLogObjects >= 4)
      {
        v12 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          ACASignVeridianChallenge_cold_1();
        v12 = MEMORY[0x24BDACB70];
        v22 = MEMORY[0x24BDACB70];
      }
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
LABEL_35:
        v14 = 11;
LABEL_36:

        goto LABEL_37;
      }
      v23 = mach_error_string(v11);
      *(_DWORD *)buf = 136315138;
      v32 = v23;
      v16 = "error generating signature: %s\n";
      v17 = v12;
      v18 = 12;
    }
    _os_log_impl(&dword_227BD1000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
    goto LABEL_35;
  }
  v6 = v5;
  if (gLogObjects)
    v7 = gNumLogObjects < 4;
  else
    v7 = 1;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ACASignVeridianChallenge_cold_1();
    v13 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  else
  {
    v13 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[ACCHWComponentAuthService _signChallenge:].cold.5(v6, v13);

  v14 = 23;
LABEL_37:

  return v14;
}

- (int)_verifyModuleCertificate:(id)a3 forModuleType:(int)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  char v24;
  void *v25;
  NSObject *v26;
  id v27;
  int v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  int v56;
  __int16 v57;
  int v58;
  __int16 v59;
  int v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "certificateInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    logObjectForModule();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      -[ACCHWComponentAuthService _verifyModuleCertificate:forModuleType:].cold.1();
    goto LABEL_65;
  }
  v7 = (void *)MEMORY[0x24BE61578];
  objc_msgSend(v5, "certificateInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isMFi2_3CertInfo:", v8);

  v10 = (void *)MEMORY[0x24BE61578];
  objc_msgSend(v5, "certificateInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isComponentCertInfo:", v11);

  if (gLogObjects && gNumLogObjects >= 4)
  {
    v13 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ACASignVeridianChallenge_cold_1();
    v13 = MEMORY[0x24BDACB70];
    v14 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v55 = 67109632;
    v56 = a4;
    v57 = 1024;
    v58 = v9;
    v59 = 1024;
    v60 = v12;
    _os_log_impl(&dword_227BD1000, v13, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) mfi2_3:%d, mfi4:%d", (uint8_t *)&v55, 0x14u);
  }

  if (!v9)
  {
    if (!v12)
    {
LABEL_55:
      v16 = 0;
      goto LABEL_56;
    }
    objc_msgSend(v5, "certificateInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", CFSTR("ExtensionValue"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      logObjectForModule();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[ACCHWComponentAuthService _verifyModuleCertificate:forModuleType:].cold.6();
      goto LABEL_47;
    }
    if (a4 == 2)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", "Battery", 7);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v18, "isEqualToData:", v23);

      v16 = 0;
      if ((v24 & 1) != 0)
        goto LABEL_32;
LABEL_56:
      logObjectForModule();
      v26 = objc_claimAutoreleasedReturnValue();
      v28 = 16;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[ACCHWComponentAuthService _verifyModuleCertificate:forModuleType:].cold.3();
      goto LABEL_58;
    }
    if (a4 != 1)
      goto LABEL_54;
    systemInfo_copyDeviceClass();
    v19 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject isEqualToString:](v19, "isEqualToString:", CFSTR("iPhone")))
    {
      v20 = (void *)MEMORY[0x24BDBCE50];
      v21 = "Phone Display";
      v22 = 13;
    }
    else
    {
      if (!-[NSObject isEqualToString:](v19, "isEqualToString:", CFSTR("iPad")))
      {
LABEL_44:
        logObjectForModule();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          -[ACCHWComponentAuthService _verifyModuleCertificate:forModuleType:].cold.7(v30, v31, v32, v33, v34, v35, v36, v37);

LABEL_47:
        v28 = 16;
        goto LABEL_60;
      }
      v20 = (void *)MEMORY[0x24BDBCE50];
      v21 = "iPad Display";
      v22 = 12;
    }
    objc_msgSend(v20, "dataWithBytes:length:", v21, v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      if (objc_msgSend(v18, "isEqualToData:", v25))
      {

        v16 = 0;
        goto LABEL_32;
      }
      if (gLogObjects && gNumLogObjects >= 4)
      {
        v29 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          ACASignVeridianChallenge_cold_1();
        v29 = MEMORY[0x24BDACB70];
        v38 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[ACCHWComponentAuthService _verifyModuleCertificate:forModuleType:].cold.8((uint64_t)v18, v29, v39, v40, v41, v42, v43, v44);

LABEL_54:
      goto LABEL_55;
    }
    goto LABEL_44;
  }
  objc_msgSend(v5, "certificate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MFAACreateCapsFromAuthCert();

  if (!v16)
  {
    logObjectForModule();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      -[ACCHWComponentAuthService _verifyModuleCertificate:forModuleType:].cold.2();
LABEL_65:

    v28 = 13;
    goto LABEL_60;
  }
  if (a4 == 1)
  {
    if ((MFAAIsAppleTouchControllerModule() & 1) != 0)
      goto LABEL_32;
    goto LABEL_56;
  }
  if (a4)
    goto LABEL_56;
  if ((objc_msgSend(v5, "authFlags") & 0xC) == 8)
  {
    logObjectForModule();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      -[ACCHWComponentAuthService _verifyModuleCertificate:forModuleType:].cold.4(v47, v48, v49, v50, v51, v52, v53, v54);

    v28 = 0;
    goto LABEL_59;
  }
  if ((MFAAIsAppleBatteryModule() & 1) == 0)
    goto LABEL_56;
LABEL_32:
  if (gLogObjects && gNumLogObjects >= 4)
  {
    v26 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ACASignVeridianChallenge_cold_1();
    v26 = MEMORY[0x24BDACB70];
    v27 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v55 = 67109120;
    v56 = a4;
    _os_log_impl(&dword_227BD1000, v26, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) Success: validated cert caps", (uint8_t *)&v55, 8u);
  }
  v28 = 0;
LABEL_58:

  if (v16)
LABEL_59:
    MFAADeallocAuthCertCaps();
LABEL_60:

  return v28;
}

- (BOOL)_verifyModuleFDR:(id)a3 forModuleType:(int)a4
{
  id v5;
  int v6;
  void *v7;
  const __CFData *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  const __CFData *v18;
  const __CFData *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  char v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  id v45;
  void *v46;
  void *v47;
  NSObject *v48;
  id v49;
  NSObject *v51;
  NSObject *v52;
  NSObject *v53;
  uint8_t buf[4];
  int v55;
  __int16 v56;
  int v57;
  const __CFString *v58;
  _QWORD v59[2];

  v59[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v58 = CFSTR("CopyAllowUnsealed");
  v59[0] = MEMORY[0x24BDBD1C8];
  v6 = 1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v59, &v58, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    if (a4 == 2)
    {
      v6 = 0;
    }
    else
    {
      if (a4 != 1)
      {
        v8 = 0;
        goto LABEL_58;
      }
      v6 = 1;
    }
  }
  v8 = (const __CFData *)AMFDRSealingMapCopyLocalDataForClass();
  if (!v8)
  {
    logObjectForModule();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      -[ACCHWComponentAuthService _verifyModuleFDR:forModuleType:].cold.1();

    v8 = 0;
    goto LABEL_44;
  }
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BE61578], "sharedManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
      goto LABEL_59;
    objc_msgSend(v5, "challenge");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22
      || (objc_msgSend(v5, "signature"), v23 = (void *)objc_claimAutoreleasedReturnValue(), v23, !v23)
      || (objc_msgSend(v5, "deviceNonce"), v24 = (void *)objc_claimAutoreleasedReturnValue(), v24, !v24))
    {
LABEL_59:
      v6 = 1;
      goto LABEL_25;
    }
    v25 = objc_msgSend(v21, "copyParsedCertificateChainInfo:", v8);
    if (v25)
    {
      v26 = v25;
      v27 = objc_msgSend(v21, "copyEvaluatedCertificateChainInfo:", v25);
      if (v27)
      {
        v28 = v27;
        objc_msgSend(v5, "deviceNonce");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "challenge");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "createVeridianNonce:withChallenge:", v29, v30);
        v31 = objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          objc_msgSend(v5, "signature");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v21, "verifyNonceSignature:nonce:signature:", v28, v31, v32);

          if ((v33 & 1) != 0)
          {
            -[NSObject objectForKey:](v28, "objectForKey:", CFSTR("LeafCertData"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setCertificate:", v34);

            objc_msgSend(v5, "setCertificateInfo:", v28);
            v6 = 2;
LABEL_24:

LABEL_25:
            goto LABEL_58;
          }
          logObjectForModule();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            -[ACCHWComponentAuthService _verifyModuleFDR:forModuleType:].cold.11();

        }
        else
        {
          logObjectForModule();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            -[ACCHWComponentAuthService _verifyModuleFDR:forModuleType:].cold.10();
        }

      }
      else
      {
        logObjectForModule();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          -[ACCHWComponentAuthService _verifyModuleCertificate:forModuleType:].cold.1();
      }

    }
    else
    {
      logObjectForModule();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[ACCHWComponentAuthService _verifyModuleFDR:forModuleType:].cold.6();
    }
    v6 = 1;
    goto LABEL_24;
  }
  objc_msgSend(v5, "certificate");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9
    || (v10 = (void *)v9,
        objc_msgSend(v5, "certificateInfo"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        !v11))
  {
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v35 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        ACASignVeridianChallenge_cold_1();
      v35 = MEMORY[0x24BDACB70];
      v45 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[ACCHWComponentAuthService _verifyModuleFDR:forModuleType:].cold.2();
LABEL_43:

LABEL_44:
    v6 = 1;
    goto LABEL_58;
  }
  v12 = (void *)MEMORY[0x24BE61578];
  objc_msgSend(v5, "certificateInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isMFi2_3CertInfo:", v13);

  v15 = (void *)MEMORY[0x24BE61578];
  objc_msgSend(v5, "certificateInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isComponentCertInfo:", v16);

  if (v14)
  {
    v18 = copyCertificateForFDRData(v8);
    if (v18)
    {
      v19 = v18;
      objc_msgSend(v5, "certificate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((-[__CFData isEqualToData:](v19, "isEqualToData:", v20) & 1) != 0)
      {
        v17 = 1;
      }
      else
      {
        objc_msgSend(v5, "certificateInfo");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "objectForKey:", CFSTR("FullCertData"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[__CFData isEqualToData:](v19, "isEqualToData:", v47);

      }
      goto LABEL_47;
    }
    logObjectForModule();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[ACCHWComponentAuthService _verifyModuleFDR:forModuleType:].cold.4();
    goto LABEL_43;
  }
  if (v17)
  {
    objc_msgSend(MEMORY[0x24BE61578], "sharedManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (!v36)
    {
      v17 = 0;
      v44 = 0;
      v6 = 1;
LABEL_36:

      if (!v44)
        goto LABEL_58;
      goto LABEL_47;
    }
    v38 = objc_msgSend(v36, "copyParsedCertificateChainInfo:", v8);
    if (v38)
    {
      v39 = v38;
      v40 = (void *)objc_msgSend(v37, "copyEvaluatedCertificateChainInfo:", v38);
      if (v40)
      {
        v41 = v40;
        objc_msgSend(v40, "objectForKey:", CFSTR("LeafCertData"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "certificate");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v42, "isEqualToData:", v43);

        v6 = 0;
        v44 = 1;
LABEL_35:

        goto LABEL_36;
      }
      logObjectForModule();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        -[ACCHWComponentAuthService _verifyModuleCertificate:forModuleType:].cold.1();

    }
    else
    {
      logObjectForModule();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        -[ACCHWComponentAuthService _verifyModuleFDR:forModuleType:].cold.6();
    }
    v17 = 0;
    v44 = 0;
    v6 = 1;
    goto LABEL_35;
  }
LABEL_47:
  if (gLogObjects && gNumLogObjects >= 4)
  {
    v48 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ACASignVeridianChallenge_cold_1();
    v48 = MEMORY[0x24BDACB70];
    v49 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v55 = a4;
    v56 = 1024;
    v57 = v17;
    _os_log_impl(&dword_227BD1000, v48, OS_LOG_TYPE_DEFAULT, "(moduleType=%d) equal:%d", buf, 0xEu);
  }

  if (v17)
    v6 = 2;
  else
    v6 = 1;
LABEL_58:

  return v6 == 2;
}

- (BOOL)_getForVeridianFDRData:(id)a3 intermediateCert:(id *)a4 leafCert:(id *)a5
{
  id v7;
  unint64_t v8;
  id v9;
  unint64_t v10;
  BOOL v11;
  _QWORD v13[2];
  _QWORD v14[2];
  unint64_t v15[3];

  memset(v15, 170, sizeof(v15));
  v7 = objc_retainAutorelease(a3);
  v14[0] = objc_msgSend(v7, "bytes");
  v14[1] = objc_msgSend(v7, "length");
  if (DERDecodeItem((uint64_t)v14, v15)
    || v15[0] != 0x2000000000000010
    || (v8 = v15[1] - v14[0] + v15[2], v8 > objc_msgSend(v7, "length"))
    || (objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v14[0], v8),
        *a4 = (id)objc_claimAutoreleasedReturnValue(),
        v9 = objc_retainAutorelease(v7),
        v13[0] = objc_msgSend(v9, "bytes") + v8,
        v13[1] = objc_msgSend(v9, "length") - v8,
        DERDecodeItem((uint64_t)v13, v15))
    || v15[0] != 0x2000000000000010
    || (v10 = v15[1] - v13[0] + v15[2], v10 + v8 > objc_msgSend(v9, "length")))
  {
    NSLog(CFSTR("%s: error"), "-[ACCHWComponentAuthService _getForVeridianFDRData:intermediateCert:leafCert:]");
    v11 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v13[0], v10);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    v11 = 1;
  }

  return v11;
}

- (void)_notifyComponentAuthFailure
{
  BOOL v2;
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v2 = gNumLogObjects < 4;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ACASignVeridianChallenge_cold_1();
    v4 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v4 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "com.apple.accessories.hwComponent.isTrusted.failure";
    _os_log_impl(&dword_227BD1000, v4, OS_LOG_TYPE_DEFAULT, "Notifying clients of %s", (uint8_t *)&v5, 0xCu);
  }

  notify_post("com.apple.accessories.hwComponent.isTrusted.failure");
}

- (int)_verifyBatteryMatch:(id)a3
{
  const __CFData *v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  SecCertificateRef v7;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;
  int v12;
  int v13;
  int v14;
  timespec v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  __darwin_time_t tv_sec;
  __int16 v21;
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v16.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v16.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  v3 = (const __CFData *)a3;
  clock_gettime(_CLOCK_REALTIME, &v16);
  if (gLogObjects)
    v4 = gNumLogObjects < 4;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ACASignVeridianChallenge_cold_1();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    v18 = 1149;
    v19 = 2048;
    tv_sec = v16.tv_sec;
    v21 = 2048;
    v22 = v16.tv_nsec / 0xF4240uLL;
    _os_log_impl(&dword_227BD1000, v6, OS_LOG_TYPE_DEFAULT, "_verifyBatteryMatch %d: %ld.%03llu", buf, 0x1Cu);
  }

  v7 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x24BDBD240], v3);
  v8 = (void *)SecCertificateCopyComponentAttributes();
  objc_msgSend(v8, "objectForKey:", &unk_24F05B908);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v14 = 0;
    if (!v7)
      goto LABEL_26;
    goto LABEL_25;
  }
  v10 = MGGetBoolAnswer();
  if (objc_msgSend(v9, "BOOLValue"))
    v11 = v10 == 0;
  else
    v11 = 0;
  if (v11)
  {
    v14 = 28;
    if (!v7)
      goto LABEL_26;
    goto LABEL_25;
  }
  v12 = objc_msgSend(v9, "BOOLValue");
  if (v10)
    v13 = 27;
  else
    v13 = 0;
  if (v12)
    v14 = 0;
  else
    v14 = v13;
  if (v7)
LABEL_25:
    CFRelease(v7);
LABEL_26:

  return v14;
}

- (void)signVeridianChallenge:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  ACCHWComponentAuthServiceParams *v8;
  unsigned int v9;
  BOOL v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  int v15;
  NSObject *v16;
  uint64_t v17;
  int v18;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  BOOL v25;
  _BOOL4 v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  id v31;
  NSObject *v32;
  void (**v33)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void (**v39)(_QWORD, _QWORD, _QWORD, _QWORD);
  unsigned int v40;
  uint8_t buf[4];
  _BYTE v42[10];
  void *v43;
  __int16 v44;
  int v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  init_logging();
  v8 = objc_alloc_init(ACCHWComponentAuthServiceParams);
  v40 = -1431655766;
  -[ACCHWComponentAuthServiceParams setChallenge:](v8, "setChallenge:", v6);
  -[ACCHWComponentAuthServiceParams setModuleAuthService:](v8, "setModuleAuthService:", -[ACCHWComponentAuthService _findModuleAuthService:withAuthFlags:](self, "_findModuleAuthService:withAuthFlags:", 2, &v40));
  -[ACCHWComponentAuthServiceParams setAuthFlags:](v8, "setAuthFlags:", v40);
  v9 = -[ACCHWComponentAuthServiceParams moduleAuthService](v8, "moduleAuthService");
  if (gLogObjects)
    v10 = gNumLogObjects <= 3;
  else
    v10 = 1;
  v11 = !v10;
  v39 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v7;
  if (v9)
  {
    if (v11)
    {
      v12 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        ACASignVeridianChallenge_cold_1();
      v12 = MEMORY[0x24BDACB70];
      v14 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[ACCHWComponentAuthService signVeridianChallenge:completionHandler:].cold.3(v8);

    v15 = -1;
    v16 = MEMORY[0x24BDACB70];
    while (1)
    {
      v17 = gLogObjects;
      v18 = gNumLogObjects;
      if (!gLogObjects || gNumLogObjects < 4)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)v42 = v17;
          *(_WORD *)&v42[8] = 1024;
          LODWORD(v43) = v18;
          _os_log_error_impl(&dword_227BD1000, v16, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v20 = v16;
        v21 = v16;
      }
      else
      {
        v21 = *(id *)(gLogObjects + 24);
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v42 = v15 + 1;
        *(_WORD *)&v42[4] = 1024;
        *(_DWORD *)&v42[6] = 3;
        _os_log_debug_impl(&dword_227BD1000, v21, OS_LOG_TYPE_DEBUG, "tryCount = %d (max tries %d)", buf, 0xEu);
      }

      v22 = -[ACCHWComponentAuthService _signChallenge:](self, "_signChallenge:", v8);
      v23 = gLogObjects;
      v24 = gNumLogObjects;
      v25 = !gLogObjects || gNumLogObjects <= 3;
      v26 = !v25;
      if (!(_DWORD)v22)
        break;
      v27 = v22;
      if (v26)
      {
        v28 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)v42 = v23;
          *(_WORD *)&v42[8] = 1024;
          LODWORD(v43) = v24;
          _os_log_error_impl(&dword_227BD1000, v16, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v29 = v16;
        v28 = v16;
      }
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v42 = v27;
        _os_log_impl(&dword_227BD1000, v28, OS_LOG_TYPE_DEFAULT, "authError %d after _signChallenge", buf, 8u);
      }

      if (++v15 > 1)
        goto LABEL_59;
    }
    if (v26)
    {
      v13 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)v42 = v23;
        *(_WORD *)&v42[8] = 1024;
        LODWORD(v43) = v24;
        _os_log_error_impl(&dword_227BD1000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
      }
      v13 = MEMORY[0x24BDACB70];
      v31 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_227BD1000, v13, OS_LOG_TYPE_DEFAULT, "no error after _signChallenge!", buf, 2u);
    }
    v27 = 0;
  }
  else
  {
    if (v11)
    {
      v13 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        ACASignVeridianChallenge_cold_1();
      v13 = MEMORY[0x24BDACB70];
      v30 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_227BD1000, v13, OS_LOG_TYPE_DEFAULT, "ERROR No batteryAuth io_service_t is found!", buf, 2u);
    }
    v27 = 22;
  }

LABEL_59:
  if (gLogObjects && gNumLogObjects >= 4)
  {
    v32 = *(id *)(gLogObjects + 24);
    v33 = v39;
  }
  else
  {
    v33 = v39;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ACASignVeridianChallenge_cold_1();
    v32 = MEMORY[0x24BDACB70];
    v34 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    -[ACCHWComponentAuthServiceParams signature](v8, "signature");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACCHWComponentAuthServiceParams deviceNonce](v8, "deviceNonce");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)v42 = v35;
    *(_WORD *)&v42[8] = 2112;
    v43 = v36;
    v44 = 1024;
    v45 = v27;
    _os_log_impl(&dword_227BD1000, v32, OS_LOG_TYPE_DEFAULT, "signVeridianChallenge Replying with signature=%@, deviceNonce=%@, authError = %d", buf, 0x1Cu);

  }
  -[ACCHWComponentAuthServiceParams signature](v8, "signature");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCHWComponentAuthServiceParams deviceNonce](v8, "deviceNonce");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, void *, uint64_t))v33)[2](v33, v37, v38, v27);

}

- (void)verifyBatteryMatch:(id)a3 completionHandler:(id)a4
{
  id v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  BOOL v18;
  _BOOL4 v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  void (**v25)(_QWORD, _QWORD);
  id v26;
  id v27;
  uint8_t buf[4];
  _BYTE v29[10];
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v27 = a4;
  init_logging();
  v7 = -1;
  v8 = MEMORY[0x24BDACB70];
  while (1)
  {
    v9 = gLogObjects;
    v10 = gNumLogObjects;
    if (!gLogObjects || gNumLogObjects < 4)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)v29 = v9;
        *(_WORD *)&v29[8] = 1024;
        v30 = v10;
        _os_log_error_impl(&dword_227BD1000, v8, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
      }
      v12 = v8;
      v13 = v8;
    }
    else
    {
      v13 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v29 = v7 + 1;
      *(_WORD *)&v29[4] = 1024;
      *(_DWORD *)&v29[6] = 3;
      _os_log_debug_impl(&dword_227BD1000, v13, OS_LOG_TYPE_DEBUG, "tryCount = %d (max tries %d)", buf, 0xEu);
    }

    v14 = -[ACCHWComponentAuthService _verifyBatteryMatch:](self, "_verifyBatteryMatch:", v6);
    v15 = v14;
    v16 = gLogObjects;
    v17 = gNumLogObjects;
    v18 = !gLogObjects || gNumLogObjects <= 3;
    v19 = !v18;
    if (!(_DWORD)v14)
      break;
    if (v19)
    {
      v20 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)v29 = v16;
        *(_WORD *)&v29[8] = 1024;
        v30 = v17;
        _os_log_error_impl(&dword_227BD1000, v8, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
      }
      v21 = v8;
      v20 = v8;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v29 = v15;
      _os_log_impl(&dword_227BD1000, v20, OS_LOG_TYPE_DEFAULT, "authError %d after _verifyBatteryMatch", buf, 8u);
    }

    if (++v7 >= 2)
      goto LABEL_36;
  }
  if (v19)
  {
    v22 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)v29 = v16;
      *(_WORD *)&v29[8] = 1024;
      v30 = v17;
      _os_log_error_impl(&dword_227BD1000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
    }
    v22 = MEMORY[0x24BDACB70];
    v23 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_227BD1000, v22, OS_LOG_TYPE_DEFAULT, "no error after _verifyBatteryMatch!", buf, 2u);
  }

LABEL_36:
  if (gLogObjects && gNumLogObjects >= 4)
  {
    v24 = *(id *)(gLogObjects + 24);
    v25 = (void (**)(_QWORD, _QWORD))v27;
  }
  else
  {
    v25 = (void (**)(_QWORD, _QWORD))v27;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ACASignVeridianChallenge_cold_1();
    v24 = MEMORY[0x24BDACB70];
    v26 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v29 = v15;
    _os_log_impl(&dword_227BD1000, v24, OS_LOG_TYPE_DEFAULT, "verifyBatteryMatch Replying with authError = %d", buf, 8u);
  }

  v25[2](v25, v15);
}

- (void)_logToAnalytics:(int)a3 authError:(int)a4 fdrValidationStatus:(int)a5 authDurationInMS:(unint64_t)a6
{
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CFNumberRef BucketizedWiredAuthDuration;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  NSObject *v24;
  id v25;
  int v26;
  const __CFString *v27;
  __int16 v28;
  void *v29;
  _QWORD v30[4];
  _QWORD v31[5];

  v31[4] = *MEMORY[0x24BDAC8D0];
  v9 = (void *)MEMORY[0x24BDBCED8];
  v10 = CFSTR("Failed");
  if (!a4)
    v10 = CFSTR("Passed");
  v31[0] = v10;
  v30[0] = CFSTR("authState");
  v30[1] = CFSTR("authErrorDescription");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", kACCTransport_IOAccessoryAuthCP_AuthError_Strings[a4]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v11;
  v30[2] = CFSTR("isInductive");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v12;
  v30[3] = CFSTR("isPeriodic");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryWithDictionary:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  BucketizedWiredAuthDuration = acc_analytics_createBucketizedWiredAuthDuration(a6);
  objc_msgSend(v15, "setObject:forKey:", BucketizedWiredAuthDuration, CFSTR("wiredAuthDuration"));

  if ((a3 - 1) < 2)
  {
    v17 = kACCHWComponentAuthServiceInternalModule_Strings[a3];
LABEL_7:
    objc_msgSend(v15, "setObject:forKey:", v17, CFSTR("internalModuleType"));
    goto LABEL_8;
  }
  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v18, CFSTR("isBatteryModule"));

    v17 = CFSTR("Battery");
    goto LABEL_7;
  }
LABEL_8:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", kACCHWComponentAuthServiceFDRStatus_Strings[a5]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v19, CFSTR("FDRStatus"));

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "systemUptime");
  v22 = v21;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v23, CFSTR("Uptime"));

  if (gLogObjects && gNumLogObjects >= 4)
  {
    v24 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ACASignVeridianChallenge_cold_1();
    v24 = MEMORY[0x24BDACB70];
    v25 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 138412546;
    v27 = CFSTR("com.apple.accessories.authCPEvent");
    v28 = 2112;
    v29 = v15;
    _os_log_impl(&dword_227BD1000, v24, OS_LOG_TYPE_DEFAULT, "CoreAnalytics event: %@\neventDict: %@", (uint8_t *)&v26, 0x16u);
  }

  AnalyticsSendEvent();
}

- (void)_authenticateModuleWithChallenge:(int)a1 completionHandler:(NSObject *)a2 moduleType:updateRegistry:updateUIProperty:logToAnalytics:.cold.10(int a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109376;
  v2[1] = 2;
  v3 = 1024;
  v4 = a1;
  _os_log_error_impl(&dword_227BD1000, a2, OS_LOG_TYPE_ERROR, "(moduleType=%d) authError = %d after _verifyModuleCertificate", (uint8_t *)v2, 0xEu);
  OUTLINED_FUNCTION_2();
}

- (void)_authenticateModuleWithChallenge:(os_log_t)log completionHandler:moduleType:updateRegistry:updateUIProperty:logToAnalytics:.cold.14(uint8_t *buf, _DWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *a2 = 2;
  _os_log_error_impl(&dword_227BD1000, log, OS_LOG_TYPE_ERROR, "(moduleType=%d) authError = eNoDeviceIDSNError after _verifyDeviceIDSN", buf, 8u);
}

- (void)_authenticateModuleWithChallenge:(void *)a1 completionHandler:moduleType:updateRegistry:updateUIProperty:logToAnalytics:.cold.16(void *a1)
{
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;

  objc_msgSend(a1, "moduleAuthService");
  OUTLINED_FUNCTION_8();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0xEu);
  OUTLINED_FUNCTION_6();
}

- (void)_verifyCertificate:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;
  void *v6;

  objc_msgSend(a1, "certificate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0xCu);

  OUTLINED_FUNCTION_6();
}

- (void)_signChallenge:(mach_error_t)a1 .cold.5(mach_error_t a1, NSObject *a2)
{
  int v3;
  char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = mach_error_string(a1);
  _os_log_error_impl(&dword_227BD1000, a2, OS_LOG_TYPE_ERROR, "could not open service: %s\n", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_6();
}

- (void)_verifyModuleCertificate:forModuleType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_227BD1000, v0, v1, "(moduleType=%d) Error: Could not evaluate certificate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_verifyModuleCertificate:forModuleType:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_227BD1000, v0, v1, "(moduleType=%d) Error: Could not create caps from certificate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_verifyModuleCertificate:forModuleType:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_227BD1000, v0, v1, "(moduleType=%d) Failure: validated cert caps, but auth flags and certificate do not match", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_verifyModuleCertificate:(uint64_t)a3 forModuleType:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_227BD1000, a1, a3, "(moduleType=%d) Auth flags indicate Veridian...do not compare Roswell auth flags", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)_verifyModuleCertificate:forModuleType:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_227BD1000, v0, v1, "(moduleType=%d) Failure: cannot find component type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_verifyModuleCertificate:(uint64_t)a3 forModuleType:(uint64_t)a4 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_227BD1000, a1, a3, "(moduleType=%d) Failure: cannot find touchTypeData", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)_verifyModuleCertificate:(uint64_t)a3 forModuleType:(uint64_t)a4 .cold.8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_227BD1000, a2, a3, "(moduleType=%d) Failure: componentType:%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_verifyModuleFDR:forModuleType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1(&dword_227BD1000, v0, v1, "(moduleType=%d) %s: AMFDRSealingMapCopyLocalDataForClass: returned NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_verifyModuleFDR:forModuleType:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_227BD1000, v0, v1, "(moduleType=%d) No authIC cert to compare against FDR", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_verifyModuleFDR:forModuleType:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_227BD1000, v0, v1, "(moduleType=%d) Cannot find FDR cert", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_verifyModuleFDR:forModuleType:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_227BD1000, v0, v1, "(moduleType=%d) Error: Could not parse certificate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_verifyModuleFDR:forModuleType:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_7(&dword_227BD1000, v0, v1, "(moduleType=%d) %s: %d: returned error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_verifyModuleFDR:forModuleType:.cold.11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_7(&dword_227BD1000, v0, v1, "(moduleType=%d) %s: %d: returned error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_verifyModuleFDR:(os_log_t)log forModuleType:.cold.12(uint64_t *a1, int a2, os_log_t log)
{
  uint64_t v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4[0] = 67109634;
  v4[1] = a2;
  v5 = 2080;
  v6 = "-[ACCHWComponentAuthService _verifyModuleFDR:forModuleType:]";
  v7 = 2112;
  v8 = v3;
  _os_log_error_impl(&dword_227BD1000, log, OS_LOG_TYPE_ERROR, "(moduleType=%d) %s: AMFDRSealingMapCopyLocalDataForClass returned error=%@", (uint8_t *)v4, 0x1Cu);
}

- (void)signVeridianChallenge:(void *)a1 completionHandler:.cold.3(void *a1)
{
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;

  objc_msgSend(a1, "moduleAuthService");
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 8u);
  OUTLINED_FUNCTION_2();
}

@end
