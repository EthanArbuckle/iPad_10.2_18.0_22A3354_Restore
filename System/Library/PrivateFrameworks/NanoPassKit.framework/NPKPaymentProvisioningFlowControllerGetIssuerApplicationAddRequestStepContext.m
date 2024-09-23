@implementation NPKPaymentProvisioningFlowControllerGetIssuerApplicationAddRequestStepContext

- (NPKPaymentProvisioningFlowControllerGetIssuerApplicationAddRequestStepContext)initWithRequestContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NPKPaymentProvisioningFlowControllerGetIssuerApplicationAddRequestStepContext;
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
  -[NPKPaymentProvisioningFlowControllerGetIssuerApplicationAddRequestStepContext certificates](self, "certificates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPaymentProvisioningFlowControllerGetIssuerApplicationAddRequestStepContext nonce](self, "nonce");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPaymentProvisioningFlowControllerGetIssuerApplicationAddRequestStepContext nonceSignature](self, "nonceSignature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ certificates %@ nonce %@ nonce signature %@>"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSArray)certificates
{
  return self->_certificates;
}

- (void)setCertificates:(id)a3
{
  objc_storeStrong((id *)&self->_certificates, a3);
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
  objc_storeStrong((id *)&self->_nonce, a3);
}

- (NSData)nonceSignature
{
  return self->_nonceSignature;
}

- (void)setNonceSignature:(id)a3
{
  objc_storeStrong((id *)&self->_nonceSignature, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonceSignature, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
}

@end
