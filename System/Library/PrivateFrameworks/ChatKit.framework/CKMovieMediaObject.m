@implementation CKMovieMediaObject

+ (id)UTITypes
{
  if (UTITypes_onceToken != -1)
    dispatch_once(&UTITypes_onceToken, &__block_literal_global_72);
  return (id)UTITypes_types;
}

void __30__CKMovieMediaObject_UTITypes__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C8B3C0], "audiovisualTypes");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexesOfObjectsPassingTest:", &__block_literal_global_49);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectsAtIndexes:", v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)UTITypes_types;
  UTITypes_types = v1;

}

uint64_t __30__CKMovieMediaObject_UTITypes__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "conformsToType:", *MEMORY[0x1E0CEC568]);

  return v3;
}

- (id)metricsCollectorMediaType
{
  _BOOL4 v2;
  id *v3;

  v2 = -[CKMovieMediaObject isAutoloopVideo](self, "isAutoloopVideo");
  v3 = (id *)MEMORY[0x1E0D386A8];
  if (!v2)
    v3 = (id *)MEMORY[0x1E0D386D8];
  return *v3;
}

+ (id)fallbackFilenamePrefix
{
  return CFSTR("MOV");
}

- (id)attachmentSummary:(unint64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  CKFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 == 1)
    v6 = CFSTR("SUMMARY_VIDEO_TYPE");
  else
    v6 = CFSTR("SUMMARY_VIDEO_TYPES");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int)mediaType
{
  return 2;
}

- (BOOL)isAutoloopVideo
{
  NSObject *v3;
  _QWORD block[5];
  id v6;
  id location;

  if (!-[CKMovieMediaObject isAutoloopVideoInitialized](self, "isAutoloopVideoInitialized"))
  {
    -[CKMovieMediaObject setIsAutoloopVideoInitialized:](self, "setIsAutoloopVideoInitialized:", 1);
    if (-[CKMovieMediaObject isJellyfishVideo](self, "isJellyfishVideo"))
    {
      self->_isAutoloopVideo = 1;
    }
    else
    {
      location = 0;
      objc_initWeak(&location, self);
      dispatch_get_global_queue(2, 0);
      v3 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __37__CKMovieMediaObject_isAutoloopVideo__block_invoke;
      block[3] = &unk_1E274D388;
      block[4] = self;
      objc_copyWeak(&v6, &location);
      dispatch_async(v3, block);

      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
  }
  return self->_isAutoloopVideo;
}

void __37__CKMovieMediaObject_isAutoloopVideo__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;
  id v5;
  int v6;
  int v7;
  NSObject *v8;
  void *v9;
  id WeakRetained;
  char v11;
  char v12;
  char v13;
  id v14;
  void *v15;
  _QWORD block[5];
  char v17;
  char v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v19 = 0;
    v20 = 0;
    v3 = objc_msgSend(MEMORY[0x1E0D75330], "readMetadataType:fromAVAsset:value:error:", 4, v2, &v20, &v19);
    v4 = v20;
    v5 = v19;
    if (v4)
      v6 = v3;
    else
      v6 = 0;
    if (v6 == 1)
    {
      v7 = objc_msgSend(v4, "intValue");
      if (v7 != 3)
      {
        if (v7)
          goto LABEL_18;
      }
    }
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(2);
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "asset");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v22 = v4;
      v23 = 2112;
      v24 = v5;
      v25 = 2112;
      v26 = v9;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_DEBUG, "Failed to load video playback style {styleIdentifier: %@, error: %@, asset: %@}", buf, 0x20u);

    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    objc_msgSend(*(id *)(a1 + 32), "asset");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _CKLog();

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v11 = objc_msgSend(WeakRetained, "_assetContainsMetadataKey:", CFSTR("LOOP"));

  if ((v11 & 1) == 0)
  {
    v14 = objc_loadWeakRetained((id *)(a1 + 40));
    v12 = objc_msgSend(v14, "_assetContainsMetadataKey:", CFSTR("GREY"));

    v13 = v12;
    goto LABEL_20;
  }
LABEL_18:
  v12 = 0;
  v13 = 1;
