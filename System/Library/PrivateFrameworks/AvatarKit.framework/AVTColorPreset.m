@implementation AVTColorPreset

- (NSString)localizedName
{
  return (NSString *)AVTLocalizedPaletteString(self->_category, self->_name);
}

+ (id)colorPresetWithName:(id)a3 category:(int64_t)a4 variation:(float)a5
{
  return (id)objc_msgSend(a1, "colorPresetWithName:category:colorIndex:variation:", a3, a4, 0);
}

+ (id)colorPresetWithName:(id)a3 category:(int64_t)a4 colorIndex:(unint64_t)a5 variation:(float)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  int v16;
  double v17;
  id v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  +[AVTPreset colorPresetsForCategory:colorIndex:](AVTPreset, "colorPresetsForCategory:colorIndex:", a4, a5);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v14, "name", (_QWORD)v21);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", v9);

        if (v16)
        {
          v11 = v14;
          goto LABEL_11;
        }
      }
      v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_11:

  if (a6 == 0.0)
  {
    v18 = v11;
  }
  else
  {
    *(float *)&v17 = a6;
    objc_msgSend(v11, "colorPresetWithVariation:", v17);
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = v18;

  return v19;
}

+ (id)secondaryColorPresetWithName:(id)a3 category:(int64_t)a4 variation:(float)a5
{
  return (id)objc_msgSend(a1, "colorPresetWithName:category:colorIndex:variation:", a3, a4, 1);
}

+ (id)colorPresetWithName:(id)a3 category:(int64_t)a4
{
  double v4;

  LODWORD(v4) = 0;
  return (id)objc_msgSend(a1, "colorPresetWithName:category:variation:", a3, a4, v4);
}

+ (id)_colorPresetsForCategory:(int64_t)a3 palette:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  AVTColorPreset *v15;
  AVTColorPreset *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  AVTPresetCategoryToColorCategoryString(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13);
          v15 = [AVTColorPreset alloc];
          v16 = -[AVTColorPreset initWithCategory:description:](v15, "initWithCategory:description:", a3, v14, (_QWORD)v18);
          objc_msgSend(v8, "addObject:", v16);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)colorPresetsForCategory:(int64_t)a3 colorIndex:(unint64_t)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__AVTColorPreset_colorPresetsForCategory_colorIndex___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (colorPresetsForCategory_colorIndex__onceToken != -1)
    dispatch_once(&colorPresetsForCategory_colorIndex__onceToken, block);
  return (id)colorPresetsForCategory_colorIndex__colorPresets[3 * a3 + a4];
}

void __53__AVTColorPreset_colorPresetsForCategory_colorIndex___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  void *v3;
  uint64_t i;
  id v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void **v9;
  uint64_t v10;
  void *v11;
  id v12;

  v2 = &colorPresetsForCategory_colorIndex__colorPresets;
  AVTPrecompiledMemojiColorPalettes();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 3; ++i)
  {
    v5 = v3;
    v12 = v5;
    if (i == 1)
    {
      v7 = CFSTR("secondaryColors");
      goto LABEL_6;
    }
    v6 = v5;
    if (i == 2)
    {
      v7 = CFSTR("tertiaryColors");
LABEL_6:
      objc_msgSend(v5, "objectForKeyedSubscript:", v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v8 = 0;
    v9 = (void **)v2;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "_colorPresetsForCategory:palette:", v8, v6);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *v9;
      *v9 = (void *)v10;
      v9 += 3;

      ++v8;
    }
    while (v8 != 40);

    ++v2;
  }

}

+ (id)colorPresetsForCategory:(int64_t)a3
{
  return (id)objc_msgSend(a1, "colorPresetsForCategory:colorIndex:", a3, 0);
}

+ (id)secondaryColorPresetsForCategory:(int64_t)a3
{
  return (id)objc_msgSend(a1, "colorPresetsForCategory:colorIndex:", a3, 1);
}

