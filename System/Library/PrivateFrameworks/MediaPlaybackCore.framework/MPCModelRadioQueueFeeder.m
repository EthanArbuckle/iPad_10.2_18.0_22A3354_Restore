@implementation MPCModelRadioQueueFeeder

- (MPCModelRadioQueueFeeder)init
{
  MPCModelRadioQueueFeeder *v2;
  MPCPlaybackRequestEnvironment *v3;
  MPCPlaybackRequestEnvironment *playbackRequestEnvironment;
  uint64_t v5;
  ICStoreRequestContext *storeRequestContext;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MPCModelRadioQueueFeeder;
  v2 = -[MPCModelRadioQueueFeeder init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MPCPlaybackRequestEnvironment);
    playbackRequestEnvironment = v2->_playbackRequestEnvironment;
    v2->_playbackRequestEnvironment = v3;

    -[MPCPlaybackRequestEnvironment _createStoreRequestContext](v2->_playbackRequestEnvironment, "_createStoreRequestContext");
    v5 = objc_claimAutoreleasedReturnValue();
    storeRequestContext = v2->_storeRequestContext;
    v2->_storeRequestContext = (ICStoreRequestContext *)v5;

    objc_msgSend(MEMORY[0x24BEC87B8], "currentDeviceInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasCellularDataCapability");

    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__allowCellularStreamingDidChangeNotification_, *MEMORY[0x24BDDC540], 0);

      objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "registerObserver:", v2);

      -[MPCModelRadioQueueFeeder _updateAdditionalLoadingSupport](v2, "_updateAdditionalLoadingSupport");
    }
    else
    {
      v2->_supportsLoadingAdditionalItems = 1;
    }
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BDDC540], 0);
  if (self->_lastResponse)
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BDDC3F8]);
  if (self->_observedIdentityStore)
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BEC8728]);
  if (self->_backgroundTaskIdentifier != *MEMORY[0x24BE65AB8])
  {
    MPSharedBackgroundTaskProvider();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endTask:", self->_backgroundTaskIdentifier);

  }
  v6.receiver = self;
  v6.super_class = (Class)MPCModelRadioQueueFeeder;
  -[MPCModelRadioQueueFeeder dealloc](&v6, sel_dealloc);
}

- (void)getRepresentativeMetadataForPlaybackContext:(id)a3 properties:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v7 = a5;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __94__MPCModelRadioQueueFeeder_getRepresentativeMetadataForPlaybackContext_properties_completion___block_invoke;
  v9[3] = &unk_24CABA088;
  v9[4] = self;
  v10 = v7;
  v8 = v7;
  -[MPCModelRadioQueueFeeder loadPlaybackContext:completion:](self, "loadPlaybackContext:completion:", a3, v9);

}

- (int64_t)itemCount
{
  return -[MPCModelRadioPlaybackQueue numberOfItems](self->_playbackQueue, "numberOfItems");
}

- (void)itemDidBeginPlayback:(id)a3
{
  MPAVItem *v5;
  NSObject *v6;
  void *v7;
  int v8;
  MPCModelRadioQueueFeeder *v9;
  __int16 v10;
  MPAVItem *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = (MPAVItem *)a3;
  if (self->_currentItem != v5)
  {
    v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134218242;
      v9 = self;
      v10 = 2114;
      v11 = v5;
      _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_DEFAULT, "[RQF:%p] itemDidBeginPlayback: %{public}@", (uint8_t *)&v8, 0x16u);
    }

    objc_storeStrong((id *)&self->_currentItem, a3);
  }
  if (v5)
  {
    -[MPAVItem queueIdentifier](v5, "queueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_lastPlayedIdentifier, v7);
    if ((-[MPAVItem isExplicitTrack](v5, "isExplicitTrack") & 1) == 0)
      objc_storeStrong((id *)&self->_lastCleanPlayedIdentifier, v7);

  }
}

- (BOOL)canJumpToItem:(id)a3 reason:(id *)a4
{
  return 1;
}

- (BOOL)canSkipItem:(id)a3 reason:(id *)a4
{
  id v6;
  BOOL v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, void *);
  void *v19;
  id v20;

  v6 = a3;
  if (!-[MPCModelRadioQueueFeeder containsLiveStream](self, "containsLiveStream"))
  {
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __47__MPCModelRadioQueueFeeder_canSkipItem_reason___block_invoke;
    v19 = &unk_24CABA0B0;
    v8 = v6;
    v20 = v8;
    v9 = -[MPCModelRadioQueueFeeder identifierRegistryWithExclusiveAccessReturningInteger:](self, "identifierRegistryWithExclusiveAccessReturningInteger:", &v16);
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("cannot find item: %@"), v8, v16, v17, v18, v19);
        v7 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }
      goto LABEL_20;
    }
    v10 = v9;
    -[MPCModelRadioPlaybackQueue radioStation](self->_playbackQueue, "radioStation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelRadioPlaybackQueue trackForItemAtIndex:](self->_playbackQueue, "trackForItemAtIndex:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (!v12)
      goto LABEL_11;
    if ((objc_msgSend(v12, "isSkippable") & 1) != 0)
    {
      if (objc_msgSend(v13, "trackType") != 4 || objc_msgSend(v11, "subtype") == 1)
      {
LABEL_11:
        v7 = 1;
LABEL_19:

LABEL_20:
        goto LABEL_21;
      }
      if (a4)
      {
        v14 = CFSTR("station is a stream");
        goto LABEL_17;
      }
    }
    else if (a4)
    {
      v14 = CFSTR("station track not skippable");
LABEL_17:
      v7 = 0;
      *a4 = v14;
      goto LABEL_19;
    }
    v7 = 0;
    goto LABEL_19;
  }
  v7 = 0;
  if (a4)
    *a4 = CFSTR("live item");
LABEL_21:

  return v7;
}

- (int64_t)supplementalPlaybackContextBehavior
{
  return 2;
}

- (id)supplementalPlaybackContextWithReason:(int64_t)a3
{
  void *v4;
  NSObject *v5;
  _MPCNullPlaybackContext *v6;
  int64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t i;
  void *v11;
  uint64_t quot;
  uint64_t v13;
  char *v14;
  lldiv_t v15;
  uint64_t v16;
  const UInt8 *v17;
  __CFString *v18;
  MPCModelStorePlaybackItemsRequest *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  _QWORD v29[5];
  uint8_t buf[4];
  MPCModelRadioQueueFeeder *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  _QWORD v35[3];

  v35[2] = *MEMORY[0x24BDAC8D0];
  NSStringFromMPPlaybackContextSupplementalReason();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MPCModelRadioQueueFeeder containsLiveStream](self, "containsLiveStream"))
  {
    v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v31 = self;
      v32 = 2114;
      v33 = v4;
      _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEFAULT, "[RQF:%p] supplementalPlaybackContextWithReason:%{public}@ | returning NullPlaybackContext [station contains live stream]", buf, 0x16u);
    }

    v6 = objc_alloc_init(_MPCNullPlaybackContext);
  }
  else
  {
    v7 = -[MPCModelRadioPlaybackQueue numberOfItems](self->_playbackQueue, "numberOfItems");
    if (v7)
    {
      v8 = v7;
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 >= 1)
      {
        for (i = 0; i != v8; ++i)
        {
          -[MPCModelRadioPlaybackQueue trackForItemAtIndex:](self->_playbackQueue, "trackForItemAtIndex:", i);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "storeAdamID"))
          {
            quot = objc_msgSend(v11, "storeAdamID");
            v13 = quot;
            v14 = (char *)v35 + 1;
            do
            {
              v15 = lldiv(quot, 10);
              quot = v15.quot;
              if (v15.rem >= 0)
                LOBYTE(v16) = v15.rem;
              else
                v16 = -v15.rem;
              *(v14 - 2) = v16 + 48;
              v17 = (const UInt8 *)(v14 - 2);
              --v14;
            }
            while (v15.quot);
            if (v13 < 0)
            {
              *(v14 - 2) = 45;
              v17 = (const UInt8 *)(v14 - 2);
            }
            v18 = (__CFString *)CFStringCreateWithBytes(0, v17, (char *)v35 - (char *)v17, 0x8000100u, 0);
            objc_msgSend(v9, "addObject:", v18);

          }
        }
      }
      if (objc_msgSend(v9, "count"))
      {
        v19 = objc_alloc_init(MPCModelStorePlaybackItemsRequest);
        -[MPCModelStorePlaybackItemsRequest setStoreIDs:](v19, "setStoreIDs:", v9);
        -[MPCModelStorePlaybackItemsRequest setClientIdentifier:](v19, "setClientIdentifier:", CFSTR("com.apple.Music"));
        v6 = objc_alloc_init(MPCModelPlaybackContext);
        -[_MPCNullPlaybackContext setRequest:](v6, "setRequest:", v19);
        -[_MPCNullPlaybackContext setPlaybackRequestEnvironment:](v6, "setPlaybackRequestEnvironment:", self->_playbackRequestEnvironment);
        v20 = objc_alloc(MEMORY[0x24BDDC890]);
        objc_msgSend(MEMORY[0x24BDDC758], "emptyIdentifierSet");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = MEMORY[0x24BDAC760];
        v29[1] = 3221225472;
        v29[2] = __66__MPCModelRadioQueueFeeder_supplementalPlaybackContextWithReason___block_invoke;
        v29[3] = &unk_24CABA0E0;
        v29[4] = self;
        v22 = (void *)objc_msgSend(v20, "initWithIdentifiers:block:", v21, v29);
        -[_MPCNullPlaybackContext setFallbackSectionRepresentation:](v6, "setFallbackSectionRepresentation:", v22);

        -[MPCModelRadioQueueFeeder playActivityQueueGroupingID](self, "playActivityQueueGroupingID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MPCNullPlaybackContext setPlayActivityQueueGroupingID:](v6, "setPlayActivityQueueGroupingID:", v23);

        -[MPCModelRadioQueueFeeder playActivityFeatureName](self, "playActivityFeatureName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MPCNullPlaybackContext setPlayActivityFeatureName:](v6, "setPlayActivityFeatureName:", v24);

        -[MPCModelRadioQueueFeeder playActivityRecommendationData](self, "playActivityRecommendationData");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MPCNullPlaybackContext setPlayActivityRecommendationData:](v6, "setPlayActivityRecommendationData:", v25);

        v26 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218498;
          v31 = self;
          v32 = 2114;
          v33 = v4;
          v34 = 2114;
          v35[0] = v6;
          _os_log_impl(&dword_210BD8000, v26, OS_LOG_TYPE_DEFAULT, "[RQF:%p] supplementalPlaybackContextWithReason:%{public}@ | context=%{public}@", buf, 0x20u);
        }

      }
      else
      {
        v19 = (MPCModelStorePlaybackItemsRequest *)os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(&v19->super.super, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218498;
          v31 = self;
          v32 = 2114;
          v33 = v4;
          v34 = 2048;
          v35[0] = v8;
          _os_log_impl(&dword_210BD8000, &v19->super.super, OS_LOG_TYPE_DEFAULT, "[RQF:%p] supplementalPlaybackContextWithReason:%{public}@ | returning nil context [no valid station tracks] count=%ld", buf, 0x20u);
        }
        v6 = 0;
      }

    }
    else
    {
      v27 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v31 = self;
        v32 = 2114;
        v33 = v4;
        _os_log_impl(&dword_210BD8000, v27, OS_LOG_TYPE_DEFAULT, "[RQF:%p] supplementalPlaybackContextWithReason:%{public}@ | returning nil [no items]", buf, 0x16u);
      }

      v6 = 0;
    }
  }

  return v6;
}

- (BOOL)containsLiveStream
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[MPCModelRadioPlaybackQueue tracks](self->_playbackQueue, "tracks", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "trackType") == 4)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)containsRadioContent
{
  return 1;
}

