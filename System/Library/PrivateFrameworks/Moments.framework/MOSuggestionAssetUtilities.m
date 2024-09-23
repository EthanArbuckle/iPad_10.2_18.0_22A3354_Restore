@implementation MOSuggestionAssetUtilities

+ (id)imageFromURL:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CEA638], "imageWithData:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        v6 = v5;
        v7 = v6;
      }
      else
      {
        _mo_log_facility_get_os_log(MOLogFacilityUIService);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          +[MOSuggestionAssetUtilities imageFromURL:].cold.3(v3);

        v7 = 0;
      }
    }
    else
    {
      _mo_log_facility_get_os_log(MOLogFacilityUIService);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        +[MOSuggestionAssetUtilities imageFromURL:].cold.2(v3);
      v7 = 0;
    }

  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityUIService);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[MOSuggestionAssetUtilities imageFromURL:].cold.1();
    v7 = 0;
  }

  return v7;
}

+ (id)unwrappedMotionActivityFrom:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  MOSuggestionAsset *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[MOSuggestionAssetUtilities imageFromURL:](MOSuggestionAssetUtilities, "imageFromURL:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = [MOSuggestionAsset alloc];
      objc_msgSend(v3, "assetType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[MOSuggestionAsset init:type:contentClassType:](v6, "init:type:contentClassType:", v5, v7, objc_opt_class());

      objc_msgSend(v3, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addIdentifier:", v9);

      objc_msgSend(v3, "metadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addMetadata:", v10);

      _mo_log_facility_get_os_log(MOLogFacilityUIService);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "debugDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138412290;
        v15 = v12;
        _os_log_impl(&dword_1CAE42000, v11, OS_LOG_TYPE_DEFAULT, "Unwrapping successful, url=%@", (uint8_t *)&v14, 0xCu);

      }
    }
    else
    {
      _mo_log_facility_get_os_log(MOLogFacilityUIService);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[MOSuggestionAssetUtilities unwrappedMotionActivityFrom:].cold.2(v4);
      v8 = 0;
    }

  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityUIService);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[MOSuggestionAssetUtilities unwrappedMotionActivityFrom:].cold.1();
    v8 = 0;
  }

  return v8;
}

+ (id)unwrappedMediaItemFrom:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  MOSuggestionAsset *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  MOSuggestionAssetMediaItem *v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "imageURL"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    objc_msgSend(v5, "imageURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOSuggestionAssetUtilities imageFromURL:](MOSuggestionAssetUtilities, "imageFromURL:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v26 = [MOSuggestionAssetMediaItem alloc];
      objc_msgSend(v5, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "albumTitle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "artistName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "trackIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "previewURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v5, "mediaType");
      objc_msgSend(v5, "bgColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[MOSuggestionAssetMediaItem initTitle:albumTitle:artistName:albumArt:trackIdentifier:previewURL:mediaType:imageURL:bgColor:bgColorVariant:](v26, "initTitle:albumTitle:artistName:albumArt:trackIdentifier:previewURL:mediaType:imageURL:bgColor:bgColorVariant:", v9, v10, v11, v8, v12, v13, v14, 0, v15, objc_msgSend(v5, "bgColorVariant"));

      v17 = [MOSuggestionAsset alloc];
      objc_msgSend(v3, "assetType");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[MOSuggestionAsset init:type:contentClassType:](v17, "init:type:contentClassType:", v16, v18, objc_opt_class());

      objc_msgSend(v3, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addIdentifier:", v20);

      objc_msgSend(v3, "metadata");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addMetadata:", v21);

      _mo_log_facility_get_os_log(MOLogFacilityUIService);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "imageURL");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "debugDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v28 = v24;
        _os_log_impl(&dword_1CAE42000, v22, OS_LOG_TYPE_DEFAULT, "Unwrapping successful, mediaArtURL=%@", buf, 0xCu);

      }
    }
    else
    {
      _mo_log_facility_get_os_log(MOLogFacilityUIService);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        +[MOSuggestionAssetUtilities unwrappedMediaItemFrom:].cold.2();
      v19 = 0;
    }

  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityUIService);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[MOSuggestionAssetUtilities unwrappedMediaItemFrom:].cold.1();
    v19 = 0;
  }

  return v19;
}

+ (id)unwrappeCombinedWorkoutObjectFrom:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  MOSuggestionAsset *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[MOSuggestionAssetUtilities imageFromURL:](MOSuggestionAssetUtilities, "imageFromURL:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = [MOSuggestionAsset alloc];
      objc_msgSend(v3, "assetType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[MOSuggestionAsset init:type:contentClassType:](v6, "init:type:contentClassType:", v5, v7, objc_opt_class());

      objc_msgSend(v3, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addIdentifier:", v9);

      objc_msgSend(v3, "metadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addMetadata:", v10);

      _mo_log_facility_get_os_log(MOLogFacilityUIService);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "debugDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138412290;
        v15 = v12;
        _os_log_impl(&dword_1CAE42000, v11, OS_LOG_TYPE_DEFAULT, "Unwrapping successful, url=%@", (uint8_t *)&v14, 0xCu);

      }
    }
    else
    {
      _mo_log_facility_get_os_log(MOLogFacilityUIService);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[MOSuggestionAssetUtilities unwrappeCombinedWorkoutObjectFrom:].cold.2(v4);
      v8 = 0;
    }

  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityUIService);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[MOSuggestionAssetUtilities unwrappedMotionActivityFrom:].cold.1();
    v8 = 0;
  }

  return v8;
}

