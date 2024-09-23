@implementation DDParsecServiceCollectionViewController

+ (id)_remoteViewControllerInterface
{
  return (id)_ddui_parsec_xpcInterface(0);
}

+ (id)_exportedInterface
{
  return (id)_ddui_parsec_xpcInterface(1);
}

- (void)startQueryWithString:(id)a3 range:(_NSRange)a4
{
  BOOL remoteTextQuery;
  id v5;
  DDParsecServiceCollectionViewController *v6;
  void **v7;
  int v8;
  int v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16[2];
  _NSRange v17;
  BOOL v18;
  id v19;
  char v20;
  id v21;
  char v22;
  id v23;
  id v24;
  id v25;
  id v26;
  BOOL useNetwork;
  id from;
  id location[2];
  DDParsecServiceCollectionViewController *v30;
  _NSRange v31;

  v31 = a4;
  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_initWeak(&from, v30);
  useNetwork = 0;
  useNetwork = v30->_useNetwork;
  v26 = -[DDParsecServiceCollectionViewController _hostApplicationBundleIdentifier](v30, "_hostApplicationBundleIdentifier");
  v25 = -[DDParsecServiceCollectionViewController queryId](v30, "queryId");
  remoteTextQuery = v30->_remoteTextQuery;
  v22 = 0;
  v20 = 0;
  if (remoteTextQuery)
  {
    v23 = objc_loadWeakRetained(&from);
    v22 = 1;
    v21 = objc_msgSend(v23, "_remoteViewControllerProxy");
    v20 = 1;
    v5 = v21;
  }
  else
  {
    v5 = 0;
  }
  v24 = v5;
  if ((v20 & 1) != 0)

  if ((v22 & 1) != 0)
  v19 = v30->_lookupQuery;
  v6 = v30;
  v7 = _NSConcreteStackBlock;
  v8 = -1073741824;
  v9 = 0;
  v10 = sub_10000B864;
  v11 = &unk_100020920;
  v12 = location[0];
  objc_copyWeak(v16, &from);
  v13 = v19;
  v18 = useNetwork;
  v14 = v26;
  v16[1] = v25;
  v17 = v31;
  v15 = v24;
  -[DDParsecServiceCollectionViewController setQuery:](v6, "setQuery:", &v7);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v13, 0);
  objc_destroyWeak(v16);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v26, 0);
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0);
}

- (void)startQueryWithQuery:(id)a3
{
  DDParsecServiceCollectionViewController *v3;
  void **v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  BOOL v10;
  BOOL useNetwork;
  id v12;
  id location[2];
  DDParsecServiceCollectionViewController *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_initWeak(&v12, v14);
  useNetwork = 0;
  useNetwork = v14->_useNetwork;
  v3 = v14;
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_10000BBBC;
  v8 = &unk_100020948;
  objc_copyWeak(&v9, &v12);
  v10 = useNetwork;
  -[DDParsecServiceCollectionViewController setQuery:](v3, "setQuery:", &v4);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v12);
  objc_storeStrong(location, 0);
}

- (void)showClientQueryResults:(id)a3 error:(id)a4
{
  id v5;
  id location[2];
  DDParsecServiceCollectionViewController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  -[DDParsecServiceCollectionViewController addSections:error:](v7, "addSections:error:", location[0], v5);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)startQueryWithResult:(id)a3 context:(id)a4
{
  BOOL remoteTextQuery;
  id v5;
  DDParsecServiceCollectionViewController *v6;
  void **v8;
  int v9;
  int v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  DDParsecServiceCollectionViewController *v14;
  id v15;
  id v16;
  id v17;
  id v18[2];
  BOOL v19;
  char v20;
  id v21;
  char v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  BOOL useNetwork;
  id from;
  id v30;
  id location[2];
  DDParsecServiceCollectionViewController *v32;

  v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v30 = 0;
  objc_storeStrong(&v30, a4);
  objc_initWeak(&from, v32);
  useNetwork = 0;
  useNetwork = v32->_useNetwork;
  v27 = -[DDParsecServiceCollectionViewController _hostApplicationBundleIdentifier](v32, "_hostApplicationBundleIdentifier");
  v26 = -[DDParsecServiceCollectionViewController queryId](v32, "queryId");
  v25 = v32->_lookupQuery;
  remoteTextQuery = v32->_remoteTextQuery;
  v22 = 0;
  v20 = 0;
  if (remoteTextQuery)
  {
    v23 = objc_loadWeakRetained(&from);
    v22 = 1;
    v21 = objc_msgSend(v23, "_remoteViewControllerProxy");
    v20 = 1;
    v5 = v21;
  }
  else
  {
    v5 = 0;
  }
  v24 = v5;
  if ((v20 & 1) != 0)

  if ((v22 & 1) != 0)
  v6 = v32;
  v8 = _NSConcreteStackBlock;
  v9 = -1073741824;
  v10 = 0;
  v11 = sub_10000C034;
  v12 = &unk_100020970;
  v13 = location[0];
  objc_copyWeak(v18, &from);
  v14 = v32;
  v15 = v25;
  v19 = useNetwork;
  v16 = v27;
  v18[1] = v26;
  v17 = v24;
  -[DDParsecServiceCollectionViewController setQuery:](v6, "setQuery:", &v8);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong((id *)&v14, 0);
  objc_destroyWeak(v18);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v27, 0);
  objc_destroyWeak(&from);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
}

- (void)setQuery:(id)a3
{
  id location[2];
  DDParsecServiceCollectionViewController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v4->_fteMode)
  {
    -[DDParsecServiceCollectionViewController setQueryBlock:](v4, "setQueryBlock:", location[0]);
  }
  else if (location[0])
  {
    (*((void (**)(void))location[0] + 2))();
  }
  objc_storeStrong(location, 0);
}

- (DDParsecServiceCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  DDParsecServiceCollectionViewController *v4;
  DDParsecServiceCollectionViewController *v6;
  DDParsecServiceCollectionViewController *v8;
  objc_super v9;
  id v10;
  id location[2];
  DDParsecServiceCollectionViewController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v4 = v12;
  v12 = 0;
  v9.receiver = v4;
  v9.super_class = (Class)DDParsecServiceCollectionViewController;
  v8 = -[DDParsecServiceCollectionViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", location[0], v10);
  v12 = v8;
  objc_storeStrong((id *)&v12, v8);
  if (v8)
    -[DDParsecServiceCollectionViewController setDelegate:](v12, "setDelegate:", v12);
  v6 = v12;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v12, 0);
  return v6;
}

