@implementation CPSAudioPlaybackManager

- (CPSAudioPlaybackManager)initWithNowPlayingTemplate:(id)a3 templateDelegate:(id)a4 environment:(id)a5
{
  CPSAudioPlaybackManager *v5;
  CPSAudioPlaybackManager *v7;
  id v8;
  CPSAudioPlaybackManager *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  CPSAudioPlaybackManager *v17;
  id v18;
  objc_super v19;
  id v20;
  id v21;
  id location[2];
  CPSAudioPlaybackManager *v23;

  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v21 = 0;
  objc_storeStrong(&v21, a4);
  v20 = 0;
  objc_storeStrong(&v20, a5);
  v5 = v23;
  v23 = 0;
  v19.receiver = v5;
  v19.super_class = (Class)CPSAudioPlaybackManager;
  v17 = -[CPSAudioPlaybackManager init](&v19, sel_init);
  v23 = v17;
  objc_storeStrong((id *)&v23, v17);
  if (v17)
  {
    objc_storeStrong((id *)&v23->_templateDelegate, v21);
    objc_storeStrong((id *)&v23->_template, location[0]);
    objc_storeWeak((id *)&v23->_environment, v20);
    v23->_shouldShowAlbumArt = 0;
    v8 = (id)objc_msgSend(v20, "sessionStatus");
    objc_msgSend(v8, "addSessionObserver:", v23);

    v9 = v23;
    v12 = (id)objc_msgSend(v20, "sessionStatus");
    v11 = (id)objc_msgSend(v12, "currentSession");
    v10 = (id)objc_msgSend(v11, "configuration");
    -[CPSAudioPlaybackManager _updateAlbumArtFromSessionConfiguration:](v9, "_updateAlbumArtFromSessionConfiguration:");

    v13 = objc_alloc(MEMORY[0x24BE153A8]);
    v14 = (id)objc_msgSend(v20, "bundleIdentifier");
    v18 = (id)objc_msgSend(v13, "initWithBundleIdentifier:");

    objc_msgSend(v18, "setThrottleBehavior:", (objc_msgSend(v20, "isUserApplication") & 1) != 0);
    objc_msgSend(v18, "addNowPlayingObserver:", v23);
    objc_storeStrong((id *)&v23->_nowPlayingManager, v18);
    objc_storeStrong(&v18, 0);
  }
  v7 = v23;
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v23, 0);
  return v7;
}

- (void)updateNowPlayingTemplate:(id)a3 templateDelegate:(id)a4
{
  id v5;
  id location[2];
  CPSAudioPlaybackManager *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  objc_storeStrong((id *)&v7->_template, location[0]);
  objc_storeStrong((id *)&v7->_templateDelegate, v5);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CPSAudioPlaybackManager *v4;

  v4 = self;
  v3 = a2;
  -[CPUINowPlayingManager removeNowPlayingObserver:](self->_nowPlayingManager, "removeNowPlayingObserver:", self);
  v2.receiver = v4;
  v2.super_class = (Class)CPSAudioPlaybackManager;
  -[CPSAudioPlaybackManager dealloc](&v2, sel_dealloc);
}

- (id)nowPlayingButtonWithClass:(Class)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  NSArray *obj;
  uint64_t v9;
  int v10;
  _QWORD __b[8];
  id v12;
  Class v13;
  SEL v14;
  CPSAudioPlaybackManager *v15;
  id v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v15 = self;
  v14 = a2;
  v13 = a3;
  memset(__b, 0, sizeof(__b));
  obj = -[CPNowPlayingTemplate nowPlayingButtons](v15->_template, "nowPlayingButtons");
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v17, 16);
  if (v9)
  {
    v5 = *(_QWORD *)__b[2];
    v6 = 0;
    v7 = v9;
    while (1)
    {
      v4 = v6;
      if (*(_QWORD *)__b[2] != v5)
        objc_enumerationMutation(obj);
      v12 = *(id *)(__b[1] + 8 * v6);
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      ++v6;
      if (v4 + 1 >= v7)
      {
        v6 = 0;
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v17, 16);
        if (!v7)
          goto LABEL_9;
      }
    }
    v16 = v12;
    v10 = 1;
  }
  else
  {
LABEL_9:
    v10 = 0;
  }

  if (!v10)
    v16 = 0;
  return v16;
}

- (id)nowPlayingButtonWithIdentifier:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  NSArray *obj;
  uint64_t v11;
  int v12;
  _QWORD __b[8];
  id v14;
  id location[2];
  CPSAudioPlaybackManager *v16;
  id v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  memset(__b, 0, sizeof(__b));
  obj = -[CPNowPlayingTemplate nowPlayingButtons](v16->_template, "nowPlayingButtons");
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v18, 16);
  if (v11)
  {
    v7 = *(_QWORD *)__b[2];
    v8 = 0;
    v9 = v11;
    while (1)
    {
      v6 = v8;
      if (*(_QWORD *)__b[2] != v7)
        objc_enumerationMutation(obj);
      v14 = *(id *)(__b[1] + 8 * v8);
      v4 = (id)objc_msgSend(v14, "identifier");
      v5 = objc_msgSend(v4, "isEqual:", location[0]);

      if ((v5 & 1) != 0)
        break;
      ++v8;
      if (v6 + 1 >= v9)
      {
        v8 = 0;
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v18, 16);
        if (!v9)
          goto LABEL_9;
      }
    }
    v17 = v14;
    v12 = 1;
  }
  else
  {
LABEL_9:
    v12 = 0;
  }

  if (!v12)
    v17 = 0;
  objc_storeStrong(location, 0);
  return v17;
}

- (void)_updateAlbumArtFromSessionConfiguration:(id)a3
{
  CPSNowPlayingViewController *v3;
  BOOL v4;
  id location[2];
  CPSAudioPlaybackManager *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    v4 = objc_msgSend(location[0], "nowPlayingAlbumArtMode") == 2;
    if (v4 != v6->_shouldShowAlbumArt)
    {
      v6->_shouldShowAlbumArt = v4;
      v3 = -[CPSAudioPlaybackManager nowPlayingViewController](v6, "nowPlayingViewController");
      -[CPSNowPlayingViewController reloadData](v3, "reloadData");

    }
  }
  objc_storeStrong(location, 0);
}

