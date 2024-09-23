@implementation MFComposeWebView

+ (void)setURLCacheBlock:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__MFComposeWebView_setURLCacheBlock___block_invoke;
  block[3] = &unk_1E5A66780;
  v7 = v3;
  v4 = setURLCacheBlock__onceToken;
  v5 = v3;
  if (v4 != -1)
    dispatch_once(&setURLCacheBlock__onceToken, block);

}

+ (NSArray)menuCommands
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[6];

  v30[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)menuCommands_commands;
  if (!menuCommands_commands)
  {
    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("a"), 1179648, sel__importDocumentCommandInvoked_);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (bundle_onceToken != -1)
      dispatch_once(&bundle_onceToken, &__block_literal_global_1010);
    v3 = (id)bundle_bundle;
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("IMPORT_DOCUMENT"), &stru_1E5A6A588, CFSTR("Main"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setDiscoverabilityTitle:", v4);

    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("v"), 1179648, sel__pasteAsQuotationKeyCommandInvoked_);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (bundle_onceToken != -1)
      dispatch_once(&bundle_onceToken, &__block_literal_global_1010);
    v5 = (id)bundle_bundle;
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("PASTE_AS_QUOTATION"), &stru_1E5A6A588, CFSTR("Main"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setDiscoverabilityTitle:", v6);

    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("'"), 0x100000, sel__increaseQuoteLevelKeyCommandInvoked_);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (bundle_onceToken != -1)
      dispatch_once(&bundle_onceToken, &__block_literal_global_1010);
    v7 = (id)bundle_bundle;
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("INCREASE_QUOTE_LEVEL"), &stru_1E5A6A588, CFSTR("Main"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setDiscoverabilityTitle:", v8);

    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("'"), 1572864, sel__decreaseQuoteLevelKeyCommandInvoked_);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (bundle_onceToken != -1)
      dispatch_once(&bundle_onceToken, &__block_literal_global_1010);
    v9 = (id)bundle_bundle;
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("DECREASE_QUOTE_LEVEL"), &stru_1E5A6A588, CFSTR("Main"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setDiscoverabilityTitle:", v10);

    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("k"), 0x100000, sel__didTapAddLink_);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _EFLocalizedString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDiscoverabilityTitle:", v12);

    objc_msgSend(v29, "_nonRepeatableKeyCommand");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFMailMenuCommand shortcutWithCommand:menu:](MFMailMenuCommand, "shortcutWithCommand:menu:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v13;
    objc_msgSend(v28, "_nonRepeatableKeyCommand");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFMailMenuCommand shortcutWithCommand:menu:](MFMailMenuCommand, "shortcutWithCommand:menu:", v14, 6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v15;
    objc_msgSend(v11, "_nonRepeatableKeyCommand");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFMailMenuCommand shortcutWithCommand:menu:](MFMailMenuCommand, "shortcutWithCommand:menu:", v16, 6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v17;
    objc_msgSend(v27, "_nonRepeatableKeyCommand");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFMailMenuCommand shortcutWithCommand:menu:](MFMailMenuCommand, "shortcutWithCommand:menu:", v18, 5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v30[3] = v19;
    objc_msgSend(v26, "_nonRepeatableKeyCommand");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFMailMenuCommand shortcutWithCommand:menu:](MFMailMenuCommand, "shortcutWithCommand:menu:", v20, 5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v30[4] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 5);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)menuCommands_commands;
    menuCommands_commands = v22;

    v2 = (void *)menuCommands_commands;
  }
  return (NSArray *)v2;
}

void __37__MFComposeWebView_setURLCacheBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v2 = (void *)sURLCacheBlock;
  sURLCacheBlock = v1;

}

+ (id)_webViewConfiguration:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_basicWebViewConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userContentController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__3;
  v26 = __Block_byref_object_dispose__3;
  v27 = 0;
  v6 = objc_alloc(MEMORY[0x1E0CEF700]);
  if (v3)
    MFUserStyleSheetCSS(2);
  else
    MFUserStyleSheetCSS(1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "initWithSource:forMainFrameOnly:", v7, 0);
  v9 = (void *)v23[5];
  v23[5] = v8;

  objc_msgSend(v5, "_addUserStyleSheet:", v23[5]);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0DC4508];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __42__MFComposeWebView__webViewConfiguration___block_invoke;
  v19[3] = &unk_1E5A667A8;
  v21 = &v22;
  v13 = v5;
  v20 = v13;
  objc_msgSend(v10, "addObserverForName:object:queue:usingBlock:", v12, 0, v11, v19);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)_webViewConfiguration__darkerSystemColorsStatusObserver;
  _webViewConfiguration__darkerSystemColorsStatusObserver = v14;

  v16 = v20;
  v17 = v4;

  _Block_object_dispose(&v22, 8);
  return v17;
}

void __42__MFComposeWebView__webViewConfiguration___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v2 = objc_alloc(MEMORY[0x1E0CEF700]);
  MFUserStyleSheetCSS(1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "initWithSource:forMainFrameOnly:", v3, 0);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(*(id *)(a1 + 32), "_addUserStyleSheet:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "_removeUserStyleSheet:", v7);

}

+ (id)_basicWebViewConfiguration
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  uint64_t v42;
  _QWORD v43[5];
  _QWORD v44[3];

  v44[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CEF638]);
  objc_msgSend(v3, "setSelectionGranularity:", 1);
  objc_msgSend(v3, "_setAttachmentElementEnabled:", 1);
  objc_msgSend(v3, "_setColorFilterEnabled:", 1);
  objc_msgSend(v3, "_setAllowsJavaScriptMarkup:", 0);
  objc_msgSend(v3, "preferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setAllowFileAccessFromFileURLs:", 1);

  objc_msgSend(v3, "preferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setPunchOutWhiteBackgroundsInDarkMode:", 1);

  v44[0] = *MEMORY[0x1E0D1ED78];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setAdditionalSupportedImageTypes:", v6);

  if (_basicWebViewConfiguration_onceToken != -1)
    dispatch_once(&_basicWebViewConfiguration_onceToken, &__block_literal_global_14);
  objc_msgSend((id)sProxySchemeHandler, "setOnWebViewConfiguration:", v3);
  v36 = objc_alloc_init(MEMORY[0x1E0CEF6C0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "builtInPlugInsURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:", CFSTR("MessageUI.wkbundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setInjectedBundleURL:", v9);

  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF5F8]), "_initWithConfiguration:", v36);
  v41[0] = CFSTR("isPad");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(MEMORY[0x1E0DC3708], "mf_isPad"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v10;
  v41[1] = CFSTR("defaultComposeFontPixelSize");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0DC1350], "mf_defaultComposeFontPixelSize");
  _UIAccessibilityLargeTextFontSize();
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v12;
  v41[2] = CFSTR("defaultComposeFontFamily");
  objc_msgSend(MEMORY[0x1E0DC1350], "mf_messageBodyFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "familyName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v14;
  v41[3] = CFSTR("remoteContentProxySchemePrefix");
  objc_msgSend((id)sProxySchemeHandler, "schemePrefix");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v15;
  v42 = *MEMORY[0x1E0D1E048];
  v16 = v42;
  v17 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "numberWithInteger:", objc_msgSend(v18, "integerForKey:", v42));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v41, 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "_setObjectsForBundleParametersWithDictionary:", v20);

  objc_msgSend(v3, "setProcessPool:", v35);
  objc_msgSend(v3, "defaultWebpagePreferences");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_setNetworkConnectionIntegrityPolicy:", 256);

  objc_msgSend(MEMORY[0x1E0D46DA8], "sharedHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setURLSchemeHandler:forURLScheme:", v22, *MEMORY[0x1E0D4D488]);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "_setMarkedTextInputEnabled:", 1);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = *MEMORY[0x1E0DC48E8];
  v26 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __46__MFComposeWebView__basicWebViewConfiguration__block_invoke_59;
  v39[3] = &unk_1E5A667D0;
  v27 = v35;
  v40 = v27;
  objc_msgSend(v23, "addObserverForName:object:queue:usingBlock:", v25, 0, v24, v39);
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)_basicWebViewConfiguration_contentSizeCategoryObserver;
  _basicWebViewConfiguration_contentSizeCategoryObserver = v28;

  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v26;
  v37[1] = 3221225472;
  v37[2] = __46__MFComposeWebView__basicWebViewConfiguration__block_invoke_2;
  v37[3] = &unk_1E5A667F8;
  v31 = v27;
  v38 = v31;
  objc_msgSend(v30, "ef_observeKeyPath:options:usingBlock:", v16, 1, v37);
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)_basicWebViewConfiguration_blockRemoteContentObserver;
  _basicWebViewConfiguration_blockRemoteContentObserver = v32;

  return v3;
}

void __46__MFComposeWebView__basicWebViewConfiguration__block_invoke()
{
  void *v0;
  NSObject *v1;
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;

  if (!sURLCacheBlock
    || ((*(void (**)(void))(sURLCacheBlock + 16))(), (v0 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    EMLogCompose();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      __46__MFComposeWebView__basicWebViewConfiguration__block_invoke_cold_1();

    v0 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMailPrivacyProtectionAllowed");

  v4 = objc_alloc(MEMORY[0x1E0D1E2E8]);
  v5 = objc_msgSend(v4, "initWithCache:sourceBundleIdentifier:", v0, *MEMORY[0x1E0D4D878]);
  v6 = (void *)sURLSession;
  sURLSession = v5;

  v7 = objc_alloc(MEMORY[0x1E0D1E2E0]);
  v8 = objc_msgSend(v7, "initWithSession:schemePrefix:allowProxying:", sURLSession, CFSTR("x-apple-mail-proxy-"), v3);
  v9 = (void *)sProxySchemeHandler;
  sProxySchemeHandler = v8;

}

void __46__MFComposeWebView__basicWebViewConfiguration__block_invoke_59(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0DC1350], "mf_defaultComposeFontPixelSize");
  _UIAccessibilityLargeTextFontSize();
  objc_msgSend(v2, "numberWithDouble:");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_setObject:forBundleParameter:");

}

void __46__MFComposeWebView__basicWebViewConfiguration__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v5, "integerValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setObject:forBundleParameter:", v4, *MEMORY[0x1E0D1E048]);

}

- (MFComposeWebView)initWithFrame:(CGRect)a3
{
  return -[MFComposeWebView initWithFrame:isQuickReply:](self, "initWithFrame:isQuickReply:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (MFComposeWebView)initWithFrame:(CGRect)a3 isQuickReply:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  double y;
  double x;
  void *v10;
  MFComposeWebView *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  _WKRemoteObjectInterface *bodyFieldObserverInterface;
  uint64_t v21;
  _WKRemoteObjectInterface *richLinkGeneratorInterface;
  void *v23;
  void *v24;
  uint64_t v25;
  NSMutableDictionary *attachmentsByUniqueIdentifier;
  uint64_t v27;
  NSMutableDictionary *attachmentCIDsByIdentifier;
  uint64_t v29;
  NSArray *originalAttachmentWrappers;
  uint64_t v31;
  NSMutableDictionary *richLinkActivityIndicators;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  id location;
  objc_super v55;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend((id)objc_opt_class(), "_webViewConfiguration:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v55.receiver = self;
  v55.super_class = (Class)MFComposeWebView;
  v11 = -[MFComposeWebView initWithFrame:configuration:](&v55, sel_initWithFrame_configuration_, v10, x, y, width, height);

  if (v11)
  {
    -[MFComposeWebView _overrideViewportWithArguments:](v11, "_overrideViewportWithArguments:", &unk_1E5A9FF58);
    v12 = (void *)MEMORY[0x1E0C99E98];
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("applewebdata://%@"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLWithString:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)-[MFComposeWebView loadHTMLString:baseURL:](v11, "loadHTMLString:baseURL:", CFSTR("<body dir=auto>"), v17);

    -[MFComposeWebView setNavigationDelegate:](v11, "setNavigationDelegate:", v11);
    -[MFComposeWebView _setInputDelegate:](v11, "_setInputDelegate:", v11);
    -[MFComposeWebView setUIDelegate:](v11, "setUIDelegate:", v11);
    -[MFComposeWebView _setDragInteractionPolicy:](v11, "_setDragInteractionPolicy:", 1);
    -[MFComposeWebView setFindInteractionEnabled:](v11, "setFindInteractionEnabled:", 1);
    -[MFComposeWebView _remoteObjectRegistry](v11, "_remoteObjectRegistry");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEF6C8], "remoteObjectInterfaceWithProtocol:", &unk_1EEC7CF78);
    v19 = objc_claimAutoreleasedReturnValue();
    bodyFieldObserverInterface = v11->_bodyFieldObserverInterface;
    v11->_bodyFieldObserverInterface = (_WKRemoteObjectInterface *)v19;

    objc_msgSend(v41, "registerExportedObject:interface:", v11, v11->_bodyFieldObserverInterface);
    objc_msgSend(MEMORY[0x1E0CEF6C8], "remoteObjectInterfaceWithProtocol:", &unk_1EECCC4B0);
    v21 = objc_claimAutoreleasedReturnValue();
    richLinkGeneratorInterface = v11->_richLinkGeneratorInterface;
    v11->_richLinkGeneratorInterface = (_WKRemoteObjectInterface *)v21;

    objc_msgSend(MEMORY[0x1E0D46DD0], "linkGenerator");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "registerExportedObject:interface:", v23, v11->_richLinkGeneratorInterface);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v11, sel__menuDidHide_, *MEMORY[0x1E0DC5040], 0);

    v11->_shouldShowStandardButtons = 1;
    v25 = objc_opt_new();
    attachmentsByUniqueIdentifier = v11->_attachmentsByUniqueIdentifier;
    v11->_attachmentsByUniqueIdentifier = (NSMutableDictionary *)v25;

    v27 = objc_opt_new();
    attachmentCIDsByIdentifier = v11->_attachmentCIDsByIdentifier;
    v11->_attachmentCIDsByIdentifier = (NSMutableDictionary *)v27;

    v29 = objc_opt_new();
    originalAttachmentWrappers = v11->_originalAttachmentWrappers;
    v11->_originalAttachmentWrappers = (NSArray *)v29;

    v11->_originalAttachmentsWereRestored = 0;
    v31 = objc_opt_new();
    richLinkActivityIndicators = v11->_richLinkActivityIndicators;
    v11->_richLinkActivityIndicators = (NSMutableDictionary *)v31;

    v11->_isQuickReply = v4;
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v11);
    v33 = (void *)MEMORY[0x1E0D1E3C8];
    v34 = MEMORY[0x1E0C809B0];
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __47__MFComposeWebView_initWithFrame_isQuickReply___block_invoke;
    v52[3] = &unk_1E5A66820;
    objc_copyWeak(&v53, &location);
    objc_msgSend(v33, "addScriptHandlerForWebView:key:handler:", v11, CFSTR("PlainTextLinkHighlighted"), v52);
    v35 = (void *)MEMORY[0x1E0D1E3C8];
    v50[0] = v34;
    v50[1] = 3221225472;
    v50[2] = __47__MFComposeWebView_initWithFrame_isQuickReply___block_invoke_2;
    v50[3] = &unk_1E5A66820;
    objc_copyWeak(&v51, &location);
    objc_msgSend(v35, "addScriptHandlerForWebView:key:handler:", v11, CFSTR("RichLinkHighlighted"), v50);
    v36 = (void *)MEMORY[0x1E0D1E3C8];
    v48[0] = v34;
    v48[1] = 3221225472;
    v48[2] = __47__MFComposeWebView_initWithFrame_isQuickReply___block_invoke_3;
    v48[3] = &unk_1E5A66820;
    objc_copyWeak(&v49, &location);
    objc_msgSend(v36, "addScriptHandlerForWebView:key:handler:", v11, CFSTR("RichLinkPlaceholderInserted"), v48);
    v37 = (void *)MEMORY[0x1E0D1E3C8];
    v46[0] = v34;
    v46[1] = 3221225472;
    v46[2] = __47__MFComposeWebView_initWithFrame_isQuickReply___block_invoke_4;
    v46[3] = &unk_1E5A66848;
    objc_copyWeak(&v47, &location);
    objc_msgSend(v37, "addScriptHandlerForWebView:key:handler:", v11, CFSTR("RichLinkLoaded"), v46);
    if ((_os_feature_enabled_impl() & v4) == 1)
    {
      v38 = (void *)MEMORY[0x1E0D1E3C8];
      v44[0] = v34;
      v44[1] = 3221225472;
      v44[2] = __47__MFComposeWebView_initWithFrame_isQuickReply___block_invoke_5;
      v44[3] = &unk_1E5A66870;
      objc_copyWeak(&v45, &location);
      objc_msgSend(v38, "addScriptHandlerForWebView:key:handler:", v11, CFSTR("DidChangeHeight"), v44);
      v39 = (void *)MEMORY[0x1E0D1E3C8];
      v42[0] = v34;
      v42[1] = 3221225472;
      v42[2] = __47__MFComposeWebView_initWithFrame_isQuickReply___block_invoke_6;
      v42[3] = &unk_1E5A66870;
      objc_copyWeak(&v43, &location);
      objc_msgSend(v39, "addScriptHandlerForWebView:key:handler:", v11, CFSTR("MessageBodyIsEmpty"), v42);
      objc_destroyWeak(&v43);
      objc_destroyWeak(&v45);
    }
    objc_destroyWeak(&v47);
    objc_destroyWeak(&v49);
    objc_destroyWeak(&v51);
    objc_destroyWeak(&v53);
    objc_destroyWeak(&location);

  }
  return v11;
}

void __47__MFComposeWebView_initWithFrame_isQuickReply___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "showRichLinkAccessoryButtonForExistingRichLink:message:", 0, v3);

}

void __47__MFComposeWebView_initWithFrame_isQuickReply___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "showRichLinkAccessoryButtonForExistingRichLink:message:", 1, v3);

}

void __47__MFComposeWebView_initWithFrame_isQuickReply___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "richLinkDidStartLoading:", v3);

}

