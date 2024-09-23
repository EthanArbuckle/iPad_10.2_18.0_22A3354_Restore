@implementation UTTypeRecord

uint64_t __80__UTTypeRecord_IconServicesAdditions___IS_iconProvidingRecordAcceptingWildCard___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(v3, "iconDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    if (objc_msgSend(v3, "isWildcard"))
    {
      v5 = *(unsigned __int8 *)(a1 + 32);

      if (!v5)
        goto LABEL_6;
    }
    else
    {

    }
    v6 = 1;
    goto LABEL_9;
  }

LABEL_6:
  v6 = 0;
LABEL_9:

  return v6;
}

void __80__UTTypeRecord_IconServicesAdditions___IS_iconProvidingRecordAcceptingWildCard___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

uint64_t __125__UTTypeRecord_IconServicesAdditions___IS_symbolProvidingRecordWithVariantKey_allowNonVariantMatch_preferHeroOverBaseSymbol___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  v4 = v3;
  if (!*(_QWORD *)(a1 + 32))
  {
LABEL_5:
    if (*(_BYTE *)(a1 + 41))
    {
      objc_msgSend(v4, "_IS_symbolHeroName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        goto LABEL_8;
    }
    objc_msgSend(v4, "_IS_symbolName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_8;
LABEL_10:
    v8 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v3, "_IS_symbolNameForVariantKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if (*(_QWORD *)(a1 + 32) && !*(_BYTE *)(a1 + 40))
      goto LABEL_10;
    goto LABEL_5;
  }
LABEL_8:
  v8 = 1;
LABEL_9:

  return v8;
}

void __125__UTTypeRecord_IconServicesAdditions___IS_symbolProvidingRecordWithVariantKey_allowNonVariantMatch_preferHeroOverBaseSymbol___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

@end
