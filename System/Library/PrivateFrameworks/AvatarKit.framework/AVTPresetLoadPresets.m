@implementation AVTPresetLoadPresets

void ____AVTPresetLoadPresets_block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[6];

  v8 = a3;
  v4 = AVTPresetCategoryFromString(a2);
  v5 = AVTPresetCategoryToComponentType(v4);
  if (!gPresets[v4])
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = gPresets[v4];
    gPresets[v4] = v6;

  }
  if (v4 != 40)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = ____AVTPresetLoadPresets_block_invoke_2;
    v9[3] = &__block_descriptor_48_e29_v32__0__NSDictionary_8Q16_B24l;
    v9[4] = v4;
    v9[5] = v5;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);
  }

}

void ____AVTPresetLoadPresets_block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  AVTPreset *v6;
  uint64_t v7;
  NSString *identifier;
  uint64_t v9;
  NSString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *assets;
  NSObject *v15;
  void *v16;
  void *v17;
  NSArray *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  unint64_t editableColorCount;
  unint64_t v28;
  unint64_t v29;
  NSObject *v30;
  NSArray *v31;
  uint64_t v32;
  NSString *morphVariant;
  uint64_t v34;
  NSString *imageVariant;
  uint64_t v36;
  NSString *materialVariant;
  void *v38;
  void *v39;
  float v40;
  void *v41;
  void *v42;
  float v43;
  void *v44;
  void *v45;
  float v46;
  uint64_t v47;
  NSDictionary *tags;
  void *v49;
  id v50;
  void *v51;
  AVTPreset *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t v57[128];
  uint8_t buf[4];
  void *v59;
  _QWORD v60[4];

  v60[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_alloc_init(AVTPreset);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v7 = objc_claimAutoreleasedReturnValue();
  identifier = v6->_identifier;
  v6->_identifier = (NSString *)v7;

  if (!v6->_identifier)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("preset %d"), a3);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v6->_identifier;
    v6->_identifier = (NSString *)v9;

  }
  v6->_category = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("asset"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v51 && (objc_msgSend(v51, "isEqualToString:", CFSTR("none")) & 1) == 0)
  {
    +[AVTAssetLibrary sharedAssetLibrary](AVTAssetLibrary, "sharedAssetLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "assetWithType:identifier:", *(_QWORD *)(a1 + 40), v51);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v60[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 1);
      v13 = objc_claimAutoreleasedReturnValue();
      assets = v6->_assets;
      v6->_assets = (NSArray *)v13;

      v6->_editableColorCount = objc_msgSend(v12, "editableColorCount");
      -[AVTPreset rebuildSpecializationSettings](v6, "rebuildSpecializationSettings");
    }
    else
    {
      avt_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v59 = v51;
        _os_log_impl(&dword_1DD1FA000, v15, OS_LOG_TYPE_DEFAULT, "failed to find asset named %@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("assets"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16 && objc_msgSend(v16, "count"))
  {
    v52 = v6;
    v50 = v5;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v17, "count"));
    v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v49 = v17;
    v19 = v17;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v54 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
          +[AVTAssetLibrary sharedAssetLibrary](AVTAssetLibrary, "sharedAssetLibrary");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "assetWithType:identifier:", *(_QWORD *)(a1 + 40), v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
          {
            editableColorCount = v52->_editableColorCount;
            v28 = objc_msgSend(v26, "editableColorCount");
            if (editableColorCount <= v28)
              v29 = v28;
            else
              v29 = editableColorCount;
            v52->_editableColorCount = v29;
            -[NSArray addObject:](v18, "addObject:", v26);
          }
          else
          {
            avt_default_log();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v59 = v51;
              _os_log_impl(&dword_1DD1FA000, v30, OS_LOG_TYPE_DEFAULT, "failed to find asset named %@", buf, 0xCu);
            }

          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
      }
      while (v21);
    }

    v6 = v52;
    v31 = v52->_assets;
    v52->_assets = v18;

    -[AVTPreset rebuildSpecializationSettings](v52, "rebuildSpecializationSettings");
    v17 = v49;
    v5 = v50;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("morphVariant"));
  v32 = objc_claimAutoreleasedReturnValue();
  morphVariant = v6->_morphVariant;
  v6->_morphVariant = (NSString *)v32;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("imageVariant"));
  v34 = objc_claimAutoreleasedReturnValue();
  imageVariant = v6->_imageVariant;
  v6->_imageVariant = (NSString *)v34;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("materialVariant"));
  v36 = objc_claimAutoreleasedReturnValue();
  materialVariant = v6->_materialVariant;
  v6->_materialVariant = (NSString *)v36;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("morphVariantIntensity"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (v38)
    objc_msgSend(v38, "floatValue");
  else
    v40 = 1.0;
  v6->_morphVariantIntensity = v40;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bodyPoseVariantIntensity"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41;
  if (v41)
    objc_msgSend(v41, "floatValue");
  else
    v43 = 0.0;
  v6->_bodyPoseVariantIntensity = v43;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("textureAssetPresence"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v44;
  if (v44)
    objc_msgSend(v44, "floatValue");
  else
    v46 = 1.0;
  v6->_textureAssetPresence = v46;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tags"));
  v47 = objc_claimAutoreleasedReturnValue();
  tags = v6->_tags;
  v6->_tags = (NSDictionary *)v47;

  objc_msgSend(gPresets[*(_QWORD *)(a1 + 32)], "addObject:", v6);
}

void ____AVTPresetLoadPresets_block_invoke_270(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  _QWORD v6[5];

  v5 = a3;
  v4 = AVTPresetCategoryFromString(a2);
  if (v4 != 40)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = ____AVTPresetLoadPresets_block_invoke_2_272;
    v6[3] = &__block_descriptor_40_e29_v32__0__NSDictionary_8Q16_B24l;
    v6[4] = v4;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);
  }

}

