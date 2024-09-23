@implementation AVTStickerProp

+ (id)stickerPropCache
{
  if (stickerPropCache_onceToken != -1)
    dispatch_once(&stickerPropCache_onceToken, &__block_literal_global_12);
  return (id)stickerPropCache_kCache;
}

void __34__AVTStickerProp_stickerPropCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)stickerPropCache_kCache;
  stickerPropCache_kCache = (uint64_t)v0;

}

+ (id)cacheKeyForSize:(CGSize)a3 position:(id)a4 rotation:(id)a5 scale:palettesDescriptions:filePath:
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  CGFloat height;
  CGFloat width;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  CGSize v23;

  v21 = v6;
  v22 = v7;
  v20 = v5;
  height = a3.height;
  width = a3.width;
  v11 = a5;
  objc_msgSend(a4, "componentsJoinedByString:", CFSTR(","));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v11, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "standardizedURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "absoluteString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0CB3940];
  v23.width = width;
  v23.height = height;
  NSStringFromCGSize(v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@.%@.%f%f%f.%f%f%f.%f%f%f.%@"), v15, v17, *(float *)&v20, *((float *)&v20 + 1), *((float *)&v20 + 2), *(float *)&v21, *((float *)&v21 + 1), *((float *)&v21 + 2), *(float *)&v22, *((float *)&v22 + 1), *((float *)&v22 + 2), v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (BOOL)getOrientToCameraInDictionary:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "objectForKey:", CFSTR("orientToCamera"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 1;

  return v5;
}

+ (BOOL)getRenderLastInDictionary:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "objectForKey:", CFSTR("renderLast"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 1;

  return v5;
}