void __47__MFComposeWebView_initWithFrame_isQuickReply___block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "richLinkDidFinishLoading:", v3);

}

void __47__MFComposeWebView_initWithFrame_isQuickReply___block_invoke_5(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v4, "doubleValue");
  objc_msgSend(WeakRetained, "_composeWebView:didChangeHeight:", WeakRetained);

}

void __47__MFComposeWebView_initWithFrame_isQuickReply___block_invoke_6(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_composeWebView:composeBodyIsEmpty:", WeakRetained, objc_msgSend(v4, "BOOLValue"));

}

- (BOOL)becomeFirstResponder
{
  _BOOL4 v3;
  void *v4;
  id WeakRetained;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFComposeWebView;
  v3 = -[MFComposeWebView becomeFirstResponder](&v7, sel_becomeFirstResponder);
  if (v3)
  {
    -[MFComposeWebView updateInputAssistantItem](self, "updateInputAssistantItem");
    -[MFComposeWebView mailComposeViewDelegate](self, "mailComposeViewDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "composeWebViewDidBecomeFirstResponder");
    +[MessageUITipsManager setShouldDisplayTo:](_TtC9MessageUI20MessageUITipsManager, "setShouldDisplayTo:", 1);
    WeakRetained = objc_loadWeakRetained((id *)&self->_composeCoordinator);
    objc_msgSend(WeakRetained, "setFocusedField:", CFSTR("body"));

  }
  return v3;
}

- (BOOL)resignFirstResponder
{
  _BOOL4 v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFComposeWebView;
  v3 = -[MFComposeWebView resignFirstResponder](&v6, sel_resignFirstResponder);
  if (v3)
  {
    -[MFComposeWebView mailComposeViewDelegate](self, "mailComposeViewDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "composeWebViewDidResignFirstResponder");
    +[MessageUITipsManager setShouldDisplayTo:](_TtC9MessageUI20MessageUITipsManager, "setShouldDisplayTo:", 0);

  }
  return v3;
}

- (id)keyCommands
{
  char v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = MFIsMobileMail();
  v3 = (void *)keyCommands_commands;
  if (!keyCommands_commands && (v2 & 1) == 0)
  {
    +[MFComposeWebView menuCommands](MFComposeWebView, "menuCommands");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ef_compactMap:", &__block_literal_global_186);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)keyCommands_commands;
    keyCommands_commands = v5;

    v3 = (void *)keyCommands_commands;
  }
  return v3;
}

id __31__MFComposeWebView_keyCommands__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  objc_msgSend(a2, "command");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  objc_super *v7;
  unsigned __int8 selectionContainsLink;
  void *v10;
  void *v11;
  MFComposeWebView *v13;
  objc_super v14;

  v6 = a4;
  -[MFComposeWebView _canPerformCommandAction:withSender:](self, "_canPerformCommandAction:withSender:", a3, v6);
  if (sel_selectAll_ == a3)
  {
    if (!-[MFComposeWebView _contentViewIsFirstResponder](self, "_contentViewIsFirstResponder"))
    {
      selectionContainsLink = 0;
      goto LABEL_18;
    }
    v14.receiver = self;
    v7 = &v14;
    goto LABEL_8;
  }
  if (self->_shouldShowStandardButtons)
  {
    if (sel_makeRichLinkFromSelection == a3)
    {
      selectionContainsLink = self->_selectionContainsLink;
      goto LABEL_18;
    }
    if (sel_pasteRichLink == a3)
    {
      objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "URL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      selectionContainsLink = objc_msgSend(v11, "ef_isHTTPOrHTTPSURL");

      goto LABEL_18;
    }
    v13 = self;
    v7 = (objc_super *)&v13;
LABEL_8:
    v7->super_class = (Class)MFComposeWebView;
    selectionContainsLink = -[objc_super canPerformAction:withSender:](v7, sel_canPerformAction_withSender_, a3, v6, v13);
    goto LABEL_18;
  }
  selectionContainsLink = sel__increaseQuoteLevel_ == a3 || sel__decreaseQuoteLevel_ == a3;
LABEL_18:

  return selectionContainsLink;
}

- (BOOL)_canPerformCommandAction:(SEL)a3 withSender:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  _QWORD v10[5];

  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (sel__pasteAsQuotation_ == a3)
    {
      objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "items");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "count") != 0;

    }
    else
    {
      +[MFComposeWebView menuCommands](MFComposeWebView, "menuCommands");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __56__MFComposeWebView__canPerformCommandAction_withSender___block_invoke;
      v10[3] = &__block_descriptor_40_e27_B16__0__MFMailMenuCommand_8l;
      v10[4] = a3;
      v7 = objc_msgSend(v6, "ef_any:", v10);
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

BOOL __56__MFComposeWebView__canPerformCommandAction_withSender___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "command");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "action") == *(_QWORD *)(a1 + 32);

  return v4;
}

- (id)_textInputTraits
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  __CFString *v38;
  __CFString *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _BOOL4 v47;
  void *v48;
  id v49;
  void *v50;
  id obj;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  objc_super v57;
  uint8_t v58[128];
  uint8_t buf[4];
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v57.receiver = self;
  v57.super_class = (Class)MFComposeWebView;
  -[MFComposeWebView _textInputTraits](&v57, sel__textInputTraits);
  v49 = (id)objc_claimAutoreleasedReturnValue();
  -[MFComposeWebView mailComposeViewDelegate](self, "mailComposeViewDelegate");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    if (_os_feature_enabled_impl() && EMIsGreymatterAvailableWithOverride())
    {
      -[MFComposeWebView previousInputContextHistory](self, "previousInputContextHistory");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v3 == 0;

      if (v47)
      {
        objc_msgSend(v48, "inputContextHistory");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFComposeWebView setPreviousInputContextHistory:](self, "setPreviousInputContextHistory:", v4);

        EMLogCompose();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          -[MFComposeWebView previousInputContextHistory](self, "previousInputContextHistory");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "ef_publicDescription");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v60 = v7;
          _os_log_impl(&dword_1AB96A000, v5, OS_LOG_TYPE_DEFAULT, "[SmartReply] Updated input context history: %{public}@", buf, 0xCu);

        }
      }
      -[MFComposeWebView previousInputContextHistory](self, "previousInputContextHistory");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_alloc(MEMORY[0x1E0DC38A8]);
      objc_msgSend(v50, "threadIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "recipientNamesByEmailAddress");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "firstPerson");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "primaryRecipients");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "secondaryRecipients");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "infoDict");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = (void *)objc_msgSend(v8, "initWithThreadIdentifier:participantsIDtoNames:firstPerson:primaryRecipients:secondaryRecipients:info:", v9, v10, v11, v12, v13, v14);

      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      objc_msgSend(v50, "originalContentMessages");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      obj = v15;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v54;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v54 != v17)
              objc_enumerationMutation(obj);
            v19 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
            objc_msgSend(v19, "sender");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "emailAddressValue");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "simpleAddress");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            v23 = objc_alloc_init(MEMORY[0x1E0DBDCA0]);
            objc_msgSend(v19, "bodyText");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setText:", v24);

            objc_msgSend(v23, "setSenderIdentifier:", v22);
            objc_msgSend(v19, "date");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setTimestamp:", v25);

            objc_msgSend(v19, "searchableMessageID");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "stringValue");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setEntryIdentifier:", v27);

            v28 = (void *)MEMORY[0x1E0C99E60];
            objc_msgSend(v19, "toList");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "ef_map:", &__block_literal_global_213);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setWithArray:", v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setPrimaryRecipientIdentifiers:", v31);

            v32 = (void *)MEMORY[0x1E0C99E60];
            objc_msgSend(v19, "ccList");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "ef_map:", &__block_literal_global_214);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "setWithArray:", v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setSecondaryRecipientIdentifiers:", v35);

            objc_msgSend(v52, "addEntry:", v23);
          }
          v15 = obj;
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
        }
        while (v16);
      }

      objc_msgSend(v52, "didFinishAddingEntriesToInputContextHistory");
    }
    else
    {
      objc_msgSend(v48, "allRecipientNamesAndAddresses");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "sendingEmailAddressIfExists");
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = (void *)v36;
      v38 = &stru_1E5A6A588;
      if (v36)
        v38 = (__CFString *)v36;
      v39 = v38;

      v40 = objc_alloc(MEMORY[0x1E0DC38A8]);
      objc_msgSend(v50, "second");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v39);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = (void *)objc_msgSend(v40, "initWithRecipientIdentifiers:senderIdentifiers:", v41, v42);

      objc_msgSend(v50, "first");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "updateRecipientNames:", v43);

      v47 = 0;
    }

    v44 = v52;
    objc_msgSend(v49, "setInputContextHistory:", v52);
    if (v47)
    {
      objc_msgSend(MEMORY[0x1E0DC3938], "activeKeyboard");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "responseContextDidChange");

      v44 = v52;
    }

  }
  return v49;
}

id __36__MFComposeWebView__textInputTraits__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "emailAddressValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "simpleAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __36__MFComposeWebView__textInputTraits__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "emailAddressValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "simpleAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_close
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[MFComposeWebView _remoteObjectRegistry](self, "_remoteObjectRegistry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterExportedObject:interface:", self, self->_bodyFieldObserverInterface);

  -[MFComposeWebView _remoteObjectRegistry](self, "_remoteObjectRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D46DD0], "linkGenerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterExportedObject:interface:", v5, self->_richLinkGeneratorInterface);

  v6.receiver = self;
  v6.super_class = (Class)MFComposeWebView;
  -[MFComposeWebView _close](&v6, sel__close);
}

- (void)markupSelectedAttachment
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AB96A000, v0, v1, "Too few selected attachments to present Markup.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (CGRect)_rectFromMessageDict:(id)a3
{
  id v3;
  void *v4;
  float v5;
  float v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  float v11;
  float v12;
  void *v13;
  float v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  v3 = a3;
  objc_msgSend(v3, "ef_objectOfClass:forKey:", objc_opt_class(), CFSTR("x"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;

  objc_msgSend(v3, "ef_objectOfClass:forKey:", objc_opt_class(), CFSTR("y"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = v8;

  objc_msgSend(v3, "ef_objectOfClass:forKey:", objc_opt_class(), CFSTR("width"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  v12 = v11;

  objc_msgSend(v3, "ef_objectOfClass:forKey:", objc_opt_class(), CFSTR("height"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");
  v15 = v14;

  v16 = v6;
  v17 = v9;
  v18 = v12;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)_linkAccessoryButtonFrameForSourceRect:(CGRect)a3
{
  double height;
  double y;
  double v6;
  double v7;
  double v8;
  double MaxX;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect result;

  height = a3.size.height;
  y = a3.origin.y;
  v6 = a3.origin.x + a3.size.width;
  v7 = a3.origin.x + a3.size.width + 8.0;
  v8 = a3.origin.y + -2.0;
  v17.size.width = 34.0;
  v17.size.height = 28.0;
  v17.origin.x = v7;
  v17.origin.y = a3.origin.y + -2.0;
  MaxX = CGRectGetMaxX(v17);
  -[MFComposeWebView scrollView](self, "scrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v11;

  if (MaxX + 8.0 > v12)
  {
    v7 = v6 + -34.0 + -8.0;
    v8 = y + height + -28.0 + -2.0;
  }
  v13 = 34.0;
  v14 = 28.0;
  v15 = v7;
  v16 = v8;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)showRichLinkAccessoryButtonForExistingRichLink:(BOOL)a3 message:(id)a4
{
  _BOOL4 v4;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  CGRect *p_richLinkSourceRect;
  CGPoint *v29;
  CGSize v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[5];
  id v56;
  _QWORD v57[5];
  _QWORD v58[5];
  _QWORD v59[5];
  id v60;
  _QWORD v61[4];
  id v62;
  MFComposeWebView *v63;
  _QWORD v64[5];
  BOOL v65;
  CGPoint v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;

  v4 = a3;
  v6 = a4;
  -[MFComposeWebView _rectFromMessageDict:](self, "_rectFromMessageDict:", v6);
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  if (v4 || v9 > 0.0 && v10 > 0.0 && !CGRectEqualToRect(*(CGRect *)&v7, self->_richLinkSourceRect))
  {
    self->_richLinkSourceRect.origin.x = v11;
    self->_richLinkSourceRect.origin.y = v12;
    self->_richLinkSourceRect.size.width = v13;
    self->_richLinkSourceRect.size.height = v14;
    -[MFComposeWebView _linkAccessoryButtonFrameForSourceRect:](self, "_linkAccessoryButtonFrameForSourceRect:", v11, v12, v13, v14);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    objc_msgSend(v6, "valueForKey:", CFSTR("url"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "BOOLValue");

    -[MFComposeWebView makeLinkAccessoryButton](self, "makeLinkAccessoryButton");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTag:", v4);
    objc_msgSend(v25, "setFrame:", v16, v18, v20, v22);
    if (v4)
      objc_msgSend(MEMORY[0x1E0D46DD0], "titleConvertToPlainLink");
    else
      objc_msgSend(MEMORY[0x1E0D46DD0], "titleConvertToRichLink");
    v26 = objc_claimAutoreleasedReturnValue();
    v31 = MEMORY[0x1E0C809B0];
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __75__MFComposeWebView_showRichLinkAccessoryButtonForExistingRichLink_message___block_invoke;
    v64[3] = &unk_1E5A66958;
    v65 = v4;
    v64[4] = self;
    v53 = (void *)v26;
    objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", v26, 0, 0, v64);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v52);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v54)
    {
      v33 = (void *)MEMORY[0x1E0DC3428];
      objc_msgSend(MEMORY[0x1E0D46DD0], "titleOpenLink");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v61[0] = v31;
      v61[1] = 3221225472;
      v61[2] = __75__MFComposeWebView_showRichLinkAccessoryButtonForExistingRichLink_message___block_invoke_2;
      v61[3] = &unk_1E5A66980;
      v35 = v54;
      v62 = v35;
      v63 = self;
      objc_msgSend(v33, "actionWithTitle:image:identifier:handler:", v34, 0, 0, v61);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v32, "addObject:", v36);
      if (_os_feature_enabled_impl() && !v4 && ((v24 ^ 1) & 1) == 0)
      {
        v51 = v36;
        _EFLocalizedString();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v59[0] = v31;
        v59[1] = 3221225472;
        v59[2] = __75__MFComposeWebView_showRichLinkAccessoryButtonForExistingRichLink_message___block_invoke_3;
        v59[3] = &unk_1E5A65430;
        v59[4] = self;
        v60 = v35;
        -[MFComposeWebView _actionWithTitle:glyphName:handler:]((uint64_t)self, v37, 0, v59);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v32, "addObject:", v38);
        _EFLocalizedString();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v58[0] = v31;
        v58[1] = 3221225472;
        v58[2] = __75__MFComposeWebView_showRichLinkAccessoryButtonForExistingRichLink_message___block_invoke_4;
        v58[3] = &unk_1E5A65480;
        v58[4] = self;
        -[MFComposeWebView _actionWithTitle:glyphName:handler:]((uint64_t)self, v39, 0, v58);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v32, "addObject:", v40);
        objc_msgSend(v6, "valueForKey:", CFSTR("description"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "isEqualToString:", &stru_1E5A6A588);
        if (v41)
          v43 = v42;
        else
          v43 = 1;
        if (v43 == 1)
        {
          _EFLocalizedString();
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v57[0] = v31;
          v57[1] = 3221225472;
          v57[2] = __75__MFComposeWebView_showRichLinkAccessoryButtonForExistingRichLink_message___block_invoke_5;
          v57[3] = &unk_1E5A65480;
          v57[4] = self;
          -[MFComposeWebView _actionWithTitle:glyphName:handler:]((uint64_t)self, v44, 0, v57);
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v32, "addObject:", v45);
        }
        else
        {
          _EFLocalizedString();
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v55[0] = v31;
          v55[1] = 3221225472;
          v55[2] = __75__MFComposeWebView_showRichLinkAccessoryButtonForExistingRichLink_message___block_invoke_6;
          v55[3] = &unk_1E5A65430;
          v55[4] = self;
          v56 = v41;
          -[MFComposeWebView _actionWithTitle:glyphName:handler:]((uint64_t)self, v46, 0, v55);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v32, "addObject:", v47);
          v45 = v56;
        }
        v36 = v51;

      }
    }
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v32);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setMenu:", v48);

    -[MFComposeWebView scrollView](self, "scrollView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeWebView makeLinkAccessoryButton](self, "makeLinkAccessoryButton");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addSubview:", v50);

    -[MFComposeWebView _showmakeLinkAccessoryButton](self, "_showmakeLinkAccessoryButton");
  }
  else if (*MEMORY[0x1E0C9D820] == v13 && *(double *)(MEMORY[0x1E0C9D820] + 8) == v14)
  {
    p_richLinkSourceRect = &self->_richLinkSourceRect;
    v29 = (CGPoint *)MEMORY[0x1E0C9D648];
    if (!CGRectEqualToRect(*MEMORY[0x1E0C9D648], self->_richLinkSourceRect))
    {
      v67.origin.x = p_richLinkSourceRect->origin.x;
      v67.origin.y = self->_richLinkSourceRect.origin.y;
      v67.size.width = self->_richLinkSourceRect.size.width;
      v67.size.height = self->_richLinkSourceRect.size.height;
      v68 = CGRectInset(v67, -22.0, -10.0);
      v69 = CGRectOffset(v68, 14.0, 0.0);
      v66.x = v11;
      v66.y = v12;
      if (!CGRectContainsPoint(v69, v66))
      {
        v30 = (CGSize)v29[1];
        p_richLinkSourceRect->origin = *v29;
        self->_richLinkSourceRect.size = v30;
        -[MFComposeWebView hideMakeLinkAccessoryButton](self, "hideMakeLinkAccessoryButton");
      }
    }
  }

}

uint64_t __75__MFComposeWebView_showRichLinkAccessoryButtonForExistingRichLink_message___block_invoke(uint64_t a1)
{
  int v1;
  void *v2;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(void **)(a1 + 32);
  if (v1)
    return objc_msgSend(v2, "removeRichLinkFromSelection");
  else
    return objc_msgSend(v2, "makeRichLinkFromSelection");
}

void __75__MFComposeWebView_showRichLinkAccessoryButtonForExistingRichLink_message___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ef_urlByAddingSchemeIfNeeded");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURL:options:completionHandler:", v4, MEMORY[0x1E0C9AA70], 0);

  objc_msgSend(*(id *)(a1 + 40), "hideMakeLinkAccessoryButton");
}

uint64_t __75__MFComposeWebView_showRichLinkAccessoryButtonForExistingRichLink_message___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didTapEditLink:", *(_QWORD *)(a1 + 40));
}

- (id)_actionWithTitle:(void *)a3 glyphName:(void *)a4 handler:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __55__MFComposeWebView__actionWithTitle_glyphName_handler___block_invoke;
    v14[3] = &unk_1E5A66C90;
    v15 = v9;
    objc_msgSend(v10, "actionWithTitle:image:identifier:handler:", v7, v11, 0, v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __75__MFComposeWebView_showRichLinkAccessoryButtonForExistingRichLink_message___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didTapRemoveLink");
}

uint64_t __75__MFComposeWebView_showRichLinkAccessoryButtonForExistingRichLink_message___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didTapEditTextDescription:", 0);
}

uint64_t __75__MFComposeWebView_showRichLinkAccessoryButtonForExistingRichLink_message___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didTapEditTextDescription:", *(_QWORD *)(a1 + 40));
}