- (BOOL)containsTransportableContentWithReason:(id *)a3
{
  void *v4;
  void *v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 1;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__28558;
  v17 = __Block_byref_object_dispose__28559;
  v18 = 0;
  -[MPCModelRadioPlaybackQueue radioStation](self->_playbackQueue, "radioStation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDDC928];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __67__MPCModelRadioQueueFeeder_containsTransportableContentWithReason___block_invoke;
  v9[3] = &unk_24CABA108;
  v6 = v4;
  v10 = v6;
  v11 = &v13;
  v12 = &v19;
  objc_msgSend(v5, "performWithoutEnforcement:", v9);
  if (a3)
    *a3 = objc_retainAutorelease((id)v14[5]);
  v7 = *((_BYTE *)v20 + 24);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v7;
}

- (BOOL)supportsAutoPlayForItem:(id)a3 inSection:(id)a4
{
  return 1;
}

- (BOOL)isExportableMediaTypeForItem:(id)a3 inSection:(id)a4
{
  return 1;
}

- (id)accountIDForItem:(id)a3 inSection:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t quot;
  uint64_t v12;
  char *v13;
  lldiv_t v14;
  uint64_t v15;
  const UInt8 *v16;
  __CFString *v17;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[MPCModelRadioPlaybackQueue identityPropertySet](self->_playbackQueue, "identityPropertySet", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegatedIdentityProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "DSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MPCModelRadioPlaybackQueue identityPropertySet](self->_playbackQueue, "identityPropertySet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identityProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "DSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v8)
  {
    quot = objc_msgSend(v8, "longLongValue");
    v12 = quot;
    v13 = (char *)&v19 + 1;
    do
    {
      v14 = lldiv(quot, 10);
      quot = v14.quot;
      if (v14.rem >= 0)
        LOBYTE(v15) = v14.rem;
      else
        v15 = -v14.rem;
      *(v13 - 2) = v15 + 48;
      v16 = (const UInt8 *)(v13 - 2);
      --v13;
    }
    while (v14.quot);
    if (v12 < 0)
    {
      *(v13 - 2) = 45;
      v16 = (const UInt8 *)(v13 - 2);
    }
    v17 = (__CFString *)CFStringCreateWithBytes(0, v16, (char *)&v19 - (char *)v16, 0x8000100u, 0);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)loadPlaybackContext:(id)a3 completion:(id)a4
{
  id v8;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  unint64_t v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  MPCPlaybackRequestEnvironment *v22;
  MPCPlaybackRequestEnvironment *playbackRequestEnvironment;
  ICStoreRequestContext *v24;
  ICStoreRequestContext *storeRequestContext;
  MPCModelRadioPlaybackQueue *v26;
  MPCModelRadioPlaybackQueue *playbackQueue;
  NSString *v28;
  NSString *siriAssetInfo;
  NSObject *v30;
  NSUInteger v31;
  NSString *v32;
  void *v33;
  MPCModelGenericAVItemUserIdentityPropertySet *v34;
  id v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  const char *v39;
  NSObject *v40;
  os_signpost_id_t v41;
  uint32_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  const char *v50;
  NSObject *v51;
  uint32_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  os_log_t v67;
  void *v68;
  void *v69;
  NSString *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t i;
  void *v80;
  os_signpost_id_t v81;
  unint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  NSObject *v89;
  NSObject *v90;
  int v91;
  id v92;
  id v93;
  void *v94;
  void *v95;
  unint64_t v96;
  SEL v97;
  os_signpost_id_t v98;
  _QWORD v99[4];
  id v100;
  MPCModelRadioQueueFeeder *v101;
  void *v102;
  id v103;
  SEL v104;
  os_signpost_id_t v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  id v110;
  _BYTE v111[128];
  _BYTE buf[22];
  __int16 v113;
  NSUInteger v114;
  __int16 v115;
  NSString *v116;
  uint64_t v117;

  v117 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v11 = os_signpost_id_make_with_pointer(v10, v8);

  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v13 = v12;
  v14 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "rqf:loadPlaybackContext", ", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDDCB98], "sharedRestrictionsMonitor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "allowsRadioService");

  if ((v16 & 1) != 0)
  {
    v96 = v11 - 1;
    v97 = a2;
    v98 = v11;
    objc_msgSend(v8, "playActivityRecommendationData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelRadioQueueFeeder setPlayActivityRecommendationData:](self, "setPlayActivityRecommendationData:", v17);

    objc_msgSend(v8, "playActivityQueueGroupingID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelRadioQueueFeeder setPlayActivityQueueGroupingID:](self, "setPlayActivityQueueGroupingID:", v18);

    objc_msgSend(v8, "playActivityFeatureName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelRadioQueueFeeder setPlayActivityFeatureName:](self, "setPlayActivityFeatureName:", v19);

    objc_msgSend(v8, "siriReferenceIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelRadioQueueFeeder setSiriReferenceIdentifier:](self, "setSiriReferenceIdentifier:", v20);

    objc_msgSend(v8, "siriWHAMetricsInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelRadioQueueFeeder setSiriWHAMetricsInfo:](self, "setSiriWHAMetricsInfo:", v21);

    objc_msgSend(v8, "playbackRequestEnvironment");
    v22 = (MPCPlaybackRequestEnvironment *)objc_claimAutoreleasedReturnValue();
    playbackRequestEnvironment = self->_playbackRequestEnvironment;
    self->_playbackRequestEnvironment = v22;

    -[MPCPlaybackRequestEnvironment _createStoreRequestContext](self->_playbackRequestEnvironment, "_createStoreRequestContext");
    v24 = (ICStoreRequestContext *)objc_claimAutoreleasedReturnValue();
    storeRequestContext = self->_storeRequestContext;
    self->_storeRequestContext = v24;

    objc_storeStrong((id *)&self->_playbackContext, a3);
    v26 = -[MPCModelRadioPlaybackQueue initWithPlaybackContext:]([MPCModelRadioPlaybackQueue alloc], "initWithPlaybackContext:", v8);
    playbackQueue = self->_playbackQueue;
    self->_playbackQueue = v26;

    objc_msgSend(v8, "siriAssetInfo");
    v28 = (NSString *)objc_claimAutoreleasedReturnValue();
    siriAssetInfo = self->_siriAssetInfo;
    self->_siriAssetInfo = v28;

    v30 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = -[NSString length](self->_siriAssetInfo, "length");
      v32 = self->_siriAssetInfo;
      *(_DWORD *)buf = 134218754;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v8;
      v113 = 2048;
      v114 = v31;
      v115 = 2112;
      v116 = v32;
      _os_log_impl(&dword_210BD8000, v30, OS_LOG_TYPE_DEFAULT, "[RQF:%p] loadPlaybackContext:%{public}@ | [] siriAssetInfo=(:%ld)%@", buf, 0x2Au);
    }

    -[MPCPlaybackRequestEnvironment _createStoreRequestContext](self->_playbackRequestEnvironment, "_createStoreRequestContext");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = 0;
    v34 = -[MPCModelGenericAVItemUserIdentityPropertySet initWithRequestContext:error:]([MPCModelGenericAVItemUserIdentityPropertySet alloc], "initWithRequestContext:error:", v33, &v110);
    v35 = v110;
    -[MPCModelRadioPlaybackQueue setIdentityPropertySet:](self->_playbackQueue, "setIdentityPropertySet:", v34);

    if (v35
      || (-[MPCModelRadioPlaybackQueue identityPropertySet](self->_playbackQueue, "identityPropertySet"),
          v43 = (void *)objc_claimAutoreleasedReturnValue(),
          v43,
          !v43))
    {
      v36 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v35;
        _os_log_impl(&dword_210BD8000, v36, OS_LOG_TYPE_ERROR, "[RQF:%p] loadPlaybackContext:… | failed to load identity properties [] error=%{public}@", buf, 0x16u);
      }

      (*((void (**)(id, _QWORD, _QWORD, id))v9 + 2))(v9, 0, 0, v35);
      goto LABEL_50;
    }
    v93 = v9;
    -[MPCModelRadioQueueFeeder _endObservingIdentityStoreForSignOut](self, "_endObservingIdentityStoreForSignOut");
    -[MPCModelRadioQueueFeeder _defaultGetTracksRequestWithContext:radioStation:](self, "_defaultGetTracksRequestWithContext:radioStation:", self->_storeRequestContext, 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "radioStation");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "identifiers");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "radio");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "stationStringID");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v95 = v44;
    v94 = v48;
    if (objc_msgSend(v8, "continueListeningStation"))
    {
      if (objc_msgSend(v48, "length"))
      {
        objc_msgSend(v44, "setReasonType:", 1);
        objc_msgSend(v44, "setStationStringID:", v48);
        v49 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v48;
          v50 = "[RQF:%p] loadPlaybackContext:… | resuming continue listening station [] stationID=%{public}@";
          v51 = v49;
          v52 = 22;
LABEL_30:
          _os_log_impl(&dword_210BD8000, v51, OS_LOG_TYPE_DEFAULT, v50, buf, v52);
        }
      }
      else
      {
        objc_msgSend(v44, "setReasonType:", 6);
        v49 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = self;
          v50 = "[RQF:%p] loadPlaybackContext:… | requesting new continue listening station";
          v51 = v49;
          v52 = 12;
          goto LABEL_30;
        }
      }

      v71 = -[MPCModelRadioPlaybackContext continueListeningMaxQueueReferences](self->_playbackContext, "continueListeningMaxQueueReferences");
      if (v71 <= 0)
        v72 = 10;
      else
        v72 = v71;
      objc_msgSend(v8, "continueListeningQueueProvider");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "queueReferencesWithMaxCount:", v72);
      v74 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v74, "count"));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = 0u;
      v107 = 0u;
      v108 = 0u;
      v109 = 0u;
      v67 = v74;
      v76 = -[NSObject countByEnumeratingWithState:objects:count:](v67, "countByEnumeratingWithState:objects:count:", &v106, v111, 16);
      v9 = v93;
      if (v76)
      {
        v77 = v76;
        v78 = *(_QWORD *)v107;
        do
        {
          for (i = 0; i != v77; ++i)
          {
            if (*(_QWORD *)v107 != v78)
              objc_enumerationMutation(v67);
            objc_msgSend(*(id *)(*((_QWORD *)&v106 + 1) + 8 * i), "ICRadioContentReference");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "addObject:", v80);

          }
          v77 = -[NSObject countByEnumeratingWithState:objects:count:](v67, "countByEnumeratingWithState:objects:count:", &v106, v111, 16);
        }
        while (v77);
      }

      objc_msgSend(v95, "setQueueContentReferences:", v75);
      v81 = v98;
      v82 = v96;
      goto LABEL_46;
    }
    objc_msgSend(v44, "setReasonType:", 1);
    v53 = objc_msgSend(v48, "length");
    v54 = v44;
    if (v53)
    {
      objc_msgSend(v8, "radioStation");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "identifiers");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "radio");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "stationHash");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setStationHash:", v58);

      objc_msgSend(v8, "radioStation");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "identifiers");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "radio");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setStationID:", objc_msgSend(v61, "stationID"));

      objc_msgSend(v8, "radioStation");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "identifiers");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "radio");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "stationStringID");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setStationStringID:", v65);

      objc_msgSend(v8, "stationURL");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setStationURL:", v66);

      v67 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v9 = v93;
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v54, "stationStringID");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "stationHash");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "stationURL");
        v70 = (NSString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v68;
        v113 = 2114;
        v114 = (NSUInteger)v69;
        v115 = 2114;
        v116 = v70;
        _os_log_impl(&dword_210BD8000, v67, OS_LOG_TYPE_DEFAULT, "[RQF:%p] loadPlaybackContext:… | resuming station [] stationID=%{public}@ stationHash=%{public}@ stationURL=%{public}@", buf, 0x2Au);

LABEL_44:
      }
    }
    else
    {
      objc_msgSend(v8, "nowPlayingContentReference");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "ICRadioContentReference");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setNowPlayingContentReference:", v84);

      objc_msgSend(v8, "nowPlayingContentReference");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setPreservingCurrentlyPlayingItem:", v85 != 0);

      objc_msgSend(v8, "seedContentReference");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "ICRadioContentReference");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setSeedContentReference:", v87);

      v67 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v9 = v93;
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v54, "seedContentReference");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "nowPlayingContentReference");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v68;
        v113 = 2114;
        v114 = (NSUInteger)v69;
        _os_log_impl(&dword_210BD8000, v67, OS_LOG_TYPE_DEFAULT, "[RQF:%p] loadPlaybackContext:… | requesting new station [] seedContentReference=%{public}@, nowPlayingContentReference=%{public}@", buf, 0x20u);
        goto LABEL_44;
      }
    }
    v82 = v96;
    v81 = v98;
LABEL_46:

    v88 = objc_alloc_init(MEMORY[0x24BE65C40]);
    v89 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v90 = v89;
    if (v82 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v89))
    {
      v91 = objc_msgSend(v95, "reasonType");
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v91;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v90, OS_SIGNPOST_INTERVAL_BEGIN, v81, "rqf:loadPlaybackContext:getTracks", "reasonType=%d", buf, 8u);
    }

    v99[0] = MEMORY[0x24BDAC760];
    v99[1] = 3221225472;
    v99[2] = __59__MPCModelRadioQueueFeeder_loadPlaybackContext_completion___block_invoke;
    v99[3] = &unk_24CABA130;
    v100 = v88;
    v101 = self;
    v104 = v97;
    v105 = v81;
    v102 = v95;
    v103 = v9;
    v92 = v88;
    -[MPCModelRadioQueueFeeder _loadTracksWithRequest:completion:](self, "_loadTracksWithRequest:completion:", v95, v99);

    v35 = 0;
