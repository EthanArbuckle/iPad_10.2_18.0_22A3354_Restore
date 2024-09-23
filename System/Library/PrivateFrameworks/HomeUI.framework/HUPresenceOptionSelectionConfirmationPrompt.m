@implementation HUPresenceOptionSelectionConfirmationPrompt

- (HUPresenceOptionSelectionConfirmationPrompt)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithAlertTitle_alertBody_resetLocationToHomeOnConfirmation_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUPresenceUserPickerItemModule.m"), 585, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUPresenceOptionSelectionConfirmationPrompt init]",
    v5);

  return 0;
}

- (HUPresenceOptionSelectionConfirmationPrompt)initWithAlertTitle:(id)a3 alertBody:(id)a4 resetLocationToHomeOnConfirmation:(BOOL)a5
{
  id v9;
  id v10;
  HUPresenceOptionSelectionConfirmationPrompt *v11;
  HUPresenceOptionSelectionConfirmationPrompt *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HUPresenceOptionSelectionConfirmationPrompt;
  v11 = -[HUPresenceOptionSelectionConfirmationPrompt init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_alertTitle, a3);
    objc_storeStrong((id *)&v12->_alertBody, a4);
    v12->_resetLocationToHomeOnConfirmation = a5;
  }

  return v12;
}

- (NSString)alertTitle
{
  return self->_alertTitle;
}

- (NSString)alertBody
{
  return self->_alertBody;
}

- (BOOL)resetLocationToHomeOnConfirmation
{
  return self->_resetLocationToHomeOnConfirmation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertBody, 0);
  objc_storeStrong((id *)&self->_alertTitle, 0);
}

@end
