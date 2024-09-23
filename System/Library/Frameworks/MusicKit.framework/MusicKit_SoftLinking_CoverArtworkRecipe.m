@implementation MusicKit_SoftLinking_CoverArtworkRecipe

- (MusicKit_SoftLinking_CoverArtworkRecipe)initWithExpression:(int64_t)a3 version:(id)a4 backgroundColor:(CGColor *)a5 primaryColor:(CGColor *)a6 secondaryColor:(CGColor *)a7 tertiaryColor:(CGColor *)a8 textColor:(CGColor *)a9
{
  id v16;
  MusicKit_SoftLinking_CoverArtworkRecipe *v17;
  MusicKit_SoftLinking_CoverArtworkRecipe *v18;
  objc_super v20;

  v16 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MusicKit_SoftLinking_CoverArtworkRecipe;
  v17 = -[MusicKit_SoftLinking_CoverArtworkRecipe init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_expression = a3;
    objc_storeStrong((id *)&v17->_version, a4);
    objc_storeStrong((id *)&v18->_backgroundColor, a5);
    objc_storeStrong((id *)&v18->_primaryColor, a6);
    objc_storeStrong((id *)&v18->_secondaryColor, a7);
    objc_storeStrong((id *)&v18->_tertiaryColor, a8);
    objc_storeStrong((id *)&v18->_textColor, a9);
  }

  return v18;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  -[MusicKit_SoftLinking_CoverArtworkRecipe stringRepresentation](self, "stringRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("; %@"), v7);

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (NSString)stringRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  -[MusicKit_SoftLinking_CoverArtworkRecipe _stringFromExpression:](self, "_stringFromExpression:", self->_expression);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("expression = %@ (%ld)"), v4, self->_expression);

  objc_msgSend(v5, "appendFormat:", CFSTR("; version = %@"), self->_version);
  if (self->_backgroundColor)
  {
    -[MusicKit_SoftLinking_CoverArtworkRecipe _stringFromColor:](self, "_stringFromColor:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("; backgroundColor = %@"), v6);

  }
  if (self->_primaryColor)
  {
    -[MusicKit_SoftLinking_CoverArtworkRecipe _stringFromColor:](self, "_stringFromColor:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("; primaryColor = %@"), v7);

  }
  if (self->_secondaryColor)
  {
    -[MusicKit_SoftLinking_CoverArtworkRecipe _stringFromColor:](self, "_stringFromColor:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("; secondaryColor = %@"), v8);

  }
  if (self->_tertiaryColor)
  {
    -[MusicKit_SoftLinking_CoverArtworkRecipe _stringFromColor:](self, "_stringFromColor:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("; tertiaryColor = %@"), v9);

  }
  if (self->_textColor)
  {
    -[MusicKit_SoftLinking_CoverArtworkRecipe _stringFromColor:](self, "_stringFromColor:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("; textColor = %@"), v10);

  }
  return (NSString *)v5;
}

- (id)createArtworkCatalogWithPlaylistName:(id)a3
{
  id v4;
  MusicKit_SoftLinking_CoverArtworkToken *v5;
  void *v6;

  v4 = a3;
  v5 = -[MusicKit_SoftLinking_CoverArtworkToken initWithCoverArtworkRecipe:playlistName:]([MusicKit_SoftLinking_CoverArtworkToken alloc], "initWithCoverArtworkRecipe:playlistName:", self, v4);

  if (v5)
  {
    +[MusicKit_SoftLinking artworkCatalogWithCoverArtworkToken:](MusicKit_SoftLinking, "artworkCatalogWithCoverArtworkToken:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_stringFromExpression:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7)
    return 0;
  else
    return *(&off_24CD1CF60 + a3 - 1);
}

- (id)_stringFromColor:(CGColor *)a3
{
  size_t NumberOfComponents;
  const CGFloat *Components;
  uint64_t v6;

  NumberOfComponents = CGColorGetNumberOfComponents(a3);
  Components = CGColorGetComponents(a3);
  v6 = NumberOfComponents - 2;
  if (NumberOfComponents - 2 >= 2)
    v6 = 2;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("#%02X%02X%02X"), (int)(*Components * 255.0), (int)(Components[NumberOfComponents != 2] * 255.0), (int)(Components[v6] * 255.0));
}

- (int64_t)expression
{
  return self->_expression;
}

- (NSString)version
{
  return self->_version;
}

- (CGColor)backgroundColor
{
  return self->_backgroundColor;
}

- (CGColor)primaryColor
{
  return self->_primaryColor;
}

- (CGColor)secondaryColor
{
  return self->_secondaryColor;
}

- (CGColor)tertiaryColor
{
  return self->_tertiaryColor;
}

- (CGColor)textColor
{
  return self->_textColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_tertiaryColor, 0);
  objc_storeStrong((id *)&self->_secondaryColor, 0);
  objc_storeStrong((id *)&self->_primaryColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

@end
