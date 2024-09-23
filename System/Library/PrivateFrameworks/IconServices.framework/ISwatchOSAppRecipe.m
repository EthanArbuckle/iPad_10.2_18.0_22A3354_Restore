@implementation ISwatchOSAppRecipe

- (ISwatchOSAppRecipe)init
{
  ISwatchOSAppRecipe *v2;
  ISwatchOSAppRecipe *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ISwatchOSAppRecipe;
  v2 = -[ISwatchOSAppRecipe init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[ISwatchOSAppRecipe setShouldApplyMask:](v2, "setShouldApplyMask:", 1);
  return v3;
}

- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  ISLayer *v7;
  ISContentLayer *v8;
  void *v9;
  ISContentLayer *v10;
  ISContentLayer *v11;
  void *v12;

  height = a3.height;
  width = a3.width;
  v7 = objc_alloc_init(ISLayer);
  -[ISLayer setSize:](v7, "setSize:", width, height);
  -[ISLayer setName:](v7, "setName:", CFSTR("layer"));
  v8 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v8, "setName:", CFSTR("Background"));
  -[ISLayer setSize:](v8, "setSize:", width, height);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
  -[ISContentLayer setContent:](v8, "setContent:", v9);

  -[ISLayer addSublayer:](v7, "addSublayer:", v8);
  v10 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v10, "setName:", CFSTR("Image"));
  -[ISLayer setSize:](v10, "setSize:", width, height);
  -[ISContentLayer setContent:](v10, "setContent:", CFSTR("kISPrimaryResourceKey"));
  -[ISLayer addSublayer:](v7, "addSublayer:", v10);

  if (-[ISwatchOSAppRecipe shouldApplyMask](self, "shouldApplyMask"))
  {
    v11 = objc_alloc_init(ISContentLayer);
    -[ISLayer setSize:](v11, "setSize:", width, height);
    -[ISLayer setName:](v11, "setName:", CFSTR("mask layer"));
    +[ISShapeCompositorResource circleShape](ISShapeCompositorResource, "circleShape");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISContentLayer setContent:](v11, "setContent:", v12);

    -[ISLayer setMask:](v7, "setMask:", v11);
  }
  return v7;
}

- (IFIconSpecification)iconSpecification
{
  return (IFIconSpecification *)objc_msgSend(MEMORY[0x1E0D3A7B8], "watchAppIconSpecification");
}

- (BOOL)shouldApplyMask
{
  return self->shouldApplyMask;
}

- (void)setShouldApplyMask:(BOOL)a3
{
  self->shouldApplyMask = a3;
}

@end
