@implementation NPKPaymentProvisioningFlowStepContext

- (NPKPaymentProvisioningFlowStepContext)initWithRequestContext:(id)a3
{
  id v5;
  NPKPaymentProvisioningFlowStepContext *v6;
  NPKPaymentProvisioningFlowStepContext *v7;
  void *v8;
  uint64_t v9;
  NSString *stepIdentifier;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NPKPaymentProvisioningFlowStepContext;
  v6 = -[NPKPaymentProvisioningFlowStepContext init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_requestContext, a3);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = objc_claimAutoreleasedReturnValue();
    stepIdentifier = v7->_stepIdentifier;
    v7->_stepIdentifier = (NSString *)v9;

  }
  return v7;
}

- (NPKPaymentProvisioningFlowStepContext)initWithCoder:(id)a3
{
  id v4;
  NPKPaymentProvisioningFlowStepContext *v5;
  uint64_t v6;
  NPKPaymentProvisioningFlowControllerRequestContext *requestContext;
  uint64_t v8;
  NSString *stepIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NPKPaymentProvisioningFlowStepContext;
  v5 = -[NPKPaymentProvisioningFlowStepContext init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestContext"));
    v6 = objc_claimAutoreleasedReturnValue();
    requestContext = v5->_requestContext;
    v5->_requestContext = (NPKPaymentProvisioningFlowControllerRequestContext *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stepIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    stepIdentifier = v5->_stepIdentifier;
    v5->_stepIdentifier = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NPKPaymentProvisioningFlowControllerRequestContext *requestContext;
  id v5;

  requestContext = self->_requestContext;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", requestContext, CFSTR("requestContext"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_stepIdentifier, CFSTR("stepIdentifier"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_baseFlowStepDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[NPKPaymentProvisioningFlowStepContext stepIdentifier](self, "stepIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPaymentProvisioningFlowStepContext backStepIdentifier](self, "backStepIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %p identifier %@ back step identifier %@"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)preconditionsStepContext
{
  NPKPaymentProvisioningFlowStepContext *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)welcomeStepContext
{
  NPKPaymentProvisioningFlowStepContext *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)chooseFlowStepContext
{
  NPKPaymentProvisioningFlowStepContext *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)chooseProductStepContext
{
  NPKPaymentProvisioningFlowStepContext *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)chooseCredentialsStepContext
{
  NPKPaymentProvisioningFlowStepContext *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)digitalIssuanceAmountStepContext
{
  NPKPaymentProvisioningFlowStepContext *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)digitalIssuancePaymentStepContext
{
  NPKPaymentProvisioningFlowStepContext *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)readerModeEntryStepContext
{
  NPKPaymentProvisioningFlowStepContext *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)readerModeIngestionStepContext
{
  NPKPaymentProvisioningFlowStepContext *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)manualEntryStepContext
{
  NPKPaymentProvisioningFlowStepContext *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)secondaryManualEntryStepContext
{
  NPKPaymentProvisioningFlowStepContext *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)localDeviceManualEntryStepContext
{
  NPKPaymentProvisioningFlowStepContext *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)localDeviceManualEntryProgressStepContext
{
  NPKPaymentProvisioningFlowStepContext *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)productDisambiguationStepContext
{
  NPKPaymentProvisioningFlowStepContext *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)passcodeUpgradeStepContext
{
  NPKPaymentProvisioningFlowStepContext *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)termsAndConditionsStepContext
{
  NPKPaymentProvisioningFlowStepContext *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)provisioningProgressStepContext
{
  NPKPaymentProvisioningFlowStepContext *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)moreInformationStepContext
{
  NPKPaymentProvisioningFlowStepContext *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)provisioningResultStepContext
{
  NPKPaymentProvisioningFlowStepContext *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)verificationChannelsStepContext
{
  NPKPaymentProvisioningFlowStepContext *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)verificationFieldsStepContext
{
  NPKPaymentProvisioningFlowStepContext *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)verificationCodeStepContext
{
  NPKPaymentProvisioningFlowStepContext *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)getIssuerApplicationAddRequestStepContext
{
  NPKPaymentProvisioningFlowStepContext *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)chooseTransitProductStepContext
{
  NPKPaymentProvisioningFlowStepContext *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)chooseEMoneyProductStepContext
{
  NPKPaymentProvisioningFlowStepContext *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)appleBalanceAccountDetailsStepContext
{
  NPKPaymentProvisioningFlowStepContext *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (NPKPaymentProvisioningFlowControllerRequestContext)requestContext
{
  return (NPKPaymentProvisioningFlowControllerRequestContext *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)stepIdentifier
{
  return self->_stepIdentifier;
}

- (void)setStepIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_stepIdentifier, a3);
}

- (NSString)backStepIdentifier
{
  return self->_backStepIdentifier;
}

- (void)setBackStepIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_backStepIdentifier, a3);
}

- (BOOL)allowsAddLater
{
  return self->_allowsAddLater;
}

- (void)setAllowsAddLater:(BOOL)a3
{
  self->_allowsAddLater = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backStepIdentifier, 0);
  objc_storeStrong((id *)&self->_stepIdentifier, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
}

@end
