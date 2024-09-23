@implementation CKAvatarShadowClippingCollectionReusableView

- (CKAvatarShadowClippingCollectionReusableView)initWithFrame:(CGRect)a3
{
  CKAvatarShadowClippingCollectionReusableView *v3;
  CKAvatarShadowClippingCollectionReusableView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKAvatarShadowClippingCollectionReusableView;
  v3 = -[CKAvatarShadowClippingCollectionReusableView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CKAvatarShadowClippingCollectionReusableView imageView](v3, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAvatarShadowClippingCollectionReusableView addSubview:](v4, "addSubview:", v5);

  }
  return v4;
}

+ (id)decorationViewKind
{
  return 0;
}

+ (CGSize)shadowSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