- (void)_loadArtwork:(id)a3
{
  double v3;
  void *v4;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  MPArtworkCatalog *v8;
  CPSAudioPlaybackManager *v9;
  NSString *v10;
  id v11;
  MPArtworkCatalog *v12;
  double v13;
  MPArtworkCatalog *v14;
  NSObject *v15;
  os_log_type_t v16;
  id v17;
  CPSNowPlayingViewController *v18;
  id v19;
  double v20;
  id v21;
  CPSNowPlayingViewController *v22;
  NSObject *log;
  os_log_type_t type;
  uint64_t v25;
  int v26;
  int v27;
  void (*v28)(id *, void *, void *);
  void *v29;
  id v30[3];
  id from;
  id v32;
  os_log_type_t v33;
  id v34[2];
  CGFloat height;
  CGFloat width;
  double v37;
  uint8_t v38[7];
  os_log_type_t v39;
  id v40[3];
  CGSize v41;
  CGSize v42;
  double v43;
  int v44;
  uint8_t v45[15];
  os_log_type_t v46;
  id v47;
  id location[2];
  CPSAudioPlaybackManager *v49;
  uint8_t v50[24];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v49 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    -[CPSAudioPlaybackManager setArtworkCatalog:](v49, "setArtworkCatalog:", location[0]);
    v22 = -[CPSAudioPlaybackManager nowPlayingViewController](v49, "nowPlayingViewController");
    v21 = (id)-[CPSNowPlayingViewController view](v22, "view");
    v19 = (id)objc_msgSend(v21, "traitCollection");
    objc_msgSend(v19, "displayScale");
    v20 = v3;

    v43 = v20;
    v18 = -[CPSAudioPlaybackManager nowPlayingViewController](v49, "nowPlayingViewController");
    v17 = (id)-[CPSNowPlayingViewController view](v18, "view");
    objc_msgSend(v17, "bounds");
    v40[1] = v4;
    v40[2] = v5;
    v41.width = v6;
    v41.height = v7;
    v42 = v41;

    if (v20 < 1.0
      || __CGSizeEqualToSize(v42.width, v42.height, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8)))
    {
      v40[0] = CarPlaySupportGeneralLogging();
      v39 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v40[0], OS_LOG_TYPE_DEFAULT))
      {
        v15 = v40[0];
        v16 = v39;
        __os_log_helper_16_0_0(v38);
        _os_log_impl(&dword_21E389000, v15, v16, "No available target scale or size for artwork loading.", v38, 2u);
      }
      objc_storeStrong(v40, 0);
      v44 = 1;
    }
    else
    {
      v14 = -[CPSAudioPlaybackManager artworkCatalog](v49, "artworkCatalog");
      -[MPArtworkCatalog setDestinationScale:](v14, "setDestinationScale:", v43);

      v37 = 0.0;
      height = v42.height;
      width = v42.width;
      if (v42.width >= v42.height)
        v13 = width;
      else
        v13 = height;
      v34[1] = *(id *)&v13;
      v37 = v13;
      v42.width = v13;
      v42.height = v13;
      v12 = -[CPSAudioPlaybackManager artworkCatalog](v49, "artworkCatalog");
      -[MPArtworkCatalog setFittingSize:](v12, "setFittingSize:", v13, v13);

      v34[0] = CarPlaySupportGeneralLogging();
      v33 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v34[0], OS_LOG_TYPE_DEFAULT))
      {
        v11 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v43);
        v10 = NSStringFromCGSize(v42);
        v32 = v10;
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v50, (uint64_t)v11, (uint64_t)v32);
        _os_log_impl(&dword_21E389000, (os_log_t)v34[0], v33, "Performing artwork load for currently-playing item, scale %@ size %@", v50, 0x16u);

        objc_storeStrong(&v32, 0);
      }
      objc_storeStrong(v34, 0);
      objc_initWeak(&from, v49);
      v8 = -[CPSAudioPlaybackManager artworkCatalog](v49, "artworkCatalog");
      v9 = v49;
      v25 = MEMORY[0x24BDAC760];
      v26 = -1073741824;
      v27 = 0;
      v28 = __40__CPSAudioPlaybackManager__loadArtwork___block_invoke;
      v29 = &unk_24E2705F8;
      objc_copyWeak(v30, &from);
      -[MPArtworkCatalog setDestination:configurationBlock:](v8, "setDestination:configurationBlock:", v9, &v25);

      objc_destroyWeak(v30);
      objc_destroyWeak(&from);
      v44 = 0;
    }
  }
  else
  {
    v47 = CarPlaySupportGeneralLogging();
    v46 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v47, OS_LOG_TYPE_DEFAULT))
    {
      log = v47;
      type = v46;
      __os_log_helper_16_0_0(v45);
      _os_log_impl(&dword_21E389000, log, type, "No artwork available to load.", v45, 2u);
    }
    objc_storeStrong(&v47, 0);
    v44 = 1;
  }
  objc_storeStrong(location, 0);
}

void __40__CPSAudioPlaybackManager__loadArtwork___block_invoke(id *a1, void *a2, void *a3)
{
  NSObject *queue;
  NSObject *log;
  os_log_type_t type;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;
  os_log_type_t v15;
  id v16;
  uint8_t v17[15];
  os_log_type_t v18;
  id v19;
  id v20[2];
  id v21;
  id location[2];
  uint8_t v23[24];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v21 = 0;
  objc_storeStrong(&v21, a3);
  v20[1] = a1;
  v20[0] = objc_loadWeakRetained(a1 + 4);
  if (v21)
  {
    v16 = CarPlaySupportGeneralLogging();
    v15 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v23, (uint64_t)v21);
      _os_log_impl(&dword_21E389000, (os_log_t)v16, v15, "Received artwork response: %@", v23, 0xCu);
    }
    objc_storeStrong(&v16, 0);
  }
  else
  {
    v19 = CarPlaySupportGeneralLogging();
    v18 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
    {
      log = v19;
      type = v18;
      __os_log_helper_16_0_0(v17);
      _os_log_impl(&dword_21E389000, log, type, "No available artwork received.", v17, 2u);
    }
    objc_storeStrong(&v19, 0);
  }
  queue = MEMORY[0x24BDAC9B8];
  v8 = MEMORY[0x24BDAC760];
  v9 = -1073741824;
  v10 = 0;
  v11 = __40__CPSAudioPlaybackManager__loadArtwork___block_invoke_48;
  v12 = &unk_24E26EF28;
  v13 = v20[0];
  v14 = v21;
  dispatch_async(queue, &v8);

  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

void __40__CPSAudioPlaybackManager__loadArtwork___block_invoke_48(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setFullSizeArtwork:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "nowPlayingViewController");
  objc_msgSend(v2, "reloadData");

}

- (id)artistTextForNowPlayingController:(id)a3
{
  CPUINowPlayingSnapshot *v4;
  id v5;
  id location[2];
  CPSAudioPlaybackManager *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[CPSAudioPlaybackManager lastSnapshot](v7, "lastSnapshot");
  v5 = (id)-[CPUINowPlayingSnapshot artist](v4, "artist");

  objc_storeStrong(location, 0);
  return v5;
}

- (id)albumTextForNowPlayingController:(id)a3
{
  CPUINowPlayingSnapshot *v4;
  id v5;
  id location[2];
  CPSAudioPlaybackManager *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[CPSAudioPlaybackManager lastSnapshot](v7, "lastSnapshot");
  v5 = (id)-[CPUINowPlayingSnapshot album](v4, "album");

  objc_storeStrong(location, 0);
  return v5;
}

- (id)titleForNowPlayingController:(id)a3
{
  CPUINowPlayingSnapshot *v4;
  id v5;
  id location[2];
  CPSAudioPlaybackManager *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[CPSAudioPlaybackManager lastSnapshot](v7, "lastSnapshot");
  v5 = (id)-[CPUINowPlayingSnapshot title](v4, "title");

  objc_storeStrong(location, 0);
  return v5;
}

- (id)backgroundArtForNowPlayingController:(id)a3
{
  UIImage *v4;
  id location[2];
  CPSAudioPlaybackManager *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[CPSAudioPlaybackManager fullSizeArtwork](v6, "fullSizeArtwork");
  objc_storeStrong(location, 0);
  return v4;
}

