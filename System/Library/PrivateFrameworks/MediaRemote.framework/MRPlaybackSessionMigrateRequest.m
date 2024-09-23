@implementation MRPlaybackSessionMigrateRequest

- (MRPlaybackSessionMigrateRequest)init
{
  _MRPlaybackSessionMigrateRequestProtobuf *v3;
  MRPlaybackSessionMigrateRequest *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(_MRPlaybackSessionMigrateRequestProtobuf);
  v4 = -[MRPlaybackSessionMigrateRequest initWithProtobuf:](self, "initWithProtobuf:", v3);

  if (v4)
  {
    -[MRPlaybackSessionMigrateRequest setPlayerOptions:](v4, "setPlayerOptions:", 58);
    -[MRPlaybackSessionMigrateRequest setEndpointOptions:](v4, "setEndpointOptions:", 58);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRPlaybackSessionMigrateRequest setRequestID:](v4, "setRequestID:", v6);

  }
  return v4;
}

- (MRPlaybackSessionMigrateRequest)initWithProtobuf:(id)a3
{
  id v5;
  MRPlaybackSessionMigrateRequest *v6;
  MRPlaybackSessionMigrateRequest *v7;
  MRPlaybackSessionMigrateRequest *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)MRPlaybackSessionMigrateRequest;
    v6 = -[MRPlaybackSessionMigrateRequest init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_protobuf, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (MRPlaybackSessionMigrateRequest)initWithData:(id)a3
{
  id v4;
  _MRPlaybackSessionMigrateRequestProtobuf *v5;
  MRPlaybackSessionMigrateRequest *v6;

  v4 = a3;
  if (v4)
  {
    v5 = -[_MRPlaybackSessionMigrateRequestProtobuf initWithData:]([_MRPlaybackSessionMigrateRequestProtobuf alloc], "initWithData:", v4);
    v6 = -[MRPlaybackSessionMigrateRequest initWithProtobuf:](self, "initWithProtobuf:", v5);

  }
  else
  {
    v6 = -[MRPlaybackSessionMigrateRequest initWithProtobuf:](self, "initWithProtobuf:", 0);
  }

  return v6;
}

- (void)setRequestID:(id)a3
{
  MRPlaybackSessionMigrateRequest *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[_MRPlaybackSessionMigrateRequestProtobuf setRequestID:](v4->_protobuf, "setRequestID:", v5);
  objc_sync_exit(v4);

}

- (NSString)requestID
{
  MRPlaybackSessionMigrateRequest *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[_MRPlaybackSessionMigrateRequestProtobuf requestID](v2->_protobuf, "requestID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (void)setInitiator:(id)a3
{
  MRPlaybackSessionMigrateRequest *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[_MRPlaybackSessionMigrateRequestProtobuf setInitiator:](v4->_protobuf, "setInitiator:", v5);
  objc_sync_exit(v4);

}

- (void)setPlayerPath:(id)a3
{
  MRPlaybackSessionMigrateRequest *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(v6, "protobuf");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRPlaybackSessionMigrateRequestProtobuf setPlayerPath:](v4->_protobuf, "setPlayerPath:", v5);

  objc_sync_exit(v4);
}

- (MRPlayerPath)playerPath
{
  MRPlaybackSessionMigrateRequest *v2;
  MRPlayerPath *v3;
  void *v4;
  MRPlayerPath *v5;

  v2 = self;
  objc_sync_enter(v2);
  v3 = [MRPlayerPath alloc];
  -[_MRPlaybackSessionMigrateRequestProtobuf playerPath](v2->_protobuf, "playerPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MRPlayerPath initWithProtobuf:](v3, "initWithProtobuf:", v4);

  objc_sync_exit(v2);
  return v5;
}

- (void)setResolvedPlayerPath:(id)a3
{
  MRPlaybackSessionMigrateRequest *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(v6, "protobuf");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRPlaybackSessionMigrateRequestProtobuf setResolvedPlayerPath:](v4->_protobuf, "setResolvedPlayerPath:", v5);

  objc_sync_exit(v4);
}

- (MRPlayerPath)resolvedPlayerPath
{
  MRPlaybackSessionMigrateRequest *v2;
  MRPlayerPath *v3;
  void *v4;
  MRPlayerPath *v5;

  v2 = self;
  objc_sync_enter(v2);
  v3 = [MRPlayerPath alloc];
  -[_MRPlaybackSessionMigrateRequestProtobuf resolvedPlayerPath](v2->_protobuf, "resolvedPlayerPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MRPlayerPath initWithProtobuf:](v3, "initWithProtobuf:", v4);

  objc_sync_exit(v2);
  return v5;
}

- (NSString)initiator
{
  MRPlaybackSessionMigrateRequest *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[_MRPlaybackSessionMigrateRequestProtobuf initiator](v2->_protobuf, "initiator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (void)setPlayerOptions:(int64_t)a3
{
  MRPlaybackSessionMigrateRequest *obj;

  obj = self;
  objc_sync_enter(obj);
  -[_MRPlaybackSessionMigrateRequestProtobuf setPlayerOptions:](obj->_protobuf, "setPlayerOptions:", a3);
  objc_sync_exit(obj);

}

- (int64_t)playerOptions
{
  MRPlaybackSessionMigrateRequest *v2;
  int64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[_MRPlaybackSessionMigrateRequestProtobuf playerOptions](v2->_protobuf, "playerOptions");
  objc_sync_exit(v2);

  return v3;
}

- (void)setEndpointOptions:(int64_t)a3
{
  MRPlaybackSessionMigrateRequest *obj;

  obj = self;
  objc_sync_enter(obj);
  -[_MRPlaybackSessionMigrateRequestProtobuf setEndpointOptions:](obj->_protobuf, "setEndpointOptions:", a3);
  objc_sync_exit(obj);

}

- (int64_t)endpointOptions
{
  MRPlaybackSessionMigrateRequest *v2;
  int64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[_MRPlaybackSessionMigrateRequestProtobuf endpointOptions](v2->_protobuf, "endpointOptions");
  objc_sync_exit(v2);

  return v3;
}

- (void)setPlaybackState:(unsigned int)a3
{
  uint64_t v3;
  MRPlaybackSessionMigrateRequest *obj;

  v3 = *(_QWORD *)&a3;
  obj = self;
  objc_sync_enter(obj);
  -[_MRPlaybackSessionMigrateRequestProtobuf setPlaybackState:](obj->_protobuf, "setPlaybackState:", v3);
  objc_sync_exit(obj);

}

- (unsigned)playbackState
{
  MRPlaybackSessionMigrateRequest *v2;
  unsigned int v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[_MRPlaybackSessionMigrateRequestProtobuf playbackState](v2->_protobuf, "playbackState");
  objc_sync_exit(v2);

  return v3;
}

- (void)setPlaybackPosition:(double)a3
{
  MRPlaybackSessionMigrateRequest *obj;

  obj = self;
  objc_sync_enter(obj);
  -[_MRPlaybackSessionMigrateRequestProtobuf setPlaybackPosition:](obj->_protobuf, "setPlaybackPosition:", a3);
  objc_sync_exit(obj);

}

- (double)playbackPosition
{
  MRPlaybackSessionMigrateRequest *v2;
  double v3;
  double v4;

  v2 = self;
  objc_sync_enter(v2);
  -[_MRPlaybackSessionMigrateRequestProtobuf playbackPosition](v2->_protobuf, "playbackPosition");
  v4 = v3;
  objc_sync_exit(v2);

  return v4;
}

- (void)setPlaybackRate:(double)a3
{
  MRPlaybackSessionMigrateRequest *obj;

  obj = self;
  objc_sync_enter(obj);
  -[_MRPlaybackSessionMigrateRequestProtobuf setPlaybackRate:](obj->_protobuf, "setPlaybackRate:", a3);
  objc_sync_exit(obj);

}

- (double)playbackRate
{
  MRPlaybackSessionMigrateRequest *v2;
  double v3;
  double v4;

  v2 = self;
  objc_sync_enter(v2);
  -[_MRPlaybackSessionMigrateRequestProtobuf playbackRate](v2->_protobuf, "playbackRate");
  v4 = v3;
  objc_sync_exit(v2);

  return v4;
}

- (void)setContentItem:(id)a3
{
  MRPlaybackSessionMigrateRequest *v4;
  MRContentItem *v5;
  void *v6;
  MRContentItem *v7;
  void *Title;
  uint64_t IsAlwaysLive;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = [MRContentItem alloc];
  objc_msgSend(v12, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MRContentItem initWithIdentifier:](v5, "initWithIdentifier:", v6);

  Title = (void *)MRContentItemGetTitle(v12);
  MRContentItemSetTitle(v7, Title);
  IsAlwaysLive = MRContentItemGetIsAlwaysLive(v12);
  MRContentItemSetIsAlwaysLive(v7, IsAlwaysLive);
  v10 = MRContentItemGetIsInTransition(v12);
  MRContentItemSetIsInTransition(v7, v10);
  -[MRContentItem protobufWithEncoding:](v7, "protobufWithEncoding:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRPlaybackSessionMigrateRequestProtobuf setContentItem:](v4->_protobuf, "setContentItem:", v11);

  objc_sync_exit(v4);
}

- (MRContentItem)contentItem
{
  MRPlaybackSessionMigrateRequest *v2;
  MRContentItem *v3;
  void *v4;
  MRContentItem *v5;

  v2 = self;
  objc_sync_enter(v2);
  v3 = [MRContentItem alloc];
  -[_MRPlaybackSessionMigrateRequestProtobuf contentItem](v2->_protobuf, "contentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MRContentItem initWithProtobuf:](v3, "initWithProtobuf:", v4);

  objc_sync_exit(v2);
  return v5;
}

- (void)setPlaybackSessionRequest:(id)a3
{
  MRPlaybackSessionMigrateRequest *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(v6, "protobuf");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRPlaybackSessionMigrateRequestProtobuf setPlaybackSessionRequest:](v4->_protobuf, "setPlaybackSessionRequest:", v5);

  objc_sync_exit(v4);
}

- (MRPlaybackSessionRequest)playbackSessionRequest
{
  MRPlaybackSessionMigrateRequest *v2;
  MRPlaybackSessionRequest *v3;
  void *v4;
  MRPlaybackSessionRequest *v5;

  v2 = self;
  objc_sync_enter(v2);
  v3 = [MRPlaybackSessionRequest alloc];
  -[_MRPlaybackSessionMigrateRequestProtobuf playbackSessionRequest](v2->_protobuf, "playbackSessionRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MRPlaybackSessionRequest initWithProtobuf:](v3, "initWithProtobuf:", v4);

  objc_sync_exit(v2);
  return v5;
}

- (_MRPlaybackSessionMigrateRequestProtobuf)protobuf
{
  MRPlaybackSessionMigrateRequest *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[_MRPlaybackSessionMigrateRequestProtobuf copy](v2->_protobuf, "copy");
  objc_sync_exit(v2);

  return (_MRPlaybackSessionMigrateRequestProtobuf *)v3;
}

- (NSData)protobufData
{
  MRPlaybackSessionMigrateRequest *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[_MRPlaybackSessionMigrateRequestProtobuf data](v2->_protobuf, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (NSData *)v3;
}

- (NSString)report
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v27;
  MRPlaybackSessionMigrateRequest *v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v28 = self;
  objc_sync_enter(v28);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("\nPlayback Session Migration Report\n"));
  objc_msgSend(v2, "appendString:", CFSTR("----------------------------------\n"));
  -[MRPlaybackSessionMigrateRequest requestID](v28, "requestID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("Identifier: %@\n"), v3);

  -[MRPlaybackSessionMigrateRequest analyticsPayload]((uint64_t)v28);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRPlaybackSessionMigrateRequest playerPath](v28, "playerPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("playerPath = %@\n"), v5);

  -[MRPlaybackSessionMigrateRequest resolvedPlayerPath](v28, "resolvedPlayerPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("resolvedPlayerPath = %@\n"), v6);

  -[_MRPlaybackSessionMigrateRequestProtobuf events](v28->_protobuf, "events");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mr_map:", &__block_literal_global_38);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v4, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v11);

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v10;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v35 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "appendFormat:", CFSTR("%@: %@\n"), v15, v16);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v12);
  }

  objc_msgSend(v2, "appendString:", CFSTR("Events:\n"));
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[_MRPlaybackSessionMigrateRequestProtobuf events](v28->_protobuf, "events");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v31 != v19)
          objc_enumerationMutation(v17);
        v21 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
        objc_msgSend(v21, "name");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "calculatedDuration");
        objc_msgSend(v2, "appendFormat:", CFSTR(" %@: %.4f seconds\n"), v22, v23);

        objc_msgSend(v21, "error");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          objc_msgSend(v21, "error");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "appendFormat:", CFSTR("  Error: %@\n"), v25);

        }
      }
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v18);
  }

  objc_msgSend(v2, "appendString:", CFSTR("----------------------------------\n"));
  objc_sync_exit(v28);

  return (NSString *)v2;
}

