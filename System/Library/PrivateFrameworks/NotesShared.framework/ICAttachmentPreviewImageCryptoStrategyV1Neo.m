@implementation ICAttachmentPreviewImageCryptoStrategyV1Neo

- (BOOL)writeEncryptedMetadata:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  BOOL v8;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  ICAttachmentPreviewImageCryptoStrategyV1Neo *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICAttachmentPreviewImageCryptoStrategyV1Neo writeEncryptedMetadata:].cold.1(self);

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__ICAttachmentPreviewImageCryptoStrategyV1Neo_writeEncryptedMetadata___block_invoke;
  v13[3] = &unk_1E76CB988;
  v6 = v4;
  v14 = v6;
  v15 = self;
  v16 = &v17;
  -[ICCryptoStrategyBase performBlockIfPreviewImageExists:](self, "performBlockIfPreviewImageExists:", v13);
  v7 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    -[ICCryptoStrategyBase object](self, "object");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shortLoggingDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v18 + 24));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v22 = v11;
    v23 = 2112;
    v25 = 2080;
    v24 = v12;
    v26 = "-[ICAttachmentPreviewImageCryptoStrategyV1Neo writeEncryptedMetadata:]";
    v27 = 1024;
    v28 = 43;
    _os_log_debug_impl(&dword_1BD918000, v7, OS_LOG_TYPE_DEBUG, "Encrypted preview image metadata {previewImage: %@, success: %@}%s:%d", buf, 0x26u);

  }
  v8 = *((_BYTE *)v18 + 24) != 0;

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __70__ICAttachmentPreviewImageCryptoStrategyV1Neo_writeEncryptedMetadata___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (!*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v4, "serializeEncryptedMetadata:");
    goto LABEL_5;
  }
  objc_msgSend(v4, "encryptData:");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(*(id *)(a1 + 40), "serializeEncryptedMetadata:", v5);

LABEL_5:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    goto LABEL_9;
  }
  v7 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __70__ICAttachmentPreviewImageCryptoStrategyV1Neo_writeEncryptedMetadata___block_invoke_cold_1(v3);

LABEL_9:
}

- (BOOL)writeEncryptedImageData:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  BOOL v8;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICAttachmentPreviewImageCryptoStrategyV1Neo writeEncryptedImageData:].cold.1(self);

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __71__ICAttachmentPreviewImageCryptoStrategyV1Neo_writeEncryptedImageData___block_invoke;
  v13[3] = &unk_1E76CB988;
  v13[4] = self;
  v6 = v4;
  v14 = v6;
  v15 = &v16;
  -[ICCryptoStrategyBase performBlockIfPreviewImageExists:](self, "performBlockIfPreviewImageExists:", v13);
  v7 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    -[ICCryptoStrategyBase object](self, "object");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shortLoggingDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v17 + 24));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v21 = v11;
    v22 = 2112;
    v24 = 2080;
    v23 = v12;
    v25 = "-[ICAttachmentPreviewImageCryptoStrategyV1Neo writeEncryptedImageData:]";
    v26 = 1024;
    v27 = 77;
    _os_log_debug_impl(&dword_1BD918000, v7, OS_LOG_TYPE_DEBUG, "Encrypted preview image data {previewImage: %@, success: %@}%s:%d", buf, 0x26u);

  }
  v8 = *((_BYTE *)v17 + 24) != 0;

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __71__ICAttachmentPreviewImageCryptoStrategyV1Neo_writeEncryptedImageData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(v3, "encryptedPreviewImageURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "encryptData:", *(_QWORD *)(a1 + 40));
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "serialize:toURL:", v5, v4);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      {
        objc_msgSend(v3, "managedObjectContext");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __71__ICAttachmentPreviewImageCryptoStrategyV1Neo_writeEncryptedImageData___block_invoke_3;
        v8[3] = &unk_1E76C73F8;
        v9 = v3;
        objc_msgSend(v6, "performBlockAndWait:", v8);

        goto LABEL_13;
      }
      v7 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __71__ICAttachmentPreviewImageCryptoStrategyV1Neo_writeEncryptedImageData___block_invoke_cold_3(v3);
    }
    else
    {
      v7 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __71__ICAttachmentPreviewImageCryptoStrategyV1Neo_writeEncryptedImageData___block_invoke_cold_2(v3);
    }

    goto LABEL_13;
  }
  v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __71__ICAttachmentPreviewImageCryptoStrategyV1Neo_writeEncryptedImageData___block_invoke_cold_1(v3);

