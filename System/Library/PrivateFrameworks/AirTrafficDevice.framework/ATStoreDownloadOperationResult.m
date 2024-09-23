@implementation ATStoreDownloadOperationResult

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)ATStoreDownloadOperationResult;
  -[ATStoreDownloadOperationResult description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ [cancelRemaining=%d, hasResumeData=%d, path=%@]>"), v4, self->_cancelAllRemaining, self->_resumeData != 0, self->_downloadFilePath);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)cancelAllRemaining
{
  return self->_cancelAllRemaining;
}

- (void)setCancelAllRemaining:(BOOL)a3
{
  self->_cancelAllRemaining = a3;
}

- (NSString)downloadFilePath
{
  return self->_downloadFilePath;
}

- (void)setDownloadFilePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)resumeData
{
  return self->_resumeData;
}

- (void)setResumeData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (ICStoreMediaResponseItem)storeMediaResponseItem
{
  return self->_storeMediaResponseItem;
}

- (void)setStoreMediaResponseItem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (ICRequestContext)requestContext
{
  return self->_requestContext;
}

- (void)setRequestContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isHLSDownload
{
  return self->_isHLSDownload;
}

- (void)setIsHLSDownload:(BOOL)a3
{
  self->_isHLSDownload = a3;
}

- (NSDictionary)assetClientParams
{
  return self->_assetClientParams;
}

- (void)setAssetClientParams:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetClientParams, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_storeMediaResponseItem, 0);
  objc_storeStrong((id *)&self->_resumeData, 0);
  objc_storeStrong((id *)&self->_downloadFilePath, 0);
}

@end
