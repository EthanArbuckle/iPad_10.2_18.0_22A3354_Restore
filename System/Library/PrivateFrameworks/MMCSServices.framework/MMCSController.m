@implementation MMCSController

- (MMCSController)initWithQueue:(id)a3
{
  MMCSController *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  MMCSController *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MMCSController;
  v4 = -[MMCSController init](&v14, sel_init);
  v9 = v4;
  if (v4)
  {
    objc_msgSend__engine(v4, v5, v6, v7, v8);
    v9->_powerAssertionTimer = 0;
    v9->_transferIDContextMapLock = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x24BDD1788]);
    objc_msgSend_setReplyQueue_(v9, v10, (uint64_t)a3, v11, v12);
  }
  return v9;
}

- (void)_releasePowerAssertionAndSimulateCrash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  id powerAssertion;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = objc_msgSend_serialControllerQueue(MMCSController, a2, v2, v3, v4);
  dispatch_assert_queue_V2(v6);
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = objc_msgSend_count(self->_transfers, v7, v8, v9, v10);
      powerAssertion = self->_powerAssertion;
      v23 = 134218498;
      v24 = 0x4082C00000000000;
      v25 = 2048;
      v26 = v12;
      v27 = 2112;
      v28 = powerAssertion;
      _os_log_impl(&dword_22D296000, v11, OS_LOG_TYPE_INFO, "Power assertion timed out after %f secs, %ld transfers remaining: %@", (uint8_t *)&v23, 0x20u);
    }
  }
  objc_msgSend__releasePowerAssertion(self, v7, v8, v9, v10);
  IMLogBacktrace();
  v18 = (void *)objc_msgSend_processInfo(MEMORY[0x24BDD1760], v14, v15, v16, v17);
  objc_msgSend_processName(v18, v19, v20, v21, v22);
  IMLogSimulateCrashForProcess();
}

- (void)_releasePowerAssertion
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  NSObject *v7;
  id powerAssertion;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = objc_msgSend_serialControllerQueue(MMCSController, a2, v2, v3, v4);
  dispatch_assert_queue_V2(v6);
  if (self->_powerAssertion)
  {
    if (IMOSLoggingEnabled())
    {
      v7 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        powerAssertion = self->_powerAssertion;
        v9 = 138412290;
        v10 = powerAssertion;
        _os_log_impl(&dword_22D296000, v7, OS_LOG_TYPE_INFO, "Releasing power assertion %@", (uint8_t *)&v9, 0xCu);
      }
    }

    self->_powerAssertion = 0;
  }
}

- (void)_invalidatePowerAssertionTimer
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSTimer *powerAssertionTimer;
  NSObject *v12;
  uint8_t v13[16];

  v6 = objc_msgSend_serialControllerQueue(MMCSController, a2, v2, v3, v4);
  dispatch_assert_queue_V2(v6);
  powerAssertionTimer = self->_powerAssertionTimer;
  if (powerAssertionTimer)
  {
    objc_msgSend_invalidate(powerAssertionTimer, v7, v8, v9, v10);

    self->_powerAssertionTimer = 0;
    if (IMOSLoggingEnabled())
    {
      v12 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_22D296000, v12, OS_LOG_TYPE_INFO, "Power Assertion Timer invalidated", v13, 2u);
      }
    }
  }
}

- (void)_schedulePowerAssertionTimer
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = objc_msgSend_serialControllerQueue(MMCSController, a2, v2, v3, v4);
  dispatch_assert_queue_V2(v6);
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v13 = 134217984;
      v14 = 0x4082C00000000000;
      _os_log_impl(&dword_22D296000, v11, OS_LOG_TYPE_INFO, "Extending power assertion timer by %f seconds", (uint8_t *)&v13, 0xCu);
    }
  }
  objc_msgSend__invalidatePowerAssertionTimer(self, v7, v8, v9, v10);
  self->_powerAssertionTimer = (NSTimer *)(id)objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(MEMORY[0x24BDBCF40], v12, (uint64_t)self, (uint64_t)sel__releasePowerAssertionAndSimulateCrash, 0, 0, 600.0);
}

- (void)_unregisterPowerAssertion
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  id powerAssertion;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  _DWORD v26[2];
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = objc_msgSend_serialControllerQueue(MMCSController, a2, v2, v3, v4);
  dispatch_assert_queue_V2(v6);
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = objc_msgSend_count(self->_transfers, v7, v8, v9, v10);
      powerAssertion = self->_powerAssertion;
      v26[0] = 67109378;
      v26[1] = v12;
      v27 = 2112;
      v28 = powerAssertion;
      _os_log_impl(&dword_22D296000, v11, OS_LOG_TYPE_INFO, "Clearing power assertion, we have %d transfers (%@)", (uint8_t *)v26, 0x12u);
    }
  }
  objc_msgSend__invalidatePowerAssertionTimer(self, v7, v8, v9, v10);
  objc_msgSend__releasePowerAssertion(self, v14, v15, v16, v17);
  v22 = (void *)objc_msgSend_sharedInstance(MEMORY[0x24BE508B0], v18, v19, v20, v21);
  objc_msgSend_removeFastDormancyDisableToken_(v22, v23, (uint64_t)CFSTR("iMessageMMCSFastDormancyAssertion"), v24, v25);
}

- (void)_registerPowerAssertionIfNeeded
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  id powerAssertion;
  const char *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  id v32;
  int v33;
  int v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = objc_msgSend_serialControllerQueue(MMCSController, a2, v2, v3, v4);
  dispatch_assert_queue_V2(v6);
  if (self->_powerAssertion)
  {
    if (IMOSLoggingEnabled())
    {
      v7 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v12 = objc_msgSend_count(self->_transfers, v8, v9, v10, v11);
        powerAssertion = self->_powerAssertion;
        v33 = 67109378;
        v34 = v12;
        v35 = 2112;
        v36 = powerAssertion;
        v14 = "power assertion already exists- we have %d transfers (%@)";
LABEL_8:
        _os_log_impl(&dword_22D296000, v7, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v33, 0x12u);
      }
    }
  }
  else
  {
    v15 = objc_alloc(MEMORY[0x24BE18E18]);
    self->_powerAssertion = (id)objc_msgSend_initWithIdentifier_(v15, v16, (uint64_t)CFSTR("iMessageMMCSController"), v17, v18);
    v23 = (void *)objc_msgSend_sharedInstance(MEMORY[0x24BE508B0], v19, v20, v21, v22);
    objc_msgSend_addFastDormancyDisableToken_(v23, v24, (uint64_t)CFSTR("iMessageMMCSFastDormancyAssertion"), v25, v26);
    if (IMOSLoggingEnabled())
    {
      v7 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v31 = objc_msgSend_count(self->_transfers, v27, v28, v29, v30);
        v32 = self->_powerAssertion;
        v33 = 67109378;
        v34 = v31;
        v35 = 2112;
        v36 = v32;
        v14 = "Creating power assertion, we have %d transfers (%@)";
        goto LABEL_8;
      }
    }
  }
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSMutableDictionary *transfers;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  __CFURL *chunkStoreURL;
  NSObject *v17;
  objc_super v18;
  uint8_t buf[8];
  _QWORD block[5];

  transfers = self->_transfers;
  if (transfers)
  {

    self->_transfers = 0;
  }
  if (self->_engine)
  {
    v7 = objc_msgSend_serialControllerQueue(MMCSController, a2, v2, v3, v4);
    dispatch_assert_queue_not_V2(v7);
    v12 = objc_msgSend_serialControllerQueue(MMCSController, v8, v9, v10, v11);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_22D297F44;
    block[3] = &unk_24F879540;
    block[4] = self;
    dispatch_sync(v12, block);
    self->_engine = 0;
  }
  if (self->_chunkStoreURL)
  {
    v13 = (void *)objc_msgSend_defaultManager(MEMORY[0x24BDD1580], a2, v2, v3, v4);
    objc_msgSend_removeItemAtURL_error_(v13, v14, (uint64_t)self->_chunkStoreURL, 0, v15);
    chunkStoreURL = self->_chunkStoreURL;
    if (chunkStoreURL)
    {
      CFRelease(chunkStoreURL);
      self->_chunkStoreURL = 0;
    }
  }
  objc_msgSend__unregisterPowerAssertion(self, a2, v2, v3, v4);

  self->_transferIDToContextMap = 0;
  self->_transferIDContextMapLock = 0;

  self->_replyQueue = 0;
  if (IMOSLoggingEnabled())
  {
    v17 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D296000, v17, OS_LOG_TYPE_INFO, "MMCS Controller dealloc", buf, 2u);
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)MMCSController;
  -[MMCSController dealloc](&v18, sel_dealloc);
}

