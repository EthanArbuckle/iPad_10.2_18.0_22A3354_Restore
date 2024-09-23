@implementation LSClaimRecord

uint64_t __64__LSClaimRecord_IconServicesAdditions___IS_iconProvideingRecord__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v5 = a2;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)v7)
  {
    objc_msgSend(v5, "iconDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      v7 = 1;
      *a3 = 1;
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

@end
