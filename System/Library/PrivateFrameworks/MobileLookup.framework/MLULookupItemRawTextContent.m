@implementation MLULookupItemRawTextContent

- (id)previewActions
{
  return 0;
}

- (MLULookupItemRawTextContent)initWithText:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  MLULookupItemRawTextContent *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MLULookupItemRawTextContent;
  v8 = -[MLULookupItemRawTextContent init](&v13, sel_init);
  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2B3A8]), "initWithString:range:", v7, location, length);
    -[MLULookupItemContent setPreviewViewController:](v8, "setPreviewViewController:", v9);

    -[MLULookupItemContent previewViewController](v8, "previewViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setModalPresentationStyle:", 6);

    -[MLULookupItemRawTextContent parsecCollectionViewController](v8, "parsecCollectionViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPreviewMode:", 1);

    -[MLULookupItemContent setValid:](v8, "setValid:", 1);
  }

  return v8;
}

- (unint64_t)commitType
{
  return 2;
}

- (void)dismissViewController
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MLULookupItemRawTextContent;
  -[MLULookupItemContent dismissViewController](&v2, sel_dismissViewController);
}

- (void)setupViewControllerInCommitMode
{
  id v2;

  -[MLULookupItemRawTextContent parsecCollectionViewController](self, "parsecCollectionViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPreviewMode:", 0);

}

@end
