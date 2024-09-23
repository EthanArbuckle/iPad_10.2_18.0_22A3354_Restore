@implementation CKAnimatedImageMediaObject

- (CKAnimatedImageMediaObject)initWithTransfer:(id)a3 context:(id)a4 forceInlinePreview:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  CKAnimatedImageMediaObject *v10;
  CKAnimatedImageMediaObject *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  NSObject *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v5 = a5;
  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v37.receiver = self;
  v37.super_class = (Class)CKAnimatedImageMediaObject;
  v10 = -[CKImageMediaObject initWithTransfer:context:forceInlinePreview:](&v37, sel_initWithTransfer_context_forceInlinePreview_, v8, v9, v5);
  v11 = v10;
  if (v10)
  {
    v10->_stickerEffectType = 0;
    -[CKMediaObject transfer](v10, "transfer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isSticker");

    if (v13)
    {
      -[CKMediaObject previewFilenameExtension](v11, "previewFilenameExtension");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMediaObject previewCachesFileURLWithOrientation:extension:generateIntermediaries:](v11, "previewCachesFileURLWithOrientation:extension:generateIntermediaries:", 0, v14, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "URLByDeletingPathExtension");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "URLByAppendingPathExtension:", CFSTR("plist"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:", v17);
      if (v18)
      {
        objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v18, 0, 0, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              v31 = (objc_class *)objc_opt_class();
              NSStringFromClass(v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v39 = v32;
              _os_log_impl(&dword_18DFCD000, v30, OS_LOG_TYPE_INFO, "CKAnimatedImageMediaObject: Invalid preview metadata file: %@", buf, 0xCu);

            }
          }
          goto LABEL_31;
        }
        objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isClingEnabled");

        if (v21)
        {
          objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0D392E8]);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v22, "length"))
          {
            if ((objc_msgSend(v22, "containsString:", CFSTR("none")) & 1) != 0)
            {
              v23 = 0;
            }
            else if ((objc_msgSend(v22, "containsString:", CFSTR("stroke")) & 1) != 0)
            {
              v23 = 1;
            }
            else if ((objc_msgSend(v22, "containsString:", CFSTR("comic")) & 1) != 0)
            {
              v23 = 2;
            }
            else if ((objc_msgSend(v22, "containsString:", CFSTR("puffy")) & 1) != 0)
            {
              v23 = 3;
            }
            else if (objc_msgSend(v22, "containsString:", CFSTR("iridescent")))
            {
              v23 = 4;
            }
            else
            {
              v23 = 0;
            }
            v11->_stickerEffectType = v23;
            -[CKImageMediaObject sticker](v11, "sticker");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "setStickerEffectType:", v23);

          }
        }
        objc_msgSend(v8, "stickerUserInfo");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectForKeyedSubscript:", *MEMORY[0x1E0D39308]);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v35, "BOOLValue");

      }
      else
      {
        objc_msgSend(v8, "stickerUserInfo");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "isClingEnabled");

        if (v25)
        {
          objc_msgSend(v19, "valueForKey:", *MEMORY[0x1E0D392E8]);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v26;
          if (v26)
            v11->_stickerEffectType = (int)objc_msgSend(v26, "intValue");

        }
        objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0D39308]);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "BOOLValue");

      }
      v11->_isReaction = v29;
LABEL_31:

    }
  }

  return v11;
}

- (id)animatedImageForWidth:(double)a3
{
  void *v5;
  void *v6;
  CKAnimatedImage *v7;
  void *v8;
  void *v9;
  CKAnimatedImage *v10;

  -[CKImageMediaObject imageData](self, "imageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "durationsWithMaxCount:", *MEMORY[0x1E0D381B8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [CKAnimatedImage alloc];
  -[CKMediaObject transfer](self, "transfer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAnimatedImageMediaObject generateThumbnailsForWidth:isSticker:orientation:](self, "generateThumbnailsForWidth:isSticker:orientation:", objc_msgSend(v8, "isSticker"), 0, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CKAnimatedImage initWithImages:durations:](v7, "initWithImages:durations:", v9, v6);

  return v10;
}

- (id)metricsCollectorMediaType
{
  void *v3;
  int v4;
  id *v5;
  _BOOL4 v6;

  -[CKMediaObject transfer](self, "transfer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSticker");

  if (v4)
  {
    v5 = (id *)MEMORY[0x1E0D386D0];
  }
  else
  {
    v6 = -[CKAnimatedImageMediaObject needsAnimation](self, "needsAnimation");
    v5 = (id *)MEMORY[0x1E0D38698];
    if (!v6)
      v5 = (id *)MEMORY[0x1E0D386C8];
  }
  return *v5;
}

- (BOOL)canPerformQuickAction
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKAnimatedImageMediaObject;
  v3 = -[CKMediaObject canPerformQuickAction](&v5, sel_canPerformQuickAction);
  if (v3)
    LOBYTE(v3) = !-[CKAnimatedImageMediaObject needsAnimation](self, "needsAnimation");
  return v3;
}

- (id)previewForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  CKAnimatedImageMediaObject *v35;
  uint64_t v36;
  id v37;
  objc_super v38;
  _QWORD v39[4];
  id v40;
  id v41;
  CKAnimatedImageMediaObject *v42;
  _BYTE *v43;
  char v44;
  _QWORD v45[7];
  id v46;
  objc_super v47;
  _BYTE buf[24];
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;

  v4 = a4;
  v52 = *MEMORY[0x1E0C80C00];
  if (!-[CKAnimatedImageMediaObject needsAnimation](self, "needsAnimation"))
  {
    v47.receiver = self;
    v47.super_class = (Class)CKAnimatedImageMediaObject;
    -[CKMediaObject previewForWidth:orientation:](&v47, sel_previewForWidth_orientation_, v4, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    return v7;
  }
  if (!-[CKMediaObject transcoderPreviewGenerationFailed](self, "transcoderPreviewGenerationFailed"))
  {
    -[CKMediaObject previewCacheKeyWithOrientation:](self, "previewCacheKeyWithOrientation:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(2);
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v4;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_DEBUG, "%@ previewForOrientation:%d", buf, 0x12u);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    {
      v35 = self;
      v36 = (int)v4;
      _CKLog();
    }
    -[CKMediaObject transfer](self, "transfer", v35, v36);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[CKMediaObject isPreviewable](self, "isPreviewable")
      || (objc_msgSend(v10, "isFileDataReady") & 1) == 0 && (objc_msgSend(v10, "isRestoring") & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(2);
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = self;
          _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_DEBUG, "%@ isn't previewable.", buf, 0xCu);
        }

      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
        _CKLog();
      v7 = 0;
      goto LABEL_63;
    }
    -[CKMediaObject previewDispatchCache](self, "previewDispatchCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cachedPreviewForKey:", v8);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = v12;
        v7 = v12;
LABEL_62:

LABEL_63:
        return v7;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = "-[CKAnimatedImageMediaObject previewForWidth:orientation:]";
          _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "%s cached in-memory preview is not animated, forcing reload from disk", buf, 0xCu);
        }

      }
    }
    -[CKMediaObject transfer](self, "transfer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isFileURLFinalized"))
    {

    }
    else
    {
      -[CKMediaObject transfer](self, "transfer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isSticker");

      if (!v17)
        goto LABEL_40;
    }
    -[CKMediaObject previewFilenameExtension](self, "previewFilenameExtension");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMediaObject previewCachesFileURLWithOrientation:extension:generateIntermediaries:](self, "previewCachesFileURLWithOrientation:extension:generateIntermediaries:", v4, v18, 0);
    v19 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();

    -[CKAnimatedImageMediaObject savedAnimatedPreviewFromURL:forOrientation:](self, "savedAnimatedPreviewFromURL:forOrientation:", v19, v4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "trackEvent:", *MEMORY[0x1E0D387A0]);

    if (v20)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "-[CKAnimatedImageMediaObject previewForWidth:orientation:]";
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v20;
          *(_WORD *)&buf[22] = 2112;
          v49 = v19;
          _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_INFO, "%s Got persisted animated preview %p from disk @ %@", buf, 0x20u);
        }

      }
      objc_msgSend(v11, "setCachedPreview:key:", v20, v8);
      v12 = v20;

      goto LABEL_61;
    }

    v12 = 0;
