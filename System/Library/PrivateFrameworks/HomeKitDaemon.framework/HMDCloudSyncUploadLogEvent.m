@implementation HMDCloudSyncUploadLogEvent

+ (id)uploadCompletedWithError:(id)a3
{
  id v3;
  HMDCloudSyncUploadLogEvent *v4;

  v3 = a3;
  v4 = -[HMDCloudSyncOperationLogEvent initWithError:]([HMDCloudSyncUploadLogEvent alloc], "initWithError:", v3);

  return v4;
}

@end