LABEL_13:
}

void __71__ICAttachmentPreviewImageCryptoStrategyV1Neo_writeEncryptedImageData___block_invoke_3(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "resetToIntrinsicNotesVersionAndPropagateToChildObjects");
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "ic_postNotificationOnMainThreadAfterSaveWithName:", CFSTR("ICAttachmentPreviewImagesDidUpdateNotification"));

}

- (void)serializeEncryptedMetadata:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__ICAttachmentPreviewImageCryptoStrategyV1Neo_serializeEncryptedMetadata___block_invoke;
  v6[3] = &unk_1E76CB9B0;
  v7 = v4;
  v5 = v4;
  -[ICCryptoStrategyBase performBlockIfPreviewImageExists:](self, "performBlockIfPreviewImageExists:", v6);

}

void __74__ICAttachmentPreviewImageCryptoStrategyV1Neo_serializeEncryptedMetadata___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  NSStringFromSelector(sel_metadata);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "willChangeValueForKey:", v4);

  objc_msgSend(*(id *)(a1 + 32), "serialized");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (*(_QWORD *)(a1 + 32) && !v5)
  {
    v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __74__ICAttachmentPreviewImageCryptoStrategyV1Neo_serializeEncryptedMetadata___block_invoke_cold_1(v3);

    objc_msgSend(v3, "setEncryptedMetadata:", 0);
LABEL_9:
    v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "shortLoggingDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v9;
      v10 = "Set nil preview image metadata {object: %@}";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  objc_msgSend(v3, "setEncryptedMetadata:", v5);
  if (!v6)
    goto LABEL_9;
  v8 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "shortLoggingDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v9;
    v10 = "Set non-nil preview image metadata {object: %@}";
LABEL_11:
    _os_log_impl(&dword_1BD918000, v8, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v13, 0xCu);

  }
LABEL_12:

  NSStringFromSelector(sel_metadata);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPrimitiveValue:forKey:", 0, v11);

  NSStringFromSelector(sel_metadata);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didChangeValueForKey:", v12);

}

- (id)decryptedMetadata
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[ICAttachmentPreviewImageCryptoStrategyV1Neo decryptedMetadata].cold.1(self);

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__29;
  v15 = __Block_byref_object_dispose__29;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__ICAttachmentPreviewImageCryptoStrategyV1Neo_decryptedMetadata__block_invoke;
  v10[3] = &unk_1E76CB9D8;
  v10[4] = self;
  v10[5] = &v11;
  -[ICCryptoStrategyBase performBlockIfPreviewImageExists:](self, "performBlockIfPreviewImageExists:", v10);
  v4 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    -[ICCryptoStrategyBase object](self, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shortLoggingDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12[5] != 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v18 = v8;
    v19 = 2112;
    v21 = 2080;
    v20 = v9;
    v22 = "-[ICAttachmentPreviewImageCryptoStrategyV1Neo decryptedMetadata]";
    v23 = 1024;
    v24 = 125;
    _os_log_debug_impl(&dword_1BD918000, v4, OS_LOG_TYPE_DEBUG, "Decrypted preview image metadata {previewImage: %@, success: %@}%s:%d", buf, 0x26u);

  }
  v5 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v5;
}

void __64__ICAttachmentPreviewImageCryptoStrategyV1Neo_decryptedMetadata__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "encryptedMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "shortLoggingDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_1BD918000, v8, OS_LOG_TYPE_INFO, "Cannot decrypt preview image metadata because it is nil {previewImage: %@}", (uint8_t *)&v10, 0xCu);

    }
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "decryptData:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __64__ICAttachmentPreviewImageCryptoStrategyV1Neo_decryptedMetadata__block_invoke_cold_1(v3);
LABEL_7:

  }
}

- (id)decryptedImageData
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[ICAttachmentPreviewImageCryptoStrategyV1Neo decryptedImageData].cold.1(self);

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__29;
  v15 = __Block_byref_object_dispose__29;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__ICAttachmentPreviewImageCryptoStrategyV1Neo_decryptedImageData__block_invoke;
  v10[3] = &unk_1E76CBA00;
  v10[4] = &v11;
  -[ICCryptoStrategyBase performBlockIfPreviewImageExists:](self, "performBlockIfPreviewImageExists:", v10);
  v4 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    -[ICCryptoStrategyBase object](self, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shortLoggingDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12[5] != 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v18 = v8;
    v19 = 2112;
    v21 = 2080;
    v20 = v9;
    v22 = "-[ICAttachmentPreviewImageCryptoStrategyV1Neo decryptedImageData]";
    v23 = 1024;
    v24 = 161;
    _os_log_debug_impl(&dword_1BD918000, v4, OS_LOG_TYPE_DEBUG, "Decrypted preview image data {previewImage: %@, success: %@}%s:%d", buf, 0x26u);

  }
  v5 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v5;
}

