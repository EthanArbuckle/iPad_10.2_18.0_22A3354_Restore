@implementation ICMarkupUtilities

+ (BOOL)hasPrivateImageMetadata:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  v4 = objc_msgSend(getMarkupViewControllerClass(), "hasPrivateImageMetadata:", v3);

  return v4;
}

+ (id)cleanImageMetadataFromData:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(getMarkupViewControllerClass(), "cleanImageMetadataFromData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)createMarkupViewController
{
  return objc_alloc_init((Class)getMarkupViewControllerClass());
}

+ (id)createProcessingMarkupViewControllerOutWindow:(id *)a3
{
  id v3;
  uint64_t v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = 0;
  v5 = MEMORY[0x1E0C809B0];
  performBlockOnMainThreadAndWait();
  objc_msgSend((id)v8[5], "setEncryptPrivateMetadata:", 0, v5, 3221225472, __67__ICMarkupUtilities_createProcessingMarkupViewControllerOutWindow___block_invoke, &unk_1E76C76E0, &v7, a1);
  v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v3;
}

void __67__ICMarkupUtilities_createProcessingMarkupViewControllerOutWindow___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 40), "createMarkupViewController");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)imageDataWithMarkupModelData:(id)a3 sourceImageData:(id)a4
{
  return (id)objc_msgSend(a1, "imageDataWithMarkupModelData:sourceImageData:embedData:", a3, a4, 0);
}

+ (id)imageDataWithMarkupModelData:(id)a3 sourceImageData:(id)a4 embedData:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v20[5];
  id v21;
  id v22;
  id v23;
  id v24;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1C3B7AC74]();
  v24 = 0;
  objc_msgSend(a1, "createProcessingMarkupViewControllerOutWindow:", &v24);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v24;
  v20[1] = (id)MEMORY[0x1E0C809B0];
  v20[2] = (id)3221225472;
  v20[3] = __76__ICMarkupUtilities_imageDataWithMarkupModelData_sourceImageData_embedData___block_invoke;
  v20[4] = &unk_1E76C7708;
  v13 = v11;
  v21 = v13;
  v14 = v9;
  v22 = v14;
  v15 = v8;
  v23 = v15;
  performBlockOnMainThreadAndWait();
  v20[0] = 0;
  objc_msgSend(v13, "dataRepresentationEmbeddingSourceImageAndEditModel:error:", v5, v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v20[0];
  if (v17)
  {
    v18 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      +[ICMarkupUtilities imageDataWithMarkupModelData:sourceImageData:embedData:].cold.1();

  }
  objc_autoreleasePoolPop(v10);

  return v16;
}

uint64_t __76__ICMarkupUtilities_imageDataWithMarkupModelData_sourceImageData_embedData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setData:withArchivedModelData:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (id)imageDataWithMarkupModelData:(id)a3 sourceImageURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v18[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1C3B7AC74]();
  v22 = 0;
  objc_msgSend(a1, "createProcessingMarkupViewControllerOutWindow:", &v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v22;
  v18[1] = (id)MEMORY[0x1E0C809B0];
  v18[2] = (id)3221225472;
  v18[3] = __65__ICMarkupUtilities_imageDataWithMarkupModelData_sourceImageURL___block_invoke;
  v18[4] = &unk_1E76C7708;
  v11 = v9;
  v19 = v11;
  v12 = v7;
  v20 = v12;
  v13 = v6;
  v21 = v13;
  performBlockOnMainThreadAndWait();
  v18[0] = 0;
  objc_msgSend(v11, "dataRepresentationEmbeddingSourceImageAndEditModel:error:", 0, v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v18[0];
  if (v15)
  {
    v16 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[ICMarkupUtilities imageDataWithMarkupModelData:sourceImageData:embedData:].cold.1();

  }
  objc_autoreleasePoolPop(v8);

  return v14;
}

uint64_t __65__ICMarkupUtilities_imageDataWithMarkupModelData_sourceImageURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFileURL:withArchivedModelData:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (void)applyReturnedMarkupURL:(id)a3 attachment:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  objc_msgSend(v9, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __71__ICMarkupUtilities_applyReturnedMarkupURL_attachment_completionBlock___block_invoke;
  v16 = &unk_1E76C7730;
  v18 = &v19;
  v12 = v9;
  v17 = v12;
  objc_msgSend(v11, "performBlockAndWait:", &v13);

  if (*((_BYTE *)v20 + 24))
    objc_msgSend(a1, "embedReturnedMarkupURL:attachment:completionBlock:", v8, v12, v10, v13, v14, v15, v16);
  else
    objc_msgSend(a1, "extractReturnedMarkupURL:attachment:completionBlock:", v8, v12, v10, v13, v14, v15, v16);

  _Block_object_dispose(&v19, 8);
}

uint64_t __71__ICMarkupUtilities_applyReturnedMarkupURL_attachment_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "shouldEmbedMarkupDataInMedia");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (void)embedReturnedMarkupURL:(id)a3 attachment:(id)a4 completionBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  SEL v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "startAccessingSecurityScopedResource");
  objc_msgSend(v10, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __71__ICMarkupUtilities_embedReturnedMarkupURL_attachment_completionBlock___block_invoke;
  v16[3] = &unk_1E76C7758;
  v17 = v10;
  v18 = v9;
  v20 = a1;
  v21 = a2;
  v19 = v11;
  v13 = v11;
  v14 = v9;
  v15 = v10;
  objc_msgSend(v12, "performBlockAndWait:", v16);

}

