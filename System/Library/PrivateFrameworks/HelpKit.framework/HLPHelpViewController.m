@implementation HLPHelpViewController

+ (id)mainUserGuideIdentifier
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if ((unint64_t)(v3 - 1) > 5)
    return CFSTR("iphone");
  else
    return off_24D32E9B8[v3 - 1];
}

+ (id)deviceFamily
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if ((unint64_t)(v3 - 1) > 5)
    return CFSTR("iphone");
  else
    return off_24D32E9E8[v3 - 1];
}

+ (id)platform
{
  void *v2;
  uint64_t v3;
  const __CFString *v4;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  v4 = CFSTR("ios");
  if (v3 == 6)
    v4 = CFSTR("visionos");
  if (v3 == 1)
    return CFSTR("ipados");
  else
    return (id)v4;
}

+ (id)platformVersion
{
  return (id)MGCopyAnswer();
}

+ (id)URLWithTopicID:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "URLWithBookID:topicID:", 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)URLWithBookID:(id)a3 topicID:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "URLWithBookID:topicID:version:", v6, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)URLWithBookID:(id)a3 topicID:(id)a4 version:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "URLWithBookID:topicID:anchorID:version:", v9, v8, 0, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)URLWithBookID:(id)a3 topicID:(id)a4 anchorID:(id)a5 version:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a6;
  v9 = a4;
  v10 = a3;
  objc_msgSend((id)objc_opt_class(), "URLWithBookID:topicID:anchorID:version:platformIndependent:", v10, v9, 0, v8, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)URLWithBookID:(id)a3 topicID:(id)a4 anchorID:(id)a5 version:(id)a6 platformIndependent:(BOOL)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("book"), v11);
    objc_msgSend(v15, "addObject:", v16);

  }
  if (objc_msgSend(v12, "length"))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("topic"), v12);
    objc_msgSend(v15, "addObject:", v17);

  }
  if (objc_msgSend(v13, "length"))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("anchor"), v13);
    objc_msgSend(v15, "addObject:", v18);

  }
  if (objc_msgSend(v14, "length"))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("version"), v14);
    objc_msgSend(v15, "addObject:", v19);

  }
  if (!a7)
  {
    v20 = objc_alloc(MEMORY[0x24BDD1838]);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithName:value:", CFSTR("platformIndependent"), v21);

    objc_msgSend(v15, "addObject:", v22);
  }
  v23 = objc_alloc_init(MEMORY[0x24BDD1808]);
  objc_msgSend(v23, "setScheme:", CFSTR("helpkit"));
  objc_msgSend(v23, "setHost:", CFSTR("open"));
  objc_msgSend(v23, "setQueryItems:", v15);
  objc_msgSend(v23, "URL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)helpViewController
{
  return +[HLPHelpViewController helpViewControllerWithIdentifier:version:](HLPHelpViewController, "helpViewControllerWithIdentifier:version:", 0, 0);
}

+ (id)helpViewControllerWithURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  __CFString *v21;
  uint64_t v22;
  __CFString *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v32;
  id v33;
  char v34;
  __CFString *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("helpkit")) & 1) == 0)
  {

    goto LABEL_26;
  }
  objc_msgSend(v4, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("open"));

  if (!v7)
  {
LABEL_26:
    v23 = 0;
    v24 = 0;
    v11 = 0;
    v12 = 0;
    v25 = 1;
    goto LABEL_36;
  }
  v32 = v4;
  v33 = v3;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(v4, "queryItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v9)
  {
    v10 = v9;
    v35 = 0;
    v36 = 0;
    v11 = 0;
    v12 = 0;
    v13 = *(_QWORD *)v38;
    v34 = 1;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v38 != v13)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v14);
        objc_msgSend(v15, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "value");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v16, "isEqualToString:", CFSTR("book")) & 1) != 0
          || objc_msgSend(v16, "isEqualToString:", CFSTR("bookId")))
        {
          v18 = v17;

          v12 = v18;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("topic")) & 1) != 0
               || objc_msgSend(v16, "isEqualToString:", CFSTR("topicId")))
        {
          v19 = v17;

          v11 = v19;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("anchor")) & 1) != 0
               || objc_msgSend(v16, "isEqualToString:", CFSTR("anchorId")))
        {
          v20 = v17;

          v36 = v20;
        }
        else if (objc_msgSend(v16, "isEqualToString:", CFSTR("version")))
        {
          v21 = v17;

          v35 = v21;
        }
        else if (objc_msgSend(v16, "isEqualToString:", CFSTR("platformIndependent")))
        {
          v34 = objc_msgSend(v17, "BOOLValue");
        }

        ++v14;
      }
      while (v10 != v14);
      v22 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      v10 = v22;
    }
    while (v22);
  }
  else
  {
    v35 = 0;
    v36 = 0;
    v11 = 0;
    v12 = 0;
    v34 = 1;
  }

  v23 = v35;
  v26 = -[__CFString length](v35, "length");
  if (objc_msgSend(v12, "length"))
  {
    v4 = v32;
    v3 = v33;
    v24 = v36;
    if (!v26)
    {
      v27 = CFSTR("HLPHelpViewControllerVersionLatest");
LABEL_34:

      v23 = (__CFString *)v27;
    }
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "mainUserGuideIdentifier");
    v28 = objc_claimAutoreleasedReturnValue();

    v4 = v32;
    v3 = v33;
    v24 = v36;
    if (!v26)
    {
      objc_msgSend((id)objc_opt_class(), "platformVersion");
      v27 = (const __CFString *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)v28;
      goto LABEL_34;
    }
    v12 = (void *)v28;
  }
  v25 = v34 & 1;
LABEL_36:
  +[HLPHelpViewController helpViewControllerWithIdentifier:version:](HLPHelpViewController, "helpViewControllerWithIdentifier:version:", v12, v23);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (v24)
    {
      objc_msgSend(v11, "stringByAppendingFormat:", CFSTR("#%@"), v24);
      v30 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v30;
    }
    objc_msgSend(v29, "setSelectedHelpTopicID:", v11);
  }
  objc_msgSend(v29, "setPlatformIndependent:", v25);

  return v29;
}

+ (id)helpViewControllerWithLocalHelpBookFileURL:(id)a3
{
  id v3;
  HLPHelpViewController *v4;

  v3 = a3;
  v4 = objc_alloc_init(HLPHelpViewController);
  -[HLPHelpViewController setLocalHelpBookFileURL:](v4, "setLocalHelpBookFileURL:", v3);

  return v4;
}

+ (id)helpViewControllerWithIdentifier:(id)a3 version:(id)a4
{
  return +[HLPHelpViewController helpViewControllerWithTitle:identifier:version:](HLPHelpViewController, "helpViewControllerWithTitle:identifier:version:", 0, a3, a4);
}

+ (id)helpViewControllerWithTitle:(id)a3 identifier:(id)a4 version:(id)a5
{
  return +[HLPHelpViewController helpViewControllerWithTitle:identifier:version:subpath:](HLPHelpViewController, "helpViewControllerWithTitle:identifier:version:subpath:", a3, a4, a5, 0);
}

+ (id)helpViewControllerWithTitle:(id)a3 identifier:(id)a4 version:(id)a5 subpath:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  HLPHelpViewController *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init(HLPHelpViewController);
  objc_msgSend((id)objc_opt_class(), "updateViewController:title:identifier:version:subpath:", v13, v12, v11, v10, v9);

  return v13;
}

+ (void)updateViewController:(id)a3 title:(id)a4 identifier:(id)a5 version:(id)a6 subpath:(id)a7
{
  id v11;
  __CFString *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __CFString *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;

  v25 = a3;
  v11 = a5;
  v12 = (__CFString *)a6;
  v13 = a7;
  objc_msgSend(v25, "setTitle:", a4);
  if (+[HLPCommonDefines isInternalBuild](HLPCommonDefines, "isInternalBuild"))
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CFSTR("HLPHelpBookOverrideIdentifier"));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
      v17 = (void *)v15;
    else
      v17 = v11;
    v18 = v17;

    objc_msgSend(v14, "stringForKey:", CFSTR("HLPHelpBookVersionOverride"));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v19)
      v21 = (void *)v19;
    else
      v21 = v12;
    v22 = v21;

    v12 = v22;
    v11 = v18;
  }
  if (!objc_msgSend(v11, "length"))
  {
    objc_msgSend((id)objc_opt_class(), "mainUserGuideIdentifier");
    v23 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v23;
  }
  if (!-[__CFString length](v12, "length"))
  {
    objc_msgSend((id)objc_opt_class(), "platformVersion");
    v24 = objc_claimAutoreleasedReturnValue();

    v12 = (__CFString *)v24;
  }
  objc_msgSend(v25, "setIdentifier:", v11);
  if (-[__CFString isEqualToString:](v12, "isEqualToString:", CFSTR("HLPHelpViewControllerVersionLatest")))
  {

    v12 = CFSTR("1000");
  }
  objc_msgSend(v25, "setVersion:", v12);
  objc_msgSend(v25, "setSubpath:", v13);

}