LABEL_40:
    -[CKMediaObject transfer](self, "transfer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isSticker");

    if (v24)
    {
      -[CKImageMediaObject sticker](self, "sticker");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "animatedImageCacheURLFromExtension");
      v26 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        v46 = 0;
        +[CKAnimatedImage animatedImageFromOptimizedBitmapAtFileURL:error:](CKAnimatedImage, "animatedImageFromOptimizedBitmapAtFileURL:error:", v26, &v46);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v46;

        if (v27)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315650;
              *(_QWORD *)&buf[4] = "-[CKAnimatedImageMediaObject previewForWidth:orientation:]";
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = v27;
              *(_WORD *)&buf[22] = 2112;
              v49 = v26;
              _os_log_impl(&dword_18DFCD000, v28, OS_LOG_TYPE_INFO, "%s Got animated image preview %p from sticker app cache @ %@", buf, 0x20u);
            }

          }
          objc_msgSend(v11, "setCachedPreview:key:", v27, v8);
          v12 = v27;

          goto LABEL_61;
        }

        v12 = 0;
      }

    }
    if (-[CKMediaObject generatePreviewOutOfProcess](self, "generatePreviewOutOfProcess"))
    {
      -[CKMediaObject generateOOPPreviewForWidth:orientation:](self, "generateOOPPreviewForWidth:orientation:", v4, a3);
      v7 = 0;
      goto LABEL_62;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = self;
        _os_log_impl(&dword_18DFCD000, v29, OS_LOG_TYPE_INFO, "%@ animated preview NOT read from disk.", buf, 0xCu);
      }

    }
    if ((objc_msgSend(v11, "isGeneratingPreviewForKey:", v8) & 1) == 0)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v49 = __Block_byref_object_copy__31;
      v50 = __Block_byref_object_dispose__31;
      v51 = 0;
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __58__CKAnimatedImageMediaObject_previewForWidth_orientation___block_invoke;
      v45[3] = &unk_1E274A3F8;
      v45[4] = self;
      v45[5] = buf;
      *(double *)&v45[6] = a3;
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __58__CKAnimatedImageMediaObject_previewForWidth_orientation___block_invoke_51;
      v39[3] = &unk_1E2750330;
      v40 = v11;
      v41 = v8;
      v42 = self;
      v44 = v4;
      v43 = buf;
      objc_msgSend(v40, "enqueueGenerationBlock:completion:withPriority:forKey:", v45, v39, -1, v41);

      _Block_object_dispose(buf, 8);
    }
    v38.receiver = self;
    v38.super_class = (Class)CKAnimatedImageMediaObject;
    -[CKMediaObject previewForWidth:orientation:](&v38, sel_previewForWidth_orientation_, v4, a3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKAnimatedImageMediaObject imageEdgeEnhancementBlockIfNecessary](self, "imageEdgeEnhancementBlockIfNecessary");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)v31;
    if (v31)
    {
      (*(void (**)(uint64_t, void *))(v31 + 16))(v31, v30);
      v33 = objc_claimAutoreleasedReturnValue();

      v30 = (void *)v33;
    }
    v12 = v30;

LABEL_61:
    v7 = v12;
    goto LABEL_62;
  }
  v7 = 0;
  return v7;
}

