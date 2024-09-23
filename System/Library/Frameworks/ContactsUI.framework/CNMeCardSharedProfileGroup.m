@implementation CNMeCardSharedProfileGroup

- (void)setSharedProfileSettingsAction:(id)a3
{
  objc_storeStrong((id *)&self->_sharedProfileSettingsAction, a3);
}

- (id)displayItems
{
  void *v3;
  CNMeCardSharedProfileGroupActionItem *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[CNMeCardSharedProfileGroup sharedProfileSettingsAction](self, "sharedProfileSettingsAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return MEMORY[0x1E0C9AA60];
  v4 = objc_alloc_init(CNMeCardSharedProfileGroupActionItem);
  -[CNMeCardSharedProfileGroup sharedProfileSettingsAction](self, "sharedProfileSettingsAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMeCardSharedProfileGroupActionItem setSharedProfileSettingsAction:](v4, "setSharedProfileSettingsAction:", v5);

  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CNContactSharedProfileSettingsAction)sharedProfileSettingsAction
{
  return self->_sharedProfileSettingsAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedProfileSettingsAction, 0);
}

@end
