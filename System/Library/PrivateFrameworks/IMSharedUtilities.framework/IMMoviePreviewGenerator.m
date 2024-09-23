@implementation IMMoviePreviewGenerator

+ (id)UTITypes
{
  return &unk_1E3FFEE10;
}

+ (id)fetchUTITypes
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C8B3C0], "audiovisualTypes");
  objc_msgSend(v2, "indexesOfObjectsPassingTest:", &unk_1E3FB3368);
  return (id)MEMORY[0x1E0DE7D20](v2, sel_objectsAtIndexes_);
}

+ (BOOL)isAutoloopAsset:(id)a3
{
  return MEMORY[0x1E0DE7D20](IMAttachmentUtilities, sel_asset_containsMetadataKey_);
}

+ (CGImage)newImageWithPlayButtonOverlay:(CGImage *)a3 scale:(double)a4 transferGUID:(id)a5 error:(id *)a6
{
  void *v10;
  void *v11;
  CGImage *result;
  int v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a6)
    *a6 = 0;
  v10 = (void *)MEMORY[0x1A1AE7D4C](CFSTR("CKMovieMediaObject"), CFSTR("ChatKit"));
  if (!v10 || (v11 = v10, !objc_msgSend(v10, "conformsToProtocol:", &unk_1EE542A80)))
  {
    v15 = IMOSLoggingEnabled();
    if (a5)
    {
      if (v15)
      {
        v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v21 = 138412546;
          v22 = objc_opt_class();
          v23 = 2112;
          v24 = a5;
          _os_log_impl(&dword_19E239000, v16, OS_LOG_TYPE_INFO, "%@ failed to weak link CKMovieMediaObjectClass for GUID: %@", (uint8_t *)&v21, 0x16u);
          if (!a6)
            return 0;
          goto LABEL_20;
        }
      }
    }
    else if (v15)
    {
      v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v21 = 138412290;
        v22 = objc_opt_class();
        _os_log_impl(&dword_19E239000, v17, OS_LOG_TYPE_INFO, "%@ failed to weak link CKMovieMediaObjectClass", (uint8_t *)&v21, 0xCu);
      }
    }
    if (!a6)
      return 0;
LABEL_20:
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 10, 0);
LABEL_21:
    v19 = (void *)v18;
    result = 0;
    *a6 = v19;
    return result;
  }
  result = CGImageCreateCopy((CGImageRef)objc_msgSend(v11, "playButtonPreviewForCGImage:scale:isFromMe:", a3, 0, a4));
  if (result)
    return result;
  v13 = IMOSLoggingEnabled();
  if (a5)
  {
    if (v13)
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v21 = 138412546;
        v22 = objc_opt_class();
        v23 = 2112;
        v24 = a5;
        _os_log_impl(&dword_19E239000, v14, OS_LOG_TYPE_INFO, "%@ CKMovieMediaObject failed to create stamped preview for GUID: %@", (uint8_t *)&v21, 0x16u);
        if (!a6)
          return 0;
        goto LABEL_26;
      }
    }
  }
  else if (v13)
  {
    v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = 138412290;
      v22 = objc_opt_class();
      _os_log_impl(&dword_19E239000, v20, OS_LOG_TYPE_INFO, "%@ CKMovieMediaObject failed to create stamped preview", (uint8_t *)&v21, 0xCu);
    }
  }
  if (a6)
  {
LABEL_26:
    v18 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 1, 0);
    goto LABEL_21;
  }
  return 0;
}

+ (CGImage)newPreviewFromSourceURL:(id)a3 senderContext:(id)a4 withPreviewConstraints:(IMPreviewConstraints *)a5 error:(id *)a6
{
  __int128 v6;
  _OWORD v8[2];
  uint64_t v9;

  v6 = *(_OWORD *)&a5->var1.height;
  v8[0] = *(_OWORD *)&a5->var0;
  v8[1] = v6;
  v9 = *(_QWORD *)&a5->var3;
  return (CGImage *)objc_msgSend(a1, "newPreviewFromSourceURL:senderContext:withPreviewConstraints:skipPlayButton:error:", a3, a4, v8, 0, a6);
}

