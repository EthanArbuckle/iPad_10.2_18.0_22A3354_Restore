@implementation ACHTemplateEntity

+ (void)setSyncedTemplatesObserver:(id)a3
{
  id v3;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&syncObserverLock_0);
  objc_storeWeak(&_syncObserver_0, v3);

  os_unfair_lock_unlock((os_unfair_lock_t)&syncObserverLock_0);
}

+ (ACHTemplateEntitySyncedTemplatesObserver)syncedTemplatesObserver
{
  id WeakRetained;

  os_unfair_lock_lock((os_unfair_lock_t)&syncObserverLock_0);
  WeakRetained = objc_loadWeakRetained(&_syncObserver_0);
  os_unfair_lock_unlock((os_unfair_lock_t)&syncObserverLock_0);
  return (ACHTemplateEntitySyncedTemplatesObserver *)WeakRetained;
}

+ (id)databaseTable
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_templates"), *MEMORY[0x24BE01218]);
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 39;
  return (const $27325D3925FB5ACF38BB0AF4A70276FF *)columnDefinitionsWithCount__columnDefinitions_0;
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
  ACHTemplateEntityEncoder *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = -[HDEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:]([ACHTemplateEntityEncoder alloc], "initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:", objc_opt_class(), v14, v13, a5, v12, v11);

  return v15;
}

+ (id)allTemplatesWithProfile:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x24BE40E48];
  v7 = a3;
  objc_msgSend(v6, "truePredicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_templatesWithPredicate:profile:error:", v8, v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  ACHSortedTemplates();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)_insertTemplates:(id)a3 provenance:(int64_t)a4 useLegacySyncIdentity:(BOOL)a5 profile:(id)a6 databaseContext:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  char v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  int64_t v28;
  BOOL v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  int64_t v34;
  BOOL v35;

  v14 = a3;
  v15 = a6;
  v16 = a7;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BE40AB0], "contextForWritingProtectedData");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v15, "database");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "copyForWritingProtectedData");
  v19 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __101__ACHTemplateEntity__insertTemplates_provenance_useLegacySyncIdentity_profile_databaseContext_error___block_invoke;
  v30[3] = &unk_24D13CF40;
  v33 = a1;
  v31 = v14;
  v35 = a5;
  v32 = v15;
  v34 = a4;
  v24[0] = v19;
  v24[1] = 3221225472;
  v24[2] = __101__ACHTemplateEntity__insertTemplates_provenance_useLegacySyncIdentity_profile_databaseContext_error___block_invoke_279;
  v24[3] = &unk_24D13CF68;
  v27 = a1;
  v28 = a4;
  v29 = a5;
  v25 = v31;
  v26 = v32;
  v20 = v32;
  v21 = v31;
  v22 = objc_msgSend(v17, "performTransactionWithContext:error:block:inaccessibilityHandler:", v18, a8, v30, v24);

  return v22;
}

uint64_t __101__ACHTemplateEntity__insertTemplates_provenance_useLegacySyncIdentity_profile_databaseContext_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  unint64_t v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  uint32_t v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v35;
  __int128 v36;
  id v37;
  id v38;
  void *v39;
  uint64_t v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  NSObject *v48;
  __int16 v49;
  NSObject *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(v5, "databaseForEntityClass:", *(_QWORD *)(a1 + 48));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v6 = *(id *)(a1 + 32);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v44;
    *(_QWORD *)&v8 = 138543362;
    v36 = v8;
    v37 = v5;
    v38 = v6;
