@implementation NTKPlistPigmentEditOptionLoader

- (void)setIncludesAllDeviceSpecificColors:(BOOL)a3
{
  self->_includesAllDeviceSpecificColors = a3;
}

- (void)setIgnoreSensitiveUIItems:(BOOL)a3
{
  self->_ignoreSensitiveUIItems = a3;
}

- (void)setClhs:(id)a3
{
  objc_storeStrong((id *)&self->_clhs, a3);
}

- (void)setAdditionalBundles:(id)a3
{
  objc_storeStrong((id *)&self->_additionalBundles, a3);
}

- (NTKPlistPigmentEditOptionLoader)init
{
  void *v3;
  NTKPlistPigmentEditOptionLoader *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NTKPlistPigmentEditOptionLoader initWithBundle:](self, "initWithBundle:", v3);

  return v4;
}

- (NTKPlistPigmentEditOptionLoader)initWithBundle:(id)a3
{
  id v5;
  NTKPlistPigmentEditOptionLoader *v6;
  NTKPlistPigmentEditOptionLoader *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKPlistPigmentEditOptionLoader;
  v6 = -[NTKPlistPigmentEditOptionLoader init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_frameworkBundle, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (NSNumber)clhs
{
  return self->_clhs;
}

- (NSArray)additionalBundles
{
  return self->_additionalBundles;
}

- (NTKPlistPigmentEditOptionLoader)initWithPlistFiles:(id)a3
{
  id v5;
  void *v6;
  NTKPlistPigmentEditOptionLoader *v7;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NTKPlistPigmentEditOptionLoader initWithBundle:](self, "initWithBundle:", v6);

  if (v7)
    objc_storeStrong((id *)&v7->_plistFiles, a3);

  return v7;
}

- (NSDictionary)sharedConfigs
{
  NSDictionary *sharedConfigs;
  id v4;

  sharedConfigs = self->_sharedConfigs;
  if (!sharedConfigs)
  {
    v4 = -[NTKPlistPigmentEditOptionLoader loadSharedCollections](self, "loadSharedCollections");
    sharedConfigs = self->_sharedConfigs;
  }
  return sharedConfigs;
}

- (id)loadSharedCollections
{
  NSObject *v3;
  NSBundle *frameworkBundle;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "#plist-loader Loading #shared pigment collections#", (uint8_t *)&v10, 2u);
  }

  frameworkBundle = self->_frameworkBundle;
  -[NTKPlistPigmentEditOptionLoader additionalBundles](self, "additionalBundles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKPlistPigmentEditOptionLoader loadSharedCollectionsInMainBundle:additionalBundles:](self, "loadSharedCollectionsInMainBundle:additionalBundles:", frameworkBundle, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(v6, "count");
    v10 = 134217984;
    v11 = v8;
    _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "#plist-loader Finished loading shared collections. Number of shared collections %lu", (uint8_t *)&v10, 0xCu);
  }

  return v6;
}

- (id)parseColorOptionsForDomain:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[NTKPlistPigmentEditOptionLoader loadSharedCollections](self, "loadSharedCollections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKPlistPigmentEditOptionLoader parseColorOptionsForDomain:bundle:sharedCollections:](self, "parseColorOptionsForDomain:bundle:sharedCollections:", v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)parseColorOptionsForDomain:(id)a3 bundle:(id)a4 sharedCollections:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  NSBundle *frameworkBundle;
  void *v15;
  void *v16;
  NTKFacePigmentSet *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[NTKPlistPigmentEditOptionLoader parseColorOptionsForDomain:bundle:sharedCollections:].cold.2();

  if (objc_msgSend(v10, "count"))
  {
    if (!v9)
      goto LABEL_10;
  }
  else
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[NTKPlistPigmentEditOptionLoader parseColorOptionsForDomain:bundle:sharedCollections:].cold.1();

    if (!v9)
      goto LABEL_10;
  }
  if ((objc_msgSend(v9, "isEqual:", self->_frameworkBundle) & 1) != 0)
  {
LABEL_10:
    v13 = 0;
    goto LABEL_12;
  }
  v13 = v9;
LABEL_12:
  frameworkBundle = self->_frameworkBundle;
  -[NTKPlistPigmentEditOptionLoader additionalBundles](self, "additionalBundles");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKPlistPigmentEditOptionLoader loadFaceCollectionForDomain:mainBundle:faceBundle:additionalBundles:sharedCollections:](self, "loadFaceCollectionForDomain:mainBundle:faceBundle:additionalBundles:sharedCollections:", v8, frameworkBundle, v13, v15, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "count"))
  {
    v17 = objc_alloc_init(NTKFacePigmentSet);
    -[NTKFacePigmentSet setCollectionBySlots:](v17, "setCollectionBySlots:", v16);
  }
  else
  {
    v17 = 0;
  }
  -[NTKFacePigmentSet setDomain:](v17, "setDomain:", v8);

  return v17;
}

- (id)loadSharedCollectionsInMainBundle:(id)a3 additionalBundles:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  NSDictionary *v22;
  NSDictionary *sharedConfigs;
  void *v24;
  void *v26;
  void *v27;
  id obj;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v7;
  v27 = v6;
  -[NTKPlistPigmentEditOptionLoader sortedPlistFilesWithMainBundle:faceBundle:additionalBundles:](self, "sortedPlistFilesWithMainBundle:faceBundle:additionalBundles:", v6, 0, v7);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v12, "plistFileName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "bundle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKPlistPigmentEditOptionLoader loadSharedConfigWithPropertyList:bundle:](self, "loadSharedConfigWithPropertyList:bundle:", v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v15, "count"))
          -[NTKPlistPigmentEditOptionLoader mergeConfigs:withConfigs:](self, "mergeConfigs:withConfigs:", v29, v15);
        objc_msgSend(v12, "plistFileName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "bundle");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKPlistPigmentEditOptionLoader loadSharedCollectionsWithPropertyList:bundle:](self, "loadSharedCollectionsWithPropertyList:bundle:", v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v18, "count"))
        {
          _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v12, "plistFileName");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v36 = v18;
            v37 = 2114;
            v38 = v21;
            _os_log_debug_impl(&dword_1B72A3000, v19, OS_LOG_TYPE_DEBUG, "Merging collections %{public}@ from plist %{public}@", buf, 0x16u);

          }
          -[NTKPlistPigmentEditOptionLoader mergeCollections:withCollections:](self, "mergeCollections:withCollections:", v30, v18);
          _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            v36 = v30;
            _os_log_debug_impl(&dword_1B72A3000, v20, OS_LOG_TYPE_DEBUG, "Collections after merge %{public}@", buf, 0xCu);
          }

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v9);
  }
  v22 = (NSDictionary *)objc_msgSend(v29, "copy");
  sharedConfigs = self->_sharedConfigs;
  self->_sharedConfigs = v22;

  v24 = (void *)objc_msgSend(v30, "copy");
  return v24;
}

- (id)loadFaceCollectionForDomain:(id)a3 mainBundle:(id)a4 faceBundle:(id)a5 additionalBundles:(id)a6 sharedCollections:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v32;
  void *v33;
  void *v34;
  id obj;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  void *v43;
  NTKPlistPigmentEditOptionLoader *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v37 = a7;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v13;
  v34 = v12;
  v32 = v14;
  -[NTKPlistPigmentEditOptionLoader sortedPlistFilesWithMainBundle:faceBundle:additionalBundles:](self, "sortedPlistFilesWithMainBundle:faceBundle:additionalBundles:", v12, v13, v14);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v46;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v46 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v19);
        v21 = (void *)MEMORY[0x1BCCA7FA8]();
        objc_msgSend(v20, "plistFileName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "bundle");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKPlistPigmentEditOptionLoader loadFaceCollectionForAllSlotsForDomain:propertyList:bundle:sharedCollections:](self, "loadFaceCollectionForAllSlotsForDomain:propertyList:bundle:sharedCollections:", v36, v22, v23, v37);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __121__NTKPlistPigmentEditOptionLoader_loadFaceCollectionForDomain_mainBundle_faceBundle_additionalBundles_sharedCollections___block_invoke;
        v41[3] = &unk_1E6BD6358;
        v42 = v15;
        v43 = v20;
        v44 = self;
        objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v41);

        objc_autoreleasePoolPop(v21);
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    }
    while (v17);
  }

  v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __121__NTKPlistPigmentEditOptionLoader_loadFaceCollectionForDomain_mainBundle_faceBundle_additionalBundles_sharedCollections___block_invoke_84;
  v38[3] = &unk_1E6BD6380;
  v39 = v36;
  v26 = v25;
  v40 = v26;
  v27 = v36;
  v28 = v15;
  objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v38);
  v29 = v40;
  v30 = v26;

  return v30;
}

void __121__NTKPlistPigmentEditOptionLoader_loadFaceCollectionForDomain_mainBundle_faceBundle_additionalBundles_sharedCollections___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __121__NTKPlistPigmentEditOptionLoader_loadFaceCollectionForDomain_mainBundle_faceBundle_additionalBundles_sharedCollections___block_invoke_cold_2((uint64_t)v6, a1, v8);

    objc_msgSend(*(id *)(a1 + 48), "mergeCollections:withCollections:", v7, v6);
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __121__NTKPlistPigmentEditOptionLoader_loadFaceCollectionForDomain_mainBundle_faceBundle_additionalBundles_sharedCollections___block_invoke_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);
  }

}

void __121__NTKPlistPigmentEditOptionLoader_loadFaceCollectionForDomain_mainBundle_faceBundle_additionalBundles_sharedCollections___block_invoke_84(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v6);

}

- (id)extractSuffixFromFileName:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = objc_msgSend(CFSTR(".color.plist"), "length");
  if (objc_msgSend(v3, "length") >= v4)
  {
    objc_msgSend(v3, "lastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "length") - objc_msgSend(CFSTR(".color.plist"), "length"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "containsString:", CFSTR("-")))
    {
      objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("-"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v8;
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)mergeConfigs:(id)a3 withConfigs:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v12 = a3;
  v5 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v5, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __60__NTKPlistPigmentEditOptionLoader_mergeConfigs_withConfigs___block_invoke;
    v16[3] = &unk_1E6BD63A8;
    v10 = v5;
    v17 = v10;
    v18 = v8;
    v11 = v8;
    objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v16);
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __60__NTKPlistPigmentEditOptionLoader_mergeConfigs_withConfigs___block_invoke_2;
    v13[3] = &unk_1E6BCF4C8;
    v14 = v12;
    v15 = v10;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v13);

  }
}

void __60__NTKPlistPigmentEditOptionLoader_mergeConfigs_withConfigs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "removeObject:", v7);
    objc_msgSend(v5, "overridePropertiesFromConfig:", v6);
  }

}

void __60__NTKPlistPigmentEditOptionLoader_mergeConfigs_withConfigs___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v4);

}

- (void)mergeCollections:(id)a3 withCollections:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v12 = a3;
  v5 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v5, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __68__NTKPlistPigmentEditOptionLoader_mergeCollections_withCollections___block_invoke;
    v16[3] = &unk_1E6BD63D0;
    v10 = v5;
    v17 = v10;
    v18 = v8;
    v11 = v8;
    objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v16);
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __68__NTKPlistPigmentEditOptionLoader_mergeCollections_withCollections___block_invoke_2;
    v13[3] = &unk_1E6BCF4C8;
    v14 = v12;
    v15 = v10;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v13);

  }
}

void __68__NTKPlistPigmentEditOptionLoader_mergeCollections_withCollections___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "removeObject:", v7);
    objc_msgSend(v5, "mergeWithCollection:", v6);
  }

}

void __68__NTKPlistPigmentEditOptionLoader_mergeCollections_withCollections___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v4);

}