+ (CGImage)newPreviewFromSourceURL:(id)a3 senderContext:(id)a4 withPreviewConstraints:(IMPreviewConstraints *)a5 skipPlayButton:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double width;
  double height;
  NSObject *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  const void *v33;
  __int128 v34;
  CGImage *v35;
  CGImage *v36;
  NSObject *v37;
  CGAffineTransform v39;
  _BYTE buf[32];
  uint64_t v41;
  uint64_t v42;
  CGRect v43;
  CGRect v44;

  v8 = a6;
  v42 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = a1;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = a3;
      _os_log_impl(&dword_19E239000, v12, OS_LOG_TYPE_INFO, "Generating preview for class %@ from sourceURL %@", buf, 0x16u);
    }
  }
  if (!a3)
  {
    if (IMOSLoggingEnabled())
    {
      v37 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v37, OS_LOG_TYPE_INFO, "IMMoviePreviewgenerator - sourceURL is nil", buf, 2u);
      }
    }
    if (a7)
    {
      v24 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 5, 0);
      goto LABEL_25;
    }
    return 0;
  }
  v13 = (void *)objc_msgSend(a1, "_avAssetForURL:", a3);
  v14 = v13;
  if (!v13)
  {
    if (IMOSLoggingEnabled())
    {
      v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v23, OS_LOG_TYPE_INFO, "IMMoviePreviewgenerator - Could not generate AVURLAsset", buf, 2u);
      }
    }
    if (a7)
    {
      v24 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 3, 0);
LABEL_25:
      v36 = 0;
      *a7 = v24;
      return v36;
    }
    return 0;
  }
  v15 = (void *)objc_msgSend((id)objc_msgSend(v13, "tracksWithMediaType:", *MEMORY[0x1E0C8A808]), "lastObject");
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "naturalSize");
    v18 = v17;
    v20 = v19;
    objc_msgSend(v16, "preferredTransform");
    v43.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
    v43.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D538] + 8);
    v43.size.width = v18;
    v43.size.height = v20;
    v44 = CGRectApplyAffineTransform(v43, &v39);
    width = v44.size.width;
    height = v44.size.height;
  }
  else
  {
    width = *MEMORY[0x1E0C9D820];
    height = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  objc_msgSend(a1, "thumbnailFillSizeForWidth:imageSize:scale:", a5->var0, width, height, a5->var2);
  v26 = v25;
  v28 = v27;
  v29 = (void *)objc_msgSend(MEMORY[0x1E0C8AFC8], "assetImageGeneratorWithAsset:", v14);
  objc_msgSend(v29, "setAppliesPreferredTrackTransform:", 1);
  v30 = fmax(v26 / width, v28 / height);
  v31 = ceil(width * v30);
  v32 = ceil(height * v30);
  objc_msgSend(v29, "setMaximumSize:", v31, v32);
  *(_OWORD *)buf = *MEMORY[0x1E0CA2E68];
  *(_QWORD *)&buf[16] = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  v33 = (const void *)objc_msgSend(v29, "copyCGImageAtTime:actualTime:error:", buf, 0, 0);
  v34 = *(_OWORD *)&a5->var1.height;
  *(_OWORD *)buf = *(_OWORD *)&a5->var0;
  *(_OWORD *)&buf[16] = v34;
  v41 = *(_QWORD *)&a5->var3;
  v35 = (CGImage *)objc_msgSend(a1, "newCroppedAndRescaledImageFromImage:constraints:targetPxSize:", v33, buf, v31, v32);
  if (v33)
    CFRelease(v33);
  if (((objc_msgSend(a1, "isAutoloopAsset:", v14) | v8) & 1) != 0)
    return v35;
  v36 = (CGImage *)objc_msgSend(a1, "newImageWithPlayButtonOverlay:scale:transferGUID:error:", v35, 0, a7, a5->var2);
  if (v35)
    CFRelease(v35);
  return v36;
}

+ (BOOL)writesToDisk
{
  return 1;
}

+ (id)generateAndPersistPreviewFromSourceURL:(id)a3 senderContext:(id)a4 balloonBundleID:(id)a5 withPreviewConstraints:(IMPreviewConstraints *)a6 outSize:(CGSize *)a7 error:(id *)a8
{
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  double var0;
  __int128 v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  _QWORD v27[12];
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  os_activity_scope_state_s state;
  __int128 buf;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[5];

  v47[2] = *MEMORY[0x1E0C80C00];
  v14 = _os_activity_create(&dword_19E239000, "com.apple.messages.AttachmentGeneratePreviewMovie", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v14, &state);

  if (!a3 || !a7 || !a8)
  {
    if (IMOSLoggingEnabled())
    {
      v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_19E239000, v24, OS_LOG_TYPE_INFO, "Invalid parameters", (uint8_t *)&buf, 2u);
      }
    }
