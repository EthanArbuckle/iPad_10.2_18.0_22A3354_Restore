@implementation MPCSonicQueueFeeder

- (MPCSonicQueueFeeder)init
{
  MPCSonicQueueFeeder *v2;
  MPCSonicQueueFeeder_Swift *v3;
  MPCSonicQueueFeeder_Swift *swift;
  uint64_t v5;
  MPCPlaybackRequestEnvironment *playbackRequestEnvironment;
  MPRequestResponseController *v7;
  MPRequestResponseController *requestController;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MPCSonicQueueFeeder;
  v2 = -[MPCSonicQueueFeeder init](&v11, sel_init);
  if (v2)
  {
    v3 = -[MPCSonicQueueFeeder_Swift initWithQueueFeeder:]([MPCSonicQueueFeeder_Swift alloc], "initWithQueueFeeder:", v2);
    swift = v2->_swift;
    v2->_swift = v3;

    if (!v2->_playbackRequestEnvironment)
    {
      +[MPCPlaybackRequestEnvironment activeAccountRequestEnvironment](MPCPlaybackRequestEnvironment, "activeAccountRequestEnvironment");
      v5 = objc_claimAutoreleasedReturnValue();
      playbackRequestEnvironment = v2->_playbackRequestEnvironment;
      v2->_playbackRequestEnvironment = (MPCPlaybackRequestEnvironment *)v5;

    }
    v7 = (MPRequestResponseController *)objc_alloc_init(MEMORY[0x24BDDCB90]);
    requestController = v2->_requestController;
    v2->_requestController = v7;

    -[MPCSonicQueueFeeder swift](v2, "swift");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPRequestResponseController setDelegate:](v2->_requestController, "setDelegate:", v9);

  }
  return v2;
}

- (void)applyVolumeNormalizationForItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  int v11;
  NSObject *v12;
  double v13;
  double v14;
  _DWORD v15[2];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "modelPlayEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "itemType") == 1)
  {
    objc_msgSend(v3, "modelGenericObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "type") == 1)
    {
      objc_msgSend(v5, "song");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "album");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  if (objc_msgSend(v7, "hasLoadedValueForKey:", *MEMORY[0x24BDDBDB8]))
  {
    objc_msgSend(v7, "volumeNormalization");
    v9 = v8;
  }
  else
  {
    v9 = NAN;
  }
  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "soundCheckEnabled");

  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Preferences");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109120;
    v15[1] = v11;
    _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "MPCSonicQueueFeeder applyVolumeNormalizationForItem: soundCheckEnabled=%{BOOL}u", (uint8_t *)v15, 8u);
  }

  LODWORD(v13) = 0;
  if (v11)
    *(float *)&v13 = v9;
  objc_msgSend(v3, "setSoundCheckVolumeNormalization:", v13);
  *(float *)&v14 = v9;
  objc_msgSend(v3, "setLoudnessInfoVolumeNormalization:", v14);

}

- (id)playbackInfoForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSDictionary *startTimeModifications;
  uint64_t v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  NSDictionary *endTimeModifications;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *, _BYTE *);
  void *v23;
  id v24;
  _BYTE *v25;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t v35[4];
  void *v36;
  __int16 v37;
  MPCSonicQueueFeeder *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  id v42;
  _BYTE buf[24];
  uint64_t (*v44)(uint64_t, uint64_t);
  __int128 v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelGenericObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  v34 = 0;
  startTimeModifications = self->_startTimeModifications;
  v9 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __43__MPCSonicQueueFeeder_playbackInfoForItem___block_invoke;
  v26[3] = &unk_24CAB0FB0;
  v10 = v7;
  v27 = v10;
  v28 = &v29;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](startTimeModifications, "enumerateKeysAndObjectsUsingBlock:", v26);
  if (v30[5])
  {
    v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[MPCSonicQueueFeeder uniqueIdentifier](self, "uniqueIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (uint64_t (*)(uint64_t, uint64_t))v30[5];
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2114;
      v44 = v13;
      LOWORD(v45) = 2114;
      *(_QWORD *)((char *)&v45 + 2) = v4;
      _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_DEFAULT, "[SQF:%{public}@:%p] playbackInfoForItem | setting override start time [] startTime=%{public}@ item=%{public}@", buf, 0x2Au);

    }
    objc_msgSend(v5, "setObject:forKey:", v30[5], *MEMORY[0x24BDDB9D8]);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v44 = __Block_byref_object_copy_;
  *(_QWORD *)&v45 = __Block_byref_object_dispose_;
  *((_QWORD *)&v45 + 1) = 0;
  endTimeModifications = self->_endTimeModifications;
  v20 = v9;
  v21 = 3221225472;
  v22 = __43__MPCSonicQueueFeeder_playbackInfoForItem___block_invoke_5;
  v23 = &unk_24CAB0FB0;
  v15 = v10;
  v24 = v15;
  v25 = buf;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](endTimeModifications, "enumerateKeysAndObjectsUsingBlock:", &v20);
  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[MPCSonicQueueFeeder uniqueIdentifier](self, "uniqueIdentifier", v20, v21, v22, v23);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      *(_DWORD *)v35 = 138544130;
      v36 = v17;
      v37 = 2048;
      v38 = self;
      v39 = 2114;
      v40 = v18;
      v41 = 2114;
      v42 = v4;
      _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_DEFAULT, "[SQF:%{public}@:%p] playbackInfoForItem | setting override stop time [] stopTime=%{public}@ item=%{public}@", v35, 0x2Au);

    }
    objc_msgSend(v5, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), *MEMORY[0x24BDDB9C0]);
  }

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v29, 8);

  return v5;
}

