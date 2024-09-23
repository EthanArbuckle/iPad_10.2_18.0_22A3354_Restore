@implementation HDOntologyDiagnosticOperation

- (id)reportFilename
{
  return CFSTR("Ontology.txt");
}

- (void)run
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[HDDiagnosticOperation log:](self, "log:", CFSTR("Analyzing ontology database...\n"));
  v9 = objc_alloc_init(MEMORY[0x24BDD3C40]);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3DF0]), "initWithHealthStore:", v9);
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "supportsOntology");
  HKStringFromBool();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("Supports Ontology: %@"), v5);

  objc_msgSend(v4, "supportsOntologyDatabaseUpdates");
  HKStringFromBool();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("Supports Ontology Database Updates: %@"), v6);

  objc_msgSend(v4, "features");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shardedOntology");
  HKStringFromBool();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("Sharded Ontology Enabled: %@"), v8);

  -[HDOntologyDiagnosticOperation _reportLocaleAndRegion](self, "_reportLocaleAndRegion");
  -[HDDiagnosticOperation appendNewline](self, "appendNewline");
  -[HDOntologyDiagnosticOperation _reportOntologyHostURLWithOntologyStore:](self, "_reportOntologyHostURLWithOntologyStore:", v3);
  -[HDDiagnosticOperation appendNewline](self, "appendNewline");
  -[HDDiagnosticOperation appendStrongSeparator](self, "appendStrongSeparator");
  -[HDDiagnosticOperation appendNewline](self, "appendNewline");
  -[HDOntologyDiagnosticOperation _reportForOntologyDatabase](self, "_reportForOntologyDatabase");
  -[HDOntologyDiagnosticOperation _reportForOntologyFeaturesWithOntologyStore:](self, "_reportForOntologyFeaturesWithOntologyStore:", v3);
  -[HDOntologyDiagnosticOperation _reportForOntologyKeyValueDomains](self, "_reportForOntologyKeyValueDomains");
  -[HDOntologyDiagnosticOperation _reportForOntologyUserDefaultsWithHealthStore:](self, "_reportForOntologyUserDefaultsWithHealthStore:", v9);
  -[HDOntologyDiagnosticOperation _reportUserDomainConcepts](self, "_reportUserDomainConcepts");

}

- (void)_reportLocaleAndRegion
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("Current Locale: %@"), v3);

  objc_msgSend(v6, "languageCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("Current Language: %@"), v4);

  objc_msgSend(v6, "countryCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("Current Country/Region: %@"), v5);

}

- (void)_reportOntologyHostURLWithOntologyStore:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  _QWORD v8[4];
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v5 = dispatch_semaphore_create(0);
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  v16 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __73__HDOntologyDiagnosticOperation__reportOntologyHostURLWithOntologyStore___block_invoke;
  v8[3] = &unk_24E0D8A50;
  v10 = &v11;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "ontologyServerURLWithCompletion:", v8);
  v7 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v6, v7))
    -[HDOntologyDiagnosticOperation _logAndAndAppendFormat:](self, "_logAndAndAppendFormat:", CFSTR("Timed out attempting to get the ontology host URL"));
  -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("Ontology Host URL: %@"), v12[5]);
  -[HDOntologyDiagnosticOperation _reportNetworkReachabilityForEnvironment:](self, "_reportNetworkReachabilityForEnvironment:", v12[5]);

  _Block_object_dispose(&v11, 8);
}

intptr_t __73__HDOntologyDiagnosticOperation__reportOntologyHostURLWithOntologyStore___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "absoluteString");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_reportForOntologyDatabase
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[HDDiagnosticOperation healthDirectoryURL](self, "healthDirectoryURL");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", CFSTR("ontology"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("HealthOntology.db"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("Ontology Database %@"), v5);

  -[HDDiagnosticOperation reportStatsForDatabaseAtURL:](self, "reportStatsForDatabaseAtURL:", v4);
  -[HDDiagnosticOperation appendNewline](self, "appendNewline");
  -[HDDiagnosticOperation verifyPermissionsForFileAtURL:](self, "verifyPermissionsForFileAtURL:", v4);
  -[HDDiagnosticOperation openReadOnlyDatabaseAtURL:](self, "openReadOnlyDatabaseAtURL:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[HDOntologyDiagnosticOperation _reportForOntologyDatabase:](self, "_reportForOntologyDatabase:", v6);
  }
  else
  {
    objc_msgSend(v4, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("Unable to open %@ \n"), v7);

  }
  objc_msgSend(v6, "close");

}

