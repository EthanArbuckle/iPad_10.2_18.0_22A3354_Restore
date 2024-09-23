@implementation PHWallpaperAsset

- (PHWallpaperAsset)initWithPhotoAsset:(id)a3
{
  PHAsset *v4;
  PHWallpaperAsset *v5;
  PHAsset *photoAsset;
  objc_super v8;

  v4 = (PHAsset *)a3;
  v8.receiver = self;
  v8.super_class = (Class)PHWallpaperAsset;
  v5 = -[PHWallpaperAsset init](&v8, sel_init);
  photoAsset = v5->_photoAsset;
  v5->_photoAsset = v4;

  return v5;
}

- (CGRect)acceptableCropRect
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[PHWallpaperAsset photoAsset](self, "photoAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "acceptableCropRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)preferredCropRect
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[PHWallpaperAsset photoAsset](self, "photoAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredCropRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)gazeAreaRect
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  float v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;
  CGRect v32;
  CGRect v33;
  CGRect result;
  CGRect v35;

  v31 = *MEMORY[0x1E0C80C00];
  -[PHWallpaperAsset photoAsset](self, "photoAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions fetchOptionsWithPhotoLibrary:orObject:](PHFetchOptions, "fetchOptionsWithPhotoLibrary:orObject:", 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setMinimumVerifiedFaceCount:", 1);
  -[PHWallpaperAsset photoAsset](self, "photoAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFace fetchFacesInAsset:options:](PHFace, "fetchFacesInAsset:options:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v16, "gazeConfidence", (_QWORD)v26);
        if (v17 > 0.0)
        {
          objc_msgSend(v16, "gazeRect");
          v35.origin.x = v18;
          v35.origin.y = v19;
          v35.size.width = v20;
          v35.size.height = v21;
          v32.origin.x = x;
          v32.origin.y = y;
          v32.size.width = width;
          v32.size.height = height;
          v33 = CGRectUnion(v32, v35);
          x = v33.origin.x;
          y = v33.origin.y;
          width = v33.size.width;
          height = v33.size.height;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v13);
  }

  v22 = x;
  v23 = y;
  v24 = width;
  v25 = height;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (NSArray)faceRegions
{
  void *v2;
  void *v3;

  -[PHWallpaperAsset photoAsset](self, "photoAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "faceRegions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSString)localIdentifier
{
  void *v2;
  void *v3;

  -[PHWallpaperAsset photoAsset](self, "photoAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int)loadParallaxResource:(int64_t)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9;
  id v10;
  void *v11;
  char v12;
  int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  PHImageRequestOptions *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  _QWORD v44[5];
  id v45;
  _QWORD *v46;
  int64_t v47;
  _QWORD v48[3];
  char v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  int64_t v56;
  _QWORD v57[4];
  id v58;

  v9 = a4;
  v10 = a5;
  if (a3 != 6)
  {
    v14 = 0.0;
    switch(a3)
    {
      case 0:
        objc_msgSend(v9, "imageSize");
        v16 = v15;
        v14 = v17;
        v18 = 0;
        v19 = 0x10000;
        goto LABEL_17;
      case 1:
        objc_msgSend(v9, "imageSize");
        v16 = v30;
        v14 = v31;
        v19 = 0;
        v18 = 0;
        goto LABEL_17;
      case 2:
        v14 = -1.0;
        v18 = 1;
        v19 = 0x10000;
        v16 = -1.0;
        goto LABEL_17;
      case 3:
        objc_msgSend(v9, "imageSize");
        v16 = v32;
        v14 = v33;
        v19 = 0;
        v18 = 1;
        goto LABEL_17;
      case 4:
        goto LABEL_6;
      case 5:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHWallpaperAsset.m"), 120, CFSTR("Unsupported format"));

        goto LABEL_16;
      default:
LABEL_16:
        v18 = 1;
        v19 = 0x10000;
        v16 = 0.0;
LABEL_17:
        v20 = objc_alloc_init(PHImageRequestOptions);
        -[PHImageRequestOptions setVersion:](v20, "setVersion:", v18);
        -[PHImageRequestOptions setDeliveryMode:](v20, "setDeliveryMode:", 1);
        -[PHImageRequestOptions setResizeMode:](v20, "setResizeMode:", 1);
        -[PHImageRequestOptions setNetworkAccessAllowed:](v20, "setNetworkAccessAllowed:", objc_msgSend(v9, "networkAccessAllowed"));
        -[PHImageRequestOptions setSynchronous:](v20, "setSynchronous:", 0);
        objc_msgSend(v9, "resultHandlerQueue");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHImageRequestOptions setResultHandlerQueue:](v20, "setResultHandlerQueue:", v35);

        -[PHImageRequestOptions setLoadingMode:](v20, "setLoadingMode:", v19);
        v36 = objc_msgSend(v9, "priority");
        if (v36 == 1)
        {
          v37 = 9;
        }
        else
        {
          if (v36 != 2)
            goto LABEL_22;
          v37 = 8;
        }
        -[PHImageRequestOptions setDownloadIntent:](v20, "setDownloadIntent:", v37);
LABEL_22:
        objc_msgSend(v9, "downloadProgressHandler");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v38;
        v39 = MEMORY[0x1E0C809B0];
        if (v38)
        {
          v57[0] = MEMORY[0x1E0C809B0];
          v57[1] = 3221225472;
          v57[2] = __63__PHWallpaperAsset_loadParallaxResource_options_resultHandler___block_invoke;
          v57[3] = &unk_1E35DDA28;
          v58 = v38;
          -[PHImageRequestOptions setProgressHandler:](v20, "setProgressHandler:", v57);

        }
        v40 = objc_msgSend(v9, "aspectFit") ^ 1;
        +[PHImageManager defaultManager](PHImageManager, "defaultManager");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHWallpaperAsset photoAsset](self, "photoAsset");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v54[0] = v39;
        v54[1] = 3221225472;
        v54[2] = __63__PHWallpaperAsset_loadParallaxResource_options_resultHandler___block_invoke_2;
        v54[3] = &unk_1E35DAA40;
        v56 = a3;
        v55 = v10;
        v13 = objc_msgSend(v41, "requestNewCGImageForAsset:targetSize:contentMode:options:resultHandler:", v42, v40, v20, v54, v16, v14);

        v29 = v55;
        break;
    }
    goto LABEL_25;
  }
  -[PHWallpaperAsset photoAsset](self, "photoAsset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "mediaSubtypes");

  if ((v12 & 8) != 0)
  {
LABEL_6:
    v20 = objc_alloc_init(PHContentEditingInputRequestOptions);
    -[PHImageRequestOptions setNetworkAccessAllowed:](v20, "setNetworkAccessAllowed:", objc_msgSend(v9, "networkAccessAllowed"));
    objc_msgSend(v9, "canHandleAdjustmentData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x1E0C809B0];
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __63__PHWallpaperAsset_loadParallaxResource_options_resultHandler___block_invoke_3;
    v52[3] = &unk_1E35DAA68;
    v23 = v21;
    v53 = v23;
    -[PHImageRequestOptions setCanHandleAdjustmentData:](v20, "setCanHandleAdjustmentData:", v52);
    objc_msgSend(v9, "resultHandlerQueue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHImageRequestOptions setResultHandlerQueue:](v20, "setResultHandlerQueue:", v24);

    if (a3 == 6 && objc_msgSend(v9, "priority"))
      -[PHImageRequestOptions setDownloadIntent:](v20, "setDownloadIntent:", 10);
    objc_msgSend(v9, "downloadProgressHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      v50[0] = v22;
      v50[1] = 3221225472;
      v50[2] = __63__PHWallpaperAsset_loadParallaxResource_options_resultHandler___block_invoke_4;
      v50[3] = &unk_1E35DAA90;
      v51 = v25;
      -[PHImageRequestOptions setProgressHandler:](v20, "setProgressHandler:", v50);

    }
    v48[0] = 0;
    v48[1] = v48;
    v48[2] = 0x2020000000;
    v49 = 0;
    +[PHImageManager defaultManager](PHImageManager, "defaultManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHWallpaperAsset photoAsset](self, "photoAsset");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v22;
    v44[1] = 3221225472;
    v44[2] = __63__PHWallpaperAsset_loadParallaxResource_options_resultHandler___block_invoke_5;
    v44[3] = &unk_1E35DAAB8;
    v46 = v48;
    v47 = a3;
    v44[4] = self;
    v45 = v10;
    v13 = objc_msgSend(v27, "requestContentEditingInputForAsset:withOptions:completionHandler:", v28, v20, v44);

    _Block_object_dispose(v48, 8);
    v29 = v53;
LABEL_25:

    goto LABEL_26;
  }
  (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  v13 = 0;
LABEL_26:

  return v13;
}

- (BOOL)supportsSegmentationResourceCaching
{
  return 1;
}

- (NSURL)segmentationResourceURL
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  -[PHWallpaperAsset photoAsset](self, "photoAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHAssetResource assetResourcesForAsset:includeDerivatives:](PHAssetResource, "assetResourcesForAsset:includeDerivatives:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "indexOfObjectPassingTest:", &__block_literal_global_22339);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "privateFileURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);

    if (v10)
      v11 = v7;
    else
      v11 = 0;
    v5 = v11;

  }
  return (NSURL *)v5;
}

- (BOOL)clearSegmentationResourceCacheWithError:(id *)a3
{
  void *v4;
  void *v5;
  char v6;

  -[PHWallpaperAsset segmentationResourceURL](self, "segmentationResourceURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "removeItemAtURL:error:", v4, a3);

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (NSArray)petRegions
{
  return 0;
}

- (int)loadPetsRegionsWithOptions:(id)a3 resultHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (objc_msgSend(a3, "needsInProcessHandling"))
    v7 = &unk_1E36578D8;
  else
    v7 = 0;
  v8 = (void *)MEMORY[0x1E0D718C8];
  -[PHWallpaperAsset photoAsset](self, "photoAsset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__PHWallpaperAsset_loadPetsRegionsWithOptions_resultHandler___block_invoke_3;
  v14[3] = &unk_1E35DABA0;
  v14[4] = self;
  v15 = &__block_literal_global_36;
  v16 = v6;
  v11 = v6;
  v12 = objc_msgSend(v8, "requestPetsAnalysisForAssets:withOptions:progressHandler:completionHandler:", v10, v7, 0, v14);

  return v12;
}

- (void)cancelPetsRegionsRequest:(int)a3
{
  objc_msgSend(MEMORY[0x1E0D718C8], "cancelRequest:", a3);
}

- (void)updateSegmentationResource:(id)a3
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
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;
  PHWallpaperAsset *v20;
  id v21;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "temporaryDirectory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHWallpaperAsset photoAsset](self, "photoAsset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByAppendingPathExtension:", CFSTR("segmentation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHWallpaperAsset photoAsset](self, "photoAsset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "photoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __47__PHWallpaperAsset_updateSegmentationResource___block_invoke;
  v18[3] = &unk_1E35DF3B8;
  v21 = v4;
  v19 = v10;
  v20 = self;
  v16[0] = v13;
  v16[1] = 3221225472;
  v16[2] = __47__PHWallpaperAsset_updateSegmentationResource___block_invoke_65;
  v16[3] = &unk_1E35DABC8;
  v16[4] = self;
  v17 = v19;
  v14 = v19;
  v15 = v4;
  objc_msgSend(v12, "performChanges:completionHandler:", v18, v16);

}

- (void)cancelParallaxResourceRequest:(int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  +[PHImageManager defaultManager](PHImageManager, "defaultManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelImageRequest:", v3);

}

- (int)loadMotionScore:(id)a3
{
  void (**v4)(id, _QWORD, __n128);
  void *v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  char v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  __n128 v21;
  void *v22;
  __n128 v23;
  _QWORD v25[5];
  void (**v26)(id, _QWORD, __n128);
  void *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, __n128))a3;
  -[PHWallpaperAsset photoAsset](self, "photoAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchPropertySetsIfNeeded");

  -[PHWallpaperAsset photoAsset](self, "photoAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaAnalysisProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "settlingEffectScore");
  v9 = v8;

  if (v9 >= 0.0)
  {
    PLBackendGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      -[PHWallpaperAsset localIdentifier](self, "localIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v20;
      v30 = 2048;
      v31 = v9;
      _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_INFO, "Motion score already computed for asset: %{public}@, score: %.2f", buf, 0x16u);

    }
    v21.n128_f32[0] = v9;
    v4[2](v4, 0, v21);
    goto LABEL_12;
  }
  -[PHWallpaperAsset photoAsset](self, "photoAsset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isPhotoIris");

  PLBackendGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if ((v11 & 1) == 0)
  {
    if (v13)
    {
      -[PHWallpaperAsset localIdentifier](self, "localIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v22;
      _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_INFO, "No motion score for non-Live Photo asset: %{public}@", buf, 0xCu);

    }
    v23.n128_u32[0] = -1.0;
    v4[2](v4, 0, v23);
LABEL_12:
    v18 = 0;
    goto LABEL_13;
  }
  if (v13)
  {
    -[PHWallpaperAsset localIdentifier](self, "localIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v14;
    _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_INFO, "Requesting on-demand analysis of motion score for asset: %{public}@", buf, 0xCu);

  }
  v15 = (void *)MEMORY[0x1E0D718C8];
  -[PHWallpaperAsset photoAsset](self, "photoAsset");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __36__PHWallpaperAsset_loadMotionScore___block_invoke;
  v25[3] = &unk_1E35DAF48;
  v25[4] = self;
  v26 = v4;
  v18 = objc_msgSend(v15, "requestMovieCurationForAssets:withOptions:progressHandler:completionHandler:", v17, 0, 0, v25);

LABEL_13:
  return v18;
}

- (void)cancelMotionScoreRequest:(int)a3
{
  objc_msgSend(MEMORY[0x1E0D718C8], "cancelRequest:", a3);
}

- (PHAsset)photoAsset
{
  return self->_photoAsset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoAsset, 0);
}

void __36__PHWallpaperAsset_loadMotionScore___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __n128 v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __n128 v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  const __CFString *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SettlingEffectsGatingResults"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        objc_msgSend(v6, "firstObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("quality"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = v9;
          objc_msgSend(v9, "floatValue");
          (*(void (**)(_QWORD, _QWORD, __n128))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, v11);
        }
        else
        {
          PLBackendGetLog();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v34 = v22;
            v35 = 2114;
            v36 = v7;
            _os_log_impl(&dword_1991EC000, v21, OS_LOG_TYPE_ERROR, "Missing motion score value for asset: %{public}@, results: %{public}@", buf, 0x16u);

          }
          v23 = *(_QWORD *)(a1 + 40);
          v24 = (void *)MEMORY[0x1E0CB35C8];
          v31 = *MEMORY[0x1E0CB2938];
          v32 = CFSTR("Missing motion score value");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *, float))(v23 + 16))(v23, v26, -1.0);

          v10 = 0;
        }
      }
      else
      {
        PLBackendGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v34 = v17;
          _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_ERROR, "Invalid motion score results for asset: %{public}@", buf, 0xCu);

        }
        v18 = *(_QWORD *)(a1 + 40);
        v19 = (void *)MEMORY[0x1E0CB35C8];
        v29 = *MEMORY[0x1E0CB2938];
        v30 = CFSTR("Invalid motion score results");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v20.n128_u32[0] = -1.0;
        (*(void (**)(uint64_t, void *, __n128))(v18 + 16))(v18, v10, v20);
      }

    }
    else
    {
      PLBackendGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v34 = v13;
        _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_ERROR, "Failed to get motion score results for asset: %{public}@", buf, 0xCu);

      }
      v14 = *(_QWORD *)(a1 + 40);
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v27 = *MEMORY[0x1E0CB2938];
      v28 = CFSTR("Failed to get motion score results");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, float))(v14 + 16))(v14, v8, -1.0);
    }

  }
  else
  {
    (*(void (**)(float))(*(_QWORD *)(a1 + 40) + 16))(-1.0);
  }

}

