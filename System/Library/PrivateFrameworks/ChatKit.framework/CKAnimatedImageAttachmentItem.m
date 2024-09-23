@implementation CKAnimatedImageAttachmentItem

- (CGSize)size
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGSize result;

  -[CKAttachmentItem cachedPreview](self, "cachedPreview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "size");
LABEL_7:
      v6 = v9;
      v8 = v10;
      goto LABEL_8;
    }
LABEL_6:
    v13.receiver = self;
    v13.super_class = (Class)CKAnimatedImageAttachmentItem;
    -[CKImageAttachmentItem size](&v13, sel_size);
    goto LABEL_7;
  }
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  v6 = v5;
  v8 = v7;

LABEL_8:
  v11 = v6;
  v12 = v8;
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)animatedPreviewURL:(BOOL)a3
{
  NSURL *animatedPreviewURL;
  void *v5;
  void *v6;
  NSURL *v7;
  NSURL *v8;

  animatedPreviewURL = self->_animatedPreviewURL;
  if (!animatedPreviewURL)
  {
    -[CKAttachmentItem fileURL](self, "fileURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKAnimatedImage filenameExtension](CKAnimatedImage, "filenameExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    IMAttachmentPreviewFileURL();
    v7 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v8 = self->_animatedPreviewURL;
    self->_animatedPreviewURL = v7;

    animatedPreviewURL = self->_animatedPreviewURL;
  }
  return animatedPreviewURL;
}

- (id)_savedPreviewFromURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  objc_super v11;
  id v12;

  v4 = a3;
  if (v4)
  {
    -[CKAnimatedImageAttachmentItem animatedPreviewURL:](self, "animatedPreviewURL:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    +[CKAnimatedImage animatedImageFromOptimizedBitmapAtFileURL:error:](CKAnimatedImage, "animatedImageFromOptimizedBitmapAtFileURL:error:", v5, &v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v12;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)CKAnimatedImageAttachmentItem;
      -[CKAttachmentItem _savedPreviewFromURL:](&v11, sel__savedPreviewFromURL_, v4);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)generatePreviewWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  CKAnimatedImageAttachmentItem *v17;
  id v18;
  _QWORD *v19;
  _QWORD v20[7];
  _QWORD v21[5];
  id v22;
  objc_super v23;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "previewCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CKAttachmentPreviewCacheKey(self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "previewMaxWidth");
  v9 = v8;

  objc_msgSend(v5, "cachedPreviewForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v23.receiver = self;
    v23.super_class = (Class)CKAnimatedImageAttachmentItem;
    -[CKImageAttachmentItem generatePreviewWithCompletion:](&v23, sel_generatePreviewWithCompletion_, v4);
  }
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__5;
  v21[4] = __Block_byref_object_dispose__5;
  v22 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __63__CKAnimatedImageAttachmentItem_generatePreviewWithCompletion___block_invoke;
  v20[3] = &unk_1E274B928;
  v20[4] = self;
  v20[5] = v21;
  v20[6] = v9;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__CKAnimatedImageAttachmentItem_generatePreviewWithCompletion___block_invoke_3;
  v14[3] = &unk_1E274B978;
  v11 = v5;
  v15 = v11;
  v12 = v6;
  v16 = v12;
  v13 = v4;
  v17 = self;
  v18 = v13;
  v19 = v21;
  objc_msgSend(v11, "enqueueGenerationBlock:completion:withPriority:forKey:", v20, v14, -1, v12);

  _Block_object_dispose(v21, 8);
}

CKAnimatedImage *__63__CKAnimatedImageAttachmentItem_generatePreviewWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  CKMultiFrameImage *v19;
  CKAnimatedImage *v20;
  uint64_t v21;
  uint64_t v23;
  _QWORD aBlock[5];
  id v25;
  uint64_t v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E98];
  IMSafeTemporaryDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v4;
  v27[1] = CFSTR("CKAnimatedImageAttachmentItemPreview");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPathComponents:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, 0);

  objc_msgSend(*(id *)(a1 + 32), "guid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAnimatedImage filenameExtension](CKAnimatedImage, "filenameExtension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByAppendingPathExtension:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  v14 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newImageData");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__CKAnimatedImageAttachmentItem_generatePreviewWithCompletion___block_invoke_2;
  aBlock[3] = &unk_1E274B900;
  v15 = *(_QWORD *)(a1 + 32);
  v26 = *(_QWORD *)(a1 + 48);
  aBlock[4] = v15;
  v25 = v14;
  v16 = v14;
  v17 = _Block_copy(aBlock);
  objc_msgSend(v16, "durationsWithMaxCount:", *MEMORY[0x1E0D381B8]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[CKMultiFrameImage initWithFrameCount:frameProvider:frameDurations:]([CKMultiFrameImage alloc], "initWithFrameCount:frameProvider:frameDurations:", objc_msgSend(v18, "count"), v17, v18);
  v20 = -[CKAnimatedImage initWithMultiFrameImage:]([CKAnimatedImage alloc], "initWithMultiFrameImage:", v19);
  v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v23 = 0;
  -[CKAnimatedImage writeAsOptimizedBitmapToFileURL:error:](v20, "writeAsOptimizedBitmapToFileURL:error:", v21, &v23);

  return v20;
}

id __63__CKAnimatedImageAttachmentItem_generatePreviewWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "thumbnailAtIndex:forWidth:withImageData:", a2, *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "generatePreviewFromThumbnail:width:", v3, *(double *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __63__CKAnimatedImageAttachmentItem_generatePreviewWithCompletion___block_invoke_3(uint64_t a1)
{
  id v2;
  _QWORD block[4];
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__CKAnimatedImageAttachmentItem_generatePreviewWithCompletion___block_invoke_4;
  block[3] = &unk_1E274B978;
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v2 = *(id *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = v2;
  v8 = *(_QWORD *)(a1 + 64);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __63__CKAnimatedImageAttachmentItem_generatePreviewWithCompletion___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;

  objc_msgSend(*(id *)(a1 + 32), "cachedPreviewForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 56);
  if (v3)
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v2);
  if (v2)
  {
    if (CKIsRunningInFullCKClient())
    {
      v4 = *(void **)(a1 + 32);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __63__CKAnimatedImageAttachmentItem_generatePreviewWithCompletion___block_invoke_5;
      v8[3] = &unk_1E274B950;
      v8[4] = *(_QWORD *)(a1 + 48);
      v5 = v2;
      v6 = *(_QWORD *)(a1 + 64);
      v9 = v5;
      v10 = v6;
      objc_msgSend(v4, "enqueueSaveBlock:withPriority:", v8, -1);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeItemAtURL:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), 0);

    }
  }

}

void __63__CKAnimatedImageAttachmentItem_generatePreviewWithCompletion___block_invoke_5(uint64_t *a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (_IMWillLog())
  {
    v14 = a1[4];
    _IMAlwaysLog();
  }
  objc_msgSend((id)a1[4], "animatedPreviewURL:", 1, v14);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if ((v5 & 1) != 0)
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(2);
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v12 = a1[4];
        v13 = a1[5];
        *(_DWORD *)buf = 138412802;
        v19 = v12;
        v20 = 2112;
        v21 = v2;
        v22 = 2112;
        v23 = v13;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_DEBUG, "%@ animated preview NOT saved to %@ because %@ isn't a CKAnimatedImage.", buf, 0x20u);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    {
      v16 = v2;
      v17 = a1[5];
      v15 = a1[4];
      _CKLog();
    }
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "moveItemAtURL:toURL:error:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), v2, 0);

  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(2);
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = a1[4];
      *(_DWORD *)buf = 138412546;
      v19 = v10;
      v20 = 2112;
      v21 = v2;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_DEBUG, "%@ animated preview saved to %@.", buf, 0x16u);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v15 = a1[4];
    v16 = v2;
    _CKLog();
  }
  if ((v8 & 1) == 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", v15, v16, v17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeItemAtURL:error:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), 0);

  }
}

