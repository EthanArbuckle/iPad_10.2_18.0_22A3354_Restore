@implementation WFCellularPlansManager

- (WFCellularPlansManager)init
{
  WFCellularPlansManager *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  void *v7;
  objc_class *v8;
  uint64_t v9;
  CoreTelephonyClient *client;
  WFCellularPlansManager *v11;
  objc_super v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v13.receiver = self;
  v13.super_class = (Class)WFCellularPlansManager;
  v2 = -[WFCellularPlansManager init](&v13, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.shortcuts.WFCellularPlansManager", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v15 = 0;
    v16 = &v15;
    v17 = 0x2050000000;
    v7 = (void *)getCoreTelephonyClientClass_softClass_18587;
    v18 = getCoreTelephonyClientClass_softClass_18587;
    if (!getCoreTelephonyClientClass_softClass_18587)
    {
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __getCoreTelephonyClientClass_block_invoke_18588;
      v14[3] = &unk_24F8BB430;
      v14[4] = &v15;
      __getCoreTelephonyClientClass_block_invoke_18588((uint64_t)v14);
      v7 = (void *)v16[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v15, 8);
    v9 = objc_msgSend([v8 alloc], "initWithQueue:", v2->_queue);
    client = v2->_client;
    v2->_client = (CoreTelephonyClient *)v9;

    v11 = v2;
  }

  return v2;
}

- (NSArray)allPlans
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  WFCellularPlansManager *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(getCTCellularPlanManagerClass(), "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "planItemsShouldUpdate:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCellularPlansManager client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v5, "getSubscriptionInfoWithError:", &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v16;

  if (v7)
  {
    getWFActionsLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[WFCellularPlansManager allPlans]";
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_22D353000, v8, OS_LOG_TYPE_ERROR, "%s Failed to get CTXPCServiceSubscriptionInfo with error: %@", buf, 0x16u);
    }
    v9 = (void *)MEMORY[0x24BDBD1A8];
  }
  else
  {
    objc_msgSend(v6, "subscriptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __34__WFCellularPlansManager_allPlans__block_invoke;
    v12[3] = &unk_24F8B4188;
    v13 = v3;
    v14 = v10;
    v15 = self;
    v8 = v10;
    objc_msgSend(v4, "if_compactMap:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSArray *)v9;
}

- (BOOL)setDefaultVoiceLineToPlan:(id)a3 error:(id *)a4
{
  id v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_msgSend(v6, "isDataOnlyLine");
  getWFActionsLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "label");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 136315394;
      v17 = "-[WFCellularPlansManager setDefaultVoiceLineToPlan:error:]";
      v18 = 2112;
      v19 = v14;
      _os_log_impl(&dword_22D353000, v9, OS_LOG_TYPE_DEBUG, "%s Setting default voice line to plan with label %@", (uint8_t *)&v16, 0x16u);

    }
    -[WFCellularPlansManager client](self, "client");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ctContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDefaultVoice:error:", v13, a4);
    goto LABEL_9;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v16 = 136315138;
    v17 = "-[WFCellularPlansManager setDefaultVoiceLineToPlan:error:]";
    _os_log_impl(&dword_22D353000, v9, OS_LOG_TYPE_ERROR, "%s Cannot use data-only line as voice line, bailing out", (uint8_t *)&v16, 0xCu);
  }

  if (a4)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BEC4270];
    v20 = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("Cannot set a data-only cellular plan as the Default Voice Line."));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 5, v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:

  }
  return v7 ^ 1;
}

- (BOOL)setDefaultDataLineToPlan:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  getWFActionsLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "label");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315394;
    v13 = "-[WFCellularPlansManager setDefaultDataLineToPlan:error:]";
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_22D353000, v7, OS_LOG_TYPE_DEBUG, "%s Setting default data line to plan with label %@", (uint8_t *)&v12, 0x16u);

  }
  -[WFCellularPlansManager client](self, "client");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ctContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActiveUserDataSelection:error:", v10, a4);

  return 1;
}

- (BOOL)setAutomaticDataLineSwitching:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v4;
  NSObject *v6;
  void *v7;
  id v8;
  int v10;
  const char *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v4 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  getWFActionsLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v10 = 136315394;
    v11 = "-[WFCellularPlansManager setAutomaticDataLineSwitching:error:]";
    v12 = 1024;
    v13 = v4;
    _os_log_impl(&dword_22D353000, v6, OS_LOG_TYPE_DEBUG, "%s Setting automatic data line switching to %d", (uint8_t *)&v10, 0x12u);
  }

  -[WFCellularPlansManager client](self, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "setSupportDynamicDataSimSwitch:", v4);

  return 1;
}

