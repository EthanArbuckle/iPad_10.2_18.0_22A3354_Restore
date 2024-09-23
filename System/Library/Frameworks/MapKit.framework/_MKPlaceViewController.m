@implementation _MKPlaceViewController

- (BOOL)showTitleBar
{
  return (self->_options & 4) == 0;
}

- (void)setShowTitleBar:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (a3)
    v3 = 0;
  -[_MKPlaceViewController setOptions:](self, "setOptions:", self->_options & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hideDirectionsButtons
{
  return (LOBYTE(self->_options) >> 3) & 1;
}

- (void)setHideDirectionsButtons:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  -[_MKPlaceViewController setOptions:](self, "setOptions:", self->_options & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)showEditButton
{
  return (LOBYTE(self->_options) >> 4) & 1;
}

- (void)setShowEditButton:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  -[_MKPlaceViewController setOptions:](self, "setOptions:", self->_options & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hideInlineMap
{
  return self->_options & 1;
}

- (void)setHideInlineMap:(BOOL)a3
{
  -[_MKPlaceViewController setOptions:](self, "setOptions:", self->_options & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)showInlineMapInHeader
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (void)setShowInlineMapInHeader:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  -[_MKPlaceViewController setOptions:](self, "setOptions:", self->_options & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)showNearbyApps
{
  return (LOBYTE(self->_options) >> 5) & 1;
}

- (void)setShowNearbyApps:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  -[_MKPlaceViewController setOptions:](self, "setOptions:", self->_options & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)showReportAProblem
{
  return (self->_options & 0x40) == 0;
}

- (void)setShowReportAProblem:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (a3)
    v3 = 0;
  -[_MKPlaceViewController setOptions:](self, "setOptions:", self->_options & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)disableReportAProblem
{
  return (LOBYTE(self->_options) >> 6) & 1;
}

- (void)setDisableReportAProblem:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  -[_MKPlaceViewController setOptions:](self, "setOptions:", self->_options & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)showSimulateLocation
{
  return (BYTE1(self->_options) >> 5) & 1;
}

- (void)setShowSimulateLocation:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  -[_MKPlaceViewController setOptions:](self, "setOptions:", self->_options & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)showShareActionsButton
{
  return (self->_options & 0x80) == 0;
}

- (void)setShowShareActionsButton:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (a3)
    v3 = 0;
  -[_MKPlaceViewController setOptions:](self, "setOptions:", self->_options & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)allowTransitLineSelection
{
  return BYTE1(self->_options) & 1;
}

- (void)setAllowTransitLineSelection:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  -[_MKPlaceViewController setOptions:](self, "setOptions:", self->_options & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)showAddToPersonalGuides
{
  return BYTE1(self->_options) >> 7;
}

- (void)setShowAddToPersonalGuides:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  -[_MKPlaceViewController setOptions:](self, "setOptions:", self->_options & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)useCompactPhotosView
{
  return (BYTE1(self->_options) >> 1) & 1;
}

- (void)setUseCompactPhotosView:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  -[_MKPlaceViewController setOptions:](self, "setOptions:", self->_options & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_MKPlaceViewController)init
{
  _MKPlaceViewController *v2;
  _MKPlaceViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_MKPlaceViewController;
  v2 = -[_MKPlaceViewController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[_MKPlaceViewController _commonInit](v2, "_commonInit");
  return v3;
}

- (_MKPlaceViewController)initWithPlaceItem:(id)a3 options:(unint64_t)a4
{
  id v6;
  _MKPlaceViewController *v7;
  _MKPlaceViewController *v8;

  v6 = a3;
  v7 = -[_MKPlaceViewController init](self, "init");
  v8 = v7;
  if (v7)
  {
    v7->_options = a4;
    -[_MKPlaceViewController setPlaceItem:](v7, "setPlaceItem:", v6);
  }

  return v8;
}

- (_MKPlaceViewController)initWithMapItem:(id)a3 options:(unint64_t)a4
{
  id v6;
  _MKPlaceViewController *v7;
  _MKPlaceViewController *v8;

  v6 = a3;
  v7 = -[_MKPlaceViewController init](self, "init");
  v8 = v7;
  if (v7)
  {
    v7->_options = a4;
    -[_MKPlaceViewController setMapItem:](v7, "setMapItem:", v6);
  }

  return v8;
}

- (_MKPlaceViewController)initWithContact:(id)a3 mapItem:(id)a4
{
  return -[_MKPlaceViewController initWithContact:mapItem:options:](self, "initWithContact:mapItem:options:", a3, a4, 0);
}

- (_MKPlaceViewController)initWithContact:(id)a3 mapItem:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  _MKPlaceViewController *v10;
  _MKPlaceViewController *v11;

  v8 = a3;
  v9 = a4;
  v10 = -[_MKPlaceViewController init](self, "init");
  v11 = v10;
  if (v10)
  {
    v10->_options = a5;
    -[_MKPlaceViewController setMapItem:contact:updateOriginalContact:](v10, "setMapItem:contact:updateOriginalContact:", v9, v8, 1);
  }

  return v11;
}

- (_MKPlaceViewController)initWithMapItem:(id)a3
{
  return -[_MKPlaceViewController initWithMapItem:options:](self, "initWithMapItem:options:", a3, 0);
}

- (void)_commonInit
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t initialAppearanceSignpostID;
  MKPlaceItemActionDataProvider *v7;
  MKPlaceItemActionDataProvider *actionDataProvider;
  MKPlaceActionManager *v9;
  MKPlaceActionManager *actionManager;
  id v11;
  NSObject *v12;
  uint8_t v13[16];

  MKGetPlaceCardLog();
  v3 = objc_claimAutoreleasedReturnValue();
  self->_initialAppearanceSignpostID = os_signpost_id_generate(v3);

  MKGetPlaceCardLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  initialAppearanceSignpostID = self->_initialAppearanceSignpostID;
  if (initialAppearanceSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_18B0B0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, initialAppearanceSignpostID, "PlacecardInitialAppearance", (const char *)&unk_18B2CC343, v13, 2u);
  }

  v7 = objc_alloc_init(MKPlaceItemActionDataProvider);
  actionDataProvider = self->_actionDataProvider;
  self->_actionDataProvider = v7;

  v9 = -[MKPlaceActionManager initWithDataProvider:]([MKPlaceActionManager alloc], "initWithDataProvider:", self->_actionDataProvider);
  actionManager = self->_actionManager;
  self->_actionManager = v9;

  -[MKPlaceActionManager setPlaceCardDelegate:](self->_actionManager, "setPlaceCardDelegate:", self);
  -[MKPlaceActionManager setAnalyticsDelegate:](self->_actionManager, "setAnalyticsDelegate:", self);
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[_MKPlaceViewController setViewDidAppearBlocks:](self, "setViewDidAppearBlocks:", v11);

  -[MKStackingViewController setStackingDelegate:](self, "setStackingDelegate:", self);
  self->_contentAlpha = 1.0;
  -[_MKPlaceViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 2);
  -[_MKPlaceViewController analyticsQueue](self, "analyticsQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v12, &__block_literal_global_24);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  +[MKMapItemMetadataRequester sharedInstance](MKMapItemMetadataRequester, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelRequestsForMapItem:", v4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  -[MKETAProvider cancel](self->_etaProvider, "cancel");
  if ((self->_options & 0x20000000) == 0)
  {
    +[MKAppImageManager sharedImageManager](MKAppImageManager, "sharedImageManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clearImageCache");

  }
  v7.receiver = self;
  v7.super_class = (Class)_MKPlaceViewController;
  -[MKStackingViewController dealloc](&v7, sel_dealloc);
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_MKPlaceViewController;
  -[MKStackingViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)PlaceCardLayoutChanged, CFSTR("com.apple.Maps.PlaceCardLayoutChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableArray *viewDidAppearBlocks;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t initialAppearanceSignpostID;
  uint8_t v16[16];
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_MKPlaceViewController;
  -[MKStackingViewController viewDidAppear:](&v17, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D26D08]) & 1) == 0)
    -[_MKPlaceViewController infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:](self, "infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:", 21, 0, 0);
  while (1)
  {
    -[_MKPlaceViewController viewDidAppearBlocks](self, "viewDidAppearBlocks");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (!v10)
      break;
    -[_MKPlaceViewController viewDidAppearBlocks](self, "viewDidAppearBlocks");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

    v7[2](v7);
    -[_MKPlaceViewController viewDidAppearBlocks](self, "viewDidAppearBlocks");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectAtIndex:", 0);

  }
  viewDidAppearBlocks = self->_viewDidAppearBlocks;
  self->_viewDidAppearBlocks = 0;

  -[_MKPlaceViewController analyticsQueue](self, "analyticsQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v12, &__block_literal_global_23);

  -[MKETAProvider restart](self->_etaProvider, "restart");
  if (self->_initialAppearanceSignpostID != -1)
  {
    MKGetPlaceCardLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    initialAppearanceSignpostID = self->_initialAppearanceSignpostID;
    if (initialAppearanceSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)v16 = 0;
      _os_signpost_emit_with_name_impl(&dword_18B0B0000, v14, OS_SIGNPOST_INTERVAL_END, initialAppearanceSignpostID, "PlacecardInitialAppearance", (const char *)&unk_18B2CC343, v16, 2u);
    }

    self->_initialAppearanceSignpostID = -1;
  }

}

- (void)_performWhenViewHasAppeared:(id)a3
{
  NSMutableArray *viewDidAppearBlocks;
  void *v4;
  id v5;

  viewDidAppearBlocks = self->_viewDidAppearBlocks;
  if (viewDidAppearBlocks)
  {
    v5 = (id)objc_msgSend(a3, "copy");
    v4 = (void *)MEMORY[0x18D778DB8]();
    -[NSMutableArray addObject:](viewDidAppearBlocks, "addObject:", v4);

  }
  else
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_MKPlaceViewController;
  -[_MKPlaceViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[MKETAProvider pause](self->_etaProvider, "pause");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  int v5;
  void *v6;
  char v7;
  void *v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_MKPlaceViewController;
  -[_MKPlaceViewController viewWillDisappear:](&v10, sel_viewWillDisappear_, a3);
  if ((-[_MKPlaceViewController isMovingFromParentViewController](self, "isMovingFromParentViewController") & 1) != 0
    || (+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "userInterfaceIdiom"),
        v4,
        v5))
  {
    -[_MKPlaceViewController placeViewControllerDelegate](self, "placeViewControllerDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[_MKPlaceViewController placeViewControllerDelegate](self, "placeViewControllerDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "placeViewControllerDidDismiss:", self);

    }
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.Maps.PlaceCardLayoutChanged"), 0);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  char v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_MKPlaceViewController;
  -[MKStackingViewController viewDidLayoutSubviews](&v6, sel_viewDidLayoutSubviews);
  -[_MKPlaceViewController placeViewControllerDelegate](self, "placeViewControllerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[_MKPlaceViewController placeViewControllerDelegate](self, "placeViewControllerDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "placeViewControllerDidUpdateHeight:", self);

  }
}

