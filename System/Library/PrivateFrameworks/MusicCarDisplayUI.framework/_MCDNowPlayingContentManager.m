@implementation _MCDNowPlayingContentManager

- (_MCDNowPlayingContentManager)initWithDelegate:(id)a3 dataSource:(id)a4 bundleID:(id)a5
{
  id v8;
  id v9;
  id v10;
  _MCDNowPlayingContentManager *v11;
  _MCDNowPlayingContentManager *v12;
  MPRequestResponseController *v13;
  MPRequestResponseController *requestController;
  uint64_t v15;
  NSMutableDictionary *artworkCache;
  void *v17;
  uint64_t v18;
  CARSessionStatus *carSessionStatus;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)_MCDNowPlayingContentManager;
  v11 = -[_MCDNowPlayingContentManager init](&v21, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v8);
    objc_storeWeak((id *)&v12->_dataSource, v9);
    v13 = (MPRequestResponseController *)objc_alloc_init(MEMORY[0x24BDDCB90]);
    requestController = v12->_requestController;
    v12->_requestController = v13;

    -[MPRequestResponseController setDelegate:](v12->_requestController, "setDelegate:", v12);
    objc_storeStrong((id *)&v12->_bundleID, a5);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    artworkCache = v12->_artworkCache;
    v12->_artworkCache = (NSMutableDictionary *)v15;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(objc_alloc(MEMORY[0x24BE15240]), "initWithOptions:", 4);
    carSessionStatus = v12->_carSessionStatus;
    v12->_carSessionStatus = (CARSessionStatus *)v18;

    -[CARSessionStatus addSessionObserver:](v12->_carSessionStatus, "addSessionObserver:", v12);
    v12->_shouldHideBackButton = 0;
    objc_msgSend(v17, "addObserver:selector:name:object:", v12, sel__limitedUIChanged_, *MEMORY[0x24BE151B8], 0);
    -[_MCDNowPlayingContentManager _performRequest](v12, "_performRequest");

  }
  return v12;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE151B8], 0);

  v4.receiver = self;
  v4.super_class = (Class)_MCDNowPlayingContentManager;
  -[_MCDNowPlayingContentManager dealloc](&v4, sel_dealloc);
}

- (void)beginRequestObservation
{
  id v2;

  -[_MCDNowPlayingContentManager requestController](self, "requestController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginAutomaticResponseLoading");

}

- (void)endRequestObservation
{
  id v2;

  -[_MCDNowPlayingContentManager requestController](self, "requestController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endAutomaticResponseLoading");

}

- (void)viewWillDisappear
{
  id v2;

  -[_MCDNowPlayingContentManager alertController](self, "alertController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)setTableView:(id)a3
{
  UITableView **p_tableView;
  id WeakRetained;
  objc_class *v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  p_tableView = &self->_tableView;
  objc_storeWeak((id *)&self->_tableView, a3);
  if (-[_MCDNowPlayingContentManager tableCellClass](self, "tableCellClass"))
  {
    WeakRetained = objc_loadWeakRetained((id *)p_tableView);
    v6 = -[_MCDNowPlayingContentManager tableCellClass](self, "tableCellClass");
    NSStringFromClass(-[_MCDNowPlayingContentManager tableCellClass](self, "tableCellClass"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "registerClass:forCellReuseIdentifier:", v6, v7);

  }
  v8 = objc_loadWeakRetained((id *)p_tableView);
  objc_msgSend(v8, "setDelegate:", self);

  v9 = objc_loadWeakRetained((id *)p_tableView);
  objc_msgSend(v9, "setDataSource:", self);

  v10 = objc_loadWeakRetained((id *)p_tableView);
  objc_msgSend(v10, "reloadData");

}

- (void)setAllowsAlbumArt:(BOOL)a3
{
  void *v4;
  char v5;
  id v6;

  if (self->_allowsAlbumArt != a3)
  {
    self->_allowsAlbumArt = a3;
    -[_MCDNowPlayingContentManager delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[_MCDNowPlayingContentManager delegate](self, "delegate");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "contentManagerReloadData:", self);

    }
  }
}

- (BOOL)_sessionAllowsAlbumArt:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "nowPlayingAlbumArtMode") == 2;

  return v4;
}

