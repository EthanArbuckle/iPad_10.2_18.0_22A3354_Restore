@implementation CNBadgingAvatarBadgeStyleSettings

- (CNBadgingAvatarBadgeStyleSettings)init
{
  void *v3;
  CNBadgingAvatarBadgeStyleSettings *v4;

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNBadgingAvatarBadgeStyleSettings initWithPosition:color:backgroundColor:cropStyle:](self, "initWithPosition:color:backgroundColor:cropStyle:", 0, 0, v3, 0);

  return v4;
}

- (CNBadgingAvatarBadgeStyleSettings)initWithPosition:(int64_t)a3 color:(id)a4 backgroundColor:(id)a5 cropStyle:(int64_t)a6
{
  id v11;
  id v12;
  CNBadgingAvatarBadgeStyleSettings *v13;
  CNBadgingAvatarBadgeStyleSettings *v14;
  CNBadgingAvatarBadgeStyleSettings *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CNBadgingAvatarBadgeStyleSettings;
  v13 = -[CNBadgingAvatarBadgeStyleSettings init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_position = a3;
    objc_storeStrong((id *)&v13->_color, a4);
    v14->_cropStyle = a6;
    objc_storeStrong((id *)&v14->_backgroundColor, a5);
    v14->_contentMode = 0;
    v15 = v14;
  }

  return v14;
}

- (int64_t)cnuiBadgePosition
{
  return objc_msgSend((id)objc_opt_class(), "cnuiBadgePosition:", -[CNBadgingAvatarBadgeStyleSettings position](self, "position"));
}

- (unint64_t)cnuiCropStyle
{
  return objc_msgSend((id)objc_opt_class(), "cnuiBadgeCropStyle:", -[CNBadgingAvatarBadgeStyleSettings cropStyle](self, "cropStyle"));
}

- (BOOL)isEqual:(id)a3
{
  CNBadgingAvatarBadgeStyleSettings *v4;
  UIColor *color;
  UIColor *backgroundColor;
  BOOL v7;

  v4 = (CNBadgingAvatarBadgeStyleSettings *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    v7 = (objc_opt_isKindOfClass() & 1) != 0
      && ((color = self->_color, !((unint64_t)color | (unint64_t)v4->_color))
       || -[UIColor isEqual:](color, "isEqual:"))
      && ((backgroundColor = self->_backgroundColor,
           !((unint64_t)backgroundColor | (unint64_t)v4->_backgroundColor))
       || -[UIColor isEqual:](backgroundColor, "isEqual:"))
      && self->_position == v4->_position
      && self->_cropStyle == v4->_cropStyle;
  }

  return v7;
}

- (int64_t)position
{
  return self->_position;
}

- (void)setPosition:(int64_t)a3
{
  self->_position = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (int64_t)cropStyle
{
  return self->_cropStyle;
}

- (void)setCropStyle:(int64_t)a3
{
  self->_cropStyle = a3;
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (void)setContentMode:(int64_t)a3
{
  self->_contentMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

+ (int64_t)cnuiBadgePosition:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
    return 0;
  else
    return a3;
}

+ (unint64_t)cnuiBadgeCropStyle:(int64_t)a3
{
  return a3 != 0;
}

+ (id)markedForSyndicationBadgeSettings
{
  CNBadgingAvatarBadgeStyleSettings *v2;
  void *v3;
  void *v4;
  CNBadgingAvatarBadgeStyleSettings *v5;

  v2 = [CNBadgingAvatarBadgeStyleSettings alloc];
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.945098039, 0.737254902, 0.28627451, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNBadgingAvatarBadgeStyleSettings initWithPosition:color:backgroundColor:cropStyle:](v2, "initWithPosition:color:backgroundColor:cropStyle:", 0, v3, v4, 0);

  return v5;
}

+ (id)doNotDisturbBadgeSettings
{
  CNBadgingAvatarBadgeStyleSettings *v2;
  void *v3;
  void *v4;
  CNBadgingAvatarBadgeStyleSettings *v5;

  v2 = [CNBadgingAvatarBadgeStyleSettings alloc];
  objc_msgSend(MEMORY[0x1E0DC3658], "systemIndigoColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNBadgingAvatarBadgeStyleSettings initWithPosition:color:backgroundColor:cropStyle:](v2, "initWithPosition:color:backgroundColor:cropStyle:", 0, v3, v4, 0);

  -[CNBadgingAvatarBadgeStyleSettings setContentMode:](v5, "setContentMode:", 4);
  return v5;
}

@end
