@implementation AXBDisplayFilterManager

- (void)setDisplayFilterFromLastUpdate:(__MADisplayFilter *)a3
{
  __MADisplayFilter *displayFilterFromLastUpdate;

  if (a3)
    CFRetain(a3);
  displayFilterFromLastUpdate = self->_displayFilterFromLastUpdate;
  if (displayFilterFromLastUpdate)
    CFRelease(displayFilterFromLastUpdate);
  self->_displayFilterFromLastUpdate = a3;
}

- (__MADisplayFilter)displayFilterFromLastUpdate
{
  __MADisplayFilter *result;
  CFTypeRef v3;

  result = self->_displayFilterFromLastUpdate;
  if (result)
  {
    v3 = CFRetain(result);
    return (__MADisplayFilter *)CFAutorelease(v3);
  }
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_3);
  return (id)sharedInstance_sharedInstance;
}

void __41__AXBDisplayFilterManager_sharedInstance__block_invoke()
{
  AXBDisplayFilterManager *v0;
  void *v1;

  v0 = objc_alloc_init(AXBDisplayFilterManager);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

+ (void)initializeMonitor
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__AXBDisplayFilterManager_initializeMonitor__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initializeMonitor_onceToken_0 != -1)
    dispatch_once(&initializeMonitor_onceToken_0, block);
}

void __44__AXBDisplayFilterManager_initializeMonitor__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  _QWORD *v4;
  _QWORD *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *v7;
  __CFNotificationCenter *v8;
  __CFString *v9;
  __CFNotificationCenter *v10;
  __CFString *v11;
  __CFNotificationCenter *v12;
  __CFString *v13;
  __CFNotificationCenter *v14;
  __CFString *v15;
  __CFNotificationCenter *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  id v22;
  __CFNotificationCenter *v23;
  __CFNotificationCenter *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  id v33;

  _AXSAccessibilityEnabled();
  +[AXBDisplayFilterManager sharedInstance](AXBDisplayFilterManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateNotificationCache");

  v3 = AXIsInternalInstall();
  v4 = (_QWORD *)MEMORY[0x24BED2870];
  v5 = (_QWORD *)MEMORY[0x24BED2780];
  if (v3)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-toggle-testing"), *v4);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_toggleAXSetting, v7, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    v8 = CFNotificationCenterGetDarwinNotifyCenter();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-toggle-testing"), *v5);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterAddObserver(v8, 0, (CFNotificationCallback)_toggleAXSetting, v9, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    v10 = CFNotificationCenterGetDarwinNotifyCenter();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-toggle-testing"), *MEMORY[0x24BED28D8]);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterAddObserver(v10, 0, (CFNotificationCallback)_toggleAXSetting, v11, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    v12 = CFNotificationCenterGetDarwinNotifyCenter();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-toggle-testing"), *MEMORY[0x24BED2788]);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterAddObserver(v12, 0, (CFNotificationCallback)_toggleAXSetting, v13, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    v14 = CFNotificationCenterGetDarwinNotifyCenter();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-toggle-testing"), *MEMORY[0x24BED2710]);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterAddObserver(v14, 0, (CFNotificationCallback)_toggleAXSetting, v15, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    v16 = CFNotificationCenterGetDarwinNotifyCenter();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-toggle-testing"), *MEMORY[0x24BED2930]);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterAddObserver(v16, 0, (CFNotificationCallback)_toggleAXSetting, v17, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  }
  +[AXBDisplayFilterManager sharedInstance](AXBDisplayFilterManager, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_handleFrameRateLimit");

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (const __CFString *)*MEMORY[0x24BDDB960];
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v19, "addObserverForName:object:queue:usingBlock:", v20, 0, v21, &__block_literal_global_184);

  v23 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v23, *(const void **)(a1 + 32), (CFNotificationCallback)_displayFiltersChanged, v20, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v24 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v24, *(const void **)(a1 + 32), (CFNotificationCallback)_displayFiltersChanged, (CFStringRef)*MEMORY[0x24BED2760], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXBDisplayFilterManager sharedInstance](AXBDisplayFilterManager, "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addObserver:selector:name:object:", v26, sel__updateSettings_, *v4, 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXBDisplayFilterManager sharedInstance](AXBDisplayFilterManager, "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObserver:selector:name:object:", v28, sel__updateSettings_, *v5, 0);

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "registerUpdateBlock:forRetrieveSelector:withListener:", &__block_literal_global_186, sel_classicInvertColors, *(_QWORD *)(a1 + 32));

  AXPerformBlockOnMainThreadAfterDelay();
  if (MADisplayFilterPrefGetCategoryEnabled())
  {
    +[AXBDisplayFilterManager sharedInstance](AXBDisplayFilterManager, "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setLastCommittedReduceWhitePointEnabledStatus:", 1.0);

    MADisplayFilterPrefGetReduceWhitePointIntensity();
    v32 = v31;
    +[AXBDisplayFilterManager sharedInstance](AXBDisplayFilterManager, "sharedInstance");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setLastCommittedReduceWhitePointValue:", v32);

  }
}

