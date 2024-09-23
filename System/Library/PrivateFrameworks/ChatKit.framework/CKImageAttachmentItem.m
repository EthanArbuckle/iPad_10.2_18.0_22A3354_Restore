@implementation CKImageAttachmentItem

+ (id)UTITypes
{
  return CGImageSourceCopyTypeIdentifiers();
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
  v5 = (void *)objc_msgSend(v3, "initWithContentsOfURL:options:error:", v4, 1, 0);

  if (v5)
    v6 = -[CKImageData initWithData:]([CKImageData alloc], "initWithData:", v5);
  else
    v6 = 0;

  return v6;
}

- (id)imageData
{
  return -[CKImageAttachmentItem _newImageData](self, "_newImageData");
}

- (CGSize)size
{
  double v3;
  double v4;
  double v6;
  double v7;
  CGSize result;

  -[CKImageAttachmentItem imageSize](self, "imageSize");
  if (v4 == *MEMORY[0x1E0C9D820] && v3 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    if (-[CKImageAttachmentItem backgroundEnqueued](self, "backgroundEnqueued"))
    {
      -[CKImageAttachmentItem setUseDefaultSize:](self, "setUseDefaultSize:", 1);
    }
    else
    {
      -[CKImageAttachmentItem _calculateImageSize](self, "_calculateImageSize");
      -[CKImageAttachmentItem setImageSize:](self, "setImageSize:");
    }
  }
  if (-[CKImageAttachmentItem useDefaultSize](self, "useDefaultSize"))
  {
    v6 = 100.0;
    v7 = 100.0;
  }
  else
  {
    -[CKImageAttachmentItem imageSize](self, "imageSize");
  }
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)startDeferredSetup
{
  double v3;
  double v4;
  void *v6;
  _QWORD v7[5];

  -[CKImageAttachmentItem imageSize](self, "imageSize");
  if (v4 == *MEMORY[0x1E0C9D820]
    && v3 == *(double *)(MEMORY[0x1E0C9D820] + 8)
    && !-[CKImageAttachmentItem backgroundEnqueued](self, "backgroundEnqueued"))
  {
    -[CKImageAttachmentItem setBackgroundEnqueued:](self, "setBackgroundEnqueued:", 1);
    objc_msgSend((id)objc_opt_class(), "previewSizingQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __43__CKImageAttachmentItem_startDeferredSetup__block_invoke;
    v7[3] = &unk_1E274A208;
    v7[4] = self;
    objc_msgSend(v6, "addBlock:withQueuePriority:", v7, 1);

  }
}

uint64_t __43__CKImageAttachmentItem_startDeferredSetup__block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "_calculateImageSize");
  return objc_msgSend(v1, "setImageSize:");
}

- (CGSize)_calculateImageSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  -[CKAttachmentItem cachedPreview](self, "cachedPreview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "size");
    v6 = v5;
    v8 = v7;
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scale");
    v11 = v6 * v10;
    v12 = v8 * v10;
  }
  else
  {
    v9 = -[CKImageAttachmentItem _newImageData](self, "_newImageData");
    objc_msgSend(v9, "pxSize");
    v11 = v13;
    v12 = v14;
  }

  if (v11 == *MEMORY[0x1E0C9D820] && v12 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v11 = 50.0;
    v12 = 50.0;
  }

  v15 = v11;
  v16 = v12;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)generatePreviewWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  CKImageAttachmentItem *v21;
  id v22;
  _QWORD v23[7];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "previewCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CKAttachmentPreviewCacheKey(self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "previewMaxWidth");
  v10 = v9;
  -[CKImageAttachmentItem size](self, "size");
  objc_msgSend(v7, "thumbnailFillSizeForWidth:imageSize:", v10, v11, v12);
  v14 = v13;
  v16 = v15;

  if ((objc_msgSend(v5, "isGeneratingPreviewForKey:", v6) & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v6;
        _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "Queue Generate preview for: %@", buf, 0xCu);
      }

    }
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __55__CKImageAttachmentItem_generatePreviewWithCompletion___block_invoke;
    v23[3] = &unk_1E274DD58;
    v23[4] = self;
    v23[5] = v14;
    v23[6] = v16;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __55__CKImageAttachmentItem_generatePreviewWithCompletion___block_invoke_30;
    v18[3] = &unk_1E274CF80;
    v19 = v5;
    v20 = v6;
    v21 = self;
    v22 = v4;
    objc_msgSend(v19, "enqueueGenerationBlock:completion:withPriority:forKey:", v23, v18, 1, v20);

  }
}

