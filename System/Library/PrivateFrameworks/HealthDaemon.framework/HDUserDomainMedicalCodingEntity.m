@implementation HDUserDomainMedicalCodingEntity

+ (id)databaseTable
{
  return CFSTR("user_domain_medical_codings");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 6;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_58;
}

+ (id)uniquedColumns
{
  return &unk_1E6DF9AD0;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("udc_id");
  +[HDUserDomainConceptEntity defaultForeignKey](HDUserDomainConceptEntity, "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  v9[1] = CFSTR("system");
  +[HDHealthEntity defaultForeignKey](HDUserDomainMedicalCodingStringEntity, "defaultForeignKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v3;
  v9[2] = CFSTR("code");
  +[HDHealthEntity defaultForeignKey](HDUserDomainMedicalCodingStringEntity, "defaultForeignKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v4;
  v9[3] = CFSTR("version");
  +[HDHealthEntity defaultForeignKey](HDUserDomainMedicalCodingStringEntity, "defaultForeignKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v5;
  v9[4] = CFSTR("display_string");
  +[HDHealthEntity defaultForeignKey](HDUserDomainMedicalCodingStringEntity, "defaultForeignKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)triggers
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  +[HDUserDomainMedicalCodingStringEntity databaseTable](HDUserDomainMedicalCodingStringEntity, "databaseTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D29618];
  objc_msgSend(a1, "databaseTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDUserDomainMedicalCodingStringEntity databaseTable](HDUserDomainMedicalCodingStringEntity, "databaseTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE (%@ IN (OLD.%@, OLD.%@, OLD.%@, OLD.%@) AND NOT EXISTS (SELECT 1 FROM %@ WHERE %@.%@ IN (%@, %@, %@, %@)))"), v4, v5, CFSTR("system"), CFSTR("code"), CFSTR("version"), CFSTR("display_string"), v6, v7, v5, CFSTR("system"), CFSTR("code"), CFSTR("version"), CFSTR("display_string"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D298C0]), "initWithEntity:name:triggerEvent:predicateString:triggerString:", objc_opt_class(), CFSTR("string_garbage_collection"), 0, 0, v8);
  v12[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)joinClausesForProperty:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  objc_super v16;

  v5 = a3;
  objc_msgSend(&unk_1E6DFEF50, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count") != 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDUserDomainMedicalCodingEntity.m"), 131, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[components count] == 2"));

    }
    v8 = (void *)MEMORY[0x1E0D29870];
    objc_msgSend(a1, "disambiguatedDatabaseTable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    objc_msgSend(v7, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leftJoinClauseFromTable:toTargetEntity:as:localReference:targetKey:", v9, v10, v11, v6, *MEMORY[0x1E0D29618]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16.receiver = a1;
    v16.super_class = (Class)&OBJC_METACLASS___HDUserDomainMedicalCodingEntity;
    objc_msgSendSuper2(&v16, sel_joinClausesForProperty_, v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

+ (id)privateSubEntities
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (BOOL)insertDataForUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  id v17;
  void *v18;
  BOOL v19;
  id v20;
  void *v21;
  id *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  int v32;
  BOOL v33;
  void *v34;
  id v36;
  id obj;
  id *v38;
  id v39;
  uint64_t v40;
  uint64_t v42;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  id v52;
  int64_t v53;
  id v54;
  id v55;
  id v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "protectedDatabase");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  objc_msgSend(v8, "codingCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "codings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v11;
  v40 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
  if (!v40)
  {
    v33 = 1;
    goto LABEL_23;
  }
  v42 = *(_QWORD *)v59;
  v38 = a6;
  v39 = v9;
  v36 = v8;
  while (2)
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v59 != v42)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v12);
      objc_msgSend(v13, "codingSystem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = 0;
      v16 = +[HDUserDomainMedicalCodingEntity _getPersistentIDForString:transaction:result:error:]((uint64_t)a1, v15, v9, &v57, (uint64_t)a6);
      v17 = v57;
      if (!v16)
      {
        v20 = 0;
LABEL_19:

        v27 = 0;
        v34 = 0;
        v8 = v36;
LABEL_21:

        v33 = 0;
        goto LABEL_23;
      }
      v45 = v12;
      objc_msgSend(v13, "code");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = 0;
      v19 = +[HDUserDomainMedicalCodingEntity _getPersistentIDForString:transaction:result:error:]((uint64_t)a1, v18, v9, &v56, (uint64_t)a6);
      v20 = v56;
      if (!v19)
      {

        goto LABEL_19;
      }
      v47 = v17;
      objc_msgSend(v13, "codingVersion");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = 0;
      v22 = a6;
      v23 = +[HDUserDomainMedicalCodingEntity _getPersistentIDForString:transaction:result:error:]((uint64_t)a1, v21, v9, &v55, (uint64_t)a6);
      v46 = v55;
      if (v23)
      {
        objc_msgSend(v13, "displayString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v9;
        v26 = v24;
        v54 = 0;
        v23 = +[HDUserDomainMedicalCodingEntity _getPersistentIDForString:transaction:result:error:]((uint64_t)a1, v24, v25, &v54, (uint64_t)v22);
        v27 = v54;

      }
      else
      {
        v27 = 0;
      }
      v17 = v47;

      if (!v23)
      {
        v8 = v36;
        v9 = v39;
        v34 = v46;
        goto LABEL_21;
      }
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __104__HDUserDomainMedicalCodingEntity_insertDataForUserDomainConcept_userDomainConceptID_transaction_error___block_invoke_2;
      v48[3] = &unk_1E6CFC248;
      v53 = a4;
      v28 = v47;
      v49 = v28;
      v29 = v20;
      v50 = v29;
      v30 = v46;
      v51 = v30;
      v31 = v27;
      v52 = v31;
      a6 = v38;
      v32 = objc_msgSend(v44, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &insertDataForUserDomainConcept_userDomainConceptID_transaction_error__statementKey_1, v38, &__block_literal_global_131, v48, 0);

      if (!v32)
      {
        v33 = 0;
        v8 = v36;
        v9 = v39;
        goto LABEL_23;
      }
      v12 = v45 + 1;
      v9 = v39;
    }
    while (v40 != v45 + 1);
    v33 = 1;
    v8 = v36;
    v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
    if (v40)
      continue;
    break;
  }
LABEL_23:

  return v33;
}

+ (BOOL)_getPersistentIDForString:(void *)a3 transaction:(_QWORD *)a4 result:(uint64_t)a5 error:
{
  __CFString *v8;
  id v9;
  __CFString *v10;
  void *v11;
  id v12;
  _BOOL8 v13;

  v8 = a2;
  v9 = a3;
  objc_opt_self();
  if (v8)
    v10 = v8;
  else
    v10 = CFSTR("(null)");
  +[HDUserDomainMedicalCodingStringEntity persistentIDForString:transaction:error:](HDUserDomainMedicalCodingStringEntity, "persistentIDForString:transaction:error:", v10, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_retainAutorelease(v11);
  *a4 = v12;
  v13 = v12 != 0;

  return v13;
}

const __CFString *__104__HDUserDomainMedicalCodingEntity_insertDataForUserDomainConcept_userDomainConceptID_transaction_error___block_invoke()
{
  return CFSTR("INSERT OR REPLACE INTO user_domain_medical_codings (udc_id, system, code, version, display_string) VALUES (?, ?, ?, ?, ?)");
}

uint64_t __104__HDUserDomainMedicalCodingEntity_insertDataForUserDomainConcept_userDomainConceptID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 64));
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  return HDSQLiteBindFoundationValueToStatement();
}

+ (BOOL)retrieveDataForUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 mutableUserDomainConceptProperties:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v11;
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;

  v11 = a3;
  v12 = (objc_class *)MEMORY[0x1E0C99DE8];
  v13 = a6;
  v14 = objc_alloc_init(v12);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __141__HDUserDomainMedicalCodingEntity_retrieveDataForUserDomainConcept_userDomainConceptID_mutableUserDomainConceptProperties_transaction_error___block_invoke;
  v21[3] = &unk_1E6CFC270;
  v15 = v14;
  v22 = v15;
  v16 = +[HDUserDomainMedicalCodingEntity _enumerateMedicalCodingsWithUserDomainConceptID:transaction:error:enumerationHandler:]((uint64_t)a1, a4, v13, (uint64_t)a7, v21);

  if (v16)
  {
    if (objc_msgSend(v15, "count"))
    {
      v17 = (void *)MEMORY[0x1E0CB6830];
      v18 = (void *)objc_msgSend(v15, "copy");
      objc_msgSend(v17, "collectionWithCodings:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v19 = 0;
    }
    objc_msgSend(v11, "_setCodingCollection:", v19);

  }
  return v16;
}

uint64_t __141__HDUserDomainMedicalCodingEntity_retrieveDataForUserDomainConcept_userDomainConceptID_mutableUserDomainConceptProperties_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

+ (uint64_t)_enumerateMedicalCodingsWithUserDomainConceptID:(void *)a3 transaction:(uint64_t)a4 error:(void *)a5 enumerationHandler:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_opt_self();
  v11 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateWithProperty:equalToValue:", CFSTR("udc_id"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v10, "enumerateMedicalCodingsWithPredicate:transaction:error:enumerationHandler:", v13, v9, a4, v8);
  return v14;
}

+ (BOOL)willDeleteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 syncProvenance:(int64_t)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8
{
  return 1;
}

+ (BOOL)addPropertyDataToCodable:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v10 = a3;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __98__HDUserDomainMedicalCodingEntity_addPropertyDataToCodable_userDomainConceptID_transaction_error___block_invoke;
  v13[3] = &unk_1E6CFC270;
  v14 = v10;
  v11 = v10;
  LOBYTE(a6) = +[HDUserDomainMedicalCodingEntity _enumerateMedicalCodingsWithUserDomainConceptID:transaction:error:enumerationHandler:]((uint64_t)a1, a4, a5, (uint64_t)a6, v13);

  return (char)a6;
}

uint64_t __98__HDUserDomainMedicalCodingEntity_addPropertyDataToCodable_userDomainConceptID_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "codableRepresentationForSync");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addCodings:", v3);

  return 1;
}

