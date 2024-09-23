@implementation SRGuideViewController

- (SRGuideViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SRGuideViewController *v4;
  NSCache *v5;
  NSCache *domainIconCache;
  NSOperationQueue *v7;
  NSOperationQueue *guideImageOperationQueue;
  uint64_t v9;
  NSMutableSet *spawnedGuideImageFetches;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SRGuideViewController;
  v4 = -[SRGuideViewController initWithNibName:bundle:](&v12, "initWithNibName:bundle:", 0, 0);
  if (v4)
  {
    v5 = (NSCache *)objc_alloc_init((Class)NSCache);
    domainIconCache = v4->_domainIconCache;
    v4->_domainIconCache = v5;

    v7 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    guideImageOperationQueue = v4->_guideImageOperationQueue;
    v4->_guideImageOperationQueue = v7;

    -[NSOperationQueue setQualityOfService:](v4->_guideImageOperationQueue, "setQualityOfService:", 25);
    -[NSOperationQueue setMaxConcurrentOperationCount:](v4->_guideImageOperationQueue, "setMaxConcurrentOperationCount:", 2);
    v9 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    spawnedGuideImageFetches = v4->_spawnedGuideImageFetches;
    v4->_spawnedGuideImageFetches = (NSMutableSet *)v9;

    -[SRGuideViewController setDefaultViewInsets:](v4, "setDefaultViewInsets:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  }
  return v4;
}

- (void)didReceiveMemoryWarning
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SRGuideViewController;
  -[SRGuideViewController didReceiveMemoryWarning](&v3, "didReceiveMemoryWarning");
  -[NSCache removeAllObjects](self->_domainIconCache, "removeAllObjects");
}

- (void)setDelegate:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SRGuideViewController;
  -[SRGuideViewController setDelegate:](&v4, "setDelegate:", a3);
  -[SRGuideViewController _prepareSiriEnabledAppList](self, "_prepareSiriEnabledAppList");
}

- (id)_bigButtonViewController
{
  SRBigButtonController *bigButtonController;
  SRBigButtonController *v4;
  SRBigButtonController *v5;
  SRBigButtonController *v6;
  void *v7;
  void *v8;
  SRBigButtonController *v9;
  void *v10;

  bigButtonController = self->_bigButtonController;
  if (!bigButtonController)
  {
    v4 = objc_alloc_init(SRBigButtonController);
    v5 = self->_bigButtonController;
    self->_bigButtonController = v4;

    v6 = self->_bigButtonController;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController _guideSnippet](self, "_guideSnippet"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "appPunchOutButton"));
    -[SRBigButtonController setAceObject:](v6, "setAceObject:", v8);

    v9 = self->_bigButtonController;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController delegate](self, "delegate"));
    -[SRBigButtonController setDelegate:](v9, "setDelegate:", v10);

    bigButtonController = self->_bigButtonController;
  }
  return bigButtonController;
}

