@implementation NPKPaymentProvisioningFlowControllerProvisioningResultStepContext

- (NPKPaymentProvisioningFlowControllerProvisioningResultStepContext)initWithRequestContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NPKPaymentProvisioningFlowControllerProvisioningResultStepContext;
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
  v5 = -[NPKPaymentProvisioningFlowControllerProvisioningResultStepContext cardAdded](self, "cardAdded");
  -[NPKPaymentProvisioningFlowControllerProvisioningResultStepContext error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ card added %d error %@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)cardAdded
{
  return self->_cardAdded;
}

- (void)setCardAdded:(BOOL)a3
{
  self->_cardAdded = a3;
}

- (PKPaymentPass)provisionedPass
{
  return self->_provisionedPass;
}

- (void)setProvisionedPass:(id)a3
{
  objc_storeStrong((id *)&self->_provisionedPass, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_provisionedPass, 0);
}

@end
