@implementation ML3MigrationFunction1160140to1160150

void __ML3MigrationFunction1160140to1160150_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "numberForColumnIndex:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForColumnIndex:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v5);
}

void __ML3MigrationFunction1160140to1160150_block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (objc_msgSend(v8, "length"))
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", ML3KindForString(v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v10;
    v12[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = objc_msgSend(v9, "executeUpdate:withParameters:error:", CFSTR("UPDATE item_extra set location_kind_id = ? WHERE location_kind_id = ?"), v11, 0);

    if ((v9 & 1) == 0)
    {
      *a4 = 1;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    }
  }

}

@end
