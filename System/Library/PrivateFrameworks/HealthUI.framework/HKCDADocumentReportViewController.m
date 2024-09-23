@implementation HKCDADocumentReportViewController

- (HKCDADocumentReportViewController)initWithDocumentData:(id)a3
{
  id v5;
  HKCDADocumentReportViewController *v6;
  HKCDADocumentReportViewController *v7;
  UIView *disclosureView;
  WKWebView *webView;
  HKIncrementalSearchBar *incrementalSearchBar;
  NSMutableArray *v11;
  NSMutableArray *javascriptOperationQueue;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKCDADocumentReportViewController;
  v6 = -[HKCDADocumentReportViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_documentData, a3);
    disclosureView = v7->_disclosureView;
    v7->_disclosureView = 0;

    webView = v7->_webView;
    v7->_webView = 0;

    incrementalSearchBar = v7->_incrementalSearchBar;
    v7->_incrementalSearchBar = 0;

    v7->_javascriptSearchInstalled = 0;
    v7->_javascriptIsRunning = 0;
    v7->_searchInProgress = 0;
    v7->_hitCount = 0;
    v7->_currentHighlightedHit = 0;
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    javascriptOperationQueue = v7->_javascriptOperationQueue;
    v7->_javascriptOperationQueue = v11;

  }
  return v7;
}

+ (id)xmlToHTMLTranslator
{
  if (xmlToHTMLTranslator_oncePredicate != -1)
    dispatch_once(&xmlToHTMLTranslator_oncePredicate, &__block_literal_global_81);
  return (id)xmlToHTMLTranslator_translator;
}

void __56__HKCDADocumentReportViewController_xmlToHTMLTranslator__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  HKHealthUIFrameworkBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathForResource:ofType:", CFSTR("CDAINTL"), CFSTR("xsl"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "contentsAtPath:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB7070]), "initWithXSL:localizationTableName:localizationOverride:", v2, CFSTR("CDA"), 0);
  v4 = (void *)xmlToHTMLTranslator_translator;
  xmlToHTMLTranslator_translator = v3;

}

- (void)hideDisclosure:(id)a3
{
  void *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__HKCDADocumentReportViewController_hideDisclosure___block_invoke;
  v5[3] = &unk_1E9C3F0D0;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v5, 0.3);
  -[HKCDADocumentReportViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

}

uint64_t __52__HKCDADocumentReportViewController_hideDisclosure___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setHidden:", 1);
}

