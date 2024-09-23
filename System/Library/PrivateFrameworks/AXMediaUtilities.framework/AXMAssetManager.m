@implementation AXMAssetManager

+ (id)defaultManager
{
  if (defaultManager_onceToken != -1)
    dispatch_once(&defaultManager_onceToken, &__block_literal_global);
  return (id)defaultManager__Shared;
}

void __33__AXMAssetManager_defaultManager__block_invoke()
{
  AXMAssetManager *v0;
  void *v1;

  v0 = objc_alloc_init(AXMAssetManager);
  v1 = (void *)defaultManager__Shared;
  defaultManager__Shared = (uint64_t)v0;

}

- (id)_photoCaptionAssetsDirectory
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", AXCPSharedResourcesDirectory());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("Library/Accessibility/PhotoCaptionAssets"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_uncompiledModelsDirectoryForType:(unint64_t)a3
{
  return -[AXMAssetManager _modelsDirectoryForType:compiled:](self, "_modelsDirectoryForType:compiled:", a3, 0);
}

- (id)_compiledModelsDirectoryForType:(unint64_t)a3
{
  return -[AXMAssetManager _modelsDirectoryForType:compiled:](self, "_modelsDirectoryForType:compiled:", a3, 1);
}

- (id)_modelsDirectoryForType:(unint64_t)a3 compiled:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  if (a3 == 1)
  {
    v4 = a4;
    -[AXMAssetManager _photoCaptionAssetsDirectory](self, "_photoCaptionAssetsDirectory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
      v7 = CFSTR("CompiledModels");
    else
      v7 = CFSTR("UncompiledModels");
    objc_msgSend(v5, "URLByAppendingPathComponent:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)compiledModelAssetURLsOfType:(unint64_t)a3 sources:(unint64_t)a4
{
  return -[AXMAssetManager _modelAssetURLsOfType:sources:compiled:](self, "_modelAssetURLsOfType:sources:compiled:", a3, a4, 1);
}

- (id)uncompiledModelAssetURLsOfType:(unint64_t)a3 sources:(unint64_t)a4
{
  return -[AXMAssetManager _modelAssetURLsOfType:sources:compiled:](self, "_modelAssetURLsOfType:sources:compiled:", a3, a4, 0);
}

- (id)_modelAssetURLsOfType:(unint64_t)a3 sources:(unint64_t)a4 compiled:(BOOL)a5
{
  _BOOL8 v5;
  char v6;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  __CFString *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  int v23;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v5 = a5;
  v6 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 1 && (v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMAssetManager _modelsDirectoryForType:compiled:](self, "_modelsDirectoryForType:compiled:", 1, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    objc_msgSend(v10, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v11, 0, 1, &v32);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v32;
    if (v13)
    {
      AXMediaLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[AXMAssetManager _modelAssetURLsOfType:sources:compiled:].cold.1((uint64_t)v13, v14);
    }
    else
    {
      v26 = v11;
      v27 = v10;
      v15 = CFSTR("mlmodel");
      if (v5)
        v15 = CFSTR("mlmodelc");
      v14 = v15;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v25 = v12;
      v16 = v12;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v29 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            objc_msgSend(v21, "pathExtension");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "isEqualToString:", v14);

            if (v23)
              objc_msgSend(v9, "addObject:", v21);
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        }
        while (v18);
      }

      v11 = v26;
      v10 = v27;
      v12 = v25;
    }

  }
  return v9;
}

- (id)_modelAssetNamesOfType:(unint64_t)a3 sources:(unint64_t)a4 compiled:(BOOL)a5
{
  _BOOL8 v5;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v5 = a5;
  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[AXMAssetManager _modelAssetURLsOfType:sources:compiled:](self, "_modelAssetURLsOfType:sources:compiled:", a3, a4, v5, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "URLByDeletingPathExtension");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "lastPathComponent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v16);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  return v9;
}

- (id)compiledModelAssetNamesOfType:(unint64_t)a3 sources:(unint64_t)a4
{
  return -[AXMAssetManager _modelAssetNamesOfType:sources:compiled:](self, "_modelAssetNamesOfType:sources:compiled:", a3, a4, 1);
}

- (id)uncompiledModelAssetNamesOfType:(unint64_t)a3 sources:(unint64_t)a4
{
  return -[AXMAssetManager _modelAssetNamesOfType:sources:compiled:](self, "_modelAssetNamesOfType:sources:compiled:", a3, a4, 0);
}

- (id)compiledModelAssetURLForModelNamed:(id)a3 ofType:(unint64_t)a4 sources:(unint64_t)a5
{
  return -[AXMAssetManager _modelAssetURLForModelNamed:ofType:sources:compiled:](self, "_modelAssetURLForModelNamed:ofType:sources:compiled:", a3, a4, a5, 1);
}

