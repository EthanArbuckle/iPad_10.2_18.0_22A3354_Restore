@implementation HDSampleTypesDeletionEntry

HDSourceEntity *__56___HDSampleTypesDeletionEntry_applyEntries_withProfile___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HDSourceEntity *v3;
  uint64_t v4;

  v2 = a2;
  v3 = [HDSourceEntity alloc];
  v4 = objc_msgSend(v2, "longLongValue");

  return -[HDSQLiteEntity initWithPersistentID:](v3, "initWithPersistentID:", v4);
}

@end