- (void)_addPreauthorizationOptions:(id)a3 forFiles:(id)a4
{
  uint64_t v4;
  NSObject *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  const char *v41;
  NSObject *v42;
  uint32_t v43;
  NSObject *v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v6 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, (uint64_t)a4, v4);
  dispatch_assert_queue_V2(v6);
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(a4, v7, (uint64_t)&v46, (uint64_t)v58, 16);
  if (v12)
  {
    v13 = 0;
    v14 = 0;
    v15 = *(_QWORD *)v47;
LABEL_3:
    v16 = 0;
    while (1)
    {
      v17 = v14;
      if (*(_QWORD *)v47 != v15)
        objc_enumerationMutation(a4);
      v18 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v16);
      v14 = (void *)objc_msgSend_authResponseData(v18, v8, v9, v10, v11);
      if (!v14)
        return;
      if (v17 && (objc_msgSend_isEqualToData_(v17, v19, (uint64_t)v14, v20, v21) & 1) == 0)
        break;
      if (IMOSLoggingEnabled())
      {
        v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v27 = (void *)objc_msgSend_authResponseData(v18, v23, v24, v25, v26);
          v32 = objc_msgSend_length(v27, v28, v29, v30, v31);
          v37 = objc_msgSend_guid(v18, v33, v34, v35, v36);
          *(_DWORD *)buf = 134218242;
          v51 = v32;
          v52 = 2112;
          v53 = v37;
          _os_log_impl(&dword_22D296000, v22, OS_LOG_TYPE_INFO, "Preauthorizing MMCS request with auth data of length %tu (file: %@)", buf, 0x16u);
        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v38 = objc_msgSend_protocolVersion(v18, v8, v9, v10, v11);
        if (!v38)
          return;
        if (v13 && (objc_msgSend_isEqualToString_(v13, v8, v38, v10, v11) & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            v44 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412802;
              v51 = (uint64_t)a4;
              v52 = 2112;
              v53 = (uint64_t)v13;
              v54 = 2112;
              v55 = v38;
              v41 = "MMCSPutFiles %@ have different protocol versions: %@ vs. %@";
              v42 = v44;
              v43 = 32;
              goto LABEL_27;
            }
          }
          return;
        }
        v13 = (void *)v38;
      }
      if (v12 == ++v16)
      {
        v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(a4, v8, (uint64_t)&v46, (uint64_t)v58, 16);
        if (v12)
          goto LABEL_3;
        CFDictionarySetValue((CFMutableDictionaryRef)a3, (const void *)*MEMORY[0x24BE63430], v14);
        if (v13)
          CFDictionarySetValue((CFMutableDictionaryRef)a3, (const void *)*MEMORY[0x24BE63448], v13);
        return;
      }
    }
    if (IMOSLoggingEnabled())
    {
      v39 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        v40 = objc_opt_class();
        *(_DWORD *)buf = 138413058;
        v51 = v40;
        v52 = 2112;
        v53 = (uint64_t)a4;
        v54 = 2112;
        v55 = (uint64_t)v17;
        v56 = 2112;
        v57 = v14;
        v41 = "%@s %@ have different auth data: %@ vs. %@";
        v42 = v39;
        v43 = 42;
LABEL_27:
        _os_log_impl(&dword_22D296000, v42, OS_LOG_TYPE_INFO, v41, buf, v43);
      }
    }
  }
}

- (id)_optionsForFiles:(id)a3 sourceAppID:(id)a4
{
  uint64_t v4;
  NSObject *v8;
  __CFDictionary *v9;
  __CFDictionary *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const void *v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;

  v8 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, (uint64_t)a4, v4);
  dispatch_assert_queue_V2(v8);
  v9 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  v10 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  v14 = (const void *)objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v11, 1, v12, v13);
  if (v14)
    CFDictionarySetValue(v9, (const void *)*MEMORY[0x24BE633C8], v14);
  v18 = (const void *)objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v15, 1, v16, v17);
  if (v18)
    CFDictionarySetValue(v9, (const void *)*MEMORY[0x24BE633D0], v18);
  objc_msgSend__addPreauthorizationOptions_forFiles_(self, v19, (uint64_t)v9, (uint64_t)a3, v20);
  if (a4)
  {
    v25 = (const void *)*MEMORY[0x24BE63450];
    CFDictionarySetValue(v9, (const void *)*MEMORY[0x24BE63450], a4);
    CFDictionarySetValue(v10, v25, a4);
  }
  if (objc_msgSend_connectionBehavior(self, v21, v22, v23, v24) == 1)
  {
    v30 = (const void *)objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v26, 0, v28, v29);
    if (v30)
      CFDictionarySetValue(v10, (const void *)*MEMORY[0x24BDB7728], v30);
    CFDictionarySetValue(v10, (const void *)*MEMORY[0x24BDB76F8], CFSTR("en0"));
  }
  v31 = (void *)MEMORY[0x24BDD16E0];
  v32 = (void *)objc_msgSend_currentThread(MEMORY[0x24BDD17F0], v26, v27, v28, v29);
  v37 = objc_msgSend_qualityOfService(v32, v33, v34, v35, v36);
  v41 = objc_msgSend_numberWithInteger_(v31, v38, v37, v39, v40);
  objc_msgSend_setObject_forKey_(v10, v42, v41, *MEMORY[0x24BE63438], v43);
  v47 = *MEMORY[0x24BE50A40];
  if (*MEMORY[0x24BE50A40])
    objc_msgSend_setObject_forKey_(v10, v44, v47, *MEMORY[0x24BDB77C0], v46);
  if (objc_msgSend_count(v10, v44, v47, v45, v46))
    objc_msgSend_setObject_forKey_(v9, v48, (uint64_t)v10, *MEMORY[0x24BE63458], v49);

  return v9;
}

