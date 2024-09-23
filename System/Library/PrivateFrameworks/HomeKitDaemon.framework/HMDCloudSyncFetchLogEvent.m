@implementation HMDCloudSyncFetchLogEvent

+ (id)fetchCompletedWithError:(id)a3
{
  id v3;
  HMDCloudSyncFetchLogEvent *v4;

  v3 = a3;
  v4 = -[HMDCloudSyncOperationLogEvent initWithError:]([HMDCloudSyncFetchLogEvent alloc], "initWithError:", v3);

  return v4;
}

@end
