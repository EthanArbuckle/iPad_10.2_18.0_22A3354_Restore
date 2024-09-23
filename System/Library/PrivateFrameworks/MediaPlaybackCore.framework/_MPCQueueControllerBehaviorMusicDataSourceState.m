@implementation _MPCQueueControllerBehaviorMusicDataSourceState

- (BOOL)shouldUsePlaceholderForItem:(id)a3 inSection:(id)a4
{
  if ((*(_WORD *)&self->_supportedMethods & 0x200) != 0)
    return -[MPCQueueControllerBehaviorMusicDataSource shouldUsePlaceholderForItem:inSection:](self->_dataSource, "shouldUsePlaceholderForItem:inSection:", a3, a4);
  else
    return 0;
}

- (id)itemForItem:(id)a3 inSection:(id)a4
{
  return (id)-[MPCQueueControllerBehaviorMusicDataSource itemForItem:inSection:](self->_dataSource, "itemForItem:inSection:", a3, a4);
}

- (BOOL)isRadioDataSource
{
  if ((*(_WORD *)&self->_supportedMethods & 0x1000) != 0)
    return -[MPCQueueControllerBehaviorMusicDataSource containsRadioContent](self->_dataSource, "containsRadioContent");
  else
    return 0;
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)canSkipItem:(id)a3 reason:(id *)a4
{
  if ((*(_WORD *)&self->_supportedMethods & 0x10) != 0)
    return -[MPCQueueControllerBehaviorMusicDataSource canSkipItem:reason:](self->_dataSource, "canSkipItem:reason:", a3, a4);
  else
    return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)itemDidBeginPlayback:(id)a3
{
  if ((*(_WORD *)&self->_supportedMethods & 0x40) != 0)
    -[MPCQueueControllerBehaviorMusicDataSource itemDidBeginPlayback:](self->_dataSource, "itemDidBeginPlayback:", a3);
}

- (void)reloadSection:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t state;
  NSObject *v9;
  NSString *sectionIdentifier;
  __CFString *v11;
  id WeakRetained;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSString *v18;
  MPCQueueControllerBehaviorMusicDataSource *dataSource;
  id v20;
  id v21;
  id v22;
  void (**v23)(_QWORD);
  void *v24;
  void *v25;
  double v26;
  dispatch_time_t v27;
  _QWORD aBlock[5];
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  NSString *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  const __CFString *v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_stateLock);
  state = self->_state;
  self->_state = 1;
  -[_MPCQueueControllerBehaviorMusicDataSourceState _inLock_buildPlaceholder](self, "_inLock_buildPlaceholder");
  os_unfair_lock_unlock(&self->_stateLock);
  v9 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    sectionIdentifier = self->_sectionIdentifier;
    if (state >= 5)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown[%ld]"), state);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_24CAB54C8[state];
    }
    *(_DWORD *)buf = 138543618;
    v33 = sectionIdentifier;
    v34 = 2114;
    v35 = v11;
    _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_DEFAULT, "[DASOS:%{public}@] reloadSection:… | changing state [starting reloadSection] oldState=%{public}@ newState=Loading", buf, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_eventStream);
  v13 = self->_sectionIdentifier;
  v38 = CFSTR("queue-section-id");
  v39[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "emitEventType:payload:", CFSTR("queue-load-begin"), v14);

  -[_MPCQueueControllerBehaviorMusicDataSourceState playbackContext](self, "playbackContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");

  v17 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController_Oversize");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = self->_sectionIdentifier;
    dataSource = self->_dataSource;
    *(_DWORD *)buf = 138543874;
    v33 = v18;
    v34 = 2048;
    v35 = dataSource;
    v36 = 2114;
    v37 = v16;
    _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_DEFAULT, "[DASOS:%{public}@] reloadSection:… | loading playback context [dataSource %p] playbackContext=%{public}@ ", buf, 0x20u);
  }

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __76___MPCQueueControllerBehaviorMusicDataSourceState_reloadSection_completion___block_invoke;
  aBlock[3] = &unk_24CAB7B40;
  aBlock[4] = self;
  v20 = v16;
  v29 = v20;
  v21 = v7;
  v31 = v21;
  v22 = v6;
  v30 = v22;
  v23 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "delayQueueLoadDuration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v25, "doubleValue");
    v27 = dispatch_time(0, (uint64_t)(v26 * 1000000000.0));
    dispatch_after(v27, MEMORY[0x24BDAC9B8], v23);
  }
  else
  {
    v23[2](v23);
  }
  if ((*(_WORD *)&self->_supportedMethods & 1) != 0)
  {
    os_unfair_lock_lock(&self->_stateLock);
    -[_MPCQueueControllerBehaviorMusicDataSourceState _inLock_buildPlaceholder](self, "_inLock_buildPlaceholder");
    os_unfair_lock_unlock(&self->_stateLock);
  }

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[_MPCQueueControllerBehaviorMusicDataSourceState playbackContext](self, "playbackContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCQueueControllerBehaviorMusicDataSourceState originalPlaybackContext](self, "originalPlaybackContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCQueueControllerBehaviorMusicDataSourceState supplementalPlaybackContext](self, "supplementalPlaybackContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<_MPCQueueControllerDataSourceState %p> playbackContext: %@ - originalContext: %@ - supplementalContext: %@"), self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (MPPlaybackContext)playbackContext
{
  return self->_playbackContext;
}

