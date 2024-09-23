@implementation FCTextInfo

+ (id)textInfoFromJSONValues:(id)a3 URLGenerator:(id)a4
{
  id v5;
  id v6;
  FCTextInfo *v7;
  void *v8;
  float v9;
  void *v10;
  float v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = objc_alloc_init(FCTextInfo);
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lineHeightMultiplier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    -[FCTextInfo setLineHeightMultiplier:](v7, "setLineHeightMultiplier:", v9);

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("fontSizeAdjustment"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    -[FCTextInfo setFontSizeAdjustment:](v7, "setFontSizeAdjustment:", (uint64_t)v11);

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("fontColor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
    {
      +[FCColor colorWithHexString:](FCColor, "colorWithHexString:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCTextInfo setColor:](v7, "setColor:", v13);

    }
    else
    {
      -[FCTextInfo setColor:](v7, "setColor:", 0);
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("fontResourceID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v6, "generateURLForResourceID:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("fontName"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCLoadableFont loadableFontWithName:url:](FCLoadableFont, "loadableFontWithName:url:", v16, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCTextInfo setFont:](v7, "setFont:", v17);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  FCTextInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = -[FCTextInfo init](+[FCTextInfo allocWithZone:](FCTextInfo, "allocWithZone:"), "init");
  -[FCTextInfo lineHeightMultiplier](self, "lineHeightMultiplier");
  -[FCTextInfo setLineHeightMultiplier:](v5, "setLineHeightMultiplier:");
  -[FCTextInfo setFontSizeAdjustment:](v5, "setFontSizeAdjustment:", -[FCTextInfo fontSizeAdjustment](self, "fontSizeAdjustment"));
  -[FCTextInfo color](self, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[FCTextInfo setColor:](v5, "setColor:", v7);

  -[FCTextInfo font](self, "font");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  -[FCTextInfo setFont:](v5, "setFont:", v9);

  return v5;
}

- (void)setLineHeightMultiplier:(double)a3
{
  self->_lineHeightMultiplier = a3;
}

- (void)setFontSizeAdjustment:(int64_t)a3
{
  self->_fontSizeAdjustment = a3;
}

- (void)setFont:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (FCLoadableFont)font
{
  return self->_font;
}

- (double)lineHeightMultiplier
{
  return self->_lineHeightMultiplier;
}

- (int64_t)fontSizeAdjustment
{
  return self->_fontSizeAdjustment;
}

- (FCColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_font, 0);
}

- (double)fontSizeWithInitialFontSize:(double)a3
{
  return (double)-[FCTextInfo fontSizeAdjustment](self, "fontSizeAdjustment") + a3;
}

@end
