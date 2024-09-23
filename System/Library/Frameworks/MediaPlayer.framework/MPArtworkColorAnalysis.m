@implementation MPArtworkColorAnalysis

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tertiaryTextColor, 0);
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);
  objc_storeStrong((id *)&self->_primaryTextColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

- (id)translateToMSVColorAnalysis
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = objc_alloc_init(MEMORY[0x1E0D4D090]);
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[MPArtworkColorAnalysis backgroundColor](self, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "MP_hexStringFromColor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColorHex:", v6);

  objc_msgSend(v3, "setBackgroundColorLight:", -[MPArtworkColorAnalysis isBackgroundColorLight](self, "isBackgroundColorLight"));
  v7 = (void *)MEMORY[0x1E0CB3940];
  -[MPArtworkColorAnalysis primaryTextColor](self, "primaryTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "MP_hexStringFromColor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPrimaryTextColorHex:", v9);

  objc_msgSend(v3, "setPrimaryTextColorLight:", -[MPArtworkColorAnalysis isPrimaryTextColorLight](self, "isPrimaryTextColorLight"));
  v10 = (void *)MEMORY[0x1E0CB3940];
  -[MPArtworkColorAnalysis secondaryTextColor](self, "secondaryTextColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "MP_hexStringFromColor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSecondaryTextColorHex:", v12);

  objc_msgSend(v3, "setSecondaryTextColorLight:", -[MPArtworkColorAnalysis isSecondaryTextColorLight](self, "isSecondaryTextColorLight"));
  v13 = (void *)MEMORY[0x1E0CB3940];
  -[MPArtworkColorAnalysis tertiaryTextColor](self, "tertiaryTextColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "MP_hexStringFromColor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTertiaryTextColorHex:", v15);

  objc_msgSend(v3, "setTertiaryTextColorLight:", -[MPArtworkColorAnalysis isTertiaryTextColorLight](self, "isTertiaryTextColorLight"));
  return v3;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v14;
  void *v15;

  v15 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPArtworkColorAnalysis backgroundColor](self, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MPArtworkColorAnalysis isBackgroundColorLight](self, "isBackgroundColorLight"))
    v5 = CFSTR("Light");
  else
    v5 = CFSTR("Dark");
  -[MPArtworkColorAnalysis primaryTextColor](self, "primaryTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MPArtworkColorAnalysis isPrimaryTextColorLight](self, "isPrimaryTextColorLight"))
    v7 = CFSTR("Light");
  else
    v7 = CFSTR("Dark");
  -[MPArtworkColorAnalysis secondaryTextColor](self, "secondaryTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MPArtworkColorAnalysis isSecondaryTextColorLight](self, "isSecondaryTextColorLight"))
    v9 = CFSTR("Light");
  else
    v9 = CFSTR("Dark");
  -[MPArtworkColorAnalysis tertiaryTextColor](self, "tertiaryTextColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MPArtworkColorAnalysis isTertiaryTextColorLight](self, "isTertiaryTextColorLight"))
    v11 = CFSTR("Light");
  else
    v11 = CFSTR("Dark");
  objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@: %p> (\n  backgroundColor: %@ (%@)\n  primaryTextColor: %@ (%@)\n  secondaryTextColor: %@ (%@)\n  tertiaryTextColor: %@ (%@)\n)"), v14, self, v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (MPArtworkColorAnalysis)initWithCoder:(id)a3
{
  id v4;
  MPArtworkColorAnalysis *v5;
  uint64_t v6;
  UIColor *backgroundColor;
  uint64_t v8;
  UIColor *primaryTextColor;
  uint64_t v10;
  UIColor *secondaryTextColor;
  uint64_t v12;
  UIColor *tertiaryTextColor;

  v4 = a3;
  v5 = -[MPArtworkColorAnalysis init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundColor"));
    v6 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (UIColor *)v6;

    v5->_backgroundColorLight = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("backgroundColorLight"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryTextColor"));
    v8 = objc_claimAutoreleasedReturnValue();
    primaryTextColor = v5->_primaryTextColor;
    v5->_primaryTextColor = (UIColor *)v8;

    v5->_primaryTextColorLight = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("primaryTextColorLight"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secondaryTextColor"));
    v10 = objc_claimAutoreleasedReturnValue();
    secondaryTextColor = v5->_secondaryTextColor;
    v5->_secondaryTextColor = (UIColor *)v10;

    v5->_secondaryTextColorLight = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("secondaryTextColorLight"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tertiaryTextColor"));
    v12 = objc_claimAutoreleasedReturnValue();
    tertiaryTextColor = v5->_tertiaryTextColor;
    v5->_tertiaryTextColor = (UIColor *)v12;

    v5->_tertiaryTextColorLight = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("tertiaryTextColorLight"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[MPArtworkColorAnalysis backgroundColor](self, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("backgroundColor"));

  objc_msgSend(v8, "encodeBool:forKey:", -[MPArtworkColorAnalysis isBackgroundColorLight](self, "isBackgroundColorLight"), CFSTR("backgroundColorLight"));
  -[MPArtworkColorAnalysis primaryTextColor](self, "primaryTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("primaryTextColor"));

  objc_msgSend(v8, "encodeBool:forKey:", -[MPArtworkColorAnalysis isPrimaryTextColorLight](self, "isPrimaryTextColorLight"), CFSTR("primaryTextColorLight"));
  -[MPArtworkColorAnalysis secondaryTextColor](self, "secondaryTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("secondaryTextColor"));

  objc_msgSend(v8, "encodeBool:forKey:", -[MPArtworkColorAnalysis isSecondaryTextColorLight](self, "isSecondaryTextColorLight"), CFSTR("secondaryTextColorLight"));
  -[MPArtworkColorAnalysis tertiaryTextColor](self, "tertiaryTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("tertiaryTextColor"));

  objc_msgSend(v8, "encodeBool:forKey:", -[MPArtworkColorAnalysis isTertiaryTextColorLight](self, "isTertiaryTextColorLight"), CFSTR("tertiaryTextColorLight"));
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[MPArtworkColorAnalysis _copyWithClass:](self, "_copyWithClass:", objc_opt_class());
}

- (id)_copyWithClass:(Class)a3
{
  id *v4;
  id *v5;

  v4 = (id *)objc_alloc_init(a3);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 1, self->_backgroundColor);
    *((_BYTE *)v5 + 16) = self->_backgroundColorLight;
    objc_storeStrong(v5 + 3, self->_primaryTextColor);
    *((_BYTE *)v5 + 32) = self->_primaryTextColorLight;
    objc_storeStrong(v5 + 5, self->_secondaryTextColor);
    *((_BYTE *)v5 + 48) = self->_secondaryTextColorLight;
    objc_storeStrong(v5 + 7, self->_tertiaryTextColor);
    *((_BYTE *)v5 + 64) = self->_tertiaryTextColorLight;
  }
  return v5;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (BOOL)isBackgroundColorLight
{
  return self->_backgroundColorLight;
}

- (UIColor)primaryTextColor
{
  return self->_primaryTextColor;
}

- (void)setPrimaryTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_primaryTextColor, a3);
}

- (BOOL)isPrimaryTextColorLight
{
  return self->_primaryTextColorLight;
}

- (UIColor)secondaryTextColor
{
  return self->_secondaryTextColor;
}

- (void)setSecondaryTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryTextColor, a3);
}

- (BOOL)isSecondaryTextColorLight
{
  return self->_secondaryTextColorLight;
}

- (UIColor)tertiaryTextColor
{
  return self->_tertiaryTextColor;
}

- (void)setTertiaryTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_tertiaryTextColor, a3);
}

- (BOOL)isTertiaryTextColorLight
{
  return self->_tertiaryTextColorLight;
}

+ (id)translateFromMSVColorAnalysis:(id)a3
{
  id v3;
  MPMutableArtworkColorAnalysis *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v3 = a3;
  v4 = objc_alloc_init(MPMutableArtworkColorAnalysis);
  objc_msgSend(v3, "backgroundColorHex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "MP_colorFromHexString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMutableArtworkColorAnalysis setBackgroundColor:](v4, "setBackgroundColor:", v6);

  -[MPMutableArtworkColorAnalysis setBackgroundColorLight:](v4, "setBackgroundColorLight:", objc_msgSend(v3, "isBackgroundColorLight"));
  objc_msgSend(v3, "primaryTextColorHex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "MP_colorFromHexString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMutableArtworkColorAnalysis setPrimaryTextColor:](v4, "setPrimaryTextColor:", v8);

  -[MPMutableArtworkColorAnalysis setPrimaryTextColorLight:](v4, "setPrimaryTextColorLight:", objc_msgSend(v3, "isPrimaryTextColorLight"));
  objc_msgSend(v3, "secondaryTextColorHex");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "MP_colorFromHexString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMutableArtworkColorAnalysis setSecondaryTextColor:](v4, "setSecondaryTextColor:", v10);

  -[MPMutableArtworkColorAnalysis setSecondaryTextColorLight:](v4, "setSecondaryTextColorLight:", objc_msgSend(v3, "isSecondaryTextColorLight"));
  objc_msgSend(v3, "tertiaryTextColorHex");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "MP_colorFromHexString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMutableArtworkColorAnalysis setTertiaryTextColor:](v4, "setTertiaryTextColor:", v12);

  v13 = objc_msgSend(v3, "isTertiaryTextColorLight");
  -[MPMutableArtworkColorAnalysis setTertiaryTextColorLight:](v4, "setTertiaryTextColorLight:", v13);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