- (void)_reportForOntologyDatabase:(id)a3
{
  id v4;

  v4 = a3;
  -[HDOntologyDiagnosticOperation _reportBasicChecksForDatabase:](self, "_reportBasicChecksForDatabase:", v4);
  -[HDOntologyDiagnosticOperation _reportShardRegistryForDatabase:](self, "_reportShardRegistryForDatabase:", v4);
  -[HDOntologyDiagnosticOperation _reportElementCountsBySlotForDatabase:](self, "_reportElementCountsBySlotForDatabase:", v4);
  -[HDOntologyDiagnosticOperation _reportOntologyMetadataForDatabase:](self, "_reportOntologyMetadataForDatabase:", v4);

}

- (void)_reportBasicChecksForDatabase:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HDDiagnosticOperation checkSchemaVersionForDatabase:currentSchema:futureSchema:](self, "checkSchemaVersionForDatabase:currentSchema:futureSchema:", v4, 8, 10001);
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v6, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDiagnosticOperation reportCountsForDatabase:entityClasses:](self, "reportCountsForDatabase:entityClasses:", v4, v5, v6, v7);

  -[HDDiagnosticOperation appendNewline](self, "appendNewline");
  -[HDDiagnosticOperation appendStrongSeparator](self, "appendStrongSeparator");
  -[HDDiagnosticOperation appendNewline](self, "appendNewline");
}

- (void)_reportShardRegistryForDatabase:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  char v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD4028]), "initWithColumnTitles:", &unk_24E0DD470);
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v7 = (void *)MEMORY[0x24BE40B58];
  v24 = 0;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __65__HDOntologyDiagnosticOperation__reportShardRegistryForDatabase___block_invoke;
  v22[3] = &unk_24E0D8A78;
  v8 = v6;
  v23 = v8;
  v9 = objc_msgSend(v7, "enumerateEntriesWithPredicate:orderingTerms:database:error:enumerationHandler:", 0, 0, v4, &v24, v22);
  v10 = v24;
  v11 = v10;
  if ((v9 & 1) != 0)
  {
    objc_msgSend(v8, "sortUsingComparator:", &__block_literal_global_0);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend((id)objc_opt_class(), "_appendEntry:tableFormatter:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v16++), v5);
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
      }
      while (v14);
    }

    -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("Ontology Shard Registry"));
    -[HDDiagnosticOperation appendSeparator](self, "appendSeparator");
    objc_msgSend(v5, "formattedTable");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDiagnosticOperation appendString:](self, "appendString:", v17);

    -[HDDiagnosticOperation appendNewline](self, "appendNewline");
    -[HDDiagnosticOperation appendStrongSeparator](self, "appendStrongSeparator");
    -[HDDiagnosticOperation appendNewline](self, "appendNewline");
  }
  else
  {
    -[HDOntologyDiagnosticOperation _logAndAndAppendFormat:](self, "_logAndAndAppendFormat:", CFSTR("Failed to enumerate shard registry entries: %@"), v10);
  }

}

uint64_t __65__HDOntologyDiagnosticOperation__reportShardRegistryForDatabase___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

uint64_t __65__HDOntologyDiagnosticOperation__reportShardRegistryForDatabase___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);

  if (!v8)
  {
    objc_msgSend(v4, "schemaType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "schemaType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "compare:", v10);

    if (!v8)
    {
      objc_msgSend(v4, "schemaVersion");
      objc_msgSend(v5, "schemaVersion");
      v8 = HKCompareIntegers();
    }
  }

  return v8;
}

