@implementation HFWallpaperLegacyFileManager

- (HFWallpaperLegacyFileManager)init
{
  HFWallpaperLegacyFileManager *v2;
  uint64_t v3;
  NSURL *wallpaperFolderURL;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HFWallpaperLegacyFileManager;
  v2 = -[HFWallpaperLegacyFileManager init](&v6, sel_init);
  if (v2)
  {
    +[HFUtilities wallpaperURL](HFUtilities, "wallpaperURL");
    v3 = objc_claimAutoreleasedReturnValue();
    wallpaperFolderURL = v2->_wallpaperFolderURL;
    v2->_wallpaperFolderURL = (NSURL *)v3;

  }
  return v2;
}

- (void)migrateCache:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  unint64_t v10;
  NSObject *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  HFWallpaper *v28;
  NSObject *p_super;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  char v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  __int128 v48;
  void (**v49)(id, void *, _QWORD, void *);
  HFWallpaperLegacyFileManager *v50;
  void *v51;
  os_log_t log;
  HFWallpaper *v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[4];
  NSObject *v63;
  __int16 v64;
  void *v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v49 = (void (**)(id, void *, _QWORD, void *))a3;
  -[HFWallpaperLegacyFileManager wallpaperFolderURL](self, "wallpaperFolderURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFWallpaperLegacyFileManager wallpaperFolderURL](self, "wallpaperFolderURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v9 = v8;
    v10 = 0x1E0CB3000uLL;
    v11 = v9;
    v12 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
    if (!v12)
      goto LABEL_35;
    v14 = v12;
    v56 = *MEMORY[0x1E0CB2B20];
    v57 = *(_QWORD *)v59;
    *(_QWORD *)&v13 = 138412290;
    v48 = v13;
    v50 = self;
    v54 = v11;
    while (1)
    {
      v15 = 0;
      v55 = v14;
      do
      {
        if (*(_QWORD *)v59 != v57)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * v15);
        -[HFWallpaperLegacyFileManager wallpaperFolderURL](self, "wallpaperFolderURL", v48);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "URLByAppendingPathComponent:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(v10 + 1568), "defaultManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "path");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "attributesOfItemAtPath:error:", v20, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "fileType");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v20) = objc_msgSend(v22, "isEqualToString:", v56);

        if ((_DWORD)v20)
        {
          v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v16);
          if (v23)
          {
            objc_msgSend(v18, "URLByAppendingPathComponent:", CFSTR("info.plist"));
            v24 = objc_claimAutoreleasedReturnValue();
            v25 = (void *)MEMORY[0x1E0C99D80];
            -[NSObject path](v24, "path");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "dictionaryWithContentsOfFile:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (v27)
            {
              v28 = -[HFWallpaper initWithDictionary:]([HFWallpaper alloc], "initWithDictionary:", v27);
              p_super = &v28->super;
              if (v28)
              {
                v51 = v27;
                v53 = v28;
                -[HFWallpaperLegacyFileManager filenameForType:variant:](self, "filenameForType:variant:", -[HFWallpaper type](v28, "type"), 0);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "URLByAppendingPathComponent:", v30);
                v31 = objc_claimAutoreleasedReturnValue();

                v32 = (void *)MEMORY[0x1E0CEA638];
                objc_msgSend(*(id *)(v10 + 1568), "defaultManager");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                log = v31;
                -[NSObject path](v31, "path");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "contentsAtPath:", v34);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "scale");
                objc_msgSend(v32, "imageWithData:scale:", v35);
                v37 = (void *)objc_claimAutoreleasedReturnValue();

                HFLogForCategory(0x47uLL);
                v38 = objc_claimAutoreleasedReturnValue();
                v39 = v38;
                if (v37)
                {
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    v63 = &v53->super;
                    v64 = 2112;
                    v65 = v23;
                    _os_log_impl(&dword_1DD34E000, v39, OS_LOG_TYPE_DEFAULT, "Migrating wallpaper %@ for HomeKit identifier %@", buf, 0x16u);
                  }

                  ((void (**)(id, void *, HFWallpaper *, void *))v49)[2](v49, v23, v53, v37);
                  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "path");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  v42 = objc_msgSend(v40, "removeItemAtPath:error:", v41, 0);

                  p_super = &v53->super;
                  v27 = v51;
                  if ((v42 & 1) == 0)
                  {
                    HFLogForCategory(0x47uLL);
                    v39 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                    {
                      objc_msgSend(v18, "path");
                      v43 = objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = v48;
                      v63 = v43;
                      _os_log_error_impl(&dword_1DD34E000, v39, OS_LOG_TYPE_ERROR, "Failed to remove wallpaper at path \"%@\", buf, 0xCu);

                      goto LABEL_26;
                    }
                    goto LABEL_27;
                  }
                }
                else
                {
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                  {
                    -[NSObject path](log, "path");
                    v47 = objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = v48;
                    v63 = v47;
                    _os_log_error_impl(&dword_1DD34E000, v39, OS_LOG_TYPE_ERROR, "Failed to read original wallpaper at path \"%@\", buf, 0xCu);

                  }
                  v27 = v51;
LABEL_26:
                  p_super = &v53->super;
LABEL_27:

                }
                self = v50;
                v10 = 0x1E0CB3000;
LABEL_29:
                v45 = log;
              }
              else
              {
                HFLogForCategory(0x47uLL);
                v45 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v18, "path");
                  log = v45;
                  v46 = objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v63 = v46;
                  v64 = 2112;
                  v65 = v27;
                  _os_log_error_impl(&dword_1DD34E000, log, OS_LOG_TYPE_ERROR, "Failed to create wallpaper at path \"%@\" from dict %@", buf, 0x16u);

                  goto LABEL_29;
                }
              }
