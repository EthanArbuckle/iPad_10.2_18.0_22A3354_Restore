@implementation ISmacosDocumentRecipe

- (id)hintedBadgeRect
{
  if (hintedBadgeRect_onceToken_70 != -1)
    dispatch_once(&hintedBadgeRect_onceToken_70, &__block_literal_global_71);
  return (id)hintedBadgeRect_rect_69;
}

uint64_t __40__ISmacosDocumentRecipe_hintedBadgeRect__block_invoke()
{
  ISHintedRect *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedRect alloc], "initWithOptions:", 3);
  v1 = (void *)hintedBadgeRect_rect_69;
  hintedBadgeRect_rect_69 = (uint64_t)v0;

  return objc_msgSend((id)hintedBadgeRect_rect_69, "addHintedRect:forSize:", 112.0, 112.0, 288.0, 288.0, 512.0, 512.0);
}

- (id)hintedTextRect
{
  if (hintedTextRect_onceToken != -1)
    dispatch_once(&hintedTextRect_onceToken, &__block_literal_global_72_0);
  return (id)hintedTextRect_rect;
}

uint64_t __39__ISmacosDocumentRecipe_hintedTextRect__block_invoke()
{
  ISHintedRect *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedRect alloc], "initWithOptions:", 3);
  v1 = (void *)hintedTextRect_rect;
  hintedTextRect_rect = (uint64_t)v0;

  objc_msgSend((id)hintedTextRect_rect, "addHintedRect:forSize:", 7.0, 5.0, 18.0, 6.0, 32.0, 32.0);
  return objc_msgSend((id)hintedTextRect_rect, "addHintedRect:forSize:", 90.0, 62.0, 332.0, 80.0, 512.0, 512.0);
}

- (id)hintedFontSize
{
  if (hintedFontSize_onceToken_0 != -1)
    dispatch_once(&hintedFontSize_onceToken_0, &__block_literal_global_73);
  return (id)hintedFontSize_value_0;
}

uint64_t __39__ISmacosDocumentRecipe_hintedFontSize__block_invoke()
{
  ISHintedFloat *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedFloat alloc], "initWithOptions:", 3);
  v1 = (void *)hintedFontSize_value_0;
  hintedFontSize_value_0 = (uint64_t)v0;

  objc_msgSend((id)hintedFontSize_value_0, "addHintedFloat:forSize:", 6.75, 32.0, 32.0);
  objc_msgSend((id)hintedFontSize_value_0, "addHintedFloat:forSize:", 18.0, 128.0, 128.0);
  objc_msgSend((id)hintedFontSize_value_0, "addHintedFloat:forSize:", 36.0, 256.0, 256.0);
  return objc_msgSend((id)hintedFontSize_value_0, "addHintedFloat:forSize:", 72.0, 512.0, 512.0);
}

- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  ISLayer *v23;
  ISContentLayer *v24;
  void *v25;
  void *v26;
  void *v27;
  ISContentLayer *v28;
  void *v29;
  ISContentLayer *v30;
  ISContentLayer *v31;
  ISTextLayer *v32;
  void *v33;
  double v34;
  void *v35;
  ISContentLayer *v36;
  void *v37;
  void *v38;
  void *v39;
  ISContentLayer *v40;
  void *v41;
  void *v42;
  void *v43;
  double v45;
  double v46;

  height = a3.height;
  width = a3.width;
  -[ISmacosDocumentRecipe hintedBadgeRect](self, "hintedBadgeRect", a3.width, a3.height, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hintedRectForSize:", width, height);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[ISmacosDocumentRecipe hintedTextRect](self, "hintedTextRect");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hintedRectForSize:", width, height);
  v45 = v18;
  v46 = v17;
  v20 = v19;
  v22 = v21;

  v23 = objc_alloc_init(ISLayer);
  -[ISLayer setSize:](v23, "setSize:", width, height);
  -[ISLayer setName:](v23, "setName:", CFSTR("layer"));
  v24 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v24, "setName:", CFSTR("Background layer"));
  -[ISLayer setSize:](v24, "setSize:", width, height);
  v25 = (void *)MEMORY[0x1E0D3A7C8];
  objc_msgSend(MEMORY[0x1E0D3A798], "iconsetResourceBundle");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "imageBagWithResourcesNamed:fromBundle:", CFSTR("GenericBackground"), v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  -[ISContentLayer setContent:](v24, "setContent:", v27);
  -[ISLayer addSublayer:](v23, "addSublayer:", v24);

  v28 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v28, "setName:", CFSTR("masked layer"));
  -[ISLayer setSize:](v28, "setSize:", width, height);
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
  -[ISContentLayer setContent:](v28, "setContent:", v29);

  v30 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v30, "setName:", CFSTR("background layer"));
  -[ISLayer setSize:](v30, "setSize:", width, height);
  -[ISContentLayer setContent:](v30, "setContent:", CFSTR("kISBackgroundResourceKey"));
  -[ISLayer addSublayer:](v28, "addSublayer:", v30);

  v31 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v31, "setName:", CFSTR("badge layer"));
  -[ISLayer setFrame:](v31, "setFrame:", v9, v11, v13, v15);
  -[ISContentLayer setContent:](v31, "setContent:", CFSTR("kISBadgeResourceKey"));
  -[ISLayer addSublayer:](v28, "addSublayer:", v31);

  if (width > 16.0)
  {
    v32 = objc_alloc_init(ISTextLayer);
    -[ISLayer setName:](v32, "setName:", CFSTR("text layer"));
    -[ISLayer setFrame:](v32, "setFrame:", v46, v45, v20, v22);
    -[ISTextLayer setText:](v32, "setText:", CFSTR("kISTextResourceKey"));
    -[ISmacosDocumentRecipe hintedFontSize](self, "hintedFontSize");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "hintedFloatForSize:", width, height);
    -[ISTextLayer setFontSize:](v32, "setFontSize:");

    if (width * 0.001953125 >= 0.125)
    {
      v34 = 0.33;
    }
    else if ((0.125 - width * 0.001953125) * 0.3 / -0.09375 + 0.3 >= 0.0)
    {
      v34 = (0.125 - width * 0.001953125) * 0.3 / -0.09375 + 0.3;
    }
    else
    {
      v34 = 0.0;
    }
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithWhite:alpha:", v34, 1.0);
    -[ISTextLayer setColor:](v32, "setColor:", v35);

    -[ISLayer addSublayer:](v28, "addSublayer:", v32);
  }
  v36 = objc_alloc_init(ISContentLayer);
  -[ISLayer setSize:](v36, "setSize:", width, height);
  -[ISLayer setName:](v36, "setName:", CFSTR("mask layer"));
  v37 = (void *)MEMORY[0x1E0D3A7C8];
  objc_msgSend(MEMORY[0x1E0D3A798], "iconsetResourceBundle");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "imageBagWithResourcesNamed:fromBundle:", CFSTR("GenericFullDocumentMask"), v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    -[ISContentLayer setContent:](v36, "setContent:", v39);
    -[ISLayer setMask:](v28, "setMask:", v36);
  }

  -[ISLayer addSublayer:](v23, "addSublayer:", v28);
  v40 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v40, "setName:", CFSTR("Forground layer"));
  -[ISLayer setSize:](v40, "setSize:", width, height);
  v41 = (void *)MEMORY[0x1E0D3A7C8];
  objc_msgSend(MEMORY[0x1E0D3A798], "iconsetResourceBundle");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "imageBagWithResourcesNamed:fromBundle:", CFSTR("GenericForeground"), v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  -[ISContentLayer setContent:](v40, "setContent:", v43);
  -[ISLayer addSublayer:](v23, "addSublayer:", v40);

  return v23;
}

@end
