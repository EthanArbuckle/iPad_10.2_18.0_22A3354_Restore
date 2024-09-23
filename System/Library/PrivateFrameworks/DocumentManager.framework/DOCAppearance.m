@implementation DOCAppearance

- (id)copyWithZone:(_NSZone *)a3
{
  DOCAppearance *v4;
  uint64_t v5;
  NSString *collectionCreateButtonTitle;

  v4 = -[DOCAppearance init](+[DOCAppearance allocWithZone:](DOCAppearance, "allocWithZone:", a3), "init");
  if (v4)
  {
    -[DOCAppearance setShowsCreateButton:](v4, "setShowsCreateButton:", -[DOCAppearance showsCreateButton](self, "showsCreateButton"));
    -[DOCAppearance setShouldShowFileExtensions:](v4, "setShouldShowFileExtensions:", -[DOCAppearance shouldShowFileExtensions](self, "shouldShowFileExtensions"));
    -[DOCAppearance compactHorizontalTableStackSpacing](self, "compactHorizontalTableStackSpacing");
    -[DOCAppearance setCompactHorizontalTableStackSpacing:](v4, "setCompactHorizontalTableStackSpacing:");
    -[DOCAppearance regularHorizontalTableStackSpacing](self, "regularHorizontalTableStackSpacing");
    -[DOCAppearance setRegularHorizontalTableStackSpacing:](v4, "setRegularHorizontalTableStackSpacing:");
    -[DOCAppearance fullHorizontalTableStackSpacing](self, "fullHorizontalTableStackSpacing");
    -[DOCAppearance setFullHorizontalTableStackSpacing:](v4, "setFullHorizontalTableStackSpacing:");
    -[DOCAppearance defaultDocumentAspectRatio](self, "defaultDocumentAspectRatio");
    -[DOCAppearance setDefaultDocumentAspectRatio:](v4, "setDefaultDocumentAspectRatio:");
    v5 = -[NSString copy](self->_collectionCreateButtonTitle, "copy");
    collectionCreateButtonTitle = v4->_collectionCreateButtonTitle;
    v4->_collectionCreateButtonTitle = (NSString *)v5;

    -[DOCAppearance setBrowserUserInterfaceStyle:](v4, "setBrowserUserInterfaceStyle:", -[DOCAppearance browserUserInterfaceStyle](self, "browserUserInterfaceStyle"));
    -[DOCAppearance setForceClearBackground:](v4, "setForceClearBackground:", -[DOCAppearance forceClearBackground](self, "forceClearBackground"));
  }
  return v4;
}

- (void)setShowsCreateButton:(BOOL)a3
{
  self->_showsCreateButton = a3;
}

- (DOCAppearance)init
{
  char *v2;
  double *v3;
  _BOOL4 v4;
  double v5;
  char *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DOCAppearance;
  v2 = -[DOCAppearance init](&v8, sel_init);
  v3 = (double *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 24) = xmmword_209085480;
    v4 = DOCScreenSizePad12_9();
    v5 = 40.0;
    if (!v4)
      v5 = 30.0;
    v3[5] = v5;
    *((_BYTE *)v3 + 18) = 0;
    *((_WORD *)v3 + 8) = 0;
    v3[6] = 0.0;
    v3[7] = 0.75;
    v6 = v3;
  }

  return (DOCAppearance *)v3;
}