- (void)prepareWithQueryObject:(id)a3 previewMode:(BOOL)a4 sheetMode:(BOOL)a5 popoverMode:(BOOL)a6 viewStyle:(int64_t)a7 scale:(double)a8 dictionaryMode:(BOOL)a9 remoteTextQuery:(BOOL)a10
{
  DDLookupQuery *v10;
  DDLookupQuery *lookupQuery;
  DDLookupQuery *v12;
  DDLookupQuery *v13;
  id v14;
  NSString *v15;
  NSString *fte_ack_key;
  unsigned __int8 v17;
  DDParsecFirstTimeViewController *v18;
  DDParsecFirstTimeViewController *firstTimeViewController;
  id v20;
  DDParsecFirstTimeViewController *v21;
  id v22;
  DDParsecServiceCollectionViewController *v23;
  NSArray *v24;
  unsigned __int8 v25;
  char v26;
  id v27;
  id WeakRetained;
  char v35;
  NSUserDefaults *v36;
  id location[2];
  DDParsecServiceCollectionViewController *v38;
  DDParsecFirstTimeViewController *v39;

  v38 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v38->_dictionaryMode = a9;
  v38->_scale = a8;
  v38->_style = a7;
  v38->_popoverMode = a6;
  v38->_sheetMode = a5;
  v38->_previewMode = a4;
  v38->_remoteTextQuery = a10;
  v38->_hasExternaDataSource = location[0] != 0;
  WeakRetained = objc_loadWeakRetained(&qword_100028740);
  objc_msgSend(WeakRetained, "doneButtonPressed:punchout:", 0, 0);

  objc_storeWeak(&qword_100028740, v38);
  if (v38->_dictionaryMode)
  {
    v38->_useNetwork = 0;
    v10 = +[DDLookupQuery queryWithoutNetwork](DDLookupQuery, "queryWithoutNetwork");
    lookupQuery = v38->_lookupQuery;
    v38->_lookupQuery = v10;

  }
  else
  {
    v12 = +[DDLookupQuery queryWithQuery:](DDLookupQuery, "queryWithQuery:", location[0]);
    v13 = v38->_lookupQuery;
    v38->_lookupQuery = v12;

    if (location[0])
    {
      v14 = objc_msgSend(location[0], "queryID");
      v38->_queryId = (unint64_t)v14;
      v27 = objc_msgSend(location[0], "userAgent");
      v15 = (NSString *)objc_msgSend(v27, "stringByAppendingString:", CFSTR(".fte.acknowledged"));
      fte_ack_key = v38->_fte_ack_key;
      v38->_fte_ack_key = v15;

    }
    else
    {
      qword_100028748 += arc4random_uniform(0x10u) + 1;
      v38->_queryId = qword_100028748;
      objc_storeStrong((id *)&v38->_fte_ack_key, CFSTR("com.apple.lookup.fte.acknowledged"));
    }
    v17 = -[DDLookupQuery parsecEnabled](v38->_lookupQuery, "parsecEnabled");
    v38->_useNetwork = v17 & 1;
  }
  v35 = 0;
  v26 = 0;
  if (v38->_useNetwork)
  {
    v25 = 0;
    if (v38->_fte_ack_key)
    {
      v36 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
      v35 = 1;
      v25 = -[NSUserDefaults BOOLForKey:](v36, "BOOLForKey:", v38->_fte_ack_key);
    }
    v26 = v25 ^ 1;
  }
  if ((v35 & 1) != 0)

  if ((v26 & 1) != 0)
  {
    v21 = [DDParsecFirstTimeViewController alloc];
    v22 = -[DDLookupQuery bag](v38->_lookupQuery, "bag");
    v18 = -[DDParsecFirstTimeViewController initWithNibName:bundle:bag:sceneAwareVariant:](v21, "initWithNibName:bundle:bag:sceneAwareVariant:", 0);
    firstTimeViewController = v38->_firstTimeViewController;
    v38->_firstTimeViewController = v18;

    -[DDParsecFirstTimeViewController setDelegate:](v38->_firstTimeViewController, "setDelegate:", v38);
    -[DDParsecServiceCollectionViewController setNavigationBarHidden:animated:](v38, "setNavigationBarHidden:animated:", 1, 0);
    v23 = v38;
    v39 = v38->_firstTimeViewController;
    v24 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v39, 1);
    -[DDParsecServiceCollectionViewController setViewControllers:](v23, "setViewControllers:");

    v38->_fteMode = 1;
  }
  else
  {
    -[DDParsecServiceCollectionViewController showContent:](v38, "showContent:", 0);
  }
  -[DDParsecServiceCollectionViewController updateVisualMode:](v38, "updateVisualMode:", 0);
  v20 = -[DDParsecServiceCollectionViewController _remoteViewControllerProxy](v38, "_remoteViewControllerProxy");
  objc_msgSend(v20, "remoteVCIsReady");

  objc_storeStrong(location, 0);
}

- (BOOL)presentsWithMargins
{
  BOOL v3;

  v3 = 1;
  if (!self->_previewMode)
  {
    v3 = 1;
    if (!self->_sheetMode)
      return self->_popoverMode;
  }
  return v3;
}

- (void)_willAppearInRemoteViewController
{
  id v2;

  v2 = -[DDParsecServiceCollectionViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  objc_msgSend(v2, "showingFTE:", self->_fteMode);

}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  DDParsecServiceCollectionViewController *v4;

  v4 = self;
  v3 = a2;
  -[DDParsecServiceCollectionViewController setSearchVisible:](self, "setSearchVisible:", 0);
  v2.receiver = v4;
  v2.super_class = (Class)DDParsecServiceCollectionViewController;
  -[DDParsecServiceCollectionViewController dealloc](&v2, "dealloc");
}

- (void)addSections:(id)a3 error:(id)a4
{
  dispatch_queue_t queue;
  void **v6;
  int v7;
  int v8;
  id (*v9)(id *);
  void *v10;
  id v11;
  id v12;
  DDParsecServiceCollectionViewController *v13;
  id v14;
  id location[2];
  DDParsecServiceCollectionViewController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = &_dispatch_main_q;
  v6 = _NSConcreteStackBlock;
  v7 = -1073741824;
  v8 = 0;
  v9 = sub_10000CC98;
  v10 = &unk_100020650;
  v11 = v14;
  v12 = location[0];
  v13 = v16;
  dispatch_async(queue, &v6);

  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)setOriginalTitle:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  BOOL v6;
  id location[2];
  DDParsecServiceCollectionViewController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (objc_msgSend(location[0], "length"))
    objc_storeStrong((id *)&v8->_originalTitle, location[0]);
  v4 = -[DDParsecServiceCollectionViewController topViewController](v8, "topViewController", location[0]);
  objc_msgSend(v4, "setTitle:", v3);

  v5 = -[SearchUIResultsViewController title](v8->_resultsViewController, "title");
  v6 = objc_msgSend(v5, "length") != 0;

  if (!v6)
    -[SearchUIResultsViewController setTitle:](v8->_resultsViewController, "setTitle:", v8->_originalTitle);
  -[DDParsecFirstTimeViewController setTitle:](v8->_firstTimeViewController, "setTitle:", &stru_100020FA8);
  objc_storeStrong(location, 0);
}

