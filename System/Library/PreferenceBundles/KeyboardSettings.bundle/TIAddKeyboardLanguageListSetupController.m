@implementation TIAddKeyboardLanguageListSetupController

- (void)setupController
{
  id v3;
  TIAddKeyboardLanguageListController *v4;

  v3 = objc_alloc_init(MEMORY[0x24BE75590]);
  v4 = objc_alloc_init(TIAddKeyboardLanguageListController);
  -[TIAddKeyboardLanguageListController setRootController:](v4, "setRootController:", self);
  -[TIAddKeyboardLanguageListController setSpecifier:](v4, "setSpecifier:", v3);
  -[TIAddKeyboardLanguageListController setParentController:](v4, "setParentController:", self);
  -[PSRootController showController:](self, "showController:", v4);
}

@end
