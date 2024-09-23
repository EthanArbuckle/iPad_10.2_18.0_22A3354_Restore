@implementation _DASConfigurationLimiter

- (_DASConfigurationLimiter)init
{
  _DASConfigurationLimiter *v2;
  _DASConfigurationLimiter *v3;
  os_log_t v4;
  OS_os_log *log;
  NSMutableArray *testingOverride;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_DASConfigurationLimiter;
  v2 = -[_DASConfigurationLimiter init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_limitationName, CFSTR("Configuration"));
    v4 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.duetactivityscheduler"), "UTF8String"), (const char *)objc_msgSend(CFSTR("configurationLimiter"), "UTF8String"));
    log = v3->_log;
    v3->_log = (OS_os_log *)v4;

    testingOverride = v3->_testingOverride;
    v3->_testingOverride = 0;

  }
  return v3;
}

+ (id)sharedLimiter
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41___DASConfigurationLimiter_sharedLimiter__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedLimiter_onceToken_0 != -1)
    dispatch_once(&sharedLimiter_onceToken_0, block);
  return (id)sharedLimiter_limitation_0;
}

- (BOOL)deleteLimitForActivity:(id)a3
{
  id v4;
  int v5;
  NSObject *log;
  const char *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NSMutableArray containsObject:](self->_testingOverride, "containsObject:", v4);
  if (v5)
  {
    -[NSMutableArray removeObject:](self->_testingOverride, "removeObject:", v4);
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v4;
      v7 = "Removing override for %@";
LABEL_6:
      _os_log_impl(&dword_1B0DF4000, log, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v4;
      v7 = "Failed to remove override for %@";
      goto LABEL_6;
    }
  }

  return v5;
}

- (BOOL)setLimitForActivity:(id)a3
{
  id v4;
  NSMutableArray *testingOverride;
  NSMutableArray *v6;
  NSMutableArray *v7;
  NSObject *log;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  testingOverride = self->_testingOverride;
  if (!testingOverride)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_testingOverride;
    self->_testingOverride = v6;

    testingOverride = self->_testingOverride;
  }
  -[NSMutableArray addObject:](testingOverride, "addObject:", v4);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1B0DF4000, log, OS_LOG_TYPE_DEFAULT, "Adding %@ to override list", (uint8_t *)&v10, 0xCu);
  }

  return 1;
}