- (id)analyticsPayload
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  unint64_t v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  unint64_t v41;
  __CFString *v42;
  __CFError *v43;
  __CFString *v44;
  void *v45;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _QWORD v53[7];
  _QWORD v54[9];

  v54[7] = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    v18 = 0;
    return v18;
  }
  objc_msgSend(*(id *)(a1 + 8), "events");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mr_first:", &__block_literal_global_76);
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = *(_QWORD *)(a1 + 32);
  v47 = (void *)v3;
  if (v4 == 2)
  {
    objc_msgSend(*(id *)(a1 + 8), "setOriginatorType:", MRAnalyticsCompositionForLocalDevice());
  }
  else if (v4 == 1)
  {
    objc_msgSend(*(id *)(a1 + 8), "setDestinationTypes:", MRAnalyticsCompositionForLocalDevice());
  }
  v53[0] = CFSTR("originator");
  MRAnalyticsDeviceCompositionDescription(objc_msgSend((id)a1, "originatorType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v5;
  v53[1] = CFSTR("destination");
  MRAnalyticsDeviceCompositionDescription(objc_msgSend((id)a1, "destinationTypes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v54[1] = v6;
  v53[2] = CFSTR("duration");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend((id)a1, "duration");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v54[2] = v8;
  v53[3] = CFSTR("initiator");
  objc_msgSend((id)a1, "initiator");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = CFSTR("unknown");
  if (v9)
    v11 = (const __CFString *)v9;
  v54[3] = v11;
  v53[4] = CFSTR("queueSize");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend((id)a1, "playbackSessionSize"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v54[4] = v12;
  v53[5] = CFSTR("failedPlayingAudio");
  if (*(_QWORD *)(a1 + 24))
  {
    v13 = 1;
  }
  else if (*(_QWORD *)(a1 + 16))
  {
    v13 = *(_QWORD *)(a1 + 40) == 0;
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v54[5] = v14;
  v53[6] = CFSTR("type");
  v15 = *(_QWORD *)(a1 + 32);
  if (v15 > 3)
    v16 = CFSTR("addProxDevice");
  else
    v16 = off_1E30C9740[v15];
  v54[6] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  objc_msgSend(*(id *)(a1 + 8), "events");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v49 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        v25 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v24, "calculatedDuration");
        objc_msgSend(v25, "numberWithDouble:");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v24, "name");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringWithFormat:", CFSTR("%@Duration"), v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v26, v29);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v21);
  }

  objc_msgSend(*(id *)(a1 + 8), "events");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "mr_first:", &__block_literal_global_81);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(v31, "error");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v32)
    {
      if (!objc_msgSend((id)a1, "playbackSessionSize"))
        goto LABEL_28;
      v33 = (void *)MEMORY[0x1E0CB37E8];
      v34 = (float)objc_msgSend((id)a1, "playbackSessionSize");
      objc_msgSend(v31, "calculatedDuration");
      objc_msgSend(v33, "numberWithDouble:", v34 / v35);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v32, CFSTR("sendPlaybackSessionThroughput"));
    }

  }
