@implementation MPCAssetLoadPropertiesLocalFileEvaluator

- (MPCAssetLoadPropertiesLocalFileEvaluator)initWithPlaybackEngine:(id)a3
{
  id v4;
  MPCAssetLoadPropertiesLocalFileEvaluator *v5;
  MPCAssetLoadPropertiesLocalFileEvaluator *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MPCAssetLoadPropertiesLocalFileEvaluator;
  v5 = -[MPCAssetLoadPropertiesLocalFileEvaluator init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_playbackEngine, v4);

  return v6;
}

- (id)evaluateAssetLoadProperties:(id)a3 allowingCachedAssets:(BOOL)a4 defaults:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  MPCAssetLoadPropertiesLocalFileEvaluation *v10;
  void *v11;
  MPCAssetLoadPropertiesLocalFileEvaluation *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  MPCAssetLoadPropertiesLocalFileEvaluation *v17;
  int64_t v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  int v22;
  void *v23;
  int v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  int v28;
  void *v29;
  MPCAssetLoadPropertiesLocalFileEvaluator *v30;
  void *v31;
  id v32;
  uint64_t v33;
  BOOL v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  uint64_t v39;
  uint64_t v40;
  int v41;
  int v42;
  NSObject *v43;
  void *v44;
  void *v45;
  BOOL v46;
  NSObject *v47;
  NSObject *v48;
  _BOOL4 v49;
  char v50;
  NSObject *v51;
  const char *v52;
  uint64_t v53;
  _BOOL8 v54;
  uint64_t v55;
  uint64_t v56;
  _BOOL4 v57;
  uint8_t buf[4];
  MPCAssetLoadPropertiesLocalFileEvaluator *v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v6 = a4;
  v62 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = [MPCAssetLoadPropertiesLocalFileEvaluation alloc];
  objc_msgSend(v8, "fileAsset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MPCAssetLoadPropertiesLocalFileEvaluation initWithFileAsset:](v10, "initWithFileAsset:", v11);

  -[MPCAssetLoadPropertiesLocalFileEvaluation setStatus:](v12, "setStatus:", 0);
  -[MPCAssetLoadPropertiesLocalFileEvaluation setHLSContentPolicy:](v12, "setHLSContentPolicy:", objc_msgSend(v8, "HLSContentPolicy"));
  -[MPCAssetLoadPropertiesLocalFileEvaluation fileAsset](v12, "fileAsset");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    -[MPCAssetLoadPropertiesLocalFileEvaluation setFileIsDownloaded:](v12, "setFileIsDownloaded:", objc_msgSend(v13, "isNonPurgeable"));
    -[MPCAssetLoadPropertiesLocalFileEvaluation setFileIsCached:](v12, "setFileIsCached:", objc_msgSend(v14, "isNonPurgeable") ^ 1);
    objc_msgSend(v14, "filePath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v15, "length"))
    {
      v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v59 = self;
        _os_log_impl(&dword_210BD8000, v20, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: [Asset caching] - Unusable local file asset [Missing cached or downloaded file]", buf, 0xCu);
      }

      -[MPCAssetLoadPropertiesLocalFileEvaluation setStatus:](v12, "setStatus:", 3);
      v18 = -[MPCAssetLoadPropertiesLocalFileEvaluator _recommendationForEvaluation:assetCachingIsAllowed:userDefaults:](self, "_recommendationForEvaluation:assetCachingIsAllowed:userDefaults:", v12, v6, v9);
      v17 = v12;
      goto LABEL_14;
    }
    -[MPCAssetLoadPropertiesLocalFileEvaluation setFilePath:](v12, "setFilePath:", v15);
    if (-[MPCAssetLoadPropertiesLocalFileEvaluation fileIsCached](v12, "fileIsCached") && !v6)
    {
      v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v59 = self;
        _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: [Asset caching] - Unusable local file asset [Cached assets not allowed]", buf, 0xCu);
      }

      -[MPCAssetLoadPropertiesLocalFileEvaluation setStatus:](v12, "setStatus:", 5);
      v17 = v12;
      v18 = 0;
LABEL_14:
      -[MPCAssetLoadPropertiesLocalFileEvaluation setRecommendation:](v17, "setRecommendation:", v18);
LABEL_41:

      goto LABEL_42;
    }
    -[MPCAssetLoadPropertiesLocalFileEvaluation setFileIsHLS:](v12, "setFileIsHLS:", -[MPCAssetLoadPropertiesLocalFileEvaluator isHLSFileAsset:](self, "isHLSFileAsset:", v14));
    -[MPCAssetLoadPropertiesLocalFileEvaluation setFileAssetType:](v12, "setFileAssetType:", -[MPCAssetLoadPropertiesLocalFileEvaluator _loadedAudioAssetTypeForFileAsset:](self, "_loadedAudioAssetTypeForFileAsset:", v14));
    -[MPCAssetLoadPropertiesLocalFileEvaluation setExpectedAssetType:](v12, "setExpectedAssetType:", objc_msgSend(v8, "preferredAudioAssetType"));
    -[MPCAssetLoadPropertiesLocalFileEvaluation setFileQualityType:](v12, "setFileQualityType:", objc_msgSend(v14, "qualityType"));
    if (objc_msgSend(v8, "prefersHighQualityContent"))
      v21 = 2;
    else
      v21 = 1;
    -[MPCAssetLoadPropertiesLocalFileEvaluation setExpectedQualityType:](v12, "setExpectedQualityType:", v21);
    if (-[MPCAssetLoadPropertiesLocalFileEvaluation fileIsHLS](v12, "fileIsHLS")
      && objc_msgSend(v8, "HLSContentPolicy") == 3)
    {
      v22 = 1;
    }
    else
    {
      v22 = 0;
      if (-[MPCAssetLoadPropertiesLocalFileEvaluation fileIsHLS](v12, "fileIsHLS"))
        goto LABEL_29;
    }
    -[MPCAssetLoadPropertiesLocalFileEvaluator playbackEngine](self, "playbackEngine");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v23, "isVocalAttenuationEnabled") & 1) != 0)
    {
      v24 = objc_msgSend(v8, "supportsVocalAttenuation");

      if (v24)
      {
        v25 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v59 = self;
          _os_log_impl(&dword_210BD8000, v25, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: [Asset caching] - Unusable local file asset [vocal attenuation enabled for supported item]", buf, 0xCu);
        }

        -[MPCAssetLoadPropertiesLocalFileEvaluation setFileMatchesRequiredQuality:](v12, "setFileMatchesRequiredQuality:", 0);
        -[MPCAssetLoadPropertiesLocalFileEvaluation setFileMatchesRequiredFileFormat:](v12, "setFileMatchesRequiredFileFormat:", 0);
        -[MPCAssetLoadPropertiesLocalFileEvaluation setStatus:](v12, "setStatus:", 7);
        -[MPCAssetLoadPropertiesLocalFileEvaluation setRecommendation:](v12, "setRecommendation:", 0);
        v26 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          goto LABEL_40;
        goto LABEL_39;
      }
    }
    else
    {

    }
