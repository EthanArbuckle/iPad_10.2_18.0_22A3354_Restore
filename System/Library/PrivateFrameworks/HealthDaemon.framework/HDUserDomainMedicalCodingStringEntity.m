@implementation HDUserDomainMedicalCodingStringEntity

+ (id)databaseTable
{
  return CFSTR("user_domain_medical_coding_strings");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 2;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_27;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)persistentIDForString:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "protectedDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__55;
  v24 = __Block_byref_object_dispose__55;
  v25 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __81__HDUserDomainMedicalCodingStringEntity_persistentIDForString_transaction_error___block_invoke_2;
  v18[3] = &unk_1E6CE9508;
  v11 = v7;
  v19 = v11;
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __81__HDUserDomainMedicalCodingStringEntity_persistentIDForString_transaction_error___block_invoke_3;
  v17[3] = &unk_1E6CE8540;
  v17[4] = &v20;
  if ((objc_msgSend(v9, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &persistentIDForString_transaction_error__lookupKey, a5, &__block_literal_global_61, v18, v17) & 1) != 0)
  {
    v12 = (void *)v21[5];
    if (v12)
    {
      v13 = v12;
    }
    else
    {
      v15[0] = v10;
      v15[1] = 3221225472;
      v15[2] = __81__HDUserDomainMedicalCodingStringEntity_persistentIDForString_transaction_error___block_invoke_5;
      v15[3] = &unk_1E6CE9508;
      v16 = v11;
      if (objc_msgSend(v9, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &persistentIDForString_transaction_error__insertKey, a5, &__block_literal_global_200_1, v15, 0))
      {
        objc_msgSend(v9, "lastInsertRowID");
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }

    }
  }
  else
  {
    v13 = 0;
  }

  _Block_object_dispose(&v20, 8);
  return v13;
}

const __CFString *__81__HDUserDomainMedicalCodingStringEntity_persistentIDForString_transaction_error___block_invoke()
{
  return CFSTR("SELECT ROWID FROM user_domain_medical_coding_strings WHERE string = ?");
}

uint64_t __81__HDUserDomainMedicalCodingStringEntity_persistentIDForString_transaction_error___block_invoke_2()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __81__HDUserDomainMedicalCodingStringEntity_persistentIDForString_transaction_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  MEMORY[0x1BCCAB1C8](a2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 1;
}

const __CFString *__81__HDUserDomainMedicalCodingStringEntity_persistentIDForString_transaction_error___block_invoke_4()
{
  return CFSTR("INSERT INTO user_domain_medical_coding_strings (string) VALUES (?)");
}

uint64_t __81__HDUserDomainMedicalCodingStringEntity_persistentIDForString_transaction_error___block_invoke_5()
{
  return HDSQLiteBindFoundationValueToStatement();
}

+ (id)stringForPersistentID:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "protectedDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__55;
  v22 = __Block_byref_object_dispose__55;
  v23 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __81__HDUserDomainMedicalCodingStringEntity_stringForPersistentID_transaction_error___block_invoke_2;
  v16[3] = &unk_1E6CE9508;
  v11 = v7;
  v17 = v11;
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __81__HDUserDomainMedicalCodingStringEntity_stringForPersistentID_transaction_error___block_invoke_3;
  v15[3] = &unk_1E6CE8540;
  v15[4] = &v18;
  if (objc_msgSend(v9, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &stringForPersistentID_transaction_error__statementKey, a5, &__block_literal_global_203, v16, v15))
  {
    v12 = (void *)v19[5];
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 118, CFSTR("String not found for persistentID %@"), v11);
      v12 = (void *)v19[5];
    }
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  _Block_object_dispose(&v18, 8);
  return v13;
}

const __CFString *__81__HDUserDomainMedicalCodingStringEntity_stringForPersistentID_transaction_error___block_invoke()
{
  return CFSTR("SELECT string FROM user_domain_medical_coding_strings WHERE ROWID = ?");
}

uint64_t __81__HDUserDomainMedicalCodingStringEntity_stringForPersistentID_transaction_error___block_invoke_2()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __81__HDUserDomainMedicalCodingStringEntity_stringForPersistentID_transaction_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  MEMORY[0x1BCCAB1D4](a2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 1;
}

+ (BOOL)enumerateMedicalCodingStringsWithPredicate:(id)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
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
  v16[2] = __121__HDUserDomainMedicalCodingStringEntity_enumerateMedicalCodingStringsWithPredicate_transaction_error_enumerationHandler___block_invoke;
  v16[3] = &unk_1E6CE84F0;
  v17 = v10;
  v14 = v10;
  LOBYTE(a5) = objc_msgSend(v13, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", &unk_1E6DF8D38, a5, v16);

  return (char)a5;
}

uint64_t __121__HDUserDomainMedicalCodingStringEntity_enumerateMedicalCodingStringsWithPredicate_transaction_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  uint64_t v6;

  MEMORY[0x1BCCAB1D4](a4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v6;
}

@end