LABEL_28:
  objc_msgSend((id)a1, "playerPath");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "client");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bundleIdentifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v38, CFSTR("appBundle"));

  v39 = CFSTR("LocalDeviceIsGroupable");
  v40 = v47;
  switch(*(_QWORD *)(a1 + 40))
  {
    case 0:
      goto LABEL_49;
    case 1:
      goto LABEL_45;
    case 2:
      v39 = CFSTR("MoreThanOneLogicalDevice");
      goto LABEL_45;
    case 3:
      v39 = CFSTR("UnsupportedType");
      goto LABEL_45;
    case 4:
      v39 = CFSTR("EndpointNotFound");
      goto LABEL_45;
    case 5:
      v39 = CFSTR("SearchFailed");
      goto LABEL_45;
    case 6:
      v39 = CFSTR("MigrateFromGroupNotAllowed");
      goto LABEL_45;
    case 7:
      v39 = CFSTR("MigrateToGroupNotAllowed");
      goto LABEL_45;
    case 8:
      v39 = CFSTR("SetPlaybackNotSupportedOnSource");
      goto LABEL_45;
    case 9:
      v39 = CFSTR("SetPlaybackNotSupportedOnDestination");
      goto LABEL_45;
    case 0xALL:
      v39 = CFSTR("SetPlaybackMismatch");
      goto LABEL_45;
    case 0xBLL:
      v39 = CFSTR("ResolvedPlayerPathIsAirPlay");
      goto LABEL_45;
    case 0xCLL:
      v39 = CFSTR("FailedToBreakGroup");
      goto LABEL_45;
    case 0xDLL:
      v39 = CFSTR("Companion");
      goto LABEL_45;
    case 0xELL:
      v39 = CFSTR("ExpanseFailed");
      goto LABEL_45;
    case 0xFLL:
      v39 = CFSTR("GroupSession");
      goto LABEL_45;
    case 0x10:
      v39 = CFSTR("Other");
      goto LABEL_45;
    default:
      v40 = v47;
LABEL_45:
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v39, CFSTR("fallbackReason"));
      v41 = *(_QWORD *)(a1 + 40) - 1;
      if (v41 > 0xF)
        v42 = 0;
      else
        v42 = *off_1E30C9760[v41];
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v42, CFSTR("fallbackStatus"));