- (BOOL)isEqual:(id)a3
{
  DOCAppearance *v4;
  uint64_t v5;
  char v6;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _BOOL4 v20;
  _BOOL4 v21;
  _BOOL4 v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v4 = (DOCAppearance *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 != objc_opt_class())
      goto LABEL_3;
    -[DOCAppearance defaultDocumentAspectRatio](self, "defaultDocumentAspectRatio");
    v9 = v8;
    -[DOCAppearance defaultDocumentAspectRatio](v4, "defaultDocumentAspectRatio");
    if (v9 != v10)
      goto LABEL_3;
    -[DOCAppearance compactHorizontalTableStackSpacing](self, "compactHorizontalTableStackSpacing");
    v12 = v11;
    -[DOCAppearance compactHorizontalTableStackSpacing](v4, "compactHorizontalTableStackSpacing");
    if (v12 != v13)
      goto LABEL_3;
    -[DOCAppearance regularHorizontalTableStackSpacing](self, "regularHorizontalTableStackSpacing");
    v15 = v14;
    -[DOCAppearance regularHorizontalTableStackSpacing](v4, "regularHorizontalTableStackSpacing");
    if (v15 != v16)
      goto LABEL_3;
    -[DOCAppearance fullHorizontalTableStackSpacing](self, "fullHorizontalTableStackSpacing");
    v18 = v17;
    -[DOCAppearance fullHorizontalTableStackSpacing](v4, "fullHorizontalTableStackSpacing");
    if (v18 == v19
      && (v20 = -[DOCAppearance showsCreateButton](self, "showsCreateButton"),
          v20 == -[DOCAppearance showsCreateButton](v4, "showsCreateButton"))
      && (v21 = -[DOCAppearance shouldShowFileExtensions](self, "shouldShowFileExtensions"),
          v21 == -[DOCAppearance shouldShowFileExtensions](v4, "shouldShowFileExtensions"))
      && (v22 = -[DOCAppearance forceClearBackground](self, "forceClearBackground"),
          v22 == -[DOCAppearance forceClearBackground](v4, "forceClearBackground"))
      && (v23 = -[DOCAppearance browserUserInterfaceStyle](self, "browserUserInterfaceStyle"),
          v23 == -[DOCAppearance browserUserInterfaceStyle](v4, "browserUserInterfaceStyle")))
    {
      -[DOCAppearance collectionCreateButtonTitle](self, "collectionCreateButtonTitle");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[DOCAppearance collectionCreateButtonTitle](v4, "collectionCreateButtonTitle");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24 == v25)
      {
        v6 = 1;
      }
      else
      {
        -[DOCAppearance collectionCreateButtonTitle](self, "collectionCreateButtonTitle");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[DOCAppearance collectionCreateButtonTitle](v4, "collectionCreateButtonTitle");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v26, "isEqual:", v27);

      }
    }
    else
    {
LABEL_3:
      v6 = 0;
    }
  }

  return v6;
}

- (BOOL)shouldShowFileExtensions
{
  return self->_shouldShowFileExtensions;
}

- (UIColor)backgroundColor
{
  void *v3;

  if (-[DOCAppearance forceClearBackground](self, "forceClearBackground"))
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = -[DOCAppearance browserUserInterfaceStyle](self, "browserUserInterfaceStyle");
    if (v3 == (void *)2)
      goto LABEL_6;
    if (v3 == (void *)1)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithDynamicProvider:", &__block_literal_global_11);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return (UIColor *)v3;
    }
    if (!v3)
    {
LABEL_6:
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return (UIColor *)v3;
}

- (unint64_t)browserUserInterfaceStyle
{
  return self->_browserUserInterfaceStyle;
}

- (BOOL)forceClearBackground
{
  return self->_forceClearBackground;
}

- (BOOL)showsCreateButton
{
  return self->_showsCreateButton;
}

- (double)regularHorizontalTableStackSpacing
{
  return self->_regularHorizontalTableStackSpacing;
}

- (double)fullHorizontalTableStackSpacing
{
  return self->_fullHorizontalTableStackSpacing;
}

- (double)defaultDocumentAspectRatio
{
  return self->_defaultDocumentAspectRatio;
}

- (double)compactHorizontalTableStackSpacing
{
  return self->_compactHorizontalTableStackSpacing;
}

- (NSString)collectionCreateButtonTitle
{
  NSString *collectionCreateButtonTitle;
  void *v4;
  NSString *v5;
  NSString *v6;

  collectionCreateButtonTitle = self->_collectionCreateButtonTitle;
  if (!collectionCreateButtonTitle)
  {
    _DocumentManagerBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Create Document"), CFSTR("Create Document"), CFSTR("Localizable"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_collectionCreateButtonTitle;
    self->_collectionCreateButtonTitle = v5;

    collectionCreateButtonTitle = self->_collectionCreateButtonTitle;
  }
  return collectionCreateButtonTitle;
}

- (void)setShouldShowFileExtensions:(BOOL)a3
{
  self->_shouldShowFileExtensions = a3;
}

- (void)setRegularHorizontalTableStackSpacing:(double)a3
{
  self->_regularHorizontalTableStackSpacing = a3;
}

- (void)setFullHorizontalTableStackSpacing:(double)a3
{
  self->_fullHorizontalTableStackSpacing = a3;
}

- (void)setForceClearBackground:(BOOL)a3
{
  self->_forceClearBackground = a3;
}

- (void)setDefaultDocumentAspectRatio:(double)a3
{
  self->_defaultDocumentAspectRatio = a3;
}

