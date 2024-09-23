@implementation HAPAccessoryServerBookkeeping

- (HAPAccessoryServerBookkeeping)initWithDiscoveryMethod:(unint64_t)a3
{
  HAPAccessoryServerBookkeeping *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HAPAccessoryServerBookkeeping;
  result = -[HAPAccessoryServerBookkeeping init](&v5, sel_init);
  if (result)
  {
    result->_lastDiscoveryMethod = a3;
    result->_initialDiscoveryMethod = a3;
  }
  return result;
}

- (unint64_t)initialDiscoveryMethod
{
  return self->_initialDiscoveryMethod;
}

- (unint64_t)lastDiscoveryMethod
{
  return self->_lastDiscoveryMethod;
}

- (void)setLastDiscoveryMethod:(unint64_t)a3
{
  self->_lastDiscoveryMethod = a3;
}

@end
