@implementation SUUIColorScheme

- (SUUIColorScheme)initWithColorSchemeDictionary:(id)a3
{
  id v4;
  SUUIColorScheme *v5;
  void *v6;
  uint64_t v7;
  UIColor *backgroundColor;
  void *v9;
  uint64_t v10;
  UIColor *primaryTextColor;
  void *v12;
  uint64_t v13;
  UIColor *secondaryTextColor;
  uint64_t v15;
  UIColor *highlightedTextColor;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SUUIColorScheme;
  v5 = -[SUUIColorScheme init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("backgroundColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      SUUIColorWithHTMLCode(v6);
      v7 = objc_claimAutoreleasedReturnValue();
      backgroundColor = v5->_backgroundColor;
      v5->_backgroundColor = (UIColor *)v7;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("primaryTextColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      SUUIColorWithHTMLCode(v9);
      v10 = objc_claimAutoreleasedReturnValue();
      primaryTextColor = v5->_primaryTextColor;
      v5->_primaryTextColor = (UIColor *)v10;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("titleTextColor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      SUUIColorWithHTMLCode(v12);
      v13 = objc_claimAutoreleasedReturnValue();
      secondaryTextColor = v5->_secondaryTextColor;
      v5->_secondaryTextColor = (UIColor *)v13;

    }
    v20 = 0.0;
    v21 = 0.0;
    v18 = 0.0;
    v19 = 0.0;
    -[UIColor getHue:saturation:brightness:alpha:](v5->_primaryTextColor, "getHue:saturation:brightness:alpha:", &v21, &v20, &v19, &v18);
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithHue:saturation:brightness:alpha:", v21, v20, v19 + dbl_241EFBBD0[v19 < 0.5], v18);
    v15 = objc_claimAutoreleasedReturnValue();
    highlightedTextColor = v5->_highlightedTextColor;
    v5->_highlightedTextColor = (UIColor *)v15;

  }
  return v5;
}

- (int64_t)schemeStyle
{
  return SUUIColorSchemeStyleForColor(self->_backgroundColor);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[UIColor copyWithZone:](self->_backgroundColor, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[UIColor copyWithZone:](self->_highlightedTextColor, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[UIColor copyWithZone:](self->_primaryTextColor, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[UIColor copyWithZone:](self->_secondaryTextColor, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUUIColorScheme)initWithCoder:(id)a3
{
  id v4;
  SUUIColorScheme *v5;
  uint64_t v6;
  uint64_t v7;
  UIColor *backgroundColor;
  uint64_t v9;
  UIColor *primaryTextColor;
  uint64_t v11;
  UIColor *secondaryTextColor;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SUUIColorScheme;
  v5 = -[SUUIColorScheme init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("bgc"));
    v7 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (UIColor *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("ptc"));
    v9 = objc_claimAutoreleasedReturnValue();
    primaryTextColor = v5->_primaryTextColor;
    v5->_primaryTextColor = (UIColor *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("ttc"));
    v11 = objc_claimAutoreleasedReturnValue();
    secondaryTextColor = v5->_secondaryTextColor;
    v5->_secondaryTextColor = (UIColor *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  UIColor *backgroundColor;
  id v5;

  backgroundColor = self->_backgroundColor;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", backgroundColor, CFSTR("bgc"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_primaryTextColor, CFSTR("ptc"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secondaryTextColor, CFSTR("ttc"));

}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (UIColor)highlightedTextColor
{
  return self->_highlightedTextColor;
}

- (void)setHighlightedTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (UIColor)primaryTextColor
{
  return self->_primaryTextColor;
}

- (void)setPrimaryTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIColor)secondaryTextColor
{
  return self->_secondaryTextColor;
}

- (void)setSecondaryTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);
  objc_storeStrong((id *)&self->_primaryTextColor, 0);
  objc_storeStrong((id *)&self->_highlightedTextColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