+ (void)_appendEntry:(id)a3 tableFormatter:(id)a4
{
  id v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _QWORD v62[29];

  v62[27] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v46 = a4;
  objc_msgSend(v5, "identifier");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v61;
  objc_msgSend(v5, "schemaType");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = v60;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "schemaVersion"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "stringValue");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v62[2] = v58;
  objc_msgSend(v5, "settings");
  HKStringFromOntologyShardSettings();
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v62[3] = v57;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "slot"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "stringValue");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v62[4] = v55;
  objc_msgSend(v5, "desiredState");
  HKStringFromOntologyShardState();
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v62[5] = v54;
  objc_msgSend(v5, "desiredStateDate");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  HKDiagnosticStringFromDate();
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v62[6] = v52;
  objc_msgSend(v5, "currentVersion");
  HKStringFromOntologyShardVersion();
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v62[7] = v51;
  objc_msgSend(v5, "currentVersionDate");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  HKDiagnosticStringFromDate();
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v62[8] = v49;
  objc_msgSend(v5, "currentRegion");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v62[9] = v48;
  objc_msgSend(v5, "currentRegionDate");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  HKDiagnosticStringFromDate();
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v62[10] = v45;
  objc_msgSend(v5, "currentLocale");
  v6 = objc_claimAutoreleasedReturnValue();
  v44 = (void *)v6;
  if (v6)
    v7 = (const __CFString *)v6;
  else
    v7 = CFSTR("nil");
  v62[11] = v7;
  objc_msgSend(v5, "currentLocaleDate");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  HKDiagnosticStringFromDate();
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v62[12] = v42;
  objc_msgSend(v5, "availableVersion");
  HKStringFromOntologyShardVersion();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v62[13] = v41;
  objc_msgSend(v5, "availableVersionDate");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  HKDiagnosticStringFromDate();
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v62[14] = v39;
  objc_msgSend(v5, "availableRegion");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v62[15] = v38;
  objc_msgSend(v5, "availableRegionDate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  HKDiagnosticStringFromDate();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v62[16] = v36;
  objc_msgSend(v5, "availableLocale");
  v8 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)v8;
  if (v8)
    v9 = (const __CFString *)v8;
  else
    v9 = CFSTR("nil");
  v62[17] = v9;
  objc_msgSend(v5, "availableLocaleDate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  HKDiagnosticStringFromDate();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v62[18] = v33;
  objc_msgSend(v5, "availableURL");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "absoluteString");
  v10 = objc_claimAutoreleasedReturnValue();
  v31 = (void *)v10;
  if (v10)
    v11 = (const __CFString *)v10;
  else
    v11 = CFSTR("nil");
  v62[19] = v11;
  objc_msgSend(v5, "availableURLDate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  HKDiagnosticStringFromDate();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v62[20] = v29;
  objc_msgSend(v5, "availableChecksum");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = CFSTR("nil");
  v62[21] = v14;
  objc_msgSend(v5, "availableChecksumDate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  HKDiagnosticStringFromDate();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v62[22] = v27;
  v15 = objc_msgSend(v5, "availableSize");
  v16 = *MEMORY[0x24BDD32B8];
  v26 = v15;
  if (v15 == *MEMORY[0x24BDD32B8])
  {
    v17 = CFSTR("unkown");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "availableSize"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringValue");
    v17 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  v25 = (__CFString *)v17;
  v62[23] = v17;
  objc_msgSend(v5, "availableSizeDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  HKDiagnosticStringFromDate();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v62[24] = v19;
  objc_msgSend(v5, "availableState");
  HKStringFromOntologyShardState();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v62[25] = v20;
  objc_msgSend(v5, "availableStateDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  HKDiagnosticStringFromDate();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v62[26] = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v62, 27);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "appendRow:", v23);

  if (v26 != v16)
  {

  }
}

- (void)_reportElementCountsBySlotForDatabase:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HDOntologyDiagnosticOperation _countOfElementsPerSlotInDatabase:](self, "_countOfElementsPerSlotInDatabase:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HDOntologyDiagnosticOperation _expandResultsToIndividualSlots:](self, "_expandResultsToIndividualSlots:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDOntologyDiagnosticOperation _entriesForSlots:database:](self, "_entriesForSlots:database:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDOntologyDiagnosticOperation _reportElementCountsBySlot:entriesBySlot:](self, "_reportElementCountsBySlot:entriesBySlot:", v5, v7);
}

- (id)_countOfElementsPerSlotInDatabase:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v4 = (objc_class *)MEMORY[0x24BDBCED8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v16 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __67__HDOntologyDiagnosticOperation__countOfElementsPerSlotInDatabase___block_invoke;
  v14[3] = &unk_24E0D8858;
  v7 = v6;
  v15 = v7;
  v8 = objc_msgSend(v5, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT 'nodes', slots, COUNT(*) FROM nodes GROUP BY slots UNION ALL SELECT 'attributes', slots, COUNT(*) FROM attributes GROUP BY slots UNION ALL SELECT 'relationships', slots, COUNT(*) FROM relationships GROUP BY slots"), &v16, 0, v14);

  v9 = v16;
  v10 = v9;
  if ((v8 & 1) == 0)
    -[HDOntologyDiagnosticOperation _logAndAndAppendFormat:](self, "_logAndAndAppendFormat:", CFSTR("Failed to get count of elements per shard slot: %@"), v9);
  v11 = v15;
  v12 = v7;

  return v12;
}

uint64_t __67__HDOntologyDiagnosticOperation__countOfElementsPerSlotInDatabase___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  MEMORY[0x22078BF9C](a2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x22078BF90](a2, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x22078BF90](a2, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v5);
  }
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v4);

  return 1;
}

- (id)_expandResultsToIndividualSlots:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v5 = v3;
  v26 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v26)
  {
    v25 = *(_QWORD *)v38;
    v28 = v5;
    v29 = v4;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v38 != v25)
        {
          v7 = v6;
          objc_enumerationMutation(v5);
          v6 = v7;
        }
        v8 = 0;
        v27 = v6;
        v9 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v6);
        v30 = v9;
        do
        {
          if ((((unint64_t)objc_msgSend(v9, "unsignedLongLongValue", v25) >> v8) & 1) != 0)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v8);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "objectForKeyedSubscript:", v9);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "objectForKeyedSubscript:", v10);
            v12 = objc_claimAutoreleasedReturnValue();
            if (v12)
            {
              v13 = (void *)v12;
              v35 = 0u;
              v36 = 0u;
              v33 = 0u;
              v34 = 0u;
              v14 = objc_msgSend(&unk_24E0DD488, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
              if (v14)
              {
                v15 = v14;
                v31 = v10;
                v32 = v8;
                v16 = *(_QWORD *)v34;
                do
                {
                  for (i = 0; i != v15; ++i)
                  {
                    if (*(_QWORD *)v34 != v16)
                      objc_enumerationMutation(&unk_24E0DD488);
                    v18 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
                    v19 = (void *)MEMORY[0x24BDD16E0];
                    objc_msgSend(v13, "objectForKeyedSubscript:", v18);
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    v21 = objc_msgSend(v20, "integerValue");
                    objc_msgSend(v11, "objectForKeyedSubscript:", v18);
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v19, "numberWithInteger:", objc_msgSend(v22, "integerValue") + v21);
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v13, "setObject:forKeyedSubscript:", v23, v18);

                  }
                  v15 = objc_msgSend(&unk_24E0DD488, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
                }
                while (v15);
                v5 = v28;
                v4 = v29;
                v10 = v31;
                v8 = v32;
                v9 = v30;
              }
            }
            else
            {
              v13 = (void *)objc_msgSend(v11, "mutableCopy");
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v10);
            }

          }
          ++v8;
        }
        while (v8 != 64);
        v6 = v27 + 1;
      }
      while (v27 + 1 != v26);
      v26 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v26);
  }

  return v4;
}

