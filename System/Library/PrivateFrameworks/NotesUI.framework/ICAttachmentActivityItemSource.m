@implementation ICAttachmentActivityItemSource

- (ICAttachmentActivityItemSource)initWithAttachment:(id)a3
{
  id v4;
  ICAttachmentActivityItemSource *v5;
  ICAttachmentActivityItemSource *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICAttachmentActivityItemSource;
  v5 = -[ICAttachmentActivityItemSource init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ICAttachmentActivityItemSource setAttachment:](v5, "setAttachment:", v4);

  return v6;
}

- (NSString)attachmentTypeUTI
{
  void *v2;
  void *v3;

  -[ICAttachmentActivityItemSource attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "typeUTI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "data", a3);
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  int v5;
  uint64_t v6;
  BOOL v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a4, "isEqualToString:", *MEMORY[0x1E0CEB1C0]);
  v6 = *MEMORY[0x1E0D637F0];
  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
    return 0;
  -[ICAttachmentActivityItemSource attachment](self, "attachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pasteboardData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v13 = v6;
    objc_msgSend(v10, "persistenceData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  if (objc_msgSend(a4, "isEqualToString:", *MEMORY[0x1E0CEB1C0]))
    return (id)*MEMORY[0x1E0D637F0];
  else
    return &stru_1E5C2F8C0;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  double v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  -[ICAttachmentActivityItemSource attachment](self, "attachment", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isTable") & 1) != 0)
  {
    v5 = 0;
LABEL_6:

    return v5;
  }
  -[ICAttachmentActivityItemSource attachment](self, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "usesLinkPresentation");

  if ((v7 & 1) == 0)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CC11A8]);
    -[ICAttachmentActivityItemSource attachment](self, "attachment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3BF8], "ic_scale");
    objc_msgSend(v8, "attachmentPreviewImageWithMinSize:scale:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_alloc(MEMORY[0x1E0CB36C8]);
    objc_msgSend(v4, "previewImageURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithContentsOfURL:", v11);
    objc_msgSend(v5, "setIconProvider:", v12);

    -[ICAttachmentActivityItemSource attachmentFileName](self, "attachmentFileName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:", v13);

    goto LABEL_6;
  }
  v5 = 0;
  return v5;
}

- (NSString)attachmentFileName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;

  -[ICAttachmentActivityItemSource attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "length"))
  {
    -[ICAttachmentActivityItemSource attachment](self, "attachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "note");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  -[ICAttachmentActivityItemSource attachmentTypeUTI](self, "attachmentTypeUTI");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D639F0], "filenameFromUTI:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v9;
  }
  if (!objc_msgSend(v4, "length"))
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "name.length != 0", "-[ICAttachmentActivityItemSource attachmentFileName]", 1, 0, CFSTR("Empty filename for uti %@"), v8);
  objc_msgSend(MEMORY[0x1E0D639F0], "filenameExtensionForUTI:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v4, "pathExtension");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqual:", v10);

    if ((v12 & 1) == 0)
    {
      objc_msgSend(v4, "stringByAppendingPathExtension:", v10);
      v13 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v13;
    }
  }

  return (NSString *)v4;
}

- (ICAttachment)attachment
{
  return (ICAttachment *)objc_loadWeakRetained((id *)&self->_attachment);
}

- (void)setAttachment:(id)a3
{
  objc_storeWeak((id *)&self->_attachment, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_attachment);
}

@end
