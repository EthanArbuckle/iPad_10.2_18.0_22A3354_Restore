@implementation _UIDocumentPickerOverviewViewControllerCell

- (_UIDocumentPickerOverviewViewControllerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  _UIDocumentPickerOverviewViewControllerCell *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  objc_super v52;
  _QWORD v53[4];
  _QWORD v54[3];
  _QWORD v55[5];

  v55[3] = *MEMORY[0x24BDAC8D0];
  v52.receiver = self;
  v52.super_class = (Class)_UIDocumentPickerOverviewViewControllerCell;
  v4 = -[_UIDocumentPickerOverviewViewControllerCell initWithStyle:reuseIdentifier:](&v52, sel_initWithStyle_reuseIdentifier_, 1, a4);
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDF6AE8]);
    -[_UIDocumentPickerOverviewViewControllerCell setIconView:](v4, "setIconView:", v5);

    -[_UIDocumentPickerOverviewViewControllerCell iconView](v4, "iconView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentMode:", 4);

    -[_UIDocumentPickerOverviewViewControllerCell iconView](v4, "iconView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setClipsToBounds:", 1);

    -[_UIDocumentPickerOverviewViewControllerCell iconView](v4, "iconView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[_UIDocumentPickerOverviewViewControllerCell contentView](v4, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v4->_iconView);

    v10 = objc_alloc_init(MEMORY[0x24BDF6AE8]);
    -[_UIDocumentPickerOverviewViewControllerCell setNewlyAddedView:](v4, "setNewlyAddedView:", v10);

    -[_UIDocumentPickerOverviewViewControllerCell newlyAddedView](v4, "newlyAddedView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setContentMode:", 4);

    -[_UIDocumentPickerOverviewViewControllerCell newlyAddedView](v4, "newlyAddedView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setClipsToBounds:", 1);

    -[_UIDocumentPickerOverviewViewControllerCell newlyAddedView](v4, "newlyAddedView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[_UIDocumentPickerOverviewViewControllerCell contentView](v4, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v4->_newlyAddedView);

    -[_UIDocumentPickerOverviewViewControllerCell textLabel](v4, "textLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v16 = (void *)MEMORY[0x24BDD1628];
    v54[0] = CFSTR("_newlyAddedView");
    v55[0] = v4->_newlyAddedView;
    v54[1] = CFSTR("label");
    -[_UIDocumentPickerOverviewViewControllerCell textLabel](v4, "textLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v55[1] = v17;
    v54[2] = CFSTR("_iconView");
    v55[2] = v4->_iconView;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v55, v54, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[_newlyAddedView]-(dotDistance)-[label]-(menuLabelDistance)-[_iconView(menuIconSize)]-(menuIconInset)-|"), 1024, &unk_24E449BB8, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "activateConstraints:", v19);

    v43 = (void *)MEMORY[0x24BDD1628];
    -[_UIDocumentPickerOverviewViewControllerCell textLabel](v4, "textLabel");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "leadingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerOverviewViewControllerCell contentView](v4, "contentView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "leadingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:constant:", v48, 15.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v47;
    -[_UIDocumentPickerOverviewViewControllerCell iconView](v4, "iconView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "heightAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToConstant:", 32.0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v53[1] = v44;
    -[_UIDocumentPickerOverviewViewControllerCell iconView](v4, "iconView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "heightAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerOverviewViewControllerCell newlyAddedView](v4, "newlyAddedView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "heightAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v53[2] = v22;
    -[_UIDocumentPickerOverviewViewControllerCell iconView](v4, "iconView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "centerYAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerOverviewViewControllerCell contentView](v4, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "centerYAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v53[3] = v27;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "activateConstraints:", v28);

    if (-[_UIDocumentPickerOverviewViewControllerCell _shouldReverseLayoutDirection](v4, "_shouldReverseLayoutDirection"))
    {
      -[_UIDocumentPickerOverviewViewControllerCell textLabel](v4, "textLabel");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setTextAlignment:", 2);

    }
    -[_UIDocumentPickerOverviewViewControllerCell textLabel](v4, "textLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "lastBaselineAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerOverviewViewControllerCell contentView](v4, "contentView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:constant:", v33, 28.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setActive:", 1);

    -[_UIDocumentPickerOverviewViewControllerCell textLabel](v4, "textLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "lastBaselineAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerOverviewViewControllerCell contentView](v4, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "bottomAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:constant:", v38, -16.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setActive:", 1);

  }
  return v4;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDocumentPickerOverviewViewControllerCell;
  -[_UIDocumentPickerOverviewViewControllerCell prepareForReuse](&v5, sel_prepareForReuse);
  -[_UIDocumentPickerOverviewViewControllerCell iconView](self, "iconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", 0);

  -[_UIDocumentPickerOverviewViewControllerCell newlyAddedView](self, "newlyAddedView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", 0);

}

- (id)_dotImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerOverviewViewControllerCell traitCollection](self, "traitCollection");
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
    -[_UIDocumentPickerOverviewViewControllerCell _dotImage](self, "_dotImage");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerOverviewViewControllerCell newlyAddedView](self, "newlyAddedView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setImage:", v5);

  }
  else
  {
    -[_UIDocumentPickerOverviewViewControllerCell newlyAddedView](self, "newlyAddedView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", 0);
  }

}

- (BOOL)showNewlyAdded
{
  void *v2;
  void *v3;
  BOOL v4;

  -[_UIDocumentPickerOverviewViewControllerCell newlyAddedView](self, "newlyAddedView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
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
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end