+ (id)fallbackColorPresetForNilPresetAndCategory:(int64_t)a3 colorIndex:(unint64_t)a4
{
  void *v4;
  void *v5;

  if (a4 >= 3)
    +[AVTColorPreset fallbackColorPresetForNilPresetAndCategory:colorIndex:].cold.1();
  if (!a4)
    goto LABEL_10;
  if (a4 != 2)
  {
    if ((unint64_t)a3 <= 0x22 && ((1 << a3) & 0x400000090) != 0)
    {
      v4 = 0;
      return v4;
    }
LABEL_10:
    +[AVTPreset colorPresetsForCategory:colorIndex:](AVTPreset, "colorPresetsForCategory:colorIndex:", a3, a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  v4 = 0;
  if (a3 != 4 && a3 != 34)
  {
    a4 = 2;
    goto LABEL_10;
  }
  return v4;
}

- (AVTColorPreset)initWithCategory:(int64_t)a3 description:(id)a4
{
  id v6;
  AVTColorPreset *v7;
  uint64_t v8;
  NSString *name;
  uint64_t v10;
  NSDictionary *derivedColors;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSDictionary *v16;
  id v17;
  id v18;
  NSDictionary *propertyColors;
  NSDictionary *v20;
  void *v21;
  AVTVaryingColor *v22;
  AVTVaryingColor *previewColor;
  void *v24;
  const char *v25;
  void *v26;
  AVTVaryingColor *v27;
  void *v28;
  const char *v29;
  void *v30;
  AVTVaryingColor *v31;
  void *v32;
  const char *v33;
  void *v34;
  AVTVaryingColor *v35;
  void *v36;
  AVTVaryingColor *v37;
  AVTVaryingColor *previewAccentColor;
  void *v39;
  const char *v40;
  void *v41;
  AVTVaryingColor *v42;
  void *v43;
  const char *v44;
  void *v45;
  AVTVaryingColor *v46;
  void *v47;
  const char *v48;
  void *v49;
  AVTVaryingColor *v50;
  void *v51;
  uint64_t v53;
  uint64_t v54;
  _QWORD v55[4];
  NSDictionary *v56;
  id v57;
  id v58;
  objc_super v59;

  v6 = a4;
  v59.receiver = self;
  v59.super_class = (Class)AVTColorPreset;
  v7 = -[AVTColorPreset init](&v59, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
    v8 = objc_claimAutoreleasedReturnValue();
    name = v7->_name;
    v7->_name = (NSString *)v8;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("derived"));
    v10 = objc_claimAutoreleasedReturnValue();
    derivedColors = v7->_derivedColors;
    v7->_derivedColors = (NSDictionary *)v10;

    v7->_category = a3;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("colors"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("variations-min"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("variations-max"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v12, "count"));
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __47__AVTColorPreset_initWithCategory_description___block_invoke;
    v55[3] = &unk_1EA61EDD0;
    v16 = v15;
    v56 = v16;
    v57 = v13;
    v58 = v14;
    v17 = v14;
    v18 = v13;
    objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v55);
    propertyColors = v7->_propertyColors;
    v7->_propertyColors = v16;
    v20 = v16;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("preview"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = objc_alloc_init(AVTVaryingColor);
      previewColor = v7->_previewColor;
      v7->_previewColor = v22;

      v53 = 0;
      v54 = 0;
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("color"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      _scanColor(v24, (float *)&v54 + 1, (float *)&v54, (float *)&v53 + 1, (float *)&v53);

      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", *((float *)&v54 + 1), *(float *)&v54, *((float *)&v53 + 1), *(float *)&v53);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v7->_previewColor;
      if (v27)
        objc_setProperty_atomic(v27, v25, v26, 8);

      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("variation-min"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      _scanColor(v28, (float *)&v54 + 1, (float *)&v54, (float *)&v53 + 1, (float *)&v53);

      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", *((float *)&v54 + 1), *(float *)&v54, *((float *)&v53 + 1), *(float *)&v53);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v7->_previewColor;
      if (v31)
        objc_setProperty_atomic(v31, v29, v30, 16);

      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("variation-max"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      _scanColor(v32, (float *)&v54 + 1, (float *)&v54, (float *)&v53 + 1, (float *)&v53);

      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", *((float *)&v54 + 1), *(float *)&v54, *((float *)&v53 + 1), *(float *)&v53);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v7->_previewColor;
      if (v35)
        objc_setProperty_atomic(v35, v33, v34, 24);

      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("accent"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36)
      {
        v37 = objc_alloc_init(AVTVaryingColor);
        previewAccentColor = v7->_previewAccentColor;
        v7->_previewAccentColor = v37;

        objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("color"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        _scanColor(v39, (float *)&v54 + 1, (float *)&v54, (float *)&v53 + 1, (float *)&v53);

        objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", *((float *)&v54 + 1), *(float *)&v54, *((float *)&v53 + 1), *(float *)&v53);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v7->_previewAccentColor;
        if (v42)
          objc_setProperty_atomic(v42, v40, v41, 8);

        objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("variation-min"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        _scanColor(v43, (float *)&v54 + 1, (float *)&v54, (float *)&v53 + 1, (float *)&v53);

        objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", *((float *)&v54 + 1), *(float *)&v54, *((float *)&v53 + 1), *(float *)&v53);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v7->_previewAccentColor;
        if (v46)
          objc_setProperty_atomic(v46, v44, v45, 16);

        objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("variation-max"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        _scanColor(v47, (float *)&v54 + 1, (float *)&v54, (float *)&v53 + 1, (float *)&v53);

        objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", *((float *)&v54 + 1), *(float *)&v54, *((float *)&v53 + 1), *(float *)&v53);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v7->_previewAccentColor;
        if (v50)
          objc_setProperty_atomic(v50, v48, v49, 24);

        objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("type"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v7->_previewAccentType = objc_msgSend(v51, "isEqualToString:", CFSTR("soft"));

      }
    }

  }
  return v7;
}

void __47__AVTColorPreset_initWithCategory_description___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  AVTVaryingColor *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  const char *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  const char *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v31 = a2;
  v5 = a3;
  v6 = objc_alloc_init(AVTVaryingColor);
  objc_msgSend(a1[4], "setObject:forKeyedSubscript:", v6, v31);
  v34 = 0;
  v35 = 0;
  _scanColor(v5, (float *)&v35 + 1, (float *)&v35, (float *)&v34 + 1, (float *)&v34);

  v7 = *((float *)&v35 + 1);
  v8 = *(float *)&v35;
  v9 = *((float *)&v34 + 1);
  v10 = *(float *)&v34;
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", *((float *)&v35 + 1), *(float *)&v35, *((float *)&v34 + 1), *(float *)&v34);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_setProperty_atomic(v6, v11, v12, 8);

  objc_msgSend(a1[5], "objectForKeyedSubscript:", v31);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v32 = 0;
    v33 = 0;
    _scanColor(v13, (float *)&v33 + 1, (float *)&v33, (float *)&v32 + 1, (float *)&v32);
    v15 = (void *)MEMORY[0x1E0CEA478];
    v16 = *((float *)&v33 + 1);
    v17 = *(float *)&v33;
    v18 = *((float *)&v32 + 1);
    v19 = *(float *)&v32;
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CEA478];
    v16 = v7 * 0.5;
    v17 = v8 * 0.5;
    v18 = v9 * 0.5;
    v19 = v10;
  }
  objc_msgSend(v15, "colorWithRed:green:blue:alpha:", v16, v17, v18, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_setProperty_atomic(v6, v20, v21, 16);

  objc_msgSend(a1[6], "objectForKeyedSubscript:", v31);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    v32 = 0;
    v33 = 0;
    _scanColor(v22, (float *)&v33 + 1, (float *)&v33, (float *)&v32 + 1, (float *)&v32);
    v24 = (void *)MEMORY[0x1E0CEA478];
    v25 = *((float *)&v33 + 1);
    v26 = *(float *)&v33;
    v27 = *((float *)&v32 + 1);
    v28 = *(float *)&v32;
  }
  else
  {
    v24 = (void *)MEMORY[0x1E0CEA478];
    v25 = v7 * 1.5;
    v26 = v8 * 1.5;
    v27 = v9 * 1.5;
    v28 = v10;
  }
  objc_msgSend(v24, "colorWithRed:green:blue:alpha:", v25, v26, v27, v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_setProperty_atomic(v6, v29, v30, 24);

}

- (id)copyWithZone:(_NSZone *)a3
{
  AVTColorPreset *v4;

  v4 = objc_alloc_init(AVTColorPreset);
  objc_storeStrong((id *)&v4->_material, self->_material);
  objc_storeStrong((id *)&v4->_name, self->_name);
  v4->_category = self->_category;
  objc_storeStrong((id *)&v4->_propertyColors, self->_propertyColors);
  objc_storeStrong((id *)&v4->_derivedColors, self->_derivedColors);
  objc_storeStrong((id *)&v4->_previewColor, self->_previewColor);
  objc_storeStrong((id *)&v4->_previewAccentColor, self->_previewAccentColor);
  v4->_previewAccentType = self->_previewAccentType;
  v4->_variation = self->_variation;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char isKindOfClass;
  BOOL v6;
  id v7;
  void *v8;
  int v9;
  float v10;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = 0;
  if (v4 && (isKindOfClass & 1) != 0)
  {
    v7 = v4;
    objc_msgSend(v7, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", self->_name);

    if (v9 && objc_msgSend(v7, "category") == self->_category)
    {
      objc_msgSend(v7, "variation");
      v6 = v10 == self->_variation;
    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (BOOL)isNaturalLipsColor
{
  void *v3;
  char v4;

  if (-[AVTColorPreset category](self, "category") != 10)
    return 0;
  -[AVTColorPreset name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsString:", CFSTR("Natural"));

  return v4;
}

- (BOOL)shouldBlendWithSkinColor
{
  unint64_t v2;

  v2 = -[AVTColorPreset category](self, "category");
  return (v2 < 0x1E) & (0x29C00000u >> v2);
}

- (UIImage)thumbnail
{
  CGColorSpace *DeviceRGB;
  CGContext *v4;
  void *v5;
  const char *v6;
  __int128 v7;
  float v8;
  CGImageRef Image;
  void *v10;
  __int128 v12;
  CGFloat lengths[3];
  uint64_t v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v14 = *MEMORY[0x1E0C80C00];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v4 = CGBitmapContextCreate(0, 0x78uLL, 0x78uLL, 8uLL, 0x1E0uLL, DeviceRGB, 1u);
  CFRelease(DeviceRGB);
  v15.size.width = 120.0;
  v15.origin.x = 0.0;
  v15.origin.y = 0.0;
  v15.size.height = 120.0;
  CGContextAddEllipseInRect(v4, v15);
  CGContextClip(v4);
  -[AVTColorPreset previewColor](self, "previewColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(double *)&v7 = AVTGetColorComponents(v5, v6);
  v12 = v7;

  v8 = 1.0;
  if (*((float *)&v12 + 3) != 0.0)
    v8 = *((float *)&v12 + 3);
  CGContextSetRGBFillColor(v4, *(float *)&v12, *((float *)&v12 + 1), *((float *)&v12 + 2), v8);
  if (*((float *)&v12 + 3) == 0.0)
  {
    *(_OWORD *)lengths = xmmword_1DD26A3A0;
    CGContextSetLineWidth(v4, 10.0);
    CGContextSetLineDash(v4, 0.0, lengths, 2uLL);
    v16.size.width = 120.0;
    v16.origin.x = 0.0;
    v16.origin.y = 0.0;
    v16.size.height = 120.0;
    CGContextStrokeEllipseInRect(v4, v16);
  }
  else
  {
    v17.size.width = 120.0;
    v17.origin.x = 0.0;
    v17.origin.y = 0.0;
    v17.size.height = 120.0;
    CGContextFillRect(v4, v17);
  }
  Image = CGBitmapContextCreateImage(v4);
  CFRelease(v4);
  objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:", Image);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CFRelease(Image);
  return (UIImage *)v10;
}

- (id)baseColor
{
  void *v2;
  void *v3;

  -[AVTColorPreset makeMaterial](self, "makeMaterial");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "baseColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)previewColor
{
  double v2;

  if (self->_previewColor)
  {
    *(float *)&v2 = self->_variation;
    -[AVTVaryingColor colorByApplyingVariation:](self->_previewColor, "colorByApplyingVariation:", v2);
  }
  else
  {
    -[AVTColorPreset baseColor](self, "baseColor");
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)previewAccentColor
{
  double v2;
  void *previewAccentColor;

  previewAccentColor = self->_previewAccentColor;
  if (previewAccentColor)
  {
    *(float *)&v2 = self->_variation;
    objc_msgSend(previewAccentColor, "colorByApplyingVariation:", v2);
    previewAccentColor = (void *)objc_claimAutoreleasedReturnValue();
  }
  return previewAccentColor;
}

- (id)makeMaterial
{
  AVTMaterial *material;
  AVTMaterial *v4;
  AVTMaterial *v5;
  void *v6;
  NSDictionary *propertyColors;
  id v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  AVTColorPreset *v14;
  id v15;

  material = self->_material;
  if (!material)
  {
    v4 = objc_alloc_init(AVTMaterial);
    v5 = self->_material;
    self->_material = v4;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSDictionary count](self->_propertyColors, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    propertyColors = self->_propertyColors;
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __30__AVTColorPreset_makeMaterial__block_invoke;
    v13 = &unk_1EA61EDF8;
    v14 = self;
    v15 = v6;
    v8 = v6;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](propertyColors, "enumerateKeysAndObjectsUsingBlock:", &v10);
    -[AVTMaterial setAdditionalPropertyColors:](self->_material, "setAdditionalPropertyColors:", v8, v10, v11, v12, v13, v14);

    material = self->_material;
  }
  return material;
}

void __30__AVTColorPreset_makeMaterial__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  void *v7;
  id Property;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v7 = v5;
  if (*(float *)(*(_QWORD *)(a1 + 32) + 64) == 0.0)
  {
    if (v5)
      Property = objc_getProperty(v5, v6, 8, 1);
    else
      Property = 0;
    v9 = Property;
  }
  else
  {
    objc_msgSend(v5, "colorByApplyingVariation:");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("diffuse")))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setBaseColor:", v10);
  else
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v10, v11);

}

- (void)enumerateDerivedColorPresetsUsingBlock:(id)a3
{
  id v4;
  NSDictionary *derivedColors;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  derivedColors = self->_derivedColors;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__AVTColorPreset_enumerateDerivedColorPresetsUsingBlock___block_invoke;
  v7[3] = &unk_1EA61EE20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](derivedColors, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __57__AVTColorPreset_enumerateDerivedColorPresetsUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  double v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = AVTPresetCategoryFromString(a2);
  LODWORD(v7) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 64);
  +[AVTColorPreset colorPresetWithName:category:variation:](AVTColorPreset, "colorPresetWithName:category:variation:", v5, v6, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v9)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v8 = v9;
  }

}

- (id)derivedColorNameForPresetCategory:(int64_t)a3
{
  void *v4;
  void *v5;

  AVTPresetCategoryToColorCategoryString(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_derivedColors, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)category
{
  return self->_category;
}

- (AVTColorPreset)colorPresetWithVariation:(float)a3
{
  AVTColorPreset *v4;
  AVTMaterial *material;

  if (self->_variation == a3)
  {
    v4 = self;
  }
  else
  {
    v4 = (AVTColorPreset *)-[AVTColorPreset copy](self, "copy");
    v4->_variation = a3;
    material = v4->_material;
    v4->_material = 0;

  }
  return v4;
}

- (float)variation
{
  return self->_variation;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSString *name;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  AVTPresetCategoryToString(self->_category);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> name:%@ category:%@ variation:%f "), v5, self, name, v7, self->_variation);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)renderColorIntoCALayer:(id)a3 withSkinColor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const char *v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  id v19;
  void *v20;
  const char *v21;
  float32x4_t v22;
  double v23;
  void *v24;
  const char *v25;
  float32x4_t v26;
  float32x4_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  unint64_t previewAccentType;
  void *v36;
  void *v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  _QWORD v41[2];
  _QWORD v42[4];

  v42[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.0);
  if (-[AVTColorPreset isNaturalLipsColor](self, "isNaturalLipsColor"))
  {
    objc_msgSend(v7, "baseColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(double *)v10.i64 = AVTGetColorComponents(v8, v9);
    v11 = vsubq_f32((float32x4_t)xmmword_1DD26A390, v10);
    v12 = vaddq_f32(v10, v11);
    v13.i64[0] = 0x3F0000003F000000;
    v13.i64[1] = 0x3F0000003F000000;
    v14 = vmlaq_f32(v10, v13, v11);
    v13.i8[3] = 0;
    v13.i8[7] = 0;
    v13.i8[11] = 0;
    v13.i8[15] = 0;
    v38 = vmlaq_f32(v10, v13, v11);
    v39 = v14;
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v12.f32[0], v12.f32[1], v12.f32[2], 1.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v38.f32[0], v38.f32[1], v38.f32[2], 1.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v39.f32[0], v39.f32[1], v39.f32[2], 1.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v18 = self->_variation;
    AVTColorApplyVariation(v17, v15, v16, v18);
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "setBackgroundColor:", objc_msgSend(v19, "CGColor"));

LABEL_16:
    goto LABEL_17;
  }
  -[AVTColorPreset previewColor](self, "previewColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  *(double *)v22.i64 = AVTGetColorComponents(v20, v21);
  v40 = v22;

  v23 = COERCE_DOUBLE(__PAIR64__(v40.u32[1], v40.u32[3]));
  if (v40.f32[3] < 1.0
    && -[AVTColorPreset shouldBlendWithSkinColor](self, "shouldBlendWithSkinColor", COERCE_DOUBLE(__PAIR64__(v40.u32[1], v40.u32[3]))))
  {
    objc_msgSend(v7, "previewColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(double *)v26.i64 = AVTGetColorComponents(v24, v25);
    v38 = v26;

    v27 = vmlaq_laneq_f32(v38, vsubq_f32(v40, v38), v40, 3);
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v27.f32[0], v27.f32[1], v27.f32[2], 1.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AVTColorPreset previewColor](self, "previewColor", v23);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29 = objc_retainAutorelease(v28);
  v30 = objc_msgSend(v29, "CGColor");

  objc_msgSend(v6, "setBackgroundColor:", v30);
  -[AVTColorPreset previewAccentColor](self, "previewAccentColor");
  v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v32 = objc_msgSend(v31, "CGColor");

  objc_msgSend(v6, "sublayers");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "firstObject");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v34;
  if (v32)
  {

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CD2790], "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bounds");
      objc_msgSend(v8, "setFrame:");
      objc_msgSend(v6, "addSublayer:", v8);
    }
    previewAccentType = self->_previewAccentType;
    if (previewAccentType == 1)
    {
      v41[0] = v30;
      v41[1] = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = &unk_1EA6B8130;
    }
    else
    {
      if (previewAccentType)
        goto LABEL_16;
      v42[0] = v32;
      v42[1] = v30;
      v42[2] = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 3);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = &unk_1EA6B8118;
    }
    objc_msgSend(v8, "setColors:", v36, *(_OWORD *)&v38);

    objc_msgSend(v8, "setLocations:", v37);
    objc_msgSend(v8, "setStartPoint:", 0.0, 0.0);
    objc_msgSend(v8, "setEndPoint:", 1.0, 1.0);
    objc_msgSend(v8, "setType:", *MEMORY[0x1E0CD2F48]);
    goto LABEL_16;
  }
  objc_msgSend(v34, "removeFromSuperlayer");

LABEL_17:
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit", *(_OWORD *)&v38);

}

- (id)gradientLayerWithRangeMin:(float)a3 max:(float)a4
{
  return -[AVTColorPreset gradientLayerWithRangeMin:max:withSkinColor:](self, "gradientLayerWithRangeMin:max:withSkinColor:", 0);
}

- (id)gradientLayerWithRangeMin:(float)a3 max:(float)a4 withSkinColor:(id)a5
{
  id v8;
  double v9;
  void *v10;
  const char *v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  float32x4_t v33;
  float32x4_t v34;
  _QWORD v35[3];
  _QWORD v36[4];

  v36[3] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (-[AVTColorPreset isNaturalLipsColor](self, "isNaturalLipsColor"))
  {
    objc_msgSend(v8, "baseColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(double *)v12.i64 = AVTGetColorComponents(v10, v11);
    v13 = vsubq_f32((float32x4_t)xmmword_1DD26A390, v12);
    v14 = vaddq_f32(v12, v13);
    v15.i64[0] = 0x3F0000003F000000;
    v15.i64[1] = 0x3F0000003F000000;
    v16 = vmlaq_f32(v12, v15, v13);
    v15.i8[3] = 0;
    v15.i8[7] = 0;
    v15.i8[11] = 0;
    v15.i8[15] = 0;
    v33 = v16;
    v34 = vmlaq_f32(v12, v15, v13);
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v14.f32[0], v14.f32[1], v14.f32[2], 1.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v33.f32[0], v33.f32[1], v33.f32[2], 1.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v34.f32[0], v34.f32[1], v34.f32[2], 1.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2790], "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_retainAutorelease(v17);
    v36[0] = objc_msgSend(v21, "CGColor");
    v22 = objc_retainAutorelease(v18);
    v36[1] = objc_msgSend(v22, "CGColor");
    v23 = objc_retainAutorelease(v19);
    v36[2] = objc_msgSend(v23, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setColors:", v24);

    objc_msgSend(v20, "setStartPoint:", 0.0, 0.5);
    objc_msgSend(v20, "setEndPoint:", 1.0, 0.5);
  }
  else
  {
    *(float *)&v9 = a3;
    -[AVTColorPreset colorPresetWithVariation:](self, "colorPresetWithVariation:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v25 = a4;
    -[AVTColorPreset colorPresetWithVariation:](self, "colorPresetWithVariation:", v25);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "previewColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTColorPreset previewColor](self, "previewColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "previewColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2790], "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && -[AVTColorPreset shouldBlendWithSkinColor](self, "shouldBlendWithSkinColor"))
    {
      objc_msgSend(v8, "previewColor");
      v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v20, "setBackgroundColor:", objc_msgSend(v29, "CGColor"));

    }
    v22 = objc_retainAutorelease(v26);
    v35[0] = objc_msgSend(v22, "CGColor");
    v23 = objc_retainAutorelease(v27);
    v35[1] = objc_msgSend(v23, "CGColor");
    v30 = objc_retainAutorelease(v28);
    v35[2] = objc_msgSend(v30, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 3);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setColors:", v31);

    objc_msgSend(v20, "setStartPoint:", 0.0, 0.5);
    objc_msgSend(v20, "setEndPoint:", 1.0, 0.5);

  }
  return v20;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_material, 0);
  objc_storeStrong((id *)&self->_previewAccentColor, 0);
  objc_storeStrong((id *)&self->_previewColor, 0);
  objc_storeStrong((id *)&self->_derivedColors, 0);
  objc_storeStrong((id *)&self->_propertyColors, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (void)fallbackColorPresetForNilPresetAndCategory:colorIndex:.cold.1()
{
  __assert_rtn("+[AVTColorPreset fallbackColorPresetForNilPresetAndCategory:colorIndex:]", "AVTColorPreset.m", 282, "index < AVT_MAX_COLOR_PRESETS");
}

@end
