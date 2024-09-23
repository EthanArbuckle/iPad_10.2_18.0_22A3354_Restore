@implementation MPCExternalPlaybackController

- (MPCExternalPlaybackController)initWithPlaybackEngine:(id)a3 translator:(id)a4
{
  id v6;
  id v7;
  MPCExternalPlaybackController *v8;
  MPCExternalPlaybackController *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MPCExternalPlaybackController;
  v8 = -[MPCExternalPlaybackController init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_playbackEngine, v6);
    objc_storeStrong((id *)&v9->_translator, a4);
  }

  return v9;
}

- (MPAVRoutingController)routingController
{
  MPAVRoutingController *routingController;
  id v4;
  objc_class *v5;
  void *v6;
  MPAVRoutingController *v7;
  MPAVRoutingController *v8;

  routingController = self->_routingController;
  if (!routingController)
  {
    v4 = objc_alloc(MEMORY[0x24BDDC6D0]);
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (MPAVRoutingController *)objc_msgSend(v4, "initWithName:", v6);
    v8 = self->_routingController;
    self->_routingController = v7;

    -[MPAVRoutingController setFetchAvailableRoutesSynchronously:](self->_routingController, "setFetchAvailableRoutesSynchronously:", 1);
    routingController = self->_routingController;
  }
  return routingController;
}

