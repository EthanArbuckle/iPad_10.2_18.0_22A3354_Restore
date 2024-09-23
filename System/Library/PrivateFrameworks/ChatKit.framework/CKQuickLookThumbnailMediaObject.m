@implementation CKQuickLookThumbnailMediaObject

+ (Class)__ck_attachmentItemClass
{
  return (Class)objc_opt_class();
}

+ (id)UTITypes
{
  return &unk_1E286F9D0;
}

- (BOOL)isPreviewable
{
  return !-[CKQuickLookThumbnailMediaObject shouldSuppressPreview](self, "shouldSuppressPreview");
}

- (BOOL)shouldSuppressPreview
{
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  char v8;
  objc_super v10;

  -[CKMediaObject messageContext](self, "messageContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chatContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "serviceType");

  v10.receiver = self;
  v10.super_class = (Class)CKQuickLookThumbnailMediaObject;
  if (-[CKMediaObject shouldSuppressPreview](&v10, sel_shouldSuppressPreview))
    return 1;
  -[CKMediaObject messageContext](self, "messageContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isSenderUnauthenticated");
  if (v5 == 3)
    v6 = v8;
  else
    v6 = 1;

  return v6;
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
    v6 = CFSTR("SUMMARY_AR_TYPE");
  else
    v6 = CFSTR("SUMMARY_AR_TYPES");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)previewForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CKQuickLookThumbnailMediaObject *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  CKQuickLookThumbnailMediaObject *v28;
  uint64_t *v29;
  char v30;
  _QWORD v31[8];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint8_t buf[4];
  CKQuickLookThumbnailMediaObject *v39;
  uint64_t v40;

  v4 = a4;
  v40 = *MEMORY[0x1E0C80C00];
  -[CKMediaObject previewCacheKeyWithOrientation:](self, "previewCacheKeyWithOrientation:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__58;
  v36 = __Block_byref_object_dispose__58;
  v37 = 0;
  -[CKMediaObject transfer](self, "transfer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKQuickLookThumbnailMediaObject isPreviewable](self, "isPreviewable")
    && ((objc_msgSend(v7, "isFileDataReady") & 1) != 0 || (objc_msgSend(v7, "isRestoring") & 1) != 0))
  {
    -[CKMediaObject previewDispatchCache](self, "previewDispatchCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cachedPreviewForKey:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v33[5];
    v33[5] = v9;

    v11 = (void *)v33[5];
    if (!v11)
    {
      -[CKQuickLookThumbnailMediaObject diskCachedThumbnailForOrientation:](self, "diskCachedThumbnailForOrientation:", v4);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v33[5];
      v33[5] = v12;

      objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "trackEvent:", *MEMORY[0x1E0D387A0]);

      if (!v33[5])
      {
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "attachmentBalloonSize");
        v21 = v20;
        v23 = v22;

        if ((objc_msgSend(v8, "isGeneratingPreviewForKey:", v6) & 1) == 0)
        {
          v31[0] = MEMORY[0x1E0C809B0];
          v31[1] = 3221225472;
          v31[2] = __63__CKQuickLookThumbnailMediaObject_previewForWidth_orientation___block_invoke;
          v31[3] = &unk_1E2758340;
          v31[6] = v21;
          v31[7] = v23;
          v31[4] = self;
          v31[5] = &v32;
          v25[0] = MEMORY[0x1E0C809B0];
          v25[1] = 3221225472;
          v25[2] = __63__CKQuickLookThumbnailMediaObject_previewForWidth_orientation___block_invoke_3;
          v25[3] = &unk_1E2758368;
          v29 = &v32;
          v26 = v8;
          v27 = v6;
          v28 = self;
          v30 = v4;
          objc_msgSend(v26, "enqueueGenerationBlock:completion:withPriority:forKey:", v31, v25, -1, v27);

        }
        v16 = 0;
        goto LABEL_15;
      }
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(2);
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v39 = self;
          _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_DEBUG, "%@ quicklook preview read from disk.", buf, 0xCu);
        }

      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      {
        v24 = self;
        _CKLog();
      }
      objc_msgSend(v8, "setCachedPreview:key:", v33[5], v6, v24);
      v11 = (void *)v33[5];
    }
    v16 = v11;
LABEL_15:

    goto LABEL_24;
  }
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(2);
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v39 = self;
      _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_DEBUG, "%@ isn't previewable.", buf, 0xCu);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    _CKLog();
  v16 = (id)v33[5];
LABEL_24:

  _Block_object_dispose(&v32, 8);
  return v16;
}

