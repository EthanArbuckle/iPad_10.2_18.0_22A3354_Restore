@implementation ATXHeuristicNowPlaying

- (ATXHeuristicNowPlaying)init
{
  return -[ATXHeuristicNowPlaying initWithPersistenceIdentifier:](self, "initWithPersistenceIdentifier:", CFSTR("ATXHeuristicNowPlaying"));
}

- (ATXHeuristicNowPlaying)initWithPersistenceIdentifier:(id)a3
{
  id v6;
  ATXHeuristicNowPlaying *v7;
  uint64_t v8;
  _PASLazyResult *mediaRemoteNowPlaying;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXHeuristicNowPlaying.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("persistenceIdentifier"));

  }
  v12.receiver = self;
  v12.super_class = (Class)ATXHeuristicNowPlaying;
  v7 = -[ATXHeuristicNowPlaying init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815E8]), "initWithBlock:", &__block_literal_global_9);
    mediaRemoteNowPlaying = v7->_mediaRemoteNowPlaying;
    v7->_mediaRemoteNowPlaying = (_PASLazyResult *)v8;

    objc_storeStrong((id *)&v7->_persistenceIdentifier, a3);
  }

  return v7;
}

id __56__ATXHeuristicNowPlaying_initWithPersistenceIdentifier___block_invoke()
{
  dispatch_semaphore_t v0;
  void *v1;
  NSObject *v2;
  NSObject *v3;
  dispatch_time_t v4;
  id v5;
  _QWORD v7[4];
  NSObject *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__12;
  v14 = __Block_byref_object_dispose__12;
  v15 = 0;
  v0 = dispatch_semaphore_create(0);
  objc_msgSend(MEMORY[0x1E0D4C5A0], "proactiveEndpointController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__ATXHeuristicNowPlaying_initWithPersistenceIdentifier___block_invoke_16;
  v7[3] = &unk_1E82C5438;
  v9 = &v10;
  v2 = v0;
  v8 = v2;
  objc_msgSend(v1, "performRequestWithCompletion:", v7);

  v3 = v2;
  v4 = dispatch_time(0, 30000000000);
  dispatch_semaphore_wait(v3, v4);

  v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __56__ATXHeuristicNowPlaying_initWithPersistenceIdentifier___block_invoke_16(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)permanentRefreshTriggers
{
  void *v2;
  id v3;
  ATXInformationHeuristicRefreshNotitifcationTrigger *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1CAA46CBC](self, a2);
  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  v4 = -[ATXInformationHeuristicRefreshNotitifcationTrigger initWithNotification:type:]([ATXInformationHeuristicRefreshNotitifcationTrigger alloc], "initWithNotification:type:", CFSTR("com.apple.MediaRemote.lockScreenControlsDidChange"), 1);
  v5 = (void *)objc_msgSend(v3, "initWithObjects:", v4, 0);

  objc_autoreleasePoolPop(v2);
  return v5;
}

- (id)heuristicResultWithEnvironment:(id)a3
{
  ATXContextHeuristicResult *v4;
  void *v5;
  void *v6;
  ATXContextHeuristicResult *v7;

  v4 = [ATXContextHeuristicResult alloc];
  -[ATXHeuristicNowPlaying _produceSuggestions]((id *)&self->super.isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ATXContextHeuristicResult initWithSuggestions:additionalRefreshTriggers:](v4, "initWithSuggestions:additionalRefreshTriggers:", v5, v6);

  return v7;
}

- (id)_produceSuggestions
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  ATXContextMediaSuggestionProducer *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  if (!a1)
  {
    v20 = 0;
    return v20;
  }
  objc_msgSend(a1[2], "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playerPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "origin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isLocal");

  if ((v5 & 1) != 0)
  {
    v6 = 0;
    v7 = 0.0;
  }
  else
  {
    objc_msgSend(v2, "playerPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "origin");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = 50.0;
  }
  -[ATXHeuristicNowPlaying _expirationDate](a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v2, "playbackState");
  switch(v11)
  {
    case 5:
      goto LABEL_8;
    case 2:
      if (!v10)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXHeuristicNowPlaying _setExpirationDate:]((uint64_t)a1, v10);
        if (v7 == 0.0)
          v7 = 60.0;
        goto LABEL_12;
      }
      objc_msgSend(v10, "timeIntervalSinceNow");
      break;
    case 1:
LABEL_8:
      if (v10)
      {

        -[ATXHeuristicNowPlaying _setExpirationDate:]((uint64_t)a1, 0);
      }
      v10 = 0;
      if (v7 == 0.0)
        v7 = 60.0;
LABEL_12:
      objc_msgSend(v2, "playbackQueue", 60.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "contentItems");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
        goto LABEL_21;
      objc_msgSend(v2, "playerPath");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "client");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "bundleIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "hasPrefix:", CFSTR("com.apple."));

      if (v18)
      {
        v19 = -[ATXContextMediaSuggestionProducer initWithMediaRemoteContentItem:destDisplayName:expirationDate:]([ATXContextMediaSuggestionProducer alloc], "initWithMediaRemoteContentItem:destDisplayName:expirationDate:", v14, v6, v10);
        v20 = (void *)objc_opt_new();
        -[ATXContextMediaSuggestionProducer suggestionForTrackWithReason:score:](v19, "suggestionForTrackWithReason:score:", 0x40000, v7);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
          objc_msgSend(v20, "addObject:", v21);
        -[ATXContextMediaSuggestionProducer suggestionForArtistWithReason:score:](v19, "suggestionForArtistWithReason:score:", 0x40000, v7);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
          objc_msgSend(v20, "addObject:", v22);
        -[ATXContextMediaSuggestionProducer suggestionForAlbumWithReason:score:](v19, "suggestionForAlbumWithReason:score:", 0x40000, v7);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
          objc_msgSend(v20, "addObject:", v23);

      }
      else
      {
LABEL_21:
        v20 = (void *)MEMORY[0x1E0C9AA60];
      }

      goto LABEL_26;
  }
  v20 = (void *)MEMORY[0x1E0C9AA60];
LABEL_26:

  return v20;
}

+ (id)_defaults
{
  id v0;

  objc_opt_self();
  v0 = objc_alloc(MEMORY[0x1E0C99EA0]);
  return (id)objc_msgSend(v0, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
}

- (id)_expirationDateKey
{
  if (a1)
  {
    objc_msgSend(a1[1], "stringByAppendingString:", CFSTR("Expiration"));
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)_expirationDate
{
  id *v1;
  void *v2;
  void *v3;

  v1 = a1;
  if (a1)
  {
    +[ATXHeuristicNowPlaying _defaults]();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1[1], "stringByAppendingString:", CFSTR("Expiration"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", v3);
    v1 = (id *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (void)_setExpirationDate:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    +[ATXHeuristicNowPlaying _defaults]();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 8), "stringByAppendingString:", CFSTR("Expiration"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v3, v4);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaRemoteNowPlaying, 0);
  objc_storeStrong((id *)&self->_persistenceIdentifier, 0);
}

@end