void __71__ICMarkupUtilities_embedReturnedMarkupURL_attachment_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "media");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v19 = 0;
  v4 = objc_msgSend(v2, "writeDataFromFileURL:error:", v3, &v19);
  v5 = v19;

  objc_msgSend(*(id *)(a1 + 40), "stopAccessingSecurityScopedResource");
  v6 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v21 = v8;
    v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_1BD918000, v6, OS_LOG_TYPE_DEFAULT, "%@ %@ B", buf, 0x16u);

  }
  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "media");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "data");
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "setHasMarkupData:", objc_msgSend(*(id *)(a1 + 56), "hasPrivateImageMetadata:", v11));
    objc_msgSend(*(id *)(a1 + 32), "setPreviewUpdateDate:", 0);
    objc_msgSend(*(id *)(a1 + 32), "attachmentDidChange");
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v5;
    objc_msgSend(v12, "save:", &v18);
    v13 = v18;

    if (v13)
    {
      v14 = os_log_create("com.apple.notes", "PencilKit");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __71__ICMarkupUtilities_embedReturnedMarkupURL_attachment_completionBlock___block_invoke_cold_1();

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "postNotificationName:object:", CFSTR("ICAttachmentNeedsPreviewGenerationNotification"), v16);

  }
  else
  {
    v11 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __71__ICMarkupUtilities_embedReturnedMarkupURL_attachment_completionBlock___block_invoke_cold_1();
    v13 = v5;
  }

  v17 = *(_QWORD *)(a1 + 48);
  if (v17)
    (*(void (**)(void))(v17 + 16))();

}

+ (void)extractReturnedMarkupURL:(id)a3 attachment:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "startAccessingSecurityScopedResource");
  objc_msgSend(a1, "markupModelDataFromDataAtURL:", v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stopAccessingSecurityScopedResource");

  objc_msgSend(a1, "applyMarkupModelData:attachment:completionBlock:", v11, v9, v8);
}

+ (void)applyMarkupModelData:(id)a3 attachment:(id)a4 completionBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__ICMarkupUtilities_applyMarkupModelData_attachment_completionBlock___block_invoke;
  v14[3] = &unk_1E76C7780;
  v15 = v7;
  v16 = v8;
  v17 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v7;
  objc_msgSend(v10, "performBlockAndWait:", v14);

}

uint64_t __69__ICMarkupUtilities_applyMarkupModelData_attachment_completionBlock___block_invoke(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "markupModelData");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v2 | v3)
  {
    v4 = (void *)v3;
    v5 = objc_msgSend((id)v2, "isEqual:", v3);

    if ((v5 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "setMarkupModelData:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 40), "attachmentDidChange");
      objc_msgSend(*(id *)(a1 + 40), "setPreviewUpdateDate:", 0);
      objc_msgSend(*(id *)(a1 + 40), "parentAttachment");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "attachmentDidChange");

      objc_msgSend(*(id *)(a1 + 40), "parentAttachment");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPreviewUpdateDate:", 0);

      objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ic_save");

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "objectID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotificationName:object:", CFSTR("ICAttachmentDidUpdateMarkupDataNotification"), v10);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "objectID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "postNotificationName:object:", CFSTR("ICAttachmentNeedsPreviewGenerationNotification"), v12);

    }
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (id)markupModelDataFromDataAtURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v11;
  id v12;
  id v13;

  v4 = a3;
  v5 = (void *)MEMORY[0x1C3B7AC74]();
  v13 = 0;
  objc_msgSend(a1, "createProcessingMarkupViewControllerOutWindow:", &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  v11 = v6;
  v12 = v4;
  v8 = v6;
  performBlockOnMainThreadAndWait();
  objc_msgSend(v8, "createArchivedModelData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v5);
  return v9;
}

uint64_t __50__ICMarkupUtilities_markupModelDataFromDataAtURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFileURL:withArchivedModelData:", *(_QWORD *)(a1 + 40), 0);
}

+ (id)markupModelDataFromData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v11;
  id v12;
  id v13;

  v4 = a3;
  v5 = (void *)MEMORY[0x1C3B7AC74]();
  v13 = 0;
  objc_msgSend(a1, "createProcessingMarkupViewControllerOutWindow:", &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  v11 = v6;
  v12 = v4;
  v8 = v6;
  performBlockOnMainThreadAndWait();
  objc_msgSend(v8, "createArchivedModelData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v5);
  return v9;
}

uint64_t __45__ICMarkupUtilities_markupModelDataFromData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setData:withArchivedModelData:", *(_QWORD *)(a1 + 40), 0);
}

+ (void)imageDataWithMarkupModelData:sourceImageData:embedData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Markup error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __71__ICMarkupUtilities_embedReturnedMarkupURL_attachment_completionBlock___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
