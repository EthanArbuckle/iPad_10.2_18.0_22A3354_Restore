@implementation SUUIComposeReviewFormViewController

- (SUUIComposeReviewFormViewController)initWithReviewMetadata:(id)a3
{
  id v4;
  SUUIComposeReviewFormViewController *v5;
  uint64_t v6;
  SUUIReviewMetadata *review;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIComposeReviewFormViewController;
  v5 = -[SUViewController init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    review = v5->_review;
    v5->_review = (SUUIReviewMetadata *)v6;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[SUUIComposeReviewView setDelegate:](self->_composeView, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUUIComposeReviewFormViewController;
  -[SUViewController dealloc](&v3, sel_dealloc);
}

- (SUUIReviewMetadata)editedReviewMetadata
{
  return (SUUIReviewMetadata *)-[SUUIComposeReviewView copyReview](self->_composeView, "copyReview");
}

- (void)setRating:(float)a3
{
  -[SUUIComposeReviewView setRating:](self->_composeView, "setRating:");
}

- (void)loadView
{
  void *v3;
  _BOOL8 v4;
  SUUIComposeReviewView *v5;
  SUUIComposeReviewView *v6;
  SUUIComposeReviewView *composeView;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom") == 1;

  v5 = [SUUIComposeReviewView alloc];
  v6 = -[SUUIComposeReviewView initWithFrame:style:](v5, "initWithFrame:style:", v4, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  composeView = self->_composeView;
  self->_composeView = v6;

  -[SUUIComposeReviewView setAutoresizingMask:](self->_composeView, "setAutoresizingMask:", 18);
  -[SUUIComposeReviewView setDelegate:](self->_composeView, "setDelegate:", self);
  -[SUUIComposeReviewView setReview:](self->_composeView, "setReview:", self->_review);
  -[SUUIComposeReviewView reloadData](self->_composeView, "reloadData");
  -[SUUIComposeReviewFormViewController setView:](self, "setView:", self->_composeView);
  -[SUViewController navigationItem](self, "navigationItem");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x24BEC8CE0]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_2511FF0C8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithTitle:style:target:action:", v10, 0, self, sel__cancel);

  objc_msgSend(v16, "setLeftBarButtonItem:", v11);
  v12 = objc_alloc(MEMORY[0x24BEC8CE0]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SUBMIT"), &stru_2511FF0C8, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithTitle:style:target:action:", v14, 2, self, sel__submit);

  objc_msgSend(v16, "setRightBarButtonItem:", v15);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  -[SUViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setEnabled:", -[SUUIComposeReviewView isValid](self->_composeView, "isValid"));
  v7.receiver = self;
  v7.super_class = (Class)SUUIComposeReviewFormViewController;
  -[SUViewController viewWillAppear:](&v7, sel_viewWillAppear_, v3);

}

- (void)composeReviewViewValidityChanged:(id)a3
{
  void *v4;
  id v5;

  -[SUViewController navigationItem](self, "navigationItem", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightBarButtonItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setEnabled:", -[SUUIComposeReviewView isValid](self->_composeView, "isValid"));
}

- (void)_cancel
{
  SUUIComposeReviewFormDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "composeReviewFormDidCancel:", self);

  }
}

- (void)_submit
{
  SUUIComposeReviewFormDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "composeReviewFormDidSubmit:", self);

  }
}

- (SUUIComposeReviewFormDelegate)delegate
{
  return (SUUIComposeReviewFormDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_review, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_composeView, 0);
}

@end
