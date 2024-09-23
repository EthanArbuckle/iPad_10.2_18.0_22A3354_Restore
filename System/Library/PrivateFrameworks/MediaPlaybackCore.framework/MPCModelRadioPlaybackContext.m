@implementation MPCModelRadioPlaybackContext

- (void)getRemotePlaybackQueueRepresentationWithCompletion:(id)a3
{
  id v4;
  _MPCProtoRadioCreationProperties *v5;
  void *v6;
  void *v7;
  dispatch_queue_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _MPCProtoRadioContentReference *v27;
  _MPCProtoRadioContentReference *v28;
  void *nowPlayingContentReference;
  void *v30;
  void *v31;
  void *v32;
  _MPCProtoRadioContentReference *v33;
  id v34;
  _MPCProtoRadioCreationProperties *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  _QWORD v42[4];
  _MPCProtoRadioCreationProperties *v43;
  MPCModelRadioPlaybackContext *v44;
  id v45;
  _QWORD *v46;
  _QWORD *v47;
  _QWORD block[4];
  id v49;
  _QWORD *v50;
  _QWORD *v51;
  _QWORD v52[4];
  id v53;
  id v54;
  NSObject *v55;
  NSObject *v56;
  MPCModelRadioPlaybackContext *v57;
  _MPCProtoRadioCreationProperties *v58;
  _QWORD *v59;
  _QWORD *v60;
  uint64_t v61;
  id v62;
  _QWORD v63[3];
  char v64;
  _QWORD v65[5];
  id v66;

  v4 = a3;
  v5 = objc_alloc_init(_MPCProtoRadioCreationProperties);
  -[MPCModelRadioPlaybackContext playActivityFeatureName](self, "playActivityFeatureName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && v5)
    objc_storeStrong((id *)&v5->_playActivityFeatureName, v6);
  -[MPCModelRadioPlaybackContext playActivityQueueGroupingID](self, "playActivityQueueGroupingID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && v5)
    objc_storeStrong((id *)&v5->_playActivityQueueGroupingID, v7);
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x3032000000;
  v65[3] = __Block_byref_object_copy__4157;
  v65[4] = __Block_byref_object_dispose__4158;
  v66 = 0;
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x2020000000;
  v64 = 1;
  v8 = dispatch_queue_create("com.apple.MediaPlaybackCore.MPCModelRadioPlaybackContext.MPCPlaybackQueue.serialQueue", 0);
  v9 = dispatch_group_create();
  -[MPCModelRadioPlaybackContext playbackRequestEnvironment](self, "playbackRequestEnvironment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v38 = v7;
  v39 = v6;
  v37 = v4;
  if (v11)
  {
    v41 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEC8A58], "activeAccount");
    v41 = (id)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x24BEC8A60], "defaultIdentityStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0;
  objc_msgSend(v13, "getPropertiesForUserIdentity:error:", v41, &v62);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v62;
  v36 = v14;
  objc_msgSend(v14, "DSID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "unsignedLongLongValue");

  if (v16)
  {
    v17 = (void *)MEMORY[0x24BEC8A58];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "specificAccountWithDSID:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "identityAllowingDelegation:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    dispatch_group_enter(v9);
    v52[0] = MEMORY[0x24BDAC760];
    v52[1] = 3221225472;
    v52[2] = __101__MPCModelRadioPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke;
    v52[3] = &unk_24CAB30C0;
    v53 = v13;
    v21 = v20;
    v54 = v21;
    v61 = v16;
    v55 = v9;
    v59 = v65;
    v60 = v63;
    v56 = v8;
    v57 = self;
    v58 = v5;
    objc_msgSend(v53, "getDelegationUUIDsForUserIdentity:completionHandler:", v21, v52);

  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __101__MPCModelRadioPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_4;
    block[3] = &unk_24CABA108;
    v50 = v65;
    v49 = v40;
    v51 = v63;
    dispatch_group_async(v9, v8, block);
    v21 = v49;
  }

  -[MPCModelRadioPlaybackContext seedContentReference](self, "seedContentReference");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "ICRadioContentReference");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    -[MPCModelRadioPlaybackContext radioStation](self, "radioStation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "identifiers");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "radio");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stationStringID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v26, "length") && v5)
      objc_storeStrong((id *)&v5->_radioStationID, v26);
    -[MPCModelRadioPlaybackContext stationURL](self, "stationURL");
    v33 = (_MPCProtoRadioContentReference *)objc_claimAutoreleasedReturnValue();
    v28 = v33;
    if (!v33)
      goto LABEL_27;
    -[_MPCProtoRadioContentReference absoluteString](v33, "absoluteString");
    nowPlayingContentReference = (void *)objc_claimAutoreleasedReturnValue();
    if (nowPlayingContentReference && v5)
      objc_storeStrong((id *)&v5->_radioStationURLString, nowPlayingContentReference);
    goto LABEL_26;
  }
  _MPCProtoRadioContentReferenceFromICRadioContentReference(v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_storeStrong((id *)&v5->_seedContentReference, v24);

  -[MPCModelRadioPlaybackContext nowPlayingContentReference](self, "nowPlayingContentReference");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "ICRadioContentReference");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    _MPCProtoRadioContentReferenceFromICRadioContentReference(v26);
    v27 = (_MPCProtoRadioContentReference *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (!v5)
    {
LABEL_27:

      goto LABEL_28;
    }
    v28 = v27;
    nowPlayingContentReference = v5->_nowPlayingContentReference;
    v5->_nowPlayingContentReference = v28;
LABEL_26:

    goto LABEL_27;
  }
LABEL_28:

  v42[0] = MEMORY[0x24BDAC760];
  v42[1] = 3221225472;
  v42[2] = __101__MPCModelRadioPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_5;
  v42[3] = &unk_24CAB92D0;
  v43 = v5;
  v44 = self;
  v45 = v37;
  v46 = v63;
  v47 = v65;
  v34 = v37;
  v35 = v5;
  dispatch_group_notify(v9, v8, v42);

  _Block_object_dispose(v63, 8);
  _Block_object_dispose(v65, 8);

}

void __101__MPCModelRadioPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char *v11;
  uint64_t quot;
  lldiv_t v13;
  uint64_t v14;
  const UInt8 *v15;
  __CFString *v16;
  void *v17;
  char v18;
  char v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  __int128 v30;
  uint64_t v31;
  char v32;
  char v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = *(void **)(a1 + 32);
    v34 = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v34, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addDelegationUUIDs:forUserIdentity:completionHandler:", v8, *(_QWORD *)(a1 + 40), 0);

    v4 = (void *)v6;
  }
  +[MPCPlaybackAccountManager sharedManager](MPCPlaybackAccountManager, "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 96);
  v11 = (char *)&v35 + 1;
  quot = v10;
  do
  {
    v13 = lldiv(quot, 10);
    quot = v13.quot;
    if (v13.rem >= 0)
      LOBYTE(v14) = v13.rem;
    else
      v14 = -v13.rem;
    *(v11 - 2) = v14 + 48;
    v15 = (const UInt8 *)(v11 - 2);
    --v11;
  }
  while (v13.quot);
  if (v10 < 0)
  {
    *(v11 - 2) = 45;
    v15 = (const UInt8 *)(v11 - 2);
  }
  v16 = (__CFString *)CFStringCreateWithBytes(0, v15, (char *)&v35 - (char *)v15, 0x8000100u, 0);
  objc_msgSend(v9, "accountForDSID:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "hasCatalogPlaybackCapability");
  v19 = objc_msgSend(v17, "hasDelegationCapability");
  v20 = *(void **)(a1 + 48);
  v21 = *(NSObject **)(a1 + 56);
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __101__MPCModelRadioPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_2;
  v24[3] = &unk_24CAB3098;
  v31 = *(_QWORD *)(a1 + 96);
  v32 = v18;
  v33 = v19;
  v25 = v4;
  v26 = v17;
  v30 = *(_OWORD *)(a1 + 80);
  v27 = *(_QWORD *)(a1 + 64);
  v28 = v20;
  v29 = *(id *)(a1 + 72);
  v22 = v17;
  v23 = v4;
  dispatch_group_async(v28, v21, v24);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __101__MPCModelRadioPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  uint64_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(_QWORD *)(v2 + 40);
  v3 = (id *)(v2 + 40);
  if (!v4)
    objc_storeStrong(v3, *(id *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
}

void __101__MPCModelRadioPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_5(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v2 = objc_alloc(MEMORY[0x24BDDC728]);
    objc_msgSend(*(id *)(a1 + 32), "data");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v8 = (id)objc_msgSend(v2, "initWithIdentifier:data:", CFSTR("com.apple.music.playbackqueue.radio"), v3);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (id)objc_msgSend(v2, "initWithIdentifier:data:", CFSTR("com.apple.music.playbackqueue.radio"), v5);

    }
    objc_msgSend(v8, "setRequestingImmediatePlayback:", 1);
    objc_msgSend(*(id *)(a1 + 40), "playActivityRecommendationData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v6, 4);
    else
      v7 = 0;
    objc_msgSend(v8, "setSiriRecommendationIdentifier:", v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    v4 = *(_QWORD *)(a1 + 48);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      (*(void (**)(_QWORD, _QWORD))(v4 + 16))(*(_QWORD *)(a1 + 48), 0);
      return;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MPCError"), 0, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v4 + 16))(v4, 0, v8);
  }

}

void __101__MPCModelRadioPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  void *v12;
  _MPCProtoDelegateInfoTokenB *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  __int128 v19;
  id v20;

  +[_MPCProtoDelegateInfo currentDeviceDelegateInfo](_MPCProtoDelegateInfo, "currentDeviceDelegateInfo");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v4 = *(_QWORD *)(a1 + 88);
    *(_BYTE *)(v2 + 116) |= 1u;
    *(_QWORD *)(v2 + 32) = v4;
  }
  -[_MPCProtoDelegateInfo setUuid:](v2, *(void **)(a1 + 32));
  if (*(_BYTE *)(a1 + 96))
  {
    if (v3)
    {
      PBRepeatedInt32Add();
      if (!*(_BYTE *)(a1 + 97))
        goto LABEL_19;
      PBRepeatedInt32Add();
    }
    else if (!*(_BYTE *)(a1 + 97))
    {
      goto LABEL_19;
    }
    v5 = *(void **)(a1 + 40);
    v20 = 0;
    objc_msgSend(v5, "delegateTokenAWithError:", &v20);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v20;
    v8 = v20;
    if (v6)
    {
      if (v3)
        PBRepeatedInt32Add();
      -[_MPCProtoDelegateInfo setTokenA:]((uint64_t)v3, v6);
    }
    else
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v11 = *(_QWORD *)(v9 + 40);
      v10 = (id *)(v9 + 40);
      if (!v11)
        objc_storeStrong(v10, v7);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
    }
    objc_msgSend(*(id *)(a1 + 48), "delegateTokenB");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = -[_MPCProtoDelegateInfoTokenB initWithData:]([_MPCProtoDelegateInfoTokenB alloc], "initWithData:", v12);
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 56));
      v14 = *(void **)(a1 + 40);
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __101__MPCModelRadioPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_3;
      v16[3] = &unk_24CAB3070;
      v17 = v3;
      v19 = *(_OWORD *)(a1 + 72);
      v18 = *(id *)(a1 + 56);
      objc_msgSend(v14, "getDelegateTokenEWithTokenB:completion:", v13, v16);

    }
  }
  else if (v3)
  {
    PBRepeatedInt32Add();
  }
