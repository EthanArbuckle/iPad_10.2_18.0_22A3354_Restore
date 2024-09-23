@implementation HMBCloudZonePullResult

- (HMBCloudZonePullResult)initWithProcessingFuture:(id)a3
{
  id v5;
  HMBCloudZonePullResult *v6;
  HMBCloudZonePullResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMBCloudZonePullResult;
  v6 = -[HMBCloudZonePullResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_processingFuture, a3);

  return v7;
}

- (NAFuture)processingFuture
{
  return (NAFuture *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingFuture, 0);
}

@end
