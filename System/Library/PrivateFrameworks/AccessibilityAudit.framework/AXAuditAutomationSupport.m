@implementation AXAuditAutomationSupport

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__AXAuditAutomationSupport_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_6 != -1)
    dispatch_once(&sharedManager_onceToken_6, block);
  return (id)sharedManager_instance_6;
}

void __41__AXAuditAutomationSupport_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager_instance_6;
  sharedManager_instance_6 = v0;

}

+ (id)shortDescriptionForAuditIssue:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[AXAuditIssueDescriptionManager sharedManager](AXAuditIssueDescriptionManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shortTitleForAuditIssue:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)longDescriptionForAuditIssue:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[AXAuditIssueDescriptionManager sharedManager](AXAuditIssueDescriptionManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "longDescriptionForAuditIssue:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (__AXUIElement)createAXElementForAuditIssue:(id)a3
{
  void *v3;
  __AXUIElement *v4;

  objc_msgSend(a3, "auditElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (__AXUIElement *)objc_msgSend(v3, "createAxElementRefForXCTest");

  return v4;
}

- (AXAuditAutomationSupport)init
{
  AXAuditAutomationSupport *v2;
  void *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *auditQueue;
  dispatch_queue_t v6;
  OS_dispatch_queue *backgroudQueue;
  uint64_t v8;
  AXAuditThrottler *screenChangedThrottler;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AXAuditAutomationSupport;
  v2 = -[AXAuditAutomationSupport init](&v11, sel_init);
  if (v2)
  {
    +[AXAuditPluginManager sharedManager](AXAuditPluginManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "loadAuditBundles");

    v4 = dispatch_queue_create("com.apple.axAudit.automation", 0);
    auditQueue = v2->__auditQueue;
    v2->__auditQueue = (OS_dispatch_queue *)v4;

    v6 = dispatch_queue_create("com.apple.accessibilityAudit.automation.background", 0);
    backgroudQueue = v2->__backgroudQueue;
    v2->__backgroudQueue = (OS_dispatch_queue *)v6;

    +[AXAuditThrottler throttlerWithInterval:target:selector:queue:alwaysReschedule:](AXAuditThrottler, "throttlerWithInterval:target:selector:queue:alwaysReschedule:", v2, sel__screenChangedThrottled, v2->__backgroudQueue, 1, 1.75);
    v8 = objc_claimAutoreleasedReturnValue();
    screenChangedThrottler = v2->__screenChangedThrottler;
    v2->__screenChangedThrottler = (AXAuditThrottler *)v8;

  }
  return v2;
}

+ (id)_currentTimestamp
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v4);

  objc_msgSend(v2, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
  objc_msgSend(v2, "stringFromDate:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_setupAudit
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = (void *)objc_opt_new();
  -[AXAuditAutomationSupport set_auditor:](self, "set_auditor:", v3);

  -[AXAuditAutomationSupport _auditor](self, "_auditor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  +[AXAuditAutomationSupport _currentTimestamp](AXAuditAutomationSupport, "_currentTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAuditAutomationSupport set_auditTimestamp:](self, "set_auditTimestamp:", v5);

  v6 = -[AXAuditAutomationSupport targetPid](self, "targetPid");
  -[AXAuditAutomationSupport _auditor](self, "_auditor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTargetPid:", v6);

  +[AXAuditScreenshotManager sharedManager](AXAuditScreenshotManager, "sharedManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clear");

}

- (void)_runAudit
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  id v26;
  id v27;
  _QWORD block[5];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  if (-[AXAuditAutomationSupport targetPid](self, "targetPid"))
  {
    AXAuditCurrentApplications();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v35;
LABEL_4:
      v7 = 0;
      while (1)
      {
        if (*(_QWORD *)v35 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v7);
        v9 = AXAuditPidForElement(v8);
        if (-[AXAuditAutomationSupport targetPid](self, "targetPid") == v9)
          break;
        if (v5 == ++v7)
        {
          v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
          if (v5)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v10 = v8;

      if (v10)
        goto LABEL_14;
    }
    else
    {
LABEL_10:

    }
  }
  objc_msgSend(MEMORY[0x24BDD1540], "_axAudit_error:description:", -902, CFSTR("Invalid target app %i"), -[AXAuditAutomationSupport targetPid](self, "targetPid"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[AXAuditAutomationSupport _informDelegateOfResults:error:](self, "_informDelegateOfResults:error:", 0, v10);
  }
  else
  {
LABEL_14:
    v27 = v10;
    -[AXAuditAutomationSupport _setupAudit](self, "_setupAudit");
    -[AXAuditAutomationSupport _completionBlock](self, "_completionBlock");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = +[AXAuditPluginManager sharedManager](AXAuditPluginManager, "sharedManager");
      -[AXAuditAutomationSupport _auditQueue](self, "_auditQueue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXAuditAutomationSupport _auditor](self, "_auditor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setAuditQueue:", v13);

    }
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[AXAuditAutomationSupport auditTypes](self, "auditTypes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v31 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
          -[AXAuditAutomationSupport _auditor](self, "_auditor");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "allSupportedAuditTypes");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "containsObject:", v21);

          if (v24)
            objc_msgSend(v15, "addObject:", v21);
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v18);
    }

    -[AXAuditAutomationSupport _auditQueue](self, "_auditQueue");
    v25 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __37__AXAuditAutomationSupport__runAudit__block_invoke;
    block[3] = &unk_25071ABB0;
    block[4] = self;
    v29 = v15;
    v26 = v15;
    dispatch_async(v25, block);

    v10 = v27;
  }

}

