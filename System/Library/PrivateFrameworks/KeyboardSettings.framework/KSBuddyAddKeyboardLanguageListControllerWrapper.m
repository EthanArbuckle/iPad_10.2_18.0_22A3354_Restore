@implementation KSBuddyAddKeyboardLanguageListControllerWrapper

- (void)viewDidLoad
{
  KSAddKeyboardLanguageListController *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)KSBuddyAddKeyboardLanguageListControllerWrapper;
  -[KSBuddyAddKeyboardLanguageListControllerWrapper viewDidLoad](&v4, sel_viewDidLoad);
  v3 = objc_alloc_init(KSAddKeyboardLanguageListController);
  -[KSAddKeyboardLanguageListController setReturnSuggestedInputModes:](v3, "setReturnSuggestedInputModes:", 1);
  -[KSAddKeyboardLanguageListController setRootController:](v3, "setRootController:", self);
  -[KSAddKeyboardLanguageListController setSpecifier:](v3, "setSpecifier:", objc_alloc_init(MEMORY[0x24BE75590]));
  -[KSAddKeyboardLanguageListController setParentController:](v3, "setParentController:", self);
  -[PSRootController showController:](self, "showController:", v3);
  -[KSBuddyAddKeyboardLanguageListControllerWrapper setController:](self, "setController:", v3);
}

- (void)dismiss
{
  void (**v2)(id, _QWORD);

  v2 = -[KSBuddyAddKeyboardLanguageListControllerWrapper completionBlock](self, "completionBlock");
  v2[2](v2, MEMORY[0x24BDBD1A8]);
}

- (KSAddKeyboardLanguageListController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1464);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1472);
}

@end