LABEL_20:
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CKMovieMediaObject_isAutoloopVideo__block_invoke_68;
  block[3] = &unk_1E274DEF8;
  block[4] = *(_QWORD *)(a1 + 32);
  v17 = v13;
  v18 = v12;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __37__CKMovieMediaObject_isAutoloopVideo__block_invoke_68(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 185) != v2)
  {
    *(_BYTE *)(v1 + 185) = v2;
    *(_BYTE *)(*(_QWORD *)(result + 32) + 186) = *(_BYTE *)(result + 41);
    return objc_msgSend(*(id *)(result + 32), "postPreviewDidChangeNotifications");
  }
  return result;
}

- (BOOL)isJellyfishVideo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (!-[CKMovieMediaObject isJellyfishInitialized](self, "isJellyfishInitialized"))
  {
    -[CKMediaObject transfer](self, "transfer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "attributionInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D37F30]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      IMBalloonExtensionIDWithSuffix();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      self->_isJellyfishVideo = objc_msgSend(v5, "isEqualToString:", v6);

    }
  }
  return self->_isJellyfishVideo;
}

- (BOOL)_assetContainsMetadataKey:(id)a3
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0D396D8];
  v5 = a3;
  -[CKMovieMediaObject asset](self, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "asset:containsMetadataKey:", v6, v5);

  return (char)v4;
}

- (BOOL)supportsUnknownSenderPreview
{
  return 1;
}

- (BOOL)allowAutoplay
{
  void *v3;
  char v4;
  int v5;
  void *v6;

  -[CKMediaObject messageContext](self, "messageContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFromMe");

  if ((v4 & 1) != 0)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    -[CKMediaObject messageContext](self, "messageContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isSpam") ^ 1;

  }
  return v5;
}

+ (BOOL)isPreviewable
{
  return 1;
}

- (id)previewCacheKeyWithOrientation:(char)a3
{
  return CKOrientedPreviewCacheKey(self, a3);
}

- (Class)balloonViewClass
{
  void *v3;
  BOOL v4;
  void *v5;
  objc_super v7;

  if (!-[CKMovieMediaObject isAutoloopVideo](self, "isAutoloopVideo"))
    goto LABEL_6;
  -[CKMediaObject transfer](self, "transfer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isFileDataReady") & 1) == 0)
  {

    goto LABEL_6;
  }
  v4 = -[CKMediaObject transcoderPreviewGenerationFailed](self, "transcoderPreviewGenerationFailed");

  if (v4)
  {
LABEL_6:
    v7.receiver = self;
    v7.super_class = (Class)CKMovieMediaObject;
    -[CKMediaObject balloonViewClass](&v7, sel_balloonViewClass);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    return (Class)v5;
  }
  -[CKMovieMediaObject previewBalloonViewClass](self, "previewBalloonViewClass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return (Class)v5;
}

- (Class)previewBalloonViewClass
{
  if (!-[CKMovieMediaObject allowAutoplay](self, "allowAutoplay")
    || !-[CKMovieMediaObject isAutoloopVideo](self, "isAutoloopVideo")
    || !+[CKAutoloopMovieBalloonView isEnabled](CKAutoloopMovieBalloonView, "isEnabled"))
  {
    CKIsRunningInMacCatalyst();
  }
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (id)previewForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4;
  void *v7;
  objc_super v9;

  v4 = a4;
  if (-[CKMovieMediaObject hasNoVideoTrack](self, "hasNoVideoTrack"))
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CKMovieMediaObject;
    -[CKMediaObject previewForWidth:orientation:](&v9, sel_previewForWidth_orientation_, v4, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (void)prewarmPreviewForWidth:(double)a3 orientation:(char)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKMovieMediaObject;
  -[CKMediaObject prewarmPreviewForWidth:orientation:](&v4, sel_prewarmPreviewForWidth_orientation_, a4, a3);
}

- (id)generatePreviewFromThumbnail:(id)a3 width:(double)a4 orientation:(char)a5
{
  return a3;
}

- (id)generateThumbnailForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;

  v4 = a4;
  -[CKMovieMediaObject pxSize](self, "pxSize");
  v8 = v7;
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scale");
  v13 = 1.0 / v12;
  v14 = v8 * v13;
  v15 = v10 * v13;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "thumbnailFillSizeForWidth:imageSize:", a3, v14, v15);
  v18 = v17;
  v20 = v19;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "thumbnailContentAlignmentInsetsForOrientation:", v4);
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;

  return -[CKMovieMediaObject generateThumbnailFillToSize:contentAlignmentInsets:](self, "generateThumbnailFillToSize:contentAlignmentInsets:", v18, v20, v23, v25, v27, v29);
}