- (_mmcs_engine)_engine
{
  _mmcs_engine *result;
  id v4;
  NSString *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __CFURL *chunkStoreURL;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  __CFURL *v31;
  _mmcs_engine *v32;
  BOOL v33;
  int v34;
  NSObject *v35;
  _mmcs_engine *engine;
  const char *v37;
  NSObject *v38;
  uint32_t v39;
  NSObject *v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  result = self->_engine;
  if (!result)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v5 = NSTemporaryDirectory();
    v10 = objc_msgSend_stringGUID(MEMORY[0x24BDD17C8], v6, v7, v8, v9);
    v18 = objc_msgSend_stringByAppendingPathComponent_(v5, v11, v10, v12, v13);
    chunkStoreURL = self->_chunkStoreURL;
    if (chunkStoreURL)
    {
      CFRelease(chunkStoreURL);
      self->_chunkStoreURL = 0;
    }
    v20 = (void *)objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v14, v15, v16, v17);
    if (objc_msgSend_makeDirectoriesInPath_mode_(v20, v21, v18, 509, v22))
      self->_chunkStoreURL = (__CFURL *)(id)objc_msgSend_fileURLWithPath_(MEMORY[0x24BDBCF48], v23, v18, v24, v25);
    if (IMOSLoggingEnabled())
    {
      v30 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v31 = self->_chunkStoreURL;
        *(_DWORD *)buf = 138412546;
        v42 = v31;
        v43 = 2112;
        v44 = v4;
        _os_log_impl(&dword_22D296000, v30, OS_LOG_TYPE_INFO, "Creating engine with temp url: %@ options: %@", buf, 0x16u);
      }
    }
    self->_currentItemID = 100;
    objc_msgSend_serialControllerQueue(MMCSController, v26, v27, v28, v29);
    if (qword_25408CCA0 != -1)
      dispatch_once(&qword_25408CCA0, &unk_24F879848);
    v32 = (_mmcs_engine *)MMCSEngineCreateWithTargetDispatchQueue();
    self->_engine = v32;
    v33 = v32 == 0;
    v34 = IMOSLoggingEnabled();
    if (v33)
    {
      if (!v34)
        goto LABEL_19;
      v40 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        goto LABEL_19;
      *(_WORD *)buf = 0;
      v37 = "Failed to create MMCS engine";
      v38 = v40;
      v39 = 2;
    }
    else
    {
      if (!v34)
        goto LABEL_19;
      v35 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        goto LABEL_19;
      engine = self->_engine;
      *(_DWORD *)buf = 134217984;
      v42 = engine;
      v37 = "Created engine: %p";
      v38 = v35;
      v39 = 12;
    }
    _os_log_impl(&dword_22D296000, v38, OS_LOG_TYPE_INFO, v37, buf, v39);
LABEL_19:

    return self->_engine;
  }
  return result;
}

- (id)_registeredTransferForGUID:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, v3, v4);
  dispatch_assert_queue_V2(v7);
  return (id)objc_msgSend_objectForKey_(self->_transfers, v8, (uint64_t)a3, v9, v10);
}

- (id)_registeredTransferForItemID:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  unint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v7 = objc_msgSend_serialControllerQueue(MMCSController, a2, a3, v3, v4);
  dispatch_assert_queue_V2(v7);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = (void *)objc_msgSend_allValues(self->_transfers, v8, v9, v10, v11, 0);
  v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v24, (uint64_t)v30, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v25;
LABEL_3:
    v20 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v19)
        objc_enumerationMutation(v12);
      v21 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v20);
      if (objc_msgSend_itemID(v21, v14, v15, v16, v17) == a3)
        break;
      if (v18 == ++v20)
      {
        v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v14, (uint64_t)&v24, (uint64_t)v30, 16);
        if (v18)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    if (IMOSLoggingEnabled())
    {
      v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v29 = a3;
        _os_log_impl(&dword_22D296000, v22, OS_LOG_TYPE_INFO, "Found no registered transfer for transfer id: %qx", buf, 0xCu);
      }
    }
    return 0;
  }
  return v21;
}

- (void)_handleRegistrationForMMCSPutFile:(id)a3 preauthenticate:(BOOL)a4 completionBlock:(id)a5
{
  _BOOL8 v6;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[2];
  _QWORD v39[2];
  uint64_t v40;
  _QWORD v41[3];
  _QWORD v42[4];

  v6 = a4;
  v42[3] = *MEMORY[0x24BDAC8D0];
  v9 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, a4, (uint64_t)a5);
  dispatch_assert_queue_V2(v9);
  objc_msgSend_setRegistrationBlock_(a3, v10, (uint64_t)a5, v11, v12);
  v41[0] = *MEMORY[0x24BE63440];
  v16 = objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v13, v6, v14, v15);
  v17 = *MEMORY[0x24BE63408];
  v18 = MEMORY[0x24BDBD1C8];
  v42[0] = v16;
  v42[1] = MEMORY[0x24BDBD1C8];
  v19 = *MEMORY[0x24BE63428];
  v41[1] = v17;
  v41[2] = v19;
  v20 = (void *)MEMORY[0x24BDD16E0];
  v25 = objc_msgSend_itemID(a3, v21, v22, v23, v24, *MEMORY[0x24BE633F0]);
  v29 = objc_msgSend_numberWithUnsignedLongLong_(v20, v26, v25, v27, v28);
  v38[1] = *MEMORY[0x24BE63410];
  v39[0] = v29;
  v39[1] = v18;
  v40 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v30, (uint64_t)v39, (uint64_t)v38, 2);
  v42[2] = objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v31, (uint64_t)&v40, 1, v32);
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v33, (uint64_t)v42, (uint64_t)v41, 3);
  objc_msgSend__engine(self, v34, v35, v36, v37);
  MMCSRegisterItems();
}

- (void)_registerTransfers:(id)a3 preauthenticate:(BOOL)a4 completionBlock:(id)a5
{
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  unint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSMutableDictionary *transfers;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  NSObject *v46;
  const char *v47;
  uint32_t v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t i;
  void *v60;
  const char *v61;
  const char *v62;
  NSObject *v63;
  NSObject *v64;
  NSObject *v65;
  __int128 v66;
  _BOOL4 v67;
  _QWORD v68[7];
  id v69;
  id v70;
  id from;
  id location;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD block[2];
  void (*v82)(uint64_t, const char *, uint64_t, uint64_t, uint64_t);
  void *v83;
  MMCSController *v84;
  id v85;
  uint64_t *v86;
  _QWORD *v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  char v91;
  _QWORD v92[3];
  char v93;
  uint8_t v94[128];
  _BYTE buf[24];
  void (*v96)(uint64_t, uint64_t);
  void (*v97)(uint64_t);
  dispatch_group_t v98;
  _BYTE v99[128];
  uint64_t v100;

  v67 = a4;
  v100 = *MEMORY[0x24BDAC8D0];
  v8 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, a4, (uint64_t)a5);
  dispatch_assert_queue_V2(v8);
  if (objc_msgSend_count(a3, v9, v10, v11, v12))
  {
    v92[0] = 0;
    v92[1] = v92;
    v92[2] = 0x2020000000;
    v93 = 1;
    v88 = 0;
    v89 = &v88;
    v90 = 0x2020000000;
    v91 = 1;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    v82 = sub_22D29A8E4;
    v83 = &unk_24F879568;
    v84 = self;
    v85 = a5;
    v86 = &v88;
    v87 = v92;
    v13 = (void *)objc_opt_new();
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v14, (uint64_t)&v77, (uint64_t)v99, 16);
    if (!v19)
      goto LABEL_27;
    v21 = *(_QWORD *)v78;
    *(_QWORD *)&v20 = 138412546;
    v66 = v20;
    while (1)
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v78 != v21)
          objc_enumerationMutation(a3);
        v23 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v22);
        v24 = objc_msgSend_guid(v23, v15, v16, v17, v18, v66);
        v31 = objc_msgSend__registeredTransferForGUID_(self, v25, v24, v26, v27);
        if (v31)
        {
          if (IMOSLoggingEnabled())
          {
            v32 = OSLogHandleForIMEventCategory();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v31;
              _os_log_impl(&dword_22D296000, v32, OS_LOG_TYPE_INFO, "Returning existing file transfer: %@", buf, 0xCu);
            }
          }
          *((_BYTE *)v89 + 24) = 0;
        }
        else
        {
          v33 = self->_currentItemID + 1;
          self->_currentItemID = v33;
          objc_msgSend_setItemID_(v23, v28, v33, v29, v30);
          transfers = self->_transfers;
          if (!transfers)
          {
            transfers = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
            self->_transfers = transfers;
          }
          v39 = objc_msgSend_guid(v23, v34, v35, v36, v37);
          objc_msgSend_setObject_forKey_(transfers, v40, (uint64_t)v23, v39, v41);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend_addObject_(v13, v42, (uint64_t)v23, v43, v44);
            goto LABEL_16;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (IMOSLoggingEnabled())
            {
              v45 = OSLogHandleForIMEventCategory();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v23;
                v46 = v45;
                v47 = "Registered mmcs get transfer: %@";
                v48 = 12;
LABEL_25:
                _os_log_impl(&dword_22D296000, v46, OS_LOG_TYPE_INFO, v47, buf, v48);
              }
            }
          }
          else if (IMOSLoggingEnabled())
          {
            v49 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
            {
              v50 = objc_opt_class();
              *(_DWORD *)buf = v66;
              *(_QWORD *)&buf[4] = v23;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v50;
              v46 = v49;
              v47 = "Attempted to register unknown transfer %@ of type %@";
              v48 = 22;
              goto LABEL_25;
            }
          }
        }
