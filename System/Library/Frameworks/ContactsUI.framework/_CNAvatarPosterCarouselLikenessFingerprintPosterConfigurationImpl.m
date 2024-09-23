@implementation _CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl

- (_CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl)initWithPosterConfigurationData:(id)a3 titleStyleAttributes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl *v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "titleColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleFont");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "preferredTitleLayout");
  v11 = objc_msgSend(v6, "preferredTitleAlignment");

  v12 = -[_CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl initWithPosterConfigurationData:titleColor:titleFont:preferredTitleLayout:preferredTitleAlignment:](self, "initWithPosterConfigurationData:titleColor:titleFont:preferredTitleLayout:preferredTitleAlignment:", v7, v8, v9, v10, v11);
  return v12;
}

- (_CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl)initWithPosterConfigurationData:(id)a3 titleColor:(id)a4 titleFont:(id)a5 preferredTitleLayout:(unint64_t)a6 preferredTitleAlignment:(unint64_t)a7
{
  id v13;
  id v14;
  id v15;
  _CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl *v16;
  _CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl *v17;
  _CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl;
  v16 = -[_CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl init](&v20, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_posterConfigurationData, a3);
    objc_storeStrong((id *)&v17->_titleColor, a4);
    objc_storeStrong((id *)&v17->_titleFont, a5);
    v17->_preferredTitleAlignment = a7;
    v17->_preferredTitleLayout = a6;
    v18 = v17;
  }

  return v17;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("posterConfigurationData"), self->_posterConfigurationData);
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("titleFont"), self->_titleFont);
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("titleColor"), self->_titleColor);
  v7 = (id)objc_msgSend(v3, "appendName:unsignedInteger:", CFSTR("preferredTitleLayout"), self->_preferredTitleLayout);
  v8 = (id)objc_msgSend(v3, "appendName:unsignedInteger:", CFSTR("preferredTitleAlignment"), self->_preferredTitleAlignment);
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (BOOL)isEqual:(id)a3
{
  _CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl *v4;
  unint64_t preferredTitleLayout;
  unint64_t preferredTitleAlignment;
  UIFont *titleFont;
  unint64_t v8;
  UIColor *titleColor;
  unint64_t v10;
  NSData *posterConfigurationData;
  unint64_t v12;
  BOOL v13;

  v4 = (_CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl *)a3;
  if (self == v4)
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_12;
  preferredTitleLayout = self->_preferredTitleLayout;
  if (preferredTitleLayout != -[_CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl preferredTitleLayout](v4, "preferredTitleLayout"))goto LABEL_12;
  preferredTitleAlignment = self->_preferredTitleAlignment;
  if (preferredTitleAlignment != -[_CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl preferredTitleAlignment](v4, "preferredTitleAlignment"))goto LABEL_12;
  titleFont = self->_titleFont;
  v8 = (unint64_t)-[_CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl titleFont](v4, "titleFont");
  if ((unint64_t)titleFont | v8)
  {
    if (!-[UIFont isEqual:](titleFont, "isEqual:", v8))
      goto LABEL_12;
  }
  if (((titleColor = self->_titleColor,
         v10 = (unint64_t)-[_CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl titleColor](v4, "titleColor"), !((unint64_t)titleColor | v10))|| -[UIColor isEqual:](titleColor, "isEqual:", v10))&& ((posterConfigurationData = self->_posterConfigurationData, v12 = (unint64_t)-[_CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl posterConfigurationData](v4, "posterConfigurationData"), !((unint64_t)posterConfigurationData | v12))|| -[NSData isEqual:](posterConfigurationData, "isEqual:", v12)))
  {
LABEL_11:
    v13 = 1;
  }
  else
  {
LABEL_12:
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v3 = objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_posterConfigurationData);
  v4 = objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_titleFont) - v3 + 32 * v3;
  v5 = objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_titleColor);
  v6 = self->_preferredTitleLayout - (v5 - v4 + 32 * v4) + 32 * (v5 - v4 + 32 * v4);
  return self->_preferredTitleAlignment - v6 + 32 * v6 + 486695567;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *posterConfigurationData;
  id v5;

  posterConfigurationData = self->_posterConfigurationData;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", posterConfigurationData, CFSTR("posterConfigurationData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_titleFont, CFSTR("titleFont"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_titleColor, CFSTR("titleColor"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_preferredTitleLayout, CFSTR("preferredTitleLayout"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_preferredTitleAlignment, CFSTR("preferredTitleAlignment"));

}

- (_CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("posterConfigurationData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("titleFont"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("titleColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("preferredTitleLayout"));
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("preferredTitleAlignment"));

  v10 = -[_CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl initWithPosterConfigurationData:titleColor:titleFont:preferredTitleLayout:preferredTitleAlignment:](self, "initWithPosterConfigurationData:titleColor:titleFont:preferredTitleLayout:preferredTitleAlignment:", v5, v7, v6, v8, v9);
  return v10;
}

- (NSData)posterConfigurationData
{
  return self->_posterConfigurationData;
}

- (void)setPosterConfigurationData:(id)a3
{
  objc_storeStrong((id *)&self->_posterConfigurationData, a3);
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (void)setTitleColor:(id)a3
{
  objc_storeStrong((id *)&self->_titleColor, a3);
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (void)setTitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_titleFont, a3);
}

- (unint64_t)preferredTitleAlignment
{
  return self->_preferredTitleAlignment;
}

- (void)setPreferredTitleAlignment:(unint64_t)a3
{
  self->_preferredTitleAlignment = a3;
}

- (unint64_t)preferredTitleLayout
{
  return self->_preferredTitleLayout;
}

- (void)setPreferredTitleLayout:(unint64_t)a3
{
  self->_preferredTitleLayout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_posterConfigurationData, 0);
}

+ (id)fingerprintForPosterConfiguration:(id)a3 withConfigurationData:(id)a4
{
  id v5;
  void *v6;
  _CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl *v7;

  v5 = a4;
  +[CNPRUISPosterTitleStyleAttributes attributesForCNConfiguration:](CNPRUISPosterTitleStyleAttributes, "attributesForCNConfiguration:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl initWithPosterConfigurationData:titleStyleAttributes:]([_CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl alloc], "initWithPosterConfigurationData:titleStyleAttributes:", v5, v6);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
