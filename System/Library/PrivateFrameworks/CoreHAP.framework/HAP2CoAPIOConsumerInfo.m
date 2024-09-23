@implementation HAP2CoAPIOConsumerInfo

- (HAP2CoAPIOConsumerInfo)initWithConsumer:(id)a3
{
  HAP2CoAPIOConsumerInfo *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HAP2CoAPIOConsumerInfo;
  result = -[HAP2CoAPIOConsumerWeakHolder initWithConsumer:](&v4, sel_initWithConsumer_, a3);
  if (result)
    result->_session = 0;
  return result;
}

- (coap_session_t)session
{
  return self->_session;
}

- (void)setSession:(coap_session_t *)a3
{
  self->_session = a3;
}

@end