- (void)configureExternalPlaybackForPlayer:(id)a3 queueItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  __CFString *v12;
  uint64_t v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  MPCExternalPlaybackController *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  uint64_t v30;
  _BOOL8 v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  int v54;
  uint64_t v55;
  void *v56;
  NSObject *v57;
  uint64_t v58;
  MPCExternalPlaybackController *v59;
  void *v60;
  __CFString *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  MPCExternalPlaybackController *v68;
  id v69;
  _QWORD v70[3];
  _QWORD v71[3];
  uint8_t buf[4];
  uint64_t v73;
  __int16 v74;
  MPCExternalPlaybackController *v75;
  __int16 v76;
  _BYTE v77[10];
  id v78;
  __int16 v79;
  const __CFString *v80;
  _QWORD v81[12];
  _QWORD v82[14];

  v82[12] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v7, "isAssetLoaded"))
    goto LABEL_57;
  v68 = self;
  v69 = v6;
  -[MPCExternalPlaybackController routingController](self, "routingController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pickedRoute");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reevaluateType");
  objc_msgSend(v7, "reevaluateHasProtectedContent");
  v10 = objc_msgSend(v8, "externalScreenType");
  v82[0] = MEMORY[0x24BDBD1C0];
  v81[0] = CFSTR("_useAirPlayMusicMode");
  v81[1] = CFSTR("itemAllowsAirPlayFromCloud");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v7, "allowsAirPlayFromCloud"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v82[1] = v64;
  v81[2] = CFSTR("itemAllowsExternalPlayback");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v7, "allowsExternalPlayback"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v82[2] = v63;
  v81[3] = CFSTR("itemHasProtectedContent");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v7, "hasProtectedContent"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v82[3] = v62;
  v81[4] = CFSTR("itemType");
  v11 = objc_msgSend(v7, "type");
  if (v11 >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown - %ld"), v11);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = off_24CAB5A28[v11];
  }
  v61 = v12;
  v82[4] = v12;
  v81[5] = CFSTR("itemPlaybackMode");
  v13 = objc_msgSend(v7, "playbackMode");
  v65 = v8;
  if (v13)
  {
    if (v13 == 1)
    {
      v14 = CFSTR("Streaming");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown - %ld"), v13);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v14 = CFSTR("File");
  }
  v82[5] = v14;
  v81[6] = CFSTR("externalScreenType");
  if (v10 >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown - %ld"), v10);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = off_24CAB5A40[v10];
  }
  v82[6] = v15;
  v81[7] = CFSTR("isAppleTVRoute");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v9, "isAppleTVRoute"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v82[7] = v16;
  v81[8] = CFSTR("routeSubtype");
  objc_msgSend(v9, "routeSubtype");
  MPAVRouteSubtypeDescription();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v82[8] = v17;
  v81[9] = CFSTR("canPlayEncryptedProgressiveDownloadAssets");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v9, "canPlayEncryptedProgressiveDownloadAssets"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v82[9] = v18;
  v81[10] = CFSTR("canFetchMediaDataFromSender");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v9, "canFetchMediaDataFromSender"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v82[10] = v19;
  v81[11] = CFSTR("presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v9, "presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v82[11] = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v82, v81, 12);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = v68;
  LODWORD(v16) = -[MPCExternalPlaybackController isExternalPlaybackAllowedForItem:](v68, "isExternalPlaybackAllowedForItem:", v7);
  v22 = -[MPCExternalPlaybackController playerShouldUseAudiOnlyMode:item:externalScreenType:](v68, "playerShouldUseAudiOnlyMode:item:externalScreenType:", v69, v7, v10);
  v66 = v9;
  if (!(_DWORD)v16)
  {
    v30 = 0;
    v31 = 0;
    v24 = 0x24BDD1000;
LABEL_40:
    v6 = v69;
    goto LABEL_44;
  }
  v23 = -[MPCExternalPlaybackController exernalPlaybackRouteRestrictionForItem:route:isScreenMirroringActive:](v68, "exernalPlaybackRouteRestrictionForItem:route:isScreenMirroringActive:", v7, v9, v10 != 0);
  v24 = 0x24BDD1000uLL;
  if (v23)
  {
    -[MPCExternalPlaybackController playbackEngine](v68, "playbackEngine");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v25, "engineID");
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)v27;
      if ((unint64_t)(v23 - 2) > 2)
        v29 = CFSTR("Picked route can't play encrypted local files via progressive download");
      else
        v29 = off_24CAB5A58[v23 - 2];
      *(_DWORD *)buf = 138544386;
      v73 = v27;
      v74 = 2048;
      v75 = v68;
      v76 = 2114;
      *(_QWORD *)v77 = v9;
      *(_WORD *)&v77[8] = 2114;
      v78 = v7;
      v79 = 2114;
      v80 = v29;
      _os_log_impl(&dword_210BD8000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCExternalPlaybackControllerImplementation %p - External playback configuration [Overriding isExternalPlaybackPossible to NO] - Picked route does not support external display - pickedRoute:%{public}@ - item:%{public}@ - reason:%{public}@", buf, 0x34u);

    }
  }
  if (v10 && objc_msgSend(v7, "type") != 2)
  {
    -[MPCExternalPlaybackController playbackEngine](v68, "playbackEngine");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v32, "engineID");
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = (void *)v34;
      if ((unint64_t)(v23 - 1) > 3)
        v36 = CFSTR("Picked route has no restrictions");
      else
        v36 = off_24CAB5A70[v23 - 1];
      *(_DWORD *)buf = 138544386;
      v73 = v34;
      v74 = 2048;
      v75 = v68;
      v76 = 2114;
      *(_QWORD *)v77 = v9;
      *(_WORD *)&v77[8] = 2114;
      v78 = v7;
      v79 = 2114;
      v80 = v36;
      _os_log_impl(&dword_210BD8000, v33, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCExternalPlaybackControllerImplementation %p - External playback configuration [Overriding isExternalPlaybackPossible to NO] - Screen mirroring is on for an audio item - pickedRoute:%{public}@ - item:%{public}@ - reason:%{public}@", buf, 0x34u);

    }
    if (objc_msgSend(v7, "type") != 1)
    {
LABEL_39:
      v30 = 0;
      v31 = 0;
      goto LABEL_40;
    }
  }
  else if (objc_msgSend(v7, "type") != 1)
  {
    if (!v23)
    {
      v31 = (v10 || -[MPCExternalPlaybackController isPodcastContent:](v68, "isPodcastContent:", v7))
         && objc_msgSend(v7, "type") == 2;
      v30 = 1;
      goto LABEL_40;
    }
    goto LABEL_39;
  }
  -[MPCExternalPlaybackController playbackEngine](v68, "playbackEngine");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v6 = v69;
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v37, "engineID");
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = (void *)v39;
    if ((unint64_t)(v23 - 1) > 3)
      v41 = CFSTR("Picked route has no restrictions");
    else
      v41 = off_24CAB5A70[v23 - 1];
    *(_DWORD *)buf = 138544386;
    v73 = v39;
    v74 = 2048;
    v75 = v68;
    v76 = 2114;
    *(_QWORD *)v77 = v9;
    *(_WORD *)&v77[8] = 2114;
    v78 = v7;
    v79 = 2114;
    v80 = v41;
    _os_log_impl(&dword_210BD8000, v38, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCExternalPlaybackControllerImplementation %p - External playback configuration [Overriding isExternalPlaybackPossible to NO] - We prefer buffered audio over url flinging for audio items - pickedRoute:%{public}@ - item:%{public}@ - reason:%{public}@", buf, 0x34u);

  }
  v30 = 0;
  v31 = 0;
