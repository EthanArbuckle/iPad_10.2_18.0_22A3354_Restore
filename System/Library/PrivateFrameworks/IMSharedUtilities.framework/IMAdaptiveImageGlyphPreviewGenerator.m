@implementation IMAdaptiveImageGlyphPreviewGenerator

+ (id)UTITypes
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (BOOL)generatesPreview
{
  return 1;
}

+ (BOOL)writesToDisk
{
  return 1;
}

+ (BOOL)generatesMetadata
{
  return 0;
}

+ (BOOL)shouldScaleUpPreview
{
  return 0;
}

+ (BOOL)shouldShadePreview
{
  return 0;
}

+ (id)generateAndPersistPreviewFromSourceURL:(id)a3 senderContext:(id)a4 balloonBundleID:(id)a5 withPreviewConstraints:(IMPreviewConstraints *)a6 outSize:(CGSize *)a7 error:(id *)a8
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  id v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  void *v49;
  id v50;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v53;
  _QWORD v54[3];

  v54[2] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = _os_activity_create(&dword_19E239000, "com.apple.messages.AttachmentGeneratePreviewAdaptiveImageGlyph", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v15, &state);
  v49 = v14;
  if (v12 && a7 && a8)
  {
    v16 = (void *)MEMORY[0x1E0C99E98];
    IMSafeTemporaryDirectory();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "path", v49);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v18;
    v54[1] = CFSTR("AdaptiveImageGlyphPreview");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fileURLWithPathComponents:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v20, 1, 0, 0);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "URLByAppendingPathComponent:isDirectory:", v22, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "URLByAppendingPathExtension:", CFSTR("heic"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v53 = v12;
          _os_log_impl(&dword_19E239000, v25, OS_LOG_TYPE_INFO, "Invoking BlastDoor for adaptive image glyph at source URL: %@", buf, 0xCu);
        }

      }
      +[IMAdaptiveImageGlyphBlastDoor generateEmojiImageAssetFromSourceURL:senderContext:](IMAdaptiveImageGlyphBlastDoor, "generateEmojiImageAssetFromSourceURL:senderContext:", v12, v13);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v26)
      {
        objc_msgSend(v26, "imageData");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = 0;
        v29 = objc_msgSend(v28, "writeToURL:options:error:", v24, 1, &v50);
        v30 = v50;
        if ((v29 & 1) != 0)
        {
          v31 = v24;
        }
        else
        {
          IMLogHandleForCategory("IMAdaptiveImageGlyphPreviewGenerator");
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            sub_19E36E34C((uint64_t)v24, (uint64_t)v30, v47);

          v31 = 0;
          *a8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 9, 0);
        }

      }
      else
      {
        IMLogHandleForCategory("IMAdaptiveImageGlyphPreviewGenerator");
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          sub_19E36E2E8((uint64_t)v24, v40, v41, v42, v43, v44, v45, v46);

        v31 = 0;
        *a8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 1, 0);
      }

    }
    else
    {
      IMLogHandleForCategory("IMAdaptiveImageGlyphPreviewGenerator");
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        sub_19E36E284((uint64_t)v12, v33, v34, v35, v36, v37, v38, v39);

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 6, 0);
      v31 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v32, OS_LOG_TYPE_INFO, "Invalid parameters", buf, 2u);
      }

    }
    v31 = 0;
  }
  os_activity_scope_leave(&state);

  return v31;
}

@end
