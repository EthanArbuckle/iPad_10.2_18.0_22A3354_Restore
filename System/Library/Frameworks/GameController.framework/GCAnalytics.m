@implementation GCAnalytics

+ (id)instance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__GCAnalytics_GameController__instance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (instance_dispatcher != -1)
    dispatch_once(&instance_dispatcher, block);
  return (id)instance_sharedInstance;
}

void __39__GCAnalytics_GameController__instance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)instance_sharedInstance;
  instance_sharedInstance = (uint64_t)v1;

}

- (id)getBundleID
{
  NSString *bundleID;
  void *v4;
  NSString *v5;
  NSString *v6;
  void *v7;
  NSString *v8;
  NSString *v9;

  bundleID = self->_bundleID;
  if (!bundleID)
  {
    +[NSBundle mainBundle](&off_254DF2768, "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_bundleID;
    self->_bundleID = v5;

    bundleID = self->_bundleID;
    if (!bundleID)
    {
      +[NSProcessInfo processInfo](&off_254DF29B0, "processInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "processName");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      v9 = self->_bundleID;
      self->_bundleID = v8;

      bundleID = self->_bundleID;
    }
  }
  return bundleID;
}

- (void)dealloc
{
  NSTimer *eventPollTimer;
  objc_super v4;

  -[NSTimer invalidate](self->_eventPollTimer, "invalidate");
  eventPollTimer = self->_eventPollTimer;
  self->_eventPollTimer = 0;

  v4.receiver = self;
  v4.super_class = (Class)GCAnalytics;
  -[GCAnalytics dealloc](&v4, sel_dealloc);
}

- (void)sendInputsPressedEvent:(id *)a3
{
  AnalyticsSendEventLazy();
}

id __54__GCAnalytics_GameController__sendInputsPressedEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v7 = CFSTR("bundleID");
  objc_msgSend(*(id *)(a1 + 32), "getBundleID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSMutableDictionary dictionaryWithDictionary:](&off_254DEBD30, "dictionaryWithDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  convertToDict(*(unsigned int **)(a1 + 40), (void (*)(_QWORD))numberFromInt);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v5);

  return v4;
}

- (void)checkMultipleControllers
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (checkMultipleControllers_maximumControllersConnectedForSentEvent <= 3)
  {
    v3 = objc_alloc_init((Class)&off_254DEBB20);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[NSMutableDictionary allValues](self->_controllersData, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if ((objc_msgSend(v10, "isATVRemote") & 1) == 0)
          {
            ++v7;
            objc_msgSend(v10, "detailedProductCategory");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v11);

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }

    objc_msgSend(v3, "sortUsingSelector:", sel_localizedCaseInsensitiveCompare_);
    if (v7 >= 2 && v7 > checkMultipleControllers_maximumControllersConnectedForSentEvent)
    {
      v12 = v3;
      AnalyticsSendEventLazy();
      checkMultipleControllers_maximumControllersConnectedForSentEvent = v7;

    }
  }
}

id __55__GCAnalytics_GameController__checkMultipleControllers__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "getBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("bundleID"));

  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("%d"), getpid());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("processID"));

  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("controller1"));

  }
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") >= 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("controller2"));

  }
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") >= 3)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("controller3"));

  }
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") >= 4)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("controller4"));

  }
  return v2;
}

- (void)runInputPollTimer
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__GCAnalytics_GameController__runInputPollTimer__block_invoke;
  block[3] = &unk_24D2B2B20;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __48__GCAnalytics_GameController__runInputPollTimer__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__GCAnalytics_GameController__runInputPollTimer__block_invoke_2;
  v5[3] = &unk_24D2B2DE8;
  v5[4] = *(_QWORD *)(a1 + 32);
  +[NSTimer scheduledTimerWithTimeInterval:repeats:block:](&off_254DF2B68, "scheduledTimerWithTimeInterval:repeats:block:", 1, v5, 10.0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

}

uint64_t __48__GCAnalytics_GameController__runInputPollTimer__block_invoke_2(uint64_t a1)
{
  uint64_t result;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[4];
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  if (result)
  {
    v12 = 0u;
    memset(v13, 0, 60);
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allValues", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          *(int32x2_t *)&v8 = batchInputData((uint64_t)v13, *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7++));
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16, v8);
      }
      while (v5);
    }

    return objc_msgSend(*(id *)(a1 + 32), "sendInputsPressedEvent:", v13);
  }
  return result;
}

