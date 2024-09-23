@implementation DiagnosticCaseSummaryAnalytics

- (DiagnosticCaseSummaryAnalytics)init
{
  void *v3;
  DiagnosticCaseSummaryAnalytics *v4;
  objc_super v6;

  +[AnalyticsWorkspace defaultWorkspace](AnalyticsWorkspace, "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)DiagnosticCaseSummaryAnalytics;
  v4 = -[ObjectAnalytics initWithWorkspace:entityName:withCache:](&v6, sel_initWithWorkspace_entityName_withCache_, v3, CFSTR("DiagnosticCaseSummary"), 1);

  return v4;
}

- (DiagnosticCaseSummaryAnalytics)initWithWorkspace:(id)a3 withCache:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DiagnosticCaseSummaryAnalytics;
  return -[ObjectAnalytics initWithWorkspace:entityName:withCache:](&v5, sel_initWithWorkspace_entityName_withCache_, a3, CFSTR("DiagnosticCaseSummary"), a4);
}

- (void)insertEntityForDiagnosticCase:(id)a3
{
  id v4;
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
  id v22;

  v4 = a3;
  -[ObjectAnalytics createEntity](self, "createEntity");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "caseStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "caseID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCaseID:", v6);

  objc_msgSend(v5, "caseGroupID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCaseGroupID:", v7);

  objc_msgSend(v5, "timeStamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCaseCreatedTime:", v8);

  objc_msgSend(v5, "caseClosedTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCaseClosedTime:", v9);

  objc_msgSend(v5, "caseDomain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCaseDomain:", v10);

  objc_msgSend(v5, "caseType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCaseType:", v11);

  objc_msgSend(v5, "caseSubtype");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCaseSubtype:", v12);

  objc_msgSend(v5, "caseSubtypeContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCaseSubtypeContext:", v13);

  objc_msgSend(v5, "caseDetectedProcess");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCaseDetectedProcess:", v14);

  objc_msgSend(v5, "caseEffectiveProcess");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCaseEffectiveProcess:", v15);

  objc_msgSend(v5, "caseRelatedProcesses");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCaseRelatedProcesses:", v16);

  objc_msgSend(v5, "caseThresholdValues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCaseThresholdValues:", v17);

  objc_msgSend(v22, "setCaseClosureType:", objc_msgSend(v5, "caseClosureType"));
  objc_msgSend(v22, "setCaseDampeningType:", objc_msgSend(v5, "caseDampeningType"));
  objc_msgSend(v5, "caseContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCaseContext:", v18);

  objc_msgSend(v22, "setRemoteTrigger:", objc_msgSend(v5, "remoteTrigger"));
  objc_msgSend(v5, "buildVariant");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBuildVariant:", v19);

  objc_msgSend(v5, "buildVersion");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBuildVersion:", v20);

  objc_msgSend(v4, "stringRepresentationOfAttachmentsWithSize");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "setCaseAttachments:", v21);
}

- (void)updateSubmittedCases:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  summaryLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v16 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1DBAE1000, v4, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: Update caseSummaryState to Submitted for %ld case(s)", buf, 0xCu);
  }

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setCaseSummaryState:", 1, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (int64_t)removeDiagnosticCaseSummariesWithState:(signed __int16)a3 olderThan:(unint64_t)a4
{
  int v4;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
  _QWORD v16[3];

  v4 = a3;
  v16[2] = *MEMORY[0x1E0C80C00];
  v6 = (double)(86400 * a4);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", -v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("caseCreatedTime"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("caseSummaryState == %d"), v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3528];
  v16[0] = v9;
  v16[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "andPredicateWithSubpredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[ObjectAnalytics removeEntitiesMatching:](self, "removeEntitiesMatching:", v13);
  return v14;
}

- (int64_t)removeAllDiagnosticCaseSummaries
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DiagnosticCaseSummaryAnalytics;
  return -[ObjectAnalytics removeEntitiesMatching:](&v3, sel_removeEntitiesMatching_, 0);
}

