@implementation HDAddUniquenessChecksumToOriginalFHIRResourceEntity

uint64_t ___HDAddUniquenessChecksumToOriginalFHIRResourceEntity_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = HDSQLiteColumnAsInt64();
  MEMORY[0x1BCCAB18C](a2, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, &v25);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v25;
  if (v8)
  {
    v24 = v9;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v8, 10, &v24);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v24;

    if (v10)
    {
      v12 = v10;
    }
    else
    {
      _HKInitializeLogging();
      v15 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v11;
        _os_log_fault_impl(&dword_1B7802000, v15, OS_LOG_TYPE_FAULT, "HDDatabaseMigrator (Sydney) failed to encode JSON object: %@", buf, 0xCu);
      }
      v12 = v7;
    }
    objc_msgSend(v12, "hk_MD5");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  _HKInitializeLogging();
  v13 = *MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v9;
    _os_log_fault_impl(&dword_1B7802000, v13, OS_LOG_TYPE_FAULT, "HDDatabaseMigrator (Sydney) failed to decode JSON data: %@", buf, 0xCu);
    if (v7)
      goto LABEL_6;
LABEL_14:
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hk_MD5");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9;
LABEL_11:

    v9 = v11;
    goto LABEL_12;
  }
  if (!v7)
    goto LABEL_14;
LABEL_6:
  objc_msgSend(v7, "hk_MD5");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
  v17 = *(void **)(a1 + 32);
  v16 = *(_QWORD *)(a1 + 40);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = ___HDAddUniquenessChecksumToOriginalFHIRResourceEntity_block_invoke_889;
  v21[3] = &unk_1E6CE82D8;
  v22 = v14;
  v23 = v6;
  v18 = v14;
  v19 = objc_msgSend(v17, "executeSQL:error:bindingHandler:enumerationHandler:", v16, a3, v21, 0);

  return v19;
}

uint64_t ___HDAddUniquenessChecksumToOriginalFHIRResourceEntity_block_invoke_889(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  return sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
}

@end