- (BOOL)nowPlayingViewControllerIsShowingExplicitTrack:(id)a3
{
  id v4;
  CPUINowPlayingSnapshot *v5;
  char v6;
  id location[2];
  CPSAudioPlaybackManager *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = -[CPSAudioPlaybackManager lastSnapshot](v8, "lastSnapshot");
  v4 = (id)-[CPUINowPlayingSnapshot song](v5, "song");
  v6 = objc_msgSend(v4, "isExplicitSong");

  objc_storeStrong(location, 0);
  return v6 & 1;
}

- ($04B05C73ED6AEEF31C5815932084562D)durationSnapshotForNowPlayingViewController:(SEL)a3
{
  $04B05C73ED6AEEF31C5815932084562D *result;
  CPUINowPlayingSnapshot *v5;
  CPUINowPlayingSnapshot *v6;
  id location[2];
  CPSAudioPlaybackManager *v9;

  v9 = self;
  location[1] = (id)a3;
  location[0] = 0;
  objc_storeStrong(location, a4);
  if (v9->_shouldShowPlayState)
  {
    v5 = -[CPSAudioPlaybackManager lastSnapshot](v9, "lastSnapshot");
    if (v5)
      -[CPUINowPlayingSnapshot durationSnapshot](v5, "durationSnapshot");
    else
      memset(retstr, 0, sizeof($04B05C73ED6AEEF31C5815932084562D));

  }
  else
  {
    memset(retstr, 0, sizeof($04B05C73ED6AEEF31C5815932084562D));
    v6 = -[CPSAudioPlaybackManager lastSnapshot](v9, "lastSnapshot");
    if (v6)
      -[CPUINowPlayingSnapshot durationSnapshot](v6, "durationSnapshot");
    else
      memset(retstr, 0, sizeof($04B05C73ED6AEEF31C5815932084562D));

    retstr->var5 = 0.0;
  }
  objc_storeStrong(location, 0);
  return result;
}

- (id)progressBarLocalizedDurationStringForNowPlayingViewController:(id)a3
{
  id v4;
  CPUINowPlayingSnapshot *v5;
  id v6;
  id location[2];
  CPSAudioPlaybackManager *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = -[CPSAudioPlaybackManager lastSnapshot](v8, "lastSnapshot");
  v4 = (id)-[CPUINowPlayingSnapshot responseItem](v5, "responseItem");
  v6 = (id)objc_msgSend(v4, "localizedDurationString");

  objc_storeStrong(location, 0);
  return v6;
}

- (BOOL)nowPlayingViewControllerIsPlaying:(id)a3
{
  BOOL v4;
  id location[2];
  CPSAudioPlaybackManager *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[CPSAudioPlaybackManager shouldShowPlayState](v6, "shouldShowPlayState");
  objc_storeStrong(location, 0);
  return v4;
}

