@implementation ENCoreTelephonyUtility

+ (id)countryCodeISOForMobileCountryCode:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1D17A7CB8]();
    objc_msgSend(MEMORY[0x1E0C99D88], "dictionaryWithContentsOfFile:", CFSTR("/System/Library/Carrier Bundles/iPhone/Default.bundle/MCC2ISO.plist"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)cellMonitorUpdate:(id)a3 info:(id)a4
{
  id v5;
  id v6;
  __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __CFString *v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  id v28;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(v6, "legacyInfo");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v8 = -[__CFString countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (!v8)
  {
    v10 = v7;
LABEL_36:

    goto LABEL_37;
  }
  v9 = v8;
  v30 = v6;
  v28 = v5;
  v10 = 0;
  v11 = *(_QWORD *)v36;
  v12 = *MEMORY[0x1E0CA7228];
  while (2)
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v36 != v11)
        objc_enumerationMutation(v7);
      v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = v7;
        objc_msgSend(v14, "objectForKeyedSubscript:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
          goto LABEL_13;
        v18 = (void *)MEMORY[0x1E0CB3938];
        objc_msgSend(v14, "objectForKeyedSubscript:", v12);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", CFSTR("%@"), v19);
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (!v20)
        {
          v10 = 0;
LABEL_13:
          v7 = v15;
          continue;
        }
        v7 = v15;
        if (-[__CFString integerValue](v20, "integerValue") >= 1
          && -[__CFString integerValue](v20, "integerValue") != 0xFFFF)
        {

          v10 = v20;
          v5 = v28;
          v6 = v30;
LABEL_19:
          if (-[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("209")))
          {

            v10 = CFSTR("310");
          }
          +[ENCoreTelephonyUtility countryCodeISOForMobileCountryCode:](ENCoreTelephonyUtility, "countryCodeISOForMobileCountryCode:", v10);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            v33 = 0u;
            v34 = 0u;
            v31 = 0u;
            v32 = 0u;
            -[ENCoreTelephonyUtility observersTable](self, "observersTable");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "allObjects");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
            if (v24)
            {
              v25 = v24;
              v26 = *(_QWORD *)v32;
              do
              {
                for (j = 0; j != v25; ++j)
                {
                  if (*(_QWORD *)v32 != v26)
                    objc_enumerationMutation(v23);
                  objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * j), "telephonyUtility:mobileCountryCodeChanged:andCountryCodeISO:", self, v10, v21);
                }
                v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
              }
              while (v25);
            }

            v6 = v30;
          }
          else if (gLogCategory__ENConfigurationManager_0 <= 90
                 && (gLogCategory__ENConfigurationManager_0 != -1 || _LogCategory_Initialize()))
          {
            -[__CFString integerValue](v10, "integerValue");
            LogPrintF_safe();
          }

          goto LABEL_36;
        }
        v10 = v20;
      }
    }
    v9 = -[__CFString countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v9)
      continue;
    break;
  }

  v5 = v28;
  v6 = v30;
  if (v10)
    goto LABEL_19;
LABEL_37:

}

- (NSHashTable)observersTable
{
  return self->_observersTable;
}

+ (ENCoreTelephonyUtility)sharedInstance
{
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, &__block_literal_global_9);
  return (ENCoreTelephonyUtility *)(id)sharedInstance_sharedInstance;
}

void __40__ENCoreTelephonyUtility_sharedInstance__block_invoke()
{
  ENCoreTelephonyUtility *v0;
  void *v1;

  if (!sharedInstance_sharedInstance)
  {
    v0 = objc_alloc_init(ENCoreTelephonyUtility);
    v1 = (void *)sharedInstance_sharedInstance;
    sharedInstance_sharedInstance = (uint64_t)v0;

  }
}

