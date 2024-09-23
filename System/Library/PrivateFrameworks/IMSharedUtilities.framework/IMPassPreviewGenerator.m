@implementation IMPassPreviewGenerator

+ (id)UTITypes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.pkpass");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)isSupported
{
  return 1;
}

+ (id)temporaryDirectory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E98];
  IMSafeTemporaryDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = CFSTR("PassPreview");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPathComponents:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, 0);

  return v6;
}

+ (BOOL)generatesPreview
{
  return 0;
}

+ (id)metadataExtension
{
  return CFSTR("plist");
}

+ (BOOL)generatesMetadata
{
  return 1;
}

+ (id)_dictionaryRepresentationForPassText:(id)a3
{
  id v4;
  __CFDictionary *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (__CFDictionary *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    CFDictionarySetValue(v5, CFSTR("text"), v6);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_19E36EBB4();
  }

  objc_msgSend(v4, "color");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_dictionaryRepresentationForColor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    CFDictionarySetValue(v5, CFSTR("color"), v8);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_19E36EB34();
  }

  return v5;
}

+ (id)_dictionaryRepresentationForColor:(id)a3
{
  id v3;
  __CFDictionary *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (__CFDictionary *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "red");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    CFDictionarySetValue(v4, CFSTR("red"), v6);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_19E36E184();
  }

  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "green");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    CFDictionarySetValue(v4, CFSTR("green"), v8);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_19E36E104();
  }

  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "blue");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    CFDictionarySetValue(v4, CFSTR("blue"), v10);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_19E36E084();
  }

  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "alpha");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    CFDictionarySetValue(v4, CFSTR("alpha"), v12);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_19E36E004();
  }

  return v4;
}

+ (id)generateAndPersistMetadataFromSourceURL:(id)a3 senderContext:(id)a4 withPreviewConstraints:(IMPreviewConstraints *)a5 error:(id *)a6
{
  id v10;
  id v11;
  NSObject *v12;
  __int128 v13;
  void *v14;
  void *v15;
  __CFDictionary *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  int v43;
  NSObject *v44;
  void *v45;
  id v46;
  int v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  os_activity_scope_state_s state;
  _BYTE buf[32];
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = _os_activity_create(&dword_19E239000, "com.apple.messages.AttachmentGeneratePreviewWallet", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  v13 = *(_OWORD *)&a5->var1.height;
  *(_OWORD *)buf = *(_OWORD *)&a5->var0;
  *(_OWORD *)&buf[16] = v13;
  v60 = *(_QWORD *)&a5->var3;
  v55 = v10;
  objc_msgSend(a1, "previewFromSourceURL:senderContext:withPreviewConstraints:error:", v10, v11, buf, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v56 = 0;
    goto LABEL_61;
  }
  objc_msgSend(a1, "temporaryDirectory");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "URLByAppendingPathComponent:isDirectory:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "URLByAppendingPathExtension:", CFSTR("plist"));
  v56 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (__CFDictionary *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "backgroundColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_dictionaryRepresentationForColor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    CFDictionarySetValue(v16, CFSTR("backgroundColor"), v18);

  NSSelectorFromString(CFSTR("background"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v14, "valueForKeyPath:", CFSTR("background.image.image"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dataUsingEncoding:error:", 0, 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (v20)
      CFDictionarySetValue(v16, CFSTR("backgroundImage"), v20);

  }
  objc_msgSend(v14, "primaryText");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v14, "primaryText");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_dictionaryRepresentationForPassText:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      CFDictionarySetValue(v16, CFSTR("primaryText"), v23);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      sub_19E36E204();
    }

  }
  objc_msgSend(v14, "secondaryText");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v14, "secondaryText");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_dictionaryRepresentationForPassText:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      CFDictionarySetValue(v16, CFSTR("secondaryText"), v26);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      sub_19E36ECB4();
    }

  }
  objc_msgSend(v14, "tertiaryText");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(v14, "tertiaryText");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_dictionaryRepresentationForPassText:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      CFDictionarySetValue(v16, CFSTR("tertiaryText"), v29);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      sub_19E36EC34();
    }

  }
  objc_msgSend(v14, "headerImage");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "image");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "dataUsingEncoding:error:", 0, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = v32;
  if (v33)
    CFDictionarySetValue(v16, CFSTR("image"), v33);

  objc_msgSend(v14, "icon");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "image");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "dataUsingEncoding:error:", 0, 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = v36;
  if (v37)
    CFDictionarySetValue(v16, CFSTR("icon"), v37);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v16;
      _os_log_impl(&dword_19E239000, v38, OS_LOG_TYPE_INFO, "Writing pass plist %p", buf, 0xCu);
    }

  }
  v57 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v16, 200, 0, &v57);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v57;
  v41 = v40;
  if (v39)
  {
    objc_msgSend(v56, "path");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v39, "writeToFile:atomically:", v42, 1);

    if (v43)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v56, "path");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v45;
          _os_log_impl(&dword_19E239000, v44, OS_LOG_TYPE_INFO, "Wrote down pass plist to %@", buf, 0xCu);

        }
      }
      v46 = 0;
      v47 = 1;
      goto LABEL_52;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v56, "path");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v50;
        _os_log_impl(&dword_19E239000, v49, OS_LOG_TYPE_INFO, "Couldn't write down pass plist to %@", buf, 0xCu);

      }
    }
    v46 = 0;
  }
  else
  {
    v46 = v40;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v46;
        _os_log_impl(&dword_19E239000, v48, OS_LOG_TYPE_INFO, "Failed making plist %@", buf, 0xCu);
      }

    }
  }
  v47 = 0;
