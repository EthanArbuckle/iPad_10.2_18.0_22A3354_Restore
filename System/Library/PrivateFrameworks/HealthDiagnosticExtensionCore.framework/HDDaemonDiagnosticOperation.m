@implementation HDDaemonDiagnosticOperation

- (id)reportFilename
{
  return CFSTR("HealthDaemon.txt");
}

- (void)run
{
  id v3;
  void *v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  int v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  void *v14;
  void *v15;
  dispatch_time_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  id v22;
  _QWORD v23[5];
  NSObject *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v3 = objc_alloc_init(MEMORY[0x24BDD3C40]);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3B30]), "initWithHealthStore:", v3);
  v5 = dispatch_semaphore_create(0);
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  v31 = 0;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __34__HDDaemonDiagnosticOperation_run__block_invoke;
  v23[3] = &unk_24E0D8750;
  v25 = &v26;
  v23[4] = self;
  v6 = v5;
  v24 = v6;
  objc_msgSend(v4, "fetchDiagnosticsForKeys:completion:", MEMORY[0x24BDBD1A8], v23);
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isAppleInternalInstall"))
    v8 = "YES";
  else
    v8 = "NO";
  -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("Apple Internal: %s"), v8);
  v9 = objc_msgSend(v7, "futureMigrationsEnabled");
  v10 = "disabled";
  if (v9)
    v10 = "ENABLED";
  -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("Future Migrations: %s"), v10);
  if (objc_msgSend(v7, "isRunningStoreDemoMode"))
    v11 = "YES";
  else
    v11 = "NO";
  -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("Store Demo Mode: %s"), v11);
  if (objc_msgSend(v7, "isTestingDevice"))
    v12 = "YES";
  else
    v12 = "NO";
  -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("Testing Device: %s"), v12);
  if (objc_msgSend(MEMORY[0x24BDD41B0], "usingDemoDataDatabase"))
    v13 = "YES";
  else
    v13 = "NO";
  -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("Using Demo Data Database: %s"), v13);
  -[HDDiagnosticOperation appendNewline](self, "appendNewline");
  objc_msgSend(MEMORY[0x24BE40A38], "backupInfoUserDefaultsKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDaemonDiagnosticOperation _daemonUserDefaultValueForKey:](self, "_daemonUserDefaultValueForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("Authorization Backup Info: %@"), v15);
  v16 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v6, v16))
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("Timed out attempting collect healthd diagnostics."));
  if (v27[5])
  {
    -[HDDiagnosticOperation attachmentDirectoryURL](self, "attachmentDirectoryURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "URLByAppendingPathComponent:", CFSTR("healthd-diagnostics.txt"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)v27[5];
    v22 = 0;
    v20 = objc_msgSend(v19, "writeToURL:atomically:encoding:error:", v18, 1, 4, &v22);
    v21 = v22;
    if ((v20 & 1) != 0)
      -[HDDiagnosticOperation log:](self, "log:", CFSTR("Successfully captured healthd diagnostics to 'healthd-diagnostics.txt'."));
    else
      -[HDDiagnosticOperation log:](self, "log:", CFSTR("Failed to write out healthd diagnostics:\n%@"), v27[5]);

  }
  _Block_object_dispose(&v26, 8);

}

void __34__HDDaemonDiagnosticOperation_run__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;

  v6 = a2;
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  else
    objc_msgSend(*(id *)(a1 + 32), "log:", CFSTR("Failed to collect healthd diagnostics: %@"), a3, 0);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (id)_daemonUserDefaultValueForKey:(id)a3
{
  return (id)(id)CFPreferencesCopyValue((CFStringRef)a3, (CFStringRef)*MEMORY[0x24BDD4650], (CFStringRef)*MEMORY[0x24BDBD578], (CFStringRef)*MEMORY[0x24BDBD570]);
}

@end