LABEL_15:
    v19 = 0;
    goto LABEL_23;
  }
  v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
  if (IMOSLoggingEnabled())
  {
    v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_19E239000, v16, OS_LOG_TYPE_INFO, "Invoking BlastDoor for movie previews for GUID: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  v17 = (void *)MEMORY[0x1E0C99E98];
  v47[0] = objc_msgSend(IMSafeTemporaryDirectory(), "path");
  v47[1] = CFSTR("VideoPreview");
  v18 = (void *)objc_msgSend(v17, "fileURLWithPathComponents:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2));
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v18, 1, 0, 0);
  v19 = (void *)objc_msgSend((id)objc_msgSend(v18, "URLByAppendingPathComponent:isDirectory:", v15, 0), "URLByAppendingPathExtension:", CFSTR("ktx"));
  if (v19)
  {
    if (objc_msgSend(a1, "writesToDisk"))
    {
      v37 = 0;
      v38 = &v37;
      v39 = 0x2020000000;
      v40 = 0;
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v43 = 0x3010000000;
      v45 = 0;
      v46 = 0;
      v44 = &unk_19E3C9D87;
      v31 = 0;
      v32 = &v31;
      v33 = 0x3052000000;
      v34 = sub_19E24758C;
      v35 = sub_19E2474A0;
      v36 = 0;
      v20 = dispatch_group_create();
      dispatch_group_enter(v20);
      var0 = a6->var0;
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = sub_19E269064;
      v27[3] = &unk_1E3FB5368;
      v27[4] = v15;
      v27[5] = a4;
      v22 = *(_OWORD *)&a6->var1.height;
      v28 = *(_OWORD *)&a6->var0;
      v29 = v22;
      v30 = *(_QWORD *)&a6->var3;
      v27[10] = &buf;
      v27[11] = &v31;
      v27[6] = a1;
      v27[7] = v19;
      v27[8] = v20;
      v27[9] = &v37;
      +[IMAttachmentBlastdoor generateMoviePreview:senderContext:maxPxWidth:minThumbnailPxSize:scale:withCompletionBlock:](IMAttachmentBlastdoor, "generateMoviePreview:senderContext:maxPxWidth:minThumbnailPxSize:scale:withCompletionBlock:", a3, a4, v27, var0, a6->var1.width, a6->var1.height, a6->var2);
      dispatch_group_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
      v23 = (void *)v32[5];
      if (*((_BYTE *)v38 + 24))
      {
        if (!v23)
        {
          *a7 = *(CGSize *)(*((_QWORD *)&buf + 1) + 32);
LABEL_22:
          _Block_object_dispose(&v31, 8);
          _Block_object_dispose(&buf, 8);
          _Block_object_dispose(&v37, 8);
          goto LABEL_23;
        }
      }
      else if (!v23)
      {
        v19 = 0;
        goto LABEL_22;
      }
      v19 = 0;
      *a8 = v23;
      goto LABEL_22;
    }
    goto LABEL_15;
  }
  if (IMOSLoggingEnabled())
  {
    v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_19E239000, v25, OS_LOG_TYPE_INFO, "Failed to get a temporaryPreviewURL for GUID: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  v19 = 0;
  *a8 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 6, 0);
LABEL_23:
  os_activity_scope_leave(&state);
  return v19;
}

+ (id)_avAssetForURL:(id)a3
{
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!a3 || !objc_msgSend(a3, "isFileURL"))
    return 0;
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (void *)*MEMORY[0x1E0C8ADA0];
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "Asset string %@", (uint8_t *)&v9, 0xCu);
    }
  }
  v6 = IMAVURLAssetOptionsDefault();
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_19E239000, v7, OS_LOG_TYPE_INFO, "Options dictionary %@", (uint8_t *)&v9, 0xCu);
    }
  }
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B3C0]), "initWithURL:options:", a3, v6);
}

@end