LABEL_49:
      v43 = *(__CFError **)(a1 + 24);
      if (v43)
      {
        v44 = (__CFString *)MRErrorCopyDescription(v43);
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v44, CFSTR("fallbackError"));

      }
      if (v40)
      {
        objc_msgSend(v40, "name", v39);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v45, CFSTR("errorStep"));

      }
      break;
  }
  return v18;
}

id __41__MRPlaybackSessionMigrateRequest_report__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@Duration"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)description
{
  MRPlaybackSessionMigrateRequest *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;

  v2 = self;
  objc_sync_enter(v2);
  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = MRMediaRemotePlaybackSessionMigratePlayerOptionsCopyDescription(-[MRPlaybackSessionMigrateRequest playerOptions](v2, "playerOptions"));
  v5 = MRMediaRemotePlaybackSessionMigrateEndpointOptionsCopyDescription(-[MRPlaybackSessionMigrateRequest endpointOptions](v2, "endpointOptions"));
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("playerOptions = <%@>, endpointOptions = <%@>"), v4, v5);

  if (-[_MRPlaybackSessionMigrateRequestProtobuf hasPlaybackRate](v2->_protobuf, "hasPlaybackRate"))
  {
    -[MRPlaybackSessionMigrateRequest playbackRate](v2, "playbackRate");
    objc_msgSend(v6, "appendFormat:", CFSTR(", playbackRate = <%lf>"), v7);
  }
  if (-[_MRPlaybackSessionMigrateRequestProtobuf hasPlaybackPosition](v2->_protobuf, "hasPlaybackPosition"))
  {
    -[MRPlaybackSessionMigrateRequest playbackPosition](v2, "playbackPosition");
    objc_msgSend(v6, "appendFormat:", CFSTR(", playbackPosition = <%lf>"), v8);
  }
  if (-[_MRPlaybackSessionMigrateRequestProtobuf hasPlaybackState](v2->_protobuf, "hasPlaybackState"))
  {
    v9 = (__CFString *)MRMediaRemoteCopyPlaybackStateDescription(-[MRPlaybackSessionMigrateRequest playbackState](v2, "playbackState"));
    objc_msgSend(v6, "appendFormat:", CFSTR(", playbackState = <%@>"), v9);

  }
  if (-[_MRPlaybackSessionMigrateRequestProtobuf hasContentItem](v2->_protobuf, "hasContentItem"))
  {
    -[MRPlaybackSessionMigrateRequest contentItem](v2, "contentItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MRContentItemCopyMinimalReadableDescription(v10);
    objc_msgSend(v6, "appendFormat:", CFSTR(", item = <%@>"), v11);

  }
  objc_sync_exit(v2);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MRPlaybackSessionMigrateRequest *v3;
  void *v4;
  MRPlaybackSessionMigrateRequest *v5;

  v3 = self;
  objc_sync_enter(v3);
  v4 = (void *)-[_MRPlaybackSessionMigrateRequestProtobuf copy](v3->_protobuf, "copy");
  objc_msgSend(v4, "setEvents:", 0);
  v5 = -[MRPlaybackSessionMigrateRequest initWithProtobuf:]([MRPlaybackSessionMigrateRequest alloc], "initWithProtobuf:", v4);

  objc_sync_exit(v3);
  return v5;
}

