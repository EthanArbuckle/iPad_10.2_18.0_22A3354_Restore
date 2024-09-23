@implementation HULockupTableViewCell

- (HULockupTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HULockupTableViewCell *v4;
  HULockupTableViewCell *v5;
  id v6;
  void *v7;
  uint64_t v8;
  HULockupView *lockupView;
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
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)HULockupTableViewCell;
  v4 = -[HULockupTableViewCell initWithStyle:reuseIdentifier:](&v33, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = objc_alloc(-[HULockupTableViewCell lockupViewClass](v4, "lockupViewClass"));
    -[HULockupTableViewCell contentView](v5, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v8 = objc_msgSend(v6, "initWithFrame:");
    lockupView = v5->_lockupView;
    v5->_lockupView = (HULockupView *)v8;

    -[HULockupView setInternalViewResizingDelegate:](v5->_lockupView, "setInternalViewResizingDelegate:", v5);
    -[HULockupView setTranslatesAutoresizingMaskIntoConstraints:](v5->_lockupView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HULockupTableViewCell contentView](v5, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v5->_lockupView);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupView leadingAnchor](v5->_lockupView, "leadingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupTableViewCell contentView](v5, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layoutMarginsGuide");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v16);

    -[HULockupView trailingAnchor](v5->_lockupView, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupTableViewCell contentView](v5, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layoutMarginsGuide");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v21);

    -[HULockupView topAnchor](v5->_lockupView, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupTableViewCell contentView](v5, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "layoutMarginsGuide");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v26);

    -[HULockupView bottomAnchor](v5->_lockupView, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockupTableViewCell contentView](v5, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "layoutMarginsGuide");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v31);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v11);
  }
  return v5;
}

- (HFItem)item
{
  void *v2;
  void *v3;

  -[HULockupTableViewCell lockupView](self, "lockupView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFItem *)v3;
}

- (void)setItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HULockupTableViewCell lockupView](self, "lockupView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setItem:", v4);

}

- (void)updateUIWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HULockupTableViewCell lockupView](self, "lockupView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateUIWithAnimation:", v3);

}

- (void)didUpdateRequiredHeightForLockupView:(id)a3
{
  id v4;

  -[HULockupTableViewCell resizingDelegate](self, "resizingDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didUpdateRequiredHeightForCell:", self);

}

- (Class)lockupViewClass
{
  return (Class)objc_opt_class();
}

- (HULockupView)lockupView
{
  return self->_lockupView;
}

- (HUResizableCellDelegate)resizingDelegate
{
  return (HUResizableCellDelegate *)objc_loadWeakRetained((id *)&self->_resizingDelegate);
}

- (void)setResizingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_resizingDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_resizingDelegate);
  objc_storeStrong((id *)&self->_lockupView, 0);
}

@end
