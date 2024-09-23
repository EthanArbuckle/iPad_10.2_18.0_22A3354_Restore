@implementation MSVArtworkColorAnalysis

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
  -[MSVArtworkColorAnalysis backgroundColorHex](self, "backgroundColorHex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MSVArtworkColorAnalysis isBackgroundColorLight](self, "isBackgroundColorLight"))
    v5 = CFSTR("Light");
  else
    v5 = CFSTR("Dark");
  -[MSVArtworkColorAnalysis primaryTextColorHex](self, "primaryTextColorHex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MSVArtworkColorAnalysis isPrimaryTextColorLight](self, "isPrimaryTextColorLight"))
    v7 = CFSTR("Light");
  else
    v7 = CFSTR("Dark");
  -[MSVArtworkColorAnalysis secondaryTextColorHex](self, "secondaryTextColorHex");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MSVArtworkColorAnalysis isSecondaryTextColorLight](self, "isSecondaryTextColorLight"))
    v9 = CFSTR("Light");
  else
    v9 = CFSTR("Dark");
  -[MSVArtworkColorAnalysis tertiaryTextColorHex](self, "tertiaryTextColorHex");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MSVArtworkColorAnalysis isTertiaryTextColorLight](self, "isTertiaryTextColorLight"))
    v11 = CFSTR("Light");
  else
    v11 = CFSTR("Dark");
  objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@: %p> (\n  backgroundColor: %@ (%@)\n  primaryTextColor: %@ (%@)\n  secondaryTextColor: %@ (%@)\n  tertiaryTextColor: %@ (%@)\n)"), v14, self, v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (MSVArtworkColorAnalysis)initWithCoder:(id)a3
{
  id v4;
  MSVArtworkColorAnalysis *v5;
  uint64_t v6;
  NSString *backgroundColorHex;
  uint64_t v8;
  NSString *primaryTextColorHex;
  uint64_t v10;
  NSString *secondaryTextColorHex;
  uint64_t v12;
  NSString *tertiaryTextColorHex;

  v4 = a3;
  v5 = -[MSVArtworkColorAnalysis init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundColor"));
    v6 = objc_claimAutoreleasedReturnValue();
    backgroundColorHex = v5->_backgroundColorHex;
    v5->_backgroundColorHex = (NSString *)v6;

    v5->_backgroundColorLight = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("backgroundColorLight"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryTextColor"));
    v8 = objc_claimAutoreleasedReturnValue();
    primaryTextColorHex = v5->_primaryTextColorHex;
    v5->_primaryTextColorHex = (NSString *)v8;

    v5->_primaryTextColorLight = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("primaryTextColorLight"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secondaryTextColor"));
    v10 = objc_claimAutoreleasedReturnValue();
    secondaryTextColorHex = v5->_secondaryTextColorHex;
    v5->_secondaryTextColorHex = (NSString *)v10;

    v5->_secondaryTextColorLight = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("secondaryTextColorLight"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tertiaryTextColor"));
    v12 = objc_claimAutoreleasedReturnValue();
    tertiaryTextColorHex = v5->_tertiaryTextColorHex;
    v5->_tertiaryTextColorHex = (NSString *)v12;

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
  -[MSVArtworkColorAnalysis backgroundColorHex](self, "backgroundColorHex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("backgroundColor"));

  objc_msgSend(v8, "encodeBool:forKey:", -[MSVArtworkColorAnalysis isBackgroundColorLight](self, "isBackgroundColorLight"), CFSTR("backgroundColorLight"));
  -[MSVArtworkColorAnalysis primaryTextColorHex](self, "primaryTextColorHex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("primaryTextColor"));

  objc_msgSend(v8, "encodeBool:forKey:", -[MSVArtworkColorAnalysis isPrimaryTextColorLight](self, "isPrimaryTextColorLight"), CFSTR("primaryTextColorLight"));
  -[MSVArtworkColorAnalysis secondaryTextColorHex](self, "secondaryTextColorHex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("secondaryTextColor"));

  objc_msgSend(v8, "encodeBool:forKey:", -[MSVArtworkColorAnalysis isSecondaryTextColorLight](self, "isSecondaryTextColorLight"), CFSTR("secondaryTextColorLight"));
  -[MSVArtworkColorAnalysis tertiaryTextColorHex](self, "tertiaryTextColorHex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("tertiaryTextColor"));

  objc_msgSend(v8, "encodeBool:forKey:", -[MSVArtworkColorAnalysis isTertiaryTextColorLight](self, "isTertiaryTextColorLight"), CFSTR("tertiaryTextColorLight"));
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[MSVArtworkColorAnalysis _copyWithClass:](self, "_copyWithClass:", objc_opt_class());
}

- (id)_copyWithClass:(Class)a3
{
  id *v4;
  id *v5;

  v4 = (id *)objc_alloc_init(a3);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 1, self->_backgroundColorHex);
    *((_BYTE *)v5 + 16) = self->_backgroundColorLight;
    objc_storeStrong(v5 + 3, self->_primaryTextColorHex);
    *((_BYTE *)v5 + 32) = self->_primaryTextColorLight;
    objc_storeStrong(v5 + 5, self->_secondaryTextColorHex);
    *((_BYTE *)v5 + 48) = self->_secondaryTextColorLight;
    objc_storeStrong(v5 + 7, self->_tertiaryTextColorHex);
    *((_BYTE *)v5 + 64) = self->_tertiaryTextColorLight;
  }
  return v5;
}

- (NSString)backgroundColorHex
{
  return self->_backgroundColorHex;
}

- (void)setBackgroundColorHex:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColorHex, a3);
}

- (BOOL)isBackgroundColorLight
{
  return self->_backgroundColorLight;
}

- (NSString)primaryTextColorHex
{
  return self->_primaryTextColorHex;
}

- (void)setPrimaryTextColorHex:(id)a3
{
  objc_storeStrong((id *)&self->_primaryTextColorHex, a3);
}

- (BOOL)isPrimaryTextColorLight
{
  return self->_primaryTextColorLight;
}

- (NSString)secondaryTextColorHex
{
  return self->_secondaryTextColorHex;
}

- (void)setSecondaryTextColorHex:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryTextColorHex, a3);
}

- (BOOL)isSecondaryTextColorLight
{
  return self->_secondaryTextColorLight;
}

- (NSString)tertiaryTextColorHex
{
  return self->_tertiaryTextColorHex;
}

- (void)setTertiaryTextColorHex:(id)a3
{
  objc_storeStrong((id *)&self->_tertiaryTextColorHex, a3);
}

- (BOOL)isTertiaryTextColorLight
{
  return self->_tertiaryTextColorLight;
}

- (void)setTertiaryTextColorLight:(BOOL)a3
{
  self->_tertiaryTextColorLight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tertiaryTextColorHex, 0);
  objc_storeStrong((id *)&self->_secondaryTextColorHex, 0);
  objc_storeStrong((id *)&self->_primaryTextColorHex, 0);
  objc_storeStrong((id *)&self->_backgroundColorHex, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
