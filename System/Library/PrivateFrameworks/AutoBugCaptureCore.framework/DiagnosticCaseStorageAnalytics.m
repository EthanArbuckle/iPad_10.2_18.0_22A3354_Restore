@implementation DiagnosticCaseStorageAnalytics

- (DiagnosticCaseStorageAnalytics)init
{
  void *v3;
  DiagnosticCaseStorageAnalytics *v4;
  objc_super v6;

  +[AnalyticsWorkspace defaultWorkspace](AnalyticsWorkspace, "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)DiagnosticCaseStorageAnalytics;
  v4 = -[ObjectAnalytics initWithWorkspace:entityName:withCache:](&v6, sel_initWithWorkspace_entityName_withCache_, v3, CFSTR("DiagnosticCaseStorage"), 1);

  return v4;
}

- (DiagnosticCaseStorageAnalytics)initWithWorkspace:(id)a3 withCache:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DiagnosticCaseStorageAnalytics;
  return -[ObjectAnalytics initWithWorkspace:entityName:withCache:](&v5, sel_initWithWorkspace_entityName_withCache_, a3, CFSTR("DiagnosticCaseStorage"), a4);
}

- (id)diagnosticCaseStorageWithId:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(a3, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("caseID"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ObjectAnalytics fetchEntitiesFreeForm:sortDesc:](self, "fetchEntitiesFreeForm:sortDesc:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)diagnosticCaseStorageWithIdentifier:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("caseID == %@"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ObjectAnalytics fetchEntitiesFreeForm:sortDesc:](self, "fetchEntitiesFreeForm:sortDesc:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)diagnosticCaseStorageDictionaryForIdentifier:(id)a3 properties:(id)a4
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

- (id)diagnosticCaseDictionaryKeys
{
  return objc_autoreleaseReturnValue((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", CFSTR("timeStamp"), CFSTR("caseClosedTime"), CFSTR("caseID"), CFSTR("caseAttachments"), CFSTR("caseDampeningType"), CFSTR("caseClosureType"), CFSTR("remoteTrigger"), CFSTR("dpSubmissionState"), CFSTR("caseDomain"), CFSTR("caseType"), CFSTR("caseSubtype"), CFSTR("caseSubtypeContext"), CFSTR("caseDetectedProcess"), CFSTR("caseEffectiveProcess"), CFSTR("caseRelatedProcesses"), CFSTR("caseThresholdValues"), CFSTR("caseContext"),
                                           CFSTR("caseGroupID"),
                                           CFSTR("buildVersion"),
                                           CFSTR("buildVariant"),
                                           0));
}

- (id)historicalDiagnosticCaseStorageFromIdentifier:(id)a3 count:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    -[DiagnosticCaseStorageAnalytics diagnosticCaseStorageWithIdentifier:](self, "diagnosticCaseStorageWithIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v10 = (void *)MEMORY[0x1E0CB3880];
        objc_msgSend(v8, "timeStamp");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "predicateWithFormat:", CFSTR("timeStamp < %@"), v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("timeStamp"), 0);
  -[ObjectAnalytics fetchEntitiesFreeForm:sortDesc:limit:](self, "fetchEntitiesFreeForm:sortDesc:limit:", v12, v13, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)historicalDiagnosticCaseStorageDictionaryFromIdentifier:(id)a3 withEvents:(BOOL)a4 count:(unint64_t)a5
{
  _BOOL4 v6;
  id v8;
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
  _QWORD v20[2];

  v6 = a4;
  v20[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[DiagnosticCaseStorageAnalytics diagnosticCaseDictionaryKeys](self, "diagnosticCaseDictionaryKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
    objc_msgSend(v9, "addObject:", CFSTR("caseEvents"));
  if (objc_msgSend(v8, "length"))
  {
    -[DiagnosticCaseStorageAnalytics diagnosticCaseStorageDictionaryForIdentifier:properties:](self, "diagnosticCaseStorageDictionaryForIdentifier:properties:", v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("timeStamp"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("timeStamp < %@"), v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("timeStamp"), 0);
  v20[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ObjectAnalytics fetchEntityDictionariesWithProperties:predicate:sortDescriptors:limit:](self, "fetchEntityDictionariesWithProperties:predicate:sortDescriptors:limit:", v10, v15, v17, a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)allDiagnosticCasesStorage
{
  return -[ObjectAnalytics fetchEntitiesFreeForm:sortDesc:](self, "fetchEntitiesFreeForm:sortDesc:", 0, 0);
}

- (int64_t)removeAllDiagnosticCaseStorages
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DiagnosticCaseStorageAnalytics;
  return -[ObjectAnalytics removeEntitiesMatching:](&v3, sel_removeEntitiesMatching_, 0);
}

@end