id __58__CKAnimatedImageMediaObject_previewForWidth_orientation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v19 = v5;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "%@ generate animated preview.", buf, 0xCu);
    }

  }
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "imageData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "transferGUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transfer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "generateAndPersistAnimatedPreviewFromImageData:forWidth:withTransferGUID:isSticker:", v7, v9, objc_msgSend(v10, "isSticker"), v8);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v17 = 0;
  +[CKAnimatedImage animatedImageFromOptimizedBitmapAtFileURL:error:](CKAnimatedImage, "animatedImageFromOptimizedBitmapAtFileURL:error:", v14, &v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __58__CKAnimatedImageMediaObject_previewForWidth_orientation___block_invoke_51(uint64_t a1)
{
  _QWORD block[4];
  id v3;
  id v4;
  __int128 v5;
  char v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__CKAnimatedImageMediaObject_previewForWidth_orientation___block_invoke_2;
  block[3] = &unk_1E2750330;
  v3 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v6 = *(_BYTE *)(a1 + 64);
  v5 = *(_OWORD *)(a1 + 48);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __58__CKAnimatedImageMediaObject_previewForWidth_orientation___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  __int128 v10;
  char v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cachedPreviewForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if (CKIsRunningInFullCKClient())
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v3 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
        {
          v4 = *(_QWORD *)(a1 + 48);
          *(_DWORD *)buf = 138412290;
          v13 = v4;
          _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "%@ save animated preview.", buf, 0xCu);
        }

      }
      v5 = *(void **)(a1 + 32);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __58__CKAnimatedImageMediaObject_previewForWidth_orientation___block_invoke_52;
      v9[3] = &unk_1E2750308;
      v11 = *(_BYTE *)(a1 + 64);
      v10 = *(_OWORD *)(a1 + 48);
      objc_msgSend(v5, "enqueueSaveBlock:forMediaObject:withPriority:", v9, (_QWORD)v10, 0);
    }
    else if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
          *(_DWORD *)buf = 138412290;
          v13 = v7;
          _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Not running in Full CK Client, deleting %@", buf, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeItemAtURL:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), 0);

    }
    objc_msgSend(*(id *)(a1 + 48), "postPreviewDidChangeNotifications");
  }

}

void __58__CKAnimatedImageMediaObject_previewForWidth_orientation___block_invoke_52(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "needsAnimation"))
  {
    v4 = *(_BYTE *)(a1 + 48);
    v5 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "pathExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "previewCachesFileURLWithOrientation:extension:generateIntermediaries:", v4, v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "moveItemAtURL:toURL:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v7, 0);

    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        v11 = 134218240;
        v12 = v7;
        v13 = 2048;
        v14 = v10;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Failed to get a previewURL %p, or temporaryPreviewURL %p", (uint8_t *)&v11, 0x16u);
      }

    }
  }

}

- (void)prewarmPreviewForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  __int128 *p_buf;
  id v29;
  char v30;
  objc_super v31;
  _BYTE v32[12];
  __int16 v33;
  void *v34;
  __int128 buf;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;

  v4 = a4;
  v40 = *MEMORY[0x1E0C80C00];
  if (!-[CKAnimatedImageMediaObject needsAnimation](self, "needsAnimation"))
  {
    v31.receiver = self;
    v31.super_class = (Class)CKAnimatedImageMediaObject;
    -[CKMediaObject prewarmPreviewForWidth:orientation:](&v31, sel_prewarmPreviewForWidth_orientation_, v4, a3);
  }
  -[CKMediaObject previewCacheKeyWithOrientation:](self, "previewCacheKeyWithOrientation:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v7;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Prewarm: Asked to prewarm preview for key %@", (uint8_t *)&buf, 0xCu);
    }

  }
  if (!-[CKMediaObject transcoderPreviewGenerationFailed](self, "transcoderPreviewGenerationFailed"))
  {
    -[CKMediaObject transfer](self, "transfer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[CKMediaObject isPreviewable](self, "isPreviewable")
      || (objc_msgSend(v10, "isFileDataReady") & 1) == 0 && (objc_msgSend(v10, "isRestoring") & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v7;
          _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Prewarm: Not prewarming %@, not previewable", (uint8_t *)&buf, 0xCu);
        }

      }
      goto LABEL_33;
    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__31;
    v38 = __Block_byref_object_dispose__31;
    v39 = 0;
    -[CKMediaObject previewDispatchCache](self, "previewDispatchCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cachedPreviewForKey:", v7);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v12;

    if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v32 = 138412290;
          *(_QWORD *)&v32[4] = v7;
          _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "Prewarm: %@ already in cache", v32, 0xCu);
        }

      }
      goto LABEL_32;
    }
    -[CKMediaObject transfer](self, "transfer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isFileURLFinalized"))
    {

    }
    else
    {
      -[CKMediaObject transfer](self, "transfer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isSticker");

      if (!v18)
      {
LABEL_32:

        _Block_object_dispose(&buf, 8);
LABEL_33:

        goto LABEL_34;
      }
    }
    -[CKMediaObject previewFilenameExtension](self, "previewFilenameExtension");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMediaObject previewCachesFileURLWithOrientation:extension:generateIntermediaries:](self, "previewCachesFileURLWithOrientation:extension:generateIntermediaries:", v4, v19, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v32 = 138412546;
        *(_QWORD *)&v32[4] = v7;
        v33 = 2112;
        v34 = v20;
        _os_log_impl(&dword_18DFCD000, v21, OS_LOG_TYPE_INFO, "Prewarm: Async fetching %@ at path %@", v32, 0x16u);
      }

    }
    *(_QWORD *)v32 = 0;
    objc_initWeak((id *)v32, self);
    +[CKPreviewDispatchCache previewPrewarmQueue](CKPreviewDispatchCache, "previewPrewarmQueue");
    v22 = objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __65__CKAnimatedImageMediaObject_prewarmPreviewForWidth_orientation___block_invoke;
    v24[3] = &unk_1E2750380;
    p_buf = &buf;
    objc_copyWeak(&v29, (id *)v32);
    v25 = v20;
    v30 = v4;
    v26 = v11;
    v27 = v7;
    v23 = v20;
    dispatch_async(v22, v24);

    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)v32);
    goto LABEL_32;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v7;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Prewarm: Not prewarming %@, transcode generation failed", (uint8_t *)&buf, 0xCu);
    }

  }
