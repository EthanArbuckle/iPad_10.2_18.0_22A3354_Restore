@implementation ATStorePodcastDownloadPrepareOperation

- (void)execute
{
  ATStoreDownloadOperationResult *v3;

  v3 = objc_alloc_init(ATStoreDownloadOperationResult);
  -[ATStoreDownloadOperation finishWithError:operationResult:](self, "finishWithError:operationResult:", 0, v3);

}

@end
