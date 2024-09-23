@implementation MKPowerAssertion

- (MKPowerAssertion)init
{
  MKPowerAssertion *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MKPowerAssertion;
  v2 = -[MKPowerAssertion init](&v4, sel_init);
  if (v2)
    v2->_powerAssertion = (void *)CPPowerAssertionCreate();
  return v2;
}

- (void)dealloc
{
  void *powerAssertion;
  objc_super v4;

  powerAssertion = self->_powerAssertion;
  if (powerAssertion)
  {
    CFRelease(powerAssertion);
    self->_powerAssertion = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)MKPowerAssertion;
  -[MKPowerAssertion dealloc](&v4, sel_dealloc);
}

- (void)powerAssertion
{
  return self->_powerAssertion;
}

- (void)setPowerAssertion:(void *)a3
{
  self->_powerAssertion = a3;
}

@end
