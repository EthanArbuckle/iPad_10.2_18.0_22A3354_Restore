@implementation VCPPhotosAsset

- (VCPPhotosAsset)initWithPHAsset:(id)a3 downloadedData:(id)a4
{
  id v7;
  id v8;
  VCPPhotosAsset *v9;
  VCPPhotosAsset *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VCPPhotosAsset;
  v9 = -[VCPPhotosAsset init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_asset, a3);
    objc_storeStrong((id *)&v10->_downloadedData, a4);
  }

  return v10;
}

+ (id)assetWithPHAsset:(id)a3 downloadedData:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPHAsset:downloadedData:", v5, v6);

  return v7;
}

+ (id)assetWithPHAsset:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "assetWithPHAsset:downloadedData:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)mediaType
{
  return -[PHAsset mediaType](self->_asset, "mediaType");
}

- (unint64_t)mediaSubtypes
{
  return -[PHAsset mediaSubtypes](self->_asset, "mediaSubtypes");
}

- (unint64_t)pixelWidth
{
  return -[PHAsset pixelWidth](self->_asset, "pixelWidth");
}

- (unint64_t)pixelHeight
{
  return -[PHAsset pixelHeight](self->_asset, "pixelHeight");
}

- (id)modificationDate
{
  return -[PHAsset vcp_modificationDate](self->_asset, "vcp_modificationDate");
}

- (NSArray)resources
{
  NSArray *cachedResources;
  NSArray *v4;
  NSArray *v5;

  cachedResources = self->_cachedResources;
  if (!cachedResources)
  {
    objc_msgSend(MEMORY[0x1E0CD1440], "vcp_allAcceptableResourcesForAsset:", self->_asset);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_cachedResources;
    self->_cachedResources = v4;

    cachedResources = self->_cachedResources;
  }
  return cachedResources;
}

- (id)localIdentifier
{
  return (id)-[PHAsset localIdentifier](self->_asset, "localIdentifier");
}

