@implementation NTKFaceColorPalette

- (BOOL)isSiriColor
{
  void *v2;
  void *v3;
  char v4;

  -[NTKFaceColorPalette configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorOption");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("siri"));

  return v4;
}

- (BOOL)isWhite
{
  void *v2;
  void *v3;
  char v4;

  -[NTKFaceColorPalette pigmentEditOption](self, "pigmentEditOption");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", CFSTR("seasons.spring2015.white"));

  return v4;
}

- (BOOL)isZeus
{
  void *v2;
  void *v3;
  char v4;

  -[NTKFaceColorPalette pigmentEditOption](self, "pigmentEditOption");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", CFSTR("zeus.orange"));

  return v4;
}

- (BOOL)isVictory
{
  void *v2;
  void *v3;
  char v4;

  -[NTKFaceColorPalette pigmentEditOption](self, "pigmentEditOption");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", CFSTR("victory.volt"));

  return v4;
}

- (NTKFaceColorPalette)init
{
  return -[NTKFaceColorPalette initWithDomainName:inBundle:](self, "initWithDomainName:inBundle:", 0, 0);
}

- (NTKFaceColorPalette)initWithFaceClass:(Class)a3
{
  void *v5;
  void *v6;
  NTKFaceColorPalette *v7;

  -[objc_class pigmentFaceDomain](a3, "pigmentFaceDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NTKFaceColorPalette initWithDomainName:inBundle:](self, "initWithDomainName:inBundle:", v5, v6);

  return v7;
}

- (NTKFaceColorPalette)initWithDomainName:(id)a3 inBundle:(id)a4
{
  id v7;
  id v8;
  NTKFaceColorPalette *v9;
  NTKFaceColorPalette *v10;
  NSCache *v11;
  NSCache *colorCache;
  NSCache *v13;
  NSCache *swatchImageCache;
  void *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)NTKFaceColorPalette;
  v9 = -[NTKFaceColorPalette init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_faceSpecificNamespace, a3);
    objc_storeStrong((id *)&v10->_domainBundle, a4);
    v11 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    colorCache = v10->_colorCache;
    v10->_colorCache = v11;

    v13 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    swatchImageCache = v10->_swatchImageCache;
    v10->_swatchImageCache = v13;

    if (initWithDomainName_inBundle__onceToken != -1)
      dispatch_once(&initWithDomainName_inBundle__onceToken, &__block_literal_global_167);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v10, sel_colorBundleContentChanged, CFSTR("NTKColorBundleContentChangedNotificationName"), 0);

  }
  return v10;
}

void __51__NTKFaceColorPalette_initWithDomainName_inBundle___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  NSStringFromSelector(sel_primaryColor);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)kPrimaryColorSelectorName;
  kPrimaryColorSelectorName = v0;

  NSStringFromSelector(sel_primaryShiftedColor);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)kPrimaryShiftedColorSelectorName;
  kPrimaryShiftedColorSelectorName = v2;

  NSStringFromSelector(sel_secondaryColor);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)kSecondaryColorSelectorName;
  kSecondaryColorSelectorName = v4;

  NSStringFromSelector(sel_secondaryShiftedColor);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)kSecondaryShiftedColorSelectorName;
  kSecondaryShiftedColorSelectorName = v6;

}

- (void)setTritium:(uint64_t)a1
{
  void *v2;

  if (a1)
  {
    if (*(unsigned __int8 *)(a1 + 8) != a2)
    {
      *(_BYTE *)(a1 + 8) = a2;
      v2 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = 0;

    }
  }
}

- (NSMutableArray)bundleList
{
  NSMutableArray *bundleList;
  NSBundle *v4;
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;

  bundleList = self->_bundleList;
  if (!bundleList)
  {
    v4 = self->_domainBundle;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v5, 0);
    v7 = self->_bundleList;
    self->_bundleList = v6;

    if (v4)
    {
      -[NSBundle bundlePath](v4, "bundlePath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundlePath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

      if ((v10 & 1) == 0)
        -[NSMutableArray addObject:](self->_bundleList, "addObject:", v4);
    }
    +[NTKColorBundleLoader sharedInstance](NTKColorBundleLoader, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "loadColorBundles");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      -[NSMutableArray addObjectsFromArray:](self->_bundleList, "addObjectsFromArray:", v12);

    bundleList = self->_bundleList;
  }
  return bundleList;
}

- (void)colorBundleContentChanged
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__NTKFaceColorPalette_colorBundleContentChanged__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __48__NTKFaceColorPalette_colorBundleContentChanged__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "resetColorCache");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int tritium;
  id v12;

  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  -[NTKFaceColorPalette configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setConfiguration:", v6);

  objc_storeStrong(v4 + 7, self->_domainBundle);
  objc_storeStrong(v4 + 4, self->_faceSpecificNamespace);
  -[NTKFaceColorPalette colorCache](self, "colorCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColorCache:", v7);

  -[NTKFaceColorPalette swatchImageCache](self, "swatchImageCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSwatchImageCache:", v8);

  -[NTKFaceColorPalette configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setConfiguration:", v10);

  tritium = self->_tritium;
  if (*((unsigned __int8 *)v4 + 8) != tritium)
  {
    *((_BYTE *)v4 + 8) = tritium;
    v12 = v4[9];
    v4[9] = 0;

  }
  return v4;
}

- (id)copyWithOption:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)-[NTKFaceColorPalette copy](self, "copy");
  objc_msgSend(v5, "setPigmentEditOption:", v4);

  return v5;
}

