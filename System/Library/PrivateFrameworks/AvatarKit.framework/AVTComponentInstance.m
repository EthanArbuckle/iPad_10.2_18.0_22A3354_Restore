@implementation AVTComponentInstance

- (id)assetImageWithLayerNamed:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_layers, "objectForKeyedSubscript:", a3);
}

- ($562F4F2D9DF7D474E0F2587276617CA9)uvRemappingInfo
{
  uint64_t v2;
  uint64_t v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  $562F4F2D9DF7D474E0F2587276617CA9 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = v2;
  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_assets;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "is2DAsset", (_QWORD)v11))
        {
          if (v9)
          {
            objc_msgSend(v9, "uvRemappingInfo");
          }
          else
          {
            *(_OWORD *)v3 = 0u;
            *(_OWORD *)(v3 + 16) = 0u;
          }

          return v10;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }

  *(_BYTE *)v3 = 0;
  *(_QWORD *)(v3 + 8) = 1065353216;
  *(_QWORD *)(v3 + 16) = 0x3F80000000000000;
  *(_QWORD *)(v3 + 24) = 0;
  return v10;
}

- (AVTComponentInstance)initWithComponent:(id)a3 assetResourceCache:(id)a4
{
  id v6;
  id v7;
  AVTComponentInstance *v8;
  void *v9;
  uint64_t v10;
  NSArray *assets;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  NSDictionary *layers;
  uint64_t v20;
  NSObject *assetImage;
  uint64_t v22;
  uint64_t v23;
  SCNNode *assetNode;
  uint64_t v25;
  SCNNode *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  _BYTE v41[128];
  uint8_t v42[4];
  uint64_t v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v40.receiver = self;
  v40.super_class = (Class)AVTComponentInstance;
  v8 = -[AVTComponentInstance init](&v40, sel_init);
  if (!v8)
    goto LABEL_30;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assets");
  v10 = objc_claimAutoreleasedReturnValue();
  assets = v8->_assets;
  v8->_assets = (NSArray *)v10;

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v12 = v8->_assets;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (!v13)
    goto LABEL_17;
  v14 = v13;
  v15 = *(_QWORD *)v37;
  do
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v37 != v15)
        objc_enumerationMutation(v12);
      v17 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
      objc_msgSend(v17, "layers");
      v18 = objc_claimAutoreleasedReturnValue();
      layers = v8->_layers;
      v8->_layers = (NSDictionary *)v18;

      if (objc_msgSend(v17, "is3DAsset"))
      {
        objc_msgSend(v7, "resourceForAsset:", v17);
        v20 = objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          assetImage = v20;
          objc_msgSend(v9, "addObject:", v20);
        }
        else
        {
          avt_default_log();
          assetImage = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(assetImage, OS_LOG_TYPE_ERROR))
            -[AVTComponentInstance initWithComponent:assetResourceCache:].cold.1(v42, &v43, assetImage);
        }
      }
      else
      {
        if (!objc_msgSend(v17, "is2DAsset"))
          continue;
        objc_msgSend(v7, "resourceForAsset:", v17);
        v22 = objc_claimAutoreleasedReturnValue();
        assetImage = v8->_assetImage;
        v8->_assetImage = (NSString *)v22;
      }

    }
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  }
  while (v14);
LABEL_17:

  if (objc_msgSend(v9, "count") == 1)
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v23 = objc_claimAutoreleasedReturnValue();
    assetNode = v8->_assetNode;
    v8->_assetNode = (SCNNode *)v23;
  }
  else if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CD59D0], "node");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v8->_assetNode;
    v8->_assetNode = (SCNNode *)v25;

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    assetNode = v9;
    v27 = -[SCNNode countByEnumeratingWithState:objects:count:](assetNode, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v33 != v29)
            objc_enumerationMutation(assetNode);
          -[SCNNode addChildNode:](v8->_assetNode, "addChildNode:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j), (_QWORD)v32);
        }
        v28 = -[SCNNode countByEnumeratingWithState:objects:count:](assetNode, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      }
      while (v28);
    }
  }
  else
  {
    assetNode = v8->_assetNode;
    v8->_assetNode = 0;
  }

LABEL_30:
  return v8;
}

- (void)updateMaterialsWithComponent:(id)a3
{
  id v4;
  SCNNode *assetNode;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  assetNode = self->_assetNode;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__AVTComponentInstance_updateMaterialsWithComponent___block_invoke;
  v7[3] = &unk_1EA61D7A8;
  v8 = v4;
  v6 = v4;
  -[SCNNode enumerateHierarchyUsingBlock:](assetNode, "enumerateHierarchyUsingBlock:", v7);

}

