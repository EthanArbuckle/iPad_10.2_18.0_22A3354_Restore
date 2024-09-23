@implementation HDAppAnalyticsAcceptanceEntity

+ (id)acceptanceForAgreement:(id)a3 version:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  int64_t v24;
  _QWORD v25[4];
  id v26;
  int64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v10 = a3;
  v11 = a5;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  v33 = 0;
  objc_msgSend(v11, "databaseForEntityClass:", a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "disambiguatedDatabaseTable");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("SELECT %@, %@ FROM %@ WHERE %@ == ? AND %@ == ?"), CFSTR("accepted"), CFSTR("modification_date"), v14, CFSTR("agreement"), CFSTR("version"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __83__HDAppAnalyticsAcceptanceEntity_acceptanceForAgreement_version_transaction_error___block_invoke;
  v25[3] = &unk_250E7E1E0;
  v26 = v10;
  v27 = a4;
  v21[0] = v16;
  v21[1] = 3221225472;
  v21[2] = __83__HDAppAnalyticsAcceptanceEntity_acceptanceForAgreement_version_transaction_error___block_invoke_2;
  v21[3] = &unk_250E7E208;
  v23 = &v28;
  v17 = v26;
  v22 = v17;
  v24 = a4;
  if (objc_msgSend(v12, "executeSQL:error:bindingHandler:enumerationHandler:", v15, a6, v25, v21))
    v18 = (void *)v29[5];
  else
    v18 = 0;
  v19 = v18;

  _Block_object_dispose(&v28, 8);
  return v19;
}

uint64_t __83__HDAppAnalyticsAcceptanceEntity_acceptanceForAgreement_version_transaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  return sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
}

uint64_t __83__HDAppAnalyticsAcceptanceEntity_acceptanceForAgreement_version_transaction_error___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  double v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v4 = MEMORY[0x24263C2E0](a2, 0);
  v5 = MEMORY[0x24263C2EC](a2, 1);
  v6 = objc_alloc(MEMORY[0x24BE3F810]);
  v7 = a1[4];
  v8 = a1[6];
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "initForAgreement:version:accepted:modificationDate:", v7, v8, v4, v9);
  v11 = *(_QWORD *)(a1[5] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  return 1;
}

+ (id)acceptancesForAgreement:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;

  v8 = a3;
  v9 = (objc_class *)MEMORY[0x24BDBCEB8];
  v10 = a4;
  v11 = objc_alloc_init(v9);
  objc_msgSend(v10, "databaseForEntityClass:", a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "disambiguatedDatabaseTable");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("SELECT %@, %@, %@ FROM %@ WHERE %@ == ? ORDER BY %@ ASC"), CFSTR("accepted"), CFSTR("version"), CFSTR("modification_date"), v14, CFSTR("agreement"), CFSTR("version"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __76__HDAppAnalyticsAcceptanceEntity_acceptancesForAgreement_transaction_error___block_invoke;
  v25[3] = &unk_250E7E230;
  v26 = v8;
  v22[0] = v16;
  v22[1] = 3221225472;
  v22[2] = __76__HDAppAnalyticsAcceptanceEntity_acceptancesForAgreement_transaction_error___block_invoke_2;
  v22[3] = &unk_250E7E258;
  v23 = v11;
  v24 = v26;
  v17 = v26;
  v18 = v11;
  if (objc_msgSend(v12, "executeSQL:error:bindingHandler:enumerationHandler:", v15, a5, v25, v22))
    v19 = v18;
  else
    v19 = 0;
  v20 = v19;

  return v20;
}

uint64_t __76__HDAppAnalyticsAcceptanceEntity_acceptancesForAgreement_transaction_error___block_invoke()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __76__HDAppAnalyticsAcceptanceEntity_acceptancesForAgreement_transaction_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  double v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = MEMORY[0x24263C2E0](a2, 0);
  v5 = HDSQLiteColumnAsInt64();
  v6 = MEMORY[0x24263C2EC](a2, 2);
  v7 = *(void **)(a1 + 32);
  v8 = objc_alloc(MEMORY[0x24BE3F810]);
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initForAgreement:version:accepted:modificationDate:", v9, v5, v4, v10);
  objc_msgSend(v7, "addObject:", v11);

  return 1;
}

+ (id)allAcceptancesInTransaction:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;

  v6 = (objc_class *)MEMORY[0x24BDBCED8];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v7, "databaseForEntityClass:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "disambiguatedDatabaseTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("SELECT %@, %@, %@, %@ FROM %@ ORDER BY %@ ASC, %@ ASC"), CFSTR("agreement"), CFSTR("accepted"), CFSTR("version"), CFSTR("modification_date"), v11, CFSTR("agreement"), CFSTR("version"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __68__HDAppAnalyticsAcceptanceEntity_allAcceptancesInTransaction_error___block_invoke;
  v17[3] = &unk_250E7E280;
  v18 = v8;
  v13 = v8;
  if (objc_msgSend(v9, "executeSQL:error:bindingHandler:enumerationHandler:", v12, a4, 0, v17))
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  return v15;
}

uint64_t __68__HDAppAnalyticsAcceptanceEntity_allAcceptancesInTransaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  MEMORY[0x24263C304](a2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24263C2E0](a2, 1);
  v6 = HDSQLiteColumnAsInt64();
  v7 = MEMORY[0x24263C2EC](a2, 3);
  v8 = objc_alloc(MEMORY[0x24BE3F810]);
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initForAgreement:version:accepted:modificationDate:", v4, v6, v5, v9);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, v4);
  }
  objc_msgSend(v11, "addObject:", v10);

  return 1;
}