- (BOOL)_showReportAProblem
{
  void *v3;
  void *v4;
  char v5;
  BOOL v6;

  if (_MKRAPIsAvailable())
  {
    -[_MKPlaceViewController placeItem](self, "placeItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "options") & 4) != 0)
      goto LABEL_8;
    -[_MKPlaceViewController placeItem](self, "placeItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "options");

    if ((v5 & 8) == 0)
    {
      -[_MKPlaceViewController mapItem](self, "mapItem");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3 && (self->_options & 0x40) == 0)
      {
        v6 = !self->_hasContactOnlyMapItem;
LABEL_9:

        return v6;
      }
LABEL_8:
      v6 = 0;
      goto LABEL_9;
    }
  }
  return 0;
}

- (void)_setDefaultViewControllers:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_MKPlaceViewController additionalViewControllersAtPosition:](self, "additionalViewControllersAtPosition:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count") + objc_msgSend(v6, "count"));
  if (v4 && objc_msgSend(v4, "count"))
    objc_msgSend(v5, "addObjectsFromArray:", v4);
  objc_msgSend(v5, "addObjectsFromArray:", v6);
  -[MKStackingViewController setViewControllers:](self, "setViewControllers:", v5);

}

- (BOOL)isLayoutDynamic
{
  objc_super v3;

  if ((self->_options & 0x20000000) == 0)
    return 0;
  v3.receiver = self;
  v3.super_class = (Class)_MKPlaceViewController;
  return -[MKLayoutCardViewController isLayoutDynamic](&v3, sel_isLayoutDynamic);
}

- (BOOL)isLoading
{
  void *v2;
  char v3;

  -[_MKPlaceViewController placeItem](self, "placeItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isIntermediateMapItem");

  return v3;
}

- (void)showContentIfLoaded
{
  id v3;

  if (!-[_MKPlaceViewController isLoading](self, "isLoading"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("MKPlaceViewControllerDidShowNotification"), self);

  }
}

- (id)_contactStore
{
  CNContactStore *contactStore;
  CNContactStore *v4;
  CNContactStore *v5;

  contactStore = self->_contactStore;
  if (!contactStore)
  {
    v4 = (CNContactStore *)objc_alloc_init(MEMORY[0x1E0C97298]);
    v5 = self->_contactStore;
    self->_contactStore = v4;

    contactStore = self->_contactStore;
  }
  return contactStore;
}

- (id)_contactForEditOperations
{
  void *v3;
  void *v4;

  -[_MKPlaceViewController originalContact](self, "originalContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[_MKPlaceViewController originalContact](self, "originalContact");
  else
    -[_MKPlaceViewController contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CNContact)contact
{
  CNContact *contact;
  void *v4;
  void *v5;
  CNContact *v6;
  void *v7;
  CNContact *v8;
  CNContact *v9;

  contact = self->_contact;
  if (!contact)
  {
    -[_MKPlaceItem contact](self->_placeItem, "contact");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
      v7 = self->_contact;
      self->_contact = v6;
    }
    else
    {
      -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_placeCardContact");
      v8 = (CNContact *)objc_claimAutoreleasedReturnValue();
      v9 = self->_contact;
      self->_contact = v8;

    }
    contact = self->_contact;
  }
  return contact;
}

- (BOOL)_shouldShowContactActions
{
  void *v2;
  _MKPlaceItem *placeItem;
  void *v5;
  BOOL v6;

  placeItem = self->_placeItem;
  if (placeItem)
  {
    -[_MKPlaceItem contact](placeItem, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5
      && (-[_MKPlaceItem contact](self->_placeItem, "contact"),
          v2 = (void *)objc_claimAutoreleasedReturnValue(),
          (objc_msgSend(v2, "hasBeenPersisted") & 1) != 0))
    {
      v6 = 1;
    }
    else if ((-[_MKPlaceItem options](self->_placeItem, "options") & 8) != 0)
    {
      v6 = 1;
      if (!v5)
      {
LABEL_11:

        return !v6;
      }
    }
    else
    {
      v6 = -[_MKPlaceViewController isGuardianRestrictedCNContainer](self, "isGuardianRestrictedCNContainer");
      if (!v5)
        goto LABEL_11;
    }

    goto LABEL_11;
  }
  v6 = 1;
  return !v6;
}

- (BOOL)isGuardianRestrictedCNContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[_MKPlaceViewController _contactStore](self, "_contactStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultContainerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C972C0];
    v13[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicateForContainersWithIdentifiers:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[_MKPlaceViewController _contactStore](self, "_contactStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "containersMatchingPredicate:error:", v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count") == 1)
    {
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isGuardianRestricted");

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_updateViewControllers
{
  NSObject *v3;
  void *v4;
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  MKPlaceCardHeaderViewController *v9;
  MKPlaceCardHeaderViewController *headerViewController;
  MKPlaceHeaderButtonsViewController *buttonsHeaderController;
  MKPlaceHeaderButtonsViewController *v12;
  MKPlaceHeaderButtonsViewController *v13;
  void *v14;
  MKETAProvider *v15;
  MKETAProvider *etaProvider;
  CLLocation *v17;
  CLLocation *location;
  void *v19;
  void *v20;
  unint64_t options;
  MKPlaceHeaderButtonsViewController *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  int BOOL;
  int v30;
  void *v31;
  void *v32;
  _MKURLParser *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  _MKURLParser *v39;
  void *v40;
  void *v41;
  MKMapItemIdentifier *v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  int v49;
  _QWORD v50[5];
  _QWORD v51[5];
  uint8_t buf[16];

  if (self->_isUpdatingViewControllers)
    return;
  self->_isUpdatingViewControllers = 1;
  MKGetPlaceCardLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B0B0000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "UpdateViewControllers", (const char *)&unk_18B2CC343, buf, 2u);
  }

  -[_MKPlaceViewController mapItem](self, "mapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v4)
  {
    -[MKPlaceActionManager setIsCurrentLocation:](self->_actionManager, "setIsCurrentLocation:", 0);
    v6 = objc_msgSend(v4, "_isMapItemTypeBrand");
    -[MKPlaceCardHeaderViewController contentAlpha](self->_headerViewController, "contentAlpha");
    v8 = v7;
    v9 = -[MKPlaceCardHeaderViewController initWithPlaceItem:layout:]([MKPlaceCardHeaderViewController alloc], "initWithPlaceItem:layout:", self->_placeItem, v6);
    headerViewController = self->_headerViewController;
    self->_headerViewController = v9;

    -[MKPlaceCardHeaderViewController setContentAlpha:](self->_headerViewController, "setContentAlpha:", v8);
    -[MKPlaceCardHeaderViewController setDelegate:](self->_headerViewController, "setDelegate:", self);
    buttonsHeaderController = self->_buttonsHeaderController;
    if (!buttonsHeaderController)
    {
      v12 = objc_alloc_init(MKPlaceHeaderButtonsViewController);
      v13 = self->_buttonsHeaderController;
      self->_buttonsHeaderController = v12;

      -[MKPlaceHeaderButtonsViewController setDelegate:](self->_buttonsHeaderController, "setDelegate:", self);
      buttonsHeaderController = self->_buttonsHeaderController;
    }
    -[MKPlaceHeaderButtonsViewController setPlaceItem:](buttonsHeaderController, "setPlaceItem:", self->_placeItem);
    -[MKPlaceHeaderButtonsViewController setSecondaryButtonController:](self->_buttonsHeaderController, "setSecondaryButtonController:", 0);
    -[_MKPlaceViewController placeItem](self, "placeItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "isIntermediateMapItem") & 1) != 0 || (self->_options & 8) != 0)
      v49 = 0;
    else
      v49 = objc_msgSend(v4, "_canGetDirections");

    -[MKETAProvider cancel](self->_etaProvider, "cancel");
    v15 = -[MKETAProvider initWithPlaceItem:]([MKETAProvider alloc], "initWithPlaceItem:", self->_placeItem);
    etaProvider = self->_etaProvider;
    self->_etaProvider = v15;

    -[MKETAProvider setAutomobileOptions:](self->_etaProvider, "setAutomobileOptions:", self->_automobileOptions);
    -[MKETAProvider setWalkingOptions:](self->_etaProvider, "setWalkingOptions:", self->_walkingOptions);
    -[MKETAProvider setTransitOptions:](self->_etaProvider, "setTransitOptions:", self->_transitOptions);
    -[MKETAProvider setCyclingOptions:](self->_etaProvider, "setCyclingOptions:", self->_cyclingOptions);
    -[MKETAProvider setDelegate:](self->_etaProvider, "setDelegate:", self);
    -[MKETAProvider addObserver:](self->_etaProvider, "addObserver:", self);
    -[MKETAProvider addObserver:](self->_etaProvider, "addObserver:", self->_headerViewController);
    -[MKETAProvider addObserver:](self->_etaProvider, "addObserver:", self->_buttonsHeaderController);
    -[MKETAProvider currentLocation](self->_etaProvider, "currentLocation");
    v17 = (CLLocation *)objc_claimAutoreleasedReturnValue();
    location = self->_location;
    self->_location = v17;

    if ((-[_MKPlaceItem options](self->_placeItem, "options") & 1) == 0)
    {
      -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_detourInfo");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        options = self->_options;

        if ((options & 0x100000) != 0)
        {
          v22 = self->_buttonsHeaderController;
          v23 = 2;
LABEL_16:
          -[MKPlaceHeaderButtonsViewController setPrimaryButtonType:](v22, "setPrimaryButtonType:", v23);
LABEL_20:
          if (objc_msgSend(v4, "_isMapItemTypeBrand"))
            -[MKETAProvider start](self->_etaProvider, "start");
          objc_msgSend(v5, "addObject:", self->_headerViewController);
          goto LABEL_23;
        }
      }
      else
      {

      }
      if (v49)
      {
        -[MKPlaceHeaderButtonsViewController setPrimaryButtonType:](self->_buttonsHeaderController, "setPrimaryButtonType:", 1);
        -[MKETAProvider start](self->_etaProvider, "start");
      }
      goto LABEL_20;
    }
    -[MKPlaceActionManager setIsCurrentLocation:](self->_actionManager, "setIsCurrentLocation:", 1);
    v22 = self->_buttonsHeaderController;
    v23 = 3;
    goto LABEL_16;
  }
LABEL_23:
  -[_MKPlaceViewController placeItem](self, "placeItem");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[_MKPlaceViewController placeItem](self, "placeItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isIntermediateMapItem");

    if ((v27 & 1) == 0)
    {
      -[_MKPlaceViewController headerSecondaryButtonController](self, "headerSecondaryButtonController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKPlaceHeaderButtonsViewController setSecondaryButtonController:](self->_buttonsHeaderController, "setSecondaryButtonController:", v28);

      if (-[_MKPlaceViewController isLayoutDynamic](self, "isLayoutDynamic"))
      {
        -[MKLayoutCardViewController _createModuleLayout:](self, "_createModuleLayout:", v5);
      }
      else
      {
        if (objc_msgSend(v4, "_isMapItemTypeBrand"))
          -[_MKPlaceViewController _createViewControllersForBrand:](self, "_createViewControllersForBrand:", v5);
        else
          -[_MKPlaceViewController _createViewControllers:](self, "_createViewControllers:", v5);
        BOOL = GEOConfigGetBOOL();
        v30 = GEOConfigGetBOOL();
        if (BOOL && v30)
          -[_MKPlaceViewController _logClientAndServerLayouts:](self, "_logClientAndServerLayouts:", v5);
      }
    }
  }
  -[_MKPlaceViewController _setDefaultViewControllers:](self, "_setDefaultViewControllers:", v5);
  -[_MKPlaceViewController updateContentAlpha](self, "updateContentAlpha");
  if (!self->_inlineMapViewController)
    goto LABEL_42;
  if (objc_msgSend(v4, "_hasResolvablePartialInformation"))
  {
    +[MKMapService sharedService](MKMapService, "sharedService");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_addressFormattedAsSinglelineAddress");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "ticketForForwardGeocodeString:traits:", v32, 0);
    v33 = (_MKURLParser *)objc_claimAutoreleasedReturnValue();

    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __48___MKPlaceViewController__updateViewControllers__block_invoke;
    v51[3] = &unk_1E20D8D68;
    v51[4] = self;
    -[_MKURLParser submitWithHandler:networkActivity:](v33, "submitWithHandler:networkActivity:", v51, 0);
  }
  else
  {
    if (!self->_inlineMapViewController)
      goto LABEL_42;
    -[_MKPlaceViewController mapItem](self, "mapItem");
    v33 = (_MKURLParser *)objc_claimAutoreleasedReturnValue();
    -[_MKURLParser url](v33, "url");
    v34 = objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      v35 = (void *)v34;
      -[_MKPlaceViewController mapItem](self, "mapItem");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "url");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = +[_MKURLParser isValidMapURL:](_MKURLParser, "isValidMapURL:", v37);

      if (!v38)
        goto LABEL_42;
      v39 = [_MKURLParser alloc];
      -[_MKPlaceViewController mapItem](self, "mapItem");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "url");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[_MKURLParser initWithURL:](v39, "initWithURL:", v41);

      -[_MKURLParser parseIncludingCustomParameters:](v33, "parseIncludingCustomParameters:", 1);
      -[_MKPlaceViewController mapItem](self, "mapItem");
      v42 = (MKMapItemIdentifier *)objc_claimAutoreleasedReturnValue();
      -[MKMapItemIdentifier _identifier](v42, "_identifier");
      v43 = objc_claimAutoreleasedReturnValue();
      if (v43)
      {
        v44 = (void *)v43;
      }
      else
      {
        v46 = -[_MKURLParser searchUID](v33, "searchUID");

        if (!v46)
          goto LABEL_36;
        v42 = -[MKMapItemIdentifier initWithMUID:]([MKMapItemIdentifier alloc], "initWithMUID:", -[_MKURLParser searchUID](v33, "searchUID"));
        +[MKMapService sharedService](MKMapService, "sharedService");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MKURLParser contentProviderID](v33, "contentProviderID");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "ticketForNonExpiredIdentifier:resultProviderID:contentProvider:traits:", v42, 0, v48, 0);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        v50[0] = MEMORY[0x1E0C809B0];
        v50[1] = 3221225472;
        v50[2] = __48___MKPlaceViewController__updateViewControllers__block_invoke_2;
        v50[3] = &unk_1E20D8D68;
        v50[4] = self;
        objc_msgSend(v44, "submitWithHandler:networkActivity:", v50, 0);
      }

    }
  }
