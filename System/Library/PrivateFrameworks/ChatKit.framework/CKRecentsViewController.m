@implementation CKRecentsViewController

- (CKRecentsViewController)initWithBalloonPlugin:(id)a3
{
  return -[CKRecentsViewController initWithBalloonPlugin:dataSource:](self, "initWithBalloonPlugin:dataSource:", a3, 0);
}

- (CKRecentsViewController)initWithBalloonPlugin:(id)a3 dataSource:(id)a4
{
  CKRecentsViewController *v4;
  CKRecentsViewController *v5;
  NSMutableArray *recentItems;
  NSMutableDictionary *v7;
  NSMutableDictionary *stickerCache;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKRecentsViewController;
  v4 = -[CKBrowserViewController initWithBalloonPlugin:dataSource:](&v11, sel_initWithBalloonPlugin_dataSource_, a3, a4);
  v5 = v4;
  if (v4)
  {
    recentItems = v4->_recentItems;
    v4->_recentItems = 0;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    stickerCache = v5->_stickerCache;
    v5->_stickerCache = v7;

    v5->_isLoadingRecents = 0;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)_RecentsUpdated, (CFStringRef)*MEMORY[0x1E0D39C30], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    -[CKRecentsViewController loadRecents](v5, "loadRecents");
  }
  return v5;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  +[CKPreviewDispatchCache _invalidateStickerPreviewCache](CKPreviewDispatchCache, "_invalidateStickerPreviewCache");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E0D39C30], 0);
  v4.receiver = self;
  v4.super_class = (Class)CKRecentsViewController;
  -[CKRecentsViewController dealloc](&v4, sel_dealloc);
}

- (void)loadRecents
{
  _QWORD v3[4];
  id v4;
  id location;

  if (!-[CKRecentsViewController isLoadingRecents](self, "isLoadingRecents"))
  {
    -[CKRecentsViewController setIsLoadingRecents:](self, "setIsLoadingRecents:", 1);
    location = 0;
    objc_initWeak(&location, self);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __38__CKRecentsViewController_loadRecents__block_invoke;
    v3[3] = &unk_1E274DBB0;
    objc_copyWeak(&v4, &location);
    -[CKRecentsViewController _loadRecentHandwritingsAndStickersWithCompletion:](self, "_loadRecentHandwritingsAndStickersWithCompletion:", v3);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

void __38__CKRecentsViewController_loadRecents__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  id v7;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(WeakRetained, "setRecentItems:", v5);
  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "resortAndReloadRecents");

  v7 = objc_loadWeakRetained(v2);
  objc_msgSend(v7, "setIsLoadingRecents:", 0);

}

- (void)_loadRecentHandwritingsAndStickersWithCompletion:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0D399D0];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadRecentHandwritingsAndStickersWithThumbnailSize:completion:", v4, 80.0, 44.0);

}

- (void)prepareForDisplay
{
  -[CKRecentsViewController setPreparingForDisplay:](self, "setPreparingForDisplay:", 1);
  -[CKRecentsViewController loadRecents](self, "loadRecents");
}

