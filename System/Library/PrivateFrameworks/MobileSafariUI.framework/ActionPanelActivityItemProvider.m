@implementation ActionPanelActivityItemProvider

- (ActionPanelActivityItemProvider)initWithPlaceholderItem:(id)a3 tabDocument:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  ActionPanelActivityItemProvider *v11;
  ActionPanelActivityItemProvider *v12;
  objc_super v14;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "cachedCanonicalURLOrURLForSharing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleForSharing");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "webView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)ActionPanelActivityItemProvider;
  v11 = -[_SFLinkWithPreviewActivityItemProvider initWithPlaceholderItem:URL:pageTitle:webView:](&v14, sel_initWithPlaceholderItem_URL_pageTitle_webView_, v7, v8, v9, v10);

  if (v11)
  {
    objc_storeWeak((id *)&v11->_tabDocument, v6);
    v12 = v11;
  }

  return v11;
}

- (ActionPanelActivityItemProvider)initWithTabDocument:(id)a3
{
  id v4;
  void *v5;
  ActionPanelActivityItemProvider *v6;

  v4 = a3;
  objc_msgSend(v4, "cachedCanonicalURLOrURLForSharing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ActionPanelActivityItemProvider initWithPlaceholderItem:tabDocument:](self, "initWithPlaceholderItem:tabDocument:", v5, v4);

  return v6;
}

- (ActionPanelActivityItemProvider)initWithPlaceholderItem:(id)a3 URL:(id)a4 pageTitle:(id)a5 webView:(id)a6
{

  return 0;
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  double height;
  double width;
  id v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, double, double);
  void *v11;

  height = a5.height;
  width = a5.width;
  v8 = a4;
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D96D88]))
  {
    -[_SFActivityItemProvider thumbnailHandler](self, "thumbnailHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[_SFActivityItemProvider thumbnailHandler](self, "thumbnailHandler");
      v10 = (void (**)(_QWORD, _QWORD, double, double))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, double, double))v10)[2](v10, v8, width, height);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (TabDocument)tabDocument
{
  return (TabDocument *)objc_loadWeakRetained((id *)&self->_tabDocument);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tabDocument);
}

@end
