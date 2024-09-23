@implementation MCDPlayableContentPlaybackManager

- (void)_processResponse:(id)a3 error:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  -[_MCDNowPlayingContentManager nowPlayingItem](self, "nowPlayingItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_2;
  if (objc_msgSend(v23, "state"))
  {
    -[_MCDNowPlayingContentManager setCurrentPlayingSong:](self, "setCurrentPlayingSong:", 0);
    -[_MCDNowPlayingContentManager delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      -[_MCDNowPlayingContentManager delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contentManagerCompletedAllPlayback:", self);
LABEL_2:

    }
  }
  objc_msgSend(v23, "tracklist");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "numberOfSections");

  if (v8 >= 1)
  {
    objc_msgSend(v23, "tracklist");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "playingItemIndexPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[MCDPlayableContentPlaybackManager _itemAtIndexPath:](self, "_itemAtIndexPath:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "metadataObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "anyObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MCDNowPlayingContentManager setCurrentPlayingSong:](self, "setCurrentPlayingSong:", v13);

    }
    else
    {
      -[_MCDNowPlayingContentManager setCurrentPlayingSong:](self, "setCurrentPlayingSong:", 0);
    }
    -[_MCDNowPlayingContentManager processArtworkForCurrentlyPlayingSong](self, "processArtworkForCurrentlyPlayingSong");
    -[_MCDNowPlayingContentManager delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      v18 = -[_MCDNowPlayingContentManager _shouldShowPlaybackQueueForItemCount:](self, "_shouldShowPlaybackQueueForItemCount:", -[MCDPlayableContentPlaybackManager _numberOfItemsInPlaybackQueue](self, "_numberOfItemsInPlaybackQueue"));
      -[_MCDNowPlayingContentManager delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "contentManager:shouldShowPlaybackQueue:", self, v18);

    }
    -[MCDPlayableContentPlaybackManager _updateTrackQueueIndex](self, "_updateTrackQueueIndex");

  }
  -[_MCDNowPlayingContentManager tableView](self, "tableView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[_MCDNowPlayingContentManager tableView](self, "tableView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "reloadData");

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObserver:selector:name:object:", self, sel_modelResponseDidInvalidate_, *MEMORY[0x24BDDC3F8], v23);

}

- (int64_t)_numberOfItemsInPlaybackQueue
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  -[_MCDNowPlayingContentManager requestController](self, "requestController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "response");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tracklist");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "totalItemCount");

  if (v6 <= 1)
    v7 = 1;
  else
    v7 = v6;
  return v7 - 1;
}

