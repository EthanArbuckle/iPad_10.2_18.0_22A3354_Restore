@implementation NPKPaymentProvisioningFlowControllerProvisioningProgressStepContext

- (NPKPaymentProvisioningFlowControllerProvisioningProgressStepContext)initWithRequestContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NPKPaymentProvisioningFlowControllerProvisioningProgressStepContext;
  return -[NPKPaymentProvisioningFlowStepContext initWithRequestContext:](&v4, sel_initWithRequestContext_, a3);
}

- (PKPaymentSetupProduct)product
{
  return self->_product;
}

- (void)setProduct:(id)a3
{
  objc_storeStrong((id *)&self->_product, a3);
}

- (NSString)localizedProgressDescription
{
  return self->_localizedProgressDescription;
}

- (void)setLocalizedProgressDescription:(id)a3
{
  objc_storeStrong((id *)&self->_localizedProgressDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedProgressDescription, 0);
  objc_storeStrong((id *)&self->_product, 0);
}

@end