- (void)richLinkDidStartLoading:(id)a3
{
  double x;
  double y;
  double width;
  double height;
  CGRect *p_richLinkSourceRect;
  CGSize v9;
  void *v10;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  CGRect v30;

  v29 = a3;
  -[MFComposeWebView _rectFromMessageDict:](self, "_rectFromMessageDict:");
  x = v30.origin.x;
  y = v30.origin.y;
  width = v30.size.width;
  height = v30.size.height;
  p_richLinkSourceRect = &self->_richLinkSourceRect;
  if (CGRectIntersectsRect(v30, self->_richLinkSourceRect))
  {
    x = p_richLinkSourceRect->origin.x;
    y = self->_richLinkSourceRect.origin.y;
    width = self->_richLinkSourceRect.size.width;
    height = self->_richLinkSourceRect.size.height;
    v9 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    p_richLinkSourceRect->origin = (CGPoint)*MEMORY[0x1E0C9D648];
    self->_richLinkSourceRect.size = v9;
  }
  objc_msgSend(v29, "ef_objectOfClass:forKey:", objc_opt_class(), CFSTR("linkID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (width != *MEMORY[0x1E0C9D820] || height != *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      -[MFComposeWebView richLinkActivityIndicators](self, "richLinkActivityIndicators");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        -[MFComposeWebView _linkAccessoryButtonFrameForSourceRect:](self, "_linkAccessoryButtonFrameForSourceRect:", x, y, width, height);
        v15 = v14;
        v17 = v16;
        -[MFComposeWebView hideMakeLinkAccessoryButton](self, "hideMakeLinkAccessoryButton");
        -[MFComposeWebView _makeRichLinkTemplateButtonWithOrigin:](self, "_makeRichLinkTemplateButtonWithOrigin:", v15, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_alloc(MEMORY[0x1E0DC3438]);
        v20 = (void *)objc_msgSend(v19, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v20, "setActivityIndicatorViewStyle:", 3);
        objc_msgSend(v20, "startAnimating");
        objc_msgSend(v18, "addSubview:", v20);
        objc_msgSend(v18, "centerXAnchor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "centerXAnchor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "constraintEqualToAnchor:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addConstraint:", v23);

        objc_msgSend(v18, "centerYAnchor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "centerYAnchor");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "constraintEqualToAnchor:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addConstraint:", v26);

        -[MFComposeWebView scrollView](self, "scrollView");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "addSubview:", v18);

        -[MFComposeWebView richLinkActivityIndicators](self, "richLinkActivityIndicators");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v20, v10);

      }
    }
  }

}

- (void)richLinkDidFinishLoading:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (v8)
  {
    -[MFComposeWebView richLinkActivityIndicators](self, "richLinkActivityIndicators");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    objc_msgSend(v5, "removeFromSuperview");
    -[MFComposeWebView richLinkActivityIndicators](self, "richLinkActivityIndicators");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v8);

  }
}

- (id)makeLinkAccessoryButton
{
  UIButton *makeLinkAccessoryButton;
  UIButton *v4;
  UIButton *v5;
  UIButton *v6;
  void *v7;
  void *v8;

  makeLinkAccessoryButton = self->_makeLinkAccessoryButton;
  if (!makeLinkAccessoryButton)
  {
    -[MFComposeWebView _makeRichLinkTemplateButtonWithOrigin:](self, "_makeRichLinkTemplateButtonWithOrigin:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_makeLinkAccessoryButton;
    self->_makeLinkAccessoryButton = v4;

    v6 = self->_makeLinkAccessoryButton;
    objc_msgSend(MEMORY[0x1E0DC3870], "mf_systemImageNamed:forView:", CFSTR("chevron.down"), 22);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](v6, "setImage:forState:", v7, 0);

    -[UIButton setHidden:](self->_makeLinkAccessoryButton, "setHidden:", 1);
    -[UIButton setAlpha:](self->_makeLinkAccessoryButton, "setAlpha:", 0.0);
    -[UIButton setContextMenuInteractionEnabled:](self->_makeLinkAccessoryButton, "setContextMenuInteractionEnabled:", 1);
    -[UIButton setShowsMenuAsPrimaryAction:](self->_makeLinkAccessoryButton, "setShowsMenuAsPrimaryAction:", 1);
    -[MFComposeWebView scrollView](self, "scrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", self->_makeLinkAccessoryButton);

    makeLinkAccessoryButton = self->_makeLinkAccessoryButton;
  }
  return makeLinkAccessoryButton;
}

- (id)_makeRichLinkTemplateButtonWithOrigin:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  y = a3.y;
  x = a3.x;
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrame:", x, y, 34.0, 28.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v6);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGray2Color");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v7);

  objc_msgSend(v5, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerRadius:", 9.0);

  return v5;
}

- (void)_showmakeLinkAccessoryButton
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  -[MFComposeWebView makeLinkAccessoryButton](self, "makeLinkAccessoryButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 0);
  v3 = (void *)MEMORY[0x1E0DC3F10];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__MFComposeWebView__showmakeLinkAccessoryButton__block_invoke;
  v5[3] = &unk_1E5A65480;
  v4 = v2;
  v6 = v4;
  objc_msgSend(v3, "animateWithDuration:animations:completion:", v5, &__block_literal_global_254, 0.1);

}

uint64_t __48__MFComposeWebView__showmakeLinkAccessoryButton__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (void)hideMakeLinkAccessoryButton
{
  UIButton *makeLinkAccessoryButton;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  makeLinkAccessoryButton = self->_makeLinkAccessoryButton;
  if (makeLinkAccessoryButton)
  {
    if ((-[UIButton isHidden](makeLinkAccessoryButton, "isHidden") & 1) == 0)
    {
      -[MFComposeWebView makeLinkAccessoryButton](self, "makeLinkAccessoryButton");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0DC3F10];
      v6 = MEMORY[0x1E0C809B0];
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __47__MFComposeWebView_hideMakeLinkAccessoryButton__block_invoke;
      v10[3] = &unk_1E5A65480;
      v11 = v4;
      v8[0] = v6;
      v8[1] = 3221225472;
      v8[2] = __47__MFComposeWebView_hideMakeLinkAccessoryButton__block_invoke_2;
      v8[3] = &unk_1E5A66750;
      v9 = v11;
      v7 = v11;
      objc_msgSend(v5, "animateWithDuration:animations:completion:", v10, v8, 0.1);

    }
  }
}

uint64_t __47__MFComposeWebView_hideMakeLinkAccessoryButton__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __47__MFComposeWebView_hideMakeLinkAccessoryButton__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHidden:", 1);
}

- (void)insertRichLinkWithURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[MFComposeWebView _bodyFieldProxy](self, "_bodyFieldProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertRichLinkWithURL:completionHandler:", v8, v6);

}

- (void)makeRichLinkFromSelection
{
  id v2;

  -[MFComposeWebView _bodyFieldProxy](self, "_bodyFieldProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "makeRichLinkFromSelection");

}

- (void)removeRichLinkFromSelection
{
  void *v3;

  -[MFComposeWebView _bodyFieldProxy](self, "_bodyFieldProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeRichLinkFromSelection");

  -[MFComposeWebView hideMakeLinkAccessoryButton](self, "hideMakeLinkAccessoryButton");
}

- (void)pasteRichLink
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "ef_isHTTPOrHTTPSURL"))
  {
    -[MFComposeWebView _bodyFieldProxy](self, "_bodyFieldProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "insertRichLinkWithURL:completionHandler:", v5, &__block_literal_global_255);

  }
}

- (void)enableQuickReply:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_isQuickReply != a3)
  {
    v3 = a3;
    self->_isQuickReply = a3;
    -[MFComposeWebView _bodyFieldProxy](self, "_bodyFieldProxy");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enableQuickReply:", v3);

  }
}

- (void)invalidateInputContextHistory
{
  -[MFComposeWebView setPreviousInputContextHistory:](self, "setPreviousInputContextHistory:", 0);
}

- (MFMailSignatureController)signatureControllerProxy
{
  MFMailSignatureController *signatureControllerProxy;
  void *v4;
  void *v5;
  MFMailSignatureController *v6;
  MFMailSignatureController *v7;

  signatureControllerProxy = self->_signatureControllerProxy;
  if (!signatureControllerProxy)
  {
    -[MFComposeWebView _remoteObjectRegistry](self, "_remoteObjectRegistry");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEF6C8], "remoteObjectInterfaceWithProtocol:", &unk_1EECCC510);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteObjectProxyWithInterface:", v5);
    v6 = (MFMailSignatureController *)objc_claimAutoreleasedReturnValue();
    v7 = self->_signatureControllerProxy;
    self->_signatureControllerProxy = v6;

    signatureControllerProxy = self->_signatureControllerProxy;
  }
  return signatureControllerProxy;
}

- (id)_bodyFieldProxy
{
  MFComposeBodyFieldController *bodyFieldProxy;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  MFComposeBodyFieldController *v15;
  MFComposeBodyFieldController *v16;

  bodyFieldProxy = self->_bodyFieldProxy;
  if (!bodyFieldProxy)
  {
    objc_msgSend(MEMORY[0x1E0CEF6C8], "remoteObjectInterfaceWithProtocol:", &unk_1EECCC570);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_htmlStringsAttachmentURLsAndPlainTextAlternativeRemovingSignature_attachmentInfoByIdentifier_completion_, 1, 1);

    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_plainTextContentUsingAttachmentInfoByIdentifier_completionHandler_, 0, 1);

    -[MFComposeWebView _remoteObjectRegistry](self, "_remoteObjectRegistry");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "remoteObjectProxyWithInterface:", v4);
    v15 = (MFComposeBodyFieldController *)objc_claimAutoreleasedReturnValue();
    v16 = self->_bodyFieldProxy;
    self->_bodyFieldProxy = v15;

    bodyFieldProxy = self->_bodyFieldProxy;
  }
  return bodyFieldProxy;
}

- (MFMailComposeViewDelegate)mailComposeViewDelegate
{
  return (MFMailComposeViewDelegate *)objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
}

- (void)setMailComposeViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_mailComposeViewDelegate, a3);
}

- (void)setCompositionContextID:(id)a3
{
  objc_storeStrong((id *)&self->_compositionContextID, a3);
}

- (NSString)compositionContextID
{
  id WeakRetained;
  void *v4;
  void *v5;
  NSString *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "compositionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contextID");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = self->_compositionContextID;
  }

  return v6;
}

- (void)setMarkupString:(id)a3
{
  -[MFComposeWebView setMarkupString:quote:](self, "setMarkupString:quote:", a3, 0);
}

- (id)_attachmentInfoByURL
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  MFComposeAttachmentInfo *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  MFComposeAttachmentInfo *v16;
  void *v17;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  objc_msgSend(WeakRetained, "compositionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachments");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v19, "count"));
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v19;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v8, "contentID", v19);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)MFCreateURLForContentID();

        v11 = [MFComposeAttachmentInfo alloc];
        objc_msgSend(v8, "fileName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v8, "isBasicImage");
        v14 = objc_msgSend(v8, "isDisplayableImage");
        objc_msgSend(v8, "className");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[MFComposeAttachmentInfo initWithURL:filename:isBasicImage:isDisplayableImage:className:](v11, "initWithURL:filename:isBasicImage:isDisplayableImage:className:", v10, v12, v13, v14, v15);
        objc_msgSend(v10, "absoluteString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, v17);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }

  return v4;
}

- (void)appendOrReplace:(id)a3 withMarkupString:(id)a4 quote:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  id WeakRetained;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[MFComposeWebView _bodyFieldProxy](self, "_bodyFieldProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  v15 = objc_msgSend(WeakRetained, "compositionType");
  -[MFComposeWebView _attachmentInfoByURL](self, "_attachmentInfoByURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __70__MFComposeWebView_appendOrReplace_withMarkupString_quote_completion___block_invoke;
  v18[3] = &unk_1E5A66A08;
  v18[4] = self;
  v17 = v12;
  v19 = v17;
  objc_msgSend(v13, "appendOrReplace:withMarkupString:quote:composeType:attachmentInfoByURL:completionHandler:", v10, v11, v7, v15, v16, v18);

}

void __70__MFComposeWebView_appendOrReplace_withMarkupString_quote_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  EMLogCompose();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1AB96A000, v4, OS_LOG_TYPE_DEFAULT, "Appending or replacing attachments %{public}@", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1880), "addEntriesFromDictionary:", v3);
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(void))(v6 + 16))();

}

- (id)_attachmentInfoByIdentifier
{
  uint64_t v2;
  uint64_t i;
  uint64_t v4;
  void *v5;
  MFComposeAttachmentInfo *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  MFComposeAttachmentInfo *v13;
  void *v14;
  NSMutableDictionary *obj;
  uint64_t v17;
  void *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSMutableDictionary count](self->_attachmentsByUniqueIdentifier, "count"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = self->_attachmentsByUniqueIdentifier;
  v2 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v2)
  {
    v17 = *(_QWORD *)v22;
    do
    {
      v20 = v2;
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(obj);
        v4 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_attachmentsByUniqueIdentifier, "objectForKeyedSubscript:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = [MFComposeAttachmentInfo alloc];
        objc_msgSend(v5, "contentID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)MFCreateURLForContentID();
        objc_msgSend(v5, "fileName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v5, "isBasicImage");
        v11 = objc_msgSend(v5, "isDisplayableImage");
        objc_msgSend(v5, "className");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[MFComposeAttachmentInfo initWithURL:filename:isBasicImage:isDisplayableImage:className:](v6, "initWithURL:filename:isBasicImage:isDisplayableImage:className:", v8, v9, v10, v11, v12);
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v13, v4);

      }
      v2 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v2);
  }

  v14 = (void *)objc_msgSend(v19, "copy");
  return v14;
}

- (id)plainTextContent
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeWebView _bodyFieldProxy](self, "_bodyFieldProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeWebView _attachmentInfoByIdentifier](self, "_attachmentInfoByIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __36__MFComposeWebView_plainTextContent__block_invoke;
  v9[3] = &unk_1E5A66A30;
  v6 = v3;
  v10 = v6;
  objc_msgSend(v4, "plainTextContentUsingAttachmentInfoByIdentifier:completionHandler:", v5, v9);

  objc_msgSend(v6, "future");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __36__MFComposeWebView_plainTextContent__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v21 = a2;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v21, "count"));
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = v21;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v24;
    v22 = *MEMORY[0x1E0D4D488];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v24 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v6);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          plainTextDocumentFromStringsAndQuoteLevels(v7, 0);
          v8 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v8);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_16;
          v8 = v7;
          if (objc_msgSend(v8, "isFileURL"))
          {
            v9 = (void *)MEMORY[0x1E0C99E98];
            v10 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v8, "resourceSpecifier");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "stringWithFormat:", CFSTR("%@:%@"), v22, v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "URLWithString:", v12);
            v13 = objc_claimAutoreleasedReturnValue();

            v8 = (id)v13;
LABEL_12:
            objc_msgSend(MEMORY[0x1E0D4D520], "defaultManager");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "attachmentForCID:", v8);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
              objc_msgSend(v2, "addObject:", v17);

            goto LABEL_15;
          }
          objc_msgSend(v8, "scheme");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", v22);

          if ((v15 & 1) != 0)
            goto LABEL_12;
        }
LABEL_15:

LABEL_16:
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v4);
  }

  v18 = *(void **)(a1 + 32);
  v19 = (void *)objc_msgSend(v2, "copy");
  objc_msgSend(v18, "finishWithResult:", v19);

}

- (void)setCaretPosition:(unint64_t)a3
{
  id v4;

  -[MFComposeWebView _bodyFieldProxy](self, "_bodyFieldProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCaretPosition:", a3);

}

- (id)getCaretPosition
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeWebView _bodyFieldProxy](self, "_bodyFieldProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__MFComposeWebView_getCaretPosition__block_invoke;
  v8[3] = &unk_1E5A66A58;
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "getCaretPosition:", v8);

  objc_msgSend(v5, "future");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __36__MFComposeWebView_getCaretPosition__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
}