+ (BOOL)enumerateMedicalCodingsWithPredicate:(id)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;

  v10 = a6;
  v11 = a3;
  objc_msgSend(a4, "databaseForEntityClass:", a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "queryWithDatabase:predicate:", v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __109__HDUserDomainMedicalCodingEntity_enumerateMedicalCodingsWithPredicate_transaction_error_enumerationHandler___block_invoke;
  v16[3] = &unk_1E6CE84F0;
  v17 = v10;
  v14 = v10;
  LOBYTE(a5) = objc_msgSend(v13, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", &unk_1E6DF9AE8, a5, v16);

  return (char)a5;
}

uint64_t __109__HDUserDomainMedicalCodingEntity_enumerateMedicalCodingsWithPredicate_transaction_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v22;

  MEMORY[0x1BCCAB1D4](a4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB1D4](a4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB1D4](a4, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB1D4](a4, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v5;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("(null)")))
    v9 = 0;
  else
    v9 = v5;
  v10 = v9;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("(null)")))
    v11 = 0;
  else
    v11 = v6;
  v12 = v11;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("(null)")))
    v13 = 0;
  else
    v13 = v7;
  v14 = v13;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("(null)")))
    v15 = 0;
  else
    v15 = v8;
  v16 = v15;
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB6838], "codeSystemWithIdentifier:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB6828], "medicalCodingWithSystem:codingVersion:code:displayString:", v17, v14, v12, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v19;
}

@end
