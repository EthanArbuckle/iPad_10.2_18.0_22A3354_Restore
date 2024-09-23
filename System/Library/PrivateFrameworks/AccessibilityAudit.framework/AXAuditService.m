@implementation AXAuditService

+ (Class)deviceSettingsManagerClass
{
  return (Class)objc_opt_class();
}

- (AXAuditService)initWithTransport:(id)a3
{
  id v4;
  AXAuditService *v5;
  AXAuditService *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  AXAuditDeviceSettingsManager *deviceSettingsManager;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *, void *);
  void *v17;
  id v18;
  _QWORD v19[4];
  AXAuditService *v20;
  id v21;
  id location;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)AXAuditService;
  v5 = -[AXAuditService init](&v23, sel_init);
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      objc_initWeak(&location, v5);
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2A948]), "initWithTransport:", v4);
      objc_msgSend(v7, "publishCapability:withVersion:forClass:", CFSTR("com.apple.accessibility.axAuditDaemon.protocolVersion"), 157, 0);
      objc_msgSend(v7, "setMaximumEnqueueSize:", 0x800000);
      objc_msgSend(v7, "setDispatchTarget:", v6);
      v8 = (void *)os_transaction_create();
      v9 = MEMORY[0x24BDAC760];
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __36__AXAuditService_initWithTransport___block_invoke;
      v19[3] = &unk_25071B528;
      v6 = v6;
      v20 = v6;
      v10 = v8;
      v21 = v10;
      objc_msgSend(v7, "setMessageHandler:", v19);
      v14 = v9;
      v15 = 3221225472;
      v16 = __36__AXAuditService_initWithTransport___block_invoke_2;
      v17 = &unk_25071B550;
      objc_copyWeak(&v18, &location);
      objc_msgSend(v7, "setChannelHandler:", &v14);
      objc_storeStrong((id *)&v6->_connection, v7);
      objc_msgSend((id)objc_opt_class(), "deviceSettingsManagerClass", v14, v15, v16, v17);
      v11 = objc_opt_new();
      deviceSettingsManager = v6->_deviceSettingsManager;
      v6->_deviceSettingsManager = (AXAuditDeviceSettingsManager *)v11;

      -[AXAuditDeviceSettingsManager setDelegate:](v6->_deviceSettingsManager, "setDelegate:", v6);
      -[AXAuditDeviceSettingsManager startObservingChanges](v6->_deviceSettingsManager, "startObservingChanges");
      -[AXAuditDeviceSettingsManager cacheDeviceSettingsValues](v6->_deviceSettingsManager, "cacheDeviceSettingsValues");
      objc_destroyWeak(&v18);

      objc_destroyWeak(&location);
    }
    else
    {

      v6 = 0;
    }
  }

  return v6;
}

void __36__AXAuditService_initWithTransport___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  if (objc_msgSend(a2, "errorStatus") == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "connectionInterrupted");
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDispatchTarget:", 0);

    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(_QWORD *)(v4 + 8) = 0;

  }
}

void __36__AXAuditService_initWithTransport___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id WeakRetained;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v10;

  v10 = a2;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_channelRestrictBlock");
  v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v9)
    ((void (**)(_QWORD, id, id, void *))v9)[2](v9, v10, v7, a4);
  if (a4)
    objc_msgSend(a4, "instantiateServiceWithChannel:", v10);
  else
    objc_msgSend(v10, "cancel");

}

- (id)deviceInspectorSupportedEventTypes
{
  return &unk_25072A900;
}

- (id)deviceInspectorCanNavWhileMonitoringEvents
{
  return (id)MEMORY[0x24BDBD1C0];
}

