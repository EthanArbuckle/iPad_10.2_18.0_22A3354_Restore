@implementation MPCAssistantQueryPlaybackQueue

- (MPCAssistantQueryPlaybackQueue)initWithContextID:(id)a3 query:(id)a4
{
  id v7;
  MPCAssistantQueryPlaybackQueue *v8;
  MPCAssistantQueryPlaybackQueue *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MPCAssistantQueryPlaybackQueue;
  v8 = -[MPCAssistantPlaybackQueue initWithContextID:](&v11, sel_initWithContextID_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_query, a4);

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)MPCAssistantQueryPlaybackQueue;
  -[MPCAssistantQueryPlaybackQueue description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ query=%@"), v4, self->_query);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)getPlaybackQueueWithDestination:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int IsLocalOrigin;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  MPCAssistantQueryPlaybackQueue *v24;
  id v25;
  _QWORD v26[5];

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDDC8F8]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MPCAssistantQueryPlaybackQueue: %@"), self->_query);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLabel:", v9);

  objc_msgSend(v8, "setLegacyMediaQuery:forTransport:", self->_query, 1);
  objc_msgSend(MEMORY[0x24BDDC9E0], "identityKind");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setItemKind:", v10);

  v11 = MEMORY[0x24BDAC760];
  if (self->_firstItem)
  {
    v12 = objc_alloc(MEMORY[0x24BDDC758]);
    objc_msgSend(MEMORY[0x24BDDC9E0], "identityKind");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v11;
    v26[1] = 3221225472;
    v26[2] = __77__MPCAssistantQueryPlaybackQueue_getPlaybackQueueWithDestination_completion___block_invoke;
    v26[3] = &unk_24CAB8A40;
    v26[4] = self;
    v14 = (void *)objc_msgSend(v12, "initWithSource:modelKind:block:", CFSTR("MPCAssistant"), v13, v26);

  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v8, "playbackIntentWithStartItemIdentifiers:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (self->_shuffleType == 1)
    objc_msgSend(v15, "setShuffleMode:", 1);
  if (!_os_feature_enabled_impl())
    goto LABEL_14;
  objc_msgSend(v6, "outputDeviceUIDs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "count"))
  {
    if (objc_msgSend(v6, "origin"))
    {
      objc_msgSend(v6, "origin");
      IsLocalOrigin = MROriginIsLocalOrigin();

      if (!IsLocalOrigin)
        goto LABEL_9;
    }
    else
    {

    }
LABEL_14:
    v18 = 2;
    goto LABEL_15;
  }

LABEL_9:
  v18 = 3;
LABEL_15:
  v22[0] = v11;
  v22[1] = 3221225472;
  v22[2] = __77__MPCAssistantQueryPlaybackQueue_getPlaybackQueueWithDestination_completion___block_invoke_3;
  v22[3] = &unk_24CAB5718;
  v24 = self;
  v25 = v7;
  v23 = v16;
  v20 = v16;
  v21 = v7;
  objc_msgSend(v20, "getRemotePlaybackQueueWithDestination:completion:", v18, v22);

}

- (MPMediaQuery)query
{
  return self->_query;
}

- (MPMediaItem)firstItem
{
  return self->_firstItem;
}

- (void)setFirstItem:(id)a3
{
  objc_storeStrong((id *)&self->_firstItem, a3);
}

- (int64_t)shuffleType
{
  return self->_shuffleType;
}

- (void)setShuffleType:(int64_t)a3
{
  self->_shuffleType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstItem, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

void __77__MPCAssistantQueryPlaybackQueue_getPlaybackQueueWithDestination_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  v4 = a2;
  objc_msgSend(v3, "mediaLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __77__MPCAssistantQueryPlaybackQueue_getPlaybackQueueWithDestination_completion___block_invoke_2;
  v7[3] = &unk_24CAB8980;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "setLibraryIdentifiersWithDatabaseID:block:", v6, v7);

}

void __77__MPCAssistantQueryPlaybackQueue_getPlaybackQueueWithDestination_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void (*v6)(void);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v5 = a2;
  v13 = v5;
  if (a3)
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    if (!objc_msgSend(objc_retainAutorelease(v5), "_mediaRemotePlaybackQueue"))
    {
      v11 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 66, CFSTR("Failed to getRemotePlaybackQueue for intent: %@"), *(_QWORD *)(a1 + 32), v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v12);

      goto LABEL_6;
    }
    objc_msgSend(*(id *)(a1 + 40), "shouldOverrideManuallyCuratedQueue");
    MRSystemAppPlaybackQueueSetShouldOverrideManuallyCuratedQueue();
    objc_msgSend(*(id *)(a1 + 40), "shouldImmediatelyStartPlayback");
    MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback();
    objc_msgSend(*(id *)(a1 + 40), "siriRecommendationID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    MRSystemAppPlaybackQueueSetSiriRecommendationIdentifier();

    objc_msgSend(*(id *)(a1 + 40), "siriAssetInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    MRSystemAppPlaybackQueueSetSiriAssetInfo();

    objc_msgSend(*(id *)(a1 + 40), "featureName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    MRSystemAppPlaybackQueueSetFeatureName();

    objc_msgSend(*(id *)(a1 + 40), "siriWHAMetricsInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    MRSystemAppPlaybackQueueSetSiriWHAMetricsInfo();

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v6();
LABEL_6:

}

void __77__MPCAssistantQueryPlaybackQueue_getPlaybackQueueWithDestination_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  v3 = a2;
  objc_msgSend(v3, "setPersistentID:", objc_msgSend(v2, "persistentID"));

}

+ (id)queryQueueWithContextID:(id)a3 query:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContextID:query:", v7, v6);

  return v8;
}

@end
