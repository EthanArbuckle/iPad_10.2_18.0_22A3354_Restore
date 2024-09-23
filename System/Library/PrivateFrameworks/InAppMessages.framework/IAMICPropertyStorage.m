@implementation IAMICPropertyStorage

- (void)getPropertyForKey:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5
{
  -[ICInAppMessageManager getPropertyForKey:bundleIdentifier:completion:](self->_iTunesCloudIAMManager, "getPropertyForKey:bundleIdentifier:completion:", a3, a4, a5);
}

- (IAMICPropertyStorage)init
{
  IAMICPropertyStorage *v2;
  uint64_t v3;
  ICInAppMessageManager *iTunesCloudIAMManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IAMICPropertyStorage;
  v2 = -[IAMICPropertyStorage init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BEC8810], "sharedManager");
    v3 = objc_claimAutoreleasedReturnValue();
    iTunesCloudIAMManager = v2->_iTunesCloudIAMManager;
    v2->_iTunesCloudIAMManager = (ICInAppMessageManager *)v3;

  }
  return v2;
}

- (void)setProperty:(id)a3 forKey:(id)a4 bundleIdentifier:(id)a5 completion:(id)a6
{
  -[ICInAppMessageManager setProperty:forKey:bundleIdentifier:completion:](self->_iTunesCloudIAMManager, "setProperty:forKey:bundleIdentifier:completion:", a3, a4, a5, a6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iTunesCloudIAMManager, 0);
}

@end
