@implementation ICAttachmentPDFModel(UI)

- (void)genericListThumbnailCreator
{
  return &__block_literal_global_17;
}

- (void)genericBrickThumbnailCreator
{
  return &__block_literal_global_8;
}

- (void)drawPreviewInRect:()UI
{
  void *v10;
  int v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  objc_super v19;

  objc_msgSend(a1, "attachment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "preferredViewSize");

  if (v11 == 1)
  {
    v19.receiver = a1;
    v19.super_class = (Class)&off_1EED37E10;
    objc_msgSendSuper2(&v19, sel_drawPreviewInRect_, a2, a3, a4, a5);
    return;
  }
  v12 = (void *)MEMORY[0x1AF445E78]();
  v13 = objc_alloc(MEMORY[0x1E0CD0DB8]);
  objc_msgSend(a1, "attachment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "media");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "mediaURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v13, "initWithURL:", v16);

  if (!v17)
  {
    v18 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[ICAttachmentPDFModel(UI) drawPreviewInRect:].cold.1(a1);
    goto LABEL_9;
  }
  if (!+[ICPDFPreviewHelper drawPreviewOfPDFDocument:inRect:](ICPDFPreviewHelper, "drawPreviewOfPDFDocument:inRect:", v17, a2, a3, a4, a5))
  {
    v18 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[ICAttachmentPDFModel(UI) drawPreviewInRect:].cold.2(a1);
LABEL_9:

  }
  objc_autoreleasePoolPop(v12);
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
  OUTLINED_FUNCTION_0_6(&dword_1AC7A1000, v3, v4, "Unable to load pdfData/mediaURL for attachment while previewing note: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_4();
}

- (void)drawPreviewInRect:()UI .cold.2(void *a1)
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
  OUTLINED_FUNCTION_0_6(&dword_1AC7A1000, v3, v4, "Unable to draw preview for attachment: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_4();
}

@end
