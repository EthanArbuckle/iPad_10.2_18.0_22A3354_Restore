@implementation CATIDSServiceConnectionCapabilities

- (CATIDSServiceConnectionCapabilities)init
{
  return -[CATIDSServiceConnectionCapabilities initWithMessagingVersion:](self, "initWithMessagingVersion:", 2);
}

- (CATIDSServiceConnectionCapabilities)initWithMessagingVersion:(unint64_t)a3
{
  CATIDSServiceConnectionCapabilities *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CATIDSServiceConnectionCapabilities;
  result = -[CATIDSServiceConnectionCapabilities init](&v5, sel_init);
  if (result)
    result->_supportsReliableDelivery = a3 > 1;
  return result;
}

- (BOOL)supportsReliableDelivery
{
  return self->_supportsReliableDelivery;
}

@end