- (MPCQueueControllerBehaviorMusicDataSource)dataSource
{
  return self->_dataSource;
}

- (MPPlaybackContext)supplementalPlaybackContext
{
  return self->_supplementalPlaybackContext;
}

- (BOOL)shouldAddOriginalPlaybackContextAfterReplacement
{
  return self->_supplementalPlaybackContextBehavior == 2 && !self->_frozen;
}

- (void)setPlayerID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setEventStream:(id)a3
{
  objc_storeWeak((id *)&self->_eventStream, a3);
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (MPPlaybackContext)originalPlaybackContext
{
  return self->_originalPlaybackContext;
}

- (void)_inLock_buildPlaceholder
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  MPPlaceholderAVItem *tailPlaceholderItem;
  id v8;

  os_unfair_lock_assert_owner(&self->_stateLock);
  if ((*(_WORD *)&self->_supportedMethods & 1) == 0
    || (-[MPCQueueControllerBehaviorMusicDataSource placeholderItemForLoadingAdditionalItemsInSection:](self->_dataSource, "placeholderItemForLoadingAdditionalItemsInSection:", self->_sectionIdentifier), (v3 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v3 = objc_alloc_init(MEMORY[0x24BDDCB00]);
  }
  +[MPCQueueControllerBehaviorMusicIdentifierComponents placeholderComponentsWithLoadingSectionID:](MPCQueueControllerBehaviorMusicIdentifierComponents, "placeholderComponentsWithLoadingSectionID:", self->_sectionIdentifier);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentItemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentItemID:queueSectionID:queueItemID:", v4, v5, v6);

  tailPlaceholderItem = self->_tailPlaceholderItem;
  self->_tailPlaceholderItem = (MPPlaceholderAVItem *)v3;

}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (BOOL)containsLiveStream
{
  return -[MPCQueueControllerBehaviorMusicDataSource containsLiveStream](self->_dataSource, "containsLiveStream");
}

- (BOOL)shouldRequestAdditionalItemsAtTail
{
  if (!self->_frozen && (*(_WORD *)&self->_supportedMethods & 0x80) != 0)
    return -[MPCQueueControllerBehaviorMusicDataSource shouldRequestAdditionalItemsWhenReachingTailOfSection:](self->_dataSource, "shouldRequestAdditionalItemsWhenReachingTailOfSection:", self->_sectionIdentifier);
  else
    return 0;
}

- (BOOL)section:(id)a3 supportsShuffleType:(int64_t)a4
{
  if (self->_frozen)
    return a4 == 1;
  else
    return -[MPCQueueControllerBehaviorMusicDataSource section:supportsShuffleType:](self->_dataSource, "section:supportsShuffleType:", a3, a4);
}

- (_MPCQueueControllerBehaviorMusicDataSourceState)initWithCoder:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  _MPCQueueControllerBehaviorMusicDataSourceState *v14;
  _MPCQueueControllerBehaviorMusicDataSourceState *v15;
  NSObject *v16;
  NSString *sectionIdentifier;
  void *v18;
  void *v20;
  uint8_t buf[4];
  NSString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("spcb"));
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("spc"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pc"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 2)
    LOBYTE(v10) = 1;
  else
    v10 = objc_msgSend(v8, "isSupported") ^ 1;
  if ((v10 & (v7 != 0)) != 0)
    v11 = v7;
  else
    v11 = v9;
  v12 = v11;
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("si"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_MPCQueueControllerBehaviorMusicDataSourceState.m"), 128, CFSTR("No active context for datasoure state for section: %@"), v13);

  }
  v14 = -[_MPCQueueControllerBehaviorMusicDataSourceState initWithPlaybackContext:](self, "initWithPlaybackContext:", v12);
  v15 = v14;
  if (v14)
  {
    v14->_state = 1;
    objc_storeStrong((id *)&v14->_sectionIdentifier, v13);
    v16 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      sectionIdentifier = v15->_sectionIdentifier;
      *(_DWORD *)buf = 138543362;
      v22 = sectionIdentifier;
      _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_DEFAULT, "[DASOS:%{public}@] initWithCoder: | changing state [init] oldState=Unknown newState=Loading", buf, 0xCu);
    }

    objc_storeStrong((id *)&v15->_originalPlaybackContext, v9);
    objc_storeStrong((id *)&v15->_supplementalPlaybackContext, v7);
    v15->_supplementalPlaybackContextBehavior = v6;
    v15->_frozen = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("f"));
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reg"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCQueueControllerBehaviorMusicDataSource replaceIdentifierRegistry:](v15->_dataSource, "replaceIdentifierRegistry:", v18);

  }
  return v15;
}