- (id)buildDisclosureView
{
  _DisclosureLabel *v3;
  _DisclosureLabel *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = [_DisclosureLabel alloc];
  v4 = -[_DisclosureLabel initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 122);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  LODWORD(v7) = 1148846080;
  objc_msgSend(v5, "setContentCompressionResistancePriority:forAxis:", 0, v7);
  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel_hideDisclosure_, 64);
  objc_msgSend(v5, "setContentEdgeInsets:", 0.0, 5.0, 0.0, 20.0);
  LODWORD(v8) = 1148846080;
  objc_msgSend(v5, "setContentHuggingPriority:forAxis:", 0, v8);
  v9 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v13[0] = v4;
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithArrangedSubviews:", v10);

  objc_msgSend(v11, "setAxis:", 0);
  return v11;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  UIView *v5;
  UIView *disclosureView;
  double v7;
  void *v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  objc_class *v13;
  id v14;
  WKWebView *v15;
  WKWebView *webView;
  HKIncrementalSearchBar *v17;
  HKIncrementalSearchBar *incrementalSearchBar;
  double v19;
  objc_super v20;
  uint64_t v21;
  uint64_t v22;
  Class (*v23)(uint64_t);
  void *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v20.receiver = self;
  v20.super_class = (Class)HKCDADocumentReportViewController;
  -[HKCDADocumentReportViewController viewDidLoad](&v20, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v4 = (void *)objc_msgSend(v3, "initWithArrangedSubviews:", MEMORY[0x1E0C9AA60]);
  objc_msgSend(v4, "setAxis:", 1);
  -[HKCDADocumentReportViewController buildDisclosureView](self, "buildDisclosureView");
  v5 = (UIView *)objc_claimAutoreleasedReturnValue();
  disclosureView = self->_disclosureView;
  self->_disclosureView = v5;

  objc_msgSend(v4, "addArrangedSubview:", self->_disclosureView);
  LODWORD(v7) = 1148846080;
  -[UIView setContentCompressionResistancePriority:forAxis:](self->_disclosureView, "setContentCompressionResistancePriority:forAxis:", 1, v7);
  v26 = 0;
  v27 = &v26;
  v28 = 0x2050000000;
  v8 = (void *)getWKWebViewConfigurationClass_softClass;
  v29 = getWKWebViewConfigurationClass_softClass;
  if (!getWKWebViewConfigurationClass_softClass)
  {
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __getWKWebViewConfigurationClass_block_invoke;
    v24 = &unk_1E9C3FDF8;
    v25 = &v26;
    __getWKWebViewConfigurationClass_block_invoke((uint64_t)&v21);
    v8 = (void *)v27[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v26, 8);
  v10 = objc_alloc_init(v9);
  objc_msgSend(v10, "preferences");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setJavaScriptEnabled:", 1);

  v26 = 0;
  v27 = &v26;
  v28 = 0x2050000000;
  v12 = (void *)getWKWebViewClass_softClass;
  v29 = getWKWebViewClass_softClass;
  if (!getWKWebViewClass_softClass)
  {
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __getWKWebViewClass_block_invoke;
    v24 = &unk_1E9C3FDF8;
    v25 = &v26;
    __getWKWebViewClass_block_invoke((uint64_t)&v21);
    v12 = (void *)v27[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v26, 8);
  v14 = [v13 alloc];
  v15 = (WKWebView *)objc_msgSend(v14, "initWithFrame:configuration:", v10, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  webView = self->_webView;
  self->_webView = v15;

  objc_msgSend(v4, "addArrangedSubview:", self->_webView);
  v17 = objc_alloc_init(HKIncrementalSearchBar);
  incrementalSearchBar = self->_incrementalSearchBar;
  self->_incrementalSearchBar = v17;

  -[HKIncrementalSearchBar setSearchBarDelegate:](self->_incrementalSearchBar, "setSearchBarDelegate:", self);
  LODWORD(v19) = 1148846080;
  -[HKIncrementalSearchBar setContentHuggingPriority:forAxis:](self->_incrementalSearchBar, "setContentHuggingPriority:forAxis:", 1, v19);
  objc_msgSend(v4, "addArrangedSubview:", self->_incrementalSearchBar);
  -[HKCDADocumentReportViewController setView:](self, "setView:", v4);
  -[HKCDADocumentReportViewController _translateXMLInBackground](self, "_translateXMLInBackground");

}

- (void)_translateXMLInBackground
{
  id v2;
  id location;

  objc_initWeak(&location, self);
  objc_copyWeak(&v2, &location);
  HKDispatchAsyncOnGlobalConcurrentQueue();
  objc_destroyWeak(&v2);
  objc_destroyWeak(&location);
}

void __62__HKCDADocumentReportViewController__translateXMLInBackground__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "documentData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKCDADocumentReportViewController xmlToHTMLTranslator](HKCDADocumentReportViewController, "xmlToHTMLTranslator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "convertToHTMLFromXML:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__HKCDADocumentReportViewController__translateXMLInBackground__block_invoke_2;
  v7[3] = &unk_1E9C412F0;
  objc_copyWeak(&v9, v1);
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

  objc_destroyWeak(&v9);
}

void __62__HKCDADocumentReportViewController__translateXMLInBackground__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", &stru_1E9C4C428);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (id)objc_msgSend(v3, "loadHTMLString:baseURL:", *(_QWORD *)(a1 + 32), v5);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)startIncrementalSearch
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  WKWebView *webView;
  id v9;
  _QWORD v10[5];

  if (self->_javascriptSearchInstalled)
  {
    -[HKIncrementalSearchBar activateSearch:](self->_incrementalSearchBar, "activateSearch:", 1);
    -[HKCDADocumentReportViewController view](self, "view");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNeedsLayout");

  }
  else
  {
    HKHealthUIFrameworkBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pathForResource:ofType:", CFSTR("HKHTMLIncrementalSearch"), CFSTR("js"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentsAtPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v6, 4);
    webView = self->_webView;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __59__HKCDADocumentReportViewController_startIncrementalSearch__block_invoke;
    v10[3] = &unk_1E9C45F80;
    v10[4] = self;
    -[WKWebView evaluateJavaScript:completionHandler:](webView, "evaluateJavaScript:completionHandler:", v7, v10);

  }
}

void __59__HKCDADocumentReportViewController_startIncrementalSearch__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;

  if (!a3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "activateSearch:", 1);
    objc_msgSend(*(id *)(a1 + 32), "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsLayout");

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 968) = 1;
  }
}

