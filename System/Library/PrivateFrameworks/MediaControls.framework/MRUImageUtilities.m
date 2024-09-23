@implementation MRUImageUtilities

+ (MSVLRUDictionary)cache
{
  if (cache_onceToken != -1)
    dispatch_once(&cache_onceToken, &__block_literal_global_26);
  return (MSVLRUDictionary *)(id)cache___cache;
}

void __26__MRUImageUtilities_cache__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4D078]), "initWithMaximumCapacity:", 5);
  v1 = (void *)cache___cache;
  cache___cache = v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", 0x1E5820D28, 0, 0, &__block_literal_global_38);

}

void __26__MRUImageUtilities_cache__block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[MRUImageLoaderCoordinator sharedCoordinator](MRUImageLoaderCoordinator, "sharedCoordinator");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "registeredLoaderArtworkIdentifiers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend((id)cache___cache, "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v7, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v1, "containsObject:", v8);

        if (v9)
        {
          objc_msgSend(v7, "cancelEvictionTimer");
        }
        else
        {
          objc_msgSend(v7, "evictionTimer");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v10)
            objc_msgSend(v7, "startEvictionTimer");
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

+ (void)clearCache
{
  id v2;

  +[MRUImageUtilities cache](MRUImageUtilities, "cache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

+ (id)sourceDataForImage:(id)a3
{
  objc_msgSend(objc_retainAutorelease(a3), "CGImage");
  return (id)CGImageCopySourceData();
}

+ (BOOL)imageIsJPEG:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  char v7;

  v3 = a3;
  v4 = v3;
  if (v3 && (v5 = objc_retainAutorelease(v3), objc_msgSend(v5, "CGImage")))
  {
    objc_msgSend(objc_retainAutorelease(v5), "CGImage");
    MSVImageUtilitiesCopyUTTypeForImage();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("public.jpeg"));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)imageIsEfficientFormat:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  char v7;

  v3 = a3;
  v4 = v3;
  if (v3 && (v5 = objc_retainAutorelease(v3), objc_msgSend(v5, "CGImage")))
  {
    objc_msgSend(objc_retainAutorelease(v5), "CGImage");
    MSVImageUtilitiesCopyUTTypeForImage();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("public.jpeg")) & 1) != 0
      || (objc_msgSend(v6, "isEqualToString:", CFSTR("public.heic")) & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("public.heif"));
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)jpegDataForImage:(id)a3
{
  UIImage *v3;
  void *v4;
  NSObject *v5;
  int v7;
  UIImage *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (UIImage *)a3;
  if (!+[MRUImageUtilities imageIsJPEG:](MRUImageUtilities, "imageIsJPEG:", v3)
    || (+[MRUImageUtilities sourceDataForImage:](MRUImageUtilities, "sourceDataForImage:", v3),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    UIImageJPEGRepresentation(v3, 0.9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      MCLogCategoryDefault();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 138412290;
        v8 = v3;
        _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_ERROR, "[MRUImageUtilities] Failed to produce JPEG data for image %@.", (uint8_t *)&v7, 0xCu);
      }

      v4 = 0;
    }
  }

  return v4;
}

+ (id)formatImage:(id)a3 forDisplayAtSize:(CGSize)a4
{
  return +[MRUImageUtilities formatImage:withIdentifier:forDisplayAtSize:useCache:](MRUImageUtilities, "formatImage:withIdentifier:forDisplayAtSize:useCache:", a3, 0, 0, a4.width, a4.height);
}

+ (id)formatImage:(id)a3 withIdentifier:(id)a4 forDisplayAtSize:(CGSize)a5
{
  return +[MRUImageUtilities formatImage:withIdentifier:forDisplayAtSize:useCache:](MRUImageUtilities, "formatImage:withIdentifier:forDisplayAtSize:useCache:", a3, a4, 1, a5.width, a5.height);
}