- (NTKFaceColorPalette)tritiumPalette
{
  NTKFaceColorPalette *tritiumPalette;
  NTKFaceColorPalette *v4;
  NTKFaceColorPalette *v5;
  NSString *identifier;

  tritiumPalette = self->_tritiumPalette;
  if (!tritiumPalette)
  {
    v4 = (NTKFaceColorPalette *)-[NTKFaceColorPalette copy](self, "copy");
    v5 = self->_tritiumPalette;
    self->_tritiumPalette = v4;

    tritiumPalette = self->_tritiumPalette;
    if (tritiumPalette)
    {
      if (!tritiumPalette->_tritium)
      {
        tritiumPalette->_tritium = 1;
        identifier = tritiumPalette->_identifier;
        tritiumPalette->_identifier = 0;

        tritiumPalette = self->_tritiumPalette;
      }
    }
  }
  return tritiumPalette;
}

- (id)tritiumPaletteWithProgress:(double)a3
{
  NTKInterpolatedColorPalette *interpolatedTritiumPalette;
  NTKInterpolatedColorPalette *v6;
  void *v7;
  NTKInterpolatedColorPalette *v8;
  NTKInterpolatedColorPalette *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;

  interpolatedTritiumPalette = self->_interpolatedTritiumPalette;
  if (!interpolatedTritiumPalette)
  {
    v6 = [NTKInterpolatedColorPalette alloc];
    -[NTKFaceColorPalette tritiumPalette](self, "tritiumPalette");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NTKInterpolatedColorPalette initWithFromPalette:toPalette:](v6, "initWithFromPalette:toPalette:", self, v7);
    v9 = self->_interpolatedTritiumPalette;
    self->_interpolatedTritiumPalette = v8;

    interpolatedTritiumPalette = self->_interpolatedTritiumPalette;
  }
  -[NTKInterpolatedColorPalette fromPalette](interpolatedTritiumPalette, "fromPalette");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceColorPalette identifier](self, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToString:", v12);

  if ((v13 & 1) == 0)
  {
    -[NTKInterpolatedColorPalette setFromPalette:](self->_interpolatedTritiumPalette, "setFromPalette:", self);
    -[NTKFaceColorPalette tritiumPalette](self, "tritiumPalette");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKInterpolatedColorPalette setToPalette:](self->_interpolatedTritiumPalette, "setToPalette:", v14);

  }
  -[NTKInterpolatedColorPalette setTransitionFraction:](self->_interpolatedTritiumPalette, "setTransitionFraction:", a3);
  return self->_interpolatedTritiumPalette;
}

- (void)executeWithOption:(id)a3 block:(id)a4
{
  void (**v6)(id, NTKFaceColorPalette *);
  id v7;
  void *v8;
  id v9;

  if (a4)
  {
    v6 = (void (**)(id, NTKFaceColorPalette *))a4;
    v7 = a3;
    -[NTKFaceColorPalette configuration](self, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "copy");

    -[NTKFaceColorPalette setPigmentEditOption:](self, "setPigmentEditOption:", v7);
    v6[2](v6, self);

    -[NTKFaceColorPalette setConfiguration:](self, "setConfiguration:", v9);
  }
}

- (void)configurationDidChange:(id)a3
{
  NSString *identifier;
  NTKFaceColorPalette *tritiumPalette;
  NTKInterpolatedColorPalette *interpolatedTritiumPalette;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  identifier = self->_identifier;
  self->_identifier = 0;

  tritiumPalette = self->_tritiumPalette;
  self->_tritiumPalette = 0;

  interpolatedTritiumPalette = self->_interpolatedTritiumPalette;
  if (interpolatedTritiumPalette)
  {
    -[NTKInterpolatedColorPalette fromPalette](interpolatedTritiumPalette, "fromPalette");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configurationDidChange:", v9);

    -[NTKInterpolatedColorPalette toPalette](self->_interpolatedTritiumPalette, "toPalette");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configurationDidChange:", v9);

  }
}