- (void)setDDViewScale:(double)a3
{
  if (a3 > 0.0 && self->_scale != a3)
    self->_scale = a3;
}

- (void)setSearchVisible:(BOOL)a3
{
  if (self->_searchViewVisible != a3)
    self->_searchViewVisible = a3;
}

- (void)appDidEnterBackground
{
  id v2;
  id v3;
  NSNotificationCenter *v4;
  NSNotificationCenter *v5;
  id v6[2];
  DDParsecServiceCollectionViewController *v7;

  v7 = self;
  v6[1] = (id)a2;
  if (self->_searchViewVisible && v7->_useNetwork)
  {
    v6[0] = objc_msgSend(objc_alloc((Class)SFSearchViewDisappearFeedback), "initWithEvent:", 23);
    v2 = -[DDParsecServiceCollectionViewController queryId](v7, "queryId");
    objc_msgSend(v6[0], "setQueryId:", v2);
    v3 = -[DDLookupQuery feedbackListener](v7->_lookupQuery, "feedbackListener");
    objc_msgSend(v3, "searchViewDidDisappear:", v6[0]);

    v4 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter postNotificationName:object:](v4, "postNotificationName:object:", UIApplicationWillResignActiveNotification, UIApp);

    v5 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter postNotificationName:object:](v5, "postNotificationName:object:", UIApplicationDidEnterBackgroundNotification, UIApp);

    objc_storeStrong(v6, 0);
  }
}

- (void)appWillEnterForeground
{
  id v2;
  NSNotificationCenter *v3;
  NSNotificationCenter *v4;
  NSNumber *v5;
  id v6;
  unsigned __int8 v7;
  id v8;
  unsigned int v9;
  id v10;
  id v11[2];
  DDParsecServiceCollectionViewController *v12;

  v12 = self;
  v11[1] = (id)a2;
  if (self->_searchViewVisible && v12->_useNetwork)
  {
    v11[0] = objc_msgSend(objc_alloc((Class)SFSearchViewAppearFeedback), "initWithEvent:", 26);
    objc_msgSend(v11[0], "setQueryId:", -[DDParsecServiceCollectionViewController queryId](v12, "queryId"));
    v2 = -[DDLookupQuery feedbackListener](v12->_lookupQuery, "feedbackListener");
    objc_msgSend(v2, "searchViewDidAppear:", v11[0]);

    v3 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter postNotificationName:object:](v3, "postNotificationName:object:", UIApplicationWillEnterForegroundNotification, UIApp);

    v4 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter postNotificationName:object:](v4, "postNotificationName:object:", UIApplicationDidBecomeActiveNotification, UIApp);

    v10 = 0;
    v9 = -[DDParsecServiceCollectionViewController _hostProcessIdentifier](v12, "_hostProcessIdentifier");
    v6 = +[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController");
    v5 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (int)v9);
    v8 = v10;
    v7 = objc_msgSend(v6, "setAttribute:forKey:error:");
    objc_storeStrong(&v10, v8);

    if ((v7 & 1) == 0)
      NSLog(CFSTR("Failed to inherit CoreMedia permissions from %d: %@"), v9, v10);
    objc_storeStrong(&v10, 0);
    objc_storeStrong(v11, 0);
  }
}

- (void)showLoadingSpinner:(BOOL)a3
{
  DDParsecServiceCollectionViewController *v3;
  NSArray *v4;
  id v5;
  BOOL v6;
  SEL v7;
  DDParsecServiceCollectionViewController *v8;
  id v9;

  v8 = self;
  v7 = a2;
  v6 = a3;
  v5 = (id)objc_opt_new(DDParsecLoadingViewController);
  objc_msgSend(v5, "setTitle:", v8->_originalTitle);
  v3 = v8;
  v9 = v5;
  v4 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1);
  -[DDParsecServiceCollectionViewController setViewControllers:animated:](v3, "setViewControllers:animated:");

  objc_storeStrong(&v5, 0);
}

- (void)doneButtonPressed:(id)a3
{
  id location[2];
  DDParsecServiceCollectionViewController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[DDParsecServiceCollectionViewController doneButtonPressed:punchout:](v4, "doneButtonPressed:punchout:", location[0], 0);
  objc_storeStrong(location, 0);
}

- (void)doneButtonPressed:(id)a3 punchout:(BOOL)a4
{
  id v4;
  id v5;
  id v7;
  BOOL v8;
  id location[2];
  DDParsecServiceCollectionViewController *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = a4;
  v10->_doneClicked = 1;
  -[DDParsecServiceCollectionViewController setSearchVisible:](v10, "setSearchVisible:", 0);
  if (v10->_useNetwork)
  {
    v7 = objc_msgSend(objc_alloc((Class)SFSearchViewDisappearFeedback), "initWithEvent:", 16);
    v4 = -[DDParsecServiceCollectionViewController queryId](v10, "queryId");
    objc_msgSend(v7, "setQueryId:", v4);
    v5 = -[DDLookupQuery feedbackListener](v10->_lookupQuery, "feedbackListener");
    objc_msgSend(v5, "searchViewDidDisappear:", v7);

    objc_storeStrong(&v7, 0);
  }
  -[DDParsecServiceCollectionViewController interactionEndedWithPunchout:](v10, "interactionEndedWithPunchout:", v8);
  objc_storeStrong(location, 0);
}

