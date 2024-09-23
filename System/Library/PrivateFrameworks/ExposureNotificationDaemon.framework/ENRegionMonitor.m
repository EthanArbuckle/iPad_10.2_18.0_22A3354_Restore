@implementation ENRegionMonitor

uint64_t __53__ENRegionMonitor_regionDataSource_updatedWithVisit___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_regionDataSource:updatedWithVisit:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_regionDataSource:(id)a3 updatedWithVisit:(id)a4
{
  id v6;
  void *v7;
  int v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_regionMonitorQueue);
  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isSensitiveLoggingAllowed");

  if (v8
    && gLogCategory_ENRegionMonitor <= 30
    && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  if (v6
    && (objc_msgSend(v6, "region"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "countryCode"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    -[ENRegionMonitor setCurrentRegionVisit:](self, "setCurrentRegionVisit:", v6);
  }
  else if (gLogCategory_ENRegionMonitor <= 90
         && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

}

- (void)setCurrentRegionVisit:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  int v22;
  void *v23;
  ENRegionVisit *v24;
  ENRegionVisit *v25;
  void *v26;
  ENRegionVisit *currentRegionVisit;
  id v28;
  id v29;

  v5 = a3;
  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[ENRegionVisit date](self->_currentRegionVisit, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v5;
  objc_msgSend(v29, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENRegionVisit region](self->_currentRegionVisit, "region");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "region");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isCountryCodeEqualToRegion:", v10);

  if ((v11 & 1) == 0)
  {
    if (gLogCategory_ENRegionMonitor > 30
      || gLogCategory_ENRegionMonitor == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_30;
    }
LABEL_22:
    LogPrintF_safe();
LABEL_30:
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isSensitiveLoggingAllowed");

    if (v22
      && gLogCategory_ENRegionMonitor <= 30
      && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
    {
      NSStringFromSelector(a2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      currentRegionVisit = self->_currentRegionVisit;
      v28 = v29;
      v26 = v23;
      LogPrintF_safe();

    }
    v24 = (ENRegionVisit *)objc_msgSend(v29, "copy", v26, currentRegionVisit, v28);
    v25 = self->_currentRegionVisit;
    self->_currentRegionVisit = v24;

    if (v29)
    {
      -[ENRegionHistoryManager addRegionVisit:](self->_regionHistoryManager, "addRegionVisit:", v29);
      -[ENRegionMonitor _notifyDelegateOfCurrentRegion](self, "_notifyDelegateOfCurrentRegion");
    }
    goto LABEL_37;
  }
  objc_msgSend(v29, "region");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "validSubdivisionCode") & 1) != 0)
  {
    -[ENRegionVisit region](self->_currentRegionVisit, "region");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "validSubdivisionCode") & 1) == 0)
    {

LABEL_20:
      if (gLogCategory_ENRegionMonitor > 30
        || gLogCategory_ENRegionMonitor == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_30;
      }
      goto LABEL_22;
    }
    -[ENRegionVisit region](self->_currentRegionVisit, "region");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "region");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isSubdivisionCodeEqualToRegion:", v15);

    if ((v16 & 1) == 0)
      goto LABEL_20;
  }
  else
  {

  }
  -[ENRegionVisit region](self->_currentRegionVisit, "region");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "region");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "isEqual:", v18))
  {
    objc_msgSend(v8, "timeIntervalSinceDate:", v7);
    v20 = v19;

    if (v20 > 43200.0)
    {
      if (gLogCategory_ENRegionMonitor > 30
        || gLogCategory_ENRegionMonitor == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_30;
      }
      goto LABEL_22;
    }
  }
  else
  {

  }
  if (gLogCategory_ENRegionMonitor <= 10
    && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
LABEL_37:

}

- (OS_dispatch_queue)regionMonitorQueue
{
  return self->_regionMonitorQueue;
}

