@implementation KSAddKeyboardLanguageListSetupController

- (void)setupController
{
  id v3;
  KSAddKeyboardLanguageListController *v4;

  v3 = objc_alloc_init(MEMORY[0x24BE75590]);
  v4 = objc_alloc_init(KSAddKeyboardLanguageListController);
  -[KSAddKeyboardLanguageListController setRootController:](v4, "setRootController:", self);
  -[KSAddKeyboardLanguageListController setSpecifier:](v4, "setSpecifier:", v3);
  -[KSAddKeyboardLanguageListController setParentController:](v4, "setParentController:", self);
  -[PSRootController showController:](self, "showController:", v4);
}

@end