id __55__CKImageAttachmentItem_generatePreviewWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  id v19;
  id v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  NSObject *v29;
  int v31;
  id v32;
  uint64_t v33;
  CGSize v34;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v31 = 138412290;
      v32 = v3;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Run generation block for %@", (uint8_t *)&v31, 0xCu);
    }

  }
  v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newImageData");
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v31 = 138412290;
      v32 = v5;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "backing image data: %@", (uint8_t *)&v31, 0xCu);
    }

  }
  objc_msgSend(v5, "thumbnailFillToSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v31 = 138412290;
      v32 = v7;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "thumbnail: %@", (uint8_t *)&v31, 0xCu);
    }

  }
  objc_msgSend(v7, "size");
  if (v7)
  {
    v11 = *(double *)(a1 + 40);
    v12 = *(double *)(a1 + 48);
    if (v11 != v9 || v12 != v10)
    {
      if (v9 == 0.0)
        v13 = 0.0;
      else
        v13 = v11 / v9;
      if (v10 == 0.0)
        v14 = 0.0;
      else
        v14 = v12 / v10;
      if (CKMainScreenScale_once_34 != -1)
        dispatch_once(&CKMainScreenScale_once_34, &__block_literal_global_77);
      if (*(double *)&CKMainScreenScale_sMainScreenScale_34 == 0.0)
        v15 = 1.0;
      else
        v15 = *(double *)&CKMainScreenScale_sMainScreenScale_34;
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "scale");
      v18 = v17;

      v19 = objc_alloc(MEMORY[0x1E0CEA638]);
      v20 = objc_retainAutorelease(v7);
      v21 = (void *)objc_msgSend(v19, "initWithCGImage:scale:orientation:", objc_msgSend(v20, "CGImage"), objc_msgSend(v20, "imageOrientation"), v18 / (ceil(fmax(v13, v14) * v15) / v15));
      v34.width = v11;
      v34.height = v12;
      UIGraphicsBeginImageContextWithOptions(v34, 0, 0.0);
      objc_msgSend(v21, "size");
      v23 = v22;
      v25 = v24;
      v26 = *MEMORY[0x1E0C9D538];
      v27 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      if (CKMainScreenScale_once_34 != -1)
        dispatch_once(&CKMainScreenScale_once_34, &__block_literal_global_77);
      v28 = *(double *)&CKMainScreenScale_sMainScreenScale_34;
      if (*(double *)&CKMainScreenScale_sMainScreenScale_34 == 0.0)
        v28 = 1.0;
      objc_msgSend(v21, "drawAtPoint:", 1.0 / v28 * (v26 * v28 + floor((v11 * v28 - v23 * v28) * 0.5)), 1.0 / v28 * (v27 * v28 + floor((v12 * v28 - v25 * v28) * 0.5)));
      UIGraphicsGetImageFromCurrentImageContext();
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      UIGraphicsEndImageContext();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          v31 = 138412290;
          v32 = v7;
          _os_log_impl(&dword_18DFCD000, v29, OS_LOG_TYPE_INFO, "crop/resize: %@", (uint8_t *)&v31, 0xCu);
        }

      }
    }
  }

  return v7;
}

void __55__CKImageAttachmentItem_generatePreviewWithCompletion___block_invoke_30(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__CKImageAttachmentItem_generatePreviewWithCompletion___block_invoke_2;
  v5[3] = &unk_1E274CF80;
  v6 = *(id *)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(void **)(a1 + 56);
  v7 = v2;
  v8 = v3;
  v9 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __55__CKImageAttachmentItem_generatePreviewWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "cachedPreviewForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v9 = (id)v2;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "image");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "images");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "firstObject");
      v5 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v5;
    }
    else
    {
      v6 = v9;
    }
    v10 = v6;
    objc_msgSend(*(id *)(a1 + 48), "_savePreview:");
  }
  else
  {
    v10 = 0;
  }
  v7 = *(_QWORD *)(a1 + 56);
  v8 = v10;
  if (v7)
  {
    (*(void (**)(void))(v7 + 16))();
    v8 = v10;
  }

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

- (BOOL)backgroundEnqueued
{
  return self->_backgroundEnqueued;
}

- (void)setBackgroundEnqueued:(BOOL)a3
{
  self->_backgroundEnqueued = a3;
}

- (BOOL)useDefaultSize
{
  return self->_useDefaultSize;
}

- (void)setUseDefaultSize:(BOOL)a3
{
  self->_useDefaultSize = a3;
}

@end