- (id)uncompiledModelAssetURLForModelNamed:(id)a3 ofType:(unint64_t)a4 sources:(unint64_t)a5
{
  return -[AXMAssetManager _modelAssetURLForModelNamed:ofType:sources:compiled:](self, "_modelAssetURLForModelNamed:ofType:sources:compiled:", a3, a4, a5, 0);
}

- (id)_modelAssetURLForModelNamed:(id)a3 ofType:(unint64_t)a4 sources:(unint64_t)a5 compiled:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v6 = a6;
  v24 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  -[AXMAssetManager _modelAssetURLsOfType:sources:compiled:](self, "_modelAssetURLsOfType:sources:compiled:", a4, a5, v6);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v15, "URLByDeletingPathExtension", (_QWORD)v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "lastPathComponent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v17, "isEqualToString:", v10) & 1) != 0)
        {
          v12 = v15;

          goto LABEL_11;
        }

      }
      v12 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_11:

  return v12;
}

- (id)modelWithName:(id)a3 ofType:(unint64_t)a4 sources:(unint64_t)a5 compileIfNeeded:(BOOL)a6 persistCompiledModel:(BOOL)a7 error:(id *)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  id v33;
  void *v34;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v9 = a7;
  v10 = a6;
  v49 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  -[AXMAssetManager compiledModelAssetURLForModelNamed:ofType:sources:](self, "compiledModelAssetURLForModelNamed:ofType:sources:", v14, a4, a5);
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    v44 = 0;
    objc_msgSend(MEMORY[0x1E0C9E940], "modelWithContentsOfURL:error:", v15, &v44);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v44;
    v19 = v18;
    if (v18)
    {
      if (a8)
        *a8 = objc_retainAutorelease(v18);
    }
    else
    {
      AXMediaLogCommon();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v46 = v14;
        v47 = 2112;
        v48 = v16;
        _os_log_impl(&dword_1B0E3B000, v32, OS_LOG_TYPE_INFO, "Using pre-compiled model for name '%@': %@", buf, 0x16u);
      }

    }
    v33 = v17;
    goto LABEL_23;
  }
  if (!v10)
    goto LABEL_21;
  -[AXMAssetManager uncompiledModelAssetURLForModelNamed:ofType:sources:](self, "uncompiledModelAssetURLForModelNamed:ofType:sources:", v14, a4, a5);
  v20 = objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    if (a8)
    {
      _AXMMakeError(0, CFSTR("No uncompiled model found with name: %@"), v21, v22, v23, v24, v25, v26, (uint64_t)v14);
      v16 = 0;
      v34 = 0;
      v19 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
LABEL_21:
    v16 = 0;
    v34 = 0;
    v19 = 0;
    goto LABEL_22;
  }
  v16 = (void *)v20;
  AXMediaLogCommon();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v46 = v16;
    _os_log_impl(&dword_1B0E3B000, v27, OS_LOG_TYPE_DEFAULT, "Will compile MLModel at URLL: %@", buf, 0xCu);
  }

  v43 = 0;
  objc_msgSend(MEMORY[0x1E0C9E940], "compileModelAtURL:error:", v16, &v43);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v43;
  AXMediaLogCommon();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v46 = v28;
    _os_log_impl(&dword_1B0E3B000, v30, OS_LOG_TYPE_DEFAULT, "Will compile MLModel. Result URL: %@", buf, 0xCu);
  }

  if (!v29)
  {
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMAssetManager _compiledModelsDirectoryForType:](self, "_compiledModelsDirectoryForType:", a4);
      v37 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "lastPathComponent");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v37, "URLByAppendingPathComponent:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = 0;
      LOBYTE(v37) = objc_msgSend(v36, "moveItemAtURL:toURL:error:", v28, v39, &v42);
      v40 = v42;
      v29 = v40;
      if ((v37 & 1) == 0)
      {
        if (a8)
          *a8 = objc_retainAutorelease(v40);

        goto LABEL_14;
      }

      v28 = v39;
    }
    else
    {
      v29 = 0;
    }
    v41 = v29;
    objc_msgSend(MEMORY[0x1E0C9E940], "modelWithContentsOfURL:error:", v28, &v41);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v41;

    if (a8 && v19)
      *a8 = objc_retainAutorelease(v19);

LABEL_22:
    v33 = v34;
LABEL_23:
    v31 = v33;
    goto LABEL_24;
  }
  if (a8)
  {
    v29 = objc_retainAutorelease(v29);
    *a8 = v29;
  }
LABEL_14:

  v31 = 0;
  v19 = v29;
LABEL_24:

  return v31;
}

- (void)_modelAssetURLsOfType:(uint64_t)a1 sources:(NSObject *)a2 compiled:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B0E3B000, a2, OS_LOG_TYPE_ERROR, "Could not fetch uncompiled photo caption models: %@", (uint8_t *)&v2, 0xCu);
}

@end
