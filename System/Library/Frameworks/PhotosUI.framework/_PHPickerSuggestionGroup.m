@implementation _PHPickerSuggestionGroup

- (_PHPickerSuggestionGroup)init
{
  _PHPickerSuggestionGroup *v2;
  SEL v3;
  id v4;

  v2 = (_PHPickerSuggestionGroup *)_PFAssertFailHandler();
  return (_PHPickerSuggestionGroup *)-[_PHPickerSuggestionGroup isEqual:](v2, v3, v4);
}

- (BOOL)isEqual:(id)a3
{
  _PHPickerSuggestionGroup *v4;
  _PHPickerSuggestionGroup *v5;
  objc_class *v6;
  NSArray *suggestions;
  NSArray *v8;
  NSArray *v9;
  NSArray *v10;
  int v11;
  BOOL v12;
  objc_class *v14;
  objc_class *v15;
  _PHPickerSuggestionGroup *v16;
  SEL v17;

  v4 = (_PHPickerSuggestionGroup *)a3;
  if (self == v4)
  {
    v12 = 1;
LABEL_15:

    return v12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = 0;
    goto LABEL_15;
  }
  v5 = v4;
  v6 = (objc_class *)objc_opt_class();
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      suggestions = self->_suggestions;
      v8 = v5->_suggestions;
      if (suggestions == v8)
      {

      }
      else
      {
        v9 = v8;
        v10 = suggestions;
        v11 = -[NSArray isEqual:](v10, "isEqual:", v9);

        if (!v11)
          goto LABEL_13;
      }
      if (self->_defaultSuggestionIndex == v5->_defaultSuggestionIndex)
      {
        v12 = self->_isForWallpaper == v5->_isForWallpaper;
LABEL_14:

        goto LABEL_15;
      }
LABEL_13:
      v12 = 0;
      goto LABEL_14;
    }
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSStringFromClass(v6);
    objc_claimAutoreleasedReturnValue();
  }
  v16 = (_PHPickerSuggestionGroup *)_PFAssertFailHandler();
  return -[_PHPickerSuggestionGroup hash](v16, v17);
}

- (unint64_t)hash
{
  uint64_t v3;
  int64_t v4;

  v3 = -[NSArray hash](self->_suggestions, "hash");
  v4 = self->_defaultSuggestionIndex - v3 + 32 * v3;
  return self->_isForWallpaper - v4 + 32 * v4 + 29791;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[_PHPickerSuggestionGroup _initWithSuggestions:defaultSuggestionIndex:isForWallpaper:]([_PHPickerSuggestionGroup alloc], "_initWithSuggestions:defaultSuggestionIndex:isForWallpaper:", self->_suggestions, self->_defaultSuggestionIndex, self->_isForWallpaper);
}

- (_PHPickerSuggestionGroup)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a3;
  +[PUPickerSuggestionAvailableClasses all](PUPickerSuggestionAvailableClasses, "all");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeArrayOfObjectsOfClasses:forKey:", v5, CFSTR("PHPickerSuggestionGroupCoderSuggestionsKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("PHPickerSuggestionGroupCoderDefaultSuggestionIndexKey"));
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PHPickerSuggestionGroupCoderIsForWallpaperKey"));

  if (v6)
    self = -[_PHPickerSuggestionGroup _initWithSuggestions:defaultSuggestionIndex:isForWallpaper:](self, "_initWithSuggestions:defaultSuggestionIndex:isForWallpaper:", v6, v7, v8);

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *suggestions;
  id v5;

  suggestions = self->_suggestions;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", suggestions, CFSTR("PHPickerSuggestionGroupCoderSuggestionsKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_defaultSuggestionIndex, CFSTR("PHPickerSuggestionGroupCoderDefaultSuggestionIndexKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isForWallpaper, CFSTR("PHPickerSuggestionGroupCoderIsForWallpaperKey"));

}