LABEL_30:

            }
            else
            {
              HFLogForCategory(0x47uLL);
              p_super = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
              {
                -[NSObject path](v24, "path");
                v45 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v48;
                v63 = v45;
                _os_log_error_impl(&dword_1DD34E000, p_super, OS_LOG_TYPE_ERROR, "No wallpaper found at path \"%@\", buf, 0xCu);
                goto LABEL_30;
              }
            }

          }
          else
          {
            HFLogForCategory(0x47uLL);
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v18, "path");
              v44 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v48;
              v63 = v44;
              _os_log_error_impl(&dword_1DD34E000, v24, OS_LOG_TYPE_ERROR, "Unable to migrate non-wallpaper directory \"%@\", buf, 0xCu);

            }
          }

          v11 = v54;
          v14 = v55;
        }

        ++v15;
      }
      while (v14 != v15);
      v14 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
      if (!v14)
      {
LABEL_35:

        goto LABEL_38;
      }
    }
  }
  HFLogForCategory(0x47uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_ERROR, "Unable to access wallpaper directory", buf, 2u);
  }
LABEL_38:

}

- (id)clearAllWallpapers
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  void *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFWallpaperLegacyFileManager wallpaperFolderURL](self, "wallpaperFolderURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v6 = objc_msgSend(v3, "removeItemAtPath:error:", v5, &v12);
  v7 = v12;

  if ((v6 & 1) == 0)
  {
    HFLogForCategory(0x47uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[HFWallpaperLegacyFileManager wallpaperFolderURL](self, "wallpaperFolderURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v11;
      _os_log_error_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_ERROR, "Failed to remove all wallpapers at path \"%@\", buf, 0xCu);

    }
  }
  return v7;
}

- (id)filenameForType:(int64_t)a3 variant:(int64_t)a4
{
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;

  v5 = CFSTR(".jpg");
  if (!a3)
    v5 = CFSTR(".png");
  v6 = v5;
  if (a4 == 2)
  {
    v7 = CFSTR("blurred");
  }
  else if (a4 == 1)
  {
    v7 = CFSTR("processed");
  }
  else
  {
    if (a4)
    {
      NSLog(CFSTR("Unknown value for variant: %ld"), a4);
      v8 = 0;
      goto LABEL_11;
    }
    v7 = CFSTR("original");
  }
  -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v8;
}

- (NSURL)wallpaperFolderURL
{
  return self->_wallpaperFolderURL;
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
