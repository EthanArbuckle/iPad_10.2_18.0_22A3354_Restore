@implementation TabDocumentActivityItemProvider

- (TabDocumentActivityItemProvider)initWithTabDocument:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  TabDocumentActivityItemProvider *v9;
  TabDocumentActivityItemProvider *v10;
  objc_super v12;

  v5 = a3;
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "webView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)TabDocumentActivityItemProvider;
  v9 = -[_SFActivityItemProvider initWithPlaceholderItem:URL:pageTitle:webView:](&v12, sel_initWithPlaceholderItem_URL_pageTitle_webView_, v5, v6, v7, v8);

  if (v9)
  {
    objc_storeStrong((id *)&v9->_tabDocument, a3);
    v10 = v9;
  }

  return v9;
}

- (id)item
{
  return self->_tabDocument;
}

- (TabDocument)tabDocument
{
  return self->_tabDocument;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabDocument, 0);
}

@end
