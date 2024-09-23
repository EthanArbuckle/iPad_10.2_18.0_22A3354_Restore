@implementation LSBundleRecord

uint64_t __75__LSBundleRecord_IconServicesAdditions___IS_iconProvidingLineageForRecord___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "iconDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {

    goto LABEL_5;
  }
  v4 = objc_msgSend(v2, "isWildcard");

  if ((v4 & 1) != 0)
  {
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  v5 = 1;
LABEL_6:

  return v5;
}

id __75__LSBundleRecord_IconServicesAdditions___IS_iconProvidingLineageForRecord___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  CFSetGetValue(*(CFSetRef *)(a1 + 32), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    CFSetGetValue(*(CFSetRef *)(a1 + 40), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

void __75__LSBundleRecord_IconServicesAdditions___IS_iconProvidingLineageForRecord___block_invoke_3(_QWORD *a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  void *v8;
  void *v9;

  (*(void (**)(void))(a1[6] + 16))();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v9 = v6;
    v7 = (*(uint64_t (**)(void))(a1[7] + 16))();
    v8 = (void *)a1[4];
    if (v7)
    {
      objc_msgSend(v8, "addObject:", v9);
      *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = 1;
      *a4 = 1;
    }
    else
    {
      objc_msgSend(v8, "addObject:", a1[5]);
    }
    v6 = v9;
  }
  else
  {
    *a4 = 1;
  }

}

@end