- (int64_t)supplementalPlaybackContextBehavior
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (id)supplementalPlaybackContextWithReason:(int64_t)a3
{
  void *v6;
  uint64_t v7;
  MPCModelStorePlaybackItemsRequest *v8;
  void *v9;
  void *v11;
  int v12;
  MPCModelPlaybackContext *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  MPCSonicQueueFeeder *v22;
  __int16 v23;
  int64_t v24;
  __int16 v25;
  MPCModelPlaybackContext *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (-[MPCSonicQueueFeeder supplementalPlaybackContextBehavior](self, "supplementalPlaybackContextBehavior") != 1)
    return 0;
  -[MPMutableIdentifierListSection itemIdentifiers](self->_section, "itemIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
    return 0;
  v8 = objc_alloc_init(MPCModelStorePlaybackItemsRequest);
  if ((unint64_t)a3 >= 2)
  {
    if (a3 != 2)
    {
      if (a3 != 3)
      {
LABEL_11:
        v13 = objc_alloc_init(MPCModelPlaybackContext);
        -[MPCModelStorePlaybackItemsRequest setClientIdentifier:](v8, "setClientIdentifier:", CFSTR("com.apple.Music"));
        -[MPCModelPlaybackContext setRequest:](v13, "setRequest:", v8);
        -[MPCModelPlaybackContext setPlaybackRequestEnvironment:](v13, "setPlaybackRequestEnvironment:", self->_playbackRequestEnvironment);
        -[MPCSonicQueueFeeder playActivityQueueGroupingID](self, "playActivityQueueGroupingID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPCModelPlaybackContext setPlayActivityQueueGroupingID:](v13, "setPlayActivityQueueGroupingID:", v14);

        -[MPCSonicQueueFeeder playActivityFeatureName](self, "playActivityFeatureName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPCModelPlaybackContext setPlayActivityFeatureName:](v13, "setPlayActivityFeatureName:", v15);

        -[MPCSonicQueueFeeder playActivityRecommendationData](self, "playActivityRecommendationData");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPCModelPlaybackContext setPlayActivityRecommendationData:](v13, "setPlayActivityRecommendationData:", v16);

        v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          -[MPCSonicQueueFeeder uniqueIdentifier](self, "uniqueIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 138544130;
          v20 = v18;
          v21 = 2048;
          v22 = self;
          v23 = 2048;
          v24 = a3;
          v25 = 2114;
          v26 = v13;
          _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_DEFAULT, "[SQF:%{public}@:%p] supplementalPlaybackContextWithReason:%ld | created supplemental [] supplementalContext=%{public}@", (uint8_t *)&v19, 0x2Au);

        }
        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCSonicQueueFeeder.m"), 199, CFSTR("Not implemented (yet)"));
LABEL_10:

      goto LABEL_11;
    }
LABEL_9:
    -[MPCSonicQueueFeeder _sectionedModelObjectsRepresentationForSectionedContentIDs:](self, "_sectionedModelObjectsRepresentationForSectionedContentIDs:", self->_responseContentIDs);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelStorePlaybackItemsRequest setSectionedModelObjects:](v8, "setSectionedModelObjects:", v9);
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "forceLibrarySupplementalContexts");

  if (v12)
    goto LABEL_9;
  v13 = 0;
LABEL_15:

  return v13;
}

- (id)updatedPlaybackContext
{
  return self->_playbackContext;
}

- (id)uniqueIdentifier
{
  return (id)-[MPMutableIdentifierListSection sectionIdentifier](self->_section, "sectionIdentifier");
}

- (id)firstModelPlayEvent
{
  MPModelGenericObject *v3;
  MSVSectionedCollection *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  MPCSonicQueueFeeder *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = self->_fallbackSectionRepresentation;
  v4 = self->_responseContentIDs;
  if (-[MSVSectionedCollection numberOfSections](v4, "numberOfSections") < 1)
  {
    v6 = 0;
  }
  else
  {
    -[MSVSectionedCollection sectionAtIndex:](v4, "sectionAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    if (_NSIsNSString())
      v6 = v5;

  }
  if (objc_msgSend(v6, "length"))
  {
    -[MPCSonicQueueFeeder swift](self, "swift");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v7, "genericModelObjectForContentID:error:", v6, &v16);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v16;

    if (v9)
    {
      v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        -[MPCSonicQueueFeeder uniqueIdentifier](self, "uniqueIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v18 = v11;
        v19 = 2048;
        v20 = self;
        v21 = 2114;
        v22 = v9;
        _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_ERROR, "[SQF:%{public}@:%p] firstModelPlayEvent: | failed to get firstSectionModelObject [] error=%{public}@", buf, 0x20u);

      }
    }

    v3 = (MPModelGenericObject *)v8;
  }
  v12 = (void *)MEMORY[0x24BDDC938];
  -[MPCSonicQueueFeeder playActivityFeatureName](self, "playActivityFeatureName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "playEventWithModelObject:featureName:", v3, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)modelPlayEventForItem:(id)a3 inSection:(id)a4
{
  id v6;
  id v7;
  MSVSectionedCollection *responseContentIDs;
  id v9;
  MPModelGenericObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  _QWORD v22[4];
  id v23;
  MPCSonicQueueFeeder *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  MPCSonicQueueFeeder *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  v31 = 0;
  responseContentIDs = self->_responseContentIDs;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __55__MPCSonicQueueFeeder_modelPlayEventForItem_inSection___block_invoke;
  v22[3] = &unk_24CAB0FD8;
  v9 = v6;
  v24 = self;
  v25 = &v26;
  v23 = v9;
  -[MSVSectionedCollection enumerateItemsUsingBlock:](responseContentIDs, "enumerateItemsUsingBlock:", v22);
  v10 = self->_fallbackSectionRepresentation;
  if (objc_msgSend((id)v27[5], "length"))
  {
    -[MPCSonicQueueFeeder swift](self, "swift");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v27[5];
    v21 = 0;
    objc_msgSend(v11, "genericModelObjectForContentID:error:", v12, &v21);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v21;

    if (v14)
    {
      v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        -[MPCSonicQueueFeeder uniqueIdentifier](self, "uniqueIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v33 = v16;
        v34 = 2048;
        v35 = self;
        v36 = 2114;
        v37 = v14;
        _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_ERROR, "[SQF:%{public}@:%p] modelPlayEventForItem:inSection | failed to get firstSectionModelObject [] error=%{public}@", buf, 0x20u);

      }
    }

    v10 = (MPModelGenericObject *)v13;
  }
  v17 = (void *)MEMORY[0x24BDDC938];
  -[MPCSonicQueueFeeder playActivityFeatureName](self, "playActivityFeatureName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "playEventWithModelObject:featureName:", v10, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v26, 8);
  return v19;
}

- (void)getRepresentativeMetadataForPlaybackContext:(id)a3 properties:(id)a4 completion:(id)a5
{
  id v7;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3, a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCSonicQueueFeeder.m"), 282, CFSTR("DO NOT USE FOR representativeMetadata"));

}

- (NSString)rtcReportingPlayQueueSourceIdentifier
{
  return self->_rtcReportingPlayQueueSourceIdentifier;
}

- (BOOL)canJumpToItem:(id)a3 reason:(id *)a4
{
  return 1;
}

- (BOOL)containsLiveStream
{
  return 0;
}

- (BOOL)containsTransportableContentWithReason:(id *)a3
{
  return 1;
}

- (BOOL)supportsAutoPlayForItem:(id)a3 inSection:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a3;
  -[MPCSonicQueueFeeder swift](self, "swift");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "supportsAutoPlayForContentID:", v5);

  return v7;
}

- (BOOL)isExportableMediaTypeForItem:(id)a3 inSection:(id)a4
{
  return 0;
}

