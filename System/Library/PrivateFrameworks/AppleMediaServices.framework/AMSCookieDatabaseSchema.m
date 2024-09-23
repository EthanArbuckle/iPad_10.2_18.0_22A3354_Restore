@implementation AMSCookieDatabaseSchema

+ (BOOL)createOrUpdateSchemaUsingConnection:(id)a3
{
  return objc_msgSend(a1, "createOrUpdateSchemaUsingConnection:error:", a3, 0);
}

+ (BOOL)createOrUpdateSchemaUsingConnection:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  AMSSQLiteSchema *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  id v28;
  BOOL v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  NSObject *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v50;
  id v51;
  _QWORD v52[6];
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = AMSSetLogKeyIfNeeded();
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__22;
  v57 = __Block_byref_object_dispose__22;
  v58 = 0;
  v8 = -[AMSSQLiteSchema initWithConnection:]([AMSSQLiteSchema alloc], "initWithConnection:", v6);
  v9 = -[AMSSQLiteSchema currentUserVersion](v8, "currentUserVersion");
  v10 = MEMORY[0x1E0C809B0];
  v11 = __69__AMSCookieDatabaseSchema_createOrUpdateSchemaUsingConnection_error___block_invoke;
  while (1)
  {
    if (v9 > 0)
      goto LABEL_24;
    if (!v9)
    {
      v52[0] = v10;
      v52[1] = 3221225472;
      v52[2] = __69__AMSCookieDatabaseSchema_createOrUpdateSchemaUsingConnection_error___block_invoke;
      v52[3] = &unk_1E2540470;
      v52[4] = &v53;
      v52[5] = a1;
      if (!-[AMSSQLiteSchema migrateToVersion:usingBlock:](v8, "migrateToVersion:usingBlock:", 1, v52))
        break;
    }
    v12 = -[AMSSQLiteSchema currentUserVersion](v8, "currentUserVersion");
    v13 = v12 == v9;
    v9 = v12;
    if (v13)
    {
      +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v14, "OSLogObject");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        AMSLogKey();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x1E0CB3940];
        if (v16)
        {
          v18 = objc_opt_class();
          AMSLogKey();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringWithFormat:", CFSTR("%@: [%@] "), v18, v11);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
        }
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v60 = v19;
        _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to update AMS cookie database schema. User version did not change.", buf, 0xCu);
        if (v16)
        {

          v19 = v11;
        }

      }
      if (!os_variant_has_internal_content())
      {
LABEL_24:
        v29 = 1;
        goto LABEL_58;
      }
      v50 = 0;
      v27 = objc_msgSend(a1, "promptTapToRadarForSchemaMigrationFailureWithDescription:error:", CFSTR("User version did not change after updating the cookie database schema"), &v50);
      v28 = v50;
      if ((v27 & 1) != 0)
      {
        v29 = 1;
        goto LABEL_57;
      }
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v30 = (id)objc_claimAutoreleasedReturnValue();
      if (!v30)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v30 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v30, "OSLogObject");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        AMSLogKey();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)MEMORY[0x1E0CB3940];
        if (v32)
        {
          v34 = objc_opt_class();
          AMSLogKey();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "stringWithFormat:", CFSTR("%@: [%@] "), v34, v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v36;
        }
        AMSLogableError((void *)v54[5]);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v60 = v36;
        v61 = 2114;
        v62 = v47;
        _os_log_impl(&dword_18C849000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to file Tap-to-Radar. error = %{public}@", buf, 0x16u);
        if (v32)

      }
      v29 = 1;
      goto LABEL_55;
    }
  }
  +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v20, "OSLogObject");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    AMSLogKey();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0CB3940];
    if (v22)
    {
      v24 = objc_opt_class();
      AMSLogKey();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("%@: [%@] "), v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v26;
    }
    AMSLogableError((void *)v54[5]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v60 = v26;
    v61 = 2114;
    v62 = v37;
    _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to update AMS cookie database schema. error = %{public}@", buf, 0x16u);
    if (v22)

  }
  if (a4)
    *a4 = objc_retainAutorelease((id)v54[5]);
  if (!os_variant_has_internal_content())
  {
    v29 = 0;
    goto LABEL_58;
  }
  v38 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)v54[5], "localizedDescription");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "stringWithFormat:", CFSTR("Encountered a failure creating or updating the cookie database schema:\n\n%@"), v39);
  v28 = (id)objc_claimAutoreleasedReturnValue();

  v51 = 0;
  v40 = objc_msgSend(a1, "promptTapToRadarForSchemaMigrationFailureWithDescription:error:", v28, &v51);
  v30 = v51;
  if ((v40 & 1) != 0)
  {
    v29 = 0;
    goto LABEL_56;
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v31 = objc_claimAutoreleasedReturnValue();
  if (!v31)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v31 = objc_claimAutoreleasedReturnValue();
  }
  -[NSObject OSLogObject](v31, "OSLogObject");
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    AMSLogKey();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)MEMORY[0x1E0CB3940];
    if (v42)
    {
      v44 = objc_opt_class();
      AMSLogKey();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "stringWithFormat:", CFSTR("%@: [%@] "), v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v46;
    }
    AMSLogableError((void *)v54[5]);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v60 = v46;
    v61 = 2114;
    v62 = v48;
    _os_log_impl(&dword_18C849000, v41, OS_LOG_TYPE_ERROR, "%{public}@Failed to file Tap-to-Radar. error = %{public}@", buf, 0x16u);
    if (v42)

  }
  v29 = 0;