- (void)sessionDidConnect:(id)a3
{
  -[_MCDNowPlayingContentManager setAllowsAlbumArt:](self, "setAllowsAlbumArt:", -[_MCDNowPlayingContentManager _sessionAllowsAlbumArt:](self, "_sessionAllowsAlbumArt:", a3));
  -[_MCDNowPlayingContentManager _limitedUIChanged:](self, "_limitedUIChanged:", 0);
}

- (void)session:(id)a3 didUpdateConfiguration:(id)a4
{
  -[_MCDNowPlayingContentManager setAllowsAlbumArt:](self, "setAllowsAlbumArt:", -[_MCDNowPlayingContentManager _sessionAllowsAlbumArt:](self, "_sessionAllowsAlbumArt:", a3, a4));
}

- (void)_limitedUIChanged:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50___MCDNowPlayingContentManager__limitedUIChanged___block_invoke;
  block[3] = &unk_24FD78200;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (void)_performRequest
{
  void *v3;
  id v4;

  -[_MCDNowPlayingContentManager _setupRequest](self, "_setupRequest");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_MCDNowPlayingContentManager requestController](self, "requestController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRequest:", v4);

}

- (id)_setupRequest
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;

  v3 = objc_alloc_init(MEMORY[0x24BE64D78]);
  objc_msgSend(v3, "setTracklistRange:", 0, 50);
  -[_MCDNowPlayingContentManager bundleID](self, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.Music"));

  if ((v5 & 1) != 0)
  {
    v6 = (void *)MEMORY[0x24BE64D70];
    -[_MCDNowPlayingContentManager bundleID](self, "bundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathWithRoute:bundleID:playerID:", 0, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPlayerPath:", v8);

  }
  else
  {
    objc_msgSend(v3, "setPlayerPath:", 0);
  }
  -[_MCDNowPlayingContentManager dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[_MCDNowPlayingContentManager dataSource](self, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "playingItemProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPlayingItemProperties:", v12);

  }
  -[_MCDNowPlayingContentManager dataSource](self, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[_MCDNowPlayingContentManager dataSource](self, "dataSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "queueItemProperties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setQueueItemProperties:", v16);

  }
  -[_MCDNowPlayingContentManager dataSource](self, "dataSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    -[_MCDNowPlayingContentManager dataSource](self, "dataSource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "queueSectionProperties");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setQueueSectionProperties:", v20);

  }
  -[_MCDNowPlayingContentManager dataSource](self, "dataSource");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_opt_respondsToSelector();

  if ((v22 & 1) != 0)
  {
    -[_MCDNowPlayingContentManager dataSource](self, "dataSource");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "requestLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLabel:", v24);

  }
  return v3;
}

- (void)modelResponseDidInvalidate:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  msv_dispatch_async_on_queue();

}

