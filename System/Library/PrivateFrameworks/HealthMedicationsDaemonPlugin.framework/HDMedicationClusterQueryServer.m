@implementation HDMedicationClusterQueryServer

- (HDMedicationClusterQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HDMedicationClusterQueryServer;
  return -[HDQueryServer initWithUUID:configuration:client:delegate:](&v7, sel_initWithUUID_configuration_client_delegate_, a3, a4, a5, a6);
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

- (void)_queue_start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HDMedicationClusterQueryServer;
  -[HDQueryServer _queue_start](&v9, sel__queue_start);
  -[HDQueryServer queryUUID](self, "queryUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDQueryServer clientProxy](self, "clientProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDQueryServer configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  -[HDMedicationClusterQueryServer _queryMedicationsWithConfiguration:errorOut:](self, v5, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8;

  if (v6)
  {
    objc_msgSend(v4, "client_deliverResults:queryUUID:", v6, v3);
  }
  else
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 122, CFSTR("Query operation returned nil without an error. queryUUID=[%@]"), v3);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "client_deliverError:forQuery:", v7, v3);
  }

}

- (id)_queryMedicationsWithConfiguration:(void *)a3 errorOut:
{
  id v5;
  void *v6;
  uint64_t v7;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    switch(objc_msgSend(v5, "queryType"))
    {
      case 0:
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 3, CFSTR("Received queryType none"));
        goto LABEL_4;
      case 1:
        -[HDMedicationClusterQueryServer _queryMedicationsWithScanResult:errorOut:](a1, v6, (uint64_t)a3);
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      case 2:
        -[HDMedicationClusterQueryServer _queryMedicationsWithMachineReadableCode:errorOut:](a1, v6, (uint64_t)a3);
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      case 3:
        -[HDMedicationClusterQueryServer _queryMedicationsWithSearchTokens:errorOut:](a1, v6, (uint64_t)a3);
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      case 4:
        -[HDMedicationClusterQueryServer _queryMedicationsWithExistingMedications:errorOut:](a1, v6, (uint64_t)a3);
        v7 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        a3 = (void *)v7;
        break;
      default:
        break;
    }
  }
  else
  {
LABEL_4:
    a3 = 0;
  }

  return a3;
}

- (id)_queryMedicationsWithScanResult:(uint64_t)a3 errorOut:
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  if (a1)
  {
    v5 = a2;
    objc_msgSend(v5, "scanResult");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "limit");

    objc_msgSend(a1, "profile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDMedicationSearchEngine medicationClustersFromScanResult:limit:profile:errorOut:](HDMedicationSearchEngine, "medicationClustersFromScanResult:limit:profile:errorOut:", v6, v7, v8, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)_queryMedicationsWithMachineReadableCode:(uint64_t)a3 errorOut:
{
  id v3;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  id v10;
  id v12;
  _QWORD v13[2];

  v3 = a1;
  v13[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v12 = 0;
    v5 = a2;
    objc_msgSend(v5, "machineReadableCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "codeAttributeType");

    objc_msgSend(v3, "profile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = +[HDMedicationSearchEngine medicationCluster:machineReadableCode:codeAttributeType:profile:errorOut:](HDMedicationSearchEngine, "medicationCluster:machineReadableCode:codeAttributeType:profile:errorOut:", &v12, v6, v7, v8, a3);
    v10 = v12;

    v3 = 0;
    if (v9)
    {
      if (v10)
      {
        v13[0] = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
        v3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v3 = (id)MEMORY[0x1E0C9AA60];
      }
    }

  }
  return v3;
}

- (id)_queryMedicationsWithSearchTokens:(uint64_t)a3 errorOut:
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  if (a1)
  {
    v5 = a2;
    objc_msgSend(v5, "textSearchTokens");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "limit");

    objc_msgSend(a1, "profile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDMedicationSearchEngine medicationClustersFromTextSearchTokens:limit:profile:errorOut:](HDMedicationSearchEngine, "medicationClustersFromTextSearchTokens:limit:profile:errorOut:", v6, v7, v8, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)_queryMedicationsWithExistingMedications:(uint64_t)a3 errorOut:
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  if (a1)
  {
    v5 = a2;
    objc_msgSend(v5, "existingMedications");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sinceDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "limit");

    objc_msgSend(a1, "profile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDMedicationSearchEngine medicationClustersForCHRImportWithExistingMedications:sinceDate:limit:profile:errorOut:](HDMedicationSearchEngine, "medicationClustersForCHRImportWithExistingMedications:sinceDate:limit:profile:errorOut:", v6, v7, v8, v9, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

@end
