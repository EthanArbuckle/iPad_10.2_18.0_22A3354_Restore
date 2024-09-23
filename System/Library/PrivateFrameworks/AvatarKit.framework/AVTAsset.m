@implementation AVTAsset

- (AVTAsset)initWithType:(int64_t)a3 identifier:(id)a4 path:(id)a5
{
  id v9;
  id v10;
  AVTAsset *v11;
  AVTAsset *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSDictionary *morphVariantDependencies;
  uint64_t v24;
  NSDictionary *imageVariantDependencies;
  uint64_t v26;
  NSDictionary *materialVariantDependencies;
  void *v28;
  NSDictionary *v29;
  NSDictionary *layers;
  NSDictionary *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned int v37;
  void *v38;
  unsigned int v39;
  id v40;
  void *v41;
  unsigned int v42;
  void *v43;
  unsigned int v44;
  void *v45;
  unsigned int v46;
  void *v47;
  unsigned int v48;
  void *v49;
  uint64_t v50;
  NSString *resourcePath;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  NSString *ambientOcclusion;
  uint64_t v60;
  NSDictionary *perAssetMain;
  id v62;
  NSDictionary *v63;
  id v64;
  uint64_t v65;
  NSDictionary *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  NSDictionary *specializationSettings;
  uint64_t v71;
  NSDictionary *wrapDeformerDriverNames;
  unsigned int v74;
  void *v75;
  void *v76;
  id v77;
  unsigned int v78;
  unint64_t v79;
  unsigned int v80;
  unint64_t v81;
  _QWORD v82[4];
  id v83;
  id v84;
  _QWORD v85[4];
  NSDictionary *v86;
  id v87;
  objc_super v88;

  v9 = a4;
  v10 = a5;
  v88.receiver = self;
  v88.super_class = (Class)AVTAsset;
  v11 = -[AVTAsset init](&v88, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_componentType = a3;
    objc_storeStrong((id *)&v11->_identifier, a4);
    v12->_cacheLock._os_unfair_lock_opaque = 0;
    AVTPrecompiledMemojiAssetWithIdentifier(v12->_identifier);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      avt_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[AVTAsset initWithType:identifier:path:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);

    }
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("variantDependencies-morph"));
    v22 = objc_claimAutoreleasedReturnValue();
    morphVariantDependencies = v12->_morphVariantDependencies;
    v12->_morphVariantDependencies = (NSDictionary *)v22;

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("variantDependencies-image"));
    v24 = objc_claimAutoreleasedReturnValue();
    imageVariantDependencies = v12->_imageVariantDependencies;
    v12->_imageVariantDependencies = (NSDictionary *)v24;

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("variantDependencies-material"));
    v26 = objc_claimAutoreleasedReturnValue();
    materialVariantDependencies = v12->_materialVariantDependencies;
    v12->_materialVariantDependencies = (NSDictionary *)v26;

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("layers"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v85[0] = MEMORY[0x1E0C809B0];
      v85[1] = 3221225472;
      v85[2] = __41__AVTAsset_initWithType_identifier_path___block_invoke;
      v85[3] = &unk_1EA61DEE0;
      v29 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v86 = v29;
      v87 = v10;
      objc_msgSend(v28, "enumerateKeysAndObjectsUsingBlock:", v85);
      layers = v12->_layers;
      v12->_layers = v29;
      v31 = v29;

    }
    v76 = v28;
    v77 = v9;
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("uvRemapping"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v32;
    if (v32)
    {
      v33 = v32;
      objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("transform"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("mirroringEnabled"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v12->_uvRemappingInfo.mirroringEnabled = objc_msgSend(v35, "BOOLValue");

      objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "floatValue");
      v80 = v37;
      objc_msgSend(v34, "objectAtIndexedSubscript:", 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "floatValue");
      v81 = __PAIR64__(v39, v80);
      objc_msgSend(v34, "objectAtIndexedSubscript:", 2);
      v40 = v10;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "floatValue");
      v78 = v42;
      objc_msgSend(v34, "objectAtIndexedSubscript:", 3);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "floatValue");
      v79 = __PAIR64__(v44, v78);
      objc_msgSend(v34, "objectAtIndexedSubscript:", 4);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "floatValue");
      v74 = v46;
      objc_msgSend(v34, "objectAtIndexedSubscript:", 5);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "floatValue");
      v12[1].super.isa = (Class)v81;
      v12[1]._identifier = (NSString *)v79;
      v12[1]._resourcePath = (NSString *)__PAIR64__(v48, v74);

      v10 = v40;
    }
    else
    {
      v12->_uvRemappingInfo.mirroringEnabled = 0;
      v12[1].super.isa = (Class)1065353216;
      v12[1]._identifier = (NSString *)0x3F80000000000000;
      v12[1]._resourcePath = 0;
    }
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("main"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingPathComponent:", v49);
    v50 = objc_claimAutoreleasedReturnValue();
    resourcePath = v12->_resourcePath;
    v12->_resourcePath = (NSString *)v50;

    -[NSString pathExtension](v12->_resourcePath, "pathExtension");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v52, "hasPrefix:", CFSTR("scn")))
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("accentColors"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v53;
      v55 = v76;
      v9 = v77;
      if (v53)
        v56 = objc_msgSend(v53, "unsignedIntegerValue");
      else
        v56 = 1;
      v12->_editableColorCount = v56;
      v12->_resourceType = 0;

    }
    else
    {
      v12->_resourceType = 1;
      v55 = v76;
      v9 = v77;
    }
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ao"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (v57)
    {
      objc_msgSend(v10, "stringByAppendingPathComponent:", v57);
      v58 = objc_claimAutoreleasedReturnValue();
      ambientOcclusion = v12->_ambientOcclusion;
      v12->_ambientOcclusion = (NSString *)v58;

    }
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("mainPerAsset"));
    v60 = objc_claimAutoreleasedReturnValue();
    perAssetMain = v12->_perAssetMain;
    v12->_perAssetMain = (NSDictionary *)v60;

    if (v12->_perAssetMain)
    {
      v62 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v63 = v12->_perAssetMain;
      v82[0] = MEMORY[0x1E0C809B0];
      v82[1] = 3221225472;
      v82[2] = __41__AVTAsset_initWithType_identifier_path___block_invoke_2;
      v82[3] = &unk_1EA61DF08;
      v83 = v62;
      v84 = v10;
      v64 = v62;
      -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v63, "enumerateKeysAndObjectsUsingBlock:", v82);
      v65 = objc_msgSend(v64, "copy");
      v66 = v12->_perAssetMain;
      v12->_perAssetMain = (NSDictionary *)v65;

    }
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("highTessellation"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    if (v67)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("highTessellation"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v12->_forceHighTessellation = objc_msgSend(v68, "BOOLValue");

    }
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("specialization settings"));
    v69 = objc_claimAutoreleasedReturnValue();
    specializationSettings = v12->_specializationSettings;
    v12->_specializationSettings = (NSDictionary *)v69;

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("wrapDeformerInfo"));
    v71 = objc_claimAutoreleasedReturnValue();
    wrapDeformerDriverNames = v12->_wrapDeformerDriverNames;
    v12->_wrapDeformerDriverNames = (NSDictionary *)v71;

  }
  return v12;
}

