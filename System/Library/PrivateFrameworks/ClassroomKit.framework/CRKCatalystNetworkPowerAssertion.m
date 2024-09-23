@implementation CRKCatalystNetworkPowerAssertion

- (void)dealloc
{
  objc_super v3;

  -[CRKCatalystNetworkPowerAssertion cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)CRKCatalystNetworkPowerAssertion;
  -[CRKCatalystNetworkPowerAssertion dealloc](&v3, sel_dealloc);
}

- (void)cancel
{
  if (!-[CRKCatalystNetworkPowerAssertion isCanceled](self, "isCanceled"))
  {
    -[CRKCatalystNetworkPowerAssertion setCanceled:](self, "setCanceled:", 1);
    +[CRKNetworkPowerAssertion decrement](CRKNetworkPowerAssertion, "decrement");
  }
}

- (BOOL)isCanceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

@end