+ (id)colorWithName:(id)a3 inDomain:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), a4, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0DC3658];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorNamed:inBundle:compatibleWithTraitCollection:", v4, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setPigmentEditOption:(id)a3
{
  id v4;
  void *v5;
  NTKFaceColorPaletteConfiguration *v6;

  v4 = a3;
  -[NTKFaceColorPalette configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NTKFaceColorPalette configuration](self, "configuration");
    v6 = (NTKFaceColorPaletteConfiguration *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceColorPaletteConfiguration setPigmentEditOption:](v6, "setPigmentEditOption:", v4);

  }
  else
  {
    v6 = -[NTKFaceColorPaletteConfiguration initWithPigmentEditOption:]([NTKFaceColorPaletteConfiguration alloc], "initWithPigmentEditOption:", v4);

    -[NTKFaceColorPalette setConfiguration:](self, "setConfiguration:", v6);
  }

}

- (NTKPigmentEditOption)pigmentEditOption
{
  void *v2;
  void *v3;

  -[NTKFaceColorPalette configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pigmentEditOption");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NTKPigmentEditOption *)v3;
}

- (void)setConfiguration:(id)a3
{
  NTKInterpolatedColorPalette *interpolatedTritiumPalette;
  id *v6;
  id *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_configuration, a3);
  -[NTKFaceColorPaletteConfiguration setDelegate:](self->_configuration, "setDelegate:", self);
  interpolatedTritiumPalette = self->_interpolatedTritiumPalette;
  if (interpolatedTritiumPalette)
  {
    -[NTKInterpolatedColorPalette fromPalette](interpolatedTritiumPalette, "fromPalette");
    v6 = (id *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v6 + 2, a3);

    -[NTKInterpolatedColorPalette toPalette](self->_interpolatedTritiumPalette, "toPalette");
    v7 = (id *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v7 + 2, a3);

  }
  -[NTKFaceColorPalette configurationDidChange:](self, "configurationDidChange:", v8);

}

- (void)resetColorCache
{
  -[NSCache removeAllObjects](self->_colorCache, "removeAllObjects");
  -[NSCache removeAllObjects](self->_swatchImageCache, "removeAllObjects");
}

- (BOOL)isEvergreenCollection
{
  void *v2;
  void *v3;
  char v4;

  -[NTKFaceColorPalette configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("evergreen"));

  return v4;
}

- (BOOL)isSeasonalCollection
{
  void *v2;
  void *v3;
  char v4;

  -[NTKFaceColorPalette configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("seasons"));

  return v4;
}

- (BOOL)isNotFoundColor:(id)a3
{
  return !a3 || NTKFaceColorPaletteNotFoundColor == (_QWORD)a3;
}

- (BOOL)isMulticolor
{
  void *v2;
  void *v3;
  char v4;

  -[NTKFaceColorPalette pigmentEditOption](self, "pigmentEditOption");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", CFSTR("special.multicolor"));

  return v4;
}

- (BOOL)isRainbowColor
{
  void *v2;
  void *v3;
  char v4;

  -[NTKFaceColorPalette pigmentEditOption](self, "pigmentEditOption");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", CFSTR("special.rainbow"));

  return v4;
}

- (BOOL)isWhiteColor
{
  void *v2;
  double v5;
  double v6;
  double v7;

  v6 = 0.0;
  v7 = 0.0;
  v5 = 0.0;
  -[NTKFaceColorPalette primaryColor](self, "primaryColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getRed:green:blue:alpha:", &v7, &v6, &v5, 0);

  return v7 == 1.0 && v6 == 1.0 && v5 == 1.0;
}

