@implementation ISClippingRecipe

- (id)hintedPaperRect
{
  if (hintedPaperRect_onceToken_199 != -1)
    dispatch_once(&hintedPaperRect_onceToken_199, &__block_literal_global_200);
  return (id)hintedPaperRect_rect_198;
}

uint64_t __35__ISClippingRecipe_hintedPaperRect__block_invoke()
{
  ISHintedRect *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedRect alloc], "initWithOptions:", 3);
  v1 = (void *)hintedPaperRect_rect_198;
  hintedPaperRect_rect_198 = (uint64_t)v0;

  objc_msgSend((id)hintedPaperRect_rect_198, "addHintedRect:forSize:", 1.0, 1.0, 14.0, 14.0, 16.0, 16.0);
  objc_msgSend((id)hintedPaperRect_rect_198, "addHintedRect:forSize:", 2.0, 2.0, 28.0, 28.0, 32.0, 32.0);
  objc_msgSend((id)hintedPaperRect_rect_198, "addHintedRect:forSize:", 7.0, 7.0, 114.0, 114.0, 128.0, 128.0);
  objc_msgSend((id)hintedPaperRect_rect_198, "addHintedRect:forSize:", 14.0, 14.0, 228.0, 228.0, 256.0, 256.0);
  return objc_msgSend((id)hintedPaperRect_rect_198, "addHintedRect:forSize:", 29.0, 29.0, 454.0, 454.0, 512.0, 512.0);
}

- (id)hintedBadgeRect
{
  if (hintedBadgeRect_onceToken_202 != -1)
    dispatch_once(&hintedBadgeRect_onceToken_202, &__block_literal_global_203_0);
  return (id)hintedBadgeRect_rect_201;
}

uint64_t __35__ISClippingRecipe_hintedBadgeRect__block_invoke()
{
  ISHintedRect *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedRect alloc], "initWithOptions:", 3);
  v1 = (void *)hintedBadgeRect_rect_201;
  hintedBadgeRect_rect_201 = (uint64_t)v0;

  objc_msgSend((id)hintedBadgeRect_rect_201, "addHintedRect:forSize:", 3.0, 3.0, 8.0, 8.0, 16.0, 16.0);
  objc_msgSend((id)hintedBadgeRect_rect_201, "addHintedRect:forSize:", 6.0, 6.0, 16.0, 16.0, 32.0, 32.0);
  return objc_msgSend((id)hintedBadgeRect_rect_201, "addHintedRect:forSize:", 96.0, 96.0, 256.0, 256.0, 512.0, 512.0);
}

- (id)hintedPageCurlSize
{
  if (hintedPageCurlSize_onceToken_205 != -1)
    dispatch_once(&hintedPageCurlSize_onceToken_205, &__block_literal_global_206);
  return (id)hintedPageCurlSize_size_204;
}

uint64_t __38__ISClippingRecipe_hintedPageCurlSize__block_invoke()
{
  ISHintedSize *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedSize alloc], "initWithOptions:", 3);
  v1 = (void *)hintedPageCurlSize_size_204;
  hintedPageCurlSize_size_204 = (uint64_t)v0;

  objc_msgSend((id)hintedPageCurlSize_size_204, "addHintedSize:forSize:", 6.0, 6.0, 16.0, 16.0);
  objc_msgSend((id)hintedPageCurlSize_size_204, "addHintedSize:forSize:", 12.0, 12.0, 32.0, 32.0);
  objc_msgSend((id)hintedPageCurlSize_size_204, "addHintedSize:forSize:", 48.0, 48.0, 128.0, 128.0);
  objc_msgSend((id)hintedPageCurlSize_size_204, "addHintedSize:forSize:", 95.0, 95.0, 256.0, 256.0);
  return objc_msgSend((id)hintedPageCurlSize_size_204, "addHintedSize:forSize:", 190.0, 190.0, 512.0, 512.0);
}

- (id)hintedCornerSize
{
  if (hintedCornerSize_onceToken_208 != -1)
    dispatch_once(&hintedCornerSize_onceToken_208, &__block_literal_global_209);
  return (id)hintedCornerSize_size_207;
}

