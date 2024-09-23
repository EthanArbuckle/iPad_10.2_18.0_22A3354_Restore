@implementation NPKPaymentProvisioningFlowControllerManualEntryStepContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPKPaymentProvisioningFlowControllerManualEntryStepContext)initWithRequestContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NPKPaymentProvisioningFlowControllerManualEntryStepContext;
  return -[NPKPaymentProvisioningFlowStepContext initWithRequestContext:](&v4, sel_initWithRequestContext_, a3);
}

- (id)description
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[NPKPaymentProvisioningFlowStepContext _baseFlowStepDescription](self, "_baseFlowStepDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NPKPaymentProvisioningFlowControllerManualEntryStepContext cameraFirstProvisioningEnabled](self, "cameraFirstProvisioningEnabled");
  -[NPKPaymentProvisioningFlowControllerManualEntryStepContext setupFields](self, "setupFields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ camera first provisioning enabled %d setup fields %@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NPKPaymentProvisioningFlowControllerManualEntryStepContext)initWithCoder:(id)a3
{
  id v4;
  NPKPaymentProvisioningFlowControllerManualEntryStepContext *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *setupFields;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NPKPaymentProvisioningFlowControllerManualEntryStepContext;
  v5 = -[NPKPaymentProvisioningFlowStepContext initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_cameraFirstProvisioningEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cameraFirstProvisioningEnabled"));
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("setupFields"));
    v9 = objc_claimAutoreleasedReturnValue();
    setupFields = v5->_setupFields;
    v5->_setupFields = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NPKPaymentProvisioningFlowControllerManualEntryStepContext;
  v4 = a3;
  -[NPKPaymentProvisioningFlowStepContext encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_cameraFirstProvisioningEnabled, CFSTR("cameraFirstProvisioningEnabled"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_setupFields, CFSTR("setupFields"));

}

- (BOOL)cameraFirstProvisioningEnabled
{
  return self->_cameraFirstProvisioningEnabled;
}

- (void)setCameraFirstProvisioningEnabled:(BOOL)a3
{
  self->_cameraFirstProvisioningEnabled = a3;
}

- (NSArray)setupFields
{
  return self->_setupFields;
}

- (void)setSetupFields:(id)a3
{
  objc_storeStrong((id *)&self->_setupFields, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupFields, 0);
}

@end
