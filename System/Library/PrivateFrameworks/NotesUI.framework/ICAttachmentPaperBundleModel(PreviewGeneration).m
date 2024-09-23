@implementation ICAttachmentPaperBundleModel(PreviewGeneration)

- (uint64_t)generatePreviewsDuringCloudActivity
{
  return 0;
}

- (BOOL)needToGeneratePreviews
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _BOOL8 v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  objc_class *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  _BOOL4 v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if ((ICInternalSettingsIsPDFsInNotesEnabled() & 1) == 0)
  {
    v12 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[ICAttachmentPaperBundleModel(PreviewGeneration) needToGeneratePreviews].cold.3(v12, v13, v14, v15, v16, v17, v18, v19);
    goto LABEL_11;
  }
  if ((objc_msgSend((id)objc_opt_class(), "fallbackPDFGenerationEnabled") & 1) == 0)
  {
    v12 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[ICAttachmentPaperBundleModel(PreviewGeneration) needToGeneratePreviews].cold.2(v12, v20, v21, v22, v23, v24, v25, v26);
LABEL_11:
    v11 = 0;
    goto LABEL_12;
  }
  objc_msgSend(a1, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previewUpdateDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "previewUpdateDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "attachment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "modificationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "compare:", v9);
    v11 = v10 == -1;

    v12 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v37 = v10 == -1;
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "attachment");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "identifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "attachment");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "previewUpdateDate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "attachment");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "modificationDate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      v39 = v29;
      v40 = 2112;
      v41 = v30;
      v42 = 2112;
      v43 = v32;
      v44 = 1024;
      v45 = v37;
      v46 = 2112;
      v47 = v34;
      v48 = 2112;
      v49 = v36;
      _os_log_debug_impl(&dword_1AC7A1000, v12, OS_LOG_TYPE_DEBUG, "%@ %@ %@ return %d self.attachment.previewUpdateDate %@ self.attachment.modificationDate %@", buf, 0x3Au);

    }
  }
  else
  {
    v12 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[ICAttachmentPaperBundleModel(PreviewGeneration) needToGeneratePreviews].cold.1(a1, a2, v12);

    v11 = 1;
  }
LABEL_12:

  return v11;
}

+ (uint64_t)fallbackPDFGenerationEnabled
{
  void *v0;
  char v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "ic_isAppExtension");

  if ((v1 & 1) != 0)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "BOOLForKey:", *MEMORY[0x1E0D63710]) ^ 1;

  return v2;
}

- (uint64_t)generateFallbackPDFIfNecessary
{
  uint64_t result;

  result = objc_msgSend(a1, "needToGeneratePreviews");
  if ((_DWORD)result)
    return objc_msgSend(a1, "generateFallbackPDF");
  return result;
}

- (BOOL)generateFallbackPDF
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;
  NSObject *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  void *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  objc_msgSend(a1, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D63A18], "generateFallbackPDFDataForAttachment:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __70__ICAttachmentPaperBundleModel_PreviewGeneration__generateFallbackPDF__block_invoke;
    v8[3] = &unk_1E5C1DD50;
    v12 = &v13;
    v9 = v2;
    v10 = v4;
    v11 = a1;
    objc_msgSend(v3, "performBlockAndWait:", v8);
    v5 = *((_BYTE *)v14 + 24) != 0;

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v6 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ICAttachmentPaperBundleModel(PreviewGeneration) generateFallbackPDF].cold.1(v6);

    v5 = 0;
  }

  return v5;
}

- (uint64_t)generatePreviewsInOperation:()PreviewGeneration
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  _QWORD v12[7];
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  if (+[ICSystemPaperTextAttachment isEnabled](ICSystemPaperTextAttachment, "isEnabled"))
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__68;
    v19 = __Block_byref_object_dispose__68;
    v20 = 0;
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x3032000000;
    v13[3] = __Block_byref_object_copy__68;
    v13[4] = __Block_byref_object_dispose__68;
    v14 = 0;
    objc_msgSend(a1, "attachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __79__ICAttachmentPaperBundleModel_PreviewGeneration__generatePreviewsInOperation___block_invoke;
    v12[3] = &unk_1E5C1DA20;
    v12[4] = a1;
    v12[5] = &v15;
    v12[6] = v13;
    objc_msgSend(v6, "performBlockAndWait:", v12);

    if (v16[5]
      && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend((id)v16[5], "path"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v7, "fileExistsAtPath:", v8),
          v8,
          v7,
          v9))
    {
      v10 = objc_msgSend(a1, "generateFallbackPDF");
    }
    else
    {
      v10 = 0;
    }
    _Block_object_dispose(v13, 8);

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (uint64_t)generateImagePreviewsForAttachment:()PreviewGeneration withFallbackPDFData:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  void *v35;
  void *v37;
  _BOOL4 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD0DB8]), "initWithData:", v6);
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "pageAtIndex:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = v9 != 0;
      if (v9)
      {
        v37 = v8;
        v38 = v9 != 0;
        objc_msgSend(v9, "boundsForBox:", 1);
        v13 = v12;
        objc_msgSend(v5, "setSizeWidth:", v14);
        objc_msgSend(v5, "setSizeHeight:", v13);
        objc_msgSend(v5, "previewImages");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v15, "mutableCopy");

        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        +[ICPreviewDeviceContext sharedContext](ICPreviewDeviceContext, "sharedContext");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "deviceInfoScalable:", 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v44;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v44 != v21)
                objc_enumerationMutation(v18);
              v23 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
              objc_msgSend(v23, "imageSize");
              v25 = v24;
              objc_msgSend(v23, "imageSize");
              objc_msgSend(v10, "thumbnailOfSize:forBox:", 1, v25, v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              if (v27)
              {
                objc_msgSend(v23, "scale");
                objc_msgSend(v5, "updateAttachmentPreviewImageWithImage:scale:scaleWhenDrawing:metadata:sendNotification:", v27, 1, 0, 0);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "ic_removeNonNilObject:", v28);

              }
            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
          }
          while (v20);
        }

        if (objc_msgSend(v16, "count"))
        {
          objc_msgSend(v5, "removePreviewImages:", v16);
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v29 = v16;
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          if (v30)
          {
            v31 = v30;
            v32 = *(_QWORD *)v40;
            do
            {
              for (j = 0; j != v31; ++j)
              {
                if (*(_QWORD *)v40 != v32)
                  objc_enumerationMutation(v29);
                v34 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j);
                objc_msgSend(v5, "managedObjectContext");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "deleteObject:", v34);

              }
              v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
            }
            while (v31);
          }

        }
        v11 = v38;
        v8 = v37;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)needToGeneratePreviews
{
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, a1, a3, "PDF in Notes is disabled. Not generating previews.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)generateFallbackPDF
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AC7A1000, log, OS_LOG_TYPE_ERROR, "Not saving fallback PDF because the data was empty", v1, 2u);
  OUTLINED_FUNCTION_6();
}

@end
