@implementation MPCItemBookmarker

- (void)itemDidBecomeCurrent:(id)a3 time:(double)a4
{
  id v7;
  id v8;
  double v9;
  NSObject *v10;
  void *v11;
  uint8_t buf[4];
  MPCItemBookmarker *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCItemBookmarker.m"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item == nil || [(MPAVItem *)item isKindOfClass:[MPAVItem class]]"));

    }
  }
  v8 = v7;
  if (objc_msgSend(v8, "isAssetLoaded"))
  {
    objc_msgSend(v8, "reevaluateType");
    objc_msgSend(v8, "reevaluateHasProtectedContent");
    LODWORD(v9) = 0;
    objc_msgSend(v8, "_updateDurationSnapshotWithElapsedTime:playbackRate:", a4, v9);
    v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v13 = self;
      v14 = 2114;
      v15 = v8;
      v16 = 2048;
      v17 = a4;
      _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_DEFAULT, "MPCItemBookmarker %p - Current loaded item bookmark data updated %{public}@ time:%.2fs", buf, 0x20u);
    }

  }
}

- (void)currentItemWillChangeFromItem:(id)a3 toItem:(id)a4 time:(double)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double Seconds;
  double v17;
  void *v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  CMTime time;
  uint8_t buf[4];
  MPCItemBookmarker *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  double v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCItemBookmarker.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromItem == nil || [(MPAVItem *)fromItem isKindOfClass:[MPAVItem class]]"));

    if (!v9)
      goto LABEL_6;
  }
  else if (!v9)
  {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCItemBookmarker.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toItem == nil || [(MPAVItem *)toItem isKindOfClass:[MPAVItem class]]"));

  }
LABEL_6:
  v10 = v8;
  if (!objc_msgSend(v10, "isAssetLoaded"))
    goto LABEL_24;
  objc_msgSend(v10, "asset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "URL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = v12;
      objc_msgSend(v12, "isFileURL");

    }
  }
  objc_msgSend(v10, "playerItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    objc_msgSend(v14, "currentTime");
  else
    memset(&time, 0, sizeof(time));
  Seconds = CMTimeGetSeconds(&time);

  if (Seconds == 0.0)
  {
    objc_msgSend(v10, "contentItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "elapsedTime");
    if (v19 <= 0.0)
      goto LABEL_18;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_18;
    v20 = objc_msgSend(v10, "loadedAudioAssetType");

    if (v20 >= 2)
    {
      objc_msgSend(v10, "contentItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "elapsedTime");
      Seconds = v21;
LABEL_18:

    }
  }
  LODWORD(v17) = 0;
  objc_msgSend(v10, "_setCurrentPlaybackRate:", v17);
  LODWORD(v22) = 0;
  objc_msgSend(v10, "_updateDurationSnapshotWithElapsedTime:playbackRate:", Seconds, v22);
  v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v32 = self;
    v33 = 2114;
    v34 = v10;
    v35 = 2048;
    v36 = Seconds;
    _os_log_impl(&dword_210BD8000, v23, OS_LOG_TYPE_DEFAULT, "MPCItemBookmarker %p - Previous loaded item bookmark data updated %{public}@ - PlaybackStoppedTime:%.2fs", buf, 0x20u);
  }

  v24 = v9;
  objc_msgSend(v24, "contentItemID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentItemID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v25, "isEqualToString:", v26);

  if (v27)
    objc_msgSend(v24, "_pickupContentItemFrom:", v10);

LABEL_24:
}

- (MPCItemBookmarker)initWithPlaybackEngine:(id)a3 translator:(id)a4
{
  id v6;
  id v7;
  MPCItemBookmarker *v8;
  MPCItemBookmarker *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MPCItemBookmarker;
  v8 = -[MPCItemBookmarker init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_engine, v6);
    objc_storeStrong((id *)&v9->_translator, a4);
  }

  return v9;
}

- (void)itemDidPlayToEnd:(id)a3 time:(double)a4
{
  id v6;
  char isKindOfClass;
  void *v8;
  id v9;

  v6 = a3;
  v9 = v6;
  if (v6)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v6 = v9;
    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCItemBookmarker.m"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item == nil || [(MPAVItem *)item isKindOfClass:[MPAVItem class]]"));

      v6 = v9;
    }
  }
  objc_msgSend(v6, "notePlaybackFinishedByHittingEnd");

}