- (void)publishController:(id)a3
{
  id v4;
  uint64_t v5;
  NSMutableDictionary *controllersData;
  void *v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  _QWORD block[5];

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__GCAnalytics_GameController__publishController___block_invoke;
  block[3] = &unk_24D2B2B20;
  block[4] = self;
  if (publishController__dispatcher != -1)
    dispatch_once(&publishController__dispatcher, block);
  v16 = 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v11 = 0u;
  dataFromController(v4, (uint64_t)&v11);
  controllersData = self->_controllersData;
  +[NSNumber numberWithUnsignedInteger:](&off_254DED908, "numberWithUnsignedInteger:", objc_msgSend(v4, "deviceHash"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](controllersData, "setObject:forKey:", v4, v7);

  v8 = (id)v11;
  v9 = *((id *)&v11 + 1);
  v10 = (id)v12;
  AnalyticsSendEventLazy();
  -[GCAnalytics checkMultipleControllers](self, "checkMultipleControllers", v5, 3254779904, __49__GCAnalytics_GameController__publishController___block_invoke_2, &unk_24D2B2E10, self);

}

uint64_t __49__GCAnalytics_GameController__publishController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "runInputPollTimer");
}

id __49__GCAnalytics_GameController__publishController___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[9];
  _QWORD v16[10];

  v16[9] = *MEMORY[0x24BDAC8D0];
  v15[0] = CFSTR("productCategoryName");
  v15[1] = CFSTR("connectionCount");
  v3 = a1 + 32;
  v2 = *(void **)(a1 + 32);
  v16[0] = *(_QWORD *)(v3 + 8);
  v16[1] = &unk_24D30DDE0;
  v15[2] = CFSTR("bundleID");
  objc_msgSend(v2, "getBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v16[2] = v4;
  v16[3] = v5;
  v15[3] = CFSTR("vendorName");
  v15[4] = CFSTR("profileName");
  v16[4] = v6;
  v15[5] = CFSTR("isFormFitting");
  +[NSNumber numberWithBool:](&off_254DED908, "numberWithBool:", *(unsigned __int8 *)(a1 + 64));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v7;
  v15[6] = CFSTR("hasClickableThumbsticks");
  +[NSNumber numberWithBool:](&off_254DED908, "numberWithBool:", *(unsigned __int8 *)(a1 + 65));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[6] = v8;
  v15[7] = CFSTR("isSiriRemote");
  +[NSNumber numberWithBool:](&off_254DED908, "numberWithBool:", *(unsigned __int8 *)(a1 + 66));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[7] = v9;
  v15[8] = CFSTR("isPhysicalRemote");
  +[NSNumber numberWithBool:](&off_254DED908, "numberWithBool:", *(unsigned __int8 *)(a1 + 67));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[8] = v10;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v16, v15, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSMutableDictionary dictionaryWithDictionary:](&off_254DEBD30, "dictionaryWithDictionary:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  convertToDict((unsigned int *)(a1 + 68), (void (*)(_QWORD))stringFromState);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addEntriesFromDictionary:", v13);

  return v12;
}