- (void)regionDataSource:(id)a3 updatedWithVisit:(id)a4
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
  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__ENRegionMonitor_regionDataSource_updatedWithVisit___block_invoke;
  block[3] = &unk_1E87D9EF8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __48__ENRegionMonitor_updateRegionHistoryFileStatus__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateRegionHistoryFileStatus");
}

uint64_t __38__ENRegionMonitor_enableRegionMonitor__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMonitoringEnabled:", 1);
}

- (void)updateRegionHistoryFileStatus
{
  NSObject *v3;
  _QWORD block[5];

  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__ENRegionMonitor_updateRegionHistoryFileStatus__block_invoke;
  block[3] = &unk_1E87D9C28;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)setMonitoringEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;

  v3 = a3;
  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (self->_monitoringEnabled != v3)
  {
    if (gLogCategory_ENRegionMonitor <= 30
      && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
    {
      NSStringFromSelector(a2);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      v9 = "yes";
      if (self->_monitoringEnabled)
        v10 = "yes";
      else
        v10 = "no";
      if (!v3)
        v9 = "no";
      v13 = v10;
      v14 = v9;
      v12 = v7;
      LogPrintF_safe();

    }
    self->_monitoringEnabled = v3;
    if (v3)
      v11 = 2;
    else
      v11 = 1;
    -[ENRegionMonitor setMonitoringMode:](self, "setMonitoringMode:", v11, v12, v13, v14);
    -[ENRegionMonitor _resetRegionMonitor](self, "_resetRegionMonitor");
  }
}

- (ENRegionHistoryManager)regionHistoryManager
{
  return self->_regionHistoryManager;
}

- (void)enableRegionMonitor
{
  NSObject *v3;
  _QWORD block[5];

  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__ENRegionMonitor_enableRegionMonitor__block_invoke;
  block[3] = &unk_1E87D9C28;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)_updateRegionHistoryFileStatus
{
  NSObject *v3;
  id v4;

  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[ENRegionMonitor regionHistoryManager](self, "regionHistoryManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateFileStatus");

}

+ (unint64_t)regionMonitorStateFromAuthorizationStatus:(int)a3
{
  if (a3 == 2)
    return 1;
  else
    return 2 * (a3 == 3);
}

+ (id)regionMonitorAuthorizationStateToString:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Unknown");
  if (a3 == 1)
    v3 = CFSTR("Disabled");
  if (a3 == 2)
    return CFSTR("Enabled");
  else
    return (id)v3;
}

+ (id)locationAuthorizationStatusToString:(int)a3
{
  if ((a3 - 1) > 3)
    return CFSTR("NotDetermined");
  else
    return off_1E87DB118[a3 - 1];
}

+ (id)regionMonitorMonitoringModeToString:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return CFSTR("Unknown");
  else
    return off_1E87DB138[a3 - 1];
}

- (ENRegionMonitor)init
{
  ENRegionMonitor *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *regionMonitorQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ENRegionMonitor;
  v2 = -[ENRegionMonitor init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.exposureNotification.regionMonitor", v3);
    regionMonitorQueue = v2->_regionMonitorQueue;
    v2->_regionMonitorQueue = (OS_dispatch_queue *)v4;

    v2->_monitoringMode = 0;
    -[ENRegionMonitor setup](v2, "setup");
  }
  return v2;
}

- (void)_setup
{
  NSObject *v3;
  ENRegionHistoryManager *v4;
  void *v5;
  ENRegionHistoryManager *v6;
  ENRegionHistoryManager *regionHistoryManager;

  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = [ENRegionHistoryManager alloc];
  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ENRegionHistoryManager initWithDelegate:queue:](v4, "initWithDelegate:queue:", self, v5);
  regionHistoryManager = self->_regionHistoryManager;
  self->_regionHistoryManager = v6;

  -[ENRegionMonitor _createLocationManager](self, "_createLocationManager");
  -[ENRegionMonitor _createCountryDataSource](self, "_createCountryDataSource");
  -[ENRegionMonitor _createSubdivisionDataSource](self, "_createSubdivisionDataSource");
}