- (id)generateThumbnailFillToSize:(CGSize)a3 contentAlignmentInsets:(UIEdgeInsets)a4
{
  double left;
  double top;
  double height;
  double width;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  size_t v30;
  size_t v31;
  double v32;
  double v33;
  double v34;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  NSObject *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v49;
  double bottom;
  double right;
  _QWORD block[5];
  uint64_t v53;
  double *v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  uint64_t v58;
  _BYTE buf[24];
  void *v60;
  uint64_t v61;
  CGSize v62;
  CGSize v63;
  CGSize v64;
  CGSize v65;

  bottom = a4.bottom;
  right = a4.right;
  left = a4.left;
  top = a4.top;
  height = a3.height;
  width = a3.width;
  v61 = *MEMORY[0x1E0C80C00];
  v9 = MEMORY[0x193FF3C24]("kCMTimeZero", CFSTR("CoreMedia"));
  v57 = *(_OWORD *)v9;
  v58 = *(_QWORD *)(v9 + 16);
  -[CKMovieMediaObject pxSize](self, "pxSize");
  v11 = v10;
  v13 = v12;
  v53 = 0;
  v54 = (double *)&v53;
  v55 = 0x2020000000;
  v56 = 0;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scale");
    *((_QWORD *)v54 + 3) = v15;

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__CKMovieMediaObject_generateThumbnailFillToSize_contentAlignmentInsets___block_invoke;
    block[3] = &unk_1E274A178;
    block[4] = &v53;
    dispatch_sync(MEMORY[0x1E0C80D38], block);
  }
  v16 = v54[3];
  v17 = width * v16;
  v18 = height * v16;
  v19 = v17 / v11;
  if (v11 == 0.0)
    v20 = 0.0;
  else
    v20 = v19;
  v21 = v18 / v13;
  if (v13 == 0.0)
    v22 = 0.0;
  else
    v22 = v21;
  -[CKMovieMediaObject thumbnail](self, "thumbnail");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    v25 = (void *)objc_msgSend(objc_retainAutorelease(v23), "CGImage");
    CFRetain(v25);
  }
  else
  {
    -[CKMovieMediaObject asset](self, "asset");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C8AFC8], "assetImageGeneratorWithAsset:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setAppliesPreferredTrackTransform:", 1);
    v28 = fmax(v20, v22);
    objc_msgSend(v27, "setMaximumSize:", ceil(v11 * v28), ceil(v13 * v28));
    *(_OWORD *)buf = v57;
    *(_QWORD *)&buf[16] = v58;
    v25 = (void *)objc_msgSend(v27, "copyCGImageAtTime:actualTime:error:", buf, 0, 0);

  }
  if (v25)
  {
    v29 = v54[3];
    v30 = CGImageGetWidth((CGImageRef)v25);
    v31 = CGImageGetHeight((CGImageRef)v25);
    v32 = v54[3];
    if (objc_msgSend((id)objc_opt_class(), "shouldScaleUpPreview"))
    {
      v33 = 1.0 / v32 * (double)v30;
      v34 = 1.0 / v32 * (double)v31;
      if (v33 + 1.0 < width || v34 + 1.0 < height)
      {
        v36 = width / v33;
        v37 = 0.0;
        if (v33 == 0.0)
          v36 = 0.0;
        if (v34 != 0.0)
          v37 = height / v34;
        v38 = fmax(v36, v37);
        v39 = v54[3];
        v40 = v39 / v38;
        v41 = v39 * 0.5;
        if (v40 >= v41)
          v29 = v40;
        else
          v29 = v41;
        if (IMOSLoggingEnabled())
        {
          CKLogCStringForType(2);
          OSLogHandleForIMFoundationCategory();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          {
            v62.width = v33;
            v62.height = v34;
            NSStringFromCGSize(v62);
            v43 = (id)objc_claimAutoreleasedReturnValue();
            v63.width = width;
            v63.height = height;
            NSStringFromCGSize(v63);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v43;
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = v29;
            *(_WORD *)&buf[22] = 2112;
            v60 = v44;
            _os_log_impl(&dword_18DFCD000, v42, OS_LOG_TYPE_DEBUG, "Scale thumbnail of size (%@) by with image scale %f to try to fill target (%@)", buf, 0x20u);

          }
        }
        if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
        {
          v64.width = v33;
          v64.height = v34;
          NSStringFromCGSize(v64);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v65.width = width;
          v65.height = height;
          NSStringFromCGSize(v65);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          _CKLog();

        }
      }
    }
    v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:scale:orientation:", v25, objc_msgSend(v24, "imageOrientation"), v29);

    if (!-[CKMovieMediaObject isJellyfishVideo](self, "isJellyfishVideo")
      && !-[CKMovieMediaObject isAutoloopVideo](self, "isAutoloopVideo"))
    {
      objc_msgSend((id)objc_opt_class(), "playButtonPreviewForUIImage:scale:contentAlignmentInsets:", v46, v54[3], top, left, bottom, right);
      v47 = objc_claimAutoreleasedReturnValue();

      v46 = (void *)v47;
    }
    CFRelease(v25);
    v24 = v46;
  }
  _Block_object_dispose(&v53, 8);
  return v24;
}

