@implementation ISOverlayEmbossRecipe

- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  ISContentLayer *v7;
  void *v8;
  ISContentLayer *v9;

  height = a3.height;
  width = a3.width;
  v7 = objc_alloc_init(ISContentLayer);
  -[ISLayer setSize:](v7, "setSize:", width, height);
  -[ISLayer setName:](v7, "setName:", CFSTR("layer"));
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setVariant:", self->_variant);
  -[ISLayer setEffect:](v7, "setEffect:", v8);
  v9 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v9, "setName:", CFSTR("Center Emboss"));
  -[ISLayer setSize:](v9, "setSize:", width, height);
  -[ISContentLayer setContent:](v9, "setContent:", CFSTR("kISPrimaryResourceKey"));
  -[ISLayer addSublayer:](v7, "addSublayer:", v9);

  return v7;
}

- (unint64_t)variant
{
  return self->_variant;
}

- (void)setVariant:(unint64_t)a3
{
  self->_variant = a3;
}

@end