- (id)loadFaceCollectionForAllSlotsForDomain:(id)a3 propertyList:(id)a4 bundle:(id)a5 sharedCollections:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  _QWORD v23[4];
  NSObject *v24;
  NTKPlistPigmentEditOptionLoader *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint8_t buf[4];
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[NTKPlistPigmentEditOptionLoader loadPropertyListFromFile:](self, "loadPropertyListFromFile:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKPlistPigmentEditOptionLoader extractSuffixFromFileName:](self, "extractSuffixFromFileName:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14;
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("faces"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[NTKPlistPigmentEditOptionLoader loadFaceCollectionForAllSlotsForDomain:propertyList:bundle:sharedCollections:].cold.1();
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[NTKPlistPigmentEditOptionLoader loadFaceCollectionForAllSlotsForDomain:propertyList:bundle:sharedCollections:].cold.4((uint64_t)v17, (uint64_t)v10, v18);
    goto LABEL_20;
  }
  objc_msgSend(v17, "objectForKeyedSubscript:", v10);
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[NTKPlistPigmentEditOptionLoader loadFaceCollectionForAllSlotsForDomain:propertyList:bundle:sharedCollections:].cold.2();
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[NTKPlistPigmentEditOptionLoader loadFaceCollectionForAllSlotsForDomain:propertyList:bundle:sharedCollections:].cold.3((uint64_t)v18, (uint64_t)v10, v21);
LABEL_19:

LABEL_20:
    v20 = 0;
    goto LABEL_21;
  }
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __112__NTKPlistPigmentEditOptionLoader_loadFaceCollectionForAllSlotsForDomain_propertyList_bundle_sharedCollections___block_invoke;
  v32[3] = &unk_1E6BD63F8;
  v32[4] = &v33;
  -[NSObject enumerateKeysAndObjectsUsingBlock:](v18, "enumerateKeysAndObjectsUsingBlock:", v32);
  if (-[NTKPlistPigmentEditOptionLoader hasFileLevelSensitiveUIConfig:](self, "hasFileLevelSensitiveUIConfig:", v16)
    && self->_ignoreSensitiveUIItems)
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v38 = v11;
      _os_log_impl(&dword_1B72A3000, v19, OS_LOG_TYPE_DEFAULT, "#plist-loader Ignoring plist because sensitive UI is disabled %{public}@", buf, 0xCu);
    }
    v20 = 0;
  }
  else
  {
    v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (*((_BYTE *)v34 + 24))
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __112__NTKPlistPigmentEditOptionLoader_loadFaceCollectionForAllSlotsForDomain_propertyList_bundle_sharedCollections___block_invoke_91;
      v23[3] = &unk_1E6BD6420;
      v24 = v18;
      v25 = self;
      v26 = v10;
      v27 = v17;
      v28 = v13;
      v29 = v15;
      v30 = v12;
      v20 = v20;
      v31 = v20;
      -[NSObject enumerateKeysAndObjectsUsingBlock:](v24, "enumerateKeysAndObjectsUsingBlock:", v23);

      v19 = v24;
    }
    else
    {
      -[NTKPlistPigmentEditOptionLoader loadFaceCollectionForDomain:contentRoot:faceCollectionsRoot:sharedCollections:plistSuffix:bundle:](self, "loadFaceCollectionForDomain:contentRoot:faceCollectionsRoot:sharedCollections:plistSuffix:bundle:", v10, v18, v17, v13, v15, v12);
      v19 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, CFSTR("slot-"));
    }
  }

  _Block_object_dispose(&v33, 8);
LABEL_21:

  return v20;
}

uint64_t __112__NTKPlistPigmentEditOptionLoader_loadFaceCollectionForAllSlotsForDomain_propertyList_bundle_sharedCollections___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "hasPrefix:", CFSTR("slot-"));
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __112__NTKPlistPigmentEditOptionLoader_loadFaceCollectionForAllSlotsForDomain_propertyList_bundle_sharedCollections___block_invoke_91(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v3 = a2;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("slot-")))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "loadFaceCollectionForDomain:contentRoot:faceCollectionsRoot:sharedCollections:plistSuffix:bundle:", *(_QWORD *)(a1 + 48), v4, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("slot-"), "length"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 88), "setObject:forKeyedSubscript:", v5, v6);

  }
  else
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __112__NTKPlistPigmentEditOptionLoader_loadFaceCollectionForAllSlotsForDomain_propertyList_bundle_sharedCollections___block_invoke_91_cold_1(v7);

  }
}

- (id)loadFaceCollectionForDomain:(id)a3 contentRoot:(id)a4 faceCollectionsRoot:(id)a5 sharedCollections:(id)a6 plistSuffix:(id)a7 bundle:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  char v28;

  v14 = a3;
  v15 = a6;
  v16 = a8;
  v17 = a7;
  v18 = a5;
  v19 = a4;
  objc_msgSend((id)objc_opt_class(), "modifyContentRootForImplicitCollectionsIfNeeded:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v15, "mutableCopy");
  v28 = 0;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v14);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKPlistPigmentEditOptionLoader discoverCollectionWithName:contentRoot:collectionsRoot:discoveredCollections:privateDiscoveredCollections:discoveredInvalidCollections:invalidDependecies:hasCycle:plistSuffix:bundle:](self, "discoverCollectionWithName:contentRoot:collectionsRoot:discoveredCollections:privateDiscoveredCollections:discoveredInvalidCollections:invalidDependecies:hasCycle:plistSuffix:bundle:", v14, v20, v18, v22, 0, 0, v23, &v28, v17, v16);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[NTKPlistPigmentEditOptionLoader loadFaceCollectionForDomain:contentRoot:faceCollectionsRoot:sharedCollections:plistSuffix:bundle:].cold.2();
  }
  else if (v24)
  {
    objc_msgSend(v24, "collectionName");
    v25 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v24, v25);
  }
  else
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      -[NTKPlistPigmentEditOptionLoader loadFaceCollectionForDomain:contentRoot:faceCollectionsRoot:sharedCollections:plistSuffix:bundle:].cold.1();
  }

  objc_msgSend(v15, "allKeys");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "removeObjectsForKeys:", v26);

  objc_msgSend(v21, "addEntriesFromDictionary:", v22);
  return v21;
}

+ (id)modifyContentRootForImplicitCollectionsIfNeeded:(id)a3
{
  id v4;
  char isKindOfClass;
  id v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  char v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, void *);
  void *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = v4;
  v7 = v6;
  v8 = v6;
  if ((isKindOfClass & 1) != 0)
  {
    v8 = v6;
    if (objc_msgSend(v6, "count"))
    {
      v9 = objc_msgSend(a1, "containsReservedKey:inDictionary:", CFSTR("imports"), v7);
      v10 = objc_msgSend(a1, "containsReservedKey:inDictionary:", CFSTR("collections"), v7);
      v11 = objc_msgSend(a1, "containsReservedKey:inDictionary:", CFSTR("items"), v7);
      v8 = v7;
      if ((v9 & 1) == 0)
      {
        v8 = v7;
        if ((v10 & 1) == 0)
        {
          v8 = v7;
          if ((v11 & 1) == 0)
          {
            v12 = (void *)objc_msgSend(v7, "mutableCopy");
            v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            v22 = MEMORY[0x1E0C809B0];
            v23 = 3221225472;
            v24 = __83__NTKPlistPigmentEditOptionLoader_modifyContentRootForImplicitCollectionsIfNeeded___block_invoke;
            v25 = &unk_1E6BD6448;
            v15 = v13;
            v26 = v15;
            v16 = v14;
            v27 = v16;
            objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", &v22);
            v8 = v7;
            if (objc_msgSend(v15, "count", v22, v23, v24, v25))
            {
              objc_msgSend(v12, "removeObjectsForKeys:", v15);
              objc_msgSend(a1, "sortedColorFileNames:", v15);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = (void *)objc_msgSend(v17, "copy");
              objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, CFSTR("imports"));

              v19 = (void *)objc_msgSend(v16, "copy");
              objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, CFSTR("collections"));

              v8 = (void *)objc_msgSend(v12, "copy");
              _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543618;
                v29 = v7;
                v30 = 2114;
                v31 = v8;
                _os_log_impl(&dword_1B72A3000, v20, OS_LOG_TYPE_INFO, "#plist-loader collection root content is being modified from %{public}@, to %{public}@", buf, 0x16u);
              }

            }
          }
        }
      }
    }
  }

  return v8;
}

void __83__NTKPlistPigmentEditOptionLoader_modifyContentRootForImplicitCollectionsIfNeeded___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if ((objc_msgSend(v6, "isEqual:", CFSTR("config")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v6);
  }

}

+ (BOOL)containsReservedKey:(id)a3 inDictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  BOOL v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  BOOL v20;

  v5 = a3;
  v6 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;

  v20 = v8;
  if (*((_BYTE *)v18 + 24))
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v5, CFSTR("-"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __68__NTKPlistPigmentEditOptionLoader_containsReservedKey_inDictionary___block_invoke;
    v14[3] = &unk_1E6BD6470;
    v16 = &v17;
    v12 = v10;
    v15 = v12;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v14);

    v9 = *((_BYTE *)v18 + 24) != 0;
  }
  _Block_object_dispose(&v17, 8);

  return v9;
}

void __68__NTKPlistPigmentEditOptionLoader_containsReservedKey_inDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v6, "hasPrefix:", *(_QWORD *)(a1 + 32));
    *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }

}

- (id)loadSharedConfigWithPropertyList:(id)a3 bundle:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v20[5];
  id v21;

  -[NTKPlistPigmentEditOptionLoader loadPropertyListFromFile:](self, "loadPropertyListFromFile:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shared-config"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[NTKPlistPigmentEditOptionLoader loadSharedConfigWithPropertyList:bundle:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[NTKPlistPigmentEditOptionLoader loadSharedConfigWithPropertyList:bundle:].cold.2((uint64_t)v6, v11);
LABEL_8:

    v10 = 0;
    goto LABEL_9;
  }
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __75__NTKPlistPigmentEditOptionLoader_loadSharedConfigWithPropertyList_bundle___block_invoke;
  v20[3] = &unk_1E6BD6498;
  v20[4] = self;
  v8 = v7;
  v21 = v8;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v20);
  v9 = v21;
  v10 = v8;

LABEL_9:
  return v10;
}

void __75__NTKPlistPigmentEditOptionLoader_loadSharedConfigWithPropertyList_bundle___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "configurationFromNode:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v6);

}

- (id)loadSharedCollectionsWithPropertyList:(id)a3 bundle:(id)a4
{
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  id v24;
  NSObject *v25;
  id v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *, void *);
  void *v32;
  id v33;
  id v34;
  NTKPlistPigmentEditOptionLoader *v35;
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  NSObject *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NTKPlistPigmentEditOptionLoader loadPropertyListFromFile:](self, "loadPropertyListFromFile:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKPlistPigmentEditOptionLoader extractSuffixFromFileName:](self, "extractSuffixFromFileName:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("shared-collections"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[NTKPlistPigmentEditOptionLoader loadSharedCollectionsWithPropertyList:bundle:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[NTKPlistPigmentEditOptionLoader loadSharedCollectionsWithPropertyList:bundle:].cold.2((uint64_t)v11, v12);
    goto LABEL_11;
  }
  if (-[NTKPlistPigmentEditOptionLoader hasFileLevelSensitiveUIConfig:](self, "hasFileLevelSensitiveUIConfig:", v10)
    && self->_ignoreSensitiveUIItems)
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v40 = v6;
      _os_log_impl(&dword_1B72A3000, v12, OS_LOG_TYPE_DEFAULT, "#plist-loader Ignoring plist because sensitive UI is disabled %{public}@", buf, 0xCu);
    }
LABEL_11:
    v20 = 0;
    goto LABEL_23;
  }
  -[NTKPlistPigmentEditOptionLoader skuFileLevel:](self, "skuFileLevel:", v10);
  v21 = objc_claimAutoreleasedReturnValue();
  v12 = v21;
  if (!self->_ignoreSensitiveUIItems
    && v21
    && self->_sku
    && -[NSObject isEqualToNumber:](v21, "isEqualToNumber:"))
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v40 = v12;
      _os_log_impl(&dword_1B72A3000, v22, OS_LOG_TYPE_DEFAULT, "#plist-loader Ignoring plist file because it is sku specific %{public}@", buf, 0xCu);
    }
    v20 = 0;
  }
  else
  {
    v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v24 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v40 = v6;
      _os_log_impl(&dword_1B72A3000, v25, OS_LOG_TYPE_INFO, "#plist-loader Loading shared collections from plist %{public}@", buf, 0xCu);
    }

    v29 = MEMORY[0x1E0C809B0];
    v30 = 3221225472;
    v31 = __80__NTKPlistPigmentEditOptionLoader_loadSharedCollectionsWithPropertyList_bundle___block_invoke;
    v32 = &unk_1E6BD64C0;
    v26 = v23;
    v33 = v26;
    v34 = v24;
    v35 = self;
    v36 = v11;
    v37 = v9;
    v38 = v7;
    v22 = v24;
    objc_msgSend(v36, "enumerateKeysAndObjectsUsingBlock:", &v29);
    objc_msgSend(v26, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_119, v29, v30, v31, v32);
    v27 = v38;
    v20 = v26;

  }
LABEL_23:

  return v20;
}

void __80__NTKPlistPigmentEditOptionLoader_loadSharedCollectionsWithPropertyList_bundle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7 && (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v5) & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "modifyContentRootForImplicitCollectionsIfNeeded:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v9 = *(void **)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 56);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "discoverCollectionWithName:contentRoot:collectionsRoot:discoveredCollections:privateDiscoveredCollections:discoveredInvalidCollections:invalidDependecies:hasCycle:plistSuffix:bundle:", v5, v8, v10, v11, 0, v12, v13, &v15, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v14, v5);

  }
}

uint64_t __80__NTKPlistPigmentEditOptionLoader_loadSharedCollectionsWithPropertyList_bundle___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setShared:", 1);
}