void __41__AVTAsset_initWithType_identifier_path___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "stringByAppendingPathComponent:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

void __41__AVTAsset_initWithType_identifier_path___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "stringByAppendingPathComponent:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

- (void)enumerateVariantDependenciesOfKind:(unint64_t)a3 block:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t i;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v13[0] = self->_morphVariantDependencies;
  v13[1] = self->_imageVariantDependencies;
  v13[2] = self->_materialVariantDependencies;
  v7 = (void *)v13[a3];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__AVTAsset_enumerateVariantDependenciesOfKind_block___block_invoke;
  v11[3] = &unk_1EA61DF58;
  v8 = v6;
  v12 = v8;
  v9 = v7;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v11);

  for (i = 2; i != -1; --i)
}

void __53__AVTAsset_enumerateVariantDependenciesOfKind_block___block_invoke(uint64_t a1, void *a2, void *a3)
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
  v7[2] = __53__AVTAsset_enumerateVariantDependenciesOfKind_block___block_invoke_2;
  v7[3] = &unk_1EA61DF30;
  v8 = *(id *)(a1 + 32);
  v9 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);

}

uint64_t __53__AVTAsset_enumerateVariantDependenciesOfKind_block___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2, a3);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p \"%@\">"), v5, self, self->_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)incrUseCount
{
  os_unfair_lock_s *p_cacheLock;

  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  ++self->_refCount;
  os_unfair_lock_unlock(p_cacheLock);
}

- (void)freeCache
{
  id cachedResource;

  cachedResource = self->_cachedResource;
  self->_cachedResource = 0;

}

- (void)decrUseCount
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DD1FA000, log, OS_LOG_TYPE_ERROR, "Error: Unreachable code: error in AVTAsset refCount", v1, 2u);
  OUTLINED_FUNCTION_3();
}

- (BOOL)is2DAsset
{
  return self->_resourceType == 1;
}

- (BOOL)is3DAsset
{
  return self->_resourceType == 0;
}

