@implementation HMDCloudSyncLegacyFetchLogEvent

+ (id)fetchCompletedWithError:(id)a3
{
  id v3;
  HMDCloudSyncLegacyFetchLogEvent *v4;

  v3 = a3;
  v4 = -[HMDCloudSyncOperationLogEvent initWithError:]([HMDCloudSyncLegacyFetchLogEvent alloc], "initWithError:", v3);

  return v4;
}

@end