LABEL_29:
    v57 = v6;
    objc_msgSend(v8, "storeAsset");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "endpointType") == 2)
    {

      goto LABEL_33;
    }
    v28 = v22;
    objc_msgSend(v8, "storeAsset");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = self;
    v31 = v15;
    v32 = v9;
    v33 = objc_msgSend(v29, "endpointType");

    v34 = v33 == 1;
    v9 = v32;
    v15 = v31;
    self = v30;
    if (v34)
    {
LABEL_33:
      v35 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v59 = self;
        _os_log_impl(&dword_210BD8000, v35, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: [Asset caching] - Local file asset is usable as is [Purchased or matched content]", buf, 0xCu);
      }

      -[MPCAssetLoadPropertiesLocalFileEvaluation setFileMatchesRequiredFileFormat:](v12, "setFileMatchesRequiredFileFormat:", 1);
      -[MPCAssetLoadPropertiesLocalFileEvaluation setFileMatchesRequiredQuality:](v12, "setFileMatchesRequiredQuality:", 1);
      -[MPCAssetLoadPropertiesLocalFileEvaluation setStatus:](v12, "setStatus:", 1);
      if (v57)
        v36 = 3;
      else
        v36 = 0;
      -[MPCAssetLoadPropertiesLocalFileEvaluation setRecommendation:](v12, "setRecommendation:", v36);
      v26 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        goto LABEL_40;
      goto LABEL_39;
    }
    v39 = -[MPCAssetLoadPropertiesLocalFileEvaluation expectedAssetType](v12, "expectedAssetType");
    v40 = v39;
    if (v39 < 2 || -[MPCAssetLoadPropertiesLocalFileEvaluation fileIsHLS](v12, "fileIsHLS"))
    {
      v41 = -[MPCAssetLoadPropertiesLocalFileEvaluation fileIsHLS](v12, "fileIsHLS");
      if (v40 < 2)
        v42 = v41;
      else
        v42 = 0;
    }
    else
    {
      v42 = 1;
    }
    -[MPCAssetLoadPropertiesLocalFileEvaluation setFileMatchesRequiredFileFormat:](v12, "setFileMatchesRequiredFileFormat:", v42 ^ 1u);
    if (v28)
    {
      if (-[MPCAssetLoadPropertiesLocalFileEvaluation fileAssetType](v12, "fileAssetType") >= 2
        && -[MPCAssetLoadPropertiesLocalFileEvaluation expectedAssetType](v12, "expectedAssetType") == 1)
      {
        _MPCLogCategoryPlayback();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v59 = v30;
          _os_log_impl(&dword_210BD8000, v43, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: [Asset caching] - Local HLS asset of compatible quality [HLS file for CRABS desired playback] - Overriding HLSPolicyContentForbidden", buf, 0xCu);
        }

        -[MPCAssetLoadPropertiesLocalFileEvaluation setFileMatchesRequiredQuality:](v12, "setFileMatchesRequiredQuality:", 1);
        -[MPCAssetLoadPropertiesLocalFileEvaluation setStatus:](v12, "setStatus:", 1);
        -[MPCAssetLoadPropertiesLocalFileEvaluation setRecommendation:](v12, "setRecommendation:", -[MPCAssetLoadPropertiesLocalFileEvaluator _recommendationForEvaluation:assetCachingIsAllowed:userDefaults:](v30, "_recommendationForEvaluation:assetCachingIsAllowed:userDefaults:", v12, v57, v9));
        _MPCLogCategoryPlayback();
        v26 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          goto LABEL_40;
      }
      else
      {
        _MPCLogCategoryPlayback();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v59 = v30;
          _os_log_impl(&dword_210BD8000, v47, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: [Asset caching] - Unusable local file asset [HLS file not allowed for playback]", buf, 0xCu);
        }

        -[MPCAssetLoadPropertiesLocalFileEvaluation setFileMatchesRequiredQuality:](v12, "setFileMatchesRequiredQuality:", 0);
        -[MPCAssetLoadPropertiesLocalFileEvaluation setFileMatchesRequiredFileFormat:](v12, "setFileMatchesRequiredFileFormat:", 0);
        -[MPCAssetLoadPropertiesLocalFileEvaluation setStatus:](v12, "setStatus:", 6);
        -[MPCAssetLoadPropertiesLocalFileEvaluation setRecommendation:](v12, "setRecommendation:", -[MPCAssetLoadPropertiesLocalFileEvaluator _recommendationForEvaluation:assetCachingIsAllowed:userDefaults:](v30, "_recommendationForEvaluation:assetCachingIsAllowed:userDefaults:", v12, v57, v9));
        _MPCLogCategoryPlayback();
        v26 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          goto LABEL_40;
      }
      goto LABEL_39;
    }
    objc_msgSend(v14, "hlsKeyServerURL");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v44, "length"))
    {
      objc_msgSend(v14, "hlsKeyCertificateURL");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "length") != 0;

    }
    else
    {
      v46 = 0;
    }

    if (-[MPCAssetLoadPropertiesLocalFileEvaluation fileIsHLS](v12, "fileIsHLS") && !v46)
    {
      _MPCLogCategoryPlayback();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v59 = self;
        _os_log_impl(&dword_210BD8000, v48, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: [Asset caching] - Unusable local file asset [HLS file with missing hls keys]", buf, 0xCu);
      }

      -[MPCAssetLoadPropertiesLocalFileEvaluation setStatus:](v12, "setStatus:", 4);
      -[MPCAssetLoadPropertiesLocalFileEvaluation setRecommendation:](v12, "setRecommendation:", -[MPCAssetLoadPropertiesLocalFileEvaluator _recommendationForEvaluation:assetCachingIsAllowed:userDefaults:](self, "_recommendationForEvaluation:assetCachingIsAllowed:userDefaults:", v12, v57, v9));
      _MPCLogCategoryPlayback();
      v26 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        goto LABEL_40;
LABEL_39:
      -[MPCAssetLoadPropertiesLocalFileEvaluation humanDescription](v12, "humanDescription");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v59 = self;
      v60 = 2114;
      v61 = v37;
      _os_log_impl(&dword_210BD8000, v26, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: [Asset caching] - %{public}@", buf, 0x16u);

LABEL_40:
      goto LABEL_41;
    }
    -[MPCAssetLoadPropertiesLocalFileEvaluation setStatus:](v12, "setStatus:", 1);
    v49 = -[MPCAssetLoadPropertiesLocalFileEvaluation fileIsHLS](v12, "fileIsHLS");
    v50 = _os_feature_enabled_impl();
    if (v49)
    {
      if ((v50 & 1) == 0 && -[MPCAssetLoadPropertiesLocalFileEvaluation fileIsDownloaded](v12, "fileIsDownloaded"))
      {
        -[MPCAssetLoadPropertiesLocalFileEvaluation setFileMatchesRequiredQuality:](v12, "setFileMatchesRequiredQuality:", 1);
        _MPCLogCategoryPlayback();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v59 = self;
          v52 = "[AL] - %{public}@: [Asset caching] - Downloaded asset matches quality [Upgrade on play is off]";
LABEL_92:
          _os_log_impl(&dword_210BD8000, v51, OS_LOG_TYPE_DEFAULT, v52, buf, 0xCu);
          goto LABEL_93;
        }
        goto LABEL_93;
      }
      if (!-[MPCAssetLoadPropertiesLocalFileEvaluation fileMatchesRequiredFileFormat](v12, "fileMatchesRequiredFileFormat"))
      {
        -[MPCAssetLoadPropertiesLocalFileEvaluation setFileMatchesRequiredQuality:](v12, "setFileMatchesRequiredQuality:", 0);
        if (-[MPCAssetLoadPropertiesLocalFileEvaluation fileAssetType](v12, "fileAssetType") >= 2
          && -[MPCAssetLoadPropertiesLocalFileEvaluation expectedAssetType](v12, "expectedAssetType") == 1)
        {
          -[MPCAssetLoadPropertiesLocalFileEvaluation setFileMatchesRequiredQuality:](v12, "setFileMatchesRequiredQuality:", 1);
          _MPCLogCategoryPlayback();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v59 = self;
            v52 = "[AL] - %{public}@: [Asset caching] - Local HLS asset of compatible quality [HLS file for CRABS desired"
                  " playback] - Overriding file format mismatch";
            goto LABEL_92;
          }
          goto LABEL_93;
        }
        if (-[MPCAssetLoadPropertiesLocalFileEvaluation fileAssetType](v12, "fileAssetType") >= 2
          && !-[MPCAssetLoadPropertiesLocalFileEvaluation expectedAssetType](v12, "expectedAssetType"))
        {
          -[MPCAssetLoadPropertiesLocalFileEvaluation setFileMatchesRequiredQuality:](v12, "setFileMatchesRequiredQuality:", 1);
          _MPCLogCategoryPlayback();
          v51 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            goto LABEL_93;
          *(_DWORD *)buf = 138543362;
          v59 = self;
          v52 = "[AL] - %{public}@: [Asset caching] - Unexpected combination local HLS file for unspecified requirement ["
                "HLS file for non-specified desired playback] - Overriding file format mismatch";
          goto LABEL_92;
        }
LABEL_101:
        -[MPCAssetLoadPropertiesLocalFileEvaluation setRecommendation:](v12, "setRecommendation:", -[MPCAssetLoadPropertiesLocalFileEvaluator _recommendationForEvaluation:assetCachingIsAllowed:userDefaults:](self, "_recommendationForEvaluation:assetCachingIsAllowed:userDefaults:", v12, v57, v9));
        _MPCLogCategoryPlayback();
        v26 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          goto LABEL_40;
        goto LABEL_39;
      }
      if (-[MPCAssetLoadPropertiesLocalFileEvaluation fileAssetType](v12, "fileAssetType") >= 3
        && -[MPCAssetLoadPropertiesLocalFileEvaluation expectedAssetType](v12, "expectedAssetType") == 2)
      {
        -[MPCAssetLoadPropertiesLocalFileEvaluation setFileMatchesRequiredQuality:](v12, "setFileMatchesRequiredQuality:", 1);
        _MPCLogCategoryPlayback();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v59 = self;
          v52 = "[AL] - %{public}@: [Asset caching] - Local asset of acceptable quality [Higher than desired quality]";
          goto LABEL_92;
        }
        goto LABEL_93;
      }
      v55 = -[MPCAssetLoadPropertiesLocalFileEvaluation fileAssetType](v12, "fileAssetType");
      v54 = v55 == -[MPCAssetLoadPropertiesLocalFileEvaluation expectedAssetType](v12, "expectedAssetType");
    }
    else
    {
      if ((v50 & 1) == 0 && -[MPCAssetLoadPropertiesLocalFileEvaluation fileIsDownloaded](v12, "fileIsDownloaded"))
      {
        -[MPCAssetLoadPropertiesLocalFileEvaluation setFileMatchesRequiredQuality:](v12, "setFileMatchesRequiredQuality:", 1);
        _MPCLogCategoryPlayback();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v59 = self;
          v52 = "[AL] - %{public}@: [Asset caching] - Downloaded asset matches quality [Upgrade on play is off]";
          goto LABEL_92;
        }
LABEL_93:

        goto LABEL_101;
      }
      if (!-[MPCAssetLoadPropertiesLocalFileEvaluation fileMatchesRequiredFileFormat](v12, "fileMatchesRequiredFileFormat"))
      {
        -[MPCAssetLoadPropertiesLocalFileEvaluation setFileMatchesRequiredQuality:](v12, "setFileMatchesRequiredQuality:", 0);
        _MPCLogCategoryPlayback();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v59 = self;
          v52 = "[AL] - %{public}@: [Asset caching] - Local asset of incorrect quality [File format differs from requirements]";
          goto LABEL_92;
        }
        goto LABEL_93;
      }
      v53 = -[MPCAssetLoadPropertiesLocalFileEvaluation fileQualityType](v12, "fileQualityType");
      if (v53 == -[MPCAssetLoadPropertiesLocalFileEvaluation expectedQualityType](v12, "expectedQualityType"))
      {
        v54 = 1;
      }
      else
      {
        v56 = -[MPCAssetLoadPropertiesLocalFileEvaluation fileQualityType](v12, "fileQualityType");
        v54 = v56 > -[MPCAssetLoadPropertiesLocalFileEvaluation expectedQualityType](v12, "expectedQualityType");
      }
    }
    -[MPCAssetLoadPropertiesLocalFileEvaluation setFileMatchesRequiredQuality:](v12, "setFileMatchesRequiredQuality:", v54);
    goto LABEL_101;
  }
  v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v59 = self;
    _os_log_impl(&dword_210BD8000, v19, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: [Asset caching] - Unusable local file asset [No cached or downloaded file]", buf, 0xCu);
  }

  -[MPCAssetLoadPropertiesLocalFileEvaluation setStatus:](v12, "setStatus:", 2);
  -[MPCAssetLoadPropertiesLocalFileEvaluation setRecommendation:](v12, "setRecommendation:", v6);