- (id)_initWithSuggestions:(id)a3 defaultSuggestionIndex:(int64_t)a4 isForWallpaper:(BOOL)a5
{
  id v8;
  void *v9;
  _PHPickerSuggestionGroup *v10;
  uint64_t v11;
  NSArray *suggestions;
  _PHPickerSuggestionGroup *v14;
  SEL v15;
  objc_super v16;

  v8 = a3;
  if (v8)
  {
    v9 = v8;
    v16.receiver = self;
    v16.super_class = (Class)_PHPickerSuggestionGroup;
    v10 = -[_PHPickerSuggestionGroup init](&v16, sel_init);
    if (v10)
    {
      v11 = objc_msgSend(v9, "copy");
      suggestions = v10->_suggestions;
      v10->_suggestions = (NSArray *)v11;

      v10->_defaultSuggestionIndex = a4;
      v10->_isForWallpaper = a5;
    }

    return v10;
  }
  else
  {
    v14 = (_PHPickerSuggestionGroup *)_PFAssertFailHandler();
    return -[_PHPickerSuggestionGroup defaultSuggestion](v14, v15);
  }
}

- (id)defaultSuggestion
{
  unint64_t defaultSuggestionIndex;
  void *v4;

  defaultSuggestionIndex = self->_defaultSuggestionIndex;
  if ((defaultSuggestionIndex & 0x8000000000000000) != 0
    || defaultSuggestionIndex >= -[NSArray count](self->_suggestions, "count"))
  {
    v4 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_suggestions, "objectAtIndexedSubscript:", self->_defaultSuggestionIndex);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (int64_t)defaultSuggestionIndex
{
  return self->_defaultSuggestionIndex;
}

- (BOOL)isForWallpaper
{
  return self->_isForWallpaper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestions, 0);
}

+ (_PHPickerSuggestionGroup)wallpaperSuggestionGroup
{
  return (_PHPickerSuggestionGroup *)+[_PHPickerSuggestionGroup _wallpaperSuggestionGroupWithDefaultSuggestionIndex:](_PHPickerSuggestionGroup, "_wallpaperSuggestionGroupWithDefaultSuggestionIndex:", PLIsFeaturedContentAllowed());
}

+ (_PHPickerSuggestionGroup)shuffleWallpaperSuggestionGroup
{
  return (_PHPickerSuggestionGroup *)+[_PHPickerSuggestionGroup _wallpaperSuggestionGroupWithDefaultSuggestionIndex:allowSettlingEffectSuggestions:](_PHPickerSuggestionGroup, "_wallpaperSuggestionGroupWithDefaultSuggestionIndex:allowSettlingEffectSuggestions:", PLIsFeaturedContentAllowed(), 0);
}

+ (_PHPickerSuggestionGroup)portraitWallpaperSuggestionGroup
{
  uint64_t v2;

  if (PLIsFeaturedContentAllowed())
  {
    if (PFPosterEnableSettlingEffect())
      v2 = 3;
    else
      v2 = 2;
  }
  else
  {
    v2 = 0;
  }
  return (_PHPickerSuggestionGroup *)+[_PHPickerSuggestionGroup _wallpaperSuggestionGroupWithDefaultSuggestionIndex:](_PHPickerSuggestionGroup, "_wallpaperSuggestionGroupWithDefaultSuggestionIndex:", v2);
}

+ (_PHPickerSuggestionGroup)livePhotoWallpaperSuggestionGroup
{
  uint64_t v2;

  if (PLIsFeaturedContentAllowed())
    v2 = 2;
  else
    v2 = 0;
  return (_PHPickerSuggestionGroup *)+[_PHPickerSuggestionGroup _wallpaperSuggestionGroupWithDefaultSuggestionIndex:](_PHPickerSuggestionGroup, "_wallpaperSuggestionGroupWithDefaultSuggestionIndex:", v2);
}

+ (_PHPickerSuggestionGroup)deviceOwnerSuggestionGroup
{
  uint64_t v2;
  PUPickerSuggestionAll *v3;
  PUPickerWallpaperSuggestion *v4;
  void *v5;
  id v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v2 = PLIsFeaturedContentAllowed();
  v3 = objc_alloc_init(PUPickerSuggestionAll);
  v8[0] = v3;
  v4 = -[PUPickerWallpaperSuggestion initWithMode:]([PUPickerWallpaperSuggestion alloc], "initWithMode:", 5);
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_PHPickerSuggestionGroup _initWithSuggestions:defaultSuggestionIndex:isForWallpaper:]([_PHPickerSuggestionGroup alloc], "_initWithSuggestions:defaultSuggestionIndex:isForWallpaper:", v5, v2, 1);
  return (_PHPickerSuggestionGroup *)v6;
}

