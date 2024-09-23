@implementation _SFDownloadActivityItemProvider

- (_SFDownloadActivityItemProvider)initWithQuickLookDocument:(id)a3 URL:(id)a4 webView:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  _SFDownloadActivityItemProvider *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9
    && (objc_msgSend(MEMORY[0x1E0C99D50], "data"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v15.receiver = self,
        v15.super_class = (Class)_SFDownloadActivityItemProvider,
        self = -[_SFActivityItemProvider initWithPlaceholderItem:URL:pageTitle:webView:](&v15, sel_initWithPlaceholderItem_URL_pageTitle_webView_, v12, v10, 0, v11), v12, self))
  {
    objc_storeStrong((id *)&self->_quickLookDocument, a3);
    self = self;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)pageTitle
{
  return (id)-[SFQuickLookDocument fileName](self->_quickLookDocument, "fileName");
}

- (id)item
{
  -[SFQuickLookDocument saveToFileIfNeeded](self->_quickLookDocument, "saveToFileIfNeeded");
  return (id)-[SFQuickLookDocument savedURLWithProperExtension](self->_quickLookDocument, "savedURLWithProperExtension");
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  return (id)-[SFQuickLookDocument inferredUTI](self->_quickLookDocument, "inferredUTI", a3, a4);
}

- (id)activityViewControllerApplicationExtensionItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v4 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  -[SFQuickLookDocument inferredUTI](self->_quickLookDocument, "inferredUTI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82___SFDownloadActivityItemProvider_activityViewControllerApplicationExtensionItem___block_invoke;
  v8[3] = &unk_1E4AC4AC8;
  v8[4] = self;
  objc_msgSend(v4, "registerItemForTypeIdentifier:loadHandler:", v5, v8);

  -[SFQuickLookDocument fileName](self->_quickLookDocument, "fileName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSuggestedName:", v6);

  return v4;
}

- (SFQuickLookDocument)quickLookDocument
{
  return self->_quickLookDocument;
}

- (void)setQuickLookDocument:(id)a3
{
  objc_storeStrong((id *)&self->_quickLookDocument, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quickLookDocument, 0);
}

@end
