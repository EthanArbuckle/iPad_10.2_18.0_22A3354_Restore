@implementation MCBrowserViewController

- (MCBrowserViewController)initWithBrowser:(MCNearbyServiceBrowser *)browser session:(MCSession *)session
{
  uint64_t v7;
  MCBrowserViewController *v8;
  uint64_t v9;
  void *v10;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  void *v15;
  uint64_t v16;
  objc_class *v17;
  objc_super v18;

  v7 = objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v18.receiver = self;
  v18.super_class = (Class)MCBrowserViewController;
  v8 = -[MCBrowserViewController initWithNibName:bundle:](&v18, sel_initWithNibName_bundle_, CFSTR("MCBrowserViewController"), v7);
  if (!v8)
    return v8;
  if (!browser)
  {
    v12 = (void *)MEMORY[0x24BDBCE88];
    v13 = *MEMORY[0x24BDBCAB8];
    v14 = (objc_class *)objc_opt_class();
    objc_msgSend(v12, "raise:format:", v13, CFSTR("A nil MCNearbyServiceBrowser object passed to %@"), NSStringFromClass(v14));
    if (session)
      goto LABEL_4;
LABEL_12:
    v15 = (void *)MEMORY[0x24BDBCE88];
    v16 = *MEMORY[0x24BDBCAB8];
    v17 = (objc_class *)objc_opt_class();
    objc_msgSend(v15, "raise:format:", v16, CFSTR("A nil MCSession object passed to %@"), NSStringFromClass(v17));
    goto LABEL_4;
  }
  if (!session)
    goto LABEL_12;
LABEL_4:
  v8->_frameworkBundle = (NSBundle *)(id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = 2 * (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom") == 1);
  else
    v9 = 0;
  -[MCBrowserViewController setModalPresentationStyle:](v8, "setModalPresentationStyle:", v9);
  v8->_myPeerID = (MCPeerID *)-[MCPeerID copy](-[MCNearbyServiceBrowser myPeerID](browser, "myPeerID"), "copy");
  v8->_browser = browser;
  v8->_session = session;
  v8->_nearbyPeersSection = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v8->_invitedPeersSection = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v8->_invitedPeersState = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  v8->_foundPeers = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v8->_minimumNumberOfPeers = 2;
  v8->_maximumNumberOfPeers = 8;
  if (!-[MCNearbyServiceBrowser delegate](v8->_browser, "delegate"))
    -[MCNearbyServiceBrowser setDelegate:](v8->_browser, "setDelegate:", v8);
  -[MCSession setPrivateDelegate:](v8->_session, "setPrivateDelegate:", v8);
  v8->_callbackQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.MCBrowserViewController.callbackQueue", 0);
  v10 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v10, "addObserver:selector:name:object:", v8, sel_applicationWillEnterForegroundNotification_, *MEMORY[0x24BDF75D0], 0);
  objc_msgSend(v10, "addObserver:selector:name:object:", v8, sel_applicationDidEnterBackgroundNotification_, *MEMORY[0x24BDF7528], 0);
  return v8;
}

- (MCBrowserViewController)initWithServiceType:(NSString *)serviceType session:(MCSession *)session
{
  return -[MCBrowserViewController initWithBrowser:session:](self, "initWithBrowser:session:", -[MCNearbyServiceBrowser initWithPeer:serviceType:]([MCNearbyServiceBrowser alloc], "initWithPeer:serviceType:", -[MCSession myPeerID](session, "myPeerID"), serviceType), session);
}

- (MCBrowserViewController)init
{
  return -[MCBrowserViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
}

- (MCBrowserViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MCBrowserViewController;
  -[MCBrowserViewController doesNotRecognizeSelector:](&v5, sel_doesNotRecognizeSelector_, a2, a4);
  return 0;
}

- (MCBrowserViewController)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MCBrowserViewController;
  -[MCBrowserViewController doesNotRecognizeSelector:](&v4, sel_doesNotRecognizeSelector_, a2);
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);

  objc_storeWeak((id *)&self->_delegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)MCBrowserViewController;
  -[MCBrowserViewController dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  MCNearbyServiceBrowser *v6;
  MCSession *v7;
  NSUInteger v8;
  NSUInteger v9;
  objc_class *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = -[MCBrowserViewController browser](self, "browser");
  v7 = -[MCBrowserViewController session](self, "session");
  v8 = -[MCBrowserViewController minimumNumberOfPeers](self, "minimumNumberOfPeers");
  v9 = -[MCBrowserViewController maximumNumberOfPeers](self, "maximumNumberOfPeers");
  -[MCBrowserViewController delegate](self, "delegate");
  v10 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p Browser = %@ Session = %@ MinimumNumberOfPeers = %ld MaximumNumberOfPeers = %ld Delegate = <%@: %p>>"), v5, self, v6, v7, v8, v9, NSStringFromClass(v10), -[MCBrowserViewController delegate](self, "delegate"));
}

- (id)delegate
{
  return objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (BOOL)isVisible
{
  int v3;

  v3 = -[MCBrowserViewController isViewLoaded](self, "isViewLoaded");
  if (v3)
    LOBYTE(v3) = objc_msgSend((id)-[MCBrowserViewController view](self, "view"), "window") != 0;
  return v3;
}

- (void)viewDidLoad
{
  NSDictionary *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MCBrowserViewController;
  -[MCBrowserViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[UITableView registerClass:forCellReuseIdentifier:](-[MCBrowserViewController tableView](self, "tableView"), "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("Peer Cell"));
  v3 = _NSDictionaryOfVariableBindings(CFSTR("topGuide, navigationBar"), (id)-[MCBrowserViewController topLayoutGuide](self, "topLayoutGuide"), -[MCBrowserViewController navigationBar](self, "navigationBar"), 0);
  v4 = (void *)-[MCBrowserViewController view](self, "view");
  objc_msgSend(v4, "addConstraints:", objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[topGuide]-0-[navigationBar]"), 0, 0, v3));
  -[UINavigationBar setDelegate:](-[MCBrowserViewController navigationBar](self, "navigationBar"), "setDelegate:", self);
}

- (void)handleViewWillAppear
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[NSMutableArray removeAllObjects](-[MCBrowserViewController nearbyPeersSection](self, "nearbyPeersSection"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[MCBrowserViewController invitedPeersSection](self, "invitedPeersSection"), "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](-[MCBrowserViewController invitedPeersState](self, "invitedPeersState"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[MCBrowserViewController foundPeers](self, "foundPeers"), "removeAllObjects");
  -[MCBrowserViewController setDeclinedPeersCount:](self, "setDeclinedPeersCount:", 0);
  -[UIBarButtonItem setEnabled:](-[MCBrowserViewController doneButton](self, "doneButton"), "setEnabled:", 0);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = -[MCSession connectedPeers](self->_session, "connectedPeers", 0);
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7);
        -[NSMutableArray addObject:](-[MCBrowserViewController invitedPeersSection](self, "invitedPeersSection"), "addObject:", v8);
        -[MCBrowserViewController peer:changedStateTo:](self, "peer:changedStateTo:", v8, 2);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  -[UITableView reloadData](-[MCBrowserViewController tableView](self, "tableView"), "reloadData");
  -[MCNearbyServiceBrowser startBrowsingForPeers](-[MCBrowserViewController browser](self, "browser"), "startBrowsingForPeers");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MCBrowserViewController;
  -[MCBrowserViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[MCBrowserViewController handleViewWillAppear](self, "handleViewWillAppear");
}

- (void)handleViewDidDisappear
{
  -[MCNearbyServiceBrowser stopBrowsingForPeers](-[MCBrowserViewController browser](self, "browser"), "stopBrowsingForPeers");
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[MCBrowserViewController handleViewDidDisappear](self, "handleViewDidDisappear");
  v5.receiver = self;
  v5.super_class = (Class)MCBrowserViewController;
  -[MCBrowserViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MCBrowserViewController;
  -[MCBrowserViewController didReceiveMemoryWarning](&v2, sel_didReceiveMemoryWarning);
}

- (void)setMinimumNumberOfPeers:(NSUInteger)minimumNumberOfPeers
{
  unint64_t v3;

  v3 = 2;
  if (minimumNumberOfPeers >= 2 && (v3 = 8, minimumNumberOfPeers <= 8))
    self->_minimumNumberOfPeers = minimumNumberOfPeers;
  else
    self->_minimumNumberOfPeers = v3;
}

- (void)setMaximumNumberOfPeers:(NSUInteger)maximumNumberOfPeers
{
  unint64_t v3;

  v3 = 2;
  if (maximumNumberOfPeers >= 2 && (v3 = 8, maximumNumberOfPeers <= 8))
    self->_maximumNumberOfPeers = maximumNumberOfPeers;
  else
    self->_maximumNumberOfPeers = v3;
}

- (void)doneTapped:(id)a3
{
  objc_msgSend(-[MCBrowserViewController delegate](self, "delegate", a3), "browserViewControllerDidFinish:", self);
}

- (void)peerJoinedSession
{
  -[UIBarButtonItem setEnabled:](-[MCBrowserViewController doneButton](self, "doneButton"), "setEnabled:", -[NSArray count](-[MCSession connectedPeers](-[MCBrowserViewController session](self, "session"), "connectedPeers"), "count")+ 1 >= -[MCBrowserViewController minimumNumberOfPeers](self, "minimumNumberOfPeers"));
}

- (void)peer:(id)a3 changedStateTo:(int)a4
{
  NSMutableDictionary *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  _DWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  switch(a4)
  {
    case 0:
      -[NSMutableArray removeObject:](-[MCBrowserViewController nearbyPeersSection](self, "nearbyPeersSection"), "removeObject:", a3);
      -[NSMutableArray addObject:](-[MCBrowserViewController invitedPeersSection](self, "invitedPeersSection"), "addObject:", a3);
      v7 = -[MCBrowserViewController invitedPeersState](self, "invitedPeersState");
      v8 = (void *)MEMORY[0x24BDD16E0];
      v9 = 0;
      goto LABEL_6;
    case 1:
      v7 = -[MCBrowserViewController invitedPeersState](self, "invitedPeersState");
      v8 = (void *)MEMORY[0x24BDD16E0];
      v9 = 1;
LABEL_6:
      -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", objc_msgSend(v8, "numberWithInteger:", v9), a3);
      break;
    case 2:
      v11 = -[MCBrowserViewController invitedPeersState](self, "invitedPeersState");
      -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 2), a3);
      -[MCBrowserViewController peerJoinedSession](self, "peerJoinedSession");
      break;
    case 3:
      v12 = -[MCBrowserViewController invitedPeersState](self, "invitedPeersState");
      -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 3), a3);
      -[MCBrowserViewController setDeclinedPeersCount:](self, "setDeclinedPeersCount:", -[MCBrowserViewController declinedPeersCount](self, "declinedPeersCount") + 1);
      break;
    case 4:
      -[NSMutableArray removeObject:](-[MCBrowserViewController invitedPeersSection](self, "invitedPeersSection"), "removeObject:", a3);
      -[NSMutableDictionary removeObjectForKey:](-[MCBrowserViewController invitedPeersState](self, "invitedPeersState"), "removeObjectForKey:", a3);
      if (-[NSMutableArray containsObject:](-[MCBrowserViewController foundPeers](self, "foundPeers"), "containsObject:", a3))-[NSMutableArray addObject:](-[MCBrowserViewController nearbyPeersSection](self, "nearbyPeersSection"), "addObject:", a3);
      break;
    default:
      v10 = mcbrowser_ui_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v13[0] = 67109120;
        v13[1] = a4;
        _os_log_impl(&dword_20DC1A000, v10, OS_LOG_TYPE_DEFAULT, "Unknown peer state [%d].", (uint8_t *)v13, 8u);
      }
      break;
  }
}

- (void)cancelTapped:(id)a3
{
  objc_msgSend(-[MCBrowserViewController delegate](self, "delegate", a3), "browserViewControllerWasCancelled:", self);
}

- (id)detailStringForPeerState:(int)a3
{
  if (a3 <= 4)
    return (id)objc_msgSend(*((id *)self + 135), "localizedStringForKey:value:table:", off_24C840C78[a3], &stru_24C841670, 0);
  return self;
}

- (void)verifyPeerIsAccountedFor:(id)a3
{
  -[NSMutableArray removeObject:](-[MCBrowserViewController nearbyPeersSection](self, "nearbyPeersSection"), "removeObject:", a3);
  if ((-[NSMutableArray containsObject:](-[MCBrowserViewController invitedPeersSection](self, "invitedPeersSection"), "containsObject:", a3) & 1) == 0)-[NSMutableArray addObject:](-[MCBrowserViewController invitedPeersSection](self, "invitedPeersSection"), "addObject:", a3);
}

- (BOOL)maximumNumberOfPeersReached
{
  uint64_t v3;
  unint64_t v4;

  v3 = -[NSMutableArray count](-[MCBrowserViewController invitedPeersSection](self, "invitedPeersSection"), "count");
  v4 = v3 - -[MCBrowserViewController declinedPeersCount](self, "declinedPeersCount");
  return v4 >= -[MCBrowserViewController maximumNumberOfPeers](self, "maximumNumberOfPeers") - 1;
}

- (BOOL)minimumNumberOfPeersReached
{
  uint64_t v3;
  unint64_t v4;

  v3 = -[NSMutableArray count](-[MCBrowserViewController invitedPeersSection](self, "invitedPeersSection"), "count");
  v4 = v3 - -[MCBrowserViewController declinedPeersCount](self, "declinedPeersCount");
  return v4 >= -[MCBrowserViewController minimumNumberOfPeers](self, "minimumNumberOfPeers") - 1;
}

- (id)nearbySectionTitle
{
  _BOOL4 v3;
  BOOL v4;
  BOOL v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  NSUInteger v9;
  NSBundle *frameworkBundle;
  const __CFString *v12;
  uint64_t v13;
  NSUInteger v15;
  uint64_t v16;
  NSString *v17;
  uint64_t v18;
  void *v19;
  NSUInteger v20;

  v3 = -[MCBrowserViewController minimumNumberOfPeersReached](self, "minimumNumberOfPeersReached");
  v4 = -[MCBrowserViewController maximumNumberOfPeersReached](self, "maximumNumberOfPeersReached");
  v5 = v4;
  if (!v3)
  {
    v15 = -[MCBrowserViewController minimumNumberOfPeers](self, "minimumNumberOfPeers");
    v16 = ~-[NSMutableArray count](-[MCBrowserViewController invitedPeersSection](self, "invitedPeersSection"), "count");
    v6 = v15 + -[MCBrowserViewController declinedPeersCount](self, "declinedPeersCount") + v16;
    if (!v5)
      goto LABEL_3;
    return 0;
  }
  v6 = 0;
  if (v4)
    return 0;
LABEL_3:
  v7 = -[MCBrowserViewController maximumNumberOfPeers](self, "maximumNumberOfPeers");
  v8 = ~-[NSMutableArray count](-[MCBrowserViewController invitedPeersSection](self, "invitedPeersSection"), "count");
  v9 = v7 + -[MCBrowserViewController declinedPeersCount](self, "declinedPeersCount") + v8;
  if (v9 == 1 && v3)
  {
    frameworkBundle = self->_frameworkBundle;
    v12 = CFSTR("Choose up to %lu more invitee");
LABEL_8:
    v13 = -[NSBundle localizedStringForKey:value:table:](frameworkBundle, "localizedStringForKey:value:table:", v12, &stru_24C841670, 0);
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v13, 1, v20);
  }
  if (v3)
  {
    v17 = -[NSBundle localizedStringForKey:value:table:](self->_frameworkBundle, "localizedStringForKey:value:table:", CFSTR("Choose up to %lu more invitees"), &stru_24C841670, 0);
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v17, v9, v20);
  }
  else
  {
    frameworkBundle = self->_frameworkBundle;
    if (v6 == v9 && v9 == 1)
    {
      v12 = CFSTR("Choose %lu invitee");
      goto LABEL_8;
    }
    if (v6 == v9)
    {
      v18 = -[NSBundle localizedStringForKey:value:table:](frameworkBundle, "localizedStringForKey:value:table:", CFSTR("Choose %lu invitees"), &stru_24C841670, 0);
      v19 = (void *)MEMORY[0x24BDD17C8];
    }
    else
    {
      v18 = -[NSBundle localizedStringForKey:value:table:](frameworkBundle, "localizedStringForKey:value:table:", CFSTR("Choose %lu to %lu invitees"), &stru_24C841670, 0);
      v19 = (void *)MEMORY[0x24BDD17C8];
      v20 = v9;
    }
    return (id)objc_msgSend(v19, "localizedStringWithFormat:", v18, v6, v20);
  }
}