- (BOOL)isBlackColor
{
  void *v3;
  void *v4;
  char v5;

  if (-[NTKFaceColorPalette isEvergreenCollection](self, "isEvergreenCollection"))
  {
    -[NTKFaceColorPalette pigmentEditOption](self, "pigmentEditOption");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqual:", CFSTR("evergreen.black"));

  }
  else
  {
    -[NTKFaceColorPalette primaryColor](self, "primaryColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CLKIsBlackColor();
  }

  return v5;
}

- (BOOL)isUnityColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  if (-[NTKFaceColorPalette isCompositePalette](self, "isCompositePalette"))
  {
    -[NTKFaceColorPalette paletteAtIndex:](self, "paletteAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collectionName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("unity")))
    {
      -[NTKFaceColorPalette paletteAtIndex:](self, "paletteAtIndex:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "configuration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "collectionName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("unity"));

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    -[NTKFaceColorPalette configuration](self, "configuration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "collectionName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "isEqualToString:", CFSTR("unity"));
  }

  return v9;
}

- (BOOL)hasPrimaryColorRange
{
  void *v3;
  void *v4;
  BOOL v5;

  -[NTKFaceColorPalette primaryColorWithFraction:](self, "primaryColorWithFraction:", 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == (void *)NTKFaceColorPaletteNotFoundColor)
  {
    v5 = 0;
  }
  else
  {
    -[NTKFaceColorPalette primaryColorWithFraction:](self, "primaryColorWithFraction:", 1.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != (void *)NTKFaceColorPaletteNotFoundColor;

  }
  return v5;
}

- (id)primaryColorWithFraction:(double)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;

  -[NTKFaceColorPalette configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorFraction");
  v7 = v6;

  -[NTKFaceColorPalette configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setColorFraction:", a3);

  -[NTKFaceColorPalette valueForKey:](self, "valueForKey:", kPrimaryColorSelectorName);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceColorPalette configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setColorFraction:", v7);

  return v9;
}

- (BOOL)isCompositePalette
{
  void *v2;
  BOOL v3;

  -[NTKFaceColorPalette multitoneColorNames](self, "multitoneColorNames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

- (id)paletteAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NTKFaceColorPalette *v11;

  if (!-[NTKFaceColorPalette isCompositePalette](self, "isCompositePalette"))
  {
    if (!a3)
    {
      v11 = self;
      return v11;
    }
LABEL_7:
    v11 = 0;
    return v11;
  }
  -[NTKFaceColorPalette multitoneColorNames](self, "multitoneColorNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") <= a3)
  {

    goto LABEL_7;
  }
  -[NTKFaceColorPalette configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorOption");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceColorPalette configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collectionName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKPigmentEditOption multitonePigmentAtIndex:forColorName:groupName:](NTKPigmentEditOption, "multitonePigmentAtIndex:forColorName:groupName:", a3, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[NTKFaceColorPalette copyWithOption:](self, "copyWithOption:", v10);
  -[NTKFaceColorPalette setColorCache:](v11, "setColorCache:", 0);

  return v11;
}

- (id)multitoneColorNames
{
  void *v2;
  void *v3;
  void *v4;

  -[NTKFaceColorPalette configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorOption");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKPigmentEditOption multitoneColorNames:](NTKPigmentEditOption, "multitoneColorNames:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)identifier
{
  NSString *identifier;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *v7;

  identifier = self->_identifier;
  if (!identifier)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[NTKFaceColorPaletteConfiguration uniqueId](self->_configuration, "uniqueId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@-%lu"), v5, -[NTKFaceColorPalette isTritium](self, "isTritium"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = self->_identifier;
    self->_identifier = v6;

    identifier = self->_identifier;
  }
  return identifier;
}

- (id)valueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  NTKFaceColorPaletteInspector *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NTKFaceColorPaletteInspector *v19;
  void (**v20)(void *, void *, _QWORD);
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSString *identifier;
  NSString *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSCache *colorCache;
  void *v43;
  _QWORD aBlock[5];
  id v45;
  NTKFaceColorPaletteInspector *v46;

  v4 = a3;
  if ((objc_msgSend(v4, "hasPrefix:", CFSTR("tritium_")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    -[NTKFaceColorPalette identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@-%@"), v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSCache objectForKey:](self->_colorCache, "objectForKey:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (id)v9;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[NTKFaceColorPalette _notFoundColor](self, "_notFoundColor");
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = v10;
        v10 = v11;
      }
      v5 = v11;
    }
    else
    {
      _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);

      if (v13)
      {
        v14 = objc_alloc_init(NTKFaceColorPaletteInspector);
        -[NTKFaceColorPalette faceSpecificNamespace](self, "faceSpecificNamespace");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKFaceColorPaletteInspector setDomain:](v14, "setDomain:", v15);

        -[NTKFaceColorPaletteInspector setPropertyName:](v14, "setPropertyName:", v4);
        -[NTKFaceColorPalette configuration](self, "configuration");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "colorOption");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKFaceColorPaletteInspector setPigmentName:](v14, "setPigmentName:", v17);

        -[NTKFaceColorPaletteInspector setIsTritium:](v14, "setIsTritium:", -[NTKFaceColorPalette isTritium](self, "isTritium"));
      }
      else
      {
        v14 = 0;
      }
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __35__NTKFaceColorPalette_valueForKey___block_invoke;
      aBlock[3] = &unk_1E6BDBEF8;
      aBlock[4] = self;
      v18 = v4;
      v45 = v18;
      v19 = v14;
      v46 = v19;
      v20 = (void (**)(void *, void *, _QWORD))_Block_copy(aBlock);
      -[NTKFaceColorPaletteConfiguration formattedCollectionName](self->_configuration, "formattedCollectionName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v20[2](v20, v21, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
        goto LABEL_16;
      NTKFaceColorPalette_PerformFallbackPropertyAccessor(self, v18, v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
        goto LABEL_16;
      if (objc_msgSend(v18, "isEqualToString:", kPrimaryColorSelectorName))
      {
        -[NTKFaceColorPaletteConfiguration colorOption](self->_configuration, "colorOption");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        NTKFaceColorPalette_PerformFallbackPropertyAccessor(self, v23, v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
          goto LABEL_16;
      }
      -[NTKFaceColorPaletteConfiguration formattedCollectionName](self->_configuration, "formattedCollectionName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v20[2](v20, v24, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
        goto LABEL_16;
      if (!-[NTKFaceColorPalette isTritium](self, "isTritium"))
        goto LABEL_28;
      if (self->_tritium)
      {
        self->_tritium = 0;
        identifier = self->_identifier;
        self->_identifier = 0;

      }
      -[NTKFaceColorPalette valueForKey:](self, "valueForKey:", v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!self->_tritium)
      {
        self->_tritium = 1;
        v34 = self->_identifier;
        self->_identifier = 0;

      }
      if (v22)
      {
LABEL_16:
        _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          -[NTKFaceColorPalette valueForKey:].cold.1((uint64_t)v19, v25, v26, v27, v28, v29, v30, v31);

        -[NSCache setObject:forKey:](self->_colorCache, "setObject:forKey:", v22, v8);
        v10 = v22;
        v5 = v10;
      }
      else
      {
LABEL_28:
        _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          -[NTKFaceColorPalette valueForKey:].cold.1((uint64_t)v19, v35, v36, v37, v38, v39, v40, v41);

        colorCache = self->_colorCache;
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSCache setObject:forKey:](colorCache, "setObject:forKey:", v43, v8);

        -[NTKFaceColorPalette _notFoundColor](self, "_notFoundColor");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 0;
      }

    }
  }

  return v5;
}

id __35__NTKFaceColorPalette_valueForKey___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id *v16;
  uint64_t v17;
  id v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "bundleList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    obj = v6;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v10);
        v12 = *(_QWORD *)(a1 + 32);
        v13 = *(_QWORD *)(a1 + 40);
        v14 = *(_QWORD *)(v12 + 32);
        objc_msgSend(*(id *)(v12 + 16), "colorFraction");
        objc_msgSend((id)v12, "_loadColorFromAssetCatalogForKey:namespace:collectionName:bundle:colorFraction:ignoringOptionAndCollection:inspector:", v13, v14, v5, v11, a3, *(_QWORD *)(a1 + 48));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15
          || (v16 = *(id **)(a1 + 32),
              v17 = *(_QWORD *)(a1 + 40),
              objc_msgSend(v16[2], "colorFraction"),
              objc_msgSend(v16, "_loadColorFromAssetCatalogForKey:namespace:collectionName:bundle:colorFraction:ignoringOptionAndCollection:inspector:", v17, 0, v5, v11, a3, *(_QWORD *)(a1 + 48)), (v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          v18 = v15;

          v6 = v18;
          goto LABEL_12;
        }
        ++v10;
      }
      while (v8 != v10);
      v6 = obj;
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v8)
        continue;
      break;
    }
  }
  v18 = 0;
LABEL_12:

  return v18;
}

- (id)_notFoundColor
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if (-[NTKFaceColorPalette isTritium](self, "isTritium"))
  {
    v2 = 0;
  }
  else
  {
    v3 = (void *)NTKFaceColorPaletteNotFoundColor;
    if (!NTKFaceColorPaletteNotFoundColor)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)NTKFaceColorPaletteNotFoundColor;
      NTKFaceColorPaletteNotFoundColor = v4;

      v3 = (void *)NTKFaceColorPaletteNotFoundColor;
    }
    v2 = v3;
  }
  return v2;
}