LABEL_3:
    v11 = 0;
    v40 = v9;
    while (1)
    {
      if (*(_QWORD *)v44 != v10)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v11);
      if (objc_msgSend(v12, "minimumEngineVersion", v36) < 0xE)
      {
        if ((objc_msgSend(v12, "_isValid") & 1) != 0)
        {
          v19 = *(void **)(a1 + 48);
          objc_msgSend(v12, "uniqueName");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "_templateWithUniqueName:profile:transaction:error:", v20, *(_QWORD *)(a1 + 40), v5, a3);
          v13 = objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            v21 = -[NSObject version](v13, "version");
            if (v21 < objc_msgSend(v12, "version"))
            {
              v22 = *(void **)(a1 + 48);
              v23 = -[NSObject key](v13, "key");
              v42 = 0;
              LODWORD(v22) = objc_msgSend(v22, "_removeTemplateWithPersistentID:database:error:", v23, v39, &v42);
              v24 = v42;
              if (!(_DWORD)v22)
              {
                v25 = v24;
                if (v25)
                {
                  if (a3)
                    *a3 = objc_retainAutorelease(v25);
                  else
                    _HKLogDroppedError();
                }

                ACHLogDatabase();
                v32 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                  __101__ACHTemplateEntity__insertTemplates_provenance_useLegacySyncIdentity_profile_databaseContext_error___block_invoke_cold_1(v12, (uint64_t)v25, v32);
                goto LABEL_35;
              }

            }
          }
          ACHTemplateSyncIdentityFromTemplate(v12, *(unsigned __int8 *)(a1 + 64), *(void **)(a1 + 40), v5);
          v25 = (id)objc_claimAutoreleasedReturnValue();
          v27 = *(void **)(a1 + 48);
          v26 = *(_QWORD *)(a1 + 56);
          objc_msgSend(v25, "entity");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "persistentID");
          v41 = 0;
          LOBYTE(v26) = objc_msgSend(v27, "_insertTemplate:provenance:syncIdentity:database:error:", v12, v26, v29, v39, &v41);
          v30 = v41;

          if ((v26 & 1) == 0)
          {
            v32 = v30;
            if (v32)
            {
              if (a3)
                *a3 = objc_retainAutorelease(v32);
              else
                _HKLogDroppedError();
            }

            ACHLogDatabase();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v12, "uniqueName");
              v35 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v48 = v35;
              v49 = 2114;
              v50 = v32;
              _os_log_error_impl(&dword_21407B000, v33, OS_LOG_TYPE_ERROR, "Error inserting template '%{public}@': %{public}@", buf, 0x16u);

            }
LABEL_35:

            v31 = 0;
            v5 = v37;
            v6 = v38;
            goto LABEL_36;
          }

          v5 = v37;
          v6 = v38;
          v9 = v40;
        }
        else
        {
          ACHLogDatabase();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v12, "uniqueName");
            v15 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v36;
            v48 = v15;
            v16 = v13;
            v17 = "Not inserting invalid template: %{public}@";
            v18 = 12;
            goto LABEL_18;
          }
        }
      }
      else
      {
        ACHLogDatabase();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = objc_msgSend(v12, "minimumEngineVersion");
          objc_msgSend(v12, "uniqueName");
          v15 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v48 = v14;
          v9 = v40;
          v49 = 2114;
          v50 = v15;
          v16 = v13;
          v17 = "Not inserting template with higher minimum engine version (%ld): %{public}@";
          v18 = 22;
LABEL_18:
          _os_log_impl(&dword_21407B000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, v18);

        }
      }

      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }
  v31 = 1;
LABEL_36:

  return v31;
}

uint64_t __101__ACHTemplateEntity__insertTemplates_provenance_useLegacySyncIdentity_profile_databaseContext_error___block_invoke_279(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 48), "_journalTemplates:provenance:useLegacySyncIdentity:action:profile:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64), 0, *(_QWORD *)(a1 + 40), a3);
}

+ (BOOL)_insertTemplate:(id)a3 provenance:(int64_t)a4 syncIdentity:(int64_t)a5 database:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  int64_t v17;
  int64_t v18;
  _QWORD v19[5];

  v12 = a3;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __76__ACHTemplateEntity__insertTemplate_provenance_syncIdentity_database_error___block_invoke;
  v19[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v19[4] = a1;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __76__ACHTemplateEntity__insertTemplate_provenance_syncIdentity_database_error___block_invoke_2;
  v15[3] = &unk_24D13CFB0;
  v16 = v12;
  v17 = a4;
  v18 = a5;
  v13 = v12;
  LOBYTE(a7) = objc_msgSend(a6, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_insertTemplate_provenance_syncIdentity_database_error__insertKey, a7, v19, v15, 0);

  return (char)a7;
}