- (id)_adjustedIndexPathForPlaybackQueue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  -[_MCDNowPlayingContentManager requestController](self, "requestController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "response");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tracklist");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "row");

  objc_msgSend(v8, "indexPathForGlobalIndex:", v9 + 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_itemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[_MCDNowPlayingContentManager requestController](self, "requestController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "response");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tracklist");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemAtIndexPath:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_updateTrackQueueIndex
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  id v13;

  -[_MCDNowPlayingContentManager requestController](self, "requestController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "response");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tracklist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "playingItemGlobalIndex");

  -[_MCDNowPlayingContentManager requestController](self, "requestController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "response");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tracklist");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "globalItemCount");

  if (v6 != -[MCDPlayableContentPlaybackManager playingItemIndex](self, "playingItemIndex")
    || v10 != -[MCDPlayableContentPlaybackManager totalItemCount](self, "totalItemCount"))
  {
    -[_MCDNowPlayingContentManager delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[_MCDNowPlayingContentManager delegate](self, "delegate");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "contentManager:displayItemIndex:totalItemCount:", self, v6, v10);

    }
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v5;
  _BOOL4 v6;
  int64_t v7;

  v5 = -[MCDPlayableContentPlaybackManager _numberOfItemsInPlaybackQueue](self, "_numberOfItemsInPlaybackQueue", a3, a4);
  v6 = -[_MCDNowPlayingContentManager limitedUI](self, "limitedUI");
  v7 = 12;
  if (v5 < 12)
    v7 = v5;
  if (v6)
    return v7;
  else
    return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
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
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  uint64_t v37;
  MCDPlayableContentPlaybackManager *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id location;

  v43 = a3;
  v41 = a4;
  objc_msgSend(MEMORY[0x24BE153C8], "cellForTableView:", v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCDPlayableContentPlaybackManager _adjustedIndexPathForPlaybackQueue:](self, "_adjustedIndexPathForPlaybackQueue:", v41);
  v6 = objc_claimAutoreleasedReturnValue();
  -[_MCDNowPlayingContentManager requestController](self, "requestController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "response");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tracklist");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)v6;
  objc_msgSend(v10, "itemAtIndexPath:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "metadataObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "anyObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BE153D8];
  objc_msgSend(v13, "title");
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "artist");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "album");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "title");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  MCDFormatArtistAlbumString(v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = self;
  -[_MCDNowPlayingContentManager artworkCache](self, "artworkCache");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKey:", v41);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v13, "isExplicitSong");
  LOWORD(v37) = 0;
  v23 = v14;
  v24 = (void *)v15;
  objc_msgSend(v23, "configurationWithText:detailText:image:showExplicit:accessory:showActivityIndicator:showPlaybackProgress:playbackProgress:currentlyPlaying:", v15, v19, v21, v22, 0, 0, 0.0, v37);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v42, "applyConfiguration:", v25);
  objc_msgSend(v13, "artworkCatalog");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v43, "window");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "screen");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "scale");
    v30 = v29;
    objc_msgSend(v13, "artworkCatalog");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setDestinationScale:", v30);

    objc_msgSend(v13, "artworkCatalog");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (objc_class *)objc_opt_class();
    NSStringFromClass(v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setCacheIdentifier:forRequestingContext:", v34, v38);

    objc_initWeak(&location, v38);
    objc_msgSend(v13, "artworkCatalog");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __69__MCDPlayableContentPlaybackManager_tableView_cellForRowAtIndexPath___block_invoke;
    v44[3] = &unk_24FD789F0;
    objc_copyWeak(&v46, &location);
    v45 = v41;
    objc_msgSend(v35, "setDestination:configurationBlock:", v38, v44);

    objc_destroyWeak(&v46);
    objc_destroyWeak(&location);
  }

  return v42;
}

void __69__MCDPlayableContentPlaybackManager_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v4 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__MCDPlayableContentPlaybackManager_tableView_cellForRowAtIndexPath___block_invoke_2;
  block[3] = &unk_24FD78A18;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v7 = v4;
  v8 = *(id *)(a1 + 32);
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v9);
}

void __69__MCDPlayableContentPlaybackManager_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "artworkCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
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
  id v20;
  _QWORD v21[4];
  id v22;
  id location;

  v20 = a3;
  v6 = a4;
  -[_MCDNowPlayingContentManager requestController](self, "requestController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "response");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tracklist");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v9;
  objc_msgSend(v9, "changeItemCommand");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MCDNowPlayingContentManager requestController](self, "requestController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "response");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "tracklist");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "items");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCDPlayableContentPlaybackManager _adjustedIndexPathForPlaybackQueue:](self, "_adjustedIndexPathForPlaybackQueue:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "itemAtIndexPath:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "changeToItem:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v18 = (void *)MEMORY[0x24BE64D60];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __71__MCDPlayableContentPlaybackManager_tableView_didSelectRowAtIndexPath___block_invoke;
  v21[3] = &unk_24FD78A40;
  objc_copyWeak(&v22, &location);
  objc_msgSend(v18, "performRequest:completion:", v17, v21);
  objc_msgSend(v20, "deselectRowAtIndexPath:animated:", v6, 1);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

void __71__MCDPlayableContentPlaybackManager_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__MCDPlayableContentPlaybackManager_tableView_didSelectRowAtIndexPath___block_invoke_2;
  block[3] = &unk_24FD78188;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v2);
}

void __71__MCDPlayableContentPlaybackManager_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  void *v1;
  char v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_respondsToSelector();

  if ((v2 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contentManagerInitiatedPlaybackFromPlaybackQueue:", WeakRetained);

  }
}

