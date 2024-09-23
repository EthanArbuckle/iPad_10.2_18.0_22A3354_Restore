@implementation ActionPanelWebPageExtensionItemProvider

- (ActionPanelWebPageExtensionItemProvider)initWithExtensionItem:(id)a3 tabDocument:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  ActionPanelWebPageExtensionItemProvider *v11;
  objc_super v13;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "cachedCanonicalURLOrURLForSharing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleForSharing");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "webView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13.receiver = self;
  v13.super_class = (Class)ActionPanelWebPageExtensionItemProvider;
  v11 = -[_SFActivityExtensionItemProvider initWithExtensionItem:URL:pageTitle:webView:](&v13, sel_initWithExtensionItem_URL_pageTitle_webView_, v7, v8, v9, v10);

  return v11;
}

@end
