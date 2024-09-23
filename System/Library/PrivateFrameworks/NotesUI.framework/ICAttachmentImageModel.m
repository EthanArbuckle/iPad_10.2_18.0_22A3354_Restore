@implementation ICAttachmentImageModel

void __72__ICAttachmentImageModel_PreviewGeneration__needToPostProcessAttachment__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  int v8;
  char v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  _BOOL4 v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  _BOOL4 v37;
  __int16 v38;
  _BOOL4 v39;
  __int16 v40;
  _BOOL4 v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (+[ICAttachmentPreviewGenerator imageOCRGenerationEnabled](ICAttachmentPreviewGenerator, "imageOCRGenerationEnabled"))
  {
    v2 = 1;
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isChildOfDocumentGallery"))
  {
    v2 = +[ICAttachmentPreviewGenerator docCamOCRGenerationEnabled](ICAttachmentPreviewGenerator, "docCamOCRGenerationEnabled");
  }
  else
  {
    v2 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "previewImages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    v10 = 0;
    LOBYTE(v2) = 0;
    goto LABEL_21;
  }
  objc_msgSend(*(id *)(a1 + 32), "ocrSummary");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = objc_msgSend(*(id *)(a1 + 32), "ocrSummaryVersion");
    v8 = (__int16)*MEMORY[0x1E0D635D8];

    if (v7 < v8)
      v9 = v2;
    else
      v9 = 0;
    if ((v9 & 1) == 0)
    {
      LOBYTE(v2) = 0;
      goto LABEL_16;
    }
  }
  else if (!v2)
  {
    goto LABEL_16;
  }
  objc_msgSend(*(id *)(a1 + 32), "attachmentModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v11, "supportsOCR");

LABEL_16:
  objc_msgSend(*(id *)(a1 + 32), "imageClassificationSummary");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12
    && (v13 = (void *)v12,
        v14 = objc_msgSend(*(id *)(a1 + 32), "imageClassificationSummaryVersion"),
        v15 = (__int16)*MEMORY[0x1E0D635D0],
        v13,
        v14 >= v15)
    || !+[ICAttachmentPreviewGenerator imageClassificationEnabled](ICAttachmentPreviewGenerator, "imageClassificationEnabled"))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "attachmentModel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v16, "supportsImageClassification");

  }
LABEL_21:
  objc_msgSend(*(id *)(a1 + 32), "attachmentModel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "requiresPostProcessing"))
    v18 = v2 | v10;
  else
    v18 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v18;

  v19 = os_log_create("com.apple.notes", "PreviewGeneration");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v20 = v4 != 0;
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 32), "ocrSummary");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "imageClassificationSummary");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138413826;
    v29 = v22;
    v30 = 2112;
    v31 = v23;
    v32 = 2112;
    v33 = v24;
    v34 = 1024;
    v35 = v25;
    v36 = 1024;
    v37 = v26 != 0;
    v38 = 1024;
    v39 = v27 != 0;
    v40 = 1024;
    v41 = v20;
    _os_log_debug_impl(&dword_1AC7A1000, v19, OS_LOG_TYPE_DEBUG, "%@ %@ %@ return %d ocrSummary %d imageClassificationSummary %d hasPreviewImage %d", (uint8_t *)&v28, 0x38u);

  }
}

void __214__ICAttachmentImageModel_PreviewGeneration__generateFullSizePreviewWithAttachmentIdentifier_existingPreviewImage_markupModelData_imageOrientation_imageFilterType_mediaDecryptedData_mediaURL_mediaSize_croppingQuad___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  NSObject *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  void *v20;
  __int16 v21;
  double v22;
  __int16 v23;
  double v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sizeWidth");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeHeight");
  v7 = v6;

  if (*(double *)(a1 + 40) != v4 || *(double *)(a1 + 48) != v7)
  {
    v9 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "attachment");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "shortLoggingDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(a1 + 40);
      v18 = *(_QWORD *)(a1 + 48);
      v19 = 138413314;
      v20 = v16;
      v21 = 2048;
      v22 = v4;
      v23 = 2048;
      v24 = v7;
      v25 = 2048;
      v26 = v17;
      v27 = 2048;
      v28 = v18;
      _os_log_debug_impl(&dword_1AC7A1000, v9, OS_LOG_TYPE_DEBUG, "Corrected cropped image size for %@ (%g %g => %g %g)", (uint8_t *)&v19, 0x34u);

    }
    v10 = *(double *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSizeWidth:", v10);

    v12 = *(double *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSizeHeight:", v12);

    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "updateChangeCountWithReason:", CFSTR("Generated full-size previews"));

  }
}