- (void)applicationDidEnterBackgroundNotification:(id)a3
{
  if (-[MCBrowserViewController isVisible](self, "isVisible", a3))
    -[MCBrowserViewController handleViewDidDisappear](self, "handleViewDidDisappear");
}

- (void)applicationWillEnterForegroundNotification:(id)a3
{
  if (-[MCBrowserViewController isVisible](self, "isVisible", a3))
    -[MCBrowserViewController handleViewWillAppear](self, "handleViewWillAppear");
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (-[NSMutableArray count](-[MCBrowserViewController invitedPeersSection](self, "invitedPeersSection", a3), "count")
    && !-[MCBrowserViewController maximumNumberOfPeersReached](self, "maximumNumberOfPeersReached"))
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v6;

  v6 = -[NSMutableArray count](-[MCBrowserViewController invitedPeersSection](self, "invitedPeersSection", a3), "count");
  if (a4 || !v6)
    return -[MCBrowserViewController nearbySectionTitle](self, "nearbySectionTitle");
  else
    return -[NSBundle localizedStringForKey:value:table:](self->_frameworkBundle, "localizedStringForKey:value:table:", CFSTR("Invitees"), &stru_24C841670, 0);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v6;
  int64_t result;

  v6 = -[NSMutableArray count](-[MCBrowserViewController invitedPeersSection](self, "invitedPeersSection", a3), "count");
  if (!a4 && v6)
    return -[NSMutableArray count](-[MCBrowserViewController invitedPeersSection](self, "invitedPeersSection"), "count");
  result = -[NSMutableArray count](-[MCBrowserViewController nearbyPeersSection](self, "nearbyPeersSection"), "count");
  if ((unint64_t)result <= 1)
    return 1;
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v6;
  const __CFString *v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("Peer Cell"));
  objc_msgSend(v6, "setAccessoryType:", 0);
  objc_msgSend(v6, "setAccessoryView:", 0);
  if (-[NSMutableArray count](-[MCBrowserViewController invitedPeersSection](self, "invitedPeersSection"), "count")
    && !objc_msgSend(a4, "section"))
  {
    v9 = (void *)-[NSMutableArray objectAtIndex:](-[MCBrowserViewController invitedPeersSection](self, "invitedPeersSection"), "objectAtIndex:", objc_msgSend(a4, "row"));
    v10 = (void *)-[NSMutableDictionary objectForKey:](-[MCBrowserViewController invitedPeersState](self, "invitedPeersState"), "objectForKey:", v9);
    objc_msgSend((id)objc_msgSend(v6, "textLabel"), "setText:", objc_msgSend(v9, "displayName"));
    objc_msgSend((id)objc_msgSend(v6, "textLabel"), "setEnabled:", 1);
    v7 = -[MCBrowserViewController detailStringForPeerState:](self, "detailStringForPeerState:", objc_msgSend(v10, "integerValue"));
    goto LABEL_7;
  }
  if (-[NSMutableArray count](-[MCBrowserViewController nearbyPeersSection](self, "nearbyPeersSection"), "count"))
  {
    objc_msgSend((id)objc_msgSend(v6, "textLabel"), "setText:", objc_msgSend((id)-[NSMutableArray objectAtIndex:](-[MCBrowserViewController nearbyPeersSection](self, "nearbyPeersSection"), "objectAtIndex:", objc_msgSend(a4, "row")), "displayName"));
    objc_msgSend((id)objc_msgSend(v6, "textLabel"), "setEnabled:", 1);
    v7 = &stru_24C841670;
    objc_msgSend((id)objc_msgSend(v6, "detailTextLabel"), "setText:", &stru_24C841670);
LABEL_7:
    objc_msgSend((id)objc_msgSend(v6, "detailTextLabel"), "setText:", v7);
    return v6;
  }
  objc_msgSend((id)objc_msgSend(v6, "textLabel"), "setText:", -[NSBundle localizedStringForKey:value:table:](self->_frameworkBundle, "localizedStringForKey:value:table:", CFSTR("Searching..."), &stru_24C841670, 0));
  objc_msgSend((id)objc_msgSend(v6, "textLabel"), "setEnabled:", 0);
  objc_msgSend((id)objc_msgSend(v6, "detailTextLabel"), "setText:", &stru_24C841670);
  objc_msgSend((id)objc_msgSend(v6, "detailTextLabel"), "setText:", &stru_24C841670);
  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(v8, "setHidesWhenStopped:", 1);
  objc_msgSend(v8, "startAnimating");
  objc_msgSend(v6, "setAccessoryView:", v8);
  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v5;

  v5 = -[NSMutableArray objectAtIndex:](-[MCBrowserViewController nearbyPeersSection](self, "nearbyPeersSection", a3), "objectAtIndex:", objc_msgSend(a4, "row"));
  -[MCNearbyServiceBrowser invitePeer:toSession:withContext:timeout:](-[MCBrowserViewController browser](self, "browser"), "invitePeer:toSession:withContext:timeout:", v5, -[MCBrowserViewController session](self, "session"), 0, 0.0);
  -[MCBrowserViewController peer:changedStateTo:](self, "peer:changedStateTo:", v5, 0);
  -[UITableView reloadData](-[MCBrowserViewController tableView](self, "tableView"), "reloadData");
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v6;

  if (!-[NSMutableArray count](-[MCBrowserViewController invitedPeersSection](self, "invitedPeersSection", a3), "count")|| (v6 = objc_msgSend(a4, "section")) != 0)
  {
    LOBYTE(v6) = -[NSMutableArray count](-[MCBrowserViewController nearbyPeersSection](self, "nearbyPeersSection"), "count") != 0;
  }
  return v6;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  uint64_t v6;

  v6 = -[NSMutableArray count](-[MCBrowserViewController invitedPeersSection](self, "invitedPeersSection", a3), "count");
  if ((a4 || !v6)
    && -[NSMutableArray count](-[MCBrowserViewController nearbyPeersSection](self, "nearbyPeersSection"), "count"))
  {
    return -[MCNearbyPeerTableViewHeader initWithTitle:]([MCNearbyPeerTableViewHeader alloc], "initWithTitle:", -[MCBrowserViewController nearbySectionTitle](self, "nearbySectionTitle"));
  }
  else
  {
    return 0;
  }
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 40.0;
}