- (void)unpublishController:(id)a3
{
  NSMutableDictionary *controllersData;
  id v4;

  controllersData = self->_controllersData;
  +[NSNumber numberWithUnsignedInteger:](&off_254DED908, "numberWithUnsignedInteger:", objc_msgSend(a3, "deviceHash"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](controllersData, "removeObjectForKey:", v4);

}

- (void)onSiriMotionEnabled
{
  AnalyticsSendEventLazy();
}

id __50__GCAnalytics_GameController__onSiriMotionEnabled__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("bundleID");
  objc_msgSend(*(id *)(a1 + 32), "getBundleID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)sendSettingsEnteredEvent
{
  AnalyticsSendEventLazy();
}

void *__58__GCAnalytics_SettingsAnalytics__sendSettingsEnteredEvent__block_invoke()
{
  return &unk_24D30F930;
}

- (void)sendSettingsCustomizationsToggledEventForBundleID:(id)a3 productCategory:(id)a4 toggledOn:(BOOL)a5
{
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;

  v6 = (__CFString *)a3;
  v7 = (__CFString *)a4;
  v8 = CFSTR("N/A");
  if (v6)
    v9 = v6;
  else
    v9 = CFSTR("N/A");
  if (v7)
    v8 = v7;
  v12 = v9;
  v13 = v8;
  v10 = v8;
  v11 = v9;
  AnalyticsSendEventLazy();

}

id __110__GCAnalytics_SettingsAnalytics__sendSettingsCustomizationsToggledEventForBundleID_productCategory_toggledOn___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v5[0] = CFSTR("bundleID");
  v5[1] = CFSTR("productCategory");
  v1 = *(_QWORD *)(a1 + 40);
  v6[0] = *(_QWORD *)(a1 + 32);
  v6[1] = v1;
  v5[2] = CFSTR("customizationsToggledOn");
  +[NSNumber numberWithBool:](&off_254DED908, "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)sendSettingsCustomizationsResetEventForBundleID:(id)a3 productCategory:(id)a4
{
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;

  v5 = (__CFString *)a3;
  v6 = (__CFString *)a4;
  v7 = CFSTR("N/A");
  if (!v5)
    v5 = CFSTR("N/A");
  if (v6)
    v7 = v6;
  v10 = v5;
  v11 = v7;
  v8 = v7;
  v9 = v5;
  AnalyticsSendEventLazy();

}

id __98__GCAnalytics_SettingsAnalytics__sendSettingsCustomizationsResetEventForBundleID_productCategory___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("bundleID");
  v3[1] = CFSTR("productCategory");
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = *(_QWORD *)(a1 + 32);
  v4[1] = v1;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)sendSettingsButtonCustomizedEventForBundleID:(id)a3 productCategory:(id)a4 button:(id)a5
{
  __CFString *v7;
  __CFString *v8;
  id v9;
  __CFString *v10;
  id v11;

  v7 = (__CFString *)a3;
  v8 = (__CFString *)a4;
  v9 = a5;
  if (v9)
  {
    if (v7)
      v10 = v7;
    else
      v10 = CFSTR("N/A");
    if (!v8)
      v8 = CFSTR("N/A");
    v7 = v10;
    v8 = v8;
    v11 = v9;
    AnalyticsSendEventLazy();

  }
}

id __102__GCAnalytics_SettingsAnalytics__sendSettingsButtonCustomizedEventForBundleID_productCategory_button___block_invoke(uint64_t a1)
{
  __int128 v1;
  _QWORD v3[3];
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v1 = *(_OWORD *)(a1 + 32);
  v3[0] = CFSTR("bundleID");
  v3[1] = CFSTR("productCategory");
  v4 = v1;
  v3[2] = CFSTR("buttonName");
  v5 = *(_QWORD *)(a1 + 48);
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", &v4, v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)sendSettingsIdentifyControllerEventForProductCategory:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;

  v3 = (__CFString *)a3;
  v4 = CFSTR("N/A");
  if (v3)
    v4 = v3;
  v6 = v4;
  v5 = v4;
  AnalyticsSendEventLazy();

}

id __88__GCAnalytics_SettingsAnalytics__sendSettingsIdentifyControllerEventForProductCategory___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("productCategory");
  v4[0] = v1;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)sendSettingsDevicesEventForTotalCustomizedControllersCount:(int)a3
{
  AnalyticsSendEventLazy();
}

id __93__GCAnalytics_SettingsAnalytics__sendSettingsDevicesEventForTotalCustomizedControllersCount___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("customizedControllersCount");
  +[NSNumber numberWithInt:](&off_254DED908, "numberWithInt:", *(unsigned int *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)sendSettingsCustomizedAppsEventForTotalCustomizedAppsCount:(int)a3
{
  AnalyticsSendEventLazy();
}

id __93__GCAnalytics_SettingsAnalytics__sendSettingsCustomizedAppsEventForTotalCustomizedAppsCount___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("customizedAppsCount");
  +[NSNumber numberWithInt:](&off_254DED908, "numberWithInt:", *(unsigned int *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)sendSettingsRPKitGesturesCustomized:(id)a3 from:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *context;
  id v22;
  void *v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  getGCSettingsLogger();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v32 = v5;
    v33 = 2112;
    v34 = v6;
    _os_log_impl(&dword_215181000, v7, OS_LOG_TYPE_DEFAULT, "sendSettingsRPKitGesturesCustomized %@, %@", buf, 0x16u);
  }

  if (v5)
  {
    if (v6)
    {
      objc_msgSend(v5, "controllerElementMappingKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v23 = (void *)objc_opt_new();
        v9 = objc_msgSend(v5, "singlePressGesture");
        if (v9 != objc_msgSend(v6, "singlePressGesture"))
        {
          GCSystemGestureModeToString(objc_msgSend(v5, "singlePressGesture"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v10, CFSTR("Single Press"));

        }
        v11 = objc_msgSend(v5, "doublePressGesture");
        if (v11 != objc_msgSend(v6, "doublePressGesture"))
        {
          GCSystemGestureModeToString(objc_msgSend(v5, "doublePressGesture"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v12, CFSTR("Double Press"));

        }
        v13 = objc_msgSend(v5, "longPressGesture");
        if (v13 != objc_msgSend(v6, "longPressGesture"))
        {
          GCSystemGestureModeToString(objc_msgSend(v5, "longPressGesture"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v14, CFSTR("Long Press"));

        }
        v22 = v6;
        getGCSettingsLogger();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v32 = v23;
          _os_log_impl(&dword_215181000, v15, OS_LOG_TYPE_DEFAULT, "sendSettingsRPKitGesturesCustomized changedGestures %@", buf, 0xCu);
        }

        context = (void *)MEMORY[0x2199DE97C]();
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        objc_msgSend(v23, "allKeys");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v27;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v27 != v19)
                objc_enumerationMutation(v16);
              v24 = v5;
              v25 = v23;
              AnalyticsSendEventLazy();

            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          }
          while (v18);
        }

        objc_autoreleasePoolPop(context);
        v6 = v22;
      }
    }
  }

}