- (void)interactionEndedWithPunchout:(BOOL)a3
{
  id v3;
  BOOL v4;

  v4 = a3;
  v3 = -[DDParsecServiceCollectionViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  objc_msgSend(v3, "interactionEndedWithPunchout:", v4);

}

- (void)setSections:(id)a3
{
  id location[2];
  DDParsecServiceCollectionViewController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4->_sectionsIsSet = 1;
  objc_storeStrong((id *)&v4->_sections, location[0]);
  -[DDParsecServiceCollectionViewController showContent:](v4, "showContent:", 0);
  objc_storeStrong(location, 0);
}

- (void)showContent:(BOOL)a3
{
  SearchUIResultsViewController *v3;
  SearchUIResultsViewController *resultsViewController;
  BOOL v5;
  uint64_t v6;
  id v7;
  unsigned __int8 v8;
  NSArray *v9;
  id v10;
  BOOL v11;
  NSArray *v12;
  BOOL v13;
  void **v14;
  int v15;
  int v16;
  void (*v17)(uint64_t);
  void *v18;
  DDParsecServiceCollectionViewController *v19;
  char v20;
  id v21;
  char v22;
  id v23;
  char v24;
  id v25;
  char v26;
  id v27;
  BOOL v28;
  SEL v29;
  DDParsecServiceCollectionViewController *v30;
  SearchUIResultsViewController *v31;

  v30 = self;
  v29 = a2;
  v28 = a3;
  if (!self->_firstTimeViewController && !v30->_loadingError)
  {
    if (v30->_sectionsIsSet)
    {
      v12 = -[DDParsecServiceCollectionViewController sections](v30, "sections");
      v13 = -[NSArray count](v12, "count") != 0;

      if (v13)
      {
        if (!v30->_resultsViewController)
        {
          v3 = objc_opt_new(SearchUIResultsViewController);
          resultsViewController = v30->_resultsViewController;
          v30->_resultsViewController = v3;

          -[SearchUIResultsViewController setFeedbackListener:](v30->_resultsViewController, "setFeedbackListener:", v30);
          -[SearchUIResultsViewController setShouldUseInsetRoundedSections:](v30->_resultsViewController, "setShouldUseInsetRoundedSections:", (_os_feature_enabled_impl("SpotlightUI", "SnippetModernization") ^ 1) & 1);
          -[SearchUIResultsViewController setShouldUseStandardSectionInsets:](v30->_resultsViewController, "setShouldUseStandardSectionInsets:", 1);
          v10 = -[SearchUIResultsViewController title](v30->_resultsViewController, "title");
          v11 = objc_msgSend(v10, "length") != 0;

          if (!v11)
            -[SearchUIResultsViewController setTitle:](v30->_resultsViewController, "setTitle:", v30->_originalTitle);
          -[DDParsecServiceCollectionViewController updateVisualModeWithController:animated:](v30, "updateVisualModeWithController:animated:", v30->_resultsViewController, 0);
          v31 = v30->_resultsViewController;
          v9 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v31, 1);
          -[DDParsecServiceCollectionViewController setViewControllers:](v30, "setViewControllers:");

        }
        if (!v30->_hasExternaDataSource)
        {
          v5 = (id)-[NSArray count](v30->_sections, "count") != (id)2;
          v26 = 0;
          v24 = 0;
          v22 = 0;
          v20 = 0;
          v8 = 0;
          if (!v5)
          {
            v27 = -[NSArray firstObject](v30->_sections, "firstObject");
            v26 = 1;
            v25 = objc_msgSend(v27, "bundleIdentifier");
            v24 = 1;
            v8 = 0;
            if ((objc_msgSend(v25, "isEqualToString:", CFSTR("com.apple.lookup.dictionary")) & 1) != 0)
            {
              v23 = -[NSArray lastObject](v30->_sections, "lastObject");
              v22 = 1;
              v21 = objc_msgSend(v23, "bundleIdentifier");
              v20 = 1;
              v8 = objc_msgSend(v21, "isEqualToString:", CFSTR("com.apple.lookup.search-through"));
            }
          }
          -[SearchUIResultsViewController setImmediatelyShowCardForSingleResult:](v30->_resultsViewController, "setImmediatelyShowCardForSingleResult:", (v8 ^ 1) & 1);
          if ((v20 & 1) != 0)

          if ((v22 & 1) != 0)
          if ((v24 & 1) != 0)

          if ((v26 & 1) != 0)
        }
        -[SearchUIResultsViewController setQueryString:](v30->_resultsViewController, "setQueryString:", v30->_originalTitle, &selRef_currentCalendar);
        objc_msgSend(*(id *)((char *)&v30->super.super.super.super.isa + *(int *)(v6 + 2944)), "setSections:", v30->_sections);
        v7 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&v30->super.super.super.super.isa
                                                                   + *(int *)(v6 + 2944)), "view"));
        objc_msgSend(v7, "setAlpha:", 0.0);

        v14 = _NSConcreteStackBlock;
        v15 = -1073741824;
        v16 = 0;
        v17 = sub_10000DE5C;
        v18 = &unk_100020998;
        v19 = v30;
        +[SearchUIUtilities performAnimatableChanges:](SearchUIUtilities, "performAnimatableChanges:", &v14);
        objc_storeStrong((id *)&v19, 0);
      }
      else
      {
        -[DDParsecServiceCollectionViewController showError:animated:](v30, "showError:animated:", 0, v28);
      }
    }
    else
    {
      -[DDParsecServiceCollectionViewController showLoadingSpinner:](v30, "showLoadingSpinner:", v28);
    }
  }
}