id __63__CKQuickLookThumbnailMediaObject_previewForWidth_orientation___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  dispatch_time_t v12;
  id v13;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *);
  void *v20;
  NSObject *v21;
  uint64_t v22;

  v2 = objc_alloc(MEMORY[0x1E0CD32C8]);
  objc_msgSend(*(id *)(a1 + 32), "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v6 = (void *)objc_msgSend(v2, "initWithFileAtURL:size:scale:representationTypes:", v3, 4, *(double *)(a1 + 48), *(double *)(a1 + 56), v5);

  objc_msgSend(v6, "setShouldUseRestrictedExtension:", 1);
  if (_IMWillLog())
  {
    v15 = v6;
    _IMAlwaysLog();
  }
  v7 = dispatch_group_create();
  v8 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
  objc_msgSend(v8, "startTimingForKey:", CFSTR("CKQuickLookThumbnailMediaObject_PreviewGenerationTime"));
  dispatch_group_enter(v7);
  objc_msgSend(MEMORY[0x1E0CD32D0], "sharedGenerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __63__CKQuickLookThumbnailMediaObject_previewForWidth_orientation___block_invoke_2;
  v20 = &unk_1E2757790;
  v22 = *(_QWORD *)(a1 + 40);
  v10 = v7;
  v21 = v10;
  objc_msgSend(v9, "generateBestRepresentationForRequest:completionHandler:", v6, &v17);

  objc_msgSend(v8, "stopTimingForKey:", CFSTR("CKQuickLookThumbnailMediaObject_PreviewGenerationTime"));
  if (_IMWillLog())
  {
    objc_msgSend(*(id *)(a1 + 32), "UTIType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v8;
    _IMAlwaysLog();

  }
  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance", v15, v16, v17, v18, v19, v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trackEvent:", *MEMORY[0x1E0D387A8]);

  v12 = dispatch_time(0, 20000000000);
  if (dispatch_group_wait(v10, v12))
    _IMWarn();
  v13 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);

  return v13;
}

void __63__CKQuickLookThumbnailMediaObject_previewForWidth_orientation___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(a2, "UIImage");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (_IMWillLog())
    _IMAlwaysLog();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __63__CKQuickLookThumbnailMediaObject_previewForWidth_orientation___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD block[4];
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__CKQuickLookThumbnailMediaObject_previewForWidth_orientation___block_invoke_4;
  block[3] = &unk_1E2758368;
  v8 = *(_QWORD *)(a1 + 56);
  v5 = *(id *)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v6 = v2;
  v7 = v3;
  v9 = *(_BYTE *)(a1 + 64);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __63__CKQuickLookThumbnailMediaObject_previewForWidth_orientation___block_invoke_4(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  __int128 v5;
  char v6;

  v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 40);
  if (v1)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 32), "setCachedPreview:key:", v1, *(_QWORD *)(result + 40));
    if (CKIsRunningInFullCKClient())
    {
      v3 = *(void **)(v2 + 32);
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __63__CKQuickLookThumbnailMediaObject_previewForWidth_orientation___block_invoke_5;
      v4[3] = &unk_1E2750308;
      v6 = *(_BYTE *)(v2 + 64);
      v5 = *(_OWORD *)(v2 + 48);
      objc_msgSend(v3, "enqueueSaveBlock:forMediaObject:withPriority:", v4, (_QWORD)v5, 0);
    }
    return objc_msgSend(*(id *)(v2 + 48), "postPreviewDidChangeNotifications");
  }
  return result;
}

void __63__CKQuickLookThumbnailMediaObject_previewForWidth_orientation___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = *(char *)(a1 + 48);
  v5 = a2;
  objc_msgSend(v5, "previewFilenameExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewCachesFileURLWithOrientation:extension:generateIntermediaries:", v4, v6, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "savePreview:toURL:forOrientation:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v7, *(char *)(a1 + 48));
}

- (id)diskCachedThumbnailForOrientation:(char)a3
{
  uint64_t v3;
  void *v5;
  const __CFURL *v6;
  CGImageSource *v7;
  CGImageSource *v8;
  CGImageRef ImageAtIndex;
  CGImage *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  -[CKMediaObject previewFilenameExtension](self, "previewFilenameExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMediaObject previewCachesFileURLWithOrientation:extension:generateIntermediaries:](self, "previewCachesFileURLWithOrientation:extension:generateIntermediaries:", v3, v5, 0);
  v6 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

  if (v6 && (v7 = CGImageSourceCreateWithURL(v6, 0)) != 0)
  {
    v8 = v7;
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v7, 0, 0);
    if (ImageAtIndex)
    {
      v10 = ImageAtIndex;
      v11 = (void *)MEMORY[0x1E0CEA638];
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "scale");
      objc_msgSend(v11, "imageWithCGImage:scale:orientation:", v10, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      CGImageRelease(v10);
    }
    else
    {
      v13 = 0;
    }
    CFRelease(v8);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