id __75__GCAnalytics_SettingsAnalytics__sendSettingsRPKitGesturesCustomized_from___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("buttonName");
  objc_msgSend(*(id *)(a1 + 32), "controllerElementMappingKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(a1 + 48);
  v9[0] = v2;
  v9[1] = v4;
  v8[1] = CFSTR("gestureType");
  v8[2] = CFSTR("gestureMode");
  objc_msgSend(v3, "objectForKeyedSubscript:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)sendRPKitScreenshotSavedEventForBundleID:(id)a3 productCategory:(id)a4
{
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;

  v5 = (__CFString *)a3;
  v6 = (__CFString *)a4;
  v7 = CFSTR("N/A");
  if (!v5)
    v5 = CFSTR("N/A");
  if (v6)
    v7 = v6;
  v10 = v5;
  v11 = v7;
  v8 = v7;
  v9 = v5;
  AnalyticsSendEventLazy();

}

id __92__GCAnalytics_ReplayKitAnalytics__sendRPKitScreenshotSavedEventForBundleID_productCategory___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("bundleID");
  v3[1] = CFSTR("productCategory");
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = *(_QWORD *)(a1 + 32);
  v4[1] = v1;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)sendRPKitManualRecordingSavedEventForBundleID:(id)a3 productCategory:(id)a4 duration:(int)a5
{
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;

  v6 = (__CFString *)a3;
  v7 = (__CFString *)a4;
  v8 = CFSTR("N/A");
  if (v6)
    v9 = v6;
  else
    v9 = CFSTR("N/A");
  if (v7)
    v8 = v7;
  v12 = v9;
  v13 = v8;
  v10 = v8;
  v11 = v9;
  AnalyticsSendEventLazy();

}

id __106__GCAnalytics_ReplayKitAnalytics__sendRPKitManualRecordingSavedEventForBundleID_productCategory_duration___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v5[0] = CFSTR("bundleID");
  v5[1] = CFSTR("productCategory");
  v1 = *(_QWORD *)(a1 + 40);
  v6[0] = *(_QWORD *)(a1 + 32);
  v6[1] = v1;
  v5[2] = CFSTR("duration");
  +[NSNumber numberWithInt:](&off_254DED908, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)sendRPKitInstantCaptureSavedEventForBundleID:(id)a3 productCategory:(id)a4
{
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;

  v5 = (__CFString *)a3;
  v6 = (__CFString *)a4;
  v7 = CFSTR("N/A");
  if (!v5)
    v5 = CFSTR("N/A");
  if (v6)
    v7 = v6;
  v10 = v5;
  v11 = v7;
  v8 = v7;
  v9 = v5;
  AnalyticsSendEventLazy();

}

id __96__GCAnalytics_ReplayKitAnalytics__sendRPKitInstantCaptureSavedEventForBundleID_productCategory___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("bundleID");
  v3[1] = CFSTR("productCategory");
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = *(_QWORD *)(a1 + 32);
  v4[1] = v1;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)sendRPKitInstantCaptureBufferStartedEventForBundleID:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;

  v3 = (__CFString *)a3;
  v4 = CFSTR("N/A");
  if (v3)
    v4 = v3;
  v6 = v4;
  v5 = v4;
  AnalyticsSendEventLazy();

}