- (void)showError:(id)a3 animated:(BOOL)a4
{
  BOOL v4;
  uint64_t v5;
  id v6;
  DDParsecServiceCollectionViewController *v7;
  NSArray *v8;
  id v9;
  unsigned __int8 v10;
  NSString *v11;
  NSString *v12;
  UIDevice *v13;
  id v14;
  NSURL *v15;
  unsigned __int8 v16;
  char isKindOfClass;
  char v19;
  id v20;
  os_log_type_t v21;
  id v22;
  char v23;
  id v24;
  char v25;
  id v26;
  id v27;
  int v28;
  char v29;
  id v30;
  char v31;
  id v32;
  char v33;
  id v34;
  BOOL v35;
  id location[2];
  DDParsecServiceCollectionViewController *v37;
  id v38;
  uint8_t v39[16];
  uint8_t v40[24];

  v37 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v35 = a4;
  v37->_loadingError = 1;
  v4 = v37->_firstTimeViewController != 0;
  v33 = 0;
  v31 = 0;
  v29 = 0;
  v19 = 1;
  if (!v4)
  {
    v34 = -[DDParsecServiceCollectionViewController viewControllers](v37, "viewControllers");
    v33 = 1;
    isKindOfClass = 0;
    if (objc_msgSend(v34, "count") == (id)1)
    {
      v32 = -[DDParsecServiceCollectionViewController viewControllers](v37, "viewControllers");
      v31 = 1;
      v30 = objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
      v29 = 1;
      v5 = objc_opt_class(DDParsecNoDataViewController);
      isKindOfClass = objc_opt_isKindOfClass(v30, v5);
    }
    v19 = isKindOfClass;
  }
  if ((v29 & 1) != 0)

  if ((v31 & 1) != 0)
  if ((v33 & 1) != 0)

  if ((v19 & 1) != 0)
  {
    v28 = 1;
  }
  else
  {
    v27 = (id)objc_opt_new(DDParsecNoDataViewController);
    objc_msgSend(v27, "setTitle:", v37->_originalTitle);
    objc_msgSend(v27, "setAltURL:", 0);
    objc_msgSend(v27, "setLookup:", !v37->_hasExternaDataSource);
    v25 = 0;
    v16 = 0;
    if (location[0])
    {
      v16 = 0;
      if (objc_msgSend(location[0], "code") == (id)-1009)
      {
        v26 = objc_msgSend(location[0], "domain");
        v25 = 1;
        v16 = objc_msgSend(v26, "isEqualToString:", NSURLErrorDomain);
      }
    }
    if ((v25 & 1) != 0)

    if ((v16 & 1) != 0)
    {
      v14 = (id)DDLocalizedString(CFSTR("Your %@ is offline"), CFSTR("Text shown when there is no content to show in the Look Up view because of an unreachable network. %@ will be replaced with the device model (iPhone, iPad, etc...)"));
      v13 = +[UIDevice currentDevice](UIDevice, "currentDevice");
      v12 = -[UIDevice localizedModel](v13, "localizedModel");
      v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v12);
      objc_msgSend(v27, "setReason:");

      v15 = +[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=ROOT#AIRPLANE_MODE"));
      objc_msgSend(v27, "setAltURL:");

    }
    else
    {
      if (location[0])
      {
        v23 = 0;
        v10 = 0;
        if (objc_msgSend(location[0], "code") == (id)-1001)
        {
          v24 = objc_msgSend(location[0], "domain");
          v23 = 1;
          v10 = objc_msgSend(v24, "isEqualToString:", NSURLErrorDomain);
        }
        if ((v23 & 1) != 0)

        if ((v10 & 1) != 0)
        {
          v22 = &_os_log_default;
          v21 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR))
          {
            sub_10000AB04((uint64_t)v40, (uint64_t)location[0]);
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v22, v21, "Could no fetch lookup data: %@", v40, 0xCu);
          }
          objc_storeStrong(&v22, 0);
        }
        else
        {
          v20 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_FAULT))
          {
            sub_10000AB04((uint64_t)v39, (uint64_t)location[0]);
            _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)v20, OS_LOG_TYPE_FAULT, "Could no fetch lookup data: %@", v39, 0xCu);
          }
          objc_storeStrong(&v20, 0);
        }
      }
      v9 = (id)DDLocalizedString(CFSTR("No Content Found"), CFSTR("Text shown when there is no content to show in the Look Up view because there is no data to present"));
      objc_msgSend(v27, "setReason:");

    }
    objc_msgSend(v27, "setSearchWebQuery:", v37->_originalTitle);
    -[DDParsecServiceCollectionViewController updateVisualModeWithController:animated:](v37, "updateVisualModeWithController:animated:", v27, v35);
    v6 = -[DDParsecServiceCollectionViewController _remoteViewControllerProxy](v37, "_remoteViewControllerProxy");
    objc_msgSend(v6, "showingErrorView:", 1);

    v7 = v37;
    v38 = v27;
    v8 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v38, 1);
    -[DDParsecServiceCollectionViewController setViewControllers:animated:](v7, "setViewControllers:animated:");

    objc_storeStrong(&v27, 0);
    v28 = 0;
  }
  objc_storeStrong(location, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  NSDate *v3;
  NSDate *lastAppearTime;
  double v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  objc_super v12;
  BOOL v13;
  SEL v14;
  DDParsecServiceCollectionViewController *v15;

  v15 = self;
  v14 = a2;
  v13 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DDParsecServiceCollectionViewController;
  -[DDParsecServiceCollectionViewController viewDidAppear:](&v12, "viewDidAppear:", a3);
  v3 = +[NSDate date](NSDate, "date");
  lastAppearTime = v15->_lastAppearTime;
  v15->_lastAppearTime = v3;

  -[DDParsecServiceCollectionViewController setSearchVisible:](v15, "setSearchVisible:", 1);
  if (v15->_lastDisappearTime
    && (-[NSDate timeIntervalSinceNow](v15->_lastDisappearTime, "timeIntervalSinceNow"), v5 > -0.5))
  {
    -[DDParsecServiceCollectionViewController setPreviewMode:](v15, "setPreviewMode:", 0);
  }
  else if (v15->_useNetwork)
  {
    v11 = 0;
    if (v15->_previewMode)
    {
      v9 = 13;
    }
    else
    {
      v6 = 15;
      if (!v15->_sourceIsHint)
        v6 = 16;
      v9 = v6;
    }
    v11 = v9;
    v10 = objc_msgSend(objc_alloc((Class)SFSearchViewAppearFeedback), "initWithEvent:", v9);
    v7 = -[DDParsecServiceCollectionViewController queryId](v15, "queryId");
    objc_msgSend(v10, "setQueryId:", v7);
    v8 = -[DDLookupQuery feedbackListener](v15->_lookupQuery, "feedbackListener");
    objc_msgSend(v8, "searchViewDidAppear:", v10);

    objc_storeStrong(&v10, 0);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  DDParsecServiceCollectionViewController *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  -[DDParsecServiceCollectionViewController setSearchVisible:](self, "setSearchVisible:", 0);
  v3.receiver = v6;
  v3.super_class = (Class)DDParsecServiceCollectionViewController;
  -[DDParsecServiceCollectionViewController viewWillDisappear:](&v3, "viewWillDisappear:", 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  NSDate *v3;
  NSDate *lastDisappearTime;
  id v5;
  id v6;
  double v7;
  dispatch_time_t v8;
  dispatch_queue_t queue;
  NSObject *log;
  os_log_type_t type;
  id v12;
  void **v13;
  int v14;
  int v15;
  id (*v16)(uint64_t);
  void *v17;
  DDParsecServiceCollectionViewController *v18;
  id v19[2];
  id v20;
  int v21;
  uint8_t v22[7];
  char v23;
  id location;
  id v25;
  objc_super v26;
  BOOL v27;
  SEL v28;
  DDParsecServiceCollectionViewController *v29;

  v29 = self;
  v28 = a2;
  v27 = a3;
  v26.receiver = self;
  v26.super_class = (Class)DDParsecServiceCollectionViewController;
  -[DDParsecServiceCollectionViewController viewDidDisappear:](&v26, "viewDidDisappear:", a3);
  v3 = +[NSDate date](NSDate, "date");
  lastDisappearTime = v29->_lastDisappearTime;
  v29->_lastDisappearTime = v3;

  v25 = 0;
  if (v29->_useNetwork && !v29->_doneClicked)
  {
    v5 = objc_msgSend(objc_alloc((Class)SFSearchViewDisappearFeedback), "initWithEvent:", 15);
    v6 = v25;
    v25 = v5;

    objc_msgSend(v25, "setQueryId:", -[DDParsecServiceCollectionViewController queryId](v29, "queryId"));
  }
  objc_msgSend(UIApp, "backgroundTimeRemaining");
  if (v7 >= 0.5)
  {
    v20 = objc_msgSend(UIApp, "beginBackgroundTaskWithExpirationHandler:");
    v8 = dispatch_time(0, 500000000);
    queue = &_dispatch_main_q;
    v13 = _NSConcreteStackBlock;
    v14 = -1073741824;
    v15 = 0;
    v16 = sub_10000EC0C;
    v17 = &unk_1000209C0;
    v18 = v29;
    v19[0] = v25;
    v19[1] = v20;
    dispatch_after(v8, queue, &v13);

    objc_storeStrong(v19, 0);
    objc_storeStrong((id *)&v18, 0);
    v21 = 0;
  }
  else
  {
    -[DDParsecServiceCollectionViewController setQueryBlock:](v29, "setQueryBlock:", 0);
    if (v25)
    {
      v12 = -[DDLookupQuery feedbackListener](v29->_lookupQuery, "feedbackListener");
      objc_msgSend(v12, "searchViewDidDisappear:", v25);

      location = &_os_log_default;
      v23 = 2;
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
      {
        log = location;
        type = v23;
        sub_100005D3C(v22);
        _os_log_debug_impl((void *)&_mh_execute_header, log, type, "Sending immediate viewDisappearFeedback", v22, 2u);
      }
      objc_storeStrong(&location, 0);
    }
    v21 = 1;
  }
  objc_storeStrong(&v25, 0);
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v4;
  id v6;
  id v7;
  BOOL v8;
  void **v9;
  int v10;
  int v11;
  void (*v12)(uint64_t, char);
  void *v13;
  id v14;
  objc_super v15;
  id v16;
  id location[2];
  DDParsecServiceCollectionViewController *v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v15.receiver = v18;
  v15.super_class = (Class)DDParsecServiceCollectionViewController;
  -[DDParsecServiceCollectionViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v15, "willTransitionToTraitCollection:withTransitionCoordinator:", location[0], v16);
  v6 = objc_msgSend(location[0], "verticalSizeClass");
  v7 = -[DDParsecServiceCollectionViewController traitCollection](v18, "traitCollection");
  v8 = v6 == objc_msgSend(v7, "verticalSizeClass");

  if (!v8)
  {
    v4 = -[DDParsecServiceCollectionViewController _remoteViewControllerProxy](v18, "_remoteViewControllerProxy");
    v9 = _NSConcreteStackBlock;
    v10 = -1073741824;
    v11 = 0;
    v12 = sub_10000EFB4;
    v13 = &unk_100020A10;
    v14 = location[0];
    objc_msgSend(v4, "getStatusBarHidden:", &v9);

    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  uint64_t v6;
  id v11;
  id v12;
  id v13[2];
  id location[2];
  DDParsecServiceCollectionViewController *v15;
  DDParsecFadeAnimator *v16;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13[1] = (id)a4;
  v13[0] = 0;
  objc_storeStrong(v13, a5);
  v12 = 0;
  objc_storeStrong(&v12, a6);
  v11 = v13[0];
  v6 = objc_opt_class(DDParsecFirstTimeViewController);
  if ((objc_opt_isKindOfClass(v11, v6) & 1) != 0 && v15->_sheetMode)
    v16 = objc_opt_new(DDParsecFadeAnimator);
  else
    v16 = 0;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(v13, 0);
  objc_storeStrong(location, 0);
  return v16;
}

- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 1;
}

- (void)setPopoverMode:(BOOL)a3
{
  if (self->_popoverMode != a3)
  {
    self->_popoverMode = a3;
    -[DDParsecServiceCollectionViewController updateVisualMode:](self, "updateVisualMode:", 0);
  }
}

- (void)setPreviewMode:(BOOL)a3
{
  if (self->_previewMode != a3)
  {
    self->_previewMode = a3;
    -[DDParsecServiceCollectionViewController updateVisualMode:](self, "updateVisualMode:", 0);
  }
}

- (void)setSheetMode:(BOOL)a3
{
  if (self->_sheetMode != a3)
  {
    self->_sheetMode = a3;
    -[DDParsecServiceCollectionViewController updateVisualMode:](self, "updateVisualMode:", 0);
  }
}

- (void)updateVisualMode:(BOOL)a3
{
  id v4;

  v4 = -[DDParsecServiceCollectionViewController topViewController](self, "topViewController");
  -[DDParsecServiceCollectionViewController updateVisualModeWithController:animated:](self, "updateVisualModeWithController:animated:");

}

- (void)updateVisualModeWithController:(id)a3 animated:(BOOL)a4
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  UIColor *v17;
  id v18;
  UIBlurEffect *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  BOOL v25;
  id v26;
  void **v28;
  int v29;
  int v30;
  uint64_t (*v31)(uint64_t);
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  id v42;
  char v43;
  id v44;
  id v45;
  BOOL v46;
  id location[2];
  DDParsecServiceCollectionViewController *v48;

  v48 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v46 = a4;
  if (-[DDParsecServiceCollectionViewController showBackgroundEffect](v48, "showBackgroundEffect"))
    -[DDParsecServiceCollectionViewController _setBuiltinTransitionStyle:](v48, "_setBuiltinTransitionStyle:", 1);
  if (location[0] && location[0] == v48->_firstTimeViewController)
    -[DDParsecFirstTimeViewController updateForCurrentTraitCollection](v48->_firstTimeViewController, "updateForCurrentTraitCollection");
  v26 = -[DDParsecServiceCollectionViewController traitCollection](v48, "traitCollection");
  objc_msgSend(v26, "displayScale");
  -[DDParsecServiceCollectionViewController setDDViewScale:](v48, "setDDViewScale:");

  v45 = 0;
  if (!v48->_previewMode && !v48->_popoverMode)
  {
    v4 = objc_alloc((Class)UIBarButtonItem);
    v5 = objc_msgSend(v4, "initWithBarButtonSystemItem:target:action:", 24, v48, "doneButtonPressed:");
    v6 = v45;
    v45 = v5;

    objc_msgSend(v45, "setAccessibilityIdentifier:", CFSTR("DDUIDone"));
  }
  v24 = objc_msgSend(location[0], "navigationItem");
  objc_msgSend(v24, "setRightBarButtonItem:animated:", v45, v46);

  v25 = 0;
  if (v48->_fteMode)
    v25 = v45 == 0;
  -[DDParsecServiceCollectionViewController setNavigationBarHidden:animated:](v48, "setNavigationBarHidden:animated:", v25, 0);
  if (-[DDParsecServiceCollectionViewController showBackgroundEffect](v48, "showBackgroundEffect"))
  {
    v23 = -[DDParsecServiceCollectionViewController view](v48, "view");
    v22 = objc_msgSend(v23, "subviews");
    v44 = objc_msgSend(v22, "firstObject");

    v7 = objc_opt_class(UIVisualEffectView);
    v43 = objc_opt_isKindOfClass(v44, v7) & 1;
    if (v43 || v48->_popoverMode)
    {
      if ((v43 & 1) != 0 && v48->_popoverMode)
        objc_msgSend(v44, "removeFromSuperview");
    }
    else
    {
      v18 = objc_alloc((Class)UIVisualEffectView);
      v19 = +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 9);
      v42 = objc_msgSend(v18, "initWithEffect:");

      v20 = -[DDParsecServiceCollectionViewController view](v48, "view");
      objc_msgSend(v20, "bounds");
      v38 = v8;
      v39 = v9;
      *(_QWORD *)&v40 = v10;
      *((_QWORD *)&v40 + 1) = v11;
      v41 = v40;

      sub_10000F9FC();
      *(double *)&v36 = v12;
      *((double *)&v36 + 1) = v13;
      *(double *)&v37 = v14;
      *((double *)&v37 + 1) = v15;
      v34 = v36;
      v35 = v37;
      objc_msgSend(v42, "setFrame:", v12, v13, v14, v15);
      objc_msgSend(v42, "setAutoresizingMask:", 18);
      v21 = -[DDParsecServiceCollectionViewController view](v48, "view");
      objc_msgSend(v21, "insertSubview:atIndex:", v42, 0);

      objc_storeStrong(&v42, 0);
    }
    objc_storeStrong(&v44, 0);
  }
  else
  {
    v17 = +[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor");
    v16 = -[DDParsecServiceCollectionViewController view](v48, "view");
    objc_msgSend(v16, "setBackgroundColor:", v17);

  }
  v28 = _NSConcreteStackBlock;
  v29 = -1073741824;
  v30 = 0;
  v31 = sub_10000FA54;
  v32 = &unk_100020998;
  v33 = location[0];
  +[SearchUIUtilities performAnimatableChanges:animated:](SearchUIUtilities, "performAnimatableChanges:animated:", &v28, v46);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v45, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)showBackgroundEffect
{
  return 0;
}

- (void)firstTimeExperienceContinueButtonPressed
{
  void (**v2)(void);
  id v3;
  id v4;
  NSUserDefaults *v5;

  if (self->_fte_ack_key)
  {
    v5 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
    -[NSUserDefaults setBool:forKey:](v5, "setBool:forKey:", 1, self->_fte_ack_key);

  }
  self->_fteMode = 0;
  objc_storeStrong((id *)&self->_firstTimeViewController, 0);
  v3 = -[DDParsecServiceCollectionViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  objc_msgSend(v3, "showingFTE:", 0);

  -[DDParsecServiceCollectionViewController showContent:](self, "showContent:", 1);
  v4 = -[DDParsecServiceCollectionViewController queryBlock](self, "queryBlock");

  if (v4)
  {
    v2 = (void (**)(void))-[DDParsecServiceCollectionViewController queryBlock](self, "queryBlock");
    v2[2]();

    -[DDParsecServiceCollectionViewController setQueryBlock:](self, "setQueryBlock:", 0);
  }
}

- (BOOL)firstTimeExperienceIsInPopoverPresentation
{
  return self->_popoverMode;
}

- (void)didEngageCardSection:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  int v7;
  id v8;
  char v9;
  id v10;
  char v11;
  id v12;
  id location[2];
  DDParsecServiceCollectionViewController *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v14->_useNetwork)
  {
    v3 = -[DDParsecServiceCollectionViewController queryId](v14, "queryId");
    objc_msgSend(location[0], "setQueryId:", v3);
    v8 = -[DDLookupQuery feedbackListener](v14->_lookupQuery, "feedbackListener");
    objc_msgSend(v8, "didEngageCardSection:", location[0]);

  }
  v6 = objc_msgSend(location[0], "destination");
  v11 = 0;
  v9 = 0;
  LOBYTE(v7) = 0;
  if (v6)
  {
    v12 = objc_msgSend(location[0], "cardSection");
    v11 = 1;
    v4 = objc_opt_class(SFMediaPlayerCardSection);
    LOBYTE(v7) = 0;
    if ((objc_opt_isKindOfClass(v12, v4) & 1) == 0)
    {
      v10 = objc_msgSend(location[0], "cardSection");
      v9 = 1;
      v5 = objc_opt_class(SFTrackListCardSection);
      v7 = objc_opt_isKindOfClass(v10, v5) ^ 1;
    }
  }
  if ((v9 & 1) != 0)

  if ((v11 & 1) != 0)
  if ((v7 & 1) != 0)
    -[DDParsecServiceCollectionViewController doneButtonPressed:punchout:](v14, "doneButtonPressed:punchout:", 0, 1);
  objc_storeStrong(location, 0);
}