- (BOOL)_shouldShowPlaybackQueueForItemCount:(int64_t)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  int v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint8_t buf[16];

  if (a3 > 0)
  {
    -[_MCDNowPlayingContentManager nowPlayingItem](self, "nowPlayingItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "duration");

      if ((_BYTE)v14)
      {
        MCDGeneralLogging();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v7 = "Disabling up next queue; livestreaming content.";
LABEL_12:
          _os_log_impl(&dword_22FBAA000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
          goto LABEL_13;
        }
        goto LABEL_13;
      }
    }
    else
    {
      v14 = 0;
      v12 = 0u;
      v13 = 0u;
      v11 = 0u;

    }
    -[_MCDNowPlayingContentManager bundleID](self, "bundleID", v11, v12, v13, v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.iBooks"));

    if (!v9)
      return 1;
    MCDGeneralLogging();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "Disabling up next queue for AudioBooks.";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  MCDGeneralLogging();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v7 = "Disabling up next queue; no items in queue.";
    goto LABEL_12;
  }
LABEL_13:

  return 0;
}

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  _MCDNowPlayingContentManager *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69___MCDNowPlayingContentManager_controller_defersResponseReplacement___block_invoke;
  block[3] = &unk_24FD789C8;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)processArtworkForCurrentlyPlayingSong
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  MSVTimer *v19;
  MSVTimer *artworkTimer;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id location;

  objc_msgSend(MEMORY[0x24BEBD8F8], "_carScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  v5 = v4;
  -[_MCDNowPlayingContentManager currentPlayingSong](self, "currentPlayingSong");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "artworkCatalog");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MCDNowPlayingContentManager artworkCatalog](self, "artworkCatalog");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isArtworkVisuallyIdenticalToCatalog:", v7);

  if ((v9 & 1) == 0)
  {
    -[_MCDNowPlayingContentManager setArtworkCatalog:](self, "setArtworkCatalog:", v7);
    -[_MCDNowPlayingContentManager artworkCatalog](self, "artworkCatalog");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v7, "setDestinationScale:", v5);
      objc_msgSend(MEMORY[0x24BEBD8F8], "_carScreen");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bounds");
      v13 = v12;
      v15 = v14;

      if (v13 < v15)
        v13 = v15;
      -[_MCDNowPlayingContentManager artworkCatalog](self, "artworkCatalog");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setFittingSize:", v13, v15);

      objc_initWeak(&location, self);
      v17 = (void *)MEMORY[0x24BE65CC8];
      v18 = MEMORY[0x24BDAC760];
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __69___MCDNowPlayingContentManager_processArtworkForCurrentlyPlayingSong__block_invoke;
      v28[3] = &unk_24FD78188;
      objc_copyWeak(&v29, &location);
      objc_msgSend(v17, "timerWithInterval:repeats:block:", 0, v28, 1.0);
      v19 = (MSVTimer *)objc_claimAutoreleasedReturnValue();
      artworkTimer = self->_artworkTimer;
      self->_artworkTimer = v19;

      -[_MCDNowPlayingContentManager artworkCatalog](self, "artworkCatalog");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v18;
      v25[1] = 3221225472;
      v25[2] = __69___MCDNowPlayingContentManager_processArtworkForCurrentlyPlayingSong__block_invoke_45;
      v25[3] = &unk_24FD789F0;
      objc_copyWeak(&v27, &location);
      v26 = v7;
      objc_msgSend(v21, "setDestination:configurationBlock:", self, v25);

      objc_destroyWeak(&v27);
      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
    else
    {
      -[_MCDNowPlayingContentManager setAlbumArtwork:](self, "setAlbumArtwork:", 0);
      -[_MCDNowPlayingContentManager delegate](self, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_opt_respondsToSelector();

      if ((v23 & 1) != 0)
      {
        -[_MCDNowPlayingContentManager delegate](self, "delegate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "contentManagerReloadData:", self);

      }
    }
  }

}

- (void)_showPlaceholderArtwork
{
  UIImage *albumArtwork;
  void *v4;
  char v5;
  id v6;

  albumArtwork = self->_albumArtwork;
  self->_albumArtwork = 0;

  -[_MCDNowPlayingContentManager delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[_MCDNowPlayingContentManager delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentManagerReloadData:", self);

  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return 0;
}

- (id)_requestResponseItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[_MCDNowPlayingContentManager requestController](self, "requestController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "response");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tracklist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playingItemIndexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_MCDNowPlayingContentManager requestController](self, "requestController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "response");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tracklist");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "items");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "itemAtIndexPath:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)artistTextForNowPlayingController:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  -[_MCDNowPlayingContentManager currentPlayingRadioStation](self, "currentPlayingRadioStation", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributionLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v5;
    goto LABEL_13;
  }
  v7 = (void *)objc_opt_new();
  -[_MCDNowPlayingContentManager currentPlayingSong](self, "currentPlayingSong");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "artist");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "length"))
    objc_msgSend(v7, "addObject:", v10);
  -[_MCDNowPlayingContentManager currentPlayingSong](self, "currentPlayingSong");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "composer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MCDNowPlayingContentManager currentPlayingSong](self, "currentPlayingSong");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "shouldShowComposer"))
    goto LABEL_8;
  v15 = objc_msgSend(v13, "length");

  if (v15)
  {
    v16 = (void *)MEMORY[0x24BDD17C8];
    MCDCarDisplayBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("COMPOSED_BY_TITLE"), &stru_24FD78C58, CFSTR("MusicCarDisplayUI"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringWithFormat:", v18, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addObject:", v14);
LABEL_8:

  }
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR(" — "));
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

