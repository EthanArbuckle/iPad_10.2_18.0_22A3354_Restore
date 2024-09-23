@implementation ISmacosDocumentRecipe1016

- (id)hintedPaperRect
{
  if (hintedPaperRect_onceToken != -1)
    dispatch_once(&hintedPaperRect_onceToken, &__block_literal_global_85);
  return (id)hintedPaperRect_rect;
}

uint64_t __44__ISmacosDocumentRecipe1016_hintedPaperRect__block_invoke()
{
  ISHintedRect *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedRect alloc], "initWithOptions:", 5);
  v1 = (void *)hintedPaperRect_rect;
  hintedPaperRect_rect = (uint64_t)v0;

  objc_msgSend((id)hintedPaperRect_rect, "addHintedRect:forSize:", 2.0, 1.0, 12.0, 14.0, 16.0, 16.0);
  objc_msgSend((id)hintedPaperRect_rect, "addHintedRect:forSize:", 5.0, 2.0, 22.0, 28.0, 32.0, 32.0);
  objc_msgSend((id)hintedPaperRect_rect, "addHintedRect:forSize:", 21.0, 7.0, 86.0, 114.0, 128.0, 128.0);
  objc_msgSend((id)hintedPaperRect_rect, "addHintedRect:forSize:", 42.0, 14.0, 172.0, 228.0, 256.0, 256.0);
  return objc_msgSend((id)hintedPaperRect_rect, "addHintedRect:forSize:", 84.0, 29.0, 344.0, 454.0, 512.0, 512.0);
}

- (id)hintedPageCurlSize
{
  if (hintedPageCurlSize_onceToken != -1)
    dispatch_once(&hintedPageCurlSize_onceToken, &__block_literal_global_86_0);
  return (id)hintedPageCurlSize_size;
}

uint64_t __47__ISmacosDocumentRecipe1016_hintedPageCurlSize__block_invoke()
{
  ISHintedSize *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedSize alloc], "initWithOptions:", 3);
  v1 = (void *)hintedPageCurlSize_size;
  hintedPageCurlSize_size = (uint64_t)v0;

  objc_msgSend((id)hintedPageCurlSize_size, "addHintedSize:forSize:", 6.0, 6.0, 16.0, 16.0);
  objc_msgSend((id)hintedPageCurlSize_size, "addHintedSize:forSize:", 12.0, 12.0, 32.0, 32.0);
  objc_msgSend((id)hintedPageCurlSize_size, "addHintedSize:forSize:", 48.0, 48.0, 128.0, 128.0);
  objc_msgSend((id)hintedPageCurlSize_size, "addHintedSize:forSize:", 95.0, 95.0, 256.0, 256.0);
  return objc_msgSend((id)hintedPageCurlSize_size, "addHintedSize:forSize:", 190.0, 190.0, 512.0, 512.0);
}

- (id)hintedCornerSize
{
  if (hintedCornerSize_onceToken != -1)
    dispatch_once(&hintedCornerSize_onceToken, &__block_literal_global_88);
  return (id)hintedCornerSize_size;
}

uint64_t __45__ISmacosDocumentRecipe1016_hintedCornerSize__block_invoke()
{
  ISHintedSize *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedSize alloc], "initWithOptions:", 3);
  v1 = (void *)hintedCornerSize_size;
  hintedCornerSize_size = (uint64_t)v0;

  objc_msgSend((id)hintedCornerSize_size, "addHintedSize:forSize:", 1.0, 1.0, 16.0, 16.0);
  objc_msgSend((id)hintedCornerSize_size, "addHintedSize:forSize:", 2.0, 2.0, 32.0, 32.0);
  objc_msgSend((id)hintedCornerSize_size, "addHintedSize:forSize:", 5.0, 5.0, 128.0, 128.0);
  objc_msgSend((id)hintedCornerSize_size, "addHintedSize:forSize:", 9.0, 9.0, 256.0, 256.0);
  return objc_msgSend((id)hintedCornerSize_size, "addHintedSize:forSize:", 18.0, 18.0, 512.0, 512.0);
}

- (id)hintedBadgeRect
{
  if (hintedBadgeRect_onceToken_90 != -1)
    dispatch_once(&hintedBadgeRect_onceToken_90, &__block_literal_global_91_0);
  return (id)hintedBadgeRect_rect_89;
}

