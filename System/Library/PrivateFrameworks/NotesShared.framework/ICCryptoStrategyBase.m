@implementation ICCryptoStrategyBase

- (int64_t)intrinsicNotesVersion
{
  return 0;
}

- (ICCryptoStrategyBase)initWithCloudSyncingObject:(id)a3
{
  id v4;
  ICCryptoStrategyBase *v5;
  ICCryptoStrategyBase *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICCryptoStrategyBase;
  v5 = -[ICCryptoStrategyBase init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_object, v4);

  return v6;
}

- (void)invalidateStrategy
{
  objc_storeWeak((id *)&self->_object, 0);
}

- (void)performBlockIfObjectExists:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void (**v9)(id, void *);

  v9 = (void (**)(id, void *))a3;
  -[ICCryptoStrategyBase object](self, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "managedObjectContext");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v9)
    {
      if (v8)
        v9[2](v9, v4);
    }
  }

}

- (void)performBlockIfAccountExists:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void (**v10)(id, void *);

  v10 = (void (**)(id, void *))a3;
  -[ICCryptoStrategyBase object](self, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  ICCheckedDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v10)
    {
      if (v9)
        v10[2](v10, v5);
    }
  }

}

- (void)performBlockIfNoteExists:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void (**v10)(id, void *);

  v10 = (void (**)(id, void *))a3;
  -[ICCryptoStrategyBase object](self, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  ICCheckedDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v10)
    {
      if (v9)
        v10[2](v10, v5);
    }
  }

}

- (void)performBlockIfAttachmentExists:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void (**v10)(id, void *);

  v10 = (void (**)(id, void *))a3;
  -[ICCryptoStrategyBase object](self, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  ICCheckedDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v10)
    {
      if (v9)
        v10[2](v10, v5);
    }
  }

}

- (void)performBlockIfPreviewImageExists:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void (**v10)(id, void *);

  v10 = (void (**)(id, void *))a3;
  -[ICCryptoStrategyBase object](self, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  ICCheckedDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v10)
    {
      if (v9)
        v10[2](v10, v5);
    }
  }

}

- (void)performBlockIfMediaExists:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void (**v10)(id, void *);

  v10 = (void (**)(id, void *))a3;
  -[ICCryptoStrategyBase object](self, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  ICCheckedDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v10)
    {
      if (v9)
        v10[2](v10, v5);
    }
  }

}

- (BOOL)canAuthenticate
{
  return 0;
}

- (BOOL)isAuthenticated
{
  return 0;
}

- (BOOL)hasPassphraseSet
{
  return 0;
}

- (NSString)passphraseHint
{
  return 0;
}

- (id)mainKeyForPassphrase:(id)a3
{
  return 0;
}

- (BOOL)isPassphraseCorrect:(id)a3
{
  return 0;
}

- (BOOL)authenticateWithPassphrase:(id)a3
{
  return 0;
}

- (ICEncryptionMetadata)primaryMetadata
{
  return 0;
}

- (ICEncryptionKey)primaryWrappedKey
{
  return 0;
}

- (ICEncryptionObject)primaryEncryptionObject
{
  return 0;
}

- (id)encryptedData:(id)a3 rewrappedWithMainKey:(id)a4
{
  return 0;
}

- (BOOL)rewrapDataAtURL:(id)a3 withMainKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  ICCryptoStrategyBase *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__ICCryptoStrategyBase_rewrapDataAtURL_withMainKey___block_invoke;
  v11[3] = &unk_1E76C8BA8;
  v8 = v6;
  v12 = v8;
  v13 = self;
  v9 = v7;
  v14 = v9;
  v15 = &v16;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v11);
  LOBYTE(self) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)self;
}

void __52__ICCryptoStrategyBase_rewrapDataAtURL_withMainKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  char v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "encryptedData:rewrappedWithMainKey:", v4, *(_QWORD *)(a1 + 48));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = *(_QWORD *)(a1 + 32);
      v12 = 0;
      v8 = -[NSObject writeToURL:options:error:](v5, "writeToURL:options:error:", v7, 1, &v12);
      v9 = v12;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v8;
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      if (*(_BYTE *)(v10 + 24))
      {
        *(_BYTE *)(v10 + 24) = 1;
      }
      else
      {
        v11 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          __52__ICCryptoStrategyBase_rewrapDataAtURL_withMainKey___block_invoke_cold_3();

      }
    }
    else
    {
      v9 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __52__ICCryptoStrategyBase_rewrapDataAtURL_withMainKey___block_invoke_cold_2(v3);

    }
  }
  else
  {
    v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __52__ICCryptoStrategyBase_rewrapDataAtURL_withMainKey___block_invoke_cold_1(v3);
    v6 = v9;
  }

}