- (id)discoverCollectionWithName:(id)a3 contentRoot:(id)a4 collectionsRoot:(id)a5 discoveredCollections:(id)a6 privateDiscoveredCollections:(id)a7 discoveredInvalidCollections:(id)a8 invalidDependecies:(id)a9 hasCycle:(BOOL *)a10 plistSuffix:(id)a11 bundle:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  NTKPigmentCollection *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  NSObject *v42;
  void *v43;
  NTKPigmentCollection *v44;
  const char *v45;
  NTKPigmentCollection *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  _BOOL4 v55;
  void *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  _QWORD v73[4];
  id v74;
  id v75;
  uint8_t buf[4];
  NTKPigmentCollection *v77;
  __int16 v78;
  id v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a8;
  v22 = a9;
  v23 = a11;
  v24 = a12;
  _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    -[NTKPlistPigmentEditOptionLoader discoverCollectionWithName:contentRoot:collectionsRoot:discoveredCollections:privateDiscoveredCollections:discoveredInvalidCollections:invalidDependecies:hasCycle:plistSuffix:bundle:].cold.4();

  if (!v18)
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v26 = (NTKPigmentCollection *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v26->super, OS_LOG_TYPE_ERROR))
      -[NTKPlistPigmentEditOptionLoader discoverCollectionWithName:contentRoot:collectionsRoot:discoveredCollections:privateDiscoveredCollections:discoveredInvalidCollections:invalidDependecies:hasCycle:plistSuffix:bundle:].cold.1();
    goto LABEL_25;
  }
  v71 = v19;
  v72 = v20;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
      v26 = (NTKPigmentCollection *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v26->super, OS_LOG_TYPE_ERROR))
        -[NTKPlistPigmentEditOptionLoader discoverCollectionWithName:contentRoot:collectionsRoot:discoveredCollections:privateDiscoveredCollections:discoveredInvalidCollections:invalidDependecies:hasCycle:plistSuffix:bundle:].cold.3();
      goto LABEL_25;
    }
  }
  v70 = v21;
  v26 = -[NTKPigmentCollection initWithName:]([NTKPigmentCollection alloc], "initWithName:", v17);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = (void *)MEMORY[0x1E0C99E10];
    -[NTKPlistPigmentEditOptionLoader colorOptionsFromPListItems:collectionName:applyConfig:plistSuffix:bundle:](self, "colorOptionsFromPListItems:collectionName:applyConfig:plistSuffix:bundle:", v18, v17, 0, v23, v24);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "orderedSetWithArray:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKPigmentCollection setItems:](v26, "setItems:", v29);

    goto LABEL_37;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_37;
  v30 = v18;
  objc_msgSend(v22, "addObject:", v17);
  v69 = v30;
  -[NTKPlistPigmentEditOptionLoader configurationFromNode:collectionName:](self, "configurationFromNode:collectionName:", v30, v17);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKPigmentCollection setConfig:](v26, "setConfig:", v31);

  -[NTKPigmentCollection config](v26, "config");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "featureFlag");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v33)
    goto LABEL_44;
  -[NTKPigmentCollection config](v26, "config");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "featureFlag");
  v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v35, "cStringUsingEncoding:", 1);
  v36 = _os_feature_enabled_impl();

  if ((v36 & 1) != 0)
  {
LABEL_44:
    if (!self->_includesAllDeviceSpecificColors)
    {
      -[NTKPigmentCollection config](v26, "config");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "sku");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (v38 && self->_sku)
      {
        v65 = v38;
        -[NTKPigmentCollection config](v26, "config");
        v67 = v37;
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "sku");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "isEqualToNumber:", self->_sku);

        if ((v41 & 1) == 0)
        {
          _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            -[NTKPigmentCollection config](v26, "config");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "sku");
            v44 = (NTKPigmentCollection *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v77 = v44;
            v78 = 2114;
            v79 = v17;
            v45 = "#plist-loader Collection is sku only %{public}@. Ignoring %{public}@";
LABEL_23:
            _os_log_impl(&dword_1B72A3000, v42, OS_LOG_TYPE_DEFAULT, v45, buf, 0x16u);

            goto LABEL_24;
          }
          goto LABEL_24;
        }
      }
      else
      {

      }
    }
    v68 = v22;
    -[NTKPigmentCollection collectionName](v26, "collectionName");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKPigmentCollection config](v26, "config");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKPlistPigmentEditOptionLoader loadNestedCollectionsFromNode:parent:config:plistSuffix:bundle:](self, "loadNestedCollectionsFromNode:parent:config:plistSuffix:bundle:", v69, v47, v48, v23, v24);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v66 = v49;
    if (v49)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v72);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v73[0] = MEMORY[0x1E0C809B0];
      v73[1] = 3221225472;
      v73[2] = __217__NTKPlistPigmentEditOptionLoader_discoverCollectionWithName_contentRoot_collectionsRoot_discoveredCollections_privateDiscoveredCollections_discoveredInvalidCollections_invalidDependecies_hasCycle_plistSuffix_bundle___block_invoke;
      v73[3] = &unk_1E6BD6528;
      v74 = v72;
      v51 = v50;
      v75 = v51;
      objc_msgSend(v49, "enumerateObjectsUsingBlock:", v73);

    }
    else
    {
      v51 = 0;
    }
    -[NTKPigmentCollection config](v26, "config");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKPlistPigmentEditOptionLoader itemsFromNode:collectionName:applyingConfig:plistSuffix:bundle:](self, "itemsFromNode:collectionName:applyingConfig:plistSuffix:bundle:", v69, v17, v52, v23, v24);
    v64 = objc_claimAutoreleasedReturnValue();

    v53 = (void *)objc_msgSend(v68, "mutableCopy");
    -[NTKPlistPigmentEditOptionLoader importedCollectionsWithNode:sharedCollectionsRoot:parent:discoveredCollections:privateDiscoveredCollections:discoveredInvalidCollections:invalidDependencies:hasCycle:plistSuffix:bundle:](self, "importedCollectionsWithNode:sharedCollectionsRoot:parent:discoveredCollections:privateDiscoveredCollections:discoveredInvalidCollections:invalidDependencies:hasCycle:plistSuffix:bundle:", v69, v71, v17, v72, v51, v70, v53, a10, v23, v24);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKPigmentCollection setCollections:](v26, "setCollections:", v54);

    v55 = *a10;
    if (*a10)
    {
      v56 = (void *)v64;
      _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        -[NTKPlistPigmentEditOptionLoader discoverCollectionWithName:contentRoot:collectionsRoot:discoveredCollections:privateDiscoveredCollections:discoveredInvalidCollections:invalidDependecies:hasCycle:plistSuffix:bundle:].cold.2();

      objc_msgSend(v70, "addObject:", v17);
      v20 = v72;
    }
    else
    {
      -[NTKPigmentCollection config](v26, "config");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "removeExcludedItemsFromList:", v64);

      -[NTKPigmentCollection config](v26, "config");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "applyCollectionOverrideNameOnItems:", v64);

      -[NTKPigmentCollection setItems:](v26, "setItems:", v64);
      -[NTKPigmentCollection config](v26, "config");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "defaultGalleryColorNames");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKPigmentCollection setDefaultGalleryColorWithNames:](v26, "setDefaultGalleryColorWithNames:", v61);

      v20 = v72;
      v56 = (void *)v64;
    }

    v22 = v68;
    if (v55)
    {
      v46 = 0;
LABEL_40:
      v19 = v71;
      v21 = v70;
      goto LABEL_41;
    }
LABEL_37:
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v77 = v26;
      _os_log_impl(&dword_1B72A3000, v62, OS_LOG_TYPE_INFO, "#plist-loader Collection discovered: %{public}@", buf, 0xCu);
    }

    v26 = v26;
    v46 = v26;
    goto LABEL_40;
  }
  _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    -[NTKPigmentCollection config](v26, "config");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "featureFlag");
    v44 = (NTKPigmentCollection *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v77 = v44;
    v78 = 2114;
    v79 = v17;
    v45 = "#plist-loader Feature flag %{public}@ is disabled. Ignoring collection %{public}@";
    goto LABEL_23;
  }
LABEL_24:
  v19 = v71;
  v20 = v72;
  v21 = v70;

LABEL_25:
  v46 = 0;
LABEL_41:

  return v46;
}

void __217__NTKPlistPigmentEditOptionLoader_discoverCollectionWithName_contentRoot_collectionsRoot_discoveredCollections_privateDiscoveredCollections_discoveredInvalidCollections_invalidDependecies_hasCycle_plistSuffix_bundle___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "collectionName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v11, "collectionName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v5);

    v6 = *(void **)(a1 + 40);
    objc_msgSend(v11, "collectionName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, v7);

    objc_msgSend(v11, "collectionName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v11, v10);
  }

}

- (id)loadNestedCollectionsFromNode:(id)a3 parent:(id)a4 config:(id)a5 plistSuffix:(id)a6 bundle:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  NTKPlistPigmentEditOptionLoader *v27;
  id v28;
  id v29;
  id v30;
  id v31;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("collections"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[NTKPlistPigmentEditOptionLoader loadNestedCollectionsFromNode:parent:config:plistSuffix:bundle:].cold.1(v22);
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[NTKPlistPigmentEditOptionLoader loadNestedCollectionsFromNode:parent:config:plistSuffix:bundle:].cold.2();
LABEL_8:

    v21 = 0;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __98__NTKPlistPigmentEditOptionLoader_loadNestedCollectionsFromNode_parent_config_plistSuffix_bundle___block_invoke;
  v24[3] = &unk_1E6BD6550;
  v25 = v12;
  v26 = v13;
  v27 = self;
  v28 = v15;
  v29 = v16;
  v30 = v14;
  v19 = v18;
  v31 = v19;
  objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v24);
  v20 = v31;
  v21 = v19;

LABEL_9:
  return v21;
}

void __98__NTKPlistPigmentEditOptionLoader_loadNestedCollectionsFromNode_parent_config_plistSuffix_bundle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), *(_QWORD *)(a1 + 40), CFSTR("."), v5);
    v7 = objc_claimAutoreleasedReturnValue();
    v13 = 0;
    objc_msgSend(*(id *)(a1 + 48), "discoverCollectionWithName:contentRoot:collectionsRoot:discoveredCollections:privateDiscoveredCollections:discoveredInvalidCollections:invalidDependecies:hasCycle:plistSuffix:bundle:", v7, v6, 0, 0, 0, 0, 0, &v13, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "items");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "mutableCopy");

      if (v11)
      {
        v12 = (void *)objc_msgSend(*(id *)(a1 + 48), "copyItemsApplyingConfiguration:configuration:", v11, *(_QWORD *)(a1 + 72));

        objc_msgSend(*(id *)(a1 + 72), "applyCollectionOverrideNameOnItems:", v12);
        objc_msgSend(v9, "setItems:", v12);

      }
      objc_msgSend(*(id *)(a1 + 80), "addObject:", v9);
    }

  }
  else
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __98__NTKPlistPigmentEditOptionLoader_loadNestedCollectionsFromNode_parent_config_plistSuffix_bundle___block_invoke_cold_1((uint64_t)v6, a1, v7);
  }

}

- (id)importedCollectionsWithNode:(id)a3 sharedCollectionsRoot:(id)a4 parent:(id)a5 discoveredCollections:(id)a6 privateDiscoveredCollections:(id)a7 discoveredInvalidCollections:(id)a8 invalidDependencies:(id)a9 hasCycle:(BOOL *)a10 plistSuffix:(id)a11 bundle:(id)a12
{
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  id v31;
  id v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v41 = a4;
  v40 = a5;
  v39 = a6;
  v38 = a7;
  v37 = a8;
  v36 = a9;
  v18 = a11;
  v19 = a12;
  v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v35 = v17;
  -[NTKPlistPigmentEditOptionLoader alternativePropertyNamesForProperty:inNode:](self, "alternativePropertyNamesForProperty:inNode:", CFSTR("imports"), v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", CFSTR("imports"));
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v21 = v20;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v43;
    while (2)
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v43 != v24)
          objc_enumerationMutation(v21);
        v26 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v35, "objectForKeyedSubscript:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKPlistPigmentEditOptionLoader importedCollectionsFromImports:propertyName:sharedCollectionsRoot:parent:discoveredCollections:privateDiscoveredCollections:discoveredInvalidCollections:invalidDependencies:hasCycle:plistSuffix:bundle:](self, "importedCollectionsFromImports:propertyName:sharedCollectionsRoot:parent:discoveredCollections:privateDiscoveredCollections:discoveredInvalidCollections:invalidDependencies:hasCycle:plistSuffix:bundle:", v27, v26, v41, v40, v39, v38, v37, v36, a10, v18, v19);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
          objc_msgSend(v34, "addObjectsFromArray:", v28);
        v29 = *a10;

        if (v29)
        {

          v31 = 0;
          v30 = v34;
          goto LABEL_13;
        }
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      if (v23)
        continue;
      break;
    }
  }

  v30 = v34;
  v31 = v34;
LABEL_13:

  return v31;
}

