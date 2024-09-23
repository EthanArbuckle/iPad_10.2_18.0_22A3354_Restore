@implementation ICAttachmentPreviewImageCryptoStrategyV2

- (BOOL)writeEncryptedMetadata:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  ICAttachmentPreviewImageCryptoStrategyV2 *v9;
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
  v7[2] = __67__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedMetadata___block_invoke;
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

void __67__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedMetadata___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;

  v3 = a2;
  if (objc_msgSend(v3, "isUnsupported"))
  {
    v4 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __67__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedMetadata___block_invoke_cold_1(v3);
LABEL_10:

    goto LABEL_11;
  }
  if ((objc_msgSend(v3, "isPasswordProtected") & 1) == 0)
  {
    v4 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __67__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedMetadata___block_invoke_cold_3(v3);
    goto LABEL_10;
  }
  v5 = *(void **)(a1 + 40);
  if (!*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v5, "serializeToEncryptedMetadata:");
    goto LABEL_12;
  }
  objc_msgSend(v5, "encryptData:");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "serializeToEncryptedMetadata:", v4);
  }
  else
  {
    v6 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __67__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedMetadata___block_invoke_cold_2(v3);

  }
LABEL_11:

LABEL_12:
}

- (BOOL)writeEncryptedImageData:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  ICAttachmentPreviewImageCryptoStrategyV2 *v9;
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
  v7[2] = __68__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedImageData___block_invoke;
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

void __68__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedImageData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  NSObject *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!objc_msgSend(v3, "isUnsupported"))
  {
    if ((objc_msgSend(v3, "isPasswordProtected") & 1) == 0)
    {
      v4 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __68__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedImageData___block_invoke_cold_5(v3);
      goto LABEL_13;
    }
    objc_msgSend(v3, "encryptedPreviewImageURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = os_log_create("com.apple.notes", "Crypto");
    v7 = v6;
    if (!v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __68__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedImageData___block_invoke_cold_2(v3);
      v4 = v7;
      goto LABEL_22;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v3, "ic_loggingIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(*(id *)(a1 + 32), "length");
      *(_DWORD *)buf = 138412802;
      v14 = v9;
      v15 = 2048;
      v16 = v10;
      v17 = 2112;
      v18 = v5;
      _os_log_debug_impl(&dword_1BD918000, v7, OS_LOG_TYPE_DEBUG, "Encrypting V2 preview image (%@) with size (%lu) to: %@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "encryptData:", *(_QWORD *)(a1 + 32));
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "serialize:toURL:", v4, v5);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      {
        objc_msgSend(v3, "managedObjectContext");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __68__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedImageData___block_invoke_4;
        v11[3] = &unk_1E76C73F8;
        v12 = v3;
        objc_msgSend(v8, "performBlockAndWait:", v11);

        v7 = v12;
LABEL_22:

        goto LABEL_23;
      }
      v7 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __68__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedImageData___block_invoke_cold_4(v3);
    }
    else
    {
      v7 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __68__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedImageData___block_invoke_cold_3(v3);
    }

    goto LABEL_22;
  }
  v4 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __68__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedImageData___block_invoke_cold_1(v3);
LABEL_13:
  v5 = v4;
LABEL_23:

}

