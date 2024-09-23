@implementation NSIndexSet

uint64_t __94__NSIndexSet_EDServerMessagePersistence__ed_nextRangesWithRangeCountLimit_reverseEnumeration___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v4;

  if (*(_QWORD *)(result + 48) <= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    *a4 = 1;
  }
  else
  {
    v4 = result;
    result = objc_msgSend(*(id *)(result + 32), "addIndexesInRange:", a2, a3);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v4 + 40) + 8) + 24);
  }
  return result;
}

uint64_t __77__NSIndexSet_EDServerMessagePersistence__ed_uidQueryExpressionWithTableName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "rangeValue");
  v6 = v5;
  objc_msgSend(v4, "rangeValue");
  v8 = 1;
  if (v6 >= v7)
    v8 = -1;
  if (v6 == v7)
    v9 = 0;
  else
    v9 = v8;

  return v9;
}

void __66__NSIndexSet_EDServerMessagePersistence___uidRangesAndSingleUIDs___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  id v4;

  if (a3)
  {
    if (a3 > 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a2, a3);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "addObject:");

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_addUIDsFromRange:toArray:", a2, a3, *(_QWORD *)(a1 + 40));
    }
  }
}

id __99__NSIndexSet_EDServerMessagePersistence___uidQueryExpressionForRanges_andSingleUIDs_withTableName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  v4 = objc_msgSend(v3, "rangeValue");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ BETWEEN %lu AND %lu)"), *(_QWORD *)(a1 + 32), v4, v5 + v4 - 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __59__NSIndexSet_EDServerMessagePersistence__ed_logDescription__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  if (a3 == 1)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), a2);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu:%llu"), a2, a3 + a2 - 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:");

}

@end