- (void)setCompactHorizontalTableStackSpacing:(double)a3
{
  self->_compactHorizontalTableStackSpacing = a3;
}

- (void)setBrowserUserInterfaceStyle:(unint64_t)a3
{
  self->_browserUserInterfaceStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionCreateButtonTitle, 0);
}

- (void)setCollectionCreateButtonTitle:(id)a3
{
  NSString *v4;
  NSString *collectionCreateButtonTitle;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  collectionCreateButtonTitle = self->_collectionCreateButtonTitle;
  self->_collectionCreateButtonTitle = v4;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DOCAppearance)initWithCoder:(id)a3
{
  id v4;
  DOCAppearance *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  void *v10;
  DOCAppearance *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DOCAppearance;
  v5 = -[DOCAppearance init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("defaultDocumentAspectRatio"));
    -[DOCAppearance setDefaultDocumentAspectRatio:](v5, "setDefaultDocumentAspectRatio:", v6);
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("regularHorizontalTableStackSpacing"));
    -[DOCAppearance setRegularHorizontalTableStackSpacing:](v5, "setRegularHorizontalTableStackSpacing:", v7);
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("fullHorizontalTableStackSpacing"));
    -[DOCAppearance setFullHorizontalTableStackSpacing:](v5, "setFullHorizontalTableStackSpacing:", v8);
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("compactHorizontalTableStackSpacing"));
    -[DOCAppearance setCompactHorizontalTableStackSpacing:](v5, "setCompactHorizontalTableStackSpacing:", v9);
    -[DOCAppearance setShowsCreateButton:](v5, "setShowsCreateButton:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showsCreateButton")));
    -[DOCAppearance setShouldShowFileExtensions:](v5, "setShouldShowFileExtensions:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldShowFileExtensions")));
    -[DOCAppearance setForceClearBackground:](v5, "setForceClearBackground:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("forceClearBackground")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("collectionCreateButtonTitle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCAppearance setCollectionCreateButtonTitle:](v5, "setCollectionCreateButtonTitle:", v10);

    -[DOCAppearance setBrowserUserInterfaceStyle:](v5, "setBrowserUserInterfaceStyle:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("browserUserInterfaceStyle")));
    v11 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v4 = a3;
  -[DOCAppearance defaultDocumentAspectRatio](self, "defaultDocumentAspectRatio");
  *(float *)&v5 = v5;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("defaultDocumentAspectRatio"), v5);
  -[DOCAppearance compactHorizontalTableStackSpacing](self, "compactHorizontalTableStackSpacing");
  *(float *)&v6 = v6;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("compactHorizontalTableStackSpacing"), v6);
  -[DOCAppearance regularHorizontalTableStackSpacing](self, "regularHorizontalTableStackSpacing");
  *(float *)&v7 = v7;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("regularHorizontalTableStackSpacing"), v7);
  -[DOCAppearance fullHorizontalTableStackSpacing](self, "fullHorizontalTableStackSpacing");
  *(float *)&v8 = v8;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("fullHorizontalTableStackSpacing"), v8);
  objc_msgSend(v4, "encodeInteger:forKey:", -[DOCAppearance browserUserInterfaceStyle](self, "browserUserInterfaceStyle"), CFSTR("browserUserInterfaceStyle"));
  objc_msgSend(v4, "encodeBool:forKey:", -[DOCAppearance showsCreateButton](self, "showsCreateButton"), CFSTR("showsCreateButton"));
  objc_msgSend(v4, "encodeBool:forKey:", -[DOCAppearance shouldShowFileExtensions](self, "shouldShowFileExtensions"), CFSTR("shouldShowFileExtensions"));
  objc_msgSend(v4, "encodeBool:forKey:", -[DOCAppearance forceClearBackground](self, "forceClearBackground"), CFSTR("forceClearBackground"));
  -[DOCAppearance collectionCreateButtonTitle](self, "collectionCreateButtonTitle");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("collectionCreateButtonTitle"));

}

+ (DOCAppearance)documentsPickerAppearance
{
  return (DOCAppearance *)(id)objc_opt_new();
}

+ (DOCAppearance)recentsPopoverAppearance
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setForceClearBackground:", 1);
  objc_msgSend(v2, "setShowsCreateButton:", 0);
  return (DOCAppearance *)v2;
}

id __52__DOCAppearance_UserInterfaceStyle__backgroundColor__block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "userInterfaceStyle") == 1)
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondarySystemBackgroundColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