id __88__GCAnalytics_ReplayKitAnalytics__sendRPKitInstantCaptureBufferStartedEventForBundleID___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("bundleID");
  v4[0] = v1;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)sendHapticsEngineCreatedEventForBundleID:(id)a3 productCategory:(id)a4 hapticsLocality:(id)a5
{
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;

  v7 = (__CFString *)a3;
  v8 = (__CFString *)a4;
  v9 = (__CFString *)a5;
  v10 = CFSTR("N/A");
  if (!v7)
    v7 = CFSTR("N/A");
  if (!v8)
    v8 = CFSTR("N/A");
  if (v9)
    v10 = v9;
  v14 = v7;
  v15 = v8;
  v16 = v10;
  v11 = v10;
  v12 = v8;
  v13 = v7;
  AnalyticsSendEventLazy();

}

id __106__GCAnalytics_HapticsAnalytics__sendHapticsEngineCreatedEventForBundleID_productCategory_hapticsLocality___block_invoke(uint64_t a1)
{
  __int128 v1;
  _QWORD v3[3];
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v1 = *(_OWORD *)(a1 + 32);
  v3[0] = CFSTR("bundleID");
  v3[1] = CFSTR("productCategory");
  v4 = v1;
  v3[2] = CFSTR("hapticsLocality");
  v5 = *(_QWORD *)(a1 + 48);
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", &v4, v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)sendHapticsClientDestroyedEventForBundleID:(id)a3 productCategory:(id)a4 totalPlayers:(int)a5 sessionTotalDuration:(int)a6 sessionActiveDuration:(int)a7 terminationReason:(id)a8
{
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;

  v10 = (__CFString *)a3;
  v11 = (__CFString *)a4;
  v12 = (__CFString *)a8;
  v13 = CFSTR("N/A");
  if (!v10)
    v10 = CFSTR("N/A");
  if (!v11)
    v11 = CFSTR("N/A");
  if (v12)
    v13 = v12;
  v17 = v13;
  v14 = v13;
  v15 = v11;
  v16 = v10;
  AnalyticsSendEventLazy();

}

id __166__GCAnalytics_HapticsAnalytics__sendHapticsClientDestroyedEventForBundleID_productCategory_totalPlayers_sessionTotalDuration_sessionActiveDuration_terminationReason___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[6];
  __int128 v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = *(_OWORD *)(a1 + 32);
  v7[0] = CFSTR("bundleID");
  v7[1] = CFSTR("productCategory");
  v9 = *(_QWORD *)(a1 + 48);
  v7[2] = CFSTR("terminationReason");
  v7[3] = CFSTR("totalPlayers");
  +[NSNumber numberWithInt:](&off_254DED908, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v2;
  v7[4] = CFSTR("sessionTotalDuration");
  +[NSNumber numberWithInt:](&off_254DED908, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v3;
  v7[5] = CFSTR("sessionActiveDuration");
  +[NSNumber numberWithInt:](&off_254DED908, "numberWithInt:", *(unsigned int *)(a1 + 64));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v4;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", &v8, v7, 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)sendHapticsPlayerDestroyedEventForBundleID:(id)a3 productCategory:(id)a4 totalEventsProcessed:(int)a5 transientEventsProcessed:(int)a6 continuousEventsProcessed:(int)a7 parameterCurvesProcessed:(int)a8 sessionTotalDuration:(int)a9 sessionActiveDuration:(int)a10
{
  __CFString *v12;
  __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  __CFString *v16;

  v12 = (__CFString *)a3;
  v13 = (__CFString *)a4;
  v14 = mach_absolute_time();
  if (v14 * self->_timebaseInfo.numer / self->_timebaseInfo.denom / 0x3B9ACA00
     - self->_lastHapticsEvent * self->_timebaseInfo.numer / self->_timebaseInfo.denom / 0x3B9ACA00 > 4)
  {
    self->_lastHapticsEvent = v14;
    if (v12)
      v16 = v12;
    else
      v16 = CFSTR("N/A");
    if (!v13)
      v13 = CFSTR("N/A");
    v12 = v16;
    v13 = v13;
    AnalyticsSendEventLazy();

    v15 = v12;
    goto LABEL_11;
  }
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[GCAnalytics(HapticsAnalytics) sendHapticsPlayerDestroyedEventForBundleID:productCategory:totalEventsProcessed:transientEventsProcessed:continuousEventsProcessed:parameterCurvesProcessed:sessionTotalDuration:sessionActiveDuration:].cold.1(v15);
LABEL_11:

  }
}

id __232__GCAnalytics_HapticsAnalytics__sendHapticsPlayerDestroyedEventForBundleID_productCategory_totalEventsProcessed_transientEventsProcessed_continuousEventsProcessed_parameterCurvesProcessed_sessionTotalDuration_sessionActiveDuration___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[8];
  _QWORD v12[9];

  v12[8] = *MEMORY[0x24BDAC8D0];
  v11[0] = CFSTR("bundleID");
  v11[1] = CFSTR("productCategory");
  v2 = *(_QWORD *)(a1 + 40);
  v12[0] = *(_QWORD *)(a1 + 32);
  v12[1] = v2;
  v11[2] = CFSTR("totalEventsProcessed");
  +[NSNumber numberWithInt:](&off_254DED908, "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v3;
  v11[3] = CFSTR("transientEventsProcessed");
  +[NSNumber numberWithInt:](&off_254DED908, "numberWithInt:", *(unsigned int *)(a1 + 52));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v4;
  v11[4] = CFSTR("continuousEventsProcessed");
  +[NSNumber numberWithInt:](&off_254DED908, "numberWithInt:", *(unsigned int *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v5;
  v11[5] = CFSTR("parameterCurvesProcessed");
  +[NSNumber numberWithInt:](&off_254DED908, "numberWithInt:", *(unsigned int *)(a1 + 60));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[5] = v6;
  v11[6] = CFSTR("sessionTotalDuration");
  +[NSNumber numberWithInt:](&off_254DED908, "numberWithInt:", *(unsigned int *)(a1 + 64));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[6] = v7;
  v11[7] = CFSTR("sessionActiveDuration");
  +[NSNumber numberWithInt:](&off_254DED908, "numberWithInt:", *(unsigned int *)(a1 + 68));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[7] = v8;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v12, v11, 8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)sendHapticsErrorRaisedEventFromSource:(id)a3 productCategory:(id)a4 errorType:(id)a5
{
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;

  v7 = (__CFString *)a3;
  v8 = (__CFString *)a4;
  v9 = (__CFString *)a5;
  if (v7)
    v10 = v7;
  else
    v10 = CFSTR("N/A");
  if (!v8)
    v8 = CFSTR("N/A");
  if (v9)
    v11 = v9;
  else
    v11 = CFSTR("Unknown Error");
  v15 = v11;
  v16 = v8;
  v17 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v11;
  AnalyticsSendEventLazy();

}

id __97__GCAnalytics_HapticsAnalytics__sendHapticsErrorRaisedEventFromSource_productCategory_errorType___block_invoke(uint64_t a1)
{
  __int128 v1;
  _QWORD v3[3];
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v1 = *(_OWORD *)(a1 + 32);
  v3[0] = CFSTR("errorType");
  v3[1] = CFSTR("productCategory");
  v4 = v1;
  v3[2] = CFSTR("source");
  v5 = *(_QWORD *)(a1 + 48);
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", &v4, v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (GCAnalytics)init
{
  GCAnalytics *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *controllersData;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GCAnalytics;
  v2 = -[GCAnalytics init](&v6, sel_init);
  v3 = (NSMutableDictionary *)objc_alloc_init((Class)&off_254DEBD30);
  controllersData = v2->_controllersData;
  v2->_controllersData = v3;

  mach_timebase_info(&v2->_timebaseInfo);
  return v2;
}

- (void)sendEvent:(id)a3 withPayload:(id)a4
{
  AnalyticsSendEvent();
}

- (void)sendEvent:(id)a3 withXPCPayload:(id)a4
{
  id v5;
  id v6;

  v5 = objc_retainAutorelease(a3);
  v6 = a4;
  objc_msgSend(v5, "UTF8String");
  analytics_send_event();

}

- (BOOL)sendEvent:(id)a3 withPayloadBuilder:(id)a4
{
  return AnalyticsSendEventLazy();
}

- (BOOL)sendEvent:(id)a3 withXPCPayloadBuilder:(id)a4
{
  id v5;
  id v6;

  v5 = objc_retainAutorelease(a3);
  v6 = a4;
  objc_msgSend(v5, "UTF8String");
  LOBYTE(v5) = analytics_send_event_lazy();

  return (char)v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventPollTimer, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_controllersData, 0);
}

@end
