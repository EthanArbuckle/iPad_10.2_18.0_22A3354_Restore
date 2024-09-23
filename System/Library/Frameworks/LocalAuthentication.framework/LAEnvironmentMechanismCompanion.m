@implementation LAEnvironmentMechanismCompanion

- (LAEnvironmentMechanismCompanion)initWithCoreMechanism:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LAEnvironmentMechanismCompanion;
  return -[LAEnvironmentMechanism initWithCoreMechanism:](&v4, sel_initWithCoreMechanism_, a3);
}

- (int64_t)companionType
{
  void *v2;
  int64_t v3;

  -[LAEnvironmentMechanism coreMechanism](self, "coreMechanism");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "companionType");

  return v3;
}

- (NSData)stateHash
{
  void *v2;
  void *v3;

  -[LAEnvironmentMechanism coreMechanism](self, "coreMechanism");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stateHash");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (int64_t)type
{
  return self->_type;
}

@end
