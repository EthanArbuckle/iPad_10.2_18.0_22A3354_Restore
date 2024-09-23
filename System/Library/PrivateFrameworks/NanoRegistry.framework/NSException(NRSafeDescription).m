@implementation NSException(NRSafeDescription)

- (id)nr_safeDescription
{
  void *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
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
    objc_msgSend(a1, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "reason");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("class=%@ name=%@ reason=%@"), v5, v6, v7);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

@end
