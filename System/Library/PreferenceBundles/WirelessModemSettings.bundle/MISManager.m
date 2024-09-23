@implementation MISManager

+ (id)sharedManager
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)sharedInstance;
  if (!sharedInstance)
  {
    v4 = objc_alloc_init((Class)a1);
    v5 = (void *)sharedInstance;
    sharedInstance = (uint64_t)v4;

    v3 = (void *)sharedInstance;
  }
  return v3;
}

- (void)authenticate
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
  _os_log_error_impl(&dword_22FE37000, log, OS_LOG_TYPE_ERROR, "Skipping authentication check (state: %u, reason: %u)", (uint8_t *)v5, 0xEu);
  OUTLINED_FUNCTION_1();
}

- (void)getState:(int *)a3 andReason:(int *)a4
{
  if (self->_needStateUpdate)
  {
    -[MISManager readMISState:andReason:](self, "readMISState:andReason:", &self->_state, &self->_reason);
    self->_needStateUpdate = 0;
  }
  if (a3)
    *a3 = self->_state;
  if (a4)
    *a4 = self->_reason;
}

- (MISManager)init
{
  MISManager *v2;
  NSObject *v3;
  MISManager *v4;
  RadiosPreferences *v5;
  RadiosPreferences *radioPrefs;
  SCDynamicStoreRef v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFRunLoop *Current;
  void *v17;
  void *v18;
  SCDynamicStoreContext v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)MISManager;
  v2 = -[MISManager init](&v21, sel_init);
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    WMSLogComponent();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[MISManager init].cold.2(v3);

  }
  v2->_netClient = 0;
  *(_QWORD *)&v2->_state = 1020;
  v2->_needStateUpdate = 1;
  v20.version = 0;
  memset(&v20.retain, 0, 24);
  v4 = v2;
  v20.info = v4;
  v5 = (RadiosPreferences *)objc_alloc_init(MEMORY[0x24BE04788]);
  radioPrefs = v4->_radioPrefs;
  v4->_radioPrefs = v5;

  v7 = SCDynamicStoreCreate(0, CFSTR("com.apple.wirelessmodemsettings.MISManager"), (SCDynamicStoreCallBack)__SCDynamicStoreCallback, &v20);
  v4->_scDynamicStore = v7;
  if (v7)
  {
    WMSLogComponent();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MISManager init].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

    SCDynamicStoreAddWatchedKey();
    v4->_scRunLoopSource = SCDynamicStoreCreateRunLoopSource(0, v4->_scDynamicStore, 0);
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, v4->_scRunLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD598]);
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", *(_OWORD *)&v20.version, *(_OWORD *)&v20.retain, v20.copyDescription);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObserver:selector:name:object:", v4, sel_applicationDidBecomeActive_, CFSTR("UIApplicationDidBecomeActiveNotification"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObserver:selector:name:object:", v4, sel_applicationWillResignActive_, CFSTR("UIApplicationWillResignActiveNotification"), 0);

  CTTelephonyCenterGetDefault();
  CTTelephonyCenterAddObserver();
  -[MISManager attachMIS](v4, "attachMIS");
  return v4;
}

- (void)attachMIS
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_0(&dword_22FE37000, v0, v1, "Creating MIS client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

uint64_t __23__MISManager_attachMIS__block_invoke(int a1, int a2, xpc_object_t xdict)
{
  NSObject *v3;
  void *v4;

  if (a2 == 1001 && xpc_dictionary_get_uint64(xdict, (const char *)*MEMORY[0x24BE6B6A0]) == 5002)
  {
    WMSLogComponent();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __23__MISManager_attachMIS__block_invoke_cold_1();

    +[MISManager sharedManager](MISManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopService");

  }
  return 0;
}

void __23__MISManager_attachMIS__block_invoke_18(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = _NETRBClientCreate();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  WMSLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
  if (v2)
  {
    if (v4)
      __23__MISManager_attachMIS__block_invoke_18_cold_2();
  }
  else if (v4)
  {
    __23__MISManager_attachMIS__block_invoke_18_cold_1();
  }

}

- (void)detachMIS
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_0(&dword_22FE37000, v0, v1, "Destroying MIS client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)stopService
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_0(&dword_22FE37000, v0, v1, "Stopping MIS service", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (BOOL)didUserPreventData
{
  return (-[RadiosPreferences airplaneMode](self->_radioPrefs, "airplaneMode") & 1) != 0
      || CTCellularDataPlanGetIsEnabled() == 0;
}

- (void)setState:(int)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v13;

  if ((a3 & 0xFFFFFFFE) != 0x3FE)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MISManager.m"), 173, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(state == NETRB_SVC_STATE_ON) || (state == NETRB_SVC_STATE_OFF)"));

  }
  if (self->_netClient)
  {
    WMSLogComponent();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[MISManager setState:].cold.1(a3 == 1023, v5, v6, v7, v8, v9, v10, v11);

    _NETRBClientSetGlobalServiceState();
  }
}

- (void)readMISState:(int *)a3 andReason:(int *)a4
{
  int state;
  int reason;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  state = self->_state;
  reason = self->_reason;
  v8 = (void *)SCDynamicStoreCopyValue(self->_scDynamicStore, CFSTR("com.apple.MobileInternetSharing"));
  v11 = v8;
  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("State"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    state = objc_msgSend(v9, "intValue");

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Reason"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    reason = objc_msgSend(v10, "intValue");

  }
  if (a3)
    *a3 = state;
  if (a4)
    *a4 = reason;

}

- (void)sendStateUpdate
{
  uint64_t state;
  uint64_t v4;
  uint64_t reason;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  -[MISManager readMISState:andReason:](self, "readMISState:andReason:", (char *)&v13 + 4, &v13);
  state = self->_state;
  if (HIDWORD(v13) != (_DWORD)state)
  {
    reason = self->_reason;
    v4 = v13;
    goto LABEL_5;
  }
  v4 = v13;
  reason = self->_reason;
  if ((_DWORD)v13 != (_DWORD)reason)
  {
LABEL_5:
    NSLog(CFSTR("MIS state change: %u -> %u, reason: %u -> %u"), state, HIDWORD(v13), reason, v4);
    v14[0] = CFSTR("State");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", HIDWORD(v13));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v6;
    v14[1] = CFSTR("Reason");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v7;
    v14[2] = CFSTR("PreviousState");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_state);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2] = v8;
    v14[3] = CFSTR("PreviousReason");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_reason);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[3] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v13;
    self->_state = HIDWORD(v13);
    self->_reason = v11;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("MISManagerStateChangedNotification"), 0, v10);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radioPrefs, 0);
}

- (void)init
{
  void *v2;
  int v3;
  const char *v4;
  __int16 v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 136315394;
  v4 = "-[MISManager init]";
  v5 = 2112;
  v6 = v2;
  _os_log_error_impl(&dword_22FE37000, a1, OS_LOG_TYPE_ERROR, "%s ERROR: instantiating MISManager from a background thread will break functionality\n%@", (uint8_t *)&v3, 0x16u);

}

void __23__MISManager_attachMIS__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_0(&dword_22FE37000, v0, v1, "MIS authentication was successful", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __23__MISManager_attachMIS__block_invoke_18_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_0(&dword_22FE37000, v0, v1, "Failed to create MIS client!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __23__MISManager_attachMIS__block_invoke_18_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_0(&dword_22FE37000, v0, v1, "Attached to MIS", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)setState:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22FE37000, a2, a3, "Setting tethering state %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