- (id)accountIDForItem:(id)a3 inSection:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t quot;
  uint64_t v10;
  char *v11;
  lldiv_t v12;
  uint64_t v13;
  const UInt8 *v14;
  __CFString *v15;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[MPCModelGenericAVItemUserIdentityPropertySet delegatedIdentityProperties](self->_identityPropertySet, "delegatedIdentityProperties", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "DSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MPCModelGenericAVItemUserIdentityPropertySet identityProperties](self->_identityPropertySet, "identityProperties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "DSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v7)
  {
    quot = objc_msgSend(v7, "longLongValue");
    v10 = quot;
    v11 = (char *)&v17 + 1;
    do
    {
      v12 = lldiv(quot, 10);
      quot = v12.quot;
      if (v12.rem >= 0)
        LOBYTE(v13) = v12.rem;
      else
        v13 = -v12.rem;
      *(v11 - 2) = v13 + 48;
      v14 = (const UInt8 *)(v11 - 2);
      --v11;
    }
    while (v12.quot);
    if (v10 < 0)
    {
      *(v11 - 2) = 45;
      v14 = (const UInt8 *)(v11 - 2);
    }
    v15 = (__CFString *)CFStringCreateWithBytes(0, v14, (char *)&v17 - (char *)v14, 0x8000100u, 0);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)firstItemIntersectingIdentifierSet:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[MPMutableIdentifierListSection itemIdentifiers](self->_section, "itemIdentifiers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        -[MPCSonicQueueFeeder swift](self, "swift");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identifiersForContentID:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v4, "intersectsSet:", v12) & 1) != 0)
        {
          v13 = v10;

          goto LABEL_11;
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (void)loadPlaybackContext:(id)a3 completion:(id)a4
{
  id v8;
  void *v9;
  MPModelGenericObject *v10;
  MPModelGenericObject *fallbackSectionRepresentation;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  MPIdentifierSet *v19;
  MPIdentifierSet *startItemIdentifiers;
  NSDictionary *v21;
  NSDictionary *startTimeModifications;
  NSDictionary *v23;
  NSDictionary *endTimeModifications;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  MPCModelPlaybackRequest *v30;
  MPCModelPlaybackRequest *request;
  MPCModelPlaybackRequest *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  const __CFString *v38;
  uint64_t v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  MPCModelPlaybackRequest *v48;
  NSString *v49;
  NSString *rtcReportingPlayQueueSourceIdentifier;
  MPCPlaybackRequestEnvironment *v51;
  MPCPlaybackRequestEnvironment *playbackRequestEnvironment;
  MPCModelPlaybackRequest *v53;
  MPCPlaybackRequestEnvironment *v54;
  BOOL v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  char v60;
  NSObject *v61;
  void *v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  MPCPlaybackRequestEnvironment *v64;
  MPCModelPlaybackRequest **p_request;
  uint64_t v66;
  void *v67;
  const __CFString *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  MPCModelPlaybackRequest *v75;
  void *v76;
  void *v77;
  MPCModelGenericAVItemUserIdentityPropertySet *v78;
  uint64_t v79;
  MPCModelGenericAVItemUserIdentityPropertySet *identityPropertySet;
  NSObject *v81;
  void *v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  NSObject *v84;
  os_signpost_id_t v85;
  NSObject *v86;
  NSObject *v87;
  MPCModelPlaybackRequest *v88;
  __CFString *v89;
  uint64_t v90;
  void *v91;
  BOOL v92;
  uint64_t v93;
  void *v94;
  MPIdentifierSet *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  NSObject *v100;
  void *v101;
  MPIdentifierSet *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  const __CFString *v106;
  const __CFString *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  uint64_t i;
  void *v112;
  void *v113;
  void *v114;
  MPCModelPlaybackRequest *v115;
  void *v116;
  void *v117;
  id v118;
  uint64_t (*v119)(uint64_t, uint64_t);
  _QWORD v120[4];
  id v121;
  _QWORD v122[6];
  id v123;
  _QWORD v124[3];
  _QWORD v125[3];
  void *v126;
  uint8_t v127[4];
  void *v128;
  __int16 v129;
  MPCSonicQueueFeeder *v130;
  __int16 v131;
  MPIdentifierSet *v132;
  __int16 v133;
  __CFString *v134;
  _BYTE buf[24];
  uint64_t (*v136)(uint64_t, uint64_t);
  __int128 v137;
  _QWORD v138[2];
  _QWORD v139[2];
  _QWORD v140[4];

  v140[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v118 = a4;
  objc_storeStrong((id *)&self->_playbackContext, a3);
  objc_msgSend(v8, "fallbackSectionRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (MPModelGenericObject *)objc_msgSend(v9, "copy");
  fallbackSectionRepresentation = self->_fallbackSectionRepresentation;
  self->_fallbackSectionRepresentation = v10;

  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    -[MPCSonicQueueFeeder uniqueIdentifier](self, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2114;
    v136 = (uint64_t (*)(uint64_t, uint64_t))v8;
    _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "[SQF:%{public}@:%p] loadPlaybackContext: | [] playbackContext=%{public}@", buf, 0x20u);

  }
  objc_msgSend(v8, "playActivityRecommendationData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCSonicQueueFeeder setPlayActivityRecommendationData:](self, "setPlayActivityRecommendationData:", v14);

  objc_msgSend(v8, "playActivityQueueGroupingID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCSonicQueueFeeder setPlayActivityQueueGroupingID:](self, "setPlayActivityQueueGroupingID:", v15);

  objc_msgSend(v8, "playActivityFeatureName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCSonicQueueFeeder setPlayActivityFeatureName:](self, "setPlayActivityFeatureName:", v16);

  objc_msgSend(v8, "siriReferenceIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCSonicQueueFeeder setSiriReferenceIdentifier:](self, "setSiriReferenceIdentifier:", v17);

  objc_msgSend(v8, "siriWHAMetricsInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCSonicQueueFeeder setSiriWHAMetricsInfo:](self, "setSiriWHAMetricsInfo:", v18);

  objc_msgSend(v8, "startItemIdentifiers");
  v19 = (MPIdentifierSet *)objc_claimAutoreleasedReturnValue();
  startItemIdentifiers = self->_startItemIdentifiers;
  self->_startItemIdentifiers = v19;

  objc_msgSend(v8, "startTimeModifications");
  v21 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  startTimeModifications = self->_startTimeModifications;
  self->_startTimeModifications = v21;

  objc_msgSend(v8, "endTimeModifications");
  v23 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  endTimeModifications = self->_endTimeModifications;
  self->_endTimeModifications = v23;

  objc_msgSend(v8, "siriReferenceIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isSiriInitiated = v25 != 0;

  objc_msgSend(v8, "siriAssetInfo");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = (uint64_t (*)(uint64_t, uint64_t))objc_msgSend(v26, "copy");

  if (objc_msgSend(v119, "length"))
  {
    v27 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      -[MPCSonicQueueFeeder uniqueIdentifier](self, "uniqueIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v28;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2114;
      v136 = v119;
      _os_log_impl(&dword_210BD8000, v27, OS_LOG_TYPE_DEFAULT, "[SQF:%{public}@:%p] loadPlaybackContext: | processing siriAssetInfo [] siriAssetInfo=%{public}@", buf, 0x20u);

    }
  }
  objc_msgSend(v8, "request");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (MPCModelPlaybackRequest *)objc_msgSend(v29, "copy");
  request = self->_request;
  self->_request = v30;

  if ((-[MPCModelPlaybackRequest conformsToProtocol:](self->_request, "conformsToProtocol:", &unk_254AABA00) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCSonicQueueFeeder.m"), 355, CFSTR("Request class (%@) must conform to MPCModelPlaybackRequest"), objc_opt_class());

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32 = self->_request;
    -[MPCModelPlaybackRequest setUseUniversalAccumulator:](v32, "setUseUniversalAccumulator:", 1);
    if (_os_feature_enabled_impl())
      -[MPCModelPlaybackRequest setAllowLocalEquivalencies:](v32, "setAllowLocalEquivalencies:", 1);
    if (self->_isSiriInitiated && !objc_msgSend(v119, "length"))
    {
      v33 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        -[MPCSonicQueueFeeder uniqueIdentifier](self, "uniqueIdentifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v34;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = self;
        _os_log_impl(&dword_210BD8000, v33, OS_LOG_TYPE_ERROR, "[SQF:%{public}@:%p] loadPlaybackContext: | generating ABC [missing siriAssetInfo for siri initiated storePlayback]", buf, 0x16u);

      }
      v35 = (void *)MEMORY[0x24BE65C38];
      v138[0] = CFSTR("siriReferenceIdentifier");
      objc_msgSend(v8, "siriReferenceIdentifier");
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = (void *)v36;
      if (v36)
        v38 = (const __CFString *)v36;
      else
        v38 = CFSTR("<missing>");
      v138[1] = CFSTR("storeItemsRequest.identifiers");
      v139[0] = v38;
      -[MPCModelPlaybackRequest identifiers](v32, "identifiers");
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = (void *)v39;
      v41 = CFSTR("nil");
      if (v39)
        v41 = (const __CFString *)v39;
      v139[1] = v41;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v139, v138, 2);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v140[0] = v42;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v140, 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", *MEMORY[0x24BE65AB0], CFSTR("Bug"), CFSTR("MissingSiriAssetInfo"), CFSTR("SetPlaybackQueue"), &stru_24CABB5D0, v43, 0);

    }
  }
  -[MPCModelPlaybackRequest itemKind](self->_request, "itemKind");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend(v44, "modelClass");

  objc_msgSend(v45, "mqf_requiredItemPlaybackProperties");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  if (v117)
  {
    -[MPCModelPlaybackRequest setItemProperties:](self->_request, "setItemProperties:");
    -[MPCModelPlaybackRequest sectionKind](self->_request, "sectionKind");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)objc_msgSend(v46, "modelClass");

    objc_msgSend(v47, "mqf_requiredSectionPlaybackProperties");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelPlaybackRequest setSectionProperties:](self->_request, "setSectionProperties:", v116);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[MPCModelPlaybackRequest setDisableImplicitSectioning:](self->_request, "setDisableImplicitSectioning:", 1);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[MPCModelPlaybackRequest setShouldBatchResultsWithPlaceholderObjects:](self->_request, "setShouldBatchResultsWithPlaceholderObjects:", 1);
    if (-[MPCModelPlaybackRequest conformsToProtocol:](self->_request, "conformsToProtocol:", &unk_254AABA60))
    {
      v48 = self->_request;
      -[MPCModelPlaybackRequest rtcReportingPlayQueueSourceIdentifier](v48, "rtcReportingPlayQueueSourceIdentifier");
      v49 = (NSString *)objc_claimAutoreleasedReturnValue();
      rtcReportingPlayQueueSourceIdentifier = self->_rtcReportingPlayQueueSourceIdentifier;
      self->_rtcReportingPlayQueueSourceIdentifier = v49;

    }
    objc_msgSend(v8, "playbackRequestEnvironment");
    v51 = (MPCPlaybackRequestEnvironment *)objc_claimAutoreleasedReturnValue();
    playbackRequestEnvironment = self->_playbackRequestEnvironment;
    self->_playbackRequestEnvironment = v51;

    if (-[MPCModelPlaybackRequest conformsToProtocol:](self->_request, "conformsToProtocol:", &unk_254A9D5E8))
    {
      v53 = self->_request;
      -[MPCModelPlaybackRequest playbackRequestEnvironment](v53, "playbackRequestEnvironment");
      v54 = (MPCPlaybackRequestEnvironment *)objc_claimAutoreleasedReturnValue();
      v55 = v54 == self->_playbackRequestEnvironment;

      if (!v55)
      {
        -[MPCModelPlaybackRequest playbackRequestEnvironment](v53, "playbackRequestEnvironment");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "userIdentity");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPCPlaybackRequestEnvironment userIdentity](self->_playbackRequestEnvironment, "userIdentity");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEC8A60], "defaultIdentityStore");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v57, "isEqualToIdentity:inStore:", v58, v59);

        if ((v60 & 1) == 0)
        {
          v61 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
          {
            -[MPCSonicQueueFeeder uniqueIdentifier](self, "uniqueIdentifier");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPCModelPlaybackRequest playbackRequestEnvironment](v53, "playbackRequestEnvironment");
            v63 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
            v64 = self->_playbackRequestEnvironment;
            *(_DWORD *)buf = 138544130;
            *(_QWORD *)&buf[4] = v62;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = self;
            *(_WORD *)&buf[22] = 2114;
            v136 = v63;
            LOWORD(v137) = 2114;
            *(_QWORD *)((char *)&v137 + 2) = v64;
            _os_log_impl(&dword_210BD8000, v61, OS_LOG_TYPE_FAULT, "[SQF:%{public}@:%p] loadPlaybackContext: | recovering user identity mismatch [self correcting] request.playbackRequestEnvironment=%{public}@ context.playbackRequestEnvironment=%{public}@", buf, 0x2Au);

          }
        }
        -[MPCModelPlaybackRequest setPlaybackRequestEnvironment:](v53, "setPlaybackRequestEnvironment:", self->_playbackRequestEnvironment);
      }

    }
    p_request = &self->_request;
    -[MPCModelPlaybackRequest label](self->_request, "label");
    v66 = objc_claimAutoreleasedReturnValue();
    v67 = (void *)v66;
    if (v66)
      v68 = (const __CFString *)v66;
    else
      v68 = CFSTR("<missing request label>");
    objc_msgSend(CFSTR("com.apple.MediaPlayer.MPCSonicQueueFeeder: "), "stringByAppendingString:", v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelPlaybackRequest setLabel:](*p_request, "setLabel:", v69);

    v70 = objc_alloc_init(MEMORY[0x24BDDC9B8]);
    -[MPRequestResponseController setRequest:](self->_requestController, "setRequest:", v70);

    -[MPRequestResponseController request](self->_requestController, "request");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setTimeoutInterval:", 0.0);

    -[MPRequestResponseController request](self->_requestController, "request");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setQualityOfService:", 25);

    -[MPCModelPlaybackRequest label](*p_request, "label");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPRequestResponseController request](self->_requestController, "request");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setLabel:", v73);

    v75 = *p_request;
    -[MPRequestResponseController request](self->_requestController, "request");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setModelRequest:", v75);

    -[MPCPlaybackRequestEnvironment _createStoreRequestContext](self->_playbackRequestEnvironment, "_createStoreRequestContext");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = 0;
    v78 = -[MPCModelGenericAVItemUserIdentityPropertySet initWithRequestContext:error:]([MPCModelGenericAVItemUserIdentityPropertySet alloc], "initWithRequestContext:error:", v77, &v123);
    v79 = (uint64_t)v123;
    identityPropertySet = self->_identityPropertySet;
    self->_identityPropertySet = v78;

    if (!((uint64_t)self->_identityPropertySet | v79))
    {
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 67, CFSTR("Missing error when identity properties failed to load"));
      v79 = objc_claimAutoreleasedReturnValue();
    }
    if (v79)
    {
      v81 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      {
        -[MPCSonicQueueFeeder uniqueIdentifier](self, "uniqueIdentifier");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v79, "msv_description");
        v83 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v82;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = self;
        *(_WORD *)&buf[22] = 2114;
        v136 = v83;
        _os_log_impl(&dword_210BD8000, v81, OS_LOG_TYPE_ERROR, "[SQF:%{public}@:%p] loadPlaybackContext: | failed to load identity properties [] error=%{public}@", buf, 0x20u);

      }
      (*((void (**)(id, _QWORD, _QWORD, uint64_t))v118 + 2))(v118, 0, 0, v79);
      goto LABEL_69;
    }
    -[MPRequestResponseController setNeedsReload](self->_requestController, "setNeedsReload");
    v84 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
    v85 = os_signpost_id_make_with_pointer(v84, self);

    v86 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
    v87 = v86;
    if (v85 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v86))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v87, OS_SIGNPOST_INTERVAL_BEGIN, v85, "ModelShimRequest", ", buf, 2u);
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_68:
      -[MPRequestResponseController beginAutomaticResponseLoading](self->_requestController, "beginAutomaticResponseLoading");
      -[MPCSonicQueueFeeder swift](self, "swift");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v120[0] = MEMORY[0x24BDAC760];
      v120[1] = 3221225472;
      v120[2] = __54__MPCSonicQueueFeeder_loadPlaybackContext_completion___block_invoke_129;
      v120[3] = &unk_24CAB33A0;
      v121 = v118;
      objc_msgSend(v99, "loadWithContext:completion:", v8, v120);