- (int64_t)shuffleTypeForNowPlayingViewController:(id)a3
{
  CPUINowPlayingSnapshot *v4;
  int64_t v5;
  id v6;
  id location[2];
  CPSAudioPlaybackManager *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[CPSAudioPlaybackManager lastSnapshot](v8, "lastSnapshot");
  v6 = (id)-[CPUINowPlayingSnapshot tracklist](v4, "tracklist");

  v5 = objc_msgSend(v6, "shuffleType");
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (int64_t)repeatTypeForNowPlayingViewController:(id)a3
{
  CPUINowPlayingSnapshot *v4;
  int64_t v5;
  id v6;
  id location[2];
  CPSAudioPlaybackManager *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[CPSAudioPlaybackManager lastSnapshot](v8, "lastSnapshot");
  v6 = (id)-[CPUINowPlayingSnapshot tracklist](v4, "tracklist");

  v5 = objc_msgSend(v6, "repeatType");
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (int64_t)placeholderTypeForNowPlayingViewController:(id)a3
{
  NSString *v4;
  CPSTemplateEnvironment *v5;
  char v6;
  CPUINowPlayingSnapshot *v7;
  _BYTE __b[56];
  id location[2];
  CPSAudioPlaybackManager *v10;
  int64_t v11;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = -[CPSAudioPlaybackManager lastSnapshot](v10, "lastSnapshot");
  if (v7)
    -[CPUINowPlayingSnapshot durationSnapshot](v7, "durationSnapshot");
  else
    memset(__b, 0, sizeof(__b));
  v6 = __b[48];

  if ((v6 & 1) != 0)
  {
    v11 = 4;
  }
  else
  {
    v5 = -[CPSAudioPlaybackManager environment](v10, "environment");
    v4 = -[CPSTemplateEnvironment bundleIdentifier](v5, "bundleIdentifier");
    v11 = CPUIPlaceholderTypeForBundleIdentifier();

  }
  objc_storeStrong(location, 0);
  return v11;
}

- (id)nowPlayingViewControllerGetPlaybackRate:(id)a3
{
  float v3;
  NSObject *v5;
  os_log_type_t v6;
  NSNumber *v7;
  NSNumber *v8;
  NSNumber *v9;
  void *v10;
  BOOL v11;
  id v12;
  CPUINowPlayingSnapshot *v13;
  uint8_t v14[7];
  os_log_type_t v15;
  os_log_t oslog;
  os_log_type_t v17;
  id v18;
  int v19;
  os_log_type_t v20;
  id v21;
  char v22;
  NSNumber *v23;
  id v24;
  id v25;
  id location[2];
  CPSAudioPlaybackManager *v27;
  NSNumber *v28;
  uint8_t v29[16];
  uint8_t v30[24];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = -[CPSAudioPlaybackManager lastSnapshot](v27, "lastSnapshot");
  v12 = (id)-[CPUINowPlayingSnapshot responseItem](v13, "responseItem");
  v25 = (id)objc_msgSend(v12, "playbackRateCommand");

  if (v25)
  {
    v10 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v25, "preferredPlaybackRate");
    v24 = (id)objc_msgSend(v10, "numberWithFloat:");
    objc_msgSend(v24, "floatValue");
    v22 = 0;
    v11 = 0;
    if (v3 == 0.0)
    {
      v23 = -[CPSAudioPlaybackManager lastSavedPlaybackRate](v27, "lastSavedPlaybackRate");
      v22 = 1;
      v11 = v23 != 0;
    }
    if ((v22 & 1) != 0)

    if (v11)
    {
      v21 = CarPlaySupportGeneralLogging();
      v20 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
      {
        v9 = -[CPSAudioPlaybackManager lastSavedPlaybackRate](v27, "lastSavedPlaybackRate");
        __os_log_helper_16_2_1_8_64((uint64_t)v30, (uint64_t)v9);
        _os_log_impl(&dword_21E389000, (os_log_t)v21, v20, "Playing with a playback rate equal to 0x, returning last saved playback rate: %@", v30, 0xCu);

      }
      objc_storeStrong(&v21, 0);
      v28 = -[CPSAudioPlaybackManager lastSavedPlaybackRate](v27, "lastSavedPlaybackRate");
      v19 = 1;
    }
    else
    {
      -[CPSAudioPlaybackManager setLastSavedPlaybackRate:](v27, "setLastSavedPlaybackRate:", v24);
      v28 = (NSNumber *)v24;
      v19 = 1;
    }
    objc_storeStrong(&v24, 0);
  }
  else
  {
    v8 = -[CPSAudioPlaybackManager lastSavedPlaybackRate](v27, "lastSavedPlaybackRate");

    if (v8)
    {
      v18 = CarPlaySupportGeneralLogging();
      v17 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
      {
        v7 = -[CPSAudioPlaybackManager lastSavedPlaybackRate](v27, "lastSavedPlaybackRate");
        __os_log_helper_16_2_1_8_64((uint64_t)v29, (uint64_t)v7);
        _os_log_impl(&dword_21E389000, (os_log_t)v18, v17, "Returning last saved playback rate: %@", v29, 0xCu);

      }
      objc_storeStrong(&v18, 0);
      v28 = -[CPSAudioPlaybackManager lastSavedPlaybackRate](v27, "lastSavedPlaybackRate");
      v19 = 1;
    }
    else
    {
      oslog = (os_log_t)CarPlaySupportGeneralLogging();
      v15 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v5 = oslog;
        v6 = v15;
        __os_log_helper_16_0_0(v14);
        _os_log_impl(&dword_21E389000, v5, v6, "Returning 0x playback rate", v14, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      v28 = &unk_24E29A640;
      v19 = 1;
    }
  }
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
  return v28;
}

- (void)nowPlayingViewControllerAlbumArtistButtonTapped:(id)a3
{
  id location[2];
  CPSAudioPlaybackManager *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((-[CPNowPlayingClientTemplateDelegate conformsToProtocol:](v4->_templateDelegate, "conformsToProtocol:", &unk_255452190) & 1) != 0)-[CPNowPlayingClientTemplateDelegate albumArtistButtonTapped](v4->_templateDelegate, "albumArtistButtonTapped");
  objc_storeStrong(location, 0);
}

- (BOOL)nowPlayingViewControllerCanShowUpNext:(id)a3
{
  BOOL v4;
  id location[2];
  CPSAudioPlaybackManager *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[CPNowPlayingTemplate isUpNextButtonEnabled](v6->_template, "isUpNextButtonEnabled");
  objc_storeStrong(location, 0);
  return v4;
}

- (id)titleForUpNextInNowPlayingViewController:(id)a3
{
  NSString *v4;
  id location[2];
  CPSAudioPlaybackManager *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[CPNowPlayingTemplate upNextTitle](v6->_template, "upNextTitle");
  objc_storeStrong(location, 0);
  return v4;
}

- (void)nowPlayingViewControllerUpNextButtonTapped:(id)a3
{
  id location[2];
  CPSAudioPlaybackManager *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((-[CPNowPlayingClientTemplateDelegate conformsToProtocol:](v4->_templateDelegate, "conformsToProtocol:", &unk_255452190) & 1) != 0)-[CPNowPlayingClientTemplateDelegate upNextButtonTapped](v4->_templateDelegate, "upNextButtonTapped");
  objc_storeStrong(location, 0);
}

- (void)nowPlayingViewControllerChangePlaybackRate:(id)a3
{
  CPNowPlayingClientTemplateDelegate *templateDelegate;
  id v4;
  id v5;
  id location[2];
  CPSAudioPlaybackManager *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = -[CPSAudioPlaybackManager nowPlayingButtonWithClass:](v7, "nowPlayingButtonWithClass:", objc_opt_class());
  if (v5)
  {
    templateDelegate = v7->_templateDelegate;
    v4 = (id)objc_msgSend(v5, "identifier");
    -[CPNowPlayingClientTemplateDelegate handleActionForControlIdentifier:](templateDelegate, "handleActionForControlIdentifier:");

  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)nowPlayingViewControllerAddToLibrary:(id)a3
{
  CPNowPlayingClientTemplateDelegate *templateDelegate;
  id v4;
  id v5;
  id location[2];
  CPSAudioPlaybackManager *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = -[CPSAudioPlaybackManager nowPlayingButtonWithClass:](v7, "nowPlayingButtonWithClass:", objc_opt_class());
  if (v5)
  {
    templateDelegate = v7->_templateDelegate;
    v4 = (id)objc_msgSend(v5, "identifier");
    -[CPNowPlayingClientTemplateDelegate handleActionForControlIdentifier:](templateDelegate, "handleActionForControlIdentifier:");

  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)nowPlayingViewControllerToggleRepeat:(id)a3
{
  CPNowPlayingClientTemplateDelegate *templateDelegate;
  id v4;
  id v5;
  id location[2];
  CPSAudioPlaybackManager *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = -[CPSAudioPlaybackManager nowPlayingButtonWithClass:](v7, "nowPlayingButtonWithClass:", objc_opt_class());
  if (v5)
  {
    templateDelegate = v7->_templateDelegate;
    v4 = (id)objc_msgSend(v5, "identifier");
    -[CPNowPlayingClientTemplateDelegate handleActionForControlIdentifier:](templateDelegate, "handleActionForControlIdentifier:");

  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)nowPlayingViewControllerToggleShuffle:(id)a3
{
  CPNowPlayingClientTemplateDelegate *templateDelegate;
  id v4;
  id v5;
  id location[2];
  CPSAudioPlaybackManager *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = -[CPSAudioPlaybackManager nowPlayingButtonWithClass:](v7, "nowPlayingButtonWithClass:", objc_opt_class());
  if (v5)
  {
    templateDelegate = v7->_templateDelegate;
    v4 = (id)objc_msgSend(v5, "identifier");
    -[CPNowPlayingClientTemplateDelegate handleActionForControlIdentifier:](templateDelegate, "handleActionForControlIdentifier:");

  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)nowPlayingViewControllerMore:(id)a3
{
  CPNowPlayingClientTemplateDelegate *templateDelegate;
  id v4;
  id v5;
  id location[2];
  CPSAudioPlaybackManager *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = -[CPSAudioPlaybackManager nowPlayingButtonWithClass:](v7, "nowPlayingButtonWithClass:", objc_opt_class());
  if (v5)
  {
    templateDelegate = v7->_templateDelegate;
    v4 = (id)objc_msgSend(v5, "identifier");
    -[CPNowPlayingClientTemplateDelegate handleActionForControlIdentifier:](templateDelegate, "handleActionForControlIdentifier:");

  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)nowPlayingViewController:(id)a3 didSelectButton:(id)a4
{
  CPNowPlayingClientTemplateDelegate *templateDelegate;
  id v5;
  CPSAudioPlaybackManager *v7;
  id v8;
  id v9;
  id v10;
  id location[2];
  CPSAudioPlaybackManager *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v7 = v12;
  v8 = (id)objc_msgSend(v10, "identifier");
  v9 = -[CPSAudioPlaybackManager nowPlayingButtonWithIdentifier:](v7, "nowPlayingButtonWithIdentifier:");

  if (v9)
  {
    templateDelegate = v12->_templateDelegate;
    v5 = (id)objc_msgSend(v9, "identifier");
    -[CPNowPlayingClientTemplateDelegate handleActionForControlIdentifier:](templateDelegate, "handleActionForControlIdentifier:");

  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (id)customPlaybackControlButtonsForNowPlayingViewController:(id)a3
{
  id v4;
  CPSNowPlayingViewController *v5;
  NSArray *v6;
  os_log_t oslog;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(id *, void *, void *, void *);
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id location[2];
  CPSAudioPlaybackManager *v20;
  uint8_t v21[24];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = -[CPSAudioPlaybackManager nowPlayingViewController](v20, "nowPlayingViewController");
  v17 = -[CPUINowPlayingViewController playModeControlView](v5, "playModeControlView");

  v16 = (id)objc_msgSend(v17, "mediaButtons");
  v6 = -[CPNowPlayingTemplate nowPlayingButtons](v20->_template, "nowPlayingButtons");
  v8 = MEMORY[0x24BDAC760];
  v9 = -1073741824;
  v10 = 0;
  v11 = __83__CPSAudioPlaybackManager_customPlaybackControlButtonsForNowPlayingViewController___block_invoke;
  v12 = &unk_24E270620;
  v13 = v16;
  v14 = v17;
  v15 = v18;
  -[NSArray enumerateObjectsUsingBlock:](v6, "enumerateObjectsUsingBlock:", &v8);

  oslog = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v21, (uint64_t)v18);
    _os_log_impl(&dword_21E389000, oslog, OS_LOG_TYPE_DEFAULT, "Returning custom media buttons %@", v21, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v4 = v18;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  return v4;
}

void __83__CPSAudioPlaybackManager_customPlaybackControlButtonsForNowPlayingViewController___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  id obj;
  uint64_t v48;
  os_log_t oslog;
  double v50;
  double v51;
  id v52;
  id v53;
  int v54;
  char v55;
  id v56;
  char v57;
  id v58;
  _QWORD __b[8];
  void *v60;
  id v61[4];
  id location[2];
  uint8_t v63[24];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v61[3] = a3;
  v61[2] = a4;
  v61[1] = a1;
  v61[0] = 0;
  memset(__b, 0, sizeof(__b));
  obj = a1[4];
  v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v64, 16);
  if (v48)
  {
    v41 = *(_QWORD *)__b[2];
    v42 = 0;
    v43 = v48;
    while (1)
    {
      v40 = v42;
      if (*(_QWORD *)__b[2] != v41)
        objc_enumerationMutation(obj);
      v60 = *(void **)(__b[1] + 8 * v42);
      objc_opt_class();
      v57 = 0;
      v55 = 0;
      v39 = 0;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v58 = (id)objc_msgSend(v60, "identifier");
        v57 = 1;
        v56 = (id)objc_msgSend(location[0], "identifier");
        v55 = 1;
        v39 = objc_msgSend(v58, "isEqual:");
      }
      if ((v55 & 1) != 0)

      if ((v57 & 1) != 0)
      if ((v39 & 1) != 0)
        break;
      ++v42;
      if (v40 + 1 >= v43)
      {
        v42 = 0;
        v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v64, 16);
        if (!v43)
          goto LABEL_15;
      }
    }
    v4 = (void *)objc_opt_class();
    v5 = CPSSafeCast_12(v4, v60);
    v6 = v61[0];
    v61[0] = v5;

    v54 = 2;
  }
  else
  {
LABEL_15:
    v54 = 0;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || v61[0])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = (id)objc_msgSend(a1[5], "moreButton");
      v19 = v61[0];
      v61[0] = v18;

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = (id)objc_msgSend(a1[5], "repeatButton");
        v21 = v61[0];
        v61[0] = v20;

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v22 = (id)objc_msgSend(a1[5], "shuffleButton");
          v23 = v61[0];
          v61[0] = v22;

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v24 = (id)objc_msgSend(a1[5], "addToLibraryButton");
            v25 = v61[0];
            v61[0] = v24;

          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v26 = (id)objc_msgSend(a1[5], "playbackRateButton");
              v27 = v61[0];
              v61[0] = v26;

            }
          }
        }
      }
    }
  }
  else
  {
    v7 = (void *)objc_opt_class();
    v53 = CPSSafeCast_12(v7, location[0]);
    v8 = (void *)objc_opt_new();
    v9 = v61[0];
    v61[0] = v8;

    objc_msgSend(v61[0], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v52 = 0;
    v38 = (id)objc_msgSend(v53, "image");
    objc_msgSend(v38, "size");
    v50 = v10;
    v51 = v11;

    if (__CGSizeEqualToSize(v50, v51, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8)))
    {
      oslog = (os_log_t)CarPlaySupportGeneralLogging();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v37 = (id)objc_msgSend(v53, "identifier");
        __os_log_helper_16_2_1_8_64((uint64_t)v63, (uint64_t)v37);
        _os_log_impl(&dword_21E389000, oslog, OS_LOG_TYPE_DEFAULT, "Empty custom image provided for now playing button with identifier: %@", v63, 0xCu);

      }
      objc_storeStrong((id *)&oslog, 0);
      v36 = (id)objc_msgSend(v61[0], "traitCollection");
      v12 = (id)CPUIQuestionmarkGlyph();
      v13 = v52;
      v52 = v12;

    }
    else
    {
      v35 = (id)objc_msgSend(v53, "image");
      v14 = (id)CPImageByScalingImageToSize();
      v15 = v52;
      v52 = v14;

    }
    v16 = (id)objc_msgSend(v52, "imageWithRenderingMode:", 2);
    v17 = v52;
    v52 = v16;

    objc_msgSend(v61[0], "setImage:forState:", v52, 0);
    v31 = v61[0];
    v30 = v52;
    v34 = (id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v33 = (id)objc_msgSend(v34, "colorWithAlphaComponent:", 0.2);
    v32 = (id)objc_msgSend(v30, "imageWithTintColor:");
    objc_msgSend(v31, "setImage:forState:");

    objc_storeStrong(&v52, 0);
    objc_storeStrong(&v53, 0);
  }
  if (v61[0])
  {
    v28 = v61[0];
    v29 = (id)objc_msgSend(location[0], "identifier");
    objc_msgSend(v28, "setIdentifier:");

    objc_msgSend(v61[0], "setEnabled:", objc_msgSend(location[0], "isEnabled") & 1);
    objc_msgSend(v61[0], "setSelected:", objc_msgSend(location[0], "isSelected") & 1);
    objc_msgSend(a1[6], "addObject:", v61[0]);
  }
  objc_storeStrong(v61, 0);
  objc_storeStrong(location, 0);
}

