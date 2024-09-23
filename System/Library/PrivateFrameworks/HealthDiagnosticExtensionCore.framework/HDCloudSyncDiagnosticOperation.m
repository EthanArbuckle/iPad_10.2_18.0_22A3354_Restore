@implementation HDCloudSyncDiagnosticOperation

- (id)reportFilename
{
  return CFSTR("HealthCloudSync.txt");
}

- (void)run
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = objc_alloc_init(MEMORY[0x24BDD3C40]);
  if (-[HDCloudSyncDiagnosticOperation _reportCloudSyncStatusWithHealthStore:](self, "_reportCloudSyncStatusWithHealthStore:"))
  {
    -[HDDiagnosticOperation healthDirectoryURL](self, "healthDirectoryURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("healthdb.sqlite"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDDiagnosticOperation openReadOnlyDatabaseAtURL:](self, "openReadOnlyDatabaseAtURL:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncDiagnosticOperation _reportCurrentSyncIdentityWithDatabase:](self, "_reportCurrentSyncIdentityWithDatabase:", v5);
    -[HDCloudSyncDiagnosticOperation _reportCloudSyncJournalStats](self, "_reportCloudSyncJournalStats");
    -[HDCloudSyncDiagnosticOperation _reportCloudSyncErrors](self, "_reportCloudSyncErrors");
    -[HDCloudSyncDiagnosticOperation _reportCloudSyncStoreDetailsWithDatabase:](self, "_reportCloudSyncStoreDetailsWithDatabase:", v5);
    -[HDCloudSyncDiagnosticOperation _reportCloudSyncKeyValuesWithDatabase:](self, "_reportCloudSyncKeyValuesWithDatabase:", v5);
    -[HDCloudSyncDiagnosticOperation _reportCloudSyncDescriptionWithHealthStore:](self, "_reportCloudSyncDescriptionWithHealthStore:", v6);
    objc_msgSend(v5, "close");

  }
}

- (BOOL)_reportCloudSyncStatusWithHealthStore:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  BOOL v9;
  _QWORD v11[5];
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  v5 = dispatch_semaphore_create(0);
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD39E8]), "initWithHealthStore:", v4);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __72__HDCloudSyncDiagnosticOperation__reportCloudSyncStatusWithHealthStore___block_invoke;
  v11[3] = &unk_24E0D8778;
  v13 = &v14;
  v11[4] = self;
  v7 = v5;
  v12 = v7;
  objc_msgSend(v6, "fetchCloudSyncStatusWithCompletion:", v11);
  v8 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("ERROR: Timed out attempting collect Cloud Sync status"));
    v9 = 0;
  }
  else
  {
    v9 = *((_BYTE *)v15 + 24) != 0;
  }

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __72__HDCloudSyncDiagnosticOperation__reportCloudSyncStatusWithHealthStore___block_invoke(uint64_t a1, char a2, void *a3, void *a4, int a5, void *a6)
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  id v20;

  v20 = a3;
  v11 = a4;
  v12 = a6;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("CloudSync Status:"));
    v13 = *(void **)(a1 + 32);
    objc_msgSend(v13, "stringFromDate:", v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendFormat:", CFSTR("\tLast successful push: %@"), v14);

    v15 = *(void **)(a1 + 32);
    objc_msgSend(v15, "stringFromDate:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "appendFormat:", CFSTR("\tLast successful pull: %@"), v16);

    v17 = "NO";
    if (a5)
      v17 = "YES";
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\tSync in-progress: %s"), v17);
  }
  else
  {
    v18 = *(void **)(a1 + 32);
    if (v12)
      objc_msgSend(v18, "log:", CFSTR("ERROR: Failed to fetch Cloud Sync status: %@"), v12);
    else
      objc_msgSend(v18, "log:", CFSTR("Cloud Sync disabled"), v19);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (void)_reportCurrentSyncIdentityWithDatabase:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;

  v4 = *MEMORY[0x24BE40960];
  v14 = 0;
  objc_msgSend(MEMORY[0x24BE40C90], "_rawValuesForKeys:domain:category:database:error:", 0, v4, 0, a3, &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v14;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BE40A00]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v9 = 0;
    }
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __73__HDCloudSyncDiagnosticOperation__reportCurrentSyncIdentityWithDatabase___block_invoke;
    v13[3] = &unk_24E0D87A0;
    v13[4] = self;
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x22078C350](v13);
    -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("Current Sync Identity:"));
    ((void (**)(_QWORD, const __CFString *, void *))v10)[2](v10, CFSTR("HardwareIdentifier"), v9);
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE40950]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const __CFString *, void *))v10)[2](v10, CFSTR("DatabaseIdentifier"), v11);

    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE40958]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const __CFString *, void *))v10)[2](v10, CFSTR("InstanceDiscriminator"), v12);

  }
  else
  {
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("ERROR: Failed to get key value pairs for domain \"%@\": %@"), v4, v6);
  }

}