void __44__AXBDisplayFilterManager_initializeMonitor__block_invoke_2()
{
  id v0;

  +[AXBDisplayFilterManager sharedInstance](AXBDisplayFilterManager, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "updateSettings");

}

void __44__AXBDisplayFilterManager_initializeMonitor__block_invoke_3()
{
  id v0;

  +[AXBDisplayFilterManager sharedInstance](AXBDisplayFilterManager, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "updateSettings");

}

void __44__AXBDisplayFilterManager_initializeMonitor__block_invoke_4()
{
  id v0;

  +[AXBDisplayFilterManager sharedInstance](AXBDisplayFilterManager, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "updateSettings");

}

- (void)_handleFrameRateLimit
{
  void *v3;

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerUpdateBlock:forRetrieveSelector:withListener:", &__block_literal_global_190, sel_shouldLimitDisplayRefreshRate, self);

  __48__AXBDisplayFilterManager__handleFrameRateLimit__block_invoke();
}

void __48__AXBDisplayFilterManager__handleFrameRateLimit__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "shouldLimitDisplayRefreshRate");

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(MEMORY[0x24BDE57F8], "serverIfRunning");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displays");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v13;
    *(_QWORD *)&v5 = 67109378;
    v11 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (!objc_msgSend(v9, "displayType", v11))
        {
          objc_msgSend(v9, "setAccessibilityFrameRateLimitEnabled:", v1);
          AXLogCommon();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v11;
            v17 = v1;
            v18 = 2112;
            v19 = v9;
            _os_log_impl(&dword_232455000, v10, OS_LOG_TYPE_INFO, "AX: Setting frame rate limit: %d on %@", buf, 0x12u);
          }

        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    }
    while (v6);
  }

}

- (void)_updateBrightnessFilters:(BOOL)a3
{
  void *v3;
  int v4;
  int v5;
  void *v6;
  int v7;
  id v8;
  id v9;
  id v10;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BE005C0], "server");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "restoreCachedBrightnessFilters");
    goto LABEL_8;
  }
  v4 = _AXSScreenFilterApplied();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v8, "classicInvertColors");
    v3 = v8;
    if (!v5)
      goto LABEL_9;
  }
  v9 = v3;
  objc_msgSend(MEMORY[0x24BE005C0], "server");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "brightnessFiltersEnabled");

  if (v4)
  {
    if (!v7)
      return;
    goto LABEL_6;
  }

  if ((v7 & 1) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x24BE005C0], "server");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "disableBrightnessFilters");
LABEL_8:
    v3 = v10;
LABEL_9:

  }
}

- (BOOL)_forceSoftwareFilters
{
  return 0;
}

- (BOOL)_allowSoftwareFilters
{
  return 0;
}

- (BOOL)_invertColorsEnabled
{
  void *v3;
  char v4;

  if (_AXSInvertColorsEnabled())
    return 1;
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "classicInvertColors");

  return v4;
}

