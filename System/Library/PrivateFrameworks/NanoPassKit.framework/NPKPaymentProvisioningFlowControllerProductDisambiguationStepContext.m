@implementation NPKPaymentProvisioningFlowControllerProductDisambiguationStepContext

- (NPKPaymentProvisioningFlowControllerProductDisambiguationStepContext)initWithRequestContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NPKPaymentProvisioningFlowControllerProductDisambiguationStepContext;
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
  -[NPKPaymentProvisioningFlowControllerProductDisambiguationStepContext products](self, "products");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ products %@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)products
{
  return self->_products;
}

- (void)setProducts:(id)a3
{
  objc_storeStrong((id *)&self->_products, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_products, 0);
}

@end