+ (id)formatImage:(id)a3 withIdentifier:(id)a4 forDisplayAtSize:(CGSize)a5 useCache:(BOOL)a6
{
  _BOOL4 v6;
  double height;
  double width;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  id v26;
  void *v27;
  int v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  int v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  int v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  int v50;
  NSObject *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  id v65;
  _BOOL4 v66;
  _BOOL4 v67;
  void *v68;
  int v69;
  NSObject *v70;
  id v71;
  NSObject *v72;
  void *v73;
  NSObject *v74;
  void *v75;
  int v76;
  NSObject *v77;
  uint8_t buf[4];
  void *v80;
  __int16 v81;
  id v82;
  __int16 v83;
  NSObject *v84;
  uint64_t v85;
  CGSize v86;
  CGSize v87;
  CGSize v88;

  v6 = a6;
  height = a5.height;
  width = a5.width;
  v85 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D4C638], "currentSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "verboseImageLoadingLogging");

  if (v15)
  {
    MCLogCategoryDefault();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v86.width = width;
      v86.height = height;
      NSStringFromCGSize(v86);
      v17 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v80 = v13;
      v81 = 2112;
      v82 = v10;
      v83 = 2112;
      v84 = v17;
      _os_log_impl(&dword_1AA991000, v16, OS_LOG_TYPE_DEFAULT, "[MRUImageUtilities] formatImageForDisplay<%@> %@ at size: %@", buf, 0x20u);

    }
  }
  if (v10)
  {
    if (!v6)
    {
      v26 = v10;
      v20 = 0;
      goto LABEL_47;
    }
    v18 = objc_msgSend(v11, "copy");
    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E0D4C638], "currentSettings");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "verboseImageLoadingLogging");

      if (v28)
      {
        MCLogCategoryDefault();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v80 = v13;
          _os_log_impl(&dword_1AA991000, v29, OS_LOG_TYPE_DEFAULT, "[MRUImageUtilities] formatImageForDisplay<%@> cannot generate derived image for nil identifier. Will format original.", buf, 0xCu);
        }

      }
      v26 = v10;
      v20 = 0;
      goto LABEL_46;
    }
    +[MRUImageUtilities cache](MRUImageUtilities, "cache");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", v18);
    v20 = objc_claimAutoreleasedReturnValue();

    -[NSObject image](v20, "image");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = (void *)v21;
    }
    else
    {
      +[MRUImageUtilities derivedSourceImageForImage:](MRUImageUtilities, "derivedSourceImageForImage:", v10);
      v30 = objc_claimAutoreleasedReturnValue();
      if (!v30)
      {
        MCLogCategoryDefault();
        v77 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v80 = v13;
          _os_log_impl(&dword_1AA991000, v77, OS_LOG_TYPE_ERROR, "[MRUImageUtilities] formatImageForDisplay<%@> returning nil because unable to create derived image.", buf, 0xCu);
        }
        v22 = 0;
        goto LABEL_82;
      }
      v22 = (void *)v30;
      objc_msgSend(MEMORY[0x1E0D4C638], "currentSettings");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "verboseImageLoadingLogging");

      if (v32)
      {
        MCLogCategoryDefault();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v22, "size");
          NSStringFromCGSize(v87);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v80 = v13;
          v81 = 2112;
          v82 = v34;
          v83 = 2112;
          v84 = v18;
          _os_log_impl(&dword_1AA991000, v33, OS_LOG_TYPE_DEFAULT, "[MRUImageUtilities] formatImageForDisplay<%@> setting derived image of size %@ for identifier %@.", buf, 0x20u);

        }
      }
      v35 = objc_opt_new();

      -[NSObject setImage:](v35, "setImage:", v22);
      -[NSObject setIdentifier:](v35, "setIdentifier:", v18);
      -[NSObject setFittingSize:](v35, "setFittingSize:", width, height);
      -[NSObject startEvictionTimer](v35, "startEvictionTimer");
      +[MRUImageUtilities cache](MRUImageUtilities, "cache");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setObject:forKey:", v35, v18);

      v20 = v35;
    }
    objc_msgSend(v22, "size");
    if (v37 >= width && (objc_msgSend(v22, "size"), v38 >= height)
      || (objc_msgSend(v22, "size"), v40 = v39, objc_msgSend(v10, "size"), v40 >= v41)
      && (objc_msgSend(v22, "size"), v43 = v42, objc_msgSend(v10, "size"), v43 >= v44))
    {
      v26 = v22;
LABEL_42:
      if (v20)
      {
        -[NSObject fittingSize](v20, "fittingSize");
        if (v55 < width || (-[NSObject fittingSize](v20, "fittingSize"), v56 < height))
          -[NSObject setFittingSize:](v20, "setFittingSize:", width, height);
      }
LABEL_46:

LABEL_47:
      objc_msgSend(v26, "size");
      v58 = v57;
      objc_msgSend(v10, "size");
      if (v58 > v59 || (objc_msgSend(v26, "size"), v61 = v60, objc_msgSend(v10, "size"), v61 > v62))
      {
        objc_msgSend(v10, "size");
        if (v63 >= width || (objc_msgSend(v10, "size"), v64 >= height))
        {
          if (!+[MRUImageUtilities shouldTranscodeImage:](MRUImageUtilities, "shouldTranscodeImage:", v10))
          {
            v65 = v10;

            v26 = v65;
          }
        }
      }
      v66 = +[MRUImageUtilities shouldResizeImage:forFittingSize:](MRUImageUtilities, "shouldResizeImage:forFittingSize:", v26, width, height);
      v67 = +[MRUImageUtilities shouldTranscodeImage:](MRUImageUtilities, "shouldTranscodeImage:", v26);
      objc_msgSend(MEMORY[0x1E0D4C638], "currentSettings");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v68, "verboseImageLoadingLogging");

      if (v66)
      {
        if (v69)
        {
          MCLogCategoryDefault();
          v70 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v80 = v13;
            _os_log_impl(&dword_1AA991000, v70, OS_LOG_TYPE_DEFAULT, "[MRUImageUtilities] formatImageForDisplay<%@> resizing image.", buf, 0xCu);
          }

        }
        +[MRUImageUtilities resizedImage:forFittingSize:](MRUImageUtilities, "resizedImage:forFittingSize:", v26, width, height);
        v71 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v67)
        {
          if (v69)
          {
            MCLogCategoryDefault();
            v72 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v80 = v13;
              _os_log_impl(&dword_1AA991000, v72, OS_LOG_TYPE_DEFAULT, "[MRUImageUtilities] formatImageForDisplay<%@> transcoding image.", buf, 0xCu);
            }

          }
          +[MRUImageUtilities jpegDataForImage:](MRUImageUtilities, "jpegDataForImage:", v26);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          if (v73)
          {
            objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v73);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v25 = 0;
          }

          goto LABEL_74;
        }
        if (v69)
        {
          MCLogCategoryDefault();
          v74 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v80 = v13;
            _os_log_impl(&dword_1AA991000, v74, OS_LOG_TYPE_DEFAULT, "[MRUImageUtilities] formatImageForDisplay<%@> derived image is appropriate for display.", buf, 0xCu);
          }

        }
        v71 = v26;
      }
      v25 = v71;
