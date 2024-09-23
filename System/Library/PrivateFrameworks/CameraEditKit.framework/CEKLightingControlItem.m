@implementation CEKLightingControlItem

+ (id)_defaultOutlineImage
{
  if (_defaultOutlineImage_onceToken != -1)
    dispatch_once(&_defaultOutlineImage_onceToken, &__block_literal_global_431);
  return (id)_defaultOutlineImage_kDefaultOutlineImage;
}

void __46__CEKLightingControlItem__defaultOutlineImage__block_invoke()
{
  void *v0;
  double v1;
  double v2;
  CGContext *CurrentContext;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  CGSize v9;
  CGRect v10;
  CGRect v11;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "scale");
  v2 = v1;

  v9.width = 1.0 / v2 + 31.0 + 2.0 / v2 * 2.0;
  v9.height = v9.width;
  UIGraphicsBeginImageContextWithOptions(v9, 0, v2);
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStroke");

  v10.origin.x = 0.0;
  v10.origin.y = 0.0;
  v10.size.width = 1.0 / v2 + 31.0 + 2.0 / v2 * 2.0;
  v10.size.height = v10.size.width;
  v11 = CGRectInset(v10, 2.0 / v2, 2.0 / v2);
  CGContextStrokeEllipseInRect(CurrentContext, v11);
  UIGraphicsGetImageFromCurrentImageContext();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_defaultOutlineImage_kDefaultOutlineImage;
  _defaultOutlineImage_kDefaultOutlineImage = v5;

  objc_msgSend((id)_defaultOutlineImage_kDefaultOutlineImage, "imageWithRenderingMode:", 2);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)_defaultOutlineImage_kDefaultOutlineImage;
  _defaultOutlineImage_kDefaultOutlineImage = v7;

  UIGraphicsEndImageContext();
}

- (CEKLightingControlItem)initWithType:(int64_t)a3
{
  CEKLightingControlItem *v4;
  CEKLightingControlItem *v5;
  uint64_t v6;
  NSString *displayName;
  uint64_t v8;
  UIImage *displayImage;
  void *v10;
  void *v11;
  uint64_t v12;
  UIImage *displayShadowImage;
  uint64_t v14;
  UIImage *displayOutlineImage;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CEKLightingControlItem;
  v4 = -[CEKLightingControlItem init](&v17, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_lightingType = a3;
    +[CEKLightingEffectManager displayNameForLightingType:](CEKLightingEffectManager, "displayNameForLightingType:", a3);
    v6 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v6;

    +[CEKLightingEffectManager displayImageForLightingType:](CEKLightingEffectManager, "displayImageForLightingType:", a3);
    v8 = objc_claimAutoreleasedReturnValue();
    displayImage = v5->_displayImage;
    v5->_displayImage = (UIImage *)v8;

    v10 = (void *)MEMORY[0x1E0DC3870];
    CEKFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageNamed:inBundle:", CFSTR("CEKLightingShadow"), v11);
    v12 = objc_claimAutoreleasedReturnValue();
    displayShadowImage = v5->_displayShadowImage;
    v5->_displayShadowImage = (UIImage *)v12;

    if ((unint64_t)(a3 - 2) <= 4)
    {
      objc_msgSend((id)objc_opt_class(), "_defaultOutlineImage");
      v14 = objc_claimAutoreleasedReturnValue();
      displayOutlineImage = v5->_displayOutlineImage;
      v5->_displayOutlineImage = (UIImage *)v14;

    }
  }
  return v5;
}

- (int64_t)lightingType
{
  return self->_lightingType;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (UIImage)displayImage
{
  return self->_displayImage;
}

- (UIImage)displayShadowImage
{
  return self->_displayShadowImage;
}

- (UIImage)displayOutlineImage
{
  return self->_displayOutlineImage;
}

- (UIImage)selectionBackgroundImage
{
  return self->_selectionBackgroundImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionBackgroundImage, 0);
  objc_storeStrong((id *)&self->_displayOutlineImage, 0);
  objc_storeStrong((id *)&self->_displayShadowImage, 0);
  objc_storeStrong((id *)&self->_displayImage, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
