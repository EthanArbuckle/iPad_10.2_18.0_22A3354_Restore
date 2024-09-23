@implementation NSError(NRSafeDescription)

- (id)nr_safeDescription
{
  void *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (_NRIsInternalInstall___onceToken != -1)
    dispatch_once(&_NRIsInternalInstall___onceToken, &__block_literal_global_18);
  if (_NRIsInternalInstall___internalInstall)
  {
    objc_msgSend(a1, "description");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(a1, "code");
    objc_msgSend(a1, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("class=%@ code=%lld domain=%@"), v5, v6, v7);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)nr_filteredError
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = MEMORY[0x1E0CB35C8];
  objc_msgSend(a1, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSError nr_filteredPlistDictionary:](v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    v8 = a1;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(a1, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, objc_msgSend(a1, "code"), v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

@end
