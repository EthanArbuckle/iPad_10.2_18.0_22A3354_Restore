@implementation ASTConnectionAsset

- (ASTConnectionAsset)initWithCustomServerURL:(id)a3 customEndpoint:(id)a4 assetName:(id)a5 destinationFileHandle:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ASTConnectionAsset *v15;
  ASTConnectionAsset *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ASTConnectionAsset;
  v15 = -[ASTMaterializedConnection init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_customServerURL, a3);
    objc_storeStrong((id *)&v16->_customEndpoint, a4);
    objc_storeStrong((id *)&v16->_assetName, a5);
    objc_storeStrong((id *)&v16->_destinationFileHandle, a6);
  }

  return v16;
}

- (id)customServerURL
{
  return self->_customServerURL;
}

- (id)endpoint
{
  __CFString *customEndpoint;
  void *v3;
  void *v4;

  customEndpoint = (__CFString *)self->_customEndpoint;
  if (!customEndpoint)
  {
    if (self->_customServerURL)
    {
      -[ASTConnectionAsset assetName](self, "assetName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    }
    customEndpoint = CFSTR("assets");
  }
  -[ASTConnectionAsset assetName](self, "assetName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString stringByAppendingPathComponent:](customEndpoint, "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)method
{
  return CFSTR("GET");
}

- (id)accept
{
  return 0;
}

- (id)didDownloadFile
{
  return self->_didDownloadFile;
}

- (void)setDidDownloadFile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSFileHandle)destinationFileHandle
{
  return self->_destinationFileHandle;
}

- (NSString)assetName
{
  return self->_assetName;
}

- (void)setAssetName:(id)a3
{
  objc_storeStrong((id *)&self->_assetName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetName, 0);
  objc_storeStrong((id *)&self->_destinationFileHandle, 0);
  objc_storeStrong(&self->_didDownloadFile, 0);
  objc_storeStrong((id *)&self->_customEndpoint, 0);
  objc_storeStrong((id *)&self->_customServerURL, 0);
}

@end
