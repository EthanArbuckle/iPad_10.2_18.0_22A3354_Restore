@implementation AVTPreset

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AVTPresetCategoryToString(self->_category);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p category=%@ identifier=%@>"), v5, self, v6, self->_identifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)availablePresetsForCategory:(int64_t)a3
{
  if (AVTPresetLoadPresetsIfNeeded_onceToken != -1)
    dispatch_once(&AVTPresetLoadPresetsIfNeeded_onceToken, &__block_literal_global_240);
  return gPresets[a3];
}

+ (AVTPreset)presetWithCategory:(int64_t)a3 identifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a1, "availablePresetsForCategory:", a3);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "identifier", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v6);

        if ((v13 & 1) != 0)
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return (AVTPreset *)v8;
}

- (int64_t)category
{
  return self->_category;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)displayableName
{
  return self->_identifier;
}

- (NSString)localizedName
{
  return (NSString *)AVTLocalizedPresetString(self->_category, self->_identifier);
}

- (NSString)localizedPairedName
{
  return (NSString *)AVTLocalizedPresetPairString(self->_category, self->_identifier);
}

- (BOOL)hasComponent
{
  return -[NSArray count](self->_assets, "count")
      || self->_morphVariant
      || self->_imageVariant
      || self->_materialVariant != 0;
}

- (id)assets
{
  return self->_assets;
}

- (void)enumeratePresetDependencies:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_dependencies;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        if (v10 && *(_QWORD *)(v10 + 24))
          (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, *(_QWORD *)(v10 + 16), *(_QWORD *)(v10 + 24));
        ++v9;
      }
      while (v7 != v9);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v7 = v11;
    }
    while (v11);
  }

}

- (void)enumerateVisibilityDependencies:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_dependencies;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        if (v10 && *(_QWORD *)(v10 + 56))
          (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, *(_QWORD *)(v10 + 16), *(_QWORD *)(v10 + 56));
        ++v9;
      }
      while (v7 != v9);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v7 = v11;
    }
    while (v11);
  }

}

- (void)enumerateVariantDependenciesOfKind:(unint64_t)a3 block:(id)a4
{
  void (**v6)(id, uint64_t, uint64_t, float);
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  __n128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, uint64_t, uint64_t, float))a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = self->_dependencies;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v11);
        if (a3 == 2)
        {
          if (v12 && *(_QWORD *)(v12 + 48))
          {
            v16 = *(_QWORD *)(v12 + 16);
            v17 = *(_QWORD *)(v12 + 48);
            goto LABEL_18;
          }
        }
        else if (a3 == 1)
        {
          if (v12 && *(_QWORD *)(v12 + 40))
          {
            v16 = *(_QWORD *)(v12 + 16);
            v17 = *(_QWORD *)(v12 + 40);
LABEL_18:
            v6[2](v6, v16, v17, 1.0);
          }
        }
        else if (!a3 && v12 && *(_QWORD *)(v12 + 32))
        {
          v13 = *(_QWORD *)(v12 + 16);
          v14 = *(id *)(v12 + 32);
          v15.n128_u32[0] = *(_DWORD *)(v12 + 8);
          ((void (*)(void (**)(id, uint64_t, uint64_t, float), uint64_t, id, __n128))v6[2])(v6, v13, v14, v15);

        }
        ++v11;
      }
      while (v9 != v11);
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v9 = v18;
    }
    while (v18);
  }

}

- (void)enumeratePresetSpecificPresetDependencies:(id)a3
{
  id v4;
  NSDictionary *presetSpecificPresetDependencies;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  presetSpecificPresetDependencies = self->_presetSpecificPresetDependencies;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__AVTPreset_enumeratePresetSpecificPresetDependencies___block_invoke;
  v7[3] = &unk_1EA61DF58;
  v8 = v4;
  v6 = v4;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](presetSpecificPresetDependencies, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __55__AVTPreset_enumeratePresetSpecificPresetDependencies___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v5 = a3;
  v6 = AVTPresetCategoryFromString(a2);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__AVTPreset_enumeratePresetSpecificPresetDependencies___block_invoke_2;
  v7[3] = &unk_1EA61DF30;
  v9 = v6;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __55__AVTPreset_enumeratePresetSpecificPresetDependencies___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  +[AVTPreset presetWithCategory:identifier:](AVTPreset, "presetWithCategory:identifier:", v5, a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)enumerateAssetSpecificVariantDependenciesOfKind:(unint64_t)a3 block:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t j;
  _QWORD v17[4];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  _BYTE v25[128];
  _QWORD v26[5];

  v26[3] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v26[0] = self->_assetSpecificMorphVariantDependencies;
  v26[1] = self->_assetSpecificImageVariantDependencies;
  v26[2] = self->_assetSpecificMaterialVariantDependencies;
  v7 = (id)v26[a3];
  v8 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __67__AVTPreset_enumerateAssetSpecificVariantDependenciesOfKind_block___block_invoke;
  v23[3] = &unk_1EA61DF58;
  v9 = v6;
  v24 = v9;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v23);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = self->_assets;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v17[0] = v8;
        v17[1] = 3221225472;
        v17[2] = __67__AVTPreset_enumerateAssetSpecificVariantDependenciesOfKind_block___block_invoke_3;
        v17[3] = &unk_1EA61F8D0;
        v18 = v9;
        objc_msgSend(v15, "enumerateVariantDependenciesOfKind:block:", a3, v17);

      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v12);
  }

  for (j = 2; j != -1; --j)
}

