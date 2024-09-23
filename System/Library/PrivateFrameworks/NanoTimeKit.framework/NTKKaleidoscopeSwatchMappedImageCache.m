@implementation NTKKaleidoscopeSwatchMappedImageCache

+ (id)sharedCache
{
  if (sharedCache_onceToken_1 != -1)
    dispatch_once(&sharedCache_onceToken_1, &__block_literal_global_85);
  return (id)sharedCache_sharedCache_0;
}

void __52__NTKKaleidoscopeSwatchMappedImageCache_sharedCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[NTKKaleidoscopeSwatchMappedImageCache _init]([NTKKaleidoscopeSwatchMappedImageCache alloc], "_init");
  v1 = (void *)sharedCache_sharedCache_0;
  sharedCache_sharedCache_0 = (uint64_t)v0;

}

- (id)_init
{
  NTKKaleidoscopeSwatchMappedImageCache *v2;
  NTKKaleidoscopeSwatchMappedImageCache *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKKaleidoscopeSwatchMappedImageCache;
  v2 = -[NTKKaleidoscopeSwatchMappedImageCache initWithUniqueIdentifier:](&v5, sel_initWithUniqueIdentifier_, CFSTR("com.apple.nanotimekit.face.kaleidoscope.swatches"));
  v3 = v2;
  if (v2)
    -[NTKKaleidoscopeSwatchMappedImageCache _cleanCache](v2, "_cleanCache");
  return v3;
}

- (void)_removeImagesForKeysMatching:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  NTKKaleidoscopeSwatchMappedImageCache *v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  -[NTKKaleidoscopeSwatchMappedImageCache allKeys](self, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__NTKKaleidoscopeSwatchMappedImageCache__removeImagesForKeysMatching___block_invoke;
  v14[3] = &unk_1E6BD3C88;
  v15 = v4;
  v10 = v4;
  objc_msgSend(v6, "indexesOfObjectsPassingTest:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __70__NTKKaleidoscopeSwatchMappedImageCache__removeImagesForKeysMatching___block_invoke_2;
  v11[3] = &unk_1E6BD3CB0;
  v12 = v6;
  v13 = self;
  v9 = v6;
  objc_msgSend(v8, "enumerateIndexesUsingBlock:", v11);

}

uint64_t __70__NTKKaleidoscopeSwatchMappedImageCache__removeImagesForKeysMatching___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__NTKKaleidoscopeSwatchMappedImageCache__removeImagesForKeysMatching___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1B72A3000, v4, OS_LOG_TYPE_DEFAULT, "NTKKaleidoscopeSwatchMappedImageCache: removing key %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "removeImageForKey:", v3);
}

+ (id)keyForAsset:(id)a3 style:(id)a4 resourceDirectory:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v9)
  {
    +[NTKPhotosReader readerForResourceDirectory:](NTKPhotosReader, "readerForResourceDirectory:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLByDeletingPathExtension");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastPathComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  v15 = (void *)MEMORY[0x1E0CB3940];
  NTKBuildVersion();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@-%@-%@"), v16, v8, v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "asset") == 1000 && v14)
  {
    objc_msgSend(v17, "stringByAppendingFormat:", CFSTR("-%@"), v14);
    v18 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v18;
  }

  return v17;
}

- (void)_cleanCache
{
  void *v3;
  NSArray *v4;
  NSArray *libraryCollections;
  NSMutableArray *v6;
  NSMutableArray *loadedCollections;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableArray *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  +[NTKCompanionFaceCollectionsManager sharedInstance](NTKCompanionFaceCollectionsManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharedLibraryFaceCollectionsForAllDevices");
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  libraryCollections = self->_libraryCollections;
  self->_libraryCollections = v4;

  v6 = (NSMutableArray *)objc_opt_new();
  loadedCollections = self->_loadedCollections;
  self->_loadedCollections = v6;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_libraryCollections;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v13, "addObserver:", self, (_QWORD)v16);
        v14 = self->_loadedCollections;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v13, "hasLoaded"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v14, "addObject:", v15);

      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  -[NTKKaleidoscopeSwatchMappedImageCache _pruneUnusedKeys](self, "_pruneUnusedKeys");
  -[NTKKaleidoscopeSwatchMappedImageCache _removeImagesForKeysMatching:](self, "_removeImagesForKeysMatching:", &__block_literal_global_15_0);
}

uint64_t __52__NTKKaleidoscopeSwatchMappedImageCache__cleanCache__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;

  v2 = a2;
  NTKBuildVersion();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "hasPrefix:", v3);

  return v4 ^ 1u;
}