+ (id)unwrappedWorkoutObjectFrom:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  MOSuggestionAssetWorkout *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  MOSuggestionAsset *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "route");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    _mo_log_facility_get_os_log(MOLogFacilityUIService);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1CAE42000, v6, OS_LOG_TYPE_DEFAULT, "Route Only Pass Through", (uint8_t *)&v24, 2u);
    }

    v7 = v3;
  }
  else if (v4 && (objc_msgSend(v4, "iconURL"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    objc_msgSend(v4, "iconURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOSuggestionAssetUtilities imageFromURL:](MOSuggestionAssetUtilities, "imageFromURL:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [MOSuggestionAssetWorkout alloc];
      objc_msgSend(v4, "activityRings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "route");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[MOSuggestionAssetWorkout init:route:icon:](v11, "init:route:icon:", v12, v13, v10);

      v15 = [MOSuggestionAsset alloc];
      objc_msgSend(v3, "assetType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[MOSuggestionAsset init:type:contentClassType:](v15, "init:type:contentClassType:", v14, v16, objc_opt_class());

      objc_msgSend(v3, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addIdentifier:", v17);

      objc_msgSend(v3, "metadata");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addMetadata:", v18);

      _mo_log_facility_get_os_log(MOLogFacilityUIService);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "iconURL");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "debugDescription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138412290;
        v25 = v21;
        _os_log_impl(&dword_1CAE42000, v19, OS_LOG_TYPE_DEFAULT, "Unwrapping successful, iconURL=%@", (uint8_t *)&v24, 0xCu);

      }
    }
    else
    {
      _mo_log_facility_get_os_log(MOLogFacilityUIService);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        +[MOSuggestionAssetUtilities unwrappedMediaItemFrom:].cold.2();
      v7 = 0;
    }

  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityUIService);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      +[MOSuggestionAssetUtilities unwrappedWorkoutObjectFrom:].cold.1();

    v7 = 0;
  }

  return v7;
}

+ (id)unwrappedContactPhotoFrom:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  MOSuggestionAsset *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[MOSuggestionAssetUtilities imageFromURL:](MOSuggestionAssetUtilities, "imageFromURL:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = [MOSuggestionAsset alloc];
      objc_msgSend(v3, "assetType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[MOSuggestionAsset init:type:contentClassType:](v6, "init:type:contentClassType:", v5, v7, objc_opt_class());

      objc_msgSend(v3, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addIdentifier:", v9);

      objc_msgSend(v3, "metadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addMetadata:", v10);

      _mo_log_facility_get_os_log(MOLogFacilityUIService);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "debugDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138412290;
        v15 = v12;
        _os_log_impl(&dword_1CAE42000, v11, OS_LOG_TYPE_DEFAULT, "Unwrapping successful, photoUrl=%@", (uint8_t *)&v14, 0xCu);

      }
    }
    else
    {
      _mo_log_facility_get_os_log(MOLogFacilityUIService);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[MOSuggestionAssetUtilities unwrappedContactPhotoFrom:].cold.2(v4);
      v8 = 0;
    }

  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityUIService);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[MOSuggestionAssetUtilities unwrappedMotionActivityFrom:].cold.1();
    v8 = 0;
  }

  return v8;
}

+ (id)unwrappedStateOfMindFrom:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  MOSuggestionAsset *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "constructedImage");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = [MOSuggestionAsset alloc];
      objc_msgSend(v3, "assetType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[MOSuggestionAsset init:type:contentClassType:](v7, "init:type:contentClassType:", v6, v8, objc_opt_class());

      objc_msgSend(v3, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addIdentifier:", v10);

      objc_msgSend(v3, "metadata");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addMetadata:", v11);

      _mo_log_facility_get_os_log(MOLogFacilityUIService);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "debugDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412290;
        v16 = v13;
        _os_log_impl(&dword_1CAE42000, v12, OS_LOG_TYPE_DEFAULT, "Unwrapping successful, url=%@", (uint8_t *)&v15, 0xCu);

      }
    }
    else
    {
      _mo_log_facility_get_os_log(MOLogFacilityUIService);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        +[MOSuggestionAssetUtilities unwrappedStateOfMindFrom:].cold.2(v5);
      v9 = 0;
    }

  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityUIService);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[MOSuggestionAssetUtilities unwrappedMotionActivityFrom:].cold.1();
    v9 = 0;
  }

  return v9;
}

+ (void)imageFromURL:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(0, "debugDescription");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_0_8(&dword_1CAE42000, v1, v2, "Unwrapping failed, URL nil, url=%@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4();
}

+ (void)imageFromURL:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "debugDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_0_8(&dword_1CAE42000, v2, v3, "Unwrapping failed, URL data nil, url=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

+ (void)imageFromURL:(void *)a1 .cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "debugDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_0_8(&dword_1CAE42000, v2, v3, "Unwrapping failed, bad image data, url=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

+ (void)unwrappedMotionActivityFrom:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1CAE42000, v0, v1, "Asset Image URL unexpectedly nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)unwrappedMotionActivityFrom:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "debugDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_0_8(&dword_1CAE42000, v2, v3, "Failed to construct motion activity image, url=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

+ (void)unwrappedMediaItemFrom:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1CAE42000, v0, v1, "mediaItem or URL unexpectedly nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)unwrappedMediaItemFrom:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1CAE42000, v0, v1, "Unwrapping failed, bad image data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)unwrappeCombinedWorkoutObjectFrom:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "debugDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_0_8(&dword_1CAE42000, v2, v3, "Failed to construct combined workout glyph image, url=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

+ (void)unwrappedWorkoutObjectFrom:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1CAE42000, v0, v1, "workout or iconURL unexpectedly nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)unwrappedContactPhotoFrom:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "debugDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_0_8(&dword_1CAE42000, v2, v3, "Failed to construct contact photo image, photoUrl=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

+ (void)unwrappedStateOfMindFrom:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "debugDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_0_8(&dword_1CAE42000, v2, v3, "Failed to construct state of mind image, url=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

@end
