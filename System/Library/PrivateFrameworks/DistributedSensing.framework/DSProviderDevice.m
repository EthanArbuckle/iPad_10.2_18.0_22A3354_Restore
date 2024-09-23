@implementation DSProviderDevice

- (DSProviderDevice)initWithRapportDevice:(id)a3 queue:(id)a4
{
  DSProviderDevice *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DSProviderDevice;
  result = -[DSRapportDevice initWithRapportDevice:queue:](&v5, sel_initWithRapportDevice_queue_, a3, a4);
  if (result)
    result->_isResponsePending = 0;
  return result;
}

- (BOOL)isResponsePending
{
  return self->_isResponsePending;
}

- (void)setIsResponsePending:(BOOL)a3
{
  self->_isResponsePending = a3;
}

@end
