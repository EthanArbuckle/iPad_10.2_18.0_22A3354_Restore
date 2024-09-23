@implementation NPKPaymentProvisioningFlowControllerIssuerVerificationChannelsStepContext

- (NPKPaymentProvisioningFlowControllerIssuerVerificationChannelsStepContext)initWithRequestContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NPKPaymentProvisioningFlowControllerIssuerVerificationChannelsStepContext;
  return -[NPKPaymentProvisioningFlowStepContext initWithRequestContext:](&v4, sel_initWithRequestContext_, a3);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[NPKPaymentProvisioningFlowStepContext _baseFlowStepDescription](self, "_baseFlowStepDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPaymentProvisioningFlowControllerIssuerVerificationChannelsStepContext paymentPass](self, "paymentPass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPaymentProvisioningFlowControllerIssuerVerificationChannelsStepContext verificationChannels](self, "verificationChannels");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ pass unique ID %@ channels %@>"), v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (PKPaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (void)setPaymentPass:(id)a3
{
  objc_storeStrong((id *)&self->_paymentPass, a3);
}

- (NSArray)verificationChannels
{
  return self->_verificationChannels;
}

- (void)setVerificationChannels:(id)a3
{
  objc_storeStrong((id *)&self->_verificationChannels, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationChannels, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
}

@end