LABEL_34:

}

void __65__CKAnimatedImageMediaObject_prewarmPreviewForWidth_orientation___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  __CFString *v13;
  uint64_t v14;
  uint8_t buf[4];
  const __CFString *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "savedAnimatedPreviewFromURL:forOrientation:", *(_QWORD *)(a1 + 32), *(char *)(a1 + 72));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v9 = objc_loadWeakRetained(v2);
      *(_DWORD *)buf = 138412802;
      v16 = CFSTR("animated");
      v17 = 2112;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Prewarm: %@ preview %@, welf %@", buf, 0x20u);

    }
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__CKAnimatedImageMediaObject_prewarmPreviewForWidth_orientation___block_invoke_61;
  v10[3] = &unk_1E2750358;
  v14 = *(_QWORD *)(a1 + 56);
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v13 = CFSTR("animated");
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

void __65__CKAnimatedImageMediaObject_prewarmPreviewForWidth_orientation___block_invoke_61(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  unint64_t v4;
  const char *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  unint64_t v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "cachedPreviewForKey:", *(_QWORD *)(a1 + 40));
    v2 = objc_claimAutoreleasedReturnValue();
    if (v2
      && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
       || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_21;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_21;
      -[NSObject durations](v2, "durations");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "durations");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (v10 <= v8)
        goto LABEL_21;
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v12 = 136315650;
          v13 = "-[CKAnimatedImageMediaObject prewarmPreviewForWidth:orientation:]_block_invoke";
          v14 = 2048;
          v15 = v10;
          v16 = 2048;
          v17 = v8;
          _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "%s Prewarm adding to cache, preview count %lu > cached count %lu", (uint8_t *)&v12, 0x20u);
        }

      }
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        v12 = 136315650;
        v13 = "-[CKAnimatedImageMediaObject prewarmPreviewForWidth:orientation:]_block_invoke";
        v14 = 2112;
        v15 = v4;
        v16 = 2112;
        v17 = (unint64_t)v2;
        _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "%s Prewarm adding to cache, preview is %@ superceeds cached preview %@", (uint8_t *)&v12, 0x20u);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "setCachedPreview:key:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (!IMOSLoggingEnabled())
      return;
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v5 = *(const char **)(a1 + 48);
      v12 = 138412546;
      v13 = v5;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "Prewarm: No %@ preview on disk for %@", (uint8_t *)&v12, 0x16u);
    }
  }
LABEL_21:

}

- (id)generateAndPersistAnimatedPreviewFromImageData:(id)a3 forWidth:(double)a4 withTransferGUID:(id)a5 isSticker:(BOOL)a6
{
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  CKMultiFrameImage *v27;
  CKAnimatedImage *v28;
  CKAnimatedImage *v29;
  _BOOL4 v30;
  id v31;
  NSObject *v32;
  CKAnimatedImageMediaObject *v33;
  const __CFString *v34;
  void *v35;
  CKAnimatedImageMediaObject *v37;
  void *v38;
  void *v40;
  CKAnimatedImageMediaObject *v41;
  id v42;
  _QWORD aBlock[5];
  id v44;
  double v45;
  BOOL v46;
  id v47;
  uint8_t buf[4];
  CKAnimatedImageMediaObject *v49;
  __int16 v50;
  const __CFString *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  id v55;
  _QWORD v56[4];

  v56[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v41 = (CKAnimatedImageMediaObject *)a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v49 = self;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "%@ generate animated preview.", buf, 0xCu);
    }

  }
  v11 = (void *)MEMORY[0x1E0C99E98];
  IMSafeTemporaryDirectory();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v13;
  v56[1] = CFSTR("CKAnimatedImageMediaObjectPreview");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fileURLWithPathComponents:", v14);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  LOBYTE(v11) = objc_msgSend(v15, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v40, 1, 0, &v47);
  v37 = (CKAnimatedImageMediaObject *)v47;

  if ((v11 & 1) == 0 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v49 = v37;
      _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "Failed to create temporary preview directory with error: %@", buf, 0xCu);
    }

  }
  if (!v41)
    goto LABEL_32;
  -[CKAnimatedImageMediaObject im_lastPathComponent](v41, "im_lastPathComponent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "URLByAppendingPathComponent:isDirectory:", v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAnimatedImage filenameExtension](CKAnimatedImage, "filenameExtension");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "URLByAppendingPathExtension:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
LABEL_32:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v49 = v41;
        _os_log_impl(&dword_18DFCD000, v21, OS_LOG_TYPE_INFO, "Failed to get a temporaryPreviewURL from transfer guid %@", buf, 0xCu);
      }

    }
    v20 = 0;
  }
  v22 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
  objc_msgSend(v22, "startTimingForKey:", CFSTR("CKAnimatedImageMediaObject_PreviewGenerationTime"));
  objc_msgSend(v9, "durationsWithMaxCount:", *MEMORY[0x1E0D381B8]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __113__CKAnimatedImageMediaObject_generateAndPersistAnimatedPreviewFromImageData_forWidth_withTransferGUID_isSticker___block_invoke;
  aBlock[3] = &unk_1E27503A8;
  aBlock[4] = self;
  v45 = a4;
  v25 = v9;
  v44 = v25;
  v46 = a6;
  v26 = _Block_copy(aBlock);
  v27 = -[CKMultiFrameImage initWithFrameCount:frameProvider:frameDurations:]([CKMultiFrameImage alloc], "initWithFrameCount:frameProvider:frameDurations:", v24, v26, v23);
  if (v27)
  {
    v28 = -[CKAnimatedImage initWithMultiFrameImage:]([CKAnimatedImage alloc], "initWithMultiFrameImage:", v27);
    v29 = v28;
    if (v28)
    {
      v42 = 0;
      v30 = -[CKAnimatedImage writeAsOptimizedBitmapToFileURL:error:](v28, "writeAsOptimizedBitmapToFileURL:error:", v20, &v42);
      v31 = v42;
    }
    else
    {
      v30 = 0;
      v31 = 0;
    }

  }
  else
  {
    v30 = 0;
    v31 = 0;
  }
  objc_msgSend(v22, "stopTimingForKey:", CFSTR("CKAnimatedImageMediaObject_PreviewGenerationTime"), v37);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      -[CKMediaObject UTIType](self, "UTIType");
      v33 = (CKAnimatedImageMediaObject *)objc_claimAutoreleasedReturnValue();
      v34 = CFSTR("NO");
      *(_DWORD *)buf = 138413058;
      v49 = v33;
      v50 = 2112;
      if (v30)
        v34 = CFSTR("YES");
      v51 = v34;
      v52 = 2112;
      v53 = v31;
      v54 = 2112;
      v55 = v22;
      _os_log_impl(&dword_18DFCD000, v32, OS_LOG_TYPE_INFO, "Cache miss on UTI type %@ generated with success: (%@), error: (%@), and timing: %@", buf, 0x2Au);

    }
  }
  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "trackEvent:", *MEMORY[0x1E0D387A8]);

  return v20;
}

