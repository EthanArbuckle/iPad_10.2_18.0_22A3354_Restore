@implementation LAEnvironmentMechanismBiometry

- (LAEnvironmentMechanismBiometry)initWithCoreMechanism:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LAEnvironmentMechanismBiometry;
  return -[LAEnvironmentMechanism initWithCoreMechanism:](&v4, sel_initWithCoreMechanism_, a3);
}

- (int64_t)biometryType
{
  void *v2;
  int64_t v3;

  -[LAEnvironmentMechanism coreMechanism](self, "coreMechanism");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "biometryType");

  return v3;
}

- (BOOL)isEnrolled
{
  void *v2;
  char v3;

  -[LAEnvironmentMechanism coreMechanism](self, "coreMechanism");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "enrolled");

  return v3;
}

- (BOOL)isLockedOut
{
  void *v2;
  char v3;

  -[LAEnvironmentMechanism coreMechanism](self, "coreMechanism");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lockedOut");

  return v3;
}

- (NSData)stateHash
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0D443D0];
  -[LAEnvironmentMechanismBiometry unsaltedStateHash](self, "unsaltedStateHash");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "saltHash:withBundleID:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v6;
}

- (id)unsaltedStateHash
{
  void *v2;
  void *v3;

  -[LAEnvironmentMechanism coreMechanism](self, "coreMechanism");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stateHash");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)builtInSensorInaccessible
{
  void *v2;
  char v3;

  -[LAEnvironmentMechanism coreMechanism](self, "coreMechanism");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sensorInaccessible");

  return v3;
}

- (int64_t)approvalState
{
  void *v2;
  int64_t v3;

  -[LAEnvironmentMechanism coreMechanism](self, "coreMechanism");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "approvalState");

  return v3;
}

- (void)setApprovalState:(int64_t)a3
{
  self->_approvalState = a3;
}

@end
