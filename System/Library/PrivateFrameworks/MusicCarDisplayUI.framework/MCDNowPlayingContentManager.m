@implementation MCDNowPlayingContentManager

void __50___MCDNowPlayingContentManager__limitedUIChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

  objc_msgSend(*(id *)(a1 + 32), "carSessionStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentSession");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "limitUserInterfaces");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "BOOLValue") & 1) != 0)
  {
    objc_msgSend(v7, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setLimitedUI:", ((unint64_t)objc_msgSend(v5, "limitableUserInterfaces") >> 3) & 1);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setLimitedUI:", 0);
  }

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadData");

}

uint64_t __59___MCDNowPlayingContentManager_modelResponseDidInvalidate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BDDC3F8];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:name:object:", v4, v3, v5);

  return objc_msgSend(*(id *)(a1 + 32), "_performRequest");
}

void __69___MCDNowPlayingContentManager_controller_defersResponseReplacement___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
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
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  _BOOL8 v31;
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
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  char v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  char v71;
  void *v72;
  uint8_t v73[16];
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "response");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playerPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "representedBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "response");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setLastReceivedResponse:", v7);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setLastReceivedResponse:", 0);
  }
  objc_msgSend(*(id *)(a1 + 40), "lastReceivedResponse");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tracklist");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "playingItemIndexPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *(void **)(a1 + 40);
  if (v10)
  {
    objc_msgSend(v11, "lastReceivedResponse");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tracklist");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "items");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "lastReceivedResponse");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "tracklist");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "playingItemIndexPath");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "itemAtIndexPath:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setNowPlayingItem:", v18);

  }
  else
  {
    objc_msgSend(v11, "setNowPlayingItem:", 0);
  }
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_opt_respondsToSelector();

  if ((v20 & 1) != 0)
  {
    v21 = *(void **)(a1 + 40);
    objc_msgSend(v21, "lastReceivedResponse");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "tracklist");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "items");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v21, "_shouldShowPlaybackQueueForItemCount:", objc_msgSend(v24, "totalItemCount"));

    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "contentManager:shouldShowPlaybackQueue:", *(_QWORD *)(a1 + 40), v25);

  }
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_opt_respondsToSelector();

  if ((v28 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "nowPlayingItem");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29)
    {
      objc_msgSend(v29, "duration");
      v31 = BYTE1(v77) != 0;
    }
    else
    {
      v31 = 0;
      v77 = 0;
      v75 = 0u;
      v76 = 0u;
      v74 = 0u;
    }

    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "contentManager:bufferingItem:", *(_QWORD *)(a1 + 40), v31);

  }
  objc_msgSend(*(id *)(a1 + 40), "setCurrentPlayingPlaylist:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setCurrentPlayingRadioStation:", 0);
  objc_msgSend(*(id *)(a1 + 40), "lastReceivedResponse");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "tracklist");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "playingItemIndexPath");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    objc_msgSend(*(id *)(a1 + 40), "lastReceivedResponse");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "tracklist");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "items");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "itemAtIndexPath:", v35);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v39, "isAutoPlay") & 1) != 0)
    {
LABEL_22:

      goto LABEL_23;
    }
    objc_msgSend(*(id *)(a1 + 40), "lastReceivedResponse");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "tracklist");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "items");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "sectionAtIndex:", objc_msgSend(v35, "section"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v43, "metadataObject");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "type");
    if (v45 == 13)
    {
      objc_msgSend(v44, "radioStation");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setCurrentPlayingRadioStation:", v46);
    }
    else
    {
      if (v45 != 4)
      {
LABEL_21:

        goto LABEL_22;
      }
      objc_msgSend(v44, "playlist");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setCurrentPlayingPlaylist:", v46);
    }

    goto LABEL_21;
  }
LABEL_23:
  objc_msgSend(*(id *)(a1 + 40), "nowPlayingItem");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "metadataObject");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v48, "flattenedGenericObject");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "anyObject");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "currentPlayingSong");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51 != v50)
  {
    objc_msgSend(*(id *)(a1 + 40), "setCurrentPlayingSong:", v50);
    objc_msgSend(*(id *)(a1 + 40), "processArtworkForCurrentlyPlayingSong");
    if (objc_msgSend(v48, "type") == 5)
    {
      objc_msgSend(v48, "playlistEntry");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setCurrentPlayingPlaylistEntry:", v52);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "setCurrentPlayingPlaylistEntry:", 0);
    }
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_opt_respondsToSelector();

    if ((v54 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = *(void **)(a1 + 40);
      objc_msgSend(v56, "currentPlayingSong");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "lastReceivedResponse");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "contentManager:itemDidChange:response:", v56, v57, v58);

    }
    MCDGeneralLogging();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v73 = 0;
      _os_log_impl(&dword_22FBAA000, v59, OS_LOG_TYPE_DEFAULT, "Playing content has changed, posting notification", v73, 2u);
    }

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "postNotificationName:object:", CFSTR("MCDContentItemsChangedNotification"), 0);

  }
  objc_msgSend(*(id *)(a1 + 40), "lastReceivedResponse");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "state");

  if (v62 != objc_msgSend(*(id *)(a1 + 40), "playerState"))
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 144) = v62;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "postNotificationName:object:", CFSTR("MCDPlaybackStateChangedNotification"), 0);

  }
  v64 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "response");
  v65 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "_processResponse:error:", v65, 0);

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v65) = objc_opt_respondsToSelector();

  if ((v65 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "response");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "contentManager:processResponse:error:", v68, v69, 0);

  }
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_opt_respondsToSelector();

  if ((v71 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "contentManagerReloadData:", *(_QWORD *)(a1 + 40));

  }
}

void __69___MCDNowPlayingContentManager_processArtworkForCurrentlyPlayingSong__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  MCDGeneralLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __69___MCDNowPlayingContentManager_processArtworkForCurrentlyPlayingSong__block_invoke_cold_1(WeakRetained, v2);

  objc_msgSend(WeakRetained, "_showPlaceholderArtwork");
}

void __69___MCDNowPlayingContentManager_processArtworkForCurrentlyPlayingSong__block_invoke_45(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __69___MCDNowPlayingContentManager_processArtworkForCurrentlyPlayingSong__block_invoke_2;
    block[3] = &unk_24FD78768;
    v7 = *(id *)(a1 + 32);
    v8 = WeakRetained;
    v9 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __69___MCDNowPlayingContentManager_processArtworkForCurrentlyPlayingSong__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "currentPlayingSong");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "artworkCatalog");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isArtworkVisuallyIdenticalToCatalog:", v4);

  if ((_DWORD)v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "setArtworkTimer:", 0);
    objc_msgSend(*(id *)(a1 + 40), "setAlbumArtwork:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "contentManagerReloadData:", *(_QWORD *)(a1 + 40));

    }
  }
}

void __69___MCDNowPlayingContentManager_processArtworkForCurrentlyPlayingSong__block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "artworkCatalog");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 134217984;
  v5 = v3;
  _os_log_debug_impl(&dword_22FBAA000, a2, OS_LOG_TYPE_DEBUG, "Timeout while waiting for artworkCatalog=%p", (uint8_t *)&v4, 0xCu);

}

@end