- (_NSRange)selectedRange
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = 0;
  v3 = 0;
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)insertDocumentWithURL:(id)a3 isDrawingFile:(BOOL)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__MFComposeWebView_insertDocumentWithURL_isDrawingFile___block_invoke;
  v4[3] = &unk_1E5A66AA8;
  v4[4] = self;
  -[MFComposeWebView prepareDataForDocumentAtURLForInsertion:completion:](self, "prepareDataForDocumentAtURLForInsertion:completion:", a3, v4);
}

void __56__MFComposeWebView_insertDocumentWithURL_isDrawingFile___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  uint64_t v15;
  id v16;
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__MFComposeWebView_insertDocumentWithURL_isDrawingFile___block_invoke_2;
  v14[3] = &unk_1E5A66A80;
  v15 = *(_QWORD *)(a1 + 32);
  v10 = v7;
  v16 = v10;
  v11 = v8;
  v17 = v11;
  v12 = v9;
  v18 = v12;
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler", v14[0], 3221225472, __56__MFComposeWebView_insertDocumentWithURL_isDrawingFile___block_invoke_2, &unk_1E5A66A80, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "performSyncBlock:", v14);

}

uint64_t __56__MFComposeWebView_insertDocumentWithURL_isDrawingFile___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "insertDocumentWithData:fileName:mimeType:contentID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0);
}

- (void)prepareDataForDocumentAtURLForInsertion:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *, void *);
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, void *, void *))a4;
  objc_msgSend(v6, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeWebView mimeTypeForFilename:](self, "mimeTypeForFilename:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "startAccessingSecurityScopedResource");
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0D46080], "dataWithContentsOfURL:options:error:", v6, 1, &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v14;
  if (v10)
    objc_msgSend(v6, "stopAccessingSecurityScopedResource");
  if (!v11 || !v8 || !v9)
  {
    EMLogCompose();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413314;
      v16 = v6;
      v17 = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = v8;
      v21 = 2112;
      v22 = v9;
      v23 = 2112;
      v24 = v12;
      _os_log_error_impl(&dword_1AB96A000, v13, OS_LOG_TYPE_ERROR, "Error while preparing data for the document at url: %@\ndata: %@\nfileName: %@\nmimeType: %@\n%@", buf, 0x34u);
    }

  }
  if (v7)
    v7[2](v7, v11, v8, v9);

}

- (id)mimeTypeForFilename:(id)a3
{
  __CFString *v3;

  objc_msgSend(MEMORY[0x1E0D4D540], "mimeTypeForFileName:", a3);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v3, "length"))
  {

    v3 = CFSTR("application/octet-stream");
  }
  return v3;
}

- (void)setOriginalAttachmentInfo:(id)a3
{
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
    objc_storeStrong((id *)&self->_originalAttachmentWrappers, a3);

}

- (void)showOriginalAttachments
{
  MFComposeWebView *v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  NSArray *obj;
  uint64_t v17;
  uint64_t v18;
  MFComposeWebView *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!self->_originalAttachmentsWereRestored)
  {
    v2 = self;
    v15 = 1898;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    obj = self->_originalAttachmentWrappers;
    v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v3)
    {
      v17 = *(_QWORD *)v26;
      v19 = v2;
      do
      {
        v18 = v3;
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v26 != v17)
            objc_enumerationMutation(obj);
          v5 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v5, "contentID", v15);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "preferredFilename");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "mimeType");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "regularFileContents");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[MFComposeWebView _bodyFieldProxy](v19, "_bodyFieldProxy");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v20[0] = MEMORY[0x1E0C809B0];
          v20[1] = 3221225472;
          v20[2] = __43__MFComposeWebView_showOriginalAttachments__block_invoke;
          v20[3] = &unk_1E5A66AD0;
          v20[4] = v19;
          v11 = v9;
          v21 = v11;
          v12 = v7;
          v22 = v12;
          v13 = v8;
          v23 = v13;
          v14 = v6;
          v24 = v14;
          objc_msgSend(v10, "countDuplicatedAttachments:completionHandler:", v12, v20);

          v2 = v19;
        }
        v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v3);
    }

    *((_BYTE *)&v2->super.super.super.super.isa + v15) = 1;
  }
}

void __43__MFComposeWebView_showOriginalAttachments__block_invoke(uint64_t a1, void *a2)
{
  int i;
  id v4;

  v4 = a2;
  for (i = 0; i < (int)objc_msgSend(v4, "intValue"); ++i)
    objc_msgSend(*(id *)(a1 + 32), "replaceFilenamePlaceholderWithAttachment:fileName:mimeType:contentID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

- (void)insertDocumentWithData:(id)a3 fileName:(id)a4 mimeType:(id)a5 contentID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  unsigned int v22;
  _QWORD v23[4];
  NSObject *v24;
  id v25;
  _BYTE buf[24];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  EMLogCompose();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v13;
    _os_log_impl(&dword_1AB96A000, v14, OS_LOG_TYPE_DEFAULT, "Inserting document data with content ID %{public}@", buf, 0xCu);
  }

  if (v10
    && v11
    && (-[MFComposeWebView _addInlineAttachmentWithData:fileName:type:contentID:](self, "_addInlineAttachmentWithData:fileName:type:contentID:", v10, v11, v12, v13), v15 = (void *)objc_claimAutoreleasedReturnValue(), (v16 = v15) != 0))
  {
    objc_msgSend(v15, "className");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v17, "isEqualToString:", 0x1E5A6A6E8);

    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    -[MFComposeWebView _bodyFieldProxy](self, "_bodyFieldProxy");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v16, "isSinglePagePDFFile");
    objc_msgSend(v16, "fileUTType");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __71__MFComposeWebView_insertDocumentWithData_fileName_mimeType_contentID___block_invoke;
    v23[3] = &unk_1E5A66AF8;
    objc_copyWeak(&v25, (id *)buf);
    v21 = v16;
    v24 = v21;
    objc_msgSend(v18, "insertAttachmentAsImage:isSinglePagePDF:contentType:completionHandler:", v22, v19, v20, v23);

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    EMLogCompose();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[MFComposeWebView insertDocumentWithData:fileName:mimeType:contentID:].cold.1();
  }

}

void __71__MFComposeWebView_insertDocumentWithData_fileName_mimeType_contentID___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "contentID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained[235], "setObject:forKeyedSubscript:", v4, v6);

    objc_msgSend(WeakRetained, "composeBodyFieldDidChange");
    objc_msgSend(WeakRetained, "mailComposeViewDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didInsertAttachment:", *(_QWORD *)(a1 + 32));

  }
}

- (void)insertPhotoOrVideoWithAssetIdentifier:(id)a3 infoDictionary:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  _BOOL4 v15;
  void *v16;
  id v17;

  v17 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4C98]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DC5878]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4C90]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DC58E8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10 != 0;
  v15 = v11 == 0;
  if (v14 && v15)
    v16 = v10;
  else
    v16 = v11;
  -[MFComposeWebView _insertMediaWithAssetIdentifier:mediaURL:mediaType:mediaData:isVideo:completion:](self, "_insertMediaWithAssetIdentifier:mediaURL:mediaType:mediaData:isVideo:completion:", v17, v16, v12, v13, v14 & v15, v9);

}

- (void)insertMediaWithPhotoPickerItem:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  objc_msgSend(v12, "contentIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "assetURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "assetData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeWebView _insertMediaWithAssetIdentifier:mediaURL:mediaType:mediaData:isVideo:completion:](self, "_insertMediaWithAssetIdentifier:mediaURL:mediaType:mediaData:isVideo:completion:", v7, v8, v10, v11, objc_msgSend(v12, "isVideo"), v6);

}

- (void)_insertMediaWithAssetIdentifier:(id)a3 mediaURL:(id)a4 mediaType:(id)a5 mediaData:(id)a6 isVideo:(BOOL)a7 completion:(id)a8
{
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  _QWORD *v33;
  _QWORD v34[4];
  id v35;
  MFComposeWebView *v36;
  id v37;
  id v38;
  _QWORD *v39;
  _QWORD v40[5];
  id v41;
  _QWORD v42[5];
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;

  v9 = a7;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  if (v9)
  {
    v29 = v17;
    -[MFComposeWebView _filenameForVideoAttachmentAtURL:](self, "_filenameForVideoAttachmentAtURL:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }
    objc_msgSend(v20, "preferredMIMEType");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1F070], "globalAsyncSchedulerWithQualityOfService:", 25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __100__MFComposeWebView__insertMediaWithAssetIdentifier_mediaURL_mediaType_mediaData_isVideo_completion___block_invoke;
    v42[3] = &unk_1E5A66B20;
    v42[4] = self;
    v43 = v15;
    v27 = v25;
    v44 = v27;
    v28 = v19;
    v45 = v28;
    v46 = v14;
    v47 = v18;
    objc_msgSend(v26, "performBlock:", v42);

    v17 = v29;
  }
  else
  {
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x3032000000;
    v40[3] = __Block_byref_object_copy__3;
    v40[4] = __Block_byref_object_dispose__3;
    v41 = (id)0xAAAAAAAAAAAAAAAALL;
    v21 = v17;
    v41 = v21;
    if (!v15 || v21)
    {
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __100__MFComposeWebView__insertMediaWithAssetIdentifier_mediaURL_mediaType_mediaData_isVideo_completion___block_invoke_5;
      v30[3] = &unk_1E5A66B48;
      v30[4] = self;
      v33 = v40;
      v31 = v14;
      v32 = v18;
      objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "performSyncBlock:", v30);

      v23 = v31;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D1F070], "globalAsyncSchedulerWithQualityOfService:", 25);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __100__MFComposeWebView__insertMediaWithAssetIdentifier_mediaURL_mediaType_mediaData_isVideo_completion___block_invoke_3;
      v34[3] = &unk_1E5A66B70;
      v39 = v40;
      v35 = v15;
      v36 = self;
      v37 = v14;
      v38 = v18;
      objc_msgSend(v22, "performBlock:", v34);

      v23 = v35;
    }

    _Block_object_dispose(v40, 8);
  }

}

void __100__MFComposeWebView__insertMediaWithAssetIdentifier_mediaURL_mediaType_mediaData_isVideo_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v5[4];
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "_makeAttachmentDataWithFileURL:type:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __100__MFComposeWebView__insertMediaWithAssetIdentifier_mediaURL_mediaType_mediaData_isVideo_completion___block_invoke_2;
  v5[3] = &unk_1E5A66B20;
  v6 = *(_QWORD *)(a1 + 32);
  v3 = v2;
  v7 = v3;
  v8 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 64);
  v11 = *(id *)(a1 + 72);
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler", v5[0], 3221225472, __100__MFComposeWebView__insertMediaWithAssetIdentifier_mediaURL_mediaType_mediaData_isVideo_completion___block_invoke_2, &unk_1E5A66B20, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performSyncBlock:", v5);

}

uint64_t __100__MFComposeWebView__insertMediaWithAssetIdentifier_mediaURL_mediaType_mediaData_isVideo_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "insertDocumentWithData:fileName:mimeType:contentID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  result = *(_QWORD *)(a1 + 72);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __100__MFComposeWebView__insertMediaWithAssetIdentifier_mediaURL_mediaType_mediaData_isVideo_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;

  objc_msgSend(MEMORY[0x1E0D46080], "dataWithContentsOfURL:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __100__MFComposeWebView__insertMediaWithAssetIdentifier_mediaURL_mediaType_mediaData_isVideo_completion___block_invoke_4;
  v8[3] = &unk_1E5A66B48;
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(void **)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 40);
  v12 = v5;
  v10 = v6;
  v11 = *(id *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler", v8[0], 3221225472, __100__MFComposeWebView__insertMediaWithAssetIdentifier_mediaURL_mediaType_mediaData_isVideo_completion___block_invoke_4, &unk_1E5A66B48, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performSyncBlock:", v8);

}

uint64_t __100__MFComposeWebView__insertMediaWithAssetIdentifier_mediaURL_mediaType_mediaData_isVideo_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_insertDocumentFromData:isImage:contentID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), 1, *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __100__MFComposeWebView__insertMediaWithAssetIdentifier_mediaURL_mediaType_mediaData_isVideo_completion___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_insertDocumentFromData:isImage:contentID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), 1, *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)removeMediaWithContentIdentifier:(id)a3
{
  id v4;
  NSMutableDictionary *attachmentsByUniqueIdentifier;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v4 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__3;
  v28 = __Block_byref_object_dispose__3;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__3;
  v22 = __Block_byref_object_dispose__3;
  v23 = 0;
  attachmentsByUniqueIdentifier = self->_attachmentsByUniqueIdentifier;
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__MFComposeWebView_removeMediaWithContentIdentifier___block_invoke;
  v14[3] = &unk_1E5A66B98;
  v7 = v4;
  v15 = v7;
  v16 = &v24;
  v17 = &v18;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](attachmentsByUniqueIdentifier, "enumerateKeysAndObjectsUsingBlock:", v14);
  if (v25[5] && v19[5])
  {
    -[MFComposeWebView _attachmentForIdentifier:](self, "_attachmentForIdentifier:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeWebView _bodyFieldProxy](self, "_bodyFieldProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v19[5];
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __53__MFComposeWebView_removeMediaWithContentIdentifier___block_invoke_2;
    v12[3] = &unk_1E5A65430;
    v12[4] = self;
    v11 = v8;
    v13 = v11;
    objc_msgSend(v9, "removeMediaAttachment:completionHandler:", v10, v12);

  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
}

void __53__MFComposeWebView_removeMediaWithContentIdentifier___block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;
  void *v9;
  int v10;
  id v11;

  v11 = a2;
  v8 = a3;
  objc_msgSend(v8, "contentID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", a1[4]))
  {
    v10 = objc_msgSend(v8, "isMediaFile");

    if (v10)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
      objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
      *a4 = 1;
    }
  }
  else
  {

  }
}

uint64_t __53__MFComposeWebView_removeMediaWithContentIdentifier___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeAttachment:", *(_QWORD *)(a1 + 40));
}

- (void)insertScannedDocumentWithData:(id)a3
{
  -[MFComposeWebView _insertDocumentFromData:isImage:contentID:](self, "_insertDocumentFromData:isImage:contentID:", a3, 0, 0);
}

- (void)_insertDocumentFromData:(id)a3 isImage:(BOOL)a4 contentID:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  id v10;
  _BOOL4 v11;
  id v12;
  id v13;
  void *v14;
  unint64_t imageCount;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (v8)
  {
    v10 = v8;
    v18 = 0;
    v19 = 0;
    v11 = -[MFComposeWebView _getExtensionAndMimeTypeForImageData:outExtension:outMimeType:](self, "_getExtensionAndMimeTypeForImageData:outExtension:outMimeType:", v10, &v19, &v18);
    v12 = v19;
    v13 = v18;
    if (v11)
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      if (v6)
      {
        imageCount = self->_imageCount;
        self->_imageCount = imageCount + 1;
        objc_msgSend(v14, "stringWithFormat:", CFSTR("image%lu.%@"), imageCount, v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[MFComposeWebView nextAttachmentName](self, "nextAttachmentName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("%@.%@"), v17, v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
      -[MFComposeWebView insertDocumentWithData:fileName:mimeType:contentID:](self, "insertDocumentWithData:fileName:mimeType:contentID:", v10, v16, v13, v9);
    }
    else
    {
      v16 = 0;
    }

  }
}

- (id)contentIDsForMediaAttachments
{
  void *v2;
  void *v3;

  -[NSMutableDictionary allValues](self->_attachmentsByUniqueIdentifier, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ef_compactMap:", &__block_literal_global_344);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __49__MFComposeWebView_contentIDsForMediaAttachments__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "isMediaFile"))
  {
    objc_msgSend(v2, "contentID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)updateInputAssistantItem
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1AB96A000, v0, v1, "Expected the first group to be a standard system group, but got %{public}@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

id __44__MFComposeWebView_updateInputAssistantItem__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "count");
  v7 = objc_msgSend(v5, "count");
  if (v6 && v7)
  {
    objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6)
      v9 = v4;
    else
      v9 = v5;
    v8 = v9;
  }
  v10 = v8;

  return v10;
}

- (void)getHTMLDataObject:(id)a3
{
  -[MFComposeWebView getHTMLDataObjectRemovingSignature:completion:](self, "getHTMLDataObjectRemovingSignature:completion:", 0, a3);
}

- (void)getHTMLDataObjectRemovingSignature:(BOOL)a3 completion:(id)a4
{
  -[MFComposeWebView getHTMLDataObjectRemovingSignature:removeQuotes:completion:](self, "getHTMLDataObjectRemovingSignature:removeQuotes:completion:", a3, 0, a4);
}

- (void)getHTMLDataObjectRemovingSignature:(BOOL)a3 removeQuotes:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  BOOL v14;

  v6 = a3;
  v8 = a5;
  -[MFComposeWebView _bodyFieldProxy](self, "_bodyFieldProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeWebView _attachmentInfoByIdentifier](self, "_attachmentInfoByIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__MFComposeWebView_getHTMLDataObjectRemovingSignature_removeQuotes_completion___block_invoke;
  v12[3] = &unk_1E5A66C40;
  v14 = a4;
  v11 = v8;
  v13 = v11;
  objc_msgSend(v9, "htmlStringsAttachmentURLsAndPlainTextAlternativeRemovingSignature:attachmentInfoByIdentifier:completion:", v6, v10, v12);

}

void __79__MFComposeWebView_getHTMLDataObjectRemovingSignature_removeQuotes_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  MFHTMLDataObject *v14;
  id v15;

  v15 = a2;
  v9 = a4;
  v10 = a5;
  objc_msgSend(a3, "ef_map:", &__block_literal_global_348);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  plainTextDocumentFromStringsAndQuoteLevels(v9, *(unsigned __int8 *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D5E8]), "initWithContentIDs:", v10);
  v14 = -[MFHTMLDataObject initWithHTMLString:otherHTMLStringsAndAttachments:plainTextAlternative:quotedAttachmentsInfo:]([MFHTMLDataObject alloc], "initWithHTMLString:otherHTMLStringsAndAttachments:plainTextAlternative:quotedAttachmentsInfo:", v15, v11, v12, v13);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

id __79__MFComposeWebView_getHTMLDataObjectRemovingSignature_removeQuotes_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D4D520], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "attachmentForCID:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v2;
    else
      v5 = 0;
  }

  return v5;
}