LABEL_36:

LABEL_42:
  self->_isUpdatingViewControllers = 0;
  MKGetPlaceCardLog();
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v45))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B0B0000, v45, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "UpdateViewControllers", (const char *)&unk_18B2CC343, buf, 2u);
  }

}

- (void)setLocation:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_location, a3);
  v5 = a3;
  -[MKPlacePoisInlineMapViewController setLocation:](self->_poisInlineMapViewController, "setLocation:", v5);

}

- (void)_logClientAndServerLayouts:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  unsigned int v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  unsigned int v21;
  const __CFString *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  int v32;
  const __CFString *v33;
  NSObject *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v40 != v9)
          objc_enumerationMutation(v6);
        v11 = -[_MKPlaceViewController _moduleTypeForViewController:](self, "_moduleTypeForViewController:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i))- 1;
        v12 = CFSTR("MODULE_TYPE_UNKNOWN");
        if (v11 <= 0x2C)
          v12 = off_1E20D97D0[v11];
        objc_msgSend(v5, "addObject:", v12);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[_MKPlaceViewController mapItem](self, "mapItem", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_placecardLayout");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "modules");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v36 != v19)
          objc_enumerationMutation(v16);
        v21 = objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * j), "type") - 1;
        v22 = CFSTR("MODULE_TYPE_UNKNOWN");
        if (v21 <= 0x2C)
          v22 = off_1E20D97D0[v21];
        objc_msgSend(v13, "addObject:", v22);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    }
    while (v18);
  }

  MKGetPlaceCardLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18B0B0000, v23, OS_LOG_TYPE_INFO, "[dynamic layout debug] Start", buf, 2u);
  }

  MKGetPlaceCardLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    -[_MKPlaceViewController mapItem](self, "mapItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "_muid");
    -[_MKPlaceViewController mapItem](self, "mapItem");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "name");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v44 = v26;
    v45 = 2112;
    v46 = v28;
    _os_log_impl(&dword_18B0B0000, v24, OS_LOG_TYPE_INFO, "place item: muid %llu name %@", buf, 0x16u);

  }
  MKGetPlaceCardLog();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v44 = (uint64_t)v5;
    _os_log_impl(&dword_18B0B0000, v29, OS_LOG_TYPE_INFO, "client layout:\n%@", buf, 0xCu);
  }

  MKGetPlaceCardLog();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v44 = (uint64_t)v13;
    _os_log_impl(&dword_18B0B0000, v30, OS_LOG_TYPE_INFO, "server layout:\n%@", buf, 0xCu);
  }

  MKGetPlaceCardLog();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    v32 = objc_msgSend(v5, "isEqualToArray:", v13);
    v33 = CFSTR("NO");
    if (v32)
      v33 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v44 = (uint64_t)v33;
    _os_log_impl(&dword_18B0B0000, v31, OS_LOG_TYPE_INFO, "layout similar: %@", buf, 0xCu);
  }

  MKGetPlaceCardLog();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18B0B0000, v34, OS_LOG_TYPE_INFO, "[dynamic layout debug] End", buf, 2u);
  }

}

- (void)_createViewControllersForBrand:(id)a3
{
  MKPlaceInfoViewController *v4;
  MKPlaceInfoViewController *infoViewController;
  MKPlaceInlineMapViewController *v6;
  MKPlaceInlineMapViewController *inlineMapViewController;
  MKPlacePoisInlineMapViewController *v8;
  MKPlacePoisInlineMapViewController *poisInlineMapViewController;
  MKPlaceCardFooterActionsViewController *v10;
  MKPlaceCardFooterActionsViewController *placeActionViewController;
  void *v12;
  id v13;

  v13 = a3;
  -[_MKPlaceViewController infosVC](self, "infosVC");
  v4 = (MKPlaceInfoViewController *)objc_claimAutoreleasedReturnValue();
  infoViewController = self->_infoViewController;
  self->_infoViewController = v4;

  if (self->_infoViewController)
  {
    objc_msgSend(v13, "lastObject");
    v6 = (MKPlaceInlineMapViewController *)objc_claimAutoreleasedReturnValue();
    inlineMapViewController = self->_inlineMapViewController;

    if (v6 == inlineMapViewController)
      -[MKPlaceInlineMapViewController setBottomHairlineHidden:](self->_inlineMapViewController, "setBottomHairlineHidden:", 1);
    objc_msgSend(v13, "addObject:", self->_infoViewController);
  }
  -[_MKPlaceViewController poisInlineMapVC](self, "poisInlineMapVC");
  v8 = (MKPlacePoisInlineMapViewController *)objc_claimAutoreleasedReturnValue();
  poisInlineMapViewController = self->_poisInlineMapViewController;
  self->_poisInlineMapViewController = v8;

  if (self->_poisInlineMapViewController)
  {
    objc_msgSend(v13, "addObject:");
    -[MKPlaceInlineMapViewController setBottomHairlineHidden:](self->_poisInlineMapViewController, "setBottomHairlineHidden:", 1);
  }
  -[_MKPlaceViewController createFooterActions](self, "createFooterActions");
  v10 = (MKPlaceCardFooterActionsViewController *)objc_claimAutoreleasedReturnValue();
  placeActionViewController = self->_placeActionViewController;
  self->_placeActionViewController = v10;

  v12 = v13;
  if (self->_placeActionViewController)
  {
    objc_msgSend(v13, "addObject:");
    v12 = v13;
  }

}

