@implementation NSIndexSet

uint64_t __42__NSIndexSet_ContactsFoundation___cn_all___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

uint64_t __42__NSIndexSet_ContactsFoundation___cn_any___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

uint64_t __43__NSIndexSet_ContactsFoundation___cn_each___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __45__NSIndexSet_ContactsFoundation___cn_filter___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "addIndex:", a2);
  return result;
}

void __46__NSIndexSet_ContactsFoundation___cn_flatMap___block_invoke(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addIndexes:", v2);

}

void __42__NSIndexSet_ContactsFoundation___cn_map___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 32);
  CNNilToNull_block_invoke_2((uint64_t)&__block_literal_global_1_2, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

}

void __48__NSIndexSet_ContactsFoundation___cn_mapRanges___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  CNNilToNull_block_invoke_2((uint64_t)&__block_literal_global_1_2, v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

@end
