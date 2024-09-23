@implementation SYSharedServiceDB

uint64_t __32___SYSharedServiceDB_initialize__block_invoke()
{
  return +[_SYSharedServiceDB pairingStorePathWasReset](_SYSharedServiceDB, "pairingStorePathWasReset");
}

uint64_t __48___SYSharedServiceDB__ensureSchemaVersionsTable__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_LOCKED_ensureSchemaVersionsTableInDB:", a2);
}

uint64_t __44___SYSharedServiceDB__LOCKED_ensureDBExists__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_LOCKED_runSchemaUpdate:forClientNamed:", a3, a2);
}

void __46___SYSharedServiceDB_UnitTestHelpers___dbPath__block_invoke(uint64_t a1, sqlite3 *db)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = sqlite3_db_filename(db, "main");
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v3);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

@end