id __76__ACHTemplateEntity__insertTemplate_provenance_syncIdentity_database_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("INSERT OR IGNORE INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"), v2, CFSTR("unique_name"), CFSTR("version"), CFSTR("minimum_engine_version"), CFSTR("created_date"), CFSTR("creator_device"), CFSTR("source_name"), CFSTR("predicate"), CFSTR("grace_predicate"), CFSTR("value_expression"), CFSTR("grace_value_expression"), CFSTR("progress_expression"), CFSTR("grace_progress_expression"), CFSTR("goal_expression"), CFSTR("grace_goal_expression"), CFSTR("triggers"),
    CFSTR("earn_limit"),
    CFSTR("visibility_predicate"),
    CFSTR("grace_visibility_predicate"),
    CFSTR("visibility_start_date"),
    CFSTR("visibility_end_date"),
    CFSTR("availability_predicate"),
    CFSTR("availability_start_date"),
    CFSTR("availability_end_date"),
    CFSTR("available_country_codes"),
    CFSTR("alertability_predicate"),
    CFSTR("alert_dates"),
    CFSTR("duplicateremoval_strategy"),
    CFSTR("duplicateremoval_calendar_unit"),
    CFSTR("earn_date"),
    CFSTR("display_order"),
    CFSTR("displays_earned_instance_count"),
    CFSTR("canonical_unit"),
    CFSTR("sync_provenance"),
    CFSTR("available_suffixes"),
    CFSTR("daily_target"),
    CFSTR("daily_target_canonical_unit"),
    CFSTR("sync_identity"),
    CFSTR("prerequisite_template_name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __76__ACHTemplateEntity__insertTemplate_provenance_syncIdentity_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  id v38;

  objc_msgSend(*(id *)(a1 + 32), "uniqueName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindStringToStatement();

  sqlite3_bind_int64(a2, 2, objc_msgSend(*(id *)(a1 + 32), "version"));
  sqlite3_bind_int64(a2, 3, objc_msgSend(*(id *)(a1 + 32), "minimumEngineVersion"));
  objc_msgSend(*(id *)(a1 + 32), "createdDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_bind_int64(a2, 5, objc_msgSend(*(id *)(a1 + 32), "creatorDevice"));
  objc_msgSend(*(id *)(a1 + 32), "sourceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 32), "predicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 32), "gracePredicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 32), "valueExpression");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 32), "graceValueExpression");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 32), "progressExpression");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 32), "graceProgressExpression");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 32), "goalExpression");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 32), "graceGoalExpression");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_bind_int64(a2, 15, objc_msgSend(*(id *)(a1 + 32), "triggers"));
  sqlite3_bind_int64(a2, 16, objc_msgSend(*(id *)(a1 + 32), "earnLimit"));
  objc_msgSend(*(id *)(a1 + 32), "visibilityPredicate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 32), "graceVisibilityPredicate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 32), "visibilityStart");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  ACHYearMonthDayStringFromDateComponents();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 32), "visibilityEnd");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  ACHYearMonthDayStringFromDateComponents();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 32), "availabilityPredicate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 32), "availabilityStart");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  ACHYearMonthDayStringFromDateComponents();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 32), "availabilityEnd");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  ACHYearMonthDayStringFromDateComponents();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 32), "availableCountryCodes");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  ACHTemplateAvailableCountryCodesStringFromStrings();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 32), "alertabilityPredicate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 32), "alertDates");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  ACHTemplateAlertDatesStringFromDates();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_bind_int64(a2, 27, objc_msgSend(*(id *)(a1 + 32), "duplicateRemovalStrategy"));
  sqlite3_bind_int64(a2, 28, objc_msgSend(*(id *)(a1 + 32), "duplicateRemovalCalendarUnit"));
  sqlite3_bind_int64(a2, 29, objc_msgSend(*(id *)(a1 + 32), "earnDateStrategy"));
  sqlite3_bind_int64(a2, 30, objc_msgSend(*(id *)(a1 + 32), "displayOrder"));
  sqlite3_bind_int(a2, 31, objc_msgSend(*(id *)(a1 + 32), "displaysEarnedInstanceCount"));
  objc_msgSend(*(id *)(a1 + 32), "canonicalUnit");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "unitString");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_bind_int64(a2, 33, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "availableSuffixes");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  ACHTemplateAvailableSuffixesStringFromStrings();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 32), "dailyTarget");
  sqlite3_bind_double(a2, 35, v35);
  objc_msgSend(*(id *)(a1 + 32), "dailyTargetCanonicalUnit");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "unitString");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_bind_int64(a2, 37, *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "prerequisiteTemplateName");
  v38 = (id)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

}