void __214__ICAttachmentImageModel_PreviewGeneration__generateFullSizePreviewWithAttachmentIdentifier_existingPreviewImage_markupModelData_imageOrientation_imageFilterType_mediaDecryptedData_mediaURL_mediaSize_croppingQuad___block_invoke_40(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateAttachmentPreviewImageWithImageSrc:maxDimension:scale:appearanceType:scaleWhenDrawing:metadata:sendNotification:", *(_QWORD *)(a1 + 48), 0, 0, 0, 0, *(double *)(a1 + 56), 1.0);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v4;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "removeObject:", v4);
    v3 = v4;
  }

}

void __73__ICAttachmentImageModel_PreviewGeneration__generatePreviewsInOperation___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (objc_msgSend(*(id *)(a1 + 32), "needToGeneratePreviews"))
  {
    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parentAttachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attachmentModel");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v11, "imageFilterType");

    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = (int)objc_msgSend(v12, "orientation");

    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "media");
    v42 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v42, "identifier");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    if (objc_msgSend(v42, "isPasswordProtected"))
    {
      objc_msgSend(v42, "decryptedData");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 80);
    }
    else
    {
      objc_msgSend(v42, "mediaURL");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 88);
    }
    v19 = *(_QWORD *)(v18 + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v17;

    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "previewImages");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "mutableCopy");
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    v25 = *(void **)(v24 + 40);
    *(_QWORD *)(v24 + 40) = v23;

    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "markupModelData");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
    v29 = *(void **)(v28 + 40);
    *(_QWORD *)(v28 + 40) = v27;

    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "attachmentModel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = objc_msgSend(v31, "needsFullSizePreview");

    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "sizeWidth");
    v34 = v33;
    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "sizeHeight");
    v36 = *(_QWORD *)(*(_QWORD *)(a1 + 120) + 8);
    *(_QWORD *)(v36 + 32) = v34;
    *(_QWORD *)(v36 + 40) = v37;

    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "croppingQuad");
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = *(_QWORD *)(*(_QWORD *)(a1 + 128) + 8);
    v41 = *(void **)(v40 + 40);
    *(_QWORD *)(v40 + 40) = v39;

  }
}

void __73__ICAttachmentImageModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_41(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "scale");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 40), "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateAttachmentPreviewImageWithImageSrc:maxDimension:scale:appearanceType:scaleWhenDrawing:metadata:sendNotification:", *(_QWORD *)(a1 + 80), 0, 1, 0, 0, *(double *)(a1 + 88), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) |= objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)+ 40), "containsObject:", v5);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "removeObject:", v5);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    v6 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 96));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      v11 = *(_QWORD *)(a1 + 88);
      v12 = 138413314;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      v16 = 2112;
      v17 = v10;
      v18 = 2048;
      v19 = v11;
      v20 = 2048;
      v21 = v3;
      _os_log_debug_impl(&dword_1AC7A1000, v6, OS_LOG_TYPE_DEBUG, "%@ %@ %@ preview generation failed for size: %.1f, scale %.1f", (uint8_t *)&v12, 0x34u);

    }
  }

}

void __73__ICAttachmentImageModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_42(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removePreviewImages:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v3 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v15;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v15 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7);
          objc_msgSend(*(id *)(a1 + 32), "attachment", (_QWORD)v14);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "managedObjectContext");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "deleteObject:", v8);

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v5);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "isCancelled", (_QWORD)v14) & 1) == 0)
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "attachment");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPreviewUpdateDate:", v11);

      objc_msgSend(*(id *)(a1 + 32), "attachment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "updateChangeCountWithReason:", CFSTR("Generated previews"));

    }
  }
}