- (void)startEvent:(id)a3
{
  _MRPlaybackSessionMigrateRequestEventProtobuf *v4;
  void *v5;
  MRPlaybackSessionMigrateRequest *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = objc_alloc_init(_MRPlaybackSessionMigrateRequestEventProtobuf);
  -[_MRPlaybackSessionMigrateRequestEventProtobuf setName:](v4, "setName:", v10);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  -[_MRPlaybackSessionMigrateRequestEventProtobuf setStartTimestamp:](v4, "setStartTimestamp:");

  v6 = self;
  objc_sync_enter(v6);
  -[_MRPlaybackSessionMigrateRequestProtobuf events](v6->_protobuf, "events");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[_MRPlaybackSessionMigrateRequestProtobuf setEvents:](v6->_protobuf, "setEvents:", v8);

  }
  -[_MRPlaybackSessionMigrateRequestProtobuf events](v6->_protobuf, "events");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v4);

  objc_sync_exit(v6);
}

- (void)endEvent:(id)a3
{
  -[MRPlaybackSessionMigrateRequest endEvent:withError:](self, "endEvent:withError:", a3, 0);
}

- (void)endEvent:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  MRPlaybackSessionMigrateRequest *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  objc_class *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[_MRPlaybackSessionMigrateRequestProtobuf events](v8->_protobuf, "events", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v13, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", v6);

        if (v15)
        {
          objc_msgSend(v13, "endTimestamp");
          if (v16 == 0.0)
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "timeIntervalSinceReferenceDate");
            objc_msgSend(v13, "setEndTimestamp:");

            if (v7)
            {
              objc_msgSend(v13, "setErrorCode:", objc_msgSend(v7, "code"));
              objc_msgSend(v7, "localizedFailureReason");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = v18;
              if (!v18)
              {
                objc_msgSend(v7, "localizedDescription");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v13, "setErrorDescription:", v19);
              if (!v18)

            }
            goto LABEL_17;
          }
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_17:

  if (v7 && !MRMediaRemoteErrorIsInformational(v7))
  {
    if (v8->_fallbackReason)
      v20 = 24;
    else
      v20 = 16;
    v21 = *(Class *)((char *)&v8->super.isa + v20);
    if (!v21)
      v21 = v7;
    v22 = v21;
    v23 = *(Class *)((char *)&v8->super.isa + v20);
    *(Class *)((char *)&v8->super.isa + v20) = v22;

  }
  objc_sync_exit(v8);

}

