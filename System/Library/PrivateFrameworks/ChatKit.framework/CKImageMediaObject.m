@implementation CKImageMediaObject

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
    v6 = CFSTR("SUMMARY_IMAGE_TYPE");
  else
    v6 = CFSTR("SUMMARY_IMAGE_TYPES");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CKImageMediaObject)initWithTransfer:(id)a3 context:(id)a4 forceInlinePreview:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  CKImageMediaObject *v9;
  CKImageMediaObject *v10;
  NSURL *appendedBundleURL;
  int v12;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  IMSticker *sticker;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v36;

  v5 = a5;
  v8 = a3;
  v36.receiver = self;
  v36.super_class = (Class)CKImageMediaObject;
  v9 = -[CKMediaObject initWithTransfer:context:forceInlinePreview:](&v36, sel_initWithTransfer_context_forceInlinePreview_, v8, a4, v5);
  v10 = v9;
  if (v9)
  {
    appendedBundleURL = v9->_appendedBundleURL;
    v9->_appendedBundleURL = 0;

    v10->_isSticker = objc_msgSend(v8, "isSticker");
    v12 = objc_msgSend(v8, "isAdaptiveImageGlyph");
    v10->_isAdaptiveImageGlyph = v12;
    if (v10->_isSticker || v12 != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMediaObject fileURL](v10, "fileURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v14, "fileExistsAtPath:", v16);

      if ((v17 & 1) == 0)
      {
        IMLogHandleForCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[CKImageMediaObject initWithTransfer:context:forceInlinePreview:].cold.1(v10, v18);

      }
      -[CKMediaObject transfer](v10, "transfer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stickerUserInfo");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = objc_alloc(MEMORY[0x1E0D39B18]);
      objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0D392F8]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0D39310]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMediaObject fileURL](v10, "fileURL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0D39C80]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0D39C90]);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0D39C98]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v21, "initWithStickerID:stickerPackID:fileURL:accessibilityLabel:moodCategory:stickerName:", v22, v23, v24, v25, v26, v27);
      sticker = v10->_sticker;
      v10->_sticker = (IMSticker *)v28;

      objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0D392B8]);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[IMSticker setInitialFrameIndex:](v10->_sticker, "setInitialFrameIndex:", objc_msgSend(v30, "unsignedIntegerValue"));
      objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0D392E8]);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[IMSticker setStickerEffectType:](v10->_sticker, "setStickerEffectType:", objc_msgSend(v31, "integerValue"));
      objc_msgSend(v8, "animatedImageCacheURL");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMSticker setAnimatedImageCacheURLFromExtension:](v10->_sticker, "setAnimatedImageCacheURLFromExtension:", v32);

      objc_msgSend(v8, "adaptiveImageGlyphContentIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMSticker setAdaptiveImageGlyphContentIdentifier:](v10->_sticker, "setAdaptiveImageGlyphContentIdentifier:", v33);

      objc_msgSend(v8, "adaptiveImageGlyphContentDescription");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMSticker setAdaptiveImageGlyphContentDescription:](v10->_sticker, "setAdaptiveImageGlyphContentDescription:", v34);

    }
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sticker, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_livePhoto, 0);
  objc_storeStrong((id *)&self->_isIrisAsset, 0);
  objc_storeStrong((id *)&self->_irisVideoPath, 0);
  objc_storeStrong((id *)&self->_appendedBundleURL, 0);
  objc_storeStrong((id *)&self->_backgroundImageData, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
}

