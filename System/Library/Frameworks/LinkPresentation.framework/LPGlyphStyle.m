@implementation LPGlyphStyle

- (LPGlyphStyle)init
{
  LPGlyphStyle *v2;
  LPGlyphStyle *v3;
  LPPadding *v4;
  LPPadding *padding;
  LPImageViewStyle *v6;
  LPImageViewStyle *imageStyle;
  uint64_t v8;
  LPPointUnit *baselineOffset;
  LPGlyphStyle *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)LPGlyphStyle;
  v2 = -[LPGlyphStyle init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_opacity = 1.0;
    v4 = objc_alloc_init(LPPadding);
    padding = v3->_padding;
    v3->_padding = v4;

    v6 = objc_alloc_init(LPImageViewStyle);
    imageStyle = v3->_imageStyle;
    v3->_imageStyle = v6;

    +[LPPointUnit zero](LPPointUnit, "zero");
    v8 = objc_claimAutoreleasedReturnValue();
    baselineOffset = v3->_baselineOffset;
    v3->_baselineOffset = (LPPointUnit *)v8;

    v10 = v3;
  }

  return v3;
}

- (id)initSearchGlyph
{
  LPGlyphStyle *v2;
  uint64_t v3;
  LPImage *image;
  LPPointUnit *v5;
  void *v6;
  LPPointUnit *v7;
  LPPointUnit *baselineOffset;
  LPSize *v9;
  void *v10;
  LPGlyphStyle *v11;

  v2 = -[LPGlyphStyle init](self, "init");
  if (v2)
  {
    +[LPResources searchGlyph](LPResources, "searchGlyph");
    v3 = objc_claimAutoreleasedReturnValue();
    image = v2->_image;
    v2->_image = (LPImage *)v3;

    v2->_opacity = 0.5;
    v5 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", -4.0);
    -[LPPadding setLeading:](v2->_padding, "setLeading:", v5);

    +[LPPointUnit zero](LPPointUnit, "zero");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPPadding setTrailing:](v2->_padding, "setTrailing:", v6);

    v7 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", -7.0);
    baselineOffset = v2->_baselineOffset;
    v2->_baselineOffset = v7;

    v9 = -[LPSize initWithSquareSize:]([LPSize alloc], "initWithSquareSize:", 20.0);
    -[LPImageViewStyle setFixedSize:](v2->_imageStyle, "setFixedSize:", v9);

    -[LPImageViewStyle setFilter:](v2->_imageStyle, "setFilter:", 4);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPImageViewStyle setMaskColor:](v2->_imageStyle, "setMaskColor:", v10);

    v11 = v2;
  }

  return v2;
}

- (LPImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (LPPadding)padding
{
  return self->_padding;
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
}

- (LPImageViewStyle)imageStyle
{
  return self->_imageStyle;
}

- (LPPointUnit)baselineOffset
{
  return self->_baselineOffset;
}

- (void)setBaselineOffset:(id)a3
{
  objc_storeStrong((id *)&self->_baselineOffset, a3);
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_baselineOffset, 0);
  objc_storeStrong((id *)&self->_imageStyle, 0);
  objc_storeStrong((id *)&self->_padding, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
