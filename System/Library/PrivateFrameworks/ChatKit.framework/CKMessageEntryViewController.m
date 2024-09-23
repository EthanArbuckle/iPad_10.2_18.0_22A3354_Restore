@implementation CKMessageEntryViewController

- (CKMessageEntryViewController)initWithEntryView:(id)a3
{
  id v5;
  CKMessageEntryViewController *v6;
  CKMessageEntryViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKMessageEntryViewController;
  v6 = -[CKMessageEntryViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_entryView, a3);

  return v7;
}

- (void)loadView
{
  id v3;

  if (-[CKMessageEntryViewController inputAccessoryViewControllerEnabled](self, "inputAccessoryViewControllerEnabled"))
  {
    -[CKMessageEntryViewController entryView](self, "entryView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[UIInputViewController setView:](self, "setView:", v3);

  }
}

+ (BOOL)_requiresProxyInterface
{
  return 0;
}

- (CKMessageEntryView)entryView
{
  return self->_entryView;
}

- (BOOL)inputAccessoryViewControllerEnabled
{
  return self->_inputAccessoryViewControllerEnabled;
}

- (void)setInputAccessoryViewControllerEnabled:(BOOL)a3
{
  self->_inputAccessoryViewControllerEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryView, 0);
}

@end
