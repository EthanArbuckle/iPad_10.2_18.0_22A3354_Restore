@implementation MPCMediaFoundationTranslator

- (BOOL)canSkipInDirection:(int64_t)a3 fromItem:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  BOOL v12;
  void *v14;

  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCMediaFoundationTranslator.m"), 165, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[(MPAVItem *)queueItem isKindOfClass:[MPAVItem class]]"));

  }
  -[MPCMediaFoundationTranslator playbackEngine](self, "playbackEngine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queueController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    if (a3 != 1)
    {
      v12 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v7, "contentItemID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "canNextTrackForContentItemID:reason:", v10, 0);
  }
  else
  {
    objc_msgSend(v7, "contentItemID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "canPreviousTrackForContentItemID:reason:", v10, 0);
  }
  v12 = v11;

LABEL_9:
  return v12;
}

- (MPCPlaybackEngine)playbackEngine
{
  return (MPCPlaybackEngine *)objc_loadWeakRetained((id *)&self->_playbackEngine);
}

- (id)queueItemForContentItemID:(id)a3 allowReuse:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v6 = a4;
  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  -[MPCMediaFoundationTranslator playbackEngine](self, "playbackEngine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "queueController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCMediaFoundationTranslator _MPAVItemForContentItemID:allowReuse:](self, "_MPAVItemForContentItemID:allowReuse:", v8, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "engineID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sessionID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v17 = v13;
    v18 = 2114;
    v19 = v14;
    v20 = 2114;
    v21 = v8;
    v22 = 1024;
    v23 = v6;
    v24 = 2114;
    v25 = v11;
    _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] queueItemForContentItemID:%{public}@ allowReuse:%{BOOL}u | receive queue item [] item=%{public}@", buf, 0x30u);

  }
  if (a5 && !v11)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 3007, CFSTR("Failed to resolve queue item with contentItemID:%@ allowReuse:%d"), v8, v6);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)contentItemIDsFromOffset:(int64_t)a3 toOffset:(int64_t)a4 nowPlayingIndex:(int64_t *)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int64_t v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  int64_t v23;
  __int16 v24;
  int64_t v25;
  __int16 v26;
  int64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[MPCMediaFoundationTranslator playbackEngine](self, "playbackEngine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "queueController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentItemIDsFromOffset:toOffset:mode:nowPlayingIndex:", a3, a4, 3, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "engineID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sessionID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *a5;
      objc_msgSend(v11, "msv_compactDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138544642;
      v19 = v13;
      v20 = 2114;
      v21 = v14;
      v22 = 2048;
      v23 = a3;
      v24 = 2048;
      v25 = a4;
      v26 = 2048;
      v27 = v15;
      v28 = 2114;
      v29 = v16;
      _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] contentItemIDsFromOffset:%ld toOffset:%ld nowPlayingIndex:%ld | receive natural playback items [] contentItemIDs=[%{public}@]", (uint8_t *)&v18, 0x3Eu);

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)invalidateCache
{
  id v2;

  -[MPCMediaFoundationTranslator mapping](self, "mapping");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (id)_MPAVItemForContentItemID:(id)a3 allowReuse:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  v4 = a4;
  v6 = a3;
  if (!v4
    || (-[MPCMediaFoundationTranslator mapping](self, "mapping"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "objectForKey:", v6),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    -[MPCMediaFoundationTranslator playbackEngine](self, "playbackEngine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "queueController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "itemForContentItemID:allowReuse:", v6, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[MPCMediaFoundationTranslator mapping](self, "mapping");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v8, v6);

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = v8;
        objc_msgSend(v9, "eventStream");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setEventStream:", v13);

        objc_msgSend(v9, "playerID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setPlayerID:", v14);

      }
    }

  }
  return v8;
}

- (NSMapTable)mapping
{
  return self->_mapping;
}

- (void)updatePlayerPlaybackCoordinator:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)&self->_playbackCoordinator, a3);
  -[MPCMediaFoundationTranslator playbackEngine](self, "playbackEngine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queueController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "engineID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sessionID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "musicSharePlay");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138544130;
    v14 = v9;
    v15 = 2114;
    v16 = v10;
    v17 = 2114;
    v18 = v5;
    v19 = 2114;
    v20 = v11;
    _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "[BMSP:%{public}@:%{public}@] updatePlayerPlaybackCoordinator:… | updating playback coordinator [engine update] playbackCoordinator=%{public}@ musicSharePlayBehavior=%{public}@", (uint8_t *)&v13, 0x2Au);

  }
  objc_msgSend(v7, "musicSharePlay");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updatePlaybackCoordinator:", v5);

}

