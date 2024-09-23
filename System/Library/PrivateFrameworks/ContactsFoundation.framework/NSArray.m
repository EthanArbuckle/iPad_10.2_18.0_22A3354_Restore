@implementation NSArray

uint64_t __42__NSArray_ContactsFoundation___cn_filter___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __42__NSArray_ContactsFoundation___cn_flatten__block_invoke(uint64_t a1, void *a2)
{
  char isKindOfClass;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "_cn_flatten");
    v5 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "addObjectsFromArray:", v5);
    v6 = (id)v5;
  }
  else
  {
    objc_msgSend(v4, "addObject:", v6);
  }

}

void __43__NSArray_ContactsFoundation___cn_flatMap___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObjectsFromArray:", v2);

}

id __49__NSArray_ContactsFoundation___cn_joinWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;

  v5 = a2;
  v6 = a3;
  if (v5 && objc_msgSend(v5, "count"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_cn_addNonNilObject:", v7);

  }
  objc_msgSend(v5, "addObject:", v6);

  return v5;
}

id __40__NSArray_ContactsFoundation___cn_join___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __65__NSArray_ContactsFoundation___cn_indexOfFirstObjectPassingTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((_DWORD)result)
    *a4 = 1;
  return result;
}

void __54__NSArray_ContactsFoundation___cn_isIdenticalToArray___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;
  id v9;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "objectAtIndex:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 != v8)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

uint64_t __55__NSArray_ContactsFoundation___cn_each_untilCancelled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isCanceled");
}

uint64_t __48__NSArray_ContactsFoundation___cn_each_reverse___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __45__NSArray_ContactsFoundation___cn_partition___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t, id);
  int v5;
  uint64_t v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(uint64_t (**)(uint64_t, id))(v3 + 16);
  v7 = a2;
  v5 = v4(v3, v7);
  v6 = 40;
  if (v5)
    v6 = 32;
  objc_msgSend(*(id *)(a1 + v6), "addObject:", v7);

}

uint64_t __58__NSArray_ContactsFoundation___cn_slicesWithMaximumCount___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(a2, "rangeValue");
  return objc_msgSend(v2, "subarrayWithRange:", v3, v4);
}

uint64_t __66__NSArray_ContactsFoundation___cn_balancedSlicesWithMaximumCount___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(a2, "rangeValue");
  return objc_msgSend(v2, "subarrayWithRange:", v3, v4);
}

void __39__NSArray_ContactsFoundation___cn_zip___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  +[CNPair pairWithFirst:second:](CNPair, "pairWithFirst:second:", a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

@end
