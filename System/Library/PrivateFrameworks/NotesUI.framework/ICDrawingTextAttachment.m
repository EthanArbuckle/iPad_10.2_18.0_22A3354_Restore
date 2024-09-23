@implementation ICDrawingTextAttachment

- (id)attachmentFileWrapper
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;

  -[ICAbstractTextAttachment attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICAbstractTextAttachment attachment](self, "attachment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D63AF0], "defaultPixelSize");
    objc_msgSend(v4, "attachmentPreviewImageWithMinSize:scale:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = objc_alloc(MEMORY[0x1E0CB3650]);
      objc_msgSend(v5, "orientedPreviewImageURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      v3 = (void *)objc_msgSend(v6, "initWithURL:options:error:", v7, 0, &v11);
      v8 = v11;

      if (v8)
      {
        v9 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[ICDrawingTextAttachment attachmentFileWrapper].cold.1((uint64_t)v8, v9);

      }
    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)attachmentBoundsMargins
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  v17.receiver = self;
  v17.super_class = (Class)ICDrawingTextAttachment;
  -[ICTextAttachment attachmentBoundsMargins](&v17, sel_attachmentBoundsMargins);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[ICAbstractTextAttachment attachment](self, "attachment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "preferredViewSize");

  if (v12)
    v13 = v8;
  else
    v13 = 4.0;
  if (v12)
    v14 = v10;
  else
    v14 = 5.0;
  v15 = v4;
  v16 = v6;
  result.var3 = v14;
  result.var2 = v13;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (BOOL)requiresSpaceAfterAttachmentForPrinting
{
  return 1;
}

- (BOOL)supportsMultipleThumbnailsOnSameLine
{
  return 0;
}

- (double)viewCornerRadius
{
  return 12.0;
}

- (id)printableTextAttachment
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  ICPrintableTextAttachment *v6;
  uint64_t v8;

  -[ICAbstractTextAttachment attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D63AF0], "defaultPixelSize");
  objc_msgSend(v2, "attachmentPreviewImageWithMinSize:scale:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "orientedPreviewImageURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8 = 0;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3650]), "initWithURL:options:error:", v4, 0, &v8);
    v6 = -[ICPrintableTextAttachment initWithFileWrapper:]([ICPrintableTextAttachment alloc], "initWithFileWrapper:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)attachmentFileWrapper
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AC7A1000, a2, OS_LOG_TYPE_ERROR, "Error creating drawing file wrapper: %@", (uint8_t *)&v2, 0xCu);
}

@end
