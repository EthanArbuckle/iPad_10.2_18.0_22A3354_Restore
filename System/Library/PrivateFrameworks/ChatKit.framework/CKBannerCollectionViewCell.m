@implementation CKBannerCollectionViewCell

+ (id)reuseIdentifier
{
  return CFSTR("CKBannerCollectionViewCell_reuseIdentifier");
}

- (CKBannerCollectionViewCell)initWithFrame:(CGRect)a3
{
  CKBannerCollectionViewCell *v3;
  UIImageView *v4;
  UIImageView *bannerView;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKBannerCollectionViewCell;
  v3 = -[CKBannerCollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0CEA658]);
    bannerView = v3->_bannerView;
    v3->_bannerView = v4;

    -[UIImageView setContentMode:](v3->_bannerView, "setContentMode:", 1);
    -[UIImageView setClipsToBounds:](v3->_bannerView, "setClipsToBounds:", 1);
    -[CKBannerCollectionViewCell contentView](v3, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v3->_bannerView);

  }
  return v3;
}

- (CKBannerCollectionViewCell)init
{
  return -[CKBannerCollectionViewCell initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CKBannerCollectionViewCell;
  -[CKBannerCollectionViewCell layoutSubviews](&v20, sel_layoutSubviews);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "businessBannerSize");
  v5 = v4;
  v7 = v6;
  -[CKBannerCollectionViewCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = fmin(v5, v9);
  v12 = fmin(v7, v11);

  -[CKBannerCollectionViewCell contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v15 = v14 * 0.5 - v10 * 0.5;
  -[CKBannerCollectionViewCell contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v18 = v17 * 0.5 - v12 * 0.5;
  -[CKBannerCollectionViewCell bannerView](self, "bannerView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v15, v18, v10, v12);

}

- (void)configureWithEntity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  -[CKBannerCollectionViewCell bannerView](self, "bannerView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultIMHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "brandWideLogoImageData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v8 = CFSTR("bannerImage");
  else
    v8 = 0;
  objc_msgSend(v13, "setAccessibilityIdentifier:", v8);
  if (v6 && !v7)
  {
    v9 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(v5, "brandWideLogoImageData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scale");
    objc_msgSend(v9, "imageWithData:scale:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setImage:", v12);
  }

}

- (UIImageView)bannerView
{
  return self->_bannerView;
}

- (void)setBannerView:(id)a3
{
  objc_storeStrong((id *)&self->_bannerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerView, 0);
}

@end
