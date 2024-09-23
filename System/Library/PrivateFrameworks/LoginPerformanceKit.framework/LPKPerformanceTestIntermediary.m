@implementation LPKPerformanceTestIntermediary

+ (BOOL)startPerformanceTestForType:(unint64_t)a3 count:(int64_t)a4 username:(id)a5 password:(id)a6 loginDelay:(int64_t)a7 logoutDelay:(int64_t)a8
{
  id v13;
  id v14;
  BOOL v15;
  uint64_t v17;

  v13 = a5;
  v14 = a6;
  if (objc_msgSend(MEMORY[0x24BE60CB8], "isInternalBuild")
    && !+[LPKPerformanceTestIntermediary _enableKtrace](LPKPerformanceTestIntermediary, "_enableKtrace"))
  {
    LOBYTE(v17) = 1;
    v15 = +[LPKPerformanceTestIntermediary _startUserSwitchTestForType:count:username:password:loginDelay:logoutDelay:isPerformanceTest:](LPKPerformanceTestIntermediary, "_startUserSwitchTestForType:count:username:password:loginDelay:logoutDelay:isPerformanceTest:", a3, a4, v13, v14, a7, a8, v17);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)endPerformanceTestAndDumpResults
{
  void *v2;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  if (!objc_msgSend(MEMORY[0x24BE60CB8], "isInternalBuild")
    || +[LPKPerformanceTestIntermediary _disableKtrace](LPKPerformanceTestIntermediary, "_disableKtrace")
    || (objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "fileExistsAtPath:", CFSTR("/tmp/perf_test_result.json")),
        v4,
        (v5 & 1) == 0)
    && +[LPKPerformanceTestIntermediary _dumpKtraceResult](LPKPerformanceTestIntermediary, "_dumpKtraceResult"))
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", CFSTR("/tmp/perf_test_result.json"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v6, 0, &v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v15;
    if (v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      NSLog(CFSTR("Failed to deserialize perf result, error: %@"), v8);
      v2 = 0;
    }
    else
    {
      NSLog(CFSTR("Deserialize performance data: done\n"));
      objc_msgSend(MEMORY[0x24BE60CC0], "sharedStorage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "retrieveValueForKey:", CFSTR("loginctlPerfTestType"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "integerValue");

      objc_msgSend(MEMORY[0x24BE60CC0], "sharedStorage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "retrieveValueForKey:", CFSTR("loginctlPerfTestCount"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "integerValue");

      +[LPKPerfResultAnalyzer analyzePerformanceTestResult:type:count:](LPKPerfResultAnalyzer, "analyzePerformanceTestResult:type:count:", v7, v11, v14);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (!+[LPKPerformanceTestIntermediary endUserSwitchTest](LPKPerformanceTestIntermediary, "endUserSwitchTest"))NSLog(CFSTR("No user switch test or it failed"));
    }

  }
  return v2;
}

+ (BOOL)startUserSwitchTestForType:(unint64_t)a3 count:(int64_t)a4 username:(id)a5 password:(id)a6 loginDelay:(int64_t)a7 logoutDelay:(int64_t)a8
{
  uint64_t v9;

  LOBYTE(v9) = 0;
  return +[LPKPerformanceTestIntermediary _startUserSwitchTestForType:count:username:password:loginDelay:logoutDelay:isPerformanceTest:](LPKPerformanceTestIntermediary, "_startUserSwitchTestForType:count:username:password:loginDelay:logoutDelay:isPerformanceTest:", a3, a4, a5, a6, a7, a8, v9);
}

+ (BOOL)_startUserSwitchTestForType:(unint64_t)a3 count:(int64_t)a4 username:(id)a5 password:(id)a6 loginDelay:(int64_t)a7 logoutDelay:(int64_t)a8 isPerformanceTest:(BOOL)a9
{
  id v15;
  id v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  dispatch_semaphore_t v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  NSObject *v33;
  uint64_t *v34;
  unint64_t v35;
  int64_t v36;
  int64_t v37;
  int64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  _QWORD v43[4];
  _QWORD v44[6];

  v44[4] = *MEMORY[0x24BDAC8D0];
  v15 = a5;
  v16 = a6;
  objc_msgSend(MEMORY[0x24BE60CC0], "sharedStorage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "retrieveValueForKey:", CFSTR("LPKIsLocalUserSwitchTestOngoing"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    NSLog(CFSTR("There's a local test ongoing, make sure you stop it before starting a new one"));
    v19 = 0;
  }
  else
  {
    v39 = 0;
    v40 = &v39;
    v41 = 0x2020000000;
    v42 = 1;
    objc_msgSend(a1, "_removeStoredValues");
    NSLog(CFSTR("Storing test states"));
    v28 = dispatch_semaphore_create(0);
    objc_msgSend(MEMORY[0x24BE60CC0], "sharedStorage");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = CFSTR("loginctlPerfTestType");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v20;
    v43[1] = CFSTR("loginctlPerfTestCount");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v44[1] = v21;
    v43[2] = CFSTR("LPKLocalUserSwitchTestIsPerformanceTest");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a9);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v22;
    v43[3] = CFSTR("LPKLocalUserSwitchTestRetryCount");
    v24 = &unk_24F03B090;
    if (a9)
      v24 = &unk_24F03B078;
    v44[2] = v22;
    v44[3] = v24;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, v43, 4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __127__LPKPerformanceTestIntermediary__startUserSwitchTestForType_count_username_password_loginDelay_logoutDelay_isPerformanceTest___block_invoke;
    v30[3] = &unk_24F039BE8;
    v31 = v15;
    v35 = a3;
    v36 = a4;
    v37 = a7;
    v38 = a8;
    v32 = v16;
    v34 = &v39;
    v26 = v28;
    v33 = v26;
    objc_msgSend(v29, "saveKeyValuePairs:completionHandler:", v25, v30);

    dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
    if (*((_BYTE *)v40 + 24))
    {
      v19 = 1;
    }
    else
    {
      +[LPKPerformanceTestIntermediary _removeStoredValues](LPKPerformanceTestIntermediary, "_removeStoredValues");
      v19 = *((_BYTE *)v40 + 24) != 0;
    }

    _Block_object_dispose(&v39, 8);
  }

  return v19;
}