+ (CGSize)getSizeInDictionary:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  float v6;
  double v7;
  void *v8;
  float v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  objc_msgSend(a3, "objectForKey:", CFSTR("size"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("width"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    v7 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("height"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    v10 = v9;

  }
  else
  {
    v7 = *MEMORY[0x1E0C9D820];
    v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v11 = v7;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

+ (__n128)getPositionInDictionary:(void *)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  __int128 v9;
  int v10;
  __int128 v11;
  unsigned int v12;
  int v14;
  __int128 v15;
  __int128 v16;

  objc_msgSend(a3, "objectForKey:", CFSTR("position"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("x"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "floatValue");
      *(_QWORD *)&v15 = v5;
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("y"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "floatValue");
      v14 = v7;
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("z"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "floatValue");
      v9 = v15;
      DWORD1(v9) = v14;
      DWORD2(v9) = v10;
      v16 = v9;

    }
    else
    {
      objc_msgSend(v3, "floatValue");
      *(_QWORD *)&v11 = 0;
      *((_QWORD *)&v11 + 1) = v12;
      v16 = v11;
    }
  }
  else
  {
    v16 = 0u;
  }

  return (__n128)v16;
}

+ (__n128)getRotationInDictionary:(void *)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  __int128 v9;
  int v10;
  __int128 v11;
  unsigned int v12;
  int v14;
  __int128 v15;
  __int128 v16;

  objc_msgSend(a3, "objectForKey:", CFSTR("rotation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("x"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "floatValue");
      *(_QWORD *)&v15 = v5;
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("y"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "floatValue");
      v14 = v7;
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("z"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "floatValue");
      v9 = v15;
      DWORD1(v9) = v14;
      DWORD2(v9) = v10;
      v16 = v9;

    }
    else
    {
      objc_msgSend(v3, "floatValue");
      *(_QWORD *)&v11 = 0;
      *((_QWORD *)&v11 + 1) = v12;
      v16 = v11;
    }
  }
  else
  {
    v16 = 0u;
  }

  return (__n128)v16;
}

+ (__n128)getScaleInDictionary:(void *)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  __int128 v9;
  int v10;
  uint64_t v16;
  int v17;
  __int128 v18;
  int v19;
  int v21;
  int v22;
  __int128 v23;
  __int128 v24;

  objc_msgSend(a3, "objectForKey:", CFSTR("scale"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("x"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "floatValue");
      *(_QWORD *)&v23 = v5;
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("y"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "floatValue");
      v21 = v7;
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("z"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "floatValue");
      v9 = v23;
      DWORD1(v9) = v21;
      DWORD2(v9) = v10;
      v24 = v9;

    }
    else
    {
      objc_msgSend(v3, "floatValue");
      *(_QWORD *)&v23 = v16;
      objc_msgSend(v3, "floatValue");
      v22 = v17;
      objc_msgSend(v3, "floatValue");
      v18 = v23;
      DWORD1(v18) = v22;
      DWORD2(v18) = v19;
      v24 = v18;
    }
  }
  else
  {
    __asm { FMOV            V0.4S, #1.0 }
    v24 = _Q0;
  }

  return (__n128)v24;
}

+ (id)adjustmentFromDictionary:(id)a3 presetCategory:(id)a4
{
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  AVTStickerPropAdjustTransformProperty *v12;
  double v14;
  double v15;
  double v16;

  v6 = a3;
  v7 = AVTPresetCategoryFromString(a4);
  objc_msgSend(a1, "getPositionInDictionary:", v6);
  v16 = v8;
  objc_msgSend(a1, "getRotationInDictionary:", v6);
  v15 = v9;
  objc_msgSend(a1, "getScaleInDictionary:", v6);
  v14 = v10;
  objc_msgSend(v6, "objectForKey:", CFSTR("value"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[AVTStickerPropAdjustTransformProperty initWithPresetCategory:presetValue:position:rotation:scale:]([AVTStickerPropAdjustTransformProperty alloc], "initWithPresetCategory:presetValue:position:rotation:scale:", v7, v11, v16, v15, v14);
  return v12;
}

+ (float)getOpacityInDictionary:(id)a3
{
  void *v3;
  float v4;
  float v5;

  objc_msgSend(a3, "objectForKey:", CFSTR("opacity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 1.0;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "floatValue");
      v4 = v5;
    }
  }

  return v4;
}

+ (id)propFromDictionary:(id)a3 assetsPath:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  float v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  AVTStickerImageProp *v43;
  AVTStickerImageProp *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  AVTStickerImageProp *v49;
  AVTStickerSceneProp *v50;
  void *v51;
  NSObject *v52;
  unsigned int v54;
  unsigned int v55;
  double v56;
  double v57;
  double v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  id v64;
  void *v65;
  uint64_t v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "getSizeInDictionary:", v6);
  v9 = v8;
  v11 = v10;
  objc_msgSend(a1, "getPositionInDictionary:", v6);
  v58 = v12;
  objc_msgSend(a1, "getRotationInDictionary:", v6);
  v57 = v13;
  objc_msgSend(a1, "getScaleInDictionary:", v6);
  v56 = v14;
  objc_msgSend(a1, "getOpacityInDictionary:", v6);
  v16 = v15;
  v54 = objc_msgSend(a1, "getOrientToCameraInDictionary:", v6);
  v55 = objc_msgSend(a1, "getRenderLastInDictionary:", v6);
  objc_msgSend(v6, "objectForKey:", CFSTR("palettes"));
  v59 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("adjustments"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v60 = v18;
  v65 = v7;
  v61 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v19 = v18;
    v66 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
    if (v66)
    {
      v20 = *(_QWORD *)v77;
      v62 = *(_QWORD *)v77;
      v64 = v19;
      do
      {
        for (i = 0; i != v66; ++i)
        {
          if (*(_QWORD *)v77 != v20)
            objc_enumerationMutation(v19);
          v22 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * i);
          objc_msgSend(v19, "objectForKey:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(a1, "adjustmentFromDictionary:presetCategory:", v23, v22);
            v24 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addObject:", v24);
          }
          else
          {
            v74 = 0u;
            v75 = 0u;
            v72 = 0u;
            v73 = 0u;
            v24 = v23;
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
            if (v25)
            {
              v26 = v25;
              v27 = *(_QWORD *)v73;
              do
              {
                for (j = 0; j != v26; ++j)
                {
                  if (*(_QWORD *)v73 != v27)
                    objc_enumerationMutation(v24);
                  objc_msgSend(a1, "adjustmentFromDictionary:presetCategory:", *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * j), v22);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "addObject:", v29);

                }
                v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
              }
              while (v26);
              v19 = v64;
              v7 = v65;
              v20 = v62;
            }
            else
            {
              v7 = v65;
            }
          }

        }
        v66 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
      }
      while (v66);
    }

    v6 = v61;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("shaders"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v69;
    do
    {
      for (k = 0; k != v33; ++k)
      {
        if (*(_QWORD *)v69 != v34)
          objc_enumerationMutation(v31);
        +[AVTStickerShaderModifier shaderModifierFromDictionary:assetsPath:](AVTStickerShaderModifier, "shaderModifierFromDictionary:assetsPath:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * k), v7);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
          objc_msgSend(v30, "addObject:", v36);

      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
    }
    while (v33);
  }
  objc_msgSend(a1, "stickerPropCache");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v61;
  objc_msgSend(v61, "objectForKey:", CFSTR("image"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    objc_msgSend(v65, "stringByAppendingPathComponent:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "stringByStandardizingPath");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = (void *)v59;
    objc_msgSend((id)objc_opt_class(), "cacheKeyForSize:position:rotation:scale:palettesDescriptions:filePath:", v59, v40, v9, v11, v58, v57, v56);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "objectForKey:", v42);
    v43 = (AVTStickerImageProp *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      v44 = v43;
      v45 = v38;
      if (v30)
      {
        -[AVTStickerProp cloneWithShaderModifiers:](v43, "cloneWithShaderModifiers:", v30);
        v46 = objc_claimAutoreleasedReturnValue();

        v44 = (AVTStickerImageProp *)v46;
      }
      v38 = v45;
      v41 = (void *)v59;
    }
    else
    {
      v44 = -[AVTStickerImageProp initWithImageAtPath:size:scale:position:renderLast:orientToCamera:rotation:palettesDescriptions:modifiers:adjustments:]([AVTStickerImageProp alloc], "initWithImageAtPath:size:scale:position:renderLast:orientToCamera:rotation:palettesDescriptions:modifiers:adjustments:", v40, v55, v54, v59, v30, v17, v9, v11, v56, v58, v57);
      -[AVTStickerProp setOriginalName:](v44, "setOriginalName:", v38);
      -[AVTStickerProp setOpacity:](v44, "setOpacity:", v16);
      objc_msgSend(v67, "setObject:forKey:", v44, v42);
    }
    goto LABEL_48;
  }
  objc_msgSend(v61, "objectForKey:", CFSTR("scene"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)v59;
  if (v40)
  {
    objc_msgSend(v65, "stringByAppendingPathComponent:", v40);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "stringByStandardizingPath");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "cacheKeyForSize:position:rotation:scale:palettesDescriptions:filePath:", v59, v42, v9, v11, v58, v57, v56);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "objectForKey:", v48);
    v49 = (AVTStickerImageProp *)objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      v44 = v49;
      if (!v30)
      {
LABEL_47:

LABEL_48:
        goto LABEL_49;
      }
      -[AVTStickerProp cloneWithShaderModifiers:](v49, "cloneWithShaderModifiers:", v30);
      v50 = (AVTStickerSceneProp *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v42, 0);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD5A10], "avt_rootNodeForSceneAtURL:options:error:");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = (AVTStickerImageProp *)0;
      if (v44)
      {
        avt_default_log();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          +[AVTStickerProp propFromDictionary:assetsPath:].cold.1((uint64_t)v42, v44, v52);

        v41 = (void *)v59;
      }
      v50 = -[AVTStickerSceneProp initWithRootNode:scale:position:rotation:renderLast:palettesDescriptions:modifiers:adjustments:]([AVTStickerSceneProp alloc], "initWithRootNode:scale:position:rotation:renderLast:palettesDescriptions:modifiers:adjustments:", v51, v55, v41, v30, v17, v56, v58, v57);
      -[AVTStickerProp setOriginalName:](v50, "setOriginalName:", v40);
      -[AVTStickerProp setOpacity:](v50, "setOpacity:", v16);
      objc_msgSend(v67, "setObject:forKey:", v50, v48);

    }
    v44 = (AVTStickerImageProp *)v50;
    v37 = v61;
    v41 = (void *)v59;
    goto LABEL_47;
  }
  v44 = 0;
