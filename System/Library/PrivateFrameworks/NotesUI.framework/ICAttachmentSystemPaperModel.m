@implementation ICAttachmentSystemPaperModel

void __56__ICAttachmentSystemPaperModel_UI__imageForActivityItem__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fallbackImageData");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __54__ICAttachmentSystemPaperModel_UI__drawPreviewInRect___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICPaperStyle drawPaperStyleType:inRect:](ICPaperStyle, "drawPaperStyleType:inRect:", (int)objc_msgSend(v3, "paperStyleType"), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));

  v4 = os_log_create("com.apple.notes", "SystemPaper");
  v5 = os_signpost_id_generate(v4);
  v6 = v4;
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AC7A1000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "DrawPreviewInRect", ", buf, 2u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "drawPaperInRect:", *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
  v8 = v7;
  v9 = v8;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AC7A1000, v9, OS_SIGNPOST_INTERVAL_END, v5, "DrawPreviewInRect", ", v10, 2u);
  }

}

void __108__ICAttachmentSystemPaperModel_PreviewGeneration__generateImageForAttachment_fullResolution_appearanceInfo___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "imageWithFullResolution:inverted:", *(unsigned __int8 *)(a1 + 56), objc_msgSend(*(id *)(a1 + 40), "isDark"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __97__ICAttachmentSystemPaperModel_PreviewGeneration__generatePreviewsForAttachment_paperIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id obj;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  uint64_t *v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "attachmentModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 40))
  {
    +[ICSystemPaperImageGenerator imageGeneratorWithPaperAttachment:](ICSystemPaperImageGenerator, "imageGeneratorWithPaperAttachment:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = 0;
    v71 = &v70;
    v72 = 0x3032000000;
    v73 = __Block_byref_object_copy__37;
    v74 = __Block_byref_object_dispose__37;
    v75 = 0;
    objc_msgSend(*(id *)(a1 + 32), "previewImages");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    v64 = 0;
    v65 = &v64;
    v66 = 0x3032000000;
    v67 = __Block_byref_object_copy__37;
    v68 = __Block_byref_object_dispose__37;
    v69 = objc_alloc_init(MEMORY[0x1E0D64228]);
    v6 = (void *)MEMORY[0x1E0D639E8];
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __97__ICAttachmentSystemPaperModel_PreviewGeneration__generatePreviewsForAttachment_paperIdentifier___block_invoke_2;
    v57[3] = &unk_1E5C20A38;
    v58 = *(id *)(a1 + 32);
    v7 = v3;
    v8 = *(_QWORD *)(a1 + 56);
    v39 = v7;
    v59 = v7;
    v63 = v8;
    v60 = v40;
    v61 = &v70;
    v62 = &v64;
    objc_msgSend(v6, "enumerateAppearanceTypesUsingBlock:", v57);
    +[ICPreviewDeviceContext sharedContext](ICPreviewDeviceContext, "sharedContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deviceInfoScalable:", 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    objc_msgSend((id)v65[5], "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v53, v78, 16);
    v12 = 0;
    if (v11)
    {
      obj = v10;
      v42 = *(_QWORD *)v54;
      do
      {
        v44 = v11;
        for (i = 0; i != v44; ++i)
        {
          if (*(_QWORD *)v54 != v42)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          v15 = objc_msgSend(v14, "type");
          objc_msgSend((id)v65[5], "objectForKey:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v16)
            objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((generatedPreviewImage) != nil)", "+[ICAttachmentSystemPaperModel(PreviewGeneration) generatePreviewsForAttachment:paperIdentifier:]_block_invoke", 1, 0, CFSTR("Expected non-nil value for '%s'"), "generatedPreviewImage");
          v51 = 0u;
          v52 = 0u;
          v49 = 0u;
          v50 = 0u;
          v17 = v43;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v77, 16);
          if (v18)
          {
            v19 = *(_QWORD *)v50;
            do
            {
              for (j = 0; j != v18; ++j)
              {
                if (*(_QWORD *)v50 != v19)
                  objc_enumerationMutation(v17);
                v21 = *(void **)(a1 + 32);
                objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * j), "scale");
                objc_msgSend(v21, "updateAttachmentPreviewImageWithImage:scale:appearanceType:scaleWhenDrawing:metadata:sendNotification:", v16, v15, 1, 0, 0);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "ic_removeNonNilObject:", v22);

              }
              v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v77, 16);
            }
            while (v18);
            v12 = 1;
          }

        }
        v10 = obj;
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v78, 16);
      }
      while (v11);
    }

    v23 = (void *)v71[5];
    if (v23)
    {
      v24 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0D639F0], "fallbackImageUTI");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "ic_imageDataWithUTType:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "writeFallbackImageData:", v26);

    }
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "removePreviewImages:", v5);
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v27 = v5;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v45, v76, 16);
      if (v28)
      {
        v29 = *(_QWORD *)v46;
        do
        {
          for (k = 0; k != v28; ++k)
          {
            if (*(_QWORD *)v46 != v29)
              objc_enumerationMutation(v27);
            v31 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * k);
            objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "deleteObject:", v31);

          }
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v45, v76, 16);
        }
        while (v28);
      }

    }
    if ((v12 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setPreviewUpdateDate:", v33);

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }

    _Block_object_dispose(&v64, 8);
    _Block_object_dispose(&v70, 8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "generateEmptyImage");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "size");
    objc_msgSend(*(id *)(a1 + 32), "setSizeWidth:");
    objc_msgSend(v34, "size");
    objc_msgSend(*(id *)(a1 + 32), "setSizeHeight:", v35);
    v36 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0D639F0], "fallbackImageUTI");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "ic_imageDataWithUTType:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "writeFallbackImageData:", v38);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