LABEL_19:
  v15 = *(_QWORD *)(a1 + 64);
  if (v15)
    objc_storeStrong((id *)(v15 + 8), v3);

}

void __101__MPCModelRadioPlaybackContext_MPCPlaybackQueue__getRemotePlaybackQueueRepresentationWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (v5)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(_QWORD *)(v6 + 40);
    v7 = (id *)(v6 + 40);
    if (!v8)
      objc_storeStrong(v7, a3);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    -[_MPCProtoDelegateInfo setTokenE:](*(_QWORD *)(a1 + 32), v9);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

- (MPCModelRadioPlaybackContext)init
{
  MPCModelRadioPlaybackContext *v2;
  uint64_t v3;
  MPCPlaybackRequestEnvironment *playbackRequestEnvironment;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPCModelRadioPlaybackContext;
  v2 = -[MPCModelRadioPlaybackContext init](&v6, sel_init);
  if (v2)
  {
    +[MPCPlaybackRequestEnvironment activeAccountRequestEnvironment](MPCPlaybackRequestEnvironment, "activeAccountRequestEnvironment");
    v3 = objc_claimAutoreleasedReturnValue();
    playbackRequestEnvironment = v2->_playbackRequestEnvironment;
    v2->_playbackRequestEnvironment = (MPCPlaybackRequestEnvironment *)v3;

  }
  return v2;
}