uint64_t __44__ISmacosDocumentRecipe1016_hintedBadgeRect__block_invoke()
{
  ISHintedRect *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedRect alloc], "initWithOptions:", 5);
  v1 = (void *)hintedBadgeRect_rect_89;
  hintedBadgeRect_rect_89 = (uint64_t)v0;

  objc_msgSend((id)hintedBadgeRect_rect_89, "addHintedRect:forSize:", 1.5, 3.0, 8.0, 8.0, 16.0, 16.0);
  objc_msgSend((id)hintedBadgeRect_rect_89, "addHintedRect:forSize:", 3.0, 6.0, 16.0, 16.0, 32.0, 32.0);
  return objc_msgSend((id)hintedBadgeRect_rect_89, "addHintedRect:forSize:", 44.0, 91.0, 256.0, 256.0, 512.0, 512.0);
}

- (id)hintedTextRect
{
  if (hintedTextRect_onceToken_93 != -1)
    dispatch_once(&hintedTextRect_onceToken_93, &__block_literal_global_94);
  return (id)hintedTextRect_rect_92;
}

uint64_t __43__ISmacosDocumentRecipe1016_hintedTextRect__block_invoke()
{
  ISHintedRect *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedRect alloc], "initWithOptions:", 3);
  v1 = (void *)hintedTextRect_rect_92;
  hintedTextRect_rect_92 = (uint64_t)v0;

  objc_msgSend((id)hintedTextRect_rect_92, "addHintedRect:forSize:", 1.0, 1.0, 20.0, 5.0, 32.0, 32.0);
  return objc_msgSend((id)hintedTextRect_rect_92, "addHintedRect:forSize:", 30.0, 40.0, 284.0, 65.0, 512.0, 512.0);
}

- (id)hintedFontSize
{
  if (hintedFontSize_onceToken_96 != -1)
    dispatch_once(&hintedFontSize_onceToken_96, &__block_literal_global_97);
  return (id)hintedFontSize_value_95;
}

uint64_t __43__ISmacosDocumentRecipe1016_hintedFontSize__block_invoke()
{
  ISHintedFloat *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedFloat alloc], "initWithOptions:", 3);
  v1 = (void *)hintedFontSize_value_95;
  hintedFontSize_value_95 = (uint64_t)v0;

  objc_msgSend((id)hintedFontSize_value_95, "addHintedFloat:forSize:", 4.0, 32.0, 32.0);
  objc_msgSend((id)hintedFontSize_value_95, "addHintedFloat:forSize:", 17.0, 128.0, 128.0);
  objc_msgSend((id)hintedFontSize_value_95, "addHintedFloat:forSize:", 34.0, 256.0, 256.0);
  return objc_msgSend((id)hintedFontSize_value_95, "addHintedFloat:forSize:", 67.0, 512.0, 512.0);
}

- (id)hintedShadowBlur
{
  if (hintedShadowBlur_onceToken_1 != -1)
    dispatch_once(&hintedShadowBlur_onceToken_1, &__block_literal_global_98);
  return (id)hintedShadowBlur_value_1;
}

uint64_t __45__ISmacosDocumentRecipe1016_hintedShadowBlur__block_invoke()
{
  ISHintedFloat *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedFloat alloc], "initWithOptions:", 1);
  v1 = (void *)hintedShadowBlur_value_1;
  hintedShadowBlur_value_1 = (uint64_t)v0;

  objc_msgSend((id)hintedShadowBlur_value_1, "addHintedFloat:forSize:", 1.0, 16.0, 16.0);
  objc_msgSend((id)hintedShadowBlur_value_1, "addHintedFloat:forSize:", 1.0, 32.0, 32.0);
  objc_msgSend((id)hintedShadowBlur_value_1, "addHintedFloat:forSize:", 3.0, 128.0, 128.0);
  objc_msgSend((id)hintedShadowBlur_value_1, "addHintedFloat:forSize:", 6.0, 256.0, 256.0);
  return objc_msgSend((id)hintedShadowBlur_value_1, "addHintedFloat:forSize:", 11.5, 512.0, 512.0);
}

- (id)hintedShadowOffset
{
  if (hintedShadowOffset_onceToken_0 != -1)
    dispatch_once(&hintedShadowOffset_onceToken_0, &__block_literal_global_99);
  return (id)hintedShadowOffset_value_0;
}

