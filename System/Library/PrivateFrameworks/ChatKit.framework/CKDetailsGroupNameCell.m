@implementation CKDetailsGroupNameCell

- (CKDetailsGroupNameCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CKDetailsGroupNameCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKDetailsGroupNameCell;
  v4 = -[CKDetailsCell initWithStyle:reuseIdentifier:](&v6, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
    CKIsRunningInMacCatalyst();
  return v4;
}

- (id)_ckSymbolImageNamed:(id)a3 preferredContentSizeCategory:(id)a4 preferredFontTextStyle:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = (void *)MEMORY[0x1E0CEAB40];
  v8 = a5;
  v9 = a3;
  objc_msgSend(v7, "traitCollectionWithPreferredContentSizeCategory:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:compatibleWithTraitCollection:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "pointSize");
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CKDetailsGroupNameCell groupNameView](self, "groupNameView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)CKDetailsGroupNameCell;
  -[CKDetailsGroupNameCell dealloc](&v4, sel_dealloc);
}

- (void)setGroupNameView:(id)a3
{
  id v5;
  id v6;
  void *v7;
  CKDetailsAddGroupNameView **p_groupNameView;
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
  _QWORD v32[5];

  v32[4] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[CKDetailsGroupNameCell groupNameView](self, "groupNameView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
  {
    -[CKDetailsGroupNameCell groupNameView](self, "groupNameView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperview");

    p_groupNameView = &self->_groupNameView;
    objc_storeStrong((id *)&self->_groupNameView, a3);
    -[CKDetailsGroupNameCell contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", self->_groupNameView);

    if (!CKIsRunningInMacCatalyst())
    {
      -[CKDetailsAddGroupNameView setTranslatesAutoresizingMaskIntoConstraints:](*p_groupNameView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v22 = (void *)MEMORY[0x1E0CB3718];
      -[CKDetailsAddGroupNameView topAnchor](*p_groupNameView, "topAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsGroupNameCell contentView](self, "contentView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "layoutMarginsGuide");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "topAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "constraintEqualToAnchor:", v28);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v27;
      -[CKDetailsAddGroupNameView leftAnchor](*p_groupNameView, "leftAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsGroupNameCell contentView](self, "contentView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "layoutMarginsGuide");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "leftAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintEqualToAnchor:", v23);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v32[1] = v21;
      -[CKDetailsAddGroupNameView bottomAnchor](*p_groupNameView, "bottomAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsGroupNameCell contentView](self, "contentView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "layoutMarginsGuide");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bottomAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintEqualToAnchor:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v32[2] = v12;
      -[CKDetailsAddGroupNameView rightAnchor](*p_groupNameView, "rightAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsGroupNameCell contentView](self, "contentView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "layoutMarginsGuide");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "rightAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v32[3] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "activateConstraints:", v18);

    }
  }

}

+ (id)reuseIdentifier
{
  return CFSTR("Details_GroupName_Identifier");
}

+ (BOOL)shouldHighlight
{
  return 0;
}

- (CKDetailsAddGroupNameView)groupNameView
{
  return self->_groupNameView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupNameView, 0);
}

@end
