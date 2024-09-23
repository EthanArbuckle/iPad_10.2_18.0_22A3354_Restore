@implementation CIDVUIBiometricBindingEnrollmentProvider

- (CIDVUIBiometricBindingEnrollmentProvider)init
{
  CIDVUIBiometricBindingEnrollmentProvider *v2;
  _TtC9CoreIDVUI48CIDVUIInternalBiometricBindingEnrollmentProvider *v3;
  _TtC9CoreIDVUI48CIDVUIInternalBiometricBindingEnrollmentProvider *internalProvider;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CIDVUIBiometricBindingEnrollmentProvider;
  v2 = -[CIDVUIBiometricBindingEnrollmentProvider init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC9CoreIDVUI48CIDVUIInternalBiometricBindingEnrollmentProvider);
    internalProvider = v2->_internalProvider;
    v2->_internalProvider = v3;

  }
  return v2;
}

- (void)enrollWithCompletion:(id)a3
{
  -[CIDVUIInternalBiometricBindingEnrollmentProvider enrollWithCompletion:](self->_internalProvider, "enrollWithCompletion:", a3);
}

- (void)fetchAttestationsWithCompletion:(id)a3
{
  -[CIDVUIInternalBiometricBindingEnrollmentProvider fetchAttestationsWithCompletion:](self->_internalProvider, "fetchAttestationsWithCompletion:", a3);
}

- (_TtC9CoreIDVUI48CIDVUIInternalBiometricBindingEnrollmentProvider)internalProvider
{
  return (_TtC9CoreIDVUI48CIDVUIInternalBiometricBindingEnrollmentProvider *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInternalProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalProvider, 0);
}

@end
