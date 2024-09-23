@implementation ML3ArtworkConfiguration

void __66__ML3ArtworkConfiguration_supportedSizesForMediaType_artworkType___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "supportedSizesCache");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

}

void __66__ML3ArtworkConfiguration_supportedSizesForMediaType_artworkType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "supportedSizesCache");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSMutableDictionary)supportedSizesCache
{
  return self->_supportedSizesCache;
}

uint64_t __70__ML3ArtworkConfiguration__supportedSizeKeysForMediaType_artworkType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iPadOnly"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "BOOLValue"))
  {
    v6 = MSVDeviceIsiPad();

    if ((v6 & 1) == 0)
    {
      v7 = 0;
      goto LABEL_19;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("supportedArtworkTypes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "containsObject:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("supportedMediaTypes"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      while (2)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          if ((*(_DWORD *)(a1 + 40) & ML3ArtworkConfigurationMediaTypeForString(*(void **)(*((_QWORD *)&v15 + 1) + 8 * v13))) != 0)
          {
            v7 = 1;
            goto LABEL_17;
          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v11)
          continue;
        break;
      }
    }
    v7 = 0;
LABEL_17:

  }
  else
  {
    v7 = 0;
  }

LABEL_19:
  return v7;
}

void __46__ML3ArtworkConfiguration_systemConfiguration__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  ML3ArtworkConfiguration *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MusicLibrary"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URLsForResourcesWithExtension:subdirectory:", CFSTR("artworkConfig"), 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v0;
  v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v17 != v3)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0;
        objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v6, 0, 0, &v15);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v15;
        if (v8)
        {
          v9 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v21 = v5;
            v22 = 2114;
            v23 = v8;
            _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_ERROR, "Error loading artwork configuration at %{public}@ : %{public}@", buf, 0x16u);
          }

        }
        else
        {
          objc_msgSend(v13, "addObject:", v7);
        }

      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v2);
  }

  v10 = -[ML3ArtworkConfiguration initWithConfigurationDictionaries:]([ML3ArtworkConfiguration alloc], "initWithConfigurationDictionaries:", v13);
  v11 = (void *)systemConfiguration___systemConfiguration;
  systemConfiguration___systemConfiguration = (uint64_t)v10;

}

- (ML3ArtworkConfiguration)initWithConfigurationDictionaries:(id)a3
{
  id v4;
  ML3ArtworkConfiguration *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *accessQueue;
  uint64_t v8;
  NSMutableDictionary *supportedSizesCache;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSDictionary *artworkConfigurationDictionary;
  double v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ML3ArtworkConfiguration;
  v5 = -[ML3ArtworkConfiguration init](&v24, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.MusicLibrary.ML3ArtworkConfiguration", MEMORY[0x1E0C80D50]);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v6;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    supportedSizesCache = v5->_supportedSizesCache;
    v5->_supportedSizesCache = (NSMutableDictionary *)v8;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = v4;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(v10, "mergeWithDictionary:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15++), (_QWORD)v20);
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v13);
    }

    v16 = objc_msgSend(v10, "copy");
    artworkConfigurationDictionary = v5->_artworkConfigurationDictionary;
    v5->_artworkConfigurationDictionary = (NSDictionary *)v16;

    MSVGetMaximumScreenScale();
    v5->_mainScreenScale = v18;

  }
  return v5;
}

