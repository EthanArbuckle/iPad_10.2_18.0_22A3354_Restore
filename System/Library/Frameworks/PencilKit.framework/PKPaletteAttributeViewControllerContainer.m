@implementation PKPaletteAttributeViewControllerContainer

- (PKPaletteAttributeViewControllerContainer)initWithContentViewController:(id)a3
{
  id v5;
  PKPaletteAttributeViewControllerContainer *v6;
  PKPaletteAttributeViewControllerContainer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaletteAttributeViewControllerContainer;
  v6 = -[PKPaletteAttributeViewControllerContainer initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_contentViewController, a3);

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
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
  objc_super v37;
  _QWORD v38[6];

  v38[4] = *MEMORY[0x1E0C80C00];
  v37.receiver = self;
  v37.super_class = (Class)PKPaletteAttributeViewControllerContainer;
  -[PKPaletteAttributeViewControllerContainer viewDidLoad](&v37, sel_viewDidLoad);
  -[PKPaletteAttributeViewControllerContainer contentViewController](self, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PKPaletteAttributeViewControllerContainer contentViewController](self, "contentViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteAttributeViewControllerContainer addChildViewController:](self, "addChildViewController:", v4);

    -[PKPaletteAttributeViewControllerContainer view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteAttributeViewControllerContainer contentViewController](self, "contentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v7);

    -[PKPaletteAttributeViewControllerContainer contentViewController](self, "contentViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v25 = (void *)MEMORY[0x1E0CB3718];
    -[PKPaletteAttributeViewControllerContainer contentViewController](self, "contentViewController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "view");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteAttributeViewControllerContainer view](self, "view");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v31;
    -[PKPaletteAttributeViewControllerContainer contentViewController](self, "contentViewController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteAttributeViewControllerContainer view](self, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v26);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v24;
    -[PKPaletteAttributeViewControllerContainer contentViewController](self, "contentViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteAttributeViewControllerContainer view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2] = v11;
    -[PKPaletteAttributeViewControllerContainer contentViewController](self, "contentViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteAttributeViewControllerContainer view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v38[3] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "activateConstraints:", v18);

    -[PKPaletteAttributeViewControllerContainer contentViewController](self, "contentViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "didMoveToParentViewController:", self);

  }
}

- (CGSize)preferredContentSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGSize result;

  -[PKPaletteAttributeViewControllerContainer contentViewController](self, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PKPaletteAttributeViewControllerContainer contentViewController](self, "contentViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSize");
    v6 = v5;
    v8 = v7;

    v9 = v6;
    v10 = v8;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PKPaletteAttributeViewControllerContainer;
    -[PKPaletteAttributeViewControllerContainer preferredContentSize](&v11, sel_preferredContentSize);
  }
  result.height = v10;
  result.width = v9;
  return result;
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end