id __113__CKAnimatedImageMediaObject_generateAndPersistAnimatedPreviewFromImageData_forWidth_withTransferGUID_isSticker___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "thumbnailAtIndex:forWidth:imageData:isSticker:orientation:", a2, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), 0, *(double *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (*(_BYTE *)(a1 + 56))
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "generatePreviewFromThumbnail:width:orientation:", v3, 0, *(double *)(a1 + 48));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)generateAndPersistAnimatedPreviewFromSourceURL:(id)a3 senderContext:(id)a4 forWidth:(double)a5 withTransferGUID:(id)a6 isSticker:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  NSObject *v12;
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
  NSObject *v23;
  __CFString *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  dispatch_time_t v30;
  NSObject *v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  CKMultiFrameImage *v39;
  CKAnimatedImage *v40;
  CKAnimatedImage *v41;
  _BOOL4 v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  id v49;
  void *v50;
  void *v51;
  id v53;
  id v54;
  id v55;
  _QWORD aBlock[4];
  id v57;
  id v58;
  CKAnimatedImageMediaObject *v59;
  uint64_t v60;
  double v61;
  BOOL v62;
  _QWORD v63[4];
  NSObject *v64;
  __int128 *p_buf;
  uint8_t v66[4];
  void *v67;
  __int16 v68;
  const __CFString *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  __CFString *v73;
  __int128 buf;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  _QWORD v79[5];

  v7 = a7;
  v79[2] = *MEMORY[0x1E0C80C00];
  v53 = a3;
  v54 = a4;
  v11 = a6;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = self;
      _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "%@ generate animated preview.", (uint8_t *)&buf, 0xCu);
    }

  }
  v13 = (void *)MEMORY[0x1E0C99E98];
  IMSafeTemporaryDirectory();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = v15;
  v79[1] = CFSTR("CKAnimatedImageMediaObjectPreview");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fileURLWithPathComponents:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v17, 1, 0, 0);

  if (!v11)
    goto LABEL_54;
  objc_msgSend(v11, "im_lastPathComponent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "URLByAppendingPathComponent:isDirectory:", v19, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAnimatedImage filenameExtension](CKAnimatedImage, "filenameExtension");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "URLByAppendingPathExtension:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
LABEL_54:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v11;
        _os_log_impl(&dword_18DFCD000, v23, OS_LOG_TYPE_INFO, "Failed to get a temporaryPreviewURL from transfer guid %@", (uint8_t *)&buf, 0xCu);
      }

    }
    v22 = 0;
  }
  v24 = (__CFString *)objc_alloc_init(MEMORY[0x1E0D36AE8]);
  -[__CFString startTimingForKey:](v24, "startTimingForKey:", CFSTR("CKAnimatedImageMediaObject_PreviewGenerationTime"));
  -[__CFString startTimingForKey:](v24, "startTimingForKey:", CFSTR("CKAnimatedImageMediaObject_PreviewGenerationTime_MetadataOnly"));
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v75 = 0x3032000000;
  v76 = __Block_byref_object_copy__31;
  v77 = __Block_byref_object_dispose__31;
  v78 = 0;
  v25 = dispatch_group_create();
  dispatch_group_enter(v25);
  v26 = (void *)MEMORY[0x1E0D396D0];
  v27 = MEMORY[0x1E0C809B0];
  v28 = *MEMORY[0x1E0D381B8];
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __127__CKAnimatedImageMediaObject_generateAndPersistAnimatedPreviewFromSourceURL_senderContext_forWidth_withTransferGUID_isSticker___block_invoke;
  v63[3] = &unk_1E27503D0;
  p_buf = &buf;
  v29 = v25;
  v64 = v29;
  objc_msgSend(v26, "getMetadataForAnimatedImage:senderContext:maxCount:withCompletionBlock:", v53, v54, v28, v63);
  v30 = dispatch_time(0, 1000000000);
  if (dispatch_group_wait(v29, v30))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v66 = 0;
        _os_log_impl(&dword_18DFCD000, v31, OS_LOG_TYPE_INFO, "Timed out waiting for BlastDoor's getMetadataForAnimatedImage.", v66, 2u);
      }

    }
    if (!IMOSLoggingEnabled())
      goto LABEL_21;
    OSLogHandleForIMFoundationCategory();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v66 = 0;
      _os_log_impl(&dword_18DFCD000, v32, OS_LOG_TYPE_INFO, "Unable to get animated image metadata from BlastDoor, returning early.", v66, 2u);
    }
LABEL_20:

