@implementation AXAddVoiceFootprintsToArrayForDialectWithResources

uint64_t __AXAddVoiceFootprintsToArrayForDialectWithResources_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    v9 = objc_msgSend(v5, "footprint");

    v10 = v9 < objc_msgSend(v4, "footprint");
  }
  else
  {
    objc_msgSend(v5, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "localizedCompare:", v12);

  }
  return v10;
}

BOOL __AXAddVoiceFootprintsToArrayForDialectWithResources_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  _BOOL8 v9;

  v3 = a2;
  v4 = objc_msgSend(v3, "subtype");
  v5 = objc_msgSend(*(id *)(a1 + 32), "subtype");
  if (objc_msgSend(v3, "type") == 3)
  {
    objc_msgSend(v3, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
      v9 = *(id *)(a1 + 32) != v3 && v4 > v5;
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __AXAddVoiceFootprintsToArrayForDialectWithResources_block_invoke_231(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedCompare:");
}

@end