+ (id)UTITypes
{
  CFArrayRef v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v2 = CGImageSourceCopyTypeIdentifiers();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __30__CKImageMediaObject_UTITypes__block_invoke;
  v9[3] = &unk_1E274F6D0;
  v10 = v3;
  v4 = v3;
  -[__CFArray indexesOfObjectsPassingTest:](v2, "indexesOfObjectsPassingTest:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFArray objectsAtIndexes:](v2, "objectsAtIndexes:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __30__CKImageMediaObject_UTITypes__block_invoke(uint64_t a1, void *a2)
{
  int v3;

  v3 = objc_msgSend(a2, "isEqualToString:", CFSTR("public.avci"));
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", CFSTR("public.avci"));
  return v3 ^ 1u;
}

- (id)metricsCollectorMediaType
{
  _BOOL4 v2;
  id *v3;

  v2 = -[CKImageMediaObject isSticker](self, "isSticker");
  v3 = (id *)MEMORY[0x1E0D386D0];
  if (!v2)
    v3 = (id *)MEMORY[0x1E0D386C8];
  return *v3;
}

+ (id)fallbackFilenamePrefix
{
  return CFSTR("IMG");
}

- (int)mediaType
{
  return 3;
}

- (id)location
{
  return 0;
}

- (BOOL)supportsUnknownSenderPreview
{
  return 1;
}

+ (BOOL)isPreviewable
{
  return 1;
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
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[CKImageMediaObject imageData](self, "imageData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ptSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)validatePreviewFormat
{
  return 1;
}

- (id)generateThumbnailForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;

  v4 = a4;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKImageMediaObject imageData](self, "imageData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ptSize");
  objc_msgSend(v7, "thumbnailFillSizeForWidth:imageSize:", a3, v9, v10);
  v12 = v11;
  v14 = v13;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "thumbnailContentAlignmentInsetsForOrientation:", v4);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  return -[CKImageMediaObject generateThumbnailFillToSize:contentAlignmentInsets:](self, "generateThumbnailFillToSize:contentAlignmentInsets:", v12, v14, v17, v19, v21, v23);
}

- (id)generateThumbnailFillToSize:(CGSize)a3 contentAlignmentInsets:(UIEdgeInsets)a4
{
  double height;
  double width;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  CGImage *v24;
  void *v25;
  double v26;
  uint64_t v27;
  id v28;
  void *v29;

  height = a3.height;
  width = a3.width;
  -[CKImageMediaObject thumbnail](self, "thumbnail", a3.width, a3.height, a4.top, a4.left, a4.bottom, a4.right);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    -[CKImageMediaObject imageData](self, "imageData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "thumbnailFillToSize:", width, height);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v9, "size");
  v12 = v11;
  v14 = v13;
  if (objc_msgSend((id)objc_opt_class(), "shouldScaleUpPreview"))
  {
    -[CKMediaObject transfer](self, "transfer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isSticker"))
    {

    }
    else
    {
      v16 = v14 + 1.0;

      if (v12 + 1.0 < width || v16 < height)
      {
        if ((objc_msgSend(MEMORY[0x1E0D398A0], "isCroppingAvoidanceEnabled") & 1) == 0)
        {
          objc_msgSend(v9, "__ck_imageScaledToFillSize:", width, height);
          v28 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
        objc_msgSend(v9, "scale");
        v19 = width * v18;
        objc_msgSend(v9, "scale");
        v21 = height * v20;
        -[CKMediaObject _previewConstraintsForWidth:](self, "_previewConstraintsForWidth:", width, 0);
        v22 = (void *)MEMORY[0x1E0D398A0];
        v9 = objc_retainAutorelease(v9);
        v23 = objc_msgSend(v22, "newUncroppedPreviewImageFromImage:isScreenshot:maximumSizeInPx:minimumSizeInPx:", objc_msgSend(v9, "CGImage"), -[CKImageMediaObject isScreenshot](self, "isScreenshot"), v19, v21, 0.0, 0.0);
        if (v23)
        {
          v24 = (CGImage *)v23;
          v25 = (void *)MEMORY[0x1E0CEA638];
          objc_msgSend(v9, "scale");
          objc_msgSend(v25, "imageWithCGImage:scale:orientation:", v24, objc_msgSend(v9, "imageOrientation"), v26);
          v27 = objc_claimAutoreleasedReturnValue();

          CGImageRelease(v24);
          v9 = (id)v27;
        }
      }
    }
  }
  v28 = v9;
  v9 = v28;
LABEL_16:
  v29 = v28;

  return v29;
}

- (id)generatePreviewFromThumbnail:(id)a3 width:(double)a4 orientation:(char)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  _BOOL4 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  id v23;
  uint64_t v24;
  CGImage *v25;
  void *v26;
  double v27;
  objc_super v29;
  objc_super v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;

  v5 = a5;
  v8 = a3;
  if (objc_msgSend(MEMORY[0x1E0D398A0], "isCroppingAvoidanceEnabled"))
  {
    v33 = 0;
    v31 = 0u;
    v32 = 0u;
    -[CKMediaObject _previewConstraintsForWidth:](self, "_previewConstraintsForWidth:", a4);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CKImageMediaObject isSticker](self, "isSticker");
    objc_msgSend(v8, "size");
    if (v10)
      objc_msgSend(v9, "unconstrainedAspectFillSizeForWidth:imageSize:", a4, v11, v12);
    else
      objc_msgSend(v9, "thumbnailFillSizeForWidth:imageSize:", a4, v11, v12);
    v16 = v13;
    v17 = v14;
    objc_msgSend(v8, "scale");
    v19 = v16 * v18;
    objc_msgSend(v8, "scale");
    v21 = v17 * v20;
    v22 = (void *)MEMORY[0x1E0D398A0];
    v23 = objc_retainAutorelease(v8);
    v24 = objc_msgSend(v22, "newUncroppedPreviewImageFromImage:isScreenshot:maximumSizeInPx:minimumSizeInPx:", objc_msgSend(v23, "CGImage"), -[CKImageMediaObject isScreenshot](self, "isScreenshot"), v19, v21, *((double *)&v31 + 1), *(double *)&v32);
    if (v24)
    {
      v25 = (CGImage *)v24;
      v26 = (void *)MEMORY[0x1E0CEA638];
      objc_msgSend(v23, "scale");
      objc_msgSend(v26, "imageWithCGImage:scale:orientation:", v25, objc_msgSend(v23, "imageOrientation"), v27);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      CGImageRelease(v25);
    }
    else
    {
      v30.receiver = self;
      v30.super_class = (Class)CKImageMediaObject;
      -[CKMediaObject generatePreviewFromThumbnail:width:orientation:](&v30, sel_generatePreviewFromThumbnail_width_orientation_, v23, v5, a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v29.receiver = self;
    v29.super_class = (Class)CKImageMediaObject;
    -[CKMediaObject generatePreviewFromThumbnail:width:orientation:](&v29, sel_generatePreviewFromThumbnail_width_orientation_, v8, v5, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (BOOL)canExport
{
  void *v3;
  char v4;
  void *v6;
  char v7;

  -[CKMediaObject transfer](self, "transfer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSticker");

  if ((v4 & 1) != 0)
    return 0;
  -[CKMediaObject transfer](self, "transfer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isFileDataReady");

  return v7;
}

- (BOOL)isIrisAsset
{
  NSNumber *isIrisAsset;
  void *v4;
  void *v5;
  NSNumber *v6;
  NSNumber *v7;

  isIrisAsset = self->_isIrisAsset;
  if (!isIrisAsset)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[CKImageMediaObject calculateIrisVideoPath](self, "calculateIrisVideoPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", v5 != 0);
    v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v7 = self->_isIrisAsset;
    self->_isIrisAsset = v6;

    isIrisAsset = self->_isIrisAsset;
  }
  return -[NSNumber BOOLValue](isIrisAsset, "BOOLValue");
}

- (void)legacyExport
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  void *v9;
  dispatch_semaphore_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  NSObject *v22;
  uint64_t *v23;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  if (-[CKImageMediaObject isIrisAsset](self, "isIrisAsset"))
  {
    -[CKMediaObject fileURL](self, "fileURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKImageMediaObject calculateIrisVideoPath](self, "calculateIrisVideoPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x1E0D75318]);
    v7 = MEMORY[0x193FF3C24]("kCMTimeInvalid", CFSTR("CoreMedia"));
    v8 = *(_OWORD *)v7;
    v27 = *(_QWORD *)(v7 + 16);
    v26 = v8;
    v9 = (void *)objc_msgSend(v6, "initWithPathToVideo:pathToImage:imageDisplayTime:pairingIdentifier:", v5, v4, &v26, 0);
    v10 = dispatch_semaphore_create(0);
    if (v9)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v9;
          _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Trying to save iris asset using video complement %@ ", buf, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0CD16F8], "sharedPhotoLibrary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = MEMORY[0x1E0C809B0];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __34__CKImageMediaObject_legacyExport__block_invoke;
      v24[3] = &unk_1E274A208;
      v25 = v9;
      v21[0] = v13;
      v21[1] = 3221225472;
      v21[2] = __34__CKImageMediaObject_legacyExport__block_invoke_2;
      v21[3] = &unk_1E274F6F8;
      v23 = &v28;
      v14 = v10;
      v22 = v14;
      objc_msgSend(v12, "performChanges:completionHandler:", v24, v21);

      dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v35 = v4;
        v36 = 2112;
        v37 = v5;
        v38 = 2112;
        v39 = 0;
        _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "CKMediaObject Could not create video complement object using imagePath %@ and videoPath %@ vc %@", buf, 0x20u);
      }

    }
  }
  if (!*((_BYTE *)v29 + 24))
  {
    v16 = objc_alloc(MEMORY[0x1E0C99D50]);
    -[CKMediaObject fileURL](self, "fileURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithContentsOfURL:", v17);

    if (v18)
      UIImageDataWriteToSavedPhotosAlbum();

  }
  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = *MEMORY[0x1E0D38898];
  v33 = *MEMORY[0x1E0D388A0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trackEvent:withDictionary:", *MEMORY[0x1E0D38868], v20);

  _Block_object_dispose(&v28, 8);
}

