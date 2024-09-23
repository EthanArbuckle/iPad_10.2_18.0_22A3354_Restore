@implementation NSOrderedSet

uint64_t __55__NSOrderedSet_IC__ic_containsObjectMatchingPredicate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "evaluateWithObject:", a2);
  if ((_DWORD)result)
    *a4 = 1;
  return result;
}

void __50__NSOrderedSet_IC__ic_objectsMovedFromOrderedSet___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "indexOfObject:") != a3
                                                         - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 32), "removeObject:", v5);
  }

}

@end