- (void)browser:(id)a3 foundPeer:(id)a4 withDiscoveryInfo:(id)a5
{
  _QWORD block[7];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__MCBrowserViewController_browser_foundPeer_withDiscoveryInfo___block_invoke;
  block[3] = &unk_24C840680;
  block[4] = self;
  block[5] = a4;
  block[6] = a5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __63__MCBrowserViewController_browser_foundPeer_withDiscoveryInfo___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const char *v4;
  int v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  NSObject *v10;
  _QWORD block[4];
  __int128 v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "foundPeers"), "addObject:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nearbyPeersSection"), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    v2 = mcbrowser_ui_log();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      return;
    v3 = objc_msgSend(*(id *)(a1 + 40), "displayName");
    *(_DWORD *)buf = 138412290;
    v15 = v3;
    v4 = "Found Peer [%@] - peer already previously discovered?";
LABEL_7:
    _os_log_impl(&dword_20DC1A000, v2, OS_LOG_TYPE_DEFAULT, v4, buf, 0xCu);
    return;
  }
  v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "session"), "connectedPeers"), "containsObject:", *(_QWORD *)(a1 + 40));
  v2 = mcbrowser_ui_log();
  v6 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v6)
      return;
    v7 = objc_msgSend(*(id *)(a1 + 40), "displayName");
    *(_DWORD *)buf = 138412290;
    v15 = v7;
    v4 = "Found Peer [%@] - peer already connected.";
    goto LABEL_7;
  }
  if (v6)
  {
    v8 = objc_msgSend(*(id *)(a1 + 40), "displayName");
    *(_DWORD *)buf = 138412290;
    v15 = v8;
    _os_log_impl(&dword_20DC1A000, v2, OS_LOG_TYPE_DEFAULT, "Found Peer [%@].", buf, 0xCu);
  }
  v9 = *(_OWORD *)(a1 + 32);
  v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 1096);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__MCBrowserViewController_browser_foundPeer_withDiscoveryInfo___block_invoke_65;
  block[3] = &unk_24C840680;
  v12 = v9;
  v13 = *(_QWORD *)(a1 + 48);
  dispatch_async(v10, block);
}

