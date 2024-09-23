@implementation NSDictionary(MLRuntime)

- (id)_numberValueForKey:()MLRuntime
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "objectForKeyedSubscript:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (float)mlr_floatValueForKey:()MLRuntime defaultValue:
{
  void *v3;
  void *v4;
  float v5;

  objc_msgSend(a1, "_numberValueForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "floatValue");
    a2 = v5;
  }

  return a2;
}

- (double)mlr_doubleValueForKey:()MLRuntime defaultValue:
{
  void *v3;
  void *v4;
  double v5;

  objc_msgSend(a1, "_numberValueForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    a2 = v5;
  }

  return a2;
}

- (uint64_t)mlr_BOOLValueForKey:()MLRuntime defaultValue:
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "_numberValueForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    a4 = objc_msgSend(v5, "BOOLValue");

  return a4;
}

- (uint64_t)mlr_integerValueForKey:()MLRuntime defaultValue:
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "_numberValueForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    a4 = objc_msgSend(v5, "integerValue");

  return a4;
}

- (uint64_t)mlr_unsignedIntegerValueForKey:()MLRuntime defaultValue:
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "_numberValueForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    a4 = objc_msgSend(v5, "unsignedIntegerValue");

  return a4;
}

- (id)mlr_stringValueForKey:()MLRuntime defaultValue:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "objectForKeyedSubscript:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  if (v10)
    v11 = v10;
  else
    v11 = v7;
  v12 = v11;

  return v12;
}

- (id)mlr_dictionaryValueForKey:()MLRuntime
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "objectForKeyedSubscript:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
