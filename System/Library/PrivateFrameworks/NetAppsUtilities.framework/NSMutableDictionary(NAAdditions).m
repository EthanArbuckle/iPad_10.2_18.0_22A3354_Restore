@implementation NSMutableDictionary(NAAdditions)

- (id)na_objectForKey:()NAAdditions withDefaultValue:
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v7[2](v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObject:forKey:", v8, v6);
  }

  return v8;
}

- (void)na_safeSetObject:()NAAdditions forKey:
{
  if (a3)
  {
    if (a4)
      return (void *)objc_msgSend(a1, "setObject:forKey:");
  }
  return a1;
}

@end
