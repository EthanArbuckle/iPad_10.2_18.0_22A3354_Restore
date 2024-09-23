@implementation ISLeadingStatusBadgeRecipe

- (id)leadingBottomBadgeRect
{
  if (leadingBottomBadgeRect_onceToken != -1)
    dispatch_once(&leadingBottomBadgeRect_onceToken, &__block_literal_global_51);
  return (id)leadingBottomBadgeRect_rect;
}

uint64_t __52__ISLeadingStatusBadgeRecipe_leadingBottomBadgeRect__block_invoke()
{
  ISHintedRect *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedRect alloc], "initWithOptions:", 3);
  v1 = (void *)leadingBottomBadgeRect_rect;
  leadingBottomBadgeRect_rect = (uint64_t)v0;

  objc_msgSend((id)leadingBottomBadgeRect_rect, "addHintedRect:forSize:", 0.0, 1.0, 7.0, 7.0, 16.0, 16.0);
  objc_msgSend((id)leadingBottomBadgeRect_rect, "addHintedRect:forSize:", 0.0, 3.0, 7.0, 7.0, 32.0, 32.0);
  objc_msgSend((id)leadingBottomBadgeRect_rect, "addHintedRect:forSize:", 3.0, 14.0, 24.0, 24.0, 128.0, 128.0);
  objc_msgSend((id)leadingBottomBadgeRect_rect, "addHintedRect:forSize:", 5.0, 28.0, 50.0, 50.0, 256.0, 256.0);
  return objc_msgSend((id)leadingBottomBadgeRect_rect, "addHintedRect:forSize:", 10.0, 55.0, 100.0, 100.0, 512.0, 512.0);
}

- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  ISContentLayer *v8;
  void *v9;
  void *v10;
  void *v11;
  ISContentLayer *v12;
  void *v13;

  height = a3.height;
  width = a3.width;
  v8 = objc_alloc_init(ISContentLayer);
  -[ISLayer setSize:](v8, "setSize:", width, height);
  -[ISLayer setName:](v8, "setName:", CFSTR("layer"));
  v9 = (void *)objc_opt_new();
  hintedShadowBlur();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hintedFloatForSize:", width, height);
  objc_msgSend(v9, "setBlur:");

  hintedShadowSpread();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hintedFloatForSize:", width, height);
  objc_msgSend(v9, "setSpread:");

  objc_msgSend(v9, "setScale:", a4);
  -[ISLayer setEffect:](v8, "setEffect:", v9);
  v12 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v12, "setName:", CFSTR("Leading bottom badge"));
  -[ISLeadingStatusBadgeRecipe leadingBottomBadgeRect](self, "leadingBottomBadgeRect");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hintedRectForSize:", width, height);
  -[ISLayer setFrame:](v12, "setFrame:");

  -[ISContentLayer setContent:](v12, "setContent:", CFSTR("kISPrimaryResourceKey"));
  -[ISLayer addSublayer:](v8, "addSublayer:", v12);

  return v8;
}

@end