- (double)_jumpForwardInterval
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[_MCDNowPlayingContentManager nowPlayingItem](self, "nowPlayingItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "seekCommand");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredForwardJumpIntervals");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (double)_jumpBackwardInterval
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[_MCDNowPlayingContentManager nowPlayingItem](self, "nowPlayingItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "seekCommand");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredBackwardJumpIntervals");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (BOOL)nowPlayingViewController:(id)a3 shouldDisplayButton:(int64_t)a4 withImage:(id *)a5 existingIdentifier:(id)a6 tinted:(BOOL *)a7
{
  id v12;
  id v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  double v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  void *v36;

  v12 = a3;
  v13 = a6;
  if (a4 == 2)
  {
    -[_MCDNowPlayingContentManager requestController](self, "requestController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "response");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stop");
    v24 = objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v25 = (void *)v24;
      -[_MCDNowPlayingContentManager requestController](self, "requestController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "response");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "pause");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v28)
      {
        objc_msgSend(v12, "transportControlView");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v29;
        v31 = CFSTR("square.fill");
        goto LABEL_16;
      }
    }
    else
    {

    }
    v33 = -[_MCDNowPlayingContentManager nowPlayingViewControllerIsPlaying:](self, "nowPlayingViewControllerIsPlaying:", v12);
    objc_msgSend(v12, "transportControlView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (!v33)
    {
      objc_msgSend(v29, "setPlayButtonImageName:", CFSTR("play.fill"));
      goto LABEL_20;
    }
    v31 = CFSTR("pause.fill");
LABEL_16:
    objc_msgSend(v29, "setPauseButtonImageName:", v31);
LABEL_20:

    goto LABEL_21;
  }
  if (a4 == 1)
  {
    -[MCDPlayableContentPlaybackManager _jumpForwardInterval](self, "_jumpForwardInterval");
    if (v32 == 0.0)
      goto LABEL_21;
    goto LABEL_12;
  }
  if (a4)
    goto LABEL_21;
  -[MCDPlayableContentPlaybackManager _jumpBackwardInterval](self, "_jumpBackwardInterval");
  if (v14 != 0.0)
  {
LABEL_12:
    -[MCDPlayableContentPlaybackManager _skipIntervalButtonImageForInterval:size:](self, "_skipIntervalButtonImageForInterval:size:", 22);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  -[_MCDNowPlayingContentManager requestController](self, "requestController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "response");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "tracklist");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "changeItemCommand");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "previousItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    -[_MCDNowPlayingContentManager nowPlayingItem](self, "nowPlayingItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "likeCommand");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {

LABEL_19:
      +[MCDGlyph imageNamed:ofSize:](MCDGlyph, "imageNamed:ofSize:", CFSTR("line.horizontal.3.decrease.circle"), 22.0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      -[_MCDNowPlayingContentManager nowPlayingItem](self, "nowPlayingItem");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "likeCommand");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *a7 = objc_msgSend(v36, "value");

      goto LABEL_20;
    }
    -[_MCDNowPlayingContentManager nowPlayingItem](self, "nowPlayingItem");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "dislikeCommand");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
      goto LABEL_19;
  }
LABEL_21:

  return 1;
}

- (id)_skipIntervalButtonImageForInterval:(double)a3 size:(int64_t)a4
{
  __CFString *v6;
  __CFString *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  if (_skipIntervalButtonImageForInterval_size__onceToken != -1)
    dispatch_once(&_skipIntervalButtonImageForInterval_size__onceToken, &__block_literal_global_3);
  v6 = CFSTR("gobackward");
  if (a3 > 0.0)
    v6 = CFSTR("goforward");
  v7 = v6;
  v8 = (void *)_skipIntervalButtonImageForInterval_size____knownIntervals;
  v9 = fabs(a3);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v8, "containsObject:", v10);

  if ((_DWORD)v8)
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@.%@"), v7, v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v13;
  }
  +[MCDGlyph imageNamed:ofSize:](MCDGlyph, "imageNamed:ofSize:", v7, (double)a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __78__MCDPlayableContentPlaybackManager__skipIntervalButtonImageForInterval_size___block_invoke()
{
  void *v0;

  v0 = (void *)_skipIntervalButtonImageForInterval_size____knownIntervals;
  _skipIntervalButtonImageForInterval_size____knownIntervals = (uint64_t)&unk_24FD81988;

}

- (BOOL)nowPlayingViewController:(id)a3 buttonShouldBeActive:(int64_t)a4
{
  id v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a3;
  if (a4 == 1)
  {
    -[MCDPlayableContentPlaybackManager _jumpForwardInterval](self, "_jumpForwardInterval");
    if (v16 == 0.0)
    {
      -[_MCDNowPlayingContentManager requestController](self, "requestController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "response");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "tracklist");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "changeItemCommand");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "nextItem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
      v15 = v19 != 0;

      goto LABEL_10;
    }
LABEL_11:
    v15 = 1;
    goto LABEL_12;
  }
  if (a4)
    goto LABEL_11;
  -[MCDPlayableContentPlaybackManager _jumpBackwardInterval](self, "_jumpBackwardInterval");
  if (v7 != 0.0)
    goto LABEL_11;
  -[_MCDNowPlayingContentManager requestController](self, "requestController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "response");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tracklist");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "changeItemCommand");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "previousItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    goto LABEL_11;
  -[_MCDNowPlayingContentManager nowPlayingItem](self, "nowPlayingItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "likeCommand");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    -[_MCDNowPlayingContentManager nowPlayingItem](self, "nowPlayingItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dislikeCommand");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    goto LABEL_9;
  }
  v15 = 1;
LABEL_10:

LABEL_12:
  return v15;
}

- (void)nowPlayingViewController:(id)a3 didSendAction:(int64_t)a4 state:(int64_t)a5
{
  void *v8;
  void *v9;
  _BOOL4 v10;
  char v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  id v23;
  _BOOL4 v24;
  char v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  MCDPlayableContentPlaybackManager *v29;
  uint64_t v30;
  NSObject *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  double v40;
  double v41;
  NSObject *v42;
  _BOOL4 v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  uint8_t v52[16];

  -[_MCDNowPlayingContentManager nowPlayingItem](self, "nowPlayingItem", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "seekCommand");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 == 2)
  {
    -[_MCDNowPlayingContentManager requestController](self, "requestController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "response");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stop");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[_MCDNowPlayingContentManager requestController](self, "requestController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "response");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "pause");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    MCDGeneralLogging();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (v17 && !v20)
    {
      if (v22)
      {
        *(_WORD *)v52 = 0;
        _os_log_impl(&dword_22FBAA000, v21, OS_LOG_TYPE_DEFAULT, "Sending stop command", v52, 2u);
      }

      v23 = v17;
      goto LABEL_49;
    }
    if (v20)
    {
      if (v22)
      {
        *(_WORD *)v52 = 0;
        _os_log_impl(&dword_22FBAA000, v21, OS_LOG_TYPE_DEFAULT, "Sending pause command", v52, 2u);
      }

      v23 = v20;
      goto LABEL_49;
    }
    if (v22)
    {
      *(_WORD *)v52 = 0;
      _os_log_impl(&dword_22FBAA000, v21, OS_LOG_TYPE_DEFAULT, "Sending play command", v52, 2u);
    }

    -[_MCDNowPlayingContentManager requestController](self, "requestController");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "response");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "play");
    v45 = objc_claimAutoreleasedReturnValue();
LABEL_60:
    v26 = (id)v45;

LABEL_61:
    goto LABEL_62;
  }
  if (a4 != 1)
  {
    if (a4)
      goto LABEL_22;
    v10 = -[MCDPlayableContentPlaybackManager isSeeking](self, "isSeeking");
    if (a5 == 1)
    {
      if (v9)
        v11 = v10;
      else
        v11 = 1;
      if ((v11 & 1) == 0)
      {
        MCDGeneralLogging();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v52 = 0;
          _os_log_impl(&dword_22FBAA000, v12, OS_LOG_TYPE_DEFAULT, "Sending reverse seek command", v52, 2u);
        }

        v13 = v9;
        v14 = -1;
LABEL_39:
        objc_msgSend(v13, "beginSeekWithDirection:", v14);
        v26 = (id)objc_claimAutoreleasedReturnValue();
        v29 = self;
        v30 = 1;
        goto LABEL_40;
      }
      goto LABEL_22;
    }
    if (v10)
    {
      objc_msgSend(v9, "endSeek");
      v26 = (id)objc_claimAutoreleasedReturnValue();
      MCDGeneralLogging();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v52 = 0;
        _os_log_impl(&dword_22FBAA000, v27, OS_LOG_TYPE_DEFAULT, "Sending end reverse seek command", v52, 2u);
      }

