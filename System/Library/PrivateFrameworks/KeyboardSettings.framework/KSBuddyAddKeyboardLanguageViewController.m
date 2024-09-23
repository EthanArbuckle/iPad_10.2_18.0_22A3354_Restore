@implementation KSBuddyAddKeyboardLanguageViewController

- (KSBuddyAddKeyboardLanguageViewController)initWithCompletion:(id)a3
{
  KSBuddyAddKeyboardLanguageViewController *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)KSBuddyAddKeyboardLanguageViewController;
  v4 = -[KSBuddyAddKeyboardLanguageViewController init](&v7, sel_init);
  if (v4)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setCompletionBlock:", a3);
    -[KSBuddyAddKeyboardLanguageViewController setWrapper:](v4, "setWrapper:", v5);
  }
  return v4;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)KSBuddyAddKeyboardLanguageViewController;
  -[KSBuddyAddKeyboardLanguageViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[KSBuddyAddKeyboardLanguageViewController showViewController:sender:](self, "showViewController:sender:", -[KSBuddyAddKeyboardLanguageViewController wrapper](self, "wrapper"), self);
}

- (NSArray)suggestedInputModes
{
  return self->_suggestedInputModes;
}

- (KSBuddyAddKeyboardLanguageListControllerWrapper)wrapper
{
  return self->_wrapper;
}

- (void)setWrapper:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 976);
}

@end