- (id)mainFileURL
{
  void *v2;
  void *v3;
  void *v4;

  -[VCPPhotosAsset resources](self, "resources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vcp_originalResource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "privateFileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)allScenes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[PHAsset localIdentifier](self->_asset, "localIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  v4 = (void *)MEMORY[0x1E0CD1758];
  v10[0] = self->_asset;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHAsset localIdentifier](self->_asset, "localIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)scenes
{
  VCPPhotosAsset *v2;
  uint64_t v3;
  NSMutableDictionary *cachedScenes;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  uint64_t v32;
  _QWORD v33[4];

  v33[1] = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_onceScenes)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    cachedScenes = v2->_cachedScenes;
    v2->_cachedScenes = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAsset localIdentifier](v2->_asset, "localIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0CD1758];
      v33[0] = v2->_asset;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[PHAsset localIdentifier](v2->_asset, "localIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v11);

    }
    if (v5)
    {
      if ((unint64_t)objc_msgSend(v5, "count") >= 0xB)
      {
        objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_40);
        objc_msgSend(v5, "subarrayWithRange:", 0, 10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "mutableCopy");

        v5 = (void *)v13;
      }
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v14 = v5;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v27 != v16)
              objc_enumerationMutation(v14);
            v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x1E0D75258], "vcp_sharedTaxonomy");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "mad_sceneNameFromExtendedSceneId:", objc_msgSend(v18, "extendedSceneIdentifier"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
            {
              v21 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v18, "confidence");
              objc_msgSend(v21, "numberWithDouble:");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_cachedScenes, "setObject:forKeyedSubscript:", v22, v20);

            }
            else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              v23 = objc_msgSend(v18, "extendedSceneIdentifier");
              *(_DWORD *)buf = 134217984;
              v32 = v23;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Scene identifier %llu has no name; ignoring",
                buf,
                0xCu);
            }

          }
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v15);
      }

    }
    else if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      -[PHAsset localIdentifier](v2->_asset, "localIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v32 = (uint64_t)v24;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "  [%@] No scene classification result fetched from pre analysis", buf, 0xCu);

    }
    v2->_onceScenes = 1;
  }
  objc_sync_exit(v2);

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v2->_cachedScenes);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __24__VCPPhotosAsset_scenes__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "confidence");
  v7 = v6;
  objc_msgSend(v5, "confidence");
  if (v7 <= v8)
  {
    objc_msgSend(v4, "confidence");
    v11 = v10;
    objc_msgSend(v5, "confidence");
    v9 = v11 < v12;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

- (id)faces
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  -[PHAsset photoLibrary](self->_asset, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setIncludeTorsoOnlyDetectionData:", 1);
  if (objc_msgSend(MEMORY[0x1E0CD16F0], "mad_clusterVideoFaces"))
    objc_msgSend(v4, "setIncludeMediaAnalysisProcessingRangeTypes:", 3);
  v5 = *MEMORY[0x1E0CD1B68];
  v10[0] = *MEMORY[0x1E0CD1B70];
  v10[1] = v5;
  v6 = *MEMORY[0x1E0CD1B80];
  v10[2] = *MEMORY[0x1E0CD1B58];
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFetchPropertySets:", v7);

  objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesInAsset:options:", self->_asset, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadedData, 0);
  objc_storeStrong((id *)&self->_cachedScenes, 0);
  objc_storeStrong((id *)&self->_cachedExif, 0);
  objc_storeStrong((id *)&self->_cachedResources, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (id)exif
{
  VCPPhotosAsset *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSDictionary *cachedExif;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_onceExif)
  {
    -[VCPPhotosAsset resources](v2, "resources");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "vcp_localPhotoResourcesSorted:", -[PHAsset hasAdjustments](v2->_asset, "hasAdjustments"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v15 = v4;
    objc_msgSend(v4, "reverseObjectEnumerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v17;
LABEL_4:
      v8 = 0;
      while (1)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v8);
        if (objc_msgSend(v9, "vcp_isDecodable"))
        {
          v10 = (void *)MEMORY[0x1E0C99D80];
          objc_msgSend(v9, "privateFileURL");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "vcp_exifFromImageURL:", v11);
          v12 = objc_claimAutoreleasedReturnValue();
          cachedExif = v2->_cachedExif;
          v2->_cachedExif = (NSDictionary *)v12;

          if (v2->_cachedExif)
            break;
        }
        if (v6 == ++v8)
        {
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v6)
            goto LABEL_4;
          break;
        }
      }
    }

    v2->_onceExif = 1;
  }
  objc_sync_exit(v2);

  return v2->_cachedExif;
}

- (__CVBuffer)imageWithPreferredDimension:(unint64_t)a3
{
  return -[VCPPhotosAsset imageWithPreferredDimension:orientation:](self, "imageWithPreferredDimension:orientation:", a3, 0);
}

- (__CVBuffer)imageWithPreferredDimension:(unint64_t)a3 orientation:(unsigned int *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  __CVBuffer *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[VCPPhotosAsset resources](self, "resources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "vcp_localPhotoResourcesSorted:", -[PHAsset hasAdjustments](self->_asset, "hasAdjustments"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v39 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        if ((unint64_t)objc_msgSend(v14, "vcp_fileSize") <= 0x800000
          && objc_msgSend(v14, "vcp_isDecodable"))
        {
          objc_msgSend(v14, "vcp_size");
          if (v15 < v16)
            v15 = v16;
          if (v15 >= (double)a3)
            v17 = v8;
          else
            v17 = v7;
          objc_msgSend(v17, "addObject:", v14);
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v11);
  }

  +[VCPImageManager sharedImageManager](VCPImageManager, "sharedImageManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v19 = v8;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v35;
    while (2)
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v35 != v21)
          objc_enumerationMutation(v19);
        v23 = (__CVBuffer *)objc_msgSend(v18, "imageForResource:pixelFormat:maxDimension:orientation:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j), 875704422, a3, a4);
        if (v23)
        {
          v24 = v19;
          goto LABEL_35;
        }
      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
      if (v20)
        continue;
      break;
    }
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(v7, "reverseObjectEnumerator");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
  if (v25)
  {
    obj = v24;
    v26 = *(_QWORD *)v31;
LABEL_26:
    v27 = 0;
    while (1)
    {
      if (*(_QWORD *)v31 != v26)
        objc_enumerationMutation(obj);
      v23 = (__CVBuffer *)objc_msgSend(v18, "imageForResource:pixelFormat:maxDimension:orientation:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v27), 875704422, a3, a4);
      if (v23)
        break;
      if (v25 == ++v27)
      {
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
        if (v25)
          goto LABEL_26;
        v23 = 0;
        break;
      }
    }
    v24 = obj;
  }
  else
  {
    v23 = 0;
  }
LABEL_35:

  return v23;
}

