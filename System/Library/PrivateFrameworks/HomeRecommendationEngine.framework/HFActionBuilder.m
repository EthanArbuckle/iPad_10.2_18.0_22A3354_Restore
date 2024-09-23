@implementation HFActionBuilder

id __61__HFActionBuilder_HREAdditions__recommendableObjectsInvolved__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_255A56278))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

uint64_t __56__HFActionBuilder_HREAdditions__hre_sortActionBuilders___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v20;
  void *v21;
  void *v22;

  v4 = a2;
  v5 = a3;
  objc_opt_class();
  v6 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_opt_class();
  v9 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v8)
    v12 = v11 == 0;
  else
    v12 = 1;
  if (v12)
  {
    if (v8)
      v18 = -1;
    else
      v18 = v11 != 0;
  }
  else
  {
    objc_msgSend(v8, "characteristic");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "service");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "uniqueIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "characteristic");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "service");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "uniqueIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v13, "compare:", v17);

  }
  return v18;
}

@end
