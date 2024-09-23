@implementation AVTResourceLocator

- (id)_init
{
  AVTResourceLocator *v2;
  uint64_t v3;
  NSMutableDictionary *imageCache;
  void *v5;
  uint64_t v6;
  NSURL *resourcesURL;
  void **p_resourcesURL;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  char v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSURL *v30;
  uint64_t v31;
  NSURL *environmentResourcesURL;
  uint64_t v33;
  NSURL *animojiResourcesURL;
  uint64_t v35;
  NSURL *memojiResourcesURL;
  uint64_t v37;
  NSURL *stickerResourcesURL;
  uint64_t v39;
  NSURL *poseResourcesURL;
  uint64_t v41;
  NSURL *memojiAssetsURL;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id result;
  NSURL *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  objc_super v56;
  int v57;
  NSURL *v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v56.receiver = self;
  v56.super_class = (Class)AVTResourceLocator;
  v2 = -[AVTResourceLocator init](&v56, sel_init);
  if (!v2)
    return v2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = objc_claimAutoreleasedReturnValue();
  imageCache = v2->_imageCache;
  v2->_imageCache = (NSMutableDictionary *)v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resourceURL");
  v6 = objc_claimAutoreleasedReturnValue();
  p_resourcesURL = (void **)&v2->_resourcesURL;
  resourcesURL = v2->_resourcesURL;
  v2->_resourcesURL = (NSURL *)v6;

  v9 = v2->_resourcesURL;
  if (!v9)
  {
    avt_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[AVTResourceLocator _init].cold.4(v10, v11, v12, v13, v14, v15, v16, v17);

    v9 = *p_resourcesURL;
  }
  objc_msgSend(v9, "path");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "containsString:", CFSTR("AvatarKit.framework"));

  if ((v19 & 1) != 0)
  {
LABEL_13:
    v30 = v2->_resourcesURL;
    -[NSURL URLByAppendingPathComponent:isDirectory:](v30, "URLByAppendingPathComponent:isDirectory:", CFSTR("environment"), 1);
    v31 = objc_claimAutoreleasedReturnValue();
    environmentResourcesURL = v2->_environmentResourcesURL;
    v2->_environmentResourcesURL = (NSURL *)v31;

    -[NSURL URLByAppendingPathComponent:isDirectory:](v30, "URLByAppendingPathComponent:isDirectory:", CFSTR("animoji"), 1);
    v33 = objc_claimAutoreleasedReturnValue();
    animojiResourcesURL = v2->_animojiResourcesURL;
    v2->_animojiResourcesURL = (NSURL *)v33;

    -[NSURL URLByAppendingPathComponent:isDirectory:](v30, "URLByAppendingPathComponent:isDirectory:", CFSTR("memoji"), 1);
    v35 = objc_claimAutoreleasedReturnValue();
    memojiResourcesURL = v2->_memojiResourcesURL;
    v2->_memojiResourcesURL = (NSURL *)v35;

    -[NSURL URLByAppendingPathComponent:isDirectory:](v30, "URLByAppendingPathComponent:isDirectory:", CFSTR("stickers"), 1);
    v37 = objc_claimAutoreleasedReturnValue();
    stickerResourcesURL = v2->_stickerResourcesURL;
    v2->_stickerResourcesURL = (NSURL *)v37;

    -[NSURL URLByAppendingPathComponent:isDirectory:](v30, "URLByAppendingPathComponent:isDirectory:", CFSTR("poses"), 1);
    v39 = objc_claimAutoreleasedReturnValue();
    poseResourcesURL = v2->_poseResourcesURL;
    v2->_poseResourcesURL = (NSURL *)v39;

    -[NSURL URLByAppendingPathComponent:isDirectory:](v2->_memojiResourcesURL, "URLByAppendingPathComponent:isDirectory:", CFSTR("assets"), 1);
    v41 = objc_claimAutoreleasedReturnValue();
    memojiAssetsURL = v2->_memojiAssetsURL;
    v2->_memojiAssetsURL = (NSURL *)v41;

    if (!v2->_memojiAssetsURL)
    {
      avt_default_log();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        -[AVTResourceLocator _init].cold.1(v43, v44, v45, v46, v47, v48, v49, v50);

    }
    -[AVTResourceLocator initCaches](v2, "initCaches");

    return v2;
  }
  avt_default_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    -[AVTResourceLocator _init].cold.3();

  if (!AVTLogAllowsInternalCrash())
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/System/Library/PrivateFrameworks/AvatarKit.framework"), 1);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *p_resourcesURL;
    *p_resourcesURL = (void *)v21;

    avt_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[AVTResourceLocator _init].cold.2((uint64_t)&v2->_resourcesURL, v23, v24, v25, v26, v27, v28, v29);

    goto LABEL_13;
  }
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v63 = 0u;
  os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  v52 = v2->_resourcesURL;
  v53 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "bundlePath");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 138412802;
  v58 = v52;
  v59 = 2112;
  v60 = v53;
  v61 = 2112;
  v62 = v55;
  _os_log_send_and_compose_impl();

  result = (id)_os_crash_msg();
  __break(1u);
  return result;
}

