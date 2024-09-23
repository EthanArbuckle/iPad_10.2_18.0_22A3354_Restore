@implementation ICAttachmentPreviewImageCryptoStrategyV1

- (BOOL)writeEncryptedMetadata:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  ICAttachmentPreviewImageCryptoStrategyV1 *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedMetadata___block_invoke;
  v7[3] = &unk_1E76CB988;
  v5 = v4;
  v8 = v5;
  v9 = self;
  v10 = &v11;
  -[ICCryptoStrategyBase performBlockIfPreviewImageExists:](self, "performBlockIfPreviewImageExists:", v7);
  LOBYTE(self) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

void __67__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedMetadata___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, void *, void *);
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  if ((objc_msgSend(v3, "isPasswordProtected") & 1) != 0)
  {
    objc_msgSend(v3, "willChangeValueForKey:", CFSTR("metadata"));
    if (*(_QWORD *)(a1 + 32))
    {
      v4 = (void *)objc_opt_class();
      v5 = *(_QWORD *)(a1 + 32);
      v6 = MEMORY[0x1E0C809B0];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __67__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedMetadata___block_invoke_3;
      v13[3] = &unk_1E76C73F8;
      v14 = v3;
      v8 = v6;
      v9 = 3221225472;
      v10 = __67__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedMetadata___block_invoke_6;
      v11 = &unk_1E76CD698;
      v12 = v14;
      objc_msgSend(v4, "encryptWithMainKeyOfObject:dataToEncrypt:failureHandler:successHandler:", v12, v5, v13, &v8);

    }
    else
    {
      objc_msgSend(v3, "setEncryptedMetadata:", 0);
      objc_msgSend(v3, "setCryptoMetadataInitializationVector:", 0);
      objc_msgSend(v3, "setCryptoMetadataTag:", 0);
    }
    objc_msgSend(v3, "setPrimitiveValue:forKey:", 0, CFSTR("metadata"), v8, v9, v10, v11);
    objc_msgSend(v3, "didChangeValueForKey:", CFSTR("metadata"));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    v7 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __67__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedMetadata___block_invoke_cold_3(v3);

  }
}

void __67__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedMetadata___block_invoke_3(uint64_t a1)
{
  NSObject *v2;

  v2 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __67__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedMetadata___block_invoke_3_cold_1(a1);

}

void __67__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedMetadata___block_invoke_6(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v7;
  id v8;
  id v9;

  v7 = *(void **)(a1 + 32);
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "setEncryptedMetadata:", a2);
  objc_msgSend(*(id *)(a1 + 32), "setCryptoMetadataInitializationVector:", v8);

  objc_msgSend(*(id *)(a1 + 32), "setCryptoMetadataTag:", v9);
}

- (BOOL)writeEncryptedImageData:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedImageData___block_invoke;
  v7[3] = &unk_1E76CB988;
  v7[4] = self;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[ICCryptoStrategyBase performBlockIfPreviewImageExists:](self, "performBlockIfPreviewImageExists:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __68__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedImageData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD v16[4];
  NSObject *v17;

  v3 = a2;
  if (objc_msgSend(v3, "isUnsupported"))
  {
    v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __68__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedImageData___block_invoke_cold_1(v3);
LABEL_11:
    v5 = v4;
    goto LABEL_12;
  }
  if ((objc_msgSend(v3, "isPasswordProtected") & 1) == 0)
  {
    v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __68__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedImageData___block_invoke_cold_5(v3);
    goto LABEL_11;
  }
  objc_msgSend(v3, "encryptedPreviewImageURL");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = os_log_create("com.apple.notes", "Crypto");
  v4 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __68__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedImageData___block_invoke_cold_3(v3, (uint64_t)v5, v4);

    v7 = (void *)objc_opt_class();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __68__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedImageData___block_invoke_9;
    v16[3] = &unk_1E76C73F8;
    v17 = v3;
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __68__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedImageData___block_invoke_10;
    v12[3] = &unk_1E76CD6C0;
    v5 = v5;
    v13 = v5;
    v10 = v17;
    v11 = *(_QWORD *)(a1 + 48);
    v14 = v10;
    v15 = v11;
    objc_msgSend(v7, "encryptWithMainKeyOfObject:dataToEncrypt:failureHandler:successHandler:", v10, v8, v16, v12);

    v4 = v17;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __68__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedImageData___block_invoke_cold_2(v3);

  }
LABEL_12:

}