+ (_PHPickerSuggestionGroup)stickersSuggestionGroup
{
  id v2;
  PUPickerSuggestionAll *v3;
  PUPickerSearchBasedSuggestion *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __objc2_class **v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __objc2_class **v15;
  void *v16;
  PUPickerSearchBasedSuggestion *v17;
  PUPickerSearchBasedSuggestion *v18;
  void *v19;
  void *v20;
  PUPickerSearchBasedSuggestion *v21;
  PUPickerSearchBasedSuggestion *v22;
  void *v23;
  id v24;
  PUPickerSearchBasedSuggestion *v26;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v3 = objc_alloc_init(PUPickerSuggestionAll);
  v28[0] = v3;
  v4 = -[PUPickerSearchBasedSuggestion initWithMode:]([PUPickerSearchBasedSuggestion alloc], "initWithMode:", 6);
  v28[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithArray:", v5);

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("UseSearchBasedPeopleSuggestionForStickersSuggestionGroup"));

  if (v8)
    v9 = 2;
  else
    v9 = 1;
  if (v8)
    v10 = off_24C62ADB0;
  else
    v10 = &off_24C62ADC0;
  v11 = (void *)objc_msgSend(objc_alloc(*v10), "initWithMode:", v9);
  objc_msgSend(v6, "addObject:", v11);

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLForKey:", CFSTR("UseWallpaperSuggestionBasedAnimalsSuggestionForStickersSuggestionGroup"));

  if (v13)
    v14 = 2;
  else
    v14 = 1;
  if (v13)
    v15 = &off_24C62ADC0;
  else
    v15 = off_24C62ADB0;
  v16 = (void *)objc_msgSend(objc_alloc(*v15), "initWithMode:", v14);
  objc_msgSend(v6, "addObject:", v16);

  v17 = -[PUPickerSearchBasedSuggestion initWithMode:]([PUPickerSearchBasedSuggestion alloc], "initWithMode:", 0);
  v27[0] = v17;
  v18 = -[PUPickerSearchBasedSuggestion initWithMode:]([PUPickerSearchBasedSuggestion alloc], "initWithMode:", 5);
  v27[1] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v19);

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = objc_msgSend(v20, "BOOLForKey:", CFSTR("ShowProductsForStickersSuggestionGroup"));

  if ((_DWORD)v18)
  {
    v21 = -[PUPickerSearchBasedSuggestion initWithMode:]([PUPickerSearchBasedSuggestion alloc], "initWithMode:", 3);
    objc_msgSend(v6, "addObject:", v21);

  }
  v22 = -[PUPickerSearchBasedSuggestion initWithMode:]([PUPickerSearchBasedSuggestion alloc], "initWithMode:", 4);
  v26 = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v26, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v23);

  v24 = -[_PHPickerSuggestionGroup _initWithSuggestions:defaultSuggestionIndex:isForWallpaper:]([_PHPickerSuggestionGroup alloc], "_initWithSuggestions:defaultSuggestionIndex:isForWallpaper:", v6, 0, 0);
  return (_PHPickerSuggestionGroup *)v24;
}

+ (_PHPickerSuggestionGroup)watchWallpaperSuggestionGroup
{
  uint64_t v2;
  PUPickerSuggestionAll *v3;
  PUPickerWallpaperSuggestion *v4;
  PUPickerWallpaperSuggestion *v5;
  PUPickerWallpaperSuggestion *v6;
  PUPickerWallpaperSuggestion *v7;
  PUPickerWallpaperSuggestion *v8;
  void *v9;
  id v10;
  _QWORD v12[7];

  v12[6] = *MEMORY[0x24BDAC8D0];
  v2 = PLIsFeaturedContentAllowed();
  v3 = objc_alloc_init(PUPickerSuggestionAll);
  v12[0] = v3;
  v4 = -[PUPickerWallpaperSuggestion initWithMode:]([PUPickerWallpaperSuggestion alloc], "initWithMode:", 6);
  v12[1] = v4;
  v5 = -[PUPickerWallpaperSuggestion initWithMode:]([PUPickerWallpaperSuggestion alloc], "initWithMode:", 7);
  v12[2] = v5;
  v6 = -[PUPickerWallpaperSuggestion initWithMode:]([PUPickerWallpaperSuggestion alloc], "initWithMode:", 8);
  v12[3] = v6;
  v7 = -[PUPickerWallpaperSuggestion initWithMode:]([PUPickerWallpaperSuggestion alloc], "initWithMode:", 9);
  v12[4] = v7;
  v8 = -[PUPickerWallpaperSuggestion initWithMode:]([PUPickerWallpaperSuggestion alloc], "initWithMode:", 10);
  v12[5] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[_PHPickerSuggestionGroup _initWithSuggestions:defaultSuggestionIndex:isForWallpaper:]([_PHPickerSuggestionGroup alloc], "_initWithSuggestions:defaultSuggestionIndex:isForWallpaper:", v9, v2, 0);
  return (_PHPickerSuggestionGroup *)v10;
}

