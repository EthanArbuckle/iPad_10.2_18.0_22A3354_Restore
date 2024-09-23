@implementation ISiosDocumentRecipe

- (ISiosDocumentRecipe)init
{
  ISiosDocumentRecipe *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISiosDocumentRecipe;
  result = -[ISiosDocumentRecipe init](&v3, sel_init);
  if (result)
    result->_options = 0;
  return result;
}

- (CGSize)badgeSizeForSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (badgeSizeForSize_scale__onceToken != -1)
    dispatch_once(&badgeSizeForSize_scale__onceToken, &__block_literal_global_141);
  objc_msgSend((id)badgeSizeForSize_scale__rect, "hintedRectForSize:", width, height);
  v7 = v6;
  v9 = v8;
  result.height = v9;
  result.width = v7;
  return result;
}

uint64_t __46__ISiosDocumentRecipe_badgeSizeForSize_scale___block_invoke()
{
  ISHintedRect *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedRect alloc], "initWithOptions:", 3);
  v1 = (void *)badgeSizeForSize_scale__rect;
  badgeSizeForSize_scale__rect = (uint64_t)v0;

  objc_msgSend((id)badgeSizeForSize_scale__rect, "addHintedRect:forSize:", 0.0, 0.0, 20.0, 20.0, 40.0, 40.0);
  objc_msgSend((id)badgeSizeForSize_scale__rect, "addHintedRect:forSize:", 0.0, 0.0, 20.0, 20.0, 44.0, 44.0);
  objc_msgSend((id)badgeSizeForSize_scale__rect, "addHintedRect:forSize:", 0.0, 0.0, 20.0, 20.0, 64.0, 64.0);
  objc_msgSend((id)badgeSizeForSize_scale__rect, "addHintedRect:forSize:", 0.0, 0.0, 38.0, 38.0, 84.0, 84.0);
  objc_msgSend((id)badgeSizeForSize_scale__rect, "addHintedRect:forSize:", 0.0, 0.0, 58.0, 58.0, 128.0, 128.0);
  return objc_msgSend((id)badgeSizeForSize_scale__rect, "addHintedRect:forSize:", 0.0, 0.0, 145.0, 145.0, 320.0, 320.0);
}

- (CGSize)backgroundSizeForSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (backgroundSizeForSize_scale__onceToken != -1)
    dispatch_once(&backgroundSizeForSize_scale__onceToken, &__block_literal_global_142);
  objc_msgSend((id)backgroundSizeForSize_scale__rect, "hintedRectForSize:", width, height);
  v7 = v6;
  v9 = v8;
  result.height = v9;
  result.width = v7;
  return result;
}

uint64_t __51__ISiosDocumentRecipe_backgroundSizeForSize_scale___block_invoke()
{
  ISHintedRect *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedRect alloc], "initWithOptions:", 3);
  v1 = (void *)backgroundSizeForSize_scale__rect;
  backgroundSizeForSize_scale__rect = (uint64_t)v0;

  objc_msgSend((id)backgroundSizeForSize_scale__rect, "addHintedRect:forSize:", 0.0, 0.0, 30.0, 40.0, 40.0, 40.0);
  objc_msgSend((id)backgroundSizeForSize_scale__rect, "addHintedRect:forSize:", 0.0, 0.0, 34.0, 44.0, 44.0, 44.0);
  objc_msgSend((id)backgroundSizeForSize_scale__rect, "addHintedRect:forSize:", 0.0, 0.0, 37.0, 48.0, 48.0, 48.0);
  objc_msgSend((id)backgroundSizeForSize_scale__rect, "addHintedRect:forSize:", 0.0, 0.0, 64.0, 84.0, 84.0, 84.0);
  objc_msgSend((id)backgroundSizeForSize_scale__rect, "addHintedRect:forSize:", 0.0, 0.0, 96.0, 128.0, 128.0, 128.0);
  return objc_msgSend((id)backgroundSizeForSize_scale__rect, "addHintedRect:forSize:", 0.0, 0.0, 240.0, 320.0, 320.0, 320.0);
}

- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  double v7;
  double v8;
  double v9;
  double v10;
  ISLayer *v11;
  unint64_t options;
  unint64_t v13;
  ISContentLayer *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  ISContentLayer *v19;
  void *v20;
  ISLayer *v21;
  CGFloat v22;
  ISContentLayer *v23;
  void *v24;
  ISContentLayer *v25;
  ISContentLayer *v26;
  void *v27;
  ISContentLayer *v28;
  void *v29;
  ISContentLayer *v30;
  void *v31;
  void *v32;
  void *v33;
  CGRect v35;
  CGRect v36;

  height = a3.height;
  width = a3.width;
  -[ISiosDocumentRecipe badgeSizeForSize:scale:](self, "badgeSizeForSize:scale:", a3.width, a3.height, a4);
  v8 = v7;
  v10 = v9;
  v11 = objc_alloc_init(ISLayer);
  -[ISLayer setSize:](v11, "setSize:", width, height);
  -[ISLayer setName:](v11, "setName:", CFSTR("layer"));
  options = self->_options;
  v13 = -[ISiosDocumentRecipe options](self, "options") & 9;
  v14 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v14, "setName:", CFSTR("Background layer"));
  -[ISLayer setSize:](v14, "setSize:", width, height);
  if ((options & 6) != 0)
    v15 = CFSTR("DocumentBaseNoPageCurl");
  else
    v15 = CFSTR("DocumentBase");
  v16 = (void *)MEMORY[0x1E0D3A7C8];
  objc_msgSend(MEMORY[0x1E0D3A798], "iconsetResourceBundle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "imageBagWithResourcesNamed:fromBundle:", v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[ISContentLayer setContent:](v14, "setContent:", v18);
  -[ISLayer addSublayer:](v11, "addSublayer:", v14);

  v19 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v19, "setName:", CFSTR("masked layer"));
  -[ISLayer setSize:](v19, "setSize:", width, height);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.0);
  -[ISContentLayer setContent:](v19, "setContent:", v20);

  v21 = objc_alloc_init(ISLayer);
  -[ISLayer setName:](v21, "setName:", CFSTR("badge layer"));
  -[ISLayer bounds](v19, "bounds");
  v22 = CGRectGetMidX(v35) - v8 * 0.5;
  -[ISLayer bounds](v19, "bounds");
  -[ISLayer setPosition:](v21, "setPosition:", v22, CGRectGetMidY(v36) - v10 * 0.5);
  -[ISLayer setSize:](v21, "setSize:", v8, v10);
  if ((options & 1) == 0)
  {
    v23 = objc_alloc_init(ISContentLayer);
    -[ISLayer setName:](v23, "setName:", CFSTR("Badge background"));
    -[ISLayer setSize:](v23, "setSize:", v8, v10);
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.0);
    -[ISContentLayer setContent:](v23, "setContent:", v24);

    -[ISLayer addSublayer:](v21, "addSublayer:", v23);
  }
  v25 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v25, "setName:", CFSTR("Badge image"));
  -[ISLayer setSize:](v25, "setSize:", v8, v10);
  -[ISContentLayer setContent:](v25, "setContent:", CFSTR("kISPrimaryResourceKey"));
  if (v13 == 9)
  {
    -[ISLayer setMask:](v21, "setMask:", v25);
    v26 = objc_alloc_init(ISContentLayer);
    -[ISLayer setName:](v26, "setName:", CFSTR("Tint layer"));
    -[ISLayer setSize:](v26, "setSize:", v8, v10);
    objc_msgSend(MEMORY[0x1E0D3A7A0], "white");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISContentLayer setContent:](v26, "setContent:", v27);

    -[ISLayer addSublayer:](v21, "addSublayer:", v26);
  }
  else
  {
    -[ISLayer addSublayer:](v21, "addSublayer:", v25);
  }

  if ((options & 1) == 0)
  {
    v28 = objc_alloc_init(ISContentLayer);
    -[ISLayer setSize:](v28, "setSize:", v8, v10);
    -[ISLayer setName:](v28, "setName:", CFSTR("badge mask layer"));
    +[ISShapeCompositorResource continuousRoundedRectShape](ISShapeCompositorResource, "continuousRoundedRectShape");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISContentLayer setContent:](v28, "setContent:", v29);

    -[ISLayer setMask:](v21, "setMask:", v28);
  }
  -[ISLayer addSublayer:](v19, "addSublayer:", v21);
  if ((options & 2) == 0)
  {
    v30 = objc_alloc_init(ISContentLayer);
    -[ISLayer setSize:](v30, "setSize:", width, height);
    -[ISLayer setName:](v30, "setName:", CFSTR("mask layer"));
    v31 = (void *)MEMORY[0x1E0D3A7C8];
    objc_msgSend(MEMORY[0x1E0D3A798], "iconsetResourceBundle");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "imageBagWithResourcesNamed:fromBundle:", CFSTR("DocumentMask"), v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      -[ISContentLayer setContent:](v30, "setContent:", v33);
      -[ISLayer setMask:](v19, "setMask:", v30);
    }

  }
  -[ISLayer addSublayer:](v11, "addSublayer:", v19);

  return v11;
}

- (IFIconSpecification)iconSpecification
{
  return (IFIconSpecification *)objc_msgSend(MEMORY[0x1E0D3A7B8], "iosDocumentIconSpecification");
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

@end