id __34__CKImageMediaObject_legacyExport__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(MEMORY[0x1E0CD13B0], "creationRequestForAssetFromVideoComplementBundle:", *(_QWORD *)(a1 + 32));
}

void __34__CKImageMediaObject_legacyExport__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "got result back", (uint8_t *)&v9, 2u);
    }

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = CFSTR("NO");
      if (a2)
        v8 = CFSTR("YES");
      v9 = 138412546;
      v10 = v8;
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Saved iris asset %@ with error %@", (uint8_t *)&v9, 0x16u);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)getIrisVideoPath
{
  return 0;
}

- (id)calculateIrisVideoPath
{
  NSString *irisVideoPath;
  void *v4;
  NSString *v5;
  NSString *v6;

  irisVideoPath = self->_irisVideoPath;
  if (!irisVideoPath)
  {
    -[CKMediaObject fileURL](self, "fileURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKLivePhotoBundleUtilities calculateLivePhotoVideoPath:](CKLivePhotoBundleUtilities, "calculateLivePhotoVideoPath:", v4);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_irisVideoPath;
    self->_irisVideoPath = v5;

    irisVideoPath = self->_irisVideoPath;
  }
  return irisVideoPath;
}

- (id)pasteboardItemProvider
{
  void *v3;
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CKImageMediaObject;
  -[CKMediaObject pasteboardItemProvider](&v14, sel_pasteboardItemProvider);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CKImageMediaObject isIrisAsset](self, "isIrisAsset");
  v5 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __44__CKImageMediaObject_pasteboardItemProvider__block_invoke;
    v13[3] = &unk_1E274B9C8;
    v13[4] = self;
    objc_msgSend(v3, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", CFSTR("com.apple.MobileSMS.appendedURL"), 0, v13);
  }
  objc_msgSend(v3, "registeredContentTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", *MEMORY[0x1E0CEC508]);

  if (v7)
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __44__CKImageMediaObject_pasteboardItemProvider__block_invoke_2;
    v12[3] = &unk_1E274B9C8;
    v12[4] = self;
    objc_msgSend(v3, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v8, 0, v12);

    objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __44__CKImageMediaObject_pasteboardItemProvider__block_invoke_3;
    v11[3] = &unk_1E274B9C8;
    v11[4] = self;
    objc_msgSend(v3, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v9, 0, v11);

  }
  return v3;
}