- (void)_createViewControllers:(id)a3
{
  id v4;
  _BOOL4 v5;
  MKPlaceInlineMapViewController *v6;
  MKPlaceInlineMapViewController *inlineMapViewController;
  MKPlacePoisInlineMapViewController *v8;
  MKPlacePoisInlineMapViewController *poisInlineMapViewController;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  BOOL v13;
  MKPlaceInlineMapViewController *v14;
  void *v15;
  MKPlaceInfoViewController *v16;
  MKPlaceInfoViewController *infoViewController;
  MKPlaceInlineMapViewController *v18;
  MKPlaceInlineMapViewController *v19;
  MKPlaceInfoViewController *v20;
  MKPlaceInfoViewController *v21;
  void *v22;
  MKPlaceCardFooterActionsViewController *v23;
  MKPlaceCardFooterActionsViewController *placeActionViewController;
  id v25;

  v4 = a3;
  v25 = v4;
  if (self->_buttonsHeaderController)
    objc_msgSend(v4, "addObject:");
  v5 = -[MKLayoutCardViewController isTransitItem](self, "isTransitItem");
  -[_MKPlaceViewController inlineMapVC](self, "inlineMapVC");
  v6 = (MKPlaceInlineMapViewController *)objc_claimAutoreleasedReturnValue();
  inlineMapViewController = self->_inlineMapViewController;
  self->_inlineMapViewController = v6;

  if (self->_inlineMapViewController)
    objc_msgSend(v25, "addObject:");
  -[_MKPlaceViewController poisInlineMapVC](self, "poisInlineMapVC");
  v8 = (MKPlacePoisInlineMapViewController *)objc_claimAutoreleasedReturnValue();
  poisInlineMapViewController = self->_poisInlineMapViewController;
  self->_poisInlineMapViewController = v8;

  if (self->_poisInlineMapViewController)
    objc_msgSend(v25, "addObject:");
  -[_MKPlaceViewController photoVC](self, "photoVC");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v5)
  {
    v12 = 0;
    v13 = v10 == 0;
  }
  else
  {
    v14 = self->_inlineMapViewController;
    v12 = v14 == 0;
    v13 = v10 == 0;
    if (v10 && !v14)
    {
      objc_msgSend(v25, "addObject:", v10);
      v13 = 0;
    }
  }
  -[_MKPlaceViewController hoursVC](self, "hoursVC");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v25, "addObject:", v15);
  -[_MKPlaceViewController infosVC](self, "infosVC");
  v16 = (MKPlaceInfoViewController *)objc_claimAutoreleasedReturnValue();
  infoViewController = self->_infoViewController;
  self->_infoViewController = v16;

  if (self->_infoViewController)
  {
    objc_msgSend(v25, "lastObject");
    v18 = (MKPlaceInlineMapViewController *)objc_claimAutoreleasedReturnValue();
    v19 = self->_inlineMapViewController;

    if (v18 == v19)
      -[MKPlaceInlineMapViewController setBottomHairlineHidden:](self->_inlineMapViewController, "setBottomHairlineHidden:", 1);
    objc_msgSend(v25, "addObject:", self->_infoViewController);
  }
  if (!v13)
  {
    if (((objc_msgSend(v25, "containsObject:", v11) | v12) & 1) == 0)
    {
      objc_msgSend(v25, "lastObject");
      v20 = (MKPlaceInfoViewController *)objc_claimAutoreleasedReturnValue();
      v21 = self->_infoViewController;

      if (v20 == v21)
        -[MKPlaceInfoViewController setBottomHairlineHidden:](self->_infoViewController, "setBottomHairlineHidden:", 1);
      objc_msgSend(v25, "addObject:", v11);
    }
    if ((objc_msgSend(v25, "containsObject:", v11) & 1) == 0)
    {
      objc_msgSend(v11, "setShowsBottomHairline:", 1);
      objc_msgSend(v25, "addObject:", v11);
    }
  }
  -[_MKPlaceViewController attributionsVC](self, "attributionsVC");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
    objc_msgSend(v25, "addObject:", v22);
  -[_MKPlaceViewController createFooterActions](self, "createFooterActions");
  v23 = (MKPlaceCardFooterActionsViewController *)objc_claimAutoreleasedReturnValue();
  placeActionViewController = self->_placeActionViewController;
  self->_placeActionViewController = v23;

  if (self->_placeActionViewController)
    objc_msgSend(v25, "addObject:");

}

- (void)_createViewControllersForShortPlacecard:(id)a3
{
  MKPlaceCardFooterActionsViewController *v4;
  MKPlaceCardFooterActionsViewController *placeActionViewController;
  id v6;

  v6 = a3;
  if (self->_buttonsHeaderController)
    objc_msgSend(v6, "addObject:");
  -[_MKPlaceViewController createFooterActions](self, "createFooterActions");
  v4 = (MKPlaceCardFooterActionsViewController *)objc_claimAutoreleasedReturnValue();
  placeActionViewController = self->_placeActionViewController;
  self->_placeActionViewController = v4;

  if (self->_placeActionViewController)
    objc_msgSend(v6, "addObject:");

}

- (id)_createViewControllerForModule:(id)a3
{
  int v4;
  MKPlacePoisInlineMapViewController *v5;
  MKPlaceHeaderButtonsViewController *buttonsHeaderController;
  MKPlacePoisInlineMapViewController *v7;
  MKPlacePoisInlineMapViewController *poisInlineMapViewController;
  objc_class *v9;
  uint64_t v10;
  void *v11;

  v4 = objc_msgSend(a3, "type");
  v5 = 0;
  switch(v4)
  {
    case 2:
      buttonsHeaderController = self->_buttonsHeaderController;
      goto LABEL_13;
    case 3:
      -[_MKPlaceViewController poisInlineMapVC](self, "poisInlineMapVC");
      v7 = (MKPlacePoisInlineMapViewController *)objc_claimAutoreleasedReturnValue();
      poisInlineMapViewController = self->_poisInlineMapViewController;
      self->_poisInlineMapViewController = v7;

      v5 = self->_poisInlineMapViewController;
      if (v5)
        return v5;
      -[_MKPlaceViewController inlineMapVC](self, "inlineMapVC");
      v9 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v10 = 1176;
      goto LABEL_12;
    case 4:
      -[_MKPlaceViewController photoVC](self, "photoVC");
      v5 = (MKPlacePoisInlineMapViewController *)objc_claimAutoreleasedReturnValue();
      return v5;
    case 5:
      -[_MKPlaceViewController infosVC](self, "infosVC");
      v9 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v10 = 1168;
      goto LABEL_12;
    case 6:
    case 7:
    case 8:
      return v5;
    case 9:
      -[_MKPlaceViewController hoursVC](self, "hoursVC");
      v5 = (MKPlacePoisInlineMapViewController *)objc_claimAutoreleasedReturnValue();
      return v5;
    default:
      if (v4 == 23)
      {
        -[_MKPlaceViewController createFooterActions](self, "createFooterActions");
        v9 = (objc_class *)objc_claimAutoreleasedReturnValue();
        v10 = 1192;
LABEL_12:
        v11 = *(Class *)((char *)&self->super.super.super.super.super.isa + v10);
        *(Class *)((char *)&self->super.super.super.super.super.isa + v10) = v9;

        buttonsHeaderController = *(MKPlaceHeaderButtonsViewController **)((char *)&self->super.super.super.super.super.isa
                                                                         + v10);
LABEL_13:
        v5 = buttonsHeaderController;
      }
      else if (v4 == 24)
      {
        -[_MKPlaceViewController attributionsVC](self, "attributionsVC");
        v5 = (MKPlacePoisInlineMapViewController *)objc_claimAutoreleasedReturnValue();
      }
      return v5;
  }
}

- (int)_moduleTypeForViewController:(id)a3
{
  uint64_t v3;

  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
    return 1;
  if (v3 == objc_opt_class())
    return 2;
  if (v3 == objc_opt_class())
    return 4;
  if (v3 == objc_opt_class() || v3 == objc_opt_class())
    return 3;
  if (v3 == objc_opt_class())
    return 5;
  if (v3 == objc_opt_class())
    return 24;
  if (v3 == objc_opt_class())
    return 9;
  if (v3 == objc_opt_class())
    return 23;
  return 0;
}

- (id)createFooterActions
{
  MKPlaceCardFooterActionsViewController *v3;
  id WeakRetained;

  v3 = objc_alloc_init(MKPlaceCardFooterActionsViewController);
  -[MKPlaceCardActionsViewController setActionManager:](v3, "setActionManager:", self->_actionManager);
  WeakRetained = objc_loadWeakRetained((id *)&self->_placeViewControllerDelegate);
  -[MKPlaceCardActionsViewController setPlaceViewControllerDelegate:](v3, "setPlaceViewControllerDelegate:", WeakRetained);

  return v3;
}

- (id)collectionViews
{
  _MKPlaceViewControllerDelegate **p_placeViewControllerDelegate;
  id WeakRetained;
  char v5;
  id v6;
  void *v7;
  void *v8;

  p_placeViewControllerDelegate = &self->_placeViewControllerDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_placeViewControllerDelegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_placeViewControllerDelegate);
    -[_MKPlaceViewController placeItem](self, "placeItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "placeViewController:collectionViewsForPlaceItem:", self, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA70];
  }
  return v8;
}

- (void)collectionIdentifierSelected:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  id v7;

  v7 = a3;
  -[_MKPlaceViewController infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:](self, "infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:", 0, 0, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_placeViewControllerDelegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_placeViewControllerDelegate);
    objc_msgSend(v6, "placeViewController:selectCollectionIdentifier:", self, v7);

  }
}

- (BOOL)shouldDisplayBrowseCategoryVC
{
  return 0;
}