LABEL_69:
      goto LABEL_70;
    }
    v88 = self->_request;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v136 = __Block_byref_object_copy_;
    *(_QWORD *)&v137 = __Block_byref_object_dispose_;
    *((_QWORD *)&v137 + 1) = 0;
    v115 = v88;
    -[MPCModelPlaybackRequest identifiers](v88, "identifiers");
    v89 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v90 = -[__CFString totalItemCount](v89, "totalItemCount");
    -[MPCModelPlaybackRequest sectionedModelObjects](v115, "sectionedModelObjects");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    if (v91 && v90 >= 1 && !self->_startItemIdentifiers)
    {
      v92 = objc_msgSend(v8, "shuffleType") == 0;

      if (v92)
      {
LABEL_60:
        v96 = *(_QWORD *)&buf[8];
        if (self->_startItemIdentifiers && !*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
        {
          v122[0] = MEMORY[0x24BDAC760];
          v122[1] = 3221225472;
          v122[2] = __54__MPCSonicQueueFeeder_loadPlaybackContext_completion___block_invoke;
          v122[3] = &unk_24CAB51E0;
          v122[4] = self;
          v122[5] = buf;
          -[__CFString enumerateItemIdentifiersUsingBlock:](v89, "enumerateItemIdentifiersUsingBlock:", v122);
          v96 = *(_QWORD *)&buf[8];
        }
        if (*(_QWORD *)(v96 + 40))
        {
          v97 = -[__CFString globalIndexForIndexPath:](v89, "globalIndexForIndexPath:");
          objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 3);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "addObject:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
          if ((_os_feature_enabled_impl() & 1) == 0)
          {
            if (v97 <= 1)
              v110 = 1;
            else
              v110 = v97;
            for (i = v110 - 1; (unint64_t)objc_msgSend(v98, "count") <= 2 && i < v90; ++i)
            {
              if (v97 != i)
              {
                -[__CFString indexPathForGlobalIndex:](v89, "indexPathForGlobalIndex:", i);
                v112 = (void *)objc_claimAutoreleasedReturnValue();
                if (v112)
                  objc_msgSend(v98, "addObject:", v112);

              }
            }
          }
          -[MPCModelPlaybackRequest setPlaybackPrioritizedIndexPaths:](v115, "setPlaybackPrioritizedIndexPaths:", v98);
        }
        else
        {
          if (!v119 || !self->_startItemIdentifiers)
            goto LABEL_67;
          _MPCLogCategoryPlayback_Oversize();
          v100 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
          {
            -[MPCSonicQueueFeeder uniqueIdentifier](self, "uniqueIdentifier");
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            v102 = self->_startItemIdentifiers;
            *(_DWORD *)v127 = 138544130;
            v128 = v101;
            v129 = 2048;
            v130 = self;
            v131 = 2114;
            v132 = v102;
            v133 = 2114;
            v134 = v89;
            _os_log_impl(&dword_210BD8000, v100, OS_LOG_TYPE_ERROR, "[SQF:%{public}@:%p] loadPlaybackContext: | clearing startItemIdentifiers [SiriAssetInfo contains item not in the request] startItemIdentifiers=%{public}@ storeItemsRequest.identifiers=%{public}@", v127, 0x2Au);

          }
          v103 = (void *)MEMORY[0x24BE65C38];
          v125[0] = self->_startItemIdentifiers;
          v124[0] = CFSTR("startItemIdentifiers");
          v124[1] = CFSTR("storeItemsRequest.sectionedModelObjects");
          -[MPCModelPlaybackRequest sectionedModelObjects](v115, "sectionedModelObjects");
          v104 = objc_claimAutoreleasedReturnValue();
          v105 = (void *)v104;
          v106 = CFSTR("nil");
          if (v104)
            v107 = (const __CFString *)v104;
          else
            v107 = CFSTR("nil");
          v124[2] = CFSTR("identifiers");
          if (v89)
            v106 = v89;
          v125[1] = v107;
          v125[2] = v106;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v125, v124, 3);
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          v126 = v108;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v126, 1);
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", *MEMORY[0x24BE65AB0], CFSTR("Bug"), CFSTR("SiriAssetInfoBug"), CFSTR("StartItemNotInRequest"), &stru_24CABB5D0, v109, 0);

          v98 = self->_startItemIdentifiers;
          self->_startItemIdentifiers = 0;
        }