LABEL_74:
      objc_msgSend(MEMORY[0x1E0D4C638], "currentSettings");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = objc_msgSend(v75, "verboseImageLoadingLogging");

      if (!v76)
      {
LABEL_84:

LABEL_85:
        goto LABEL_86;
      }
      MCLogCategoryDefault();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v80 = v13;
        v81 = 2112;
        v82 = v25;
        _os_log_impl(&dword_1AA991000, v18, OS_LOG_TYPE_DEFAULT, "[MRUImageUtilities] formatImageForDisplay<%@> Result: %@", buf, 0x16u);
      }
LABEL_83:

      goto LABEL_84;
    }
    objc_msgSend(MEMORY[0x1E0D4C638], "currentSettings");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "verboseImageLoadingLogging");

    if (v46)
    {
      MCLogCategoryDefault();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v80 = v13;
        _os_log_impl(&dword_1AA991000, v47, OS_LOG_TYPE_DEFAULT, "[MRUImageUtilities] formatImageForDisplay<%@> regenerating derived image.", buf, 0xCu);
      }

    }
    +[MRUImageUtilities derivedSourceImageForImage:](MRUImageUtilities, "derivedSourceImageForImage:", v10);
    v48 = objc_claimAutoreleasedReturnValue();
    if (v48)
    {
      v26 = (id)v48;
      objc_msgSend(MEMORY[0x1E0D4C638], "currentSettings");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "verboseImageLoadingLogging");

      if (v50)
      {
        MCLogCategoryDefault();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v26, "size");
          NSStringFromCGSize(v88);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v80 = v13;
          v81 = 2112;
          v82 = v52;
          v83 = 2112;
          v84 = v18;
          _os_log_impl(&dword_1AA991000, v51, OS_LOG_TYPE_DEFAULT, "[MRUImageUtilities] formatImageForDisplay<%@> setting regenerated derived image of size %@ for identifier %@.", buf, 0x20u);

        }
      }
      v53 = objc_opt_new();

      -[NSObject setImage:](v53, "setImage:", v26);
      -[NSObject setIdentifier:](v53, "setIdentifier:", v18);
      -[NSObject setFittingSize:](v53, "setFittingSize:", width, height);
      -[NSObject startEvictionTimer](v53, "startEvictionTimer");
      +[MRUImageUtilities cache](MRUImageUtilities, "cache");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setObject:forKey:", v53, v18);

      v20 = v53;
      goto LABEL_42;
    }
    MCLogCategoryDefault();
    v77 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v80 = v13;
      _os_log_impl(&dword_1AA991000, v77, OS_LOG_TYPE_ERROR, "[MRUImageUtilities] formatImageForDisplay<%@> returning nil due to error in regenerating derived image", buf, 0xCu);
    }