+ (BOOL)_removeTemplateWithPersistentID:(int64_t)a3 database:(id)a4 error:(id *)a5
{
  id v7;
  ACHTemplateEntity *v8;

  v7 = a4;
  v8 = -[HDSQLiteEntity initWithPersistentID:]([ACHTemplateEntity alloc], "initWithPersistentID:", a3);
  LOBYTE(a5) = -[HDSQLiteEntity deleteFromDatabase:error:](v8, "deleteFromDatabase:error:", v7, a5);

  return (char)a5;
}

+ (BOOL)_removeTemplates:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v29;
  id *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count") == 1)
  {
    objc_msgSend(v8, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uniqueName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE40E18], "predicateWithProperty:equalToValue:", CFSTR("unique_name"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29 = a1;
    v30 = a5;
    v13 = v8;
    v14 = objc_alloc_init(MEMORY[0x24BDBCE30]);
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v40;
      do
      {
        v19 = 0;
        v20 = v14;
        do
        {
          if (*(_QWORD *)v40 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v19), "uniqueName");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BE40E18], "predicateWithProperty:equalToValue:", CFSTR("unique_name"), v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "arrayByAddingObject:", v22);
          v14 = (id)objc_claimAutoreleasedReturnValue();

          ++v19;
          v20 = v14;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v17);
    }

    objc_msgSend(MEMORY[0x24BE40E20], "predicateMatchingAnyPredicates:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    a1 = v29;
    a5 = v30;
  }
  objc_msgSend(v9, "database");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = MEMORY[0x24BDAC760];
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __52__ACHTemplateEntity__removeTemplates_profile_error___block_invoke;
  v35[3] = &unk_24D13A9F0;
  v38 = a1;
  v36 = v12;
  v37 = v9;
  v31[0] = v24;
  v31[1] = 3221225472;
  v31[2] = __52__ACHTemplateEntity__removeTemplates_profile_error___block_invoke_2;
  v31[3] = &unk_24D13CFD8;
  v33 = v37;
  v34 = a1;
  v32 = v8;
  v25 = v37;
  v26 = v8;
  v27 = v12;
  LOBYTE(v24) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:", v23, a5, v35, v31);

  return v24;
}

uint64_t __52__ACHTemplateEntity__removeTemplates_profile_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "deleteEntitiesWithPredicate:healthDatabase:error:", v4, v6, a3);

  return v7;
}

uint64_t __52__ACHTemplateEntity__removeTemplates_profile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 48), "_journalTemplates:provenance:useLegacySyncIdentity:action:profile:error:", *(_QWORD *)(a1 + 32), 0, 0, 1, *(_QWORD *)(a1 + 40), a3);
}