- (void)setup
{
  NSObject *v3;
  _QWORD block[5];

  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__ENRegionMonitor_setup__block_invoke;
  block[3] = &unk_1E87D9C28;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __24__ENRegionMonitor_setup__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setup");
}

- (void)_notifyDelegateOfCurrentRegion
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;

  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[ENRegionMonitor authorizationState](self, "authorizationState") == 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isSensitiveLoggingAllowed");

      if (v5
        && gLogCategory_ENRegionMonitor <= 30
        && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
      {
        -[ENRegionMonitor currentRegionVisit](self, "currentRegionVisit");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

      }
      -[ENRegionMonitor currentRegionVisit](self, "currentRegionVisit", v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "region");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "regionMonitor:regionDidChange:", self, v7);

    }
    else if (gLogCategory__ENRegionMonitor <= 90
           && (gLogCategory__ENRegionMonitor != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

  }
  else if (gLogCategory_ENRegionMonitor <= 30
         && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (void)updateRegionMonitorMonitoringMode:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__ENRegionMonitor_updateRegionMonitorMonitoringMode___block_invoke;
  v6[3] = &unk_1E87D9E80;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

uint64_t __53__ENRegionMonitor_updateRegionMonitorMonitoringMode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMonitoringMode:", *(_QWORD *)(a1 + 40));
}

- (unint64_t)getMonitoringMode
{
  NSObject *v3;
  NSObject *v4;
  unint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__ENRegionMonitor_getMonitoringMode__block_invoke;
  v7[3] = &unk_1E87DB0A8;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __36__ENRegionMonitor_getMonitoringMode__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "monitoringMode");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)monitoringMode
{
  NSObject *v3;

  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_monitoringMode;
}

