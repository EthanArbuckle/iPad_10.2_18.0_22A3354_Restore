@implementation HUPresenceActivationOptionState

- (HUPresenceActivationOptionState)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithUserOptionItemProvider_activationOptionItem_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUPresenceUserPickerItemModule.m"), 533, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUPresenceActivationOptionState init]",
    v5);

  return 0;
}

- (HUPresenceActivationOptionState)initWithUserOptionItemProvider:(id)a3 activationOptionItem:(id)a4
{
  id v7;
  id v8;
  HUPresenceActivationOptionState *v9;
  HUPresenceActivationOptionState *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUPresenceActivationOptionState;
  v9 = -[HUPresenceActivationOptionState init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userOptionItemProvider, a3);
    objc_storeStrong((id *)&v10->_activationOptionItem, a4);
  }

  return v10;
}

- (unint64_t)activationGranularity
{
  void *v2;
  unint64_t v3;

  -[HUPresenceActivationOptionState activationOptionItem](self, "activationOptionItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "activationGranularity");

  return v3;
}

- (BOOL)isSelected
{
  void *v2;
  char v3;

  -[HUPresenceActivationOptionState activationOptionItem](self, "activationOptionItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSelected");

  return v3;
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HUPresenceActivationOptionState activationOptionItem](self, "activationOptionItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelected:", v3);

}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
}

- (HFTransformItemProvider)userOptionItemProvider
{
  return self->_userOptionItemProvider;
}

- (HUPresenceActivationOptionItem)activationOptionItem
{
  return self->_activationOptionItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationOptionItem, 0);
  objc_storeStrong((id *)&self->_userOptionItemProvider, 0);
}

@end
