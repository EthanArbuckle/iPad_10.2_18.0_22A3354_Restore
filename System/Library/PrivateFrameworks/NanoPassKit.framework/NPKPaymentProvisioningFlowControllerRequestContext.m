@implementation NPKPaymentProvisioningFlowControllerRequestContext

- (NPKPaymentProvisioningFlowControllerRequestContext)initWithRequestHeader:(id)a3
{
  id v5;
  NPKPaymentProvisioningFlowControllerRequestContext *v6;
  NPKPaymentProvisioningFlowControllerRequestContext *v7;
  uint64_t v8;
  NSString *currentStepIdentifier;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NPKPaymentProvisioningFlowControllerRequestContext;
  v6 = -[NPKPaymentProvisioningFlowControllerRequestContext init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_requestHeader, a3);
    objc_msgSend(v5, "stepIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    currentStepIdentifier = v7->_currentStepIdentifier;
    v7->_currentStepIdentifier = (NSString *)v8;

  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPKPaymentProvisioningFlowControllerRequestContext)initWithCoder:(id)a3
{
  id v4;
  NPKPaymentProvisioningFlowControllerRequestContext *v5;
  uint64_t v6;
  NSString *currentStepIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NPKPaymentProvisioningFlowControllerRequestContext;
  v5 = -[NPKPaymentProvisioningFlowControllerRequestContext init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("currentStepIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    currentStepIdentifier = v5->_currentStepIdentifier;
    v5->_currentStepIdentifier = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_currentStepIdentifier, CFSTR("currentStepIdentifier"));
}

- (NPKProtoStandaloneRequestHeader)requestHeader
{
  return (NPKProtoStandaloneRequestHeader *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)currentStepIdentifier
{
  return self->_currentStepIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentStepIdentifier, 0);
  objc_storeStrong((id *)&self->_requestHeader, 0);
}

@end
