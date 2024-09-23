@implementation ISMessagesAppRecipe

- (ISMessagesAppRecipe)init
{
  ISMessagesAppRecipe *v2;
  ISMessagesAppRecipe *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ISMessagesAppRecipe;
  v2 = -[ISMessagesAppRecipe init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[ISMessagesAppRecipe setShouldApplyMask:](v2, "setShouldApplyMask:", 1);
    -[ISMessagesAppRecipe setShouldDrawBorder:](v3, "setShouldDrawBorder:", 0);
  }
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
  void *v13;
  void *v14;
  ISContentLayer *v15;
  void *v16;
  void *v17;
  void *v18;

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

  if (-[ISMessagesAppRecipe shouldDrawBorder](self, "shouldDrawBorder"))
  {
    v11 = objc_alloc_init(ISContentLayer);
    -[ISLayer setName:](v11, "setName:", CFSTR("Image"));
    -[ISLayer setSize:](v11, "setSize:", width, height);
    v12 = (void *)MEMORY[0x1E0D3A7C8];
    objc_msgSend(MEMORY[0x1E0D3A798], "iconsetResourceBundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageBagWithResourcesNamed:fromBundle:", CFSTR("MessagesAppOutline"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[ISContentLayer setContent:](v11, "setContent:", v14);
    -[ISLayer addSublayer:](v7, "addSublayer:", v11);

  }
  if (-[ISMessagesAppRecipe shouldApplyMask](self, "shouldApplyMask"))
  {
    v15 = objc_alloc_init(ISContentLayer);
    -[ISLayer setSize:](v15, "setSize:", width, height);
    -[ISLayer setName:](v15, "setName:", CFSTR("mask layer"));
    v16 = (void *)MEMORY[0x1E0D3A7C8];
    objc_msgSend(MEMORY[0x1E0D3A798], "iconsetResourceBundle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "imageBagWithResourcesNamed:fromBundle:", CFSTR("MessagesAppMask"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[ISContentLayer setContent:](v15, "setContent:", v18);
    -[ISLayer setMask:](v7, "setMask:", v15);

  }
  return v7;
}

- (IFIconSpecification)iconSpecification
{
  return (IFIconSpecification *)objc_msgSend(MEMORY[0x1E0D3A7B8], "iosMessagesAppIconSpecification");
}

- (BOOL)shouldApplyMask
{
  return self->shouldApplyMask;
}

- (void)setShouldApplyMask:(BOOL)a3
{
  self->shouldApplyMask = a3;
}

- (BOOL)shouldDrawBorder
{
  return self->shouldDrawBorder;
}

- (void)setShouldDrawBorder:(BOOL)a3
{
  self->shouldDrawBorder = a3;
}

@end