LABEL_50:

    goto LABEL_51;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 64, CFSTR("Radio service is restricted"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v38 = v37;
  if (v33)
  {
    if (v14 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v37))
      goto LABEL_24;
    *(_QWORD *)buf = 67109378;
    *(_WORD *)&buf[8] = 2114;
    *(_QWORD *)&buf[10] = v33;
    v39 = "allowsRadioService=%d error=%{public}@";
    v40 = v38;
    v41 = v11;
    v42 = 18;
  }
  else
  {
    if (v14 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v37))
      goto LABEL_24;
    *(_QWORD *)buf = 67109120;
    v39 = "allowsRadioService=%d";
    v40 = v38;
    v41 = v11;
    v42 = 8;
  }
  _os_signpost_emit_with_name_impl(&dword_210BD8000, v40, OS_SIGNPOST_INTERVAL_END, v41, "rqf:loadPlaybackContext:allowsRadioService", v39, buf, v42);
LABEL_24:

  (*((void (**)(id, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, v33);
LABEL_51:

}

- (id)identifiersForItem:(id)a3 inSection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__MPCModelRadioQueueFeeder_identifiersForItem_inSection___block_invoke;
  v9[3] = &unk_24CABA158;
  v10 = v5;
  v6 = v5;
  -[MPCModelRadioQueueFeeder identifierRegistryWithExclusiveAccessReturningObject:](self, "identifierRegistryWithExclusiveAccessReturningObject:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)itemForItem:(id)a3 inSection:(id)a4
{
  NSObject *v7;
  id v8;
  void *v9;
  char v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  _QWORD v22[4];
  NSObject *v23;
  uint8_t buf[4];
  MPCModelRadioQueueFeeder *v25;
  __int16 v26;
  NSObject *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  -[MPMutableIdentifierListSection sectionIdentifier](self->_section, "sectionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPMutableIdentifierListSection sectionIdentifier](self->_section, "sectionIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCModelRadioQueueFeeder.m"), 383, CFSTR("Provided section identifier did not match stored section identifier: %@ != %@"), v8, v21);

  }
  if (self->_playbackQueue)
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __50__MPCModelRadioQueueFeeder_itemForItem_inSection___block_invoke;
    v22[3] = &unk_24CABA0B0;
    v11 = v7;
    v23 = v11;
    v12 = -[MPCModelRadioQueueFeeder identifierRegistryWithExclusiveAccessReturningInteger:](self, "identifierRegistryWithExclusiveAccessReturningInteger:", v22);
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218498;
        v25 = self;
        v26 = 2114;
        v27 = v11;
        v28 = 2114;
        v29 = v8;
        _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_ERROR, "[RQF:%p] itemForItem:%{public}@ inSection:%{public}@ | returning nil [no index for item in registry]", buf, 0x20u);
      }

      v14 = 0;
    }
    else
    {
      -[MPCModelRadioPlaybackQueue AVItemAtIndex:](self->_playbackQueue, "AVItemAtIndex:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v16;
      if (v16)
      {
        objc_msgSend(v16, "setFeeder:", self);
        objc_msgSend(v14, "setQueueIdentifier:", v11);
        -[MPCModelRadioQueueFeeder modelPlayEventForItem:inSection:](self, "modelPlayEventForItem:inSection:", v11, v8);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setModelPlayEvent:", v17);

        -[MPCModelRadioPlaybackContext associatedParticipantIdentifier](self->_playbackContext, "associatedParticipantIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setAssociatedParticipantIdentifier:", v18);

      }
    }
    v15 = v23;
  }
  else
  {
    v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      v25 = self;
      v26 = 2114;
      v27 = v7;
      v28 = 2114;
      v29 = v8;
      _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_ERROR, "[RQF:%p] itemForItem:%{public}@ inSection:%{public}@ | returning nil [no playbackQueue]", buf, 0x20u);
    }
    v14 = 0;
  }

  return v14;
}

- (BOOL)shouldRequestAdditionalItemsWhenReachingTailOfSection:(id)a3
{
  id v4;
  _BOOL4 v5;

  v4 = a3;
  if (self->_supportsLoadingAdditionalItems && !self->_hasReachedTracklistEnd)
    v5 = !-[MPCModelRadioQueueFeeder containsLiveStream](self, "containsLiveStream");
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (int64_t)prefetchThresholdForSection:(id)a3
{
  int64_t result;

  if (!-[MPCModelRadioPlaybackContext continueListeningStation](self->_playbackContext, "continueListeningStation", a3))
    return 1;
  result = -[MPCModelRadioPlaybackContext continueListeningPrefetchThreshold](self->_playbackContext, "continueListeningPrefetchThreshold");
  if (result <= 1)
    return 1;
  return result;
}

- (void)loadAdditionalItemsWithCount:(int64_t)a3 forSection:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int64_t v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  os_signpost_id_t v23;
  int64_t v24;
  uint8_t buf[4];
  MPCModelRadioQueueFeeder *v26;
  __int16 v27;
  int64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  -[MPCModelRadioPlaybackQueue radioStation](self->_playbackQueue, "radioStation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelRadioQueueFeeder _defaultGetTracksRequestWithContext:radioStation:](self, "_defaultGetTracksRequestWithContext:radioStation:", self->_storeRequestContext, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setReasonType:", 3);
  if (a3 <= 1)
    v12 = 1;
  else
    v12 = a3;
  objc_msgSend(v11, "setRequestedTrackCount:", v12);
  v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
  v14 = os_signpost_id_generate(v13);

  v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v26 = self;
    v27 = 2048;
    v28 = a3;
    v29 = 2114;
    v30 = v8;
    _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_DEFAULT, "[RQF:%p] loadAdditionalItemsWithCount:%ld forSection:%{public}@ | calling load", buf, 0x20u);
  }

  v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v17 = v16;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v14, "rqf:loadAdditionalItems:loadTracks", ", buf, 2u);
  }

  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __79__MPCModelRadioQueueFeeder_loadAdditionalItemsWithCount_forSection_completion___block_invoke;
  v20[3] = &unk_24CABA180;
  v23 = v14;
  v24 = a3;
  v20[4] = self;
  v21 = v8;
  v22 = v9;
  v18 = v9;
  v19 = v8;
  -[MPCModelRadioQueueFeeder _loadTracksWithRequest:completion:](self, "_loadTracksWithRequest:completion:", v11, v20);

}

- (id)placeholderItemForLoadingAdditionalItemsInSection:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  if (-[MPCModelRadioPlaybackContext continueListeningStation](self->_playbackContext, "continueListeningStation", a3))
    return 0;
  -[MPCModelRadioPlaybackQueue radioStation](self->_playbackQueue, "radioStation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDDCB00]);
    v7 = (void *)MEMORY[0x24BDDC928];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __78__MPCModelRadioQueueFeeder_placeholderItemForLoadingAdditionalItemsInSection___block_invoke;
    v11[3] = &unk_24CABA1D0;
    v8 = v6;
    v12 = v8;
    v13 = v5;
    objc_msgSend(v7, "performWithoutEnforcement:", v11);
    v9 = v13;
    v10 = v8;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)updatedPlaybackContext
{
  return self->_playbackContext;
}

- (BOOL)section:(id)a3 supportsShuffleType:(int64_t)a4
{
  return a4 == 0;
}

- (void)reloadSection:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD);
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  unint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  _QWORD v28[5];
  _QWORD v29[4];
  id v30;
  MPCModelRadioQueueFeeder *v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_storeStrong((id *)&self->_section, a3);
  v8 = (void (**)(id, _QWORD))a4;
  if (self->_needsSectionUpdate)
  {
    -[MPMutableIdentifierListSection updateSection](self->_section, "updateSection");
    self->_needsSectionUpdate = 0;
  }
  v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v10 = os_signpost_id_make_with_pointer(v9, v7);

  v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v12 = v11;
  v13 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "rqf:reloadSection", ", buf, 2u);
  }

  objc_msgSend(v7, "itemIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v16 = v15;
  if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v10, "rqf:reloadSection:diff", ", buf, 2u);
  }

  v17 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __53__MPCModelRadioQueueFeeder_reloadSection_completion___block_invoke;
  v29[3] = &unk_24CABA260;
  v18 = v14;
  v30 = v18;
  v31 = self;
  -[MPCModelRadioQueueFeeder identifierRegistryWithExclusiveAccessReturningObject:](self, "identifierRegistryWithExclusiveAccessReturningObject:", v29);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v21 = v20;
  if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_DWORD *)buf = 138543362;
    v33 = v19;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v21, OS_SIGNPOST_INTERVAL_END, v10, "rqf:reloadSection:diff", "changes=%{public}@", buf, 0xCu);
  }

  if (v19)
  {
    v22 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v23 = v22;
    if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v10, "rqf:reloadSection:apply", ", buf, 2u);
    }

    v28[0] = v17;
    v28[1] = 3221225472;
    v28[2] = __53__MPCModelRadioQueueFeeder_reloadSection_completion___block_invoke_67;
    v28[3] = &unk_24CABA2A8;
    v28[4] = self;
    objc_msgSend(v7, "applyChanges:itemLookupBlock:", v19, v28);
    v24 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v25 = v24;
    if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v25, OS_SIGNPOST_INTERVAL_END, v10, "rqf:reloadSection:apply", ", buf, 2u);
    }

  }
  v26 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v27 = v26;
  if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v27, OS_SIGNPOST_INTERVAL_END, v10, "rqf:reloadSection", ", buf, 2u);
  }

  v8[2](v8, 0);
}

- (id)firstModelPlayEvent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDDC938];
  -[MPCModelRadioPlaybackQueue radioStation](self->_playbackQueue, "radioStation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelRadioQueueFeeder playActivityFeatureName](self, "playActivityFeatureName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playEventWithModelObject:featureName:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)rtcReportingPlayQueueSourceIdentifier
{
  return (NSString *)CFSTR("queue-source.tilt");
}

- (void)_updateAdditionalLoadingSupport
{
  void *v3;
  uint64_t v4;
  void *v5;
  int IsCellular;
  int v7;
  NSObject *v8;
  int v9;
  MPCModelRadioQueueFeeder *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "preferredMusicLowBandwidthResolution");

  objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "networkType");
  IsCellular = ICEnvironmentNetworkTypeIsCellular();

  v7 = IsCellular ^ 1;
  if (v4 > 0)
    v7 = 1;
  if (self->_supportsLoadingAdditionalItems != v7)
  {
    self->_supportsLoadingAdditionalItems = v7;
    if ((v7 & 1) == 0)
    {
      v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = 134217984;
        v10 = self;
        _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_ERROR, "[RQF:%p] _updateAdditionalLoadingSupport | loading additional items disabled [cellular streaming restricted]", (uint8_t *)&v9, 0xCu);
      }

    }
  }
}

- (void)_allowCellularStreamingDidChangeNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__MPCModelRadioQueueFeeder__allowCellularStreamingDidChangeNotification___block_invoke;
  block[3] = &unk_24CABA2D0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (void)_detectSignOutForIdentityStoreChangeNotification:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  MPCModelRadioQueueFeeder *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __77__MPCModelRadioQueueFeeder__detectSignOutForIdentityStoreChangeNotification___block_invoke;
  v6[3] = &unk_24CABA1D0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

- (void)_responseDidInvalidateNotification:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  MPCModelRadioQueueFeeder *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __63__MPCModelRadioQueueFeeder__responseDidInvalidateNotification___block_invoke;
  v6[3] = &unk_24CABA1D0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

- (void)environmentMonitorDidChangeNetworkType:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__MPCModelRadioQueueFeeder_environmentMonitorDidChangeNetworkType___block_invoke;
  block[3] = &unk_24CABA2D0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (void)_beginBackgroundTaskAssertion
{
  unint64_t backgroundTasks;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t backgroundTaskIdentifier;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  unint64_t v14;
  _QWORD v15[5];
  uint8_t buf[4];
  MPCModelRadioQueueFeeder *v17;
  __int16 v18;
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  backgroundTasks = self->_backgroundTasks;
  self->_backgroundTasks = backgroundTasks + 1;
  v4 = *MEMORY[0x24BE65AB8];
  if (!backgroundTasks || self->_backgroundTaskIdentifier == v4)
  {
    -[MPCModelRadioQueueFeeder description](self, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    MPSharedBackgroundTaskProvider();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __57__MPCModelRadioQueueFeeder__beginBackgroundTaskAssertion__block_invoke;
    v15[3] = &unk_24CABA2D0;
    v15[4] = self;
    self->_backgroundTaskIdentifier = objc_msgSend(v6, "beginTaskWithName:expirationHandler:", v5, v15);

    backgroundTaskIdentifier = self->_backgroundTaskIdentifier;
    v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v9 = v8;
    if (backgroundTaskIdentifier == v4)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v17 = self;
        v10 = "[RQF:%p] _beginBackgroundTaskAssertion | failed to start task []";
        v11 = v9;
        v12 = OS_LOG_TYPE_ERROR;
        v13 = 12;
LABEL_8:
        _os_log_impl(&dword_210BD8000, v11, v12, v10, buf, v13);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v14 = self->_backgroundTaskIdentifier;
      *(_DWORD *)buf = 134218240;
      v17 = self;
      v18 = 2048;
      v19 = v14;
      v10 = "[RQF:%p] _beginBackgroundTaskAssertion | started task [] backgroundTaskIdentifier=%lu";
      v11 = v9;
      v12 = OS_LOG_TYPE_INFO;
      v13 = 22;
      goto LABEL_8;
    }

  }
}

