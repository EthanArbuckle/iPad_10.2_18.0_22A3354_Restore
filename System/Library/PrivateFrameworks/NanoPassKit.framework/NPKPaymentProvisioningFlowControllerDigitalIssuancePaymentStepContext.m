@implementation NPKPaymentProvisioningFlowControllerDigitalIssuancePaymentStepContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPKPaymentProvisioningFlowControllerDigitalIssuancePaymentStepContext)initWithRequestContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NPKPaymentProvisioningFlowControllerDigitalIssuancePaymentStepContext;
  return -[NPKPaymentProvisioningFlowStepContext initWithRequestContext:](&v4, sel_initWithRequestContext_, a3);
}

- (NPKPaymentProvisioningFlowControllerDigitalIssuancePaymentStepContext)initWithCoder:(id)a3
{
  id v4;
  NPKPaymentProvisioningFlowControllerDigitalIssuancePaymentStepContext *v5;
  uint64_t v6;
  PKPaymentSetupProduct *product;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NPKPaymentProvisioningFlowControllerDigitalIssuancePaymentStepContext;
  v5 = -[NPKPaymentProvisioningFlowStepContext initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("product"));
    v6 = objc_claimAutoreleasedReturnValue();
    product = v5->_product;
    v5->_product = (PKPaymentSetupProduct *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NPKPaymentProvisioningFlowControllerDigitalIssuancePaymentStepContext;
  v4 = a3;
  -[NPKPaymentProvisioningFlowStepContext encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_product, CFSTR("product"), v5.receiver, v5.super_class);

}

- (PKPaymentSetupProduct)product
{
  return self->_product;
}

- (void)setProduct:(id)a3
{
  objc_storeStrong((id *)&self->_product, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_product, 0);
}

@end
