@implementation ATStoreBookDownloadProcessAssetsOperation

- (void)execute
{
  void *v3;
  void *v4;
  ATStoreDownloadOperationResult *v5;

  v5 = objc_alloc_init(ATStoreDownloadOperationResult);
  -[ATStoreDownloadProcessAssetsOperation assetsOperationResult](self, "assetsOperationResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "downloadFilePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATStoreDownloadOperationResult setDownloadFilePath:](v5, "setDownloadFilePath:", v4);

  -[ATStoreDownloadOperation finishWithError:operationResult:](self, "finishWithError:operationResult:", 0, v5);
}

@end
