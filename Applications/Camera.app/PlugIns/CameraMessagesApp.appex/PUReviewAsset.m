@implementation PUReviewAsset

+ (id)reviewAssetFromCFXMediaItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t v12[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "originalAssetURL"));
  if (v5)
  {
    CAMSignpostWithIDAndArgs(10000, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
    v6 = objc_msgSend(v4, "type");
    if (v6 == (id)2)
    {
      v10 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_10000AF80(v10);

      v7 = 0;
      goto LABEL_14;
    }
    if (v6 == (id)1)
    {
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_videoReviewAssetFromCFXMediaItem:", v4));
    }
    else
    {
      v7 = 0;
      if (v6)
      {
LABEL_14:
        CAMSignpostWithIDAndArgs(10001, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
        goto LABEL_15;
      }
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_photoReviewAssetFromCFXMediaItem:", v4));
    }
    v7 = (void *)v8;
    goto LABEL_14;
  }
  v9 = os_log_create("com.apple.camera", "CameraMessagesApp");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CFXMediaItem does not have originalAssetURL", v12, 2u);
  }

  v7 = 0;
LABEL_15:

  return v7;
}

+ (id)_photoReviewAssetFromCFXMediaItem:(id)a3
{
  id v4;
  double Current;
  const __CFURL *v6;
  CGImageSource *v7;
  CGImageSource *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  const __CFDictionary *v23;
  CGImage *ThumbnailAtIndex;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  NSObject *v31;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint8_t buf[4];
  double v38;
  _QWORD v39[4];
  _QWORD v40[4];

  v4 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  v6 = (const __CFURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "originalAssetURL"));
  v7 = CGImageSourceCreateWithURL(v6, 0);
  if (v7)
  {
    v8 = v7;
    v36 = v4;
    v9 = CGImageSourceCopyPropertiesAtIndex(v7, 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", kCGImagePropertyOrientation));
    v11 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", kCGImagePropertyPixelWidth));
    v12 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", kCGImagePropertyPixelHeight));
    v35 = v10;
    v13 = objc_msgSend(v10, "intValue") - 5;
    if (v13 >= 4)
      v14 = (void *)v11;
    else
      v14 = (void *)v12;
    v33 = (void *)v12;
    v34 = (void *)v11;
    if (v13 >= 4)
      v15 = (void *)v12;
    else
      v15 = (void *)v11;
    v16 = objc_msgSend(v14, "integerValue");
    v17 = objc_msgSend(v15, "integerValue");
    objc_msgSend(a1, "cam_screenPixelSize");
    v20 = PLScaledSizeToFitSize(1, 1, 0, (double)(unint64_t)v16, (double)(unint64_t)v17, v18, v19);
    if (v20 < v21)
      v20 = v21;
    v39[0] = kCGImageSourceCreateThumbnailFromImageIfAbsent;
    v39[1] = kCGImageSourceCreateThumbnailFromImageAlways;
    v40[0] = kCFBooleanTrue;
    v40[1] = kCFBooleanTrue;
    v39[2] = kCGImageSourceThumbnailMaxPixelSize;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (uint64_t)v20));
    v39[3] = kCGImageSourceCreateThumbnailWithTransform;
    v40[2] = v22;
    v40[3] = kCFBooleanTrue;
    v23 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v40, v39, 4));

    ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v8, 0, v23);
    CFRelease(v8);
    if (ThumbnailAtIndex)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", ThumbnailAtIndex));
      CGImageRelease(ThumbnailAtIndex);
    }
    else
    {
      v25 = 0;
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[PLUUIDString UUIDString](PLUUIDString, "UUIDString"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_assetAdjustmentsFromCFXMediaItem:", v36));
    v26 = objc_msgSend(objc_alloc((Class)PUReviewAsset), "initWithPhoto:mediaSubtypes:width:height:captureDate:metadata:burstIdentifier:representedCount:fullsizeImageURL:fullsizeUnadjustedImageURL:assetAdjustments:identifier:", v25, 0, v16, v17, v27, v9, 0, 0, v6, 0, v29, v28);
    v30 = CFAbsoluteTimeGetCurrent();
    v31 = os_log_create("com.apple.camera", "CameraMessagesApp");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v38 = v30 - Current;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Creating review asset for photo took %.3f seconds", buf, 0xCu);
    }

    v4 = v36;
  }
  else
  {
    v9 = os_log_create("com.apple.camera", "CameraMessagesApp");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10000AFC0(v6);
    v26 = 0;
  }

  return v26;
}