+ (void)clearCacheControllers
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  +[HLPJSONCacheController sharedInstance](HLPJSONCacheController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllDataCache");

  +[HLPStringCacheController sharedInstance](HLPStringCacheController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllDataCache");

  +[HLPFileCacheController sharedInstance](HLPFileCacheController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllDataCache");

  +[HLPImageCacheController sharedInstance](HLPImageCacheController, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllDataCache");

}

+ (id)platformIndependentIdentifiers
{
  return &unk_24D33A4D8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:", self);
  +[HLPImageCacheController sharedInstance](HLPImageCacheController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeInMemoryCache");

  objc_msgSend(MEMORY[0x24BDD1488], "removeHLPBundle");
  v4.receiver = self;
  v4.super_class = (Class)HLPHelpViewController;
  -[HLPHelpViewController dealloc](&v4, sel_dealloc);
}

- (HLPHelpViewController)init
{
  HLPHelpViewController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HLPURLSessionACAuthHandler *v9;
  void *v10;
  NSString *selectedHelpTopicID;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HLPHelpViewController;
  v2 = -[HLPHelpViewController init](&v13, sel_init);
  if (v2)
  {
    +[HLPURLSessionHandler sharedInstance](HLPURLSessionHandler, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setExcludeCachingDataTypes:", 0);

    +[HLPURLSessionHandler sharedInstance](HLPURLSessionHandler, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HLPURLSessionManager defaultManager](HLPURLSessionManager, "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", v4);

    +[HLPURLSessionHandler sharedInstance](HLPURLSessionHandler, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[HLPURLSessionManager defaultManager](HLPURLSessionManager, "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDefaultSessionDelegate:", v6);

    if (+[HLPCommonDefines isInternalBuild](HLPCommonDefines, "isInternalBuild"))
    {
      +[HLPURLSessionACAuthContext defaultContext](HLPURLSessionACAuthContext, "defaultContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setClientIdentifier:", CFSTR("58f932fbcc7cea7d190041a7"));
      v9 = -[HLPURLSessionACAuthHandler initWithAuthenticationContext:]([HLPURLSessionACAuthHandler alloc], "initWithAuthenticationContext:", v8);
      +[HLPURLSessionManager defaultManager](HLPURLSessionManager, "defaultManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAuthenticationHandler:", v9);

    }
    v2->_shouldDismissWelcomeTopic = 1;
    v2->_showTopicViewOnLoad = 0;
    selectedHelpTopicID = v2->_selectedHelpTopicID;
    v2->_selectedHelpTopicID = (NSString *)&stru_24D32F538;

    v2->_useModalPresentation = 1;
    if (+[HLPCommonDefines isVisionOS](HLPCommonDefines, "isVisionOS"))
      v2->_supportsDarkMode = 1;
  }
  return v2;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HLPHelpViewController;
  -[HLPHelpViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[HLPHelpViewController setup](self, "setup");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HLPHelpViewController;
  -[HLPHelpViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[HLPHelpViewController updateHelpBookController](self, "updateHelpBookController");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HLPHelpViewController;
  -[HLPHelpViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  self->_showingHelpTopic = 0;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HLPHelpViewController;
  -[HLPHelpViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  -[HLPHelpViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsets");
  -[NSLayoutConstraint setConstant:](self->_loadingViewTopConstraint, "setConstant:");

}

- (void)_setContext:(id)a3
{
  NSDictionary *v5;

  v5 = (NSDictionary *)a3;
  if (self->_context != v5)
  {
    objc_storeStrong((id *)&self->_context, a3);
    +[HLPCommonDefines setAuthenticationContext:](HLPCommonDefines, "setAuthenticationContext:", v5);
  }

}

- (HLPHelpLoadingView)loadingView
{
  HLPHelpLoadingView *loadingView;
  HLPHelpLoadingView *v4;
  HLPHelpLoadingView *v5;
  HLPHelpLoadingView *v6;
  HLPHelpTopicViewController *topicViewController;
  uint64_t supportsDarkMode;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSLayoutConstraint *v13;
  NSLayoutConstraint *loadingViewTopConstraint;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  loadingView = self->_loadingView;
  if (!loadingView)
  {
    v4 = [HLPHelpLoadingView alloc];
    v5 = -[HLPHelpLoadingView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v6 = self->_loadingView;
    self->_loadingView = v5;

    -[HLPHelpLoadingView setDelegate:](self->_loadingView, "setDelegate:", self);
    topicViewController = self->_topicViewController;
    if (topicViewController)
      supportsDarkMode = -[HLPHelpTopicViewController supportsDarkMode](topicViewController, "supportsDarkMode");
    else
      supportsDarkMode = self->_supportsDarkMode;
    -[HLPHelpLoadingView setSupportsDarkMode:](self->_loadingView, "setSupportsDarkMode:", supportsDarkMode);
    -[HLPHelpLoadingView setTranslatesAutoresizingMaskIntoConstraints:](self->_loadingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HLPHelpViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", self->_loadingView);

    -[HLPHelpLoadingView topAnchor](self->_loadingView, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v12);
    v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    loadingViewTopConstraint = self->_loadingViewTopConstraint;
    self->_loadingViewTopConstraint = v13;

    -[NSLayoutConstraint setActive:](self->_loadingViewTopConstraint, "setActive:", 1);
    -[HLPHelpLoadingView bottomAnchor](self->_loadingView, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setActive:", 1);

    -[HLPHelpLoadingView leadingAnchor](self->_loadingView, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpViewController view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setActive:", 1);

    -[HLPHelpLoadingView trailingAnchor](self->_loadingView, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpViewController view](self, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setActive:", 1);

    loadingView = self->_loadingView;
  }
  return loadingView;
}

- (HLPReachabilityManager)reachabilityManager
{
  HLPReachabilityManager *reachabilityManager;
  HLPReachabilityManager *v4;
  HLPReachabilityManager *v5;

  reachabilityManager = self->_reachabilityManager;
  if (!reachabilityManager)
  {
    v4 = objc_alloc_init(HLPReachabilityManager);
    v5 = self->_reachabilityManager;
    self->_reachabilityManager = v4;

    -[HLPReachabilityManager setDelegate:](self->_reachabilityManager, "setDelegate:", self);
    reachabilityManager = self->_reachabilityManager;
  }
  return reachabilityManager;
}

- (id)localHelpBookAnalyticIdentifier
{
  void *v2;
  void *v3;

  -[HLPHelpViewController localHelpBookFileURL](self, "localHelpBookFileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setHideDoneButton:(BOOL)a3
{
  self->_hideDoneButton = a3;
  -[HLPHelpViewController updateDoneButton](self, "updateDoneButton");
}

- (void)_setSupportsDarkMode:(BOOL)a3
{
  self->_supportsDarkMode = a3;
}

- (void)setShouldDisallowOffSiteRedirects:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  +[HLPURLSessionHandler sharedInstance](HLPURLSessionHandler, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldDisallowOffsiteRedirects:", v3);

}

- (BOOL)shouldDisallowOffSiteRedirects
{
  void *v2;
  char v3;

  +[HLPURLSessionHandler sharedInstance](HLPURLSessionHandler, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldDisallowOffsiteRedirects");

  return v3;
}

- (void)_setFullBookView:(BOOL)a3
{
  self->_fullBookView = a3;
}

- (void)cleanup
{
  void *v3;
  HLPHelpTableOfContentViewController *tableOfContentViewController;
  UIView *fullBookViewSeparator;
  void *v6;
  id v7;
  void *v8;
  HLPHelpTopicViewController *topicViewController;
  HLPHelpLocaleController *localeListController;
  HLPHelpBookController *helpBookController;
  void *v12;
  void *v13;
  void *v14;
  NSString *selectedHelpTopicID;
  NSString *selectedHelpTopicName;

  -[HLPHelpTableOfContentViewController willMoveToParentViewController:](self->_tableOfContentViewController, "willMoveToParentViewController:", 0);
  -[HLPHelpTableOfContentViewController view](self->_tableOfContentViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[HLPHelpTableOfContentViewController removeFromParentViewController](self->_tableOfContentViewController, "removeFromParentViewController");
  tableOfContentViewController = self->_tableOfContentViewController;
  self->_tableOfContentViewController = 0;

  -[UIView removeFromSuperview](self->_fullBookViewSeparator, "removeFromSuperview");
  fullBookViewSeparator = self->_fullBookViewSeparator;
  self->_fullBookViewSeparator = 0;

  -[HLPHelpViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "popToRootViewControllerAnimated:", 0);

  -[HLPHelpTopicViewController willMoveToParentViewController:](self->_topicViewController, "willMoveToParentViewController:", 0);
  -[HLPHelpTopicViewController view](self->_topicViewController, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeFromSuperview");

  -[HLPHelpTopicViewController removeFromParentViewController](self->_topicViewController, "removeFromParentViewController");
  -[HLPHelpTopicViewController cleanup](self->_topicViewController, "cleanup");
  topicViewController = self->_topicViewController;
  self->_topicViewController = 0;

  localeListController = self->_localeListController;
  self->_localeListController = 0;

  helpBookController = self->_helpBookController;
  self->_helpBookController = 0;

  -[HLPHelpViewController navigationItem](self, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLeftBarButtonItem:", 0);

  -[HLPHelpViewController loadingView](self, "loadingView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "showActivityIndicator:", 1);

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeObjectForKey:", kHLPHelpTopicViewControllerLastTopicHistoryItem);

  selectedHelpTopicID = self->_selectedHelpTopicID;
  self->_selectedHelpTopicID = (NSString *)&stru_24D32F538;

  selectedHelpTopicName = self->_selectedHelpTopicName;
  self->_selectedHelpTopicName = 0;

  self->_showingHelpTopic = 0;
}

- (void)setup
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  NSString *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "BOOLForKey:", CFSTR("HLPHelpBookResetToShowLandingPage")))
  {
    objc_msgSend(v3, "removeObjectForKey:", kHLPHelpTopicViewControllerLastTopicHistoryItem);
    objc_msgSend(v3, "synchronize");
  }
  if (objc_msgSend(v3, "BOOLForKey:", CFSTR("HLPHelpBookPlatformIndependent")))
  {
    -[HLPHelpViewController setPlatformIndependent:](self, "setPlatformIndependent:", 1);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "platformIndependentIdentifiers");
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v23 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          -[NSString lowercaseString](self->_identifier, "lowercaseString", (_QWORD)v22);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v9) = objc_msgSend(v10, "hasPrefix:", v9);

          if ((_DWORD)v9)
          {
            -[HLPHelpViewController setPlatformIndependent:](self, "setPlatformIndependent:", 1);
            -[HLPHelpViewController _setSupportsDarkMode:](self, "_setSupportsDarkMode:", 1);
            goto LABEL_15;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_15:

  }
  if (objc_msgSend(v3, "BOOLForKey:", CFSTR("HLPHelpBookSupportsDarkMode"), (_QWORD)v22))
    -[HLPHelpViewController _setSupportsDarkMode:](self, "_setSupportsDarkMode:", 1);
  -[HLPHelpViewController updateDarkMode](self, "updateDarkMode");
  v11 = self->_identifier;
  if (!v11)
  {
    -[HLPHelpViewController localHelpBookFileURL](self, "localHelpBookFileURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12
      || (-[HLPHelpViewController localHelpBookAnalyticIdentifier](self, "localHelpBookAnalyticIdentifier"),
          (v11 = (NSString *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      HLPLogForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        -[HLPHelpViewController localHelpBookFileURL](self, "localHelpBookFileURL");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v27 = v14;
        _os_log_impl(&dword_2153AA000, v13, OS_LOG_TYPE_DEFAULT, "Local help book URL %@", buf, 0xCu);

      }
      v11 = 0;
    }
  }
  +[HLPAnalyticsEventController sharedInstance](HLPAnalyticsEventController, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "configureWithHelpBookID:version:", v11, self->_version);

  -[HLPHelpViewController title](self, "title");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16 || -[HLPHelpViewController displayHelpTopicsOnly](self, "displayHelpTopicsOnly"))
  {

  }
  else if (!self->_fullBookView)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "HLPBundle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Help"), &stru_24D32F538, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpViewController setTitle:](self, "setTitle:", v21);

  }
  if (self->_fullBookView && !self->_displayHelpTopicsOnly)
  {
    -[HLPHelpViewController setupFullBookView](self, "setupFullBookView");
    goto LABEL_36;
  }
  if (-[NSString length](self->_selectedHelpTopicID, "length")
    || -[NSString length](self->_selectedHelpTopicName, "length"))
  {
    self->_showTopicViewOnLoad = 1;
    goto LABEL_32;
  }
  if (self->_showTopicViewOnLoad)
  {
LABEL_32:
    if (!self->_topicViewController)
    {
      -[HLPHelpViewController _showHelpTopicItem:anchor:allowErrorMessage:animate:](self, "_showHelpTopicItem:anchor:allowErrorMessage:animate:", 0, 0, 0, 0);
      self->_showingHelpTopic = 0;
    }
  }
  -[HLPHelpViewController setupTableContentViewController](self, "setupTableContentViewController");
  -[HLPHelpViewController updateDoneButton](self, "updateDoneButton");
  -[HLPHelpViewController updateTOCButton](self, "updateTOCButton");
  -[HLPHelpViewController updateChildViewConstraints](self, "updateChildViewConstraints");
  -[HLPHelpViewController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);
LABEL_36:
  -[HLPHelpViewController loadHelpBook](self, "loadHelpBook");
  -[HLPHelpViewController navigationItem](self, "navigationItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPreferredSearchBarPlacement:", 2);

  v18 = objc_alloc_init(MEMORY[0x24BDF6BE8]);
  objc_msgSend(v18, "configureWithDefaultBackground");
  -[HLPHelpViewController navigationItem](self, "navigationItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setScrollEdgeAppearance:", v18);

  -[HLPHelpViewController registerTraitChanges](self, "registerTraitChanges");
}

- (void)updateHelpBookController
{
  void *v3;

  if (-[HLPRemoteDataController hasLoaded](self->_helpBookController, "hasLoaded")
    && !-[HLPRemoteDataController loading](self->_helpBookController, "loading"))
  {
    -[HLPHelpTableOfContentViewController helpBookController](self->_tableOfContentViewController, "helpBookController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {

    }
    else if (self->_helpBookController)
    {
      -[HLPHelpTableOfContentViewController updateWithHelpBookController:](self->_tableOfContentViewController, "updateWithHelpBookController:");
    }
  }
}

- (void)setupFullBookView
{
  void *v3;
  void *v4;
  void *v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
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
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  UIView *v51;
  UIView *fullBookViewSeparator;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  double v66;
  void *v67;
  UIView *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;

  -[HLPHelpViewController setupTableContentViewController](self, "setupTableContentViewController");
  -[HLPHelpViewController setupTopicViewController](self, "setupTopicViewController");
  -[HLPHelpTopicViewController view](self->_topicViewController, "view");
  v82 = (id)objc_claimAutoreleasedReturnValue();
  -[HLPHelpViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[HLPCommonDefines isVisionOS](HLPCommonDefines, "isVisionOS"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BF8]), "initWithRootViewController:", self->_tableOfContentViewController);
    -[HLPHelpTableOfContentViewController view](self->_tableOfContentViewController, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 1);

    -[HLPHelpViewController addChildViewController:](self, "addChildViewController:", v4);
    -[HLPHelpViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v7);

    objc_msgSend(v4, "view");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v8, "leadingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setActive:", 1);

    objc_msgSend(v8, "widthAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToConstant:", 320.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActive:", 1);

    objc_msgSend(v8, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setActive:", 1);

    objc_msgSend(v8, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setActive:", 1);

    objc_msgSend(v4, "didMoveToParentViewController:", self);
    if ((objc_msgSend(v82, "isDescendantOfView:", v3) & 1) == 0)
    {
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BF8]), "initWithRootViewController:", self->_topicViewController);
      -[HLPHelpTopicViewController view](self->_topicViewController, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setHidden:", 1);

      -[HLPHelpViewController addChildViewController:](self, "addChildViewController:", v20);
      -[HLPHelpViewController view](self, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addSubview:", v23);

      objc_msgSend(v20, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v24, "leadingAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "trailingAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintEqualToAnchor:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setActive:", 1);

      objc_msgSend(v24, "trailingAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "trailingAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintEqualToAnchor:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setActive:", 1);

      objc_msgSend(v24, "topAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "topAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintEqualToAnchor:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setActive:", 1);

      objc_msgSend(v24, "bottomAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bottomAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "constraintEqualToAnchor:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setActive:", 1);

      objc_msgSend(v20, "didMoveToParentViewController:", self);
    }
  }
  else
  {
    -[HLPHelpTableOfContentViewController view](self->_tableOfContentViewController, "view");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v37, "isDescendantOfView:", v3) & 1) != 0)
    {
      v8 = 0;
    }
    else
    {
      -[HLPHelpViewController addChildViewController:](self, "addChildViewController:", self->_tableOfContentViewController);
      -[HLPHelpViewController view](self, "view");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addSubview:", v37);

      v8 = v37;
      objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v8, "leadingAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "leadingAnchor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "constraintEqualToAnchor:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setActive:", 1);

      objc_msgSend(v8, "widthAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "constraintEqualToConstant:", 320.0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setActive:", 1);

      objc_msgSend(v8, "topAnchor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "topAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "constraintEqualToAnchor:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setActive:", 1);

      objc_msgSend(v8, "bottomAnchor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bottomAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "constraintEqualToAnchor:", v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setActive:", 1);

      -[HLPHelpTableOfContentViewController didMoveToParentViewController:](self->_tableOfContentViewController, "didMoveToParentViewController:", self);
    }
    if (!-[UIView isDescendantOfView:](self->_fullBookViewSeparator, "isDescendantOfView:", v3))
    {
      v50 = objc_alloc(MEMORY[0x24BDF6F90]);
      v51 = (UIView *)objc_msgSend(v50, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      fullBookViewSeparator = self->_fullBookViewSeparator;
      self->_fullBookViewSeparator = v51;

      -[HLPHelpViewController view](self, "view");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "addSubview:", self->_fullBookViewSeparator);

      -[UIView setHidden:](self->_fullBookViewSeparator, "setHidden:", 1);
      objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_fullBookViewSeparator, "setBackgroundColor:", v54);

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_fullBookViewSeparator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIView leadingAnchor](self->_fullBookViewSeparator, "leadingAnchor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "trailingAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "constraintEqualToAnchor:", v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setActive:", 1);

      -[UIView topAnchor](self->_fullBookViewSeparator, "topAnchor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "topAnchor");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "constraintEqualToAnchor:", v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "setActive:", 1);

      -[UIView bottomAnchor](self->_fullBookViewSeparator, "bottomAnchor");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bottomAnchor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "constraintEqualToAnchor:", v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "setActive:", 1);

      -[UIView widthAnchor](self->_fullBookViewSeparator, "widthAnchor");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "scale");
      objc_msgSend(v64, "constraintEqualToConstant:", 1.0 / v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "setActive:", 1);

      v68 = self->_fullBookViewSeparator;
      v8 = v68;
    }

    if ((objc_msgSend(v82, "isDescendantOfView:", v3) & 1) == 0)
    {
      -[HLPHelpViewController addChildViewController:](self, "addChildViewController:", self->_topicViewController);
      -[HLPHelpViewController view](self, "view");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "addSubview:", v82);

      objc_msgSend(v82, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v82, "leadingAnchor");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "trailingAnchor");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "constraintEqualToAnchor:", v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "setActive:", 1);

      objc_msgSend(v82, "trailingAnchor");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "trailingAnchor");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "constraintEqualToAnchor:", v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "setActive:", 1);

      objc_msgSend(v82, "topAnchor");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "topAnchor");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "constraintEqualToAnchor:", v77);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "setActive:", 1);

      objc_msgSend(v82, "bottomAnchor");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bottomAnchor");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "constraintEqualToAnchor:", v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "setActive:", 1);

      -[HLPHelpTopicViewController didMoveToParentViewController:](self->_topicViewController, "didMoveToParentViewController:", self);
    }
  }

}

- (void)updateChildViewConstraints
{
  void *v3;
  char v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  if (!self->_fullBookView && !self->_displayHelpTopicsOnly)
  {
    -[HLPHelpTableOfContentViewController view](self->_tableOfContentViewController, "view");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      -[HLPHelpViewController view](self, "view");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v25, "isDescendantOfView:", v3);

      if ((v4 & 1) == 0)
      {
        -[HLPHelpViewController addChildViewController:](self, "addChildViewController:", self->_tableOfContentViewController);
        -[HLPHelpViewController view](self, "view");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addSubview:", v25);

        objc_msgSend(v25, "leadingAnchor");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[HLPHelpViewController view](self, "view");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "leadingAnchor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "constraintEqualToAnchor:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setActive:", 1);

        objc_msgSend(v25, "trailingAnchor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[HLPHelpViewController view](self, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "trailingAnchor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "constraintEqualToAnchor:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setActive:", 1);

        objc_msgSend(v25, "topAnchor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HLPHelpViewController view](self, "view");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "topAnchor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "constraintEqualToAnchor:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setActive:", 1);

        objc_msgSend(v25, "bottomAnchor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HLPHelpViewController view](self, "view");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "bottomAnchor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "constraintEqualToAnchor:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setActive:", 1);

        -[HLPHelpTableOfContentViewController didMoveToParentViewController:](self->_tableOfContentViewController, "didMoveToParentViewController:", self);
        -[HLPHelpTableOfContentViewController searchController](self->_tableOfContentViewController, "searchController");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[HLPHelpViewController navigationItem](self, "navigationItem");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setSearchController:", v22);

        -[HLPHelpViewController navigationItem](self, "navigationItem");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setHidesSearchBarWhenScrolling:", 0);

      }
    }

  }
}

- (void)updateTOCButton
{
  void *v3;
  _BOOL4 displayHelpTopicsOnly;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (!self->_fullBookView)
  {
    -[HLPHelpViewController navigationItem](self, "navigationItem");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leftBarButtonItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3 && self->_showTopicViewOnLoad)
    {
      displayHelpTopicsOnly = self->_displayHelpTopicsOnly;

      if (displayHelpTopicsOnly)
        return;
      objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("list.bullet"));
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithImage:style:target:action:", v8, 0, self, sel_showTopicView);
      objc_msgSend(v3, "setSelected:", 1);
      objc_msgSend(MEMORY[0x24BDD1488], "HLPBundle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Hide Table of Contents"), &stru_24D32F538, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setAccessibilityLabel:", v6);

      -[HLPHelpViewController navigationItem](self, "navigationItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setLeftBarButtonItem:", v3);

    }
  }
}

- (void)updateDoneButton
{
  void *v3;
  UIBarButtonItem *v4;
  UIBarButtonItem *doneBarButtonItem;
  void *v6;
  UIBarButtonItem *v7;
  UIBarButtonItem *v8;
  UIBarButtonItem *v9;
  UIBarButtonItem *v10;
  id v11;

  if (!self->_fullBookView)
  {
    if (self->_hideDoneButton)
    {
      -[HLPHelpViewController navigationItem](self, "navigationItem");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "rightBarButtonItem");
      v4 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
      doneBarButtonItem = self->_doneBarButtonItem;

      if (v4 == doneBarButtonItem)
      {
        -[HLPHelpViewController navigationItem](self, "navigationItem");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setRightBarButtonItem:", 0);

      }
      v7 = self->_doneBarButtonItem;
      self->_doneBarButtonItem = 0;

    }
    else
    {
      v8 = self->_doneBarButtonItem;
      if (!v8)
      {
        v9 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_dismiss);
        v10 = self->_doneBarButtonItem;
        self->_doneBarButtonItem = v9;

        v8 = self->_doneBarButtonItem;
      }
      -[HLPHelpViewController navigationItem](self, "navigationItem");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setRightBarButtonItem:", v8);

    }
  }
}

