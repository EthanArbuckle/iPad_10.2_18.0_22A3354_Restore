@implementation HDDatabaseControlServer

- (void)remote_getHealthDatabaseIdentifierWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v4 = (void (**)(id, uint64_t, uint64_t))a3;
  -[HDStandardTaskServer profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v6, "databaseUUIDWithError:", &v9);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (uint64_t)v9;

  if (!(v7 | v8))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 11, CFSTR("No identifier found; protected data may not exist."));
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v4[2](v4, v7, v8);

}

- (void)remote_getHealthDirectorySizeInBytesWithCompletion:(id)a3
{
  void (**v4)(id, id, _QWORD);
  void *v5;
  void *v6;
  id v7;

  v4 = (void (**)(id, id, _QWORD))a3;
  -[HDStandardTaskServer profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "daemon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "healthDirectorySizeInBytes");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v4[2](v4, v7, 0);
}

- (void)remote_obliterateHealthDataWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v6 = a4;
  -[HDStandardTaskServer client](self, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0CB56D8];
  v21 = 0;
  v9 = objc_msgSend(v7, "hasRequiredEntitlement:error:", v8, &v21);
  v10 = v21;

  if (v9)
  {
    -[HDStandardTaskServer client](self, "client");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "process");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v12, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("Requested by \"%@\" (%d)"), v14, objc_msgSend(v12, "processIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDStandardTaskServer profile](self, "profile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "daemon");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __77__HDDatabaseControlServer_remote_obliterateHealthDataWithOptions_completion___block_invoke;
    v18[3] = &unk_1E6CE8C48;
    v19 = 0;
    v20 = v6;
    objc_msgSend(v17, "obliterateAndTerminateWithOptions:reason:completion:", a3, v15, v18);

  }
  else if (v6)
  {
    (*((void (**)(id, _QWORD, id))v6 + 2))(v6, 0, v10);
  }

}

uint64_t __77__HDDatabaseControlServer_remote_obliterateHealthDataWithOptions_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)remote_performMigrationWithCompletion:(id)a3
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
  objc_msgSend(v5, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDatabaseTransactionContext contextForWritingProtectedData](HDDatabaseTransactionContext, "contextForWritingProtectedData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v8 = objc_msgSend(v6, "performTransactionWithContext:error:block:inaccessibilityHandler:", v7, &v10, &__block_literal_global_5, 0);
  v9 = v10;

  v4[2](v4, v8, v9);
}

uint64_t __65__HDDatabaseControlServer_remote_performMigrationWithCompletion___block_invoke()
{
  return 1;
}

- (void)remote_hkqa_generateDemoDataWithDurationInDays:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  HDDemoDataGenerator *v8;
  void *v9;
  HDDemoDataGenerator *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v6 = a4;
  HKCreateSerialDispatchQueue();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [HDDemoDataGenerator alloc];
  -[HDStandardTaskServer profile](self, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HDDemoDataGenerator initWithProfile:queue:](v8, "initWithProfile:queue:", v9, v7);

  -[HDDemoDataGenerator configuration](v10, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setGenerationPeriodInDays:", a3);
  +[HDDemoDataPerson defaultPersonWithBiologicalSex:](HDDemoDataPerson, "defaultPersonWithBiologicalSex:", objc_msgSend(v11, "biologicalSex"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDemoDataGenerator gregorianCalendar](v10, "gregorianCalendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "birthDateComponents");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dateFromComponents:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBirthDate:", v15);

  objc_msgSend(v12, "setNutritionTrackingType:", objc_msgSend(v11, "nutritionTrackingType"));
  objc_msgSend(v12, "setResultsTrackingType:", objc_msgSend(v11, "resultsTrackingType"));
  objc_msgSend(v12, "applyProfileType:", objc_msgSend(v11, "profileType"));
  objc_msgSend(v12, "setHighFidelityGeneration:", objc_msgSend(v11, "highFidelityGeneration"));
  -[HDDemoDataGenerator setDemoPerson:](v10, "setDemoPerson:", v12);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __85__HDDatabaseControlServer_remote_hkqa_generateDemoDataWithDurationInDays_completion___block_invoke;
  v18[3] = &unk_1E6CE8CB0;
  v19 = v6;
  v17 = v6;
  -[HDDemoDataGenerator generateThroughEndDate:completion:](v10, "generateThroughEndDate:completion:", v16, v18);

}

uint64_t __85__HDDatabaseControlServer_remote_hkqa_generateDemoDataWithDurationInDays_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __67__HDDatabaseControlServer__querySampleCount_withTransaction_error___block_invoke(uint64_t a1)
{
  **(_QWORD **)(a1 + 32) = HDSQLiteColumnAsInt64();
  return 1;
}

uint64_t __68__HDDatabaseControlServer__queryDistinctTypesWithTransaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = HDSQLiteColumnAsInt64();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  return 1;
}

uint64_t __66__HDDatabaseControlServer__queryTypeCounts_withTransaction_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB6A70], "_quantityTypeWithCode:", objc_msgSend(*(id *)(a1 + 32), "integerValue"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", HDSQLiteColumnAsInt64());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v3, v2);

  return 1;
}

uint64_t __66__HDDatabaseControlServer__queryTypeCounts_withTransaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

