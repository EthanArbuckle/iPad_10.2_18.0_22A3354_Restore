@implementation LAEnvironmentMechanismUserPassword

- (LAEnvironmentMechanismUserPassword)initWithCoreMechanism:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LAEnvironmentMechanismUserPassword;
  return -[LAEnvironmentMechanism initWithCoreMechanism:](&v4, sel_initWithCoreMechanism_, a3);
}

- (BOOL)isSet
{
  void *v2;
  char v3;

  -[LAEnvironmentMechanism coreMechanism](self, "coreMechanism");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "set");

  return v3;
}

@end
