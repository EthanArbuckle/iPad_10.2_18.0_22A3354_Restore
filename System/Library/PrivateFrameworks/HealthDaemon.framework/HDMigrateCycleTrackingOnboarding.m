@implementation HDMigrateCycleTrackingOnboarding

uint64_t ___HDMigrateCycleTrackingOnboarding_block_invoke(uint64_t a1, uint64_t a2)
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

uint64_t ___HDMigrateCycleTrackingOnboarding_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  MEMORY[0x1BCCAB198](a2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 1;
}

uint64_t ___HDMigrateCycleTrackingOnboarding_block_invoke_635(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  MEMORY[0x1BCCAB198](a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  return 1;
}

BOOL ___HDMigrateCycleTrackingOnboarding_block_invoke_2_636(uint64_t a1, void *a2)
{
  double v2;

  objc_msgSend(a2, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return fabs(v2) < 1.0;
}

uint64_t ___HDMigrateCycleTrackingOnboarding_block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 3, 1);
  HDSQLiteBindFoundationValueToStatement();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_bind_int(a2, 6, 0);
  sqlite3_bind_int64(a2, 7, 0);
  return sqlite3_bind_int64(a2, 8, *(_QWORD *)(a1 + 40));
}

@end
