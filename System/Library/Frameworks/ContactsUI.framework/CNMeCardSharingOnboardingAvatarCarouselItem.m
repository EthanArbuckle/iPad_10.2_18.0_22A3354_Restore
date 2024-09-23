@implementation CNMeCardSharingOnboardingAvatarCarouselItem

- (CNMeCardSharingOnboardingAvatarCarouselItem)initWithImageInsetPercentage:(double)a3 imageProvider:(id)a4
{
  id v6;
  CNMeCardSharingOnboardingAvatarCarouselItem *v7;
  CNMeCardSharingOnboardingAvatarCarouselItem *v8;
  uint64_t v9;
  id imageProvider;
  CNMeCardSharingOnboardingAvatarCarouselItem *v11;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNMeCardSharingOnboardingAvatarCarouselItem;
  v7 = -[CNMeCardSharingOnboardingAvatarCarouselItem init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_imageInsetPercentage = a3;
    v9 = objc_msgSend(v6, "copy");
    imageProvider = v8->_imageProvider;
    v8->_imageProvider = (id)v9;

    v11 = v8;
  }

  return v8;
}

- (CNMeCardSharingOnboardingAvatarCarouselItem)initWithTitle:(id)a3
{
  id v4;
  CNMeCardSharingOnboardingAvatarCarouselItem *v5;
  uint64_t v6;
  NSString *title;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNMeCardSharingOnboardingAvatarCarouselItem;
  v5 = -[CNMeCardSharingOnboardingAvatarCarouselItem init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    title = v5->_title;
    v5->_title = (NSString *)v6;

  }
  return v5;
}

- (UIImage)cachedImage
{
  return self->_cachedImage;
}

- (void)setCachedImage:(id)a3
{
  objc_storeStrong((id *)&self->_cachedImage, a3);
}

- (id)imageProvider
{
  return self->_imageProvider;
}

- (unint64_t)imageType
{
  return self->_imageType;
}

- (void)setImageType:(unint64_t)a3
{
  self->_imageType = a3;
}

- (NSString)title
{
  return self->_title;
}

- (double)imageInsetPercentage
{
  return self->_imageInsetPercentage;
}

- (BOOL)shouldShowVariants
{
  return self->_shouldShowVariants;
}

- (void)setShouldShowVariants:(BOOL)a3
{
  self->_shouldShowVariants = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_cachedImage, 0);
}

@end
