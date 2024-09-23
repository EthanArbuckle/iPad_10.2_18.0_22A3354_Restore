@implementation _DKApplicationMonitorBase

- (void)updateContextStoreWithFocalApplication:(id)a3 launchReason:(id)a4
{
  __CFString *v6;
  __CFString *v7;
  NSString **p_lastFocalApplicationForContext;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a3;
  v7 = (__CFString *)a4;
  if (!v6
    || -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("com.apple.springboard.home-screen")))
  {

    v6 = &stru_24DA67840;
  }
  p_lastFocalApplicationForContext = &self->_lastFocalApplicationForContext;
  if ((-[NSString isEqual:](*p_lastFocalApplicationForContext, "isEqual:", v6) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE1B170], "userContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B180], "keyPathForForegroundApp");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, v10);

    objc_storeStrong((id *)p_lastFocalApplicationForContext, v6);
    objc_msgSend(MEMORY[0x24BE1B180], "appBundleIdKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v11;
    v18[0] = v6;
    objc_msgSend(MEMORY[0x24BE1B180], "appLaunchReasonKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = &stru_24DA67840;
    v17[1] = v12;
    if (v7)
      v13 = v7;
    v18[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE1B170], "userContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B180], "keyPathForAppDataDictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v16);

  }
}