- (AVPlayerPlaybackCoordinator)playbackCoordinator
{
  return self->_playbackCoordinator;
}

- (MPCMediaFoundationTranslator)initWithPlaybackEngine:(id)a3
{
  id v4;
  MPCMediaFoundationTranslator *v5;
  uint64_t v6;
  NSMapTable *mapping;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPCMediaFoundationTranslator;
  v5 = -[MPCMediaFoundationTranslator init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v6 = objc_claimAutoreleasedReturnValue();
    mapping = v5->_mapping;
    v5->_mapping = (NSMapTable *)v6;

    objc_storeWeak((id *)&v5->_playbackEngine, v4);
  }

  return v5;
}

- (id)MPAVItemForMFPlayerItem:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "contentItemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCMediaFoundationTranslator _MPAVItemForContentItemID:allowReuse:](self, "_MPAVItemForContentItemID:allowReuse:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setMPAVItem:(id)a3 forMFPlayerItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[MPCMediaFoundationTranslator mapping](self, "mapping");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentItemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v7, "setObject:forKey:", v9, v8);
  else
    objc_msgSend(v7, "removeObjectForKey:", v8);

}

- (NSString)targetContentItemID
{
  void *v2;
  void *v3;
  void *v4;

  -[MPCMediaFoundationTranslator playbackEngine](self, "playbackEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queueController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "targetContentItemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)invalidateCacheWithContentItemID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCMediaFoundationTranslator mapping](self, "mapping");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

- (id)queueItemForPlayerItem:(id)a3 allowReuse:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;

  v4 = a4;
  objc_msgSend(a3, "contentItemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCMediaFoundationTranslator _MPAVItemForContentItemID:allowReuse:](self, "_MPAVItemForContentItemID:allowReuse:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)itemToFollowItem:(id)a3 direction:(int64_t)a4 distance:(int64_t)a5 reason:(int64_t)a6
{
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _BOOL4 v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  char *v62;
  void *v64;
  void *v65;
  void *v66;
  SEL v67;
  void *v68;
  uint64_t v69;
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  const char *v77;
  __int16 v78;
  int64_t v79;
  __int16 v80;
  int v81;
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  if (a6 == 1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCMediaFoundationTranslator.m"), 96, CFSTR("No longer support skipping via MF."));

  }
  v67 = a2;
  v68 = v11;
  -[MPCMediaFoundationTranslator playbackEngine](self, "playbackEngine");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "queueController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v12, "engineID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sessionID");
    v16 = v13;
    v17 = v12;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contentItemID");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    *(_DWORD *)buf = 138544642;
    v21 = "backward";
    v71 = v15;
    if (a4 == 1)
      v21 = "forward";
    v72 = 2114;
    v73 = v18;
    v74 = 2114;
    v75 = v19;
    v76 = 2080;
    v77 = v21;
    v78 = 2048;
    v79 = a5;
    v80 = 1024;
    v81 = a6;
    _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] itemToFollowItem:%{public}@ direction:%s distance:%ld reason:%d | enumerating content items [MF sync]", buf, 0x3Au);

    v12 = v17;
    v13 = v16;

  }
  v69 = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v13, "contentItemIDsFromOffset:toOffset:mode:nowPlayingIndex:", -5, 5, 3, &v69);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v69 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v24 = v68;
    objc_msgSend(v68, "contentItemID");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v29 = objc_msgSend(v22, "indexOfObject:", v23);
      if (v29 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v30 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v12, "engineID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "sessionID");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "contentItemID");
          v33 = v12;
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v71 = v31;
          v72 = 2114;
          v73 = v32;
          v74 = 2114;
          v75 = (uint64_t)v34;
          v35 = "[PSYNC:%{public}@:%{public}@] itemToFollowItem:%{public}@ … | returning nil [unable to find last item, NSNotFound]";
LABEL_33:
          _os_log_impl(&dword_210BD8000, v30, OS_LOG_TYPE_DEFAULT, v35, buf, 0x20u);

          v12 = v33;
        }
LABEL_34:
        v28 = 0;