- (id)_entriesForSlots:(id)a3 database:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;

  v6 = (objc_class *)MEMORY[0x24BDBCED8];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  v10 = objc_alloc(MEMORY[0x24BE40E28]);
  v11 = (void *)objc_msgSend(v10, "initWithProperty:values:contains:", *MEMORY[0x24BE408E8], v8, 1);

  v12 = (void *)MEMORY[0x24BE40B58];
  v21 = 0;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __59__HDOntologyDiagnosticOperation__entriesForSlots_database___block_invoke;
  v19[3] = &unk_24E0D8A78;
  v13 = v9;
  v20 = v13;
  LOBYTE(v12) = objc_msgSend(v12, "enumerateEntriesWithPredicate:orderingTerms:database:error:enumerationHandler:", v11, 0, v7, &v21, v19);

  v14 = v21;
  v15 = v14;
  if ((v12 & 1) == 0)
    -[HDOntologyDiagnosticOperation _logAndAndAppendFormat:](self, "_logAndAndAppendFormat:", CFSTR("Failed to enumerate shard registry entries: %@"), v14);
  v16 = v20;
  v17 = v13;

  return v17;
}

uint64_t __59__HDOntologyDiagnosticOperation__entriesForSlots_database___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a2;
  objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v4, "slot"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, v5);

  return 1;
}

- (void)_reportElementCountsBySlot:(id)a3 entriesBySlot:(id)a4
{
  id v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  id obj;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  __CFString *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v25 = a4;
  v26 = v6;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(v6, "hk_sortedKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v27)
  {
    v24 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v35 != v24)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v25, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v9;
        if (v9)
        {
          v10 = v9;
          v11 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v9, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "schemaType");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringWithFormat:", CFSTR(" %@ %@ %ld"), v12, v13, objc_msgSend(v10, "schemaVersion"));
          v14 = (const __CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v14 = &stru_24E0DA908;
        }
        v28 = (__CFString *)v14;
        -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("Slot %@%@"), v8, v14);
        -[HDDiagnosticOperation appendSeparator](self, "appendSeparator");
        objc_msgSend(v26, "objectForKeyedSubscript:", v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        objc_msgSend(v15, "hk_sortedKeys");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v31;
          do
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v31 != v19)
                objc_enumerationMutation(v16);
              v21 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
              objc_msgSend(v15, "objectForKeyedSubscript:", v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("        %lld %@"), objc_msgSend(v22, "longLongValue"), v21);

            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          }
          while (v18);
        }

        -[HDDiagnosticOperation appendNewline](self, "appendNewline");
      }
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v27);
  }

}