- (void)_runJavascript:(id)a3 clearQueuedCommands:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  _JavascriptOperation *v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = -[_JavascriptOperation initWithJavascript:completion:]([_JavascriptOperation alloc], "initWithJavascript:completion:", v9, v8);

  -[HKCDADocumentReportViewController _runJavascriptOperation:clearQueuedCommands:](self, "_runJavascriptOperation:clearQueuedCommands:", v10, v5);
}

- (void)_runJavascriptOperation:(id)a3 clearQueuedCommands:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  WKWebView *webView;
  _QWORD v8[5];

  v4 = a4;
  v6 = a3;
  if (self->_javascriptIsRunning || -[NSMutableArray count](self->_javascriptOperationQueue, "count"))
  {
    if (v4)
      -[NSMutableArray removeAllObjects](self->_javascriptOperationQueue, "removeAllObjects");
    -[NSMutableArray addObject:](self->_javascriptOperationQueue, "addObject:", v6);
  }
  else
  {
    self->_javascriptIsRunning = 1;
    webView = self->_webView;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __81__HKCDADocumentReportViewController__runJavascriptOperation_clearQueuedCommands___block_invoke;
    v8[3] = &unk_1E9C3F0D0;
    v8[4] = self;
    objc_msgSend(v6, "submitJavascript:finishBlock:", webView, v8);
  }

}

uint64_t __81__HKCDADocumentReportViewController__runJavascriptOperation_clearQueuedCommands___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishJavascriptOperation");
}

- (void)_finishJavascriptOperation
{
  void *v3;
  WKWebView *webView;
  _QWORD v5[5];

  self->_javascriptIsRunning = 0;
  if (-[NSMutableArray count](self->_javascriptOperationQueue, "count"))
  {
    -[NSMutableArray firstObject](self->_javascriptOperationQueue, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_javascriptOperationQueue, "removeObjectAtIndex:", 0);
    self->_javascriptIsRunning = 1;
    webView = self->_webView;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __63__HKCDADocumentReportViewController__finishJavascriptOperation__block_invoke;
    v5[3] = &unk_1E9C3F0D0;
    v5[4] = self;
    objc_msgSend(v3, "submitJavascript:finishBlock:", webView, v5);

  }
}

uint64_t __63__HKCDADocumentReportViewController__finishJavascriptOperation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishJavascriptOperation");
}

- (void)_updateSearchHits:(int64_t)a3
{
  int64_t hitCount;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *, uint64_t);
  void *v8;
  id v9;
  id location;

  hitCount = self->_hitCount;
  if (a3 < 0)
  {
    if (!hitCount)
      self->_hitCount = -1;
  }
  else
  {
    self->_hitCount = hitCount + a3;
    objc_initWeak(&location, self);
    v5 = MEMORY[0x1E0C809B0];
    v6 = 3221225472;
    v7 = __55__HKCDADocumentReportViewController__updateSearchHits___block_invoke;
    v8 = &unk_1E9C45FA8;
    objc_copyWeak(&v9, &location);
    -[HKCDADocumentReportViewController _runJavascript:clearQueuedCommands:completion:](self, "_runJavascript:clearQueuedCommands:completion:", CFSTR("searchController.continueSearch();"),
      0,
      &v5);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  -[HKCDADocumentReportViewController _updateSearchBarState](self, "_updateSearchBarState", v5, v6, v7, v8);
}