LABEL_67:
        _Block_object_dispose(buf, 8);

        goto LABEL_68;
      }
      -[__CFString indexPathForGlobalIndex:](v89, "indexPathForGlobalIndex:", arc4random_uniform(v90));
      v93 = objc_claimAutoreleasedReturnValue();
      v94 = *(void **)(*(_QWORD *)&buf[8] + 40);
      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v93;

      -[__CFString identifiersForItemAtIndexPath:](v89, "identifiersForItemAtIndexPath:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
      v95 = (MPIdentifierSet *)objc_claimAutoreleasedReturnValue();
      v91 = self->_startItemIdentifiers;
      self->_startItemIdentifiers = v95;
    }

    goto LABEL_60;
  }
  if (MSVDeviceOSIsInternalInstall())
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCSonicQueueFeeder.m"), 376, CFSTR("Invalid request item class: %@ for %@"), v45, self->_request);

  }
  objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 1, CFSTR("Invalid request item class: %@ for %@"), v45, self->_request);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, void *))v118 + 2))(v118, 0, 0, v116);
LABEL_70:

}

- (id)identifiersForItem:(id)a3 inSection:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  -[MPCSonicQueueFeeder swift](self, "swift");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifiersForContentID:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)itemForItem:(id)a3 inSection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  MPCSonicAVItem *v13;
  MPCSonicAVItem *v14;
  void *v15;
  MPCModelGenericAVItem *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  MPCSonicQueueFeeder *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[MPCSonicQueueFeeder swift](self, "swift");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v8, "genericModelObjectForContentID:error:", v6, &v25);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v25;

  if (v10)
  {
    v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      -[MPCSonicQueueFeeder uniqueIdentifier](self, "uniqueIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v27 = v12;
      v28 = 2048;
      v29 = self;
      v30 = 2114;
      v31 = v10;
      _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_ERROR, "[SQF:%{public}@:%p] itemForItem:inSection | returning nil [failed to get item] error=%{public}@", buf, 0x20u);

    }
    v13 = 0;
    goto LABEL_12;
  }
  if (_os_feature_enabled_impl())
  {
    v14 = [MPCSonicAVItem alloc];
    -[MPCModelPlaybackRequest itemProperties](self->_request, "itemProperties");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[MPCSonicAVItem initWithGenericObject:itemProperties:playbackRequestEnvironment:identityPropertySet:contentID:](v14, "initWithGenericObject:itemProperties:playbackRequestEnvironment:identityPropertySet:contentID:", v9, v15, self->_playbackRequestEnvironment, self->_identityPropertySet, v6);
  }
  else
  {
    v16 = [MPCModelGenericAVItem alloc];
    -[MPCModelPlaybackRequest itemProperties](self->_request, "itemProperties");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[MPCModelGenericAVItem initWithGenericObject:itemProperties:playbackRequestEnvironment:identityPropertySet:](v16, "initWithGenericObject:itemProperties:playbackRequestEnvironment:identityPropertySet:", v9, v17, self->_playbackRequestEnvironment, self->_identityPropertySet);

    -[MPCPlaybackRequestEnvironment userIdentity](self->_playbackRequestEnvironment, "userIdentity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPCMediaLibraryPlaybackAssetCacheProvider deviceLibraryProviderWithUserIdentity:](MPCMediaLibraryPlaybackAssetCacheProvider, "deviceLibraryProviderWithUserIdentity:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelGenericAVItem setAssetCacheProvider:](v13, "setAssetCacheProvider:", v18);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isSiriInitiated);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelGenericAVItem setSiriInitiated:](v13, "setSiriInitiated:", v19);

  -[MPCModelPlaybackContext queueDescriptor](self->_playbackContext, "queueDescriptor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelGenericAVItem setPrioritizeStartupOverQuality:](v13, "setPrioritizeStartupOverQuality:", objc_msgSend(v20, "prioritizeStartupOverQuality"));

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MPCModelPlaybackRequest mediaLibrary](self->_request, "mediaLibrary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelGenericAVItem setMediaLibrary:](v13, "setMediaLibrary:", v21);

  }
  if (v13)
  {
    -[MPCSonicAVItem setFeeder:](v13, "setFeeder:", self);
    -[MPCSonicAVItem setQueueIdentifier:](v13, "setQueueIdentifier:", v6);
    -[MPCSonicQueueFeeder modelPlayEventForItem:inSection:](self, "modelPlayEventForItem:inSection:", v6, v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCSonicAVItem setModelPlayEvent:](v13, "setModelPlayEvent:", v22);

    -[MPCSonicQueueFeeder playbackInfoForItem:](self, "playbackInfoForItem:", v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCSonicAVItem setPlaybackInfo:](v13, "setPlaybackInfo:", v23);

    -[MPCModelPlaybackContext associatedParticipantIdentifier](self->_playbackContext, "associatedParticipantIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    -[MPCSonicAVItem setAssociatedParticipantIdentifier:](v13, "setAssociatedParticipantIdentifier:", v11);
LABEL_12:

  }
  return v13;
}