- (void)_reportOntologyMetadataForDatabase:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = (objc_class *)MEMORY[0x24BDD4028];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithColumnTitles:", &unk_24E0DD4A0);
  v7 = (void *)MEMORY[0x24BE40BE8];
  v14 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __68__HDOntologyDiagnosticOperation__reportOntologyMetadataForDatabase___block_invoke;
  v12[3] = &unk_24E0D8AE0;
  v8 = v6;
  v13 = v8;
  LOBYTE(v7) = objc_msgSend(v7, "enumerateMetadataValuesWithPredicate:database:error:enumerationHandler:", 0, v5, &v14, v12);

  v9 = v14;
  v10 = v9;
  if ((v7 & 1) == 0)
    -[HDOntologyDiagnosticOperation _logAndAndAppendFormat:](self, "_logAndAndAppendFormat:", CFSTR("Failed to enumerate ontology metadata: %@"), v9);
  -[HDDiagnosticOperation appendStrongSeparator](self, "appendStrongSeparator");
  -[HDDiagnosticOperation appendNewline](self, "appendNewline");
  -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("Ontology Metadata"));
  -[HDDiagnosticOperation appendSeparator](self, "appendSeparator");
  objc_msgSend(v8, "formattedTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDiagnosticOperation appendString:](self, "appendString:", v11);

  -[HDDiagnosticOperation appendNewline](self, "appendNewline");
}

uint64_t __68__HDOntologyDiagnosticOperation__reportOntologyMetadataForDatabase___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v4 = *(void **)(a1 + 32);
  v10[0] = a2;
  v10[1] = a3;
  v5 = (void *)MEMORY[0x24BDBCE30];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "arrayWithObjects:count:", v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendRow:", v8);

  return 1;
}

- (void)_reportForOntologyFeaturesWithOntologyStore:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  -[HDDiagnosticOperation appendStrongSeparator](self, "appendStrongSeparator");
  -[HDDiagnosticOperation appendNewline](self, "appendNewline");
  v5 = dispatch_semaphore_create(0);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1;
  v18 = __Block_byref_object_dispose__1;
  v19 = 0;
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __77__HDOntologyDiagnosticOperation__reportForOntologyFeaturesWithOntologyStore___block_invoke;
  v11 = &unk_24E0D8B08;
  v13 = &v14;
  v6 = v5;
  v12 = v6;
  objc_msgSend(v4, "shardRequirementStatusesWithCompletion:", &v8);
  v7 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v6, v7))
  {
    -[HDOntologyDiagnosticOperation _logAndAndAppendFormat:](self, "_logAndAndAppendFormat:", CFSTR("Timed out attempting to get shard requirement statuses"), v8, v9, v10, v11);
  }
  else if (objc_msgSend((id)v15[5], "count", v8, v9, v10, v11))
  {
    -[HDOntologyDiagnosticOperation _reportForShardRequirementStatuses:](self, "_reportForShardRequirementStatuses:", v15[5]);
  }
  else
  {
    -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("No feature evaluators to report required shards"));
  }

  _Block_object_dispose(&v14, 8);
}

void __77__HDOntologyDiagnosticOperation__reportForOntologyFeaturesWithOntologyStore___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)_reportForShardRequirementStatuses:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[2];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD4028]), "initWithColumnTitles:", &unk_24E0DD4B8);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v19[0] = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        objc_msgSend(v6, "objectForKeyedSubscript:", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "integerValue");
        HKStringFromOptionalBooleanResult();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v19[1] = v12;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendRow:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v8);
  }

  -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("Ontology Feature Evaluator Statuses"));
  -[HDDiagnosticOperation appendSeparator](self, "appendSeparator");
  objc_msgSend(v5, "formattedTable");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDiagnosticOperation appendString:](self, "appendString:", v14);

  -[HDDiagnosticOperation appendNewline](self, "appendNewline");
}

- (void)_reportForOntologyKeyValueDomains
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HDDiagnosticOperation appendStrongSeparator](self, "appendStrongSeparator");
  -[HDDiagnosticOperation appendNewline](self, "appendNewline");
  -[HDDiagnosticOperation healthDirectoryURL](self, "healthDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("healthdb.sqlite"), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[HDDiagnosticOperation openReadOnlyDatabaseAtURL:](self, "openReadOnlyDatabaseAtURL:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HDOntologyDiagnosticOperation _reportForOntologyKeyValueDomainsWithDatabase:](self, "_reportForOntologyKeyValueDomainsWithDatabase:", v4);
  }
  else
  {
    objc_msgSend(v6, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("Unable to open %@ \n"), v5);

  }
  objc_msgSend(v4, "close");

}

