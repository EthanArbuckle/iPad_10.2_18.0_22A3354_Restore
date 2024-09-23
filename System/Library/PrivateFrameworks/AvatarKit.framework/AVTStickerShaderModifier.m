@implementation AVTStickerShaderModifier

+ (id)shaderModifierCache
{
  if (shaderModifierCache_onceToken != -1)
    dispatch_once(&shaderModifierCache_onceToken, &__block_literal_global_79);
  return (id)shaderModifierCache_kCache;
}

void __47__AVTStickerShaderModifier_shaderModifierCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)shaderModifierCache_kCache;
  shaderModifierCache_kCache = (uint64_t)v0;

}

+ (id)shaderModifierFromDictionary:(id)a3 assetsPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  AVTStickerShaderModifier *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  AVTStickerShaderModifier *v32;
  void *v33;
  id v35;
  void *v36;
  unsigned int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("modifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "entryPointForModifierName:", v8);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("node"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("geometry"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  v13 = v12;
  objc_opt_class();
  v44 = v13;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v13, "componentsJoinedByString:", CFSTR("|"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("forceDoubleSided"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v14;
  if (v14)
    v37 = objc_msgSend(v14, "BOOLValue");
  else
    v37 = 0;
  objc_msgSend(a1, "shaderModifierCache");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("file"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", v16);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0CB3940];
  v43 = (void *)v17;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "standardizedURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "absoluteString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("%@.%@.%@"), v21, v8, v44);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = v16;
  if (v16)
  {
    objc_msgSend(v15, "objectForKey:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v39 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfFile:encoding:error:", v43, 4, 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v39)
      {
        v24 = 0;
        goto LABEL_28;
      }
    }
    v38 = v22;
    v35 = v13;
    v36 = v8;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("properties"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v46 != v29)
            objc_enumerationMutation(v26);
          +[AVTStickerShaderModifierProperty shaderModifierPropertyFromDictionary:assetsPath:](AVTStickerShaderModifierProperty, "shaderModifierPropertyFromDictionary:assetsPath:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i), v7);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31)
            objc_msgSend(v25, "addObject:", v31);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v28);
    }
    v32 = v23;
    if (v23)
    {
      v24 = v32;
      v13 = v35;
      v16 = v40;
      if (objc_msgSend(v25, "count"))
      {
        -[AVTStickerShaderModifier cloneWithProperties:](v32, "cloneWithProperties:", v25);
        v24 = (AVTStickerShaderModifier *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v13 = v35;
      v24 = -[AVTStickerShaderModifier initWithEntryPoint:nodeNames:data:properties:forceDoubleSided:]([AVTStickerShaderModifier alloc], "initWithEntryPoint:nodeNames:data:properties:forceDoubleSided:", v42, v35, v39, v25, v37);
      -[AVTStickerShaderModifier setDictionary:](v24, "setDictionary:", v6);
      objc_msgSend(v15, "setObject:forKey:", v24, v38);
      v16 = v40;
    }
    objc_msgSend(v16, "lastPathComponent");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v24->_isCropShaderModifier = objc_msgSend(v33, "isEqualToString:", CFSTR("crop_at_worldPosY.metal"));

    v8 = v36;
    v22 = v38;
  }
  else
  {
    v24 = 0;
  }
LABEL_28:

  return v24;
}

+ (id)entryPointForModifierName:(id)a3
{
  id v3;
  char v4;
  id *v5;
  id v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("fragment"));
  v5 = (id *)MEMORY[0x1E0CD5BB0];
  if ((v4 & 1) == 0)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("surface")) & 1) != 0)
    {
      v5 = (id *)MEMORY[0x1E0CD5BC8];
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("vertex")) & 1) != 0)
    {
      v5 = (id *)MEMORY[0x1E0CD5BB8];
    }
    else if (objc_msgSend(v3, "isEqualToString:", CFSTR("lightingModel")))
    {
      v5 = (id *)MEMORY[0x1E0CD5BC0];
    }
  }
  v6 = *v5;

  return v6;
}

