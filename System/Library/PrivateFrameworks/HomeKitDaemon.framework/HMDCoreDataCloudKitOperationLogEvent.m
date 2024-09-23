@implementation HMDCoreDataCloudKitOperationLogEvent

- (HMDCoreDataCloudKitOperationLogEvent)initWithOperationType:(unint64_t)a3
{
  HMDCoreDataCloudKitOperationLogEvent *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDCoreDataCloudKitOperationLogEvent;
  result = -[HMMLogEvent init](&v5, sel_init);
  if (result)
    result->_operationType = a3;
  return result;
}

- (HMDCoreDataCloudKitOperationLogEvent)initWithOperationType:(unint64_t)a3 interval:(double)a4
{
  HMDCoreDataCloudKitOperationLogEvent *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDCoreDataCloudKitOperationLogEvent;
  result = -[HMMLogEvent init](&v7, sel_init);
  if (result)
  {
    result->_operationType = a3;
    result->_interval = a4;
  }
  return result;
}

- (unint64_t)operationType
{
  return self->_operationType;
}

- (double)interval
{
  return self->_interval;
}

@end