- (AXUIClient)displayFilterUIClient
{
  id v3;
  AXUIClient *v4;
  AXUIClient *displayFilterUIClient;

  if (-[AXBDisplayFilterManager _allowSoftwareFilters](self, "_allowSoftwareFilters") && !self->_displayFilterUIClient)
  {
    v3 = objc_alloc(MEMORY[0x24BDFF8F0]);
    v4 = (AXUIClient *)objc_msgSend(v3, "initWithIdentifier:serviceBundleName:", CFSTR("DisplayFilterIPrimaryClientID"), *MEMORY[0x24BE00040]);
    displayFilterUIClient = self->_displayFilterUIClient;
    self->_displayFilterUIClient = v4;

    -[AXUIClient setDelegate:](self->_displayFilterUIClient, "setDelegate:", self);
  }
  return self->_displayFilterUIClient;
}

- (void)_updateNotificationCache
{
  -[AXBDisplayFilterManager setInvertColorsWasEnabled:](self, "setInvertColorsWasEnabled:", -[AXBDisplayFilterManager _invertColorsEnabled](self, "_invertColorsEnabled"));
  -[AXBDisplayFilterManager setGrayscaleWasEnabled:](self, "setGrayscaleWasEnabled:", _AXSGrayscaleEnabled() != 0);
  -[AXBDisplayFilterManager setReduceWhitePointWasEnabled:](self, "setReduceWhitePointWasEnabled:", _AXSReduceWhitePointEnabled() != 0);
}

- (void)_repostNotificationIfNeeded
{
  _BOOL4 v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v5;
  __CFNotificationCenter *v6;
  int v7;
  __CFNotificationCenter *LocalCenter;
  CFNotificationName *v9;
  __CFNotificationCenter *v10;

  -[AXBDisplayFilterManager setIgnoringNotifications:](self, "setIgnoringNotifications:", 1);
  v3 = -[AXBDisplayFilterManager invertColorsWasEnabled](self, "invertColorsWasEnabled");
  if (v3 != -[AXBDisplayFilterManager _invertColorsEnabled](self, "_invertColorsEnabled"))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x24BED2870], 0, 0, 1u);
  }
  v5 = -[AXBDisplayFilterManager grayscaleWasEnabled](self, "grayscaleWasEnabled");
  if (_AXSGrayscaleEnabled() != v5)
  {
    v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v6, (CFNotificationName)*MEMORY[0x24BED2780], 0, 0, 1u);
  }
  v7 = -[AXBDisplayFilterManager reduceWhitePointWasEnabled](self, "reduceWhitePointWasEnabled");
  if (_AXSReduceWhitePointEnabled() != v7)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    v9 = (CFNotificationName *)MEMORY[0x24BED28E8];
    CFNotificationCenterPostNotification(LocalCenter, (CFNotificationName)*MEMORY[0x24BED28E8], 0, 0, 1u);
    v10 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v10, *v9, 0, 0, 1u);
  }
  -[AXBDisplayFilterManager _updateNotificationCache](self, "_updateNotificationCache");
  -[AXBDisplayFilterManager setIgnoringNotifications:](self, "setIgnoringNotifications:", 0);
}

- (BOOL)_display:(id)a3 matchesDisplayType:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  char v7;
  BOOL v9;

  v5 = a3;
  v6 = objc_msgSend(v5, "displayType");
  v7 = objc_msgSend(v5, "tag");

  v9 = (v7 & 0x20) == 0 && v6 != 2;
  if (a4)
    v9 = 0;
  if (a4 == 1)
    return (v7 & 0x20) != 0;
  else
    return v9;
}

