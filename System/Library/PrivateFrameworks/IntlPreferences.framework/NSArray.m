@implementation NSArray

uint64_t __69__NSArray_IntlPreferencesAdditions__filteredLanguagesBySearchString___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "evaluateWithObject:", a2);
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(a1 + 48));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    *a7 = 1;
  }
  return result;
}

uint64_t __69__NSArray_IntlPreferencesAdditions__filteredLanguagesBySearchString___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "evaluateWithObject:", a2);
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(a1 + 48));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    *a7 = 1;
  }
  return result;
}

@end
