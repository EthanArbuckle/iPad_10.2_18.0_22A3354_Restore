@implementation MusicKit_SoftLinking_CoverArtworkDataSource

+ (MusicKit_SoftLinking_CoverArtworkDataSource)sharedDataSource
{
  if (sharedDataSource_sOnceToken != -1)
    dispatch_once(&sharedDataSource_sOnceToken, &__block_literal_global_1);
  return (MusicKit_SoftLinking_CoverArtworkDataSource *)(id)sharedDataSource_sSharedDataSource;
}

- (MusicKit_SoftLinking_CoverArtworkDataSource)init
{
  MusicKit_SoftLinking_CoverArtworkDataSource *v2;
  NSCache *v3;
  NSCache *cache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MusicKit_SoftLinking_CoverArtworkDataSource;
  v2 = -[MusicKit_SoftLinking_CoverArtworkDataSource init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    cache = v2->_cache;
    v2->_cache = v3;

  }
  return v2;
}

- (BOOL)areRepresentationsAvailableForCatalog:(id)a3
{
  return 1;
}

- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4
{
  return 1;
}

- (id)existingRepresentationForArtworkCatalog:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "token");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (objc_msgSend(v4, "fittingSize"),
        -[MusicKit_SoftLinking_CoverArtworkDataSource _cacheIdentifierForCoverArtworkRecipeToken:withSize:](self, "_cacheIdentifierForCoverArtworkRecipeToken:withSize:", v5), (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = (void *)v6;
    -[NSCache objectForKey:](self->_cache, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  objc_msgSend(v6, "token");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "fittingSize");
    v10 = v9;
    v12 = v11;
    objc_msgSend(v6, "destinationScale");
    -[MusicKit_SoftLinking_CoverArtworkDataSource _coverArtworkImageWithSize:destinationScale:coverArtworkToken:](self, "_coverArtworkImageWithSize:destinationScale:coverArtworkToken:", v8, v10, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v25 = &v24;
    v26 = 0x2050000000;
    v15 = (void *)getMPArtworkRepresentationClass_softClass;
    v27 = getMPArtworkRepresentationClass_softClass;
    if (!getMPArtworkRepresentationClass_softClass)
    {
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __getMPArtworkRepresentationClass_block_invoke;
      v23[3] = &unk_24CD1CC68;
      v23[4] = &v24;
      __getMPArtworkRepresentationClass_block_invoke((uint64_t)v23);
      v15 = (void *)v25[3];
    }
    v16 = objc_retainAutorelease(v15);
    _Block_object_dispose(&v24, 8);
    objc_msgSend(v16, "representationForVisualIdentity:withSize:image:", v8, v14, v10, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MusicKit_SoftLinking_CoverArtworkDataSource _cacheIdentifierForCoverArtworkRecipeToken:withSize:](self, "_cacheIdentifierForCoverArtworkRecipeToken:withSize:", v8, v10, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      -[NSCache setObject:forKey:](self->_cache, "setObject:forKey:", v17, v18);
    v7[2](v7, v17, 0);

  }
  else
  {
    v19 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "token");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("MPArtworkCatalog token can not be converted to MusicKit_SoftLinking_CoverArtworkToken: %@"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MusicKit_SoftLinking_CoverArtworkDataSource _errorWithDescription:](self, "_errorWithDescription:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(id, void *, void *))v7)[2](v7, 0, v22);
  }

}

- (id)visualIdenticalityIdentifierForCatalog:(id)a3
{
  return (id)objc_msgSend(a3, "token");
}

- (id)_cacheIdentifierForCoverArtworkRecipeToken:(id)a3 withSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  void *v6;
  void *v7;

  height = a4.height;
  width = a4.width;
  objc_msgSend(a3, "stringRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@, width: %f, height: %f"), v6, *(_QWORD *)&width, *(_QWORD *)&height);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_coverArtworkImageWithSize:(CGSize)a3 destinationScale:(double)a4 coverArtworkToken:(id)a5
{
  double height;
  double width;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  int v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v25;
  id v26;
  _QWORD v28[4];
  id v29;
  double v30;
  double v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  double v36;
  double v37;
  double v38;
  _QWORD v39[5];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;

  height = a3.height;
  width = a3.width;
  v9 = a5;
  objc_msgSend(v9, "playlistName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getUIGraphicsImageRendererFormatClass(), "preferredFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setScale:", a4);
  v40 = 0;
  v41 = &v40;
  v42 = 0x2050000000;
  v12 = (void *)getEMFStringUtilitiesClass_softClass;
  v43 = getEMFStringUtilitiesClass_softClass;
  v13 = MEMORY[0x24BDAC760];
  if (!getEMFStringUtilitiesClass_softClass)
  {
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __getEMFStringUtilitiesClass_block_invoke;
    v39[3] = &unk_24CD1CC68;
    v39[4] = &v40;
    __getEMFStringUtilitiesClass_block_invoke((uint64_t)v39);
    v12 = (void *)v41[3];
  }
  v14 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v40, 8);
  v15 = objc_msgSend(v10, "_containsEmoji");
  if (width >= 270.0)
    v16 = width;
  else
    v16 = 270.0;
  if (v15)
    v17 = height;
  else
    v17 = v16;
  if (v15)
    v18 = width;
  else
    v18 = v16;
  v19 = (void *)objc_msgSend(objc_alloc((Class)getUIGraphicsImageRendererClass()), "initWithSize:format:", v11, v18, v17);
  v32[0] = v13;
  v32[1] = 3221225472;
  v32[2] = __109__MusicKit_SoftLinking_CoverArtworkDataSource__coverArtworkImageWithSize_destinationScale_coverArtworkToken___block_invoke;
  v32[3] = &unk_24CD1CD88;
  v36 = v18;
  v37 = v17;
  v32[4] = self;
  v20 = v9;
  v33 = v20;
  v21 = v10;
  v34 = v21;
  v38 = 270.0 / v18;
  v22 = v11;
  v35 = v22;
  objc_msgSend(v19, "imageWithActions:", v32);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18 != width || v17 != height)
  {
    v25 = (void *)objc_msgSend(objc_alloc((Class)getUIGraphicsImageRendererClass()), "initWithSize:format:", v22, width, height);
    v28[0] = v13;
    v28[1] = 3221225472;
    v28[2] = __109__MusicKit_SoftLinking_CoverArtworkDataSource__coverArtworkImageWithSize_destinationScale_coverArtworkToken___block_invoke_2;
    v28[3] = &unk_24CD1CDB0;
    v29 = v23;
    v30 = width;
    v31 = height;
    v26 = v23;
    objc_msgSend(v25, "imageWithActions:", v28);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v23;
}

- (double)roundValueFor:(double)a3 toScale:(double)a4
{
  _BOOL4 v4;
  double v5;
  double v6;

  v4 = 0;
  if (a4 != 0.0)
  {
    v5 = fabs(a4);
    v4 = v5 != INFINITY;
    if (v5 > fmax(v5 * 0.0000000149011612, 0.0))
      v4 = 0;
  }
  if (a4 < 0.0)
    v4 = 1;
  v6 = 1.0;
  if (!v4)
    v6 = a4;
  return round(a3 * a4) / v6;
}

- (id)_errorWithDescription:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v8 = *MEMORY[0x24BDD0BA0];
  v9[0] = a3;
  v3 = (void *)MEMORY[0x24BDBCE70];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MusicKit_SoftLinking_CoverArtworkRecipeError"), 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)imageForCoverArtworkRecipe:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  CGColorSpaceRef DeviceRGB;
  uint64_t v15;
  void *v16;

  v4 = a3;
  objc_msgSend(v4, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", CFSTR("1.0"));

  if (v6)
  {
    objc_msgSend(v4, "backgroundColor");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      objc_msgSend(v4, "primaryColor");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        v16 = 0;
LABEL_20:

        goto LABEL_21;
      }
      v10 = (void *)v9;
      objc_msgSend(v4, "secondaryColor");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
LABEL_10:
        v16 = 0;
LABEL_19:

        goto LABEL_20;
      }
      v12 = (void *)v11;
      objc_msgSend(v4, "tertiaryColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(getUIGraphicsImageRendererFormatClass(), "preferredFormat");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(objc_alloc((Class)getUIGraphicsImageRendererClass()), "initWithSize:format:", v8, 180.0, 180.0);
        DeviceRGB = CGColorSpaceCreateDeviceRGB();
        switch(objc_msgSend(v4, "expression"))
        {
          case 1:
            -[MusicKit_SoftLinking_CoverArtworkDataSource _generateSimpleGradientImageForCoverArtworkRecipe:withImageRenderer:size:andSpace:](self, "_generateSimpleGradientImageForCoverArtworkRecipe:withImageRenderer:size:andSpace:", v4, v10, DeviceRGB, 180.0, 180.0);
            v15 = objc_claimAutoreleasedReturnValue();
            break;
          case 2:
            -[MusicKit_SoftLinking_CoverArtworkDataSource _generateGradientVinylImageForCoverArtworkRecipe:withImageRenderer:size:andSpace:](self, "_generateGradientVinylImageForCoverArtworkRecipe:withImageRenderer:size:andSpace:", v4, v10, DeviceRGB, 180.0, 180.0);
            v15 = objc_claimAutoreleasedReturnValue();
            break;
          case 3:
            -[MusicKit_SoftLinking_CoverArtworkDataSource _generateLinearGradientImageForCoverArtworkRecipe:withImageRenderer:size:andSpace:](self, "_generateLinearGradientImageForCoverArtworkRecipe:withImageRenderer:size:andSpace:", v4, v10, DeviceRGB, 180.0, 180.0);
            v15 = objc_claimAutoreleasedReturnValue();
            break;
          case 4:
            -[MusicKit_SoftLinking_CoverArtworkDataSource _generateGradientSoundwaveImageForCoverArtworkRecipe:withImageRenderer:size:andSpace:](self, "_generateGradientSoundwaveImageForCoverArtworkRecipe:withImageRenderer:size:andSpace:", v4, v10, DeviceRGB, 180.0, 180.0);
            v15 = objc_claimAutoreleasedReturnValue();
            break;
          case 5:
            -[MusicKit_SoftLinking_CoverArtworkDataSource _generateAngularGradientImageForCoverArtworkRecipe:withImageRenderer:size:andSpace:](self, "_generateAngularGradientImageForCoverArtworkRecipe:withImageRenderer:size:andSpace:", v4, v10, DeviceRGB, 180.0, 180.0);
            v15 = objc_claimAutoreleasedReturnValue();
            break;
          case 6:
            -[MusicKit_SoftLinking_CoverArtworkDataSource _generateRadialGradientImageForCoverArtworkRecipe:withImageRenderer:size:andSpace:](self, "_generateRadialGradientImageForCoverArtworkRecipe:withImageRenderer:size:andSpace:", v4, v10, DeviceRGB, 180.0, 180.0);
            v15 = objc_claimAutoreleasedReturnValue();
            break;
          case 7:
            -[MusicKit_SoftLinking_CoverArtworkDataSource _generateGradientArchesImageForCoverArtworkRecipe:withImageRenderer:size:andSpace:](self, "_generateGradientArchesImageForCoverArtworkRecipe:withImageRenderer:size:andSpace:", v4, v10, DeviceRGB, 180.0, 180.0);
            v15 = objc_claimAutoreleasedReturnValue();
            break;
          case 8:
            -[MusicKit_SoftLinking_CoverArtworkDataSource _generateNineDotGradientImageForCoverArtworkRecipe:withImageRenderer:size:andSpace:](self, "_generateNineDotGradientImageForCoverArtworkRecipe:withImageRenderer:size:andSpace:", v4, v10, DeviceRGB, 180.0, 180.0);
            v15 = objc_claimAutoreleasedReturnValue();
            break;
          default:
            goto LABEL_10;
        }
        v16 = (void *)v15;
        goto LABEL_19;
      }
    }
  }
  v16 = 0;