- (void)_beginObservingIdentityStoreForSignOut
{
  ICUserIdentityStore *v3;
  ICUserIdentityStore **p_observedIdentityStore;
  void *v5;
  void *v6;
  _QWORD *v7;
  ICUserIdentityStore *obj;

  -[ICStoreRequestContext identityStore](self->_storeRequestContext, "identityStore");
  v3 = (ICUserIdentityStore *)objc_claimAutoreleasedReturnValue();
  p_observedIdentityStore = &self->_observedIdentityStore;
  if (self->_observedIdentityStore != v3)
  {
    obj = v3;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = (_QWORD *)MEMORY[0x24BEC8728];
    if (*p_observedIdentityStore)
      objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x24BEC8728]);
    objc_storeStrong((id *)&self->_observedIdentityStore, obj);
    if (*p_observedIdentityStore)
    {
      objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__detectSignOutForIdentityStoreChangeNotification_, *v7);
      -[MPCModelRadioQueueFeeder _detectSignOutForIdentityStore:](self, "_detectSignOutForIdentityStore:", *p_observedIdentityStore);
    }

    v3 = obj;
  }

}

- (id)_defaultGetTracksRequestWithContext:(id)a3 radioStation:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint32_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _BYTE v30[40];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (objc_class *)MEMORY[0x24BEC8940];
  v8 = a4;
  v9 = objc_alloc_init(v7);
  objc_msgSend(MEMORY[0x24BDDCB98], "sharedRestrictionsMonitor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "allowsExplicitContent");

  if (objc_msgSend(MEMORY[0x24BDDC748], "isCurrentDeviceValidHomeAccessory"))
  {
    v12 = (void *)MEMORY[0x24BDDC750];
    objc_msgSend(v6, "identity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identityStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "userMonitorWithUserIdentity:fromUserIdentityStore:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v11 = objc_msgSend(v15, "isExplicitSettingEnabled");
      v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "identity");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v30 = 134218754;
        *(_QWORD *)&v30[4] = self;
        *(_WORD *)&v30[12] = 1024;
        *(_DWORD *)&v30[14] = v11;
        *(_WORD *)&v30[18] = 2114;
        *(_QWORD *)&v30[20] = v17;
        *(_WORD *)&v30[28] = 2048;
        *(_QWORD *)&v30[30] = v15;
        v18 = "[RQF:%p] _defaultGetTracksRequestWithContext: | updating allowExplicit with homeUserMonitor [] allowExplic"
              "it=%{BOOL}u userIdentity=%{public}@ userMonitor=%p";
        v19 = v16;
        v20 = OS_LOG_TYPE_DEFAULT;
        v21 = 38;
LABEL_7:
        _os_log_impl(&dword_210BD8000, v19, v20, v18, v30, v21);

      }
    }
    else
    {
      v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "identity");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v30 = 134218242;
        *(_QWORD *)&v30[4] = self;
        *(_WORD *)&v30[12] = 2114;
        *(_QWORD *)&v30[14] = v17;
        v18 = "[RQF:%p] _defaultGetTracksRequestWithContext: | failed to get homeUserMonitor [] userIdentity=%{public}@";
        v19 = v16;
        v20 = OS_LOG_TYPE_ERROR;
        v21 = 22;
        goto LABEL_7;
      }
    }

  }
  objc_msgSend(v9, "setAllowsExplicitContent:", v11, *(_OWORD *)v30, *(_QWORD *)&v30[16], *(_OWORD *)&v30[24], v31);
  objc_msgSend(v9, "setRequestContext:", v6);
  objc_msgSend(v9, "setShouldResponseContainStationMetadata:", 1);
  v22 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v9, "setPrivateListeningEnabled:", MEMORY[0x24BDBD1C8]);
  objc_msgSend(v9, "setDelegatedPrivateListeningEnabled:", v22);
  objc_msgSend(v8, "identifiers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v23, "radio");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stationHash");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStationHash:", v25);

    objc_msgSend(v23, "radio");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStationID:", objc_msgSend(v26, "stationID"));

    objc_msgSend(v23, "radio");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stationStringID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStationStringID:", v28);

  }
  return v9;
}

- (void)_detectSignOutForIdentityStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  _QWORD block[4];
  NSObject *v11;
  MPCModelRadioQueueFeeder *v12;
  id v13;
  uint8_t buf[4];
  MPCModelRadioQueueFeeder *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ICStoreRequestContext identity](self->_storeRequestContext, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v4, "getPropertiesForUserIdentity:error:", v5, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;

  if (v7)
  {
    v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "msv_description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v15 = self;
      v16 = 2114;
      v17 = v9;
      _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_ERROR, "[RQF:%p] _detectSignOutForIdentityStore: | error=%{public}@", buf, 0x16u);

    }
    goto LABEL_6;
  }
  if (!v6)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__MPCModelRadioQueueFeeder__detectSignOutForIdentityStore___block_invoke;
    block[3] = &unk_24CABA1D0;
    v11 = v4;
    v12 = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    v8 = v11;
LABEL_6:

  }
}

- (void)_endBackgroundTaskAssertion
{
  dispatch_time_t v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v2 = dispatch_time(0, 1000000000);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __55__MPCModelRadioQueueFeeder__endBackgroundTaskAssertion__block_invoke;
  v3[3] = &unk_24CABA2F8;
  objc_copyWeak(&v4, &location);
  dispatch_after(v2, MEMORY[0x24BDAC9B8], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_endObservingIdentityStoreForSignOut
{
  ICUserIdentityStore *observedIdentityStore;
  id v4;

  if (self->_observedIdentityStore)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BEC8728], self->_observedIdentityStore);
    observedIdentityStore = self->_observedIdentityStore;
    self->_observedIdentityStore = 0;

  }
}

- (id)_errorForRequest:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  NSObject *v45;
  uint64_t v46;
  const __CFString *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  unint64_t v52;
  void *v53;
  id v54;
  void *v55;
  _QWORD v56[2];
  _QWORD v57[2];
  uint8_t buf[4];
  MPCModelRadioQueueFeeder *v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  int v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BEC8628];
  objc_msgSend(v7, "msv_errorByUnwrappingDomain:", *MEMORY[0x24BEC8628]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v59 = self;
      v60 = 2114;
      v61 = (uint64_t)v7;
      v11 = "[RQF:%p] _errorForRequest:withError: | setting _hasReachedTracklistEnd=YES [received ICRadioServerErrorDomai"
            "n] underlyingError=%{public}@";
LABEL_7:
      _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_ERROR, v11, buf, 0x16u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v12 = *MEMORY[0x24BEC8580];
  objc_msgSend(v7, "msv_errorByUnwrappingDomain:code:", *MEMORY[0x24BEC8580], -7101);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v59 = self;
      v60 = 2114;
      v61 = (uint64_t)v7;
      v11 = "[RQF:%p] _errorForRequest:withError: | setting _hasReachedTracklistEnd=YES [received ICErrorCodeInvalidReque"
            "st] underlyingError=%{public}@";
      goto LABEL_7;
    }
LABEL_8:

    self->_hasReachedTracklistEnd = 1;
    v14 = v7;
    goto LABEL_9;
  }
  v16 = v7;
  v14 = v16;
  if (self->_queueGeneration)
  {
    objc_msgSend(v16, "msv_errorByUnwrappingDomain:code:", v12, -7100);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        v59 = self;
        v60 = 2114;
        v61 = (uint64_t)v14;
        _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_ERROR, "[RQF:%p] _errorForRequest:withError: | setting _hasReachedTracklistEnd=YES [received ICErrorCodeConnectionFailed] underlyingError=%{public}@", buf, 0x16u);
      }

      self->_hasReachedTracklistEnd = 1;
    }
    goto LABEL_9;
  }
  self->_hasReachedTracklistEnd = 1;
  v19 = v6;
  v20 = (void *)MEMORY[0x24BDBCED8];
  v21 = v14;
  objc_msgSend(v20, "dictionaryWithCapacity:", 4);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "mediaPlaybackCoreBundle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "msv_errorByUnwrappingDomain:", v8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
    goto LABEL_24;
  v24 = objc_msgSend(v23, "code");
  v25 = 0;
  if (v24 > 139)
  {
    if (v24 == 141)
    {
      objc_msgSend(v55, "setObject:forKeyedSubscript:", &unk_24CB16F38, CFSTR("MPCRadioPlaybackErrorCategoryKey"));
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("PLAYBACK_FAILURE_LOCATION_RESTRICTION_TITLE"), &stru_24CABB5D0, CFSTR("Radio"));
      v25 = objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    }
    v26 = 0;
    if (v24 != 140)
      goto LABEL_26;
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", 3);
    objc_msgSend(v55, "setObject:forKey:", v29, CFSTR("MPCRadioPlaybackErrorCategoryKey"));

LABEL_24:
    v25 = 0;
LABEL_25:
    v26 = 0;
    goto LABEL_26;
  }
  if (v24 == 120)
  {
    objc_msgSend(v19, "seedContentReference");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "contentType");
    if (v52 > 3)
    {
      v26 = 0;
    }
    else
    {
      objc_msgSend(v22, "localizedStringForKey:value:table:", off_24CAB99F8[v52], &stru_24CABB5D0, CFSTR("Radio"));
      v26 = objc_claimAutoreleasedReturnValue();
    }

    v25 = 0;
    goto LABEL_26;
  }
  v26 = 0;
  if (v24 == 125)
  {
    objc_msgSend(MEMORY[0x24BDDCB98], "sharedRestrictionsMonitor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "allowsExplicitContent");

    if ((v28 & 1) == 0)
    {
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("EXPLICIT_CONTENT_NOT_ALLOWED_TITLE"), &stru_24CABB5D0, CFSTR("MediaPlaybackCore"));
      v25 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("EXPLICIT_CONTENT_NOT_ALLOWED_DUE_TO_RESTRICTIONS"), &stru_24CABB5D0, CFSTR("MediaPlaybackCore"));
      v26 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
    goto LABEL_24;
  }
LABEL_26:
  if (v25 | v26)
  {
    objc_msgSend(MEMORY[0x24BDDCB70], "dialogWithTitle:message:", v25, v26);
    v53 = v23;
    v54 = v21;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v19;
    v32 = (void *)MEMORY[0x24BDDCB78];
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24CABB5D0, CFSTR("Radio"));
    v33 = v22;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "actionWithTitle:type:commandEvent:", v34, 0, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addAction:", v35);

    v19 = v31;
    v21 = v54;

    v22 = v33;
    objc_msgSend(v55, "setObject:forKey:", v30, CFSTR("MPCErrorUserInfoKeyRemoteDialog"));

    v23 = v53;
  }

  v36 = v21;
  objc_msgSend(v36, "msv_errorByUnwrappingDomain:code:", *MEMORY[0x24BDD1308], -1009);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = v36;
  if (v37)
  {
    objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "networkType");

    objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v41, "preferredMusicLowBandwidthResolution") < 1)
    {
      v43 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDDC708], "sharedCloudController");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "isCellularDataRestrictedForMusic") ^ 1;

    }
    v44 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      v59 = self;
      v60 = 2048;
      v61 = v40;
      v62 = 1024;
      v63 = v43;
      _os_log_impl(&dword_210BD8000, v44, OS_LOG_TYPE_ERROR, "[RQF:%p] _errorForRequest:withError: | Received NSURLErrorNotConnectedToInternet [] currentNetworkType=%li cellularDataAllowed=%{BOOL}u", buf, 0x1Cu);
    }

    if ((v43 & 1) != 0 || !ICEnvironmentNetworkTypeIsCellular())
    {
      v45 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        v59 = self;
        v60 = 2114;
        v61 = (uint64_t)v36;
        _os_log_impl(&dword_210BD8000, v45, OS_LOG_TYPE_ERROR, "[RQF:%p] _errorForRequest:withError: | Transforming error to 'radio queue feeder network unavailable' [] underlyingError=%{public}@", buf, 0x16u);
      }
      v46 = -1004;
      v47 = CFSTR("Network Unavailable");
    }
    else
    {
      _MPCLogCategoryPlayback();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218242;
        v59 = self;
        v60 = 2114;
        v61 = (uint64_t)v36;
        _os_log_impl(&dword_210BD8000, v45, OS_LOG_TYPE_INFO, "[RQF:%p] _errorForRequest:withError: | Transforming error to 'cellular restricted error' [network type cellular] underlyingError=%{public}@", buf, 0x16u);
      }
      v46 = -1003;
      v47 = CFSTR("Cellular Restricted");
    }

    v56[0] = CFSTR("ICEnvironmentNetworkType");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v40);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v56[1] = CFSTR("isMusicCellularStreamingAllowed");
    v57[0] = v48;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v43);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v57[1] = v49;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "msv_errorByWrappingWithDomain:code:userInfo:debugDescription:", CFSTR("MPCModelRadioQueueFeederError"), v46, v50, CFSTR("radio request failed with reason: %@"), v47);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (!v38)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCModelRadioQueueFeederError"), -1005, CFSTR("Invalid case -- missing underlyingError"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:userInfo:debugDescription:", *MEMORY[0x24BDDB968], 3, v38, v55, CFSTR("radio request failed"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v14;
}