void __55__HKCDADocumentReportViewController__updateSearchHits___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  id WeakRetained;

  if (!a3)
  {
    v4 = objc_msgSend(a2, "integerValue");
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_updateSearchHits:", v4);

  }
}

- (void)_updateSearchBarState
{
  HKIncrementalSearchBar *incrementalSearchBar;
  _BOOL8 v4;
  int64_t hitCount;
  BOOL v6;
  int64_t v7;
  _BOOL8 v8;

  incrementalSearchBar = self->_incrementalSearchBar;
  v4 = self->_hitCount >= 1 && self->_currentHighlightedHit > 0;
  -[HKIncrementalSearchBar setUpEnabled:](incrementalSearchBar, "setUpEnabled:", v4);
  hitCount = self->_hitCount;
  v6 = hitCount < 1;
  v7 = hitCount - 1;
  v8 = !v6 && self->_currentHighlightedHit < v7;
  -[HKIncrementalSearchBar setDownEnabled:](self->_incrementalSearchBar, "setDownEnabled:", v8);
  -[HKCDADocumentReportViewController _updateMatchDisplayString:numMatches:](self, "_updateMatchDisplayString:numMatches:", self->_currentHighlightedHit, self->_hitCount);
}

- (void)_updateMatchDisplayString:(int64_t)a3 numMatches:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;

  if (a4 >= 1)
  {
    if (a4 == 1)
    {
      HKLocalizedStringForNumberWithTemplate(&unk_1E9CED298, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("INCREMENTAL_SEARCH_ONE_MATCH %@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", v8, v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3 + 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      HKLocalizedStringForNumberWithTemplate(v11, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if ((unint64_t)a4 > 0x3E6)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 999);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        HKLocalizedStringForNumberWithTemplate(v17, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v15;
        v16 = CFSTR("INCREMENTAL_SEARCH_MAX_ITEM %@ %@");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        HKLocalizedStringForNumberWithTemplate(v13, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v15;
        v16 = CFSTR("INCREMENTAL_SEARCH_MATCH_ITEM %@ %@");
      }
      objc_msgSend(v15, "localizedStringForKey:value:table:", v16, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", v18, v12, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_12;
  }
  if (a4 < 0)
  {
    -[HKIncrementalSearchBar searchText](self->_incrementalSearchBar, "searchText", a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "length");

    if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("INCREMENTAL_SEARCH_NO_MATCHES"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

      -[HKIncrementalSearchBar setMatchDisplayText:](self->_incrementalSearchBar, "setMatchDisplayText:", v9);
      v10 = 1;
      goto LABEL_13;
    }
  }
  v10 = 0;
LABEL_13:
  -[HKIncrementalSearchBar setMatchDisplayVisible:](self->_incrementalSearchBar, "setMatchDisplayVisible:", v10);
}

- (void)_incrementCurrentHitBy:(int64_t)a3
{
  int64_t v3;

  v3 = self->_currentHighlightedHit + a3;
  if (v3 >= 0 && v3 < self->_hitCount)
  {
    self->_currentHighlightedHit = v3;
    -[HKCDADocumentReportViewController _updateSearchBarState](self, "_updateSearchBarState");
  }
}

- (void)searchBarUpAction:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__HKCDADocumentReportViewController_searchBarUpAction___block_invoke;
  v5[3] = &unk_1E9C45FA8;
  objc_copyWeak(&v6, &location);
  -[HKCDADocumentReportViewController _runJavascript:clearQueuedCommands:completion:](self, "_runJavascript:clearQueuedCommands:completion:", CFSTR("searchController.previousHit();"),
    0,
    v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __55__HKCDADocumentReportViewController_searchBarUpAction___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;

  if (!a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_incrementCurrentHitBy:", -1);

  }
}

- (void)searchBarDownAction:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__HKCDADocumentReportViewController_searchBarDownAction___block_invoke;
  v5[3] = &unk_1E9C45FA8;
  objc_copyWeak(&v6, &location);
  -[HKCDADocumentReportViewController _runJavascript:clearQueuedCommands:completion:](self, "_runJavascript:clearQueuedCommands:completion:", CFSTR("searchController.nextHit();"),
    0,
    v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __57__HKCDADocumentReportViewController_searchBarDownAction___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;

  if (!a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_incrementCurrentHitBy:", 1);

  }
}

- (void)searchBarDoneAction:(id)a3
{
  -[HKIncrementalSearchBar activateSearch:](self->_incrementalSearchBar, "activateSearch:", 0);
  -[HKCDADocumentReportViewController _runJavascript:clearQueuedCommands:completion:](self, "_runJavascript:clearQueuedCommands:completion:", CFSTR("searchController.setSearchPattern('', '');"),
    1,
    0);
}

- (void)searchBarChangeSearch:(id)a3 searchString:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id location;
  char v14;

  v6 = a3;
  v7 = a4;
  v14 = 0;
  +[HKIncrementalSearchBar regularExpressionFromString:quoteForJavascript:caseless:](HKIncrementalSearchBar, "regularExpressionFromString:quoteForJavascript:caseless:", v7, 1, &v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    v9 = CFSTR("searchController.setSearchPattern('%@', 'mi');");
  else
    v9 = CFSTR("searchController.setSearchPattern('%@', 'm');");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  self->_hitCount = 0;
  self->_currentHighlightedHit = 0;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__HKCDADocumentReportViewController_searchBarChangeSearch_searchString___block_invoke;
  v11[3] = &unk_1E9C45FA8;
  objc_copyWeak(&v12, &location);
  -[HKCDADocumentReportViewController _runJavascript:clearQueuedCommands:completion:](self, "_runJavascript:clearQueuedCommands:completion:", v10, 1, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __72__HKCDADocumentReportViewController_searchBarChangeSearch_searchString___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  id WeakRetained;

  if (!a3)
  {
    v4 = objc_msgSend(a2, "integerValue");
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_updateSearchHits:", v4);

  }
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  objc_super v9;
  _QWORD v10[4];
  id v11;
  BOOL v12;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "verticalSizeClass") == 1;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __95__HKCDADocumentReportViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
  v10[3] = &unk_1E9C45FD0;
  objc_copyWeak(&v11, &location);
  v12 = v8;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v10, 0);
  v9.receiver = self;
  v9.super_class = (Class)HKCDADocumentReportViewController;
  -[HKCDADocumentReportViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v9, sel_willTransitionToTraitCollection_withTransitionCoordinator_, v6, v7);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __95__HKCDADocumentReportViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setControlsHidden:animated:", *(unsigned __int8 *)(a1 + 40), 1);

}

- (NSData)documentData
{
  return (NSData *)objc_getProperty(self, a2, 976, 1);
}

- (UIView)disclosureView
{
  return self->_disclosureView;
}

- (WKWebView)webView
{
  return self->_webView;
}

- (HKIncrementalSearchBar)incrementalSearchBar
{
  return self->_incrementalSearchBar;
}

- (BOOL)javascriptSearchInstalled
{
  return self->_javascriptSearchInstalled;
}

- (void)setJavascriptSearchInstalled:(BOOL)a3
{
  self->_javascriptSearchInstalled = a3;
}

- (BOOL)javascriptIsRunning
{
  return self->_javascriptIsRunning;
}

- (void)setJavascriptIsRunning:(BOOL)a3
{
  self->_javascriptIsRunning = a3;
}

- (BOOL)searchInProgress
{
  return self->_searchInProgress;
}

- (void)setSearchInProgress:(BOOL)a3
{
  self->_searchInProgress = a3;
}

- (int64_t)hitCount
{
  return self->_hitCount;
}

- (void)setHitCount:(int64_t)a3
{
  self->_hitCount = a3;
}

- (int64_t)currentHighlightedHit
{
  return self->_currentHighlightedHit;
}

- (void)setCurrentHighlightedHit:(int64_t)a3
{
  self->_currentHighlightedHit = a3;
}

- (NSMutableArray)javascriptOperationQueue
{
  return self->_javascriptOperationQueue;
}

- (void)setJavascriptOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_javascriptOperationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_javascriptOperationQueue, 0);
  objc_storeStrong((id *)&self->_incrementalSearchBar, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_disclosureView, 0);
  objc_storeStrong((id *)&self->_documentData, 0);
}

@end
