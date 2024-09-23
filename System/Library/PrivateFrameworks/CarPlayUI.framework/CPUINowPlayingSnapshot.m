@implementation CPUINowPlayingSnapshot

- (MPModelSong)nextSong
{
  return (MPModelSong *)-[CPUINowPlayingSnapshot _getSongIsNext:](self, "_getSongIsNext:", 1);
}

- (MPModelSong)previousSong
{
  return (MPModelSong *)-[CPUINowPlayingSnapshot _getSongIsNext:](self, "_getSongIsNext:", 0);
}

- (id)_getSongIsNext:(BOOL)a3
{
  int v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v3 = a3;
  -[MPCPlayerResponseTracklist items](self->_tracklist, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "totalItemCount");

  -[MPCPlayerResponseTracklist playingItem](self->_tracklist, "playingItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCPlayerResponseTracklist items](self->_tracklist, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if (v6 == 3 || v6 == 2 && v10 == v3)
  {
    -[MPCPlayerResponseTracklist items](self->_tracklist, "items");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if ((v3 & 1) != 0)
      objc_msgSend(v12, "lastItem");
    else
      objc_msgSend(v12, "firstItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    objc_msgSend(v14, "metadataObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "anyObject");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v16;
    else
      v11 = 0;

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (CPUINowPlayingSnapshot)initWithResponse:(id)a3
{
  id v5;
  CPUINowPlayingSnapshot *v6;
  void *v7;
  uint64_t v8;
  NSString *bundleIdentifier;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSString *title;
  void *v26;
  uint64_t v27;
  NSString *artist;
  void *v29;
  void *v30;
  void *v31;
  NSString *v32;
  NSString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSString *v41;
  void *v42;
  uint64_t v43;
  NSString *album;
  uint64_t v45;
  MPArtworkCatalog *artworkCatalog;
  __int128 v47;
  uint64_t v48;
  MPCPlayerResponseTracklist *tracklist;
  MPModelSong *song;
  id v51;
  void *v53;
  void *v54;
  objc_super v55;
  uint8_t v56[4];
  id v57;
  __int16 v58;
  NSObject *v59;
  uint8_t buf[32];
  __int128 v61;
  uint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v55.receiver = self;
  v55.super_class = (Class)CPUINowPlayingSnapshot;
  v6 = -[CPUINowPlayingSnapshot init](&v55, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "playerPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "representedBundleID");
    v8 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v8;

    objc_storeStrong((id *)&v6->_response, a3);
    objc_msgSend(v5, "tracklist");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "playingItemIndexPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    CarPlayUIGeneralLogging();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        -[CPUINowPlayingSnapshot bundleIdentifier](v6, "bundleIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v14;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v11;
        _os_log_impl(&dword_21B6EC000, v12, OS_LOG_TYPE_DEFAULT, "Received MPRequestResponseController response for %@ with playing index path %@", buf, 0x16u);

      }
      objc_msgSend(v5, "tracklist");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "items");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "itemAtIndexPath:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

      objc_storeStrong((id *)&v6->_responseItem, v12);
      v62 = 0;
      v61 = 0u;
      memset(buf, 0, sizeof(buf));
      if (v12)
        -[NSObject duration](v12, "duration");
      -[NSObject metadataObject](v12, "metadataObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "anyObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      CarPlayUIGeneralLogging();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v56 = 138412546;
        v57 = v5;
        v58 = 2112;
        v59 = v12;
        _os_log_impl(&dword_21B6EC000, v19, OS_LOG_TYPE_DEFAULT, "Received item metadata: %@ for %@", v56, 0x16u);
      }

      objc_msgSend(v5, "tracklist");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "items");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "sectionAtIndex:", objc_msgSend(v11, "section"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(v22, "metadataObject");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v6->_isRadioPlayback = objc_msgSend(v23, "type") == 13;

      }
      else
      {
        v6->_isRadioPlayback = 0;
      }
      objc_msgSend(v18, "title");
      v24 = objc_claimAutoreleasedReturnValue();
      title = v6->_title;
      v6->_title = (NSString *)v24;

      if (objc_msgSend(v18, "shouldShowComposer"))
        objc_msgSend(v18, "composer");
      else
        objc_msgSend(v18, "artist");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "name");
      v27 = objc_claimAutoreleasedReturnValue();
      artist = v6->_artist;
      v6->_artist = (NSString *)v27;

      if (v6->_isRadioPlayback)
      {
        objc_msgSend(v22, "metadataObject");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "radioStation");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "attributionLabel");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          v32 = v31;
          v33 = v6->_artist;
          v6->_artist = v32;
        }
        else
        {
          v33 = (NSString *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend(v18, "artist");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "name");
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v35, "length"))
            -[NSString addObject:](v33, "addObject:", v35);
          v54 = v35;
          objc_msgSend(v18, "composer");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "name");
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v18, "shouldShowComposer") && objc_msgSend(v37, "length"))
          {
            v38 = (void *)MEMORY[0x24BDD17C8];
            CPUILocalizedStringForKey(CFSTR("COMPOSED_BY_TITLE_%@"));
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "localizedStringWithFormat:", v53, v37);
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            -[NSString addObject:](v33, "addObject:", v39);
          }
          v40 = -[NSString count](v33, "count");
          if (v40)
          {
            -[NSString componentsJoinedByString:](v33, "componentsJoinedByString:", CFSTR(" — "));
            v40 = objc_claimAutoreleasedReturnValue();
          }
          v41 = v6->_artist;
          v6->_artist = (NSString *)v40;

        }
      }
      objc_msgSend(v18, "album");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "title");
      v43 = objc_claimAutoreleasedReturnValue();
      album = v6->_album;
      v6->_album = (NSString *)v43;

      objc_msgSend(v18, "artworkCatalog");
      v45 = objc_claimAutoreleasedReturnValue();
      artworkCatalog = v6->_artworkCatalog;
      v6->_artworkCatalog = (MPArtworkCatalog *)v45;

      v47 = *(_OWORD *)&buf[16];
      *(_OWORD *)&v6->_durationSnapshot.snapshotTime = *(_OWORD *)buf;
      *(_OWORD *)&v6->_durationSnapshot.endTime = v47;
      *(_OWORD *)&v6->_durationSnapshot.elapsedDuration = v61;
      *(_QWORD *)&v6->_durationSnapshot.isLiveContent = v62;
      v6->_state = objc_msgSend(v5, "state");
      objc_msgSend(v5, "tracklist");
      v48 = objc_claimAutoreleasedReturnValue();
      tracklist = v6->_tracklist;
      v6->_tracklist = (MPCPlayerResponseTracklist *)v48;

      song = v6->_song;
      v6->_song = (MPModelSong *)v18;
      v51 = v18;

    }
    else if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B6EC000, v12, OS_LOG_TYPE_DEFAULT, "Received MPRequestResponseController response without any available now playing item.", buf, 2u);
    }

  }
  return v6;
}