- (void)_handleGetTracksResponse:(id)a3 getTracksError:(id)a4 fromRequest:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  char *v15;
  NSObject *v16;
  NSObject *v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  MPCModelRadioPersonalizationRequest *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  _QWORD v32[6];
  id v33;
  id v34;
  id v35[2];
  id location;
  _QWORD v37[5];
  uint8_t buf[4];
  MPCModelRadioQueueFeeder *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  MPCModelRadioPersonalizationRequest *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10)
  {
    v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v15 = (char *)os_signpost_id_make_with_pointer(v14, v10);

    v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v17 = v16;
    v18 = (unint64_t)(v15 - 1);
    if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v17, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v15, "rqf:_handleGetTracksResponse:merge", ", buf, 2u);
    }

    if (self->_currentItem)
    {
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __91__MPCModelRadioQueueFeeder__handleGetTracksResponse_getTracksError_fromRequest_completion___block_invoke;
      v37[3] = &unk_24CABA0B0;
      v37[4] = self;
      v19 = -[MPCModelRadioQueueFeeder identifierRegistryWithExclusiveAccessReturningInteger:](self, "identifierRegistryWithExclusiveAccessReturningInteger:", v37);
    }
    else
    {
      v19 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v22 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v39 = self;
      v40 = 2048;
      v41 = v19;
      _os_log_impl(&dword_210BD8000, v22, OS_LOG_TYPE_INFO, "[RQF:%p] _handleGetTracksResponse: | merging playback queue [] currentIndex=%lld", buf, 0x16u);
    }

    -[MPCModelRadioPlaybackQueue tracksByApplyingTracksResponse:currentIndex:](self->_playbackQueue, "tracksByApplyingTracksResponse:currentIndex:", v10, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v24 = v23;
    if (v18 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v24, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v15, "rqf:_handleGetTracksResponse:merge", ", buf, 2u);
    }

    objc_initWeak(&location, self);
    v25 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v26 = v25;
    if (v18 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v26, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v15, "rqf:_handleGetTracksResponse:personalize", ", buf, 2u);
    }

    v27 = -[MPCModelRadioPersonalizationRequest initWithRadioStationTracks:]([MPCModelRadioPersonalizationRequest alloc], "initWithRadioStationTracks:", v20);
    -[MPCModelRadioPersonalizationRequest setAnalyticsSignpostsEnabled:](v27, "setAnalyticsSignpostsEnabled:", 1);
    -[MPCModelRadioPersonalizationRequest itemKind](v27, "itemKind");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_msgSend(v28, "modelClass"), "mqf_requiredItemPlaybackProperties");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelRadioPersonalizationRequest setItemProperties:](v27, "setItemProperties:", v29);

    v30 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = objc_msgSend(v20, "totalItemCount");
      *(_DWORD *)buf = 134218498;
      v39 = self;
      v40 = 2048;
      v41 = v31;
      v42 = 2114;
      v43 = v27;
      _os_log_impl(&dword_210BD8000, v30, OS_LOG_TYPE_DEFAULT, "[RQF:%p] _handleGetTracksResponse: | starting personalization [] request.trackCount=%ld request=%{public}@", buf, 0x20u);
    }

    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __91__MPCModelRadioQueueFeeder__handleGetTracksResponse_getTracksError_fromRequest_completion___block_invoke_97;
    v32[3] = &unk_24CABA350;
    v32[4] = self;
    v32[5] = v27;
    objc_copyWeak(v35, &location);
    v33 = v12;
    v34 = v13;
    v35[1] = v15;
    -[MPCModelRadioPersonalizationRequest performWithResponseHandler:](v27, "performWithResponseHandler:", v32);

    objc_destroyWeak(v35);
    objc_destroyWeak(&location);
  }
  else
  {
    -[MPCModelRadioQueueFeeder _errorForRequest:withError:](self, "_errorForRequest:withError:", v12, v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v39 = self;
      v40 = 2114;
      v41 = (uint64_t)v20;
      _os_log_impl(&dword_210BD8000, v21, OS_LOG_TYPE_ERROR, "[RQF:%p] _handleGetTracksResponse: | failed [no track response] error=%{public}@", buf, 0x16u);
    }

    if (v13)
      (*((void (**)(id, void *))v13 + 2))(v13, v20);
  }

  -[MPCModelRadioQueueFeeder _endBackgroundTaskAssertion](self, "_endBackgroundTaskAssertion");
}

- (void)_handlePersonalizationResponse:(id)a3 personalizationError:(id)a4 fromRequest:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  MPCModelRadioQueueFeeder *v27;
  MPCModelRadioPlaybackContext *v28;
  void *v29;
  void *v30;
  MPCModelRadioPlaybackContext *playbackContext;
  NSObject *v32;
  MPMutableIdentifierListSection *section;
  MPCModelRadioQueueFeeder *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  int64_t v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  char v43;
  void *v44;
  char v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  NSObject *v56;
  NSObject *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  id v62;
  MPCModelRadioQueueFeeder *v63;
  NSObject *v64;
  NSObject *v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  uint64_t v69;
  MPCModelRadioQueueFeeder *v70;
  MPMutableIdentifierListSection *v71;
  NSObject *v72;
  NSObject *v73;
  NSObject *v74;
  NSObject *v75;
  void *v76;
  uint64_t v77;
  id v78;
  void *v79;
  id v80;
  os_signpost_id_t spid;
  _QWORD v82[5];
  _QWORD v83[4];
  MPCModelRadioQueueFeeder *v84;
  id v85;
  _QWORD v86[4];
  id v87;
  id v88;
  _QWORD v89[4];
  MPCModelRadioQueueFeeder *v90;
  id v91;
  MPCModelRadioQueueFeeder *v92;
  id v93;
  _QWORD v94[5];
  uint8_t buf[4];
  MPCModelRadioQueueFeeder *v96;
  __int16 v97;
  MPCModelRadioQueueFeeder *v98;
  __int16 v99;
  int64_t v100;
  uint64_t v101;

  v101 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v80 = a6;
  v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v14 = os_signpost_id_make_with_pointer(v13, v10);

  v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v16 = v15;
  spid = v14;
  v17 = v14 - 1;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "rqf:_handlePersonalizationResponse", ", buf, 2u);
  }

  if (v10)
  {
    v78 = v11;
    v79 = v12;
    if (!self->_queueGeneration)
    {
      -[MPCModelRadioPlaybackContext radioStation](self->_playbackContext, "radioStation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "identifiers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "radio");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stationStringID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "length");

      if (!v22)
      {
        objc_msgSend(v10, "radioStationTracks");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "firstSection");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "identifiers");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "radio");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stationStringID");
        v27 = (MPCModelRadioQueueFeeder *)objc_claimAutoreleasedReturnValue();

        if (-[MPCModelRadioQueueFeeder length](v27, "length"))
        {
          v28 = (MPCModelRadioPlaybackContext *)-[MPCModelRadioPlaybackContext copy](self->_playbackContext, "copy");
          objc_msgSend(v10, "radioStationTracks");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "firstSection");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPCModelRadioPlaybackContext setRadioStation:](v28, "setRadioStation:", v30);

          playbackContext = self->_playbackContext;
          self->_playbackContext = v28;

          v32 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            v96 = self;
            v97 = 2114;
            v98 = v27;
            _os_log_impl(&dword_210BD8000, v32, OS_LOG_TYPE_DEFAULT, "[RQF:%p] _handlePersonalizationResponse: | updating section [gained stationID] newStationID=%{public}@", buf, 0x16u);
          }

          section = self->_section;
          if (!section)
          {
            self->_needsSectionUpdate = 1;
            section = self->_section;
          }
          -[MPMutableIdentifierListSection updateSection](section, "updateSection");
        }
        else
        {

        }
      }
    }
    v39 = -[MPCModelRadioPlaybackQueue numberOfItems](self->_playbackQueue, "numberOfItems");
    objc_msgSend(v10, "results");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "totalItemCount");

    if (v39 == v41)
    {
      v42 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218496;
        v96 = self;
        v97 = 2048;
        v98 = (MPCModelRadioQueueFeeder *)v39;
        v99 = 2048;
        v100 = v39;
        _os_log_impl(&dword_210BD8000, v42, OS_LOG_TYPE_ERROR, "[RQF:%p] _handlePersonalizationResponse: | setting _hasReachedTracklistEnd=YES [no new items] previousCount=%ld finalCount=%ld", buf, 0x20u);
      }

      self->_hasReachedTracklistEnd = 1;
    }
    if (self->_mayHaveRestrictedContent)
      v43 = 1;
    else
      v43 = objc_msgSend(v79, "allowsExplicitContent");
    self->_mayHaveRestrictedContent = v43;
    ++self->_queueGeneration;
    -[MPCModelRadioPlaybackQueue updateWithPersonalizedResponse:](self->_playbackQueue, "updateWithPersonalizedResponse:", v10);
    -[MPCModelRadioQueueFeeder _observePersonalizationResponse:](self, "_observePersonalizationResponse:", v10);
    if (self->_mayHaveRestrictedContent)
    {
      objc_msgSend(MEMORY[0x24BDDCB98], "sharedRestrictionsMonitor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "allowsExplicitContent");

      if ((v45 & 1) == 0)
      {
        self->_mayHaveRestrictedContent = 0;
        -[MPCModelRadioPlaybackQueue removeExplicitItems](self->_playbackQueue, "removeExplicitItems");
      }
    }
    v46 = MEMORY[0x24BDAC760];
    if (self->_lastPlayedIdentifier)
    {
      v94[0] = MEMORY[0x24BDAC760];
      v94[1] = 3221225472;
      v94[2] = __103__MPCModelRadioQueueFeeder__handlePersonalizationResponse_personalizationError_fromRequest_completion___block_invoke;
      v94[3] = &unk_24CABA0B0;
      v94[4] = self;
      -[MPCModelRadioQueueFeeder identifierRegistryWithExclusiveAccessReturningInteger:](self, "identifierRegistryWithExclusiveAccessReturningInteger:", v94);
    }
    -[MPCModelRadioQueueFeeder _beginObservingIdentityStoreForSignOut](self, "_beginObservingIdentityStoreForSignOut");
    -[MPMutableIdentifierListSection itemIdentifiers](self->_section, "itemIdentifiers");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "copy");
    v49 = (void *)v48;
    v50 = (void *)MEMORY[0x24BDBD1A8];
    if (v48)
      v50 = (void *)v48;
    v51 = v50;

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v51, "count"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[MPCModelRadioQueueFeeder itemCount](self, "itemCount"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v89[0] = v46;
    v89[1] = 3221225472;
    v89[2] = __103__MPCModelRadioQueueFeeder__handlePersonalizationResponse_personalizationError_fromRequest_completion___block_invoke_2;
    v89[3] = &unk_24CABA3A0;
    v34 = (MPCModelRadioQueueFeeder *)v51;
    v90 = v34;
    v54 = v52;
    v91 = v54;
    v92 = self;
    v55 = v53;
    v93 = v55;
    -[MPCModelRadioQueueFeeder identifierRegistryWithExclusiveAccess:](self, "identifierRegistryWithExclusiveAccess:", v89);
    v56 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v57 = v56;
    if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v56))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v57, OS_SIGNPOST_INTERVAL_BEGIN, v14, "rqf:_handlePersonalizationResponse:diff", ", buf, 2u);
    }

    v58 = (void *)MEMORY[0x24BDDC700];
    v59 = objc_msgSend(v54, "count");
    v60 = objc_msgSend(v55, "count");
    v86[0] = MEMORY[0x24BDAC760];
    v86[1] = 3221225472;
    v86[2] = __103__MPCModelRadioQueueFeeder__handlePersonalizationResponse_personalizationError_fromRequest_completion___block_invoke_105;
    v86[3] = &unk_24CABA1F8;
    v61 = v54;
    v87 = v61;
    v62 = v55;
    v88 = v62;
    objc_msgSend(v58, "changeDetailsWithPreviousCount:finalCount:isEqualBlock:isUpdatedBlock:", v59, v60, v86, &__block_literal_global_107_28423);
    v63 = (MPCModelRadioQueueFeeder *)objc_claimAutoreleasedReturnValue();
    v64 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v65 = v64;
    if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v64))
    {
      *(_DWORD *)buf = 138543362;
      v96 = v63;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v65, OS_SIGNPOST_INTERVAL_END, spid, "rqf:_handlePersonalizationResponse:diff", "changes=%{public}@", buf, 0xCu);
    }

    v37 = v80;
    if (v63)
    {
      v66 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v96 = self;
        v97 = 2114;
        v98 = v63;
        _os_log_impl(&dword_210BD8000, v66, OS_LOG_TYPE_DEFAULT, "[RQF:%p] _handlePersonalizationResponse: | applying diff [] changes=%{public}@", buf, 0x16u);
      }

      v67 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v68 = v67;
      if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v67))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_210BD8000, v68, OS_SIGNPOST_INTERVAL_BEGIN, spid, "rqf:_handlePersonalizationResponse:apply", ", buf, 2u);
      }

      v69 = MEMORY[0x24BDAC760];
      v83[0] = MEMORY[0x24BDAC760];
      v83[1] = 3221225472;
      v83[2] = __103__MPCModelRadioQueueFeeder__handlePersonalizationResponse_personalizationError_fromRequest_completion___block_invoke_108;
      v83[3] = &unk_24CABA410;
      v70 = v63;
      v84 = v70;
      v85 = v62;
      -[MPCModelRadioQueueFeeder identifierRegistryWithExclusiveAccess:](self, "identifierRegistryWithExclusiveAccess:", v83);
      v71 = self->_section;
      v82[0] = v69;
      v82[1] = 3221225472;
      v82[2] = __103__MPCModelRadioQueueFeeder__handlePersonalizationResponse_personalizationError_fromRequest_completion___block_invoke_3_111;
      v82[3] = &unk_24CABA2A8;
      v82[4] = self;
      -[MPMutableIdentifierListSection applyChanges:itemLookupBlock:](v71, "applyChanges:itemLookupBlock:", v70, v82);
      v72 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v73 = v72;
      if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v72))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_210BD8000, v73, OS_SIGNPOST_INTERVAL_END, spid, "rqf:_handlePersonalizationResponse:apply", ", buf, 2u);
      }

    }
    if (v80)
      (*((void (**)(id, _QWORD))v80 + 2))(v80, 0);
    v74 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v75 = v74;
    v11 = v78;
    if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v74))
    {
      objc_msgSend(v10, "results");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = objc_msgSend(v76, "totalItemCount");
      *(_DWORD *)buf = 134217984;
      v96 = (MPCModelRadioQueueFeeder *)v77;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v75, OS_SIGNPOST_INTERVAL_END, spid, "rqf:_handlePersonalizationResponse", "numberOfItems=%lld", buf, 0xCu);

    }
    v12 = v79;
  }
  else
  {
    -[MPCModelRadioQueueFeeder _errorForRequest:withError:](self, "_errorForRequest:withError:", v12, v11);
    v34 = (MPCModelRadioQueueFeeder *)objc_claimAutoreleasedReturnValue();
    v35 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v36 = v35;
    if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
    {
      *(_DWORD *)buf = 138543362;
      v96 = v34;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v36, OS_SIGNPOST_INTERVAL_END, v14, "rqf:_handlePersonalizationResponse", "error=%{public}@", buf, 0xCu);
    }

    if (self->_queueGeneration)
    {
      v37 = v80;
    }
    else
    {
      v38 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v37 = v80;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        v96 = self;
        v97 = 2114;
        v98 = v34;
        _os_log_impl(&dword_210BD8000, v38, OS_LOG_TYPE_ERROR, "[RQF:%p] _handlePersonalizationResponse: | failing [queueGeneration = 0] error=%{public}@", buf, 0x16u);
      }

      (*((void (**)(id, MPCModelRadioQueueFeeder *))v80 + 2))(v80, v34);
    }
  }

}

