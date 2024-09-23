@implementation HDNanoSyncDiagnosticOperation

- (id)nanoSyncDatabaseURL
{
  void *v2;
  void *v3;
  void *v4;

  -[HDDiagnosticOperation healthDirectoryURL](self, "healthDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("NanoSync"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.private.alloy.health.sync.db"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)reportFilename
{
  return CFSTR("HealthNanoSync.txt");
}

- (void)run
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  -[HDNanoSyncDiagnosticOperation _collectNanoSyncMessageDatabase](self, "_collectNanoSyncMessageDatabase");
  -[HDNanoSyncDiagnosticOperation _sortedPairedDevices](self, "_sortedPairedDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v32;
    v9 = *MEMORY[0x24BE6B3A8];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v11, "valueForProperty:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v5, "count"))
  {
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("Found %lu paired devices"), objc_msgSend(v5, "count"));
    -[HDNanoSyncDiagnosticOperation _reportSummaryWithDevices:](self, "_reportSummaryWithDevices:", v5);
    -[HDNanoSyncDiagnosticOperation _reportQuickSwitchSummaryWithDevicesByPairingID:](self, "_reportQuickSwitchSummaryWithDevicesByPairingID:", v4);
    -[HDDiagnosticOperation healthDirectoryURL](self, "healthDirectoryURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URLByAppendingPathComponent:isDirectory:", CFSTR("healthdb.sqlite"), 0);
    v14 = objc_claimAutoreleasedReturnValue();

    v26 = (void *)v14;
    -[HDDiagnosticOperation openReadOnlyDatabaseAtURL:](self, "openReadOnlyDatabaseAtURL:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDNanoSyncDiagnosticOperation nanoSyncDatabaseURL](self, "nanoSyncDatabaseURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDiagnosticOperation openReadOnlyDatabaseAtURL:](self, "openReadOnlyDatabaseAtURL:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v18 = v5;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v28 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j);
          -[HDDiagnosticOperation appendNewline](self, "appendNewline");
          -[HDDiagnosticOperation appendStrongSeparator](self, "appendStrongSeparator");
          if (v15)
          {
            -[HDNanoSyncDiagnosticOperation _reportDetailsForDevice:database:](self, "_reportDetailsForDevice:database:", v23, v15);
            v24 = objc_claimAutoreleasedReturnValue();
            v25 = (void *)v24;
            if (v17 && v24)
              -[HDNanoSyncDiagnosticOperation _reportIDSSummaryForDeviceIdentifier:database:](self, "_reportIDSSummaryForDeviceIdentifier:database:", v24, v17);
          }
          else
          {
            v25 = 0;
          }

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v20);
    }

    objc_msgSend(v15, "close");
    objc_msgSend(v17, "close");

  }
  else
  {
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("No paired devices"));
  }

}

- (void)_collectNanoSyncMessageDatabase
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;

  -[HDNanoSyncDiagnosticOperation nanoSyncDatabaseURL](self, "nanoSyncDatabaseURL");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BDD1580]);
  objc_msgSend(v10, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(v10, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v8 = CFSTR("No NanoSync message database present at %@; skipping sync collection and analysis.");
    goto LABEL_5;
  }
  -[HDDiagnosticOperation log:](self, "log:", CFSTR("Collecting and analyzing NanoSync message database..."));
  -[HDDiagnosticOperation attachmentDirectoryURL](self, "attachmentDirectoryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.private.alloy.health.sync.db"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[HDDiagnosticOperation copyDatabaseFromURL:toURL:](self, "copyDatabaseFromURL:toURL:", v10, v7))
  {
    v8 = CFSTR("Failed to collect NanoSync message database.");
LABEL_5:
    -[HDDiagnosticOperation log:](self, "log:", v8, v9);
  }

}