- (void)cancel
{
  void *v3;

  -[AXAuditService connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[AXAuditService set_channelRestrictBlock:](self, "set_channelRestrictBlock:", 0);
}

- (void)resume
{
  void *v3;

  -[AXAuditService connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resume");

  -[AXAuditService requestHostAPIVersion](self, "requestHostAPIVersion");
}

- (void)setMaxConnectionEnqueue:(unint64_t)a3
{
  id v4;

  -[AXAuditService connection](self, "connection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaximumEnqueueSize:", a3);

}

- (void)requestHostAPIVersion
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __39__AXAuditService_requestHostAPIVersion__block_invoke;
  v6[3] = &unk_25071B578;
  v6[4] = self;
  v3 = (void *)MEMORY[0x23B7DF090](v6, a2);
  objc_msgSend(MEMORY[0x24BE2A960], "messageWithSelector:objectArguments:", sel_hostApiVersion, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AXAuditService hostAPIVersion](self, "hostAPIVersion") <= 0)
  {
    -[AXAuditService connection](self, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendControlAsync:replyHandler:", v4, v3);

  }
}

void __39__AXAuditService_requestHostAPIVersion__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __39__AXAuditService_requestHostAPIVersion__block_invoke_2;
  v6[3] = &unk_25071ABB0;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __39__AXAuditService_requestHostAPIVersion__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  if (!objc_msgSend(*(id *)(a1 + 32), "errorStatus"))
  {
    objc_msgSend(*(id *)(a1 + 32), "object");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "setHostAPIVersion:", objc_msgSend(v4, "integerValue"));
      v2 = objc_msgSend(*(id *)(a1 + 40), "hostAPIVersion");
      objc_msgSend(*(id *)(a1 + 40), "deviceSettingsManager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setHostAPIVersion:", v2);

    }
  }
}

- (void)axAuditDeviceManager:(id)a3 settingDidChange:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  +[AXAuditObjectTransportManager sharedManager](AXAuditObjectTransportManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transportDictionaryForObject:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE2A960], "messageWithSelector:objectArguments:", sel_hostAccessibilitySettingDidChange_, v9, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAuditService connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendControlAsync:replyHandler:", v7, 0);

}

- (void)auditer:(id)a3 didEncounterIssue:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  +[AXAuditObjectTransportManager sharedManager](AXAuditObjectTransportManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transportDictionaryForObject:", v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v10;
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BE2A960], "messageWithSelector:objectArguments:", sel_hostFoundAuditIssue_, v10, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXAuditService connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendControlAsync:replyHandler:", v8, 0);

    v7 = v10;
  }

}

- (void)auditer:(id)a3 didAppendLogWithMessage:(id)a4
{
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BE2A960], "messageWithSelector:objectArguments:", sel_hostAppendAuditLog_, a4, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AXAuditService connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendControlAsync:replyHandler:", v6, 0);

}

- (void)auditer:(id)a3 didCompleteWithResults:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  AXAuditService *v10;

  v5 = a4;
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__AXAuditService_auditer_didCompleteWithResults___block_invoke;
  v8[3] = &unk_25071ABB0;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __49__AXAuditService_auditer_didCompleteWithResults___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v18 = a1;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v7), "allIssues");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "count"))
        {
          v21 = 0u;
          v22 = 0u;
          v19 = 0u;
          v20 = 0u;
          v9 = v8;
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v20;
            do
            {
              v13 = 0;
              do
              {
                if (*(_QWORD *)v20 != v12)
                  objc_enumerationMutation(v9);
                objc_msgSend(v2, "addObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13++));
              }
              while (v11 != v13);
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            }
            while (v11);
          }

        }
        ++v7;
      }
      while (v7 != v5);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v5);
  }

  +[AXAuditObjectTransportManager sharedManager](AXAuditObjectTransportManager, "sharedManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "transportDictionaryForObject:", v2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE2A960], "messageWithSelector:objectArguments:", sel_hostDeviceDidCompleteAuditCategoriesWithAuditIssues_, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v18 + 40), "connection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sendControlAsync:replyHandler:", v16, 0);

  objc_msgSend(*(id *)(v18 + 40), "setRunningAudit:", 0);
  objc_msgSend(*(id *)(v18 + 40), "setCurrentAuditer:", 0);

}

