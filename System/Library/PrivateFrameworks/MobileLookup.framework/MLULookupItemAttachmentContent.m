@implementation MLULookupItemAttachmentContent

- (id)previewActions
{
  return 0;
}

- (MLULookupItemAttachmentContent)initWithAttachments:(id)a3 currentAttachmentIndex:(unint64_t)a4
{
  id v6;
  MLULookupItemAttachmentContent *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MLULookupItemAttachmentContent;
  v7 = -[MLULookupItemAttachmentContent init](&v11, sel_init);
  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE5EC0]), "initWithPreviewItems:", v6);
    -[MLULookupItemContent setPreviewViewController:](v7, "setPreviewViewController:", v8);

    -[MLULookupItemContent previewViewController](v7, "previewViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCurrentPreviewItemIndex:", a4);

    -[MLULookupItemContent setValid:](v7, "setValid:", 1);
  }

  return v7;
}

- (unint64_t)commitType
{
  return 2;
}

@end
