@implementation CNContactListDuplicatesBannerCell

- (CNContactListDuplicatesBannerCell)initWithFrame:(CGRect)a3
{
  CNContactListDuplicatesBannerCell *v3;
  CNContactListDuplicatesBannerCell *v4;
  CNContactListDuplicatesBannerCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNContactListDuplicatesBannerCell;
  v3 = -[CNContactListDuplicatesBannerCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_state = 0;
    v3->_duplicatesCount = 0;
    v5 = v3;
  }

  return v4;
}

- (void)updateWithState:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (self->_state != a3)
  {
    self->_state = a3;
    if (a3 == 2)
    {
      -[CNContactListDuplicatesBannerCell updateText:](self, "updateText:", CFSTR("DUPLICATES_RESOLVED"));
      v4 = objc_alloc_init(MEMORY[0x1E0DC3548]);
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTintColor:", v7);

      v8 = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactListDuplicatesBannerCell setAccessories:](self, "setAccessories:", v5);
    }
    else
    {
      if (a3 != 1)
      {
        -[CNContactListDuplicatesBannerCell updateWithDuplicatesFoundBannerWithCount:](self, "updateWithDuplicatesFoundBannerWithCount:", self->_duplicatesCount);
        return;
      }
      -[CNContactListDuplicatesBannerCell updateText:](self, "updateText:", CFSTR("DUPLICATES_MERGING"));
      v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", v4, 1);
      objc_msgSend(v4, "startAnimating");
      v9[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactListDuplicatesBannerCell setAccessories:](self, "setAccessories:", v6);

    }
  }
}

- (void)updateWithDuplicatesFoundBannerWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  CNContactListDuplicatesBannerView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
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
  void *v41;
  void *v42;
  _QWORD v43[6];

  v43[4] = *MEMORY[0x1E0C80C00];
  -[CNContactListDuplicatesBannerCell setContentConfiguration:](self, "setContentConfiguration:", 0);
  -[CNContactListDuplicatesBannerCell setAccessories:](self, "setAccessories:", MEMORY[0x1E0C9AA60]);
  -[CNContactListDuplicatesBannerCell duplicatesBannerView](self, "duplicatesBannerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CNContactListDuplicatesBannerCell duplicatesBannerView](self, "duplicatesBannerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDuplicatesCount:", a3);
  }
  else
  {
    v7 = -[CNContactListDuplicatesBannerView initWithDuplicatesCount:]([CNContactListDuplicatesBannerView alloc], "initWithDuplicatesCount:", a3);
    -[CNContactListDuplicatesBannerCell setDuplicatesBannerView:](self, "setDuplicatesBannerView:", v7);

    -[CNContactListDuplicatesBannerCell duplicatesBannerView](self, "duplicatesBannerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CNContactListDuplicatesBannerCell duplicatesBannerView](self, "duplicatesBannerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", self);
  }

  -[CNContactListDuplicatesBannerCell duplicatesBannerView](self, "duplicatesBannerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "superview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    -[CNContactListDuplicatesBannerCell contentView](self, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListDuplicatesBannerCell duplicatesBannerView](self, "duplicatesBannerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v12);

    -[CNContactListDuplicatesBannerCell contactListStyleApplier](self, "contactListStyleApplier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "usesInsetPlatterStyle");
    -[CNContactListDuplicatesBannerCell contentView](self, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if ((v14 & 1) != 0)
    {
      objc_msgSend(v15, "trailingAnchor");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v15, "layoutMarginsGuide");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "trailingAnchor");
      v17 = objc_claimAutoreleasedReturnValue();

    }
    v29 = (void *)v17;

    v33 = (void *)MEMORY[0x1E0CB3718];
    -[CNContactListDuplicatesBannerCell duplicatesBannerView](self, "duplicatesBannerView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "leadingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListDuplicatesBannerCell contentView](self, "contentView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "layoutMarginsGuide");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v38);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v37;
    -[CNContactListDuplicatesBannerCell duplicatesBannerView](self, "duplicatesBannerView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v17);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v34;
    -[CNContactListDuplicatesBannerCell duplicatesBannerView](self, "duplicatesBannerView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListDuplicatesBannerCell contentView](self, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "layoutMarginsGuide");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v43[2] = v21;
    -[CNContactListDuplicatesBannerCell duplicatesBannerView](self, "duplicatesBannerView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListDuplicatesBannerCell contentView](self, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "layoutMarginsGuide");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v43[3] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "activateConstraints:", v28);

  }
}

- (void)removeBannerView
{
  id v2;

  -[CNContactListDuplicatesBannerCell duplicatesBannerView](self, "duplicatesBannerView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

}

- (void)updateWithCount:(int64_t)a3
{
  self->_duplicatesCount = a3;
  if (a3 <= 0)
  {
    -[CNContactListDuplicatesBannerCell updateWithState:](self, "updateWithState:", 2);
  }
  else
  {
    self->_state = 0;
    -[CNContactListDuplicatesBannerCell updateWithDuplicatesFoundBannerWithCount:](self, "updateWithDuplicatesFoundBannerWithCount:", self->_duplicatesCount);
  }
}

- (void)updateText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CNContactListDuplicatesBannerCell removeBannerView](self, "removeBannerView");
  -[CNContactListDuplicatesBannerCell defaultContentConfiguration](self, "defaultContentConfiguration");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  CNContactsUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, &stru_1E20507A8, CFSTR("Localized"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setText:", v6);
  -[CNContactListDuplicatesBannerCell setContentConfiguration:](self, "setContentConfiguration:", v7);

}

- (void)duplicatesBannerViewDidTapDismiss:(id)a3
{
  id v4;

  -[CNContactListDuplicatesBannerCell delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "duplicatesBannerCellDidTapDismiss:", self);

}

- (void)duplicatesBannerViewDidTapViewDuplicates:(id)a3
{
  id v4;

  -[CNContactListDuplicatesBannerCell delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "duplicatesBannerCellDidTapViewDuplicates:", self);

}

- (CNContactListDuplicatesBannerCellDelegate)delegate
{
  return (CNContactListDuplicatesBannerCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (int64_t)duplicatesCount
{
  return self->_duplicatesCount;
}

- (void)setDuplicatesCount:(int64_t)a3
{
  self->_duplicatesCount = a3;
}

- (CNContactListDuplicatesBannerView)duplicatesBannerView
{
  return self->_duplicatesBannerView;
}

- (void)setDuplicatesBannerView:(id)a3
{
  objc_storeStrong((id *)&self->_duplicatesBannerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duplicatesBannerView, 0);
  objc_storeStrong((id *)&self->_contactListStyleApplier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
