@implementation FKAutoBugCaptureReporter

- (void)reportIssueWithDomain:(id)a3 type:(id)a4 subtype:(id)a5 subtypeContext:(id)a6 payload:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  _QWORD v25[5];
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!-[FKAutoBugCaptureReporter isRunningUnitTests](self, "isRunningUnitTests"))
  {
    if (-[FKAutoBugCaptureReporter shouldReportIssue](self, "shouldReportIssue"))
    {
      objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "processName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        v20 = v18;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "bundleIdentifier");
        v20 = objc_claimAutoreleasedReturnValue();

      }
      v22 = objc_alloc_init(MEMORY[0x24BEB3478]);
      objc_msgSend(v22, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:", v12, v13, v14, v15, v20, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = os_log_create("com.apple.FinanceKit", "AutoBugCapture");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413058;
        v27 = v12;
        v28 = 2112;
        v29 = v13;
        v30 = 2112;
        v31 = v14;
        v32 = 2112;
        v33 = v15;
        _os_log_impl(&dword_233151000, v24, OS_LOG_TYPE_INFO, "Submitting snapshot request to ABC for signature: %@.%@.%@.%@", buf, 0x2Au);
      }

      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __86__FKAutoBugCaptureReporter_reportIssueWithDomain_type_subtype_subtypeContext_payload___block_invoke;
      v25[3] = &unk_250466D68;
      v25[4] = self;
      objc_msgSend(v22, "snapshotWithSignature:duration:event:payload:reply:", v23, 0, v16, v25, 0.0);

    }
    else
    {
      v20 = os_log_create("com.apple.FinanceKit", "AutoBugCapture");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413058;
        v27 = v12;
        v28 = 2112;
        v29 = v13;
        v30 = 2112;
        v31 = v14;
        v32 = 2112;
        v33 = v15;
        _os_log_impl(&dword_233151000, v20, OS_LOG_TYPE_INFO, "Not reporting to AutoBugCapture because we are rate limited: %@.%@.%@.%@", buf, 0x2Au);
      }
    }

  }
}

uint64_t __86__FKAutoBugCaptureReporter_reportIssueWithDomain_type_subtype_subtypeContext_payload___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleResponse:", a2);
}

- (void)handleResponse:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  _BOOL4 v11;
  _BOOL4 v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BEB3558]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BEB3548]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = os_log_create("com.apple.FinanceKit", "AutoBugCapture");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v13 = 138412290;
      v14 = v7;
      _os_log_impl(&dword_233151000, v8, OS_LOG_TYPE_INFO, "Diagnostic reporter snapshot accepted with sessionID %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BEB3528]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "intValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BEB3530]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[FKAutoBugCaptureReporter isExpectedFailureReason:](self, "isExpectedFailureReason:", v10);
    v8 = os_log_create("com.apple.FinanceKit", "AutoBugCapture");
    v12 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v11)
    {
      if (v12)
        -[FKAutoBugCaptureReporter handleResponse:].cold.1();
    }
    else if (v12)
    {
      -[FKAutoBugCaptureReporter handleResponse:].cold.2();
    }
  }

}

- (BOOL)isExpectedFailureReason:(int)a3
{
  return *MEMORY[0x24BEB34B8] == a3
      || *MEMORY[0x24BEB34C0] == a3
      || *MEMORY[0x24BEB34A0] == a3
      || *MEMORY[0x24BEB34E8] == a3;
}

- (BOOL)shouldReportIssue
{
  void *v2;
  double v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&shouldReportIssue_lock);
  if (shouldReportIssue_lastReportDate && (objc_msgSend(v2, "timeIntervalSinceDate:"), v3 < 86400.0))
  {
    v4 = 0;
  }
  else
  {
    objc_storeStrong((id *)&shouldReportIssue_lastReportDate, v2);
    v4 = 1;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&shouldReportIssue_lock);

  return v4;
}

- (BOOL)isRunningUnitTests
{
  return NSClassFromString(CFSTR("XCTest")) != 0;
}

- (void)handleResponse:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_233151000, v0, v1, "Diagnostic reporter snapshot rejected with expected reason %d (%@)");
}

- (void)handleResponse:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_233151000, v0, v1, "Diagnostic reporter snapshot rejected with unexpected reason %d (%@)");
}

@end