- (_MPCQueueControllerBehaviorMusicDataSourceState)initWithPlaybackContext:(id)a3
{
  id v6;
  _MPCQueueControllerBehaviorMusicDataSourceState *v7;
  _MPCQueueControllerBehaviorMusicDataSourceState *v8;
  objc_class *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSString *sectionIdentifier;
  __int16 v15;
  __int16 v16;
  __int16 v17;
  __int16 v18;
  __int16 v19;
  __int16 v20;
  __int16 v21;
  __int16 v22;
  __int16 v23;
  __int16 v24;
  __int16 v25;
  __int16 v26;
  void *v28;
  objc_super v29;

  v6 = a3;
  v29.receiver = self;
  v29.super_class = (Class)_MPCQueueControllerBehaviorMusicDataSourceState;
  v7 = -[_MPCQueueControllerBehaviorMusicDataSourceState init](&v29, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_playbackContext, a3);
    objc_storeStrong((id *)&v8->_originalPlaybackContext, a3);
    v9 = (objc_class *)objc_msgSend(v6, "queueFeederClass");
    v10 = objc_alloc_init(v9);
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("_MPCQueueControllerBehaviorMusicDataSourceState.m"), 77, CFSTR("Failed to instantiate queueFeederClass: %@"), v9);

    }
    objc_storeStrong((id *)&v8->_dataSource, v10);
    objc_msgSend(v6, "overrideSILSectionID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    if (v12)
      objc_msgSend(v6, "overrideSILSectionID");
    else
      MSVNanoIDCreateTaggedPointer();
    v13 = objc_claimAutoreleasedReturnValue();
    sectionIdentifier = v8->_sectionIdentifier;
    v8->_sectionIdentifier = (NSString *)v13;

    v8->_stateLock._os_unfair_lock_opaque = 0;
    *(_WORD *)&v8->_supportedMethods = *(_WORD *)&v8->_supportedMethods & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = 2;
    else
      v15 = 0;
    *(_WORD *)&v8->_supportedMethods = *(_WORD *)&v8->_supportedMethods & 0xFFFD | v15;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = 4;
    else
      v16 = 0;
    *(_WORD *)&v8->_supportedMethods = *(_WORD *)&v8->_supportedMethods & 0xFFFB | v16;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = 8;
    else
      v17 = 0;
    *(_WORD *)&v8->_supportedMethods = *(_WORD *)&v8->_supportedMethods & 0xFFF7 | v17;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v18 = 16;
    else
      v18 = 0;
    *(_WORD *)&v8->_supportedMethods = *(_WORD *)&v8->_supportedMethods & 0xFFEF | v18;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = 32;
    else
      v19 = 0;
    *(_WORD *)&v8->_supportedMethods = *(_WORD *)&v8->_supportedMethods & 0xFFDF | v19;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v20 = 64;
    else
      v20 = 0;
    *(_WORD *)&v8->_supportedMethods = *(_WORD *)&v8->_supportedMethods & 0xFFBF | v20;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v21 = 128;
    else
      v21 = 0;
    *(_WORD *)&v8->_supportedMethods = *(_WORD *)&v8->_supportedMethods & 0xFF7F | v21;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v22 = 256;
    else
      v22 = 0;
    *(_WORD *)&v8->_supportedMethods = *(_WORD *)&v8->_supportedMethods & 0xFEFF | v22;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v23 = 512;
    else
      v23 = 0;
    *(_WORD *)&v8->_supportedMethods = *(_WORD *)&v8->_supportedMethods & 0xFDFF | v23;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v24 = 1024;
    else
      v24 = 0;
    *(_WORD *)&v8->_supportedMethods = *(_WORD *)&v8->_supportedMethods & 0xFBFF | v24;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v25 = 2048;
    else
      v25 = 0;
    *(_WORD *)&v8->_supportedMethods = *(_WORD *)&v8->_supportedMethods & 0xF7FF | v25;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v26 = 4096;
    else
      v26 = 0;
    *(_WORD *)&v8->_supportedMethods = *(_WORD *)&v8->_supportedMethods & 0xEFFF | v26;

  }
  return v8;
}

