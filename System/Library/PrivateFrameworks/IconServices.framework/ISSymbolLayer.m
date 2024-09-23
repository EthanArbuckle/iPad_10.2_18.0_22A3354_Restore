@implementation ISSymbolLayer

- (ISSymbolLayer)init
{
  ISSymbolLayer *v2;
  uint64_t v3;
  IFColor *color;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ISSymbolLayer;
  v2 = -[ISLayer init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithWhite:alpha:", 0.0, 1.0);
    color = v2->_color;
    v2->_color = (IFColor *)v3;

    v2->_symbolSize = 2;
    v2->_symbolWeight = 4;
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

- (ISCompositorResource)symbol
{
  return self->_symbol;
}

- (void)setSymbol:(id)a3
{
  objc_storeStrong((id *)&self->_symbol, a3);
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (unint64_t)symbolSize
{
  return self->_symbolSize;
}

- (void)setSymbolSize:(unint64_t)a3
{
  self->_symbolSize = a3;
}

- (int64_t)symbolWeight
{
  return self->_symbolWeight;
}

- (void)setSymbolWeight:(int64_t)a3
{
  self->_symbolWeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbol, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end