LABEL_49:

  return v44;
}

+ (void)applyPalettesForAvatar:(id)a3 toNode:(id)a4 palettesDescriptions:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id obj;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v27 = a4;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = v7;
    v9 = v7;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v24 = v8;
    obj = v8;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v34;
      v13 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v34 != v12)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v15, "objectForKey:", CFSTR("material"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v30[0] = v13;
          v30[1] = 3221225472;
          v30[2] = __69__AVTStickerProp_applyPalettesForAvatar_toNode_palettesDescriptions___block_invoke;
          v30[3] = &unk_1EA61DAC8;
          v31 = v16;
          v32 = v17;
          v18 = v17;
          v19 = v16;
          objc_msgSend(v27, "enumerateHierarchyUsingBlock:", v30);
          objc_msgSend(v15, "objectForKey:", CFSTR("palette"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "colorPresetForCategory:", AVTColorCategoryFromString(v20));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "makeMaterial");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v28[0] = v13;
          v28[1] = 3221225472;
          v28[2] = __69__AVTStickerProp_applyPalettesForAvatar_toNode_palettesDescriptions___block_invoke_2;
          v28[3] = &unk_1EA61EC10;
          v29 = v22;
          v23 = v22;
          objc_msgSend(v18, "enumerateObjectsUsingBlock:", v28);

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v11);
    }

    v8 = v24;
    v7 = v25;
  }

}

