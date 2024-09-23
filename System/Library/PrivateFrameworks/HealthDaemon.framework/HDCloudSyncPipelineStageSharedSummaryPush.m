@implementation HDCloudSyncPipelineStageSharedSummaryPush

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  __objc2_class *v7;
  id v8;
  void *v9;
  id v10;

  -[HDCloudSyncOperation profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "daemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "behavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "healthAppHidden");

  if (v6)
    v7 = HDCloudSyncSharedSummaryDisableAndDeleteOperation;
  else
    v7 = HDCloudSyncSharedSummaryPushOperation;
  v8 = [v7 alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "initWithConfiguration:cloudState:", v9, 0);

  -[HDCloudSyncOperation delegateToOperation:](self, "delegateToOperation:", v10);
}

@end
