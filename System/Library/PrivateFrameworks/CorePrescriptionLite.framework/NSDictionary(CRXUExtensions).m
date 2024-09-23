@implementation NSDictionary(CRXUExtensions)

- (uint64_t)crxu_BOOLForKey:()CRXUExtensions
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = objc_msgSend(v1, "BOOLValue");
  else
    v2 = 0;

  return v2;
}

- (uint64_t)crxu_integerForKey:()CRXUExtensions
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = objc_msgSend(v1, "integerValue");
  else
    v2 = 0;

  return v2;
}

- (uint64_t)crxu_uintegerForKey:()CRXUExtensions
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = objc_msgSend(v1, "unsignedIntegerValue");
  else
    v2 = 0;

  return v2;
}

- (double)crxu_doubleForKey:()CRXUExtensions
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 0.0;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v1, "doubleValue");
      v2 = v3;
    }
  }

  return v2;
}

- (id)crxu_stringForKey:()CRXUExtensions
{
  void *v1;
  id v2;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (id)crxu_dataForKey:()CRXUExtensions
{
  void *v1;
  id v2;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (id)crxu_dateForKey:()CRXUExtensions
{
  void *v1;
  id v2;
  void *v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v1)
    goto LABEL_7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v1, "doubleValue");
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:");
      v2 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_7:
    v3 = 0;
    goto LABEL_8;
  }
  v2 = v1;
LABEL_6:
  v3 = v2;
LABEL_8:

  return v3;
}

- (id)crxu_objectOfClass:()CRXUExtensions forKey:
{
  void *v4;
  id v5;

  objc_msgSend(a1, "objectForKey:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (BOOL)crxu_containsKey:()CRXUExtensions
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

@end