LABEL_42:

  return v12;
}

- (int64_t)_loadedAudioAssetTypeForFileAsset:(id)a3
{
  id v4;
  int v5;
  char v6;
  os_log_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  NSObject *v12;
  const __CFString *v13;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  int v23;
  MPCAssetLoadPropertiesLocalFileEvaluator *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "isNonPurgeable");
  if (-[MPCAssetLoadPropertiesLocalFileEvaluator isHLSFileAsset:](self, "isHLSFileAsset:", v4))
  {
    v6 = objc_msgSend(v4, "traits");
    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
LABEL_28:

      v20 = 4;
      v21 = 5;
      if ((v6 & 4) == 0)
        v21 = 2;
      if ((v6 & 2) == 0)
        v20 = v21;
      if ((v6 & 0x38) != 0)
        v14 = 3;
      else
        v14 = v20;
      goto LABEL_35;
    }
    if (v5)
      v8 = CFSTR("Downloaded");
    else
      v8 = CFSTR("Cached");
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 6);
    if ((v6 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("adm"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v15);

      if ((v6 & 2) == 0)
      {
LABEL_8:
        if ((v6 & 4) == 0)
          goto LABEL_9;
        goto LABEL_22;
      }
    }
    else if ((v6 & 2) == 0)
    {
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("lossless"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v16);

    if ((v6 & 4) == 0)
    {
LABEL_9:
      if ((v6 & 8) == 0)
        goto LABEL_10;
      goto LABEL_23;
    }
LABEL_22:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("high-res lossless"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v17);

    if ((v6 & 8) == 0)
    {
LABEL_10:
      if ((v6 & 0x10) == 0)
        goto LABEL_11;
      goto LABEL_24;
    }
LABEL_23:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("spatial"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v18);

    if ((v6 & 0x10) == 0)
    {
LABEL_11:
      if ((v6 & 0x20) == 0)
      {
LABEL_13:
        if (objc_msgSend(v9, "count"))
        {
          objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = CFSTR("None");
        }

        v23 = 138543874;
        v24 = self;
        v25 = 2114;
        v26 = v8;
        v27 = 2114;
        v28 = v11;
        _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: [Asset caching] - %{public}@ file is HLS file - Traits: %{public}@", (uint8_t *)&v23, 0x20u);

        goto LABEL_28;
      }
LABEL_12:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("surround"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v10);

      goto LABEL_13;
    }
LABEL_24:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("atmos"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v19);

    if ((v6 & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = CFSTR("Cached");
    if (v5)
      v13 = CFSTR("Downloaded");
    v23 = 138543618;
    v24 = self;
    v25 = 2114;
    v26 = v13;
    _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: [Asset caching] - %{public}@ file is CRABS", (uint8_t *)&v23, 0x16u);
  }

  v14 = 1;
LABEL_35:

  return v14;
}

- (BOOL)isHLSFileAsset:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "filePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    objc_msgSend(v3, "filePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      MSVOfflineHLSFileExtensions();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = objc_msgSend(v8, "containsObject:", v7);

    }
    else
    {
      LOBYTE(v5) = 0;
    }

  }
  return v5;
}