- (BOOL)resetCellularDataStatisticsWithError:(id *)a3
{
  void *v4;
  void *v5;
  const void *v6;
  NSObject *v7;
  void *v9;
  void *v10;
  _QWORD v11[2];
  __int128 v12;
  uint64_t v13;
  __int128 buf;
  uint64_t v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v11[0] = 0;
  v12 = 0u;
  v13 = 0;
  v11[1] = self;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v15 = 0x2020000000;
  v4 = get_CTServerConnectionCreateWithIdentifierSymbolLoc_ptr;
  v16 = get_CTServerConnectionCreateWithIdentifierSymbolLoc_ptr;
  if (!get_CTServerConnectionCreateWithIdentifierSymbolLoc_ptr)
  {
    v5 = CoreTelephonyLibrary_18488();
    v4 = dlsym(v5, "_CTServerConnectionCreateWithIdentifier");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v4;
    get_CTServerConnectionCreateWithIdentifierSymbolLoc_ptr = v4;
  }
  _Block_object_dispose(&buf, 8);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CTServerConnectionRef WFCTServerConnectionCreateWithIdentifier(CFAllocatorRef, CFStringRef, CTServerConnectionCallback, _CTServerConnectionContext *)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("WFCellularManager.m"), 37, CFSTR("%s"), dlerror());

    __break(1u);
  }
  v6 = (const void *)((uint64_t (*)(_QWORD, const __CFString *, uint64_t (*)(), _QWORD *))v4)(*MEMORY[0x24BDBD240], CFSTR("com.apple.shortcuts"), WFCoreTelephonyConnectionCallbackStub, v11);
  if (v6)
  {
    _CTServerConnectionEraseCellularDataUsageRecords();
    CFRelease(v6);
  }
  else
  {
    getWFActionsLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[WFCellularPlansManager resetCellularDataStatisticsWithError:]";
      _os_log_impl(&dword_22D353000, v7, OS_LOG_TYPE_ERROR, "%s Failed to get CTServerConnection", (uint8_t *)&buf, 0xCu);
    }

    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC4270], 16, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v6 != 0;
}