LABEL_21:

  return v16;
}

- (id)_generateSimpleGradientImageForCoverArtworkRecipe:(id)a3 withImageRenderer:(id)a4 size:(CGSize)a5 andSpace:(CGColorSpace *)a6
{
  CGFloat height;
  CGFloat width;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[10];

  height = a5.height;
  width = a5.width;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v11, "backgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "primaryColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "secondaryColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "tertiaryColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  if (v12 && v13 && v14 && v15)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __129__MusicKit_SoftLinking_CoverArtworkDataSource__generateSimpleGradientImageForCoverArtworkRecipe_withImageRenderer_size_andSpace___block_invoke;
    v18[3] = &__block_descriptor_80_e40_v16__0__UIGraphicsImageRendererContext_8l;
    v18[4] = v12;
    *(CGFloat *)&v18[5] = width;
    *(CGFloat *)&v18[6] = height;
    v18[7] = v15;
    v18[8] = a6;
    v18[9] = v13;
    objc_msgSend(v10, "imageWithActions:", v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (id)_generateGradientVinylImageForCoverArtworkRecipe:(id)a3 withImageRenderer:(id)a4 size:(CGSize)a5 andSpace:(CGColorSpace *)a6
{
  CGFloat height;
  CGFloat width;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  void *v20;
  CGFloat v21;
  CGFloat v22;
  void *v23;
  CGColorSpace *v24;
  void *v25;

  height = a5.height;
  width = a5.width;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v11, "backgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "primaryColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "secondaryColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "tertiaryColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  if (v12 && v13 && v14 && v15)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __128__MusicKit_SoftLinking_CoverArtworkDataSource__generateGradientVinylImageForCoverArtworkRecipe_withImageRenderer_size_andSpace___block_invoke;
    v18[3] = &unk_24CD1CE20;
    v20 = v12;
    v21 = width;
    v22 = height;
    v23 = v15;
    v24 = a6;
    v25 = v14;
    v19 = v10;
    objc_msgSend(v19, "imageWithActions:", v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

- (id)_generateLinearGradientImageForCoverArtworkRecipe:(id)a3 withImageRenderer:(id)a4 size:(CGSize)a5 andSpace:(CGColorSpace *)a6
{
  CGFloat height;
  CGFloat width;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[10];

  height = a5.height;
  width = a5.width;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v11, "backgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "primaryColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "secondaryColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "tertiaryColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  if (v12 && v13 && v14 && v15)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __129__MusicKit_SoftLinking_CoverArtworkDataSource__generateLinearGradientImageForCoverArtworkRecipe_withImageRenderer_size_andSpace___block_invoke;
    v18[3] = &__block_descriptor_80_e40_v16__0__UIGraphicsImageRendererContext_8l;
    v18[4] = v12;
    *(CGFloat *)&v18[5] = width;
    *(CGFloat *)&v18[6] = height;
    v18[7] = v13;
    v18[8] = v14;
    v18[9] = a6;
    objc_msgSend(v10, "imageWithActions:", v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (id)_generateGradientSoundwaveImageForCoverArtworkRecipe:(id)a3 withImageRenderer:(id)a4 size:(CGSize)a5 andSpace:(CGColorSpace *)a6
{
  CGFloat height;
  CGFloat width;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[10];

  height = a5.height;
  width = a5.width;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v11, "backgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "primaryColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "secondaryColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "tertiaryColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  if (v12 && v13 && v14 && v15)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __132__MusicKit_SoftLinking_CoverArtworkDataSource__generateGradientSoundwaveImageForCoverArtworkRecipe_withImageRenderer_size_andSpace___block_invoke;
    v18[3] = &__block_descriptor_80_e40_v16__0__UIGraphicsImageRendererContext_8l;
    v18[4] = v15;
    *(CGFloat *)&v18[5] = width;
    *(CGFloat *)&v18[6] = height;
    v18[7] = v12;
    v18[8] = v13;
    v18[9] = a6;
    objc_msgSend(v10, "imageWithActions:", v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (id)_generateAngularGradientImageForCoverArtworkRecipe:(id)a3 withImageRenderer:(id)a4 size:(CGSize)a5 andSpace:(CGColorSpace *)a6
{
  CGFloat height;
  CGFloat width;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[10];

  height = a5.height;
  width = a5.width;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v11, "backgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "primaryColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "secondaryColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "tertiaryColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  if (v12 && v13 && v14 && v15)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __130__MusicKit_SoftLinking_CoverArtworkDataSource__generateAngularGradientImageForCoverArtworkRecipe_withImageRenderer_size_andSpace___block_invoke;
    v18[3] = &__block_descriptor_80_e40_v16__0__UIGraphicsImageRendererContext_8l;
    v18[4] = v12;
    v18[5] = v14;
    v18[6] = v15;
    v18[7] = a6;
    *(CGFloat *)&v18[8] = width;
    *(CGFloat *)&v18[9] = height;
    objc_msgSend(v10, "imageWithActions:", v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (id)_generateRadialGradientImageForCoverArtworkRecipe:(id)a3 withImageRenderer:(id)a4 size:(CGSize)a5 andSpace:(CGColorSpace *)a6
{
  CGFloat height;
  CGFloat width;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[10];

  height = a5.height;
  width = a5.width;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v11, "backgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "primaryColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "secondaryColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "tertiaryColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  if (v12 && v13 && v14 && v15)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __129__MusicKit_SoftLinking_CoverArtworkDataSource__generateRadialGradientImageForCoverArtworkRecipe_withImageRenderer_size_andSpace___block_invoke;
    v18[3] = &__block_descriptor_80_e40_v16__0__UIGraphicsImageRendererContext_8l;
    v18[4] = v15;
    v18[5] = v12;
    v18[6] = v13;
    v18[7] = a6;
    *(CGFloat *)&v18[8] = width;
    *(CGFloat *)&v18[9] = height;
    objc_msgSend(v10, "imageWithActions:", v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (id)_generateGradientArchesImageForCoverArtworkRecipe:(id)a3 withImageRenderer:(id)a4 size:(CGSize)a5 andSpace:(CGColorSpace *)a6
{
  CGFloat height;
  CGFloat width;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  _QWORD v21[4];
  id v22;
  void *v23;
  void *v24;
  void *v25;
  CGColorSpace *v26;
  CGFloat v27;
  CGFloat v28;
  uint64_t v29;
  uint64_t v30;
  CGFloat v31;
  CGFloat v32;
  _QWORD v33[9];

  height = a5.height;
  width = a5.width;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v12, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "primaryColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "secondaryColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "tertiaryColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  if (v13 && v14 && v15 && v16)
  {
    v18 = MEMORY[0x24BDAC760];
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __129__MusicKit_SoftLinking_CoverArtworkDataSource__generateGradientArchesImageForCoverArtworkRecipe_withImageRenderer_size_andSpace___block_invoke;
    v33[3] = &unk_24CD1CE48;
    v33[5] = 0;
    v33[6] = 0;
    v33[4] = self;
    *(CGFloat *)&v33[7] = width;
    *(CGFloat *)&v33[8] = height;
    objc_msgSend(v11, "imageWithActions:", v33);
    v21[0] = v18;
    v21[1] = 3221225472;
    v21[2] = __129__MusicKit_SoftLinking_CoverArtworkDataSource__generateGradientArchesImageForCoverArtworkRecipe_withImageRenderer_size_andSpace___block_invoke_2;
    v21[3] = &unk_24CD1CDF8;
    v24 = v14;
    v25 = v16;
    v26 = a6;
    v27 = width;
    v28 = height;
    v29 = 0;
    v30 = 0;
    v31 = width;
    v32 = height;
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v23 = v13;
    v19 = v22;
    objc_msgSend(v11, "imageWithActions:", v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

- (id)_generateNineDotGradientImageForCoverArtworkRecipe:(id)a3 withImageRenderer:(id)a4 size:(CGSize)a5 andSpace:(CGColorSpace *)a6
{
  double height;
  double width;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  id v29;
  CGImage *v30;
  CGImageRef v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  double v51;
  _QWORD v52[6];
  _QWORD v53[4];
  id v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  CGColorSpace *v60;
  CGRect v61;

  height = a5.height;
  width = a5.width;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v11, "backgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "primaryColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "secondaryColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "tertiaryColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  if (v12 && v13 && v14 && v15)
  {
    objc_msgSend(getUIColorClass(), "colorWithCGColor:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc((Class)getUIGraphicsImageRendererClass());
    objc_msgSend(v10, "format");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithSize:format:", v19, width * 1.1, height * 1.1);

    v21 = MEMORY[0x24BDAC760];
    v53[0] = MEMORY[0x24BDAC760];
    v53[1] = 3221225472;
    v53[2] = __130__MusicKit_SoftLinking_CoverArtworkDataSource__generateNineDotGradientImageForCoverArtworkRecipe_withImageRenderer_size_andSpace___block_invoke;
    v53[3] = &unk_24CD1CE20;
    v55 = v12;
    v56 = width * 1.1;
    v57 = height * 1.1;
    v58 = v14;
    v22 = v17;
    v54 = v22;
    v59 = v15;
    v60 = a6;
    objc_msgSend(v20, "imageWithActions:", v53);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "scale");
    v25 = width * v24;
    objc_msgSend(v23, "scale");
    v27 = height * v26;
    v28 = height * v26 * 0.05;
    v29 = objc_retainAutorelease(v23);
    v30 = (CGImage *)objc_msgSend(v29, "CGImage");
    v61.origin.x = v25 * 0.05;
    v61.origin.y = v28;
    v61.size.width = v25;
    v61.size.height = v27;
    v31 = CGImageCreateWithImageInRect(v30, v61);
    v39 = (void *)objc_msgSend(objc_alloc((Class)getUIImageClass((uint64_t)v31, v32, v33, v34, v35, v36, v37, v38)), "initWithCGImage:", v31);

    v52[0] = v21;
    v52[1] = 3221225472;
    v52[2] = __130__MusicKit_SoftLinking_CoverArtworkDataSource__generateNineDotGradientImageForCoverArtworkRecipe_withImageRenderer_size_andSpace___block_invoke_2;
    v52[3] = &__block_descriptor_48_e40_v16__0__UIGraphicsImageRendererContext_8l;
    *(double *)&v52[4] = width;
    *(double *)&v52[5] = height;
    objc_msgSend(v10, "imageWithActions:", v52);
    v44[0] = v21;
    v44[1] = 3221225472;
    v44[2] = __130__MusicKit_SoftLinking_CoverArtworkDataSource__generateNineDotGradientImageForCoverArtworkRecipe_withImageRenderer_size_andSpace___block_invoke_3;
    v44[3] = &unk_24CD1CE90;
    v48 = 0;
    v49 = 0;
    v50 = width;
    v51 = height;
    v45 = v22;
    v46 = (id)objc_claimAutoreleasedReturnValue();
    v47 = v39;
    v40 = v39;
    v41 = v46;
    v42 = v22;
    objc_msgSend(v10, "imageWithActions:", v44);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

+ (id)_bundle
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__MusicKit_SoftLinking_CoverArtworkDataSource__bundle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_bundle_sOnceToken != -1)
    dispatch_once(&_bundle_sOnceToken, block);
  return (id)_bundle_sBundle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