void __47__PHWallpaperAsset_updateSegmentationResource___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "photoAsset");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHAssetChangeRequest changeRequestForAsset:](PHAssetChangeRequest, "changeRequestForAsset:", v2);
    v3 = objc_claimAutoreleasedReturnValue();

    if ((-[NSObject addAssetResourceWithType:fromFileAtURL:](v3, "addAssetResourceWithType:fromFileAtURL:", 109, *(_QWORD *)(a1 + 32)) & 1) == 0)
    {
      PLBackendGetLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 40), "localIdentifier");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 138543362;
        v8 = v5;
        _os_log_impl(&dword_1991EC000, v4, OS_LOG_TYPE_ERROR, "Failed to copy segmentation resource file for asset: %{public}@", (uint8_t *)&v7, 0xCu);

      }
    }
  }
  else
  {
    PLBackendGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "localIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_ERROR, "Failed to write segmentation resource file for asset: %{public}@", (uint8_t *)&v7, 0xCu);

    }
  }

}

void __47__PHWallpaperAsset_updateSegmentationResource___block_invoke_65(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PLBackendGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v7;
      v11 = 2114;
      v12 = v5;
      _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_ERROR, "Failed to update segmentation resource for asset: %{public}@, error: %{public}@", (uint8_t *)&v9, 0x16u);

    }
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeItemAtURL:error:", *(_QWORD *)(a1 + 40), 0);

}