- (id)_sortedPairedDevices
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getSetupCompletedDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __53__HDNanoSyncDiagnosticOperation__sortedPairedDevices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v4 = *MEMORY[0x24BE6B338];
  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "valueForProperty:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForProperty:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BE6B368];
  objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BE6B368]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "valueForProperty:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isEqualToNumber:", v8))
  {
    v12 = v11;
    v13 = v10;
  }
  else
  {
    v12 = v8;
    v13 = v7;
  }
  v14 = objc_msgSend(v12, "compare:", v13);

  return v14;
}

- (void)_reportSummaryWithDevices:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  uint64_t v21;
  id obj;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("%lu Paired Devices:"), objc_msgSend(v4, "count"));
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v5)
  {
    v6 = v5;
    v29 = *(_QWORD *)v31;
    v28 = *MEMORY[0x24BE6B338];
    v27 = *MEMORY[0x24BE6B3E0];
    v26 = *MEMORY[0x24BE6B3B0];
    v24 = *MEMORY[0x24BE6B368];
    v25 = *MEMORY[0x24BE6B398];
    v23 = *MEMORY[0x24BE6B370];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v31 != v29)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v8, "valueForProperty:", v28);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "BOOLValue");

        objc_msgSend(v8, "valueForProperty:", v27);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "valueForProperty:", v26);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "valueForProperty:", v25);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "valueForProperty:", v24);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDDiagnosticOperation stringFromDate:](self, "stringFromDate:", v14);
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "valueForProperty:", v23);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDDiagnosticOperation stringFromDate:](self, "stringFromDate:", v16);
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(active since %@)"), v15, v21);
        }
        else
        {
          v18 = &stru_24E0DA908;
          if (v15)
            v19 = v15;
          else
            v19 = &stru_24E0DA908;
          if (v17)
            v18 = v17;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(last active %@ - %@)"), v19, v18);
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("\t\"%@\" %@ %@ %@"), v13, v12, v11, v20);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v6);
  }

}

- (void)_reportQuickSwitchSummaryWithDevicesByPairingID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  _QWORD *v9;
  _QWORD v10[3];
  char v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 0;
  objc_msgSend(v5, "switchIndex");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __81__HDNanoSyncDiagnosticOperation__reportQuickSwitchSummaryWithDevicesByPairingID___block_invoke;
  v7[3] = &unk_24E0D8BC0;
  v9 = v10;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "getSwitchEventsFromIndex:inlineCallback:", 0, v7);

  _Block_object_dispose(v10, 8);
}

void __81__HDNanoSyncDiagnosticOperation__reportQuickSwitchSummaryWithDevicesByPairingID___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\nQuick Switch Events:"));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "valueForProperty:", *MEMORY[0x24BE6B398]);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = CFSTR("Unknown");
  }
  objc_msgSend(*(id *)(a1 + 32), "stringFromDate:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(a1 + 32);
  objc_msgSend(v6, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendFormat:", CFSTR("\tSwitched to %@ \"%@\" at %@"), v12, v9, v10);

}

