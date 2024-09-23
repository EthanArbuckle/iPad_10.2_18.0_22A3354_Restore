@implementation HMDRecordChangedLogEvent

- (HMDRecordChangedLogEvent)initWithChangedRecord:(id)a3 isLegacy:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDRecordChangedLogEvent;
  return -[HMDRecordOperationLogEvent initWithSize:isLegacy:](&v5, sel_initWithSize_isLegacy_, objc_msgSend(a3, "size"), a4);
}

+ (id)recordChanged:(id)a3
{
  id v3;
  HMDRecordChangedLogEvent *v4;

  v3 = a3;
  v4 = -[HMDRecordChangedLogEvent initWithChangedRecord:isLegacy:]([HMDRecordChangedLogEvent alloc], "initWithChangedRecord:isLegacy:", v3, 0);

  return v4;
}

+ (id)legacyRecordChanged:(id)a3
{
  id v3;
  HMDRecordChangedLogEvent *v4;

  v3 = a3;
  v4 = -[HMDRecordChangedLogEvent initWithChangedRecord:isLegacy:]([HMDRecordChangedLogEvent alloc], "initWithChangedRecord:isLegacy:", v3, 1);

  return v4;
}

@end