- (BOOL)setPlanStatus:(BOOL)a3 forPlan:(id)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  _BYTE v25[18];
  uint64_t v26;

  v6 = a3;
  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  getWFActionsLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v7, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v23 = "-[WFCellularPlansManager setPlanStatus:forPlan:error:]";
    v24 = 1024;
    *(_DWORD *)v25 = v6;
    *(_WORD *)&v25[4] = 2112;
    *(_QWORD *)&v25[6] = v9;
    _os_log_impl(&dword_22D353000, v8, OS_LOG_TYPE_DEBUG, "%s Setting status to %d for plan with label %@", buf, 0x1Cu);

  }
  objc_msgSend(getCTCellularPlanManagerClass(), "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "planItemsShouldUpdate:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __54__WFCellularPlansManager_setPlanStatus_forPlan_error___block_invoke;
  v20[3] = &unk_24F8B41B0;
  v12 = v7;
  v21 = v12;
  objc_msgSend(v11, "if_firstObjectPassingTest:", v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v10, "didSelectPlanItem:isEnable:", v13, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 == 0;
    getWFActionsLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (v14)
    {
      if (v17)
      {
        *(_DWORD *)buf = 136315650;
        v23 = "-[WFCellularPlansManager setPlanStatus:forPlan:error:]";
        v24 = 2112;
        *(_QWORD *)v25 = v12;
        *(_WORD *)&v25[8] = 2112;
        *(_QWORD *)&v25[10] = v14;
        _os_log_impl(&dword_22D353000, v16, OS_LOG_TYPE_ERROR, "%s Failed to set plan item state for plan %@: %@", buf, 0x20u);
      }

      if (a5)
        *a5 = objc_retainAutorelease(v14);
    }
    else
    {
      if (v17)
      {
        *(_DWORD *)buf = 136315650;
        v23 = "-[WFCellularPlansManager setPlanStatus:forPlan:error:]";
        v24 = 1024;
        *(_DWORD *)v25 = v6;
        *(_WORD *)&v25[4] = 2112;
        *(_QWORD *)&v25[6] = v12;
        _os_log_impl(&dword_22D353000, v16, OS_LOG_TYPE_ERROR, "%s Successfully set plan item state to %d for plan %@", buf, 0x1Cu);
      }

    }
  }
  else
  {
    getWFActionsLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[WFCellularPlansManager setPlanStatus:forPlan:error:]";
      _os_log_impl(&dword_22D353000, v18, OS_LOG_TYPE_ERROR, "%s Could not find a valid plan item, bailing out.", buf, 0xCu);
    }

    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC4270], 5, 0);
      v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (id)contexts
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[WFCellularPlansManager client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "getSubscriptionInfoWithError:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;

  if (v4)
  {
    getWFActionsLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[WFCellularPlansManager contexts]";
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_22D353000, v5, OS_LOG_TYPE_ERROR, "%s Failed to get CTXPCServiceSubscriptionInfo with error: %@", buf, 0x16u);
    }

  }
  objc_msgSend(v3, "subscriptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __54__WFCellularPlansManager_setPlanStatus_forPlan_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "iccid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "iccid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

WFCellularPlan *__34__WFCellularPlansManager_allPlans__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  WFCellularPlan *v14;
  WFCellularPlan *v15;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_alloc(MEMORY[0x24BDD1880]);
  objc_msgSend(*(id *)(a1 + 32), "getSubscriptionContextUUIDforPlan:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithUUIDString:", v5);

  v7 = *(void **)(a1 + 40);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __34__WFCellularPlansManager_allPlans__block_invoke_2;
  v17[3] = &unk_24F8B4160;
  v8 = v6;
  v18 = v8;
  objc_msgSend(v7, "if_firstObjectPassingTest:", v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    getWFActionsLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "UUIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v20 = "-[WFCellularPlansManager allPlans]_block_invoke";
      v21 = 2112;
      v22 = v11;
      _os_log_impl(&dword_22D353000, v10, OS_LOG_TYPE_DEFAULT, "%s CTXPCServiceSubscriptionContext couldn't be created (%@), still creating cellular plan but some functionality may not be available.", buf, 0x16u);

    }
  }
  if (objc_msgSend(v9, "isSimHidden"))
  {
    getWFActionsLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v20 = "-[WFCellularPlansManager allPlans]_block_invoke";
      v21 = 2112;
      v22 = v13;
      _os_log_impl(&dword_22D353000, v12, OS_LOG_TYPE_INFO, "%s Won't create a WFCellularPlan for contextUUID %@ because that SIM is hidden", buf, 0x16u);

    }
    v14 = 0;
  }
  else
  {
    v15 = [WFCellularPlan alloc];
    objc_msgSend(*(id *)(a1 + 48), "client");
    v12 = objc_claimAutoreleasedReturnValue();
    v14 = -[WFCellularPlan initWithCTXPCServiceSubscriptionContext:client:planItem:](v15, "initWithCTXPCServiceSubscriptionContext:client:planItem:", v9, v12, v3);
  }

  return v14;
}

uint64_t __34__WFCellularPlansManager_allPlans__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

+ (id)modesFromDataRate:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "dataRateToRadioAccessTechnologyModeMapping");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)dataRateToRadioAccessTechnologyModeMapping
{
  _QWORD v3[9];
  _QWORD v4[10];

  v4[9] = *MEMORY[0x24BDAC8D0];
  v3[0] = &unk_24F93A430;
  v3[1] = &unk_24F93A448;
  v4[0] = &unk_24F93C498;
  v4[1] = &unk_24F93C4B0;
  v3[2] = &unk_24F93A460;
  v3[3] = &unk_24F93A478;
  v4[2] = &unk_24F93C4C8;
  v4[3] = &unk_24F93C4E0;
  v3[4] = &unk_24F93A490;
  v3[5] = &unk_24F93A4A8;
  v4[4] = &unk_24F93C4F8;
  v4[5] = &unk_24F93C510;
  v3[6] = &unk_24F93A4C0;
  v3[7] = &unk_24F93A4D8;
  v4[6] = &unk_24F93C528;
  v4[7] = &unk_24F93C540;
  v3[8] = &unk_24F93A508;
  v4[8] = &unk_24F93C558;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 9);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
