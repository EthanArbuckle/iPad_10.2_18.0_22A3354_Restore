@implementation ISMultipleFilesRecipe

- (id)hintedPaperRect
{
  if (hintedPaperRect_onceToken_177 != -1)
    dispatch_once(&hintedPaperRect_onceToken_177, &__block_literal_global_178);
  return (id)hintedPaperRect_rect_176;
}

uint64_t __40__ISMultipleFilesRecipe_hintedPaperRect__block_invoke()
{
  ISHintedRect *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedRect alloc], "initWithOptions:", 3);
  v1 = (void *)hintedPaperRect_rect_176;
  hintedPaperRect_rect_176 = (uint64_t)v0;

  objc_msgSend((id)hintedPaperRect_rect_176, "addHintedRect:forSize:", 4.0, 2.0, 12.0, 14.0, 16.0, 16.0);
  objc_msgSend((id)hintedPaperRect_rect_176, "addHintedRect:forSize:", 7.0, 4.0, 22.0, 28.0, 32.0, 32.0);
  return objc_msgSend((id)hintedPaperRect_rect_176, "addHintedRect:forSize:", 104.0, 58.0, 344.0, 454.0, 512.0, 512.0);
}

- (id)hintedUnderPaperRect
{
  if (hintedUnderPaperRect_onceToken != -1)
    dispatch_once(&hintedUnderPaperRect_onceToken, &__block_literal_global_179);
  return (id)hintedUnderPaperRect_rect;
}

uint64_t __45__ISMultipleFilesRecipe_hintedUnderPaperRect__block_invoke()
{
  ISHintedRect *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedRect alloc], "initWithOptions:", 3);
  v1 = (void *)hintedUnderPaperRect_rect;
  hintedUnderPaperRect_rect = (uint64_t)v0;

  objc_msgSend((id)hintedUnderPaperRect_rect, "addHintedRect:forSize:", 2.0, 1.0, 12.0, 14.0, 16.0, 16.0);
  objc_msgSend((id)hintedUnderPaperRect_rect, "addHintedRect:forSize:", 3.0, 1.0, 22.0, 28.0, 32.0, 32.0);
  return objc_msgSend((id)hintedUnderPaperRect_rect, "addHintedRect:forSize:", 68.0, 22.0, 344.0, 454.0, 512.0, 512.0);
}

- (id)hintedPageCurlSize
{
  if (hintedPageCurlSize_onceToken_181 != -1)
    dispatch_once(&hintedPageCurlSize_onceToken_181, &__block_literal_global_182);
  return (id)hintedPageCurlSize_size_180;
}

uint64_t __43__ISMultipleFilesRecipe_hintedPageCurlSize__block_invoke()
{
  ISHintedSize *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedSize alloc], "initWithOptions:", 3);
  v1 = (void *)hintedPageCurlSize_size_180;
  hintedPageCurlSize_size_180 = (uint64_t)v0;

  objc_msgSend((id)hintedPageCurlSize_size_180, "addHintedSize:forSize:", 6.0, 6.0, 16.0, 16.0);
  objc_msgSend((id)hintedPageCurlSize_size_180, "addHintedSize:forSize:", 12.0, 12.0, 32.0, 32.0);
  objc_msgSend((id)hintedPageCurlSize_size_180, "addHintedSize:forSize:", 48.0, 48.0, 128.0, 128.0);
  objc_msgSend((id)hintedPageCurlSize_size_180, "addHintedSize:forSize:", 95.0, 95.0, 256.0, 256.0);
  return objc_msgSend((id)hintedPageCurlSize_size_180, "addHintedSize:forSize:", 190.0, 190.0, 512.0, 512.0);
}

- (id)hintedCornerSize
{
  if (hintedCornerSize_onceToken_184 != -1)
    dispatch_once(&hintedCornerSize_onceToken_184, &__block_literal_global_185);
  return (id)hintedCornerSize_size_183;
}

uint64_t __41__ISMultipleFilesRecipe_hintedCornerSize__block_invoke()
{
  ISHintedSize *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedSize alloc], "initWithOptions:", 3);
  v1 = (void *)hintedCornerSize_size_183;
  hintedCornerSize_size_183 = (uint64_t)v0;

  objc_msgSend((id)hintedCornerSize_size_183, "addHintedSize:forSize:", 1.0, 1.0, 16.0, 16.0);
  objc_msgSend((id)hintedCornerSize_size_183, "addHintedSize:forSize:", 2.0, 2.0, 32.0, 32.0);
  objc_msgSend((id)hintedCornerSize_size_183, "addHintedSize:forSize:", 5.0, 5.0, 128.0, 128.0);
  objc_msgSend((id)hintedCornerSize_size_183, "addHintedSize:forSize:", 9.0, 9.0, 256.0, 256.0);
  return objc_msgSend((id)hintedCornerSize_size_183, "addHintedSize:forSize:", 18.0, 18.0, 512.0, 512.0);
}