- (void)itemTransitionWillBeginFrom:(id)a3 to:(id)a4 type:(int64_t)a5 timeStamp:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  char isKindOfClass;
  void *v15;
  id v16;

  v16 = a3;
  v10 = a4;
  v11 = a6;
  v12 = v16;
  v13 = v11;
  if (v16)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v12 = v16;
    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCItemBookmarker.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromItem == nil || [(MPAVItem *)fromItem isKindOfClass:[MPAVItem class]]"));

      v12 = v16;
    }
  }
  objc_msgSend(v12, "notePlaybackFinishedByHittingEnd");

}

- (void)playbackDidStartForItem:(id)a3 time:(double)a4 rate:(float)a5
{
  id v9;
  NSObject *v10;
  double v11;
  void *v12;
  uint8_t buf[4];
  MPCItemBookmarker *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v14 = self;
    v15 = 2114;
    v16 = v9;
    v17 = 2048;
    v18 = a4;
    _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_DEFAULT, "MPCItemBookmarker %p - playbackDidStartForItem - item=%{public}@ - time:%.2fs", buf, 0x20u);
  }

  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCItemBookmarker.m"), 118, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item == nil || [(MPAVItem *)item isKindOfClass:[MPAVItem class]]"));

    }
  }
  *(float *)&v11 = a5;
  -[MPCItemBookmarker updateDurationSnapshotWithTime:forItem:rate:](self, "updateDurationSnapshotWithTime:forItem:rate:", v9, a4, v11);

}

- (void)playbackDidStopForItem:(id)a3 time:(double)a4
{
  id v6;
  NSObject *v7;
  double v8;
  int v9;
  MPCItemBookmarker *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134218498;
    v10 = self;
    v11 = 2114;
    v12 = v6;
    v13 = 2048;
    v14 = a4;
    _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, "MPCItemBookmarker %p - playbackDidStopForItem - item=%{public}@ - time:%.2fs", (uint8_t *)&v9, 0x20u);
  }

  LODWORD(v8) = 0;
  -[MPCItemBookmarker updateDurationSnapshotWithTime:forItem:rate:](self, "updateDurationSnapshotWithTime:forItem:rate:", v6, a4, v8);

}

- (void)playbackRateDidChangeToRate:(float)a3 forItem:(id)a4 time:(double)a5
{
  id v8;
  double v9;
  NSObject *v11;
  int v12;
  MPCItemBookmarker *v13;
  __int16 v14;
  double v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  if (a3 == 0.0 || a3 == 1.0)
  {
    v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 134218498;
      v13 = self;
      v14 = 2048;
      v15 = a3;
      v16 = 2114;
      v17 = v8;
      _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_ERROR, "MPCItemBookmarker %p - Unexpected rate change to %.1f received [Should be handled by playbackDidStart/Stop] - item=%{public}@", (uint8_t *)&v12, 0x20u);
    }

  }
  else
  {
    *(float *)&v9 = a3;
    -[MPCItemBookmarker updateDurationSnapshotWithTime:forItem:rate:](self, "updateDurationSnapshotWithTime:forItem:rate:", v8, a5, v9);
  }

}

- (void)playbackStateDidChangeFromState:(int64_t)a3 toState:(int64_t)a4 forItem:(id)a5 time:(double)a6 rate:(float)a7
{
  double v12;
  void *v13;
  id v14;

  v14 = a5;
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCItemBookmarker.m"), 136, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item == nil || [(MPAVItem *)item isKindOfClass:[MPAVItem class]]"));

    }
  }
  if (a3 != 1 && a4 == 1)
  {
    *(float *)&v12 = a7;
    objc_msgSend(v14, "_setCurrentPlaybackRate:", v12);
  }

}

- (void)updateDurationSnapshotWithTime:(double)a3 forItem:(id)a4 rate:(float)a5
{
  id v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v9 = a4;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCItemBookmarker.m"), 145, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item == nil || [(MPAVItem *)item isKindOfClass:[MPAVItem class]]"));

    }
  }
  v15 = v9;
  *(float *)&v10 = a5;
  objc_msgSend(v15, "_setCurrentPlaybackRate:", v10);
  *(float *)&v11 = a5;
  objc_msgSend(v15, "_updateDurationSnapshotWithElapsedTime:playbackRate:", a3, v11);

  -[MPCItemBookmarker engine](self, "engine");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "mediaRemotePublisher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "publishIfNeeded");

}

- (MPCMediaFoundationTranslator)translator
{
  return self->_translator;
}

- (void)setTranslator:(id)a3
{
  objc_storeStrong((id *)&self->_translator, a3);
}

- (MPCPlaybackEngine)engine
{
  return (MPCPlaybackEngine *)objc_loadWeakRetained((id *)&self->_engine);
}

- (void)setEngine:(id)a3
{
  objc_storeWeak((id *)&self->_engine, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_engine);
  objc_storeStrong((id *)&self->_translator, 0);
}

@end
