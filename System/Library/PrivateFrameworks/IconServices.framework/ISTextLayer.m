@implementation ISTextLayer

- (ISTextLayer)init
{
  ISTextLayer *v2;
  uint64_t v3;
  IFColor *color;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ISTextLayer;
  v2 = -[ISLayer init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithWhite:alpha:", 0.0, 1.0);
    color = v2->_color;
    v2->_color = (IFColor *)v3;

  }
  return v2;
}

- (IFColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (NSString)fontName
{
  return self->_fontName;
}

- (void)setFontName:(id)a3
{
  objc_storeStrong((id *)&self->_fontName, a3);
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontName, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end