- (void)_pruneUnusedKeys
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t i;
  void *v9;
  void *v10;
  NSArray *libraryCollections;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  NTKKaleidoscopeSwatchMappedImageCache *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v3 = self->_loadedCollections;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (!v4)
  {

LABEL_14:
    v9 = (void *)objc_opt_new();
    v10 = (void *)objc_opt_new();
    libraryCollections = self->_libraryCollections;
    v12 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __57__NTKKaleidoscopeSwatchMappedImageCache__pruneUnusedKeys__block_invoke;
    v21[3] = &unk_1E6BD3D40;
    v13 = v9;
    v22 = v13;
    v14 = v10;
    v23 = v14;
    v24 = self;
    -[NSArray enumerateObjectsUsingBlock:](libraryCollections, "enumerateObjectsUsingBlock:", v21);
    _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v14;
      _os_log_impl(&dword_1B72A3000, v15, OS_LOG_TYPE_DEFAULT, "NTKKaleidoscopeSwatchMappedImageCache: extant keys: %@", buf, 0xCu);
    }

    v18[0] = v12;
    v18[1] = 3221225472;
    v18[2] = __57__NTKKaleidoscopeSwatchMappedImageCache__pruneUnusedKeys__block_invoke_24;
    v18[3] = &unk_1E6BD3D68;
    v19 = v13;
    v20 = v14;
    v16 = v14;
    v17 = v13;
    -[NTKKaleidoscopeSwatchMappedImageCache _removeImagesForKeysMatching:](self, "_removeImagesForKeysMatching:", v18);

    return;
  }
  v5 = v4;
  v6 = *(_QWORD *)v26;
  v7 = 1;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v26 != v6)
        objc_enumerationMutation(v3);
      if ((v7 & 1) != 0)
        v7 = objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "BOOLValue");
      else
        v7 = 0;
    }
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  }
  while (v5);

  if ((v7 & 1) != 0)
    goto LABEL_14;
}

void __57__NTKKaleidoscopeSwatchMappedImageCache__pruneUnusedKeys__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;
  id v21;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0C944B0];
  objc_msgSend(v3, "deviceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceForNRDeviceUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  if (+[NTKEnumeratedEditOption numberOfOptionsForDevice:](NTKKaleidoscopeStyleOption, "numberOfOptionsForDevice:", v6))
  {
    v8 = 0;
    do
    {
      +[NTKEnumeratedEditOption optionAtIndex:forDevice:](NTKKaleidoscopeStyleOption, "optionAtIndex:forDevice:", v8, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v9);

      ++v8;
    }
    while (v8 < +[NTKEnumeratedEditOption numberOfOptionsForDevice:](NTKKaleidoscopeStyleOption, "numberOfOptionsForDevice:", v6));
  }
  +[NTKKaleidoscopeAssetOption optionWithAsset:forDevice:](NTKKaleidoscopeCustomAssetOption, "optionWithAsset:forDevice:", 1000, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v12);

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __57__NTKKaleidoscopeSwatchMappedImageCache__pruneUnusedKeys__block_invoke_2;
  v17[3] = &unk_1E6BD3D18;
  v18 = v7;
  v13 = *(id *)(a1 + 40);
  v14 = *(_QWORD *)(a1 + 48);
  v19 = v13;
  v20 = v14;
  v21 = v10;
  v15 = v10;
  v16 = v7;
  objc_msgSend(v3, "enumerateFacesUsingBlock:", v17);

}

void __57__NTKKaleidoscopeSwatchMappedImageCache__pruneUnusedKeys__block_invoke_2(uint64_t a1, void *a2)
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
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "resourceDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "faceStyle") == 23 && v4)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = *(id *)(a1 + 32);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
          v10 = *(void **)(a1 + 40);
          objc_msgSend((id)objc_opt_class(), "keyForAsset:style:resourceDirectory:", *(_QWORD *)(a1 + 56), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), v4, (_QWORD)v12);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v11);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
}

uint64_t __57__NTKKaleidoscopeSwatchMappedImageCache__pruneUnusedKeys__block_invoke_24(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(v3, "containsString:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8), (_QWORD)v11) & 1) != 0)
        {

          v9 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v3) ^ 1;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }

  v9 = 0;
LABEL_11:

  return v9;
}

- (void)faceCollectionDidLoad:(id)a3
{
  NSUInteger v4;

  v4 = -[NSArray indexOfObject:](self->_libraryCollections, "indexOfObject:", a3);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableArray setObject:atIndexedSubscript:](self->_loadedCollections, "setObject:atIndexedSubscript:", MEMORY[0x1E0C9AAB0], v4);
  -[NTKKaleidoscopeSwatchMappedImageCache _pruneUnusedKeys](self, "_pruneUnusedKeys");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedCollections, 0);
  objc_storeStrong((id *)&self->_libraryCollections, 0);
  objc_storeStrong(&self->_activeDeviceNotificationBlock, 0);
}

@end
