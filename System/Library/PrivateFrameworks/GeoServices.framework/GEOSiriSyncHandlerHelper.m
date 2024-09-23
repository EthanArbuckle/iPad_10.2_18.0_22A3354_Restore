@implementation GEOSiriSyncHandlerHelper

- (GEOSiriSyncHandlerHelper)init
{
  GEOSiriSyncHandlerHelper *v2;
  void *v3;
  uint64_t v4;
  NSArray *additionalEnabledMarkets;
  GEOResourceManifestConfiguration *v6;
  void *v7;
  uint64_t v8;
  NSString *manifestEnvironment;
  void *v10;
  uint64_t v11;
  NSData *clientMetadata;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)GEOSiriSyncHandlerHelper;
  v2 = -[GEOSiriSyncHandlerHelper init](&v14, sel_init);
  if (v2)
  {
    +[GEOAdditionalEnabledMarkets additionalEnabledMarkets](GEOAdditionalEnabledMarkets, "additionalEnabledMarkets");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reload");
    objc_msgSend(v3, "transitMarkets");
    v4 = objc_claimAutoreleasedReturnValue();
    additionalEnabledMarkets = v2->_additionalEnabledMarkets;
    v2->_additionalEnabledMarkets = (NSArray *)v4;

    v6 = objc_alloc_init(GEOResourceManifestConfiguration);
    -[GEOResourceManifestConfiguration environment](v6, "environment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    manifestEnvironment = v2->_manifestEnvironment;
    v2->_manifestEnvironment = (NSString *)v8;

    +[GEOMapService sharedService](GEOMapService, "sharedService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "serializedClientMetadataForSiri");
    v11 = objc_claimAutoreleasedReturnValue();
    clientMetadata = v2->_clientMetadata;
    v2->_clientMetadata = (NSData *)v11;

  }
  return v2;
}

- (NSString)postAnchor
{
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  -[GEOSiriSyncHandlerHelper manifestEnvironment](self, "manifestEnvironment");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = &stru_1E1C241D0;
  if (v3)
    v6 = (__CFString *)v3;
  else
    v6 = &stru_1E1C241D0;
  v7 = v6;

  -[GEOSiriSyncHandlerHelper additionalEnabledMarkets](self, "additionalEnabledMarkets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[GEOSiriSyncHandlerHelper additionalEnabledMarkets](self, "additionalEnabledMarkets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR("__"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOSiriSyncHandlerHelper clientMetadata](self, "clientMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "base64EncodedStringWithOptions:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v10, "stringByAppendingString:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v13;
  }

  return (NSString *)v10;
}

- (NSArray)additionalEnabledMarkets
{
  return self->_additionalEnabledMarkets;
}

- (NSString)manifestEnvironment
{
  return self->_manifestEnvironment;
}

- (NSData)clientMetadata
{
  return self->_clientMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientMetadata, 0);
  objc_storeStrong((id *)&self->_manifestEnvironment, 0);
  objc_storeStrong((id *)&self->_additionalEnabledMarkets, 0);
}

- (void)notifySiriIfNecessary
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  _getValue(GeoServicesConfig_PreviousSiriSyncAnchor, (uint64_t)off_1EDF4E388, 1, 0, 0, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[GEOSiriSyncHandlerHelper postAnchor](self, "postAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v6, "isEqualToString:", v3);

  if ((v4 & 1) == 0)
  {
    -[GEOSiriSyncHandlerHelper postAnchor](self, "postAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _setValue(GeoServicesConfig_PreviousSiriSyncAnchor, (uint64_t)off_1EDF4E388, v5, 1, 0);

    notify_post("com.apple.geoservices.siri_data_changed");
  }

}

@end
