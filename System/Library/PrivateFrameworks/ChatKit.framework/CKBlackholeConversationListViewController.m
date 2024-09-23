@implementation CKBlackholeConversationListViewController

- (void)setParentController:(id)a3
{
  objc_storeStrong((id *)&self->_parentController, a3);
}

- (id)parentController
{
  return self->_parentController;
}

- (void)setRootController:(id)a3
{
  objc_storeStrong((id *)&self->_rootController, a3);
}

- (id)rootController
{
  return self->_rootController;
}

- (void)setSpecifier:(id)a3
{
  PSSpecifier *v5;
  PSSpecifier *v6;

  v5 = (PSSpecifier *)a3;
  if (self->_specifier != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_specifier, a3);
    v5 = v6;
  }

}

- (id)specifier
{
  return self->_specifier;
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
  objc_msgSend(MEMORY[0x1E0D804D8], "setPreferenceValue:specifier:", a3, a4);
}

- (id)readPreferenceValue:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D804D8], "readPreferenceValue:", a3);
}

- (void)showController:(id)a3
{
  -[PSController showController:](self->_parentController, "showController:", a3);
}

- (void)showController:(id)a3 animate:(BOOL)a4
{
  -[PSController showController:animate:](self->_parentController, "showController:animate:", a3, a4);
}

- (void)handleURL:(id)a3
{
  -[PSController handleURL:](self->_parentController, "handleURL:", a3);
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  -[PSController handleURL:withCompletion:](self->_parentController, "handleURL:withCompletion:", a3, a4);
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifier, 0);
  objc_storeStrong((id *)&self->_rootController, 0);
  objc_storeStrong((id *)&self->_parentController, 0);
}

@end