LABEL_35:
      v29 = self;
      v30 = 0;
LABEL_40:
      -[MCDPlayableContentPlaybackManager setSeeking:](v29, "setSeeking:", v30);
      goto LABEL_64;
    }
    -[MCDPlayableContentPlaybackManager _jumpBackwardInterval](self, "_jumpBackwardInterval");
    v33 = v32;
    -[_MCDNowPlayingContentManager requestController](self, "requestController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "response");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "tracklist");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "changeItemCommand");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "previousItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33 != 0.0)
    {
      MCDGeneralLogging();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v52 = 0;
        _os_log_impl(&dword_22FBAA000, v38, OS_LOG_TYPE_DEFAULT, "Sending skip backwards command", v52, 2u);
      }

      -[_MCDNowPlayingContentManager nowPlayingItem](self, "nowPlayingItem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "seekCommand");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "jumpByInterval:", v33);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_61;
    }
    if (v17)
    {
      MCDGeneralLogging();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v52 = 0;
        _os_log_impl(&dword_22FBAA000, v46, OS_LOG_TYPE_DEFAULT, "Sending previous item command", v52, 2u);
      }

      v26 = v17;
      goto LABEL_63;
    }
    -[_MCDNowPlayingContentManager nowPlayingItem](self, "nowPlayingItem");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "likeCommand");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (v48)
    {

    }
    else
    {
      -[_MCDNowPlayingContentManager nowPlayingItem](self, "nowPlayingItem");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "dislikeCommand");
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v50)
      {
LABEL_71:
        v26 = 0;
        goto LABEL_63;
      }
    }
    MCDGeneralLogging();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v52 = 0;
      _os_log_impl(&dword_22FBAA000, v51, OS_LOG_TYPE_DEFAULT, "Opening action sheet for like/dislike command", v52, 2u);
    }

    -[MCDPlayableContentPlaybackManager _handleHamburgerActionSheet](self, "_handleHamburgerActionSheet");
    goto LABEL_71;
  }
  v24 = -[MCDPlayableContentPlaybackManager isSeeking](self, "isSeeking");
  if (a5 != 1)
  {
    if (v24)
    {
      MCDGeneralLogging();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v52 = 0;
        _os_log_impl(&dword_22FBAA000, v28, OS_LOG_TYPE_DEFAULT, "Sending end forward seek command", v52, 2u);
      }

      objc_msgSend(v9, "endSeek");
      v26 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_35;
    }
    -[MCDPlayableContentPlaybackManager _jumpForwardInterval](self, "_jumpForwardInterval");
    v41 = v40;
    MCDGeneralLogging();
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
    if (v41 != 0.0)
    {
      if (v43)
      {
        *(_WORD *)v52 = 0;
        _os_log_impl(&dword_22FBAA000, v42, OS_LOG_TYPE_DEFAULT, "Sending skip forward command", v52, 2u);
      }

      -[_MCDNowPlayingContentManager nowPlayingItem](self, "nowPlayingItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "seekCommand");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "jumpByInterval:", v41);
      v23 = (id)objc_claimAutoreleasedReturnValue();
LABEL_49:
      v26 = v23;
LABEL_62:

LABEL_63:
      goto LABEL_64;
    }
    if (v43)
    {
      *(_WORD *)v52 = 0;
      _os_log_impl(&dword_22FBAA000, v42, OS_LOG_TYPE_DEFAULT, "Sending forward item command", v52, 2u);
    }

    -[_MCDNowPlayingContentManager requestController](self, "requestController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "response");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "tracklist");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "changeItemCommand");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "nextItem");
    v45 = objc_claimAutoreleasedReturnValue();
    goto LABEL_60;
  }
  if (v9)
    v25 = v24;
  else
    v25 = 1;
  if ((v25 & 1) == 0)
  {
    MCDGeneralLogging();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v52 = 0;
      _os_log_impl(&dword_22FBAA000, v31, OS_LOG_TYPE_DEFAULT, "Sending forward seek command", v52, 2u);
    }

    v13 = v9;
    v14 = 1;
    goto LABEL_39;
  }
