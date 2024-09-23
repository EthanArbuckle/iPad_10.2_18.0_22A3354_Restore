@implementation NSString(FPAppLibrary)

+ (void)setFp_defaultProviderDomainID:()FPAppLibrary
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = a1;
  objc_sync_enter(v4);
  if ((objc_msgSend((id)_defaultProviderDomainID, "isEqualToString:", v7) & 1) == 0)
  {
    v5 = objc_msgSend(v7, "copy");
    v6 = (void *)_defaultProviderDomainID;
    _defaultProviderDomainID = v5;

  }
  objc_sync_exit(v4);

}

+ (id)fp_defaultProviderDomainID
{
  id v1;
  void *v2;

  v1 = a1;
  objc_sync_enter(v1);
  v2 = (void *)objc_msgSend((id)_defaultProviderDomainID, "copy");
  objc_sync_exit(v1);

  return v2;
}

@end