- (void)_updateCoreSupportForDisplayType:(unint64_t)a3
{
  AXBDisplayFilterManager *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int CategoryEnabled;
  uint64_t v9;
  float v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  AXBDisplayFilterManager *v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  double v27;
  void *v28;
  unsigned int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v4 = self;
  v38 = *MEMORY[0x24BDAC8D0];
  if (!-[AXBDisplayFilterManager _forceSoftwareFilters](self, "_forceSoftwareFilters"))
  {
    objc_msgSend(MEMORY[0x24BE005C0], "server");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "supportsAccessibilityDisplayFilters");

    v7 = -[AXBDisplayFilterManager _invertColorsEnabled](v4, "_invertColorsEnabled");
    v30 = _AXSGrayscaleEnabled();
    CategoryEnabled = MADisplayFilterPrefGetCategoryEnabled();
    if (CategoryEnabled)
      v9 = 0;
    else
      v9 = v7 ^ 1;
    if (CategoryEnabled)
      v10 = 0.89;
    else
      v10 = 1.0;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend(MEMORY[0x24BDE57F8], "serverIfRunning");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "displays");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v12;
    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v34;
      v29 = v9;
      v28 = v13;
      v31 = *(_QWORD *)v34;
      do
      {
        v17 = 0;
        v32 = v15;
        do
        {
          if (*(_QWORD *)v34 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v17);
          if (-[AXBDisplayFilterManager _display:matchesDisplayType:](v4, "_display:matchesDisplayType:", v18, a3, v28))
          {
            if (objc_msgSend(v18, "displayType") == 2)
            {
              -[AXBDisplayFilterManager didEnableHWFiltersForDisplayType](v4, "didEnableHWFiltersForDisplayType");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
              v20 = v7;
              v21 = v4;
              v22 = a3;
              v23 = v6;
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "objectForKeyedSubscript:", v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v25, "BOOLValue");

              v15 = v32;
              v6 = v23;
              a3 = v22;
              v4 = v21;
              v7 = v20;
              v13 = v28;

              v9 = v29;
              if (v26)
                objc_msgSend(v18, "setAllowsWirelessColorFiltering:", 1);
            }
            objc_msgSend(v18, "invertsColors");
            objc_msgSend(v18, "setInvertsColors:", v7);
            objc_msgSend(v18, "setAllowsExtendedDynamicRange:", v9);
            v16 = v31;
            if ((v6 & 1) == 0)
            {
              objc_msgSend(v18, "isGrayscale");
              v15 = v32;
              objc_msgSend(v18, "setGrayscale:", v30 != 0);
              *(float *)&v27 = v10;
              objc_msgSend(v18, "setMaximumBrightness:", v27);
            }
          }
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v15);
    }

  }
}

- (void)_whitePointRampDown
{
  double Current;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  Current = CFAbsoluteTimeGetCurrent();
  -[AXBDisplayFilterManager reduceWhitePointRampStartTime](self, "reduceWhitePointRampStartTime");
  v5 = Current - v4;
  -[AXBDisplayFilterManager reduceWhitePointRampTime](self, "reduceWhitePointRampTime");
  v7 = log2(v5 / v6 + 1.0);
  -[AXBDisplayFilterManager reduceWhitePointRampStartValue](self, "reduceWhitePointRampStartValue");
  v9 = v8;
  -[AXBDisplayFilterManager reduceWhitePointRampEndValue](self, "reduceWhitePointRampEndValue");
  v11 = v10;
  -[AXBDisplayFilterManager reduceWhitePointRampStartValue](self, "reduceWhitePointRampStartValue");
  v13 = v9 + (v11 - v12) * v7;
  if (v7 <= 1.0)
  {
    if (v7 - *(double *)&_whitePointRampDown_LastPercentage <= 0.01)
      return;
    -[AXBDisplayFilterManager _applyMatrixFilter:whitePointReduction:displayType:](self, "_applyMatrixFilter:whitePointReduction:displayType:", -[AXBDisplayFilterManager reduceWhitePointRampDownFilter](self, "reduceWhitePointRampDownFilter", v7 - *(double *)&_whitePointRampDown_LastPercentage), 0, v13);
    AXLogDisplayFilters();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x24BDD16E0];
      -[AXBDisplayFilterManager reduceWhitePointRampEndValue](self, "reduceWhitePointRampEndValue");
      objc_msgSend(v19, "numberWithDouble:");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412802;
      v22 = v17;
      v23 = 2112;
      v24 = v18;
      v25 = 2112;
      v26 = v20;
      _os_log_impl(&dword_232455000, v16, OS_LOG_TYPE_INFO, "Apply ramp down: %@ -> percentage: %@ : startValue: %@", (uint8_t *)&v21, 0x20u);

    }
  }
  else
  {
    AXLogDisplayFilters();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412290;
      v22 = v15;
      _os_log_impl(&dword_232455000, v14, OS_LOG_TYPE_INFO, "Finish white point ramp down: %@", (uint8_t *)&v21, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BE005F8], "currentDisplayLinkManager");
    v16 = objc_claimAutoreleasedReturnValue();
    -[NSObject removeTarget:selector:](v16, "removeTarget:selector:", self, sel__whitePointRampDown);
    v7 = 0.0;
  }

  _whitePointRampDown_LastPercentage = *(_QWORD *)&v7;
}

