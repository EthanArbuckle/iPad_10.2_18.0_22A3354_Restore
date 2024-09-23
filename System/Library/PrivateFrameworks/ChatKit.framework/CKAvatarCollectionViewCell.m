@implementation CKAvatarCollectionViewCell

+ (id)reuseIdentifier
{
  return CFSTR("CKAvatarCollectionViewCell_reuseIdentifier");
}

- (void)prepareForReuse
{
  void *v3;
  char v4;
  void *v5;
  objc_super v6;

  -[CKAvatarCollectionViewCell avatarView](self, "avatarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CKAvatarCollectionViewCell avatarView](self, "avatarView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowStaleRendering:", 0);

  }
  v6.receiver = self;
  v6.super_class = (Class)CKAvatarCollectionViewCell;
  -[CKAvatarCollectionViewCell prepareForReuse](&v6, sel_prepareForReuse);
}

- (CKAvatarCollectionViewCell)initWithFrame:(CGRect)a3
{
  CKAvatarCollectionViewCell *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CKAvatarView *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKAvatarCollectionViewCell;
  v3 = -[CKAvatarCollectionViewCell initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "theme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "messageAcknowledgmentPickerBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAvatarCollectionViewCell contentView](v3, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v6);

    v8 = objc_alloc_init(CKAvatarView);
    -[CKAvatarCollectionViewCell setAvatarView:](v3, "setAvatarView:", v8);

    -[CKAvatarCollectionViewCell contentView](v3, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAvatarCollectionViewCell avatarView](v3, "avatarView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v10);

  }
  return v3;
}

- (void)configureWithEntity:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CKAvatarCollectionViewCell avatarView](self, "avatarView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cnContactWithKeys:", MEMORY[0x1E0C9AA60]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "avatarViewAllowsStaleRendering"))
    {
      v7 = objc_msgSend(v4, "isDisplayingContent");

      if (v7)
        objc_msgSend(v4, "setAllowStaleRendering:", 1);
    }
    else
    {

    }
    objc_msgSend(v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_ck_setContextToken:", v8);

    objc_msgSend(v4, "setContact:", v5);
  }
  else if (_IMWillLog())
  {
    _IMAlwaysLog();
  }

}

- (void)layoutSubviews
{
  void *v3;
  CGFloat v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  objc_super v17;
  CGRect v18;

  v17.receiver = self;
  v17.super_class = (Class)CKAvatarCollectionViewCell;
  -[CKAvatarCollectionViewCell layoutSubviews](&v17, sel_layoutSubviews);
  -[CKAvatarCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v4 = CGRectGetWidth(v18) * 0.5;
  -[CKAvatarCollectionViewCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCornerRadius:", v4);

  -[CKAvatarCollectionViewCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[CKAvatarCollectionViewCell avatarView](self, "avatarView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

}

- (CKAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarView, 0);
}

@end