void __73__HDCloudSyncDiagnosticOperation__reportCurrentSyncIdentityWithDatabase___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  if (a3)
  {
    v5 = (void *)MEMORY[0x24BDD1880];
    v6 = a2;
    objc_msgSend(v5, "hk_UUIDWithData:", a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("%@: %@"), v6, v7);

  }
  else
  {
    v8 = a2;
    objc_msgSend(v3, "appendFormat:", CFSTR("%@: %@"), v8, CFSTR("(null)"));
  }

}

- (void)_reportCloudSyncJournalStats
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;

  -[HDDiagnosticOperation healthDirectoryURL](self, "healthDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("CloudSyncJournals"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  v14 = 0.0;
  v12 = 0;
  v5 = -[HDDiagnosticOperation getFileStatisticsForDirectoryWithURL:earliestModificationDate:totalFileSize:maxFileSize:](self, "getFileStatisticsForDirectoryWithURL:earliestModificationDate:totalFileSize:maxFileSize:", v4, &v14, &v13, &v12);
  if (v5)
  {
    v6 = v5;
    -[HDDiagnosticOperation appendNewline](self, "appendNewline");
    objc_msgSend(v4, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (double)v13 * 0.0009765625;
    v9 = (double)v12 * 0.0009765625;
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDiagnosticOperation stringFromDate:](self, "stringFromDate:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("%@: Found %ld unprocessed journal chapters (total %0.2lfkb, max %0.2lfkb). The oldest file was last modified %@"), v7, v6, *(_QWORD *)&v8, *(_QWORD *)&v9, v11);

  }
  else
  {
    objc_msgSend(v4, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("%@: No outstanding unprocessed journal chapters."), v7);
  }

}

- (void)_reportCloudSyncKeyValuesWithDatabase:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  id v16;

  v4 = *MEMORY[0x24BE40D30];
  v16 = 0;
  objc_msgSend(MEMORY[0x24BE40C90], "_rawValuesForKeys:domain:category:database:error:", 0, v4, 0, a3, &v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v16;
  v7 = v6;
  if (v5)
  {
    v8 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __72__HDCloudSyncDiagnosticOperation__reportCloudSyncKeyValuesWithDatabase___block_invoke;
    v15[3] = &unk_24E0D87A0;
    v15[4] = self;
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x22078C350](v15);
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __72__HDCloudSyncDiagnosticOperation__reportCloudSyncKeyValuesWithDatabase___block_invoke_2;
    v14[3] = &unk_24E0D87A0;
    v14[4] = self;
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x22078C350](v14);
    -[HDDiagnosticOperation appendNewline](self, "appendNewline");
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE40D18]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const __CFString *, void *))v9)[2](v9, CFSTR("Last push forward progress"), v11);

    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE40D10]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const __CFString *, void *))v10)[2](v10, CFSTR("Has pull applied change"), v12);

    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE40830]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const __CFString *, void *))v9)[2](v9, CFSTR("Restore complete date"), v13);

  }
  else
  {
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("ERROR: Failed to get key value pairs for domain \"%@\": %@"), v4, v6);
  }

}

void __72__HDCloudSyncDiagnosticOperation__reportCloudSyncKeyValuesWithDatabase___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  v8 = v5;
  if (a3)
  {
    objc_msgSend(v4, "stringFromDate:", a3);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("%@: %@"), v8, v6);

    v7 = (void *)v6;
  }
  else
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("%@: %@"), v5, CFSTR("(null)"));
    v7 = v8;
  }

}

void __72__HDCloudSyncDiagnosticOperation__reportCloudSyncKeyValuesWithDatabase___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  v8 = v5;
  if (a3)
  {
    objc_msgSend(a3, "description");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("%@: %@"), v8, v6);

    v7 = (void *)v6;
  }
  else
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("%@: %@"), v5, CFSTR("(null)"));
    v7 = v8;
  }

}

