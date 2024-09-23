@implementation ISrOSAppRecipe

- (ISrOSAppRecipe)init
{
  ISrOSAppRecipe *v2;
  ISrOSAppRecipe *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ISrOSAppRecipe;
  v2 = -[ISrOSAppRecipe init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[ISrOSAppRecipe setShouldApplyMask:](v2, "setShouldApplyMask:", 1);
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
  void *v11;
  ISContentLayer *v12;
  void *v13;

  height = a3.height;
  width = a3.width;
  v7 = objc_alloc_init(ISLayer);
  -[ISLayer setSize:](v7, "setSize:", width, height);
  -[ISLayer setName:](v7, "setName:", CFSTR("layer"));
  v8 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v8, "setName:", CFSTR("Background"));
  -[ISLayer setSize:](v8, "setSize:", width, height);
  if (!-[ISrOSAppRecipe templateVariant](self, "templateVariant"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
    -[ISContentLayer setContent:](v8, "setContent:", v9);

  }
  -[ISLayer addSublayer:](v7, "addSublayer:", v8);

  v10 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v10, "setName:", CFSTR("Image"));
  -[ISLayer setSize:](v10, "setSize:", width, height);
  -[ISContentLayer setContent:](v10, "setContent:", CFSTR("kISPrimaryResourceKey"));
  if (-[ISrOSAppRecipe templateVariant](self, "templateVariant"))
  {
    v11 = (void *)objc_opt_new();
    -[ISLayer setEffect:](v10, "setEffect:", v11);

  }
  -[ISLayer addSublayer:](v7, "addSublayer:", v10);

  if (-[ISrOSAppRecipe shouldApplyMask](self, "shouldApplyMask")
    && !-[ISrOSAppRecipe templateVariant](self, "templateVariant"))
  {
    v12 = objc_alloc_init(ISContentLayer);
    -[ISLayer setSize:](v12, "setSize:", width, height);
    -[ISLayer setName:](v12, "setName:", CFSTR("mask layer"));
    +[ISShapeCompositorResource circleShape](ISShapeCompositorResource, "circleShape");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISContentLayer setContent:](v12, "setContent:", v13);

    -[ISLayer setMask:](v7, "setMask:", v12);
  }
  return v7;
}

- (IFIconSpecification)iconSpecification
{
  return (IFIconSpecification *)objc_msgSend(MEMORY[0x1E0D3A7B8], "rOSAppIconSpecification");
}

- (BOOL)shouldApplyMask
{
  return self->shouldApplyMask;
}

- (void)setShouldApplyMask:(BOOL)a3
{
  self->shouldApplyMask = a3;
}

- (BOOL)templateVariant
{
  return self->_templateVariant;
}

- (void)setTemplateVariant:(BOOL)a3
{
  self->_templateVariant = a3;
}

@end