- (id)importedCollectionsFromImports:(id)a3 propertyName:(id)a4 sharedCollectionsRoot:(id)a5 parent:(id)a6 discoveredCollections:(id)a7 privateDiscoveredCollections:(id)a8 discoveredInvalidCollections:(id)a9 invalidDependencies:(id)a10 hasCycle:(BOOL *)a11 plistSuffix:(id)a12 bundle:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  NSObject *v33;
  NTKPigmentCollection *v34;
  void *v35;
  void *v36;
  BOOL v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  NSObject *v46;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  id obj;
  NSObject *log;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t v65[128];
  uint8_t buf[4];
  uint64_t v67;
  __int16 v68;
  id v69;
  __int16 v70;
  uint64_t v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v52 = a3;
  v18 = a4;
  v54 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v53 = a9;
  v22 = a10;
  v56 = a12;
  v23 = a13;
  _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    -[NTKPlistPigmentEditOptionLoader importedCollectionsFromImports:propertyName:sharedCollectionsRoot:parent:discoveredCollections:privateDiscoveredCollections:discoveredInvalidCollections:invalidDependencies:hasCycle:plistSuffix:bundle:].cold.2();
  v55 = v23;

  if (v21)
  {
    v25 = v21;

    v20 = v25;
  }
  v26 = v52;
  if (!v52)
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    log = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
      -[NTKPlistPigmentEditOptionLoader importedCollectionsFromImports:propertyName:sharedCollectionsRoot:parent:discoveredCollections:privateDiscoveredCollections:discoveredInvalidCollections:invalidDependencies:hasCycle:plistSuffix:bundle:].cold.1();
    goto LABEL_38;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    log = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v67 = (uint64_t)v18;
      v68 = 2048;
      v69 = v19;
      v70 = 2114;
      v71 = objc_opt_class();
      _os_log_error_impl(&dword_1B72A3000, log, OS_LOG_TYPE_ERROR, "#plist-loader '%{public}@' for %public}@ found with incorrect type - It should be an array but it was %{public}@. Returning empty items for dependencies", buf, 0x20u);
    }
LABEL_38:
    v46 = MEMORY[0x1E0C9AA60];
    goto LABEL_46;
  }
  v48 = v21;
  v49 = v18;
  log = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = v52;
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
  v28 = v55;
  v29 = v56;
  if (v27)
  {
    v30 = v27;
    v60 = *(_QWORD *)v62;
    v50 = v22;
    v51 = v19;
    while (2)
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v62 != v60)
          objc_enumerationMutation(obj);
        v32 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[NTKPlistPigmentEditOptionLoader colorOptionsFromPListItems:collectionName:applyConfig:plistSuffix:bundle:](self, "colorOptionsFromPListItems:collectionName:applyConfig:plistSuffix:bundle:", v32, v19, 0, v29, v28);
          v33 = objc_claimAutoreleasedReturnValue();
          if (v33)
          {
            v34 = -[NTKPigmentCollection initWithName:]([NTKPigmentCollection alloc], "initWithName:", v19);
            objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithArray:", v33);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            -[NTKPigmentCollection setItems:](v34, "setItems:", v35);

            -[NSObject addObject:](log, "addObject:", v34);
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v33 = v32;
            objc_msgSend(v20, "objectForKeyedSubscript:", v33);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v22, "containsObject:", v33))
              v37 = v36 == 0;
            else
              v37 = 0;
            if (v37)
            {
              *a11 = 1;
LABEL_41:

              goto LABEL_42;
            }
            if (v36)
            {
              -[NSObject addObject:](log, "addObject:", v36);
            }
            else
            {
              objc_msgSend(v54, "objectForKeyedSubscript:", v33);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = objc_msgSend(v22, "mutableCopy");
              v41 = v20;
              v42 = (void *)v40;
              v43 = v41;
              -[NTKPlistPigmentEditOptionLoader discoverCollectionWithName:contentRoot:collectionsRoot:discoveredCollections:privateDiscoveredCollections:discoveredInvalidCollections:invalidDependecies:hasCycle:plistSuffix:bundle:](self, "discoverCollectionWithName:contentRoot:collectionsRoot:discoveredCollections:privateDiscoveredCollections:discoveredInvalidCollections:invalidDependecies:hasCycle:plistSuffix:bundle:", v33, v39, v54, v40, a11, v29, v28);
              v44 = (void *)objc_claimAutoreleasedReturnValue();

              if (*a11)
              {

                v20 = v43;
                v22 = v50;
                v19 = v51;
                goto LABEL_41;
              }
              if (v44)
              {
                -[NSObject addObject:](log, "addObject:", v44);
                objc_msgSend(v44, "collectionName");
                v45 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "setObject:forKeyedSubscript:", v44, v45);
              }
              else
              {
                _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
                v45 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v67 = (uint64_t)v33;
                  _os_log_error_impl(&dword_1B72A3000, v45, OS_LOG_TYPE_ERROR, "#plist-loader %{public}@ collection does not exist.", buf, 0xCu);
                }
              }

              v20 = v43;
              v22 = v50;
              v19 = v51;
              v28 = v55;
              v29 = v56;
            }

          }
          else
          {
            _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              v38 = objc_opt_class();
              *(_DWORD *)buf = 138543618;
              v67 = v38;
              v68 = 2114;
              v69 = v19;
              _os_log_error_impl(&dword_1B72A3000, v33, OS_LOG_TYPE_ERROR, "#plist-loader dependency entry should be either String or Array - %{public}@ - Parent: %{public}@", buf, 0x16u);
            }
          }
        }

      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
      if (v30)
        continue;
      break;
    }
  }
LABEL_42:

  if (*a11)
  {
    v46 = 0;
  }
  else
  {
    v46 = log;
    log = v46;
  }
  v26 = v52;
  v21 = v48;
  v18 = v49;
LABEL_46:

  return v46;
}

- (id)configurationFromNode:(id)a3 collectionName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NTKPlistPigmentEditOptionLoader configurationWithName:fromNode:collectionName:](self, "configurationWithName:fromNode:collectionName:", CFSTR("config"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NTKPlistPigmentEditOptionLoader alternativePropertyNamesForProperty:inNode:](self, "alternativePropertyNamesForProperty:inNode:", CFSTR("config"), v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        -[NTKPlistPigmentEditOptionLoader configurationWithName:fromNode:collectionName:](self, "configurationWithName:fromNode:collectionName:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), v6, v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "overridePropertiesFromConfig:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)configurationWithName:(id)a3 fromNode:(id)a4 collectionName:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v8 = a3;
  v9 = a5;
  objc_msgSend(a4, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[NTKPlistPigmentEditOptionLoader configurationFromNode:](self, "configurationFromNode:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[NTKPlistPigmentEditOptionLoader configurationWithName:fromNode:collectionName:].cold.1();

    v11 = 0;
  }

  return v11;
}

- (id)configurationFromNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NTKPigmentCollectionConfig *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  NTKPlistPigmentEditOptionLoader *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  NTKPlistPigmentEditOptionLoader *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __CFString *v36;
  int v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  NSObject *v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  const __CFString *v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  NSObject *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t i;
  const __CFString *v74;
  NSObject *v75;
  void *v76;
  void *v78;
  NTKPigmentCollectionConfig *v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  __CFString *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  uint64_t v96;
  __CFString *v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  uint8_t v102[128];
  uint8_t buf[4];
  const __CFString *v104;
  __int16 v105;
  id v106;
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shared-config"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "length")
      || (-[NTKPlistPigmentEditOptionLoader sharedConfigs](self, "sharedConfigs"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "objectForKeyedSubscript:", v5),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v6,
          !v7)
      || (v8 = (NTKPigmentCollectionConfig *)objc_msgSend(v7, "copy"), v7, !v8))
    {
      v8 = objc_alloc_init(NTKPigmentCollectionConfig);
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sensitivity"));
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[NTKPigmentCollectionConfig setSensitivity:](v8, "setSensitivity:", v9);
      }
      else
      {
        _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[NTKPlistPigmentEditOptionLoader configurationFromNode:].cold.12(v12, v13, v14);

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAddable"));
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[NTKPigmentCollectionConfig setIsAddable:](v8, "setIsAddable:", v15);
      }
      else
      {
        _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[NTKPlistPigmentEditOptionLoader configurationFromNode:].cold.11(v16, v17, v18);

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("supports-slider"));
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[NTKPigmentCollectionConfig setSupportsSlider:](v8, "setSupportsSlider:", v19);
      }
      else
      {
        _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[NTKPlistPigmentEditOptionLoader configurationFromNode:].cold.10(v20, v21, v22);

      }
    }
    v23 = (void *)v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("default"));
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v25 = self;
    -[NTKPlistPigmentEditOptionLoader alternativePropertyNamesForProperty:inNode:includesAllDeviceSpecificColors:](self, "alternativePropertyNamesForProperty:inNode:includesAllDeviceSpecificColors:", CFSTR("default"), v4, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = v26;
    if (objc_msgSend(v26, "count"))
    {
      objc_msgSend(v26, "lastObject");
      v97 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      if (v27)
      {
        v29 = v27;
        v30 = v24;
        v24 = v29;

      }
      v31 = v25;
      v95 = v24;

    }
    else
    {
      v95 = v24;
      v97 = CFSTR("default");
      v31 = v25;
    }
    v32 = v5;
    v90 = (void *)v19;
    -[NTKPigmentCollectionConfig defaultConfigAttributeName](v8, "defaultConfigAttributeName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v23;
    v91 = (void *)v15;
    if (v33)
    {
      -[NTKPigmentCollectionConfig defaultConfigAttributeName](v8, "defaultConfigAttributeName");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v97;
      v37 = -[__CFString isEqual:](v97, "isEqual:", v35);

    }
    else
    {
      v37 = 1;
      v36 = v97;
    }

    -[NTKPigmentCollectionConfig setDefaultConfigAttributeName:](v8, "setDefaultConfigAttributeName:", v36);
    v38 = v95;
    if (v95)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v37)
          -[NTKPigmentCollectionConfig setDefaultColorOptionName:](v8, "setDefaultColorOptionName:", v95);
        else
          -[NTKPigmentCollectionConfig setFallbackDefaultColorOptionName:](v8, "setFallbackDefaultColorOptionName:", v95);
      }
      else
      {
        _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          -[NTKPlistPigmentEditOptionLoader configurationFromNode:].cold.9(v39, v40, v41);

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("migration"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[NTKPigmentCollectionConfig setMigration:](v8, "setMigration:", v42);
      }
      else
      {
        _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          -[NTKPlistPigmentEditOptionLoader configurationFromNode:].cold.8((uint64_t)v42, v43);

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("feature-flag"));
    v44 = objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[NTKPigmentCollectionConfig setFeatureFlag:](v8, "setFeatureFlag:", v44);
      }
      else
      {
        _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          -[NTKPlistPigmentEditOptionLoader configurationFromNode:].cold.7(v44, v45);

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sku"));
    v96 = objc_claimAutoreleasedReturnValue();
    if (v96)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[NTKPigmentCollectionConfig setSku:](v8, "setSku:", v96);
      }
      else
      {
        _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          -[NTKPlistPigmentEditOptionLoader configurationFromNode:].cold.6(v44, v46);

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sortedByHue"));
    v47 = objc_claimAutoreleasedReturnValue();
    v88 = (void *)v47;
    if (v47)
    {
      v48 = v47;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[NTKPigmentCollectionConfig setSortedByHue:](v8, "setSortedByHue:", v48);
      }
      else
      {
        _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          -[NTKPlistPigmentEditOptionLoader configurationFromNode:].cold.5(v44, v49);

      }
    }
    v50 = CFSTR("exclusions");
    -[NTKPlistPigmentEditOptionLoader alternativePropertyNamesForProperty:inNode:includesAllDeviceSpecificColors:](v31, "alternativePropertyNamesForProperty:inNode:includesAllDeviceSpecificColors:", CFSTR("exclusions"), v4, 0);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v94, "count") == 1)
    {
      _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v104 = CFSTR("exclusions");
        v105 = 2114;
        v106 = v4;
        _os_log_impl(&dword_1B72A3000, v51, OS_LOG_TYPE_DEFAULT, "#plist-loader Retrieving alternative property for %{public}@ - %{public}@", buf, 0x16u);
      }

      objc_msgSend(v94, "firstObject");
      v50 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    v87 = (__CFString *)v50;
    v89 = (void *)v44;
    objc_msgSend(v4, "objectForKeyedSubscript:", v50);
    v52 = objc_claimAutoreleasedReturnValue();
    v92 = (void *)v52;
    if (v52)
    {
      v53 = v52;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[NTKPigmentCollectionConfig setExclusions:](v8, "setExclusions:", v53);
      }
      else
      {
        _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          -[NTKPlistPigmentEditOptionLoader configurationFromNode:].cold.4((uint64_t)v92, v54);

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("excludes-duotone"));
    v55 = objc_claimAutoreleasedReturnValue();
    v86 = (void *)v55;
    if (v55)
    {
      v56 = v55;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[NTKPigmentCollectionConfig setExcludesDuotone:](v8, "setExcludesDuotone:", v56);
      }
      else
      {
        _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          -[NTKPlistPigmentEditOptionLoader configurationFromNode:].cold.3(v57, v58, v59);

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("collectionOverride"));
    v60 = objc_claimAutoreleasedReturnValue();
    if (v60)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[NTKPigmentCollectionConfig setCollectionOverride:](v8, "setCollectionOverride:", v60);
      }
      else
      {
        _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          -[NTKPlistPigmentEditOptionLoader configurationFromNode:].cold.2(v60, v61);

      }
    }
    v85 = (void *)v60;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gallery-default"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKPlistPigmentEditOptionLoader alternativePropertyNamesForProperty:inNode:](v31, "alternativePropertyNamesForProperty:inNode:", CFSTR("gallery-default"), v4);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = v63;
    if (objc_msgSend(v63, "count") == 1)
    {
      objc_msgSend(v63, "firstObject");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v64);
      v65 = objc_claimAutoreleasedReturnValue();

      v62 = (void *)v65;
      v38 = v95;
    }
    v66 = v93;
    v67 = (void *)v96;
    if (v62)
    {
      v83 = v42;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v79 = v8;
        v80 = v34;
        v81 = v32;
        v82 = v4;
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v62, "count"));
        v68 = objc_claimAutoreleasedReturnValue();
        v98 = 0u;
        v99 = 0u;
        v100 = 0u;
        v101 = 0u;
        v78 = v62;
        v69 = v62;
        v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v98, v102, 16);
        if (v70)
        {
          v71 = v70;
          v72 = *(_QWORD *)v99;
          do
          {
            for (i = 0; i != v71; ++i)
            {
              if (*(_QWORD *)v99 != v72)
                objc_enumerationMutation(v69);
              v74 = *(const __CFString **)(*((_QWORD *)&v98 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
                v75 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v104 = v74;
                  _os_log_error_impl(&dword_1B72A3000, v75, OS_LOG_TYPE_ERROR, "config.gallery-default Ignoring one gallery option because is it not a string type. %{public}@", buf, 0xCu);
                }

              }
              -[NSObject addObject:](v68, "addObject:", v74, v78);
            }
            v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v98, v102, 16);
          }
          while (v71);
        }

        v8 = v79;
        -[NTKPigmentCollectionConfig setDefaultGalleryColorNames:](v79, "setDefaultGalleryColorNames:", v68);
        v32 = v81;
        v4 = v82;
        v34 = v80;
        v38 = v95;
        v67 = (void *)v96;
        v66 = v93;
        v62 = v78;
      }
      else
      {
        _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
        v68 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          -[NTKPlistPigmentEditOptionLoader configurationFromNode:].cold.1((uint64_t)v62, v68);
      }

      v42 = v83;
    }
    v76 = v62;
    v10 = v8;

    v11 = v10;
  }
  else
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[NTKPlistPigmentEditOptionLoader configurationFromNode:].cold.13();
    v11 = 0;
  }

  return v11;
}