void __68__ICAttachmentImageModel_PreviewGeneration__generateOCRInOperation___block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  char v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  id v27;

  v2 = (void *)MEMORY[0x1AF445E78]();
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = (id *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 40), "sizeWidth");
    objc_msgSend(*(id *)(a1 + 40), "sizeHeight");
    TSDShrinkSizeToFitInSize();
    v5 = v4;
    v7 = v6;
    v8 = os_log_create("com.apple.notes", "PreviewGeneration");
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    if (v5 <= 0.0 || v7 <= 0.0)
    {
      if (v9)
        __68__ICAttachmentImageModel_PreviewGeneration__generateOCRInOperation___block_invoke_cold_6(a1 + 40);
      v10 = v8;
      goto LABEL_34;
    }
    if (v9)
      __68__ICAttachmentImageModel_PreviewGeneration__generateOCRInOperation___block_invoke_cold_5(a1 + 40);

    objc_msgSend(*v3, "attachmentPreviewImageWithMinSize:scale:", v5, v7, 1.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "orientedPreviewImageURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(*v3, "media");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "mediaURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        v13 = os_log_create("com.apple.notes", "PreviewGeneration");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          __68__ICAttachmentImageModel_PreviewGeneration__generateOCRInOperation___block_invoke_cold_2((uint64_t)v3);
        v11 = v13;
        goto LABEL_31;
      }
    }
    if ((objc_msgSend(*(id *)(a1 + 48), "isCancelled") & 1) != 0)
    {
      v13 = os_log_create("com.apple.notes", "PreviewGeneration");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __68__ICAttachmentImageModel_PreviewGeneration__generateOCRInOperation___block_invoke_cold_3((uint64_t)v3);

      goto LABEL_31;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0D63BE0];
    v27 = 0;
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "ocrStringFromImageURL:title:languages:", v11, &v27, v15);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v17 = v27;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSinceDate:", v13);

    v19 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      __68__ICAttachmentImageModel_PreviewGeneration__generateOCRInOperation___block_invoke_cold_4((uint64_t)v3);

    objc_msgSend(*v3, "ocrSummary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToString:", v16);

    if ((v21 & 1) == 0)
    {
      if (v16)
        v22 = v16;
      else
        v22 = CFSTR(" ");
      objc_msgSend(*v3, "setOcrSummary:", v22);
      objc_msgSend(*v3, "updateChangeCountWithReason:", CFSTR("Generated OCR"));
    }
    if (v17)
    {
      objc_msgSend(v17, "ic_trimmedString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v23, "length"))
      {
LABEL_26:

        goto LABEL_27;
      }
      objc_msgSend(*v3, "title");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isEqualToString:", v17);

      if ((v25 & 1) == 0)
      {
        objc_msgSend(*v3, "setTitle:", v17);
        objc_msgSend(*v3, "parentAttachment");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "regenerateTitle");
        goto LABEL_26;
      }
    }
LABEL_27:
    objc_msgSend(*v3, "managedObjectContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "ic_save");

LABEL_31:
    v8 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __68__ICAttachmentImageModel_PreviewGeneration__generateOCRInOperation___block_invoke_cold_1((uint64_t)v3);

LABEL_34:
  }
  objc_autoreleasePoolPop(v2);
}

void __70__ICAttachmentImageModel_PreviewGeneration__classifyImageInOperation___block_invoke(id *a1)
{
  void *v2;
  id *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  os_log_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  NSObject *v18;

  v2 = (void *)MEMORY[0x1AF445E78]();
  if (a1[4])
  {
    v3 = a1 + 5;
    objc_msgSend(a1[5], "sizeWidth");
    v5 = v4;
    objc_msgSend(a1[5], "sizeHeight");
    v7 = v6;
    v8 = os_log_create("com.apple.notes", "PreviewGeneration");
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    if (v5 <= 0.0 || v7 <= 0.0)
    {
      if (v9)
        __70__ICAttachmentImageModel_PreviewGeneration__classifyImageInOperation___block_invoke_cold_6((uint64_t)(a1 + 5));
      v10 = v8;
      goto LABEL_29;
    }
    if (v9)
      __70__ICAttachmentImageModel_PreviewGeneration__classifyImageInOperation___block_invoke_cold_5((uint64_t)(a1 + 5));

    objc_msgSend(*v3, "attachmentPreviewImageWithMinSize:scale:", v5, v7, 1.0);
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject orientedImage](v8, "orientedImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if ((objc_msgSend(a1[6], "isCancelled") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[4], "classificationsForImage:", v10);
        v11 = (os_log_t)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceDate:", v12);

        v14 = os_log_create("com.apple.notes", "PreviewGeneration");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          __70__ICAttachmentImageModel_PreviewGeneration__classifyImageInOperation___block_invoke_cold_4((uint64_t)v3);

        if (v11)
        {
          if (-[NSObject length](v11, "length"))
            v15 = (const __CFString *)v11;
          else
            v15 = CFSTR(" ");
          objc_msgSend(*v3, "setImageClassificationSummary:", v15);
          if (-[NSObject rangeOfString:options:](v11, "rangeOfString:options:", CFSTR("document"), 1) != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "postNotificationName:object:", *MEMORY[0x1E0D63600], *v3);

          }
        }
        else
        {
          +[ICAttachmentPreviewGenerator setImageClassificationTemporarilyDisabled:](ICAttachmentPreviewGenerator, "setImageClassificationTemporarilyDisabled:", 1);
        }
        objc_msgSend(*v3, "updateChangeCountWithReason:", CFSTR("Classified image"));
        objc_msgSend(*v3, "managedObjectContext");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "ic_save");

        goto LABEL_26;
      }
      v11 = os_log_create("com.apple.notes", "PreviewGeneration");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __70__ICAttachmentImageModel_PreviewGeneration__classifyImageInOperation___block_invoke_cold_3((uint64_t)v3);
    }
    else
    {
      v11 = os_log_create("com.apple.notes", "PreviewGeneration");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __70__ICAttachmentImageModel_PreviewGeneration__classifyImageInOperation___block_invoke_cold_2((uint64_t)v3);
    }
    v12 = v11;
