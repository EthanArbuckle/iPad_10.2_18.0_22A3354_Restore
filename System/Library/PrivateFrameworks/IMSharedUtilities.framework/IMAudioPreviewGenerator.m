@implementation IMAudioPreviewGenerator

+ (id)UTITypes
{
  uint64_t v2;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0C8A2B8];
  v4[0] = *MEMORY[0x1E0C8A298];
  v4[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)generatesPreview
{
  return 0;
}

+ (id)metadataExtension
{
  return CFSTR("plist");
}

+ (BOOL)writesToDisk
{
  return 1;
}

+ (BOOL)generatesMetadata
{
  return 1;
}

+ (id)generateAndPersistMetadataFromSourceURL:(id)a3 senderContext:(id)a4 withPreviewConstraints:(IMPreviewConstraints *)a5 error:(id *)a6
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  void *v28;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v31;
  _QWORD v32[4];

  v32[3] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = _os_activity_create(&dword_19E239000, "com.apple.messages.AttachmentGeneratePreviewAudioMessage", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  objc_msgSend(a1, "audioMedataForFileURL:senderContext:", v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
    goto LABEL_21;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0C99E98];
  IMSafeTemporaryDirectory();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v15;
  v32[1] = CFSTR("AudioPreviewMetadata");
  v32[2] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fileURLWithPathComponents:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "URLByAppendingPathComponent:isDirectory:", CFSTR("Audio-Metadata"), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "metadataExtension");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "URLByAppendingPathExtension:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v17, 1, 0, a6);

      if (v22 && objc_msgSend(v12, "writeToURL:error:", v20, a6))
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v31 = v20;
            _os_log_impl(&dword_19E239000, v23, OS_LOG_TYPE_INFO, "Successfully persisted audioMetadata plist at %@", buf, 0xCu);
          }

        }
        goto LABEL_26;
      }
      goto LABEL_20;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v28;
        _os_log_impl(&dword_19E239000, v24, OS_LOG_TYPE_INFO, "Failed to generate temporaryPreviewMetadataDirectoryURL from transferGUID %@", buf, 0xCu);
      }

    }
    if (v20)
      goto LABEL_20;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v28;
      _os_log_impl(&dword_19E239000, v25, OS_LOG_TYPE_INFO, "Failed to generate temporaryMetadataURL from transferGUID %@", buf, 0xCu);
    }

  }
LABEL_20:

LABEL_21:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19E239000, v26, OS_LOG_TYPE_INFO, "Failed to generated audioMetadata plist", buf, 2u);
    }

  }
  v20 = 0;
LABEL_26:

  os_activity_scope_leave(&state);
  return v20;
}

+ (id)audioMedataForFileURL:(id)a3 senderContext:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  unint64_t i;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint8_t v29[8];
  _QWORD v30[4];
  NSObject *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _QWORD v39[2];
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_19E24767C;
  v37 = sub_19E247524;
  v38 = 0;
  v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = sub_19E2E13F4;
  v30[3] = &unk_1E3FB5588;
  v32 = &v33;
  v8 = v7;
  v31 = v8;
  +[IMAttachmentBlastdoor generateAudioPreview:senderContext:withCompletionBlock:](IMAttachmentBlastdoor, "generateAudioPreview:senderContext:withCompletionBlock:", v5, v6, v30);
  v9 = dispatch_time(0, 100000000000);
  if (dispatch_group_wait(v8, v9) && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, "Timed out waiting for BlastDoor.", v29, 2u);
    }

  }
  if (v34[5])
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v29 = 0;
        _os_log_impl(&dword_19E239000, v11, OS_LOG_TYPE_INFO, "Received audioPreviewResult from BlastDoor!", v29, 2u);
      }

    }
    MEMORY[0x1A1AE7D4C](CFSTR("BlastDoorPreviewAudio"), CFSTR("BlastDoor"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = (void *)v34[5];
    else
      v12 = 0;
    v15 = v12;
    v16 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v15, "powerLevels");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithCapacity:", objc_msgSend(v17, "count"));

    if (v18)
    {
      for (i = 0; ; ++i)
      {
        objc_msgSend(v15, "powerLevels");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = i < objc_msgSend(v20, "count");

        if (!v21)
          break;
        v22 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v15, "powerLevels");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectAtIndexedSubscript:", i);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "floatValue");
        objc_msgSend(v22, "numberWithFloat:");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v25);

      }
    }
    v39[0] = CFSTR("duration");
    v26 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v15, "duration");
    objc_msgSend(v26, "numberWithDouble:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = CFSTR("powerLevels");
    v40[0] = v27;
    v40[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v29 = 0;
        _os_log_impl(&dword_19E239000, v13, OS_LOG_TYPE_INFO, "IMAudioPreviewGenerator - BlastDoor returned null audioPreviewResult!", v29, 2u);
      }

    }
    v14 = 0;
  }

  _Block_object_dispose(&v33, 8);
  return v14;
}

@end
