@implementation ICAttachmentPaperBundleModel(UI)

- (ICAttachmentPaperBundleActivityItemSource)activityItem
{
  ICAttachmentPaperBundleActivityItemSource *v2;
  void *v3;
  ICAttachmentPaperBundleActivityItemSource *v4;

  v2 = [ICAttachmentPaperBundleActivityItemSource alloc];
  objc_msgSend(a1, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ICAttachmentActivityItemSource initWithAttachment:](v2, "initWithAttachment:", v3);

  return v4;
}

- (id)activityItems
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "activityItem");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  if (v1)
  {
    v5[0] = v1;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v3;
}

- (void)drawPreviewInRect:()UI
{
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = (void *)MEMORY[0x1AF445E78]();
  objc_msgSend(a1, "attachment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isPasswordProtected"))
  {

  }
  else
  {
    objc_msgSend(a1, "attachment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "hasFallbackPDF");

    if (v13)
    {
      v14 = objc_alloc(MEMORY[0x1E0CD0DB8]);
      objc_msgSend(a1, "attachment");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "fallbackPDFURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v14, "initWithURL:", v16);

      goto LABEL_10;
    }
  }
  objc_msgSend(a1, "attachment");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "fallbackPDFData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v19 = os_log_create("com.apple.notes", "SystemPaper");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(a1, "attachment");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "ic_loggingIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412290;
      v26 = v21;
      _os_log_impl(&dword_1AC7A1000, v19, OS_LOG_TYPE_INFO, "Fallback PDF data didn't exist for attachment, taking some extra time to generate it: %@", (uint8_t *)&v25, 0xCu);

    }
    v22 = (void *)objc_opt_class();
    objc_msgSend(a1, "attachment");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "generateFallbackPDFDataForAttachment:", v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD0DB8]), "initWithData:", v15);
LABEL_10:

  if (!v17)
  {
    v24 = os_log_create("com.apple.notes", "SystemPaper");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[ICAttachmentPaperBundleModel(UI) drawPreviewInRect:].cold.1(a1);
    goto LABEL_16;
  }
  if (!+[ICPDFPreviewHelper drawPreviewOfPDFDocument:inRect:](ICPDFPreviewHelper, "drawPreviewOfPDFDocument:inRect:", v17, a2, a3, a4, a5))
  {
    v24 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[ICAttachmentPDFModel(UI) drawPreviewInRect:].cold.2(a1);
LABEL_16:

  }
  objc_autoreleasePoolPop(v10);
}

- (void)drawPreviewInRect:()UI .cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "attachment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ic_loggingIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_6(&dword_1AC7A1000, v3, v4, "Unable to generate PDF Document from fallback PDF Data for attachment: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_4();
}

@end
