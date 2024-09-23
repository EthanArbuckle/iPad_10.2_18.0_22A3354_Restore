@implementation ICAttachmentWebModel

void __71__ICAttachmentWebModel_PreviewGeneration__generatePreviewsInOperation___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;

  v2 = (id *)(a1 + 72);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(*(SEL *)(a1 + 80));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "attachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %@ %@"), v6, v7, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  if ((objc_msgSend(WeakRetained, "previewGenerationOperationCancelled") & 1) != 0)
    goto LABEL_19;
  v13 = os_log_create("com.apple.notes", "PreviewGeneration");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    __71__ICAttachmentWebModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_cold_1(a1 + 32, v13, v14, v15, v16, v17, v18, v19);

  objc_msgSend(WeakRetained, "attachment");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "URL");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v23 = *(void **)(v22 + 40);
  *(_QWORD *)(v22 + 40) = v21;

  v24 = objc_loadWeakRetained(v2);
  objc_msgSend(v24, "attachment");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "hasSynapseLink");

  if (v26)
  {
    v27 = objc_loadWeakRetained(v2);
    objc_msgSend(v27, "attachment");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "synapseData");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v31 = *(void **)(v30 + 40);
    *(_QWORD *)(v30 + 40) = v29;

  }
  else
  {
    objc_msgSend(WeakRetained, "attachment");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "previewUpdateDate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
      v34 = 0;
    else
      v34 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "isFileURL") ^ 1;

    objc_msgSend(WeakRetained, "attachment");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v35, "urlExpired"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    }
    else
    {
      objc_msgSend(WeakRetained, "attachment");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v36, "metadataExists") ^ 1 | v34;

    }
    if (!v34)
      goto LABEL_15;
    objc_msgSend(WeakRetained, "attachment");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "deleteAttachmentPreviewImages");
  }

LABEL_15:
  objc_msgSend(WeakRetained, "attachment");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "previewUpdateDate");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    objc_msgSend(WeakRetained, "attachment");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v39, "hasMetadata") ^ 1;

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  }

LABEL_19:
}

void __79__ICAttachmentWebModel_PreviewGeneration__extractPreviewImagesFromSynapseData___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synapseBasedMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "saveImagesFromLinkMetadata:", v3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3 != 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreviewUpdateDate:", v4);

}

void __75__ICAttachmentWebModel_PreviewGeneration__downloadPreviewForAttachmentURL___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  objc_class *v5;
  id v6;
  id v7;
  __int128 v8;
  _QWORD v9[5];
  __int128 v10;
  id v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  objc_msgSend(MEMORY[0x1E0CB37A8], "requestWithURL:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setNonAppInitiated:", 1);
  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v3 = (void *)getLPMetadataProviderClass_softClass_0;
  v16 = getLPMetadataProviderClass_softClass_0;
  v4 = MEMORY[0x1E0C809B0];
  if (!getLPMetadataProviderClass_softClass_0)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __getLPMetadataProviderClass_block_invoke_0;
    v12[3] = &unk_1E5C1DE18;
    v12[4] = &v13;
    __getLPMetadataProviderClass_block_invoke_0((uint64_t)v12);
    v3 = (void *)v14[3];
  }
  v5 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v13, 8);
  v6 = objc_alloc_init(v5);
  objc_msgSend(v6, "_setShouldDownloadMediaSubresources:", 0);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __75__ICAttachmentWebModel_PreviewGeneration__downloadPreviewForAttachmentURL___block_invoke_2;
  v9[3] = &unk_1E5C211B8;
  objc_copyWeak(&v11, (id *)(a1 + 64));
  v9[4] = *(_QWORD *)(a1 + 40);
  v8 = *(_OWORD *)(a1 + 48);
  v7 = (id)v8;
  v10 = v8;
  objc_msgSend(v6, "startFetchingMetadataForRequest:completionHandler:", v2, v9);

  objc_destroyWeak(&v11);
}

