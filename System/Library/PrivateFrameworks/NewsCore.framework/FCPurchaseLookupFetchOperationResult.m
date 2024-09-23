@implementation FCPurchaseLookupFetchOperationResult

- (NSString)bundleChannelIDsVersion
{
  return self->_bundleChannelIDsVersion;
}

- (NSDictionary)bundleChannelIDsByPurchaseID
{
  return self->_bundleChannelIDsByPurchaseID;
}

- (FCPurchaseLookupFetchOperationResult)initWithChannelIDsByPurchaseID:(id)a3 bundleChannelIDsByPurchaseID:(id)a4 bundleChannelIDsVersion:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  FCPurchaseLookupFetchOperationResult *v14;
  uint64_t v15;
  NSDictionary *channelIDsByPurchaseID;
  uint64_t v17;
  NSDictionary *bundleChannelIDsByPurchaseID;
  uint64_t v19;
  NSString *bundleChannelIDsVersion;
  uint64_t v21;
  NSError *error;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)FCPurchaseLookupFetchOperationResult;
  v14 = -[FCPurchaseLookupFetchOperationResult init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    channelIDsByPurchaseID = v14->_channelIDsByPurchaseID;
    v14->_channelIDsByPurchaseID = (NSDictionary *)v15;

    v17 = objc_msgSend(v11, "copy");
    bundleChannelIDsByPurchaseID = v14->_bundleChannelIDsByPurchaseID;
    v14->_bundleChannelIDsByPurchaseID = (NSDictionary *)v17;

    v19 = objc_msgSend(v12, "copy");
    bundleChannelIDsVersion = v14->_bundleChannelIDsVersion;
    v14->_bundleChannelIDsVersion = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    error = v14->_error;
    v14->_error = (NSError *)v21;

  }
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_bundleChannelIDsVersion, 0);
  objc_storeStrong((id *)&self->_bundleChannelIDsByPurchaseID, 0);
  objc_storeStrong((id *)&self->_channelIDsByPurchaseID, 0);
}

- (NSDictionary)channelIDsByPurchaseID
{
  return self->_channelIDsByPurchaseID;
}

- (void)setChannelIDsByPurchaseID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setBundleChannelIDsByPurchaseID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setBundleChannelIDsVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
