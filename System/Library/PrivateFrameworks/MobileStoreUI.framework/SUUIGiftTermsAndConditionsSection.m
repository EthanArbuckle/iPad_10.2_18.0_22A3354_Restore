@implementation SUUIGiftTermsAndConditionsSection

- (void)_termsAction:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x24BDBCF48], "termsAndConditionsURL", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  SUUIMetricsOpenURL(v3);

}

- (id)_headerView
{
  UIView *headerView;
  UIView *v4;
  UIView *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  SUUILinkButton *v10;
  uint64_t v11;
  SUUILinkButton *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;

  headerView = self->_headerView;
  if (!headerView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    v5 = self->_headerView;
    self->_headerView = v4;

    -[UIView setFrame:](self->_headerView, "setFrame:", 0.0, 0.0, 60.0, 45.0);
    -[UIView bounds](self->_headerView, "bounds");
    v7 = v6;
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceLayoutDirection");

    v10 = [SUUILinkButton alloc];
    if (v9)
      v11 = 5;
    else
      v11 = 1;
    v12 = -[SUUILinkButton initWithArrowStyle:](v10, "initWithArrowStyle:", v11);
    -[SUUILinkButton addTarget:action:forControlEvents:](v12, "addTarget:action:forControlEvents:", self, sel__termsAction_, 64);
    -[SUUILinkButton setAutoresizingMask:](v12, "setAutoresizingMask:", 5);
    -[SUUIGiftTableViewSection giftConfiguration](self, "giftConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "clientContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (SUUIUserInterfaceIdiom(v14) == 1)
    {
      if (v14)
      {
        v15 = CFSTR("GIFTING_TERMS_LINK_IPAD");
LABEL_10:
        objc_msgSend(v14, "localizedStringForKey:inTable:", v15, CFSTR("Gifting"));
        v16 = objc_claimAutoreleasedReturnValue();
LABEL_14:
        v18 = (void *)v16;
        -[SUUILinkButton setTitle:forState:](v12, "setTitle:forState:", v16, 0);
        -[SUUILinkButton titleLabel](v12, "titleLabel");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 12.0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setFont:", v20);

        objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUUILinkButton setTitleColor:forState:](v12, "setTitleColor:forState:", v21, 0);

        objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUUILinkButton setTitleColor:forState:](v12, "setTitleColor:forState:", v22, 1);

        -[SUUILinkButton sizeToFit](v12, "sizeToFit");
        -[SUUILinkButton frame](v12, "frame");
        -[SUUILinkButton setFrame:](v12, "setFrame:", floor((v7 - v23) * 0.5), 25.0);
        -[UIView addSubview:](self->_headerView, "addSubview:", v12);

        headerView = self->_headerView;
        return headerView;
      }
      v17 = CFSTR("GIFTING_TERMS_LINK_IPAD");
    }
    else
    {
      if (v14)
      {
        v15 = CFSTR("GIFTING_TERMS_LINK_IPHONE");
        goto LABEL_10;
      }
      v17 = CFSTR("GIFTING_TERMS_LINK_IPHONE");
    }
    +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", v17, 0, CFSTR("Gifting"));
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  return headerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