- (void)finalize
{
  void *v3;
  NSError *migrateError;
  id v5;
  _QWORD v6[4];
  id v7;

  -[MRPlaybackSessionMigrateRequest analyticsPayload]((uint64_t)self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  migrateError = self->_migrateError;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__MRPlaybackSessionMigrateRequest_finalize__block_invoke;
  v6[3] = &unk_1E30C96C0;
  v7 = v3;
  v5 = v3;
  MRAnalyticsSendEvent(CFSTR("com.apple.mediaremote.queue-handoff"), migrateError, v6);

}

id __43__MRPlaybackSessionMigrateRequest_finalize__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

BOOL __51__MRPlaybackSessionMigrateRequest_analyticsPayload__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t __51__MRPlaybackSessionMigrateRequest_analyticsPayload__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("sendPlaybackSession"));

  return v3;
}

- (void)setOriginatorTypeFromDevice:(id)a3
{
  -[_MRPlaybackSessionMigrateRequestProtobuf setOriginatorType:](self->_protobuf, "setOriginatorType:", MRAnalyticsCompositionForOutputDevice(a3));
}

- (void)addDestinationType:(unsigned int)a3
{
  -[_MRPlaybackSessionMigrateRequestProtobuf setDestinationTypes:](self->_protobuf, "setDestinationTypes:", -[_MRPlaybackSessionMigrateRequestProtobuf destinationTypes](self->_protobuf, "destinationTypes") | a3);
}

