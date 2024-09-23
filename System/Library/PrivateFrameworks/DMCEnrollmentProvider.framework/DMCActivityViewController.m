@implementation DMCActivityViewController

- (DMCActivityViewController)initWithActivityText:(id)a3 showBottomView:(BOOL)a4
{
  id v7;
  DMCActivityViewController *v8;
  DMCActivityViewController *v9;
  UILabel *textLabel;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DMCActivityViewController;
  v8 = -[DMCActivityViewController init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_activityText, a3);
    v9->_showBottomView = a4;
    textLabel = v9->_textLabel;
    if (textLabel)
      -[UILabel setText:](textLabel, "setText:", v7);
  }

  return v9;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  DMCEnrollmentLinkLabelView *v12;
  void *v13;
  DMCEnrollmentLinkLabelView *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id location;
  objc_super v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v25.receiver = self;
  v25.super_class = (Class)DMCActivityViewController;
  -[DMCEnrollmentTemplateTableViewController viewWillAppear:](&v25, sel_viewWillAppear_, a3);
  if ((-[DMCActivityViewController isBeingPresented](self, "isBeingPresented") & 1) != 0
    || -[DMCActivityViewController isMovingToParentViewController](self, "isMovingToParentViewController"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 100);
    -[DMCActivityViewController setSpinnerView:](self, "setSpinnerView:", v4);

    -[DMCActivityViewController spinnerView](self, "spinnerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startAnimating");

    -[DMCActivityViewController activityText](self, "activityText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCActivityViewController textLabel](self, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);

    -[DMCActivityViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCActivityViewController spinnerView](self, "spinnerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v9);

    -[DMCActivityViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCActivityViewController textLabel](self, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v11);

    -[DMCActivityViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
    if (-[DMCActivityViewController showBottomView](self, "showBottomView"))
    {
      v12 = [DMCEnrollmentLinkLabelView alloc];
      DMCLocalizedString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[DMCEnrollmentLinkLabelView initWithIcon:message:linkMessage:linkHandler:](v12, "initWithIcon:message:linkMessage:linkHandler:", CFSTR("gear"), v13, 0, 0);

      -[DMCEnrollmentLinkLabelView setUserInteractionEnabled:](v14, "setUserInteractionEnabled:", 0);
      -[DMCEnrollmentTemplateTableViewController addBottomView:](self, "addBottomView:", v14);

    }
    objc_initWeak(&location, self);
    v26[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x24BDAC760];
    v20 = 3221225472;
    v21 = __44__DMCActivityViewController_viewWillAppear___block_invoke;
    v22 = &unk_24D52E2D0;
    objc_copyWeak(&v23, &location);
    v16 = (id)-[DMCActivityViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v15, &v19);

    -[DMCActivityViewController view](self, "view", v19, v20, v21, v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setNeedsDisplay");

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  -[DMCActivityViewController navigationItem](self, "navigationItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setHidesBackButton:", 1);

}

void __44__DMCActivityViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_textFont");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "textLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v1);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  CGFloat v15;
  void *v16;
  CGFloat v17;
  void *v18;
  void *v19;
  CGFloat v20;
  void *v21;
  CGFloat v22;
  void *v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v24.receiver = self;
  v24.super_class = (Class)DMCActivityViewController;
  -[DMCActivityViewController viewDidLayoutSubviews](&v24, sel_viewDidLayoutSubviews);
  -[DMCActivityViewController textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCActivityViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "sizeThatFits:", CGRectGetWidth(v25) + -30.0, 1.79769313e308);
  v6 = v5;
  v8 = v7;

  -[DMCActivityViewController spinnerView](self, "spinnerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;

  -[DMCActivityViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v15 = (CGRectGetWidth(v26) - v6) * 0.5;
  -[DMCActivityViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v17 = CGRectGetHeight(v27) * 0.5 - v8;
  -[DMCActivityViewController textLabel](self, "textLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v15, v17, v6, v8);

  -[DMCActivityViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  v20 = (CGRectGetWidth(v28) - v11) * 0.5;
  -[DMCActivityViewController textLabel](self, "textLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "frame");
  v22 = CGRectGetMinY(v29) - v13 + -15.0;
  -[DMCActivityViewController spinnerView](self, "spinnerView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFrame:", v20, v22, v11, v13);

}

- (UILabel)textLabel
{
  UILabel *textLabel;
  UILabel *v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;

  textLabel = self->_textLabel;
  if (!textLabel)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    v5 = self->_textLabel;
    self->_textLabel = v4;

    -[UILabel setLineBreakMode:](self->_textLabel, "setLineBreakMode:", 0);
    v6 = self->_textLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v6, "setTextColor:", v7);

    -[UILabel setNumberOfLines:](self->_textLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](self->_textLabel, "setTextAlignment:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_textLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
    textLabel = self->_textLabel;
  }
  return textLabel;
}

- (id)_textFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BDF77B0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)activityText
{
  return self->_activityText;
}

- (void)setActivityText:(id)a3
{
  objc_storeStrong((id *)&self->_activityText, a3);
}

- (BOOL)showBottomView
{
  return self->_showBottomView;
}

- (void)setShowBottomView:(BOOL)a3
{
  self->_showBottomView = a3;
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (UIActivityIndicatorView)spinnerView
{
  return self->_spinnerView;
}

- (void)setSpinnerView:(id)a3
{
  objc_storeStrong((id *)&self->_spinnerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_activityText, 0);
}

@end
