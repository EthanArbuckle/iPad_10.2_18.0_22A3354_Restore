@implementation EntitlementABCIssueReporter

- (EntitlementABCIssueReporter)initWithBiometricABC:(id)a3
{
  id v4;
  EntitlementABCIssueReporter *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EntitlementABCIssueReporter;
  v5 = -[EntitlementABCIssueReporter init](&v8, sel_init);
  if (v5)
  {
    v6 = (void *)objc_opt_new();
    -[EntitlementABCIssueReporter setIssues:](v5, "setIssues:", v6);

    -[EntitlementABCIssueReporter setBiometricABC:](v5, "setBiometricABC:", v4);
  }

  return v5;
}

- (void)reportLegacyClient:(id)a3
{
  EntitlementABCIssueReporter *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  +[LegacyEntitlementABCIssue reportClient:forReporter:](LegacyEntitlementABCIssue, "reportClient:forReporter:", v5, v4);
  objc_sync_exit(v4);

}

- (void)reportMissingPermission:(int)a3 forClientName:(id)a4
{
  uint64_t v4;
  EntitlementABCIssueReporter *v6;
  id v7;

  v4 = *(_QWORD *)&a3;
  v7 = a4;
  v6 = self;
  objc_sync_enter(v6);
  +[MissingPermissionABCIssue reportPermission:client:forReporter:](MissingPermissionABCIssue, "reportPermission:client:forReporter:", v4, v7, v6);
  objc_sync_exit(v6);

}

- (id)issueForTag:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[EntitlementABCIssueReporter issues](self, "issues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)addIssue:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[EntitlementABCIssueReporter issues](self, "issues");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, v5);

}

- (void)rescheduleTimer
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__EntitlementABCIssueReporter_rescheduleTimer__block_invoke;
  block[3] = &unk_24D241268;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __46__EntitlementABCIssueReporter_rescheduleTimer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "rescheduleTimerMain");
}

- (void)rescheduleTimerMain
{
  NSObject *v3;
  NSObject *v4;
  EntitlementABCIssueReporter *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  EntitlementABCIssueReporter *obj;
  _QWORD v32[5];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v4 = __osLogTrace;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2148C7000, v4, OS_LOG_TYPE_DEFAULT, "rescheduleTimer\n", buf, 2u);
  }
  v5 = self;
  objc_sync_enter(v5);
  obj = v5;
  -[EntitlementABCIssueReporter timer](v5, "timer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[EntitlementABCIssueReporter setTimer:](v5, "setTimer:", 0);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[EntitlementABCIssueReporter issues](v5, "issues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v9)
  {
    v10 = 0;
    v11 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        v14 = __osLog;
        if (!__osLog)
          v14 = v3;
        v15 = v14;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v16 = v3;
          objc_msgSend(v13, "tag");
          v17 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "nextAction");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v38 = v17;
          v39 = 2112;
          v40 = v18;
          _os_log_impl(&dword_2148C7000, v15, OS_LOG_TYPE_INFO, "rescheduleTimer: examining issue %@ nextAction=%@\n", buf, 0x16u);

          v3 = v16;
        }

        objc_msgSend(v13, "reportIfNeeded");
        objc_msgSend(v13, "nextAction");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          if (v10)
          {
            objc_msgSend(v13, "nextAction");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v10, "compare:", v20) == 1;

            if (v21)
            {
              objc_msgSend(v13, "nextAction");
              v22 = objc_claimAutoreleasedReturnValue();

              v10 = (void *)v22;
            }
          }
          else
          {
            objc_msgSend(v13, "nextAction");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v9);

    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceDate:", v23);
      v25 = v24;

      if (__osLog)
        v26 = __osLog;
      else
        v26 = v3;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v38 = v10;
        v39 = 1024;
        LODWORD(v40) = (int)v25;
        _os_log_impl(&dword_2148C7000, v26, OS_LOG_TYPE_INFO, "Entitlement issue timer will fire at %@, interval=%d\n", buf, 0x12u);
      }
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __50__EntitlementABCIssueReporter_rescheduleTimerMain__block_invoke;
      v32[3] = &unk_24D2414C0;
      v32[4] = obj;
      objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:repeats:block:", 0, v32, v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[EntitlementABCIssueReporter setTimer:](obj, "setTimer:", v27);

      -[EntitlementABCIssueReporter timer](obj, "timer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setTolerance:", 10.0);

      goto LABEL_36;
    }
  }
  else
  {

  }
  if (__osLog)
    v29 = __osLog;
  else
    v29 = v3;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2148C7000, v29, OS_LOG_TYPE_INFO, "Entitlement issue timer not scheduled\n", buf, 2u);
  }
  v10 = 0;
LABEL_36:
  objc_sync_exit(obj);

  if (__osLogTrace)
    v30 = __osLogTrace;
  else
    v30 = v3;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2148C7000, v30, OS_LOG_TYPE_DEFAULT, "rescheduleTimer ->\n", buf, 2u);
  }

}

uint64_t __50__EntitlementABCIssueReporter_rescheduleTimerMain__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  if (__osLog)
    v2 = __osLog;
  else
    v2 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2148C7000, v2, OS_LOG_TYPE_INFO, "Entitlement issue timer fired\n", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "rescheduleTimer");
}

- (BiometricAutoBugCapture)biometricABC
{
  return (BiometricAutoBugCapture *)objc_loadWeakRetained((id *)&self->_biometricABC);
}

- (void)setBiometricABC:(id)a3
{
  objc_storeWeak((id *)&self->_biometricABC, a3);
}

- (NSMutableDictionary)issues
{
  return self->_issues;
}

- (void)setIssues:(id)a3
{
  objc_storeStrong((id *)&self->_issues, a3);
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_issues, 0);
  objc_destroyWeak((id *)&self->_biometricABC);
}

@end