- (BOOL)rewrapFile:(id)a3 withMainKey:(id)a4 generationManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__ICCryptoStrategyBase_rewrapFile_withMainKey_generationManager___block_invoke;
  v15[3] = &unk_1E76CD7F8;
  v11 = v8;
  v18 = v11;
  v15[4] = self;
  v12 = v9;
  v16 = v12;
  v13 = v10;
  v17 = v13;
  v19 = &v20;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v15);
  LOBYTE(self) = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return (char)self;
}

void __65__ICCryptoStrategyBase_rewrapFile_withMainKey_generationManager___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  os_log_t v6;
  os_log_t v7;
  char v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v9 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __52__ICCryptoStrategyBase_rewrapDataAtURL_withMainKey___block_invoke_cold_1(v3);
      v6 = v9;
      goto LABEL_28;
    }
    objc_msgSend(*(id *)(a1 + 32), "encryptedData:rewrappedWithMainKey:", v5, *(_QWORD *)(a1 + 40));
    v6 = (os_log_t)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if ((objc_msgSend(*(id *)(a1 + 48), "beginGeneration") & 1) != 0)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
        v7 = (os_log_t)objc_claimAutoreleasedReturnValue();
        if (!v7)
        {
          v11 = os_log_create("com.apple.notes", "Crypto");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            __65__ICCryptoStrategyBase_rewrapFile_withMainKey_generationManager___block_invoke_cold_4(v3);
          v9 = 0;
          goto LABEL_26;
        }
        v12 = 0;
        v8 = -[NSObject writeToURL:options:error:](v6, "writeToURL:options:error:", v7, 1, &v12);
        v9 = v12;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v8;
        v10 = *(void **)(a1 + 48);
        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
        {
          objc_msgSend(v10, "rollbackGeneration");
          v11 = os_log_create("com.apple.notes", "Crypto");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            __52__ICCryptoStrategyBase_rewrapDataAtURL_withMainKey___block_invoke_cold_3();
          goto LABEL_26;
        }
        if ((objc_msgSend(v10, "commitGeneration") & 1) == 0)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
          v11 = os_log_create("com.apple.notes", "Crypto");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            __65__ICCryptoStrategyBase_rewrapFile_withMainKey_generationManager___block_invoke_cold_6(v3);
LABEL_26:

        }
LABEL_27:

LABEL_28:
        goto LABEL_29;
      }
      v7 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __65__ICCryptoStrategyBase_rewrapFile_withMainKey_generationManager___block_invoke_cold_7(v3);
    }
    else
    {
      v7 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __52__ICCryptoStrategyBase_rewrapDataAtURL_withMainKey___block_invoke_cold_2(v3);
    }
    v9 = v7;
    goto LABEL_27;
  }
  v6 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __65__ICCryptoStrategyBase_rewrapFile_withMainKey_generationManager___block_invoke_cold_1(v3);
  v5 = v6;
LABEL_29:

}

- (BOOL)rewrapWithMainKey:(id)a3
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
    -[ICCryptoStrategyBase rewrapWithMainKey:].cold.1(self, v5);

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __42__ICCryptoStrategyBase_rewrapWithMainKey___block_invoke;
  v13[3] = &unk_1E76CD820;
  v15 = &v16;
  v13[4] = self;
  v6 = v4;
  v14 = v6;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v13);
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
    v25 = "-[ICCryptoStrategyBase rewrapWithMainKey:]";
    v26 = 1024;
    v27 = 324;
    _os_log_debug_impl(&dword_1BD918000, v7, OS_LOG_TYPE_DEBUG, "Rewrapped object with main key {object: %@, success: %@}%s:%d", buf, 0x26u);

  }
  v8 = *((_BYTE *)v17 + 24) != 0;

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __42__ICCryptoStrategyBase_rewrapWithMainKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  const char *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "isUnsupported"))
  {
    v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "shortLoggingDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v5;
      v6 = "Not rewrapping object because it is unsupported {object: %@}";
LABEL_7:
      _os_log_impl(&dword_1BD918000, v4, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v9, 0xCu);

      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (objc_msgSend(v3, "needsInitialFetchFromCloud"))
  {
    v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "shortLoggingDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v5;
      v6 = "Not rewrapping object because it needs initial fetch {object: %@}";
      goto LABEL_7;
    }
LABEL_14:

    goto LABEL_15;
  }
  if ((objc_msgSend(v3, "mergeUnappliedEncryptedRecord") & 1) == 0)
  {
    v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __42__ICCryptoStrategyBase_rewrapWithMainKey___block_invoke_cold_2(v3);
    goto LABEL_14;
  }
  objc_msgSend(v3, "primaryEncryptedData");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "encryptedData:rewrappedWithMainKey:", v4, *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setPrimaryEncryptedData:", v7);
      objc_msgSend(v3, "updateChangeCountWithReason:", CFSTR("Rewrapped object"));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      v8 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __42__ICCryptoStrategyBase_rewrapWithMainKey___block_invoke_cold_1(v3);

    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