- (BOOL)hasFileLevelSensitiveUIConfig:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("sensitivity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = objc_msgSend(v3, "integerValue");
    objc_msgSend(MEMORY[0x1E0C94518], "sharedMonitor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "considersUISensitivitySensitive:", v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)skuFileLevel:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("sku"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)itemsFromNode:(id)a3 collectionName:(id)a4 applyingConfig:(id)a5 plistSuffix:(id)a6 bundle:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NTKPlistPigmentEditOptionLoader *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id obj;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v30 = a5;
  v29 = a6;
  v14 = a7;
  v15 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v16 = self;
  -[NTKPlistPigmentEditOptionLoader alternativePropertyNamesForProperty:inNode:](self, "alternativePropertyNamesForProperty:inNode:", CFSTR("items"), v12);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v32 != v19)
          objc_enumerationMutation(obj);
        v21 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v36 = v21;
          v37 = 2114;
          v38 = v13;
          v39 = 2114;
          v40 = v12;
          _os_log_impl(&dword_1B72A3000, v22, OS_LOG_TYPE_DEFAULT, "#plist-loader Retrieving alternative property for %{public}@ - collection name: %{public}@, node: %{public}@", buf, 0x20u);
        }

        objc_msgSend(v12, "objectForKeyedSubscript:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKPlistPigmentEditOptionLoader colorOptionsFromPListItems:collectionName:applyConfig:plistSuffix:bundle:](v16, "colorOptionsFromPListItems:collectionName:applyConfig:plistSuffix:bundle:", v23, v13, v30, v29, v14);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObjectsFromArray:", v24);

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
    }
    while (v18);
  }

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("items"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKPlistPigmentEditOptionLoader colorOptionsFromPListItems:collectionName:applyConfig:plistSuffix:bundle:](v16, "colorOptionsFromPListItems:collectionName:applyConfig:plistSuffix:bundle:", v25, v13, v30, v29, v14);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObjectsFromArray:", v26);

  return v15;
}

- (BOOL)isValidPigment:(id)a3
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  int v14;

  v3 = a3;
  os_unfair_lock_lock(&isValidPigment____lock);
  WeakRetained = objc_loadWeakRetained(&isValidPigment____cachedDevice);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_loadWeakRetained(&isValidPigment____cachedDevice);
    if (v6 == v7)
    {
      objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "version");
      v10 = isValidPigment____previousCLKDeviceVersion;

      if (v9 == v10)
        goto LABEL_6;
    }
    else
    {

    }
  }
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak(&isValidPigment____cachedDevice, v11);

  v12 = objc_loadWeakRetained(&isValidPigment____cachedDevice);
  isValidPigment____previousCLKDeviceVersion = objc_msgSend(v12, "version");

  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  isValidPigment____isOfTheBear = NTKGizmoOrCompanionAreRussian(v13);

LABEL_6:
  os_unfair_lock_unlock(&isValidPigment____lock);
  if (v3)
  {
    if (isValidPigment____isOfTheBear)
      v14 = objc_msgSend(v3, "isPrideOption") ^ 1;
    else
      LOBYTE(v14) = 1;
  }
  else
  {
    LOBYTE(v14) = 0;
  }

  return v14;
}

- (id)colorOptionsFromPListItems:(id)a3 collectionName:(id)a4 applyConfig:(id)a5 plistSuffix:(id)a6 bundle:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  NTKPigmentEditOption *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  id v43;
  id v44;
  NSObject *v45;
  id v46;
  id obj;
  void *v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint8_t v63[128];
  uint8_t buf[4];
  uint64_t v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v44 = a5;
  v14 = a6;
  v15 = a7;
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          -[NTKPlistPigmentEditOptionLoader colorOptionsFromPListItems:collectionName:applyConfig:plistSuffix:bundle:].cold.1(v34, v40, v41);
        goto LABEL_56;
      }
    }
    objc_opt_class();
    v46 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v45 = objc_claimAutoreleasedReturnValue();
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v43 = v12;
      obj = v12;
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
      v18 = v44;
      if (!v17)
        goto LABEL_41;
      v19 = v17;
      v49 = *(_QWORD *)v59;
      v48 = v15;
      while (1)
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v59 != v49)
            objc_enumerationMutation(obj);
          v21 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v22 = -[NTKPigmentEditOption initWithOptionName:collectionName:]([NTKPigmentEditOption alloc], "initWithOptionName:collectionName:", v21, v13);
            if (!-[NTKPlistPigmentEditOptionLoader isValidPigment:](self, "isValidPigment:", v22))
            {
              _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
              v33 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v65 = v21;
                _os_log_impl(&dword_1B72A3000, v33, OS_LOG_TYPE_DEFAULT, "#plist-loader Edit option item found but failed to create NTKPigmentEditOption. Could be locale related. Ignoring it. %{public}@", buf, 0xCu);
              }

LABEL_36:
              v15 = v48;
              goto LABEL_39;
            }
            -[NTKPigmentEditOption setFromStore:](v22, "setFromStore:", 1);
            if (v14)
              -[NTKPigmentEditOption setAlternativeLocalizedStringTableName:](v22, "setAlternativeLocalizedStringTableName:", v14);
            objc_msgSend(v15, "bundlePath");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject bundlePath](v45, "bundlePath");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v23, "isEqualToString:", v24);

            v15 = v48;
            if ((v25 & 1) == 0 && objc_msgSend(v48, "principalClass"))
            {
              NSStringFromClass((Class)objc_msgSend(v48, "principalClass"));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[NTKPigmentEditOption setBundlePrincipalClassName:](v22, "setBundlePrincipalClassName:", v26);

            }
            -[NTKPlistPigmentEditOptionLoader applyConfigurationOnEditOption:configuration:](self, "applyConfigurationOnEditOption:configuration:", v22, v18);
            if (!-[NTKPigmentEditOption isSensitiveUI](v22, "isSensitiveUI") || !self->_ignoreSensitiveUIItems)
              objc_msgSend(v16, "addObject:", v22);
            v14 = v46;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[NTKPlistPigmentEditOptionLoader colorOptionsFromItemsDictionary:collectionName:applyConfig:plistSuffix:bundle:](self, "colorOptionsFromItemsDictionary:collectionName:applyConfig:plistSuffix:bundle:", v21, v13, v18, v14, v15);
              v22 = (NTKPigmentEditOption *)objc_claimAutoreleasedReturnValue();
              v54 = 0u;
              v55 = 0u;
              v56 = 0u;
              v57 = 0u;
              v27 = -[NTKPigmentEditOption countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
              if (!v27)
                goto LABEL_39;
              v28 = v27;
              v29 = v13;
              v30 = *(_QWORD *)v55;
              do
              {
                for (j = 0; j != v28; ++j)
                {
                  if (*(_QWORD *)v55 != v30)
                    objc_enumerationMutation(v22);
                  v32 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
                  if (!objc_msgSend(v32, "isSensitiveUI") || !self->_ignoreSensitiveUIItems)
                    objc_msgSend(v16, "addObject:", v32);
                }
                v28 = -[NTKPigmentEditOption countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
              }
              while (v28);
              v13 = v29;
              v18 = v44;
              v14 = v46;
              goto LABEL_36;
            }
            _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
            v22 = (NTKPigmentEditOption *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(&v22->super.super, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v65 = v21;
              _os_log_error_impl(&dword_1B72A3000, &v22->super.super, OS_LOG_TYPE_ERROR, "#plist-loader Edit option item found with incorrect type -  It should be a string or a dictionary. Ignoring it. %{public}@", buf, 0xCu);
            }
          }
LABEL_39:

        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
        if (!v19)
        {
LABEL_41:

          v12 = v43;
          v34 = v45;
          goto LABEL_56;
        }
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NTKPlistPigmentEditOptionLoader colorOptionsFromItemsDictionary:collectionName:applyConfig:plistSuffix:bundle:](self, "colorOptionsFromItemsDictionary:collectionName:applyConfig:plistSuffix:bundle:", v12, v13, v44, v14, v15);
      v34 = objc_claimAutoreleasedReturnValue();
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v35 = -[NSObject countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v51;
        do
        {
          for (k = 0; k != v36; ++k)
          {
            if (*(_QWORD *)v51 != v37)
              objc_enumerationMutation(v34);
            v39 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * k);
            if (!objc_msgSend(v39, "isSensitiveUI") || !self->_ignoreSensitiveUIItems)
              objc_msgSend(v16, "addObject:", v39);
          }
          v36 = -[NSObject countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
        }
        while (v36);
        v14 = v46;
      }
LABEL_56:

    }
  }

  return v16;
}

- (id)colorOptionsFromItemsDictionary:(id)a3 collectionName:(id)a4 applyConfig:(id)a5 plistSuffix:(id)a6 bundle:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  objc_class *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  _QWORD v29[4];
  id v30;
  NTKPlistPigmentEditOptionLoader *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = (objc_class *)MEMORY[0x1E0C99DE8];
  v17 = a3;
  v18 = objc_alloc_init(v16);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __113__NTKPlistPigmentEditOptionLoader_colorOptionsFromItemsDictionary_collectionName_applyConfig_plistSuffix_bundle___block_invoke;
  v29[3] = &unk_1E6BD6578;
  v30 = v12;
  v31 = self;
  v32 = v14;
  v33 = v15;
  v34 = v19;
  v35 = v13;
  v20 = v18;
  v36 = v20;
  v21 = v13;
  v22 = v19;
  v23 = v15;
  v24 = v14;
  v25 = v12;
  objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v29);

  objc_msgSend(v20, "sortUsingComparator:", &__block_literal_global_118);
  v26 = v36;
  v27 = v20;

  return v27;
}