- (void)placeCaretAtStartOfBodyField
{
  id v2;

  -[MFComposeWebView _bodyFieldProxy](self, "_bodyFieldProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "placeCaretAtStartOfBody");

}

- (id)htmlString
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  EMLogCompose();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AB96A000, v3, OS_LOG_TYPE_DEFAULT, "MFComposeWebView - htmlString", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeWebView _bodyFieldProxy](self, "_bodyFieldProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeWebView _attachmentInfoByIdentifier](self, "_attachmentInfoByIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __30__MFComposeWebView_htmlString__block_invoke;
  v10[3] = &unk_1E5A66C68;
  v7 = v4;
  v11 = v7;
  objc_msgSend(v5, "htmlStringUsingAttachmentInfoByIdentifier:completionHandler:", v6, v10);

  objc_msgSend(v7, "future");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __30__MFComposeWebView_htmlString__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  EMLogCompose();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1AB96A000, v4, OS_LOG_TYPE_DEFAULT, "Finished retrieving the HTML string", v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v3);
}

- (id)containsRichText
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  uint8_t buf[16];

  EMLogCompose();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AB96A000, v3, OS_LOG_TYPE_DEFAULT, "MFComposeWebView - containsRichText", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeWebView _bodyFieldProxy](self, "_bodyFieldProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __36__MFComposeWebView_containsRichText__block_invoke;
  v9[3] = &unk_1E5A66750;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "containsRichText:", v9);

  objc_msgSend(v6, "future");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __36__MFComposeWebView_containsRichText__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  EMLogCompose();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = a2;
    _os_log_impl(&dword_1AB96A000, v4, OS_LOG_TYPE_DEFAULT, "Does the webview contain rich text? Answer: %{BOOL}d", (uint8_t *)v7, 8u);
  }

  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishWithResult:", v6);

}

- (CGRect)rectOfElementWithID:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D628];
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setPrefersFirstLineSelection
{
  id v2;

  -[MFComposeWebView _bodyFieldProxy](self, "_bodyFieldProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "forceNextSelectionFromSecondToFirstLine");

}

- (void)prependMarkupString:(id)a3 quote:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  v12 = a3;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFComposeWebView.m"), 1191, CFSTR("string is nil, JavaScript will crash"));

  }
  -[MFComposeWebView _bodyFieldProxy](self, "_bodyFieldProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  v9 = objc_msgSend(WeakRetained, "compositionType");
  -[MFComposeWebView _attachmentInfoByIdentifier](self, "_attachmentInfoByIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addMarkupString:quote:emptyFirst:prepended:composeType:attachmentInfoByURL:", v12, v4, 0, 1, v9, v10);

}

- (void)appendMarkupString:(id)a3 quote:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  v12 = a3;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFComposeWebView.m"), 1196, CFSTR("string is nil, JavaScript will crash"));

  }
  -[MFComposeWebView _bodyFieldProxy](self, "_bodyFieldProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  v9 = objc_msgSend(WeakRetained, "compositionType");
  -[MFComposeWebView _attachmentInfoByIdentifier](self, "_attachmentInfoByIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addMarkupString:quote:emptyFirst:prepended:composeType:attachmentInfoByURL:", v12, v4, 0, 0, v9, v10);

}

- (void)addMailAttributesBeforeDisplayHidingTrailingEmptyQuotes:(BOOL)a3 shouldQuote:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;

  v4 = a4;
  v5 = a3;
  -[MFComposeWebView _bodyFieldProxy](self, "_bodyFieldProxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addMailAttributesBeforeDisplayHidingTrailingEmptyQuotes:shouldQuote:", v5, v4);

}

- (void)prependString:(id)a3
{
  void *v4;
  void *v5;
  id WeakRetained;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  -[MFComposeWebView _bodyFieldProxy](self, "_bodyFieldProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mf_stringByEscapingHTMLCodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  v7 = objc_msgSend(WeakRetained, "compositionType");
  -[MFComposeWebView _attachmentInfoByIdentifier](self, "_attachmentInfoByIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addMarkupString:quote:emptyFirst:prepended:composeType:attachmentInfoByURL:", v5, 0, 0, 1, v7, v8);

}

- (void)prependPreamble:(id)a3 quote:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  -[MFComposeWebView _bodyFieldProxy](self, "_bodyFieldProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "prependPreamble:quote:layoutDirection:", v7, v4, objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection"));

}

- (void)replaceImagesIfNecessary
{
  id v2;

  -[MFComposeWebView _bodyFieldProxy](self, "_bodyFieldProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "replaceImagesIfNecessary");

}

- (void)stripCustomBodyIdentifiers
{
  id v2;

  -[MFComposeWebView _bodyFieldProxy](self, "_bodyFieldProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stripCustomBodyIdentifiers");

}

- (void)setReplacementFilenamesByContentID:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFComposeWebView _bodyFieldProxy](self, "_bodyFieldProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReplacementFilenamesByContentID:", v5);

}

- (void)setMarkupString:(id)a3 quote:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id WeakRetained;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  -[MFComposeWebView _bodyFieldProxy](self, "_bodyFieldProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  v8 = objc_msgSend(WeakRetained, "compositionType");
  -[MFComposeWebView _attachmentInfoByIdentifier](self, "_attachmentInfoByIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addMarkupString:quote:emptyFirst:prepended:composeType:attachmentInfoByURL:", v10, v4, 1, 1, v8, v9);

}

- (void)replaceAttachment:(id)a3 withDocumentAtURL:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id WeakRetained;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void (**v25)(id, NSObject *);
  uint8_t buf[4];
  MFComposeWebView *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v25 = (void (**)(id, NSObject *))a5;
  EMLogCompose();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "ef_publicDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v27 = self;
    v28 = 2114;
    v29 = v11;
    _os_log_impl(&dword_1AB96A000, v10, OS_LOG_TYPE_DEFAULT, "<%p> Replacing attachment: %{public}@", buf, 0x16u);

  }
  objc_msgSend(v8, "mimeType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeWebView _makeAttachmentDataWithFileURL:type:](self, "_makeAttachmentDataWithFileURL:type:", v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "fileName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13
    && (objc_msgSend(v8, "mimeType"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        -[MFComposeWebView _addInlineAttachmentWithData:fileName:type:contentID:](self, "_addInlineAttachmentWithData:fileName:type:contentID:", v13, v14, v15, 0), v16 = objc_claimAutoreleasedReturnValue(), v15, v16))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
    objc_msgSend(WeakRetained, "compositionContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "removeAttachment:", v8);
    -[NSMutableDictionary allKeysForObject:](self->_attachmentsByUniqueIdentifier, "allKeysForObject:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[MFComposeWebView _attachmentForIdentifier:](self, "_attachmentForIdentifier:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_attachmentsByUniqueIdentifier, "setObject:forKeyedSubscript:", v16, v19);
    -[NSObject fileWrapperUsingFetchedLocalData](v16, "fileWrapperUsingFetchedLocalData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileUTType");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFileWrapper:contentType:completion:", v21, v22, 0);

    -[MFComposeWebView mailComposeViewDelegate](self, "mailComposeViewDelegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "didInsertAttachment:", v16);

    if (v25)
      v25[2](v25, v16);

  }
  else
  {
    MFLogGeneral();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MFComposeWebView replaceAttachment:withDocumentAtURL:completion:].cold.1();
  }

}

- (void)_changeQuoteLevelBy:(int64_t)a3
{
  void *v4;
  id v5;

  -[MFComposeWebView _bodyFieldProxy](self, "_bodyFieldProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (bundle_onceToken != -1)
    dispatch_once(&bundle_onceToken, &__block_literal_global_1010);
  objc_msgSend((id)bundle_bundle, "localizedStringForKey:value:table:", CFSTR("UNDO_QUOTE_LEVEL"), &stru_1E5A6A588, CFSTR("Main"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changeQuoteLevelBy:withUndoActionName:", a3, v4);

}

- (void)_increaseQuoteLevel:(id)a3
{
  -[MFComposeWebView _changeQuoteLevelBy:](self, "_changeQuoteLevelBy:", 1);
}

- (void)_decreaseQuoteLevel:(id)a3
{
  -[MFComposeWebView _changeQuoteLevelBy:](self, "_changeQuoteLevelBy:", -1);
}

uint64_t __55__MFComposeWebView__actionWithTitle_glyphName_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)buildMenuWithBuilder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MFComposeWebView;
  -[MFComposeWebView buildMenuWithBuilder:](&v5, sel_buildMenuWithBuilder_, v4);
  -[MFComposeWebView _addContextMenusToBuilder:](self, "_addContextMenusToBuilder:", v4);

}

- (void)_addContextMenusToBuilder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id *v40;
  id *v41;
  void *v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  id location;
  _QWORD v57[2];
  _QWORD v58[3];

  v58[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "system");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC39F0], "contextSystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v7 = -[MFComposeWebView _contentViewIsFirstResponder](self, "_contentViewIsFirstResponder");

    if ((v7 & 1) != 0)
    {
      location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      if (-[MFComposeWebView _shouldShowAddLinkButton](self, "_shouldShowAddLinkButton"))
      {
        _EFLocalizedString();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v54[0] = MEMORY[0x1E0C809B0];
        v54[1] = 3221225472;
        v54[2] = __46__MFComposeWebView__addContextMenusToBuilder___block_invoke;
        v54[3] = &unk_1E5A66CB8;
        objc_copyWeak(&v55, &location);
        -[MFComposeWebView _actionWithTitle:glyphName:handler:]((uint64_t)self, v8, CFSTR("link"), v54);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = (void *)MEMORY[0x1E0DC39D0];
        v58[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "menuWithTitle:image:identifier:options:children:", &stru_1E5A6A588, 0, 0, 1, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "insertChildMenu:atEndOfMenuForIdentifier:", v12, *MEMORY[0x1E0DC5120]);
        objc_destroyWeak(&v55);
      }
      if (bundle_onceToken != -1)
        dispatch_once(&bundle_onceToken, &__block_literal_global_1010);
      v13 = (id)bundle_bundle;
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("INCREASE"), &stru_1E5A6A588, CFSTR("Main"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __46__MFComposeWebView__addContextMenusToBuilder___block_invoke_2;
      v52[3] = &unk_1E5A66CB8;
      v41 = &v53;
      objc_copyWeak(&v53, &location);
      -[MFComposeWebView _actionWithTitle:glyphName:handler:]((uint64_t)self, v14, CFSTR("increase.quotelevel"), v52);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v43, "setAttributes:", 8);
      if (bundle_onceToken != -1)
        dispatch_once(&bundle_onceToken, &__block_literal_global_1010);
      v15 = (id)bundle_bundle;
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("DECREASE"), &stru_1E5A6A588, CFSTR("Main"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __46__MFComposeWebView__addContextMenusToBuilder___block_invoke_3;
      v50[3] = &unk_1E5A66CB8;
      v40 = &v51;
      objc_copyWeak(&v51, &location);
      -[MFComposeWebView _actionWithTitle:glyphName:handler:]((uint64_t)self, v16, CFSTR("decrease.quotelevel"), v50);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v42, "setAttributes:", 8);
      v17 = (void *)MEMORY[0x1E0DC39D0];
      if (bundle_onceToken != -1)
        dispatch_once(&bundle_onceToken, &__block_literal_global_1010);
      v18 = (id)bundle_bundle;
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("QUOTE_LEVEL"), &stru_1E5A6A588, CFSTR("Main"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("quotelevel"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = v42;
      v57[1] = v43;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "menuWithTitle:image:identifier:options:children:", v19, v20, 0, 0, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = *MEMORY[0x1E0DC50E0];
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __46__MFComposeWebView__addContextMenusToBuilder___block_invoke_4;
      v48[3] = &unk_1E5A66CE0;
      v24 = v22;
      v49 = v24;
      objc_msgSend(v4, "replaceChildrenOfMenuForIdentifier:fromChildrenBlock:", v23, v48);
      v25 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
      if (-[MFComposeWebView _shouldShowMarkupButton](self, "_shouldShowMarkupButton"))
      {
        if (bundle_onceToken != -1)
          dispatch_once(&bundle_onceToken, &__block_literal_global_1010);
        v26 = (id)bundle_bundle;
        objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("MARKUP_ATTACHMENT"), &stru_1E5A6A588, CFSTR("Main"), &v51, &v53);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __46__MFComposeWebView__addContextMenusToBuilder___block_invoke_5;
        v46[3] = &unk_1E5A66CB8;
        objc_copyWeak(&v47, &location);
        -[MFComposeWebView _actionWithTitle:glyphName:handler:]((uint64_t)self, v27, CFSTR("pencil.tip.crop.circle"), v46);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v25, "addObject:", v28);
        objc_destroyWeak(&v47);
      }
      if (bundle_onceToken != -1)
        dispatch_once(&bundle_onceToken, &__block_literal_global_1010);
      v29 = (id)bundle_bundle;
      objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("INSERT_PHOTO_OR_VIDEO"), &stru_1E5A6A588, CFSTR("Main"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFComposeWebView _insertPhotoActionWithTitle:](self, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "ef_addOptionalObject:", v31);

      if (bundle_onceToken != -1)
        dispatch_once(&bundle_onceToken, &__block_literal_global_1010);
      v32 = (id)bundle_bundle;
      objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("IMPORT_DOCUMENT"), &stru_1E5A6A588, CFSTR("Main"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFComposeWebView _importDocumentActionWithTitle:]((id *)&self->super.super.super.super.isa, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "ef_addOptionalObject:", v34);

      -[MFComposeWebView _scanDocumentAction](self);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "ef_addOptionalObject:", v35);

      if (bundle_onceToken != -1)
        dispatch_once(&bundle_onceToken, &__block_literal_global_1010);
      v36 = (id)bundle_bundle;
      objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("INSERT_DRAWING_BUTTON"), &stru_1E5A6A588, CFSTR("Main"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __46__MFComposeWebView__addContextMenusToBuilder___block_invoke_6;
      v44[3] = &unk_1E5A66CB8;
      objc_copyWeak(&v45, &location);
      -[MFComposeWebView _actionWithTitle:glyphName:handler:]((uint64_t)self, v37, CFSTR("pencil.tip.crop.circle.badge.plus"), v44);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "addObject:", v38);
      objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E5A6A588, 0, 0, 1, v25);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "insertChildMenu:atEndOfMenuForIdentifier:", v39, v23);

      objc_destroyWeak(&v45);
      objc_destroyWeak(v40);

      objc_destroyWeak(v41);
      objc_destroyWeak(&location);
    }
  }
  else
  {

  }
}

void __46__MFComposeWebView__addContextMenusToBuilder___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didTapAddLink:", WeakRetained);

}

void __46__MFComposeWebView__addContextMenusToBuilder___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_increaseQuoteLevel:", WeakRetained);

}

void __46__MFComposeWebView__addContextMenusToBuilder___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_decreaseQuoteLevel:", WeakRetained);

}

id __46__MFComposeWebView__addContextMenusToBuilder___block_invoke_4(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "arrayByAddingObject:", *(_QWORD *)(a1 + 32));
  return (id)objc_claimAutoreleasedReturnValue();
}

void __46__MFComposeWebView__addContextMenusToBuilder___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didTapMarkupButton:", WeakRetained);

}