void __68__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedImageData___block_invoke_9(uint64_t a1)
{
  NSObject *v2;

  v2 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __68__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedImageData___block_invoke_9_cold_1(a1);

}

void __68__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedImageData___block_invoke_10(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  char v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v16[4];
  NSObject *v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;

  v7 = a3;
  v8 = a4;
  v9 = *(_QWORD *)(a1 + 32);
  v21 = 0;
  v10 = objc_msgSend(a2, "writeToURL:options:error:", v9, 1, &v21);
  v11 = v21;
  if ((v10 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __68__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedImageData___block_invoke_11;
    v16[3] = &unk_1E76C93F0;
    v17 = *(id *)(a1 + 40);
    v18 = v7;
    v13 = v8;
    v14 = *(_QWORD *)(a1 + 48);
    v19 = v13;
    v20 = v14;
    objc_msgSend(v12, "performBlockAndWait:", v16);

    v15 = v17;
  }
  else
  {
    v15 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __68__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedImageData___block_invoke_10_cold_1(a1);

  }
}

void __68__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedImageData___block_invoke_11(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setCryptoTag:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setCryptoInitializationVector:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "ic_postNotificationOnMainThreadAfterSaveWithName:", CFSTR("ICAttachmentPreviewImagesDidUpdateNotification"));

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
}

- (id)decryptedMetadata
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__40;
  v9 = __Block_byref_object_dispose__40;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__ICAttachmentPreviewImageCryptoStrategyV1_decryptedMetadata__block_invoke;
  v4[3] = &unk_1E76CD670;
  v4[4] = self;
  v4[5] = &v5;
  -[ICCryptoStrategyBase performBlockIfPreviewImageExists:](self, "performBlockIfPreviewImageExists:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __61__ICAttachmentPreviewImageCryptoStrategyV1_decryptedMetadata__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  ICEncryptedData *v5;
  void *v6;
  void *v7;
  void *v8;
  ICEncryptedData *v9;
  NSObject *v10;
  NSObject *v11;

  v3 = a2;
  if ((objc_msgSend(v3, "isPasswordProtected") & 1) == 0)
  {
    v10 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __61__ICAttachmentPreviewImageCryptoStrategyV1_decryptedMetadata__block_invoke_cold_2(v3, v10);
    v9 = (ICEncryptedData *)v10;
    goto LABEL_8;
  }
  objc_msgSend(v3, "encryptedMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = [ICEncryptedData alloc];
    objc_msgSend(v3, "encryptedMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cryptoMetadataTag");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cryptoMetadataInitializationVector");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ICEncryptedData initWithData:tag:initializationVector:](v5, "initWithData:tag:initializationVector:", v6, v7, v8);

    objc_msgSend((id)objc_opt_class(), "decryptWithMainKeyOfObject:encryptedData:fallbackAttemptSuccessCleanupHandler:", v3, v9, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v10);
    }
    else
    {
      v11 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __61__ICAttachmentPreviewImageCryptoStrategyV1_decryptedMetadata__block_invoke_cold_1(v3);

    }
LABEL_8:

  }
}

- (id)decryptedImageData
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__40;
  v9 = __Block_byref_object_dispose__40;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__ICAttachmentPreviewImageCryptoStrategyV1_decryptedImageData__block_invoke;
  v4[3] = &unk_1E76CBA00;
  v4[4] = &v5;
  -[ICCryptoStrategyBase performBlockIfPreviewImageExists:](self, "performBlockIfPreviewImageExists:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __62__ICAttachmentPreviewImageCryptoStrategyV1_decryptedImageData__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint64_t v18;

  v3 = a2;
  objc_msgSend(v3, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workerManagedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v3, "managedObjectContext");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__ICAttachmentPreviewImageCryptoStrategyV1_decryptedImageData__block_invoke_2;
  v14[3] = &unk_1E76C93F0;
  v15 = v3;
  v16 = v4;
  v10 = *(_QWORD *)(a1 + 32);
  v17 = v9;
  v18 = v10;
  v11 = v9;
  v12 = v4;
  v13 = v3;
  objc_msgSend(v11, "performBlockAndWait:", v14);

}

void __62__ICAttachmentPreviewImageCryptoStrategyV1_decryptedImageData__block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend((id)objc_opt_class(), "ic_existingObjectWithID:context:", a1[5], a1[6]);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    objc_msgSend(v7, "cryptoStrategy");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_decryptedImageData");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1[7] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

