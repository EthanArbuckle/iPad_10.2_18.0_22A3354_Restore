@implementation HMDCloudSyncOperationLogEvent

- (HMDCloudSyncOperationLogEvent)initWithError:(id)a3
{
  id v4;
  HMDCloudSyncOperationLogEvent *v5;
  HMDCloudSyncOperationLogEvent *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDCloudSyncOperationLogEvent;
  v5 = -[HMMLogEvent init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[HMMLogEvent setError:](v5, "setError:", v4);

  return v6;
}

@end
