@implementation ISiOSAppClipRecipe

- (id)appRect
{
  if (appRect_onceToken != -1)
    dispatch_once(&appRect_onceToken, &__block_literal_global_156);
  return (id)appRect_rect;
}

uint64_t __29__ISiOSAppClipRecipe_appRect__block_invoke()
{
  ISHintedRect *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedRect alloc], "initWithOptions:", 3);
  v1 = (void *)appRect_rect;
  appRect_rect = (uint64_t)v0;

  objc_msgSend((id)appRect_rect, "addHintedRect:forSize:", 2.0, 2.0, 16.0, 16.0, 20.0, 20.0);
  objc_msgSend((id)appRect_rect, "addHintedRect:forSize:", 3.0, 3.0, 23.0, 23.0, 29.0, 29.0);
  objc_msgSend((id)appRect_rect, "addHintedRect:forSize:", 4.0, 4.0, 28.0, 28.0, 36.0, 36.0);
  objc_msgSend((id)appRect_rect, "addHintedRect:forSize:", 4.0, 4.0, 32.0, 32.0, 40.0, 40.0);
  objc_msgSend((id)appRect_rect, "addHintedRect:forSize:", 6.0, 6.0, 44.0, 44.0, 56.0, 56.0);
  objc_msgSend((id)appRect_rect, "addHintedRect:forSize:", 6.0, 6.0, 47.0, 47.0, 60.0, 60.0);
  objc_msgSend((id)appRect_rect, "addHintedRect:forSize:", 7.0, 7.0, 50.0, 50.0, 64.0, 64.0);
  objc_msgSend((id)appRect_rect, "addHintedRect:forSize:", 9.0, 9.0, 58.0, 58.0, 76.0, 76.0);
  objc_msgSend((id)appRect_rect, "addHintedRect:forSize:", 10.0, 10.0, 63.5, 63.5, 83.5, 83.5);
  return objc_msgSend((id)appRect_rect, "addHintedRect:forSize:", 51.0, 51.0, 410.0, 410.0, 512.0, 512.0);
}

- (id)blurRadius
{
  if (blurRadius_onceToken != -1)
    dispatch_once(&blurRadius_onceToken, &__block_literal_global_157);
  return (id)blurRadius_value;
}

uint64_t __32__ISiOSAppClipRecipe_blurRadius__block_invoke()
{
  ISHintedFloat *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedFloat alloc], "initWithOptions:", 3);
  v1 = (void *)blurRadius_value;
  blurRadius_value = (uint64_t)v0;

  objc_msgSend((id)blurRadius_value, "addHintedFloat:forSize:", 2.0, 20.0, 20.0);
  return objc_msgSend((id)blurRadius_value, "addHintedFloat:forSize:", 50.0, 512.0, 512.0);
}

- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  uint64_t v7;
  id v8;
  ISLayer *v9;
  ISContentLayer *v10;
  void *v11;
  ISContentLayer *v12;
  ISContentLayer *v13;
  ISStackedEffects *v14;
  ISBlurEffect *v15;
  void *v16;
  ISBlurEffect *v17;
  void *v18;
  ISStackedEffects *v19;
  ISBlurEffect *v20;
  unint64_t v21;
  unint64_t v22;
  ISContentLayer *v23;
  void *v24;
  ISContentLayer *v25;
  void *v26;
  ISContentLayer *v27;
  void *v28;
  void *v29;
  void *v30;
  ISContentLayer *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  id v38;
  _QWORD v39[3];

  height = a3.height;
  width = a3.width;
  v39[2] = *MEMORY[0x1E0C80C00];
  v38 = 0;
  -[ISiOSAppRecipe primaryResourceEffectReturningBackgroundContentOverride:](self, "primaryResourceEffectReturningBackgroundContentOverride:", &v38, a3.width, a3.height, a4);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v38;
  v9 = objc_alloc_init(ISLayer);
  -[ISLayer setSize:](v9, "setSize:", width, height);
  -[ISLayer setName:](v9, "setName:", CFSTR("root layer"));
  v10 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v10, "setName:", CFSTR("Base layer"));
  -[ISLayer setSize:](v10, "setSize:", width, height);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0);
  -[ISContentLayer setContent:](v10, "setContent:", v11);

  v12 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v12, "setName:", CFSTR("Background layer"));
  -[ISLayer setSize:](v12, "setSize:", width, height);
  v36 = v8;
  -[ISContentLayer setContent:](v12, "setContent:", v8);
  v13 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v13, "setName:", CFSTR("Blur layer"));
  -[ISLayer setSize:](v13, "setSize:", width, height);
  -[ISContentLayer setContent:](v13, "setContent:", CFSTR("kISPrimaryResourceKey"));
  v37 = (void *)v7;
  if (v7)
  {
    v14 = [ISStackedEffects alloc];
    v39[0] = v7;
    v15 = [ISBlurEffect alloc];
    -[ISiOSAppClipRecipe blurRadius](self, "blurRadius");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hintedFloatForSize:", width, height);
    v17 = -[ISBlurEffect initWithRadius:](v15, "initWithRadius:");
    v39[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[ISStackedEffects initWithEffects:](v14, "initWithEffects:", v18);
    -[ISLayer setEffect:](v13, "setEffect:", v19);

  }
  else
  {
    v20 = [ISBlurEffect alloc];
    -[ISiOSAppClipRecipe blurRadius](self, "blurRadius");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hintedFloatForSize:", width, height);
    v17 = -[ISBlurEffect initWithRadius:](v20, "initWithRadius:");
    -[ISLayer setEffect:](v13, "setEffect:", v17);
  }

  -[ISLayer addSublayer:](v12, "addSublayer:", v13);
  v21 = 0x1E0D3A000;
  v22 = 0x1E0D3A000;
  if (!self->_shouldOnlyDrawBorder)
  {
    v23 = objc_alloc_init(ISContentLayer);
    -[ISLayer setName:](v23, "setName:", CFSTR("Center Image Background"));
    -[ISLayer setSize:](v23, "setSize:", width, height);
    if (v37)
    {
      -[ISContentLayer setContent:](v23, "setContent:", v36);
    }
    else
    {
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
      -[ISContentLayer setContent:](v23, "setContent:", v24);

    }
    v25 = objc_alloc_init(ISContentLayer);
    -[ISLayer setName:](v25, "setName:", CFSTR("Center Image"));
    -[ISiOSAppClipRecipe appRect](self, "appRect");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "hintedRectForSize:", width, height);
    -[ISLayer setFrame:](v25, "setFrame:");

    -[ISContentLayer setContent:](v25, "setContent:", CFSTR("kISPrimaryResourceKey"));
    -[ISLayer setEffect:](v25, "setEffect:", v37);
    -[ISLayer addSublayer:](v23, "addSublayer:", v25);
    v27 = objc_alloc_init(ISContentLayer);
    -[ISLayer setName:](v27, "setName:", CFSTR("Center Image mask"));
    -[ISLayer bounds](v23, "bounds");
    -[ISLayer setFrame:](v27, "setFrame:");
    v28 = (void *)MEMORY[0x1E0D3A7C8];
    objc_msgSend(MEMORY[0x1E0D3A798], "iconsetResourceBundle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "imageBagWithResourcesNamed:fromBundle:", CFSTR("AppClipCenterMask"), v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISContentLayer setContent:](v27, "setContent:", v30);

    v21 = 0x1E0D3A000uLL;
    v22 = 0x1E0D3A000uLL;
    -[ISLayer setMask:](v23, "setMask:", v27);
    -[ISLayer addSublayer:](v10, "addSublayer:", v23);

  }
  -[ISLayer addSublayer:](v10, "addSublayer:", v12);
  v31 = objc_alloc_init(ISContentLayer);
  -[ISLayer setSize:](v31, "setSize:", width, height);
  -[ISLayer setName:](v31, "setName:", CFSTR("mask layer"));
  v32 = *(void **)(v21 + 1992);
  objc_msgSend(*(id *)(v22 + 1944), "iconsetResourceBundle");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "imageBagWithResourcesNamed:fromBundle:", CFSTR("AppClipMask"), v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISContentLayer setContent:](v31, "setContent:", v34);

  -[ISLayer setMask:](v12, "setMask:", v31);
  -[ISLayer addSublayer:](v9, "addSublayer:", v10);

  return v9;
}

- (BOOL)shouldOnlyDrawBorder
{
  return self->_shouldOnlyDrawBorder;
}

- (void)setShouldOnlyDrawBorder:(BOOL)a3
{
  self->_shouldOnlyDrawBorder = a3;
}

@end