LABEL_16:
        ++v22;
      }
      while (v19 != v22);
      v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v15, (uint64_t)&v77, (uint64_t)v99, 16);
      v19 = v51;
      if (!v51)
      {
LABEL_27:
        if (objc_msgSend_count(v13, v15, v16, v17, v18))
        {
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3052000000;
          v96 = sub_22D29A960;
          v97 = sub_22D29A970;
          v98 = 0;
          v98 = dispatch_group_create();
          v73 = 0u;
          v74 = 0u;
          v75 = 0u;
          v76 = 0u;
          v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v52, (uint64_t)&v73, (uint64_t)v94, 16);
          if (v57)
          {
            v58 = *(_QWORD *)v74;
            do
            {
              for (i = 0; i != v57; ++i)
              {
                if (*(_QWORD *)v74 != v58)
                  objc_enumerationMutation(v13);
                v60 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
                location = 0;
                objc_initWeak(&location, self);
                from = 0;
                objc_initWeak(&from, v60);
                dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)&buf[8] + 40));
                v68[0] = MEMORY[0x24BDAC760];
                v68[1] = 3221225472;
                v68[2] = sub_22D29A97C;
                v68[3] = &unk_24F879590;
                objc_copyWeak(&v69, &location);
                objc_copyWeak(&v70, &from);
                v68[4] = self;
                v68[5] = v92;
                v68[6] = buf;
                objc_msgSend__handleRegistrationForMMCSPutFile_preauthenticate_completionBlock_(self, v61, (uint64_t)v60, v67, (uint64_t)v68);
                objc_destroyWeak(&v70);
                objc_destroyWeak(&v69);
                objc_destroyWeak(&from);
                objc_destroyWeak(&location);
              }
              v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v62, (uint64_t)&v73, (uint64_t)v94, 16);
            }
            while (v57);
          }
          v63 = *(NSObject **)(*(_QWORD *)&buf[8] + 40);
          v64 = objc_msgSend_serialControllerQueue(MMCSController, v53, v54, v55, v56);
          dispatch_group_notify(v63, v64, block);
          dispatch_release(*(dispatch_object_t *)(*(_QWORD *)&buf[8] + 40));
          if (v13)

          _Block_object_dispose(buf, 8);
        }
        else
        {
          ((void (*)(_QWORD *))v82)(block);
          if (v13)

        }
        _Block_object_dispose(&v88, 8);
        _Block_object_dispose(v92, 8);
        return;
      }
    }
  }
  if (IMOSLoggingEnabled())
  {
    v65 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D296000, v65, OS_LOG_TYPE_INFO, "Empty files array supplied to register, failing", buf, 2u);
    }
  }
  (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (BOOL)_unregisterTransfers:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  NSMutableDictionary *transfers;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  int v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSMutableDictionary *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  void *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v7 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, v3, v4);
  dispatch_assert_queue_V2(v7);
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v8, (uint64_t)&v55, (uint64_t)v61, 16);
  if (v13)
  {
    v15 = *(_QWORD *)v56;
    *(_QWORD *)&v14 = 138412290;
    v54 = v14;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v56 != v15)
          objc_enumerationMutation(a3);
        v17 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v16);
        if (IMOSLoggingEnabled())
        {
          v22 = OSLogHandleForIMEventCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v54;
            v60 = v17;
            _os_log_impl(&dword_22D296000, v22, OS_LOG_TYPE_INFO, "Unregistering file transfer: %@", buf, 0xCu);
          }
        }
        transfers = self->_transfers;
        v24 = objc_msgSend_guid(v17, v18, v19, v20, v21, v54);
        v28 = (void *)objc_msgSend_objectForKey_(transfers, v25, v24, v26, v27);
        v29 = IMOSLoggingEnabled();
        if (v28)
        {
          if (v29)
          {
            v34 = OSLogHandleForIMEventCategory();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v54;
              v60 = v28;
              _os_log_impl(&dword_22D296000, v34, OS_LOG_TYPE_INFO, " => Unregistering: %@", buf, 0xCu);
            }
          }
          objc_msgSend__engine(self, v30, v31, v32, v33);
          objc_msgSend_itemID(v28, v35, v36, v37, v38);
          MMCSUnregisterFile();
          v39 = self->_transfers;
          v44 = objc_msgSend_guid(v17, v40, v41, v42, v43);
          objc_msgSend_removeObjectForKey_(v39, v45, v44, v46, v47);
          if (!objc_msgSend_count(self->_transfers, v48, v49, v50, v51))
          {

            self->_transfers = 0;
          }
        }
        else if (v29)
        {
          v52 = OSLogHandleForIMEventCategory();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22D296000, v52, OS_LOG_TYPE_INFO, "Found no transfer to unregister", buf, 2u);
          }
        }
        ++v16;
      }
      while (v13 != v16);
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v30, (uint64_t)&v55, (uint64_t)v61, 16);
    }
    while (v13);
  }
  if (!self->_transfers)
    objc_msgSend__unregisterPowerAssertion(self, v9, v10, v11, v12);
  return 1;
}

- (void)_setScheduledTransfers:(id)a3 block:(id)a4
{
  uint64_t v4;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  NSMutableDictionary *transferToRequestIDsMap;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  NSMutableDictionary *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v8 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, (uint64_t)a4, v4);
  dispatch_assert_queue_V2(v8);
  if (a4)
  {
    if (!self->_requestIDToBlockMap)
      self->_requestIDToBlockMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    if (!self->_transferToRequestIDsMap)
      self->_transferToRequestIDsMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v53 = a4;
    if (!self->_requestIDToRemainingTransfersMap)
      self->_requestIDToRemainingTransfersMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    if (!self->_requestIDToTransfersMap)
      self->_requestIDToTransfersMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v13 = objc_msgSend_stringGUID(MEMORY[0x24BDD17C8], v9, v10, v11, v12);
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v14, (uint64_t)&v54, (uint64_t)v58, 16);
    if (v15)
    {
      v20 = v15;
      v21 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v55 != v21)
            objc_enumerationMutation(a3);
          v23 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          transferToRequestIDsMap = self->_transferToRequestIDsMap;
          v25 = objc_msgSend_guid(v23, v16, v17, v18, v19);
          v32 = (id)objc_msgSend_objectForKey_(transferToRequestIDsMap, v26, v25, v27, v28);
          if (!v32)
            v32 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend_addObject_(v32, v29, v13, v30, v31);
          v33 = self->_transferToRequestIDsMap;
          v38 = objc_msgSend_guid(v23, v34, v35, v36, v37);
          objc_msgSend_setObject_forKey_(v33, v39, (uint64_t)v32, v38, v40);

        }
        v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v16, (uint64_t)&v54, (uint64_t)v58, 16);
      }
      while (v20);
    }
    v41 = (void *)objc_msgSend_copy(v53, v16, v17, v18, v19);
    objc_msgSend_setObject_forKey_(self->_requestIDToBlockMap, v42, (uint64_t)v41, v13, v43);

    v48 = (void *)objc_msgSend_mutableCopy(a3, v44, v45, v46, v47);
    objc_msgSend_setObject_forKey_(self->_requestIDToRemainingTransfersMap, v49, (uint64_t)v48, v13, v50);
    objc_msgSend_setObject_forKey_(self->_requestIDToTransfersMap, v51, (uint64_t)a3, v13, v52);

  }
}