LABEL_55:

LABEL_56:
LABEL_57:

LABEL_58:
  _Block_object_dispose(&v53, 8);

  return v29;
}

void __69__AMSCookieDatabaseSchema_createOrUpdateSchemaUsingConnection_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  char v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id obj;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v5 + 40);
  v6 = objc_msgSend(v4, "migrateVersion0to1WithMigration:error:", a2, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  if ((v6 & 1) == 0)
  {
    +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = objc_opt_class();
      v12 = v11;
      if (v9)
      {
        AMSLogKey();
        v2 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: [%@] "), v12, v2);
      }
      else
      {
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: "), v11);
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v13;
      v18 = 2114;
      v19 = v14;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@Error migrating cookie database from version 0 to 1. error = %{public}@", buf, 0x16u);
      if (v9)
      {

        v13 = (void *)v2;
      }

    }
  }
}

+ (BOOL)migrateVersion0to1WithMigration:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  v5 = a3;
  if (objc_msgSend(v5, "executeStatement:error:", CFSTR("PRAGMA auto_vacuum = 2;"), a4))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("CREATE TABLE cookies ("));
    objc_msgSend(&unk_1E25B0110, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_32);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&unk_1E25B0110, "ams_filterUsingTest:", &__block_literal_global_69);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_70);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("PRIMARY KEY("));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR(","));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendString:", v11);

    objc_msgSend(v10, "appendString:", CFSTR(")"));
    objc_msgSend(v7, "arrayByAddingObject:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", "));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v13);

    objc_msgSend(v6, "appendString:", CFSTR(");"));
    v14 = (void *)objc_msgSend(v6, "copy");
    v15 = objc_msgSend(v5, "executeStatement:error:", v14, a4);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

id __65__AMSCookieDatabaseSchema_migrateVersion0to1WithMigration_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  unint64_t v4;
  id v5;
  void *v6;
  const __CFString *v7;

  v2 = objc_msgSend(a2, "unsignedIntegerValue");
  if (v2 == 14)
  {
    v3 = 0;
  }
  else
  {
    v4 = v2;
    v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    AMSNameForAMSCookieDatabaseColumn(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:", v6);

    objc_msgSend(v5, "appendString:", CFSTR(" "));
    if (v4 >= 0xE)
      v7 = 0;
    else
      v7 = CFSTR("TEXT");
    objc_msgSend(v5, "appendString:", v7);
    if (v4 <= 8 && ((1 << v4) & 0x148) != 0)
      objc_msgSend(v5, "appendString:", CFSTR(" NOT NULL"));
    v3 = (void *)objc_msgSend(v5, "copy");

  }
  return v3;
}

uint64_t __65__AMSCookieDatabaseSchema_migrateVersion0to1WithMigration_error___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v2;

  v2 = objc_msgSend(a2, "unsignedIntegerValue");
  return (v2 < 9) & (0x148u >> v2);
}

__CFString *__65__AMSCookieDatabaseSchema_migrateVersion0to1WithMigration_error___block_invoke_3(uint64_t a1, void *a2)
{
  return AMSNameForAMSCookieDatabaseColumn(objc_msgSend(a2, "unsignedIntegerValue"));
}

