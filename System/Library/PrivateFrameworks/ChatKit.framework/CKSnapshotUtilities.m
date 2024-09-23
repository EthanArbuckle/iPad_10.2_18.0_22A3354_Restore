@implementation CKSnapshotUtilities

+ (int64_t)_convertUserInterfaceStyle:(int64_t)a3
{
  int64_t result;
  NSObject *v4;
  uint8_t v5[16];

  result = a3;
  if ((unint64_t)a3 >= 3)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Missing a new UIUserInterfaceStyle - we rely on IMUserInterfaceStyleMax to delete all cached snapshots on disk", v5, 2u);
      }

    }
    return 1;
  }
  return result;
}

+ (id)snapshotKeyWithGuid:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CEAC18];
  v4 = a3;
  objc_msgSend(v3, "keyWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[CKSnapshotUtilities _convertUserInterfaceStyle:](CKSnapshotUtilities, "_convertUserInterfaceStyle:", objc_msgSend(v6, "userInterfaceStyle"));

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%d"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)cacheSnapshot:(id)a3 guid:(id)a4 postChangeNotification:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  +[CKPreviewDispatchCache snapshotCache](CKPreviewDispatchCache, "snapshotCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__CKSnapshotUtilities_cacheSnapshot_guid_postChangeNotification___block_invoke;
    block[3] = &unk_1E274A208;
    v20 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  +[CKSnapshotUtilities snapshotKeyWithGuid:](CKSnapshotUtilities, "snapshotKeyWithGuid:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCachedPreview:key:", v8, v12);
  IMPluginSnapshotCachesFileURL();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __65__CKSnapshotUtilities_cacheSnapshot_guid_postChangeNotification___block_invoke_2;
  v15[3] = &unk_1E274A420;
  v17 = v8;
  v18 = a1;
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v13 = v8;
  v14 = v16;
  objc_msgSend(v10, "enqueueSaveBlock:withPriority:", v15, 0);

}

void __65__CKSnapshotUtilities_cacheSnapshot_guid_postChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v5 = CFSTR("CKSnapshotChangedMessageGUIDKey");
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("CKSnapshotChangedNotification"), 0, v4);

}

uint64_t __65__CKSnapshotUtilities_cacheSnapshot_guid_postChangeNotification___block_invoke_2(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return objc_msgSend(*(id *)(result + 48), "_saveSnapshot:url:", *(_QWORD *)(result + 40));
  return result;
}

+ (BOOL)shouldInvertSnapshots
{
  void *v2;
  char v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInternalInstall");

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("InvertPluginSnapshots"));

  return v3 & v5;
}

+ (id)snapshotForGUID:(id)a3
{
  id v4;
  int v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(a1, "shouldInvertSnapshots");
  objc_msgSend(a1, "_snapshotForGUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "_invertImage:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  return v6;
}

+ (id)_invertImage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const void *v9;
  void *v10;
  double v11;
  id v12;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDC8]), "initWithImage:", v3);
  objc_msgSend(MEMORY[0x1E0C9DDB8], "colorInvertFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setValue:forKey:", v4, *MEMORY[0x1E0C9E1F8]);
    objc_msgSend(v6, "outputImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C9DD90], "contextWithOptions:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "extent");
      v9 = (const void *)objc_msgSend(v8, "createCGImage:fromRect:", v7);
      v10 = (void *)MEMORY[0x1E0CEA638];
      objc_msgSend(v3, "scale");
      objc_msgSend(v10, "imageWithCGImage:scale:orientation:", v9, objc_msgSend(v3, "imageOrientation"), v11);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (v9)
        CFRelease(v9);

    }
    else
    {
      v12 = v3;
    }

  }
  else
  {
    v12 = v3;
  }

  return v12;
}

+ (id)_snapshotForGUID:(id)a3
{
  id v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = 0;
  if (a3 && !__CurrentTestName)
  {
    +[CKSnapshotUtilities snapshotKeyWithGuid:](CKSnapshotUtilities, "snapshotKeyWithGuid:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKPreviewDispatchCache snapshotCache](CKPreviewDispatchCache, "snapshotCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cachedPreviewForKey:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v3 = v7;
    }
    else
    {
      IMPluginSnapshotCachesFileURL();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_snapshotAtURL:", v8);
      v3 = (id)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        objc_msgSend(v6, "setCachedPreview:key:", v3, v5);
        v9 = v3;
      }

    }
  }
  return v3;
}

+ (BOOL)snapshotExistsForGUID:(id)a3
{
  char v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = 0;
  if (a3 && !__CurrentTestName)
  {
    +[CKSnapshotUtilities snapshotKeyWithGuid:](CKSnapshotUtilities, "snapshotKeyWithGuid:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKPreviewDispatchCache snapshotCache](CKPreviewDispatchCache, "snapshotCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cachedPreviewForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v3 = 1;
    else
      v3 = IMPluginSnapshotExistsInCache();

  }
  return v3;
}

+ (void)_cacheSnapshotView:(id)a3 forGUID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  +[CKPreviewDispatchCache snapshotCache](CKPreviewDispatchCache, "snapshotCache");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[CKSnapshotUtilities snapshotKeyWithGuid:](CKSnapshotUtilities, "snapshotKeyWithGuid:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setCachedPreview:key:", v6, v7);
}

+ (id)_snapshotViewForGUID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  +[CKSnapshotUtilities snapshotKeyWithGuid:](CKSnapshotUtilities, "snapshotKeyWithGuid:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKPreviewDispatchCache snapshotCache](CKPreviewDispatchCache, "snapshotCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cachedPreviewForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  return v6;
}

+ (void)_saveSnapshot:(id)a3 url:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = v5;
    v8 = v6;
    im_perform_with_task_assertion();

  }
}

void __41__CKSnapshotUtilities__saveSnapshot_url___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  CKUIImageJPEGRepresentationWithHardwareAcceleration();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "URLByDeletingLastPathComponent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v5 = objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v10);
    v6 = v10;

    if ((v5 & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(3);
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v12 = v3;
          v13 = 2112;
          v14 = v6;
          _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Failed to create preview directory URL: %@ with error: %@", buf, 0x16u);
        }

      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
        _CKLogExternal();
    }
    CKFreeSpaceWriteDataToURL(v2, *(void **)(a1 + 40), 1);

  }
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(3);
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v12 = v9;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Preview saved to %@.", buf, 0xCu);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
    _CKLogExternal();

}

+ (id)_snapshotAtURL:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (v3
    && (v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v3, 1, 0)) != 0)
  {
    v5 = (void *)v4;
    objc_msgSend(MEMORY[0x1E0CEA638], "ckImageWithData:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