- (void)showTopicView
{
  void *v3;
  id v4;

  -[HLPHelpBookController helpTopicItemForID:](self->_helpBookController, "helpTopicItemForID:", self->_selectedHelpTopicID);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HLPHelpViewController _showHelpTopicItem:anchor:allowErrorMessage:animate:](self, "_showHelpTopicItem:anchor:allowErrorMessage:animate:", v4, v3, 1, 1);

}

- (void)setupTableContentViewController
{
  HLPHelpTableOfContentViewController *v3;
  HLPHelpTableOfContentViewController *tableOfContentViewController;
  id v5;

  if (!self->_tableOfContentViewController && !self->_displayHelpTopicsOnly)
  {
    v3 = -[HLPHelpTableOfContentViewController initWithStyle:]([HLPHelpTableOfContentViewController alloc], "initWithStyle:", 0);
    tableOfContentViewController = self->_tableOfContentViewController;
    self->_tableOfContentViewController = v3;

    -[HLPHelpTableOfContentViewController setDelegate:](self->_tableOfContentViewController, "setDelegate:", self);
    -[HLPHelpTableOfContentViewController setFullBookView:](self->_tableOfContentViewController, "setFullBookView:", self->_fullBookView);
    -[HLPHelpTableOfContentViewController setShowTopicViewOnLoad:](self->_tableOfContentViewController, "setShowTopicViewOnLoad:", self->_showTopicViewOnLoad);
    -[HLPHelpTableOfContentViewController view](self->_tableOfContentViewController, "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  }
}

- (void)setupTopicViewController
{
  HLPHelpTopicViewController *v3;
  HLPHelpTopicViewController *topicViewController;

  if (!self->_topicViewController)
  {
    v3 = objc_alloc_init(HLPHelpTopicViewController);
    topicViewController = self->_topicViewController;
    self->_topicViewController = v3;

    -[HLPHelpTopicViewController setDelegate:](self->_topicViewController, "setDelegate:", self);
    -[HLPHelpTopicViewController setDisplayHelpTopicsOnly:](self->_topicViewController, "setDisplayHelpTopicsOnly:", self->_displayHelpTopicsOnly);
    -[HLPHelpTopicViewController setShowTopicNameAsTitle:](self->_topicViewController, "setShowTopicNameAsTitle:", self->_showTopicNameAsTitle);
    -[HLPHelpTopicViewController setFullBookView:](self->_topicViewController, "setFullBookView:", self->_fullBookView);
    -[HLPHelpTopicViewController setHideDoneButton:](self->_topicViewController, "setHideDoneButton:", self->_hideDoneButton);
    -[HLPHelpTopicViewController setSingleTopic:](self->_topicViewController, "setSingleTopic:", self->_displayHelpTopicsOnly);
    -[HLPHelpViewController updateDarkMode](self, "updateDarkMode");
  }
}

- (void)loadBookWithTitle:(id)a3 identifier:(id)a4 topicID:(id)a5 version:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  id v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[HLPHelpViewController identifier](self, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", v11);

  if (v15)
  {
    -[HLPHelpViewController loadHelpTopicID:](self, "loadHelpTopicID:", v12);
  }
  else
  {
    -[HLPHelpViewController cleanup](self, "cleanup");
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__HLPHelpViewController_loadBookWithTitle_identifier_topicID_version___block_invoke;
    block[3] = &unk_24D32E890;
    block[4] = self;
    v17 = v10;
    v18 = v11;
    v19 = v13;
    v20 = v12;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __70__HLPHelpViewController_loadBookWithTitle_identifier_topicID_version___block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_opt_class(), "updateViewController:title:identifier:version:subpath:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0);
  objc_msgSend(*(id *)(a1 + 32), "setup");
  objc_msgSend(*(id *)(a1 + 32), "updateHelpBookController");
  return objc_msgSend(*(id *)(a1 + 32), "setSelectedHelpTopicID:", *(_QWORD *)(a1 + 64));
}

- (void)loadHelpTopicItem:(id)a3
{
  id v4;

  +[HLPLoadInfo infoWithTopicItem:accesstype:searchTerms:anchor:](HLPLoadInfo, "infoWithTopicItem:accesstype:searchTerms:anchor:", a3, 5, 0, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnalyticsLogged:", 1);
  -[HLPHelpViewController _showWithLoadInfo:animate:](self, "_showWithLoadInfo:animate:", v4, 1);

}

- (void)loadHelpTopicID:(id)a3
{
  void *selectedHelpTopicID;
  NSString *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[HLPRemoteDataController hasLoaded](self->_helpBookController, "hasLoaded") && self->_topicViewController)
  {
    -[HLPHelpBookController helpTopicItemForID:](self->_helpBookController, "helpTopicItemForID:", v7);
    selectedHelpTopicID = (void *)objc_claimAutoreleasedReturnValue();
    if (selectedHelpTopicID)
    {
      if (self->_fullBookView || self->_showingHelpTopic)
      {
        -[HLPHelpTopicViewController loadHelpTopicItem:searchTerms:anchor:](self->_topicViewController, "loadHelpTopicItem:searchTerms:anchor:", selectedHelpTopicID, 0, 0);
        -[HLPHelpTableOfContentViewController scrollToHelpItem:deselectImmediately:reload:animated:](self->_tableOfContentViewController, "scrollToHelpItem:deselectImmediately:reload:animated:", selectedHelpTopicID, 0, 1, 1);
      }
      else
      {
        -[HLPHelpViewController loadHelpTopicItem:](self, "loadHelpTopicItem:", selectedHelpTopicID);
      }
    }
  }
  else
  {
    v5 = (NSString *)v7;
    selectedHelpTopicID = self->_selectedHelpTopicID;
    self->_selectedHelpTopicID = v5;
  }

  -[HLPHelpTableOfContentViewController searchController](self->_tableOfContentViewController, "searchController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActive:", 0);

}

- (void)displayHelpBookWithLocale:(id)a3
{
  HLPHelpTableOfContentViewController *tableOfContentViewController;
  id v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  HLPHelpBookController *helpBookController;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  BOOL v24;
  HLPHelpBookController *v25;
  void *v26;
  HLPHelpTableOfContentViewController *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSString *v32;
  NSString *selectedHelpTopicID;
  NSString *v34;
  NSString *selectedHelpTopicName;
  __CFString *v36;
  void *v37;
  id v38;

  tableOfContentViewController = self->_tableOfContentViewController;
  v5 = a3;
  -[HLPHelpTableOfContentViewController setLocale:](tableOfContentViewController, "setLocale:", v5);
  -[HLPHelpTopicViewController setLocale:](self->_topicViewController, "setLocale:", v5);

  -[HLPHelpViewController loadingView](self, "loadingView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "showActivityIndicator:", 0);

  -[NSString componentsSeparatedByString:](self->_selectedHelpTopicID, "componentsSeparatedByString:", CFSTR("#"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") == 2)
  {
    objc_msgSend(v7, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  if (-[NSString length](self->_selectedHelpTopicName, "length"))
  {
    -[NSString componentsSeparatedByString:](self->_selectedHelpTopicName, "componentsSeparatedByString:", CFSTR("#"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    helpBookController = self->_helpBookController;
    objc_msgSend(v10, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpBookController helpTopicItemForName:](helpBookController, "helpTopicItemForName:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "count") == 2)
    {
      objc_msgSend(v10, "lastObject");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }

    v9 = (void *)v14;
  }
  else
  {
    if (!-[__CFString length](v8, "length") && !self->_prefersLandingViewOnLoad)
    {
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", kHLPHelpTopicViewControllerLastTopicHistoryItem);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v17 = (void *)MEMORY[0x24BDBCF20];
        v18 = objc_opt_class();
        objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 0;
        objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v37, v16, &v38);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v38;
        objc_msgSend(v19, "identifier");
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)v21;
        v23 = &stru_24D32F538;
        if (v21)
          v23 = (__CFString *)v21;
        v36 = v23;

        v8 = v36;
      }
      else
      {

        v8 = &stru_24D32F538;
      }

    }
    -[HLPHelpBookController helpTopicItemForID:](self->_helpBookController, "helpTopicItemForID:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v13)
    v24 = 1;
  else
    v24 = v8 == 0;
  if (!v24)
  {
    v25 = self->_helpBookController;
    -[HLPHelpBookController welcomeTopicIdentifier](v25, "welcomeTopicIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpBookController helpTopicItemForID:](v25, "helpTopicItemForID:", v26);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (self->_fullBookView)
  {
    -[HLPHelpTableOfContentViewController updateWithHelpBookController:](self->_tableOfContentViewController, "updateWithHelpBookController:", self->_helpBookController);
    if (v13)
    {
      -[HLPHelpViewController _showHelpTopicItem:anchor:allowErrorMessage:animate:](self, "_showHelpTopicItem:anchor:allowErrorMessage:animate:", v13, v9, 1, 1);
      v27 = self->_tableOfContentViewController;
      v28 = v13;
      v29 = 0;
      v30 = 1;
LABEL_26:
      -[HLPHelpTableOfContentViewController scrollToHelpItem:deselectImmediately:reload:animated:](v27, "scrollToHelpItem:deselectImmediately:reload:animated:", v28, v29, 0, v30);
    }
  }
  else
  {
    if (self->_showTopicViewOnLoad && v13)
    {
      +[HLPLoadInfo infoWithTopicItem:accesstype:searchTerms:anchor:](HLPLoadInfo, "infoWithTopicItem:accesstype:searchTerms:anchor:", v13, 6, 0, v9);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[HLPHelpViewController _showWithLoadInfo:animate:](self, "_showWithLoadInfo:animate:", v31, 1);

      goto LABEL_33;
    }
    -[HLPHelpTableOfContentViewController updateWithHelpBookController:](self->_tableOfContentViewController, "updateWithHelpBookController:", self->_helpBookController);
    if (v13 && self->_showTopicViewOnLoad)
    {
      objc_msgSend(v13, "identifier");
      v32 = (NSString *)objc_claimAutoreleasedReturnValue();
      selectedHelpTopicID = self->_selectedHelpTopicID;
      self->_selectedHelpTopicID = v32;

      objc_msgSend(v13, "name");
      v34 = (NSString *)objc_claimAutoreleasedReturnValue();
      selectedHelpTopicName = self->_selectedHelpTopicName;
      self->_selectedHelpTopicName = v34;

      v27 = self->_tableOfContentViewController;
      v28 = v13;
      v29 = 1;
      v30 = 0;
      goto LABEL_26;
    }
  }
LABEL_33:

}

- (void)updateLastLoadVersion
{
  id v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", self->_version, CFSTR("HLPHelpBookLastLoadVersion"));
  objc_msgSend(v3, "synchronize");

}

- (void)loadHelpBook
{
  NSObject *v3;
  NSURL **p_helpBookURL;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSString *v13;
  NSString *v14;
  NSURL *v15;
  void *v16;
  _BOOL4 v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  HLPHelpBookController *v37;
  HLPHelpBookController *helpBookController;
  void *v39;
  int v40;
  char v41;
  char v42;
  int v43;
  char v44;
  id v45;
  uint64_t v46;
  HLPHelpBookController *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  __CFString *v53;
  NSString *v54;
  __CFString *v55;
  NSString *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  _QWORD v66[4];
  id v67;
  id v68;
  NSString *v69;
  NSString *v70;
  HLPHelpViewController *v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  char v77;
  char v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint8_t buf[16];
  Class (*v84)(uint64_t);
  void *v85;
  uint64_t *v86;
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  HLPLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2153AA000, v3, OS_LOG_TYPE_DEFAULT, "loadHelpBook", buf, 2u);
  }

  p_helpBookURL = &self->_helpBookURL;
  if (!self->_helpBookURL || !self->_helpBookController)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKey:", CFSTR("HLPHelpBookLastLoadedLocale"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (!+[HLPCommonDefines isInternalBuild](HLPCommonDefines, "isInternalBuild"))
      goto LABEL_12;
    if (!PingPongClientLibraryCore_frameworkLibrary_0)
    {
      *(_OWORD *)buf = xmmword_24D32E9A0;
      v84 = 0;
      PingPongClientLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    }
    if (PingPongClientLibraryCore_frameworkLibrary_0)
    {
      v79 = 0;
      v80 = &v79;
      v81 = 0x2050000000;
      v7 = (void *)getPPCRedirectClass_softClass;
      v82 = getPPCRedirectClass_softClass;
      if (!getPPCRedirectClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        *(_QWORD *)&buf[8] = 3221225472;
        v84 = __getPPCRedirectClass_block_invoke;
        v85 = &unk_24D32E720;
        v86 = &v79;
        __getPPCRedirectClass_block_invoke((uint64_t)buf);
        v7 = (void *)v80[3];
      }
      v8 = objc_retainAutorelease(v7);
      _Block_object_dispose(&v79, 8);
      objc_msgSend(v8, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hostMappings");
      v65 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
LABEL_12:
      v65 = 0;
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("HLPHelpBookHostMappings"));
    v62 = objc_claimAutoreleasedReturnValue();
    if (v64 && !objc_msgSend(v63, "isEqualToString:", v64)
      || v65 | v62 && (objc_msgSend((id)v65, "isEqual:", v62) & 1) == 0)
    {
      HLPLogForCategory(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2153AA000, v10, OS_LOG_TYPE_DEFAULT, "Clearing all cache...", buf, 2u);
      }

      +[HLPHelpViewController clearCacheControllers](HLPHelpViewController, "clearCacheControllers");
    }
    objc_msgSend(v5, "setObject:forKey:", v65, CFSTR("HLPHelpBookHostMappings"));
    objc_msgSend(v5, "setObject:forKey:", v63, CFSTR("HLPHelpBookLastLoadedLocale"));
    objc_msgSend(v5, "synchronize");
    -[HLPHelpViewController loadingView](self, "loadingView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "showActivityIndicator:", 1);

    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForInfoDictionaryKey:", CFSTR("CFBundleShortVersionString"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = self->_version;
    if (!-[NSString length](v13, "length"))
    {
      v14 = v61;

      v13 = v14;
    }
    v15 = self->_localHelpBookFileURL;
    if (v15)
    {
      v16 = v15;
      -[HLPHelpViewController loadFromStaticServer](self, "loadFromStaticServer");
LABEL_69:

      return;
    }
    v17 = +[HLPCommonDefines isInternalBuild](HLPCommonDefines, "isInternalBuild");
    if (v17)
    {
      objc_msgSend(v5, "stringForKey:", CFSTR("HLPHelpBookBaseURLOverride"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v59, "length"))
      {
        objc_msgSend(v5, "stringForKey:", CFSTR("HLPDynamicHelpBookHostOverride"));
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v18)
          goto LABEL_31;
        goto LABEL_30;
      }
    }
    else
    {
      v59 = 0;
      if (!objc_msgSend(0, "length"))
      {
LABEL_30:
        v18 = CFSTR("https://cds.apple.com/");
LABEL_31:
        v53 = v18;
        objc_storeStrong((id *)&self->_helpBookBasePath, v18);
        objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)MEMORY[0x24BDBCEB8];
        objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "arrayWithArray:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(v5, "objectForKey:", CFSTR("HLPHelpBookPreferredLanguageOverride"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v23 = 0;
        }
        v49 = v23;
        if (objc_msgSend(v23, "length"))
          objc_msgSend(v22, "insertObject:atIndex:", v49, 0);
        objc_msgSend(MEMORY[0x24BDBCEA0], "systemLanguages");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        -[HLPHelpViewController additionalSupportedLanguages](self, "additionalSupportedLanguages");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "count");

        if (v25)
        {
          -[HLPHelpViewController additionalSupportedLanguages](self, "additionalSupportedLanguages");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "arrayByAddingObjectsFromArray:", v26);
          v27 = objc_claimAutoreleasedReturnValue();

          v60 = (void *)v27;
        }
        do
        {
          if ((unint64_t)objc_msgSend(v19, "count") > 2)
            break;
          if (!objc_msgSend(v22, "count"))
            break;
          objc_msgSend(MEMORY[0x24BDD1488], "preferredLocalizationsFromArray:forPreferences:", v60, v22);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObjectsFromArray:", v28);

          objc_msgSend(v22, "removeObjectAtIndex:", 0);
        }
        while (!objc_msgSend(v19, "containsObject:", CFSTR("en")));
        if (objc_msgSend(v19, "count"))
        {
          if ((unint64_t)objc_msgSend(v19, "count") >= 4)
            objc_msgSend(v19, "removeObjectsInRange:", 3, objc_msgSend(v19, "count") - 3);
        }
        else
        {
          objc_msgSend(v19, "addObject:", CFSTR("en"));
        }
        objc_msgSend((id)objc_opt_class(), "platformVersion");
        v54 = (NSString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "platform");
        v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v56 = self->_identifier;
        if (-[NSString containsString:](v56, "containsString:", CFSTR("watch")))
        {

          v29 = v54;
          v54 = v13;
          v55 = CFSTR("watchos");
        }
        else
        {
          if (-[NSString hasPrefix:](v56, "hasPrefix:", CFSTR("iphone"))
            || -[NSString hasPrefix:](v56, "hasPrefix:", CFSTR("ipad")))
          {
            goto LABEL_53;
          }
          if (-[NSString length](self->_subpath, "length"))
          {
            -[NSString stringByAppendingFormat:](v56, "stringByAppendingFormat:", CFSTR("-%@"), self->_subpath);
            v30 = objc_claimAutoreleasedReturnValue();

            v56 = (NSString *)v30;
          }
          if (-[HLPHelpViewController platformIndependent](self, "platformIndependent"))
            goto LABEL_53;
          objc_msgSend((id)objc_opt_class(), "deviceFamily");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSString stringByAppendingFormat:](v56, "stringByAppendingFormat:", CFSTR("-%@"), v29);
          v46 = objc_claimAutoreleasedReturnValue();

          v56 = (NSString *)v46;
        }

LABEL_53:
        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 5);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[HLPHelpViewController platformIndependent](self, "platformIndependent"))
        {
          v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("platform"), v55);
          objc_msgSend(v58, "addObject:", v31);
          v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("pOSv"), v54);
          objc_msgSend(v58, "addObject:", v32);

        }
        v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("product"), v56);
        v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("productVersion"), v13);
        v33 = objc_alloc(MEMORY[0x24BDD1838]);
        objc_msgSend(v19, "array");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "componentsJoinedByString:", CFSTR(","));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = (void *)objc_msgSend(v33, "initWithName:value:", CFSTR("locale"), v35);

        objc_msgSend(v58, "addObject:", v52);
        objc_msgSend(v58, "addObject:", v51);
        objc_msgSend(MEMORY[0x24BDD1808], "componentsWithString:", v53);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "setPath:", CFSTR("/content/services/book"));
        objc_msgSend(v58, "arrayByAddingObject:", v50);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "setQueryItems:", v36);

        objc_msgSend(v57, "URL");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_storeStrong((id *)&self->_helpBookVersion, v13);
          objc_storeStrong((id *)&self->_helpBookURL, v16);
          v37 = -[HLPRemoteDataController initWithURL:]([HLPHelpBookController alloc], "initWithURL:", *p_helpBookURL);
          helpBookController = self->_helpBookController;
          self->_helpBookController = v37;

          -[HLPHelpBookController setHelpBookURL:](self->_helpBookController, "setHelpBookURL:", *p_helpBookURL);
          -[HLPHelpBookController setAdditionalSupportedLanguages:](self->_helpBookController, "setAdditionalSupportedLanguages:", self->_additionalSupportedLanguages);
          -[HLPHelpBookController setServerType:](self->_helpBookController, "setServerType:", 1);
          objc_msgSend(v5, "objectForKey:", CFSTR("HLPDynamicHelpBookLastLoadedIdentifier"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectForKey:", CFSTR("HLPDynamicHelpBookLastLoadedVersion"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = -[NSString isEqualToString:](v13, "isEqualToString:", v48);
          v41 = -[NSString isEqualToString:](v13, "isEqualToString:", v39);
          v42 = v41;
          if (v48)
            v43 = v40;
          else
            v43 = 1;
          if (v39)
            v44 = v41;
          else
            v44 = 1;
          if (v43 != 1 || (v44 & 1) == 0)
            +[HLPHelpViewController clearCacheControllers](HLPHelpViewController, "clearCacheControllers");
          objc_initWeak((id *)buf, self);
          v47 = self->_helpBookController;
          v66[0] = MEMORY[0x24BDAC760];
          v66[1] = 3221225472;
          v66[2] = __37__HLPHelpViewController_loadHelpBook__block_invoke;
          v66[3] = &unk_24D32E8B8;
          objc_copyWeak(&v76, (id *)buf);
          v45 = v39;
          v67 = v45;
          v68 = v5;
          v77 = v40 ^ 1;
          v78 = v42 ^ 1;
          v69 = v56;
          v70 = v13;
          v71 = self;
          v72 = v58;
          v73 = v19;
          v74 = v57;
          v75 = v61;
          -[HLPHelpBookController fetchDataWithDataType:identifier:completionHandler:](v47, "fetchDataWithDataType:identifier:completionHandler:", 1, CFSTR("book.json"), v66);

          objc_destroyWeak(&v76);
          objc_destroyWeak((id *)buf);

        }
        else
        {
          -[HLPHelpViewController loadFromStaticServer](self, "loadFromStaticServer");
        }

        goto LABEL_68;
      }
    }
    -[HLPHelpViewController loadFromStaticServer](self, "loadFromStaticServer");
    v16 = 0;