- (BOOL)shouldUsePlaceholderForItem:(id)a3 inSection:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a3;
  -[MPCSonicQueueFeeder swift](self, "swift");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldUsePlaceholderForContentID:", v5);

  return v7;
}

- (void)reloadSection:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  MPCSonicQueueFeeder *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_storeStrong((id *)&self->_section, a3);
  v8 = a4;
  v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[MPCSonicQueueFeeder uniqueIdentifier](self, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v10;
    v14 = 2048;
    v15 = self;
    v16 = 2048;
    v17 = v7;
    _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_DEFAULT, "[SQF:%{public}@:%p] reloadSection: | connecting to section [] section=%p", (uint8_t *)&v12, 0x20u);

  }
  -[MPCSonicQueueFeeder swift](self, "swift");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reloadSection:completion:", v7, v8);

}

- (BOOL)section:(id)a3 supportsShuffleType:(int64_t)a4
{
  return a4 != 2;
}

- (BOOL)section:(id)a3 shouldShuffleExcludeItem:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[MPCSonicQueueFeeder swift](self, "swift");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldShuffleExcludeContentID:", v5);

  return v7;
}

- (id)_sectionedModelObjectsRepresentationForSectionedContentIDs:(id)a3
{
  return 0;
}

- (id)_supplementalLibraryRequestWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  BOOL v33;
  void *v34;
  _BOOL4 v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  BOOL v49;
  void *v50;
  _BOOL4 v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v66;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  id obj;
  id obja;
  id objb;
  _QWORD v76[4];
  id v77;
  id v78;
  BOOL v79;
  BOOL v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _QWORD v85[4];
  id v86;
  id v87;
  BOOL v88;
  BOOL v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _QWORD v94[4];
  id v95;
  id v96;
  BOOL v97;
  BOOL v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  uint64_t v106;

  v106 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)-[MPCModelPlaybackRequest copy](self->_request, "copy");
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MPCModelPlaybackRequest mediaLibrary](self->_request, "mediaLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMediaLibrary:", v6);

  }
  objc_msgSend(v4, "allowedSectionIdentifiers");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v4;
  if (objc_msgSend(v68, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v68, "count"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    v7 = v68;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v99, v105, 16);
    if (!v8)
      goto LABEL_22;
    v9 = v8;
    v10 = *(_QWORD *)v100;
    obj = v7;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v100 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * i);
        objc_msgSend(v12, "personalizedStore");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "universalStore");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v13)
        {
          v16 = objc_msgSend(v13, "cloudID") != 0;
          if (!v15)
            goto LABEL_14;
        }
        else
        {
          v16 = 0;
          if (!v14)
          {
LABEL_14:
            v18 = 0;
            if (!v16)
              goto LABEL_18;
            goto LABEL_19;
          }
        }
        objc_msgSend(v15, "globalPlaylistID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "length"))
        {
          v18 = 1;
        }
        else
        {
          objc_msgSend(v15, "universalCloudLibraryID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v19, "length") != 0;

        }
        if (!v16)
        {
LABEL_18:
          if (!v18)
            goto LABEL_20;
        }
LABEL_19:
        v20 = objc_alloc(MEMORY[0x24BDDC758]);
        objc_msgSend(v12, "modelKind");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v94[0] = MEMORY[0x24BDAC760];
        v94[1] = 3221225472;
        v94[2] = __60__MPCSonicQueueFeeder__supplementalLibraryRequestWithError___block_invoke;
        v94[3] = &unk_24CAB5328;
        v97 = v16;
        v95 = v13;
        v98 = v18;
        v96 = v15;
        v22 = (void *)objc_msgSend(v20, "initWithSource:modelKind:block:", CFSTR("ModelQueueFeeder"), v21, v94);

        objc_msgSend(v71, "addObject:", v22);
LABEL_20:

      }
      v7 = obj;
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v105, 16);
      if (!v9)
      {
LABEL_22:

        v5 = v69;
        objc_msgSend(v69, "setAllowedSectionIdentifiers:", v71);
        if (objc_msgSend(v71, "count"))
        {

          break;
        }
        if (!a3)
        {
          v59 = 0;
          v23 = v71;
          goto LABEL_80;
        }
        v60 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(v7, "msv_compactDescription");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 72, CFSTR("Failed to create transportable allowedSectionIDs: %@"), v40);
        v59 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_78:
        v23 = v71;
        goto LABEL_79;
      }
    }
  }
  objc_msgSend(v5, "allowedItemIdentifiers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v23;
  if (!objc_msgSend(v23, "count"))
    goto LABEL_45;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v23, "count"));
  obja = (id)objc_claimAutoreleasedReturnValue();
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v24 = v23;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v90, v104, 16);
  if (!v25)
    goto LABEL_43;
  v26 = v25;
  v27 = *(_QWORD *)v91;
  do
  {
    for (j = 0; j != v26; ++j)
    {
      if (*(_QWORD *)v91 != v27)
        objc_enumerationMutation(v24);
      v29 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * j);
      objc_msgSend(v29, "personalizedStore");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "universalStore");
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = (void *)v31;
      if (v30)
      {
        v33 = objc_msgSend(v30, "cloudID") != 0;
        if (!v32)
          goto LABEL_35;
      }
      else
      {
        v33 = 0;
        if (!v31)
        {
LABEL_35:
          v35 = 0;
          if (!v33)
            goto LABEL_39;
          goto LABEL_40;
        }
      }
      objc_msgSend(v32, "universalCloudLibraryID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v34, "length"))
        v35 = 1;
      else
        v35 = objc_msgSend(v32, "purchasedAdamID") != 0;

      if (!v33)
      {
LABEL_39:
        if (!v35)
          goto LABEL_41;
      }
LABEL_40:
      v36 = v24;
      v37 = objc_alloc(MEMORY[0x24BDDC758]);
      objc_msgSend(v29, "modelKind");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v85[0] = MEMORY[0x24BDAC760];
      v85[1] = 3221225472;
      v85[2] = __60__MPCSonicQueueFeeder__supplementalLibraryRequestWithError___block_invoke_4;
      v85[3] = &unk_24CAB5328;
      v88 = v33;
      v86 = v30;
      v89 = v35;
      v87 = v32;
      v39 = (void *)objc_msgSend(v37, "initWithSource:modelKind:block:", CFSTR("ModelQueueFeeder"), v38, v85);

      objc_msgSend(obja, "addObject:", v39);
      v24 = v36;

LABEL_41:
    }
    v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v90, v104, 16);
  }
  while (v26);
