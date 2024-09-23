@implementation UTDeclaredTypeRecord

void __50___UTDeclaredTypeRecord_conformsToTypeIdentifier___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_resolvedPropertyValueForGetter:", sel_pedigree);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4 = v2;
    objc_msgSend(*(id *)(a1 + 40), "lowercaseString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v4, "containsObject:", v3);

    v2 = v4;
  }

}

uint64_t __50___UTDeclaredTypeRecord_conformsToTypeIdentifier___block_invoke(uint64_t a1, void **a2, uint64_t a3, int a4)
{
  uint64_t result;
  unsigned int v8;

  v8 = 0;
  result = _UTGetActiveTypeForCFStringIdentifier(*a2, *(const __CFString **)(a1 + 32), &v8);
  if (result)
  {
    result = _UTTypeConformsTo(*a2, a4, v8);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_DWORD)result != 0;
  }
  return result;
}

void __82___UTDeclaredTypeRecord_childTypeIdentifiersWithContext_tableID_unitID_unitBytes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5;

  if (a4 == 1)
  {
    v5 = (id)_CSStringCopyCFString();
    if (v5)
    {
      if (objc_msgSend(v5, "length"))
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    }

  }
}

void __83___UTDeclaredTypeRecord_parentTypeIdentifiersWithContext_tableID_unitID_unitBytes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5;

  if (a4 == 1)
  {
    v5 = (id)_CSStringCopyCFString();
    if (v5)
    {
      if (objc_msgSend(v5, "length"))
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    }

  }
}

uint64_t __107___UTDeclaredTypeRecord__enumerateRelatedTypeStructuresWithContext_unitID_maximumDegreeOfSeparation_block___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;
  char v7;

  v7 = 0;
  result = (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t, char *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2, a3, a4, &v7);
  *a5 = v7;
  return result;
}

uint64_t __107___UTDeclaredTypeRecord__enumerateRelatedTypeStructuresWithContext_unitID_maximumDegreeOfSeparation_block___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;
  char v7;

  v7 = 0;
  result = (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t, char *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2, a3, -a4, &v7);
  *a5 = v7;
  return result;
}

uint64_t __114___UTDeclaredTypeRecord__enumerateRelatedTypeUnitsOrDynamicIdsWithContext_unitID_maximumDegreeOfSeparation_block___block_invoke(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  char v9;

  if (a5)
  {
    v5 = *(_QWORD *)(result + 32);
    v6 = 0;
    v7 = a5;
    v8 = a3;
    v9 = 1;
    return (*(uint64_t (**)(void))(v5 + 16))();
  }
  return result;
}

@end