- (void)didTransitionFromOrientation:(int64_t)a3 toOrientation:(int64_t)a4
{
  id v4;

  -[CKRecentsViewController browserView](self, "browserView", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateFlowLayout");

}

- (void)forceTearDownRemoteView
{
  id v2;

  -[CKRecentsViewController browserView](self, "browserView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateFlowLayout");

}

- (void)resortAndReloadRecents
{
  void *v3;
  void *noRecentsLabel;
  UILabel *v5;

  if (-[NSMutableArray count](self->_recentItems, "count"))
  {
    -[NSMutableArray sortUsingComparator:](self->_recentItems, "sortUsingComparator:", &__block_literal_global_188);
    -[CKRecentsViewController browserView](self, "browserView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadData");

    -[UILabel removeFromSuperview](self->_noRecentsLabel, "removeFromSuperview");
    noRecentsLabel = self->_noRecentsLabel;
    self->_noRecentsLabel = 0;
  }
  else
  {
    -[CKRecentsViewController recentItems](self, "recentItems");
    noRecentsLabel = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(noRecentsLabel, "count"))
    {
      v5 = self->_noRecentsLabel;

      if (v5)
        goto LABEL_5;
      -[CKRecentsViewController setupNoRecentsLabel](self, "setupNoRecentsLabel");
      -[CKRecentsViewController browserView](self, "browserView");
      noRecentsLabel = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(noRecentsLabel, "addSubview:", self->_noRecentsLabel);
    }
  }

LABEL_5:
  -[CKRecentsViewController _postBrowserDidPrepareForDisplayNotificationIfNecessary](self, "_postBrowserDidPrepareForDisplayNotificationIfNecessary");
}

uint64_t __49__CKRecentsViewController_resortAndReloadRecents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)_postBrowserDidPrepareForDisplayNotificationIfNecessary
{
  void *v3;
  void *v4;
  id v5;
  _QWORD block[4];
  id v7;
  CKRecentsViewController *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (-[CKRecentsViewController isPreparingForDisplay](self, "isPreparingForDisplay"))
  {
    -[CKBrowserViewController balloonPlugin](self, "balloonPlugin");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v9 = CFSTR("CKRemoteViewPluginKey");
      -[CKBrowserViewController balloonPlugin](self, "balloonPlugin");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__CKRecentsViewController__postBrowserDidPrepareForDisplayNotificationIfNecessary__block_invoke;
    block[3] = &unk_1E274A108;
    v7 = v3;
    v8 = self;
    v5 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __82__CKRecentsViewController__postBrowserDidPrepareForDisplayNotificationIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "__mainThreadPostNotificationName:object:userInfo:", CFSTR("CKMessageExtensionBrowserViewControllerDidPrepareForDisplay"), 0, *(_QWORD *)(a1 + 32));

  return objc_msgSend(*(id *)(a1 + 40), "setPreparingForDisplay:", 0);
}

- (void)setupNoRecentsLabel
{
  id v3;
  void *v4;
  UILabel *v5;
  UILabel *noRecentsLabel;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  void *v10;
  void *v11;

  -[UILabel removeFromSuperview](self->_noRecentsLabel, "removeFromSuperview");
  v3 = objc_alloc(MEMORY[0x1E0CEA700]);
  -[CKRecentsViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v5 = (UILabel *)objc_msgSend(v3, "initWithFrame:");
  noRecentsLabel = self->_noRecentsLabel;
  self->_noRecentsLabel = v5;

  v7 = self->_noRecentsLabel;
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 16.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v7, "setFont:", v8);

  v9 = self->_noRecentsLabel;
  CKFrameworkBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("NO_RECENTS"), &stru_1E276D870, CFSTR("ChatKit"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v9, "setText:", v11);

  -[UILabel setTextAlignment:](self->_noRecentsLabel, "setTextAlignment:", 1);
}

- (BOOL)mayBeKeptInViewHierarchy
{
  return 1;
}

