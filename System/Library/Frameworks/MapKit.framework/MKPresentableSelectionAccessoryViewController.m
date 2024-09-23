@implementation MKPresentableSelectionAccessoryViewController

- (MKPresentableSelectionAccessoryViewController)initWithSelectionAccessoryView:(id)a3
{
  id v5;
  MKPresentableSelectionAccessoryViewController *v6;
  MKPresentableSelectionAccessoryViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKPresentableSelectionAccessoryViewController;
  v6 = -[MKPresentableSelectionAccessoryViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accessoryView, a3);
    -[MKViewSwitchingSelectionAccessoryView setParentViewController:](v7->_accessoryView, "setParentViewController:", v7);
  }

  return v7;
}

- (void)loadView
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
  objc_super v25;
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)MKPresentableSelectionAccessoryViewController;
  -[MKPresentableSelectionAccessoryViewController loadView](&v25, sel_loadView);
  -[MKPresentableSelectionAccessoryViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemGroupedBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPresentableSelectionAccessoryViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[MKViewSwitchingSelectionAccessoryView setTranslatesAutoresizingMaskIntoConstraints:](self->_accessoryView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MKPresentableSelectionAccessoryViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", self->_accessoryView);

  v17 = (void *)MEMORY[0x1E0CB3718];
  -[MKViewSwitchingSelectionAccessoryView topAnchor](self->_accessoryView, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPresentableSelectionAccessoryViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v21;
  -[MKViewSwitchingSelectionAccessoryView leadingAnchor](self->_accessoryView, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPresentableSelectionAccessoryViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v7;
  -[MKPresentableSelectionAccessoryViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKViewSwitchingSelectionAccessoryView trailingAnchor](self->_accessoryView, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v11;
  -[MKPresentableSelectionAccessoryViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKViewSwitchingSelectionAccessoryView bottomAnchor](self->_accessoryView, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "activateConstraints:", v16);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryView, 0);
}

@end
