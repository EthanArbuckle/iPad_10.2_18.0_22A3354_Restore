@implementation HDSQLiteEntityAllDatabaseColumnNames

void __HDSQLiteEntityAllDatabaseColumnNames_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8 = v3;
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((v4 & 1) == 0)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v8, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
}

@end
