@implementation HDNotificationSyncDiagnosticOperation

- (id)reportFilename
{
  return CFSTR("HealthNotificationSync.csv");
}

- (void)run
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  dispatch_time_t v7;
  _QWORD v8[5];

  v3 = objc_alloc_init(MEMORY[0x24BDD3C40]);
  v4 = dispatch_semaphore_create(0);
  v5 = objc_alloc(MEMORY[0x24BDD3D98]);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__HDNotificationSyncDiagnosticOperation_run__block_invoke;
  v8[3] = &unk_24E0D88A8;
  v8[4] = self;
  v6 = (void *)objc_msgSend(v5, "initWithResultsHandler:", v8);
  objc_msgSend(v3, "executeQuery:", v6);
  v7 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v4, v7))
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("ERROR: Timed out attempting collect Notification Sync instructions"));

}

void __44__HDNotificationSyncDiagnosticOperation_run__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v9 = v6;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD3D90], "propertyNames");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_appendCSVLine:", v8);

    objc_msgSend(*(id *)(a1 + 32), "_appendNotificationInstructions:", v9);
  }
  else
  {
    objc_msgSend(v7, "log:", CFSTR("ERROR: Failed to collect Notification Sync instructions: %@"), a4);
  }

}

- (void)_appendNotificationInstructions:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x22078C218](v5);
        objc_msgSend(v9, "propertyValues", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDNotificationSyncDiagnosticOperation _appendCSVLine:](self, "_appendCSVLine:", v11);

        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v6 = v5;
    }
    while (v5);
  }

}

- (void)_appendCSVLine:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "hk_map:", &__block_literal_global);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDiagnosticOperation appendString:](self, "appendString:", v4);

}

id __56__HDNotificationSyncDiagnosticOperation__appendCSVLine___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\"), CFSTR("\\\"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\"%@\"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
