@implementation HDCloudSyncSynchronousOperation

- (void)main
{
  _BOOL8 v3;
  id v4;
  id v5;

  v5 = 0;
  v3 = -[HDCloudSyncSynchronousOperation performWithError:](self, "performWithError:", &v5);
  v4 = v5;
  -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", v3, v4);

}

- (BOOL)performWithError:(id *)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

+ (BOOL)shouldProduceOperationAnalytics
{
  return 0;
}

@end
