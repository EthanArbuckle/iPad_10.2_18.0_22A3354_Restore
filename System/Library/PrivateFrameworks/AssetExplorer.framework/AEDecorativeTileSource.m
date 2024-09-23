@implementation AEDecorativeTileSource

+ (void)registerCommonDecorativeTilesToReusePool:(id)a3
{
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];

  v4 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __67__AEDecorativeTileSource_registerCommonDecorativeTilesToReusePool___block_invoke;
  v9[3] = &__block_descriptor_40_e5__8__0l;
  v9[4] = a1;
  v5 = a3;
  objc_msgSend(v5, "registerReusableObjectForReuseIdentifier:creationHandler:", 795209734, v9);
  objc_msgSend(v5, "registerReusableObjectForReuseIdentifier:creationHandler:", 795209735, &__block_literal_global_731);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __67__AEDecorativeTileSource_registerCommonDecorativeTilesToReusePool___block_invoke_3;
  v8[3] = &__block_descriptor_40_e5__8__0l;
  v8[4] = a1;
  objc_msgSend(v5, "registerReusableObjectForReuseIdentifier:creationHandler:", 795209731, v8);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __67__AEDecorativeTileSource_registerCommonDecorativeTilesToReusePool___block_invoke_4;
  v7[3] = &__block_descriptor_40_e5__8__0l;
  v7[4] = a1;
  objc_msgSend(v5, "registerReusableObjectForReuseIdentifier:creationHandler:", 795209732, v7);
  objc_msgSend(v5, "registerReusableObjectForReuseIdentifier:creationHandler:", 795209736, &__block_literal_global_146);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __67__AEDecorativeTileSource_registerCommonDecorativeTilesToReusePool___block_invoke_6;
  v6[3] = &__block_descriptor_40_e5__8__0l;
  v6[4] = a1;
  objc_msgSend(v5, "registerReusableObjectForReuseIdentifier:creationHandler:", 795209738, v6);

}

+ (id)_imageTileWithImage:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  AEGenericViewTile *v6;

  v3 = (objc_class *)MEMORY[0x24BEBD668];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithImage:", v4);

  v6 = -[AEGenericViewTile initWithView:]([AEGenericViewTile alloc], "initWithView:", v5);
  return v6;
}

+ (id)_imageTileWithImageNamed:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x24BEBD640];
  v5 = a3;
  AssetExplorerBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageNamed:inBundle:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_imageTileWithImage:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_imageTileWithSystemImageName:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)MEMORY[0x24BEBD660];
  v5 = a3;
  objc_msgSend(v4, "configurationWithScale:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "imageWithConfiguration:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageWithTintColor:renderingMode:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_imageTileWithImage:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __67__AEDecorativeTileSource_registerCommonDecorativeTilesToReusePool___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v2 = (void *)MEMORY[0x24BEBD640];
  AssetExplorerBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:", CFSTR("Gradient_shadow"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "resizableImageWithCapInsets:", 0.0, 1.0, 0.0, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_imageTileWithImage:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerRadius:", 12.5);

  v9 = *MEMORY[0x24BDE58E8];
  objc_msgSend(v6, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCornerCurve:", v9);

  objc_msgSend(v6, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMaskedCorners:", 12);

  objc_msgSend(v6, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAllowsGroupOpacity:", 0);

  objc_msgSend(v6, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setClipsToBounds:", 1);

  return v6;
}

uint64_t __67__AEDecorativeTileSource_registerCommonDecorativeTilesToReusePool___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_imageTileWithImageNamed:", CFSTR("Video_badge"));
}

uint64_t __67__AEDecorativeTileSource_registerCommonDecorativeTilesToReusePool___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_imageTileWithImageNamed:", CFSTR("Loop_badge"));
}

id __67__AEDecorativeTileSource_registerCommonDecorativeTilesToReusePool___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(MEMORY[0x24BDD1488], "px_bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:", CFSTR("spatial"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithTintColor:renderingMode:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_imageTileWithImage:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

AEGridOverlayView *__67__AEDecorativeTileSource_registerCommonDecorativeTilesToReusePool___block_invoke_5()
{
  return objc_alloc_init(AEGridOverlayView);
}

AEGenericViewTile *__67__AEDecorativeTileSource_registerCommonDecorativeTilesToReusePool___block_invoke_2()
{
  AEGradientShadowView *v0;
  AEGradientShadowView *v1;
  void *v2;
  AEGenericViewTile *v3;

  v0 = [AEGradientShadowView alloc];
  v1 = -[AEGradientShadowView initWithFrame:](v0, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[AEGradientShadowView layer](v1, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCornerRadius:", 12.5);

  v3 = -[AEGenericViewTile initWithView:]([AEGenericViewTile alloc], "initWithView:", v1);
  return v3;
}

@end
