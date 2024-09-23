@implementation HDUpdateMedicalRecordEntitiesTableWithOrigin

uint64_t ___HDUpdateMedicalRecordEntitiesTableWithOrigin_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[5];
  id v12;
  void *v13;
  _QWORD v14[5];

  MEMORY[0x1BCCAB1C8](a2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB1D4](a2, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "unprotectedDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = ___HDUpdateMedicalRecordEntitiesTableWithOrigin_block_invoke_2;
  v14[3] = &unk_1E6CE9508;
  v14[4] = v7;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = ___HDUpdateMedicalRecordEntitiesTableWithOrigin_block_invoke_3;
  v11[3] = &unk_1E6CF16E0;
  v11[4] = v7;
  v12 = *(id *)(a1 + 40);
  v13 = v6;
  v9 = objc_msgSend(v8, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT sources.ROWID FROM sources             JOIN logical_sources ON logical_sources.ROWID = sources.logical_source_id             WHERE (REPLACE(REPLACE(logical_sources.bundle_id,             'com.apple.private.health.clinical.', ''), '-', '') = ?)"), a3, v14, v11);

  return v9;
}

uint64_t ___HDUpdateMedicalRecordEntitiesTableWithOrigin_block_invoke_2()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t ___HDUpdateMedicalRecordEntitiesTableWithOrigin_block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1BCCAB1C8](a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), v3);
  }
  else
  {
    _HKInitializeLogging();
    v4 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138543362;
      v8 = v6;
      _os_log_fault_impl(&dword_1B7802000, v4, OS_LOG_TYPE_FAULT, "UpdateMedicalRecordEntities: private source ROWID is nil for account %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }

  return 1;
}

uint64_t ___HDUpdateMedicalRecordEntitiesTableWithOrigin_block_invoke_646(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1BCCAB1C8](a2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB1D4](a2, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB1C8](a2, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("/"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") != 2)
  {
    if (objc_msgSend(v9, "count") == 3)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v12, "containsString:", CFSTR("#")))
      {
        v26 = v6;
        v11 = 0;
        goto LABEL_10;
      }
      v25 = v10;
      objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("#"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "count") == 2)
      {
        v26 = v6;
        objc_msgSend(v13, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = v25;
LABEL_10:

        goto LABEL_11;
      }
      _HKInitializeLogging();
      v23 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        v35 = v7;
        _os_log_fault_impl(&dword_1B7802000, v23, OS_LOG_TYPE_FAULT, "UpdateMedicalRecordEntities: HKFHIRIdentifer malformed in migration attempt: %{public}@", buf, 0xCu);
      }

    }
    else
    {
      _HKInitializeLogging();
      v14 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        v35 = v7;
        _os_log_fault_impl(&dword_1B7802000, v14, OS_LOG_TYPE_FAULT, "UpdateMedicalRecordEntities: HKFHIRIdentifer malformed in migration attempt: %{public}@", buf, 0xCu);
      }
    }
    v21 = 1;
    goto LABEL_21;
  }
  v26 = v6;
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(*(id *)(a1 + 40), "protectedDatabase");
    v16 = v7;
    v17 = v8;
    v18 = v10;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = ___HDUpdateMedicalRecordEntitiesTableWithOrigin_block_invoke_649;
    v30[3] = &unk_1E6CE7C30;
    v31 = v15;
    v32 = v18;
    v33 = v11;
    v27[0] = v20;
    v27[1] = 3221225472;
    v27[2] = ___HDUpdateMedicalRecordEntitiesTableWithOrigin_block_invoke_2_650;
    v27[3] = &unk_1E6CE8D20;
    v6 = v26;
    v28 = *(id *)(a1 + 40);
    v29 = v26;
    v21 = objc_msgSend(v19, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT ROWID FROM original_fhir_resources WHERE                   account_id = ? AND type = ? AND id = ?"), a3, v30, v27);

    v10 = v18;
    v8 = v17;
    v7 = v16;

  }
  else
  {
    _HKInitializeLogging();
    v22 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v35 = v8;
      _os_log_fault_impl(&dword_1B7802000, v22, OS_LOG_TYPE_FAULT, "UpdateMedicalRecordEntities: nil account ROWID associated with private source ROWID %{public}@", buf, 0xCu);
    }
    v21 = 1;
    v6 = v26;
  }

LABEL_21:
  return v21;
}

uint64_t ___HDUpdateMedicalRecordEntitiesTableWithOrigin_block_invoke_649()
{
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t ___HDUpdateMedicalRecordEntitiesTableWithOrigin_block_invoke_2_650(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[6];

  MEMORY[0x1BCCAB1C8](a2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "protectedDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = ___HDUpdateMedicalRecordEntitiesTableWithOrigin_block_invoke_3_653;
  v10[3] = &unk_1E6CE7750;
  v7 = *(_QWORD *)(a1 + 40);
  v10[4] = v5;
  v10[5] = v7;
  v8 = objc_msgSend(v6, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT INTO medical_records_new (data_id, note, entered_in_error, modified_date, fhir_identifier, original_fhir_resource_rowid, locale, extraction_version, sort_date, sort_date_key_path, country, state) SELECT data_id, note, entered_in_error, modified_date, fhir_identifier, ?, locale, extraction_version, sort_date, sort_date_key_path, country, state from medical_records where ROWID = ?"), a3, v10, 0);

  return v8;
}

uint64_t ___HDUpdateMedicalRecordEntitiesTableWithOrigin_block_invoke_3_653()
{
  HDSQLiteBindFoundationValueToStatement();
  return HDSQLiteBindFoundationValueToStatement();
}

@end