- (id)inlineMapVC
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (((-[_MKPlaceViewController options](self, "options") & 2) != 0
     || (-[_MKPlaceViewController options](self, "options") & 1) == 0)
    && (-[_MKPlaceViewController mapItem](self, "mapItem"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "_displayMapRegion"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    +[MKPlaceInlineMapViewControllerConfiguration configurationForPlaceViewControllerOptions:](MKPlaceInlineMapViewControllerConfiguration, "configurationForPlaceViewControllerOptions:", -[_MKPlaceViewController options](self, "options"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKPlaceViewController mapItem](self, "mapItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[MKPlaceInlineMapViewController inlineMapWithMapItem:configuration:](MKPlaceInlineMapViewController, "inlineMapWithMapItem:configuration:", v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setBottomHairlineHidden:", 1);
    objc_msgSend(v7, "setDelegate:", self);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)poisInlineMapVC
{
  void *v3;
  void *v4;
  void *v5;

  +[MKPlaceInlineMapViewControllerConfiguration configurationForPlaceViewControllerOptions:](MKPlaceInlineMapViewControllerConfiguration, "configurationForPlaceViewControllerOptions:", -[_MKPlaceViewController options](self, "options"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKPlaceViewController mapItem](self, "mapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKPlacePoisInlineMapViewController inlineMapWithMapItem:configuration:](MKPlacePoisInlineMapViewController, "inlineMapWithMapItem:configuration:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "setLocation:", self->_location);

  return v5;
}

- (id)photoVC
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  MKPlacePhotosViewController *v7;

  -[_MKPlaceViewController mapItem](self, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "place");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstBusiness");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "photosCount");

  if (v6)
  {
    v7 = -[MKPlacePhotosViewController initWithMapItem:mode:options:]([MKPlacePhotosViewController alloc], "initWithMapItem:mode:options:", v3, (-[_MKPlaceViewController options](self, "options") >> 8) & 2, 0);
    -[MKPlacePhotosViewController setPhotosControllerDelegate:](v7, "setPhotosControllerDelegate:", self);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)infosVC
{
  MKPlaceInfoViewController *v3;
  void *v4;
  MKPlaceInfoViewController *v5;

  v3 = [MKPlaceInfoViewController alloc];
  -[_MKPlaceViewController placeItem](self, "placeItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MKPlaceInfoViewController initWithPlaceItem:](v3, "initWithPlaceItem:", v4);

  -[MKPlaceInfoViewController setActionDelegate:](v5, "setActionDelegate:", self->_actionManager);
  -[MKPlaceInfoViewController setPlacecardOptions:](v5, "setPlacecardOptions:", self->_options);
  return v5;
}

- (id)hoursVC
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[_MKPlaceViewController mapItem](self, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_MKPlaceViewController mapItem](self, "mapItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[MKPlaceHoursViewController placeHoursWithMapItem:](MKPlaceHoursViewController, "placeHoursWithMapItem:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setAnalyticsDelegate:", self);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_viewControllerForClass:(Class)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[MKStackingViewController viewControllers](self, "viewControllers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = v8;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (id)attributionsVC
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  MKPlaceAttributionViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  -[_MKPlaceViewController mapItem](self, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "_needsAttribution"))
  {
    v8 = 0;
    goto LABEL_6;
  }
  -[_MKPlaceViewController mapItem](self, "mapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_attribution");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributionURLs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
    v8 = 0;
    return v8;
  }
  v8 = objc_alloc_init(MKPlaceAttributionViewController);
  -[_MKPlaceViewController mapItem](self, "mapItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceAttributionViewController setMapItem:](v8, "setMapItem:", v9);

  -[MKPlaceAttributionViewController setAnalyticsDelegate:](v8, "setAnalyticsDelegate:", self);
  -[_MKPlaceViewController mapItem](self, "mapItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_attribution");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "attributionURLs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    -[_MKPlaceViewController mapItem](self, "mapItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_attribution");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "attributionURLs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceAttributionViewController setUrlStrings:](v8, "setUrlStrings:", v16);

    -[_MKPlaceViewController mapItem](self, "mapItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_attribution");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceAttributionViewController setAttribution:](v8, "setAttribution:", v17);

LABEL_6:
  }
  return v8;
}

- (unint64_t)annotatedItemListDisplayStyle
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[_MKPlaceViewController mapItem](self, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_annotatedItemList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = displayStyleForAnnotatedItemList(v4, (-[_MKPlaceViewController options](self, "options") >> 23) & 1);
  else
    v5 = 0;

  return v5;
}

- (id)createMenuActions
{
  return -[MKPlaceActionManager createMenuActions](self->_actionManager, "createMenuActions");
}

- (void)performAction:(id)a3 options:(id)a4 completion:(id)a5
{
  -[MKPlaceActionManager performAction:options:completion:](self->_actionManager, "performAction:options:completion:", a3, a4, a5);
}

- (void)setPlaceViewControllerDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_placeViewControllerDelegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_placeViewControllerDelegate, obj);
    v5 = obj;
    if (self->_placeItem)
    {
      -[_MKPlaceViewController _updateViewControllers](self, "_updateViewControllers");
      v5 = obj;
    }
  }

}

- (void)setMapItem:(id)a3 contact:(id)a4 updateOriginalContact:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;

  v5 = a5;
  if (a4)
  {
    +[_MKContactPlaceItem placeItemWithMapItem:contact:options:](_MKContactPlaceItem, "placeItemWithMapItem:contact:options:", a3, a4, 16 * (a3 == 0));
  }
  else
  {
    v8 = a3;
    +[_MKMapItemPlaceItem placeItemWithMapItem:options:](_MKMapItemPlaceItem, "placeItemWithMapItem:options:", v8, objc_msgSend(v8, "isCurrentLocation"));
  }
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[_MKPlaceViewController setPlaceItem:updateOriginalContact:](self, "setPlaceItem:updateOriginalContact:", v9, v5);
}

- (void)setPlaceItem:(id)a3 updateOriginalContact:(BOOL)a4
{
  void *v4;
  _BOOL4 v5;
  void *v7;
  _MKPlaceItem **p_placeItem;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  MKMapItem *v14;
  void *v15;
  void *v16;
  char v17;
  char v18;
  void *v19;
  MKMapItem *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  _MKPlaceActionButtonController *headerSecondaryButtonController;
  _MKPlaceActionButtonController *headerAlternatePrimaryButtonController;
  CNContact *contact;
  _BOOL8 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  id obj;

  v5 = a4;
  obj = a3;
  objc_msgSend(obj, "mapItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  p_placeItem = &self->_placeItem;
  -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 != v9)
    goto LABEL_2;
  objc_msgSend(obj, "mapItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = obj;
  if (!v15)
  {
    objc_msgSend(obj, "contact");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKPlaceItem contact](*p_placeItem, "contact");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 != v37)
    {

      v9 = v7;
LABEL_2:

      goto LABEL_3;
    }
    v16 = obj;
  }
  v17 = objc_msgSend(v16, "isIntermediateMapItem");
  v18 = v17 ^ -[_MKPlaceItem isIntermediateMapItem](*p_placeItem, "isIntermediateMapItem");
  if (v15)
  {

  }
  else
  {

  }
  if ((v18 & 1) == 0)
    goto LABEL_25;
LABEL_3:
  +[MKMapItemMetadataRequester sharedInstance](MKMapItemMetadataRequester, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKPlaceItem mapItem](*p_placeItem, "mapItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cancelRequestsForMapItem:", v11);

  if (v5)
  {
    objc_msgSend(obj, "contact");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKPlaceViewController setOriginalContact:](self, "setOriginalContact:", v12);

  }
  objc_msgSend(obj, "mapItem");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (MKMapItem *)v13;
LABEL_12:

    goto LABEL_13;
  }
  objc_msgSend(obj, "contact");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = [MKMapItem alloc];
    objc_msgSend(obj, "contact");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[MKMapItem initWithContact:](v20, "initWithContact:", v21);

    objc_msgSend(obj, "contact");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[_MKContactPlaceItem placeItemWithMapItem:contact:options:](_MKContactPlaceItem, "placeItemWithMapItem:contact:options:", v14, v22, 16);
    v23 = objc_claimAutoreleasedReturnValue();

    obj = (id)v23;
    goto LABEL_12;
  }
LABEL_13:
  -[_MKPlaceItem mapItem](*p_placeItem, "mapItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKPlaceItem mapItem](*p_placeItem, "mapItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "removeObserver:name:object:", self, CFSTR("MKMapItemDidResolveAttribution"), v26);

  }
  headerSecondaryButtonController = self->_headerSecondaryButtonController;
  self->_headerSecondaryButtonController = 0;

  headerAlternatePrimaryButtonController = self->_headerAlternatePrimaryButtonController;
  self->_headerAlternatePrimaryButtonController = 0;

  contact = self->_contact;
  self->_contact = 0;

  objc_storeStrong((id *)&self->_placeItem, obj);
  -[MKPlaceItemActionDataProvider updateWithPlaceItem:options:](self->_actionDataProvider, "updateWithPlaceItem:options:", *p_placeItem, self->_options);
  -[_MKPlaceViewController setPlaceInCollections:](self, "setPlaceInCollections:", 0);
  -[_MKPlaceViewController setPlaceInShortcuts:](self, "setPlaceInShortcuts:", 0);
  v30 = -[_MKPlaceViewController _shouldShowContactActions](self, "_shouldShowContactActions");
  self->_showContactActions = v30;
  -[MKPlaceActionManager setShowContactActions:](self->_actionManager, "setShowContactActions:", v30);
  -[_MKPlaceItem mapItem](*p_placeItem, "mapItem");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKPlaceItem mapItem](*p_placeItem, "mapItem");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObserver:selector:name:object:", self, sel__didResolveAttribution_, CFSTR("MKMapItemDidResolveAttribution"), v33);

  }
  -[MKStackingViewController scrollToTopAnimated:](self, "scrollToTopAnimated:", 0);
  -[_MKPlaceViewController _updateViewControllers](self, "_updateViewControllers");
  if (*p_placeItem)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "bundleIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "isEqualToString:", *MEMORY[0x1E0D26D08]);

      if (v36)
        -[_MKPlaceViewController infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:](self, "infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:", 21, 0, 0);
    }
  }
LABEL_25:

}

- (BOOL)inlineMapViewControllerDidSelectMap:(id)a3
{
  void *v4;
  char v5;
  void *v6;

  -[_MKPlaceViewController infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:actionRichProviderId:](self, "infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:actionRichProviderId:", 6007, 0, 0, 0);
  -[_MKPlaceViewController placeViewControllerDelegate](self, "placeViewControllerDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[_MKPlaceViewController placeViewControllerDelegate](self, "placeViewControllerDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "placeViewControllerDidSelectInlineMap:", self);

  }
  return v5 & 1;
}

- (void)setPlaceItem:(id)a3
{
  -[_MKPlaceViewController setPlaceItem:updateOriginalContact:](self, "setPlaceItem:updateOriginalContact:", a3, 0);
}

- (MKMapItem)mapItem
{
  return (MKMapItem *)-[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
}

- (void)setMapItem:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v4 = a3;
  MKGetPlaceCardLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B0B0000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SetMapItem", (const char *)&unk_18B2CC343, buf, 2u);
  }

  if (v4)
    objc_msgSend(v4, "_placeCardContact");
  else
    -[_MKPlaceItem contact](self->_placeItem, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKPlaceViewController setMapItem:contact:updateOriginalContact:](self, "setMapItem:contact:updateOriginalContact:", v4, v6, 0);

  MKGetPlaceCardLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_18B0B0000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SetMapItem", (const char *)&unk_18B2CC343, v8, 2u);
  }

}