+ (id)_videoReviewAssetFromCFXMediaItem:(id)a3
{
  id v4;
  double Current;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double width;
  double v23;
  double height;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  double v40;
  NSObject *v41;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  CMTime v47;
  __int128 v48;
  uint64_t v49;
  _BYTE time[32];
  __int128 v51;
  CGRect v52;

  v4 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "originalAssetURL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AVAsset assetWithURL:](AVAsset, "assetWithURL:", v6));
  v8 = v7;
  if (v7)
  {
    v48 = 0uLL;
    v49 = 0;
    objc_msgSend(v7, "duration");
    if (!((unsigned __int128)0 >> 96))
    {
      v9 = os_log_create("com.apple.camera", "CameraMessagesApp");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_10000B0B0(v6);
      v10 = 0;
LABEL_22:

      goto LABEL_23;
    }
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tracksWithMediaType:", AVMediaTypeVideo));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject firstObject](v12, "firstObject"));
    v16 = v13;
    if (v13)
    {
      objc_msgSend(v13, "naturalSize");
      v18 = v17;
      v20 = v19;
      v51 = 0u;
      memset(time, 0, sizeof(time));
      objc_msgSend(v16, "preferredTransform");
      v52.size.width = v20 * 0.0 + 0.0 * v18;
      v52.size.height = v52.size.width;
      v52.origin.x = 0.0;
      v52.origin.y = 0.0;
      *(CGRect *)&v14 = CGRectStandardize(v52);
      width = v21;
      height = v23;
    }
    else
    {
      width = CGSizeZero.width;
      height = CGSizeZero.height;
    }
    objc_msgSend(a1, "cam_screenPixelSize", v14, v15);
    v27 = PLScaledSizeToFitSize(1, 1, 0, width, height, v25, v26);
    v29 = v28;
    v30 = objc_msgSend(objc_alloc((Class)AVAssetImageGenerator), "initWithAsset:", v8);
    objc_msgSend(v30, "setAppliesPreferredTrackTransform:", 1);
    objc_msgSend(v30, "setMaximumSize:", v27, v29);
    CMTimeMakeWithSeconds(&v47, 0.0, 1);
    v46 = 0;
    v31 = objc_msgSend(v30, "copyCGImageAtTime:actualTime:error:", &v47, 0, &v46);
    v32 = v46;
    v45 = v16;
    v43 = v32;
    v44 = v30;
    if (v32 || !v31)
    {
      v34 = os_log_create("com.apple.camera", "CameraMessagesApp");
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        sub_10000B128(v6, (uint64_t)v32, v34);

      v33 = 0;
      v35 = 0;
      if (!v31)
        goto LABEL_19;
    }
    else
    {
      v33 = objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", v31));
    }
    CFRelease(v31);
    v35 = (void *)v33;
LABEL_19:
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[PLUUIDString UUIDString](PLUUIDString, "UUIDString"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_assetAdjustmentsFromCFXMediaItem:", v4));
    v39 = objc_alloc((Class)PUReviewAsset);
    *(_OWORD *)time = v48;
    *(_QWORD *)&time[16] = v49;
    v10 = objc_msgSend(v39, "initWithAVAsset:audioMix:width:height:captureDate:duration:previewImage:videoURL:adjustments:identifier:", v8, 0, (unint64_t)width, (unint64_t)height, v36, v35, CMTimeGetSeconds((CMTime *)time), v6, v38, v37);
    v40 = CFAbsoluteTimeGetCurrent();
    v41 = os_log_create("com.apple.camera", "CameraMessagesApp");
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)time = 134217984;
      *(double *)&time[4] = v40 - Current;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Creating review asset for video took %.3f seconds", time, 0xCu);
    }

    v9 = v12;
    goto LABEL_22;
  }
  v11 = os_log_create("com.apple.camera", "CameraMessagesApp");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    sub_10000B038(v6);

  v10 = 0;
LABEL_23:

  return v10;
}

+ (CGSize)cam_screenPixelSize
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
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v2, "scale");
  v4 = v3;
  objc_msgSend(v2, "_referenceBounds");
  v6 = v4 * v5;
  v8 = v4 * v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

+ (id)_assetAdjustmentsFromCFXMediaItem:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "adjustmentsData"));
  if (v3)
  {
    v4 = objc_alloc((Class)PFAssetAdjustments);
    v5 = objc_msgSend(v4, "initWithFormatIdentifier:formatVersion:data:baseVersion:editorBundleID:renderTypes:", PUFunEffectsAdjustmentFormatIdentifier, PUFunEffectsAdjustmentFormatVersion, v3, 0, 0, 0);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