LABEL_68:

    goto LABEL_69;
  }
}

void __37__HLPHelpViewController_loadHelpBook__block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  _BYTE *WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint8_t v50[16];
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  objc_msgSend(WeakRetained, "updateLastLoadVersion");
  objc_msgSend(v8, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x24BDD1808];
    objc_msgSend(v8, "URL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsWithURL:resolvingAgainstBaseURL:", v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_alloc_init(MEMORY[0x24BDD1808]);
    objc_msgSend(v13, "scheme");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setScheme:", v15);

    objc_msgSend(v13, "host");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHost:", v16);

    objc_msgSend(v14, "URL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "absoluteString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setHelpBookBasePath:", v18);

  }
  if (v7 || !a2)
  {
    HLPLogForCategory(0);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2153AA000, v38, OS_LOG_TYPE_DEFAULT, "CDS load failed", buf, 2u);
    }

    if (objc_msgSend(v7, "code") == 645 || objc_msgSend(v7, "code") == 615)
    {
      HLPLogForCategory(0);
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v50 = 0;
        _os_log_impl(&dword_2153AA000, v39, OS_LOG_TYPE_DEFAULT, "CDS book invalid", v50, 2u);
      }

      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", *(_QWORD *)(a1 + 96), CFSTR("HLPHelpBookDynamicServerLastFailureLoadVersion"));
      objc_msgSend(*(id *)(a1 + 40), "synchronize");
    }
    objc_msgSend(WeakRetained, "loadFromStaticServer");
  }
  else
  {
    if (!*(_QWORD *)(a1 + 32))
      objc_msgSend(*(id *)(a1 + 40), "removeObjectForKey:", kHLPHelpTopicViewControllerLastTopicHistoryItem);
    objc_msgSend(WeakRetained, "removeDDMLoadFailVersion");
    if (*(_BYTE *)(a1 + 112) || *(_BYTE *)(a1 + 113))
    {
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", *(_QWORD *)(a1 + 48), CFSTR("HLPDynamicHelpBookLastLoadedIdentifier"));
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", *(_QWORD *)(a1 + 56), CFSTR("HLPDynamicHelpBookLastLoadedVersion"));
      objc_msgSend(*(id *)(a1 + 40), "synchronize");
    }
    objc_msgSend(WeakRetained, "loadingView", v8, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "showActivityIndicator:", 0);

    if (WeakRetained)
    {
      if (WeakRetained[969])
      {
        objc_msgSend(WeakRetained, "tableOfContentViewController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "view");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setHidden:", 0);

        objc_msgSend(WeakRetained, "topicViewController");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "view");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setHidden:", 0);

        objc_msgSend(WeakRetained, "fullBookViewSeparator");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setHidden:", 0);

        if (+[HLPCommonDefines isVisionOS](HLPCommonDefines, "isVisionOS"))
        {
          objc_msgSend(*(id *)(a1 + 64), "title");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "tableOfContentViewController");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setTitle:", v25);

        }
      }
    }
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("topicid"), CFSTR("%@"));
    objc_msgSend(*(id *)(a1 + 72), "addObject:", v27);
    v28 = objc_alloc(MEMORY[0x24BDD1838]);
    objc_msgSend(WeakRetained, "helpBookController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bookId");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v28, "initWithName:value:", CFSTR("bookid"), v30);

    objc_msgSend(*(id *)(a1 + 72), "addObject:", v31);
    objc_msgSend(WeakRetained, "helpBookController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "locale");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "isoCodes");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "firstObject");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v35)
    {
      v37 = v35;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 80), "firstObject");
      v37 = (id)objc_claimAutoreleasedReturnValue();
    }
    v40 = v37;

    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("locale"), v40);
    objc_msgSend(WeakRetained, "updateCacheControllerToLanguageCode:", v40);
    objc_msgSend(*(id *)(a1 + 72), "arrayByAddingObject:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 88), "setQueryItems:", v42);

    objc_msgSend(*(id *)(a1 + 88), "setPath:", CFSTR("/content/services/lookup"));
    objc_msgSend(*(id *)(a1 + 88), "URL");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "absoluteString");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "helpBookController");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setTopicPathFormat:", v44);

    objc_msgSend(WeakRetained, "helpBookController");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "locale");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "displayHelpBookWithLocale:", v47);

    v8 = v48;
    v7 = v49;
  }

}

