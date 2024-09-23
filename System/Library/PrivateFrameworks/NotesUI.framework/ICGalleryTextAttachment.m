@implementation ICGalleryTextAttachment

- (double)viewCornerRadius
{
  void *v2;
  int v3;
  double result;

  -[ICAbstractTextAttachment attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "preferredViewSize");

  result = 12.0;
  if (v3 == 1)
    return 16.0;
  return result;
}

- (id)attachmentFileWrapper
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;

  objc_opt_class();
  -[ICAbstractTextAttachment attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachmentModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "blockingGeneratePDFURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v11 = 0;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3650]), "initWithURL:options:error:", v6, 0, &v11);
    v8 = v11;
    if (!v7)
    {
      v9 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[ICGalleryTextAttachment attachmentFileWrapper].cold.1((uint64_t)v8, v9);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)attachmentFileWrapper
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AC7A1000, a2, OS_LOG_TYPE_ERROR, "Failed to create file wrapper from generated PDF: %@", (uint8_t *)&v2, 0xCu);
}

@end