uint64_t __36__ISClippingRecipe_hintedCornerSize__block_invoke()
{
  ISHintedSize *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedSize alloc], "initWithOptions:", 3);
  v1 = (void *)hintedCornerSize_size_207;
  hintedCornerSize_size_207 = (uint64_t)v0;

  objc_msgSend((id)hintedCornerSize_size_207, "addHintedSize:forSize:", 1.0, 1.0, 16.0, 16.0);
  objc_msgSend((id)hintedCornerSize_size_207, "addHintedSize:forSize:", 2.0, 2.0, 32.0, 32.0);
  objc_msgSend((id)hintedCornerSize_size_207, "addHintedSize:forSize:", 5.0, 5.0, 128.0, 128.0);
  objc_msgSend((id)hintedCornerSize_size_207, "addHintedSize:forSize:", 9.0, 9.0, 256.0, 256.0);
  return objc_msgSend((id)hintedCornerSize_size_207, "addHintedSize:forSize:", 18.0, 18.0, 512.0, 512.0);
}

- (id)hintedTextRect
{
  if (hintedTextRect_onceToken_211 != -1)
    dispatch_once(&hintedTextRect_onceToken_211, &__block_literal_global_212);
  return (id)hintedTextRect_rect_210;
}

uint64_t __34__ISClippingRecipe_hintedTextRect__block_invoke()
{
  ISHintedRect *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedRect alloc], "initWithOptions:", 3);
  v1 = (void *)hintedTextRect_rect_210;
  hintedTextRect_rect_210 = (uint64_t)v0;

  objc_msgSend((id)hintedTextRect_rect_210, "addHintedRect:forSize:", 1.0, 1.0, 20.0, 5.0, 32.0, 32.0);
  return objc_msgSend((id)hintedTextRect_rect_210, "addHintedRect:forSize:", 30.0, 24.0, 284.0, 65.0, 512.0, 512.0);
}

- (id)hintedFontSize
{
  if (hintedFontSize_onceToken_214 != -1)
    dispatch_once(&hintedFontSize_onceToken_214, &__block_literal_global_215);
  return (id)hintedFontSize_value_213;
}

uint64_t __34__ISClippingRecipe_hintedFontSize__block_invoke()
{
  ISHintedFloat *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedFloat alloc], "initWithOptions:", 3);
  v1 = (void *)hintedFontSize_value_213;
  hintedFontSize_value_213 = (uint64_t)v0;

  objc_msgSend((id)hintedFontSize_value_213, "addHintedFloat:forSize:", 4.0, 32.0, 32.0);
  objc_msgSend((id)hintedFontSize_value_213, "addHintedFloat:forSize:", 17.0, 128.0, 128.0);
  objc_msgSend((id)hintedFontSize_value_213, "addHintedFloat:forSize:", 34.0, 256.0, 256.0);
  return objc_msgSend((id)hintedFontSize_value_213, "addHintedFloat:forSize:", 67.0, 512.0, 512.0);
}

- (id)hintedShadowBlur
{
  if (hintedShadowBlur_onceToken_217 != -1)
    dispatch_once(&hintedShadowBlur_onceToken_217, &__block_literal_global_218);
  return (id)hintedShadowBlur_value_216;
}

uint64_t __36__ISClippingRecipe_hintedShadowBlur__block_invoke()
{
  ISHintedFloat *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedFloat alloc], "initWithOptions:", 1);
  v1 = (void *)hintedShadowBlur_value_216;
  hintedShadowBlur_value_216 = (uint64_t)v0;

  objc_msgSend((id)hintedShadowBlur_value_216, "addHintedFloat:forSize:", 0.25, 16.0, 16.0);
  objc_msgSend((id)hintedShadowBlur_value_216, "addHintedFloat:forSize:", 1.0, 32.0, 32.0);
  objc_msgSend((id)hintedShadowBlur_value_216, "addHintedFloat:forSize:", 3.0, 128.0, 128.0);
  objc_msgSend((id)hintedShadowBlur_value_216, "addHintedFloat:forSize:", 6.0, 256.0, 256.0);
  return objc_msgSend((id)hintedShadowBlur_value_216, "addHintedFloat:forSize:", 11.5, 512.0, 512.0);
}