- (void)connectionInterrupted
{
  void *v3;

  -[AXAuditService deviceSettingsManager](self, "deviceSettingsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "restoreDeviceSettingsValues");

  -[AXAuditService setApplicationStateNotificationsEnabled:](self, "setApplicationStateNotificationsEnabled:", 0);
  -[AXAuditService deviceInspectorSetMonitoredEventType:](self, "deviceInspectorSetMonitoredEventType:", &unk_25072A918);
  -[AXAuditService deviceHighlightIssue:](self, "deviceHighlightIssue:", 0);
  -[AXAuditService deviceInspectorShowVisuals:](self, "deviceInspectorShowVisuals:", MEMORY[0x24BDBD1C0]);
}

- (void)deviceSetAuditTargetPid:(id)a3
{
  if (a3)
    -[AXAuditService setTargetPid:](self, "setTargetPid:", objc_msgSend(a3, "longValue"));
}

- (id)deviceAuditIssueSupportedKeys
{
  return 0;
}

- (id)deviceCapabilities
{
  void *v2;
  void *v3;
  objc_method_description *v4;
  objc_method_description *v5;
  unint64_t v6;
  unint64_t v7;
  SEL *p_name;
  void *v9;
  unsigned int outCount;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  outCount = 0;
  v3 = &unk_25637F980;
  v4 = protocol_copyMethodDescriptionList((Protocol *)v3, 1, 1, &outCount);
  if (v4)
  {
    v5 = v4;
    v6 = outCount;
    if (outCount)
    {
      v7 = 0;
      p_name = &v4->name;
      do
      {
        if (*p_name)
        {
          NSStringFromSelector(*p_name);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v9);

          v6 = outCount;
        }
        ++v7;
        p_name += 2;
      }
      while (v7 < v6);
    }
    free(v5);
  }

  return v2;
}

- (id)deviceApiVersion
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 25);
}

- (id)deviceRunningApplications
{
  return 0;
}

- (id)deviceCurrentState
{
  return &unk_25072A930;
}

- (void)deviceSetAppMonitoringEnabled:(id)a3
{
  if (a3)
    -[AXAuditService setApplicationStateNotificationsEnabled:](self, "setApplicationStateNotificationsEnabled:", objc_msgSend(a3, "BOOLValue"));
}

- (id)deviceAllAuditCaseIDs
{
  return 0;
}

- (id)auditCaseIDsForAuditGroup:(id)a3
{
  return 0;
}

- (id)deviceHumanReadableDescriptionForAuditCaseID:(id)a3
{
  return 0;
}

- (void)deviceBeginAuditCaseIDs:(id)a3
{
  -[AXAuditService deviceBeginAuditTypes:](self, "deviceBeginAuditTypes:", 0);
}

- (id)deviceAllSupportedAuditTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "allSupportedAuditTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)deviceBeginAuditTypes:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (!-[AXAuditService runningAudit](self, "runningAudit"))
  {
    -[AXAuditService setRunningAudit:](self, "setRunningAudit:", 1);
    -[AXAuditService auditCategorySetup](self, "auditCategorySetup");
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __40__AXAuditService_deviceBeginAuditTypes___block_invoke;
    v6[3] = &unk_25071ABB0;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

void __40__AXAuditService_deviceBeginAuditTypes___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_opt_new();
  objc_msgSend(v2, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v2, "setTargetPid:", objc_msgSend(*(id *)(a1 + 32), "targetPid"));
  objc_msgSend(v2, "setCategoryType:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setCurrentAuditer:", v2);
  objc_msgSend(v2, "startWithAuditTypes:", *(_QWORD *)(a1 + 40));

}

- (void)deviceInspectorSetMonitoredEventType:(id)a3
{
  char v4;
  uint64_t v5;

  if (a3)
  {
    v4 = objc_msgSend(a3, "integerValue");
    if ((v4 & 1) != 0)
      v5 = 1;
    else
      v5 = v4 & 2;
    -[AXAuditService setMonitoredEventType:](self, "setMonitoredEventType:", v5);
  }
}

- (void)deviceInspectorEnable:(id)a3
{
  unsigned int v4;
  id v5;

  if (a3)
  {
    v4 = objc_msgSend(a3, "BOOLValue");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[AXAuditService deviceInspectorSetMonitoredEventType:](self, "deviceInspectorSetMonitoredEventType:", v5);

  }
}

- (id)deviceInspectorSupportedEventType
{
  return 0;
}

- (id)deviceInspectorSupportsIgnoredElements
{
  return (id)MEMORY[0x24BDBD1C0];
}