- (void)_reportForOntologyKeyValueDomainsWithDatabase:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x24BE40C90], "_rawValuesForKeys:domain:category:database:error:", 0, CFSTR("HDOntologyUpdateCoordinator"), 0, a3, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;
  v6 = v5;
  if (v4)
    -[HDOntologyDiagnosticOperation _reportDomain:keyValues:](self, "_reportDomain:keyValues:", CFSTR("HDOntologyUpdateCoordinator"), v4);
  else
    -[HDOntologyDiagnosticOperation _logAndAndAppendFormat:](self, "_logAndAndAppendFormat:", CFSTR("ERROR: Failed to get key value pairs for domain \"%@\": %@"), CFSTR("HDOntologyUpdateCoordinator"), v5);

}

- (void)_reportDomain:(id)a3 keyValues:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[2];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v20 = a3;
  v5 = a4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD4028]), "initWithColumnTitles:", &unk_24E0DD4D0);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v5, "hk_sortedKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "containsString:", CFSTR("updateStartDate")) & 1) != 0
          || objc_msgSend(v11, "containsString:", CFSTR("updateEndDate")))
        {
          v13 = (void *)MEMORY[0x24BDBCE60];
          objc_msgSend(v12, "doubleValue");
          objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          HKDiagnosticStringFromDate();
          v15 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          if (objc_msgSend(v11, "containsString:", CFSTR("updateError")))
          {
            v16 = v12;
          }
          else
          {
            objc_msgSend(v12, "description");
            v16 = (id)objc_claimAutoreleasedReturnValue();
          }
          v15 = v16;
        }
        v26[0] = v11;
        v26[1] = v15;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendRow:", v17);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v8);
  }

  -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("%@ Key Value Domain"), v20);
  -[HDDiagnosticOperation appendSeparator](self, "appendSeparator");
  objc_msgSend(v6, "formattedTable");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDiagnosticOperation appendString:](self, "appendString:", v18);

  -[HDDiagnosticOperation appendNewline](self, "appendNewline");
}