void __53__AVTComponentInstance_updateMaterialsWithComponent___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  int *v31;
  uint64_t v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[4];
  uint64_t v39;
  uint8_t v40[4];
  uint64_t v41;
  uint8_t v42[4];
  int v43;
  uint8_t v44[4];
  uint64_t v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(a2, "geometry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "materials");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v35;
    v31 = &v43;
    v32 = a1;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v35 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v9, "name", v31);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "hasPrefix:", CFSTR("color"));

        if (v11)
        {
          objc_msgSend(v9, "name");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "rangeOfString:", CFSTR("_variant_"));
          if (v13 != 0x7FFFFFFFFFFFFFFFLL
            || (v13 = objc_msgSend(v12, "rangeOfString:", CFSTR("_alias_")), v13 != 0x7FFFFFFFFFFFFFFFLL))
          {
            objc_msgSend(v12, "substringToIndex:", v13);
            v14 = objc_claimAutoreleasedReturnValue();

            v12 = (void *)v14;
          }
          objc_msgSend(v12, "substringFromIndex:", 5);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "intValue");

          if (v16)
          {
            v17 = v16 - 1;
            objc_msgSend(*(id *)(a1 + 32), "materialAtIndex:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v18)
            {
              avt_default_log();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                __53__AVTComponentInstance_updateMaterialsWithComponent___block_invoke_cold_1(v44, &v45, v19);

            }
            objc_msgSend(v18, "applyToSceneKitMaterial:", v9);
            objc_msgSend(v9, "customMaterialAttributeNames");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v20;
            if (v16 != 1)
            {
              if (objc_msgSend(v20, "containsObject:", CFSTR("primary_color")))
              {
                objc_msgSend(*(id *)(a1 + 32), "materialAtIndex:", 0);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v22)
                {
                  avt_default_log();
                  v23 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                    __53__AVTComponentInstance_updateMaterialsWithComponent___block_invoke_cold_1(v42, v31, v23);

                }
                objc_msgSend(v22, "baseColor");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "setValue:forKey:", v24, CFSTR("primary_color"));

                a1 = v32;
              }
              if (v17 == 1)
                goto LABEL_43;
            }
            if (objc_msgSend(v21, "containsObject:", CFSTR("secondary_color")))
            {
              objc_msgSend(*(id *)(a1 + 32), "materialAtIndex:", 1);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v25)
              {
                avt_default_log();
                v26 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                  __53__AVTComponentInstance_updateMaterialsWithComponent___block_invoke_cold_1(v40, &v41, v26);

              }
              objc_msgSend(v25, "baseColor");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "setValue:forKey:", v27, CFSTR("secondary_color"));

              a1 = v32;
            }
            if (v17 != 2)
            {
LABEL_43:
              if (objc_msgSend(v21, "containsObject:", CFSTR("tertiary_color")))
              {
                objc_msgSend(*(id *)(a1 + 32), "materialAtIndex:", 2);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v28)
                {
                  avt_default_log();
                  v29 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                    __53__AVTComponentInstance_updateMaterialsWithComponent___block_invoke_cold_1(v38, &v39, v29);

                }
                objc_msgSend(v28, "baseColor");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "setValue:forKey:", v30, CFSTR("tertiary_color"));

              }
            }

          }
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    }
    while (v6);
  }

}

- (BOOL)has2DAsset
{
  return self->_assetImage != 0;
}

- (NSString)assetImage
{
  NSString *assetImageVariant;

  assetImageVariant = self->_assetImageVariant;
  if (!assetImageVariant)
    assetImageVariant = self->_assetImage;
  return assetImageVariant;
}

- (void)setImageVariant:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *assetImageVariant;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    -[NSString stringByDeletingLastPathComponent](self->_assetImage, "stringByDeletingLastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", v5);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  assetImageVariant = self->_assetImageVariant;
  self->_assetImageVariant = v7;

}

- (void)setMaterialVariant:(id)a3
{
  unint64_t v5;
  NSString *materialVariant;
  BOOL v7;
  SCNNode *assetNode;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = (unint64_t)a3;
  if (self->_assetNode)
  {
    materialVariant = self->_materialVariant;
    if (v5 | (unint64_t)materialVariant)
    {
      v9 = (id)v5;
      v7 = -[NSString isEqualToString:](materialVariant, "isEqualToString:", v5);
      v5 = (unint64_t)v9;
      if (!v7)
      {
        objc_storeStrong((id *)&self->_materialVariant, a3);
        assetNode = self->_assetNode;
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __43__AVTComponentInstance_setMaterialVariant___block_invoke;
        v10[3] = &unk_1EA61D7A8;
        v11 = v9;
        -[SCNNode enumerateHierarchyUsingBlock:](assetNode, "enumerateHierarchyUsingBlock:", v10);

        v5 = (unint64_t)v9;
      }
    }
  }

}