- (void)setMonitoringMode:(unint64_t)a3
{
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;

  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (self->_monitoringMode != a3)
  {
    if (gLogCategory_ENRegionMonitor <= 30
      && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
    {
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "regionMonitorMonitoringModeToString:", self->_monitoringMode);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "regionMonitorMonitoringModeToString:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    self->_monitoringMode = a3;
    -[ENRegionMonitor _resetRegionMonitor](self, "_resetRegionMonitor");
  }
}

- (void)disableRegionMonitor
{
  NSObject *v3;
  _QWORD block[5];

  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__ENRegionMonitor_disableRegionMonitor__block_invoke;
  block[3] = &unk_1E87D9C28;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __39__ENRegionMonitor_disableRegionMonitor__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMonitoringEnabled:", 0);
}

- (void)resetRegionMonitor
{
  NSObject *v3;
  _QWORD block[5];

  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__ENRegionMonitor_resetRegionMonitor__block_invoke;
  block[3] = &unk_1E87D9C28;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __37__ENRegionMonitor_resetRegionMonitor__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetRegionMonitor");
}

- (void)_resetRegionMonitor
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const char *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const char *v25;
  void *v26;
  id v27;

  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (gLogCategory_ENRegionMonitor <= 30
    && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
  {
    NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  -[ENRegionMonitor _stopAllDataSources](self, "_stopAllDataSources", v20);
  if (gLogCategory_ENRegionMonitor <= 30
    && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "regionMonitorAuthorizationStateToString:", -[ENRegionMonitor exposureNotificationAuthorizationState](self, "exposureNotificationAuthorizationState"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "regionMonitorAuthorizationStateToString:", -[ENRegionMonitor significantLocationsAuthorizationState](self, "significantLocationsAuthorizationState"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "regionMonitorAuthorizationStateToString:", -[ENRegionMonitor authorizationState](self, "authorizationState"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[ENRegionMonitor monitoringEnabled](self, "monitoringEnabled"))
      v9 = "yes";
    else
      v9 = "no";
    objc_msgSend((id)objc_opt_class(), "regionMonitorMonitoringModeToString:", -[ENRegionMonitor monitoringMode](self, "monitoringMode"));
    v25 = v9;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v7;
    v24 = v8;
    v21 = v5;
    v22 = v6;
    LogPrintF_safe();

  }
  if (!-[ENRegionMonitor monitoringEnabled](self, "monitoringEnabled", v21, v22, v23, v24, v25, v26))
  {
    if (gLogCategory_ENRegionMonitor > 30
      || gLogCategory_ENRegionMonitor == -1 && !_LogCategory_Initialize())
    {
      return;
    }
LABEL_23:
    NSStringFromSelector(a2);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();
    goto LABEL_24;
  }
  if (-[ENRegionMonitor authorizationState](self, "authorizationState") != 2)
  {
    if (gLogCategory_ENRegionMonitor > 30
      || gLogCategory_ENRegionMonitor == -1 && !_LogCategory_Initialize())
    {
      return;
    }
    goto LABEL_23;
  }
  if (IsAppleInternalBuild() && CFPrefs_GetInt64())
  {
    -[ENRegionMonitor _createTestDataSource](self, "_createTestDataSource");
    -[ENRegionMonitor testRegionDataSource](self, "testRegionDataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startMonitoring");

    -[ENRegionMonitor testRegionDataSource](self, "testRegionDataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentRegionVisit");
    v27 = (id)objc_claimAutoreleasedReturnValue();

    v12 = v27;
    if (!v27)
    {
LABEL_25:

      return;
    }
    -[ENRegionMonitor setCurrentRegionVisit:](self, "setCurrentRegionVisit:", v27);
LABEL_24:
    v12 = v27;
    goto LABEL_25;
  }
  -[ENRegionMonitor setTestRegionDataSource:](self, "setTestRegionDataSource:", 0);
  if (-[ENRegionMonitor monitoringMode](self, "monitoringMode") == 2
    || -[ENRegionMonitor monitoringMode](self, "monitoringMode") == 3)
  {
    -[ENRegionMonitor telephonyDataSource](self, "telephonyDataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "startMonitoring");

    -[ENRegionMonitor coreLocationDataSource](self, "coreLocationDataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "startMonitoring");

    -[ENRegionMonitor regionHistoryManager](self, "regionHistoryManager");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "fileStatus") != 2)
      goto LABEL_24;
    -[ENRegionMonitor regionHistoryManager](self, "regionHistoryManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "getAllRegionVisits");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lastObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "region");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "validSubdivisionCode");

    if ((v19 & 1) == 0)
    {
      if (gLogCategory_ENRegionMonitor <= 30
        && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      -[ENRegionMonitor coreLocationDataSource](self, "coreLocationDataSource");
      v27 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "updateRegion");
      goto LABEL_24;
    }
  }
}

- (void)_createTestDataSource
{
  NSObject *v3;
  ENRegionTestDataSource *v4;

  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = -[ENRegionTestDataSource initWithDelegate:]([ENRegionTestDataSource alloc], "initWithDelegate:", self);
  -[ENRegionMonitor setTestRegionDataSource:](self, "setTestRegionDataSource:", v4);

}

- (void)_createCountryDataSource
{
  NSObject *v3;
  ENRegionMonitorTelephonyDataSource *v4;

  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = -[ENRegionMonitorTelephonyDataSource initWithDelegate:]([ENRegionMonitorTelephonyDataSource alloc], "initWithDelegate:", self);
  -[ENRegionMonitor setTelephonyDataSource:](self, "setTelephonyDataSource:", v4);

}

- (void)_createSubdivisionDataSource
{
  NSObject *v3;
  uint64_t Int64;
  ENRegionMonitorCoreLocationDataSource *v5;

  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  Int64 = CFPrefs_GetInt64();
  if (gLogCategory_ENRegionMonitor <= 30
    && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  if (Int64)
  {
    v5 = -[ENRegionMonitorCoreLocationDataSource initWithDelegate:]([ENRegionMonitorCoreLocationDataSource alloc], "initWithDelegate:", self);
    -[ENRegionMonitor setCoreLocationDataSource:](self, "setCoreLocationDataSource:", v5);

  }
}

- (void)_stopAllDataSources
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;

  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[ENRegionMonitor testRegionDataSource](self, "testRegionDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopMonitoring");

  -[ENRegionMonitor telephonyDataSource](self, "telephonyDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopMonitoring");

  -[ENRegionMonitor coreLocationDataSource](self, "coreLocationDataSource");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopMonitoring");

}

- (void)setExposureNotificationAuthorizationState:(unint64_t)a3
{
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;

  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (self->_exposureNotificationAuthorizationState != a3)
  {
    if (gLogCategory_ENRegionMonitor <= 30
      && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
    {
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "regionMonitorAuthorizationStateToString:", self->_exposureNotificationAuthorizationState);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "regionMonitorAuthorizationStateToString:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    self->_exposureNotificationAuthorizationState = a3;
    -[ENRegionMonitor updateAuthorizationState](self, "updateAuthorizationState");
  }
}

- (void)setSignificantLocationsAuthorizationState:(unint64_t)a3
{
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;

  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (self->_significantLocationsAuthorizationState != a3)
  {
    if (gLogCategory_ENRegionMonitor <= 30
      && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
    {
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "regionMonitorAuthorizationStateToString:", self->_significantLocationsAuthorizationState);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "regionMonitorAuthorizationStateToString:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    self->_significantLocationsAuthorizationState = a3;
    -[ENRegionMonitor updateAuthorizationState](self, "updateAuthorizationState");
  }
}

- (unint64_t)getAuthorizationState
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  unint64_t v7;
  void *v9;
  _QWORD block[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__ENRegionMonitor_getAuthorizationState__block_invoke;
  block[3] = &unk_1E87DB0A8;
  block[4] = self;
  block[5] = &v11;
  dispatch_sync(v5, block);

  if (gLogCategory_ENRegionMonitor <= 30
    && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "regionMonitorAuthorizationStateToString:", v12[3]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  v7 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v7;
}

uint64_t __40__ENRegionMonitor_getAuthorizationState__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

- (void)updateAuthorizationState
{
  uint64_t v3;

  if (-[ENRegionMonitor exposureNotificationAuthorizationState](self, "exposureNotificationAuthorizationState") == 2
    && -[ENRegionMonitor significantLocationsAuthorizationState](self, "significantLocationsAuthorizationState") == 2)
  {
    v3 = 2;
  }
  else
  {
    v3 = 1;
  }
  -[ENRegionMonitor setAuthorizationState:](self, "setAuthorizationState:", v3);
}

- (void)setAuthorizationState:(unint64_t)a3
{
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (self->_authorizationState != a3)
  {
    if (gLogCategory_ENRegionMonitor <= 30
      && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
    {
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "regionMonitorAuthorizationStateToString:", self->_authorizationState);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "regionMonitorAuthorizationStateToString:", a3);
      v11 = v8;
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v7;
      LogPrintF_safe();

    }
    self->_authorizationState = a3;
    -[ENRegionMonitor delegate](self, "delegate", v10, v11, v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "regionMonitor:authorizationStateDidChange:", self, self->_authorizationState);

    -[ENRegionMonitor _notifyDelegateOfCurrentRegion](self, "_notifyDelegateOfCurrentRegion");
    -[ENRegionMonitor _resetRegionMonitor](self, "_resetRegionMonitor");
  }
}

- (void)_createLocationManager
{
  NSObject *v3;
  uint64_t Int64;
  const char *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  const char *v16;
  const char *v17;

  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  Int64 = CFPrefs_GetInt64();
  if (gLogCategory_ENRegionMonitor <= 30
    && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
  {
    v5 = "no";
    if (Int64)
      v5 = "yes";
    v16 = "yes";
    v17 = v5;
    LogPrintF_safe();
  }
  if (Int64)
  {
    -[ENRegionMonitor exposureNotificationLocationManager](self, "exposureNotificationLocationManager", v16, v17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = objc_alloc(MEMORY[0x1E0C9E3C0]);
      objc_msgSend(MEMORY[0x1E0CB34D8], "bundleWithPath:", CFSTR("/System/Library/LocationBundles/ExposureNotificationBundle.bundle"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v7, "initWithEffectiveBundle:delegate:onQueue:", v8, self, v9);
      -[ENRegionMonitor setExposureNotificationLocationManager:](self, "setExposureNotificationLocationManager:", v10);

    }
    -[ENRegionMonitor significantLocationsLocationManager](self, "significantLocationsLocationManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v12 = objc_alloc(MEMORY[0x1E0C9E3C0]);
      objc_msgSend(MEMORY[0x1E0CB34D8], "bundleWithPath:", CFSTR("/System/Library/LocationBundles/Routine.bundle"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v12, "initWithEffectiveBundle:delegate:onQueue:", v13, self, v14);
      -[ENRegionMonitor setSignificantLocationsLocationManager:](self, "setSignificantLocationsLocationManager:", v15);

    }
  }
  else
  {
    -[ENRegionMonitor setExposureNotificationAuthorizationState:](self, "setExposureNotificationAuthorizationState:", 2);
    -[ENRegionMonitor setSignificantLocationsAuthorizationState:](self, "setSignificantLocationsAuthorizationState:", 2);
  }
}

- (id)getCurrentRegionVisit
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__4;
  v12 = __Block_byref_object_dispose__4;
  v13 = 0;
  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__ENRegionMonitor_getCurrentRegionVisit__block_invoke;
  v7[3] = &unk_1E87DB0A8;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __40__ENRegionMonitor_getCurrentRegionVisit__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "currentRegionVisit");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (ENRegionVisit)currentRegionVisit
{
  NSObject *v3;

  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_currentRegionVisit;
}

- (BOOL)purgeAllRegionHistoryWithError:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  char v7;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__4;
  v18 = __Block_byref_object_dispose__4;
  v19 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__ENRegionMonitor_purgeAllRegionHistoryWithError___block_invoke;
  block[3] = &unk_1E87DB0D0;
  block[4] = self;
  block[5] = &v10;
  block[6] = &v14;
  dispatch_sync(v6, block);

  if (a3)
    *a3 = objc_retainAutorelease((id)v15[5]);
  v7 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return v7;
}

void __50__ENRegionMonitor_purgeAllRegionHistoryWithError___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id obj;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "_purgeAllRegionHistoryWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v4;
}

- (BOOL)_purgeAllRegionHistoryWithError:(id *)a3
{
  NSObject *v5;

  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (gLogCategory_ENRegionMonitor <= 30
    && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  -[ENRegionMonitor setCurrentRegionVisit:](self, "setCurrentRegionVisit:", 0);
  return -[ENRegionHistoryManager purgeAllRegionHistoryWithError:](self->_regionHistoryManager, "purgeAllRegionHistoryWithError:", a3);
}

- (BOOL)purgeRegionsOlderThanDate:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  char v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__4;
  v24 = __Block_byref_object_dispose__4;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__ENRegionMonitor_purgeRegionsOlderThanDate_error___block_invoke;
  v12[3] = &unk_1E87DB0F8;
  v14 = &v16;
  v12[4] = self;
  v9 = v6;
  v13 = v9;
  v15 = &v20;
  dispatch_sync(v8, v12);

  if (a4)
    *a4 = objc_retainAutorelease((id)v21[5]);
  v10 = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

void __51__ENRegionMonitor_purgeRegionsOlderThanDate_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v2, "_purgeRegionsOlderThanDate:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v5;
  objc_msgSend(*(id *)(a1 + 32), "currentRegionVisit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(a1 + 40);
  objc_msgSend(v8, "laterDate:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v8, "isEqualToDate:", v9);

  if ((_DWORD)v8)
    objc_msgSend(*(id *)(a1 + 32), "setCurrentRegionVisit:", 0);

}

- (BOOL)_purgeRegionsOlderThanDate:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  BOOL v8;
  id v10;

  v6 = a3;
  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (gLogCategory_ENRegionMonitor <= 30
    && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
  {
    v10 = v6;
    LogPrintF_safe();
  }
  v8 = -[ENRegionHistoryManager purgeRegionsOlderThanDate:error:](self->_regionHistoryManager, "purgeRegionsOlderThanDate:error:", v6, a4, v10);

  return v8;
}

- (id)_getAllRegionsWithError:(id *)a3
{
  NSObject *v5;
  void *v6;

  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[ENRegionMonitor authorizationState](self, "authorizationState") == 2)
  {
    -[ENRegionHistoryManager getAllRegions](self->_regionHistoryManager, "getAllRegions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
    {
      ENErrorF();
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (gLogCategory__ENRegionMonitor <= 90
      && (gLogCategory__ENRegionMonitor != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    v6 = 0;
  }
  return v6;
}

- (id)getAllRegionsWithError:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  v21 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__4;
  v14 = __Block_byref_object_dispose__4;
  v15 = 0;
  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__ENRegionMonitor_getAllRegionsWithError___block_invoke;
  block[3] = &unk_1E87DB0D0;
  block[4] = self;
  block[5] = &v16;
  block[6] = &v10;
  dispatch_sync(v6, block);

  if (a3)
    *a3 = objc_retainAutorelease((id)v11[5]);
  v7 = (id)v17[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7;
}

void __42__ENRegionMonitor_getAllRegionsWithError___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "_getAllRegionsWithError:", &obj);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)_getCurrentRegionVisitWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;

  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[ENRegionMonitor authorizationState](self, "authorizationState") == 2)
  {
    -[ENRegionMonitor currentRegionVisit](self, "currentRegionVisit");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
    {
      ENErrorF();
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isSensitiveLoggingAllowed");

    if (v8
      && gLogCategory_ENRegionMonitor <= 90
      && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    v6 = 0;
  }
  return v6;
}

- (id)getCurrentRegionVisitWithError:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  v21 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__4;
  v14 = __Block_byref_object_dispose__4;
  v15 = 0;
  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__ENRegionMonitor_getCurrentRegionVisitWithError___block_invoke;
  block[3] = &unk_1E87DB0D0;
  block[4] = self;
  block[5] = &v16;
  block[6] = &v10;
  dispatch_sync(v6, block);

  if (a3)
    *a3 = objc_retainAutorelease((id)v11[5]);
  v7 = (id)v17[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7;
}

void __50__ENRegionMonitor_getCurrentRegionVisitWithError___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "_getCurrentRegionVisitWithError:", &obj);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)getAllRegionVisitsWithError:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  v21 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__4;
  v14 = __Block_byref_object_dispose__4;
  v15 = 0;
  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__ENRegionMonitor_getAllRegionVisitsWithError___block_invoke;
  block[3] = &unk_1E87DB0D0;
  block[4] = self;
  block[5] = &v16;
  block[6] = &v10;
  dispatch_sync(v6, block);

  if (a3)
    *a3 = objc_retainAutorelease((id)v11[5]);
  v7 = (id)v17[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7;
}

void __47__ENRegionMonitor_getAllRegionVisitsWithError___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "_getAllRegionVisitsWithError:", &obj);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)_getAllRegionVisitsWithError:(id *)a3
{
  NSObject *v5;
  void *v6;

  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[ENRegionMonitor authorizationState](self, "authorizationState") == 2)
  {
    -[ENRegionHistoryManager getAllRegionVisits](self->_regionHistoryManager, "getAllRegionVisits");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
    {
      ENErrorF();
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (gLogCategory__ENRegionMonitor <= 90
      && (gLogCategory__ENRegionMonitor != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    v6 = 0;
  }
  return v6;
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  NSObject *v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[ENRegionMonitor exposureNotificationLocationManager](self, "exposureNotificationLocationManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v8)
  {
    -[ENRegionMonitor setExposureNotificationAuthorizationState:](self, "setExposureNotificationAuthorizationState:", objc_msgSend((id)objc_opt_class(), "regionMonitorStateFromAuthorizationStatus:", objc_msgSend(v8, "authorizationStatus")));
  }
  else
  {
    -[ENRegionMonitor significantLocationsLocationManager](self, "significantLocationsLocationManager");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v8)
      -[ENRegionMonitor setSignificantLocationsAuthorizationState:](self, "setSignificantLocationsAuthorizationState:", objc_msgSend((id)objc_opt_class(), "regionMonitorStateFromAuthorizationStatus:", objc_msgSend(v8, "authorizationStatus")));
  }
  if (gLogCategory_ENRegionMonitor <= 30
    && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend((id)objc_opt_class(), "locationAuthorizationStatusToString:", objc_msgSend(v8, "authorizationStatus"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
}

- (void)currentRegionVisitDidChange:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  id v8;

  v8 = a3;
  -[ENRegionMonitor regionMonitorQueue](self, "regionMonitorQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSensitiveLoggingAllowed");

  if (v6
    && gLogCategory_ENRegionMonitor <= 30
    && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
  {
    v7 = v8;
    LogPrintF_safe();
  }
  -[ENRegionMonitor setCurrentRegionVisit:](self, "setCurrentRegionVisit:", v8, v7);

}

- (unint64_t)authorizationState
{
  return self->_authorizationState;
}

- (unint64_t)exposureNotificationAuthorizationState
{
  return self->_exposureNotificationAuthorizationState;
}

- (unint64_t)significantLocationsAuthorizationState
{
  return self->_significantLocationsAuthorizationState;
}

- (ENRegionMonitorDelegate)delegate
{
  return (ENRegionMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ENRegionTestDataSource)testRegionDataSource
{
  return self->_testRegionDataSource;
}

- (void)setTestRegionDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_testRegionDataSource, a3);
}

- (ENRegionMonitorTelephonyDataSource)telephonyDataSource
{
  return self->_telephonyDataSource;
}

- (void)setTelephonyDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_telephonyDataSource, a3);
}

- (ENRegionMonitorCoreLocationDataSource)coreLocationDataSource
{
  return self->_coreLocationDataSource;
}

- (void)setCoreLocationDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_coreLocationDataSource, a3);
}

- (void)setRegionMonitorQueue:(id)a3
{
  objc_storeStrong((id *)&self->_regionMonitorQueue, a3);
}

- (CLLocationManager)exposureNotificationLocationManager
{
  return self->_exposureNotificationLocationManager;
}

- (void)setExposureNotificationLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_exposureNotificationLocationManager, a3);
}

- (CLLocationManager)significantLocationsLocationManager
{
  return self->_significantLocationsLocationManager;
}

- (void)setSignificantLocationsLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_significantLocationsLocationManager, a3);
}

- (BOOL)monitoringEnabled
{
  return self->_monitoringEnabled;
}

- (void)setRegionHistoryManager:(id)a3
{
  objc_storeStrong((id *)&self->_regionHistoryManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionHistoryManager, 0);
  objc_storeStrong((id *)&self->_significantLocationsLocationManager, 0);
  objc_storeStrong((id *)&self->_exposureNotificationLocationManager, 0);
  objc_storeStrong((id *)&self->_regionMonitorQueue, 0);
  objc_storeStrong((id *)&self->_coreLocationDataSource, 0);
  objc_storeStrong((id *)&self->_telephonyDataSource, 0);
  objc_storeStrong((id *)&self->_testRegionDataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentRegionVisit, 0);
}

@end