- (id)_loadColorFromAssetCatalogForKey:(id)a3 namespace:(id)a4 collectionName:(id)a5 bundle:(id)a6 colorFraction:(double)a7 ignoringOptionAndCollection:(BOOL)a8 inspector:(id)a9
{
  _BOOL4 v10;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  __CFString *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  uint64_t v49;
  id v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  id v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;

  v10 = a8;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a9;
  -[NTKFaceColorPalette entryNameForKey:](self, "entryNameForKey:", v16);
  v61 = v17;
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/"), v17);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (__CFString *)v21;
    if (v10)
    {
      v59 = v16;
      v60 = v18;
      v23 = (__CFString *)v21;
      v24 = (void *)MEMORY[0x1E0CB3940];
      colorEntryName(0, v62, -[NTKFaceColorPalette isTritium](self, "isTritium"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", CFSTR("%@%@"), v23, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v19;
      v22 = v23;
      v16 = v59;
      colorWithName(v26, v19, v20);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

      v18 = v60;
      v19 = v27;
      goto LABEL_19;
    }
  }
  else
  {
    v22 = &stru_1E6BDC918;
    if (v10)
    {
      v28 = 0;
      goto LABEL_19;
    }
  }
  v60 = v18;
  if (!v18)
  {
LABEL_17:
    v45 = (void *)MEMORY[0x1E0CB3940];
    -[NTKFaceColorPaletteConfiguration colorOption](self->_configuration, "colorOption");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    colorEntryName(v25, v62, -[NTKFaceColorPalette isTritium](self, "isTritium"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "stringWithFormat:", CFSTR("%@%@"), v22, v26);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v19;
    colorWithName(v46, v19, v20);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_18;
  }
  v29 = (void *)MEMORY[0x1E0CB3940];
  -[NTKFaceColorPaletteConfiguration colorOption](self->_configuration, "colorOption");
  v30 = v22;
  v31 = v20;
  v32 = v18;
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  colorEntryName(v33, v62, -[NTKFaceColorPalette isTritium](self, "isTritium"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v32;
  v20 = v31;
  v22 = v30;
  objc_msgSend(v29, "stringWithFormat:", CFSTR("%@%@/%@"), v30, v58, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  colorWithName(v35, v19, v20);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28 && v62)
  {
    v36 = (void *)MEMORY[0x1E0CB3940];
    v18 = v60;
    colorEntryName(v60, v62, -[NTKFaceColorPalette isTritium](self, "isTritium"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "stringWithFormat:", CFSTR("%@%@"), v30, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    colorWithName(v38, v19, v20);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
      goto LABEL_19;
    objc_msgSend(v60, "componentsSeparatedByString:", CFSTR("/"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_msgSend(v39, "mutableCopy");

    objc_msgSend(v40, "removeLastObject");
    while (objc_msgSend(v40, "count"))
    {
      objc_msgSend(v40, "componentsJoinedByString:", CFSTR("/"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)MEMORY[0x1E0CB3940];
      colorEntryName(v41, v62, -[NTKFaceColorPalette isTritium](self, "isTritium"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "stringWithFormat:", CFSTR("%@%@"), v22, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      colorWithName(v44, v19, v20);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v40, "removeLastObject");
      if (v28)
        goto LABEL_15;
    }
    v28 = 0;
LABEL_15:

  }
  v18 = v60;
  if (!v28)
    goto LABEL_17;
LABEL_19:
  if (objc_msgSend(v16, "isEqualToString:", kPrimaryColorSelectorName)
    && (CLKFloatEqualsFloat() & 1) == 0)
  {
    v48 = v16;
    -[NTKFaceColorPalette _loadColorFromAssetCatalogForKey:namespace:collectionName:bundle:colorFraction:ignoringOptionAndCollection:inspector:](self, "_loadColorFromAssetCatalogForKey:namespace:collectionName:bundle:colorFraction:ignoringOptionAndCollection:inspector:", CFSTR("from"), v61, v18, v19, 0, 0, 0.5);
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = v18;
    v51 = (void *)v49;
    v52 = v50;
    -[NTKFaceColorPalette _loadColorFromAssetCatalogForKey:namespace:collectionName:bundle:colorFraction:ignoringOptionAndCollection:inspector:](self, "_loadColorFromAssetCatalogForKey:namespace:collectionName:bundle:colorFraction:ignoringOptionAndCollection:inspector:", CFSTR("to"), v61, 0.5);
    v53 = objc_claimAutoreleasedReturnValue();
    v54 = (void *)v53;
    v47 = 0;
    if (v51 && v53)
    {
      if (v28)
      {
        CLKCompressFraction();
        if (a7 >= 0.5)
        {
          v55 = v28;
          v56 = v54;
        }
        else
        {
          v55 = v51;
          v56 = v28;
        }
      }
      else
      {
        v55 = v51;
        v56 = v54;
      }
      NTKInterpolateBetweenColors(v55, v56);
      v47 = (id)objc_claimAutoreleasedReturnValue();
    }

    v18 = v52;
    v16 = v48;
  }
  else
  {
    v47 = v28;
  }

  return v47;
}

- (id)entryNameForKey:(id)a3
{
  __CFString *v3;
  const __CFString *v4;

  v3 = (__CFString *)a3;
  if ((-[__CFString isEqualToString:](v3, "isEqualToString:", kPrimaryColorSelectorName) & 1) != 0)
  {
    v4 = 0;
LABEL_9:

    v3 = (__CFString *)v4;
    return v3;
  }
  if ((-[__CFString isEqualToString:](v3, "isEqualToString:", kPrimaryShiftedColorSelectorName) & 1) != 0)
  {
    v4 = CFSTR("shifted");
    goto LABEL_9;
  }
  if ((-[__CFString isEqualToString:](v3, "isEqualToString:", kSecondaryColorSelectorName) & 1) != 0)
  {
    v4 = CFSTR("secondary");
    goto LABEL_9;
  }
  if (-[__CFString isEqualToString:](v3, "isEqualToString:", kSecondaryShiftedColorSelectorName))
  {
    v4 = CFSTR("secondaryShifted");
    goto LABEL_9;
  }
  return v3;
}

- (id)_primaryShiftedColor
{
  void *v2;
  void *v3;

  -[NTKFaceColorPalette primaryColor](self, "primaryColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ntk_colorByBoostingSaturation:lightness:", 0.2, 0.5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_secondaryColor
{
  void *v2;
  void *v3;

  -[NTKFaceColorPalette primaryColor](self, "primaryColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NTKColorByPremultiplyingAlpha(v2, 0.18);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_secondaryShiftedColor
{
  void *v2;
  void *v3;

  -[NTKFaceColorPalette primaryColor](self, "primaryColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NTKColorByPremultiplyingAlpha(v2, 0.15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  BOOL v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___NTKFaceColorPalette;
  if ((objc_msgSendSuper2(&v10, sel_resolveInstanceMethod_) & 1) != 0)
    return 1;
  NSStringFromSelector(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(":"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if ((objc_msgSend(v6, "hasPrefix:", CFSTR("_")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v5 = 0;
    if ((objc_msgSend(v6, "hasPrefix:", CFSTR("tritium_")) & 1) == 0 && v8 == 1)
      v5 = class_addMethod((Class)a1, a3, (IMP)NTKFaceColorPalette_DefaultPropertAccessor, "@@:");
  }

  return v5;
}

- (UIColor)swatch
{
  void *v3;

  if (-[NTKFaceColorPalette isCompositePalette](self, "isCompositePalette")
    || -[NTKFaceColorPalette isUnityColor](self, "isUnityColor"))
  {
    v3 = 0;
  }
  else if (!-[NTKFaceColorPalette isBlackColor](self, "isBlackColor")
         || (-[NTKFaceColorPalette valueForKey:](self, "valueForKey:", CFSTR("softBlack")),
             (v3 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[NTKFaceColorPalette primaryColor](self, "primaryColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIColor *)v3;
}

- (id)swatchImageForSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CGSize v18;

  height = a3.height;
  width = a3.width;
  v6 = (void *)MEMORY[0x1E0CB3940];
  -[NTKFaceColorPalette configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18.width = width;
  v18.height = height;
  NSStringFromCGSize(v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@-%@"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSCache objectForKey:](self->_swatchImageCache, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    if (-[NTKFaceColorPalette isRainbowColor](self, "isRainbowColor"))
    {
      v12 = CFSTR("Swatch-Multicolor-Pride");
LABEL_6:
      NTKImageNamed(v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    if (-[NTKFaceColorPalette isMulticolor](self, "isMulticolor"))
    {
      v12 = CFSTR("Swatch-Multicolor");
      goto LABEL_6;
    }
    if (-[NTKFaceColorPalette isUnityColor](self, "isUnityColor"))
    {
      -[NTKFaceColorPalette _unitySwatchImageForSize:](self, "_unitySwatchImageForSize:", width, height);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
        goto LABEL_7;
LABEL_13:
      -[NSCache setObject:forKey:](self->_swatchImageCache, "setObject:forKey:", v11, v10);
      goto LABEL_7;
    }
    if (!-[NTKFaceColorPalette isCompositePalette](self, "isCompositePalette"))
    {
      v11 = 0;
      goto LABEL_7;
    }
    -[NTKFaceColorPalette paletteAtIndex:](self, "paletteAtIndex:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "swatch");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[NTKFaceColorPalette paletteAtIndex:](self, "paletteAtIndex:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "swatch");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    NTKSwatchTwoColorImage(v15, v17, width, height);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      goto LABEL_13;
  }
LABEL_7:

  return v11;
}

- (id)swatchPrimaryColor
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[NTKFaceColorPalette isRainbowColor](self, "isRainbowColor")
    || -[NTKFaceColorPalette isMulticolor](self, "isMulticolor"))
  {
    v3 = 0;
    return v3;
  }
  if (-[NTKFaceColorPalette isUnityColor](self, "isUnityColor"))
  {
    -[NTKFaceColorPalette _unityMiddleColor](self, "_unityMiddleColor");
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v3 = (id)v4;
    return v3;
  }
  if (!-[NTKFaceColorPalette isCompositePalette](self, "isCompositePalette"))
  {
    -[NTKFaceColorPalette primaryColor](self, "primaryColor");
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  -[NTKFaceColorPalette paletteAtIndex:](self, "paletteAtIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "swatch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKFaceColorPalette paletteAtIndex:](self, "paletteAtIndex:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "swatch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (CLKUICompareColorsByLightness() >= 0)
    v9 = v6;
  else
    v9 = v8;
  v3 = v9;

  return v3;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  NSString *faceSpecificNamespace;
  NTKFaceColorPaletteConfiguration *configuration;
  _BOOL4 v7;
  const __CFString *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  faceSpecificNamespace = self->_faceSpecificNamespace;
  configuration = self->_configuration;
  v7 = -[NTKFaceColorPalette isTritium](self, "isTritium");
  v8 = &stru_1E6BDC918;
  if (v7)
    v8 = CFSTR("(tritium)");
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [domain:%@, configuration: %@] %@"), v4, faceSpecificNamespace, configuration, v8);
}

- (BOOL)isEqual:(id)a3
{
  NTKFaceColorPalette *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (NTKFaceColorPalette *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    v5 = (void *)objc_opt_class();
    if (objc_msgSend(v5, "isEqual:", objc_opt_class()))
    {
      -[NTKFaceColorPalette faceSpecificNamespace](self, "faceSpecificNamespace");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKFaceColorPalette faceSpecificNamespace](v4, "faceSpecificNamespace");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", v7))
      {
        -[NTKFaceColorPalette configuration](self, "configuration");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKFaceColorPalette configuration](v4, "configuration");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (NTKFaceColorPaletteConfiguration)configuration
{
  return self->_configuration;
}

- (NSCache)swatchImageCache
{
  return self->_swatchImageCache;
}

- (void)setSwatchImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_swatchImageCache, a3);
}

- (BOOL)isTritium
{
  return self->_tritium;
}

- (NSString)faceSpecificNamespace
{
  return self->_faceSpecificNamespace;
}

- (void)setFaceSpecificNamespace:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setBundleList:(id)a3
{
  objc_storeStrong((id *)&self->_bundleList, a3);
}

- (NSCache)colorCache
{
  return self->_colorCache;
}

- (void)setColorCache:(id)a3
{
  objc_storeStrong((id *)&self->_colorCache, a3);
}

- (NSBundle)domainBundle
{
  return self->_domainBundle;
}

- (void)setDomainBundle:(id)a3
{
  objc_storeStrong((id *)&self->_domainBundle, a3);
}

- (NTKInterpolatedColorPalette)interpolatedTritiumPalette
{
  return self->_interpolatedTritiumPalette;
}

- (void)setInterpolatedTritiumPalette:(id)a3
{
  objc_storeStrong((id *)&self->_interpolatedTritiumPalette, a3);
}

- (void)setIdentifier:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 72);
}

- (void)setTritiumPalette:(id)a3
{
  objc_storeStrong((id *)&self->_tritiumPalette, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tritiumPalette, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_interpolatedTritiumPalette, 0);
  objc_storeStrong((id *)&self->_domainBundle, 0);
  objc_storeStrong((id *)&self->_colorCache, 0);
  objc_storeStrong((id *)&self->_bundleList, 0);
  objc_storeStrong((id *)&self->_faceSpecificNamespace, 0);
  objc_storeStrong((id *)&self->_swatchImageCache, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (id)_unitySwatchImageForSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  height = a3.height;
  width = a3.width;
  -[NTKFaceColorPalette paletteAtIndex:](self, "paletteAtIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKFaceColorPalette _unityMiddleColor](self, "_unityMiddleColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceColorPalette paletteAtIndex:](self, "paletteAtIndex:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "primaryColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKFaceColorPalette _unitySwatchImageForSize:redColor:blackColor:greenColor:](self, "_unitySwatchImageForSize:redColor:blackColor:greenColor:", v7, v8, v10, width, height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_unitySwatchImageForSize:(CGSize)a3 redColor:(id)a4 blackColor:(id)a5 greenColor:(id)a6
{
  double height;
  double width;
  id v10;
  id v11;
  id v12;
  double v14;
  double v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  double v26;
  double v27;

  height = a3.height;
  width = a3.width;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    +[NTKEditOption sizeForSwatchStyle:](NTKEditOption, "sizeForSwatchStyle:", 0);
    width = v14;
    height = v15;
  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", width, height);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __103__NTKFaceColorPalette_NTKUnityColorUtilities___unitySwatchImageForSize_redColor_blackColor_greenColor___block_invoke;
  v22[3] = &unk_1E6BDC348;
  v26 = width;
  v27 = height;
  v23 = v10;
  v24 = v11;
  v25 = v12;
  v17 = v12;
  v18 = v11;
  v19 = v10;
  objc_msgSend(v16, "imageWithActions:", v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

void __103__NTKFaceColorPalette_NTKUnityColorUtilities___unitySwatchImageForSize_redColor_blackColor_greenColor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGContext *v13;
  CGFloat v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  v3 = a2;
  objc_msgSend(v3, "format");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = (CGContext *)objc_msgSend(v3, "CGContext");
  CGContextTranslateCTM(v13, v10 * 0.5, v12 * 0.5);
  CGContextRotateCTM(v13, -0.785398163);
  CGContextTranslateCTM(v13, -(v10 * 0.5), -(v12 * 0.5));
  v15.origin.x = v6;
  v15.origin.y = v8;
  v15.size.width = v10;
  v15.size.height = v12;
  CGContextAddEllipseInRect(v13, v15);
  CGContextClip(v13);
  v14 = *(double *)(a1 + 56) / 2.52;
  objc_msgSend(*(id *)(a1 + 32), "setFill");
  v16.origin.x = 0.0;
  v16.origin.y = 0.0;
  v16.size.width = v10;
  v16.size.height = v14 * 0.76;
  CGContextFillRect(v13, v16);
  objc_msgSend(*(id *)(a1 + 40), "setFill");
  v17.origin.x = 0.0;
  v17.origin.y = v14 * 0.76 + 0.0;
  v17.size.width = v10;
  v17.size.height = v14;
  CGContextFillRect(v13, v17);
  objc_msgSend(*(id *)(a1 + 48), "setFill");
  v18.origin.x = 0.0;
  v18.origin.y = v14 + v14 * 0.76 + 0.0;
  v18.size.width = v10;
  v18.size.height = v14 * 0.76;
  CGContextFillRect(v13, v18);
}

- (id)_unityMiddleColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
}

- (void)valueForKey:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_1B72A3000, a2, a3, "#palette %{public}@", a5, a6, a7, a8, 2u);
}

@end