LABEL_15:

}

- (BOOL)hasSameKeyAsObject:(id)a3
{
  return 0;
}

- (id)encryptData:(id)a3
{
  return 0;
}

- (BOOL)encryptFileFromURL:(id)a3 toURL:(id)a4
{
  id v6;
  char *v7;
  NSObject *v8;
  id v9;
  char *v10;
  NSObject *v11;
  BOOL v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  ICCryptoStrategyBase *v24;
  char *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (char *)a4;
  v8 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    -[ICCryptoStrategyBase object](self, "object");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "shortLoggingDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v32 = v15;
    v33 = 2112;
    v34 = v6;
    v35 = 2112;
    v37 = 2080;
    v36 = v7;
    v38 = "-[ICCryptoStrategyBase encryptFileFromURL:toURL:]";
    v39 = 1024;
    v40 = 343;
    _os_log_debug_impl(&dword_1BD918000, v8, OS_LOG_TYPE_DEBUG, "Encrypting file… {object: %@, sourceURL: %@, destinationURL: %@}%s:%d", buf, 0x30u);

  }
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __49__ICCryptoStrategyBase_encryptFileFromURL_toURL___block_invoke;
  v22 = &unk_1E76CD848;
  v9 = v6;
  v23 = v9;
  v24 = self;
  v26 = &v27;
  v10 = v7;
  v25 = v10;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", &v19);
  v11 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    -[ICCryptoStrategyBase object](self, "object", v19, v20, v21, v22, v23, v24);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "shortLoggingDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v28 + 24));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v32 = v17;
    v33 = 2112;
    v35 = 2080;
    v34 = v18;
    v36 = "-[ICCryptoStrategyBase encryptFileFromURL:toURL:]";
    v37 = 1024;
    LODWORD(v38) = 371;
    _os_log_debug_impl(&dword_1BD918000, v11, OS_LOG_TYPE_DEBUG, "Encrypted file {object: %@, success: %@}%s:%d", buf, 0x26u);

  }
  v12 = *((_BYTE *)v28 + 24) != 0;

  _Block_object_dispose(&v27, 8);
  return v12;
}

void __49__ICCryptoStrategyBase_encryptFileFromURL_toURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v4, 0, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  if (!v5)
  {
    v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __49__ICCryptoStrategyBase_encryptFileFromURL_toURL___block_invoke_cold_1();
    v7 = v8;
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 40), "encryptData:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __49__ICCryptoStrategyBase_encryptFileFromURL_toURL___block_invoke_cold_2(v3);
    goto LABEL_11;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "serialize:toURL:", v7, *(_QWORD *)(a1 + 48));
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __49__ICCryptoStrategyBase_encryptFileFromURL_toURL___block_invoke_cold_3(v3);
LABEL_11:

LABEL_12:
  }

}

- (id)encryptSidecarData:(id)a3
{
  return 0;
}