- (id)_insertPhotoActionWithTitle:(void *)a1
{
  id v3;
  _QWORD v5[4];
  id v6;
  id location;

  v3 = a2;
  if (a1)
  {
    if (MFIsAuthorizedToAccessPhotoLibrary() && (objc_msgSend(a1, "_shouldShowInsertPhotosButton") & 1) != 0)
    {
      location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, a1);
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __48__MFComposeWebView__insertPhotoActionWithTitle___block_invoke;
      v5[3] = &unk_1E5A66CB8;
      objc_copyWeak(&v6, &location);
      -[MFComposeWebView _actionWithTitle:glyphName:handler:]((uint64_t)a1, v3, CFSTR("photo.on.rectangle"), v5);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (id)_importDocumentActionWithTitle:(id *)a1
{
  id v3;
  id WeakRetained;
  char v5;
  _QWORD v7[4];
  id v8;
  id location;

  v3 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 222);
    v5 = objc_msgSend(WeakRetained, "canShowAttachmentPicker");

    if ((v5 & 1) != 0)
    {
      location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, a1);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __51__MFComposeWebView__importDocumentActionWithTitle___block_invoke;
      v7[3] = &unk_1E5A66CB8;
      objc_copyWeak(&v8, &location);
      -[MFComposeWebView _actionWithTitle:glyphName:handler:]((uint64_t)a1, v3, CFSTR("doc"), v7);
      a1 = (id *)objc_claimAutoreleasedReturnValue();
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (id)_scanDocumentAction
{
  id v1;
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  v1 = a1;
  if (a1)
  {
    if (objc_msgSend(MEMORY[0x1E0CEE5B8], "isSupported"))
    {
      location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, v1);
      if (bundle_onceToken != -1)
        dispatch_once(&bundle_onceToken, &__block_literal_global_1010);
      objc_msgSend((id)bundle_bundle, "localizedStringForKey:value:table:", CFSTR("SCAN_DOCUMENT_MENU_ITEM"), &stru_1E5A6A588, CFSTR("Main"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __39__MFComposeWebView__scanDocumentAction__block_invoke;
      v4[3] = &unk_1E5A66CB8;
      objc_copyWeak(&v5, &location);
      -[MFComposeWebView _actionWithTitle:glyphName:handler:]((uint64_t)v1, v2, CFSTR("doc.text.viewfinder"), v4);
      v1 = (id)objc_claimAutoreleasedReturnValue();
      objc_destroyWeak(&v5);

      objc_destroyWeak(&location);
    }
    else
    {
      v1 = 0;
    }
  }
  return v1;
}

void __46__MFComposeWebView__addContextMenusToBuilder___block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didTapInsertDrawing:", WeakRetained);

}

- (BOOL)isDirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v3 = a3;
  ++self->_dirtyChangeIgnoreCount;
  self->_dirty = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[MFComposeWebView _bodyFieldProxy](self, "_bodyFieldProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__MFComposeWebView_setDirty___block_invoke;
  v6[3] = &unk_1E5A66CB8;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "setDirty:completionHandler:", v3, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __29__MFComposeWebView_setDirty___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    --WeakRetained[229];

}

- (id)nextAttachmentName
{
  void *v3;
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (bundle_onceToken != -1)
    dispatch_once(&bundle_onceToken, &__block_literal_global_1010);
  v4 = (id)bundle_bundle;
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DEFAULT_ATTACHMENT_NAME"), &stru_1E5A6A588, CFSTR("Main"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self->_attachmentSequenceNumber + 1;
  self->_attachmentSequenceNumber = v6;
  objc_msgSend(v3, "localizedStringWithFormat:", CFSTR("%@ %ld"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)allowsAttachmentElements
{
  return 1;
}

- (id)inputView
{
  void *v3;
  void *v4;
  objc_super v6;

  -[MFComposeWebView inputViewForPreservingFocus](self, "inputViewForPreservingFocus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MFComposeWebView inputViewForPreservingFocus](self, "inputViewForPreservingFocus");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MFComposeWebView;
    -[MFComposeWebView inputView](&v6, sel_inputView);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)retainFocusAfterPresenting
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc(MEMORY[0x1E0DC38B0]);
  v5 = (id)objc_msgSend(v3, "initWithFrame:inputViewStyle:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v5, "setUserInteractionEnabled:", 0);
  objc_msgSend(v5, "setAllowsSelfSizing:", 1);
  -[MFComposeWebView setInputViewForPreservingFocus:](self, "setInputViewForPreservingFocus:", v5);
  -[MFComposeWebView firstResponder](self, "firstResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadInputViews");

}

- (void)releaseFocusAfterDismissing:(BOOL)a3
{
  MFComposeWebView *v4;
  MFComposeWebView *v5;
  id v6;
  _QWORD block[5];
  MFComposeWebView *v8;

  if (a3)
  {
    v5 = self;
    -[MFComposeWebView resignFirstResponder](v5, "resignFirstResponder");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__MFComposeWebView_releaseFocusAfterDismissing___block_invoke;
    block[3] = &unk_1E5A65430;
    block[4] = v5;
    v8 = v5;
    v4 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    -[MFComposeWebView setInputViewForPreservingFocus:](self, "setInputViewForPreservingFocus:", 0);
    -[MFComposeWebView firstResponder](self, "firstResponder");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadInputViews");

  }
}

uint64_t __48__MFComposeWebView_releaseFocusAfterDismissing___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setInputViewForPreservingFocus:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "becomeFirstResponder");
}

- (void)compositionWillFinish
{
  self->_isFinishing = 1;
}

- (void)compositionDidFailToFinish
{
  self->_isFinishing = 0;
}

- (id)_mailComposeEditingLeadingInputAssistantGroups
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeWebView _formattingAction]((id *)&self->super.super.super.super.isa);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithPrimaryAction:", v26);
    v5 = objc_alloc(MEMORY[0x1E0DC3500]);
    v27[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithBarButtonItems:representativeItem:", v6, 0);

    objc_msgSend(v3, "addObject:", v7);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (bundle_onceToken != -1)
    dispatch_once(&bundle_onceToken, &__block_literal_global_1010);
  v9 = (id)bundle_bundle;
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("PHOTO_LIBRARY"), &stru_1E5A6A588, CFSTR("Main"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeWebView _insertPhotoActionWithTitle:](self, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeWebView _barButtonItemWithAction:target:selector:]((uint64_t)self, v11, self, (uint64_t)sel__didTapInsertPhotoButton_);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "ef_addOptionalObject:", v12);
  if (bundle_onceToken != -1)
    dispatch_once(&bundle_onceToken, &__block_literal_global_1010);
  v13 = (id)bundle_bundle;
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("TAKE_PHOTO_OR_VIDEO"), &stru_1E5A6A588, CFSTR("Main"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeWebView _insertPhotoFromCameraActionWithTitle:](self, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeWebView _barButtonItemWithAction:target:selector:]((uint64_t)self, v15, self, (uint64_t)sel__didTapCameraButton_);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "ef_addOptionalObject:", v16);
  -[MFComposeWebView _scanDocumentAction](self);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeWebView _barButtonItemWithAction:target:selector:]((uint64_t)self, v17, self, (uint64_t)sel__scanDocumentCommandInvoked_);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "ef_addOptionalObject:", v18);
  -[MFComposeWebView textFromCameraButtonItem](self, "textFromCameraButtonItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ef_addOptionalObject:", v19);

  if (objc_msgSend(v8, "count"))
  {
    if (bundle_onceToken != -1)
      dispatch_once(&bundle_onceToken, &__block_literal_global_1010);
    v20 = (id)bundle_bundle;
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("INSERT_PHOTO_OR_VIDEO_ACTIONS"), &stru_1E5A6A588, CFSTR("Main"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeWebView _barButtonItemWithImageName:title:target:selector:]((uint64_t)self, CFSTR("camera.badge.ellipsis"), v21, 0, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3500]), "initWithBarButtonItems:representativeItem:", v8, v22);
    objc_msgSend(v3, "addObject:", v23);
    -[MFComposeWebView setPhotoAndCameraGroup:](self, "setPhotoAndCameraGroup:", v23);

  }
  -[MFComposeWebView set_leadingInputAssistantItemGroups:](self, "set_leadingInputAssistantItemGroups:", v3);
  -[MFComposeWebView _leadingInputAssistantItemGroups](self, "_leadingInputAssistantItemGroups");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)_formattingAction
{
  id WeakRetained;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id location;

  if (a1
    && (WeakRetained = objc_loadWeakRetained(a1 + 222),
        v3 = objc_opt_respondsToSelector(),
        WeakRetained,
        (v3 & 1) != 0))
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, a1);
    objc_msgSend(MEMORY[0x1E0DC3870], "mf_assistantBarSystemImageNamed:", CFSTR("textformat"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0DC3428];
    if (bundle_onceToken != -1)
      dispatch_once(&bundle_onceToken, &__block_literal_global_1010);
    objc_msgSend((id)bundle_bundle, "localizedStringForKey:value:table:", CFSTR("FORMAT_TEXT"), &stru_1E5A6A588, CFSTR("Main"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __37__MFComposeWebView__formattingAction__block_invoke;
    v9[3] = &unk_1E5A666D8;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", v6, v4, 0, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v10);

    objc_destroyWeak(&location);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_barButtonItemWithAction:(void *)a3 target:(uint64_t)a4 selector:
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v7 = a2;
  v8 = a3;
  v9 = 0;
  if (a1 && v7)
  {
    v10 = objc_alloc(MEMORY[0x1E0DC34F0]);
    objc_msgSend(v7, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "image");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v10, "initWithTitle:image:target:action:menu:", v11, v12, v8, a4, 0);

  }
  return v9;
}

- (id)_insertPhotoFromCameraActionWithTitle:(void *)a1
{
  id v3;
  _QWORD v5[4];
  id v6;
  id location;

  v3 = a2;
  if (a1)
  {
    if ((objc_msgSend(a1, "_shouldShowInsertPhotosButton") & 1) != 0)
    {
      location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, a1);
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __58__MFComposeWebView__insertPhotoFromCameraActionWithTitle___block_invoke;
      v5[3] = &unk_1E5A66CB8;
      objc_copyWeak(&v6, &location);
      -[MFComposeWebView _actionWithTitle:glyphName:handler:]((uint64_t)a1, v3, CFSTR("camera"), v5);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (id)_barButtonItemWithImageName:(void *)a3 title:(void *)a4 target:(uint64_t)a5 selector:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "mf_assistantBarSystemImageNamed:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:image:target:action:menu:", v10, v12, v11, a5, 0);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_mailComposeEditingTrailingInputAssistantGroups
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (bundle_onceToken != -1)
      dispatch_once(&bundle_onceToken, &__block_literal_global_1010);
    v6 = (id)bundle_bundle;
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("IMPORT_DOCUMENT"), &stru_1E5A6A588, CFSTR("Main"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeWebView _importDocumentActionWithTitle:]((id *)&self->super.super.super.super.isa, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeWebView _barButtonItemWithAction:target:selector:]((uint64_t)self, v8, self, (uint64_t)sel__importDocumentCommandInvoked_);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "ef_addOptionalObject:", v9);
    if (objc_msgSend(v5, "count"))
    {
      if (bundle_onceToken != -1)
        dispatch_once(&bundle_onceToken, &__block_literal_global_1010);
      v10 = (id)bundle_bundle;
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("INSERT_DOCUMENT_ACTIONS"), &stru_1E5A6A588, CFSTR("Main"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFComposeWebView _barButtonItemWithImageName:title:target:selector:]((uint64_t)self, CFSTR("doc.badge.ellipsis"), v11, 0, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3500]), "initWithBarButtonItems:representativeItem:", v5, v12);
      objc_msgSend(v4, "addObject:", v13);

    }
    if (bundle_onceToken != -1)
      dispatch_once(&bundle_onceToken, &__block_literal_global_1010);
    v14 = (id)bundle_bundle;
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("INSERT_DRAWING_MENU_ITEM"), &stru_1E5A6A588, CFSTR("Main"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeWebView _markupActionWithTitle:](self, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeWebView _barButtonItemWithAction:target:selector:]((uint64_t)self, v16, self, (uint64_t)sel__didTapInsertDrawingOrMarkupButton_);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_alloc(MEMORY[0x1E0DC3500]);
    v23[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithBarButtonItems:representativeItem:", v19, 0);

    objc_msgSend(v4, "addObject:", v20);
    -[MFComposeWebView set_trailingInputAssistantItemGroups:](self, "set_trailingInputAssistantItemGroups:", v4);

  }
  -[MFComposeWebView _trailingInputAssistantItemGroups](self, "_trailingInputAssistantItemGroups");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)_markupActionWithTitle:(void *)a1
{
  id v3;
  _QWORD v5[4];
  id v6;
  id location;

  v3 = a2;
  if (a1)
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, a1);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __43__MFComposeWebView__markupActionWithTitle___block_invoke;
    v5[3] = &unk_1E5A66CB8;
    objc_copyWeak(&v6, &location);
    -[MFComposeWebView _actionWithTitle:glyphName:handler:]((uint64_t)a1, v3, CFSTR("pencil.tip.crop.circle"), v5);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }

  return a1;
}

void __37__MFComposeWebView__formattingAction__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v9, "sender");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
      v6 = (void *)v4;
    else
      v6 = WeakRetained;
    v7 = v6;

    objc_msgSend(WeakRetained, "donateHasUsedAttachment");
    objc_msgSend(WeakRetained, "mailComposeViewDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "showStyleSelector:", v7);

  }
}

void __48__MFComposeWebView__insertPhotoActionWithTitle___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didTapInsertPhotoButton:", WeakRetained);

}

void __58__MFComposeWebView__insertPhotoFromCameraActionWithTitle___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didTapCameraButton:", WeakRetained);

}

void __39__MFComposeWebView__scanDocumentAction__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_scanDocumentCommandInvoked:", WeakRetained);

}

void __51__MFComposeWebView__importDocumentActionWithTitle___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_importDocumentCommandInvoked:", WeakRetained);

}

void __43__MFComposeWebView__markupActionWithTitle___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didTapInsertDrawingOrMarkupButton:", WeakRetained);

}

- (id)_captureTextFromCameraAction
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(a1, "firstResponder");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v1, "canPerformAction:withSender:", sel_captureTextFromCamera_, 0) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0DC3428], "captureTextFromCameraActionForResponder:identifier:", v1, 0);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)_didTapCameraButton:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  -[MFComposeWebView donateHasUsedAttachment](self, "donateHasUsedAttachment");
  WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  objc_msgSend(WeakRetained, "showPhotoPickerWithSourceType:fromSource:", 1, v5);

}

- (void)_didTapMarkupButton:(id)a3
{
  if (-[MFComposeWebView _shouldShowMarkupButton](self, "_shouldShowMarkupButton", a3))
    -[MFComposeWebView markupSelectedAttachment](self, "markupSelectedAttachment");
}

- (void)_didTapInsertPhotoButton:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  -[MFComposeWebView donateHasUsedAttachment](self, "donateHasUsedAttachment");
  WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  objc_msgSend(WeakRetained, "showPhotoPickerWithSourceType:fromSource:", 0, v5);

}

- (void)_didTapInsertDrawingOrMarkupButton:(id)a3
{
  id WeakRetained;

  -[MFComposeWebView donateHasUsedAttachment](self, "donateHasUsedAttachment", a3);
  if (-[MFComposeWebView _shouldShowMarkupButton](self, "_shouldShowMarkupButton"))
  {
    -[MFComposeWebView markupSelectedAttachment](self, "markupSelectedAttachment");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
    objc_msgSend(WeakRetained, "insertDrawing");

  }
}

- (void)_didTapInsertDrawing:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  objc_msgSend(WeakRetained, "insertDrawing");

}

- (void)_importDocumentCommandInvoked:(id)a3
{
  id WeakRetained;

  -[MFComposeWebView donateHasUsedAttachment](self, "donateHasUsedAttachment", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  objc_msgSend(WeakRetained, "importDocument");

}

- (void)_scanDocumentCommandInvoked:(id)a3
{
  id WeakRetained;

  -[MFComposeWebView donateHasUsedAttachment](self, "donateHasUsedAttachment", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  objc_msgSend(WeakRetained, "scanDocument");

}

- (void)_removeInlineAttachment:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id WeakRetained;
  void *v12;
  id v13;

  v13 = a3;
  -[MFComposeWebView undoManager](self, "undoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "prepareWithInvocationTarget:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fetchDataSynchronously:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fileName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "mimeType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v6, "_addInlineAttachmentWithData:fileName:type:contentID:", v7, v8, v9, 0);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  objc_msgSend(WeakRetained, "compositionContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAttachment:", v13);

}

- (void)_increaseQuoteLevelKeyCommandInvoked:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  objc_msgSend(WeakRetained, "changeQuoteLevel:", 1);

}

- (void)_decreaseQuoteLevelKeyCommandInvoked:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  objc_msgSend(WeakRetained, "changeQuoteLevel:", -1);

}

- (void)_didTapAddLink:(id)a3
{
  void *v4;
  id WeakRetained;
  _QWORD v6[5];

  -[MFComposeWebView _bodyFieldProxy](self, "_bodyFieldProxy", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEditLinkFlag");

  WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__MFComposeWebView__didTapAddLink___block_invoke;
  v6[3] = &unk_1E5A66C68;
  v6[4] = self;
  objc_msgSend(WeakRetained, "addLink:", v6);

}

void __35__MFComposeWebView__didTapAddLink___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  NSObject *v9;
  uint8_t v10[16];

  v3 = a2;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "ef_urlWithString:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "_bodyFieldProxy");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject ef_urlByAddingSchemeIfNeeded](v4, "ef_urlByAddingSchemeIfNeeded");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "absoluteString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addLink:", v7);

      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1776));
      objc_msgSend(WeakRetained, "setHasAddedEditableHyperlink:", 1);

    }
    else
    {
      EMLogCompose();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __35__MFComposeWebView__didTapAddLink___block_invoke_cold_1();

    }
  }
  else
  {
    EMLogCompose();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1AB96A000, v4, OS_LOG_TYPE_DEFAULT, "Adding hyperlink was cancelled.", v10, 2u);
    }
  }

}

- (void)_didTapEditLink:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  _QWORD v7[5];

  v4 = a3;
  -[MFComposeWebView hideMakeLinkAccessoryButton](self, "hideMakeLinkAccessoryButton");
  -[MFComposeWebView _bodyFieldProxy](self, "_bodyFieldProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEditLinkFlag");

  WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__MFComposeWebView__didTapEditLink___block_invoke;
  v7[3] = &unk_1E5A66C68;
  v7[4] = self;
  objc_msgSend(WeakRetained, "editLink:completion:", v4, v7);

}

void __36__MFComposeWebView__didTapEditLink___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v3 = a2;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "ef_urlWithString:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "_bodyFieldProxy");
      v5 = objc_claimAutoreleasedReturnValue();
      -[NSObject ef_urlByAddingSchemeIfNeeded](v4, "ef_urlByAddingSchemeIfNeeded");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "absoluteString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject updateLinkFromExistingLink:isEditing:](v5, "updateLinkFromExistingLink:isEditing:", v7, 1);

    }
    else
    {
      EMLogCompose();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __36__MFComposeWebView__didTapEditLink___block_invoke_cold_1();
    }

  }
  else
  {
    EMLogCompose();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1AB96A000, v4, OS_LOG_TYPE_DEFAULT, "Editing hyperlink was cancelled.", v8, 2u);
    }
  }

}

- (void)_didTapRemoveLink
{
  id v3;

  -[MFComposeWebView hideMakeLinkAccessoryButton](self, "hideMakeLinkAccessoryButton");
  -[MFComposeWebView _bodyFieldProxy](self, "_bodyFieldProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeLink");

}

- (void)_didTapEditTextDescription:(id)a3
{
  id v4;
  id WeakRetained;
  _QWORD v6[5];

  v4 = a3;
  -[MFComposeWebView hideMakeLinkAccessoryButton](self, "hideMakeLinkAccessoryButton");
  WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__MFComposeWebView__didTapEditTextDescription___block_invoke;
  v6[3] = &unk_1E5A66C68;
  v6[4] = self;
  objc_msgSend(WeakRetained, "editTextDescription:completion:", v4, v6);

}