- (void)loadFromStaticServer
{
  NSObject *v3;
  NSString **p_helpBookVersion;
  NSString *helpBookVersion;
  NSURL *helpBookURL;
  HLPHelpBookController *helpBookController;
  void *v8;
  void *v9;
  NSURL *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSString *subpath;
  HLPHelpLocaleController *v22;
  HLPHelpLocaleController *localeListController;
  void *v24;
  HLPHelpLocaleController *v25;
  NSURL *v26;
  _QWORD v27[4];
  NSURL *v28;
  id v29;
  id buf[2];

  HLPLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_2153AA000, v3, OS_LOG_TYPE_DEFAULT, "load from help.apple.com", (uint8_t *)buf, 2u);
  }

  p_helpBookVersion = &self->_helpBookVersion;
  helpBookVersion = self->_helpBookVersion;
  self->_helpBookVersion = 0;

  helpBookURL = self->_helpBookURL;
  self->_helpBookURL = 0;

  helpBookController = self->_helpBookController;
  self->_helpBookController = 0;

  -[HLPHelpViewController loadingView](self, "loadingView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "showActivityIndicator:", 1);

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = self->_localHelpBookFileURL;
  if (!v10)
  {
    if (+[HLPCommonDefines isInternalBuild](HLPCommonDefines, "isInternalBuild"))
    {
      objc_msgSend(v9, "stringForKey:", CFSTR("HLPHelpBookBaseURLOverride"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v11, "length"))
      {
        objc_msgSend(v9, "stringForKey:", CFSTR("HLPHelpBookHostOverride"));
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
LABEL_11:
          objc_storeStrong((id *)&self->_helpBookBasePath, v12);
          objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "deviceFamily");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_storeStrong((id *)&self->_helpBookVersion, self->_version);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@/%@"), self->_identifier, v14, self->_version);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSString length](self->_subpath, "length"))
          {
            objc_msgSend(v15, "stringByAppendingPathComponent:", self->_subpath);
            v16 = objc_claimAutoreleasedReturnValue();

            v15 = (void *)v16;
          }
          objc_msgSend(v13, "URLByAppendingPathComponent:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "URLByAppendingPathComponent:", CFSTR("cardinal/"));
          v10 = (NSURL *)objc_claimAutoreleasedReturnValue();

          goto LABEL_14;
        }
LABEL_10:
        v12 = CFSTR("https://help.apple.com");
        goto LABEL_11;
      }
    }
    else
    {
      v11 = 0;
      if (!objc_msgSend(0, "length"))
        goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v11);
    v10 = (NSURL *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  }
  objc_msgSend(v9, "stringForKey:", CFSTR("HLPHelpBookLastIdentifier"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringForKey:", CFSTR("HLPHelpBookLastLoadedVersion"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringForKey:", CFSTR("HLPHelpBookLastLoadedSubpath"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSString isEqualToString:](self->_identifier, "isEqualToString:", v18)
    || !-[NSString isEqualToString:](*p_helpBookVersion, "isEqualToString:", v19)
    || (subpath = self->_subpath) != 0 && !-[NSString isEqualToString:](subpath, "isEqualToString:", v20))
  {
    +[HLPHelpViewController clearCacheControllers](HLPHelpViewController, "clearCacheControllers");
    objc_msgSend(v9, "setObject:forKey:", self->_identifier, CFSTR("HLPHelpBookLastIdentifier"));
    objc_msgSend(v9, "setObject:forKey:", *p_helpBookVersion, CFSTR("HLPHelpBookLastLoadedVersion"));
    objc_msgSend(v9, "setObject:forKey:", self->_subpath, CFSTR("HLPHelpBookLastLoadedSubpath"));
    if (!-[NSString length](self->_selectedHelpTopicName, "length")
      && !-[NSString length](self->_selectedHelpTopicID, "length"))
    {
      objc_msgSend(v9, "removeObjectForKey:", kHLPHelpTopicViewControllerLastTopicHistoryItem);
    }
    objc_msgSend(v9, "synchronize");
  }
  v22 = -[HLPHelpLocaleController initWithURL:]([HLPHelpLocaleController alloc], "initWithURL:", v10);
  localeListController = self->_localeListController;
  self->_localeListController = v22;

  -[HLPHelpViewController preferredLanguagesOverride](self, "preferredLanguagesOverride");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HLPHelpLocaleController setPreferredLanguagesOverride:](self->_localeListController, "setPreferredLanguagesOverride:", v24);

  objc_initWeak(buf, self);
  v25 = self->_localeListController;
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __45__HLPHelpViewController_loadFromStaticServer__block_invoke;
  v27[3] = &unk_24D32E908;
  objc_copyWeak(&v29, buf);
  v26 = v10;
  v28 = v26;
  -[HLPRemoteDataController fetchDataWithDataType:identifier:completionHandler:](v25, "fetchDataWithDataType:identifier:completionHandler:", 1, CFSTR("locale-list.json"), v27);

  objc_destroyWeak(&v29);
  objc_destroyWeak(buf);

}

