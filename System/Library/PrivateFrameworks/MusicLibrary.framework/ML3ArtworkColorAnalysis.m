@implementation ML3ArtworkColorAnalysis

- (ML3ArtworkColorAnalysis)initWithColorAnalysis:(id)a3
{
  id v4;
  ML3ArtworkColorAnalysis *v5;
  uint64_t v6;
  NSString *backgroundColor;
  uint64_t v8;
  NSString *primaryTextColor;
  uint64_t v10;
  NSString *secondaryTextColor;
  uint64_t v12;
  NSString *tertiaryTextColor;
  ML3ArtworkColorAnalysis *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ML3ArtworkColorAnalysis;
  v5 = -[ML3ArtworkColorAnalysis init](&v16, sel_init);
  if (v5)
  {
    if (!v4)
    {
      v14 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v4, "backgroundColorHex");
    v6 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (NSString *)v6;

    objc_msgSend(v4, "primaryTextColorHex");
    v8 = objc_claimAutoreleasedReturnValue();
    primaryTextColor = v5->_primaryTextColor;
    v5->_primaryTextColor = (NSString *)v8;

    objc_msgSend(v4, "secondaryTextColorHex");
    v10 = objc_claimAutoreleasedReturnValue();
    secondaryTextColor = v5->_secondaryTextColor;
    v5->_secondaryTextColor = (NSString *)v10;

    objc_msgSend(v4, "tertiaryTextColorHex");
    v12 = objc_claimAutoreleasedReturnValue();
    tertiaryTextColor = v5->_tertiaryTextColor;
    v5->_tertiaryTextColor = (NSString *)v12;

    v5->_backgroundColorLight = objc_msgSend(v4, "isBackgroundColorLight");
    v5->_primaryTextColorLight = objc_msgSend(v4, "isPrimaryTextColorLight");
    v5->_secondaryTextColorLight = objc_msgSend(v4, "isSecondaryTextColorLight");
    v5->_tertiaryTextColorLight = objc_msgSend(v4, "isTertiaryTextColorLight");
  }
  v14 = v5;
LABEL_6:

  return v14;
}