- (MPCModelRadioPlaybackContext)initWithCoder:(id)a3
{
  id v4;
  MPCModelRadioPlaybackContext *v5;
  uint64_t v6;
  MPModelRadioStation *radioStation;
  uint64_t v8;
  NSURL *stationURL;
  uint64_t v10;
  MPCModelRadioContentReference *nowPlayingContentReference;
  uint64_t v12;
  MPCModelRadioContentReference *seedContentReference;
  uint64_t v14;
  MPCPlaybackRequestEnvironment *playbackRequestEnvironment;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MPCModelRadioPlaybackContext;
  v5 = -[MPCModelRadioPlaybackContext initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Station"));
    v6 = objc_claimAutoreleasedReturnValue();
    radioStation = v5->_radioStation;
    v5->_radioStation = (MPModelRadioStation *)v6;

    v5->_continueListeningStation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ContinueListening"));
    v5->_continueListeningMaxQueueReferences = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CL_MaxQueueReferences"));
    v5->_continueListeningPrefetchThreshold = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CL_PrefetchThreshold"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("StationURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    stationURL = v5->_stationURL;
    v5->_stationURL = (NSURL *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NowPlayingContentReference"));
    v10 = objc_claimAutoreleasedReturnValue();
    nowPlayingContentReference = v5->_nowPlayingContentReference;
    v5->_nowPlayingContentReference = (MPCModelRadioContentReference *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SeedContentReference"));
    v12 = objc_claimAutoreleasedReturnValue();
    seedContentReference = v5->_seedContentReference;
    v5->_seedContentReference = (MPCModelRadioContentReference *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PlaybackRequestEnvironment"));
    v14 = objc_claimAutoreleasedReturnValue();
    playbackRequestEnvironment = v5->_playbackRequestEnvironment;
    v5->_playbackRequestEnvironment = (MPCPlaybackRequestEnvironment *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPCModelRadioPlaybackContext;
  v4 = a3;
  -[MPCModelRadioPlaybackContext encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_radioStation, CFSTR("Station"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_continueListeningStation, CFSTR("ContinueListening"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_stationURL, CFSTR("StationURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_nowPlayingContentReference, CFSTR("NowPlayingContentReference"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_seedContentReference, CFSTR("SeedContentReference"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_playbackRequestEnvironment, CFSTR("PlaybackRequestEnvironment"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MPCModelRadioPlaybackContext;
  v4 = -[MPCModelRadioPlaybackContext copyWithZone:](&v13, sel_copyWithZone_, a3);
  -[MPCModelRadioPlaybackContext playbackRequestEnvironment](self, "playbackRequestEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlaybackRequestEnvironment:", v5);

  -[MPCModelRadioPlaybackContext nowPlayingContentReference](self, "nowPlayingContentReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNowPlayingContentReference:", v6);

  -[MPCModelRadioPlaybackContext seedContentReference](self, "seedContentReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSeedContentReference:", v7);

  -[MPCModelRadioPlaybackContext radioStation](self, "radioStation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRadioStation:", v8);

  -[MPCModelRadioPlaybackContext stationURL](self, "stationURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStationURL:", v9);

  objc_msgSend(v4, "setContinueListeningStation:", -[MPCModelRadioPlaybackContext continueListeningStation](self, "continueListeningStation"));
  objc_msgSend(v4, "setContinueListeningMaxQueueReferences:", -[MPCModelRadioPlaybackContext continueListeningMaxQueueReferences](self, "continueListeningMaxQueueReferences"));
  objc_msgSend(v4, "setContinueListeningPrefetchThreshold:", -[MPCModelRadioPlaybackContext continueListeningPrefetchThreshold](self, "continueListeningPrefetchThreshold"));
  -[MPCModelRadioPlaybackContext continueListeningQueueProvider](self, "continueListeningQueueProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContinueListeningQueueProvider:", v10);

  -[MPCModelRadioPlaybackContext delegateTokenB](self, "delegateTokenB");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegateTokenB:", v11);

  return v4;
}

- (Class)queueFeederClass
{
  return (Class)objc_opt_class();
}

- (int64_t)shuffleType
{
  return 0;
}

- (int64_t)repeatType
{
  return 0;
}

- (int64_t)queueEndAction
{
  return 2;
}

- (id)descriptionComponents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  MPCModelRadioPlaybackContext *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MPCModelRadioPlaybackContext;
  -[MPCModelRadioPlaybackContext descriptionComponents](&v14, sel_descriptionComponents);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[MPCModelRadioPlaybackContext playbackRequestEnvironment](self, "playbackRequestEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("playbackRequestEnvironment"));

  objc_msgSend(v4, "removeObjectForKey:", CFSTR("repeat/shuffle"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("queueEndAction"));
  if (self->_continueListeningStation)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("continueListening"));
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDDC928];
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __53__MPCModelRadioPlaybackContext_descriptionComponents__block_invoke;
    v11 = &unk_24CABA1D0;
    v12 = v4;
    v13 = self;
    objc_msgSend(v6, "performWithoutEnforcement:", &v8);

  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_delegateTokenB, CFSTR("delegateTokenB"), v8, v9, v10, v11);
  return v4;
}

- (id)userIdentity
{
  return -[MPCPlaybackRequestEnvironment userIdentity](self->_playbackRequestEnvironment, "userIdentity");
}

- (void)setUserIdentity:(id)a3
{
  id v4;
  MPCPlaybackRequestEnvironment *v5;
  MPCPlaybackRequestEnvironment *playbackRequestEnvironment;
  id v7;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BEC8A58], "activeAccount");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v4;
  +[MPCPlaybackRequestEnvironment requestEnvironmentWithUserIdentity:](MPCPlaybackRequestEnvironment, "requestEnvironmentWithUserIdentity:", v4);
  v5 = (MPCPlaybackRequestEnvironment *)objc_claimAutoreleasedReturnValue();
  playbackRequestEnvironment = self->_playbackRequestEnvironment;
  self->_playbackRequestEnvironment = v5;

}

- (BOOL)continueListeningStation
{
  return self->_continueListeningStation;
}

- (void)setContinueListeningStation:(BOOL)a3
{
  self->_continueListeningStation = a3;
}

- (MPCContinueListeningRadioQueueProviding)continueListeningQueueProvider
{
  return (MPCContinueListeningRadioQueueProviding *)objc_loadWeakRetained((id *)&self->_continueListeningQueueProvider);
}

- (void)setContinueListeningQueueProvider:(id)a3
{
  objc_storeWeak((id *)&self->_continueListeningQueueProvider, a3);
}

- (int64_t)continueListeningMaxQueueReferences
{
  return self->_continueListeningMaxQueueReferences;
}

- (void)setContinueListeningMaxQueueReferences:(int64_t)a3
{
  self->_continueListeningMaxQueueReferences = a3;
}

- (int64_t)continueListeningPrefetchThreshold
{
  return self->_continueListeningPrefetchThreshold;
}

- (void)setContinueListeningPrefetchThreshold:(int64_t)a3
{
  self->_continueListeningPrefetchThreshold = a3;
}

- (MPCModelRadioContentReference)nowPlayingContentReference
{
  return self->_nowPlayingContentReference;
}

- (void)setNowPlayingContentReference:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (MPCModelRadioContentReference)seedContentReference
{
  return self->_seedContentReference;
}

- (void)setSeedContentReference:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (MPModelRadioStation)radioStation
{
  return self->_radioStation;
}

- (void)setRadioStation:(id)a3
{
  objc_storeStrong((id *)&self->_radioStation, a3);
}

- (NSURL)stationURL
{
  return self->_stationURL;
}

- (void)setStationURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (MPCPlaybackRequestEnvironment)playbackRequestEnvironment
{
  return self->_playbackRequestEnvironment;
}

- (void)setPlaybackRequestEnvironment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSData)delegateTokenB
{
  return self->_delegateTokenB;
}

- (void)setDelegateTokenB:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateTokenB, 0);
  objc_storeStrong((id *)&self->_playbackRequestEnvironment, 0);
  objc_storeStrong((id *)&self->_stationURL, 0);
  objc_storeStrong((id *)&self->_radioStation, 0);
  objc_storeStrong((id *)&self->_seedContentReference, 0);
  objc_storeStrong((id *)&self->_nowPlayingContentReference, 0);
  objc_destroyWeak((id *)&self->_continueListeningQueueProvider);
}

void __53__MPCModelRadioPlaybackContext_descriptionComponents__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[6];

  v17[5] = *MEMORY[0x24BDAC8D0];
  v15 = *(void **)(a1 + 32);
  v16[0] = CFSTR("nowPlaying");
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(v2 + 176);
  if (v3)
  {
    v4 = *(_QWORD *)(v2 + 176);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v4 = objc_claimAutoreleasedReturnValue();
    v2 = *(_QWORD *)(a1 + 40);
  }
  v14 = (void *)v4;
  v17[0] = v4;
  v16[1] = CFSTR("seed");
  v5 = *(void **)(v2 + 184);
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = *(_QWORD *)(a1 + 40);
  }
  v17[1] = v6;
  v16[2] = CFSTR("stationID");
  objc_msgSend(*(id *)(v2 + 192), "identifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[2] = v8;
  v16[3] = CFSTR("stationName");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 192), "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[3] = v10;
  v16[4] = CFSTR("stationURL");
  v11 = *(void **)(*(_QWORD *)(a1 + 40) + 200);
  v12 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[4] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addEntriesFromDictionary:", v13);

  if (v11)
  {
    if (v9)
      goto LABEL_14;
  }
  else
  {

    if (v9)
      goto LABEL_14;
  }

LABEL_14:
  if (!v7)

  if (v5)
  {
    if (v3)
      return;
LABEL_22:

    return;
  }

  if (!v3)
    goto LABEL_22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)getSharedListeningTracklistWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char *v10;
  uint64_t quot;
  lldiv_t v12;
  uint64_t v13;
  const UInt8 *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MPCModelRadioPlaybackContext seedContentReference](self, "seedContentReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "referenceModelObjectIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "universalStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "purchasedAdamID");
  if (v8 || (v8 = objc_msgSend(v7, "subscriptionAdamID")) != 0 || (v8 = objc_msgSend(v7, "adamID")) != 0)
  {
    v9 = (void *)MEMORY[0x24BEC89A8];
    v10 = (char *)&v30 + 1;
    quot = v8;
    do
    {
      v12 = lldiv(quot, 10);
      quot = v12.quot;
      if (v12.rem >= 0)
        LOBYTE(v13) = v12.rem;
      else
        v13 = -v12.rem;
      *(v10 - 2) = v13 + 48;
      v14 = (const UInt8 *)(v10 - 2);
      --v10;
    }
    while (v12.quot);
    if (v8 < 0)
    {
      *(v10 - 2) = 45;
      v14 = (const UInt8 *)(v10 - 2);
    }
    v15 = (__CFString *)CFStringCreateWithBytes(0, v14, (char *)&v30 - (char *)v14, 0x8000100u, 0);
    objc_msgSend(v9, "itemWithMediaIdentifier:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x24BEC89A0];
    -[MPCModelRadioPlaybackContext playActivityFeatureName](self, "playActivityFeatureName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "radioContainerWithSeedItem:featureName:", v16, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }
  -[MPCModelRadioPlaybackContext radioStation](self, "radioStation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "identifiers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "radio");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stationStringID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = (void *)MEMORY[0x24BEC89A0];
    -[MPCModelRadioPlaybackContext playActivityFeatureName](self, "playActivityFeatureName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "radioContainerWithMediaIdentifier:featureName:", v23, v25);
    v26 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v26;
  }
  objc_msgSend(MEMORY[0x24BDD1768], "progressWithTotalUnitCount:", 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v28 = objc_alloc_init(MEMORY[0x24BE65C68]);
    objc_msgSend(v28, "appendSection:", v19);
    (*((void (**)(id, id, _QWORD, _QWORD))v4 + 2))(v4, v28, 0, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicPlaybackContextSharePlayError"), 9, CFSTR("Unsupported content [Radio] %@"), self);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, id))v4 + 2))(v4, 0, 0, v28);
  }

  objc_msgSend(v27, "setCompletedUnitCount:", 1);
  return v27;
}

@end