void __65__ICAttachmentPreviewImageCryptoStrategyV1Neo_decryptedImageData__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "workerManagedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(v3, "managedObjectContext");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__ICAttachmentPreviewImageCryptoStrategyV1Neo_decryptedImageData__block_invoke_2;
  v11[3] = &unk_1E76C95A8;
  v12 = v3;
  v13 = v8;
  v14 = *(_QWORD *)(a1 + 32);
  v9 = v8;
  v10 = v3;
  objc_msgSend(v9, "performBlockAndWait:", v11);

}

void __65__ICAttachmentPreviewImageCryptoStrategyV1Neo_decryptedImageData__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  os_log_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;

  v2 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_existingObjectWithID:context:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "encryptedPreviewImageURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v11 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __65__ICAttachmentPreviewImageCryptoStrategyV1Neo_decryptedImageData__block_invoke_2_cold_2(v4);
      v7 = v11;
      goto LABEL_14;
    }
    objc_opt_class();
    objc_msgSend(v4, "cryptoStrategy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v7 = (os_log_t)objc_claimAutoreleasedReturnValue();

    -[NSObject decryptedDataFromFileURL:](v7, "decryptedDataFromFileURL:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)
      && objc_msgSend(v5, "ic_isReachable"))
    {
      v11 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __65__ICAttachmentPreviewImageCryptoStrategyV1Neo_decryptedImageData__block_invoke_2_cold_3(v4);

LABEL_14:
    }
  }
  else
  {
    v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __65__ICAttachmentPreviewImageCryptoStrategyV1Neo_decryptedImageData__block_invoke_2_cold_1();
    v5 = v7;
  }

}

- (void)writeEncryptedMetadata:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "object");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1_3(&dword_1BD918000, v3, v4, "Encrypting preview image metadata… {previewImage: %@}%s:%d", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

void __70__ICAttachmentPreviewImageCryptoStrategyV1Neo_writeEncryptedMetadata___block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot encrypt preview image metadata {previewImage: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)writeEncryptedImageData:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "object");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1_3(&dword_1BD918000, v3, v4, "Encrypting preview image data… {previewImage: %@}%s:%d", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

void __71__ICAttachmentPreviewImageCryptoStrategyV1Neo_writeEncryptedImageData___block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot encrypt preview image data because URL is nil {previewImage: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __71__ICAttachmentPreviewImageCryptoStrategyV1Neo_writeEncryptedImageData___block_invoke_cold_2(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot encrypt preview image data {previewImage: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __71__ICAttachmentPreviewImageCryptoStrategyV1Neo_writeEncryptedImageData___block_invoke_cold_3(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot serialize preview image data {previewImage: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __74__ICAttachmentPreviewImageCryptoStrategyV1Neo_serializeEncryptedMetadata___block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot serialize preview image metadata encryption object {previewImage: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)decryptedMetadata
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "object");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1_3(&dword_1BD918000, v3, v4, "Decrypting preview image metadata… {previewImage: %@}%s:%d", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

void __64__ICAttachmentPreviewImageCryptoStrategyV1Neo_decryptedMetadata__block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot decrypt preview image metadata {previewImage: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)decryptedImageData
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "object");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1_3(&dword_1BD918000, v3, v4, "Decrypting preview image data… {previewImage: %@}%s:%d", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

void __65__ICAttachmentPreviewImageCryptoStrategyV1Neo_decryptedImageData__block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(0, "objectID");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v1, v2, "Cannot encrypt preview image data because object vanished {previewImageID: %@}", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_0();
}

void __65__ICAttachmentPreviewImageCryptoStrategyV1Neo_decryptedImageData__block_invoke_2_cold_2(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot decrypt preview image data because URL is nil {previewImage: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __65__ICAttachmentPreviewImageCryptoStrategyV1Neo_decryptedImageData__block_invoke_2_cold_3(void *a1)
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

@end
