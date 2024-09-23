@implementation CNContactListLimitedAccessTipCell

- (CNContactListLimitedAccessTipCell)initWithFrame:(CGRect)a3
{
  CNContactListLimitedAccessTipCell *v3;
  CNContactListLimitedAccessTipCell *v4;
  CNContactListLimitedAccessTipCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNContactListLimitedAccessTipCell;
  v3 = -[CNContactListLimitedAccessTipCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (void)updateWithAppName:(id)a3 isLimited:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  CNContactListLimitedAccessTipView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  uint64_t v19;
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
  void *v41;
  void *v42;
  id v43;
  _QWORD v44[5];

  v4 = a4;
  v44[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CNContactListLimitedAccessTipCell setContentConfiguration:](self, "setContentConfiguration:", 0);
  -[CNContactListLimitedAccessTipCell setAccessories:](self, "setAccessories:", MEMORY[0x1E0C9AA60]);
  -[CNContactListLimitedAccessTipCell limitedAccessTipView](self, "limitedAccessTipView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = -[CNContactListLimitedAccessTipView initWithAppName:isLimited:]([CNContactListLimitedAccessTipView alloc], "initWithAppName:isLimited:", v6, v4);
    -[CNContactListLimitedAccessTipCell setLimitedAccessTipView:](self, "setLimitedAccessTipView:", v8);

    -[CNContactListLimitedAccessTipCell limitedAccessTipView](self, "limitedAccessTipView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CNContactListLimitedAccessTipCell limitedAccessTipView](self, "limitedAccessTipView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", self);

  }
  -[CNContactListLimitedAccessTipCell limitedAccessTipView](self, "limitedAccessTipView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "superview");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v43 = v6;
    -[CNContactListLimitedAccessTipCell contentView](self, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListLimitedAccessTipCell limitedAccessTipView](self, "limitedAccessTipView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v14);

    -[CNContactListLimitedAccessTipCell contactListStyleApplier](self, "contactListStyleApplier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "usesInsetPlatterStyle");
    -[CNContactListLimitedAccessTipCell contentView](self, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if ((v16 & 1) != 0)
    {
      objc_msgSend(v17, "trailingAnchor");
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v17, "layoutMarginsGuide");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "trailingAnchor");
      v19 = objc_claimAutoreleasedReturnValue();

    }
    v31 = (void *)v19;

    v34 = (void *)MEMORY[0x1E0CB3718];
    -[CNContactListLimitedAccessTipCell limitedAccessTipView](self, "limitedAccessTipView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListLimitedAccessTipCell contentView](self, "contentView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "layoutMarginsGuide");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:constant:", v38, 7.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v37;
    -[CNContactListLimitedAccessTipCell limitedAccessTipView](self, "limitedAccessTipView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:constant:", v19, -7.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v44[1] = v33;
    -[CNContactListLimitedAccessTipCell limitedAccessTipView](self, "limitedAccessTipView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListLimitedAccessTipCell contentView](self, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v44[2] = v24;
    -[CNContactListLimitedAccessTipCell limitedAccessTipView](self, "limitedAccessTipView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListLimitedAccessTipCell contentView](self, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v44[3] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 4);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "activateConstraints:", v30);

    v6 = v43;
  }

}

- (void)limitedAccessTipViewDidTapDismiss:(id)a3
{
  id v4;

  -[CNContactListLimitedAccessTipCell delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "limitedAccessTipCellDidTapDismiss:", self);

}

- (CNContactListLimitedAccessTipCellDelegate)delegate
{
  return (CNContactListLimitedAccessTipCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNContactListStyleApplier)contactListStyleApplier
{
  return self->_contactListStyleApplier;
}

- (void)setContactListStyleApplier:(id)a3
{
  objc_storeStrong((id *)&self->_contactListStyleApplier, a3);
}

- (CNContactListLimitedAccessTipView)limitedAccessTipView
{
  return self->_limitedAccessTipView;
}

- (void)setLimitedAccessTipView:(id)a3
{
  objc_storeStrong((id *)&self->_limitedAccessTipView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_limitedAccessTipView, 0);
  objc_storeStrong((id *)&self->_contactListStyleApplier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
