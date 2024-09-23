@implementation HDUpdateSDKVersionTokenFieldOnSubscriptionsTable

uint64_t ___HDUpdateSDKVersionTokenFieldOnSubscriptionsTable_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[6];

  v5 = HDSQLiteColumnAsInt64();
  HDSQLiteColumnAsInt64();
  HKBitPatternCastSignedToUnsignedInt64();
  v6 = HKBitPatternCastUnsignedToSignedInt64();
  objc_msgSend(*(id *)(a1 + 32), "unprotectedDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = ___HDUpdateSDKVersionTokenFieldOnSubscriptionsTable_block_invoke_2;
  v10[3] = &__block_descriptor_48_e23_v16__0__sqlite3_stmt__8l;
  v10[4] = v6;
  v10[5] = v5;
  v8 = objc_msgSend(v7, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("UPDATE subscription_app_launch SET sdk_version = ? WHERE ROWID = ?"), a3, v10, 0);

  return v8;
}

uint64_t ___HDUpdateSDKVersionTokenFieldOnSubscriptionsTable_block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
  return sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
}

@end