- (void)_updateMatrixSupportForDisplayType:(unint64_t)a3
{
  _BOOL8 v5;
  void *v6;
  double v7;
  double v8;
  int CategoryEnabled;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  const void *Identity;
  void *v16;
  int v17;
  const void *v18;
  unint64_t v19;
  const void *v20;
  int v21;
  char v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v5 = -[AXBDisplayFilterManager _forceSoftwareFilters](self, "_forceSoftwareFilters");
  -[AXBDisplayFilterManager _invertColorsEnabled](self, "_invertColorsEnabled");
  +[AXBDisplayFilterManager sharedInstance](AXBDisplayFilterManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastCommittedReduceWhitePointEnabledStatus");
  v8 = v7;

  CategoryEnabled = MADisplayFilterPrefGetCategoryEnabled();
  v10 = 0.0;
  v11 = 0.0;
  if (CategoryEnabled)
  {
    -[AXBDisplayFilterManager lastCommittedReduceWhitePointValue](self, "lastCommittedReduceWhitePointValue");
    v10 = v12;
    MADisplayFilterPrefGetReduceWhitePointIntensity();
    v11 = v13;
    -[AXBDisplayFilterManager setLastCommittedReduceWhitePointValue:](self, "setLastCommittedReduceWhitePointValue:");
  }
  v14 = 1.0;
  if (!CategoryEnabled)
    v14 = 0.0;
  -[AXBDisplayFilterManager setLastCommittedReduceWhitePointEnabledStatus:](self, "setLastCommittedReduceWhitePointEnabledStatus:", v14);
  Identity = (const void *)MADisplayFilterCopySystemFilter();
  if (!Identity)
    Identity = (const void *)MADisplayFilterCreateIdentity();
  -[AXBDisplayFilterManager setDisplayFilterFromLastUpdate:](self, "setDisplayFilterFromLastUpdate:", Identity);
  if (v5
    || (objc_msgSend(MEMORY[0x24BE005C0], "server"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v16, "supportsAccessibilityDisplayFilters"),
        v16,
        !v17))
  {
    if (!Identity)
      goto LABEL_17;
    goto LABEL_16;
  }
  if (!Identity)
    goto LABEL_19;
  v18 = (const void *)MADisplayFilterCreateIdentity();
  v19 = 0x24BDD1000uLL;
  if (!v18)
  {
    v22 = 0;
    v23 = v11 <= 0.0001;
LABEL_25:
    -[AXBDisplayFilterManager didEnableHWFiltersForDisplayType](self, "didEnableHWFiltersForDisplayType");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v19 + 1760), "numberWithUnsignedInteger:", a3);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKeyedSubscript:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "BOOLValue");

    if ((v22 & 1) == 0 && (v35 & 1) == 0)
    {
      -[AXBDisplayFilterManager didEnableHWFiltersForDisplayType](self, "didEnableHWFiltersForDisplayType");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v36)
      {
        v37 = (void *)objc_opt_new();
        -[AXBDisplayFilterManager setDidEnableHWFiltersForDisplayType:](self, "setDidEnableHWFiltersForDisplayType:", v37);

      }
      -[AXBDisplayFilterManager didEnableHWFiltersForDisplayType](self, "didEnableHWFiltersForDisplayType");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v39);

    }
    if (((v23 | AXDeviceIsJ5XX() ^ 1) & 1) != 0)
    {
      -[AXBDisplayFilterManager _applyMatrixFilter:whitePointReduction:displayType:](self, "_applyMatrixFilter:whitePointReduction:displayType:", Identity, a3, v11);
    }
    else
    {
      v40 = fmin(v11, 0.999);
      if (v8 == 0.0)
        v10 = 0.0;
      v41 = log2(vabdd_f64(v40, v10) + 1.0);
      -[AXBDisplayFilterManager setReduceWhitePointRampStartTime:](self, "setReduceWhitePointRampStartTime:", CFAbsoluteTimeGetCurrent());
      -[AXBDisplayFilterManager setReduceWhitePointRampTime:](self, "setReduceWhitePointRampTime:", v41);
      -[AXBDisplayFilterManager setReduceWhitePointRampEndValue:](self, "setReduceWhitePointRampEndValue:", v40);
      -[AXBDisplayFilterManager setReduceWhitePointRampStartValue:](self, "setReduceWhitePointRampStartValue:", v10);
      -[AXBDisplayFilterManager setReduceWhitePointRampDownFilter:](self, "setReduceWhitePointRampDownFilter:", Identity);
      AXLogDisplayFilters();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v40);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v41);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 138412802;
        v48 = v43;
        v49 = 2112;
        v50 = v44;
        v51 = 2112;
        v52 = v45;
        _os_log_impl(&dword_232455000, v42, OS_LOG_TYPE_INFO, "White point start %@ -> end %@ : duration: %@", (uint8_t *)&v47, 0x20u);

      }
      objc_msgSend(MEMORY[0x24BE005F8], "currentDisplayLinkManager");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "addTarget:selector:", self, sel__whitePointRampDown);

    }
    goto LABEL_16;
  }
  v20 = v18;
  v21 = CFEqual(v18, Identity);
  CFRelease(v20);
  v22 = 0;
  v23 = v11 <= 0.0001;
  if (v11 > 0.0001 || !v21)
    goto LABEL_25;
  -[AXBDisplayFilterManager didEnableHWFiltersForDisplayType](self, "didEnableHWFiltersForDisplayType");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "BOOLValue");

  if (v27)
  {
    v22 = 1;
    v23 = 1;
    v19 = 0x24BDD1000;
    goto LABEL_25;
  }