- (void)loadView
{
  void *v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)SRGuideViewController;
  -[SRGuideViewController loadView](&v24, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController collectionView](self, "collectionView"));
  objc_msgSend(v3, "setDataSource:", self);
  objc_msgSend(v3, "setDelegate:", self);
  *(_QWORD *)&v5 = objc_opt_class(SRGuideViewCell, v4).n128_u64[0];
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SRGuideViewCell reuseIdentifier](SRGuideViewCell, "reuseIdentifier", v5));
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", v7, v8);

  *(_QWORD *)&v10 = objc_opt_class(SiriUIContentCollectionViewCell, v9).n128_u64[0];
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[SiriUIContentCollectionViewCell reuseIdentifier](SiriUIContentCollectionViewCell, "reuseIdentifier", v10));
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", v12, v13);

  *(_QWORD *)&v15 = objc_opt_class(SiriUISnippetControllerCell, v14).n128_u64[0];
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[SiriUISnippetControllerCell reuseIdentifier](SiriUISnippetControllerCell, "reuseIdentifier", v15));
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", v17, v18);

  *(_QWORD *)&v20 = objc_opt_class(SRGuideViewHeader, v19).n128_u64[0];
  v22 = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[SRGuideViewHeader reuseIdentifier](SRGuideViewHeader, "reuseIdentifier", v20));
  objc_msgSend(v3, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v22, UICollectionElementKindSectionHeader, v23);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController collectionView](self, "collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathsForSelectedItems"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController collectionView](self, "collectionView"));
        objc_msgSend(v12, "deselectItemAtIndexPath:animated:", v11, v3);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v13.receiver = self;
  v13.super_class = (Class)SRGuideViewController;
  -[SRGuideViewController viewWillAppear:](&v13, "viewWillAppear:", v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  unsigned int v6;
  NSObject *v7;
  NSDate *v8;
  NSDate *startViewingTime;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController delegate](self, "delegate"));
  v6 = objc_msgSend(v5, "siriSnippetViewControllerIsVisible:", self);

  if (v6)
  {
    if (self->_showingDetails)
    {
      self->_showingDetails = 0;
    }
    else
    {
      v8 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      startViewingTime = self->_startViewingTime;
      self->_startViewingTime = v8;

    }
  }
  else
  {
    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[SRGuideViewController viewDidAppear:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Not visible, no need to create a new view time", buf, 0xCu);
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)SRGuideViewController;
  -[SRGuideViewController viewDidAppear:](&v10, "viewDidAppear:", v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  unsigned int v6;
  NSObject *v7;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController delegate](self, "delegate"));
  v6 = objc_msgSend(v5, "siriSnippetViewControllerIsVisible:", self);

  if (v6)
  {
    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[SRGuideViewController viewDidDisappear:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Showing details, do nothing", buf, 0xCu);
    }
  }
  else
  {
    self->_showingDetails = 0;
    -[SRGuideViewController _endTrackingGuideShowTimeIfNecessary](self, "_endTrackingGuideShowTimeIfNecessary");
  }
  v8.receiver = self;
  v8.super_class = (Class)SRGuideViewController;
  -[SRGuideViewController viewDidDisappear:](&v8, "viewDidDisappear:", v3);
}

- (double)desiredHeightForWidth:(double)a3
{
  int64_t v4;
  int64_t v5;
  int64_t v6;
  uint64_t v7;
  double v8;
  void *v9;
  double v10;
  uint64_t v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;

  v4 = -[SRGuideViewController _numberOfHelpDomains](self, "_numberOfHelpDomains", a3);
  v5 = -[SRGuideViewController _numberOfIntentEnabledApps](self, "_numberOfIntentEnabledApps");
  v6 = v5;
  if (!v4)
  {
    v8 = 0.0;
    if (!v5)
      goto LABEL_9;
    goto LABEL_7;
  }
  v7 = 0;
  v8 = 0.0;
  do
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController _domainSnippetForHelpDomainAtIndex:](self, "_domainSnippetForHelpDomainAtIndex:", v7));
    -[SRGuideViewController _heightOfRowForDomainSnippet:](self, "_heightOfRowForDomainSnippet:", v9);
    v8 = v8 + v10;

    ++v7;
  }
  while (v4 != v7);
  if (v6)
  {
LABEL_7:
    v11 = 0;
    do
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController _domainSnippetForEnabledIntentSupportedAppAtIndex:](self, "_domainSnippetForEnabledIntentSupportedAppAtIndex:", v11));
      -[SRGuideViewController _heightOfRowForDomainSnippet:](self, "_heightOfRowForDomainSnippet:", v12);
      v8 = v8 + v13;

      ++v11;
    }
    while (v6 != v11);
  }
LABEL_9:
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController _guideSnippet](self, "_guideSnippet"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "appPunchOutButton"));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController _bigButtonViewController](self, "_bigButtonViewController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "view"));
    objc_msgSend(v17, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
    v8 = v8 + v18 + 8.0;

  }
  return v8;
}

- (void)_endTrackingGuideShowTimeIfNecessary
{
  void *v3;
  NSDate *startViewingTime;
  id v5;

  if (self->_startViewingTime)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController delegate](self, "delegate"));
    objc_msgSend(v3, "siriSnippetViewController:didShowGuideStartDate:endDate:", self, self->_startViewingTime, v5);

    startViewingTime = self->_startViewingTime;
    self->_startViewingTime = 0;

  }
}

- (SAGuidanceGuideSnippet)_guideSnippet
{
  SAGuidanceGuideSnippet *guideSnippet;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  SAGuidanceGuideSnippet *v7;
  SAGuidanceGuideSnippet *v8;
  SAGuidanceGuideSnippet *v9;
  SAGuidanceGuideSnippet *v10;

  guideSnippet = self->_guideSnippet;
  if (!guideSnippet)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController snippet](self, "snippet"));
    objc_opt_class(SAGuidanceGuideSnippet, v5);
    if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
    {
      v7 = v4;
      v8 = self->_guideSnippet;
      self->_guideSnippet = v7;
    }
    else
    {
      v8 = (SAGuidanceGuideSnippet *)objc_claimAutoreleasedReturnValue(+[AFUIGuideCacheManager sharedManager](AFUIGuideCacheManager, "sharedManager"));
      v9 = (SAGuidanceGuideSnippet *)objc_claimAutoreleasedReturnValue(-[SAGuidanceGuideSnippet cachedGuideSnippet](v8, "cachedGuideSnippet"));
      v10 = self->_guideSnippet;
      self->_guideSnippet = v9;

    }
    guideSnippet = self->_guideSnippet;
  }
  return guideSnippet;
}

