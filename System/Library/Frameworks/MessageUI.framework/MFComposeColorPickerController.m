@implementation MFComposeColorPickerController

- (MFComposeColorPickerController)initWithSelectedColor:(id)a3 shouldShowTitleBar:(BOOL)a4
{
  id v7;
  MFComposeColorPickerController *v8;
  MFComposeColorPickerController *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MFComposeColorPickerController;
  v8 = -[MFComposeColorPickerController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_selectedColor, a3);
    v9->_shouldShowTitleBar = a4;
  }

  return v9;
}

- (void)loadView
{
  void *v3;
  void *v4;
  PKColorPicker *v5;
  PKColorPicker *colorPicker;
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
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  objc_super v41;
  _QWORD v42[6];

  v42[4] = *MEMORY[0x1E0C80C00];
  v41.receiver = self;
  v41.super_class = (Class)MFComposeColorPickerController;
  -[MFComposeColorPickerController loadView](&v41, sel_loadView);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeColorPickerController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (PKColorPicker *)objc_alloc_init(MEMORY[0x1E0CD1148]);
  colorPicker = self->_colorPicker;
  self->_colorPicker = v5;

  -[PKColorPicker setDelegate:](self->_colorPicker, "setDelegate:", self);
  -[PKColorPicker setColorUserInterfaceStyle:](self->_colorPicker, "setColorUserInterfaceStyle:", 1);
  -[MFComposeColorPickerController selectedColor](self, "selectedColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKColorPicker setSelectedColor:](self->_colorPicker, "setSelectedColor:", v7);

  -[PKColorPicker setEdgesForExtendedLayout:](self->_colorPicker, "setEdgesForExtendedLayout:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "mailStyleSheetBackground");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKColorPicker view](self->_colorPicker, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v8);

  -[PKColorPicker view](self->_colorPicker, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[MFComposeColorPickerController addChildViewController:](self, "addChildViewController:", self->_colorPicker);
  -[MFComposeColorPickerController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKColorPicker view](self->_colorPicker, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v12);

  -[PKColorPicker didMoveToParentViewController:](self->_colorPicker, "didMoveToParentViewController:", self);
  if (-[MFComposeColorPickerController shouldShowTitleBar](self, "shouldShowTitleBar"))
  {
    v13 = (void *)MEMORY[0x1E0CB3718];
    -[PKColorPicker view](self->_colorPicker, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "topAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeColorPickerController view](self, "view");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "layoutMarginsGuide");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "topAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v34;
    -[PKColorPicker view](self->_colorPicker, "view");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "bottomAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeColorPickerController view](self, "view");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "layoutMarginsGuide");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v29;
    -[PKColorPicker view](self->_colorPicker, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeColorPickerController view](self, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "layoutMarginsGuide");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:constant:", -5.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v42[2] = v15;
    -[PKColorPicker view](self->_colorPicker, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeColorPickerController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layoutMarginsGuide");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:constant:", v20, 5.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v42[3] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "activateConstraints:", v22);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("FORMAT_COLOR_PALETTE_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeColorPickerController setTitle:](self, "setTitle:", v24);

    -[PKColorPicker view](self->_colorPicker, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeColorPickerController view](self, "view");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "mf_pinToView:usingLayoutMargins:");
  }

}

- (void)viewDidLoad
{
  MFComposeActionCardTitleView *v3;
  MFComposeActionCardTitleView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MFComposeColorPickerController;
  -[MFComposeColorPickerController viewDidLoad](&v12, sel_viewDidLoad);
  if (-[MFComposeColorPickerController shouldShowTitleBar](self, "shouldShowTitleBar"))
  {
    v3 = [MFComposeActionCardTitleView alloc];
    v4 = -[MFComposeActionCardTitleView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FORMAT_COLOR_PALETTE_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeActionCardTitleView titleLabel](v4, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);

    -[MFComposeActionCardTitleView closeButton](v4, "closeButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addTarget:action:forEvents:", self, sel_closeColorPicker_, 64);

    -[MFComposeColorPickerController navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitleView:", v4);

    -[MFComposeColorPickerController navigationItem](self, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setManualScrollEdgeAppearanceProgress:", 0.0);

    -[MFComposeColorPickerController navigationItem](self, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setManualScrollEdgeAppearanceEnabled:", 1);

  }
}

- (void)closeColorPicker:(id)a3
{
  id v4;

  -[MFComposeColorPickerController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorPickerDidCancel:", self);

}

- (void)colorPickerDidChangeSelectedColor:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MFComposeColorPickerController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorPicker:didChangeSelectedColor:", self, v5);

}

- (MFComposeColorPickerControllerDelegate)delegate
{
  return (MFComposeColorPickerControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIColor)selectedColor
{
  return self->_selectedColor;
}

- (void)setSelectedColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectedColor, a3);
}

- (PKColorPicker)colorPicker
{
  return self->_colorPicker;
}

- (void)setColorPicker:(id)a3
{
  objc_storeStrong((id *)&self->_colorPicker, a3);
}

- (BOOL)shouldShowTitleBar
{
  return self->_shouldShowTitleBar;
}

- (void)setShouldShowTitleBar:(BOOL)a3
{
  self->_shouldShowTitleBar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorPicker, 0);
  objc_storeStrong((id *)&self->_selectedColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
