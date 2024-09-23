@implementation ATStoreDownloadAssetsOperation

- (ATStoreDownloadAssetsOperation)initWithAsset:(id)a3 prepareOperationResult:(id)a4
{
  id v7;
  ATStoreDownloadAssetsOperation *v8;
  ATStoreDownloadAssetsOperation *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ATStoreDownloadAssetsOperation;
  v8 = -[ATStoreDownloadOperation initWithAsset:](&v11, sel_initWithAsset_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_prepareOperationResult, a4);

  return v9;
}

- (void)execute
{
  ATStoreDownloadOperationResult *v3;

  v3 = objc_alloc_init(ATStoreDownloadOperationResult);
  -[ATStoreDownloadOperation finishWithError:operationResult:](self, "finishWithError:operationResult:", 0, v3);

}

- (ATStoreDownloadOperationResult)prepareOperationResult
{
  return self->_prepareOperationResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prepareOperationResult, 0);
}

@end