uint64_t __44__CKImageMediaObject_pasteboardItemProvider__block_invoke(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD))
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "calculateIrisVideoPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, _QWORD))a2)[2](v4, v6, 0);

  return 0;
}

uint64_t __44__CKImageMediaObject_pasteboardItemProvider__block_invoke_2(uint64_t a1, void *a2)
{
  void (**v3)(id, uint64_t, _QWORD);
  id v4;
  void *v5;
  void *v6;
  UIImage *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0CEA638]);
  objc_msgSend(*(id *)(a1 + 32), "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (UIImage *)objc_msgSend(v4, "initWithContentsOfFile:", v6);

  if (v7 && (UIImagePNGRepresentation(v7), (v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = (void *)v8;
    v3[2](v3, v8, 0);
  }
  else
  {
    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v9 = (void *)objc_msgSend(v10, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2C98], -1000, 0);
    ((void (**)(id, uint64_t, void *))v3)[2](v3, 0, v9);
  }

  return 0;
}

uint64_t __44__CKImageMediaObject_pasteboardItemProvider__block_invoke_3(uint64_t a1, void *a2)
{
  void (**v3)(id, uint64_t, _QWORD);
  id v4;
  void *v5;
  void *v6;
  UIImage *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0CEA638]);
  objc_msgSend(*(id *)(a1 + 32), "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (UIImage *)objc_msgSend(v4, "initWithContentsOfFile:", v6);

  if (v7 && (UIImageJPEGRepresentation(v7, 1.0), (v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = (void *)v8;
    v3[2](v3, v8, 0);
  }
  else
  {
    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v9 = (void *)objc_msgSend(v10, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2C98], -1000, 0);
    ((void (**)(id, uint64_t, void *))v3)[2](v3, 0, v9);
  }

  return 0;
}

- (id)rtfDocumentItemsWithFormatString:(id)a3 selectedTextRange:(_NSRange)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)CKImageMediaObject;
  -[CKMediaObject rtfDocumentItemsWithFormatString:selectedTextRange:](&v13, sel_rtfDocumentItemsWithFormatString_selectedTextRange_, a3, a4.location, a4.length);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKImageMediaObject isIrisAsset](self, "isIrisAsset"))
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    v8 = (void *)MEMORY[0x1E0C99E98];
    -[CKImageMediaObject calculateIrisVideoPath](self, "calculateIrisVideoPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addAttribute:value:range:", CFSTR("com.apple.MobileSMS.appendedURL"), v10, 0, objc_msgSend(v7, "length"));
    v14[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v11 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v11;
  }
  return v5;
}