- (id)hintedShadowOffset
{
  if (hintedShadowOffset_onceToken_220 != -1)
    dispatch_once(&hintedShadowOffset_onceToken_220, &__block_literal_global_221);
  return (id)hintedShadowOffset_value_219;
}

uint64_t __38__ISClippingRecipe_hintedShadowOffset__block_invoke()
{
  ISHintedSize *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedSize alloc], "initWithOptions:", 1);
  v1 = (void *)hintedShadowOffset_value_219;
  hintedShadowOffset_value_219 = (uint64_t)v0;

  objc_msgSend((id)hintedShadowOffset_value_219, "addHintedSize:forSize:", 0.0, -0.5, 16.0, 16.0);
  objc_msgSend((id)hintedShadowOffset_value_219, "addHintedSize:forSize:", 0.0, -1.0, 32.0, 32.0);
  objc_msgSend((id)hintedShadowOffset_value_219, "addHintedSize:forSize:", 0.0, -2.5, 128.0, 128.0);
  objc_msgSend((id)hintedShadowOffset_value_219, "addHintedSize:forSize:", 0.0, -5.0, 256.0, 256.0);
  return objc_msgSend((id)hintedShadowOffset_value_219, "addHintedSize:forSize:", 0.0, -10.0, 512.0, 512.0);
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
  void *v17;
  ISLayer *v18;
  ISContentLayer *v19;
  void *v20;
  ISContentLayer *v21;
  void *v22;
  void *v23;
  ISContentLayer *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  ISContentLayer *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  ISContentLayer *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  ISContentLayer *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  ISContentLayer *v44;
  void *v45;
  ISContentLayer *v46;
  void *v47;
  ISContentLayer *v48;
  void *v49;
  void *v50;
  void *v51;
  ISContentLayer *v52;
  void *v53;
  ISContentLayer *v54;
  void *v55;
  ISContentLayer *v56;
  void *v57;
  ISContentLayer *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  ISContentLayer *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  ISContentLayer *v69;
  ISLayer *v70;

  height = a3.height;
  width = a3.width;
  -[ISClippingRecipe hintedBadgeRect](self, "hintedBadgeRect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hintedRectForSize:", width, height);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  -[ISClippingRecipe hintedTextRect](self, "hintedTextRect");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "hintedRectForSize:", width, height);

  v18 = objc_alloc_init(ISLayer);
  -[ISLayer setSize:](v18, "setSize:", width, height);
  v70 = v18;
  -[ISLayer setName:](v18, "setName:", CFSTR("layer"));
  v19 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v19, "setName:", CFSTR("masked layer"));
  v69 = v19;
  -[ISLayer setSize:](v19, "setSize:", width, height);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
  -[ISContentLayer setContent:](v19, "setContent:", v20);

  v21 = objc_alloc_init(ISContentLayer);
  -[ISClippingRecipe hintedPaperRect](self, "hintedPaperRect");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "hintedRectForSize:", width, height);
  -[ISLayer setFrame:](v21, "setFrame:");

  -[ISLayer setName:](v21, "setName:", CFSTR("mask shape layer"));
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
  -[ISContentLayer setContent:](v21, "setContent:", v23);

  v24 = objc_alloc_init(ISContentLayer);
  -[ISLayer setCoordinateSystem:](v24, "setCoordinateSystem:", 0);
  -[ISLayer setBlendMode:](v24, "setBlendMode:", 19);
  -[ISLayer setName:](v24, "setName:", CFSTR("bottomLeft"));
  -[ISClippingRecipe hintedCornerSize](self, "hintedCornerSize");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "hintedSizeForSize:", width, height);
  -[ISLayer setSize:](v24, "setSize:");

  objc_msgSend(MEMORY[0x1E0D3A798], "iconFoundationFrameworkBundle");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "assetCatalogURL");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[ISAssetCatalogResource assetCatalogResourceWithURL:imageName:error:](ISAssetCatalogResource, "assetCatalogResourceWithURL:imageName:error:", v27, CFSTR("document/bottom-right-mask"), 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISContentLayer setContent:](v24, "setContent:", v28);

  -[ISLayer addSublayer:](v21, "addSublayer:", v24);
  v29 = objc_alloc_init(ISContentLayer);
  -[ISLayer setCoordinateSystem:](v29, "setCoordinateSystem:", 3);
  -[ISLayer setBlendMode:](v29, "setBlendMode:", 19);
  -[ISLayer setName:](v29, "setName:", CFSTR("topRight"));
  -[ISClippingRecipe hintedPageCurlSize](self, "hintedPageCurlSize");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "hintedSizeForSize:", width, height);
  -[ISLayer setSize:](v29, "setSize:");

  objc_msgSend(MEMORY[0x1E0D3A798], "iconFoundationFrameworkBundle");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "assetCatalogURL");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[ISAssetCatalogResource assetCatalogResourceWithURL:imageName:error:](ISAssetCatalogResource, "assetCatalogResourceWithURL:imageName:error:", v32, CFSTR("document/top-right-mask"), 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISContentLayer setContent:](v29, "setContent:", v33);

  -[ISLayer addSublayer:](v21, "addSublayer:", v29);
  v34 = objc_alloc_init(ISContentLayer);
  -[ISLayer setCoordinateSystem:](v34, "setCoordinateSystem:", 2);
  -[ISLayer setFlipped:](v34, "setFlipped:", 2);
  -[ISLayer setBlendMode:](v34, "setBlendMode:", 19);
  -[ISLayer setName:](v34, "setName:", CFSTR("bottomRight"));
  -[ISClippingRecipe hintedCornerSize](self, "hintedCornerSize");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "hintedSizeForSize:", width, height);
  -[ISLayer setSize:](v34, "setSize:");

  objc_msgSend(MEMORY[0x1E0D3A798], "iconFoundationFrameworkBundle");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "assetCatalogURL");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[ISAssetCatalogResource assetCatalogResourceWithURL:imageName:error:](ISAssetCatalogResource, "assetCatalogResourceWithURL:imageName:error:", v37, CFSTR("document/bottom-right-mask"), 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISContentLayer setContent:](v34, "setContent:", v38);

  -[ISLayer addSublayer:](v21, "addSublayer:", v34);
  v39 = objc_alloc_init(ISContentLayer);
  -[ISLayer setCoordinateSystem:](v39, "setCoordinateSystem:", 1);
  -[ISLayer setFlipped:](v39, "setFlipped:", 1);
  -[ISLayer setBlendMode:](v39, "setBlendMode:", 19);
  -[ISLayer setName:](v39, "setName:", CFSTR("topLeft"));
  -[ISClippingRecipe hintedCornerSize](self, "hintedCornerSize");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "hintedSizeForSize:", width, height);
  -[ISLayer setSize:](v39, "setSize:");

  objc_msgSend(MEMORY[0x1E0D3A798], "iconFoundationFrameworkBundle");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "assetCatalogURL");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  +[ISAssetCatalogResource assetCatalogResourceWithURL:imageName:error:](ISAssetCatalogResource, "assetCatalogResourceWithURL:imageName:error:", v42, CFSTR("document/bottom-right-mask"), 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISContentLayer setContent:](v39, "setContent:", v43);

  -[ISLayer addSublayer:](v21, "addSublayer:", v39);
  v44 = objc_alloc_init(ISContentLayer);
  -[ISLayer setSize:](v44, "setSize:", width, height);
  -[ISLayer setName:](v44, "setName:", CFSTR("mask layer"));
  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0);
  -[ISContentLayer setContent:](v44, "setContent:", v45);

  -[ISLayer addSublayer:](v44, "addSublayer:", v21);
  -[ISLayer setMask:](v69, "setMask:", v44);

  v46 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v46, "setName:", CFSTR("background layer"));
  -[ISLayer setSize:](v46, "setSize:", width, height);
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
  -[ISContentLayer setBackgroundColor:](v46, "setBackgroundColor:", v47);

  -[ISContentLayer setContent:](v46, "setContent:", CFSTR("kISBackgroundResourceKey"));
  -[ISLayer addSublayer:](v69, "addSublayer:", v46);

  v48 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v48, "setName:", CFSTR("gradient layer"));
  -[ISLayer setSize:](v48, "setSize:", width, height);
  objc_msgSend(MEMORY[0x1E0D3A798], "iconFoundationFrameworkBundle");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "assetCatalogURL");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  +[ISAssetCatalogResource assetCatalogResourceWithURL:imageName:error:](ISAssetCatalogResource, "assetCatalogResourceWithURL:imageName:error:", v50, CFSTR("document/gradient"), 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISContentLayer setContent:](v48, "setContent:", v51);

  -[ISLayer addSublayer:](v69, "addSublayer:", v48);
  v52 = objc_alloc_init(ISContentLayer);
  -[ISClippingRecipe hintedPaperRect](self, "hintedPaperRect");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "hintedRectForSize:", width, height);
  -[ISLayer setFrame:](v52, "setFrame:");

  -[ISLayer addSublayer:](v69, "addSublayer:", v52);
  v54 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v54, "setName:", CFSTR("badge layer"));
  -[ISContentLayer setContent:](v54, "setContent:", CFSTR("kISBadgeResourceKey"));
  -[ISClippingRecipe badgeTintColor](self, "badgeTintColor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v55)
  {
    -[ISLayer setSize:](v54, "setSize:", v14, v16);
    v56 = objc_alloc_init(ISContentLayer);
    -[ISLayer setName:](v56, "setName:", CFSTR("Tint layer"));
    -[ISLayer setFrame:](v56, "setFrame:", v10, v12, v14, v16);
    -[ISClippingRecipe badgeTintColor](self, "badgeTintColor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISContentLayer setContent:](v56, "setContent:", v57);

    -[ISLayer setMask:](v56, "setMask:", v54);
    -[ISLayer setCoordinateSystem:](v56, "setCoordinateSystem:", 1);
    -[ISLayer addSublayer:](v52, "addSublayer:", v56);

  }
  else
  {
    -[ISLayer setCoordinateSystem:](v54, "setCoordinateSystem:", 1);
    -[ISLayer setFrame:](v54, "setFrame:", v10, v12, v14, v16);
    -[ISLayer addSublayer:](v52, "addSublayer:", v54);
  }

  v58 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v58, "setName:", CFSTR("Forground layer"));
  -[ISLayer setCoordinateSystem:](v58, "setCoordinateSystem:", 3);
  -[ISClippingRecipe hintedPageCurlSize](self, "hintedPageCurlSize");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "hintedSizeForSize:", width, height);
  -[ISLayer setSize:](v58, "setSize:");

  -[ISLayer setPosition:](v58, "setPosition:", 0.0, 0.0);
  objc_msgSend(MEMORY[0x1E0D3A798], "iconFoundationFrameworkBundle");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "assetCatalogURL");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  +[ISAssetCatalogResource assetCatalogResourceWithURL:imageName:error:](ISAssetCatalogResource, "assetCatalogResourceWithURL:imageName:error:", v61, CFSTR("document/page-fold"), 0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISContentLayer setContent:](v58, "setContent:", v62);

  -[ISLayer addSublayer:](v52, "addSublayer:", v58);
  v63 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v63, "setName:", CFSTR("shadow background layer"));
  -[ISLayer setSize:](v63, "setSize:", width, height);
  v64 = (void *)objc_opt_new();
  -[ISClippingRecipe hintedShadowBlur](self, "hintedShadowBlur");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "hintedFloatForSize:", width, height);
  objc_msgSend(v64, "setBlur:");

  -[ISClippingRecipe hintedShadowOffset](self, "hintedShadowOffset");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "hintedSizeForSize:", width, height);
  objc_msgSend(v64, "setOffset:");

  v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithWhite:alpha:", 0.0, 0.28);
  objc_msgSend(v64, "setColor:", v67);

  objc_msgSend(v64, "setScale:", a4);
  -[ISLayer setEffect:](v63, "setEffect:", v64);
  -[ISLayer addSublayer:](v70, "addSublayer:", v63);
  -[ISLayer addSublayer:](v63, "addSublayer:", v69);

  return v70;
}

- (IFColor)badgeTintColor
{
  return (IFColor *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBadgeTintColor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeTintColor, 0);
}

@end
