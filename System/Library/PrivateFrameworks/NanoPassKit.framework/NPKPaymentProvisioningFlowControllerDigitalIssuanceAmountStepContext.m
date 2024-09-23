@implementation NPKPaymentProvisioningFlowControllerDigitalIssuanceAmountStepContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPKPaymentProvisioningFlowControllerDigitalIssuanceAmountStepContext)initWithRequestContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NPKPaymentProvisioningFlowControllerDigitalIssuanceAmountStepContext;
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
  v5 = -[NPKPaymentProvisioningFlowControllerDigitalIssuanceAmountStepContext allowsReaderModeEntry](self, "allowsReaderModeEntry");
  -[NPKPaymentProvisioningFlowControllerDigitalIssuanceAmountStepContext product](self, "product");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ allows reader mode entry %d product %@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NPKPaymentProvisioningFlowControllerDigitalIssuanceAmountStepContext)initWithCoder:(id)a3
{
  id v4;
  NPKPaymentProvisioningFlowControllerDigitalIssuanceAmountStepContext *v5;
  uint64_t v6;
  PKPaymentSetupProduct *product;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NPKPaymentProvisioningFlowControllerDigitalIssuanceAmountStepContext;
  v5 = -[NPKPaymentProvisioningFlowStepContext initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_allowsReaderModeEntry = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsReaderModeEntry"));
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
  v5.super_class = (Class)NPKPaymentProvisioningFlowControllerDigitalIssuanceAmountStepContext;
  v4 = a3;
  -[NPKPaymentProvisioningFlowStepContext encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_allowsReaderModeEntry, CFSTR("allowsReaderModeEntry"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_product, CFSTR("product"));

}

- (PKPaymentSetupProduct)product
{
  return self->_product;
}

- (void)setProduct:(id)a3
{
  objc_storeStrong((id *)&self->_product, a3);
}

- (BOOL)allowsReaderModeEntry
{
  return self->_allowsReaderModeEntry;
}

- (void)setAllowsReaderModeEntry:(BOOL)a3
{
  self->_allowsReaderModeEntry = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_product, 0);
}

@end