- (Class)transparentHeaderViewClass
{
  uint64_t v2;
  void *v3;

  if (-[SRGuideViewController _hasTitle](self, "_hasTitle"))
    objc_opt_class(SRGuideViewHeader, v2);
  else
    v3 = 0;
  return (Class)v3;
}

- (void)configureReusableTransparentHeaderView:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRGuideViewController _guideSnippet](self, "_guideSnippet"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "headerText"));
  objc_msgSend(v4, "setTitle:", v5);

}

- (double)desiredHeightForTransparentHeaderView
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController delegate](self, "delegate"));
  objc_msgSend(v3, "siriViewControllerExpectedWidth:", self);
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController _guideSnippet](self, "_guideSnippet"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "headerText"));
  +[SRGuideViewHeader sizeThatFits:text:](SRGuideViewHeader, "sizeThatFits:text:", v7, v5, 1.79769313e308);
  v9 = v8;

  return v9;
}

- (BOOL)wantsToManageBackgroundColor
{
  return 1;
}

- (BOOL)usePlatterStyle
{
  return 0;
}

- (int64_t)_pinAnimationType
{
  return -[SRGuideViewController _hasTitle](self, "_hasTitle");
}

- (int64_t)_numberOfHelpDomains
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController _guideSnippet](self, "_guideSnippet"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "domainSnippets"));
  v4 = objc_msgSend(v3, "count");

  return (int64_t)v4;
}

- (int64_t)_numberOfIntentSupportedApps
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController _guideSnippet](self, "_guideSnippet"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "intentEnabledAppSnippets"));
  v4 = objc_msgSend(v3, "count");

  return (int64_t)v4;
}

- (int64_t)_numberOfIntentEnabledApps
{
  return (int64_t)-[NSMutableArray count](self->_enabledIntentSupportedAppSnippets, "count");
}

- (id)_domainSnippetForHelpDomainAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController _guideSnippet](self, "_guideSnippet"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domainSnippets"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", a3));

  return v6;
}

- (id)_domainSnippetForEnabledIntentSupportedAppAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndexedSubscript:](self->_enabledIntentSupportedAppSnippets, "objectAtIndexedSubscript:", a3);
}

- (id)_domainSnippetForIndexPath:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  v6 = objc_msgSend(v4, "item");

  if (v5)
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController _domainSnippetForEnabledIntentSupportedAppAtIndex:](self, "_domainSnippetForEnabledIntentSupportedAppAtIndex:", v6));
  else
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController _domainSnippetForHelpDomainAtIndex:](self, "_domainSnippetForHelpDomainAtIndex:", v6));
  return v7;
}

- (double)_heightOfRowForDomainSnippet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domainDisplayName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tagPhrase"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController delegate](self, "delegate"));
  objc_msgSend(v7, "siriViewControllerExpectedWidth:", self);
  +[SRGuideViewCell heightOfCellWithName:tagPhrase:width:](SRGuideViewCell, "heightOfCellWithName:tagPhrase:width:", v5, v6);
  v9 = v8;

  return v9;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 3;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  void *v8;
  void *v9;
  int64_t v10;
  NSObject *v11;

  v6 = a3;
  switch(a4)
  {
    case 2:
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController _guideSnippet](self, "_guideSnippet"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "appPunchOutButton"));
      v10 = v9 != 0;

      break;
    case 1:
      v7 = -[SRGuideViewController _numberOfIntentEnabledApps](self, "_numberOfIntentEnabledApps");
      goto LABEL_7;
    case 0:
      v7 = -[SRGuideViewController _numberOfHelpDomains](self, "_numberOfHelpDomains");