- (id)instantiateResource
{
  unsigned __int8 *p_resourceType;
  NSString **p_resourcePath;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _BOOL8 v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t componentType;
  void *v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;

  p_resourceType = &self->_resourceType;
  if (self->_resourceType == 1)
    return self->_resourcePath;
  if (self->_resourceType)
  {
    avt_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[AVTAsset instantiateResource].cold.1((uint64_t)p_resourceType, v11, v12, v13, v14, v15, v16, v17);

    return 0;
  }
  else
  {
    p_resourcePath = &self->_resourcePath;
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", self->_resourcePath, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    objc_msgSend(MEMORY[0x1E0CD5A10], "avt_rootNodeForSceneAtURL:options:error:", v5, 0, &v32);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v32;
    if (v7)
    {
      avt_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[AVTAsset instantiateResource].cold.3((uint64_t *)&self->_resourcePath, v7, v8);
      v9 = 0;
    }
    else
    {
      objc_msgSend(v6, "childNodes");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
      v8 = objc_claimAutoreleasedReturnValue();

      -[NSObject removeFromParentNode](v8, "removeFromParentNode");
      if (v8)
      {
        if (self->_forceHighTessellation)
        {
          v19 = 1;
        }
        else
        {
          componentType = self->_componentType;
          v19 = componentType > 0x1B || ((1 << componentType) & 0xC000068) == 0;
        }
        -[NSObject avt_enableSubdivisionOnHierarchyWithQuality:animoji:](v8, "avt_enableSubdivisionOnHierarchyWithQuality:animoji:", v19, 0);
        if (self->_wrapDeformerDriverNames)
        {
          -[NSString stringByDeletingLastPathComponent](self->_resourcePath, "stringByDeletingLastPathComponent");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v30[0] = MEMORY[0x1E0C809B0];
          v30[1] = 3221225472;
          v30[2] = __31__AVTAsset_instantiateResource__block_invoke;
          v30[3] = &unk_1EA61DAC8;
          v30[4] = self;
          v31 = v28;
          v29 = v28;
          -[NSObject enumerateHierarchyUsingBlock:](v8, "enumerateHierarchyUsingBlock:", v30);

        }
        v8 = v8;
        v9 = v8;
      }
      else
      {
        avt_default_log();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[AVTAsset instantiateResource].cold.2((uint64_t)p_resourcePath, v20, v21, v22, v23, v24, v25, v26);

        v9 = 0;
      }
    }

    return v9;
  }
}

void __31__AVTAsset_instantiateResource__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;

  v3 = a2;
  objc_msgSend(v3, "geometry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@.wrapdata"), v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathComponent:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "fileExistsAtPath:", v9);

    if (v11)
    {
      v17 = 0;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v9, 1, &v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v17;
      v16 = v13;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v12, &v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v16;

      objc_msgSend(v3, "setValue:forUndefinedKey:", v14, CFSTR("wrapDeformerParameters"));
      objc_msgSend(v3, "setValue:forUndefinedKey:", v6, CFSTR("wrapDeformerDriverName"));

    }
  }

}

- (id)resourceByCachingIfNeeded:(BOOL)a3
{
  os_unfair_lock_s *p_cacheLock;
  void *v5;
  id cachedResource;
  unsigned __int8 *p_resourceType;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (a3)
  {
    p_cacheLock = &self->_cacheLock;
    os_unfair_lock_lock(&self->_cacheLock);
    if (!self->_cachedResource)
    {
      -[AVTAsset instantiateResource](self, "instantiateResource");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      cachedResource = self->_cachedResource;
      self->_cachedResource = v5;

    }
    p_resourceType = &self->_resourceType;
    if (self->_resourceType == 1)
    {
      v8 = self->_cachedResource;
    }
    else
    {
      if (self->_resourceType)
      {
        avt_default_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[AVTAsset instantiateResource].cold.1((uint64_t)p_resourceType, v10, v11, v12, v13, v14, v15, v16);

        v9 = 0;
        goto LABEL_13;
      }
      AVTCloneNodesAndMaterials(self->_cachedResource);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;
LABEL_13:
    os_unfair_lock_unlock(p_cacheLock);
    return v9;
  }
  -[AVTAsset instantiateResource](self, "instantiateResource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  return v9;
}

- (id)assetImageForAsset:(id)a3
{
  NSDictionary *perAssetMain;
  void *v4;
  void *v5;

  perAssetMain = self->_perAssetMain;
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](perAssetMain, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)componentType
{
  return self->_componentType;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)specializationSettings
{
  return (NSDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (NSDictionary)layers
{
  return (NSDictionary *)objc_getProperty(self, a2, 120, 1);
}

- ($562F4F2D9DF7D474E0F2587276617CA9)uvRemappingInfo
{
  void *v2;
  $562F4F2D9DF7D474E0F2587276617CA9 v3;

  objc_copyStruct(v2, &self->_uvRemappingInfo, 32, 1, 0);
  return v3;
}

- (unint64_t)editableColorCount
{
  return self->_editableColorCount;
}

- (NSString)ambientOcclusion
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perAssetMain, 0);
  objc_storeStrong((id *)&self->_wrapDeformerDriverNames, 0);
  objc_storeStrong((id *)&self->_layers, 0);
  objc_storeStrong((id *)&self->_specializationSettings, 0);
  objc_storeStrong(&self->_cachedResource, 0);
  objc_storeStrong((id *)&self->_highlights, 0);
  objc_storeStrong((id *)&self->_ambientOcclusion, 0);
  objc_storeStrong((id *)&self->_materialVariantDependencies, 0);
  objc_storeStrong((id *)&self->_imageVariantDependencies, 0);
  objc_storeStrong((id *)&self->_morphVariantDependencies, 0);
  objc_storeStrong((id *)&self->_resourcePath, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithType:(uint64_t)a3 identifier:(uint64_t)a4 path:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)instantiateResource
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  objc_msgSend(a2, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1DD1FA000, a3, OS_LOG_TYPE_ERROR, "Error: could not load scene at %@ with error: %@", (uint8_t *)&v6, 0x16u);

}

@end