void __45__HLPHelpViewController_loadFromStaticServer__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HLPHelpBookController *v20;
  void *v21;
  void *v22;
  HLPHelpBookController *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  id v29;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (!v5
    && a2
    && (objc_msgSend(WeakRetained, "localeListController"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "locales"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "count"),
        v9,
        v8,
        v10))
  {
    objc_msgSend(v7, "localeListController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentLocale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");

    if (v14)
    {
      objc_msgSend(v12, "isoCodes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "updateCacheControllerToLanguageCode:", v16);

      v17 = *(void **)(a1 + 32);
      objc_msgSend(v12, "path");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "URLByAppendingPathComponent:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setHelpBookURL:", v19);

      v20 = [HLPHelpBookController alloc];
      objc_msgSend(v7, "helpBookURL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "URLByAppendingPathComponent:", CFSTR("navigation.json"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[HLPRemoteDataController initWithURL:](v20, "initWithURL:", v22);
      objc_msgSend(v7, "setHelpBookController:", v23);

      objc_msgSend(v7, "helpBookController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setServerType:", 0);

      objc_msgSend(v7, "helpBookURL");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "helpBookController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setHelpBookURL:", v25);

      objc_msgSend(v7, "helpBookController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __45__HLPHelpViewController_loadFromStaticServer__block_invoke_2;
      v28[3] = &unk_24D32E8E0;
      v28[4] = v7;
      v29 = v12;
      objc_msgSend(v27, "fetchDataWithDataType:identifier:completionHandler:", 1, CFSTR("navigation.json"), v28);

    }
  }
  else
  {
    objc_msgSend(v7, "showMessageForError:", v5);
    objc_msgSend(v7, "removeDDMLoadFailVersion");
    objc_msgSend(v7, "updateLastLoadVersion");
  }

}

uint64_t __45__HLPHelpViewController_loadFromStaticServer__block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = *(void **)(a1 + 32);
  if (!a3 && a2)
  {
    objc_msgSend(v4, "version");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "localHelpBookFileURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
        return objc_msgSend(*(id *)(a1 + 32), "displayHelpBookWithLocale:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "helpBookController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "contentVersion");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setVersion:", v8);

      objc_msgSend(*(id *)(a1 + 32), "localHelpBookAnalyticIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        +[HLPAnalyticsEventController sharedInstance](HLPAnalyticsEventController, "sharedInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "version");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "configureWithHelpBookID:version:", v5, v10);

      }
    }

    return objc_msgSend(*(id *)(a1 + 32), "displayHelpBookWithLocale:", *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(v4, "showMessageForError:");
  objc_msgSend(*(id *)(a1 + 32), "removeDDMLoadFailVersion");
  return objc_msgSend(*(id *)(a1 + 32), "updateLastLoadVersion");
}