+ (BOOL)_journalTemplates:(id)a3 provenance:(int64_t)a4 useLegacySyncIdentity:(BOOL)a5 action:(int64_t)a6 profile:(id)a7 error:(id *)a8
{
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[6];
  BOOL v15;

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __93__ACHTemplateEntity__journalTemplates_provenance_useLegacySyncIdentity_action_profile_error___block_invoke;
  v14[3] = &__block_descriptor_49_e46___ACHTemplateJournalEntry_16__0__ACHTemplate_8l;
  v15 = a5;
  v14[4] = a4;
  v14[5] = a6;
  v10 = a7;
  objc_msgSend(a3, "hk_map:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a8) = objc_msgSend(v12, "addJournalEntries:error:", v11, a8);
  return (char)a8;
}

ACHTemplateJournalEntry *__93__ACHTemplateEntity__journalTemplates_provenance_useLegacySyncIdentity_action_profile_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  ACHTemplateJournalEntry *v4;

  v3 = a2;
  v4 = -[ACHTemplateJournalEntry initWithTemplate:provenance:useLegacySyncIdentity:action:]([ACHTemplateJournalEntry alloc], "initWithTemplate:provenance:useLegacySyncIdentity:action:", v3, *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

  return v4;
}

+ (id)_templateWithUniqueName:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x24BE40E18], "predicateWithProperty:equalToValue:", CFSTR("unique_name"), v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "entityEncoderForProfile:transaction:purpose:encodingOptions:authorizationFilter:", v11, v12, 1, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "databaseForEntityClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "queryWithDatabase:predicate:", v15, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__27;
  v31 = __Block_byref_object_dispose__27;
  v32 = 0;
  objc_msgSend(v14, "orderedProperties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __71__ACHTemplateEntity__templateWithUniqueName_profile_transaction_error___block_invoke;
  v23[3] = &unk_24D13D020;
  v26 = &v27;
  v18 = v14;
  v24 = v18;
  v19 = v10;
  v25 = v19;
  LODWORD(a6) = objc_msgSend(v16, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", v17, a6, v23);

  if ((_DWORD)a6)
    v20 = (void *)v28[5];
  else
    v20 = 0;
  v21 = v20;

  _Block_object_dispose(&v27, 8);
  return v21;
}

BOOL __71__ACHTemplateEntity__templateWithUniqueName_profile_transaction_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  id v16;

  v7 = *(void **)(a1 + 32);
  v16 = 0;
  objc_msgSend(v7, "objectForPersistentID:row:error:", a2, a4, &v16);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v16;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v8;

  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (!v12)
  {
    v13 = v9;
    if (v13)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v13);
      else
        _HKLogDroppedError();
    }

    ACHLogDatabase();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __71__ACHTemplateEntity__templateWithUniqueName_profile_transaction_error___block_invoke_cold_1(a1);

  }
  return v12 != 0;
}

+ (id)_templatesWithPredicate:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, void *, uint64_t);
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(v9, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __59__ACHTemplateEntity__templatesWithPredicate_profile_error___block_invoke;
  v20 = &unk_24D13D070;
  v24 = a1;
  v21 = v9;
  v22 = v8;
  v12 = v10;
  v23 = v12;
  v13 = v8;
  v14 = v9;
  LODWORD(a5) = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v11, a5, &v17);

  if ((_DWORD)a5)
    v15 = (void *)objc_msgSend(v12, "copy", v17, v18, v19, v20, v21, v22, v23, v24);
  else
    v15 = 0;

  return v15;
}

uint64_t __59__ACHTemplateEntity__templatesWithPredicate_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 56), "entityEncoderForProfile:transaction:purpose:encodingOptions:authorizationFilter:", *(_QWORD *)(a1 + 32), v5, 1, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 56);
  objc_msgSend(v6, "orderedProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __59__ACHTemplateEntity__templatesWithPredicate_profile_error___block_invoke_2;
  v15[3] = &unk_24D13D048;
  v16 = v6;
  v17 = *(id *)(a1 + 32);
  v18 = v5;
  v19 = *(id *)(a1 + 48);
  v11 = v5;
  v12 = v6;
  v13 = objc_msgSend(v7, "enumerateProperties:withPredicate:healthDatabase:error:enumerationHandler:", v8, v9, v10, a3, v15);

  return v13;
}

