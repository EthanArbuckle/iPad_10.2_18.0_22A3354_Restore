@implementation MFUserProfileProvider_iOS

+ (id)defaultProvider
{
  if (defaultProvider_onceToken != -1)
    dispatch_once(&defaultProvider_onceToken, &__block_literal_global_8);
  return (id)defaultProvider__defaultProvider;
}

- (id)_accountsEmailAddresses
{
  return (id)objc_msgSend(MEMORY[0x1E0D4D620], "activeAccountEmailAddresses");
}

- (BOOL)hasAccountsConfigured
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0D4D620], "activeNonLocalAccounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (MFUserProfileProvider_iOS)init
{
  MFUserProfileProvider_iOS *v2;
  MFUserProfileProvider_iOS *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFUserProfileProvider_iOS;
  v2 = -[EMUserProfileProvider init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[EMUserProfileProvider refreshCachedValues](v2, "refreshCachedValues");
  return v3;
}

@end
