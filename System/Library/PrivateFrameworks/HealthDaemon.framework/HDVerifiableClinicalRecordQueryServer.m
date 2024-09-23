@implementation HDVerifiableClinicalRecordQueryServer

- (HDVerifiableClinicalRecordQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  HDVerifiableClinicalRecordQueryServer *v11;
  uint64_t v12;
  NSArray *recordTypes;
  uint64_t v14;
  NSArray *sourceTypes;
  objc_super v17;

  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HDVerifiableClinicalRecordQueryServer;
  v11 = -[HDQueryServer initWithUUID:configuration:client:delegate:](&v17, sel_initWithUUID_configuration_client_delegate_, a3, v10, a5, a6);
  if (v11)
  {
    objc_msgSend(v10, "recordTypes");
    v12 = objc_claimAutoreleasedReturnValue();
    recordTypes = v11->_recordTypes;
    v11->_recordTypes = (NSArray *)v12;

    objc_msgSend(v10, "sourceTypes");
    v14 = objc_claimAutoreleasedReturnValue();
    sourceTypes = v11->_sourceTypes;
    v11->_sourceTypes = (NSArray *)v14;

  }
  return v11;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;

  v7 = a3;
  objc_msgSend(a4, "entitlements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0CB5128];
  v10 = objc_msgSend(v8, "hasAccessEntitlementWithIdentifier:", *MEMORY[0x1E0CB5128]);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 4, CFSTR("Missing required entitlement identifier: %@"), v9);
    LOBYTE(v12) = 0;
    goto LABEL_11;
  }
  objc_msgSend(v7, "recordTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "count");

  if (!v12)
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = CFSTR("recordTypes must contain at least one type");
LABEL_10:
    objc_msgSend(v19, "hk_assignError:code:description:", a5, 3, v20);
    goto LABEL_11;
  }
  objc_msgSend(v7, "sourceTypes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v13, "count");

  if (!v12)
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = CFSTR("sourceTypes must contain at least one type");
    goto LABEL_10;
  }
  v14 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v7, "recordTypes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB60E0], *MEMORY[0x1E0CB60E8], *MEMORY[0x1E0CB60F0], 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hk_intersection:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v12, "count");

  LOBYTE(v12) = v18 == 1;
  if (v18 != 1)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a5, 3, CFSTR("recordTypes must contain exactly one clinical type"));

LABEL_11:
  return (char)v12;
}

uint64_t __78__HDVerifiableClinicalRecordQueryServer__samplesBeforeAuthorizationWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  BOOL v16;

  v6 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v6, "recordTypes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "isSubsetOfSet:", v11);

    v13 = *(void **)(*(_QWORD *)(a1 + 32) + 208);
    objc_msgSend(v6, "sourceType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "containsObject:", v14);

    if (v12)
      v16 = v15 == 0;
    else
      v16 = 1;
    if (!v16)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 100, CFSTR("Expected HKVerifiableClinicalRecord but got %@"), objc_opt_class());
  }

  return isKindOfClass & 1;
}

- (void)_queue_start
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  objc_class *v20;
  _QWORD *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  HDObjectAuthorizationRequestContext *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  HDVerifiableClinicalRecordQueryServer *v30;
  void *v31;
  objc_super v32;
  _QWORD v33[6];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)HDVerifiableClinicalRecordQueryServer;
  -[HDQueryServer _queue_start](&v32, sel__queue_start);
  -[HDQueryServer clientProxy](self, "clientProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v4 = MEMORY[0x1E0C809B0];
  if (self)
  {
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__137;
    v38 = __Block_byref_object_dispose__137;
    v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0CB6DB0], "verifiableClinicalRecordType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDQueryServer profile](self, "profile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDSampleEntity entityEnumeratorWithType:profile:](HDSampleEntity, "entityEnumeratorWithType:profile:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDQueryServer filter](self, "filter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDQueryServer profile](self, "profile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predicateWithProfile:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPredicate:", v10);

    objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("relevant_date"), objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setOrderingTerms:", v12);

    v33[0] = v4;
    v33[1] = 3221225472;
    v33[2] = __78__HDVerifiableClinicalRecordQueryServer__samplesBeforeAuthorizationWithError___block_invoke;
    v33[3] = &unk_1E6CE7E78;
    v33[4] = self;
    v33[5] = &v34;
    if (objc_msgSend(v7, "enumerateWithError:handler:", &v31, v33))
      v13 = (void *)v35[5];
    else
      v13 = 0;
    v14 = v13;

    _Block_object_dispose(&v34, 8);
    v15 = v31;
  }
  else
  {
    v15 = 0;
    v14 = 0;
  }
  v16 = v15;
  v17 = (void *)MEMORY[0x1E0C9AA60];
  if (v14)
    v17 = v14;
  v18 = v17;

  if (v16)
  {
    -[HDQueryServer queryUUID](self, "queryUUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "client_deliverError:forQuery:", v16, v19);
  }
  else
  {
    v28[0] = v4;
    v28[1] = 3221225472;
    v28[2] = __53__HDVerifiableClinicalRecordQueryServer__queue_start__block_invoke;
    v28[3] = &unk_1E6CFFB98;
    v29 = v3;
    v30 = self;
    if (self)
    {
      v20 = (objc_class *)MEMORY[0x1E0CB6968];
      v21 = v28;
      v22 = v18;
      v23 = [v20 alloc];
      objc_msgSend(MEMORY[0x1E0CB6DB0], "verifiableClinicalRecordType");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v23, "initWithExpectedObjectType:", v24);

      objc_msgSend(v25, "setRecordTypes:", self->_recordTypes);
      v26 = -[HDObjectAuthorizationRequestContext initWithSamples:metadata:]([HDObjectAuthorizationRequestContext alloc], "initWithSamples:metadata:", v22, v25);

      -[HDObjectAuthorizationRequestContext setPersistSession:](v26, "setPersistSession:", 1);
      -[HDObjectAuthorizationRequestContext setPromptWithNoSamples:](v26, "setPromptWithNoSamples:", 1);
      -[HDQueryServer delegate](self, "delegate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "queryServer:requestsAuthorizationWithContext:completion:", self, v26, v21);

    }
    v19 = 0;
    v16 = v29;
  }

}

void __53__HDVerifiableClinicalRecordQueryServer__queue_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "queryUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v6, "client_deliverVerifiableClinicalRecords:queryUUID:", v8, v7);
  else
    objc_msgSend(v6, "client_deliverError:forQuery:", v5, v7);

}

- (NSArray)recordTypes
{
  return self->_recordTypes;
}

- (NSArray)sourceTypes
{
  return self->_sourceTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceTypes, 0);
  objc_storeStrong((id *)&self->_recordTypes, 0);
}

@end