void __47__MFComposeWebView__didTapEditTextDescription___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_bodyFieldProxy");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject addTextDescriptionToLink:](v4, "addTextDescriptionToLink:", v3);
  }
  else
  {
    EMLogCompose();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1AB96A000, v4, OS_LOG_TYPE_DEFAULT, "Adding text description to hyperlink was cancelled.", v5, 2u);
    }
  }

}

- (void)replaceFilenamePlaceholderWithAttachment:(id)a3 fileName:(id)a4 mimeType:(id)a5 contentID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  NSObject *v28;
  _BYTE *v29;
  _QWORD v30[5];
  NSObject *v31;
  _BYTE buf[24];
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  EMLogCompose();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0D1EF48], "partiallyRedactedStringForString:", v11);
    v15 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2114;
    v33 = v15;
    _os_log_impl(&dword_1AB96A000, v14, OS_LOG_TYPE_DEFAULT, "<%p> Replacing placehold with attachment for content ID: %{public}@, file name: %{public}@", buf, 0x20u);

  }
  if (v10
    && v11
    && (-[MFComposeWebView _addInlineAttachmentWithData:fileName:type:contentID:](self, "_addInlineAttachmentWithData:fileName:type:contentID:", v10, v11, v12, v13), v16 = objc_claimAutoreleasedReturnValue(), (v17 = v16) != 0))
  {
    -[NSObject className](v16, "className");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "isEqualToString:", 0x1E5A6A6E8) & 1) != 0
      || objc_msgSend(v18, "isEqualToString:", 0x1E5A6A728))
    {
      -[MFComposeWebView _bodyFieldProxy](self, "_bodyFieldProxy");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __89__MFComposeWebView_replaceFilenamePlaceholderWithAttachment_fileName_mimeType_contentID___block_invoke;
      v30[3] = &unk_1E5A66D08;
      v30[4] = self;
      v31 = v17;
      objc_msgSend(v19, "replaceFilenamePlaceholderWithImage:completionHandler:", v11, v30);

    }
    else
    {
      -[MFComposeWebView _bodyFieldProxy](self, "_bodyFieldProxy");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "placeCaretAtStartOfBody");

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v33 = __Block_byref_object_copy__3;
      v34 = __Block_byref_object_dispose__3;
      v35 = 0;
      -[NSObject fileWrapperUsingFetchedLocalData](v17, "fileWrapperUsingFetchedLocalData");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject mimeType](v17, "mimeType");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __89__MFComposeWebView_replaceFilenamePlaceholderWithAttachment_fileName_mimeType_contentID___block_invoke_2;
      v26[3] = &unk_1E5A66D30;
      v26[4] = self;
      v29 = buf;
      v27 = v11;
      v28 = v17;
      -[MFComposeWebView _insertAttachmentWithFileWrapper:contentType:completion:](self, "_insertAttachmentWithFileWrapper:contentType:completion:", v22, v23, v26);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = *(void **)(*(_QWORD *)&buf[8] + 40);
      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v24;

      _Block_object_dispose(buf, 8);
    }

  }
  else
  {
    EMLogCompose();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0D1EF48], "partiallyRedactedStringForString:", v11);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFComposeWebView replaceFilenamePlaceholderWithAttachment:fileName:mimeType:contentID:].cold.1((uint64_t)v13, v20, buf, v17);
    }
  }

}

void __89__MFComposeWebView_replaceFilenamePlaceholderWithAttachment_fileName_mimeType_contentID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "contentID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1880), "setObject:forKeyedSubscript:", v3, v5);

  }
  objc_msgSend(*(id *)(a1 + 32), "mailComposeViewDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didInsertAttachment:", *(_QWORD *)(a1 + 40));

}

void __89__MFComposeWebView_replaceFilenamePlaceholderWithAttachment_fileName_mimeType_contentID___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_addAttachment:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    objc_msgSend(*(id *)(a1 + 32), "_bodyFieldProxy");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "replaceFilenamePlaceholderWithAttachment:identifier:", v3, v4);

    objc_msgSend(*(id *)(a1 + 32), "mailComposeViewDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didInsertAttachment:", *(_QWORD *)(a1 + 48));

  }
}

- (id)_addInlineAttachmentWithData:(id)a3 fileName:(id)a4 type:(id)a5 contentID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v25;
  MFComposeWebView *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  EMLogCompose();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0D1EF48], "partiallyRedactedStringForString:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 134218498;
    v26 = self;
    v27 = 2114;
    v28 = v13;
    v29 = 2114;
    v30 = v15;
    _os_log_impl(&dword_1AB96A000, v14, OS_LOG_TYPE_DEFAULT, "<%p> _addInlineAttachmentWithData for content ID: %{public}@, file name: %{public}@", (uint8_t *)&v25, 0x20u);

  }
  if (objc_msgSend(MEMORY[0x1E0D4D540], "shouldCreatePlaceholderAttachmentForAttachmentWithSize:", objc_msgSend(v10, "length"))&& (objc_msgSend(MEMORY[0x1E0D4D528], "isPlaceholderSerializedRepresentation:", v10) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D4D528], "attachmentPlaceholderForData:fileName:type:contentID:", v10, v11, v12, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "serializedRepresentation");
    v17 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v17;
  }
  -[MFComposeWebView mailComposeViewDelegate](self, "mailComposeViewDelegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "compositionContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addAttachmentData:mimeType:fileName:contentID:", v10, v12, v11, v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v18, "didCreateAttachment:", v20);
    -[MFComposeWebView undoManager](self, "undoManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      objc_msgSend(v21, "prepareWithInvocationTarget:", self);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_removeInlineAttachment:", v20);

    }
  }

  return v20;
}

- (id)_makeAttachmentDataWithFileURL:(id)a3 type:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributesOfItemAtPath:error:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *MEMORY[0x1E0CB2AF0];
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0CB2AF0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_4;
  objc_msgSend(v9, "objectForKey:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedIntegerValue");

  if (!objc_msgSend(MEMORY[0x1E0D4D540], "shouldCreatePlaceholderAttachmentForAttachmentWithSize:", v13))
    goto LABEL_4;
  v14 = (void *)MEMORY[0x1E0D4D528];
  objc_msgSend(v5, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lastPathComponent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "attachmentPlaceholderForFileURL:fileName:fileSize:type:contentID:", v5, v16, v13, v6, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "serializedRepresentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0D46080], "dataWithContentsOfURL:", v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (id)_filenameForVideoAttachmentAtURL:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  v4 = a3;
  if (bundle_onceToken != -1)
    dispatch_once(&bundle_onceToken, &__block_literal_global_1010);
  v5 = (id)bundle_bundle;
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("VIDEO"), &stru_1E5A6A588, CFSTR("Main"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFComposeWebView mailComposeViewDelegate](self, "mailComposeViewDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "compositionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attachments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __53__MFComposeWebView__filenameForVideoAttachmentAtURL___block_invoke;
  v18[3] = &unk_1E5A66D58;
  v10 = v6;
  v19 = v10;
  objc_msgSend(v9, "indexesOfObjectsPassingTest:", v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "count");
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%lu"), v10, v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = v10;
  }
  v14 = v13;
  objc_msgSend(v4, "pathExtension");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingPathExtension:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

BOOL __53__MFComposeWebView__filenameForVideoAttachmentAtURL___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "fileName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "rangeOfString:", *(_QWORD *)(a1 + 32)) == 0;

  return v4;
}

- (BOOL)_getExtensionAndMimeTypeForImageData:(id)a3 outExtension:(id *)a4 outMimeType:(id *)a5
{
  const __CFData *v7;
  const __CFData *v8;
  CGImageSource *v9;
  CGImageSource *v10;
  void *v11;
  BOOL v12;
  void *v13;

  v7 = (const __CFData *)a3;
  v8 = v7;
  if (v7 && (v9 = CGImageSourceCreateWithData(v7, 0), (v10 = v9) != 0))
  {
    CGImageSourceGetType(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11 != 0;
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "preferredFilenameExtension");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "preferredMIMEType");
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    CFRelease(v10);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)_shouldShowAddLinkButton
{
  NSMutableDictionary *attachmentsByUniqueIdentifier;
  void *v3;
  void *v4;
  BOOL v5;

  attachmentsByUniqueIdentifier = self->_attachmentsByUniqueIdentifier;
  -[NSArray firstObject](self->_selectedAttachmentIdentifiers, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](attachmentsByUniqueIdentifier, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = !v4 && (_os_feature_enabled_impl() & 1) != 0;
  return v5;
}

- (BOOL)_shouldShowInsertPhotosButton
{
  void *v2;
  char v3;

  if (!-[MFComposeWebView _sourceIsManaged](self, "_sourceIsManaged"))
    return 1;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mayOpenFromUnmanagedToManaged");

  return v3;
}

- (BOOL)_shouldShowMarkupButton
{
  NSMutableDictionary *attachmentsByUniqueIdentifier;
  void *v3;
  void *v4;
  char v5;

  attachmentsByUniqueIdentifier = self->_attachmentsByUniqueIdentifier;
  -[NSArray firstObject](self->_selectedAttachmentIdentifiers, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](attachmentsByUniqueIdentifier, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "contentTypeConformsToMarkup");
  else
    v5 = 0;

  return v5;
}

- (void)_composeWebView:(id)a3 didChangeHeight:(double)a4
{
  id WeakRetained;

  if (_os_feature_enabled_impl())
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_composeWebViewDelegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "composeWebView:didChangeHeight:", self, a4);

  }
}

- (void)_composeWebView:(id)a3 composeBodyIsEmpty:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;

  v4 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_composeWebViewDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "composeWebView:composeBodyIsEmpty:", self, v4);

}

- (void)composeBodyFieldDidThrowException:(id)a3
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__MFComposeWebView_composeBodyFieldDidThrowException___block_invoke;
  block[3] = &unk_1E5A65480;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __54__MFComposeWebView_composeBodyFieldDidThrowException___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "raise");
}

- (void)composeBodyFieldDidChange
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_composeWebViewDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "composeWebViewTextChanged:", self);

}

- (void)composeBodyFieldIsDirtyChanged:(BOOL)a3
{
  if (!self->_dirtyChangeIgnoreCount)
    self->_dirty = a3;
}

- (void)composeBodyFieldAddAttachmentWithData:(id)a3 filename:(id)a4 mimeType:(id)a5 uniqueID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  EMLogCompose();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0D1EF48], "partiallyRedactedStringForString:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v23 = v15;
    _os_log_impl(&dword_1AB96A000, v14, OS_LOG_TYPE_DEFAULT, "Adding rich link preview [%{public}@]", buf, 0xCu);

  }
  if (v10 && v11 && v13)
  {
    -[MFComposeWebView _addInlineAttachmentWithData:fileName:type:contentID:](self, "_addInlineAttachmentWithData:fileName:type:contentID:", v10, v11, v12, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[MFComposeWebView _bodyFieldProxy](self, "_bodyFieldProxy");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __85__MFComposeWebView_composeBodyFieldAddAttachmentWithData_filename_mimeType_uniqueID___block_invoke;
      v20[3] = &unk_1E5A66D08;
      v20[4] = self;
      v21 = v16;
      objc_msgSend(v17, "replaceRichLinkPlaceholderImage:completionHandler:", v13, v20);

    }
    else
    {
      EMLogCompose();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0D1EF48], "partiallyRedactedStringForString:", v11);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFComposeWebView composeBodyFieldAddAttachmentWithData:filename:mimeType:uniqueID:].cold.1(v19, (uint64_t)buf, v18);
      }

    }
  }

}

void __85__MFComposeWebView_composeBodyFieldAddAttachmentWithData_filename_mimeType_uniqueID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "contentID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1880), "setObject:forKeyedSubscript:", v3, v5);

  }
  objc_msgSend(*(id *)(a1 + 32), "mailComposeViewDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didInsertAttachment:", *(_QWORD *)(a1 + 40));

}

- (void)composeBodyFieldSelectionContainsLinkStateDidChange:(BOOL)a3
{
  self->_selectionContainsLink = a3;
}

- (void)attachmentTapped:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *WeakRetained;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  EMLogCompose();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = v4;
    _os_log_impl(&dword_1AB96A000, v5, OS_LOG_TYPE_DEFAULT, "Attachment tapped with content ID: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D4D520], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attachmentForContentID:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    EMLogCompose();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
      -[MFComposeWebView attachmentTapped:].cold.1();
    goto LABEL_8;
  }
  if (objc_msgSend(v7, "contentTypeConformsToMarkup"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
    -[NSObject markupAttachment:](WeakRetained, "markupAttachment:", v7);
LABEL_8:

  }
}

- (void)composeBodyFieldQuickReplyEnabled:(id)a3
{
  void (**v4)(id, BOOL);

  v4 = (void (**)(id, BOOL))a3;
  v4[2](v4, -[MFComposeWebView isQuickReply](self, "isQuickReply"));

}

- (void)composeBodyFieldAddLinkPreviewsEnabled:(id)a3
{
  void *v3;
  void (**v4)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, objc_msgSend(v3, "BOOLForKey:", *MEMORY[0x1E0D1E010]) ^ 1);

}

- (void)selectedAttachmentIdentifiersDidChange:(id)a3
{
  objc_storeStrong((id *)&self->_selectedAttachmentIdentifiers, a3);
}

- (void)_findInteraction:(id)a3 navigatorPlacementWillChange:(id)a4
{
  void *v5;
  double v6;
  double v7;
  id WeakRetained;
  id v9;

  objc_msgSend(a4, "inlinePlacement", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v9 = v5;
    v6 = 0.0;
    if (objc_msgSend(v5, "isShowing"))
    {
      objc_msgSend(v9, "intrinsicContentSize");
      v6 = v7;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_composeWebViewDelegate);
    objc_msgSend(WeakRetained, "findNavigatorPanelDidChangeHeight:", v6);

    v5 = v9;
  }

}

- (id)_findInteractionScrollViewForInsetAdjustment:(id)a3
{
  -[MFComposeWebView scrollView](self, "scrollView", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_menuDidHide:(id)a3
{
  self->_shouldShowStandardButtons = 1;
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  (*((void (**)(id, uint64_t))a5 + 2))(a5, 1);
}

- (void)_webView:(id)a3 willStartInputSession:(id)a4
{
  objc_msgSend(a4, "setAccessoryViewShouldNotShow:", 1);
}

- (int64_t)_webView:(id)a3 decidePolicyForFocusedElement:(id)a4
{
  return 1;
}

- (void)_webView:(id)a3 didStartInputSession:(id)a4
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  if (self)
  {
    if (self->__didReloadInputAssistantItemOnFocus)
      return;
    self->__didReloadInputAssistantItemOnFocus = 1;
  }
  -[MFComposeWebView _captureTextFromCameraAction](self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[MFComposeWebView _barButtonItemWithAction:target:selector:]((uint64_t)self, v5, self, (uint64_t)sel__captureTextFromCamera);
    v6 = objc_claimAutoreleasedReturnValue();
    -[MFComposeWebView photoAndCameraGroup](self, "photoAndCameraGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[MFComposeWebView photoAndCameraGroup](self, "photoAndCameraGroup");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "barButtonItems");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "arrayByAddingObject:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFComposeWebView photoAndCameraGroup](self, "photoAndCameraGroup");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setBarButtonItems:", v10);

    }
    else
    {
      -[MFComposeWebView setTextFromCameraButtonItem:](self, "setTextFromCameraButtonItem:", v6);
    }
  }
  else
  {
    EMLogCompose();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1AB96A000, v6, OS_LOG_TYPE_DEFAULT, "Text-from-camera button was not added to input assistant.", v12, 2u);
    }
  }

}

- (void)_captureTextFromCamera
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  -[MFComposeWebView donateHasUsedAttachment](self, "donateHasUsedAttachment");
  EMLogCompose();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1AB96A000, v3, OS_LOG_TYPE_DEFAULT, "Capturing text from camera", v5, 2u);
  }

  -[MFComposeWebView firstResponder](self, "firstResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "canPerformAction:withSender:", sel_captureTextFromCamera_, 0))
    objc_msgSend(v4, "captureTextFromCamera:", 0);

}

- (void)_webView:(id)a3 didInvalidateDataForAttachment:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  MFComposeWebView *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  EMLogCompose();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134218242;
    v8 = self;
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1AB96A000, v6, OS_LOG_TYPE_DEFAULT, "<%p> Webview did invalidate data for attachment: %{public}@", (uint8_t *)&v7, 0x16u);
  }

  -[MFComposeWebView _removeAttachment:](self, "_removeAttachment:", v5);
  -[MFComposeWebView _addAttachment:](self, "_addAttachment:", v5);

}