- (void)nowPlayingViewController:(id)a3 didSendAction:(int64_t)a4 state:(int64_t)a5
{
  id v5;
  id v8;
  id v9[2];
  int64_t v10;
  id location[3];
  uint8_t v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = a4;
  v9[1] = (id)a5;
  v9[0] = 0;
  if ((unint64_t)(a4 + 1) <= 3)
    __asm { BR              X8 }
  v8 = CarPlaySupportGeneralLogging();
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
  {
    v5 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v10);
    __os_log_helper_16_2_1_8_64((uint64_t)v12, (uint64_t)v5);
    _os_log_error_impl(&dword_21E389000, (os_log_t)v8, OS_LOG_TYPE_ERROR, "No available remote command for action %@", v12, 0xCu);

  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(v9, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)nowPlayingViewController:(id)a3 shouldDisplayButton:(int64_t)a4 withImage:(id *)a5 existingIdentifier:(id)a6 tinted:(BOOL *)a7
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v14;
  CPSNowPlayingViewController *v15;
  id v16;
  CPSNowPlayingViewController *v17;
  id v18;
  id v19;
  char v20;
  CPUINowPlayingSnapshot *v21;
  id v22;
  CPSNowPlayingViewController *v23;
  id v24;
  CPSNowPlayingViewController *v25;
  id v26;
  id v27;
  char v28;
  CPUINowPlayingSnapshot *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  NSObject *v35;
  os_log_type_t v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  NSObject *v42;
  os_log_type_t v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  NSObject *log;
  os_log_type_t type;
  CPUINowPlayingSnapshot *v51;
  char v52;
  CPSAudioPlaybackManager *v53;
  CPSNowPlayingViewController *v54;
  BOOL v55;
  id v60;
  id v61;
  id v62;
  os_log_type_t v63;
  id v64;
  id v65;
  id v66;
  uint8_t v67[7];
  os_log_type_t v68;
  id v69;
  uint8_t v70[7];
  os_log_type_t v71;
  id v72;
  uint8_t v73[7];
  os_log_type_t v74;
  id v75;
  char v76;
  BOOL *v77;
  id v78;
  id *v79;
  int64_t v80;
  id location[2];
  CPSAudioPlaybackManager *v82;
  uint8_t v83[16];
  uint8_t v84[16];
  id v85;
  id v86;
  _QWORD v87[2];

  v87[1] = *MEMORY[0x24BDAC8D0];
  v82 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v80 = a4;
  v79 = a5;
  v78 = 0;
  objc_storeStrong(&v78, a6);
  v77 = a7;
  if (v80)
  {
    if (v80 == 1)
    {
      v21 = -[CPSAudioPlaybackManager lastSnapshot](v82, "lastSnapshot");
      v62 = (id)-[CPUINowPlayingSnapshot jumpForwardInterval](v21, "jumpForwardInterval");

      if (v62)
      {
        v61 = 0;
        v19 = (id)objc_msgSend(MEMORY[0x24BE153B0], "knownJumpIntervals");
        v20 = objc_msgSend(v19, "containsObject:", v62);

        if ((v20 & 1) != 0)
        {
          v11 = (id)objc_msgSend(v62, "stringValue");
          v12 = v61;
          v61 = v11;

        }
        else
        {
          v60 = CarPlaySupportGeneralLogging();
          if (os_log_type_enabled((os_log_t)v60, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_1_8_66((uint64_t)v83, (uint64_t)v62);
            _os_log_error_impl(&dword_21E389000, (os_log_t)v60, OS_LOG_TYPE_ERROR, "Received request for unknown jump forward interval %{public}@", v83, 0xCu);
          }
          objc_storeStrong(&v60, 0);
        }
        v18 = (id)objc_msgSend(v62, "stringValue");
        v17 = -[CPSAudioPlaybackManager nowPlayingViewController](v82, "nowPlayingViewController");
        v16 = (id)-[CPSNowPlayingViewController traitCollection](v17, "traitCollection");
        *v79 = (id)CPUIImageForTransportButton();

        objc_storeStrong(&v61, 0);
      }
      else
      {
        v15 = -[CPSAudioPlaybackManager nowPlayingViewController](v82, "nowPlayingViewController");
        v14 = (id)-[CPSNowPlayingViewController traitCollection](v15, "traitCollection");
        *v79 = (id)CPUIImageForTransportButton();

      }
      objc_storeStrong(&v62, 0);
    }
    else if (v80 == 2)
    {
      v53 = v82;
      v54 = -[CPSAudioPlaybackManager nowPlayingViewController](v82, "nowPlayingViewController");
      v55 = -[CPSAudioPlaybackManager nowPlayingViewControllerIsPlaying:](v53, "nowPlayingViewControllerIsPlaying:");

      if (v55)
      {
        v51 = -[CPSAudioPlaybackManager lastSnapshot](v82, "lastSnapshot");
        v52 = -[CPUINowPlayingSnapshot showsStopButton](v51, "showsStopButton");

        v76 = v52 & 1;
        if ((v52 & 1) != 0)
        {
          v75 = CarPlaySupportGeneralLogging();
          v74 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled((os_log_t)v75, OS_LOG_TYPE_DEFAULT))
          {
            log = v75;
            type = v74;
            __os_log_helper_16_0_0(v73);
            _os_log_impl(&dword_21E389000, log, type, "Showing stop button", v73, 2u);
          }
          objc_storeStrong(&v75, 0);
          v44 = (id)objc_msgSend(location[0], "transportControlView");
          objc_msgSend(v44, "setPauseButtonImageName:", CFSTR("stop.fill"));

          v48 = (id)CPUILocalizedStringForKey();
          v87[0] = v48;
          v47 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v87, 1);
          v46 = (id)objc_msgSend(location[0], "transportControlView");
          v45 = (id)objc_msgSend(v46, "playPauseButton");
          objc_msgSend(v45, "setAccessibilityUserInputLabels:", v47);

        }
        else
        {
          v72 = CarPlaySupportGeneralLogging();
          v71 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled((os_log_t)v72, OS_LOG_TYPE_DEFAULT))
          {
            v42 = v72;
            v43 = v71;
            __os_log_helper_16_0_0(v70);
            _os_log_impl(&dword_21E389000, v42, v43, "Showing pause button", v70, 2u);
          }
          objc_storeStrong(&v72, 0);
          v37 = (id)objc_msgSend(location[0], "transportControlView");
          objc_msgSend(v37, "setPauseButtonImageName:", CFSTR("pause.fill"));

          v41 = (id)CPUILocalizedStringForKey();
          v86 = v41;
          v40 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v86, 1);
          v39 = (id)objc_msgSend(location[0], "transportControlView");
          v38 = (id)objc_msgSend(v39, "playPauseButton");
          objc_msgSend(v38, "setAccessibilityUserInputLabels:", v40);

        }
      }
      else
      {
        v69 = CarPlaySupportGeneralLogging();
        v68 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v69, OS_LOG_TYPE_DEFAULT))
        {
          v35 = v69;
          v36 = v68;
          __os_log_helper_16_0_0(v67);
          _os_log_impl(&dword_21E389000, v35, v36, "Showing play button", v67, 2u);
        }
        objc_storeStrong(&v69, 0);
        v30 = (id)objc_msgSend(location[0], "transportControlView");
        objc_msgSend(v30, "setPlayButtonImageName:", CFSTR("play.fill"));

        v34 = (id)CPUILocalizedStringForKey();
        v85 = v34;
        v33 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v85, 1);
        v32 = (id)objc_msgSend(location[0], "transportControlView");
        v31 = (id)objc_msgSend(v32, "playPauseButton");
        objc_msgSend(v31, "setAccessibilityUserInputLabels:", v33);

      }
    }
  }
  else
  {
    v29 = -[CPSAudioPlaybackManager lastSnapshot](v82, "lastSnapshot");
    v66 = (id)-[CPUINowPlayingSnapshot jumpBackInterval](v29, "jumpBackInterval");

    if (v66)
    {
      v65 = 0;
      v7 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -objc_msgSend(v66, "integerValue"));
      v8 = v66;
      v66 = v7;

      v27 = (id)objc_msgSend(MEMORY[0x24BE153B0], "knownJumpIntervals");
      v28 = objc_msgSend(v27, "containsObject:", v66);

      if ((v28 & 1) != 0)
      {
        v9 = (id)objc_msgSend(v66, "stringValue");
        v10 = v65;
        v65 = v9;

      }
      else
      {
        v64 = CarPlaySupportGeneralLogging();
        v63 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v64, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_66((uint64_t)v84, (uint64_t)v66);
          _os_log_error_impl(&dword_21E389000, (os_log_t)v64, v63, "Received request for unknown jump back interval %{public}@", v84, 0xCu);
        }
        objc_storeStrong(&v64, 0);
      }
      v26 = (id)objc_msgSend(v66, "stringValue");
      v25 = -[CPSAudioPlaybackManager nowPlayingViewController](v82, "nowPlayingViewController");
      v24 = (id)-[CPSNowPlayingViewController traitCollection](v25, "traitCollection");
      *v79 = (id)CPUIImageForTransportButton();

      objc_storeStrong(&v65, 0);
    }
    else
    {
      v23 = -[CPSAudioPlaybackManager nowPlayingViewController](v82, "nowPlayingViewController");
      v22 = (id)-[CPSNowPlayingViewController traitCollection](v23, "traitCollection");
      *v79 = (id)CPUIImageForTransportButton();

    }
    objc_storeStrong(&v66, 0);
  }
  objc_storeStrong(&v78, 0);
  objc_storeStrong(location, 0);
  return 1;
}