LABEL_21:
    v33 = 0;
    goto LABEL_51;
  }
  if (!*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v66 = 0;
        _os_log_impl(&dword_18DFCD000, v43, OS_LOG_TYPE_INFO, "BlastDoor's getMetadataForAnimatedImage returned nil.", v66, 2u);
      }

    }
    if (!IMOSLoggingEnabled())
      goto LABEL_21;
    OSLogHandleForIMFoundationCategory();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v66 = 0;
      _os_log_impl(&dword_18DFCD000, v32, OS_LOG_TYPE_INFO, "Unable to get animated image metadata from BlastDoor, returning early.", v66, 2u);
    }
    goto LABEL_20;
  }
  -[__CFString stopTimingForKey:](v24, "stopTimingForKey:", CFSTR("CKAnimatedImageMediaObject_PreviewGenerationTime_MetadataOnly"));
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      -[CKMediaObject UTIType](self, "UTIType");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v66 = 138412546;
      v67 = v35;
      v68 = 2112;
      v69 = v24;
      _os_log_impl(&dword_18DFCD000, v34, OS_LOG_TYPE_INFO, "Cache miss on UTI type %@ generated metadata with timing: %@", v66, 0x16u);

    }
  }
  objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "pixelSize");
  +[CKAnimatedImageMediaObject maxPixelDimensionOfThumbnailWithImagePixelSize:forWidth:isSticker:](CKAnimatedImageMediaObject, "maxPixelDimensionOfThumbnailWithImagePixelSize:forWidth:isSticker:", v7);
  v37 = v36;
  aBlock[0] = v27;
  aBlock[1] = 3221225472;
  aBlock[2] = __127__CKAnimatedImageMediaObject_generateAndPersistAnimatedPreviewFromSourceURL_senderContext_forWidth_withTransferGUID_isSticker___block_invoke_84;
  aBlock[3] = &unk_1E2750420;
  v57 = v53;
  v58 = v54;
  v59 = self;
  v60 = v37;
  v61 = a5;
  v62 = v7;
  v51 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "durations");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[CKMultiFrameImage initWithFrameCount:frameProvider:frameDurations:]([CKMultiFrameImage alloc], "initWithFrameCount:frameProvider:frameDurations:", objc_msgSend(v38, "count"), v51, v38);
  if (v39)
  {
    v40 = -[CKAnimatedImage initWithMultiFrameImage:]([CKAnimatedImage alloc], "initWithMultiFrameImage:", v39);
    v41 = v40;
    if (v40)
    {
      v55 = 0;
      v42 = -[CKAnimatedImage writeAsOptimizedBitmapToFileURL:error:](v40, "writeAsOptimizedBitmapToFileURL:error:", v22, &v55);
      v49 = v55;
    }
    else
    {
      v42 = 0;
      v49 = 0;
    }

    -[__CFString stopTimingForKey:](v24, "stopTimingForKey:", CFSTR("CKAnimatedImageMediaObject_PreviewGenerationTime"), v49);
  }
  else
  {
    v42 = 0;
    -[__CFString stopTimingForKey:](v24, "stopTimingForKey:", CFSTR("CKAnimatedImageMediaObject_PreviewGenerationTime"), 0);
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      -[CKMediaObject UTIType](self, "UTIType");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = CFSTR("NO");
      *(_DWORD *)v66 = 138413058;
      v67 = v45;
      if (v42)
        v46 = CFSTR("YES");
      v68 = 2112;
      v69 = v46;
      v70 = 2112;
      v71 = v50;
      v72 = 2112;
      v73 = v24;
      _os_log_impl(&dword_18DFCD000, v44, OS_LOG_TYPE_INFO, "Cache miss on UTI type %@ generated with success: (%@), error: (%@), and timing: %@", v66, 0x2Au);

    }
  }
  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "trackEvent:", *MEMORY[0x1E0D387A8]);

  if (v42)
    v33 = v22;
  else
    v33 = 0;

LABEL_51:
  _Block_object_dispose(&buf, 8);

  return v33;
}

void __127__CKAnimatedImageMediaObject_generateAndPersistAnimatedPreviewFromSourceURL_senderContext_forWidth_withTransferGUID_isSticker___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  if (v6 && !a3)
  {
    MEMORY[0x193FF3C18](CFSTR("BlastDoorAnimatedImageMetadata"), CFSTR("BlastDoor"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v6;
    else
      v5 = 0;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v5);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

id __127__CKAnimatedImageMediaObject_generateAndPersistAnimatedPreviewFromSourceURL_senderContext_forWidth_withTransferGUID_isSticker___block_invoke_84(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  NSObject *v10;
  dispatch_time_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint8_t v18[8];
  _QWORD v19[4];
  id v20;
  NSObject *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__31;
  v27 = __Block_byref_object_dispose__31;
  v28 = 0;
  v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  v5 = (void *)MEMORY[0x1E0D396D0];
  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v8 = *(double *)(a1 + 56);
  v9 = *MEMORY[0x1E0D381B8];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __127__CKAnimatedImageMediaObject_generateAndPersistAnimatedPreviewFromSourceURL_senderContext_forWidth_withTransferGUID_isSticker___block_invoke_2;
  v19[3] = &unk_1E27503F8;
  v22 = &v23;
  v20 = v6;
  v10 = v4;
  v21 = v10;
  objc_msgSend(v5, "generateAnimatedImagePreview:senderContext:maxPixelDimension:index:maxCount:withCompletionBlock:", v7, v20, a2, v9, v19, v8);
  v11 = dispatch_time(0, 5000000000);
  if (dispatch_group_wait(v10, v11))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Timed out generating frame.", v18, 2u);
      }

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "scaledThumbnailFromThumbnail:forWidth:isSticker:", v24[5], *(unsigned __int8 *)(a1 + 72), *(double *)(a1 + 64));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v24[5];
    v24[5] = v13;

    if (!*(_BYTE *)(a1 + 72))
    {
      objc_msgSend(*(id *)(a1 + 48), "generatePreviewFromThumbnail:width:orientation:", v24[5], 0, *(double *)(a1 + 64));
      v15 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
  v15 = (id)v24[5];
LABEL_8:
  v16 = v15;

  _Block_object_dispose(&v23, 8);
  return v16;
}

void __127__CKAnimatedImageMediaObject_generateAndPersistAnimatedPreviewFromSourceURL_senderContext_forWidth_withTransferGUID_isSticker___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  char isKindOfClass;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a2;
  if (v25 && !a3)
  {
    MEMORY[0x193FF3C18](CFSTR("BlastDoorPreviewImage"), CFSTR("BlastDoor"));
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v6 = v25;
    else
      v6 = 0;
    v7 = v6;
    objc_msgSend(v7, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "cgImage");

    v10 = objc_alloc(MEMORY[0x1E0CEA638]);
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scale");
    v12 = objc_msgSend(v10, "initWithCGImage:scale:orientation:", v9, 0);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    if ((isKindOfClass & 1) == 0)
      goto LABEL_10;
    objc_msgSend(v25, "utTypeString");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
      goto LABEL_10;
    v16 = (void *)v15;
    objc_msgSend(v25, "utTypeString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "length");

    if (v18)
    {
      v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v25, "utTypeString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setValue:forKey:", v20, *MEMORY[0x1E0D38A18]);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isFromMe"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setValue:forKey:", v21, *MEMORY[0x1E0D389F8]);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isTrustedSender"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setValue:forKey:", v22, *MEMORY[0x1E0D38A00]);

      objc_msgSend(*(id *)(a1 + 32), "serviceName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setValue:forKey:", v23, *MEMORY[0x1E0D38A08]);

      objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "trackEvent:withDictionary:", *MEMORY[0x1E0D385F0], v19);

    }
    else
    {
LABEL_10:
      objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "trackEvent:", *MEMORY[0x1E0D385E8]);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