void __127__LPKPerformanceTestIntermediary__startUserSwitchTestForType_count_username_password_loginDelay_logoutDelay_isPerformanceTest___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  __int128 v12;
  _QWORD v13[4];
  __int128 v14;

  if (a2)
  {
    NSLog(CFSTR("Test states stored\nStarting login & logout for account: %@..."), *(_QWORD *)(a1 + 32));
    objc_msgSend(MEMORY[0x24BE60CB0], "sharedController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 64);
    v6 = *(_QWORD *)(a1 + 72);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 80);
    v10 = *(_QWORD *)(a1 + 88);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v12 = *(_OWORD *)(a1 + 48);
    v13[2] = __127__LPKPerformanceTestIntermediary__startUserSwitchTestForType_count_username_password_loginDelay_logoutDelay_isPerformanceTest___block_invoke_2;
    v13[3] = &unk_24F039BC0;
    v11 = (id)v12;
    v14 = v12;
    objc_msgSend(v4, "triggerLocalUserSwitchTestForType:count:username:password:loginDelay:logoutDelay:completionHandler:", v5, v6, v7, v8, v9, v10, v13);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    NSLog(CFSTR("Failed to start test due to error: %@"), a3);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
}

intptr_t __127__LPKPerformanceTestIntermediary__startUserSwitchTestForType_count_username_password_loginDelay_logoutDelay_isPerformanceTest___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    NSLog(CFSTR("Failed to trigger test with error: %@"), a2);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (BOOL)endUserSwitchTest
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE60CC0], "sharedStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "retrieveValueForKey:", CFSTR("LPKLocalUserSwitchTestHasFinishedSuccessfully"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(a1, "_removeStoredValues");
  objc_msgSend(MEMORY[0x24BE60CB0], "sharedController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "interruptLocalUserSwitchTest");

  return v5;
}

+ (void)enableRestrictionlessLoginWithCompletionHandler:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BE60CC0];
  v4 = a3;
  objc_msgSend(v3, "sharedStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("isRestrictionlessLoginEnabled");
  v8[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "saveKeyValuePairs:completionHandler:", v6, v4);

}

+ (void)disableRestrictionlessLoginWithCompletionHandler:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BE60CC0];
  v4 = a3;
  objc_msgSend(v3, "sharedStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = CFSTR("isRestrictionlessLoginEnabled");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearKeys:completionHandler:", v6, v4);

}