- (id)_rtcSourceServiceName
{
  void *v3;
  void *v4;
  void *v5;

  if (-[MPCQueueControllerBehaviorMusicDataSource conformsToProtocol:](self->_dataSource, "conformsToProtocol:", &unk_254A9D100))
  {
    -[MPCQueueControllerBehaviorMusicDataSource rtcReportingPlayQueueSourceIdentifier](self->_dataSource, "rtcReportingPlayQueueSourceIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPCRTCEventConsumer playerServiceNameWithPlayerID:](MPCRTCEventConsumer, "playerServiceNameWithPlayerID:", self->_playerID);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), v4, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)updatePlaybackContext
{
  MPPlaybackContext *v4;
  uint64_t v5;
  MPPlaybackContext *originalPlaybackContext;
  void *v7;
  uint64_t v8;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if ((*(_WORD *)&self->_supportedMethods & 0x800) != 0)
  {
    -[MPCQueueControllerBehaviorMusicDataSource updatedPlaybackContext](self->_dataSource, "updatedPlaybackContext");
    v4 = (MPPlaybackContext *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_class();
    if (v5 != objc_opt_class())
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_opt_class();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_MPCQueueControllerBehaviorMusicDataSourceState.m"), 361, CFSTR("UpdatedPlaybackContext changed types %@ != %@"), v8, objc_opt_class());

    }
    objc_storeStrong((id *)&self->_playbackContext, v4);
    originalPlaybackContext = self->_originalPlaybackContext;
    self->_originalPlaybackContext = v4;

  }
}

- (NSString)preferredStartContentItemID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[_MPCQueueControllerBehaviorMusicDataSourceState preferredStartItemIdentifier](self, "preferredStartItemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_MPCQueueControllerBehaviorMusicDataSourceState sectionIdentifier](self, "sectionIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPCQueueControllerBehaviorMusicIdentifierComponents itemComponentsWithSectionID:itemID:](MPCQueueControllerBehaviorMusicIdentifierComponents, "itemComponentsWithSectionID:itemID:", v4, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "contentItemID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSString *)v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _BOOL4 frozen;
  _BOOL8 v6;
  MPPlaybackContext *p_super;
  int64_t supplementalPlaybackContextBehavior;
  _MPCNullPlaybackContext *v9;
  void *v10;
  __int16 supportedMethods;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;

  v4 = a3;
  frozen = self->_frozen;
  v19 = v4;
  if ((self->_supplementalPlaybackContextBehavior & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    objc_msgSend(v4, "encodeObject:forKey:", self->_playbackContext, CFSTR("pc"));
    v6 = frozen;
    goto LABEL_20;
  }
  if ((*(_WORD *)&self->_supportedMethods & 4) != 0)
  {
    supplementalPlaybackContextBehavior = -[MPCQueueControllerBehaviorMusicDataSource supplementalPlaybackContextBehavior](self->_dataSource, "supplementalPlaybackContextBehavior");
    p_super = self->_originalPlaybackContext;
    if (supplementalPlaybackContextBehavior == 3)
    {
      v6 = 1;
      goto LABEL_10;
    }
  }
  else
  {
    p_super = self->_originalPlaybackContext;
    supplementalPlaybackContextBehavior = 0;
  }
  if ((-[MPPlaybackContext containsRestorableContent](p_super, "containsRestorableContent") & 1) == 0)
  {
    v9 = objc_alloc_init(_MPCNullPlaybackContext);
    -[MPPlaybackContext description](p_super, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPCNullPlaybackContext setLabel:](v9, "setLabel:", v10);

    p_super = &v9->super;
  }
  objc_msgSend(v19, "encodeObject:forKey:", p_super, CFSTR("pc"));
  v6 = frozen;
LABEL_10:
  if (self->_supplementalPlaybackContext == self->_playbackContext)
  {
    objc_msgSend(v19, "encodeObject:forKey:");
    supplementalPlaybackContextBehavior = self->_supplementalPlaybackContextBehavior;
  }
  else
  {
    supportedMethods = (__int16)self->_supportedMethods;
    if ((supportedMethods & 2) != 0)
    {
      objc_msgSend(v19, "msv_userInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDDC530]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "integerValue");

      -[MPCQueueControllerBehaviorMusicDataSource supplementalPlaybackContextWithReason:](self->_dataSource, "supplementalPlaybackContextWithReason:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = v15;
        -[MPPlaybackContext description](p_super, "description");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setLabel:", v17);

      }
      objc_msgSend(v19, "encodeObject:forKey:", v15, CFSTR("spc"));

      supportedMethods = (__int16)self->_supportedMethods;
    }
    if ((supportedMethods & 4) == 0)
      goto LABEL_19;
  }
  objc_msgSend(v19, "encodeInteger:forKey:", supplementalPlaybackContextBehavior, CFSTR("spcb"));
LABEL_19:

LABEL_20:
  objc_msgSend(v19, "encodeObject:forKey:", self->_sectionIdentifier, CFSTR("si"));
  objc_msgSend(v19, "encodeBool:forKey:", v6, CFSTR("f"));
  if (objc_msgSend((id)objc_opt_class(), "usesIdentifierRegistry"))
  {
    -[MPCQueueControllerBehaviorMusicDataSource identifierRegistryWithExclusiveAccessReturningObject:](self->_dataSource, "identifierRegistryWithExclusiveAccessReturningObject:", &__block_literal_global_13281);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "encodeObject:forKey:", v18, CFSTR("reg"));

  }
}

- (id)getTailPlaceholderItemAndState:(int64_t *)a3
{
  os_unfair_lock_s *p_stateLock;
  MPPlaceholderAVItem *v6;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v6 = self->_tailPlaceholderItem;
  if (a3)
    *a3 = self->_state;
  os_unfair_lock_unlock(p_stateLock);
  return v6;
}

- (BOOL)canJumpToItem:(id)a3 reason:(id *)a4
{
  if ((*(_WORD *)&self->_supportedMethods & 8) != 0)
    return -[MPCQueueControllerBehaviorMusicDataSource canJumpToItem:reason:](self->_dataSource, "canJumpToItem:reason:", a3, a4);
  else
    return 1;
}

- (id)firstItemIntersectingIdentifierSet:(id)a3
{
  if ((*(_WORD *)&self->_supportedMethods & 0x20) == 0)
    return 0;
  -[MPCQueueControllerBehaviorMusicDataSource firstItemIntersectingIdentifierSet:](self->_dataSource, "firstItemIntersectingIdentifierSet:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)prefetchThreshold
{
  if ((*(_WORD *)&self->_supportedMethods & 0x100) != 0)
    return -[MPCQueueControllerBehaviorMusicDataSource prefetchThresholdForSection:](self->_dataSource, "prefetchThresholdForSection:", self->_sectionIdentifier);
  else
    return 0;
}

- (void)loadAdditionalItemsIfNeededWithCount:(int64_t)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  int64_t state;
  NSObject *v9;
  NSString *sectionIdentifier;
  _BOOL4 frozen;
  NSObject *v12;
  NSString *v13;
  const char *v14;
  id WeakRetained;
  NSString *v16;
  void *v17;
  unint64_t v18;
  NSObject *v19;
  NSString *v20;
  __CFString *v21;
  NSString *v22;
  MPCQueueControllerBehaviorMusicDataSource *dataSource;
  NSString *v24;
  _QWORD v25[5];
  void (**v26)(id, _QWORD);
  int64_t v27;
  uint8_t buf[4];
  NSString *v29;
  __int16 v30;
  _BYTE v31[18];
  const __CFString *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, _QWORD))a4;
  os_unfair_lock_lock(&self->_stateLock);
  state = self->_state;
  os_unfair_lock_unlock(&self->_stateLock);
  if (self->_frozen || (unint64_t)(state - 1) <= 1)
  {
    v9 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      sectionIdentifier = self->_sectionIdentifier;
      frozen = self->_frozen;
      *(_DWORD *)buf = 138543874;
      v29 = sectionIdentifier;
      v30 = 1024;
      *(_DWORD *)v31 = frozen;
      *(_WORD *)&v31[4] = 2050;
      *(_QWORD *)&v31[6] = state;
      _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_DEFAULT, "[DASOS:%{public}@] loadAdditionalItemsIfNeededWithCompletion: additional loading skipped [data source loading or frozen] - _frozen=%{BOOL}u _state=%{public}ld", buf, 0x1Cu);
    }

    goto LABEL_19;
  }
  if ((*(_WORD *)&self->_supportedMethods & 0x80) == 0)
  {
    v12 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = self->_sectionIdentifier;
      *(_DWORD *)buf = 138543618;
      v29 = v13;
      v30 = 2048;
      *(_QWORD *)v31 = a3;
      v14 = "[DASOS:%{public}@] loadAdditionalItemsIfNeededWithCount:%ld… | additional loading skipped [data source doesn"
            "'t support loading more]";
LABEL_17:
      _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, v14, buf, 0x16u);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  if (!-[MPCQueueControllerBehaviorMusicDataSource shouldRequestAdditionalItemsWhenReachingTailOfSection:](self->_dataSource, "shouldRequestAdditionalItemsWhenReachingTailOfSection:", self->_sectionIdentifier))
  {
    v12 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v22 = self->_sectionIdentifier;
      *(_DWORD *)buf = 138543618;
      v29 = v22;
      v30 = 2048;
      *(_QWORD *)v31 = a3;
      v14 = "[DASOS:%{public}@] loadAdditionalItemsIfNeededWithCount:%ld… | additional loading skipped [data source doesn"
            "'t want to load more]";
      goto LABEL_17;
    }
LABEL_18:

LABEL_19:
    v6[2](v6, 0);
    goto LABEL_20;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_eventStream);
  v16 = self->_sectionIdentifier;
  v32 = CFSTR("queue-section-id");
  v33[0] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "emitEventType:payload:", CFSTR("queue-load-begin"), v17);

  os_unfair_lock_lock(&self->_stateLock);
  v18 = self->_state;
  self->_state = 2;
  -[_MPCQueueControllerBehaviorMusicDataSourceState _inLock_buildPlaceholder](self, "_inLock_buildPlaceholder");
  os_unfair_lock_unlock(&self->_stateLock);
  v19 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = self->_sectionIdentifier;
    if (v18 >= 5)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown[%ld]"), v18);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = off_24CAB54C8[v18];
    }
    *(_DWORD *)buf = 138543874;
    v29 = v20;
    v30 = 2048;
    *(_QWORD *)v31 = a3;
    *(_WORD *)&v31[8] = 2114;
    *(_QWORD *)&v31[10] = v21;
    _os_log_impl(&dword_210BD8000, v19, OS_LOG_TYPE_DEFAULT, "[DASOS:%{public}@] loadAdditionalItemsIfNeededWithCount:%ld… | changing state [start loading additional] oldState=%{public}@ newState=LoadingAdditionalItems", buf, 0x20u);

  }
  dataSource = self->_dataSource;
  v24 = self->_sectionIdentifier;
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __99___MPCQueueControllerBehaviorMusicDataSourceState_loadAdditionalItemsIfNeededWithCount_completion___block_invoke;
  v25[3] = &unk_24CAB5480;
  v25[4] = self;
  v27 = a3;
  v26 = v6;
  -[MPCQueueControllerBehaviorMusicDataSource loadAdditionalItemsWithCount:forSection:completion:](dataSource, "loadAdditionalItemsWithCount:forSection:completion:", a3, v24, v25);