- (id)_reportDetailsForDevice:(id)a3 database:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  const char *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  int v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  id v45;
  void *v46;
  int v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[4];

  v57[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = *MEMORY[0x24BE6B3A8];
  v8 = a3;
  objc_msgSend(v8, "valueForProperty:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForProperty:", *MEMORY[0x24BE6B338]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v10, "BOOLValue");

  objc_msgSend(v8, "valueForProperty:", *MEMORY[0x24BE6B3E0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForProperty:", *MEMORY[0x24BE6B3B0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForProperty:", *MEMORY[0x24BE6B398]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForProperty:", *MEMORY[0x24BE6B368]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDiagnosticOperation stringFromDate:](self, "stringFromDate:", v14);
  v15 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "valueForProperty:", *MEMORY[0x24BE6B370]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDiagnosticOperation stringFromDate:](self, "stringFromDate:", v16);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "valueForProperty:", *MEMORY[0x24BE6B3A0]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDDiagnosticOperation stringFromDate:](self, "stringFromDate:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = 0;
  v48 = v6;
  objc_msgSend(MEMORY[0x24BE40B28], "nanoPairingEntityWithRegistryUUID:database:error:", v9, v6, &v51);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v51;
  v21 = v20;
  v49 = (void *)v15;
  if (v19)
  {
    v45 = v20;
    v22 = " (inactive)";
    if (v47)
      v22 = "";
    v46 = v12;
    if (v47)
      v23 = CFSTR("    Active:");
    else
      v23 = CFSTR("    Was Active:");
    -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("\"%@\" %@ %@%s"), v13, v12, v11, v22);
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD4028]), "initWithColumnTitles:", 0);
    v57[0] = v23;
    v25 = (void *)v15;
    if ((v47 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ - %@"), v15, v50);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v57[1] = v25;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "appendRow:", v26);

    v27 = v48;
    if ((v47 & 1) == 0)

    v56[0] = CFSTR("    Pairing ID:");
    objc_msgSend(v9, "UUIDString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v56[1] = v28;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "appendRow:", v29);

    v55[0] = CFSTR("    IDS ID:");
    objc_msgSend(v19, "deviceIdentifier");
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)v30;
    if (v30)
      v32 = (const __CFString *)v30;
    else
      v32 = CFSTR("(null)");
    v55[1] = v32;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "appendRow:", v33);

    v54[0] = CFSTR("    Paired:");
    v54[1] = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "appendRow:", v34);

    v53[0] = CFSTR("    Source:");
    objc_msgSend(v19, "defaultSourceBundleIdentifier");
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = (void *)v35;
    if (v35)
      v37 = (const __CFString *)v35;
    else
      v37 = CFSTR("(null)");
    v53[1] = v37;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "appendRow:", v38);

    v52[0] = CFSTR("    Restore Complete:");
    v39 = objc_msgSend(v19, "isRestoreComplete");
    v40 = CFSTR("NO");
    if (v39)
      v40 = CFSTR("YES");
    v52[1] = v40;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 2);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "appendRow:", v41);

    -[HDDiagnosticOperation appendNewline](self, "appendNewline");
    objc_msgSend(v24, "formattedTable");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDiagnosticOperation appendString:](self, "appendString:", v42);

    -[HDDiagnosticOperation appendNewline](self, "appendNewline");
    -[HDDiagnosticOperation appendNewline](self, "appendNewline");
    objc_msgSend(MEMORY[0x24BE40C68], "hde_reportSyncAnchorsForSyncProvenance:diagnosticOperation:database:", objc_msgSend(v19, "syncProvenance"), self, v48);
    objc_msgSend(v19, "deviceIdentifier");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v46;
    v21 = v45;
  }
  else
  {
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("Failed to find sync store for NRDevice %@: %@"), v9, v20);
    v43 = 0;
    v27 = v48;
  }

  return v43;
}