void __67__AVTPreset_enumerateAssetSpecificVariantDependenciesOfKind_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v5 = a3;
  v6 = AVTComponentTypeFromString(a2);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__AVTPreset_enumerateAssetSpecificVariantDependenciesOfKind_block___block_invoke_2;
  v7[3] = &unk_1EA61DF30;
  v8 = *(id *)(a1 + 32);
  v9 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);

}

uint64_t __67__AVTPreset_enumerateAssetSpecificVariantDependenciesOfKind_block___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2, a3);
}

uint64_t __67__AVTPreset_enumerateAssetSpecificVariantDependenciesOfKind_block___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (unint64_t)editableColorCountForCategory:(int64_t)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  unint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "availablePresetsForCategory:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "editableColorCount");
        if (v6 <= v9)
          v6 = v9;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)colorPresetsForCategory:(int64_t)a3 colorIndex:(unint64_t)a4
{
  return +[AVTColorPreset colorPresetsForCategory:colorIndex:](AVTColorPreset, "colorPresetsForCategory:colorIndex:", a3, a4);
}

+ (id)colorPresetsForCategory:(int64_t)a3
{
  return +[AVTColorPreset colorPresetsForCategory:](AVTColorPreset, "colorPresetsForCategory:", a3);
}

+ (id)secondaryColorPresetsForCategory:(int64_t)a3
{
  return +[AVTColorPreset secondaryColorPresetsForCategory:](AVTColorPreset, "secondaryColorPresetsForCategory:", a3);
}

- (void)applyPresetByChangingComponentsOfMemoji:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  AVTComponent *v7;
  double v8;
  double v9;
  double v10;
  AVTComponent *v11;
  void *v12;
  id v13;

  v4 = a4;
  v13 = a3;
  v6 = AVTPresetCategoryToComponentType(self->_category);
  if (-[NSArray count](self->_assets, "count") || self->_morphVariant || self->_imageVariant || self->_materialVariant)
  {
    v7 = [AVTComponent alloc];
    *(float *)&v8 = self->_morphVariantIntensity;
    *(float *)&v9 = self->_bodyPoseVariantIntensity;
    *(float *)&v10 = self->_textureAssetPresence;
    v11 = -[AVTComponent initWithType:assets:morphVariant:imageVariant:materialVariant:morphVariantIntensity:bodyPoseVariantIntensity:textureAssetPresence:](v7, "initWithType:assets:morphVariant:imageVariant:materialVariant:morphVariantIntensity:bodyPoseVariantIntensity:textureAssetPresence:", v6, self->_assets, self->_morphVariant, self->_imageVariant, self->_materialVariant, v8, v9, v10);
    objc_msgSend(v13, "addComponent:animated:", v11, v4);

  }
  else
  {
    v12 = v13;
    if ((v6 & 0x37) == 0x22)
      goto LABEL_7;
    objc_msgSend(v13, "removeComponentWithType:", v6);
  }
  v12 = v13;
LABEL_7:

}

- (id)cache
{
  AVTAssetResourceCache *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_assets)
  {
    v3 = objc_alloc_init(AVTAssetResourceCache);
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = self->_assets;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          -[AVTAssetResourceCache resourceForAsset:](v3, "resourceForAsset:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8), (_QWORD)v10);

          ++v8;
        }
        while (v6 != v8);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)rebuildSpecializationSettings
{
  NSDictionary *specializationSettings;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSDictionary *v9;
  void *v10;
  NSDictionary *v11;
  NSDictionary *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  specializationSettings = self->_specializationSettings;
  self->_specializationSettings = 0;

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_assets;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = self->_specializationSettings;
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "specializationSettings", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        AVTMergeSpecializationSettings(v9, v10);
        v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        v12 = self->_specializationSettings;
        self->_specializationSettings = v11;

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (NSDictionary)tags
{
  return self->_tags;
}

- (NSDictionary)specializationSettings
{
  return (NSDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (unint64_t)editableColorCount
{
  return self->_editableColorCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specializationSettings, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_presetSpecificPresetDependencies, 0);
  objc_storeStrong((id *)&self->_assetSpecificMaterialVariantDependencies, 0);
  objc_storeStrong((id *)&self->_assetSpecificImageVariantDependencies, 0);
  objc_storeStrong((id *)&self->_assetSpecificMorphVariantDependencies, 0);
  objc_storeStrong((id *)&self->_dependencies, 0);
  objc_storeStrong((id *)&self->_materialVariant, 0);
  objc_storeStrong((id *)&self->_imageVariant, 0);
  objc_storeStrong((id *)&self->_morphVariant, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
