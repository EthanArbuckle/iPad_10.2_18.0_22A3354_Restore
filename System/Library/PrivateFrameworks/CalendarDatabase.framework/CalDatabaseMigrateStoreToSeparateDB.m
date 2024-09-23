@implementation CalDatabaseMigrateStoreToSeparateDB

void ___CalDatabaseMigrateStoreToSeparateDB_block_invoke(uint64_t a1, uint64_t a2)
{
  sqlite3_stmt *v2;
  id v3;

  v2 = *(sqlite3_stmt **)(a2 + 8);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(v2, 1, (const char *)objc_msgSend(v3, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

}

uint64_t ___CalDatabaseMigrateStoreToSeparateDB_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return sqlite3_bind_int64(*(sqlite3_stmt **)(a2 + 8), 1, *(_QWORD *)(a1 + 32));
}

uint64_t ___CalDatabaseMigrateStoreToSeparateDB_block_invoke_3(uint64_t a1, uint64_t a2)
{
  sqlite3_stmt *v4;
  id v5;

  v4 = *(sqlite3_stmt **)(a2 + 8);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(v4, 1, (const char *)objc_msgSend(v5, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  return sqlite3_bind_text(*(sqlite3_stmt **)(a2 + 8), 2, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

uint64_t ___CalDatabaseMigrateStoreToSeparateDB_block_invoke_43(uint64_t a1, uint64_t a2)
{
  sqlite3_stmt *v3;
  int ID;

  sqlite3_bind_text(*(sqlite3_stmt **)(a2 + 8), 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  v3 = *(sqlite3_stmt **)(a2 + 8);
  ID = CPRecordGetID();
  return sqlite3_bind_int(v3, 2, ID);
}

@end
