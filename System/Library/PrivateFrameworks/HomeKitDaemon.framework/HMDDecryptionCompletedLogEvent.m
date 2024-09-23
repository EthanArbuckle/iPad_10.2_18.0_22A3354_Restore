@implementation HMDDecryptionCompletedLogEvent

- (HMDDecryptionCompletedLogEvent)initWithFailure:(BOOL)a3
{
  HMDDecryptionCompletedLogEvent *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDDecryptionCompletedLogEvent;
  result = -[HMMLogEvent init](&v5, sel_init);
  if (result)
    result->_didDecryptionFail = a3;
  return result;
}

- (BOOL)didDecryptionFail
{
  return self->_didDecryptionFail;
}

+ (id)decryptionCompletedWithFailure:(BOOL)a3
{
  return -[HMDDecryptionCompletedLogEvent initWithFailure:]([HMDDecryptionCompletedLogEvent alloc], "initWithFailure:", a3);
}

@end