+ (_PHPickerSuggestionGroup)styleabilitySuggestionGroup
{
  uint64_t v2;
  id v3;
  PUPickerSuggestionAll *v4;
  PUPickerStyleablePhotoSuggestion *v5;
  id v6;

  v2 = PLIsFeaturedContentAllowed();
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = objc_alloc_init(PUPickerSuggestionAll);
  objc_msgSend(v3, "addObject:", v4);

  v5 = objc_alloc_init(PUPickerStyleablePhotoSuggestion);
  objc_msgSend(v3, "addObject:", v5);

  v6 = -[_PHPickerSuggestionGroup _initWithSuggestions:defaultSuggestionIndex:isForWallpaper:]([_PHPickerSuggestionGroup alloc], "_initWithSuggestions:defaultSuggestionIndex:isForWallpaper:", v3, v2, 0);
  return (_PHPickerSuggestionGroup *)v6;
}

+ (_PHPickerSuggestionGroup)generativeSuggestionGroup
{
  uint64_t v2;
  PUPickerSuggestionAll *v3;
  PUPickerGenerativeFeaturedSuggestion *v4;
  PUPickerWallpaperSuggestion *v5;
  PUPickerWallpaperSuggestion *v6;
  PUPickerWallpaperSuggestion *v7;
  PUPickerSearchBasedSuggestion *v8;
  PUPickerSearchBasedSuggestion *v9;
  void *v10;
  id v11;
  _QWORD v13[8];

  v13[7] = *MEMORY[0x24BDAC8D0];
  v2 = PLIsFeaturedContentAllowed();
  v3 = objc_alloc_init(PUPickerSuggestionAll);
  v4 = objc_alloc_init(PUPickerGenerativeFeaturedSuggestion);
  v5 = -[PUPickerWallpaperSuggestion initWithMode:]([PUPickerWallpaperSuggestion alloc], "initWithMode:", 11, v3, v4);
  v13[2] = v5;
  v6 = -[PUPickerWallpaperSuggestion initWithMode:]([PUPickerWallpaperSuggestion alloc], "initWithMode:", 12);
  v13[3] = v6;
  v7 = -[PUPickerWallpaperSuggestion initWithMode:]([PUPickerWallpaperSuggestion alloc], "initWithMode:", 13);
  v13[4] = v7;
  v8 = -[PUPickerSearchBasedSuggestion initWithMode:]([PUPickerSearchBasedSuggestion alloc], "initWithMode:", 7);
  v13[5] = v8;
  v9 = -[PUPickerSearchBasedSuggestion initWithMode:]([PUPickerSearchBasedSuggestion alloc], "initWithMode:", 8);
  v13[6] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[_PHPickerSuggestionGroup _initWithSuggestions:defaultSuggestionIndex:isForWallpaper:]([_PHPickerSuggestionGroup alloc], "_initWithSuggestions:defaultSuggestionIndex:isForWallpaper:", v10, v2, 0);
  return (_PHPickerSuggestionGroup *)v11;
}

+ (_PHPickerSuggestionGroup)retailExperienceSuggestionGroup
{
  uint64_t v2;
  id v3;
  PUPickerSuggestionAll *v4;
  PUPickerSpatialSuggestion *v5;
  PUPickerPanoramasSuggestion *v6;
  id v7;

  v2 = PLIsFeaturedContentAllowed();
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = objc_alloc_init(PUPickerSuggestionAll);
  objc_msgSend(v3, "addObject:", v4);

  v5 = objc_alloc_init(PUPickerSpatialSuggestion);
  objc_msgSend(v3, "addObject:", v5);

  v6 = objc_alloc_init(PUPickerPanoramasSuggestion);
  objc_msgSend(v3, "addObject:", v6);

  v7 = -[_PHPickerSuggestionGroup _initWithSuggestions:defaultSuggestionIndex:isForWallpaper:]([_PHPickerSuggestionGroup alloc], "_initWithSuggestions:defaultSuggestionIndex:isForWallpaper:", v3, v2, 0);
  return (_PHPickerSuggestionGroup *)v7;
}