void __69__AVTStickerProp_applyPalettesForAvatar_toNode_palettesDescriptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(a2, "geometry");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "materials");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v9, "name");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(a1 + 32));

          if (v11)
            objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v6);
    }

  }
  else
  {
    v12 = *(void **)(a1 + 40);
    objc_msgSend(a2, "geometry");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstMaterial");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v13);

  }
}

uint64_t __69__AVTStickerProp_applyPalettesForAvatar_toNode_palettesDescriptions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyToSceneKitMaterial:", a2);
}

- (AVTStickerProp)initWithSize:(CGSize)a3 scale:(BOOL)a4 position:(BOOL)a5 renderLast:(id)a6 orientToCamera:(id)a7 rotation:(id)a8 palettesDescriptions:shaderModifiers:adjustments:
{
  __int128 v8;
  __int128 v9;
  __int128 v10;
  CGFloat height;
  CGFloat width;
  id v19;
  id v20;
  id v21;
  AVTStickerProp *v22;
  AVTStickerProp *v23;
  uint64_t v24;
  NSArray *shaderModifiers;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;

  v28 = v9;
  v29 = v10;
  v27 = v8;
  height = a3.height;
  width = a3.width;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v30.receiver = self;
  v30.super_class = (Class)AVTStickerProp;
  v22 = -[AVTStickerProp init](&v30, sel_init);
  v23 = v22;
  if (v22)
  {
    v22->_size.width = width;
    v22->_size.height = height;
    *(_OWORD *)v22->_position = v28;
    *(_OWORD *)v22->_scale = v27;
    v22->_opacity = 1.0;
    v22->_renderLast = a4;
    v22->_orientToCamera = a5;
    *(_OWORD *)v22->_rotation = v29;
    objc_storeStrong((id *)&v22->_palettesDescriptions, a6);
    v24 = objc_msgSend(v20, "copy");
    shaderModifiers = v23->_shaderModifiers;
    v23->_shaderModifiers = (NSArray *)v24;

    objc_storeStrong((id *)&v23->_adjustments, a8);
  }

  return v23;
}

- (void)setPosition:(AVTStickerProp *)self
{
  __int128 v2;

  *(_OWORD *)self->_position = v2;
  -[AVTStickerProp setNode:](self, "setNode:", 0);
}

- (void)setScale:(AVTStickerProp *)self
{
  __int128 v2;

  *(_OWORD *)self->_scale = v2;
  -[AVTStickerProp setNode:](self, "setNode:", 0);
}

- (void)setRotation:(AVTStickerProp *)self
{
  __int128 v2;

  *(_OWORD *)self->_rotation = v2;
  -[AVTStickerProp setNode:](self, "setNode:", 0);
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
  -[AVTStickerProp setNode:](self, "setNode:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  AVTStickerProp *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL8 v11;
  _BOOL8 v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  AVTStickerProp *v17;
  double v19;
  double v20;
  double v21;

  v4 = [AVTStickerProp alloc];
  -[AVTStickerProp size](self, "size");
  v6 = v5;
  v8 = v7;
  -[AVTStickerProp scale](self, "scale");
  v21 = v9;
  -[AVTStickerProp position](self, "position");
  v20 = v10;
  v11 = -[AVTStickerProp renderLast](self, "renderLast");
  v12 = -[AVTStickerProp orientToCamera](self, "orientToCamera");
  -[AVTStickerProp rotation](self, "rotation");
  v19 = v13;
  -[AVTStickerProp palettesDescriptions](self, "palettesDescriptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerProp shaderModifiers](self, "shaderModifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerProp adjustments](self, "adjustments");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[AVTStickerProp initWithSize:scale:position:renderLast:orientToCamera:rotation:palettesDescriptions:shaderModifiers:adjustments:](v4, "initWithSize:scale:position:renderLast:orientToCamera:rotation:palettesDescriptions:shaderModifiers:adjustments:", v11, v12, v14, v15, v16, v6, v8, v21, v20, v19);

  return v17;
}

- (id)cloneWithShaderModifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)-[AVTStickerProp copy](self, "copy");
  -[AVTStickerProp node](self, "node");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNode:", v6);

  objc_msgSend(v5, "setShaderModifiers:", v4);
  return v5;
}

