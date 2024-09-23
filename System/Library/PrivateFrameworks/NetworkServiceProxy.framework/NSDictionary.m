@implementation NSDictionary

- (id)objectForPlatformSpecificKey:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "stringByAppendingString:", CFSTR("-iOS"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(a1, "objectForKey:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
