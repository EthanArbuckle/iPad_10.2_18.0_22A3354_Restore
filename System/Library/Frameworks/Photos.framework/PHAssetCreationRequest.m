@implementation PHAssetCreationRequest

- (void)setSyndicationIdentifier:(id)a3
{
  NSString *v5;
  NSString *syndicationIdentifier;
  void *v7;
  void *v8;

  v5 = (NSString *)a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetCreationRequest.m"), 881, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("syndicationIdentifier != nil"));

  }
  if (self->_syndicationIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetCreationRequest.m"), 883, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_syndicationIdentifier == nil"));

    syndicationIdentifier = self->_syndicationIdentifier;
  }
  else
  {
    syndicationIdentifier = 0;
  }
  self->_syndicationIdentifier = v5;

}

- (void)_copyMetadataFromAsset:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "fetchPropertySetsIfNeeded");
  objc_msgSend(v9, "creationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetChangeRequest setCreationDate:](self, "setCreationDate:", v4);

  objc_msgSend(v9, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetChangeRequest setLocation:](self, "setLocation:", v5);

  objc_msgSend(v9, "coarseLocationProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "gpsHorizontalAccuracy");
  -[PHAssetChangeRequest setGpsHorizontalAccuracy:](self, "setGpsHorizontalAccuracy:");

  if ((objc_msgSend(v9, "mediaSubtypes") & 8) != 0)
  {
    objc_msgSend(v9, "fetchPropertySetsIfNeeded");
    objc_msgSend(v9, "photoIrisProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "photoIrisVisibilityState");

    if ((_DWORD)v8)
      -[PHAssetChangeRequest setPhotoIrisVisibilityState:](self, "setPhotoIrisVisibilityState:", v8);
  }
  -[PHAssetChangeRequest setOriginalResourceChoice:](self, "setOriginalResourceChoice:", objc_msgSend(v9, "originalResourceChoice"));

}

- (void)_copyUserSpecificMetadataFromAsset:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PHAssetChangeRequest setHidden:](self, "setHidden:", objc_msgSend(v4, "isHidden"));
  -[PHAssetChangeRequest setFavorite:](self, "setFavorite:", objc_msgSend(v4, "isFavorite"));
  objc_msgSend(v4, "title");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[PHAssetChangeRequest setTitle:](self, "setTitle:", v5);
}

- (void)_copyMediaAnalysisProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _OWORD v30[3];
  _OWORD v31[3];
  _QWORD v32[3];

  v4 = a3;
  objc_msgSend(v4, "fetchPropertySetsIfNeeded");
  objc_msgSend(v4, "mediaAnalysisProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bestPlaybackRect");
  -[PHAssetChangeRequest setBestPlaybackRectWithNormalizedRect:](self, "setBestPlaybackRectWithNormalizedRect:");

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetChangeRequest setMediaAnalysisTimeStamp:](self, "setMediaAnalysisTimeStamp:", v6);

  objc_msgSend(v4, "mediaAnalysisProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "bestKeyFrameTime");
  else
    memset(v32, 0, sizeof(v32));
  -[PHAssetChangeRequest setBestKeyFrame:time:](self, "setBestKeyFrame:time:", 0, v32);

  objc_msgSend(v4, "mediaAnalysisProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "bestVideoTimeRange");
  else
    memset(v31, 0, sizeof(v31));
  -[PHAssetChangeRequest setBestVideoTimeRange:](self, "setBestVideoTimeRange:", v31);

  objc_msgSend(v4, "mediaAnalysisProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    objc_msgSend(v11, "animatedStickerTimeRange");
  else
    memset(v30, 0, sizeof(v30));
  -[PHAssetChangeRequest setAnimatedStickerTimeRange:](self, "setAnimatedStickerTimeRange:", v30);

  objc_msgSend(v4, "mediaAnalysisProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "blurrinessScore");
  -[PHAssetChangeRequest setBlurrinessScore:](self, "setBlurrinessScore:");

  objc_msgSend(v4, "mediaAnalysisProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "exposureScore");
  -[PHAssetChangeRequest setExposureScore:](self, "setExposureScore:");

  objc_msgSend(v4, "mediaAnalysisProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "wallpaperScore");
  -[PHAssetChangeRequest setWallpaperScore:](self, "setWallpaperScore:");

  objc_msgSend(v4, "mediaAnalysisProperties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "autoplaySuggestionScore");
  -[PHAssetChangeRequest setAutoplaySuggestionScore:](self, "setAutoplaySuggestionScore:");

  objc_msgSend(v4, "mediaAnalysisProperties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "videoStickerSuggestionScore");
  -[PHAssetChangeRequest setVideoStickerSuggestionScore:](self, "setVideoStickerSuggestionScore:");

  objc_msgSend(v4, "mediaAnalysisProperties");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "videoScore");
  -[PHAssetChangeRequest setVideoScore:](self, "setVideoScore:");

  objc_msgSend(v4, "mediaAnalysisProperties");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "activityScore");
  -[PHAssetChangeRequest setActivityScore:](self, "setActivityScore:");

  objc_msgSend(v4, "mediaAnalysisProperties");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "audioScore");
  -[PHAssetChangeRequest setAudioScore:](self, "setAudioScore:");

  objc_msgSend(v4, "mediaAnalysisProperties");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "settlingEffectScore");
  -[PHAssetChangeRequest setSettlingEffectScore:](self, "setSettlingEffectScore:");

  objc_msgSend(v4, "mediaAnalysisProperties");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetChangeRequest setFaceCount:](self, "setFaceCount:", objc_msgSend(v22, "faceCount"));

  objc_msgSend(v4, "mediaAnalysisProperties");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetChangeRequest setAudioClassification:](self, "setAudioClassification:", objc_msgSend(v23, "audioClassification"));

  objc_msgSend(v4, "mediaAnalysisProperties");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetChangeRequest setProbableRotationDirection:](self, "setProbableRotationDirection:", objc_msgSend(v24, "probableRotationDirection"));

  objc_msgSend(v4, "mediaAnalysisProperties");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "probableRotationDirectionConfidence");
  -[PHAssetChangeRequest setProbableRotationDirectionConfidence:](self, "setProbableRotationDirectionConfidence:");

  objc_msgSend(v4, "mediaAnalysisProperties");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "colorNormalizationData");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetChangeRequest setColorNormalizationData:](self, "setColorNormalizationData:", v27);

  objc_msgSend(v4, "mediaAnalysisProperties");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bestPlaybackRect");
  -[PHAssetChangeRequest setBestPlaybackRectWithNormalizedRect:](self, "setBestPlaybackRectWithNormalizedRect:");

  objc_msgSend(v4, "mediaAnalysisProperties");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetChangeRequest setScreenTimeDeviceImageSensitivity:](self, "setScreenTimeDeviceImageSensitivity:", objc_msgSend(v29, "screenTimeDeviceImageSensitivity"));

}

- (void)_didMoveFileFromURL:(id)a3 toURL:(id)a4
{
  id v6;
  NSMutableDictionary *movedFiles;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  movedFiles = self->_movedFiles;
  if (!movedFiles)
  {
    v8 = (NSMutableDictionary *)objc_opt_new();
    v9 = self->_movedFiles;
    self->_movedFiles = v8;

    movedFiles = self->_movedFiles;
  }
  -[NSMutableDictionary setObject:forKey:](movedFiles, "setObject:forKey:", v10, v6);

}

- (BOOL)_restoreMovedFilesOnFailure
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  NSObject *v14;
  char v15;
  __int128 v17;
  char v18;
  id obj;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D73208], "fileManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)-[NSMutableDictionary copy](self->_movedFiles, "copy");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
  if (v4)
  {
    v6 = v4;
    v7 = 0;
    v8 = *(_QWORD *)v23;
    v18 = 1;
    *(_QWORD *)&v5 = 138412802;
    v17 = v5;
    do
    {
      v9 = 0;
      v10 = v7;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v9);
        -[NSMutableDictionary objectForKey:](self->_movedFiles, "objectForKey:", v11, v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v10;
        v13 = objc_msgSend(v20, "moveItemAtURL:toURL:error:", v11, v12, &v21);
        v7 = v21;

        if (v13)
        {
          -[NSMutableDictionary removeObjectForKey:](self->_movedFiles, "removeObjectForKey:", v11);
        }
        else
        {
          PLPhotoKitGetLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            v27 = v11;
            v28 = 2112;
            v29 = v12;
            v30 = 2112;
            v31 = v7;
            _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_ERROR, "Failed to restore moved file from %@ to %@ %@", buf, 0x20u);
          }

          v18 = 0;
        }

        ++v9;
        v10 = v7;
      }
      while (v6 != v9);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
    }
    while (v6);

    v15 = v18;
  }
  else
  {
    v15 = 1;
  }

  return v15 & 1;
}

- (void)_resetMovedFiles
{
  NSMutableDictionary *movedFiles;

  -[NSMutableDictionary removeAllObjects](self->_movedFiles, "removeAllObjects");
  movedFiles = self->_movedFiles;
  self->_movedFiles = 0;

}

- (NSDictionary)_movedFiles
{
  return (NSDictionary *)self->_movedFiles;
}

- (id)_secureMove:(BOOL)a3 fileAtURL:(id)a4 toURL:(id)a5 capabilities:(id)a6 error:(id *)a7
{
  _BOOL4 v10;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  int v17;
  id v18;
  void *v19;
  int v20;
  id v21;
  int v22;
  uint64_t v23;
  char v24;
  id v25;
  NSObject *v26;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v10 = a3;
  v37 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetCreationRequest.m"), 1360, CFSTR("expect file url"));

  }
  if (v10)
  {
    v16 = *MEMORY[0x1E0D73F90];
    v32 = 0;
    v17 = objc_msgSend(MEMORY[0x1E0D73208], "stripExtendedAttributesFromFileAtURL:inDomain:error:", v13, v16, &v32);
    v18 = v32;
    v19 = v18;
    if (v17)
    {
      v31 = v18;
      v20 = objc_msgSend(MEMORY[0x1E0D73208], "secureMoveItemAtURL:toURL:capabilities:error:", v13, v14, v15, &v31);
      v21 = v31;

      if (v20)
      {
        -[PHAssetCreationRequest _didMoveFileFromURL:toURL:](self, "_didMoveFileFromURL:toURL:", v13, v14);
        goto LABEL_17;
      }
    }
    else
    {
      v21 = v18;
    }
    goto LABEL_14;
  }
  v30 = 0;
  v22 = objc_msgSend(MEMORY[0x1E0D73208], "copyItemAtURL:toURL:error:", v13, v14, &v30);
  v21 = v30;
  if (!v22)
  {
LABEL_14:

    if (a7)
    {
      v21 = objc_retainAutorelease(v21);
      v14 = 0;
      *a7 = v21;
    }
    else
    {
      v14 = 0;
    }
    goto LABEL_17;
  }
  v23 = *MEMORY[0x1E0D73F90];
  v29 = 0;
  v24 = objc_msgSend(MEMORY[0x1E0D73208], "stripExtendedAttributesFromFileAtURL:inDomain:error:", v14, v23, &v29);
  v25 = v29;
  if ((v24 & 1) == 0)
  {
    PLPhotoKitGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v34 = v14;
      v35 = 2112;
      v36 = v25;
      _os_log_impl(&dword_1991EC000, v26, OS_LOG_TYPE_ERROR, "Failed to strip extended attributes from %@, %@", buf, 0x16u);
    }

  }
LABEL_17:

  return v14;
}

- (id)_secureMove:(BOOL)a3 assetResource:(id)a4 photoLibrary:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v34;
  void *v35;
  _BOOL4 v37;
  void *v38;
  void *v39;
  _QWORD v40[5];
  id v41;
  id v42;
  uint64_t *v43;
  uint64_t *v44;
  BOOL v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;

  v37 = a3;
  v9 = a4;
  v10 = a5;
  v39 = v9;
  objc_msgSend(v9, "fileURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetCreationRequest.m"), 1392, CFSTR("expect file url"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetCreationRequest.m"), 1393, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

LABEL_3:
  objc_msgSend(v10, "pathManager");
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__13099;
  v56 = __Block_byref_object_dispose__13100;
  v57 = 0;
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v38, "isUBF"))
  {
    v12 = objc_alloc(MEMORY[0x1E0D73278]);
    -[PHChangeRequest uuid](self, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PHAssetCreationRequest bundleScope](self, "bundleScope");
    objc_msgSend(v39, "uniformTypeIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "originalFilename");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v12, "initWithAssetUuid:bundleScope:uti:resourceVersion:resourceType:recipeID:originalFilename:", v13, v14, v15, 0, 31, 0, v16);

    v46 = 0;
    v47 = &v46;
    v48 = 0x3032000000;
    v49 = __Block_byref_object_copy__13099;
    v50 = __Block_byref_object_dispose__13100;
    v51 = 0;
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __71__PHAssetCreationRequest__secureMove_assetResource_photoLibrary_error___block_invoke;
    v40[3] = &unk_1E35D8B68;
    v43 = &v52;
    v40[4] = self;
    v45 = v37;
    v41 = v11;
    v18 = v38;
    v42 = v38;
    v44 = &v46;
    objc_msgSend(v42, "obtainAccessAndWaitWithFileWithIdentifier:mode:toURLWithHandler:", v17, 2, v40);
    if (a6)
    {
      v19 = (void *)v47[5];
      if (v19)
        *a6 = objc_retainAutorelease(v19);
    }

    _Block_object_dispose(&v46, 8);
    v20 = 0;
  }
  else
  {
    if (self->_momentShareUUID)
    {
      objc_msgSend(v10, "pathManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "privateDirectoryWithSubType:", 7);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringByAppendingPathComponent:", self->_momentShareUUID);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "libraryServicesManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "imageWriter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHChangeRequest uuid](self, "uuid");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pathExtension");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "uppercaseString");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "pathForNewAssetWithDirectoryPath:fileName:extension:", v23, v26, v28);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v10, "libraryServicesManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "imageWriter");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pathExtension");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "uppercaseString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHChangeRequest uuid](self, "uuid");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "cameraAssetPathForNewAssetWithExtension:assetUUID:", v26, v27);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (!v20)
    {
      v18 = v38;
      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v20, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "capabilities");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAssetCreationRequest _secureMove:fileAtURL:toURL:capabilities:error:](self, "_secureMove:fileAtURL:toURL:capabilities:error:", v37, v11, v17, v29, a6);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)v53[5];
    v53[5] = v30;

    v18 = v38;
  }

LABEL_14:
  v32 = (id)v53[5];
  _Block_object_dispose(&v52, 8);

  return v32;
}

- (BOOL)_createAssetAsAdjusted:(id)a3 fromValidatedResources:(id)a4 mainFileMetadata:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  PHAssetCreationRequest *v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  _BOOL4 v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  uint64_t v39;
  void *v40;
  void *v41;
  _BOOL4 v42;
  char v43;
  void *v44;
  NSObject *v45;
  id v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  _BOOL4 v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  _BOOL8 v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  char v76;
  int v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  double v84;
  double v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  char v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  double v101;
  double v102;
  id v103;
  void *v104;
  void *v105;
  void *v106;
  int v107;
  NSObject *v108;
  void *v109;
  void *v110;
  int v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  char v124;
  uint64_t v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  int v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  id v135;
  void *v136;
  id v137;
  void *v138;
  void *v139;
  uint64_t v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  const __CFString **v146;
  uint64_t *v147;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  _BOOL4 v154;
  _BOOL4 v155;
  uint64_t v156;
  void *v157;
  unsigned int v158;
  id v159;
  void *v160;
  void *v161;
  void *v162;
  uint64_t v163;
  void *v164;
  char v165;
  void *v166;
  unsigned int v167;
  void *v168;
  void *v169;
  void *v170;
  id v171;
  void *v172;
  void *v173;
  const char *aSelector;
  char *aSelectora;
  char *aSelectorb;
  void *v177;
  void *v178;
  uint64_t v179;
  void *v180;
  void *v181;
  uint64_t v182;
  void *v183;
  id *v184;
  id *v185;
  id v186;
  id v187;
  id v189;
  id v190;
  id v191;
  id v192;
  id v193;
  uint64_t v194;
  const __CFString *v195;
  uint64_t v196;
  const __CFString *v197;
  uint64_t v198;
  const __CFString *v199;
  uint64_t v200;
  const __CFString *v201;
  uint64_t v202;
  const __CFString *v203;
  uint64_t v204;
  const __CFString *v205;
  uint64_t v206;
  const __CFString *v207;
  uint64_t v208;
  const __CFString *v209;
  uint64_t v210;
  const __CFString *v211;
  uint64_t v212;
  const __CFString *v213;
  uint64_t v214;
  const __CFString *v215;
  uint8_t buf[4];
  id v217;
  __int16 v218;
  id v219;
  uint64_t v220;

  v220 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((objc_msgSend(v11, "hasAdjustments") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetCreationRequest.m"), 1425, CFSTR("expect adjustment resources"));

  }
  v182 = objc_msgSend(v11, "mediaType");
  if (!objc_msgSend(v11, "hasCurrentAdjustment"))
    goto LABEL_135;
  v184 = a6;
  v186 = v12;
  objc_msgSend(v11, "assetResourceWithType:", 7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assetResourceWithType:", 108);
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assetResourceWithType:", 110);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "validatedURLForAssetResource:", v13);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfURL:", v14);
  v16 = self;
  v181 = v13;
  v178 = (void *)v14;
  if (!v15)
  {
    -[PHAssetCreationCameraIngestOptions backupAdjustmentsFile](self->_cameraIngestOptions, "backupAdjustmentsFile");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25
      || (v26 = objc_alloc(MEMORY[0x1E0C99D80]),
          -[PHAssetCreationCameraIngestOptions backupAdjustmentsFile](self->_cameraIngestOptions, "backupAdjustmentsFile"), v27 = (void *)objc_claimAutoreleasedReturnValue(), v15 = (void *)objc_msgSend(v26, "initWithContentsOfFile:", v27), v27, !v15))
    {
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v202 = *MEMORY[0x1E0CB2938];
      v203 = CFSTR("Unable to determine adjustment data");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v203, &v202, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3302, v15);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_134;
    }
  }
  objc_msgSend(v13, "creationOptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "shouldMoveFile");

  aSelector = a2;
  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0D73208], "fileManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v193 = 0;
    objc_msgSend(v19, "removeItemAtURL:error:", v14, &v193);
    v20 = v193;

  }
  else
  {
    v20 = 0;
  }
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D73380]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D73388]);
  v179 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D73370]);
  v22 = objc_claimAutoreleasedReturnValue();
  -[PHAssetChangeRequest editorBundleID](self, "editorBundleID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    v171 = v23;
  }
  else
  {
    objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D73378]);
    v171 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D73368]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v156 = objc_msgSend(v29, "integerValue");

  v30 = *MEMORY[0x1E0D73390];
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D73390]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v158 = objc_msgSend(v31, "intValue");

  v154 = -[PHChangeRequest shouldPerformConcurrentWork](self, "shouldPerformConcurrentWork");
  v32 = objc_msgSend(v10, "importedBy") == 1 || objc_msgSend(v10, "importedBy") == 2;
  v155 = v32;
  if (!v22 && v183)
  {
    v33 = v10;
    v34 = v21;
    objc_msgSend(v11, "validatedURLForAssetResource:", v183);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "path");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v36, "fileExistsAtPath:", v37);

    if (v38)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v35);
      v39 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v39 = 0;
    }

    v16 = self;
    v21 = v34;
    v10 = v33;
    v22 = v39;
  }
  v40 = (void *)v179;
  v177 = (void *)v22;
  v162 = v21;
  if (!v21 || !v179 || !v22)
  {
    -[PHAssetCreationCameraIngestOptions backupAdjustmentsFile](v16->_cameraIngestOptions, "backupAdjustmentsFile");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v41)
    {
      v57 = (void *)MEMORY[0x1E0CB35C8];
      v206 = *MEMORY[0x1E0CB2938];
      v207 = CFSTR("Unable to determine adjustment data format and version");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v207, &v206, 1);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3302, v58);
      v59 = objc_claimAutoreleasedReturnValue();

      v60 = 0;
      v168 = 0;
      v169 = 0;
      v172 = 0;
      aSelectora = 0;
      v166 = 0;
      v160 = 0;
      v161 = 0;
      v20 = (id)v59;
      v56 = v177;
      if (!v20)
        goto LABEL_101;
      goto LABEL_133;
    }
  }
  v42 = objc_msgSend(v10, "playbackStyle") == 3 || objc_msgSend(v10, "playbackStyle") == 5;
  if (v16->_duplicateAssetIdentifier)
    v167 = v42;
  else
    v167 = (objc_msgSend(v11, "mediaSubtype") >> 3) & 1;
  v192 = 0;
  v43 = objc_msgSend(MEMORY[0x1E0D71988], "validateAdjustmentData:formatIdentifier:formatVersion:error:", v22, v21, v179, &v192);
  v159 = v192;
  if ((v43 & 1) == 0)
  {
    -[PHAssetCreationCameraIngestOptions backupAdjustmentsFile](v16->_cameraIngestOptions, "backupAdjustmentsFile");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v44)
    {
      PLBackendGetLog();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(aSelector);
        v46 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v217 = v46;
        v218 = 2112;
        v219 = v159;
        _os_log_impl(&dword_1991EC000, v45, OS_LOG_TYPE_DEFAULT, "%@ - Invalid adjustment. Relying on rendered resources. Error: %@", buf, 0x16u);

      }
      v40 = (void *)v179;
    }
  }
  objc_msgSend(v15, "objectForKeyedSubscript:", v30);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "integerValue");

  if (v182 != 2)
  {
    if (v182 != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3300, CFSTR("Unexpected media type"));
      v54 = 0;
      v168 = 0;
      v169 = 0;
      v172 = 0;
      aSelectora = 0;
      v163 = 0;
      v166 = 0;
      v160 = 0;
      v161 = 0;
      v55 = v20;
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v21 = v162;
LABEL_99:
      v56 = v177;
      goto LABEL_100;
    }
    objc_msgSend(v11, "assetResourceWithType:", 5);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "assetResourceWithType:", 5);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v49)
    {
      objc_msgSend(v11, "assetResourceWithType:", 107);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v165 = v48;
    if (!v50)
    {
      objc_msgSend(v11, "assetResourceWithType:", 111);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "validatedURLForAssetResource:", v49);
    v51 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "validatedDataForAssetResource:", v50);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "length");
    v160 = v52;
    if (v51)
    {
      v163 = v51;
      v54 = 0;
LABEL_46:
      v161 = 0;
LABEL_72:
      if (!v167 || v20)
      {
        v55 = v49;
      }
      else
      {
        objc_msgSend(v11, "assetResourceWithType:", 10);
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "validatedURLForAssetResource:", v55);
        v75 = objc_claimAutoreleasedReturnValue();
        v169 = (void *)v75;
        if (v75)
          v76 = 1;
        else
          v76 = v43;
        if (v75)
          v77 = v54;
        else
          v77 = 1;
        if ((v76 & 1) != 0)
        {
          v54 = v77;
          v21 = v162;
          goto LABEL_85;
        }
        v78 = (void *)MEMORY[0x1E0CB35C8];
        v212 = *MEMORY[0x1E0CB2938];
        v213 = CFSTR("This resource set requires a full size video complement render resource to be provided");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v213, &v212, 1);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3303, v79);
        v20 = (id)objc_claimAutoreleasedReturnValue();

      }
      v21 = v162;
      v169 = 0;
      v172 = 0;
      aSelectora = 0;
      if (v20)
      {
LABEL_98:

        v166 = 0;
        v168 = 0;
        v40 = (void *)v179;
        goto LABEL_99;
      }
LABEL_85:
      objc_msgSend(v11, "assetResourceWithType:", 8);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      if (v80)
      {
        objc_msgSend(v11, "validatedDataForAssetResource:", v80);
        aSelectora = (char *)objc_claimAutoreleasedReturnValue();
        if (!aSelectora)
        {
          objc_msgSend(v11, "validatedURLForAssetResource:", v80);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          aSelectora = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:", v81);

        }
        if (v167)
        {
          objc_msgSend(v11, "assetResourceWithType:", 11);
          v82 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "validatedURLForAssetResource:", v82);
          v172 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v172)
          {
            if ((v165 & 0x20) != 0)
            {
              v151 = (void *)MEMORY[0x1E0CB35C8];
              v210 = *MEMORY[0x1E0CB2938];
              v211 = CFSTR("This resource set requires a adjustment base video complement resource to be provided");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v211, &v210, 1);
              v152 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v151, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3303, v152);
              v20 = (id)objc_claimAutoreleasedReturnValue();

              v21 = v162;
              v172 = 0;
              goto LABEL_93;
            }
            v172 = 0;
          }
          v20 = 0;
LABEL_93:
          v80 = (void *)v82;
LABEL_97:

          goto LABEL_98;
        }
        v172 = 0;
      }
      else
      {
        v172 = 0;
        aSelectora = 0;
      }
      v20 = 0;
      goto LABEL_97;
    }
    if (v53)
    {
      if (!objc_msgSend(v52, "length"))
      {
        v54 = 0;
        v163 = 0;
        goto LABEL_46;
      }
      DCIM_newPLImageWithStoredJPEGData();
      v61 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "photoLibrary");
      aSelectorb = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(aSelectorb, "libraryServicesManager");
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v173, "imageWriter");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "filename");
      v63 = objc_claimAutoreleasedReturnValue();
      v64 = v52;
      v65 = (void *)v63;
      v170 = (void *)v61;
      objc_msgSend(v62, "writeFilteredPreviewWithImageData:orImage:toPathWithBaseName:", v64, v61, v63);
      v66 = objc_claimAutoreleasedReturnValue();

      if (v66)
      {
        v161 = (void *)v66;
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v66, 0);
        v163 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v163 = 0;
        v161 = 0;
      }
      v73 = v170;
    }
    else
    {
      if ((v43 & 1) != 0)
      {
        v163 = 0;
        v161 = 0;
        v54 = 1;
        goto LABEL_72;
      }
      v72 = (void *)MEMORY[0x1E0CB35C8];
      v214 = *MEMORY[0x1E0CB2938];
      v215 = CFSTR("This resource set requires a full size render resource to be provided");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v215, &v214, 1);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3303, v73);
      v74 = objc_claimAutoreleasedReturnValue();

      v163 = 0;
      v161 = 0;
      v20 = (id)v74;
    }

    v54 = 0;
    goto LABEL_72;
  }
  objc_msgSend(v11, "assetResourceWithType:", 6);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v55)
  {
    objc_msgSend(v11, "assetResourceWithType:", 107);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "validatedURLForAssetResource:", v55);
  v56 = v177;
  v163 = objc_claimAutoreleasedReturnValue();
  if (v163)
  {
    v54 = 0;
  }
  else if ((v43 & 1) != 0)
  {
    v54 = objc_msgSend(v10, "kindSubtype") != 101;
  }
  else
  {
    v67 = (void *)MEMORY[0x1E0CB35C8];
    v208 = *MEMORY[0x1E0CB2938];
    v209 = CFSTR("This resource set requires a full size video render resource to be provided");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v209, &v208, 1);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3303, v68);
    v69 = objc_claimAutoreleasedReturnValue();

    v54 = 0;
    v20 = (id)v69;
    v56 = v177;
  }
  v21 = v162;
  if (v20)
  {
    v168 = 0;
    v169 = 0;
    v172 = 0;
    v166 = 0;
  }
  else
  {
    objc_msgSend(v11, "assetResourceWithType:", 5);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "validatedURLForAssetResource:", v70);
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "assetResourceWithType:", 12);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "validatedURLForAssetResource:", v71);
    v166 = (void *)objc_claimAutoreleasedReturnValue();

    v56 = v177;
    v172 = 0;
    v169 = 0;
  }
  v160 = 0;
  v161 = 0;
  aSelectora = 0;
LABEL_100:

  v60 = v54;
  v41 = (void *)v163;
  if (!v20)
  {
LABEL_101:
    v83 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D750B0]), "initWithFormatIdentifier:formatVersion:data:baseVersion:editorBundleID:renderTypes:", v21, v40, v56, v156, v171, v158);
    if (!v83)
    {
      -[PHAssetCreationCameraIngestOptions backupAdjustmentsFile](self->_cameraIngestOptions, "backupAdjustmentsFile");
      v98 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v98
        || (-[PHAssetCreationRequest _createAssetAdjustmentsFromBackupWithAsset:](self, "_createAssetAdjustmentsFromBackupWithAsset:", v10), (v83 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        v99 = (void *)MEMORY[0x1E0CB35C8];
        v204 = *MEMORY[0x1E0CB2938];
        v205 = CFSTR("Unable to create adjustments from adjustment data");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v205, &v204, 1);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3302, v100);
        v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_132:
        v56 = v177;

        goto LABEL_133;
      }
    }
    v84 = *MEMORY[0x1E0C9D820];
    v85 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    objc_msgSend(v10, "dateCreated");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v157 = v83;
    objc_msgSend(v83, "setAdjustmentTimestamp:", v86);

    objc_msgSend(v181, "creationOptions");
    v87 = v41;
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = 4;
    if (objc_msgSend(v88, "shouldMoveFile"))
      v90 = 4;
    else
      v90 = 1;

    objc_msgSend(v10, "setCameraProcessingAdjustmentStateFromAdjustmentRenderTypes:", v158);
    objc_msgSend(v87, "path");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = objc_msgSend(v91, "containsString:", CFSTR("fullsizerender.JPG"));

    if ((v92 & 1) != 0)
    {
      v93 = 0;
      v94 = 1;
      v95 = 1;
      v96 = v87;
LABEL_119:
      v103 = objc_alloc_init(MEMORY[0x1E0D718F8]);
      v164 = v96;
      objc_msgSend(v103, "setRenderedContentURL:", v96);
      objc_msgSend(v103, "setPenultimateRenderedJPEGData:", aSelectora);
      objc_msgSend(v103, "setPenultimateRenderedVideoContentURL:", v166);
      objc_msgSend(v103, "setSubstandardRender:", v93);
      objc_msgSend(v103, "setDeferred:", v60);
      objc_msgSend(v103, "setFullSizeRenderSize:", v84, v85);
      objc_msgSend(v103, "setRenderedVideoComplementContentURL:", v169);
      objc_msgSend(v103, "setPenultimateRenderedVideoComplementContentURL:", v172);
      objc_msgSend(v103, "setRenderedVideoPosterContentURL:", v168);
      objc_msgSend(v103, "setMainFileMetadata:", v186);
      objc_msgSend(v103, "setShouldUpdateAttributes:", v95);
      objc_msgSend(v103, "setFileIngestionType:", v89);
      objc_msgSend(v103, "setShouldGenerateThumbnails:", v94);
      objc_msgSend(v103, "setShouldCheckForLegacyCameraAutoAdjustment:", !v155);
      objc_msgSend(v11, "validatedURLForAssetResource:", v180);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "setAdjustmentSecondaryDataURL:", v104);

      v100 = v157;
      objc_msgSend(v10, "setAdjustments:options:", v157, v103);
      if (v60 && !objc_msgSend(v10, "deferredProcessingNeeded"))
        objc_msgSend(v10, "setDeferredProcessingNeeded:", 2);
      -[PHChangeRequest helper](self, "helper");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "clientAuthorization");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v107 = objc_msgSend(v106, "isCameraClient");

      v40 = (void *)v179;
      if (!v107)
        goto LABEL_125;
      objc_msgSend(v11, "assetResourceWithType:", 16);
      v108 = objc_claimAutoreleasedReturnValue();
      if (!v108)
      {
        if ((objc_msgSend(v10, "setCurrentAdjustmentAsOriginalAdjustment") & 1) != 0)
          goto LABEL_125;
        PLPhotoKitIngestGetLog();
        v108 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1991EC000, v108, OS_LOG_TYPE_ERROR, "Failed to set original adjustment file (AAE) for asset", buf, 2u);
        }
      }

LABEL_125:
      if (v182 == 1)
      {
        objc_msgSend(v11, "assetResourceWithType:", 8);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "creationOptions");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = objc_msgSend(v110, "shouldMoveFile");

        if (v111)
        {
          objc_msgSend(v11, "validatedURLForAssetResource:", v109);
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D73208], "fileManager");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          v191 = 0;
          objc_msgSend(v113, "removeItemAtURL:error:", v112, &v191);
          v20 = v191;

        }
        else
        {
          v20 = 0;
        }
        v41 = v164;

      }
      else
      {
        v20 = 0;
        v41 = v164;
      }

      v21 = v162;
      goto LABEL_132;
    }
    objc_msgSend(v87, "pathExtension");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = v87;
    if ((objc_msgSend(v97, "isEqualToString:", CFSTR("largeThumbnail")) & 1) != 0)
    {

    }
    else
    {

      v93 = 0;
      v95 = 1;
      if (!v87 || !v161)
      {
LABEL_118:
        v89 = v90;
        v94 = !v154;
        goto LABEL_119;
      }
    }
    -[PHAssetCreationCameraIngestOptions finalAssetWidth](self->_cameraIngestOptions, "finalAssetWidth");
    v84 = v101;
    -[PHAssetCreationCameraIngestOptions finalAssetHeight](self->_cameraIngestOptions, "finalAssetHeight");
    v85 = v102;
    v95 = 0;
    v60 = 1;
    if (v84 <= 0.0 && v102 <= 0.0)
    {
      v84 = (double)objc_msgSend(v10, "width");
      v95 = 0;
      v85 = (double)objc_msgSend(v10, "height");
    }
    v93 = 1;
    goto LABEL_118;
  }
LABEL_133:

LABEL_134:
  a6 = v184;
  v12 = v186;
  if (v20)
    goto LABEL_163;
LABEL_135:
  if (!objc_msgSend(v11, "hasOriginalAdjustment"))
    goto LABEL_152;
  v185 = a6;
  v187 = v12;
  objc_msgSend(v11, "assetResourceWithType:", 16);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "validatedURLForAssetResource:", v114);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "creationOptions");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "ensureOptionsAreCompleteForURL:", v115);

  v117 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfURL:", v115);
  objc_msgSend(v117, "objectForKeyedSubscript:", *MEMORY[0x1E0D73380]);
  v118 = objc_claimAutoreleasedReturnValue();
  if (!v118)
    goto LABEL_143;
  v119 = (void *)v118;
  objc_msgSend(v117, "objectForKeyedSubscript:", *MEMORY[0x1E0D73388]);
  v120 = objc_claimAutoreleasedReturnValue();
  if (!v120)
  {

    goto LABEL_143;
  }
  v121 = (void *)v120;
  objc_msgSend(v117, "objectForKeyedSubscript:", *MEMORY[0x1E0D73370]);
  v122 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v122)
  {
LABEL_143:
    v126 = (void *)MEMORY[0x1E0CB35C8];
    v198 = *MEMORY[0x1E0CB2938];
    v199 = CFSTR("Unable to determine original adjustment data format and version");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v199, &v198, 1);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3302, v127);
    v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_150:

    goto LABEL_151;
  }
  objc_msgSend(v117, "objectForKeyedSubscript:", *MEMORY[0x1E0D73390]);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = objc_msgSend(v123, "integerValue");

  if ((v124 & 0x10) == 0)
    goto LABEL_146;
  v125 = v182 == 1 ? 13 : 14;
  objc_msgSend(v11, "assetResourceWithType:", v125);
  v128 = (void *)objc_claimAutoreleasedReturnValue();

  if (v128)
    goto LABEL_146;
  v149 = (void *)MEMORY[0x1E0CB35C8];
  v200 = *MEMORY[0x1E0CB2938];
  v201 = CFSTR("This resource set requires a adjustment base resource to be provided");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v201, &v200, 1);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3303, v150);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
LABEL_146:
    objc_msgSend(v11, "validatedURLForAssetResource:", v114);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "creationOptions");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v130 = objc_msgSend(v129, "shouldIngestInPlace");

    v131 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v10, "pathForOriginalAdjustmentFile");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "fileURLWithPath:", v132);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    if (v130)
    {
      v190 = 0;
      -[PHAssetCreationRequest _ingestOriginalInPlaceSrcURL:dstURL:asset:error:](self, "_ingestOriginalInPlaceSrcURL:dstURL:asset:error:", v127, v133, v10, &v190);
      v20 = v190;
    }
    else
    {
      objc_msgSend(v114, "creationOptions");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      v189 = 0;
      v135 = -[PHAssetCreationRequest _ingestOriginalFromSrcURL:toDstURL:useSecureMove:resource:resourceType:asset:error:](self, "_ingestOriginalFromSrcURL:toDstURL:useSecureMove:resource:resourceType:asset:error:", v127, v133, objc_msgSend(v134, "shouldMoveFile"), v114, 5, v10, &v189);
      v20 = v189;

    }
    goto LABEL_150;
  }
LABEL_151:

  a6 = v185;
  v12 = v187;
  if (v20)
    goto LABEL_163;
LABEL_152:
  objc_msgSend(v11, "assetResourceWithType:", 18);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  if (v136)
  {
    v137 = objc_alloc(MEMORY[0x1E0D75308]);
    objc_msgSend(v136, "fileURL");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = (void *)objc_msgSend(v137, "initWithURL:", v138);

    if (v139)
    {
      objc_msgSend(v139, "adjustmentFormatIdentifier");
      v140 = objc_claimAutoreleasedReturnValue();
      if (v140)
      {
        v141 = (void *)v140;
        objc_msgSend(v139, "adjustmentFormatVersion");
        v142 = (void *)objc_claimAutoreleasedReturnValue();

        if (v142)
        {
          objc_msgSend(MEMORY[0x1E0D71578], "assetAdjustmentOptionsForSLMAdjustmentsWithMainFileMetadata:", v12);
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setAdjustments:options:", v139, v143);
          v20 = 0;
LABEL_161:

          goto LABEL_162;
        }
      }
      v144 = (void *)MEMORY[0x1E0CB35C8];
      v196 = *MEMORY[0x1E0CB2938];
      v197 = CFSTR("Unable to determine slomo adjustment data format and version");
      v145 = (void *)MEMORY[0x1E0C99D80];
      v146 = &v197;
      v147 = &v196;
    }
    else
    {
      v144 = (void *)MEMORY[0x1E0CB35C8];
      v194 = *MEMORY[0x1E0CB2938];
      v195 = CFSTR("Unable to create adjustments from slo-mo adjustment data");
      v145 = (void *)MEMORY[0x1E0C99D80];
      v146 = &v195;
      v147 = &v194;
    }
    objc_msgSend(v145, "dictionaryWithObjects:forKeys:count:", v146, v147, 1);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3302, v143);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_161;
  }
  v20 = 0;
LABEL_162:

LABEL_163:
  if (a6)
    *a6 = objc_retainAutorelease(v20);

  return v20 == 0;
}

- (BOOL)_ingestOriginalInPlaceSrcURL:(id)a3 dstURL:(id)a4 asset:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByDeletingPathExtension");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByDeletingPathExtension");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  v17 = 0;
  if (v15 && v13)
  {
    if (!objc_msgSend(v13, "isEqualToString:", v15))
    {
      v17 = 0;
      v16 = 0;
      if (!a6)
        goto LABEL_7;
      goto LABEL_6;
    }
    objc_msgSend(v11, "photoLibrary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pathManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "capabilities");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0;
    v16 = objc_msgSend(MEMORY[0x1E0D73208], "ingestItemAtURL:toURL:type:options:capabilities:error:", v9, v10, 0, 3, v20, &v22);
    v17 = v22;

  }
  if (a6)
LABEL_6:
    *a6 = objc_retainAutorelease(v17);
LABEL_7:

  return v16;
}

- (id)_ingestOriginalFromSrcURL:(id)a3 toDstURL:(id)a4 useSecureMove:(BOOL)a5 resource:(id)a6 resourceType:(unsigned int)a7 asset:(id)a8 error:(id *)a9
{
  uint64_t v10;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  _BOOL4 v40;
  id v41;
  id obj;
  _QWORD v43[5];
  id v44;
  id v45;
  uint64_t *v46;
  uint64_t *v47;
  BOOL v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint8_t buf[4];
  id v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  v10 = *(_QWORD *)&a7;
  v40 = a5;
  v67 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a8;
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__13099;
  v59 = __Block_byref_object_dispose__13100;
  v60 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__13099;
  v53 = __Block_byref_object_dispose__13100;
  v54 = 0;
  objc_msgSend(v16, "photoLibrary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pathManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v18, "isUBF"))
  {
    if (!v14)
    {
LABEL_12:
      if (a9)
        *a9 = objc_retainAutorelease((id)v56[5]);
      v33 = (id)v50[5];
      goto LABEL_15;
    }
    objc_msgSend(v16, "photoLibrary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "pathManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "capabilities");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (id *)(v56 + 5);
    obj = (id)v56[5];
    -[PHAssetCreationRequest _secureMove:fileAtURL:toURL:capabilities:error:](self, "_secureMove:fileAtURL:toURL:capabilities:error:", v40, v41, v14, v22, &obj);
    v24 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v23, obj);
    v25 = (void *)v50[5];
    v50[5] = v24;

LABEL_11:
    goto LABEL_12;
  }
  if (v15)
  {
    objc_msgSend(v15, "uniformTypeIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {

LABEL_8:
      v28 = objc_alloc(MEMORY[0x1E0D73278]);
      objc_msgSend(v16, "uuid");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "uniformTypeIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "originalFilename");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v28, "initWithAssetUuid:bundleScope:uti:resourceVersion:resourceType:recipeID:originalFilename:", v29, 0, v30, 0, v10, 0, v31);

      objc_msgSend(v16, "photoLibrary");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v28) = v32 == 0;

      if ((_DWORD)v28)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetCreationRequest.m"), 1751, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset.photoLibrary"));

      }
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __109__PHAssetCreationRequest__ingestOriginalFromSrcURL_toDstURL_useSecureMove_resource_resourceType_asset_error___block_invoke;
      v43[3] = &unk_1E35D8B68;
      v46 = &v49;
      v43[4] = self;
      v48 = v40;
      v44 = v41;
      v45 = v18;
      v47 = &v55;
      objc_msgSend(v45, "obtainAccessAndWaitWithFileWithIdentifier:mode:toURLWithHandler:", v21, 2, v43);

      goto LABEL_11;
    }
    objc_msgSend(v15, "originalFilename");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26 == 0;

    if (!v27)
      goto LABEL_8;
  }
  PLPhotoKitGetLog();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v15, "uniformTypeIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "originalFilename");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v62 = v15;
    v63 = 2112;
    v64 = v36;
    v65 = 2112;
    v66 = v37;
    _os_log_impl(&dword_1991EC000, v35, OS_LOG_TYPE_ERROR, "Resource (%p) must be non-nil and either resource.uniformTypeIdentifier (%@) or resource.originalFilename (%@) must be non-nil", buf, 0x20u);

  }
  if (a9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", CFSTR("Failed to ingest resource file from source to destination"));
    v33 = 0;
    *a9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = 0;
  }
LABEL_15:

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v55, 8);

  return v33;
}

- (BOOL)_createAssetAsPhotoIris:(id)a3 fromValidatedResources:(id)a4 mainFileMetadata:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _PHAssetCreationRequestValidator *v18;
  id v19;
  PHAssetCreationRequest *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _BOOL4 v28;
  id v29;
  char v30;
  _PHAssetCreationRequestValidator *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  BOOL v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  uint64_t v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  _BOOL4 v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  id v58;
  PHAssetCreationRequest *v59;
  id v60;
  uint64_t v61;
  id *v62;
  void *v63;
  void *v64;
  _PHAssetCreationRequestValidator *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  __int128 v71;
  uint64_t v72;
  __int128 v73;
  uint64_t v74;
  __int128 v75;
  uint64_t v76;
  __int128 v77;
  uint64_t v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84[2];

  v10 = a3;
  v11 = a4;
  v68 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pathForOriginalFile");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v14);

  }
  objc_msgSend(v11, "assetResourceWithType:", 9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "validatedURLForAssetResource:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(v12, "addObject:", v16);
  v69 = v15;
  objc_msgSend(v15, "creationOptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ensureOptionsAreCompleteForURL:", v16);

  v18 = -[_PHAssetCreationRequestValidator initWithAssetCreationRequest:]([_PHAssetCreationRequestValidator alloc], "initWithAssetCreationRequest:", self);
  v84[0] = 0;
  LODWORD(v17) = -[PHValidator validateURLs:withOptions:videoComplementMetadata:error:](v18, "validateURLs:withOptions:videoComplementMetadata:error:", v12, 64, 0, v84);
  v19 = v84[0];
  v20 = self;
  v21 = v19;
  v66 = (void *)v13;
  if ((_DWORD)v17)
  {
    v59 = v20;
    v62 = a6;
    -[_PHAssetCreationRequestValidator validatedPairingIdentifier](v18, "validatedPairingIdentifier");
    v61 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeAllObjects");
    objc_msgSend(v11, "assetResourceWithType:", 13);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "validatedURLForAssetResource:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
    v63 = v10;
    v65 = v18;
    if (!v23)
    {

      v70 = 0;
      v67 = 0;
LABEL_13:
      objc_msgSend(v69, "creationOptions");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "shouldIngestInPlace");

      v35 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v63, "pathForVideoComplementFile");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "fileURLWithPath:isDirectory:", v36, 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        v82 = v21;
        v38 = -[PHAssetCreationRequest _ingestOriginalInPlaceSrcURL:dstURL:asset:error:](v59, "_ingestOriginalInPlaceSrcURL:dstURL:asset:error:", v16, v37, v63, &v82);
        v39 = v82;

        v10 = v63;
        if (!v38)
        {
          v60 = v39;
          v41 = 0;
          v30 = 0;
          v32 = (void *)v61;
          a6 = v62;
          v31 = v65;
          goto LABEL_33;
        }
        v40 = v16;
        if (!v70)
        {
          v41 = 0;
          v42 = v68;
          v31 = v65;
LABEL_25:
          v32 = (void *)v61;
LABEL_28:
          v77 = 0uLL;
          v78 = 0;
          v60 = v39;
          v64 = v41;
          if (v31)
          {
            v56 = v40;
            -[_PHAssetCreationRequestValidator validatedVideoDuration](v31, "validatedVideoDuration");
            v75 = 0uLL;
            v76 = 0;
            -[_PHAssetCreationRequestValidator validatedImageDisplayTime](v31, "validatedImageDisplayTime");
            v40 = v56;
          }
          else
          {
            v75 = 0uLL;
            v76 = 0;
          }
          a6 = v62;
          v73 = v77;
          v74 = v78;
          v71 = v75;
          v72 = v76;
          v41 = v40;
          v30 = objc_msgSend(v10, "becomePhotoIrisWithMediaGroupUUID:mainFileMetadata:videoURL:spatialOverCaptureURL:videoDuration:stillDisplayTime:options:", v32, v42, v40, v64, &v73, &v71, 0);

          goto LABEL_33;
        }
      }
      else
      {
        objc_msgSend(v69, "creationOptions");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = v21;
        -[PHAssetCreationRequest _ingestOriginalFromSrcURL:toDstURL:useSecureMove:resource:resourceType:asset:error:](v59, "_ingestOriginalFromSrcURL:toDstURL:useSecureMove:resource:resourceType:asset:error:", v16, v37, objc_msgSend(v43, "shouldMoveFile"), v69, 3, v63, &v81);
        v44 = objc_claimAutoreleasedReturnValue();
        v39 = v81;

        v40 = (id)v44;
        v10 = v63;
        if (!v40 || !v70)
        {
          v41 = 0;
          v42 = v68;
          v31 = v65;
          if (v40)
            goto LABEL_25;
          v60 = v39;
          v30 = 0;
          v32 = (void *)v61;
          a6 = v62;
          goto LABEL_33;
        }
      }
      v58 = v40;
      objc_msgSend(v67, "creationOptions");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "shouldIngestInPlace");

      v47 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v63, "pathForVideoComplementSpatialOverCaptureContentFile");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "fileURLWithPath:isDirectory:", v48, 0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if (v46)
      {
        v80 = v39;
        v50 = -[PHAssetCreationRequest _ingestOriginalInPlaceSrcURL:dstURL:asset:error:](v59, "_ingestOriginalInPlaceSrcURL:dstURL:asset:error:", v70, v49, v63, &v80);
        v51 = v80;
        v52 = v39;
        v39 = v51;

        v10 = v63;
        if (v50)
        {
          v41 = v70;
LABEL_27:
          v42 = v68;
          v31 = v65;
          v32 = (void *)v61;
          v40 = v58;
          goto LABEL_28;
        }
      }
      else
      {
        objc_msgSend(v67, "creationOptions");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = v39;
        -[PHAssetCreationRequest _ingestOriginalFromSrcURL:toDstURL:useSecureMove:resource:resourceType:asset:error:](v59, "_ingestOriginalFromSrcURL:toDstURL:useSecureMove:resource:resourceType:asset:error:", v70, v49, objc_msgSend(v53, "shouldMoveFile"), v67, 11, v63, &v79);
        v41 = (id)objc_claimAutoreleasedReturnValue();
        v54 = v79;
        v55 = v39;
        v39 = v54;

        v10 = v63;
        if (v41)
          goto LABEL_27;
      }
      v60 = v39;
      v30 = 0;
      v32 = (void *)v61;
      a6 = v62;
      v31 = v65;
      v41 = v58;
LABEL_33:

      v21 = v60;
      goto LABEL_34;
    }
    v24 = (void *)v23;
    objc_msgSend(v12, "addObject:", v23);
    objc_msgSend(v11, "assetResourceWithType:", 15);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "validatedURLForAssetResource:", v25);
    v26 = objc_claimAutoreleasedReturnValue();
    if (v26)
      objc_msgSend(v12, "addObject:", v26);
    objc_msgSend(v25, "creationOptions");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = (void *)v26;
    objc_msgSend(v27, "ensureOptionsAreCompleteForURL:", v26);

    v83 = v21;
    v28 = -[PHValidator validateURLs:withOptions:videoComplementMetadata:error:](v65, "validateURLs:withOptions:videoComplementMetadata:error:", v12, 64, 0, &v83);
    v29 = v83;

    v67 = v25;
    if (v28)
    {
      v21 = v29;
      goto LABEL_13;
    }
    v30 = 0;
    v21 = v29;
    a6 = v62;
    v10 = v63;
    v31 = v65;
    v32 = (void *)v61;
  }
  else
  {
    v70 = 0;
    v67 = 0;
    v30 = 0;
    v31 = v18;
    v32 = 0;
  }
LABEL_34:
  if (a6 && (v30 & 1) == 0)
  {
    if (!v21)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", CFSTR("Failed to create videoComplement from resources"));
      v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = objc_retainAutorelease(v21);
    *a6 = v21;
  }

  return v30;
}

- (BOOL)_createRAWSidecarForAsset:(id)a3 fromValidatedResources:(id)a4 mainFileMetadata:(id)a5 photoLibrary:(id)a6 error:(id *)a7
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _PHAssetCreationRequestValidator *v15;
  id *v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id *v24;
  BOOL v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id *v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  id *v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v50;
  char v51;
  void *v52;
  id v53;
  void (**v54)(void);
  void *v55;
  id v56;
  id v58;
  id v59;
  id v60;
  _QWORD v61[5];
  id v62;
  id v63;
  uint64_t *v64;
  uint64_t *v65;
  char v66;
  id obj;
  _QWORD aBlock[4];
  id v69;
  id v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  id v78;
  uint64_t v79;
  id *v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;

  v58 = a3;
  v11 = a4;
  v56 = a5;
  v59 = a6;
  v79 = 0;
  v80 = (id *)&v79;
  v81 = 0x3032000000;
  v82 = __Block_byref_object_copy__13099;
  v83 = __Block_byref_object_dispose__13100;
  v84 = 0;
  objc_msgSend(v11, "assetResourceWithType:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "validatedURLForAssetResource:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "creationOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ensureOptionsAreCompleteForURL:", v13);

  v15 = -[_PHAssetCreationRequestValidator initWithAssetCreationRequest:]([_PHAssetCreationRequestValidator alloc], "initWithAssetCreationRequest:", self);
  v16 = v80;
  v78 = v80[5];
  LODWORD(a5) = -[PHValidator validateURL:withOptions:error:](v15, "validateURL:withOptions:error:", v13, 1, &v78);
  objc_storeStrong(v16 + 5, v78);
  if ((_DWORD)a5)
  {
    v72 = 0;
    v73 = &v72;
    v74 = 0x3032000000;
    v75 = __Block_byref_object_copy__13099;
    v76 = __Block_byref_object_dispose__13100;
    v77 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __111__PHAssetCreationRequest__createRAWSidecarForAsset_fromValidatedResources_mainFileMetadata_photoLibrary_error___block_invoke;
    aBlock[3] = &unk_1E35D8B90;
    v53 = v58;
    v69 = v53;
    v17 = v13;
    v70 = v17;
    v71 = &v72;
    v54 = (void (**)(void))_Block_copy(aBlock);
    objc_msgSend(v12, "creationOptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "shouldIngestInPlace");

    objc_msgSend(v59, "pathManager");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v54[2]();
      v20 = (void *)v73[5];
      if (!v20)
        goto LABEL_6;
      if (!objc_msgSend(v20, "isEqual:", v17))
        goto LABEL_6;
      v21 = (void *)MEMORY[0x1E0D73208];
      v22 = v73[5];
      objc_msgSend(v55, "capabilities");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v80;
      obj = v80[5];
      LOBYTE(v21) = objc_msgSend(v21, "ingestItemAtURL:toURL:type:options:capabilities:error:", v22, v22, 0, 3, v23, &obj);
      objc_storeStrong(v24 + 5, obj);

      if ((v21 & 1) == 0)
        goto LABEL_6;
      goto LABEL_14;
    }
    objc_msgSend(v12, "creationOptions");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "shouldMoveFile");

    if (objc_msgSend(v55, "isUBF"))
    {
      v51 = v27;
      v28 = objc_alloc(MEMORY[0x1E0D73278]);
      -[PHChangeRequest uuid](self, "uuid");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v53, "bundleScope");
      objc_msgSend(v12, "uniformTypeIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "originalFilename");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v28, "initWithAssetUuid:bundleScope:uti:resourceVersion:resourceType:recipeID:originalFilename:", v52, v29, v30, 0, 4, 0, v31);

      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __111__PHAssetCreationRequest__createRAWSidecarForAsset_fromValidatedResources_mainFileMetadata_photoLibrary_error___block_invoke_2;
      v61[3] = &unk_1E35D8B68;
      v64 = &v72;
      v61[4] = self;
      v66 = v51;
      v62 = v17;
      v63 = v55;
      v65 = &v79;
      objc_msgSend(v63, "obtainAccessAndWaitWithFileWithIdentifier:mode:toURLWithHandler:", v32, 2, v61);

    }
    else
    {
      if (!((unsigned int (*)(void))v54[2])())
        goto LABEL_13;
      v33 = v73[5];
      objc_msgSend(v55, "capabilities");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v80;
      v60 = v80[5];
      -[PHAssetCreationRequest _secureMove:fileAtURL:toURL:capabilities:error:](self, "_secureMove:fileAtURL:toURL:capabilities:error:", v27, v17, v33, v32, &v60);
      v35 = objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v34 + 5, v60);
      v36 = (void *)v73[5];
      v73[5] = v35;

    }
LABEL_13:
    if (!v73[5])
    {
LABEL_6:
      v25 = 0;
LABEL_17:

      _Block_object_dispose(&v72, 8);
      goto LABEL_18;
    }
LABEL_14:
    if (objc_msgSend(v55, "isDCIM"))
    {
      v37 = objc_alloc_init(MEMORY[0x1E0D71BB8]);
      objc_msgSend(v37, "setResourceType:", 4);
      objc_msgSend(v37, "setFileURL:", v73[5]);
      objc_msgSend(v37, "persistResourceTypeToFileURL");

    }
    v38 = v73[5];
    objc_msgSend(v53, "dateCreated");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "creationOptions");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "uniformTypeIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v56, "orientation");
    objc_msgSend(v59, "pathManager");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v50) = v42;
    objc_msgSend(v53, "addSidecarFileAtIndex:sidecarURL:withFilename:compressedSize:captureDate:modificationDate:uniformTypeIdentifier:imageOrientation:pathManager:", 0, v38, 0, 0, v39, 0, v41, v50, v43);

    v25 = 1;
    goto LABEL_17;
  }
  v25 = 0;
LABEL_18:
  if (a7 && !v25)
  {
    v44 = v80;
    v45 = v80[5];
    if (v45)
    {
      v46 = v45;
      v47 = v44[5];
      v44[5] = v46;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", CFSTR("Failed to create sidecar from resources"));
      v48 = objc_claimAutoreleasedReturnValue();
      v47 = v80[5];
      v80[5] = (id)v48;
    }

    *a7 = objc_retainAutorelease(v80[5]);
  }

  _Block_object_dispose(&v79, 8);
  return v25;
}

- (BOOL)_createSocResourceForAsset:(id)a3 fromValidatedResources:(id)a4 photoLibrary:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v11, "isValid"))
  {
    objc_msgSend(v11, "assetResourceWithType:", 13);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(v11, "assetResourceWithType:", 14);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "pathForSpatialOverCaptureContentFile");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "creationOptions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "ensureOptionsAreCompleteForURL:", v15);

      LODWORD(a6) = -[PHAssetCreationRequest _createOriginalResourceForAsset:fromValidatedResource:resourceType:photoLibrary:destinationURL:error:](self, "_createOriginalResourceForAsset:fromValidatedResource:resourceType:photoLibrary:destinationURL:error:", v10, v13, 10, v12, v15, a6);
      if ((_DWORD)a6)
        objc_msgSend(v10, "setCameraProcessingAdjustmentState:", objc_msgSend(v10, "cameraProcessingAdjustmentState") | 1);

    }
    else if (a6)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0D74498];
      v21 = *MEMORY[0x1E0CB2D50];
      v22[0] = CFSTR("invalid parameters required for fileIdentifier");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 46801, v19);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a6) = 0;
    }

  }
  else
  {
    LOBYTE(a6) = 0;
  }

  return (char)a6;
}

- (BOOL)_createXmpResourceForAsset:(id)a3 fromValidatedResources:(id)a4 photoLibrary:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v11, "isValid"))
  {
    objc_msgSend(v11, "assetResourceWithType:", 17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v10, "pathForXMPFile");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "fileURLWithPath:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[PHAssetCreationRequest _createOriginalResourceForAsset:fromValidatedResource:resourceType:photoLibrary:destinationURL:error:](self, "_createOriginalResourceForAsset:fromValidatedResource:resourceType:photoLibrary:destinationURL:error:", v10, v13, 5, v12, v16, a6);

    }
    else
    {
      v17 = 1;
    }

  }
  else
  {
    v17 = 1;
  }

  return v17;
}

- (BOOL)_createAudioResourceForAsset:(id)a3 fromValidatedResources:(id)a4 photoLibrary:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id *v20;
  void *v21;
  void *v22;
  void *v23;
  id *v24;
  _BOOL4 v25;
  NSObject *v26;
  id v27;
  PHAssetCreationRequest *v29;
  void *v30;
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v11, "isValid"))
  {
    objc_msgSend(v11, "assetResourceWithType:", 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v10, "pathForOriginalFile");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringByDeletingPathExtension");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "fileURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "pathExtension");
      v17 = v10;
      v18 = v13;
      v19 = v12;
      v20 = a6;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringByAppendingPathExtension:", v21);
      v29 = self;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "fileURLWithPath:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = v20;
      v12 = v19;
      v13 = v18;
      v10 = v17;

      v25 = -[PHAssetCreationRequest _createOriginalResourceForAsset:fromValidatedResource:resourceType:photoLibrary:destinationURL:error:](v29, "_createOriginalResourceForAsset:fromValidatedResource:resourceType:photoLibrary:destinationURL:error:", v17, v13, 2, v12, v23, v24);
      if (v25)
      {
        objc_msgSend(MEMORY[0x1E0D71A70], "installSupplementalResourceForExistingFileAtURL:ptpTrashedState:index:forAsset:imageOrientation:resultingResource:error:", v23, 0, 0, v17, 0, 0, v24);
      }
      else
      {
        PLBackendGetLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v27 = *v24;
          *(_DWORD *)buf = 138412290;
          v32 = v27;
          _os_log_impl(&dword_1991EC000, v26, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }

      }
    }
    else
    {
      LOBYTE(v25) = 1;
    }

  }
  else
  {
    LOBYTE(v25) = 1;
  }

  return v25;
}

- (BOOL)_createOriginalResourceForAsset:(id)a3 fromValidatedResource:(id)a4 resourceType:(unsigned int)a5 photoLibrary:(id)a6 destinationURL:(id)a7 error:(id *)a8
{
  uint64_t v11;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id *v24;
  BOOL v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  id *v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  char v41;
  id v42;
  id *v43;
  id v44;
  id v45;
  id v46;
  _QWORD v47[5];
  id v48;
  id v49;
  uint64_t *v50;
  uint64_t *v51;
  char v52;
  id obj;
  uint64_t v54;
  id *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;
  id *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;

  v11 = *(_QWORD *)&a5;
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v45 = a7;
  v60 = 0;
  v61 = (id *)&v60;
  v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__13099;
  v64 = __Block_byref_object_dispose__13100;
  v65 = 0;
  if (v15)
  {
    objc_msgSend(v15, "fileURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = a8;
    v44 = v14;
    v54 = 0;
    v55 = (id *)&v54;
    v56 = 0x3032000000;
    v57 = __Block_byref_object_copy__13099;
    v58 = __Block_byref_object_dispose__13100;
    v59 = 0;
    objc_msgSend(v15, "creationOptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "shouldIngestInPlace");

    objc_msgSend(v16, "pathManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v19)
    {
      v22 = (void *)MEMORY[0x1E0D73208];
      objc_msgSend(v20, "capabilities");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v61;
      obj = v61[5];
      LODWORD(v22) = objc_msgSend(v22, "ingestItemAtURL:toURL:type:options:capabilities:error:", v17, v17, 0, 3, v23, &obj);
      objc_storeStrong(v24 + 5, obj);

      if ((_DWORD)v22)
      {
        objc_storeStrong(v55 + 5, v17);
        v25 = 1;
        goto LABEL_13;
      }
      goto LABEL_12;
    }
    objc_msgSend(v15, "creationOptions");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "shouldMoveFile");

    if (objc_msgSend(v21, "isUBF"))
    {
      v41 = v27;
      v42 = objc_alloc(MEMORY[0x1E0D73278]);
      -[PHChangeRequest uuid](self, "uuid");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v14, "bundleScope");
      objc_msgSend(v15, "uniformTypeIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "originalFilename");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v42, "initWithAssetUuid:bundleScope:uti:resourceVersion:resourceType:recipeID:originalFilename:", v28, v29, v30, 0, v11, 0, v31);

      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __127__PHAssetCreationRequest__createOriginalResourceForAsset_fromValidatedResource_resourceType_photoLibrary_destinationURL_error___block_invoke;
      v47[3] = &unk_1E35D8B68;
      v50 = &v54;
      v47[4] = self;
      v52 = v41;
      v48 = v17;
      v49 = v21;
      v51 = &v60;
      objc_msgSend(v49, "obtainAccessAndWaitWithFileWithIdentifier:mode:toURLWithHandler:", v32, 2, v47);

    }
    else
    {
      objc_storeStrong(v55 + 5, a7);
      v33 = v55[5];
      if (!v33)
      {
LABEL_12:
        v25 = 0;
LABEL_13:

        _Block_object_dispose(&v54, 8);
        a8 = v43;
        v14 = v44;
        if (!v43)
          goto LABEL_18;
        goto LABEL_14;
      }
      objc_msgSend(v21, "capabilities");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v27;
      v35 = v61;
      v46 = v61[5];
      -[PHAssetCreationRequest _secureMove:fileAtURL:toURL:capabilities:error:](self, "_secureMove:fileAtURL:toURL:capabilities:error:", v34, v17, v33, v32, &v46);
      v36 = objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v35 + 5, v46);
      v37 = v55[5];
      v55[5] = (id)v36;

    }
    v25 = v55[5] != 0;
    goto LABEL_13;
  }
  v25 = 0;
  if (!a8)
    goto LABEL_18;
LABEL_14:
  if (!v25)
  {
    v38 = v61[5];
    if (v38)
    {
      *a8 = objc_retainAutorelease(v38);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", CFSTR("Failed to create spatial over capture from resources"));
      v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a8 = v39;

    }
  }
LABEL_18:
  _Block_object_dispose(&v60, 8);

  return v25;
}

- (id)_filteredImagePropertiesByConditionallyRemovingLivePhotoIdentifiersFromSourceImageProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  BOOL v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  _BOOL4 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PHAssetCreationRequest duplicateAssetIdentifier](self, "duplicateAssetIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetCreationRequest forcePairingIdentifier](self, "forcePairingIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PHAssetCreationRequest duplicateLivePhotoAsStill](self, "duplicateLivePhotoAsStill");
  v8 = -[PHAssetCreationRequest duplicateSinglePhotoFromBurst](self, "duplicateSinglePhotoFromBurst");
  v9 = v7 || v8;
  if (!v5)
    v9 = 0;
  if (v9 || (v10 = v4, v6))
  {
    PLBackendGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v17 = 138413058;
      v18 = v5;
      v19 = 2112;
      v20 = v6;
      v21 = 1024;
      v22 = v7;
      v23 = 1024;
      v24 = v8;
      _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_INFO, "Asset creation request rewrites metadata: duplicateAssetIdentifier=%@, forcePairingIdentifier=%@, duplicateLivePhotoAsStill=%d, duplicateSinglePhotoFromBurst=%d", (uint8_t *)&v17, 0x22u);
    }

    v12 = *MEMORY[0x1E0CBCF70];
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CBCF70]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v6)
    {
      objc_msgSend(v14, "setObject:forKey:", v6, *MEMORY[0x1E0C89C70]);
    }
    else
    {
      if (v7)
        objc_msgSend(v14, "removeObjectForKey:", *MEMORY[0x1E0C89C70]);
      if (v8)
        objc_msgSend(v15, "removeObjectForKey:", *MEMORY[0x1E0C89C78]);
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v15, v12);

  }
  return v10;
}

- (signed)_savedAssetTypeForAsset
{
  if (self->_createAsCompanionSyncedAsset)
    return objc_msgSend(MEMORY[0x1E0D73310], "savedAssetTypeForCompanionSyncedAsset");
  if (self->_momentShareUUID)
    return objc_msgSend(MEMORY[0x1E0D73310], "savedAssetTypeForMomentSharedAsset");
  if (self->_importedBy == 4)
    return objc_msgSend(MEMORY[0x1E0D73310], "savedAssetTypeForImportedByCameraConnectionKit");
  if (self->_duplicateAsAlternateAsset)
    return objc_msgSend(MEMORY[0x1E0D73310], "savedAssetTypeForDuplicateAsAlternateAsset");
  return objc_msgSend(MEMORY[0x1E0D73310], "defaultSavedAssetTypeForPhotoKitAssetCreationRequest");
}

- (id)_managedAssetFromPrimaryResourceData:(id)a3 validatedResources:(id)a4 withUUID:(id)a5 photoLibrary:(id)a6 mainFileMetadata:(id *)a7 getImageSource:(CGImageSource *)a8 imageData:(id *)a9
{
  id v13;
  void *v14;
  void *v15;
  const __CFDictionary *v16;
  CGImageSource *v17;
  CGImageSource *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  id *v26;
  NSObject *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  _BOOL4 v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  uint64_t v48;
  void *context;
  id v52;
  id v53;
  id v54;
  const __CFData *data;
  _QWORD v56[5];
  id v57;
  id v58;
  id v59;
  id v60;
  uint64_t *v61;
  id v62;
  id v63;
  id v64;
  id v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  uint8_t buf[4];
  void *v73;
  uint64_t v74;
  _QWORD v75[4];

  v75[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v52 = a4;
  v53 = a5;
  v54 = a6;
  v66 = 0;
  v67 = &v66;
  v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__13099;
  v70 = __Block_byref_object_dispose__13100;
  v71 = 0;
  objc_msgSend(v13, "data");
  data = (const __CFData *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "creationOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "uniformTypeIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  context = (void *)MEMORY[0x19AEBEADC]();
  if (v15)
  {
    v74 = *MEMORY[0x1E0CBD2A8];
    v75[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, &v74, 1);
    v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  v17 = CGImageSourceCreateWithData(data, v16);
  v18 = v17;
  if (v15)
  {

    v19 = v18 != 0;
  }
  else if (v17)
  {
    CGImageSourceGetType(v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 1;
  }
  else
  {
    v19 = 0;
    v15 = 0;
  }
  if ((v19 & ~objc_msgSend(v52, "hasCurrentAdjustment")) != 1)
    goto LABEL_12;
  objc_msgSend(MEMORY[0x1E0D752F0], "typeWithIdentifier:", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_opt_class();
  objc_msgSend(v54, "libraryBundle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "timeZoneLookup");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = objc_msgSend(v21, "_shouldGenerateThumbnailsDuringCreationForImageSource:contentType:timeZoneLookup:", v18, v20, v23);

  if ((_DWORD)v21)
  {

LABEL_12:
    v24 = (void *)MEMORY[0x1E0D73148];
    v65 = 0;
    v25 = 1;
    v26 = &v65;
    goto LABEL_16;
  }
  PLThumbnailsGetLog();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    -[PHChangeRequest uuid](self, "uuid");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v73 = v28;
    _os_log_impl(&dword_1991EC000, v27, OS_LOG_TYPE_INFO, "Delaying thumbnail generation from image data for %{public}@", buf, 0xCu);

  }
  v26 = 0;
  v25 = 0;
  v24 = (void *)MEMORY[0x1E0D73148];
LABEL_16:
  v63 = 0;
  v64 = 0;
  v62 = 0;
  objc_msgSend(v24, "writeableDataForImageData:imageUTIType:imageSource:thumbnailDataOut:imageUTITypeOut:exifPropertiesOut:imageDataOut:", data, v15, v18, v26, &v64, &v63, &v62);
  if (v25)
    v29 = v65;
  else
    v29 = 0;
  v30 = v64;
  v31 = v63;
  v32 = v62;
  if (v19)
    CFRelease(v18);
  objc_msgSend(v13, "creationOptions");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "originalFilename");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __146__PHAssetCreationRequest__managedAssetFromPrimaryResourceData_validatedResources_withUUID_photoLibrary_mainFileMetadata_getImageSource_imageData___block_invoke;
  v56[3] = &unk_1E35D8BB8;
  v61 = &v66;
  v56[4] = self;
  v35 = v32;
  v57 = v35;
  v36 = v30;
  v58 = v36;
  v37 = v31;
  v59 = v37;
  v38 = v29;
  v60 = v38;
  v39 = -[PHAssetCreationRequest _accessWritableURLForUUID:imageUTI:originalFilename:photoLibrary:withHandler:](self, "_accessWritableURLForUUID:imageUTI:originalFilename:photoLibrary:withHandler:", v53, v36, v34, v54, v56);

  objc_autoreleasePoolPop(context);
  if (v39)
  {
    objc_msgSend(MEMORY[0x1E0D752F0], "typeWithIdentifier:", v15);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_alloc(MEMORY[0x1E0D75140]);
    objc_msgSend(v54, "libraryBundle");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "timeZoneLookup");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v41, "initWithImageData:contentType:options:timeZoneLookup:cacheImageSource:cacheImageData:", data, v40, 14, v43, 1, 1);

    if (v44)
    {
      if (a7)
        *a7 = objc_retainAutorelease(v44);
      LOWORD(v48) = 256;
      objc_msgSend(MEMORY[0x1E0D71880], "insertAssetIntoPhotoLibrary:mainFileURL:mainFileMetadata:savedAssetType:bundleScope:uuid:replacementUUID:imageSource:imageData:isPlaceholder:deleteFileOnFailure:", v54, v67[5], v44, -[PHAssetCreationRequest _savedAssetTypeForAsset](self, "_savedAssetTypeForAsset"), -[PHAssetCreationRequest bundleScope](self, "bundleScope"), v53, 0, a8, a9, v48);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setUniformTypeIdentifier:", v36);
    }
    else
    {
      PLBackendGetLog();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v46 = (void *)v67[5];
        *(_DWORD *)buf = 138412290;
        v73 = v46;
        _os_log_impl(&dword_1991EC000, v44, OS_LOG_TYPE_ERROR, "Unable to read metadata from data written to disk at %@", buf, 0xCu);
      }
      v45 = 0;
    }

  }
  else
  {
    v45 = 0;
  }

  _Block_object_dispose(&v66, 8);
  return v45;
}

- (BOOL)_accessWritableURLForUUID:(id)a3 imageUTI:(id)a4 originalFilename:(id)a5 photoLibrary:(id)a6 withHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  char v27;
  BOOL v28;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  objc_msgSend(v15, "pathManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isUBF");

  if (v18)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D73278]), "initWithAssetUuid:bundleScope:uti:resourceVersion:resourceType:recipeID:originalFilename:", v12, -[PHAssetCreationRequest bundleScope](self, "bundleScope"), v13, 0, 31, 0, v14);
    objc_msgSend(v15, "pathManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __103__PHAssetCreationRequest__accessWritableURLForUUID_imageUTI_originalFilename_photoLibrary_withHandler___block_invoke;
    v30[3] = &unk_1E35D8BE0;
    v35 = &v36;
    v34 = v16;
    v31 = v12;
    v32 = v13;
    v33 = v14;
    objc_msgSend(v20, "obtainAccessAndWaitWithFileWithIdentifier:mode:toURLWithHandler:", v19, 2, v30);

    v21 = v34;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D73148], "defaultFileExtensionForAssetType:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0D73148], "preferredFileExtensionForType:", v13);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "length"))
      {
        v23 = v22;

        v19 = v23;
      }

    }
    objc_msgSend(v15, "libraryServicesManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "imageWriter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "cameraAssetPathForNewAssetWithExtension:assetUUID:", v19, v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    *((_BYTE *)v37 + 24) = v21 != 0;
    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v21, 0);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (*((uint64_t (**)(id, NSObject *))v16 + 2))(v16, v26);
      *((_BYTE *)v37 + 24) = v27;
    }
    else
    {
      PLBackendGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v41 = v19;
        v42 = 2114;
        v43 = v12;
        _os_log_impl(&dword_1991EC000, v26, OS_LOG_TYPE_ERROR, "Failed to get a valid path from -[PLImageWriter cameraAssetPathForNewAssetWithExtension:assetUUID:] for extension: %{public}@, UUID: %{public}@", buf, 0x16u);
      }
    }

  }
  v28 = *((_BYTE *)v37 + 24) != 0;
  _Block_object_dispose(&v36, 8);

  return v28;
}

- (BOOL)_writeDataToDisk:(id)a3 imageUTIType:(id)a4 exifProperties:(id)a5 mainFileURL:(id)a6 thumbnailData:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  char IsEqual;
  void *v19;
  int v20;
  void *v21;
  char v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  char v27;
  BOOL v28;
  char v29;
  uint64_t v30;
  void *v31;
  int v32;
  NSObject *v33;
  uint64_t v34;
  id v36;
  id v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  id v43;
  __int16 v44;
  NSObject *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!objc_msgSend(MEMORY[0x1E0D71880], "isPrimaryImageFormatForUTI:", v13))
  {
    v36 = 0;
    v27 = objc_msgSend(v12, "writeToURL:options:error:", v15, 1073741825, &v36);
    v17 = v36;
    if ((v27 & 1) != 0)
      goto LABEL_7;
    PLPhotoKitGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    v30 = objc_msgSend(v12, "length");
    *(_DWORD *)buf = 134218754;
    v39 = v12;
    v40 = 2048;
    v41 = v30;
    v42 = 2112;
    v43 = v15;
    v44 = 2112;
    v45 = v17;
    v24 = "Failed to write image data (%p %ld) to URL %@, %@";
LABEL_16:
    v25 = v23;
    v26 = 42;
    goto LABEL_17;
  }
  -[PHAssetCreationRequest _filteredImagePropertiesByConditionallyRemovingLivePhotoIdentifiersFromSourceImageProperties:](self, "_filteredImagePropertiesByConditionallyRemovingLivePhotoIdentifiersFromSourceImageProperties:", v14);
  v17 = objc_claimAutoreleasedReturnValue();
  IsEqual = PLObjectIsEqual();
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqual:", *MEMORY[0x1E0CEC530]);

  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0D73148], "sharedDCIMWriter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "writeJPEGToURL:withData:thumbnail:properties:", v15, v12, v16, v17);

    if ((v22 & 1) == 0)
    {
      PLPhotoKitGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218498;
        v39 = v12;
        v40 = 2048;
        v41 = objc_msgSend(v12, "length");
        v42 = 2112;
        v43 = v15;
        v24 = "Failed to write JPEG image data (%p %ld) to URL %@.";
        v25 = v23;
        v26 = 32;
LABEL_17:
        _os_log_impl(&dword_1991EC000, v25, OS_LOG_TYPE_ERROR, v24, buf, v26);
      }
LABEL_21:
      v28 = 0;
      goto LABEL_22;
    }
    goto LABEL_7;
  }
  if ((IsEqual & 1) != 0)
  {
    v37 = 0;
    v29 = objc_msgSend(v12, "writeToURL:options:error:", v15, 1073741825, &v37);
    v23 = v37;
    if ((v29 & 1) != 0)
    {
      v28 = 1;
LABEL_22:

      goto LABEL_23;
    }
    PLPhotoKitGetLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = objc_msgSend(v12, "length");
      *(_DWORD *)buf = 134218754;
      v39 = v12;
      v40 = 2048;
      v41 = v34;
      v42 = 2112;
      v43 = v15;
      v44 = 2112;
      v45 = v23;
      _os_log_impl(&dword_1991EC000, v33, OS_LOG_TYPE_ERROR, "Failed to copy primary image data (%p %ld) to URL %@: %@", buf, 0x2Au);
    }

    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0D73148], "sharedDCIMWriter");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "copyPrimaryFormatImageData:toURL:properties:", v12, v15, v17);

  if (v32)
  {
    PLPhotoKitGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_DWORD *)buf = 134218754;
    v39 = v12;
    v40 = 2048;
    v41 = objc_msgSend(v12, "length");
    v42 = 2112;
    v43 = v15;
    v44 = 2048;
    v45 = v32;
    v24 = "Failed to copy primary image data (%p %ld) to URL %@, %ld";
    goto LABEL_16;
  }
LABEL_7:
  v28 = 1;
LABEL_23:

  return v28;
}

- (id)_externalLivePhotoResourceForAsset:(id)a3
{
  id v5;
  unsigned int v6;
  PHExternalAssetResource *v7;
  uint64_t v8;
  PHExternalAssetResource *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  PHAssetResourceCreationOptions *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;

  v5 = a3;
  v6 = objc_msgSend(v5, "kind");
  if (v6 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetCreationRequest.m"), 2267, CFSTR("This method is intended to create external assets for images and videos only"));

  }
  v7 = [PHExternalAssetResource alloc];
  if (v6)
    v8 = 9;
  else
    v8 = 1;
  v9 = -[PHExternalAssetResource initWithResourceType:](v7, "initWithResourceType:", v8);
  objc_msgSend(v5, "pathManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isUBF");

  if (v11)
  {
    v12 = objc_alloc(MEMORY[0x1E0D73278]);
    objc_msgSend(v5, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v5, "bundleScope");
    objc_msgSend(v5, "uniformTypeIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "originalFilename");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v12, "initWithAssetUuid:bundleScope:uti:resourceVersion:resourceType:recipeID:originalFilename:", v13, v14, v15, 0, v6 != 0, 0, v16);

    objc_msgSend(v5, "photoLibrary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetCreationRequest.m"), 2274, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset.photoLibrary"));

    }
    objc_msgSend(v5, "pathManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "readOnlyUrlWithIdentifier:", v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "mainFileURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21 = objc_alloc_init(PHAssetResourceCreationOptions);
  -[PHAssetResourceCreationOptions setShouldMoveFile:](v21, "setShouldMoveFile:", 0);
  objc_msgSend(v5, "uniformTypeIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetResourceCreationOptions setUniformTypeIdentifier:](v21, "setUniformTypeIdentifier:", v22);

  objc_msgSend(v5, "additionalAttributes");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "alternateImportImageDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetResourceCreationOptions setAlternateImportImageDate:](v21, "setAlternateImportImageDate:", v24);

  objc_msgSend(v5, "originalFilename");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetResourceCreationOptions setOriginalFilename:](v21, "setOriginalFilename:", v25);

  -[PHExternalAssetResource setFileURL:](v9, "setFileURL:", v20);
  -[PHExternalAssetResource setCreationOptions:](v9, "setCreationOptions:", v21);

  return v9;
}

- (id)_createAdjustmentsFileFromJobDictionary:(id)a3 cameraIngestOptions:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int v13;
  id v14;
  _QWORD *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  void *v21;
  float v22;
  float v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  NSObject *v42;
  void *v43;
  char v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  NSObject *v50;
  NSObject *v51;
  uint64_t v52;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  uint64_t v64;
  id v65;
  id v66;
  uint8_t buf[4];
  uint64_t v68;
  __int16 v69;
  id v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D74D20]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D74CF8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D74E50]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0D74DB8];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D74DB8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0D74E20];
  v13 = objc_msgSend(v11, "isEqual:", *MEMORY[0x1E0D74E20]);

  v14 = objc_alloc(MEMORY[0x1E0C99E98]);
  v15 = (_QWORD *)MEMORY[0x1E0D74F40];
  if (!v13)
    v15 = (_QWORD *)MEMORY[0x1E0D74EC0];
  objc_msgSend(v5, "objectForKeyedSubscript:", *v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (void *)objc_msgSend(v14, "initFileURLWithPath:isDirectory:", v16, 0);

  v17 = *MEMORY[0x1E0C9D820];
  v18 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D74D98]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D74D88]);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v19 && v20)
  {
    objc_msgSend(v19, "floatValue");
    v17 = v22;
    objc_msgSend(v21, "floatValue");
    v18 = v23;
  }
  v59 = v21;
  v60 = v19;
  objc_msgSend(MEMORY[0x1E0D71978], "exportPropertiesWithImageWidth:imageHeight:exifOrientation:duration:", (unint64_t)v17, (unint64_t)v18, (int)objc_msgSend(v9, "intValue"), 0.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v9;
  if (!v7)
  {
    v58 = 0;
    v25 = 0;
    v27 = 0;
    goto LABEL_11;
  }
  v66 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v7, 2, &v66);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v66;
  v58 = v26;
  if (!v25)
  {
    v47 = v26;
    PLPhotoKitIngestGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v68 = (uint64_t)v7;
      v69 = 2112;
      v70 = v47;
      _os_log_impl(&dword_1991EC000, v25, OS_LOG_TYPE_ERROR, "Error reading camera metadata at path: %@ error: %@", buf, 0x16u);
    }
    goto LABEL_35;
  }
  v65 = 0;
  objc_msgSend(MEMORY[0x1E0D750D8], "deserializedMetadataFromData:error:", v25, &v65);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v65;
  v29 = v28;
  if (!v27)
  {
    PLPhotoKitIngestGetLog();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      v52 = -[NSObject length](v25, "length");
      *(_DWORD *)buf = 134218242;
      v68 = v52;
      v69 = 2112;
      v70 = v29;
      _os_log_impl(&dword_1991EC000, v51, OS_LOG_TYPE_ERROR, "Error deserialization camera metadata (length=%lu): %@", buf, 0x16u);
    }

LABEL_35:
    v27 = 0;
    v43 = 0;
    v46 = 0;
    goto LABEL_36;
  }

LABEL_11:
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "isEqual:", v12);

  v56 = v24;
  v57 = v8;
  if (v31)
  {
    objc_msgSend(MEMORY[0x1E0D717C0], "assetAdjustmentsFromCameraAdjustmentData:cameraMetadata:exportProperties:applySemanticEnhance:assetType:sourceURL:", v8, v27, v24, 0, 1, v62);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D717C0], "assetAdjustmentsFromCameraAdjustmentData:cameraMetadata:exportProperties:applySemanticEnhance:assetType:sourceURL:", v8, v27, v24, 0, 0, v62);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = 0;
    objc_msgSend(MEMORY[0x1E0D750C0], "deserializedAdjustmentsFromData:error:", v8, &v64);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)v33;
    if (v6 && v33)
    {
      v54 = v6;
      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D74E98]);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D74D58]);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v34, "canBeRenderedByCapturePipelineWithVideoComplement:deferredIdentifier:", v35 != 0, v36);

      if (v37)
        objc_msgSend(v54, "setCandidateOptions:", 16);
      objc_msgSend(v34, "portraitEffectFilterName");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v54;
      objc_msgSend(v54, "setPortraitEffectFilterName:", v38);

    }
  }
  objc_msgSend(v32, "propertyListDictionary");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    v55 = v7;
    v40 = v6;
    objc_msgSend(v62, "absoluteString");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHAssetCreationRequestBridge buildAdjustmentsPlistPathForPhotoKitIngestJob:withSourcePath:](PHAssetCreationRequestBridge, "buildAdjustmentsPlistPathForPhotoKitIngestJob:withSourcePath:", v5, v41);
    v42 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = 0;
    v44 = objc_msgSend(v39, "writeToURL:error:", v43, &v63);
    v45 = v63;
    if ((v44 & 1) != 0)
    {
      v46 = v43;
    }
    else
    {
      PLPhotoKitIngestGetLog();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v68 = (uint64_t)v42;
        v69 = 2112;
        v70 = v45;
        _os_log_impl(&dword_1991EC000, v50, OS_LOG_TYPE_ERROR, "PhotoKit Image Ingest: Could not write propertyListDictionary to URL %@. error: %@", buf, 0x16u);
      }

      v46 = 0;
    }

    v6 = v40;
    v7 = v55;
  }
  else
  {
    PLPhotoKitIngestGetLog();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D74D38]);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v68 = (uint64_t)v48;
      v69 = 2112;
      v70 = v49;
      _os_log_impl(&dword_1991EC000, v42, OS_LOG_TYPE_ERROR, "PhotoKit ingest pipeline: property list dictionary for asset of job type %@ with uuid %@ is empty.", buf, 0x16u);

    }
    v43 = 0;
    v46 = 0;
  }

  v24 = v56;
  v8 = v57;
LABEL_36:

  return v46;
}

- (id)_createTimelapsePlaceholderAssetWithUUID:(id)a3 InPhotoLibrary:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  const void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  PHAssetCreationRequest *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  double v30;
  double v31;
  PHAssetCreationCameraIngestOptions *cameraIngestOptions;
  double v33;
  NSObject *v34;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v6 = a4;
  objc_msgSend(v6, "pathManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "simpleDCIMDirectory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHContentEditingOutput defaultExtensionForUniformTypeIdentifierType:](PHContentEditingOutput, "defaultExtensionForUniformTypeIdentifierType:", *MEMORY[0x1E0CEC5B0]);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v8;
  objc_msgSend(v8, "nextAvailableFileURLWithExtension:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByDeletingLastPathComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  v13 = objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v12, 1, 0, &v41);
  v14 = v41;

  if ((v13 & 1) != 0)
  {
    v15 = objc_msgSend(MEMORY[0x1E0D73310], "savedAssetTypeForCameraAsset");
    -[PHAssetCreationCameraIngestOptions previewImgSurfaceRef](self->_cameraIngestOptions, "previewImgSurfaceRef");
    v16 = PLCreateCGImageFromIOSurface();
    if (v16)
    {
      v17 = (const void *)v16;
      v18 = DCIM_newPLImageWithCGImage();
      if (v18)
        v19 = (void *)PLCreateImageWithFormatFromImage();
      else
        v19 = 0;
      CFRelease(v17);
    }
    else
    {
      v18 = 0;
      v19 = 0;
    }
    LOWORD(v36) = 257;
    objc_msgSend(MEMORY[0x1E0D71880], "insertAssetIntoPhotoLibrary:mainFileURL:mainFileMetadata:savedAssetType:bundleScope:uuid:replacementUUID:imageSource:imageData:isPlaceholder:deleteFileOnFailure:", v6, v9, 0, v15, -[PHAssetCreationRequest bundleScope](self, "bundleScope"), v40, 0, 0, 0, v36);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v22;
    if (v22)
    {
      objc_msgSend(v22, "setAttributesFromMainFileURL:mainFileMetadata:savedAssetType:bundleScope:isPlaceholder:placeholderFileURL:imageSource:imageData:", v9, 0, v15, 0, 1, 0, 0, 0);
      objc_msgSend(v21, "generateAndUpdateThumbnailsWithPreviewImage:thumbnailImage:fromImageSource:imageData:forceSRGBConversion:", v18, v19, 0, 0, 0);
      v23 = -[PHAssetCreationCameraIngestOptions isRearFacingCamera](self->_cameraIngestOptions, "isRearFacingCamera");
      objc_msgSend(v21, "additionalAttributes");
      v37 = v18;
      v24 = self;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setCameraCaptureDevice:", !v23);

      objc_msgSend(v21, "additionalAttributes");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v23)
        v28 = 1;
      else
        v28 = 2;
      objc_msgSend(v26, "setImportedBy:", v28);

      -[PHAssetCreationCameraIngestOptions creationDate](v24->_cameraIngestOptions, "creationDate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setDateCreated:", v29);

      objc_msgSend(v21, "setKindSubtype:", 102);
      -[PHAssetCreationCameraIngestOptions placeholderHeight](v24->_cameraIngestOptions, "placeholderHeight");
      v31 = v30;
      cameraIngestOptions = v24->_cameraIngestOptions;
      v18 = v37;
      -[PHAssetCreationCameraIngestOptions placeholderWidth](cameraIngestOptions, "placeholderWidth");
      if ((uint64_t)v33 && (uint64_t)v31)
      {
        objc_msgSend(v21, "setWidth:");
        objc_msgSend(v21, "setHeight:", (uint64_t)v31);
      }
    }
    else
    {
      PLPhotoKitIngestGetLog();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v43 = v40;
        _os_log_impl(&dword_1991EC000, v34, OS_LOG_TYPE_ERROR, "Could not create timelapse PLManagedAsset placeholder for uuid: %{public}@", buf, 0xCu);
      }

    }
  }
  else
  {
    PLPhotoKitIngestGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v43 = v20;
      v44 = 2112;
      v45 = v14;
      _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_ERROR, "PhotoKit Camera Ingest: Failed to create directory for timelapse placeholder at path: %@, Error: %@", buf, 0x16u);

    }
    v21 = 0;
  }

  return v21;
}

- (BOOL)_assetAlreadyExistsAsPlaceholder:(BOOL)a3 mediaType:(int64_t)a4 uuid:(id)a5 photoLibrary:(id)a6 fetchAsset:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  int v15;
  char v16;

  v12 = a5;
  v13 = a6;
  if (a4 == 2)
  {
    -[PHAssetCreationCameraIngestOptions jobType](self->_cameraIngestOptions, "jobType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D74E18]);

    if (a3)
      goto LABEL_7;
  }
  else
  {
    v15 = 0;
    if (a3)
    {
LABEL_7:
      objc_msgSend(MEMORY[0x1E0D71880], "assetWithUUID:inLibrary:", v12, v13);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      v16 = v15 | a3;
      goto LABEL_8;
    }
  }
  if (v15)
    goto LABEL_7;
  v16 = 0;
LABEL_8:

  return v16;
}

- (void)_checkAndGenerateThumbnailsForAsset:(id)a3 imageSource:(CGImageSource *)a4 imageData:(id)a5 previewImage:(id)a6 thumbnailImage:(id)a7 timeZoneLookup:(id)a8 resourceBag:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  CGImageSource *v25;
  void *v26;
  CGImageSource *v27;
  id v28;
  char v29;
  NSObject *v30;
  void *v31;
  char v32;
  BOOL v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  if (objc_msgSend(v15, "isPhoto"))
  {
    v42 = v17;
    v43 = v16;
    v21 = v18;
    v22 = v20;
    v23 = (void *)MEMORY[0x1E0D752F0];
    objc_msgSend(v15, "uniformTypeIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "typeWithIdentifier:", v24);
    v25 = a4;
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = v25;
    v28 = v19;
    v29 = objc_msgSend((id)objc_opt_class(), "_shouldGenerateThumbnailsDuringCreationForImageSource:contentType:timeZoneLookup:", v25, v26, v19);
    if ((v29 & 1) == 0)
    {
      PLThumbnailsGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        -[PHChangeRequest uuid](self, "uuid");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v45 = v31;
        _os_log_impl(&dword_1991EC000, v30, OS_LOG_TYPE_INFO, "Delaying thumbnail generation for %{public}@", buf, 0xCu);

      }
    }

    v32 = v29 ^ 1;
    a4 = v27;
    v20 = v22;
    v18 = v21;
    v17 = v42;
    v16 = v43;
    v19 = v28;
  }
  else
  {
    v32 = 0;
  }
  v33 = -[PHChangeRequest shouldPerformConcurrentWork](self, "shouldPerformConcurrentWork");
  if ((v32 & 1) == 0 && !v33)
  {
    -[PHChangeRequest helper](self, "helper");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "clientAuthorization");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "isCameraClient");

    if (v36)
    {
      objc_msgSend(v15, "avalancheUUID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v37)
      {
        a4 = 0;
        v39 = v16;
        v16 = 0;
LABEL_17:

        goto LABEL_18;
      }
      objc_msgSend(v15, "avalancheUUID");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
      {
        objc_msgSend(v20, "assetResourceWithType:", 111);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "validatedDataForAssetResource:", v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v40, "length"))
        {
          DCIM_newPLImageWithStoredJPEGData();
          v41 = objc_claimAutoreleasedReturnValue();

          v17 = (id)v41;
        }

        goto LABEL_17;
      }
    }
LABEL_18:
    objc_msgSend(v15, "generateAndUpdateThumbnailsWithPreviewImage:thumbnailImage:fromImageSource:imageData:forceSRGBConversion:", v17, v18, a4, v16, 0);
  }

}

- (void)_checkAndSetForSemanticEnhancementForAsset:(id)a3 resourceBag:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PHAssetCreationCameraIngestOptions deferredPhotoIdentifier](self->_cameraIngestOptions, "deferredPhotoIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D752F0];
  objc_msgSend(v5, "uniformTypeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "typeWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "conformsToType:", *MEMORY[0x1E0CEC5B8]);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(v5, "additionalAttributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDeferredProcessingCandidateOptions:", objc_msgSend(v11, "deferredProcessingCandidateOptions") | 8);

    if (v6)
      v12 = 1;
    else
      v12 = 10;
    objc_msgSend(v5, "setDeferredProcessingNeeded:", v12);
    PLAssetImportGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "uuidDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v14;
      _os_log_impl(&dword_1991EC000, v13, OS_LOG_TYPE_DEFAULT, "Signaling background processing needed for %{public}@, due to needs capture scheduling", (uint8_t *)&v22, 0xCu);

    }
    objc_msgSend(v5, "photoLibrary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "libraryServicesManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "backgroundJobService");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "startWatchdogTimerIfNeededWithSourceDescription:", CFSTR("CameraIngest"));

    objc_msgSend(v5, "photoLibrary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "libraryServicesManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "backgroundJobService");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photoLibrary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "signalBackgroundProcessingNeededOnLibrary:", v21);

  }
}

- (BOOL)_setupSemanticEnhanceMetadataIfNeededWithDestinationURL:(id)a3 photoLibrary:(id)a4 semanticEnhanceResult:(id *)a5 ingestJobCameraMetadata:(id)a6
{
  int64_t var0;
  id v11;
  id v12;
  id v13;
  void *v14;
  double var1;
  void *v16;
  void *v17;
  BOOL v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  var0 = a5->var0;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v11, "cameraMetadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSemanticEnhanceScene:", var0);

  var1 = a5->var1;
  objc_msgSend(v11, "cameraMetadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSemanticEnhanceSceneConfidence:", var1);

  +[PHAssetCreationRequest _cameraMetadataURLForPrimaryAssetURL:photoLibrary:](PHAssetCreationRequest, "_cameraMetadataURLForPrimaryAssetURL:photoLibrary:", v13, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  v18 = -[PHAssetCreationRequest _writeOutCameraMetadata:destinationURL:error:](self, "_writeOutCameraMetadata:destinationURL:error:", v11, v17, &v23);

  v19 = v23;
  if (!v18)
  {
    PLBackendGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v17, "path");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = v21;
      v26 = 2112;
      v27 = v19;
      _os_log_impl(&dword_1991EC000, v20, OS_LOG_TYPE_ERROR, "[SemDev] Error writing out MDATA file to destination %@, skipping SemDev: %@", buf, 0x16u);

    }
    a5->var0 = -1;
  }

  return v18;
}

- (BOOL)_writeOutCameraMetadata:(id)a3 destinationURL:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v14;
  id v15;

  v7 = a4;
  v8 = (void *)MEMORY[0x1E0CB36F8];
  objc_msgSend(a3, "cameraMetadata");
  v9 = objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v8, "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v15;

  v14 = v11;
  LOBYTE(v9) = objc_msgSend(v10, "writeToURL:options:error:", v7, 1, &v14);
  v12 = v14;

  if ((v9 & 1) == 0)
  {

    v7 = 0;
  }
  if (a5 && v12)
    *a5 = objc_retainAutorelease(v12);

  return v12 == 0;
}

- (void)_setupIrisPairingTimeoutForAsset:(id)a3 imageFile:(id)a4 library:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  dispatch_time_t v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "setKindSubtype:", 2);
  objc_msgSend(v8, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringByDeletingLastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHAssetCreationRequest _photoIrisIndicatorFilePathForPhotoAtPath:UUID:](PHAssetCreationRequest, "_photoIrisIndicatorFilePathForPhotoAtPath:UUID:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    PLMakeIndicatorFileExistAtPath();
    objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PHAssetCreationRequest _setupIrisPairingTimeoutForAsset:imageFile:library:]");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = dispatch_time(0, 8000000000);
    objc_msgSend(MEMORY[0x1E0D71678], "sharedLimiter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __77__PHAssetCreationRequest__setupIrisPairingTimeoutForAsset_imageFile_library___block_invoke;
    v18[3] = &unk_1E35DFAF8;
    v19 = v7;
    v20 = v13;
    v21 = v14;
    v17 = v14;
    objc_msgSend(v16, "dispatchAfterTime:library:block:", v15, v19, v18);

  }
}

- (BOOL)_filePathIsInIncomingDirectory:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  BOOL v18;
  id v20;
  uint64_t v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -1;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0D73148], "incomingDirectoryPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileURLWithPath:isDirectory:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v10 = objc_msgSend(v5, "getRelationship:ofDirectoryAtURL:toItemAtURL:error:", &v21, v9, v6, &v20);
  v11 = v20;

  if ((v10 & 1) != 0)
  {
    if (!v21)
    {
      v18 = 1;
      goto LABEL_9;
    }
    PLPhotoKitIngestGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0D731F0], "descriptionWithFileURL:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v13;
      v14 = "File not in Incoming, skipping deletion: %@";
      v15 = v12;
      v16 = OS_LOG_TYPE_DEFAULT;
      v17 = 12;
LABEL_7:
      _os_log_impl(&dword_1991EC000, v15, v16, v14, buf, v17);

    }
  }
  else
  {
    PLPhotoKitIngestGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0D731F0], "descriptionWithFileURL:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v23 = v13;
      v24 = 2112;
      v25 = v11;
      v14 = "Unable to get relationship between incoming dir and %@: %@";
      v15 = v12;
      v16 = OS_LOG_TYPE_ERROR;
      v17 = 22;
      goto LABEL_7;
    }
  }

  v18 = 0;
LABEL_9:

  return v18;
}

- (void)_removePhotoKitCameraIngestFiles:(id)a3 originalFileURL:(id)a4 resourceBag:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PHAssetCreationRequest _filePathIsInIncomingDirectory:](self, "_filePathIsInIncomingDirectory:", v10);

  if (v11)
  {
    objc_msgSend(v8, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAssetCreationRequest _deleteJobFileAtPath:withAsset:](self, "_deleteJobFileAtPath:withAsset:", v12, v25);

    -[PHAssetCreationCameraIngestOptions cameraMetadataPath](self->_cameraIngestOptions, "cameraMetadataPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAssetCreationRequest _deleteJobFileAtPath:withAsset:](self, "_deleteJobFileAtPath:withAsset:", v13, v25);

    -[PHAssetCreationCameraIngestOptions backupAdjustmentsFile](self->_cameraIngestOptions, "backupAdjustmentsFile");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAssetCreationRequest _deleteJobFileAtPath:withAsset:](self, "_deleteJobFileAtPath:withAsset:", v14, v25);

    objc_msgSend(v9, "assetResourceWithType:", 5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "validatedURLForAssetResource:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAssetCreationRequest _deleteJobFileAtPath:withAsset:](self, "_deleteJobFileAtPath:withAsset:", v17, v25);

    objc_msgSend(v9, "assetResourceWithType:", 107);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "validatedURLForAssetResource:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAssetCreationRequest _deleteJobFileAtPath:withAsset:](self, "_deleteJobFileAtPath:withAsset:", v20, v25);

    objc_msgSend(v9, "assetResourceWithType:", 7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "validatedURLForAssetResource:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "path");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAssetCreationRequest _deleteJobFileAtPath:withAsset:](self, "_deleteJobFileAtPath:withAsset:", v23, v25);

    -[PHAssetCreationCameraIngestOptions dbgFilePath](self->_cameraIngestOptions, "dbgFilePath");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAssetCreationRequest _deleteJobFileAtPath:withAsset:](self, "_deleteJobFileAtPath:withAsset:", v24, v25);

  }
}

- (void)_deleteJobFileAtPath:(id)a3 withAsset:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v9 = -[PHAssetCreationRequest _filePathIsInIncomingDirectory:](self, "_filePathIsInIncomingDirectory:", v6);
    PLPhotoKitIngestGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0D731F0], "descriptionWithPath:", v6);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "uuid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v21 = v17;
        v22 = 2114;
        v23 = v18;
        _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_ERROR, "File not in Incoming, skipping deletion: %@, for UUID:%{public}@", buf, 0x16u);

      }
      v14 = 0;
      goto LABEL_13;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = v6;
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_DEFAULT, "Will remove file at path: %@, for UUID:%@", buf, 0x16u);

    }
    v19 = 0;
    v13 = objc_msgSend(v8, "removeItemAtPath:error:", v6, &v19);
    v14 = v19;
    if ((v13 & 1) == 0 && (PLIsErrorFileNotFound() & 1) == 0)
    {
      PLPhotoKitIngestGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0D731F0], "descriptionWithPath:", v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "uuid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v21 = v15;
        v22 = 2114;
        v23 = v16;
        v24 = 2112;
        v25 = v14;
        _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_ERROR, "Failed to remove file at path: %@, for UUID:%{public}@ %@", buf, 0x20u);

      }
LABEL_13:

    }
  }
  else
  {
    v14 = 0;
  }

}

- (id)_createAssetAdjustmentsFromBackupWithAsset:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _BOOL4 v10;
  _BOOL4 v11;
  double v12;
  int v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  CMTime time;

  v4 = a3;
  v5 = *MEMORY[0x1E0C9D820];
  v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  -[PHAssetCreationCameraIngestOptions finalAssetWidth](self->_cameraIngestOptions, "finalAssetWidth");
  v8 = v7;
  -[PHAssetCreationCameraIngestOptions finalAssetHeight](self->_cameraIngestOptions, "finalAssetHeight");
  v10 = v8 != 0.0;
  v11 = v9 != 0.0;
  if (v10 && v11)
    v12 = v9;
  else
    v12 = v6;
  if (!v10 || !v11)
    v8 = v5;
  if (v5 == v8 && v6 == v12)
  {
    v12 = 0.0;
    v8 = 0.0;
    if (objc_msgSend(v4, "originalWidth") >= 1)
      v8 = (double)(unint64_t)objc_msgSend(v4, "originalWidth");
    if (objc_msgSend(v4, "originalHeight") >= 1)
      v12 = (double)(unint64_t)objc_msgSend(v4, "originalHeight");
  }
  v14 = objc_msgSend(v4, "orientation");
  if (v4)
    objc_msgSend(v4, "photoIrisVideoDuration");
  else
    memset(&time, 0, sizeof(time));
  objc_msgSend(MEMORY[0x1E0D71978], "exportPropertiesWithImageWidth:imageHeight:exifOrientation:duration:", (unint64_t)v8, (unint64_t)v12, v14, CMTimeGetSeconds(&time));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetCreationCameraIngestOptions cameraMetadataPath](self->_cameraIngestOptions, "cameraMetadataPath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = objc_alloc(MEMORY[0x1E0D717D0]);
    -[PHAssetCreationCameraIngestOptions cameraMetadataPath](self->_cameraIngestOptions, "cameraMetadataPath");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v17, "initWithCameraMetadataPath:", v18);

    objc_msgSend(v16, "deserializeCameraMetadata");
  }
  v19 = (void *)MEMORY[0x1E0D717C0];
  -[PHAssetCreationCameraIngestOptions backupAdjustmentsFile](self->_cameraIngestOptions, "backupAdjustmentsFile");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "cameraMetadata");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "assetAdjustmentsFromCameraAdjustmentsFileAtPath:exportProperties:cameraMetadata:", v20, v15, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (void)_setupDerivativeCreationContextForAsset:(id)a3 imageSource:(CGImageSource *)a4 imageData:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  PHAssetCreationDerivativeContext *v14;
  PHAssetCreationDerivativeContext *derivativeContext;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  v34 = a3;
  v8 = a5;
  if (objc_msgSend(v34, "hasAllThumbs"))
  {
    objc_msgSend(v34, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "thumbnailManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "thumbnailIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v34, "effectiveThumbnailIndex");
    objc_msgSend(v34, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deleteThumbnailsWithIdentifier:orIndex:uuid:", v11, v12, v13);

  }
  v14 = objc_alloc_init(PHAssetCreationDerivativeContext);
  derivativeContext = self->_derivativeContext;
  self->_derivativeContext = v14;

  v16 = (void *)MEMORY[0x1E0D71B78];
  objc_msgSend(v34, "photoLibrary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetCreationDerivativeContext setNextAvailableThumbnailIndex:](self->_derivativeContext, "setNextAvailableThumbnailIndex:", objc_msgSend(v16, "nextAvailableThumbnailIndexInLibrary:", v17));

  objc_msgSend(v34, "setEffectiveThumbnailIndex:", -[PHAssetCreationDerivativeContext nextAvailableThumbnailIndex](self->_derivativeContext, "nextAvailableThumbnailIndex"));
  objc_msgSend(v34, "photoLibrary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "thumbnailManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetCreationDerivativeContext setThumbnailManager:](self->_derivativeContext, "setThumbnailManager:", v19);

  objc_msgSend(v34, "thumbnailIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetCreationDerivativeContext setThumbnailIdentifier:](self->_derivativeContext, "setThumbnailIdentifier:", v20);

  objc_msgSend(v34, "fileURLForThumbnailFile");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetCreationDerivativeContext setFileURLForThumbnailFile:](self->_derivativeContext, "setFileURLForThumbnailFile:", v21);

  -[PHAssetResourceBag assetResourceWithType:](self->_assetResourceBag, "assetResourceWithType:", 5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v34, "pathForFullsizeRenderImageFile");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAssetCreationDerivativeContext setFullsizeRenderImagePath:](self->_derivativeContext, "setFullsizeRenderImagePath:", v23);

  }
  -[PHAssetCreationDerivativeContext setAsset:](self->_derivativeContext, "setAsset:", v34);
  objc_msgSend(v34, "uuid");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetCreationDerivativeContext setAssetUUID:](self->_derivativeContext, "setAssetUUID:", v24);

  -[PHAssetCreationDerivativeContext setAssetKind:](self->_derivativeContext, "setAssetKind:", objc_msgSend(v34, "kind"));
  objc_msgSend(v34, "pathForOriginalFile");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "pathExtension");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "uppercaseString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetCreationDerivativeContext setAssetExtension:](self->_derivativeContext, "setAssetExtension:", v27);

  objc_msgSend(v34, "originalUniformTypeIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetCreationDerivativeContext setOriginalUTI:](self->_derivativeContext, "setOriginalUTI:", v28);

  -[PHAssetCreationDerivativeContext setAssetOrientation:](self->_derivativeContext, "setAssetOrientation:", (int)objc_msgSend(v34, "orientation"));
  objc_msgSend(v34, "imageSize");
  -[PHAssetCreationDerivativeContext setAssetOrientedImageSize:](self->_derivativeContext, "setAssetOrientedImageSize:");
  -[PHAssetCreationDerivativeContext setEmbeddedThumbnailSize:](self->_derivativeContext, "setEmbeddedThumbnailSize:", (double)(int)objc_msgSend(v34, "embeddedThumbnailWidth"), (double)(int)objc_msgSend(v34, "embeddedThumbnailHeight"));
  -[PHAssetCreationDerivativeContext setImageData:](self->_derivativeContext, "setImageData:", v8);

  objc_msgSend(v34, "pathForOriginalFile");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetCreationDerivativeContext setPathForOriginalFile:](self->_derivativeContext, "setPathForOriginalFile:", v29);

  objc_msgSend(v34, "pathForVideoPreviewFile");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetCreationDerivativeContext setPathForVideoPreviewFile:](self->_derivativeContext, "setPathForVideoPreviewFile:", v30);

  -[PHAssetResourceBag assetResourceWithType:](self->_assetResourceBag, "assetResourceWithType:", 6);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(v34, "pathForFullsizeRenderVideoFile");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAssetCreationDerivativeContext setFullsizeRenderVideoPath:](self->_derivativeContext, "setFullsizeRenderVideoPath:", v32);

  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0D75130], "auxiliaryImageRecordsToPreserveForDerivativesFromPrimaryImageInImageSource:", a4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAssetCreationDerivativeContext setAuxiliaryImageRecords:](self->_derivativeContext, "setAuxiliaryImageRecords:", v33);

  }
}

- (CGImageSource)_imageSourceForDerivatives
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  CGImageSourceRef v16;
  CGImageSource *v17;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[PHAssetCreationDerivativeContext imageData](self->_derivativeContext, "imageData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D752F0];
  -[PHAssetCreationDerivativeContext originalUTI](self->_derivativeContext, "originalUTI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "typeWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHAssetCreationDerivativeContext fullsizeRenderImagePath](self->_derivativeContext, "fullsizeRenderImagePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0C99D50];
    -[PHAssetCreationDerivativeContext fullsizeRenderImagePath](self->_derivativeContext, "fullsizeRenderImagePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v8, "dataWithContentsOfFile:options:error:", v9, 1, &v19);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v19;

    if (v10)
      v12 = 1;
    else
      v12 = v11 == 0;
    if (!v12)
    {
      PLPhotoKitGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        -[PHAssetCreationDerivativeContext fullsizeRenderImagePath](self->_derivativeContext, "fullsizeRenderImagePath");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v21 = v14;
        v22 = 2112;
        v23 = v11;
        _os_log_impl(&dword_1991EC000, v13, OS_LOG_TYPE_ERROR, "Failed to read data from %@ (%@)", buf, 0x16u);

      }
    }

    v3 = (void *)v10;
  }
  else if (objc_msgSend(v6, "conformsToType:", *MEMORY[0x1E0CEC5B8]))
  {
    +[PHAssetCreationRequest _jpegDataFromRAWData:derivativeContext:](PHAssetCreationRequest, "_jpegDataFromRAWData:derivativeContext:", v3, self->_derivativeContext);
    v15 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v15;
  }
  if (v3 && objc_msgSend(v3, "length"))
  {
    v16 = CGImageSourceCreateWithData((CFDataRef)v3, 0);
    v17 = v16;
    if (v16)
      CFAutorelease(v16);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)performConcurrentWork
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  unint64_t v7;
  int v8;
  CGImageSource *v9;
  size_t PrimaryImageIndex;
  size_t v11;
  void *v12;
  __CFData *v13;
  void *v14;
  __CFString *v15;
  CGImageDestination *v16;
  _BOOL4 v17;
  __CFData *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  int64_t v37;
  __CFData *v38;
  void *v39;
  NSObject *v40;
  unint64_t v41;
  os_signpost_id_t v42;
  uint8_t buf[4];
  const char *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  PLBackendGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, self);
  v5 = v3;
  v6 = v5;
  v7 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "Ingest-ConcurrentWork", "START: concurrent work", buf, 2u);
  }

  v8 = -[PHAssetCreationDerivativeContext assetKind](self->_derivativeContext, "assetKind");
  if (v8 == 1)
  {
    v41 = v4 - 1;
    v42 = v4;
    -[PHAssetCreationDerivativeContext pathForOriginalFile](self->_derivativeContext, "pathForOriginalFile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAssetCreationDerivativeContext fullsizeRenderVideoPath](self->_derivativeContext, "fullsizeRenderVideoPath");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[PHAssetCreationDerivativeContext fullsizeRenderVideoPath](self->_derivativeContext, "fullsizeRenderVideoPath");
      v21 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v21;
    }
    PLPreviewImageAndDurationForVideoAtPath();
    v9 = (CGImageSource *)0;
    v22 = 0;
    v19 = 0;
    v18 = 0;
    goto LABEL_18;
  }
  if (v8)
  {
    v9 = 0;
    goto LABEL_13;
  }
  v9 = -[PHAssetCreationRequest _imageSourceForDerivatives](self, "_imageSourceForDerivatives");
  PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(v9);
  if (!v9)
  {
LABEL_13:
    v22 = 0;
    v18 = 0;
    v19 = 0;
    goto LABEL_23;
  }
  v11 = PrimaryImageIndex;
  v41 = v4 - 1;
  v42 = v4;
  -[PHAssetCreationDerivativeContext setImageData:](self->_derivativeContext, "setImageData:", 0);
  +[PHAssetCreationRequest _imageIOThumbnailCreationOptionsFromDerivativeContext:](PHAssetCreationRequest, "_imageIOThumbnailCreationOptionsFromDerivativeContext:", self->_derivativeContext);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (__CFData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v14 = (void *)*MEMORY[0x1E0CEC530];
  objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v16 = CGImageDestinationCreateWithData(v13, v15, 1uLL, 0);

  CGImageDestinationAddImageFromSource(v16, v9, v11, (CFDictionaryRef)v12);
  v17 = CGImageDestinationFinalize(v16);
  CFRelease(v16);
  if (v17)
  {
    v18 = v13;
    objc_msgSend(v14, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (CGImageSource *)DCIM_newPLImageWithData();
  }
  else
  {
    PLPhotoKitGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v44 = "-[PHAssetCreationRequest performConcurrentWork]";
      _os_log_impl(&dword_1991EC000, v23, OS_LOG_TYPE_ERROR, "%s failed to write preview image", buf, 0xCu);
    }

    v19 = 0;
    v18 = 0;
    v9 = 0;
  }

  v22 = 0;
LABEL_18:

  if (v9)
  {
    v40 = v6;
    v37 = -[PHAssetCreationDerivativeContext nextAvailableThumbnailIndex](self->_derivativeContext, "nextAvailableThumbnailIndex");
    v24 = objc_alloc(MEMORY[0x1E0D717A8]);
    -[PHAssetCreationDerivativeContext auxiliaryImageRecords](self->_derivativeContext, "auxiliaryImageRecords");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v18;
    v39 = v19;
    v26 = (void *)objc_msgSend(v24, "initWithPLImage:backingData:uniformTypeIdentifier:auxiliaryImageRecords:", v9, v18, v19, v25);

    -[PHAssetCreationDerivativeContext thumbnailManager](self->_derivativeContext, "thumbnailManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAssetCreationDerivativeContext thumbnailIdentifier](self->_derivativeContext, "thumbnailIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAssetCreationDerivativeContext assetUUID](self->_derivativeContext, "assetUUID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v22;
    v31 = -[PHAssetCreationDerivativeContext assetKind](self->_derivativeContext, "assetKind");
    -[PHAssetCreationDerivativeContext assetExtension](self->_derivativeContext, "assetExtension");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v31;
    v22 = v30;
    -[PHAssetCreationDerivativeContext setThumbnailWriteSucceeded:](self->_derivativeContext, "setThumbnailWriteSucceeded:", objc_msgSend(v27, "setThumbnailsForThumbIdentifier:thumbnailIndex:assetUUID:kind:extension:withImage:", v28, v37, v29, v33, v32, v26));

    if (-[PHAssetCreationDerivativeContext assetKind](self->_derivativeContext, "assetKind") == 1)
    {
      -[PHAssetCreationDerivativeContext pathForVideoPreviewFile](self->_derivativeContext, "pathForVideoPreviewFile");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      PLWriteImageWithEmbeddedThumbnailToPath();

    }
    v7 = v41;
    v4 = v42;
    v19 = v39;
    v6 = v40;
    v18 = v38;
  }
  else
  {
    v7 = v41;
    v4 = v42;
  }
LABEL_23:
  v35 = v6;
  v36 = v35;
  if (v7 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v36, OS_SIGNPOST_INTERVAL_END, v4, "Ingest-ConcurrentWork", "END: concurrent work", buf, 2u);
  }

}

- (void)finalizeRequestWithBatchSuccess:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  PHAssetCreationDerivativeContext *derivativeContext;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  int v31;
  const char *v32;
  uint64_t v33;

  v3 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, self);
  v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v31) = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "Ingest-FinalizeRequest", "START: finalize thumbnails", (uint8_t *)&v31, 2u);
  }

  if (!v3)
  {
    PLPhotoKitGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v31 = 136315138;
      v32 = "-[PHAssetCreationRequest finalizeRequestWithBatchSuccess:]";
      _os_log_impl(&dword_1991EC000, v23, OS_LOG_TYPE_ERROR, "%s: Creation request failed. Clean up installed files", (uint8_t *)&v31, 0xCu);
    }
    goto LABEL_17;
  }
  derivativeContext = self->_derivativeContext;
  if (derivativeContext)
  {
    if (!-[PHAssetCreationDerivativeContext thumbnailWriteSucceeded](derivativeContext, "thumbnailWriteSucceeded"))
    {
      v10 = objc_alloc(MEMORY[0x1E0CB36B8]);
      -[PHAssetCreationDerivativeContext asset](self->_derivativeContext, "asset");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithIndex:", objc_msgSend(v11, "effectiveThumbnailIndex"));

      v13 = (void *)MEMORY[0x1E0D71B78];
      -[PHAssetCreationDerivativeContext asset](self->_derivativeContext, "asset");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "photoLibrary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "recycleThumbnailIndexes:inLibrary:", v12, v15);

      -[PHAssetCreationDerivativeContext asset](self->_derivativeContext, "asset");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setEffectiveThumbnailIndex:", 0x7FFFFFFFFFFFFFFFLL);

    }
    if (-[PHAssetCreationDerivativeContext assetKind](self->_derivativeContext, "assetKind") == 1)
    {
      v17 = (void *)MEMORY[0x1E0D71A70];
      objc_msgSend(MEMORY[0x1E0D71A80], "recipeFromID:", 65741);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAssetCreationDerivativeContext asset](self->_derivativeContext, "asset");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "hasAdjustments"))
        v20 = 2;
      else
        v20 = 0;
      -[PHAssetCreationDerivativeContext asset](self->_derivativeContext, "asset");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (id)objc_msgSend(v17, "onDemand_installPrimaryImageResourceWithRecipe:version:forAsset:", v18, v20, v21);

    }
    -[PHAssetCreationDerivativeContext originalHash](self->_derivativeContext, "originalHash");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      -[PHAssetCreationDerivativeContext asset](self->_derivativeContext, "asset");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "additionalAttributes");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setOriginalHash:", v23);

      -[PHAssetCreationDerivativeContext asset](self->_derivativeContext, "asset");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "additionalAttributes");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject base64EncodedStringWithOptions:](v23, "base64EncodedStringWithOptions:", 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setOriginalStableHash:", v28);

    }
LABEL_17:

  }
  v29 = v8;
  v30 = v29;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    LOWORD(v31) = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v30, OS_SIGNPOST_INTERVAL_END, v6, "Ingest-FinalizeRequest", "END: finalize thumbnails", (uint8_t *)&v31, 2u);
  }

}

- (id)createAssetFromValidatedResources:(id)a3 withUUID:(id)a4 assetAlreadyExistsAsPlaceholder:(BOOL)a5 inPhotoLibrary:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t *v29;
  BOOL v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  objc_msgSend(v15, "libraryServicesManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetCreationRequest.m"), 2929, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("libraryServicesManager"));

  }
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__13099;
  v41 = __Block_byref_object_dispose__13100;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__13099;
  v35 = __Block_byref_object_dispose__13100;
  v36 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __122__PHAssetCreationRequest_createAssetFromValidatedResources_withUUID_assetAlreadyExistsAsPlaceholder_inPhotoLibrary_error___block_invoke;
  v24[3] = &unk_1E35D8C08;
  v28 = &v37;
  v24[4] = self;
  v17 = v13;
  v25 = v17;
  v18 = v14;
  v26 = v18;
  v30 = a5;
  v19 = v15;
  v27 = v19;
  v29 = &v31;
  objc_msgSend(v16, "performBlockWithImportMutex:", v24);
  if (a7)
  {
    v20 = (void *)v32[5];
    if (v20)
      *a7 = objc_retainAutorelease(v20);
  }
  v21 = (id)v38[5];

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v21;
}

- (void)_setCreatingAssetIsBusy:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  PLIndicatorFileCoordinator *fileCoordinator;
  PLIndicatorFileCoordinator *v7;
  PLIndicatorFileCoordinator *v8;
  NSObject *v9;
  uint8_t v10[16];

  v3 = a3;
  -[PHAssetCreationRequest _resolveResourceHoldingDirectoryPath](self, "_resolveResourceHoldingDirectoryPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    fileCoordinator = self->_fileCoordinator;
    if (!fileCoordinator)
    {
      v7 = (PLIndicatorFileCoordinator *)objc_msgSend(objc_alloc(MEMORY[0x1E0D717C8]), "initWithResourceHoldingDirectoryPath:", self->_resourceHoldingDirectoryPath);
      v8 = self->_fileCoordinator;
      self->_fileCoordinator = v7;

      fileCoordinator = self->_fileCoordinator;
    }
    -[PLIndicatorFileCoordinator setCreatingAssetIsBusy:](fileCoordinator, "setCreatingAssetIsBusy:", v3);
  }
  else
  {
    PLPhotoKitGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_FAULT, "[AssetCreationRecovery] Could not resolve resource holding directory path and unable to write out indicator file", v10, 2u);
    }

  }
}

- (void)didSendChangeToServiceHandlerWithResult:(BOOL)a3
{
  NSObject *v4;
  uint8_t v5[16];

  if (self->_fileCoordinator)
  {
    PLPhotoKitGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1991EC000, v4, OS_LOG_TYPE_DEBUG, "[AssetCreationRecovery] Closing asset creation indicator file", v5, 2u);
    }

    -[PLIndicatorFileCoordinator setCreatingAssetIsBusy:](self->_fileCoordinator, "setCreatingAssetIsBusy:", 0);
  }
}

- (BOOL)_unTrashAndResetAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "metadataFromMediaPropertiesOrOriginalResource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "unTrash");
    objc_msgSend(v4, "revertToOriginal");
    -[PHAssetCreationRequest importSessionID](self, "importSessionID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setImportSessionAlbumWithImportSessionID:", v6);

    objc_msgSend(v4, "setDateCreated:", 0);
    objc_msgSend(v4, "additionalAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTimeZoneName:", 0);

    objc_msgSend(v4, "additionalAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTimeZoneOffset:", 0);

    objc_msgSend(v4, "setTitle:", 0);
    objc_msgSend(v4, "setLongDescription:", 0);
    objc_msgSend(v4, "setLocation:", 0);
    objc_msgSend(v4, "additionalAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setKeywords:", 0);

    objc_msgSend(v4, "filename");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "directory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "additionalAttributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "originalFilename");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setAttributesFromMainFileURL:mainFileMetadata:savedAssetType:bundleScope:isPlaceholder:placeholderFileURL:imageSource:imageData:", 0, v5, objc_msgSend(v4, "savedAssetType"), objc_msgSend(v4, "bundleScope"), 0, 0, 0, 0);
    objc_msgSend(v4, "setFilename:", v10);
    objc_msgSend(v4, "setDirectory:", v11);
    objc_msgSend(v4, "additionalAttributes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setOriginalFilename:", v13);

  }
  else
  {
    PLSyndicationGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAssetCreationRequest syndicationIdentifier](self, "syndicationIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v20 = v16;
      v21 = 2112;
      v22 = v17;
      _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_ERROR, "Found existing trashed asset (%@) with same syndication id (%@), but it is missing both media metadata and original", buf, 0x16u);

    }
    objc_msgSend(v4, "expunge");
  }

  return v5 != 0;
}

- (id)_createAssetFromValidatedResources:(id)a3 withUUID:(id)a4 assetAlreadyExistsAsPlaceholder:(BOOL)a5 inPhotoLibrary:(id)a6 error:(id *)a7
{
  _BOOL4 v9;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  NSString *v44;
  NSString *forcePairingIdentifier;
  NSObject *v46;
  NSString *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  os_signpost_id_t v52;
  os_signpost_id_t v53;
  void *v54;
  void *v55;
  int v56;
  NSObject *v57;
  NSObject *v58;
  unint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  _BOOL4 v64;
  void *v65;
  char v66;
  id v67;
  void *v68;
  _BOOL4 v69;
  uint64_t v70;
  void *v71;
  BOOL v72;
  void *v73;
  id v74;
  _BOOL4 v75;
  _BOOL4 v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  _BOOL4 v86;
  void *v87;
  id v88;
  uint64_t v89;
  void *v90;
  char v91;
  id v92;
  NSObject *v93;
  void *v94;
  void *v95;
  id v96;
  NSObject *v97;
  NSObject *v98;
  uint64_t v99;
  NSObject *v100;
  NSObject *v101;
  void *v102;
  id v103;
  void *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  id v110;
  void *v111;
  _BOOL4 v112;
  id v113;
  void *v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  void *v118;
  char v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  uint64_t v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  double v134;
  double v135;
  double v136;
  double v137;
  uint64_t v138;
  void *v139;
  int v140;
  void *v141;
  uint64_t v142;
  int v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  id v148;
  id v149;
  id v150;
  void *v151;
  uint64_t v152;
  void *v153;
  char v154;
  NSObject *v155;
  id v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  uint64_t v164;
  void *v165;
  uint64_t v166;
  void *v167;
  void *v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  void *v172;
  __int16 v173;
  void *v174;
  uint64_t v175;
  void *v176;
  void *v177;
  __int16 v178;
  void *v179;
  void *v180;
  int v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  NSString *importedByBundleIdentifier;
  void *v195;
  NSString *v196;
  NSString *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t *v201;
  uint64_t v202;
  void *v203;
  uint64_t v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  int v210;
  int v211;
  uint64_t v212;
  void *v213;
  void *v214;
  NSObject *v215;
  id v216;
  void *v217;
  BOOL v218;
  void *v219;
  void *v220;
  id v221;
  void *v222;
  _BOOL4 v223;
  id v224;
  void *v225;
  id v226;
  void *v227;
  uint64_t v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  uint64_t v233;
  void *v234;
  void *v235;
  void *v236;
  NSObject *v237;
  void *v238;
  void *v239;
  id v240;
  void *v241;
  void *v242;
  NSObject *v243;
  void *v244;
  void *v245;
  void *v246;
  uint64_t v247;
  char v248;
  _BOOL4 v249;
  void *v250;
  NSObject *v251;
  uint64_t v252;
  void *v253;
  const __CFString *v254;
  void *v255;
  __CFString *v256;
  void *v257;
  char v258;
  NSObject *v259;
  id v260;
  int v261;
  BOOL v262;
  void *v263;
  void *v264;
  void *v265;
  uint64_t v266;
  void *v267;
  void *v268;
  id v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  uint64_t v274;
  void *v275;
  void *v276;
  void *v277;
  id v278;
  NSObject *v279;
  id v280;
  id v281;
  void *v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t i;
  void *v287;
  void *v288;
  void *v289;
  uint64_t v290;
  void *v291;
  void *v292;
  int v293;
  void *v294;
  void *v295;
  NSObject *v296;
  id *v297;
  _BOOL4 v298;
  NSObject *v299;
  id v300;
  id v301;
  NSObject *v302;
  NSObject *v303;
  void *v304;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  void *v311;
  void *v312;
  NSString *resourceHoldingDirectoryPath;
  char v314;
  id v315;
  NSObject *v316;
  void *v317;
  void *v318;
  int v319;
  void *v321;
  void *v322;
  void *v323;
  uint64_t v324;
  void *v325;
  void *v326;
  uint64_t v327;
  id v328;
  id v329;
  void *v330;
  id v331;
  id v332;
  unsigned int v333;
  id v334;
  void *v335;
  id v336;
  int v337;
  int v338;
  NSString *v339;
  int v340;
  uint64_t v341;
  void *v342;
  SEL v343;
  int v344;
  id v345;
  _BOOL4 v346;
  NSObject *v347;
  int v348;
  NSString *v349;
  id *v350;
  void *v351;
  os_signpost_id_t spid;
  uint64_t v353;
  id v354;
  unsigned int v355;
  id v356;
  void *v357;
  id v358;
  void *v359;
  id v360;
  void *v361;
  uint64_t v362;
  NSObject *v363;
  id v364;
  void *v365;
  void *v366;
  int v367;
  _BOOL4 v368;
  void *v369;
  void *v370;
  void *v371;
  void *v372;
  void *v373;
  id v374;
  __int128 v375;
  __int128 v376;
  __int128 v377;
  __int128 v378;
  id v379;
  id v380;
  id v381;
  id v382;
  id v383;
  id v384;
  id v385;
  id v386;
  id v387;
  id v388;
  id v389;
  _OWORD v390[2];
  id v391;
  id v392;
  id v393;
  id v394;
  id v395;
  id v396;
  id v397;
  id v398;
  id v399;
  id v400;
  id v401;
  uint64_t v402;
  __int128 v403;
  _BYTE v404[128];
  _QWORD v405[5];
  _QWORD v406[5];
  void *v407;
  uint8_t buf[40];
  uint64_t v409;

  v9 = a5;
  v409 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a6;
  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v321 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v322 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v321, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetCreationRequest.m"), 3020, CFSTR("%@ can only be called from assetsd"), v322);

  }
  -[PHAssetCreationRequest syndicationIdentifier](self, "syndicationIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
LABEL_18:
    v368 = v9;
    v343 = a2;
    v350 = a7;
    v358 = v13;
    v27 = v13;
    v362 = objc_msgSend(v27, "mediaType");
    v353 = objc_msgSend(v27, "mediaSubtype");
    objc_msgSend(v27, "primaryResource");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHChangeRequest helper](self, "helper");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "clientAuthorization");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v367 = objc_msgSend(v30, "isCameraClient");

    -[PHChangeRequest helper](self, "helper");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "clientAuthorization");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "trustedCallerBundleID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v337 = objc_msgSend(v33, "isEqualToString:", CFSTR("com.apple.nebulad"));

    v403 = xmmword_19944AD40;
    -[PHAssetCreationCameraIngestOptions cameraMetadataPath](self->_cameraIngestOptions, "cameraMetadataPath");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v35 = objc_alloc(MEMORY[0x1E0D717D0]);
      -[PHAssetCreationCameraIngestOptions cameraMetadataPath](self->_cameraIngestOptions, "cameraMetadataPath");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)objc_msgSend(v35, "initWithCameraMetadataPath:", v36);

      objc_msgSend(v37, "deserializeCameraMetadata");
      v38 = (void *)MEMORY[0x1E0D75260];
      v365 = v37;
      objc_msgSend(v37, "cameraMetadata");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v403 = objc_msgSend(v38, "semanticEnhanceSceneForCameraMetadata:", v39);
      *((_QWORD *)&v403 + 1) = v40;

      v348 = objc_msgSend(MEMORY[0x1E0D717C0], "semanticEnhanceSceneIsValid:", (_QWORD)v403);
    }
    else
    {
      v348 = 0;
      v365 = 0;
    }
    objc_msgSend(v27, "validatedDataForAssetResource:", v28);
    v359 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "validatedURLForAssetResource:", v28);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "creationOptions");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v373 = v41;
    objc_msgSend(v42, "ensureOptionsAreCompleteForURL:", v41);

    objc_msgSend(v28, "creationOptions");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "forcePairingIdentifier");
    v44 = (NSString *)objc_claimAutoreleasedReturnValue();
    forcePairingIdentifier = self->_forcePairingIdentifier;
    self->_forcePairingIdentifier = v44;

    if (self->_forcePairingIdentifier)
    {
      PLPhotoKitGetLog();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        v47 = self->_forcePairingIdentifier;
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v47;
        _os_log_impl(&dword_1991EC000, v46, OS_LOG_TYPE_DEFAULT, "forcing pairing identifier %@", buf, 0xCu);
      }

    }
    v48 = (void *)MEMORY[0x1E0D752F0];
    objc_msgSend(v41, "pathExtension");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "typeWithFilenameExtension:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    v357 = v50;
    if (objc_msgSend(v50, "conformsToType:", *MEMORY[0x1E0CEC570])
      && self->_duplicateAssetPhotoLibraryType != 1)
    {
      if (v350)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3300, CFSTR("Importing PDF types is not supported."));
        v71 = 0;
        v369 = 0;
        v67 = 0;
        v20 = 0;
        v26 = 0;
        *v350 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v71 = 0;
        v369 = 0;
        v67 = 0;
        v20 = 0;
        v26 = 0;
      }
LABEL_381:

      v13 = v358;
      goto LABEL_382;
    }
    v402 = 0;
    v340 = MEMORY[0x19AEBDEDC]();
    PLBackendGetLog();
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = os_signpost_id_make_with_pointer(v51, self);
    v354 = v14;
    v366 = v27;
    v372 = v28;
    v351 = v15;
    spid = v52;
    v347 = v51;
    if (!v28)
    {
      -[PHAssetCreationCameraIngestOptions jobType](self->_cameraIngestOptions, "jobType");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v65, "isEqualToString:", *MEMORY[0x1E0D74E28]);

      if ((v66 & 1) == 0)
      {
        v67 = 0;
        v369 = 0;
        v370 = 0;
        LOBYTE(v344) = 0;
        v338 = 0;
        v360 = 0;
        v356 = 0;
        v74 = 0;
        v75 = 0;
        v346 = v362 == 1;
        v76 = v353 == 8;
        goto LABEL_237;
      }
      -[PHAssetCreationRequest _createTimelapsePlaceholderAssetWithUUID:InPhotoLibrary:](self, "_createTimelapsePlaceholderAssetWithUUID:InPhotoLibrary:", v14, v15);
      v67 = (id)objc_claimAutoreleasedReturnValue();
      v369 = 0;
      v370 = 0;
      v356 = 0;
      v360 = 0;
      v338 = 0;
      LOBYTE(v344) = 0;
      v68 = 0;
      v69 = v67 != 0;
      v70 = v362;
LABEL_221:
      v346 = v70 == 1;
      v76 = v353 == 8;
      if (v69 && v70 == 1 && v353 == 8)
      {
        v389 = v68;
        v217 = v68;
        v218 = -[PHAssetCreationRequest _createAssetAsPhotoIris:fromValidatedResources:mainFileMetadata:error:](self, "_createAssetAsPhotoIris:fromValidatedResources:mainFileMetadata:error:", v67, v27, v370, &v389);
        v74 = v389;

        if (v218)
        {
          v68 = v74;
LABEL_227:
          v15 = v351;
          if (-[PHAssetCreationRequest _shouldCreateScreenshot](self, "_shouldCreateScreenshot")
            && objc_msgSend(v67, "kindSubtype") != 10)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", CFSTR("Unable to create screenshot asset from available resources"));
            v74 = (id)objc_claimAutoreleasedReturnValue();

            v75 = 0;
          }
          else
          {
            if (objc_msgSend(v27, "hasSpatialOverCapture"))
            {
              v388 = v68;
              v219 = v68;
              v75 = -[PHAssetCreationRequest _createSocResourceForAsset:fromValidatedResources:photoLibrary:error:](self, "_createSocResourceForAsset:fromValidatedResources:photoLibrary:error:", v67, v27, v351, &v388);
              v74 = v388;

              if (!v75)
                goto LABEL_237;
              v68 = v74;
            }
            v387 = v68;
            v220 = v68;
            v75 = -[PHAssetCreationRequest _createXmpResourceForAsset:fromValidatedResources:photoLibrary:error:](self, "_createXmpResourceForAsset:fromValidatedResources:photoLibrary:error:", v67, v27, v351, &v387);
            v74 = v387;

            if (v75)
            {
              v386 = v74;
              v75 = -[PHAssetCreationRequest _createAudioResourceForAsset:fromValidatedResources:photoLibrary:error:](self, "_createAudioResourceForAsset:fromValidatedResources:photoLibrary:error:", v67, v27, v351, &v386);
              v221 = v386;

              v74 = v221;
            }
          }
LABEL_237:
          if (-[PHAssetCreationCameraIngestOptions candidateOptions](self->_cameraIngestOptions, "candidateOptions"))
          {
            objc_msgSend(v67, "additionalAttributes");
            v222 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v222, "setDeferredProcessingCandidateOptions:", -[PHAssetCreationCameraIngestOptions candidateOptions](self->_cameraIngestOptions, "candidateOptions"));

          }
          if (!v75)
          {
LABEL_265:
            -[PHAssetCreationCameraIngestOptions portraitEffectFilterName](self->_cameraIngestOptions, "portraitEffectFilterName");
            v244 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v244)
              goto LABEL_271;
            -[PHAssetCreationCameraIngestOptions portraitEffectFilterName](self->_cameraIngestOptions, "portraitEffectFilterName");
            v245 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v245, "isEqualToString:", CFSTR("CIPortraitEffectStageWhite")) & 1) == 0)
            {
              -[PHAssetCreationCameraIngestOptions portraitEffectFilterName](self->_cameraIngestOptions, "portraitEffectFilterName");
              v246 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v246, "isEqualToString:", CFSTR("CIPortraitEffectStageMonoV2")))
              {
                -[PHAssetCreationCameraIngestOptions portraitEffectFilterName](self->_cameraIngestOptions, "portraitEffectFilterName");
                v257 = (void *)objc_claimAutoreleasedReturnValue();
                v258 = objc_msgSend(v257, "isEqualToString:", CFSTR("CIPortraitEffectStageV2"));

                v28 = v372;
                if ((v258 & 1) == 0)
                {
LABEL_271:
                  if (v75)
                  {
                    v247 = objc_msgSend(v28, "type");
                    v248 = v344 ^ 1;
                    if (v247 != 19)
                      v248 = 1;
                    if ((v248 & 1) != 0)
                    {
                      v364 = v360;
                      v20 = v74;
                      v27 = v366;
LABEL_280:
                      -[PHAssetCreationCameraIngestOptions jobType](self->_cameraIngestOptions, "jobType");
                      v250 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v250)
                      {
                        PLPhotoKitIngestGetLog();
                        v251 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v251, OS_LOG_TYPE_DEFAULT))
                        {
                          -[PHAssetCreationCameraIngestOptions captureID](self->_cameraIngestOptions, "captureID");
                          v252 = objc_claimAutoreleasedReturnValue();
                          v253 = (void *)v252;
                          if (v252)
                            v254 = (const __CFString *)v252;
                          else
                            v254 = CFSTR("(unknown capture ID)");
                          objc_msgSend(v364, "lastPathComponent");
                          v255 = (void *)objc_claimAutoreleasedReturnValue();
                          if (v255)
                          {
                            objc_msgSend(v364, "lastPathComponent");
                            v256 = (__CFString *)objc_claimAutoreleasedReturnValue();
                          }
                          else
                          {
                            v256 = &stru_1E35DFFF8;
                          }
                          objc_msgSend(v67, "uuid");
                          v263 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138543874;
                          *(_QWORD *)&buf[4] = v254;
                          *(_WORD *)&buf[12] = 2114;
                          *(_QWORD *)&buf[14] = v256;
                          *(_WORD *)&buf[22] = 2114;
                          *(_QWORD *)&buf[24] = v263;
                          _os_log_impl(&dword_1991EC000, v251, OS_LOG_TYPE_DEFAULT, "PhotoKit Camera Ingest: %{public}@ Created asset %{public}@ with UUID %{public}@", buf, 0x20u);

                          if (v255)
                          v15 = v351;
                          v27 = v366;
                        }

                      }
                      if (((v338 | v348) & ~objc_msgSend(v27, "hasCurrentAdjustment") & v367) == 1)
                      {
                        -[PHAssetCreationCameraIngestOptions previewImageData](self->_cameraIngestOptions, "previewImageData");
                        v264 = (void *)objc_claimAutoreleasedReturnValue();
                        DCIM_newPLImageWithStoredJPEGData();
                        v265 = (void *)objc_claimAutoreleasedReturnValue();

                        v266 = v402;
                        objc_msgSend(v15, "libraryBundle");
                        v267 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v267, "timeZoneLookup");
                        v268 = (void *)objc_claimAutoreleasedReturnValue();
                        -[PHAssetCreationRequest _checkAndGenerateThumbnailsForAsset:imageSource:imageData:previewImage:thumbnailImage:timeZoneLookup:resourceBag:](self, "_checkAndGenerateThumbnailsForAsset:imageSource:imageData:previewImage:thumbnailImage:timeZoneLookup:resourceBag:", v67, v266, v356, v265, 0, v268, v27);

                      }
                      if (v346 && objc_msgSend(v27, "hasRAW"))
                      {
                        v381 = v20;
                        v261 = -[PHAssetCreationRequest _createRAWSidecarForAsset:fromValidatedResources:mainFileMetadata:photoLibrary:error:](self, "_createRAWSidecarForAsset:fromValidatedResources:mainFileMetadata:photoLibrary:error:", v67, v27, v370, v15, &v381);
                        v269 = v381;

                        v20 = v269;
                      }
                      else
                      {
                        v261 = 1;
                      }
                      if (v261)
                      {
                        if (v365)
                        {
                          objc_msgSend(v365, "applyCameraMetadataToAsset:", v67);
                          if (v340)
                          {
                            v270 = (void *)MEMORY[0x1E0D71880];
                            objc_msgSend(v67, "filename");
                            v271 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v270, "diagnosticFilePathForLibrary:mainFilename:createIfNeeded:", v15, v271, 1);
                            v272 = (void *)objc_claimAutoreleasedReturnValue();

                            objc_msgSend(v272, "stringByDeletingPathExtension");
                            v273 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v273, "stringByAppendingPathExtension:", *MEMORY[0x1E0D74A68]);
                            v274 = objc_claimAutoreleasedReturnValue();

                            objc_msgSend(MEMORY[0x1E0D73208], "fileManager");
                            v275 = (void *)objc_claimAutoreleasedReturnValue();
                            -[PHAssetCreationRequest cameraIngestOptions](self, "cameraIngestOptions");
                            v276 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v276, "cameraMetadataPath");
                            v277 = (void *)objc_claimAutoreleasedReturnValue();
                            v380 = 0;
                            v361 = (void *)v274;
                            LOBYTE(v274) = objc_msgSend(v275, "copyItemAtPath:toPath:error:", v277, v274, &v380);
                            v278 = v380;

                            if ((v274 & 1) == 0)
                            {
                              PLPhotoKitIngestGetLog();
                              v279 = objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v279, OS_LOG_TYPE_ERROR))
                              {
                                *(_DWORD *)buf = 138412290;
                                *(_QWORD *)&buf[4] = v278;
                                _os_log_impl(&dword_1991EC000, v279, OS_LOG_TYPE_ERROR, "Failed to copy MDATA file to CaptureDebug destination with error: %@", buf, 0xCu);
                              }

                            }
                            v27 = v366;
                          }
                        }
                      }
                      v262 = v67 == 0;
                      if (v67 && ((v261 ^ 1) & 1) == 0)
                      {
                        v280 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                        v379 = v20;
                        v261 = objc_msgSend(MEMORY[0x1E0D71A70], "installInternalResourcesForExistingAsset:assumeNoExistingResources:referencedResourceURLs:error:", v67, 0, v280, &v379);
                        v281 = v379;

                        v20 = v281;
                      }
                      if (v369 && v261)
                      {
                        v377 = 0u;
                        v378 = 0u;
                        v375 = 0u;
                        v376 = 0u;
                        objc_msgSend(v369, "modernResources");
                        v282 = (void *)objc_claimAutoreleasedReturnValue();
                        v283 = objc_msgSend(v282, "countByEnumeratingWithState:objects:count:", &v375, v404, 16);
                        if (v283)
                        {
                          v284 = v283;
                          v285 = *(_QWORD *)v376;
                          do
                          {
                            for (i = 0; i != v284; ++i)
                            {
                              if (*(_QWORD *)v376 != v285)
                                objc_enumerationMutation(v282);
                              v287 = *(void **)(*((_QWORD *)&v375 + 1) + 8 * i);
                              if (objc_msgSend(v287, "supportsTrashedState"))
                                objc_msgSend(v67, "setTrashedState:forResourceType:", objc_msgSend(v287, "trashedState"), objc_msgSend(v287, "cplType"));
                            }
                            v284 = objc_msgSend(v282, "countByEnumeratingWithState:objects:count:", &v375, v404, 16);
                          }
                          while (v284);
                        }

                        if ((objc_msgSend(v369, "cameraProcessingAdjustmentState") & 1) != 0)
                          objc_msgSend(v67, "setCameraProcessingAdjustmentState:", objc_msgSend(v67, "cameraProcessingAdjustmentState") | 1);
                        v15 = v351;
                        if ((objc_msgSend(v369, "cameraProcessingAdjustmentState") & 4) != 0)
                          objc_msgSend(v67, "setCameraProcessingAdjustmentState:", objc_msgSend(v67, "cameraProcessingAdjustmentState") | 4);
                        v27 = v366;
                        if ((objc_msgSend(v369, "cameraProcessingAdjustmentState") & 8) != 0)
                          objc_msgSend(v67, "setCameraProcessingAdjustmentState:", objc_msgSend(v67, "cameraProcessingAdjustmentState") | 8);
                        v261 = 1;
                      }
LABEL_333:
                      objc_msgSend(v67, "setDeferredProcessingNeeded:", objc_msgSend(v67, "expectedDeferredProcessingNeededOnAssetCreation"));
                      if (objc_msgSend(v67, "deferredProcessingNeeded"))
                      {
                        objc_msgSend(v15, "libraryServicesManager");
                        v288 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v288, "backgroundJobService");
                        v289 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v289, "signalBackgroundProcessingNeededOnLibrary:", v15);

                      }
                      if (v261)
                      {
                        if (v367)
                        {
                          -[PHAssetCreationCameraIngestOptions jobType](self->_cameraIngestOptions, "jobType");
                          v290 = objc_claimAutoreleasedReturnValue();
                          if (v290)
                          {
                            v291 = (void *)v290;
                            objc_msgSend(v370, "smartStyleExpectingReversibility");
                            v292 = (void *)objc_claimAutoreleasedReturnValue();
                            v293 = objc_msgSend(v292, "BOOLValue");

                            if (v293)
                              objc_msgSend(v67, "setIsSmartStyleableWithMetadata:", v370);
                          }
                        }
                        -[PHAssetCreationRequest _resetMovedFiles](self, "_resetMovedFiles");
                        -[PHAssetCreationRequest customAssetProperties](self, "customAssetProperties");
                        v294 = (void *)objc_claimAutoreleasedReturnValue();

                        v28 = v372;
                        if (v294)
                        {
                          -[PHAssetCreationRequest customAssetProperties](self, "customAssetProperties");
                          v295 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v67, "updateWithCustomAssetProperties:", v295);

                        }
                        objc_msgSend(v67, "persistMetadataToFilesystem");
                        v296 = v347;
                        if (-[PHChangeRequest shouldPerformConcurrentWork](self, "shouldPerformConcurrentWork"))
                          -[PHAssetCreationRequest _setupDerivativeCreationContextForAsset:imageSource:imageData:](self, "_setupDerivativeCreationContextForAsset:imageSource:imageData:", v67, v402, v356);
                        goto LABEL_357;
                      }
                      v296 = v347;
                      if (v262)
                      {
                        v297 = v350;
                        if (!v350)
                        {
LABEL_356:
                          v28 = v372;
LABEL_357:
                          v302 = v296;
                          v303 = v302;
                          if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v302))
                          {
                            *(_WORD *)buf = 0;
                            _os_signpost_emit_with_name_impl(&dword_1991EC000, v303, OS_SIGNPOST_INTERVAL_END, spid, "Ingest-CreateAsset", "END: asset creation", buf, 2u);
                          }

                          objc_msgSend(v15, "libraryBundle");
                          v304 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v304, "touch");

                          if (v261)
                          {
                            if (-[PHAssetCreationCameraIngestOptions isEligibleForQuickFaceAnalysis](self->_cameraIngestOptions, "isEligibleForQuickFaceAnalysis"))
                            {
                              -[PHAssetCreationCameraIngestOptions deferredPhotoIdentifier](self->_cameraIngestOptions, "deferredPhotoIdentifier");
                              v305 = (void *)objc_claimAutoreleasedReturnValue();

                              objc_msgSend(v15, "libraryBundle");
                              v306 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v306, "constraintsDirector");
                              v307 = (void *)objc_claimAutoreleasedReturnValue();
                              v308 = v307;
                              if (v305)
                                objc_msgSend(v307, "informPhotoCapturedThatNeedsDeferredProcessing");
                              else
                                objc_msgSend(v307, "informPhotoCapturedThatNeedsQuickFace");

                            }
                            objc_msgSend(v67, "additionalAttributes");
                            v310 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v310, "syndicationIdentifier");
                            v311 = (void *)objc_claimAutoreleasedReturnValue();

                            if (v311)
                              objc_msgSend(v67, "syndicatedAssetDidSaveToUserLibrary");
                            if (self->_resourceHoldingDirectoryPath)
                            {
                              objc_msgSend(MEMORY[0x1E0D73208], "fileManager");
                              v312 = (void *)objc_claimAutoreleasedReturnValue();
                              resourceHoldingDirectoryPath = self->_resourceHoldingDirectoryPath;
                              v374 = 0;
                              v314 = objc_msgSend(v312, "removeItemAtPath:error:", resourceHoldingDirectoryPath, &v374);
                              v315 = v374;

                              if ((v314 & 1) == 0)
                              {
                                PLPhotoKitGetLog();
                                v316 = objc_claimAutoreleasedReturnValue();
                                if (os_log_type_enabled(v316, OS_LOG_TYPE_ERROR))
                                {
                                  objc_msgSend(v67, "uuid");
                                  v317 = (void *)objc_claimAutoreleasedReturnValue();
                                  *(_DWORD *)buf = 138412546;
                                  *(_QWORD *)&buf[4] = v317;
                                  *(_WORD *)&buf[12] = 2112;
                                  *(_QWORD *)&buf[14] = v315;
                                  _os_log_impl(&dword_1991EC000, v316, OS_LOG_TYPE_ERROR, "Unable to remove asset creation recovery directory for %@: %@", buf, 0x16u);

                                }
                              }

                            }
                            -[PHAssetCreationCameraIngestOptions jobType](self->_cameraIngestOptions, "jobType");
                            v318 = (void *)objc_claimAutoreleasedReturnValue();
                            if (v318)
                              v319 = v367;
                            else
                              v319 = 0;

                            v309 = v67;
                            if (v319 == 1)
                            {
                              -[PHAssetCreationRequest _removePhotoKitCameraIngestFiles:originalFileURL:resourceBag:](self, "_removePhotoKitCameraIngestFiles:originalFileURL:resourceBag:", v67, v373, v27);
                              v309 = v67;
                            }
                          }
                          else
                          {
                            v309 = 0;
                          }
                          v26 = v309;

                          v14 = v354;
                          v71 = v364;
                          goto LABEL_381;
                        }
                      }
                      else
                      {
                        v298 = -[PHAssetCreationRequest _restoreMovedFilesOnFailure](self, "_restoreMovedFilesOnFailure");
                        if (v372 && v298)
                        {
                          objc_msgSend(MEMORY[0x1E0D71598], "transactionReason:", CFSTR("Unable to create asset from resources"));
                          v299 = objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v67, "deleteWithReason:", v299);
                        }
                        else
                        {
                          PLPhotoKitGetLog();
                          v299 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v299, OS_LOG_TYPE_ERROR))
                          {
                            -[PHAssetCreationRequest _movedFiles](self, "_movedFiles");
                            v300 = (id)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)buf = 138412546;
                            *(_QWORD *)&buf[4] = v67;
                            *(_WORD *)&buf[12] = 2112;
                            *(_QWORD *)&buf[14] = v300;
                            _os_log_impl(&dword_1991EC000, v299, OS_LOG_TYPE_ERROR, "Complete asset ingestion failed, but moved files could not be restored to their original location.  Leaving partially ingested asset %@ with orphaned supporting files %@.", buf, 0x16u);

                          }
                        }
                        v297 = v350;

                        v67 = 0;
                        if (!v350)
                          goto LABEL_356;
                      }
                      if (v20)
                      {
                        *v297 = objc_retainAutorelease(v20);
                      }
                      else
                      {
                        objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", CFSTR("Unable to create asset from resources"));
                        v301 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                        *v297 = v301;

                      }
                      goto LABEL_356;
                    }
                    v382 = v74;
                    v383 = v360;
                    v249 = +[PHAssetCreationRequest setDeferredIdentifierAndCreateDeferredDestinationURLFromCurrentDstURL:withMainFileMetadata:managedAsset:photoLibrary:error:](PHAssetCreationRequest, "setDeferredIdentifierAndCreateDeferredDestinationURLFromCurrentDstURL:withMainFileMetadata:managedAsset:photoLibrary:error:", &v383, v370, v67, v15, &v382);
                    v364 = v383;

                    v20 = v382;
                    v27 = v366;
                    if (v249)
                    {
                      if (objc_msgSend(v370, "isDeferredPhotoProxyExpectingDepth"))
                      {
                        objc_msgSend(v67, "setDepthType:", 1);
                        objc_msgSend(v67, "setEditableDepthBadgeAttribute:", 1);
                      }
                      goto LABEL_280;
                    }
                    PLPhotoKitGetLog();
                    v259 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v259, OS_LOG_TYPE_ERROR))
                    {
                      objc_msgSend(v67, "uuid");
                      v260 = (id)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412290;
                      *(_QWORD *)&buf[4] = v260;
                      _os_log_impl(&dword_1991EC000, v259, OS_LOG_TYPE_ERROR, "Deferred identifier could not be created for asset with UUID: %@", buf, 0xCu);

                    }
                  }
                  else
                  {
                    v364 = v360;
                    v20 = v74;
                    v27 = v366;
                  }
                  v261 = 0;
                  v262 = v67 == 0;
                  goto LABEL_333;
                }
LABEL_270:
                objc_msgSend(v67, "setPlaybackStyle:", 1);
                objc_msgSend(v67, "setVideoCpVisibilityState:", 1);
                goto LABEL_271;
              }

            }
            goto LABEL_270;
          }
          if (objc_msgSend(v27, "hasAdjustments"))
          {
            v223 = v346;
            if (!v369)
              v223 = 0;
            if (v223 && v76)
            {
              objc_msgSend(v67, "setPlaybackStyle:", objc_msgSend(v369, "playbackStyle"));
              objc_msgSend(v67, "setPlaybackVariation:", objc_msgSend(v369, "playbackVariation"));
            }
            v385 = v74;
            v75 = -[PHAssetCreationRequest _createAssetAsAdjusted:fromValidatedResources:mainFileMetadata:error:](self, "_createAssetAsAdjusted:fromValidatedResources:mainFileMetadata:error:", v67, v27, v370, &v385);
            v224 = v385;

            v74 = v224;
            goto LABEL_265;
          }
          if (objc_msgSend(v370, "customRendered") != 9)
          {
            objc_msgSend(v67, "setDefaultAdjustmentsIfNecessaryWithMainFileMetadata:", v370);
LABEL_264:
            v75 = 1;
            goto LABEL_265;
          }
          v384 = 0;
          objc_msgSend(v67, "generatePortraitAdjustment:", &v384);
          v225 = (void *)objc_claimAutoreleasedReturnValue();
          v226 = v384;
          v227 = v226;
          if (v225)
          {
            v336 = v226;
            objc_msgSend(v225, "objectForKeyedSubscript:", *MEMORY[0x1E0D73380]);
            v228 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v225, "objectForKeyedSubscript:", *MEMORY[0x1E0D73388]);
            v229 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v225, "objectForKeyedSubscript:", *MEMORY[0x1E0D73370]);
            v230 = (void *)objc_claimAutoreleasedReturnValue();
            -[PHAssetChangeRequest editorBundleID](self, "editorBundleID");
            v231 = (void *)objc_claimAutoreleasedReturnValue();
            v342 = v225;
            objc_msgSend(v225, "objectForKeyedSubscript:", *MEMORY[0x1E0D73368]);
            v232 = (void *)objc_claimAutoreleasedReturnValue();
            v233 = objc_msgSend(v232, "integerValue");

            v363 = v228;
            v234 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D750B0]), "initWithFormatIdentifier:formatVersion:data:baseVersion:editorBundleID:renderTypes:", v228, v229, v230, v233, v231, 0);
            if (v234)
            {
              objc_msgSend(v67, "dateCreated");
              v235 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v234, "setAdjustmentTimestamp:", v235);

              objc_msgSend(MEMORY[0x1E0D71578], "assetAdjustmentOptionsForPortraitImportWithMainFileMetadata:", v370);
              v236 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "setAdjustments:options:", v234, v236);

              objc_msgSend(v67, "setDeferredProcessingNeeded:", 2);
            }
            else
            {
              PLImportGetLog();
              v243 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v243, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218498;
                *(_QWORD *)&buf[4] = v230;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v228;
                *(_WORD *)&buf[22] = 2112;
                *(_QWORD *)&buf[24] = v229;
                _os_log_impl(&dword_1991EC000, v243, OS_LOG_TYPE_ERROR, "Unable to create adjustment info from adjustment data (%p), format identifier (%@) and format version (%@)", buf, 0x20u);
              }

            }
            v227 = v336;

            v28 = v372;
            v237 = v363;
            v225 = v342;
          }
          else
          {
            if (!v226)
            {
LABEL_263:

              goto LABEL_264;
            }
            PLImportGetLog();
            v237 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v237, OS_LOG_TYPE_ERROR))
            {
              v238 = (void *)MEMORY[0x1E0D731F0];
              objc_msgSend(v67, "mainFileURL");
              v239 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v238, "descriptionWithFileURL:", v239);
              v240 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v240;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v227;
              _os_log_impl(&dword_1991EC000, v237, OS_LOG_TYPE_ERROR, "Unable to get adjustment info from original file '%@': %@", buf, 0x16u);

              v225 = 0;
            }
          }

          goto LABEL_263;
        }
        v75 = 0;
        v76 = 1;
        v346 = 1;
      }
      else
      {
        if (v69)
          goto LABEL_227;
        v74 = v68;
        v75 = 0;
      }
      v15 = v351;
      goto LABEL_237;
    }
    v53 = v52;
    objc_msgSend(v28, "creationOptions");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v355 = objc_msgSend(v54, "shouldMoveFile");

    objc_msgSend(v28, "creationOptions");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "shouldIngestInPlace");

    v333 = -[PHAssetCreationRequest _savedAssetTypeForAsset](self, "_savedAssetTypeForAsset");
    v57 = v51;
    v58 = v57;
    v59 = v53 - 1;
    if (v53 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1991EC000, v58, OS_SIGNPOST_INTERVAL_BEGIN, v53, "Ingest-Prepare", "START: file operation + metadata", buf, 2u);
    }

    if (!v373)
    {
      v64 = 0;
      v335 = 0;
      v360 = 0;
      v345 = 0;
      if (v359)
        v72 = v362 == 1;
      else
        v72 = 0;
      v63 = v72;
      if (!v63)
      {
LABEL_73:
        if (v345)
        {
          v96 = v345;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3303, CFSTR("Unable to resolve primary resource"));
          v96 = (id)objc_claimAutoreleasedReturnValue();
        }
        v345 = v96;

      }
LABEL_77:
      v97 = v58;
      v98 = v97;
      if (v59 > 0xFFFFFFFFFFFFFFFDLL)
      {

        v101 = v98;
        v27 = v366;
        v99 = v362;
      }
      else
      {
        v27 = v366;
        v99 = v362;
        if (os_signpost_enabled(v97))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1991EC000, v98, OS_SIGNPOST_INTERVAL_END, v53, "Ingest-Prepare", "END: file operation + metadata", buf, 2u);
        }

        v100 = v98;
        if (os_signpost_enabled(v100))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1991EC000, v100, OS_SIGNPOST_INTERVAL_BEGIN, v53, "Ingest-CreateAsset", "START: asset creation", buf, 2u);
        }
      }

      objc_msgSend(v372, "creationOptions");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "uniformTypeIdentifier");
      v341 = objc_claimAutoreleasedReturnValue();

      if (!v63)
      {
        v70 = v99;
        v69 = 0;
        v67 = 0;
        v356 = 0;
        v369 = 0;
        v370 = 0;
        v107 = 0;
        v338 = 0;
        LOBYTE(v344) = 0;
        v28 = v372;
        v68 = v345;
        v108 = (void *)v341;
LABEL_220:

        goto LABEL_221;
      }
      if (v360)
      {
        if (objc_msgSend(v372, "type") == 1 || objc_msgSend(v372, "type") == 19)
        {
          v103 = objc_alloc(MEMORY[0x1E0D75140]);
          objc_msgSend(v15, "libraryBundle");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "timeZoneLookup");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          v106 = objc_msgSend(v103, "initWithImageURL:contentType:options:timeZoneLookup:cacheImageSource:cacheImageData:", v360, 0, 14, v105, 1, 1);
        }
        else
        {
          v110 = objc_alloc(MEMORY[0x1E0D75140]);
          objc_msgSend(v15, "libraryBundle");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "timeZoneLookup");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          v106 = objc_msgSend(v110, "initWithAVURL:options:timeZoneLookup:", v360, 14, v105);
        }
        v370 = (void *)v106;

        v109 = v354;
      }
      else
      {
        v370 = 0;
        v109 = v354;
      }
      v111 = (void *)v341;
      v398 = 0;
      v112 = -[PHAssetCreationRequest _assetAlreadyExistsAsPlaceholder:mediaType:uuid:photoLibrary:fetchAsset:](self, "_assetAlreadyExistsAsPlaceholder:mediaType:uuid:photoLibrary:fetchAsset:", v368, v99, v109, v15, &v398);
      v113 = v398;
      v332 = v113;
      if (v112)
      {
        if (v113)
        {
          v114 = v113;
          v115 = objc_msgSend(v113, "bundleScope");
          v397 = 0;
          objc_msgSend(v114, "setAttributesFromMainFileURL:mainFileMetadata:savedAssetType:bundleScope:isPlaceholder:placeholderFileURL:imageSource:imageData:", v360, v370, v333, v115, 0, 0, &v402, &v397);
          v356 = v397;
          v67 = v114;
          v28 = v372;
          goto LABEL_97;
        }
        v70 = v99;
        objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", CFSTR("Expected to find an existing placeholder asset in the library for uuid '%@'"), v109);
        v67 = (id)objc_claimAutoreleasedReturnValue();

        v356 = 0;
        v28 = v372;
      }
      else
      {
        if (v64)
        {
          v116 = (void *)MEMORY[0x1E0D71880];
          v117 = -[PHAssetCreationRequest bundleScope](self, "bundleScope");
          v396 = 0;
          LOWORD(v324) = 257;
          objc_msgSend(v116, "insertAssetIntoPhotoLibrary:mainFileURL:mainFileMetadata:savedAssetType:bundleScope:uuid:replacementUUID:imageSource:imageData:isPlaceholder:deleteFileOnFailure:", v15, v335, v370, v333, v117, v109, 0, &v402, &v396, v324);
          v67 = (id)objc_claimAutoreleasedReturnValue();
          v356 = v396;
          v111 = (void *)v341;
          objc_msgSend(v67, "setAttributesFromMainFileURL:mainFileMetadata:savedAssetType:bundleScope:isPlaceholder:placeholderFileURL:imageSource:imageData:", v335, v370, v333, 0, 1, v360, 0, 0);
          v28 = v372;
          if (v67)
            goto LABEL_97;
        }
        else
        {
          if (v360)
          {
            v123 = (void *)MEMORY[0x1E0D71880];
            v124 = -[PHAssetCreationRequest bundleScope](self, "bundleScope");
            v395 = 0;
            BYTE1(v324) = (v355 | v56) ^ 1;
            LOBYTE(v324) = 0;
            objc_msgSend(v123, "insertAssetIntoPhotoLibrary:mainFileURL:mainFileMetadata:savedAssetType:bundleScope:uuid:replacementUUID:imageSource:imageData:isPlaceholder:deleteFileOnFailure:", v15, v360, v370, v333, v124, v109, 0, &v402, &v395, v324);
            v67 = (id)objc_claimAutoreleasedReturnValue();
            v356 = v395;
            v28 = v372;
          }
          else
          {
            v28 = v372;
            v394 = v370;
            v393 = 0;
            -[PHAssetCreationRequest _managedAssetFromPrimaryResourceData:validatedResources:withUUID:photoLibrary:mainFileMetadata:getImageSource:imageData:](self, "_managedAssetFromPrimaryResourceData:validatedResources:withUUID:photoLibrary:mainFileMetadata:getImageSource:imageData:", v372, v27, v109, v15, &v394, &v402, &v393);
            v67 = (id)objc_claimAutoreleasedReturnValue();
            v149 = v394;

            v356 = v393;
            v370 = v149;
          }
          v99 = v362;
          if (v67)
          {
LABEL_97:
            if (v109)
            {
              objc_msgSend(v67, "uuid");
              v118 = (void *)objc_claimAutoreleasedReturnValue();
              v119 = objc_msgSend(v109, "isEqualToString:", v118);

              if ((v119 & 1) == 0)
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v323 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v323, "handleFailureInMethod:object:file:lineNumber:description:", v343, self, CFSTR("PHAssetCreationRequest.m"), 3212, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[uuid isEqualToString:asset.uuid]"));

              }
            }
            objc_msgSend(v67, "additionalAttributes");
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "creationOptions");
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v121, "alternateImportImageDate");
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v120, "setAlternateImportImageDate:", v122);

            if (v370)
            {
              if ((objc_msgSend(v370, "photoProcessingFlags") & 0x1000) != 0)
              {
                v344 = 1;
                if ((objc_msgSend(v370, "photoCaptureFlags") & 0x4000000000) != 0)
                  objc_msgSend(v67, "setSpatialType:", 1);
              }
              else
              {
                v344 = 0;
              }
            }
            else
            {
              v344 = 0;
            }
            -[PHAssetCreationRequest importSessionID](self, "importSessionID");
            v125 = (void *)objc_claimAutoreleasedReturnValue();

            if (v125)
            {
              -[PHAssetCreationRequest importSessionID](self, "importSessionID");
              v126 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "setImportSessionAlbumWithImportSessionID:", v126);

            }
            -[PHAssetCreationRequest conversationID](self, "conversationID");
            v127 = (void *)objc_claimAutoreleasedReturnValue();

            if (v127)
            {
              -[PHAssetCreationRequest conversationID](self, "conversationID");
              v128 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "setConversationAlbumWithConversationID:", v128);

            }
            -[PHAssetCreationRequest syndicationIdentifier](self, "syndicationIdentifier");
            v129 = (void *)objc_claimAutoreleasedReturnValue();

            if (v129)
            {
              -[PHAssetCreationRequest syndicationIdentifier](self, "syndicationIdentifier");
              v130 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "additionalAttributes");
              v131 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v131, "setSyndicationIdentifier:", v130);

            }
            -[PHAssetCreationCameraIngestOptions creationDate](self->_cameraIngestOptions, "creationDate");
            v132 = (void *)objc_claimAutoreleasedReturnValue();

            if (v132)
            {
              -[PHAssetCreationCameraIngestOptions creationDate](self->_cameraIngestOptions, "creationDate");
              v133 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "setDateCreated:", v133);

            }
            -[PHAssetCreationCameraIngestOptions finalAssetHeight](self->_cameraIngestOptions, "finalAssetHeight");
            if (v134 != 0.0)
            {
              -[PHAssetCreationCameraIngestOptions finalAssetWidth](self->_cameraIngestOptions, "finalAssetWidth");
              if (v135 != 0.0)
              {
                -[PHAssetCreationCameraIngestOptions finalAssetHeight](self->_cameraIngestOptions, "finalAssetHeight");
                objc_msgSend(v67, "setHeight:", (uint64_t)v136);
                -[PHAssetCreationCameraIngestOptions finalAssetWidth](self->_cameraIngestOptions, "finalAssetWidth");
                objc_msgSend(v67, "setWidth:", (uint64_t)v137);
              }
            }
            -[PHAssetCreationCameraIngestOptions cameraMetadataPath](self->_cameraIngestOptions, "cameraMetadataPath");
            v138 = objc_claimAutoreleasedReturnValue();
            if (v138)
            {
              v139 = (void *)v138;
              v140 = objc_msgSend(MEMORY[0x1E0D717C0], "semanticEnhanceSceneIsValid:", (_QWORD)v403);

              if (v140)
                -[PHAssetCreationRequest _checkAndSetForSemanticEnhancementForAsset:resourceBag:](self, "_checkAndSetForSemanticEnhancementForAsset:resourceBag:", v67, v27);
            }
            if (!objc_msgSend(v67, "kind")
              && -[PHAssetCreationCameraIngestOptions isExpectingPairedVideo](self->_cameraIngestOptions, "isExpectingPairedVideo"))
            {
              -[PHAssetCreationRequest _setupIrisPairingTimeoutForAsset:imageFile:library:](self, "_setupIrisPairingTimeoutForAsset:imageFile:library:", v67, v373, v15);
            }
            -[PHAssetCreationRequest cameraIngestOptions](self, "cameraIngestOptions");
            v141 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v141, "dbgFilePath");
            v142 = objc_claimAutoreleasedReturnValue();

            v331 = (id)v142;
            if (v142)
              v143 = v340;
            else
              v143 = 0;
            if (v143 == 1)
            {
              objc_msgSend(v67, "filename");
              v144 = (void *)objc_claimAutoreleasedReturnValue();
              +[PHAssetCreationRequest setdbgFileWithAsset:dbgFilePath:photoFilename:](PHAssetCreationRequest, "setdbgFileWithAsset:dbgFilePath:photoFilename:", v67, v331, v144);

            }
            objc_msgSend(v28, "creationOptions");
            v145 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "setAvalanchePickType:", objc_msgSend(v145, "burstPickType"));

            objc_msgSend(v28, "creationOptions");
            v146 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v146, "originalFilename");
            v147 = (void *)objc_claimAutoreleasedReturnValue();
            if (v147)
            {
              v334 = v147;

            }
            else
            {
              objc_msgSend(v373, "lastPathComponent");
              v148 = (id)objc_claimAutoreleasedReturnValue();

              v334 = v148;
              if (!v148)
              {
                v334 = 0;
LABEL_145:
                objc_msgSend(v67, "mainFileURL");
                v151 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v151, "lastPathComponent");
                v152 = objc_claimAutoreleasedReturnValue();

                v334 = (id)v152;
LABEL_146:
                if ((v367 & 1) == 0)
                {
                  -[PHAssetCreationCameraIngestOptions jobType](self->_cameraIngestOptions, "jobType");
                  v153 = (void *)objc_claimAutoreleasedReturnValue();
                  v154 = objc_msgSend(v153, "isEqualToString:", *MEMORY[0x1E0D74E18]);

                  if ((v154 & 1) == 0)
                    objc_msgSend(v67, "setOriginalFilename:", v334);
                }
                if (v111)
                  objc_msgSend(v67, "setUniformTypeIdentifier:", v111);
                PLPhotoKitGetLog();
                v155 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v155, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v67, "uuid");
                  v156 = (id)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)&buf[4] = v156;
                  _os_log_impl(&dword_1991EC000, v155, OS_LOG_TYPE_DEBUG, "Generating new thumbnails for asset with UUID %@", buf, 0xCu);

                }
                if (v99 == 2)
                {
                  if (-[PHChangeRequest shouldPerformConcurrentWork](self, "shouldPerformConcurrentWork"))
                  {
                    v328 = 0;
                    v329 = 0;
                  }
                  else
                  {
                    objc_msgSend(v360, "path");
                    v158 = (void *)objc_claimAutoreleasedReturnValue();
                    v392 = 0;
                    v391 = 0;
                    PLPreviewImageAndDurationForVideoAtPath();
                    v329 = v392;
                    v328 = v391;

                  }
                  -[PHAssetCreationRequest duplicateAssetIdentifier](self, "duplicateAssetIdentifier");
                  v159 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v159)
                  {
                    +[PHObject uuidFromLocalIdentifier:](PHObject, "uuidFromLocalIdentifier:", v159);
                    v160 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0D71880], "assetWithUUID:inLibrary:", v160, v15);
                    v161 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v161)
                    {
                      objc_msgSend(v67, "additionalAttributes");
                      v162 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v161, "additionalAttributes");
                      v163 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v162, "setCameraCaptureDevice:", objc_msgSend(v163, "cameraCaptureDevice"));

                      v111 = (void *)v341;
                    }

                  }
                  else
                  {
                    v161 = 0;
                  }

                  v157 = v161;
                  v99 = v362;
                }
                else
                {
                  v328 = 0;
                  v329 = 0;
                  v157 = 0;
                }
                -[PHAssetCreationRequest duplicateAssetIdentifier](self, "duplicateAssetIdentifier");
                v164 = objc_claimAutoreleasedReturnValue();
                v330 = (void *)v164;
                if (!v157 && v164)
                {
                  +[PHObject uuidFromLocalIdentifier:](PHObject, "uuidFromLocalIdentifier:", v164);
                  v165 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0D71880], "assetWithUUID:inLibrary:", v165, v15);
                  v166 = objc_claimAutoreleasedReturnValue();

                  v157 = (void *)v166;
                }
                v369 = v157;
                if (v157)
                {
                  objc_msgSend(v157, "additionalAttributes");
                  v167 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v167, "setDestinationAssetCopyState:", 2);

                  v157 = v369;
                }
                if (self->_duplicateAssetPhotoLibraryType == 1)
                {
                  objc_msgSend(v67, "additionalAttributes");
                  v168 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v168, "setImportedBy:", 7);
                  objc_msgSend(v168, "setShareType:", 1);
                  if (!v157)
                    goto LABEL_211;
                  v169 = v99;
                  v170 = (uint64_t)v111;
                  objc_msgSend(v157, "additionalAttributes");
                  v171 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v171, "shareOriginator");
                  v172 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v168, "setShareOriginator:", v172);
                }
                else
                {
                  v173 = -[PHAssetCreationRequest importedBy](self, "importedBy");
                  -[PHChangeRequest helper](self, "helper");
                  v174 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v174, "clientBundleIdentifier");
                  v175 = objc_claimAutoreleasedReturnValue();

                  -[PHChangeRequest helper](self, "helper");
                  v176 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v176, "clientDisplayName");
                  v327 = objc_claimAutoreleasedReturnValue();

                  v177 = (void *)v175;
                  if (v173)
                    v178 = v173;
                  else
                    v178 = 3;
                  if (objc_msgSend(v177, "hasPrefix:", CFSTR("com.apple.")))
                  {
                    if ((v367 | v337) == 1)
                    {
                      -[PHAssetCreationRequest cameraIngestOptions](self, "cameraIngestOptions");
                      v179 = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend(v179, "isRearFacingCamera"))
                        v178 = 1;
                      else
                        v178 = 2;

                    }
                    else if (v178 == 3)
                    {
                      v178 = 8;
                    }
                    else if (v178 == 6)
                    {
                      v178 = 9;
                    }
                  }
                  v349 = (NSString *)v177;
                  if (objc_msgSend(v177, "length"))
                  {
                    -[PHChangeRequest helper](self, "helper");
                    v180 = (void *)objc_claimAutoreleasedReturnValue();
                    v181 = objc_msgSend(v180, "isClientInLimitedLibraryMode");

                    if (v181)
                    {
                      -[PHChangeRequest helper](self, "helper");
                      v182 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v182, "fetchFilterIdentifier");
                      v183 = (void *)objc_claimAutoreleasedReturnValue();

                      memset(buf, 0, 32);
                      -[PHChangeRequest helper](self, "helper");
                      v184 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v184, "clientAuthorization");
                      v185 = (void *)objc_claimAutoreleasedReturnValue();
                      v186 = v185;
                      if (v185)
                        objc_msgSend(v185, "clientAuditToken");
                      else
                        memset(buf, 0, 32);

                      v187 = (void *)MEMORY[0x1E0D71840];
                      objc_msgSend(v15, "managedObjectContext");
                      v188 = (void *)objc_claimAutoreleasedReturnValue();
                      v390[0] = *(_OWORD *)buf;
                      v390[1] = *(_OWORD *)&buf[16];
                      objc_msgSend(v187, "fetchOrCreateLimitedLibraryFetchFilterWithApplicationIdentifier:auditToken:inManagedObjectContext:", v183, v390, v188);
                      v189 = (void *)objc_claimAutoreleasedReturnValue();

                      -[PHChangeRequest uuid](self, "uuid");
                      v190 = (void *)objc_claimAutoreleasedReturnValue();
                      v407 = v190;
                      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v407, 1);
                      v191 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v189, "addAssetsWithUUIDs:", v191);

                      objc_msgSend(v189, "objectID");
                      v192 = (void *)objc_claimAutoreleasedReturnValue();
                      -[PHAssetCreationRequest _setLimitedLibraryFetchFilterObjectID:](self, "_setLimitedLibraryFetchFilterObjectID:", v192);

                      v111 = (void *)v341;
                    }
                  }
                  objc_msgSend(v67, "additionalAttributes");
                  v193 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v193, "setImportedBy:", v178);

                  if (-[NSString length](self->_importedByBundleIdentifier, "length"))
                  {
                    importedByBundleIdentifier = self->_importedByBundleIdentifier;
                    objc_msgSend(v67, "additionalAttributes");
                    v195 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v195, "setImportedByBundleIdentifier:", importedByBundleIdentifier);

                    v196 = self->_importedByBundleIdentifier;
                  }
                  else
                  {
                    v196 = v349;
                    if (-[NSString length](v349, "length"))
                    {
                      objc_msgSend(v67, "additionalAttributes");
                      v241 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v241, "setImportedByBundleIdentifier:", v349);

                      if (objc_msgSend(MEMORY[0x1E0D71570], "shouldPersistImportedByDisplayName:", v327))
                      {
                        objc_msgSend(v67, "additionalAttributes");
                        v242 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v242, "setImportedByDisplayName:", v327);

                        v196 = v349;
                      }
                    }
                    else
                    {
                      v196 = (NSString *)*MEMORY[0x1E0D735E0];
                    }
                  }
                  v197 = v196;
                  v198 = *MEMORY[0x1E0D735B0];
                  v406[0] = v197;
                  v199 = *MEMORY[0x1E0D735D0];
                  v405[0] = v198;
                  v405[1] = v199;
                  v200 = (uint64_t)v111;
                  if (!v111)
                  {
                    objc_msgSend(MEMORY[0x1E0C99E38], "null");
                    v200 = objc_claimAutoreleasedReturnValue();
                  }
                  v201 = (uint64_t *)MEMORY[0x1E0D73590];
                  v326 = (void *)v200;
                  v406[1] = v200;
                  v405[2] = *MEMORY[0x1E0D735C8];
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v67, "originalFilesize"));
                  v202 = objc_claimAutoreleasedReturnValue();
                  v203 = (void *)v202;
                  if (!v202)
                  {
                    objc_msgSend(MEMORY[0x1E0C99E38], "null");
                    v202 = objc_claimAutoreleasedReturnValue();
                  }
                  v339 = v197;
                  v204 = *v201;
                  v325 = (void *)v202;
                  v406[2] = v202;
                  v405[3] = *MEMORY[0x1E0D735C0];
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v67, "width"));
                  v205 = (void *)objc_claimAutoreleasedReturnValue();
                  v206 = v205;
                  if (!v205)
                  {
                    objc_msgSend(MEMORY[0x1E0C99E38], "null");
                    v206 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  v406[3] = v206;
                  v405[4] = *MEMORY[0x1E0D735B8];
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v67, "height"));
                  v207 = (void *)objc_claimAutoreleasedReturnValue();
                  v208 = v207;
                  if (!v207)
                  {
                    objc_msgSend(MEMORY[0x1E0C99E38], "null");
                    v208 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  v406[4] = v208;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v406, v405, 5);
                  v209 = (void *)objc_claimAutoreleasedReturnValue();
                  MEMORY[0x19AEBE464](v204, v209);

                  v169 = v362;
                  if (!v207)

                  if (!v205)
                  v28 = v372;
                  if (!v203)

                  v27 = v366;
                  v171 = (void *)v327;
                  v170 = v341;
                  if (!v341)

                  v168 = v349;
                  v172 = v339;
                }

                v111 = (void *)v170;
                v99 = v169;
LABEL_211:

                v210 = objc_msgSend(MEMORY[0x1E0D717C0], "semanticEnhanceSceneIsValid:", (_QWORD)v403);
                v211 = objc_msgSend(v27, "hasCurrentAdjustment");
                v348 = v210;
                if ((v367 & 1) != 0)
                {
                  if (((v211 | v344 | v210) & 1) == 0)
                  {
LABEL_213:
                    v70 = v99;
                    v212 = v402;
                    objc_msgSend(v351, "libraryBundle");
                    v213 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v213, "timeZoneLookup");
                    v214 = (void *)objc_claimAutoreleasedReturnValue();
                    -[PHAssetCreationRequest _checkAndGenerateThumbnailsForAsset:imageSource:imageData:previewImage:thumbnailImage:timeZoneLookup:resourceBag:](self, "_checkAndGenerateThumbnailsForAsset:imageSource:imageData:previewImage:thumbnailImage:timeZoneLookup:resourceBag:", v67, v212, v356, v329, v328, v214, v27);

                    v338 = 0;
LABEL_216:
                    v68 = v345;
                    v108 = v111;
                    PLPhotoKitGetLog();
                    v215 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v215, OS_LOG_TYPE_DEFAULT))
                    {
                      objc_msgSend(v67, "uuid");
                      v216 = (id)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412546;
                      *(_QWORD *)&buf[4] = v67;
                      *(_WORD *)&buf[12] = 2114;
                      *(_QWORD *)&buf[14] = v216;
                      _os_log_impl(&dword_1991EC000, v215, OS_LOG_TYPE_DEFAULT, "Created asset %@ uuid %{public}@ from valid resources ", buf, 0x16u);

                      v68 = v345;
                    }

                    v69 = 1;
                    v150 = v331;
                    goto LABEL_219;
                  }
                }
                else if ((v211 & 1) == 0)
                {
                  goto LABEL_213;
                }
                v70 = v99;
                v338 = v367 & v344;
                goto LABEL_216;
              }
            }
            if (!self->_shouldUseAutomaticallyGeneratedOriginalFilename)
              goto LABEL_146;
            goto LABEL_145;
          }
        }
        v70 = v99;
        v67 = v345;
      }
      v108 = v111;
      if (v67)
      {
        v150 = v67;
        v69 = 0;
        v67 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", CFSTR("Unable to create asset from primary resource"));
        v150 = (id)objc_claimAutoreleasedReturnValue();
        v69 = 0;
      }
      v338 = 0;
      LOBYTE(v344) = 0;
      v369 = 0;
      v68 = v150;
LABEL_219:

      v107 = v332;
      goto LABEL_220;
    }
    if (v56)
    {
      objc_msgSend(v15, "pathManager");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = (void *)MEMORY[0x1E0D73208];
      objc_msgSend(v60, "capabilities");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v401 = 0;
      v63 = objc_msgSend(v61, "ingestItemAtURL:toURL:type:options:capabilities:error:", v373, v373, 0, 3, v62, &v401);
      v345 = v401;

      v360 = v373;
      v64 = 0;
      v335 = 0;
      if (v63)
        goto LABEL_77;
      goto LABEL_73;
    }
    if (v362 != 1)
      goto LABEL_60;
    if (objc_msgSend(v366, "hasCurrentAdjustment"))
    {
      -[PHAssetCreationCameraIngestOptions deferredPhotoIdentifier](self->_cameraIngestOptions, "deferredPhotoIdentifier");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      if (v73)
      {

        goto LABEL_54;
      }
      if ((v348 & 1) == 0)
      {
LABEL_60:
        v399 = 0;
        -[PHAssetCreationRequest _secureMove:assetResource:photoLibrary:error:](self, "_secureMove:assetResource:photoLibrary:error:", v355, v28, v15, &v399);
        v89 = objc_claimAutoreleasedReturnValue();
        v345 = v399;
        v64 = 0;
        v335 = 0;
        v360 = (id)v89;
        v63 = v89 != 0;
        if (v89)
          goto LABEL_77;
        goto LABEL_73;
      }
    }
    else if (!v348)
    {
      goto LABEL_60;
    }
LABEL_54:
    objc_msgSend(v15, "libraryServicesManager");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "imageWriter");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v373, "pathExtension");
    v79 = v15;
    v80 = v14;
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "uppercaseString");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "cameraAssetPathForNewAssetWithExtension:assetUUID:", v82, v80);
    v83 = objc_claimAutoreleasedReturnValue();

    v371 = (void *)v83;
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D719A8], "deferredPhotoPreviewDestinationURLForPrimaryAssetURL:", v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v348)
    {
      v15 = v79;
      goto LABEL_67;
    }
    v86 = -[PHAssetCreationRequest _setupSemanticEnhanceMetadataIfNeededWithDestinationURL:photoLibrary:semanticEnhanceResult:ingestJobCameraMetadata:](self, "_setupSemanticEnhanceMetadataIfNeededWithDestinationURL:photoLibrary:semanticEnhanceResult:ingestJobCameraMetadata:", v84, v79, &v403, v365);
    -[PHAssetCreationCameraIngestOptions deferredPhotoIdentifier](self->_cameraIngestOptions, "deferredPhotoIdentifier");
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v79;
    if (v87 || !v86)
    {
      -[PHAssetCreationCameraIngestOptions deferredPhotoIdentifier](self->_cameraIngestOptions, "deferredPhotoIdentifier");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      if (v90)
        LOBYTE(v86) = 1;

      if (v86)
      {
LABEL_67:
        v400 = 0;
        v91 = objc_msgSend(MEMORY[0x1E0D73208], "copyItemAtURL:toURL:error:", v373, v85, &v400);
        v92 = v400;
        v360 = v85;
        v335 = v84;
        if ((v91 & 1) != 0)
        {
          v64 = v84 != 0;
          v63 = 1;
        }
        else
        {
          PLPhotoKitIngestGetLog();
          v93 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v373, "path");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v360, "path");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v94;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v95;
            *(_WORD *)&buf[22] = 2112;
            *(_QWORD *)&buf[24] = v92;
            _os_log_impl(&dword_1991EC000, v93, OS_LOG_TYPE_ERROR, "Failed to copy file from %@ to %@ with error: %@", buf, 0x20u);

          }
          v64 = 0;
          v63 = 0;
        }

        v345 = 0;
        v53 = spid;
        if (!v63)
          goto LABEL_73;
        goto LABEL_77;
      }
      v88 = v84;

      v84 = 0;
      v85 = v88;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D717C0], "semanticEnhancePreviewDestinationURLForPrimaryAssetURL:", v84);
      v88 = (id)objc_claimAutoreleasedReturnValue();
    }

    v85 = v88;
    goto LABEL_67;
  }
  LOBYTE(v390[0]) = 0;
  -[PHAssetCreationRequest assetExistsWithSyndicationIdentifier](self, "assetExistsWithSyndicationIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLValue");

  if (v18)
  {
    -[PHChangeRequest helper](self, "helper");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "uuid");
    v20 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(v390[0]) = -[PHAssetCreationRequest assetExistingWithSyndicationIdentifierIsTrashed](self, "assetExistingWithSyndicationIdentifierIsTrashed");
    PLSyndicationGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      goto LABEL_11;
    -[PHAssetCreationRequest syndicationIdentifier](self, "syndicationIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v22;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v20;
    v23 = "assetExistsWithSyndicationIdentifier=YES (%{public}@), helper provided uuid %{public}@";
    goto LABEL_10;
  }
  -[PHAssetCreationRequest assetExistsWithSyndicationIdentifier](self, "assetExistsWithSyndicationIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
    goto LABEL_18;
  -[PHAssetCreationRequest syndicationIdentifier](self, "syndicationIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHAssetCreationRequest _uuidForAssetWithSyndicationIdentifier:inLibrary:isTrashed:](PHAssetCreationRequest, "_uuidForAssetWithSyndicationIdentifier:inLibrary:isTrashed:", v25, v15, v390);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  PLSyndicationGetLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    -[PHAssetCreationRequest syndicationIdentifier](self, "syndicationIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v22;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v20;
    v23 = "Check for existing asset with syndication identifier %{public}@ returned uuid %{public}@";
LABEL_10:
    _os_log_impl(&dword_1991EC000, v21, OS_LOG_TYPE_INFO, v23, buf, 0x16u);

  }
LABEL_11:

  if (!v20)
    goto LABEL_18;
  objc_msgSend(MEMORY[0x1E0D71880], "assetWithUUID:inLibrary:", v20, v15);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  if (LOBYTE(v390[0]) && !-[PHAssetCreationRequest _unTrashAndResetAsset:](self, "_unTrashAndResetAsset:", v26))
  {

    goto LABEL_17;
  }
  if (!v26)
  {
LABEL_17:

    goto LABEL_18;
  }
  objc_msgSend(v26, "syndicatedAssetDidSaveToUserLibrary");
LABEL_382:

  return v26;
}

- (id)initForNewObject
{
  return -[PHAssetCreationRequest initForNewObjectWithUUID:](self, "initForNewObjectWithUUID:", 0);
}

- (id)initForNewObjectWithUUID:(id)a3
{
  id v4;
  id v5;
  PHAssetCreationRequest *v6;

  v4 = a3;
  v5 = -[PHChangeRequestHelper initForNewObjectWithUUID:changeRequest:]([PHChangeRequestHelper alloc], "initForNewObjectWithUUID:changeRequest:", v4, self);

  v6 = -[PHAssetCreationRequest initWithHelper:](self, "initWithHelper:", v5);
  return v6;
}

- (PHAssetCreationRequest)initWithHelper:(id)a3
{
  id v4;
  PHAssetCreationRequest *v5;
  PHRelationshipChangeRequestHelper *v6;
  PHRelationshipChangeRequestHelper *momentShareHelper;
  NSMutableArray *v8;
  NSMutableArray *assetResources;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PHAssetCreationRequest;
  v5 = -[PHAssetChangeRequest initWithHelper:](&v11, sel_initWithHelper_, v4);
  if (v5)
  {
    objc_msgSend(v4, "setNewRequest:", 1);
    v6 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("momentShare"), v4);
    momentShareHelper = v5->_momentShareHelper;
    v5->_momentShareHelper = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    assetResources = v5->_assetResources;
    v5->_assetResources = v8;

    v5->_duplicateAssetPhotoLibraryType = 0;
    v5->_importedBy = 0;
    v5->_bundleScope = 0;
  }

  return v5;
}

- (id)_resolveResourceHoldingDirectoryPath
{
  NSString **p_resourceHoldingDirectoryPath;
  void *v4;
  int v5;
  NSString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  id v17;
  id v18;
  uint8_t buf[4];
  NSString *v20;
  __int16 v21;
  NSString *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if ((PLIsAssetsd() & 1) == 0)
  {
    p_resourceHoldingDirectoryPath = &self->_resourceHoldingDirectoryPath;
    if (!self->_resourceHoldingDirectoryPath)
    {
      -[PHChangeRequest photoLibrary](self, "photoLibrary");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      v5 = objc_msgSend(v4, "requestSandboxExtensionsIfNeededWithError:", &v18);
      v6 = (NSString *)v18;

      if (v5)
      {
        -[PHChangeRequest photoLibrary](self, "photoLibrary");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "pathManager");
        v8 = objc_claimAutoreleasedReturnValue();
        -[PHChangeRequest uuid](self, "uuid");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v8, "assetCreationHoldingDirectoryForAssetUUID:", v9);
        v10 = objc_claimAutoreleasedReturnValue();

        v17 = 0;
        LOBYTE(v8) = objc_msgSend(MEMORY[0x1E0D73208], "createDirectoryAtPath:error:", v10, &v17);
        v11 = v17;
        if ((v8 & 1) != 0 || objc_msgSend(MEMORY[0x1E0D73208], "isFileExistsError:", v11))
        {
          objc_storeStrong((id *)&self->_resourceHoldingDirectoryPath, v10);
          PLPhotoKitGetLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            v13 = *p_resourceHoldingDirectoryPath;
            *(_DWORD *)buf = 138412290;
            v20 = v13;
            _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_INFO, "PHAssetCreationRequest resolved resourceHoldingDirectoryPath: %@", buf, 0xCu);
          }
        }
        else
        {
          PLPhotoKitGetLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            -[PHChangeRequest uuid](self, "uuid");
            v14 = (NSString *)objc_claimAutoreleasedReturnValue();
            v15 = *p_resourceHoldingDirectoryPath;
            *(_DWORD *)buf = 138543874;
            v20 = v14;
            v21 = 2112;
            v22 = v15;
            v23 = 2112;
            v24 = v11;
            _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_ERROR, "Unable to create resource holding directory for %{public}@ at %@: %@", buf, 0x20u);

          }
        }

      }
      else
      {
        PLPhotoKitGetLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v20 = v6;
          _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_ERROR, "Error resolving resource holding directory path: %@", buf, 0xCu);
        }
      }

    }
  }
  return self->_resourceHoldingDirectoryPath;
}

- (void)addResourceWithType:(PHAssetResourceType)type fileURL:(NSURL *)fileURL options:(PHAssetResourceCreationOptions *)options
{
  -[PHAssetCreationRequest _addResourceWithType:data:orFileURL:options:](self, "_addResourceWithType:data:orFileURL:options:", type, 0, fileURL, options);
}

- (void)addResourceWithType:(PHAssetResourceType)type data:(NSData *)data options:(PHAssetResourceCreationOptions *)options
{
  -[PHAssetCreationRequest _addResourceWithType:data:orFileURL:options:](self, "_addResourceWithType:data:orFileURL:options:", type, data, 0, options);
}

- (void)_addResourceWithType:(int64_t)a3 data:(id)a4 orFileURL:(id)a5 options:(id)a6
{
  id v10;
  PHAssetResourceCreationOptions *v11;
  id v12;
  PHExternalAssetResource *v13;
  void *v14;
  NSString *resourceHoldingDirectoryPath;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = (PHAssetResourceCreationOptions *)a6;
  v12 = a4;
  v13 = -[PHExternalAssetResource initWithResourceType:]([PHExternalAssetResource alloc], "initWithResourceType:", a3);
  -[PHExternalAssetResource setData:](v13, "setData:", v12);

  if (!self->_useRecoverableStagingDirectory
    || (-[PHAssetCreationRequest _resolveResourceHoldingDirectoryPath](self, "_resolveResourceHoldingDirectoryPath"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v14,
        !v14))
  {
    -[PHExternalAssetResource setFileURL:](v13, "setFileURL:", v10);
    goto LABEL_21;
  }
  resourceHoldingDirectoryPath = self->_resourceHoldingDirectoryPath;
  objc_msgSend(v10, "lastPathComponent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingPathComponent:](resourceHoldingDirectoryPath, "stringByAppendingPathComponent:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    if (-[PHAssetResourceCreationOptions shouldMoveFile](v11, "shouldMoveFile"))
    {
      -[PHChangeRequest photoLibrary](self, "photoLibrary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "pathManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "capabilities");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0;
      v30 = v18;
      -[PHAssetCreationRequest _secureMove:fileAtURL:toURL:capabilities:error:](self, "_secureMove:fileAtURL:toURL:capabilities:error:", 1, v10, v18, v22, &v32);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v32;

      if (v23)
      {
        v25 = 0;
        v18 = v30;
LABEL_17:
        -[PHExternalAssetResource setFileURL:](v13, "setFileURL:", v18);

        goto LABEL_18;
      }
      PLPhotoKitGetLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v34 = v17;
        v35 = 2112;
        v36 = v24;
        _os_log_impl(&dword_1991EC000, v29, OS_LOG_TYPE_ERROR, "Unable to secure move resource to holding directory location %@: %@", buf, 0x16u);
      }
      v25 = 0;
      v18 = v30;
    }
    else
    {
      v26 = v18;
      v27 = (void *)MEMORY[0x1E0D73208];
      objc_msgSend(v10, "path");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0;
      LOBYTE(v27) = objc_msgSend(v27, "cloneFileAtPath:toPath:error:", v28, v17, &v31);
      v25 = v31;

      if ((v27 & 1) != 0)
      {
        v24 = 0;
        v18 = v26;
        goto LABEL_17;
      }
      PLPhotoKitGetLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v34 = v17;
        v35 = 2112;
        v36 = v25;
        _os_log_impl(&dword_1991EC000, v29, OS_LOG_TYPE_ERROR, "Unable to clone resource to holding directory location %@: %@", buf, 0x16u);
      }
      v24 = 0;
      v18 = v26;
    }

    goto LABEL_17;
  }
LABEL_18:
  if (!v11)
    v11 = objc_alloc_init(PHAssetResourceCreationOptions);
  -[PHAssetResourceCreationOptions setShouldMoveFile:](v11, "setShouldMoveFile:", 1);

LABEL_21:
  -[PHExternalAssetResource setCreationOptions:](v13, "setCreationOptions:", v11);
  -[NSMutableArray addObject:](self->_assetResources, "addObject:", v13);

}

- (id)placeholderForCreatedAsset
{
  void *v3;
  void *v4;

  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "placeholderForCreatedObjectWithClass:changeRequest:", objc_opt_class(), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAssetMediaType:", -[PHAssetCreationRequest _mediaTypeForCreatedAsset](self, "_mediaTypeForCreatedAsset"));
  return v4;
}

- (int64_t)_mediaTypeForCreatedAsset
{
  void *v3;
  int64_t v4;
  int64_t v6;

  v6 = 0;
  -[NSMutableArray valueForKey:](self->_assetResources, "valueForKey:", CFSTR("type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHAssetResourceBag supportsAssetResourceTypes:mediaType:importedBy:](PHAssetResourceBag, "supportsAssetResourceTypes:mediaType:importedBy:", v3, &v6, (__int16)-[PHAssetCreationRequest importedBy](self, "importedBy"));
  v4 = v6;

  return v4;
}

- (void)setImportedBy:(int64_t)a3
{
  void *v5;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  self->_importedBy = a3;
}

- (void)setImportSessionID:(id)a3
{
  NSString *v4;
  void *v5;
  NSString *importSessionID;

  v4 = (NSString *)a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  importSessionID = self->_importSessionID;
  self->_importSessionID = v4;

}

- (void)setConversationID:(id)a3
{
  NSString *v4;
  void *v5;
  NSString *conversationID;

  v4 = (NSString *)a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  conversationID = self->_conversationID;
  self->_conversationID = v4;

}

- (void)setImportedByBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *importedByBundleIdentifier;

  v4 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  v6 = (NSString *)objc_msgSend(v4, "copy");
  importedByBundleIdentifier = self->_importedByBundleIdentifier;
  self->_importedByBundleIdentifier = v6;

}

- (void)setCustomAssetProperties:(id)a3
{
  NSDictionary *v4;
  void *v5;
  NSDictionary *customAssetProperties;

  v4 = (NSDictionary *)a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  customAssetProperties = self->_customAssetProperties;
  self->_customAssetProperties = v4;

}

- (PHAssetCreationRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8;
  id v9;
  PHAssetCreationRequest *v10;
  void *v11;
  NSMutableArray *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  PHExternalAssetResource *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  NSMutableArray *assetResources;
  void *v26;
  const __CFDictionary *v27;
  __int128 v28;
  PHRelationshipChangeRequestHelper *v29;
  void *v30;
  uint64_t v31;
  PHRelationshipChangeRequestHelper *momentShareHelper;
  void *v33;
  uint64_t v34;
  NSString *importSessionID;
  uint64_t v36;
  NSString *conversationID;
  int64_t int64;
  PHAssetCreationAdjustmentBakeInOptions *v39;
  PHAssetCreationAdjustmentBakeInOptions *adjustmentBakeInOptions;
  PHAssetCreationMetadataCopyOptions *v41;
  PHAssetCreationMetadataCopyOptions *metadataCopyOptions;
  PHAssetCreationCameraIngestOptions *v43;
  PHAssetCreationCameraIngestOptions *cameraIngestOptions;
  uint64_t v45;
  NSString *importedByBundleIdentifier;
  uint64_t v47;
  NSString *syndicationIdentifier;
  uint64_t v49;
  NSDictionary *customAssetProperties;
  void *v51;
  void *v52;
  _BOOL8 value;
  uint64_t v54;
  NSNumber *assetExistsWithSyndicationIdentifier;
  uint64_t v56;
  NSString *resourceHoldingDirectoryPath;
  PHAssetCreationRequest *v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  CMTime v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  objc_super v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v69.receiver = self;
  v69.super_class = (Class)PHAssetCreationRequest;
  v10 = -[PHAssetChangeRequest initWithXPCDict:request:clientAuthorization:](&v69, sel_initWithXPCDict_request_clientAuthorization_, v8, v9, a5);
  if (v10)
  {
    PLArrayFromXPCDictionary();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PLDictionaryFromXPCDictionary();
    v62 = v11;
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v59 = v10;
      v60 = v9;
      v61 = v8;
      v12 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      v13 = v11;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v66;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v66 != v16)
              objc_enumerationMutation(v13);
            v18 = -[PHExternalAssetResource initWithPropertyListRepresentation:]([PHExternalAssetResource alloc], "initWithPropertyListRepresentation:", *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i));
            -[PHExternalAssetResource fileURL](v18, "fileURL");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "path");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "objectForKeyedSubscript:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (v21)
            {
              v22 = objc_alloc(MEMORY[0x1E0D732D0]);
              -[PHExternalAssetResource fileURL](v18, "fileURL");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = (void *)objc_msgSend(v22, "initWithURL:sandboxExtensionToken:consume:", v23, v21, 1);

              -[PHExternalAssetResource setFileURL:](v18, "setFileURL:", v24);
            }
            -[NSMutableArray addObject:](v12, "addObject:", v18, v59);

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
        }
        while (v15);
      }

      v10 = v59;
      assetResources = v59->_assetResources;
      v59->_assetResources = v12;

      v9 = v60;
      v8 = v61;
    }
    PLStringFromXPCDictionary();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_storeStrong((id *)&v10->_duplicateAssetIdentifier, v26);
      v10->_duplicateLivePhotoAsStill = xpc_dictionary_get_BOOL(v8, "duplicateLivePhotoAsStill");
    }
    v10->_duplicateAssetPhotoLibraryType = xpc_dictionary_get_int64(v8, "duplicateAssetPhotoLibraryType");
    PLDictionaryFromXPCDictionary();
    v27 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CMTimeMakeFromDictionary(&v64, v27);
    v28 = *(_OWORD *)&v64.value;
    v10->_duplicateStillSourceTime.epoch = v64.epoch;
    *(_OWORD *)&v10->_duplicateStillSourceTime.value = v28;
    v10->_duplicateAsOriginal = xpc_dictionary_get_BOOL(v8, "duplicateAsOriginal");
    v10->_duplicateAsAlternateAsset = xpc_dictionary_get_BOOL(v8, "duplicateAsAlternateAsset");
    v10->_createAsCompanionSyncedAsset = xpc_dictionary_get_BOOL(v8, "createAsCompanionSyncedAsset");
    v10->_bundleScope = xpc_dictionary_get_int64(v8, "bundleScope");
    if (xpc_dictionary_get_BOOL(v8, "createScreenshot"))
      -[PHAssetCreationRequest _setShouldCreateScreenshot:](v10, "_setShouldCreateScreenshot:", 1);
    if (xpc_dictionary_get_BOOL(v8, "useAutomaticallyGeneratedOriginalFilename"))
      -[PHAssetCreationRequest _setShouldUseAutomaticallyGeneratedOriginalFilename:](v10, "_setShouldUseAutomaticallyGeneratedOriginalFilename:", 1);
    objc_msgSend(v9, "recordInsertRequest:", v10, v59);
    v29 = [PHRelationshipChangeRequestHelper alloc];
    -[PHChangeRequest helper](v10, "helper");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:](v29, "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("momentShare"), v8, v30);
    momentShareHelper = v10->_momentShareHelper;
    v10->_momentShareHelper = (PHRelationshipChangeRequestHelper *)v31;

    PLStringFromXPCDictionary();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
      objc_storeStrong((id *)&v10->_momentShareUUID, v33);
    PLStringFromXPCDictionary();
    v34 = objc_claimAutoreleasedReturnValue();
    importSessionID = v10->_importSessionID;
    v10->_importSessionID = (NSString *)v34;

    PLStringFromXPCDictionary();
    v36 = objc_claimAutoreleasedReturnValue();
    conversationID = v10->_conversationID;
    v10->_conversationID = (NSString *)v36;

    int64 = xpc_dictionary_get_int64(v8, "importedBy");
    v10->_importedBy = int64;
    -[PHChangeRequest setShouldPerformConcurrentWork:](v10, "setShouldPerformConcurrentWork:", int64 == 5);
    v10->_duplicateSinglePhotoFromBurst = xpc_dictionary_get_BOOL(v8, "duplicateSinglePhotoFromBurst");
    v39 = -[PHAssetCreationAdjustmentBakeInOptions initWithXPCDict:]([PHAssetCreationAdjustmentBakeInOptions alloc], "initWithXPCDict:", v8);
    adjustmentBakeInOptions = v10->_adjustmentBakeInOptions;
    v10->_adjustmentBakeInOptions = v39;

    v41 = -[PHAssetCreationMetadataCopyOptions initWithXPCDict:]([PHAssetCreationMetadataCopyOptions alloc], "initWithXPCDict:", v8);
    metadataCopyOptions = v10->_metadataCopyOptions;
    v10->_metadataCopyOptions = v41;

    v43 = -[PHAssetCreationCameraIngestOptions initWithXPCDict:]([PHAssetCreationCameraIngestOptions alloc], "initWithXPCDict:", v8);
    cameraIngestOptions = v10->_cameraIngestOptions;
    v10->_cameraIngestOptions = v43;

    PLStringFromXPCDictionary();
    v45 = objc_claimAutoreleasedReturnValue();
    importedByBundleIdentifier = v10->_importedByBundleIdentifier;
    v10->_importedByBundleIdentifier = (NSString *)v45;

    PLStringFromXPCDictionary();
    v47 = objc_claimAutoreleasedReturnValue();
    syndicationIdentifier = v10->_syndicationIdentifier;
    v10->_syndicationIdentifier = (NSString *)v47;

    PLDictionaryFromXPCDictionary();
    v49 = objc_claimAutoreleasedReturnValue();
    customAssetProperties = v10->_customAssetProperties;
    v10->_customAssetProperties = (NSDictionary *)v49;

    xpc_dictionary_get_value(v8, "assetExistsWithSyndicationIdentifier");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v51;
    if (v51)
    {
      value = xpc_BOOL_get_value(v51);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", value);
      v54 = objc_claimAutoreleasedReturnValue();
      assetExistsWithSyndicationIdentifier = v10->_assetExistsWithSyndicationIdentifier;
      v10->_assetExistsWithSyndicationIdentifier = (NSNumber *)v54;

      if (value)
        v10->_assetExistingWithSyndicationIdentifierIsTrashed = xpc_dictionary_get_BOOL(v8, "assetExistingWithSyndicationIdentifierIsTrashed");
    }
    PLStringFromXPCDictionary();
    v56 = objc_claimAutoreleasedReturnValue();
    resourceHoldingDirectoryPath = v10->_resourceHoldingDirectoryPath;
    v10->_resourceHoldingDirectoryPath = (NSString *)v56;

  }
  return v10;
}

- (void)encodeToXPCDict:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CFDictionaryRef v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int64_t importedBy;
  void *v24;
  void *v25;
  void *v26;
  NSNumber *assetExistsWithSyndicationIdentifier;
  NSString *resourceHoldingDirectoryPath;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  char v33;
  id v34;
  NSObject *v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  objc_super v44;
  CMTime time;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)PHAssetCreationRequest;
  -[PHAssetChangeRequest encodeToXPCDict:](&v44, sel_encodeToXPCDict_, v4);
  if (self->_assetResources)
  {
    v36 = v4;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_assetResources, "count"));
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSMutableArray count](self->_assetResources, "count"));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v6 = self->_assetResources;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v41 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(v11, "propertyListRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

          objc_msgSend(v11, "fileURL");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v11, "fileURL");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "path");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v11, "creationOptions");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "shouldMoveFile");

            PLGetSandboxExtensionToken();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "setObject:forKeyedSubscript:", v17, v15);

          }
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      }
      while (v8);
    }

    v4 = v36;
    PLXPCDictionarySetArray();
    PLXPCDictionarySetDictionary();

  }
  if (self->_duplicateAssetIdentifier)
  {
    PLXPCDictionarySetString();
    xpc_dictionary_set_BOOL(v4, "duplicateLivePhotoAsStill", self->_duplicateLivePhotoAsStill);
  }
  xpc_dictionary_set_int64(v4, "duplicateAssetPhotoLibraryType", self->_duplicateAssetPhotoLibraryType);
  xpc_dictionary_set_BOOL(v4, "duplicateAsOriginal", self->_duplicateAsOriginal);
  xpc_dictionary_set_BOOL(v4, "duplicateAsAlternateAsset", self->_duplicateAsAlternateAsset);
  xpc_dictionary_set_BOOL(v4, "createAsCompanionSyncedAsset", self->_createAsCompanionSyncedAsset);
  xpc_dictionary_set_int64(v4, "bundleScope", self->_bundleScope);
  if (-[PHAssetCreationRequest _shouldCreateScreenshot](self, "_shouldCreateScreenshot"))
    xpc_dictionary_set_BOOL(v4, "createScreenshot", 1);
  if (-[PHAssetCreationRequest _shouldUseAutomaticallyGeneratedOriginalFilename](self, "_shouldUseAutomaticallyGeneratedOriginalFilename"))
  {
    xpc_dictionary_set_BOOL(v4, "useAutomaticallyGeneratedOriginalFilename", 1);
  }
  if ((self->_duplicateStillSourceTime.flags & 1) != 0)
  {
    time = (CMTime)self->_duplicateStillSourceTime;
    v18 = CMTimeCopyAsDictionary(&time, 0);
    PLXPCDictionarySetDictionary();

  }
  if (self->_momentShare)
  {
    -[PHAssetCreationRequest _mutableMomentShareObjectIDsAndUUIDs](self, "_mutableMomentShareObjectIDsAndUUIDs");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeAllObjects");

    -[PHAssetCreationRequest _mutableMomentShareObjectIDsAndUUIDs](self, "_mutableMomentShareObjectIDsAndUUIDs");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    PLObjectIDOrUUIDFromPHObject(self->_momentShare);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v21);

    -[PHAssetCreationRequest momentShareHelper](self, "momentShareHelper");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "encodeToXPCDict:", v4);

    PLXPCDictionarySetString();
  }
  if (self->_importSessionID)
    PLXPCDictionarySetString();
  if (self->_conversationID)
    PLXPCDictionarySetString();
  importedBy = self->_importedBy;
  if (importedBy)
    xpc_dictionary_set_int64(v4, "importedBy", importedBy);
  if (self->_duplicateSinglePhotoFromBurst)
    xpc_dictionary_set_BOOL(v4, "duplicateSinglePhotoFromBurst", 1);
  if (self->_adjustmentBakeInOptions)
  {
    -[PHAssetCreationRequest adjustmentBakeInOptions](self, "adjustmentBakeInOptions");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "encodeToXPCDict:", v4);

  }
  if (self->_metadataCopyOptions)
  {
    -[PHAssetCreationRequest metadataCopyOptions](self, "metadataCopyOptions");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "encodeToXPCDict:", v4);

  }
  if (self->_cameraIngestOptions)
  {
    -[PHAssetCreationRequest cameraIngestOptions](self, "cameraIngestOptions");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "encodeToXPCDict:", v4);

  }
  if (self->_importedByBundleIdentifier)
    PLXPCDictionarySetString();
  if (self->_syndicationIdentifier)
    PLXPCDictionarySetString();
  if (self->_customAssetProperties)
    PLXPCDictionarySetDictionary();
  assetExistsWithSyndicationIdentifier = self->_assetExistsWithSyndicationIdentifier;
  if (assetExistsWithSyndicationIdentifier)
  {
    xpc_dictionary_set_BOOL(v4, "assetExistsWithSyndicationIdentifier", -[NSNumber BOOLValue](assetExistsWithSyndicationIdentifier, "BOOLValue"));
    if (-[NSNumber BOOLValue](self->_assetExistsWithSyndicationIdentifier, "BOOLValue"))
      xpc_dictionary_set_BOOL(v4, "assetExistingWithSyndicationIdentifierIsTrashed", self->_assetExistingWithSyndicationIdentifierIsTrashed);
  }
  if (self->_resourceHoldingDirectoryPath)
  {
    PLXPCDictionarySetString();
    resourceHoldingDirectoryPath = self->_resourceHoldingDirectoryPath;
    if (resourceHoldingDirectoryPath)
    {
      objc_msgSend(CFSTR("XPCDict"), "stringByAppendingPathExtension:", CFSTR("plist"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSString stringByAppendingPathComponent:](resourceHoldingDirectoryPath, "stringByAppendingPathComponent:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v39 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v39);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v39;
      if (v31)
      {
        v38 = 0;
        v33 = objc_msgSend(v31, "writeToFile:options:error:", v30, 1, &v38);
        v34 = v38;
        if ((v33 & 1) == 0)
        {
          PLPhotoKitGetLog();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            LODWORD(time.value) = 138412546;
            *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v30;
            LOWORD(time.flags) = 2112;
            *(_QWORD *)((char *)&time.flags + 2) = v34;
            _os_log_impl(&dword_1991EC000, v35, OS_LOG_TYPE_ERROR, "Unable to write out XPC dict to holding path %@: %@", (uint8_t *)&time, 0x16u);
          }

        }
      }

    }
  }

}

- (id)duplicatedAssetResourcesFromAsset:(id)a3 stillSourceTime:(id *)a4 flattenLivePhotoIntoStillPhoto:(BOOL)a5 duplicateAsOriginal:(BOOL)a6 duplicateWithAdjustmentsBakedIn:(BOOL)a7 duplicatePhotoAsData:(BOOL)a8 error:(id *)a9
{
  id v13;
  __int128 v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int64_t v20;
  CGImage *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFData *v27;
  __CFString *v28;
  CGImageDestination *v29;
  PHExternalAssetResource *v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  void *v42;
  PHExternalAssetResource *v43;
  void *v44;
  id v45;
  void *v47;
  void *v48;
  __CFData *v49;
  void *v50;
  void *v51;
  __int128 v52;
  const __CFDictionary *v53;
  void *v55;
  void *v57;
  void *v58;
  void *v60;
  _QWORD v61[5];
  __int128 v62;
  int64_t v63;
  uint64_t v64;
  _QWORD v65[4];
  NSObject *v66;
  id v67;
  _QWORD v68[5];
  id v69;
  uint64_t *v70;
  uint64_t *v71;
  uint64_t *v72;
  __int128 v73;
  int64_t var3;
  BOOL v75;
  BOOL v76;
  BOOL v77;
  BOOL v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t (*v92)(uint64_t, uint64_t);
  void (*v93)(uint64_t);
  id v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  _QWORD v98[3];

  v98[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  +[PHAssetResource assetResourcesForAsset:includeDerivatives:includeMetadata:includeAdjustmentOverflowDataBlob:](PHAssetResource, "assetResourcesForAsset:includeDerivatives:includeMetadata:includeAdjustmentOverflowDataBlob:", v13, 0, 0, 1);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = 0;
  v90 = &v89;
  v91 = 0x3032000000;
  v92 = __Block_byref_object_copy__13099;
  v93 = __Block_byref_object_dispose__13100;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v94 = (id)objc_claimAutoreleasedReturnValue();
  v85 = 0;
  v86 = &v85;
  v87 = 0x2020000000;
  v88 = 0x7FFFFFFFFFFFFFFFLL;
  v79 = 0;
  v80 = &v79;
  v81 = 0x3032000000;
  v82 = __Block_byref_object_copy__13099;
  v83 = __Block_byref_object_dispose__13100;
  v84 = 0;
  v68[0] = MEMORY[0x1E0C809B0];
  v68[1] = 3221225472;
  v68[2] = __186__PHAssetCreationRequest_duplicatedAssetResourcesFromAsset_stillSourceTime_flattenLivePhotoIntoStillPhoto_duplicateAsOriginal_duplicateWithAdjustmentsBakedIn_duplicatePhotoAsData_error___block_invoke;
  v68[3] = &unk_1E35D8C30;
  v14 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  v73 = v14;
  v75 = a7;
  v76 = a5;
  v77 = a6;
  v78 = a8;
  v70 = &v85;
  v68[4] = self;
  v15 = v13;
  v69 = v15;
  v71 = &v89;
  v72 = &v79;
  objc_msgSend(v58, "enumerateObjectsUsingBlock:", v68);
  if (a9)
  {
    v16 = (void *)v80[5];
    if (v16)
      *a9 = objc_retainAutorelease(v16);
  }
  if ((a4->var2 & 1) != 0)
  {
    if ((objc_msgSend(v15, "isPhotoIris") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetCreationRequest.m"), 4057, CFSTR("Can't extract a still image from the video complement when duplicating a non-iris asset"));

    }
    if (v86[3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetCreationRequest.m"), 4058, CFSTR("Can't extract a still image without a video complement"));

    }
    objc_msgSend(v58, "objectAtIndexedSubscript:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "privateFileURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v17;
    objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", v18);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C8AFC8], "assetImageGeneratorWithAsset:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = *MEMORY[0x1E0CA2E68];
    v52 = v62;
    v63 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    v20 = v63;
    objc_msgSend(v19, "setRequestedTimeToleranceBefore:", &v62);
    v62 = v52;
    v63 = v20;
    objc_msgSend(v19, "setRequestedTimeToleranceAfter:", &v62);
    objc_msgSend(v19, "setAppliesPreferredTrackTransform:", 1);
    v67 = 0;
    v62 = *(_OWORD *)&a4->var0;
    v63 = a4->var3;
    v21 = (CGImage *)objc_msgSend(MEMORY[0x1E0D75130], "copyCGImageFromImageGenerator:atTime:actualTime:error:", v19, &v62, 0, &v67);
    v22 = v67;
    if (v21)
    {
      objc_msgSend(v18, "path");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      PFVideoComplementMetadataForVideoAtPath();
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v97 = *MEMORY[0x1E0CBCF70];
      v95 = *MEMORY[0x1E0C89C70];
      objc_msgSend(v24, "pairingIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v98[0] = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, &v97, 1);
      v53 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DF0], "data");
      v27 = (__CFData *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v29 = CGImageDestinationCreateWithData(v27, v28, 1uLL, 0);

      CGImageDestinationAddImage(v29, v21, v53);
      CGImageDestinationFinalize(v29);
      v30 = -[PHExternalAssetResource initWithResourceType:]([PHExternalAssetResource alloc], "initWithResourceType:", 1);
      -[PHExternalAssetResource setPixelWidth:](v30, "setPixelWidth:", CGImageGetWidth(v21));
      -[PHExternalAssetResource setPixelHeight:](v30, "setPixelHeight:", CGImageGetHeight(v21));
      -[PHExternalAssetResource setData:](v30, "setData:", v27);
      objc_msgSend((id)v90[5], "addObject:", v30);
      CGImageRelease(v21);
      CFRelease(v29);
      if (!a5)
      {
        v31 = dispatch_group_create();
        v32 = objc_alloc(MEMORY[0x1E0D75088]);
        v62 = *(_OWORD *)&a4->var0;
        v63 = a4->var3;
        v57 = (void *)objc_msgSend(v32, "initWithAsset:stillImageTime:", v55, &v62);
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "UUIDString");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "stringByAppendingPathExtension:", CFSTR("mov"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        NSTemporaryDirectory();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "stringByAppendingPathComponent:", v60);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        v49 = v27;
        v36 = v18;
        v37 = v22;
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v50);
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = MEMORY[0x1E0C809B0];
        v40 = (void *)v38;
        dispatch_group_enter(v31);
        v65[0] = v39;
        v65[1] = 3221225472;
        v65[2] = __186__PHAssetCreationRequest_duplicatedAssetResourcesFromAsset_stillSourceTime_flattenLivePhotoIntoStillPhoto_duplicateAsOriginal_duplicateWithAdjustmentsBakedIn_duplicatePhotoAsData_error___block_invoke_2;
        v65[3] = &unk_1E35DC1B0;
        v41 = v31;
        v66 = v41;
        objc_msgSend(v57, "writeToURL:progress:completion:", v40, 0, v65);
        dispatch_group_wait(v41, 0xFFFFFFFFFFFFFFFFLL);
        *(_QWORD *)&v62 = 0;
        *((_QWORD *)&v62 + 1) = &v62;
        v63 = 0x2020000000;
        v64 = 0x7FFFFFFFFFFFFFFFLL;
        v42 = (void *)v90[5];
        v61[0] = v39;
        v61[1] = 3221225472;
        v61[2] = __186__PHAssetCreationRequest_duplicatedAssetResourcesFromAsset_stillSourceTime_flattenLivePhotoIntoStillPhoto_duplicateAsOriginal_duplicateWithAdjustmentsBakedIn_duplicatePhotoAsData_error___block_invoke_3;
        v61[3] = &unk_1E35D8C58;
        v61[4] = &v62;
        objc_msgSend(v42, "enumerateObjectsUsingBlock:", v61);
        v22 = v37;
        if (*(_QWORD *)(*((_QWORD *)&v62 + 1) + 24) == 0x7FFFFFFFFFFFFFFFLL)
        {
          v43 = (PHExternalAssetResource *)v90[5];
          v90[5] = 0;
          v18 = v36;
        }
        else
        {
          v18 = v36;
          v43 = -[PHExternalAssetResource initWithResourceType:]([PHExternalAssetResource alloc], "initWithResourceType:", 9);
          -[PHExternalAssetResource setFileURL:](v43, "setFileURL:", v40);
          objc_msgSend((id)v90[5], "replaceObjectAtIndex:withObject:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 24), v43);
        }

        v27 = v49;
        _Block_object_dispose(&v62, 8);

      }
    }
    else
    {
      v44 = (void *)v90[5];
      v90[5] = 0;

      if (a9)
        *a9 = objc_retainAutorelease(v22);
    }

  }
  v45 = (id)v90[5];

  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(&v85, 8);
  _Block_object_dispose(&v89, 8);

  return v45;
}

- (void)_updateMutationsForDuplicatingPrivateMetadataFromAsset:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "descriptionProperties");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PHAssetCreationRequest _setDuplicateAllowsPrivateMetadata:](self, "_setDuplicateAllowsPrivateMetadata:", 1);
    -[PHAssetChangeRequest setAssetDescription:](self, "setAssetDescription:", v4);
  }

}

- (BOOL)_populateDuplicatingAssetCreationRequest:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSMutableArray *v10;
  void *v11;
  PHPhotoLibrary *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSMutableArray *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  __CFString *v38;
  __CFString *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  PHAssetCreationRequest *v46;
  void *v47;
  id *location;
  _QWORD v49[5];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  id v56;
  __int128 v57;
  uint64_t v58;
  _BYTE v59[128];
  _QWORD v60[3];

  v60[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  location = (id *)&self->_assetResources;
  v10 = self->_assetResources;
  objc_msgSend(v8, "duplicateAssetIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0uLL;
  v58 = 0;
  if (v8)
    objc_msgSend(v8, "duplicateStillSourceTime");
  v12 = -[PHPhotoLibrary initWithPLPhotoLibrary:type:]([PHPhotoLibrary alloc], "initWithPLPhotoLibrary:type:", v9, self->_duplicateAssetPhotoLibraryType);
  -[PHPhotoLibrary librarySpecificFetchOptions](v12, "librarySpecificFetchOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_duplicateAssetPhotoLibraryType)
  {
    if (self->_duplicateAssetPhotoLibraryType != 1)
      goto LABEL_8;
    v14 = 8;
  }
  else
  {
    v14 = 7;
  }
  objc_msgSend(v13, "setIncludeAssetSourceTypes:", v14);
LABEL_8:
  objc_msgSend(v13, "setIncludeHiddenAssets:", 1);
  objc_msgSend(v13, "setIncludeAllBurstAssets:", 1);
  v60[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHAsset fetchAssetsWithLocalIdentifiers:options:](PHAsset, "fetchAssetsWithLocalIdentifiers:options:", v15, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_duplicateAsAlternateAsset)
  {
    v18 = (void *)-[NSMutableArray mutableCopy](v10, "mutableCopy");
    -[NSMutableArray removeAllObjects](v10, "removeAllObjects");
    if (v17)
      goto LABEL_10;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", CFSTR("Cannot create a copy of missing asset"));
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v18 = 0;
  if (!v17)
    goto LABEL_13;
LABEL_10:
  if (-[NSMutableArray count](v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3300, CFSTR("Cannot copy asset with added resources"));
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_14:
    v20 = (void *)v19;
    v21 = 0;
    goto LABEL_15;
  }
  v46 = self;
  v47 = v18;
  v23 = objc_msgSend(v8, "duplicateSinglePhotoFromBurst");
  v24 = objc_msgSend(v8, "duplicateLivePhotoAsStill");
  if ((_DWORD)v24)
  {
    if ((objc_msgSend(v17, "isPhotoIris") & 1) == 0)
    {
      v36 = (void *)MEMORY[0x1E0CB35C8];
      v37 = objc_msgSend(v17, "mediaType");
      if ((unint64_t)(v37 - 1) > 2)
        v38 = CFSTR("unknown");
      else
        v38 = off_1E35DA708[v37 - 1];
      v39 = v38;
      +[PHAsset descriptionForMediaSubtypes:](PHAsset, "descriptionForMediaSubtypes:", objc_msgSend(v17, "mediaSubtypes"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "ph_errorWithCode:localizedDescription:", 3300, CFSTR("Cannot create still photo from asset type %@/%@, requires live photo"), v39, v40);
      v41 = objc_claimAutoreleasedReturnValue();

      v20 = (void *)v41;
      v21 = 0;
      goto LABEL_42;
    }
    v45 = v13;
    v23 = 1;
  }
  else
  {
    v45 = v13;
  }
  v25 = objc_msgSend(v8, "duplicateAsOriginal");
  v54 = v57;
  v55 = v58;
  v56 = 0;
  -[PHAssetCreationRequest duplicatedAssetResourcesFromAsset:stillSourceTime:flattenLivePhotoIntoStillPhoto:duplicateAsOriginal:duplicateWithAdjustmentsBakedIn:duplicatePhotoAsData:error:](v46, "duplicatedAssetResourcesFromAsset:stillSourceTime:flattenLivePhotoIntoStillPhoto:duplicateAsOriginal:duplicateWithAdjustmentsBakedIn:duplicatePhotoAsData:error:", v17, &v54, v24, v25, 0, v23, &v56);
  v26 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  v27 = v56;

  if (!-[NSMutableArray count](v26, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithUnderlyingError:localizedDescription:", v27, CFSTR("Failed to copy asset resources"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = 0;
    v10 = v26;
    v13 = v45;
LABEL_42:
    v18 = v47;
    goto LABEL_15;
  }
  v44 = v27;
  v18 = v47;
  if (objc_msgSend(v47, "count"))
  {
    v42 = v11;
    v43 = v9;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v28 = v47;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v51;
      v32 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v51 != v31)
            objc_enumerationMutation(v28);
          v34 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
          v49[0] = v32;
          v49[1] = 3221225472;
          v49[2] = __86__PHAssetCreationRequest__populateDuplicatingAssetCreationRequest_photoLibrary_error___block_invoke;
          v49[3] = &unk_1E35D8C80;
          v49[4] = v34;
          v35 = -[NSMutableArray indexOfObjectPassingTest:](v26, "indexOfObjectPassingTest:", v49);
          if (v35 == 0x7FFFFFFFFFFFFFFFLL)
            -[NSMutableArray addObject:](v26, "addObject:", v34);
          else
            -[NSMutableArray replaceObjectAtIndex:withObject:](v26, "replaceObjectAtIndex:withObject:", v35, v34);
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
      }
      while (v30);
    }

    v9 = v43;
    v11 = v42;
    v18 = v47;
  }
  objc_storeStrong(location, v26);
  -[PHAssetCreationRequest _updateMutationsForDuplicatingPrivateMetadataFromAsset:](v46, "_updateMutationsForDuplicatingPrivateMetadataFromAsset:", v17);
  v21 = 1;
  v10 = v26;
  v20 = v44;
  v13 = v45;
LABEL_15:
  if (a5 && v20)
    *a5 = objc_retainAutorelease(v20);

  return v21;
}

- (BOOL)validateInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  _BOOL4 v9;
  id v10;
  void *v11;
  PHAssetResourceBag *v12;
  PHAssetResourceBag *assetResourceBag;
  PHAssetResourceBag *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  BOOL v18;
  id v19;
  void *v21;
  id v22;
  id v23;
  id v24;

  v7 = a3;
  if (self->_assetResourceBag)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetCreationRequest.m"), 4224, CFSTR("expect single call to validate"));

  }
  -[PHAssetCreationRequest duplicateAssetIdentifier](self, "duplicateAssetIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v24 = 0;
    v9 = -[PHAssetCreationRequest _populateDuplicatingAssetCreationRequest:photoLibrary:error:](self, "_populateDuplicatingAssetCreationRequest:photoLibrary:error:", self, v7, &v24);
    v10 = v24;
    if (!v9)
    {
LABEL_12:
      v18 = 0;
      if (!a4)
        goto LABEL_16;
      goto LABEL_13;
    }
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;
  v12 = -[PHAssetResourceBag initWithAssetResources:assetCreationRequest:]([PHAssetResourceBag alloc], "initWithAssetResources:assetCreationRequest:", self->_assetResources, self);
  assetResourceBag = self->_assetResourceBag;
  self->_assetResourceBag = v12;

  v14 = self->_assetResourceBag;
  v23 = v10;
  v15 = -[PHAssetResourceBag validateForInsertIntoPhotoLibrary:error:](v14, "validateForInsertIntoPhotoLibrary:error:", v7, &v23);
  v10 = v23;

  if (!v15)
    goto LABEL_12;
  if (!-[PHAssetChangeRequest didChangeAdjustments](self, "didChangeAdjustments")
    || (-[PHAssetChangeRequest contentEditingOutput](self, "contentEditingOutput"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v16,
        !v16))
  {
    v18 = 1;
    goto LABEL_16;
  }
  -[PHAssetChangeRequest contentEditingOutput](self, "contentEditingOutput");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v10;
  v18 = -[PHAssetChangeRequest validateContentEditingOutput:error:](self, "validateContentEditingOutput:error:", v17, &v22);
  v19 = v22;

  v10 = v19;
  if (!a4)
    goto LABEL_16;
LABEL_13:
  if (!v18)
  {
    v10 = objc_retainAutorelease(v10);
    v18 = 0;
    *a4 = v10;
  }
LABEL_16:

  return v18;
}

- (BOOL)_validateNewObjectUUID:(id)a3 inPhotoLibrary:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  BOOL v11;
  id v12;
  const char *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  int v28;
  int v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  const __CFString *v36;
  uint64_t v37;
  const __CFString *v38;
  id v39[3];
  _BYTE uu[22];
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!-[PHChangeRequest isClientEntitled](self, "isClientEntitled"))
  {
    -[PHAssetCreationRequest assetExistsWithSyndicationIdentifier](self, "assetExistsWithSyndicationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToNumber:", MEMORY[0x1E0C9AAB0]);

    if ((v10 & 1) == 0)
    {
      if (!objc_msgSend(v7, "length")
        || (*(_QWORD *)uu = 0,
            *(_QWORD *)&uu[8] = 0,
            v12 = objc_retainAutorelease(v7),
            (v13 = (const char *)objc_msgSend(v12, "cStringUsingEncoding:", 4)) == 0)
        || uuid_parse(v13, uu))
      {
        PLPhotoKitGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)uu = 138543362;
          *(_QWORD *)&uu[4] = v7;
          _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_ERROR, "Failed to validate malformed UUID '%{public}@'", uu, 0xCu);
        }

        v15 = (void *)MEMORY[0x1E0CB35C8];
        v41 = *MEMORY[0x1E0CB2938];
        v42[0] = CFSTR("Malformed UUID");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3140, v16);
        v17 = (id)objc_claimAutoreleasedReturnValue();

        v11 = 0;
        goto LABEL_10;
      }
      v19 = (void *)MEMORY[0x1E0D71880];
      v39[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "managedObjectContext");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0;
      v22 = objc_msgSend(v19, "countForAssetsWithUUIDs:includePendingChanges:inManagedObjectContext:error:", v20, 1, v21, &v34);
      v17 = v34;

      if (v22)
      {
        if (v22 == 0x7FFFFFFFFFFFFFFFLL)
        {
          PLPhotoKitGetLog();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)uu = 138543618;
            *(_QWORD *)&uu[4] = v12;
            *(_WORD *)&uu[12] = 2112;
            *(_QWORD *)&uu[14] = v17;
            _os_log_impl(&dword_1991EC000, v23, OS_LOG_TYPE_ERROR, "Failed to validate UUID '%{public}@' uniqueness, fetch error %@", uu, 0x16u);
          }

          v24 = (void *)MEMORY[0x1E0CB35C8];
          v37 = *MEMORY[0x1E0CB2938];
          v38 = CFSTR("Unable to check UUID uniqueness");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3140, v25);
          v26 = objc_claimAutoreleasedReturnValue();

LABEL_28:
          v11 = 0;
          v17 = (id)v26;
          goto LABEL_10;
        }
        -[PHAssetCreationCameraIngestOptions jobType](self->_cameraIngestOptions, "jobType");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "isEqualToString:", *MEMORY[0x1E0D74E18]);
        if (v22 == 1)
          v29 = v28;
        else
          v29 = 0;

        if (!v29)
        {
          PLPhotoKitGetLog();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)uu = 138543362;
            *(_QWORD *)&uu[4] = v12;
            _os_log_impl(&dword_1991EC000, v31, OS_LOG_TYPE_ERROR, "UUID '%{public}@' is not unique", uu, 0xCu);
          }

          v32 = (void *)MEMORY[0x1E0CB35C8];
          v35 = *MEMORY[0x1E0CB2938];
          v36 = CFSTR("UUID is not unique");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3140, v33);
          v26 = objc_claimAutoreleasedReturnValue();

          goto LABEL_28;
        }
        PLPhotoKitIngestGetLog();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uu = 0;
          _os_log_impl(&dword_1991EC000, v30, OS_LOG_TYPE_DEFAULT, "Duplicate asset is a timelapse placeholder. Ignoring.", uu, 2u);
        }

      }
      v11 = 1;
LABEL_10:

      goto LABEL_11;
    }
  }
  v11 = 1;
LABEL_11:

  return v11;
}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  _BOOL4 v9;
  id v10;
  void *v11;
  PHAssetResourceBag *assetResourceBag;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!-[PHAssetResourceBag didValidateForInsertion](self->_assetResourceBag, "didValidateForInsertion"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetCreationRequest.m"), 4310, CFSTR("expect prior validation"));

  }
  if (!-[PHAssetResourceBag isValid](self->_assetResourceBag, "isValid"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetCreationRequest.m"), 4311, CFSTR("expect validated asset resources upon asset creation"));

  }
  if (-[PHAssetResourceBag isValid](self->_assetResourceBag, "isValid"))
  {
    -[PHChangeRequest uuid](self, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v9 = -[PHAssetCreationRequest _validateNewObjectUUID:inPhotoLibrary:error:](self, "_validateNewObjectUUID:inPhotoLibrary:error:", v8, v7, &v26);
    v10 = v26;
    v11 = v10;
    if (v9)
    {
      assetResourceBag = self->_assetResourceBag;
      v25 = v10;
      -[PHAssetCreationRequest createAssetFromValidatedResources:withUUID:assetAlreadyExistsAsPlaceholder:inPhotoLibrary:error:](self, "createAssetFromValidatedResources:withUUID:assetAlreadyExistsAsPlaceholder:inPhotoLibrary:error:", assetResourceBag, v8, 0, v7, &v25);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v25;

      if (v13)
      {
        -[PHAssetCreationRequest _setModificationDateOnAsset:](self, "_setModificationDateOnAsset:", v13);
        -[PHAssetCreationRequest _setCaptureSessionIdentifierOnAsset:](self, "_setCaptureSessionIdentifierOnAsset:", v13);
        -[PHAssetCreationRequest _tracePhotoKitAssetCreationWithUUID:](self, "_tracePhotoKitAssetCreationWithUUID:", v8);
LABEL_18:

        goto LABEL_19;
      }
      PLPhotoKitGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v14;
        _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_ERROR, "Unable to create asset from validated resources: %@", buf, 0xCu);
      }

      v16 = (void *)MEMORY[0x1E0CB35C8];
      -[PHAssetResourceBag primaryResource](self->_assetResourceBag, "primaryResource");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "fileURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lastPathComponent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "ph_genericErrorWithLocalizedDescription:", CFSTR("Failed to create asset for resource: %@"), v20);
      v21 = objc_claimAutoreleasedReturnValue();

      v14 = (id)v21;
      if (!a4)
      {
LABEL_17:
        v13 = 0;
        goto LABEL_18;
      }
    }
    else
    {
      v14 = v10;
      if (!a4)
        goto LABEL_17;
    }
    v14 = objc_retainAutorelease(v14);
    v13 = 0;
    *a4 = v14;
    goto LABEL_18;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3302, CFSTR("Unable to create asset from invalid resources"));
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
LABEL_19:

  return v13;
}

- (void)_setModificationDateOnAsset:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PHAssetChangeRequest modificationDate](self, "modificationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v5, "setModificationDate:", v4);

}

- (void)_setCaptureSessionIdentifierOnAsset:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PHAssetCreationRequest _captureSessionIdentifier](self, "_captureSessionIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "isEqualToString:", &stru_1E35DFFF8);

    if ((v7 & 1) == 0)
    {
      PLPhotoKitGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "uuidDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412546;
        v11 = v9;
        v12 = 2112;
        v13 = v6;
        _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_DEFAULT, "Capture Session: Setting session identifier of new asset %@: %@", (uint8_t *)&v10, 0x16u);

      }
      objc_msgSend(v4, "setCaptureSessionIdentifier:", v6);
    }
  }

}

- (id)_captureSessionIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  -[PHChangeRequest helper](self, "helper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientAuthorization");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "captureSessionState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v7, "sessionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    v9 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    if (v11)
    {
      objc_msgSend(v11, "sessionIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (void)_tracePhotoKitAssetCreationWithUUID:(id)a3
{
  PLStringUUIDComponents();
  kdebug_trace();
}

- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v17;
  objc_super v18;
  id v19;

  v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PHAssetCreationRequest;
  v19 = 0;
  LODWORD(v9) = -[PHAssetChangeRequest applyMutationsToManagedObject:photoLibrary:error:](&v18, sel_applyMutationsToManagedObject_photoLibrary_error_, v8, a4, &v19);
  v10 = v19;
  -[PHAssetCreationRequest momentShareHelper](self, "momentShareHelper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((_DWORD)v9)
  {
    objc_msgSend(v11, "mutableObjectIDsAndUUIDs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (!v14)
    {

      LOBYTE(v9) = 1;
      goto LABEL_8;
    }
    objc_msgSend(v12, "setAllowsInsert:", 1);
    +[PHMomentShare managedEntityName](PHMomentShare, "managedEntityName");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDestinationEntityName:", v9);

    v17 = v10;
    LOBYTE(v9) = objc_msgSend(v12, "applyMutationsToManagedObjectToOneRelationship:error:", v8, &v17);
    v15 = v17;

    v10 = v15;
  }

  if (a5 && (v9 & 1) == 0)
  {
    v10 = objc_retainAutorelease(v10);
    LOBYTE(v9) = 0;
    *a5 = v10;
  }
LABEL_8:

  return v9;
}

- (void)performTransactionCompletionHandlingInPhotoLibrary:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[PHAssetCreationRequest _limitedLibraryFetchFilterObjectID](self, "_limitedLibraryFetchFilterObjectID", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0D71F00];
    -[PHAssetCreationRequest _limitedLibraryFetchFilterObjectID](self, "_limitedLibraryFetchFilterObjectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0D71F08];
    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clientBundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:userInfo:", v6, v7, v10);

  }
}

- (void)_prepareMomentShareHelperIfNeeded
{
  void *v3;
  void *v4;
  PHRelationshipChangeRequestHelper *momentShareHelper;
  void *v6;
  id v7;

  -[PHRelationshipChangeRequestHelper originalObjectIDs](self->_momentShareHelper, "originalObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[PHRelationshipChangeRequestHelper setOriginalObjectIDs:](self->_momentShareHelper, "setOriginalObjectIDs:", MEMORY[0x1E0C9AA60]);
  -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_momentShareHelper, "mutableObjectIDsAndUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    momentShareHelper = self->_momentShareHelper;
    -[PHRelationshipChangeRequestHelper originalObjectIDs](momentShareHelper, "originalObjectIDs");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v7, "mutableCopy");
    -[PHRelationshipChangeRequestHelper setMutableObjectIDsAndUUIDs:](momentShareHelper, "setMutableObjectIDsAndUUIDs:", v6);

  }
}

- (id)_mutableMomentShareObjectIDsAndUUIDs
{
  -[PHAssetCreationRequest _prepareMomentShareHelperIfNeeded](self, "_prepareMomentShareHelperIfNeeded");
  return -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_momentShareHelper, "mutableObjectIDsAndUUIDs");
}

- (PHMomentShare)momentShare
{
  return self->_momentShare;
}

- (void)setMomentShare:(id)a3
{
  NSString *v5;
  NSString *momentShareUUID;
  id v7;

  objc_storeStrong((id *)&self->_momentShare, a3);
  v7 = a3;
  objc_msgSend(v7, "uuid");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  momentShareUUID = self->_momentShareUUID;
  self->_momentShareUUID = v5;

}

- (BOOL)isNew
{
  return 1;
}

- (void)_setDuplicateAllowsPrivateMetadata:(BOOL)a3
{
  self->_duplicateAllowsPrivateMetadata = a3;
}

- (BOOL)duplicateAllowsPrivateMetadata
{
  return self->_duplicateAllowsPrivateMetadata;
}

- (void)_setShouldCreateScreenshot:(BOOL)a3
{
  self->_shouldCreateScreenshot = a3;
}

- (BOOL)_shouldCreateScreenshot
{
  return self->_shouldCreateScreenshot;
}

- (void)_setShouldUseAutomaticallyGeneratedOriginalFilename:(BOOL)a3
{
  self->_shouldUseAutomaticallyGeneratedOriginalFilename = a3;
}

- (BOOL)_shouldUseAutomaticallyGeneratedOriginalFilename
{
  return self->_shouldUseAutomaticallyGeneratedOriginalFilename;
}

- (BOOL)isDuplicateAssetCreationRequest
{
  void *v2;
  BOOL v3;

  -[PHAssetCreationRequest duplicateAssetIdentifier](self, "duplicateAssetIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (int64_t)accessScopeOptionsRequirement
{
  if (-[PHAssetCreationRequest isDuplicateAssetCreationRequest](self, "isDuplicateAssetCreationRequest"))
    return 7;
  else
    return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  NSMutableArray *v7;
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
  void *v19;
  void *v20;
  NSString *duplicateAssetIdentifier;
  void *v22;
  _BOOL8 duplicateLivePhotoAsStill;
  void *v24;
  uint64_t duplicateAssetPhotoLibraryType;
  void *v26;
  _BOOL8 duplicateAsOriginal;
  void *v28;
  _BOOL8 duplicateAsAlternateAsset;
  void *v30;
  _BOOL8 createAsCompanionSyncedAsset;
  void *v32;
  _BOOL8 shouldCreateScreenshot;
  void *v34;
  _BOOL8 shouldUseAutomaticallyGeneratedOriginalFilename;
  void *v36;
  CFDictionaryRef v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSString *momentShareUUID;
  void *v43;
  NSString *importSessionID;
  void *v45;
  NSString *conversationID;
  void *v47;
  int64_t importedBy;
  void *v49;
  _BOOL8 duplicateSinglePhotoFromBurst;
  void *v51;
  PHAssetCreationAdjustmentBakeInOptions *adjustmentBakeInOptions;
  void *v53;
  PHAssetCreationMetadataCopyOptions *metadataCopyOptions;
  void *v55;
  NSString *importedByBundleIdentifier;
  void *v57;
  NSString *syndicationIdentifier;
  void *v59;
  NSDictionary *customAssetProperties;
  void *v61;
  NSNumber *assetExistsWithSyndicationIdentifier;
  void *v63;
  _BOOL8 assetExistingWithSyndicationIdentifierIsTrashed;
  void *v65;
  NSString *resourceHoldingDirectoryPath;
  void *v67;
  PHAssetCreationRequest *v68;
  void *v69;
  CMTime time;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  objc_super v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v75.receiver = self;
  v75.super_class = (Class)PHAssetCreationRequest;
  -[PHAssetChangeRequest encodeWithCoder:](&v75, sel_encodeWithCoder_, v4);
  v5 = 0x1E0CB3000;
  if (self->_assetResources)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_assetResources, "count"));
    v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSMutableArray count](self->_assetResources, "count"));
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v68 = self;
    v7 = self->_assetResources;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v72 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
          objc_msgSend(v12, "propertyListRepresentation");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v13);

          objc_msgSend(v12, "fileURL");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            objc_msgSend(v12, "fileURL");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "path");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v12, "creationOptions");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "shouldMoveFile");

            PLGetSandboxExtensionToken();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "setObject:forKeyedSubscript:", v18, v16);

          }
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
      }
      while (v9);
    }

    v5 = 0x1E0CB3000uLL;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "assetResources");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v6, v19);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "sandboxExtensionTokens");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v69, v20);

    self = v68;
  }
  duplicateAssetIdentifier = self->_duplicateAssetIdentifier;
  objc_msgSend(*(id *)(v5 + 2368), "stringWithUTF8String:", "duplicateAssetIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", duplicateAssetIdentifier, v22);

  duplicateLivePhotoAsStill = self->_duplicateLivePhotoAsStill;
  objc_msgSend(*(id *)(v5 + 2368), "stringWithUTF8String:", "duplicateLivePhotoAsStill");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", duplicateLivePhotoAsStill, v24);

  duplicateAssetPhotoLibraryType = self->_duplicateAssetPhotoLibraryType;
  objc_msgSend(*(id *)(v5 + 2368), "stringWithUTF8String:", "duplicateAssetPhotoLibraryType");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", duplicateAssetPhotoLibraryType, v26);

  duplicateAsOriginal = self->_duplicateAsOriginal;
  objc_msgSend(*(id *)(v5 + 2368), "stringWithUTF8String:", "duplicateAsOriginal");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", duplicateAsOriginal, v28);

  duplicateAsAlternateAsset = self->_duplicateAsAlternateAsset;
  objc_msgSend(*(id *)(v5 + 2368), "stringWithUTF8String:", "duplicateAsAlternateAsset");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", duplicateAsAlternateAsset, v30);

  createAsCompanionSyncedAsset = self->_createAsCompanionSyncedAsset;
  objc_msgSend(*(id *)(v5 + 2368), "stringWithUTF8String:", "createAsCompanionSyncedAsset");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", createAsCompanionSyncedAsset, v32);

  shouldCreateScreenshot = self->_shouldCreateScreenshot;
  objc_msgSend(*(id *)(v5 + 2368), "stringWithUTF8String:", "createScreenshot");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", shouldCreateScreenshot, v34);

  shouldUseAutomaticallyGeneratedOriginalFilename = self->_shouldUseAutomaticallyGeneratedOriginalFilename;
  objc_msgSend(*(id *)(v5 + 2368), "stringWithUTF8String:", "useAutomaticallyGeneratedOriginalFilename");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", shouldUseAutomaticallyGeneratedOriginalFilename, v36);

  if ((self->_duplicateStillSourceTime.flags & 1) != 0)
  {
    time = (CMTime)self->_duplicateStillSourceTime;
    v37 = CMTimeCopyAsDictionary(&time, 0);
    objc_msgSend(*(id *)(v5 + 2368), "stringWithUTF8String:", "duplicateLivePhotoStillTimeKey");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v37, v38);

  }
  if (self->_momentShare)
  {
    -[PHAssetCreationRequest momentShareHelper](self, "momentShareHelper");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAssetCreationRequest momentShareHelper](self, "momentShareHelper");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "relationshipName");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v39, v41);

    momentShareUUID = self->_momentShareUUID;
    objc_msgSend(*(id *)(v5 + 2368), "stringWithUTF8String:", "momentShareUUID");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", momentShareUUID, v43);

  }
  importSessionID = self->_importSessionID;
  objc_msgSend(*(id *)(v5 + 2368), "stringWithUTF8String:", "importSessionID");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", importSessionID, v45);

  conversationID = self->_conversationID;
  objc_msgSend(*(id *)(v5 + 2368), "stringWithUTF8String:", "conversationID");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", conversationID, v47);

  importedBy = self->_importedBy;
  if (importedBy)
  {
    objc_msgSend(*(id *)(v5 + 2368), "stringWithUTF8String:", "importedBy");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeInteger:forKey:", importedBy, v49);

  }
  duplicateSinglePhotoFromBurst = self->_duplicateSinglePhotoFromBurst;
  objc_msgSend(*(id *)(v5 + 2368), "stringWithUTF8String:", "duplicateSinglePhotoFromBurst");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", duplicateSinglePhotoFromBurst, v51);

  adjustmentBakeInOptions = self->_adjustmentBakeInOptions;
  objc_msgSend(*(id *)(v5 + 2368), "stringWithUTF8String:", "adjustmentBakeInOptions");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", adjustmentBakeInOptions, v53);

  metadataCopyOptions = self->_metadataCopyOptions;
  objc_msgSend(*(id *)(v5 + 2368), "stringWithUTF8String:", "metadataCopyOptions");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", metadataCopyOptions, v55);

  importedByBundleIdentifier = self->_importedByBundleIdentifier;
  objc_msgSend(*(id *)(v5 + 2368), "stringWithUTF8String:", "importedByBundleIdentifier");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", importedByBundleIdentifier, v57);

  syndicationIdentifier = self->_syndicationIdentifier;
  objc_msgSend(*(id *)(v5 + 2368), "stringWithUTF8String:", "syndicationIdentifier");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", syndicationIdentifier, v59);

  customAssetProperties = self->_customAssetProperties;
  objc_msgSend(*(id *)(v5 + 2368), "stringWithUTF8String:", "customAssetProperties");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", customAssetProperties, v61);

  assetExistsWithSyndicationIdentifier = self->_assetExistsWithSyndicationIdentifier;
  objc_msgSend(*(id *)(v5 + 2368), "stringWithUTF8String:", "assetExistsWithSyndicationIdentifier");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", assetExistsWithSyndicationIdentifier, v63);

  if (-[NSNumber BOOLValue](self->_assetExistsWithSyndicationIdentifier, "BOOLValue"))
  {
    assetExistingWithSyndicationIdentifierIsTrashed = self->_assetExistingWithSyndicationIdentifierIsTrashed;
    objc_msgSend(*(id *)(v5 + 2368), "stringWithUTF8String:", "assetExistingWithSyndicationIdentifierIsTrashed");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeBool:forKey:", assetExistingWithSyndicationIdentifierIsTrashed, v65);

  }
  resourceHoldingDirectoryPath = self->_resourceHoldingDirectoryPath;
  objc_msgSend(*(id *)(v5 + 2368), "stringWithUTF8String:", "resourceHoldingDirectoryPath");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", resourceHoldingDirectoryPath, v67);

  if (self->_retryCount >= 1)
    objc_msgSend(v4, "encodeInt:forKey:");

}

- (PHAssetCreationRequest)initWithCoder:(id)a3
{
  id v3;
  PHAssetCreationRequest *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSMutableArray *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  PHExternalAssetResource *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  NSMutableArray *assetResources;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  const __CFDictionary *v41;
  PHAssetCreationRequest *v42;
  $95D729B680665BEAEFA1D6FCA8238556 *p_duplicateStillSourceTime;
  __int128 v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  PHRelationshipChangeRequestHelper *momentShareHelper;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  NSString *momentShareUUID;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  NSString *importSessionID;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  NSString *conversationID;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  PHAssetCreationAdjustmentBakeInOptions *adjustmentBakeInOptions;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  PHAssetCreationMetadataCopyOptions *metadataCopyOptions;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  NSString *importedByBundleIdentifier;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  NSString *syndicationIdentifier;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  uint64_t v90;
  NSDictionary *customAssetProperties;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  NSNumber *assetExistsWithSyndicationIdentifier;
  void *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  NSString *resourceHoldingDirectoryPath;
  PHAssetCreationRequest *v102;
  void *v103;
  void *v104;
  CMTime v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  objc_super v110;
  _BYTE v111[128];
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v110.receiver = self;
  v110.super_class = (Class)PHAssetCreationRequest;
  v3 = a3;
  v4 = -[PHAssetChangeRequest initWithCoder:](&v110, sel_initWithCoder_, v3);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "assetResources");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "sandboxExtensionTokens");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v15, v16);
    v104 = (void *)objc_claimAutoreleasedReturnValue();

    v103 = v12;
    if (v12)
    {
      v102 = v4;
      v17 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v12, "count"));
      v106 = 0u;
      v107 = 0u;
      v108 = 0u;
      v109 = 0u;
      v18 = v12;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v106, v111, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v107;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v107 != v21)
              objc_enumerationMutation(v18);
            v23 = -[PHExternalAssetResource initWithPropertyListRepresentation:]([PHExternalAssetResource alloc], "initWithPropertyListRepresentation:", *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * i));
            -[PHExternalAssetResource fileURL](v23, "fileURL");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "path");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v104, "objectForKeyedSubscript:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (v26)
            {
              v27 = objc_alloc(MEMORY[0x1E0D732D0]);
              -[PHExternalAssetResource fileURL](v23, "fileURL");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = (void *)objc_msgSend(v27, "initWithURL:sandboxExtensionToken:consume:", v28, v26, 1);

              -[PHExternalAssetResource setFileURL:](v23, "setFileURL:", v29);
            }
            -[NSMutableArray addObject:](v17, "addObject:", v23);

          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v106, v111, 16);
        }
        while (v20);
      }

      v4 = v102;
      assetResources = v102->_assetResources;
      v102->_assetResources = v17;

    }
    v31 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "duplicateAssetIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decodeObjectOfClass:forKey:", v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      objc_storeStrong((id *)&v4->_duplicateAssetIdentifier, v33);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "duplicateLivePhotoAsStill");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v4->_duplicateLivePhotoAsStill = objc_msgSend(v3, "decodeBoolForKey:", v34);

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "duplicateAssetPhotoLibraryType");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v4->_duplicateAssetPhotoLibraryType = objc_msgSend(v3, "decodeIntegerForKey:", v35);

    v36 = (void *)MEMORY[0x1E0C99E60];
    v37 = objc_opt_class();
    v38 = objc_opt_class();
    objc_msgSend(v36, "setWithObjects:", v37, v38, objc_opt_class(), 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "duplicateLivePhotoStillTimeKey");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v39, v40);
    v41 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    v42 = v4;
    p_duplicateStillSourceTime = &v4->_duplicateStillSourceTime;
    CMTimeMakeFromDictionary(&v105, v41);
    v44 = *(_OWORD *)&v105.value;
    p_duplicateStillSourceTime->epoch = v105.epoch;
    *(_OWORD *)&p_duplicateStillSourceTime->value = v44;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "duplicateAsOriginal");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v42->_duplicateAsOriginal = objc_msgSend(v3, "decodeBoolForKey:", v45);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "duplicateAsAlternateAsset");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v42->_duplicateAsAlternateAsset = objc_msgSend(v3, "decodeBoolForKey:", v46);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "createScreenshot");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v42->_shouldCreateScreenshot = objc_msgSend(v3, "decodeBoolForKey:", v47);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "useAutomaticallyGeneratedOriginalFilename");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v42->_shouldUseAutomaticallyGeneratedOriginalFilename = objc_msgSend(v3, "decodeBoolForKey:", v48);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "createAsCompanionSyncedAsset");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v42->_createAsCompanionSyncedAsset = objc_msgSend(v3, "decodeBoolForKey:", v49);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "bundleScope");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v42->_bundleScope = objc_msgSend(v3, "decodeIntegerForKey:", v50);

    objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("momentShare"));
    v51 = objc_claimAutoreleasedReturnValue();
    momentShareHelper = v42->_momentShareHelper;
    v42->_momentShareHelper = (PHRelationshipChangeRequestHelper *)v51;

    v53 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "momentShareUUID");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decodeObjectOfClass:forKey:", v53, v54);
    v55 = objc_claimAutoreleasedReturnValue();
    momentShareUUID = v42->_momentShareUUID;
    v42->_momentShareUUID = (NSString *)v55;

    v57 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "importSessionID");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decodeObjectOfClass:forKey:", v57, v58);
    v59 = objc_claimAutoreleasedReturnValue();
    importSessionID = v42->_importSessionID;
    v42->_importSessionID = (NSString *)v59;

    v61 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "conversationID");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decodeObjectOfClass:forKey:", v61, v62);
    v63 = objc_claimAutoreleasedReturnValue();
    conversationID = v42->_conversationID;
    v42->_conversationID = (NSString *)v63;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "importedBy");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v42->_importedBy = objc_msgSend(v3, "decodeIntegerForKey:", v65);

    -[PHChangeRequest setShouldPerformConcurrentWork:](v42, "setShouldPerformConcurrentWork:", v42->_importedBy == 5);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "duplicateSinglePhotoFromBurst");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v42->_duplicateSinglePhotoFromBurst = objc_msgSend(v3, "decodeBoolForKey:", v66);

    v67 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "adjustmentBakeInOptions");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decodeObjectOfClass:forKey:", v67, v68);
    v69 = objc_claimAutoreleasedReturnValue();
    adjustmentBakeInOptions = v42->_adjustmentBakeInOptions;
    v42->_adjustmentBakeInOptions = (PHAssetCreationAdjustmentBakeInOptions *)v69;

    v71 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "metadataCopyOptions");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decodeObjectOfClass:forKey:", v71, v72);
    v73 = objc_claimAutoreleasedReturnValue();
    metadataCopyOptions = v42->_metadataCopyOptions;
    v42->_metadataCopyOptions = (PHAssetCreationMetadataCopyOptions *)v73;

    v75 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "importedByBundleIdentifier");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decodeObjectOfClass:forKey:", v75, v76);
    v77 = objc_claimAutoreleasedReturnValue();
    importedByBundleIdentifier = v42->_importedByBundleIdentifier;
    v42->_importedByBundleIdentifier = (NSString *)v77;

    v79 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "syndicationIdentifier");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decodeObjectOfClass:forKey:", v79, v80);
    v81 = objc_claimAutoreleasedReturnValue();
    syndicationIdentifier = v42->_syndicationIdentifier;
    v42->_syndicationIdentifier = (NSString *)v81;

    v83 = (void *)MEMORY[0x1E0C99E60];
    v84 = objc_opt_class();
    v85 = objc_opt_class();
    v86 = objc_opt_class();
    v87 = objc_opt_class();
    objc_msgSend(v83, "setWithObjects:", v84, v85, v86, v87, objc_opt_class(), 0);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "customAssetProperties");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v88, v89);
    v90 = objc_claimAutoreleasedReturnValue();
    customAssetProperties = v42->_customAssetProperties;
    v42->_customAssetProperties = (NSDictionary *)v90;

    v92 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "assetExistsWithSyndicationIdentifier");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decodeObjectOfClass:forKey:", v92, v93);
    v94 = objc_claimAutoreleasedReturnValue();
    assetExistsWithSyndicationIdentifier = v42->_assetExistsWithSyndicationIdentifier;
    v42->_assetExistsWithSyndicationIdentifier = (NSNumber *)v94;

    v4 = v42;
    if (-[NSNumber BOOLValue](v42->_assetExistsWithSyndicationIdentifier, "BOOLValue"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "assetExistingWithSyndicationIdentifierIsTrashed");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v42->_assetExistingWithSyndicationIdentifierIsTrashed = objc_msgSend(v3, "decodeBoolForKey:", v96);

    }
    v97 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "resourceHoldingDirectoryPath");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decodeObjectOfClass:forKey:", v97, v98);
    v99 = objc_claimAutoreleasedReturnValue();
    resourceHoldingDirectoryPath = v42->_resourceHoldingDirectoryPath;
    v42->_resourceHoldingDirectoryPath = (NSString *)v99;

    v42->_retryCount = objc_msgSend(v3, "decodeIntForKey:", CFSTR("PHAssetCreationRequestRetryCountKey"));
  }

  return v4;
}

- (int64_t)importedBy
{
  return self->_importedBy;
}

- (NSString)importSessionID
{
  return self->_importSessionID;
}

- (NSString)conversationID
{
  return self->_conversationID;
}

- (NSDictionary)customAssetProperties
{
  return self->_customAssetProperties;
}

- (NSManagedObjectID)_limitedLibraryFetchFilterObjectID
{
  return self->_limitedLibraryFetchFilterObjectID;
}

- (void)_setLimitedLibraryFetchFilterObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_limitedLibraryFetchFilterObjectID, a3);
}

- (NSNumber)assetExistsWithSyndicationIdentifier
{
  return self->_assetExistsWithSyndicationIdentifier;
}

- (void)setAssetExistsWithSyndicationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_assetExistsWithSyndicationIdentifier, a3);
}

- (BOOL)assetExistingWithSyndicationIdentifierIsTrashed
{
  return self->_assetExistingWithSyndicationIdentifierIsTrashed;
}

- (void)setAssetExistingWithSyndicationIdentifierIsTrashed:(BOOL)a3
{
  self->_assetExistingWithSyndicationIdentifierIsTrashed = a3;
}

- (BOOL)crashBeforeCreation
{
  return self->_crashBeforeCreation;
}

- (void)setCrashBeforeCreation:(BOOL)a3
{
  self->_crashBeforeCreation = a3;
}

- (PHAssetResourceBag)assetResourceBag
{
  return self->_assetResourceBag;
}

- (void)setAssetResourceBag:(id)a3
{
  objc_storeStrong((id *)&self->_assetResourceBag, a3);
}

- (int)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(int)a3
{
  self->_retryCount = a3;
}

- (PHRelationshipChangeRequestHelper)momentShareHelper
{
  return self->_momentShareHelper;
}

- (NSString)duplicateAssetIdentifier
{
  return self->_duplicateAssetIdentifier;
}

- (void)_setDuplicateAssetIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_duplicateAssetIdentifier, a3);
}

- (unsigned)duplicateAssetPhotoLibraryType
{
  return self->_duplicateAssetPhotoLibraryType;
}

- (void)_setDuplicateAssetPhotoLibraryType:(unsigned __int16)a3
{
  self->_duplicateAssetPhotoLibraryType = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duplicateStillSourceTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[48];
  return self;
}

- (void)_setDuplicateStillSourceTime:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_duplicateStillSourceTime.value = *(_OWORD *)&a3->var0;
  self->_duplicateStillSourceTime.epoch = var3;
}

- (BOOL)duplicateLivePhotoAsStill
{
  return self->_duplicateLivePhotoAsStill;
}

- (void)_setDuplicateLivePhotoAsStill:(BOOL)a3
{
  self->_duplicateLivePhotoAsStill = a3;
}

- (BOOL)duplicateAsOriginal
{
  return self->_duplicateAsOriginal;
}

- (void)_setDuplicateAsOriginal:(BOOL)a3
{
  self->_duplicateAsOriginal = a3;
}

- (BOOL)duplicateSinglePhotoFromBurst
{
  return self->_duplicateSinglePhotoFromBurst;
}

- (void)_setDuplicateSinglePhotoFromBurst:(BOOL)a3
{
  self->_duplicateSinglePhotoFromBurst = a3;
}

- (BOOL)duplicateAsAlternateAsset
{
  return self->_duplicateAsAlternateAsset;
}

- (void)_setDuplicateAsAlternateAsset:(BOOL)a3
{
  self->_duplicateAsAlternateAsset = a3;
}

- (PHAssetCreationAdjustmentBakeInOptions)adjustmentBakeInOptions
{
  return self->_adjustmentBakeInOptions;
}

- (void)_setAdjustmentBakeInOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1096);
}

- (PHAssetCreationMetadataCopyOptions)metadataCopyOptions
{
  return self->_metadataCopyOptions;
}

- (void)_setMetadataCopyOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1104);
}

- (NSString)forcePairingIdentifier
{
  return self->_forcePairingIdentifier;
}

- (NSString)momentShareUUID
{
  return self->_momentShareUUID;
}

- (unsigned)bundleScope
{
  return self->_bundleScope;
}

- (void)setBundleScope:(unsigned __int16)a3
{
  self->_bundleScope = a3;
}

- (BOOL)useRecoverableStagingDirectory
{
  return self->_useRecoverableStagingDirectory;
}

- (void)_setUseRecoverableStagingDirectory:(BOOL)a3
{
  self->_useRecoverableStagingDirectory = a3;
}

- (PHAssetCreationCameraIngestOptions)cameraIngestOptions
{
  return self->_cameraIngestOptions;
}

- (void)setCameraIngestOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1128);
}

- (NSString)importedByBundleIdentifier
{
  return self->_importedByBundleIdentifier;
}

- (BOOL)createAsCompanionSyncedAsset
{
  return self->_createAsCompanionSyncedAsset;
}

- (void)setCreateAsCompanionSyncedAsset:(BOOL)a3
{
  self->_createAsCompanionSyncedAsset = a3;
}

- (NSString)syndicationIdentifier
{
  return self->_syndicationIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syndicationIdentifier, 0);
  objc_storeStrong((id *)&self->_importedByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_cameraIngestOptions, 0);
  objc_storeStrong((id *)&self->_momentShareUUID, 0);
  objc_storeStrong((id *)&self->_forcePairingIdentifier, 0);
  objc_storeStrong((id *)&self->_metadataCopyOptions, 0);
  objc_storeStrong((id *)&self->_adjustmentBakeInOptions, 0);
  objc_storeStrong((id *)&self->_duplicateAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_momentShareHelper, 0);
  objc_storeStrong((id *)&self->_assetResourceBag, 0);
  objc_storeStrong((id *)&self->_assetExistsWithSyndicationIdentifier, 0);
  objc_storeStrong((id *)&self->_limitedLibraryFetchFilterObjectID, 0);
  objc_storeStrong((id *)&self->_momentShare, 0);
  objc_storeStrong((id *)&self->_customAssetProperties, 0);
  objc_storeStrong((id *)&self->_conversationID, 0);
  objc_storeStrong((id *)&self->_importSessionID, 0);
  objc_storeStrong((id *)&self->_derivativeContext, 0);
  objc_storeStrong((id *)&self->_fileCoordinator, 0);
  objc_storeStrong((id *)&self->_resourceHoldingDirectoryPath, 0);
  objc_storeStrong((id *)&self->_movedFiles, 0);
  objc_storeStrong((id *)&self->_assetResources, 0);
}

BOOL __86__PHAssetCreationRequest__populateDuplicatingAssetCreationRequest_photoLibrary_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;

  v3 = objc_msgSend(a2, "type");
  return v3 == objc_msgSend(*(id *)(a1 + 32), "type");
}

void __186__PHAssetCreationRequest_duplicatedAssetResourcesFromAsset_stillSourceTime_flattenLivePhotoIntoStillPhoto_duplicateAsOriginal_duplicateWithAdjustmentsBakedIn_duplicatePhotoAsData_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  _BOOL8 v9;
  uint64_t v10;
  id *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;

  v7 = a2;
  v8 = objc_msgSend(v7, "type");
  switch(v8)
  {
    case 1:
    case 13:
      if ((*(_BYTE *)(a1 + 84) & 1) == 0)
        goto LABEL_8;
      goto LABEL_23;
    case 2:
    case 3:
    case 4:
    case 12:
    case 14:
      goto LABEL_12;
    case 5:
    case 6:
      goto LABEL_11;
    case 7:
    case 8:
LABEL_5:
      if (!*(_BYTE *)(a1 + 98))
        goto LABEL_8;
      goto LABEL_23;
    case 9:
    case 15:
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
      if (*(_BYTE *)(a1 + 97))
        goto LABEL_23;
LABEL_8:
      if (!*(_BYTE *)(a1 + 96))
        goto LABEL_12;
      goto LABEL_23;
    case 10:
    case 11:
      if (*(_BYTE *)(a1 + 97))
        goto LABEL_23;
LABEL_11:
      if (*(_BYTE *)(a1 + 98))
        goto LABEL_23;
LABEL_12:
      if (*(_BYTE *)(a1 + 99))
        v9 = objc_msgSend(v7, "type") == 1;
      else
        v9 = 0;
      if (*(_BYTE *)(a1 + 96))
      {
        v10 = objc_msgSend((id)objc_opt_class(), "_originalResourceTypeFromAdjustedResourceType:sourceAssetIsLoopingVideo:sourceAssetIsVideo:", objc_msgSend(v7, "type"), objc_msgSend(*(id *)(a1 + 40), "isLoopingVideo"), objc_msgSend(*(id *)(a1 + 40), "isVideo"));
        if (!v10)
          goto LABEL_23;
        v20 = 0;
        v11 = (id *)&v20;
        +[PHExternalAssetResource assetResourceForDuplicatingAssetResource:newResourceType:asData:error:](PHExternalAssetResource, "assetResourceForDuplicatingAssetResource:newResourceType:asData:error:", v7, v10, v9, &v20);
        v12 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = 0;
        v11 = (id *)&v21;
        +[PHExternalAssetResource assetResourceForDuplicatingAssetResource:asData:error:](PHExternalAssetResource, "assetResourceForDuplicatingAssetResource:asData:error:", v7, v9, &v21);
        v12 = objc_claimAutoreleasedReturnValue();
      }
      v13 = (void *)v12;
      v14 = *v11;
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v16 = *(void **)(v15 + 40);
      if (v13)
      {
        objc_msgSend(v16, "addObject:", v13);

      }
      else
      {
        *(_QWORD *)(v15 + 40) = 0;

        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v18 = *(void **)(v17 + 40);
        *(_QWORD *)(v17 + 40) = v14;
        v19 = v14;

        *a4 = 1;
      }

LABEL_23:
      return;
    default:
      switch(v8)
      {
        case 'j':
        case 'm':
        case 'r':
          goto LABEL_23;
        case 'l':
          goto LABEL_5;
        default:
          goto LABEL_12;
      }
      goto LABEL_23;
  }
}

void __186__PHAssetCreationRequest_duplicatedAssetResourcesFromAsset_stillSourceTime_flattenLivePhotoIntoStillPhoto_duplicateAsOriginal_duplicateWithAdjustmentsBakedIn_duplicatePhotoAsData_error___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __186__PHAssetCreationRequest_duplicatedAssetResourcesFromAsset_stillSourceTime_flattenLivePhotoIntoStillPhoto_duplicateAsOriginal_duplicateWithAdjustmentsBakedIn_duplicatePhotoAsData_error___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "type");
  if (result == 9)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

void __122__PHAssetCreationRequest_createAssetFromValidatedResources_withUUID_assetAlreadyExistsAsPlaceholder_inPhotoLibrary_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(unsigned __int8 *)(a1 + 80);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  obj = *(id *)(v7 + 40);
  objc_msgSend(v2, "_createAssetFromValidatedResources:withUUID:assetAlreadyExistsAsPlaceholder:inPhotoLibrary:error:", v3, v4, v5, v6, &obj);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v7 + 40), obj);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

void __77__PHAssetCreationRequest__setupIrisPairingTimeoutForAsset_imageFile_library___block_invoke(id *a1)
{
  id v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __77__PHAssetCreationRequest__setupIrisPairingTimeoutForAsset_imageFile_library___block_invoke_2;
  v3[3] = &unk_1E35DFAF8;
  v2 = a1[4];
  v4 = a1[5];
  v5 = a1[4];
  v6 = a1[6];
  objc_msgSend(v2, "performTransactionAndWait:", v3);

}

uint64_t __77__PHAssetCreationRequest__setupIrisPairingTimeoutForAsset_imageFile_library___block_invoke_2(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0D717C0], "photoIrisPairingDidSucceed:fileIndicatorPath:photoAsset:photoLibrary:", 0, *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 48), "stillAlive");
}

void __103__PHAssetCreationRequest__accessWritableURLForUUID_imageUTI_originalFilename_photoLibrary_withHandler___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = (*(uint64_t (**)(void))(a1[7] + 16))();
  }
  else
  {
    PLBackendGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = a1[4];
      v8 = a1[5];
      v9 = a1[6];
      v10 = 138413058;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_ERROR, "Unable to obtain writable URL for UUID: %@, UTI: %@, and original filename: %@, error: %@", (uint8_t *)&v10, 0x2Au);
    }

    *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = 0;
  }

}

uint64_t __146__PHAssetCreationRequest__managedAssetFromPrimaryResourceData_validatedResources_withUUID_photoLibrary_mainFileMetadata_getImageSource_imageData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLBackendGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412290;
    v11 = v3;
    _os_log_impl(&dword_1991EC000, v4, OS_LOG_TYPE_DEBUG, "Writing data for new asset to URL: %@", (uint8_t *)&v10, 0xCu);
  }

  v5 = objc_msgSend(v3, "copy");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v8 = objc_msgSend(*(id *)(a1 + 32), "_writeDataToDisk:imageUTIType:exifProperties:mainFileURL:thumbnailData:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v3, *(_QWORD *)(a1 + 64));
  return v8;
}

void __127__PHAssetCreationRequest__createOriginalResourceForAsset_fromValidatedResource_resourceType_photoLibrary_destinationURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id obj;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(unsigned __int8 *)(a1 + 72);
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "capabilities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    obj = *(id *)(v11 + 40);
    objc_msgSend(v8, "_secureMove:fileAtURL:toURL:capabilities:error:", v7, v9, v5, v10, &obj);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v11 + 40), obj);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a3);
  }

}

BOOL __111__PHAssetCreationRequest__createRAWSidecarForAsset_fromValidatedResources_mainFileMetadata_photoLibrary_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _BOOL8 v10;

  objc_msgSend(*(id *)(a1 + 32), "pathForOriginalFile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByDeletingPathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathExtension:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "fileURLForHypotheticalSidecarFileWithFilename:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) != 0;
  return v10;
}

void __111__PHAssetCreationRequest__createRAWSidecarForAsset_fromValidatedResources_mainFileMetadata_photoLibrary_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id obj;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(unsigned __int8 *)(a1 + 72);
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "capabilities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    obj = *(id *)(v11 + 40);
    objc_msgSend(v8, "_secureMove:fileAtURL:toURL:capabilities:error:", v7, v9, v5, v10, &obj);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v11 + 40), obj);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a3);
  }

}

void __109__PHAssetCreationRequest__ingestOriginalFromSrcURL_toDstURL_useSecureMove_resource_resourceType_asset_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id obj;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(unsigned __int8 *)(a1 + 72);
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "capabilities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    obj = *(id *)(v11 + 40);
    objc_msgSend(v8, "_secureMove:fileAtURL:toURL:capabilities:error:", v7, v9, v5, v10, &obj);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v11 + 40), obj);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a3);
  }

}

void __71__PHAssetCreationRequest__secureMove_assetResource_photoLibrary_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id obj;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(unsigned __int8 *)(a1 + 72);
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "capabilities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    obj = *(id *)(v11 + 40);
    objc_msgSend(v8, "_secureMove:fileAtURL:toURL:capabilities:error:", v7, v9, v5, v10, &obj);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v11 + 40), obj);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a3);
  }

}

+ (id)_creationRequestForAssetUsingUUID:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[PHAssetCreationRequest initForNewObjectWithUUID:]([PHAssetCreationRequest alloc], "initForNewObjectWithUUID:", v3);

  return v4;
}

+ (PHAssetCreationRequest)creationRequestForAsset
{
  return (PHAssetCreationRequest *)objc_msgSend(a1, "_creationRequestForAssetUsingUUID:", 0);
}

+ (id)creationRequestForAssetWithUUID:(id)a3
{
  return (id)objc_msgSend(a1, "creationRequestForAssetWithUUID:options:", a3, 0);
}

+ (id)creationRequestForAssetWithOptions:(id)a3
{
  return (id)objc_msgSend(a1, "creationRequestForAssetWithUUID:options:", 0, a3);
}

+ (id)creationRequestForAssetWithUUID:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (v6)
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v6);
  else
    v8 = 0;
  objc_msgSend(a1, "_creationRequestForAssetUsingUUID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "copyStillPhotoFromLivePhoto"))
    objc_msgSend(v9, "_setDuplicateLivePhotoAsStill:", 1);
  if (objc_msgSend(v7, "copyOriginal"))
    objc_msgSend(v9, "_setDuplicateAsOriginal:", 1);
  if (objc_msgSend(v7, "copySinglePhotoFromBurst"))
    objc_msgSend(v9, "_setDuplicateSinglePhotoFromBurst:", 1);
  if (objc_msgSend(v7, "copyAsAlternateAsset"))
    objc_msgSend(v9, "_setDuplicateAsAlternateAsset:", 1);
  if (objc_msgSend(v7, "useRecoverableStagingDirectory"))
  {
    objc_msgSend(v9, "_setUseRecoverableStagingDirectory:", 1);
    objc_msgSend(v9, "_setCreatingAssetIsBusy:", 1);
  }
  if (objc_msgSend(v7, "crashBeforeCreation"))
    objc_msgSend(v9, "setCrashBeforeCreation:", 1);
  if (objc_msgSend(v7, "shouldCreateScreenshot"))
    objc_msgSend(v9, "_setShouldCreateScreenshot:", 1);
  if (objc_msgSend(v7, "shouldUseAutomaticallyGeneratedOriginalFilename"))
    objc_msgSend(v9, "_setShouldUseAutomaticallyGeneratedOriginalFilename:", 1);

  return v9;
}

+ (id)creationRequestForAssetFromImageData:(id)a3
{
  return (id)objc_msgSend(a1, "creationRequestForAssetFromImageData:usingUUID:", a3, 0);
}

+ (id)creationRequestForAssetFromImageData:(id)a3 options:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(a1, "creationRequestForAssetWithOptions:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_addResourceWithType:data:orFileURL:options:", 1, v6, 0, 0);

  return v7;
}

+ (id)creationRequestForAssetFromImageData:(id)a3 usingUUID:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(a1, "_creationRequestForAssetUsingUUID:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_addResourceWithType:data:orFileURL:options:", 1, v6, 0, 0);

  return v7;
}

+ (id)creationRequestForAssetFromVideoPreviewJobDict:(id)a3 withPreviewImageSurface:(__IOSurface *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = *MEMORY[0x1E0D74D38];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHAssetCreationRequest creationRequestForAssetWithUUID:](PHAssetCreationRequest, "creationRequestForAssetWithUUID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[PHAssetCreationCameraIngestOptions initFromJobDictionary:withPreviewImgSurfaceRef:]([PHAssetCreationCameraIngestOptions alloc], "initFromJobDictionary:withPreviewImgSurfaceRef:", v6, a4);
  objc_msgSend(v8, "setCameraIngestOptions:", v9);

  return v8;
}

+ (id)creationRequestForAssetFromVideoJobDictionary:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0C99E98]);
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D74F40]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initFileURLWithPath:isDirectory:", v5, 0);

  v7 = *MEMORY[0x1E0D74D38];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D74D38]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHAssetCreationRequest creationRequestForAssetWithUUID:](PHAssetCreationRequest, "creationRequestForAssetWithUUID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addResourceWithType:fileURL:options:", 2, v6, 0);
  v10 = -[PHAssetCreationCameraIngestOptions initFromJobDictionary:withPreviewImgSurfaceRef:]([PHAssetCreationCameraIngestOptions alloc], "initFromJobDictionary:withPreviewImgSurfaceRef:", v3, 0);
  objc_msgSend(v9, "setCameraIngestOptions:", v10);

  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D74CF8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_12:
    v16 = v9;
    goto LABEL_13;
  }
  objc_msgSend(v9, "_createAdjustmentsFileFromJobDictionary:cameraIngestOptions:", v3, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    objc_msgSend(v9, "addResourceWithType:fileURL:options:", 7, v12, 0);
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D74E80]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v14, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        objc_msgSend(v9, "addResourceWithType:fileURL:options:", 107, v15, 0);

    }
    else
    {
      PLPhotoKitIngestGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "objectForKeyedSubscript:", v7);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138412290;
        v21 = v18;
        _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_ERROR, "No largeThumbnail file associated to asset with uuid %@", (uint8_t *)&v20, 0xCu);

      }
    }

    goto LABEL_12;
  }
  v16 = 0;
LABEL_13:

  return v16;
}

+ (id)creationRequestForAssetFromImageJobDictionary:(id)a3 holdingDirectoryPath:(id)a4
{
  id v4;
  PHAssetResourceCreationOptions *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *v36;
  void *v37;
  void *v38;
  PHAssetResourceCreationOptions *v39;
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(PHAssetResourceCreationOptions);
  v6 = *MEMORY[0x1E0D74D00];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D74D00]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAssetResourceCreationOptions setBurstPickType:](v5, "setBurstPickType:", objc_msgSend(v8, "intValue"));

  }
  v9 = *MEMORY[0x1E0D74D38];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D74D38]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHAssetCreationRequest creationRequestForAssetWithUUID:options:](PHAssetCreationRequest, "creationRequestForAssetWithUUID:options:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[PHAssetCreationCameraIngestOptions initFromJobDictionary:withPreviewImgSurfaceRef:]([PHAssetCreationCameraIngestOptions alloc], "initFromJobDictionary:withPreviewImgSurfaceRef:", v4, 0);
  objc_msgSend(v11, "setCameraIngestOptions:", v12);

  v13 = objc_alloc(MEMORY[0x1E0C99E98]);
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D74EC0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initFileURLWithPath:isDirectory:", v14, 0);

  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D74D58]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    v17 = 19;
  else
    v17 = 1;
  objc_msgSend(v11, "addResourceWithType:fileURL:options:", v17, v15, v5);
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D74CF8]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    v29 = *MEMORY[0x1E0D74EE8];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D74EE8]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addResourceWithType:data:options:", 111, v31, 0);

    }
    goto LABEL_31;
  }
  v39 = v5;
  objc_msgSend(v11, "cameraIngestOptions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_createAdjustmentsFileFromJobDictionary:cameraIngestOptions:", v4, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D74E60]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_msgSend(v11, "cameraIngestOptions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setBackupAdjustmentsFile:", v21);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D74EE8]);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D74E68]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D74E80]);
  v24 = objc_claimAutoreleasedReturnValue();
  v37 = (void *)v24;
  if (v23)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    if (v20)
    {
LABEL_11:
      objc_msgSend(v11, "addResourceWithType:fileURL:options:", 7, v20, 0);
      if (v25)
      {
        objc_msgSend(v11, "addResourceWithType:fileURL:options:", 107, v25, 0);
        v28 = v38;
LABEL_28:
        if (v26)
          objc_msgSend(v11, "addResourceWithType:data:options:", 111, v26, 0);

        v5 = v39;
LABEL_31:
        v34 = v11;
        goto LABEL_32;
      }
      v28 = v38;
      if (v27)
      {
        objc_msgSend(v11, "addResourceWithType:fileURL:options:", 107, v27, 0);
        v25 = 0;
        goto LABEL_28;
      }
LABEL_25:
      if (v28)
        objc_msgSend(v11, "addResourceWithType:data:options:", 111, v28, 0);
      v25 = 0;
      v27 = 0;
      goto LABEL_28;
    }
    goto LABEL_17;
  }
  if (v24)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v26 = 0;
    if (v20)
      goto LABEL_11;
LABEL_17:
    v36 = v20;
    goto LABEL_18;
  }
  if (v20)
  {
    objc_msgSend(v11, "addResourceWithType:fileURL:options:", 7, v20, 0);
    v26 = 0;
    v28 = v38;
    goto LABEL_25;
  }
  v36 = 0;
  v26 = 0;
  v27 = 0;
  v25 = 0;
LABEL_18:
  PLPhotoKitIngestGetLog();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v9, v36, v37);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v41 = v33;
    _os_log_impl(&dword_1991EC000, v32, OS_LOG_TYPE_ERROR, "Failed to get adjustments data URL for asset with UUID: %@", buf, 0xCu);

  }
  v34 = 0;
  v5 = v39;
LABEL_32:

  return v34;
}

+ (id)creationRequestForAssetFromBatchImageJobDictionary:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D74CF0]);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v21;
    v8 = *MEMORY[0x1E0D74D38];
    v9 = *MEMORY[0x1E0D74EC0];
    do
    {
      v10 = 0;
      v11 = v6;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v10);
        v13 = -[PHAssetCreationCameraIngestOptions initFromJobDictionary:withPreviewImgSurfaceRef:]([PHAssetCreationCameraIngestOptions alloc], "initFromJobDictionary:withPreviewImgSurfaceRef:", v3, 0);
        objc_msgSend(v11, "setCameraIngestOptions:", v13);

        objc_msgSend(v12, "objectForKeyedSubscript:", v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHAssetCreationRequest creationRequestForAssetWithUUID:options:](PHAssetCreationRequest, "creationRequestForAssetWithUUID:options:", v14, 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = objc_alloc(MEMORY[0x1E0C99E98]);
        objc_msgSend(v12, "objectForKeyedSubscript:", v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v15, "initFileURLWithPath:isDirectory:", v16, 0);

        objc_msgSend(v6, "addResourceWithType:fileURL:options:", 1, v17, 0);
        ++v10;
        v11 = v6;
      }
      while (v5 != v10);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)creationRequestForAssetFromScreenshotImage:(id)a3
{
  void *v4;
  void *v5;

  PHImageDataFromImageAsScreenshot(a3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_creationRequestForAssetUsingUUID:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_addResourceWithType:data:orFileURL:options:", 1, v4, 0, 0);
  objc_msgSend(v5, "_setShouldCreateScreenshot:", 1);

  return v5;
}

+ (id)creationRequestForAssetFromImage:(id)a3
{
  void *v4;
  void *v5;

  PHImageDataFromImageAsScreenshot(a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_creationRequestForAssetUsingUUID:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_addResourceWithType:data:orFileURL:options:", 1, v4, 0, 0);

  return v5;
}

+ (id)creationRequestForAssetFromImageAtFileURL:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_creationRequestForAssetUsingUUID:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_addResourceWithType:data:orFileURL:options:", 1, 0, v4, 0);

  return v5;
}

+ (id)creationRequestForAssetFromVideoAtFileURL:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_creationRequestForAssetUsingUUID:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_addResourceWithType:data:orFileURL:options:", 2, 0, v4, 0);

  return v5;
}

+ (id)creationRequestForAssetWithSyndicationIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  unsigned __int8 v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0;
  if (!v4)
  {
LABEL_9:
    v10 = 0;
    v7 = 0;
    goto LABEL_10;
  }
  +[PHPhotoLibrary photoLibraryForCurrentTransaction](PHPhotoLibrary, "photoLibraryForCurrentTransaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHAssetCreationRequest _uuidForAssetWithSyndicationIdentifier:inLibrary:isTrashed:](PHAssetCreationRequest, "_uuidForAssetWithSyndicationIdentifier:inLibrary:isTrashed:", v4, v6, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PLSyndicationGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (!v7)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138543362;
      v17 = v4;
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_INFO, "Did not find exising asset with syndication identifier %{public}@", buf, 0xCu);
    }

    goto LABEL_9;
  }
  if (v9)
  {
    *(_DWORD *)buf = 138543618;
    v17 = v7;
    v18 = 2114;
    v19 = v4;
    _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_INFO, "Found exising asset %{public}@ with syndication identifier %{public}@", buf, 0x16u);
  }

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v7);
LABEL_10:
  objc_msgSend(a1, "_creationRequestForAssetUsingUUID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSyndicationIdentifier:", v4);
  if (v10)
  {
    PLSyndicationGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_INFO, "Setting assetExistsWithSyndicationIdentifier to YES", buf, 2u);
    }

    objc_msgSend(v11, "setAssetExistsWithSyndicationIdentifier:", MEMORY[0x1E0C9AAB0]);
    objc_msgSend(v11, "setAssetExistingWithSyndicationIdentifierIsTrashed:", v15);
  }
  PLSyndicationGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v17 = v4;
    v18 = 2114;
    v19 = v10;
    _os_log_impl(&dword_1991EC000, v13, OS_LOG_TYPE_INFO, "creationRequestForAssetWithSyndicationIdentifier: %{public}@ existing uuid: %{public}@", buf, 0x16u);
  }

  return v11;
}

+ (id)creationRequestForAssetFromVideoComplementBundle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[3];

  v4 = a3;
  objc_msgSend(a1, "creationRequestForAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v4, "imagePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURLWithPath:isDirectory:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v4, "videoPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fileURLWithPath:isDirectory:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addResourceWithType:fileURL:options:", 1, v8, 0);
  objc_msgSend(v5, "addResourceWithType:fileURL:options:", 9, v11, 0);
  objc_msgSend(v4, "pairingIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPairingIdentifier:", v12);

  if (v4)
  {
    objc_msgSend(v4, "imageDisplayTime");
    objc_msgSend(v5, "setImageDisplayTime:", v15);
    objc_msgSend(v4, "originalVideoDuration");
  }
  else
  {
    memset(v15, 0, sizeof(v15));
    objc_msgSend(v5, "setImageDisplayTime:", v15);
    memset(v14, 0, sizeof(v14));
  }
  objc_msgSend(v5, "setVideoDuration:", v14);

  return v5;
}

+ (id)creationRequestForAssetFromAssetBundle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  char isKindOfClass;

  v4 = a3;
  objc_msgSend(a1, "creationRequestForAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "photoURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addResourceWithType:fileURL:options:", 1, v7, 0);

  }
  objc_msgSend(v4, "videoURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "videoURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addResourceWithType:fileURL:options:", 2, v9, 0);

  }
  objc_msgSend(v4, "audioURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v4, "audioURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addResourceWithType:fileURL:options:", 3, v11, 0);

  }
  objc_msgSend(v4, "alternatePhotoURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v4, "alternatePhotoURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addResourceWithType:fileURL:options:", 4, v13, 0);

  }
  objc_msgSend(v4, "fullSizePhotoURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v4, "fullSizePhotoURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addResourceWithType:fileURL:options:", 5, v15, 0);

  }
  objc_msgSend(v4, "fullSizeVideoURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v4, "fullSizeVideoURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addResourceWithType:fileURL:options:", 6, v17, 0);

  }
  objc_msgSend(v4, "adjustmentDataURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v4, "adjustmentDataURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addResourceWithType:fileURL:options:", 7, v19, 0);

  }
  objc_msgSend(v4, "originalAdjustmentDataURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v4, "originalAdjustmentDataURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addResourceWithType:fileURL:options:", 16, v21, 0);

  }
  objc_msgSend(v4, "adjustmentSecondaryDataURL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v4, "adjustmentSecondaryDataURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addResourceWithType:fileURL:options:", 110, v23, 0);

  }
  objc_msgSend(v4, "adjustmentBasePhotoURL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v4, "adjustmentBasePhotoURL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addResourceWithType:fileURL:options:", 8, v25, 0);

  }
  objc_msgSend(v4, "adjustmentBaseVideoURL");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v4, "adjustmentBaseVideoURL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addResourceWithType:fileURL:options:", 12, v27, 0);

  }
  objc_msgSend(v4, "pairedVideoURL");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v4, "pairedVideoURL");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addResourceWithType:fileURL:options:", 9, v29, 0);

  }
  objc_msgSend(v4, "fullSizePairedVideoURL");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(v4, "fullSizePairedVideoURL");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addResourceWithType:fileURL:options:", 10, v31, 0);

  }
  objc_msgSend(v4, "adjustmentBasePairedVideoURL");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(v4, "adjustmentBasePairedVideoURL");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addResourceWithType:fileURL:options:", 11, v33, 0);

  }
  objc_msgSend(v4, "spatialOvercapturePhotoURL");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend(v4, "spatialOvercapturePhotoURL");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addResourceWithType:fileURL:options:", 13, v35, 0);

  }
  objc_msgSend(v4, "spatialOvercapturePairedVideoURL");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend(v4, "spatialOvercapturePairedVideoURL");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addResourceWithType:fileURL:options:", 15, v37, 0);

  }
  objc_msgSend(v4, "spatialOvercaptureVideoURL");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    objc_msgSend(v4, "spatialOvercaptureVideoURL");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addResourceWithType:fileURL:options:", 14, v39, 0);

  }
  v40 = objc_msgSend(v4, "videoComplementVisibilityState");
  if ((_DWORD)v40)
    objc_msgSend(v5, "setPhotoIrisVisibilityState:", v40);
  objc_msgSend(v4, "keywordTitles");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v41, "count"))
    objc_msgSend(v5, "setKeywordTitles:", v41);
  objc_msgSend(v4, "assetDescription");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v42, "length"))
    objc_msgSend(v5, "setAssetDescription:", v42);
  objc_msgSend(v4, "accessibilityDescription");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v43, "length"))
    objc_msgSend(v5, "setAccessibilityDescription:", v43);
  objc_msgSend(v4, "assetTitle");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44)
    objc_msgSend(v5, "setTitle:", v44);
  objc_msgSend(v4, "libraryCreationDate");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "libraryCreationDateTimeZone");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    objc_msgSend(v5, "setCreationDate:", v45);
    if (v46)
      objc_msgSend(v5, "setTimeZone:withDate:", v46, v45);
  }
  objc_msgSend(v4, "libraryLocation");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v48 = 0;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v48 = v47;
    if ((isKindOfClass & 1) == 0)
      goto LABEL_52;
  }
  objc_msgSend(v5, "setLocation:", v48);
LABEL_52:
  if (objc_msgSend(v4, "spatialOvercaptureResourcesPurgeable", v48))
    objc_msgSend(v5, "trashAllSpatialOverCaptureResources");

  return v5;
}

+ (id)creationRequestForAssetFromGuestAsset:(id)a3
{
  return (id)objc_msgSend(a1, "creationRequestForAssetFromGuestAsset:checkForMomentShareAsset:", a3, 1);
}

+ (id)creationRequestForAssetFromGuestAsset:(id)a3 checkForMomentShareAsset:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  PHAssetCreationOptions *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  char v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  char v53;
  NSObject *v54;
  void *v55;
  NSObject *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  __int16 v69;
  uint64_t v70;
  NSObject *v71;
  void *v72;
  uint64_t i;
  void *v74;
  id v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t j;
  void *v81;
  uint64_t v82;
  PHAssetResourceCreationOptions *v83;
  void *v84;
  NSObject *v85;
  void *v86;
  void *v87;
  NSObject *v88;
  void *v90;
  void *v91;
  void *v92;
  NSObject *v93;
  id obj;
  uint64_t v95;
  uint64_t v96;
  void *context;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  uint8_t buf[4];
  void *v111;
  __int16 v112;
  NSObject *v113;
  __int16 v114;
  void *v115;
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  _QWORD v119[4];

  v4 = a4;
  v119[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  +[PHPhotoLibrary photoLibraryForCurrentTransaction](PHPhotoLibrary, "photoLibraryForCurrentTransaction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "wellKnownPhotoLibraryIdentifier");

  if (v9 == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHAssetCreationRequest.m"), 1024, CFSTR("Expect the library being used is not the syndication library"));

  }
  objc_msgSend(v7, "fetchPropertySetsIfNeeded");
  objc_msgSend(v7, "curationProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "syndicationIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "length"))
  {
    if (!v4)
      goto LABEL_14;
  }
  else
  {
    PLSyndicationGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "uuid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v111 = v13;
      _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_ERROR, "creationRequestForAssetFromGuestAsset: %{public}@ missing syndicationIdentifier", buf, 0xCu);

    }
    if (!v4)
    {
LABEL_14:
      v28 = objc_msgSend(v7, "mediaType");
      if ((unint64_t)(v28 - 1) < 2)
      {
        objc_msgSend(v7, "mainFileURL");
        v31 = objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          v27 = v31;
          v32 = 0;
          goto LABEL_25;
        }
      }
      else if (v28 == 3 || !v28)
      {
        PLSyndicationGetLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v7, "uuid");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          +[PHAsset descriptionForMediaType:](PHAsset, "descriptionForMediaType:", objc_msgSend(v7, "mediaType"));
          v30 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v111 = v29;
          v112 = 2114;
          v113 = v30;
          _os_log_impl(&dword_1991EC000, v27, OS_LOG_TYPE_ERROR, "creationRequestForAssetFromGuestAsset: %{public}@ has media type %{public}@", buf, 0x16u);

        }
        v23 = 0;
        goto LABEL_87;
      }
      PLSyndicationGetLog();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "uuid");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v111 = v34;
        _os_log_impl(&dword_1991EC000, v33, OS_LOG_TYPE_ERROR, "creationRequestForAssetFromGuestAsset: %{public}@ mainFileURL is nil", buf, 0xCu);

      }
      v27 = 0;
      v32 = 1;
LABEL_25:
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject path](v27, "path");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v35, "fileExistsAtPath:", v36);

      if ((v37 & 1) == 0)
      {
        PLSyndicationGetLog();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v7, "uuid");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v111 = v39;
          v112 = 2112;
          v113 = v27;
          _os_log_impl(&dword_1991EC000, v38, OS_LOG_TYPE_ERROR, "creationRequestForAssetFromGuestAsset: %{public}@ file does not exist at mainFileURL %@", buf, 0x16u);

        }
      }
      if ((v32 & 1) != 0)
        goto LABEL_83;
      v93 = v27;
      if ((objc_msgSend(v7, "mediaSubtypes") & 8) != 0)
      {
        v108 = 0u;
        v109 = 0u;
        v106 = 0u;
        v107 = 0u;
        +[PHAssetResource assetResourcesForAsset:](PHAssetResource, "assetResourcesForAsset:", v7);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v106, v118, 16);
        if (v43)
        {
          v44 = v43;
          v45 = *(_QWORD *)v107;
LABEL_36:
          v46 = 0;
          while (1)
          {
            if (*(_QWORD *)v107 != v45)
              objc_enumerationMutation(v42);
            v47 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * v46);
            if (objc_msgSend(v47, "type") == 9)
              break;
            if (v44 == ++v46)
            {
              v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v106, v118, 16);
              if (v44)
                goto LABEL_36;
              goto LABEL_42;
            }
          }
          objc_msgSend(v47, "privateFileURL");
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          if (v48)
            goto LABEL_47;
        }
        else
        {
LABEL_42:

        }
        PLSyndicationGetLog();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v7, "uuid");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v111 = v50;
          _os_log_impl(&dword_1991EC000, v49, OS_LOG_TYPE_ERROR, "creationRequestForAssetFromGuestAsset: %{public}@ live photo video complement URL is nil", buf, 0xCu);

        }
        v48 = 0;
LABEL_47:
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "path");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v51, "fileExistsAtPath:", v52);

        if ((v53 & 1) == 0)
        {
          PLSyndicationGetLog();
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v7, "uuid");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "path");
            v56 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v111 = v55;
            v112 = 2112;
            v113 = v56;
            _os_log_impl(&dword_1991EC000, v54, OS_LOG_TYPE_ERROR, "creationRequestForAssetFromGuestAsset: %{public}@ videoComplementURL does not exist at path %@", buf, 0x16u);

          }
        }
        v57 = objc_alloc(MEMORY[0x1E0D75318]);
        objc_msgSend(v48, "path");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject path](v93, "path");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = (void *)objc_msgSend(v57, "initWithPathToVideo:pathToImage:", v58, v59);

        if (!v60)
        {
          PLSyndicationGetLog();
          v61 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v7, "uuid");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v111 = v62;
            _os_log_impl(&dword_1991EC000, v61, OS_LOG_TYPE_ERROR, "creationRequestForAssetFromGuestAsset: %{public}@ videoComplementBundle is nil", buf, 0xCu);

          }
        }
        objc_msgSend(a1, "creationRequestForAssetFromVideoComplementBundle:", v60);
        v63 = objc_claimAutoreleasedReturnValue();

        v27 = v93;
        if (!v63)
          goto LABEL_83;
      }
      else
      {
        v40 = objc_msgSend(v7, "mediaType");
        if (v40 == 1)
        {
          objc_msgSend(a1, "creationRequestForAssetFromImageAtFileURL:", v27);
          v41 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v40 != 2)
          {
LABEL_83:
            v23 = 0;
LABEL_84:
            PLSyndicationGetLog();
            v85 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v7, "uuid");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "placeholderForCreatedAsset");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v87, "uuid");
              v88 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v111 = v86;
              v112 = 2114;
              v113 = v88;
              v114 = 2114;
              v115 = v11;
              _os_log_impl(&dword_1991EC000, v85, OS_LOG_TYPE_ERROR, "creationRequestForAssetFromGuestAsset: %{public}@, new asset uuid: %{public}@, syndicationIdentifier: %{public}@", buf, 0x20u);

            }
            goto LABEL_87;
          }
          objc_msgSend(a1, "creationRequestForAssetFromVideoAtFileURL:", v27);
          v41 = objc_claimAutoreleasedReturnValue();
        }
        v63 = v41;
        if (!v41)
          goto LABEL_83;
      }
      objc_storeStrong((id *)(v63 + 1144), v11);
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "bundleIdentifier");
      v65 = objc_claimAutoreleasedReturnValue();
      v66 = *(void **)(v63 + 1136);
      *(_QWORD *)(v63 + 1136) = v65;

      objc_msgSend(v7, "importProperties");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v67, "importedBy");
      if ((unint64_t)(v68 - 1) < 0xC)
        v69 = v68;
      else
        v69 = 0;

      v92 = v11;
      if (v69)
      {
        v70 = v69;
      }
      else
      {
        PLSyndicationGetLog();
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1991EC000, v71, OS_LOG_TYPE_ERROR, "creationRequestForAssetFromGuestAsset: importSource was unknown, setting to GuestAssetSyndication", buf, 2u);
        }

        v70 = 12;
      }
      *(_QWORD *)(v63 + 1016) = v70;
      objc_msgSend(v7, "creationDate");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v63, "setCreationDate:", v72);

      v104 = 0u;
      v105 = 0u;
      v102 = 0u;
      v103 = 0u;
      v91 = (void *)v63;
      obj = *(id *)(v63 + 952);
      v96 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v117, 16);
      if (v96)
      {
        v95 = *(_QWORD *)v103;
        do
        {
          for (i = 0; i != v96; ++i)
          {
            if (*(_QWORD *)v103 != v95)
              objc_enumerationMutation(obj);
            v74 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * i);
            context = (void *)MEMORY[0x19AEBEADC]();
            v98 = 0u;
            v99 = 0u;
            v100 = 0u;
            v101 = 0u;
            v75 = v7;
            +[PHAssetResource assetResourcesForAsset:](PHAssetResource, "assetResourcesForAsset:", v7);
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v98, v116, 16);
            if (v77)
            {
              v78 = v77;
              v79 = *(_QWORD *)v99;
              do
              {
                for (j = 0; j != v78; ++j)
                {
                  if (*(_QWORD *)v99 != v79)
                    objc_enumerationMutation(v76);
                  v81 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * j);
                  v82 = objc_msgSend(v81, "type");
                  if (v82 == objc_msgSend(v74, "type"))
                  {
                    v83 = objc_alloc_init(PHAssetResourceCreationOptions);
                    objc_msgSend(v81, "originalFilename");
                    v84 = (void *)objc_claimAutoreleasedReturnValue();
                    -[PHAssetResourceCreationOptions setOriginalFilename:](v83, "setOriginalFilename:", v84);

                    objc_msgSend(v74, "setCreationOptions:", v83);
                  }
                }
                v78 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v98, v116, 16);
              }
              while (v78);
            }

            objc_autoreleasePoolPop(context);
            v7 = v75;
          }
          v96 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v117, 16);
        }
        while (v96);
      }

      v11 = v92;
      v27 = v93;
      v23 = v91;
      goto LABEL_84;
    }
  }
  v119[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v119, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHPhotoLibrary sharedMomentSharePhotoLibrary](PHPhotoLibrary, "sharedMomentSharePhotoLibrary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "librarySpecificFetchOptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHAsset fetchAssetsWithSyndicationIdentifiers:options:](PHAsset, "fetchAssetsWithSyndicationIdentifiers:options:", v14, v16);
  v17 = objc_claimAutoreleasedReturnValue();

  -[NSObject firstObject](v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "sourceType");

  if (v19 != 8)
  {

    goto LABEL_14;
  }
  v20 = objc_alloc_init(PHAssetCreationOptions);
  -[PHAssetCreationOptions setShouldDownloadOrCloudReReferenceMissingResources:](v20, "setShouldDownloadOrCloudReReferenceMissingResources:", 1);
  v21 = v17;
  -[NSObject firstObject](v17, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHAssetCreationRequest creationRequestForAssetCopyFromAsset:options:](PHAssetCreationRequest, "creationRequestForAssetCopyFromAsset:options:", v22, v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  PLSyndicationGetLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v22, "uuid");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v26 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v111 = v25;
    v112 = 2114;
    v113 = v26;
    _os_log_impl(&dword_1991EC000, v24, OS_LOG_TYPE_INFO, "creationRequestForAssetFromGuestAsset: Converting creation request into a native CMM save creationRequestForAssetCopyFromAsset since we found a MomentShare asset %{public}@ with the same syndicationIdentifier as %{public}@", buf, 0x16u);

  }
  v27 = v21;
LABEL_87:

  return v23;
}

+ (id)creationRequestForAssetCopyFromAsset:(id)a3 options:(id)a4
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
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  _QWORD v24[3];

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHAssetCreationRequest.m"), 1185, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  if (objc_msgSend(v8, "shouldDownloadOrCloudReReferenceMissingResources"))
  {
    v9 = -[PHAssetCreationRequest initForNewObject]([PHAssetCreationRequestPlaceholderSupport alloc], "initForNewObject");
    objc_msgSend(v8, "adjustmentBakeInOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setAdjustmentBakeInOptions:", v10);

    objc_msgSend(v8, "metadataCopyOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setMetadataCopyOptions:", v11);
LABEL_5:

    goto LABEL_9;
  }
  objc_msgSend(a1, "creationRequestForAssetWithOptions:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "adjustmentBakeInOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHAssetCreationRequest.m"), 1194, CFSTR("adjustmentBakeInOptions should only be set if shouldDownloadOrCloudReReferenceMissingResources is YES"));

  }
  objc_msgSend(v8, "metadataCopyOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHAssetCreationRequest.m"), 1195, CFSTR("metadataCopyOptions should only be set if shouldDownloadOrCloudReReferenceMissingResources is YES"));
    goto LABEL_5;
  }
LABEL_9:
  if (objc_msgSend(v8, "copyStillPhotoFromLivePhoto"))
    objc_msgSend(v9, "_setDuplicateLivePhotoAsStill:", 1);
  if (objc_msgSend(v8, "copyOriginal"))
    objc_msgSend(v9, "_setDuplicateAsOriginal:", 1);
  if (objc_msgSend(v8, "copySinglePhotoFromBurst"))
    objc_msgSend(v9, "_setDuplicateSinglePhotoFromBurst:", 1);
  if (objc_msgSend(v8, "copyAsAlternateAsset"))
    objc_msgSend(v9, "_setDuplicateAsAlternateAsset:", 1);
  if (objc_msgSend(v8, "useRecoverableStagingDirectory"))
    objc_msgSend(v9, "_setUseRecoverableStagingDirectory:", 1);
  if ((objc_msgSend(v8, "resetUserSpecificMetadata") & 1) == 0)
    objc_msgSend(v9, "_copyUserSpecificMetadataFromAsset:", v7);
  objc_msgSend(v7, "fetchPropertySetsIfNeeded");
  objc_msgSend(v7, "photosOneUpProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "reverseLocationData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setReverseLocationData:", v15);

  objc_msgSend(v7, "photosOneUpProperties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setReverseLocationDataIsValid:", objc_msgSend(v16, "reverseLocationDataIsValid"));

  objc_msgSend(v7, "preferredCropRect");
  if (PLCGRectIsNormalized())
  {
    objc_msgSend(v7, "preferredCropRect");
    objc_msgSend(v9, "setPreferredCropRectWithNormalizedRect:");
  }
  objc_msgSend(v7, "acceptableCropRect");
  if (PLCGRectIsNormalized())
  {
    objc_msgSend(v7, "acceptableCropRect");
    objc_msgSend(v9, "setAcceptableCropRectWithNormalizedRect:");
  }
  objc_msgSend(v7, "curationScore");
  objc_msgSend(v9, "setCurationScore:");
  objc_msgSend(v9, "_copyMetadataFromAsset:", v7);
  objc_msgSend(v9, "_copyMediaAnalysisProperties:", v7);
  objc_msgSend(v7, "localIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setDuplicateAssetIdentifier:", v17);

  objc_msgSend(v7, "photoLibrary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setDuplicateAssetPhotoLibraryType:", objc_msgSend(v18, "type"));

  if (v8)
    objc_msgSend(v8, "stillSourceTime");
  else
    memset(v24, 0, sizeof(v24));
  objc_msgSend(v9, "_setDuplicateStillSourceTime:", v24);
  objc_msgSend(v7, "keywordProperties");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "keywordTitles");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setKeywordTitles:", v20);

  return v9;
}

+ (id)creationRequestForAssetCopyFromAsset:(id)a3
{
  return (id)objc_msgSend(a1, "creationRequestForAssetCopyFromAsset:options:", a3, 0);
}

+ (BOOL)supportsAssetResourceTypes:(NSArray *)types
{
  return +[PHAssetResourceBag supportsAssetResourceTypes:mediaType:importedBy:](PHAssetResourceBag, "supportsAssetResourceTypes:mediaType:importedBy:", types, 0, 0);
}

+ (BOOL)supportsImportAssetResourceTypes:(id)a3
{
  return +[PHAssetResourceBag supportsAssetResourceTypes:mediaType:importedBy:](PHAssetResourceBag, "supportsAssetResourceTypes:mediaType:importedBy:", a3, 0, 5);
}

+ (BOOL)setDeferredIdentifierAndCreateDeferredDestinationURLFromCurrentDstURL:(id *)a3 withMainFileMetadata:(id)a4 managedAsset:(id)a5 photoLibrary:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  int v26;
  BOOL v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  NSObject *v36;
  id v38;
  uint8_t buf[4];
  id v40;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v12, "mainFileURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v12, "mainFileURL");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    *a3 = v15;
  }
  else
  {
    v15 = *a3;
  }
  v16 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v15, "path");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fileURLWithPath:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D719A8], "deferredPhotoPreviewDestinationURLForPrimaryAssetURL:", *a3);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  *a3 = v19;
  v20 = (void *)MEMORY[0x1E0D73208];
  objc_msgSend(v13, "pathManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "capabilities");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  objc_msgSend(v20, "secureMoveItemAtURL:toURL:capabilities:error:", v18, v19, v22, &v38);
  v23 = v38;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a3, "path");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v20) = objc_msgSend(v24, "fileExistsAtPath:", v25);

  v26 = PLIsErrorOrUnderlyingErrorFileNotFound() & v20;
  if (v23)
    v27 = v26;
  else
    v27 = 1;
  if (v27)
  {
    v28 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v11, "imageCaptureRequestIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "photoProcessingIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringWithFormat:", CFSTR("%@/%@"), v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "additionalAttributes");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setDeferredPhotoIdentifier:", v31);

    objc_msgSend(v12, "setDeferredProcessingNeeded:", 1);
    v33 = 0;
  }
  else
  {
    v34 = (void *)MEMORY[0x1E0CB35C8];
    v41 = *MEMORY[0x1E0CB2D50];
    v42[0] = CFSTR("PhotoKit Deferred Processing: Failure to move destination URL file to file with deferred suffix.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3123, v35);
    v33 = (id)objc_claimAutoreleasedReturnValue();

    PLPhotoKitGetLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v40 = v23;
      _os_log_impl(&dword_1991EC000, v36, OS_LOG_TYPE_ERROR, "PhotoKit Deferred Processing: Failed to move file to one with deferred suffix attached. %{public}@", buf, 0xCu);
    }

    if (a7 && v33)
    {
      v33 = objc_retainAutorelease(v33);
      *a7 = v33;
    }
  }

  return v27;
}

+ (BOOL)setdbgFileWithAsset:(id)a3 dbgFilePath:(id)a4 photoFilename:(id)a5
{
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  NSObject *v17;
  uint8_t v19[8];
  uint64_t v20;
  uint8_t buf[16];

  v7 = (void *)MEMORY[0x1E0C99E98];
  v8 = a5;
  v9 = a3;
  objc_msgSend(v7, "fileURLWithPath:isDirectory:", a4, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0D71880];
  objc_msgSend(v9, "photoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "diagnosticFilePathForLibrary:mainFilename:createIfNeeded:", v12, v8, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    PLPhotoKitIngestGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_ERROR, "Failed to get diagnostic destination path.", buf, 2u);
    }
    v14 = 0;
    v15 = 1;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 1;
  if (v14)
  {
    if (v10)
    {
      v20 = 0;
      if ((objc_msgSend(MEMORY[0x1E0D73208], "copyItemAtURL:toURL:error:", v10, v14, &v20) & 1) == 0)
      {
        PLPhotoKitIngestGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v19 = 0;
          _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_ERROR, "Failed to copy DBG source file to CaptureDebug destination.", v19, 2u);
        }

        v15 = 0;
        v17 = v10;
        v10 = 0;
LABEL_11:

      }
    }
  }

  return v15;
}

+ (BOOL)_shouldGenerateThumbnailsDuringCreationForImageSource:(CGImageSource *)a3 contentType:(id)a4 timeZoneLookup:(id)a5
{
  id v7;
  id v8;
  void *v9;
  CFDictionaryRef v10;
  char v11;

  v7 = a4;
  v8 = a5;
  if (objc_msgSend(v7, "conformsToType:", *MEMORY[0x1E0CEC5B8]))
  {
    v9 = (void *)MEMORY[0x19AEBEADC]();
    v10 = CGImageSourceCopyProperties(a3, 0);
    if (v10)
      v11 = objc_msgSend(MEMORY[0x1E0D75130], "embeddedJPEGSuitableForDerivativesInRawImageSource:enforcePixelCountLimits:timeZoneLookup:", a3, 1, v8);
    else
      v11 = 0;

    objc_autoreleasePoolPop(v9);
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

+ (id)_cameraMetadataURLForPrimaryAssetURL:(id)a3 photoLibrary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  objc_msgSend(a4, "pathManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "privateDirectoryWithSubType:createIfNeeded:error:", 9, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "lastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByDeletingPathExtension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathExtension:", *MEMORY[0x1E0D74A68]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v7, "stringByAppendingPathComponent:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fileURLWithPath:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_photoIrisIndicatorFilePathForPhotoAtPath:(id)a3 UUID:(id)a4
{
  void *v4;
  void *v6;
  id v7;
  void *v8;

  v4 = 0;
  if (a3 && a4)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = a3;
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%@.%@"), CFSTR("iris_pending_"), a4, CFSTR("irs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathComponent:", v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

+ (id)_imageIOThumbnailCreationOptionsFromDerivativeContext:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v25[2];
  double v26;
  double v27;
  _QWORD v28[7];
  _QWORD v29[8];

  v29[7] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!objc_msgSend(v3, "maxPixelSize"))
  {
    objc_msgSend(v3, "assetOrientedImageSize");
    v5 = v4;
    objc_msgSend(v3, "assetOrientedImageSize");
    v7 = v6;
    objc_msgSend(v3, "assetOrientation");
    v8 = PLIsRotatedExifOrientation();
    if (v8)
      v9 = v7;
    else
      v9 = v5;
    if (!v8)
      v5 = v7;
    objc_msgSend(v3, "embeddedThumbnailSize");
    v11 = v10;
    objc_msgSend(v3, "embeddedThumbnailSize");
    if (v11 < v12)
      v11 = v12;
    v26 = 0.0;
    v27 = 0.0;
    v25[0] = 0;
    v25[1] = 0;
    v13 = (void *)MEMORY[0x1E0D71880];
    objc_msgSend(v3, "assetOrientedImageSize");
    objc_msgSend(v13, "computePreCropThumbnailSize:andPostCropSize:forOrientedOriginalSize:andCroppedSize:isLargeThumbnail:", &v26, v25, 0, v9, v5, v14, v15);
    v16 = v26;
    if (v26 < v27)
      v16 = v27;
    if (v11 >= v16)
      v16 = v11;
    objc_msgSend(v3, "setMaxPixelSize:", (uint64_t)v16);
  }
  v28[0] = *MEMORY[0x1E0CBC778];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v3, "maxPixelSize"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0CBD190];
  v29[0] = v17;
  v29[1] = MEMORY[0x1E0C9AAB0];
  v19 = *MEMORY[0x1E0CBD288];
  v28[1] = v18;
  v28[2] = v19;
  v29[2] = MEMORY[0x1E0C9AAB0];
  v29[3] = MEMORY[0x1E0C9AAB0];
  v20 = *MEMORY[0x1E0CBD1A0];
  v28[3] = CFSTR("kCGImageSourceKeepOriginalProfile");
  v28[4] = v20;
  v21 = *MEMORY[0x1E0CBC760];
  v29[4] = *MEMORY[0x1E0CBD1B8];
  v29[5] = MEMORY[0x1E0C9AAB0];
  v22 = *MEMORY[0x1E0CBC7B0];
  v28[5] = v21;
  v28[6] = v22;
  v29[6] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)_jpegDataFromRAWData:(id)a3 derivativeContext:(id)a4
{
  const __CFData *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const __CFDictionary *v10;
  CGImageSource *v11;
  CGImageSource *v12;
  CFDictionaryRef v13;
  void *v14;
  NSRange v15;
  BOOL v16;
  unint64_t v17;
  __CFData *v18;
  __CFString *v19;
  uint64_t v20;
  CGImageDestination *v21;
  const __CFDictionary *v22;
  uint64_t v23;
  _BYTE *v24;
  double v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  CGImageSource *v33;
  int v34;
  uint64_t v35;
  const __CFDictionary *v36;
  const __CFDictionary *v37;
  CGImage *ImageAtIndex;
  double Width;
  double Height;
  double v41;
  double v42;
  BOOL v44;
  __CFData *v46;
  __CFString *v47;
  CGImageDestination *v48;
  void *v49;
  const __CFDictionary *v50;
  __CFData *v51;
  uint64_t v53;
  void *v54;
  const __CFDictionary *v55;
  void *v56;
  void *v57;
  NSString *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD v66[2];
  _QWORD v67[4];

  v67[2] = *MEMORY[0x1E0C80C00];
  v5 = (const __CFData *)a3;
  v6 = a4;
  if (v5 && -[__CFData length](v5, "length"))
  {
    v7 = *MEMORY[0x1E0CBD258];
    v67[0] = MEMORY[0x1E0C9AAB0];
    v8 = *MEMORY[0x1E0CBD2A8];
    v66[0] = v7;
    v66[1] = v8;
    objc_msgSend(v6, "originalUTI");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v67[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 2);
    v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    v11 = CGImageSourceCreateWithData(v5, v10);
    if (!v11)
    {
      v13 = 0;
      v18 = 0;
LABEL_60:

      goto LABEL_61;
    }
    v12 = v11;
    v13 = CGImageSourceCopyPropertiesAtIndex(v11, 0, v10);
    -[__CFDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD068]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("jpegThumbnail"));
    v58 = (NSString *)objc_claimAutoreleasedReturnValue();
    v15 = NSRangeFromString(v58);
    if (v15.length)
      v16 = v15.location == 0;
    else
      v16 = 1;
    v17 = 0x1E0C99000uLL;
    if (v16 || v15.location + v15.length > -[__CFData length](v5, "length"))
    {
      v59 = objc_msgSend(v6, "assetOrientation");
    }
    else
    {
      v56 = v14;
      v23 = -[__CFData bytes](objc_retainAutorelease(v5), "bytes");
      v24 = malloc_type_malloc(v15.length, 0xF75F9253uLL);
      memcpy(v24, (const void *)(v23 + v15.location), v15.length);
      *v24 = -1;
      v20 = 1;
      v18 = (__CFData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithBytesNoCopy:length:freeWhenDone:", v24, v15.length, 1);
      v59 = objc_msgSend(v6, "assetOrientation");
      if (v18)
      {
        v14 = v56;
        goto LABEL_16;
      }
      v14 = v56;
      v17 = 0x1E0C99000;
    }
    v18 = (__CFData *)objc_alloc_init(*(Class *)(v17 + 3568));
    objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v20 = 1;
    v21 = CGImageDestinationCreateWithData(v18, v19, 1uLL, 0);

    if (v21)
    {
      +[PHAssetCreationRequest _imageIOThumbnailCreationOptionsFromDerivativeContext:](PHAssetCreationRequest, "_imageIOThumbnailCreationOptionsFromDerivativeContext:", v6);
      v22 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CGImageDestinationAddImageFromSource(v21, v12, 0, v22);
      CGImageDestinationFinalize(v21);
      CFRelease(v21);

      v20 = v59;
    }
LABEL_16:
    if (!-[__CFData length](v18, "length"))
    {
LABEL_59:
      CFRelease(v12);

      goto LABEL_60;
    }
    v55 = v13;
    v57 = v14;
    if (v20 != 1)
    {
      v33 = 0;
LABEL_48:
      if (v20 != v59)
      {
        v46 = (__CFData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
        objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
        v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v48 = CGImageDestinationCreateWithData(v46, v47, 1uLL, 0);

        if (v48)
        {
          if (!v33)
            v33 = CGImageSourceCreateWithData(v18, 0);
          v60 = *MEMORY[0x1E0CBD0C0];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v59);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = v49;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
          v50 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

          CGImageDestinationAddImageFromSource(v48, v33, 0, v50);
          CGImageDestinationFinalize(v48);
          CFRelease(v48);
          if (-[__CFData length](v46, "length"))
          {
            v51 = v46;

            v18 = v51;
          }

        }
        v14 = v57;

      }
      if (v33)
        CFRelease(v33);
      v13 = v55;
      goto LABEL_59;
    }
    objc_msgSend(v6, "assetOrientedImageSize");
    v26 = (uint64_t)v25;
    objc_msgSend(v6, "assetOrientedImageSize");
    v28 = (uint64_t)v27;
    objc_msgSend(v6, "originalUTI");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v28;
    v54 = v29;
    if (v26 && v28 && v26 == v28)
    {
      v30 = v29;
      if ((objc_msgSend(v29, "isEqualToString:", CFSTR("com.hasselblad.fff-raw-image")) & 1) == 0)
      {
        -[__CFDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD090]);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD0B8]);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v32, "isEqualToString:", CFSTR("Hasselblad CFV - Hasselblad 500")))
        {

        }
        else
        {
          v34 = objc_msgSend(v30, "isEqualToString:", CFSTR("com.hasselblad.3fr-raw-image"));

          if (!v34)
            goto LABEL_29;
        }
      }
      if (v59 != 1)
      {
        v33 = 0;
LABEL_46:
        v20 = v59;
        goto LABEL_47;
      }
    }
LABEL_29:
    v35 = *MEMORY[0x1E0CBD288];
    v64 = *MEMORY[0x1E0CBD288];
    v65 = MEMORY[0x1E0C9AAB0];
    v20 = 1;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
    v36 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v33 = CGImageSourceCreateWithData(v18, v36);

    if (v33)
    {
      v62 = v35;
      v63 = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
      v37 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v33, 0, v37);

      if (ImageAtIndex)
      {
        Width = (double)CGImageGetWidth(ImageAtIndex);
        Height = (double)CGImageGetHeight(ImageAtIndex);
        CGImageRelease(ImageAtIndex);
      }
      else
      {
        Width = *MEMORY[0x1E0C9D820];
        Height = *(double *)(MEMORY[0x1E0C9D820] + 8);
      }
      v41 = (double)v26 / (double)v53;
      v42 = Width / Height;
      if (v41 > 1.0 && v42 > 1.0)
        goto LABEL_46;
      v44 = v42 < 1.0 && v41 < 1.0;
      if (v44 || v41 == v42)
        goto LABEL_46;
      v20 = 1;
    }
LABEL_47:
    v14 = v57;

    goto LABEL_48;
  }
  v18 = 0;
LABEL_61:

  return v18;
}

+ (id)_uuidForAssetWithSyndicationIdentifier:(id)a3 inLibrary:(id)a4 isTrashed:(BOOL *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  uint64_t v46;
  _QWORD v47[2];
  id v48;
  _QWORD v49[5];

  v49[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0CB3528];
  v10 = (void *)MEMORY[0x1E0D71880];
  v48 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateForSyndicatedAssetIdentifiers:includeRejected:", v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v12;
  objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForUserLibrary"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "andPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(MEMORY[0x1E0D71880], "entityName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fetchRequestWithEntityName:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setPredicate:", v15);
  objc_msgSend(v18, "setFetchLimit:", 1);
  v47[0] = CFSTR("uuid");
  v47[1] = CFSTR("trashedState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setPropertiesToFetch:", v19);

  objc_msgSend(v18, "setResultType:", 2);
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__13099;
  v39 = __Block_byref_object_dispose__13100;
  v40 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __85__PHAssetCreationRequest__uuidForAssetWithSyndicationIdentifier_inLibrary_isTrashed___block_invoke;
  v26[3] = &unk_1E35DE5F8;
  v20 = v8;
  v27 = v20;
  v21 = v18;
  v28 = v21;
  v29 = &v35;
  v30 = &v31;
  objc_msgSend(v20, "performBlockAndWait:", v26);
  PLSyndicationGetLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v23 = v36[5];
    *(_DWORD *)buf = 138543874;
    v42 = v7;
    v43 = 2112;
    v44 = v20;
    v45 = 2114;
    v46 = v23;
    _os_log_impl(&dword_1991EC000, v22, OS_LOG_TYPE_INFO, "_uuidForAssetWithSyndicationIdentifier:%{public}@ from photoLibrary %@ is %{public}@", buf, 0x20u);
  }

  if (a5)
    *a5 = *((_BYTE *)v32 + 24);
  v24 = (id)v36[5];

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

  return v24;
}

+ (int64_t)_originalResourceTypeFromAdjustedResourceType:(int64_t)a3 sourceAssetIsLoopingVideo:(BOOL)a4 sourceAssetIsVideo:(BOOL)a5
{
  int64_t v5;
  int64_t v6;
  _BOOL8 v7;

  v5 = 9;
  if (a4)
    v5 = 2;
  v6 = 2;
  v7 = !a4 && !a5;
  if (a3 != 5)
    v7 = 0;
  if (a3 != 6)
    v6 = v7;
  if (a3 == 10)
    return v5;
  else
    return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __85__PHAssetCreationRequest__uuidForAssetWithSyndicationIdentifier_inLibrary_isTrashed___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v11 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v11;

  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uuid"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("trashedState"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v10 != 0;

}

@end