- (void)setPlaceInBookmarks:(BOOL)a3
{
  self->_placeInBookmarks = a3;
  -[MKPlaceActionManager setPlaceInBookmarks:](self->_actionManager, "setPlaceInBookmarks:");
}

- (void)setPlaceInCollections:(BOOL)a3
{
  self->_placeInCollections = a3;
  -[MKPlaceActionManager setPlaceInCollections:](self->_actionManager, "setPlaceInCollections:");
}

- (void)setPlaceInShortcuts:(BOOL)a3
{
  self->_placeInShortcuts = a3;
  -[MKPlaceActionManager setPlaceInShortcuts:](self->_actionManager, "setPlaceInShortcuts:");
}

- (void)setAutomobileOptions:(id)a3
{
  GEOAutomobileOptions *v5;
  GEOAutomobileOptions *v6;

  v5 = (GEOAutomobileOptions *)a3;
  if (self->_automobileOptions != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_automobileOptions, a3);
    -[MKETAProvider setAutomobileOptions:](self->_etaProvider, "setAutomobileOptions:", self->_automobileOptions);
    v5 = v6;
  }

}

- (void)setWalkingOptions:(id)a3
{
  GEOWalkingOptions *v5;
  GEOWalkingOptions *v6;

  v5 = (GEOWalkingOptions *)a3;
  if (self->_walkingOptions != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_walkingOptions, a3);
    -[MKETAProvider setWalkingOptions:](self->_etaProvider, "setWalkingOptions:", self->_walkingOptions);
    v5 = v6;
  }

}

- (void)setTransitOptions:(id)a3
{
  GEOTransitOptions *v5;
  GEOTransitOptions *v6;

  v5 = (GEOTransitOptions *)a3;
  if (self->_transitOptions != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_transitOptions, a3);
    -[MKETAProvider setTransitOptions:](self->_etaProvider, "setTransitOptions:", self->_transitOptions);
    v5 = v6;
  }

}

- (void)setCyclingOptions:(id)a3
{
  GEOCyclingOptions *v5;
  GEOCyclingOptions *v6;

  v5 = (GEOCyclingOptions *)a3;
  if (self->_cyclingOptions != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_cyclingOptions, a3);
    -[MKETAProvider setCyclingOptions:](self->_etaProvider, "setCyclingOptions:", self->_cyclingOptions);
    v5 = v6;
  }

}

- (_MKPlaceActionButtonController)headerSecondaryButtonController
{
  return self->_headerSecondaryButtonController;
}

- (void)setHeaderSecondaryButtonController:(id)a3
{
  _MKPlaceActionButtonController *v5;
  _MKPlaceActionButtonController *v6;

  v5 = (_MKPlaceActionButtonController *)a3;
  if (self->_headerSecondaryButtonController != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_headerSecondaryButtonController, a3);
    -[MKPlaceHeaderButtonsViewController setSecondaryButtonController:](self->_buttonsHeaderController, "setSecondaryButtonController:", self->_headerSecondaryButtonController);
    v5 = v6;
  }

}

- (void)setHeaderAlternatePrimaryButtonController:(id)a3
{
  _MKPlaceActionButtonController *v5;
  _MKPlaceActionButtonController *v6;

  v5 = (_MKPlaceActionButtonController *)a3;
  if (self->_headerAlternatePrimaryButtonController != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_headerAlternatePrimaryButtonController, a3);
    -[MKPlaceHeaderButtonsViewController setAlternatePrimaryButtonController:](self->_buttonsHeaderController, "setAlternatePrimaryButtonController:", self->_headerAlternatePrimaryButtonController);
    v5 = v6;
  }

}

- (void)setShowContactActions:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;

  v3 = a3;
  v5 = -[_MKPlaceViewController showContactActions](self, "showContactActions");
  if (self->_showContactActions != v3)
  {
    self->_showContactActions = v3;
    if (v5 != -[_MKPlaceViewController showContactActions](self, "showContactActions"))
    {
      if (self->_placeItem)
      {
        -[MKPlaceActionManager setShowContactActions:](self->_actionManager, "setShowContactActions:", self->_showContactActions);
        -[MKPlaceCardFooterActionsViewController reloadData](self->_placeActionViewController, "reloadData");
      }
    }
  }
}

- (void)setOptions:(unint64_t)a3
{
  if (self->_options != a3)
  {
    self->_options = a3;
    -[MKPlaceItemActionDataProvider updateWithPlaceItem:options:](self->_actionDataProvider, "updateWithPlaceItem:options:", self->_placeItem, a3);
    if (self->_placeItem)
      -[_MKPlaceViewController _updateViewControllers](self, "_updateViewControllers");
  }
}

- (id)additionalViewControllersAtPosition:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[_MKPlaceViewController _mapTableKeyForSectionPosition:](self, "_mapTableKeyForSectionPosition:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_additionalViewControllers, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_mapTableKeyForSectionPosition:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
}

- (int64_t)_sectionPositionForMapTableKey:(id)a3
{
  return objc_msgSend(a3, "integerValue");
}

- (void)addAdditionalViewController:(id)a3 atPosition:(int64_t)a4
{
  id v6;
  NSMapTable *v7;
  NSMapTable *additionalViewControllers;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSMapTable *v22;
  id v23;
  void *v24;
  void *v25;
  int64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!self->_additionalViewControllers)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v7 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    additionalViewControllers = self->_additionalViewControllers;
    self->_additionalViewControllers = v7;

  }
  v26 = a4;
  -[_MKPlaceViewController _mapTableKeyForSectionPosition:](self, "_mapTableKeyForSectionPosition:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[NSMapTable keyEnumerator](self->_additionalViewControllers, "keyEnumerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  v27 = v9;
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_additionalViewControllers, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "containsObject:", v6))
        {
          if ((objc_msgSend(v15, "isEqual:", v9) & 1) != 0)
            goto LABEL_18;
          v17 = (void *)MEMORY[0x1E0C99DA0];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ has already been added to another section"), v6);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "exceptionWithName:reason:userInfo:", CFSTR("Can't add same view controller to 2 sections"), v18, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v9 = v27;
          objc_msgSend(v19, "raise");

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v12);
  }

  -[NSMapTable objectForKey:](self->_additionalViewControllers, "objectForKey:", v9);
  v20 = v9;
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    v22 = self->_additionalViewControllers;
    v23 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    -[NSMapTable setObject:forKey:](v22, "setObject:forKey:", v23, v20);

  }
  -[NSMapTable objectForKey:](self->_additionalViewControllers, "objectForKey:", v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v6);
  v24 = (void *)MEMORY[0x1E0C99DE8];
  -[MKStackingViewController viewControllers](self, "viewControllers");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "arrayWithArray:", v25);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
    objc_msgSend(v16, "insertObject:atIndex:", v6, objc_msgSend(v10, "count") - 1);
  -[MKStackingViewController setViewControllers:](self, "setViewControllers:", v16);
  v9 = v27;
LABEL_18:

}

- (void)removeAdditionalViewController:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMapTable keyEnumerator](self->_additionalViewControllers, "keyEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        -[NSMapTable objectForKey:](self->_additionalViewControllers, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "containsObject:", v4))
        {
          objc_msgSend(v10, "removeObject:", v4);
          v11 = (void *)MEMORY[0x1E0C99DE8];
          -[MKStackingViewController viewControllers](self, "viewControllers");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "arrayWithArray:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "removeObject:", v4);
          -[MKStackingViewController setViewControllers:](self, "setViewControllers:", v13);

          goto LABEL_11;
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

}

- (id)stackingViewController:(id)a3 scrollViewForViewController:(id)a4
{
  return (id)objc_msgSend(a4, "tableView", a3);
}

- (double)stackingViewController:(id)a3 minimumVisibleSurfacePercentForAnalyticsSelection:(id)a4
{
  return 0.75;
}

- (BOOL)stackingViewController:(id)a3 showsTitleForViewController:(id)a4
{
  id v4;
  char isKindOfClass;

  v4 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (double)stackingViewController:(id)a3 heightForSeparatorBetweenUpperViewController:(id)a4 andLowerViewController:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t *v10;
  double v11;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v8)
  {
    objc_opt_class();
    v10 = &kStackingViewSeparatorHeightNone;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v10 = (uint64_t *)&kStackingViewSeparatorHeightLarge;
      }
      else
      {
        v10 = &kStackingViewSeparatorHeightSmall;
      }
    }
  }
  else
  {
    v10 = &kStackingViewSeparatorHeightNone;
  }
  v11 = *(double *)v10;

  return v11;
}

- (void)placeCardPhotosController:(id)a3 didSelectViewPhotoWithID:(id)a4 presentingViewController:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v7 = a5;
  -[_MKPlaceViewController mapItem](self, "mapItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "length"))
  {
    objc_msgSend(v8, "_mapkit_preferredFirstPhotoVendor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "urlsForPhotoWithIdentifier:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKPlaceViewController placeViewFeedbackAppLaunchHandler](self, "placeViewFeedbackAppLaunchHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKPlaceViewController _launchAttributionURLs:withAttribution:mapItem:completionHandler:](self, "_launchAttributionURLs:withAttribution:mapItem:completionHandler:", v10, v9, v8, v11);

  }
  else
  {
    -[_MKPlaceViewController placeCardActionControllerDidSelectViewAllPhotos:presentingViewController:](self, "placeCardActionControllerDidSelectViewAllPhotos:presentingViewController:", 0, v7);
  }

}

- (void)placeActionManager:(id)a3 didSelectShareFromView:(id)a4
{
  -[_MKPlaceViewController _showShareSheet:](self, "_showShareSheet:", a4);
}

- (void)_presentViewControllerWithInterfaceStyleCheck:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  -[_MKPlaceViewController placeViewControllerDelegate](self, "placeViewControllerDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[_MKPlaceViewController placeViewControllerDelegate](self, "placeViewControllerDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "overriddenInterfaceStyleForPlaceViewControllerSubviews:", self);

    objc_msgSend(v8, "setOverrideUserInterfaceStyle:", v7);
  }
  -[_MKPlaceViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);

}

- (void)updateHeaderTitle
{
  MKPlaceCardHeaderViewController *headerViewController;

  headerViewController = self->_headerViewController;
  if (headerViewController)
    -[MKPlaceCardHeaderViewController updateHeaderTitle](headerViewController, "updateHeaderTitle");
}

