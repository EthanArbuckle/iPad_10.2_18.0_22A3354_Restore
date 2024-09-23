@implementation NSDictionary(Goodies)

- (uint64_t)mf_BOOLForKey:()Goodies
{
  void *v1;
  BOOL v3;

  v1 = (void *)objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend((id)objc_msgSend(v1, "uppercaseString"), "isEqualToString:", CFSTR("YES"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v1, "intValue") == 0;
  else
    v3 = v1 == 0;
  return !v3;
}

- (uint64_t)mf_integerForKey:()Goodies
{
  void *v1;

  v1 = (void *)objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(v1, "intValue");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(v1, "intValue");
  else
    return 0;
}

@end