- (id)supportedSizesForMediaType:(unsigned int)a3 artworkType:(int64_t)a4
{
  uint64_t v5;
  void *v6;
  NSObject *accessQueue;
  id v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  id v27;
  id obj;
  double v30;
  double v31;
  _QWORD v32[5];
  id v33;
  uint64_t *v34;
  CGAffineTransform v35;
  float64x2_t v36;
  CGAffineTransform v37;
  float64x2_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD block[5];
  id v44;
  uint64_t *v45;
  uint64_t v46;
  id *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  _QWORD v52[2];
  _BYTE v53[128];
  uint64_t v54;

  v5 = *(_QWORD *)&a3;
  v54 = *MEMORY[0x1E0C80C00];
  +[_ML3ArtworkConfigurationMediaArtworkTypeKey keyWithMediaType:artworkType:](_ML3ArtworkConfigurationMediaArtworkTypeKey, "keyWithMediaType:artworkType:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  v47 = (id *)&v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__8841;
  v50 = __Block_byref_object_dispose__8842;
  v51 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__ML3ArtworkConfiguration_supportedSizesForMediaType_artworkType___block_invoke;
  block[3] = &unk_1E5B65CF0;
  v45 = &v46;
  block[4] = self;
  v27 = v6;
  v44 = v27;
  dispatch_sync(accessQueue, block);
  v8 = v47[5];
  v9 = 0x1E0C99000;
  if (!v8)
  {
    -[ML3ArtworkConfiguration _supportedSizeKeysForMediaType:artworkType:](self, "_supportedSizeKeysForMediaType:artworkType:", v5, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = v10;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v40 != v13)
            objc_enumerationMutation(obj);
          v15 = _ML3ArtworkConfigurationCGSizeFromString(*(void **)(*((_QWORD *)&v39 + 1) + 8 * i));
          v38 = 0uLL;
          v30 = v16;
          v31 = v15;
          CGAffineTransformMakeScale(&v37, 2.0, 2.0);
          v38 = vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v37.c, v30), *(float64x2_t *)&v37.a, v31);
          v36 = 0uLL;
          CGAffineTransformMakeScale(&v35, 3.0, 3.0);
          v36 = vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v35.c, v30), *(float64x2_t *)&v35.a, v31);
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v38, "{CGSize=dd}");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v52[0] = v17;
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v36, "{CGSize=dd}");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v52[1] = v18;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObjectsFromArray:", v19);

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
      }
      while (v12);
    }

    v20 = objc_msgSend(v11, "count");
    v21 = v11;
    if (!v20)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong(v47 + 5, v21);
    if (!v20)

    v22 = self->_accessQueue;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __66__ML3ArtworkConfiguration_supportedSizesForMediaType_artworkType___block_invoke_2;
    v32[3] = &unk_1E5B65CF0;
    v32[4] = self;
    v33 = v27;
    v34 = &v46;
    dispatch_barrier_async(v22, v32);

    v8 = v47[5];
    v9 = 0x1E0C99000uLL;
  }
  objc_msgSend(*(id *)(v9 + 3640), "null");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v23)
    v24 = 0;
  else
    v24 = v47[5];
  v25 = v24;

  _Block_object_dispose(&v46, 8);
  return v25;
}

- (id)_supportedSizeKeysForMediaType:(unsigned int)a3 artworkType:(int64_t)a4
{
  __CFString *v4;
  NSDictionary *artworkConfigurationDictionary;
  void *v6;
  _QWORD v8[4];
  __CFString *v9;
  unsigned int v10;

  if ((unint64_t)(a4 - 1) > 4)
    v4 = 0;
  else
    v4 = off_1E5B62858[a4 - 1];
  artworkConfigurationDictionary = self->_artworkConfigurationDictionary;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__ML3ArtworkConfiguration__supportedSizeKeysForMediaType_artworkType___block_invoke;
  v8[3] = &unk_1E5B62838;
  v9 = v4;
  v10 = a3;
  -[NSDictionary keysOfEntriesPassingTest:](artworkConfigurationDictionary, "keysOfEntriesPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)systemConfiguration
{
  if (systemConfiguration_onceToken != -1)
    dispatch_once(&systemConfiguration_onceToken, &__block_literal_global_8862);
  return (id)systemConfiguration___systemConfiguration;
}

- (id)sizesToAutogenerateForMediaType:(unsigned int)a3 artworkType:(int64_t)a4
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  float64_t v15;
  float64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v21;
  double v22;
  double v23;
  CGAffineTransform v24;
  float64x2_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[ML3ArtworkConfiguration _supportedSizeKeysForMediaType:artworkType:](self, "_supportedSizeKeysForMediaType:artworkType:", *(_QWORD *)&a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        -[NSDictionary objectForKey:](self->_artworkConfigurationDictionary, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", CFSTR("autogenerate"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "BOOLValue");

        if (v14)
        {
          v25 = 0uLL;
          v15 = _ML3ArtworkConfigurationCGSizeFromString(v11);
          v22 = v16;
          v23 = v15;
          v25.f64[0] = v15;
          v25.f64[1] = v16;
          CGAffineTransformMakeScale(&v24, self->_mainScreenScale, self->_mainScreenScale);
          v25 = vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v24.c, v22), *(float64x2_t *)&v24.a, v23);
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v25, "{CGSize=dd}");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v17);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v21, "count"))
    v18 = v21;
  else
    v18 = 0;
  v19 = v18;

  return v19;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p %@>\n"), objc_opt_class(), self, self->_artworkConfigurationDictionary);
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessQueue, a3);
}

- (NSDictionary)artworkConfigurationDictionary
{
  return self->_artworkConfigurationDictionary;
}

- (void)setArtworkConfigurationDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_artworkConfigurationDictionary, a3);
}

- (void)setSupportedSizesCache:(id)a3
{
  objc_storeStrong((id *)&self->_supportedSizesCache, a3);
}

- (double)mainScreenScale
{
  return self->_mainScreenScale;
}

- (void)setMainScreenScale:(double)a3
{
  self->_mainScreenScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedSizesCache, 0);
  objc_storeStrong((id *)&self->_artworkConfigurationDictionary, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