- (void)addDestinationTypesFromDevices:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[MRPlaybackSessionMigrateRequest addDestinationType:](self, "addDestinationType:", MRAnalyticsCompositionForOutputDevice(*(void **)(*((_QWORD *)&v9 + 1) + 8 * v8++)));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (double)duration
{
  MRPlaybackSessionMigrateRequest *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v2 = self;
  objc_sync_enter(v2);
  -[_MRPlaybackSessionMigrateRequestProtobuf events](v2->_protobuf, "events");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endTimestamp");
  v6 = v5;
  -[_MRPlaybackSessionMigrateRequestProtobuf events](v2->_protobuf, "events");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startTimestamp");
  v10 = v6 - v9;

  objc_sync_exit(v2);
  return v10;
}

- (BOOL)allowFadeTransition
{
  MRPlaybackSessionMigrateRequest *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[_MRPlaybackSessionMigrateRequestProtobuf allowFadeTransition](v2->_protobuf, "allowFadeTransition");
  objc_sync_exit(v2);

  return v3;
}

- (void)setAllowFadeTransition:(BOOL)a3
{
  _BOOL8 v3;
  MRPlaybackSessionMigrateRequest *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  -[_MRPlaybackSessionMigrateRequestProtobuf setAllowFadeTransition:](obj->_protobuf, "setAllowFadeTransition:", v3);
  objc_sync_exit(obj);

}

- (unsigned)originatorType
{
  return -[_MRPlaybackSessionMigrateRequestProtobuf originatorType](self->_protobuf, "originatorType");
}

- (void)setOriginatorType:(unsigned int)a3
{
  -[_MRPlaybackSessionMigrateRequestProtobuf setOriginatorType:](self->_protobuf, "setOriginatorType:", *(_QWORD *)&a3);
}

- (unsigned)destinationTypes
{
  return -[_MRPlaybackSessionMigrateRequestProtobuf destinationTypes](self->_protobuf, "destinationTypes");
}

- (void)setDestinationTypes:(unsigned int)a3
{
  -[_MRPlaybackSessionMigrateRequestProtobuf setDestinationTypes:](self->_protobuf, "setDestinationTypes:", *(_QWORD *)&a3);
}

- (void)merge:(id)a3
{
  id v4;
  MRPlaybackSessionMigrateRequest *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v4, "protobuf", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "events");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        -[_MRPlaybackSessionMigrateRequestProtobuf addEvents:](v5->_protobuf, "addEvents:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "protobuf");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRPlaybackSessionMigrateRequestProtobuf setAllowFadeTransition:](v5->_protobuf, "setAllowFadeTransition:", objc_msgSend(v11, "allowFadeTransition"));

  if (objc_msgSend(v4, "originatorType"))
  {
    objc_msgSend(v4, "protobuf");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRPlaybackSessionMigrateRequestProtobuf setOriginatorType:](v5->_protobuf, "setOriginatorType:", objc_msgSend(v12, "originatorType"));

  }
  if (objc_msgSend(v4, "destinationTypes"))
  {
    objc_msgSend(v4, "protobuf");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRPlaybackSessionMigrateRequestProtobuf setDestinationTypes:](v5->_protobuf, "setDestinationTypes:", objc_msgSend(v13, "destinationTypes"));

  }
  objc_sync_exit(v5);

}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(unint64_t)a3
{
  self->_requestType = a3;
}

- (unint64_t)fallbackReason
{
  return self->_fallbackReason;
}

- (void)setFallbackReason:(unint64_t)a3
{
  self->_fallbackReason = a3;
}

- (int64_t)playbackSessionSize
{
  return self->_playbackSessionSize;
}

- (void)setPlaybackSessionSize:(int64_t)a3
{
  self->_playbackSessionSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackError, 0);
  objc_storeStrong((id *)&self->_migrateError, 0);
  objc_storeStrong((id *)&self->_protobuf, 0);
}

@end