void __37__AXAuditAutomationSupport__runAudit__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_captureScreenshot");
  objc_msgSend(*(id *)(a1 + 32), "_auditor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startWithAuditTypes:", v2);

}

- (id)_setupWarningsFromAuditTypes
{
  -[AXAuditAutomationSupport setAuditWarningsToIgnore:](self, "setAuditWarningsToIgnore:", 0);
  -[AXAuditAutomationSupport setAuditWarningsToCapture:](self, "setAuditWarningsToCapture:", 0);
  return 0;
}

- (void)startAuditWithCompletionBlock:(id)a3
{
  uint64_t v4;
  id v5;

  -[AXAuditAutomationSupport set_completionBlock:](self, "set_completionBlock:", a3);
  -[AXAuditAutomationSupport _setupWarningsFromAuditTypes](self, "_setupWarningsFromAuditTypes");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v4;
  if (v4)
    -[AXAuditAutomationSupport _informDelegateOfResults:error:](self, "_informDelegateOfResults:error:", 0, v4);
  else
    -[AXAuditAutomationSupport startSingleAudit](self, "startSingleAudit");

}

- (void)_informDelegateOfResults:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[AXAuditAutomationSupport delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AXAuditAutomationSupport delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "automationSupport:didFindResults:success:", self, v6, v7 == 0);

  }
  -[AXAuditAutomationSupport _completionBlock](self, "_completionBlock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v24 = v7;
    v11 = (void *)objc_opt_new();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v25 = v6;
    v12 = v6;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v31;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v31 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v16);
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          objc_msgSend(v17, "allIssues", v24);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v27;
            do
            {
              v22 = 0;
              do
              {
                if (*(_QWORD *)v27 != v21)
                  objc_enumerationMutation(v18);
                objc_msgSend(v11, "addObject:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v22++));
              }
              while (v20 != v22);
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            }
            while (v20);
          }

          ++v16;
        }
        while (v16 != v14);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v14);
    }

    -[AXAuditAutomationSupport _completionBlock](self, "_completionBlock");
    v23 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7 = v24;
    ((void (**)(_QWORD, void *, id))v23)[2](v23, v11, v24);

    -[AXAuditAutomationSupport set_completionBlock:](self, "set_completionBlock:", 0);
    v6 = v25;
  }

}