void __113__NTKPlistPigmentEditOptionLoader_colorOptionsFromItemsDictionary_collectionName_applyConfig_plistSuffix_bundle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NTKPigmentEditOption *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = -[NTKPigmentEditOption initWithOptionName:collectionName:]([NTKPigmentEditOption alloc], "initWithOptionName:collectionName:", v5, *(_QWORD *)(a1 + 32));
    if (objc_msgSend(*(id *)(a1 + 40), "isValidPigment:", v6))
    {
      -[NTKPigmentEditOption setFromStore:](v6, "setFromStore:", 1);
      if (*(_QWORD *)(a1 + 48))
        -[NTKPigmentEditOption setAlternativeLocalizedStringTableName:](v6, "setAlternativeLocalizedStringTableName:");
      objc_msgSend(*(id *)(a1 + 56), "bundlePath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "bundlePath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

      if ((v9 & 1) == 0 && objc_msgSend(*(id *)(a1 + 56), "principalClass"))
      {
        NSStringFromClass((Class)objc_msgSend(*(id *)(a1 + 56), "principalClass"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKPigmentEditOption setBundlePrincipalClassName:](v6, "setBundlePrincipalClassName:", v10);

      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "integerValue"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKPigmentEditOption setDesiredPosition:](v6, "setDesiredPosition:", v11);

      objc_msgSend(*(id *)(a1 + 40), "applyConfigurationOnEditOption:configuration:", v6, *(_QWORD *)(a1 + 72));
      objc_msgSend(*(id *)(a1 + 80), "addObject:", v6);
    }

  }
}

uint64_t __113__NTKPlistPigmentEditOptionLoader_colorOptionsFromItemsDictionary_collectionName_applyConfig_plistSuffix_bundle___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "desiredPosition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "desiredPosition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)copyItemsApplyingConfiguration:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "copy", (_QWORD)v16);
        -[NTKPlistPigmentEditOptionLoader applyConfigurationOnEditOption:configuration:](self, "applyConfigurationOnEditOption:configuration:", v14, v7);
        if (!objc_msgSend(v14, "isSensitiveUI") || !self->_ignoreSensitiveUIItems)
          objc_msgSend(v8, "addObject:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

- (void)applyConfigurationOnEditOption:(id)a3 configuration:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  id v17;

  v17 = a3;
  v5 = a4;
  objc_msgSend(v5, "sensitivity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  objc_msgSend(MEMORY[0x1E0C94518], "sharedMonitor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v8, "considersUISensitivitySensitive:", v7);

  if ((_DWORD)v7)
    objc_msgSend(v17, "setIsSensitiveUI:", 1);
  objc_msgSend(v5, "sortedByHue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v5, "sortedByHue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setSortedByHue:", objc_msgSend(v10, "BOOLValue"));

  }
  objc_msgSend(v5, "isAddable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  if (v12)
  {
    objc_msgSend(v5, "isAddable");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setIsAddable:", objc_msgSend(v13, "BOOLValue"));

  }
  objc_msgSend(v5, "supportsSlider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  if (v15)
  {
    objc_msgSend(v5, "supportsSlider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setSupportsSlider:", objc_msgSend(v16, "BOOLValue"));

  }
}

- (id)loadPropertyListFromFile:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[NTKPlistPigmentEditOptionLoader loadPropertyListFromFile:].cold.1();

  }
  return v4;
}

- (id)sortedPlistFilesWithMainBundle:(id)a3 faceBundle:(id)a4 additionalBundles:(id)a5
{
  id v8;
  NTKPlistPigmentEditOptionLoader *v9;
  id v10;
  NSArray *plistFiles;
  id v12;
  id v13;
  id v14;
  void *v15;
  NTKPlistBundle *v16;
  id v17;
  uint64_t v18;
  NSMutableArray *v19;
  NSMutableArray *bundlePlistsFromFacesWithoutBundle;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  uint64_t v28;
  NSArray *sortedAdditionalPlistFiles;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[4];
  id v48;
  NTKPlistPigmentEditOptionLoader *v49;
  id v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  uint8_t buf[16];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v39 = a4;
  v38 = a5;
  v9 = self;
  objc_sync_enter(v9);
  v37 = v8;
  if (v9->_plistFiles)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    plistFiles = v9->_plistFiles;
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __95__NTKPlistPigmentEditOptionLoader_sortedPlistFilesWithMainBundle_faceBundle_additionalBundles___block_invoke;
    v55[3] = &unk_1E6BCD908;
    v12 = v10;
    v56 = v12;
    v57 = v8;
    -[NSArray enumerateObjectsUsingBlock:](plistFiles, "enumerateObjectsUsingBlock:", v55);
    v13 = (id)objc_msgSend(v12, "copy");

  }
  else
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v8, "pathForResource:ofType:", CFSTR("FaceColors"), CFSTR(".color.plist"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = -[NTKPlistBundle initWithPlist:bundle:]([NTKPlistBundle alloc], "initWithPlist:bundle:", v15, v8);
      objc_msgSend(v14, "addObject:", v16);

    }
    v34 = v15;
    v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v18 = MEMORY[0x1E0C809B0];
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __95__NTKPlistPigmentEditOptionLoader_sortedPlistFilesWithMainBundle_faceBundle_additionalBundles___block_invoke_2;
    v52[3] = &unk_1E6BD65E0;
    v36 = v17;
    v53 = v36;
    v54 = v39;
    -[NTKPlistPigmentEditOptionLoader enumerateColorEditOptionFilesInBundle:sorted:block:](v9, "enumerateColorEditOptionFilesInBundle:sorted:block:", v54, 1, v52);
    objc_msgSend(v14, "addObjectsFromArray:", v36);
    if (!v9->_sortedAdditionalPlistFiles)
    {
      if (!v9->_bundlePlistsFromFacesWithoutBundle)
      {
        v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        bundlePlistsFromFacesWithoutBundle = v9->_bundlePlistsFromFacesWithoutBundle;
        v9->_bundlePlistsFromFacesWithoutBundle = v19;

      }
      v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v47[0] = v18;
      v47[1] = 3221225472;
      v47[2] = __95__NTKPlistPigmentEditOptionLoader_sortedPlistFilesWithMainBundle_faceBundle_additionalBundles___block_invoke_3;
      v47[3] = &unk_1E6BD6608;
      v48 = v15;
      v49 = v9;
      v50 = v8;
      v22 = v21;
      v51 = v22;
      -[NTKPlistPigmentEditOptionLoader enumerateColorEditOptionFilesInBundle:sorted:block:](v9, "enumerateColorEditOptionFilesInBundle:sorted:block:", v50, 0, v47);
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v23 = v38;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v44 != v25)
              objc_enumerationMutation(v23);
            v27 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
            v40[0] = v18;
            v40[1] = 3221225472;
            v40[2] = __95__NTKPlistPigmentEditOptionLoader_sortedPlistFilesWithMainBundle_faceBundle_additionalBundles___block_invoke_4;
            v40[3] = &unk_1E6BD65E0;
            v41 = v22;
            v42 = v27;
            -[NTKPlistPigmentEditOptionLoader enumerateColorEditOptionFilesInBundle:sorted:block:](v9, "enumerateColorEditOptionFilesInBundle:sorted:block:", v27, 0, v40);

          }
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
        }
        while (v24);
      }

      -[NTKPlistPigmentEditOptionLoader sortedColorPListBundles:](v9, "sortedColorPListBundles:", v22);
      v28 = objc_claimAutoreleasedReturnValue();
      sortedAdditionalPlistFiles = v9->_sortedAdditionalPlistFiles;
      v9->_sortedAdditionalPlistFiles = (NSArray *)v28;

    }
    objc_msgSend(v14, "addObjectsFromArray:", v9->_bundlePlistsFromFacesWithoutBundle, v34);
    objc_msgSend(v14, "addObjectsFromArray:", v9->_sortedAdditionalPlistFiles);
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v14, "ntk_flatDescription");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKPlistPigmentEditOptionLoader sortedPlistFilesWithMainBundle:faceBundle:additionalBundles:].cold.1(v31, buf, v30);
    }

    v32 = v54;
    v13 = v14;

  }
  objc_sync_exit(v9);

  return v13;
}

void __95__NTKPlistPigmentEditOptionLoader_sortedPlistFilesWithMainBundle_faceBundle_additionalBundles___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  NTKPlistBundle *v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = -[NTKPlistBundle initWithPlist:bundle:]([NTKPlistBundle alloc], "initWithPlist:bundle:", v4, *(_QWORD *)(a1 + 40));

  objc_msgSend(v3, "addObject:", v5);
}

void __95__NTKPlistPigmentEditOptionLoader_sortedPlistFilesWithMainBundle_faceBundle_additionalBundles___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  NTKPlistBundle *v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = -[NTKPlistBundle initWithPlist:bundle:]([NTKPlistBundle alloc], "initWithPlist:bundle:", v4, *(_QWORD *)(a1 + 40));

  objc_msgSend(v3, "addObject:", v5);
}

void __95__NTKPlistPigmentEditOptionLoader_sortedPlistFilesWithMainBundle_faceBundle_additionalBundles___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  NTKPlistBundle *v6;
  NTKPlistBundle *v7;
  void *v8;
  id v9;

  v9 = a2;
  if ((objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "plistFacesWithoutFaceBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ntk_extractFileName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "containsObject:", v4);

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 40), "bundlePlistsFromFacesWithoutBundle");
      v6 = (NTKPlistBundle *)objc_claimAutoreleasedReturnValue();
      v7 = -[NTKPlistBundle initWithPlist:bundle:]([NTKPlistBundle alloc], "initWithPlist:bundle:", v9, *(_QWORD *)(a1 + 48));
      -[NTKPlistBundle addObject:](v6, "addObject:", v7);

    }
    else
    {
      v8 = *(void **)(a1 + 56);
      v6 = -[NTKPlistBundle initWithPlist:bundle:]([NTKPlistBundle alloc], "initWithPlist:bundle:", v9, *(_QWORD *)(a1 + 48));
      objc_msgSend(v8, "addObject:", v6);
    }

  }
}

void __95__NTKPlistPigmentEditOptionLoader_sortedPlistFilesWithMainBundle_faceBundle_additionalBundles___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  NTKPlistBundle *v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = -[NTKPlistBundle initWithPlist:bundle:]([NTKPlistBundle alloc], "initWithPlist:bundle:", v4, *(_QWORD *)(a1 + 40));

  objc_msgSend(v3, "addObject:", v5);
}

- (id)plistFacesWithoutFaceBundle
{
  if (plistFacesWithoutFaceBundle_onceToken != -1)
    dispatch_once(&plistFacesWithoutFaceBundle_onceToken, &__block_literal_global_123);
  return (id)plistFacesWithoutFaceBundle_plists;
}

void __62__NTKPlistPigmentEditOptionLoader_plistFacesWithoutFaceBundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6CAA090);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)plistFacesWithoutFaceBundle_plists;
  plistFacesWithoutFaceBundle_plists = v0;

}

- (void)enumerateColorEditOptionFilesInBundle:(id)a3 sorted:(BOOL)a4 block:(id)a5
{
  _BOOL4 v5;
  void (**v7)(id, _QWORD);
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v5 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, _QWORD))a5;
  objc_msgSend(a3, "pathsForResourcesOfType:inDirectory:", CFSTR(".color.plist"), CFSTR("."));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "sortedColorFileNames:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        v7[2](v7, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++));
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

+ (id)sortedColorFileNames:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__NTKPlistPigmentEditOptionLoader_sortedColorFileNames___block_invoke;
  v4[3] = &__block_descriptor_40_e31_q24__0__NSString_8__NSString_16l;
  v4[4] = a1;
  objc_msgSend(a3, "sortedArrayUsingComparator:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __56__NTKPlistPigmentEditOptionLoader_sortedColorFileNames___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;

  v4 = a3;
  v5 = a2;
  v6 = objc_msgSend((id)objc_opt_class(), "compareColorFileNames:otherFileName:fileExtension:", v5, v4, CFSTR(".color.plist"));

  return v6;
}

- (id)sortedColorPListBundles:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__NTKPlistPigmentEditOptionLoader_sortedColorPListBundles___block_invoke;
  v4[3] = &unk_1E6BD6670;
  v4[4] = self;
  objc_msgSend(a3, "sortedArrayUsingComparator:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __59__NTKPlistPigmentEditOptionLoader_sortedColorPListBundles___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  v5 = a2;
  v6 = (void *)objc_opt_class();
  objc_msgSend(v5, "plistFileName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "plistFileName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v6, "compareColorFileNames:otherFileName:fileExtension:", v7, v8, CFSTR(".color.plist"));
  return v9;
}

+ (id)sortedCollectionNamesFromCollections:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_139);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(v4, "copy");
  return v5;
}