- (id)fetchCaseSummariesWithIdentifiers:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v11, "length"))
        {
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("caseID == %@"), v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("caseCreatedTime"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[DiagnosticCaseSummaryAnalytics listCaseSummaryProperties](DiagnosticCaseSummaryAnalytics, "listCaseSummaryProperties");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ObjectAnalytics fetchEntityDictionariesWithProperties:predicate:sortDescriptors:limit:](self, "fetchEntityDictionariesWithProperties:predicate:sortDescriptors:limit:", v15, v13, v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)fetchCaseSummariesOfType:(id)a3 fromIdentifier:(id)a4 count:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
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
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_opt_new();
  if (objc_msgSend(v8, "caseInsensitiveCompare:", CFSTR("pending")))
  {
    if (objc_msgSend(v8, "caseInsensitiveCompare:", CFSTR("submitted")))
      goto LABEL_6;
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("caseSummaryState == %d"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v12);

LABEL_6:
  +[DiagnosticCaseSummaryAnalytics listCaseSummaryProperties](DiagnosticCaseSummaryAnalytics, "listCaseSummaryProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    -[DiagnosticCaseSummaryAnalytics diagnosticCaseSummaryDictionaryForIdentifier:properties:](self, "diagnosticCaseSummaryDictionaryForIdentifier:properties:", v9, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count"))
    {
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("caseCreatedTime"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("caseCreatedTime < %@"), v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v18);

      }
    }

  }
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("caseCreatedTime"), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ObjectAnalytics fetchEntityDictionariesWithProperties:predicate:sortDescriptors:limit:](self, "fetchEntityDictionariesWithProperties:predicate:sortDescriptors:limit:", v13, v19, v21, a5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)diagnosticCaseSummaryDictionaryForIdentifier:(id)a3 properties:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a4;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("caseID == %@"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ObjectAnalytics fetchEntityDictionariesWithProperties:predicate:](self, "fetchEntityDictionariesWithProperties:predicate:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)listCaseSummaryProperties
{
  return &unk_1EA3D0140;
}

+ (id)listSummaryItemFromCaseSummaryDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *context;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  context = (void *)MEMORY[0x1DF0B6314]();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  +[DiagnosticCaseSummaryAnalytics listCaseSummaryProperties](DiagnosticCaseSummaryAnalytics, "listCaseSummaryProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v10);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v12 = -[__CFString integerValue](v11, "integerValue");
            if (objc_msgSend(v10, "isEqualToString:", CFSTR("caseDampeningType")))
            {
              +[DiagnosticCase descriptionForDampeningType:](DiagnosticCase, "descriptionForDampeningType:", (__int16)v12);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v10);

              goto LABEL_19;
            }
            if (objc_msgSend(v10, "isEqualToString:", CFSTR("caseSummaryState")))
            {
              if (v12)
                v15 = CFSTR("Submitted");
              else
                v15 = CFSTR("Pending");
              v14 = v4;
              goto LABEL_18;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || -[__CFString length](v11, "length"))
            {
              v14 = v4;
              v15 = v11;
LABEL_18:
              objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, v10);
            }
          }
        }
LABEL_19:

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  objc_autoreleasePoolPop(context);
  return v4;
}