uint64_t __59__ACHTemplateEntity__templatesWithPredicate_profile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  id v21;
  id v22;

  v7 = *(void **)(a1 + 32);
  v22 = 0;
  objc_msgSend(v7, "objectForPersistentID:row:error:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v22;
  v10 = HDSQLiteColumnWithNameAsInt64();
  objc_msgSend(*(id *)(a1 + 40), "syncIdentityManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 48);
  v21 = v9;
  objc_msgSend(v11, "identityForEntityID:transaction:error:", v10, v12, &v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v21;

  if (!v13)
  {
    ACHLogDatabase();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __59__ACHTemplateEntity__templatesWithPredicate_profile_error___block_invoke_2_cold_1((uint64_t)v14);
    goto LABEL_15;
  }
  objc_msgSend(v13, "identity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  achSyncIdentity(v15);
  v16 = objc_claimAutoreleasedReturnValue();

  if (v16)
    objc_msgSend(v8, "setSyncIdentity:", v16);
  if (!v8)
  {
    v18 = v14;
    if (v18)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v18);
      else
        _HKLogDroppedError();
    }

    ACHLogDatabase();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __59__ACHTemplateEntity__templatesWithPredicate_profile_error___block_invoke_2_cold_2();

LABEL_15:
    v17 = 0;
    goto LABEL_16;
  }
  objc_msgSend(*(id *)(a1 + 56), "addObject:", v8);
  v17 = 1;
LABEL_16:

  return v17;
}

+ (BOOL)supportsSyncStore:(id)a3
{
  return objc_msgSend(a3, "syncStoreType") == 1;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  id v2;

  v2 = objc_alloc(MEMORY[0x24BE40C70]);
  return (HDSyncEntityIdentifier *)(id)objc_msgSend(v2, "initWithEntityIdentifier:schemaIdentifier:", *MEMORY[0x24BE01618], *MEMORY[0x24BE01218]);
}

+ (int)currentSyncVersion
{
  return 1;
}

+ ($2825F4736939C4A6D3AD43837233062D)supportedSyncVersionRange
{
  return ($2825F4736939C4A6D3AD43837233062D)0x100000000;
}

+ ($2825F4736939C4A6D3AD43837233062D)syncVersionRangeForSession:(id)a3
{
  return ($2825F4736939C4A6D3AD43837233062D)0x100000000;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BE01810];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithData:", v4);

  return v5;
}

+ (id)propertyForSyncProvenance
{
  return CFSTR("sync_provenance");
}

+ (id)propertyForSyncIdentity
{
  return CFSTR("sync_identity");
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return 0;
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  int64_t v12;
  NSObject *v13;

  v10 = a3;
  objc_msgSend(a5, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(a1, "nextSyncAnchorWithStartAnchor:predicate:session:healthDatabase:error:", a4, 0, v10, v11, a6);

  ACHLogSync();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    +[ACHTemplateEntity nextSyncAnchorWithSession:startSyncAnchor:profile:error:].cold.1();

  return v12;
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t var1;
  int64_t var0;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  int v22;
  NSObject *v23;
  void *v24;
  void *v25;
  char v26;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  uint64_t *v33;
  _QWORD *v34;
  id v35;
  int64_t v36;
  int64_t v37;
  uint64_t v38;
  _QWORD v39[4];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint8_t buf[4];
  id v45;
  __int16 v46;
  int64_t v47;
  __int16 v48;
  int64_t v49;
  uint64_t v50;

  var1 = a4.var1;
  var0 = a4.var0;
  v50 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a5;
  v28 = a6;
  v15 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = -1;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v39[3] = 0;
  v16 = objc_msgSend(v13, "maxEncodedBytesPerCodableChangeForSyncEntityClass:", a1);
  ACHLogSync();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v45 = v13;
    v46 = 2048;
    v47 = var0;
    v48 = 2048;
    v49 = var1;
    _os_log_debug_impl(&dword_21407B000, v17, OS_LOG_TYPE_DEBUG, "Template Entity generating sync objects for session (%@), Anchor Range Start (%lld), Anchor Range End (%lld)", buf, 0x20u);
  }

  objc_msgSend(v14, "database");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __96__ACHTemplateEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke;
  v29[3] = &unk_24D13D0C0;
  v35 = a1;
  v19 = v14;
  v30 = v19;
  v20 = v13;
  v36 = var0;
  v37 = var1;
  v31 = v20;
  v33 = &v40;
  v21 = v15;
  v32 = v21;
  v34 = v39;
  v38 = v16;
  v22 = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v18, a7, v29);

  if (v22)
  {
    ACHLogSync();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v21, "count"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v24;
      _os_log_impl(&dword_21407B000, v23, OS_LOG_TYPE_DEFAULT, "Template Entity sync generated (%{public}@} objects for sync.", buf, 0xCu);

    }
    objc_msgSend(v21, "allObjects");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v28, "sendCodableChange:version:resultAnchor:sequence:done:error:", v25, 0x100000000, v41[3], 0, 1, a7);

  }
  else
  {
    v26 = 0;
  }

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(&v40, 8);

  return v26;
}