LABEL_7:
      v10 = v7;
      break;
    default:
      v11 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
        sub_10009DDD0(a4, v11);
      v10 = 0;
      break;
  }

  return v10;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableSet *spawnedGuideImageFetches;
  void *v16;
  NSOperationQueue *guideImageOperationQueue;
  id v18;
  NSMutableSet *v19;
  void *v20;
  void *v21;
  void *v22;
  char *v23;
  void *v24;
  char *v25;
  void *v26;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v6, "section");
  if ((unint64_t)v8 > 1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SiriUISnippetControllerCell reuseIdentifier](SiriUISnippetControllerCell, "reuseIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v10, v6));

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController _bigButtonViewController](self, "_bigButtonViewController"));
    objc_msgSend(v11, "setSnippetViewController:", v24);

    objc_msgSend(v11, "setTopPadding:", 8.0);
  }
  else
  {
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SRGuideViewCell reuseIdentifier](SRGuideViewCell, "reuseIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v10, v6));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController _domainSnippetForIndexPath:](self, "_domainSnippetForIndexPath:", v6));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "aceId"));
    objc_msgSend(v11, "setAceId:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSCache objectForKey:](self->_domainIconCache, "objectForKey:", v13));
    if (!v14)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController _fallbackImage](self, "_fallbackImage"));
      spawnedGuideImageFetches = self->_spawnedGuideImageFetches;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "aceId"));
      LOBYTE(spawnedGuideImageFetches) = -[NSMutableSet containsObject:](spawnedGuideImageFetches, "containsObject:", v16);

      if ((spawnedGuideImageFetches & 1) == 0)
      {
        guideImageOperationQueue = self->_guideImageOperationQueue;
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_10001A314;
        v28[3] = &unk_100122C68;
        v28[4] = self;
        v18 = v12;
        v29 = v18;
        v30 = v13;
        v31 = v11;
        -[NSOperationQueue addOperationWithBlock:](guideImageOperationQueue, "addOperationWithBlock:", v28);
        v19 = self->_spawnedGuideImageFetches;
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "aceId"));
        -[NSMutableSet addObject:](v19, "addObject:", v20);

      }
    }
    objc_msgSend(v11, "setIconImage:", v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "domainDisplayName"));
    objc_msgSend(v11, "setName:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tagPhrase"));
    objc_msgSend(v11, "setTagPhrase:", v22);

    if (v9)
    {
      v23 = -[SRGuideViewController _numberOfIntentEnabledApps](self, "_numberOfIntentEnabledApps");
      if (v23 == (char *)objc_msgSend(v6, "item") + 1)
        objc_msgSend(v11, "setKeylineType:", 0);
    }
    else
    {
      v25 = -[SRGuideViewController _numberOfHelpDomains](self, "_numberOfHelpDomains");
      if (v25 == (char *)objc_msgSend(v6, "item") + 1)
      {
        objc_msgSend(v11, "setKeylineType:", 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor siriui_lightKeylineColor](UIColor, "siriui_lightKeylineColor"));
        objc_msgSend(v11, "setKeylineCustomBackgroundColor:", v26);

      }
    }

  }
  return v11;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a5;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SRGuideViewHeader reuseIdentifier](SRGuideViewHeader, "reuseIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", UICollectionElementKindSectionHeader, v8, v6));

  return v9;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 1;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  objc_msgSend(a3, "deselectItemAtIndexPath:animated:", v6, 1);
  v7 = objc_msgSend(v6, "section");
  if ((unint64_t)v7 <= 1)
  {
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_enabledIntentSupportedAppSnippets, "objectAtIndexedSubscript:", objc_msgSend(v6, "item")));
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController _guideSnippet](self, "_guideSnippet"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domainSnippets"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "item")));

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController delegate](self, "delegate"));
    v13 = v8;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
    objc_msgSend(v11, "siriSnippetViewController:pushSirilandSnippets:", self, v12);

    self->_showingDetails = 1;
  }

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  v6 = a5;
  v7 = objc_msgSend(v6, "section");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController delegate](self, "delegate"));
  objc_msgSend(v8, "siriViewControllerExpectedWidth:", self);
  v10 = v9;

  if (v7 == (id)2)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController _bigButtonViewController](self, "_bigButtonViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
    objc_msgSend(v12, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
    v14 = v13 + 8.0;

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController _domainSnippetForIndexPath:](self, "_domainSnippetForIndexPath:", v6));
    -[SRGuideViewController _heightOfRowForDomainSnippet:](self, "_heightOfRowForDomainSnippet:", v11);
    v14 = v15;
  }

  v16 = v10;
  v17 = v14;
  result.height = v17;
  result.width = v16;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  double width;
  double height;
  CGSize result;

  width = CGSizeZero.width;
  height = CGSizeZero.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)_iconImageForGuideDomainSnippet:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  CGImage *v21;
  uint64_t v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iconDisplayIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iconResourceName"));
  if (v5 && objc_msgSend(v4, "isAppIcon"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v8, "scale");
    v9 = (id)objc_claimAutoreleasedReturnValue(+[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v5, 1));

    if (v9)
      goto LABEL_16;
  }
  else
  {
    v9 = 0;
  }
  if (v7)
  {
    *(_QWORD *)&v10 = objc_opt_class(self, v6).n128_u64[0];
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v11, v10));
    v9 = (id)objc_claimAutoreleasedReturnValue(+[UIImage _deviceSpecificImageNamed:inBundle:](UIImage, "_deviceSpecificImageNamed:inBundle:", v7, v12));
    if (objc_msgSend(v4, "iconNeedsProcessing"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v13, "scale");
      v15 = v14;

      if (v15 == 2.0)
      {
        v16 = 16;
      }
      else
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
        objc_msgSend(v17, "scale");
        v19 = v18;

        v16 = v19 == 3.0 ? 33 : 3;
      }
      v9 = objc_retainAutorelease(v9);
      v20 = LICreateIconForImage(objc_msgSend(v9, "CGImage"), v16, 4);
      if (v20)
      {
        v21 = (CGImage *)v20;
        v22 = objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", v20));

        CGImageRelease(v21);
        v9 = (id)v22;
      }
    }

  }