void __63__MCBrowserViewController_browser_foundPeer_withDiscoveryInfo___block_invoke_65(uint64_t a1)
{
  _QWORD v2[4];
  __int128 v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  if ((objc_opt_respondsToSelector() & 1) == 0
    || objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "browserViewController:shouldPresentNearbyPeer:withDiscoveryInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)))
  {
    v2[0] = MEMORY[0x24BDAC760];
    v2[1] = 3221225472;
    v2[2] = __63__MCBrowserViewController_browser_foundPeer_withDiscoveryInfo___block_invoke_2;
    v2[3] = &unk_24C840658;
    v3 = *(_OWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], v2);
  }
}

uint64_t __63__MCBrowserViewController_browser_foundPeer_withDiscoveryInfo___block_invoke_2(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nearbyPeersSection"), "addObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "tableView"), "reloadData");
}

- (void)browser:(id)a3 lostPeer:(id)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__MCBrowserViewController_browser_lostPeer___block_invoke;
  v4[3] = &unk_24C840658;
  v4[4] = self;
  v4[5] = a4;
  dispatch_async(MEMORY[0x24BDAC9B8], v4);
}

void __44__MCBrowserViewController_browser_lostPeer___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "foundPeers"), "removeObject:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nearbyPeersSection"), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    v2 = mcbrowser_ui_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_msgSend(*(id *)(a1 + 40), "displayName");
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_20DC1A000, v2, OS_LOG_TYPE_DEFAULT, "Removing peer [%@] from tableView.", (uint8_t *)&v6, 0xCu);
    }
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nearbyPeersSection"), "removeObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "tableView"), "reloadData");
  }
  v4 = mcbrowser_ui_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_msgSend(*(id *)(a1 + 40), "displayName");
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_20DC1A000, v4, OS_LOG_TYPE_DEFAULT, "Lost Peer [%@].", (uint8_t *)&v6, 0xCu);
  }
}

