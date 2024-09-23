@implementation CLKTextProviderStyle

+ (id)styleWithFont:(id)a3 smallCapsBaseFont:(id)a4 uppercase:(BOOL)a5 otherAttributes:(id)a6 minimumScaleFactor:(double)a7 shouldEmbedTintColor:(BOOL)a8 shouldStyleForTritium:(BOOL)a9
{
  _BOOL8 v9;
  void *v10;

  v9 = a9;
  objc_msgSend(a1, "styleWithFont:smallCapsBaseFont:uppercase:otherAttributes:minimumScaleFactor:shouldEmbedTintColor:", a3, a4, a5, a6, a8, a7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setShouldStyleForTritium:", v9);
  return v10;
}

+ (id)styleWithFont:(id)a3 smallCapsBaseFont:(id)a4 uppercase:(BOOL)a5 otherAttributes:(id)a6 minimumScaleFactor:(double)a7 shouldEmbedTintColor:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v10;
  id v13;
  id v14;
  id v15;
  void *v16;

  v8 = a8;
  v10 = a5;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setFont:", v15);

  objc_msgSend(v16, "setSmallCapsBaseFont:", v14);
  objc_msgSend(v16, "setUppercase:", v10);
  objc_msgSend(v16, "setOtherAttributes:", v13);

  objc_msgSend(v16, "setMinimumScaleFactor:", a7);
  objc_msgSend(v16, "setShouldEmbedTintColors:", v8);
  return v16;
}

+ (id)styleWithFont:(id)a3 smallCapsBaseFont:(id)a4 uppercase:(BOOL)a5 otherAttributes:(id)a6 minimumScaleFactor:(double)a7
{
  return (id)objc_msgSend(a1, "styleWithFont:smallCapsBaseFont:uppercase:otherAttributes:minimumScaleFactor:shouldEmbedTintColor:", a3, a4, a5, a6, 0, a7);
}

+ (id)styleWithFont:(id)a3 smallCapsBaseFont:(id)a4 uppercase:(BOOL)a5 otherAttributes:(id)a6
{
  return (id)objc_msgSend(a1, "styleWithFont:smallCapsBaseFont:uppercase:otherAttributes:minimumScaleFactor:shouldEmbedTintColor:", a3, a4, a5, a6, 0, 0.0);
}

+ (id)otherAttributesWithParagraphStyle:(id)a3 kerning:(double)a4
{
  id v5;
  void *v6;
  double v7;
  void *v8;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BEBD298]);

  v7 = -a4;
  if (a4 >= 0.0)
    v7 = a4;
  if (v7 > 0.00000011920929)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BEBD280]);

  }
  return v6;
}

+ (id)otherAttributesWithParagraphStyle:(id)a3
{
  return (id)objc_msgSend(a1, "otherAttributesWithParagraphStyle:kerning:", a3, 0.0);
}

- (CLKFont)smallCapsBaseFont
{
  CLKFont *smallCapsBaseFont;

  smallCapsBaseFont = self->_smallCapsBaseFont;
  if (!smallCapsBaseFont)
    smallCapsBaseFont = self->_font;
  return smallCapsBaseFont;
}

- (CLKFont)monospacedDigitsFont
{
  CLKFont *monospacedDigitsFont;

  monospacedDigitsFont = self->_monospacedDigitsFont;
  if (!monospacedDigitsFont)
    monospacedDigitsFont = self->_font;
  return monospacedDigitsFont;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  v3 = -[CLKFont hash](self->_font, "hash");
  v4 = -[CLKFont hash](self->_smallCapsBaseFont, "hash") ^ v3;
  v5 = v4 ^ -[NSDictionary hash](self->_otherAttributes, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_minimumScaleFactor);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_shouldEmbedTintColors);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash") ^ (self->_uppercase + (unint64_t)self->_shouldStyleForTritium);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  CLKTextProviderStyle *v4;
  BOOL v5;

  v4 = (CLKTextProviderStyle *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_10;
  if (v4 == self)
  {
    v5 = 1;
    goto LABEL_11;
  }
  if (-[CLKFont isEqual:](v4->_font, "isEqual:", self->_font)
    && CLKEqualObjects(v4->_smallCapsBaseFont, self->_smallCapsBaseFont)
    && v4->_shouldStyleForTritium == self->_shouldStyleForTritium
    && v4->_uppercase == self->_uppercase
    && CLKEqualObjects(v4->_otherAttributes, self->_otherAttributes)
    && CLKFloatEqualsFloat(v4->_minimumScaleFactor, self->_minimumScaleFactor))
  {
    v5 = v4->_shouldEmbedTintColors == self->_shouldEmbedTintColors;
  }
  else
  {
LABEL_10:
    v5 = 0;
  }
LABEL_11:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CLKTextProviderStyle *v4;
  uint64_t v5;
  CLKFont *font;
  uint64_t v7;
  CLKFont *smallCapsBaseFont;
  uint64_t v9;
  NSDictionary *otherAttributes;

  v4 = -[CLKTextProviderStyle init](+[CLKTextProviderStyle allocWithZone:](CLKTextProviderStyle, "allocWithZone:", a3), "init");
  v5 = -[CLKFont copy](self->_font, "copy");
  font = v4->_font;
  v4->_font = (CLKFont *)v5;

  v7 = -[CLKFont copy](self->_smallCapsBaseFont, "copy");
  smallCapsBaseFont = v4->_smallCapsBaseFont;
  v4->_smallCapsBaseFont = (CLKFont *)v7;

  v4->_uppercase = self->_uppercase;
  v9 = -[NSDictionary copy](self->_otherAttributes, "copy");
  otherAttributes = v4->_otherAttributes;
  v4->_otherAttributes = (NSDictionary *)v9;

  v4->_minimumScaleFactor = self->_minimumScaleFactor;
  v4->_shouldEmbedTintColors = self->_shouldEmbedTintColors;
  v4->_shouldStyleForTritium = self->_shouldStyleForTritium;
  return v4;
}

- (CLKFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
}

- (void)setMonospacedDigitsFont:(id)a3
{
  objc_storeStrong((id *)&self->_monospacedDigitsFont, a3);
}

- (void)setSmallCapsBaseFont:(id)a3
{
  objc_storeStrong((id *)&self->_smallCapsBaseFont, a3);
}

- (BOOL)uppercase
{
  return self->_uppercase;
}

- (void)setUppercase:(BOOL)a3
{
  self->_uppercase = a3;
}

- (NSDictionary)otherAttributes
{
  return self->_otherAttributes;
}

- (void)setOtherAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_otherAttributes, a3);
}

- (double)minimumScaleFactor
{
  return self->_minimumScaleFactor;
}

- (void)setMinimumScaleFactor:(double)a3
{
  self->_minimumScaleFactor = a3;
}

- (BOOL)shouldEmbedTintColors
{
  return self->_shouldEmbedTintColors;
}

- (void)setShouldEmbedTintColors:(BOOL)a3
{
  self->_shouldEmbedTintColors = a3;
}

- (BOOL)shouldStyleForTritium
{
  return self->_shouldStyleForTritium;
}

- (void)setShouldStyleForTritium:(BOOL)a3
{
  self->_shouldStyleForTritium = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherAttributes, 0);
  objc_storeStrong((id *)&self->_smallCapsBaseFont, 0);
  objc_storeStrong((id *)&self->_monospacedDigitsFont, 0);
  objc_storeStrong((id *)&self->_font, 0);
}

@end