LABEL_44:
  v70[0] = CFSTR("usesExternalPlaybackWhileExternalScreenIsActive");
  objc_msgSend(*(id *)(v24 + 1760), "numberWithBool:", v31);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = v42;
  v70[1] = CFSTR("isExternalPlaybackAllowed");
  objc_msgSend(*(id *)(v24 + 1760), "numberWithBool:", v30);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v71[1] = v43;
  v70[2] = CFSTR("usesAudioOnlyMode");
  objc_msgSend(*(id *)(v24 + 1760), "numberWithBool:", v22);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v71[2] = v44;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v71, v70, 3);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCExternalPlaybackController playbackEngine](v68, "playbackEngine");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v46, "engineID");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "msv_compactDescription");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "msv_compactDescription");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v73 = (uint64_t)v48;
    v74 = 2048;
    v75 = v68;
    v76 = 2114;
    *(_QWORD *)v77 = v49;
    *(_WORD *)&v77[8] = 2114;
    v78 = v50;
    _os_log_impl(&dword_210BD8000, v47, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCExternalPlaybackControllerImplementation %p - External playback configuration [diagnosis] - input: %{public}@ -> output: %{public}@", buf, 0x2Au);

    v6 = v69;
    v21 = v68;

  }
  -[MPCExternalPlaybackController playbackEngine](v21, "playbackEngine");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v51, "engineID");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v73 = (uint64_t)v53;
    v74 = 2048;
    v75 = v21;
    v76 = 1024;
    *(_DWORD *)v77 = v31;
    *(_WORD *)&v77[4] = 1024;
    *(_DWORD *)&v77[6] = v22;
    LOWORD(v78) = 1024;
    *(_DWORD *)((char *)&v78 + 2) = v30;
    _os_log_impl(&dword_210BD8000, v52, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCExternalPlaybackControllerImplementation %p - External playback configuration [Updating player] - usesExternalPlaybackWhileExternalScreenIsActive:%{BOOL}u, usesAudioOnlyMode:%{BOOL}u, wantsExternalPlayback:%{BOOL}u", buf, 0x28u);

  }
  v54 = v22 ^ objc_msgSend(v6, "usesAudioOnlyModeForExternalPlayback");
  if (v54 == 1)
    objc_msgSend(v6, "setUsesAudioOnlyModeForExternalPlayback:", v22);
  objc_msgSend(v6, "setUsesExternalPlaybackWhileExternalScreenIsActive:", v31);
  if ((_DWORD)v30 != objc_msgSend(v6, "allowsExternalPlayback"))
    goto LABEL_53;
  if (v54)
  {
    objc_msgSend(v6, "setAllowsExternalPlayback:", v30 ^ 1);
LABEL_53:
    objc_msgSend(v6, "setAllowsExternalPlayback:", v30);
  }
  v55 = v30 & objc_msgSend(v66, "isAppleTVRoute");
  -[MPCExternalPlaybackController playbackEngine](v21, "playbackEngine");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v56, "engineID");
    v58 = objc_claimAutoreleasedReturnValue();
    v59 = v21;
    v60 = (void *)v58;
    *(_DWORD *)buf = 138544130;
    v73 = v58;
    v74 = 2048;
    v75 = v59;
    v76 = 2114;
    *(_QWORD *)v77 = v7;
    *(_WORD *)&v77[8] = 1024;
    LODWORD(v78) = v55;
    _os_log_impl(&dword_210BD8000, v57, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCExternalPlaybackControllerImplementation %p - External playback configuration [Updating item] - queueItem:%{public}@ - externalDisplay:%{BOOL}u", buf, 0x26u);

  }
  objc_msgSend(v7, "setExternalDisplay:", v55);

LABEL_57:
}

- (void)pickBestDeviceRoute
{
  id v2;

  -[MPCExternalPlaybackController routingController](self, "routingController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pickBestDeviceRoute");

}

- (BOOL)isPodcastContent:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "mediaType") == 2 || objc_msgSend(v3, "mediaType") == 1024;

  return v4;
}

- (BOOL)isExternalPlaybackAllowedForItem:(id)a3
{
  return objc_msgSend(a3, "allowsExternalPlayback");
}

- (BOOL)playerShouldUseAudiOnlyMode:(id)a3 item:(id)a4 externalScreenType:(int64_t)a5
{
  return objc_msgSend(a4, "type", a3) != 2;
}

- (int64_t)exernalPlaybackRouteRestrictionForItem:(id)a3 route:(id)a4 isScreenMirroringActive:(BOOL)a5
{
  id v7;
  id v8;
  int64_t v9;

  v7 = a3;
  v8 = a4;
  if (-[MPCExternalPlaybackController isPodcastContent:](self, "isPodcastContent:", v7))
    goto LABEL_12;
  if ((objc_msgSend(v8, "canPlayEncryptedProgressiveDownloadAssets") & 1) != 0
    || objc_msgSend(v7, "playbackMode")
    || (objc_msgSend(v7, "hasProtectedContent") & 1) == 0)
  {
    if ((objc_msgSend(v8, "canFetchMediaDataFromSender") & 1) == 0 && !objc_msgSend(v7, "playbackMode"))
    {
      v9 = 2;
      goto LABEL_13;
    }
    if ((objc_msgSend(v8, "presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets") & 1) == 0
      && objc_msgSend(v7, "type") == 1)
    {
      v9 = 3;
      goto LABEL_13;
    }
    if (objc_msgSend(v7, "type") != 2
      && (!objc_msgSend(v8, "canAccessRemoteAssets")
       || (objc_msgSend(v7, "allowsAirPlayFromCloud") & 1) == 0))
    {
      v9 = 4;
      goto LABEL_13;
    }
LABEL_12:
    v9 = 0;
    goto LABEL_13;
  }
  v9 = 1;
LABEL_13:

  return v9;
}

- (MPCPlaybackEngine)playbackEngine
{
  return (MPCPlaybackEngine *)objc_loadWeakRetained((id *)&self->_playbackEngine);
}

- (MPCMediaFoundationTranslator)translator
{
  return self->_translator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translator, 0);
  objc_destroyWeak((id *)&self->_playbackEngine);
  objc_storeStrong((id *)&self->_routingController, 0);
}

@end
