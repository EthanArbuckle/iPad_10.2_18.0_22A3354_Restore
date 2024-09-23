@implementation BiometricKitXPCServer

- (int)loadCatacombAfterFirstUnlock
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (-[BiometricKitXPCServer catacombFileAccessed](self, "catacombFileAccessed")
    || !-[BiometricKitXPCServer isCatacombAccessible](self, "isCatacombAccessible"))
  {
    return 0;
  }
  v3 = MEMORY[0x24BDACB70];
  if (__osLog)
    v4 = __osLog;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_2148C7000, v4, OS_LOG_TYPE_DEFAULT, "loadCatacombAfterFirstUnlock: not received first unlock notification yet\n", (uint8_t *)&v9, 2u);
  }
  v5 = -[BiometricKitXPCServer handleCatacombUnlock](self, "handleCatacombUnlock");
  if (v5)
  {
    if (__osLog)
      v6 = __osLog;
    else
      v6 = v3;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = 136316162;
      v10 = "err == 0 ";
      v11 = 2048;
      v12 = v5;
      v13 = 2080;
      v14 = &unk_21491C593;
      v15 = 2080;
      v16 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v17 = 1024;
      v18 = 3272;
      _os_log_impl(&dword_2148C7000, v6, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v9, 0x30u);
    }
    if (__osLog)
      v7 = __osLog;
    else
      v7 = v3;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 67109120;
      LODWORD(v10) = v5;
      _os_log_impl(&dword_2148C7000, v7, OS_LOG_TYPE_ERROR, "loadCatacombAfterFirstUnlock: -> %d\n", (uint8_t *)&v9, 8u);
    }
  }
  return v5;
}

- (id)getProtectedConfigurationForUser:(unsigned int)a3 withClient:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  id v11;
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
  NSObject *v25;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  id v31;
  uint8_t buf[4];
  _BYTE v33[18];
  __int16 v34;
  void *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v4 = *(_QWORD *)&a3;
  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v33 = v4;
    *(_WORD *)&v33[4] = 2112;
    *(_QWORD *)&v33[6] = v6;
    _os_log_impl(&dword_2148C7000, v8, OS_LOG_TYPE_DEBUG, "getProtectedConfigurationForUser:withClient: %d %@\n", buf, 0x12u);
  }
  -[BiometricKitXPCServer validateAllUsers](self, "validateAllUsers");
  v30 = 0;
  v31 = 0;
  v9 = -[BiometricKitXPCServer performGetProtectedConfigCommand:outSetCfg:outEffectiveCfg:](self, "performGetProtectedConfigCommand:outSetCfg:outEffectiveCfg:", v4, &v31, &v30);
  v10 = v31;
  v11 = v30;
  if (v9)
  {
    if (__osLog)
      v27 = __osLog;
    else
      v27 = v7;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v33 = "err == 0 ";
      *(_WORD *)&v33[8] = 2048;
      *(_QWORD *)&v33[10] = v9;
      v34 = 2080;
      v35 = &unk_21491C593;
      v36 = 2080;
      v37 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v38 = 1024;
      v39 = 6609;
      _os_log_impl(&dword_2148C7000, v27, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    if (__osLogTrace)
      v28 = __osLogTrace;
    else
      v28 = v7;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v33 = 0;
      *(_WORD *)&v33[8] = 1024;
      *(_DWORD *)&v33[10] = v9;
      _os_log_impl(&dword_2148C7000, v28, OS_LOG_TYPE_ERROR, "getProtectedConfigurationForUser:withClient: -> %@ (%d)\n", buf, 0x12u);
    }
    v12 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if (objc_msgSend(v10, "unlockEnabled") != -1)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v10, "unlockEnabled") != 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("BKUserCfgTouchIDUnlockEnabled"));

      }
      if (objc_msgSend(v10, "identificationEnabled") != -1)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v10, "identificationEnabled") != 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("BKUserCfgTouchIDIdentificationEnabled"));

      }
      if (objc_msgSend(v10, "loginEnabled") != -1)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v10, "loginEnabled") != 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("BKUserCfgTouchIDLoginEnabled"));

      }
      if (objc_msgSend(v10, "applePayEnabled") != -1)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v10, "applePayEnabled") != 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("BKUserCfgTouchIDApplePayEnabled"));

      }
      if (objc_msgSend(v10, "attentionDetectionEnabled") != -1)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v10, "attentionDetectionEnabled") != 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, CFSTR("BKUserCfgAttentionDetectionEnabled"));

      }
      if (objc_msgSend(v10, "periocularMatchEnabled") != -1)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v10, "periocularMatchEnabled") != 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, CFSTR("BKUserCfgPeriocularMatchEnabled"));

      }
      if (objc_msgSend(v11, "unlockEnabled") != -1)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v11, "unlockEnabled") != 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, CFSTR("BKUserCfgEffectiveTouchIDUnlockEnabled"));

      }
      if (objc_msgSend(v11, "identificationEnabled") != -1)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v11, "identificationEnabled") != 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, CFSTR("BKUserCfgEffectiveTouchIDIdentificationEnabled"));

      }
      if (objc_msgSend(v11, "loginEnabled") != -1)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v11, "loginEnabled") != 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, CFSTR("BKUserCfgEffectiveTouchIDLoginEnabled"));

      }
      if (objc_msgSend(v11, "applePayEnabled") != -1)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v11, "applePayEnabled") != 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v22, CFSTR("BKUserCfgEffectiveTouchIDApplePayEnabled"));

      }
      if (objc_msgSend(v11, "attentionDetectionEnabled") != -1)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v11, "attentionDetectionEnabled") != 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v23, CFSTR("BKUserCfgEffectiveAttentionDetectionEnabled"));

      }
      if (objc_msgSend(v11, "periocularMatchEnabled") != -1)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v11, "periocularMatchEnabled") != 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v24, CFSTR("BKUserCfgEffectivePeriocularMatchEnabled"));

      }
    }
    else
    {
      if (__osLog)
        v29 = __osLog;
      else
        v29 = v7;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v33 = "dict";
        *(_WORD *)&v33[8] = 2048;
        *(_QWORD *)&v33[10] = 0;
        v34 = 2080;
        v35 = &unk_21491C593;
        v36 = 2080;
        v37 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v38 = 1024;
        v39 = 6612;
        _os_log_impl(&dword_2148C7000, v29, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    if (__osLogTrace)
      v25 = __osLogTrace;
    else
      v25 = v7;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v33 = v12;
      *(_WORD *)&v33[8] = 1024;
      *(_DWORD *)&v33[10] = 0;
      _os_log_impl(&dword_2148C7000, v25, OS_LOG_TYPE_DEBUG, "getProtectedConfigurationForUser:withClient: -> %@ (%d)\n", buf, 0x12u);
    }
  }

  return v12;
}

- (BOOL)validateAllUsers
{
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  BOOL v17;
  NSObject *v18;
  NSObject *v19;
  int v20;
  int v21;
  NSObject *v22;
  NSObject *v24;
  NSObject *v25;
  __int128 v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  uint8_t v33[128];
  uint8_t buf[4];
  _BYTE v35[28];
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  if (__osLogTrace)
    v3 = __osLogTrace;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2148C7000, v3, OS_LOG_TYPE_DEBUG, "validateAllUsers\n", buf, 2u);
  }
  if (self->_userListChangeDetected)
  {
    v4 = (id)self->_expressModeState;
    objc_sync_enter(v4);
    objc_msgSend((id)self->_expressModeState, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v4);

    self->_userListChangeDetected = 0;
    v32 = 0;
    v5 = -[BiometricKitXPCServer getUserUUIDsForUIDs:userUUIDs:](self, "getUserUUIDsForUIDs:userUUIDs:", obj, &v32);
    v6 = v32;
    v7 = v6;
    if (v5)
    {
      if (__osLog)
        v24 = __osLog;
      else
        v24 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v35 = "err == 0 ";
        *(_WORD *)&v35[8] = 2048;
        *(_QWORD *)&v35[10] = v5;
        *(_WORD *)&v35[18] = 2080;
        *(_QWORD *)&v35[20] = &unk_21491C593;
        v36 = 2080;
        v37 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v38 = 1024;
        v39 = 3455;
        _os_log_impl(&dword_2148C7000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v21 = 0;
      self->_userListChangeDetected = 1;
    }
    else
    {
      if (!v6)
      {
        v25 = (__osLog ? __osLog : MEMORY[0x24BDACB70]);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v35 = "uuidsDict";
          *(_WORD *)&v35[8] = 2048;
          *(_QWORD *)&v35[10] = 0;
          *(_WORD *)&v35[18] = 2080;
          *(_QWORD *)&v35[20] = &unk_21491C593;
          v36 = 2080;
          v37 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
          v38 = 1024;
          v39 = 3456;
          _os_log_impl(&dword_2148C7000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      obj = obj;
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v8)
      {
        v10 = 0;
        v11 = *(_QWORD *)v29;
        *(_QWORD *)&v9 = 67109634;
        v26 = v9;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v29 != v11)
              objc_enumerationMutation(obj);
            v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            objc_msgSend(v7, "objectForKeyedSubscript:", v13, v26);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = (id)self->_expressModeState;
            objc_sync_enter(v15);
            objc_msgSend((id)self->_expressModeState, "objectForKeyedSubscript:", v13);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_sync_exit(v15);

            if (v14)
              v17 = v16 == 0;
            else
              v17 = 1;
            if (v17 || (objc_msgSend(v14, "isEqual:", v16) & 1) == 0)
            {
              if (__osLog)
                v18 = __osLog;
              else
                v18 = MEMORY[0x24BDACB70];
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                v19 = v18;
                v20 = objc_msgSend(v13, "unsignedIntValue");
                *(_DWORD *)buf = v26;
                *(_DWORD *)v35 = v20;
                *(_WORD *)&v35[4] = 2112;
                *(_QWORD *)&v35[6] = v14;
                *(_WORD *)&v35[14] = 2112;
                *(_QWORD *)&v35[16] = v16;
                _os_log_impl(&dword_2148C7000, v19, OS_LOG_TYPE_DEFAULT, "validateAllUsers: removing user %u because of invalid user UUID (real:%@ vs catacomb:%@)\n", buf, 0x1Cu);

              }
              -[BiometricKitXPCServer removeUser:](self, "removeUser:", objc_msgSend(v13, "unsignedIntValue"));
              v10 = 1;
            }

          }
          v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        }
        while (v8);

        if ((v10 & 1) != 0)
        {
          -[BiometricKitXPCServer saveCatacomb](self, "saveCatacomb");
          -[BiometricKitXPCServer syncTemplateListForUser:](self, "syncTemplateListForUser:", 0xFFFFFFFFLL);
          v21 = 1;
        }
        else
        {
          v21 = v10 & 1;
        }
      }
      else
      {

        v21 = 0;
      }
    }
  }
  else
  {
    v21 = 0;
    v7 = 0;
    obj = 0;
  }
  if (__osLogTrace)
    v22 = __osLogTrace;
  else
    v22 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v35 = v21 ^ 1;
    _os_log_impl(&dword_2148C7000, v22, OS_LOG_TYPE_DEBUG, "validateAllUsers -> %d\n", buf, 8u);
  }

  return v21 ^ 1;
}

- (BOOL)catacombFileAccessed
{
  return HIBYTE(self->_mkbLockStatusNtfToken);
}

+ (void)initialize
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_2148C7000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Couldn't create OS Log for 'com.apple.BiometricKit.Daemon-Common'!\n", v0, 2u);
}

- (BiometricKitXPCServer)init
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  BiometricKitXPCServer *v7;
  char *v8;
  mach_port_t v9;
  IONotificationPort *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  ActivityTracker *v17;
  void *v18;
  ActivityTracker *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  dispatch_queue_t v27;
  void *v28;
  NSObject *v29;
  EntitlementABCIssueReporter *v30;
  void *v31;
  EntitlementABCIssueReporter *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  CatacombStateCache *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  dispatch_queue_t v42;
  void *v43;
  dispatch_queue_t v44;
  void *v45;
  io_service_t MatchingService;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  uint32_t v50;
  int *v51;
  BiometricKitXPCServer *v52;
  void *v53;
  void *v54;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v56;
  NSObject *v58;
  NSObject *v59;
  NSObject *v60;
  uint32_t v61;
  NSObject *v62;
  _QWORD v63[4];
  BiometricKitXPCServer *v64;
  _QWORD handler[4];
  char *v66;
  objc_super v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void *v71;
  BiometricKitXPCServer *v72;
  uint8_t buf[4];
  const char *v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  const char *v80;
  __int16 v81;
  int v82;
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v4 = __osLogTrace;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2148C7000, v4, OS_LOG_TYPE_DEBUG, "init\n", buf, 2u);
  }
  dispatch_get_global_queue(0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v68 = MEMORY[0x24BDAC760];
  v69 = 3221225472;
  v70 = __29__BiometricKitXPCServer_init__block_invoke;
  v71 = &unk_24D2412D0;
  v7 = self;
  v72 = v7;
  v7->_osStateHandle = os_state_add_handler();

  v67.receiver = v7;
  v67.super_class = (Class)BiometricKitXPCServer;
  v8 = -[BiometricKitXPCServer init](&v67, sel_init);
  if (!v8)
  {
    if (__osLog)
      v58 = __osLog;
    else
      v58 = v3;
    if (!os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      goto LABEL_112;
    *(_DWORD *)buf = 136316162;
    v74 = "self";
    v75 = 2048;
    v76 = 0;
    v77 = 2080;
    v78 = &unk_21491C593;
    v79 = 2080;
    v80 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v81 = 1024;
    v82 = 743;
    goto LABEL_111;
  }
  v9 = *MEMORY[0x24BDD8B18];
  v10 = IONotificationPortCreate(*MEMORY[0x24BDD8B18]);
  *((_QWORD *)v8 + 18) = v10;
  if (!v10)
  {
    if (__osLog)
      v58 = __osLog;
    else
      v58 = v3;
    if (!os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      goto LABEL_112;
    *(_DWORD *)buf = 136316162;
    v74 = "_notifyport";
    v75 = 2048;
    v76 = 0;
    v77 = 2080;
    v78 = &unk_21491C593;
    v79 = 2080;
    v80 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v81 = 1024;
    v82 = 747;
    goto LABEL_111;
  }
  IONotificationPortSetDispatchQueue(v10, MEMORY[0x24BDAC9B8]);
  v11 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v12 = (void *)*((_QWORD *)v8 + 2);
  *((_QWORD *)v8 + 2) = v11;

  if (!*((_QWORD *)v8 + 2))
  {
    if (__osLog)
      v58 = __osLog;
    else
      v58 = v3;
    if (!os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      goto LABEL_112;
    *(_DWORD *)buf = 136316162;
    v74 = "_exportedObjects != ((void *)0)";
    v75 = 2048;
    v76 = 0;
    v77 = 2080;
    v78 = &unk_21491C593;
    v79 = 2080;
    v80 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v81 = 1024;
    v82 = 752;
    goto LABEL_111;
  }
  v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = (void *)*((_QWORD *)v8 + 20);
  *((_QWORD *)v8 + 20) = v13;

  if (!*((_QWORD *)v8 + 20))
  {
    if (__osLog)
      v58 = __osLog;
    else
      v58 = v3;
    if (!os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      goto LABEL_112;
    *(_DWORD *)buf = 136316162;
    v74 = "_bioOpsQueue != ((void *)0)";
    v75 = 2048;
    v76 = 0;
    v77 = 2080;
    v78 = &unk_21491C593;
    v79 = 2080;
    v80 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v81 = 1024;
    v82 = 756;
    goto LABEL_111;
  }
  v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v16 = (void *)*((_QWORD *)v8 + 21);
  *((_QWORD *)v8 + 21) = v15;

  if (!*((_QWORD *)v8 + 21))
  {
    if (__osLog)
      v58 = __osLog;
    else
      v58 = v3;
    if (!os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      goto LABEL_112;
    *(_DWORD *)buf = 136316162;
    v74 = "_activeBioOpsQueue != ((void *)0)";
    v75 = 2048;
    v76 = 0;
    v77 = 2080;
    v78 = &unk_21491C593;
    v79 = 2080;
    v80 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v81 = 1024;
    v82 = 760;
    goto LABEL_111;
  }
  v17 = -[ActivityTracker initWithDescription:]([ActivityTracker alloc], "initWithDescription:", CFSTR("com.apple.biometrickitd.ongoingBiometricOperation"));
  v18 = (void *)*((_QWORD *)v8 + 24);
  *((_QWORD *)v8 + 24) = v17;

  v19 = -[ActivityTracker initWithDescription:]([ActivityTracker alloc], "initWithDescription:", CFSTR("com.apple.biometrickitd.ongoingCatacomSaveTimer"));
  v20 = (void *)*((_QWORD *)v8 + 23);
  *((_QWORD *)v8 + 23) = v19;

  v21 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v22 = (void *)*((_QWORD *)v8 + 25);
  *((_QWORD *)v8 + 25) = v21;

  if (!*((_QWORD *)v8 + 25))
  {
    if (__osLog)
      v58 = __osLog;
    else
      v58 = v3;
    if (!os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      goto LABEL_112;
    *(_DWORD *)buf = 136316162;
    v74 = "_cachedIdentities";
    v75 = 2048;
    v76 = 0;
    v77 = 2080;
    v78 = &unk_21491C593;
    v79 = 2080;
    v80 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v81 = 1024;
    v82 = 768;
    goto LABEL_111;
  }
  v23 = objc_alloc_init(MEMORY[0x24BDD1788]);
  v24 = (void *)*((_QWORD *)v8 + 26);
  *((_QWORD *)v8 + 26) = v23;

  if (!*((_QWORD *)v8 + 26))
  {
    if (__osLog)
      v58 = __osLog;
    else
      v58 = v3;
    if (!os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      goto LABEL_112;
    *(_DWORD *)buf = 136316162;
    v74 = "_catacombLock != ((void *)0)";
    v75 = 2048;
    v76 = 0;
    v77 = 2080;
    v78 = &unk_21491C593;
    v79 = 2080;
    v80 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v81 = 1024;
    v82 = 772;
    goto LABEL_111;
  }
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)*((_QWORD *)v8 + 31);
  *((_QWORD *)v8 + 31) = v25;

  if (!*((_QWORD *)v8 + 31))
  {
    if (__osLog)
      v58 = __osLog;
    else
      v58 = v3;
    if (!os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      goto LABEL_112;
    *(_DWORD *)buf = 136316162;
    v74 = "_accessories";
    v75 = 2048;
    v76 = 0;
    v77 = 2080;
    v78 = &unk_21491C593;
    v79 = 2080;
    v80 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v81 = 1024;
    v82 = 776;
    goto LABEL_111;
  }
  v27 = dispatch_queue_create("com.apple.biometrickitd.abcQueue", 0);
  v28 = (void *)*((_QWORD *)v8 + 30);
  *((_QWORD *)v8 + 30) = v27;

  if (!*((_QWORD *)v8 + 30))
  {
    if (__osLog)
      v58 = __osLog;
    else
      v58 = v3;
    if (!os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      goto LABEL_112;
    *(_DWORD *)buf = 136316162;
    v74 = "_biometricABCDispatchQueue";
    v75 = 2048;
    v76 = 0;
    v77 = 2080;
    v78 = &unk_21491C593;
    v79 = 2080;
    v80 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v81 = 1024;
    v82 = 780;
    goto LABEL_111;
  }
  if (objc_msgSend(v8, "initAutoBugCapture"))
  {
    v29 = (__osLog ? __osLog : v3);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2148C7000, v29, OS_LOG_TYPE_ERROR, "Failed to initialize BiometricAutoBugCapture. On systems without SymptomDiagnosticReporter this is expected behavior.\n", buf, 2u);
    }
  }
  v30 = [EntitlementABCIssueReporter alloc];
  objc_msgSend(v8, "biometricABC");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[EntitlementABCIssueReporter initWithBiometricABC:](v30, "initWithBiometricABC:", v31);
  objc_msgSend(v8, "setReporter:", v32);

  +[BKCatacomb catacombWithDir:](BKCatacomb, "catacombWithDir:", CFSTR("/var/root/Library/Catacomb/"));
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)*((_QWORD *)v8 + 27);
  *((_QWORD *)v8 + 27) = v33;

  v35 = (void *)*((_QWORD *)v8 + 27);
  if (!v35)
  {
    if (__osLog)
      v58 = __osLog;
    else
      v58 = v3;
    if (!os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      goto LABEL_112;
    *(_DWORD *)buf = 136316162;
    v74 = "_catacomb";
    v75 = 2048;
    v76 = 0;
    v77 = 2080;
    v78 = &unk_21491C593;
    v79 = 2080;
    v80 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v81 = 1024;
    v82 = 826;
    goto LABEL_111;
  }
  objc_msgSend(v35, "recover");
  v36 = objc_alloc_init(CatacombStateCache);
  v37 = (void *)*((_QWORD *)v8 + 28);
  *((_QWORD *)v8 + 28) = v36;

  if (!*((_QWORD *)v8 + 28))
  {
    if (__osLog)
      v58 = __osLog;
    else
      v58 = v3;
    if (!os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      goto LABEL_112;
    *(_DWORD *)buf = 136316162;
    v74 = "_catacombStateCache";
    v75 = 2048;
    v76 = 0;
    v77 = 2080;
    v78 = &unk_21491C593;
    v79 = 2080;
    v80 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v81 = 1024;
    v82 = 831;
    goto LABEL_111;
  }
  v38 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v39 = (void *)*((_QWORD *)v8 + 14);
  *((_QWORD *)v8 + 14) = v38;

  if (!*((_QWORD *)v8 + 14))
  {
    if (__osLog)
      v58 = __osLog;
    else
      v58 = v3;
    if (!os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      goto LABEL_112;
    *(_DWORD *)buf = 136316162;
    v74 = "_catacombUserUUIDs";
    v75 = 2048;
    v76 = 0;
    v77 = 2080;
    v78 = &unk_21491C593;
    v79 = 2080;
    v80 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v81 = 1024;
    v82 = 835;
    goto LABEL_111;
  }
  v40 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v41 = (void *)*((_QWORD *)v8 + 15);
  *((_QWORD *)v8 + 15) = v40;

  if (!*((_QWORD *)v8 + 15))
  {
    if (__osLog)
      v58 = __osLog;
    else
      v58 = v3;
    if (!os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      goto LABEL_112;
    *(_DWORD *)buf = 136316162;
    v74 = "_catacombUserKeybagUUIDs";
    v75 = 2048;
    v76 = 0;
    v77 = 2080;
    v78 = &unk_21491C593;
    v79 = 2080;
    v80 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v81 = 1024;
    v82 = 839;
    goto LABEL_111;
  }
  v8[40] = notify_register_check("com.apple.BiometricKit.activeOperation", (int *)v8 + 9) == 0;
  v42 = dispatch_queue_create("com.apple.biometrickitd.activeOpNtf", 0);
  v43 = (void *)*((_QWORD *)v8 + 6);
  *((_QWORD *)v8 + 6) = v42;

  if (!*((_QWORD *)v8 + 6))
  {
    if (__osLog)
      v58 = __osLog;
    else
      v58 = v3;
    if (!os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      goto LABEL_112;
    *(_DWORD *)buf = 136316162;
    v74 = "_activeOperationNtfQueue";
    v75 = 2048;
    v76 = 0;
    v77 = 2080;
    v78 = &unk_21491C593;
    v79 = 2080;
    v80 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v81 = 1024;
    v82 = 844;
    goto LABEL_111;
  }
  objc_msgSend(v8, "updateActiveOperationNotification");
  v8[76] = notify_register_check("com.apple.BiometricKit.enrollmentChanged", (int *)v8 + 18) == 0;
  objc_msgSend(v8, "cacheUserAccountsInfo");
  v8[88] = notify_register_check("com.apple.BiometricKit.lockoutStateChanged", (int *)v8 + 21) == 0;
  v8[96] = notify_register_check("com.apple.BiometricKit.expressModeStateChanged", (int *)v8 + 23) == 0;
  v8[136] = notify_register_check("com.apple.BiometricKit.connectedAccessoriesChanged", (int *)v8 + 33) == 0;
  v44 = dispatch_queue_create("com.apple.biometrickitd.cmd", 0);
  v45 = (void *)*((_QWORD *)v8 + 19);
  *((_QWORD *)v8 + 19) = v44;

  if (*((_QWORD *)v8 + 19))
  {
    MatchingService = IOServiceGetMatchingService(v9, (CFDictionaryRef)&unk_24D24AFF0);
    *((_DWORD *)v8 + 15) = MatchingService;
    if (MatchingService)
      goto LABEL_28;
    if (__osLog)
      v60 = __osLog;
    else
      v60 = v3;
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v74 = "_backlightService";
      v75 = 2048;
      v76 = 0;
      v77 = 2080;
      v78 = &unk_21491C593;
      v79 = 2080;
      v80 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v81 = 1024;
      v82 = 876;
      _os_log_impl(&dword_2148C7000, v60, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    if (*((_DWORD *)v8 + 15))
    {
LABEL_28:
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v47 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v47, QOS_CLASS_BACKGROUND, 0);
      v48 = objc_claimAutoreleasedReturnValue();
      v49 = dispatch_queue_create("com.apple.biometrickitd.backlight", v48);

      handler[0] = v6;
      handler[1] = 3221225472;
      handler[2] = __29__BiometricKitXPCServer_init__block_invoke_323;
      handler[3] = &unk_24D2412F8;
      v66 = v8;
      v50 = notify_register_dispatch("com.apple.iokit.hid.displayStatus", (int *)v8 + 16, v49, handler);
      if (v50)
      {
        v61 = v50;
        v62 = (__osLog ? __osLog : v3);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v74 = "err == 0 ";
          v75 = 2048;
          v76 = v61;
          v77 = 2080;
          v78 = &unk_21491C593;
          v79 = 2080;
          v80 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
          v81 = 1024;
          v82 = 889;
          _os_log_impl(&dword_2148C7000, v62, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }

    }
    *((_DWORD *)v8 + 17) = -1;
    v51 = (int *)(v8 + 128);
    v63[0] = v6;
    v63[1] = 3221225472;
    v63[2] = __29__BiometricKitXPCServer_init__block_invoke_327;
    v63[3] = &unk_24D2412F8;
    v52 = v8;
    v64 = v52;
    v53 = (void *)MEMORY[0x24BDAC9B8];
    notify_register_dispatch("com.apple.mobile.keybagd.lock_status", v51, MEMORY[0x24BDAC9B8], v63);

    objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "registerUserListUpdateObserver:", v52);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v52, (CFNotificationCallback)__PasscodeChangedNotificationCallback, CFSTR("com.apple.managedconfiguration.passcodechanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    if (__osLogTrace)
      v56 = __osLogTrace;
    else
      v56 = v3;
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v74 = (const char *)v52;
      _os_log_impl(&dword_2148C7000, v56, OS_LOG_TYPE_DEBUG, "BiometricKitXPCServer init: -> %p\n", buf, 0xCu);
    }
    goto LABEL_35;
  }
  if (__osLog)
    v58 = __osLog;
  else
    v58 = v3;
  if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v74 = "_cmdDispatchQueue";
    v75 = 2048;
    v76 = 0;
    v77 = 2080;
    v78 = &unk_21491C593;
    v79 = 2080;
    v80 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v81 = 1024;
    v82 = 865;
LABEL_111:
    _os_log_impl(&dword_2148C7000, v58, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_112:

  if (__osLogTrace)
    v59 = __osLogTrace;
  else
    v59 = v3;
  if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v74 = 0;
    _os_log_impl(&dword_2148C7000, v59, OS_LOG_TYPE_ERROR, "BiometricKitXPCServer init: -> %p\n", buf, 0xCu);
  }
  v52 = 0;
LABEL_35:

  return v52;
}

uint64_t __29__BiometricKitXPCServer_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "osStateHandler:", a2);
}

uint64_t __29__BiometricKitXPCServer_init__block_invoke_323(uint64_t a1, int token)
{
  uint64_t result;
  uint64_t state64;

  state64 = 0;
  result = notify_get_state(token, &state64);
  if (!(_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "displayStateChanged:", state64 != 0);
  return result;
}

void __29__BiometricKitXPCServer_init__block_invoke_327(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x2199D8AE0]();
  objc_msgSend(*(id *)(a1 + 32), "validateUsersKeybagUUIDs");
  objc_autoreleasePoolPop(v2);
}

- (int)initAutoBugCapture
{
  BiometricAutoBugCapture *v3;
  CatacombStateCache *catacombStateCache;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = -[BiometricAutoBugCapture initWithDomain:process:dispatchQueue:]([BiometricAutoBugCapture alloc], "initWithDomain:process:dispatchQueue:", CFSTR("BiometricSupport"), CFSTR("biometrickitd"), self->_biometricABC);
  catacombStateCache = self->_catacombStateCache;
  self->_catacombStateCache = (CatacombStateCache *)v3;

  if (self->_catacombStateCache)
    return 0;
  if (__osLog)
    v6 = __osLog;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = 136316162;
    v8 = "_biometricABC";
    v9 = 2048;
    v10 = 0;
    v11 = 2080;
    v12 = &unk_21491C593;
    v13 = 2080;
    v14 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v15 = 1024;
    v16 = 953;
    _os_log_impl(&dword_2148C7000, v6, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v7, 0x30u);
  }
  return 263;
}

- (void)dealloc
{
  IONotificationPort *v3;
  io_object_t backlightService;
  int displayStatusNotifyToken;
  int catacombUserKeybagUUIDs;
  objc_super v7;

  v3 = *(IONotificationPort **)&self->_connectedAccessoriesChgNtfTokenValid;
  if (v3)
    IONotificationPortDestroy(v3);
  os_state_remove_handler();
  if (self->_activeOperationNtfTokenValid)
    notify_cancel(self->_activeOperationNtfToken);
  if (self->_enrollChgNtfTokenValid)
    notify_cancel(self->_enrollChgNtfToken);
  if (self->_userAccountsInfoValid)
    notify_cancel(*(_DWORD *)&self->_userAccountsInfo.hasMultipleUserAccounts);
  if (self->_lockoutChgNtfTokenValid)
    notify_cancel(self->_lockoutChgNtfToken);
  if (LOBYTE(self->_mkbLockStatusNtfToken))
    notify_cancel(HIDWORD(self->_catacombUserKeybagUUIDs));
  backlightService = self->_backlightService;
  if (backlightService)
    IOObjectRelease(backlightService);
  displayStatusNotifyToken = self->_displayStatusNotifyToken;
  if (displayStatusNotifyToken)
  {
    notify_cancel(displayStatusNotifyToken);
    self->_displayStatusNotifyToken = 0;
  }
  catacombUserKeybagUUIDs = (int)self->_catacombUserKeybagUUIDs;
  if (catacombUserKeybagUUIDs)
    notify_cancel(catacombUserKeybagUUIDs);
  v7.receiver = self;
  v7.super_class = (Class)BiometricKitXPCServer;
  -[BiometricKitXPCServer dealloc](&v7, sel_dealloc);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  const char *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  BiometricKitXPCExportedObject *v50;
  NSMutableSet *v51;
  _BOOL4 v52;
  NSObject *v53;
  NSObject *v54;
  int v55;
  NSObject *v56;
  NSObject *v57;
  char *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  BiometricKitXPCExportedObject *v68;
  _QWORD v69[5];
  BiometricKitXPCExportedObject *v70;
  uint8_t buf[4];
  const char *v72;
  __int16 v73;
  const char *v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  const char *v78;
  __int16 v79;
  int v80;
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v5 = (const char *)a3;
  v6 = a4;
  if (__osLogTrace)
    v7 = __osLogTrace;
  else
    v7 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    v72 = v5;
    v73 = 2112;
    v74 = v5;
    v75 = 2048;
    v76 = v6;
    v77 = 2112;
    v78 = (const char *)v6;
    _os_log_impl(&dword_2148C7000, v7, OS_LOG_TYPE_DEBUG, "listener:shouldAcceptNewConnection: %p(%@) %p(%@)\n", buf, 0x2Au);
  }
  v59 = (char *)v5;
  objc_msgSend(v6, "valueForEntitlement:", CFSTR("com.apple.private.bmk.allow"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v66, "BOOLValue"))
  {
    if (isInternalBuild())
    {
      v8 = (__osLog ? __osLog : MEMORY[0x24BDACB70]);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = v8;
        v10 = objc_msgSend(v6, "processIdentifier");
        *(_DWORD *)buf = 67109120;
        LODWORD(v72) = v10;
        _os_log_impl(&dword_2148C7000, v9, OS_LOG_TYPE_ERROR, "PID %d does have legacy entitlement com.apple.private.bmk.allow, please set one of fine grained entitlements com.apple.private.biometrickit.allow-*\n", buf, 8u);

      }
    }
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v6, "valueForEntitlement:", CFSTR("com.apple.private.biometrickit.allow-default"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v65, "BOOLValue"))
      v11 = v11 | 2;
    else
      v11 = v11;
  }
  objc_msgSend(v6, "valueForEntitlement:", CFSTR("com.apple.private.biometrickit.allow-enroll"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v64, "BOOLValue"))
      v11 = v11 | 4;
    else
      v11 = v11;
  }
  objc_msgSend(v6, "valueForEntitlement:", CFSTR("com.apple.private.biometrickit.allow-id-mgmt"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v63, "BOOLValue"))
      v11 = v11 | 8;
    else
      v11 = v11;
  }
  objc_msgSend(v6, "valueForEntitlement:", CFSTR("com.apple.private.biometrickit.allow-match"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v62, "BOOLValue"))
      v11 = v11 | 0x10;
    else
      v11 = v11;
  }
  objc_msgSend(v6, "valueForEntitlement:", CFSTR("com.apple.private.biometrickit.allow-config"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v61, "BOOLValue"))
      v11 = v11 | 0x20;
    else
      v11 = v11;
  }
  objc_msgSend(v6, "valueForEntitlement:", CFSTR("com.apple.private.biometrickit.allow-internal"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v60, "BOOLValue") & 1) != 0)
  {
    v11 = v11 | 0x40;
  }
  else if (!(_DWORD)v11)
  {
    if (__osLog)
      v53 = __osLog;
    else
      v53 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      v54 = v53;
      v55 = objc_msgSend(v6, "processIdentifier");
      *(_DWORD *)buf = 67109120;
      LODWORD(v72) = v55;
      _os_log_impl(&dword_2148C7000, v54, OS_LOG_TYPE_ERROR, "PID %d is missing entitlement (com.apple.private.biometrickit.*), dropping connection.\n", buf, 8u);

    }
    if (__osLog)
      v56 = __osLog;
    else
      v56 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      goto LABEL_59;
    *(_DWORD *)buf = 136316162;
    v72 = "acceptConnection";
    v73 = 2048;
    v74 = 0;
    v75 = 2080;
    v76 = &unk_21491C593;
    v77 = 2080;
    v78 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v79 = 1024;
    v80 = 1092;
    goto LABEL_58;
  }
  if (listener_shouldAcceptNewConnection__onceToken != -1)
    dispatch_once(&listener_shouldAcceptNewConnection__onceToken, &__block_literal_global);
  if (!listener_shouldAcceptNewConnection__ifc)
  {
    if (__osLog)
      v56 = __osLog;
    else
      v56 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      goto LABEL_59;
    *(_DWORD *)buf = 136316162;
    v72 = "ifc != ((void *)0)";
    v73 = 2048;
    v74 = 0;
    v75 = 2080;
    v76 = &unk_21491C593;
    v77 = 2080;
    v78 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v79 = 1024;
    v80 = 1100;
    goto LABEL_58;
  }
  if (!listener_shouldAcceptNewConnection__delegateIfc)
  {
    if (__osLog)
      v56 = __osLog;
    else
      v56 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      goto LABEL_59;
    *(_DWORD *)buf = 136316162;
    v72 = "delegateIfc != ((void *)0)";
    v73 = 2048;
    v74 = 0;
    v75 = 2080;
    v76 = &unk_21491C593;
    v77 = 2080;
    v78 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v79 = 1024;
    v80 = 1101;
    goto LABEL_58;
  }
  v68 = objc_alloc_init(BiometricKitXPCExportedObject);
  if (!v68)
  {
    if (__osLog)
      v56 = __osLog;
    else
      v56 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      goto LABEL_59;
    *(_DWORD *)buf = 136316162;
    v72 = "exportedObject != ((void *)0)";
    v73 = 2048;
    v74 = 0;
    v75 = 2080;
    v76 = &unk_21491C593;
    v77 = 2080;
    v78 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v79 = 1024;
    v80 = 1105;
LABEL_58:
    _os_log_impl(&dword_2148C7000, v56, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_59:
    v50 = 0;
    v52 = 0;
    goto LABEL_60;
  }
  -[BiometricKitXPCServer biometricABC](self, "biometricABC");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BiometricKitXPCServer reporter](self, "reporter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBiometricABC:", v12);

  -[BiometricKitXPCExportedObject setServer:](v68, "setServer:", self);
  -[BiometricKitXPCExportedObject setConnection:](v68, "setConnection:", v6);
  -[BiometricKitXPCExportedObject setClientEntitlement:](v68, "setClientEntitlement:", v11);
  objc_msgSend(v6, "setExportedInterface:", listener_shouldAcceptNewConnection__ifc);
  objc_msgSend(v6, "setExportedObject:", v68);
  objc_msgSend(v6, "setRemoteObjectInterface:", listener_shouldAcceptNewConnection__delegateIfc);
  v14 = (void *)listener_shouldAcceptNewConnection__ifc;
  v15 = (void *)MEMORY[0x24BDBCF20];
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, v17, v18, v19, v20, objc_opt_class(), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_match_options_async_client_replyBlock_, 0, 0);

  v22 = (void *)listener_shouldAcceptNewConnection__ifc;
  v23 = (void *)MEMORY[0x24BDBCF20];
  v24 = objc_opt_class();
  v25 = objc_opt_class();
  v26 = objc_opt_class();
  v27 = objc_opt_class();
  v28 = objc_opt_class();
  v29 = objc_opt_class();
  objc_msgSend(v23, "setWithObjects:", v24, v25, v26, v27, v28, v29, objc_opt_class(), 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_match_options_async_client_replyBlock_, 1, 0);

  v31 = (void *)listener_shouldAcceptNewConnection__ifc;
  v32 = (void *)MEMORY[0x24BDBCF20];
  v33 = objc_opt_class();
  objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setClasses:forSelector:argumentIndex:ofReply:", v34, sel_setPreferencesValue_forKey_client_replyBlock_, 0, 0);

  v35 = (void *)listener_shouldAcceptNewConnection__ifc;
  v36 = (void *)MEMORY[0x24BDBCF20];
  v37 = objc_opt_class();
  v38 = objc_opt_class();
  v39 = objc_opt_class();
  v40 = objc_opt_class();
  v41 = objc_opt_class();
  v42 = objc_opt_class();
  objc_msgSend(v36, "setWithObjects:", v37, v38, v39, v40, v41, v42, objc_opt_class(), 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setClasses:forSelector:argumentIndex:ofReply:", v43, sel_enroll_user_options_async_client_replyBlock_, 2, 0);

  v44 = (void *)listener_shouldAcceptNewConnection__ifc;
  v45 = (void *)MEMORY[0x24BDBCF20];
  v46 = objc_opt_class();
  v47 = objc_opt_class();
  v48 = objc_opt_class();
  objc_msgSend(v45, "setWithObjects:", v46, v47, v48, objc_opt_class(), 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setClasses:forSelector:argumentIndex:ofReply:", v49, sel_removePeriocularTemplatesWithOptions_async_client_replyBlock_, 0, 0);

  v69[0] = MEMORY[0x24BDAC760];
  v69[1] = 3221225472;
  v69[2] = __60__BiometricKitXPCServer_listener_shouldAcceptNewConnection___block_invoke_553;
  v69[3] = &unk_24D241360;
  v69[4] = self;
  v50 = v68;
  v70 = v50;
  objc_msgSend(v6, "setInvalidationHandler:", v69);

  v51 = self->_exportedObjects;
  objc_sync_enter(v51);
  -[NSMutableSet addObject:](self->_exportedObjects, "addObject:", v50);
  if (!self->_connectionsSuspended)
    objc_msgSend(v6, "resume");
  objc_sync_exit(v51);

  v52 = 1;
LABEL_60:
  if (__osLogTrace)
    v57 = __osLogTrace;
  else
    v57 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v72) = v52;
    _os_log_impl(&dword_2148C7000, v57, OS_LOG_TYPE_DEBUG, "listener:shouldAcceptNewConnection: -> %d\n", buf, 8u);
  }

  return v52;
}

void __60__BiometricKitXPCServer_listener_shouldAcceptNewConnection___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D960D8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)listener_shouldAcceptNewConnection__ifc;
  listener_shouldAcceptNewConnection__ifc = v0;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D9BF50);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)listener_shouldAcceptNewConnection__delegateIfc;
  listener_shouldAcceptNewConnection__delegateIfc = v2;

}

void __60__BiometricKitXPCServer_listener_shouldAcceptNewConnection___block_invoke_553(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  objc_sync_enter(v2);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "clients", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(a1 + 32), "disconnectingClient:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 40), "terminate");
  v7 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v7 + 24))
  {
    objc_msgSend(*(id *)(a1 + 40), "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resume");

    v7 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v7 + 16), "removeObject:", *(_QWORD *)(a1 + 40));
  objc_sync_exit(v2);

}

- (void)suspendAllConnections:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 connectionsSuspended;
  NSMutableSet *v8;
  NSMutableSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x24BDAC8D0];
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    connectionsSuspended = self->_connectionsSuspended;
    *(_DWORD *)buf = 67109376;
    v23 = v3;
    v24 = 1024;
    v25 = connectionsSuspended;
    _os_log_impl(&dword_2148C7000, v6, OS_LOG_TYPE_DEBUG, "suspendAllConnections: %u (suspended:%u)\n", buf, 0xEu);
  }
  v8 = self->_exportedObjects;
  objc_sync_enter(v8);
  if (self->_connectionsSuspended != v3)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = self->_exportedObjects;
    v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (v3)
          {
            objc_msgSend(v13, "connection");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "suspend");
          }
          else
          {
            objc_msgSend(v13, "connection", (_QWORD)v17);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "resume");
          }

        }
        v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

    self->_connectionsSuspended = v3;
  }
  objc_sync_exit(v8);

  if (__osLogTrace)
    v15 = __osLogTrace;
  else
    v15 = v5;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16 = self->_connectionsSuspended;
    *(_DWORD *)buf = 67109120;
    v23 = v16;
    _os_log_impl(&dword_2148C7000, v15, OS_LOG_TYPE_DEBUG, "suspendAllConnections: -> void (suspended:%u)\n", buf, 8u);
  }
}

- (os_state_data_s)osStateHandler:(os_state_hints_s *)a3
{
  NSObject *v5;
  NSObject *v6;
  unsigned int var0;
  char *var1;
  unsigned int var2;
  unsigned int var3;
  void *v11;
  void *v12;
  id v13;
  os_state_data_s *v14;
  os_state_data_s *v15;
  id v16;
  NSObject *v17;
  NSObject *v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint32_t v24;
  NSObject *v25;
  id v26;
  uint8_t buf[4];
  _BYTE v28[20];
  void *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    var0 = a3->var0;
    var1 = a3->var1;
    var2 = a3->var2;
    var3 = a3->var3;
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v28 = var0;
    *(_WORD *)&v28[4] = 2080;
    *(_QWORD *)&v28[6] = var1;
    *(_WORD *)&v28[14] = 1024;
    *(_DWORD *)&v28[16] = var2;
    LOWORD(v29) = 1024;
    *(_DWORD *)((char *)&v29 + 2) = var3;
    _os_log_impl(&dword_2148C7000, v6, OS_LOG_TYPE_DEBUG, "osStateHandler <- hints(osh_version:%d, osh_requestor:'%s', osh_api:%d, osh_reason:%d)\n", buf, 0x1Eu);
  }
  -[BiometricKitXPCServer stateDictionaryWithHints:](self, "stateDictionaryWithHints:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v26 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v11, 200, 0, &v26);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v26;
    if (v12)
    {
      if ((unint64_t)objc_msgSend(v12, "length") >= 0xFFFFFFFF)
      {
        if (__osLog)
          v25 = __osLog;
        else
          v25 = v5;
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          goto LABEL_41;
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v28 = "[data length] < 4294967295U";
        *(_WORD *)&v28[8] = 2048;
        *(_QWORD *)&v28[10] = 0;
        *(_WORD *)&v28[18] = 2080;
        v29 = &unk_21491C593;
        v30 = 2080;
        v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v32 = 1024;
        v33 = 1230;
        v21 = "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n";
      }
      else
      {
        v14 = (os_state_data_s *)malloc_type_calloc(1uLL, objc_msgSend(v12, "length") + 200, 0xE3EAFA13uLL);
        if (v14)
        {
          v15 = v14;
          v14->var0 = 1;
          v14->var1.var1 = objc_msgSend(v12, "length");
          __strlcpy_chk();
          v16 = objc_retainAutorelease(v12);
          memcpy(v15->var4, (const void *)objc_msgSend(v16, "bytes"), objc_msgSend(v16, "length"));
LABEL_11:

          goto LABEL_13;
        }
        if (__osLog)
          v25 = __osLog;
        else
          v25 = v5;
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
LABEL_41:
          v15 = 0;
          goto LABEL_11;
        }
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v28 = "state";
        *(_WORD *)&v28[8] = 2048;
        *(_QWORD *)&v28[10] = 0;
        *(_WORD *)&v28[18] = 2080;
        v29 = &unk_21491C593;
        v30 = 2080;
        v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v32 = 1024;
        v33 = 1233;
        v21 = "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n";
      }
      v22 = v25;
      v23 = OS_LOG_TYPE_ERROR;
      v24 = 48;
    }
    else
    {
      if (__osLog)
        v19 = __osLog;
      else
        v19 = v5;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v28 = "data";
        *(_WORD *)&v28[8] = 2048;
        *(_QWORD *)&v28[10] = 0;
        *(_WORD *)&v28[18] = 2080;
        v29 = &unk_21491C593;
        v30 = 2080;
        v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v32 = 1024;
        v33 = 1229;
        _os_log_impl(&dword_2148C7000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      if (__osLog)
        v20 = __osLog;
      else
        v20 = v5;
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        goto LABEL_41;
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v28 = v13;
      v21 = "osStateHandler: %{public}@\n";
      v22 = v20;
      v23 = OS_LOG_TYPE_DEFAULT;
      v24 = 12;
    }
    _os_log_impl(&dword_2148C7000, v22, v23, v21, buf, v24);
    goto LABEL_41;
  }
  v15 = 0;
LABEL_13:
  if (__osLogTrace)
    v17 = __osLogTrace;
  else
    v17 = v5;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v28 = v15;
    _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_DEBUG, "osStateHandler -> %p\n", buf, 0xCu);
  }

  return v15;
}

- (id)stateDictionaryWithHints:(os_state_hints_s *)a3
{
  void *v3;
  void *v4;

  if (a3->var2 == 3)
  {
    objc_msgSend(MEMORY[0x24BE0CE58], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stateDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (int)enroll:(int)a3 forUser:(unsigned int)a4 withOptions:(id)a5 withClient:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  int v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  os_log_type_t v20;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  int v25;
  _BYTE v26[10];
  _BYTE v27[10];
  _BYTE v28[10];
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v7 = *(_QWORD *)&a4;
  v8 = *(_QWORD *)&a3;
  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a6;
  v12 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v13 = __osLogTrace;
  else
    v13 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 67109890;
    *(_DWORD *)v26 = v8;
    *(_WORD *)&v26[4] = 1024;
    *(_DWORD *)&v26[6] = v7;
    *(_WORD *)v27 = 2112;
    *(_QWORD *)&v27[2] = v10;
    *(_WORD *)v28 = 2112;
    *(_QWORD *)&v28[2] = v11;
    _os_log_impl(&dword_2148C7000, v13, OS_LOG_TYPE_DEFAULT, "enroll:forUser:withOptions:withClient: %d %d %@ %@\n", (uint8_t *)&v25, 0x22u);
  }
  if (BYTE1(self->_mkbLockStatusNtfToken))
    kdebug_trace();
  if (isEphemeralMultiUser())
  {
    if (__osLog)
      v22 = __osLog;
    else
      v22 = v12;
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_36;
    v25 = 136316162;
    *(_QWORD *)v26 = "!isEphemeralMultiUser()";
    *(_WORD *)&v26[8] = 2048;
    *(_QWORD *)v27 = 0;
    *(_WORD *)&v27[8] = 2080;
    *(_QWORD *)v28 = &unk_21491C593;
    *(_WORD *)&v28[8] = 2080;
    v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v30 = 1024;
    v31 = 1274;
    goto LABEL_35;
  }
  if (-[BiometricKitXPCServer isFingerprintModificationRestricted](self, "isFingerprintModificationRestricted"))
  {
    if (__osLog)
      v22 = __osLog;
    else
      v22 = v12;
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_36;
    v25 = 136316162;
    *(_QWORD *)v26 = "![self isFingerprintModificationRestricted]";
    *(_WORD *)&v26[8] = 2048;
    *(_QWORD *)v27 = 0;
    *(_WORD *)&v27[8] = 2080;
    *(_QWORD *)v28 = &unk_21491C593;
    *(_WORD *)&v28[8] = 2080;
    v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v30 = 1024;
    v31 = 1275;
LABEL_35:
    _os_log_impl(&dword_2148C7000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v25, 0x30u);
LABEL_36:
    v15 = 0;
    v17 = 257;
    goto LABEL_13;
  }
  -[BiometricKitXPCServer createEnrollOperation](self, "createEnrollOperation");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    v16 = -[BiometricKitXPCServer initEnrollOperation:biometricType:userID:options:client:](self, "initEnrollOperation:biometricType:userID:options:client:", v14, v8, v7, v10, v11);
    if (v16)
    {
      v17 = v16;
      if (__osLog)
        v24 = __osLog;
      else
        v24 = v12;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = 136316162;
        *(_QWORD *)v26 = "err == 0 ";
        *(_WORD *)&v26[8] = 2048;
        *(_QWORD *)v27 = v17;
        *(_WORD *)&v27[8] = 2080;
        *(_QWORD *)v28 = &unk_21491C593;
        *(_WORD *)&v28[8] = 2080;
        v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v30 = 1024;
        v31 = 1281;
LABEL_53:
        _os_log_impl(&dword_2148C7000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v25, 0x30u);
      }
    }
    else
    {
      v17 = -[BiometricKitXPCServer processBioOperation:](self, "processBioOperation:", v15);
      if (v17)
      {
        v24 = (__osLog ? __osLog : v12);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = 136316162;
          *(_QWORD *)v26 = "err == 0 ";
          *(_WORD *)&v26[8] = 2048;
          *(_QWORD *)v27 = v17;
          *(_WORD *)&v27[8] = 2080;
          *(_QWORD *)v28 = &unk_21491C593;
          *(_WORD *)&v28[8] = 2080;
          v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
          v30 = 1024;
          v31 = 1284;
          goto LABEL_53;
        }
      }
    }
  }
  else
  {
    if (__osLog)
      v23 = __osLog;
    else
      v23 = v12;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v25 = 136316162;
      *(_QWORD *)v26 = "enrollOperation";
      *(_WORD *)&v26[8] = 2048;
      *(_QWORD *)v27 = 0;
      *(_WORD *)&v27[8] = 2080;
      *(_QWORD *)v28 = &unk_21491C593;
      *(_WORD *)&v28[8] = 2080;
      v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v30 = 1024;
      v31 = 1278;
      _os_log_impl(&dword_2148C7000, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v25, 0x30u);
    }
    v15 = 0;
    v17 = 260;
  }
LABEL_13:
  if (BYTE1(self->_mkbLockStatusNtfToken))
    kdebug_trace();
  if (__osLogTrace)
    v18 = __osLogTrace;
  else
    v18 = v12;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v25 = 67109120;
      *(_DWORD *)v26 = v17;
      v19 = v18;
      v20 = OS_LOG_TYPE_ERROR;
LABEL_23:
      _os_log_impl(&dword_2148C7000, v19, v20, "enroll:forUser:withOptions:withClient: -> %d\n", (uint8_t *)&v25, 8u);
    }
  }
  else if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v25 = 67109120;
    *(_DWORD *)v26 = 0;
    v19 = v18;
    v20 = OS_LOG_TYPE_DEBUG;
    goto LABEL_23;
  }

  return v17;
}

- (id)createEnrollOperation
{
  return objc_alloc_init(BiometricEnrollOperation);
}

- (int)initEnrollOperation:(id)a3 biometricType:(int)a4 userID:(unsigned int)a5 options:(id)a6 client:(id)a7
{
  uint64_t v9;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  int v23;
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v9 = *(_QWORD *)&a5;
  v33 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a6;
  v13 = a7;
  v14 = v13;
  if (!v11)
  {
    if (__osLog)
      v20 = __osLog;
    else
      v20 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    v23 = 136316162;
    v24 = "operation";
    v25 = 2048;
    v26 = 0;
    v27 = 2080;
    v28 = &unk_21491C593;
    v29 = 2080;
    v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v31 = 1024;
    v32 = 1314;
LABEL_18:
    _os_log_impl(&dword_2148C7000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v23, 0x30u);
    goto LABEL_30;
  }
  if (!v13)
  {
    if (__osLog)
      v20 = __osLog;
    else
      v20 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    v23 = 136316162;
    v24 = "client";
    v25 = 2048;
    v26 = 0;
    v27 = 2080;
    v28 = &unk_21491C593;
    v29 = 2080;
    v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v31 = 1024;
    v32 = 1315;
    goto LABEL_18;
  }
  objc_msgSend(v11, "setPriority:", 0x7FFFFFFFFFFFFF9BLL);
  objc_msgSend(v11, "setUserID:", v9);
  objc_msgSend(v11, "setClient:", v14);
  v15 = -[BiometricKitXPCServer parseAuthDict:toAuthData:](self, "parseAuthDict:toAuthData:", v12, objc_msgSend(v11, "authData"));
  if (v15)
  {
    LODWORD(v16) = v15;
    if (__osLog)
      v21 = __osLog;
    else
      v21 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v23 = 136316162;
      v24 = "err == 0 ";
      v25 = 2048;
      v26 = (int)v16;
      v27 = 2080;
      v28 = &unk_21491C593;
      v29 = 2080;
      v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v31 = 1024;
      v32 = 1322;
      _os_log_impl(&dword_2148C7000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v23, 0x30u);
    }
  }
  else
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("BKOptionEnrollAccessoryGroup"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = objc_msgSend(v16, "type");
        *(_DWORD *)objc_msgSend(v11, "deviceGroup") = v17;
        objc_msgSend(v16, "uuid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "getUUIDBytes:", objc_msgSend(v11, "deviceGroup") + 4);

        LODWORD(v16) = 0;
        goto LABEL_7;
      }
      if (__osLog)
        v22 = __osLog;
      else
        v22 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = 136316162;
        v24 = "[value isKindOfClass:[BiometricKitAccessoryGroup class]]";
        v25 = 2048;
        v26 = 0;
        v27 = 2080;
        v28 = &unk_21491C593;
        v29 = 2080;
        v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v31 = 1024;
        v32 = 1326;
        _os_log_impl(&dword_2148C7000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v23, 0x30u);
      }

LABEL_30:
      LODWORD(v16) = 258;
    }
  }
LABEL_7:

  return (int)v16;
}

- (int)startEnrollOperation:(id)a3
{
  char *v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  int v8;
  int v9;
  NSObject *v10;
  int v11;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)a3;
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v16 = 138412290;
    v17 = v4;
    _os_log_impl(&dword_2148C7000, v6, OS_LOG_TYPE_DEBUG, "startEnrollOperation: %@\n", (uint8_t *)&v16, 0xCu);
  }
  if (!v4)
  {
    if (__osLog)
      v13 = __osLog;
    else
      v13 = v5;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v16 = 136316162;
      v17 = "operation";
      v18 = 2048;
      v19 = 0;
      v20 = 2080;
      v21 = &unk_21491C593;
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v24 = 1024;
      v25 = 1347;
      _os_log_impl(&dword_2148C7000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
    }
    v11 = 258;
    goto LABEL_39;
  }
  v7 = -[BiometricKitXPCServer isValidUser:](self, "isValidUser:", objc_msgSend(v4, "userID"));
  if (v7)
  {
    v11 = v7;
    if (__osLog)
      v14 = __osLog;
    else
      v14 = v5;
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    v16 = 136316162;
    v17 = "err == 0 ";
    v18 = 2048;
    v19 = v11;
    v20 = 2080;
    v21 = &unk_21491C593;
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v24 = 1024;
    v25 = 1351;
LABEL_38:
    _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
    goto LABEL_39;
  }
  v8 = -[BiometricKitXPCServer checkCatacombForUser:](self, "checkCatacombForUser:", objc_msgSend(v4, "userID"));
  if (v8)
  {
    v11 = v8;
    if (__osLog)
      v14 = __osLog;
    else
      v14 = v5;
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    v16 = 136316162;
    v17 = "err == 0 ";
    v18 = 2048;
    v19 = v11;
    v20 = 2080;
    v21 = &unk_21491C593;
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v24 = 1024;
    v25 = 1355;
    goto LABEL_38;
  }
  v9 = -[BiometricKitXPCServer performEnrollCommand:](self, "performEnrollCommand:", v4);
  if (!v9)
  {
    if (__osLogTrace)
      v10 = __osLogTrace;
    else
      v10 = v5;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v16 = 67109120;
      LODWORD(v17) = 0;
      _os_log_impl(&dword_2148C7000, v10, OS_LOG_TYPE_DEBUG, "startEnrollOperation: -> %d\n", (uint8_t *)&v16, 8u);
    }
    v11 = 0;
    goto LABEL_16;
  }
  v11 = v9;
  if (__osLog)
    v14 = __osLog;
  else
    v14 = v5;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v16 = 136316162;
    v17 = "err == 0 ";
    v18 = 2048;
    v19 = v11;
    v20 = 2080;
    v21 = &unk_21491C593;
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v24 = 1024;
    v25 = 1358;
    goto LABEL_38;
  }
LABEL_39:
  if (__osLogTrace)
    v15 = __osLogTrace;
  else
    v15 = v5;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v16 = 67109120;
    LODWORD(v17) = v11;
    _os_log_impl(&dword_2148C7000, v15, OS_LOG_TYPE_ERROR, "startEnrollOperation: -> %d\n", (uint8_t *)&v16, 8u);
  }
LABEL_16:

  return v11;
}

- (int)match:(id)a3 withOptions:(id)a4 withClient:(id)a5
{
  char *v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  os_log_type_t v19;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  int v24;
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = (char *)a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v12 = __osLogTrace;
  else
    v12 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 138412802;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    v28 = 2112;
    v29 = v10;
    _os_log_impl(&dword_2148C7000, v12, OS_LOG_TYPE_DEFAULT, "match:withOptions:withClient: %@ %@ %@\n", (uint8_t *)&v24, 0x20u);
  }
  if (BYTE1(self->_mkbLockStatusNtfToken))
    kdebug_trace();
  notify_post("com.apple.BiometricKit.matchOperationStartAttempted");
  if (isEphemeralMultiUser())
  {
    if (__osLog)
      v21 = __osLog;
    else
      v21 = v11;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v24 = 136316162;
      v25 = "!isEphemeralMultiUser()";
      v26 = 2048;
      v27 = 0;
      v28 = 2080;
      v29 = &unk_21491C593;
      v30 = 2080;
      v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v32 = 1024;
      v33 = 1383;
      _os_log_impl(&dword_2148C7000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v24, 0x30u);
    }
    v14 = 0;
    v16 = 257;
  }
  else
  {
    -[BiometricKitXPCServer createMatchOperation](self, "createMatchOperation");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      v15 = -[BiometricKitXPCServer initMatchOperation:filter:options:client:](self, "initMatchOperation:filter:options:client:", v13, v8, v9, v10);
      if (v15)
      {
        v16 = v15;
        if (__osLog)
          v23 = __osLog;
        else
          v23 = v11;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = 136316162;
          v25 = "err == 0 ";
          v26 = 2048;
          v27 = (id)v16;
          v28 = 2080;
          v29 = &unk_21491C593;
          v30 = 2080;
          v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
          v32 = 1024;
          v33 = 1389;
LABEL_46:
          _os_log_impl(&dword_2148C7000, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v24, 0x30u);
        }
      }
      else
      {
        v16 = -[BiometricKitXPCServer processBioOperation:](self, "processBioOperation:", v14);
        if (v16)
        {
          v23 = (__osLog ? __osLog : v11);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v24 = 136316162;
            v25 = "err == 0 ";
            v26 = 2048;
            v27 = (id)v16;
            v28 = 2080;
            v29 = &unk_21491C593;
            v30 = 2080;
            v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
            v32 = 1024;
            v33 = 1392;
            goto LABEL_46;
          }
        }
      }
    }
    else
    {
      if (__osLog)
        v22 = __osLog;
      else
        v22 = v11;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v24 = 136316162;
        v25 = "matchOperation";
        v26 = 2048;
        v27 = 0;
        v28 = 2080;
        v29 = &unk_21491C593;
        v30 = 2080;
        v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v32 = 1024;
        v33 = 1386;
        _os_log_impl(&dword_2148C7000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v24, 0x30u);
      }
      v14 = 0;
      v16 = 260;
    }
  }
  if (BYTE1(self->_mkbLockStatusNtfToken))
    kdebug_trace();
  if (__osLogTrace)
    v17 = __osLogTrace;
  else
    v17 = v11;
  if (v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v24 = 67109120;
      LODWORD(v25) = v16;
      v18 = v17;
      v19 = OS_LOG_TYPE_ERROR;
LABEL_22:
      _os_log_impl(&dword_2148C7000, v18, v19, "match:withOptions:withClient: -> %d\n", (uint8_t *)&v24, 8u);
    }
  }
  else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v24 = 67109120;
    LODWORD(v25) = 0;
    v18 = v17;
    v19 = OS_LOG_TYPE_DEBUG;
    goto LABEL_22;
  }

  return v16;
}

- (id)createMatchOperation
{
  return objc_alloc_init(BiometricMatchOperation);
}

- (int)initMatchOperation:(id)a3 filter:(id)a4 options:(id)a5 client:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _DWORD *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  _BOOL8 v31;
  int Bool;
  int Data;
  id v34;
  int v35;
  int v36;
  int Integer;
  int v38;
  void *v39;
  int v40;
  uint64_t v41;
  int v42;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  unsigned int v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  unint64_t v61;
  uint64_t v62;
  __int16 v63;
  __int16 v64;
  uint8_t v65[128];
  uint8_t buf[4];
  const char *v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  const char *v73;
  __int16 v74;
  int v75;
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  v64 = 0;
  v63 = 0;
  v62 = 0;
  if (!v10)
  {
    if (__osLog)
      v45 = __osLog;
    else
      v45 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      goto LABEL_81;
    *(_DWORD *)buf = 136316162;
    v67 = "operation";
    v68 = 2048;
    v69 = 0;
    v70 = 2080;
    v71 = &unk_21491C593;
    v72 = 2080;
    v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v74 = 1024;
    v75 = 1431;
    goto LABEL_80;
  }
  if (!v13)
  {
    if (__osLog)
      v45 = __osLog;
    else
      v45 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      goto LABEL_81;
    *(_DWORD *)buf = 136316162;
    v67 = "client";
    v68 = 2048;
    v69 = 0;
    v70 = 2080;
    v71 = &unk_21491C593;
    v72 = 2080;
    v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v74 = 1024;
    v75 = 1432;
LABEL_80:
    _os_log_impl(&dword_2148C7000, v45, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_81:
    v28 = 0;
    v29 = 0;
    Data = 258;
    goto LABEL_62;
  }
  if (!v11 || (v61 = 0xFFFFFFFFLL, (v15 = dictionaryGetInteger()) == 0))
  {
    if (-[BiometricKitXPCServer hasMultipleUserAccounts](self, "hasMultipleUserAccounts"))
    {
      v16 = 0xFFFFFFFFLL;
      if (v12)
        goto LABEL_7;
    }
    else
    {
      v16 = -[BiometricKitXPCServer currentAccountUserID](self, "currentAccountUserID");
      if (v12)
      {
LABEL_7:
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("BKOptionMatchSelectedIdentities"), self);
        v17 = objc_claimAutoreleasedReturnValue();
        v55 = (void *)v17;
        v56 = v16;
        if (v17)
        {
          v18 = (void *)v17;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (__osLog)
              v50 = __osLog;
            else
              v50 = MEMORY[0x24BDACB70];
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              v67 = "[array isKindOfClass:[NSArray class]]";
              v68 = 2048;
              v69 = 0;
              v70 = 2080;
              v71 = &unk_21491C593;
              v72 = 2080;
              v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
              v74 = 1024;
              v75 = 1450;
              _os_log_impl(&dword_2148C7000, v50, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
            }
            v28 = 0;
            v29 = 0;
            goto LABEL_182;
          }
          objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 20 * objc_msgSend(v18, "count") + 4);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v19)
          {
            if (__osLog)
              v51 = __osLog;
            else
              v51 = MEMORY[0x24BDACB70];
            if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              v67 = "selectedIdentitiesBlob";
              v68 = 2048;
              v69 = 0;
              v70 = 2080;
              v71 = &unk_21491C593;
              v72 = 2080;
              v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
              v74 = 1024;
              v75 = 1453;
              _os_log_impl(&dword_2148C7000, v51, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
            }
            v28 = 0;
            v29 = 0;
            Data = 260;
            goto LABEL_69;
          }
          v54 = v14;
          v53 = objc_retainAutorelease(v19);
          v20 = (_DWORD *)objc_msgSend(v53, "mutableBytes");
          v57 = 0u;
          v58 = 0u;
          v59 = 0u;
          v60 = 0u;
          v21 = v18;
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v58;
            while (2)
            {
              for (i = 0; i != v23; ++i)
              {
                if (*(_QWORD *)v58 != v24)
                  objc_enumerationMutation(v21);
                v26 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (__osLog)
                    v44 = __osLog;
                  else
                    v44 = MEMORY[0x24BDACB70];
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136316162;
                    v67 = "[identity isKindOfClass:[BiometricKitIdentity class]]";
                    v68 = 2048;
                    v69 = 0;
                    v70 = 2080;
                    v71 = &unk_21491C593;
                    v72 = 2080;
                    v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
                    v74 = 1024;
                    v75 = 1456;
                    _os_log_impl(&dword_2148C7000, v44, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
                  }

                  v29 = 0;
                  Data = 258;
                  v28 = v53;
                  v14 = v54;
                  goto LABEL_69;
                }
                v20[5 * *v20 + 1] = objc_msgSend(v26, "userID");
                objc_msgSend(v26, "uuid");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "getUUIDBytes:", &v20[5 * *v20 + 2]);

                ++*v20;
              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
              if (v23)
                continue;
              break;
            }
          }

          v28 = v53;
          v14 = v54;
        }
        else
        {
          v28 = 0;
        }
        Bool = dictionaryGetBool();
        if (Bool)
        {
          Data = Bool;
          if (__osLog)
            v47 = __osLog;
          else
            v47 = MEMORY[0x24BDACB70];
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v67 = "err == 0 ";
            v68 = 2048;
            v69 = Data;
            v70 = 2080;
            v71 = &unk_21491C593;
            v72 = 2080;
            v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
            v74 = 1024;
            v75 = 1464;
            _os_log_impl(&dword_2148C7000, v47, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
          v29 = 0;
          goto LABEL_69;
        }
        Data = dictionaryGetData();
        v34 = 0;
        v29 = v34;
        if (Data)
        {
          if (__osLog)
            v48 = __osLog;
          else
            v48 = MEMORY[0x24BDACB70];
          if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            goto LABEL_69;
          *(_DWORD *)buf = 136316162;
          v67 = "err == 0 ";
          v68 = 2048;
          v69 = Data;
          v70 = 2080;
          v71 = &unk_21491C593;
          v72 = 2080;
          v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
          v74 = 1024;
          v75 = 1467;
        }
        else
        {
          v31 = v34 != 0;
          v35 = dictionaryGetBool();
          if (v35)
          {
            Data = v35;
            if (__osLog)
              v48 = __osLog;
            else
              v48 = MEMORY[0x24BDACB70];
            if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
              goto LABEL_69;
            *(_DWORD *)buf = 136316162;
            v67 = "err == 0 ";
            v68 = 2048;
            v69 = Data;
            v70 = 2080;
            v71 = &unk_21491C593;
            v72 = 2080;
            v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
            v74 = 1024;
            v75 = 1473;
          }
          else
          {
            v36 = dictionaryGetBool();
            if (v36)
            {
              Data = v36;
              if (__osLog)
                v48 = __osLog;
              else
                v48 = MEMORY[0x24BDACB70];
              if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                goto LABEL_69;
              *(_DWORD *)buf = 136316162;
              v67 = "err == 0 ";
              v68 = 2048;
              v69 = Data;
              v70 = 2080;
              v71 = &unk_21491C593;
              v72 = 2080;
              v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
              v74 = 1024;
              v75 = 1476;
            }
            else
            {
              v61 = 0;
              Integer = dictionaryGetInteger();
              if (Integer)
              {
                Data = Integer;
                if (__osLog)
                  v48 = __osLog;
                else
                  v48 = MEMORY[0x24BDACB70];
                if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                  goto LABEL_69;
                *(_DWORD *)buf = 136316162;
                v67 = "err == 0 ";
                v68 = 2048;
                v69 = Data;
                v70 = 2080;
                v71 = &unk_21491C593;
                v72 = 2080;
                v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
                v74 = 1024;
                v75 = 1480;
              }
              else
              {
                v30 = v61;
                if (HIDWORD(v61))
                {
                  if (__osLog)
                    v49 = __osLog;
                  else
                    v49 = MEMORY[0x24BDACB70];
                  if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                    goto LABEL_182;
                  *(_DWORD *)buf = 136316162;
                  v67 = "intVal == (BiometricKitMatchUseCase)intVal";
                  v68 = 2048;
                  v69 = 0;
                  v70 = 2080;
                  v71 = &unk_21491C593;
                  v72 = 2080;
                  v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
                  v74 = 1024;
                  v75 = 1481;
                  goto LABEL_181;
                }
                v38 = dictionaryGetBool();
                if (v38)
                {
                  Data = v38;
                  if (__osLog)
                    v48 = __osLog;
                  else
                    v48 = MEMORY[0x24BDACB70];
                  if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                    goto LABEL_69;
                  *(_DWORD *)buf = 136316162;
                  v67 = "err == 0 ";
                  v68 = 2048;
                  v69 = Data;
                  v70 = 2080;
                  v71 = &unk_21491C593;
                  v72 = 2080;
                  v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
                  v74 = 1024;
                  v75 = 1485;
                }
                else
                {
                  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("BKOptionMatchAuthTokenToBypassPasscodeBiolockout"));
                  v39 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v39)
                    LOBYTE(v63) = 1;
                  if ((_BYTE)v64)
                  {
                    if (HIBYTE(v64))
                    {
                      if (__osLog)
                        v49 = __osLog;
                      else
                        v49 = MEMORY[0x24BDACB70];
                      if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                        goto LABEL_182;
                      *(_DWORD *)buf = 136316162;
                      v67 = "!forUnlock";
                      v68 = 2048;
                      v69 = 0;
                      v70 = 2080;
                      v71 = &unk_21491C593;
                      v72 = 2080;
                      v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biomet"
                            "ricKitXPCServer.m";
                      v74 = 1024;
                      v75 = 1493;
                    }
                    else if (v29)
                    {
                      if (__osLog)
                        v49 = __osLog;
                      else
                        v49 = MEMORY[0x24BDACB70];
                      if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                        goto LABEL_182;
                      *(_DWORD *)buf = 136316162;
                      v67 = "!forCredentialSet";
                      v68 = 2048;
                      v69 = 0;
                      v70 = 2080;
                      v71 = &unk_21491C593;
                      v72 = 2080;
                      v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biomet"
                            "ricKitXPCServer.m";
                      v74 = 1024;
                      v75 = 1494;
                    }
                    else if (HIBYTE(v63))
                    {
                      if (__osLog)
                        v49 = __osLog;
                      else
                        v49 = MEMORY[0x24BDACB70];
                      if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                        goto LABEL_182;
                      *(_DWORD *)buf = 136316162;
                      v67 = "!stopOnSuccess";
                      v68 = 2048;
                      v69 = 0;
                      v70 = 2080;
                      v71 = &unk_21491C593;
                      v72 = 2080;
                      v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biomet"
                            "ricKitXPCServer.m";
                      v74 = 1024;
                      v75 = 1495;
                    }
                    else if ((_BYTE)v63)
                    {
                      if (__osLog)
                        v49 = __osLog;
                      else
                        v49 = MEMORY[0x24BDACB70];
                      if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                        goto LABEL_182;
                      *(_DWORD *)buf = 136316162;
                      v67 = "!noBioLockout";
                      v68 = 2048;
                      v69 = 0;
                      v70 = 2080;
                      v71 = &unk_21491C593;
                      v72 = 2080;
                      v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biomet"
                            "ricKitXPCServer.m";
                      v74 = 1024;
                      v75 = 1496;
                    }
                    else
                    {
                      if (!v28)
                      {
                        v62 = -101;
LABEL_48:

                        v16 = v56;
                        goto LABEL_49;
                      }
                      if (__osLog)
                        v49 = __osLog;
                      else
                        v49 = MEMORY[0x24BDACB70];
                      if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                        goto LABEL_182;
                      *(_DWORD *)buf = 136316162;
                      v67 = "!selectedIdentitiesBlob";
                      v68 = 2048;
                      v69 = 0;
                      v70 = 2080;
                      v71 = &unk_21491C593;
                      v72 = 2080;
                      v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biomet"
                            "ricKitXPCServer.m";
                      v74 = 1024;
                      v75 = 1497;
                    }
LABEL_181:
                    _os_log_impl(&dword_2148C7000, v49, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_182:
                    Data = 258;
                    goto LABEL_69;
                  }
                  v40 = dictionaryGetInteger();
                  if (v40)
                  {
                    Data = v40;
                    if (__osLog)
                      v48 = __osLog;
                    else
                      v48 = MEMORY[0x24BDACB70];
                    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                      goto LABEL_69;
                    *(_DWORD *)buf = 136316162;
                    v67 = "err == 0 ";
                    v68 = 2048;
                    v69 = Data;
                    v70 = 2080;
                    v71 = &unk_21491C593;
                    v72 = 2080;
                    v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
                    v74 = 1024;
                    v75 = 1504;
                  }
                  else
                  {
                    v41 = v62;
                    if (v62 >= 100)
                      v41 = 100;
                    if (v41 <= -100)
                      v41 = -100;
                    v62 = v41;
                    if (!(_BYTE)v63)
                      goto LABEL_48;
                    if (HIBYTE(v64))
                    {
                      if (__osLog)
                        v49 = __osLog;
                      else
                        v49 = MEMORY[0x24BDACB70];
                      if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                        goto LABEL_182;
                      *(_DWORD *)buf = 136316162;
                      v67 = "!forUnlock";
                      v68 = 2048;
                      v69 = 0;
                      v70 = 2080;
                      v71 = &unk_21491C593;
                      v72 = 2080;
                      v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biomet"
                            "ricKitXPCServer.m";
                      v74 = 1024;
                      v75 = 1512;
                      goto LABEL_181;
                    }
                    if (v29)
                    {
                      if (__osLog)
                        v49 = __osLog;
                      else
                        v49 = MEMORY[0x24BDACB70];
                      if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                        goto LABEL_182;
                      *(_DWORD *)buf = 136316162;
                      v67 = "!forCredentialSet";
                      v68 = 2048;
                      v69 = 0;
                      v70 = 2080;
                      v71 = &unk_21491C593;
                      v72 = 2080;
                      v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biomet"
                            "ricKitXPCServer.m";
                      v74 = 1024;
                      v75 = 1513;
                      goto LABEL_181;
                    }
                    if ((_BYTE)v64)
                    {
                      if (__osLog)
                        v49 = __osLog;
                      else
                        v49 = MEMORY[0x24BDACB70];
                      if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                        goto LABEL_182;
                      *(_DWORD *)buf = 136316162;
                      v67 = "!forPreArm";
                      v68 = 2048;
                      v69 = 0;
                      v70 = 2080;
                      v71 = &unk_21491C593;
                      v72 = 2080;
                      v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biomet"
                            "ricKitXPCServer.m";
                      v74 = 1024;
                      v75 = 1514;
                      goto LABEL_181;
                    }
                    objc_msgSend(v10, "setNoBioLockoutUserID:", v56);
                    v42 = objc_msgSend(v52, "parseAuthDict:toAuthData:", v12, objc_msgSend(v10, "noBioLockoutAuthData"));
                    if (!v42)
                      goto LABEL_48;
                    Data = v42;
                    if (__osLog)
                      v48 = __osLog;
                    else
                      v48 = MEMORY[0x24BDACB70];
                    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                    {
LABEL_69:

                      goto LABEL_62;
                    }
                    *(_DWORD *)buf = 136316162;
                    v67 = "err == 0 ";
                    v68 = 2048;
                    v69 = Data;
                    v70 = 2080;
                    v71 = &unk_21491C593;
                    v72 = 2080;
                    v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
                    v74 = 1024;
                    v75 = 1518;
                  }
                }
              }
            }
          }
        }
        _os_log_impl(&dword_2148C7000, v48, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        goto LABEL_69;
      }
    }
    v28 = 0;
    v29 = 0;
    v30 = 0;
    v31 = 0;
LABEL_49:
    objc_msgSend(v10, "setUserID:", v16);
    objc_msgSend(v10, "setSelectedIdentitiesBlob:", v28);
    objc_msgSend(v10, "setPriority:", v62);
    objc_msgSend(v10, "setForUnlock:", HIBYTE(v64));
    objc_msgSend(v10, "setForCredentialSet:", v31);
    objc_msgSend(v10, "setAcmContext:", v29);
    objc_msgSend(v10, "setForPreArm:", v64);
    objc_msgSend(v10, "setStopOnSuccess:", HIBYTE(v63));
    objc_msgSend(v10, "setUseCase:", v30);
    objc_msgSend(v10, "setNoBioLockout:", v63);
    objc_msgSend(v10, "setClient:", v14);
    if (v28)
      objc_msgSend(v10, "setProcessedFlags:", objc_msgSend(v10, "processedFlags") | 0x4000);
    if (HIBYTE(v64))
      objc_msgSend(v10, "setProcessedFlags:", objc_msgSend(v10, "processedFlags") | 1);
    if (v31)
      objc_msgSend(v10, "setProcessedFlags:", objc_msgSend(v10, "processedFlags") | 8);
    if ((_BYTE)v64)
      objc_msgSend(v10, "setProcessedFlags:", objc_msgSend(v10, "processedFlags") | 0x100);
    if (HIBYTE(v63))
      objc_msgSend(v10, "setProcessedFlags:", objc_msgSend(v10, "processedFlags") | 0x80);
    if ((_BYTE)v63)
      objc_msgSend(v10, "setProcessedFlags:", objc_msgSend(v10, "processedFlags") | 0x10);
    Data = 0;
    goto LABEL_62;
  }
  Data = v15;
  if (__osLog)
    v46 = __osLog;
  else
    v46 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v67 = "err == 0 ";
    v68 = 2048;
    v69 = Data;
    v70 = 2080;
    v71 = &unk_21491C593;
    v72 = 2080;
    v73 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v74 = 1024;
    v75 = 1437;
    _os_log_impl(&dword_2148C7000, v46, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
  v28 = 0;
  v29 = 0;
LABEL_62:

  return Data;
}

- (int)startMatchOperation:(id)a3
{
  char *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  int v11;
  NSObject *v12;
  int v13;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  int v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)a3;
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v18 = 138412290;
    v19 = v4;
    _os_log_impl(&dword_2148C7000, v6, OS_LOG_TYPE_DEBUG, "startMatchOperation: %@\n", (uint8_t *)&v18, 0xCu);
  }
  if (!v4)
  {
    if (__osLog)
      v15 = __osLog;
    else
      v15 = v5;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v18 = 136316162;
      v19 = "operation";
      v20 = 2048;
      v21 = 0;
      v22 = 2080;
      v23 = &unk_21491C593;
      v24 = 2080;
      v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v26 = 1024;
      v27 = 1569;
      _os_log_impl(&dword_2148C7000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
    }
    v13 = 258;
    goto LABEL_56;
  }
  if (!-[BiometricKitXPCServer identitiesCount](self, "identitiesCount") && !BYTE2(self->_mkbLockStatusNtfToken))
  {
    if (__osLog)
      v9 = __osLog;
    else
      v9 = v5;
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_55;
    v18 = 136316162;
    v19 = "([self identitiesCount] != 0) || (_templatesAtBoot)";
    v20 = 2048;
    v21 = 0;
    v22 = 2080;
    v23 = &unk_21491C593;
    v24 = 2080;
    v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v26 = 1024;
    v27 = 1570;
    goto LABEL_54;
  }
  if (!-[BiometricKitXPCServer validateAllUsers](self, "validateAllUsers"))
  {
    if (objc_msgSend(v4, "userID") == -1)
    {
      if (!-[BiometricKitXPCServer identitiesCount](self, "identitiesCount"))
      {
        if (__osLog)
          v9 = __osLog;
        else
          v9 = v5;
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          goto LABEL_55;
        v18 = 136316162;
        v19 = "[self identitiesCount] != 0";
        v20 = 2048;
        v21 = 0;
        v22 = 2080;
        v23 = &unk_21491C593;
        v24 = 2080;
        v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v26 = 1024;
        v27 = 1576;
        goto LABEL_54;
      }
    }
    else
    {
      -[BiometricKitXPCServer identitiesOfUser:](self, "identitiesOfUser:", objc_msgSend(v4, "userID"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      if (!v8)
      {
        if (__osLog)
          v9 = __osLog;
        else
          v9 = v5;
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          goto LABEL_55;
        v18 = 136316162;
        v19 = "[[self identitiesOfUser:operation.userID] count] != 0";
        v20 = 2048;
        v21 = 0;
        v22 = 2080;
        v23 = &unk_21491C593;
        v24 = 2080;
        v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v26 = 1024;
        v27 = 1579;
LABEL_54:
        _os_log_impl(&dword_2148C7000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
LABEL_55:
        v13 = 257;
        goto LABEL_56;
      }
    }
  }
  v10 = -[BiometricKitXPCServer checkCatacombForUser:](self, "checkCatacombForUser:", objc_msgSend(v4, "userID"));
  if (v10)
  {
    v13 = v10;
    if (__osLog)
      v16 = __osLog;
    else
      v16 = v5;
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_56;
    v18 = 136316162;
    v19 = "err == 0 ";
    v20 = 2048;
    v21 = v13;
    v22 = 2080;
    v23 = &unk_21491C593;
    v24 = 2080;
    v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v26 = 1024;
    v27 = 1585;
LABEL_43:
    _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
LABEL_56:
    if (__osLogTrace)
      v17 = __osLogTrace;
    else
      v17 = v5;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = 67109120;
      LODWORD(v19) = v13;
      _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_ERROR, "startMatchOperation: -> %d\n", (uint8_t *)&v18, 8u);
    }
    goto LABEL_26;
  }
  v11 = -[BiometricKitXPCServer performMatchCommand:](self, "performMatchCommand:", v4);
  if (v11)
  {
    v13 = v11;
    if (__osLog)
      v16 = __osLog;
    else
      v16 = v5;
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_56;
    v18 = 136316162;
    v19 = "err == 0 ";
    v20 = 2048;
    v21 = v13;
    v22 = 2080;
    v23 = &unk_21491C593;
    v24 = 2080;
    v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v26 = 1024;
    v27 = 1588;
    goto LABEL_43;
  }
  if (__osLogTrace)
    v12 = __osLogTrace;
  else
    v12 = v5;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v18 = 67109120;
    LODWORD(v19) = 0;
    _os_log_impl(&dword_2148C7000, v12, OS_LOG_TYPE_DEBUG, "startMatchOperation: -> %d\n", (uint8_t *)&v18, 8u);
  }
  v13 = 0;
LABEL_26:

  return v13;
}

- (int)detectPresenceWithOptions:(id)a3 withClient:(id)a4
{
  char *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  os_log_type_t v15;
  NSObject *v17;
  NSObject *v18;
  int v19;
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = (char *)a3;
  v7 = a4;
  v8 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v9 = __osLogTrace;
  else
    v9 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412546;
    v20 = v6;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_2148C7000, v9, OS_LOG_TYPE_DEFAULT, "detectPresenceWithOptions:withClient: %@ %@\n", (uint8_t *)&v19, 0x16u);
  }
  if (BYTE1(self->_mkbLockStatusNtfToken))
    kdebug_trace();
  -[BiometricKitXPCServer createPresenceDetectOperation](self, "createPresenceDetectOperation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = -[BiometricKitXPCServer initPresenceDetectOperation:options:client:](self, "initPresenceDetectOperation:options:client:", v10, v6, v7);
    if (v11)
    {
      v12 = v11;
      if (__osLog)
        v18 = __osLog;
      else
        v18 = v8;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = 136316162;
        v20 = "err == 0 ";
        v21 = 2048;
        v22 = (id)v12;
        v23 = 2080;
        v24 = &unk_21491C593;
        v25 = 2080;
        v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v27 = 1024;
        v28 = 1615;
LABEL_39:
        _os_log_impl(&dword_2148C7000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v19, 0x30u);
      }
    }
    else
    {
      v12 = -[BiometricKitXPCServer processBioOperation:](self, "processBioOperation:", v10);
      if (v12)
      {
        v18 = (__osLog ? __osLog : v8);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v19 = 136316162;
          v20 = "err == 0 ";
          v21 = 2048;
          v22 = (id)v12;
          v23 = 2080;
          v24 = &unk_21491C593;
          v25 = 2080;
          v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
          v27 = 1024;
          v28 = 1618;
          goto LABEL_39;
        }
      }
    }
  }
  else
  {
    if (__osLog)
      v17 = __osLog;
    else
      v17 = v8;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = 136316162;
      v20 = "pdetOperation";
      v21 = 2048;
      v22 = 0;
      v23 = 2080;
      v24 = &unk_21491C593;
      v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v27 = 1024;
      v28 = 1612;
      _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v19, 0x30u);
    }
    v12 = 260;
  }
  if (BYTE1(self->_mkbLockStatusNtfToken))
    kdebug_trace();
  if (__osLogTrace)
    v13 = __osLogTrace;
  else
    v13 = v8;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v19 = 67109120;
      LODWORD(v20) = v12;
      v14 = v13;
      v15 = OS_LOG_TYPE_ERROR;
LABEL_21:
      _os_log_impl(&dword_2148C7000, v14, v15, "detectPresenceWithOptions:withClient: -> %d\n", (uint8_t *)&v19, 8u);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v19 = 67109120;
    LODWORD(v20) = 0;
    v14 = v13;
    v15 = OS_LOG_TYPE_DEBUG;
    goto LABEL_21;
  }

  return v12;
}

- (id)createPresenceDetectOperation
{
  return objc_alloc_init(BiometricPresenceDetectOperation);
}

- (int)initPresenceDetectOperation:(id)a3 options:(id)a4 client:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int Integer;
  int Bool;
  int v13;
  NSObject *v15;
  NSObject *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!v7)
  {
    if (__osLog)
      v15 = __osLog;
    else
      v15 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    *(_DWORD *)buf = 136316162;
    v18 = "operation";
    v19 = 2048;
    v20 = 0;
    v21 = 2080;
    v22 = &unk_21491C593;
    v23 = 2080;
    v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v25 = 1024;
    v26 = 1649;
    goto LABEL_18;
  }
  if (!v9)
  {
    if (__osLog)
      v15 = __osLog;
    else
      v15 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    *(_DWORD *)buf = 136316162;
    v18 = "client";
    v19 = 2048;
    v20 = 0;
    v21 = 2080;
    v22 = &unk_21491C593;
    v23 = 2080;
    v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v25 = 1024;
    v26 = 1650;
LABEL_18:
    _os_log_impl(&dword_2148C7000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_19:
    v13 = 258;
    goto LABEL_7;
  }
  if (!v8)
  {
LABEL_6:
    objc_msgSend(v7, "setPriority:", 0x8000000000000064);
    objc_msgSend(v7, "setClient:", v10);
    v13 = 0;
    goto LABEL_7;
  }
  Integer = dictionaryGetInteger();
  if (Integer)
  {
    v13 = Integer;
    if (__osLog)
      v16 = __osLog;
    else
      v16 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v18 = "err == 0 ";
      v19 = 2048;
      v20 = v13;
      v21 = 2080;
      v22 = &unk_21491C593;
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v25 = 1024;
      v26 = 1654;
LABEL_30:
      _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    Bool = dictionaryGetBool();
    if (!Bool)
      goto LABEL_6;
    v13 = Bool;
    if (__osLog)
      v16 = __osLog;
    else
      v16 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v18 = "err == 0 ";
      v19 = 2048;
      v20 = v13;
      v21 = 2080;
      v22 = &unk_21491C593;
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v25 = 1024;
      v26 = 1657;
      goto LABEL_30;
    }
  }
LABEL_7:

  return v13;
}

- (int)startPresenceDetectOperation:(id)a3
{
  char *v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  os_log_type_t v10;
  NSObject *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)a3;
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v14 = 138412290;
    v15 = v4;
    _os_log_impl(&dword_2148C7000, v6, OS_LOG_TYPE_DEBUG, "startPresenceDetectOperation: %@\n", (uint8_t *)&v14, 0xCu);
  }
  v7 = -[BiometricKitXPCServer performPresenceDetectCommand:](self, "performPresenceDetectCommand:", v4);
  if (v7)
  {
    if (__osLog)
      v12 = __osLog;
    else
      v12 = v5;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 136316162;
      v15 = "err == 0 ";
      v16 = 2048;
      v17 = v7;
      v18 = 2080;
      v19 = &unk_21491C593;
      v20 = 2080;
      v21 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v22 = 1024;
      v23 = 1688;
      _os_log_impl(&dword_2148C7000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v14, 0x30u);
    }
    if (__osLogTrace)
      v13 = __osLogTrace;
    else
      v13 = v5;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = 67109120;
      LODWORD(v15) = v7;
      v9 = v13;
      v10 = OS_LOG_TYPE_ERROR;
      goto LABEL_12;
    }
  }
  else
  {
    if (__osLogTrace)
      v8 = __osLogTrace;
    else
      v8 = v5;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v14 = 67109120;
      LODWORD(v15) = 0;
      v9 = v8;
      v10 = OS_LOG_TYPE_DEBUG;
LABEL_12:
      _os_log_impl(&dword_2148C7000, v9, v10, "startPresenceDetectOperation: -> %d\n", (uint8_t *)&v14, 8u);
    }
  }

  return v7;
}

- (int)cancelWithClient:(id)a3
{
  id v4;
  NSObject *v5;
  OS_dispatch_queue *v6;
  NSMutableArray *activeBioOpsQueue;
  id v8;
  _BOOL4 v9;
  NSMutableArray *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  _BOOL4 v17;
  NSMutableArray *v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  os_log_type_t v22;
  NSObject *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE buf[12];
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (__osLogTrace)
    v5 = __osLogTrace;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v4;
    _os_log_impl(&dword_2148C7000, v5, OS_LOG_TYPE_DEBUG, "cancelWithClient: %@\n", buf, 0xCu);
  }
  if (BYTE1(self->_mkbLockStatusNtfToken))
    kdebug_trace();
  v6 = self->_cmdDispatchQueue;
  objc_sync_enter(v6);
  activeBioOpsQueue = self->_activeBioOpsQueue;
  if (activeBioOpsQueue)
  {
    if (-[NSMutableArray status](activeBioOpsQueue, "status") != 2
      || (-[NSMutableArray client](self->_activeBioOpsQueue, "client"),
          v8 = (id)objc_claimAutoreleasedReturnValue(),
          v9 = v8 == v4,
          v8,
          !v9))
    {
      v10 = self->_bioOpsQueue;
      objc_sync_enter(v10);
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v11 = self->_bioOpsQueue;
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v26;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v26 != v13)
              objc_enumerationMutation(v11);
            v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            objc_msgSend(v15, "client", (_QWORD)v25);
            v16 = (id)objc_claimAutoreleasedReturnValue();
            v17 = v16 == v4;

            if (v17)
            {
              objc_msgSend(v15, "setStatus:", 4);

              objc_sync_exit(v10);
              goto LABEL_25;
            }
          }
          v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          if (v12)
            continue;
          break;
        }
      }

      objc_sync_exit(v10);
      -[BiometricKitXPCServer removeBioOperationOfClient:](self, "removeBioOperationOfClient:", v4);
      goto LABEL_25;
    }
    v18 = self->_activeBioOpsQueue;
    if (v18)
      -[NSMutableArray setStatus:](v18, "setStatus:", 4);
  }
  if (-[OS_dispatch_queue count](self->_cmdDispatchQueue, "count"))
  {
    -[BiometricKitXPCServer resumeQueuedBioOperation](self, "resumeQueuedBioOperation");
LABEL_25:
    v19 = 0;
    goto LABEL_26;
  }
  v19 = -[BiometricKitXPCServer performCancelCommand](self, "performCancelCommand");
  if (v19)
  {
    v24 = (__osLog ? __osLog : MEMORY[0x24BDACB70]);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "err == 0 ";
      v31 = 2048;
      v32 = v19;
      v33 = 2080;
      v34 = &unk_21491C593;
      v35 = 2080;
      v36 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v37 = 1024;
      v38 = 1730;
      _os_log_impl(&dword_2148C7000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
LABEL_26:
  objc_sync_exit(v6);

  if (BYTE1(self->_mkbLockStatusNtfToken))
    kdebug_trace();
  if (__osLogTrace)
    v20 = __osLogTrace;
  else
    v20 = MEMORY[0x24BDACB70];
  if (v19)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v19;
      v21 = v20;
      v22 = OS_LOG_TYPE_ERROR;
LABEL_36:
      _os_log_impl(&dword_2148C7000, v21, v22, "cancelWithClient: -> %d\n", buf, 8u);
    }
  }
  else if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_QWORD *)buf = 67109120;
    v21 = v20;
    v22 = OS_LOG_TYPE_DEBUG;
    goto LABEL_36;
  }

  return v19;
}

- (void)registerDelegate:(BOOL)a3 withClient:(id)a4
{
  _BOOL4 v4;
  id v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  id v9;
  uint64_t v10;

  v4 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (__osLog)
    v6 = __osLog;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109378;
    v7[1] = v4;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_2148C7000, v6, OS_LOG_TYPE_DEFAULT, "registerDelegate:withClient: %d %@ -> void\n", (uint8_t *)v7, 0x12u);
  }

}

- (void)notifyAppIsInactive:(BOOL)a3 withClient:(id)a4
{
  _BOOL4 v4;
  id v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  id v9;
  uint64_t v10;

  v4 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (__osLog)
    v6 = __osLog;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109378;
    v7[1] = v4;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_2148C7000, v6, OS_LOG_TYPE_DEFAULT, "notifyAppIsInactive:withClient: %d %@ -> void\n", (uint8_t *)v7, 0x12u);
  }

}

- (int)startBioOperation:(id)a3
{
  char *v5;
  NSObject *v6;
  NSObject *v7;
  NSMutableArray *v8;
  int v9;
  int v10;
  int v11;
  NSMutableArray *activeBioOpsQueue;
  NSObject *v13;
  NSMutableArray *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSMutableArray *v18;
  NSObject *v19;
  int v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = (char *)a3;
  v6 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v7 = __osLogTrace;
  else
    v7 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v21 = 138412290;
    v22 = v5;
    _os_log_impl(&dword_2148C7000, v7, OS_LOG_TYPE_DEBUG, "startBioOperation: %@\n", (uint8_t *)&v21, 0xCu);
  }
  if (!v5)
  {
    if (__osLog)
      v17 = __osLog;
    else
      v17 = v6;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v21 = 136316162;
      v22 = "bioOp";
      v23 = 2048;
      v24 = 0;
      v25 = 2080;
      v26 = &unk_21491C593;
      v27 = 2080;
      v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v29 = 1024;
      v30 = 1795;
      _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v21, 0x30u);
    }
    goto LABEL_49;
  }
  v8 = self->_bioOpsQueue;
  objc_sync_enter(v8);
  -[NSMutableArray addObject:](self->_bioOpsQueue, "addObject:", v5);
  objc_sync_exit(v8);

  v9 = objc_msgSend(v5, "type");
  switch(v9)
  {
    case 1:
      v10 = -[BiometricKitXPCServer startEnrollOperation:](self, "startEnrollOperation:", v5);
      break;
    case 2:
      v10 = -[BiometricKitXPCServer startMatchOperation:](self, "startMatchOperation:", v5);
      break;
    case 3:
      v10 = -[BiometricKitXPCServer startPresenceDetectOperation:](self, "startPresenceDetectOperation:", v5);
      break;
    default:
      if (__osLog)
        v13 = __osLog;
      else
        v13 = v6;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v21 = 136316162;
        v22 = "err == 0 ";
        v23 = 2048;
        v11 = 258;
        v24 = 258;
        v25 = 2080;
        v26 = &unk_21491C593;
        v27 = 2080;
        v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v29 = 1024;
        v30 = 1819;
LABEL_37:
        _os_log_impl(&dword_2148C7000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v21, 0x30u);
LABEL_50:
        v18 = self->_bioOpsQueue;
        objc_sync_enter(v18);
        -[NSMutableArray removeObject:](self->_bioOpsQueue, "removeObject:", v5);
        objc_sync_exit(v18);

        if (__osLogTrace)
          v19 = __osLogTrace;
        else
          v19 = v6;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v21 = 67109120;
          LODWORD(v22) = v11;
          _os_log_impl(&dword_2148C7000, v19, OS_LOG_TYPE_ERROR, "startBioOperation: -> %d\n", (uint8_t *)&v21, 8u);
        }
        goto LABEL_55;
      }
LABEL_49:
      v11 = 258;
      goto LABEL_50;
  }
  v11 = v10;
  if (v10)
  {
    activeBioOpsQueue = self->_activeBioOpsQueue;
    if (activeBioOpsQueue
      && (-[NSMutableArray status](activeBioOpsQueue, "status") == 3
       || -[NSMutableArray status](self->_activeBioOpsQueue, "status") == 4))
    {
      if (-[NSMutableArray status](self->_activeBioOpsQueue, "status") == 3)
        -[OS_dispatch_queue insertObject:atIndex:](self->_cmdDispatchQueue, "insertObject:atIndex:", self->_activeBioOpsQueue, 0);
      -[BiometricKitXPCServer performCancelCommand](self, "performCancelCommand");
    }
    if (__osLog)
      v13 = __osLog;
    else
      v13 = v6;
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_50;
    v21 = 136316162;
    v22 = "err == 0 ";
    v23 = 2048;
    v24 = v11;
    v25 = 2080;
    v26 = &unk_21491C593;
    v27 = 2080;
    v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v29 = 1024;
    v30 = 1860;
    goto LABEL_37;
  }
  v14 = self->_bioOpsQueue;
  objc_sync_enter(v14);
  if (!-[NSMutableArray count](self->_bioOpsQueue, "count"))
  {
    -[BiometricKitXPCServer performCancelCommand](self, "performCancelCommand");
    if (__osLog)
      v16 = __osLog;
    else
      v16 = v6;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v21 = 136316162;
      v22 = "err == 0 ";
      v23 = 2048;
      v24 = 257;
      v25 = 2080;
      v26 = &unk_21491C593;
      v27 = 2080;
      v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v29 = 1024;
      v30 = 1834;
      _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v21, 0x30u);
    }
    objc_sync_exit(v14);

    v11 = 257;
    goto LABEL_50;
  }
  objc_sync_exit(v14);

  objc_msgSend(v5, "setStatus:", 2);
  objc_storeStrong((id *)&self->_activeBioOpsQueue, a3);
  -[ActivityTracker setActive:](self->_ongoingCatacombSaveTimer, "setActive:", 1);
  if (__osLogTrace)
    v15 = __osLogTrace;
  else
    v15 = v6;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v21 = 67109120;
    LODWORD(v22) = 0;
    _os_log_impl(&dword_2148C7000, v15, OS_LOG_TYPE_DEBUG, "startBioOperation: -> %d\n", (uint8_t *)&v21, 8u);
  }
  v11 = 0;
LABEL_55:

  return v11;
}

- (void)removeBioOperationOfClient:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  OS_dispatch_queue *v7;
  OS_dispatch_queue *cmdDispatchQueue;
  id v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL (*v14)(uint64_t, void *, uint64_t, _BYTE *);
  void *v15;
  id v16;
  BiometricKitXPCServer *v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v4;
    _os_log_impl(&dword_2148C7000, v6, OS_LOG_TYPE_DEBUG, "removeBioOperationOfClient: %@\n", buf, 0xCu);
  }
  v7 = self->_cmdDispatchQueue;
  objc_sync_enter(v7);
  cmdDispatchQueue = self->_cmdDispatchQueue;
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __52__BiometricKitXPCServer_removeBioOperationOfClient___block_invoke;
  v15 = &unk_24D241388;
  v9 = v4;
  v16 = v9;
  v17 = self;
  v10 = -[OS_dispatch_queue indexOfObjectPassingTest:](cmdDispatchQueue, "indexOfObjectPassingTest:", &v12);
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    -[OS_dispatch_queue removeObjectAtIndex:](self->_cmdDispatchQueue, "removeObjectAtIndex:", v10, v12, v13, v14, v15);

  objc_sync_exit(v7);
  if (__osLogTrace)
    v11 = __osLogTrace;
  else
    v11 = v5;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_DEBUG, "removeBioOperationOfClient: -> void\n", buf, 2u);
  }

}

BOOL __52__BiometricKitXPCServer_removeBioOperationOfClient___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a2;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v6, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {
    if (objc_msgSend(v6, "status") == 3)
      objc_msgSend(*(id *)(a1 + 40), "sendStatusMessage:toClient:", objc_msgSend(v6, "taskResumedMessage"), *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "sendStatusMessage:toClient:", objc_msgSend(v6, "cancelledMessage"), *(_QWORD *)(a1 + 32));
    *a4 = 1;
  }

  return v7 == v8;
}

- (int)pauseBioOperation:(id)a3
{
  char *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  OS_dispatch_queue *cmdDispatchQueue;
  char *v10;
  uint64_t v11;
  OS_dispatch_queue *v12;
  NSObject *v13;
  int v14;
  NSObject *v16;
  NSObject *v17;
  _QWORD v18[4];
  char *v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)a3;
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v4;
    _os_log_impl(&dword_2148C7000, v6, OS_LOG_TYPE_DEBUG, "pauseBioOperation: %@\n", buf, 0xCu);
  }
  if (v4)
  {
    objc_msgSend(v4, "setStatus:", 3);
    v7 = objc_msgSend(v4, "taskPausedMessage");
    objc_msgSend(v4, "client");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BiometricKitXPCServer sendStatusMessage:toClient:](self, "sendStatusMessage:toClient:", v7, v8);

    cmdDispatchQueue = self->_cmdDispatchQueue;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __43__BiometricKitXPCServer_pauseBioOperation___block_invoke;
    v18[3] = &unk_24D2413B0;
    v10 = v4;
    v19 = v10;
    v11 = -[OS_dispatch_queue indexOfObjectPassingTest:](cmdDispatchQueue, "indexOfObjectPassingTest:", v18);

    v12 = self->_cmdDispatchQueue;
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      -[OS_dispatch_queue addObject:](v12, "addObject:", v10);
    else
      -[OS_dispatch_queue insertObject:atIndex:](v12, "insertObject:atIndex:", v10, v11);
    if (__osLogTrace)
      v13 = __osLogTrace;
    else
      v13 = v5;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v21) = 0;
      _os_log_impl(&dword_2148C7000, v13, OS_LOG_TYPE_DEBUG, "pauseBioOperation: -> %d\n", buf, 8u);
    }
    v14 = 0;
  }
  else
  {
    if (__osLog)
      v16 = __osLog;
    else
      v16 = v5;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v21 = "bioOp";
      v22 = 2048;
      v23 = 0;
      v24 = 2080;
      v25 = &unk_21491C593;
      v26 = 2080;
      v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v28 = 1024;
      v29 = 1927;
      _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    if (__osLogTrace)
      v17 = __osLogTrace;
    else
      v17 = v5;
    v14 = 258;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v21) = 258;
      _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_ERROR, "pauseBioOperation: -> %d\n", buf, 8u);
    }
  }

  return v14;
}

BOOL __43__BiometricKitXPCServer_pauseBioOperation___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  v7 = objc_msgSend(v5, "priority");
  v8 = objc_msgSend(v6, "priority");

  if (v7 >= v8)
    *a4 = 1;
  return v7 >= v8;
}

- (void)resumeQueuedBioOperation
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v3 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v4 = __osLogTrace;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2148C7000, v4, OS_LOG_TYPE_DEBUG, "resumeQueuedBioOperation\n", buf, 2u);
  }
  do
  {
    if (!-[OS_dispatch_queue count](self->_cmdDispatchQueue, "count"))
      break;
    -[OS_dispatch_queue objectAtIndex:](self->_cmdDispatchQueue, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[OS_dispatch_queue removeObject:](self->_cmdDispatchQueue, "removeObject:", v5);
    v6 = -[BiometricKitXPCServer startBioOperation:](self, "startBioOperation:", v5);
    if ((_DWORD)v6)
      v7 = objc_msgSend(v5, "taskResumeFailedMessage");
    else
      v7 = objc_msgSend(v5, "taskResumedMessage");
    v8 = v7;
    if ((_DWORD)v7)
    {
      objc_msgSend(v5, "client");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[BiometricKitXPCServer sendStatusMessage:toClient:](self, "sendStatusMessage:toClient:", v8, v9);

      objc_msgSend(v5, "client");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "taskResumeStatus:", v6);

    }
  }
  while ((_DWORD)v6);
  if (__osLogTrace)
    v11 = __osLogTrace;
  else
    v11 = v3;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_DEBUG, "resumeQueuedBioOperation: -> void\n", v12, 2u);
  }
}

- (int)processBioOperation:(id)a3
{
  char *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  _BOOL4 v8;
  OS_dispatch_queue *v9;
  void *v10;
  NSMutableArray *activeBioOpsQueue;
  void *v12;
  void *v13;
  _BOOL4 v14;
  NSMutableArray *v15;
  uint64_t v16;
  int v17;
  void *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v25;
  int v26;
  const char *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)a3;
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v26 = 138412290;
    v27 = v4;
    _os_log_impl(&dword_2148C7000, v6, OS_LOG_TYPE_DEBUG, "processBioOperation: %@\n", (uint8_t *)&v26, 0xCu);
  }
  if (!v4)
  {
    if (__osLog)
      v25 = __osLog;
    else
      v25 = v5;
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_49;
    v26 = 136316162;
    v27 = "bioOp";
    v28 = 2048;
    v29 = 0;
    v30 = 2080;
    v31 = &unk_21491C593;
    v32 = 2080;
    v33 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v34 = 1024;
    v35 = 2011;
    goto LABEL_48;
  }
  objc_msgSend(v4, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v8)
  {
    if (__osLog)
      v25 = __osLog;
    else
      v25 = v5;
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_49;
    v26 = 136316162;
    v27 = "bioOp.client";
    v28 = 2048;
    v29 = 0;
    v30 = 2080;
    v31 = &unk_21491C593;
    v32 = 2080;
    v33 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v34 = 1024;
    v35 = 2012;
LABEL_48:
    _os_log_impl(&dword_2148C7000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v26, 0x30u);
LABEL_49:
    v20 = 258;
    goto LABEL_26;
  }
  objc_msgSend(v4, "setStatus:", 1);
  v9 = self->_cmdDispatchQueue;
  objc_sync_enter(v9);
  objc_msgSend(v4, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BiometricKitXPCServer removeBioOperationOfClient:](self, "removeBioOperationOfClient:", v10);

  activeBioOpsQueue = self->_activeBioOpsQueue;
  if (!activeBioOpsQueue)
    goto LABEL_23;
  -[NSMutableArray client](activeBioOpsQueue, "client");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "client");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 == v13;

  v15 = self->_activeBioOpsQueue;
  if (!v14)
  {
    v16 = -[NSMutableArray priority](v15, "priority");
    if (v16 > objc_msgSend(v4, "priority"))
    {
      v17 = -[BiometricKitXPCServer pauseBioOperation:](self, "pauseBioOperation:", v4);
LABEL_24:
      v20 = v17;
      goto LABEL_25;
    }
    if (-[NSMutableArray type](self->_activeBioOpsQueue, "type") == 1
      || -[NSMutableArray type](self->_activeBioOpsQueue, "type") == 2
      && (-[NSMutableArray forPreArm](self->_activeBioOpsQueue, "forPreArm") & 1) != 0)
    {
      v21 = 4;
LABEL_22:
      -[NSMutableArray setStatus:](self->_activeBioOpsQueue, "setStatus:", v21);
      goto LABEL_23;
    }
    if (-[NSMutableArray status](self->_activeBioOpsQueue, "status") != 4)
    {
      v21 = 3;
      goto LABEL_22;
    }
LABEL_23:
    v17 = -[BiometricKitXPCServer startBioOperation:](self, "startBioOperation:", v4);
    goto LABEL_24;
  }
  -[NSMutableArray setStatus:](v15, "setStatus:", 4);
  if (!-[OS_dispatch_queue count](self->_cmdDispatchQueue, "count"))
    goto LABEL_23;
  -[OS_dispatch_queue firstObject](self->_cmdDispatchQueue, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "priority");
  LODWORD(v19) = v19 > objc_msgSend(v4, "priority");

  if (!(_DWORD)v19)
    goto LABEL_23;
  v20 = -[BiometricKitXPCServer pauseBioOperation:](self, "pauseBioOperation:", v4);
  if (!v20)
  {
    -[BiometricKitXPCServer resumeQueuedBioOperation](self, "resumeQueuedBioOperation");
    v20 = 0;
  }
LABEL_25:
  objc_sync_exit(v9);

  -[BiometricKitXPCServer updateActiveOperationNotification](self, "updateActiveOperationNotification");
  if (v20)
  {
LABEL_26:
    if (__osLogTrace)
      v22 = __osLogTrace;
    else
      v22 = v5;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v26 = 67109120;
      LODWORD(v27) = v20;
      _os_log_impl(&dword_2148C7000, v22, OS_LOG_TYPE_ERROR, "processBioOperation:withPriority:withParams:withClient: -> %d\n", (uint8_t *)&v26, 8u);
    }
    goto LABEL_37;
  }
  if (__osLogTrace)
    v23 = __osLogTrace;
  else
    v23 = v5;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    v26 = 67109120;
    LODWORD(v27) = 0;
    _os_log_impl(&dword_2148C7000, v23, OS_LOG_TYPE_DEBUG, "processBioOperation:withPriority:withParams:withClient: -> %d\n", (uint8_t *)&v26, 8u);
  }
  v20 = 0;
LABEL_37:

  return v20;
}

- (void)switchToNextBioOperation:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSObject *v6;
  OS_dispatch_queue *v7;
  NSMutableArray *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSMutableArray *activeBioOpsQueue;
  int v14;
  NSMutableArray *v15;
  BOOL v16;
  void *v17;
  void *v18;
  _DWORD v19[2];
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x24BDAC8D0];
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v19[0] = 67109120;
    v19[1] = v3;
    _os_log_impl(&dword_2148C7000, v6, OS_LOG_TYPE_DEBUG, "switchToNextBioOperation: %d\n", (uint8_t *)v19, 8u);
  }
  v7 = self->_cmdDispatchQueue;
  objc_sync_enter(v7);
  v8 = self->_bioOpsQueue;
  objc_sync_enter(v8);
  if (!-[NSMutableArray count](self->_bioOpsQueue, "count"))
    goto LABEL_11;
  -[NSMutableArray objectAtIndex:](self->_bioOpsQueue, "objectAtIndex:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "status") == 3)
  {
    v10 = objc_msgSend(v9, "taskPausedMessage");
    objc_msgSend(v9, "client");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BiometricKitXPCServer sendStatusMessage:toClient:](self, "sendStatusMessage:toClient:", v10, v11);

    -[OS_dispatch_queue insertObject:atIndex:](self->_cmdDispatchQueue, "insertObject:atIndex:", v9, 0);
  }
  -[NSMutableArray removeObject:](self->_bioOpsQueue, "removeObject:", v9);
  if (-[NSMutableArray count](self->_bioOpsQueue, "count"))
  {

LABEL_11:
    objc_sync_exit(v8);

    goto LABEL_12;
  }
  -[ActivityTracker setActive:](self->_ongoingCatacombSaveTimer, "setActive:", 0);

  objc_sync_exit(v8);
  activeBioOpsQueue = self->_activeBioOpsQueue;
  if (activeBioOpsQueue)
  {
    v14 = -[NSMutableArray status](activeBioOpsQueue, "status");
    v15 = self->_activeBioOpsQueue;
    self->_activeBioOpsQueue = 0;

    v16 = (v14 - 3) < 2;
    if (v3)
      goto LABEL_25;
  }
  else
  {
    v16 = 0;
    if (v3)
    {
LABEL_25:
      -[BiometricKitXPCServer resumeQueuedBioOperation](self, "resumeQueuedBioOperation");
      goto LABEL_12;
    }
  }
  if (v16)
    goto LABEL_25;
  while (-[OS_dispatch_queue count](self->_cmdDispatchQueue, "count"))
  {
    -[OS_dispatch_queue objectAtIndex:](self->_cmdDispatchQueue, "objectAtIndex:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "client");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[BiometricKitXPCServer removeBioOperationOfClient:](self, "removeBioOperationOfClient:", v18);

  }
  -[ActivityTracker setActive:](self->_ongoingCatacombSaveTimer, "setActive:", 0);
LABEL_12:
  objc_sync_exit(v7);

  -[BiometricKitXPCServer updateActiveOperationNotification](self, "updateActiveOperationNotification");
  if (__osLogTrace)
    v12 = __osLogTrace;
  else
    v12 = v5;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v19[0]) = 0;
    _os_log_impl(&dword_2148C7000, v12, OS_LOG_TYPE_DEBUG, "switchToNextBioOperation: -> void\n", (uint8_t *)v19, 2u);
  }
}

- (void)stopBioOperationsAfterReconnect
{
  NSObject *v3;
  OS_dispatch_queue *v4;
  NSMutableArray *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSMutableArray *activeBioOpsQueue;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[16];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (__osLogTrace)
    v3 = __osLogTrace;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2148C7000, v3, OS_LOG_TYPE_DEBUG, "stopBioOperationsAfterReconnect\n", buf, 2u);
  }
  v4 = self->_cmdDispatchQueue;
  objc_sync_enter(v4);
  v5 = self->_bioOpsQueue;
  objc_sync_enter(v5);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  while (-[NSMutableArray count](self->_bioOpsQueue, "count"))
  {
    objc_msgSend(v6, "addObjectsFromArray:", self->_bioOpsQueue);
    -[NSMutableArray removeAllObjects](self->_bioOpsQueue, "removeAllObjects");
  }
  if (-[OS_dispatch_queue count](self->_cmdDispatchQueue, "count"))
  {
    objc_msgSend(v6, "addObjectsFromArray:", self->_cmdDispatchQueue);
    -[OS_dispatch_queue removeAllObjects](self->_cmdDispatchQueue, "removeAllObjects");
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "status", (_QWORD)v19);
        if (v12 != 1)
        {
          if (v12 == 3)
          {
            v13 = objc_msgSend(v11, "taskResumedMessage");
            objc_msgSend(v11, "client");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[BiometricKitXPCServer sendStatusMessage:toClient:](self, "sendStatusMessage:toClient:", v13, v14);

          }
          v15 = objc_msgSend(v11, "cancelledMessage");
          objc_msgSend(v11, "client");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[BiometricKitXPCServer sendStatusMessage:toClient:](self, "sendStatusMessage:toClient:", v15, v16);

        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v8);
  }

  activeBioOpsQueue = self->_activeBioOpsQueue;
  if (activeBioOpsQueue)
  {
    self->_activeBioOpsQueue = 0;

  }
  -[ActivityTracker setActive:](self->_ongoingCatacombSaveTimer, "setActive:", 0, (_QWORD)v19);

  objc_sync_exit(v5);
  objc_sync_exit(v4);

  if (__osLogTrace)
    v18 = __osLogTrace;
  else
    v18 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2148C7000, v18, OS_LOG_TYPE_DEBUG, "stopBioOperationsAfterReconnect -> void\n", buf, 2u);
  }
}

- (void)updateActiveOperationNotificationWithOverride:(int)a3
{
  uint64_t v3;
  NSMutableArray *v5;
  void *v6;
  void *v7;
  int v8;
  BOOL v9;
  int v10;
  int v11;
  char v12;
  unsigned int v13;
  NSObject *v14;
  uint64_t state64;
  uint8_t buf[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (self->_activeOperationNtfTokenValid)
  {
    LODWORD(v3) = a3;
    v5 = self->_bioOpsQueue;
    objc_sync_enter(v5);
    -[NSMutableArray firstObject](self->_bioOpsQueue, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = objc_msgSend(v6, "type");
      v9 = v8 != 3;
      if (v8 == 3)
        v10 = 3;
      else
        v10 = 0;
      if (v8 == 2)
      {
        v9 = 0;
        v11 = 2;
      }
      else
      {
        v11 = v10;
      }
      v12 = v8 != 1 && v9;
      if (v8 == 1)
        v13 = 1;
      else
        v13 = v11;
    }
    else
    {
      v13 = 0;
      v12 = 1;
    }
    if ((((_DWORD)v3 != 0) & v12) != 0)
      v3 = v3;
    else
      v3 = v13;
    state64 = -1;
    notify_get_state(self->_activeOperationNtfToken, &state64);
    if (state64 != v3)
    {
      notify_set_state(self->_activeOperationNtfToken, v3);
      notify_post("com.apple.BiometricKit.activeOperation");
      if (__osLog)
        v14 = __osLog;
      else
        v14 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v17 = v3;
        _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_DEFAULT, "updateActiveOperationNotificationWithOverride: posted value = %d\n", buf, 8u);
      }
    }

    objc_sync_exit(v5);
  }
}

- (void)updateActiveOperationNotification
{
  -[BiometricKitXPCServer updateActiveOperationNotificationWithOverride:](self, "updateActiveOperationNotificationWithOverride:", 0);
}

- (void)sendStatusMessage:(unsigned int)a3 toClient:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  NSObject *v7;
  _DWORD v8[2];
  __int16 v9;
  void *v10;
  uint64_t v11;

  v4 = *(_QWORD *)&a3;
  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = v5;
  if ((_DWORD)v4)
  {
    objc_msgSend(v5, "statusMessage:", v4);
    if (__osLog)
      v7 = __osLog;
    else
      v7 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109378;
      v8[1] = v4;
      v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_2148C7000, v7, OS_LOG_TYPE_DEFAULT, "sending status message %u to %@\n", (uint8_t *)v8, 0x12u);
    }
  }

}

- (BOOL)isClassCFileAccessible
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  _BOOL4 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v4 = __osLogTrace;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2148C7000, v4, OS_LOG_TYPE_DEBUG, "isClassCFileAccessible\n", buf, 2u);
  }
  v5 = MKBDeviceUnlockedSinceBoot();
  if (v5 >= 1)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__BiometricKitXPCServer_isClassCFileAccessible__block_invoke;
    block[3] = &unk_24D241268;
    block[4] = self;
    if (isClassCFileAccessible_onceToken != -1)
      dispatch_once(&isClassCFileAccessible_onceToken, block);
  }
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = v3;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    v10 = v5 > 0;
    _os_log_impl(&dword_2148C7000, v6, OS_LOG_TYPE_DEBUG, "isClassCFileAccessible -> %d\n", buf, 8u);
  }
  return v5 > 0;
}

void __47__BiometricKitXPCServer_isClassCFileAccessible__block_invoke(uint64_t a1)
{
  NSObject **v1;
  NSObject *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  NSObject **v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  id v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v1 = (NSObject **)&__osLog;
  v35 = *MEMORY[0x24BDAC8D0];
  v2 = MEMORY[0x24BDACB70];
  if (__osLog)
    v3 = __osLog;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2148C7000, v3, OS_LOG_TYPE_DEFAULT, "Starting catacomb file check\n", buf, 2u);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "lock");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "catacombDir");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  +[CatacombComponent masterComponent](CatacombComponent, "masterComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "catacombFileNameForComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v9, "fileExistsAtPath:", v8);

  if ((_DWORD)v6)
  {
    v10 = 0;
    v11 = 1;
    v12 = 0x24BDD1000uLL;
    v13 = 0x24BDBC000uLL;
    v30 = v8;
    while (1)
    {
      v14 = v10;
      v15 = *(void **)(v12 + 1400);
      objc_msgSend(*(id *)(v13 + 3912), "fileURLWithPath:", v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v14;
      objc_msgSend(v15, "fileHandleForReadingFromURL:error:", v16, &v32);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v32;

      if (v17)
        break;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Catacomb file check (attempt %d) failed, fileHandleForReadingFromURL(file:'%@') -> %@"), v11, v8, v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (isInternalBuild())
      {
        v19 = *(void **)(a1 + 32);
        v20 = v13;
        v21 = v12;
        v22 = v1;
        v23 = v2;
        v24 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringWithFormat:", CFSTR("%@ - %@"), v25, v18);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "writeStringToPersistentLog:", v26);

        v2 = v23;
        v1 = v22;
        v12 = v21;
        v13 = v20;
        v8 = v30;

      }
      if (*v1)
        v27 = *v1;
      else
        v27 = v2;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v34 = v18;
        _os_log_impl(&dword_2148C7000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@\n", buf, 0xCu);
      }
      sleep(1u);

      v11 = (v11 + 1);
      if ((_DWORD)v11 == 11)
        goto LABEL_30;
    }
    if (*v1)
      v29 = *v1;
    else
      v29 = v2;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2148C7000, v29, OS_LOG_TYPE_DEFAULT, "Catacomb file check succeeded\n", buf, 2u);
    }

  }
  else
  {
    if (__osLog)
      v28 = __osLog;
    else
      v28 = v2;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2148C7000, v28, OS_LOG_TYPE_DEFAULT, "Catacomb file check skipped (file not found)\n", buf, 2u);
    }
    v10 = 0;
  }
LABEL_30:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "unlock");

}

- (BOOL)isCatacombAccessible
{
  NSObject *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v4 = __osLogTrace;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v8[0]) = 0;
    _os_log_impl(&dword_2148C7000, v4, OS_LOG_TYPE_DEBUG, "isCatacombAccessible\n", (uint8_t *)v8, 2u);
  }
  v5 = -[BiometricKitXPCServer isClassCFileAccessible](self, "isClassCFileAccessible");
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = v3;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8[0] = 67109120;
    v8[1] = v5;
    _os_log_impl(&dword_2148C7000, v6, OS_LOG_TYPE_DEBUG, "isCatacombAccessible -> %d\n", (uint8_t *)v8, 8u);
  }
  return v5;
}

- (int)writeStringToPersistentLog:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v17;
  int v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForWritingAtPath:", CFSTR("/var/mobile/Library/Logs/biometrickitd.log"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    || (objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "createFileAtPath:contents:attributes:", CFSTR("/var/mobile/Library/Logs/biometrickitd.log"), 0, 0), v5, objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForWritingAtPath:", CFSTR("/var/mobile/Library/Logs/biometrickitd.log")), (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v4, "seekToEndOfFile");
    objc_msgSend(v3, "dataUsingEncoding:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v6);

    objc_msgSend(CFSTR("\n"), "dataUsingEncoding:", 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v7);

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attributesOfItemAtPath:error:", CFSTR("/var/mobile/Library/Logs/biometrickitd.log"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDD0D08]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = objc_msgSend(v10, "integerValue");
      else
        v11 = 0;

    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v4, "closeFile");

    if (v11 > 0x200000)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", CFSTR("/var/mobile/Library/Logs/biometrickitd.log"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        objc_msgSend(v12, "subdataWithRange:", v11 - 0x100000, 0x100000);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "writeToFile:atomically:", CFSTR("/var/mobile/Library/Logs/biometrickitd.log"), 0);
      }
      else
      {
        v14 = 0;
      }

    }
    v15 = 0;
  }
  else
  {
    if (__osLog)
      v17 = __osLog;
    else
      v17 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = 136316162;
      v19 = "fileHandle";
      v20 = 2048;
      v21 = 0;
      v22 = 2080;
      v23 = &unk_21491C593;
      v24 = 2080;
      v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v26 = 1024;
      v27 = 2369;
      _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
    }
    v15 = 268;
  }

  return v15;
}

- (id)hexDumpData:(char *)a3 size:(unint64_t)a4
{
  void *v6;
  unsigned int v7;
  NSObject *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    for (; a4; --a4)
    {
      v7 = *a3++;
      objc_msgSend(v6, "appendFormat:", CFSTR("%02x"), v7);
    }
  }
  else
  {
    if (__osLog)
      v9 = __osLog;
    else
      v9 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v11 = "data";
      v12 = 2048;
      v13 = 0;
      v14 = 2080;
      v15 = &unk_21491C593;
      v16 = 2080;
      v17 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v18 = 1024;
      v19 = 2425;
      _os_log_impl(&dword_2148C7000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  return v6;
}

- (int)logCatacombInfo:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  _QWORD v26[2];
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v26[0] = 0;
  v26[1] = 0;
  v27 = 0;
  if (v7)
  {
    ccsha1_di();
    objc_msgSend(v7, "length");
    v8 = objc_retainAutorelease(v7);
    objc_msgSend(v8, "bytes");
    ccdigest();
    v9 = (void *)MEMORY[0x24BDD16A8];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ - %@: "), v10, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[BiometricKitXPCServer hexDumpData:size:](self, "hexDumpData:size:", v26, 20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendFormat:", CFSTR("SHA1: %@, "), v12);

    objc_msgSend(v11, "appendFormat:", CFSTR("Size: %zu"), objc_msgSend(v8, "length"));
    v13 = -[BiometricKitXPCServer writeStringToPersistentLog:](self, "writeStringToPersistentLog:", v11);

  }
  else
  {
    if (__osLog)
      v15 = __osLog;
    else
      v15 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v17 = "data";
      v18 = 2048;
      v19 = 0;
      v20 = 2080;
      v21 = &unk_21491C593;
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v24 = 1024;
      v25 = 2446;
      _os_log_impl(&dword_2148C7000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v13 = 258;
  }

  return v13;
}

- (void)logCatacombUUIDForUser:(unsigned int)a3 catacombUUID:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  NSObject *v17;
  id v18;
  _QWORD v19[2];
  uint8_t buf[4];
  _BYTE v21[18];
  __int16 v22;
  void *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v4 = *(_QWORD *)&a3;
  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = v6;
  if ((_DWORD)v4 == -1)
  {
    if (__osLog)
      v17 = __osLog;
    else
      v17 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v21 = "userID != 4294967295U";
    *(_WORD *)&v21[8] = 2048;
    *(_QWORD *)&v21[10] = 0;
    v22 = 2080;
    v23 = &unk_21491C593;
    v24 = 2080;
    v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v26 = 1024;
    v27 = 2466;
    v13 = "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n";
LABEL_27:
    v14 = v17;
    v15 = OS_LOG_TYPE_ERROR;
    v16 = 48;
    goto LABEL_15;
  }
  if (!v6)
  {
    v18 = 0;
    v8 = -[BiometricKitXPCServer performGetCatacombUUIDCommand:outUUID:](self, "performGetCatacombUUIDCommand:outUUID:", v4, &v18);
    v7 = v18;
    if (v8)
    {
      if (__osLog)
        v17 = __osLog;
      else
        v17 = MEMORY[0x24BDACB70];
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        goto LABEL_16;
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v21 = "err == 0 ";
      *(_WORD *)&v21[8] = 2048;
      *(_QWORD *)&v21[10] = v8;
      v22 = 2080;
      v23 = &unk_21491C593;
      v24 = 2080;
      v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v26 = 1024;
      v27 = 2470;
      v13 = "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n";
      goto LABEL_27;
    }
  }
  if (isInternalBuild())
  {
    if (__osLog)
      v9 = __osLog;
    else
      v9 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      objc_msgSend(v7, "UUIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v21 = v4;
      *(_WORD *)&v21[4] = 2112;
      *(_QWORD *)&v21[6] = v11;
      _os_log_impl(&dword_2148C7000, v10, OS_LOG_TYPE_DEFAULT, "logCatacombUUIDForUser:%u -> %@\n", buf, 0x12u);

    }
    goto LABEL_16;
  }
  v19[0] = 0;
  v19[1] = 0;
  objc_msgSend(v7, "getUUIDBytes:", v19);
  if (__osLog)
    v12 = __osLog;
  else
    v12 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v21 = v4;
    *(_WORD *)&v21[4] = 1024;
    *(_DWORD *)&v21[6] = LOBYTE(v19[0]);
    *(_WORD *)&v21[10] = 1024;
    *(_DWORD *)&v21[12] = BYTE1(v19[0]);
    v13 = "logCatacombUUIDForUser:%u -> %02X%02X***\n";
    v14 = v12;
    v15 = OS_LOG_TYPE_DEFAULT;
    v16 = 20;
LABEL_15:
    _os_log_impl(&dword_2148C7000, v14, v15, v13, buf, v16);
  }
LABEL_16:

}

- (void)logCatacombHashForUser:(unsigned int)a3 catacombHash:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  int v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  __int16 v17;
  id v18;
  uint8_t buf[4];
  _BYTE v20[18];
  _BYTE v21[10];
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v4 = *(_QWORD *)&a3;
  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = v6;
  if ((_DWORD)v4 == -1)
  {
    if (__osLog)
      v16 = __osLog;
    else
      v16 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v20 = "userID != 4294967295U";
    *(_WORD *)&v20[8] = 2048;
    *(_QWORD *)&v20[10] = 0;
    *(_WORD *)v21 = 2080;
    *(_QWORD *)&v21[2] = &unk_21491C593;
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v24 = 1024;
    v25 = 2492;
LABEL_27:
    _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_16;
  }
  if (!v6)
  {
    v18 = 0;
    v8 = -[BiometricKitXPCServer performGetCatacombHashCommand:outHash:](self, "performGetCatacombHashCommand:outHash:", v4, &v18);
    v7 = v18;
    if (v8)
    {
      if (__osLog)
        v16 = __osLog;
      else
        v16 = MEMORY[0x24BDACB70];
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_16;
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v20 = "err == 0 ";
      *(_WORD *)&v20[8] = 2048;
      *(_QWORD *)&v20[10] = v8;
      *(_WORD *)v21 = 2080;
      *(_QWORD *)&v21[2] = &unk_21491C593;
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v24 = 1024;
      v25 = 2496;
      goto LABEL_27;
    }
  }
  if (isInternalBuild())
  {
    if (__osLog)
      v9 = __osLog;
    else
      v9 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      objc_msgSend(v7, "debugDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v20 = v4;
      *(_WORD *)&v20[4] = 2112;
      *(_QWORD *)&v20[6] = v11;
      _os_log_impl(&dword_2148C7000, v10, OS_LOG_TYPE_DEFAULT, "logCatacombHashForUser:%u -> %@\n", buf, 0x12u);

LABEL_15:
    }
  }
  else
  {
    v17 = 0;
    objc_msgSend(v7, "getBytes:length:", &v17, 2);
    if (__osLog)
      v12 = __osLog;
    else
      v12 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v17;
      v14 = HIBYTE(v17);
      v10 = v12;
      v15 = objc_msgSend(v7, "length");
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v20 = v4;
      *(_WORD *)&v20[4] = 1024;
      *(_DWORD *)&v20[6] = v13;
      *(_WORD *)&v20[10] = 1024;
      *(_DWORD *)&v20[12] = v14;
      *(_WORD *)&v20[16] = 2048;
      *(_QWORD *)v21 = v15;
      _os_log_impl(&dword_2148C7000, v10, OS_LOG_TYPE_DEFAULT, "logCatacombHashForUser:%u -> %02x%02x*** (len=%lu)\n", buf, 0x1Eu);
      goto LABEL_15;
    }
  }
LABEL_16:

}

- (int)filterIdentities:(id)a3 withFilter:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  char v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t j;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  void *v39;
  void *v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t m;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t n;
  void *v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t ii;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t jj;
  void *v66;
  int v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t kk;
  void *v80;
  int v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t i1;
  void *v93;
  int v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  uint64_t mm;
  uint64_t v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t nn;
  void *v105;
  void *v106;
  uint64_t v107;
  char v108;
  int v109;
  NSObject *v110;
  void *v111;
  void *v112;
  NSObject *v113;
  NSObject *v114;
  NSObject *v115;
  void *v116;
  NSObject *v117;
  void *v119;
  NSObject *v120;
  NSObject *v121;
  NSObject *v122;
  NSObject *v123;
  NSObject *v124;
  void *v125;
  NSObject *v126;
  NSObject *v127;
  NSObject *v128;
  NSObject *v129;
  void *v130;
  NSObject *v131;
  void *v132;
  void *v133;
  id obj;
  id v135;
  id v136;
  id v137;
  id v138;
  id v139;
  id v140;
  id v141;
  id v142;
  uint64_t v143;
  void *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  _BYTE v210[128];
  _BYTE v211[128];
  _BYTE v212[128];
  _BYTE v213[128];
  _BYTE v214[128];
  _BYTE v215[128];
  _BYTE v216[128];
  _BYTE v217[128];
  _BYTE v218[128];
  _BYTE v219[128];
  _BYTE v220[128];
  _BYTE v221[128];
  _BYTE v222[128];
  uint8_t v223[128];
  uint8_t buf[4];
  _BYTE v225[18];
  __int16 v226;
  void *v227;
  __int16 v228;
  const char *v229;
  __int16 v230;
  int v231;
  uint64_t v232;

  v232 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)__osLogTrace;
  if (!__osLogTrace)
    v7 = (void *)MEMORY[0x24BDACB70];
  v8 = v7;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v225 = v5;
    *(_WORD *)&v225[8] = 2112;
    *(_QWORD *)&v225[10] = v6;
    _os_log_impl(&dword_2148C7000, v8, OS_LOG_TYPE_DEBUG, "filterIdentities:withFilter: %@ %@\n", buf, 0x16u);
  }

  v132 = v5;
  v133 = v6;
  if (v5 && v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (__osLog)
        v122 = __osLog;
      else
        v122 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v225 = "[filter isKindOfClass:[NSDictionary class]]";
        *(_WORD *)&v225[8] = 2048;
        *(_QWORD *)&v225[10] = 0;
        v226 = 2080;
        v227 = &unk_21491C593;
        v228 = 2080;
        v229 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v230 = 1024;
        v231 = 2526;
        _os_log_impl(&dword_2148C7000, v122, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      goto LABEL_222;
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v5);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v6;
    v11 = (void *)v9;
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("BKFilterIdentity"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = 0x24BDBC000uLL;
    if (v12)
    {
      v14 = (void *)v12;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v14);
        v15 = objc_claimAutoreleasedReturnValue();

        v14 = (void *)v15;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (__osLog)
          v123 = __osLog;
        else
          v123 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v225 = "[value isKindOfClass:[NSArray class]]";
          *(_WORD *)&v225[8] = 2048;
          *(_QWORD *)&v225[10] = 0;
          v226 = 2080;
          v227 = &unk_21491C593;
          v228 = 2080;
          v229 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
          v230 = 1024;
          v231 = 2535;
          _os_log_impl(&dword_2148C7000, v123, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }

        goto LABEL_279;
      }
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v11);
      v138 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeAllObjects");
      v208 = 0u;
      v209 = 0u;
      v206 = 0u;
      v207 = 0u;
      obj = v14;
      v143 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v206, v223, 16);
      if (v143)
      {
        v135 = *(id *)v207;
        while (2)
        {
          v16 = 0;
          do
          {
            if (*(id *)v207 != v135)
              objc_enumerationMutation(obj);
            v17 = *(void **)(*((_QWORD *)&v206 + 1) + 8 * v16);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (__osLog)
                v110 = __osLog;
              else
                v110 = MEMORY[0x24BDACB70];
              if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                *(_QWORD *)v225 = "[obj isKindOfClass:[BiometricKitIdentity class]]";
                *(_WORD *)&v225[8] = 2048;
                *(_QWORD *)&v225[10] = 0;
                v226 = 2080;
                v227 = &unk_21491C593;
                v228 = 2080;
                v229 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
                v230 = 1024;
                v231 = 2541;
                _os_log_impl(&dword_2148C7000, v110, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
              }
              v111 = obj;

              v112 = v138;
              goto LABEL_220;
            }
            v148 = v16;
            v204 = 0u;
            v205 = 0u;
            v202 = 0u;
            v203 = 0u;
            v18 = v138;
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v202, v222, 16);
            if (v19)
            {
              v20 = v19;
              v21 = *(_QWORD *)v203;
              do
              {
                for (i = 0; i != v20; ++i)
                {
                  if (*(_QWORD *)v203 != v21)
                    objc_enumerationMutation(v18);
                  v23 = *(void **)(*((_QWORD *)&v202 + 1) + 8 * i);
                  objc_msgSend(v23, "uuid");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "uuid");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v24, "isEqual:", v25)
                    && (v26 = objc_msgSend(v23, "userID"), v26 == objc_msgSend(v17, "userID"))
                    && (v27 = objc_msgSend(v23, "type"), v27 == objc_msgSend(v17, "type")))
                  {
                    v28 = objc_msgSend(v11, "containsObject:", v23);

                    if ((v28 & 1) == 0)
                      objc_msgSend(v11, "addObject:", v23);
                  }
                  else
                  {

                  }
                }
                v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v202, v222, 16);
              }
              while (v20);
            }

            v16 = v148 + 1;
          }
          while (v148 + 1 != v143);
          v143 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v206, v223, 16);
          if (v143)
            continue;
          break;
        }
      }

      v13 = 0x24BDBC000;
    }
    else
    {
      v138 = 0;
    }
    objc_msgSend(v133, "objectForKeyedSubscript:", CFSTR("BKFilterUUID"));
    v29 = objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v30 = (void *)v29;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(*(id *)(v13 + 3632), "arrayWithObject:", v30);
        v31 = objc_claimAutoreleasedReturnValue();

        v30 = (void *)v31;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (__osLog)
          v124 = __osLog;
        else
          v124 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v225 = "[value isKindOfClass:[NSArray class]]";
          *(_WORD *)&v225[8] = 2048;
          *(_QWORD *)&v225[10] = 0;
          v226 = 2080;
          v227 = &unk_21491C593;
          v228 = 2080;
          v229 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
          v230 = 1024;
          v231 = 2560;
          _os_log_impl(&dword_2148C7000, v124, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }

        v125 = v138;
        goto LABEL_286;
      }
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v11);
      v144 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "removeAllObjects");
      v200 = 0u;
      v201 = 0u;
      v198 = 0u;
      v199 = 0u;
      v136 = v30;
      v149 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v198, v221, 16);
      if (v149)
      {
        v139 = *(id *)v199;
        while (2)
        {
          for (j = 0; j != v149; ++j)
          {
            if (*(id *)v199 != v139)
              objc_enumerationMutation(v136);
            v33 = *(_QWORD *)(*((_QWORD *)&v198 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (__osLog)
                v113 = __osLog;
              else
                v113 = MEMORY[0x24BDACB70];
              if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                *(_QWORD *)v225 = "[obj isKindOfClass:[NSUUID class]]";
                *(_WORD *)&v225[8] = 2048;
                *(_QWORD *)&v225[10] = 0;
                v226 = 2080;
                v227 = &unk_21491C593;
                v228 = 2080;
                v229 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
                v230 = 1024;
                v231 = 2566;
                _os_log_impl(&dword_2148C7000, v113, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
              }
              v111 = v136;
              goto LABEL_219;
            }
            v196 = 0u;
            v197 = 0u;
            v194 = 0u;
            v195 = 0u;
            v34 = v144;
            v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v194, v220, 16);
            if (v35)
            {
              v36 = v35;
              v37 = *(_QWORD *)v195;
              do
              {
                for (k = 0; k != v36; ++k)
                {
                  if (*(_QWORD *)v195 != v37)
                    objc_enumerationMutation(v34);
                  v39 = *(void **)(*((_QWORD *)&v194 + 1) + 8 * k);
                  objc_msgSend(v39, "uuid");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v40, "isEqual:", v33))
                  {
                    v41 = objc_msgSend(v11, "containsObject:", v39);

                    if ((v41 & 1) == 0)
                      objc_msgSend(v11, "addObject:", v39);
                  }
                  else
                  {

                  }
                }
                v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v194, v220, 16);
              }
              while (v36);
            }

          }
          v149 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v198, v221, 16);
          if (v149)
            continue;
          break;
        }
      }

      v13 = 0x24BDBC000;
    }
    else
    {
      v144 = v138;
    }
    objc_msgSend(v133, "objectForKeyedSubscript:", CFSTR("BKFilterUserID"));
    v42 = objc_claimAutoreleasedReturnValue();
    if (v42)
    {
      v30 = (void *)v42;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(*(id *)(v13 + 3632), "arrayWithObject:", v30);
        v43 = objc_claimAutoreleasedReturnValue();

        v30 = (void *)v43;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (__osLog)
          v126 = __osLog;
        else
          v126 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v225 = "[value isKindOfClass:[NSArray class]]";
          *(_WORD *)&v225[8] = 2048;
          *(_QWORD *)&v225[10] = 0;
          v226 = 2080;
          v227 = &unk_21491C593;
          v228 = 2080;
          v229 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
          v230 = 1024;
          v231 = 2582;
          _os_log_impl(&dword_2148C7000, v126, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
LABEL_285:

        v125 = v144;
LABEL_286:

        goto LABEL_222;
      }
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v11);
      v150 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "removeAllObjects");
      v192 = 0u;
      v193 = 0u;
      v190 = 0u;
      v191 = 0u;
      v140 = v30;
      v44 = objc_msgSend(v140, "countByEnumeratingWithState:objects:count:", &v190, v219, 16);
      if (v44)
      {
        v45 = v44;
        v145 = *(_QWORD *)v191;
        while (2)
        {
          for (m = 0; m != v45; ++m)
          {
            if (*(_QWORD *)v191 != v145)
              objc_enumerationMutation(v140);
            v47 = *(void **)(*((_QWORD *)&v190 + 1) + 8 * m);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (__osLog)
                v114 = __osLog;
              else
                v114 = MEMORY[0x24BDACB70];
              if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                *(_QWORD *)v225 = "[obj isKindOfClass:[NSNumber class]]";
                *(_WORD *)&v225[8] = 2048;
                *(_QWORD *)&v225[10] = 0;
                v226 = 2080;
                v227 = &unk_21491C593;
                v228 = 2080;
                v229 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
                v230 = 1024;
                v231 = 2588;
LABEL_210:
                _os_log_impl(&dword_2148C7000, v114, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
              }
              goto LABEL_211;
            }
            v188 = 0u;
            v189 = 0u;
            v186 = 0u;
            v187 = 0u;
            v48 = v150;
            v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v186, v218, 16);
            if (v49)
            {
              v50 = v49;
              v51 = *(_QWORD *)v187;
              do
              {
                for (n = 0; n != v50; ++n)
                {
                  if (*(_QWORD *)v187 != v51)
                    objc_enumerationMutation(v48);
                  v53 = *(void **)(*((_QWORD *)&v186 + 1) + 8 * n);
                  v54 = objc_msgSend(v53, "userID");
                  if (v54 == objc_msgSend(v47, "intValue")
                    && (objc_msgSend(v11, "containsObject:", v53) & 1) == 0)
                  {
                    objc_msgSend(v11, "addObject:", v53);
                  }
                }
                v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v186, v218, 16);
              }
              while (v50);
            }

          }
          v45 = objc_msgSend(v140, "countByEnumeratingWithState:objects:count:", &v190, v219, 16);
          if (v45)
            continue;
          break;
        }
      }

      v13 = 0x24BDBC000;
    }
    else
    {
      v150 = v144;
    }
    objc_msgSend(v133, "objectForKeyedSubscript:", CFSTR("BKFilterType"));
    v55 = objc_claimAutoreleasedReturnValue();
    if (v55)
    {
      v30 = (void *)v55;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(*(id *)(v13 + 3632), "arrayWithObject:", v30);
        v56 = objc_claimAutoreleasedReturnValue();

        v30 = (void *)v56;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (__osLog)
          v127 = __osLog;
        else
          v127 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v225 = "[value isKindOfClass:[NSArray class]]";
          *(_WORD *)&v225[8] = 2048;
          *(_QWORD *)&v225[10] = 0;
          v226 = 2080;
          v227 = &unk_21491C593;
          v228 = 2080;
          v229 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
          v230 = 1024;
          v231 = 2604;
          _os_log_impl(&dword_2148C7000, v127, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }

        v125 = v150;
        goto LABEL_286;
      }
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v11);
      v144 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "removeAllObjects");
      v184 = 0u;
      v185 = 0u;
      v182 = 0u;
      v183 = 0u;
      v141 = v30;
      v57 = objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v182, v217, 16);
      if (v57)
      {
        v58 = v57;
        v151 = *(_QWORD *)v183;
        while (2)
        {
          for (ii = 0; ii != v58; ++ii)
          {
            if (*(_QWORD *)v183 != v151)
              objc_enumerationMutation(v141);
            v60 = *(void **)(*((_QWORD *)&v182 + 1) + 8 * ii);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (__osLog)
                v115 = __osLog;
              else
                v115 = MEMORY[0x24BDACB70];
              if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                *(_QWORD *)v225 = "[obj isKindOfClass:[NSNumber class]]";
                *(_WORD *)&v225[8] = 2048;
                *(_QWORD *)&v225[10] = 0;
                v226 = 2080;
                v227 = &unk_21491C593;
                v228 = 2080;
                v229 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
                v230 = 1024;
                v231 = 2610;
LABEL_217:
                _os_log_impl(&dword_2148C7000, v115, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
              }
              goto LABEL_218;
            }
            v180 = 0u;
            v181 = 0u;
            v178 = 0u;
            v179 = 0u;
            v61 = v144;
            v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v178, v216, 16);
            if (v62)
            {
              v63 = v62;
              v64 = *(_QWORD *)v179;
              do
              {
                for (jj = 0; jj != v63; ++jj)
                {
                  if (*(_QWORD *)v179 != v64)
                    objc_enumerationMutation(v61);
                  v66 = *(void **)(*((_QWORD *)&v178 + 1) + 8 * jj);
                  v67 = objc_msgSend(v66, "type");
                  if (v67 == objc_msgSend(v60, "intValue")
                    && (objc_msgSend(v11, "containsObject:", v66) & 1) == 0)
                  {
                    objc_msgSend(v11, "addObject:", v66);
                  }
                }
                v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v178, v216, 16);
              }
              while (v63);
            }

          }
          v58 = objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v182, v217, 16);
          if (v58)
            continue;
          break;
        }
      }

      v13 = 0x24BDBC000;
    }
    else
    {
      v144 = v150;
    }
    objc_msgSend(v133, "objectForKeyedSubscript:", CFSTR("BKFilterAttribute"));
    v68 = objc_claimAutoreleasedReturnValue();
    if (v68)
    {
      v69 = (void *)v68;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(*(id *)(v13 + 3632), "arrayWithObject:", v69);
        v70 = objc_claimAutoreleasedReturnValue();

        v69 = (void *)v70;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (__osLog)
          v128 = __osLog;
        else
          v128 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v225 = "[value isKindOfClass:[NSArray class]]";
          *(_WORD *)&v225[8] = 2048;
          *(_QWORD *)&v225[10] = 0;
          v226 = 2080;
          v227 = &unk_21491C593;
          v228 = 2080;
          v229 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
          v230 = 1024;
          v231 = 2626;
          _os_log_impl(&dword_2148C7000, v128, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }

        goto LABEL_222;
      }
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v11);
      v150 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "removeAllObjects");
      v176 = 0u;
      v177 = 0u;
      v174 = 0u;
      v175 = 0u;
      v140 = v69;
      v71 = objc_msgSend(v140, "countByEnumeratingWithState:objects:count:", &v174, v215, 16);
      if (v71)
      {
        v72 = v71;
        v146 = *(_QWORD *)v175;
LABEL_114:
        v73 = 0;
        while (1)
        {
          if (*(_QWORD *)v175 != v146)
            objc_enumerationMutation(v140);
          v74 = *(void **)(*((_QWORD *)&v174 + 1) + 8 * v73);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            break;
          v172 = 0u;
          v173 = 0u;
          v170 = 0u;
          v171 = 0u;
          v75 = v150;
          v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v170, v214, 16);
          if (v76)
          {
            v77 = v76;
            v78 = *(_QWORD *)v171;
            do
            {
              for (kk = 0; kk != v77; ++kk)
              {
                if (*(_QWORD *)v171 != v78)
                  objc_enumerationMutation(v75);
                v80 = *(void **)(*((_QWORD *)&v170 + 1) + 8 * kk);
                v81 = objc_msgSend(v80, "attribute");
                if (v81 == objc_msgSend(v74, "intValue")
                  && (objc_msgSend(v11, "containsObject:", v80) & 1) == 0)
                {
                  objc_msgSend(v11, "addObject:", v80);
                }
              }
              v77 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v170, v214, 16);
            }
            while (v77);
          }

          if (++v73 == v72)
          {
            v72 = objc_msgSend(v140, "countByEnumeratingWithState:objects:count:", &v174, v215, 16);
            if (v72)
              goto LABEL_114;
            goto LABEL_130;
          }
        }
        if (__osLog)
          v114 = __osLog;
        else
          v114 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v225 = "[obj isKindOfClass:[NSNumber class]]";
          *(_WORD *)&v225[8] = 2048;
          *(_QWORD *)&v225[10] = 0;
          v226 = 2080;
          v227 = &unk_21491C593;
          v228 = 2080;
          v229 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
          v230 = 1024;
          v231 = 2632;
          goto LABEL_210;
        }
LABEL_211:
        v111 = v140;

        v112 = v150;
LABEL_220:

LABEL_221:
        goto LABEL_222;
      }
LABEL_130:

      v13 = 0x24BDBC000;
    }
    else
    {
      v150 = v144;
    }
    objc_msgSend(v133, "objectForKeyedSubscript:", CFSTR("BKFilterEntity"));
    v82 = objc_claimAutoreleasedReturnValue();
    if (!v82)
    {
      v144 = v150;
LABEL_156:
      objc_msgSend(v133, "objectForKeyedSubscript:", CFSTR("BKFilterName"));
      v95 = objc_claimAutoreleasedReturnValue();
      if (!v95)
      {
        v97 = v144;
LABEL_182:
        objc_msgSend(v132, "setArray:", v11);

        v109 = 0;
        goto LABEL_223;
      }
      v30 = (void *)v95;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(*(id *)(v13 + 3632), "arrayWithObject:", v30);
        v96 = objc_claimAutoreleasedReturnValue();

        v30 = (void *)v96;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v11);
        v97 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "removeAllObjects");
        v160 = 0u;
        v161 = 0u;
        v158 = 0u;
        v159 = 0u;
        v137 = v30;
        v153 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v158, v211, 16);
        if (v153)
        {
          v142 = v97;
          v147 = *(_QWORD *)v159;
          while (2)
          {
            for (mm = 0; mm != v153; ++mm)
            {
              if (*(_QWORD *)v159 != v147)
                objc_enumerationMutation(v137);
              v99 = *(_QWORD *)(*((_QWORD *)&v158 + 1) + 8 * mm);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v119 = (void *)__osLog;
                if (!__osLog)
                  v119 = (void *)MEMORY[0x24BDACB70];
                v120 = v119;
                if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136316162;
                  *(_QWORD *)v225 = "[obj isKindOfClass:[NSString class]]";
                  *(_WORD *)&v225[8] = 2048;
                  *(_QWORD *)&v225[10] = 0;
                  v226 = 2080;
                  v227 = &unk_21491C593;
                  v228 = 2080;
                  v229 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
                  v230 = 1024;
                  v231 = 2676;
                  _os_log_impl(&dword_2148C7000, v120, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
                }

                v111 = v137;
                goto LABEL_221;
              }
              v156 = 0u;
              v157 = 0u;
              v154 = 0u;
              v155 = 0u;
              v100 = v97;
              v101 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v154, v210, 16);
              if (v101)
              {
                v102 = v101;
                v103 = *(_QWORD *)v155;
                do
                {
                  for (nn = 0; nn != v102; ++nn)
                  {
                    if (*(_QWORD *)v155 != v103)
                      objc_enumerationMutation(v100);
                    v105 = *(void **)(*((_QWORD *)&v154 + 1) + 8 * nn);
                    objc_msgSend(v105, "name");
                    v106 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v106, "isEqual:", v99) & 1) == 0
                      && (objc_msgSend(v105, "name"), v107 = objc_claimAutoreleasedReturnValue(), v107 | v99))
                    {

                    }
                    else
                    {
                      v108 = objc_msgSend(v11, "containsObject:", v105);

                      if ((v108 & 1) == 0)
                        objc_msgSend(v11, "addObject:", v105);
                    }
                  }
                  v102 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v154, v210, 16);
                }
                while (v102);
              }

              v97 = v142;
            }
            v153 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v158, v211, 16);
            if (v153)
              continue;
            break;
          }
        }

        goto LABEL_182;
      }
      v130 = (void *)__osLog;
      if (!__osLog)
        v130 = (void *)MEMORY[0x24BDACB70];
      v131 = v130;
      if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v225 = "[value isKindOfClass:[NSArray class]]";
        *(_WORD *)&v225[8] = 2048;
        *(_QWORD *)&v225[10] = 0;
        v226 = 2080;
        v227 = &unk_21491C593;
        v228 = 2080;
        v229 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v230 = 1024;
        v231 = 2670;
        _os_log_impl(&dword_2148C7000, v131, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }

      goto LABEL_285;
    }
    v14 = (void *)v82;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(v13 + 3632), "arrayWithObject:", v14);
      v83 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v83;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v11);
      v144 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "removeAllObjects");
      v168 = 0u;
      v169 = 0u;
      v166 = 0u;
      v167 = 0u;
      v141 = v14;
      v84 = objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v166, v213, 16);
      if (v84)
      {
        v85 = v84;
        v152 = *(_QWORD *)v167;
LABEL_138:
        v86 = 0;
        while (1)
        {
          if (*(_QWORD *)v167 != v152)
            objc_enumerationMutation(v141);
          v87 = *(void **)(*((_QWORD *)&v166 + 1) + 8 * v86);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            break;
          v164 = 0u;
          v165 = 0u;
          v162 = 0u;
          v163 = 0u;
          v88 = v144;
          v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v162, v212, 16);
          if (v89)
          {
            v90 = v89;
            v91 = *(_QWORD *)v163;
            do
            {
              for (i1 = 0; i1 != v90; ++i1)
              {
                if (*(_QWORD *)v163 != v91)
                  objc_enumerationMutation(v88);
                v93 = *(void **)(*((_QWORD *)&v162 + 1) + 8 * i1);
                v94 = objc_msgSend(v93, "entity");
                if (v94 == objc_msgSend(v87, "intValue")
                  && (objc_msgSend(v11, "containsObject:", v93) & 1) == 0)
                {
                  objc_msgSend(v11, "addObject:", v93);
                }
              }
              v90 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v162, v212, 16);
            }
            while (v90);
          }

          if (++v86 == v85)
          {
            v85 = objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v166, v213, 16);
            if (v85)
              goto LABEL_138;
            goto LABEL_154;
          }
        }
        if (__osLog)
          v115 = __osLog;
        else
          v115 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v225 = "[obj isKindOfClass:[NSNumber class]]";
          *(_WORD *)&v225[8] = 2048;
          *(_QWORD *)&v225[10] = 0;
          v226 = 2080;
          v227 = &unk_21491C593;
          v228 = 2080;
          v229 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
          v230 = 1024;
          v231 = 2654;
          goto LABEL_217;
        }
LABEL_218:
        v111 = v141;
LABEL_219:

        v112 = v144;
        goto LABEL_220;
      }
LABEL_154:

      v13 = 0x24BDBC000;
      goto LABEL_156;
    }
    if (__osLog)
      v129 = __osLog;
    else
      v129 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v225 = "[value isKindOfClass:[NSArray class]]";
      *(_WORD *)&v225[8] = 2048;
      *(_QWORD *)&v225[10] = 0;
      v226 = 2080;
      v227 = &unk_21491C593;
      v228 = 2080;
      v229 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v230 = 1024;
      v231 = 2648;
      _os_log_impl(&dword_2148C7000, v129, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }

LABEL_279:
LABEL_222:
    v109 = 258;
    goto LABEL_223;
  }
  if (__osLog)
    v121 = __osLog;
  else
    v121 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v225 = "filter != ((void *)0) && identities != ((void *)0)";
    *(_WORD *)&v225[8] = 2048;
    *(_QWORD *)&v225[10] = 0;
    v226 = 2080;
    v227 = &unk_21491C593;
    v228 = 2080;
    v229 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v230 = 1024;
    v231 = 2525;
    _os_log_impl(&dword_2148C7000, v121, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
  v109 = 263;
LABEL_223:
  v116 = (void *)__osLogTrace;
  if (!__osLogTrace)
    v116 = (void *)MEMORY[0x24BDACB70];
  v117 = v116;
  if (os_log_type_enabled(v117, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v225 = v109;
    *(_WORD *)&v225[4] = 2112;
    *(_QWORD *)&v225[6] = v132;
    _os_log_impl(&dword_2148C7000, v117, OS_LOG_TYPE_DEBUG, "filterIdentities:withFilter: -> %d (%@)\n", buf, 0x12u);
  }

  return v109;
}

- (int)parseAuthDict:(id)a3 toAuthData:(id *)a4
{
  char *v5;
  NSObject *v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  id v14;
  unint64_t v15;
  _BOOL4 v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  int v27;
  const char *v28;
  __int16 v29;
  $8DE116C3FB21CCD6F79AB3F71F0D566B *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = (char *)a3;
  v6 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v7 = __osLogTrace;
  else
    v7 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v27 = 138412546;
    v28 = v5;
    v29 = 2048;
    v30 = a4;
    _os_log_impl(&dword_2148C7000, v7, OS_LOG_TYPE_DEBUG, "parseAuthDict:toAuthData: %@ %p\n", (uint8_t *)&v27, 0x16u);
  }
  if (!a4)
  {
    if (__osLog)
      v24 = __osLog;
    else
      v24 = v6;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v27 = 136316162;
      v28 = "authData";
      v29 = 2048;
      v30 = 0;
      v31 = 2080;
      v32 = &unk_21491C593;
      v33 = 2080;
      v34 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v35 = 1024;
      v36 = 2713;
      _os_log_impl(&dword_2148C7000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v27, 0x30u);
    }
    goto LABEL_54;
  }
  *(_QWORD *)&a4->var2[24] = 0;
  *(_OWORD *)&a4->var0 = 0u;
  *(_OWORD *)&a4->var2[8] = 0u;
  if (!v5)
    goto LABEL_24;
  v8 = CFSTR("BKOptionAuthWithCredentialSet");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BKOptionAuthWithCredentialSet"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    goto LABEL_11;
  v8 = CFSTR("BKOptionEnrollWithCredentialSet");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BKOptionEnrollWithCredentialSet"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10
    || (v8 = CFSTR("BKOptionMatchCredentialSetForExtendEnrollment"),
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BKOptionMatchCredentialSetForExtendEnrollment")),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v11))
  {
LABEL_11:
    v12 = 0;
  }
  else
  {
    v8 = CFSTR("BKOptionAuthWithAuthToken");
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BKOptionAuthWithAuthToken"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v8 = CFSTR("BKOptionEnrollWithAuthToken");
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BKOptionEnrollWithAuthToken"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        v8 = CFSTR("BKOptionMatchAuthTokenForExtendEnrollment");
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BKOptionMatchAuthTokenForExtendEnrollment"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
        {
          v8 = CFSTR("BKOptionMatchAuthTokenToBypassPasscodeBiolockout");
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BKOptionMatchAuthTokenToBypassPasscodeBiolockout"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v21)
            goto LABEL_24;
        }
      }
    }
    v12 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
LABEL_24:
    v17 = 0;
    a4->var0 = 1;
    goto LABEL_25;
  }
  v14 = (id)v13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (__osLog)
      v25 = __osLog;
    else
      v25 = v6;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v27 = 136316162;
      v28 = "[value isKindOfClass:[NSData class]]";
      v29 = 2048;
      v30 = 0;
      v31 = 2080;
      v32 = &unk_21491C593;
      v33 = 2080;
      v34 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v35 = 1024;
      v36 = 2746;
      _os_log_impl(&dword_2148C7000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v27, 0x30u);
    }
    goto LABEL_53;
  }
  v14 = v14;
  v15 = objc_msgSend(v14, "length");
  if (v15 >= 0x21)
  {
    if (__osLog)
      v26 = __osLog;
    else
      v26 = v6;
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      goto LABEL_52;
    v27 = 136316162;
    v28 = "dataLength <= 32";
    v29 = 2048;
    v30 = 0;
    v31 = 2080;
    v32 = &unk_21491C593;
    v33 = 2080;
    v34 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v35 = 1024;
    v36 = 2750;
  }
  else
  {
    v16 = (v15 & 0xFFFFFFFFFFFFFFEFLL) != 0;
    if (!v12)
      v16 = v15 == 0;
    if (!v16)
    {
      a4->var0 = v12;
      a4->var1 = v15;
      objc_msgSend(v14, "getBytes:length:", a4->var2);

      v17 = 0;
      goto LABEL_25;
    }
    if (__osLog)
      v26 = __osLog;
    else
      v26 = v6;
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      goto LABEL_52;
    v27 = 136316162;
    v28 = "(authToken && (!dataLength || (dataLength == 16)) || (!authToken && dataLength))";
    v29 = 2048;
    v30 = 0;
    v31 = 2080;
    v32 = &unk_21491C593;
    v33 = 2080;
    v34 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v35 = 1024;
    v36 = 2751;
  }
  _os_log_impl(&dword_2148C7000, v26, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v27, 0x30u);
LABEL_52:

LABEL_53:
LABEL_54:
  v17 = 258;
LABEL_25:
  if (__osLogTrace)
    v22 = __osLogTrace;
  else
    v22 = v6;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v27 = 67109120;
    LODWORD(v28) = v17;
    _os_log_impl(&dword_2148C7000, v22, OS_LOG_TYPE_DEBUG, "parseAuthDict:toAuthData: -> %d\n", (uint8_t *)&v27, 8u);
  }

  return v17;
}

- (BOOL)lastDisplayState
{
  return self->_lastDisplayState > 0;
}

- (BOOL)isDisplayOn
{
  NSObject *v3;
  NSObject *v4;
  io_registry_entry_t backlightService;
  const __CFDictionary *CFProperty;
  const __CFDictionary *v7;
  const __CFDictionary *Value;
  const __CFNumber *v9;
  _BOOL4 v10;
  NSObject *v11;
  NSObject *v13;
  NSObject *v14;
  int valuePtr;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDACB70];
  if (__osLog)
    v4 = __osLog;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2148C7000, v4, OS_LOG_TYPE_DEBUG, "isDisplayOn\n", buf, 2u);
  }
  valuePtr = 0;
  backlightService = self->_backlightService;
  if (!backlightService)
  {
    if (__osLog)
      v13 = __osLog;
    else
      v13 = v3;
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    *(_DWORD *)buf = 136316162;
    v17 = "_backlightService";
    v18 = 2048;
    v19 = 0;
    v20 = 2080;
    v21 = &unk_21491C593;
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v24 = 1024;
    v25 = 2791;
    goto LABEL_28;
  }
  CFProperty = (const __CFDictionary *)IORegistryEntryCreateCFProperty(backlightService, CFSTR("IODisplayParameters"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v7 = CFProperty;
    Value = (const __CFDictionary *)CFDictionaryGetValue(CFProperty, CFSTR("brightness"));
    if (Value)
    {
      v9 = (const __CFNumber *)CFDictionaryGetValue(Value, CFSTR("value"));
      if (v9)
      {
        CFNumberGetValue(v9, kCFNumberSInt32Type, &valuePtr);
LABEL_11:
        CFRelease(v7);
        v10 = valuePtr != 0;
        goto LABEL_12;
      }
      if (__osLog)
        v14 = __osLog;
      else
        v14 = v3;
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      *(_DWORD *)buf = 136316162;
      v17 = "cfBrightnessValue";
      v18 = 2048;
      v19 = 0;
      v20 = 2080;
      v21 = &unk_21491C593;
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v24 = 1024;
      v25 = 2800;
    }
    else
    {
      if (__osLog)
        v14 = __osLog;
      else
        v14 = v3;
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      *(_DWORD *)buf = 136316162;
      v17 = "cfBrightnessKey";
      v18 = 2048;
      v19 = 0;
      v20 = 2080;
      v21 = &unk_21491C593;
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v24 = 1024;
      v25 = 2797;
    }
    _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_11;
  }
  if (__osLog)
    v13 = __osLog;
  else
    v13 = v3;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v17 = "cfProperty";
    v18 = 2048;
    v19 = 0;
    v20 = 2080;
    v21 = &unk_21491C593;
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v24 = 1024;
    v25 = 2794;
LABEL_28:
    _os_log_impl(&dword_2148C7000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_29:
  v10 = 0;
LABEL_12:
  if (__osLog)
    v11 = __osLog;
  else
    v11 = v3;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v17) = v10;
    _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_DEBUG, "isDisplayOn -> %d\n", buf, 8u);
  }
  return v10;
}

- (int)displayStateChanged:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  NSObject *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x24BDAC8D0];
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v14 = 67109120;
    LODWORD(v15) = v3;
    _os_log_impl(&dword_2148C7000, v6, OS_LOG_TYPE_DEBUG, "displayStateChanged: %d\n", (uint8_t *)&v14, 8u);
  }
  if (self->_lastDisplayState == v3)
    goto LABEL_13;
  v7 = -[BiometricKitXPCServer performDisplayStatusChangedCommand:](self, "performDisplayStatusChangedCommand:", v3);
  if (!v7)
  {
    self->_lastDisplayState = v3;
    if (__osLog)
      v8 = __osLog;
    else
      v8 = v5;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 67109120;
      LODWORD(v15) = v3;
      _os_log_impl(&dword_2148C7000, v8, OS_LOG_TYPE_DEFAULT, "displayStateChanged: (_lastDisplayState !=) %d\n", (uint8_t *)&v14, 8u);
    }
LABEL_13:
    if (__osLogTrace)
      v9 = __osLogTrace;
    else
      v9 = v5;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v14 = 67109120;
      LODWORD(v15) = 0;
      _os_log_impl(&dword_2148C7000, v9, OS_LOG_TYPE_DEBUG, "displayStateChanged: -> %d\n", (uint8_t *)&v14, 8u);
    }
    return 0;
  }
  v10 = v7;
  if (__osLog)
    v12 = __osLog;
  else
    v12 = v5;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v14 = 136316162;
    v15 = "err == 0 ";
    v16 = 2048;
    v17 = v10;
    v18 = 2080;
    v19 = &unk_21491C593;
    v20 = 2080;
    v21 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v22 = 1024;
    v23 = 2829;
    _os_log_impl(&dword_2148C7000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v14, 0x30u);
  }
  if (__osLogTrace)
    v13 = __osLogTrace;
  else
    v13 = v5;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = 67109120;
    LODWORD(v15) = v10;
    _os_log_impl(&dword_2148C7000, v13, OS_LOG_TYPE_ERROR, "displayStateChanged: -> %d\n", (uint8_t *)&v14, 8u);
  }
  return v10;
}

- (void)postGeneralLockoutStateNotification
{
  NSObject *v2;
  uint8_t v3[16];

  if (__osLogTrace)
    v2 = __osLogTrace;
  else
    v2 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2148C7000, v2, OS_LOG_TYPE_DEBUG, "postGeneralLockoutStateNotification\n", v3, 2u);
  }
  notify_post("com.apple.BiometricKit.generalLockoutStateChanged");
}

- (void)updateEnrollmentChangedNotification:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSObject *v6;
  int enrollChgNtfToken;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _DWORD v12[2];
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v12[0] = 67109120;
    v12[1] = v3;
    _os_log_impl(&dword_2148C7000, v6, OS_LOG_TYPE_DEBUG, "updateEnrollmentChangedNotification: %d\n", (uint8_t *)v12, 8u);
  }
  if (self->_enrollChgNtfTokenValid)
  {
    enrollChgNtfToken = self->_enrollChgNtfToken;
    v8 = BYTE2(self->_mkbLockStatusNtfToken) ? 1 : -[BiometricKitXPCServer identitiesCount](self, "identitiesCount");
    notify_set_state(enrollChgNtfToken, v8);
    if (v3)
      notify_post("com.apple.BiometricKit.enrollmentChanged");
  }
  if (BYTE2(self->_mkbLockStatusNtfToken))
  {
    -[BiometricKitXPCServer updateExpressModeStateWithEnrollmentCount:](self, "updateExpressModeStateWithEnrollmentCount:", 1);
  }
  else
  {
    -[BiometricKitXPCServer identitiesOfUser:](self, "identitiesOfUser:", -[BiometricKitXPCServer currentAccountUserID](self, "currentAccountUserID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    -[BiometricKitXPCServer updateExpressModeStateWithEnrollmentCount:](self, "updateExpressModeStateWithEnrollmentCount:", v10);
    if (!(_DWORD)v10)
      -[BiometricKitXPCServer updateLockoutStateNotification:](self, "updateLockoutStateNotification:", 0);
  }
  if (__osLogTrace)
    v11 = __osLogTrace;
  else
    v11 = v5;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v12[0]) = 0;
    _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_DEBUG, "updateEnrollmentChangedNotification: -> void\n", (uint8_t *)v12, 2u);
  }
}

- (void)cacheUserAccountsInfo
{
  void *v3;
  void *v4;
  BOOL v5;
  NSObject *v6;
  int v7;
  void *v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  _BYTE v16[10];
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v4 != 0;
  v6 = MEMORY[0x24BDACB70];
  if (v4)
  {
    v7 = objc_msgSend(v4, "uid");
  }
  else
  {
    if (__osLog)
      v13 = __osLog;
    else
      v13 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = 136316162;
      *(_QWORD *)v16 = "currentUser";
      *(_WORD *)&v16[8] = 2048;
      v17 = 0;
      v18 = 2080;
      v19 = &unk_21491C593;
      v20 = 2080;
      v21 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v22 = 1024;
      v23 = 2895;
      _os_log_impl(&dword_2148C7000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    v7 = 501;
  }
  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allUsers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v9, "count"))
  {
    if (__osLog)
      v14 = __osLog;
    else
      v14 = v6;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = 136316162;
      *(_QWORD *)v16 = "users.count";
      *(_WORD *)&v16[8] = 2048;
      v17 = 0;
      v18 = 2080;
      v19 = &unk_21491C593;
      v20 = 2080;
      v21 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v22 = 1024;
      v23 = 2901;
      _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
    v5 = 0;
  }
  v10 = objc_msgSend(v9, "count");
  *(_DWORD *)(&self->_enrollChgNtfTokenValid + 1) = v7;
  BYTE1(self->_userAccountsInfo.currentAccountUserID) = v10 > 1;
  BYTE2(self->_userAccountsInfo.currentAccountUserID) = v5;
  if (__osLog)
    v11 = __osLog;
  else
    v11 = v6;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = BYTE2(self->_userAccountsInfo.currentAccountUserID);
    v15 = 67109632;
    *(_DWORD *)v16 = v7;
    *(_WORD *)&v16[4] = 1024;
    *(_DWORD *)&v16[6] = v10 > 1;
    LOWORD(v17) = 1024;
    *(_DWORD *)((char *)&v17 + 2) = v12;
    _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_DEFAULT, "cacheUserAccountsInfo: currentAccountUserID = %d, hasMultipleUserAccounts = %u, valid = %u\n", (uint8_t *)&v15, 0x14u);
  }

}

- ($89967B733E8F0E8859294B5D59E7AF0F)userAccountsInfo
{
  if (!BYTE2(self->_userAccountsInfo.currentAccountUserID))
    -[BiometricKitXPCServer cacheAndSetUserAccountsInfo](self, "cacheAndSetUserAccountsInfo");
  return ($89967B733E8F0E8859294B5D59E7AF0F *)(&self->_enrollChgNtfTokenValid + 1);
}

- (unsigned)currentAccountUserID
{
  if (!BYTE2(self->_userAccountsInfo.currentAccountUserID))
    -[BiometricKitXPCServer cacheAndSetUserAccountsInfo](self, "cacheAndSetUserAccountsInfo");
  return *(_DWORD *)(&self->_enrollChgNtfTokenValid + 1);
}

- (BOOL)hasMultipleUserAccounts
{
  if (!BYTE2(self->_userAccountsInfo.currentAccountUserID))
    -[BiometricKitXPCServer cacheAndSetUserAccountsInfo](self, "cacheAndSetUserAccountsInfo");
  return BYTE1(self->_userAccountsInfo.currentAccountUserID) != 0;
}

- (void)updateLockoutStateNotification:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10[2];

  v3 = *(_QWORD *)&a3;
  v10[1] = *MEMORY[0x24BDAC8D0];
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(v10[0]) = 67109120;
    HIDWORD(v10[0]) = v3;
    _os_log_impl(&dword_2148C7000, v6, OS_LOG_TYPE_DEBUG, "updateLockoutStateNotification: %u\n", (uint8_t *)v10, 8u);
  }
  if (self->_userAccountsInfoValid)
  {
    -[BiometricKitXPCServer identitiesOfUser:](self, "identitiesOfUser:", -[BiometricKitXPCServer currentAccountUserID](self, "currentAccountUserID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = ((objc_msgSend(v7, "count") != 0) & (v3 >> 2)) != 0 ? 3 : 0;

    v10[0] = 0;
    if (!notify_get_state(*(_DWORD *)&self->_userAccountsInfo.hasMultipleUserAccounts, v10) && v8 != v10[0])
    {
      notify_set_state(*(_DWORD *)&self->_userAccountsInfo.hasMultipleUserAccounts, v8);
      notify_post("com.apple.BiometricKit.lockoutStateChanged");
    }
  }
  -[BiometricKitXPCServer updateExpressModeStateWithLockoutState:](self, "updateExpressModeStateWithLockoutState:", v3);
  if (__osLogTrace)
    v9 = __osLogTrace;
  else
    v9 = v5;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v10[0]) = 0;
    _os_log_impl(&dword_2148C7000, v9, OS_LOG_TYPE_DEBUG, "updateLockoutStateNotification: -> void\n", (uint8_t *)v10, 2u);
  }
}

- (void)updateExpressModeStateWithLockoutState:(unsigned int)a3
{
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  unint64_t v8;
  NSObject *v9;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v10[0] = 67109120;
    v10[1] = a3;
    _os_log_impl(&dword_2148C7000, v6, OS_LOG_TYPE_DEBUG, "updateExpressModeStateWithLockoutState: %u\n", (uint8_t *)v10, 8u);
  }
  v7 = *(_QWORD *)&self->_expressModeChgNtfTokenValid;
  v8 = v7 & 0xFFFFFFFFFFFFFFFELL | ((a3 & 0x16) != 0);
  if ((v7 & 4) != 0)
    v8 = v7 & 0xFFFFFFFFFFFFFFFCLL | ((a3 & 0x16) != 0) | (2 * ((a3 & 0x208) == 0));
  *(_QWORD *)&self->_expressModeChgNtfTokenValid = v8;
  -[BiometricKitXPCServer updateExpressModeStateNotification](self, "updateExpressModeStateNotification");
  if (__osLogTrace)
    v9 = __osLogTrace;
  else
    v9 = v5;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v10[0]) = 0;
    _os_log_impl(&dword_2148C7000, v9, OS_LOG_TYPE_DEBUG, "updateExpressModeStateWithLockoutState: -> void\n", (uint8_t *)v10, 2u);
  }
}

- (void)updateExpressModeStateWithEnrollmentCount:(unsigned int)a3
{
  NSObject *v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v11 = 67109120;
    LODWORD(v12) = a3;
    _os_log_impl(&dword_2148C7000, v6, OS_LOG_TYPE_DEBUG, "updateExpressModeStateWithEnrollmentCount: %u\n", (uint8_t *)&v11, 8u);
  }
  if (a3 != 1)
  {
    if (!a3)
      *(_QWORD *)&self->_expressModeChgNtfTokenValid = 0;
    goto LABEL_11;
  }
  if ((self->_expressModeChgNtfTokenValid & 4) != 0
    || (v7 = -[BiometricKitXPCServer getExpressModeState:forUser:withClient:](self, "getExpressModeState:forUser:withClient:", &self->_expressModeChgNtfTokenValid, -[BiometricKitXPCServer currentAccountUserID](self, "currentAccountUserID"), 0)) == 0)
  {
LABEL_11:
    -[BiometricKitXPCServer updateExpressModeStateNotification](self, "updateExpressModeStateNotification");
    goto LABEL_12;
  }
  v9 = v7;
  if (__osLog)
    v10 = __osLog;
  else
    v10 = v5;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = 136316162;
    v12 = "[self getExpressModeState:&_expressModeState forUser:[self currentAccountUserID] withClient:((void *)0)] == 0 ";
    v13 = 2048;
    v14 = v9;
    v15 = 2080;
    v16 = &unk_21491C593;
    v17 = 2080;
    v18 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v19 = 1024;
    v20 = 3032;
    _os_log_impl(&dword_2148C7000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v11, 0x30u);
  }
LABEL_12:
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = v5;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_2148C7000, v8, OS_LOG_TYPE_DEBUG, "updateExpressModeStateWithEnrollmentCount: -> void\n", (uint8_t *)&v11, 2u);
  }
}

- (void)updateExpressModeState
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v4 = __osLogTrace;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_2148C7000, v4, OS_LOG_TYPE_DEBUG, "updateExpressModeState\n", (uint8_t *)&v9, 2u);
  }
  v5 = -[BiometricKitXPCServer getExpressModeState:forUser:withClient:](self, "getExpressModeState:forUser:withClient:", &self->_expressModeChgNtfTokenValid, -[BiometricKitXPCServer currentAccountUserID](self, "currentAccountUserID"), 0);
  if (v5)
  {
    v7 = v5;
    if (__osLog)
      v8 = __osLog;
    else
      v8 = v3;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136316162;
      v10 = "[self getExpressModeState:&_expressModeState forUser:[self currentAccountUserID] withClient:((void *)0)] == 0 ";
      v11 = 2048;
      v12 = v7;
      v13 = 2080;
      v14 = &unk_21491C593;
      v15 = 2080;
      v16 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v17 = 1024;
      v18 = 3049;
      _os_log_impl(&dword_2148C7000, v8, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v9, 0x30u);
    }
  }
  else
  {
    -[BiometricKitXPCServer updateExpressModeStateNotification](self, "updateExpressModeStateNotification");
  }
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = v3;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_2148C7000, v6, OS_LOG_TYPE_DEBUG, "updateExpressModeState -> void\n", (uint8_t *)&v9, 2u);
  }
}

- (void)updateExpressModeStateNotification
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _BYTE v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v4 = __osLogTrace;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_QWORD *)&self->_expressModeChgNtfTokenValid;
    *(_DWORD *)v8 = 134217984;
    *(_QWORD *)&v8[4] = v5;
    _os_log_impl(&dword_2148C7000, v4, OS_LOG_TYPE_DEBUG, "updateExpressModeStateNotification %ld\n", v8, 0xCu);
  }
  if (self->_lockoutChgNtfTokenValid)
  {
    *(_QWORD *)v8 = 0;
    if (!notify_get_state(self->_lockoutChgNtfToken, (uint64_t *)v8))
    {
      v6 = *(_QWORD *)&self->_expressModeChgNtfTokenValid;
      if (v6 != *(_QWORD *)v8)
      {
        notify_set_state(self->_lockoutChgNtfToken, v6);
        notify_post("com.apple.BiometricKit.expressModeStateChanged");
      }
    }
  }
  if (__osLogTrace)
    v7 = __osLogTrace;
  else
    v7 = v3;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2148C7000, v7, OS_LOG_TYPE_DEBUG, "updateExpressModeStateNotification -> void\n", v8, 2u);
  }
}

- (void)disconnectingClient:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (__osLog)
    v4 = __osLog;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_2148C7000, v4, OS_LOG_TYPE_DEFAULT, "disconnecting client: %@\n", (uint8_t *)&v5, 0xCu);
  }

}

- (id)allClients
{
  void *v3;
  NSMutableSet *v4;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_exportedObjects;
  objc_sync_enter(v4);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_exportedObjects;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "clients", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  objc_sync_exit(v4);
  return v3;
}

- (id)createMatchEventDictionary:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[2];
  _QWORD v15[2];
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", a3->var1, CFSTR("BKMatchEventResult"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = CFSTR("BKMatchEventTimeStamp");
    v15[0] = v5;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3->var0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3->var1)
    {
      -[BiometricKitXPCServer getIdentityObject:](self, "getIdentityObject:", &a3->var1 + 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)objc_msgSend(v7, "mutableCopy");
        objc_msgSend(v9, "setObject:forKey:", v8, CFSTR("BKMatchEventMatchedIdentity"));
        v10 = objc_msgSend(v9, "copy");

        v7 = v9;
      }
      else
      {
        if (__osLog)
          v13 = __osLog;
        else
          v13 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v17 = "matchedIdentity";
          v18 = 2048;
          v19 = 0;
          v20 = 2080;
          v21 = &unk_21491C593;
          v22 = 2080;
          v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
          v24 = 1024;
          v25 = 3121;
          _os_log_impl(&dword_2148C7000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v10 = 0;
      }

      v7 = (void *)v10;
    }
    return v7;
  }
  else
  {
    if (__osLog)
      v12 = __osLog;
    else
      v12 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v17 = "matchEvent";
      v18 = 2048;
      v19 = 0;
      v20 = 2080;
      v21 = &unk_21491C593;
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v24 = 1024;
      v25 = 3114;
      _os_log_impl(&dword_2148C7000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    return 0;
  }
}

- (BOOL)isFingerprintModificationRestricted
{
  void *v2;
  void *v3;
  int v4;
  char v5;
  NSObject *v6;
  const __CFString *v7;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.applicationaccess"));
  v3 = v2;
  if (v2 && objc_msgSend(v2, "objectIsForcedForKey:", CFSTR("allowFingerprintModification")))
  {
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("allowFingerprintModification"));
    v5 = v4 ^ 1;
    if (__osLog)
      v6 = __osLog;
    else
      v6 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = CFSTR("YES");
      if (v4)
        v7 = CFSTR("NO");
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_2148C7000, v6, OS_LOG_TYPE_DEFAULT, "'FingerprintModification' restricted: %@\n", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int)restoreAndSyncTemplates
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  unint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  os_log_type_t v13;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v4 = __osLogTrace;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_2148C7000, v4, OS_LOG_TYPE_DEBUG, "restoreAndSyncTemplates\n", (uint8_t *)&v16, 2u);
  }
  v5 = -[BiometricKitXPCServer loadCatacomb](self, "loadCatacomb");
  v6 = v5;
  if (__osLog)
    v7 = __osLog;
  else
    v7 = v3;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v16 = 136316162;
      v17 = "err == 0 ";
      v18 = 2048;
      v19 = (void *)v6;
      v20 = 2080;
      v21 = &unk_21491C593;
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v24 = 1024;
      v25 = 3161;
      _os_log_impl(&dword_2148C7000, v7, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
    }
    if (__osLogTrace)
      v15 = __osLogTrace;
    else
      v15 = v3;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = 67109120;
      LODWORD(v17) = v6;
      v12 = v15;
      v13 = OS_LOG_TYPE_ERROR;
      goto LABEL_17;
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      v9 = -[BiometricKitXPCServer identitiesCount](self, "identitiesCount");
      -[BiometricKitXPCServer identities](self, "identities");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 134218242;
      v17 = (const char *)v9;
      v18 = 2114;
      v19 = v10;
      _os_log_impl(&dword_2148C7000, v8, OS_LOG_TYPE_DEFAULT, "restoreAndSyncTemplates identities %lu: %{public}@\n", (uint8_t *)&v16, 0x16u);

    }
    if (__osLogTrace)
      v11 = __osLogTrace;
    else
      v11 = v3;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v16 = 67109120;
      LODWORD(v17) = 0;
      v12 = v11;
      v13 = OS_LOG_TYPE_DEBUG;
LABEL_17:
      _os_log_impl(&dword_2148C7000, v12, v13, "restoreAndSyncTemplates -> %d\n", (uint8_t *)&v16, 8u);
    }
  }
  return v6;
}

- (void)clearTemplateList
{
  NSObject *v2;
  NSObject *v3;
  ActivityTracker *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  ActivityTracker *obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v3 = __osLogTrace;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2148C7000, v3, OS_LOG_TYPE_DEBUG, "clearTemplateList\n", buf, 2u);
  }
  obj = self->_ongoingBiometricOperation;
  objc_sync_enter(obj);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = self->_ongoingBiometricOperation;
  v5 = -[ActivityTracker countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v9 = __osLog;
        if (!__osLog)
          v9 = v2;
        v10 = v9;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "uuid");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v20 = v11;
          _os_log_impl(&dword_2148C7000, v10, OS_LOG_TYPE_DEFAULT, "clearTemplateList removing identity %@\n", buf, 0xCu);

        }
      }
      v5 = -[ActivityTracker countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v5);
  }

  -[ActivityTracker removeAllObjects](self->_ongoingBiometricOperation, "removeAllObjects");
  objc_sync_exit(obj);

  if (__osLogTrace)
    v12 = __osLogTrace;
  else
    v12 = v2;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2148C7000, v12, OS_LOG_TYPE_DEBUG, "clearTemplateList -> void\n", buf, 2u);
  }
}

- (void)clearTemplateListForUser:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  ActivityTracker *obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v3 = *(_QWORD *)&a3;
  v24 = *MEMORY[0x24BDAC8D0];
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v22) = v3;
    _os_log_impl(&dword_2148C7000, v6, OS_LOG_TYPE_DEBUG, "clearTemplateListForUser: %d\n", buf, 8u);
  }
  obj = self->_ongoingBiometricOperation;
  objc_sync_enter(obj);
  -[BiometricKitXPCServer identitiesOfUser:](self, "identitiesOfUser:", v3);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v12 = __osLog;
        if (!__osLog)
          v12 = v5;
        v13 = v12;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v11, "uuid");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v22 = v14;
          _os_log_impl(&dword_2148C7000, v13, OS_LOG_TYPE_DEFAULT, "clearTemplateListForUser: removing identity %@\n", buf, 0xCu);

        }
        -[ActivityTracker removeObject:](self->_ongoingBiometricOperation, "removeObject:", v11);
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v8);
  }

  objc_sync_exit(obj);
  if (__osLogTrace)
    v15 = __osLogTrace;
  else
    v15 = v5;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2148C7000, v15, OS_LOG_TYPE_DEBUG, "clearTemplateListForUser: -> void\n", buf, 2u);
  }
}

- (int)handleFirstUnlock
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  int v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v4 = __osLogTrace;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_2148C7000, v4, OS_LOG_TYPE_DEBUG, "handleFirstUnlock\n", (uint8_t *)&v11, 2u);
  }
  v5 = -[BiometricKitXPCServer handleCatacombUnlock](self, "handleCatacombUnlock");
  v6 = v5;
  if (__osLogTrace)
    v7 = __osLogTrace;
  else
    v7 = v3;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 67109120;
      v12 = v6;
      v8 = v7;
      v9 = OS_LOG_TYPE_ERROR;
LABEL_14:
      _os_log_impl(&dword_2148C7000, v8, v9, "handleFirstUnlock: -> %d\n", (uint8_t *)&v11, 8u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v11 = 67109120;
    v12 = 0;
    v8 = v7;
    v9 = OS_LOG_TYPE_DEBUG;
    goto LABEL_14;
  }
  return v6;
}

- (int)handleCatacombUnlock
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  NSObject *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v4 = __osLogTrace;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_2148C7000, v4, OS_LOG_TYPE_DEBUG, "handleCatacombUnlock\n", (uint8_t *)&v10, 2u);
  }
  if (-[BiometricKitXPCServer isCatacombAccessible](self, "isCatacombAccessible"))
  {
    -[NSMutableArray lock](self->_cachedIdentities, "lock");
    if (!-[BiometricKitXPCServer catacombFileAccessed](self, "catacombFileAccessed"))
    {
      -[BiometricKitXPCServer restoreAndSyncTemplates](self, "restoreAndSyncTemplates");
      -[BiometricKitXPCServer setCatacombFileAccessed:](self, "setCatacombFileAccessed:", 1);
      -[BiometricKitXPCServer setTemplatesAtBoot:](self, "setTemplatesAtBoot:", 0);
      -[BiometricKitXPCServer updateEnrollmentChangedNotification:](self, "updateEnrollmentChangedNotification:", 1);
    }
    -[NSMutableArray unlock](self->_cachedIdentities, "unlock");
    if (__osLogTrace)
      v5 = __osLogTrace;
    else
      v5 = v3;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v10 = 67109120;
      LODWORD(v11) = 0;
      _os_log_impl(&dword_2148C7000, v5, OS_LOG_TYPE_DEBUG, "handleCatacombUnlock: -> %d\n", (uint8_t *)&v10, 8u);
    }
    return 0;
  }
  else
  {
    if (__osLog)
      v8 = __osLog;
    else
      v8 = v3;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 136316162;
      v11 = "[self isCatacombAccessible]";
      v12 = 2048;
      v13 = 0;
      v14 = 2080;
      v15 = &unk_21491C593;
      v16 = 2080;
      v17 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v18 = 1024;
      v19 = 3237;
      _os_log_impl(&dword_2148C7000, v8, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v10, 0x30u);
    }
    if (__osLogTrace)
      v9 = __osLogTrace;
    else
      v9 = v3;
    v6 = 261;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 67109120;
      LODWORD(v11) = 261;
      _os_log_impl(&dword_2148C7000, v9, OS_LOG_TYPE_ERROR, "handleCatacombUnlock: -> %d\n", (uint8_t *)&v10, 8u);
    }
  }
  return v6;
}

- (int)checkCatacombForUser:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  int v9;
  NSObject *v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v3 = *(_QWORD *)&a3;
  v23 = *MEMORY[0x24BDAC8D0];
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v13 = 67109120;
    LODWORD(v14) = v3;
    _os_log_impl(&dword_2148C7000, v6, OS_LOG_TYPE_DEBUG, "checkCatacombForUser: %d\n", (uint8_t *)&v13, 8u);
  }
  if ((_DWORD)v3 == -1 || (-[BKCatacomb stateOfUserComponent:](self->_catacomb, "stateOfUserComponent:", v3) & 3) != 1)
    goto LABEL_10;
  v7 = -[BiometricKitXPCServer loadCatacombForUser:](self, "loadCatacombForUser:", v3);
  if (!v7)
  {
    -[BiometricKitXPCServer validateAllUsers](self, "validateAllUsers");
    -[BiometricKitXPCServer syncTemplateListForUser:](self, "syncTemplateListForUser:", v3);
LABEL_10:
    if (__osLogTrace)
      v8 = __osLogTrace;
    else
      v8 = v5;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v13 = 67109120;
      LODWORD(v14) = 0;
      _os_log_impl(&dword_2148C7000, v8, OS_LOG_TYPE_DEBUG, "checkCatacombForUser: -> %d\n", (uint8_t *)&v13, 8u);
    }
    return 0;
  }
  v9 = v7;
  if (__osLog)
    v11 = __osLog;
  else
    v11 = v5;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v13 = 136316162;
    v14 = "err == 0 ";
    v15 = 2048;
    v16 = v9;
    v17 = 2080;
    v18 = &unk_21491C593;
    v19 = 2080;
    v20 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v21 = 1024;
    v22 = 3302;
    _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v13, 0x30u);
  }
  if (__osLogTrace)
    v12 = __osLogTrace;
  else
    v12 = v5;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = 67109120;
    LODWORD(v14) = v9;
    _os_log_impl(&dword_2148C7000, v12, OS_LOG_TYPE_ERROR, "checkCatacombForUser: -> %d\n", (uint8_t *)&v13, 8u);
  }
  return v9;
}

- (int)checkTemplatesValidityForUser:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  NSObject *v6;
  int v7;
  int v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v13;
  char v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v3 = *(_QWORD *)&a3;
  v25 = *MEMORY[0x24BDAC8D0];
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v16) = v3;
    _os_log_impl(&dword_2148C7000, v6, OS_LOG_TYPE_DEBUG, "checkTemplatesValidityForUser: %d\n", buf, 8u);
  }
  v14 = 0;
  if (!-[BiometricKitXPCServer identitiesCount](self, "identitiesCount"))
    goto LABEL_10;
  v7 = -[BiometricKitXPCServer checkCatacombForUser:](self, "checkCatacombForUser:", v3);
  if (v7)
  {
    v9 = v7;
    if (__osLog)
      v13 = __osLog;
    else
      v13 = v5;
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_DWORD *)buf = 136316162;
    v16 = "err == 0 ";
    v17 = 2048;
    v18 = v9;
    v19 = 2080;
    v20 = &unk_21491C593;
    v21 = 2080;
    v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v23 = 1024;
    v24 = 3335;
LABEL_39:
    _os_log_impl(&dword_2148C7000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_18;
  }
  v8 = -[BiometricKitXPCServer performGetTemplatesValidityCommand:isValid:](self, "performGetTemplatesValidityCommand:isValid:", v3, &v14);
  if (v8)
  {
    v9 = v8;
    if (__osLog)
      v13 = __osLog;
    else
      v13 = v5;
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_DWORD *)buf = 136316162;
    v16 = "err == 0 ";
    v17 = 2048;
    v18 = v9;
    v19 = 2080;
    v20 = &unk_21491C593;
    v21 = 2080;
    v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v23 = 1024;
    v24 = 3339;
    goto LABEL_39;
  }
  if (v14)
  {
LABEL_10:
    v9 = 0;
    goto LABEL_18;
  }
  if (__osLog)
    v10 = __osLog;
  else
    v10 = v5;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v16) = v3;
    _os_log_impl(&dword_2148C7000, v10, OS_LOG_TYPE_DEFAULT, "checkTemplatesValidityForUser: removing user %u because keybag UUID has changed\n", buf, 8u);
  }
  v9 = -[BiometricKitXPCServer removeUser:](self, "removeUser:", v3);
  if (!v9)
  {
    -[BiometricKitXPCServer saveCatacomb](self, "saveCatacomb");
    -[BiometricKitXPCServer syncTemplateListForUser:](self, "syncTemplateListForUser:", 0xFFFFFFFFLL);
    goto LABEL_18;
  }
  if (__osLog)
    v13 = __osLog;
  else
    v13 = v5;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v16 = "err == 0 ";
    v17 = 2048;
    v18 = v9;
    v19 = 2080;
    v20 = &unk_21491C593;
    v21 = 2080;
    v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v23 = 1024;
    v24 = 3346;
    goto LABEL_39;
  }
LABEL_18:
  if (__osLogTrace)
    v11 = __osLogTrace;
  else
    v11 = v5;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v16) = v9;
    _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_DEBUG, "checkTemplatesValidityForUser: -> %d\n", buf, 8u);
  }
  return v9;
}

- (int)removeUser:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  NSObject *v6;
  int v7;
  id v8;
  void *expressModeState;
  void *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *catacombUserUUIDs;
  void *v13;
  NSRecursiveLock *catacombLock;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  int v23;
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v3 = *(_QWORD *)&a3;
  v33 = *MEMORY[0x24BDAC8D0];
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v23 = 67109120;
    LODWORD(v24) = v3;
    _os_log_impl(&dword_2148C7000, v6, OS_LOG_TYPE_DEBUG, "removeUser: %d\n", (uint8_t *)&v23, 8u);
  }
  if ((_DWORD)v3 == -1)
  {
    if (__osLog)
      v20 = __osLog;
    else
      v20 = v5;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v23 = 136316162;
      v24 = "userID != 4294967295U";
      v25 = 2048;
      v26 = 0;
      v27 = 2080;
      v28 = &unk_21491C593;
      v29 = 2080;
      v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v31 = 1024;
      v32 = 3374;
      _os_log_impl(&dword_2148C7000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v23, 0x30u);
    }
    v7 = 258;
  }
  else
  {
    v7 = -[BiometricKitXPCServer performRemoveUserDataCommand:](self, "performRemoveUserDataCommand:", v3);
    if (!v7)
    {
      -[BKCatacomb removeUser:](self->_catacomb, "removeUser:", v3);
      v8 = (id)self->_expressModeState;
      objc_sync_enter(v8);
      expressModeState = (void *)self->_expressModeState;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(expressModeState, "removeObjectForKey:", v10);

      objc_sync_exit(v8);
      v11 = self->_catacombUserUUIDs;
      objc_sync_enter(v11);
      catacombUserUUIDs = self->_catacombUserUUIDs;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](catacombUserUUIDs, "removeObjectForKey:", v13);

      objc_sync_exit(v11);
      catacombLock = self->_catacombLock;
      +[CatacombComponent componentForUserID:](CatacombComponent, "componentForUserID:", v3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[BiometricKitXPCServer catacombFileNameForComponent:](self, "catacombFileNameForComponent:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSRecursiveLock deleteFile:](catacombLock, "deleteFile:", v16);

      if (__osLog)
        v17 = __osLog;
      else
        v17 = v5;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v23 = 67109120;
        LODWORD(v24) = v3;
        _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_DEFAULT, "User %u removed\n", (uint8_t *)&v23, 8u);
      }
      if (__osLogTrace)
        v18 = __osLogTrace;
      else
        v18 = v5;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v23 = 67109120;
        LODWORD(v24) = 0;
        _os_log_impl(&dword_2148C7000, v18, OS_LOG_TYPE_DEBUG, "removeUser: -> %d\n", (uint8_t *)&v23, 8u);
      }
      return 0;
    }
    if (__osLog)
      v21 = __osLog;
    else
      v21 = v5;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v23 = 136316162;
      v24 = "err == 0 ";
      v25 = 2048;
      v26 = v7;
      v27 = 2080;
      v28 = &unk_21491C593;
      v29 = 2080;
      v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v31 = 1024;
      v32 = 3377;
      _os_log_impl(&dword_2148C7000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v23, 0x30u);
    }
  }
  if (__osLogTrace)
    v22 = __osLogTrace;
  else
    v22 = v5;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v23 = 67109120;
    LODWORD(v24) = v7;
    _os_log_impl(&dword_2148C7000, v22, OS_LOG_TYPE_ERROR, "removeUser: -> %d\n", (uint8_t *)&v23, 8u);
  }
  return v7;
}

- (int)isValidUser:(unsigned int)a3
{
  NSObject *v4;
  NSObject *v5;
  int v6;
  NSObject *v7;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v5 = __osLogTrace;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_2148C7000, v5, OS_LOG_TYPE_DEBUG, "isValidUser\n", (uint8_t *)&v10, 2u);
  }
  if (a3 == 501)
  {
    v6 = 0;
  }
  else
  {
    if (__osLog)
      v9 = __osLog;
    else
      v9 = v4;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 136316162;
      v11 = "userID == 501";
      v12 = 2048;
      v13 = 0;
      v14 = 2080;
      v15 = &unk_21491C593;
      v16 = 2080;
      v17 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v18 = 1024;
      v19 = 3418;
      _os_log_impl(&dword_2148C7000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v10, 0x30u);
    }
    v6 = 258;
  }
  if (__osLogTrace)
    v7 = __osLogTrace;
  else
    v7 = v4;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v10 = 67109120;
    LODWORD(v11) = v6;
    _os_log_impl(&dword_2148C7000, v7, OS_LOG_TYPE_DEBUG, "isValidUser -> %d\n", (uint8_t *)&v10, 8u);
  }
  return v6;
}

- (int)syncTemplateListForUser:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  unsigned int maxTemplatesPerUser;
  _BOOL4 v7;
  unsigned int v8;
  void *v9;
  int v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char v14;
  unsigned int *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  unsigned int v19;
  int v20;
  int v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  _QWORD *v29;
  uint64_t v30;
  void *v31;
  NSObject *v33;
  NSObject *v34;
  int v35;
  void *v36;
  int v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  int v46;
  unint64_t v47;
  id obj;
  BiometricKitXPCServer *v49;
  unint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[128];
  _BYTE buf[22];
  __int16 v57;
  void *v58;
  __int16 v59;
  const char *v60;
  __int16 v61;
  int v62;
  uint64_t v63;

  v3 = *(_QWORD *)&a3;
  v63 = *MEMORY[0x24BDAC8D0];
  if (__osLogTrace)
    v5 = __osLogTrace;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v3;
    _os_log_impl(&dword_2148C7000, v5, OS_LOG_TYPE_DEBUG, "syncTemplateListForUser: %d\n", buf, 8u);
  }
  -[BiometricKitXPCServer cacheCatacombInfo](self, "cacheCatacombInfo");
  maxTemplatesPerUser = self->_maxTemplatesPerUser;
  v7 = -[BiometricKitXPCServer supportsRemovableAccessories](self, "supportsRemovableAccessories");
  v8 = 20;
  if (v7)
    v8 = 120;
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v8 * (unint64_t)maxTemplatesPerUser);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    if (__osLog)
      v41 = __osLog;
    else
      v41 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "buffer";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = 0;
      v57 = 2080;
      v58 = &unk_21491C593;
      v59 = 2080;
      v60 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v61 = 1024;
      v62 = 3516;
      _os_log_impl(&dword_2148C7000, v41, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    obj = 0;
    v37 = 260;
    goto LABEL_61;
  }
  v10 = -[BiometricKitXPCServer performGetIdentitiesListCommand:outBuffer:](self, "performGetIdentitiesListCommand:outBuffer:", v3, v9);
  if (v10)
  {
    v37 = v10;
    if (__osLog)
      v42 = __osLog;
    else
      v42 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "err == 0 ";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v37;
      v57 = 2080;
      v58 = &unk_21491C593;
      v59 = 2080;
      v60 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v61 = 1024;
      v62 = 3519;
      _os_log_impl(&dword_2148C7000, v42, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    obj = 0;
    goto LABEL_61;
  }
  if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * objc_msgSend(v9, "length"), 2) >= 0xCCCCCCCCCCCCCCDuLL)
  {
    if (__osLog)
      v43 = __osLog;
    else
      v43 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "(buffer.length % sizeof(identity_v1_t)) == 0";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = 0;
      v57 = 2080;
      v58 = &unk_21491C593;
      v59 = 2080;
      v60 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v61 = 1024;
      v62 = 3520;
      _os_log_impl(&dword_2148C7000, v43, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    obj = 0;
    v37 = 261;
LABEL_61:
    if (__osLogTrace)
      v38 = __osLogTrace;
    else
      v38 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v37;
      _os_log_impl(&dword_2148C7000, v38, OS_LOG_TYPE_ERROR, "syncTemplateListForUser: -> %d\n", buf, 8u);
    }
    goto LABEL_72;
  }
  v49 = self;
  v11 = objc_msgSend(v9, "length");
  v12 = v11 / 0x14;
  v13 = objc_msgSend(objc_retainAutorelease(v9), "bytes");
  v50 = v11;
  v47 = v11 / 0x14;
  v44 = v13;
  if (v11 >= 0x14)
  {
    v46 = 0;
    v14 = 0;
    if (v12 <= 1)
      v12 = 1;
    v15 = (unsigned int *)v13;
    do
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", v15 + 1);
      -[BiometricKitXPCServer getIdentityObjectByUserID:UUID:](v49, "getIdentityObjectByUserID:UUID:", *v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        if (__osLog)
          v18 = __osLog;
        else
          v18 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = *v15;
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = v19;
          *(_WORD *)&buf[8] = 2112;
          *(_QWORD *)&buf[10] = v16;
          _os_log_impl(&dword_2148C7000, v18, OS_LOG_TYPE_DEFAULT, "syncTemplateListForUser: removing SEP identity [%u:%@] because it is not present in biometrickitd\n", buf, 0x12u);
        }
        v20 = -[BiometricKitXPCServer performRemoveIdentityCommand:](v49, "performRemoveIdentityCommand:", v15);
        if (v20)
        {
          v21 = v20;
          if (__osLog)
            v22 = __osLog;
          else
            v22 = MEMORY[0x24BDACB70];
          v46 = v20;
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            *(_QWORD *)&buf[4] = "err == 0 ";
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = v21;
            v57 = 2080;
            v58 = &unk_21491C593;
            v59 = 2080;
            v60 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
            v61 = 1024;
            v62 = 3532;
            _os_log_impl(&dword_2148C7000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
        }
        else
        {
          v46 = 0;
        }
        v14 = 1;
      }

      v15 += 5;
      --v12;
    }
    while (v12);
  }
  else
  {
    v14 = 0;
    v46 = 0;
  }
  if ((_DWORD)v3 == -1)
    -[BiometricKitXPCServer identities](v49, "identities");
  else
    -[BiometricKitXPCServer identitiesOfUser:](v49, "identitiesOfUser:", v3);
  v45 = v9;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v52;
    if (v47 <= 1)
      v26 = 1;
    else
      v26 = v47;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v52 != v25)
          objc_enumerationMutation(obj);
        v28 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        if (v50 < 0x14)
        {
LABEL_50:
          if (__osLog)
            v33 = __osLog;
          else
            v33 = MEMORY[0x24BDACB70];
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            v34 = v33;
            v35 = objc_msgSend(v28, "userID");
            objc_msgSend(v28, "uuid");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)&buf[4] = v35;
            *(_WORD *)&buf[8] = 2112;
            *(_QWORD *)&buf[10] = v36;
            _os_log_impl(&dword_2148C7000, v34, OS_LOG_TYPE_DEFAULT, "syncTemplateListForUser: removing biometrickitd identity [%u:%@] because it is not present in SEP\n", buf, 0x12u);

          }
          -[BiometricKitXPCServer removeIdentityObject:](v49, "removeIdentityObject:", v28);
          v14 = 1;
        }
        else
        {
          v29 = (_QWORD *)(v44 + 4);
          v30 = v26;
          while (1)
          {
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = 0;
            objc_msgSend(v28, "uuid");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "getUUIDBytes:", buf);

            if (objc_msgSend(v28, "userID") == *((_DWORD *)v29 - 1)
              && *v29 == *(_QWORD *)buf
              && v29[1] == *(_QWORD *)&buf[8])
            {
              break;
            }
            v29 = (_QWORD *)((char *)v29 + 20);
            if (!--v30)
              goto LABEL_50;
          }
        }
      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    }
    while (v24);
  }

  if ((v14 & 1) != 0)
  {
    -[BiometricKitXPCServer saveCatacomb](v49, "saveCatacomb");
    -[BiometricKitXPCServer updateEnrollmentChangedNotification:](v49, "updateEnrollmentChangedNotification:", 1);
  }
  v9 = v45;
  v37 = v46;
  if (v46)
    goto LABEL_61;
  if (__osLogTrace)
    v39 = __osLogTrace;
  else
    v39 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
  {
    *(_QWORD *)buf = 67109120;
    _os_log_impl(&dword_2148C7000, v39, OS_LOG_TYPE_DEBUG, "syncTemplateListForUser: -> %d\n", buf, 8u);
  }
  v37 = 0;
LABEL_72:

  return v37;
}

- (int)updatePropertiesOfIdentities
{
  NSObject *v3;
  NSObject *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  int v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  int v25;
  NSObject *v26;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  __int128 v37;
  int v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  int v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v4 = __osLogTrace;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2148C7000, v4, OS_LOG_TYPE_DEBUG, "updatePropertiesOfIdentities\n", buf, 2u);
  }
  v5 = -[BiometricKitXPCServer identitiesCount](self, "identitiesCount");
  if (!v5)
    goto LABEL_25;
  v6 = v5;
  if (-[BiometricKitXPCServer supportsRemovableAccessories](self, "supportsRemovableAccessories"))
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 40 * v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[BiometricKitXPCServer performGetIdentityRecordsCommand:](self, "performGetIdentityRecordsCommand:", v7);
    if (v8)
    {
      v25 = v8;
      if (__osLog)
        v30 = __osLog;
      else
        v30 = v3;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v40 = "err == 0 ";
        v41 = 2048;
        v42 = v25;
        v43 = 2080;
        v44 = &unk_21491C593;
        v45 = 2080;
        v46 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v47 = 1024;
        v48 = 3592;
        _os_log_impl(&dword_2148C7000, v30, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      goto LABEL_45;
    }
    if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * objc_msgSend(v7, "length"), 3) >= 0x666666666666667uLL)
    {
      if (__osLog)
        v28 = __osLog;
      else
        v28 = v3;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v40 = "outBuffer.length % sizeof(identity_record_t) == 0";
        v41 = 2048;
        v42 = 0;
        v43 = 2080;
        v44 = &unk_21491C593;
        v45 = 2080;
        v46 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v47 = 1024;
        v48 = 3593;
LABEL_37:
        _os_log_impl(&dword_2148C7000, v28, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
LABEL_44:
      v25 = 261;
LABEL_45:

      goto LABEL_26;
    }
    v9 = objc_msgSend(v7, "length");
    v10 = objc_retainAutorelease(v7);
    v11 = objc_msgSend(v10, "mutableBytes");
    if (v9 >= 0x28)
    {
      v12 = v11;
      v13 = v9 / 0x28;
      while (1)
      {
        -[BiometricKitXPCServer getIdentityObject:](self, "getIdentityObject:", v12);
        v14 = objc_claimAutoreleasedReturnValue();
        if (!v14)
          break;
        v15 = (void *)v14;
        -[BiometricKitXPCServer getAccessoryObject:](self, "getAccessoryObject:", v12 + 20);
        v16 = objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          if (__osLog)
            v29 = __osLog;
          else
            v29 = v3;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v40 = "accessory";
            v41 = 2048;
            v42 = 0;
            v43 = 2080;
            v44 = &unk_21491C593;
            v45 = 2080;
            v46 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
            v47 = 1024;
            v48 = 3603;
            _os_log_impl(&dword_2148C7000, v29, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }

          goto LABEL_44;
        }
        v17 = (void *)v16;
        objc_msgSend(v15, "setAccessory:", v16);

        v12 += 40;
        if (!--v13)
          goto LABEL_15;
      }
      if (__osLog)
        v28 = __osLog;
      else
        v28 = v3;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v40 = "identity";
        v41 = 2048;
        v42 = 0;
        v43 = 2080;
        v44 = &unk_21491C593;
        v45 = 2080;
        v46 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v47 = 1024;
        v48 = 3600;
        goto LABEL_37;
      }
      goto LABEL_44;
    }
LABEL_15:

LABEL_25:
    v25 = 0;
    goto LABEL_26;
  }
  v38 = 0;
  v37 = xmmword_21491B5A0;
  -[BiometricKitXPCServer getAccessoryObject:](self, "getAccessoryObject:", &v37);
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[BiometricKitXPCServer identities](self, "identities", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v33 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "setAccessory:", v19);
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v22);
    }

    goto LABEL_25;
  }
  if (__osLog)
    v31 = __osLog;
  else
    v31 = v3;
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v40 = "accessory";
    v41 = 2048;
    v42 = 0;
    v43 = 2080;
    v44 = &unk_21491C593;
    v45 = 2080;
    v46 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v47 = 1024;
    v48 = 3612;
    _os_log_impl(&dword_2148C7000, v31, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
  v25 = 261;
LABEL_26:
  if (__osLogTrace)
    v26 = __osLogTrace;
  else
    v26 = v3;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2148C7000, v26, OS_LOG_TYPE_DEBUG, "updatePropertiesOfIdentities: -> void\n", buf, 2u);
  }
  return v25;
}

- (BOOL)templatesExistAtBoot
{
  NSObject *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  int v15;
  int v16;
  off_t st_size;
  NSObject *v18;
  uint64_t v19;
  _BOOL4 v20;
  NSObject *v21;
  __int128 v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  stat buf;
  uint8_t v30[4];
  const char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v2 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v3 = __osLogTrace;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf.st_dev) = 0;
    _os_log_impl(&dword_2148C7000, v3, OS_LOG_TYPE_DEBUG, "templatesExistAtBoot\n", (uint8_t *)&buf, 2u);
  }
  memset(&buf, 0, sizeof(buf));
  -[NSRecursiveLock content](self->_catacombLock, "content");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v40, 16);
  if (!v5)
  {
    v20 = 0;
    goto LABEL_29;
  }
  v7 = v5;
  v8 = *(_QWORD *)v26;
  *(_QWORD *)&v6 = 136316162;
  v23 = v6;
LABEL_8:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v26 != v8)
      objc_enumerationMutation(v4);
    v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v9);
    if (!objc_msgSend(v10, "hasPrefix:", CFSTR("user_"), v23)
      || !objc_msgSend(v10, "hasSuffix:", CFSTR(".cat")))
    {
      goto LABEL_17;
    }
    -[NSRecursiveLock catacombDir](self->_catacombLock, "catacombDir");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingString:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_retainAutorelease(v12);
    v14 = open_dprotected_np((const char *)objc_msgSend(v13, "UTF8String"), 0, 0, 1);
    if (v14 == -1)
    {
      if (__osLog)
        v18 = __osLog;
      else
        v18 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v30 = v23;
        v31 = "fd != -1";
        v32 = 2048;
        v33 = 0;
        v34 = 2080;
        v35 = &unk_21491C593;
        v36 = 2080;
        v37 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v38 = 1024;
        v39 = 3645;
        _os_log_impl(&dword_2148C7000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v30, 0x30u);
      }
      goto LABEL_16;
    }
    v15 = v14;
    v16 = fstat(v14, &buf);
    st_size = buf.st_size;
    close(v15);
    if (v16 != -1 && st_size > 1024)
      break;
LABEL_16:

LABEL_17:
    if (v7 == ++v9)
    {
      v19 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v40, 16);
      v7 = v19;
      if (!v19)
      {
        v20 = 0;
        goto LABEL_27;
      }
      goto LABEL_8;
    }
  }

  v20 = 1;
LABEL_27:
  v2 = MEMORY[0x24BDACB70];
LABEL_29:

  if (__osLogTrace)
    v21 = __osLogTrace;
  else
    v21 = v2;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v30 = 67109120;
    LODWORD(v31) = v20;
    _os_log_impl(&dword_2148C7000, v21, OS_LOG_TYPE_DEBUG, "templatesExistAtBoot -> %d\n", v30, 8u);
  }

  return v20;
}

- (int)cacheCatacombInfo
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  NSObject *v6;
  int v7;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD v12[2];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v4 = __osLogTrace;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2148C7000, v4, OS_LOG_TYPE_DEBUG, "cacheCatacombInfo\n", buf, 2u);
  }
  if (self->_maxTemplatesPerUser && self->_maxSupportedUsers)
    goto LABEL_10;
  v11 = 0;
  v12[0] = 0;
  *(_QWORD *)((char *)v12 + 7) = 0;
  v5 = -[BiometricKitXPCServer performGetBiometrickitdInfoCommand:](self, "performGetBiometrickitdInfoCommand:", &v11);
  if (!v5)
  {
    *(_QWORD *)&self->_maxTemplatesPerUser = v11;
LABEL_10:
    if (__osLogTrace)
      v6 = __osLogTrace;
    else
      v6 = v3;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v14) = 0;
      _os_log_impl(&dword_2148C7000, v6, OS_LOG_TYPE_DEBUG, "cacheCatacombInfo -> %d\n", buf, 8u);
    }
    return 0;
  }
  v7 = v5;
  if (__osLog)
    v9 = __osLog;
  else
    v9 = v3;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v14 = "err == 0 ";
    v15 = 2048;
    v16 = v7;
    v17 = 2080;
    v18 = &unk_21491C593;
    v19 = 2080;
    v20 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v21 = 1024;
    v22 = 3684;
    _os_log_impl(&dword_2148C7000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
  if (__osLogTrace)
    v10 = __osLogTrace;
  else
    v10 = v3;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v14) = v7;
    _os_log_impl(&dword_2148C7000, v10, OS_LOG_TYPE_ERROR, "cacheCatacombInfo -> %d\n", buf, 8u);
  }
  return v7;
}

- (int)readCatacombState
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  int v27;
  void *v28;
  NSObject *v29;
  int v30;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE buf[22];
  __int16 v50;
  void *v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  int v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v4 = __osLogTrace;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2148C7000, v4, OS_LOG_TYPE_DEBUG, "readCatacombState\n", buf, 2u);
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BiometricKitXPCServer cacheCatacombInfo](self, "cacheCatacombInfo");
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 8 * (self->_maxSupportedUsers + 1));
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (__osLog)
      v32 = __osLog;
    else
      v32 = v3;
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      goto LABEL_68;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "buffer";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = 0;
    v50 = 2080;
    v51 = &unk_21491C593;
    v52 = 2080;
    v53 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v54 = 1024;
    v55 = 3717;
    goto LABEL_67;
  }
  v7 = (void *)v6;
  v8 = -[BiometricKitXPCServer performGetCatacombStateCommand:](self, "performGetCatacombStateCommand:", v6);
  if (v8)
  {
    v30 = v8;
    if (__osLog)
      v33 = __osLog;
    else
      v33 = v3;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "err == 0 ";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v30;
      v50 = 2080;
      v51 = &unk_21491C593;
      v52 = 2080;
      v53 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v54 = 1024;
      v55 = 3720;
LABEL_61:
      _os_log_impl(&dword_2148C7000, v33, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    -[BKCatacomb reset](self->_catacomb, "reset");
    v9 = -[BKCatacomb addUserStatesFromBuffer:](self->_catacomb, "addUserStatesFromBuffer:", v7);
    if (!v9)
    {
      if (!-[BiometricKitXPCServer supportsRemovableAccessories](self, "supportsRemovableAccessories"))
      {
        v37 = v7;
        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 140 * self->_maxSupportedUsers);
      v10 = objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = -[BiometricKitXPCServer performGetCatacombGroupStateCommand:](self, "performGetCatacombGroupStateCommand:", v10);
        if (v11)
        {
          v30 = v11;
          if (__osLog)
            v34 = __osLog;
          else
            v34 = v3;
          if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            goto LABEL_80;
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = "err == 0 ";
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v30;
          v50 = 2080;
          v51 = &unk_21491C593;
          v52 = 2080;
          v53 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
          v54 = 1024;
          v55 = 3735;
        }
        else
        {
          v12 = -[BKCatacomb addGroupStatesFromBuffer:](self->_catacomb, "addGroupStatesFromBuffer:", v10);
          if (!v12)
          {
            v37 = (void *)v10;
LABEL_15:
            v45 = 0u;
            v46 = 0u;
            v43 = 0u;
            v44 = 0u;
            -[BiometricKitXPCServer identities](self, "identities");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
            if (v14)
            {
              v15 = v14;
              v16 = *(_QWORD *)v44;
              do
              {
                for (i = 0; i != v15; ++i)
                {
                  if (*(_QWORD *)v44 != v16)
                    objc_enumerationMutation(v13);
                  v18 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
                  if (objc_msgSend(v18, "userID") != -1
                    && (-[BKCatacomb stateOfUserComponent:](self->_catacomb, "stateOfUserComponent:", objc_msgSend(v18, "userID")) & 1) == 0)
                  {
                    objc_msgSend(v5, "addObject:", v18);
                  }
                }
                v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
              }
              while (v15);
            }

            if (objc_msgSend(v5, "count"))
            {
              v41 = 0u;
              v42 = 0u;
              v39 = 0u;
              v40 = 0u;
              v36 = v5;
              obj = v5;
              v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
              if (v19)
              {
                v20 = v19;
                v21 = *(_QWORD *)v40;
                do
                {
                  for (j = 0; j != v20; ++j)
                  {
                    if (*(_QWORD *)v40 != v21)
                      objc_enumerationMutation(obj);
                    v23 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
                    if (__osLog)
                      v24 = __osLog;
                    else
                      v24 = v3;
                    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                    {
                      v25 = v24;
                      v26 = v3;
                      v27 = objc_msgSend(v23, "userID");
                      objc_msgSend(v23, "uuid");
                      v28 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 67109378;
                      *(_DWORD *)&buf[4] = v27;
                      v3 = v26;
                      *(_WORD *)&buf[8] = 2112;
                      *(_QWORD *)&buf[10] = v28;
                      _os_log_impl(&dword_2148C7000, v25, OS_LOG_TYPE_DEFAULT, "readCatacombState: removing biometrickitd identity [%u:%@]\n", buf, 0x12u);

                    }
                    -[BiometricKitXPCServer removeIdentityObject:](self, "removeIdentityObject:", v23, v36);
                  }
                  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
                }
                while (v20);
              }

              -[BiometricKitXPCServer updateEnrollmentChangedNotification:](self, "updateEnrollmentChangedNotification:", 1);
              v5 = v36;
            }
            if (__osLogTrace)
              v29 = __osLogTrace;
            else
              v29 = v3;
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              *(_QWORD *)buf = 67109120;
              _os_log_impl(&dword_2148C7000, v29, OS_LOG_TYPE_DEBUG, "readCatacombState -> %d\n", buf, 8u);
            }
            v30 = 0;
            v7 = v37;
            goto LABEL_45;
          }
          v30 = v12;
          if (__osLog)
            v34 = __osLog;
          else
            v34 = v3;
          if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            goto LABEL_80;
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = "err == 0 ";
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v30;
          v50 = 2080;
          v51 = &unk_21491C593;
          v52 = 2080;
          v53 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
          v54 = 1024;
          v55 = 3738;
        }
        _os_log_impl(&dword_2148C7000, v34, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_80:
        v7 = (void *)v10;
        goto LABEL_81;
      }
      if (__osLog)
        v32 = __osLog;
      else
        v32 = v3;
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
LABEL_68:
        v7 = 0;
        v30 = 260;
        goto LABEL_81;
      }
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "buffer";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = 0;
      v50 = 2080;
      v51 = &unk_21491C593;
      v52 = 2080;
      v53 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v54 = 1024;
      v55 = 3732;
LABEL_67:
      _os_log_impl(&dword_2148C7000, v32, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      goto LABEL_68;
    }
    v30 = v9;
    if (__osLog)
      v33 = __osLog;
    else
      v33 = v3;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "err == 0 ";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v30;
      v50 = 2080;
      v51 = &unk_21491C593;
      v52 = 2080;
      v53 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v54 = 1024;
      v55 = 3727;
      goto LABEL_61;
    }
  }
LABEL_81:
  if (__osLogTrace)
    v35 = __osLogTrace;
  else
    v35 = v3;
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v30;
    _os_log_impl(&dword_2148C7000, v35, OS_LOG_TYPE_ERROR, "readCatacombState -> %d\n", buf, 8u);
  }
LABEL_45:

  return v30;
}

- (id)catacombFileNameForComponent:(id)a3
{
  __CFString *v3;
  NSObject *v4;
  NSObject *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint8_t buf[4];
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (__CFString *)a3;
  v4 = MEMORY[0x24BDACB70];
  if (__osLog)
    v5 = __osLog;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v14 = v3;
    _os_log_impl(&dword_2148C7000, v5, OS_LOG_TYPE_DEBUG, "catacombFileNameForComponent: %p\n", buf, 0xCu);
  }
  if ((-[__CFString isMasterComponent](v3, "isMasterComponent") & 1) != 0)
  {
    v6 = CFSTR("master.cat");
  }
  else if (-[__CFString isUserComponent](v3, "isUserComponent"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("user_%08x.cat"), -[__CFString userID](v3, "userID"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[__CFString isGroupComponent](v3, "isGroupComponent"))
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    v8 = -[__CFString userID](v3, "userID");
    v9 = *(unsigned int *)-[__CFString group](v3, "group");
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", -[__CFString group](v3, "group") + 4);
    objc_msgSend(v7, "stringWithFormat:", CFSTR("group_%08x_%x_%@.cat"), v8, v9, v10);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  if (__osLog)
    v11 = __osLog;
  else
    v11 = v4;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v6;
    _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_DEBUG, "catacombFileNameForComponent: -> %@\n", buf, 0xCu);
  }

  return v6;
}

- (id)getIdentityObjectByUserID:(unsigned int)a3 UUID:(id)a4
{
  id v6;
  NSObject *v7;
  ActivityTracker *v8;
  ActivityTracker *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  id v16;
  NSObject *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  _BYTE v24[18];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (__osLogTrace)
    v7 = __osLogTrace;
  else
    v7 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v24 = a3;
    *(_WORD *)&v24[4] = 2112;
    *(_QWORD *)&v24[6] = v6;
    _os_log_impl(&dword_2148C7000, v7, OS_LOG_TYPE_DEBUG, "getIdentityObjectByUserID:UUID: %d %@\n", buf, 0x12u);
  }
  v8 = self->_ongoingBiometricOperation;
  objc_sync_enter(v8);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = self->_ongoingBiometricOperation;
  v10 = -[ActivityTracker countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v13, "userID", (_QWORD)v19) == a3)
        {
          objc_msgSend(v13, "uuid");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqual:", v6);

          if (v15)
          {
            v16 = v13;
            goto LABEL_17;
          }
        }
      }
      v10 = -[ActivityTracker countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      if (v10)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_17:

  objc_sync_exit(v8);
  if (__osLogTrace)
    v17 = __osLogTrace;
  else
    v17 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)v24 = v16;
    *(_WORD *)&v24[8] = 2112;
    *(_QWORD *)&v24[10] = v16;
    _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_DEBUG, "getIdentityObjectByUserID:UUID: -> %p(%@)\n", buf, 0x16u);
  }

  return v16;
}

- (id)getIdentityObject:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  uint64_t var0;
  void *v8;
  $7287BE6C16BD8CBBAFC45DEB4D81687E *v9;
  NSObject *v10;
  int v12;
  $7287BE6C16BD8CBBAFC45DEB4D81687E *v13;
  __int16 v14;
  $7287BE6C16BD8CBBAFC45DEB4D81687E *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v12 = 134217984;
    v13 = a3;
    _os_log_impl(&dword_2148C7000, v6, OS_LOG_TYPE_DEBUG, "getIdentityObject: %p\n", (uint8_t *)&v12, 0xCu);
  }
  if (a3)
  {
    var0 = a3->var0;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a3->var1);
    -[BiometricKitXPCServer getIdentityObjectByUserID:UUID:](self, "getIdentityObjectByUserID:UUID:", var0, v8);
    v9 = ($7287BE6C16BD8CBBAFC45DEB4D81687E *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  if (__osLogTrace)
    v10 = __osLogTrace;
  else
    v10 = v5;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v12 = 134218242;
    v13 = v9;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_2148C7000, v10, OS_LOG_TYPE_DEBUG, "getIdentityObject: -> %p(%@)\n", (uint8_t *)&v12, 0x16u);
  }
  return v9;
}

- (id)identities
{
  ActivityTracker *v3;
  void *v4;

  v3 = self->_ongoingBiometricOperation;
  objc_sync_enter(v3);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", self->_ongoingBiometricOperation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v3);

  return v4;
}

- (unint64_t)identitiesCount
{
  ActivityTracker *v3;
  unint64_t v4;

  v3 = self->_ongoingBiometricOperation;
  objc_sync_enter(v3);
  v4 = -[ActivityTracker count](self->_ongoingBiometricOperation, "count");
  objc_sync_exit(v3);

  return v4;
}

- (id)identitiesOfUser:(unsigned int)a3
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  ActivityTracker *v8;
  ActivityTracker *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v21) = a3;
    _os_log_impl(&dword_2148C7000, v6, OS_LOG_TYPE_DEBUG, "identitiesOfUser: %d\n", buf, 8u);
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_ongoingBiometricOperation;
  objc_sync_enter(v8);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = self->_ongoingBiometricOperation;
  v10 = -[ActivityTracker countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "userID", (_QWORD)v16) == a3)
          objc_msgSend(v7, "addObject:", v13);
      }
      v10 = -[ActivityTracker countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v10);
  }

  objc_sync_exit(v8);
  if (__osLogTrace)
    v14 = __osLogTrace;
  else
    v14 = v5;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v7;
    _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_DEBUG, "identitiesOfUser: -> %@\n", buf, 0xCu);
  }
  return v7;
}

- (id)identitiesOfComponent:(id)a3
{
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  ActivityTracker *v19;
  id v20;
  void *v21;
  int v22;
  ActivityTracker *obj;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v24 = a3;
  if (__osLogTrace)
    v4 = __osLogTrace;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v24;
    _os_log_impl(&dword_2148C7000, v4, OS_LOG_TYPE_DEBUG, "identitiesOfComponent: %@\n", buf, 0xCu);
  }
  if (!-[BiometricKitXPCServer supportsRemovableAccessories](self, "supportsRemovableAccessories"))
  {
    if (objc_msgSend(v24, "isUserComponent"))
    {
      -[BiometricKitXPCServer identitiesOfUser:](self, "identitiesOfUser:", objc_msgSend(v24, "userID"));
      v20 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
    goto LABEL_12;
  }
  if ((objc_msgSend(v24, "isMasterComponent") & 1) != 0)
  {
LABEL_12:
    v20 = 0;
    goto LABEL_27;
  }
  if (objc_msgSend(v24, "isGroupComponent"))
    v5 = *(_DWORD *)objc_msgSend(v24, "group");
  else
    v5 = 1;
  v22 = v5;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", objc_msgSend(v24, "group") + 4);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v19 = self->_ongoingBiometricOperation;
  objc_sync_enter(v19);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = self->_ongoingBiometricOperation;
  v6 = -[ActivityTracker countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "userID", v19);
        if (v10 == objc_msgSend(v24, "userID"))
        {
          objc_msgSend(v9, "accessory");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "group");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "type") == v22)
          {
            objc_msgSend(v9, "accessory");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "group");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "uuid");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqual:", v21);

            if (v16)
              objc_msgSend(v20, "addObject:", v9);
          }
          else
          {

          }
        }
      }
      v6 = -[ActivityTracker countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v6);
  }

  objc_sync_exit(v19);
LABEL_27:
  if (__osLogTrace)
    v17 = __osLogTrace;
  else
    v17 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v20;
    _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_DEBUG, "identitiesOfComponent: -> %@\n", buf, 0xCu);
  }

  return v20;
}

- (id)catacombComponentForIdentity:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _BYTE v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v19 = 138412290;
    *(_QWORD *)&v19[4] = v4;
    _os_log_impl(&dword_2148C7000, v6, OS_LOG_TYPE_DEBUG, "catacombComponentForIdentity: %@\n", v19, 0xCu);
  }
  if (v4)
  {
    if (-[BiometricKitXPCServer supportsRemovableAccessories](self, "supportsRemovableAccessories")
      && (objc_msgSend(v4, "accessory"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "group"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "type"),
          v8,
          v7,
          v9 != 1))
    {
      *(_OWORD *)&v19[8] = 0uLL;
      *(_DWORD *)v19 = objc_msgSend(v4, "userID");
      objc_msgSend(v4, "accessory", *(_QWORD *)v19);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "group");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)&v19[4] = objc_msgSend(v13, "type");

      objc_msgSend(v4, "accessory");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "group");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "getUUIDBytes:", &v19[8]);

      +[CatacombComponent component:](CatacombComponent, "component:", v19);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[CatacombComponent componentForUserID:](CatacombComponent, "componentForUserID:", objc_msgSend(v4, "userID"));
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v10;
  }
  else
  {
    v11 = 0;
  }
  if (__osLogTrace)
    v17 = __osLogTrace;
  else
    v17 = v5;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v19 = 138412290;
    *(_QWORD *)&v19[4] = v11;
    _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_DEBUG, "identitiesOfComponent: -> %@\n", v19, 0xCu);
  }

  return v11;
}

- (unsigned)singleEnrolledUser
{
  ActivityTracker *v3;
  ActivityTracker *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  unsigned int v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = self->_ongoingBiometricOperation;
  objc_sync_enter(v3);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_ongoingBiometricOperation;
  v5 = -[ActivityTracker countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    v7 = -1;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (v7 == -1)
        {
          v7 = objc_msgSend(v9, "userID", (_QWORD)v12);
        }
        else if (v7 != objc_msgSend(v9, "userID"))
        {
          goto LABEL_13;
        }
      }
      v5 = -[ActivityTracker countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v5);
  }
  else
  {
LABEL_13:
    v7 = -1;
  }

  objc_sync_exit(v3);
  if (__osLogTrace)
    v10 = __osLogTrace;
  else
    v10 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    v17 = v7;
    _os_log_impl(&dword_2148C7000, v10, OS_LOG_TYPE_DEBUG, "singleEnrolledUser: -> %d\n", buf, 8u);
  }
  return v7;
}

- (void)removeIdentityObject:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  void *v8;
  ActivityTracker *v9;
  ActivityTracker *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  NSObject *v20;
  BiometricKitXPCServer *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  int v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (__osLogTrace)
    v5 = __osLogTrace;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = v5;
    v7 = objc_msgSend(v4, "userID");
    objc_msgSend(v4, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    v28 = v7;
    v29 = 2112;
    v30 = v8;
    _os_log_impl(&dword_2148C7000, v6, OS_LOG_TYPE_DEBUG, "removeIdentityObject: %u:%@\n", buf, 0x12u);

  }
  v9 = self->_ongoingBiometricOperation;
  objc_sync_enter(v9);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v21 = self;
  v10 = self->_ongoingBiometricOperation;
  v11 = -[ActivityTracker countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "userID");
        if (v15 == objc_msgSend(v4, "userID"))
        {
          objc_msgSend(v14, "uuid");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "uuid");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "isEqual:", v17);

          if ((v18 & 1) != 0)
          {
            v19 = v14;

            if (v19)
              -[ActivityTracker removeObject:](v21->_ongoingBiometricOperation, "removeObject:", v19);
            goto LABEL_18;
          }
        }
      }
      v11 = -[ActivityTracker countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v11)
        continue;
      break;
    }
  }

  v19 = 0;
LABEL_18:

  objc_sync_exit(v9);
  if (__osLogTrace)
    v20 = __osLogTrace;
  else
    v20 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2148C7000, v20, OS_LOG_TYPE_DEBUG, "removeIdentityObject: -> void\n", buf, 2u);
  }

}

- (void)addIdentityObject:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  ActivityTracker *v9;
  NSObject *v10;
  __int128 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(v11) = 138412290;
    *(_QWORD *)((char *)&v11 + 4) = v4;
    _os_log_impl(&dword_2148C7000, v6, OS_LOG_TYPE_DEBUG, "addIdentityObject: %@\n", (uint8_t *)&v11, 0xCu);
  }
  if (v4)
  {
    objc_msgSend(v4, "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {

    }
    else if (!-[BiometricKitXPCServer supportsRemovableAccessories](self, "supportsRemovableAccessories"))
    {
      v12 = 0;
      v11 = xmmword_21491B5A0;
      -[BiometricKitXPCServer getAccessoryObject:](self, "getAccessoryObject:", &v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setAccessory:", v8);

    }
    v9 = self->_ongoingBiometricOperation;
    objc_sync_enter(v9);
    -[ActivityTracker addObject:](self->_ongoingBiometricOperation, "addObject:", v4);
    objc_sync_exit(v9);

  }
  if (__osLogTrace)
    v10 = __osLogTrace;
  else
    v10 = v5;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_2148C7000, v10, OS_LOG_TYPE_DEBUG, "addIdentityObject: -> void\n", (uint8_t *)&v11, 2u);
  }

}

- (void)addIdentityObjects:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  _BOOL4 v14;
  ActivityTracker *v15;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[16];
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v4;
    _os_log_impl(&dword_2148C7000, v6, OS_LOG_TYPE_DEBUG, "addIdentityObjects: %@\n", buf, 0xCu);
  }
  if (v4)
  {
    if (!-[BiometricKitXPCServer supportsRemovableAccessories](self, "supportsRemovableAccessories"))
    {
      v23 = 0;
      *(_OWORD *)buf = xmmword_21491B5A0;
      -[BiometricKitXPCServer getAccessoryObject:](self, "getAccessoryObject:", buf);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v8 = v4;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v18 != v10)
              objc_enumerationMutation(v8);
            v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
            objc_msgSend(v12, "accessory", (_QWORD)v17);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v13 == 0;

            if (v14)
              objc_msgSend(v12, "setAccessory:", v7);
          }
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v9);
      }

    }
    v15 = self->_ongoingBiometricOperation;
    objc_sync_enter(v15);
    -[ActivityTracker addObjectsFromArray:](self->_ongoingBiometricOperation, "addObjectsFromArray:", v4);
    objc_sync_exit(v15);

  }
  if (__osLogTrace)
    v16 = __osLogTrace;
  else
    v16 = v5;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_DEBUG, "addIdentityObjects: -> void\n", buf, 2u);
  }

}

- (int)saveCatacombIfDirtyWithInterval:(double)a3 andDelay:(double)a4
{
  NSObject *v7;
  NSObject *v8;
  int v9;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  NSObject *v15;
  _QWORD block[6];
  _QWORD v17[3];
  uint8_t buf[4];
  double v19;
  __int16 v20;
  double v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    v19 = a3;
    v20 = 2048;
    v21 = a4;
    _os_log_impl(&dword_2148C7000, v8, OS_LOG_TYPE_DEBUG, "saveCatacombIfDirtyWithInterval:andDelay: %f %f\n", buf, 0x16u);
  }
  memset(v17, 0, 23);
  v9 = -[BiometricKitXPCServer performGetBiometrickitdInfoCommand:](self, "performGetBiometrickitdInfoCommand:", v17);
  if (v9)
  {
    if (__osLog)
      v15 = __osLog;
    else
      v15 = v7;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v19 = COERCE_DOUBLE("err == 0 ");
      v20 = 2048;
      *(_QWORD *)&v21 = v9;
      v22 = 2080;
      v23 = &unk_21491C593;
      v24 = 2080;
      v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v26 = 1024;
      v27 = 4076;
      _os_log_impl(&dword_2148C7000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else if (BYTE4(v17[2]))
  {
    if (a3 <= 0.0)
    {
      v12 = 1.79769313e308;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSince1970");
      v12 = v11 - (double)*(_QWORD *)((char *)&v17[1] + 4);

    }
    if (a3 == 0.0 || v12 > a3)
    {
      -[BiometricOperation setActive:](self->_runningBioOp, "setActive:", 1);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __66__BiometricKitXPCServer_saveCatacombIfDirtyWithInterval_andDelay___block_invoke;
      block[3] = &unk_24D2413D8;
      block[4] = self;
      *(double *)&block[5] = a4;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }
  }
  if (__osLogTrace)
    v13 = __osLogTrace;
  else
    v13 = v7;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v19) = v9;
    _os_log_impl(&dword_2148C7000, v13, OS_LOG_TYPE_DEBUG, "saveCatacombIfDirtyWithInterval:andDelay: -> %d\n", buf, 8u);
  }
  return v9;
}

uint64_t __66__BiometricKitXPCServer_saveCatacombIfDirtyWithInterval_andDelay___block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", *(_QWORD *)(a1 + 32), sel_saveTemplateListAfterTemplateUpdate, 0);
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:afterDelay:", sel_saveTemplateListAfterTemplateUpdate, 0, *(double *)(a1 + 40));
}

- (int)saveTemplateListAfterTemplateUpdate
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  os_log_type_t v8;
  NSObject *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v4 = __osLogTrace;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_2148C7000, v4, OS_LOG_TYPE_DEBUG, "saveTemplateListAfterTemplateUpdate\n", (uint8_t *)&v12, 2u);
  }
  v5 = -[BiometricKitXPCServer saveCatacomb](self, "saveCatacomb");
  if (v5)
  {
    if (__osLog)
      v10 = __osLog;
    else
      v10 = v3;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 136316162;
      v13 = "err == 0 ";
      v14 = 2048;
      v15 = v5;
      v16 = 2080;
      v17 = &unk_21491C593;
      v18 = 2080;
      v19 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v20 = 1024;
      v21 = 4113;
      _os_log_impl(&dword_2148C7000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v12, 0x30u);
    }
    if (__osLogTrace)
      v11 = __osLogTrace;
    else
      v11 = v3;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 67109120;
      LODWORD(v13) = v5;
      v7 = v11;
      v8 = OS_LOG_TYPE_ERROR;
      goto LABEL_12;
    }
  }
  else
  {
    if (__osLogTrace)
      v6 = __osLogTrace;
    else
      v6 = v3;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v12 = 67109120;
      LODWORD(v13) = 0;
      v7 = v6;
      v8 = OS_LOG_TYPE_DEBUG;
LABEL_12:
      _os_log_impl(&dword_2148C7000, v7, v8, "saveTemplateListAfterTemplateUpdate -> %d\n", (uint8_t *)&v12, 8u);
    }
  }
  return v5;
}

- (void)deleteUnusedCatacombFiles
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  NSObject *v24;
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
  uint8_t buf[16];
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v4 = __osLogTrace;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2148C7000, v4, OS_LOG_TYPE_DEBUG, "deleteUnusedCatacombFiles\n", buf, 2u);
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[BKCatacomb stateOfMasterComponent](self->_catacomb, "stateOfMasterComponent") & 2) != 0)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    -[BKCatacomb cachedComponents](self->_catacomb, "cachedComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v34 != v10)
            objc_enumerationMutation(v7);
          -[BiometricKitXPCServer catacombFileNameForComponent:](self, "catacombFileNameForComponent:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
      }
      while (v9);
    }

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[NSRecursiveLock content](self->_catacombLock, "content");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v30 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
          if ((objc_msgSend(v5, "containsObject:", v18) & 1) == 0
            && (objc_msgSend(v18, "isEqualToString:", CFSTR("biolockout.cat")) & 1) == 0)
          {
            objc_msgSend(v6, "addObject:", v18);
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
      }
      while (v15);
    }

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v19 = v6;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v38, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v26;
      do
      {
        for (k = 0; k != v21; ++k)
        {
          if (*(_QWORD *)v26 != v22)
            objc_enumerationMutation(v19);
          -[NSRecursiveLock deleteFile:](self->_catacombLock, "deleteFile:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * k), (_QWORD)v25);
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v38, 16);
      }
      while (v21);
    }

  }
  if (__osLogTrace)
    v24 = __osLogTrace;
  else
    v24 = v3;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2148C7000, v24, OS_LOG_TYPE_DEBUG, "deleteUnusedCatacombFiles -> void\n", buf, 2u);
  }

}

- (int)getCatacombSaveListForComponents:(id)a3 list:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  int v23;
  NSObject *v24;
  NSObject *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  _BYTE v37[18];
  __int16 v38;
  void *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v37 = v6;
    *(_WORD *)&v37[8] = 2048;
    *(_QWORD *)&v37[10] = a4;
    _os_log_impl(&dword_2148C7000, v8, OS_LOG_TYPE_DEBUG, "getCatacombSaveListForComponents:list: %@, %p\n", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v32 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          if ((objc_msgSend(v15, "isMasterComponent") & 1) == 0)
            objc_msgSend(v9, "addObject:", v15);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
      }
      while (v12);

      v7 = MEMORY[0x24BDACB70];
LABEL_30:
      +[CatacombComponent masterComponent](CatacombComponent, "masterComponent");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v10);
      goto LABEL_31;
    }
    goto LABEL_31;
  }
  v16 = -[BiometricKitXPCServer readCatacombState](self, "readCatacombState");
  if (!v16)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[BKCatacomb cachedComponents](self->_catacomb, "cachedComponents", 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v17)
    {
      v18 = v17;
      v19 = 0;
      v20 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v28 != v20)
            objc_enumerationMutation(v10);
          v22 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
          if ((-[BKCatacomb stateOfComponent:](self->_catacomb, "stateOfComponent:", v22) & 4) != 0)
          {
            if ((objc_msgSend(v22, "isMasterComponent") & 1) == 0)
              objc_msgSend(v9, "addObject:", v22);
            v19 = 1;
          }
        }
        v18 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v18);

      v7 = MEMORY[0x24BDACB70];
      if ((v19 & 1) == 0)
        goto LABEL_32;
      goto LABEL_30;
    }
LABEL_31:

LABEL_32:
    v23 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v9);
    goto LABEL_34;
  }
  v23 = v16;
  if (__osLog)
    v26 = __osLog;
  else
    v26 = v7;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v37 = "err == 0 ";
    *(_WORD *)&v37[8] = 2048;
    *(_QWORD *)&v37[10] = v23;
    v38 = 2080;
    v39 = &unk_21491C593;
    v40 = 2080;
    v41 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v42 = 1024;
    v43 = 4198;
    _os_log_impl(&dword_2148C7000, v26, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_34:
  if (__osLogTrace)
    v24 = __osLogTrace;
  else
    v24 = v7;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v37 = v23;
    *(_WORD *)&v37[4] = 2112;
    *(_QWORD *)&v37[6] = v9;
    _os_log_impl(&dword_2148C7000, v24, OS_LOG_TYPE_DEBUG, "getCatacombSaveListForComponents:list: -> %d (list = %@)\n", buf, 0x12u);
  }

  return v23;
}

- (unsigned)catacombVersion
{
  return 0x10000;
}

- (int)archiveCatacombDataForComponent:(id)a3 toArchiver:(id)a4
{
  char *v6;
  id v7;
  NSObject *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *expressModeState;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableDictionary *v22;
  NSMutableDictionary *catacombUserUUIDs;
  void *v24;
  NSObject *v25;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  id v33;
  unsigned int v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = (char *)a3;
  v7 = a4;
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    v36 = v6;
    v37 = 2048;
    v38 = v7;
    _os_log_impl(&dword_2148C7000, v8, OS_LOG_TYPE_DEBUG, "archiveCatacombDataForComponent:toArchiver: %p, %p\n", buf, 0x16u);
  }
  v34 = 0;
  if (!v6)
  {
    if (__osLog)
      v27 = __osLog;
    else
      v27 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_48;
    *(_DWORD *)buf = 136316162;
    v36 = "component";
    v37 = 2048;
    v38 = 0;
    v39 = 2080;
    v40 = &unk_21491C593;
    v41 = 2080;
    v42 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v43 = 1024;
    v44 = 4249;
    goto LABEL_47;
  }
  if (!v7)
  {
    if (__osLog)
      v27 = __osLog;
    else
      v27 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_48;
    *(_DWORD *)buf = 136316162;
    v36 = "archiver";
    v37 = 2048;
    v38 = 0;
    v39 = 2080;
    v40 = &unk_21491C593;
    v41 = 2080;
    v42 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v43 = 1024;
    v44 = 4250;
LABEL_47:
    _os_log_impl(&dword_2148C7000, v27, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_48:
    v10 = 0;
    v9 = 258;
    goto LABEL_66;
  }
  v9 = -[BiometricKitXPCServer performPrepareSaveCatacombCommand:outDataSize:](self, "performPrepareSaveCatacombCommand:outDataSize:", v6, &v34);
  if (v9)
  {
    if (__osLog)
      v28 = __osLog;
    else
      v28 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v36 = "err == 0 ";
      v37 = 2048;
      v38 = (id)v9;
      v39 = 2080;
      v40 = &unk_21491C593;
      v41 = 2080;
      v42 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v43 = 1024;
      v44 = 4254;
      _os_log_impl(&dword_2148C7000, v28, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v34);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v9 = -[BiometricKitXPCServer performCompleteSaveCatacombCommand:outBuffer:](self, "performCompleteSaveCatacombCommand:outBuffer:", v6, v10);
      if (!v9)
      {
        if (isInternalBuild())
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Saving secure data, component = %@"), v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[BiometricKitXPCServer logCatacombInfo:data:](self, "logCatacombInfo:data:", v11, v10);

        }
        objc_msgSend(v7, "encodeInt32:forKey:", -[BiometricKitXPCServer catacombVersion](self, "catacombVersion"), CFSTR("CatacombVersion"));
        objc_msgSend(v7, "encodeInt32:forKey:", objc_msgSend(v6, "userID"), CFSTR("CatacombUserID"));
        objc_msgSend(v7, "encodeObject:forKey:", v10, CFSTR("CatacombSecureData"));
        if ((objc_msgSend(v6, "isMasterComponent") & 1) != 0)
          goto LABEL_30;
        -[BiometricKitXPCServer identitiesOfComponent:](self, "identitiesOfComponent:", v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v7, "encodeObject:forKey:", v12, CFSTR("CatacombIdentityList"));
        if (objc_msgSend(v6, "isUserComponent"))
        {
          v13 = (id)self->_expressModeState;
          objc_sync_enter(v13);
          expressModeState = (void *)self->_expressModeState;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v6, "userID"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(expressModeState, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_sync_exit(v13);
          if (!v16)
          {
            v33 = 0;
            -[BiometricKitXPCServer getUserUUIDForUID:userUUID:](self, "getUserUUIDForUID:userUUID:", objc_msgSend(v6, "userID"), &v33);
            v17 = v33;
            if (v17)
            {
              v16 = v17;
              v18 = (id)self->_expressModeState;
              objc_sync_enter(v18);
              v19 = (void *)self->_expressModeState;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v6, "userID"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "setObject:forKey:", v16, v20);

              objc_sync_exit(v18);
            }
            else
            {
              if (__osLog)
                v32 = __osLog;
              else
                v32 = MEMORY[0x24BDACB70];
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                v36 = "uuid";
                v37 = 2048;
                v38 = 0;
                v39 = 2080;
                v40 = &unk_21491C593;
                v41 = 2080;
                v42 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
                v43 = 1024;
                v44 = 4305;
                _os_log_impl(&dword_2148C7000, v32, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
              }
              v16 = 0;
            }
          }
          objc_msgSend(v7, "encodeObject:forKey:", v16, CFSTR("CatacombUserUUID"));
          -[BiometricKitXPCServer getUserKeybagUUIDForUID:](self, "getUserKeybagUUIDForUID:", objc_msgSend(v6, "userID"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = self->_catacombUserUUIDs;
          objc_sync_enter(v22);
          catacombUserUUIDs = self->_catacombUserUUIDs;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v6, "userID"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            -[NSMutableDictionary setObject:forKey:](catacombUserUUIDs, "setObject:forKey:", v21, v24);
          }
          else
          {
            -[NSMutableDictionary objectForKeyedSubscript:](catacombUserUUIDs, "objectForKeyedSubscript:", v24);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
          }

          objc_sync_exit(v22);
          if (v21)
            objc_msgSend(v7, "encodeObject:forKey:", v21, CFSTR("CatacombUserKeybagUUID"));

        }
        else
        {
          if (!objc_msgSend(v6, "isGroupComponent"))
          {
LABEL_29:

LABEL_30:
            if (__osLogTrace)
              v25 = __osLogTrace;
            else
              v25 = MEMORY[0x24BDACB70];
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 67109120;
              LODWORD(v36) = 0;
              _os_log_impl(&dword_2148C7000, v25, OS_LOG_TYPE_DEBUG, "archiveCatacombDataForComponent:toArchiver: -> %d\n", buf, 8u);
            }
            v9 = 0;
            goto LABEL_36;
          }
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", objc_msgSend(v6, "group"), 8);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "encodeObject:forKey:", v16, CFSTR("CatacombGroup"));
        }

        goto LABEL_29;
      }
      if (__osLog)
        v30 = __osLog;
      else
        v30 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v36 = "err == 0 ";
        v37 = 2048;
        v38 = (id)v9;
        v39 = 2080;
        v40 = &unk_21491C593;
        v41 = 2080;
        v42 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v43 = 1024;
        v44 = 4262;
        _os_log_impl(&dword_2148C7000, v30, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    else
    {
      if (__osLog)
        v29 = __osLog;
      else
        v29 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v36 = "buffer";
        v37 = 2048;
        v38 = 0;
        v39 = 2080;
        v40 = &unk_21491C593;
        v41 = 2080;
        v42 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v43 = 1024;
        v44 = 4258;
        _os_log_impl(&dword_2148C7000, v29, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v10 = 0;
      v9 = 260;
    }
  }
LABEL_66:
  if (__osLogTrace)
    v31 = __osLogTrace;
  else
    v31 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v36) = v9;
    _os_log_impl(&dword_2148C7000, v31, OS_LOG_TYPE_ERROR, "archiveCatacombDataForComponent:toArchiver: -> %d\n", buf, 8u);
  }
LABEL_36:

  return v9;
}

- (int)unarchiveCatacombDataForComponent:(id)a3 fromUnarchiver:(id)a4 secureData:(id *)a5 identities:(id *)a6
{
  id v9;
  id v10;
  NSObject *v11;
  unsigned int v12;
  int v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  int v22;
  void *v23;
  id v24;
  void *expressModeState;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  NSObject *v30;
  NSObject *v31;
  int v32;
  NSObject *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  NSMutableDictionary *v39;
  NSMutableDictionary *catacombUserUUIDs;
  void *v41;
  void *v42;
  NSObject *v43;
  NSObject *v45;
  NSObject *v46;
  void *v47;
  NSObject *v48;
  NSObject *v49;
  id v50;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE buf[12];
  __int16 v59;
  id v60;
  __int16 v61;
  id *v62;
  __int16 v63;
  id *v64;
  __int16 v65;
  int v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  if (__osLogTrace)
    v11 = __osLogTrace;
  else
    v11 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v9;
    v59 = 2048;
    v60 = v10;
    v61 = 2048;
    v62 = a5;
    v63 = 2048;
    v64 = a6;
    _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_DEBUG, "unarchiveCatacombDataForComponent:fromUnarchiver:secureData:identities: %@, %p, %p, %p\n", buf, 0x2Au);
  }
  if (!v9)
  {
    if (__osLog)
      v45 = __osLog;
    else
      v45 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      goto LABEL_71;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "component";
    v59 = 2048;
    v60 = 0;
    v61 = 2080;
    v62 = (id *)&unk_21491C593;
    v63 = 2080;
    v64 = (id *)"/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v65 = 1024;
    v66 = 4354;
    goto LABEL_70;
  }
  if (v10)
  {
    v12 = -[BiometricKitXPCServer catacombVersion](self, "catacombVersion");
    if (v12 == objc_msgSend(v10, "decodeInt32ForKey:", CFSTR("CatacombVersion")))
    {
      v13 = objc_msgSend(v9, "userID");
      if (v13 == objc_msgSend(v10, "decodeInt32ForKey:", CFSTR("CatacombUserID")))
      {
        objc_msgSend(v10, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CatacombSecureData"));
        v50 = (id)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "isMasterComponent") & 1) != 0)
        {
          v14 = 0;
LABEL_49:
          if (a5)
            *a5 = objc_retainAutorelease(v50);
          if (a6)
            *a6 = objc_retainAutorelease(v14);
          if (__osLogTrace)
            v43 = __osLogTrace;
          else
            v43 = MEMORY[0x24BDACB70];
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            *(_QWORD *)buf = 67109120;
            _os_log_impl(&dword_2148C7000, v43, OS_LOG_TYPE_DEBUG, "unarchiveCatacombDataForComponent:fromUnarchiver:secureData:identities: -> %d\n", buf, 8u);
          }
          v32 = 0;
          goto LABEL_59;
        }
        v15 = (void *)MEMORY[0x24BDBCF20];
        v16 = objc_opt_class();
        objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "decodeObjectOfClasses:forKey:", v17, CFSTR("CatacombIdentityList"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        v14 = v18;
        v19 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
        if (v19)
        {
          v20 = *(_QWORD *)v54;
          while (2)
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v54 != v20)
                objc_enumerationMutation(v14);
              v22 = objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "userID");
              if (v22 != objc_msgSend(v9, "userID"))
              {
                if (__osLog)
                  v31 = __osLog;
                else
                  v31 = MEMORY[0x24BDACB70];
                if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136316162;
                  *(_QWORD *)&buf[4] = "identity.userID == component.userID";
                  v59 = 2048;
                  v60 = 0;
                  v61 = 2080;
                  v62 = (id *)&unk_21491C593;
                  v63 = 2080;
                  v64 = (id *)"/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biom"
                              "etricKitXPCServer.m";
                  v65 = 1024;
                  v66 = 4378;
                  _os_log_impl(&dword_2148C7000, v31, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
                }

                goto LABEL_36;
              }
            }
            v19 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
            if (v19)
              continue;
            break;
          }
        }

        if (objc_msgSend(v9, "isUserComponent"))
        {
          objc_msgSend(v10, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CatacombUserUUID"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (id)self->_expressModeState;
          objc_sync_enter(v24);
          if (v23)
          {
            expressModeState = (void *)self->_expressModeState;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v9, "userID"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(expressModeState, "setObject:forKey:", v23, v26);

          }
          else
          {
            v52 = 0;
            -[BiometricKitXPCServer getUserUUIDForUID:userUUID:](self, "getUserUUIDForUID:userUUID:", objc_msgSend(v9, "userID"), &v52);
            v34 = v52;
            if (v34)
            {
              v23 = v34;
              v35 = (id)self->_expressModeState;
              objc_sync_enter(v35);
              v36 = (void *)self->_expressModeState;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v9, "userID"));
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "setObject:forKey:", v23, v37);

              objc_sync_exit(v35);
            }
            else
            {
              if (__osLog)
                v49 = __osLog;
              else
                v49 = MEMORY[0x24BDACB70];
              if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                *(_QWORD *)&buf[4] = "uuid";
                v59 = 2048;
                v60 = 0;
                v61 = 2080;
                v62 = (id *)&unk_21491C593;
                v63 = 2080;
                v64 = (id *)"/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biomet"
                            "ricKitXPCServer.m";
                v65 = 1024;
                v66 = 4393;
                _os_log_impl(&dword_2148C7000, v49, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
              }
              v23 = 0;
            }
          }
          objc_sync_exit(v24);

          objc_msgSend(v10, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CatacombUserKeybagUUID"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v38)
            goto LABEL_48;
          v39 = self->_catacombUserUUIDs;
          objc_sync_enter(v39);
          catacombUserUUIDs = self->_catacombUserUUIDs;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v9, "userID"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](catacombUserUUIDs, "setObject:forKey:", v38, v41);

          objc_sync_exit(v39);
          -[BiometricKitXPCServer getUserKeybagUUIDForUID:](self, "getUserKeybagUUIDForUID:", objc_msgSend(v9, "userID"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v42 || (objc_msgSend(v38, "isEqual:", v42) & 1) != 0)
          {

LABEL_48:
            goto LABEL_49;
          }
          v47 = v23;
          if (__osLog)
            v48 = __osLog;
          else
            v48 = MEMORY[0x24BDACB70];
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            *(_QWORD *)&buf[4] = "[kbuuid isEqual:akskbuuid]";
            v59 = 2048;
            v60 = 0;
            v61 = 2080;
            v62 = (id *)&unk_21491C593;
            v63 = 2080;
            v64 = (id *)"/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
            v65 = 1024;
            v66 = 4412;
            _os_log_impl(&dword_2148C7000, v48, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }

        }
        else
        {
          if (!objc_msgSend(v9, "isGroupComponent"))
            goto LABEL_49;
          objc_msgSend(v10, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CatacombGroup"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", objc_msgSend(v9, "group"), 8);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v27, "isEqualToData:", v28);

          if ((v29 & 1) != 0)
            goto LABEL_49;
          if (__osLog)
            v30 = __osLog;
          else
            v30 = MEMORY[0x24BDACB70];
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            *(_QWORD *)&buf[4] = "isEqualGroup";
            v59 = 2048;
            v60 = 0;
            v61 = 2080;
            v62 = (id *)&unk_21491C593;
            v63 = 2080;
            v64 = (id *)"/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
            v65 = 1024;
            v66 = 4419;
            _os_log_impl(&dword_2148C7000, v30, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
        }
        goto LABEL_36;
      }
      if (__osLog)
        v46 = __osLog;
      else
        v46 = MEMORY[0x24BDACB70];
      if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
LABEL_83:
        v14 = 0;
        v50 = 0;
LABEL_36:
        v32 = 269;
        goto LABEL_37;
      }
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "component.userID == [unarchiver decodeInt32ForKey:kCatacombUserIDKey]";
      v59 = 2048;
      v60 = 0;
      v61 = 2080;
      v62 = (id *)&unk_21491C593;
      v63 = 2080;
      v64 = (id *)"/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v65 = 1024;
      v66 = 4359;
    }
    else
    {
      if (__osLog)
        v46 = __osLog;
      else
        v46 = MEMORY[0x24BDACB70];
      if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        goto LABEL_83;
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "[self catacombVersion] == [unarchiver decodeInt32ForKey:kCatacombVersionKey]";
      v59 = 2048;
      v60 = 0;
      v61 = 2080;
      v62 = (id *)&unk_21491C593;
      v63 = 2080;
      v64 = (id *)"/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v65 = 1024;
      v66 = 4358;
    }
    _os_log_impl(&dword_2148C7000, v46, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_83;
  }
  if (__osLog)
    v45 = __osLog;
  else
    v45 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "unarchiver";
    v59 = 2048;
    v60 = 0;
    v61 = 2080;
    v62 = (id *)&unk_21491C593;
    v63 = 2080;
    v64 = (id *)"/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v65 = 1024;
    v66 = 4355;
LABEL_70:
    _os_log_impl(&dword_2148C7000, v45, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_71:
  v14 = 0;
  v50 = 0;
  v32 = 258;
LABEL_37:
  if (__osLogTrace)
    v33 = __osLogTrace;
  else
    v33 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v32;
    _os_log_impl(&dword_2148C7000, v33, OS_LOG_TYPE_ERROR, "unarchiveCatacombDataForComponent:fromUnarchiver:secureData:identities: -> %d\n", buf, 8u);
  }
LABEL_59:

  return v32;
}

- (int)saveCatacomb
{
  NSObject *v3;
  uint8_t v5[16];

  if (__osLogTrace)
    v3 = __osLogTrace;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2148C7000, v3, OS_LOG_TYPE_DEBUG, "saveCatacomb --> saveCatacombForComponents:\n", v5, 2u);
  }
  return -[BiometricKitXPCServer saveCatacombForComponents:](self, "saveCatacombForComponents:", 0);
}

- (int)saveCatacombForComponents:(id)a3
{
  char *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  NSRecursiveLock *catacombLock;
  void *v19;
  void *v20;
  int v21;
  int v22;
  NSObject *v23;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  char *v31;
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  char *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)a3;
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v34 = v4;
    v35 = 2114;
    v36 = v4;
    _os_log_impl(&dword_2148C7000, v6, OS_LOG_TYPE_DEFAULT, "saveCatacombForComponents: %p(%{public}@)\n", buf, 0x16u);
  }
  v7 = (void *)os_transaction_create();
  v8 = (void *)MEMORY[0x2199D8AE0](-[NSMutableArray lock](self->_cachedIdentities, "lock"));
  if (isEphemeralMultiUser())
  {
    if (__osLog)
      v27 = __osLog;
    else
      v27 = v5;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v34 = "!isEphemeralMultiUser()";
      v35 = 2048;
      v36 = 0;
      v37 = 2080;
      v38 = &unk_21491C593;
      v39 = 2080;
      v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v41 = 1024;
      v42 = 4468;
      _os_log_impl(&dword_2148C7000, v27, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v11 = 0;
    v9 = 257;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_saveTemplateListAfterTemplateUpdate, 0);
    -[BiometricOperation setActive:](self->_runningBioOp, "setActive:", 0);
    -[BiometricKitXPCServer cacheCatacombInfo](self, "cacheCatacombInfo");
    v32 = 0;
    v9 = -[BiometricKitXPCServer getCatacombSaveListForComponents:list:](self, "getCatacombSaveListForComponents:list:", v4, &v32);
    v10 = v32;
    v11 = v10;
    if (v9)
    {
      if (__osLog)
        v28 = __osLog;
      else
        v28 = v5;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v34 = "err == 0 ";
        v35 = 2048;
        v36 = (char *)v9;
        v37 = 2080;
        v38 = &unk_21491C593;
        v39 = 2080;
        v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v41 = 1024;
        v42 = 4478;
        _os_log_impl(&dword_2148C7000, v28, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    else
    {
      if (!objc_msgSend(v10, "count"))
      {
        v9 = 0;
        goto LABEL_23;
      }
      v29 = v8;
      v30 = v7;
      v31 = v4;
      v12 = 0;
      while (1)
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1618]), "initRequiringSecureCoding:", 1);
        if (!v14)
        {
          v5 = MEMORY[0x24BDACB70];
          if (__osLog)
            v25 = __osLog;
          else
            v25 = MEMORY[0x24BDACB70];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v34 = "archiver";
            v35 = 2048;
            v36 = 0;
            v37 = 2080;
            v38 = &unk_21491C593;
            v39 = 2080;
            v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
            v41 = 1024;
            v42 = 4486;
            _os_log_impl(&dword_2148C7000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
          v9 = 261;
          goto LABEL_56;
        }
        v15 = -[BiometricKitXPCServer archiveCatacombDataForComponent:toArchiver:](self, "archiveCatacombDataForComponent:toArchiver:", v13, v14);
        if (v15)
          break;
        objc_msgSend(v14, "finishEncoding");
        if (isInternalBuild())
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Saving Catacomb file, component = %@"), v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "encodedData");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[BiometricKitXPCServer logCatacombInfo:data:](self, "logCatacombInfo:data:", v16, v17);

        }
        catacombLock = self->_catacombLock;
        objc_msgSend(v14, "encodedData");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[BiometricKitXPCServer catacombFileNameForComponent:](self, "catacombFileNameForComponent:", v13);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[NSRecursiveLock writeData:toFile:](catacombLock, "writeData:toFile:", v19, v20);

        if (v9)
        {
          v5 = MEMORY[0x24BDACB70];
          if (__osLog)
            v26 = __osLog;
          else
            v26 = MEMORY[0x24BDACB70];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v34 = "err == 0 ";
            v35 = 2048;
            v36 = (char *)v9;
            v37 = 2080;
            v38 = &unk_21491C593;
            v39 = 2080;
            v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
            v41 = 1024;
            v42 = 4502;
            goto LABEL_55;
          }
          goto LABEL_56;
        }
        if (v12 == objc_msgSend(v11, "count") - 1)
        {
          v21 = -[NSRecursiveLock commitWrite](self->_catacombLock, "commitWrite");
          if (v21)
          {
            v9 = v21;
            v5 = MEMORY[0x24BDACB70];
            if (__osLog)
              v26 = __osLog;
            else
              v26 = MEMORY[0x24BDACB70];
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              v34 = "err == 0 ";
              v35 = 2048;
              v36 = (char *)v9;
              v37 = 2080;
              v38 = &unk_21491C593;
              v39 = 2080;
              v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
              v41 = 1024;
              v42 = 4508;
              goto LABEL_55;
            }
            goto LABEL_56;
          }
        }
        v22 = -[BiometricKitXPCServer performConfirmSaveCatacombCommand:](self, "performConfirmSaveCatacombCommand:", v13);
        if (v22)
        {
          v9 = v22;
          v5 = MEMORY[0x24BDACB70];
          if (__osLog)
            v26 = __osLog;
          else
            v26 = MEMORY[0x24BDACB70];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v34 = "err == 0 ";
            v35 = 2048;
            v36 = (char *)v9;
            v37 = 2080;
            v38 = &unk_21491C593;
            v39 = 2080;
            v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
            v41 = 1024;
            v42 = 4513;
            goto LABEL_55;
          }
          goto LABEL_56;
        }
        if (objc_msgSend(v13, "isUserComponent"))
        {
          -[BiometricKitXPCServer logCatacombUUIDForUser:catacombUUID:](self, "logCatacombUUIDForUser:catacombUUID:", objc_msgSend(v13, "userID"), 0);
          -[BiometricKitXPCServer logCatacombHashForUser:catacombHash:](self, "logCatacombHashForUser:catacombHash:", objc_msgSend(v13, "userID"), 0);
        }

        if (objc_msgSend(v11, "count") <= (unint64_t)++v12)
        {
          v9 = 0;
          v7 = v30;
          v4 = v31;
          v5 = MEMORY[0x24BDACB70];
          v8 = v29;
          goto LABEL_23;
        }
      }
      v9 = v15;
      v5 = MEMORY[0x24BDACB70];
      if (__osLog)
        v26 = __osLog;
      else
        v26 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v34 = "err == 0 ";
        v35 = 2048;
        v36 = (char *)v9;
        v37 = 2080;
        v38 = &unk_21491C593;
        v39 = 2080;
        v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v41 = 1024;
        v42 = 4490;
LABEL_55:
        _os_log_impl(&dword_2148C7000, v26, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
LABEL_56:
      v7 = v30;
      v4 = v31;
      v8 = v29;

    }
    if (v9 == 269)
    {
      -[BiometricKitXPCServer clearTemplateList](self, "clearTemplateList");
      -[NSRecursiveLock deleteAll](self->_catacombLock, "deleteAll");
      v9 = 269;
    }
  }
LABEL_23:

  objc_autoreleasePoolPop(v8);
  -[NSMutableArray unlock](self->_cachedIdentities, "unlock");
  if (__osLogTrace)
    v23 = __osLogTrace;
  else
    v23 = v5;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v34) = v9;
    _os_log_impl(&dword_2148C7000, v23, OS_LOG_TYPE_DEFAULT, "saveCatacombForComponents -> %d\n", buf, 8u);
  }

  return v9;
}

- (int)saveCatacombForIdentity:(id)a3
{
  char *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)a3;
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v4;
    _os_log_impl(&dword_2148C7000, v6, OS_LOG_TYPE_DEBUG, "saveCatacombForIdentity: %@\n", buf, 0xCu);
  }
  if (v4)
  {
    -[BiometricKitXPCServer catacombComponentForIdentity:](self, "catacombComponentForIdentity:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[BiometricKitXPCServer saveCatacombForComponents:](self, "saveCatacombForComponents:", v8);

    if (!v9)
    {
      if (__osLogTrace)
        v10 = __osLogTrace;
      else
        v10 = v5;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v17) = 0;
        _os_log_impl(&dword_2148C7000, v10, OS_LOG_TYPE_DEBUG, "saveCatacombForIdentity: -> %d\n", buf, 8u);
      }
      v9 = 0;
      goto LABEL_14;
    }
    if (__osLog)
      v13 = __osLog;
    else
      v13 = v5;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v17 = "err == 0 ";
      v18 = 2048;
      v19 = v9;
      v20 = 2080;
      v21 = &unk_21491C593;
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v24 = 1024;
      v25 = 4552;
      _os_log_impl(&dword_2148C7000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    if (__osLog)
      v12 = __osLog;
    else
      v12 = v5;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v17 = "identity";
      v18 = 2048;
      v19 = 0;
      v20 = 2080;
      v21 = &unk_21491C593;
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v24 = 1024;
      v25 = 4549;
      _os_log_impl(&dword_2148C7000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v9 = 258;
  }
  if (__osLogTrace)
    v14 = __osLogTrace;
  else
    v14 = v5;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v17) = v9;
    _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "saveCatacombForIdentity: -> %d\n", buf, 8u);
  }
LABEL_14:

  return v9;
}

- (int)loadCatacomb
{
  NSObject *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  char v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  NSObject *v29;
  int v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint8_t v45[128];
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  int v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  if (__osLogTrace)
    v3 = __osLogTrace;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2148C7000, v3, OS_LOG_TYPE_DEFAULT, "loadCatacomb\n", buf, 2u);
  }
  -[NSMutableArray lock](self->_cachedIdentities, "lock");
  if (!-[BiometricKitXPCServer supportsRemovableAccessories](self, "supportsRemovableAccessories"))
    -[BiometricKitXPCServer cacheAccessories](self, "cacheAccessories");
  -[BiometricKitXPCServer clearTemplateList](self, "clearTemplateList");
  v4 = -[BiometricKitXPCServer readCatacombState](self, "readCatacombState");
  if (v4)
  {
    v9 = v4;
    if (__osLog)
      v35 = __osLog;
    else
      v35 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      goto LABEL_68;
    *(_DWORD *)buf = 136316162;
    v47 = "err == 0 ";
    v48 = 2048;
    v49 = v9;
    v50 = 2080;
    v51 = &unk_21491C593;
    v52 = 2080;
    v53 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v54 = 1024;
    v55 = 4586;
    goto LABEL_67;
  }
  if ((isEphemeralMultiUser() & 1) != 0)
    goto LABEL_13;
  if (isInternalBuild())
  {
    -[NSRecursiveLock content](self->_catacombLock, "content");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ - BKCatacomb::content(), count = %lu"), v7, objc_msgSend(v5, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BiometricKitXPCServer writeStringToPersistentLog:](self, "writeStringToPersistentLog:", v8);

  }
  if ((-[BKCatacomb stateOfMasterComponent](self->_catacomb, "stateOfMasterComponent") & 1) == 0)
  {
LABEL_13:
    v9 = 0;
    v10 = 1;
LABEL_14:
    -[BiometricKitXPCServer performNoCatacombCommand:](self, "performNoCatacombCommand:", 0xFFFFFFFFLL);
    -[BiometricKitXPCServer readCatacombState](self, "readCatacombState");
    if ((v10 & 1) == 0
      && (-[CatacombStateCache sendAutoBugCaptureEvent:](self->_catacombStateCache, "sendAutoBugCaptureEvent:", 4098) & 1) == 0)
    {
      v11 = (__osLog ? __osLog : MEMORY[0x24BDACB70]);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v47 = "abcResult";
        v48 = 2048;
        v49 = 0;
        v50 = 2080;
        v51 = &unk_21491C593;
        v52 = 2080;
        v53 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v54 = 1024;
        v55 = 4682;
        _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    goto LABEL_56;
  }
  +[CatacombComponent masterComponent](CatacombComponent, "masterComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[BiometricKitXPCServer loadCatacombForComponent:](self, "loadCatacombForComponent:", v12);

  if (v9)
  {
    if (__osLog)
      v35 = __osLog;
    else
      v35 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      goto LABEL_68;
    *(_DWORD *)buf = 136316162;
    v47 = "err == 0 ";
    v48 = 2048;
    v49 = v9;
    v50 = 2080;
    v51 = &unk_21491C593;
    v52 = 2080;
    v53 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v54 = 1024;
    v55 = 4601;
    goto LABEL_67;
  }
  v13 = -[BiometricKitXPCServer readCatacombState](self, "readCatacombState");
  if (v13)
  {
    v9 = v13;
    if (__osLog)
      v35 = __osLog;
    else
      v35 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      goto LABEL_68;
    *(_DWORD *)buf = 136316162;
    v47 = "err == 0 ";
    v48 = 2048;
    v49 = v9;
    v50 = 2080;
    v51 = &unk_21491C593;
    v52 = 2080;
    v53 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v54 = 1024;
    v55 = 4605;
LABEL_67:
    _os_log_impl(&dword_2148C7000, v35, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_68:
    -[BiometricKitXPCServer clearTemplateList](self, "clearTemplateList");
    if (v9 == 269)
    {
      -[NSRecursiveLock deleteAll](self->_catacombLock, "deleteAll");
      v10 = 0;
      v9 = 269;
    }
    else
    {
      v10 = 0;
    }
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[BKCatacomb cachedUserComponents](self->_catacomb, "cachedUserComponents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v41 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        if ((-[BKCatacomb stateOfComponent:](self->_catacomb, "stateOfComponent:", v20) & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v20, "userID"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v21);

        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v17);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v22 = v14;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v37;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v37 != v25)
          objc_enumerationMutation(v22);
        v27 = objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v26), "unsignedIntValue");
        v28 = -[BiometricKitXPCServer loadCatacombForUser:](self, "loadCatacombForUser:", v27);
        if (__osLog)
          v29 = __osLog;
        else
          v29 = MEMORY[0x24BDACB70];
        if (v28)
        {
          v30 = v28;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v47 = "tempErr == 0 ";
            v48 = 2048;
            v49 = v30;
            v50 = 2080;
            v51 = &unk_21491C593;
            v52 = 2080;
            v53 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
            v54 = 1024;
            v55 = 4622;
            _os_log_impl(&dword_2148C7000, v29, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
          -[BiometricKitXPCServer performNoCatacombCommand:](self, "performNoCatacombCommand:", v27);
          -[BiometricKitXPCServer readCatacombState](self, "readCatacombState");
          if ((-[CatacombStateCache sendAutoBugCaptureEvent:](self->_catacombStateCache, "sendAutoBugCaptureEvent:", 4098) & 1) == 0)
          {
            v31 = (__osLog ? __osLog : MEMORY[0x24BDACB70]);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              v47 = "abcResult";
              v48 = 2048;
              v49 = 0;
              v50 = 2080;
              v51 = &unk_21491C593;
              v52 = 2080;
              v53 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
              v54 = 1024;
              v55 = 4639;
              _os_log_impl(&dword_2148C7000, v31, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
            }
          }
        }
        else
        {
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v47) = v27;
            _os_log_impl(&dword_2148C7000, v29, OS_LOG_TYPE_DEFAULT, "loadCatacomb loaded user: %u\n", buf, 8u);
          }
          -[BiometricKitXPCServer syncTemplateListForUser:](self, "syncTemplateListForUser:", v27);
        }
        ++v26;
      }
      while (v24 != v26);
      v32 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      v24 = v32;
    }
    while (v32);
  }

  -[BiometricKitXPCServer updatePropertiesOfIdentities](self, "updatePropertiesOfIdentities");
  self->_userListChangeDetected = 1;
  -[BiometricKitXPCServer validateAllUsers](self, "validateAllUsers");
  -[BiometricKitXPCServer deleteUnusedCatacombFiles](self, "deleteUnusedCatacombFiles");

  v9 = 0;
LABEL_56:
  -[BiometricKitXPCServer setCatacombRestored:](self, "setCatacombRestored:", 1);
  -[NSMutableArray unlock](self->_cachedIdentities, "unlock");
  if (__osLogTrace)
    v33 = __osLogTrace;
  else
    v33 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v47) = v9;
    _os_log_impl(&dword_2148C7000, v33, OS_LOG_TYPE_DEFAULT, "loadCatacomb -> %d\n", buf, 8u);
  }
  return v9;
}

- (int)loadCatacombForUser:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v3 = *(_QWORD *)&a3;
  v38 = *MEMORY[0x24BDAC8D0];
  if (__osLogTrace)
    v5 = __osLogTrace;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v29) = v3;
    _os_log_impl(&dword_2148C7000, v5, OS_LOG_TYPE_DEFAULT, "loadCatacombForUser: %u\n", buf, 8u);
  }
  -[NSMutableArray lock](self->_cachedIdentities, "lock");
  +[CatacombComponent componentForUserID:](CatacombComponent, "componentForUserID:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BiometricKitXPCServer loadCatacombForComponent:](self, "loadCatacombForComponent:", v6);

  if (v7)
  {
    if (__osLog)
      v21 = __osLog;
    else
      v21 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v29 = "err == 0 ";
      v30 = 2048;
      v31 = v7;
      v32 = 2080;
      v33 = &unk_21491C593;
      v34 = 2080;
      v35 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v36 = 1024;
      v37 = 4711;
      _os_log_impl(&dword_2148C7000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[BKCatacomb cachedGroupComponentsForUser:](self->_catacomb, "cachedGroupComponentsForUser:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v9)
    {
      v11 = v9;
      v12 = *(_QWORD *)v24;
      *(_QWORD *)&v10 = 136316162;
      v22 = v10;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v8);
          v14 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v13);
          if ((-[BKCatacomb stateOfComponent:](self->_catacomb, "stateOfComponent:", v14, v22) & 1) != 0)
          {
            v15 = -[BiometricKitXPCServer loadCatacombForComponent:](self, "loadCatacombForComponent:", v14);
            if (v15)
            {
              v16 = v15;
              v17 = (__osLog ? __osLog : MEMORY[0x24BDACB70]);
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v22;
                v29 = "err == 0 ";
                v30 = 2048;
                v31 = v16;
                v32 = 2080;
                v33 = &unk_21491C593;
                v34 = 2080;
                v35 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
                v36 = 1024;
                v37 = 4717;
                _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
              }
            }
          }
          ++v13;
        }
        while (v11 != v13);
        v18 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        v11 = v18;
      }
      while (v18);
    }

    -[BiometricKitXPCServer logCatacombUUIDForUser:catacombUUID:](self, "logCatacombUUIDForUser:catacombUUID:", v3, 0);
    -[BiometricKitXPCServer logCatacombHashForUser:catacombHash:](self, "logCatacombHashForUser:catacombHash:", v3, 0);
    v7 = 0;
  }
  -[NSMutableArray unlock](self->_cachedIdentities, "unlock");
  if (__osLogTrace)
    v19 = __osLogTrace;
  else
    v19 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v29) = v7;
    _os_log_impl(&dword_2148C7000, v19, OS_LOG_TYPE_DEFAULT, "loadCatacombForUser: -> %d\n", buf, 8u);
  }
  return v7;
}

- (int)loadCatacombForComponent:(id)a3
{
  char *v4;
  NSObject *v5;
  char v6;
  NSRecursiveLock *catacombLock;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  int v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  char v24;
  NSRecursiveLock *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  int v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)a3;
  if (__osLogTrace)
    v5 = __osLogTrace;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v4;
    _os_log_impl(&dword_2148C7000, v5, OS_LOG_TYPE_DEFAULT, "loadCatacombForComponent: %@\n", buf, 0xCu);
  }
  if (!v4)
  {
    if (__osLog)
      v31 = __osLog;
    else
      v31 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v45 = "component";
      v46 = 2048;
      v47 = 0;
      v48 = 2080;
      v49 = &unk_21491C593;
      v50 = 2080;
      v51 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v52 = 1024;
      v53 = 4751;
      _os_log_impl(&dword_2148C7000, v31, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v10 = 0;
    v20 = 0;
    v37 = 0;
    v38 = 0;
    v18 = 0;
    v9 = 258;
    goto LABEL_41;
  }
  v6 = -[BKCatacomb stateOfComponent:](self->_catacomb, "stateOfComponent:", v4);
  if (objc_msgSend(v4, "isUserComponent"))
    -[BiometricKitXPCServer clearTemplateListForUser:](self, "clearTemplateListForUser:", objc_msgSend(v4, "userID"));
  if ((v6 & 1) == 0)
  {
    if (__osLog)
      v32 = __osLog;
    else
      v32 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v45 = "catacombState & (1 << 0)";
      v46 = 2048;
      v47 = 0;
      v48 = 2080;
      v49 = &unk_21491C593;
      v50 = 2080;
      v51 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v52 = 1024;
      v53 = 4763;
      _os_log_impl(&dword_2148C7000, v32, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v10 = 0;
    v20 = 0;
    v37 = 0;
    v38 = 0;
    v18 = 0;
    v9 = 257;
    goto LABEL_41;
  }
  catacombLock = self->_catacombLock;
  v42 = 0;
  -[BiometricKitXPCServer catacombFileNameForComponent:](self, "catacombFileNameForComponent:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  v9 = -[NSRecursiveLock readData:fromFile:logString:](catacombLock, "readData:fromFile:logString:", &v42, v8, &v41);
  v10 = v42;
  v37 = v41;

  if (isInternalBuild())
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BiometricKitXPCServer catacombFileNameForComponent:](self, "catacombFileNameForComponent:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ - BKCatacomb::readData(file = '%@'), err = %d (%@)"), v12, v13, v9, v37);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[BiometricKitXPCServer writeStringToPersistentLog:](self, "writeStringToPersistentLog:", v14);

  }
  if ((_DWORD)v9)
  {
    if (__osLog)
      v33 = __osLog;
    else
      v33 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v45 = "err == 0 ";
      v46 = 2048;
      v47 = (int)v9;
      v48 = 2080;
      v49 = &unk_21491C593;
      v50 = 2080;
      v51 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v52 = 1024;
      v53 = 4770;
      _os_log_impl(&dword_2148C7000, v33, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v20 = 0;
    v38 = 0;
    v18 = 0;
    goto LABEL_41;
  }
  if (!v10)
  {
    if (__osLog)
      v34 = __osLog;
    else
      v34 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v45 = "catacombData";
      v46 = 2048;
      v47 = 0;
      v48 = 2080;
      v49 = &unk_21491C593;
      v50 = 2080;
      v51 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v52 = 1024;
      v53 = 4771;
      _os_log_impl(&dword_2148C7000, v34, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v10 = 0;
    v20 = 0;
    v38 = 0;
    v18 = 0;
    v9 = 261;
    goto LABEL_41;
  }
  if (isInternalBuild())
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Loading Catacomb file, component = %@"), v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[BiometricKitXPCServer logCatacombInfo:data:](self, "logCatacombInfo:data:", v15, v10);

  }
  if (objc_msgSend(v10, "length"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v10, 0);
    v17 = v16;
    if (v16)
    {
      objc_msgSend(v16, "setDecodingFailurePolicy:", 0);
      v39 = 0;
      v40 = 0;
      v9 = -[BiometricKitXPCServer unarchiveCatacombDataForComponent:fromUnarchiver:secureData:identities:](self, "unarchiveCatacombDataForComponent:fromUnarchiver:secureData:identities:", v4, v17, &v40, &v39);
      v38 = v40;
      v18 = v39;
      if ((_DWORD)v9)
      {
        if (__osLog)
          v36 = __osLog;
        else
          v36 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v45 = "err == 0 ";
          v46 = 2048;
          v47 = (int)v9;
          v48 = 2080;
          v49 = &unk_21491C593;
          v50 = 2080;
          v51 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
          v52 = 1024;
          v53 = 4788;
          _os_log_impl(&dword_2148C7000, v36, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v19 = 4;
      }
      else
      {
        v19 = 0;
      }
      v20 = v17;
    }
    else
    {
      if (__osLog)
        v35 = __osLog;
      else
        v35 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v45 = "unarchiver";
        v46 = 2048;
        v47 = 0;
        v48 = 2080;
        v49 = &unk_21491C593;
        v50 = 2080;
        v51 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v52 = 1024;
        v53 = 4783;
        _os_log_impl(&dword_2148C7000, v35, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v18 = 0;
      v38 = 0;
      v20 = 0;
      v9 = 261;
      v19 = 4;
    }
    objc_msgSend(v20, "finishDecoding");
    if (v19)
    {
LABEL_40:
      if (!(_DWORD)v9)
        goto LABEL_51;
      goto LABEL_41;
    }
  }
  else
  {
    v18 = 0;
    v38 = 0;
    v20 = 0;
    v9 = 0;
  }
  if ((v6 & 2) != 0)
  {
LABEL_38:
    if (v18)
      -[BiometricKitXPCServer addIdentityObjects:](self, "addIdentityObjects:", v18);
    goto LABEL_40;
  }
  if (!objc_msgSend(v38, "length"))
  {
    if ((objc_msgSend(v4, "isMasterComponent") & 1) != 0 || objc_msgSend(v4, "isUserComponent"))
    {
      v9 = -[BiometricKitXPCServer performNoCatacombCommand:](self, "performNoCatacombCommand:", objc_msgSend(v4, "userID"));
      if ((_DWORD)v9)
      {
        if (__osLog)
          v22 = __osLog;
        else
          v22 = MEMORY[0x24BDACB70];
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          goto LABEL_41;
        *(_DWORD *)buf = 136316162;
        v45 = "err == 0 ";
        v46 = 2048;
        v47 = (int)v9;
        v48 = 2080;
        v49 = &unk_21491C593;
        v50 = 2080;
        v51 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v52 = 1024;
        v53 = 4828;
        goto LABEL_98;
      }
    }
    goto LABEL_37;
  }
  if (isInternalBuild())
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Loading secure data, component = %@"), v4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[BiometricKitXPCServer logCatacombInfo:data:](self, "logCatacombInfo:data:", v21, v38);

  }
  v9 = -[BiometricKitXPCServer performLoadCatacombCommand:inData:](self, "performLoadCatacombCommand:inData:", v4, v38);
  if (!(_DWORD)v9)
  {
LABEL_37:
    -[BiometricKitXPCServer readCatacombState](self, "readCatacombState");
    goto LABEL_38;
  }
  if (__osLog)
    v22 = __osLog;
  else
    v22 = MEMORY[0x24BDACB70];
  if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    goto LABEL_41;
  *(_DWORD *)buf = 136316162;
  v45 = "err == 0 ";
  v46 = 2048;
  v47 = (int)v9;
  v48 = 2080;
  v49 = &unk_21491C593;
  v50 = 2080;
  v51 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
  v52 = 1024;
  v53 = 4821;
LABEL_98:
  _os_log_impl(&dword_2148C7000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_41:
  if (isInternalBuild())
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Loading catacomb failed, err = %d (0x%x)"), v9, v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[BiometricKitXPCServer writeStringToPersistentLog:](self, "writeStringToPersistentLog:", v23);

  }
  if (objc_msgSend(v4, "isUserComponent"))
    -[BiometricKitXPCServer clearTemplateListForUser:](self, "clearTemplateListForUser:", objc_msgSend(v4, "userID"));
  if ((_DWORD)v9 == 269)
  {
    v24 = objc_msgSend(v4, "isMasterComponent");
    v25 = self->_catacombLock;
    if ((v24 & 1) != 0)
    {
      -[NSRecursiveLock deleteAll](self->_catacombLock, "deleteAll");
    }
    else
    {
      -[BiometricKitXPCServer catacombFileNameForComponent:](self, "catacombFileNameForComponent:", v4);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSRecursiveLock deleteFile:](v25, "deleteFile:", v26);

      if (objc_msgSend(v4, "isUserComponent"))
      {
        -[BiometricKitXPCServer removeUser:](self, "removeUser:", objc_msgSend(v4, "userID"));
        +[CatacombComponent masterComponent](CatacombComponent, "masterComponent");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v27;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v43, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[BiometricKitXPCServer saveCatacombForComponents:](self, "saveCatacombForComponents:", v28);

      }
    }
    LODWORD(v9) = 269;
  }
LABEL_51:
  if (__osLogTrace)
    v29 = __osLogTrace;
  else
    v29 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v45) = v9;
    _os_log_impl(&dword_2148C7000, v29, OS_LOG_TYPE_DEFAULT, "loadCatacombForComponent: -> %d\n", buf, 8u);
  }

  return v9;
}

- (BOOL)supportsRemovableAccessories
{
  return 0;
}

- (int)cacheAccessories
{
  NSObject *v3;
  int v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  OS_dispatch_queue *v26;
  void *v27;
  OS_dispatch_queue *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  int v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  OS_dispatch_queue *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  uint64_t v46;
  NSObject *v47;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  int v52;
  void *v53;
  void *v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE buf[12];
  __int16 v72;
  id v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  const char *v77;
  __int16 v78;
  int v79;
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  if (__osLogTrace)
    v3 = __osLogTrace;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2148C7000, v3, OS_LOG_TYPE_DEBUG, "cacheAccessories\n", buf, 2u);
  }
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[BiometricKitXPCServer supportsRemovableAccessories](self, "supportsRemovableAccessories"))
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 44);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v55 = objc_retainAutorelease(v6);
      v7 = objc_msgSend(v55, "mutableBytes");
      *(_DWORD *)v7 = 1;
      uuid_clear((unsigned __int8 *)(v7 + 4));
      *(_DWORD *)(v7 + 20) = 1;
      uuid_clear((unsigned __int8 *)(v7 + 24));
      *(_DWORD *)(v7 + 40) = 6;
      goto LABEL_16;
    }
    if (__osLog)
      v50 = __osLog;
    else
      v50 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
LABEL_105:
      v55 = 0;
      v4 = 260;
LABEL_106:
      if (__osLogTrace)
        v51 = __osLogTrace;
      else
        v51 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v4;
        _os_log_impl(&dword_2148C7000, v51, OS_LOG_TYPE_ERROR, "cacheAccessories -> %d\n", buf, 8u);
      }
      goto LABEL_87;
    }
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "buffer";
    v72 = 2048;
    v73 = 0;
    v74 = 2080;
    v75 = &unk_21491C593;
    v76 = 2080;
    v77 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v78 = 1024;
    v79 = 5357;
LABEL_104:
    _os_log_impl(&dword_2148C7000, v50, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_105;
  }
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 264);
  v55 = (id)objc_claimAutoreleasedReturnValue();
  if (!v55)
  {
    if (__osLog)
      v50 = __osLog;
    else
      v50 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      goto LABEL_105;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "buffer";
    v72 = 2048;
    v73 = 0;
    v74 = 2080;
    v75 = &unk_21491C593;
    v76 = 2080;
    v77 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v78 = 1024;
    v79 = 5348;
    goto LABEL_104;
  }
  v4 = -[BiometricKitXPCServer performGetBioDeviceListCommand:](self, "performGetBioDeviceListCommand:");
  if (v4)
  {
    if (__osLog)
      v5 = __osLog;
    else
      v5 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "err == 0 ";
      v72 = 2048;
      v73 = (id)v4;
      v74 = 2080;
      v75 = &unk_21491C593;
      v76 = 2080;
      v77 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v78 = 1024;
      v79 = 5352;
      _os_log_impl(&dword_2148C7000, v5, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_106;
  }
LABEL_16:
  if (__ROR8__(0x2E8BA2E8BA2E8BA3 * objc_msgSend(v55, "length"), 2) >= 0x5D1745D1745D175uLL)
  {
    if (__osLog)
      v49 = __osLog;
    else
      v49 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "buffer.length % sizeof(biodevice_info_t) == 0";
      v72 = 2048;
      v73 = 0;
      v74 = 2080;
      v75 = &unk_21491C593;
      v76 = 2080;
      v77 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v78 = 1024;
      v79 = 5365;
      _os_log_impl(&dword_2148C7000, v49, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v4 = 261;
    goto LABEL_106;
  }
  v8 = objc_msgSend(v55, "length");
  if (v8 >= 0x2C)
  {
    v9 = 0;
    v10 = v8 / 0x2C;
    do
    {
      v11 = objc_msgSend(objc_retainAutorelease(v55), "mutableBytes");
      v12 = objc_alloc_init(MEMORY[0x24BE0CE68]);
      v13 = objc_alloc_init(MEMORY[0x24BE0CE70]);
      objc_msgSend(v13, "setType:", *(unsigned int *)(v11 + v9 + 20));
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", v11 + v9 + 24);
      objc_msgSend(v13, "setUuid:", v14);

      if (objc_msgSend(v13, "type") == 1)
      {
        objc_msgSend(v13, "setName:", CFSTR("Builtin"));
      }
      else
      {
        v15 = objc_msgSend(v13, "type");
        v16 = (void *)MEMORY[0x24BDD17C8];
        if (v15 == 2)
        {
          objc_msgSend(v13, "uuid");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "UUIDString");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringWithFormat:", CFSTR("Trusted Accessory %@"), v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setName:", v19);

        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Type %u"), objc_msgSend(v13, "type"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setName:", v17);
        }

      }
      objc_msgSend(v12, "setType:", *(unsigned int *)(v11 + v9));
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", v11 + v9 + 4);
      objc_msgSend(v12, "setUuid:", v20);

      if (objc_msgSend(v12, "type") == 1)
      {
        objc_msgSend(v12, "setName:", CFSTR("Builtin"));
      }
      else
      {
        v21 = objc_msgSend(v12, "type");
        v22 = (void *)MEMORY[0x24BDD17C8];
        if (v21 == 2)
        {
          objc_msgSend(v12, "uuid");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "UUIDString");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stringWithFormat:", CFSTR("Trusted Accessory %@"), v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setName:", v25);

        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Type %u"), objc_msgSend(v12, "type"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setName:", v23);
        }

      }
      objc_msgSend(v12, "setGroup:", v13);
      objc_msgSend(v12, "setFlags:", *(unsigned int *)(v11 + v9 + 40));
      objc_msgSend(v54, "addObject:", v12);
      if ((objc_msgSend(v12, "flags") & 1) != 0 && (objc_msgSend(v12, "flags") & 2) != 0)
        objc_msgSend(v53, "addObject:", v12);

      v9 += 44;
      --v10;
    }
    while (v10);
  }
  v26 = self->_biometricABCDispatchQueue;
  objc_sync_enter(v26);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v28 = self->_biometricABCDispatchQueue;
  v29 = -[OS_dispatch_queue countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v65 != v30)
          objc_enumerationMutation(v28);
        v32 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        if ((objc_msgSend(v32, "flags") & 1) != 0 && (objc_msgSend(v32, "flags") & 2) != 0)
          objc_msgSend(v27, "addObject:", v32);
      }
      v29 = -[OS_dispatch_queue countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
    }
    while (v29);
  }

  v33 = objc_msgSend(v27, "isEqualToSet:", v53);
  v52 = -[OS_dispatch_queue isEqualToSet:](self->_biometricABCDispatchQueue, "isEqualToSet:", v54);
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v34 = v54;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
  if (v35)
  {
    v36 = *(_QWORD *)v61;
    do
    {
      for (j = 0; j != v35; ++j)
      {
        if (*(_QWORD *)v61 != v36)
          objc_enumerationMutation(v34);
        v38 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * j);
        if ((objc_msgSend(v38, "flags") & 1) != 0)
        {
          if ((-[OS_dispatch_queue containsObject:](self->_biometricABCDispatchQueue, "containsObject:", v38) & 1) == 0)
            -[BiometricKitXPCServer accessoryAdded:](self, "accessoryAdded:", v38);
          if ((objc_msgSend(v38, "flags") & 2) != 0 && (objc_msgSend(v27, "containsObject:", v38) & 1) == 0)
          {
            -[BiometricKitXPCServer accessoryConnected:](self, "accessoryConnected:", v38);
          }
          else if ((objc_msgSend(v38, "flags") & 2) == 0 && objc_msgSend(v27, "containsObject:", v38))
          {
            -[BiometricKitXPCServer accessoryDisconnected:](self, "accessoryDisconnected:", v38);
          }
        }
      }
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
    }
    while (v35);
  }

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v39 = self->_biometricABCDispatchQueue;
  v40 = -[OS_dispatch_queue countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
  if (v40)
  {
    v41 = *(_QWORD *)v57;
    do
    {
      for (k = 0; k != v40; ++k)
      {
        if (*(_QWORD *)v57 != v41)
          objc_enumerationMutation(v39);
        v43 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * k);
        if ((objc_msgSend(v43, "flags") & 1) != 0 && (objc_msgSend(v34, "containsObject:", v43) & 1) == 0)
          -[BiometricKitXPCServer accessoryRemoved:](self, "accessoryRemoved:", v43);
      }
      v40 = -[OS_dispatch_queue countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
    }
    while (v40);
  }

  -[OS_dispatch_queue setSet:](self->_biometricABCDispatchQueue, "setSet:", v34);
  if ((v52 & v33) == 1)
    -[BiometricKitXPCServer accessoryMayHaveChanged](self, "accessoryMayHaveChanged");
  if ((v33 & 1) == 0 && LOBYTE(self->_mkbLockStatusNtfToken))
  {
    notify_set_state(HIDWORD(self->_catacombUserKeybagUUIDs), objc_msgSend(v53, "count"));
    notify_post("com.apple.BiometricKit.connectedAccessoriesChanged");
  }

  objc_sync_exit(v26);
  if (__osLog)
    v44 = __osLog;
  else
    v44 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    v45 = v44;
    v46 = objc_msgSend(v34, "count");
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v46;
    v72 = 2114;
    v73 = v34;
    _os_log_impl(&dword_2148C7000, v45, OS_LOG_TYPE_DEFAULT, "cacheAccessories accessories %lu: %{public}@\n", buf, 0x16u);

  }
  if (__osLogTrace)
    v47 = __osLogTrace;
  else
    v47 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
  {
    *(_QWORD *)buf = 67109120;
    _os_log_impl(&dword_2148C7000, v47, OS_LOG_TYPE_DEBUG, "cacheAccessories -> %d\n", buf, 8u);
  }
  v4 = 0;
LABEL_87:

  return v4;
}

- (id)getAccessoryObject:(id *)a3
{
  NSObject *v5;
  OS_dispatch_queue *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  $7287BE6C16BD8CBBAFC45DEB4D81687E *v14;
  NSObject *v15;
  NSObject *v17;
  OS_dispatch_queue *obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  $7287BE6C16BD8CBBAFC45DEB4D81687E *v25;
  __int16 v26;
  $7287BE6C16BD8CBBAFC45DEB4D81687E *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (__osLogTrace)
    v5 = __osLogTrace;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v25 = a3;
    _os_log_impl(&dword_2148C7000, v5, OS_LOG_TYPE_DEBUG, "getAccessoryObject: %p\n", buf, 0xCu);
  }
  if (a3)
  {
    obj = self->_biometricABCDispatchQueue;
    objc_sync_enter(obj);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = self->_biometricABCDispatchQueue;
    v7 = -[OS_dispatch_queue countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v10, "type") == a3->var0)
          {
            objc_msgSend(v10, "uuid");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a3->var1);
            v13 = objc_msgSend(v11, "isEqual:", v12);

            if (v13)
            {
              v14 = v10;
              goto LABEL_18;
            }
          }
        }
        v7 = -[OS_dispatch_queue countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v7)
          continue;
        break;
      }
    }
    v14 = 0;
LABEL_18:

    objc_sync_exit(obj);
  }
  else
  {
    if (__osLog)
      v17 = __osLog;
    else
      v17 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v25 = ($7287BE6C16BD8CBBAFC45DEB4D81687E *)"device";
      v26 = 2048;
      v27 = 0;
      v28 = 2080;
      v29 = &unk_21491C593;
      v30 = 2080;
      v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v32 = 1024;
      v33 = 5482;
      _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v14 = 0;
  }
  if (__osLogTrace)
    v15 = __osLogTrace;
  else
    v15 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218242;
    v25 = v14;
    v26 = 2112;
    v27 = v14;
    _os_log_impl(&dword_2148C7000, v15, OS_LOG_TYPE_DEBUG, "getAccessoryObject: -> %p(%@)\n", buf, 0x16u);
  }
  return v14;
}

- (id)pairedAccessories
{
  OS_dispatch_queue *v3;
  void *v4;

  v3 = self->_biometricABCDispatchQueue;
  objc_sync_enter(v3);
  v4 = (void *)-[OS_dispatch_queue copy](self->_biometricABCDispatchQueue, "copy");
  objc_sync_exit(v3);

  return v4;
}

- (id)connectedAccessories
{
  void *v3;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 1);
  v4 = self->_biometricABCDispatchQueue;
  objc_sync_enter(v4);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_biometricABCDispatchQueue;
  v6 = -[OS_dispatch_queue countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v9, "flags", (_QWORD)v12) & 2) != 0)
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = -[OS_dispatch_queue countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_sync_exit(v4);
  v10 = (void *)objc_msgSend(v3, "copy");

  return v10;
}

- (int)listAccessories:(id *)a3 client:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  OS_dispatch_queue *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  int v19;
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v19 = 134218242;
    v20 = (const char *)a3;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_2148C7000, v8, OS_LOG_TYPE_DEBUG, "listAccessories:client: %p %@\n", (uint8_t *)&v19, 0x16u);
  }
  if (a3)
  {
    v9 = -[BiometricKitXPCServer cacheAccessories](self, "cacheAccessories");
    if (!v9)
    {
      v10 = self->_biometricABCDispatchQueue;
      objc_sync_enter(v10);
      -[OS_dispatch_queue allObjects](self->_biometricABCDispatchQueue, "allObjects");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *a3 = (id)objc_msgSend(v11, "copy");

      objc_sync_exit(v10);
      if (__osLogTrace)
        v12 = __osLogTrace;
      else
        v12 = v7;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v13 = (const char *)*a3;
        v19 = 138412546;
        v20 = v13;
        v21 = 1024;
        LODWORD(v22) = 0;
        _os_log_impl(&dword_2148C7000, v12, OS_LOG_TYPE_DEBUG, "listAccessories:client: -> %@ %d\n", (uint8_t *)&v19, 0x12u);
      }
      v9 = 0;
      goto LABEL_14;
    }
    if (__osLog)
      v16 = __osLog;
    else
      v16 = v7;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v19 = 136316162;
      v20 = "err == 0 ";
      v21 = 2048;
      v22 = (id)v9;
      v23 = 2080;
      v24 = &unk_21491C593;
      v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v27 = 1024;
      v28 = 5581;
      _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v19, 0x30u);
    }
  }
  else
  {
    if (__osLog)
      v15 = __osLog;
    else
      v15 = v7;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v19 = 136316162;
      v20 = "accessories";
      v21 = 2048;
      v22 = 0;
      v23 = 2080;
      v24 = &unk_21491C593;
      v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v27 = 1024;
      v28 = 5577;
      _os_log_impl(&dword_2148C7000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v19, 0x30u);
    }
    v9 = 258;
  }
  if (__osLogTrace)
    v17 = __osLogTrace;
  else
    v17 = v7;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    if (a3)
      v18 = (const char *)*a3;
    else
      v18 = 0;
    v19 = 138412546;
    v20 = v18;
    v21 = 1024;
    LODWORD(v22) = v9;
    _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_ERROR, "listAccessories:client: -> %@ %d\n", (uint8_t *)&v19, 0x12u);
  }
LABEL_14:

  return v9;
}

- (int)getFreeIdentityCount:(unint64_t *)a3 forUser:(unsigned int)a4 accessoryGroup:(id)a5 client:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  _BOOL4 v14;
  int v15;
  void *v16;
  int v17;
  int v18;
  NSObject *v19;
  int v20;
  NSObject *v21;
  unint64_t v22;
  unint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  NSObject *v27;
  unsigned int v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  _BYTE v32[28];
  __int16 v33;
  int v34;
  _QWORD v35[2];
  int v36;
  uint64_t v37;

  v7 = *(_QWORD *)&a4;
  v37 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a6;
  v12 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v13 = __osLogTrace;
  else
    v13 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    v30 = (const char *)a3;
    v31 = 1024;
    *(_DWORD *)v32 = v7;
    *(_WORD *)&v32[4] = 2112;
    *(_QWORD *)&v32[6] = v10;
    *(_WORD *)&v32[14] = 2112;
    *(_QWORD *)&v32[16] = v11;
    _os_log_impl(&dword_2148C7000, v13, OS_LOG_TYPE_DEBUG, "getFreeIdentityCount:forUser:accessoryGroup:client: %p %u %@ %@\n", buf, 0x26u);
  }
  if (BYTE1(self->_mkbLockStatusNtfToken))
    kdebug_trace();
  v35[0] = 0;
  v35[1] = 0;
  v36 = 0;
  v28 = 0;
  if (!a3)
  {
    if (__osLog)
      v27 = __osLog;
    else
      v27 = v12;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v30 = "count";
      v31 = 2048;
      *(_QWORD *)v32 = 0;
      *(_WORD *)&v32[8] = 2080;
      *(_QWORD *)&v32[10] = &unk_21491C593;
      *(_WORD *)&v32[18] = 2080;
      *(_QWORD *)&v32[20] = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biomet"
                            "ricKitXPCServer.m";
      v33 = 1024;
      v34 = 5609;
      _os_log_impl(&dword_2148C7000, v27, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v18 = 258;
    goto LABEL_19;
  }
  -[BiometricKitXPCServer validateAllUsers](self, "validateAllUsers");
  v14 = -[BiometricKitXPCServer supportsRemovableAccessories](self, "supportsRemovableAccessories");
  v15 = objc_msgSend(v10, "type");
  if (v14)
  {
    LODWORD(v35[0]) = v15;
    objc_msgSend(v10, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "getUUIDBytes:", (char *)v35 + 4);

    v17 = -[BiometricKitXPCServer performGetFreeIdentityCountCommand:group:outCount:](self, "performGetFreeIdentityCountCommand:group:outCount:", v7, v35, &v28);
    if (v17)
    {
      v18 = v17;
      if (__osLog)
        v19 = __osLog;
      else
        v19 = v12;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v30 = "err == 0 ";
        v31 = 2048;
        *(_QWORD *)v32 = v18;
        *(_WORD *)&v32[8] = 2080;
        *(_QWORD *)&v32[10] = &unk_21491C593;
        *(_WORD *)&v32[18] = 2080;
        *(_QWORD *)&v32[20] = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biom"
                              "etricKitXPCServer.m";
        v33 = 1024;
        v34 = 5619;
LABEL_48:
        _os_log_impl(&dword_2148C7000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        goto LABEL_19;
      }
      goto LABEL_19;
    }
LABEL_18:
    v18 = 0;
    *a3 = v28;
    goto LABEL_19;
  }
  if (v15 != 1)
    goto LABEL_18;
  v20 = -[BiometricKitXPCServer performGetFreeIdentityCountCommand:outCount:](self, "performGetFreeIdentityCountCommand:outCount:", v7, &v28);
  if (!v20)
    goto LABEL_18;
  v18 = v20;
  if (__osLog)
    v19 = __osLog;
  else
    v19 = v12;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v30 = "err == 0 ";
    v31 = 2048;
    *(_QWORD *)v32 = v18;
    *(_WORD *)&v32[8] = 2080;
    *(_QWORD *)&v32[10] = &unk_21491C593;
    *(_WORD *)&v32[18] = 2080;
    *(_QWORD *)&v32[20] = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v33 = 1024;
    v34 = 5624;
    goto LABEL_48;
  }
LABEL_19:
  if (BYTE1(self->_mkbLockStatusNtfToken))
    kdebug_trace();
  if (__osLogTrace)
    v21 = __osLogTrace;
  else
    v21 = v12;
  if (v18)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      if (a3)
        v22 = *a3;
      else
        v22 = 0;
      *(_DWORD *)buf = 134218240;
      v30 = (const char *)v22;
      v31 = 1024;
      *(_DWORD *)v32 = v18;
      v24 = v21;
      v25 = OS_LOG_TYPE_ERROR;
LABEL_35:
      _os_log_impl(&dword_2148C7000, v24, v25, "getFreeIdentityCount:forUser:accessoryGroup:client: -> %lu %d\n", buf, 0x12u);
    }
  }
  else if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    if (a3)
      v23 = *a3;
    else
      v23 = 0;
    *(_DWORD *)buf = 134218240;
    v30 = (const char *)v23;
    v31 = 1024;
    *(_DWORD *)v32 = 0;
    v24 = v21;
    v25 = OS_LOG_TYPE_DEBUG;
    goto LABEL_35;
  }

  return v18;
}

- (int)getPreferencesValue:(id *)a3 forKey:(id)a4 withClient:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  id *v12;
  int v13;
  NSObject *v14;
  int v16;
  id *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  v9 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v10 = __osLogTrace;
  else
    v10 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v16 = 134218242;
    v17 = a3;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_2148C7000, v10, OS_LOG_TYPE_DEBUG, "getPreferencesValue:%p forKey:%@\n", (uint8_t *)&v16, 0x16u);
  }
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BE0CE58], "preferenceObjectForKey:", v7);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    if (__osLogTrace)
      v11 = __osLogTrace;
    else
      v11 = v9;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = (id *)*a3;
      v16 = 138412802;
      v17 = v12;
      v18 = 2112;
      v19 = v7;
      v20 = 1024;
      v21 = 0;
      _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_DEBUG, "getPreferencesValue:%@ forKey:%@ -> %d\n", (uint8_t *)&v16, 0x1Cu);
    }
    v13 = 0;
  }
  else
  {
    if (__osLogTrace)
      v14 = __osLogTrace;
    else
      v14 = v9;
    v13 = 258;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412802;
      v17 = 0;
      v18 = 2112;
      v19 = v7;
      v20 = 1024;
      v21 = 258;
      _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "getPreferencesValue:%@ forKey:%@ -> %d\n", (uint8_t *)&v16, 0x1Cu);
    }
  }

  return v13;
}

- (BOOL)setPreferencesValue:(id)a3 forKey:(id)a4 withClient:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  int v13;
  NSObject *v14;
  const __CFString *v15;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v11 = __osLogTrace;
  else
    v11 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v17 = 138412546;
    v18 = v7;
    v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_DEBUG, "setPreferencesValue:%@ forKey:%@\n", (uint8_t *)&v17, 0x16u);
  }
  objc_msgSend(MEMORY[0x24BE0CE58], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "setObject:forKey:", v7, v8);

  if (__osLogTrace)
    v14 = __osLogTrace;
  else
    v14 = v10;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = CFSTR("false");
    v17 = 138412802;
    v18 = v7;
    v19 = 2112;
    if (v13)
      v15 = CFSTR("true");
    v20 = v8;
    v21 = 2112;
    v22 = v15;
    _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_DEBUG, "setPreferencesValue:%@ forKey:%@ -> %@\n", (uint8_t *)&v17, 0x20u);
  }

  return v13;
}

- (int)getUserUUIDsForUIDs:(id)a3 userUUIDs:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  id v21;
  int v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  char *v30;
  int v31;
  NSObject *v32;
  NSObject *v33;
  char *v34;
  NSObject *v36;
  BiometricKitXPCServer *v37;
  id *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  _BYTE v48[18];
  __int16 v49;
  const char *v50;
  __int16 v51;
  int v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = v8;
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v46 = (const char *)v6;
    v47 = 2112;
    *(_QWORD *)v48 = v10;
    _os_log_impl(&dword_2148C7000, v9, OS_LOG_TYPE_DEBUG, "getUserUUIDsForUIDs: %p(%@)\n", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allUsers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    if (__osLog)
      v36 = __osLog;
    else
      v36 = v7;
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      goto LABEL_52;
    *(_DWORD *)buf = 136316162;
    v46 = "users";
    v47 = 2048;
    *(_QWORD *)v48 = 0;
    *(_WORD *)&v48[8] = 2080;
    *(_QWORD *)&v48[10] = &unk_21491C593;
    v49 = 2080;
    v50 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v51 = 1024;
    v52 = 5749;
    goto LABEL_51;
  }
  if (!objc_msgSend(v12, "count"))
  {
    if (__osLog)
      v36 = __osLog;
    else
      v36 = v7;
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      goto LABEL_52;
    *(_DWORD *)buf = 136316162;
    v46 = "users.count";
    v47 = 2048;
    *(_QWORD *)v48 = 0;
    *(_WORD *)&v48[8] = 2080;
    *(_QWORD *)&v48[10] = &unk_21491C593;
    v49 = 2080;
    v50 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v51 = 1024;
    v52 = 5750;
LABEL_51:
    _os_log_impl(&dword_2148C7000, v36, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_52:
    v13 = 0;
    v31 = 261;
    goto LABEL_36;
  }
  v37 = self;
  v38 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v39 = v12;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v41;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v41 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v19, "uid"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v6;
        v22 = objc_msgSend(v6, "containsObject:", v20);

        if (v22)
        {
          v23 = objc_alloc(MEMORY[0x24BDD1880]);
          objc_msgSend(v19, "alternateDSID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)objc_msgSend(v23, "initWithUUIDString:", v24);

          if (!v25)
          {
            v7 = MEMORY[0x24BDACB70];
            if (__osLog)
              v32 = __osLog;
            else
              v32 = MEMORY[0x24BDACB70];
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              v46 = "uuid";
              v47 = 2048;
              *(_QWORD *)v48 = 0;
              *(_WORD *)&v48[8] = 2080;
              *(_QWORD *)&v48[10] = &unk_21491C593;
              v49 = 2080;
              v50 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
              v51 = 1024;
              v52 = 5757;
              _os_log_impl(&dword_2148C7000, v32, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
            }

            v31 = 261;
            v12 = v39;
            v6 = v21;
            goto LABEL_36;
          }
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v19, "uid"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKey:", v25, v26);

        }
        v6 = v21;
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (v16)
        continue;
      break;
    }
  }

  if (!BYTE2(v37->_userAccountsInfo.currentAccountUserID))
    -[BiometricKitXPCServer cacheAndSetUserAccountsInfo](v37, "cacheAndSetUserAccountsInfo");
  v7 = MEMORY[0x24BDACB70];
  if (v38)
    *v38 = objc_retainAutorelease(v13);
  v27 = objc_msgSend(v13, "count");
  v12 = v39;
  if (v27 == objc_msgSend(v6, "count"))
  {
    if (__osLogTrace)
      v28 = __osLogTrace;
    else
      v28 = v7;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v29 = v28;
      objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
      v30 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v46 = v30;
      v47 = 1024;
      *(_DWORD *)v48 = 0;
      *(_WORD *)&v48[4] = 2112;
      *(_QWORD *)&v48[6] = v13;
      _os_log_impl(&dword_2148C7000, v29, OS_LOG_TYPE_DEBUG, "getUserUUIDsForUIDs(%@): -> %d, userUUIDs = %@\n", buf, 0x1Cu);

    }
    v31 = 0;
    goto LABEL_40;
  }
  v31 = 0;
LABEL_36:
  if (__osLogTrace)
    v7 = __osLogTrace;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v33 = v7;
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
    v34 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v46 = v34;
    v47 = 1024;
    *(_DWORD *)v48 = v31;
    *(_WORD *)&v48[4] = 2112;
    *(_QWORD *)&v48[6] = v13;
    _os_log_impl(&dword_2148C7000, v33, OS_LOG_TYPE_ERROR, "getUserUUIDsForUIDs(%@): -> %d, userUUIDs = %@\n", buf, 0x1Cu);

  }
LABEL_40:

  return v31;
}

- (int)getUserUUIDForUID:(unsigned int)a3 userUUID:(id *)a4
{
  uint64_t v5;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  uint8_t buf[4];
  _BYTE v24[10];
  _BYTE v25[10];
  void *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v5 = *(_QWORD *)&a3;
  v31 = *MEMORY[0x24BDAC8D0];
  v7 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v24 = v5;
    _os_log_impl(&dword_2148C7000, v8, OS_LOG_TYPE_DEBUG, "getUserUUIDForUID: %d\n", buf, 8u);
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v5);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if ((_DWORD)v5 == -1)
  {
    if (__osLog)
      v19 = __osLog;
    else
      v19 = v7;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v24 = "userID != 4294967295U";
      *(_WORD *)&v24[8] = 2048;
      *(_QWORD *)v25 = 0;
      *(_WORD *)&v25[8] = 2080;
      v26 = &unk_21491C593;
      v27 = 2080;
      v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v29 = 1024;
      v30 = 5797;
      _os_log_impl(&dword_2148C7000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v13 = 0;
    v12 = 258;
  }
  else
  {
    v22 = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v12 = -[BiometricKitXPCServer getUserUUIDsForUIDs:userUUIDs:](self, "getUserUUIDsForUIDs:userUUIDs:", v11, &v21);
    v13 = v21;

    if (v12)
    {
      if (__osLog)
        v20 = __osLog;
      else
        v20 = v7;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v24 = "err == 0 ";
        *(_WORD *)&v24[8] = 2048;
        *(_QWORD *)v25 = v12;
        *(_WORD *)&v25[8] = 2080;
        v26 = &unk_21491C593;
        v27 = 2080;
        v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v29 = 1024;
        v30 = 5800;
        _os_log_impl(&dword_2148C7000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    else
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (a4)
        *a4 = objc_retainAutorelease(v14);
      if (v15)
      {
        if (__osLogTrace)
          v16 = __osLogTrace;
        else
          v16 = v7;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v24 = v5;
          *(_WORD *)&v24[4] = 1024;
          *(_DWORD *)&v24[6] = 0;
          *(_WORD *)v25 = 2112;
          *(_QWORD *)&v25[2] = v15;
          _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_DEBUG, "getUserUUIDForUID(%d): -> %d, userUUID = %@\n", buf, 0x18u);
        }
        v12 = 0;
        goto LABEL_24;
      }
      v12 = 0;
    }
  }
  if (__osLogTrace)
    v17 = __osLogTrace;
  else
    v17 = v7;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v24 = v5;
    *(_WORD *)&v24[4] = 1024;
    *(_DWORD *)&v24[6] = v12;
    strcpy(v25, "@\b");
    v25[3] = 0;
    *(_WORD *)&v25[4] = 0;
    *(_DWORD *)&v25[6] = 0;
    _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_ERROR, "getUserUUIDForUID(%d): -> %d, userUUID = %@\n", buf, 0x18u);
  }
  v15 = 0;
LABEL_24:

  return v12;
}

- (id)getUserKeybagUUIDForUID:(unsigned int)a3
{
  NSObject *v4;
  NSObject *v5;
  int bag_uuid;
  int v7;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v5 = __osLogTrace;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v10 = 67109120;
    LODWORD(v11) = a3;
    _os_log_impl(&dword_2148C7000, v5, OS_LOG_TYPE_DEBUG, "getUserKeybagUUIDForUID: %d\n", (uint8_t *)&v10, 8u);
  }
  v20 = 0uLL;
  bag_uuid = aks_get_bag_uuid(-a3, &v20);
  if (bag_uuid == -536870160)
    return 0;
  v7 = bag_uuid;
  if (bag_uuid)
  {
    if (__osLog)
      v9 = __osLog;
    else
      v9 = v4;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 136316162;
      v11 = "err == 0 ";
      v12 = 2048;
      v13 = v7;
      v14 = 2080;
      v15 = &unk_21491C593;
      v16 = 2080;
      v17 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v18 = 1024;
      v19 = 5830;
      _os_log_impl(&dword_2148C7000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v10, 0x30u);
    }
    return 0;
  }
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", &v20);
}

- (void)userListDidUpdate
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (__osLog)
    v3 = __osLog;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2148C7000, v3, OS_LOG_TYPE_DEFAULT, "userListDidUpdate\n", v5, 2u);
  }
  v4 = (void *)MEMORY[0x2199D8AE0]();
  -[BiometricKitXPCServer cacheAndSetUserAccountsInfo](self, "cacheAndSetUserAccountsInfo");
  self->_userListChangeDetected = 1;
  -[BiometricKitXPCServer validateAllUsers](self, "validateAllUsers");
  objc_autoreleasePoolPop(v4);
}

- (void)validateUsersKeybagUUIDs
{
  NSObject *v3;
  NSObject *v4;
  NSMutableDictionary *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];
  _QWORD v9[6];
  uint8_t buf[8];
  uint8_t *v11;
  uint64_t v12;
  char v13;

  v3 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v4 = __osLogTrace;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2148C7000, v4, OS_LOG_TYPE_DEBUG, "validateUsersKeybagUUIDs\n", buf, 2u);
  }
  *(_QWORD *)buf = 0;
  v11 = buf;
  v12 = 0x2020000000;
  v13 = 0;
  v5 = self->_catacombUserUUIDs;
  objc_sync_enter(v5);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", self->_catacombUserUUIDs);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__BiometricKitXPCServer_validateUsersKeybagUUIDs__block_invoke;
  v9[3] = &unk_24D241400;
  v9[4] = self;
  v9[5] = buf;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v9);
  if (v11[24])
  {
    -[BiometricKitXPCServer saveCatacomb](self, "saveCatacomb");
    -[BiometricKitXPCServer syncTemplateListForUser:](self, "syncTemplateListForUser:", 0xFFFFFFFFLL);
  }
  if (__osLogTrace)
    v7 = __osLogTrace;
  else
    v7 = v3;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2148C7000, v7, OS_LOG_TYPE_DEBUG, "validateUsersKeybagUUIDs -> void\n", v8, 2u);
  }
  _Block_object_dispose(buf, 8);

}

void __49__BiometricKitXPCServer_validateUsersKeybagUUIDs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  _DWORD v12[2];
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v5;
  v8 = v6;
  objc_msgSend(*(id *)(a1 + 32), "getUserKeybagUUIDForUID:", objc_msgSend(v7, "unsignedIntValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_msgSend(v8, "isEqual:", v9) & 1) == 0)
  {
    if (__osLog)
      v10 = __osLog;
    else
      v10 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      v12[0] = 67109634;
      v12[1] = objc_msgSend(v7, "unsignedIntValue");
      v13 = 2112;
      v14 = v9;
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_DEFAULT, "validateUsersKeybagUUIDs: removing user %u because of invalid user keybag UUID (real:%@ vs catacomb:%@)\n", (uint8_t *)v12, 0x1Cu);

    }
    objc_msgSend(*(id *)(a1 + 32), "removeUser:", objc_msgSend(v7, "unsignedIntValue"));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

- (int)updateIdentity:(id)a3 withOptions:(id)a4 withClient:(id)a5
{
  char *v8;
  id v9;
  char *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  os_log_type_t v20;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  int v25;
  const char *v26;
  __int16 v27;
  char *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = (char *)a3;
  v9 = a4;
  v10 = (char *)a5;
  v11 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v12 = __osLogTrace;
  else
    v12 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 134218754;
    v26 = v8;
    v27 = 2114;
    v28 = v8;
    v29 = 2048;
    v30 = v9;
    v31 = 2112;
    v32 = v10;
    _os_log_impl(&dword_2148C7000, v12, OS_LOG_TYPE_DEFAULT, "updateIdentity:withOptions:withClient: %p(%{public}@) %p %@\n", (uint8_t *)&v25, 0x2Au);
  }
  if (BYTE1(self->_mkbLockStatusNtfToken))
    kdebug_trace();
  if (isEphemeralMultiUser())
  {
    if (__osLog)
      v22 = __osLog;
    else
      v22 = v11;
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_37;
    v25 = 136316162;
    v26 = "!isEphemeralMultiUser()";
    v27 = 2048;
    v28 = 0;
    v29 = 2080;
    v30 = &unk_21491C593;
    v31 = 2080;
    v32 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v33 = 1024;
    v34 = 5968;
    goto LABEL_36;
  }
  if (-[BiometricKitXPCServer isFingerprintModificationRestricted](self, "isFingerprintModificationRestricted"))
  {
    if (__osLog)
      v22 = __osLog;
    else
      v22 = v11;
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_37;
    v25 = 136316162;
    v26 = "![self isFingerprintModificationRestricted]";
    v27 = 2048;
    v28 = 0;
    v29 = 2080;
    v30 = &unk_21491C593;
    v31 = 2080;
    v32 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v33 = 1024;
    v34 = 5969;
LABEL_36:
    _os_log_impl(&dword_2148C7000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v25, 0x30u);
LABEL_37:
    v17 = 257;
    goto LABEL_14;
  }
  -[BiometricKitXPCServer validateAllUsers](self, "validateAllUsers");
  v13 = objc_msgSend(v8, "userID");
  objc_msgSend(v8, "uuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BiometricKitXPCServer getIdentityObjectByUserID:UUID:](self, "getIdentityObjectByUserID:UUID:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v15, "setAttribute:", objc_msgSend(v8, "attribute"));
    objc_msgSend(v15, "setEntity:", objc_msgSend(v8, "entity"));
    objc_msgSend(v8, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setName:", v16);

    v17 = -[BiometricKitXPCServer checkCatacombForUser:](self, "checkCatacombForUser:", objc_msgSend(v8, "userID"));
    if (v17)
    {
      if (__osLog)
        v24 = __osLog;
      else
        v24 = v11;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = 136316162;
        v26 = "err == 0 ";
        v27 = 2048;
        v28 = (char *)v17;
        v29 = 2080;
        v30 = &unk_21491C593;
        v31 = 2080;
        v32 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v33 = 1024;
        v34 = 5983;
        _os_log_impl(&dword_2148C7000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v25, 0x30u);
      }
    }
    else
    {
      -[BiometricKitXPCServer saveCatacombForIdentity:](self, "saveCatacombForIdentity:", v15);
    }

  }
  else
  {
    if (__osLog)
      v23 = __osLog;
    else
      v23 = v11;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v25 = 136316162;
      v26 = "obj";
      v27 = 2048;
      v28 = 0;
      v29 = 2080;
      v30 = &unk_21491C593;
      v31 = 2080;
      v32 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v33 = 1024;
      v34 = 5975;
      _os_log_impl(&dword_2148C7000, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v25, 0x30u);
    }
    v17 = 258;
  }
LABEL_14:
  if (BYTE1(self->_mkbLockStatusNtfToken))
    kdebug_trace();
  if (__osLogTrace)
    v18 = __osLogTrace;
  else
    v18 = v11;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v25 = 67109120;
      LODWORD(v26) = v17;
      v19 = v18;
      v20 = OS_LOG_TYPE_ERROR;
LABEL_24:
      _os_log_impl(&dword_2148C7000, v19, v20, "updateIdentity:withOptions:withClient: -> %d\n", (uint8_t *)&v25, 8u);
    }
  }
  else if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v25 = 67109120;
    LODWORD(v26) = 0;
    v19 = v18;
    v20 = OS_LOG_TYPE_DEBUG;
    goto LABEL_24;
  }

  return v17;
}

- (int)removeIdentity:(id)a3 withOptions:(id)a4 withClient:(id)a5
{
  char *v8;
  id v9;
  char *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  os_log_type_t v19;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  int v24;
  const char *v25;
  __int16 v26;
  char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  _QWORD v34[2];
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = (char *)a3;
  v9 = a4;
  v10 = (char *)a5;
  v11 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v12 = __osLogTrace;
  else
    v12 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 134218754;
    v25 = v8;
    v26 = 2114;
    v27 = v8;
    v28 = 2048;
    v29 = v9;
    v30 = 2112;
    v31 = v10;
    _os_log_impl(&dword_2148C7000, v12, OS_LOG_TYPE_DEFAULT, "removeIdentity:withOptions:withClient: %p(%{public}@) %p %@\n", (uint8_t *)&v24, 0x2Au);
  }
  v34[0] = 0;
  v34[1] = 0;
  v35 = 0;
  if (BYTE1(self->_mkbLockStatusNtfToken))
    kdebug_trace();
  if (isEphemeralMultiUser())
  {
    if (__osLog)
      v21 = __osLog;
    else
      v21 = v11;
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_38;
    v24 = 136316162;
    v25 = "!isEphemeralMultiUser()";
    v26 = 2048;
    v27 = 0;
    v28 = 2080;
    v29 = &unk_21491C593;
    v30 = 2080;
    v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v32 = 1024;
    v33 = 6010;
    goto LABEL_37;
  }
  if (-[BiometricKitXPCServer isFingerprintModificationRestricted](self, "isFingerprintModificationRestricted"))
  {
    if (__osLog)
      v21 = __osLog;
    else
      v21 = v11;
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_38;
    v24 = 136316162;
    v25 = "![self isFingerprintModificationRestricted]";
    v26 = 2048;
    v27 = 0;
    v28 = 2080;
    v29 = &unk_21491C593;
    v30 = 2080;
    v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v32 = 1024;
    v33 = 6011;
LABEL_37:
    _os_log_impl(&dword_2148C7000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v24, 0x30u);
LABEL_38:
    v16 = 257;
    goto LABEL_15;
  }
  if (!v8)
  {
    if (__osLog)
      v22 = __osLog;
    else
      v22 = v11;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v24 = 136316162;
      v25 = "identity";
      v26 = 2048;
      v27 = 0;
      v28 = 2080;
      v29 = &unk_21491C593;
      v30 = 2080;
      v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v32 = 1024;
      v33 = 6012;
      _os_log_impl(&dword_2148C7000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v24, 0x30u);
    }
    v16 = 258;
    goto LABEL_15;
  }
  -[BiometricKitXPCServer validateAllUsers](self, "validateAllUsers");
  v13 = -[BiometricKitXPCServer checkCatacombForUser:](self, "checkCatacombForUser:", objc_msgSend(v8, "userID"));
  if (v13)
  {
    v16 = v13;
    if (__osLog)
      v23 = __osLog;
    else
      v23 = v11;
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v24 = 136316162;
    v25 = "err == 0 ";
    v26 = 2048;
    v27 = (char *)v16;
    v28 = 2080;
    v29 = &unk_21491C593;
    v30 = 2080;
    v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v32 = 1024;
    v33 = 6019;
LABEL_60:
    _os_log_impl(&dword_2148C7000, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v24, 0x30u);
    goto LABEL_15;
  }
  LODWORD(v34[0]) = objc_msgSend(v8, "userID");
  objc_msgSend(v8, "uuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "getUUIDBytes:", (char *)v34 + 4);

  v15 = -[BiometricKitXPCServer performRemoveIdentityCommand:](self, "performRemoveIdentityCommand:", v34);
  if (v15)
  {
    v16 = v15;
    if (__osLog)
      v23 = __osLog;
    else
      v23 = v11;
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v24 = 136316162;
    v25 = "err == 0 ";
    v26 = 2048;
    v27 = (char *)v16;
    v28 = 2080;
    v29 = &unk_21491C593;
    v30 = 2080;
    v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v32 = 1024;
    v33 = 6025;
    goto LABEL_60;
  }
  -[BiometricKitXPCServer removeIdentityObject:](self, "removeIdentityObject:", v8);
  v16 = -[BiometricKitXPCServer saveCatacomb](self, "saveCatacomb");
  if (!v16)
  {
    -[BiometricKitXPCServer updateEnrollmentChangedNotification:](self, "updateEnrollmentChangedNotification:", 1);
    goto LABEL_15;
  }
  if (__osLog)
    v23 = __osLog;
  else
    v23 = v11;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v24 = 136316162;
    v25 = "err == 0 ";
    v26 = 2048;
    v27 = (char *)v16;
    v28 = 2080;
    v29 = &unk_21491C593;
    v30 = 2080;
    v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v32 = 1024;
    v33 = 6032;
    goto LABEL_60;
  }
LABEL_15:
  if (BYTE1(self->_mkbLockStatusNtfToken))
    kdebug_trace();
  if (__osLogTrace)
    v17 = __osLogTrace;
  else
    v17 = v11;
  if (v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v24 = 67109120;
      LODWORD(v25) = v16;
      v18 = v17;
      v19 = OS_LOG_TYPE_ERROR;
LABEL_25:
      _os_log_impl(&dword_2148C7000, v18, v19, "removeIdentity:withOptions:withClient: -> %d\n", (uint8_t *)&v24, 8u);
    }
  }
  else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v24 = 67109120;
    LODWORD(v25) = 0;
    v18 = v17;
    v19 = OS_LOG_TYPE_DEBUG;
    goto LABEL_25;
  }

  return v16;
}

- (int)removeAllIdentitiesForUser:(unsigned int)a3 withOptions:(id)a4 withClient:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  char v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  int v22;
  int v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  os_log_type_t v27;
  NSObject *v29;
  NSObject *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[2];
  int v37;
  _BYTE v38[128];
  _BYTE buf[32];
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v6 = *(_QWORD *)&a3;
  v44 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v11 = __osLogTrace;
  else
    v11 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)&buf[4] = v6;
    *(_WORD *)&buf[8] = 2048;
    *(_QWORD *)&buf[10] = v8;
    *(_WORD *)&buf[18] = 2112;
    *(_QWORD *)&buf[20] = v9;
    _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_DEFAULT, "removeAllIdentitiesForUser:withOptions:withClient: %d %p %@\n", buf, 0x1Cu);
  }
  if (BYTE1(self->_mkbLockStatusNtfToken))
    kdebug_trace();
  if (isEphemeralMultiUser())
  {
    if (__osLog)
      v29 = __osLog;
    else
      v29 = v10;
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_55;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "!isEphemeralMultiUser()";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = 0;
    *(_WORD *)&buf[22] = 2080;
    *(_QWORD *)&buf[24] = &unk_21491C593;
    v40 = 2080;
    v41 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v42 = 1024;
    v43 = 6060;
    goto LABEL_54;
  }
  if (-[BiometricKitXPCServer isFingerprintModificationRestricted](self, "isFingerprintModificationRestricted"))
  {
    if (__osLog)
      v29 = __osLog;
    else
      v29 = v10;
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_55;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "![self isFingerprintModificationRestricted]";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = 0;
    *(_WORD *)&buf[22] = 2080;
    *(_QWORD *)&buf[24] = &unk_21491C593;
    v40 = 2080;
    v41 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v42 = 1024;
    v43 = 6061;
LABEL_54:
    _os_log_impl(&dword_2148C7000, v29, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_55:
    v23 = 257;
    goto LABEL_32;
  }
  -[BiometricKitXPCServer validateAllUsers](self, "validateAllUsers");
  v12 = -[BiometricKitXPCServer checkCatacombForUser:](self, "checkCatacombForUser:", v6);
  if (v12)
  {
    v23 = v12;
    if (__osLog)
      v30 = __osLog;
    else
      v30 = v10;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "err == 0 ";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v23;
      *(_WORD *)&buf[22] = 2080;
      *(_QWORD *)&buf[24] = &unk_21491C593;
      v40 = 2080;
      v41 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v42 = 1024;
      v43 = 6068;
LABEL_61:
      _os_log_impl(&dword_2148C7000, v30, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[BiometricKitXPCServer identities](self, "identities");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    if (v14)
    {
      v15 = v14;
      v31 = v9;
      v16 = v8;
      v17 = 0;
      v18 = *(_QWORD *)v33;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v33 != v18)
            objc_enumerationMutation(v13);
          v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          if (objc_msgSend(v20, "userID") == (_DWORD)v6)
          {
            v36[0] = 0;
            v36[1] = 0;
            v37 = 0;
            LODWORD(v36[0]) = objc_msgSend(v20, "userID");
            objc_msgSend(v20, "uuid");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "getUUIDBytes:", (char *)v36 + 4);

            v22 = -[BiometricKitXPCServer performRemoveIdentityCommand:](self, "performRemoveIdentityCommand:", v36);
            if (v22)
            {
              v23 = v22;
              v10 = MEMORY[0x24BDACB70];
              if (__osLog)
                v24 = __osLog;
              else
                v24 = MEMORY[0x24BDACB70];
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                *(_QWORD *)&buf[4] = "err == 0 ";
                *(_WORD *)&buf[12] = 2048;
                *(_QWORD *)&buf[14] = v23;
                *(_WORD *)&buf[22] = 2080;
                *(_QWORD *)&buf[24] = &unk_21491C593;
                v40 = 2080;
                v41 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
                v42 = 1024;
                v43 = 6080;
                _os_log_impl(&dword_2148C7000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
              }

              v8 = v16;
              v9 = v31;
              goto LABEL_32;
            }
            -[BiometricKitXPCServer removeIdentityObject:](self, "removeIdentityObject:", v20);
            v17 = 1;
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
        if (v15)
          continue;
        break;
      }

      if ((v17 & 1) == 0)
      {
        v23 = 0;
        v8 = v16;
        v9 = v31;
        v10 = MEMORY[0x24BDACB70];
        goto LABEL_32;
      }
      v23 = -[BiometricKitXPCServer saveCatacomb](self, "saveCatacomb");
      v8 = v16;
      v10 = MEMORY[0x24BDACB70];
      if (!v23)
      {
        -[BiometricKitXPCServer updateEnrollmentChangedNotification:](self, "updateEnrollmentChangedNotification:", 1);
        v9 = v31;
        goto LABEL_32;
      }
      if (__osLog)
        v30 = __osLog;
      else
        v30 = MEMORY[0x24BDACB70];
      v9 = v31;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = "err == 0 ";
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v23;
        *(_WORD *)&buf[22] = 2080;
        *(_QWORD *)&buf[24] = &unk_21491C593;
        v40 = 2080;
        v41 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v42 = 1024;
        v43 = 6092;
        goto LABEL_61;
      }
    }
    else
    {

      v23 = 0;
    }
  }
LABEL_32:
  if (BYTE1(self->_mkbLockStatusNtfToken))
    kdebug_trace();
  if (__osLogTrace)
    v25 = __osLogTrace;
  else
    v25 = v10;
  if (v23)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v23;
      v26 = v25;
      v27 = OS_LOG_TYPE_ERROR;
LABEL_42:
      _os_log_impl(&dword_2148C7000, v26, v27, "removeAllIdentitiesForUser:withOptions:withClient: -> %d\n", buf, 8u);
    }
  }
  else if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_QWORD *)buf = 67109120;
    v26 = v25;
    v27 = OS_LOG_TYPE_DEBUG;
    goto LABEL_42;
  }

  return v23;
}

- (id)getIdentityFromUUID:(id)a3 withClient:(id)a4
{
  id v6;
  NSObject *v7;
  ActivityTracker *v8;
  ActivityTracker *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v18 = a4;
  if (__osLogTrace)
    v7 = __osLogTrace;
  else
    v7 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v25 = v6;
    v26 = 2112;
    v27 = v6;
    v28 = 2112;
    v29 = v18;
    _os_log_impl(&dword_2148C7000, v7, OS_LOG_TYPE_DEBUG, "getIdentityFromUUID:withClient: %p(%@) %@\n", buf, 0x20u);
  }
  if (BYTE1(self->_mkbLockStatusNtfToken))
    kdebug_trace();
  -[BiometricKitXPCServer validateAllUsers](self, "validateAllUsers");
  v8 = self->_ongoingBiometricOperation;
  objc_sync_enter(v8);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = self->_ongoingBiometricOperation;
  v10 = (id)-[ActivityTracker countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v13, "uuid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqual:", v6);

        if (v15)
        {
          v10 = v13;
          goto LABEL_18;
        }
      }
      v10 = (id)-[ActivityTracker countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_18:

  objc_sync_exit(v8);
  if (BYTE1(self->_mkbLockStatusNtfToken))
    kdebug_trace();
  if (__osLogTrace)
    v16 = __osLogTrace;
  else
    v16 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v10;
    _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_DEFAULT, "getIdentityFromUUID:withClient: -> %{public}@\n", buf, 0xCu);
  }

  return v10;
}

- (id)identities:(id)a3 withClient:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v9 = __osLogTrace;
  else
    v9 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v15 = 134218498;
    v16 = v6;
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_2148C7000, v9, OS_LOG_TYPE_DEBUG, "identities:withClient: %p(%@) %@\n", (uint8_t *)&v15, 0x20u);
  }
  -[BiometricKitXPCServer validateAllUsers](self, "validateAllUsers");
  if (BYTE2(self->_mkbLockStatusNtfToken))
  {
    objc_msgSend(MEMORY[0x24BE0CE78], "biometricKitIdentity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setUserID:", 501);
    objc_msgSend(v10, "setFlags:", 1);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v10);
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDBCEB8];
    -[BiometricKitXPCServer identities](self, "identities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayWithArray:", v10);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && -[BiometricKitXPCServer filterIdentities:withFilter:](self, "filterIdentities:withFilter:", v12, v6))
    objc_msgSend(v12, "removeAllObjects");
  if (__osLogTrace)
    v13 = __osLogTrace;
  else
    v13 = v8;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v12;
    _os_log_impl(&dword_2148C7000, v13, OS_LOG_TYPE_DEFAULT, "identities:withClient: -> %@\n", (uint8_t *)&v15, 0xCu);
  }

  return v12;
}

- (int64_t)getMaxIdentityCount:(int)a3 withClient:(id)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  int64_t v11;
  int v13;
  NSObject *v14;
  unsigned int v15;
  uint8_t buf[4];
  _BYTE v17[18];
  __int16 v18;
  void *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v17 = a3;
    *(_WORD *)&v17[4] = 2112;
    *(_QWORD *)&v17[6] = v6;
    _os_log_impl(&dword_2148C7000, v8, OS_LOG_TYPE_DEBUG, "getMaxIdentityCount:withClient: %d %@\n", buf, 0x12u);
  }
  v15 = 0;
  if (BYTE1(self->_mkbLockStatusNtfToken))
    kdebug_trace();
  v9 = -[BiometricKitXPCServer performRequestMaxIdentityCountCommand:](self, "performRequestMaxIdentityCountCommand:", &v15);
  if (v9)
  {
    v13 = v9;
    v14 = (__osLog ? __osLog : v7);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v17 = "err == 0 ";
      *(_WORD *)&v17[8] = 2048;
      *(_QWORD *)&v17[10] = v13;
      v18 = 2080;
      v19 = &unk_21491C593;
      v20 = 2080;
      v21 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v22 = 1024;
      v23 = 6190;
      _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  if (BYTE1(self->_mkbLockStatusNtfToken))
    kdebug_trace();
  if (__osLogTrace)
    v10 = __osLogTrace;
  else
    v10 = v7;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v17 = v15;
    _os_log_impl(&dword_2148C7000, v10, OS_LOG_TYPE_DEBUG, "getMaxIdentityCount:withClient: -> %u\n", buf, 8u);
  }
  v11 = v15;

  return v11;
}

- (int64_t)getFreeIdentityCount:(int)a3 forUser:(unsigned int)a4 withClient:(id)a5
{
  uint64_t v5;
  id v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  int64_t v13;
  int v15;
  NSObject *v16;
  unsigned int v17;
  uint8_t buf[4];
  _BYTE v19[10];
  _BYTE v20[10];
  void *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v5 = *(_QWORD *)&a4;
  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v10 = __osLogTrace;
  else
    v10 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v19 = a3;
    *(_WORD *)&v19[4] = 1024;
    *(_DWORD *)&v19[6] = v5;
    *(_WORD *)v20 = 2112;
    *(_QWORD *)&v20[2] = v8;
    _os_log_impl(&dword_2148C7000, v10, OS_LOG_TYPE_DEBUG, "getFreeIdentityCount:forUser:withClient: %d %d %@\n", buf, 0x18u);
  }
  v17 = 0;
  if (BYTE1(self->_mkbLockStatusNtfToken))
    kdebug_trace();
  -[BiometricKitXPCServer validateAllUsers](self, "validateAllUsers");
  v11 = -[BiometricKitXPCServer performGetFreeIdentityCountCommand:outCount:](self, "performGetFreeIdentityCountCommand:outCount:", v5, &v17);
  if (v11)
  {
    v15 = v11;
    v16 = (__osLog ? __osLog : v9);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v19 = "err == 0 ";
      *(_WORD *)&v19[8] = 2048;
      *(_QWORD *)v20 = v15;
      *(_WORD *)&v20[8] = 2080;
      v21 = &unk_21491C593;
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v24 = 1024;
      v25 = 6217;
      _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  if (BYTE1(self->_mkbLockStatusNtfToken))
    kdebug_trace();
  if (__osLogTrace)
    v12 = __osLogTrace;
  else
    v12 = v9;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v19 = v17;
    _os_log_impl(&dword_2148C7000, v12, OS_LOG_TYPE_DEBUG, "getFreeIdentityCount:forUser:withClient: -> %u\n", buf, 8u);
  }
  v13 = v17;

  return v13;
}

- (id)getIdentitiesDatabaseUUIDForUser:(unsigned int)a3 withClient:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  int v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  os_log_type_t v14;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  _BYTE v21[18];
  __int16 v22;
  void *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v4 = *(_QWORD *)&a3;
  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v21 = v4;
    *(_WORD *)&v21[4] = 2112;
    *(_QWORD *)&v21[6] = v6;
    _os_log_impl(&dword_2148C7000, v8, OS_LOG_TYPE_DEBUG, "getIdentitiesDatabaseUUIDForUser:withClient: %d %@\n", buf, 0x12u);
  }
  -[BiometricKitXPCServer validateAllUsers](self, "validateAllUsers");
  if ((_DWORD)v4 == -1 || (-[BKCatacomb stateOfUserComponent:](self->_catacomb, "stateOfUserComponent:", v4) & 1) == 0)
  {
    v11 = 0;
    v10 = 263;
  }
  else
  {
    v9 = -[BiometricKitXPCServer checkCatacombForUser:](self, "checkCatacombForUser:", v4);
    if (v9)
    {
      v10 = v9;
      if (__osLog)
        v16 = __osLog;
      else
        v16 = v7;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v21 = "err == 0 ";
        *(_WORD *)&v21[8] = 2048;
        *(_QWORD *)&v21[10] = v10;
        v22 = 2080;
        v23 = &unk_21491C593;
        v24 = 2080;
        v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v26 = 1024;
        v27 = 6246;
        _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v11 = 0;
    }
    else
    {
      v19 = 0;
      v10 = -[BiometricKitXPCServer performGetCatacombUUIDCommand:outUUID:](self, "performGetCatacombUUIDCommand:outUUID:", v4, &v19);
      v11 = v19;
      if (!v10)
      {
        -[BiometricKitXPCServer logCatacombUUIDForUser:catacombUUID:](self, "logCatacombUUIDForUser:catacombUUID:", v4, v11);
        if (__osLogTrace)
          v12 = __osLogTrace;
        else
          v12 = v7;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v21 = v11;
          *(_WORD *)&v21[8] = 1024;
          *(_DWORD *)&v21[10] = 0;
          v13 = v12;
          v14 = OS_LOG_TYPE_DEBUG;
LABEL_15:
          _os_log_impl(&dword_2148C7000, v13, v14, "getIdentitiesDatabaseUUIDForUser:withClient: -> %@ (%d)\n", buf, 0x12u);
          goto LABEL_16;
        }
        goto LABEL_16;
      }
      if (__osLog)
        v17 = __osLog;
      else
        v17 = v7;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v21 = "err == 0 ";
        *(_WORD *)&v21[8] = 2048;
        *(_QWORD *)&v21[10] = v10;
        v22 = 2080;
        v23 = &unk_21491C593;
        v24 = 2080;
        v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v26 = 1024;
        v27 = 6249;
        _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
  }
  if (__osLogTrace)
    v18 = __osLogTrace;
  else
    v18 = v7;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v21 = v11;
    *(_WORD *)&v21[8] = 1024;
    *(_DWORD *)&v21[10] = v10;
    v13 = v18;
    v14 = OS_LOG_TYPE_ERROR;
    goto LABEL_15;
  }
LABEL_16:

  return v11;
}

- (id)getIdentitiesDatabaseHashForUser:(unsigned int)a3 withClient:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  int v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  os_log_type_t v14;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  _BYTE v21[18];
  __int16 v22;
  void *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v4 = *(_QWORD *)&a3;
  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v21 = v4;
    *(_WORD *)&v21[4] = 2112;
    *(_QWORD *)&v21[6] = v6;
    _os_log_impl(&dword_2148C7000, v8, OS_LOG_TYPE_DEBUG, "getIdentitiesDatabaseHashForUser:withClient: %d %@\n", buf, 0x12u);
  }
  -[BiometricKitXPCServer validateAllUsers](self, "validateAllUsers");
  if ((_DWORD)v4 == -1 || (-[BKCatacomb stateOfUserComponent:](self->_catacomb, "stateOfUserComponent:", v4) & 1) == 0)
  {
    v11 = 0;
    v10 = 263;
  }
  else
  {
    v9 = -[BiometricKitXPCServer checkCatacombForUser:](self, "checkCatacombForUser:", v4);
    if (v9)
    {
      v10 = v9;
      if (__osLog)
        v16 = __osLog;
      else
        v16 = v7;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v21 = "err == 0 ";
        *(_WORD *)&v21[8] = 2048;
        *(_QWORD *)&v21[10] = v10;
        v22 = 2080;
        v23 = &unk_21491C593;
        v24 = 2080;
        v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v26 = 1024;
        v27 = 6278;
        _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v11 = 0;
    }
    else
    {
      v19 = 0;
      v10 = -[BiometricKitXPCServer performGetCatacombHashCommand:outHash:](self, "performGetCatacombHashCommand:outHash:", v4, &v19);
      v11 = v19;
      if (!v10)
      {
        -[BiometricKitXPCServer logCatacombHashForUser:catacombHash:](self, "logCatacombHashForUser:catacombHash:", v4, v11);
        if (__osLogTrace)
          v12 = __osLogTrace;
        else
          v12 = v7;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v21 = v11;
          *(_WORD *)&v21[8] = 1024;
          *(_DWORD *)&v21[10] = 0;
          v13 = v12;
          v14 = OS_LOG_TYPE_DEBUG;
LABEL_15:
          _os_log_impl(&dword_2148C7000, v13, v14, "getIdentitiesDatabaseHashForUser:withClient: -> %@ (%d)\n", buf, 0x12u);
          goto LABEL_16;
        }
        goto LABEL_16;
      }
      if (__osLog)
        v17 = __osLog;
      else
        v17 = v7;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v21 = "err == 0 ";
        *(_WORD *)&v21[8] = 2048;
        *(_QWORD *)&v21[10] = v10;
        v22 = 2080;
        v23 = &unk_21491C593;
        v24 = 2080;
        v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v26 = 1024;
        v27 = 6281;
        _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
  }
  if (__osLogTrace)
    v18 = __osLogTrace;
  else
    v18 = v7;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v21 = v11;
    *(_WORD *)&v21[8] = 1024;
    *(_DWORD *)&v21[10] = v10;
    v13 = v18;
    v14 = OS_LOG_TYPE_ERROR;
    goto LABEL_15;
  }
LABEL_16:

  return v11;
}

- (int)dropUnlockTokenWithClient:(id)a3
{
  char *v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  os_log_type_t v10;
  NSObject *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)a3;
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v14 = 138412290;
    v15 = v4;
    _os_log_impl(&dword_2148C7000, v6, OS_LOG_TYPE_DEBUG, "dropUnlockTokenWithClient: %@\n", (uint8_t *)&v14, 0xCu);
  }
  v7 = -[BiometricKitXPCServer performDropUnlockTokenCommand](self, "performDropUnlockTokenCommand");
  if (v7)
  {
    if (__osLog)
      v12 = __osLog;
    else
      v12 = v5;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 136316162;
      v15 = "err == 0 ";
      v16 = 2048;
      v17 = v7;
      v18 = 2080;
      v19 = &unk_21491C593;
      v20 = 2080;
      v21 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v22 = 1024;
      v23 = 6302;
      _os_log_impl(&dword_2148C7000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v14, 0x30u);
    }
    if (__osLogTrace)
      v13 = __osLogTrace;
    else
      v13 = v5;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = 67109120;
      LODWORD(v15) = v7;
      v9 = v13;
      v10 = OS_LOG_TYPE_ERROR;
      goto LABEL_12;
    }
  }
  else
  {
    if (__osLogTrace)
      v8 = __osLogTrace;
    else
      v8 = v5;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v14 = 67109120;
      LODWORD(v15) = 0;
      v9 = v8;
      v10 = OS_LOG_TYPE_DEBUG;
LABEL_12:
      _os_log_impl(&dword_2148C7000, v9, v10, "dropUnlockTokenWithClient: -> %d\n", (uint8_t *)&v14, 8u);
    }
  }

  return v7;
}

- (int)forceBioLockoutForUser:(unsigned int)a3 withOptions:(id)a4 withClient:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  int Bool;
  int v13;
  NSObject *v14;
  int v15;
  NSObject *v17;
  NSObject *v18;
  char v19;
  uint8_t buf[4];
  _BYTE v21[28];
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v6 = *(_QWORD *)&a3;
  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v11 = __osLogTrace;
  else
    v11 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v21 = v6;
    *(_WORD *)&v21[4] = 2048;
    *(_QWORD *)&v21[6] = v8;
    *(_WORD *)&v21[14] = 2112;
    *(_QWORD *)&v21[16] = v9;
    _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_DEBUG, "forceBioLockoutForUser:withOptions:withClient: %d %p %@\n", buf, 0x1Cu);
  }
  if (v8 && (v19 = 0, (Bool = dictionaryGetBool()) != 0))
  {
    v15 = Bool;
    if (__osLog)
      v17 = __osLog;
    else
      v17 = v10;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v21 = "err == 0 ";
      *(_WORD *)&v21[8] = 2048;
      *(_QWORD *)&v21[10] = v15;
      *(_WORD *)&v21[18] = 2080;
      *(_QWORD *)&v21[20] = &unk_21491C593;
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v24 = 1024;
      v25 = 6325;
      goto LABEL_26;
    }
  }
  else
  {
    v13 = -[BiometricKitXPCServer performForceBioLockoutCommand:](self, "performForceBioLockoutCommand:", v6);
    if (!v13)
    {
      if (__osLogTrace)
        v14 = __osLogTrace;
      else
        v14 = v10;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v21 = 0;
        _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_DEBUG, "forceBioLockoutForUser:withClient: -> %d\n", buf, 8u);
      }
      v15 = 0;
      goto LABEL_15;
    }
    v15 = v13;
    if (__osLog)
      v17 = __osLog;
    else
      v17 = v10;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v21 = "err == 0 ";
      *(_WORD *)&v21[8] = 2048;
      *(_QWORD *)&v21[10] = v15;
      *(_WORD *)&v21[18] = 2080;
      *(_QWORD *)&v21[20] = &unk_21491C593;
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v24 = 1024;
      v25 = 6338;
LABEL_26:
      _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  if (__osLogTrace)
    v18 = __osLogTrace;
  else
    v18 = v10;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v21 = v15;
    _os_log_impl(&dword_2148C7000, v18, OS_LOG_TYPE_ERROR, "forceBioLockoutForUser:withClient: -> %d\n", buf, 8u);
  }
LABEL_15:

  return v15;
}

- (int)getBioLockoutState:(int64_t *)a3 forUser:(unsigned int)a4 withClient:(id)a5
{
  uint64_t v5;
  id v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  BOOL v12;
  unsigned int v13;
  NSObject *v14;
  int v15;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  unsigned int v20;
  uint8_t buf[4];
  _BYTE v22[18];
  __int16 v23;
  void *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v5 = *(_QWORD *)&a4;
  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v10 = __osLogTrace;
  else
    v10 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v22 = v5;
    *(_WORD *)&v22[4] = 2112;
    *(_QWORD *)&v22[6] = v8;
    _os_log_impl(&dword_2148C7000, v10, OS_LOG_TYPE_DEBUG, "getBioLockoutState:forUser:withClient: %d %@\n", buf, 0x12u);
  }
  v20 = 0;
  if (a3)
  {
    v11 = -[BiometricKitXPCServer performGetSKSLockStateCommand:outState:](self, "performGetSKSLockStateCommand:outState:", v5, &v20);
    if (!v11)
    {
      v12 = -[BiometricKitXPCServer hasMultipleUserAccounts](self, "hasMultipleUserAccounts");
      v13 = v20;
      if (!v12)
      {
        v13 = v20 & 0xFFFFFFBF;
        v20 &= ~0x40u;
      }
      *a3 = v13;
      if (__osLogTrace)
        v14 = __osLogTrace;
      else
        v14 = v9;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)v22 = v20;
        *(_WORD *)&v22[8] = 1024;
        *(_DWORD *)&v22[10] = 0;
        _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_DEBUG, "getBioLockoutState:forUser:withClient: -> %ld (%d)\n", buf, 0x12u);
      }
      v15 = 0;
      goto LABEL_16;
    }
    v15 = v11;
    if (__osLog)
      v18 = __osLog;
    else
      v18 = v9;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v22 = "err == 0 ";
      *(_WORD *)&v22[8] = 2048;
      *(_QWORD *)&v22[10] = v15;
      v23 = 2080;
      v24 = &unk_21491C593;
      v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v27 = 1024;
      v28 = 6378;
      _os_log_impl(&dword_2148C7000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    if (__osLog)
      v17 = __osLog;
    else
      v17 = v9;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v22 = "state";
      *(_WORD *)&v22[8] = 2048;
      *(_QWORD *)&v22[10] = 0;
      v23 = 2080;
      v24 = &unk_21491C593;
      v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v27 = 1024;
      v28 = 6368;
      _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v15 = 258;
  }
  if (__osLogTrace)
    v19 = __osLogTrace;
  else
    v19 = v9;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)v22 = v20;
    *(_WORD *)&v22[8] = 1024;
    *(_DWORD *)&v22[10] = v15;
    _os_log_impl(&dword_2148C7000, v19, OS_LOG_TYPE_ERROR, "getBioLockoutState:forUser:withClient: -> %ld (%d)\n", buf, 0x12u);
  }
LABEL_16:

  return v15;
}

- (int)getExpressModeState:(int64_t *)a3 forUser:(unsigned int)a4 withClient:(id)a5
{
  uint64_t v5;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int64_t v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  uint8_t buf[4];
  _BYTE v30[18];
  __int16 v31;
  void *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v5 = *(_QWORD *)&a4;
  v37 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v10 = __osLogTrace;
  else
    v10 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v30 = v5;
    *(_WORD *)&v30[4] = 2112;
    *(_QWORD *)&v30[6] = v8;
    _os_log_impl(&dword_2148C7000, v10, OS_LOG_TYPE_DEBUG, "getExpressModeState:forUser:withClient: %d %@\n", buf, 0x12u);
  }
  if (a3)
  {
    -[BiometricKitXPCServer identitiesOfUser:](self, "identitiesOfUser:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = v11;
      if (!objc_msgSend(v11, "count"))
      {
        v15 = 0;
LABEL_19:
        *a3 = v15;
        if (__osLogTrace)
          v20 = __osLogTrace;
        else
          v20 = v9;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)v30 = v15;
          *(_WORD *)&v30[8] = 1024;
          *(_DWORD *)&v30[10] = 0;
          _os_log_impl(&dword_2148C7000, v20, OS_LOG_TYPE_DEBUG, "getExpressModeState:forUser:withClient: -> %ld (%d)\n", buf, 0x12u);
        }
        v21 = 0;
        goto LABEL_25;
      }
      v28 = 0;
      -[BiometricKitXPCServer getProtectedConfigurationForUser:withClient:](self, "getProtectedConfigurationForUser:withClient:", v5, v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = -[BiometricKitXPCServer getBioLockoutState:forUser:withClient:](self, "getBioLockoutState:forUser:withClient:", &v28, v5, v8);
        if (!v14)
        {
          v15 = (v28 & 0x16) != 0;
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("BKUserCfgEffectiveTouchIDApplePayEnabled"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "BOOLValue"))
          {

          }
          else
          {
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("BKUserCfgEffectiveTouchIDUnlockEnabled"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "BOOLValue");

            if (!v18)
            {
LABEL_18:

              goto LABEL_19;
            }
          }
          v19 = 4;
          if ((v28 & 0x208) == 0)
            v19 = 6;
          v15 |= v19;
          goto LABEL_18;
        }
        v21 = v14;
        if (__osLog)
          v26 = __osLog;
        else
          v26 = v9;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v30 = "err == 0 ";
          *(_WORD *)&v30[8] = 2048;
          *(_QWORD *)&v30[10] = v21;
          v31 = 2080;
          v32 = &unk_21491C593;
          v33 = 2080;
          v34 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
          v35 = 1024;
          v36 = 6427;
          _os_log_impl(&dword_2148C7000, v26, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      else
      {
        if (__osLog)
          v25 = __osLog;
        else
          v25 = v9;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v30 = "configuration";
          *(_WORD *)&v30[8] = 2048;
          *(_QWORD *)&v30[10] = 0;
          v31 = 2080;
          v32 = &unk_21491C593;
          v33 = 2080;
          v34 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
          v35 = 1024;
          v36 = 6424;
          _os_log_impl(&dword_2148C7000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v21 = 261;
      }

    }
    else
    {
      if (__osLog)
        v24 = __osLog;
      else
        v24 = v9;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v30 = "identities";
        *(_WORD *)&v30[8] = 2048;
        *(_QWORD *)&v30[10] = 0;
        v31 = 2080;
        v32 = &unk_21491C593;
        v33 = 2080;
        v34 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v35 = 1024;
        v36 = 6417;
        _os_log_impl(&dword_2148C7000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v12 = 0;
      v21 = 261;
    }
  }
  else
  {
    if (__osLog)
      v23 = __osLog;
    else
      v23 = v9;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v30 = "state";
      *(_WORD *)&v30[8] = 2048;
      *(_QWORD *)&v30[10] = 0;
      v31 = 2080;
      v32 = &unk_21491C593;
      v33 = 2080;
      v34 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v35 = 1024;
      v36 = 6414;
      _os_log_impl(&dword_2148C7000, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v12 = 0;
    v21 = 258;
  }
  if (__osLogTrace)
    v27 = __osLogTrace;
  else
    v27 = v9;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)v30 = 0;
    *(_WORD *)&v30[8] = 1024;
    *(_DWORD *)&v30[10] = v21;
    _os_log_impl(&dword_2148C7000, v27, OS_LOG_TYPE_ERROR, "getExpressModeState:forUser:withClient: -> %ld (%d)\n", buf, 0x12u);
  }
LABEL_25:

  return v21;
}

- (int)getBiometryAvailability:(int64_t *)a3 forUser:(unsigned int)a4 withClient:(id)a5
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  int64_t v10;
  NSObject *v11;
  int64_t v12;
  int v13;
  NSObject *v15;
  NSObject *v16;
  int v17;
  int64_t *v18;
  __int16 v19;
  _BYTE v20[18];
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v8 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v9 = __osLogTrace;
  else
    v9 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v17 = 134218498;
    v18 = a3;
    v19 = 1024;
    *(_DWORD *)v20 = a4;
    *(_WORD *)&v20[4] = 2112;
    *(_QWORD *)&v20[6] = v7;
    _os_log_impl(&dword_2148C7000, v9, OS_LOG_TYPE_DEBUG, "getBiometryAvailability:forUser:withClient: %p %d %@\n", (uint8_t *)&v17, 0x1Cu);
  }
  if (a3)
  {
    v10 = 3;
    if (a4 == 501)
      v10 = 1;
    *a3 = v10;
    if (__osLogTrace)
      v11 = __osLogTrace;
    else
      v11 = v8;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = *a3;
      v17 = 134218240;
      v18 = (int64_t *)v12;
      v19 = 1024;
      *(_DWORD *)v20 = 0;
      _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_DEBUG, "getBiometryAvailability: -> %ld (%d)\n", (uint8_t *)&v17, 0x12u);
    }
    v13 = 0;
  }
  else
  {
    if (__osLog)
      v15 = __osLog;
    else
      v15 = v8;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = 136316162;
      v18 = (int64_t *)"info";
      v19 = 2048;
      *(_QWORD *)v20 = 0;
      *(_WORD *)&v20[8] = 2080;
      *(_QWORD *)&v20[10] = &unk_21491C593;
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v23 = 1024;
      v24 = 6466;
      _os_log_impl(&dword_2148C7000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
    }
    if (__osLogTrace)
      v16 = __osLogTrace;
    else
      v16 = v8;
    v13 = 258;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = 134218240;
      v18 = 0;
      v19 = 1024;
      *(_DWORD *)v20 = 258;
      _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_ERROR, "getBiometryAvailability: -> %ld (%d)\n", (uint8_t *)&v17, 0x12u);
    }
  }

  return v13;
}

- (BOOL)isXARTAvailableWithClient:(id)a3
{
  id v3;
  NSObject *v4;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (__osLogTrace)
    v4 = __osLogTrace;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_2148C7000, v4, OS_LOG_TYPE_DEBUG, "isXARTAvailableWithClient: %@\n", (uint8_t *)&v6, 0xCu);
  }

  return 1;
}

- (int)getLastMatchEvent:(id *)a3 withClient:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  const char *v11;
  int v12;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  _QWORD v18[4];
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218242;
    v20 = (const char *)a3;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_2148C7000, v8, OS_LOG_TYPE_DEBUG, "getLastMatchEvent:withClient: %p %@\n", buf, 0x16u);
  }
  if (a3)
  {
    memset(v18, 0, 29);
    v9 = -[BiometricKitXPCServer performGetLastMatchEventCommand:](self, "performGetLastMatchEventCommand:", v18);
    if (!v9)
    {
      -[BiometricKitXPCServer createMatchEventDictionary:](self, "createMatchEventDictionary:", v18);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      if (__osLogTrace)
        v10 = __osLogTrace;
      else
        v10 = v7;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = (const char *)*a3;
        *(_DWORD *)buf = 138412546;
        v20 = v11;
        v21 = 1024;
        LODWORD(v22) = 0;
        _os_log_impl(&dword_2148C7000, v10, OS_LOG_TYPE_DEBUG, "getLastMatchEvent:withClient: -> %@ %d\n", buf, 0x12u);
      }
      v12 = 0;
      goto LABEL_14;
    }
    v12 = v9;
    if (__osLog)
      v15 = __osLog;
    else
      v15 = v7;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v20 = "err == 0 ";
      v21 = 2048;
      v22 = (id)v12;
      v23 = 2080;
      v24 = &unk_21491C593;
      v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v27 = 1024;
      v28 = 6549;
      _os_log_impl(&dword_2148C7000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    if (__osLog)
      v14 = __osLog;
    else
      v14 = v7;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v20 = "matchEventDict";
      v21 = 2048;
      v22 = 0;
      v23 = 2080;
      v24 = &unk_21491C593;
      v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v27 = 1024;
      v28 = 6542;
      _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v12 = 258;
  }
  if (__osLogTrace)
    v16 = __osLogTrace;
  else
    v16 = v7;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    if (a3)
      v17 = (const char *)*a3;
    else
      v17 = 0;
    *(_DWORD *)buf = 138412546;
    v20 = v17;
    v21 = 1024;
    LODWORD(v22) = v12;
    _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_ERROR, "getLastMatchEvent:withClient: -> %@ %d\n", buf, 0x12u);
  }
LABEL_14:

  return v12;
}

- (int)getDeviceHardwareState:(unsigned int *)a3 withClient:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  unsigned int v11;
  int v12;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  unsigned int v17;
  int v18;
  _BYTE v19[10];
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v18 = 134218242;
    *(_QWORD *)v19 = a3;
    *(_WORD *)&v19[8] = 2112;
    v20 = v6;
    _os_log_impl(&dword_2148C7000, v8, OS_LOG_TYPE_DEBUG, "getDeviceHardwareState:withClient: %p %@\n", (uint8_t *)&v18, 0x16u);
  }
  if (a3)
  {
    v9 = -[BiometricKitXPCServer performGetDeviceHardwareStateCommand:](self, "performGetDeviceHardwareStateCommand:", a3);
    if (!v9)
    {
      if (__osLogTrace)
        v10 = __osLogTrace;
      else
        v10 = v7;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = *a3;
        v18 = 67109376;
        *(_DWORD *)v19 = v11;
        *(_WORD *)&v19[4] = 1024;
        *(_DWORD *)&v19[6] = 0;
        _os_log_impl(&dword_2148C7000, v10, OS_LOG_TYPE_DEBUG, "getDeviceHardwareState:withClient: -> %d %d\n", (uint8_t *)&v18, 0xEu);
      }
      v12 = 0;
      goto LABEL_14;
    }
    v12 = v9;
    if (__osLog)
      v15 = __osLog;
    else
      v15 = v7;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v18 = 136316162;
      *(_QWORD *)v19 = "err == 0 ";
      *(_WORD *)&v19[8] = 2048;
      v20 = (id)v12;
      v21 = 2080;
      v22 = &unk_21491C593;
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v25 = 1024;
      v26 = 6581;
      _os_log_impl(&dword_2148C7000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
    }
  }
  else
  {
    if (__osLog)
      v14 = __osLog;
    else
      v14 = v7;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v18 = 136316162;
      *(_QWORD *)v19 = "hardwareState";
      *(_WORD *)&v19[8] = 2048;
      v20 = 0;
      v21 = 2080;
      v22 = &unk_21491C593;
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v25 = 1024;
      v26 = 6578;
      _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
    }
    v12 = 258;
  }
  if (__osLogTrace)
    v16 = __osLogTrace;
  else
    v16 = v7;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    if (a3)
      v17 = *a3;
    else
      v17 = 0;
    v18 = 67109376;
    *(_DWORD *)v19 = v17;
    *(_WORD *)&v19[4] = 1024;
    *(_DWORD *)&v19[6] = v12;
    _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_ERROR, "getDeviceHardwareState:withClient: -> %d %d\n", (uint8_t *)&v18, 0xEu);
  }
LABEL_14:

  return v12;
}

- (id)getSystemProtectedConfigurationWithClient:(id)a3
{
  char *v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)a3;
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v4;
    _os_log_impl(&dword_2148C7000, v6, OS_LOG_TYPE_DEBUG, "getSystemProtectedConfigurationWithClient: %@\n", buf, 0xCu);
  }
  v23 = 0;
  v7 = -[BiometricKitXPCServer performGetSystemProtectedConfigCommand:](self, "performGetSystemProtectedConfigCommand:", &v23);
  v8 = v23;
  if (v7)
  {
    if (__osLog)
      v20 = __osLog;
    else
      v20 = v5;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v25 = "err == 0 ";
      v26 = 2048;
      v27 = v7;
      v28 = 2080;
      v29 = &unk_21491C593;
      v30 = 2080;
      v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v32 = 1024;
      v33 = 6675;
      _os_log_impl(&dword_2148C7000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    if (__osLogTrace)
      v21 = __osLogTrace;
    else
      v21 = v5;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v25 = 0;
      v26 = 1024;
      LODWORD(v27) = v7;
      _os_log_impl(&dword_2148C7000, v21, OS_LOG_TYPE_ERROR, "getSystemProtectedConfigurationWithClient: -> %@ (%d)\n", buf, 0x12u);
    }
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (objc_msgSend(v8, "biometryEnabled") != -1)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v8, "biometryEnabled") != 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("BKSysCfgTouchIDEnabled"));

      }
      if (objc_msgSend(v8, "unlockEnabled") != -1)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v8, "unlockEnabled") != 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("BKSysCfgTouchIDUnlockEnabled"));

      }
      if (objc_msgSend(v8, "identificationEnabled") != -1)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v8, "identificationEnabled") != 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("BKSysCfgTouchIDIdentificationEnabled"));

      }
      if (objc_msgSend(v8, "loginEnabled") != -1)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v8, "loginEnabled") != 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("BKSysCfgTouchIDLoginEnabled"));

      }
      if ((objc_msgSend(v8, "unlockTokenMaxLifetime") & 0x80000000) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v8, "unlockTokenMaxLifetime"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("BKSysCfgTouchIDUnlockTokenMaxLifetime"));

      }
      if ((objc_msgSend(v8, "bioMatchLifespan") & 0x80000000) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v8, "bioMatchLifespan"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("BKSysCfgTouchIDBioMatchLifespan"));

      }
      if ((objc_msgSend(v8, "passcodeInputLifespan") & 0x80000000) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v8, "passcodeInputLifespan"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, CFSTR("BKSysCfgTouchIDPasscodeInputLifespan"));

      }
      if ((objc_msgSend(v8, "periocularMatchEnabled") & 0x80000000) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v8, "periocularMatchEnabled"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, CFSTR("BKSysCfgPeriocularMatchEnabled"));

      }
    }
    else
    {
      if (__osLog)
        v22 = __osLog;
      else
        v22 = v5;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v25 = "dict";
        v26 = 2048;
        v27 = 0;
        v28 = 2080;
        v29 = &unk_21491C593;
        v30 = 2080;
        v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v32 = 1024;
        v33 = 6678;
        _os_log_impl(&dword_2148C7000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    if (__osLogTrace)
      v18 = __osLogTrace;
    else
      v18 = v5;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v25 = (const char *)v9;
      v26 = 1024;
      LODWORD(v27) = 0;
      _os_log_impl(&dword_2148C7000, v18, OS_LOG_TYPE_DEBUG, "getSystemProtectedConfigurationWithClient: -> %@ (%d)\n", buf, 0x12u);
    }
  }

  return v9;
}

- (int)setProtectedConfiguration:(id)a3 forUser:(unsigned int)a4 withOptions:(id)a5 withClient:(id)a6
{
  uint64_t v8;
  char *v10;
  id v11;
  NSObject *v12;
  int v13;
  UserProtectedConfig *v14;
  UserProtectedConfig *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  int v26;
  id v27;
  int v28;
  int v29;
  NSObject *v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v39;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  _BYTE v61[28];
  __int16 v62;
  int v63;
  _OWORD v64[2];
  uint64_t v65;
  uint64_t v66;

  v8 = *(_QWORD *)&a4;
  v66 = *MEMORY[0x24BDAC8D0];
  v10 = (char *)a3;
  v56 = a5;
  v11 = a6;
  if (__osLogTrace)
    v12 = __osLogTrace;
  else
    v12 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v59 = v10;
    v60 = 1024;
    *(_DWORD *)v61 = v8;
    *(_WORD *)&v61[4] = 2048;
    *(_QWORD *)&v61[6] = v56;
    *(_WORD *)&v61[14] = 2112;
    *(_QWORD *)&v61[16] = v11;
    _os_log_impl(&dword_2148C7000, v12, OS_LOG_TYPE_DEBUG, "setProtectedConfiguration:forUser:withOptions:withClient: %@ %d %p %@\n", buf, 0x26u);
  }
  v65 = 0;
  memset(v64, 0, sizeof(v64));
  v55 = v11;
  if (isEphemeralMultiUser())
  {
    v30 = MEMORY[0x24BDACB70];
    if (__osLog)
      v41 = __osLog;
    else
      v41 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v59 = "!isEphemeralMultiUser()";
      v60 = 2048;
      *(_QWORD *)v61 = 0;
      *(_WORD *)&v61[8] = 2080;
      *(_QWORD *)&v61[10] = &unk_21491C593;
      *(_WORD *)&v61[18] = 2080;
      *(_QWORD *)&v61[20] = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biomet"
                            "ricKitXPCServer.m";
      v62 = 1024;
      v63 = 6734;
      _os_log_impl(&dword_2148C7000, v41, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v27 = 0;
    v15 = 0;
    v23 = 0;
    v22 = 0;
    v21 = 0;
    v20 = 0;
    v53 = 0;
    v54 = 0;
    v26 = 257;
    goto LABEL_134;
  }
  v13 = -[BiometricKitXPCServer isValidUser:](self, "isValidUser:", v8);
  if (v13)
  {
    v26 = v13;
    v30 = MEMORY[0x24BDACB70];
    if (__osLog)
      v42 = __osLog;
    else
      v42 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v59 = "err == 0 ";
      v60 = 2048;
      *(_QWORD *)v61 = v26;
      *(_WORD *)&v61[8] = 2080;
      *(_QWORD *)&v61[10] = &unk_21491C593;
      *(_WORD *)&v61[18] = 2080;
      *(_QWORD *)&v61[20] = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biomet"
                            "ricKitXPCServer.m";
      v62 = 1024;
      v63 = 6738;
      _os_log_impl(&dword_2148C7000, v42, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v27 = 0;
    v15 = 0;
    v23 = 0;
    v22 = 0;
    v21 = 0;
    v20 = 0;
    v53 = 0;
    v54 = 0;
    goto LABEL_134;
  }
  v14 = objc_alloc_init(UserProtectedConfig);
  if (!v14)
  {
    v30 = MEMORY[0x24BDACB70];
    if (__osLog)
      v43 = __osLog;
    else
      v43 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v59 = "cfg";
      v60 = 2048;
      *(_QWORD *)v61 = 0;
      *(_WORD *)&v61[8] = 2080;
      *(_QWORD *)&v61[10] = &unk_21491C593;
      *(_WORD *)&v61[18] = 2080;
      *(_QWORD *)&v61[20] = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biomet"
                            "ricKitXPCServer.m";
      v62 = 1024;
      v63 = 6741;
      _os_log_impl(&dword_2148C7000, v43, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v27 = 0;
    v15 = 0;
    v23 = 0;
    v22 = 0;
    v21 = 0;
    v20 = 0;
    v53 = 0;
    v54 = 0;
    v26 = 261;
    goto LABEL_134;
  }
  v15 = v14;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("BKUserCfgTouchIDUnlockEnabled"));
  v16 = objc_claimAutoreleasedReturnValue();
  v54 = (void *)v16;
  if (v16)
  {
    v17 = (void *)v16;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v30 = MEMORY[0x24BDACB70];
      if (__osLog)
        v46 = __osLog;
      else
        v46 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v59 = "[enabledForUnlock isKindOfClass:[NSNumber class]]";
        v60 = 2048;
        *(_QWORD *)v61 = 0;
        *(_WORD *)&v61[8] = 2080;
        *(_QWORD *)&v61[10] = &unk_21491C593;
        *(_WORD *)&v61[18] = 2080;
        *(_QWORD *)&v61[20] = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biom"
                              "etricKitXPCServer.m";
        v62 = 1024;
        v63 = 6746;
        _os_log_impl(&dword_2148C7000, v46, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v27 = 0;
      v23 = 0;
      v22 = 0;
      v21 = 0;
      v20 = 0;
      v53 = 0;
      goto LABEL_133;
    }
    -[UserProtectedConfig setUnlockEnabled:](v15, "setUnlockEnabled:", objc_msgSend(v17, "BOOLValue"));
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("BKUserCfgTouchIDIdentificationEnabled"));
  v18 = objc_claimAutoreleasedReturnValue();
  v53 = (void *)v18;
  if (v18)
  {
    v19 = (void *)v18;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v30 = MEMORY[0x24BDACB70];
      if (__osLog)
        v47 = __osLog;
      else
        v47 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v59 = "[enabledForIdentification isKindOfClass:[NSNumber class]]";
        v60 = 2048;
        *(_QWORD *)v61 = 0;
        *(_WORD *)&v61[8] = 2080;
        *(_QWORD *)&v61[10] = &unk_21491C593;
        *(_WORD *)&v61[18] = 2080;
        *(_QWORD *)&v61[20] = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biom"
                              "etricKitXPCServer.m";
        v62 = 1024;
        v63 = 6753;
        _os_log_impl(&dword_2148C7000, v47, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v27 = 0;
      v23 = 0;
      v22 = 0;
      v21 = 0;
      v20 = 0;
      goto LABEL_133;
    }
    -[UserProtectedConfig setIdentificationEnabled:](v15, "setIdentificationEnabled:", objc_msgSend(v19, "BOOLValue"));
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("BKUserCfgTouchIDLoginEnabled"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v30 = MEMORY[0x24BDACB70];
      if (__osLog)
        v48 = __osLog;
      else
        v48 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v59 = "[enabledForLogin isKindOfClass:[NSNumber class]]";
        v60 = 2048;
        *(_QWORD *)v61 = 0;
        *(_WORD *)&v61[8] = 2080;
        *(_QWORD *)&v61[10] = &unk_21491C593;
        *(_WORD *)&v61[18] = 2080;
        *(_QWORD *)&v61[20] = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biom"
                              "etricKitXPCServer.m";
        v62 = 1024;
        v63 = 6760;
        _os_log_impl(&dword_2148C7000, v48, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v27 = 0;
      v23 = 0;
      v22 = 0;
      v21 = 0;
      goto LABEL_133;
    }
    -[UserProtectedConfig setLoginEnabled:](v15, "setLoginEnabled:", objc_msgSend(v20, "BOOLValue"));
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("BKUserCfgTouchIDApplePayEnabled"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v30 = MEMORY[0x24BDACB70];
      if (__osLog)
        v49 = __osLog;
      else
        v49 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v59 = "[enabledForApplePay isKindOfClass:[NSNumber class]]";
        v60 = 2048;
        *(_QWORD *)v61 = 0;
        *(_WORD *)&v61[8] = 2080;
        *(_QWORD *)&v61[10] = &unk_21491C593;
        *(_WORD *)&v61[18] = 2080;
        *(_QWORD *)&v61[20] = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biom"
                              "etricKitXPCServer.m";
        v62 = 1024;
        v63 = 6767;
        _os_log_impl(&dword_2148C7000, v49, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v27 = 0;
      v23 = 0;
      v22 = 0;
      goto LABEL_133;
    }
    -[UserProtectedConfig setApplePayEnabled:](v15, "setApplePayEnabled:", objc_msgSend(v21, "BOOLValue"));
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("BKUserCfgAttentionDetectionEnabled"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v30 = MEMORY[0x24BDACB70];
      if (__osLog)
        v50 = __osLog;
      else
        v50 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v59 = "[enabledForAttentionDetection isKindOfClass:[NSNumber class]]";
        v60 = 2048;
        *(_QWORD *)v61 = 0;
        *(_WORD *)&v61[8] = 2080;
        *(_QWORD *)&v61[10] = &unk_21491C593;
        *(_WORD *)&v61[18] = 2080;
        *(_QWORD *)&v61[20] = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biom"
                              "etricKitXPCServer.m";
        v62 = 1024;
        v63 = 6774;
        _os_log_impl(&dword_2148C7000, v50, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v27 = 0;
      v23 = 0;
      goto LABEL_133;
    }
    -[UserProtectedConfig setAttentionDetectionEnabled:](v15, "setAttentionDetectionEnabled:", objc_msgSend(v22, "BOOLValue"));
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("BKUserCfgPeriocularMatchEnabled"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v23)
    goto LABEL_27;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v30 = MEMORY[0x24BDACB70];
    if (__osLog)
      v51 = __osLog;
    else
      v51 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v59 = "[enabledForPeriocularMatch isKindOfClass:[NSNumber class]]";
      v60 = 2048;
      *(_QWORD *)v61 = 0;
      *(_WORD *)&v61[8] = 2080;
      *(_QWORD *)&v61[10] = &unk_21491C593;
      *(_WORD *)&v61[18] = 2080;
      *(_QWORD *)&v61[20] = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biomet"
                            "ricKitXPCServer.m";
      v62 = 1024;
      v63 = 6782;
      _os_log_impl(&dword_2148C7000, v51, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v27 = 0;
LABEL_133:
    v26 = 258;
    goto LABEL_134;
  }
  -[UserProtectedConfig setPeriocularMatchEnabled:](v15, "setPeriocularMatchEnabled:", objc_msgSend(v23, "BOOLValue"));
LABEL_27:
  v24 = -[BiometricKitXPCServer parseAuthDict:toAuthData:](self, "parseAuthDict:toAuthData:", v56, v64);
  if (v24)
  {
    v26 = v24;
    v30 = MEMORY[0x24BDACB70];
    if (__osLog)
      v44 = __osLog;
    else
      v44 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      goto LABEL_80;
    *(_DWORD *)buf = 136316162;
    v59 = "err == 0 ";
    v60 = 2048;
    *(_QWORD *)v61 = v26;
    *(_WORD *)&v61[8] = 2080;
    *(_QWORD *)&v61[10] = &unk_21491C593;
    *(_WORD *)&v61[18] = 2080;
    *(_QWORD *)&v61[20] = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v62 = 1024;
    v63 = 6788;
    goto LABEL_79;
  }
  v25 = -[BiometricKitXPCServer checkCatacombForUser:](self, "checkCatacombForUser:", v8);
  if (v25)
  {
    v26 = v25;
    v30 = MEMORY[0x24BDACB70];
    if (__osLog)
      v44 = __osLog;
    else
      v44 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      goto LABEL_80;
    *(_DWORD *)buf = 136316162;
    v59 = "err == 0 ";
    v60 = 2048;
    *(_QWORD *)v61 = v26;
    *(_WORD *)&v61[8] = 2080;
    *(_QWORD *)&v61[10] = &unk_21491C593;
    *(_WORD *)&v61[18] = 2080;
    *(_QWORD *)&v61[20] = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v62 = 1024;
    v63 = 6792;
LABEL_79:
    _os_log_impl(&dword_2148C7000, v44, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_80:
    v27 = 0;
    goto LABEL_134;
  }
  v57 = 0;
  v26 = -[BiometricKitXPCServer performGetProtectedConfigCommand:outSetCfg:outEffectiveCfg:](self, "performGetProtectedConfigCommand:outSetCfg:outEffectiveCfg:", v8, &v57, 0);
  v27 = v57;
  if (v26)
  {
    v30 = MEMORY[0x24BDACB70];
    if (__osLog)
      v45 = __osLog;
    else
      v45 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      goto LABEL_134;
    *(_DWORD *)buf = 136316162;
    v59 = "err == 0 ";
    v60 = 2048;
    *(_QWORD *)v61 = v26;
    *(_WORD *)&v61[8] = 2080;
    *(_QWORD *)&v61[10] = &unk_21491C593;
    *(_WORD *)&v61[18] = 2080;
    *(_QWORD *)&v61[20] = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v62 = 1024;
    v63 = 6796;
LABEL_96:
    _os_log_impl(&dword_2148C7000, v45, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_134;
  }
  v28 = -[BiometricKitXPCServer performSetProtectedConfigCommand:cfg:authData:](self, "performSetProtectedConfigCommand:cfg:authData:", v8, v15, v64);
  if (v28)
  {
    v26 = v28;
    v30 = MEMORY[0x24BDACB70];
    if (__osLog)
      v45 = __osLog;
    else
      v45 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      goto LABEL_134;
    *(_DWORD *)buf = 136316162;
    v59 = "err == 0 ";
    v60 = 2048;
    *(_QWORD *)v61 = v26;
    *(_WORD *)&v61[8] = 2080;
    *(_QWORD *)&v61[10] = &unk_21491C593;
    *(_WORD *)&v61[18] = 2080;
    *(_QWORD *)&v61[20] = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v62 = 1024;
    v63 = 6800;
    goto LABEL_96;
  }
  v29 = -[UserProtectedConfig unlockEnabled](v15, "unlockEnabled");
  v30 = MEMORY[0x24BDACB70];
  if ((v29 == -1
     || (v31 = -[UserProtectedConfig unlockEnabled](v15, "unlockEnabled"),
         v31 == objc_msgSend(v27, "unlockEnabled")))
    && (-[UserProtectedConfig identificationEnabled](v15, "identificationEnabled") == -1
     || (v32 = -[UserProtectedConfig identificationEnabled](v15, "identificationEnabled"),
         v32 == objc_msgSend(v27, "identificationEnabled")))
    && (-[UserProtectedConfig loginEnabled](v15, "loginEnabled") == -1
     || (v33 = -[UserProtectedConfig loginEnabled](v15, "loginEnabled"),
         v33 == objc_msgSend(v27, "loginEnabled")))
    && (-[UserProtectedConfig applePayEnabled](v15, "applePayEnabled") == -1
     || (v34 = -[UserProtectedConfig applePayEnabled](v15, "applePayEnabled"),
         v34 == objc_msgSend(v27, "applePayEnabled")))
    && (-[UserProtectedConfig attentionDetectionEnabled](v15, "attentionDetectionEnabled") == -1
     || (v35 = -[UserProtectedConfig attentionDetectionEnabled](v15, "attentionDetectionEnabled"),
         v35 == objc_msgSend(v27, "attentionDetectionEnabled")))
    && (-[UserProtectedConfig periocularMatchEnabled](v15, "periocularMatchEnabled") == -1
     || (v36 = -[UserProtectedConfig periocularMatchEnabled](v15, "periocularMatchEnabled"),
         v36 == objc_msgSend(v27, "periocularMatchEnabled")))
    || (v37 = -[BiometricKitXPCServer saveCatacomb](self, "saveCatacomb")) == 0)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.BiometricKit.userProtectedConfigUpdated"), 0, 0, 1u);
    -[BiometricKitXPCServer updateExpressModeState](self, "updateExpressModeState");
    if (__osLogTrace)
      v39 = __osLogTrace;
    else
      v39 = v30;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v59) = 0;
      _os_log_impl(&dword_2148C7000, v39, OS_LOG_TYPE_DEBUG, "setProtectedConfiguration:forUser:withOptions:withClient: -> %d\n", buf, 8u);
    }
    v26 = 0;
    goto LABEL_50;
  }
  v26 = v37;
  if (__osLog)
    v45 = __osLog;
  else
    v45 = v30;
  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v59 = "err == 0 ";
    v60 = 2048;
    *(_QWORD *)v61 = v26;
    *(_WORD *)&v61[8] = 2080;
    *(_QWORD *)&v61[10] = &unk_21491C593;
    *(_WORD *)&v61[18] = 2080;
    *(_QWORD *)&v61[20] = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v62 = 1024;
    v63 = 6815;
    goto LABEL_96;
  }
LABEL_134:
  if (__osLogTrace)
    v52 = __osLogTrace;
  else
    v52 = v30;
  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v59) = v26;
    _os_log_impl(&dword_2148C7000, v52, OS_LOG_TYPE_ERROR, "setProtectedConfiguration:forUser:withOptions:withClient: -> %d\n", buf, 8u);
  }
LABEL_50:

  return v26;
}

- (int)setSystemProtectedConfiguration:(id)a3 withOptions:(id)a4 withClient:(id)a5
{
  char *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  SystemProtectedConfig *v15;
  SystemProtectedConfig *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  int v29;
  id v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  NSObject *v41;
  NSObject *v42;
  int v43;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v45;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  NSObject *v52;
  NSObject *v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v56;
  NSObject *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  uint8_t buf[4];
  const char *v66;
  __int16 v67;
  id v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  const char *v72;
  __int16 v73;
  int v74;
  _OWORD v75[2];
  uint64_t v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v8 = (char *)a3;
  v9 = a4;
  v10 = a5;
  if (__osLogTrace)
    v11 = __osLogTrace;
  else
    v11 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v66 = v8;
    v67 = 2048;
    v68 = v9;
    v69 = 2112;
    v70 = v10;
    _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_DEBUG, "setSystemProtectedConfiguration:withOptions:withClient: %@ %p %@\n", buf, 0x20u);
  }
  v76 = 0;
  memset(v75, 0, sizeof(v75));
  v62 = v10;
  v63 = v9;
  if (isEphemeralMultiUser())
  {
    if (__osLog)
      v47 = __osLog;
    else
      v47 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      goto LABEL_92;
    *(_DWORD *)buf = 136316162;
    v66 = "!isEphemeralMultiUser()";
    v67 = 2048;
    v68 = 0;
    v69 = 2080;
    v70 = &unk_21491C593;
    v71 = 2080;
    v72 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v73 = 1024;
    v74 = 6858;
    goto LABEL_91;
  }
  if (!v8)
  {
    if (__osLog)
      v48 = __osLog;
    else
      v48 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v66 = "configuration";
      v67 = 2048;
      v68 = 0;
      v69 = 2080;
      v70 = &unk_21491C593;
      v71 = 2080;
      v72 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v73 = 1024;
      v74 = 6859;
      _os_log_impl(&dword_2148C7000, v48, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v30 = 0;
    v16 = 0;
    v27 = 0;
    v26 = 0;
    v25 = 0;
    v24 = 0;
    v23 = 0;
    v59 = 0;
    v60 = 0;
    v61 = 0;
    goto LABEL_163;
  }
  objc_msgSend(v10, "exportedObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "effectiveUserIdentifier");

  if (v14)
  {
    if (__osLog)
      v47 = __osLog;
    else
      v47 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      goto LABEL_92;
    *(_DWORD *)buf = 136316162;
    v66 = "userid == 0";
    v67 = 2048;
    v68 = 0;
    v69 = 2080;
    v70 = &unk_21491C593;
    v71 = 2080;
    v72 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v73 = 1024;
    v74 = 6862;
LABEL_91:
    _os_log_impl(&dword_2148C7000, v47, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_92:
    v30 = 0;
    v16 = 0;
    v27 = 0;
    v26 = 0;
    v25 = 0;
    v24 = 0;
    v23 = 0;
    v59 = 0;
    v60 = 0;
    v61 = 0;
    v29 = 257;
    goto LABEL_60;
  }
  v15 = objc_alloc_init(SystemProtectedConfig);
  if (!v15)
  {
    if (__osLog)
      v49 = __osLog;
    else
      v49 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v66 = "cfg";
      v67 = 2048;
      v68 = 0;
      v69 = 2080;
      v70 = &unk_21491C593;
      v71 = 2080;
      v72 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v73 = 1024;
      v74 = 6865;
      _os_log_impl(&dword_2148C7000, v49, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v30 = 0;
    v16 = 0;
    v27 = 0;
    v26 = 0;
    v25 = 0;
    v24 = 0;
    v23 = 0;
    v59 = 0;
    v60 = 0;
    v61 = 0;
    v29 = 261;
    goto LABEL_60;
  }
  v16 = v15;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BKSysCfgTouchIDEnabled"));
  v17 = objc_claimAutoreleasedReturnValue();
  v61 = (void *)v17;
  if (v17)
  {
    v18 = (void *)v17;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (__osLog)
        v51 = __osLog;
      else
        v51 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v66 = "[enabledBiometry isKindOfClass:[NSNumber class]]";
        v67 = 2048;
        v68 = 0;
        v69 = 2080;
        v70 = &unk_21491C593;
        v71 = 2080;
        v72 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v73 = 1024;
        v74 = 6870;
        _os_log_impl(&dword_2148C7000, v51, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v30 = 0;
      v27 = 0;
      v26 = 0;
      v25 = 0;
      v24 = 0;
      v23 = 0;
      v59 = 0;
      v60 = 0;
      goto LABEL_163;
    }
    -[SystemProtectedConfig setBiometryEnabled:](v16, "setBiometryEnabled:", objc_msgSend(v18, "BOOLValue"));
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BKSysCfgTouchIDUnlockEnabled"));
  v19 = objc_claimAutoreleasedReturnValue();
  v60 = (void *)v19;
  if (v19)
  {
    v20 = (void *)v19;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (__osLog)
        v52 = __osLog;
      else
        v52 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v66 = "[enabledForUnlock isKindOfClass:[NSNumber class]]";
        v67 = 2048;
        v68 = 0;
        v69 = 2080;
        v70 = &unk_21491C593;
        v71 = 2080;
        v72 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v73 = 1024;
        v74 = 6877;
        _os_log_impl(&dword_2148C7000, v52, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v30 = 0;
      v27 = 0;
      v26 = 0;
      v25 = 0;
      v24 = 0;
      v23 = 0;
      v59 = 0;
      goto LABEL_163;
    }
    -[SystemProtectedConfig setUnlockEnabled:](v16, "setUnlockEnabled:", objc_msgSend(v20, "BOOLValue"));
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BKSysCfgTouchIDIdentificationEnabled"));
  v21 = objc_claimAutoreleasedReturnValue();
  v59 = (void *)v21;
  if (v21)
  {
    v22 = (void *)v21;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (__osLog)
        v53 = __osLog;
      else
        v53 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v66 = "[enabledForIdentification isKindOfClass:[NSNumber class]]";
        v67 = 2048;
        v68 = 0;
        v69 = 2080;
        v70 = &unk_21491C593;
        v71 = 2080;
        v72 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v73 = 1024;
        v74 = 6884;
        _os_log_impl(&dword_2148C7000, v53, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v30 = 0;
      v27 = 0;
      v26 = 0;
      v25 = 0;
      v24 = 0;
      v23 = 0;
      goto LABEL_163;
    }
    -[SystemProtectedConfig setIdentificationEnabled:](v16, "setIdentificationEnabled:", objc_msgSend(v22, "BOOLValue", v59, v60, v61, v10, v9));
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BKSysCfgTouchIDLoginEnabled"), v59);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (__osLog)
        v54 = __osLog;
      else
        v54 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v66 = "[enabledForLogin isKindOfClass:[NSNumber class]]";
        v67 = 2048;
        v68 = 0;
        v69 = 2080;
        v70 = &unk_21491C593;
        v71 = 2080;
        v72 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v73 = 1024;
        v74 = 6891;
        _os_log_impl(&dword_2148C7000, v54, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v30 = 0;
      v27 = 0;
      v26 = 0;
      v25 = 0;
      v24 = 0;
      goto LABEL_163;
    }
    -[SystemProtectedConfig setLoginEnabled:](v16, "setLoginEnabled:", objc_msgSend(v23, "BOOLValue"));
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BKSysCfgTouchIDUnlockTokenMaxLifetime"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (__osLog)
        v55 = __osLog;
      else
        v55 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v66 = "[bioTokenLifespan isKindOfClass:[NSNumber class]]";
        v67 = 2048;
        v68 = 0;
        v69 = 2080;
        v70 = &unk_21491C593;
        v71 = 2080;
        v72 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v73 = 1024;
        v74 = 6897;
        _os_log_impl(&dword_2148C7000, v55, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v30 = 0;
      v27 = 0;
      v26 = 0;
      v25 = 0;
      goto LABEL_163;
    }
    -[SystemProtectedConfig setUnlockTokenMaxLifetime:](v16, "setUnlockTokenMaxLifetime:", objc_msgSend(v24, "intValue"));
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BKSysCfgTouchIDBioMatchLifespan"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (__osLog)
        v56 = __osLog;
      else
        v56 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v66 = "[bioMatchLifespan isKindOfClass:[NSNumber class]]";
        v67 = 2048;
        v68 = 0;
        v69 = 2080;
        v70 = &unk_21491C593;
        v71 = 2080;
        v72 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v73 = 1024;
        v74 = 6903;
        _os_log_impl(&dword_2148C7000, v56, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v30 = 0;
      v27 = 0;
      v26 = 0;
      goto LABEL_163;
    }
    -[SystemProtectedConfig setBioMatchLifespan:](v16, "setBioMatchLifespan:", objc_msgSend(v25, "intValue"));
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BKSysCfgTouchIDPasscodeInputLifespan"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (__osLog)
        v57 = __osLog;
      else
        v57 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v66 = "[passcodeInputLifespan isKindOfClass:[NSNumber class]]";
        v67 = 2048;
        v68 = 0;
        v69 = 2080;
        v70 = &unk_21491C593;
        v71 = 2080;
        v72 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v73 = 1024;
        v74 = 6909;
        _os_log_impl(&dword_2148C7000, v57, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v30 = 0;
      v27 = 0;
      goto LABEL_163;
    }
    -[SystemProtectedConfig setPasscodeInputLifespan:](v16, "setPasscodeInputLifespan:", objc_msgSend(v26, "intValue"));
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BKSysCfgPeriocularMatchEnabled"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v27)
    goto LABEL_34;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (__osLog)
      v58 = __osLog;
    else
      v58 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v66 = "[enabledForPeriocularMatch isKindOfClass:[NSNumber class]]";
      v67 = 2048;
      v68 = 0;
      v69 = 2080;
      v70 = &unk_21491C593;
      v71 = 2080;
      v72 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v73 = 1024;
      v74 = 6917;
      _os_log_impl(&dword_2148C7000, v58, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v30 = 0;
LABEL_163:
    v29 = 258;
    goto LABEL_60;
  }
  -[SystemProtectedConfig setPeriocularMatchEnabled:](v16, "setPeriocularMatchEnabled:", objc_msgSend(v27, "BOOLValue"));
LABEL_34:
  v28 = -[BiometricKitXPCServer parseAuthDict:toAuthData:](self, "parseAuthDict:toAuthData:", v9, v75);
  if (v28)
  {
    v29 = v28;
    if (__osLog)
      v50 = __osLog;
    else
      v50 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v66 = "err == 0 ";
      v67 = 2048;
      v68 = (id)v29;
      v69 = 2080;
      v70 = &unk_21491C593;
      v71 = 2080;
      v72 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v73 = 1024;
      v74 = 6923;
      _os_log_impl(&dword_2148C7000, v50, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v30 = 0;
    goto LABEL_60;
  }
  v64 = 0;
  v29 = -[BiometricKitXPCServer performGetSystemProtectedConfigCommand:](self, "performGetSystemProtectedConfigCommand:", &v64);
  v30 = v64;
  if (v29)
  {
    if (__osLog)
      v41 = __osLog;
    else
      v41 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      goto LABEL_60;
    *(_DWORD *)buf = 136316162;
    v66 = "err == 0 ";
    v67 = 2048;
    v68 = (id)v29;
    v69 = 2080;
    v70 = &unk_21491C593;
    v71 = 2080;
    v72 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v73 = 1024;
    v74 = 6927;
LABEL_59:
    _os_log_impl(&dword_2148C7000, v41, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_60:
    if (__osLogTrace)
      v42 = __osLogTrace;
    else
      v42 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v66) = v29;
      _os_log_impl(&dword_2148C7000, v42, OS_LOG_TYPE_ERROR, "setSystemProtectedConfiguration:withOptions:withClient: -> %d\n", buf, 8u);
    }
    goto LABEL_74;
  }
  v31 = -[BiometricKitXPCServer performSetSystemProtectedConfigCommand:authData:](self, "performSetSystemProtectedConfigCommand:authData:", v16, v75);
  if (v31)
  {
    v29 = v31;
    if (__osLog)
      v41 = __osLog;
    else
      v41 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      goto LABEL_60;
    *(_DWORD *)buf = 136316162;
    v66 = "err == 0 ";
    v67 = 2048;
    v68 = (id)v29;
    v69 = 2080;
    v70 = &unk_21491C593;
    v71 = 2080;
    v72 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v73 = 1024;
    v74 = 6931;
    goto LABEL_59;
  }
  if (-[SystemProtectedConfig biometryEnabled](v16, "biometryEnabled") != -1)
  {
    v32 = -[SystemProtectedConfig biometryEnabled](v16, "biometryEnabled");
    if (v32 != objc_msgSend(v30, "biometryEnabled"))
      goto LABEL_53;
  }
  if (-[SystemProtectedConfig unlockEnabled](v16, "unlockEnabled") != -1
    && (v33 = -[SystemProtectedConfig unlockEnabled](v16, "unlockEnabled"),
        v33 != objc_msgSend(v30, "unlockEnabled"))
    || -[SystemProtectedConfig identificationEnabled](v16, "identificationEnabled") != -1
    && (v34 = -[SystemProtectedConfig identificationEnabled](v16, "identificationEnabled"),
        v34 != objc_msgSend(v30, "identificationEnabled"))
    || -[SystemProtectedConfig loginEnabled](v16, "loginEnabled") != -1
    && (v35 = -[SystemProtectedConfig loginEnabled](v16, "loginEnabled"),
        v35 != objc_msgSend(v30, "loginEnabled"))
    || -[SystemProtectedConfig unlockTokenMaxLifetime](v16, "unlockTokenMaxLifetime") != -1
    && (v36 = -[SystemProtectedConfig unlockTokenMaxLifetime](v16, "unlockTokenMaxLifetime"),
        v36 != objc_msgSend(v30, "unlockTokenMaxLifetime"))
    || -[SystemProtectedConfig bioMatchLifespan](v16, "bioMatchLifespan") != -1
    && (v37 = -[SystemProtectedConfig bioMatchLifespan](v16, "bioMatchLifespan"),
        v37 != objc_msgSend(v30, "bioMatchLifespan"))
    || -[SystemProtectedConfig passcodeInputLifespan](v16, "passcodeInputLifespan") != -1
    && (v38 = -[SystemProtectedConfig passcodeInputLifespan](v16, "passcodeInputLifespan"),
        v38 != objc_msgSend(v30, "passcodeInputLifespan"))
    || -[SystemProtectedConfig periocularMatchEnabled](v16, "periocularMatchEnabled") != -1
    && (v39 = -[SystemProtectedConfig periocularMatchEnabled](v16, "periocularMatchEnabled"),
        v39 != objc_msgSend(v30, "periocularMatchEnabled")))
  {
LABEL_53:
    v40 = -[BiometricKitXPCServer saveCatacomb](self, "saveCatacomb");
    if (v40)
    {
      v29 = v40;
      if (__osLog)
        v41 = __osLog;
      else
        v41 = MEMORY[0x24BDACB70];
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        goto LABEL_60;
      *(_DWORD *)buf = 136316162;
      v66 = "err == 0 ";
      v67 = 2048;
      v68 = (id)v29;
      v69 = 2080;
      v70 = &unk_21491C593;
      v71 = 2080;
      v72 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v73 = 1024;
      v74 = 6965;
      goto LABEL_59;
    }
    if (!-[SystemProtectedConfig biometryEnabled](v16, "biometryEnabled"))
    {
      v43 = -[SystemProtectedConfig biometryEnabled](v16, "biometryEnabled");
      if (v43 != objc_msgSend(v30, "biometryEnabled"))
      {
        -[BiometricKitXPCServer syncTemplateListForUser:](self, "syncTemplateListForUser:", 0xFFFFFFFFLL);
        -[BiometricKitXPCServer deleteUnusedCatacombFiles](self, "deleteUnusedCatacombFiles");
      }
    }
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.BiometricKit.systemProtectedConfigUpdated"), 0, 0, 1u);
  -[BiometricKitXPCServer updateExpressModeState](self, "updateExpressModeState");
  if (__osLogTrace)
    v45 = __osLogTrace;
  else
    v45 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v66) = 0;
    _os_log_impl(&dword_2148C7000, v45, OS_LOG_TYPE_DEBUG, "setSystemProtectedConfiguration:withOptions:withClient: -> %d\n", buf, 8u);
  }
  v29 = 0;
LABEL_74:

  return v29;
}

- (int)performCancelCommand
{
  return 262;
}

- (int)performEnrollCommand:(id)a3
{
  return 262;
}

- (int)performMatchCommand:(id)a3
{
  return 262;
}

- (int)performPresenceDetectCommand:(id)a3
{
  return 262;
}

- (int)performDisplayStatusChangedCommand:(BOOL)a3
{
  return 262;
}

- (int)performGetIdentitiesListCommand:(unsigned int)a3 outBuffer:(id)a4
{
  return 262;
}

- (int)performGetCatacombStateCommand:(id)a3
{
  return 262;
}

- (int)performGetTemplatesValidityCommand:(unsigned int)a3 isValid:(BOOL *)a4
{
  return 262;
}

- (int)performRemoveIdentityCommand:(id *)a3
{
  return 262;
}

- (int)performGetBiometrickitdInfoCommand:(id *)a3
{
  return 262;
}

- (int)performRemoveUserDataCommand:(unsigned int)a3
{
  return 262;
}

- (int)performPrepareSaveCatacombCommand:(id)a3 outDataSize:(unsigned int *)a4
{
  return 262;
}

- (int)performCompleteSaveCatacombCommand:(id)a3 outBuffer:(id)a4
{
  return 262;
}

- (int)performConfirmSaveCatacombCommand:(id)a3
{
  return 262;
}

- (int)performNoCatacombCommand:(unsigned int)a3
{
  return 262;
}

- (int)performLoadCatacombCommand:(id)a3 inData:(id)a4
{
  return 262;
}

- (int)performSaveBioLockoutRecordCommand:(id)a3
{
  return 262;
}

- (int)performLoadBioLockoutRecordCommand:(id)a3
{
  return 262;
}

- (int)performRequestMaxIdentityCountCommand:(unsigned int *)a3
{
  return 262;
}

- (int)performGetFreeIdentityCountCommand:(unsigned int)a3 outCount:(unsigned int *)a4
{
  return 262;
}

- (int)performGetCatacombUUIDCommand:(unsigned int)a3 outUUID:(id *)a4
{
  return 262;
}

- (int)performGetCatacombHashCommand:(unsigned int)a3 outHash:(id *)a4
{
  return 262;
}

- (int)performDropUnlockTokenCommand
{
  return 262;
}

- (int)performForceBioLockoutCommand:(unsigned int)a3
{
  return 262;
}

- (int)performGetSKSLockStateCommand:(unsigned int)a3 outState:(unsigned int *)a4
{
  return 262;
}

- (int)performIsXARTAvailableCommand:(BOOL *)a3
{
  return 262;
}

- (int)performGetLastMatchEventCommand:(id *)a3
{
  return 262;
}

- (int)performGetDeviceHardwareStateCommand:(unsigned int *)a3
{
  return 262;
}

- (int)performGetProtectedConfigCommand:(unsigned int)a3 outSetCfg:(id *)a4 outEffectiveCfg:(id *)a5
{
  return 262;
}

- (int)performGetSystemProtectedConfigCommand:(id *)a3
{
  return 262;
}

- (int)performSetProtectedConfigCommand:(unsigned int)a3 cfg:(id)a4 authData:(id *)a5
{
  return 262;
}

- (int)performSetSystemProtectedConfigCommand:(id)a3 authData:(id *)a4
{
  return 262;
}

- (int)performRequestMessageDataCommand:(unint64_t)a3 size:(unint64_t)a4 outData:(id *)a5
{
  return 262;
}

- (int)performGetCatacombGroupStateCommand:(id)a3
{
  return 262;
}

- (int)performGetIdentityRecordsCommand:(id)a3
{
  return 262;
}

- (int)performGetBioDeviceListCommand:(id)a3
{
  return 262;
}

- (int)performGetFreeIdentityCountCommand:(unsigned int)a3 group:(id *)a4 outCount:(unsigned int *)a5
{
  return 262;
}

- (unsigned)serviceConnect
{
  return 0;
}

- (void)doSharedMemoryTransfers
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unsigned int *v9;
  int v10;
  unsigned int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int *v19;
  uint64_t v20;
  void *v21;
  int v22;
  int v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  int v31;
  NSObject *v32;
  NSObject *v33;
  os_log_type_t v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  unint64_t v42;
  unsigned int *v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  int v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  if (__osLogTrace)
    v2 = __osLogTrace;
  else
    v2 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2148C7000, v2, OS_LOG_TYPE_DEBUG, "doSharedMemoryTransfers\n", buf, 2u);
  }
  v3 = (void *)os_transaction_create();
  v4 = (void *)MEMORY[0x2199D8AE0]();
  v5 = -[BiometricKitXPCServer serviceConnect](self, "serviceConnect");
  if (!(_DWORD)v5)
  {
    if (__osLog)
      v37 = __osLog;
    else
      v37 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v45 = "connect";
      v46 = 2048;
      v47 = 0;
      v48 = 2080;
      v49 = &unk_21491C593;
      v50 = 2080;
      v51 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v52 = 1024;
      v53 = 7395;
      _os_log_impl(&dword_2148C7000, v37, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v8 = 0;
    v31 = 268;
    goto LABEL_61;
  }
  v6 = v5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (__osLog)
      v38 = __osLog;
    else
      v38 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v45 = "dataArray";
      v46 = 2048;
      v47 = 0;
      v48 = 2080;
      v49 = &unk_21491C593;
      v50 = 2080;
      v51 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v52 = 1024;
      v53 = 7398;
      _os_log_impl(&dword_2148C7000, v38, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v8 = 0;
    v31 = 260;
    goto LABEL_61;
  }
  v8 = (void *)v7;
  v39 = v4;
  v40 = v3;
  v9 = (unsigned int *)MEMORY[0x24BDAEC58];
  while (1)
  {
    v42 = 0;
    v43 = 0;
    v10 = MEMORY[0x2199D8474](v6, 0, *v9, &v43, &v42, 4097);
    if (v10)
      break;
    if (v42 <= 0xF)
    {
      if (__osLog)
        v28 = __osLog;
      else
        v28 = MEMORY[0x24BDACB70];
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        goto LABEL_22;
      *(_DWORD *)buf = 136316162;
      v45 = "size >= sizeof(*transfer)";
      v46 = 2048;
      v47 = 0;
      v48 = 2080;
      v49 = &unk_21491C593;
      v50 = 2080;
      v51 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v52 = 1024;
      v53 = 7413;
      v29 = v28;
LABEL_49:
      _os_log_impl(&dword_2148C7000, v29, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      goto LABEL_22;
    }
    v11 = v43;
    v12 = v43[1];
    v13 = 8 * v12;
    v14 = *((_QWORD *)v43 + 1);
    if (v14)
    {
      if (v13 + 16 + v14 > v42)
      {
        if (__osLog)
          v30 = __osLog;
        else
          v30 = MEMORY[0x24BDACB70];
        if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          goto LABEL_22;
        *(_DWORD *)buf = 136316162;
        v45 = "offset + transfer->headerLength <= size";
        v46 = 2048;
        v47 = 0;
        v48 = 2080;
        v49 = &unk_21491C593;
        v50 = 2080;
        v51 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v52 = 1024;
        v53 = 7420;
        v29 = v30;
        goto LABEL_49;
      }
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", &v43[(unint64_t)v13 / 4 + 4]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *((_QWORD *)v11 + 1);
      if (v11[1])
      {
LABEL_16:
        v17 = 0;
        v18 = (v13 + v16 + *MEMORY[0x24BDB03C8] + 15) & -*MEMORY[0x24BDB03C8];
        v19 = v11 + 4;
        while (*(_QWORD *)&v19[2 * v17] + v18 <= v42)
        {
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", (char *)v43 + v18);
          v20 = objc_claimAutoreleasedReturnValue();
          if (!v20)
          {
            if (__osLog)
              v27 = __osLog;
            else
              v27 = MEMORY[0x24BDACB70];
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              v45 = "data";
              v46 = 2048;
              v47 = 0;
              v48 = 2080;
              v49 = &unk_21491C593;
              v50 = 2080;
              v51 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
              v52 = 1024;
              v53 = 7430;
              v26 = v27;
              goto LABEL_38;
            }
            goto LABEL_21;
          }
          v21 = (void *)v20;
          objc_msgSend(v8, "addObject:", v20);
          v18 += *(_QWORD *)&v19[2 * v17];

          if (++v17 >= (unint64_t)v11[1])
            goto LABEL_20;
        }
        if (__osLog)
          v25 = __osLog;
        else
          v25 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v45 = "offset + transfer->lengths[i] <= size";
          v46 = 2048;
          v47 = 0;
          v48 = 2080;
          v49 = &unk_21491C593;
          v50 = 2080;
          v51 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
          v52 = 1024;
          v53 = 7428;
          v26 = v25;
LABEL_38:
          _os_log_impl(&dword_2148C7000, v26, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          goto LABEL_21;
        }
        goto LABEL_21;
      }
    }
    else
    {
      v16 = 0;
      v15 = 0;
      if ((_DWORD)v12)
        goto LABEL_16;
    }
LABEL_20:
    -[BiometricKitXPCServer handleSharedMemoryTransfer:withHeader:data:](self, "handleSharedMemoryTransfer:withHeader:data:", *v11, v15, v8, v39, v40);
LABEL_21:

LABEL_22:
    objc_msgSend(v8, "removeAllObjects", v39, v40);
    v22 = MEMORY[0x2199D848C](v6, 1, *v9, v43);
    if (v22)
    {
      v23 = v22;
      if (__osLog)
        v24 = __osLog;
      else
        v24 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v45 = "IOConnectUnmapMemory(connect, kAppleBiometricLastSharedMemoryTransferComplete, mach_task_self_, address) == 0 ";
        v46 = 2048;
        v47 = v23;
        v48 = 2080;
        v49 = &unk_21491C593;
        v50 = 2080;
        v51 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        v52 = 1024;
        v53 = 7439;
        _os_log_impl(&dword_2148C7000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
  }
  v31 = v10;
  if (v10 == -536870206)
  {
    if (__osLogTrace)
      v32 = __osLogTrace;
    else
      v32 = MEMORY[0x24BDACB70];
    v4 = v39;
    v3 = v40;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v45) = 0;
      v33 = v32;
      v34 = OS_LOG_TYPE_DEBUG;
      goto LABEL_66;
    }
    goto LABEL_67;
  }
  if (__osLog)
    v35 = __osLog;
  else
    v35 = MEMORY[0x24BDACB70];
  v4 = v39;
  v3 = v40;
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v45 = "err == 0 ";
    v46 = 2048;
    v47 = v31;
    v48 = 2080;
    v49 = &unk_21491C593;
    v50 = 2080;
    v51 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
    v52 = 1024;
    v53 = 7411;
    _os_log_impl(&dword_2148C7000, v35, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_61:
  if (__osLogTrace)
    v36 = __osLogTrace;
  else
    v36 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v45) = v31;
    v33 = v36;
    v34 = OS_LOG_TYPE_ERROR;
LABEL_66:
    _os_log_impl(&dword_2148C7000, v33, v34, "doSharedMemoryTransfers -> %{errno}d\n", buf, 8u);
  }
LABEL_67:

  objc_autoreleasePoolPop(v4);
}

- (void)handleSharedMemoryTransfer:(unsigned int)a3 withHeader:(id)a4 data:(id)a5
{
  NSObject *v5;
  uint8_t v6[16];

  if (__osLog)
    v5 = __osLog;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2148C7000, v5, OS_LOG_TYPE_ERROR, "handleSharedMemoryTransfer must be overriden in subclass to do shared memory transfers!\n", v6, 2u);
  }
}

- (void)setGracePeriod:(unint64_t)a3
{
  NSObject *v4;
  _QWORD block[5];

  dispatch_get_global_queue(21, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__BiometricKitXPCServer_setGracePeriod___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  dispatch_async(v4, block);

}

void __40__BiometricKitXPCServer_setGracePeriod___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v2 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v3 = __osLogTrace;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_2148C7000, v3, OS_LOG_TYPE_DEBUG, "setGracePeriod\n", (uint8_t *)&v10, 2u);
  }
  v20 = CFSTR("GracePeriod");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = MKBDeviceSetGracePeriod();
  if (v6)
  {
    v8 = v6;
    if (__osLog)
      v9 = __osLog;
    else
      v9 = v2;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 136316162;
      v11 = "result == 0 ";
      v12 = 2048;
      v13 = v8;
      v14 = 2080;
      v15 = &unk_21491C593;
      v16 = 2080;
      v17 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v18 = 1024;
      v19 = 7465;
      _os_log_impl(&dword_2148C7000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v10, 0x30u);
    }
  }
  else
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.BiometricKit.passcodeGracePeriodChanged"), 0, 0, 1u);
  }

}

- (int)registerDSID:(unint64_t)a3 withOptions:(id)a4 withClient:(id)a5
{
  return 45;
}

- (int)registerStoreToken:(id)a3 withClient:(id)a4
{
  return 45;
}

- (int)getCountersignedStoreToken:(id *)a3 withClient:(id)a4
{
  return 45;
}

- (int)diagnostics:(int)a3 withOptions:(id)a4 passed:(BOOL *)a5 withDetails:(id *)a6 withClient:(id)a7
{
  return 45;
}

- (int)setUserDSID:(unint64_t)a3 withOptions:(id)a4 withClient:(id)a5
{
  return 45;
}

- (int)resetAppleConnectCounterWithClient:(id)a3
{
  return 45;
}

- (int)enrollContinue
{
  return 45;
}

- (id)pullAlignmentData
{
  return 0;
}

- (id)pullMatchPolicyInfoData
{
  return 0;
}

- (id)getNodeTopologyForIdentity:(id)a3 withClient:(id)a4
{
  return 0;
}

- (BOOL)getEnabledForUnlock
{
  return 0;
}

- (int)setAppleMesaSEPLoggingLevel
{
  return 45;
}

- (int64_t)getProvisioningStateWithClient:(id)a3
{
  return -1;
}

- (BOOL)isFingerOnWithClient:(id)a3
{
  return 0;
}

- (int)enableBackgroundFdet:(BOOL)a3 withClient:(id)a4
{
  return 45;
}

- (int64_t)getDeviceStateWithClient:(id)a3
{
  return -1;
}

- (int)startNewMatchAttemptWithClient:(id)a3
{
  return 0;
}

- (int)completeEnrollmentWithClient:(id)a3
{
  return 0;
}

- (int)suspendEnrollment:(BOOL)a3 withClient:(id)a4
{
  return 0;
}

- (int)setTemplate:(id)a3 forIdentity:(id)a4 withClient:(id)a5
{
  return 0;
}

- (int)isPeriocularEnrollmentSupported:(BOOL *)a3 withClient:(id)a4
{
  return 0;
}

- (int)getPeriocularMatchStateForUser:(unsigned int)a3 state:(int64_t *)a4 withClient:(id)a5
{
  return 0;
}

- (int)removePeriocularTemplatesWithOptions:(id)a3 withClient:(id)a4
{
  return 0;
}

- (int)queryIdentityMigrationFailureForUser:(unsigned int)a3 failed:(BOOL *)a4 clear:(BOOL)a5 withClient:(id)a6
{
  return 0;
}

- (int)enableMatchAutoRetry:(BOOL)a3 withClient:(id)a4
{
  return 0;
}

- (int)pauseFaceDetectTimer:(BOOL)a3 withClient:(id)a4
{
  return 0;
}

- (id)pullCalibrationDataWithClient:(id)a3
{
  return 0;
}

- (id)pullCaptureBufferWithClient:(id)a3
{
  return 0;
}

- (int)setDebugImages:(BOOL)a3 withClient:(id)a4
{
  return 45;
}

- (id)pullDebugImageData:(BOOL)a3 rotated:(BOOL)a4 hasWidth:(unsigned int *)a5 hasHeight:(unsigned int *)a6 withClient:(id)a7
{
  return 0;
}

- (int64_t)getSensorCalibrationStatusWithClient:(id)a3
{
  return -1;
}

- (id)getCalibrationDataInfoWithClient:(id)a3
{
  return 0;
}

- (id)getSensorInfoWithClient:(id)a3
{
  return 0;
}

- (id)getLogs:(BOOL)a3 withDetails:(id *)a4
{
  return 0;
}

- (BOOL)fileRadarWithLogs:(id)a3 withDescription:(id)a4
{
  return 0;
}

- (void)serviceStatus:(unsigned int)a3 type:(unsigned int)a4 inValue:(void *)a5
{
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  unsigned int v23;
  unsigned int v24;
  uint8_t buf[4];
  _BYTE v26[30];
  _BYTE v27[10];
  _BYTE v28[10];
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v24 = a4;
  v9 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v10 = __osLogTrace;
  else
    v10 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)v26 = a3;
    *(_WORD *)&v26[4] = 1024;
    *(_DWORD *)&v26[6] = a4;
    *(_WORD *)&v26[10] = 1024;
    *(_DWORD *)&v26[12] = (_DWORD)a5;
    *(_WORD *)&v26[16] = 1024;
    *(_DWORD *)&v26[18] = (_DWORD)a5;
    _os_log_impl(&dword_2148C7000, v10, OS_LOG_TYPE_DEBUG, "serviceStatus:type:inValue: %u 0x%x %u(0x%x)\n", buf, 0x1Au);
  }
  v23 = 0;
  v21 = 0;
  v22 = 0;
  v19 = 0;
  v20 = 0;
  v11 = MCDMExtractMessageData(&v24, &v23, (uint64_t *)a5, &v22, &v20, &v21, &v19);
  v12 = v11;
  if (v20)
  {
    if (a5 && v11)
    {
      v13 = -[BiometricKitXPCServer performRequestMessageDataCommand:size:outData:](self, "performRequestMessageDataCommand:size:outData:", v11);
      v14 = 0;
      if (v13)
      {
        if (__osLog)
          v15 = __osLog;
        else
          v15 = v9;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v26 = "err == 0 ";
          *(_WORD *)&v26[8] = 2048;
          *(_QWORD *)&v26[10] = v13;
          *(_WORD *)&v26[18] = 2080;
          *(_QWORD *)&v26[20] = &unk_21491C593;
          *(_WORD *)&v26[28] = 2080;
          *(_QWORD *)v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biometr"
                           "icKitXPCServer.m";
          *(_WORD *)&v27[8] = 1024;
          *(_DWORD *)v28 = 7872;
LABEL_29:
          _os_log_impl(&dword_2148C7000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          goto LABEL_23;
        }
        goto LABEL_23;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v22);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v14 = 0;
  }
  if (__osLog)
    v16 = __osLog;
  else
    v16 = v9;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67111170;
    *(_DWORD *)v26 = v24;
    *(_WORD *)&v26[4] = 2048;
    *(_QWORD *)&v26[6] = v12;
    *(_WORD *)&v26[14] = 1024;
    *(_DWORD *)&v26[16] = v23;
    *(_WORD *)&v26[20] = 2048;
    *(_QWORD *)&v26[22] = v22;
    *(_WORD *)v27 = 2048;
    *(_QWORD *)&v27[2] = v20;
    *(_WORD *)v28 = 2112;
    *(_QWORD *)&v28[2] = v14;
    v29 = 2048;
    v30 = v21;
    v31 = 2048;
    v32 = v21;
    v33 = 2048;
    v34 = v19;
    _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_DEBUG, "serviceStatus:type:inValue: MCDMExtractMessageData %u %llu %u %p %zu %@ %llu(0x%llx) %llu\n", buf, 0x54u);
  }
  v17 = -[BiometricKitXPCServer serviceStatus:version:ordinal:data:timestamp:](self, "serviceStatus:version:ordinal:data:timestamp:", v24, v23, v21, v14, v19);
  if (v17)
  {
    v18 = v17;
    v15 = (__osLog ? __osLog : v9);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v26 = "err == 0 ";
      *(_WORD *)&v26[8] = 2048;
      *(_QWORD *)&v26[10] = v18;
      *(_WORD *)&v26[18] = 2080;
      *(_QWORD *)&v26[20] = &unk_21491C593;
      *(_WORD *)&v26[28] = 2080;
      *(_QWORD *)v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      *(_WORD *)&v27[8] = 1024;
      *(_DWORD *)v28 = 7883;
      goto LABEL_29;
    }
  }
LABEL_23:

}

- (int)serviceStatus:(unsigned int)a3 version:(unsigned int)a4 ordinal:(unint64_t)a5 data:(id)a6 timestamp:(unint64_t)a7
{
  id v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  NSObject *v21;
  int v22;
  _BYTE v23[10];
  _BYTE v24[10];
  _BYTE v25[10];
  _BYTE v26[10];
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v12 = a6;
  v13 = MEMORY[0x24BDACB70];
  if (__osLog)
    v14 = __osLog;
  else
    v14 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v22 = 67110146;
    *(_DWORD *)v23 = a3;
    *(_WORD *)&v23[4] = 1024;
    *(_DWORD *)&v23[6] = a4;
    *(_WORD *)v24 = 2048;
    *(_QWORD *)&v24[2] = a5;
    *(_WORD *)v25 = 2112;
    *(_QWORD *)&v25[2] = v12;
    *(_WORD *)v26 = 2048;
    *(_QWORD *)&v26[2] = a7;
    _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_DEBUG, "serviceStatus:version:ordinal:data:timestamp: 0x%x 0x%x 0x%llx %@ %llu\n", (uint8_t *)&v22, 0x2Cu);
  }
  v15 = 0;
  if ((int)a3 > -469794561)
  {
    if (a3 != -469794560 && a3 != -469794304)
    {
      if (a3 == -469793536)
      {
        if (a4 != 1)
        {
          if (__osLog)
            v21 = __osLog;
          else
            v21 = v13;
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            goto LABEL_24;
          v22 = 136316162;
          *(_QWORD *)v23 = "msgVersion == 1";
          *(_WORD *)&v23[8] = 2048;
          *(_QWORD *)v24 = 0;
          *(_WORD *)&v24[8] = 2080;
          *(_QWORD *)v25 = &unk_21491C593;
          *(_WORD *)&v25[8] = 2080;
          *(_QWORD *)v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biometr"
                           "icKitXPCServer.m";
          *(_WORD *)&v26[8] = 1024;
          v27 = 7908;
          v17 = "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n";
          goto LABEL_41;
        }
        if ((-[CatacombStateCache sendAutoBugCaptureEvent:](self->_catacombStateCache, "sendAutoBugCaptureEvent:", a5) & 1) != 0)
          goto LABEL_17;
        if (__osLog)
          v21 = __osLog;
        else
          v21 = v13;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v22 = 136316162;
          *(_QWORD *)v23 = "status";
          *(_WORD *)&v23[8] = 2048;
          *(_QWORD *)v24 = 0;
          *(_WORD *)&v24[8] = 2080;
          *(_QWORD *)v25 = &unk_21491C593;
          *(_WORD *)&v25[8] = 2080;
          *(_QWORD *)v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/Biometr"
                           "icKitXPCServer.m";
          *(_WORD *)&v26[8] = 1024;
          v27 = 7911;
          v17 = "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n";
          goto LABEL_41;
        }
LABEL_24:
        v15 = 263;
        goto LABEL_25;
      }
LABEL_18:
      if (__osLog)
        v16 = __osLog;
      else
        v16 = v13;
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      v22 = 67109120;
      *(_DWORD *)v23 = a3;
      v17 = "serviceStatus: Unknown message type: 0x%x\n";
      v18 = v16;
      v19 = 8;
      goto LABEL_23;
    }
  }
  else if (a3 != -536870384 && a3 != -536870352)
  {
    if (a3 == -469794815)
    {
      if (a4 == 1)
      {
        -[BiometricKitXPCServer statusMessage:withData:timestamp:](self, "statusMessage:withData:timestamp:", a5, v12, a7);
LABEL_17:
        v15 = 0;
        goto LABEL_25;
      }
      if (__osLog)
        v21 = __osLog;
      else
        v21 = v13;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = 136316162;
        *(_QWORD *)v23 = "msgVersion == 1";
        *(_WORD *)&v23[8] = 2048;
        *(_QWORD *)v24 = 0;
        *(_WORD *)&v24[8] = 2080;
        *(_QWORD *)v25 = &unk_21491C593;
        *(_WORD *)&v25[8] = 2080;
        *(_QWORD *)v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
        *(_WORD *)&v26[8] = 1024;
        v27 = 7902;
        v17 = "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n";
LABEL_41:
        v18 = v21;
        v19 = 48;
LABEL_23:
        _os_log_impl(&dword_2148C7000, v18, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v22, v19);
        goto LABEL_24;
      }
      goto LABEL_24;
    }
    goto LABEL_18;
  }
LABEL_25:

  return v15;
}

- (IONotificationPort)notifyport
{
  return *(IONotificationPort **)&self->_connectedAccessoriesChgNtfTokenValid;
}

- (OS_dispatch_queue)cmdDispatchQueue
{
  return self->_notifyport;
}

- (BOOL)ariadneSignposts
{
  return BYTE1(self->_mkbLockStatusNtfToken);
}

- (void)setAriadneSignposts:(BOOL)a3
{
  BYTE1(self->_mkbLockStatusNtfToken) = a3;
}

- (NSMutableArray)bioOpsQueue
{
  return (NSMutableArray *)self->_cmdDispatchQueue;
}

- (NSMutableArray)activeBioOpsQueue
{
  return self->_bioOpsQueue;
}

- (BiometricOperation)runningBioOp
{
  return (BiometricOperation *)self->_activeBioOpsQueue;
}

- (ActivityTracker)ongoingCatacombSaveTimer
{
  return (ActivityTracker *)self->_runningBioOp;
}

- (ActivityTracker)ongoingBiometricOperation
{
  return self->_ongoingCatacombSaveTimer;
}

- (NSMutableArray)cachedIdentities
{
  return (NSMutableArray *)self->_ongoingBiometricOperation;
}

- (NSRecursiveLock)catacombLock
{
  return (NSRecursiveLock *)self->_cachedIdentities;
}

- (BKCatacomb)catacomb
{
  return (BKCatacomb *)self->_catacombLock;
}

- (BOOL)templatesAtBoot
{
  return BYTE2(self->_mkbLockStatusNtfToken);
}

- (void)setTemplatesAtBoot:(BOOL)a3
{
  BYTE2(self->_mkbLockStatusNtfToken) = a3;
}

- (void)setCatacombFileAccessed:(BOOL)a3
{
  HIBYTE(self->_mkbLockStatusNtfToken) = a3;
}

- (BOOL)catacombRestored
{
  return self->_connectedAccessoriesChgNtfToken;
}

- (void)setCatacombRestored:(BOOL)a3
{
  LOBYTE(self->_connectedAccessoriesChgNtfToken) = a3;
}

- (CatacombStateCache)catacombStateCache
{
  return (CatacombStateCache *)self->_catacomb;
}

- (BiometricAutoBugCapture)biometricABC
{
  return (BiometricAutoBugCapture *)self->_catacombStateCache;
}

- (void)setBiometricABC:(id)a3
{
  objc_storeStrong((id *)&self->_catacombStateCache, a3);
}

- (OS_dispatch_queue)biometricABCDispatchQueue
{
  return (OS_dispatch_queue *)self->_biometricABC;
}

- (void)setBiometricABCDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_biometricABC, a3);
}

- (NSMutableSet)accessories
{
  return (NSMutableSet *)self->_biometricABCDispatchQueue;
}

- (EntitlementABCIssueReporter)reporter
{
  return (EntitlementABCIssueReporter *)self->_accessories;
}

- (void)setReporter:(id)a3
{
  objc_storeStrong((id *)&self->_accessories, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_biometricABCDispatchQueue, 0);
  objc_storeStrong((id *)&self->_biometricABC, 0);
  objc_storeStrong((id *)&self->_catacombStateCache, 0);
  objc_storeStrong((id *)&self->_catacomb, 0);
  objc_storeStrong((id *)&self->_catacombLock, 0);
  objc_storeStrong((id *)&self->_cachedIdentities, 0);
  objc_storeStrong((id *)&self->_ongoingBiometricOperation, 0);
  objc_storeStrong((id *)&self->_ongoingCatacombSaveTimer, 0);
  objc_storeStrong((id *)&self->_runningBioOp, 0);
  objc_storeStrong((id *)&self->_activeBioOpsQueue, 0);
  objc_storeStrong((id *)&self->_bioOpsQueue, 0);
  objc_storeStrong((id *)&self->_cmdDispatchQueue, 0);
  objc_storeStrong((id *)&self->_notifyport, 0);
  objc_storeStrong((id *)&self->_catacombUserUUIDs, 0);
  objc_storeStrong((id *)&self->_expressModeState, 0);
  objc_storeStrong((id *)&self->_activeOperationNtfQueue, 0);
  objc_storeStrong((id *)&self->_exportedObjects, 0);
}

@end
