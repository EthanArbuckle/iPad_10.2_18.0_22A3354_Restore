@implementation ICAttachmentWebModel(PreviewGeneration)

- (uint64_t)needToGeneratePreviews
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hasSynapseLink") & 1) != 0)
  {
    objc_msgSend(a1, "attachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "previewUpdateDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      return 0;
  }
  else
  {

  }
  objc_msgSend(a1, "attachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "ic_isWebURL") && (objc_msgSend(a1, "isGeneratingPreviews") & 1) == 0)
  {
    objc_msgSend(a1, "attachment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "wasCreatedByCurrentUser"))
    {
      objc_msgSend(a1, "attachment");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "metadataExists"))
      {
        objc_msgSend(a1, "attachment");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "previewUpdateDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(a1, "attachment");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = objc_msgSend(v14, "hasMetadata") ^ 1;

        }
        else
        {
          v7 = 1;
        }

      }
      else
      {
        v7 = 1;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  v15 = os_log_create("com.apple.notes", "PreviewGeneration");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "attachment");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "attachment");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "previewUpdateDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "attachment");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138413570;
    v26 = v18;
    v27 = 2112;
    v28 = v19;
    v29 = 2112;
    v30 = v21;
    v31 = 1024;
    v32 = v7;
    v33 = 2112;
    v34 = v23;
    v35 = 1024;
    v36 = objc_msgSend(v24, "hasMetadata");
    _os_log_debug_impl(&dword_1AC7A1000, v15, OS_LOG_TYPE_DEBUG, "%@ %@ %@ return %d self.attachment.previewUpdateDate %@ has self.attachment.metadataData %d", (uint8_t *)&v25, 0x36u);

  }
  return v7;
}

- (uint64_t)generateAsynchronousPreviews
{
  return 1;
}

- (uint64_t)generatePreviewsInOperation:()PreviewGeneration
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  id v28[2];
  id location;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  _QWORD v51[4];
  id v52;

  v5 = a3;
  if (objc_msgSend(a1, "isGeneratingPreviews"))
  {
    v6 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[ICAttachmentWebModel(PreviewGeneration) generatePreviewsInOperation:].cold.1(v6);

    v7 = 0;
    goto LABEL_15;
  }
  objc_msgSend(a1, "setGeneratingPreviews:", 1);
  v50 = 0;
  v51[0] = &v50;
  v51[1] = 0x3032000000;
  v51[2] = __Block_byref_object_copy__44;
  v51[3] = __Block_byref_object_dispose__44;
  v52 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__44;
  v48 = __Block_byref_object_dispose__44;
  v49 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__44;
  v34 = __Block_byref_object_dispose__44;
  v35 = 0;
  objc_initWeak(&location, a1);
  objc_msgSend(a1, "attachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __71__ICAttachmentWebModel_PreviewGeneration__generatePreviewsInOperation___block_invoke;
  v22 = &unk_1E5C21190;
  objc_copyWeak(v28, &location);
  v23 = &v50;
  v24 = &v44;
  v25 = &v30;
  v26 = &v40;
  v28[1] = a2;
  v27 = &v36;
  objc_msgSend(v9, "performBlockAndWait:", &v19);

  if (*((_BYTE *)v41 + 24))
  {
    v10 = objc_msgSend(a1, "downloadPreviewForAttachmentURL:", v45[5], v19, v20, v21, v22);
  }
  else if (*((_BYTE *)v37 + 24))
  {
    v10 = objc_msgSend(a1, "updateAttachmentPreviewImagesMetadata", v19, v20, v21, v22);
  }
  else
  {
    if (!v31[5])
    {
      v7 = 0;
      goto LABEL_12;
    }
    v10 = objc_msgSend(a1, "extractPreviewImagesFromSynapseData:", v19, v20, v21, v22);
  }
  v7 = v10;
LABEL_12:
  v11 = os_log_create("com.apple.notes", "PreviewGeneration");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[ICAttachmentWebModel(PreviewGeneration) generatePreviewsInOperation:].cold.2((uint64_t)v51, v11, v12, v13, v14, v15, v16, v17);

  objc_msgSend(a1, "setGeneratingPreviews:", 0);
  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(&v50, 8);
LABEL_15:

  return v7;
}

