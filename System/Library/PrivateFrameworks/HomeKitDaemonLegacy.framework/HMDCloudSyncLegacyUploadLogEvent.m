@implementation HMDCloudSyncLegacyUploadLogEvent

+ (id)uploadCompletedWithError:(id)a3
{
  id v3;
  HMDCloudSyncLegacyUploadLogEvent *v4;

  v3 = a3;
  v4 = -[HMDCloudSyncOperationLogEvent initWithError:]([HMDCloudSyncLegacyUploadLogEvent alloc], "initWithError:", v3);

  return v4;
}

@end