LABEL_22:
  v26 = 0;
LABEL_64:
  -[_MCDNowPlayingContentManager _performChangeRequest:](self, "_performChangeRequest:", v26);

}

- (void)_handleHamburgerActionSheet
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
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setOverrideUserInterfaceStyle:", 2);
  -[_MCDNowPlayingContentManager nowPlayingItem](self, "nowPlayingItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "likeCommand");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    MCDCarDisplayBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("LIKE_TRACK_DEFAULT_TITLE"), &stru_24FD78C58, CFSTR("MusicCarDisplayUI"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCDPlayableContentPlaybackManager _alertActionForFeedbackCommand:fallbackTitle:](self, "_alertActionForFeedbackCommand:fallbackTitle:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addAction:", v7);

  }
  -[_MCDNowPlayingContentManager nowPlayingItem](self, "nowPlayingItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dislikeCommand");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    MCDCarDisplayBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DISLIKE_TRACK_DEFAULT_TITLE"), &stru_24FD78C58, CFSTR("MusicCarDisplayUI"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCDPlayableContentPlaybackManager _alertActionForFeedbackCommand:fallbackTitle:](self, "_alertActionForFeedbackCommand:fallbackTitle:", v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addAction:", v12);

  }
  v13 = (void *)MEMORY[0x24BEBD3A8];
  MCDCarDisplayBundle();
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v14, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24FD78C58, CFSTR("MusicCarDisplayUI"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addAction:", v16);

  -[_MCDNowPlayingContentManager delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v14) = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[_MCDNowPlayingContentManager setAlertController:](self, "setAlertController:", v20);
    -[_MCDNowPlayingContentManager delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MCDNowPlayingContentManager alertController](self, "alertController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "contentManager:presentViewController:", self, v19);

  }
}