- (BOOL)_isTransientLoadingError:(id)a3
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  BOOL v8;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BEC8580]);

  if (v5)
  {
    v6 = objc_msgSend(v3, "code");
    v8 = v6 == -7100 || v6 == -7103;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_loadTracksWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSString *v8;
  NSString *siriAssetInfo;
  MPCModelRadioGetTracksOperation *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id location;
  uint8_t buf[4];
  MPCModelRadioQueueFeeder *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[MPCModelRadioQueueFeeder _beginBackgroundTaskAssertion](self, "_beginBackgroundTaskAssertion");
  v8 = self->_siriAssetInfo;
  siriAssetInfo = self->_siriAssetInfo;
  self->_siriAssetInfo = 0;

  objc_initWeak(&location, self);
  v10 = -[MPCModelRadioGetTracksOperation initWithGetTracksRequest:siriAssetInfo:radioQueueFeeder:]([MPCModelRadioGetTracksOperation alloc], "initWithGetTracksRequest:siriAssetInfo:radioQueueFeeder:", v6, v8, self);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __62__MPCModelRadioQueueFeeder__loadTracksWithRequest_completion___block_invoke;
  v17[3] = &unk_24CABA488;
  v17[4] = self;
  v11 = v6;
  v18 = v11;
  objc_copyWeak(&v20, &location);
  v12 = v7;
  v19 = v12;
  -[MPCModelRadioGetTracksOperation setCompletionHandler:](v10, "setCompletionHandler:", v17);
  v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)objc_opt_class(), "sharedQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "operationCount");
    *(_DWORD *)buf = 134218498;
    v23 = self;
    v24 = 2114;
    v25 = v11;
    v26 = 2048;
    v27 = v15;
    _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_DEFAULT, "[RQF:%p] _loadTracksWithRequest:… | starting [] request=%{public}@ sharedQueue.operationCount=%ld", buf, 0x20u);

  }
  objc_msgSend((id)objc_opt_class(), "sharedQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addOperation:", v10);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

- (void)_observePersonalizationResponse:(id)a3
{
  MPCModelRadioPersonalizationResponse *v5;
  id *p_lastResponse;
  void *v7;
  void *v8;
  _QWORD *v9;
  NSObject *v10;
  int v11;
  MPCModelRadioQueueFeeder *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = (MPCModelRadioPersonalizationResponse *)a3;
  p_lastResponse = (id *)&self->_lastResponse;
  if (self->_lastResponse != v5)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = (_QWORD *)MEMORY[0x24BDDC3F8];
    if (*p_lastResponse)
      objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x24BDDC3F8]);
    objc_storeStrong((id *)&self->_lastResponse, a3);
    if (*p_lastResponse)
    {
      objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__responseDidInvalidateNotification_, *v9);
      if ((objc_msgSend(*p_lastResponse, "isValid") & 1) == 0)
      {
        v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v11 = 134217984;
          v12 = self;
          _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_INFO, "[RQF:%p] personalization response invalidated", (uint8_t *)&v11, 0xCu);
        }

        -[MPCModelRadioQueueFeeder _responseDidInvalidate](self, "_responseDidInvalidate");
      }
    }

  }
}

- (void)_removeAllTracks
{
  void *v3;
  void *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  unint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  _QWORD block[5];
  id v17;
  os_signpost_id_t v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[MPMutableIdentifierListSection itemIdentifiers](self->_section, "itemIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v6 = os_signpost_id_make_with_pointer(v5, self->_playbackQueue);

  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v8 = v7;
  v9 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "rqf:_removeAllTracks:diff", ", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDDC700], "changeDetailsWithPreviousCount:finalCount:isEqualBlock:isUpdatedBlock:", objc_msgSend(v4, "count"), 0, &__block_literal_global_118, &__block_literal_global_119);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v12 = v11;
  if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v10;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v12, OS_SIGNPOST_INTERVAL_END, v6, "rqf:_removeAllTracks:diff", "changes=%{public}@", buf, 0xCu);
  }

  if (v10)
  {
    v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v14 = v13;
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v6, "rqf:_removeAllTracks:apply", ", buf, 2u);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __44__MPCModelRadioQueueFeeder__removeAllTracks__block_invoke_120;
    block[3] = &unk_24CABA558;
    block[4] = self;
    v18 = v6;
    v17 = v10;
    v15 = (void *)MEMORY[0x24BDAC9B8];
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

- (void)_removeRestrictedTracks
{
  void *v3;
  void *v4;
  int64_t v5;
  int64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  MPCModelRadioQueueFeeder *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  MPCModelRadioQueueFeeder *v27;
  MPMutableIdentifierListSection *section;
  NSObject *v29;
  NSObject *v30;
  _QWORD v31[5];
  _QWORD v32[4];
  MPCModelRadioQueueFeeder *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[5];
  id v39;
  uint8_t buf[4];
  MPCModelRadioQueueFeeder *v41;
  __int16 v42;
  int64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[MPMutableIdentifierListSection itemIdentifiers](self->_section, "itemIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = -[MPCModelRadioPlaybackQueue removeExplicitItems](self->_playbackQueue, "removeExplicitItems");
  if (v5)
  {
    v6 = v5;
    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v41 = self;
      v42 = 2048;
      v43 = v6;
      _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_ERROR, "[RQF:%p] _removeRestrictedTracks | removedItems.count=%ld", buf, 0x16u);
    }

    objc_storeStrong((id *)&self->_lastPlayedIdentifier, self->_lastCleanPlayedIdentifier);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[MPCModelRadioQueueFeeder itemCount](self, "itemCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __51__MPCModelRadioQueueFeeder__removeRestrictedTracks__block_invoke;
    v38[3] = &unk_24CABA410;
    v38[4] = self;
    v10 = v8;
    v39 = v10;
    -[MPCModelRadioQueueFeeder identifierRegistryWithExclusiveAccess:](self, "identifierRegistryWithExclusiveAccess:", v38);
    v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v12 = os_signpost_id_make_with_pointer(v11, self->_playbackQueue);

    v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v14 = v13;
    v15 = v12 - 1;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "rqf:_removeRestrictedTracks:diff", ", buf, 2u);
    }

    v16 = (void *)MEMORY[0x24BDDC700];
    v17 = objc_msgSend(v4, "count");
    v18 = objc_msgSend(v10, "count");
    v35[0] = v9;
    v35[1] = 3221225472;
    v35[2] = __51__MPCModelRadioQueueFeeder__removeRestrictedTracks__block_invoke_125;
    v35[3] = &unk_24CABA1F8;
    v36 = v4;
    v19 = v10;
    v37 = v19;
    objc_msgSend(v16, "changeDetailsWithPreviousCount:finalCount:isEqualBlock:isUpdatedBlock:", v17, v18, v35, &__block_literal_global_127_28383);
    v20 = (MPCModelRadioQueueFeeder *)objc_claimAutoreleasedReturnValue();
    v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v22 = v21;
    if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_DWORD *)buf = 138543362;
      v41 = v20;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v22, OS_SIGNPOST_INTERVAL_END, v12, "rqf:_removeRestrictedTracks:diff", "changes=%{public}@", buf, 0xCu);
    }

    if (v20)
    {
      v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v24 = v23;
      if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_210BD8000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v12, "rqf:_removeRestrictedTracks:apply", ", buf, 2u);
      }

      v25 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v26 = v25;
      if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_210BD8000, v26, OS_SIGNPOST_EVENT, v12, "rqf:_removeRestrictedTracks:apply", "applying", buf, 2u);
      }

      v32[0] = v9;
      v32[1] = 3221225472;
      v32[2] = __51__MPCModelRadioQueueFeeder__removeRestrictedTracks__block_invoke_128;
      v32[3] = &unk_24CABA410;
      v27 = v20;
      v33 = v27;
      v34 = v19;
      -[MPCModelRadioQueueFeeder identifierRegistryWithExclusiveAccess:](self, "identifierRegistryWithExclusiveAccess:", v32);
      section = self->_section;
      v31[0] = v9;
      v31[1] = 3221225472;
      v31[2] = __51__MPCModelRadioQueueFeeder__removeRestrictedTracks__block_invoke_3;
      v31[3] = &unk_24CABA2A8;
      v31[4] = self;
      -[MPMutableIdentifierListSection applyChanges:itemLookupBlock:](section, "applyChanges:itemLookupBlock:", v27, v31);
      v29 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v30 = v29;
      if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_210BD8000, v30, OS_SIGNPOST_INTERVAL_END, v12, "rqf:_removeRestrictedTracks:apply", ", buf, 2u);
      }

    }
  }

}