LABEL_16:
  CFRelease(Identity);
LABEL_17:
  if (v5)
  {
    v28 = MEMORY[0x24BDBD1C8];
LABEL_22:
    -[AXBDisplayFilterManager setSoftwareFiltersEnabled:](self, "setSoftwareFiltersEnabled:", v5);
    v29 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKey:", v30, CFSTR("showFilters"));

    objc_msgSend(v29, "setObject:forKey:", v28, CFSTR("forceSoftwareFilter"));
    -[AXBDisplayFilterManager displayFilterUIClient](self, "displayFilterUIClient");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", v29, 0, 0, 0);

    return;
  }
LABEL_19:
  if (-[AXBDisplayFilterManager _allowSoftwareFilters](self, "_allowSoftwareFilters")
    && -[AXBDisplayFilterManager softwareFiltersEnabled](self, "softwareFiltersEnabled"))
  {
    v28 = MEMORY[0x24BDBD1C0];
    goto LABEL_22;
  }
}

- (void)_applyMatrixFilter:(__MADisplayFilter *)a3 whitePointReduction:(double)a4 displayType:(unint64_t)a5
{
  int v8;
  char v9;
  void *v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  double v18;
  double v19;
  double v20;
  float v21;
  float v22;
  double v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  float v30;
  uint64_t i;
  void *v32;
  double v33;
  double v34;
  float v35;
  float v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  uint8_t v46[128];
  uint8_t buf[4];
  double v48;
  __int16 v49;
  double v50;
  __int16 v51;
  double v52;
  __int16 v53;
  double v54;
  __int16 v55;
  double v56;
  __int16 v57;
  double v58;
  __int16 v59;
  double v60;
  __int16 v61;
  double v62;
  __int16 v63;
  double v64;
  __int16 v65;
  double v66;
  __int16 v67;
  double v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  float v76;
  float v77;
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v8 = _AXSGrayscaleEnabled();
  if (_AXSInvertColorsEnabled())
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "classicInvertColors");

  }
  v45 = 0;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  MADisplayFilterGetMatrix();
  v11 = 0.0;
  v69 = 0.0;
  v70 = 0.0;
  v36 = 0.0;
  v12 = 0.0;
  v71 = 0.0;
  v72 = 0.0;
  v35 = 0.0;
  v13 = 0.0;
  v14 = 0.0;
  v73 = 0.0;
  v74 = 0.0;
  v15 = 0.0;
  v16 = 0.0;
  v75 = 0.0;
  v76 = 0.0;
  v17 = 0.0;
  v77 = 0.0;
  MADisplayFilterGetGain();
  v34 = a4;
  if (a4 > 0.0001)
  {
    if ((v9 & 1) != 0)
    {
      v19 = v11;
      if (v8)
      {
        v20 = a4 * 0.05;
        v11 = a4 * 0.05 + v19;
        v21 = a4 * 0.05 + v36;
        v69 = v11;
        v70 = v21;
        v36 = v21;
        v12 = a4 * 0.05 + v12;
        v22 = a4 * 0.05 + v35;
        v71 = v12;
        v72 = v22;
        v35 = v22;
        v13 = a4 * 0.05 + v13;
        v14 = a4 * 0.05 + v14;
        v73 = v13;
        v74 = v14;
        v15 = a4 * 0.05 + v15;
        v16 = a4 * 0.05 + v16;
        v75 = v15;
        v76 = v16;
      }
      else
      {
        v20 = a4 * 0.3;
        v11 = a4 * 0.3 + v19;
        v13 = a4 * 0.3 + v13;
        v69 = v11;
        v73 = v13;
      }
      v17 = v20 + v17;
      v77 = v17;
    }
    else if (1.0 - a4 < v18)
    {
      v18 = (1.0 - a4) * 0.95 + 0.05;
    }
  }
  v23 = 0.05;
  if (v18 >= 0.05)
  {
    v23 = v18;
    if (v18 > 1.0)
      v23 = 1.0;
  }
  AXLogDisplayFilters();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134220544;
    v48 = v23;
    v49 = 2048;
    v50 = v34;
    v51 = 2048;
    v52 = v11;
    v53 = 2048;
    v54 = v36;
    v55 = 2048;
    v56 = v12;
    v57 = 2048;
    v58 = v35;
    v59 = 2048;
    v60 = v13;
    v61 = 2048;
    v62 = v14;
    v63 = 2048;
    v64 = v15;
    v65 = 2048;
    v66 = v16;
    v67 = 2048;
    v68 = v17;
    _os_log_debug_impl(&dword_232455000, v24, OS_LOG_TYPE_DEBUG, "Setting Matrix; Gain: %f WhitePointReduction: %f Matrix: [ [%0.5f, %0.5f, %0.5f], [%0.5f, %0.5f, %0.5f], [%0.5f, %0.5f, %0.5f] ]",
      buf,
      0x70u);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(MEMORY[0x24BDE57F8], "serverIfRunning");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "displays");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v38 != v29)
          objc_enumerationMutation(v26);
        v32 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        if (-[AXBDisplayFilterManager _display:matchesDisplayType:](self, "_display:matchesDisplayType:", v32, a5, *(_QWORD *)&v34))
        {
          v30 = v23;
          *(float *)&v33 = v30;
          objc_msgSend(v32, "setAccessibilityColorMatrix:scale:", &v69, v33);
        }
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    }
    while (v28);
  }

}

