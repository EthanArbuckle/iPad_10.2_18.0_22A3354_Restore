@implementation AVTEditingModelColors

- (AVTEditingModelColors)init
{
  AVTAvatarColorVariationStore *v3;
  AVTEditingModelColors *v4;

  v3 = objc_alloc_init(AVTAvatarColorVariationStore);
  v4 = -[AVTEditingModelColors initWithStorage:variationStore:](self, "initWithStorage:variationStore:", MEMORY[0x1E0C9AA70], v3);

  return v4;
}

- (AVTEditingModelColors)initWithStorage:(id)a3 variationStore:(id)a4
{
  id v7;
  id v8;
  AVTEditingModelColors *v9;
  AVTEditingModelColors *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVTEditingModelColors;
  v9 = -[AVTEditingModelColors init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_storage, a3);
    objc_storeStrong((id *)&v10->_variationStore, a4);
  }

  return v10;
}

- (id)colorForSettingKind:(id)a3 identifier:(id)a4
{
  int64_t var1;
  unint64_t var0;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  var1 = a3.var1;
  var0 = a3.var0;
  v7 = a4;
  -[AVTEditingModelColors storage](self, "storage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  AVTAvatarSettingKindIdentifier(var0, var1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)colorsForSettingKind:(id)a3
{
  int64_t var1;
  unint64_t var0;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  var1 = a3.var1;
  var0 = a3.var0;
  -[AVTEditingModelColors storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AVTAvatarSettingKindIdentifier(var0, var1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_32);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  return v10;
}

uint64_t __46__AVTEditingModelColors_colorsForSettingKind___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(a2, "order"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v5, "order");

  objc_msgSend(v7, "numberWithUnsignedInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AVTEditingModelColors *v4;
  void *v5;
  void *v6;
  void *v7;
  AVTEditingModelColors *v8;

  v4 = [AVTEditingModelColors alloc];
  -[AVTEditingModelColors storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_avtui_deepCopy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTEditingModelColors variationStore](self, "variationStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AVTEditingModelColors initWithStorage:variationStore:](v4, "initWithStorage:variationStore:", v6, v7);

  return v8;
}

+ (id)buildAllColors
{
  AVTMutableEditingModelColors *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(AVTMutableEditingModelColors);
  +[AVTEditingModelMappings paletteCategories](AVTEditingModelMappings, "paletteCategories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(a1, "createColorsForPaletteCategory:inCache:withDerivedPaletteCategories:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8++), "integerValue"), v3, v4);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  v9 = (void *)-[AVTMutableEditingModelColors copy](v3, "copy");

  return v9;
}

+ (void)createColorsForPaletteCategory:(int64_t)a3 inCache:(id)a4 withDerivedPaletteCategories:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(id *, void *, uint64_t, uint64_t);
  void *v20;
  id v21;
  id v22;
  id v23;
  int64_t v24;

  v8 = a4;
  v9 = a5;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __93__AVTEditingModelColors_createColorsForPaletteCategory_inCache_withDerivedPaletteCategories___block_invoke;
  v20 = &unk_1EA520360;
  v10 = v8;
  v21 = v10;
  v11 = v9;
  v22 = v11;
  v23 = a1;
  v24 = a3;
  v12 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1DF0D0754](&v17);
  for (i = 0; i != 3; ++i)
  {
    objc_msgSend(MEMORY[0x1E0D00678], "colorPresetsForCategory:colorIndex:", a3, i, v17, v18, v19, v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = AVTColorSettingKind(a3, i);
    ((void (**)(_QWORD, void *, uint64_t, uint64_t))v12)[2](v12, v14, v15, v16);

  }
}

void __93__AVTEditingModelColors_createColorsForPaletteCategory_inCache_withDerivedPaletteCategories___block_invoke(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  AVTCoreModelColor *v32;
  void *v33;
  AVTCoreModelColor *v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id obj;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id *v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = a2;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v54;
    v44 = *MEMORY[0x1E0C99768];
    v46 = a1;
    v38 = *(_QWORD *)v54;
    v39 = a4;
    do
    {
      v11 = 0;
      v40 = v8;
      do
      {
        if (*(_QWORD *)v54 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v11);
        v13 = a1[4];
        objc_msgSend(v12, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "colorForSettingKind:identifier:", a3, a4, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          v42 = v11;
          v43 = v9;
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v52 = 0u;
          v17 = a1[5];
          v18 = v12;
          v48 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
          if (v48)
          {
            v47 = *(_QWORD *)v50;
            v45 = v16;
            do
            {
              for (i = 0; i != v48; ++i)
              {
                if (*(_QWORD *)v50 != v47)
                  objc_enumerationMutation(v17);
                v20 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
                v21 = objc_msgSend(v20, "integerValue");
                objc_msgSend(v18, "derivedColorNameForPresetCategory:", v21);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v22, "length"))
                {
                  objc_msgSend(a1[4], "colorForSettingKind:identifier:", a3, v21, v22);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v23)
                    objc_msgSend(a1[6], "createColorsForPaletteCategory:inCache:withDerivedPaletteCategories:", v21, a1[4], a1[5]);
                  objc_msgSend(a1[4], "colorForSettingKind:identifier:", a3, v21, v22);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v24)
                  {
                    v25 = v17;
                    v26 = v18;
                    v27 = a3;
                    v28 = (void *)MEMORY[0x1E0C99DA0];
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21);
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v46[7]);
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    v31 = v28;
                    a3 = v27;
                    v18 = v26;
                    v17 = v25;
                    objc_msgSend(v31, "raise:format:", v44, CFSTR("Couldn't create the derived color for name %@ in palette category %@ parent category %@"), v22, v29, v30);

                    v16 = v45;
                    a1 = v46;

                  }
                  objc_msgSend(v16, "setObject:forKeyedSubscript:", v24, v20);

                }
              }
              v48 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
            }
            while (v48);
          }

          v32 = [AVTCoreModelColor alloc];
          v33 = v18;
          a4 = v39;
          v34 = -[AVTCoreModelColor initWithColorPreset:settingKind:order:derivedColorsByCategories:](v32, "initWithColorPreset:settingKind:order:derivedColorsByCategories:", v33, a3, v39, v43, v16);
          v35 = v16;
          v36 = v46[4];
          -[AVTCoreModelColor identifier](v34, "identifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setColor:forSettingKind:identifier:", v34, a3, v39, v37);

          v9 = v43 + 1;
          a1 = v46;
          v10 = v38;
          v8 = v40;
          v11 = v42;
        }
        ++v11;
      }
      while (v11 != v8);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    }
    while (v8);
  }

}