- (void)_runNextAuditIfNeeded
{
  if (-[AXAuditAutomationSupport _singleAuditPendingCount](self, "_singleAuditPendingCount") < 1)
  {
    if (-[AXAuditAutomationSupport _runningContinuousAudit](self, "_runningContinuousAudit"))
      -[AXAuditAutomationSupport _startContinuousAudit](self, "_startContinuousAudit");
  }
  else
  {
    -[AXAuditAutomationSupport _runAudit](self, "_runAudit");
  }
}

- (void)_startContinuousAudit
{
  if (!-[AXAuditAutomationSupport _registeredForNotifications](self, "_registeredForNotifications"))
  {
    -[AXAuditAutomationSupport _runAudit](self, "_runAudit");
    -[AXAuditAutomationSupport _registerForAXNotifications:](self, "_registerForAXNotifications:", 1);
  }
}

- (void)_stopContinuousAudit
{
  -[AXAuditAutomationSupport _registerForAXNotifications:](self, "_registerForAXNotifications:", 0);
}

- (void)startSingleAudit
{
  BOOL v3;

  v3 = -[AXAuditAutomationSupport runningContinuousAudit](self, "runningContinuousAudit");
  -[AXAuditAutomationSupport set_singleAuditPendingCount:](self, "set_singleAuditPendingCount:", -[AXAuditAutomationSupport _singleAuditPendingCount](self, "_singleAuditPendingCount") + 1);
  if (!v3)
    -[AXAuditAutomationSupport _runNextAuditIfNeeded](self, "_runNextAuditIfNeeded");
}

- (BOOL)runningSingleAudit
{
  return -[AXAuditAutomationSupport _singleAuditPendingCount](self, "_singleAuditPendingCount") > 0;
}

- (void)startContinuousAudit
{
  -[AXAuditAutomationSupport set_runningContinuousAudit:](self, "set_runningContinuousAudit:", 1);
  -[AXAuditAutomationSupport _runNextAuditIfNeeded](self, "_runNextAuditIfNeeded");
}

- (void)stopContinuousAudit
{
  if (-[AXAuditAutomationSupport _runningContinuousAudit](self, "_runningContinuousAudit"))
  {
    -[AXAuditAutomationSupport set_runningContinuousAudit:](self, "set_runningContinuousAudit:", 0);
    -[AXAuditAutomationSupport _stopContinuousAudit](self, "_stopContinuousAudit");
  }
}

- (id)screenshotHighlightingIssue:(id)a3
{
  return 0;
}

- (void)_captureScreenshot
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[AXAuditAutomationSupport _auditTimestamp](self, "_auditTimestamp");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[AXAuditPluginManager sharedManager](AXAuditPluginManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "platformPlugin");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screenshotInfoForTransportWithFrame:", 0.0, 0.0, 0.0, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[AXAuditScreenshotManager sharedManager](AXAuditScreenshotManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addScreenshotWithInfo:timestamp:completion:", v4, v6, &__block_literal_global_23);

  }
}

- (id)fetchScreenshot
{
  void *v2;
  void *v3;
  void *v4;

  +[AXAuditPluginManager sharedManager](AXAuditPluginManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "platformPlugin");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screenshotInfoForTransportWithFrame:", 0.0, 0.0, 0.0, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)_singleAuditPendingCount
{
  return self->__singleAuditPendingCount;
}

- (void)auditer:(id)a3 didCompleteWithResults:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  _QWORD block[5];

  v5 = a4;
  -[AXAuditAutomationSupport _completionBlock](self, "_completionBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AXAuditAutomationSupport _auditTimestamp](self, "_auditTimestamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    updateTimestampOfResults(v5, v7);

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__AXAuditAutomationSupport_auditer_didCompleteWithResults___block_invoke;
    block[3] = &unk_25071ABD8;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    -[AXAuditAutomationSupport _sendResultsToDelegate:](self, "_sendResultsToDelegate:", v5);
  }
  else
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __59__AXAuditAutomationSupport_auditer_didCompleteWithResults___block_invoke_2;
    v8[3] = &unk_25071ABB0;
    v8[4] = self;
    v9 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], v8);

  }
}

