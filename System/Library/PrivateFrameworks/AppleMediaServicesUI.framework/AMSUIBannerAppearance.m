@implementation AMSUIBannerAppearance

- (AMSUIBannerAppearance)init
{
  AMSUIBannerAppearance *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMSUIBannerAppearance;
  result = -[AMSUIAppearance init](&v3, sel_init);
  if (result)
  {
    result->_iconAnimationPlayCount = -90;
    result->_primaryImageRenderingMode = 0;
  }
  return result;
}

- (AMSUIBannerAppearance)initWithDictionary:(id)a3
{
  id v4;
  AMSUIBannerAppearance *v5;
  uint64_t v6;
  UIColor *accessoryButtonColor;
  uint64_t v8;
  UIFont *accessoryButtonFont;
  uint64_t v10;
  UIColor *accessoryButtonBackgroundColor;
  uint64_t v12;
  UIColor *accessorySecondaryButtonBackgroundColor;
  uint64_t v14;
  UIColor *accessorySecondaryButtonColor;
  uint64_t v16;
  UIFont *accessorySecondaryButtonFont;
  uint64_t v18;
  UIColor *backgroundColor;
  uint64_t v20;
  UIImage *backgroundImage;
  uint64_t v22;
  UIImageSymbolConfiguration *imageSymbolConfiguration;
  uint64_t v24;
  UIColor *imageTintColor;
  uint64_t v26;
  UIFont *messageFont;
  uint64_t v28;
  UIColor *messageTextColor;
  uint64_t v30;
  UIColor *separatorColor;
  uint64_t v32;
  UIFont *titleFont;
  uint64_t v34;
  UIColor *titleTextColor;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)AMSUIBannerAppearance;
  v5 = -[AMSUIAppearance initWithDictionary:](&v37, sel_initWithDictionary_, v4);
  if (v5)
  {
    +[AMSUIAppearance _accessoryButtonColorWithDictionary:](AMSUIAppearance, "_accessoryButtonColorWithDictionary:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    accessoryButtonColor = v5->_accessoryButtonColor;
    v5->_accessoryButtonColor = (UIColor *)v6;

    +[AMSUIAppearance _accessoryButtonFontWithDictionary:](AMSUIAppearance, "_accessoryButtonFontWithDictionary:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    accessoryButtonFont = v5->_accessoryButtonFont;
    v5->_accessoryButtonFont = (UIFont *)v8;

    +[AMSUIAppearance _accessoryButtonBackgroundColorWithDictionary:](AMSUIAppearance, "_accessoryButtonBackgroundColorWithDictionary:", v4);
    v10 = objc_claimAutoreleasedReturnValue();
    accessoryButtonBackgroundColor = v5->_accessoryButtonBackgroundColor;
    v5->_accessoryButtonBackgroundColor = (UIColor *)v10;

    +[AMSUIAppearance _accessorySecondaryButtonBackgroundColorWithDictionary:](AMSUIAppearance, "_accessorySecondaryButtonBackgroundColorWithDictionary:", v4);
    v12 = objc_claimAutoreleasedReturnValue();
    accessorySecondaryButtonBackgroundColor = v5->_accessorySecondaryButtonBackgroundColor;
    v5->_accessorySecondaryButtonBackgroundColor = (UIColor *)v12;

    +[AMSUIAppearance _accessorySecondaryButtonColorWithDictionary:](AMSUIAppearance, "_accessorySecondaryButtonColorWithDictionary:", v4);
    v14 = objc_claimAutoreleasedReturnValue();
    accessorySecondaryButtonColor = v5->_accessorySecondaryButtonColor;
    v5->_accessorySecondaryButtonColor = (UIColor *)v14;

    +[AMSUIAppearance _accessorySecondaryButtonFontWithDictionary:](AMSUIAppearance, "_accessorySecondaryButtonFontWithDictionary:", v4);
    v16 = objc_claimAutoreleasedReturnValue();
    accessorySecondaryButtonFont = v5->_accessorySecondaryButtonFont;
    v5->_accessorySecondaryButtonFont = (UIFont *)v16;

    +[AMSUIAppearance _backgroundColorWithDictionary:](AMSUIAppearance, "_backgroundColorWithDictionary:", v4);
    v18 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (UIColor *)v18;

    +[AMSUIAppearance _backgroundImageWithDictionary:](AMSUIAppearance, "_backgroundImageWithDictionary:", v4);
    v20 = objc_claimAutoreleasedReturnValue();
    backgroundImage = v5->_backgroundImage;
    v5->_backgroundImage = (UIImage *)v20;

    v5->_iconAnimationPlayCount = +[AMSUIAppearance _iconAnimationPlayCount:](AMSUIAppearance, "_iconAnimationPlayCount:", v4);
    +[AMSUIAppearance _imageSymbolConfigurationWithDictionary:](AMSUIAppearance, "_imageSymbolConfigurationWithDictionary:", v4);
    v22 = objc_claimAutoreleasedReturnValue();
    imageSymbolConfiguration = v5->_imageSymbolConfiguration;
    v5->_imageSymbolConfiguration = (UIImageSymbolConfiguration *)v22;

    +[AMSUIAppearance _imageTintColorWithDictionary:](AMSUIAppearance, "_imageTintColorWithDictionary:", v4);
    v24 = objc_claimAutoreleasedReturnValue();
    imageTintColor = v5->_imageTintColor;
    v5->_imageTintColor = (UIColor *)v24;

    +[AMSUIAppearance _messageFontWithDictionary:](AMSUIAppearance, "_messageFontWithDictionary:", v4);
    v26 = objc_claimAutoreleasedReturnValue();
    messageFont = v5->_messageFont;
    v5->_messageFont = (UIFont *)v26;

    +[AMSUIAppearance _messageTextColorWithDictionary:](AMSUIAppearance, "_messageTextColorWithDictionary:", v4);
    v28 = objc_claimAutoreleasedReturnValue();
    messageTextColor = v5->_messageTextColor;
    v5->_messageTextColor = (UIColor *)v28;

    v5->_primaryImageRenderingMode = +[AMSUIAppearance _primaryImageRenderingModeWithDictionary:](AMSUIAppearance, "_primaryImageRenderingModeWithDictionary:", v4);
    +[AMSUIAppearance _separatorColorWithDictionary:](AMSUIAppearance, "_separatorColorWithDictionary:", v4);
    v30 = objc_claimAutoreleasedReturnValue();
    separatorColor = v5->_separatorColor;
    v5->_separatorColor = (UIColor *)v30;

    +[AMSUIAppearance _titleFontWithDictionary:](AMSUIAppearance, "_titleFontWithDictionary:", v4);
    v32 = objc_claimAutoreleasedReturnValue();
    titleFont = v5->_titleFont;
    v5->_titleFont = (UIFont *)v32;

    +[AMSUIAppearance _titleTextColorWithDictionary:](AMSUIAppearance, "_titleTextColorWithDictionary:", v4);
    v34 = objc_claimAutoreleasedReturnValue();
    titleTextColor = v5->_titleTextColor;
    v5->_titleTextColor = (UIColor *)v34;

  }
  return v5;
}

- (UIColor)accessoryButtonBackgroundColor
{
  return self->_accessoryButtonBackgroundColor;
}

- (void)setAccessoryButtonBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryButtonBackgroundColor, a3);
}