- (BOOL)colorHasDerivedColorDependency:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v34;
  uint64_t v35;
  AVTEditingModelColors *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  -[AVTEditingModelColors storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v52;
    v39 = v6;
    v36 = self;
    v34 = *(_QWORD *)v52;
    do
    {
      v9 = 0;
      v35 = v7;
      do
      {
        if (*(_QWORD *)v52 != v8)
          objc_enumerationMutation(v6);
        v40 = v9;
        v10 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v9);
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        -[AVTEditingModelColors storage](self, "storage");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "allKeys");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v41 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
        if (v41)
        {
          v14 = *(_QWORD *)v48;
          v37 = *(_QWORD *)v48;
          v38 = v10;
          v42 = v13;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v48 != v14)
                objc_enumerationMutation(v13);
              v16 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v15);
              -[AVTEditingModelColors storage](self, "storage");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "objectForKeyedSubscript:", v10);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "objectForKeyedSubscript:", v16);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              v20 = (void *)MEMORY[0x1DF0D05A4]();
              v43 = 0u;
              v44 = 0u;
              v45 = 0u;
              v46 = 0u;
              objc_msgSend(v19, "derivedColorsByCategories");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "allValues");
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
              if (v23)
              {
                v24 = v23;
                v25 = *(_QWORD *)v44;
                while (2)
                {
                  for (i = 0; i != v24; ++i)
                  {
                    if (*(_QWORD *)v44 != v25)
                      objc_enumerationMutation(v22);
                    v27 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
                    objc_msgSend(v27, "settingKind");
                    v29 = v28;
                    objc_msgSend(v4, "settingKind");
                    if (v29 == v30)
                    {
                      v31 = objc_msgSend(v27, "settingKind");
                      if (v31 == objc_msgSend(v4, "settingKind"))
                      {

                        objc_autoreleasePoolPop(v20);
                        v32 = 1;
                        v6 = v39;
                        goto LABEL_27;
                      }
                    }
                  }
                  v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
                  if (v24)
                    continue;
                  break;
                }
              }

              objc_autoreleasePoolPop(v20);
              ++v15;
              v13 = v42;
              self = v36;
              v14 = v37;
              v10 = v38;
            }
            while (v15 != v41);
            v6 = v39;
            v8 = v34;
            v41 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
          }
          while (v41);
        }

        v9 = v40 + 1;
      }
      while (v40 + 1 != v35);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
      v32 = 0;
    }
    while (v7);
  }
  else
  {
    v32 = 0;
  }
LABEL_27:

  return v32;
}

- (AVTAvatarColorVariationStore)variationStore
{
  return self->_variationStore;
}

- (void)setVariationStore:(id)a3
{
  objc_storeStrong((id *)&self->_variationStore, a3);
}

- (NSDictionary)storage
{
  return self->_storage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_variationStore, 0);
}

@end