uint64_t __59__AXAuditAutomationSupport_auditer_didCompleteWithResults___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_singleAuditPendingCount");
  if (result >= 1)
    return objc_msgSend(*(id *)(a1 + 32), "set_singleAuditPendingCount:", objc_msgSend(*(id *)(a1 + 32), "_singleAuditPendingCount") - 1);
  return result;
}

void __59__AXAuditAutomationSupport_auditer_didCompleteWithResults___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "set_auditor:", 0);
  if (objc_msgSend(*(id *)(a1 + 32), "_singleAuditPendingCount") > 0
    || objc_msgSend(*(id *)(a1 + 32), "_runningContinuousAudit"))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      v3 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "_auditTimestamp");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      updateTimestampOfResults(v3, v4);

      if (objc_msgSend(*(id *)(a1 + 32), "_singleAuditPendingCount") >= 1)
        objc_msgSend(*(id *)(a1 + 32), "set_singleAuditPendingCount:", objc_msgSend(*(id *)(a1 + 32), "_singleAuditPendingCount") - 1);
      objc_msgSend(*(id *)(a1 + 32), "_sendResultsToDelegate:", *(_QWORD *)(a1 + 40));
      if ((objc_msgSend(*(id *)(a1 + 32), "_runningContinuousAudit") & 1) == 0)
        objc_msgSend(*(id *)(a1 + 32), "_runNextAuditIfNeeded");
    }
  }
}

- (void)_sendResultsToDelegate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  id v28;
  id obj;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  AXAuditAutomationSupport *v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AXAuditAutomationSupport auditWarningsToCapture](self, "auditWarningsToCapture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  -[AXAuditAutomationSupport elementIdentifiersToIgnore](self, "elementIdentifiersToIgnore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v7, "count");
  v40 = v6;

  if (v6 | v39)
  {
    v38 = self;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v28 = v4;
    obj = v4;
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    if (!v31)
      goto LABEL_38;
    v30 = *(_QWORD *)v50;
    while (1)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v50 != v30)
          objc_enumerationMutation(obj);
        v32 = v8;
        v9 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v8);
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        objc_msgSend(v9, "caseResults");
        v33 = (id)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
        if (v35)
        {
          v34 = *(_QWORD *)v46;
          do
          {
            v10 = 0;
            do
            {
              if (*(_QWORD *)v46 != v34)
                objc_enumerationMutation(v33);
              v36 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v10);
              v37 = v10;
              objc_msgSend(v36, "auditIssues");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = (void *)objc_opt_new();
              v41 = 0u;
              v42 = 0u;
              v43 = 0u;
              v44 = 0u;
              v13 = v11;
              v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
              if (v14)
              {
                v15 = v14;
                v16 = *(_QWORD *)v42;
                do
                {
                  for (i = 0; i != v15; ++i)
                  {
                    if (*(_QWORD *)v42 != v16)
                      objc_enumerationMutation(v13);
                    v18 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
                    if (v40)
                    {
                      v19 = objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "issueClassification");
                      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v19);
                      v20 = (void *)objc_claimAutoreleasedReturnValue();
                      -[AXAuditAutomationSupport auditWarningsToCapture](v38, "auditWarningsToCapture");
                      v21 = (void *)objc_claimAutoreleasedReturnValue();
                      v22 = objc_msgSend(v21, "containsObject:", v20);

                      if (v22)
                        v23 = v39 == 0;
                      else
                        v23 = 1;
                      if (v23)
                      {
                        if (v22)
                          goto LABEL_31;
                        continue;
                      }
                    }
                    else if (!v39)
                    {
                      goto LABEL_31;
                    }
                    objc_msgSend(v18, "auditElement");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v24, "accessibilityIdentifier");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!objc_msgSend(v25, "length"))
                    {

LABEL_31:
                      objc_msgSend(v12, "addObject:", v18);
                      continue;
                    }
                    -[AXAuditAutomationSupport elementIdentifiersToIgnore](v38, "elementIdentifiersToIgnore");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    v27 = objc_msgSend(v26, "containsObject:", v25);

                    if ((v27 & 1) == 0)
                      goto LABEL_31;
                  }
                  v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
                }
                while (v15);
              }

              objc_msgSend(v36, "setAuditIssues:", v12);
              v10 = v37 + 1;
            }
            while (v37 + 1 != v35);
            v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
          }
          while (v35);
        }

        v8 = v32 + 1;
      }
      while (v32 + 1 != v31);
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
      if (!v31)
      {
LABEL_38:

        -[AXAuditAutomationSupport _informDelegateOfResults:error:](v38, "_informDelegateOfResults:error:", obj, 0);
        v4 = v28;
        goto LABEL_39;
      }
    }
  }
  -[AXAuditAutomationSupport _informDelegateOfResults:error:](self, "_informDelegateOfResults:error:", v4, 0);