void __73__CKMovieMediaObject_generateThumbnailFillToSize_contentAlignmentInsets___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2;

}

+ (CGImage)playButtonPreviewForCGImage:(CGImage *)a3 scale:(double)a4 isFromMe:(BOOL)a5
{
  _BOOL8 v5;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  CGImage *v21;

  v5 = a5;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "thumbnailContentAlignmentInsetsForOrientation:", v5);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:scale:orientation:", a3, 0, a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "playButtonPreviewForUIImage:scale:contentAlignmentInsets:", v18, a4, v11, v13, v15, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_retainAutorelease(v19);
  v21 = (CGImage *)objc_msgSend(v20, "CGImage");

  return v21;
}

+ (id)playButtonPreviewForUIImage:(id)a3 scale:(double)a4 contentAlignmentInsets:(UIEdgeInsets)a5
{
  CGFloat right;
  double bottom;
  double left;
  double top;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  uint64_t v61;
  void *v62;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double scale;
  CGSize v71;
  CGSize v72;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v10 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "playButtonImage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "playButtonArrowImage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "playButtonPunchesOutArrow");
  v15 = objc_msgSend(v11, "playButtonBackdropStyle");
  objc_msgSend(v12, "size");
  v17 = v16;
  v19 = v18;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "minimumPlayButtonInsets");
  v23 = v17 + v21 + v22;
  v26 = v19 + v24 + v25;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "balloonMaskTailSizeForTailShape:", 1);
  v29 = v28;

  objc_msgSend(v10, "size");
  if (v31 < v23 + v29 * 2.0 || v30 < v26)
  {
    v33 = v10;
    v34 = v33;
  }
  else
  {
    objc_msgSend(v10, "size");
    UIGraphicsBeginImageContextWithOptions(v71, 0, a4);
    v35 = *MEMORY[0x1E0C9D538];
    v36 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v10, "size");
    v68 = v36;
    v69 = v35;
    v37 = right;
    v38 = top + v36;
    v64 = top + v36;
    v40 = v39 - (left + v37);
    v65 = left + v35;
    v42 = v41 - (top + bottom);
    objc_msgSend(v12, "size");
    v44 = v43;
    v46 = v45;
    objc_msgSend(v12, "scale");
    v48 = v47 / a4;
    v49 = v44 * v48;
    v50 = v46 * v48;
    v66 = v38 + floor((v42 - v46 * v48) * 0.5);
    v67 = v65 + floor((v40 - v44 * v48) * 0.5);
    objc_msgSend(v13, "size");
    v52 = v51;
    v54 = v53;
    objc_msgSend(v12, "scale");
    scale = a4;
    v56 = v55 / a4;
    v57 = v52 * v56;
    v58 = v54 * v56;
    v59 = v65 + floor((v40 - v57) * 0.5);
    v60 = v64 + floor((v42 - v58) * 0.5);
    objc_msgSend(v12, "drawInRect:", v67, v66, v49, v50);
    if (v14)
      objc_msgSend(v13, "drawInRect:blendMode:alpha:", 23, v59, v60, v57, v58, 1.0);
    UIGraphicsGetImageFromCurrentImageContext();
    v61 = objc_claimAutoreleasedReturnValue();

    UIGraphicsEndImageContext();
    objc_msgSend(MEMORY[0x1E0CEAC70], "settingsForPrivateStyle:graphicsQuality:", v15, 100);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setGrayscaleTintMaskImage:", v61);
    objc_msgSend(v62, "setColorTintMaskImage:", v61);
    objc_msgSend(v62, "setFilterMaskImage:", v61);
    objc_msgSend(v10, "_applyBackdropViewSettings:", v62);
    v33 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "size");
    UIGraphicsBeginImageContextWithOptions(v72, 0, scale);
    objc_msgSend(v33, "drawAtPoint:", v69, v68);
    if (v14)
      objc_msgSend(v13, "drawInRect:blendMode:alpha:", 26, v59, v60, v57, v58, 0.4);
    else
      objc_msgSend(v13, "drawInRect:", v59, v60, v57, v58);
    UIGraphicsGetImageFromCurrentImageContext();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();

    v12 = (void *)v61;
  }

  return v34;
}

