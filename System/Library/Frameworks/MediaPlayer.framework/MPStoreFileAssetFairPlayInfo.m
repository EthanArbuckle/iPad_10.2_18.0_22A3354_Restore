@implementation MPStoreFileAssetFairPlayInfo

- (MPStoreFileAssetFairPlayInfo)initWithResponseSinfDictionary:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  MPStoreFileAssetFairPlayInfo *v7;

  v4 = (objc_class *)MEMORY[0x1E0DDC088];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithResponseSinfDictionary:", v5);

  v7 = -[MPStoreFileAssetFairPlayInfo initWithiTunesCloudStoreFileAssetFairPlayInfo:](self, "initWithiTunesCloudStoreFileAssetFairPlayInfo:", v6);
  return v7;
}

- (MPStoreFileAssetFairPlayInfo)initWithiTunesCloudStoreFileAssetFairPlayInfo:(id)a3
{
  id v4;
  MPStoreFileAssetFairPlayInfo *v5;
  uint64_t v6;
  ICStoreFileAssetFairPlayInfo *internalInfo;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPStoreFileAssetFairPlayInfo;
  v5 = -[MPStoreFileAssetFairPlayInfo init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    internalInfo = v5->_internalInfo;
    v5->_internalInfo = (ICStoreFileAssetFairPlayInfo *)v6;

  }
  return v5;
}

- (NSDictionary)responseSinfDictionary
{
  return (NSDictionary *)-[ICStoreFileAssetFairPlayInfo responseSinfDictionary](self->_internalInfo, "responseSinfDictionary");
}

- (int64_t)identifier
{
  return -[ICStoreFileAssetFairPlayInfo identifier](self->_internalInfo, "identifier");
}

- (NSData)dpInfoData
{
  return (NSData *)-[ICStoreFileAssetFairPlayInfo dpInfoData](self->_internalInfo, "dpInfoData");
}

- (NSData)pinfData
{
  return (NSData *)-[ICStoreFileAssetFairPlayInfo pinfData](self->_internalInfo, "pinfData");
}

- (NSData)sinfData
{
  return (NSData *)-[ICStoreFileAssetFairPlayInfo sinfData](self->_internalInfo, "sinfData");
}

- (NSData)sinf2Data
{
  return (NSData *)-[ICStoreFileAssetFairPlayInfo sinf2Data](self->_internalInfo, "sinf2Data");
}

- (NSDictionary)purchaseBundleSinfDictionary
{
  return (NSDictionary *)-[ICStoreFileAssetFairPlayInfo purchaseBundleSinfDictionary](self->_internalInfo, "purchaseBundleSinfDictionary");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalInfo, 0);
}

@end