- (id)notificationCenter
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
}

- (id)savedPreviewFromURL:(id)a3 forOrientation:(char)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a4;
  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKAnimatedImageMediaObject;
  -[CKMediaObject savedPreviewFromURL:forOrientation:](&v10, sel_savedPreviewFromURL_forOrientation_, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[CKAnimatedImageMediaObject savedAnimatedPreviewFromURL:forOrientation:](self, "savedAnimatedPreviewFromURL:forOrientation:", v6, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)savedAnimatedPreviewFromURL:(id)a3 forOrientation:(char)a4
{
  uint64_t v5;

  if (!a3)
    return 0;
  v5 = 0;
  +[CKAnimatedImage animatedImageFromOptimizedBitmapAtFileURL:error:](CKAnimatedImage, "animatedImageFromOptimizedBitmapAtFileURL:error:", a3, &v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)scaledThumbnailFromThumbnail:(id)a3 forWidth:(double)a4 isSticker:(BOOL)a5
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  NSObject *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  double v38;
  __int16 v39;
  void *v40;
  uint64_t v41;
  CGSize v42;
  CGSize v43;
  CGSize v44;
  CGSize v45;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "size");
  v9 = v8;
  v11 = v10;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "thumbnailFillSizeForWidth:imageSize:", a4, v9, v11);
  v14 = v13;
  v16 = v15;

  if (objc_msgSend((id)objc_opt_class(), "shouldScaleUpPreview")
    && !a5
    && (v9 + 1.0 < v14 || v11 + 1.0 < v16))
  {
    if (v9 == 0.0)
      v18 = 0.0;
    else
      v18 = v14 / v9;
    if (v11 == 0.0)
      v19 = 0.0;
    else
      v19 = v16 / v11;
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "scale");
    v22 = v21;

    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v22 / fmax(v18, v19);
    objc_msgSend(v23, "scale");
    v26 = v25 * 0.5;

    if (v24 < v26)
      v24 = v26;
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(2);
      OSLogHandleForIMFoundationCategory();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        v42.width = v9;
        v42.height = v11;
        NSStringFromCGSize(v42);
        v28 = (id)objc_claimAutoreleasedReturnValue();
        v43.width = v14;
        v43.height = v16;
        NSStringFromCGSize(v43);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v36 = v28;
        v37 = 2048;
        v38 = v24;
        v39 = 2112;
        v40 = v29;
        _os_log_impl(&dword_18DFCD000, v27, OS_LOG_TYPE_DEBUG, "Scale thumbnail of size (%@) by with image scale %f to try to fill target (%@)", buf, 0x20u);

      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    {
      v44.width = v9;
      v44.height = v11;
      NSStringFromCGSize(v44);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v45.width = v14;
      v45.height = v16;
      NSStringFromCGSize(v45);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      _CKLog();

    }
    v31 = objc_alloc(MEMORY[0x1E0CEA638]);
    v32 = objc_retainAutorelease(v7);
    v7 = (id)objc_msgSend(v31, "initWithCGImage:scale:orientation:", objc_msgSend(v32, "CGImage"), objc_msgSend(v32, "imageOrientation"), v24);

  }
  return v7;
}

- (id)thumbnailAtIndex:(unint64_t)a3 forWidth:(double)a4 imageData:(id)a5 isSticker:(BOOL)a6 orientation:(char)a7
{
  _BOOL8 v7;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;

  v7 = a6;
  if (a6)
  {
    objc_msgSend(a5, "ptSize");
    v13 = v12;
    v15 = v14;
  }
  else
  {
    v16 = a5;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "ptSize");
    objc_msgSend(v17, "thumbnailFillSizeForWidth:imageSize:", a4, v18, v19);
    v13 = v20;
    v15 = v21;

  }
  objc_msgSend(a5, "thumbnailAtIndex:fillToSize:maxCount:", a3, *MEMORY[0x1E0D381B8], v13, v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKAnimatedImageMediaObject scaledThumbnailFromThumbnail:forWidth:isSticker:](self, "scaledThumbnailFromThumbnail:forWidth:isSticker:", v22, v7, a4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (double)maxPixelDimensionOfThumbnailWithImagePixelSize:(CGSize)a3 forWidth:(double)a4 isSticker:(BOOL)a5
{
  double height;
  double width;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  height = a3.height;
  width = a3.width;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  v11 = v10;

  v12 = width / v11;
  v13 = height / v11;
  v14 = v13;
  v15 = v12;
  if (!a5)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "thumbnailFillSizeForWidth:imageSize:", a4, v12, v13);
    v15 = v17;
    v14 = v18;

  }
  v19 = v15 / v12;
  v20 = 0.0;
  if (v12 == 0.0)
    v19 = 0.0;
  if (v13 != 0.0)
    v20 = v14 / v13;
  v21 = fmin(v19, v20);
  return v11 * fmax(floor(v12 * v21), floor(v13 * v21));
}

