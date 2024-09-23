@implementation NSSet

id __44__NSSet_FCAdditions__fc_unionOfSetsInArray___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;

  v4 = a2;
  objc_msgSend(v4, "fc_safelyUnionSet:", a3);
  return v4;
}

void __59__NSSet_FCAdditions__fc_mutableSetByTransformingWithBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);
    v2 = v3;
  }

}

uint64_t __49__NSSet_FCAdditions__fc_setOfObjectsPassingTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __50__NSSet_FCAdditions__fc_containsAnyObjectInArray___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

uint64_t __55__NSSet_FCAdditions__fc_countOfObjectsIntersectingSet___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

@end