- (void)setNode:(id)a3
{
  void *v5;
  uint64_t v6;
  SCNNode *v7;

  v7 = (SCNNode *)a3;
  if (self->_node != v7)
  {
    -[AVTStickerProp nodeName](self, "nodeName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCNNode setName:](v7, "setName:", v5);

    if (-[AVTStickerProp renderLast](self, "renderLast"))
      v6 = 100;
    else
      v6 = 0;
    -[SCNNode setRenderingOrder:](v7, "setRenderingOrder:", v6);
    objc_storeStrong((id *)&self->_node, a3);
  }

}

- (NSString)identifier
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[AVTStickerProp originalName](self, "originalName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)nodeName
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[AVTStickerProp hash](self, "hash"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)displayName
{
  void *v2;
  void *v3;
  void *v4;

  -[AVTStickerProp originalName](self, "originalName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByDeletingPathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)applyCamera:(id)a3 toNode:(id)a4 distToHead:(double)a5
{
  id v8;
  id v9;
  _BOOL4 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  float v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  unsigned int v23;
  unsigned int v24;
  float64x2_t v25;
  float64x2_t v26;
  unsigned int v32;
  double v33;
  _OWORD v34[4];
  _BYTE v35[64];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;

  v8 = a3;
  v9 = a4;
  v10 = -[AVTStickerProp orientToCamera](self, "orientToCamera");
  if (v8 && v9 && v10)
  {
    objc_msgSend(v9, "simdPosition");
    objc_msgSend(v9, "setSimdPosition:", v11);
    -[AVTStickerProp size](self, "size");
    v12 = 1.0;
    if (v13 > 0.0)
    {
      -[AVTStickerProp size](self, "size");
      v15 = v14;
      -[AVTStickerProp size](self, "size");
      v12 = v15 / v16;
    }
    -[AVTStickerProp position](self, "position");
    v18 = (v17 - a5) * -2.0;
    objc_msgSend(v8, "camera");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fieldOfView");
    *(float *)&v20 = v20 * 3.14159265 * 0.5 / 180.0;
    v21 = tanf(*(float *)&v20);

    objc_msgSend(v9, "geometry");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setWidth:");
    objc_msgSend(v22, "setHeight:", v18 * v21);
    objc_msgSend(v9, "simdPosition");
    v32 = v23;
    objc_msgSend(v9, "simdPosition");
    v25.f64[0] = v12 * (v18 * v21);
    v25.f64[1] = v18 * v21;
    v26 = vmulq_f64(v25, vcvtq_f64_f32((float32x2_t)__PAIR64__(v24, v32)));
    __asm { FMOV            V1.2D, #0.5 }
    v33 = COERCE_DOUBLE(vcvt_f32_f64(vmulq_f64(v26, _Q1)));
    objc_msgSend(v9, "simdPosition");
    objc_msgSend(v9, "setSimdPosition:", v33);
    objc_msgSend(v9, "transform");
    objc_msgSend(v8, "convertTransform:toNode:", v35, 0);
    v34[0] = v36;
    v34[1] = v37;
    v34[2] = v38;
    v34[3] = v39;
    objc_msgSend(v9, "setTransform:", v34);

  }
}

- (void)buildNodeForAvatar:(id)a3 withCamera:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  void (**v7)(id, id);
  void *v8;
  id v9;

  v7 = (void (**)(id, id))a6;
  -[AVTStickerProp node](self, "node");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  AVTCloneNodesAndMaterials(v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v7[2](v7, v9);
}

- (BOOL)wantsTimedUpdates
{
  return 0;
}

- (id)dictionaryWithTargetPath:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  float32x4_t v17;
  uint32x4_t v18;
  __n128 v19;
  void *v20;
  void *v21;
  float32x4_t v22;
  uint32x4_t v23;
  __n128 v24;
  void *v25;
  float32x4_t v26;
  uint32x4_t v27;
  __n128 v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  NSArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _QWORD v47[2];
  _QWORD v48[3];

  v48[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerProp size](self, "size");
  if (v7 != *MEMORY[0x1E0C9D820] || v6 != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v47[0] = CFSTR("width");
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[AVTStickerProp size](self, "size");
    *(float *)&v10 = v10;
    objc_msgSend(v9, "numberWithFloat:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = CFSTR("height");
    v48[0] = v11;
    v12 = (void *)MEMORY[0x1E0CB37E8];
    -[AVTStickerProp size](self, "size");
    *(float *)&v14 = v13;
    objc_msgSend(v12, "numberWithFloat:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v48[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("size"));

  }
  -[AVTStickerProp position](self, "position");
  v18 = (uint32x4_t)vceqzq_f32(v17);
  v18.i32[3] = v18.i32[2];
  if ((vminvq_u32(v18) & 0x80000000) == 0)
  {
    -[AVTStickerProp position](self, "position");
    plistWithVector(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("position"));

  }
  if (!-[AVTStickerProp orientToCamera](self, "orientToCamera"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AVTStickerProp orientToCamera](self, "orientToCamera"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("orientToCamera"));

  }
  -[AVTStickerProp rotation](self, "rotation");
  v23 = (uint32x4_t)vceqzq_f32(v22);
  v23.i32[3] = v23.i32[2];
  if ((vminvq_u32(v23) & 0x80000000) == 0)
  {
    -[AVTStickerProp rotation](self, "rotation");
    plistWithVector(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, CFSTR("rotation"));

  }
  -[AVTStickerProp scale](self, "scale");
  v27 = (uint32x4_t)vceqq_f32(v26, (float32x4_t)xmmword_1DD26A060);
  v27.i32[3] = v27.i32[2];
  if ((vminvq_u32(v27) & 0x80000000) == 0)
  {
    -[AVTStickerProp scale](self, "scale");
    plistWithVector(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, CFSTR("scale"));

  }
  -[AVTStickerProp opacity](self, "opacity");
  if (v30 != 1.0)
  {
    -[AVTStickerProp opacity](self, "opacity");
    numberFromDouble(v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v32, CFSTR("opacity"));

  }
  if (!-[AVTStickerProp renderLast](self, "renderLast"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AVTStickerProp renderLast](self, "renderLast"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v33, CFSTR("renderLast"));

  }
  if (-[NSArray count](self->_shaderModifiers, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v35 = self->_shaderModifiers;
    v36 = -[NSArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v37; ++i)
        {
          if (*(_QWORD *)v43 != v38)
            objc_enumerationMutation(v35);
          objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "dictionaryWithTargetPath:", v4, (_QWORD)v42);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "addObject:", v40);

        }
        v37 = -[NSArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v37);
    }

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v34, CFSTR("shaders"));
  }
  if (-[NSArray count](self->_palettesDescriptions, "count", (_QWORD)v42))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_palettesDescriptions, CFSTR("palettes"));

  return v5;
}

- (SCNNode)node
{
  return self->_node;
}

- (NSString)originalName
{
  return self->_originalName;
}

- (void)setOriginalName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)orientToCamera
{
  return self->_orientToCamera;
}

- (BOOL)renderLast
{
  return self->_renderLast;
}

- (NSArray)palettesDescriptions
{
  return self->_palettesDescriptions;
}

- (NSArray)shaderModifiers
{
  return self->_shaderModifiers;
}

- (void)setShaderModifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)adjustments
{
  return self->_adjustments;
}

- (__n128)position
{
  return a1[5];
}

- (__n128)scale
{
  return a1[6];
}

- (__n128)rotation
{
  return a1[7];
}

- (double)opacity
{
  return self->_opacity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjustments, 0);
  objc_storeStrong((id *)&self->_shaderModifiers, 0);
  objc_storeStrong((id *)&self->_palettesDescriptions, 0);
  objc_storeStrong((id *)&self->_originalName, 0);
  objc_storeStrong((id *)&self->_node, 0);
}

+ (void)propFromDictionary:(NSObject *)a3 assetsPath:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1DD1FA000, a3, OS_LOG_TYPE_ERROR, "Error: could not load sticker scene prop at %@ with error: %@", (uint8_t *)&v6, 0x16u);

}

@end