- (id)_newImageData
{
  id v3;
  void *v4;
  void *v5;
  CKImageData *v6;

  v3 = objc_alloc(MEMORY[0x1E0C99D50]);
  -[CKAttachmentItem fileURL](self, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithContentsOfURL:options:error:", v4, 8, 0);

  if (v5)
    v6 = -[CKImageData initWithData:]([CKImageData alloc], "initWithData:", v5);
  else
    v6 = 0;

  return v6;
}

- (id)thumbnailAtIndex:(unint64_t)a3 forWidth:(double)a4 withImageData:(id)a5
{
  id v7;
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
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  NSObject *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  double v46;
  __int16 v47;
  void *v48;
  uint64_t v49;
  CGSize v50;
  CGSize v51;
  CGSize v52;
  CGSize v53;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ptSize");
  objc_msgSend(v8, "thumbnailFillSizeForWidth:imageSize:", a4, v9, v10);
  v12 = v11;
  v14 = v13;

  objc_msgSend(v7, "thumbnailAtIndex:fillToSize:maxCount:", a3, *MEMORY[0x1E0D381B8], v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "size");
  v17 = v16;
  v19 = v18;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "thumbnailFillSizeForWidth:imageSize:", a4, v17, v19);
  v22 = v21;
  v24 = v23;

  if (objc_msgSend((id)objc_opt_class(), "shouldScaleUpPreview"))
  {
    if (v17 + 1.0 < v22 || v19 + 1.0 < v24)
    {
      if (v17 == 0.0)
        v26 = 0.0;
      else
        v26 = v22 / v17;
      if (v19 == 0.0)
        v27 = 0.0;
      else
        v27 = v24 / v19;
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "scale");
      v30 = v29;

      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v30 / fmax(v26, v27);
      objc_msgSend(v31, "scale");
      v34 = v33 * 0.5;

      if (v32 < v34)
        v32 = v34;
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(2);
        OSLogHandleForIMFoundationCategory();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          v50.width = v17;
          v50.height = v19;
          NSStringFromCGSize(v50);
          v36 = (id)objc_claimAutoreleasedReturnValue();
          v51.width = v22;
          v51.height = v24;
          NSStringFromCGSize(v51);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v44 = v36;
          v45 = 2048;
          v46 = v32;
          v47 = 2112;
          v48 = v37;
          _os_log_impl(&dword_18DFCD000, v35, OS_LOG_TYPE_DEBUG, "Scale thumbnail of size (%@) by with image scale %f to try to fill target (%@)", buf, 0x20u);

        }
      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      {
        v52.width = v17;
        v52.height = v19;
        NSStringFromCGSize(v52);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v53.width = v22;
        v53.height = v24;
        NSStringFromCGSize(v53);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        _CKLog();

      }
      v39 = objc_alloc(MEMORY[0x1E0CEA638]);
      v40 = objc_retainAutorelease(v15);
      v15 = (void *)objc_msgSend(v39, "initWithCGImage:scale:orientation:", objc_msgSend(v40, "CGImage"), objc_msgSend(v40, "imageOrientation"), v32);

    }
  }

  return v15;
}

