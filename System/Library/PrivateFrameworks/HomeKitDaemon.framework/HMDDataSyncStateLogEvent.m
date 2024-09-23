@implementation HMDDataSyncStateLogEvent

- (HMDDataSyncStateLogEvent)initWithDataSyncState:(unint64_t)a3
{
  HMDDataSyncStateLogEvent *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDDataSyncStateLogEvent;
  result = -[HMMLogEvent init](&v5, sel_init);
  if (result)
    result->_dataSyncState = a3;
  return result;
}

- (unint64_t)dataSyncState
{
  return self->_dataSyncState;
}

@end
