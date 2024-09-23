@implementation AMSUIBubbleTipAppearance

- (AMSUIBubbleTipAppearance)init
{
  AMSUIBubbleTipAppearance *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMSUIBubbleTipAppearance;
  result = -[AMSUIAppearance init](&v3, sel_init);
  if (result)
  {
    result->_iconAnimationPlayCount = -90;
    result->_imageStyle = 0;
    result->_primaryImageRenderingMode = 0;
  }
  return result;
}

- (AMSUIBubbleTipAppearance)initWithDictionary:(id)a3
{
  id v4;
  AMSUIBubbleTipAppearance *v5;
  uint64_t v6;
  UIColor *accessoryButtonColor;
  uint64_t v8;
  UIFont *accessoryButtonFont;
  uint64_t v10;
  UIColor *backgroundColor;
  uint64_t v12;
  UIImage *backgroundImage;
  uint64_t v14;
  UIColor *footerButtonColor;
  uint64_t v16;
  UIFont *footerButtonFont;
  uint64_t v18;
  UIImageSymbolConfiguration *imageSymbolConfiguration;
  uint64_t v20;
  UIColor *imageTintColor;
  uint64_t v22;
  UIColor *separatorColor;
  uint64_t v24;
  UIFont *titleFont;
  uint64_t v26;
  UIColor *titleTextColor;
  uint64_t v28;
  UIFont *messageFont;
  uint64_t v30;
  UIColor *messageTextColor;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)AMSUIBubbleTipAppearance;
  v5 = -[AMSUIAppearance initWithDictionary:](&v33, sel_initWithDictionary_, v4);
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

    +[AMSUIAppearance _backgroundColorWithDictionary:](AMSUIAppearance, "_backgroundColorWithDictionary:", v4);
    v10 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (UIColor *)v10;

    +[AMSUIAppearance _backgroundImageWithDictionary:](AMSUIAppearance, "_backgroundImageWithDictionary:", v4);
    v12 = objc_claimAutoreleasedReturnValue();
    backgroundImage = v5->_backgroundImage;
    v5->_backgroundImage = (UIImage *)v12;

    +[AMSUIAppearance _footerButtonColorWithDictionary:](AMSUIAppearance, "_footerButtonColorWithDictionary:", v4);
    v14 = objc_claimAutoreleasedReturnValue();
    footerButtonColor = v5->_footerButtonColor;
    v5->_footerButtonColor = (UIColor *)v14;

    +[AMSUIAppearance _footerButtonFontWithDictionary:](AMSUIAppearance, "_footerButtonFontWithDictionary:", v4);
    v16 = objc_claimAutoreleasedReturnValue();
    footerButtonFont = v5->_footerButtonFont;
    v5->_footerButtonFont = (UIFont *)v16;

    v5->_iconAnimationPlayCount = +[AMSUIAppearance _iconAnimationPlayCount:](AMSUIAppearance, "_iconAnimationPlayCount:", v4);
    +[AMSUIAppearance _imageSymbolConfigurationWithDictionary:](AMSUIAppearance, "_imageSymbolConfigurationWithDictionary:", v4);
    v18 = objc_claimAutoreleasedReturnValue();
    imageSymbolConfiguration = v5->_imageSymbolConfiguration;
    v5->_imageSymbolConfiguration = (UIImageSymbolConfiguration *)v18;

    +[AMSUIAppearance _imageTintColorWithDictionary:](AMSUIAppearance, "_imageTintColorWithDictionary:", v4);
    v20 = objc_claimAutoreleasedReturnValue();
    imageTintColor = v5->_imageTintColor;
    v5->_imageTintColor = (UIColor *)v20;

    v5->_primaryImageRenderingMode = +[AMSUIAppearance _primaryImageRenderingModeWithDictionary:](AMSUIAppearance, "_primaryImageRenderingModeWithDictionary:", v4);
    +[AMSUIAppearance _separatorColorWithDictionary:](AMSUIAppearance, "_separatorColorWithDictionary:", v4);
    v22 = objc_claimAutoreleasedReturnValue();
    separatorColor = v5->_separatorColor;
    v5->_separatorColor = (UIColor *)v22;

    +[AMSUIAppearance _titleFontWithDictionary:](AMSUIAppearance, "_titleFontWithDictionary:", v4);
    v24 = objc_claimAutoreleasedReturnValue();
    titleFont = v5->_titleFont;
    v5->_titleFont = (UIFont *)v24;

    +[AMSUIAppearance _titleTextColorWithDictionary:](AMSUIAppearance, "_titleTextColorWithDictionary:", v4);
    v26 = objc_claimAutoreleasedReturnValue();
    titleTextColor = v5->_titleTextColor;
    v5->_titleTextColor = (UIColor *)v26;

    +[AMSUIAppearance _messageFontWithDictionary:](AMSUIAppearance, "_messageFontWithDictionary:", v4);
    v28 = objc_claimAutoreleasedReturnValue();
    messageFont = v5->_messageFont;
    v5->_messageFont = (UIFont *)v28;

    +[AMSUIAppearance _messageTextColorWithDictionary:](AMSUIAppearance, "_messageTextColorWithDictionary:", v4);
    v30 = objc_claimAutoreleasedReturnValue();
    messageTextColor = v5->_messageTextColor;
    v5->_messageTextColor = (UIColor *)v30;

    -[AMSUIBubbleTipAppearance _setImageStyleWithDictionary:](v5, "_setImageStyleWithDictionary:", v4);
  }

  return v5;
}

- (void)_setImageStyleWithDictionary:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  id v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("imageStyle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v4;
  else
    v7 = 0;

  v5 = v7;
  if (v7)
  {
    v6 = objc_msgSend(v7, "unsignedIntValue");
    v5 = v7;
    self->_imageStyle = v6;
  }

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

- (UIColor)footerButtonColor
{
  return self->_footerButtonColor;
}

- (void)setFooterButtonColor:(id)a3
{
  objc_storeStrong((id *)&self->_footerButtonColor, a3);
}

- (UIFont)footerButtonFont
{
  return self->_footerButtonFont;
}

- (void)setFooterButtonFont:(id)a3
{
  objc_storeStrong((id *)&self->_footerButtonFont, a3);
}

- (int64_t)iconAnimationPlayCount
{
  return self->_iconAnimationPlayCount;
}

- (void)setIconAnimationPlayCount:(int64_t)a3
{
  self->_iconAnimationPlayCount = a3;
}

- (unint64_t)imageStyle
{
  return self->_imageStyle;
}

- (void)setImageStyle:(unint64_t)a3
{
  self->_imageStyle = a3;
}

- (UIImageSymbolConfiguration)imageSymbolConfiguration
{
  return self->_imageSymbolConfiguration;
}

- (void)setImageSymbolConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_imageSymbolConfiguration, a3);
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
  objc_storeStrong((id *)&self->_footerButtonFont, 0);
  objc_storeStrong((id *)&self->_footerButtonColor, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_accessoryButtonFont, 0);
  objc_storeStrong((id *)&self->_accessoryButtonColor, 0);
}

@end