- (void)didEngageResult:(id)a3
{
  id v3;
  id v4;
  id location[2];
  DDParsecServiceCollectionViewController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v6->_useNetwork)
  {
    v4 = -[DDLookupQuery feedbackListener](v6->_lookupQuery, "feedbackListener");
    objc_msgSend(v4, "didEngageResult:", location[0]);

  }
  if (objc_msgSend(location[0], "destination") == (id)2)
  {
    v3 = -[DDParsecServiceCollectionViewController _remoteViewControllerProxy](v6, "_remoteViewControllerProxy");
    objc_msgSend(v3, "interactionEndedWithPunchout:", 1);

  }
  objc_storeStrong(location, 0);
}

- (BOOL)shouldHandleCardSectionEngagement:(id)a3
{
  id v3;
  uint64_t v4;
  id v6;
  id v7;
  BOOL sheetMode;
  id v9;
  id location[2];
  DDParsecServiceCollectionViewController *v11;
  char v12;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[DDParsecServiceCollectionViewController queryId](v11, "queryId");
  objc_msgSend(location[0], "setQueryId:", v3);
  v7 = objc_msgSend(location[0], "cardSection");
  v4 = objc_opt_class(SFMediaPlayerCardSection);
  sheetMode = 0;
  if ((objc_opt_isKindOfClass(v7, v4) & 1) != 0)
    sheetMode = v11->_sheetMode;

  if (sheetMode)
  {
    v9 = objc_msgSend(location[0], "destination");
    v6 = -[DDParsecServiceCollectionViewController _remoteViewControllerProxy](v11, "_remoteViewControllerProxy");
    objc_msgSend(v6, "openTrailerPunchout:", v9);

    v12 = 0;
    objc_storeStrong(&v9, 0);
  }
  else
  {
    v12 = 1;
  }
  objc_storeStrong(location, 0);
  return v12 & 1;
}