+ (BOOL)promptTapToRadarForSchemaMigrationFailureWithDescription:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  Class v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  BOOL v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id *v57;
  uint64_t v58;
  void *v59;
  id v60;
  id v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  AMSSetLogKeyIfNeeded();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (Class)_MergedGlobals_71[0]();
  if (v8)
  {
    -[objc_class shared](v8, "shared");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      v57 = a4;
      if (!v10)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v11 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject OSLogObject](v11, "OSLogObject");
      v12 = objc_claimAutoreleasedReturnValue();
      v58 = (uint64_t)a1;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        AMSLogKey();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x1E0CB3940];
        v15 = objc_opt_class();
        v16 = v15;
        if (v13)
        {
          AMSLogKey();
          a1 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "stringWithFormat:", CFSTR("%@: [%@] "), v16, a1);
        }
        else
        {
          objc_msgSend(v14, "stringWithFormat:", CFSTR("%@: "), v15);
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v63 = v17;
        _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Preparing Radar draft", buf, 0xCu);
        if (v13)
        {

          v17 = a1;
        }

      }
      v11 = objc_msgSend(objc_alloc((Class)off_1ECEAA6E8[0]()), "initWithName:version:identifier:", CFSTR("Apple Media Services"), CFSTR("Infrastructure"), 1158278);
      v23 = objc_alloc_init((Class)off_1ECEAA6F0[0]());
      -[NSObject setClassification:](v23, "setClassification:", 6);
      -[NSObject setComponent:](v23, "setComponent:", v11);
      -[NSObject setIsUserInitiated:](v23, "setIsUserInitiated:", 0);
      v59 = v7;
      v60 = v6;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@. Log key: %@"), v6, v7);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setProblemDescription:](v23, "setProblemDescription:", v29);

      -[NSObject setReproducibility:](v23, "setReproducibility:", 6);
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setTimeOfIssue:](v23, "setTimeOfIssue:", v30);

      -[NSObject setTitle:](v23, "setTitle:", CFSTR("Failed to update AMS cookie database schema"));
      +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v31)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v31, "OSLogObject");
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        AMSLogKey();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)MEMORY[0x1E0CB3940];
        v35 = objc_opt_class();
        v36 = v35;
        if (v33)
        {
          AMSLogKey();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "stringWithFormat:", CFSTR("%@: [%@] "), v36, v30);
        }
        else
        {
          objc_msgSend(v34, "stringWithFormat:", CFSTR("%@: "), v35);
        }
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v23);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v63 = v37;
        v64 = 2114;
        v65 = v38;
        _os_log_impl(&dword_18C849000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@Sending Radar draft: %{public}@", buf, 0x16u);
        if (v33)
        {

          v37 = v30;
        }

      }
      v61 = 0;
      objc_msgSend(v9, "createDraft:forProcessNamed:withDisplayReason:error:", v23, CFSTR("AMS Cookie Database"), CFSTR("it failed to create or update the schema"), &v61);
      v39 = v61;
      v40 = v39 == 0;
      +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = (void *)v41;
      if (v39)
      {
        if (!v41)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v42, "OSLogObject");
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          AMSLogKey();
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = (void *)MEMORY[0x1E0CB3940];
          v46 = objc_opt_class();
          v47 = v46;
          if (v44)
          {
            AMSLogKey();
            v58 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "stringWithFormat:", CFSTR("%@: [%@] "), v47, v58);
          }
          else
          {
            objc_msgSend(v45, "stringWithFormat:", CFSTR("%@: "), v46);
          }
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          AMSLogableError(v39);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v63 = v48;
          v64 = 2114;
          v65 = v55;
          _os_log_impl(&dword_18C849000, v43, OS_LOG_TYPE_ERROR, "%{public}@Failed to send Radar draft. error = %{public}@", buf, 0x16u);
          if (v44)
          {

            v48 = (void *)v58;
          }

        }
        if (v57)
          *v57 = objc_retainAutorelease(v39);
      }
      else
      {
        if (!v41)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v42, "OSLogObject");
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          AMSLogKey();
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = (void *)MEMORY[0x1E0CB3940];
          v52 = objc_opt_class();
          v53 = v52;
          if (v50)
          {
            AMSLogKey();
            v58 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "stringWithFormat:", CFSTR("%@: [%@] "), v53, v58);
          }
          else
          {
            objc_msgSend(v51, "stringWithFormat:", CFSTR("%@: "), v52);
          }
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v63 = v54;
          _os_log_impl(&dword_18C849000, v49, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully sent Radar draft.", buf, 0xCu);
          if (v50)
          {

            v54 = (void *)v58;
          }

        }
      }

      v7 = v59;
      v6 = v60;
    }
    else
    {
      if (!v10)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v11 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject OSLogObject](v11, "OSLogObject");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        AMSLogKey();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)MEMORY[0x1E0CB3940];
        v26 = objc_opt_class();
        v27 = v26;
        if (v24)
        {
          AMSLogKey();
          a1 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "stringWithFormat:", CFSTR("%@: [%@] "), v27, a1);
        }
        else
        {
          objc_msgSend(v25, "stringWithFormat:", CFSTR("%@: "), v26);
        }
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v63 = v28;
        _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Radar service does not exist, cannot send draft.", buf, 0xCu);
        if (v24)
        {

          v28 = a1;
        }

      }
      v40 = 1;
    }

  }
  else
  {
    +[AMSLogConfig sharedAccountsCookiesConfig](AMSLogConfig, "sharedAccountsCookiesConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      AMSLogKey();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0CB3940];
      v20 = objc_opt_class();
      v21 = v20;
      if (v18)
      {
        AMSLogKey();
        a1 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringWithFormat:", CFSTR("%@: [%@] "), v21, a1);
      }
      else
      {
        objc_msgSend(v19, "stringWithFormat:", CFSTR("%@: "), v20);
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v63 = v22;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Radar service class does not exist, cannot send draft.", buf, 0xCu);
      if (v18)
      {

        v22 = a1;
      }

    }
    v40 = 1;
  }

  return v40;
}

@end
