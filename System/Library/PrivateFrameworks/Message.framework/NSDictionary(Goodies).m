@implementation NSDictionary(Goodies)

- (uint64_t)mf_BOOLForKey:()Goodies
{
  void *v1;
  void *v2;
  uint64_t v3;
  BOOL v4;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "uppercaseString");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("YES"));

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = objc_msgSend(v1, "intValue") == 0;
    else
      v4 = v1 == 0;
    v3 = !v4;
  }

  return v3;
}

- (uint64_t)mf_integerForKey:()Goodies
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = objc_msgSend(v1, "intValue");
  else
    v2 = 0;

  return v2;
}

@end
