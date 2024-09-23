@implementation ICViewOnlyPopoverViewController

- (ICViewOnlyPopoverViewController)initWithDelegate:(id)a3
{
  id v4;
  ICViewOnlyPopoverViewController *v5;
  ICViewOnlyPopoverViewController *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ICViewOnlyPopoverViewController;
  v5 = -[ICViewOnlyPopoverViewController initWithNibName:bundle:](&v23, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
  {
    -[ICViewOnlyPopoverViewController setPopoverDelegate:](v5, "setPopoverDelegate:", v4);
    v7 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    -[ICViewOnlyPopoverViewController setLabel:](v6, "setLabel:", v7);

    -[ICViewOnlyPopoverViewController label](v6, "label");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextAlignment:", 1);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("This document has been modified using a newer OS version. Upgrade to the latest OS to modify it on this device."), &stru_1EA7E9860, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICViewOnlyPopoverViewController label](v6, "label");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v10);

    -[ICViewOnlyPopoverViewController setAccessibilityLabel:](v6, "setAccessibilityLabel:", v10);
    -[ICViewOnlyPopoverViewController label](v6, "label");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNumberOfLines:", 0);

    -[ICViewOnlyPopoverViewController label](v6, "label");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAdjustsFontForContentSizeCategory:", 1);

    v14 = *MEMORY[0x1E0DC48D0];
    -[ICViewOnlyPopoverViewController label](v6, "label");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setMaximumContentSizeCategory:", v14);

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "ic_fontWithSingleLineA");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICViewOnlyPopoverViewController label](v6, "label");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFont:", v17);

    objc_msgSend(MEMORY[0x1E0DC3658], "darkGrayColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICViewOnlyPopoverViewController label](v6, "label");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTextColor:", v19);

    -[ICViewOnlyPopoverViewController label](v6, "label");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAdjustsFontSizeToFitWidth:", 1);

  }
  return v6;
}

+ (id)viewOnlyPopoverViewController:(id)a3 sourceView:(id)a4
{
  id v5;
  id v6;
  ICViewOnlyPopoverViewController *v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGRect v19;
  CGRect v20;

  v5 = a4;
  v6 = a3;
  v7 = -[ICViewOnlyPopoverViewController initWithDelegate:]([ICViewOnlyPopoverViewController alloc], "initWithDelegate:", v6);

  -[ICViewOnlyPopoverViewController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 7);
  -[ICViewOnlyPopoverViewController popoverPresentationController](v7, "popoverPresentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", v7);
  objc_msgSend(v8, "setPermittedArrowDirections:", 2);
  objc_msgSend(v8, "setSourceView:", v5);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v9);

  objc_msgSend(v5, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v19.origin.x = v11;
  v19.origin.y = v13;
  v19.size.width = v15;
  v19.size.height = v17;
  v20 = CGRectInset(v19, 0.0, -4.0);
  objc_msgSend(v8, "setSourceRect:", v20.origin.x, v20.origin.y, v20.size.width, v20.size.height);

  return v7;
}

- (CGSize)preferredContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[ICViewOnlyPopoverViewController label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sizeThatFits:", 400.0, 1.79769313e308);
  v4 = v3;
  v6 = v5;

  v7 = v4 + 24.0;
  v8 = v6 + 20.0;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICViewOnlyPopoverViewController;
  -[ICViewOnlyPopoverViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[ICViewOnlyPopoverViewController label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ICViewOnlyPopoverViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v4);

  objc_msgSend(v4, "ic_addAnchorsToFillSuperviewWithLeadingPadding:trailingPadding:verticalPadding:usesSafeAreaLayoutGuideHorizontally:usesSafeAreaLayoutGuideVertically:", 1, 1, 12.0, 12.0, 10.0);
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v3;

  -[ICViewOnlyPopoverViewController popoverDelegate](self, "popoverDelegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "popoverDidDismiss");

}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (ICViewOnlyPopoverDelegate)popoverDelegate
{
  return (ICViewOnlyPopoverDelegate *)objc_loadWeakRetained((id *)&self->_popoverDelegate);
}

- (void)setPopoverDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_popoverDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_popoverDelegate);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