- (uint64_t)extractPreviewImagesFromSynapseData:()PreviewGeneration
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[5];
  id v10;
  id location;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  objc_initWeak(&location, a1);
  objc_msgSend(a1, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__ICAttachmentWebModel_PreviewGeneration__extractPreviewImagesFromSynapseData___block_invoke;
  v9[3] = &unk_1E5C1F7C0;
  objc_copyWeak(&v10, &location);
  v9[4] = &v12;
  objc_msgSend(v6, "performBlockAndWait:", v9);

  v7 = *((unsigned __int8 *)v13 + 24);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (uint64_t)downloadPreviewForAttachmentURL:()PreviewGeneration
{
  id v4;
  dispatch_semaphore_t v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  void *v12;
  dispatch_semaphore_t v13;
  uint64_t *v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  id location;

  v4 = a3;
  v5 = dispatch_semaphore_create(0);
  objc_initWeak(&location, a1);
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__ICAttachmentWebModel_PreviewGeneration__downloadPreviewForAttachmentURL___block_invoke;
  v10[3] = &unk_1E5C211E0;
  v11 = v4;
  v6 = v4;
  objc_copyWeak(&v15, &location);
  v13 = v5;
  v14 = &v16;
  v12 = a1;
  v7 = v5;
  dispatch_sync(MEMORY[0x1E0C80D38], v10);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v8 = *((unsigned __int8 *)v17 + 24);

  objc_destroyWeak(&v15);
  _Block_object_dispose(&v16, 8);
  objc_destroyWeak(&location);
  return v8;
}

- (uint64_t)updateAttachmentPreviewImagesMetadata
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  objc_msgSend(a1, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__ICAttachmentWebModel_PreviewGeneration__updateAttachmentPreviewImagesMetadata__block_invoke;
  v6[3] = &unk_1E5C20078;
  v6[4] = a1;
  v6[5] = &v7;
  objc_msgSend(v3, "performBlockAndWait:", v6);

  v4 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)updateTitle:()PreviewGeneration andDescription:
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;

  v7 = a3;
  v8 = a4;
  objc_msgSend(a1, "attachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isValidObject"))
  {
LABEL_10:

    goto LABEL_11;
  }
  v10 = objc_msgSend(a1, "previewGenerationOperationCancelled");

  if ((v10 & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "attachment");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ %@ %@"), v13, v14, v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[ICAttachmentWebModel(PreviewGeneration) updateTitle:andDescription:].cold.1(a2, (uint64_t)v9, v17);

    if (objc_msgSend(v7, "length"))
    {
      objc_msgSend(a1, "attachment");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "title");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", v7);

      if ((v20 & 1) == 0)
      {
        objc_msgSend(a1, "attachment");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setTitle:", v7);

      }
    }
    objc_msgSend(a1, "attachment");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "summary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "length");

    if (!v24)
    {
      objc_msgSend(a1, "attachment");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setSummary:", v8);

    }
    goto LABEL_10;
  }
LABEL_11:

}

- (void)saveImagesFromLinkMetadata:()PreviewGeneration
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  objc_msgSend(v17, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v17, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "platformImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "size");
    v9 = v8 <= 192.0 && v7 <= 192.0;
    goto LABEL_7;
  }
  objc_msgSend(v17, "icon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v17, "icon");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "platformImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 1;
LABEL_7:
    objc_msgSend(a1, "updateAttachmentWithPreviewImage:", v6);

    goto LABEL_8;
  }
  v9 = 1;
LABEL_8:
  objc_msgSend(a1, "attachment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "metadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
    v12 = (void *)MEMORY[0x1E0C9AA70];
  v14 = (void *)objc_msgSend(v12, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v15, *MEMORY[0x1E0D63630]);

  objc_msgSend(a1, "attachment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setMetadata:", v14);

}

- (void)updateAttachmentWithPreviewImage:()PreviewGeneration
{
  double v4;
  double v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "scale");
  v5 = v4;
  objc_msgSend(a1, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "updateAttachmentPreviewImageWithImage:scale:scaleWhenDrawing:metadata:sendNotification:", v10, 1, 0, 0, v5);

  objc_msgSend(a1, "attachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateChangeCountWithReason:", CFSTR("Updated preview images with image"));

  objc_msgSend(a1, "attachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ic_postNotificationOnMainThreadWithName:", *MEMORY[0x1E0D63660]);

}

- (void)generatePreviewsInOperation:()PreviewGeneration .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1AC7A1000, log, OS_LOG_TYPE_DEBUG, "Preview generation has already been requested. Stopping", v1, 2u);
}

- (void)generatePreviewsInOperation:()PreviewGeneration .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1AC7A1000, a2, a3, "%@ completed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)updateTitle:()PreviewGeneration andDescription:.cold.1(const char *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_debug_impl(&dword_1AC7A1000, a3, OS_LOG_TYPE_DEBUG, "%@ %@", (uint8_t *)&v6, 0x16u);

}

@end
