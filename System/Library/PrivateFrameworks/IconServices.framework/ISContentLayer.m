@implementation ISContentLayer

- (ISContentLayer)init
{
  ISContentLayer *v2;
  uint64_t v3;
  IFColor *backgroundColor;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ISContentLayer;
  v2 = -[ISLayer init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithWhite:alpha:", 0.0, 0.0);
    backgroundColor = v2->_backgroundColor;
    v2->_backgroundColor = (IFColor *)v3;

    v2->_acceptSymbol = 1;
  }
  return v2;
}

- (IFColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (ISCompositorResource)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
}

- (BOOL)acceptSymbol
{
  return self->_acceptSymbol;
}

- (void)setAcceptSymbol:(BOOL)a3
{
  self->_acceptSymbol = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
