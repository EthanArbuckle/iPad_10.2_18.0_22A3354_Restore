@implementation ICAttachmentPreviewGeneratorOperation

- (ICAttachmentPreviewGeneratorOperation)initWithAttachmentManagedObjectID:(id)a3
{
  id v4;
  ICAttachmentPreviewGeneratorOperation *v5;
  ICAttachmentPreviewGeneratorOperation *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICAttachmentPreviewGeneratorOperation;
  v5 = -[ICAttachmentPreviewGeneratorOperation init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ICAttachmentPreviewGeneratorOperation setAttachmentID:](v5, "setAttachmentID:", v4);

  return v6;
}

- (unint64_t)type
{
  return 1;
}

- (void)main
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  _QWORD v14[7];
  _QWORD v15[8];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  _QWORD v20[5];
  id v21;

  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "workerManagedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentPreviewGeneratorOperation setManagedObjectContext:](self, "setManagedObjectContext:", v5);

  -[ICAttachmentPreviewGeneratorOperation managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAutomaticallyMergesChangesFromParent:", 0);

  -[ICAttachmentPreviewGeneratorOperation managedObjectContext](self, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIc_debugName:", CFSTR("previewGenerator"));

  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__61;
  v20[4] = __Block_byref_object_dispose__61;
  v21 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[ICAttachmentPreviewGeneratorOperation managedObjectContext](self, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __45__ICAttachmentPreviewGeneratorOperation_main__block_invoke;
  v15[3] = &unk_1E5C1EE78;
  v15[4] = self;
  v15[5] = v20;
  v15[6] = &v16;
  v15[7] = a2;
  objc_msgSend(v8, "performBlockAndWait:", v15);

  if (!*((_BYTE *)v17 + 24)
    || (-[ICAttachmentPreviewGeneratorOperation attachmentModel](self, "attachmentModel"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "generatePreviewsInOperation:", self),
        v10,
        (v11 & 1) != 0))
  {
    -[ICAttachmentPreviewGeneratorOperation managedObjectContext](self, "managedObjectContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __45__ICAttachmentPreviewGeneratorOperation_main__block_invoke_10;
    v14[3] = &unk_1E5C1E5A8;
    v14[4] = self;
    v14[5] = v20;
    v14[6] = a2;
    objc_msgSend(v12, "performBlockAndWait:", v14);

  }
  -[ICAttachmentPreviewGeneratorOperation setManagedObjectContext:](self, "setManagedObjectContext:", 0);
  +[ICAttachmentPreviewGenerator sharedGenerator](ICAttachmentPreviewGenerator, "sharedGenerator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "operationComplete:", self);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);

}

void __45__ICAttachmentPreviewGeneratorOperation_main__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)v2, "attachmentID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v3, "existingObjectWithID:error:", v4, &v20);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v20;
  v7 = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

  v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(v2 + 8) + 8) + 40);
  if (v9)
  {
    objc_msgSend(v9, "attachmentModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)v2, "setAttachmentModel:", v10);

    if ((objc_msgSend(*(id *)v2, "isCancelled") & 1) == 0
      && (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "isDeleted") & 1) == 0)
    {
      objc_msgSend(*(id *)v2, "attachmentModel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "needToGeneratePreviews");

      if (v12)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  else if (v6)
  {
    v13 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __45__ICAttachmentPreviewGeneratorOperation_main__block_invoke_cold_1((id *)v2, (uint64_t)v6, v13);

  }
  v14 = os_log_create("com.apple.notes", "PreviewGeneration");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "shortLoggingDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 138413058;
    v22 = v16;
    v23 = 2112;
    v24 = v17;
    v25 = 2112;
    v26 = v18;
    v27 = 1024;
    v28 = v19;
    _os_log_debug_impl(&dword_1AC7A1000, v14, OS_LOG_TYPE_DEBUG, "%@ %@ %@ generate %d", buf, 0x26u);

  }
}

uint64_t __45__ICAttachmentPreviewGeneratorOperation_main__block_invoke_10(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;

  v2 = os_log_create("com.apple.notes", "PreviewGeneration");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __45__ICAttachmentPreviewGeneratorOperation_main__block_invoke_10_cold_1(a1, v2);

  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "attachmentModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "shortLoggingDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ic_saveWithLogDescription:", CFSTR("Saving after preview creation for %@"), v6);

    +[ICAttachmentPreviewGenerator sharedGenerator](ICAttachmentPreviewGenerator, "sharedGenerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postProcessIfNeededForAttachment:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

    v8 = *MEMORY[0x1E0D63660];
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "ic_postNotificationOnMainThreadWithName:", *MEMORY[0x1E0D63660]);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "parentAttachment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attachmentModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "shouldGeneratePreviewAfterChangeInSubAttachmentWithIdentifier:", v11);

    if (v12)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "parentAttachment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "ic_postNotificationOnMainThreadWithName:", v8);

    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "setAttachmentModel:", 0);
}

- (void)cancel
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICAttachmentPreviewGeneratorOperation;
  -[ICAttachmentPreviewGeneratorOperation cancel](&v6, sel_cancel);
  -[ICAttachmentPreviewGeneratorOperation managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__ICAttachmentPreviewGeneratorOperation_cancel__block_invoke;
  v5[3] = &unk_1E5C1D540;
  v5[4] = self;
  objc_msgSend(v3, "performBlock:", v5);

  +[ICAttachmentPreviewGenerator sharedGenerator](ICAttachmentPreviewGenerator, "sharedGenerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "operationComplete:", self);

}

void __47__ICAttachmentPreviewGeneratorOperation_cancel__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "attachmentModel");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "didCancelPreviewGeneratorOperation");

}

- (NSManagedObjectID)attachmentID
{
  return (NSManagedObjectID *)objc_getProperty(self, a2, 248, 1);
}

- (void)setAttachmentID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (NSManagedObjectContext)managedObjectContext
{
  return (NSManagedObjectContext *)objc_getProperty(self, a2, 256, 1);
}

- (void)setManagedObjectContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (ICAttachmentModel)attachmentModel
{
  return (ICAttachmentModel *)objc_getProperty(self, a2, 264, 1);
}

- (void)setAttachmentModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentModel, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_attachmentID, 0);
}

void __45__ICAttachmentPreviewGeneratorOperation_main__block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "attachmentID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1AC7A1000, a3, OS_LOG_TYPE_ERROR, "Error getting object from ID %@ for preview generation %@", (uint8_t *)&v6, 0x16u);

}

void __45__ICAttachmentPreviewGeneratorOperation_main__block_invoke_10_cold_1(uint64_t a1, NSObject *a2)
{
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(*(SEL *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "shortLoggingDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = v5;
  v10 = 2112;
  v11 = v6;
  v12 = 2112;
  v13 = v7;
  _os_log_debug_impl(&dword_1AC7A1000, a2, OS_LOG_TYPE_DEBUG, "%@ %@ %@ generation complete", (uint8_t *)&v8, 0x20u);

}

@end