void __68__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedImageData___block_invoke_4(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "resetToIntrinsicNotesVersionAndPropagateToChildObjects");
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "ic_postNotificationOnMainThreadAfterSaveWithName:", CFSTR("ICAttachmentPreviewImagesDidUpdateNotification"));

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
  v8 = __Block_byref_object_copy__39;
  v9 = __Block_byref_object_dispose__39;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__ICAttachmentPreviewImageCryptoStrategyV2_decryptedMetadata__block_invoke;
  v4[3] = &unk_1E76CB9D8;
  v4[4] = self;
  v4[5] = &v5;
  -[ICCryptoStrategyBase performBlockIfPreviewImageExists:](self, "performBlockIfPreviewImageExists:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __61__ICAttachmentPreviewImageCryptoStrategyV2_decryptedMetadata__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "isPasswordProtected") & 1) == 0)
  {
    v10 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __61__ICAttachmentPreviewImageCryptoStrategyV2_decryptedMetadata__block_invoke_cold_2(v3);
    goto LABEL_8;
  }
  objc_msgSend(v3, "encryptedMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v10 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "shortLoggingDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v11;
      _os_log_impl(&dword_1BD918000, v10, OS_LOG_TYPE_INFO, "No encrypted metadata for %@", (uint8_t *)&v12, 0xCu);

    }
    goto LABEL_8;
  }
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v3, "encryptedMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decryptData:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v10 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __61__ICAttachmentPreviewImageCryptoStrategyV2_decryptedMetadata__block_invoke_cold_1(v3);
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
  v8 = __Block_byref_object_copy__39;
  v9 = __Block_byref_object_dispose__39;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__ICAttachmentPreviewImageCryptoStrategyV2_decryptedImageData__block_invoke;
  v4[3] = &unk_1E76CBA00;
  v4[4] = &v5;
  -[ICCryptoStrategyBase performBlockIfPreviewImageExists:](self, "performBlockIfPreviewImageExists:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __62__ICAttachmentPreviewImageCryptoStrategyV2_decryptedImageData__block_invoke(uint64_t a1, void *a2)
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
  v14[2] = __62__ICAttachmentPreviewImageCryptoStrategyV2_decryptedImageData__block_invoke_2;
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

void __62__ICAttachmentPreviewImageCryptoStrategyV2_decryptedImageData__block_invoke_2(_QWORD *a1)
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
    ICCheckedDynamicCast();
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
  v8 = __Block_byref_object_copy__39;
  v9 = __Block_byref_object_dispose__39;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__ICAttachmentPreviewImageCryptoStrategyV2__decryptedImageData__block_invoke;
  v4[3] = &unk_1E76CB9D8;
  v4[4] = self;
  v4[5] = &v5;
  -[ICCryptoStrategyBase performBlockIfPreviewImageExists:](self, "performBlockIfPreviewImageExists:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __63__ICAttachmentPreviewImageCryptoStrategyV2__decryptedImageData__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;

  v3 = a2;
  if ((objc_msgSend(v3, "isPasswordProtected") & 1) == 0)
  {
    v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __63__ICAttachmentPreviewImageCryptoStrategyV2__decryptedImageData__block_invoke_cold_3(v3);
    v4 = v8;
    goto LABEL_13;
  }
  objc_msgSend(v3, "encryptedPreviewImageURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __63__ICAttachmentPreviewImageCryptoStrategyV2__decryptedImageData__block_invoke_cold_1(v3);
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 32), "decryptedDataFromFileURL:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) && objc_msgSend(v4, "ic_isReachable"))
  {
    v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __63__ICAttachmentPreviewImageCryptoStrategyV2__decryptedImageData__block_invoke_cold_2(v3);
LABEL_12:

LABEL_13:
  }

}

- (BOOL)serializeToEncryptedMetadata:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
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
  v7[2] = __73__ICAttachmentPreviewImageCryptoStrategyV2_serializeToEncryptedMetadata___block_invoke;
  v7[3] = &unk_1E76CD670;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[ICCryptoStrategyBase performBlockIfPreviewImageExists:](self, "performBlockIfPreviewImageExists:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __73__ICAttachmentPreviewImageCryptoStrategyV2_serializeToEncryptedMetadata___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "willChangeValueForKey:", CFSTR("metadata"));
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v4, "serialized");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(v3, "setEncryptedMetadata:", v5);
      v7 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v3, "shortLoggingDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412290;
        v12 = v8;
        _os_log_impl(&dword_1BD918000, v7, OS_LOG_TYPE_INFO, "Successfully encrypted data for %@", (uint8_t *)&v11, 0xCu);

      }
      goto LABEL_12;
    }
    v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __73__ICAttachmentPreviewImageCryptoStrategyV2_serializeToEncryptedMetadata___block_invoke_cold_1(v3);

  }
  objc_msgSend(v3, "setEncryptedMetadata:", 0);
  v7 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "shortLoggingDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v10;
    _os_log_impl(&dword_1BD918000, v7, OS_LOG_TYPE_INFO, "Setting nil to encrypted data for %@", (uint8_t *)&v11, 0xCu);

  }
  v6 = v7;
LABEL_12:

  objc_msgSend(v3, "setPrimitiveValue:forKey:", 0, CFSTR("metadata"));
  objc_msgSend(v3, "didChangeValueForKey:", CFSTR("metadata"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

}

void __67__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedMetadata___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "attachment preview image is not supported, but writeEncryptedMetadata is called. %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __67__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedMetadata___block_invoke_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Failed to encrypt preview image: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __67__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedMetadata___block_invoke_cold_3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "attachment preview image is not password-protected, but writeEncryptedMetadata is called. %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __68__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedImageData___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "ic_loggingIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Attachment preview image is not supported, but writeEncryptedImageData is called. %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __68__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedImageData___block_invoke_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "ic_loggingIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "No encrypted preview image URL when encrypting %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __68__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedImageData___block_invoke_cold_3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "ic_loggingIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Failed to encrypt data for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __68__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedImageData___block_invoke_cold_4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "ic_loggingIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Error writing encrypted preview image for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __68__ICAttachmentPreviewImageCryptoStrategyV2_writeEncryptedImageData___block_invoke_cold_5(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "ic_loggingIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Attachment preview image is not password-protected, but writeEncryptedImageData is called. %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __61__ICAttachmentPreviewImageCryptoStrategyV2_decryptedMetadata__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Error decrypting metadata for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __61__ICAttachmentPreviewImageCryptoStrategyV2_decryptedMetadata__block_invoke_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "attachment preview image is not password-protected, but decryptedMetadata is called. %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __63__ICAttachmentPreviewImageCryptoStrategyV2__decryptedImageData__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "No encrypted preview image URL when decrypting %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __63__ICAttachmentPreviewImageCryptoStrategyV2__decryptedImageData__block_invoke_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot decrypt preview image for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __63__ICAttachmentPreviewImageCryptoStrategyV2__decryptedImageData__block_invoke_cold_3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Trying to decrypt non-password-protected preview image %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __73__ICAttachmentPreviewImageCryptoStrategyV2_serializeToEncryptedMetadata___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Failed to encode encrypted object for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

@end