+ (id)encapsulateShaderData:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = v3;
  if ((objc_msgSend(v3, "containsString:", CFSTR("// ==== STICKER SHADER MODIFIER START ====")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n%@\n%@\n%@\n"), CFSTR("// ==== STICKER SHADER MODIFIER START ===="), v3, CFSTR("// ==== STICKER SHADER MODIFIER END ===="));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (AVTStickerShaderModifier)initWithEntryPoint:(id)a3 nodeNames:(id)a4 data:(id)a5 properties:(id)a6 forceDoubleSided:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  AVTStickerShaderModifier *v17;
  AVTStickerShaderModifier *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)AVTStickerShaderModifier;
  v17 = -[AVTStickerShaderModifier init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_entryPoint, a3);
    objc_storeStrong(&v18->_nodeNames, a4);
    objc_storeStrong((id *)&v18->_data, a5);
    objc_storeStrong((id *)&v18->_properties, a6);
    v18->_forceDoubleSided = a7;
  }

  return v18;
}

- (id)cloneWithProperties:(id)a3
{
  id v4;
  AVTStickerShaderModifier *v5;
  void *v6;
  void *v7;
  void *v8;
  AVTStickerShaderModifier *v9;

  v4 = a3;
  v5 = [AVTStickerShaderModifier alloc];
  -[AVTStickerShaderModifier entryPoint](self, "entryPoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerShaderModifier nodeNames](self, "nodeNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerShaderModifier data](self, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AVTStickerShaderModifier initWithEntryPoint:nodeNames:data:properties:forceDoubleSided:](v5, "initWithEntryPoint:nodeNames:data:properties:forceDoubleSided:", v6, v7, v8, v4, -[AVTStickerShaderModifier forceDoubleSided](self, "forceDoubleSided"));

  return v9;
}

- (void)applyToMaterial:(id)a3 options:(id)a4 reversionContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  NSString *entryPoint;
  _QWORD v31[3];

  v31[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!self->_isCropShaderModifier || objc_msgSend(v9, "useLegacyCorrectClippingImplementation"))
  {
    objc_msgSend(v8, "shaderModifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", self->_entryPoint);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "containsString:", self->_data) & 1) == 0)
    {
      AVTMergeShaderModifiersForEntryPoint(v12, 0, self->_data, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_msgSend(v10, "saveShaderModifiers:forMaterial:", v11, v8);
        if (objc_msgSend(v11, "count"))
        {
          v14 = (void *)objc_msgSend(v11, "mutableCopy");
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, self->_entryPoint);
        }
        else
        {
          entryPoint = self->_entryPoint;
          v31[0] = v13;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &entryPoint, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v8, "setShaderModifiers:", v14);

      }
    }
    v24 = v9;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[AVTStickerShaderModifier properties](self, "properties", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v26 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v20, "name");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "saveCustomMaterialPropertyNamed:forMaterial:", v21, v8);
          objc_msgSend(v20, "effectiveValue");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setValue:forKey:", v22, v21);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v17);
    }

    if (-[AVTStickerShaderModifier forceDoubleSided](self, "forceDoubleSided")
      && (objc_msgSend(v8, "isDoubleSided") & 1) == 0)
    {
      objc_msgSend(v10, "saveSingleSidedForMaterial:", v8);
      objc_msgSend(v8, "setDoubleSided:", 1);
    }

    v9 = v24;
  }

}

- (void)applyToAllMaterialsOfNode:(id)a3 options:(id)a4 reversionContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a3, "geometry", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "materials");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        -[AVTStickerShaderModifier applyToMaterial:options:reversionContext:](self, "applyToMaterial:options:reversionContext:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++), v8, v9);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

- (void)applyToMatchedMaterialsOfAvatar:(id)a3 inHierarchy:(id)a4 options:(id)a5 reversionContext:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  objc_msgSend(a3, "nodesMatchingStickerPattern:inHierarchy:options:includingDerivedNodes:", self->_nodeNames, a4, 2, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        -[AVTStickerShaderModifier applyToAllMaterialsOfNode:options:reversionContext:](self, "applyToAllMaterialsOfNode:options:reversionContext:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++), v10, v11);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }

}

- (id)dictionaryWithTargetPath:(id)a3
{
  void *v3;
  void *v4;

  -[AVTStickerShaderModifier dictionary](self, "dictionary", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AVTStickerShaderModifier nodeNames](self, "nodeNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerShaderModifier entryPoint](self, "entryPoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<AVTStickerShaderModifier: %p>(%@ %@)"), self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)entryPoint
{
  return self->_entryPoint;
}

- (id)nodeNames
{
  return self->_nodeNames;
}

- (NSString)data
{
  return self->_data;
}

- (NSArray)properties
{
  return self->_properties;
}

- (BOOL)forceDoubleSided
{
  return self->_forceDoubleSided;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_dictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong(&self->_nodeNames, 0);
  objc_storeStrong((id *)&self->_entryPoint, 0);
}

@end
