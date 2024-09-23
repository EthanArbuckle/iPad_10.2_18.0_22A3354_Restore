@implementation CNQuickContactAction

- (CNQuickContactAction)initWithContactAction:(id)a3
{
  id v3;
  CNQuickContactAction *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNQuickContactAction;
  v3 = a3;
  v4 = -[CNQuickAction init](&v6, sel_init);
  objc_msgSend(v3, "setDelegate:", v4, v6.receiver, v6.super_class);
  -[CNQuickContactAction setContactAction:](v4, "setContactAction:", v3);

  return v4;
}

- (void)performWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNQuickAction setPreviousStyle:](self, "setPreviousStyle:", v5);

  +[CNContactStyle defaultStyle](CNContactStyle, "defaultStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactStyle setCurrentStyle:](CNContactStyle, "setCurrentStyle:", v6);

  -[CNQuickContactAction setCompletionBlock:](self, "setCompletionBlock:", v4);
  -[CNQuickContactAction contactAction](self, "contactAction");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performActionWithSender:", self);

}

- (void)actionDidUpdate:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CNQuickContactAction delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNQuickContactAction delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contactActionDidUpdate:", self);

  }
}

- (void)action:(id)a3 presentViewController:(id)a4 sender:(id)a5
{
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a4;
  -[CNQuickContactAction delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    objc_msgSend(v9, "setModalPresentationStyle:", 5);
    -[CNQuickContactAction delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contactAction:presentViewController:", self, v9);

  }
}

- (void)action:(id)a3 dismissViewController:(id)a4 sender:(id)a5
{
  objc_msgSend(a4, "dismissViewControllerAnimated:completion:", 1, 0, a5);
}

- (void)actionDidFinish:(id)a3
{
  void *v4;
  void (**v5)(void);
  void *v6;
  id v7;

  -[CNQuickContactAction completionBlock](self, "completionBlock", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNQuickContactAction completionBlock](self, "completionBlock");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
  -[CNQuickAction manager](self, "manager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionPerformed:", self);

  -[CNQuickAction previousStyle](self, "previousStyle");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[CNContactStyle setCurrentStyle:](CNContactStyle, "setCurrentStyle:", v7);

}

- (void)actionWasCanceled:(id)a3
{
  void *v4;
  void (**v5)(void);
  id v6;

  -[CNQuickContactAction completionBlock](self, "completionBlock", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNQuickContactAction completionBlock](self, "completionBlock");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
  -[CNQuickAction previousStyle](self, "previousStyle");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[CNContactStyle setCurrentStyle:](CNContactStyle, "setCurrentStyle:", v6);

}

- (id)contactViewCache
{
  return 0;
}

- (CNContactAction)contactAction
{
  return self->_contactAction;
}

- (void)setContactAction:(id)a3
{
  objc_storeStrong((id *)&self->_contactAction, a3);
}

- (CNQuickContactActionDelegate)delegate
{
  return (CNQuickContactActionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contactAction, 0);
}

@end
