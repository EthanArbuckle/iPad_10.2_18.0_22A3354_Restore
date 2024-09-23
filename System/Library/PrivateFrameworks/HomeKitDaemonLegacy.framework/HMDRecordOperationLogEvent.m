@implementation HMDRecordOperationLogEvent

- (HMDRecordOperationLogEvent)initWithSize:(unint64_t)a3 isLegacy:(BOOL)a4
{
  HMDRecordOperationLogEvent *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDRecordOperationLogEvent;
  result = -[HMMLogEvent init](&v7, sel_init);
  if (result)
  {
    result->_size = a3;
    result->_legacy = a4;
  }
  return result;
}

- (unint64_t)size
{
  return self->_size;
}

- (BOOL)isLegacy
{
  return self->_legacy;
}

@end