uint64_t __47__ISmacosDocumentRecipe1016_hintedShadowOffset__block_invoke()
{
  ISHintedSize *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedSize alloc], "initWithOptions:", 1);
  v1 = (void *)hintedShadowOffset_value_0;
  hintedShadowOffset_value_0 = (uint64_t)v0;

  objc_msgSend((id)hintedShadowOffset_value_0, "addHintedSize:forSize:", 0.0, -0.5, 16.0, 16.0);
  objc_msgSend((id)hintedShadowOffset_value_0, "addHintedSize:forSize:", 0.0, -1.0, 32.0, 32.0);
  objc_msgSend((id)hintedShadowOffset_value_0, "addHintedSize:forSize:", 0.0, -2.5, 128.0, 128.0);
  objc_msgSend((id)hintedShadowOffset_value_0, "addHintedSize:forSize:", 0.0, -5.0, 256.0, 256.0);
  return objc_msgSend((id)hintedShadowOffset_value_0, "addHintedSize:forSize:", 0.0, -10.0, 512.0, 512.0);
}

- (id)hintedShadowSpread
{
  if (hintedShadowSpread_onceToken_0 != -1)
    dispatch_once(&hintedShadowSpread_onceToken_0, &__block_literal_global_100);
  return (id)hintedShadowSpread_value_0;
}