- (void)updateSettings
{
  if (!-[AXBDisplayFilterManager ignoringNotifications](self, "ignoringNotifications"))
  {
    MAPreferencesSetDomainOverride();
    -[AXBDisplayFilterManager _updateMatrixSupportForDisplayType:](self, "_updateMatrixSupportForDisplayType:", 0);
    -[AXBDisplayFilterManager _updateCoreSupportForDisplayType:](self, "_updateCoreSupportForDisplayType:", 0);
    MAPreferencesSetDomainOverride();
    -[AXBDisplayFilterManager _updateMatrixSupportForDisplayType:](self, "_updateMatrixSupportForDisplayType:", 1);
    -[AXBDisplayFilterManager _updateCoreSupportForDisplayType:](self, "_updateCoreSupportForDisplayType:", 1);
    MAPreferencesSetDomainOverride();
  }
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;
  void *v5;
  objc_super v6;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x24BDDB960], 0);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, (CFNotificationName)*MEMORY[0x24BED2760], 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)AXBDisplayFilterManager;
  -[AXBDisplayFilterManager dealloc](&v6, sel_dealloc);
}

- (void)setDisplayFilterUIClient:(id)a3
{
  objc_storeStrong((id *)&self->_displayFilterUIClient, a3);
}

- (BOOL)softwareFiltersEnabled
{
  return self->_softwareFiltersEnabled;
}

