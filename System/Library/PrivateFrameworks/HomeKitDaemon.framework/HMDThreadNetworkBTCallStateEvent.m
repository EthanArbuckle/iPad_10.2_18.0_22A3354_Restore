@implementation HMDThreadNetworkBTCallStateEvent

- (HMDThreadNetworkBTCallStateEvent)initWithCallState:(int64_t)a3
{
  HMDThreadNetworkBTCallStateEvent *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDThreadNetworkBTCallStateEvent;
  result = -[HMDThreadNetworkBTCallStateEvent init](&v5, sel_init);
  if (result)
    result->_callState = a3;
  return result;
}

- (int64_t)callState
{
  return self->_callState;
}

@end
