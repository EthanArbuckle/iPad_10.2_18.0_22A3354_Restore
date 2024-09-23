@implementation SFWebExtensionButtonConfiguration

- (SFWebExtensionButtonConfiguration)initWithActiveExtensionCount:(unint64_t)a3 alwaysShowMultipleExtensionsButton:(BOOL)a4 buttons:(id)a5 extensionsController:(id)a6
{
  id v11;
  id v12;
  SFWebExtensionButtonConfiguration *v13;
  SFWebExtensionButtonConfiguration *v14;
  SFWebExtensionButtonConfiguration *v15;
  objc_super v17;

  v11 = a5;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SFWebExtensionButtonConfiguration;
  v13 = -[SFWebExtensionButtonConfiguration init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_activeExtensionCount = a3;
    v13->_alwaysShowMultipleExtensionsButton = a4;
    objc_storeStrong((id *)&v13->_buttons, a5);
    objc_storeStrong((id *)&v14->_webExtensionsController, a6);
    v15 = v14;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  SFWebExtensionButtonConfiguration *v4;
  SFWebExtensionButtonConfiguration *v5;
  SFWebExtensionButtonConfiguration *v6;
  char v7;

  v4 = (SFWebExtensionButtonConfiguration *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = v5;
      if (self->_activeExtensionCount == v5->_activeExtensionCount
        && self->_alwaysShowMultipleExtensionsButton == v5->_alwaysShowMultipleExtensionsButton)
      {
        v7 = WBSIsEqual();
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)activeExtensionCount
{
  return self->_activeExtensionCount;
}

- (BOOL)alwaysShowMultipleExtensionsButton
{
  return self->_alwaysShowMultipleExtensionsButton;
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (SFWebExtensionsController)webExtensionsController
{
  return self->_webExtensionsController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webExtensionsController, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
}

@end