- (BOOL)encryptSidecarFileFromURL:(id)a3 toURL:(id)a4
{
  id v6;
  char *v7;
  NSObject *v8;
  id v9;
  char *v10;
  NSObject *v11;
  BOOL v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  ICCryptoStrategyBase *v24;
  char *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (char *)a4;
  v8 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    -[ICCryptoStrategyBase object](self, "object");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "shortLoggingDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v32 = v15;
    v33 = 2112;
    v34 = v6;
    v35 = 2112;
    v37 = 2080;
    v36 = v7;
    v38 = "-[ICCryptoStrategyBase encryptSidecarFileFromURL:toURL:]";
    v39 = 1024;
    v40 = 383;
    _os_log_debug_impl(&dword_1BD918000, v8, OS_LOG_TYPE_DEBUG, "Encrypting sidecar file… {object: %@, sourceURL: %@, destinationURL: %@}%s:%d", buf, 0x30u);

  }
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __56__ICCryptoStrategyBase_encryptSidecarFileFromURL_toURL___block_invoke;
  v22 = &unk_1E76CD848;
  v9 = v6;
  v23 = v9;
  v24 = self;
  v26 = &v27;
  v10 = v7;
  v25 = v10;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", &v19);
  v11 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    -[ICCryptoStrategyBase object](self, "object", v19, v20, v21, v22, v23, v24);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "shortLoggingDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v28 + 24));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v32 = v17;
    v33 = 2112;
    v35 = 2080;
    v34 = v18;
    v36 = "-[ICCryptoStrategyBase encryptSidecarFileFromURL:toURL:]";
    v37 = 1024;
    LODWORD(v38) = 411;
    _os_log_debug_impl(&dword_1BD918000, v11, OS_LOG_TYPE_DEBUG, "Encrypted sidecar file {object: %@, success: %@}%s:%d", buf, 0x26u);

  }
  v12 = *((_BYTE *)v28 + 24) != 0;

  _Block_object_dispose(&v27, 8);
  return v12;
}

void __56__ICCryptoStrategyBase_encryptSidecarFileFromURL_toURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  char v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v4, 0, &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v14;
  if (!v5)
  {
    v12 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __56__ICCryptoStrategyBase_encryptSidecarFileFromURL_toURL___block_invoke_cold_1();
    v8 = v12;
    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 40), "encryptSidecarData:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    v12 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __56__ICCryptoStrategyBase_encryptSidecarFileFromURL_toURL___block_invoke_cold_2(v3);
    goto LABEL_12;
  }
  v9 = *(_QWORD *)(a1 + 48);
  v13 = v6;
  v10 = -[NSObject writeToURL:options:error:](v7, "writeToURL:options:error:", v9, 1, &v13);
  v11 = v13;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v10;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v12 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __56__ICCryptoStrategyBase_encryptSidecarFileFromURL_toURL___block_invoke_cold_3();
    v6 = v11;
LABEL_12:

LABEL_13:
    v11 = v6;
  }

}

- (BOOL)serialize:(id)a3 toURL:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  NSObject *v11;
  BOOL v12;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  ICCryptoStrategyBase *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[ICCryptoStrategyBase serialize:toURL:].cold.1(self);

  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __40__ICCryptoStrategyBase_serialize_toURL___block_invoke;
  v20 = &unk_1E76CD848;
  v9 = v7;
  v21 = v9;
  v10 = v6;
  v23 = self;
  v24 = &v25;
  v22 = v10;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", &v17);
  v11 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    -[ICCryptoStrategyBase object](self, "object", v17, v18, v19, v20, v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "shortLoggingDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v26 + 24));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v30 = v15;
    v31 = 2112;
    v33 = 2080;
    v32 = v16;
    v34 = "-[ICCryptoStrategyBase serialize:toURL:]";
    v35 = 1024;
    v36 = 445;
    _os_log_debug_impl(&dword_1BD918000, v11, OS_LOG_TYPE_DEBUG, "Serialized encryption object {object: %@, success: %@}%s:%d", buf, 0x26u);

  }
  v12 = *((_BYTE *)v26 + 24) != 0;

  _Block_object_dispose(&v25, 8);
  return v12;
}

void __40__ICCryptoStrategyBase_serialize_toURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

  objc_msgSend(*(id *)(a1 + 40), "serialized");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = *(_QWORD *)(a1 + 32);
    v15 = 0;
    v10 = objc_msgSend(v7, "writeToURL:options:error:", v9, 1, &v15);
    v11 = v15;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v10;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      if ((v6 & 1) == 0)
      {
        v12 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          __40__ICCryptoStrategyBase_serialize_toURL___block_invoke_cold_3(a1, v12);

        objc_msgSend(v3, "resetToIntrinsicNotesVersionAndPropagateToChildObjects");
      }
    }
    else
    {
      v14 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __40__ICCryptoStrategyBase_serialize_toURL___block_invoke_cold_2();

    }
  }
  else
  {
    v13 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __40__ICCryptoStrategyBase_serialize_toURL___block_invoke_cold_1(v3);

    v11 = 0;
  }

}