- (int64_t)_recommendationForEvaluation:(id)a3 assetCachingIsAllowed:(BOOL)a4 userDefaults:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  int64_t v10;
  _BOOL4 v11;
  uint64_t v12;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (-[MPCAssetLoadPropertiesLocalFileEvaluator _shouldUpgradeCacheOnPlay:assetCachingIsAllowed:](self, "_shouldUpgradeCacheOnPlay:assetCachingIsAllowed:", v8, v6))
  {
    v10 = 1;
  }
  else
  {
    v11 = -[MPCAssetLoadPropertiesLocalFileEvaluator _shouldUpgradeDownloadOnPlay:defaults:](self, "_shouldUpgradeDownloadOnPlay:defaults:", v8, v9);
    v12 = 3;
    if (!v6)
      v12 = 0;
    if (v11)
      v10 = 2;
    else
      v10 = v12;
  }

  return v10;
}

- (BOOL)_shouldUpgradeDownloadOnPlay:(id)a3 defaults:(id)a4
{
  id v6;
  id v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  _BOOL4 v14;
  NSObject *v15;
  int v17;
  MPCAssetLoadPropertiesLocalFileEvaluator *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  _BOOL4 v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "fileIsDownloaded"))
    v8 = objc_msgSend(v6, "fileShouldBeUpdated");
  else
    v8 = 0;
  v9 = objc_msgSend(v7, "prefersSpatialDownloads");
  v10 = objc_msgSend(v7, "preferredMusicDownloadResolution");

  v11 = _os_feature_enabled_impl();
  if (v10 > 47999)
    v12 = 1;
  else
    v12 = v9;
  v13 = v8 & v12;
  if (v11)
    v14 = v13;
  else
    v14 = 0;
  v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138544898;
    v18 = self;
    v19 = 1024;
    v20 = _os_feature_enabled_impl();
    v21 = 1024;
    v22 = objc_msgSend(v6, "fileIsDownloaded");
    v23 = 1024;
    v24 = objc_msgSend(v6, "fileShouldBeUpdated");
    v25 = 1024;
    v26 = v9;
    v27 = 1024;
    v28 = v10 > 47999;
    v29 = 1024;
    v30 = v14;
    _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: [Asset caching] - Upgrade on play decision process - upgradeOnPlay enabled: %{BOOL}u - localFileIsDownloaded: %{BOOL}u - localFileShouldBeUpdated: %{BOOL}u - userExpectsSpatialDownload: %{BOOL}u - userExpectsLosslessDownload: %{BOOL}u => shouldUpgradeDownloadOnPlay: %{BOOL}u.", (uint8_t *)&v17, 0x30u);
  }

  return v14;
}