void __75__ICAttachmentWebModel_PreviewGeneration__downloadPreviewForAttachmentURL___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  uint64_t v25;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8 = WeakRetained;
  if (v5 && WeakRetained)
  {
    objc_msgSend(WeakRetained, "attachment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __75__ICAttachmentWebModel_PreviewGeneration__downloadPreviewForAttachmentURL___block_invoke_3;
    v23[3] = &unk_1E5C1D7C0;
    v23[4] = v8;
    v11 = v5;
    v12 = *(_QWORD *)(a1 + 32);
    v24 = v11;
    v25 = v12;
    objc_msgSend(v10, "performBlockAndWait:", v23);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    objc_opt_class();
    objc_msgSend(v6, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "attachment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "managedObjectContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __75__ICAttachmentWebModel_PreviewGeneration__downloadPreviewForAttachmentURL___block_invoke_4;
    v19[3] = &unk_1E5C1D7C0;
    v20 = v15;
    v21 = v8;
    v22 = v6;
    v18 = v15;
    objc_msgSend(v17, "performBlock:", v19);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __75__ICAttachmentWebModel_PreviewGeneration__downloadPreviewForAttachmentURL___block_invoke_3(id *a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = a1[4];
  objc_msgSend(a1[5], "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "summary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateTitle:andDescription:", v3, v4);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPreviewUpdateDate:", v5);

  objc_msgSend(a1[6], "saveImagesFromLinkMetadata:", a1[5]);
  objc_msgSend(a1[5], "setImage:", 0);
  objc_msgSend(a1[4], "attachment");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "metadataExists") & 1) == 0)
  {
    objc_msgSend(v7, "persistLinkMetadata:", a1[5]);
    objc_msgSend(v7, "ic_postNotificationOnMainThreadWithName:", CFSTR("ICAttachmentInitialPreviewDidLoadNotification"));
  }

}

void __75__ICAttachmentWebModel_PreviewGeneration__downloadPreviewForAttachmentURL___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v2 = *(void **)(a1 + 32);
  if (v2 && objc_msgSend(v2, "code") != -1009)
  {
    objc_msgSend(*(id *)(a1 + 40), "attachment");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setUrlExpired:", 1);

    objc_msgSend(*(id *)(a1 + 40), "attachment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ic_save");

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "attachment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("ICAttachmentDidFailFetchingMetadataNotification"), v7);

  v8 = os_log_create("com.apple.notes", "PreviewGeneration");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    __75__ICAttachmentWebModel_PreviewGeneration__downloadPreviewForAttachmentURL___block_invoke_4_cold_1(a1, v8);

}

void __80__ICAttachmentWebModel_PreviewGeneration__updateAttachmentPreviewImagesMetadata__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t i;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "attachment", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "previewImages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    v7 = 1;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v9, "width");
        if (v10 <= 192.0)
        {
          objc_msgSend(v9, "height");
          if (v11 <= 192.0)
            continue;
        }
        v7 = 0;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 1;
  }

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "metadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
    v13 = (void *)MEMORY[0x1E0C9AA70];
  v15 = (void *)objc_msgSend(v13, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7 & 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v16, *MEMORY[0x1E0D63630]);

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setMetadata:", v15);

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "updateChangeCountWithReason:", CFSTR("Updated metadata"));

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "ic_postNotificationOnMainThreadWithName:", *MEMORY[0x1E0D63660]);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

uint64_t __55__ICAttachmentWebModel_UI__genericListThumbnailCreator__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("attachmentbrick_list_loading_web"));
}

uint64_t __56__ICAttachmentWebModel_UI__genericBrickThumbnailCreator__block_invoke(double a1)
{
  return objc_msgSend((id)objc_opt_class(), "genericBrickThumbnailWithSize:scale:", 36.0, 36.0, a1);
}

uint64_t __61__ICAttachmentWebModel_UI__genericBrickLargeThumbnailCreator__block_invoke(double a1)
{
  return objc_msgSend((id)objc_opt_class(), "genericBrickThumbnailWithSize:scale:", 72.0, 72.0, a1);
}

void __71__ICAttachmentWebModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1AC7A1000, a2, a3, "%@ start", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __75__ICAttachmentWebModel_PreviewGeneration__downloadPreviewForAttachmentURL___block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 48);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1AC7A1000, a2, OS_LOG_TYPE_ERROR, "Web preview generation failed with error: %@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_2();
}

@end