LABEL_20:
}

- (MPPlaceholderAVItem)tailPlaceholderItem
{
  os_unfair_lock_s *p_stateLock;
  MPPlaceholderAVItem *v4;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v4 = self->_tailPlaceholderItem;
  os_unfair_lock_unlock(p_stateLock);
  return v4;
}

- (BOOL)section:(id)a3 shouldShuffleExcludeItem:(id)a4
{
  if ((*(_WORD *)&self->_supportedMethods & 0x400) != 0)
    return -[MPCQueueControllerBehaviorMusicDataSource section:shouldShuffleExcludeItem:](self->_dataSource, "section:shouldShuffleExcludeItem:", a3, a4);
  else
    return 0;
}

- (void)_buildPlaceholder
{
  os_unfair_lock_s *p_stateLock;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  -[_MPCQueueControllerBehaviorMusicDataSourceState _inLock_buildPlaceholder](self, "_inLock_buildPlaceholder");
  os_unfair_lock_unlock(p_stateLock);
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void)setFrozen:(BOOL)a3
{
  self->_frozen = a3;
}

- (NSString)preferredStartItemIdentifier
{
  return self->_preferredStartItemIdentifier;
}

- (NSString)playerID
{
  return self->_playerID;
}

- (MPCPlaybackEngineEventStream)eventStream
{
  return (MPCPlaybackEngineEventStream *)objc_loadWeakRetained((id *)&self->_eventStream);
}

- (os_unfair_lock_s)stateLock
{
  return self->_stateLock;
}

- (int64_t)supplementalPlaybackContextBehavior
{
  return self->_supplementalPlaybackContextBehavior;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementalPlaybackContext, 0);
  objc_destroyWeak((id *)&self->_eventStream);
  objc_storeStrong((id *)&self->_playerID, 0);
  objc_storeStrong((id *)&self->_preferredStartItemIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_originalPlaybackContext, 0);
  objc_storeStrong((id *)&self->_playbackContext, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_tailPlaceholderItem, 0);
}

@end
