@implementation ISCenterEmbossRecipe

- (id)hintedFontSize
{
  if (hintedFontSize_onceToken != -1)
    dispatch_once(&hintedFontSize_onceToken, &__block_literal_global_56);
  return (id)hintedFontSize_value;
}

uint64_t __38__ISCenterEmbossRecipe_hintedFontSize__block_invoke()
{
  ISHintedFloat *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedFloat alloc], "initWithOptions:", 1);
  v1 = (void *)hintedFontSize_value;
  hintedFontSize_value = (uint64_t)v0;

  objc_msgSend((id)hintedFontSize_value, "addHintedFloat:forSize:", 6.0, 16.0, 16.0);
  return objc_msgSend((id)hintedFontSize_value, "addHintedFloat:forSize:", 180.0, 512.0, 512.0);
}

- (id)hintedBadgeRect
{
  if (hintedBadgeRect_onceToken_0 != -1)
    dispatch_once(&hintedBadgeRect_onceToken_0, &__block_literal_global_58);
  return (id)hintedBadgeRect_rect_0;
}

uint64_t __39__ISCenterEmbossRecipe_hintedBadgeRect__block_invoke()
{
  ISHintedRect *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedRect alloc], "initWithOptions:", 5);
  v1 = (void *)hintedBadgeRect_rect_0;
  hintedBadgeRect_rect_0 = (uint64_t)v0;

  objc_msgSend((id)hintedBadgeRect_rect_0, "addHintedRect:forSize:", 2.0, 5.5, 12.0, 6.0, 16.0, 16.0);
  objc_msgSend((id)hintedBadgeRect_rect_0, "addHintedRect:forSize:", 4.0, 11.0, 24.0, 12.0, 32.0, 32.0);
  return objc_msgSend((id)hintedBadgeRect_rect_0, "addHintedRect:forSize:", 73.0, 165.0, 366.0, 190.0, 512.0, 512.0);
}

- (id)hintedImageBadgeRect
{
  if (hintedImageBadgeRect_onceToken != -1)
    dispatch_once(&hintedImageBadgeRect_onceToken, &__block_literal_global_59);
  return (id)hintedImageBadgeRect_rect;
}

uint64_t __44__ISCenterEmbossRecipe_hintedImageBadgeRect__block_invoke()
{
  ISHintedRect *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedRect alloc], "initWithOptions:", 3);
  v1 = (void *)hintedImageBadgeRect_rect;
  hintedImageBadgeRect_rect = (uint64_t)v0;

  objc_msgSend((id)hintedImageBadgeRect_rect, "addHintedRect:forSize:", 2.0, 4.0, 12.0, 6.0, 16.0, 16.0);
  objc_msgSend((id)hintedImageBadgeRect_rect, "addHintedRect:forSize:", 4.0, 8.0, 24.0, 12.0, 32.0, 32.0);
  return objc_msgSend((id)hintedImageBadgeRect_rect, "addHintedRect:forSize:", 73.0, 135.0, 366.0, 190.0, 512.0, 512.0);
}

- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  ISContentLayer *v7;
  void *v8;
  ISContentLayer *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  ISTextLayer *v20;
  void *v21;
  ISSymbolLayer *v22;
  void *v23;

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
  -[ISCenterEmbossRecipe hintedImageBadgeRect](self, "hintedImageBadgeRect");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hintedRectForSize:", width, height);
  -[ISLayer setFrame:](v9, "setFrame:");

  -[ISContentLayer setContent:](v9, "setContent:", CFSTR("kISPrimaryResourceKey"));
  -[ISContentLayer setAcceptSymbol:](v9, "setAcceptSymbol:", 0);
  -[ISLayer addSublayer:](v7, "addSublayer:", v9);

  -[ISCenterEmbossRecipe hintedBadgeRect](self, "hintedBadgeRect");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hintedRectForSize:", width, height);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = objc_alloc_init(ISTextLayer);
  -[ISLayer setName:](v20, "setName:", CFSTR("Center Emboss Text"));
  -[ISLayer setFrame:](v20, "setFrame:", v13, v15, v17, v19);
  -[ISTextLayer setText:](v20, "setText:", CFSTR("kISPrimaryResourceKey"));
  -[ISCenterEmbossRecipe hintedFontSize](self, "hintedFontSize");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "hintedFloatForSize:", width, height);
  -[ISTextLayer setFontSize:](v20, "setFontSize:");

  -[ISLayer addSublayer:](v7, "addSublayer:", v20);
  v22 = objc_alloc_init(ISSymbolLayer);
  -[ISLayer setName:](v22, "setName:", CFSTR("Center Emboss"));
  -[ISLayer setFrame:](v22, "setFrame:", v13, v15, v17, v19);
  -[ISSymbolLayer setSymbol:](v22, "setSymbol:", CFSTR("kISPrimaryResourceKey"));
  -[ISCenterEmbossRecipe hintedFontSize](self, "hintedFontSize");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "hintedFloatForSize:", width, height);
  -[ISSymbolLayer setFontSize:](v22, "setFontSize:");

  -[ISLayer addSublayer:](v7, "addSublayer:", v22);
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
