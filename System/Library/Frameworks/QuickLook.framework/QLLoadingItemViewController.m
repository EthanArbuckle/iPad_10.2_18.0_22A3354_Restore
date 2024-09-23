@implementation QLLoadingItemViewController

- (BOOL)canEnterFullScreen
{
  return 0;
}

- (BOOL)canSwipeToDismiss
{
  return 0;
}

- (BOOL)canPinchToDismiss
{
  return 0;
}

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  void (**v6)(id, _QWORD);
  UIActivityIndicatorView *v7;
  UIActivityIndicatorView *spinner;
  void *v9;
  void *v10;
  UILabel *v11;
  UILabel *loadingLabel;
  UILabel *v13;
  void *v14;
  UILabel *v15;
  void *v16;
  UILabel *v17;
  void *v18;
  UILabel *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, _QWORD))a5;
  v7 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
  spinner = self->_spinner;
  self->_spinner = v7;

  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityIndicatorView setColor:](self->_spinner, "setColor:", v9);

  -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_spinner, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[QLLoadingItemViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", self->_spinner);

  -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
  v11 = (UILabel *)objc_opt_new();
  loadingLabel = self->_loadingLabel;
  self->_loadingLabel = v11;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_loadingLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v13 = self->_loadingLabel;
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 13.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v13, "setFont:", v14);

  -[UILabel setTextAlignment:](self->_loadingLabel, "setTextAlignment:", 1);
  v15 = self->_loadingLabel;
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](v15, "setBackgroundColor:", v16);

  v17 = self->_loadingLabel;
  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v17, "setTextColor:", v18);

  v19 = self->_loadingLabel;
  v20 = objc_alloc(MEMORY[0x24BDD1688]);
  v42 = *MEMORY[0x24BEBB378];
  v43[0] = &unk_24C7496A8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithString:attributes:", &stru_24C72A1F8, v21);
  -[UILabel setAttributedText:](v19, "setAttributedText:", v22);

  -[QLLoadingItemViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addSubview:", self->_loadingLabel);

  -[UILabel centerXAnchor](self->_loadingLabel, "centerXAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLLoadingItemViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "centerXAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setActive:", 1);

  -[UILabel heightAnchor](self->_loadingLabel, "heightAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToConstant:", 25.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setActive:", 1);

  -[UILabel bottomAnchor](self->_loadingLabel, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLLoadingItemViewController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "centerYAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:constant:", v32, 8.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setActive:", 1);

  -[UIActivityIndicatorView centerXAnchor](self->_spinner, "centerXAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLLoadingItemViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "centerXAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setActive:", 1);

  -[UIActivityIndicatorView bottomAnchor](self->_spinner, "bottomAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLLoadingItemViewController view](self, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "centerYAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:constant:", v40, -18.5);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setActive:", 1);

  -[QLLoadingItemViewController _updateLoadingLabel](self, "_updateLoadingLabel");
  if (v6)
    v6[2](v6, 0);

}

- (void)previewBecameFullScreen:(BOOL)a3 animated:(BOOL)a4
{
  void *v5;
  id v6;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 1.0, 1.0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 1.0, 1.0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_loadingLabel, "setTextColor:", v6);
  -[UIActivityIndicatorView setColor:](self->_spinner, "setColor:", v5);

}

- (void)_updateLoadingLabel
{
  void *v3;
  int v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;

  -[QLLoadingItemViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[QLItemViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadingTextForPreviewItemViewController:", self);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (!v7 || (v4 = objc_msgSend(v7, "isEqualToString:", &stru_24C72A1F8), v5 = v7, v4))
  {
    QLLocalizedString();
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v6;
  }
  v8 = v5;
  -[UILabel setText:](self->_loadingLabel, "setText:", v5);

}

- (void)setDelegate:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)QLLoadingItemViewController;
  -[QLItemViewController setDelegate:](&v4, sel_setDelegate_, a3);
  -[QLLoadingItemViewController _updateLoadingLabel](self, "_updateLoadingLabel");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_loadingLabel, 0);
}

@end