LABEL_16:
  if (!v9)
    v9 = (id)objc_claimAutoreleasedReturnValue(-[SRGuideViewController _fallbackImage](self, "_fallbackImage"));

  return v9;
}

- (id)_fallbackImage
{
  UIImage *fallbackImage;
  double v4;
  uint64_t v5;
  void *v6;
  UIImage *v7;
  UIImage *v8;

  fallbackImage = self->_fallbackImage;
  if (!fallbackImage)
  {
    *(_QWORD *)&v4 = objc_opt_class(self, a2).n128_u64[0];
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v5, v4));
    v7 = (UIImage *)objc_claimAutoreleasedReturnValue(+[UIImage _deviceSpecificImageNamed:inBundle:](UIImage, "_deviceSpecificImageNamed:inBundle:", CFSTR("Siri"), v6));
    v8 = self->_fallbackImage;
    self->_fallbackImage = v7;

    fallbackImage = self->_fallbackImage;
  }
  return fallbackImage;
}

- (BOOL)_hasTitle
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController _guideSnippet](self, "_guideSnippet"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "headerText"));
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (void)_prepareSiriEnabledAppList
{
  void *v3;
  NSSet *v4;
  NSSet *siriEnabledAppList;
  NSMutableArray *v6;
  NSMutableArray *enabledIntentSupportedAppSnippets;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  NSSet *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController delegate](self, "delegate"));
  v4 = (NSSet *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "siriEnabledAppListForSiriViewController:", self));
  siriEnabledAppList = self->_siriEnabledAppList;
  self->_siriEnabledAppList = v4;

  v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  enabledIntentSupportedAppSnippets = self->_enabledIntentSupportedAppSnippets;
  self->_enabledIntentSupportedAppSnippets = v6;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController _guideSnippet](self, "_guideSnippet", 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "intentEnabledAppSnippets"));

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v14, "performIntentEnabledAppAuthorizationCheck"))
        {
          v15 = self->_siriEnabledAppList;
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "iconDisplayIdentifier"));
          LODWORD(v15) = -[NSSet containsObject:](v15, "containsObject:", v16);

          if (!(_DWORD)v15)
            continue;
        }
        -[NSMutableArray addObject:](self->_enabledIntentSupportedAppSnippets, "addObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

}

- (void)setGuideSnippet:(id)a3
{
  objc_storeStrong((id *)&self->_guideSnippet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guideSnippet, 0);
  objc_storeStrong((id *)&self->_enabledIntentSupportedAppSnippets, 0);
  objc_storeStrong((id *)&self->_fallbackImage, 0);
  objc_storeStrong((id *)&self->_spawnedGuideImageFetches, 0);
  objc_storeStrong((id *)&self->_guideImageOperationQueue, 0);
  objc_storeStrong((id *)&self->_bigButtonController, 0);
  objc_storeStrong((id *)&self->_siriEnabledAppList, 0);
  objc_storeStrong((id *)&self->_startViewingTime, 0);
  objc_storeStrong((id *)&self->_domainIconCache, 0);
}

@end
