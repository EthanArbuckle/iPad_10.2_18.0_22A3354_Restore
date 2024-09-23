@implementation AVTColorLayerProvider

- (id)providerForColorIntoLayer
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__AVTColorLayerProvider_providerForColorIntoLayer__block_invoke;
  v3[3] = &unk_1EA51FBA0;
  v3[4] = self;
  return (id)objc_msgSend(v3, "copy");
}

uint64_t __50__AVTColorLayerProvider_providerForColorIntoLayer__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "renderColorForColorPreset:skinColor:intoLayer:", a2, a3, a4);
}

- (id)providerForGradientFromColor
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__AVTColorLayerProvider_providerForGradientFromColor__block_invoke;
  v3[3] = &unk_1EA51FBC8;
  v3[4] = self;
  return (id)objc_msgSend(v3, "copy");
}

uint64_t __53__AVTColorLayerProvider_providerForGradientFromColor__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "renderColorGradientForModelColor:skinColor:handler:", a2, a3, a4);
}

- (void)renderColorForColorPreset:(id)a3 skinColor:(id)a4 intoLayer:(id)a5
{
  objc_msgSend(a3, "renderColorIntoCALayer:withSkinColor:", a5, a4);
}

- (void)renderColorGradientForModelColor:(id)a3 skinColor:(id)a4 handler:(id)a5
{
  void (**v7)(id, void *);
  id v8;
  id v9;
  int v10;
  int v11;
  int v12;
  int v13;
  double v14;
  double v15;
  void *v16;
  id v17;

  v7 = (void (**)(id, void *))a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "baseColorPreset");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rangeMin");
  v11 = v10;
  objc_msgSend(v9, "rangeMax");
  v13 = v12;

  LODWORD(v14) = v11;
  LODWORD(v15) = v13;
  objc_msgSend(v17, "gradientLayerWithRangeMin:max:withSkinColor:", v8, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v7[2](v7, v16);
}

@end