void __61__PHWallpaperAsset_loadPetsRegionsWithOptions_resultHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  const __CFString *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PetsResults"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PetsFaceResults"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11 && v14)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      }
      else
      {
        PLBackendGetLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v33 = v23;
          v34 = 2114;
          v35 = v8;
          _os_log_impl(&dword_1991EC000, v22, OS_LOG_TYPE_ERROR, "Invalid pets results for asset: %{public}@, results: %{public}@", buf, 0x16u);

        }
        v24 = (void *)MEMORY[0x1E0CB35C8];
        v25 = *MEMORY[0x1E0D75420];
        v30 = *MEMORY[0x1E0CB2938];
        v31 = CFSTR("Invalid pets results");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 8, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      }

    }
    else
    {
      PLBackendGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v33 = v18;
        _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_ERROR, "Missing pets results for asset: %{public}@", buf, 0xCu);

      }
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v20 = *MEMORY[0x1E0D75420];
      v28 = *MEMORY[0x1E0CB2938];
      v29 = CFSTR("Missing pets results");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 8, v21);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
  else
  {
    PLBackendGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v16;
      v34 = 2114;
      v35 = v6;
      _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_ERROR, "Failed to analyze pets for asset: %{public}@, error: %{public}@", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __61__PHWallpaperAsset_loadPetsRegionsWithOptions_resultHandler___block_invoke()
{
  return PFMap();
}

id __61__PHWallpaperAsset_loadPetsRegionsWithOptions_resultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  NSString *v3;
  void *v4;
  NSRect v6;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("attributes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("petsBounds"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  v6 = NSRectFromString(v3);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v6, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL __43__PHWallpaperAsset_segmentationResourceURL__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 109;
}

uint64_t __63__PHWallpaperAsset_loadParallaxResource_options_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__PHWallpaperAsset_loadParallaxResource_options_resultHandler___block_invoke_2(uint64_t a1, CGImage *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D75160]);
  objc_msgSend(v5, "setType:", *(_QWORD *)(a1 + 40));
  if (a2)
  {
    objc_msgSend(v5, "setProxyImage:", a2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    CGImageRelease(a2);
  }
  else
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PHImageFileURLKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v5, "setImageFileURL:", v6);
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PHImageFileUTIKey"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setFileType:", v7);

      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PHImageFileOrientationKey"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "intValue");
      objc_msgSend(v5, "setOrientation:", PLExifOrientationFromImageOrientation());

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PHImageErrorKey"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

    }
  }

}