- (BOOL)_putTransfers:(id)a3 requestURL:(id)a4 requestorID:(id)a5 transferID:(id)a6 sourceAppID:(id)a7 token:(id)a8 error:(id *)a9
{
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  MMCSRequestorContext *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  int v41;
  BOOL v42;
  NSObject *v43;
  NSObject *v44;
  const char *v45;
  NSObject *v47;
  void *v48;
  void **v49;
  void *v50;
  uint64_t v51;
  uint8_t buf[4];
  _DWORD v53[7];

  *(_QWORD *)&v53[5] = *MEMORY[0x24BDAC8D0];
  v16 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
  dispatch_assert_queue_V2(v16);
  if (IMOSLoggingEnabled())
  {
    v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v53 = a3;
      _os_log_impl(&dword_22D296000, v21, OS_LOG_TYPE_INFO, "Make put transfer request for transfers: %@", buf, 0xCu);
    }
  }
  if (!objc_msgSend__engine(self, v17, v18, v19, v20))
  {
    if (!IMOSLoggingEnabled())
      return 0;
    v44 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      return 0;
    *(_WORD *)buf = 0;
    v45 = " => Could not generate engine, failing";
    goto LABEL_29;
  }
  if (!a4)
  {
    if (!IMOSLoggingEnabled())
      return 0;
    v44 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      return 0;
    *(_WORD *)buf = 0;
    v45 = " => empty requestURL";
    goto LABEL_29;
  }
  if (!a5)
  {
    if (!IMOSLoggingEnabled())
      return 0;
    v44 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      return 0;
    *(_WORD *)buf = 0;
    v45 = " => empty requestorID";
    goto LABEL_29;
  }
  if (!a8)
  {
    if (!IMOSLoggingEnabled())
      return 0;
    v44 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      return 0;
    *(_WORD *)buf = 0;
    v45 = " => empty authToken";
LABEL_29:
    _os_log_impl(&dword_22D296000, v44, OS_LOG_TYPE_INFO, v45, buf, 2u);
    return 0;
  }
  v50 = 0;
  v51 = 0;
  v48 = 0;
  v49 = 0;
  objc_msgSend_count(a3, v22, v23, v24, v25);
  sub_22D29B574(a3, (const char *)a5, (uint64_t)a4, (uint64_t)a8);
  if (sub_22D29B68C(a3, (char *)&v51, &v50, (uint64_t)&v49, (uint64_t)&v48))
  {
    v28 = (void *)objc_msgSend__optionsForFiles_sourceAppID_(self, v26, (uint64_t)a3, (uint64_t)a7, v27);
    v29 = [MMCSRequestorContext alloc];
    v32 = objc_msgSend_initWithController_transferID_(v29, v30, (uint64_t)self, (uint64_t)a6, v31);
    objc_msgSend__addRequestorContext_transferID_(self, v33, v32, (uint64_t)a6, v34);
    if (IMOSLoggingEnabled())
    {
      v39 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        v40 = objc_msgSend_count(v28, v35, v36, v37, v38);
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v53 = v40;
        _os_log_impl(&dword_22D296000, v39, OS_LOG_TYPE_INFO, "Calling MMCSPutItems: requestOptions has %tu keys.", buf, 0xCu);
      }
    }
    objc_msgSend__engine(self, v35, v36, v37, v38);
    v41 = MMCSPutItems();
    v42 = v41 != 0;
    if (a9)
      *a9 = 0;
    if (IMOSLoggingEnabled())
    {
      v43 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v53[0] = v41 != 0;
        LOWORD(v53[1]) = 2112;
        *(_QWORD *)((char *)&v53[1] + 2) = 0;
        _os_log_impl(&dword_22D296000, v43, OS_LOG_TYPE_INFO, "Returning success: %d   error: %@", buf, 0x12u);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v47 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D296000, v47, OS_LOG_TYPE_INFO, "Failed to generate item set", buf, 2u);
      }
    }
    v42 = 0;
  }
  sub_22D29BA34(a3, (const char *)&v51, &v50, &v49, &v48);
  return v42;
}

- (BOOL)_getTransfers:(id)a3 requestURL:(id)a4 requestorID:(id)a5 sourceAppID:(id)a6 token:(id)a7 error:(id *)a8
{
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  NSObject *v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  MMCSRequestorContext *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  int v42;
  BOOL v43;
  NSObject *v44;
  NSObject *v45;
  const char *v46;
  NSObject *v48;
  void *v49;
  void **v50;
  uint64_t v51;
  uint8_t buf[4];
  _DWORD v53[7];

  *(_QWORD *)&v53[5] = *MEMORY[0x24BDAC8D0];
  v15 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
  dispatch_assert_queue_V2(v15);
  if (IMOSLoggingEnabled())
  {
    v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v53 = a3;
      _os_log_impl(&dword_22D296000, v20, OS_LOG_TYPE_INFO, "Make get transfer request for transfers: %@", buf, 0xCu);
    }
  }
  if (!objc_msgSend__engine(self, v16, v17, v18, v19))
  {
    if (!IMOSLoggingEnabled())
      return 0;
    v45 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      return 0;
    *(_WORD *)buf = 0;
    v46 = " => Could not generate engine, failing";
    goto LABEL_38;
  }
  if (!a4)
  {
    if (!IMOSLoggingEnabled())
      return 0;
    v45 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      return 0;
    *(_WORD *)buf = 0;
    v46 = " => empty requestURL";
    goto LABEL_38;
  }
  if (!a5)
  {
    if (!IMOSLoggingEnabled())
      return 0;
    v45 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      return 0;
    *(_WORD *)buf = 0;
    v46 = " => empty requestorID";
    goto LABEL_38;
  }
  if (!a7)
  {
    if (!IMOSLoggingEnabled())
      return 0;
    v45 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      return 0;
    *(_WORD *)buf = 0;
    v46 = " => empty authToken";
LABEL_38:
    _os_log_impl(&dword_22D296000, v45, OS_LOG_TYPE_INFO, v46, buf, 2u);
    return 0;
  }
  v50 = 0;
  v51 = 0;
  v49 = 0;
  objc_msgSend_count(a3, v21, v22, v23, v24);
  sub_22D29B574(a3, (const char *)a5, (uint64_t)a4, (uint64_t)a7);
  v25 = sub_22D29B68C(a3, (char *)&v51, 0, (uint64_t)&v50, (uint64_t)&v49);
  v26 = IMOSLoggingEnabled();
  if (v25)
  {
    if (v26)
    {
      v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v53 = v51;
        _os_log_impl(&dword_22D296000, v27, OS_LOG_TYPE_INFO, "items: %p", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v53 = v50;
        _os_log_impl(&dword_22D296000, v28, OS_LOG_TYPE_INFO, "signatures: %p", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v53 = v49;
        _os_log_impl(&dword_22D296000, v31, OS_LOG_TYPE_INFO, "tokens: %p", buf, 0xCu);
      }
    }
    v32 = (void *)objc_msgSend__optionsForFiles_sourceAppID_(self, v29, (uint64_t)a3, (uint64_t)a6, v30);
    v33 = [MMCSRequestorContext alloc];
    objc_msgSend_initWithController_transferID_(v33, v34, (uint64_t)self, 0, v35);
    if (IMOSLoggingEnabled())
    {
      v40 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        v41 = objc_msgSend_count(v32, v36, v37, v38, v39);
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v53 = v41;
        _os_log_impl(&dword_22D296000, v40, OS_LOG_TYPE_INFO, "Calling MMCSGetItems: requestOptions has %tu keys.", buf, 0xCu);
      }
    }
    objc_msgSend__engine(self, v36, v37, v38, v39);
    v42 = MMCSGetItems();
    v43 = v42 != 0;
    if (a8)
      *a8 = 0;
    if (IMOSLoggingEnabled())
    {
      v44 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v53[0] = v42 != 0;
        LOWORD(v53[1]) = 2112;
        *(_QWORD *)((char *)&v53[1] + 2) = 0;
        _os_log_impl(&dword_22D296000, v44, OS_LOG_TYPE_INFO, "Returning success: %d   error: %@", buf, 0x12u);
      }
    }
  }
  else
  {
    if (v26)
    {
      v48 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D296000, v48, OS_LOG_TYPE_INFO, "Failed to generate item set", buf, 2u);
      }
    }
    v43 = 0;
  }
  sub_22D29BA34(a3, (const char *)&v51, 0, &v50, &v49);
  return v43;
}

