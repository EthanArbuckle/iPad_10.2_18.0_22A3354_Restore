@implementation NSSet

void __20__NSSet_IC__ic_map___block_invoke(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);

}

void __27__NSSet_IC__ic_compactMap___block_invoke(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "ic_addNonNilObject:", v2);

}

uint64_t __34__NSSet_IC__ic_objectPassingTest___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((_DWORD)result)
    *a3 = 1;
  return result;
}

uint64_t __48__NSSet_IC__ic_containsObjectMatchingPredicate___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "evaluateWithObject:", a2);
  if ((_DWORD)result)
    *a3 = 1;
  return result;
}

uint64_t __44__NSSet_IC__ic_objectsConformingToProtocol___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conformsToProtocol:", *(_QWORD *)(a1 + 32));
}

uint64_t __31__NSSet_IC__ic_objectsOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

uint64_t __30__NSSet_IC__ic_objectOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

@end