- (void)_responseDidInvalidate
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__MPCModelRadioQueueFeeder__responseDidInvalidate__block_invoke;
  block[3] = &unk_24CABA2D0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (void)_repersonalizeCurrentTracks
{
  void *v3;
  void *queueGeneration;
  MPCModelRadioPersonalizationRequest *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9[2];
  id location;

  -[MPCModelRadioPlaybackQueue tracks](self->_playbackQueue, "tracks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "totalItemCount") >= 1)
  {
    queueGeneration = (void *)self->_queueGeneration;
    objc_initWeak(&location, self);
    v5 = -[MPCModelRadioPersonalizationRequest initWithRadioStationTracks:]([MPCModelRadioPersonalizationRequest alloc], "initWithRadioStationTracks:", v3);
    -[MPCModelRadioPersonalizationRequest itemKind](v5, "itemKind");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_msgSend(v6, "modelClass"), "mqf_requiredItemPlaybackProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelRadioPersonalizationRequest setItemProperties:](v5, "setItemProperties:", v7);

    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __55__MPCModelRadioQueueFeeder__repersonalizeCurrentTracks__block_invoke;
    v8[3] = &unk_24CABA5C8;
    objc_copyWeak(v9, &location);
    v9[1] = queueGeneration;
    -[MPCModelRadioPersonalizationRequest performWithResponseHandler:](v5, "performWithResponseHandler:", v8);
    objc_destroyWeak(v9);

    objc_destroyWeak(&location);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeRequestContext, 0);
  objc_storeStrong((id *)&self->_observedIdentityStore, 0);
  objc_storeStrong((id *)&self->_siriAssetInfo, 0);
  objc_storeStrong((id *)&self->_playbackRequestEnvironment, 0);
  objc_storeStrong((id *)&self->_lastResponse, 0);
  objc_storeStrong((id *)&self->_lastPlayedIdentifier, 0);
  objc_storeStrong((id *)&self->_lastCleanPlayedIdentifier, 0);
  objc_storeStrong((id *)&self->_currentItem, 0);
  objc_storeStrong((id *)&self->_playbackContext, 0);
  objc_storeStrong((id *)&self->_playbackQueue, 0);
  objc_storeStrong((id *)&self->_section, 0);
}

void __55__MPCModelRadioQueueFeeder__repersonalizeCurrentTracks__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8[2];

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__MPCModelRadioQueueFeeder__repersonalizeCurrentTracks__block_invoke_2;
  block[3] = &unk_24CABA5A0;
  objc_copyWeak(v8, (id *)(a1 + 32));
  v4 = *(void **)(a1 + 40);
  v7 = v3;
  v8[1] = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(v8);
}

void __55__MPCModelRadioQueueFeeder__repersonalizeCurrentTracks__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  BOOL v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (*(_QWORD *)(a1 + 32))
    v3 = WeakRetained == 0;
  else
    v3 = 1;
  if (!v3 && WeakRetained[22] == *(id *)(a1 + 48))
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained[10], "updateWithPersonalizedResponse:");
    objc_msgSend(v4, "_observePersonalizationResponse:", *(_QWORD *)(a1 + 32));
    WeakRetained = v4;
  }

}

uint64_t __50__MPCModelRadioQueueFeeder__responseDidInvalidate__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  char v4;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[160])
  {
    objc_msgSend(MEMORY[0x24BDDCB98], "sharedRestrictionsMonitor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "allowsExplicitContent");

    v2 = *(_BYTE **)(a1 + 32);
    if ((v4 & 1) == 0)
    {
      v2[160] = 0;
      objc_msgSend(*(id *)(a1 + 32), "_removeRestrictedTracks");
      v2 = *(_BYTE **)(a1 + 32);
    }
  }
  return objc_msgSend(v2, "_repersonalizeCurrentTracks");
}

void __51__MPCModelRadioQueueFeeder__removeRestrictedTracks__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "trackModels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__MPCModelRadioQueueFeeder__removeRestrictedTracks__block_invoke_2;
  v6[3] = &unk_24CABA378;
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v4, "enumerateItemIdentifiersUsingBlock:", v6);

}

uint64_t __51__MPCModelRadioQueueFeeder__removeRestrictedTracks__block_invoke_125(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "first");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v5, "isEqual:", v7);
  return v8;
}

void __51__MPCModelRadioQueueFeeder__removeRestrictedTracks__block_invoke_128(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__MPCModelRadioQueueFeeder__removeRestrictedTracks__block_invoke_2_129;
  v4[3] = &unk_24CABA3E8;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "applyChanges:identifierSetLookupBlock:", v3, v4);

}

id __51__MPCModelRadioQueueFeeder__removeRestrictedTracks__block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__MPCModelRadioQueueFeeder__removeRestrictedTracks__block_invoke_4;
  v4[3] = &__block_descriptor_40_e41__16__0__MPQueueFeederIdentifierRegistry_8l;
  v4[4] = a2;
  objc_msgSend(v2, "identifierRegistryWithExclusiveAccessReturningObject:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __51__MPCModelRadioQueueFeeder__removeRestrictedTracks__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "itemAtIndex:", *(_QWORD *)(a1 + 32));
}

id __51__MPCModelRadioQueueFeeder__removeRestrictedTracks__block_invoke_2_129(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "second");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __51__MPCModelRadioQueueFeeder__removeRestrictedTracks__block_invoke_2_126()
{
  return 0;
}

void __51__MPCModelRadioQueueFeeder__removeRestrictedTracks__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(*(id *)(a1 + 32), "itemForIdentifierSet:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  v6 = (void *)MEMORY[0x24BE65C80];
  v7 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "pairWithFirst:second:", v7, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v8);

  if (!v4)
}

void __44__MPCModelRadioQueueFeeder__removeAllTracks__block_invoke_120(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;
  uint8_t buf[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeAllItems");
  v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v3, OS_SIGNPOST_EVENT, v4, "rqf:_removeAllTracks:apply", "applying", buf, 2u);
  }

  v5 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __44__MPCModelRadioQueueFeeder__removeAllTracks__block_invoke_121;
  v14[3] = &unk_24CABA530;
  v6 = *(void **)(a1 + 32);
  v15 = *(id *)(a1 + 40);
  objc_msgSend(v6, "identifierRegistryWithExclusiveAccess:", v14);
  v8 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(v8 + 72);
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __44__MPCModelRadioQueueFeeder__removeAllTracks__block_invoke_3;
  v13[3] = &unk_24CABA2A8;
  v13[4] = v8;
  objc_msgSend(v9, "applyChanges:itemLookupBlock:", v7, v13);
  v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 48);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v11, OS_SIGNPOST_INTERVAL_END, v12, "rqf:_removeAllTracks:apply", ", buf, 2u);
  }

}

uint64_t __44__MPCModelRadioQueueFeeder__removeAllTracks__block_invoke_121(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "applyChanges:identifierSetLookupBlock:", *(_QWORD *)(a1 + 32), &__block_literal_global_123);
}

id __44__MPCModelRadioQueueFeeder__removeAllTracks__block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__MPCModelRadioQueueFeeder__removeAllTracks__block_invoke_4;
  v4[3] = &__block_descriptor_40_e41__16__0__MPQueueFeederIdentifierRegistry_8l;
  v4[4] = a2;
  objc_msgSend(v2, "identifierRegistryWithExclusiveAccessReturningObject:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __44__MPCModelRadioQueueFeeder__removeAllTracks__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "itemAtIndex:", *(_QWORD *)(a1 + 32));
}

uint64_t __44__MPCModelRadioQueueFeeder__removeAllTracks__block_invoke_2_122()
{
  return objc_msgSend(MEMORY[0x24BDDC758], "emptyIdentifierSet");
}

uint64_t __44__MPCModelRadioQueueFeeder__removeAllTracks__block_invoke_2()
{
  return 0;
}

uint64_t __44__MPCModelRadioQueueFeeder__removeAllTracks__block_invoke()
{
  return 1;
}

void __62__MPCModelRadioQueueFeeder__loadTracksWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__MPCModelRadioQueueFeeder__loadTracksWithRequest_completion___block_invoke_2;
  block[3] = &unk_24CABA460;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  v16 = v9;
  v17 = v10;
  v18 = v11;
  v19 = v7;
  v20 = v8;
  v12 = v8;
  v13 = v7;
  v14 = v9;
  objc_copyWeak(&v22, (id *)(a1 + 56));
  v21 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v22);
}

void __62__MPCModelRadioQueueFeeder__loadTracksWithRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id WeakRetained;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(_QWORD *)(a1 + 48);
      v7 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 64), "urlMetrics");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "humanDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "msv_description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v26 = v5;
      v27 = 2114;
      v28 = v6;
      v29 = 2114;
      v30 = v7;
      v31 = 2114;
      v32 = v10;
      v33 = 2114;
      v34 = v11;
      _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_ERROR, "[RQF:%p] _loadTracksWithRequest:… | finished [] request=%{public}@ response=%{public}@ metrics='%{public}@' error=%{public}@", buf, 0x34u);

    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 48);
    v14 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 64), "urlMetrics");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "humanDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v26 = v12;
    v27 = 2114;
    v28 = v13;
    v29 = 2114;
    v30 = v14;
    v31 = 2114;
    v32 = v17;
    _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "[RQF:%p] _loadTracksWithRequest:… | finished [] request=%{public}@ response=%{public}@ metrics='%{public}@'", buf, 0x2Au);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v19 = *(_QWORD *)(a1 + 32);
  v21 = *(_QWORD *)(a1 + 48);
  v20 = *(_QWORD *)(a1 + 56);
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __62__MPCModelRadioQueueFeeder__loadTracksWithRequest_completion___block_invoke_113;
  v22[3] = &unk_24CABA438;
  v24 = *(id *)(a1 + 72);
  v23 = *(id *)(a1 + 64);
  objc_msgSend(WeakRetained, "_handleGetTracksResponse:getTracksError:fromRequest:completion:", v20, v19, v21, v22);

}

uint64_t __62__MPCModelRadioQueueFeeder__loadTracksWithRequest_completion___block_invoke_113(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

uint64_t __103__MPCModelRadioQueueFeeder__handlePersonalizationResponse_personalizationError_fromRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "indexForItem:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144));
}

void __103__MPCModelRadioQueueFeeder__handlePersonalizationResponse_personalizationError_fromRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[2];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v3, "identifierSetForItem:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *(void **)(a1 + 40);
        v22[0] = v9;
        v22[1] = v10;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v12);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 80), "trackModels");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __103__MPCModelRadioQueueFeeder__handlePersonalizationResponse_personalizationError_fromRequest_completion___block_invoke_3;
  v15[3] = &unk_24CABA378;
  v16 = v3;
  v17 = *(id *)(a1 + 56);
  v14 = v3;
  objc_msgSend(v13, "enumerateItemIdentifiersUsingBlock:", v15);

}

uint64_t __103__MPCModelRadioQueueFeeder__handlePersonalizationResponse_personalizationError_fromRequest_completion___block_invoke_105(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v6, "isEqual:", v8);
  return v9;
}

void __103__MPCModelRadioQueueFeeder__handlePersonalizationResponse_personalizationError_fromRequest_completion___block_invoke_108(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __103__MPCModelRadioQueueFeeder__handlePersonalizationResponse_personalizationError_fromRequest_completion___block_invoke_2_109;
  v4[3] = &unk_24CABA3E8;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "applyChanges:identifierSetLookupBlock:", v3, v4);

}

id __103__MPCModelRadioQueueFeeder__handlePersonalizationResponse_personalizationError_fromRequest_completion___block_invoke_3_111(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __103__MPCModelRadioQueueFeeder__handlePersonalizationResponse_personalizationError_fromRequest_completion___block_invoke_4;
  v4[3] = &__block_descriptor_40_e41__16__0__MPQueueFeederIdentifierRegistry_8l;
  v4[4] = a2;
  objc_msgSend(v2, "identifierRegistryWithExclusiveAccessReturningObject:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __103__MPCModelRadioQueueFeeder__handlePersonalizationResponse_personalizationError_fromRequest_completion___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "itemAtIndex:", *(_QWORD *)(a1 + 32));
}

id __103__MPCModelRadioQueueFeeder__handlePersonalizationResponse_personalizationError_fromRequest_completion___block_invoke_2_109(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __103__MPCModelRadioQueueFeeder__handlePersonalizationResponse_personalizationError_fromRequest_completion___block_invoke_2_106()
{
  return 0;
}

void __103__MPCModelRadioQueueFeeder__handlePersonalizationResponse_personalizationError_fromRequest_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "itemForIdentifierSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 40);
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[0] = v7;
  v9[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v8);

  if (!v5)
}

uint64_t __91__MPCModelRadioQueueFeeder__handleGetTracksResponse_getTracksError_fromRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  v3 = a2;
  objc_msgSend(v2, "queueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "indexForItem:", v4);

  return v5;
}

void __91__MPCModelRadioQueueFeeder__handleGetTracksResponse_getTracksError_fromRequest_completion___block_invoke_97(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  __int128 v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17[2];

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __91__MPCModelRadioQueueFeeder__handleGetTracksResponse_getTracksError_fromRequest_completion___block_invoke_2;
  v11[3] = &unk_24CABA328;
  v12 = *(_OWORD *)(a1 + 32);
  v13 = v5;
  v7 = v5;
  objc_copyWeak(v17, (id *)(a1 + 64));
  v14 = v6;
  v15 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v9 = *(void **)(a1 + 72);
  v16 = v8;
  v17[1] = v9;
  v10 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v11);

  objc_destroyWeak(v17);
}