+ (void)_removeStoredValues
{
  dispatch_semaphore_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  dispatch_semaphore_t v7;
  _QWORD v8[12];

  v8[11] = *MEMORY[0x24BDAC8D0];
  v2 = dispatch_semaphore_create(0);
  objc_msgSend(MEMORY[0x24BE60CC0], "sharedStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = CFSTR("LPKIsLocalUserSwitchTestOngoing");
  v8[1] = CFSTR("LPKLocalUserSwitchTestType");
  v8[2] = CFSTR("LPKLocalUserSwitchTestRemainCycleCount");
  v8[3] = CFSTR("LPKLocalUserSwitchTestUsername");
  v8[4] = CFSTR("LPKLocalUserSwitchTestPassword");
  v8[5] = CFSTR("LPKLocalUserSwitchTestHasFinishedSuccessfully");
  v8[6] = CFSTR("LPKLocalUserSwitchTestRetryCount");
  v8[7] = CFSTR("LPKLocalUserSwitchTestIsPerformanceTest");
  v8[8] = CFSTR("TestHasBeenPrewarmed");
  v8[9] = CFSTR("LPKLocalUserSwitchTestLoginDelay");
  v8[10] = CFSTR("LPKLocalUserSwitchTestLogoutDelay");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__LPKPerformanceTestIntermediary__removeStoredValues__block_invoke;
  v6[3] = &unk_24F039C10;
  v7 = v2;
  v5 = v2;
  objc_msgSend(v3, "clearKeys:completionHandler:", v4, v6);

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __53__LPKPerformanceTestIntermediary__removeStoredValues__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (int64_t)_enableKtrace
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = system("rm /tmp/perf_test_result.trace");
  NSLog(CFSTR("Remove old result trace: %d"), v2);
  v3 = system("rm /tmp/perf_test_result.json");
  NSLog(CFSTR("Remove old result json: %d"), v3);
  v4 = system("/usr/bin/ktrace remove");
  NSLog(CFSTR("Remove old ktrace data: %d"), v4);
  v5 = v4;
  if (!(_DWORD)v4)
  {
    v6 = system("/usr/bin/ktrace init -b 200");
    NSLog(CFSTR("Initialize ktrace buffer: %d"), v6);
    v5 = v6;
    if (!(_DWORD)v6)
    {
      v7 = system("/usr/bin/ktrace setopt -w -f S0x2B84,S0x2BAB,S0x2BAD,S0x2BB1,S0x2B85,S0x2B8A,S0x2B52,S0x2B71,S0x2B6D,S0x2B6E,S0x3410");
      NSLog(CFSTR("Setup ktrace output format: %d"), v7);
      v5 = v7;
      if (!(_DWORD)v7)
      {
        v8 = system("/usr/bin/ktrace enable");
        NSLog(CFSTR("Enable ktrace: %d"), v8);
        return (int)v8;
      }
    }
  }
  return v5;
}

+ (int64_t)_disableKtrace
{
  uint64_t v2;
  int v3;

  v2 = system("/usr/bin/ktrace disable");
  v3 = v2;
  NSLog(CFSTR("Disable ktrace: %d"), v2);
  return v3;
}

+ (int64_t)_dumpKtraceResult
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;

  v3 = system("/usr/bin/ktrace dump -E /tmp/perf_test_result.trace");
  NSLog(CFSTR("Dump perf result: %d"), v3);
  LODWORD(v4) = v3;
  if (!(_DWORD)v3)
  {
    objc_msgSend(a1, "_generateSharedipadTraceHelperCommand");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = system((const char *)objc_msgSend(v5, "UTF8String"));

    NSLog(CFSTR("Generate signposts.codes file: %d"), v4);
    if (!(_DWORD)v4)
    {
      v6 = system("ktrace trace -R /tmp/perf_test_result.trace -C /tmp/signposts.codes -fS0x2B84,S0x2BAB,S0x2BAD,S0x2BB1,S0x2B85,S0x2B8A,S0x2B71,S0x2B6D,S0x2B6E --json > /tmp/perf_test_result.json");
      LODWORD(v4) = v6;
      NSLog(CFSTR("Generate perf result JSON file: %d"), v6);
    }
  }
  return (int)v4;
}

+ (id)_generateSharedipadTraceHelperCommand
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("/usr/local/bin/sharedipadtracehelper make -codes %@ -plists "), CFSTR("/tmp/signposts.codes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = objc_msgSend(&unk_24F03B0F0, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(&unk_24F03B0F0);
        v7 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6));
        if (!access((const char *)objc_msgSend(v7, "UTF8String"), 4))
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" %@ "), v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "appendString:", v8);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(&unk_24F03B0F0, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  return v2;
}

@end
