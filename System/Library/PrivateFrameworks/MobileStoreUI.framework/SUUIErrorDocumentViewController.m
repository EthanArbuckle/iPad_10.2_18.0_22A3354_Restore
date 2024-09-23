@implementation SUUIErrorDocumentViewController

- (SUUIErrorDocumentViewController)initWithBackgroundColor:(id)a3 clientContext:(id)a4
{
  id v6;
  id v7;
  SUUIErrorDocumentViewController *v8;
  unint64_t v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SUUIErrorDocumentViewController;
  v8 = -[SUUIErrorDocumentViewController init](&v11, sel_init);
  if (v8)
  {
    v9 = SUUIColorSchemeStyleForColor(v6);
    if (v9 <= 3)
      v8->_contentUnavailableStyle = qword_241EFC540[v9];
    objc_storeStrong((id *)&v8->_clientContext, a4);
  }

  return v8;
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  SUUIClientContext *clientContext;
  void *v7;
  void *v8;
  id v9;

  SUUIErrorDocumentTitle(self->_clientContext);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x24BEBDBB0]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:title:style:", v9, self->_contentUnavailableStyle, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[SUUIErrorDocumentViewController retryActionBlock](self, "retryActionBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "setMessage:", &stru_2511FF0C8);
    clientContext = self->_clientContext;
    if (clientContext)
      -[SUUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", CFSTR("NETWORK_ERROR_BUTTON_RETRY"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("NETWORK_ERROR_BUTTON_RETRY"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setButtonTitle:", v7);

    -[SUUIErrorDocumentViewController retryActionBlock](self, "retryActionBlock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setButtonAction:", v8);

  }
  -[SUUIErrorDocumentViewController setView:](self, "setView:", v4);

}

- (id)retryActionBlock
{
  return self->_retryActionBlock;
}

- (void)setRetryActionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1056);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_retryActionBlock, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