- (void)didReportUserResponseFeedback:(id)a3
{
  BOOL useNetwork;
  id v4;
  id v5;
  id v6;
  id v7;
  NSObject *log;
  os_log_type_t type;
  NSUUID *v10;
  id v11;
  id v12;
  BOOL v13;
  uint8_t v14[15];
  char v15;
  id v16;
  id v17;
  NSString *v18;
  char v19;
  id v20;
  char v21;
  id v22;
  id location[2];
  DDParsecServiceCollectionViewController *v24;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  useNetwork = v24->_useNetwork;
  v21 = 0;
  v19 = 0;
  v13 = 0;
  if (useNetwork)
  {
    v22 = objc_msgSend(location[0], "userSelection");
    v21 = 1;
    v20 = objc_msgSend(v22, "name");
    v19 = 1;
    v13 = v20 != 0;
  }
  if ((v19 & 1) != 0)

  if ((v21 & 1) != 0)
  if (v13)
  {
    v10 = +[NSUUID UUID](NSUUID, "UUID");
    v18 = -[NSUUID UUIDString](v10, "UUIDString");

    objc_msgSend(location[0], "setUploadedDataIdentifier:", v18);
    objc_msgSend(location[0], "setReportType:", 1);
    objc_msgSend(location[0], "setSections:", v24->_sections);
    v11 = -[DDLookupQuery feedbackListener](v24->_lookupQuery, "feedbackListener");
    objc_msgSend(v11, "didSubmitUserReportFeedback:", location[0]);

    v4 = objc_alloc((Class)_CPUserReportFeedback);
    v12 = objc_msgSend(v4, "initWithFacade:", location[0]);
    v17 = objc_msgSend(v12, "data");

    if (!v17)
    {
      v16 = &_os_log_default;
      v15 = 16;
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
      {
        log = v16;
        type = v15;
        sub_100005D3C(v14);
        _os_log_error_impl((void *)&_mh_execute_header, log, type, "didReportUserResponseFeedback(): failed to serialize report data", v14, 2u);
      }
      objc_storeStrong(&v16, 0);
    }
    v7 = -[DDParsecServiceCollectionViewController _remoteViewControllerProxy](v24, "_remoteViewControllerProxy");
    objc_msgSend(v7, "reportAnIssueWithReportIdentifier:sfReportData:", v18, v17);

    objc_storeStrong(&v17, 0);
    objc_storeStrong((id *)&v18, 0);
  }
  v5 = objc_msgSend(location[0], "userSelection");
  v6 = objc_msgSend(v5, "preferredOpenableURL");

  if (v6)
    -[DDParsecServiceCollectionViewController interactionEndedWithPunchout:](v24, "interactionEndedWithPunchout:", 1);
  objc_storeStrong(location, 0);
}