- (BOOL)limitsApplyToActivity:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  char v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "schedulingPriority");
  if (v4 <= _DASSchedulingPriorityDefault)
  {
    objc_msgSend(v3, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      +[_DASPlistParser sharedInstance](_DASPlistParser, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "containsOverrideForActivity:withLimitation:", v3, CFSTR("Configuration"));

      LOBYTE(v5) = v6 ^ 1;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return (char)v5;
}

+ (id)intervalLimiterResponseForActivity:(id)a3
{
  id v3;
  double v4;
  double v5;
  const __CFString *v6;
  uint64_t v7;
  int v8;
  int v10;
  int v12;
  void *v14;

  v3 = a3;
  objc_msgSend(v3, "interval");
  if (v4 > 0.0)
  {
    v5 = v4;
    if (v4 < 300.0)
    {
      v6 = CFSTR("Repeating Interval < 5 mins");
LABEL_4:
      v7 = 4;
LABEL_22:
      +[_DASLimiterResponse limitResponseWithDecision:withLimiter:validityDuration:rationale:](_DASLimiterResponse, "limitResponseWithDecision:withLimiter:validityDuration:rationale:", v7, CFSTR("Configuration"), v6, 0.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
    v8 = objc_msgSend(v3, "shouldWakeDevice");
    if (v5 < 3600.0 && v8 != 0)
    {
      v6 = CFSTR("Waking with Interval < 1 hour");
LABEL_21:
      v7 = 1;
      goto LABEL_22;
    }
    v10 = objc_msgSend(v3, "preventDeviceSleep");
    if (v5 < 3600.0 && v10 != 0)
    {
      v6 = CFSTR("Prevent Device Sleep with interval < 1 hour");
      goto LABEL_21;
    }
    v12 = objc_msgSend(v3, "isIntensive");
    if (v5 < 86400.0 && v12 != 0)
    {
      v6 = CFSTR("Intensive with interval < 1 day");
      goto LABEL_4;
    }
  }
  v14 = 0;
LABEL_23:

  return v14;
}

- (id)responseWithActivityConfigurations:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  int v14;
  unint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  unint64_t v26;

  v3 = a3;
  if (objc_msgSend(v3, "requiresRemoteDeviceWake"))
  {
    objc_msgSend(v3, "remoteDevice");
    v4 = objc_claimAutoreleasedReturnValue();
    if (!v4 || (v5 = (void *)v4, v6 = objc_msgSend(v3, "targetDevice"), v5, !v6))
    {
      v12 = CFSTR("Requires Remote Device Wake && (!RemoteDevice || Target Device Local)");
LABEL_9:
      v13 = 4;
LABEL_32:
      +[_DASLimiterResponse limitResponseWithDecision:withLimiter:validityDuration:rationale:](_DASLimiterResponse, "limitResponseWithDecision:withLimiter:validityDuration:rationale:", v13, CFSTR("Configuration"), v12, 0.0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    }
  }
  objc_msgSend(v3, "remoteDevice");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    v9 = objc_msgSend(v3, "targetDevice");

    if (!v9)
    {
      v12 = CFSTR("Remote Device && Target Device Local");
      goto LABEL_31;
    }
  }
  objc_msgSend(v3, "fileProtection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DASFileProtection complete](_DASFileProtection, "complete");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 == v11)
  {
    v14 = objc_msgSend(v3, "requiresPlugin");

    if (v14)
    {
      v12 = CFSTR("Class A && Plugged In");
LABEL_31:
      v13 = 1;
      goto LABEL_32;
    }
  }
  else
  {

  }
  if (objc_msgSend(v3, "shouldWakeDevice"))
  {
    v15 = objc_msgSend(v3, "schedulingPriority");
    if (v15 < _DASSchedulingPriorityDefault)
    {
      v12 = CFSTR("Should Wake && Priority < Default");
      goto LABEL_31;
    }
  }
  objc_msgSend(v3, "fileProtection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DASFileProtection complete](_DASFileProtection, "complete");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16 != v17)
  {

    goto LABEL_20;
  }
  v18 = objc_msgSend(v3, "requiresDeviceInactivity");

  if (v18)
  {
    v12 = CFSTR("Class A && Requires Inactivity");
    goto LABEL_9;
  }
LABEL_20:
  objc_msgSend(v3, "submittedFileProtection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DASFileProtection none](_DASFileProtection, "none");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19 != v20)
  {

    goto LABEL_22;
  }
  objc_msgSend(v3, "producedResultIdentifiers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "count"))
  {

LABEL_30:
    v12 = CFSTR("Dependencies && Insufficient File Protection");
    goto LABEL_31;
  }
  objc_msgSend(v3, "dependencies");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");

  if (v24)
    goto LABEL_30;
LABEL_22:
  objc_msgSend(v3, "fastPass");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    if (objc_msgSend(v3, "requiresSignificantUserInactivity"))
    {
      v12 = CFSTR("Fast Pass && Requires Significant Inactivity");
    }
    else if (objc_msgSend(v3, "requiresPlugin"))
    {
      v12 = CFSTR("Fast Pass && Requires Plugin");
    }
    else
    {
      v26 = objc_msgSend(v3, "schedulingPriority");
      if (v26 >= _DASSchedulingPriorityUtility)
      {
        v21 = 0;
        goto LABEL_33;
      }
      v12 = CFSTR("Fast Pass && Priority < Utility");
    }
    goto LABEL_9;
  }
LABEL_33:

  return v21;
}

- (id)shouldLimitActivityAtSubmission:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (-[_DASConfigurationLimiter limitsApplyToActivity:](self, "limitsApplyToActivity:", v4))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DASConfigurationLimiter intervalLimiterResponseForActivity:](_DASConfigurationLimiter, "intervalLimiterResponseForActivity:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && objc_msgSend(v6, "decision"))
      objc_msgSend(v5, "addObject:", v7);
    -[_DASConfigurationLimiter responseWithActivityConfigurations:](self, "responseWithActivityConfigurations:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 && objc_msgSend(v8, "decision"))
      objc_msgSend(v5, "addObject:", v8);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)limitedActivity:(id)a3 withLimitsResponses:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  _BOOL4 v9;
  BOOL v10;
  void *v11;
  NSObject *log;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[_DASConfigurationLimiter limitsApplyToActivity:](self, "limitsApplyToActivity:", v6)
    && ((v8 = +[_DASLimiterResponse queryActivityDecision:fromResponses:](_DASLimiterResponse, "queryActivityDecision:fromResponses:", 4, v7), v9 = +[_DASLimiterResponse queryActivityDecision:fromResponses:](_DASLimiterResponse, "queryActivityDecision:fromResponses:", 1, v7), v8)|| v9))
  {
    objc_msgSend(v6, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && -[NSMutableArray containsObject:](self->_testingOverride, "containsObject:", v11))
    {
      log = self->_log;
      v10 = 0;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412546;
        v15 = v6;
        v16 = 2112;
        v17 = v7;
        _os_log_impl(&dword_1B0DF4000, log, OS_LOG_TYPE_DEFAULT, "%@ overrode configuration limit %@", (uint8_t *)&v14, 0x16u);
        v10 = 0;
      }
    }
    else
    {
      +[_DASLimiterResponse updateActivity:withLimitResponse:](_DASLimiterResponse, "updateActivity:withLimitResponse:", v6, v7);
      v10 = 1;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)limitationName
{
  return self->_limitationName;
}

- (void)setLimitationName:(id)a3
{
  objc_storeStrong((id *)&self->_limitationName, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (NSMutableArray)testingOverride
{
  return self->_testingOverride;
}

- (void)setTestingOverride:(id)a3
{
  objc_storeStrong((id *)&self->_testingOverride, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testingOverride, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_limitationName, 0);
}

@end