uint64_t __63__PHWallpaperAsset_loadParallaxResource_options_resultHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
    return 0;
  v3 = a2;
  objc_msgSend(v3, "formatIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formatVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (*(uint64_t (**)(uint64_t, void *, void *))(v2 + 16))(v2, v4, v5);
  return v6;
}

uint64_t __63__PHWallpaperAsset_loadParallaxResource_options_resultHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__PHWallpaperAsset_loadParallaxResource_options_resultHandler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v8 + 24))
  {
    PLBackendGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543362;
      v24 = v10;
      _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_FAULT, "Image manager completion handler called more than once for asset %{public}@", (uint8_t *)&v23, 0xCu);

    }
  }
  else
  {
    *(_BYTE *)(v8 + 24) = 1;
    if (v5)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0D75160]);
      objc_msgSend(v5, "fullSizeImageURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setImageFileURL:](v9, "setImageFileURL:", v11);

      objc_msgSend(v5, "uniformTypeIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setFileType:](v9, "setFileType:", v12);

      -[NSObject setOrientation:](v9, "setOrientation:", objc_msgSend(v5, "fullSizeImageOrientation"));
      objc_msgSend(v5, "adjustmentData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        -[NSObject setType:](v9, "setType:", 4);
        objc_msgSend(v13, "data");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setAdjustmentData:](v9, "setAdjustmentData:", v14);

        objc_msgSend(v13, "formatIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setAdjustmentFormat:](v9, "setAdjustmentFormat:", v15);

        objc_msgSend(v13, "formatVersion");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setAdjustmentVersion:](v9, "setAdjustmentVersion:", v16);

      }
      else
      {
        -[NSObject setType:](v9, "setType:", 2);
      }
      if (*(_QWORD *)(a1 + 56) == 6)
      {
        objc_msgSend(v5, "livePhoto");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          objc_msgSend(v18, "imageURL");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setImageFileURL:](v9, "setImageFileURL:", v20);

          objc_msgSend(v19, "videoURL");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setVideoFileURL:](v9, "setVideoFileURL:", v21);

          if (objc_msgSend(v5, "baseVersion"))
            v22 = 4;
          else
            v22 = 6;
          -[NSObject setType:](v9, "setType:", v22);
        }

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
    else
    {
      v17 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PHContentEditingInputErrorKey"));
      v9 = objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, NSObject *))(v17 + 16))(v17, 0, v9);
    }
  }

}

@end