- (ENCoreTelephonyUtility)init
{
  ENCoreTelephonyUtility *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  CoreTelephonyClient *ctClient;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ENCoreTelephonyUtility;
  v2 = -[ENCoreTelephonyUtility init](&v12, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.exposureNotification.regionSource.telephony", v3);
    -[ENCoreTelephonyUtility setSerialQueue:](v2, "setSerialQueue:", v4);

    -[ENCoreTelephonyUtility serialQueue](v2, "serialQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_ctServerConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();

    v6 = objc_alloc(MEMORY[0x1E0CA6E40]);
    -[ENCoreTelephonyUtility serialQueue](v2, "serialQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithQueue:", v7);
    ctClient = v2->_ctClient;
    v2->_ctClient = (CoreTelephonyClient *)v8;

    -[CoreTelephonyClient setDelegate:](v2->_ctClient, "setDelegate:", v2);
  }
  objc_msgSend(MEMORY[0x1E0CB3688], "weakObjectsHashTable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENCoreTelephonyUtility setObserversTable:](v2, "setObserversTable:", v10);

  return v2;
}

- (void)dealloc
{
  objc_super v3;

  if (gLogCategory_ENCoreTelephonyUtility <= 30
    && (gLogCategory_ENCoreTelephonyUtility != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  if (-[ENCoreTelephonyUtility ctServerConnection](self, "ctServerConnection"))
    CFRelease(-[ENCoreTelephonyUtility ctServerConnection](self, "ctServerConnection"));
  v3.receiver = self;
  v3.super_class = (Class)ENCoreTelephonyUtility;
  -[ENCoreTelephonyUtility dealloc](&v3, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ENCoreTelephonyUtility serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__ENCoreTelephonyUtility_addObserver___block_invoke;
  v7[3] = &unk_1E87D9DD8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __38__ENCoreTelephonyUtility_addObserver___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  if (gLogCategory_ENCoreTelephonyUtility <= 30
    && (gLogCategory_ENCoreTelephonyUtility != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  objc_msgSend(*(id *)(a1 + 32), "observersTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "currentMobileCountryCode");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[ENCoreTelephonyUtility countryCodeISOForMobileCountryCode:](ENCoreTelephonyUtility, "countryCodeISOForMobileCountryCode:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (gLogCategory_ENCoreTelephonyUtility < 31
      && (gLogCategory_ENCoreTelephonyUtility != -1 || _LogCategory_Initialize()))
    {
      v5 = objc_msgSend(v6, "integerValue");
      LogPrintF_safe();
      objc_msgSend(*(id *)(a1 + 40), "telephonyUtility:mobileCountryCodeChanged:andCountryCodeISO:", *(_QWORD *)(a1 + 32), v6, v3, v5);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "telephonyUtility:mobileCountryCodeChanged:andCountryCodeISO:", *(_QWORD *)(a1 + 32), v6, v3, v4);
    }
  }

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (gLogCategory_ENCoreTelephonyUtility <= 30
    && (gLogCategory_ENCoreTelephonyUtility != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  -[ENCoreTelephonyUtility serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__ENCoreTelephonyUtility_removeObserver___block_invoke;
  v7[3] = &unk_1E87D9DD8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __41__ENCoreTelephonyUtility_removeObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observersTable");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

- (id)countryCodeISOForMobileCountryCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (-[ENCoreTelephonyUtility ctServerConnection](self, "ctServerConnection")
    || (-[ENCoreTelephonyUtility ctClient](self, "ctClient"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    v6 = (void *)MEMORY[0x1D17A7CB8]();
    if (v4)
    {
      -[ENCoreTelephonyUtility ctServerConnection](self, "ctServerConnection");
      _CTServerConnectionCopyISOForMCC();
      if (gLogCategory__ENConfigurationManager_0 <= 90
        && (gLogCategory__ENConfigurationManager_0 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
    objc_autoreleasePoolPop(v6);
  }

  return 0;
}

+ (id)mobileCountryCodeForISO:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1D17A7CB8]();
    objc_msgSend(MEMORY[0x1E0C99D88], "dictionaryWithContentsOfFile:", CFSTR("/System/Library/Carrier Bundles/iPhone/Default.bundle/ISO2MCC.plist"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v4);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)currentMobileCountryCode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v10;
  id v11;

  -[ENCoreTelephonyUtility ctClient](self, "ctClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[ENCoreTelephonyUtility ctClient](self, "ctClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getCurrentDataSubscriptionContextSync:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ENCoreTelephonyUtility ctClient](self, "ctClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v7 = (void *)objc_msgSend(v6, "copyMobileCountryCode:error:", v5, &v11);
  v8 = v11;

  if (!v8 && v7 && objc_msgSend(v7, "length") && objc_msgSend(v7, "integerValue") != 0xFFFF)
  {
    v10 = v7;
  }
  else
  {
    if (gLogCategory__ENConfigurationManager_0 <= 90
      && (gLogCategory__ENConfigurationManager_0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    v10 = 0;
  }

  return v10;
}

- (id)currentPhoneNumbers
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  void *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E28], "setWithCapacity:", 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENCoreTelephonyUtility ctClient](self, "ctClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v3, "getSubscriptionInfoWithError:", &v28);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v28;

  if (v5)
  {
    if (gLogCategory__ENConfigurationManager_0 <= 90
      && (gLogCategory__ENConfigurationManager_0 != -1 || _LogCategory_Initialize()))
    {
      v20 = v5;
LABEL_30:
      LogPrintF_safe();
    }
  }
  else
  {
    v21 = v4;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v4, "subscriptionsInUse");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v25 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          -[ENCoreTelephonyUtility ctClient](self, "ctClient", v20);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 0;
          objc_msgSend(v12, "getPhoneNumber:error:", v11, &v23);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v23;

          if (v13)
          {
            v15 = (void *)softLinkCPPhoneNumberCopyActiveCountryCode[0]();
            if (v15)
            {
              objc_msgSend(v13, "number");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              softLinkTPSNormalizedPhoneNumberString(v16, v15);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (v17)
                objc_msgSend(v22, "addObject:", v17);

            }
            else if (gLogCategory_ENCoreTelephonyUtility <= 90
                   && (gLogCategory_ENCoreTelephonyUtility != -1 || _LogCategory_Initialize()))
            {
              LogPrintF_safe();
            }

          }
          else if (gLogCategory__ENConfigurationManager_0 <= 90
                 && (gLogCategory__ENConfigurationManager_0 != -1 || _LogCategory_Initialize()))
          {
            v20 = v14;
            LogPrintF_safe();
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v8);
    }

    v4 = v21;
    v5 = 0;
    if (gLogCategory_ENCoreTelephonyUtility <= 40
      && (gLogCategory_ENCoreTelephonyUtility != -1 || _LogCategory_Initialize()))
    {
      v20 = v22;
      goto LABEL_30;
    }
  }
  objc_msgSend(v22, "allObjects", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (CoreTelephonyClient)ctClient
{
  return self->_ctClient;
}

- (__CTServerConnection)ctServerConnection
{
  return self->_ctServerConnection;
}

- (void)setObserversTable:(id)a3
{
  objc_storeStrong((id *)&self->_observersTable, a3);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_observersTable, 0);
  objc_storeStrong((id *)&self->_ctClient, 0);
}

@end