- (id)hintedShadowBlur
{
  if (hintedShadowBlur_onceToken_187 != -1)
    dispatch_once(&hintedShadowBlur_onceToken_187, &__block_literal_global_188);
  return (id)hintedShadowBlur_value_186;
}

uint64_t __41__ISMultipleFilesRecipe_hintedShadowBlur__block_invoke()
{
  ISHintedFloat *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedFloat alloc], "initWithOptions:", 1);
  v1 = (void *)hintedShadowBlur_value_186;
  hintedShadowBlur_value_186 = (uint64_t)v0;

  objc_msgSend((id)hintedShadowBlur_value_186, "addHintedFloat:forSize:", 1.0, 16.0, 16.0);
  objc_msgSend((id)hintedShadowBlur_value_186, "addHintedFloat:forSize:", 1.0, 32.0, 32.0);
  objc_msgSend((id)hintedShadowBlur_value_186, "addHintedFloat:forSize:", 3.0, 128.0, 128.0);
  objc_msgSend((id)hintedShadowBlur_value_186, "addHintedFloat:forSize:", 6.0, 256.0, 256.0);
  return objc_msgSend((id)hintedShadowBlur_value_186, "addHintedFloat:forSize:", 11.5, 512.0, 512.0);
}

- (id)hintedShadowOffset
{
  if (hintedShadowOffset_onceToken_190 != -1)
    dispatch_once(&hintedShadowOffset_onceToken_190, &__block_literal_global_191);
  return (id)hintedShadowOffset_value_189;
}

uint64_t __43__ISMultipleFilesRecipe_hintedShadowOffset__block_invoke()
{
  ISHintedSize *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedSize alloc], "initWithOptions:", 1);
  v1 = (void *)hintedShadowOffset_value_189;
  hintedShadowOffset_value_189 = (uint64_t)v0;

  objc_msgSend((id)hintedShadowOffset_value_189, "addHintedSize:forSize:", 0.0, -0.5, 16.0, 16.0);
  objc_msgSend((id)hintedShadowOffset_value_189, "addHintedSize:forSize:", 0.0, -1.0, 32.0, 32.0);
  objc_msgSend((id)hintedShadowOffset_value_189, "addHintedSize:forSize:", 0.0, -2.5, 128.0, 128.0);
  objc_msgSend((id)hintedShadowOffset_value_189, "addHintedSize:forSize:", 0.0, -5.0, 256.0, 256.0);
  return objc_msgSend((id)hintedShadowOffset_value_189, "addHintedSize:forSize:", 0.0, -10.0, 512.0, 512.0);
}

