@implementation CKDetailsAddMemberCell

+ (Class)cellClass
{
  void *v2;
  id v3;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "isAccessibilityPreferredContentSizeCategory");
  v3 = (id)objc_opt_class();

  return (Class)v3;
}

+ (id)reuseIdentifier
{
  return CFSTR("CKDetailsAddMemberCell_reuseIdentifier");
}

+ (double)preferredHeight
{
  return 0.0;
}

- (CKDetailsAddMemberCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CKDetailsAddMemberCell *v4;
  id v5;
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
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CKDetailsAddMemberCell;
  v4 = -[CKDetailsCell initWithStyle:reuseIdentifier:](&v24, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CEA700]);
    v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[CKDetailsAddMemberCell setAddLabel:](v4, "setAddLabel:", v6);

    -[CKDetailsAddMemberCell addLabel](v4, "addLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNumberOfLines:", 0);

    -[CKDetailsAddMemberCell addLabel](v4, "addLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CKFrameworkBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ADD_CONTACT"), &stru_1E276D870, CFSTR("ChatKit"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v10);

    -[CKDetailsAddMemberCell addLabel](v4, "addLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addContactFont");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v13);

    -[CKDetailsAddMemberCell addLabel](v4, "addLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "theme");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "detailsTextColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTextColor:", v17);

    -[CKDetailsAddMemberCell addLabel](v4, "addLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sizeToFit");

    -[CKDetailsAddMemberCell contentView](v4, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsAddMemberCell addLabel](v4, "addLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v20);

    -[CKDetailsAddMemberCell contentView](v4, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBackgroundColor:", 0);

    -[CKDetailsCell bottomSeperator](v4, "bottomSeperator");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setHidden:", 1);

  }
  return v4;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[CKDetailsAddMemberCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:");
  -[CKDetailsAddMemberCell addLabel](self, "addLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v3);

  -[CKDetailsAddMemberCell addLabel](self, "addLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", v3);

}

- (UILabel)addLabel
{
  return self->_addLabel;
}

- (void)setAddLabel:(id)a3
{
  objc_storeStrong((id *)&self->_addLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addLabel, 0);
}

@end
