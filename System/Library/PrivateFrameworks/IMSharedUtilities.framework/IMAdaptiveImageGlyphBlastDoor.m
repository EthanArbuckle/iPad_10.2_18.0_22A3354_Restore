@implementation IMAdaptiveImageGlyphBlastDoor

+ (id)logger
{
  if (qword_1ECFC7238 != -1)
    dispatch_once(&qword_1ECFC7238, &unk_1E3FB33A8);
  return (id)qword_1ECFC7228;
}

+ (id)generateEmojiImageAssetFromSourceURL:(id)a3 senderContext:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_time_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  NSObject *v23;
  __int128 v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  dispatch_time_t v29;
  intptr_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v48;
  __CFString *v49;
  uint64_t v50;
  void *v51;
  _QWORD v52[4];
  NSObject *v53;
  NSObject *v54;
  _QWORD v55[4];
  NSObject *v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint8_t buf[4];
  uint64_t v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
  objc_msgSend(v7, "startTimingForKey:", CFSTR("IMAdaptiveImageGlyphBlastDoor_PreviewGenerationTime"));
  objc_msgSend(v7, "startTimingForKey:", CFSTR("IMAdaptiveImageGlyphBlastDoor_PreviewGenerationTime_MetadataOnly"));
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = sub_19E2475AC;
  v62 = sub_19E2474B4;
  v63 = 0;
  v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = sub_19E270474;
  v55[3] = &unk_1E3FB5588;
  v57 = &v58;
  v9 = v8;
  v56 = v9;
  +[IMAttachmentBlastdoor getMetadataForEmojiImageWithFileURL:senderContext:maxStrikeCount:withCompletionBlock:](IMAttachmentBlastdoor, "getMetadataForEmojiImageWithFileURL:senderContext:maxStrikeCount:withCompletionBlock:", v5, v6, 20, v55);
  v10 = dispatch_time(0, 1000000000);
  v51 = v7;
  if (dispatch_group_wait(v9, v10))
  {
    +[IMAdaptiveImageGlyphBlastDoor logger](IMAdaptiveImageGlyphBlastDoor, "logger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_19E36C088(v11, v12, v13, v14, v15, v16, v17, v18);
LABEL_4:
    v19 = 0;
    goto LABEL_27;
  }
  if (!v59[5])
  {
    +[IMAdaptiveImageGlyphBlastDoor logger](IMAdaptiveImageGlyphBlastDoor, "logger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_19E36C028(v11, v32, v33, v34, v35, v36, v37, v38);
    goto LABEL_4;
  }
  objc_msgSend(v7, "stopTimingForKey:", CFSTR("IMAdaptiveImageGlyphBlastDoor_PreviewGenerationTime_MetadataOnly"));
  v50 = objc_msgSend((id)v59[5], "imageStrikeCount");
  objc_msgSend((id)v59[5], "contentIdentifier");
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v59[5], "shortDescription");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  v22 = CFSTR("Emoji");
  if (v20)
    v22 = (__CFString *)v20;
  v49 = v22;

  if (-[NSObject length](v11, "length"))
  {
    v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v50)
    {
      v25 = 0;
      *(_QWORD *)&v24 = 134217984;
      v48 = v24;
      while (1)
      {
        v26 = dispatch_group_create();
        dispatch_group_enter(v26);
        v52[0] = MEMORY[0x1E0C809B0];
        v52[1] = 3221225472;
        v52[2] = sub_19E2704F4;
        v52[3] = &unk_1E3FB55B0;
        v27 = v23;
        v53 = v27;
        v28 = v26;
        v54 = v28;
        +[IMAttachmentBlastdoor generateEmojiImagePreview:senderContext:frameIndex:maxPixelDimension:withCompletionBlock:](IMAttachmentBlastdoor, "generateEmojiImagePreview:senderContext:frameIndex:maxPixelDimension:withCompletionBlock:", v5, v6, v25, v52, 1025.0);
        v29 = dispatch_time(0, 5000000000);
        v30 = dispatch_group_wait(v28, v29);
        if (v30)
        {
          +[IMAdaptiveImageGlyphBlastDoor logger](IMAdaptiveImageGlyphBlastDoor, "logger");
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v48;
            v65 = v25;
            _os_log_error_impl(&dword_19E239000, v31, OS_LOG_TYPE_ERROR, "Timed out generating frame %ld", buf, 0xCu);
          }
        }
        else
        {
          +[IMAdaptiveImageGlyphBlastDoor logger](IMAdaptiveImageGlyphBlastDoor, "logger");
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v48;
            v65 = v25;
            _os_log_debug_impl(&dword_19E239000, v31, OS_LOG_TYPE_DEBUG, "Succesfully generated frame %ld.", buf, 0xCu);
          }
        }

        if (v30)
          break;
        if (v50 == ++v25)
          goto LABEL_21;
      }
      v19 = 0;
      v23 = v27;
    }
    else
    {
LABEL_21:
      v39 = -[NSObject copy](v23, "copy", v48);
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA218]), "initWithContentIdentifier:shortDescription:strikeImages:", v11, v49, v39);

    }
  }
  else
  {
    +[IMAdaptiveImageGlyphBlastDoor logger](IMAdaptiveImageGlyphBlastDoor, "logger");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_19E36C058(v23, v40, v41, v42, v43, v44, v45, v46);
    v19 = 0;
  }

LABEL_27:
  _Block_object_dispose(&v58, 8);

  return v19;
}

@end
