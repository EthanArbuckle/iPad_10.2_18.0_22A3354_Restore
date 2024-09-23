@implementation ICAttachmentPreviewGeneratorImageClassificationOperation

- (unint64_t)type
{
  return 3;
}

- (void)main
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[8];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  _QWORD v17[5];
  id v18;

  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "workerManagedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentPreviewGeneratorImageClassificationOperation setManagedObjectContext:](self, "setManagedObjectContext:", v5);

  -[ICAttachmentPreviewGeneratorImageClassificationOperation managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIc_debugName:", CFSTR("ImageClassificationOperationContext"));

  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__55;
  v17[4] = __Block_byref_object_dispose__55;
  v18 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[ICAttachmentPreviewGeneratorImageClassificationOperation managedObjectContext](self, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__ICAttachmentPreviewGeneratorImageClassificationOperation_main__block_invoke;
  v12[3] = &unk_1E5C1EE78;
  v12[4] = self;
  v12[5] = v17;
  v12[6] = &v13;
  v12[7] = a2;
  objc_msgSend(v7, "performBlockAndWait:", v12);

  if (*((_BYTE *)v14 + 24))
  {
    -[ICAttachmentPreviewGeneratorImageClassificationOperation attachmentModel](self, "attachmentModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "classifyImageInOperation:", self);
  }
  else
  {
    -[ICAttachmentPreviewGeneratorImageClassificationOperation managedObjectContext](self, "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __64__ICAttachmentPreviewGeneratorImageClassificationOperation_main__block_invoke_10;
    v11[3] = &unk_1E5C1DE18;
    v11[4] = v17;
    objc_msgSend(v9, "performBlockAndWait:", v11);
  }

  +[ICAttachmentPreviewGenerator sharedGenerator](ICAttachmentPreviewGenerator, "sharedGenerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "operationComplete:", self);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(v17, 8);

}

void __64__ICAttachmentPreviewGeneratorImageClassificationOperation_main__block_invoke(uint64_t a1)
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
  NSObject *v11;
  void *v12;
  int v13;
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
  if (!v9)
  {
    if (!v6)
      goto LABEL_12;
    v11 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __64__ICAttachmentPreviewGeneratorImageClassificationOperation_main__block_invoke_cold_1((id *)v2, (uint64_t)v6, v11);

    goto LABEL_11;
  }
  objc_msgSend(v9, "attachmentModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)v2, "setAttachmentModel:", v10);

  if ((objc_msgSend(*(id *)v2, "isCancelled") & 1) != 0
    || (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "isDeleted") & 1) != 0)
  {
    goto LABEL_12;
  }
  objc_msgSend(*(id *)v2, "attachmentModel");
  v11 = objc_claimAutoreleasedReturnValue();
  if ((-[NSObject needToPostProcessAttachment](v11, "needToPostProcessAttachment") & 1) == 0)
  {
LABEL_11:

    goto LABEL_12;
  }
  objc_msgSend(*(id *)v2, "attachmentModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "supportsImageClassification");

  if (v13)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
LABEL_12:
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
    _os_log_debug_impl(&dword_1AC7A1000, v14, OS_LOG_TYPE_DEBUG, "%@ %@ %@ image classifcation %d", buf, 0x26u);

  }
}

void __64__ICAttachmentPreviewGeneratorImageClassificationOperation_main__block_invoke_10(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.notes", "PreviewGeneration");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1AC7A1000, v2, OS_LOG_TYPE_INFO, "Skipping image classification for attachment because it is either cancelled or not needed: %@", (uint8_t *)&v4, 0xCu);

  }
}

- (NSManagedObjectContext)managedObjectContext
{
  return (NSManagedObjectContext *)objc_getProperty(self, a2, 272, 1);
}

- (void)setManagedObjectContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (ICAttachmentModel)attachmentModel
{
  return (ICAttachmentModel *)objc_getProperty(self, a2, 280, 1);
}

- (void)setAttachmentModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentModel, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

void __64__ICAttachmentPreviewGeneratorImageClassificationOperation_main__block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
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
  _os_log_error_impl(&dword_1AC7A1000, a3, OS_LOG_TYPE_ERROR, "Error getting object from ID %@ for image classification %@", (uint8_t *)&v6, 0x16u);

}

@end