void __97__ICAttachmentSystemPaperModel_PreviewGeneration__generatePreviewsForAttachment_paperIdentifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  os_log_t v24;
  NSObject *v25;
  NSObject *v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  BOOL v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[4];
  id v38;
  id v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  _BYTE v53[24];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D639E8], "appearanceInfoWithType:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__37;
  v45 = __Block_byref_object_dispose__37;
  v46 = 0;
  v5 = os_log_create("com.apple.notes", "SystemPaper");
  v6 = os_signpost_id_generate(v5);
  v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AC7A1000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PreviewGeneration", ", buf, 2u);
  }

  v9 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __97__ICAttachmentSystemPaperModel_PreviewGeneration__generatePreviewsForAttachment_paperIdentifier___block_invoke_2_cold_2(v10, (uint64_t)v53, v9);
  }

  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __97__ICAttachmentSystemPaperModel_PreviewGeneration__generatePreviewsForAttachment_paperIdentifier___block_invoke_16;
  v37[3] = &unk_1E5C1E190;
  v40 = &v41;
  v38 = *(id *)(a1 + 40);
  v11 = v4;
  v39 = v11;
  objc_msgSend(v11, "performAsDefaultAppearance:", v37);
  objc_msgSend(*(id *)(a1 + 40), "paperContentBounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = objc_msgSend(*(id *)(a1 + 40), "hasDeepLink");
  v21 = v8;
  v22 = v21;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AC7A1000, v22, OS_SIGNPOST_INTERVAL_END, v6, "PreviewGeneration", ", buf, 2u);
  }

  v23 = v42[5];
  v24 = os_log_create("com.apple.notes", "SystemPaper");
  v25 = v24;
  if (v23)
  {
    v26 = v24;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "shortLoggingDescription");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v42[5], "size");
      v35 = v34;
      objc_msgSend((id)v42[5], "size");
      *(_DWORD *)buf = 138412802;
      v48 = v33;
      v49 = 2048;
      v50 = v35;
      v51 = 2048;
      v52 = v36;
      _os_log_debug_impl(&dword_1AC7A1000, v26, OS_LOG_TYPE_DEBUG, "Generated paper sketch image: %@ => %g %g", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 72), "previewImageForAttachment:fullImage:scale:appearanceInfo:", *(_QWORD *)(a1 + 32), objc_msgSend((id)v42[5], "ic_CGImage"), v11, 2.0);
    v25 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v42[5], "size");
    objc_msgSend(*(id *)(a1 + 32), "setSizeWidth:");
    objc_msgSend((id)v42[5], "size");
    objc_msgSend(*(id *)(a1 + 32), "setSizeHeight:", v27);
    objc_msgSend(*(id *)(a1 + 48), "setPaperContentBoundsHint:", v13, v15, v17, v19);
    objc_msgSend(*(id *)(a1 + 48), "setHasDeepLink:", v20);
    if (!a2)
    {
      +[ICAttachmentPreviewImageLoader orientedImage:withBackground:](ICAttachmentPreviewImageLoader, "orientedImage:withBackground:", v42[5], 1);
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v30 = *(void **)(v29 + 40);
      *(_QWORD *)(v29 + 40) = v28;

    }
    if (v25)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "objectForKey:", v11);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31 == 0;

      if (!v32)
        objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[appearancesToPreviewImages objectForKey:appearanceInfo] == ((void *)0)", "+[ICAttachmentSystemPaperModel(PreviewGeneration) generatePreviewsForAttachment:paperIdentifier:]_block_invoke", 1, 0, CFSTR("Didn't expect to generate multiple images for the same ICAppearance."));
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setObject:forUncopiedKey:", v25, v11);
    }
  }
  else if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    __97__ICAttachmentSystemPaperModel_PreviewGeneration__generatePreviewsForAttachment_paperIdentifier___block_invoke_2_cold_1(v25);
  }

  _Block_object_dispose(&v41, 8);
}

void __97__ICAttachmentSystemPaperModel_PreviewGeneration__generatePreviewsForAttachment_paperIdentifier___block_invoke_16(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "imageWithFullResolution:inverted:", 0, objc_msgSend(*(id *)(a1 + 40), "isDark"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __79__ICAttachmentSystemPaperModel_PreviewGeneration__generatePreviewsInOperation___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(a1 + 32), "paperBundleURL");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __97__ICAttachmentSystemPaperModel_PreviewGeneration__generatePreviewsForAttachment_paperIdentifier___block_invoke_2_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AC7A1000, log, OS_LOG_TYPE_ERROR, "Failed to generate paper attachment preview", v1, 2u);
}

void __97__ICAttachmentSystemPaperModel_PreviewGeneration__generatePreviewsForAttachment_paperIdentifier___block_invoke_2_cold_2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_2(&dword_1AC7A1000, a3, (uint64_t)a3, "Starting to generate System Paper image for attachment %@", (uint8_t *)a2);

}

@end