LABEL_39:

}

- (void)_screenChangedThrottled
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__AXAuditAutomationSupport__screenChangedThrottled__block_invoke;
  block[3] = &unk_25071ABD8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __51__AXAuditAutomationSupport__screenChangedThrottled__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runNextContinuousAudit");
}

- (void)setAuditWarningsToIgnore:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  objc_storeStrong((id *)&self->_auditWarningsToIgnore, a3);
  v5 = a3;
  +[AXAuditIssueDescriptionManager allAuditIssueClassificationCodes](AXAuditIssueDescriptionManager, "allAuditIssueClassificationCodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v8, "removeObjectsInArray:", v5);
  v7 = (void *)objc_msgSend(v8, "copy");
  -[AXAuditAutomationSupport setAuditWarningsToCapture:](self, "setAuditWarningsToCapture:", v7);

}

- (void)_screenChangedNotification
{
  id v2;

  -[AXAuditAutomationSupport _screenChangedThrottler](self, "_screenChangedThrottler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scheduleNow");

}

- (BOOL)_initializeAXObserverIfNeeded
{
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v4;
  __CFRunLoop *Current;
  AXObserverRef v7;
  pid_t pid;

  if (-[AXAuditAutomationSupport _axEventObserver](self, "_axEventObserver"))
    goto LABEL_5;
  AXUIElementRegisterSystemWideServerDeathCallback();
  pid = 0;
  AXUIElementGetPid((AXUIElementRef)objc_msgSend(MEMORY[0x24BDFEA90], "systemWideAXUIElement"), &pid);
  if (!-[AXAuditAutomationSupport _axEventObserver](self, "_axEventObserver"))
  {
    v7 = 0;
    if (AXObserverCreate(pid, (AXObserverCallback)_axNotificationHandler, &v7))
    {
      LOBYTE(RunLoopSource) = 0;
      return (char)RunLoopSource;
    }
    -[AXAuditAutomationSupport set_axEventObserver:](self, "set_axEventObserver:", v7);
  }
  RunLoopSource = AXObserverGetRunLoopSource(-[AXAuditAutomationSupport _axEventObserver](self, "_axEventObserver"));
  if (RunLoopSource)
  {
    v4 = RunLoopSource;
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, v4, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
LABEL_5:
    LOBYTE(RunLoopSource) = 1;
  }
  return (char)RunLoopSource;
}

- (id)_accessibilityNotificationsForContinuousAudit
{
  return &unk_25072A0D8;
}

- (void)_registerForAXNotifications:(BOOL)a3
{
  _BOOL8 v3;
  const __AXUIElement *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  const __CFString *v11;
  __AXObserver *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  if (a3)
    -[AXAuditAutomationSupport _initializeAXObserverIfNeeded](self, "_initializeAXObserverIfNeeded");
  if (-[AXAuditAutomationSupport _axEventObserver](self, "_axEventObserver"))
  {
    v5 = (const __AXUIElement *)objc_msgSend(MEMORY[0x24BDFEA90], "systemWideAXUIElement");
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[AXAuditAutomationSupport _accessibilityNotificationsForContinuousAudit](self, "_accessibilityNotificationsForContinuousAudit", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (!v7)
      goto LABEL_16;
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (1)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = (const __CFString *)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "intValue");
        v12 = -[AXAuditAutomationSupport _axEventObserver](self, "_axEventObserver");
        if (v3)
        {
          if (AXObserverAddNotification(v12, v5, v11, self))
            continue;
        }
        else if (AXObserverRemoveNotification(v12, v5, v11))
        {
          continue;
        }
        -[AXAuditAutomationSupport set_registeredForNotifications:](self, "set_registeredForNotifications:", v3);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (!v8)
      {
LABEL_16:

        return;
      }
    }
  }
}