void __43__AVTComponentInstance_setMaterialVariant___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "geometry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "materials");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") != 1)
    {
      v21 = v4;
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v20 = v5;
      v6 = v5;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v7)
      {
        v8 = v7;
        v9 = 0;
        v10 = *(_QWORD *)v27;
        v22 = a1;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v27 != v10)
              objc_enumerationMutation(v6);
            v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v11);
            objc_msgSend(v12, "name");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "componentsSeparatedByString:", CFSTR("_variant_"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v14, "firstObject");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if ((unint64_t)objc_msgSend(v14, "count") >= 2
              && (objc_msgSend(v14, "lastObject"), (v16 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
            {
              v17 = v16;
              if (objc_msgSend(v16, "isEqualToString:", *(_QWORD *)(a1 + 32)))
              {
                objc_msgSend(v23, "insertObject:atIndex:", v12, v9++);
                a1 = v22;
              }
              else
              {
                objc_msgSend(v23, "addObject:", v12);
              }
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_variant_%@"), v15, *(_QWORD *)(a1 + 32));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v24[0] = MEMORY[0x1E0C809B0];
              v24[1] = 3221225472;
              v24[2] = __43__AVTComponentInstance_setMaterialVariant___block_invoke_2;
              v24[3] = &unk_1EA61E9C0;
              v25 = v18;
              v17 = v18;
              if (objc_msgSend(v6, "indexOfObjectPassingTest:", v24) == 0x7FFFFFFFFFFFFFFFLL)
              {
                objc_msgSend(v23, "insertObject:atIndex:", v12, v9++);
                a1 = v22;
              }
              else
              {
                objc_msgSend(v23, "addObject:", v12);
              }

            }
            ++v11;
          }
          while (v8 != v11);
          v19 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          v8 = v19;
        }
        while (v19);
      }

      v4 = v21;
      objc_msgSend(v21, "setMaterials:", v23);

      v5 = v20;
    }

  }
}

uint64_t __43__AVTComponentInstance_setMaterialVariant___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)_initializeVariantSkinnerPairsIfNeeded
{
  SCNNode *assetNode;
  NSMapTable *obj;
  _QWORD v5[5];

  if (!self->_didInitializeVariantSkinnerPairs)
  {
    obj = self->_variantSkinnerPairs;
    objc_sync_enter(obj);
    if (!self->_didInitializeVariantSkinnerPairs)
    {
      assetNode = self->_assetNode;
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __62__AVTComponentInstance__initializeVariantSkinnerPairsIfNeeded__block_invoke;
      v5[3] = &unk_1EA61D7A8;
      v5[4] = self;
      -[SCNNode enumerateHierarchyUsingBlock:](assetNode, "enumerateHierarchyUsingBlock:", v5, obj);
      self->_didInitializeVariantSkinnerPairs = 1;
    }
    objc_sync_exit(obj);

  }
}

void __62__AVTComponentInstance__initializeVariantSkinnerPairsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v9 = a2;
  objc_msgSend(v9, "valueForUndefinedKey:", CFSTR("skinnerVariant"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56))
    {
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 512, 0);
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 56);
      *(_QWORD *)(v5 + 56) = v4;

    }
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __62__AVTComponentInstance__initializeVariantSkinnerPairsIfNeeded__block_invoke_2;
    v10[3] = &unk_1EA61E9E8;
    v7 = v9;
    v8 = *(_QWORD *)(a1 + 32);
    v11 = v7;
    v12 = v8;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v10);

  }
}

void __62__AVTComponentInstance__initializeVariantSkinnerPairsIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  AVTSkinnerVariantPair *v21;
  _OWORD v22[4];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "childNodeWithName:recursively:", a2, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    avt_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __62__AVTComponentInstance__initializeVariantSkinnerPairsIfNeeded__block_invoke_2_cold_2(v7, v8, v9);

  }
  objc_msgSend(v6, "skinner");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    avt_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __62__AVTComponentInstance__initializeVariantSkinnerPairsIfNeeded__block_invoke_2_cold_1(v11, v12, v13);

  }
  v14 = (void *)MEMORY[0x1E0CD5A20];
  objc_msgSend(v10, "baseGeometry");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bones");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "boneInverseBindTransforms");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "boneWeights");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "boneIndices");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "skinnerWithBaseGeometry:bones:boneInverseBindTransforms:boneWeights:boneIndices:", v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "baseGeometryBindTransform");
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
  }
  v22[0] = v23;
  v22[1] = v24;
  v22[2] = v25;
  v22[3] = v26;
  objc_msgSend(v20, "setBaseGeometryBindTransform:", v22);
  v21 = objc_alloc_init(AVTSkinnerVariantPair);
  -[AVTSkinnerVariantPair setOriginalSkinner:]((uint64_t)v21, v10);
  -[AVTPhysicsRig setRig:]((uint64_t)v21, v20);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "setObject:forKey:", v21, v6);

}