- (void)session:(id)a3 didReceiveData:(id)a4 fromPeer:(id)a5 propagate:(BOOL *)a6
{
  NSObject *v6;

  v6 = mcbrowser_ui_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[MCBrowserViewController session:didReceiveData:fromPeer:propagate:].cold.1();
}

- (void)session:(id)a3 peer:(id)a4 didChangeState:(int64_t)a5 propagate:(BOOL *)a6
{
  NSObject *v9;
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v9 = mcbrowser_ui_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v12 = objc_msgSend(a4, "displayName");
    v13 = 2112;
    v14 = +[MCSession stringForSessionState:](MCSession, "stringForSessionState:", a5);
    _os_log_impl(&dword_20DC1A000, v9, OS_LOG_TYPE_DEFAULT, "Peer [%@] changed state to [%@].", buf, 0x16u);
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__MCBrowserViewController_session_peer_didChangeState_propagate___block_invoke;
  block[3] = &unk_24C840860;
  block[5] = a4;
  block[6] = a5;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __65__MCBrowserViewController_session_peer_didChangeState_propagate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
  {
    if (v2 == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "verifyPeerIsAccountedFor:", *(_QWORD *)(a1 + 40));
      v3 = *(void **)(a1 + 32);
      v4 = *(_QWORD *)(a1 + 40);
      v5 = 1;
      goto LABEL_9;
    }
    if (v2 == 2)
    {
      objc_msgSend(*(id *)(a1 + 32), "verifyPeerIsAccountedFor:", *(_QWORD *)(a1 + 40));
      v3 = *(void **)(a1 + 32);
      v4 = *(_QWORD *)(a1 + 40);
      v5 = 2;
LABEL_9:
      objc_msgSend(v3, "peer:changedStateTo:", v4, v5);
    }
  }
  else
  {
    v6 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "invitedPeersState"), "objectForKey:", *(_QWORD *)(a1 + 40));
    if (v6)
    {
      v7 = objc_msgSend(v6, "integerValue");
      v3 = *(void **)(a1 + 32);
      v4 = *(_QWORD *)(a1 + 40);
      if (v7)
        v5 = 4;
      else
        v5 = 3;
      goto LABEL_9;
    }
    v9 = mcbrowser_ui_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(*(id *)(a1 + 40), "displayName");
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_20DC1A000, v9, OS_LOG_TYPE_DEFAULT, "Peer [%@] disconnected but was not in 'invitees' section.", (uint8_t *)&v11, 0xCu);
    }
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "tableView"), "reloadData");
}

