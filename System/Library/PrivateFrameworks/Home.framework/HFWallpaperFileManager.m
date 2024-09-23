@implementation HFWallpaperFileManager

- (HFWallpaperFileManager)init
{
  HFWallpaperFileManager *v2;
  uint64_t v3;
  NSURL *wallpaperFolderURL;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HFWallpaperFileManager;
  v2 = -[HFWallpaperFileManager init](&v6, sel_init);
  if (v2)
  {
    +[HFUtilities wallpaperURL](HFUtilities, "wallpaperURL");
    v3 = objc_claimAutoreleasedReturnValue();
    wallpaperFolderURL = v2->_wallpaperFolderURL;
    v2->_wallpaperFolderURL = (NSURL *)v3;

  }
  return v2;
}

- (BOOL)originalImageExistsForWallpaper:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = a3;
  if (objc_msgSend(v4, "type") == 4)
  {
    -[HFWallpaperFileManager fileNameForDefaultBlurWallpaper:userInterfaceStyle:](self, "fileNameForDefaultBlurWallpaper:userInterfaceStyle:", v4, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFWallpaperFileManager fileNameForDefaultBlurWallpaper:userInterfaceStyle:](self, "fileNameForDefaultBlurWallpaper:userInterfaceStyle:", v4, 2);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = 0;
    if (v5 && v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFWallpaperFileManager wallpaperFolderURL](self, "wallpaperFolderURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "URLByAppendingPathComponent:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "path");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v9, "fileExistsAtPath:", v12);

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFWallpaperFileManager wallpaperFolderURL](self, "wallpaperFolderURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "URLByAppendingPathComponent:", v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v12) = objc_msgSend(v14, "fileExistsAtPath:", v17);

      v8 = v13 & v12;
    }
  }
  else
  {
    if (objc_msgSend(v4, "type") == 6)
    {
      -[HFWallpaperFileManager fileNameForCustomBlurWallpaper:](self, "fileNameForCustomBlurWallpaper:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        v8 = 0;
        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFWallpaperFileManager wallpaperFolderURL](self, "wallpaperFolderURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "URLByAppendingPathComponent:", v5);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v7;
    }
    else
    {
      -[HFWallpaperFileManager filenameForWallpaper:](self, "filenameForWallpaper:", v4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
      {
        v8 = 0;
        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFWallpaperFileManager wallpaperFolderURL](self, "wallpaperFolderURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFWallpaperFileManager filenameForWallpaper:](self, "filenameForWallpaper:", v4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "URLByAppendingPathComponent:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v5;
    }
    v8 = objc_msgSend(v21, "fileExistsAtPath:", v20);

  }
LABEL_12:

LABEL_13:
  return v8;
}

- (id)filenameForWallpaper:(id)a3
{
  id v3;
  unint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "type");
  if (v4 > 6)
    v5 = 0;
  else
    v5 = off_1EA7365A8[v4];
  objc_msgSend(v3, "assetIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByAppendingPathExtension:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSURL)wallpaperFolderURL
{
  return self->_wallpaperFolderURL;
}

- (id)originalImageForWallpaper:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (objc_msgSend(v4, "type") == 4)
  {
    -[HFWallpaperFileManager fileNameForDefaultBlurWallpaper:userInterfaceStyle:](self, "fileNameForDefaultBlurWallpaper:userInterfaceStyle:", v4, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFWallpaperFileManager fileNameForDefaultBlurWallpaper:userInterfaceStyle:](self, "fileNameForDefaultBlurWallpaper:userInterfaceStyle:", v4, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFWallpaperFileManager _originalImageForWallpaper:withFileName:](self, "_originalImageForWallpaper:withFileName:", v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFWallpaperFileManager _originalImageForWallpaper:withFileName:](self, "_originalImageForWallpaper:withFileName:", v4, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageAsset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "registerImage:withTraitCollection:", v8, v10);

  }
  else
  {
    if (objc_msgSend(v4, "type") == 6)
      -[HFWallpaperFileManager fileNameForCustomBlurWallpaper:](self, "fileNameForCustomBlurWallpaper:", v4);
    else
      -[HFWallpaperFileManager filenameForWallpaper:](self, "filenameForWallpaper:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFWallpaperFileManager _originalImageForWallpaper:withFileName:](self, "_originalImageForWallpaper:withFileName:", v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)_originalImageForWallpaper:(id)a3 withFileName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HFWallpaperFileManager wallpaperFolderURL](self, "wallpaperFolderURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(0x47uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "Retrieving original image for wallpaper %@", buf, 0xCu);
  }

  v17 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v9, 1, &v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v17;
  v13 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "scale");
  objc_msgSend(v13, "imageWithData:scale:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    NSLog(CFSTR("Unable to load original wallpaper image off disk for wallpaper %@ (error: %@)"), v6, v12);

  return v15;
}

- (void)saveOriginalImage:(id)a3 forWallpaper:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "type") == 4)
  {
    -[HFWallpaperFileManager fileNameForDefaultBlurWallpaper:userInterfaceStyle:](self, "fileNameForDefaultBlurWallpaper:userInterfaceStyle:", v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFWallpaperFileManager fileNameForDefaultBlurWallpaper:userInterfaceStyle:](self, "fileNameForDefaultBlurWallpaper:userInterfaceStyle:", v6, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "imageAsset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageWithTraitCollection:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "imageAsset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageWithTraitCollection:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFWallpaperFileManager _saveOriginalImage:forWallpaper:withFileName:](self, "_saveOriginalImage:forWallpaper:withFileName:", v11, v6, v7);
    -[HFWallpaperFileManager _saveOriginalImage:forWallpaper:withFileName:](self, "_saveOriginalImage:forWallpaper:withFileName:", v14, v6, v8);

  }
  else if (objc_msgSend(v6, "type") == 6)
  {
    -[HFWallpaperFileManager fileNameForCustomBlurWallpaper:](self, "fileNameForCustomBlurWallpaper:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFWallpaperManager sharedInstance](HFWallpaperManager, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "processOriginalBlurredImageFromWallpaper:originalImage:", v6, v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFWallpaperFileManager _saveOriginalImage:forWallpaper:withFileName:](self, "_saveOriginalImage:forWallpaper:withFileName:", v16, v6, v7);
    -[HFWallpaperFileManager filenameForWallpaper:](self, "filenameForWallpaper:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFWallpaperFileManager _saveOriginalImage:forWallpaper:withFileName:](self, "_saveOriginalImage:forWallpaper:withFileName:", v18, v6, v17);

  }
  else
  {
    -[HFWallpaperFileManager filenameForWallpaper:](self, "filenameForWallpaper:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFWallpaperFileManager _saveOriginalImage:forWallpaper:withFileName:](self, "_saveOriginalImage:forWallpaper:withFileName:", v18, v6, v7);
  }

}

- (void)_saveOriginalImage:(id)a3 forWallpaper:(id)a4 withFileName:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  uint64_t v21;
  UIImage *v22;
  UIImage *v23;
  NSObject *v24;
  void *v25;
  char v26;
  NSObject *v27;
  NSObject *v28;
  int v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  HFLogForCategory(0x47uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v29 = 138412546;
    v30 = v10;
    v31 = 2112;
    v32 = v9;
    _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "Writing out original image at wallpaper path: %@ for wallpaper %@", (uint8_t *)&v29, 0x16u);
  }

  -[HFWallpaperFileManager wallpaperFolderURL](self, "wallpaperFolderURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URLByAppendingPathComponent:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFWallpaperFileManager wallpaperFolderURL](self, "wallpaperFolderURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URLByAppendingPathComponent:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "path");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v15, "fileExistsAtPath:", v18);

  if (v19)
  {
    HFLogForCategory(0x47uLL);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v29 = 138412546;
      v30 = v9;
      v31 = 2112;
      v32 = v10;
      _os_log_impl(&dword_1DD34E000, v20, OS_LOG_TYPE_DEFAULT, "Skipping write for wallpaper %@ as fileName \"%@\" already exists", (uint8_t *)&v29, 0x16u);
    }
  }
  else
  {
    v21 = objc_msgSend(v9, "type");
    objc_msgSend(v8, "imageWithNormalizedOrientation");
    v22 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v21)
      UIImageJPEGRepresentation(v22, 1.0);
    else
      UIImagePNGRepresentation(v22);
    v20 = objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      HFLogForCategory(0x47uLL);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v29 = 138412290;
        v30 = v9;
        _os_log_error_impl(&dword_1DD34E000, v24, OS_LOG_TYPE_ERROR, "Failed to generate image data for wallpaper %@", (uint8_t *)&v29, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "createFileAtPath:contents:attributes:", v14, v20, 0);

    HFLogForCategory(0x47uLL);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if ((v26 & 1) != 0)
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v29 = 138412546;
        v30 = v9;
        v31 = 2112;
        v32 = v14;
        _os_log_impl(&dword_1DD34E000, v28, OS_LOG_TYPE_DEFAULT, "Wrote original wallpaper image %@ to path \"%@\", (uint8_t *)&v29, 0x16u);
      }
    }
    else if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v29 = 138412290;
      v30 = v14;
      _os_log_error_impl(&dword_1DD34E000, v28, OS_LOG_TYPE_ERROR, "Failed to write original wallpaper image at path \"%@\", (uint8_t *)&v29, 0xCu);
    }

  }
}