- (void)setSoftwareFiltersEnabled:(BOOL)a3
{
  self->_softwareFiltersEnabled = a3;
}

- (NSMutableDictionary)didEnableHWFiltersForDisplayType
{
  return self->_didEnableHWFiltersForDisplayType;
}

- (void)setDidEnableHWFiltersForDisplayType:(id)a3
{
  objc_storeStrong((id *)&self->_didEnableHWFiltersForDisplayType, a3);
}

- (BOOL)invertColorsWasEnabled
{
  return self->_invertColorsWasEnabled;
}

- (void)setInvertColorsWasEnabled:(BOOL)a3
{
  self->_invertColorsWasEnabled = a3;
}

- (BOOL)grayscaleWasEnabled
{
  return self->_grayscaleWasEnabled;
}

- (void)setGrayscaleWasEnabled:(BOOL)a3
{
  self->_grayscaleWasEnabled = a3;
}

- (BOOL)reduceWhitePointWasEnabled
{
  return self->_reduceWhitePointWasEnabled;
}

- (void)setReduceWhitePointWasEnabled:(BOOL)a3
{
  self->_reduceWhitePointWasEnabled = a3;
}

- (BOOL)ignoringNotifications
{
  return self->_ignoringNotifications;
}

- (void)setIgnoringNotifications:(BOOL)a3
{
  self->_ignoringNotifications = a3;
}

- (double)lastCommittedReduceWhitePointValue
{
  return self->_lastCommittedReduceWhitePointValue;
}

- (void)setLastCommittedReduceWhitePointValue:(double)a3
{
  self->_lastCommittedReduceWhitePointValue = a3;
}

- (double)lastCommittedReduceWhitePointEnabledStatus
{
  return self->_lastCommittedReduceWhitePointEnabledStatus;
}

- (void)setLastCommittedReduceWhitePointEnabledStatus:(double)a3
{
  self->_lastCommittedReduceWhitePointEnabledStatus = a3;
}

- (double)reduceWhitePointRampStartTime
{
  return self->_reduceWhitePointRampStartTime;
}

- (void)setReduceWhitePointRampStartTime:(double)a3
{
  self->_reduceWhitePointRampStartTime = a3;
}

- (double)reduceWhitePointRampTime
{
  return self->_reduceWhitePointRampTime;
}

- (void)setReduceWhitePointRampTime:(double)a3
{
  self->_reduceWhitePointRampTime = a3;
}

- (double)reduceWhitePointRampStartValue
{
  return self->_reduceWhitePointRampStartValue;
}

- (void)setReduceWhitePointRampStartValue:(double)a3
{
  self->_reduceWhitePointRampStartValue = a3;
}

- (double)reduceWhitePointRampEndValue
{
  return self->_reduceWhitePointRampEndValue;
}

- (void)setReduceWhitePointRampEndValue:(double)a3
{
  self->_reduceWhitePointRampEndValue = a3;
}

- (__MADisplayFilter)reduceWhitePointRampDownFilter
{
  return self->_reduceWhitePointRampDownFilter;
}

- (void)setReduceWhitePointRampDownFilter:(__MADisplayFilter *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_didEnableHWFiltersForDisplayType, 0);
  objc_storeStrong((id *)&self->_displayFilterUIClient, 0);
}

@end