uint64_t __72__NTKPlistPigmentEditOptionLoader_sortedCollectionNamesFromCollections___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (id)sortedUniqueOptionNamesFromCollections:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v3;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v19)
  {
    v18 = *(_QWORD *)v28;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v28 != v18)
          objc_enumerationMutation(obj);
        v20 = v5;
        v6 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v5);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(v6, "allItems");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v24;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v24 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
              objc_msgSend(v12, "fullname");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v12, "isMultitoneOption"))
              {
                objc_msgSend(v12, "fullname");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                +[NTKPigmentEditOption multitoneColorNames:](NTKPigmentEditOption, "multitoneColorNames:", v14);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v21[0] = MEMORY[0x1E0C809B0];
                v21[1] = 3221225472;
                v21[2] = __74__NTKPlistPigmentEditOptionLoader_sortedUniqueOptionNamesFromCollections___block_invoke;
                v21[3] = &unk_1E6BCD930;
                v22 = v4;
                objc_msgSend(v15, "enumerateObjectsUsingBlock:", v21);

              }
              else
              {
                objc_msgSend(v4, "addObject:", v13);
              }

            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v9);
        }

        v5 = v20 + 1;
      }
      while (v20 + 1 != v19);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v19);
  }

  objc_msgSend(v4, "sortUsingComparator:", &__block_literal_global_140);
  return v4;
}

uint64_t __74__NTKPlistPigmentEditOptionLoader_sortedUniqueOptionNamesFromCollections___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __74__NTKPlistPigmentEditOptionLoader_sortedUniqueOptionNamesFromCollections___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (int64_t)compareColorFileNames:(id)a3 otherFileName:(id)a4 fileExtension:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  int64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  __CFString *v26;
  void *v27;
  uint64_t (**v28)(void *, id, id);
  uint64_t v29;
  _QWORD aBlock[4];
  id v31;
  id v32;
  id v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v8;
  v12 = v9;
  v13 = v12;
  v14 = v11;
  if (v10)
  {
    objc_msgSend(a1, "extractNameFromFullFileName:fileExtension:", v11, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "extractNameFromFullFileName:fileExtension:", v12, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v14 && v13)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __85__NTKPlistPigmentEditOptionLoader_compareColorFileNames_otherFileName_fileExtension___block_invoke;
    aBlock[3] = &unk_1E6BD66D8;
    v15 = v14;
    v31 = v15;
    v16 = v13;
    v32 = v16;
    v33 = a1;
    v28 = (uint64_t (**)(void *, id, id))_Block_copy(aBlock);
    objc_msgSend(v15, "componentsSeparatedByString:", CFSTR("-"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "componentsSeparatedByString:", CFSTR("-"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v29 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "count") == 1 && objc_msgSend(v18, "count") == 1)
    {
      v19 = v28[2](v28, v15, v16);
      v20 = v27;
    }
    else
    {
      v20 = v27;
      v21 = (void *)v29;
      if (!objc_msgSend(v27, "isEqualToString:", v29))
      {
        v19 = objc_msgSend(a1, "compareColorFileNames:otherFileName:fileExtension:", v27, v29, 0);
LABEL_21:

        goto LABEL_22;
      }
      if ((unint64_t)objc_msgSend(v17, "count") < 2)
      {
        v26 = &stru_1E6BDC918;
      }
      else
      {
        v22 = (void *)objc_msgSend(v17, "mutableCopy");
        objc_msgSend(v22, "removeObjectAtIndex:", 0);
        objc_msgSend(v22, "componentsJoinedByString:", CFSTR("-"));
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      if ((unint64_t)objc_msgSend(v18, "count") < 2)
      {
        v24 = &stru_1E6BDC918;
      }
      else
      {
        v23 = (void *)objc_msgSend(v18, "mutableCopy");
        objc_msgSend(v23, "removeObjectAtIndex:", 0);
        objc_msgSend(v23, "componentsJoinedByString:", CFSTR("-"));
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v20 = v27;
      }
      v19 = objc_msgSend(a1, "compareColorFileNames:otherFileName:fileExtension:", v26, v24, 0);

    }
    v21 = (void *)v29;
    goto LABEL_21;
  }
  if (v14)
    v19 = 1;
  else
    v19 = -1;
LABEL_22:

  return v19;
}

uint64_t __85__NTKPlistPigmentEditOptionLoader_compareColorFileNames_otherFileName_fileExtension___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(a1[4], "isEqualToString:", CFSTR("FaceColors")) & 1) != 0)
  {
    v7 = -1;
    goto LABEL_14;
  }
  if ((objc_msgSend(a1[5], "isEqualToString:", CFSTR("FaceColors")) & 1) != 0)
  {
    v7 = 1;
    goto LABEL_14;
  }
  v8 = objc_msgSend(a1[6], "containsSeasonNamePrefix:", v5);
  v9 = objc_msgSend(a1[6], "containsSeasonNamePrefix:", v6);
  if ((v8 & 1) == 0 && !v9)
  {
    v10 = objc_msgSend(v5, "compare:", v6);
LABEL_10:
    v7 = v10;
    goto LABEL_14;
  }
  if ((v8 & v9) == 1)
  {
    v10 = objc_msgSend(a1[6], "compareSeasonName:otherSeasonName:", v5, v6);
    goto LABEL_10;
  }
  if (v9)
    v7 = -1;
  else
    v7 = 1;
LABEL_14:

  return v7;
}

+ (int64_t)compareSeasonName:(id)a3 otherSeasonName:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int64_t v12;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(a1, "extractYearFromSeasonName:", v6);
  v9 = objc_msgSend(a1, "extractYearFromSeasonName:", v7);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL || v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      v12 = 1;
    else
      v12 = -1;
  }
  else if (v8 == v9)
  {
    objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "length") - 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "substringToIndex:", objc_msgSend(v7, "length") - 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(a1, "compareSeasonWithoutYear:otherSeasonNameWithoutYear:", v10, v11);

  }
  else if (v8 < v9)
  {
    v12 = -1;
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

+ (int64_t)extractYearFromSeasonName:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "length") < 4)
  {
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    objc_msgSend(v3, "substringWithRange:", objc_msgSend(v3, "length") - 4, 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue");

  }
  return v5;
}

+ (int64_t)compareSeasonWithoutYear:(id)a3 otherSeasonNameWithoutYear:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;

  v6 = a4;
  objc_msgSend(a1, "indexForSeasonName:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "indexForSeasonName:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "compare:", v8);
  return v9;
}

+ (id)indexForSeasonName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "seasonNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "indexOfObject:", v6);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = &unk_1E6C9FA60;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

+ (BOOL)containsSeasonNamePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  objc_msgSend(a1, "seasonNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__NTKPlistPigmentEditOptionLoader_containsSeasonNamePrefix___block_invoke;
  v8[3] = &unk_1E6BD6700;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  LOBYTE(v5) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

void __60__NTKPlistPigmentEditOptionLoader_containsSeasonNamePrefix___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  void *v8;
  int v9;

  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasPrefix:", v7);

  if (v9)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

+ (id)seasonNames
{
  if (seasonNames_onceToken != -1)
    dispatch_once(&seasonNames_onceToken, &__block_literal_global_144);
  return (id)seasonNames_seasons;
}

void __46__NTKPlistPigmentEditOptionLoader_seasonNames__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[7];

  v4[6] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0C99E10]);
  v4[0] = CFSTR("spring");
  v4[1] = CFSTR("summer");
  v4[2] = CFSTR("ss");
  v4[3] = CFSTR("fall");
  v4[4] = CFSTR("winter");
  v4[5] = CFSTR("fw");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithArray:", v1);
  v3 = (void *)seasonNames_seasons;
  seasonNames_seasons = v2;

}

+ (id)extractNameFromFullFileName:(id)a3 fileExtension:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;

  v5 = a4;
  objc_msgSend(a3, "pathComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v5, "length");
  if (objc_msgSend(v7, "length") >= v8)
  {
    objc_msgSend(v7, "substringToIndex:", objc_msgSend(v7, "length") - v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  return v7;
}

- (id)alternativePropertyNamesForProperty:(id)a3 inNode:(id)a4
{
  return -[NTKPlistPigmentEditOptionLoader alternativePropertyNamesForProperty:inNode:includesAllDeviceSpecificColors:](self, "alternativePropertyNamesForProperty:inNode:includesAllDeviceSpecificColors:", a3, a4, self->_includesAllDeviceSpecificColors);
}

- (id)alternativePropertyNamesForProperty:(id)a3 inNode:(id)a4 includesAllDeviceSpecificColors:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  uint64_t *v16;
  id v17;
  NSNumber *sku;
  void *v19;
  NSNumber *clhs;
  void *v21;
  NSNumber *family;
  void *v23;
  uint64_t v24;
  _QWORD v26[4];
  id v27;
  _QWORD *v28;
  uint64_t *v29;
  _QWORD v30[4];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __110__NTKPlistPigmentEditOptionLoader_alternativePropertyNamesForProperty_inNode_includesAllDeviceSpecificColors___block_invoke;
  v37[3] = &unk_1E6BD6748;
  v13 = v8;
  v38 = v13;
  v14 = v11;
  v39 = v14;
  v15 = v10;
  v40 = v15;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v37);
  if (v5)
  {
    v16 = (uint64_t *)v14;
  }
  else
  {
    v17 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    sku = self->_sku;
    if (sku)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%lu"), CFSTR("sku"), -[NSNumber integerValue](sku, "integerValue"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v19);

    }
    clhs = self->_clhs;
    if (clhs)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%lu"), CFSTR("clhs"), -[NSNumber integerValue](clhs, "integerValue"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v21);

    }
    family = self->_family;
    if (family)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%lu"), CFSTR("family"), -[NSNumber integerValue](family, "integerValue"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v23);

    }
    if (!objc_msgSend(v17, "count"))
      goto LABEL_13;
    v16 = &v31;
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__38;
    v35 = __Block_byref_object_dispose__38;
    v36 = 0;
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    v30[3] = 0;
    v26[0] = v12;
    v26[1] = 3221225472;
    v26[2] = __110__NTKPlistPigmentEditOptionLoader_alternativePropertyNamesForProperty_inNode_includesAllDeviceSpecificColors___block_invoke_147;
    v26[3] = &unk_1E6BD6770;
    v27 = v17;
    v28 = v30;
    v29 = &v31;
    objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v26);
    v24 = v32[5];
    if (v24)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v32[5]);
      v16 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    }

    _Block_object_dispose(v30, 8);
    _Block_object_dispose(&v31, 8);

    if (!v24)
LABEL_13:
      v16 = (uint64_t *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");

  }
  return v16;
}

void __110__NTKPlistPigmentEditOptionLoader_alternativePropertyNamesForProperty_inNode_includesAllDeviceSpecificColors___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "hasPrefix:", *(_QWORD *)(a1 + 32))
    && (objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("-"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    if ((unint64_t)objc_msgSend(v4, "count") >= 2)
    {
      objc_msgSend(v4, "removeObjectAtIndex:", 0);
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v5, v6);

    }
  }

}

void __110__NTKPlistPigmentEditOptionLoader_alternativePropertyNamesForProperty_inNode_includesAllDeviceSpecificColors___block_invoke_147(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = objc_msgSend(v7, "count");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v9);
        v12 += objc_msgSend(*(id *)(a1 + 32), "containsObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }

  if (v12 == v8)
  {
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (v8 > *(_QWORD *)(v15 + 24))
    {
      *(_QWORD *)(v15 + 24) = v8;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    }
  }

}

- (BOOL)includesAllDeviceSpecificColors
{
  return self->_includesAllDeviceSpecificColors;
}

- (BOOL)ignoreSensitiveUIItems
{
  return self->_ignoreSensitiveUIItems;
}

- (NSNumber)sku
{
  return self->_sku;
}

- (void)setSku:(id)a3
{
  objc_storeStrong((id *)&self->_sku, a3);
}

- (NSNumber)family
{
  return self->_family;
}

- (void)setFamily:(id)a3
{
  objc_storeStrong((id *)&self->_family, a3);
}

- (NSBundle)frameworkBundle
{
  return self->_frameworkBundle;
}

- (void)setFrameworkBundle:(id)a3
{
  objc_storeStrong((id *)&self->_frameworkBundle, a3);
}

- (void)setSharedConfigs:(id)a3
{
  objc_storeStrong((id *)&self->_sharedConfigs, a3);
}

- (NSArray)sortedAdditionalPlistFiles
{
  return self->_sortedAdditionalPlistFiles;
}

- (void)setSortedAdditionalPlistFiles:(id)a3
{
  objc_storeStrong((id *)&self->_sortedAdditionalPlistFiles, a3);
}

- (NSMutableArray)bundlePlistsFromFacesWithoutBundle
{
  return self->_bundlePlistsFromFacesWithoutBundle;
}

- (void)setBundlePlistsFromFacesWithoutBundle:(id)a3
{
  objc_storeStrong((id *)&self->_bundlePlistsFromFacesWithoutBundle, a3);
}

- (NSArray)plistFiles
{
  return self->_plistFiles;
}