- (BOOL)lookupApplication:(id)a3 shortVersionString:(id *)a4 exactBundleVersion:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  NSObject *v13;
  id v15;
  id v16;

  v8 = a3;
  if (objc_msgSend(v8, "length"))
  {
    if (objc_msgSend(v8, "hasPrefix:", CFSTR("/")))
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithURL:allowPlaceholder:error:", v9, 1, &v16);
      v11 = v16;

    }
    else
    {
      v15 = 0;
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v8, 1, &v15);
      v11 = v15;
    }
    v12 = v11 == 0;
    if (v11)
    {
      -[_DKMonitor log](self, "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[_DKApplicationMonitorBase lookupApplication:shortVersionString:exactBundleVersion:].cold.1((uint64_t)v8, (uint64_t)v11, v13);

    }
    else
    {
      if (a4)
      {
        objc_msgSend(v10, "shortVersionString");
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (a5)
      {
        objc_msgSend(v10, "exactBundleVersion");
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_eventWithTimestamp:(id)a3 bundleIdentifier:(id)a4 launchReason:(id)a5 shortVersionString:(id)a6 exactBundleVersion:(id)a7
{
  id v10;
  id v11;
  id v12;
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

  v10 = a5;
  v11 = a6;
  v12 = a7;
  objc_msgSend(MEMORY[0x24BE1B050], "withBundle:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_opt_new();
  if (objc_msgSend(v10, "length"))
  {
    objc_msgSend(MEMORY[0x24BE1B020], "launchReason");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, v15);

  }
  if (objc_msgSend(v11, "length"))
  {
    objc_msgSend(MEMORY[0x24BE1B020], "shortVersionString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, v16);

  }
  if (objc_msgSend(v12, "length"))
  {
    objc_msgSend(MEMORY[0x24BE1B020], "exactBundleVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, v17);

  }
  v18 = (void *)MEMORY[0x24BE1B080];
  objc_msgSend(MEMORY[0x24BE1B130], "appInFocusStream");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v14, "copy");
  objc_msgSend(v18, "eventWithStream:startDate:endDate:value:metadata:", v19, v20, v21, v13, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (void)updateBiomeWithAppInFocusStartEvent:(id)a3
{
  id v4;
  void *v5;
  BMAppInFocus *currentAppInFocusEvent;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "absoluteTimestamp");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_currentAppInFocusEvent)
    -[_DKApplicationMonitorBase updateBiomeAppInFocusWithStopEventAtTimestamp:reason:](self, "updateBiomeAppInFocusWithStopEventAtTimestamp:reason:", v7, 0);
  -[_DKApplicationMonitorBase appInFocusSource](self, "appInFocusSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "sendEvent:timestamp:", v4);

  currentAppInFocusEvent = self->_currentAppInFocusEvent;
  self->_currentAppInFocusEvent = (BMAppInFocus *)v4;

}

- (BMSource)appInFocusSource
{
  return (BMSource *)objc_getProperty(self, a2, 160, 1);
}

- (void)updateBiomeAppInFocusWithStopEventAtTimestamp:(id)a3 reason:(id)a4
{
  id v6;
  BMAppInFocus *currentAppInFocusEvent;
  BMAppInFocus *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BMAppInFocus *v17;
  unsigned int v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v6 = a4;
  currentAppInFocusEvent = self->_currentAppInFocusEvent;
  if (currentAppInFocusEvent)
  {
    v8 = currentAppInFocusEvent;
    v20 = objc_alloc(MEMORY[0x24BE0C288]);
    if (objc_msgSend(v6, "length"))
      v9 = v6;
    else
      v9 = 0;
    v19 = v9;
    v18 = -[BMAppInFocus launchType](v8, "launchType");
    -[BMAppInFocus bundleID](v8, "bundleID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMAppInFocus parentBundleID](v8, "parentBundleID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMAppInFocus extensionHostID](v8, "extensionHostID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMAppInFocus shortVersionString](v8, "shortVersionString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMAppInFocus exactVersionString](v8, "exactVersionString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[BMAppInFocus hasDyldPlatform](v8, "hasDyldPlatform");
    if (v12)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[BMAppInFocus dyldPlatform](v8, "dyldPlatform"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    if ((-[BMAppInFocus hasIsNativeArchitecture](v8, "hasIsNativeArchitecture") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[BMAppInFocus isNativeArchitecture](v8, "isNativeArchitecture"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v20, "initWithLaunchReason:launchType:starting:absoluteTimestamp:duration:bundleID:parentBundleID:extensionHostID:shortVersionString:exactVersionString:dyldPlatform:isNativeArchitecture:", v19, v18, MEMORY[0x24BDBD1C0], v24, 0, v23, v22, v21, v10, v11, v13, v14);

      if (!v12)
        goto LABEL_13;
    }
    else
    {
      v15 = (void *)objc_msgSend(v20, "initWithLaunchReason:launchType:starting:absoluteTimestamp:duration:bundleID:parentBundleID:extensionHostID:shortVersionString:exactVersionString:dyldPlatform:isNativeArchitecture:", v19, v18, MEMORY[0x24BDBD1C0], v24, 0, v23, v22, v21, v10, v11, v13, 0);
      if (!v12)
      {
LABEL_13:

        -[_DKApplicationMonitorBase appInFocusSource](self, "appInFocusSource");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "timeIntervalSinceReferenceDate");
        objc_msgSend(v16, "sendEvent:timestamp:", v15);

        v17 = self->_currentAppInFocusEvent;
        self->_currentAppInFocusEvent = 0;

        goto LABEL_14;
      }
    }

    goto LABEL_13;
  }
LABEL_14:

}

- (void)lookupApplication:(uint64_t)a1 shortVersionString:(uint64_t)a2 exactBundleVersion:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_219056000, log, OS_LOG_TYPE_ERROR, "Unable to query LSApplicationRecord for bundleIdentifier:%{public}@ error:%@", (uint8_t *)&v3, 0x16u);
}

- (void)synchronouslyReflectCurrentValue
{
  void *v3;

  -[_DKMonitor currentEvent](self, "currentEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[_DKApplicationMonitorBase obtainCurrentValue](self, "obtainCurrentValue");
}

- (_DKApplicationMonitorBase)init
{
  _DKApplicationMonitorBase *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_DKApplicationMonitorBase;
  v2 = -[_DKMonitor init](&v11, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = (void *)MEMORY[0x24BE7A5D0];
    v5 = MEMORY[0x24BDAC760];
    v6 = 3221225472;
    v7 = __33___DKApplicationMonitorBase_init__block_invoke;
    v8 = &unk_24DA66E78;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v3, "runBlockWhenDeviceIsClassCUnlocked:", &v5);
    -[_DKMonitor setFilter:](v2, "setFilter:", &__block_literal_global_8, v5, v6, v7, v8);
    -[_DKMonitor setEventComparator:](v2, "setEventComparator:", &__block_literal_global_4);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[_DKApplicationMonitorBase deactivate](self, "deactivate");
  v3.receiver = self;
  v3.super_class = (Class)_DKApplicationMonitorBase;
  -[_DKMonitor dealloc](&v3, sel_dealloc);
}

+ (id)eventStream
{
  return CFSTR("FocalApp");
}

+ (id)entitlements
{
  return 0;
}

- (void)start
{
  if (-[_DKMonitor instantMonitorNeedsActivation](self, "instantMonitorNeedsActivation"))
  {
    -[_DKApplicationMonitorBase platformSpecificStart](self, "platformSpecificStart");
    -[_DKApplicationMonitorBase obtainCurrentValue](self, "obtainCurrentValue");
  }
}

- (void)stop
{
  if (-[_DKMonitor instantMonitorNeedsDeactivation](self, "instantMonitorNeedsDeactivation"))
    -[_DKApplicationMonitorBase deactivate](self, "deactivate");
}

- (void)setAppInFocusSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appInFocusSource, 0);
  objc_storeStrong((id *)&self->_currentAppInFocusEvent, 0);
  objc_storeStrong((id *)&self->_lastFocalApplicationForContext, 0);
}

- (void)obtainCurrentValue
{
  NSClassFromString(CFSTR("_DKApplicationMonitorBase"));
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_3();
}

- (void)platformSpecificStart
{
  NSClassFromString(CFSTR("_DKApplicationMonitorBase"));
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_3();
}

- (void)platformSpecificStop
{
  NSClassFromString(CFSTR("_DKApplicationMonitorBase"));
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_3();
}

@end
