@implementation CKAvatarShadowClippingRightCollectionReusableView

+ (id)decorationViewKind
{
  return CFSTR("CKAvatarShadowClippingRightCollectionReusableView_decorationViewKind");
}

+ (CGSize)shadowSize
{
  double v2;
  double v3;
  CGSize result;

  if (shadowSize_onceToken_0[0] != -1)
    dispatch_once(shadowSize_onceToken_0, &__block_literal_global_285);
  v2 = *(double *)&shadowSize_shadowSize_0_0;
  v3 = *(double *)&shadowSize_shadowSize_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __63__CKAvatarShadowClippingRightCollectionReusableView_shadowSize__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("Messages-Chrome-RightMask"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "size");
  shadowSize_shadowSize_0_0 = v0;
  shadowSize_shadowSize_1_0 = v1;

}

- (id)imageView
{
  UIImageView *imageView;
  UIImageView *v4;
  UIImageView *v5;
  void *v6;

  imageView = self->_imageView;
  if (!imageView)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0CEA658]);
    v5 = self->_imageView;
    self->_imageView = v4;

    objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("Messages-Chrome-RightMask"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_imageView, "setImage:", v6);

    -[UIImageView sizeToFit](self->_imageView, "sizeToFit");
    imageView = self->_imageView;
  }
  return imageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
