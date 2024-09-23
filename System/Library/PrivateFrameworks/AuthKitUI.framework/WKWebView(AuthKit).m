@implementation WKWebView(AuthKit)

+ (id)ak_idpWebViewWithFrame:()AuthKit idpHandler:
{
  objc_class *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v11 = (objc_class *)MEMORY[0x1E0CEF638];
  v12 = a7;
  v13 = objc_alloc_init(v11);
  objc_msgSend(MEMORY[0x1E0CEF650], "nonPersistentDataStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWebsiteDataStore:", v14);

  objc_msgSend(v13, "setSuppressesIncrementalRendering:", 1);
  objc_msgSend(v13, "setMediaTypesRequiringUserActionForPlayback:", -1);
  objc_msgSend(v13, "_setCanShowWhileLocked:", 1);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF630]), "initWithFrame:configuration:", v13, a1, a2, a3, a4);
  objc_msgSend(v15, "setNavigationDelegate:", v12);

  return v15;
}

@end
