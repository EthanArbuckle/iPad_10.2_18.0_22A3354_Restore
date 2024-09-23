@implementation HDMedicationControlTaskServer

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E0D2C518];
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0D2C440], "serverInterface");
}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0D2C440], "clientInterface");
}

- (void)remote_updateLocalDeviceValuesNowWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, id);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  v4 = (void (**)(id, uint64_t, id))a3;
  -[HDStandardTaskServer profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "healthMedicationsProfileExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceScopedStorageManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  v8 = objc_msgSend(v7, "updateLocalDeviceValuesNowWithError:", &v10);
  v9 = v10;
  v4[2](v4, v8, v9);

}

- (void)remote_accountDevicesInfoTriggeringUpdate:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, void *, id);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v4 = a3;
  v6 = (void (**)(id, void *, id))a4;
  -[HDStandardTaskServer profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "healthMedicationsProfileExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deviceScopedStorageManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  objc_msgSend(v9, "accountDevicesInfoTriggeringUpdate:error:", v4, &v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v12;
  v6[2](v6, v10, v11);

}

- (void)remote_markDrugInteractionAsDismissed:(id)a3 completion:(id)a4
{
  objc_class *v6;
  void (**v7)(id, _BOOL8, id);
  id v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  id v12;
  id v13;

  v6 = (objc_class *)MEMORY[0x1E0D2C400];
  v7 = (void (**)(id, _BOOL8, id))a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "_initWithDrugInteractionResult:", v8);

  -[HDStandardTaskServer profile](self, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v11 = +[HDDismissedDrugInteractionResultEntity insertDismissedDrugInteractionResult:profile:error:](HDDismissedDrugInteractionResultEntity, "insertDismissedDrugInteractionResult:profile:error:", v9, v10, &v13);
  v12 = v13;

  v7[2](v7, v11, v12);
}

- (void)remote_allDismissedDrugInteractionsWithCompletion:(id)a3
{
  objc_class *v4;
  void (**v5)(id, _QWORD, id);
  id v6;
  void *v7;
  void *v8;
  id v9;
  _BOOL4 v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = (void (**)(id, _QWORD, id))a3;
  v6 = objc_alloc_init(v4);
  -[HDStandardTaskServer profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v6;
  v15 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __83__HDMedicationControlTaskServer_remote_allDismissedDrugInteractionsWithCompletion___block_invoke;
  v13[3] = &unk_1E6DFFFA8;
  v9 = v6;
  v10 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDDismissedDrugInteractionResultEntity, "performReadTransactionWithHealthDatabase:error:block:", v8, &v15, v13);
  v11 = v15;

  if (v10)
    v12 = v9;
  else
    v12 = 0;
  ((void (**)(id, id, id))v5)[2](v5, v12, v11);

}

BOOL __83__HDMedicationControlTaskServer_remote_allDismissedDrugInteractionsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _BOOL8 v5;
  _QWORD v7[4];
  id v8;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__HDMedicationControlTaskServer_remote_allDismissedDrugInteractionsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E6DFFF80;
  v8 = *(id *)(a1 + 32);
  v5 = +[HDDismissedDrugInteractionResultEntity enumerateDismissedDrugInteractionResultsWithPredicate:transaction:error:enumerationHandler:](HDDismissedDrugInteractionResultEntity, "enumerateDismissedDrugInteractionResultsWithPredicate:transaction:error:enumerationHandler:", 0, a2, a3, v7);

  return v5;
}

uint64_t __83__HDMedicationControlTaskServer_remote_allDismissedDrugInteractionsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

- (void)remote_deleteDismissedDrugInteractionsForMedication:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, _BOOL8, id);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  id v15;
  id v16;

  v7 = a3;
  v8 = (void (**)(id, _BOOL8, id))a4;
  objc_msgSend(v7, "firstConceptIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v7, "firstConceptIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HDDismissedDrugInteractionResultPredicateForDrugClassAncestorIdentifier(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDStandardTaskServer profile](self, "profile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "database");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v14 = +[HDHealthEntity deleteEntitiesWithPredicate:healthDatabase:error:](HDDismissedDrugInteractionResultEntity, "deleteEntitiesWithPredicate:healthDatabase:error:", v11, v13, &v16);
    v15 = v16;

    v8[2](v8, v14, v15);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("%@: medication.firstConceptIdentifier must not be nil"), self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v11);
  }

}

