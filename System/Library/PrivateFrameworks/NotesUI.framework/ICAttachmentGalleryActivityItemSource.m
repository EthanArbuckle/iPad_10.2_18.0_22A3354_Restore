@implementation ICAttachmentGalleryActivityItemSource

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99E98];
  -[ICAttachmentActivityItemSource attachment](self, "attachment", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICDocCamPDFGenerator versionPDFPathForAttachment:](ICDocCamPDFGenerator, "versionPDFPathForAttachment:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  return (id)objc_msgSend((id)*MEMORY[0x1E0CEC4E0], "identifier", a3, a4);
}

- (id)activityViewController:(id)a3 attachmentNameForActivityType:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;

  -[ICAttachmentActivityItemSource attachment](self, "attachment", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0D639F0];
  objc_msgSend((id)*MEMORY[0x1E0CEC570], "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filenameExtensionForUTI:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v5, "pathExtension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
    {
      objc_msgSend(v5, "stringByAppendingPathExtension:", v8);
      v11 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v11;
    }
  }

  return v5;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__75;
  v21 = __Block_byref_object_dispose__75;
  v22 = 0;
  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workerManagedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __84__ICAttachmentGalleryActivityItemSource_activityViewController_itemForActivityType___block_invoke;
  v14[3] = &unk_1E5C1DC18;
  v14[4] = self;
  v10 = v9;
  v15 = v10;
  v16 = &v17;
  objc_msgSend(v10, "performBlockAndWait:", v14);
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CEB1C0]))
  {
    v11 = (void *)v18[5];
    v18[5] = 0;

  }
  v12 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v12;
}

void __84__ICAttachmentGalleryActivityItemSource_activityViewController_itemForActivityType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v4 = *(void **)(a1 + 40);
  v14 = 0;
  objc_msgSend(v4, "existingObjectWithID:error:", v3, &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v14;
  ICDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = v6 == 0;
  else
    v8 = 0;
  if (v8)
  {
    v10 = (void *)MEMORY[0x1E0C99E98];
    +[ICDocCamPDFGenerator versionPDFPathForAttachment:](ICDocCamPDFGenerator, "versionPDFPathForAttachment:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fileURLWithPath:", v9);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
  else
  {
    v9 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __84__ICAttachmentGalleryActivityItemSource_activityViewController_itemForActivityType___block_invoke_cold_1((uint64_t)v6, v9);
  }

}

void __84__ICAttachmentGalleryActivityItemSource_activityViewController_itemForActivityType___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AC7A1000, a2, OS_LOG_TYPE_ERROR, "ICAttachmentGalleryActivityItemSource could not find attachment %@", (uint8_t *)&v2, 0xCu);
}

@end
