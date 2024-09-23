@implementation _UIDocumentPickerManagementViewControllerCell

- (_UIDocumentPickerManagementViewControllerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  _UIDocumentPickerManagementViewControllerCell *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UIDocumentPickerManagementViewControllerCell;
  v4 = -[_UIDocumentPickerManagementViewControllerCell initWithStyle:reuseIdentifier:](&v12, sel_initWithStyle_reuseIdentifier_, 3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDF6AE8]);
    -[_UIDocumentPickerManagementViewControllerCell setNewlyAddedView:](v4, "setNewlyAddedView:", v5);

    -[_UIDocumentPickerManagementViewControllerCell newlyAddedView](v4, "newlyAddedView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentMode:", 4);

    -[_UIDocumentPickerManagementViewControllerCell newlyAddedView](v4, "newlyAddedView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setClipsToBounds:", 1);

    -[_UIDocumentPickerManagementViewControllerCell contentView](v4, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v4->_newlyAddedView);

    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerManagementViewControllerCell contentView](v4, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v9);

  }
  return v4;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIDocumentPickerManagementViewControllerCell;
  -[_UIDocumentPickerManagementViewControllerCell prepareForReuse](&v4, sel_prepareForReuse);
  -[_UIDocumentPickerManagementViewControllerCell newlyAddedView](self, "newlyAddedView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", 0);

}

- (id)_dotImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerManagementViewControllerCell traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("UIImageNameIndicatorDot"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageWithRenderingMode:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setShowNewlyAdded:(BOOL)a3
{
  void *v4;
  id v5;

  if (a3)
  {
    -[_UIDocumentPickerManagementViewControllerCell _dotImage](self, "_dotImage");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerManagementViewControllerCell newlyAddedView](self, "newlyAddedView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setImage:", v5);

  }
  else
  {
    -[_UIDocumentPickerManagementViewControllerCell newlyAddedView](self, "newlyAddedView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", 0);
  }

}

- (BOOL)showNewlyAdded
{
  void *v2;
  void *v3;
  BOOL v4;

  -[_UIDocumentPickerManagementViewControllerCell newlyAddedView](self, "newlyAddedView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  objc_super v18;
  CGRect v19;

  v18.receiver = self;
  v18.super_class = (Class)_UIDocumentPickerManagementViewControllerCell;
  -[_UIDocumentPickerManagementViewControllerCell layoutSubviews](&v18, sel_layoutSubviews);
  -[_UIDocumentPickerManagementViewControllerCell _dotImage](self, "_dotImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerManagementViewControllerCell imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v19.origin.x = v6;
  v19.origin.y = v8;
  v19.size.width = v10;
  v19.size.height = v12;
  CGRectGetMaxX(v19);
  UIRoundToViewScale();
  v14 = v13;
  objc_msgSend(v3, "size");
  v16 = v15;
  -[_UIDocumentPickerManagementViewControllerCell newlyAddedView](self, "newlyAddedView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v14, v8, v16, v12);

}

- (UIImageView)newlyAddedView
{
  return self->_newlyAddedView;
}

- (void)setNewlyAddedView:(id)a3
{
  objc_storeStrong((id *)&self->_newlyAddedView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newlyAddedView, 0);
}

@end