- (id)generateThumbnailsForWidth:(double)a3 isSticker:(BOOL)a4 orientation:(char)a5
{
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;
  CKAnimatedImageMediaObject *v23;
  double v24;
  BOOL v25;

  -[CKImageMediaObject imageData](self, "imageData", a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ptSize");
  objc_msgSend(v9, "thumbnailFillSizeForWidth:imageSize:", a3, v10, v11);
  v13 = v12;
  v15 = v14;

  objc_msgSend(v8, "thumbnailsFillToSize:maxCount:", *MEMORY[0x1E0D381B8], v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v16, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __79__CKAnimatedImageMediaObject_generateThumbnailsForWidth_isSticker_orientation___block_invoke;
  v21[3] = &unk_1E2750448;
  v18 = v17;
  v22 = v18;
  v23 = self;
  v24 = a3;
  v25 = a4;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v21);
  v19 = v18;

  return v19;
}

void __79__CKAnimatedImageMediaObject_generateThumbnailsForWidth_isSticker_orientation___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "scaledThumbnailFromThumbnail:forWidth:isSticker:", a2, *(unsigned __int8 *)(a1 + 56), *(double *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)saveAnimatedPreview:(id)a3 toURL:(id)a4 forOrientation:(char)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  id v13;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    -[CKMediaObject fileManager](self, "fileManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "fileExistsAtPath:", v10);

    if ((v11 & 1) == 0)
    {
      v12 = v7;
      v13 = v8;
      im_perform_with_task_assertion();

    }
  }

}

void __71__CKAnimatedImageMediaObject_saveAnimatedPreview_toURL_forOrientation___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  int v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = *(id *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v14 = 0;
    v4 = objc_msgSend(v2, "writeAsOptimizedBitmapToFileURL:error:", v3, &v14);
    v5 = v14;
    if (v4)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          v8 = *(_QWORD *)(a1 + 40);
          v7 = *(_QWORD *)(a1 + 48);
          v15 = 138412546;
          v16 = v7;
          v17 = 2112;
          v18 = v8;
          _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "%@ animated preview saved to %@.", (uint8_t *)&v15, 0x16u);
        }

      }
    }
    else
    {
      IMLogHandleForCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __71__CKAnimatedImageMediaObject_saveAnimatedPreview_toURL_forOrientation___block_invoke_cold_1((uint64_t)v5, v13);

    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      v12 = *(_QWORD *)(a1 + 32);
      v15 = 138412802;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "%@ animated preview NOT saved to %@ because %@ isn't a CKAnimatedImage.", (uint8_t *)&v15, 0x20u);
    }

  }
}

- (BOOL)needsAnimation
{
  void *v2;
  char v3;

  -[CKMediaObject transfer](self, "transfer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fileIsAnimated");

  return v3;
}

- (id)imageEdgeEnhancementBlockIfNecessary
{
  return 0;
}

- (id)bbPreviewFillToSize:(CGSize)a3
{
  NSObject *v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
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
    +[CKAnimatedImage filenameExtension](CKAnimatedImage, "filenameExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMediaObject previewCachesFileURLWithOrientation:extension:generateIntermediaries:](self, "previewCachesFileURLWithOrientation:extension:generateIntermediaries:", 0, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKAnimatedImageMediaObject savedAnimatedPreviewFromURL:forOrientation:](self, "savedAnimatedPreviewFromURL:forOrientation:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "image");
      v10 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v10;
    }
    if (!v9 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = 138412290;
        v13 = v8;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Expected OOP preview for SB at %@, got nil", (uint8_t *)&v12, 0xCu);
      }

    }
    return v9;
  }
}

- (BOOL)validatePreviewFormat
{
  return 1;
}

- (BOOL)validPreviewExistsAtURL:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (-[CKMediaObject cachedValidPreviewExists](self, "cachedValidPreviewExists"))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "fileExistsAtPath:", v7);

    -[CKMediaObject setCachedValidPreviewExists:](self, "setCachedValidPreviewExists:", v5);
  }

  return v5;
}

- (CKAnimatedImageMediaObject)initWithCoder:(id)a3
{
  id v4;
  CKAnimatedImageMediaObject *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKAnimatedImageMediaObject;
  v5 = -[CKImageMediaObject initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stickerEffectType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAnimatedImageMediaObject setStickerEffectType:](v5, "setStickerEffectType:", (int)objc_msgSend(v6, "intValue"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKAnimatedImageMediaObject;
  v4 = a3;
  -[CKImageMediaObject encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CKAnimatedImageMediaObject stickerEffectType](self, "stickerEffectType", v6.receiver, v6.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("stickerEffectType"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)stickerEffectType
{
  return self->_stickerEffectType;
}

- (void)setStickerEffectType:(unint64_t)a3
{
  self->_stickerEffectType = a3;
}

- (BOOL)isReaction
{
  return self->_isReaction;
}

+ (Class)__ck_attachmentItemClass
{
  void *v2;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shouldAnimateGifsInPhotoGrid");

  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

void __71__CKAnimatedImageMediaObject_saveAnimatedPreview_toURL_forOrientation___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18DFCD000, a2, OS_LOG_TYPE_ERROR, "Animated preview failed save. Error: %@", (uint8_t *)&v2, 0xCu);
}

@end
