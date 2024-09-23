@implementation LUIUserAvatarViewWithCNAvatarView

- (LUIUserAvatarViewWithCNAvatarView)initWithFrame:(CGRect)a3
{
  LUIUserAvatarViewWithCNAvatarView *v3;
  LUIUserAvatarViewWithCNAvatarView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LUIUserAvatarViewWithCNAvatarView;
  v3 = -[LUIUserAvatarView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[LUIUserAvatarViewWithCNAvatarView _setup](v3, "_setup");
  return v4;
}

- (void)_setup
{
  UIImageView *v3;
  UIImageView *imageView;

  v3 = (UIImageView *)objc_alloc_init((Class)UIImageView);
  -[LUIUserAvatarViewWithCNAvatarView addSubview:](self, "addSubview:", v3);
  imageView = self->_imageView;
  self->_imageView = v3;

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LUIUserAvatarViewWithCNAvatarView;
  -[LUIUserAvatarView layoutSubviews](&v3, "layoutSubviews");
  -[LUIUserAvatarViewWithCNAvatarView bounds](self, "bounds");
  -[UIImageView setFrame:](self->_imageView, "setFrame:");
}

- (void)updateMonogram
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)LUIUserAvatarViewWithCNAvatarView;
  -[LUIUserAvatarView updateMonogram](&v19, "updateMonogram");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserAvatarView contacts](self, "contacts"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = objc_alloc((Class)CNAvatarImageRenderer);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CNAvatarImageRendererSettings defaultSettings](CNAvatarImageRendererSettings, "defaultSettings"));
    v7 = objc_msgSend(v5, "initWithSettings:", v6);

    -[LUIUserAvatarView monogramDiameter](self, "monogramDiameter");
    v9 = v8;
    -[LUIUserAvatarView monogramDiameter](self, "monogramDiameter");
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v12, "scale");
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:", objc_msgSend(v15, "userInterfaceLayoutDirection") == (id)1, 0, v9, v11, v14));

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserAvatarView contacts](self, "contacts"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "avatarImageForContacts:scope:", v17, v16));

    -[UIImageView setImage:](self->_imageView, "setImage:", v18);
  }
}

- (void)setImageViewAlpha:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LUIUserAvatarViewWithCNAvatarView;
  -[LUIUserAvatarView setImageViewAlpha:](&v5, "setImageViewAlpha:");
  -[UIImageView setAlpha:](self->_imageView, "setAlpha:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
