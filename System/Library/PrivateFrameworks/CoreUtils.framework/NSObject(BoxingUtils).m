@implementation NSObject(BoxingUtils)

- (BOOL)BOOLValueSafe
{
  return CFGetInt64(a1, 0) != 0;
}

- (BOOL)BOOLValueSafe:()BoxingUtils
{
  return CFGetInt64(a1, a3) != 0;
}

- (unint64_t)int64ValueSafe
{
  return CFGetInt64(a1, 0);
}

- (unint64_t)int64ValueSafe:()BoxingUtils
{
  return CFGetInt64(a1, a3);
}

- (double)doubleValueSafe
{
  return CFGetDouble(a1, 0);
}

- (double)doubleValueSafe:()BoxingUtils
{
  return CFGetDouble(a1, a3);
}

- (uint64_t)stringValueSafe
{
  return objc_msgSend(a1, "stringValueSafe:", 0);
}

- (__CFString)stringValueSafe:()BoxingUtils
{
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  char *v9;
  char *v10;
  int v11;

  v11 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = a1;
    if (v5)
    {
LABEL_3:
      v11 = 0;
      goto LABEL_4;
    }
    goto LABEL_11;
  }
  v9 = CFCopyCString(a1, &v11);
  if (v9)
  {
    v10 = v9;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    free(v10);
    if (v5)
      goto LABEL_3;
LABEL_11:
    v11 = -6700;
    goto LABEL_4;
  }
  v5 = 0;
LABEL_4:
  if (a3)
    *a3 = v11;
  v6 = &stru_1E25DF9F8;
  if (v5)
    v6 = v5;
  v7 = v6;

  return v7;
}

- (uint64_t)utf8ValueSafe
{
  return objc_msgSend(a1, "utf8ValueSafe:", 0);
}

- (const)utf8ValueSafe:()BoxingUtils
{
  char *v5;
  void *v6;
  id v7;
  int v9;

  v9 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = CFCopyCString(a1, &v9);
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      free(v5);
      if (!v6)
      {
        v5 = 0;
        goto LABEL_16;
      }
      v7 = objc_retainAutorelease(v6);
      v5 = (char *)objc_msgSend(v7, "UTF8String");
      if (v5)
        v9 = 0;
      else
        v9 = -6700;

    }
    if (!a3)
      goto LABEL_12;
    goto LABEL_11;
  }
  v5 = (char *)-[__CFString UTF8String](objc_retainAutorelease(a1), "UTF8String");
  if (v5)
  {
    v9 = 0;
    if (!a3)
      goto LABEL_12;
LABEL_11:
    *a3 = v9;
    goto LABEL_12;
  }
LABEL_16:
  v9 = -6700;
  if (a3)
    goto LABEL_11;
LABEL_12:
  if (v5)
    return v5;
  else
    return "";
}

@end