+ (id)pbRequestForCases:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  uint64_t v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  id obj;
  void *v60;
  id v61;
  uint64_t v62;
  _QWORD v63[4];
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  const __CFString *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  void *v84;
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[SystemProperties sharedInstance](SystemProperties, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setVer:", 1);
  objc_msgSend(v4, "productType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeviceModel:", v6);

  objc_msgSend(v4, "buildPlatform");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBuildPlatform:", v7);

  v56 = v4;
  objc_msgSend(v4, "deviceClassString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v5;
  objc_msgSend(v5, "setDeviceCategory:", v8);

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = v3;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v85, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v66;
    v12 = 0x1EA3B3000uLL;
    v57 = *(_QWORD *)v66;
    do
    {
      v13 = 0;
      v58 = v10;
      do
      {
        if (*(_QWORD *)v66 != v11)
          objc_enumerationMutation(obj);
        v62 = v13;
        v14 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v13);
        v15 = (void *)objc_opt_new();
        objc_msgSend(v14, "buildVersion");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setBuild:", v16);

        objc_msgSend(v14, "buildVariant");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setBuildVariant:", v17);

        objc_msgSend(v14, "caseDomain");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setDomain:", v18);

        objc_msgSend(v14, "caseType");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setType:", v19);

        objc_msgSend(v14, "caseSubtype");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setSubtype:", v20);

        objc_msgSend(v14, "caseSubtypeContext");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setSubtypeContext:", v21);

        objc_msgSend(v14, "caseDetectedProcess");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setProcess:", v22);

        objc_msgSend(v14, "caseID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setCaseIdentifier:", v23);

        objc_msgSend(v15, "setRemoteTrigger:", objc_msgSend(v14, "remoteTrigger"));
        objc_msgSend(v14, "caseCreatedTime");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "timeIntervalSince1970");
        objc_msgSend(v15, "setCaseStartTime:");

        objc_msgSend(v14, "caseClosedTime");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "timeIntervalSince1970");
        objc_msgSend(v15, "setCaseClosedTime:");

        objc_msgSend(*(id *)(v12 + 3640), "descriptionForClosureType:", objc_msgSend(v14, "caseClosureType"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setCaseClosureType:", v26);

        objc_msgSend(*(id *)(v12 + 3640), "descriptionForDampeningType:", objc_msgSend(v14, "caseDampeningType"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setCaseDampeningType:", v27);

        objc_msgSend(v14, "caseContext");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "length");

        if (v29)
        {
          objc_msgSend(v14, "caseContext");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setCaseContext:", v30);

        }
        objc_msgSend(v14, "caseEffectiveProcess");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "length");

        if (v32)
        {
          objc_msgSend(v14, "caseEffectiveProcess");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setCaseEffectiveProcess:", v33);

        }
        objc_msgSend(v14, "caseGroupID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "length");

        if (v35)
        {
          objc_msgSend(v14, "caseGroupID");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setCaseGroupIdentifier:", v36);

        }
        objc_msgSend(v14, "caseRelatedProcesses");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "length");

        if (v38)
        {
          objc_msgSend(v14, "caseRelatedProcesses");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setCaseRelatedProcesses:", v39);

        }
        objc_msgSend(v14, "caseThresholdValues");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "length");

        if (v41)
        {
          objc_msgSend(v14, "caseThresholdValues");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setCaseThresholdValues:", v42);

        }
        objc_msgSend(v14, "caseAttachments");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v63[0] = MEMORY[0x1E0C809B0];
        v63[1] = 3221225472;
        v63[2] = __52__DiagnosticCaseSummaryAnalytics_pbRequestForCases___block_invoke;
        v63[3] = &unk_1EA3B5A38;
        v44 = v15;
        v64 = v44;
        +[DiagnosticCaseSummaryAnalytics extractPbAttachmentsFromString:completion:](DiagnosticCaseSummaryAnalytics, "extractPbAttachmentsFromString:completion:", v43, v63);

        summaryLogHandle();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v14, "caseID");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "caseGroupID");
          v47 = objc_claimAutoreleasedReturnValue();
          v60 = (void *)v47;
          if (v47)
            v48 = (const __CFString *)v47;
          else
            v48 = CFSTR("(no grpID)");
          objc_msgSend(v14, "caseDomain");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "caseType");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "caseSubtype");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "caseSubtypeContext");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "caseDetectedProcess");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "caseAttachments");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138479619;
          v70 = v46;
          v71 = 2113;
          v72 = v48;
          v12 = 0x1EA3B3000;
          v73 = 2113;
          v74 = v49;
          v75 = 2113;
          v76 = v50;
          v77 = 2113;
          v78 = v51;
          v79 = 2113;
          v80 = v52;
          v81 = 2113;
          v82 = v53;
          v83 = 2113;
          v84 = v54;
          _os_log_impl(&dword_1DBAE1000, v45, OS_LOG_TYPE_DEBUG, "DiagnosticCaseSummaryLog: Processed case: %{private}@/%{private}@ {%{private}@/%{private}@/%{private}@/%{private}@/%{private}@-%{private}@}", buf, 0x52u);

          v11 = v57;
          v10 = v58;

        }
        objc_msgSend(v61, "addSigRequest:", v44);

        v13 = v62 + 1;
      }
      while (v10 != v62 + 1);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v85, 16);
    }
    while (v10);
  }

  return v61;
}

void __52__DiagnosticCaseSummaryAnalytics_pbRequestForCases___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setAttachments:", v5);
    objc_msgSend(*(id *)(a1 + 32), "setLogSizeTotal:", a3);
  }

}

+ (id)stringRepresentationOfAttachmentsWithSize:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", &stru_1EA3B8F58);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__DiagnosticCaseSummaryAnalytics_stringRepresentationOfAttachmentsWithSize___block_invoke;
  v6[3] = &unk_1EA3B5A60;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);
  v4 = (void *)objc_msgSend((id)v8[5], "copy");
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __76__DiagnosticCaseSummaryAnalytics_stringRepresentationOfAttachmentsWithSize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "length"))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "appendString:", CFSTR(","));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "appendFormat:", CFSTR("%@:%@"), v6, v5);

}

+ (void)extractPbAttachmentsFromString:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void (**v17)(id, void *, _QWORD);
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v17 = (void (**)(id, void *, _QWORD))a4;
  v18 = v5;
  v19 = (void *)objc_opt_new();
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(","));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR(":"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "count"))
        {
          objc_msgSend(v12, "firstObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "lastObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "longLongValue");

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && (_DWORD)v15)
          {
            v16 = (void *)objc_opt_new();
            objc_msgSend(v16, "setFileName:", v13);
            objc_msgSend(v16, "setFileSize:", v15);
            objc_msgSend(v19, "addObject:", v16);
            v9 = (v9 + v15);

          }
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }
  if (v17)
    v17[2](v17, v19, v9);

}

@end