- (ML3ArtworkColorAnalysis)initWithColorAnalysisDictionary:(id)a3
{
  id v4;
  ML3ArtworkColorAnalysis *v5;
  uint64_t v6;
  NSString *backgroundColor;
  uint64_t v8;
  NSString *primaryTextColor;
  uint64_t v10;
  NSString *secondaryTextColor;
  uint64_t v12;
  NSString *tertiaryTextColor;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  ML3ArtworkColorAnalysis *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ML3ArtworkColorAnalysis;
  v5 = -[ML3ArtworkColorAnalysis init](&v20, sel_init);
  if (v5)
  {
    if (!v4)
    {
      v18 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("backgroundColor"));
    v6 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("primaryTextColor"));
    v8 = objc_claimAutoreleasedReturnValue();
    primaryTextColor = v5->_primaryTextColor;
    v5->_primaryTextColor = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("secondaryTextColor"));
    v10 = objc_claimAutoreleasedReturnValue();
    secondaryTextColor = v5->_secondaryTextColor;
    v5->_secondaryTextColor = (NSString *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tertiaryTextColor"));
    v12 = objc_claimAutoreleasedReturnValue();
    tertiaryTextColor = v5->_tertiaryTextColor;
    v5->_tertiaryTextColor = (NSString *)v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("backgroundColorLight"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_backgroundColorLight = objc_msgSend(v14, "isEqual:", CFSTR("YES"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("primaryTextColorLight"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_primaryTextColorLight = objc_msgSend(v15, "isEqual:", CFSTR("YES"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("secondaryTextColorLight"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_secondaryTextColorLight = objc_msgSend(v16, "isEqual:", CFSTR("YES"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tertiaryTextColorLight"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_tertiaryTextColorLight = objc_msgSend(v17, "isEqual:", CFSTR("YES"));

  }
  v18 = v5;
LABEL_6:

  return v18;
}

- (id)dictRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  _QWORD v13[8];
  _QWORD v14[9];

  v14[8] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("backgroundColor");
  -[ML3ArtworkColorAnalysis backgroundColor](self, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = CFSTR("primaryTextColor");
  -[ML3ArtworkColorAnalysis primaryTextColor](self, "primaryTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v4;
  v13[2] = CFSTR("secondaryTextColor");
  -[ML3ArtworkColorAnalysis secondaryTextColor](self, "secondaryTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v5;
  v13[3] = CFSTR("tertiaryTextColor");
  -[ML3ArtworkColorAnalysis tertiaryTextColor](self, "tertiaryTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v6;
  v13[4] = CFSTR("backgroundColorLight");
  if (-[ML3ArtworkColorAnalysis isBackgroundColorLight](self, "isBackgroundColorLight"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v14[4] = v7;
  v13[5] = CFSTR("primaryTextColorLight");
  if (-[ML3ArtworkColorAnalysis isPrimaryTextColorLight](self, "isPrimaryTextColorLight"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v14[5] = v8;
  v13[6] = CFSTR("secondaryTextColorLight");
  if (-[ML3ArtworkColorAnalysis isSecondaryTextColorLight](self, "isSecondaryTextColorLight"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v14[6] = v9;
  v13[7] = CFSTR("tertiaryTextColorLight");
  if (-[ML3ArtworkColorAnalysis isTertiaryTextColorLight](self, "isTertiaryTextColorLight"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  v14[7] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (ML3ArtworkColorAnalysis)initWithCoder:(id)a3
{
  id v4;
  ML3ArtworkColorAnalysis *v5;
  uint64_t v6;
  NSString *backgroundColor;
  uint64_t v8;
  NSString *primaryTextColor;
  uint64_t v10;
  NSString *secondaryTextColor;
  uint64_t v12;
  NSString *tertiaryTextColor;

  v4 = a3;
  v5 = -[ML3ArtworkColorAnalysis init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundColor"));
    v6 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (NSString *)v6;

    v5->_backgroundColorLight = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("backgroundColorLight"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryTextColor"));
    v8 = objc_claimAutoreleasedReturnValue();
    primaryTextColor = v5->_primaryTextColor;
    v5->_primaryTextColor = (NSString *)v8;

    v5->_primaryTextColorLight = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("primaryTextColorLight"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secondaryTextColor"));
    v10 = objc_claimAutoreleasedReturnValue();
    secondaryTextColor = v5->_secondaryTextColor;
    v5->_secondaryTextColor = (NSString *)v10;

    v5->_secondaryTextColorLight = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("secondaryTextColorLight"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tertiaryTextColor"));
    v12 = objc_claimAutoreleasedReturnValue();
    tertiaryTextColor = v5->_tertiaryTextColor;
    v5->_tertiaryTextColor = (NSString *)v12;

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
  -[ML3ArtworkColorAnalysis backgroundColor](self, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("backgroundColor"));

  objc_msgSend(v8, "encodeBool:forKey:", -[ML3ArtworkColorAnalysis isBackgroundColorLight](self, "isBackgroundColorLight"), CFSTR("backgroundColorLight"));
  -[ML3ArtworkColorAnalysis primaryTextColor](self, "primaryTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("primaryTextColor"));

  objc_msgSend(v8, "encodeBool:forKey:", -[ML3ArtworkColorAnalysis isPrimaryTextColorLight](self, "isPrimaryTextColorLight"), CFSTR("primaryTextColorLight"));
  -[ML3ArtworkColorAnalysis secondaryTextColor](self, "secondaryTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("secondaryTextColor"));

  objc_msgSend(v8, "encodeBool:forKey:", -[ML3ArtworkColorAnalysis isSecondaryTextColorLight](self, "isSecondaryTextColorLight"), CFSTR("secondaryTextColorLight"));
  -[ML3ArtworkColorAnalysis tertiaryTextColor](self, "tertiaryTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("tertiaryTextColor"));

  objc_msgSend(v8, "encodeBool:forKey:", -[ML3ArtworkColorAnalysis isTertiaryTextColorLight](self, "isTertiaryTextColorLight"), CFSTR("tertiaryTextColorLight"));
}

- (NSString)backgroundColor
{
  return self->_backgroundColor;
}

- (NSString)primaryTextColor
{
  return self->_primaryTextColor;
}

- (NSString)secondaryTextColor
{
  return self->_secondaryTextColor;
}

- (NSString)tertiaryTextColor
{
  return self->_tertiaryTextColor;
}

- (BOOL)isBackgroundColorLight
{
  return self->_backgroundColorLight;
}

- (BOOL)isPrimaryTextColorLight
{
  return self->_primaryTextColorLight;
}

- (BOOL)isSecondaryTextColorLight
{
  return self->_secondaryTextColorLight;
}

- (BOOL)isTertiaryTextColorLight
{
  return self->_tertiaryTextColorLight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tertiaryTextColor, 0);
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);
  objc_storeStrong((id *)&self->_primaryTextColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