- (void)pruneUnusedOriginalWallpaperImages:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  HFWallpaperFileManager *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[5];
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __61__HFWallpaperFileManager_pruneUnusedOriginalWallpaperImages___block_invoke;
  v34[3] = &unk_1EA736588;
  v34[4] = self;
  v6 = v5;
  v35 = v6;
  v27 = v4;
  objc_msgSend(v4, "na_each:", v34);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = self;
  -[HFWallpaperFileManager wallpaperFolderURL](self, "wallpaperFolderURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentsOfDirectoryAtPath:error:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v31;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v15);
        if ((objc_msgSend(v6, "containsObject:", v16) & 1) == 0)
        {
          -[HFWallpaperFileManager wallpaperFolderURL](v28, "wallpaperFolderURL");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "URLByAppendingPathComponent:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "path");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 0;
          v21 = objc_msgSend(v19, "removeItemAtPath:error:", v20, &v29);
          v22 = v29;

          HFLogForCategory(0x47uLL);
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = v23;
          if (v21)
          {
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v18, "path");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v37 = v25;
              _os_log_impl(&dword_1DD34E000, v24, OS_LOG_TYPE_DEFAULT, "Removed unused wallpaper at path \"%@\", buf, 0xCu);
              goto LABEL_10;
            }
          }
          else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v18, "path");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v37 = v25;
            v38 = 2112;
            v39 = v22;
            _os_log_error_impl(&dword_1DD34E000, v24, OS_LOG_TYPE_ERROR, "Failed to remove wallpaper at path \"%@\" with error %@", buf, 0x16u);
