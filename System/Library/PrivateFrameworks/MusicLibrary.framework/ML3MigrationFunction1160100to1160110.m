@implementation ML3MigrationFunction1160100to1160110

void __ML3MigrationFunction1160100to1160110_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = objc_msgSend(v3, "int64ForColumnIndex:", 0);
  objc_msgSend(v3, "stringForColumnIndex:", 1);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("m4p"));

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UPDATE item_store_new SET is_protected = 1 WHERE item_pid = %lld"), v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

  }
}

@end