void __91__MPCModelRadioQueueFeeder__handleGetTracksResponse_getTracksError_fromRequest_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  uint32_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v16 = 134218498;
    v17 = v3;
    v18 = 2114;
    v19 = v4;
    v20 = 2114;
    v21 = v5;
    _os_log_impl(&dword_210BD8000, v2, OS_LOG_TYPE_DEFAULT, "[RQF:%p] _handleGetTracksResponse: | finished personalization [] request=%{public}@ response=%{public}@", (uint8_t *)&v16, 0x20u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  objc_msgSend(WeakRetained, "_handlePersonalizationResponse:personalizationError:fromRequest:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  v7 = *(_QWORD *)(a1 + 56);
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 88);
  if (v7)
  {
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      v11 = *(_QWORD *)(a1 + 56);
      v16 = 138543362;
      v17 = v11;
      v12 = " error=%{public}@";
      v13 = v9;
      v14 = v10;
      v15 = 12;
LABEL_10:
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v13, OS_SIGNPOST_INTERVAL_END, v14, "rqf:_handleGetTracksResponse:personalize", v12, (uint8_t *)&v16, v15);
    }
  }
  else if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v16) = 0;
    v12 = "";
    v13 = v9;
    v14 = v10;
    v15 = 2;
    goto LABEL_10;
  }

}

void __55__MPCModelRadioQueueFeeder__endBackgroundTaskAssertion__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  _QWORD *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[14] - 1;
    WeakRetained[14] = v3;
    if (!v3)
    {
      v4 = *MEMORY[0x24BE65AB8];
      if (WeakRetained[13] != *MEMORY[0x24BE65AB8])
      {
        v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          v6 = v2[13];
          v8 = 134218240;
          v9 = v2;
          v10 = 2048;
          v11 = v6;
          _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_INFO, "[RQF:%p] _beginBackgroundTaskAssertion | ended task [] backgroundTaskIdentifier=%lu", (uint8_t *)&v8, 0x16u);
        }

        MPSharedBackgroundTaskProvider();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "endTask:", v2[13]);

        v2[13] = v4;
      }
    }
  }

}

void __59__MPCModelRadioQueueFeeder__detectSignOutForIdentityStore___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v1 + 192) && !*(_BYTE *)(v1 + 208))
  {
    *(_BYTE *)(v1 + 128) = 1;
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 208) = 1;
    objc_msgSend(*(id *)(a1 + 40), "_removeAllTracks");
    v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = 134217984;
      v6 = v4;
      _os_log_impl(&dword_210BD8000, v3, OS_LOG_TYPE_ERROR, "[RQF:%p] _detectSignOutForIdentityStore: | clearing tracklist [nil active account]", (uint8_t *)&v5, 0xCu);
    }

  }
}

void __57__MPCModelRadioQueueFeeder__beginBackgroundTaskAssertion__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  MPSharedBackgroundTaskProvider();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endTask:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));

  v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(v4 + 104);
    v6 = 134218240;
    v7 = v4;
    v8 = 2048;
    v9 = v5;
    _os_log_impl(&dword_210BD8000, v3, OS_LOG_TYPE_ERROR, "[RQF:%p] _beginBackgroundTaskAssertion | task expired [] backgroundTaskIdentifier=%lu", (uint8_t *)&v6, 0x16u);
  }

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) = *MEMORY[0x24BE65AB8];
}

uint64_t __67__MPCModelRadioQueueFeeder_environmentMonitorDidChangeNetworkType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAdditionalLoadingSupport");
}

void __63__MPCModelRadioQueueFeeder__responseDidInvalidateNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 152);

  if (v2 == v3)
    objc_msgSend(*(id *)(a1 + 40), "_responseDidInvalidate");
}

void __77__MPCModelRadioQueueFeeder__detectSignOutForIdentityStoreChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 192);

  if (v2 == v3)
    objc_msgSend(*(id *)(a1 + 40), "_detectSignOutForIdentityStore:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 192));
}

uint64_t __73__MPCModelRadioQueueFeeder__allowCellularStreamingDidChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAdditionalLoadingSupport");
}

id __53__MPCModelRadioQueueFeeder_reloadSection_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  v4 = (void *)MEMORY[0x24BDDC700];
  v5 = objc_msgSend(*(id *)(a1 + 32), "count");
  v6 = objc_msgSend(*(id *)(a1 + 40), "itemCount");
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __53__MPCModelRadioQueueFeeder_reloadSection_completion___block_invoke_2;
  v10[3] = &unk_24CABA1F8;
  v11 = *(id *)(a1 + 32);
  v12 = v3;
  v7 = v3;
  objc_msgSend(v4, "changeDetailsWithPreviousCount:finalCount:isEqualBlock:isUpdatedBlock:", v5, v6, v10, &__block_literal_global_66);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __53__MPCModelRadioQueueFeeder_reloadSection_completion___block_invoke_67(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53__MPCModelRadioQueueFeeder_reloadSection_completion___block_invoke_2_68;
  v4[3] = &__block_descriptor_40_e41__16__0__MPQueueFeederIdentifierRegistry_8l;
  v4[4] = a2;
  objc_msgSend(v2, "identifierRegistryWithExclusiveAccessReturningObject:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __53__MPCModelRadioQueueFeeder_reloadSection_completion___block_invoke_2_68(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "itemAtIndex:", *(_QWORD *)(a1 + 32));
}

uint64_t __53__MPCModelRadioQueueFeeder_reloadSection_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "itemAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  return v7;
}

uint64_t __53__MPCModelRadioQueueFeeder_reloadSection_completion___block_invoke_3()
{
  return 0;
}

void __78__MPCModelRadioQueueFeeder_placeholderItemForLoadingAdditionalItemsInSection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 40), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend(*(id *)(a1 + 40), "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setMainTitle:", v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("LOADING_AUDIO_LABEL"), &stru_24CABB5D0, CFSTR("MediaPlayer"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setMainTitle:", v4);

  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("RADIO_LABEL"), &stru_24CABB5D0, CFSTR("MediaPlayer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setArtist:", v6);

  if (objc_msgSend(*(id *)(a1 + 40), "hasLoadedValueForKey:", *MEMORY[0x24BDDBFF8]))
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __78__MPCModelRadioQueueFeeder_placeholderItemForLoadingAdditionalItemsInSection___block_invoke_2;
    v7[3] = &unk_24CABA1A8;
    v8 = *(id *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "setArtworkCatalogBlock:", v7);

  }
}

uint64_t __78__MPCModelRadioQueueFeeder_placeholderItemForLoadingAdditionalItemsInSection___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "artworkCatalog");
}

void __79__MPCModelRadioQueueFeeder_loadAdditionalItemsWithCount_forSection_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  int v16;
  id v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v6 = v5;
  v7 = a1[7];
  if (v4)
  {
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      v16 = 138543362;
      v17 = v4;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v6, OS_SIGNPOST_INTERVAL_END, v7, "rqf:loadAdditionalItems:loadTracks", " error=%{public}@", (uint8_t *)&v16, 0xCu);
    }

    v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = a1[8];
      v10 = (void *)a1[4];
      v11 = a1[5];
      objc_msgSend(v4, "msv_description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 134218754;
      v17 = v10;
      v18 = 2048;
      v19 = v9;
      v20 = 2114;
      v21 = v11;
      v22 = 2114;
      v23 = v12;
      _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_ERROR, "[RQF:%p] loadAdditionalItemsWithCount:%ld forSection:%{public}@ | completed error=%{public}@", (uint8_t *)&v16, 0x2Au);

    }
  }
  else
  {
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      LOWORD(v16) = 0;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v6, OS_SIGNPOST_INTERVAL_END, v7, "rqf:loadAdditionalItems:loadTracks", ", (uint8_t *)&v16, 2u);
    }

    v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = a1[8];
      v14 = (void *)a1[4];
      v15 = a1[5];
      v16 = 134218498;
      v17 = v14;
      v18 = 2048;
      v19 = v13;
      v20 = 2114;
      v21 = v15;
      _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "[RQF:%p] loadAdditionalItemsWithCount:%ld forSection:%{public}@ | completed", (uint8_t *)&v16, 0x20u);
    }
  }

  (*(void (**)(void))(a1[6] + 16))();
}

uint64_t __50__MPCModelRadioQueueFeeder_itemForItem_inSection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "indexForItem:", *(_QWORD *)(a1 + 32));
}

id __57__MPCModelRadioQueueFeeder_identifiersForItem_inSection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  v4 = objc_msgSend(v3, "indexForItem:", *(_QWORD *)(a1 + 32));
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "identifierSetAtIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

void __59__MPCModelRadioQueueFeeder_loadPlaybackContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  int v11;
  const char *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  uint32_t v15;
  int v16;
  void *v17;
  int v18;
  int v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = a2;
  if ((objc_msgSend(v6, "disarm") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), CFSTR("MPCModelRadioQueueFeeder.m"), 368, CFSTR("_loadTracksWithRequest completion called more than once"));

  }
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 72);
  if (v5)
  {
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      v11 = objc_msgSend(*(id *)(a1 + 48), "reasonType");
      v18 = 67109378;
      v19 = v11;
      v20 = 2114;
      v21 = v5;
      v12 = "reasonType=%d error=%{public}@";
      v13 = v9;
      v14 = v10;
      v15 = 18;
LABEL_10:
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v13, OS_SIGNPOST_INTERVAL_END, v14, "rqf:loadPlaybackContext:getTracks", v12, (uint8_t *)&v18, v15);
    }
  }
  else if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v16 = objc_msgSend(*(id *)(a1 + 48), "reasonType");
    v18 = 67109120;
    v19 = v16;
    v12 = "reasonType=%d";
    v13 = v9;
    v14 = v10;
    v15 = 8;
    goto LABEL_10;
  }

  (*(void (**)(_QWORD, _QWORD, id, id))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), 0, v7, v5);
}

void __67__MPCModelRadioQueueFeeder_containsTransportableContentWithReason___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (objc_msgSend(*(id *)(a1 + 32), "subtype") == 1)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("RadioStation subtype is Episode: %@"), *(_QWORD *)(a1 + 32));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
}

void __66__MPCModelRadioQueueFeeder_supplementalPlaybackContextWithReason___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  v3 = a2;
  objc_msgSend(v2, "radioStation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRadioStation:", v4);

}

uint64_t __47__MPCModelRadioQueueFeeder_canSkipItem_reason___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "indexForItem:", *(_QWORD *)(a1 + 32));
}

void __94__MPCModelRadioQueueFeeder_getRepresentativeMetadataForPlaybackContext_properties_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v5;
  void (*v6)(uint64_t, _QWORD);
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  if (a4)
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void (**)(uint64_t, _QWORD))(v5 + 16);
    v14 = a3;
    v6(v5, 0);
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    v8 = a3;
    objc_msgSend(v7, "firstModelPlayEvent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "radioStation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = (void *)MEMORY[0x24BDDC890];
      objc_msgSend(v9, "radioStation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "genericObjectWithModelObject:", v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 1, CFSTR("Could not convert station into metadata: %@"), v9);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v14 = (id)v13;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

+ (id)sharedQueue
{
  if (sharedQueue_onceToken[0] != -1)
    dispatch_once(sharedQueue_onceToken, &__block_literal_global_28594);
  return (id)sharedQueue___operationQueue;
}

+ (void)__CRASH_FOR_UNEXPECTED_TRACK_DELETE__
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPCModelRadioQueueFeeder.m"), 803, CFSTR("Unexpected change details (2 inserted, 1 deleted) for Radio tracklist"));

}

uint64_t __39__MPCModelRadioQueueFeeder_sharedQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1710]);
  v1 = (void *)sharedQueue___operationQueue;
  sharedQueue___operationQueue = (uint64_t)v0;

  objc_msgSend((id)sharedQueue___operationQueue, "setName:", CFSTR("com.apple.MediaPlaybackCore.MPCModelRadioQueueFeeder.loadingOperationQueue"));
  objc_msgSend((id)sharedQueue___operationQueue, "setMaxConcurrentOperationCount:", 6);
  return objc_msgSend((id)sharedQueue___operationQueue, "setQualityOfService:", 25);
}

@end
