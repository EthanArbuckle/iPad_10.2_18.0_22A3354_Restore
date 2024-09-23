@implementation LNArrayValueType(CATSupport)

- (id)cat_dialogType
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "memberValueType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cat_dialogType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("[]"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)cat_value:()CATSupport
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];

  objc_msgSend(a3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__LNArrayValueType_CATSupport__cat_value___block_invoke;
  v9[3] = &unk_1E45DBE00;
  v9[4] = a1;
  objc_msgSend(v6, "if_map:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)cat_keyPath
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "memberValueType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cat_keyPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
