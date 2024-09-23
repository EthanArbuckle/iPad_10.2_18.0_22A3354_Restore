@implementation ISiosmacDocumentRecipe

- (id)hintedBadgeRect
{
  if (hintedBadgeRect_onceToken_1 != -1)
    dispatch_once(&hintedBadgeRect_onceToken_1, &__block_literal_global_35);
  return (id)hintedBadgeRect_rect_1;
}

uint64_t __41__ISiosmacDocumentRecipe_hintedBadgeRect__block_invoke()
{
  ISHintedRect *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedRect alloc], "initWithOptions:", 3);
  v1 = (void *)hintedBadgeRect_rect_1;
  hintedBadgeRect_rect_1 = (uint64_t)v0;

  return objc_msgSend((id)hintedBadgeRect_rect_1, "addHintedRect:forSize:", 112.0, 112.0, 288.0, 288.0, 512.0, 512.0);
}

- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  ISLayer *v15;
  ISContentLayer *v16;
  void *v17;
  void *v18;
  void *v19;
  ISContentLayer *v20;
  void *v21;
  ISContentLayer *v22;
  void *v23;
  ISContentLayer *v24;
  void *v25;
  ISContentLayer *v26;
  void *v27;
  void *v28;
  void *v29;
  ISContentLayer *v30;
  void *v31;
  void *v32;
  void *v33;

  height = a3.height;
  width = a3.width;
  -[ISiosmacDocumentRecipe hintedBadgeRect](self, "hintedBadgeRect", a3.width, a3.height, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hintedRectForSize:", width, height);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = objc_alloc_init(ISLayer);
  -[ISLayer setSize:](v15, "setSize:", width, height);
  -[ISLayer setName:](v15, "setName:", CFSTR("layer"));
  v16 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v16, "setName:", CFSTR("Background layer"));
  -[ISLayer setSize:](v16, "setSize:", width, height);
  v17 = (void *)MEMORY[0x1E0D3A7C8];
  objc_msgSend(MEMORY[0x1E0D3A798], "iconsetResourceBundle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "imageBagWithResourcesNamed:fromBundle:", CFSTR("GenericBackground"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[ISContentLayer setContent:](v16, "setContent:", v19);
  -[ISLayer addSublayer:](v15, "addSublayer:", v16);

  v20 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v20, "setName:", CFSTR("masked layer"));
  -[ISLayer setSize:](v20, "setSize:", width, height);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
  -[ISContentLayer setContent:](v20, "setContent:", v21);

  v22 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v22, "setName:", CFSTR("masked badge layer"));
  -[ISLayer setFrame:](v22, "setFrame:", v8, v10, v12, v14);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
  -[ISContentLayer setBackgroundColor:](v22, "setBackgroundColor:", v23);

  -[ISContentLayer setContent:](v22, "setContent:", CFSTR("kISPrimaryResourceKey"));
  v24 = objc_alloc_init(ISContentLayer);
  -[ISLayer setSize:](v24, "setSize:", v12, v14);
  -[ISLayer setName:](v24, "setName:", CFSTR("mask layer"));
  +[ISShapeCompositorResource continuousRoundedRectShape](ISShapeCompositorResource, "continuousRoundedRectShape");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISContentLayer setContent:](v24, "setContent:", v25);

  -[ISLayer setMask:](v22, "setMask:", v24);
  -[ISLayer addSublayer:](v20, "addSublayer:", v22);

  v26 = objc_alloc_init(ISContentLayer);
  -[ISLayer setSize:](v26, "setSize:", width, height);
  -[ISLayer setName:](v26, "setName:", CFSTR("mask layer"));
  v27 = (void *)MEMORY[0x1E0D3A7C8];
  objc_msgSend(MEMORY[0x1E0D3A798], "iconsetResourceBundle");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "imageBagWithResourcesNamed:fromBundle:", CFSTR("GenericFullDocumentMask"), v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[ISContentLayer setContent:](v26, "setContent:", v29);
    -[ISLayer setMask:](v20, "setMask:", v26);
  }

  -[ISLayer addSublayer:](v15, "addSublayer:", v20);
  v30 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v30, "setName:", CFSTR("Forground layer"));
  -[ISLayer setSize:](v30, "setSize:", width, height);
  v31 = (void *)MEMORY[0x1E0D3A7C8];
  objc_msgSend(MEMORY[0x1E0D3A798], "iconsetResourceBundle");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "imageBagWithResourcesNamed:fromBundle:", CFSTR("GenericForeground"), v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  -[ISContentLayer setContent:](v30, "setContent:", v33);
  -[ISLayer addSublayer:](v15, "addSublayer:", v30);

  return v15;
}

@end