LABEL_13:
  return v6;
}

- (id)albumTextForNowPlayingController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[_MCDNowPlayingContentManager currentPlayingSong](self, "currentPlayingSong", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "album");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)titleForNowPlayingController:(id)a3
{
  void *v3;
  void *v4;

  -[_MCDNowPlayingContentManager currentPlayingSong](self, "currentPlayingSong", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)nowPlayingViewControllerIsShowingExplicitTrack:(id)a3
{
  void *v3;
  char v4;

  -[_MCDNowPlayingContentManager currentPlayingSong](self, "currentPlayingSong", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isExplicitSong");

  return v4;
}

- (id)progressBarLocalizedDurationStringForNowPlayingViewController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[_MCDNowPlayingContentManager _requestResponseItem](self, "_requestResponseItem", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "localizedDurationString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- ($04B05C73ED6AEEF31C5815932084562D)durationSnapshotForNowPlayingViewController:(SEL)a3
{
  void *v5;
  $04B05C73ED6AEEF31C5815932084562D *result;
  void *v7;

  -[_MCDNowPlayingContentManager _requestResponseItem](self, "_requestResponseItem", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = v5;
    objc_msgSend(v5, "duration");
    v5 = v7;
  }
  else
  {
    *(_QWORD *)&retstr->var7 = 0;
    *(_OWORD *)&retstr->var2 = 0u;
    *(_OWORD *)&retstr->var4 = 0u;
    *(_OWORD *)&retstr->var0 = 0u;
  }

  return result;
}

- (BOOL)nowPlayingViewControllerIsPlaying:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  -[_MCDNowPlayingContentManager requestController](self, "requestController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "response");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "state") == 2;

  return v5;
}

- (int64_t)shuffleTypeForNowPlayingViewController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  -[_MCDNowPlayingContentManager requestController](self, "requestController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "response");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tracklist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shuffleType");

  return v6;
}

- (int64_t)repeatTypeForNowPlayingViewController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  -[_MCDNowPlayingContentManager requestController](self, "requestController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "response");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tracklist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "repeatType");

  return v6;
}

- (int64_t)placeholderTypeForNowPlayingViewController:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;
  char v7;

  -[_MCDNowPlayingContentManager nowPlayingItem](self, "nowPlayingItem", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "duration");
    v5 = 4 * (v7 != 0);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)nowPlayingViewControllerCanShuffle:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[_MCDNowPlayingContentManager requestController](self, "requestController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "response");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tracklist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shuffleCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

- (void)nowPlayingViewControllerToggleShuffle:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[_MCDNowPlayingContentManager requestController](self, "requestController", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "response");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tracklist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shuffleCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "advance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MCDNowPlayingContentManager _performChangeRequest:](self, "_performChangeRequest:", v7);

}

- (BOOL)nowPlayingViewControllerCanShowUpNext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint8_t buf[16];

  -[_MCDNowPlayingContentManager requestController](self, "requestController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "response");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "tracklist");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "totalItemCount");

  if (v8 <= 1)
  {
    MCDGeneralLogging();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v10 = "Disabling up next queue; no items in queue.";
LABEL_12:
      _os_log_impl(&dword_22FBAA000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 2u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  -[_MCDNowPlayingContentManager nowPlayingItem](self, "nowPlayingItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    v20 = 0;
    v18 = 0u;
    v19 = 0u;
    v17 = 0u;

LABEL_9:
    -[_MCDNowPlayingContentManager bundleID](self, "bundleID", v17, v18, v19, v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.iBooks"));

    if (!v14)
    {
      v15 = 1;
      goto LABEL_14;
    }
    MCDGeneralLogging();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v10 = "Disabling up next queue for AudioBooks.";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  objc_msgSend(v11, "duration");

  if (!(_BYTE)v20)
    goto LABEL_9;
  MCDGeneralLogging();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v10 = "Disabling up next queue; livestreaming content.";
    goto LABEL_12;
  }
LABEL_13:

  v15 = 0;
LABEL_14:

  return v15;
}

- (BOOL)nowPlayingViewControllerCanShowAlbumArt:(id)a3
{
  return self->_allowsAlbumArt;
}

- (BOOL)nowPlayingViewControllerCanShowAlbumLink:(id)a3
{
  return 0;
}

- (BOOL)nowPlayingViewControllerCanRepeat:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[_MCDNowPlayingContentManager requestController](self, "requestController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "response");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tracklist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "repeatCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

- (void)nowPlayingViewControllerToggleRepeat:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[_MCDNowPlayingContentManager requestController](self, "requestController", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "response");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tracklist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "repeatCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "advance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MCDNowPlayingContentManager _performChangeRequest:](self, "_performChangeRequest:", v7);

}

- (BOOL)nowPlayingViewControllerCanShowChangePlaybackRate:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  -[_MCDNowPlayingContentManager nowPlayingItem](self, "nowPlayingItem", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playbackRateCommand");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (void)nowPlayingViewControllerChangePlaybackRate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  -[_MCDNowPlayingContentManager nowPlayingItem](self, "nowPlayingItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playbackRateCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "supportedPlaybackRates");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[_MCDNowPlayingContentManager nowPlayingViewControllerGetPlaybackRate:](self, "nowPlayingViewControllerGetPlaybackRate:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v14, "indexOfObject:", v7);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = (v8 + 1) % (unint64_t)objc_msgSend(v14, "count");
    -[_MCDNowPlayingContentManager nowPlayingItem](self, "nowPlayingItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "playbackRateCommand");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatValue");
    objc_msgSend(v11, "setPlaybackRate:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MCDNowPlayingContentManager _performChangeRequest:](self, "_performChangeRequest:", v13);

  }
}

- (id)nowPlayingViewControllerGetPlaybackRate:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD16E0];
  -[_MCDNowPlayingContentManager nowPlayingItem](self, "nowPlayingItem", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playbackRateCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredPlaybackRate");
  objc_msgSend(v3, "numberWithFloat:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)nowPlayingViewControllerShouldUseMusicExplicitGlyph:(id)a3
{
  void *v3;
  char v4;

  -[_MCDNowPlayingContentManager bundleID](self, "bundleID", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Music"));

  return v4;
}

- (void)_performChangeRequest:(id)a3
{
  if (a3)
    objc_msgSend(MEMORY[0x24BE64D60], "performRequest:options:completion:", a3, 0x10000, 0);
}

- (BOOL)nowPlayingViewControllerIsRightHandDrive:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[_MCDNowPlayingContentManager carSessionStatus](self, "carSessionStatus", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rightHandDrive");

  return v6;
}

- (BOOL)nowPlayingViewControllerShouldHideBackButton:(id)a3
{
  void *v4;
  char v5;
  NSObject *v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[_MCDNowPlayingContentManager bundleID](self, "bundleID", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.Music"));

  if ((v5 & 1) != 0)
    return 0;
  MCDGeneralLogging();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = -[_MCDNowPlayingContentManager shouldHideBackButton](self, "shouldHideBackButton");
    _os_log_impl(&dword_22FBAA000, v7, OS_LOG_TYPE_DEFAULT, "Hiding back button: %d", (uint8_t *)v8, 8u);
  }

  return -[_MCDNowPlayingContentManager shouldHideBackButton](self, "shouldHideBackButton");
}

- (BOOL)nowPlayingViewControllerShouldOverrideRightBarButtons:(id)a3
{
  return 1;
}

- (NSString)nowPlayingBundleID
{
  void *v2;
  void *v3;

  -[_MCDNowPlayingContentManager bundleID](self, "bundleID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (Class)tableCellClass
{
  return (Class)objc_loadWeakRetained((id *)&self->tableCellClass);
}

- (void)setTableCellClass:(Class)a3
{
  objc_storeWeak((id *)&self->tableCellClass, a3);
}

- (BOOL)limitedUI
{
  return self->limitedUI;
}

- (void)setLimitedUI:(BOOL)a3
{
  self->limitedUI = a3;
}

- (MPModelSong)currentPlayingSong
{
  return self->currentPlayingSong;
}

- (void)setCurrentPlayingSong:(id)a3
{
  objc_storeStrong((id *)&self->currentPlayingSong, a3);
}

- (MPModelPlaylistEntry)currentPlayingPlaylistEntry
{
  return self->currentPlayingPlaylistEntry;
}

- (void)setCurrentPlayingPlaylistEntry:(id)a3
{
  objc_storeStrong((id *)&self->currentPlayingPlaylistEntry, a3);
}

- (MPModelPlaylist)currentPlayingPlaylist
{
  return self->currentPlayingPlaylist;
}

- (void)setCurrentPlayingPlaylist:(id)a3
{
  objc_storeStrong((id *)&self->currentPlayingPlaylist, a3);
}

- (MPModelRadioStation)currentPlayingRadioStation
{
  return self->currentPlayingRadioStation;
}

- (void)setCurrentPlayingRadioStation:(id)a3
{
  objc_storeStrong((id *)&self->currentPlayingRadioStation, a3);
}

- (BOOL)shouldHideBackButton
{
  return self->_shouldHideBackButton;
}

- (void)setShouldHideBackButton:(BOOL)a3
{
  self->_shouldHideBackButton = a3;
}

- (MCDNowPlayingContentManagerDelegate)delegate
{
  return (MCDNowPlayingContentManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MPCPlayerResponse)lastReceivedResponse
{
  return self->_lastReceivedResponse;
}

- (void)setLastReceivedResponse:(id)a3
{
  objc_storeStrong((id *)&self->_lastReceivedResponse, a3);
}

- (UITableView)tableView
{
  return (UITableView *)objc_loadWeakRetained((id *)&self->_tableView);
}

- (MPCPlayerResponseItem)nowPlayingItem
{
  return self->_nowPlayingItem;
}

- (void)setNowPlayingItem:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingItem, a3);
}

- (MPRequestResponseController)requestController
{
  return self->_requestController;
}

- (void)setRequestController:(id)a3
{
  objc_storeStrong((id *)&self->_requestController, a3);
}

- (UIImage)albumArtwork
{
  return self->_albumArtwork;
}

- (void)setAlbumArtwork:(id)a3
{
  objc_storeStrong((id *)&self->_albumArtwork, a3);
}

- (MPArtworkCatalog)artworkCatalog
{
  return self->_artworkCatalog;
}

- (void)setArtworkCatalog:(id)a3
{
  objc_storeStrong((id *)&self->_artworkCatalog, a3);
}

- (MCDNowPlayingDataSource)dataSource
{
  return (MCDNowPlayingDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (CARSessionStatus)carSessionStatus
{
  return self->_carSessionStatus;
}

- (void)setCarSessionStatus:(id)a3
{
  objc_storeStrong((id *)&self->_carSessionStatus, a3);
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_alertController, a3);
}

- (int64_t)playerState
{
  return self->_playerState;
}

- (void)setPlayerState:(int64_t)a3
{
  self->_playerState = a3;
}

- (NSMutableDictionary)artworkCache
{
  return self->_artworkCache;
}

- (void)setArtworkCache:(id)a3
{
  objc_storeStrong((id *)&self->_artworkCache, a3);
}

- (MSVTimer)artworkTimer
{
  return self->_artworkTimer;
}

- (void)setArtworkTimer:(id)a3
{
  objc_storeStrong((id *)&self->_artworkTimer, a3);
}

- (BOOL)allowsAlbumArt
{
  return self->_allowsAlbumArt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkTimer, 0);
  objc_storeStrong((id *)&self->_artworkCache, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_carSessionStatus, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_artworkCatalog, 0);
  objc_storeStrong((id *)&self->_albumArtwork, 0);
  objc_storeStrong((id *)&self->_requestController, 0);
  objc_storeStrong((id *)&self->_nowPlayingItem, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_lastReceivedResponse, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->currentPlayingRadioStation, 0);
  objc_storeStrong((id *)&self->currentPlayingPlaylist, 0);
  objc_storeStrong((id *)&self->currentPlayingPlaylistEntry, 0);
  objc_storeStrong((id *)&self->currentPlayingSong, 0);
  objc_destroyWeak((id *)&self->tableCellClass);
}

@end
