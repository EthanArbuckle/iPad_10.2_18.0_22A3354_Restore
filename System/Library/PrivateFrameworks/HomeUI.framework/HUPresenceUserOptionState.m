@implementation HUPresenceUserOptionState

- (HUPresenceUserOptionState)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithActivationGranularity_selected_locationAvailable_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUPresenceUserPickerItemModule.m"), 566, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUPresenceUserOptionState init]",
    v5);

  return 0;
}

- (HUPresenceUserOptionState)initWithActivationGranularity:(unint64_t)a3 selected:(BOOL)a4 locationAvailable:(BOOL)a5
{
  HUPresenceUserOptionState *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HUPresenceUserOptionState;
  result = -[HUPresenceUserOptionState init](&v9, sel_init);
  if (result)
  {
    result->_activationGranularity = a3;
    result->_selected = a4;
    result->_locationAvailable = a5;
  }
  return result;
}

- (unint64_t)activationGranularity
{
  return self->_activationGranularity;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)isLocationAvailable
{
  return self->_locationAvailable;
}

@end
