@implementation NSUserDefaults(BoxingUtils)

- (uint64_t)BOOLValueSafeForKey:()BoxingUtils
{
  return objc_msgSend(a1, "BOOLValueSafeForKey:status:", a3, 0);
}

- (uint64_t)BOOLValueSafeForKey:()BoxingUtils status:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v11;

  v6 = a3;
  v11 = 0;
  objc_msgSend(a1, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    v9 = 0;
    v11 = -6727;
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  v9 = objc_msgSend(v7, "BOOLValueSafe:", &v11);
  if (a4)
LABEL_3:
    *a4 = v11;
LABEL_4:

  return v9;
}

- (uint64_t)int64ValueSafeForKey:()BoxingUtils
{
  return objc_msgSend(a1, "int64ValueSafeForKey:status:", a3, 0);
}

- (uint64_t)int64ValueSafeForKey:()BoxingUtils status:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v11;

  v6 = a3;
  v11 = 0;
  objc_msgSend(a1, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    v9 = 0;
    v11 = -6727;
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  v9 = objc_msgSend(v7, "int64ValueSafe:", &v11);
  if (a4)
LABEL_3:
    *a4 = v11;
LABEL_4:

  return v9;
}

- (uint64_t)doubleValueSafeForKey:()BoxingUtils
{
  return objc_msgSend(a1, "doubleValueSafeForKey:status:", a3, 0);
}

- (double)doubleValueSafeForKey:()BoxingUtils status:
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  int v12;

  v6 = a3;
  v12 = 0;
  objc_msgSend(a1, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    v12 = -6727;
    v10 = 0.0;
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(v7, "doubleValueSafe:", &v12);
  v10 = v9;
  if (a4)
LABEL_3:
    *a4 = v12;
LABEL_4:

  return v10;
}

- (id)stringValueSafeForKey:()BoxingUtils
{
  objc_msgSend(a1, "stringValueSafeForKey:status:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (__CFString)stringValueSafeForKey:()BoxingUtils status:
{
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  int v13;

  v6 = a3;
  v13 = 0;
  objc_msgSend(a1, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "stringValueSafe:", &v13);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  v9 = 0;
  v13 = -6727;
  if (a4)
LABEL_3:
    *a4 = v13;
LABEL_4:
  v10 = &stru_1E25DF9F8;
  if (v9)
    v10 = v9;
  v11 = v10;

  return v11;
}

- (uint64_t)utf8ValueSafeForKey:()BoxingUtils
{
  return objc_msgSend(a1, "utf8ValueSafeForKey:status:", a3, 0);
}

- (const)utf8ValueSafeForKey:()BoxingUtils status:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  int v12;

  v6 = a3;
  v12 = 0;
  objc_msgSend(a1, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "utf8ValueSafe:", &v12);
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  v9 = 0;
  v12 = -6727;
  if (a4)
LABEL_3:
    *a4 = v12;
LABEL_4:
  if (v9)
    v10 = (const char *)v9;
  else
    v10 = "";

  return v10;
}

@end
