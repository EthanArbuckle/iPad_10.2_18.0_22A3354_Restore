@implementation IAMICMessageMetadataStorage

- (IAMICMessageMetadataStorage)init
{
  IAMICMessageMetadataStorage *v2;
  uint64_t v3;
  ICInAppMessageManager *iTunesCloudIAMManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IAMICMessageMetadataStorage;
  v2 = -[IAMICMessageMetadataStorage init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BEC8810], "sharedManager");
    v3 = objc_claimAutoreleasedReturnValue();
    iTunesCloudIAMManager = v2->_iTunesCloudIAMManager;
    v2->_iTunesCloudIAMManager = (ICInAppMessageManager *)v3;

  }
  return v2;
}

- (void)metadataForBundleIdentifiers:(id)a3 completion:(id)a4
{
  -[ICInAppMessageManager getAllMetadataForBundleIdentifiers:completion:](self->_iTunesCloudIAMManager, "getAllMetadataForBundleIdentifiers:completion:", a3, a4);
}

- (void)updateMetadata:(id)a3 messageIdentifier:(id)a4 bundleIdentifier:(id)a5 completion:(id)a6
{
  -[ICInAppMessageManager updateMetadata:messageIdentifier:bundleIdentifier:completion:](self->_iTunesCloudIAMManager, "updateMetadata:messageIdentifier:bundleIdentifier:completion:", a3, a4, a5, a6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iTunesCloudIAMManager, 0);
}

@end
