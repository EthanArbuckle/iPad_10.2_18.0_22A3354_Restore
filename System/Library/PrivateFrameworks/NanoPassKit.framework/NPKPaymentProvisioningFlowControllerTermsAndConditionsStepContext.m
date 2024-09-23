@implementation NPKPaymentProvisioningFlowControllerTermsAndConditionsStepContext

- (NPKPaymentProvisioningFlowControllerTermsAndConditionsStepContext)initWithRequestContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NPKPaymentProvisioningFlowControllerTermsAndConditionsStepContext;
  return -[NPKPaymentProvisioningFlowStepContext initWithRequestContext:](&v4, sel_initWithRequestContext_, a3);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[NPKPaymentProvisioningFlowStepContext _baseFlowStepDescription](self, "_baseFlowStepDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPaymentProvisioningFlowControllerTermsAndConditionsStepContext termsURL](self, "termsURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ terms URL %@ allow non-secure HTTP %d>"), v4, v5, -[NPKPaymentProvisioningFlowControllerTermsAndConditionsStepContext allowNonSecureHTTP](self, "allowNonSecureHTTP"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PKPaymentSetupProduct)product
{
  return self->_product;
}

- (void)setProduct:(id)a3
{
  objc_storeStrong((id *)&self->_product, a3);
}

- (NSURL)termsURL
{
  return self->_termsURL;
}

- (void)setTermsURL:(id)a3
{
  objc_storeStrong((id *)&self->_termsURL, a3);
}

- (BOOL)allowNonSecureHTTP
{
  return self->_allowNonSecureHTTP;
}

- (void)setAllowNonSecureHTTP:(BOOL)a3
{
  self->_allowNonSecureHTTP = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termsURL, 0);
  objc_storeStrong((id *)&self->_product, 0);
}

@end