- (float)photoOffsetSeconds
{
  float v3;
  void *v4;
  void *v5;
  double Seconds;
  float v7;
  objc_super v9;
  CMTime time;

  v3 = 0.0;
  if (-[VCPAsset isLivePhoto](self, "isLivePhoto"))
  {
    -[PHAsset photoIrisProperties](self->_asset, "photoIrisProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "photoIrisStillDisplayTime");
      Seconds = CMTimeGetSeconds(&time);
    }
    else
    {
      v9.receiver = self;
      v9.super_class = (Class)VCPPhotosAsset;
      -[VCPAsset photoOffsetSeconds](&v9, sel_photoOffsetSeconds);
      Seconds = v7;
    }
    v3 = Seconds;

  }
  return v3;
}

- (float)originalPhotoOffsetSeconds
{
  float v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  float result;
  double Seconds;
  void *v11;
  void *v12;
  double v13;
  float v14;
  CMTime v15[2];
  CMTime v16;
  CMTime time;

  v3 = 0.0;
  if (!-[VCPAsset isLivePhoto](self, "isLivePhoto"))
    return v3;
  if (!-[PHAsset hasAdjustments](self->_asset, "hasAdjustments"))
  {
    -[VCPPhotosAsset photoOffsetSeconds](self, "photoOffsetSeconds");
    return result;
  }
  -[VCPPhotosAsset resources](self, "resources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vcp_originalVideoResource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && objc_msgSend(v5, "isLocallyAvailable"))
  {
    v6 = (void *)MEMORY[0x1E0C8B3C0];
    objc_msgSend(v5, "privateFileURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "assetWithURL:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(v8, "duration");
    else
      memset(&time, 0, sizeof(time));
    Seconds = CMTimeGetSeconds(&time);
    -[VCPPhotosAsset movie](self, "movie");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      objc_msgSend(v11, "duration");
    else
      memset(&v16, 0, sizeof(v16));
    v13 = vabdd_f64(Seconds, CMTimeGetSeconds(&v16));

    if (v13 < 0.00999999978)
    {
      memset(&v15[1], 0, sizeof(CMTime));
      if (v8)
      {
        objc_msgSend(v8, "vcp_livePhotoStillDisplayTime");
        if ((v15[1].flags & 1) != 0)
        {
          v15[0] = v15[1];
          v3 = CMTimeGetSeconds(v15);

          goto LABEL_17;
        }
      }
    }

  }
  -[VCPPhotosAsset photoOffsetSeconds](self, "photoOffsetSeconds");
  v3 = v14;
LABEL_17:

  return v3;
}

- (BOOL)isShortMovie
{
  return -[PHAsset vcp_isShortMovie](self->_asset, "vcp_isShortMovie");
}

- (double)duration
{
  double result;

  -[PHAsset duration](self->_asset, "duration");
  return result;
}

- (float)slowmoRate
{
  void *v2;
  float v3;
  float v4;

  -[VCPPhotosAsset resources](self, "resources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vcp_getFpsRate");
  v4 = v3;

  return v4;
}

- ($C7CBA4C8288BA02ADCCB8E56B4665FF4)slomoRange
{
  $C7CBA4C8288BA02ADCCB8E56B4665FF4 *result;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  result = ($C7CBA4C8288BA02ADCCB8E56B4665FF4 *)-[VCPAsset isSlowmo](self, "isSlowmo");
  if ((_DWORD)result)
  {
    -[VCPPhotosAsset resources](self, "resources");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "vcp_adjustmentsResource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "privateFileURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75310]), "initWithURL:", v8);
      v10 = v9;
      if (v9 && (objc_msgSend(v9, "hasSlowMotionAdjustments") & 1) != 0)
      {
        objc_msgSend(v10, "slowMotionTimeRange");
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          -[VCPPhotosAsset localIdentifier](self, "localIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 138412290;
          v20 = v13;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis][%@] No slow-mo timestamp mapping file found", (uint8_t *)&v19, 0xCu);

        }
        v14 = MEMORY[0x1E0CA2E40];
        v15 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
        *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E0CA2E40];
        *(_OWORD *)&retstr->var0.var3 = v15;
        *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v14 + 32);
      }

    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        -[VCPPhotosAsset localIdentifier](self, "localIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138412290;
        v20 = v16;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MediaAnalysis][%@] No slow-mo timestamp mapping file URL found", (uint8_t *)&v19, 0xCu);

      }
      v17 = MEMORY[0x1E0CA2E40];
      v18 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
      *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E0CA2E40];
      *(_OWORD *)&retstr->var0.var3 = v18;
      *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v17 + 32);
    }

  }
  else
  {
    v11 = MEMORY[0x1E0CA2E40];
    v12 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
    *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E0CA2E40];
    *(_OWORD *)&retstr->var0.var3 = v12;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v11 + 32);
  }
  return result;
}

