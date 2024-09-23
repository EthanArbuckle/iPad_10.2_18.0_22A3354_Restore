@implementation NSDictionary

- (id)safari_applicationManifestForKey:(void *)a1
{
  void *v2;
  void *v3;
  id v4;

  if (a1)
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", a2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;
    v4 = v3;

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)safari_colorForKey:(void *)a1
{
  void *v2;
  void *v3;
  id v4;

  if (a1)
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", a2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;
    v4 = v3;

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