- (BOOL)isPhotosCompatible
{
  return 1;
}

- (BOOL)canShareItem
{
  void *v3;
  BOOL v4;

  -[CKMediaObject transfer](self, "transfer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = !+[CKCommSafetyHelper shouldDisableTranscriptCapabilitiesForCKFileTransfer:](CKCommSafetyHelper, "shouldDisableTranscriptCapabilitiesForCKFileTransfer:", v3)&& !self->_isSticker;

  return v4;
}

- (id)previewItemURL
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[CKMediaObject fileURL](self, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKLivePhotoBundleUtilities getLivePhotoBundleURL:](CKLivePhotoBundleUtilities, "getLivePhotoBundleURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        -[CKMediaObject fileURL](self, "fileURL");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v12 = v4;
        v13 = 2112;
        v14 = v6;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Passing back iris url %@ to QL for fileURL  %@", buf, 0x16u);

      }
    }
    v7 = v4;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CKImageMediaObject;
    -[CKMediaObject previewItemURL](&v10, sel_previewItemURL);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)previewItemTitle
{
  void *v2;
  void *v3;

  CKFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SUMMARY_PHOTO"), &stru_1E276D870, CFSTR("ChatKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (Class)imageDataClass
{
  return (Class)objc_opt_class();
}

- (CKImageData)imageData
{
  uint64_t v3;
  void **v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v3 = 168;
  else
    v3 = 176;
  v4 = (void **)((char *)&self->super.super.isa + v3);
  v5 = *(Class *)((char *)&self->super.super.isa + v3);
  if (!v5)
  {
    v6 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "imageDataClass"));
    -[CKMediaObject data](self, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithData:", v7);
    v9 = *v4;
    *v4 = (void *)v8;

    v5 = *v4;
  }
  return (CKImageData *)v5;
}