- (void)remote_hkqa_statisticsWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;
  id v12;
  _QWORD aBlock[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = (void (**)(id, _QWORD, id))a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__6;
  v18 = __Block_byref_object_dispose__6;
  v19 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__HDDatabaseControlServer_remote_hkqa_statisticsWithCompletion___block_invoke;
  aBlock[3] = &unk_1E6CE8D70;
  aBlock[4] = self;
  aBlock[5] = &v14;
  v5 = _Block_copy(aBlock);
  -[HDStandardTaskServer profile](self, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDatabaseTransactionContext contextForReadingProtectedData](HDDatabaseTransactionContext, "contextForReadingProtectedData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v9 = objc_msgSend(v7, "performTransactionWithContext:error:block:inaccessibilityHandler:", v8, &v12, v5, 0);
  v10 = v12;

  if (v9)
    v11 = v15[5];
  else
    v11 = 0;
  v4[2](v4, v11, v10);

  _Block_object_dispose(&v14, 8);
}

BOOL __64__HDDatabaseControlServer_remote_hkqa_statisticsWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  id v30;
  _BOOL8 v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t *v38;
  id v39;
  uint64_t v40;
  id obj;
  uint64_t v43;
  _QWORD v44[5];
  _QWORD v45[5];
  id v46;
  _QWORD v47[3];
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t aBlock;
  uint64_t v54;
  uint64_t (*v55)(uint64_t);
  void *v56;
  uint64_t *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v43 = 0;
  v40 = a1;
  if (!*(_QWORD *)(a1 + 32))
  {
    v31 = 0;
    goto LABEL_28;
  }
  aBlock = MEMORY[0x1E0C809B0];
  v54 = 3221225472;
  v55 = __67__HDDatabaseControlServer__querySampleCount_withTransaction_error___block_invoke;
  v56 = &__block_descriptor_40_e26_B24__0__HDSQLiteRow__8__16l;
  v57 = &v43;
  v39 = v4;
  v5 = v4;
  v6 = _Block_copy(&aBlock);
  objc_msgSend(v5, "protectedDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT COUNT(*) FROM samples JOIN objects USING (data_id) WHERE type=1;"),
         a3,
         0,
         v6);

  if (v8)
  {
    v9 = *(void **)(v40 + 32);
    if (v9)
    {
      v10 = (void *)MEMORY[0x1E0C99DE8];
      v11 = v5;
      objc_msgSend(v10, "array");
      v12 = (uint64_t *)objc_claimAutoreleasedReturnValue();
      aBlock = MEMORY[0x1E0C809B0];
      v54 = 3221225472;
      v55 = __68__HDDatabaseControlServer__queryDistinctTypesWithTransaction_error___block_invoke;
      v56 = &unk_1E6CE8CF8;
      v57 = v12;
      v13 = v12;
      v14 = _Block_copy(&aBlock);
      objc_msgSend(v11, "protectedDatabase");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_msgSend(v15, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT DISTINCT data_type FROM samples JOIN objects USING (data_id) WHERE type=1;"),
              a3,
              0,
              v14);

      if (v16)
        v17 = v13;
      else
        v17 = 0;
      v18 = v17;

      if (v18)
      {
        v19 = *(_QWORD *)(v40 + 32);
        v38 = v18;
        v20 = v11;
        if (v19)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = 0u;
          v52 = 0u;
          v49 = 0u;
          v50 = 0u;
          obj = v38;
          v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, &aBlock, 16);
          if (v22)
          {
            v23 = *(_QWORD *)v50;
            while (2)
            {
              v24 = 0;
              do
              {
                if (*(_QWORD *)v50 != v23)
                  objc_enumerationMutation(obj);
                v25 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v24);
                v47[0] = 0;
                v47[1] = v47;
                v47[2] = 0x2020000000;
                v48 = 0;
                v48 = objc_msgSend(v25, "integerValue");
                v45[0] = MEMORY[0x1E0C809B0];
                v45[1] = 3221225472;
                v45[2] = __66__HDDatabaseControlServer__queryTypeCounts_withTransaction_error___block_invoke;
                v45[3] = &unk_1E6CE8D20;
                v45[4] = v25;
                v46 = v21;
                v26 = _Block_copy(v45);
                v44[0] = MEMORY[0x1E0C809B0];
                v44[1] = 3221225472;
                v44[2] = __66__HDDatabaseControlServer__queryTypeCounts_withTransaction_error___block_invoke_2;
                v44[3] = &unk_1E6CE8D48;
                v44[4] = v47;
                v27 = _Block_copy(v44);
                objc_msgSend(v20, "protectedDatabase");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = objc_msgSend(v28, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT COUNT(*) FROM samples JOIN objects USING (data_id) WHERE type = 1 AND data_type = ?;"),
                        a3,
                        v27,
                        v26);

                _Block_object_dispose(v47, 8);
                if ((v29 & 1) == 0)
                {

                  v30 = 0;
                  goto LABEL_20;
                }
                ++v24;
              }
              while (v22 != v24);
              v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, &aBlock, 16);
              if (v22)
                continue;
              break;
            }
          }

          v30 = v21;
LABEL_20:

        }
        else
        {
          v30 = 0;
        }

        v31 = v30 != 0;
        if (v30)
        {
          v32 = objc_alloc(MEMORY[0x1E0CB6A20]);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v43);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v32, "initWithSampleCount:sampleCountByType:", v33, v30);
          v35 = *(_QWORD *)(*(_QWORD *)(v40 + 40) + 8);
          v36 = *(void **)(v35 + 40);
          *(_QWORD *)(v35 + 40) = v34;

        }
        v9 = v38;
        goto LABEL_26;
      }
      v9 = 0;
    }
    v31 = 0;
LABEL_26:

    goto LABEL_27;
  }
  v31 = 0;
LABEL_27:
  v4 = v39;
LABEL_28:

  return v31;
}

+ (id)taskIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6598], "taskIdentifier");
}

+ (id)requiredEntitlements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CB59B0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