void ____AVTPresetLoadPresets_block_invoke_2_272(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  id v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v4 = gPresets[*(_QWORD *)(a1 + 32)];
  v5 = a2;
  objc_msgSend(v4, "objectAtIndex:", a3);
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("variantDependencies-morph"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v6[11];
  v6[11] = v7;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("variantDependencies-image"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v6[12];
  v6[12] = v9;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("variantDependencies-material"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v6[13];
  v6[13] = v11;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dependencies"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = ____AVTPresetLoadPresets_block_invoke_3;
  v15[3] = &unk_1EA61F070;
  v16 = v6;
  v13 = v6;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v15);

}

void ____AVTPresetLoadPresets_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[2];
  void (*v33)(_QWORD *, void *);
  void *v34;
  NSObject *v35;
  id v36;
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = AVTPresetCategoryFromString(v5);
  if (v7 == 40)
  {
    avt_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      ____AVTPresetLoadPresets_block_invoke_3_cold_1((uint64_t)v5, v8, v9, v10, v11, v12, v13, v14);
  }
  else
  {
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v33 = ____AVTPresetLoadPresets_block_invoke_281;
    v34 = &unk_1EA61F998;
    v37 = v7;
    v35 = *(id *)(a1 + 32);
    v15 = v5;
    v36 = v15;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      ____AVTPresetLoadPresets_block_invoke_281(v32, v6);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = v6;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v29;
          do
          {
            v20 = 0;
            do
            {
              if (*(_QWORD *)v29 != v19)
                objc_enumerationMutation(v16);
              v33(v32, *(void **)(*((_QWORD *)&v28 + 1) + 8 * v20++));
            }
            while (v18 != v20);
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
          }
          while (v18);
        }

      }
      else
      {
        avt_default_log();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          ____AVTPresetLoadPresets_block_invoke_3_cold_2((uint64_t)v15, v21, v22, v23, v24, v25, v26, v27);

      }
    }

    v8 = v35;
  }

}

void ____AVTPresetLoadPresets_block_invoke_281(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  float v28;
  float v29;
  AVTPresetDependency *v30;
  float *v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("preset"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v5 = gPresets[a1[6]];
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v42;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v42 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v9);
        objc_msgSend(v10, "identifier", (_QWORD)v41);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if ((v12 & 1) != 0)
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
          if (v7)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v13 = v10;

      if (v13)
        goto LABEL_16;
    }
    else
    {
LABEL_10:

    }
    avt_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      ____AVTPresetLoadPresets_block_invoke_281_cold_2(v14, v15, v16, v17, v18, v19, v20, v21);

  }
  v13 = 0;
LABEL_16:
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("morphVariant"), (_QWORD)v41);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("imageVariant"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("materialVariant"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("visibilityVariant"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("morphVariantIntensity"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
  {
    objc_msgSend(v26, "floatValue");
    v29 = v28;
    if (v13)
      goto LABEL_24;
LABEL_20:
    if (!v22 && !v23 && !v24 && !v25)
      goto LABEL_29;
    goto LABEL_24;
  }
  v29 = 1.0;
  if (!v13)
    goto LABEL_20;
LABEL_24:
  v30 = objc_alloc_init(AVTPresetDependency);
  v31 = (float *)v30;
  if (v30)
  {
    v30->_category = a1[6];
    -[AVTPhysicsRig setChainRoot:]((uint64_t)v30, v13);
    -[AVTPhysicsRig setPhysicsBody:]((uint64_t)v31, v22);
    v31[2] = v29;
  }
  else
  {
    -[AVTPhysicsRig setChainRoot:](0, v13);
    -[AVTPhysicsRig setPhysicsBody:](0, v22);
  }
  -[AVTPhysicsRig setPhysicsBehavior:]((uint64_t)v31, v23);
  -[AVTPresetDependency setMaterialVariant:]((uint64_t)v31, v24);
  -[AVTPresetDependency setVisibilityRules:]((uint64_t)v31, v25);
  v32 = *(void **)(a1[4] + 80);
  if (!v32)
  {
    v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v34 = a1[4];
    v35 = *(void **)(v34 + 80);
    *(_QWORD *)(v34 + 80) = v33;

    v32 = *(void **)(a1[4] + 80);
  }
  objc_msgSend(v32, "addObject:", v31);

LABEL_29:
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("preset-per-identifier"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = *(void **)(a1[4] + 112);
    if (!v37)
    {
      v38 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v39 = a1[4];
      v40 = *(void **)(v39 + 112);
      *(_QWORD *)(v39 + 112) = v38;

      v37 = *(void **)(a1[4] + 112);
    }
    objc_msgSend(v37, "objectForKeyedSubscript:", a1[5]);
    if (objc_claimAutoreleasedReturnValue())
      ____AVTPresetLoadPresets_block_invoke_281_cold_1();
    objc_msgSend(*(id *)(a1[4] + 112), "setObject:forKeyedSubscript:", v36, a1[5]);
  }

}

void ____AVTPresetLoadPresets_block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD1FA000, a2, a3, "Error: error in preset dependency: can't convert \"%@\" to a category", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void ____AVTPresetLoadPresets_block_invoke_3_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD1FA000, a2, a3, "Error: error in preset dependency: value for %@ is not a dictionary", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void ____AVTPresetLoadPresets_block_invoke_281_cold_1()
{
  __assert_rtn("__AVTPresetLoadPresets_block_invoke", "AVTPreset.m", 731, "preset->_presetSpecificPresetDependencies[dependencyCategoryString] == nil");
}

void ____AVTPresetLoadPresets_block_invoke_281_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0();
}

@end
