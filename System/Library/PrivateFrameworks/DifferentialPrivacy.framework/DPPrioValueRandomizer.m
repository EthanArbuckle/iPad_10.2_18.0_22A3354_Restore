@implementation DPPrioValueRandomizer

uint64_t __62___DPPrioValueRandomizer_randomize_withLocalEpsilon_metadata___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  if (!a2)
    return 0;
  v5 = objc_msgSend(*(id *)(a1 + 32), "unsignedLongValue");
  if (v5 >= a3)
    return 0;
  v6 = v5;
  result = 1;
  *(_DWORD *)(a2 + 4 * v6) = 1;
  return result;
}

uint64_t __68___DPPrioValueRandomizer_randomizeVector_withLocalEpsilon_metadata___block_invoke(uint64_t a1, unsigned int *a2, uint64_t a3)
{
  uint64_t v3;
  unsigned __int8 *v6;
  unsigned int v7;
  unsigned int v8;
  _BOOL8 v9;

  v3 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "length") != a3)
    return 0;
  v6 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes");
  if (!v3)
    return 1;
  do
  {
    v8 = *v6++;
    v7 = v8;
    v9 = v8 < 2;
    if (v8 > 1)
      break;
    *a2++ = v7;
    --v3;
  }
  while (v3);
  return v9;
}

@end