- (void)setSkinnerVariantIntensity:(float)a3 skeleton:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;
  _QWORD *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSMapTable *obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self->_assetNode && self->_skinnerVariantIntensity != a3)
  {
    self->_skinnerVariantIntensity = a3;
    -[AVTComponentInstance _initializeVariantSkinnerPairsIfNeeded](self, "_initializeVariantSkinnerPairsIfNeeded");
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    obj = self->_variantSkinnerPairs;
    v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v10);
          -[NSMapTable objectForKey:](self->_variantSkinnerPairs, "objectForKey:", v11);
          v12 = objc_claimAutoreleasedReturnValue();
          v14 = (_QWORD *)v12;
          v15 = (void *)MEMORY[0x1E0CD5A20];
          if (v12)
          {
            v16 = *(id *)(v12 + 8);
            v17 = v14[2];
          }
          else
          {
            v16 = 0;
            v17 = 0;
          }
          *(float *)&v13 = a3;
          objc_msgSend(v15, "avt_skinnerByInterpolatingFromSkinner:toSkinner:factor:skeleton:", v16, v17, v6, v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "setSkinner:", v18);
          ++v10;
        }
        while (v8 != v10);
        v19 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        v8 = v19;
      }
      while (v19);
    }

  }
}

- (void)setVisibilityRules:(id)a3 dictatedByCategory:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  NSMutableDictionary *visibilityRules;
  void *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  void *v13;

  v6 = a3;
  if (self->_assetNode)
  {
    v13 = v6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_visibilityRules, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 != v13)
    {
      AVTEvaluateNameMatchingRules(v8, self->_assetNode, &__block_literal_global_9);
      visibilityRules = self->_visibilityRules;
      v10 = v13;
      if (v13)
      {
        if (!visibilityRules)
        {
          v11 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
          v12 = self->_visibilityRules;
          self->_visibilityRules = v11;

          v10 = v13;
          visibilityRules = self->_visibilityRules;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](visibilityRules, "setObject:forKeyedSubscript:", v10, v7);
        AVTEvaluateNameMatchingRules(v13, self->_assetNode, &__block_literal_global_47);
      }
      else
      {
        -[NSMutableDictionary removeObjectForKey:](visibilityRules, "removeObjectForKey:", v7);
      }
    }

    v6 = v13;
  }

}

uint64_t __62__AVTComponentInstance_setVisibilityRules_dictatedByCategory___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHidden:", 0);
}

uint64_t __62__AVTComponentInstance_setVisibilityRules_dictatedByCategory___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHidden:", 1);
}

- (BOOL)has3DAsset
{
  return self->_assetNode != 0;
}

- (id)assetImageForAsset:(id)a3
{
  NSArray *assets;
  id v4;
  void *v5;
  void *v6;

  assets = self->_assets;
  v4 = a3;
  -[NSArray firstObject](assets, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetImageForAsset:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (SCNNode)assetNode
{
  return (SCNNode *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layers, 0);
  objc_storeStrong((id *)&self->_visibilityRules, 0);
  objc_storeStrong((id *)&self->_variantSkinnerPairs, 0);
  objc_storeStrong((id *)&self->_assetImageVariant, 0);
  objc_storeStrong((id *)&self->_assetImage, 0);
  objc_storeStrong((id *)&self->_materialVariant, 0);
  objc_storeStrong((id *)&self->_assetNode, 0);
  objc_storeStrong((id *)&self->_assets, 0);
}

- (void)initWithComponent:(NSObject *)a3 assetResourceCache:.cold.1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "node";
}

void __53__AVTComponentInstance_updateMaterialsWithComponent___block_invoke_cold_1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "avtMaterial";
}

void __62__AVTComponentInstance__initializeVariantSkinnerPairsIfNeeded__block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "originalSkinner";
}

void __62__AVTComponentInstance__initializeVariantSkinnerPairsIfNeeded__block_invoke_2_cold_2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "nodeWithSkinnerVariant";
}

@end