uint64_t __47__ISmacosDocumentRecipe1016_hintedShadowSpread__block_invoke()
{
  ISHintedFloat *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedFloat alloc], "initWithOptions:", 1);
  v1 = (void *)hintedShadowSpread_value_0;
  hintedShadowSpread_value_0 = (uint64_t)v0;

  objc_msgSend((id)hintedShadowSpread_value_0, "addHintedFloat:forSize:", 1.0, 16.0, 16.0);
  objc_msgSend((id)hintedShadowSpread_value_0, "addHintedFloat:forSize:", 1.0, 32.0, 32.0);
  objc_msgSend((id)hintedShadowSpread_value_0, "addHintedFloat:forSize:", 1.0, 128.0, 128.0);
  objc_msgSend((id)hintedShadowSpread_value_0, "addHintedFloat:forSize:", 1.0, 256.0, 256.0);
  return objc_msgSend((id)hintedShadowSpread_value_0, "addHintedFloat:forSize:", 1.0, 512.0, 512.0);
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
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  ISLayer *v23;
  ISContentLayer *v24;
  void *v25;
  ISContentLayer *v26;
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
  void *v46;
  void *v47;
  void *v48;
  ISContentLayer *v49;
  void *v50;
  ISContentLayer *v51;
  void *v52;
  ISContentLayer *v53;
  void *v54;
  void *v55;
  void *v56;
  ISContentLayer *v57;
  void *v58;
  ISContentLayer *v59;
  ISContentLayer *v60;
  void *v61;
  ISTextLayer *v62;
  void *v63;
  void *v64;
  ISLegibilityEffect *v65;
  ISContentLayer *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  ISContentLayer *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v78;
  double v79;
  uint64_t v80;
  double v81;
  ISLayer *v82;

  height = a3.height;
  width = a3.width;
  -[ISmacosDocumentRecipe1016 hintedBadgeRect](self, "hintedBadgeRect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hintedRectForSize:", width, height);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[ISmacosDocumentRecipe1016 hintedTextRect](self, "hintedTextRect");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hintedRectForSize:", width, height);
  v78 = v18;
  v80 = v17;
  v20 = v19;
  v22 = v21;

  v23 = objc_alloc_init(ISLayer);
  -[ISLayer setSize:](v23, "setSize:", width, height);
  v82 = v23;
  -[ISLayer setName:](v23, "setName:", CFSTR("layer"));
  v24 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v24, "setName:", CFSTR("masked layer"));
  -[ISLayer setSize:](v24, "setSize:", width, height);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
  -[ISContentLayer setContent:](v24, "setContent:", v25);

  v26 = objc_alloc_init(ISContentLayer);
  -[ISmacosDocumentRecipe1016 hintedPaperRect](self, "hintedPaperRect");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "hintedRectForSize:", width, height);
  -[ISLayer setFrame:](v26, "setFrame:");

  -[ISLayer setName:](v26, "setName:", CFSTR("mask shape layer"));
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
  -[ISContentLayer setContent:](v26, "setContent:", v28);

  v29 = objc_alloc_init(ISContentLayer);
  -[ISLayer setCoordinateSystem:](v29, "setCoordinateSystem:", 0);
  -[ISLayer setBlendMode:](v29, "setBlendMode:", 19);
  -[ISLayer setName:](v29, "setName:", CFSTR("bottomLeft"));
  -[ISmacosDocumentRecipe1016 hintedCornerSize](self, "hintedCornerSize");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "hintedSizeForSize:", width, height);
  -[ISLayer setSize:](v29, "setSize:");

  objc_msgSend(MEMORY[0x1E0D3A798], "iconFoundationFrameworkBundle");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "assetCatalogURL");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[ISAssetCatalogResource assetCatalogResourceWithURL:imageName:error:](ISAssetCatalogResource, "assetCatalogResourceWithURL:imageName:error:", v32, CFSTR("document/bottom-right-mask"), 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISContentLayer setContent:](v29, "setContent:", v33);

  -[ISLayer addSublayer:](v26, "addSublayer:", v29);
  v34 = objc_alloc_init(ISContentLayer);
  -[ISLayer setCoordinateSystem:](v34, "setCoordinateSystem:", 3);
  -[ISLayer setBlendMode:](v34, "setBlendMode:", 19);
  -[ISLayer setName:](v34, "setName:", CFSTR("topRight"));
  -[ISmacosDocumentRecipe1016 hintedPageCurlSize](self, "hintedPageCurlSize");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "hintedSizeForSize:", width, height);
  -[ISLayer setSize:](v34, "setSize:");

  objc_msgSend(MEMORY[0x1E0D3A798], "iconFoundationFrameworkBundle");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "assetCatalogURL");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[ISAssetCatalogResource assetCatalogResourceWithURL:imageName:error:](ISAssetCatalogResource, "assetCatalogResourceWithURL:imageName:error:", v37, CFSTR("document/top-right-mask"), 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISContentLayer setContent:](v34, "setContent:", v38);

  -[ISLayer addSublayer:](v26, "addSublayer:", v34);
  v39 = objc_alloc_init(ISContentLayer);
  -[ISLayer setCoordinateSystem:](v39, "setCoordinateSystem:", 2);
  -[ISLayer setFlipped:](v39, "setFlipped:", 2);
  -[ISLayer setBlendMode:](v39, "setBlendMode:", 19);
  -[ISLayer setName:](v39, "setName:", CFSTR("bottomRight"));
  -[ISmacosDocumentRecipe1016 hintedCornerSize](self, "hintedCornerSize");
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

  -[ISLayer addSublayer:](v26, "addSublayer:", v39);
  v44 = objc_alloc_init(ISContentLayer);
  -[ISLayer setCoordinateSystem:](v44, "setCoordinateSystem:", 1);
  -[ISLayer setFlipped:](v44, "setFlipped:", 1);
  -[ISLayer setBlendMode:](v44, "setBlendMode:", 19);
  -[ISLayer setName:](v44, "setName:", CFSTR("topLeft"));
  -[ISmacosDocumentRecipe1016 hintedCornerSize](self, "hintedCornerSize");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "hintedSizeForSize:", width, height);
  -[ISLayer setSize:](v44, "setSize:");

  objc_msgSend(MEMORY[0x1E0D3A798], "iconFoundationFrameworkBundle");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "assetCatalogURL");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  +[ISAssetCatalogResource assetCatalogResourceWithURL:imageName:error:](ISAssetCatalogResource, "assetCatalogResourceWithURL:imageName:error:", v47, CFSTR("document/bottom-right-mask"), 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISContentLayer setContent:](v44, "setContent:", v48);

  -[ISLayer addSublayer:](v26, "addSublayer:", v44);
  v49 = objc_alloc_init(ISContentLayer);
  -[ISLayer setSize:](v49, "setSize:", width, height);
  -[ISLayer setName:](v49, "setName:", CFSTR("mask layer"));
  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0);
  -[ISContentLayer setContent:](v49, "setContent:", v50);

  -[ISLayer addSublayer:](v49, "addSublayer:", v26);
  -[ISLayer setMask:](v24, "setMask:", v49);

  v51 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v51, "setName:", CFSTR("background layer"));
  -[ISLayer setSize:](v51, "setSize:", width, height);
  v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
  -[ISContentLayer setBackgroundColor:](v51, "setBackgroundColor:", v52);

  -[ISContentLayer setContent:](v51, "setContent:", CFSTR("kISBackgroundResourceKey"));
  -[ISLayer addSublayer:](v24, "addSublayer:", v51);

  v53 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v53, "setName:", CFSTR("gradient layer"));
  -[ISLayer setSize:](v53, "setSize:", width, height);
  objc_msgSend(MEMORY[0x1E0D3A798], "iconFoundationFrameworkBundle");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "assetCatalogURL");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  +[ISAssetCatalogResource assetCatalogResourceWithURL:imageName:error:](ISAssetCatalogResource, "assetCatalogResourceWithURL:imageName:error:", v55, CFSTR("document/gradient"), 0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISContentLayer setContent:](v53, "setContent:", v56);

  -[ISLayer addSublayer:](v24, "addSublayer:", v53);
  v57 = objc_alloc_init(ISContentLayer);
  -[ISmacosDocumentRecipe1016 hintedPaperRect](self, "hintedPaperRect");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "hintedRectForSize:", width, height);
  -[ISLayer setFrame:](v57, "setFrame:");

  -[ISLayer addSublayer:](v24, "addSublayer:", v57);
  v59 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v59, "setName:", CFSTR("badge layer"));
  -[ISLayer setFrame:](v59, "setFrame:", v9, v11, v13, v15);
  -[ISLayer setCoordinateSystem:](v59, "setCoordinateSystem:", 1);
  -[ISContentLayer setContent:](v59, "setContent:", CFSTR("kISBadgeResourceKey"));
  if (-[ISmacosDocumentRecipe1016 maskBadgeResource](self, "maskBadgeResource"))
  {
    v60 = objc_alloc_init(ISContentLayer);
    -[ISLayer setSize:](v60, "setSize:", v13, v15);
    -[ISLayer setName:](v60, "setName:", CFSTR("mask layer"));
    +[ISShapeCompositorResource continuousRoundedRectShape](ISShapeCompositorResource, "continuousRoundedRectShape");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISContentLayer setContent:](v60, "setContent:", v61);

    -[ISLayer setMask:](v59, "setMask:", v60);
  }
  -[ISLayer addSublayer:](v57, "addSublayer:", v59, v78, v80);

  if (width >= 32.0)
  {
    v62 = objc_alloc_init(ISTextLayer);
    -[ISLayer setName:](v62, "setName:", CFSTR("text layer"));
    -[ISLayer setFrame:](v62, "setFrame:", v81, v79, v20, v22);
    -[ISTextLayer setText:](v62, "setText:", CFSTR("kISTextResourceKey"));
    -[ISmacosDocumentRecipe1016 hintedFontSize](self, "hintedFontSize");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "hintedFloatForSize:", width, height);
    -[ISTextLayer setFontSize:](v62, "setFontSize:");

    v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithWhite:alpha:", 0.0, 1.0);
    -[ISTextLayer setColor:](v62, "setColor:", v64);

    v65 = objc_alloc_init(ISLegibilityEffect);
    -[ISLayer setEffect:](v62, "setEffect:", v65);
    -[ISLayer addSublayer:](v57, "addSublayer:", v62);

  }
  v66 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v66, "setName:", CFSTR("Forground layer"));
  -[ISLayer setCoordinateSystem:](v66, "setCoordinateSystem:", 3);
  -[ISmacosDocumentRecipe1016 hintedPageCurlSize](self, "hintedPageCurlSize");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "hintedSizeForSize:", width, height);
  -[ISLayer setSize:](v66, "setSize:");

  -[ISLayer setPosition:](v66, "setPosition:", 0.0, 0.0);
  objc_msgSend(MEMORY[0x1E0D3A798], "iconFoundationFrameworkBundle");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "assetCatalogURL");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  +[ISAssetCatalogResource assetCatalogResourceWithURL:imageName:error:](ISAssetCatalogResource, "assetCatalogResourceWithURL:imageName:error:", v69, CFSTR("document/page-fold"), 0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISContentLayer setContent:](v66, "setContent:", v70);

  -[ISLayer addSublayer:](v57, "addSublayer:", v66);
  v71 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v71, "setName:", CFSTR("shadow background layer"));
  -[ISLayer setSize:](v71, "setSize:", width, height);
  v72 = (void *)objc_opt_new();
  -[ISmacosDocumentRecipe1016 hintedShadowBlur](self, "hintedShadowBlur");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "hintedFloatForSize:", width, height);
  objc_msgSend(v72, "setBlur:");

  -[ISmacosDocumentRecipe1016 hintedShadowOffset](self, "hintedShadowOffset");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "hintedSizeForSize:", width, height);
  objc_msgSend(v72, "setOffset:");

  -[ISmacosDocumentRecipe1016 hintedShadowSpread](self, "hintedShadowSpread");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "hintedFloatForSize:", width, height);
  objc_msgSend(v72, "setSpread:");

  v76 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithWhite:alpha:", 0.0, 0.28);
  objc_msgSend(v72, "setColor:", v76);

  objc_msgSend(v72, "setScale:", a4);
  -[ISLayer setEffect:](v71, "setEffect:", v72);
  -[ISLayer addSublayer:](v82, "addSublayer:", v71);
  -[ISLayer addSublayer:](v71, "addSublayer:", v24);

  return v82;
}

- (BOOL)maskBadgeResource
{
  return self->_maskBadgeResource;
}

- (void)setMaskBadgeResource:(BOOL)a3
{
  self->_maskBadgeResource = a3;
}

@end