- (UIColor)accessoryButtonColor
{
  return self->_accessoryButtonColor;
}

- (void)setAccessoryButtonColor:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryButtonColor, a3);
}

- (UIFont)accessoryButtonFont
{
  return self->_accessoryButtonFont;
}

- (void)setAccessoryButtonFont:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryButtonFont, a3);
}

- (UIColor)accessorySecondaryButtonBackgroundColor
{
  return self->_accessorySecondaryButtonBackgroundColor;
}

- (void)setAccessorySecondaryButtonBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_accessorySecondaryButtonBackgroundColor, a3);
}

- (UIColor)accessorySecondaryButtonColor
{
  return self->_accessorySecondaryButtonColor;
}

- (void)setAccessorySecondaryButtonColor:(id)a3
{
  objc_storeStrong((id *)&self->_accessorySecondaryButtonColor, a3);
}

- (UIFont)accessorySecondaryButtonFont
{
  return self->_accessorySecondaryButtonFont;
}

- (void)setAccessorySecondaryButtonFont:(id)a3
{
  objc_storeStrong((id *)&self->_accessorySecondaryButtonFont, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (UIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (void)setBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundImage, a3);
}

- (UIImageSymbolConfiguration)imageSymbolConfiguration
{
  return self->_imageSymbolConfiguration;
}

- (void)setImageSymbolConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_imageSymbolConfiguration, a3);
}

- (int64_t)iconAnimationPlayCount
{
  return self->_iconAnimationPlayCount;
}

- (void)setIconAnimationPlayCount:(int64_t)a3
{
  self->_iconAnimationPlayCount = a3;
}

- (UIColor)imageTintColor
{
  return self->_imageTintColor;
}

- (void)setImageTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_imageTintColor, a3);
}

- (UIFont)messageFont
{
  return self->_messageFont;
}

- (void)setMessageFont:(id)a3
{
  objc_storeStrong((id *)&self->_messageFont, a3);
}

- (UIColor)messageTextColor
{
  return self->_messageTextColor;
}

- (void)setMessageTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_messageTextColor, a3);
}

- (int64_t)primaryImageRenderingMode
{
  return self->_primaryImageRenderingMode;
}

- (void)setPrimaryImageRenderingMode:(int64_t)a3
{
  self->_primaryImageRenderingMode = a3;
}

- (UIColor)separatorColor
{
  return self->_separatorColor;
}

- (void)setSeparatorColor:(id)a3
{
  objc_storeStrong((id *)&self->_separatorColor, a3);
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (void)setTitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_titleFont, a3);
}

- (UIColor)titleTextColor
{
  return self->_titleTextColor;
}

- (void)setTitleTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_titleTextColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleTextColor, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_separatorColor, 0);
  objc_storeStrong((id *)&self->_messageTextColor, 0);
  objc_storeStrong((id *)&self->_messageFont, 0);
  objc_storeStrong((id *)&self->_imageTintColor, 0);
  objc_storeStrong((id *)&self->_imageSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_accessorySecondaryButtonFont, 0);
  objc_storeStrong((id *)&self->_accessorySecondaryButtonColor, 0);
  objc_storeStrong((id *)&self->_accessorySecondaryButtonBackgroundColor, 0);
  objc_storeStrong((id *)&self->_accessoryButtonFont, 0);
  objc_storeStrong((id *)&self->_accessoryButtonColor, 0);
  objc_storeStrong((id *)&self->_accessoryButtonBackgroundColor, 0);
}

@end
