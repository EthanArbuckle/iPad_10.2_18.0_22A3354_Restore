@implementation CNMeCardSharedProfileGroupActionItem

- (CNContactSharedProfileSettingsAction)sharedProfileSettingsAction
{
  return self->_sharedProfileSettingsAction;
}

- (void)setSharedProfileSettingsAction:(id)a3
{
  objc_storeStrong((id *)&self->_sharedProfileSettingsAction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedProfileSettingsAction, 0);
}

@end