- (void)loadView
{
  void *v3;
  void *v4;
  MSStickerBrowserView *v5;
  MSStickerBrowserView *browserView;
  MSStickerBrowserView *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKRecentsViewController;
  -[CKBrowserViewController loadView](&v9, sel_loadView);
  -[CKRecentsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = (MSStickerBrowserView *)objc_msgSend(objc_alloc((Class)MEMORY[0x193FF3C18](CFSTR("MSStickerBrowserView"), CFSTR("Messages"))), "initWithFrame:stickerSize:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[MSStickerBrowserView setDataSource:](v5, "setDataSource:", self);
  -[MSStickerBrowserView performSelector:withObject:](v5, "performSelector:withObject:", sel_setDisplayDelegate_, self);
  -[MSStickerBrowserView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
  browserView = self->_browserView;
  self->_browserView = v5;
  v7 = v5;

  -[CKRecentsViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", self->_browserView);

}

- (void)viewDidLayoutSubviews
{
  MSStickerBrowserView *browserView;
  void *v4;
  UILabel *noRecentsLabel;
  id v6;

  browserView = self->_browserView;
  -[CKRecentsViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[MSStickerBrowserView setFrame:](browserView, "setFrame:");

  noRecentsLabel = self->_noRecentsLabel;
  if (noRecentsLabel)
  {
    -[CKRecentsViewController view](self, "view");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    -[UILabel setFrame:](noRecentsLabel, "setFrame:");

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKRecentsViewController;
  -[CKBrowserViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  objc_msgSend((id)MEMORY[0x193FF3C18](CFSTR("_MSStickerSendManager"), CFSTR("Messages")), "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  -[CKRecentsViewController browserView](self, "browserView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_startAnimating");

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKRecentsViewController;
  -[CKBrowserViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[CKRecentsViewController browserView](self, "browserView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_stopAnimating");

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKRecentsViewController;
  -[CKRecentsViewController traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[CKRecentsViewController recentsUpdated](self, "recentsUpdated");
}

- (BOOL)shouldShowChatChrome
{
  return 1;
}

- (int64_t)numberOfStickersInStickerBrowserView:(id)a3
{
  int64_t result;

  result = -[NSMutableArray count](self->_recentItems, "count", a3);
  if ((unint64_t)result >= 0x19)
    return 25;
  return result;
}

- (id)stickerBrowserView:(id)a3 stickerAtIndex:(int64_t)a4
{
  CKRecentsViewController *v4;
  void *v5;
  objc_class *v6;
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
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  id v22;
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
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  CKRecentsViewController *v38;
  objc_class *v39;
  void *v40;
  void *v41;
  NSMutableDictionary *stickerCache;
  void *v43;
  void *v45;
  void *v46;
  void *v47;

  v4 = self;
  -[NSMutableArray objectAtIndex:](self->_recentItems, "objectAtIndex:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)MEMORY[0x193FF3C18](CFSTR("MSSticker"), CFSTR("Messages"));
  objc_msgSend(v5, "payloadData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = [v6 alloc];
    objc_msgSend(v5, "fileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "payloadData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithContentsOfURL:data:localizedDescription:error:", v9, v10, CFSTR("handwriting"), 0);
  }
  else
  {
    objc_msgSend(v5, "messageItemInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fileURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v5, "fileURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fileURLWithPath:", v16);
    v17 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D39310]);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    v20 = CFSTR("com.apple.messages.Recents");
    if (v18)
      v20 = (__CFString *)v18;
    v21 = v20;

    v22 = objc_alloc(MEMORY[0x1E0D39B18]);
    objc_msgSend(v5, "accessibilityString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)v17;
    v24 = (void *)objc_msgSend(v22, "initWithStickerID:stickerPackID:fileURL:accessibilityLabel:moodCategory:stickerName:", v10, v21, v17, v23, 0, 0);

    objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stickerPackGUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "balloonPluginForBundleID:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = v27;
    objc_msgSend(v27, "attributionInfo");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAttributionInfo:", v28);

    objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D39320]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "length"))
    {
      objc_msgSend(v29, "_FTDataFromHexString");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setRecipe:", v30);

      objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D392E0]);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setBallonBundleID:", v31);

    }
    v45 = v29;
    objc_msgSend(v5, "accessibilityString");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "length");

    v34 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v33)
    {
      objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("STICKER_ACCESSIBILTY_LABEL_FORMAT"), &stru_1E276D870, CFSTR("ChatKit"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "accessibilityString");
      v38 = v4;
      v39 = v6;
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringWithFormat:", v37, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v39;
      v4 = v38;
    }
    else
    {
      objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("STICKER_ACCESSIBILTY_LABEL_NO_CONTENT"), &stru_1E276D870, CFSTR("ChatKit"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringWithFormat:", v37);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v11 = (void *)objc_msgSend([v6 alloc], "initWithContentsOfFileURL:localizedDescription:error:", v47, v41, 0);
    stickerCache = v4->_stickerCache;
    objc_msgSend(v11, "imageFileURL");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](stickerCache, "setObject:forKey:", v24, v43);

  }
  return v11;
}

- (id)_stickerForMSSticker:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "imageFileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_stickerCache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)requestSnapshotDataForPersistance
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  CGFloat v13;
  UIImage *v14;
  void *v15;
  CGSize v17;

  -[CKRecentsViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scale");
  v13 = v12;
  v17.width = v8;
  v17.height = v10;
  UIGraphicsBeginImageContextWithOptions(v17, 1, v13);

  objc_msgSend(v2, "drawViewHierarchyInRect:afterScreenUpdates:", 0, v4, v6, v8, v10);
  UIGraphicsGetImageFromCurrentImageContext();
  v14 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  UIImagePNGRepresentation(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)saveSnapshotForBrowserViewController
{
  int64_t v3;
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
  id v16;

  v3 = -[CKRecentsViewController _userInterfaceStyle](self, "_userInterfaceStyle");
  -[CKRecentsViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  +[CKSnapshotCacheKey keyWithIdentifier:interfaceStyle:bounds:](CKSnapshotCacheKey, "keyWithIdentifier:interfaceStyle:bounds:", CFSTR("com.apple.messages.browser.RecentPlugin"), v3);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[CKRecentsViewController requestSnapshotDataForPersistance](self, "requestSnapshotDataForPersistance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  objc_msgSend(v6, "imageWithData:scale:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v8);
  objc_msgSend(v16, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CKBrowserSnapshotPreviewURL(v10, CFSTR("png"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  CKFreeSpaceWriteDataToURL(v5, v11, 1);
  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "snapshotCache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCachedPreview:key:", v9, v14);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "postNotificationName:object:", CFSTR("CKBalloonPluginManagerSnapshotsDidChange"), 0);

}

- (void)dismiss
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CKRecentsViewController;
  -[CKBrowserViewController dismiss](&v2, sel_dismiss);
}

- (BOOL)isLoaded
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKRecentsViewController;
  return -[CKBrowserViewController isLoaded](&v3, sel_isLoaded);
}

- (void)_setContentOverlayInsets:(UIEdgeInsets)a3
{
  double bottom;
  double top;
  objc_super v6;

  bottom = a3.bottom;
  top = a3.top;
  v6.receiver = self;
  v6.super_class = (Class)CKRecentsViewController;
  -[CKRecentsViewController _setContentOverlayInsets:](&v6, sel__setContentOverlayInsets_, a3.top, a3.left, a3.bottom, a3.right);
  -[CKRecentsViewController _setNavigationControllerContentInsetAdjustment:](self, "_setNavigationControllerContentInsetAdjustment:", top, 0.0, bottom, 0.0);
}

- (void)insertSticker:(id)a3 representations:(id)a4 completionHandler:(id)a5
{
  -[CKRecentsViewController insertSticker:representations:forceStage:frameInScreenCoordinates:completionHandler:](self, "insertSticker:representations:forceStage:frameInScreenCoordinates:completionHandler:", a3, a4, 0, a5, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (void)insertSticker:(id)a3 completionHandler:(id)a4
{
  -[CKRecentsViewController insertSticker:representations:forceStage:frameInScreenCoordinates:completionHandler:](self, "insertSticker:representations:forceStage:frameInScreenCoordinates:completionHandler:", a3, MEMORY[0x1E0C9AA60], 0, a4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (void)insertSticker:(id)a3 forceStage:(BOOL)a4 completionHandler:(id)a5
{
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKRecentsViewController.m"), 338, CFSTR("Unexpected call to %s"), "-[CKRecentsViewController insertSticker:forceStage:completionHandler:]");

}

- (void)insertSticker:(id)a3 representations:(id)a4 forceStage:(BOOL)a5 frameInScreenCoordinates:(CGRect)a6 completionHandler:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  void *v13;
  CKBrowserItemPayload *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v12 = a3;
  objc_msgSend(v12, "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_alloc_init(CKBrowserItemPayload);
    objc_msgSend(v12, "data");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKBrowserItemPayload setData:](v14, "setData:", v15);
    -[CKBrowserItemPayload setPluginBundleID:](v14, "setPluginBundleID:", CFSTR("com.apple.Handwriting.HandwritingProvider"));
    -[CKBrowserViewController sendDelegate](self, "sendDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "startEditingPayload:", v14);
  }
  else
  {
    -[CKBrowserViewController sendDelegate](self, "sendDelegate");
    v14 = (CKBrowserItemPayload *)objc_claimAutoreleasedReturnValue();
    -[CKRecentsViewController _stickerForMSSticker:](self, "_stickerForMSSticker:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKBrowserItemPayload commitSticker:stickerFrame:](v14, "commitSticker:stickerFrame:", v16, x, y, width, height);
  }

  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "trackEvent:", *MEMORY[0x1E0D389B0]);

  if (-[CKBrowserViewController inExpandedPresentation](self, "inExpandedPresentation"))
  {
    -[CKBrowserViewController sendDelegate](self, "sendDelegate");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dismissAndReloadInputViews:", 1);

  }
}

- (void)insertSticker:(id)a3 forceStage:(BOOL)a4 frameInScreenCoordinates:(CGRect)a5 completionHandler:(id)a6
{
  -[CKRecentsViewController insertSticker:representations:forceStage:frameInScreenCoordinates:completionHandler:](self, "insertSticker:representations:forceStage:frameInScreenCoordinates:completionHandler:", a3, MEMORY[0x1E0C9AA60], a4, a6, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

- (void)startDragSticker:(id)a3 frameInRemoteView:(CGRect)a4 fence:(id)a5 completionHandler:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  void *v13;
  CKImageData *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  CKAnimatedImage *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v25 = a3;
  v12 = a6;
  objc_msgSend(v25, "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    if (v12)
      (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, 0, 0);
  }
  else
  {
    objc_msgSend(v25, "imageFileURL");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[CKImageData initWithURL:]([CKImageData alloc], "initWithURL:", v24);
    -[CKImageData durationsWithMaxCount:](v14, "durationsWithMaxCount:", 0x7FFFFFFFLL);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[CKImageData count](v14, "count"))
    {
      v17 = 0;
      do
      {
        -[CKImageData thumbnailAtIndex:fillToSize:maxCount:](v14, "thumbnailAtIndex:fillToSize:maxCount:", v17, 0x7FFFFFFFLL, 1.79769313e308, 1.79769313e308);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          objc_msgSend(v16, "addObject:", v18);

        ++v17;
      }
      while (v17 < -[CKImageData count](v14, "count"));
    }
    v19 = -[CKAnimatedImage initWithImages:durations:]([CKAnimatedImage alloc], "initWithImages:durations:", v16, v15);
    -[CKBrowserViewController browserDragManager](self, "browserDragManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKRecentsViewController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKRecentsViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "window");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "convertRect:fromView:", v23, x, y, width, height);
    objc_msgSend(v20, "beginDraggingItem:withAnimatedDragImage:fromRect:", v25, v19);

    -[CKRecentsViewController setDraggingCompletionHandler:](self, "setDraggingCompletionHandler:", v12);
  }

}

- (BOOL)dragManager:(id)a3 shouldCancelDraggingForItem:(id)a4 toDragTarget:(id)a5 dropArea:(int)a6
{
  return (a6 & 0xFFFFFFFD) == 1;
}

- (void)dragManager:(id)a3 didEndDraggingItem:(id)a4 toDragTarget:(id)a5 dropArea:(int)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);

  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[CKBrowserViewController sendDelegate](self, "sendDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKRecentsViewController _stickerForMSSticker:](self, "_stickerForMSSticker:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "draggedSticker");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "commitSticker:withDragTarget:draggedSticker:", v14, v10, v15);
  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "trackEvent:", *MEMORY[0x1E0D389B0]);

  -[CKRecentsViewController draggingCompletionHandler](self, "draggingCompletionHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[CKRecentsViewController draggingCompletionHandler](self, "draggingCompletionHandler");
    v18 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, BOOL, _QWORD))v18)[2](v18, (a6 & 0xFFFFFFFD) == 1, 0);

    -[CKRecentsViewController setDraggingCompletionHandler:](self, "setDraggingCompletionHandler:", 0);
  }
}

- (BOOL)dragManager:(id)a3 canScaleItem:(id)a4
{
  void *v4;
  BOOL v5;

  objc_msgSend(a4, "data", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  return v5;
}

- (BOOL)dragManager:(id)a3 canRotateItem:(id)a4
{
  void *v4;
  BOOL v5;

  objc_msgSend(a4, "data", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  return v5;
}

- (BOOL)dragManager:(id)a3 canPeelItem:(id)a4
{
  void *v4;
  BOOL v5;

  objc_msgSend(a4, "data", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  return v5;
}

- (BOOL)stickerBrowserView:(id)a3 shouldDrawBorderAroundSticker:(id)a4
{
  void *v4;
  BOOL v5;

  objc_msgSend(a4, "data", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (int64_t)_userInterfaceStyle
{
  void *v2;
  void *v3;
  int64_t v4;

  -[CKRecentsViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  return v4;
}

- (BOOL)hasHandwritingRecents
{
  return self->_hasHandwritingRecents;
}

- (void)setHasHandwritingRecents:(BOOL)a3
{
  self->_hasHandwritingRecents = a3;
}

- (BOOL)hasStickerRecents
{
  return self->_hasStickerRecents;
}

- (void)setHasStickerRecents:(BOOL)a3
{
  self->_hasStickerRecents = a3;
}

- (NSMutableArray)recentItems
{
  return self->_recentItems;
}

- (void)setRecentItems:(id)a3
{
  objc_storeStrong((id *)&self->_recentItems, a3);
}

- (MSStickerBrowserView)browserView
{
  return self->_browserView;
}

- (void)setBrowserView:(id)a3
{
  objc_storeStrong((id *)&self->_browserView, a3);
}

- (UILabel)noRecentsLabel
{
  return self->_noRecentsLabel;
}

- (void)setNoRecentsLabel:(id)a3
{
  objc_storeStrong((id *)&self->_noRecentsLabel, a3);
}

- (NSMutableDictionary)stickerCache
{
  return self->_stickerCache;
}

- (void)setStickerCache:(id)a3
{
  objc_storeStrong((id *)&self->_stickerCache, a3);
}

- (BOOL)isLoadingRecents
{
  return self->_isLoadingRecents;
}

- (void)setIsLoadingRecents:(BOOL)a3
{
  self->_isLoadingRecents = a3;
}

- (BOOL)isPreparingForDisplay
{
  return self->_preparingForDisplay;
}

- (void)setPreparingForDisplay:(BOOL)a3
{
  self->_preparingForDisplay = a3;
}

- (id)draggingCompletionHandler
{
  return self->_draggingCompletionHandler;
}

- (void)setDraggingCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1088);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_draggingCompletionHandler, 0);
  objc_storeStrong((id *)&self->_stickerCache, 0);
  objc_storeStrong((id *)&self->_noRecentsLabel, 0);
  objc_storeStrong((id *)&self->_browserView, 0);
  objc_storeStrong((id *)&self->_recentItems, 0);
}

@end