LABEL_26:

    v18 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      __70__ICAttachmentImageModel_PreviewGeneration__classifyImageInOperation___block_invoke_cold_1((uint64_t)v3);

LABEL_29:
  }
  objc_autoreleasePoolPop(v2);
}

uint64_t __81__ICAttachmentImageModel_PreviewGeneration__labelsForClassificationObservations___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  if (*(_BYTE *)(a3 + 32))
  {
    if (!*(_BYTE *)(a3 + 33))
    {
      v4 = *(unsigned int *)(a3 + 8);
      if ((objc_msgSend(*(id *)(a1 + 32), "containsIndex:", v4) & 1) == 0)
      {
        v5 = *(void **)(a1 + 40);
        PFSceneTaxonomyNodeLocalizedLabel();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "ic_addNonNilObject:", v6);

        PFSceneTaxonomyNodeLocalizedSynonyms();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "count"))
          objc_msgSend(*(id *)(a1 + 40), "ic_addObjectsFromNonNilArray:", v7);
        objc_msgSend(*(id *)(a1 + 32), "addIndex:", v4);

      }
    }
  }
  return 0;
}

void __68__ICAttachmentImageModel_PreviewGeneration__generateOCRInOperation___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_2_1(a1), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AC7A1000, v2, v3, "Ended OCR Generation: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_3();
}

void __68__ICAttachmentImageModel_PreviewGeneration__generateOCRInOperation___block_invoke_cold_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_2_1(a1), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AC7A1000, v2, v3, "Ended OCR Generation Early due to no image url for Attachment: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_3();
}

void __68__ICAttachmentImageModel_PreviewGeneration__generateOCRInOperation___block_invoke_cold_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_2_1(a1), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AC7A1000, v2, v3, "Ended OCR Generation Early due to operation cancelled: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_3();
}

void __68__ICAttachmentImageModel_PreviewGeneration__generateOCRInOperation___block_invoke_cold_4(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_2_1(a1), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_0(&dword_1AC7A1000, v2, v3, "Completed OCR Generation for Attachment %@. %0.3fs", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7_0();
}

void __68__ICAttachmentImageModel_PreviewGeneration__generateOCRInOperation___block_invoke_cold_5(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_2_1(a1), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AC7A1000, v2, v3, "Beginning OCR Generation For Attachment: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_3();
}

void __68__ICAttachmentImageModel_PreviewGeneration__generateOCRInOperation___block_invoke_cold_6(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_2_1(a1), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AC7A1000, v2, v3, "Ended OCR Generation Early invalid media size: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_3();
}

void __70__ICAttachmentImageModel_PreviewGeneration__classifyImageInOperation___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_2_1(a1), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AC7A1000, v2, v3, "Ended Image Classification: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_3();
}

void __70__ICAttachmentImageModel_PreviewGeneration__classifyImageInOperation___block_invoke_cold_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_2_1(a1), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AC7A1000, v2, v3, "Ended Image Classification Early due to no image for Attachment: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_3();
}

void __70__ICAttachmentImageModel_PreviewGeneration__classifyImageInOperation___block_invoke_cold_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_2_1(a1), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AC7A1000, v2, v3, "Image Classification operation cancelled for: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_3();
}

void __70__ICAttachmentImageModel_PreviewGeneration__classifyImageInOperation___block_invoke_cold_4(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_2_1(a1), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_0(&dword_1AC7A1000, v2, v3, "Completed Image Classification for Attachment %@. %0.3fs", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7_0();
}

void __70__ICAttachmentImageModel_PreviewGeneration__classifyImageInOperation___block_invoke_cold_5(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_2_1(a1), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AC7A1000, v2, v3, "Beginning Image Classification For Attachment: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_3();
}

void __70__ICAttachmentImageModel_PreviewGeneration__classifyImageInOperation___block_invoke_cold_6(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_2_1(a1), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AC7A1000, v2, v3, "Ended Image Classification Early invalid media size: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_3();
}

@end