uint64_t __96__ACHTemplateEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 72), "entityEncoderForProfile:transaction:purpose:encodingOptions:authorizationFilter:", *(_QWORD *)(a1 + 32), v5, 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 72);
  objc_msgSend(v6, "orderedProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24;
  v10 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __96__ACHTemplateEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2;
  v20[3] = &unk_24D13D098;
  v21 = v6;
  v22 = *(id *)(a1 + 32);
  v23 = v5;
  v12 = *(id *)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 64);
  v24 = v12;
  v25 = v13;
  v26 = *(_QWORD *)(a1 + 96);
  v15 = *(_QWORD *)(a1 + 80);
  v14 = *(_QWORD *)(a1 + 88);
  v16 = v5;
  v17 = v6;
  v18 = objc_msgSend(v7, "enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:", v8, 0, v10, v15, v14, 0, v9, v11, a3, v20);

  return v18;
}

BOOL __96__ACHTemplateEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7, uint64_t a8)
{
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL8 v26;
  NSObject *v27;

  v12 = a2;
  objc_msgSend(*(id *)(a1 + 32), "codableRepresentationForPersistentID:row:error:", objc_msgSend(v12, "persistentID"), a4, a8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = HDSQLiteColumnWithNameAsInt64();
  objc_msgSend(*(id *)(a1 + 40), "syncIdentityManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identityForEntityID:transaction:error:", v14, *(_QWORD *)(a1 + 48), a8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = objc_alloc_init(MEMORY[0x24BE01808]);
    objc_msgSend(v16, "identity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "hardwareIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "hk_dataForUUIDBytes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setHardwareIdentifier:", v20);

    objc_msgSend(v16, "identity");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "databaseIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "hk_dataForUUIDBytes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDatabaseIdentifier:", v23);

    objc_msgSend(v16, "identity");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "instanceDiscriminator");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setInstanceDiscriminator:", v25);

    objc_msgSend(v13, "setSyncIdentity:", v17);
    v26 = v13 != 0;
    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v13);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += objc_msgSend(v13, "encodedByteCount");
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) >= *(_QWORD *)(a1 + 72))
        *a7 = 1;
    }
    else
    {
      ACHLogSync();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        __96__ACHTemplateEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2_cold_1();

    }
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  uint64_t v27;
  void *v28;
  int v29;
  int64_t v30;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  ACHLogSync();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v39 = v15;
    _os_log_impl(&dword_21407B000, v14, OS_LOG_TYPE_DEFAULT, "Template Entity received sync objects, count: %{public}@", buf, 0xCu);

  }
  if (!objc_msgSend(v11, "count"))
  {
    ACHLogSync();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21407B000, v16, OS_LOG_TYPE_DEFAULT, "Received zero template sync objects, nothing to do.", buf, 2u);
    }
    goto LABEL_22;
  }
  v32 = a1;
  v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v17 = v11;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v34 != v20)
          objc_enumerationMutation(v17);
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE01850]), "initWithCodable:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
        if (v22)
          -[NSObject addObject:](v16, "addObject:", v22);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v19);
  }

  v23 = -[NSObject count](v16, "count");
  ACHLogSync();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if (!v23)
  {
    if (v25)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21407B000, v24, OS_LOG_TYPE_DEFAULT, "Received zero decodable templates from sync, nothing to do.", buf, 2u);
    }