- (BOOL)nowPlayingViewController:(id)a3 buttonShouldBeActive:(int64_t)a4
{
  id location[3];
  char v7;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((unint64_t)(a4 + 1) <= 3)
    __asm { BR              X8 }
  v7 = 0;
  objc_storeStrong(location, 0);
  return v7 & 1;
}

- (BOOL)nowPlayingViewControllerCanShuffle:(id)a3
{
  id v3;
  BOOL v5;
  id location[2];
  CPSAudioPlaybackManager *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSAudioPlaybackManager nowPlayingButtonWithClass:](v7, "nowPlayingButtonWithClass:", objc_opt_class());
  v5 = v3 != 0;

  objc_storeStrong(location, 0);
  return v5;
}

- (BOOL)nowPlayingViewControllerCanRepeat:(id)a3
{
  id v3;
  BOOL v5;
  id location[2];
  CPSAudioPlaybackManager *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSAudioPlaybackManager nowPlayingButtonWithClass:](v7, "nowPlayingButtonWithClass:", objc_opt_class());
  v5 = v3 != 0;

  objc_storeStrong(location, 0);
  return v5;
}

- (BOOL)nowPlayingViewControllerCanShowAddToLibrary:(id)a3
{
  id v3;
  BOOL v5;
  id location[2];
  CPSAudioPlaybackManager *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSAudioPlaybackManager nowPlayingButtonWithClass:](v7, "nowPlayingButtonWithClass:", objc_opt_class());
  v5 = v3 != 0;

  objc_storeStrong(location, 0);
  return v5;
}

