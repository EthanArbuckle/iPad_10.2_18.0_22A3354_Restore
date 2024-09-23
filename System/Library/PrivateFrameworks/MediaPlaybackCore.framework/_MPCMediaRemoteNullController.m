@implementation _MPCMediaRemoteNullController

- (id)_init
{
  id v2;
  MPCFuture *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  MPCFuture *v16;
  void *v17;
  void *v18;
  void *v19;
  MPCFuture *v20;
  void *v21;
  MPCFuture *v22;
  void *v23;
  MPCFuture *v24;
  void *v25;
  MPCFuture *v26;
  void *v27;
  MPCFuture *v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v35.receiver = self;
  v35.super_class = (Class)_MPCMediaRemoteNullController;
  v2 = -[MPCMediaRemoteController _init](&v35, sel__init);
  if (v2)
  {
    v3 = -[MPCFuture initWithQueue:]([MPCFuture alloc], "initWithQueue:", *((_QWORD *)v2 + 2));
    v4 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v3;

    objc_msgSend(*((id *)v2 + 3), "setDebugLabel:", CFSTR("playbackState [nullcontroller - init]"));
    objc_msgSend(*((id *)v2 + 3), "finishWithValue:", 0);
    v5 = (void *)MRMediaRemoteCopySystemMediaApplicationDefaultSupportedCommands();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v32 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          v13 = (void *)MEMORY[0x24BDD16E0];
          v14 = MEMORY[0x212BD1B48](v12);
          objc_msgSend(v13, "numberWithUnsignedInt:", v14, (_QWORD)v31);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v15);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v9);
    }

    v16 = -[MPCFuture initWithQueue:]([MPCFuture alloc], "initWithQueue:", *((_QWORD *)v2 + 2));
    v17 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v16;

    objc_msgSend(*((id *)v2 + 5), "setDebugLabel:", CFSTR("supportedCommands [nullcontroller - init]"));
    v18 = (void *)*((_QWORD *)v2 + 5);
    v19 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v18, "finishWithValue:", v19);

    v20 = -[MPCFuture initWithQueue:]([MPCFuture alloc], "initWithQueue:", *((_QWORD *)v2 + 2));
    v21 = (void *)*((_QWORD *)v2 + 33);
    *((_QWORD *)v2 + 33) = v20;

    objc_msgSend(*((id *)v2 + 33), "setDebugLabel:", CFSTR("playbackQueue [nullcontroller - init]"));
    objc_msgSend(*((id *)v2 + 33), "finishWithValue:", 0);
    v22 = -[MPCFuture initWithQueue:]([MPCFuture alloc], "initWithQueue:", *((_QWORD *)v2 + 2));
    v23 = (void *)*((_QWORD *)v2 + 34);
    *((_QWORD *)v2 + 34) = v22;

    objc_msgSend(*((id *)v2 + 34), "setDebugLabel:", CFSTR("contentItemForIdentifier [nullcontroller - init]"));
    objc_msgSend(*((id *)v2 + 34), "finishWithValue:", 0);
    v24 = -[MPCFuture initWithQueue:]([MPCFuture alloc], "initWithQueue:", *((_QWORD *)v2 + 2));
    v25 = (void *)*((_QWORD *)v2 + 35);
    *((_QWORD *)v2 + 35) = v24;

    objc_msgSend(*((id *)v2 + 35), "setDebugLabel:", CFSTR("contentItemArtworkForIdentifier [nullcontroller - init]"));
    objc_msgSend(*((id *)v2 + 35), "finishWithValue:", 0);
    v26 = -[MPCFuture initWithQueue:]([MPCFuture alloc], "initWithQueue:", *((_QWORD *)v2 + 2));
    v27 = (void *)*((_QWORD *)v2 + 36);
    *((_QWORD *)v2 + 36) = v26;

    objc_msgSend(*((id *)v2 + 36), "setDebugLabel:", CFSTR("contentItemRemoteArtworkForContentItemIdentifier [nullcontroller - init]"));
    objc_msgSend(*((id *)v2 + 36), "finishWithValue:", 0);
    v28 = -[MPCFuture initWithQueue:]([MPCFuture alloc], "initWithQueue:", *((_QWORD *)v2 + 2));
    v29 = (void *)*((_QWORD *)v2 + 37);
    *((_QWORD *)v2 + 37) = v28;

    objc_msgSend(*((id *)v2 + 37), "setDebugLabel:", CFSTR("playbackQueueParticipants [nullcontroller - init]"));
    objc_msgSend(*((id *)v2 + 37), "finishWithValue:", MEMORY[0x24BDBD1A8]);

  }
  return v2;
}

- (int64_t)playbackStateCacheState
{
  return 1;
}

- (id)playbackState
{
  return self->super._playbackStateFuture;
}

- (int64_t)supportedCommandsCacheState
{
  return 1;
}

- (id)supportedCommands
{
  return self->super._supportedCommandsFuture;
}

- (void)sendCommand:(unsigned int)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  id v11;

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_opt_class();
  -[MPCMediaRemoteController resolvedPlayerPath](self, "resolvedPlayerPath");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendCommand:options:toPlayerPath:completion:", v6, v9, v11, v8);

}

- (id)playbackQueueForRequest:(void *)a3
{
  return self->_playbackQueueFuture;
}

- (int64_t)contentItemCacheStateForIdentifier:(id)a3
{
  return 1;
}

- (id)contentItemForIdentifier:(id)a3
{
  return self->_contentItemForIdentifierFuture;
}

- (int64_t)contentItemArtworkCacheStateForIdentifier:(id)a3 size:(CGSize)a4
{
  return 1;
}

- (id)contentItemArtworkForContentItemIdentifier:(id)a3 artworkIdentifier:(id)a4 size:(CGSize)a5
{
  return self->_contentItemArtworkForIdentifierFuture;
}

- (id)contentItemRemoteArtworkForContentItemIdentifier:(id)a3 artworkIdentifier:(id)a4 size:(CGSize)a5 artworkFormat:(id)a6
{
  return self->_contentItemRemoteArtworkForIdentifierFuture;
}

- (int64_t)playbackQueueParticipantsCacheState
{
  return 1;
}

- (id)playbackQueueParticipants
{
  return self->_participantsFuture;
}

- (void)invalidateAllTokens
{
  -[MPCFuture invalidate](self->super._playbackStateFuture, "invalidate");
  -[MPCFuture invalidate](self->super._supportedCommandsFuture, "invalidate");
  -[MPCFuture invalidate](self->_playbackQueueFuture, "invalidate");
  -[MPCFuture invalidate](self->_contentItemForIdentifierFuture, "invalidate");
  -[MPCFuture invalidate](self->_contentItemArtworkForIdentifierFuture, "invalidate");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantsFuture, 0);
  objc_storeStrong((id *)&self->_contentItemRemoteArtworkForIdentifierFuture, 0);
  objc_storeStrong((id *)&self->_contentItemArtworkForIdentifierFuture, 0);
  objc_storeStrong((id *)&self->_contentItemForIdentifierFuture, 0);
  objc_storeStrong((id *)&self->_playbackQueueFuture, 0);
}

+ (BOOL)_shouldRegisterForNotifications
{
  return 0;
}

@end