- (id)bbPreviewFillToSize:(CGSize)a3
{
  NSObject *v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[CKMediaObject transcoderPreviewGenerationFailed](self, "transcoderPreviewGenerationFailed", a3.width, a3.height))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        -[CKMediaObject transferGUID](self, "transferGUID");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412290;
        v13 = v5;
        _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Transfer %@ was marked as failed for preview generation, not showing preview in notification", (uint8_t *)&v12, 0xCu);

      }
    }
    return 0;
  }
  else
  {
    -[CKMediaObject fileURL](self, "fileURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMediaObject previewFilenameExtension](self, "previewFilenameExtension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    IMAttachmentPreviewFileURL();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKMediaObject savedPreviewFromURL:forOrientation:](self, "savedPreviewFromURL:forOrientation:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = 138412290;
        v13 = v9;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Expected OOP preview for SB at %@, got nil", (uint8_t *)&v12, 0xCu);
      }

    }
    return v10;
  }
}

- (CGSize)bbSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[CKMovieMediaObject pxSize](self, "pxSize");
  v3 = v2;
  v5 = v4;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v8 = 1.0 / v7;
  v9 = v3 * v8;
  v10 = v5 * v8;

  v11 = v9;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (BOOL)canExport
{
  void *v3;
  int v4;
  void *v5;
  NSString *v6;
  BOOL IsCompatibleWithSavedPhotosAlbum;

  -[CKMediaObject transfer](self, "transfer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFileDataReady");

  if (!v4)
    return 0;
  -[CKMediaObject fileURL](self, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v6)
    IsCompatibleWithSavedPhotosAlbum = UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(v6);
  else
    IsCompatibleWithSavedPhotosAlbum = 0;

  return IsCompatibleWithSavedPhotosAlbum;
}

- (BOOL)isPhotosCompatible
{
  return 1;
}