LABEL_43:

  v5 = v69;
  v23 = v24;
  v40 = obja;
  objc_msgSend(v69, "setAllowedItemIdentifiers:", obja);
  if (!objc_msgSend(obja, "count"))
  {
    if (a3)
    {
      v61 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v23, "msv_compactDescription");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 72, CFSTR("Failed to create transportable allowedItemIDs: %@"), v62);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      v5 = v69;
    }
    v59 = 0;
    goto LABEL_79;
  }

  v23 = v71;
LABEL_45:
  objc_msgSend(v5, "scopedContainers");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v40, "count"))
    goto LABEL_69;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v40, "count"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v66 = v40;
  objb = v40;
  v72 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v81, v103, 16);
  if (!v72)
    goto LABEL_67;
  v42 = *(_QWORD *)v82;
  v70 = *(_QWORD *)v82;
  while (2)
  {
    v43 = 0;
    while (2)
    {
      if (*(_QWORD *)v82 != v42)
        objc_enumerationMutation(objb);
      v44 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v43);
      objc_msgSend(v44, "identifiers");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "personalizedStore");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v44, "identifiers");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "universalStore");
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      if (v46)
      {
        v49 = objc_msgSend(v46, "cloudID") != 0;
        if (v48)
          goto LABEL_53;
LABEL_56:
        v51 = 0;
        if (v49)
          goto LABEL_64;
LABEL_63:
        if (v51)
          goto LABEL_64;
      }
      else
      {
        v49 = 0;
        if (!v48)
          goto LABEL_56;
LABEL_53:
        objc_msgSend(v48, "globalPlaylistID");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v50, "length"))
        {
          v51 = 1;
        }
        else
        {
          objc_msgSend(v48, "universalCloudLibraryID");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v52, "length"))
            v51 = 1;
          else
            v51 = objc_msgSend(v48, "purchasedAdamID") != 0;

        }
        if (!v49)
          goto LABEL_63;
LABEL_64:
        v53 = objc_alloc(MEMORY[0x24BDDC758]);
        objc_msgSend(v44, "identifiers");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "modelKind");
        v55 = v41;
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v76[0] = MEMORY[0x24BDAC760];
        v76[1] = 3221225472;
        v76[2] = __60__MPCSonicQueueFeeder__supplementalLibraryRequestWithError___block_invoke_7;
        v76[3] = &unk_24CAB5328;
        v79 = v49;
        v77 = v46;
        v80 = v51;
        v78 = v48;
        v57 = (void *)objc_msgSend(v53, "initWithSource:modelKind:block:", CFSTR("ModelQueueFeeder"), v56, v76);

        v41 = v55;
        v42 = v70;

        v58 = (void *)objc_msgSend(v44, "copyWithIdentifiers:block:", v57, &__block_literal_global_473);
        objc_msgSend(v41, "addObject:", v58);

      }
      if (v72 != ++v43)
        continue;
      break;
    }
    v72 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v81, v103, 16);
    if (v72)
      continue;
    break;
  }
LABEL_67:
  v40 = objb;

  v5 = v69;
  objc_msgSend(v69, "setScopedContainers:", v41);
  if (!objc_msgSend(v41, "count"))
  {
    if (a3)
    {
      v63 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(objb, "msv_compactDescription");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 72, CFSTR("Failed to create transportable scopedContainers: %@"), v64);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      v5 = v69;
    }

    v59 = 0;
    goto LABEL_78;
  }

  v23 = v71;
  v40 = v66;