- (void)session:(id)a3 didReceiveStream:(id)a4 withName:(id)a5 fromPeer:(id)a6 propagate:(BOOL *)a7
{
  NSObject *v7;

  v7 = mcbrowser_ui_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[MCBrowserViewController session:didReceiveData:fromPeer:propagate:].cold.1();
}

- (void)session:(id)a3 didStartReceivingResourceWithName:(id)a4 fromPeer:(id)a5 withProgress:(id)a6 propagate:(BOOL *)a7
{
  NSObject *v7;

  v7 = mcbrowser_ui_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[MCBrowserViewController session:didReceiveData:fromPeer:propagate:].cold.1();
}

- (void)session:(id)a3 didFinishReceivingResourceWithName:(id)a4 fromPeer:(id)a5 atURL:(id)a6 withError:(id)a7 propagate:(BOOL *)a8
{
  NSObject *v8;

  v8 = mcbrowser_ui_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[MCBrowserViewController session:didReceiveData:fromPeer:propagate:].cold.1();
}

- (int64_t)positionForBar:(id)a3
{
  return 3;
}

- (MCNearbyServiceBrowser)browser
{
  return self->_browser;
}

- (void)setBrowser:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 976);
}

- (MCSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 984);
}

- (NSUInteger)minimumNumberOfPeers
{
  return self->_minimumNumberOfPeers;
}