- (void)fetchPreviewImageForResult:(id)a3 completion:(id)a4
{
  id v5;
  void **v6;
  int v7;
  int v8;
  void (*v9)(_QWORD *, void *);
  void *v10;
  id v11;
  id v12;
  id location[2];
  DDParsecServiceCollectionViewController *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v5 = -[DDParsecServiceCollectionViewController _remoteViewControllerProxy](v14, "_remoteViewControllerProxy");
  v6 = _NSConcreteStackBlock;
  v7 = -1073741824;
  v8 = 0;
  v9 = sub_100010550;
  v10 = &unk_100020A38;
  v11 = v12;
  objc_msgSend(v5, "loadReportAnIssueImage:");

  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)forwardInvocation:(id)a3
{
  id v3;
  id v4;
  id v5;
  char v6;
  objc_super v7;
  id location[2];
  DDParsecServiceCollectionViewController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = -[DDLookupQuery feedbackListener](v9->_lookupQuery, "feedbackListener");
  v6 = objc_opt_respondsToSelector(v5, objc_msgSend(location[0], "selector"));

  if ((v6 & 1) != 0)
  {
    if (v9->_useNetwork)
    {
      v3 = location[0];
      v4 = -[DDLookupQuery feedbackListener](v9->_lookupQuery, "feedbackListener");
      objc_msgSend(v3, "invokeWithTarget:");

    }
  }
  else
  {
    v7.receiver = v9;
    v7.super_class = (Class)DDParsecServiceCollectionViewController;
    -[DDParsecServiceCollectionViewController forwardInvocation:](&v7, "forwardInvocation:", location[0]);
  }
  objc_storeStrong(location, 0);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v4;
  char v5;
  id v6;
  objc_super v7;
  SEL v8;
  SEL v9;
  DDParsecServiceCollectionViewController *v10;
  char v11;

  v10 = self;
  v9 = a2;
  v8 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DDParsecServiceCollectionViewController;
  v5 = 0;
  v4 = 1;
  if (!-[DDParsecServiceCollectionViewController respondsToSelector:](&v7, "respondsToSelector:", a3))
  {
    v6 = -[DDLookupQuery feedbackListener](v10->_lookupQuery, "feedbackListener");
    v5 = 1;
    v4 = objc_opt_respondsToSelector(v6, v8);
  }
  v11 = v4 & 1;
  if ((v5 & 1) != 0)

  return v11 & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id v3;
  id v4;
  id v6;
  id v7;
  objc_super v8;
  id v9;
  SEL v10;
  SEL v11;
  DDParsecServiceCollectionViewController *v12;

  v12 = self;
  v11 = a2;
  v10 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DDParsecServiceCollectionViewController;
  v9 = -[DDParsecServiceCollectionViewController methodSignatureForSelector:](&v8, "methodSignatureForSelector:", a3);
  if (!v9)
  {
    v7 = -[DDLookupQuery feedbackListener](v12->_lookupQuery, "feedbackListener");
    v3 = objc_msgSend(v7, "methodSignatureForSelector:", v10);
    v4 = v9;
    v9 = v3;

  }
  v6 = v9;
  objc_storeStrong(&v9, 0);
  return v6;
}

- (double)DDViewScale
{
  return self->_scale;
}

- (id)queryBlock
{
  return self->_queryBlock;
}

- (void)setQueryBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSArray)sections
{
  return self->_sections;
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (void)setQueryId:(unint64_t)a3
{
  self->_queryId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong(&self->_queryBlock, 0);
  objc_storeStrong((id *)&self->_originalTitle, 0);
  objc_storeStrong((id *)&self->_lastDisappearTime, 0);
  objc_storeStrong((id *)&self->_lastAppearTime, 0);
  objc_storeStrong((id *)&self->_firstTimeViewController, 0);
  objc_storeStrong((id *)&self->_fte_ack_key, 0);
  objc_storeStrong((id *)&self->_lookupQuery, 0);
  objc_storeStrong((id *)&self->_resultsViewController, 0);
}

@end
