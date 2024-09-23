@implementation HMImmutableSetting(HFAdditions)

- (id)value
{
  id v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;

  objc_opt_class();
  v2 = a1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  objc_opt_class();
  v5 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_opt_class();
  v8 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_opt_class();
  v11 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  objc_opt_class();
  v14 = v11;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  objc_opt_class();
  v17 = v14;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = v17;
  else
    v18 = 0;
  v19 = v18;

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "BOOLValue"));
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else if (v7)
  {
    objc_msgSend(v7, "stringValue");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "integerValue"));
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else if (v13)
  {
    objc_msgSend(v13, "stringListValue");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else if (v16)
  {
    objc_msgSend(v16, "languageValues");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v19)
    {
      v21 = 0;
      goto LABEL_32;
    }
    objc_msgSend(v19, "languageValue");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v20;
LABEL_32:

  return v21;
}

- (id)homeKitAccessorySettingValueForRawValue:()HFAdditions
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  unint64_t v16;
  id v17;
  void *v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;

  v4 = a3;
  objc_opt_class();
  v5 = a1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_opt_class();
  v8 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_opt_class();
  v11 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  objc_opt_class();
  v14 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  objc_opt_class();
  v17 = v14;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = v17;
  else
    v18 = 0;
  v19 = v18;

  v20 = 0;
  if (v16 | v19)
  {
    if (v7)
    {
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CBA7F8]), "initWithBoolValue:", objc_msgSend((id)v16, "BOOLValue"));
    }
    else if (v13)
    {
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CBA808]), "initWithIntegerValue:", objc_msgSend((id)v16, "integerValue"));
    }
    else
    {
      if (!v10)
      {
        v20 = 0;
        goto LABEL_24;
      }
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CBA818]), "initWithStringValue:", v19);
    }
    v20 = (void *)v21;
  }
LABEL_24:

  return v20;
}

@end