- (BOOL)isScreenshot
{
  void *v2;
  void *v3;
  char v4;

  -[CKMediaObject transfer](self, "transfer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isScreenshot");
  else
    v4 = 0;

  return v4;
}

- (CGSize)originalSize
{
  CGSize *p_originalSize;
  double width;
  double height;
  const __CFURL *v6;
  CGFloat v7;
  CGSize result;

  p_originalSize = &self->_originalSize;
  width = self->_originalSize.width;
  height = self->_originalSize.height;
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[CKMediaObject fileURL](self, "fileURL");
    v6 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    p_originalSize->width = CKSizeOfImageAtURL(v6);
    p_originalSize->height = v7;

    width = p_originalSize->width;
    height = p_originalSize->height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (PHLivePhoto)livePhoto
{
  PHLivePhoto **p_livePhoto;
  PHLivePhoto *livePhoto;
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
  id v19;
  PHLivePhoto *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  uint8_t buf[4];
  id v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  p_livePhoto = &self->_livePhoto;
  livePhoto = self->_livePhoto;
  if (livePhoto)
    return livePhoto;
  if (!-[CKImageMediaObject isIrisAsset](self, "isIrisAsset"))
    return (PHLivePhoto *)0;
  -[CKImageMediaObject previewItemURL](self, "previewItemURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75318]), "initWithBundleAtURL:", v6);
  objc_msgSend(v7, "imagePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8
    || (objc_msgSend(v7, "videoPath"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        !v9))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v6;
        _os_log_impl(&dword_18DFCD000, v21, OS_LOG_TYPE_INFO, "Couldn't generate a PFVideoComplement from the given url: %@", buf, 0xCu);
      }

    }
    v19 = 0;
    v18 = 0;
    goto LABEL_15;
  }
  v10 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v7, "imagePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fileURLWithPath:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v7, "videoPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fileURLWithPath:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0CD1608];
  v26[0] = v12;
  v26[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v16, "livePhotoWithResourceFileURLs:error:", v17, &v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v23;

  if (v19 || !v18)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v19;
        _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_INFO, "Couldn't generate a PHLivePhoto, error: %@", buf, 0xCu);
      }

    }
LABEL_15:
    v20 = 0;
    goto LABEL_16;
  }
  objc_storeStrong((id *)p_livePhoto, v18);
  v20 = *p_livePhoto;
  v19 = 0;
LABEL_16:

  return v20;
}

- (CKImageMediaObject)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKImageMediaObject;
  return -[CKMediaObject initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKImageMediaObject;
  -[CKMediaObject encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isSticker
{
  return self->_isSticker;
}

- (BOOL)isAdaptiveImageGlyph
{
  return self->_isAdaptiveImageGlyph;
}

- (UIImage)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail, a3);
}

- (IMSticker)sticker
{
  return self->_sticker;
}

- (void)setSticker:(id)a3
{
  objc_storeStrong((id *)&self->_sticker, a3);
}

+ (Class)__ck_attachmentItemClass
{
  return (Class)objc_opt_class();
}

- (void)initWithTransfer:(void *)a1 context:(NSObject *)a2 forceInlinePreview:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_18DFCD000, a2, OS_LOG_TYPE_ERROR, "Sticker does not exist at path: %@", (uint8_t *)&v4, 0xCu);

}

@end