- (BOOL)nowPlayingViewControllerCanShowAlbumLink:(id)a3
{
  BOOL v4;
  id location[2];
  CPSAudioPlaybackManager *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[CPNowPlayingTemplate isAlbumArtistButtonEnabled](v6->_template, "isAlbumArtistButtonEnabled");
  objc_storeStrong(location, 0);
  return v4;
}

- (BOOL)nowPlayingViewControllerCanShowChangePlaybackRate:(id)a3
{
  id v3;
  BOOL v5;
  id location[2];
  CPSAudioPlaybackManager *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSAudioPlaybackManager nowPlayingButtonWithClass:](v7, "nowPlayingButtonWithClass:", objc_opt_class());
  v5 = v3 != 0;

  objc_storeStrong(location, 0);
  return v5;
}

- (BOOL)nowPlayingViewControllerCanShowMore:(id)a3
{
  id v3;
  BOOL v5;
  id location[2];
  CPSAudioPlaybackManager *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSAudioPlaybackManager nowPlayingButtonWithClass:](v7, "nowPlayingButtonWithClass:", objc_opt_class());
  v5 = v3 != 0;

  objc_storeStrong(location, 0);
  return v5;
}

- (BOOL)nowPlayingViewControllerCanShowAlbumArt:(id)a3
{
  BOOL v4;
  id location[2];
  CPSAudioPlaybackManager *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[CPSAudioPlaybackManager shouldShowAlbumArt](v6, "shouldShowAlbumArt");
  objc_storeStrong(location, 0);
  return v4;
}

- (void)nowPlayingViewControllerWillAppear:(id)a3
{
  CPUINowPlayingSnapshot *v3;
  id v4;
  id location[2];
  CPSAudioPlaybackManager *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSAudioPlaybackManager lastSnapshot](v6, "lastSnapshot");
  v4 = (id)-[CPUINowPlayingSnapshot artworkCatalog](v3, "artworkCatalog");

  if (v4)
    -[CPSAudioPlaybackManager _loadArtwork:](v6, "_loadArtwork:", v4);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)nowPlayingViewControllerIsRightHandDrive:(id)a3
{
  CPSTemplateEnvironment *v4;
  BOOL v5;
  id location[2];
  CPSAudioPlaybackManager *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[CPSAudioPlaybackManager environment](v7, "environment");
  v5 = -[CPSTemplateEnvironment rightHandDrive](v4, "rightHandDrive");

  objc_storeStrong(location, 0);
  return v5;
}

- (void)session:(id)a3 didUpdateConfiguration:(id)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  CPSAudioPlaybackManager *v11;
  id v12;
  id v13;
  id location[2];
  CPSAudioPlaybackManager *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  queue = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __58__CPSAudioPlaybackManager_session_didUpdateConfiguration___block_invoke;
  v10 = &unk_24E26EF28;
  v11 = v15;
  v12 = v13;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

uint64_t __58__CPSAudioPlaybackManager_session_didUpdateConfiguration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAlbumArtFromSessionConfiguration:", *(_QWORD *)(a1 + 40), a1, a1);
}

