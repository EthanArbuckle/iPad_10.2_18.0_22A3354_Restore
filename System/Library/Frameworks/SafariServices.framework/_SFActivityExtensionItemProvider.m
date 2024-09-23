@implementation _SFActivityExtensionItemProvider

- (_SFActivityExtensionItemProvider)initWithExtensionItem:(id)a3 URL:(id)a4 pageTitle:(id)a5 webView:(id)a6
{
  id v11;
  _SFActivityExtensionItemProvider *v12;
  _SFActivityExtensionItemProvider *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_SFActivityExtensionItemProvider;
  v12 = -[_SFActivityItemProvider initWithPlaceholderItem:URL:pageTitle:webView:](&v15, sel_initWithPlaceholderItem_URL_pageTitle_webView_, v11, a4, a5, a6);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_extensionItem, a3);

  return v13;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return -[_SFActivityExtensionItemProvider _itemForActivityType:](self, "_itemForActivityType:", a4);
}

- (id)item
{
  void *v3;
  void *v4;

  -[UIActivityItemProvider activityType](self, "activityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFActivityExtensionItemProvider _itemForActivityType:](self, "_itemForActivityType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_itemForActivityType:(id)a3
{
  void *v4;
  char v5;
  NSExtensionItem *v6;

  -[UIActivityItemProvider activityType](self, "activityType", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEB1B0]);

  if ((v5 & 1) != 0)
    v6 = 0;
  else
    v6 = self->_extensionItem;
  return v6;
}

- (NSExtensionItem)extensionItem
{
  return self->_extensionItem;
}

- (void)setExtensionItem:(id)a3
{
  objc_storeStrong((id *)&self->_extensionItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionItem, 0);
}

@end