+ (id)assetCollectionSuggestionGroup:(id)a3 extendedCuratedAssetsOnly:(BOOL)a4 shouldReverseSortOrder:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v7;
  PUPickerSuggestionAll *v8;
  PUPickerAssetCollectionSuggestion *v9;
  void *v10;
  id v11;
  _QWORD v13[3];

  v5 = a5;
  v6 = a4;
  v13[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = objc_alloc_init(PUPickerSuggestionAll);
  v13[0] = v8;
  v9 = -[PUPickerAssetCollectionSuggestion initWithLocalIdentifier:extendedCuratedAssetsOnly:shouldReverseSortOrder:]([PUPickerAssetCollectionSuggestion alloc], "initWithLocalIdentifier:extendedCuratedAssetsOnly:shouldReverseSortOrder:", v7, v6, v5);

  v13[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[_PHPickerSuggestionGroup _initWithSuggestions:defaultSuggestionIndex:isForWallpaper:]([_PHPickerSuggestionGroup alloc], "_initWithSuggestions:defaultSuggestionIndex:isForWallpaper:", v10, 1, 0);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_wallpaperSuggestionGroupWithDefaultSuggestionIndex:(int64_t)a3
{
  return +[_PHPickerSuggestionGroup _wallpaperSuggestionGroupWithDefaultSuggestionIndex:allowSettlingEffectSuggestions:](_PHPickerSuggestionGroup, "_wallpaperSuggestionGroupWithDefaultSuggestionIndex:allowSettlingEffectSuggestions:", a3, 1);
}

+ (id)_wallpaperSuggestionGroupWithDefaultSuggestionIndex:(int64_t)a3 allowSettlingEffectSuggestions:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  PUPickerSuggestionAll *v7;
  PUPickerWallpaperSuggestion *v8;
  PUPickerLivePhotoWithPossibleMotionEffectSuggestion *v9;
  PUPickerWallpaperSuggestion *v10;
  PUPickerWallpaperSuggestion *v11;
  PUPickerWallpaperSuggestion *v12;
  PUPickerWallpaperSuggestion *v13;
  id v14;

  v4 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(PUPickerSuggestionAll);
  objc_msgSend(v6, "addObject:", v7);

  v8 = -[PUPickerWallpaperSuggestion initWithMode:]([PUPickerWallpaperSuggestion alloc], "initWithMode:", 0);
  objc_msgSend(v6, "addObject:", v8);

  if (PFPosterEnableSettlingEffect() && v4)
  {
    v9 = objc_alloc_init(PUPickerLivePhotoWithPossibleMotionEffectSuggestion);
    objc_msgSend(v6, "addObject:", v9);

  }
  v10 = -[PUPickerWallpaperSuggestion initWithMode:]([PUPickerWallpaperSuggestion alloc], "initWithMode:", 1);
  objc_msgSend(v6, "addObject:", v10);

  v11 = -[PUPickerWallpaperSuggestion initWithMode:]([PUPickerWallpaperSuggestion alloc], "initWithMode:", 2);
  objc_msgSend(v6, "addObject:", v11);

  v12 = -[PUPickerWallpaperSuggestion initWithMode:]([PUPickerWallpaperSuggestion alloc], "initWithMode:", 3);
  objc_msgSend(v6, "addObject:", v12);

  v13 = -[PUPickerWallpaperSuggestion initWithMode:]([PUPickerWallpaperSuggestion alloc], "initWithMode:", 4);
  objc_msgSend(v6, "addObject:", v13);

  v14 = -[_PHPickerSuggestionGroup _initWithSuggestions:defaultSuggestionIndex:isForWallpaper:]([_PHPickerSuggestionGroup alloc], "_initWithSuggestions:defaultSuggestionIndex:isForWallpaper:", v6, a3, 1);
  return v14;
}

@end