- (void)nowPlayingManager:(id)a3 didUpdateSnapshot:(id)a4
{
  CPSNowPlayingViewController *v4;
  CPUINowPlayingSnapshot *v5;
  CPSNowPlayingViewController *v6;
  NSString *v7;
  CPSTemplateEnvironment *v8;
  NSString *v9;
  CPSTemplateEnvironment *v10;
  char v11;
  NSObject *v12;
  os_log_type_t v13;
  NSObject *log;
  os_log_type_t type;
  id v17;
  id v18;
  os_log_type_t v19;
  id v20;
  os_log_type_t v21;
  id v22;
  uint8_t v23[15];
  os_log_type_t v24;
  id v25;
  int v26;
  uint8_t v27[15];
  os_log_type_t v28;
  id v29;
  id v30;
  id v31;
  id location[2];
  CPSAudioPlaybackManager *v33;
  uint8_t v34[16];
  uint8_t v35[16];
  uint8_t v36[24];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v31 = 0;
  objc_storeStrong(&v31, a4);
  v30 = (id)objc_msgSend(v31, "bundleIdentifier");
  if (v30)
  {
    if (v31)
    {
      v10 = -[CPSAudioPlaybackManager environment](v33, "environment");
      v9 = -[CPSTemplateEnvironment bundleIdentifier](v10, "bundleIdentifier");
      v11 = objc_msgSend(v30, "isEqualToString:");

      if ((v11 & 1) != 0)
      {
        v20 = CarPlaySupportGeneralLogging();
        v19 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v35, (uint64_t)v30);
          _os_log_impl(&dword_21E389000, (os_log_t)v20, v19, "Received a now playing update for the current app: %@", v35, 0xCu);
        }
        objc_storeStrong(&v20, 0);
        -[CPSAudioPlaybackManager setLastSnapshot:](v33, "setLastSnapshot:", v31);
        v5 = -[CPSAudioPlaybackManager lastSnapshot](v33, "lastSnapshot");
        -[CPSAudioPlaybackManager setShouldShowPlayState:](v33, "setShouldShowPlayState:", -[CPUINowPlayingSnapshot state](v5, "state") == 2);

        v18 = (id)objc_msgSend(v31, "artworkCatalog");
        if (!v18)
        {
          -[CPSAudioPlaybackManager setArtworkCatalog:](v33, "setArtworkCatalog:");
          -[CPSAudioPlaybackManager setFullSizeArtwork:](v33, "setFullSizeArtwork:", 0);
          v17 = CarPlaySupportGeneralLogging();
          if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v34, (uint64_t)v31);
            _os_log_impl(&dword_21E389000, (os_log_t)v17, OS_LOG_TYPE_DEFAULT, "No artwork catalog available for snapshot %@", v34, 0xCu);
          }
          objc_storeStrong(&v17, 0);
        }
        v4 = -[CPSAudioPlaybackManager nowPlayingViewController](v33, "nowPlayingViewController");
        -[CPSNowPlayingViewController reloadData](v4, "reloadData");

        if (v18)
          -[CPSAudioPlaybackManager _loadArtwork:](v33, "_loadArtwork:", v18);
        objc_storeStrong(&v18, 0);
        v26 = 0;
      }
      else
      {
        v22 = CarPlaySupportGeneralLogging();
        v21 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
        {
          v8 = -[CPSAudioPlaybackManager environment](v33, "environment");
          v7 = -[CPSTemplateEnvironment bundleIdentifier](v8, "bundleIdentifier");
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v36, (uint64_t)v30, (uint64_t)v7);
          _os_log_impl(&dword_21E389000, (os_log_t)v22, v21, "Received a now playing update for a different app: %@ vs ours: %@", v36, 0x16u);

        }
        objc_storeStrong(&v22, 0);
        -[CPSAudioPlaybackManager setShouldShowPlayState:](v33, "setShouldShowPlayState:", 0);
        v6 = -[CPSAudioPlaybackManager nowPlayingViewController](v33, "nowPlayingViewController");
        -[CPSNowPlayingViewController reloadData](v6, "reloadData");

        v26 = 1;
      }
    }
    else
    {
      v25 = CarPlaySupportGeneralLogging();
      v24 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v25;
        v13 = v24;
        __os_log_helper_16_0_0(v23);
        _os_log_impl(&dword_21E389000, v12, v13, "Received an empty now playing snapshot.", v23, 2u);
      }
      objc_storeStrong(&v25, 0);
      v26 = 1;
    }
  }
  else
  {
    v29 = CarPlaySupportGeneralLogging();
    v28 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_DEFAULT))
    {
      log = v29;
      type = v28;
      __os_log_helper_16_0_0(v27);
      _os_log_impl(&dword_21E389000, log, type, "Received a now playing update for an unknown application.", v27, 2u);
    }
    objc_storeStrong(&v29, 0);
    v26 = 1;
  }
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
}

- (void)nowPlayingManager:(id)a3 didThrottleUpdateForBundleIdentifier:(id)a4
{
  CPSAnalytics *v5;
  id v6;
  id v7;
  id location[2];
  CPSAudioPlaybackManager *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v5 = +[CPSAnalytics sharedInstance](CPSAnalytics, "sharedInstance");
  -[CPSAnalytics audioAppMetadataThrottledWithBundleIdentifier:](v5, "audioAppMetadataThrottledWithBundleIdentifier:", v7);

  v6 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("CPSAudioManagerDidThrottleUpdateNotification"), v9);

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (CPSNowPlayingViewController)nowPlayingViewController
{
  return (CPSNowPlayingViewController *)objc_loadWeakRetained((id *)&self->_nowPlayingViewController);
}

- (void)setNowPlayingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_nowPlayingViewController, a3);
}

- (CPUINowPlayingManager)nowPlayingManager
{
  return self->_nowPlayingManager;
}

- (void)setNowPlayingManager:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingManager, a3);
}

- (CPNowPlayingTemplate)template
{
  return self->_template;
}

- (CPNowPlayingClientTemplateDelegate)templateDelegate
{
  return self->_templateDelegate;
}

- (void)setTemplateDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_templateDelegate, a3);
}

- (MPArtworkCatalog)artworkCatalog
{
  return self->_artworkCatalog;
}

- (void)setArtworkCatalog:(id)a3
{
  objc_storeStrong((id *)&self->_artworkCatalog, a3);
}

- (UIImage)fullSizeArtwork
{
  return self->_fullSizeArtwork;
}

- (void)setFullSizeArtwork:(id)a3
{
  objc_storeStrong((id *)&self->_fullSizeArtwork, a3);
}

- (CPUINowPlayingSnapshot)lastSnapshot
{
  return self->_lastSnapshot;
}

- (void)setLastSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_lastSnapshot, a3);
}

- (CPSTemplateEnvironment)environment
{
  return (CPSTemplateEnvironment *)objc_loadWeakRetained((id *)&self->_environment);
}

- (void)setEnvironment:(id)a3
{
  objc_storeWeak((id *)&self->_environment, a3);
}

- (BOOL)actionStateHeld
{
  return self->_actionStateHeld;
}

- (void)setActionStateHeld:(BOOL)a3
{
  self->_actionStateHeld = a3;
}

- (BOOL)shouldShowAlbumArt
{
  return self->_shouldShowAlbumArt;
}

- (void)setShouldShowAlbumArt:(BOOL)a3
{
  self->_shouldShowAlbumArt = a3;
}

- (BOOL)shouldShowPlayState
{
  return self->_shouldShowPlayState;
}

- (void)setShouldShowPlayState:(BOOL)a3
{
  self->_shouldShowPlayState = a3;
}

- (NSNumber)lastSavedPlaybackRate
{
  return self->_lastSavedPlaybackRate;
}

- (void)setLastSavedPlaybackRate:(id)a3
{
  objc_storeStrong((id *)&self->_lastSavedPlaybackRate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSavedPlaybackRate, 0);
  objc_destroyWeak((id *)&self->_environment);
  objc_storeStrong((id *)&self->_lastSnapshot, 0);
  objc_storeStrong((id *)&self->_fullSizeArtwork, 0);
  objc_storeStrong((id *)&self->_artworkCatalog, 0);
  objc_storeStrong((id *)&self->_templateDelegate, 0);
  objc_storeStrong((id *)&self->_template, 0);
  objc_storeStrong((id *)&self->_nowPlayingManager, 0);
  objc_destroyWeak((id *)&self->_nowPlayingViewController);
}

@end