- (id)documentLayerWithRect:(CGRect)a3 withPageFold:(BOOL)a4 iconSize:(CGSize)a5 scale:(double)a6
{
  double height;
  double width;
  double v9;
  double v10;
  double y;
  double x;
  ISContentLayer *v14;
  void *v15;
  ISContentLayer *v16;
  void *v17;
  ISContentLayer *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  ISContentLayer *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  ISContentLayer *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  ISContentLayer *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  ISContentLayer *v38;
  void *v39;
  ISContentLayer *v40;
  void *v41;
  ISContentLayer *v42;
  void *v43;
  void *v44;
  void *v45;
  ISContentLayer *v46;
  void *v47;
  ISContentLayer *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  ISContentLayer *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  _BOOL4 v61;

  height = a5.height;
  width = a5.width;
  v61 = a4;
  v9 = a3.size.height;
  v10 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v14, "setName:", CFSTR("masked layer"));
  -[ISLayer setSize:](v14, "setSize:", width, height);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
  -[ISContentLayer setContent:](v14, "setContent:", v15);

  v16 = objc_alloc_init(ISContentLayer);
  -[ISLayer setFrame:](v16, "setFrame:", x, y, v10, v9);
  -[ISLayer setName:](v16, "setName:", CFSTR("mask shape layer"));
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
  -[ISContentLayer setContent:](v16, "setContent:", v17);

  v18 = objc_alloc_init(ISContentLayer);
  -[ISLayer setCoordinateSystem:](v18, "setCoordinateSystem:", 0);
  -[ISLayer setBlendMode:](v18, "setBlendMode:", 19);
  -[ISLayer setName:](v18, "setName:", CFSTR("bottomLeft"));
  -[ISMultipleFilesRecipe hintedCornerSize](self, "hintedCornerSize");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "hintedSizeForSize:", width, height);
  -[ISLayer setSize:](v18, "setSize:");

  objc_msgSend(MEMORY[0x1E0D3A798], "iconFoundationFrameworkBundle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "assetCatalogURL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[ISAssetCatalogResource assetCatalogResourceWithURL:imageName:error:](ISAssetCatalogResource, "assetCatalogResourceWithURL:imageName:error:", v21, CFSTR("document/bottom-right-mask"), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISContentLayer setContent:](v18, "setContent:", v22);

  -[ISLayer addSublayer:](v16, "addSublayer:", v18);
  v23 = objc_alloc_init(ISContentLayer);
  -[ISLayer setCoordinateSystem:](v23, "setCoordinateSystem:", 3);
  -[ISLayer setBlendMode:](v23, "setBlendMode:", 19);
  -[ISLayer setName:](v23, "setName:", CFSTR("topRight"));
  -[ISMultipleFilesRecipe hintedPageCurlSize](self, "hintedPageCurlSize");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "hintedSizeForSize:", width, height);
  -[ISLayer setSize:](v23, "setSize:");

  objc_msgSend(MEMORY[0x1E0D3A798], "iconFoundationFrameworkBundle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "assetCatalogURL");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[ISAssetCatalogResource assetCatalogResourceWithURL:imageName:error:](ISAssetCatalogResource, "assetCatalogResourceWithURL:imageName:error:", v26, CFSTR("document/top-right-mask"), 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISContentLayer setContent:](v23, "setContent:", v27);

  -[ISLayer addSublayer:](v16, "addSublayer:", v23);
  v28 = objc_alloc_init(ISContentLayer);
  -[ISLayer setCoordinateSystem:](v28, "setCoordinateSystem:", 2);
  -[ISLayer setFlipped:](v28, "setFlipped:", 2);
  -[ISLayer setBlendMode:](v28, "setBlendMode:", 19);
  -[ISLayer setName:](v28, "setName:", CFSTR("bottomRight"));
  -[ISMultipleFilesRecipe hintedCornerSize](self, "hintedCornerSize");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "hintedSizeForSize:", width, height);
  -[ISLayer setSize:](v28, "setSize:");

  objc_msgSend(MEMORY[0x1E0D3A798], "iconFoundationFrameworkBundle");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "assetCatalogURL");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[ISAssetCatalogResource assetCatalogResourceWithURL:imageName:error:](ISAssetCatalogResource, "assetCatalogResourceWithURL:imageName:error:", v31, CFSTR("document/bottom-right-mask"), 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISContentLayer setContent:](v28, "setContent:", v32);

  -[ISLayer addSublayer:](v16, "addSublayer:", v28);
  v33 = objc_alloc_init(ISContentLayer);
  -[ISLayer setCoordinateSystem:](v33, "setCoordinateSystem:", 1);
  -[ISLayer setFlipped:](v33, "setFlipped:", 1);
  -[ISLayer setBlendMode:](v33, "setBlendMode:", 19);
  -[ISLayer setName:](v33, "setName:", CFSTR("topLeft"));
  -[ISMultipleFilesRecipe hintedCornerSize](self, "hintedCornerSize");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "hintedSizeForSize:", width, height);
  -[ISLayer setSize:](v33, "setSize:");

  objc_msgSend(MEMORY[0x1E0D3A798], "iconFoundationFrameworkBundle");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "assetCatalogURL");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[ISAssetCatalogResource assetCatalogResourceWithURL:imageName:error:](ISAssetCatalogResource, "assetCatalogResourceWithURL:imageName:error:", v36, CFSTR("document/bottom-right-mask"), 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISContentLayer setContent:](v33, "setContent:", v37);

  -[ISLayer addSublayer:](v16, "addSublayer:", v33);
  v38 = objc_alloc_init(ISContentLayer);
  -[ISLayer setSize:](v38, "setSize:", width, height);
  -[ISLayer setName:](v38, "setName:", CFSTR("mask layer"));
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0);
  -[ISContentLayer setContent:](v38, "setContent:", v39);

  -[ISLayer addSublayer:](v38, "addSublayer:", v16);
  -[ISLayer setMask:](v14, "setMask:", v38);

  v40 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v40, "setName:", CFSTR("background layer"));
  -[ISLayer setSize:](v40, "setSize:", width, height);
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
  -[ISContentLayer setBackgroundColor:](v40, "setBackgroundColor:", v41);

  -[ISContentLayer setContent:](v40, "setContent:", CFSTR("kISBackgroundResourceKey"));
  -[ISLayer addSublayer:](v14, "addSublayer:", v40);

  v42 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v42, "setName:", CFSTR("gradient layer"));
  -[ISLayer setSize:](v42, "setSize:", width, height);
  objc_msgSend(MEMORY[0x1E0D3A798], "iconFoundationFrameworkBundle");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "assetCatalogURL");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  +[ISAssetCatalogResource assetCatalogResourceWithURL:imageName:error:](ISAssetCatalogResource, "assetCatalogResourceWithURL:imageName:error:", v44, CFSTR("document/gradient"), 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISContentLayer setContent:](v42, "setContent:", v45);

  -[ISLayer addSublayer:](v14, "addSublayer:", v42);
  if (v61)
  {
    v46 = objc_alloc_init(ISContentLayer);
    -[ISMultipleFilesRecipe hintedPaperRect](self, "hintedPaperRect");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "hintedRectForSize:", width, height);
    -[ISLayer setFrame:](v46, "setFrame:");

    -[ISLayer addSublayer:](v14, "addSublayer:", v46);
    v48 = objc_alloc_init(ISContentLayer);
    -[ISLayer setName:](v48, "setName:", CFSTR("Forground layer"));
    -[ISLayer setCoordinateSystem:](v48, "setCoordinateSystem:", 3);
    -[ISMultipleFilesRecipe hintedPageCurlSize](self, "hintedPageCurlSize");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "hintedSizeForSize:", width, height);
    -[ISLayer setSize:](v48, "setSize:");

    -[ISLayer setPosition:](v48, "setPosition:", 0.0, 0.0);
    objc_msgSend(MEMORY[0x1E0D3A798], "iconFoundationFrameworkBundle");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "assetCatalogURL");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    +[ISAssetCatalogResource assetCatalogResourceWithURL:imageName:error:](ISAssetCatalogResource, "assetCatalogResourceWithURL:imageName:error:", v51, CFSTR("document/page-fold"), 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISContentLayer setContent:](v48, "setContent:", v52);

    -[ISLayer addSublayer:](v46, "addSublayer:", v48);
  }
  v53 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v53, "setName:", CFSTR("shadow background layer"));
  -[ISLayer setSize:](v53, "setSize:", width, height);
  v54 = (void *)objc_opt_new();
  -[ISMultipleFilesRecipe hintedShadowBlur](self, "hintedShadowBlur");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "hintedFloatForSize:", width, height);
  objc_msgSend(v54, "setBlur:");

  -[ISMultipleFilesRecipe hintedShadowOffset](self, "hintedShadowOffset");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "hintedSizeForSize:", width, height);
  objc_msgSend(v54, "setOffset:");

  -[ISMultipleFilesRecipe hintedShadowBlur](self, "hintedShadowBlur");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "hintedFloatForSize:", width, height);
  objc_msgSend(v54, "setSpread:");

  v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithWhite:alpha:", 0.0, 0.28);
  objc_msgSend(v54, "setColor:", v58);

  objc_msgSend(v54, "setScale:", a6);
  -[ISLayer setEffect:](v53, "setEffect:", v54);
  -[ISLayer addSublayer:](v53, "addSublayer:", v14);
  v59 = (void *)objc_opt_new();
  objc_msgSend(v59, "setSize:", width, height);
  objc_msgSend(v59, "addSublayer:", v53);

  return v59;
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
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;

  height = a3.height;
  width = a3.width;
  v8 = objc_alloc_init(ISLayer);
  -[ISLayer setSize:](v8, "setSize:", width, height);
  -[ISLayer setName:](v8, "setName:", CFSTR("root layer"));
  -[ISMultipleFilesRecipe hintedUnderPaperRect](self, "hintedUnderPaperRect");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hintedRectForSize:", width, height);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  -[ISMultipleFilesRecipe documentLayerWithRect:withPageFold:iconSize:scale:](self, "documentLayerWithRect:withPageFold:iconSize:scale:", 0, v11, v13, v15, v17, width, height, a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISLayer addSublayer:](v8, "addSublayer:", v18);

  -[ISMultipleFilesRecipe hintedPaperRect](self, "hintedPaperRect");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "hintedRectForSize:", width, height);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  -[ISMultipleFilesRecipe documentLayerWithRect:withPageFold:iconSize:scale:](self, "documentLayerWithRect:withPageFold:iconSize:scale:", 1, v21, v23, v25, v27, width, height, a4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISLayer addSublayer:](v8, "addSublayer:", v28);

  return v8;
}

@end