- (void)_reportIDSSummaryForDeviceIdentifier:(id)a3 database:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  id v16;
  id v17;
  void (**v18)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;

  v6 = a3;
  v7 = a4;
  -[HDDiagnosticOperation appendNewline](self, "appendNewline");
  -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("IDS Message Statistics (last 7 days):"));
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hk_dateBySubtractingDays:fromDate:", 7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __79__HDNanoSyncDiagnosticOperation__reportIDSSummaryForDeviceIdentifier_database___block_invoke;
  v22[3] = &unk_24E0D8BE8;
  v22[4] = self;
  v12 = v6;
  v23 = v12;
  v24 = v10;
  v13 = v7;
  v25 = v13;
  v14 = v10;
  v15 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x22078C350](v22);
  ((void (**)(_QWORD, const __CFString *, const __CFString *))v15)[2](v15, CFSTR("received"), CFSTR("outgoing = 0"));
  ((void (**)(_QWORD, const __CFString *, const __CFString *))v15)[2](v15, CFSTR("sent"), CFSTR("outgoing = 1 AND send_timestamp IS NOT NULL"));
  ((void (**)(_QWORD, const __CFString *, const __CFString *))v15)[2](v15, CFSTR("pending"), CFSTR("outgoing = 1 AND send_timestamp IS NULL AND error_code IS NULL"));
  ((void (**)(_QWORD, const __CFString *, const __CFString *))v15)[2](v15, CFSTR("failed"), CFSTR("outgoing = 1 AND error_code IS NOT NULL"));
  -[HDDiagnosticOperation appendNewline](self, "appendNewline");
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __79__HDNanoSyncDiagnosticOperation__reportIDSSummaryForDeviceIdentifier_database___block_invoke_2;
  v19[3] = &unk_24E0D8C10;
  v19[4] = self;
  v20 = v12;
  v21 = v13;
  v16 = v13;
  v17 = v12;
  v18 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x22078C350](v19);
  ((void (**)(_QWORD, const __CFString *, const __CFString *, const __CFString *))v18)[2](v18, CFSTR("Last message received"), CFSTR("timestamp"), CFSTR("outgoing = 0"));
  ((void (**)(_QWORD, const __CFString *, const __CFString *, const __CFString *))v18)[2](v18, CFSTR("Last message sent"), CFSTR("send_timestamp"), CFSTR("outgoing = 1 AND send_timestamp IS NOT NULL"));
  ((void (**)(_QWORD, const __CFString *, const __CFString *, const __CFString *))v18)[2](v18, CFSTR("Last message failed"), CFSTR("error_timestamp"), CFSTR("outgoing = 1 AND error_code IS NOT NULL"));
  -[HDDiagnosticOperation appendNewline](self, "appendNewline");
  -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("Recent IDS Errors:"));
  -[HDNanoSyncDiagnosticOperation _reportMostRecentMessageErrorsWithDeviceIdentifier:database:](self, "_reportMostRecentMessageErrorsWithDeviceIdentifier:database:", v17, v16);

}

uint64_t __79__HDNanoSyncDiagnosticOperation__reportIDSSummaryForDeviceIdentifier_database___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_countOfMessagesForDeviceIdentifier:description:predicateSQL:date:database:", *(_QWORD *)(a1 + 40), a2, a3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __79__HDNanoSyncDiagnosticOperation__reportIDSSummaryForDeviceIdentifier_database___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reportMostRecentMessageDateWithDeviceIdentifier:description:field:predicateSQL:database:", *(_QWORD *)(a1 + 40), a2, a3, a4, *(_QWORD *)(a1 + 48));
}

- (int64_t)_countOfMessagesForDeviceIdentifier:(id)a3 description:(id)a4 predicateSQL:(id)a5 date:(id)a6 database:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  int64_t v24;
  _QWORD v26[5];
  id v27;
  uint64_t *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT COUNT(*) FROM message_records WHERE device_id LIKE ? AND timestamp > ? AND %@"), v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v18 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __108__HDNanoSyncDiagnosticOperation__countOfMessagesForDeviceIdentifier_description_predicateSQL_date_database___block_invoke;
  v29[3] = &unk_24E0D8C38;
  v19 = v12;
  v30 = v19;
  v20 = v15;
  v31 = v20;
  v26[0] = v18;
  v26[1] = 3221225472;
  v26[2] = __108__HDNanoSyncDiagnosticOperation__countOfMessagesForDeviceIdentifier_description_predicateSQL_date_database___block_invoke_2;
  v26[3] = &unk_24E0D8C60;
  v28 = &v33;
  v26[4] = self;
  v21 = v13;
  v27 = v21;
  LOBYTE(v18) = objc_msgSend(v16, "executeSQL:error:bindingHandler:enumerationHandler:", v17, &v32, v29, v26);
  v22 = v32;
  v23 = v22;
  if ((v18 & 1) == 0)
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("Failed to count rows in table 'message_records': %@"), v22);
  v24 = v34[3];

  _Block_object_dispose(&v33, 8);
  return v24;
}

uint64_t __108__HDNanoSyncDiagnosticOperation__countOfMessagesForDeviceIdentifier_description_predicateSQL_date_database___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  double v4;

  HDSQLiteBindStringToStatement();
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
  return sqlite3_bind_double(a2, 2, v4);
}

