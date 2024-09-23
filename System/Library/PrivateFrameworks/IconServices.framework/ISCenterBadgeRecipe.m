@implementation ISCenterBadgeRecipe

- (id)hintedBadgeRect
{
  if (hintedBadgeRect_onceToken_79 != -1)
    dispatch_once(&hintedBadgeRect_onceToken_79, &__block_literal_global_80);
  return (id)hintedBadgeRect_rect_78;
}

uint64_t __38__ISCenterBadgeRecipe_hintedBadgeRect__block_invoke()
{
  ISHintedRect *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedRect alloc], "initWithOptions:", 3);
  v1 = (void *)hintedBadgeRect_rect_78;
  hintedBadgeRect_rect_78 = (uint64_t)v0;

  return objc_msgSend((id)hintedBadgeRect_rect_78, "addHintedRect:forSize:", 73.0, 135.0, 366.0, 190.0, 512.0, 512.0);
}

- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  ISContentLayer *v7;
  ISContentLayer *v8;
  void *v9;

  height = a3.height;
  width = a3.width;
  v7 = objc_alloc_init(ISContentLayer);
  -[ISLayer setSize:](v7, "setSize:", width, height);
  -[ISLayer setName:](v7, "setName:", CFSTR("layer"));
  v8 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v8, "setName:", CFSTR("Center badge"));
  -[ISCenterBadgeRecipe hintedBadgeRect](self, "hintedBadgeRect");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hintedRectForSize:", width, height);
  -[ISLayer setFrame:](v8, "setFrame:");

  -[ISContentLayer setContent:](v8, "setContent:", CFSTR("kISPrimaryResourceKey"));
  -[ISLayer addSublayer:](v7, "addSublayer:", v8);

  return v7;
}

@end
