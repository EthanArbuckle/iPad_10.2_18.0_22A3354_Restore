@implementation SUUIDeveloperInfoViewController

- (SUUIDeveloperInfoViewController)initWithDeveloperInfo:(id)a3
{
  id v4;
  SUUIDeveloperInfoViewController *v5;
  uint64_t v6;
  SUUIDeveloperInfo *developerInfo;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIDeveloperInfoViewController;
  v5 = -[SUUIDeveloperInfoViewController init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    developerInfo = v5->_developerInfo;
    v5->_developerInfo = (SUUIDeveloperInfo *)v6;

  }
  return v5;
}

- (void)loadView
{
  uint64_t v3;
  uint64_t v4;
  id *p_scrollView;
  UIScrollView *scrollView;
  SUUIDeveloperInfoView *v7;
  SUUIDeveloperInfoView *infoView;
  SUUIDeveloperInfoView *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  SUUIDeveloperInfoView *v21;
  void *v22;
  SUUIDeveloperInfoView *v23;
  id v24;

  -[SUUIViewController clientContext](self, "clientContext");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v3 = SUUIUserInterfaceIdiom(v24);
  v4 = v3;
  if (self->_infoView)
  {
    p_scrollView = (id *)&self->_scrollView;
    scrollView = self->_scrollView;
    if (scrollView)
      goto LABEL_13;
    if (v3 != 1)
      goto LABEL_9;
  }
  else
  {
    v7 = -[SUUIDeveloperInfoView initWithDeveloperInfo:clientContext:]([SUUIDeveloperInfoView alloc], "initWithDeveloperInfo:clientContext:", self->_developerInfo, v24);
    infoView = self->_infoView;
    self->_infoView = v7;

    v9 = self->_infoView;
    if (v4 != 1)
    {
      -[SUUIDeveloperInfoView setAutoresizingMask:](v9, "setAutoresizingMask:", 18);
      p_scrollView = (id *)&self->_scrollView;
      scrollView = self->_scrollView;
      if (scrollView)
        goto LABEL_13;
LABEL_9:
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bounds");
      v10 = v12;

      goto LABEL_10;
    }
    -[SUUIDeveloperInfoView setAutoresizingMask:](v9, "setAutoresizingMask:", 5);
    p_scrollView = (id *)&self->_scrollView;
    scrollView = self->_scrollView;
    if (scrollView)
      goto LABEL_13;
  }
  v10 = 370.0;
LABEL_10:
  v13 = *MEMORY[0x24BDBF090];
  v14 = *(double *)(MEMORY[0x24BDBF090] + 8);
  -[SUUIDeveloperInfoView sizeThatFits:](self->_infoView, "sizeThatFits:", v10, 1.79769313e308);
  v16 = v15;
  v17 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD918]), "initWithFrame:", v13, v14, v10, v15);
  v18 = *p_scrollView;
  *p_scrollView = (id)v17;

  objc_msgSend(*p_scrollView, "setContentSize:", v10, v16);
  v19 = *p_scrollView;
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.921568627, 1.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setBackgroundColor:", v20);

  if (v4 == 1)
    objc_msgSend(*p_scrollView, "setContentInset:", 140.0, 0.0, 0.0, 0.0);
  v21 = self->_infoView;
  objc_msgSend(*p_scrollView, "backgroundColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIDeveloperInfoView setBackgroundColor:](v21, "setBackgroundColor:", v22);

  v23 = self->_infoView;
  objc_msgSend(*p_scrollView, "bounds");
  -[SUUIDeveloperInfoView setFrame:](v23, "setFrame:");
  objc_msgSend(*p_scrollView, "addSubview:", self->_infoView);
  scrollView = (UIScrollView *)*p_scrollView;
LABEL_13:
  -[SUUIDeveloperInfoViewController setView:](self, "setView:", scrollView);
  -[SUUIViewController showDefaultNavigationItems](self, "showDefaultNavigationItems");

}

- (SUUIDeveloperInfo)developerInfo
{
  return self->_developerInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_infoView, 0);
  objc_storeStrong((id *)&self->_developerInfo, 0);
}

@end