+ (NSArray)knownJumpIntervals
{
  if (knownJumpIntervals_onceToken != -1)
    dispatch_once(&knownJumpIntervals_onceToken, &__block_literal_global_152);
  return (NSArray *)(id)knownJumpIntervals___intervals;
}

void __44__CPUINowPlayingSnapshot_knownJumpIntervals__block_invoke()
{
  void *v0;

  v0 = (void *)knownJumpIntervals___intervals;
  knownJumpIntervals___intervals = (uint64_t)&unk_24DF30390;

}

- (NSNumber)jumpBackInterval
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[CPUINowPlayingSnapshot responseItem](self, "responseItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "seekCommand");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredBackwardJumpIntervals");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v5;
}

- (NSNumber)jumpForwardInterval
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[CPUINowPlayingSnapshot responseItem](self, "responseItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "seekCommand");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredForwardJumpIntervals");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v5;
}

- (BOOL)shouldEnableBackButton
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[CPUINowPlayingSnapshot jumpBackInterval](self, "jumpBackInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 1;
  -[CPUINowPlayingSnapshot tracklist](self, "tracklist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changeItemCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "previousItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    return 0;
  -[CPUINowPlayingSnapshot song](self, "song");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8 != 0;

  return v4;
}

- (BOOL)shouldEnableNextButton
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[CPUINowPlayingSnapshot jumpForwardInterval](self, "jumpForwardInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 1;
  -[CPUINowPlayingSnapshot tracklist](self, "tracklist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changeItemCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nextItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    return 0;
  -[CPUINowPlayingSnapshot song](self, "song");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8 != 0;

  return v4;
}

- (BOOL)showsStopButton
{
  void *v3;
  void *v4;
  BOOL v5;
  NSObject *v6;
  const char *v7;
  char v9;
  uint8_t buf[16];

  -[CPUINowPlayingSnapshot response](self, "response");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stop");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  if (v4)
  {
    -[CPUINowPlayingSnapshot durationSnapshot](self, "durationSnapshot");
    if (!v9)
      return 0;
    CarPlayUIGeneralLogging();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "Playing livestreaming content.";
LABEL_7:
      _os_log_impl(&dword_21B6EC000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
    }
  }
  else
  {
    CarPlayUIGeneralLogging();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "Stop command is disabled.";
      goto LABEL_7;
    }
  }

  return v5;
}

- (id)commandWithType:(unint64_t)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;

  switch(a3)
  {
    case 0uLL:
      -[CPUINowPlayingSnapshot response](self, "response");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stop");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 1uLL:
      -[CPUINowPlayingSnapshot response](self, "response");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "play");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 2uLL:
      -[CPUINowPlayingSnapshot response](self, "response");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "pause");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 3uLL:
      -[CPUINowPlayingSnapshot tracklist](self, "tracklist");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "changeItemCommand");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "nextItem");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 4uLL:
      -[CPUINowPlayingSnapshot tracklist](self, "tracklist");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "changeItemCommand");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "previousItem");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 5uLL:
      -[CPUINowPlayingSnapshot responseItem](self, "responseItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "seekCommand");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "preferredForwardJumpIntervals");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 6uLL:
      -[CPUINowPlayingSnapshot responseItem](self, "responseItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "seekCommand");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "preferredBackwardJumpIntervals");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
      v11 = v9;
      objc_msgSend(v9, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "doubleValue");
      v14 = v13;

      objc_msgSend(v3, "jumpByInterval:", v14);
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v5 = (void *)v4;
      goto LABEL_17;
    case 7uLL:
      -[CPUINowPlayingSnapshot responseItem](self, "responseItem");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "seekCommand");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v15;
      v16 = 1;
      goto LABEL_15;
    case 8uLL:
      -[CPUINowPlayingSnapshot responseItem](self, "responseItem");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "seekCommand");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v15;
      v16 = -1;
