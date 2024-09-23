@implementation ML3MigrationFunction1560000to1610000

void __ML3MigrationFunction1560000to1610000_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    if (!a3)
    {
      v4 = a2;
      objc_msgSend(v4, "numberForColumnIndex:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringForColumnIndex:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = *(void **)(a1 + 32);
      v9[0] = v5;
      v9[1] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "executeUpdate:withParameters:error:", CFSTR("INSERT OR REPLACE INTO account (dsid, apple_id) VALUES(?, ?)"), v8, 0);

    }
  }
}

@end