- (id)deviceInspectorSupportsAutodrillIntoElements
{
  return (id)MEMORY[0x24BDBD1C0];
}

- (id)deviceAccessibilitySettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[AXAuditObjectTransportManager sharedManager](AXAuditObjectTransportManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAuditService deviceSettingsManager](self, "deviceSettingsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transportDictionaryForObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)deviceResetToDefaultAccessibilitySettings
{
  id v2;

  -[AXAuditService deviceSettingsManager](self, "deviceSettingsManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetToDefaultAccessibilitySettings");

}

- (void)deviceUpdateAccessibilitySetting:(id)a3 withValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  +[AXAuditObjectTransportManager sharedManager](AXAuditObjectTransportManager, "sharedManager");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForTransportDictionary:expectedClass:", v7, objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForTransportDictionary:expectedClass:", v6, objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXAuditService deviceSettingsManager](self, "deviceSettingsManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateSetting:withNumberValue:", v8, v9);

}

- (id)deviceElement:(id)a3 performAction:(id)a4 withValue:(id)a5
{
  return 0;
}

- (id)deviceElement:(id)a3 valueForAttribute:(id)a4
{
  return 0;
}

- (id)deviceElement:(id)a3 valueForParameterizedAttribute:(id)a4 withObject:(id)a5
{
  return 0;
}

- (id)synchronousDeviceCaptureScreenshot
{
  return 0;
}

- (id)deviceFetchSpecialElement:(id)a3
{
  return 0;
}

- (id)deviceFetchResolvesElementsOnSimulator
{
  return 0;
}

- (id)deviceFetchElementAtNormalizedDeviceCoordinate:(id)a3
{
  return 0;
}

- (id)deviceCaptureScreenshot
{
  return 0;
}

- (void)deviceHighlightIssue:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    +[AXAuditObjectTransportManager sharedManager](AXAuditObjectTransportManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForTransportDictionary:expectedClass:", v7, objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "auditElement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  -[AXAuditService highlightElement:](self, "highlightElement:", v6);

}

- (void)deviceHighlightIssues:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v11, "count", (_QWORD)v16))
        {
          +[AXAuditObjectTransportManager sharedManager](AXAuditObjectTransportManager, "sharedManager");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForTransportDictionary:expectedClass:", v11, objc_opt_class());
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "auditElement");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            objc_msgSend(v13, "auditElement");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v15);

          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  -[AXAuditService highlightElements:](self, "highlightElements:", v5);
}

- (DTXConnection)connection
{
  return self->_connection;
}

- (BOOL)applicationStateNotificationsEnabled
{
  return self->_applicationStateNotificationsEnabled;
}

- (void)setApplicationStateNotificationsEnabled:(BOOL)a3
{
  self->_applicationStateNotificationsEnabled = a3;
}

- (BOOL)runningAudit
{
  return self->_runningAudit;
}

- (void)setRunningAudit:(BOOL)a3
{
  self->_runningAudit = a3;
}

- (int)targetPid
{
  return self->_targetPid;
}

- (void)setTargetPid:(int)a3
{
  self->_targetPid = a3;
}

- (unint64_t)monitoredEventType
{
  return self->_monitoredEventType;
}

- (void)setMonitoredEventType:(unint64_t)a3
{
  self->_monitoredEventType = a3;
}

- (AXAuditer)currentAuditer
{
  return self->_currentAuditer;
}

- (void)setCurrentAuditer:(id)a3
{
  objc_storeStrong((id *)&self->_currentAuditer, a3);
}

- (AXAuditDeviceSettingsManager)deviceSettingsManager
{
  return self->_deviceSettingsManager;
}

- (void)setDeviceSettingsManager:(id)a3
{
  objc_storeStrong((id *)&self->_deviceSettingsManager, a3);
}

- (int64_t)hostAPIVersion
{
  return self->_hostAPIVersion;
}

- (void)setHostAPIVersion:(int64_t)a3
{
  self->_hostAPIVersion = a3;
}

- (id)_channelRestrictBlock
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)set_channelRestrictBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__channelRestrictBlock, 0);
  objc_storeStrong((id *)&self->_deviceSettingsManager, 0);
  objc_storeStrong((id *)&self->_currentAuditer, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
