@implementation UIEditUserWordController

- (UIEditUserWordController)initWithText:(id)a3
{
  UIEditUserWordController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIEditUserWordController;
  v4 = -[EditUserWordController init](&v6, sel_init);
  if (v4)
  {
    -[EditUserWordController setDictionaryController:](v4, "setDictionaryController:", objc_alloc_init(TIUserWordsManager));
    -[EditUserWordController setTarget:](v4, "setTarget:", a3);
  }
  return v4;
}

- (UIEditUserWordController)initWithText:(id)a3 andShortcut:(id)a4
{
  UIEditUserWordController *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIEditUserWordController;
  v6 = -[EditUserWordController init](&v8, sel_init);
  if (v6)
  {
    -[EditUserWordController setDictionaryController:](v6, "setDictionaryController:", objc_alloc_init(TIUserWordsManager));
    -[EditUserWordController setTarget:](v6, "setTarget:", a3);
    -[EditUserWordController setShortcut:](v6, "setShortcut:", a4);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIEditUserWordController;
  -[EditUserWordController dealloc](&v3, sel_dealloc);
}

- (BOOL)_shouldSetDefaultFirstResponder
{
  return 1;
}

- (void)viewDidLoad
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIEditUserWordController;
  -[EditUserWordController viewDidLoad](&v9, sel_viewDidLoad);
  objc_msgSend((id)-[UIEditUserWordController navigationItem](self, "navigationItem"), "setLeftBarButtonItem:", (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__dismiss));
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    objc_msgSend((id)-[UIEditUserWordController table](self, "table"), "frame");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    objc_msgSend((id)-[UIEditUserWordController table](self, "table"), "setFrame:", v3, v5, 330.0, v7);
    objc_msgSend((id)-[UIEditUserWordController table](self, "table"), "layoutIfNeeded");
    objc_msgSend((id)-[UIEditUserWordController table](self, "table"), "contentSize");
    -[UIEditUserWordController setPreferredContentSize:](self, "setPreferredContentSize:");
    objc_msgSend((id)-[UIEditUserWordController table](self, "table"), "setFrame:", v4, v6, 0.0, v8);
  }
}

- (void)_dismiss
{
  if (-[UIEditUserWordController dismissCompletionHandler](self, "dismissCompletionHandler"))
  {
    objc_msgSend((id)-[UIEditUserWordController navigationController](self, "navigationController"), "dismissViewControllerAnimated:completion:", 1, -[UIEditUserWordController dismissCompletionHandler](self, "dismissCompletionHandler"));
    -[UIEditUserWordController setDismissCompletionHandler:](self, "setDismissCompletionHandler:", 0);
    -[UIEditUserWordController _setRotationDecider:](self, "_setRotationDecider:", 0);
  }
  else
  {
    objc_msgSend((id)-[UIEditUserWordController parentViewController](self, "parentViewController"), "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (UIWindow)_rotationDecider
{
  return self->_rotationDecider;
}

- (void)_setRotationDecider:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1432);
}

- (id)dismissCompletionHandler
{
  return self->_dismissCompletionHandler;
}

- (void)setDismissCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1440);
}

@end
