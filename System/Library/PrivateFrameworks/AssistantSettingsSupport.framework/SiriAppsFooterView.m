@implementation SiriAppsFooterView

- (SiriAppsFooterView)initWithSpecifier:(id)a3
{
  id v4;
  SiriAppsFooterView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SiriAppsFooterView;
  v5 = -[PSFooterHyperlinkView initWithSpecifier:](&v16, sel_initWithSpecifier_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("INTENTS_LEARN_LINK"), &stru_24D33E0B0, CFSTR("Assistant_Intents"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75A68]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSFooterHyperlinkView setText:](v5, "setText:", v8);

    -[PSFooterHyperlinkView text](v5, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "rangeOfString:", v7);
    -[PSFooterHyperlinkView setLinkRange:](v5, "setLinkRange:", v10, v11);

    objc_msgSend(v4, "target");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "conformsToProtocol:", &unk_254DDE628);

    if (v13)
    {
      objc_msgSend(v4, "target");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriAppsFooterView setDelegate:](v5, "setDelegate:", v14);

    }
    -[PSFooterHyperlinkView setTarget:](v5, "setTarget:", v5);
    -[PSFooterHyperlinkView setAction:](v5, "setAction:", sel_didTapLearnMore_);

  }
  return v5;
}

- (void)didTapLearnMore:(id)a3
{
  id v4;

  -[SiriAppsFooterView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewDidTapLearnMore:", self);

}

- (SiriAppsFooterViewDelegate)delegate
{
  return (SiriAppsFooterViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
