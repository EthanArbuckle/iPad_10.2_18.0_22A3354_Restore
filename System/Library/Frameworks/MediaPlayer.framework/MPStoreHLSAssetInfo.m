@implementation MPStoreHLSAssetInfo

- (MPStoreHLSAssetInfo)initWithiTunesCloudStoreHLSAssetInfo:(id)a3
{
  id v5;
  MPStoreHLSAssetInfo *v6;
  MPStoreHLSAssetInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPStoreHLSAssetInfo;
  v6 = -[MPStoreHLSAssetInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_internalInfo, a3);

  return v7;
}

- (NSURL)playlistURL
{
  return (NSURL *)-[ICStoreHLSAssetInfo playlistURL](self->_internalInfo, "playlistURL");
}

- (NSURL)keyCertificateURL
{
  return (NSURL *)-[ICStoreHLSAssetInfo keyCertificateURL](self->_internalInfo, "keyCertificateURL");
}

- (NSURL)keyServerURL
{
  return (NSURL *)-[ICStoreHLSAssetInfo keyServerURL](self->_internalInfo, "keyServerURL");
}

- (NSString)keyServerProtocolType
{
  return (NSString *)-[ICStoreHLSAssetInfo keyServerProtocolType](self->_internalInfo, "keyServerProtocolType");
}

- (NSNumber)keyServerAdamID
{
  return (NSNumber *)-[ICStoreHLSAssetInfo keyServerAdamID](self->_internalInfo, "keyServerAdamID");
}

- (NSURL)alternatePlaylistURL
{
  return (NSURL *)-[ICStoreHLSAssetInfo alternatePlaylistURL](self->_internalInfo, "alternatePlaylistURL");
}

- (NSURL)alternateKeyCertificateURL
{
  return (NSURL *)-[ICStoreHLSAssetInfo alternateKeyCertificateURL](self->_internalInfo, "alternateKeyCertificateURL");
}

- (NSURL)alternateKeyServerURL
{
  return (NSURL *)-[ICStoreHLSAssetInfo alternateKeyServerURL](self->_internalInfo, "alternateKeyServerURL");
}

- (BOOL)isiTunesStoreStream
{
  return -[ICStoreHLSAssetInfo isiTunesStoreStream](self->_internalInfo, "isiTunesStoreStream");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalInfo, 0);
}

@end
