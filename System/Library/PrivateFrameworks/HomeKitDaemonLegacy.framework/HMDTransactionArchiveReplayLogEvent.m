@implementation HMDTransactionArchiveReplayLogEvent

- (HMDTransactionArchiveReplayLogEvent)initWithNumUncommittedRecords:(int64_t)a3 numUncommittedAndPushedRecords:(int64_t)a4
{
  HMDTransactionArchiveReplayLogEvent *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDTransactionArchiveReplayLogEvent;
  result = -[HMMLogEvent init](&v7, sel_init);
  if (result)
  {
    result->_numUncommittedRecords = a3;
    result->_numUncommittedAndPushedRecords = a4;
  }
  return result;
}

- (int64_t)numUncommittedRecords
{
  return self->_numUncommittedRecords;
}

- (int64_t)numUncommittedAndPushedRecords
{
  return self->_numUncommittedAndPushedRecords;
}

@end