LABEL_52:

  if (a6 && !v47 && v46)
    *a6 = objc_retainAutorelease(v46);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v56;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v46;
      _os_log_impl(&dword_19E239000, v51, OS_LOG_TYPE_INFO, "Generated metadata to %@ with error: %@", buf, 0x16u);
    }

  }
LABEL_61:

  os_activity_scope_leave(&state);
  return v56;
}

+ (id)previewFromSourceURL:(id)a3 senderContext:(id)a4 withPreviewConstraints:(IMPreviewConstraints *)a5 error:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  dispatch_time_t v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  _QWORD v31[4];
  NSObject *v32;
  __int128 *v33;
  __int128 *v34;
  uint8_t buf[4];
  int v36;
  __int16 v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  _QWORD v44[2];
  __int128 v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    *(_QWORD *)&v45 = 0;
    *((_QWORD *)&v45 + 1) = &v45;
    v46 = 0x3032000000;
    v47 = sub_19E2476FC;
    v48 = sub_19E247568;
    v49 = 0;
    v10 = (void *)MEMORY[0x1E0C99E98];
    IMSafeTemporaryDirectory();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v12;
    v44[1] = CFSTR("PassPreview");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fileURLWithPathComponents:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v14, 1, 0, 0);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URLByAppendingPathComponent:isDirectory:", v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "URLByAppendingPathExtension:", CFSTR("plist"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      *(_QWORD *)&v39 = 0;
      *((_QWORD *)&v39 + 1) = &v39;
      v40 = 0x3032000000;
      v41 = sub_19E2476FC;
      v42 = sub_19E247568;
      v43 = 0;
      v19 = dispatch_group_create();
      dispatch_group_enter(v19);
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = sub_19E30FA48;
      v31[3] = &unk_1E3FB8460;
      v33 = &v39;
      v34 = &v45;
      v20 = v19;
      v32 = v20;
      +[IMAttachmentBlastdoor generatePassPreview:senderContext:withCompletionBlock:](IMAttachmentBlastdoor, "generatePassPreview:senderContext:withCompletionBlock:", v8, v9, v31);
      v21 = dispatch_time(0, 5000000000);
      if (dispatch_group_wait(v20, v21))
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19E239000, v22, OS_LOG_TYPE_INFO, "Blastdoor validation timed out", buf, 2u);
          }

        }
        if (a6)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 12, 0);
          v23 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v23 = 0;
        }
      }
      else
      {
        if (a6)
        {
          v27 = *(void **)(*((_QWORD *)&v45 + 1) + 40);
          if (v27)
            *a6 = objc_retainAutorelease(v27);
        }
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            v29 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 40);
            *(_DWORD *)buf = 67109378;
            v36 = 0;
            v37 = 2112;
            v38 = v29;
            _os_log_impl(&dword_19E239000, v28, OS_LOG_TYPE_INFO, "Blastdoor validation completed, result: %d, err: %@", buf, 0x12u);
          }

        }
        v23 = *(id *)(*((_QWORD *)&v39 + 1) + 40);
      }

      _Block_object_dispose(&v39, 8);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          LODWORD(v39) = 138412290;
          *(_QWORD *)((char *)&v39 + 4) = v16;
          _os_log_impl(&dword_19E239000, v26, OS_LOG_TYPE_INFO, "Failed to get a temporaryPreviewURL %@", (uint8_t *)&v39, 0xCu);
        }

      }
      if (a6)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 12, 0);
        v23 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23 = 0;
      }
    }

    _Block_object_dispose(&v45, 8);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        LODWORD(v45) = 138412290;
        *(_QWORD *)((char *)&v45 + 4) = objc_opt_class();
        v25 = *(id *)((char *)&v45 + 4);
        _os_log_impl(&dword_19E239000, v24, OS_LOG_TYPE_INFO, "%@ - sourceURL is nil", (uint8_t *)&v45, 0xCu);

      }
    }
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 5, 0);
      v23 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
  }

  return v23;
}

@end