- (void)_registerFiles:(id)a3 preauthenticate:(BOOL)a4 completionBlock:(id)a5
{
  _BOOL8 v6;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t v16[16];

  v6 = a4;
  if (objc_msgSend_count(a3, a2, (uint64_t)a3, a4, (uint64_t)a5))
  {
    objc_msgSend__registerTransfers_preauthenticate_completionBlock_(self, v9, (uint64_t)a3, v6, (uint64_t)a5);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_22D296000, v14, OS_LOG_TYPE_INFO, "Empty files array supplied to register, failing", v16, 2u);
      }
    }
    v15 = objc_msgSend_serialControllerQueue(MMCSController, v10, v11, v12, v13);
    dispatch_assert_queue_V2(v15);
    if (a5)
      (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
  }
}

- (BOOL)isActive
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v6 = objc_msgSend_serialControllerQueue(MMCSController, a2, v2, v3, v4);
  dispatch_assert_queue_not_V2(v6);
  v11 = objc_msgSend_serialControllerQueue(MMCSController, v7, v8, v9, v10);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_22D29C288;
  v13[3] = &unk_24F8795B8;
  v13[4] = self;
  v13[5] = &v14;
  dispatch_sync(v11, v13);
  LOBYTE(self) = *((_BYTE *)v15 + 24) != 0;
  _Block_object_dispose(&v14, 8);
  return (char)self;
}

- (void)registerFilesForDownload:(id)a3 completionBlock:(id)a4
{
  uint64_t v4;
  uint64_t v7;
  NSObject *v8;
  _QWORD block[7];
  _QWORD v10[6];

  v7 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_22D29C374;
  v10[3] = &unk_24F879608;
  v10[4] = self;
  v10[5] = a4;
  v8 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, (uint64_t)a4, v4);
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = sub_22D29C400;
  block[3] = &unk_24F879630;
  block[4] = self;
  block[5] = a3;
  block[6] = v10;
  dispatch_async(v8, block);
}

- (void)registerFilesForUpload:(id)a3 withPreauthentication:(BOOL)a4 completionBlock:(id)a5
{
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[7];
  BOOL v11;
  _QWORD v12[6];

  v8 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_22D29C4C0;
  v12[3] = &unk_24F879608;
  v12[4] = self;
  v12[5] = a5;
  v9 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, a4, (uint64_t)a5);
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = sub_22D29C54C;
  v10[3] = &unk_24F879658;
  v10[4] = self;
  v10[5] = a3;
  v11 = a4;
  v10[6] = v12;
  dispatch_async(v9, v10);
}

- (BOOL)unregisterFiles:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD block[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v5 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v7 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, v3, v4);
  dispatch_assert_queue_not_V2(v7);
  v12 = objc_msgSend_serialControllerQueue(MMCSController, v8, v9, v10, v11);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_22D29C638;
  block[3] = &unk_24F879680;
  block[5] = self;
  block[6] = &v15;
  block[4] = v5;
  dispatch_sync(v12, block);
  LOBYTE(v5) = *((_BYTE *)v16 + 24) != 0;
  _Block_object_dispose(&v15, 8);
  return (char)v5;
}

+ (id)serialControllerQueue
{
  if (qword_25408CC90 != -1)
    dispatch_once(&qword_25408CC90, &unk_24F879518);
  return (id)qword_25408CC98;
}

+ (void)preMMCSWarm
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;

  v5 = objc_msgSend_serialControllerQueue(MMCSController, a2, v2, v3, v4);
  dispatch_async(v5, &unk_24F8796C0);
}

- (void)getFiles:(id)a3 requestURL:(id)a4 requestorID:(id)a5 sourceAppID:(id)a6 authToken:(id)a7 completionBlock:(id)a8
{
  uint64_t v14;
  NSObject *v15;
  _QWORD block[11];
  _QWORD v17[6];

  v14 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_22D29CB3C;
  v17[3] = &unk_24F879710;
  v17[4] = self;
  v17[5] = a8;
  v15 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
  block[0] = v14;
  block[1] = 3221225472;
  block[2] = sub_22D29CBE0;
  block[3] = &unk_24F879760;
  block[9] = a7;
  block[10] = v17;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  block[7] = a5;
  block[8] = a6;
  dispatch_async(v15, block);
}

- (void)putFiles:(id)a3 requestURL:(id)a4 requestorID:(id)a5 transferID:(id)a6 sourceAppID:(id)a7 authToken:(id)a8 preauthenticate:(BOOL)a9 completionBlock:(id)a10
{
  uint64_t v17;
  NSObject *v18;
  _QWORD block[12];
  BOOL v20;
  _QWORD v21[6];

  v17 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = sub_22D29CFD8;
  v21[3] = &unk_24F879710;
  v21[4] = self;
  v21[5] = a10;
  v18 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
  block[0] = v17;
  block[1] = 3221225472;
  block[2] = sub_22D29D07C;
  block[3] = &unk_24F8797B0;
  block[4] = a3;
  block[5] = self;
  v20 = a9;
  block[6] = a4;
  block[7] = a5;
  block[8] = a6;
  block[9] = a7;
  block[10] = a8;
  block[11] = v21;
  dispatch_async(v18, block);
}

- (void)_addRequestorContext:(id)a3 transferID:(id)a4
{
  uint64_t v4;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSMutableDictionary *transferIDToContextMap;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v8 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, (uint64_t)a4, v4);
  dispatch_assert_queue_V2(v8);
  if (a3 && a4)
  {
    objc_msgSend_lock(self->_transferIDContextMapLock, v9, v10, v11, v12);
    transferIDToContextMap = self->_transferIDToContextMap;
    if (!transferIDToContextMap)
    {
      transferIDToContextMap = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      self->_transferIDToContextMap = transferIDToContextMap;
    }
    v20 = (id)objc_msgSend_objectForKeyedSubscript_(transferIDToContextMap, v13, (uint64_t)a4, v14, v15);
    if (!v20)
    {
      v20 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      objc_msgSend_setObject_forKeyedSubscript_(self->_transferIDToContextMap, v21, (uint64_t)v20, (uint64_t)a4, v22);

    }
    objc_msgSend_addObject_(v20, v17, (uint64_t)a3, v18, v19);
    objc_msgSend_unlock(self->_transferIDContextMapLock, v23, v24, v25, v26);
  }
}

- (void)_removeRequestorContext:(id)a3 transferID:(id)a4
{
  uint64_t v4;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, (uint64_t)a4, v4);
  dispatch_assert_queue_V2(v8);
  if (a3 && a4)
  {
    if (IMOSLoggingEnabled())
    {
      v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v29 = 138412290;
        v30 = a4;
        _os_log_impl(&dword_22D296000, v13, OS_LOG_TYPE_INFO, "Remove request context for transferID %@", (uint8_t *)&v29, 0xCu);
      }
    }
    objc_msgSend_lock(self->_transferIDContextMapLock, v9, v10, v11, v12);
    v17 = (void *)objc_msgSend_objectForKeyedSubscript_(self->_transferIDToContextMap, v14, (uint64_t)a4, v15, v16);
    objc_msgSend_removeObject_(v17, v18, (uint64_t)a3, v19, v20);
    if (!objc_msgSend_count(v17, v21, v22, v23, v24))
      objc_msgSend_setObject_forKeyedSubscript_(self->_transferIDToContextMap, v25, 0, (uint64_t)a4, v28);
    objc_msgSend_unlock(self->_transferIDContextMapLock, v25, v26, v27, v28);
  }
}

