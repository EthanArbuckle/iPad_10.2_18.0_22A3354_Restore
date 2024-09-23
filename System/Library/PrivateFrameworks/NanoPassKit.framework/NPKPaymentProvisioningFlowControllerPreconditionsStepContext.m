@implementation NPKPaymentProvisioningFlowControllerPreconditionsStepContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPKPaymentProvisioningFlowControllerPreconditionsStepContext)initWithRequestContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NPKPaymentProvisioningFlowControllerPreconditionsStepContext;
  return -[NPKPaymentProvisioningFlowStepContext initWithRequestContext:](&v4, sel_initWithRequestContext_, a3);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[NPKPaymentProvisioningFlowStepContext _baseFlowStepDescription](self, "_baseFlowStepDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ preconditionsState %ld>"), v4, -[NPKPaymentProvisioningFlowControllerPreconditionsStepContext preconditionsState](self, "preconditionsState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NPKPaymentProvisioningFlowControllerPreconditionsStepContext)initWithCoder:(id)a3
{
  id v4;
  NPKPaymentProvisioningFlowControllerPreconditionsStepContext *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NPKPaymentProvisioningFlowControllerPreconditionsStepContext;
  v5 = -[NPKPaymentProvisioningFlowStepContext initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_preconditionsState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("preconditionsState"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NPKPaymentProvisioningFlowControllerPreconditionsStepContext;
  v4 = a3;
  -[NPKPaymentProvisioningFlowStepContext encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_preconditionsState, CFSTR("preconditionsState"), v5.receiver, v5.super_class);

}

- (unint64_t)preconditionsState
{
  return self->_preconditionsState;
}

- (void)setPreconditionsState:(unint64_t)a3
{
  self->_preconditionsState = a3;
}

@end