- (void)updateDarkMode
{
  void *v2;
  NSURL *localHelpBookFileURL;
  void *v5;
  void *v6;
  int v7;
  char v8;
  float v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  id v15;

  if (!self->_supportsDarkMode)
  {
    localHelpBookFileURL = self->_localHelpBookFileURL;
    if (localHelpBookFileURL)
    {
      -[NSURL absoluteString](localHelpBookFileURL, "absoluteString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      self->_supportsDarkMode = objc_msgSend(v5, "rangeOfString:options:", CFSTR("FunctionHelp.bundle"), 4) != 0x7FFFFFFFFFFFFFFFLL;

      if (self->_supportsDarkMode)
        goto LABEL_16;
    }
    else
    {
      self->_supportsDarkMode = 0;
    }
    -[HLPHelpViewController identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsString:", CFSTR("watch"));
    v8 = v7;
    if (v7)
    {
      -[HLPHelpViewController version](self, "version");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "floatValue");
      if (v9 >= 7.0)
        goto LABEL_10;
    }
    -[HLPHelpViewController identifier](self, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("playgrounds")) & 1) != 0)
    {

      if ((v8 & 1) == 0)
      {
LABEL_11:

LABEL_15:
        self->_supportsDarkMode = 1;
        goto LABEL_16;
      }
LABEL_10:

      goto LABEL_11;
    }
    -[HLPHelpViewController identifier](self, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hasPrefix:", CFSTR("assistive-access"));

    if ((v8 & 1) != 0)
    if ((v12 & 1) != 0)
      goto LABEL_15;
    if (!self->_supportsDarkMode)
      goto LABEL_19;
  }
LABEL_16:
  -[HLPHelpTopicViewController setSupportsDarkMode:](self->_topicViewController, "setSupportsDarkMode:", 1);
  if (!self->_supportsDarkMode)
  {
LABEL_19:
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v13 = objc_claimAutoreleasedReturnValue();
LABEL_20:
  v15 = (id)v13;
  -[HLPHelpViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:", v15);

}

- (void)registerTraitChanges
{
  void *v3;
  id v4;
  _QWORD v5[5];
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v6[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __45__HLPHelpViewController_registerTraitChanges__block_invoke;
  v5[3] = &unk_24D32E540;
  v5[4] = self;
  v4 = (id)-[HLPHelpViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v3, v5);

}

uint64_t __45__HLPHelpViewController_registerTraitChanges__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "traitCollectionChangedFrom:");
}

- (void)traitCollectionChangedFrom:(id)a3
{
  id v4;
  void *v5;
  int v6;

  v4 = a3;
  -[HLPHelpViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4);

  if (v6)
    -[HLPHelpViewController updateDarkMode](self, "updateDarkMode");
}

- (void)updateCacheControllerToLanguageCode:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  +[HLPJSONCacheController sharedInstance](HLPJSONCacheController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLanguageCode:", v3);

  +[HLPStringCacheController sharedInstance](HLPStringCacheController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLanguageCode:", v3);

  +[HLPImageCacheController sharedInstance](HLPImageCacheController, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLanguageCode:", v3);

}

- (void)removeDDMLoadFailVersion
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("HLPHelpBookDynamicServerLastFailureLoadVersion"));
  objc_msgSend(v2, "synchronize");

}

- (void)showMessageForError:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[HLPHelpBookController rootSectionItem](self->_helpBookController, "rootSectionItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (self->_localHelpBookFileURL
    || (-[HLPHelpViewController reachabilityManager](self, "reachabilityManager"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isNetworkError:", v15),
        v7,
        !v8))
  {
    if (!self->_fullBookView)
    {
      -[HLPHelpTopicViewController loadingView](self->_topicViewController, "loadingView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "showDefaultErrorMessage");

    }
    -[HLPHelpViewController loadingView](self, "loadingView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v6)
      objc_msgSend(v13, "showActivityIndicator:", 0);
    else
      objc_msgSend(v13, "showDefaultErrorMessage");
  }
  else
  {
    if (!self->_fullBookView)
    {
      -[HLPHelpTopicViewController loadingView](self->_topicViewController, "loadingView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "showNoConnectionErrorMessage");

    }
    -[HLPHelpViewController loadingView](self, "loadingView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v6)
      objc_msgSend(v10, "showActivityIndicator:", 0);
    else
      objc_msgSend(v10, "showNoConnectionErrorMessage");

    -[HLPHelpViewController reachabilityManager](self, "reachabilityManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "startNotifier");
  }

  -[HLPHelpTableOfContentViewController loadError](self->_tableOfContentViewController, "loadError");
}

- (void)_showHelpTopicItem:(id)a3 anchor:(id)a4 allowErrorMessage:(BOOL)a5 animate:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v9;

  v6 = a6;
  v7 = a5;
  +[HLPLoadInfo infoWithTopicItem:accesstype:searchTerms:anchor:](HLPLoadInfo, "infoWithTopicItem:accesstype:searchTerms:anchor:", a3, 6, 0, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[HLPHelpViewController _showWithLoadInfo:allowErrorMessage:animate:](self, "_showWithLoadInfo:allowErrorMessage:animate:", v9, v7, v6);

}

- (void)_showWithLoadInfo:(id)a3 animate:(BOOL)a4
{
  -[HLPHelpViewController _showWithLoadInfo:allowErrorMessage:animate:](self, "_showWithLoadInfo:allowErrorMessage:animate:", a3, 1, a4);
}

- (void)_showWithLoadInfo:(id)a3 allowErrorMessage:(BOOL)a4 animate:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
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
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
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
  HLPHelpTopicViewController *v36;
  HLPHelpTopicViewController *topicViewController;
  uint64_t v38;
  void *v39;
  const __CFString *v40;
  id v41;

  v5 = a5;
  v6 = a4;
  v41 = a3;
  objc_msgSend(v41, "helpTopicItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "anchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_showingHelpTopic)
  {
    if (!self->_fullBookView)
      goto LABEL_14;
    goto LABEL_5;
  }
  if (!self->_fullBookView)
  {
    self->_showingHelpTopic = 1;
    -[HLPHelpViewController setupTopicViewController](self, "setupTopicViewController");
    if (self->_displayHelpTopicsOnly)
    {
      -[HLPHelpViewController childViewControllers](self, "childViewControllers");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "containsObject:", self->_topicViewController);

      if ((v25 & 1) != 0)
        goto LABEL_21;
      -[HLPHelpTopicViewController view](self->_topicViewController, "view");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[HLPHelpViewController addChildViewController:](self, "addChildViewController:", self->_topicViewController);
      -[HLPHelpViewController view](self, "view");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[HLPHelpTopicViewController view](self->_topicViewController, "view");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addSubview:", v28);

      -[HLPHelpTopicViewController view](self->_topicViewController, "view");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
      _NSDictionaryOfVariableBindings(CFSTR("topicView"), v29, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[topicView]|"), 0, 0, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addObjectsFromArray:", v32);

      objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[topicView]|"), 0, 0, v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addObjectsFromArray:", v33);

      -[HLPHelpViewController view](self, "view");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "addConstraints:", v30);

      -[HLPHelpTopicViewController didMoveToParentViewController:](self->_topicViewController, "didMoveToParentViewController:", self);
    }
    else
    {
      -[HLPHelpViewController navigationController](self, "navigationController");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "topViewController");
      v36 = (HLPHelpTopicViewController *)objc_claimAutoreleasedReturnValue();
      topicViewController = self->_topicViewController;

      if (v36 == topicViewController)
      {
        if (v8)
          goto LABEL_22;
        goto LABEL_29;
      }
      -[HLPHelpViewController navigationController](self, "navigationController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "pushViewController:animated:", self->_topicViewController, v5);
    }

LABEL_21:
    if (v8)
    {
LABEL_22:
      if (self->_displayHelpTopicsOnly && self->_showTopicNameAsTitle)
      {
        objc_msgSend(v8, "name");
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = (void *)v38;
        if (v38)
          v40 = (const __CFString *)v38;
        else
          v40 = &stru_24D32F538;
        -[HLPHelpViewController setTitle:](self, "setTitle:", v40);

      }
    }
LABEL_29:
    -[HLPHelpTopicViewController setHideDoneButton:](self->_topicViewController, "setHideDoneButton:", self->_hideDoneButton);
  }
LABEL_5:
  -[HLPHelpTopicViewController setHelpBookController:](self->_topicViewController, "setHelpBookController:", self->_helpBookController);
  if (-[HLPHelpBookController serverType](self->_helpBookController, "serverType"))
  {
    objc_msgSend(v8, "identifier");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      -[HLPHelpBookController topicPathFormat](self->_helpBookController, "topicPathFormat");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "length");

      if (v13)
      {
        v14 = (void *)MEMORY[0x24BDD17C8];
        -[HLPHelpBookController topicPathFormat](self->_helpBookController, "topicPathFormat");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HLPHelpTopicViewController setHelpBookURL:](self->_topicViewController, "setHelpBookURL:", v18);

      }
    }
  }
  else
  {
    -[HLPHelpTopicViewController setHelpBookURL:](self->_topicViewController, "setHelpBookURL:", self->_helpBookURL);
  }
  if (objc_msgSend(v41, "accessType") == -1)
  {
    -[HLPHelpTableOfContentViewController searchTerms](self->_tableOfContentViewController, "searchTerms");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v8;
    v22 = -1;
  }
  else
  {
    v19 = objc_msgSend(v41, "accessType");
    -[HLPHelpTableOfContentViewController searchTerms](self->_tableOfContentViewController, "searchTerms");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v8;
    v22 = v19;
  }
  +[HLPLoadInfo infoWithTopicItem:accesstype:searchTerms:anchor:](HLPLoadInfo, "infoWithTopicItem:accesstype:searchTerms:anchor:", v21, v22, v20, v9);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "setAnalyticsLogged:", objc_msgSend(v41, "analyticsLogged"));
  -[HLPHelpTopicViewController loadWithInfo:allowErrorMessage:](self->_topicViewController, "loadWithInfo:allowErrorMessage:", v23, v6);

LABEL_14:
}

- (id)topicIDForTopicName:(id)a3 locale:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableDictionary *localHelpBookNameIDMap;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  int v12;
  HLPHelpLocaleController *localeListController;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSMutableDictionary *v27;
  void *v28;
  void *v29;
  _QWORD v31[4];
  id v32;
  HLPHelpViewController *v33;
  _QWORD v34[5];
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HLPHelpViewController localHelpBookFileURL](self, "localHelpBookFileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    localHelpBookNameIDMap = self->_localHelpBookNameIDMap;

    if (!localHelpBookNameIDMap)
    {
      v10 = (NSMutableDictionary *)objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
      v11 = self->_localHelpBookNameIDMap;
      self->_localHelpBookNameIDMap = v10;

      v12 = objc_msgSend(v7, "isEqualToString:", CFSTR("en-US"));
      localeListController = self->_localeListController;
      if (v12)
      {
        -[HLPHelpLocaleController englishLocale](self->_localeListController, "englishLocale");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v35[0] = v7;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HLPHelpLocaleController localeWithPreferredLanguages:](localeListController, "localeWithPreferredLanguages:", v15);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
      -[HLPHelpBookController helpItemMap](self->_helpBookController, "helpItemMap");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "count"))
      {
        objc_msgSend(v14, "path");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("en.lproj"));

        if (v18)
        {
          -[HLPHelpBookController helpItemMap](self->_helpBookController, "helpItemMap");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v34[0] = MEMORY[0x24BDAC760];
          v34[1] = 3221225472;
          v34[2] = __52__HLPHelpViewController_topicIDForTopicName_locale___block_invoke;
          v34[3] = &unk_24D32E930;
          v34[4] = self;
          objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v34);

LABEL_15:
          goto LABEL_16;
        }
      }
      else
      {

      }
      -[HLPHelpViewController localHelpBookFileURL](self, "localHelpBookFileURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "URLByAppendingPathComponent:", CFSTR("en.lproj/navigation.json"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v21, "checkResourceIsReachableAndReturnError:", 0))
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v22, 0, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "count"))
        {
          objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("topics"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "allKeys");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v31[0] = MEMORY[0x24BDAC760];
          v31[1] = 3221225472;
          v31[2] = __52__HLPHelpViewController_topicIDForTopicName_locale___block_invoke_2;
          v31[3] = &unk_24D32E958;
          v32 = v24;
          v33 = self;
          v26 = v24;
          objc_msgSend(v25, "enumerateObjectsUsingBlock:", v31);

        }
      }

      goto LABEL_15;
    }
  }
LABEL_16:
  v27 = self->_localHelpBookNameIDMap;
  objc_msgSend(v6, "lowercaseString");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

void __52__HLPHelpViewController_topicIDForTopicName_locale___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "localHelpBookNameIDMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, v8);

  }
}

void __52__HLPHelpViewController_topicIDForTopicName_locale___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "localHelpBookNameIDMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v6);

  }
}

- (void)dismiss
{
  id WeakRetained;
  char v4;
  id v5;

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_popWelcomeTopicView, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v5, "helpViewControllerDoneButtonTapped:", self);

  }
  else
  {
    -[HLPHelpViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (void)popWelcomeTopicView
{
  NSString *selectedHelpTopicID;
  void *v4;
  HLPHelpTopicViewController *v5;
  HLPHelpTopicViewController *topicViewController;
  id v7;

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_popWelcomeTopicView, 0);
  selectedHelpTopicID = self->_selectedHelpTopicID;
  -[HLPHelpBookController welcomeTopicIdentifier](self->_helpBookController, "welcomeTopicIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (-[NSString isEqualToString:](selectedHelpTopicID, "isEqualToString:"))
  {
    -[HLPHelpViewController navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topViewController");
    v5 = (HLPHelpTopicViewController *)objc_claimAutoreleasedReturnValue();
    topicViewController = self->_topicViewController;

    if (v5 == topicViewController)
      -[HLPHelpViewController helpTopicViewControllerTableOfContentButtonTapped:](self, "helpTopicViewControllerTableOfContentButtonTapped:", self->_topicViewController);
  }
  else
  {

  }
}

- (void)tableOfContentViewController:(id)a3 showHelpTopicItem:(id)a4
{
  -[HLPHelpViewController loadHelpTopicItem:](self, "loadHelpTopicItem:", a4);
}

- (id)currentHelpTopicItemForTableOfContentViewController:(id)a3
{
  return -[HLPHelpBookController helpTopicItemForID:](self->_helpBookController, "helpTopicItemForID:", self->_selectedHelpTopicID);
}

- (void)tableOfContentViewControllerSearchUsed:(id)a3
{
  HLPHelpViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "helpViewControllerSearchUsed:", self);

  }
}

- (void)tableOfContentViewControllerShowHelpBookInfo:(id)a3
{
  -[HLPHelpViewController showHelpBookInfo:](self, "showHelpBookInfo:", 0);
}

- (void)tableOfContentViewControllerToCContentViewed:(id)a3 topicID:(id)a4 topicTitle:(id)a5 source:(id)a6 interfaceStyle:(int64_t)a7 fromTopicID:(id)a8 externalURLString:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id WeakRetained;
  char v19;
  id v20;
  id v21;

  v21 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a8;
  v17 = a9;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) != 0)
  {
    v20 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v20, "helpViewControllerContentViewed:topicID:topicTitle:source:interfaceStyle:fromTopicID:externalURLString:", self, v21, v14, v15, a7, v16, v17);

  }
}

- (void)helpTopicViewController:(id)a3 traitCollectionChanged:(id)a4
{
  -[HLPHelpViewController traitCollectionChangedFrom:](self, "traitCollectionChangedFrom:", a4);
}

- (void)helpTopicViewControllerCurrentTopicIsPassionPoint:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x24BEDCDF0];
  v5 = a3;
  objc_msgSend(v4, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_popWelcomeTopicView, 0);
  objc_msgSend(v5, "webView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setUserInteractionEnabled:", 1);
}