- (void)_reportForOntologyUserDefaultsWithHealthStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HDDiagnosticOperation appendStrongSeparator](self, "appendStrongSeparator");
  -[HDDiagnosticOperation appendNewline](self, "appendNewline");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD4028]), "initWithColumnTitles:", &unk_24E0DD4E8);
  -[HDOntologyDiagnosticOperation _valueForDaemonDefaultKey:healthStore:](self, "_valueForDaemonDefaultKey:healthStore:", CFSTR("PeriodicActivity-com.apple.healthd.ontology.update-ErrorCount"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("PeriodicActivity-com.apple.healthd.ontology.update-ErrorCount");
  objc_msgSend(v6, "stringValue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = CFSTR("(null)");
  if (v7)
    v9 = (const __CFString *)v7;
  v12[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendRow:", v10);

  -[HDOntologyDiagnosticOperation _appendDateStringForDefaultKey:tableFormatter:healthStore:](self, "_appendDateStringForDefaultKey:tableFormatter:healthStore:", CFSTR("PeriodicActivity-com.apple.healthd.ontology.update-LastSuccessfulRun"), v5, v4);
  -[HDOntologyDiagnosticOperation _appendDateStringForDefaultKey:tableFormatter:healthStore:](self, "_appendDateStringForDefaultKey:tableFormatter:healthStore:", CFSTR("PeriodicActivity-com.apple.healthd.ontology.update-EarliestNextRun"), v5, v4);

  -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("healthd User Defaults"));
  -[HDDiagnosticOperation appendSeparator](self, "appendSeparator");
  objc_msgSend(v5, "formattedTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDiagnosticOperation appendString:](self, "appendString:", v11);

  -[HDDiagnosticOperation appendNewline](self, "appendNewline");
  -[HDDiagnosticOperation appendStrongSeparator](self, "appendStrongSeparator");
  -[HDDiagnosticOperation appendNewline](self, "appendNewline");

}

- (void)_appendDateStringForDefaultKey:(id)a3 tableFormatter:(id)a4 healthStore:(id)a5
{
  id v8;
  id v9;
  void *v10;
  __CFString *v11;
  void *v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a3;
  -[HDOntologyDiagnosticOperation _valueForDaemonDefaultKey:healthStore:](self, "_valueForDaemonDefaultKey:healthStore:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    HKDiagnosticStringFromDate();
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = CFSTR("(null)");
  }
  v13[0] = v9;
  v13[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "appendRow:", v12);
}

- (id)_valueForDaemonDefaultKey:(id)a3 healthStore:(id)a4
{
  id v6;
  id v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  dispatch_time_t v10;
  uint64_t v11;
  id v12;
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a3;
  v7 = a4;
  v8 = dispatch_semaphore_create(0);
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1;
  v28 = __Block_byref_object_dispose__1;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  v23 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __71__HDOntologyDiagnosticOperation__valueForDaemonDefaultKey_healthStore___block_invoke;
  v14[3] = &unk_24E0D8B30;
  v16 = &v24;
  v17 = &v18;
  v9 = v8;
  v15 = v9;
  objc_msgSend(v7, "_fetchDaemonPreferenceForKey:completion:", v6, v14);
  v10 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v9, v10))
    -[HDOntologyDiagnosticOperation _logAndAndAppendFormat:](self, "_logAndAndAppendFormat:", CFSTR("Timed out attempting to get daemon default for key \"%@\"), v6);
  v11 = v19[5];
  if (v11)
    -[HDOntologyDiagnosticOperation _logAndAndAppendFormat:](self, "_logAndAndAppendFormat:", CFSTR("Error getting daemon default for key \"%@\": %@"), v6, v11);
  v12 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

void __71__HDOntologyDiagnosticOperation__valueForDaemonDefaultKey_healthStore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_reportNetworkReachabilityForEnvironment:(id)a3
{
  id v4;
  const __SCNetworkReachability *v5;
  const __SCNetworkReachability *v6;
  SCNetworkReachabilityFlags flags;

  flags = 0;
  v4 = objc_retainAutorelease(a3);
  v5 = SCNetworkReachabilityCreateWithName(0, (const char *)objc_msgSend(v4, "UTF8String"));
  if (v5)
  {
    v6 = v5;
    if (SCNetworkReachabilityGetFlags(v5, &flags))
      -[HDOntologyDiagnosticOperation _reportReachabilityFlags:](self, "_reportReachabilityFlags:", flags);
    else
      -[HDOntologyDiagnosticOperation _logAndAndAppendFormat:](self, "_logAndAndAppendFormat:", CFSTR("Unable to get reachability flags for \"%@\"), v4);
    CFRelease(v6);
  }
  else
  {
    -[HDOntologyDiagnosticOperation _logAndAndAppendFormat:](self, "_logAndAndAppendFormat:", CFSTR("Unable to get reachability flags for \"%@\"), v4);
  }

}

- (void)_reportReachabilityFlags:(unsigned int)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD4028]), "initWithColumnTitles:", &unk_24E0DD500);
  v32[0] = CFSTR("TransientConnection");
  HKStringFromBool();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendRow:", v6);

  v31[0] = CFSTR("Reachable");
  HKStringFromBool();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendRow:", v8);

  v30[0] = CFSTR("ConnectionRequired");
  HKStringFromBool();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendRow:", v10);

  v29[0] = CFSTR("ConnectionOnTraffic");
  HKStringFromBool();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendRow:", v12);

  v28[0] = CFSTR("InterventionRequired");
  HKStringFromBool();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendRow:", v14);

  v27[0] = CFSTR("ConnectionOnDemand");
  HKStringFromBool();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendRow:", v16);

  v26[0] = CFSTR("IsLocalAddress");
  HKStringFromBool();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendRow:", v18);

  v25[0] = CFSTR("IsDirect");
  HKStringFromBool();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendRow:", v20);

  v24[0] = CFSTR("IsWWAN");
  HKStringFromBool();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendRow:", v22);

  -[HDDiagnosticOperation appendSeparator](self, "appendSeparator");
  objc_msgSend(v4, "formattedTable");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDiagnosticOperation appendString:](self, "appendString:", v23);

  -[HDDiagnosticOperation appendNewline](self, "appendNewline");
}

- (void)_logAndAndAppendFormat:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (objc_class *)MEMORY[0x24BDD17C8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v7);

  -[HDDiagnosticOperation log:](self, "log:", CFSTR("%@"), v6);
  -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("%@"), v6);

}

- (void)_reportUserDomainConcepts
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HDDiagnosticOperation healthDirectoryURL](self, "healthDirectoryURL");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("healthdb_secure.sqlite"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDiagnosticOperation openReadOnlyDatabaseAtURL:](self, "openReadOnlyDatabaseAtURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HDOntologyDiagnosticOperation _reportUserDomainConceptsForDatabase:](self, "_reportUserDomainConceptsForDatabase:", v4);
  }
  else
  {
    objc_msgSend(v3, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("Unable to open %@ \n"), v5);

  }
  objc_msgSend(v4, "close");

}

- (void)_reportUserDomainConceptsForDatabase:(id)a3
{
  id v4;

  v4 = a3;
  -[HDOntologyDiagnosticOperation _reportCountsForUDCTableRowsInDatabase:](self, "_reportCountsForUDCTableRowsInDatabase:", v4);
  -[HDOntologyDiagnosticOperation _reportUDCTableInDatabase:](self, "_reportUDCTableInDatabase:", v4);

}