- (id)_traits
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[_MKPlaceViewController placeViewControllerDelegate](self, "placeViewControllerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[_MKPlaceViewController placeViewControllerDelegate](self, "placeViewControllerDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "traitsForPlaceViewController:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (double)placeCardHeaderViewControllerTrailingConstantForTitle:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  double v7;
  double v8;

  -[_MKPlaceViewController placeViewControllerDelegate](self, "placeViewControllerDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
    return 0.0;
  -[_MKPlaceViewController placeViewControllerDelegate](self, "placeViewControllerDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "placeViewControllerPlaceCardHeaderTitleTrailingConstant:", self);
  v8 = v7;

  return v8;
}

- (void)placeHeaderButtonsViewController:(id)a3 didSelectPrimaryType:(unint64_t)a4 withView:(id)a5
{
  id v8;
  id v9;
  _MKPlaceViewController *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, int);
  void *v27;
  _MKPlaceViewController *v28;
  id v29;
  _QWORD v30[5];
  const __CFString *v31;
  const __CFString *v32;
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  switch(a4)
  {
    case 1uLL:
    case 4uLL:
      v10 = self;
      v11 = 6003;
      v12 = 12;
      goto LABEL_4;
    case 2uLL:
      v10 = self;
      v11 = 3001;
      v12 = 0;
LABEL_4:
      -[_MKPlaceViewController infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:](v10, "infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:", v11, 0, v12);
      -[_MKPlaceViewController placeViewControllerDelegate](self, "placeViewControllerDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_opt_respondsToSelector();

      if ((v14 & 1) != 0)
      {
        -[_MKPlaceViewController placeViewControllerDelegate](self, "placeViewControllerDelegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKETAProvider transportTypePreferenceNumber](self->_etaProvider, "transportTypePreferenceNumber");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "placeViewController:didSelectRouteToCurrentSearchResultWithTransportTypePreference:", self, v16);
      }
      else
      {
        -[_MKPlaceViewController mapItem](self, "mapItem");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
          goto LABEL_16;
        if ((self->_options & 0x100000000) == 0)
        {
          +[MKMapItem mapItemForCurrentLocation](MKMapItem, "mapItemForCurrentLocation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v33[0] = v15;
          -[_MKPlaceViewController mapItem](self, "mapItem");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v33[1] = v18;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = CFSTR("MKLaunchOptionsDirectionsMode");
          v32 = CFSTR("MKLaunchOptionsDirectionsModeDefault");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[MKMapItem openMapsWithItems:launchOptions:completionHandler:](MKMapItem, "openMapsWithItems:launchOptions:completionHandler:", v19, v20, &__block_literal_global_91);

          goto LABEL_15;
        }
        -[_MKPlaceViewController mapItem](self, "mapItem");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = CFSTR("_MKLaunchOptionsSearchAlongRouteKey");
        v34[1] = CFSTR("MKLaunchOptionsSelectedIndex");
        v35[0] = MEMORY[0x1E0C9AAB0];
        v35[1] = &unk_1E2158770;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __89___MKPlaceViewController_placeHeaderButtonsViewController_didSelectPrimaryType_withView___block_invoke;
        v30[3] = &unk_1E20D82F8;
        v30[4] = self;
        objc_msgSend(v15, "openInMapsWithLaunchOptions:completionHandler:", v16, v30);
      }

LABEL_15:
LABEL_16:

      return;
    case 3uLL:
      -[_MKPlaceViewController placeViewControllerDelegate](self, "placeViewControllerDelegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_opt_respondsToSelector();

      if ((v22 & 1) != 0)
      {
        -[_MKPlaceViewController placeViewControllerDelegate](self, "placeViewControllerDelegate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = MEMORY[0x1E0C809B0];
        v25 = 3221225472;
        v26 = __89___MKPlaceViewController_placeHeaderButtonsViewController_didSelectPrimaryType_withView___block_invoke_2;
        v27 = &unk_1E20D8578;
        v28 = self;
        v29 = v9;
        objc_msgSend(v23, "placeViewController:didSelectShareCurrentLocationWithCompletion:", self, &v24);

      }
      else
      {
        -[_MKPlaceViewController _showShareSheet:](self, "_showShareSheet:", v9);
      }
      -[_MKPlaceViewController infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:](self, "infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:", 57, 0, 6, v24, v25, v26, v27, v28);
      goto LABEL_16;
    default:
      goto LABEL_16;
  }
}

- (void)ETAProviderLocationUpdated:(id)a3
{
  id v4;

  objc_msgSend(a3, "currentLocation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_MKPlaceViewController setLocation:](self, "setLocation:", v4);

}

- (int)mapTypeForETAProvider:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  int v7;

  -[_MKPlaceViewController placeViewControllerDelegate](self, "placeViewControllerDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
    return 0;
  -[_MKPlaceViewController placeViewControllerDelegate](self, "placeViewControllerDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "mapTypeForPlaceViewController:", self);

  return v7;
}

- (double)contentAlpha
{
  return self->_contentAlpha;
}

- (void)setContentAlpha:(double)a3
{
  self->_contentAlpha = a3;
  -[_MKPlaceViewController updateContentAlpha](self, "updateContentAlpha");
}

- (void)updateContentAlpha
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[MKStackingViewController viewControllers](self, "viewControllers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setContentAlpha:", self->_contentAlpha);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)setContentVisibility:(int64_t)a3
{
  void *v4;
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

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[MKStackingViewController viewControllers](self, "viewControllers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setContentVisibility:", a3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (double)headerSecondaryNameLabelPadding
{
  double result;

  -[MKPlaceCardHeaderViewController secondaryNameLabelPadding](self->_headerViewController, "secondaryNameLabelPadding");
  return result;
}

- (void)placeCardActionControllerDidSelectReportAProblem:(id)a3 fromView:(id)a4 isQuickAction:(BOOL)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[_MKPlaceViewController mapItem](self, "mapItem", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (-[_MKPlaceViewController _showReportAProblem](self, "_showReportAProblem"))
    {
      +[MKMapService sharedService](MKMapService, "sharedService");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKPlaceViewController mapItem](self, "mapItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "captureUserAction:onTarget:eventValue:mapItem:timestamp:resultIndex:", 17105, 0, 0, v8, 0xFFFFFFFFLL, 0.0);

      -[_MKPlaceViewController mapItem](self, "mapItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("MKLaunchOptionsLaunchIntoRAP");
      v13 = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[MKMapItem openMapsWithItems:launchOptions:completionHandler:](MKMapItem, "openMapsWithItems:launchOptions:completionHandler:", v10, v11, 0);

    }
  }
}

- (void)placeCardActionControllerDidSelectAddPhoto:(id)a3 presentingViewController:(id)a4 sourceView:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[_MKPlaceViewController mapItem](self, "mapItem", a3, a4, a5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_mapkit_preferredFirstPhotoVendor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addPhotoURLs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKPlaceViewController placeViewFeedbackAppLaunchHandler](self, "placeViewFeedbackAppLaunchHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKPlaceViewController _launchAttributionURLs:withAttribution:mapItem:completionHandler:](self, "_launchAttributionURLs:withAttribution:mapItem:completionHandler:", v7, v6, v9, v8);

}

- (void)placeCardActionControllerDidSelectViewAllPhotos:(id)a3 presentingViewController:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[_MKPlaceViewController mapItem](self, "mapItem", a3, a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_mapkit_preferredFirstPhotoVendor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributionURLs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKPlaceViewController placeViewFeedbackAppLaunchHandler](self, "placeViewFeedbackAppLaunchHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKPlaceViewController _launchAttributionURLs:withAttribution:mapItem:completionHandler:](self, "_launchAttributionURLs:withAttribution:mapItem:completionHandler:", v6, v5, v8, v7);

}

- (void)_launchAttributionURLs:(id)a3 withAttribution:(id)a4 mapItem:(id)a5 completionHandler:(id)a6
{
  objc_msgSend(a3, "count");
}

- (OS_dispatch_queue)analyticsQueue
{
  OS_dispatch_queue *analyticsQueue;
  NSObject *v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *v6;

  analyticsQueue = self->_analyticsQueue;
  if (!analyticsQueue)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, -1);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.MapKit.PlaceViewController.Analytics", v4);
    v6 = self->_analyticsQueue;
    self->_analyticsQueue = v5;

    analyticsQueue = self->_analyticsQueue;
  }
  return analyticsQueue;
}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 eventValue:(id)a4 feedbackDelegateSelector:(int)a5
{
  -[_MKPlaceViewController infoCardAnalyticsDidSelectAction:target:eventValue:feedbackDelegateSelector:actionRichProviderId:](self, "infoCardAnalyticsDidSelectAction:target:eventValue:feedbackDelegateSelector:actionRichProviderId:", *(_QWORD *)&a3, 201, a4, *(_QWORD *)&a5, 0);
}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 eventValue:(id)a4 feedbackDelegateSelector:(int)a5 actionRichProviderId:(id)a6
{
  -[_MKPlaceViewController infoCardAnalyticsDidSelectAction:target:eventValue:feedbackDelegateSelector:actionRichProviderId:](self, "infoCardAnalyticsDidSelectAction:target:eventValue:feedbackDelegateSelector:actionRichProviderId:", *(_QWORD *)&a3, 201, a4, *(_QWORD *)&a5, a6);
}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 feedbackDelegateSelector:(int)a6 actionRichProviderId:(id)a7
{
  -[_MKPlaceViewController infoCardAnalyticsDidSelectAction:target:eventValue:actionURL:photoID:feedbackDelegateSelector:actionRichProviderId:](self, "infoCardAnalyticsDidSelectAction:target:eventValue:actionURL:photoID:feedbackDelegateSelector:actionRichProviderId:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5, 0, 0, *(_QWORD *)&a6, a7);
}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 actionURL:(id)a6 photoID:(id)a7 feedbackDelegateSelector:(int)a8 actionRichProviderId:(id)a9
{
  uint64_t v9;

  LODWORD(v9) = a8;
  -[_MKPlaceViewController infoCardAnalyticsDidSelectAction:target:eventValue:actionURL:photoID:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:](self, "infoCardAnalyticsDidSelectAction:target:eventValue:actionURL:photoID:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5, a6, a7, 0, v9, a9);
}

- (void)infoCardTransitAnalyticsDidSelectionAction:(int)a3 resultIndex:(int64_t)a4 targetID:(unint64_t)a5 transitSystem:(id)a6 transitDepartureSequence:(id)a7 transitCardCategory:(int)a8 transitIncident:(id)a9 feedbackDelegateSelector:(int)a10
{
  id v15;
  id v16;
  id v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  CFAbsoluteTime Current;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD block[4];
  id v30;
  id v31;
  id v32;
  id v33;
  CFAbsoluteTime v34;
  int64_t v35;
  unint64_t v36;
  int v37;
  int v38;

  v15 = a6;
  v16 = a7;
  v17 = a9;
  -[_MKPlaceViewController placeViewFeedbackDelegate](self, "placeViewFeedbackDelegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_respondsToSelector();

  if (a10 && (v19 & 1) != 0)
  {
    -[_MKPlaceViewController placeViewFeedbackDelegate](self, "placeViewFeedbackDelegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "placeViewController:shouldLogFeedbackOfType:", self, a10);

  }
  -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  Current = CFAbsoluteTimeGetCurrent();
  -[_MKPlaceViewController analyticsQueue](self, "analyticsQueue");
  v23 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __190___MKPlaceViewController_infoCardTransitAnalyticsDidSelectionAction_resultIndex_targetID_transitSystem_transitDepartureSequence_transitCardCategory_transitIncident_feedbackDelegateSelector___block_invoke;
  block[3] = &unk_1E20D9788;
  v34 = Current;
  v35 = a4;
  v36 = a5;
  v37 = a3;
  v38 = a8;
  v30 = v21;
  v31 = v15;
  v32 = v16;
  v33 = v17;
  v24 = v17;
  v25 = v16;
  v26 = v15;
  v27 = v21;
  dispatch_async(v23, block);

}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 actionURL:(id)a6 photoID:(id)a7 moduleMetadata:(id)a8 feedbackDelegateSelector:(int)a9 actionRichProviderId:(id)a10
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  CFAbsoluteTime Current;
  int v24;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD block[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  CFAbsoluteTime v43;
  int v44;
  int v45;
  int v46;

  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = a10;
  -[_MKPlaceViewController placeViewFeedbackDelegate](self, "placeViewFeedbackDelegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_respondsToSelector();

  if (a9 && (v18 & 1) != 0)
  {
    -[_MKPlaceViewController placeViewFeedbackDelegate](self, "placeViewFeedbackDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "placeViewController:shouldLogFeedbackOfType:", self, a9);

  }
  -[_MKPlaceViewController generateAvailableActionForAnalytics](self, "generateAvailableActionForAnalytics");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKPlaceViewController generateUnactionableUIElementsForAnalytics](self, "generateUnactionableUIElementsForAnalytics");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  Current = CFAbsoluteTimeGetCurrent();
  v24 = -[_MKPlaceViewController getPlaceCardTypeForAnalytics](self, "getPlaceCardTypeForAnalytics");
  -[_MKPlaceViewController analyticsQueue](self, "analyticsQueue");
  v25 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __156___MKPlaceViewController_infoCardAnalyticsDidSelectAction_target_eventValue_actionURL_photoID_moduleMetadata_feedbackDelegateSelector_actionRichProviderId___block_invoke;
  block[3] = &unk_1E20D97B0;
  v44 = a3;
  v45 = a4;
  v36 = v13;
  v37 = v22;
  v43 = Current;
  v38 = v14;
  v39 = v15;
  v46 = v24;
  v40 = v20;
  v41 = v21;
  v42 = v16;
  v26 = v16;
  v27 = v21;
  v28 = v20;
  v29 = v15;
  v30 = v14;
  v31 = v22;
  v32 = v13;
  dispatch_async(v25, block);

}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 moduleMetadata:(id)a6 feedbackDelegateSelector:(int)a7 actionRichProviderId:(id)a8
{
  uint64_t v8;

  LODWORD(v8) = a7;
  -[_MKPlaceViewController infoCardAnalyticsDidSelectAction:target:eventValue:actionURL:photoID:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:](self, "infoCardAnalyticsDidSelectAction:target:eventValue:actionURL:photoID:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5, 0, 0, a6, v8, a8);
}

- (int)getPlaceCardTypeForAnalytics
{
  void *v3;
  char v4;
  int v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  _BOOL4 v10;
  void *v11;
  void *v12;

  -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_hasFlyover");

  if ((v4 & 1) != 0)
    return 9;
  if (-[MKPlaceHeaderButtonsViewController primaryButtonType](self->_buttonsHeaderController, "primaryButtonType") == 2)
    return 10;
  -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_hasTransit");

  if ((v7 & 1) != 0)
    return 7;
  if ((-[_MKPlaceItem options](self->_placeItem, "options") & 1) != 0)
    return 5;
  if ((-[_MKPlaceItem options](self->_placeItem, "options") & 2) != 0)
    return 3;
  -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_isMapItemTypeBrand");

  if ((v9 & 1) != 0)
    return 11;
  v10 = -[_MKPlaceViewController shouldDisplayBrowseCategoryVC](self, "shouldDisplayBrowseCategoryVC");
  -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    v5 = objc_msgSend(v11, "_browseCategory_placeCardType");
  }
  else if (objc_msgSend(v11, "_hasMUID"))
  {
    v5 = 2;
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (id)generateAvailableActionForAnalytics
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[MKStackingViewController viewControllers](self, "viewControllers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EDFE71C8))
        {
          objc_msgSend(v9, "infoCardChildPossibleActions");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "count"))
            objc_msgSend(v3, "addObjectsFromArray:", v10);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)generateUnactionableUIElementsForAnalytics
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[MKStackingViewController viewControllers](self, "viewControllers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EDFE71C8))
        {
          objc_msgSend(v9, "infoCardChildUnactionableUIElements");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "count"))
            objc_msgSend(v3, "addObjectsFromArray:", v10);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)placeCardWillCloseFromClientType:(unint64_t)a3
{
  unsigned int v3;
  uint64_t v4;

  if (a3 == 3)
    v3 = 701;
  else
    v3 = 0;
  if (a3 == 2)
    v4 = 702;
  else
    v4 = v3;
  -[_MKPlaceViewController infoCardAnalyticsDidSelectAction:target:eventValue:feedbackDelegateSelector:actionRichProviderId:](self, "infoCardAnalyticsDidSelectAction:target:eventValue:feedbackDelegateSelector:actionRichProviderId:", 4, v4, 0, 0, 0);
}

- (int)currentUITargetForAnalytics
{
  return 201;
}

- (int)currentMapViewTargetForAnalytics
{
  return 501;
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (void)setHeaderTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1272);
}

- (BOOL)hasCheckedDistanceAvailability
{
  return self->_hasCheckedDistanceAvailability;
}

- (void)setHasCheckedDistanceAvailability:(BOOL)a3
{
  self->_hasCheckedDistanceAvailability = a3;
}

- (_MKPlaceItem)placeItem
{
  return self->_placeItem;
}

- (CNContact)originalContact
{
  return self->_originalContact;
}

- (void)setOriginalContact:(id)a3
{
  objc_storeStrong((id *)&self->_originalContact, a3);
}

- (_MKPlaceViewControllerDelegate)placeViewControllerDelegate
{
  return (_MKPlaceViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_placeViewControllerDelegate);
}

- (_MKPlaceViewControllerFeedbackDelegate)placeViewFeedbackDelegate
{
  return (_MKPlaceViewControllerFeedbackDelegate *)objc_loadWeakRetained((id *)&self->_placeViewFeedbackDelegate);
}

- (void)setPlaceViewFeedbackDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_placeViewFeedbackDelegate, a3);
}

- (id)placeViewFeedbackAppLaunchHandler
{
  return self->_placeViewFeedbackAppLaunchHandler;
}

- (void)setPlaceViewFeedbackAppLaunchHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1320);
}

- (unint64_t)options
{
  return self->_options;
}

- (double)headerHeight
{
  return self->headerHeight;
}

- (void)setHeaderHeight:(double)a3
{
  self->headerHeight = a3;
}

- (BOOL)placeInBookmarks
{
  return self->_placeInBookmarks;
}

- (GEOAutomobileOptions)automobileOptions
{
  return self->_automobileOptions;
}

- (GEOWalkingOptions)walkingOptions
{
  return self->_walkingOptions;
}

- (GEOTransitOptions)transitOptions
{
  return self->_transitOptions;
}

- (GEOCyclingOptions)cyclingOptions
{
  return self->_cyclingOptions;
}

- (BOOL)placeInCollections
{
  return self->_placeInCollections;
}

- (BOOL)placeInShortcuts
{
  return self->_placeInShortcuts;
}

- (BOOL)showContactActions
{
  return self->_showContactActions;
}

- (CNContactViewControllerPrivateDelegate)contactsNavigationController
{
  return (CNContactViewControllerPrivateDelegate *)objc_loadWeakRetained((id *)&self->_contactsNavigationController);
}

- (void)setContactsNavigationController:(id)a3
{
  objc_storeWeak((id *)&self->_contactsNavigationController, a3);
}

- (_MKPlaceActionButtonController)headerAlternatePrimaryButtonController
{
  return self->_headerAlternatePrimaryButtonController;
}

- (NSMutableArray)viewDidAppearBlocks
{
  return self->_viewDidAppearBlocks;
}

- (void)setViewDidAppearBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_viewDidAppearBlocks, a3);
}

- (CLLocation)location
{
  return self->_location;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_analyticsQueue, 0);
  objc_storeStrong((id *)&self->_viewDidAppearBlocks, 0);
  objc_storeStrong((id *)&self->_headerAlternatePrimaryButtonController, 0);
  objc_storeStrong((id *)&self->_headerSecondaryButtonController, 0);
  objc_destroyWeak((id *)&self->_contactsNavigationController);
  objc_storeStrong((id *)&self->_cyclingOptions, 0);
  objc_storeStrong((id *)&self->_transitOptions, 0);
  objc_storeStrong((id *)&self->_walkingOptions, 0);
  objc_storeStrong((id *)&self->_automobileOptions, 0);
  objc_storeStrong(&self->_placeViewFeedbackAppLaunchHandler, 0);
  objc_destroyWeak((id *)&self->_placeViewFeedbackDelegate);
  objc_destroyWeak((id *)&self->_placeViewControllerDelegate);
  objc_storeStrong((id *)&self->_originalContact, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_placeItem, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_storeStrong((id *)&self->_additionalViewControllers, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_etaProvider, 0);
  objc_storeStrong((id *)&self->_placeActionViewController, 0);
  objc_storeStrong((id *)&self->_poisInlineMapViewController, 0);
  objc_storeStrong((id *)&self->_inlineMapViewController, 0);
  objc_storeStrong((id *)&self->_infoViewController, 0);
  objc_storeStrong((id *)&self->_buttonsHeaderController, 0);
  objc_storeStrong((id *)&self->_headerViewController, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_storeStrong((id *)&self->_actionDataProvider, 0);
}

@end
