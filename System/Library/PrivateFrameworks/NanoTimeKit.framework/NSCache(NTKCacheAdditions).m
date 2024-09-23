@implementation NSCache(NTKCacheAdditions)

- (id)ntkCachedObjectForKeyProvider:()NTKCacheAdditions creationBlock:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "ntkCacheableKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ntkCachedObjectForKey:creationBlock:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)ntkCachedObjectForKey:()NTKCacheAdditions creationBlock:
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    v7[2](v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(a1, "setObject:forKey:", v10, v6);
  }

  return v10;
}

@end