- (void)setPlistFiles:(id)a3
{
  objc_storeStrong((id *)&self->_plistFiles, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plistFiles, 0);
  objc_storeStrong((id *)&self->_bundlePlistsFromFacesWithoutBundle, 0);
  objc_storeStrong((id *)&self->_sortedAdditionalPlistFiles, 0);
  objc_storeStrong((id *)&self->_sharedConfigs, 0);
  objc_storeStrong((id *)&self->_frameworkBundle, 0);
  objc_storeStrong((id *)&self->_additionalBundles, 0);
  objc_storeStrong((id *)&self->_family, 0);
  objc_storeStrong((id *)&self->_clhs, 0);
  objc_storeStrong((id *)&self->_sku, 0);
}

- (void)parseColorOptionsForDomain:bundle:sharedCollections:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, v0, v1, "#plist-loader No shared collection. Pigment parser needs it to fulfill collection dependencies %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)parseColorOptionsForDomain:bundle:sharedCollections:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_1B72A3000, v0, v1, "#plist-loader Started Loading Pigment Options for domain #%{public}@#", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __121__NTKPlistPigmentEditOptionLoader_loadFaceCollectionForDomain_mainBundle_faceBundle_additionalBundles_sharedCollections___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_1B72A3000, v0, v1, "Collections after merge %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __121__NTKPlistPigmentEditOptionLoader_loadFaceCollectionForDomain_mainBundle_faceBundle_additionalBundles_sharedCollections___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a2 + 40), "plistFileName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_debug_impl(&dword_1B72A3000, a3, OS_LOG_TYPE_DEBUG, "Merging collections %{public}@ from plist %{public}@", (uint8_t *)&v6, 0x16u);

}

- (void)loadFaceCollectionForAllSlotsForDomain:propertyList:bundle:sharedCollections:.cold.1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 138543874;
  OUTLINED_FUNCTION_9_0();
  v4 = v0;
  v5 = v1;
  _os_log_debug_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEBUG, "#plist-loader '%{public}@' root domain not found. Returning empty options for domain %{public}@ in plist %{public}@", (uint8_t *)v3, 0x20u);
}

- (void)loadFaceCollectionForAllSlotsForDomain:propertyList:bundle:sharedCollections:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_10_0(&dword_1B72A3000, v0, v1, "#plist-loader contentRoot empty. Returning empty options for domain %{public}@ in plist %{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)loadFaceCollectionForAllSlotsForDomain:(NSObject *)a3 propertyList:bundle:sharedCollections:.cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_2(&dword_1B72A3000, a3, v4, "#plist-loader contentRoot found with incorrect type - It should be a dictionary but it was %{public}@. Returning empty options for domain %{public}@", v5);
  OUTLINED_FUNCTION_4();
}

- (void)loadFaceCollectionForAllSlotsForDomain:(NSObject *)a3 propertyList:bundle:sharedCollections:.cold.4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_2(&dword_1B72A3000, a3, v4, "#plist-loader 'faces' root found with incorrect type - It should be a dictionary but it was %{public}@. Returning empty options for domain %{public}@", v5);
  OUTLINED_FUNCTION_4();
}

void __112__NTKPlistPigmentEditOptionLoader_loadFaceCollectionForAllSlotsForDomain_propertyList_bundle_sharedCollections___block_invoke_91_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B72A3000, log, OS_LOG_TYPE_ERROR, "#plist-loader slot property not found", v1, 2u);
}

- (void)loadFaceCollectionForDomain:contentRoot:faceCollectionsRoot:sharedCollections:plistSuffix:bundle:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_1B72A3000, v0, v1, "#plist-loader Collection for domain %{domain}@ not found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)loadFaceCollectionForDomain:contentRoot:faceCollectionsRoot:sharedCollections:plistSuffix:bundle:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, v0, v1, "#plist-loader Collection for domain %{domain}@ has cycle. Returning empty collection", v2);
  OUTLINED_FUNCTION_1();
}

- (void)loadSharedConfigWithPropertyList:(uint64_t)a3 bundle:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_1B72A3000, a1, a3, "#plist-loader '%{public}@' root domain not found. Returning empty options for shared config", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)loadSharedConfigWithPropertyList:(uint64_t)a1 bundle:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  int v4[6];

  OUTLINED_FUNCTION_7_1();
  v4[0] = 138543618;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2(&dword_1B72A3000, a2, v3, "#plist-loader '%{public}@' root found with incorrect type - It should be a dictionary but was %{public}@. Returning empty options for shared configs", (uint8_t *)v4);
  OUTLINED_FUNCTION_4();
}

- (void)loadSharedCollectionsWithPropertyList:(uint64_t)a3 bundle:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_1B72A3000, a1, a3, "#plist-loader '%{public}@' root domain not found. Returning empty options for shared collections", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)loadSharedCollectionsWithPropertyList:(uint64_t)a1 bundle:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  int v4[6];

  OUTLINED_FUNCTION_7_1();
  v4[0] = 138543618;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2(&dword_1B72A3000, a2, v3, "#plist-loader '%{public}@' root found with incorrect type - It should be a dictionary but was %{public}@. Returning empty options for shared collections", (uint8_t *)v4);
  OUTLINED_FUNCTION_4();
}

- (void)discoverCollectionWithName:contentRoot:collectionsRoot:discoveredCollections:privateDiscoveredCollections:discoveredInvalidCollections:invalidDependecies:hasCycle:plistSuffix:bundle:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_2(&dword_1B72A3000, v0, (uint64_t)v0, "#plist-loader '%{public}@' not found. Returning empty options for it %{public}@", v1);
  OUTLINED_FUNCTION_1();
}

- (void)discoverCollectionWithName:contentRoot:collectionsRoot:discoveredCollections:privateDiscoveredCollections:discoveredInvalidCollections:invalidDependecies:hasCycle:plistSuffix:bundle:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, v0, v1, "#plist-loader Cycle found in dependencies of [%{public}@]. Returning empty collection.", v2);
  OUTLINED_FUNCTION_1();
}

- (void)discoverCollectionWithName:contentRoot:collectionsRoot:discoveredCollections:privateDiscoveredCollections:discoveredInvalidCollections:invalidDependecies:hasCycle:plistSuffix:bundle:.cold.3()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_2(&dword_1B72A3000, v0, (uint64_t)v0, "#plist-loader '%{public}@' found with incorrect type - It should be a dictionary or array but was %{public}@. Returning empty options for it", v1);
  OUTLINED_FUNCTION_1();
}

- (void)discoverCollectionWithName:contentRoot:collectionsRoot:discoveredCollections:privateDiscoveredCollections:discoveredInvalidCollections:invalidDependecies:hasCycle:plistSuffix:bundle:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_1B72A3000, v0, v1, "#plist-loader Discoverying [%{public}@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)loadNestedCollectionsFromNode:(os_log_t)log parent:config:plistSuffix:bundle:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B72A3000, log, OS_LOG_TYPE_DEBUG, "#plist-loader private collections not found. Returning empty options for it", v1, 2u);
}

- (void)loadNestedCollectionsFromNode:parent:config:plistSuffix:bundle:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, v0, v1, "#plist-loader private 'collections' found with incorrect type - It should be a dictionary but was %{public}@. Returning empty options for it", v2);
  OUTLINED_FUNCTION_1();
}

void __98__NTKPlistPigmentEditOptionLoader_loadNestedCollectionsFromNode_parent_config_plistSuffix_bundle___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  OUTLINED_FUNCTION_3_0();
  v7 = 2114;
  v8 = v4;
  v9 = 2114;
  v10 = v5;
  _os_log_error_impl(&dword_1B72A3000, a3, OS_LOG_TYPE_ERROR, "#plist-loader 'collectionItem' found with incorrect type - It should be an array or dic but was %{public}@ - %{public}@ - %{public}@. Returning empty options for it", v6, 0x20u);
}

- (void)importedCollectionsFromImports:propertyName:sharedCollectionsRoot:parent:discoveredCollections:privateDiscoveredCollections:discoveredInvalidCollections:invalidDependencies:hasCycle:plistSuffix:bundle:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_10_0(&dword_1B72A3000, v0, v1, "#plist-loader property '%{public}@' not found for [%{public}@].");
  OUTLINED_FUNCTION_1();
}

- (void)importedCollectionsFromImports:propertyName:sharedCollectionsRoot:parent:discoveredCollections:privateDiscoveredCollections:discoveredInvalidCollections:invalidDependencies:hasCycle:plistSuffix:bundle:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_1B72A3000, v0, v1, "#plist-loader Starting retrieving items from dependencies of [%{public}@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)configurationWithName:fromNode:collectionName:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_10_0(&dword_1B72A3000, v0, v1, "#plist-loader property '%{public}@' not found for collection %{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)configurationFromNode:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = (void *)OUTLINED_FUNCTION_7_1();
  v4 = OUTLINED_FUNCTION_6_2(v3);
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, a2, v5, "#plist-loader config.gallery-default node found with incorrect type - It should be a Array but was %{public}@. Ignoring it.", v6);

  OUTLINED_FUNCTION_4();
}

- (void)configurationFromNode:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = (void *)OUTLINED_FUNCTION_7_1();
  v4 = OUTLINED_FUNCTION_6_2(v3);
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, a2, v5, "#plist-loader config.collectionOverride node found with incorrect type - It should be a String but was %{public}@. Ignoring it.", v6);

  OUTLINED_FUNCTION_4();
}

- (void)configurationFromNode:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = CFSTR("excludes-duotone");
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, a1, a3, "#plist-loader %{public}@ found with incorrect type -  It should be a number. Ignoring it.", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)configurationFromNode:(uint64_t)a1 .cold.4(uint64_t a1, NSObject *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = (void *)OUTLINED_FUNCTION_7_1();
  v4 = OUTLINED_FUNCTION_6_2(v3);
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, a2, v5, "#plist-loader config.exclusions node found with incorrect type - It should be an array but was %{public}@. Ignoring it.", v6);

  OUTLINED_FUNCTION_4();
}

- (void)configurationFromNode:(uint64_t)a1 .cold.5(uint64_t a1, NSObject *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = (void *)OUTLINED_FUNCTION_7_1();
  v4 = OUTLINED_FUNCTION_6_2(v3);
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, a2, v5, "#plist-loader config.sortedByHue node found with incorrect type - It should be a Number but was %{public}@. Ignoring it.", v6);

  OUTLINED_FUNCTION_4();
}

- (void)configurationFromNode:(uint64_t)a1 .cold.6(uint64_t a1, NSObject *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = (void *)OUTLINED_FUNCTION_7_1();
  v4 = OUTLINED_FUNCTION_6_2(v3);
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, a2, v5, "#plist-loader config.sku node found with incorrect type - It should be a Number but was %{public}@. Ignoring it.", v6);

  OUTLINED_FUNCTION_4();
}

- (void)configurationFromNode:(uint64_t)a1 .cold.7(uint64_t a1, NSObject *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = (void *)OUTLINED_FUNCTION_7_1();
  v4 = OUTLINED_FUNCTION_6_2(v3);
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, a2, v5, "#plist-loader config.feature_flag node found with incorrect type - It should be a String but was %{public}@. Ignoring it.", v6);

  OUTLINED_FUNCTION_4();
}

- (void)configurationFromNode:(uint64_t)a1 .cold.8(uint64_t a1, NSObject *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = (void *)OUTLINED_FUNCTION_7_1();
  v4 = OUTLINED_FUNCTION_6_2(v3);
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, a2, v5, "#plist-loader config.migration node found with incorrect type - It should be a dictionary but was %{public}@. Ignoring it.", v6);

  OUTLINED_FUNCTION_4();
}

- (void)configurationFromNode:(uint64_t)a3 .cold.9(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = CFSTR("default");
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, a1, a3, "#plist-loader %{public}@ found with incorrect type -  It should be a string. Ignoring it.", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)configurationFromNode:(uint64_t)a3 .cold.10(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = CFSTR("supports-slider");
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, a1, a3, "#plist-loader %{public}@ found with incorrect type -  It should be a number. Ignoring it.", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)configurationFromNode:(uint64_t)a3 .cold.11(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = CFSTR("isAddable");
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, a1, a3, "#plist-loader %{public}@ found with incorrect type -  It should be a number. Ignoring it.", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)configurationFromNode:(uint64_t)a3 .cold.12(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = CFSTR("sensitivity");
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, a1, a3, "#plist-loader %{public}@ found with incorrect type -  It should be a number. Ignoring it.", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)configurationFromNode:.cold.13()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 138543618;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2(&dword_1B72A3000, v0, v1, "#plist-loader '%{public}@' found with incorrect type -  It should be an dictionary. %{public}@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

- (void)colorOptionsFromPListItems:(uint64_t)a3 collectionName:applyConfig:plistSuffix:bundle:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = CFSTR("items");
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, a1, a3, "#plist-loader '%{public}@' found with incorrect type -  It should be an array or dictionary with indexes.", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)loadPropertyListFromFile:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, v0, v1, "#plist-loader Could not find file: %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)sortedPlistFilesWithMainBundle:(void *)a1 faceBundle:(uint8_t *)buf additionalBundles:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1B72A3000, log, OS_LOG_TYPE_DEBUG, "#plist-loader Color property list files loaded in the following order: %{public}@", buf, 0xCu);

}

@end