+ (BOOL)setAcceptance:(BOOL)a3 agreement:(id)a4 version:(int64_t)a5 modificationDate:(id)a6 transaction:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  int64_t v33;
  BOOL v34;
  _QWORD v35[4];
  id v36;
  _QWORD *v37;
  uint64_t *v38;
  _QWORD v39[4];
  id v40;
  int64_t v41;
  _QWORD v42[3];
  char v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;

  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "disambiguatedDatabaseTable");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("SELECT %@ FROM %@ WHERE %@ == ? AND %@ == ?"), CFSTR("modification_date"), v17, CFSTR("agreement"), CFSTR("version"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v43 = 0;
  v29 = v15;
  objc_msgSend(v15, "databaseForEntityClass:", a1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x24BDAC760];
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __101__HDAppAnalyticsAcceptanceEntity_setAcceptance_agreement_version_modificationDate_transaction_error___block_invoke;
  v39[3] = &unk_250E7E1E0;
  v21 = v13;
  v40 = v21;
  v41 = a5;
  v35[0] = v20;
  v35[1] = 3221225472;
  v35[2] = __101__HDAppAnalyticsAcceptanceEntity_setAcceptance_agreement_version_modificationDate_transaction_error___block_invoke_2;
  v35[3] = &unk_250E7E2A8;
  v37 = v42;
  v22 = v14;
  v36 = v22;
  v38 = &v44;
  if ((objc_msgSend(v19, "executeSQL:error:bindingHandler:enumerationHandler:", v18, a8, v39, v35) & 1) != 0)
  {
    if (*((_BYTE *)v45 + 24))
    {
      v23 = 1;
    }
    else
    {
      v24 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(a1, "disambiguatedDatabaseTable");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", CFSTR("INSERT OR REPLACE INTO %@ (%@, %@, %@, %@) VALUES (?, ?, ?, ?)"), v25, CFSTR("agreement"), CFSTR("version"), CFSTR("accepted"), CFSTR("modification_date"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v30[0] = v20;
      v30[1] = 3221225472;
      v30[2] = __101__HDAppAnalyticsAcceptanceEntity_setAcceptance_agreement_version_modificationDate_transaction_error___block_invoke_3;
      v30[3] = &unk_250E7E2D0;
      v31 = v21;
      v33 = a5;
      v34 = a3;
      v32 = v22;
      v23 = objc_msgSend(v19, "executeSQL:error:bindingHandler:enumerationHandler:", v26, a8, v30, 0);

    }
  }
  else
  {
    v23 = 0;
  }

  _Block_object_dispose(v42, 8);
  _Block_object_dispose(&v44, 8);

  return v23;
}

uint64_t __101__HDAppAnalyticsAcceptanceEntity_setAcceptance_agreement_version_modificationDate_transaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  return sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
}

uint64_t __101__HDAppAnalyticsAcceptanceEntity_setAcceptance_agreement_version_modificationDate_transaction_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  double v3;
  double v4;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v3 = MEMORY[0x24263C2EC](a2, 0);
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
  if (v3 > v4)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  return 1;
}

uint64_t __101__HDAppAnalyticsAcceptanceEntity_setAcceptance_agreement_version_modificationDate_transaction_error___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 48));
  sqlite3_bind_int(a2, 3, *(unsigned __int8 *)(a1 + 56));
  return HDSQLiteBindFoundationValueToStatement();
}

+ (BOOL)deleteAcceptanceForAgreement:(id)a3 version:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  int64_t v19;

  v10 = a3;
  objc_msgSend(a5, "databaseForEntityClass:", a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "disambiguatedDatabaseTable");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ == ? AND %@ == ?"), v13, CFSTR("agreement"), CFSTR("version"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __89__HDAppAnalyticsAcceptanceEntity_deleteAcceptanceForAgreement_version_transaction_error___block_invoke;
  v17[3] = &unk_250E7E1E0;
  v18 = v10;
  v19 = a4;
  v15 = v10;
  LOBYTE(a6) = objc_msgSend(v11, "executeSQL:error:bindingHandler:enumerationHandler:", v14, a6, v17, 0);

  return (char)a6;
}

uint64_t __89__HDAppAnalyticsAcceptanceEntity_deleteAcceptanceForAgreement_version_transaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  return sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
}

+ (BOOL)deleteAcceptancesForAgreement:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;

  v8 = a3;
  objc_msgSend(a4, "databaseForEntityClass:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "disambiguatedDatabaseTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ == ?"), v11, CFSTR("agreement"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __82__HDAppAnalyticsAcceptanceEntity_deleteAcceptancesForAgreement_transaction_error___block_invoke;
  v15[3] = &unk_250E7E230;
  v16 = v8;
  v13 = v8;
  LOBYTE(a5) = objc_msgSend(v9, "executeSQL:error:bindingHandler:enumerationHandler:", v12, a5, v15, 0);

  return (char)a5;
}

uint64_t __82__HDAppAnalyticsAcceptanceEntity_deleteAcceptancesForAgreement_transaction_error___block_invoke()
{
  return HDSQLiteBindFoundationValueToStatement();
}

+ (id)databaseTable
{
  return CFSTR("HealthAppDatabaseSchema_app_analytics_acceptance");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 5;
  return (const $52F87C9E6B9B8AC887B293D94B864E2B *)columnDefinitionsWithCount__columnDefinitions;
}

+ (id)uniquedColumns
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("agreement");
  v3[1] = CFSTR("version");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (int64_t)protectionClass
{
  return 1;
}

@end