LABEL_10:

          }
        }
        ++v15;
      }
      while (v13 != v15);
      v26 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
      v13 = v26;
    }
    while (v26);
  }

}

void __61__HFWallpaperFileManager_pruneUnusedOriginalWallpaperImages___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "type") == 4)
  {
    objc_msgSend(*(id *)(a1 + 32), "fileNameForDefaultBlurWallpaper:userInterfaceStyle:", v7, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "fileNameForDefaultBlurWallpaper:userInterfaceStyle:", v7, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "na_safeAddObject:", v3);
  }
  else
  {
    v5 = objc_msgSend(v7, "type");
    v6 = *(void **)(a1 + 32);
    if (v5 != 6)
    {
      objc_msgSend(v6, "filenameForWallpaper:", v7);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "na_safeAddObject:", v3);
      goto LABEL_7;
    }
    objc_msgSend(v6, "fileNameForCustomBlurWallpaper:", v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "na_safeAddObject:", v3);
    objc_msgSend(*(id *)(a1 + 32), "filenameForWallpaper:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 40), "na_safeAddObject:", v4);

LABEL_7:
}

- (id)fileNameForDefaultBlurWallpaper:(id)a3 userInterfaceStyle:(int64_t)a4
{
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "assetIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a4 == 2)
    v7 = CFSTR("_dark");
  else
    v7 = CFSTR("_light");
  objc_msgSend(v5, "stringByAppendingString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringByAppendingPathExtension:", CFSTR("jpg"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)fileNameForCustomBlurWallpaper:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "assetIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("_blur"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByAppendingPathExtension:", CFSTR("jpg"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setWallpaperFolderURL:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperFolderURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperFolderURL, 0);
}

@end
