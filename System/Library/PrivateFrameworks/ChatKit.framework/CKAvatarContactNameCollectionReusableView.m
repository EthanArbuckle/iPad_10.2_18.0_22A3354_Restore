@implementation CKAvatarContactNameCollectionReusableView

+ (id)reuseIdentifier
{
  return CFSTR("CKAvatarContactNameCollectionReusableView_reuseIdentifier");
}

+ (id)supplementaryViewKind
{
  return CFSTR("CKAvatarContactNameCollectionReusableView_supplementaryViewKind");
}

- (CKAvatarContactNameCollectionReusableView)initWithFrame:(CGRect)a3
{
  CKAvatarContactNameCollectionReusableView *v3;
  id v4;
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
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CKAvatarContactNameCollectionReusableView;
  v3 = -[CKAvatarContactNameCollectionReusableView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA700]);
    v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[CKAvatarContactNameCollectionReusableView setTitleLabel:](v3, "setTitleLabel:", v5);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "avatarNameFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAvatarContactNameCollectionReusableView titleLabel](v3, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v7);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "theme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "primaryLabelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAvatarContactNameCollectionReusableView titleLabel](v3, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTextColor:", v11);

    -[CKAvatarContactNameCollectionReusableView titleLabel](v3, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextAlignment:", 1);

    -[CKAvatarContactNameCollectionReusableView setShouldDisplayTitle:](v3, "setShouldDisplayTitle:", 0);
    -[CKAvatarContactNameCollectionReusableView titleLabel](v3, "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAvatarContactNameCollectionReusableView addSubview:](v3, "addSubview:", v14);

  }
  return v3;
}

- (void)setStyle:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (self->_style != a3)
  {
    self->_style = a3;
    if ((unint64_t)(a3 - 2) >= 2)
    {
      if (a3 == 1)
      {
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "theme");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "entryFieldDarkEffectButtonColor");
      }
      else
      {
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "theme");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "primaryLabelColor");
      }
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAvatarContactNameCollectionReusableView titleLabel](self, "titleLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTextColor:", v5);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[CKAvatarContactNameCollectionReusableView titleLabel](self, "titleLabel");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTextColor:", v7);
    }

  }
}

- (void)configureWithEntity:(id)a3
{
  void *v3;
  int v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = objc_msgSend(v8, "isMe");
  if (v5)
  {
    CKFrameworkBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ME"), &stru_1E276D870, CFSTR("ChatKit"));
  }
  else
  {
    objc_msgSend(v8, "abbreviatedDisplayName");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAvatarContactNameCollectionReusableView titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  if (v5)
  {

    v6 = v3;
  }

  -[CKAvatarContactNameCollectionReusableView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKAvatarContactNameCollectionReusableView;
  -[CKAvatarContactNameCollectionReusableView layoutSubviews](&v12, sel_layoutSubviews);
  if (-[CKAvatarContactNameCollectionReusableView shouldDisplayTitle](self, "shouldDisplayTitle"))
  {
    -[CKAvatarContactNameCollectionReusableView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[CKAvatarContactNameCollectionReusableView titleLabel](self, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  }
}

- (void)setShouldDisplayTitle:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;

  if (self->_shouldDisplayTitle != a3)
  {
    self->_shouldDisplayTitle = a3;
    v4 = !a3;
    -[CKAvatarContactNameCollectionReusableView titleLabel](self, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", v4);

    -[CKAvatarContactNameCollectionReusableView setNeedsLayout](self, "setNeedsLayout");
    -[CKAvatarContactNameCollectionReusableView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)shouldDisplayTitle
{
  return self->_shouldDisplayTitle;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