uint64_t __108__HDNanoSyncDiagnosticOperation__countOfMessagesForDeviceIdentifier_description_predicateSQL_date_database___block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = HDSQLiteColumnAsInt64();
  if (*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= 1)
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\t%lld %@"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), *(_QWORD *)(a1 + 40));
  return 0;
}

- (void)_reportMostRecentMessageDateWithDeviceIdentifier:(id)a3 description:(id)a4 field:(id)a5 predicateSQL:(id)a6 database:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void *)MEMORY[0x24BDD17C8];
  v16 = a7;
  objc_msgSend(v15, "stringWithFormat:", CFSTR("SELECT %@ FROM message_records WHERE device_id LIKE ? AND %@ ORDER BY %@ DESC LIMIT 1"), v14, a6, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v18 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __122__HDNanoSyncDiagnosticOperation__reportMostRecentMessageDateWithDeviceIdentifier_description_field_predicateSQL_database___block_invoke;
  v25[3] = &unk_24E0D8C88;
  v19 = v12;
  v26 = v19;
  v23[0] = v18;
  v23[1] = 3221225472;
  v23[2] = __122__HDNanoSyncDiagnosticOperation__reportMostRecentMessageDateWithDeviceIdentifier_description_field_predicateSQL_database___block_invoke_2;
  v23[3] = &unk_24E0D8880;
  v23[4] = self;
  v20 = v13;
  v24 = v20;
  LOBYTE(v12) = objc_msgSend(v16, "executeSQL:error:bindingHandler:enumerationHandler:", v17, &v27, v25, v23);

  v21 = v27;
  v22 = v21;
  if ((v12 & 1) == 0)
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("Failed to get latest %@ value in table 'message_records': %@"), v14, v21);

}

uint64_t __122__HDNanoSyncDiagnosticOperation__reportMostRecentMessageDateWithDeviceIdentifier_description_field_predicateSQL_database___block_invoke()
{
  return HDSQLiteBindStringToStatement();
}

uint64_t __122__HDNanoSyncDiagnosticOperation__reportMostRecentMessageDateWithDeviceIdentifier_description_field_predicateSQL_database___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  MEMORY[0x22078BF78](a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v4, "stringFromDate:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("\t%@ %@"), v5, v6);

  }
  return 0;
}

- (void)_reportMostRecentMessageErrorsWithDeviceIdentifier:(id)a3 database:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v14 = 0;
  v7 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __93__HDNanoSyncDiagnosticOperation__reportMostRecentMessageErrorsWithDeviceIdentifier_database___block_invoke;
  v12[3] = &unk_24E0D8C88;
  v8 = v6;
  v13 = v8;
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __93__HDNanoSyncDiagnosticOperation__reportMostRecentMessageErrorsWithDeviceIdentifier_database___block_invoke_2;
  v11[3] = &unk_24E0D8858;
  v11[4] = self;
  LOBYTE(v7) = objc_msgSend(a4, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT uuid, timestamp, error_domain, error_code FROM message_records WHERE device_id LIKE ? AND error_code IS NOT NULL ORDER BY error_timestamp DESC LIMIT 5"), &v14, v12, v11);
  v9 = v14;
  v10 = v9;
  if ((v7 & 1) == 0)
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("Failed to get latest errors in table 'message_records': %@"), v9);

}

uint64_t __93__HDNanoSyncDiagnosticOperation__reportMostRecentMessageErrorsWithDeviceIdentifier_database___block_invoke()
{
  return HDSQLiteBindStringToStatement();
}

uint64_t __93__HDNanoSyncDiagnosticOperation__reportMostRecentMessageErrorsWithDeviceIdentifier_database___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  MEMORY[0x22078BF9C](a2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x22078BF78](a2, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x22078BF9C](a2, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HDSQLiteColumnAsInt64();
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v8, "stringFromDate:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendFormat:", CFSTR("\t%@ %@ code: %lld (sent %@)"), v4, v6, v7, v9);

  return 0;
}

@end
