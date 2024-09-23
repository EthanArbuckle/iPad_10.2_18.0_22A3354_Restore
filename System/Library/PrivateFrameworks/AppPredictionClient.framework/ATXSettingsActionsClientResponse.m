@implementation ATXSettingsActionsClientResponse

- (ATXSettingsActionsClientResponse)initWithActions:(id)a3
{
  id v4;
  ATXSettingsActionsClientResponse *v5;
  uint64_t v6;
  NSArray *actions;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXSettingsActionsClientResponse;
  v5 = -[ATXSettingsActionsClientResponse init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    actions = v5->_actions;
    v5->_actions = (NSArray *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXSettingsActionsClientResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ATXSettingsActionsClientResponse *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("actions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v5;
  else
    v6 = (void *)MEMORY[0x1E0C9AA60];
  v7 = -[ATXSettingsActionsClientResponse initWithActions:](self, "initWithActions:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_actions, CFSTR("actions"));
}

- (NSArray)actions
{
  return self->_actions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
}

@end