- (id)previewItemTitle
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  int v7;
  void *v8;

  if (-[CKMovieMediaObject isJellyfishVideo](self, "isJellyfishVideo"))
  {
    CKFrameworkBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("ANIMOJI");
  }
  else
  {
    -[CKMediaObject filename](self, "filename");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Video Message.mov"));

    CKFrameworkBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v7)
      v5 = CFSTR("SUMMARY_VIDEO_MESSAGE");
    else
      v5 = CFSTR("SUMMARY_VIDEO_TYPE");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E276D870, CFSTR("ChatKit"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CGSize)pxSize
{
  void *v3;
  int v4;
  double width;
  double height;
  CGSize result;

  if (!-[CKMovieMediaObject checkedVideoInfo](self, "checkedVideoInfo"))
  {
    -[CKMediaObject transfer](self, "transfer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isFileDataReady");

    if (v4)
    {
      -[CKMovieMediaObject updateVideoInfo](self, "updateVideoInfo");
      -[CKMovieMediaObject setCheckedVideoInfo:](self, "setCheckedVideoInfo:", 1);
    }
  }
  width = self->_pxSize.width;
  height = self->_pxSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (AVURLAsset)asset
{
  void *v3;
  BOOL v4;
  AVURLAsset *v5;
  AVURLAsset *asset;

  if (!self->_asset)
  {
    -[CKMediaObject transfer](self, "transfer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "isFileDataReady"))
    {
LABEL_5:

      return self->_asset;
    }
    v4 = -[CKMovieMediaObject hasNoVideoTrack](self, "hasNoVideoTrack");

    if (!v4)
    {
      -[CKMediaObject fileURL](self, "fileURL");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      CKAVURLAssetForURL(v3);
      v5 = (AVURLAsset *)objc_claimAutoreleasedReturnValue();
      asset = self->_asset;
      self->_asset = v5;

      goto LABEL_5;
    }
  }
  return self->_asset;
}

- (BOOL)hasNoVideoTrack
{
  _BOOL4 v3;

  v3 = -[CKMovieMediaObject checkedVideoInfo](self, "checkedVideoInfo");
  if (v3)
    LOBYTE(v3) = !-[CKMovieMediaObject hasVideoTrack](self, "hasVideoTrack");
  return v3;
}

- (void)updateVideoInfo
{
  void *v3;
  void *v4;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGAffineTransform v12;
  CGRect v13;
  CGRect v14;

  -[CKMovieMediaObject asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tracksWithMediaType:", *MEMORY[0x1E0C8A808]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CKMovieMediaObject setHasVideoTrack:](self, "setHasVideoTrack:", 1);
    v6 = *MEMORY[0x1E0C9D538];
    v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v5, "naturalSize");
    v9 = v8;
    v11 = v10;
    objc_msgSend(v5, "preferredTransform");
    v13.origin.x = v6;
    v13.origin.y = v7;
    v13.size.width = v9;
    v13.size.height = v11;
    v14 = CGRectApplyAffineTransform(v13, &v12);
    -[CKMovieMediaObject setPxSize:](self, "setPxSize:", v14.size.width, v14.size.height);
  }

}

- (BOOL)validatePreviewFormat
{
  return 1;
}

- (UIImage)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail, a3);
}

- (BOOL)hasVideoTrack
{
  return self->_hasVideoTrack;
}

- (void)setHasVideoTrack:(BOOL)a3
{
  self->_hasVideoTrack = a3;
}

- (void)setIsAutoloopVideo:(BOOL)a3
{
  self->_isAutoloopVideo = a3;
}

- (void)setIsJellyfishVideo:(BOOL)a3
{
  self->_isJellyfishVideo = a3;
}

- (void)setPxSize:(CGSize)a3
{
  self->_pxSize = a3;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (BOOL)checkedVideoInfo
{
  return self->_checkedVideoInfo;
}

- (void)setCheckedVideoInfo:(BOOL)a3
{
  self->_checkedVideoInfo = a3;
}

- (BOOL)isAutoloopVideoInitialized
{
  return self->_isAutoloopVideoInitialized;
}

- (void)setIsAutoloopVideoInitialized:(BOOL)a3
{
  self->_isAutoloopVideoInitialized = a3;
}

- (BOOL)isJellyfishInitialized
{
  return self->_isJellyfishInitialized;
}

- (void)setIsJellyfishInitialized:(BOOL)a3
{
  self->_isJellyfishInitialized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
}

+ (Class)__ck_attachmentItemClass
{
  return (Class)objc_opt_class();
}

@end
