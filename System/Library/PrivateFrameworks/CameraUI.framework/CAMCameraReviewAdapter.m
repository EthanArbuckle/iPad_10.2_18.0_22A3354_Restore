@implementation CAMCameraReviewAdapter

- (CAMCameraReviewAdapter)init
{
  CAMCameraReviewAdapter *v2;
  NSMutableArray *v3;
  NSMutableArray *pendingAssetsForReview;
  CAMCameraReviewAdapter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMCameraReviewAdapter;
  v2 = -[CAMCameraReviewAdapter init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingAssetsForReview = v2->__pendingAssetsForReview;
    v2->__pendingAssetsForReview = v3;

    v5 = v2;
  }

  return v2;
}

- (CAMCameraReviewViewController)cameraReviewViewController
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  objc_class *v7;
  objc_class *v8;
  void *v9;

  -[CAMCameraReviewAdapter _cachedReviewViewController](self, "_cachedReviewViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
  }
  else
  {
    -[CAMCameraReviewAdapter _pendingAssetsForReview](self, "_pendingAssetsForReview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    v7 = (objc_class *)objc_msgSend((id)objc_opt_class(), "cameraReviewViewControllerClass");
    if (-[objc_class conformsToProtocol:](v7, "conformsToProtocol:", &unk_1F0370748))
      v8 = v7;
    else
      v8 = (objc_class *)CAMReviewViewController;
    v9 = (void *)objc_msgSend([v8 alloc], "initWithAssets:", v6);
    objc_msgSend(v5, "removeAllObjects");
    -[CAMCameraReviewAdapter _setCachedReviewViewController:](self, "_setCachedReviewViewController:", v9);
    v4 = v9;

  }
  return (CAMCameraReviewViewController *)v4;
}

+ (Class)cameraReviewViewControllerClass
{
  return (Class)objc_opt_class();
}

+ (id)reviewAssetForPhoto:(id)a3 withProperties:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  _BOOL8 v25;

  v5 = a4;
  v6 = a3;
  CAMSignpostWithIDAndArgs(25, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerCaptureMode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  v25 = v8 == 3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerPixelWidth"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v9, "unsignedIntegerValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerPixelHeight"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v10, "unsignedIntegerValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerCaptureDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerBurstIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerBurstRepresentedCount"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "unsignedIntegerValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerPhotoURL"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerUnadjustedPhotoURL"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerAdjustments"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerUniquePersistenceIdentifier"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerPhotoMetadata"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_msgSend(v19, "mutableCopy");
  objc_msgSend(v20, "setObject:forKeyedSubscript:", 0, CFSTR("{Diagnostic}"));
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7D218]), "initWithPhoto:mediaSubtypes:width:height:captureDate:metadata:burstIdentifier:representedCount:fullsizeImageURL:fullsizeUnadjustedImageURL:assetAdjustments:identifier:", v6, v25, v24, v23, v11, v20, v12, v14, v15, v16, v17, v18);

  CAMSignpostWithIDAndArgs(26, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  return v21;
}

+ (id)reviewAssetForLivePhoto:(id)a3 withProperties:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;

  v5 = a4;
  v6 = a3;
  CAMSignpostWithIDAndArgs(25, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerPixelWidth"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v7, "unsignedIntegerValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerPixelHeight"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerCaptureDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerVideoDuration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerPreviewImage"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerUniquePersistenceIdentifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerUnadjustedPhotoURL"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerUnadjustedVideoURL"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerAdjustments"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerPhotoMetadata"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_msgSend(v19, "mutableCopy");
  objc_msgSend(v20, "setObject:forKeyedSubscript:", 0, CFSTR("{Diagnostic}"));
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7D218]), "initWithLivePhoto:fullsizeUnadjustedImageURL:fullsizeUnadjustedVideoURL:assetAdjustments:width:height:captureDate:metadata:duration:previewImage:identifier:", v6, v16, v17, v18, v23, v9, v13, v10, v20, v14, v15);

  CAMSignpostWithIDAndArgs(26, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  return v21;
}

+ (id)reviewAssetForAVAsset:(id)a3 audioMix:(id)a4 properties:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  CAMSignpostWithIDAndArgs(25, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerPixelWidth"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v10, "unsignedIntegerValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerPixelHeight"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerCaptureDate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerVideoDuration"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerPreviewImage"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerVideoURL"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerUnadjustedVideoURL"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerAdjustments"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerUniquePersistenceIdentifier"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7D218]), "initWithAVAsset:audioMix:width:height:captureDate:duration:previewImage:videoURL:unadjustedVideoURL:adjustments:identifier:", v9, v8, v24, v12, v13, v17, v16, v18, v19, v20, v21);
  CAMSignpostWithIDAndArgs(26, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);

  return v22;
}

- (void)cameraViewController:(id)a3 didCapturePhoto:(id)a4 withProperties:(id)a5 error:(id)a6
{
  id v8;
  id v9;
  void *v10;
  id v11;

  if (!a6)
  {
    v8 = a5;
    v9 = a4;
    objc_msgSend((id)objc_opt_class(), "reviewAssetForPhoto:withProperties:", v9, v8);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    -[CAMCameraReviewAdapter _pendingAssetsForReview](self, "_pendingAssetsForReview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);
    -[CAMCameraReviewAdapter _setCachedReviewViewController:](self, "_setCachedReviewViewController:", 0);

  }
}

- (void)cameraViewController:(id)a3 didCaptureLivePhoto:(id)a4 withProperties:(id)a5 error:(id)a6
{
  id v8;
  id v9;
  void *v10;
  id v11;

  if (!a6)
  {
    v8 = a5;
    v9 = a4;
    objc_msgSend((id)objc_opt_class(), "reviewAssetForLivePhoto:withProperties:", v9, v8);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    -[CAMCameraReviewAdapter _pendingAssetsForReview](self, "_pendingAssetsForReview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);
    -[CAMCameraReviewAdapter _setCachedReviewViewController:](self, "_setCachedReviewViewController:", 0);

  }
}

- (void)cameraViewController:(id)a3 didCaptureAVAsset:(id)a4 andAudioMix:(id)a5 withProperties:(id)a6 error:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  if (!a7)
  {
    v10 = a6;
    v11 = a5;
    v12 = a4;
    objc_msgSend((id)objc_opt_class(), "reviewAssetForAVAsset:audioMix:properties:", v12, v11, v10);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    -[CAMCameraReviewAdapter _pendingAssetsForReview](self, "_pendingAssetsForReview");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v14);
    -[CAMCameraReviewAdapter _setCachedReviewViewController:](self, "_setCachedReviewViewController:", 0);

  }
}

- (NSMutableArray)_pendingAssetsForReview
{
  return self->__pendingAssetsForReview;
}

- (CAMCameraReviewViewController)_cachedReviewViewController
{
  return self->_cachedReviewViewController;
}

- (void)_setCachedReviewViewController:(id)a3
{
  objc_storeStrong((id *)&self->_cachedReviewViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedReviewViewController, 0);
  objc_storeStrong((id *)&self->__pendingAssetsForReview, 0);
}

@end
