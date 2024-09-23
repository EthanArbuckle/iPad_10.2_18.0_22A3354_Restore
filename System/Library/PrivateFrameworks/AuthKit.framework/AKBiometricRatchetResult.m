@implementation AKBiometricRatchetResult

- (AKBiometricRatchetResult)initWithRatchetState:(id)a3 armingMethod:(unint64_t)a4
{
  id v7;
  AKBiometricRatchetResult *v8;
  AKBiometricRatchetResult *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKBiometricRatchetResult;
  v8 = -[AKBiometricRatchetResult init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_ratchetState, a3);
    v9->_armingMethod = a4;
  }

  return v9;
}

- (AKRatchetState)ratchetState
{
  return self->_ratchetState;
}

- (unint64_t)armingMethod
{
  return self->_armingMethod;
}

- (void)setArmingMethod:(unint64_t)a3
{
  self->_armingMethod = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratchetState, 0);
}

@end