- (void)_reportCloudSyncErrors
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)CFPreferencesCopyValue((CFStringRef)*MEMORY[0x24BE408D8], (CFStringRef)*MEMORY[0x24BDD4650], (CFStringRef)*MEMORY[0x24BDBD578], (CFStringRef)*MEMORY[0x24BDBD570]);
  if (objc_msgSend(v3, "count"))
  {
    -[HDDiagnosticOperation appendNewline](self, "appendNewline");
    -[HDDiagnosticOperation appendString:](self, "appendString:", CFSTR("Recent Periodic Sync Errors:"));
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("\t%@"), *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)_reportCloudSyncStoreDetailsWithDatabase:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  char v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BE40E18], "predicateWithProperty:equalToValue:", *MEMORY[0x24BE40968], &unk_24E0DD270);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE40C80], "queryWithDatabase:predicate:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BE40970];
  v15[0] = *MEMORY[0x24BE40D48];
  v15[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __75__HDCloudSyncDiagnosticOperation__reportCloudSyncStoreDetailsWithDatabase___block_invoke;
  v12[3] = &unk_24E0D87C8;
  v12[4] = self;
  v9 = v4;
  v13 = v9;
  v10 = objc_msgSend(v6, "enumerateProperties:error:enumerationHandler:", v8, &v14, v12);
  v11 = v14;

  if ((v10 & 1) == 0)
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("ERROR: Failed to query for Cloud Sync stores: %@"), v11);

}

uint64_t __75__HDCloudSyncDiagnosticOperation__reportCloudSyncStoreDetailsWithDatabase___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;

  v5 = HDSQLiteColumnAsInt64();
  MEMORY[0x22078BFA8](a3, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_reportCloudSyncStoreDetailsWithSyncProvenance:storeUUID:database:", v5, v6, *(_QWORD *)(a1 + 40));

  return 1;
}

- (void)_reportCloudSyncStoreDetailsWithSyncProvenance:(int64_t)a3 storeUUID:(id)a4 database:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  __CFString *v29;
  void *v30;
  __CFString *v31;
  uint64_t v32;
  __CFString *v33;
  void *v34;
  id v35;

  v8 = a4;
  v9 = (void *)MEMORY[0x24BE40A60];
  v35 = 0;
  v10 = a5;
  objc_msgSend(v9, "persistedStateForStoreUUID:database:error:", v8, v10, &v35);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v35;
  if (!v11)
  {
    objc_msgSend(v8, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("ERROR: Failed to get persistent state for Cloud Sync store %@: %@"), v13, v12);

  }
  -[HDDiagnosticOperation appendNewline](self, "appendNewline");
  -[HDDiagnosticOperation appendNewline](self, "appendNewline");
  -[HDDiagnosticOperation appendStrongSeparator](self, "appendStrongSeparator");
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD4028]), "initWithColumnTitles:", 0);
  objc_msgSend(v8, "UUIDString");
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  __100__HDCloudSyncDiagnosticOperation__reportCloudSyncStoreDetailsWithSyncProvenance_storeUUID_database___block_invoke((uint64_t)v15, v14, CFSTR("Cloud Sync Store:"), v15);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "description");
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  __100__HDCloudSyncDiagnosticOperation__reportCloudSyncStoreDetailsWithSyncProvenance_storeUUID_database___block_invoke((uint64_t)v17, v14, CFSTR("Sync Provenance:"), v17);

  objc_msgSend(v11, "ownerIdentifier");
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  __100__HDCloudSyncDiagnosticOperation__reportCloudSyncStoreDetailsWithSyncProvenance_storeUUID_database___block_invoke((uint64_t)v18, v14, CFSTR("Owner Identifier:"), v18);

  objc_msgSend(v11, "syncIdentity");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "description");
  v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  __100__HDCloudSyncDiagnosticOperation__reportCloudSyncStoreDetailsWithSyncProvenance_storeUUID_database___block_invoke((uint64_t)v20, v14, CFSTR("Sync Identity:"), v20);

  objc_msgSend(v11, "containerIdentifier");
  v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  __100__HDCloudSyncDiagnosticOperation__reportCloudSyncStoreDetailsWithSyncProvenance_storeUUID_database___block_invoke((uint64_t)v21, v14, CFSTR("Container Identifier:"), v21);

  objc_msgSend(v11, "serverChangeToken");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "description");
  v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  __100__HDCloudSyncDiagnosticOperation__reportCloudSyncStoreDetailsWithSyncProvenance_storeUUID_database___block_invoke((uint64_t)v23, v14, CFSTR("Change Token:"), v23);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v11, "baselineEpoch"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "description");
  v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  __100__HDCloudSyncDiagnosticOperation__reportCloudSyncStoreDetailsWithSyncProvenance_storeUUID_database___block_invoke((uint64_t)v25, v14, CFSTR("Baseline Epoch:"), v25);

  objc_msgSend(v11, "rebaseDeadline");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDiagnosticOperation stringFromDate:](self, "stringFromDate:", v26);
  v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
  __100__HDCloudSyncDiagnosticOperation__reportCloudSyncStoreDetailsWithSyncProvenance_storeUUID_database___block_invoke((uint64_t)v27, v14, CFSTR("Rebase Deadline:"), v27);

  objc_msgSend(v11, "lastSyncDate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDiagnosticOperation stringFromDate:](self, "stringFromDate:", v28);
  v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
  __100__HDCloudSyncDiagnosticOperation__reportCloudSyncStoreDetailsWithSyncProvenance_storeUUID_database___block_invoke((uint64_t)v29, v14, CFSTR("Last Sync Date:"), v29);

  objc_msgSend(v11, "lastCheckDate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDiagnosticOperation stringFromDate:](self, "stringFromDate:", v30);
  v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
  __100__HDCloudSyncDiagnosticOperation__reportCloudSyncStoreDetailsWithSyncProvenance_storeUUID_database___block_invoke((uint64_t)v31, v14, CFSTR("Last Check Date:"), v31);

  v32 = objc_msgSend(v11, "hasEncounteredGapInCurrentEpoch");
  if ((_DWORD)v32)
    v33 = CFSTR("YES");
  else
    v33 = CFSTR("NO");
  __100__HDCloudSyncDiagnosticOperation__reportCloudSyncStoreDetailsWithSyncProvenance_storeUUID_database___block_invoke(v32, v14, CFSTR("Has Encountered Gap:"), v33);
  objc_msgSend(v14, "formattedTable");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDiagnosticOperation appendString:](self, "appendString:", v34);

  -[HDDiagnosticOperation appendNewline](self, "appendNewline");
  -[HDDiagnosticOperation appendNewline](self, "appendNewline");
  objc_msgSend(MEMORY[0x24BE40C68], "hde_reportSyncAnchorsForSyncProvenance:diagnosticOperation:database:", a3, self, v10);

}

