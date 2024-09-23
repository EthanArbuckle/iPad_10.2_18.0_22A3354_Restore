@implementation ISiOSMacAppRecipe

- (id)hintedShadowBlur
{
  if (hintedShadowBlur_onceToken != -1)
    dispatch_once(&hintedShadowBlur_onceToken, &__block_literal_global_3);
  return (id)hintedShadowBlur_value;
}

uint64_t __37__ISiOSMacAppRecipe_hintedShadowBlur__block_invoke()
{
  ISHintedFloat *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedFloat alloc], "initWithOptions:", 1);
  v1 = (void *)hintedShadowBlur_value;
  hintedShadowBlur_value = (uint64_t)v0;

  objc_msgSend((id)hintedShadowBlur_value, "addHintedFloat:forSize:", 0.25, 16.0, 16.0);
  objc_msgSend((id)hintedShadowBlur_value, "addHintedFloat:forSize:", 1.0, 32.0, 32.0);
  objc_msgSend((id)hintedShadowBlur_value, "addHintedFloat:forSize:", 3.0, 128.0, 128.0);
  objc_msgSend((id)hintedShadowBlur_value, "addHintedFloat:forSize:", 6.0, 256.0, 256.0);
  return objc_msgSend((id)hintedShadowBlur_value, "addHintedFloat:forSize:", 11.5, 512.0, 512.0);
}

- (id)hintedShadowOffset
{
  if (hintedShadowOffset_onceToken != -1)
    dispatch_once(&hintedShadowOffset_onceToken, &__block_literal_global_1);
  return (id)hintedShadowOffset_value;
}

uint64_t __39__ISiOSMacAppRecipe_hintedShadowOffset__block_invoke()
{
  ISHintedSize *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedSize alloc], "initWithOptions:", 1);
  v1 = (void *)hintedShadowOffset_value;
  hintedShadowOffset_value = (uint64_t)v0;

  objc_msgSend((id)hintedShadowOffset_value, "addHintedSize:forSize:", 0.0, -0.5, 16.0, 16.0);
  objc_msgSend((id)hintedShadowOffset_value, "addHintedSize:forSize:", 0.0, -1.0, 32.0, 32.0);
  objc_msgSend((id)hintedShadowOffset_value, "addHintedSize:forSize:", 0.0, -2.5, 128.0, 128.0);
  objc_msgSend((id)hintedShadowOffset_value, "addHintedSize:forSize:", 0.0, -5.0, 256.0, 256.0);
  return objc_msgSend((id)hintedShadowOffset_value, "addHintedSize:forSize:", 0.0, -10.0, 512.0, 512.0);
}

- (id)badgeRect
{
  if (badgeRect_onceToken != -1)
    dispatch_once(&badgeRect_onceToken, &__block_literal_global_3);
  return (id)badgeRect_rect;
}

uint64_t __30__ISiOSMacAppRecipe_badgeRect__block_invoke()
{
  ISHintedRect *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedRect alloc], "initWithOptions:", 3);
  v1 = (void *)badgeRect_rect;
  badgeRect_rect = (uint64_t)v0;

  objc_msgSend((id)badgeRect_rect, "addHintedRect:forSize:", 1.0, 1.0, 14.0, 14.0, 16.0, 16.0);
  objc_msgSend((id)badgeRect_rect, "addHintedRect:forSize:", 3.0, 3.0, 26.0, 26.0, 32.0, 32.0);
  objc_msgSend((id)badgeRect_rect, "addHintedRect:forSize:", 12.0, 12.0, 104.0, 104.0, 128.0, 128.0);
  objc_msgSend((id)badgeRect_rect, "addHintedRect:forSize:", 25.0, 25.0, 206.0, 206.0, 256.0, 256.0);
  return objc_msgSend((id)badgeRect_rect, "addHintedRect:forSize:", 50.0, 50.0, 412.0, 412.0, 512.0, 512.0);
}

- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  ISLayer *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  ISContentLayer *v18;
  void *v19;
  ISContentLayer *v20;
  ISContentLayer *v21;
  void *v22;
  ISContentLayer *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  height = a3.height;
  width = a3.width;
  v8 = objc_alloc_init(ISLayer);
  -[ISLayer setSize:](v8, "setSize:", width, height);
  -[ISLayer setName:](v8, "setName:", CFSTR("Root layer"));
  -[ISiOSMacAppRecipe badgeRect](self, "badgeRect");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hintedRectForSize:", width, height);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v18, "setName:", CFSTR("masked layer"));
  -[ISLayer setFrame:](v18, "setFrame:", v11, v13, v15, v17);
  objc_msgSend(MEMORY[0x1E0D3A7A0], "black");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISContentLayer setContent:](v18, "setContent:", v19);

  v20 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v20, "setName:", CFSTR("Image"));
  -[ISLayer setSize:](v20, "setSize:", v15, v17);
  -[ISContentLayer setContent:](v20, "setContent:", CFSTR("kISPrimaryResourceKey"));
  -[ISLayer addSublayer:](v18, "addSublayer:", v20);

  v21 = objc_alloc_init(ISContentLayer);
  -[ISLayer setSize:](v21, "setSize:", v15, v17);
  -[ISLayer setName:](v21, "setName:", CFSTR("mask layer"));
  +[ISShapeCompositorResource continuousRoundedRectShape](ISShapeCompositorResource, "continuousRoundedRectShape");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISContentLayer setContent:](v21, "setContent:", v22);

  -[ISLayer setMask:](v18, "setMask:", v21);
  v23 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v23, "setName:", CFSTR("shadow background layer"));
  -[ISLayer setSize:](v23, "setSize:", width, height);
  v24 = (void *)objc_opt_new();
  -[ISiOSMacAppRecipe hintedShadowBlur](self, "hintedShadowBlur");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "hintedFloatForSize:", width, height);
  objc_msgSend(v24, "setBlur:");

  -[ISiOSMacAppRecipe hintedShadowOffset](self, "hintedShadowOffset");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "hintedSizeForSize:", width, height);
  objc_msgSend(v24, "setOffset:");

  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithWhite:alpha:", 0.0, 0.28);
  objc_msgSend(v24, "setColor:", v27);

  objc_msgSend(v24, "setScale:", a4);
  -[ISLayer setEffect:](v23, "setEffect:", v24);
  -[ISLayer addSublayer:](v8, "addSublayer:", v23);
  -[ISLayer addSublayer:](v23, "addSublayer:", v18);

  return v8;
}

@end