LABEL_82:

    v25 = 0;
    v26 = v22;
    goto LABEL_83;
  }
  objc_msgSend(MEMORY[0x1E0D4C638], "currentSettings");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "verboseImageLoadingLogging");

  if (v24)
  {
    MCLogCategoryDefault();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v80 = v13;
      _os_log_impl(&dword_1AA991000, v20, OS_LOG_TYPE_DEFAULT, "[MRUImageUtilities] formatImageForDisplay<%@> returning nil for nil image.", buf, 0xCu);
    }
    v25 = 0;
    goto LABEL_85;
  }
  v25 = 0;
LABEL_86:

  return v25;
}

+ (id)formattedImageForIdentifier:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _BOOL4 v14;
  double v15;
  double v16;
  _BOOL4 v17;
  int v18;
  BOOL v19;
  void *v20;

  height = a4.height;
  width = a4.width;
  v6 = (void *)objc_msgSend(a3, "copy");
  +[MRUImageUtilities cache](MRUImageUtilities, "cache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "size");
  if (width >= height)
    v11 = width;
  else
    v11 = height;
  if (v11 <= 180.0)
    v12 = 4.0;
  else
    v12 = 6.0;
  if (v10 >= width - v12)
  {
    v14 = 1;
  }
  else
  {
    objc_msgSend(v9, "size");
    v14 = v13 >= height - v12;
  }
  objc_msgSend(v8, "fittingSize");
  if (v15 >= width)
  {
    v17 = 1;
  }
  else
  {
    objc_msgSend(v8, "fittingSize");
    v17 = v16 >= height;
  }
  v18 = v14 || v17;
  if (v9)
    v19 = v18 == 0;
  else
    v19 = 1;
  if (v19)
  {
    v20 = 0;
  }
  else
  {
    +[MRUImageUtilities formatImage:withIdentifier:forDisplayAtSize:useCache:](MRUImageUtilities, "formatImage:withIdentifier:forDisplayAtSize:useCache:", v9, v6, 0, width, height);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

+ (id)derivedSourceImageForImage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  _BOOL4 v12;
  _BOOL4 v13;
  void *v14;
  int v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[MRUImageLoaderCoordinator sharedCoordinator](MRUImageLoaderCoordinator, "sharedCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestSize");
  v8 = v7;

  +[MRUImageLoaderCoordinator sharedCoordinator](MRUImageLoaderCoordinator, "sharedCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestSize");
  v11 = v10;

  if (v8 < v11)
    v8 = v11;
  v12 = +[MRUImageUtilities shouldResizeImage:forFittingSize:](MRUImageUtilities, "shouldResizeImage:forFittingSize:", v3, v8, v8);
  v13 = +[MRUImageUtilities shouldTranscodeImage:](MRUImageUtilities, "shouldTranscodeImage:", v3);
  objc_msgSend(MEMORY[0x1E0D4C638], "currentSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "verboseImageLoadingLogging");

  if (v12)
  {
    if (v15)
    {
      MCLogCategoryDefault();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v23 = 138412290;
        v24 = v5;
        _os_log_impl(&dword_1AA991000, v16, OS_LOG_TYPE_DEFAULT, "[MRUImageUtilities] derivedSourceImageForImage<%@> resizing image.", (uint8_t *)&v23, 0xCu);
      }

    }
    +[MRUImageUtilities resizedImage:forFittingSize:](MRUImageUtilities, "resizedImage:forFittingSize:", v3, v8, v8);
    v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:
    v20 = v17;
    goto LABEL_24;
  }
  if (!v13)
  {
    if (v15)
    {
      MCLogCategoryDefault();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v23 = 138412290;
        v24 = v5;
        _os_log_impl(&dword_1AA991000, v21, OS_LOG_TYPE_DEFAULT, "[MRUImageUtilities] derivedSourceImageForImage<%@> returning original.", (uint8_t *)&v23, 0xCu);
      }

    }
    v17 = v3;
    goto LABEL_21;
  }
  if (v15)
  {
    MCLogCategoryDefault();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138412290;
      v24 = v5;
      _os_log_impl(&dword_1AA991000, v18, OS_LOG_TYPE_DEFAULT, "[MRUImageUtilities] derivedSourceImageForImage<%@> transcoding image.", (uint8_t *)&v23, 0xCu);
    }

  }
  +[MRUImageUtilities jpegDataForImage:](MRUImageUtilities, "jpegDataForImage:", v3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }

LABEL_24:
  return v20;
}

+ (BOOL)shouldTranscodeImage:(id)a3
{
  return !+[MRUImageUtilities imageIsEfficientFormat:](MRUImageUtilities, "imageIsEfficientFormat:", a3);
}

+ (BOOL)shouldResizeImage:(id)a3 forFittingSize:(CGSize)a4
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  height = a4.height;
  width = a4.width;
  objc_msgSend(a3, "size");
  v8 = v6 / width;
  if (v6 / width < v7 / height)
    v8 = v7 / height;
  v9 = v6 - width;
  v10 = v7 - height;
  if (v9 < v10)
    v9 = v10;
  return v8 > 1.25 && v9 > 100.0;
}

+ (id)resizedImage:(id)a3 forFittingSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  const __CFData *v17;
  uint64_t v18;
  uint64_t v19;
  CGImageSource *v20;
  double v21;
  uint64_t v22;
  int64_t v23;
  void *v24;
  void *v25;
  const __CFDictionary *v26;
  __CFData *v27;
  CGImageDestination *v28;
  void *v29;
  void *v30;
  int v31;
  NSObject *v32;
  _QWORD v34[4];
  _QWORD v35[4];
  uint64_t v36;
  uint64_t v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  uint64_t v44;
  CGSize v45;

  height = a4.height;
  width = a4.width;
  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D4C638], "currentSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "verboseImageLoadingLogging");

  if (v10)
  {
    MCLogCategoryDefault();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v45.width = width;
      v45.height = height;
      NSStringFromCGSize(v45);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v39 = v8;
      v40 = 2112;
      v41 = v6;
      v42 = 2112;
      v43 = v12;
      _os_log_impl(&dword_1AA991000, v11, OS_LOG_TYPE_DEFAULT, "[MRUImageUtilities] resizedImage<%@> %@ to fitting size %@", buf, 0x20u);

    }
  }
  objc_msgSend(v6, "size");
  MSVImageUtilitiesMakeBoundingBoxSize();
  v14 = v13;
  v16 = v15;
  +[MRUImageUtilities sourceDataForImage:](MRUImageUtilities, "sourceDataForImage:", v6);
  v17 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = *MEMORY[0x1E0CBD240];
    v36 = *MEMORY[0x1E0CBD240];
    v19 = MEMORY[0x1E0C9AAA0];
    v37 = MEMORY[0x1E0C9AAA0];
    v20 = CGImageSourceCreateWithData(v17, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
    +[MRUImageUtilities sizeFromSource:](MRUImageUtilities, "sizeFromSource:", v20);
    if (v14 >= v16)
      v21 = v14;
    else
      v21 = v16;
    v22 = (uint64_t)v21;
    v23 = +[MRUImageUtilities subsampleFactorForMaxPixelSize:imageSize:](MRUImageUtilities, "subsampleFactorForMaxPixelSize:imageSize:", (uint64_t)v21);
    v35[0] = v19;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v23, v18, *MEMORY[0x1E0CBD290]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v24;
    v34[2] = *MEMORY[0x1E0CBC778];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v34[3] = *MEMORY[0x1E0CBC780];
    v35[2] = v25;
    v35[3] = &unk_1E5878650;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 4);
    v26 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    v27 = (__CFData *)objc_opt_new();
    v28 = CGImageDestinationCreateWithData(v27, CFSTR("public.jpeg"), 1uLL, v26);
    CGImageDestinationAddImageFromSource(v28, v20, 0, v26);
    CGImageDestinationFinalize(v28);
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D4C638], "currentSettings");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "verboseImageLoadingLogging");

    if (v31)
    {
      MCLogCategoryDefault();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v39 = v8;
        v40 = 2112;
        v41 = v29;
        _os_log_impl(&dword_1AA991000, v32, OS_LOG_TYPE_DEFAULT, "[MRUImageUtilities] resizedImage<%@> Result: %@", buf, 0x16u);
      }

    }
    CFRelease(v20);
    CFRelease(v28);

  }
  else
  {
    v29 = 0;
  }

  return v29;
}

+ (CGSize)sizeFromSource:(CGImageSource *)a3
{
  CFDictionaryRef v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  _QWORD v11[2];
  CGSize result;

  v11[1] = *MEMORY[0x1E0C80C00];
  v10 = *MEMORY[0x1E0CBD240];
  v11[0] = MEMORY[0x1E0C9AAA0];
  v3 = CGImageSourceCopyPropertiesAtIndex(a3, 0, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1));
  -[__CFDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD048]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD040]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "integerValue");
  v7 = objc_msgSend(v5, "integerValue");

  v8 = (double)v6;
  v9 = (double)v7;
  result.height = v9;
  result.width = v8;
  return result;
}

+ (int64_t)subsampleFactorForMaxPixelSize:(int64_t)a3 imageSize:(CGSize)a4
{
  if (a4.width < a4.height)
    a4.width = a4.height;
  return vcvtmd_s64_f64(a4.width / (double)a3);
}

@end