LABEL_69:
  v59 = v5;
LABEL_79:

LABEL_80:
  return v59;
}

- (MPCPlaybackRequestEnvironment)playbackRequestEnvironment
{
  return self->_playbackRequestEnvironment;
}

- (void)setPlaybackRequestEnvironment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (MPCSonicQueueFeeder_Swift)swift
{
  return self->_swift;
}

- (MPModelGenericObject)fallbackSectionRepresentation
{
  return self->_fallbackSectionRepresentation;
}

- (void)setFallbackSectionRepresentation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (MSVSectionedCollection)responseContentIDs
{
  return self->_responseContentIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseContentIDs, 0);
  objc_storeStrong((id *)&self->_fallbackSectionRepresentation, 0);
  objc_storeStrong((id *)&self->_swift, 0);
  objc_storeStrong((id *)&self->_playbackContext, 0);
  objc_storeStrong((id *)&self->_identityPropertySet, 0);
  objc_storeStrong((id *)&self->_section, 0);
  objc_storeStrong((id *)&self->_startItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_playbackRequestEnvironment, 0);
  objc_storeStrong((id *)&self->_rtcReportingPlayQueueSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_requestController, 0);
  objc_storeStrong((id *)&self->_endTimeModifications, 0);
  objc_storeStrong((id *)&self->_startTimeModifications, 0);
}

void __60__MPCSonicQueueFeeder__supplementalLibraryRequestWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a2;
  v3 = MEMORY[0x24BDAC760];
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "personID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    v8[1] = 3221225472;
    v8[2] = __60__MPCSonicQueueFeeder__supplementalLibraryRequestWithError___block_invoke_2;
    v8[3] = &unk_24CAB89A8;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v5, "setPersonalStoreIdentifiersWithPersonID:block:", v4, v8);

  }
  if (*(_BYTE *)(a1 + 49))
  {
    v6[0] = v3;
    v6[1] = 3221225472;
    v6[2] = __60__MPCSonicQueueFeeder__supplementalLibraryRequestWithError___block_invoke_3;
    v6[3] = &unk_24CAB89F0;
    v7 = *(id *)(a1 + 40);
    objc_msgSend(v5, "setUniversalStoreIdentifiersWithBlock:", v6);

  }
}

void __60__MPCSonicQueueFeeder__supplementalLibraryRequestWithError___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a2;
  v3 = MEMORY[0x24BDAC760];
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "personID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    v8[1] = 3221225472;
    v8[2] = __60__MPCSonicQueueFeeder__supplementalLibraryRequestWithError___block_invoke_5;
    v8[3] = &unk_24CAB89A8;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v5, "setPersonalStoreIdentifiersWithPersonID:block:", v4, v8);

  }
  if (*(_BYTE *)(a1 + 49))
  {
    v6[0] = v3;
    v6[1] = 3221225472;
    v6[2] = __60__MPCSonicQueueFeeder__supplementalLibraryRequestWithError___block_invoke_6;
    v6[3] = &unk_24CAB89F0;
    v7 = *(id *)(a1 + 40);
    objc_msgSend(v5, "setUniversalStoreIdentifiersWithBlock:", v6);

  }
}

void __60__MPCSonicQueueFeeder__supplementalLibraryRequestWithError___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a2;
  v3 = MEMORY[0x24BDAC760];
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "personID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    v8[1] = 3221225472;
    v8[2] = __60__MPCSonicQueueFeeder__supplementalLibraryRequestWithError___block_invoke_8;
    v8[3] = &unk_24CAB89A8;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v5, "setPersonalStoreIdentifiersWithPersonID:block:", v4, v8);

  }
  if (*(_BYTE *)(a1 + 49))
  {
    v6[0] = v3;
    v6[1] = 3221225472;
    v6[2] = __60__MPCSonicQueueFeeder__supplementalLibraryRequestWithError___block_invoke_9;
    v6[3] = &unk_24CAB89F0;
    v7 = *(id *)(a1 + 40);
    objc_msgSend(v5, "setUniversalStoreIdentifiersWithBlock:", v6);

  }
}

void __60__MPCSonicQueueFeeder__supplementalLibraryRequestWithError___block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setCloudID:", objc_msgSend(v2, "cloudID"));

}

void __60__MPCSonicQueueFeeder__supplementalLibraryRequestWithError___block_invoke_9(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "globalPlaylistID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setGlobalPlaylistID:", v4);

  objc_msgSend(*(id *)(a1 + 32), "universalCloudLibraryID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUniversalCloudLibraryID:", v5);

  objc_msgSend(v6, "setPurchasedAdamID:", objc_msgSend(*(id *)(a1 + 32), "purchasedAdamID"));
}

void __60__MPCSonicQueueFeeder__supplementalLibraryRequestWithError___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setCloudID:", objc_msgSend(v2, "cloudID"));

}

void __60__MPCSonicQueueFeeder__supplementalLibraryRequestWithError___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "universalCloudLibraryID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUniversalCloudLibraryID:", v4);

  objc_msgSend(v5, "setPurchasedAdamID:", objc_msgSend(*(id *)(a1 + 32), "purchasedAdamID"));
}

void __60__MPCSonicQueueFeeder__supplementalLibraryRequestWithError___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setCloudID:", objc_msgSend(v2, "cloudID"));

}

void __60__MPCSonicQueueFeeder__supplementalLibraryRequestWithError___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "globalPlaylistID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGlobalPlaylistID:", v5);

  objc_msgSend(*(id *)(a1 + 32), "universalCloudLibraryID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUniversalCloudLibraryID:", v6);

}

void __54__MPCSonicQueueFeeder_loadPlaybackContext_completion___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a2;
  if (objc_msgSend(a3, "intersectsSet:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

uint64_t __54__MPCSonicQueueFeeder_loadPlaybackContext_completion___block_invoke_129(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __55__MPCSonicQueueFeeder_modelPlayEventForItem_inSection___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  int v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a2;
  v7 = a3;
  v8 = *(id *)(a1 + 32);
  if (v8 == v17)
  {

  }
  else
  {
    v9 = objc_msgSend(v17, "isEqual:", v8);

    if (!v9)
      goto LABEL_12;
  }
  v10 = *(void **)(*(_QWORD *)(a1 + 40) + 176);
  v11 = objc_msgSend(v7, "section");
  v12 = v10;
  if (objc_msgSend(v12, "numberOfSections") <= v11)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(v12, "sectionAtIndex:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString())
      v14 = v13;
    else
      v14 = 0;

  }
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

  *a4 = 1;
LABEL_12:

}

void __43__MPCSonicQueueFeeder_playbackInfoForItem___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a3;
  if (objc_msgSend(a2, "intersectsSet:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }

}

void __43__MPCSonicQueueFeeder_playbackInfoForItem___block_invoke_5(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a3;
  if (objc_msgSend(a2, "intersectsSet:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }

}

+ (BOOL)usesIdentifierRegistry
{
  return 0;
}

@end