- (void)remote_markPregnancyLactationInteractionForMedicationAsDismissed:(id)a3 interactionType:(int64_t)a4 completion:(id)a5
{
  objc_class *v8;
  void (**v9)(id, _BOOL8, id);
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  id v17;
  id v18;

  v8 = (objc_class *)MEMORY[0x1E0D2C408];
  v9 = (void (**)(id, _BOOL8, id))a5;
  v10 = a3;
  v11 = [v8 alloc];
  objc_msgSend(v10, "firstConceptIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "_initWithMedicationIdentifier:interactionType:creationDate:", v12, a4, v13);

  -[HDStandardTaskServer profile](self, "profile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v16 = +[HDDismissedPregnancyLactationInteractionEntity insertDismissedPregnancyLactationInteraction:profile:error:](HDDismissedPregnancyLactationInteractionEntity, "insertDismissedPregnancyLactationInteraction:profile:error:", v14, v15, &v18);
  v17 = v18;

  v9[2](v9, v16, v17);
}

- (void)remote_allDismissedPregnancyLactationInteractionsWithCompletion:(id)a3
{
  objc_class *v4;
  void (**v5)(id, _QWORD, id);
  id v6;
  void *v7;
  void *v8;
  id v9;
  _BOOL4 v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = (void (**)(id, _QWORD, id))a3;
  v6 = objc_alloc_init(v4);
  -[HDStandardTaskServer profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v6;
  v15 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __97__HDMedicationControlTaskServer_remote_allDismissedPregnancyLactationInteractionsWithCompletion___block_invoke;
  v13[3] = &unk_1E6DFFFA8;
  v9 = v6;
  v10 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDDismissedPregnancyLactationInteractionEntity, "performReadTransactionWithHealthDatabase:error:block:", v8, &v15, v13);
  v11 = v15;

  if (v10)
    v12 = v9;
  else
    v12 = 0;
  ((void (**)(id, id, id))v5)[2](v5, v12, v11);

}

BOOL __97__HDMedicationControlTaskServer_remote_allDismissedPregnancyLactationInteractionsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _BOOL8 v5;
  _QWORD v7[4];
  id v8;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __97__HDMedicationControlTaskServer_remote_allDismissedPregnancyLactationInteractionsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E6DFFFD0;
  v8 = *(id *)(a1 + 32);
  v5 = +[HDDismissedPregnancyLactationInteractionEntity enumerateDismissedPregnancyLactationInteractionsWithPredicate:transaction:error:enumerationHandler:](HDDismissedPregnancyLactationInteractionEntity, "enumerateDismissedPregnancyLactationInteractionsWithPredicate:transaction:error:enumerationHandler:", 0, a2, a3, v7);

  return v5;
}

uint64_t __97__HDMedicationControlTaskServer_remote_allDismissedPregnancyLactationInteractionsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

- (void)remote_deleteDismissedPregnancyLactationInteractionsForMedication:(id)a3 interactionTypes:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, _BOOL8, id);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, _BOOL8, id))a5;
  objc_msgSend(v9, "firstConceptIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v9, "firstConceptIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HDDismissedPregnancyLactationInteractionPredicateForMedicationIdentifiersAndInteractionTypes(v14, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDStandardTaskServer profile](self, "profile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "database");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v18 = +[HDHealthEntity deleteEntitiesWithPredicate:healthDatabase:error:](HDDismissedPregnancyLactationInteractionEntity, "deleteEntitiesWithPredicate:healthDatabase:error:", v15, v17, &v21);
    v19 = v21;

    v11[2](v11, v18, v19);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("%@: medication.firstConceptIdentifier must not be nil"), self);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v20);

  }
}

@end
