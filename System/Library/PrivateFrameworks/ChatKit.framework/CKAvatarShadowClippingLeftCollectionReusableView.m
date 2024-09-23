@implementation CKAvatarShadowClippingLeftCollectionReusableView

+ (id)decorationViewKind
{
  return CFSTR("CKAvatarShadowClippingLeftCollectionReusableView_decorationViewKind");
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

    objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("Messages-Chrome-LeftMask"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_imageView, "setImage:", v6);

    -[UIImageView sizeToFit](self->_imageView, "sizeToFit");
    imageView = self->_imageView;
  }
  return imageView;
}

+ (CGSize)shadowSize
{
  double v2;
  double v3;
  CGSize result;

  if (shadowSize_onceToken != -1)
    dispatch_once(&shadowSize_onceToken, &__block_literal_global_88);
  v2 = *(double *)&shadowSize_shadowSize_0;
  v3 = *(double *)&shadowSize_shadowSize_1;
  result.height = v3;
  result.width = v2;
  return result;
}

void __62__CKAvatarShadowClippingLeftCollectionReusableView_shadowSize__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("Messages-Chrome-LeftMask"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "size");
  shadowSize_shadowSize_0 = v0;
  shadowSize_shadowSize_1 = v1;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