- (void)helpTopicViewControllerTableOfContentButtonTapped:(id)a3
{
  void *v4;
  id v5;
  id WeakRetained;
  char v7;
  id v8;
  id v9;

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_popWelcomeTopicView, 0);
  -[HLPHelpTableOfContentViewController updateWithHelpBookController:](self->_tableOfContentViewController, "updateWithHelpBookController:", self->_helpBookController);
  -[HLPHelpViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

  self->_shouldDismissWelcomeTopic = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "helpViewControllerTOCUsed:", self);

  }
  +[HLPAnalyticsEvent event](HLPAnalyticsEventTOCUsed, "event");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "log");

}

- (void)helpTopicViewController:(id)a3 topicLoaded:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (!self->_shouldDismissWelcomeTopic)
    goto LABEL_9;
  -[HLPHelpViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || !self->_tableOfContentViewController)
  {
LABEL_8:

    goto LABEL_9;
  }
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HLPHelpBookController welcomeTopicIdentifier](self->_helpBookController, "welcomeTopicIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", v9) & 1) == 0)
  {

    goto LABEL_8;
  }
  v10 = objc_msgSend(v6, "isPassionPoints");

  if ((v10 & 1) == 0)
    -[HLPHelpViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_popWelcomeTopicView, 0, 2.5);
LABEL_9:

}

- (void)helpTopicViewControllerContentViewed:(id)a3 topicID:(id)a4 topicTitle:(id)a5 source:(id)a6 interfaceStyle:(int64_t)a7 fromTopicID:(id)a8 externalURLString:(id)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  id WeakRetained;
  char v18;
  id v19;
  void *v20;
  id v21;

  v21 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a8;
  v16 = a9;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    v19 = objc_loadWeakRetained((id *)&self->_delegate);
    -[HLPHelpViewController traitCollection](self, "traitCollection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "helpViewControllerContentViewed:topicID:topicTitle:source:interfaceStyle:fromTopicID:externalURLString:", self, v21, v13, v14, objc_msgSend(v20, "userInterfaceStyle"), v15, v16);

  }
}

- (void)helpTopicViewController:(id)a3 selectedHelpTopicItem:(id)a4 accessType:(int64_t)a5
{
  id v8;
  NSString *v9;
  NSString *selectedHelpTopicID;
  NSString *v11;
  NSString *selectedHelpTopicName;
  NSString *v13;
  void *v14;
  HLPHelpBookController *helpBookController;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v8 = a4;
  objc_msgSend(v8, "identifier");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  selectedHelpTopicID = self->_selectedHelpTopicID;
  self->_selectedHelpTopicID = v9;

  objc_msgSend(v8, "name");
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  selectedHelpTopicName = self->_selectedHelpTopicName;
  self->_selectedHelpTopicName = v11;

  if (v21)
  {
    v13 = self->_selectedHelpTopicID;
    -[HLPHelpBookController welcomeTopicIdentifier](self->_helpBookController, "welcomeTopicIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = -[NSString isEqualToString:](v13, "isEqualToString:", v14);

    if ((_DWORD)v13)
    {
      helpBookController = self->_helpBookController;
      -[HLPHelpBookController welcomeTopicIdentifier](helpBookController, "welcomeTopicIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HLPHelpBookController helpItemForID:](helpBookController, "helpItemForID:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = objc_msgSend(v17, "isPassionPoints");
    }
    else
    {
      v18 = 1;
    }
    objc_msgSend(v21, "webView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setUserInteractionEnabled:", v18);

  }
  if (a5 != 5 && self->_fullBookView)
  {
    -[HLPHelpViewController tableOfContentViewController](self, "tableOfContentViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "scrollToHelpItem:deselectImmediately:reload:animated:", v8, 0, 1, 0);

  }
}

- (void)helpTopicViewController:(id)a3 failToLoadWithError:(id)a4
{
  -[HLPHelpViewController showMessageForError:](self, "showMessageForError:", a4);
}

- (void)helpTopicViewControllerShowHelpBookInfo:(id)a3
{
  -[HLPHelpViewController showHelpBookInfo:](self, "showHelpBookInfo:", 0);
}

- (void)reachabilityManagerConnectionStatusChanged:(id)a3 connected:(BOOL)a4
{
  void *v5;

  if (a4)
  {
    -[HLPHelpViewController reachabilityManager](self, "reachabilityManager", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopNotifier");

    -[HLPHelpViewController loadHelpBook](self, "loadHelpBook");
    -[HLPHelpTopicViewController reloadCurrentTopic](self->_topicViewController, "reloadCurrentTopic");
  }
}

- (void)showHelpBookInfo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;
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
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", &stru_24D32F538);
  objc_msgSend(v4, "appendFormat:", CFSTR("Host URL: %@\n"), self->_helpBookBasePath);
  objc_msgSend(v4, "appendFormat:", CFSTR("Identifier: %@\n"), self->_identifier);
  objc_msgSend(v4, "appendFormat:", CFSTR("Version: %@\n"), self->_helpBookVersion);
  -[HLPHelpBookController contentVersion](self->_helpBookController, "contentVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HLPHelpBookController contentVersion](self->_helpBookController, "contentVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Content Version: %@\n"), v6);

  }
  if (-[HLPHelpBookController contentFormatVersion](self->_helpBookController, "contentFormatVersion") >= 1)
  {
    v7 = -[HLPHelpBookController contentFormatVersion](self->_helpBookController, "contentFormatVersion");
    v8 = CFSTR("2.0.6");
    if (v7 > 4)
      v8 = CFSTR("5.0.11");
    objc_msgSend(v4, "appendFormat:", CFSTR("Content Style Version: %@\n"), v8);
    objc_msgSend(v4, "appendFormat:", CFSTR("Content Format Version: %zd\n"), -[HLPHelpBookController contentFormatVersion](self->_helpBookController, "contentFormatVersion"));
  }
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("Device language: %@\n"), v10);

  if (-[HLPHelpBookController serverType](self->_helpBookController, "serverType") == 1)
  {
    -[HLPHelpBookController locale](self->_helpBookController, "locale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "isoCodes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HLPHelpLocaleController currentLocale](self->_localeListController, "currentLocale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v4, "appendFormat:", CFSTR("Content language: %@\n"), v13);
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForInfoDictionaryKey:", CFSTR("CFBundleShortVersionString"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("App Version: %@"), v15);

  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Help Book Info"), v4, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24D32F538, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __42__HLPHelpViewController_showHelpBookInfo___block_invoke;
  v22[3] = &unk_24D32E980;
  v23 = v16;
  v20 = v16;
  objc_msgSend(v17, "actionWithTitle:style:handler:", v19, 1, v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addAction:", v21);

  -[HLPHelpViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v20, 1, 0);
}

uint64_t __42__HLPHelpViewController_showHelpBookInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (BOOL)useModalPresentation
{
  return self->_useModalPresentation;
}

- (void)setUseModalPresentation:(BOOL)a3
{
  self->_useModalPresentation = a3;
}

- (BOOL)hideDoneButton
{
  return self->_hideDoneButton;
}

- (BOOL)displayHelpTopicsOnly
{
  return self->_displayHelpTopicsOnly;
}

- (void)setDisplayHelpTopicsOnly:(BOOL)a3
{
  self->_displayHelpTopicsOnly = a3;
}

- (BOOL)platformIndependent
{
  return self->_platformIndependent;
}

- (void)setPlatformIndependent:(BOOL)a3
{
  self->_platformIndependent = a3;
}

- (BOOL)showTopicNameAsTitle
{
  return self->_showTopicNameAsTitle;
}

- (void)setShowTopicNameAsTitle:(BOOL)a3
{
  self->_showTopicNameAsTitle = a3;
}

- (BOOL)showTopicViewOnLoad
{
  return self->_showTopicViewOnLoad;
}

- (void)setShowTopicViewOnLoad:(BOOL)a3
{
  self->_showTopicViewOnLoad = a3;
}

- (BOOL)prefersLandingViewOnLoad
{
  return self->_prefersLandingViewOnLoad;
}

- (void)setPrefersLandingViewOnLoad:(BOOL)a3
{
  self->_prefersLandingViewOnLoad = a3;
}

- (HLPHelpViewControllerDelegate)delegate
{
  return (HLPHelpViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (NSString)subpath
{
  return self->_subpath;
}

- (void)setSubpath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (NSURL)localHelpBookFileURL
{
  return self->_localHelpBookFileURL;
}

- (void)setLocalHelpBookFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (NSArray)preferredLanguagesOverride
{
  return self->_preferredLanguagesOverride;
}

- (void)setPreferredLanguagesOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1056);
}

- (NSArray)additionalSupportedLanguages
{
  return self->_additionalSupportedLanguages;
}

- (void)setAdditionalSupportedLanguages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1064);
}

- (NSString)selectedHelpTopicID
{
  return self->_selectedHelpTopicID;
}

- (void)setSelectedHelpTopicID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1072);
}

- (NSString)selectedHelpTopicName
{
  return self->_selectedHelpTopicName;
}

- (void)setSelectedHelpTopicName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1080);
}

- (NSMutableDictionary)localHelpBookNameIDMap
{
  return self->_localHelpBookNameIDMap;
}

- (void)setLocalHelpBookNameIDMap:(id)a3
{
  objc_storeStrong((id *)&self->_localHelpBookNameIDMap, a3);
}

- (NSURL)helpBookURL
{
  return self->_helpBookURL;
}

- (void)setHelpBookURL:(id)a3
{
  objc_storeStrong((id *)&self->_helpBookURL, a3);
}

- (NSString)helpBookBasePath
{
  return self->_helpBookBasePath;
}

- (void)setHelpBookBasePath:(id)a3
{
  objc_storeStrong((id *)&self->_helpBookBasePath, a3);
}

- (HLPHelpLocaleController)localeListController
{
  return self->_localeListController;
}

- (void)setLocaleListController:(id)a3
{
  objc_storeStrong((id *)&self->_localeListController, a3);
}

- (HLPHelpBookController)helpBookController
{
  return self->_helpBookController;
}

- (void)setHelpBookController:(id)a3
{
  objc_storeStrong((id *)&self->_helpBookController, a3);
}

- (void)setReachabilityManager:(id)a3
{
  objc_storeStrong((id *)&self->_reachabilityManager, a3);
}

- (void)setLoadingView:(id)a3
{
  objc_storeStrong((id *)&self->_loadingView, a3);
}

- (HLPHelpTableOfContentViewController)tableOfContentViewController
{
  return self->_tableOfContentViewController;
}

- (void)setTableOfContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_tableOfContentViewController, a3);
}

- (UIView)fullBookViewSeparator
{
  return self->_fullBookViewSeparator;
}

- (void)setFullBookViewSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_fullBookViewSeparator, a3);
}

- (HLPHelpTopicViewController)topicViewController
{
  return self->_topicViewController;
}

- (void)setTopicViewController:(id)a3
{
  objc_storeStrong((id *)&self->_topicViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicViewController, 0);
  objc_storeStrong((id *)&self->_fullBookViewSeparator, 0);
  objc_storeStrong((id *)&self->_tableOfContentViewController, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_reachabilityManager, 0);
  objc_storeStrong((id *)&self->_helpBookController, 0);
  objc_storeStrong((id *)&self->_localeListController, 0);
  objc_storeStrong((id *)&self->_helpBookBasePath, 0);
  objc_storeStrong((id *)&self->_helpBookURL, 0);
  objc_storeStrong((id *)&self->_localHelpBookNameIDMap, 0);
  objc_storeStrong((id *)&self->_selectedHelpTopicName, 0);
  objc_storeStrong((id *)&self->_selectedHelpTopicID, 0);
  objc_storeStrong((id *)&self->_additionalSupportedLanguages, 0);
  objc_storeStrong((id *)&self->_preferredLanguagesOverride, 0);
  objc_storeStrong((id *)&self->_localHelpBookFileURL, 0);
  objc_storeStrong((id *)&self->_subpath, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_loadingViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_doneBarButtonItem, 0);
  objc_storeStrong((id *)&self->_helpBookVersion, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
