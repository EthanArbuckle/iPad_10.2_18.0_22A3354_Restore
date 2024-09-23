@implementation ISAppNotificationBadgeRecipe

- (id)hintedBadgeRect
{
  if (hintedBadgeRect_onceToken_85 != -1)
    dispatch_once(&hintedBadgeRect_onceToken_85, &__block_literal_global_86);
  return (id)hintedBadgeRect_rect_84;
}

uint64_t __47__ISAppNotificationBadgeRecipe_hintedBadgeRect__block_invoke()
{
  ISHintedRect *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedRect alloc], "initWithOptions:", 3);
  v1 = (void *)hintedBadgeRect_rect_84;
  hintedBadgeRect_rect_84 = (uint64_t)v0;

  return objc_msgSend((id)hintedBadgeRect_rect_84, "addHintedRect:forSize:", 70.5, 0.0, 56.0, 56.0, 128.0, 128.0);
}

- (id)hintedMaskRect
{
  if (hintedMaskRect_onceToken != -1)
    dispatch_once(&hintedMaskRect_onceToken, &__block_literal_global_87);
  return (id)hintedMaskRect_rect;
}

uint64_t __46__ISAppNotificationBadgeRecipe_hintedMaskRect__block_invoke()
{
  ISHintedRect *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedRect alloc], "initWithOptions:", 3);
  v1 = (void *)hintedMaskRect_rect;
  hintedMaskRect_rect = (uint64_t)v0;

  return objc_msgSend((id)hintedMaskRect_rect, "addHintedRect:forSize:", 12.0, 12.0, 104.0, 104.0, 128.0, 128.0);
}

- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  ISContentLayer *v17;
  ISContentLayer *v18;
  ISContentLayer *v19;
  void *v20;
  void *v21;
  ISContentLayer *v22;
  ISContentLayer *v23;
  void *v24;
  void *v25;
  ISContentLayer *v26;

  height = a3.height;
  width = a3.width;
  -[ISAppNotificationBadgeRecipe hintedBadgeRect](self, "hintedBadgeRect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hintedRectForSize:", width, height);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = objc_alloc_init(ISContentLayer);
  -[ISLayer setSize:](v17, "setSize:", width, height);
  -[ISLayer setName:](v17, "setName:", CFSTR("root"));
  v18 = objc_alloc_init(ISContentLayer);
  -[ISLayer setSize:](v18, "setSize:", width, height);
  -[ISLayer setName:](v18, "setName:", CFSTR("shadow background"));
  v19 = objc_alloc_init(ISContentLayer);
  -[ISLayer setSize:](v19, "setSize:", width, height);
  -[ISLayer setName:](v19, "setName:", CFSTR("shadow"));
  v20 = (void *)objc_opt_new();
  objc_msgSend(v20, "setOffset:", 0.0, -3.0);
  objc_msgSend(v20, "setBlur:", 8.0);
  objc_msgSend(v20, "setSpread:", 9.0);
  objc_msgSend(v20, "setScale:", a4);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.2);
  objc_msgSend(v20, "setColor:", v21);

  -[ISLayer setEffect:](v19, "setEffect:", v20);
  v22 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v22, "setName:", CFSTR("shadow badge"));
  -[ISLayer setFrame:](v22, "setFrame:", v10 + 1.0, v12, v14 + -2.0, v16);
  -[ISContentLayer setContent:](v22, "setContent:", CFSTR("kISPrimaryResourceKey"));
  -[ISLayer addSublayer:](v19, "addSublayer:", v22);

  -[ISLayer addSublayer:](v18, "addSublayer:", v19);
  v23 = objc_alloc_init(ISContentLayer);
  -[ISAppNotificationBadgeRecipe hintedMaskRect](self, "hintedMaskRect");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "hintedRectForSize:", width, height);
  -[ISLayer setFrame:](v23, "setFrame:");

  -[ISLayer setName:](v23, "setName:", CFSTR("mask layer"));
  +[ISShapeCompositorResource continuousRoundedRectShape](ISShapeCompositorResource, "continuousRoundedRectShape");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISContentLayer setContent:](v23, "setContent:", v25);

  -[ISLayer setMask:](v18, "setMask:", v23);
  -[ISLayer addSublayer:](v17, "addSublayer:", v18);

  v26 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v26, "setName:", CFSTR("Center badge"));
  -[ISLayer setFrame:](v26, "setFrame:", v10, v12, v14, v16);
  -[ISContentLayer setContent:](v26, "setContent:", CFSTR("kISPrimaryResourceKey"));
  -[ISLayer addSublayer:](v17, "addSublayer:", v26);

  return v17;
}

@end
