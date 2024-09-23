@implementation HDMigrateClinicalSources

uint64_t ___HDMigrateClinicalSources_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;
  void *v11;
  _QWORD v12[5];

  MEMORY[0x1BCCAB1D4](a2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "protectedDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = ___HDMigrateClinicalSources_block_invoke_2;
  v12[3] = &unk_1E6CE9508;
  v12[4] = v5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = ___HDMigrateClinicalSources_block_invoke_3;
  v9[3] = &unk_1E6CE8D20;
  v10 = *(id *)(a1 + 32);
  v11 = v5;
  v7 = objc_msgSend(v6, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT external_id FROM clinical_accounts             LEFT JOIN clinical_gateways ON clinical_accounts.gateway_id = clinical_gateways.ROWID             WHERE HEX(clinical_accounts.identifier) = ?"), a3, v12, v9);

  return v7;
}

uint64_t ___HDMigrateClinicalSources_block_invoke_2()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t ___HDMigrateClinicalSources_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[6];

  MEMORY[0x1BCCAB1D4](a2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "unprotectedDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = ___HDMigrateClinicalSources_block_invoke_4;
  v10[3] = &unk_1E6CE7750;
  v7 = *(_QWORD *)(a1 + 40);
  v10[4] = v5;
  v10[5] = v7;
  v8 = objc_msgSend(v6, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("UPDATE public_clinical_sources SET gateway_id = ? WHERE account_id = ?"), a3, v10, 0);

  return v8;
}

uint64_t ___HDMigrateClinicalSources_block_invoke_4()
{
  HDSQLiteBindFoundationValueToStatement();
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t ___HDMigrateClinicalSources_block_invoke_5(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

@end