void __100__HDCloudSyncDiagnosticOperation__reportCloudSyncStoreDetailsWithSyncProvenance_storeUUID_database___block_invoke(uint64_t a1, void *a2, void *a3, __CFString *a4)
{
  __CFString *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v7 = CFSTR("(null)");
  if (a4)
    v7 = a4;
  v14[0] = a3;
  v14[1] = v7;
  v8 = (void *)MEMORY[0x24BDBCE30];
  v9 = v7;
  v10 = a4;
  v11 = a3;
  v12 = a2;
  objc_msgSend(v8, "arrayWithObjects:count:", v14, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "appendRow:", v13);
}

- (void)_reportCloudSyncDescriptionWithHealthStore:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *, uint64_t);
  void *v12;
  HDCloudSyncDiagnosticOperation *v13;
  NSObject *v14;

  v4 = a3;
  v5 = dispatch_semaphore_create(0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD39E8]), "initWithHealthStore:", v4);

  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __77__HDCloudSyncDiagnosticOperation__reportCloudSyncDescriptionWithHealthStore___block_invoke_2;
  v12 = &unk_24E0D8830;
  v13 = self;
  v7 = v5;
  v14 = v7;
  objc_msgSend(v6, "fetchCloudDescriptionWithProgress:completion:", &__block_literal_global_284, &v9);
  v8 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v7, v8))
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("ERROR: Timed out attempting collect Cloud Sync description"), v9, v10, v11, v12, v13);

}

void __77__HDCloudSyncDiagnosticOperation__reportCloudSyncDescriptionWithHealthStore___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = *(void **)(a1 + 32);
  if (v8)
  {
    objc_msgSend(v9, "appendNewline");
    objc_msgSend(*(id *)(a1 + 32), "appendNewline");
    objc_msgSend(*(id *)(a1 + 32), "appendStrongSeparator");
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("Cloud Description:"));
    objc_msgSend(*(id *)(a1 + 32), "appendString:", v7);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v14);
          objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
          v16 = *(void **)(a1 + 32);
          objc_msgSend(v15, "fullDescription");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "appendString:", v17);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

  }
  else
  {
    objc_msgSend(v9, "log:", CFSTR("ERROR: Failed to get Cloud Sync description: %@"), a4);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

@end
