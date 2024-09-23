@implementation CKDetailsAddMemberLargeTextCell

+ (double)preferredHeight
{
  return *MEMORY[0x1E0CEBC10];
}

- (CKDetailsAddMemberLargeTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CKDetailsAddMemberLargeTextCell *v4;
  CKDetailsAddMemberLargeTextCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKDetailsAddMemberLargeTextCell;
  v4 = -[CKDetailsAddMemberCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CKDetailsAddMemberLargeTextCell _initLabel](v4, "_initLabel");
    -[CKDetailsAddMemberLargeTextCell _initConstraints](v5, "_initConstraints");
  }
  return v5;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[CKDetailsAddMemberCell addLabel](self, "addLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;

  v8 = v7 + 20.0;
  v9 = width;
  result.height = v8;
  result.width = v9;
  return result;
}

- (void)_initConstraints
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
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  -[CKDetailsAddMemberCell addLabel](self, "addLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v14 = (void *)MEMORY[0x1E0CB3718];
  -[CKDetailsAddMemberCell addLabel](self, "addLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsAddMemberLargeTextCell contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "layoutMarginsGuide");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v16;
  -[CKDetailsAddMemberCell addLabel](self, "addLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "trailingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsAddMemberLargeTextCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutMarginsGuide");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v8;
  -[CKDetailsAddMemberCell addLabel](self, "addLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsAddMemberLargeTextCell topAnchor](self, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 10.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "activateConstraints:", v13);

}

- (void)_initLabel
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  v4 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[CKDetailsAddMemberCell addLabel](self, "addLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0DC1178];
  v12[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithString:attributes:", v6, v7);

  -[CKDetailsAddMemberCell addLabel](self, "addLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setOverallWritingDirectionFollowsLayoutDirection:", 1);

  -[CKDetailsAddMemberCell addLabel](self, "addLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAttributedText:", v8);

}

- (UILayoutGuide)leadingGuide
{
  return self->_leadingGuide;
}

- (void)setLeadingGuide:(id)a3
{
  objc_storeStrong((id *)&self->_leadingGuide, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leadingGuide, 0);
}

@end