- (id)movie
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;

  -[VCPPhotosAsset resources](self, "resources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PHAsset vcp_isVideoSlowmo](self->_asset, "vcp_isVideoSlowmo"))
  {
    objc_msgSend(v3, "vcp_originalResource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PHAsset vcp_hasAdjustments:](self->_asset, "vcp_hasAdjustments:", v3)
      || !objc_msgSend(v4, "vcp_isLocallyAvailable")
      || (objc_msgSend(v4, "vcp_avAsset"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v6 = -[PHAsset vcp_hasAdjustments:](self->_asset, "vcp_hasAdjustments:", v3);
      if (objc_msgSend(v3, "vcp_hasLocalSlowmo:", v6)
        && (objc_msgSend(v3, "vcp_avAsset:", v6), (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        objc_msgSend(v3, "vcp_adjustmentsResource");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHAsset duration](self->_asset, "duration");
        objc_msgSend(v7, "vcp_assetWithoutAdjustments:duration:", v8);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v5 = 0;
      }
    }

  }
  else
  {
    objc_msgSend(v3, "vcp_avAsset:", -[PHAsset hasAdjustments](self->_asset, "hasAdjustments"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (BOOL)isMovieResourceLocalAvailable
{
  PHAsset *asset;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  asset = self->_asset;
  -[VCPPhotosAsset resources](self, "resources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PHAsset vcp_hasAdjustments:](asset, "vcp_hasAdjustments:", v4);

  -[VCPPhotosAsset resources](self, "resources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vcp_localMovieResourcesSorted:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v7, "count") != 0;

  return v5;
}

- (id)streamedMovie:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSData *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[VCPPhotosAsset resources](self, "resources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vcp_smallMovieDerivativeResource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (a3 || !_os_feature_enabled_impl())
    {
      +[VCPDownloadManager sharedManager](VCPDownloadManager, "sharedManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "requestDownloadOfResource:", v6);
      v8 = (NSData *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
LABEL_9:
        v9 = 0;
LABEL_12:

        goto LABEL_17;
      }
    }
    else
    {
      if (!self->_downloadedData
        && (int)MediaAnalysisLogLevel() >= 3
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        -[PHAsset localIdentifier](self->_asset, "localIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412290;
        v14 = v7;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Asset has not been downloaded.", (uint8_t *)&v13, 0xCu);

      }
      v8 = self->_downloadedData;
      if (!v8)
        goto LABEL_9;
    }
    +[VCPInMemoryAVAsset assetWithData:](VCPInMemoryAVAsset, "assetWithData:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    -[PHAsset localIdentifier](self->_asset, "localIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v11;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] Asset has no small video derivative; cannot download",
      (uint8_t *)&v13,
      0xCu);

  }
  v9 = 0;
LABEL_17:

  return v9;
}

- (id)originalMovie
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CD1440], "vcp_allResourcesForAsset:", self->_asset);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vcp_originalVideoResource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "vcp_isLocallyAvailable"))
  {
    objc_msgSend(v3, "vcp_avAsset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (CGSize)originalMovieSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0CD1440], "vcp_allResourcesForAsset:", self->_asset);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vcp_originalVideoResource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "vcp_size");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

@end
