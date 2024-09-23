@implementation NPKPaymentProvisioningFlowControllerLocalDeviceManualEntryProgressStepContext

- (NPKPaymentProvisioningFlowControllerLocalDeviceManualEntryProgressStepContext)initWithRequestContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NPKPaymentProvisioningFlowControllerLocalDeviceManualEntryProgressStepContext;
  return -[NPKPaymentProvisioningFlowStepContext initWithRequestContext:](&v4, sel_initWithRequestContext_, a3);
}

- (BOOL)numericEntryPending
{
  return self->_numericEntryPending;
}

- (void)setNumericEntryPending:(BOOL)a3
{
  self->_numericEntryPending = a3;
}

@end