LABEL_54:

        goto LABEL_55;
      }
      v37 = v29 == 10 && a4 == 1;
      if (v37 || !(v29 | a4))
      {
        v40 = objc_msgSend(v22, "count");
        v30 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        v41 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
        if (v40 != 11)
        {
          if (v41)
          {
            objc_msgSend(v12, "engineID");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "sessionID");
            v44 = v12;
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "contentItemID");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v71 = v43;
            v72 = 2114;
            v73 = v45;
            v74 = 2114;
            v75 = (uint64_t)v46;
            _os_log_impl(&dword_210BD8000, v30, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] itemToFollowItem:%{public}@ … | returning nil [unable to find last item]", buf, 0x20u);

            v12 = v44;
          }

          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v30 = objc_claimAutoreleasedReturnValue();
          -[NSObject handleFailureInMethod:object:file:lineNumber:description:](v30, "handleFailureInMethod:object:file:lineNumber:description:", v67, self, CFSTR("MPCMediaFoundationTranslator.m"), 124, CFSTR("[unexpected] {-5, 5} was too small to find the last item in the player."));
          goto LABEL_34;
        }
        if (!v41)
          goto LABEL_34;
LABEL_32:
        objc_msgSend(v12, "engineID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "sessionID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "contentItemID");
        v33 = v12;
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v71 = v31;
        v72 = 2114;
        v73 = v32;
        v74 = 2114;
        v75 = (uint64_t)v34;
        v35 = "[PSYNC:%{public}@:%{public}@] itemToFollowItem:%{public}@ … | returning nil [no more items]";
        goto LABEL_33;
      }
      if (a4 == 1)
        v38 = 1;
      else
        v38 = -1;
      v36 = v29 + v38;
      v69 = v29 + v38;
    }
    else
    {
      v36 = v69;
    }
    if (v36 == objc_msgSend(v22, "count"))
    {
      v30 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        goto LABEL_34;
      goto LABEL_32;
    }
    objc_msgSend(v22, "objectAtIndexedSubscript:", v69);
    v30 = objc_claimAutoreleasedReturnValue();
    v65 = v12;
    if (a6 == 3)
    {
      v39 = 0;
    }
    else
    {
      objc_msgSend(v68, "contentItemID");
      v42 = objc_claimAutoreleasedReturnValue();
      if (v30 == v42)
        v39 = 0;
      else
        v39 = -[NSObject isEqual:](v30, "isEqual:", v42) ^ 1;

    }
    objc_msgSend(v13, "itemForContentItemID:allowReuse:", v30, v39, v65);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "itemError");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {

    }
    else if (!objc_msgSend(v28, "isAssetLoaded")
           || (objc_msgSend(v28, "avPlayerItem"),
               v53 = (void *)objc_claimAutoreleasedReturnValue(),
               objc_msgSend(v53, "error"),
               v54 = (void *)objc_claimAutoreleasedReturnValue(),
               v54,
               v53,
               !v54))
    {
LABEL_49:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v55 = v28;
        objc_msgSend(v66, "eventStream");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setEventStream:", v56);

        objc_msgSend(v66, "playerID");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setPlayerID:", v57);

      }
      v58 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v66, "engineID");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "sessionID");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "contentItemID");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "contentItemID");
        v62 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v71 = v59;
        v72 = 2114;
        v73 = v60;
        v74 = 2114;
        v75 = (uint64_t)v61;
        v76 = 2114;
        v77 = v62;
        _os_log_impl(&dword_210BD8000, v58, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] itemToFollowItem:%{public}@ … | returning %{public}@", buf, 0x2Au);

        v24 = v68;
      }

      v12 = v66;
      goto LABEL_54;
    }
    v48 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v66, "engineID");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "sessionID");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "contentItemID");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v71 = v49;
      v72 = 2114;
      v73 = v50;
      v74 = 2114;
      v75 = (uint64_t)v51;
      _os_log_impl(&dword_210BD8000, v48, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] itemToFollowItem:%{public}@ … | disallowing reuse [reused next item was marked failed]", buf, 0x20u);

      v24 = v68;
    }

    objc_msgSend(v13, "itemForContentItemID:allowReuse:", v30, 0);
    v52 = objc_claimAutoreleasedReturnValue();

    v28 = (void *)v52;
    goto LABEL_49;
  }
  v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v24 = v68;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v12, "engineID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sessionID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "contentItemID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v71 = v25;
    v72 = 2114;
    v73 = v26;
    v74 = 2114;
    v75 = (uint64_t)v27;
    _os_log_impl(&dword_210BD8000, v23, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] itemToFollowItem:%{public}@ … | returning nil [unable to find now playing item]", buf, 0x20u);

  }
  v28 = 0;
LABEL_55:

  return v28;
}

- (void)setPlaybackEngine:(id)a3
{
  objc_storeWeak((id *)&self->_playbackEngine, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapping, 0);
  objc_storeStrong((id *)&self->_playbackCoordinator, 0);
  objc_destroyWeak((id *)&self->_playbackEngine);
}

@end