- (int)targetPid
{
  return self->_targetPid;
}

- (void)setTargetPid:(int)a3
{
  self->_targetPid = a3;
}

- (NSArray)auditTypes
{
  return self->_auditTypes;
}

- (void)setAuditTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)elementIdentifiersToIgnore
{
  return self->_elementIdentifiersToIgnore;
}

- (void)setElementIdentifiersToIgnore:(id)a3
{
  objc_storeStrong((id *)&self->_elementIdentifiersToIgnore, a3);
}

- (NSString)_auditTimestamp
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)set_auditTimestamp:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (AXAuditer)_auditor
{
  return self->__auditor;
}

- (void)set_auditor:(id)a3
{
  objc_storeStrong((id *)&self->__auditor, a3);
}

- (AXAuditThrottler)_screenChangedThrottler
{
  return self->__screenChangedThrottler;
}

- (void)set_screenChangedThrottler:(id)a3
{
  objc_storeStrong((id *)&self->__screenChangedThrottler, a3);
}

- (void)set_singleAuditPendingCount:(int64_t)a3
{
  self->__singleAuditPendingCount = a3;
}

- (OS_dispatch_queue)_auditQueue
{
  return self->__auditQueue;
}

- (void)set_auditQueue:(id)a3
{
  objc_storeStrong((id *)&self->__auditQueue, a3);
}

- (BOOL)_runningContinuousAudit
{
  return self->__runningContinuousAudit;
}

- (void)set_runningContinuousAudit:(BOOL)a3
{
  self->__runningContinuousAudit = a3;
}

- (__AXObserver)_axEventObserver
{
  return self->__axEventObserver;
}

- (void)set_axEventObserver:(__AXObserver *)a3
{
  self->__axEventObserver = a3;
}

- (BOOL)_registeredForNotifications
{
  return self->__registeredForNotifications;
}

- (void)set_registeredForNotifications:(BOOL)a3
{
  self->__registeredForNotifications = a3;
}

- (OS_dispatch_queue)_backgroudQueue
{
  return self->__backgroudQueue;
}

- (void)set_backgroudQueue:(id)a3
{
  objc_storeStrong((id *)&self->__backgroudQueue, a3);
}

- (id)_completionBlock
{
  return self->__completionBlock;
}

- (void)set_completionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)auditWarningsToCapture
{
  return self->_auditWarningsToCapture;
}

- (void)setAuditWarningsToCapture:(id)a3
{
  objc_storeStrong((id *)&self->_auditWarningsToCapture, a3);
}

- (NSArray)auditWarningsToIgnore
{
  return self->_auditWarningsToIgnore;
}

- (BOOL)runContinuousAudit
{
  return self->_runContinuousAudit;
}

- (void)setRunContinuousAudit:(BOOL)a3
{
  self->_runContinuousAudit = a3;
}

- (AXAuditAutomationDelegate)delegate
{
  return (AXAuditAutomationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_auditWarningsToIgnore, 0);
  objc_storeStrong((id *)&self->_auditWarningsToCapture, 0);
  objc_storeStrong(&self->__completionBlock, 0);
  objc_storeStrong((id *)&self->__backgroudQueue, 0);
  objc_storeStrong((id *)&self->__auditQueue, 0);
  objc_storeStrong((id *)&self->__screenChangedThrottler, 0);
  objc_storeStrong((id *)&self->__auditor, 0);
  objc_storeStrong((id *)&self->__auditTimestamp, 0);
  objc_storeStrong((id *)&self->_elementIdentifiersToIgnore, 0);
  objc_storeStrong((id *)&self->_auditTypes, 0);
}

@end