LABEL_22:
    v30 = 0;
    goto LABEL_23;
  }
  if (v25)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSObject count](v16, "count"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v39 = v26;
    _os_log_impl(&dword_21407B000, v24, OS_LOG_TYPE_DEFAULT, "Decoded %{public}@ templates from sync.", buf, 0xCu);

  }
  v27 = objc_msgSend(v12, "syncProvenance");
  objc_msgSend(MEMORY[0x24BE40AB0], "contextForWritingProtectedData");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v32, "_insertTemplates:provenance:useLegacySyncIdentity:profile:databaseContext:error:", v16, v27, 1, v13, v28, a7);

  notify_post((const char *)objc_msgSend((id)*MEMORY[0x24BE01288], "UTF8String"));
  v30 = v29 ^ 1u;
LABEL_23:

  return v30;
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  if (a3 >= 8)
    return 3;
  else
    return 0;
}

+ (id)codableTemplateForTemplateInDatabase:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__27;
  v26 = __Block_byref_object_dispose__27;
  v27 = 0;
  objc_msgSend(v8, "uniqueName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE40E18], "predicateWithProperty:equalToValue:", CFSTR("unique_name"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __72__ACHTemplateEntity_codableTemplateForTemplateInDatabase_profile_error___block_invoke;
  v17[3] = &unk_24D13ABA0;
  v21 = a1;
  v13 = v9;
  v18 = v13;
  v14 = v11;
  v19 = v14;
  v20 = &v22;
  objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v12, a5, v17);

  v15 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v15;
}

uint64_t __72__ACHTemplateEntity_codableTemplateForTemplateInDatabase_profile_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;
  uint64_t v16;

  objc_msgSend(*(id *)(a1 + 56), "entityEncoderForProfile:transaction:purpose:encodingOptions:authorizationFilter:", *(_QWORD *)(a1 + 32), a2, 1, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 56);
  objc_msgSend(v5, "orderedProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __72__ACHTemplateEntity_codableTemplateForTemplateInDatabase_profile_error___block_invoke_2;
  v14[3] = &unk_24D13AB78;
  v10 = *(_QWORD *)(a1 + 48);
  v15 = v5;
  v16 = v10;
  v11 = v5;
  v12 = objc_msgSend(v6, "enumerateProperties:withPredicate:healthDatabase:error:enumerationHandler:", v7, v8, v9, a3, v14);

  return v12;
}

BOOL __72__ACHTemplateEntity_codableTemplateForTemplateInDatabase_profile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v12;

  v7 = *(void **)(a1 + 32);
  v12 = 0;
  objc_msgSend(v7, "codableRepresentationForPersistentID:row:error:", a2, a4, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v8);
  }
  else
  {
    ACHLogDatabase();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __90__ACHEarnedInstanceEntity_codableEarnedInstanceForEarnedInstanceInDatabase_profile_error___block_invoke_2_cold_1();

    if (*a5)
      *a5 = objc_retainAutorelease(v9);
  }

  return v8 != 0;
}

void __101__ACHTemplateEntity__insertTemplates_provenance_useLegacySyncIdentity_profile_databaseContext_error___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "uniqueName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v5;
  v8 = 2114;
  v9 = a2;
  _os_log_error_impl(&dword_21407B000, a3, OS_LOG_TYPE_ERROR, "Error removing existing template '%{public}@': %{public}@", (uint8_t *)&v6, 0x16u);

}

void __71__ACHTemplateEntity__templateWithUniqueName_profile_transaction_error___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 40);
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_0(&dword_21407B000, v1, v2, "Error instantiating template for unique name %{public}@ during database retrieval: %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __59__ACHTemplateEntity__templatesWithPredicate_profile_error___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_0(&dword_21407B000, v1, v2, "Error fetching sync identity for template: %{public}@, %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __59__ACHTemplateEntity__templatesWithPredicate_profile_error___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Error instantiating template during database retrieval: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)nextSyncAnchorWithSession:startSyncAnchor:profile:error:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_21407B000, v0, OS_LOG_TYPE_DEBUG, "Template Entity returning next sync anchor: %lld", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __96__ACHTemplateEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_21407B000, v0, v1, "Error creating codable representation of Template (%@): %@");
  OUTLINED_FUNCTION_1();
}

@end