LABEL_15:
      objc_msgSend(v15, "beginSeekWithDirection:", v16);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 9uLL:
      -[CPUINowPlayingSnapshot responseItem](self, "responseItem");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "seekCommand");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "endSeek");
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_16:
      v5 = (void *)v7;

LABEL_17:
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)artist
{
  return self->_artist;
}

- (NSString)album
{
  return self->_album;
}

- (MPArtworkCatalog)artworkCatalog
{
  return self->_artworkCatalog;
}

- ($04B05C73ED6AEEF31C5815932084562D)durationSnapshot
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].var0;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var5;
  *(_OWORD *)&retstr->var2 = v3;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[2].var2;
  *(double *)&retstr->var7 = self[2].var4;
  return self;
}

- (int64_t)state
{
  return self->_state;
}

- (MPCPlayerResponseTracklist)tracklist
{
  return self->_tracklist;
}

- (MPModelSong)song
{
  return self->_song;
}

- (BOOL)isRadioPlayback
{
  return self->_isRadioPlayback;
}

- (MPCPlayerResponse)response
{
  return self->_response;
}

- (MPCPlayerResponseItem)responseItem
{
  return self->_responseItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseItem, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_song, 0);
  objc_storeStrong((id *)&self->_tracklist, 0);
  objc_storeStrong((id *)&self->_artworkCatalog, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