- (void)_cancelRequest:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v7 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, v3, v4);
  dispatch_assert_queue_V2(v7);
  if (IMOSLoggingEnabled())
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = 134217984;
      v14 = a3;
      _os_log_impl(&dword_22D296000, v12, OS_LOG_TYPE_INFO, "Request cancel context %p", (uint8_t *)&v13, 0xCu);
    }
  }
  objc_msgSend__engine(self, v8, v9, v10, v11);
  MMCSEngineCancelRequests();
}

- (void)cancelPutRequestID:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[6];

  v7 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, v3, v4);
  dispatch_assert_queue_not_V2(v7);
  if (a3)
  {
    v12 = objc_msgSend_serialControllerQueue(MMCSController, v8, v9, v10, v11);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = sub_22D29D704;
    v13[3] = &unk_24F8797D8;
    v13[4] = a3;
    v13[5] = self;
    dispatch_sync(v12, v13);
  }
}

+ (id)parseContentHeaderAsDictionary:(id)a3 treatValuesAsArrays:(BOOL)a4
{
  uint64_t v4;
  NSObject *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  NSObject *v75;
  __int128 v77;
  _BOOL4 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint8_t buf[4];
  void *v84;
  _BYTE v85[128];
  uint64_t v86;

  v78 = a4;
  v86 = *MEMORY[0x24BDAC8D0];
  v6 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, a4, v4);
  dispatch_assert_queue_not_V2(v6);
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v11 = (void *)objc_msgSend_componentsSeparatedByString_(a3, v8, (uint64_t)CFSTR("\n"), v9, v10);
  v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v79, (uint64_t)v85, 16);
  if (v17)
  {
    v19 = *(_QWORD *)v80;
    *(_QWORD *)&v18 = 138412290;
    v77 = v18;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v80 != v19)
          objc_enumerationMutation(v11);
        v21 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
        v22 = objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x24BDD14A8], v13, v14, v15, v16, v77);
        v26 = (void *)objc_msgSend_stringByTrimmingCharactersInSet_(v21, v23, v22, v24, v25);
        if (objc_msgSend_length(v26, v27, v28, v29, v30))
        {
          v31 = objc_msgSend_rangeOfString_(v26, v13, (uint64_t)CFSTR(":"), v15, v16);
          if (v31 <= objc_msgSend_length(v26, v32, v33, v34, v35))
          {
            v42 = objc_msgSend_substringToIndex_(v26, v36, v31, v37, v38);
            v46 = (void *)objc_msgSend_substringFromIndex_(v26, v43, v31 + 1, v44, v45);
            v54 = (void *)objc_msgSend_objectForKey_(v7, v47, v42, v48, v49);
            if (!v54)
              v54 = (void *)objc_msgSend_array(MEMORY[0x24BDBCEB8], v50, v51, v52, v53);
            if (!v78)
              goto LABEL_18;
            if ((unint64_t)objc_msgSend_length(v46, v50, v51, v52, v53) >= 2
              && objc_msgSend_characterAtIndex_(v46, v55, 0, v56, v57) == 91)
            {
              v62 = objc_msgSend_length(v46, v58, v59, v60, v61);
              if (objc_msgSend_characterAtIndex_(v46, v63, v62 - 1, v64, v65) == 93)
              {
                v70 = objc_msgSend_length(v46, v66, v67, v68, v69);
                v46 = (void *)objc_msgSend_substringWithRange_(v46, v71, 1, v70 - 2, v72);
LABEL_18:
                objc_msgSend_addObject_(v54, v50, (uint64_t)v46, v52, v53);
                objc_msgSend_setObject_forKey_(v7, v73, (uint64_t)v54, v42, v74);
                continue;
              }
            }
            if (IMOSLoggingEnabled())
            {
              v75 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v77;
                v84 = v26;
                v40 = v75;
                v41 = "Failed to parse header entry: %@ (value was not enclosed by brackets)";
                goto LABEL_22;
              }
            }
          }
          else if (IMOSLoggingEnabled())
          {
            v39 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v77;
              v84 = v26;
              v40 = v39;
              v41 = "Failed to parse header entry: %@ (no ':' delimiter between key and value)";
LABEL_22:
              _os_log_impl(&dword_22D296000, v40, OS_LOG_TYPE_INFO, v41, buf, 0xCu);
              continue;
            }
          }
        }
      }
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v13, (uint64_t)&v79, (uint64_t)v85, 16);
    }
    while (v17);
  }
  return v7;
}

- (id)getContentHeadersAsString
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3052000000;
  v18 = sub_22D29A960;
  v19 = sub_22D29A970;
  v20 = 0;
  v6 = objc_msgSend_serialControllerQueue(MMCSController, a2, v2, v3, v4);
  dispatch_assert_queue_not_V2(v6);
  v11 = objc_msgSend_serialControllerQueue(MMCSController, v7, v8, v9, v10);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_22D29DC74;
  v14[3] = &unk_24F879800;
  v14[4] = self;
  v14[5] = &v15;
  dispatch_sync(v11, v14);
  v12 = (id)v16[5];
  _Block_object_dispose(&v15, 8);
  return v12;
}

- (void)_putItemUpdated:(id)a3 progress:(double)a4 state:(int)a5 error:(id)a6
{
  uint64_t v7;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  _QWORD v22[6];
  uint8_t buf[4];
  id v24;
  __int16 v25;
  double v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v7 = *(_QWORD *)&a5;
  v31 = *MEMORY[0x24BDAC8D0];
  v11 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, *(uint64_t *)&a5, (uint64_t)a6);
  dispatch_assert_queue_V2(v11);
  if (IMOSLoggingEnabled())
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      v24 = a3;
      v25 = 2048;
      v26 = a4;
      v27 = 2112;
      v28 = sub_22D29DF78(v7, v13, v14, v15, v16);
      v29 = 2112;
      v30 = a6;
      _os_log_impl(&dword_22D296000, v12, OS_LOG_TYPE_INFO, "Put item updated: %@  progress: %f state: %@ error: %@", buf, 0x2Au);
    }
  }
  if (MMCSPutItemStateIsDeterminant())
  {
    v21 = objc_msgSend_replyQueue(self, v17, v18, v19, v20);
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_22D29DFC4;
    v22[3] = &unk_24F879828;
    v22[4] = a3;
    *(double *)&v22[5] = a4;
    dispatch_async(v21, v22);
  }
}

- (void)_getItemUpdated:(id)a3 progress:(double)a4 state:(int)a5 error:(id)a6
{
  uint64_t v7;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  _QWORD v22[6];
  uint8_t buf[4];
  id v24;
  __int16 v25;
  double v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v7 = *(_QWORD *)&a5;
  v31 = *MEMORY[0x24BDAC8D0];
  v11 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, *(uint64_t *)&a5, (uint64_t)a6);
  dispatch_assert_queue_V2(v11);
  if (IMOSLoggingEnabled())
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      v24 = a3;
      v25 = 2048;
      v26 = a4;
      v27 = 2112;
      v28 = sub_22D29E148(v7, v13, v14, v15, v16);
      v29 = 2112;
      v30 = a6;
      _os_log_impl(&dword_22D296000, v12, OS_LOG_TYPE_INFO, "Get item updated: %@  progress: %f state: %@ error: %@", buf, 0x2Au);
    }
  }
  if (MMCSGetItemStateIsDeterminant())
  {
    v21 = objc_msgSend_replyQueue(self, v17, v18, v19, v20);
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_22D29E194;
    v22[3] = &unk_24F879828;
    v22[4] = a3;
    *(double *)&v22[5] = a4;
    dispatch_async(v21, v22);
  }
}

