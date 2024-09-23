@implementation BMResourcesAndAccessModesListedUnderEntitlement

void __BMResourcesAndAccessModesListedUnderEntitlement_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  BMResourceSpecifier *v6;
  id v7;

  v7 = a3;
  v5 = a2;
  v6 = -[BMResourceSpecifier initWithType:name:]([BMResourceSpecifier alloc], "initWithType:name:", 1, v5);

  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

void __BMResourcesAndAccessModesListedUnderEntitlement_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  BMResourceSpecifier *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = v5;
  if (!*(_BYTE *)(a1 + 48) || objc_msgSend(v5, "isEqualToNumber:", &unk_1E5E48A80))
  {
    v7 = -[BMResourceSpecifier initWithType:name:]([BMResourceSpecifier alloc], "initWithType:name:", *(_QWORD *)(a1 + 40), v8);
    if (v7)
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);

  }
}

void __BMResourcesAndAccessModesListedUnderEntitlement_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v5, "isEqual:", MEMORY[0x1E0C9AAB0]))
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", &unk_1E5E48A68, v9);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mode"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "numberWithUnsignedInteger:", BMAccessModeFromEntitlementAccessModeString((uint64_t)v7));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v9);

    }
  }

}

void __BMResourcesAndAccessModesListedUnderEntitlement_block_invoke_199(uint64_t a1, void *a2, void *a3)
{
  id v5;
  BMResourceSpecifier *v6;
  id v7;

  v7 = a3;
  v5 = a2;
  v6 = -[BMResourceSpecifier initWithType:name:]([BMResourceSpecifier alloc], "initWithType:name:", 1, v5);

  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

void __BMResourcesAndAccessModesListedUnderEntitlement_block_invoke_201(uint64_t a1, void *a2, void *a3)
{
  id v5;
  BMResourceSpecifier *v6;
  id v7;

  v7 = a3;
  v5 = a2;
  v6 = -[BMResourceSpecifier initWithType:name:]([BMResourceSpecifier alloc], "initWithType:name:", 1, v5);

  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

void __BMResourcesAndAccessModesListedUnderEntitlement_block_invoke_2_202(uint64_t a1, void *a2, void *a3)
{
  id v5;
  BMResourceSpecifier *v6;
  id v7;

  v7 = a3;
  v5 = a2;
  v6 = -[BMResourceSpecifier initWithType:name:]([BMResourceSpecifier alloc], "initWithType:name:", 1, v5);

  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

@end