- (id)_decryptedImageData
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__40;
  v9 = __Block_byref_object_dispose__40;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__ICAttachmentPreviewImageCryptoStrategyV1__decryptedImageData__block_invoke;
  v4[3] = &unk_1E76CB9D8;
  v4[4] = self;
  v4[5] = &v5;
  -[ICCryptoStrategyBase performBlockIfPreviewImageExists:](self, "performBlockIfPreviewImageExists:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __63__ICAttachmentPreviewImageCryptoStrategyV1__decryptedImageData__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t *v18;
  _QWORD v19[5];
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v3 = a2;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__40;
  v29 = __Block_byref_object_dispose__40;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__40;
  v19[4] = __Block_byref_object_dispose__40;
  v20 = 0;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__ICAttachmentPreviewImageCryptoStrategyV1__decryptedImageData__block_invoke_2;
  v14[3] = &unk_1E76CD6E8;
  v16 = v19;
  v5 = v3;
  v15 = v5;
  v17 = &v21;
  v18 = &v25;
  objc_msgSend(v4, "performBlockAndWait:", v14);

  if (*((_BYTE *)v22 + 24))
  {
    v6 = v26[5];
    if (v6)
    {
      v13 = 0;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v6, 0, &v13);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v13;
      v9 = os_log_create("com.apple.notes", "Crypto");
      v10 = v9;
      if (!v7 || v8)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          __63__ICAttachmentPreviewImageCryptoStrategyV1__decryptedImageData__block_invoke_cold_3();
      }
      else
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          __63__ICAttachmentPreviewImageCryptoStrategyV1__decryptedImageData__block_invoke_cold_4();

        objc_msgSend(*(id *)(a1 + 32), "decryptData:", v7);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v10 = *(NSObject **)(v12 + 40);
        *(_QWORD *)(v12 + 40) = v11;
      }

    }
    else
    {
      v8 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        __63__ICAttachmentPreviewImageCryptoStrategyV1__decryptedImageData__block_invoke_cold_2();
    }
  }
  else
  {
    v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __63__ICAttachmentPreviewImageCryptoStrategyV1__decryptedImageData__block_invoke_cold_1();
  }

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

}

void __63__ICAttachmentPreviewImageCryptoStrategyV1__decryptedImageData__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "isPasswordProtected");
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "encryptedPreviewImageURL");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

void __67__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedMetadata___block_invoke_3_cold_1(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v2 = (void *)objc_opt_class();
  v3 = *(void **)(a1 + 32);
  v4 = v2;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v6, v7, "Could not encrypt metadata for %@ (%@)", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_2();
}

void __68__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedImageData___block_invoke_cold_3(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "ic_loggingIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  _os_log_debug_impl(&dword_1BD918000, a3, OS_LOG_TYPE_DEBUG, "Encrypting V1 preview image %@ to: %@", v5, 0x16u);

  OUTLINED_FUNCTION_2();
}

void __68__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedImageData___block_invoke_9_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "ic_loggingIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Error encrypting preview image: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __68__ICAttachmentPreviewImageCryptoStrategyV1_writeEncryptedImageData___block_invoke_10_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 40), "ic_loggingIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Error writing encrypted preview image (%@): %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __61__ICAttachmentPreviewImageCryptoStrategyV1_decryptedMetadata__block_invoke_cold_1(void *a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = (id)objc_opt_class();
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v4, v5, "Error decrypting metadata for %@ (%@)", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

void __61__ICAttachmentPreviewImageCryptoStrategyV1_decryptedMetadata__block_invoke_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_1BD918000, a2, OS_LOG_TYPE_DEBUG, "attachment preview image is not password-protected, but decryptedMetadata is called. %@", v4, 0xCu);

  OUTLINED_FUNCTION_4_0();
}

void __63__ICAttachmentPreviewImageCryptoStrategyV1__decryptedImageData__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_0_2(&dword_1BD918000, v0, v1, "Trying to decrypt non-password-protected preview image %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __63__ICAttachmentPreviewImageCryptoStrategyV1__decryptedImageData__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_0_2(&dword_1BD918000, v0, v1, "No encrypted preview image URL when decrypting %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __63__ICAttachmentPreviewImageCryptoStrategyV1__decryptedImageData__block_invoke_cold_3()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_7();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_1BD918000, v1, OS_LOG_TYPE_ERROR, "Error loading encrypted preview image for %@: %@", v2, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

void __63__ICAttachmentPreviewImageCryptoStrategyV1__decryptedImageData__block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_0_2(&dword_1BD918000, v0, v1, "Decrypting preview image %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