- (BOOL)saveEncryptedJSON
{
  return 0;
}

- (BOOL)mainKeyDecryptsPrimaryData:(id)a3
{
  return 0;
}

- (id)decryptData:(id)a3
{
  return 0;
}

- (id)decryptedDataFromFileURL:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  ICCryptoStrategyBase *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICCryptoStrategyBase decryptedDataFromFileURL:].cold.1(self);

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__44;
  v21 = __Block_byref_object_dispose__44;
  v22 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49__ICCryptoStrategyBase_decryptedDataFromFileURL___block_invoke;
  v13[3] = &unk_1E76C8BD0;
  v6 = v4;
  v15 = self;
  v16 = &v17;
  v14 = v6;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v13);
  v7 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    -[ICCryptoStrategyBase object](self, "object");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shortLoggingDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v18[5] != 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v24 = v11;
    v25 = 2112;
    v27 = 2080;
    v26 = v12;
    v28 = "-[ICCryptoStrategyBase decryptedDataFromFileURL:]";
    v29 = 1024;
    v30 = 491;
    _os_log_debug_impl(&dword_1BD918000, v7, OS_LOG_TYPE_DEBUG, "Decrypted file {object: %@, success: %@}%s:%d", buf, 0x26u);

  }
  v8 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __49__ICCryptoStrategyBase_decryptedDataFromFileURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v4, 0, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  if (!v5)
  {
    v10 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __49__ICCryptoStrategyBase_decryptedDataFromFileURL___block_invoke_cold_1();
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 40), "decryptData:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v10 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __49__ICCryptoStrategyBase_decryptedDataFromFileURL___block_invoke_cold_2();
LABEL_7:

  }
}

- (id)decryptSidecarData:(id)a3
{
  return 0;
}

- (id)decryptedSidecarDataFromFileURL:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  ICCryptoStrategyBase *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICCryptoStrategyBase decryptedSidecarDataFromFileURL:].cold.1(self);

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__44;
  v21 = __Block_byref_object_dispose__44;
  v22 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__ICCryptoStrategyBase_decryptedSidecarDataFromFileURL___block_invoke;
  v13[3] = &unk_1E76C8BD0;
  v6 = v4;
  v15 = self;
  v16 = &v17;
  v14 = v6;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v13);
  v7 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    -[ICCryptoStrategyBase object](self, "object");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shortLoggingDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v18[5] != 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v24 = v11;
    v25 = 2112;
    v27 = 2080;
    v26 = v12;
    v28 = "-[ICCryptoStrategyBase decryptedSidecarDataFromFileURL:]";
    v29 = 1024;
    v30 = 524;
    _os_log_debug_impl(&dword_1BD918000, v7, OS_LOG_TYPE_DEBUG, "Decrypted sidecar file {object: %@, success: %@}%s:%d", buf, 0x26u);

  }
  v8 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __56__ICCryptoStrategyBase_decryptedSidecarDataFromFileURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v4, 0, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  if (!v5)
  {
    v10 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __56__ICCryptoStrategyBase_decryptedSidecarDataFromFileURL___block_invoke_cold_1();
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 40), "decryptSidecarData:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v10 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __56__ICCryptoStrategyBase_decryptedSidecarDataFromFileURL___block_invoke_cold_2();
LABEL_7:

  }
}

- (BOOL)loadDecryptedValuesIfNecessary
{
  return 0;
}

- (BOOL)isRecordAuthenticated:(id)a3
{
  return 0;
}

- (BOOL)mergeEncryptedDataFromRecord:(id)a3
{
  return 0;
}

- (BOOL)recordHasChangedPassphrase:(id)a3
{
  return 0;
}

- (ICCloudSyncingObject)object
{
  return (ICCloudSyncingObject *)objc_loadWeakRetained((id *)&self->_object);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_object);
}

