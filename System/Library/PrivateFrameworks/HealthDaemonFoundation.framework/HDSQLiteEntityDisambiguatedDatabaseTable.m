@implementation HDSQLiteEntityDisambiguatedDatabaseTable

void __HDSQLiteEntityDisambiguatedDatabaseTable_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 5, 0, 16);
  v1 = (void *)HDSQLiteEntityDisambiguatedDatabaseTable::__databaseTableCache;
  HDSQLiteEntityDisambiguatedDatabaseTable::__databaseTableCache = v0;

}

@end