- (void)_reportCountsForUDCTableRowsInDatabase:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HDDiagnosticOperation appendString:](self, "appendString:", CFSTR("User Domains Concept Table Counts"));
  -[HDDiagnosticOperation appendNewline](self, "appendNewline");
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v6, 13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDiagnosticOperation reportCountsForDatabase:entityClasses:](self, "reportCountsForDatabase:entityClasses:", v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17);

  -[HDDiagnosticOperation appendNewline](self, "appendNewline");
  -[HDDiagnosticOperation appendStrongSeparator](self, "appendStrongSeparator");
  -[HDDiagnosticOperation appendNewline](self, "appendNewline");
}

- (void)_reportUDCTableInDatabase:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[HDDiagnosticOperation appendString:](self, "appendString:", CFSTR("User Domains Concepts"));
  -[HDDiagnosticOperation appendSeparator](self, "appendSeparator");
  v5 = objc_alloc(MEMORY[0x24BDD4028]);
  +[HDOntologyDiagnosticOperation _udcTableColumnTitles](HDOntologyDiagnosticOperation, "_udcTableColumnTitles");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithColumnTitles:", v6);

  v11 = 0;
  LOBYTE(v6) = -[HDOntologyDiagnosticOperation _enumerateUDCTableInDatabase:appendToFormatter:error:](self, "_enumerateUDCTableInDatabase:appendToFormatter:error:", v4, v7, &v11);

  v8 = v11;
  v9 = v8;
  if ((v6 & 1) != 0)
  {
    objc_msgSend(v7, "formattedTable");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDiagnosticOperation appendString:](self, "appendString:", v10);

    -[HDDiagnosticOperation appendNewline](self, "appendNewline");
    -[HDDiagnosticOperation appendStrongSeparator](self, "appendStrongSeparator");
    -[HDDiagnosticOperation appendNewline](self, "appendNewline");
  }
  else
  {
    -[HDOntologyDiagnosticOperation _logAndAndAppendFormat:](self, "_logAndAndAppendFormat:", CFSTR("Failed to enumerate UDC table rows: %@"), v8);
  }

}

+ (id)_udcTableColumnTitles
{
  return &unk_24E0DD518;
}

- (BOOL)_enumerateUDCTableInDatabase:(id)a3 appendToFormatter:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v7 = a4;
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = a3;
  objc_msgSend(v8, "stringWithFormat:", CFSTR("SELECT * FROM user_domain_concepts ORDER BY udc_id LIMIT 500"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __86__HDOntologyDiagnosticOperation__enumerateUDCTableInDatabase_appendToFormatter_error___block_invoke;
  v13[3] = &unk_24E0D8858;
  v14 = v7;
  v11 = v7;
  LOBYTE(a5) = objc_msgSend(v9, "executeSQL:error:bindingHandler:enumerationHandler:", v10, a5, 0, v13);

  return (char)a5;
}

uint64_t __86__HDOntologyDiagnosticOperation__enumerateUDCTableInDatabase_appendToFormatter_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v34[16];

  v34[14] = *MEMORY[0x24BDAC8D0];
  HDSQLiteColumnWithNameAsDate();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsDate();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", HDSQLiteColumnWithNameAsInt64());
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "stringValue");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v31;
  HDSQLiteColumnWithNameAsUUID();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "UUIDString");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v29;
  HDSQLiteColumnWithNameAsString();
  v3 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v3;
  v4 = &stru_24E0DA908;
  if (v3)
    v4 = (const __CFString *)v3;
  v34[2] = v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", HDSQLiteColumnWithNameAsInt64());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringValue");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v25;
  HDSQLiteColumnWithNameAsBoolean();
  HKStringFromBool();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v34[4] = v23;
  v27 = v1;
  HKDiagnosticStringFromDate();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v34[5] = v22;
  v5 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v1, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "numberWithDouble:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringValue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v34[6] = v20;
  v24 = v2;
  HKDiagnosticStringFromDate();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v34[7] = v19;
  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v34[8] = v7;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", HDSQLiteColumnWithNameAsInt64());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v34[9] = v9;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", HDSQLiteColumnWithNameAsInt64());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34[10] = v11;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", HDSQLiteColumnWithNameAsInt64());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34[11] = v13;
  HDSQLiteColumnWithNameAsString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v34[12] = v14;
  HDSQLiteColumnWithNameIsNull();
  HKStringFromBool();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v34[13] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "appendRow:", v16);
  return 1;
}

@end