- (id)_alertActionForFeedbackCommand:(id)a3 fallbackTitle:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  MCDPlayableContentPlaybackManager *v17;
  id v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "localizedShortTitle");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v6, "localizedTitle");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
      v8 = v7;
  }
  v9 = (void *)MEMORY[0x24BEBD3A8];
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __82__MCDPlayableContentPlaybackManager__alertActionForFeedbackCommand_fallbackTitle___block_invoke;
  v16 = &unk_24FD78A88;
  v17 = self;
  v18 = v6;
  v10 = v6;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v8, 0, &v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setChecked:", objc_msgSend(v10, "value", v13, v14, v15, v16, v17));

  return v11;
}

void __82__MCDPlayableContentPlaybackManager__alertActionForFeedbackCommand_fallbackTitle___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "changeValue:", objc_msgSend(*(id *)(a1 + 40), "value") ^ 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_performChangeRequest:", v2);

}

- (BOOL)nowPlayingViewControllerCanShowAddToLibrary:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  -[_MCDNowPlayingContentManager nowPlayingItem](self, "nowPlayingItem", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wishlistCommand");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (void)nowPlayingViewControllerAddToLibrary:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[_MCDNowPlayingContentManager nowPlayingItem](self, "nowPlayingItem", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wishlistCommand");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "changeValue:", objc_msgSend(v6, "value") ^ 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MCDNowPlayingContentManager _performChangeRequest:](self, "_performChangeRequest:", v5);

  }
}

- (BOOL)nowPlayingViewControllerCanShowMore:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;

  -[_MCDNowPlayingContentManager requestController](self, "requestController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "response");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tracklist");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "changeItemCommand");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "previousItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    return 0;
  -[_MCDNowPlayingContentManager nowPlayingItem](self, "nowPlayingItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "likeCommand");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = 1;
  }
  else
  {
    -[_MCDNowPlayingContentManager nowPlayingItem](self, "nowPlayingItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dislikeCommand");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13 != 0;

  }
  return v11;
}

- (void)nowPlayingViewControllerMore:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[_MCDNowPlayingContentManager requestController](self, "requestController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "response");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tracklist");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "changeItemCommand");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "previousItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    -[MCDPlayableContentPlaybackManager _handleHamburgerActionSheet](self, "_handleHamburgerActionSheet");
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

- (BOOL)isSeeking
{
  return self->_seeking;
}

- (void)setSeeking:(BOOL)a3
{
  self->_seeking = a3;
}

- (MCDPCModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (int64_t)playingItemIndex
{
  return self->_playingItemIndex;
}

- (void)setPlayingItemIndex:(int64_t)a3
{
  self->_playingItemIndex = a3;
}

- (int64_t)totalItemCount
{
  return self->_totalItemCount;
}

- (void)setTotalItemCount:(int64_t)a3
{
  self->_totalItemCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
}

@end