- (NSUInteger)maximumNumberOfPeers
{
  return self->_maximumNumberOfPeers;
}

- (MCPeerID)myPeerID
{
  return self->_myPeerID;
}

- (void)setMyPeerID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1008);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1016);
}

- (NSMutableArray)nearbyPeersSection
{
  return self->_nearbyPeersSection;
}

- (void)setNearbyPeersSection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1024);
}

- (NSMutableArray)invitedPeersSection
{
  return self->_invitedPeersSection;
}

- (void)setInvitedPeersSection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1032);
}

- (NSMutableDictionary)invitedPeersState
{
  return self->_invitedPeersState;
}

- (void)setInvitedPeersState:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1040);
}

- (NSMutableArray)foundPeers
{
  return self->_foundPeers;
}

- (void)setFoundPeers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1048);
}

- (UIBarButtonItem)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1056);
}

- (UIBarButtonItem)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1064);
}

- (UINavigationBar)navigationBar
{
  return self->_navigationBar;
}

- (void)setNavigationBar:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1072);
}

- (NSBundle)frameworkBundle
{
  return self->_frameworkBundle;
}

- (void)setFrameworkBundle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1080);
}

- (unint64_t)declinedPeersCount
{
  return self->_declinedPeersCount;
}

- (void)setDeclinedPeersCount:(unint64_t)a3
{
  self->_declinedPeersCount = a3;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1096);
}

- (void)session:didReceiveData:fromPeer:propagate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_4(&dword_20DC1A000, v0, v1, "MCBrowserViewController shouldn't be receiving this callback.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