- (BOOL)_shouldUpgradeCacheOnPlay:(id)a3 assetCachingIsAllowed:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  BOOL v7;
  _BOOL4 v8;
  int v9;
  NSObject *v10;
  int v12;
  MPCAssetLoadPropertiesLocalFileEvaluator *v13;
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if ((objc_msgSend(v6, "fileIsDownloaded") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v8 = objc_msgSend(v6, "status") == 3 || objc_msgSend(v6, "status") == 2;
    if (objc_msgSend(v6, "fileIsCached"))
      v9 = objc_msgSend(v6, "fileShouldBeUpdated");
    else
      v9 = 0;
    v7 = v4 & (v8 | v9);
    v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138544386;
      v13 = self;
      v14 = 1024;
      v15 = v4;
      v16 = 1024;
      v17 = v8;
      v18 = 1024;
      v19 = v9;
      v20 = 1024;
      v21 = v4 & (v8 | v9);
      _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: [Asset caching] - Caching decision process - assetCachingIsAllowed: %{BOOL}u - localFileDoesNotExist: %{BOOL}u - localFileIsCachedAndNeedsUpdating: %{BOOL}u => shouldUpgradeCacheOnPlay:%{BOOL}u.", (uint8_t *)&v12, 0x24u);
    }

  }
  return v7;
}

- (MPCPlaybackEngine)playbackEngine
{
  return (MPCPlaybackEngine *)objc_loadWeakRetained((id *)&self->_playbackEngine);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_playbackEngine);
}

@end
