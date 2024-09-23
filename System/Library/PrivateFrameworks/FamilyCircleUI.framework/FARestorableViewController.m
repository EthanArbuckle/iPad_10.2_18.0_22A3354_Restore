@implementation FARestorableViewController

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (PSRootController)rootController
{
  return (PSRootController *)objc_getAssociatedObject(self, sel_rootController);
}

- (void)setRootController:(id)a3
{
  objc_setAssociatedObject(self, sel_rootController, a3, (void *)1);
}

- (UIViewController)parentController
{
  return (UIViewController *)objc_getAssociatedObject(self, sel_parentController);
}

- (void)setParentController:(id)a3
{
  objc_setAssociatedObject(self, sel_parentController, a3, (void *)1);
}

- (void)setSpecifier:(id)a3
{
  objc_setAssociatedObject(self, sel_specifier, a3, (void *)1);
}

- (PSSpecifier)specifier
{
  return (PSSpecifier *)objc_getAssociatedObject(self, sel_specifier);
}

- (void)showController:(id)a3
{
  -[FARestorableViewController showViewController:sender:](self, "showViewController:sender:", a3, 0);
}

- (id)readPreferenceValue:(id)a3
{
  return 0;
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

@end