- (id)generatePreviewFromThumbnail:(id)a3 width:(double)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v17;
  CGImage *v18;
  CGImage *v19;
  size_t Width;
  size_t Height;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  NSObject *v32;
  char *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  NSObject *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v52;
  double v53;
  void *v54;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  double v58;
  __int16 v59;
  void *v60;
  uint64_t v61;
  CGSize v62;
  CGSize v63;
  CGSize v64;
  CGSize v65;
  CGSize v66;

  v61 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "size");
    v8 = v7;
    v10 = v9;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "balloonMaskSizeWithTailShape:isMultiline:", 1, 0);
    v13 = v12;
    v15 = v14;

    if (v8 < v13 || v10 < v15)
    {
      v17 = objc_retainAutorelease(v6);
      v18 = (CGImage *)objc_msgSend(v17, "CGImage");
      if (v18)
      {
        v19 = v18;
        Width = CGImageGetWidth(v18);
        Height = CGImageGetHeight(v19);
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "scale");
        v24 = 1.0 / v23;
        v25 = v24 * (double)Width;
        v26 = v24 * (double)Height;

        v27 = v13 / v25;
        v28 = 0.0;
        if (v25 == 0.0)
          v27 = 0.0;
        if (v26 != 0.0)
          v28 = v15 / v26;
        v29 = fmax(v27, v28);
        if (CKMainScreenScale_once_6 != -1)
          dispatch_once(&CKMainScreenScale_once_6, &__block_literal_global_10);
        v30 = *(double *)&CKMainScreenScale_sMainScreenScale_6;
        if (*(double *)&CKMainScreenScale_sMainScreenScale_6 == 0.0)
          v30 = 1.0;
        v31 = ceil(v29 * v30) / v30;
        if (IMOSLoggingEnabled())
        {
          CKLogCStringForType(2);
          OSLogHandleForIMFoundationCategory();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            v62.width = v25;
            v62.height = v26;
            NSStringFromCGSize(v62);
            v33 = (char *)(id)objc_claimAutoreleasedReturnValue();
            v63.width = v13;
            v63.height = v15;
            NSStringFromCGSize(v63);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v56 = v33;
            v57 = 2048;
            v58 = v31;
            v59 = 2112;
            v60 = v34;
            _os_log_impl(&dword_18DFCD000, v32, OS_LOG_TYPE_DEBUG, "Scale thumbnail of size (%@) by a factor of %f to fill minimum (%@)", buf, 0x20u);

          }
        }
        if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
        {
          v64.width = v25;
          v64.height = v26;
          NSStringFromCGSize(v64);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v65.width = v13;
          v65.height = v15;
          NSStringFromCGSize(v65);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = v31;
          v52 = v35;
          _CKLog();

        }
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen", v52, *(_QWORD *)&v53, v54);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "scale");
        v38 = v37;

        v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:scale:orientation:", v19, objc_msgSend(v17, "imageOrientation"), v38 / v31);
        objc_msgSend(v6, "size");
        v8 = v39;
        v10 = v40;

      }
      else
      {
        v6 = v17;
      }
    }
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "thumbnailFillSizeForWidth:imageSize:", a4, v8, v10);
    v45 = v44;
    v47 = v46;

    v48 = fmin(v8, v45);
    v49 = fmin(v10, v47);
    if (CKMainScreenScale_once_6 != -1)
      dispatch_once(&CKMainScreenScale_once_6, &__block_literal_global_10);
    if (*(double *)&CKMainScreenScale_sMainScreenScale_6 == 0.0)
      v50 = 1.0;
    else
      v50 = *(double *)&CKMainScreenScale_sMainScreenScale_6;
    v66.width = v48;
    v66.height = v49;
    UIGraphicsBeginImageContextWithOptions(v66, 0, 0.0);
    objc_msgSend(v6, "drawAtPoint:", 1.0 / v50 * (*MEMORY[0x1E0C9D538] * v50 + floor((v48 * v50 - v8 * v50) * 0.5)), 1.0 / v50 * (*(double *)(MEMORY[0x1E0C9D538] + 8) * v50 + floor((v49 * v50 - v10 * v50) * 0.5)));
    UIGraphicsGetImageFromCurrentImageContext();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(2);
      OSLogHandleForIMFoundationCategory();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v56 = "-[CKAnimatedImageAttachmentItem generatePreviewFromThumbnail:width:]";
        _os_log_impl(&dword_18DFCD000, v41, OS_LOG_TYPE_DEBUG, "passed %s a nil thumbnail", buf, 0xCu);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      _CKLog();
    v42 = 0;
    v6 = 0;
  }

  return v42;
}

+ (BOOL)shouldScaleUpPreview
{
  return 1;
}

- (NSURL)animatedPreviewURL
{
  return self->_animatedPreviewURL;
}

- (void)setAnimatedPreviewURL:(id)a3
{
  objc_storeStrong((id *)&self->_animatedPreviewURL, a3);
}

- (CGSize)imageSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_imageSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_imageSize, &v3, 16, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedPreviewURL, 0);
}

@end
