@implementation ISGenericRecipe

- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  ISContentLayer *v8;
  ISContentLayer *v9;
  void *v10;
  ISBorderEffect *v11;

  height = a3.height;
  width = a3.width;
  v8 = objc_alloc_init(ISContentLayer);
  -[ISLayer setSize:](v8, "setSize:", width, height);
  -[ISLayer setName:](v8, "setName:", CFSTR("layer"));
  v9 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v9, "setName:", CFSTR("Base layer"));
  -[ISLayer setSize:](v9, "setSize:", width, height);
  -[ISContentLayer setContent:](v9, "setContent:", CFSTR("kISPrimaryResourceKey"));
  -[ISLayer addSublayer:](v8, "addSublayer:", v9);

  if (-[ISGenericRecipe borderWidth](self, "borderWidth"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithWhite:alpha:", 0.5, 1.0);
    v11 = -[ISBorderEffect initWithLineWidth:color:]([ISBorderEffect alloc], "initWithLineWidth:color:", v10, (double)-[ISGenericRecipe borderWidth](self, "borderWidth") * a4);
    -[ISLayer setEffect:](v8, "setEffect:", v11);

  }
  return v8;
}

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)setBackgroundStyle:(unint64_t)a3
{
  self->_backgroundStyle = a3;
}

- (BOOL)templateVariant
{
  return self->_templateVariant;
}

- (void)setTemplateVariant:(BOOL)a3
{
  self->_templateVariant = a3;
}

- (BOOL)selectedVariant
{
  return self->_selectedVariant;
}

- (void)setSelectedVariant:(BOOL)a3
{
  self->_selectedVariant = a3;
}

- (unint64_t)borderWidth
{
  return self->_borderWidth;
}

- (void)setBorderWidth:(unint64_t)a3
{
  self->_borderWidth = a3;
}

@end
