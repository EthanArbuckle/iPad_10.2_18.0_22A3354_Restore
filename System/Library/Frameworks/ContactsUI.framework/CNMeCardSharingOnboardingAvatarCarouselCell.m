@implementation CNMeCardSharingOnboardingAvatarCarouselCell

- (CNMeCardSharingOnboardingAvatarCarouselCell)initWithFrame:(CGRect)a3
{
  CNMeCardSharingOnboardingAvatarCarouselCell *v3;
  id v4;
  void *v5;
  uint64_t v6;
  UIImageView *imageView;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  UILabel *label;
  void *v15;
  void *v16;
  void *v17;
  CNMeCardSharingOnboardingAvatarCarouselCell *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CNMeCardSharingOnboardingAvatarCarouselCell;
  v3 = -[CNMeCardSharingOnboardingAvatarCarouselCell initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3890]);
    -[CNMeCardSharingOnboardingAvatarCarouselCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v6 = objc_msgSend(v4, "initWithFrame:");
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v6;

    objc_msgSend(MEMORY[0x1E0DC3658], "_secondarySystemBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMeCardSharingOnboardingAvatarCarouselCell contentView](v3, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v8);

    -[CNMeCardSharingOnboardingAvatarCarouselCell contentView](v3, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v3->_imageView);

    v11 = objc_alloc(MEMORY[0x1E0DC3990]);
    -[CNMeCardSharingOnboardingAvatarCarouselCell contentView](v3, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v13 = objc_msgSend(v11, "initWithFrame:");
    label = v3->_label;
    v3->_label = (UILabel *)v13;

    -[UILabel setNumberOfLines:](v3->_label, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v3->_label, "setTextAlignment:", 1);
    +[CNUIColorRepository contactsApplicationTintColor](CNUIColorRepository, "contactsApplicationTintColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_label, "setTextColor:", v15);

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B60]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_label, "setFont:", v16);

    -[CNMeCardSharingOnboardingAvatarCarouselCell contentView](v3, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v3->_label);

    v18 = v3;
  }

  return v3;
}

- (void)setImage:(id)a3
{
  -[UIImageView setImage:](self->_imageView, "setImage:", a3);
}

- (UIImage)image
{
  return -[UIImageView image](self->_imageView, "image");
}

- (void)setTitle:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[UILabel text](self->_label, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    v5 = (void *)objc_msgSend(v6, "copy");
    -[UILabel setText:](self->_label, "setText:", v5);

    -[UILabel setHidden:](self->_label, "setHidden:", (*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))());
  }

}

- (NSString)title
{
  return -[UILabel text](self->_label, "text");
}

- (void)setImageInsetPercentage:(double)a3
{
  if (self->_imageInsetPercentage != a3)
  {
    self->_imageInsetPercentage = a3;
    -[CNMeCardSharingOnboardingAvatarCarouselCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  void *v10;
  objc_super v11;
  CGRect v12;
  CGRect v13;

  v11.receiver = self;
  v11.super_class = (Class)CNMeCardSharingOnboardingAvatarCarouselCell;
  -[CNMeCardSharingOnboardingAvatarCarouselCell layoutSubviews](&v11, sel_layoutSubviews);
  -[CNMeCardSharingOnboardingAvatarCarouselCell bounds](self, "bounds");
  v4 = floor(v3 * 0.5);
  -[CNMeCardSharingOnboardingAvatarCarouselCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCornerRadius:", v4);

  -[CNMeCardSharingOnboardingAvatarCarouselCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8 * self->_imageInsetPercentage;

  -[CNMeCardSharingOnboardingAvatarCarouselCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v13 = CGRectInset(v12, v9, v9);
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v13.origin.x, v13.origin.y, v13.size.width, v13.size.height);

  -[UIImageView frame](self->_imageView, "frame");
  -[UILabel setFrame:](self->_label, "setFrame:");
}

- (NSUUID)displaySessionUUID
{
  return self->_displaySessionUUID;
}

- (void)setDisplaySessionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_displaySessionUUID, a3);
}

- (double)imageInsetPercentage
{
  return self->_imageInsetPercentage;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_displaySessionUUID, 0);
}

+ (id)cellIdentifier
{
  return CFSTR("CNMeCardSharingOnboardingAvatarCarouselCell");
}

@end