+ (id)sharedResourceLocator
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__AVTResourceLocator_sharedResourceLocator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (sharedResourceLocator_once != -1)
    dispatch_once(&sharedResourceLocator_once, block);
  return (id)sharedResourceLocator_sSharedResourceLocator;
}

void __43__AVTResourceLocator_sharedResourceLocator__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)sharedResourceLocator_sSharedResourceLocator;
  sharedResourceLocator_sSharedResourceLocator = v1;

}

+ (id)_resourcePathInDirectoryURL:(id)a3 subDirectory:(id)a4 name:(id)a5 ofType:(id)a6 isDirectory:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v7 = a7;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v11;
  v16 = v15;
  v17 = v15;
  if (v12)
  {
    objc_msgSend(v15, "URLByAppendingPathComponent:isDirectory:", v12, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v13)
  {
    objc_msgSend(v17, "URLByAppendingPathComponent:isDirectory:", v13, v7);
    v18 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v18;
  }
  if (v14)
  {
    objc_msgSend(v17, "URLByAppendingPathExtension:", v14);
    v19 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v19;
  }
  objc_msgSend(v17, "path");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)urlForFrameworkResourceAtPath:(uint64_t)a3 isDirectory:
{
  if (a1)
  {
    objc_msgSend(a1[2], "URLByAppendingPathComponent:isDirectory:", a2, a3);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (_QWORD)pathForEnvironmentResource:(uint64_t)a3 ofType:(uint64_t)a4 isDirectory:
{
  if (a1)
  {
    +[AVTResourceLocator _resourcePathInDirectoryURL:subDirectory:name:ofType:isDirectory:](AVTResourceLocator, "_resourcePathInDirectoryURL:subDirectory:name:ofType:isDirectory:", a1[3], 0, a2, a3, a4);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (_QWORD)pathForEnvironmentResource:(uint64_t)a3 ofType:(uint64_t)a4 inDirectory:(uint64_t)a5 isDirectory:
{
  if (a1)
  {
    +[AVTResourceLocator _resourcePathInDirectoryURL:subDirectory:name:ofType:isDirectory:](AVTResourceLocator, "_resourcePathInDirectoryURL:subDirectory:name:ofType:isDirectory:", a1[3], a4, a2, a3, a5);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (_QWORD)pathForAnimojiResource:(uint64_t)a3 ofType:(uint64_t)a4 isDirectory:
{
  if (a1)
  {
    +[AVTResourceLocator _resourcePathInDirectoryURL:subDirectory:name:ofType:isDirectory:](AVTResourceLocator, "_resourcePathInDirectoryURL:subDirectory:name:ofType:isDirectory:", a1[4], 0, a2, a3, a4);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (_QWORD)pathForAnimojiResource:(uint64_t)a3 ofType:(uint64_t)a4 inDirectory:(uint64_t)a5 isDirectory:
{
  if (a1)
  {
    +[AVTResourceLocator _resourcePathInDirectoryURL:subDirectory:name:ofType:isDirectory:](AVTResourceLocator, "_resourcePathInDirectoryURL:subDirectory:name:ofType:isDirectory:", a1[4], a4, a2, a3, a5);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)urlForMemojiAssetAtPath:(uint64_t)a3 isDirectory:
{
  if (a1)
  {
    objc_msgSend(a1[8], "URLByAppendingPathComponent:isDirectory:", a2, a3);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)urlForMemojiResourceAtPath:(uint64_t)a3 isDirectory:
{
  if (a1)
  {
    objc_msgSend(a1[5], "URLByAppendingPathComponent:isDirectory:", a2, a3);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (_QWORD)pathForMemojiResource:(uint64_t)a3 ofType:(uint64_t)a4 isDirectory:
{
  if (a1)
  {
    +[AVTResourceLocator _resourcePathInDirectoryURL:subDirectory:name:ofType:isDirectory:](AVTResourceLocator, "_resourcePathInDirectoryURL:subDirectory:name:ofType:isDirectory:", a1[5], 0, a2, a3, a4);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (_QWORD)pathForMemojiResource:(uint64_t)a3 ofType:(uint64_t)a4 inDirectory:(uint64_t)a5 isDirectory:
{
  if (a1)
  {
    +[AVTResourceLocator _resourcePathInDirectoryURL:subDirectory:name:ofType:isDirectory:](AVTResourceLocator, "_resourcePathInDirectoryURL:subDirectory:name:ofType:isDirectory:", a1[5], a4, a2, a3, a5);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)urlForStickerResourceAtPath:(uint64_t)a3 isDirectory:
{
  if (a1)
  {
    objc_msgSend(a1[6], "URLByAppendingPathComponent:isDirectory:", a2, a3);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (_QWORD)pathForStickerResource:(uint64_t)a3 ofType:(uint64_t)a4 isDirectory:
{
  if (a1)
  {
    +[AVTResourceLocator _resourcePathInDirectoryURL:subDirectory:name:ofType:isDirectory:](AVTResourceLocator, "_resourcePathInDirectoryURL:subDirectory:name:ofType:isDirectory:", a1[6], 0, a2, a3, a4);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (_QWORD)pathForStickerResource:(uint64_t)a3 ofType:(uint64_t)a4 inDirectory:(uint64_t)a5 isDirectory:
{
  if (a1)
  {
    +[AVTResourceLocator _resourcePathInDirectoryURL:subDirectory:name:ofType:isDirectory:](AVTResourceLocator, "_resourcePathInDirectoryURL:subDirectory:name:ofType:isDirectory:", a1[6], a4, a2, a3, a5);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (_QWORD)pathForPoseResource:(uint64_t)a3 ofType:(uint64_t)a4 isDirectory:
{
  if (a1)
  {
    +[AVTResourceLocator _resourcePathInDirectoryURL:subDirectory:name:ofType:isDirectory:](AVTResourceLocator, "_resourcePathInDirectoryURL:subDirectory:name:ofType:isDirectory:", a1[7], 0, a2, a3, a4);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (_QWORD)pathForPoseResource:(uint64_t)a3 ofType:(uint64_t)a4 inDirectory:(uint64_t)a5 isDirectory:
{
  if (a1)
  {
    +[AVTResourceLocator _resourcePathInDirectoryURL:subDirectory:name:ofType:isDirectory:](AVTResourceLocator, "_resourcePathInDirectoryURL:subDirectory:name:ofType:isDirectory:", a1[7], a4, a2, a3, a5);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (const)generatedPlistFolderName
{
  objc_opt_self();
  return CFSTR("generated plists");
}

- (void)imageWithPath:(uint64_t)a1
{
  id v3;
  void *ImageAtIndex;
  _QWORD *v5;
  void *v6;
  void *v7;
  const __CFURL *v8;
  CGImageSource *v9;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", v3);
    ImageAtIndex = (void *)objc_claimAutoreleasedReturnValue();

    if (!ImageAtIndex)
    {
      +[AVTResourceLocator sharedResourceLocator]();
      v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTResourceLocator pathForMemojiResource:ofType:isDirectory:](v5, (uint64_t)v6, 0, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7
        && (objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v7, 0),
            v8 = (const __CFURL *)objc_claimAutoreleasedReturnValue(),
            v9 = CGImageSourceCreateWithURL(v8, 0),
            v8,
            v9))
      {
        ImageAtIndex = CGImageSourceCreateImageAtIndex(v9, 0, 0);
        objc_msgSend(*(id *)(a1 + 8), "setObject:forKeyedSubscript:", ImageAtIndex, v3);
        if (ImageAtIndex)
          CGImageRelease((CGImageRef)ImageAtIndex);
        CFRelease(v9);
      }
      else
      {
        ImageAtIndex = 0;
      }

    }
  }
  else
  {
    ImageAtIndex = 0;
  }

  return ImageAtIndex;
}

- (void)initCaches
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DD1FA000, log, OS_LOG_TYPE_ERROR, "Error: [Cache] Shared cache is not writable, please check the app's entitlements", v1, 2u);
}

uint64_t __32__AVTResourceLocator_initCaches__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "deleteLegacyCache");
  objc_msgSend(*(id *)(a1 + 32), "deleteObsoleteVersionsInCache:currentVersion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 32), "deleteObsoleteVersionsInCache:currentVersion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (id)rootCacheURL
{
  if (a1)
    a1 = (id *)a1[9];
  return a1;
}

- (id)subdivDataCacheURL
{
  if (a1)
    a1 = (id *)a1[10];
  return a1;
}

- (void)deleteObsoleteVersionsInCache:(id)a3 currentVersion:(unint64_t)a4
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  int v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id obj;
  uint64_t v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  NSObject *v48;
  __int16 v49;
  void *v50;
  _BYTE v51[128];
  uint64_t v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v4;
  objc_msgSend(v5, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v4, 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (v7)
  {
    v8 = v7;
    v36 = *(_QWORD *)v44;
    v9 = *MEMORY[0x1E0C99998];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v44 != v36)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v10);
        objc_msgSend(v11, "lastPathComponent");
        v12 = objc_claimAutoreleasedReturnValue();
        if (!-[NSObject hasPrefix:](v12, "hasPrefix:", CFSTR("AvatarKit-")))
        {
          avt_default_log();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v48 = v12;
            _os_log_error_impl(&dword_1DD1FA000, v15, OS_LOG_TYPE_ERROR, "Error: [Cache] Unknown cache folder \"%@\", buf, 0xCu);
          }

LABEL_12:
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = v9;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v11, v17, 0, 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v19 = v18;
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
          if (v20)
          {
            v21 = v20;
            v22 = 0;
            v23 = *(_QWORD *)v40;
            do
            {
              for (i = 0; i != v21; ++i)
              {
                if (*(_QWORD *)v40 != v23)
                  objc_enumerationMutation(v19);
                v25 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
                v38 = 0;
                objc_msgSend(v25, "getResourceValue:forKey:error:", &v38, v9, 0);
                v22 += objc_msgSend(v38, "unsignedLongLongValue");
              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
            }
            while (v21);
          }
          else
          {
            v22 = 0;
          }

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = 0;
          v27 = objc_msgSend(v26, "removeItemAtURL:error:", v11, &v37);
          v28 = v37;

          if (v27)
          {
            objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", v22, 0);
            v29 = objc_claimAutoreleasedReturnValue();
            avt_default_log();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v11, "path");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v48 = v29;
              v49 = 2112;
              v50 = v31;
              _os_log_impl(&dword_1DD1FA000, v30, OS_LOG_TYPE_DEFAULT, "[Cache] Reclaimed %@ from obsolete cache: %@", buf, 0x16u);
              goto LABEL_24;
            }
            goto LABEL_25;
          }
          avt_default_log();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v11, "path");
            v30 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "description");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v48 = v30;
            v49 = 2112;
            v50 = v31;
            _os_log_error_impl(&dword_1DD1FA000, v29, OS_LOG_TYPE_ERROR, "Error: [Cache] Failed to delete %@ with error %@", buf, 0x16u);
LABEL_24:

LABEL_25:
          }

          goto LABEL_28;
        }
        -[NSObject substringFromIndex:](v12, "substringFromIndex:", 10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = AVTAvatarKitSnapshotVersionNumberFromString(v13);

        if (v14 < a4)
          goto LABEL_12;
LABEL_28:

        ++v10;
      }
      while (v10 != v8);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
      v8 = v32;
    }
    while (v32);
  }

}

- (void)deleteLegacyCache
{
  void *v3;
  void *v4;
  os_log_t v5;
  os_log_type_t v6;
  const char *v7;
  uint8_t *v8;
  void *v9;

  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  _os_log_error_impl(v4, v5, v6, v7, v8, 0x16u);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subdivDataCacheURL, 0);
  objc_storeStrong((id *)&self->_rootCacheURL, 0);
  objc_storeStrong((id *)&self->_memojiAssetsURL, 0);
  objc_storeStrong((id *)&self->_poseResourcesURL, 0);
  objc_storeStrong((id *)&self->_stickerResourcesURL, 0);
  objc_storeStrong((id *)&self->_memojiResourcesURL, 0);
  objc_storeStrong((id *)&self->_animojiResourcesURL, 0);
  objc_storeStrong((id *)&self->_environmentResourcesURL, 0);
  objc_storeStrong((id *)&self->_resourcesURL, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
}

- (void)_init
{
  OUTLINED_FUNCTION_1_0();
}

@end
