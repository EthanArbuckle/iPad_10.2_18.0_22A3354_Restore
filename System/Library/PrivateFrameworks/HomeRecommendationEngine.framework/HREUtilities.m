@implementation HREUtilities

+ (id)accessoryCategoryAnalyticsDescription:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t (**v6)(_QWORD);
  id v7;
  uint64_t (**v8)(_QWORD);
  void *v9;
  void *v10;
  id v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;

  v3 = a3;
  v4 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __54__HREUtilities_accessoryCategoryAnalyticsDescription___block_invoke;
  v25[3] = &unk_24F218AD0;
  v5 = v3;
  v26 = v5;
  v6 = (uint64_t (**)(_QWORD))MEMORY[0x22E2C9AF4](v25);
  v20 = v4;
  v21 = 3221225472;
  v22 = __54__HREUtilities_accessoryCategoryAnalyticsDescription___block_invoke_3;
  v23 = &unk_24F218AD0;
  v7 = v5;
  v24 = v7;
  v8 = (uint64_t (**)(_QWORD))MEMORY[0x22E2C9AF4](&v20);
  objc_msgSend(v7, "accessories", v20, v21, v22, v23);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "na_map:", &__block_literal_global_8_0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count") == 1)
  {
    objc_msgSend(v10, "anyObject");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  if ((v6[2](v6) & 1) != 0)
  {
    v12 = CFSTR("MixedServiceGroup");
    if (!v11)
      goto LABEL_15;
  }
  else if ((v8[2](v8) & 1) != 0)
  {
    v12 = CFSTR("MixedMediaAccessory");
    if (!v11)
      goto LABEL_15;
  }
  else if (v11)
  {
    v12 = 0;
  }
  else
  {
    v11 = (id)*MEMORY[0x24BDD49F8];
    v12 = 0;
    if (!v11)
    {
LABEL_15:
      v16 = 0;
      goto LABEL_18;
    }
  }
  objc_msgSend(MEMORY[0x24BDD7308], "hf_getUserFriendlyDescriptionKey:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD7950], "hf_getUserFriendlyDescriptionKey:", v11);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;

LABEL_18:
  if (v16)
    v17 = v16;
  else
    v17 = (__CFString *)v12;
  v18 = v17;

  return v18;
}

uint64_t __54__HREUtilities_accessoryCategoryAnalyticsDescription___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "services");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_all:", &__block_literal_global_14);

  return v2;
}

BOOL __54__HREUtilities_accessoryCategoryAnalyticsDescription___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "hf_serviceGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t __54__HREUtilities_accessoryCategoryAnalyticsDescription___block_invoke_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_6_4);

  return v2;
}

uint64_t __54__HREUtilities_accessoryCategoryAnalyticsDescription___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isMediaAccessory");
}

uint64_t __54__HREUtilities_accessoryCategoryAnalyticsDescription___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_categoryOrPrimaryServiceType");
}

@end
