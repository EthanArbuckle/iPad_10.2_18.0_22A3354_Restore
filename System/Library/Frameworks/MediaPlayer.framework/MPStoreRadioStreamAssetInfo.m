@implementation MPStoreRadioStreamAssetInfo

- (MPStoreRadioStreamAssetInfo)initWithiTunesCloudStoreRadioStreamAssetInfo:(id)a3
{
  id v5;
  MPStoreRadioStreamAssetInfo *v6;
  MPStoreRadioStreamAssetInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPStoreRadioStreamAssetInfo;
  v6 = -[MPStoreRadioStreamAssetInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_internalInfo, a3);

  return v7;
}

- (int64_t)flavor
{
  return -[MPStoreRadioStreamAssetInfo MPStoreRadioStreamFlavorFromICStoreRadioStreamFlavor:](self, "MPStoreRadioStreamFlavorFromICStoreRadioStreamFlavor:", -[ICStoreRadioStreamAssetInfo flavor](self->_internalInfo, "flavor"));
}

- (int64_t)streamProtocol
{
  return -[MPStoreRadioStreamAssetInfo MPStoreRadioStreamProtocolFromICStoreRadioStreamProtocol:](self, "MPStoreRadioStreamProtocolFromICStoreRadioStreamProtocol:", -[ICStoreRadioStreamAssetInfo streamProtocol](self->_internalInfo, "streamProtocol"));
}

- (NSURL)streamURL
{
  return (NSURL *)-[ICStoreRadioStreamAssetInfo streamURL](self->_internalInfo, "streamURL");
}

- (NSURL)keyCertificateURL
{
  return (NSURL *)-[ICStoreRadioStreamAssetInfo keyCertificateURL](self->_internalInfo, "keyCertificateURL");
}

- (NSURL)keyServerURL
{
  return (NSURL *)-[ICStoreRadioStreamAssetInfo keyServerURL](self->_internalInfo, "keyServerURL");
}

- (BOOL)isITunesStoreStream
{
  return -[ICStoreRadioStreamAssetInfo isiTunesStoreStream](self->_internalInfo, "isiTunesStoreStream");
}

- (int64_t)MPStoreRadioStreamFlavorFromICStoreRadioStreamFlavor:(int64_t)a3
{
  int64_t v3;

  v3 = 1;
  if (a3 != 1)
    v3 = 2;
  if (a3)
    return v3;
  else
    return 0;
}

- (int64_t)MPStoreRadioStreamProtocolFromICStoreRadioStreamProtocol:(int64_t)a3
{
  int64_t v3;

  v3 = 1;
  if (a3 == 2)
    v3 = 2;
  if (a3)
    return v3;
  else
    return 0;
}

- (BOOL)isiTunesStoreStream
{
  return self->_iTunesStoreStream;
}

- (void)setITunesStoreStream:(BOOL)a3
{
  self->_iTunesStoreStream = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalInfo, 0);
}

@end