void __52__ICCryptoStrategyBase_rewrapDataAtURL_withMainKey___block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Not rewrapping data at URL because encrypted data is nil {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __52__ICCryptoStrategyBase_rewrapDataAtURL_withMainKey___block_invoke_cold_2(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot rewrap data at URL {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __52__ICCryptoStrategyBase_rewrapDataAtURL_withMainKey___block_invoke_cold_3()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v0, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Cannot write rewrapped data {object: %@, error: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __65__ICCryptoStrategyBase_rewrapFile_withMainKey_generationManager___block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Not rewrapping data at URL because URL is nil {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __65__ICCryptoStrategyBase_rewrapFile_withMainKey_generationManager___block_invoke_cold_4(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Not rewrapping data at URL because next URL is nil {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __65__ICCryptoStrategyBase_rewrapFile_withMainKey_generationManager___block_invoke_cold_6(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot commit generation to rewrap data at URL {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __65__ICCryptoStrategyBase_rewrapFile_withMainKey_generationManager___block_invoke_cold_7(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot begin generation to rewrap data at URL {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)rewrapWithMainKey:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint8_t v5[12];
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shortLoggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  v6 = 2080;
  v7 = "-[ICCryptoStrategyBase rewrapWithMainKey:]";
  v8 = 1024;
  v9 = 280;
  _os_log_debug_impl(&dword_1BD918000, a2, OS_LOG_TYPE_DEBUG, "Rewrapping object with main key… {object: %@}%s:%d", v5, 0x1Cu);

  OUTLINED_FUNCTION_7();
}

void __42__ICCryptoStrategyBase_rewrapWithMainKey___block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Not rewrapping object because its data cannot be rewrapped {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __42__ICCryptoStrategyBase_rewrapWithMainKey___block_invoke_cold_2(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Not rewrapping object because merging unapplied record failed {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __49__ICCryptoStrategyBase_encryptFileFromURL_toURL___block_invoke_cold_1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v0, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Cannot read file to encrypt — failing {object: %@, error: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __49__ICCryptoStrategyBase_encryptFileFromURL_toURL___block_invoke_cold_2(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot encrypt file — failing {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __49__ICCryptoStrategyBase_encryptFileFromURL_toURL___block_invoke_cold_3(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot serialize encryption object to file — failing {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __56__ICCryptoStrategyBase_encryptSidecarFileFromURL_toURL___block_invoke_cold_1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v0, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Cannot read sidecar file to encrypt — failing {object: %@, error: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __56__ICCryptoStrategyBase_encryptSidecarFileFromURL_toURL___block_invoke_cold_2(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot encrypt sidecar file — failing {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __56__ICCryptoStrategyBase_encryptSidecarFileFromURL_toURL___block_invoke_cold_3()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v0, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Cannot write serialized sidecar encryption object — failing {object: %@, error: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)serialize:(void *)a1 toURL:.cold.1(void *a1)
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
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_8_2(&dword_1BD918000, v3, v4, "Serializing encryption object… {object: %@, destinationURL: %@}%s:%d", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

void __40__ICCryptoStrategyBase_serialize_toURL___block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot serialize encryption object — failing {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __40__ICCryptoStrategyBase_serialize_toURL___block_invoke_cold_2()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v0, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Cannot write serialized encryption object — failing {object: %@, error: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __40__ICCryptoStrategyBase_serialize_toURL___block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 48), "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shortLoggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_1BD918000, a2, OS_LOG_TYPE_DEBUG, "Resetting intrinsic Notes version for first encryption… {object: %@}", v5, 0xCu);

  OUTLINED_FUNCTION_2();
}

- (void)decryptedDataFromFileURL:(void *)a1 .cold.1(void *a1)
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
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_8_2(&dword_1BD918000, v3, v4, "Decrypting file… {object: %@, fileURL: %@}%s:%d", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

void __49__ICCryptoStrategyBase_decryptedDataFromFileURL___block_invoke_cold_1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v0, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v2, v3, "Cannot read file to decrypt — returning nil {object: %@, error: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __49__ICCryptoStrategyBase_decryptedDataFromFileURL___block_invoke_cold_2()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v0, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Cannot decrypt file {object: %@, error: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)decryptedSidecarDataFromFileURL:(void *)a1 .cold.1(void *a1)
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
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_8_2(&dword_1BD918000, v3, v4, "Decrypting sidecar file… {object: %@, fileURL: %@}%s:%d", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

void __56__ICCryptoStrategyBase_decryptedSidecarDataFromFileURL___block_invoke_cold_1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v0, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v2, v3, "Cannot read sidecar file to decrypt — returning nil {object: %@, error: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __56__ICCryptoStrategyBase_decryptedSidecarDataFromFileURL___block_invoke_cold_2()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v0, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Cannot decrypt sidecar file {object: %@, error: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

@end
