@implementation HDMedicationUserDomainConceptEntity

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 1;
  return (const $BAB52C3E828CEF64050DB2B91BCCE94A *)columnDefinitionsWithCount__columnDefinitions;
}

+ (id)privateDataEntities
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)databaseTable
{
  return CFSTR("medication_user_domain_concepts");
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("udc_id");
  objc_msgSend(MEMORY[0x1E0D295B0], "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _HDMedicationUserDomainConceptEntityEncoder *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = -[HDEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:]([_HDMedicationUserDomainConceptEntityEncoder alloc], "initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:", objc_opt_class(), v14, v13, a5, v12, v11);

  return v15;
}

+ (id)privateSubEntities
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (BOOL)insertConcreteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  void *v8;
  _QWORD v10[5];

  objc_msgSend(a5, "protectedDatabase", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __109__HDMedicationUserDomainConceptEntity_insertConcreteUserDomainConcept_userDomainConceptID_transaction_error___block_invoke_2;
  v10[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v10[4] = a4;
  LOBYTE(a6) = objc_msgSend(v8, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &insertConcreteUserDomainConcept_userDomainConceptID_transaction_error__statementKey, a6, &__block_literal_global_0, v10, 0);

  return (char)a6;
}

const __CFString *__109__HDMedicationUserDomainConceptEntity_insertConcreteUserDomainConcept_userDomainConceptID_transaction_error___block_invoke()
{
  return CFSTR("INSERT OR REPLACE INTO medication_user_domain_concepts (udc_id) VALUES (?)");
}

uint64_t __109__HDMedicationUserDomainConceptEntity_insertConcreteUserDomainConcept_userDomainConceptID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

+ (BOOL)updateConcreteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  return 1;
}

+ (BOOL)willDeleteConcreteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 syncProvenance:(int64_t)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
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
  _BOOL4 v29;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = a7;
  objc_msgSend(v12, "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dataManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_class();
  HDMedicationDoseEventEntityPredicateForMedicationUUID();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = objc_msgSend(v16, "deleteDataObjectsOfClass:predicate:limit:deletedSampleCount:notifyObservers:generateDeletedObjects:recursiveDeleteAuthorizationBlock:error:", v17, v18, *MEMORY[0x1E0D29968], 0, 1, 1, 0, a8);

  if ((_DWORD)v17
    && +[HDMedicationScheduleEntity updateMedicationSchedulesToBeDeletedWithMedicationUUID:profile:transaction:error:](HDMedicationScheduleEntity, "updateMedicationSchedulesToBeDeletedWithMedicationUUID:profile:transaction:error:", v15, v13, v14, a8))
  {
    objc_msgSend(v13, "healthMedicationsProfileExtension");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "medicationScheduleManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "rescheduleMedicationsSynchronously:", a5 == 0);
    objc_msgSend(v12, "firstConceptIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
      goto LABEL_6;
    objc_msgSend(v12, "firstConceptIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    HDDismissedDrugInteractionResultPredicateForDrugClassAncestorIdentifier(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "database");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v22) = +[HDHealthEntity deleteEntitiesWithPredicate:healthDatabase:error:](HDDismissedDrugInteractionResultEntity, "deleteEntitiesWithPredicate:healthDatabase:error:", v23, v24, a8);

    if (!(_DWORD)v22)
    {

      LOBYTE(v29) = 0;
      goto LABEL_9;
    }
    objc_msgSend(v12, "firstConceptIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    HDDismissedPregnancyLactationInteractionPredicateForMedicationIdentifiersAndInteractionTypes(v26, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "database");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = +[HDHealthEntity deleteEntitiesWithPredicate:healthDatabase:error:](HDDismissedPregnancyLactationInteractionEntity, "deleteEntitiesWithPredicate:healthDatabase:error:", v27, v28, a8);

    if (v29)
LABEL_6:
      LOBYTE(v29) = 1;
LABEL_9:

    goto LABEL_10;
  }
  LOBYTE(v29) = 0;
LABEL_10:

  return v29;
}

+ (Class)userDomainConceptClass
{
  return (Class)objc_opt_class();
}

+ (Class)userDomainConceptSemanticIdentifierClass
{
  return (Class)objc_opt_class();
}

+ (id)predicateMatchingSemanticIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HDUserDomainConceptEntityPredicateForConceptUUID();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0D29840];
    objc_msgSend(v3, "typeIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HDUserDomainConceptEntityPredicateForConceptsWithTypeIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    objc_msgSend(v3, "medicalCoding");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HDUserDomainConceptEntityPredicateForMedicalCoding();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicateMatchingAllPredicates:", v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (id)newUserDomainConceptForRefreshWithCodingCollection:(id)a3 propertyCollection:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x1E0D2C4D8];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithCodingCollection:supplementalPropertyCollection:", v7, v6);

  return v8;
}

+ (BOOL)encodesCodableUserDomainConceptSubclassData
{
  return 0;
}

+ (BOOL)supportsHidingSemanticDuplicates
{
  return 1;
}

+ (BOOL)generateAPIObjectForUserDomainConcept:(id)a3 apiObjectOut:(id *)a4 transaction:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v37;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "displayNameComponents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "loggingUnit");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x1E0CB68B8]);
  objc_msgSend(v8, "semanticIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "initWithSemanticIdentifierString:", v14);

  v16 = objc_alloc(MEMORY[0x1E0CB63B0]);
  objc_msgSend(v10, "fullDisplayName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  v19 = (void *)objc_msgSend(v16, "initWithText:codings:", v17, v18);

  v20 = (void *)v11;
  v21 = v9;

  v22 = objc_alloc(MEMORY[0x1E0CB6880]);
  v23 = (void *)v15;
  v24 = v15;
  v25 = v10;
  v26 = (void *)objc_msgSend(v22, "initWithIdentifier:displayNameComponents:loggingUnit:components:codingCollection:", v24, v10, v20, MEMORY[0x1E0C9AA60], v19);
  v27 = (void *)+[HDMedicationUserDomainConceptEntity _isMedicationArchived:transaction:error:]((uint64_t)a1, v8, v21, (uint64_t)a6);
  if (v27)
  {
    v28 = +[HDMedicationUserDomainConceptEntity _isMedicationScheduled:transaction:error:]((uint64_t)a1, v8, v21, (uint64_t)a6);
    if (v28)
    {
      v29 = v28;
      v30 = v25;
      v37 = v21;
      v31 = v20;
      v32 = (void *)MEMORY[0x1E0CB6D60];
      objc_msgSend(v8, "userSpecifiedName");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "userTrackedMedicationWithNickname:isArchived:hasSchedule:medication:device:", v33, v27 == (void *)1, v29 == 1, v26, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (a4)
        *a4 = objc_retainAutorelease(v27);

      LOBYTE(v27) = 1;
      v20 = v31;
      v21 = v37;
      v25 = v30;
    }
    else
    {
      LOBYTE(v27) = 0;
    }
  }

  return (char)v27;
}

+ (uint64_t)_isMedicationArchived:(void *)a3 transaction:(uint64_t)a4 error:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v6 = a3;
  v7 = a2;
  objc_opt_self();
  v8 = (void *)MEMORY[0x1E0D29840];
  objc_msgSend(v7, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  HDUserDomainConceptEntityPredicateForConceptUUID();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D295B8], "predicateForElementsOfListType:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "compoundPredicateWithPredicate:otherPredicate:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D295B8], "countOfUserDomainConceptsMatchingPredicate:options:transaction:error:", v12, 0, v6, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    if (objc_msgSend(v13, "intValue"))
      v14 = 2;
    else
      v14 = 1;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (uint64_t)_isMedicationScheduled:(void *)a3 transaction:(uint64_t)a4 error:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v6 = a3;
  v7 = a2;
  objc_opt_self();
  v8 = (void *)MEMORY[0x1E0D29840];
  HDMedicationSchedulePredicateForDeleted(0, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "semanticIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HDMedicationSchedulePredicateForMedicationIdentifier((uint64_t)v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "compoundPredicateWithPredicate:otherPredicate:", v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "protectedDatabase");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDSQLiteEntity countDistinctForProperty:predicate:database:error:](HDMedicationScheduleEntity, "countDistinctForProperty:predicate:database:error:", CFSTR("uuid"), v13, v14, a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    if ((int)objc_msgSend(v15, "intValue") > 0)
      v16 = 1;
    else
      v16 = 2;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)predicateMatchingSemanticDuplicatesOf:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "firstOntologyCoding");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (HDUserDomainConceptEntityPredicateForMedicalCoding(), (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = (void *)v5;
    v20 = (void *)MEMORY[0x1E0D29840];
    v7 = (void *)MEMORY[0x1E0D29838];
    v8 = *MEMORY[0x1E0D293E0];
    objc_msgSend(v3, "UUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicateWithProperty:notEqualToValue:", v8, v21);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v9;
    v10 = (void *)MEMORY[0x1E0D29838];
    v11 = *MEMORY[0x1E0D293D8];
    v12 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "semanticIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "typeIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v14, "code"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "predicateWithProperty:equalToValue:", v11, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v16;
    v22[2] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "predicateMatchingAllPredicates:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

+ (id)deduplicateUserDomainConcept:(id)a3 with:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  return +[HDUserDomainConceptCollapser collapseUserDomainConcept:with:profile:transaction:error:](HDMedicationUserDomainConceptCollapser, "collapseUserDomainConcept:with:profile:transaction:error:", a3, a4, a5, a6, a7);
}

+ (id)refreshOntologyContentForUserDomainConcept:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;

  v10 = a4;
  v11 = a5;
  v12 = a3;
  v13 = objc_msgSend(a1, "evaluateIsCanonicalConcept:entityClass:transaction:error:", v12, a1, v11, a6);
  if (v13 == 1)
  {
    +[HDUserDomainConceptOntologyContentRefresher refreshOntologyContentForUserDomainConcept:profile:transaction:error:](HDMedicationUserDomainConceptGenerator, "refreshOntologyContentForUserDomainConcept:profile:transaction:error:", v12, v10, v11, a6);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v13 == 2)
      v15 = v12;
    else
      v15 = 0;
    v14 = v15;
  }
  v16 = v14;

  return v16;
}

@end
