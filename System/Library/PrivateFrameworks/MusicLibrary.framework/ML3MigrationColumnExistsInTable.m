@implementation ML3MigrationColumnExistsInTable

void __ML3MigrationColumnExistsInTable_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  objc_msgSend(a2, "stringForColumnName:", CFSTR("name"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }

}

@end
