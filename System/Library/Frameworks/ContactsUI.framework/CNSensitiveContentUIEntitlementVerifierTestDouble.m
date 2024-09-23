@implementation CNSensitiveContentUIEntitlementVerifierTestDouble

- (CNSensitiveContentUIEntitlementVerifierTestDouble)initWithCanShowSensitiveUI:(BOOL)a3 processHasCommunicationFilterEntitlements:(BOOL)a4
{
  CNSensitiveContentUIEntitlementVerifierTestDouble *v6;
  CNSensitiveContentUIEntitlementVerifierTestDouble *v7;
  CNSensitiveContentUIEntitlementVerifierTestDouble *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CNSensitiveContentUIEntitlementVerifierTestDouble;
  v6 = -[CNSensitiveContentUIEntitlementVerifierTestDouble init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_canShowSensitiveUI = a3;
    v6->_hasCommunicationFilterEntitlements = a4;
    v8 = v6;
  }

  return v7;
}

- (BOOL)canShowSensitiveUI
{
  return self->_canShowSensitiveUI;
}

- (void)setCanShowSensitiveUI:(BOOL)a3
{
  self->_canShowSensitiveUI = a3;
}

- (BOOL)hasCommunicationFilterEntitlements
{
  return self->_hasCommunicationFilterEntitlements;
}

- (void)setHasCommunicationFilterEntitlements:(BOOL)a3
{
  self->_hasCommunicationFilterEntitlements = a3;
}

@end