- (void)_webView:(id)a3 didInsertAttachment:(id)a4 withSource:(id)a5
{
  id *v5;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  int v31;
  void *v32;
  id WeakRetained;
  _QWORD v34[5];
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  uint8_t buf[4];
  MFComposeWebView *v42;
  __int16 v43;
  _BYTE v44[18];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  EMLogCompose();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v42 = self;
    v43 = 2114;
    *(_QWORD *)v44 = v7;
    _os_log_impl(&dword_1AB96A000, v8, OS_LOG_TYPE_DEFAULT, "<%p> WebView didInsertAttachment: %{public}@", buf, 0x16u);
  }

  objc_msgSend(v7, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  objc_msgSend(WeakRetained, "compositionContext");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_attachmentCIDsByIdentifier, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    EMLogCompose();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v42 = self;
      v43 = 2114;
      *(_QWORD *)v44 = v7;
      *(_WORD *)&v44[8] = 2114;
      *(_QWORD *)&v44[10] = v10;
      _os_log_impl(&dword_1AB96A000, v11, OS_LOG_TYPE_DEFAULT, "<%p> Webview did insert attachment: %{public}@, for content ID: %{public}@", buf, 0x20u);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_attachmentCIDsByIdentifier, "setObject:forKeyedSubscript:", 0, v9);
    objc_msgSend(v32, "attachments");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __60__MFComposeWebView__webView_didInsertAttachment_withSource___block_invoke;
    v39[3] = &unk_1E5A66D80;
    v13 = v10;
    v40 = v13;
    objc_msgSend(v12, "ef_firstObjectPassingTest:", v39);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "info");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    EMLogCompose();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v14, "ef_publicDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v42 = self;
      v43 = 2114;
      *(_QWORD *)v44 = v17;
      *(_WORD *)&v44[8] = 2114;
      *(_QWORD *)&v44[10] = v15;
      _os_log_impl(&dword_1AB96A000, v16, OS_LOG_TYPE_DEFAULT, "<%p> Found attachment %{public}@, for wkAttachment info: %{public}@", buf, 0x20u);

    }
    if (v14)
    {
      EMLogCompose();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v42 = self;
        v43 = 2114;
        *(_QWORD *)v44 = v15;
        _os_log_impl(&dword_1AB96A000, v18, OS_LOG_TYPE_DEFAULT, "<%p> Loaded attachment with info: %{public}@", buf, 0x16u);
      }

      objc_msgSend(v14, "fileWrapperUsingFetchedLocalData");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "fileUTType");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFileWrapper:contentType:completion:", v19, v20, 0);

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_attachmentsByUniqueIdentifier, "setObject:forKeyedSubscript:", v14, v9);
      objc_msgSend(WeakRetained, "didInsertAttachment:", v14);
    }
    else if (!self->_attachmentDataMissingAlertDisplayed)
    {
      objc_msgSend(v15, "data");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25 || (objc_msgSend(v15, "fileWrapper"), (v25 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {

      }
      else
      {
        objc_msgSend(v15, "filePath");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v29, "isEqualToString:", &stru_1E5A6A588);

        if (v31)
        {
          EMLogCompose();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218498;
            v42 = self;
            v43 = 2114;
            *(_QWORD *)v44 = v7;
            *(_WORD *)&v44[8] = 2114;
            *(_QWORD *)&v44[10] = v13;
            _os_log_error_impl(&dword_1AB96A000, v30, OS_LOG_TYPE_ERROR, "<%p> Failed to insert attachment %{public}@, content ID: %{public}@", buf, 0x20u);
          }

          self->_attachmentDataMissingAlertDisplayed = 1;
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(WeakRetained, "showMissingAttachmentDataAlert");
        }
      }
    }

    v5 = &v40;
LABEL_29:

    goto LABEL_30;
  }
  EMLogCompose();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v42 = self;
    v43 = 2114;
    *(_QWORD *)v44 = v9;
    _os_log_impl(&dword_1AB96A000, v21, OS_LOG_TYPE_DEFAULT, "<%p> Did not find the contentID for identifier: %{public}@, looking into _attachmentsByUniqueIdentifier.", buf, 0x16u);
  }

  -[NSMutableDictionary objectForKeyedSubscript:](self->_attachmentsByUniqueIdentifier, "objectForKeyedSubscript:", v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "contentID");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v32, "attachments");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __60__MFComposeWebView__webView_didInsertAttachment_withSource___block_invoke_438;
    v37[3] = &unk_1E5A66D80;
    v38 = v13;
    v24 = objc_msgSend(v23, "ef_any:", v37);

    v5 = &v38;
  }
  else
  {
    v24 = 0;
  }
  EMLogCompose();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v42 = self;
    v43 = 1024;
    *(_DWORD *)v44 = v24;
    *(_WORD *)&v44[4] = 2114;
    *(_QWORD *)&v44[6] = v13;
    _os_log_impl(&dword_1AB96A000, v26, OS_LOG_TYPE_DEFAULT, "<%p> Found existing: %{BOOL}d contentID: %{public}@ in context", buf, 0x1Cu);
  }

  if ((v24 & 1) == 0)
  {
    -[MFComposeWebView _addAttachment:](self, "_addAttachment:", v7);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_attachmentsByUniqueIdentifier, "objectForKeyedSubscript:", v9);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "isSinglePagePDFFile"))
    {
      -[MFComposeWebView _bodyFieldProxy](self, "_bodyFieldProxy");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __60__MFComposeWebView__webView_didInsertAttachment_withSource___block_invoke_439;
      v34[3] = &unk_1E5A66DA8;
      v34[4] = self;
      v35 = v9;
      v36 = v27;
      objc_msgSend(v28, "displayAttachmentWithIdentifierAsSinglePagePDF:completionHandler:", v35, v34);

    }
  }
  if (v13)
    goto LABEL_29;
LABEL_30:

}

uint64_t __60__MFComposeWebView__webView_didInsertAttachment_withSource___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "contentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __60__MFComposeWebView__webView_didInsertAttachment_withSource___block_invoke_438(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "contentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __60__MFComposeWebView__webView_didInsertAttachment_withSource___block_invoke_439(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1872), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "contentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1880), "setObject:forKeyedSubscript:", v3, v4);

}

- (void)_webView:(id)a3 didRemoveAttachment:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  MFComposeWebView *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  EMLogCompose();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134218242;
    v8 = self;
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1AB96A000, v6, OS_LOG_TYPE_DEFAULT, "<%p> Webview did remove attachment: %{public}@", (uint8_t *)&v7, 0x16u);
  }

  -[MFComposeWebView _removeAttachment:](self, "_removeAttachment:", v5);
}

- (void)_webView:(id)a3 didChangeFontAttributes:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[MFComposeWebView mailComposeViewDelegate](self, "mailComposeViewDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "composeWebViewDidChangeFontAttributes:", v6);

}

- (int64_t)_webView:(id)a3 dataOwnerForDropSession:(id)a4
{
  if (-[MFComposeWebView _sourceIsManaged](self, "_sourceIsManaged", a3, a4))
    return 2;
  else
    return 1;
}

- (int64_t)_webView:(id)a3 dataOwnerForDragSession:(id)a4
{
  if (-[MFComposeWebView _sourceIsManaged](self, "_sourceIsManaged", a3, a4))
    return 2;
  else
    return 1;
}

- (void)_webView:(id)a3 takeFocus:(int64_t)a4
{
  id WeakRetained;
  uint64_t v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  if (a4 == 1)
    v7 = 16;
  else
    v7 = 32;
  v8 = WeakRetained;
  objc_msgSend(WeakRetained, "takeFocusFromComposeWebView:inDirection:", self, v7);

}

- (void)willBeginWritingToolsSession:(id)a3 requestContexts:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  objc_super v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MFComposeWebView;
  if (-[MFComposeWebView respondsToSelector:](&v10, sel_respondsToSelector_, sel_willBeginWritingToolsSession_requestContexts_))
  {
    v9.receiver = self;
    v9.super_class = (Class)MFComposeWebView;
    -[MFComposeWebView willBeginWritingToolsSession:requestContexts:](&v9, sel_willBeginWritingToolsSession_requestContexts_, v6, v7);
  }
  EMLogCompose();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[MFComposeWebView willBeginWritingToolsSession:requestContexts:].cold.1();

  -[MFComposeWebView _updateAppearanceForWritingToolsSession:](self, "_updateAppearanceForWritingToolsSession:", 1);
}

- (void)didEndWritingToolsSession:(id)a3 accepted:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  objc_super v8;
  objc_super v9;

  v4 = a4;
  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFComposeWebView;
  if (-[MFComposeWebView respondsToSelector:](&v9, sel_respondsToSelector_, sel_didEndWritingToolsSession_accepted_))
  {
    v8.receiver = self;
    v8.super_class = (Class)MFComposeWebView;
    -[MFComposeWebView didEndWritingToolsSession:accepted:](&v8, sel_didEndWritingToolsSession_accepted_, v6, v4);
  }
  EMLogCompose();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[MFComposeWebView didEndWritingToolsSession:accepted:].cold.1();

  -[MFComposeWebView _updateAppearanceForWritingToolsSession:](self, "_updateAppearanceForWritingToolsSession:", 0);
}

- (void)_updateAppearanceForWritingToolsSession:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_composeWebViewDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "composeWebView:hasActiveWritingToolsSession:", self, v3);

}

- (void)_addAttachment:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint8_t buf[4];
  MFComposeWebView *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  EMLogCompose();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v38 = self;
    v39 = 2114;
    v40 = v4;
    _os_log_impl(&dword_1AB96A000, v5, OS_LOG_TYPE_DEFAULT, "<%p> Adding attachment: %{public}@", buf, 0x16u);
  }

  objc_msgSend(v4, "uniqueIdentifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "info");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(v7, "filePath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v7, "contentType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithMIMEType:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        v15 = v13;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v12);
        v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      v16 = v15;

    }
    else
    {
      v16 = 0;
    }
    if (objc_msgSend(v16, "conformsToType:", *MEMORY[0x1E0CEC4F0]))
    {
      objc_msgSend(v10, "stringByAppendingString:", CFSTR(".zip"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "data");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v19 = 0;
      }
      else
      {
        v25 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(v7, "filePath");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "fileURLWithPath:isDirectory:", v26, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D4D558], "archive");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 0;
        objc_msgSend(v28, "compressFolder:error:", v27, &v36);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v36;

      }
      if (v19 || !v18)
      {
        EMLogCompose();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v19, "ef_publicDescription");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[MFComposeWebView _addAttachment:].cold.1(v30, (uint64_t)buf, v29);
        }

      }
      v23 = CFSTR("application/zip");
    }
    else
    {
      objc_msgSend(v16, "preferredMIMEType");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      v22 = CFSTR("application/octet-stream");
      if (v20)
        v22 = (__CFString *)v20;
      v23 = v22;

      objc_msgSend(v7, "data");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v24;
      if (v24)
      {
        v19 = v24;
        v18 = v19;
      }
      else
      {
        v31 = (void *)MEMORY[0x1E0C99D50];
        objc_msgSend(v7, "filePath");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "dataWithContentsOfFile:options:error:", v32, 3, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v17 = v10;
    }

    if (v18)
    {
      -[MFComposeWebView _addInlineAttachmentWithData:fileName:type:contentID:](self, "_addInlineAttachmentWithData:fileName:type:contentID:", v18, v17, v23, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_attachmentsByUniqueIdentifier, "setObject:forKeyedSubscript:", v33, v35);
      -[MFComposeWebView mailComposeViewDelegate](self, "mailComposeViewDelegate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "didInsertAttachment:", v33);

    }
  }

}

- (void)_removeAttachment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  MFComposeWebView *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_attachmentsByUniqueIdentifier, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  objc_msgSend(WeakRetained, "compositionContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  EMLogCompose();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v19 = self;
    v20 = 2114;
    v21 = v4;
    v22 = 2114;
    v23 = v7;
    _os_log_impl(&dword_1AB96A000, v10, OS_LOG_TYPE_DEFAULT, "<%p> Removing attachment: %{public}@, content ID: %{public}@", buf, 0x20u);
  }

  if (!self->_isFinishing)
  {
    if (v7)
    {
      objc_msgSend(v9, "contentVariationAttachmentCID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v7, "isEqualToString:", v11);

      if ((v12 & 1) == 0)
      {
        objc_msgSend(v9, "attachments");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __38__MFComposeWebView__removeAttachment___block_invoke;
        v16[3] = &unk_1E5A66D80;
        v17 = v7;
        objc_msgSend(v13, "ef_firstObjectPassingTest:", v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v9, "removeAttachment:", v14);
          -[MFComposeWebView mailComposeViewDelegate](self, "mailComposeViewDelegate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "didRemoveAttachment:", v14);

        }
        -[NSMutableDictionary removeObjectForKey:](self->_attachmentsByUniqueIdentifier, "removeObjectForKey:", v5);

      }
    }
  }

}

uint64_t __38__MFComposeWebView__removeAttachment___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "contentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)_sourceIsManaged
{
  id WeakRetained;
  void *v3;
  BOOL v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  objc_msgSend(WeakRetained, "compositionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sourceAccountManagement") == 2;

  return v4;
}

- (void)donateHasUsedAttachment
{
  +[MessageUITipsManager donateHasUsedAttachment](_TtC9MessageUI20MessageUITipsManager, "donateHasUsedAttachment");
}

- (MFComposeWebViewDelegate)composeWebViewDelegate
{
  return (MFComposeWebViewDelegate *)objc_loadWeakRetained((id *)&self->_composeWebViewDelegate);
}

- (void)setComposeWebViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_composeWebViewDelegate, a3);
}

- (BOOL)isQuickReply
{
  return self->_isQuickReply;
}

- (void)setIsQuickReply:(BOOL)a3
{
  self->_isQuickReply = a3;
}

- (MFMailComposeCoordinator)composeCoordinator
{
  return (MFMailComposeCoordinator *)objc_loadWeakRetained((id *)&self->_composeCoordinator);
}

- (void)setComposeCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_composeCoordinator, a3);
}

- (UIView)inputViewForPreservingFocus
{
  return self->_inputViewForPreservingFocus;
}

- (void)setInputViewForPreservingFocus:(id)a3
{
  objc_storeStrong((id *)&self->_inputViewForPreservingFocus, a3);
}

- (UIBarButtonItem)textFromCameraButtonItem
{
  return self->_textFromCameraButtonItem;
}

- (void)setTextFromCameraButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_textFromCameraButtonItem, a3);
}

- (UIBarButtonItemGroup)photoAndCameraGroup
{
  return self->_photoAndCameraGroup;
}

- (void)setPhotoAndCameraGroup:(id)a3
{
  objc_storeStrong((id *)&self->_photoAndCameraGroup, a3);
}

- (NSMutableDictionary)richLinkActivityIndicators
{
  return self->_richLinkActivityIndicators;
}

- (void)setRichLinkActivityIndicators:(id)a3
{
  objc_storeStrong((id *)&self->_richLinkActivityIndicators, a3);
}

- (MSInputContextHistory)previousInputContextHistory
{
  return self->_previousInputContextHistory;
}

- (void)setPreviousInputContextHistory:(id)a3
{
  objc_storeStrong((id *)&self->_previousInputContextHistory, a3);
}

- (NSArray)_leadingInputAssistantItemGroups
{
  return self->__leadingInputAssistantItemGroups;
}

- (void)set_leadingInputAssistantItemGroups:(id)a3
{
  objc_storeStrong((id *)&self->__leadingInputAssistantItemGroups, a3);
}

- (NSArray)_trailingInputAssistantItemGroups
{
  return self->__trailingInputAssistantItemGroups;
}

- (void)set_trailingInputAssistantItemGroups:(id)a3
{
  objc_storeStrong((id *)&self->__trailingInputAssistantItemGroups, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__trailingInputAssistantItemGroups, 0);
  objc_storeStrong((id *)&self->__leadingInputAssistantItemGroups, 0);
  objc_storeStrong((id *)&self->_previousInputContextHistory, 0);
  objc_storeStrong((id *)&self->_richLinkActivityIndicators, 0);
  objc_storeStrong((id *)&self->_photoAndCameraGroup, 0);
  objc_storeStrong((id *)&self->_textFromCameraButtonItem, 0);
  objc_storeStrong((id *)&self->_inputViewForPreservingFocus, 0);
  objc_destroyWeak((id *)&self->_composeCoordinator);
  objc_destroyWeak((id *)&self->_composeWebViewDelegate);
  objc_storeStrong((id *)&self->_makeLinkAccessoryButton, 0);
  objc_storeStrong((id *)&self->_originalAttachmentWrappers, 0);
  objc_storeStrong((id *)&self->_attachmentCIDsByIdentifier, 0);
  objc_storeStrong((id *)&self->_attachmentsByUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_selectedAttachmentIdentifiers, 0);
  objc_storeStrong((id *)&self->_richLinkGeneratorInterface, 0);
  objc_storeStrong((id *)&self->_bodyFieldObserverInterface, 0);
  objc_storeStrong((id *)&self->_bodyFieldProxy, 0);
  objc_storeStrong((id *)&self->_signatureControllerProxy, 0);
  objc_storeStrong((id *)&self->_compositionContextID, 0);
  objc_destroyWeak((id *)&self->_mailComposeViewDelegate);
}

void __46__MFComposeWebView__basicWebViewConfiguration__block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1AB96A000, v0, OS_LOG_TYPE_ERROR, "sURLCacheBlock hasn't been set yet", v1, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)insertDocumentWithData:fileName:mimeType:contentID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1AB96A000, v0, v1, "Failed to attach document with content ID %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)replaceAttachment:withDocumentAtURL:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1AB96A000, v0, v1, "#Attachments Failed to create replacement fileName [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __35__MFComposeWebView__didTapAddLink___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1AB96A000, v0, v1, "Skip adding a link because it is invalid %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __36__MFComposeWebView__didTapEditLink___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1AB96A000, v0, v1, "Skip editing a link because it is invalid %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)replaceFilenamePlaceholderWithAttachment:(uint64_t)a1 fileName:(void *)a2 mimeType:(uint8_t *)buf contentID:(os_log_t)log .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1AB96A000, log, OS_LOG_TYPE_ERROR, "Failed to attach item with content ID: %{public}@, file name: %{public}@", buf, 0x16u);

  OUTLINED_FUNCTION_2_0();
}

- (void)composeBodyFieldAddAttachmentWithData:(NSObject *)a3 filename:mimeType:uniqueID:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_0(&dword_1AB96A000, a3, (uint64_t)a3, "Failed to attach rich link preview [%{public}@]", (uint8_t *)a2);

  OUTLINED_FUNCTION_2_0();
}

- (void)attachmentTapped:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1AB96A000, v0, v1, "Unable to find attachment for CID: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)willBeginWritingToolsSession:requestContexts:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AB96A000, v0, v1, "[Writing Tools] Will begin writing tools session", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)didEndWritingToolsSession:accepted:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AB96A000, v0, v1, "[Writing Tools] Did end writing tools session", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_addAttachment:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_0(&dword_1AB96A000, a3, (uint64_t)a3, "Failed to load folder: %{public}@", (uint8_t *)a2);

  OUTLINED_FUNCTION_2_0();
}

@end
