@implementation IMWatchfacePreviewGenerator

+ (BOOL)_isAvailable
{
  return 1;
}

+ (id)UTITypes
{
  if (objc_msgSend(a1, "_isAvailable"))
    return &unk_1E3FFEE28;
  else
    return (id)MEMORY[0x1E0C9AA60];
}

+ (BOOL)writesToDisk
{
  int v2;
  NSObject *v3;
  const __CFString *v4;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "_isAvailable");
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = CFSTR("NO");
      if (v2)
        v4 = CFSTR("YES");
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_19E239000, v3, OS_LOG_TYPE_INFO, "Blastdoor support available for watchfacePreviews: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  return v2;
}

+ (Class)greenfieldUtilitiesClass
{
  if (qword_1EE503DF8 != -1)
    dispatch_once(&qword_1EE503DF8, &unk_1E3FB33C8);
  return (Class)(id)qword_1EE503DF0;
}

+ (BOOL)decorateWatchfacePreview:(id)a3 andWriteToURL:(id)a4 imagePxSize:(CGSize *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  *a5 = *(CGSize *)MEMORY[0x1E0C9D820];
  MEMORY[0x1A1AE7D4C](CFSTR("BlastDoorWatchfacePreview"), CFSTR("BlastDoor"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;
  objc_msgSend(v10, "image");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "cgImage");

  if (v12)
  {
    v18 = 0;
    v13 = +[IMImageUtilities persistPreviewToDiskCache:previewURL:error:](IMImageUtilities, "persistPreviewToDiskCache:previewURL:error:", v12, v8, &v18);
    v14 = v18;
    if (!v13 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v20 = v8;
        v21 = 2112;
        v22 = v14;
        _os_log_impl(&dword_19E239000, v15, OS_LOG_TYPE_INFO, "IMWatchfacePreviewGenerator - Failed to write decorated image to URL %@: %@", buf, 0x16u);
      }

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v16, OS_LOG_TYPE_INFO, "IMWatchfacePreviewGenerator - Failed to get image from BlastDoor image", buf, 2u);
      }

    }
    v13 = 0;
  }

  return v13;
}

+ (id)generateAndPersistPreviewFromSourceURL:(id)a3 senderContext:(id)a4 balloonBundleID:(id)a5 withPreviewConstraints:(IMPreviewConstraints *)a6 outSize:(CGSize *)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  double var0;
  double var2;
  id v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  id *v37;
  _QWORD v39[4];
  id v40;
  NSObject *v41;
  uint64_t *v42;
  __int128 *p_buf;
  uint64_t *v44;
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  char v55;
  os_activity_scope_state_s state;
  __int128 buf;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD v62[4];

  v62[2] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = _os_activity_create(&dword_19E239000, "com.apple.messages.AttachmentGeneratePreviewWatchFace", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v16, &state);
  if (v13 && a7 && a8)
  {
    v37 = a8;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_19E239000, v17, OS_LOG_TYPE_INFO, "Invoking Blastdoor for image", (uint8_t *)&buf, 2u);
      }

    }
    v18 = (void *)MEMORY[0x1E0C99E98];
    IMSafeTemporaryDirectory();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v20;
    v62[1] = CFSTR("ImagePreview");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fileURLWithPathComponents:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v22, 1, 0, 0);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "URLByAppendingPathComponent:isDirectory:", v24, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "URLByAppendingPathExtension:", CFSTR("ktx"));
    v26 = (id)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      if (objc_msgSend(a1, "_isAvailable"))
      {
        v52 = 0;
        v53 = &v52;
        v54 = 0x2020000000;
        v55 = 0;
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v58 = 0x3010000000;
        v60 = 0;
        v61 = 0;
        v59 = &unk_19E3C9D87;
        v46 = 0;
        v47 = &v46;
        v48 = 0x3032000000;
        v49 = sub_19E2475BC;
        v50 = sub_19E2474BC;
        v51 = 0;
        v27 = dispatch_group_create();
        dispatch_group_enter(v27);
        var0 = a6->var0;
        var2 = a6->var2;
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = sub_19E270FB8;
        v39[3] = &unk_1E3FB55D8;
        v42 = &v52;
        v45 = a1;
        v30 = v26;
        v40 = v30;
        p_buf = &buf;
        v44 = &v46;
        v31 = v27;
        v41 = v31;
        +[IMAttachmentBlastdoor generatePreview:senderContext:maxPxWidth:scale:withCompletionBlock:](IMAttachmentBlastdoor, "generatePreview:senderContext:maxPxWidth:scale:withCompletionBlock:", v13, v14, v39, var0, var2);
        dispatch_group_wait(v31, 0xFFFFFFFFFFFFFFFFLL);
        if (*((_BYTE *)v53 + 24) && !v47[5])
        {
          *a7 = *(CGSize *)(*((_QWORD *)&buf + 1) + 32);
        }
        else
        {

          v32 = (void *)v47[5];
          v30 = 0;
          if (v32)
            *v37 = objc_retainAutorelease(v32);
        }
        v26 = v30;

        _Block_object_dispose(&v46, 8);
        _Block_object_dispose(&buf, 8);
        _Block_object_dispose(&v52, 8);
        v34 = v26;
      }
      else
      {
        v34 = 0;
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v24;
          _os_log_impl(&dword_19E239000, v35, OS_LOG_TYPE_INFO, "Failed to get a temporaryPreviewURL %@", (uint8_t *)&buf, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 12, 0);
      v26 = 0;
      v34 = 0;
      *v37 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_19E239000, v33, OS_LOG_TYPE_INFO, "Invalid parameters", (uint8_t *)&buf, 2u);
      }

    }
    v34 = 0;
  }
  os_activity_scope_leave(&state);

  return v34;
}

@end