- (void)_processCompletedItem:(id)a3 error:(id)a4
{
  uint64_t v4;
  NSObject *v7;
  id v8;
  NSMutableDictionary *transferToRequestIDsMap;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  BOOL v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  NSMutableDictionary *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  NSMutableDictionary *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  v7 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, (uint64_t)a4, v4);
  dispatch_assert_queue_V2(v7);
  v8 = a3;
  transferToRequestIDsMap = self->_transferToRequestIDsMap;
  v14 = objc_msgSend_guid(a3, v10, v11, v12, v13);
  v18 = (void *)objc_msgSend_objectForKey_(transferToRequestIDsMap, v15, v14, v16, v17);
  v23 = (void *)objc_msgSend_mutableCopy(v18, v19, v20, v21, v22);
  v28 = (void *)objc_msgSend_mutableCopy(v23, v24, v25, v26, v27);
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v29, (uint64_t)&v92, (uint64_t)v96, 16);
  if (v30)
  {
    v35 = v30;
    v36 = *(_QWORD *)v93;
    if (a3)
      v37 = v28 == 0;
    else
      v37 = 1;
    v38 = !v37;
    do
    {
      v39 = 0;
      do
      {
        if (*(_QWORD *)v93 != v36)
          objc_enumerationMutation(v23);
        v40 = *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * v39);
        v41 = (void *)objc_msgSend_objectForKey_(self->_requestIDToRemainingTransfersMap, v31, v40, v33, v34);
        objc_msgSend_removeObjectIdenticalTo_(v41, v42, (uint64_t)a3, v43, v44);
        if (!objc_msgSend_count(v41, v45, v46, v47, v48))
        {
          v49 = objc_msgSend_objectForKey_(self->_requestIDToBlockMap, v31, v40, v33, v34);
          if (v49)
          {
            v53 = v49;
            v54 = objc_msgSend_objectForKey_(self->_requestIDToTransfersMap, v50, v40, v51, v52);
            (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v53 + 16))(v53, v54, 1, a4);
          }
          objc_msgSend_removeObjectForKey_(self->_requestIDToBlockMap, v50, v40, v51, v52);
          objc_msgSend_removeObjectForKey_(self->_requestIDToRemainingTransfersMap, v55, v40, v56, v57);
          objc_msgSend_removeObjectForKey_(self->_requestIDToTransfersMap, v58, v40, v59, v60);
          objc_msgSend_removeObjectIdenticalTo_(v28, v61, v40, v62, v63);
          if (objc_msgSend_count(v28, v64, v65, v66, v67))
          {
            if (v38)
            {
              v69 = self->_transferToRequestIDsMap;
              v70 = objc_msgSend_guid(a3, v31, v68, v33, v34);
              objc_msgSend_setObject_forKey_(v69, v71, (uint64_t)v28, v70, v72);
            }
          }
          else if (a3)
          {
            v73 = self->_transferToRequestIDsMap;
            v74 = objc_msgSend_guid(a3, v31, v68, v33, v34);
            objc_msgSend_removeObjectForKey_(v73, v75, v74, v76, v77);
          }
        }
        ++v39;
      }
      while (v35 != v39);
      v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v31, (uint64_t)&v92, (uint64_t)v96, 16);
      v35 = v78;
    }
    while (v78);
  }
  if (!objc_msgSend_count(self->_requestIDToTransfersMap, v31, v32, v33, v34))
  {

    self->_requestIDToTransfersMap = 0;
  }
  if (!objc_msgSend_count(self->_requestIDToRemainingTransfersMap, v79, v80, v81, v82))
  {

    self->_requestIDToRemainingTransfersMap = 0;
  }
  if (!objc_msgSend_count(self->_requestIDToBlockMap, v83, v84, v85, v86))
  {

    self->_requestIDToBlockMap = 0;
  }
  if (!objc_msgSend_count(self->_transferToRequestIDsMap, v87, v88, v89, v90))
  {

    self->_transferToRequestIDsMap = 0;
  }

}

- (void)_putItemCompleted:(id)a3 error:(id)a4
{
  uint64_t v4;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v18[6];
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, (uint64_t)a4, v4);
  dispatch_assert_queue_V2(v8);
  objc_msgSend_setMMCSError_(a3, v9, (uint64_t)a4, v10, v11);
  if (IMOSLoggingEnabled())
  {
    v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v20 = a3;
      v21 = 2112;
      v22 = a4;
      _os_log_impl(&dword_22D296000, v16, OS_LOG_TYPE_INFO, "Put item completed: %@  error: %@", buf, 0x16u);
    }
  }
  if (a3)
  {
    v17 = objc_msgSend_replyQueue(self, v12, v13, v14, v15);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = sub_22D29E57C;
    v18[3] = &unk_24F8797D8;
    v18[4] = a4;
    v18[5] = a3;
    dispatch_async(v17, v18);
  }
  objc_msgSend__processCompletedItem_error_(self, v12, (uint64_t)a3, (uint64_t)a4, v15);
}

- (void)_getItemCompleted:(id)a3 path:(id)a4 error:(id)a5
{
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  qos_class_t v22;
  NSObject *v23;
  _QWORD block[7];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v9 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
  dispatch_assert_queue_V2(v9);
  v25 = 0;
  v26 = &v25;
  v27 = 0x3052000000;
  v28 = sub_22D29A960;
  v29 = sub_22D29A970;
  v30 = a5;
  objc_msgSend_setMMCSError_(a3, v10, (uint64_t)a5, v11, v12);
  if (IMOSLoggingEnabled())
  {
    v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = v26[5];
      *(_DWORD *)buf = 138412546;
      v32 = a3;
      v33 = 2112;
      v34 = v14;
      _os_log_impl(&dword_22D296000, v13, OS_LOG_TYPE_INFO, "Get item completed: %@  error: %@", buf, 0x16u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = v26[5];
      *(_DWORD *)buf = 138412546;
      v32 = a4;
      v33 = 2112;
      v34 = v16;
      _os_log_impl(&dword_22D296000, v15, OS_LOG_TYPE_INFO, "[=MMCS-Timing=]  Get Item completed for path: %@  (error: %@)", buf, 0x16u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = qos_class_self();
      *(_DWORD *)buf = 67109120;
      LODWORD(v32) = v22;
      _os_log_impl(&dword_22D296000, v21, OS_LOG_TYPE_INFO, "Get item completed running at qos (%u)", buf, 8u);
    }
  }
  if (a3)
  {
    v23 = objc_msgSend_replyQueue(self, v17, v18, v19, v20);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_22D29EA8C;
    block[3] = &unk_24F879680;
    block[5] = a4;
    block[6] = &v25;
    block[4] = a3;
    dispatch_async(v23, block);
  }
  objc_msgSend__processCompletedItem_error_(self, v17, (uint64_t)a3, v26[5], v20);
  _Block_object_dispose(&v25, 8);
}

- (void)_itemCompleted:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, v3, v4);
  dispatch_assert_queue_V2(v6);
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = a3;
      _os_log_impl(&dword_22D296000, v7, OS_LOG_TYPE_INFO, "Item completed: %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (id)_MMCSICloudRequestHeadersCopy:(__CFString *)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;

  v5 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, v3, v4);
  dispatch_assert_queue_V2(v5);
  return (id)MMCSICloudRequestHeadersCopy();
}

- (int64_t)connectionBehavior
{
  return self->_connectionBehavior;
}

- (void)setConnectionBehavior:(int64_t)a3
{
  self->_connectionBehavior = a3;
}

- (NSMutableDictionary)transfers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (NSMutableDictionary)transferIDToContextMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (NSRecursiveLock)transferIDContextMapLock
{
  return (NSRecursiveLock *)objc_getProperty(self, a2, 104, 1);
}

- (void)setTransferIDContextMapLock:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (OS_dispatch_queue)replyQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 112, 1);
}

- (void)setReplyQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

@end
