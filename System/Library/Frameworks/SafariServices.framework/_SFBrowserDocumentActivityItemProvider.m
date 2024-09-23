@implementation _SFBrowserDocumentActivityItemProvider

- (_SFBrowserDocumentActivityItemProvider)initWithBrowserDocument:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _SFBrowserDocumentActivityItemProvider *v11;
  _SFBrowserDocumentActivityItemProvider *v12;
  objc_super v14;

  v5 = a3;
  objc_msgSend(v5, "webView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "webView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "webView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)_SFBrowserDocumentActivityItemProvider;
  v11 = -[_SFActivityItemProvider initWithPlaceholderItem:URL:pageTitle:webView:](&v14, sel_initWithPlaceholderItem_URL_pageTitle_webView_, v5, v7, v9, v10);

  if (v11)
  {
    objc_storeStrong((id *)&v11->_browserDocument, a3);
    v12 = v11;
  }

  return v11;
}

- (id)item
{
  return self->_browserDocument;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browserDocument, 0);
}

@end
