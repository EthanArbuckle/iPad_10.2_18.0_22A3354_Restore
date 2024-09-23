@implementation ICAttachmentPaperBundleActivityItemSource

- (id)attachmentTypeUTI
{
  return (id)objc_msgSend((id)*MEMORY[0x1E0CEC570], "identifier");
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "data", a3);
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  -[ICAttachmentActivityItemSource attachment](self, "attachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isPasswordProtected");

  if (v9)
  {
    v10 = (void *)MEMORY[0x1AF445E78]();
    -[ICAttachmentActivityItemSource attachment](self, "attachment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fallbackPDFData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v10);
  }
  else
  {
    -[ICAttachmentActivityItemSource attachment](self, "attachment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "previewItemURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

@end
