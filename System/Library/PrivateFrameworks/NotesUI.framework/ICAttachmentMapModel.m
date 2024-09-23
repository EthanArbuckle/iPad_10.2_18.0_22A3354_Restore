@implementation ICAttachmentMapModel

void __71__ICAttachmentMapModel_PreviewGeneration__generatePreviewsInOperation___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(WeakRetained, "attachment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__ICAttachmentMapModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_2;
  v8[3] = &unk_1E5C1F798;
  v8[4] = WeakRetained;
  objc_msgSend(v7, "updatePlaceInLocationIfNeededHandler:", v8);

}

void __71__ICAttachmentMapModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __71__ICAttachmentMapModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_2_cold_1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
    goto LABEL_6;
  }
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject managedObjectContext](v6, "managedObjectContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ic_save");

LABEL_6:
  }

}

void __71__ICAttachmentMapModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_9(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  __int128 v4;
  _QWORD v5[5];
  __int128 v6;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__ICAttachmentMapModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_2_10;
  v5[3] = &unk_1E5C1F7E8;
  v5[4] = *(_QWORD *)(a1 + 48);
  v4 = *(_OWORD *)(a1 + 56);
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(v1, "startFetchingMetadataForRequest:completionHandler:", v2, v5);

}

void __71__ICAttachmentMapModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_2_10(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __71__ICAttachmentMapModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_3;
    v20[3] = &unk_1E5C1D9A8;
    v10 = v5;
    v11 = *(_QWORD *)(a1 + 32);
    v21 = v10;
    v22 = v11;
    objc_msgSend(v9, "performBlock:", v20);

  }
  else if (v6)
  {
    v12 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __71__ICAttachmentMapModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_2_10_cold_1((uint64_t)v7, v12, v13, v14, v15, v16, v17, v18);

    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "ic_postNotificationOnMainThreadWithName:", CFSTR("ICAttachmentDidFailFetchingMetadataNotification"));

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __71__ICAttachmentMapModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  objc_msgSend(*(id *)(a1 + 32), "specialization");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v10 = (void *)getLPMapMetadataClass_softClass;
  v23 = getLPMapMetadataClass_softClass;
  if (!getLPMapMetadataClass_softClass)
  {
    v19[1] = 3221225472;
    v19[2] = __getLPMapMetadataClass_block_invoke;
    v19[3] = &unk_1E5C1DE18;
    v19[4] = &v20;
    __getLPMapMetadataClass_block_invoke((uint64_t)v19, v2, v3, v4, v5, v6, v7, v8, v18, MEMORY[0x1E0C809B0]);
    v10 = (void *)v21[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v20, 8);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "specialization");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "address");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "attachment");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSummary:", v14);

  }
  objc_msgSend(*(id *)(a1 + 40), "attachment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "persistLinkMetadata:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "attachment");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ic_postNotificationOnMainThreadWithName:", CFSTR("ICAttachmentInitialPreviewDidLoadNotification"));

}

uint64_t __55__ICAttachmentMapModel_UI__genericListThumbnailCreator__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("attachmentbrick_list_loading_map"));
}

uint64_t __56__ICAttachmentMapModel_UI__genericBrickThumbnailCreator__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("attachmentbrick_note_loading_map"));
}

void __71__ICAttachmentMapModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1AC7A1000, a2, a3, "Updating map location failed: %@", a5, a6, a7, a8, 2u);
}

void __71__ICAttachmentMapModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_2_10_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1AC7A1000, a2, a3, "Map preview generation failed with error: %@", a5, a6, a7, a8, 2u);
}

@end
