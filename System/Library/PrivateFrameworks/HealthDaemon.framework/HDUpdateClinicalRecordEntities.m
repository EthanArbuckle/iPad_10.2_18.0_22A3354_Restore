@implementation HDUpdateClinicalRecordEntities

uint64_t ___HDUpdateClinicalRecordEntities_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  void *v13;
  _QWORD v14[5];

  MEMORY[0x1BCCAB1C8](a2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 1;
  MEMORY[0x1BCCAB1D4](a2, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "unprotectedDatabase");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = ___HDUpdateClinicalRecordEntities_block_invoke_2;
    v14[3] = &unk_1E6CE9508;
    v14[4] = v8;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = ___HDUpdateClinicalRecordEntities_block_invoke_3;
    v11[3] = &unk_1E6CE8D20;
    v12 = *(id *)(a1 + 32);
    v13 = v6;
    v7 = objc_msgSend(v9, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT sources.ROWID FROM sources             JOIN logical_sources ON logical_sources.ROWID = sources.logical_source_id             WHERE REPLACE(REPLACE(logical_sources.bundle_id,             'com.apple.public.health.clinical.', ''), '-', '') = HEX(hk_MD5(?))"), a3, v14, v11);

  }
  return v7;
}

uint64_t ___HDUpdateClinicalRecordEntities_block_invoke_2()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t ___HDUpdateClinicalRecordEntities_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  _QWORD v14[5];

  MEMORY[0x1BCCAB1C8](a2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "protectedDatabase");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = ___HDUpdateClinicalRecordEntities_block_invoke_4;
    v14[3] = &unk_1E6CE9508;
    v14[4] = v5;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = ___HDUpdateClinicalRecordEntities_block_invoke_5;
    v11[3] = &unk_1E6CE8D20;
    v7 = *(id *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v12 = v7;
    v13 = v8;
    v9 = objc_msgSend(v6, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT clinical_record_samples.ROWID, fhir_resource_resource_type,                 fhir_resource_identifier FROM clinical_record_samples                 JOIN objects ON clinical_record_samples.data_id = objects.data_id                 JOIN data_provenances ON data_provenances.ROWID = objects.provenance                 WHERE data_provenances.source_id = ? AND clinical_record_samples.original_signed_clinical_data_rowid IS NULL"), a3, v14, v11);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

uint64_t ___HDUpdateClinicalRecordEntities_block_invoke_4()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t ___HDUpdateClinicalRecordEntities_block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD v19[4];
  id v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1BCCAB1C8](a2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB1D4](a2, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB1D4](a2, 2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "containsString:", CFSTR("#")))
    goto LABEL_4;
  objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("#"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("/"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count") == 2)
  {
    objc_msgSend(v11, "firstObject");
    v12 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "lastObject");
    v13 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v13;
    v7 = (id)v12;
LABEL_4:
    objc_msgSend(*(id *)(a1 + 32), "protectedDatabase");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = ___HDUpdateClinicalRecordEntities_block_invoke_587;
    v22[3] = &unk_1E6CE7C30;
    v22[4] = *(_QWORD *)(a1 + 40);
    v7 = v7;
    v23 = v7;
    v8 = v8;
    v24 = v8;
    v19[0] = v15;
    v19[1] = 3221225472;
    v19[2] = ___HDUpdateClinicalRecordEntities_block_invoke_2_588;
    v19[3] = &unk_1E6CE8D20;
    v20 = *(id *)(a1 + 32);
    v21 = v6;
    v16 = objc_msgSend(v14, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT ROWID FROM original_fhir_resources WHERE                          account_id = ? AND type = ? AND id = ?"), a3, v22, v19);

    goto LABEL_8;
  }
  _HKInitializeLogging();
  v17 = *MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138543362;
    v26 = v8;
    _os_log_fault_impl(&dword_1B7802000, v17, OS_LOG_TYPE_FAULT, "UpdateClinicalRecordEntities: HKFHIRIdentifer malformed in migration attempt: %{public}@", buf, 0xCu);
  }

  v16 = 0;
LABEL_8:

  return v16;
}

uint64_t ___HDUpdateClinicalRecordEntities_block_invoke_587()
{
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t ___HDUpdateClinicalRecordEntities_block_invoke_2_588(uint64_t a1, uint64_t a2, uint64_t a3)
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
  v10[2] = ___HDUpdateClinicalRecordEntities_block_invoke_3_591;
  v10[3] = &unk_1E6CE7750;
  v7 = *(_QWORD *)(a1 + 40);
  v10[4] = v5;
  v10[5] = v7;
  v8 = objc_msgSend(v6, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("UPDATE clinical_record_samples SET original_fhir_resource_ROWID = ?                              WHERE ROWID = ?"), a3, v10, 0);

  return v8;
}

uint64_t ___HDUpdateClinicalRecordEntities_block_invoke_3_591()
{
  HDSQLiteBindFoundationValueToStatement();
  return HDSQLiteBindFoundationValueToStatement();
}

@end
