@implementation ATXHomeScreenStackConfigFromATXWidgetStack

id __ATXHomeScreenStackConfigFromATXWidgetStack_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v2 = a2;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "chsWidget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extensionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExtensionBundleId:", v6);

  objc_msgSend(v2, "chsWidget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "kind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWidgetKind:", v8);

  objc_msgSend(v2, "chsWidget");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "extensionIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "containerBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAppBundleId:", v11);

  return v3;
}

@end
