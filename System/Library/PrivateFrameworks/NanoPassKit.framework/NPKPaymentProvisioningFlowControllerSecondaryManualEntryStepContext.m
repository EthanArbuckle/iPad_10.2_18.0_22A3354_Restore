@implementation NPKPaymentProvisioningFlowControllerSecondaryManualEntryStepContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPKPaymentProvisioningFlowControllerSecondaryManualEntryStepContext)initWithRequestContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NPKPaymentProvisioningFlowControllerSecondaryManualEntryStepContext;
  return -[NPKPaymentProvisioningFlowControllerManualEntryStepContext initWithRequestContext:](&v4, sel_initWithRequestContext_, a3);
}

- (id)description
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[NPKPaymentProvisioningFlowStepContext _baseFlowStepDescription](self, "_baseFlowStepDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NPKPaymentProvisioningFlowControllerManualEntryStepContext cameraFirstProvisioningEnabled](self, "cameraFirstProvisioningEnabled");
  -[NPKPaymentProvisioningFlowControllerManualEntryStepContext setupFields](self, "setupFields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPaymentProvisioningFlowControllerSecondaryManualEntryStepContext credential](self, "credential");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ camera first provisioning enabled %d setup fields %@ credential %@>"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NPKPaymentProvisioningFlowControllerSecondaryManualEntryStepContext)initWithCoder:(id)a3
{
  id v4;
  NPKPaymentProvisioningFlowControllerSecondaryManualEntryStepContext *v5;
  uint64_t v6;
  PKPaymentCredential *credential;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NPKPaymentProvisioningFlowControllerSecondaryManualEntryStepContext;
  v5 = -[NPKPaymentProvisioningFlowControllerManualEntryStepContext initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credential"));
    v6 = objc_claimAutoreleasedReturnValue();
    credential = v5->_credential;
    v5->_credential = (PKPaymentCredential *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NPKPaymentProvisioningFlowControllerSecondaryManualEntryStepContext;
  v4 = a3;
  -[NPKPaymentProvisioningFlowControllerManualEntryStepContext encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_credential, CFSTR("credential"), v5.receiver, v5.super_class);

}

- (PKPaymentCredential)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
  objc_storeStrong((id *)&self->_credential, a3);
}

- (BOOL)allowsAddingDifferentCard
{
  return self->_allowsAddingDifferentCard;
}

- (void)setAllowsAddingDifferentCard:(BOOL)a3
{
  self->_allowsAddingDifferentCard = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credential, 0);
}

@end
