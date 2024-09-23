@implementation MRMediaSuggestion

- (MRMediaSuggestion)initWithIntent:(id)a3
{
  id v5;
  MRMediaSuggestion *v6;
  MRMediaSuggestion *v7;
  uint64_t v8;
  INMediaItem *container;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRMediaSuggestion;
  v6 = -[MRMediaSuggestion init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_intent, a3);
    -[INPlayMediaIntent mediaContainer](v7->_intent, "mediaContainer");
    v8 = objc_claimAutoreleasedReturnValue();
    container = v7->_container;
    v7->_container = (INMediaItem *)v8;

  }
  return v7;
}

- (NSString)identifier
{
  return -[INMediaItem identifier](self->_container, "identifier");
}

- (NSString)title
{
  return -[INMediaItem title](self->_container, "title");
}

- (NSString)artist
{
  return -[INMediaItem artist](self->_container, "artist");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  INPlayMediaIntent *intent;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  id v17;
  void *v18;

  v17 = objc_alloc(MEMORY[0x1E0CB3940]);
  v16 = objc_opt_class();
  -[MRMediaSuggestion bundleID](self, "bundleID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRMediaSuggestion identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRMediaSuggestion title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRMediaSuggestion artist](self, "artist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    intent = self->_intent;
  else
    intent = 0;
  -[INPlayMediaIntent mediaContainer](intent, "mediaContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "artwork");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("NO");
  if (v8)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  -[MRMediaSuggestion artwork](self, "artwork");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v9 = CFSTR("YES");
  -[MRMediaSuggestion artwork](self, "artwork");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("<%@: source=%@, identifier=%@, title=%@, artist=%@, intentHasArt=%@, artLoaded=%@, artSize: %ld>"), v16, v18, v3, v4, v5, v10, v9, objc_msgSend(v13, "length"));

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  MRMediaSuggestion *v4;
  MRMediaSuggestion *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (MRMediaSuggestion *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MRMediaSuggestion identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRMediaSuggestion identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v10 = 1;
      }
      else
      {
        -[MRMediaSuggestion identifier](self, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[MRMediaSuggestion identifier](v5, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToString:", v9);

      }
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MRMediaSuggestion identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (uint64_t)_originatedFromSystemMediaApp
{
  void *v1;

  if (result)
  {
    objc_msgSend((id)result, "bundleID");
    v1 = (void *)objc_claimAutoreleasedReturnValue();

    if ((MRMediaRemoteApplicationIsSystemMediaApplication((uint64_t)v1) & 1) != 0)
      return 1;
    else
      return MRMediaRemoteApplicationIsSystemPodcastApplication((uint64_t)v1);
  }
  return result;
}

- (__CFString)_identifierForQueuePlayback
{
  void *v1;
  __CFString **v2;

  if (a1)
  {
    -[__CFString bundleID](a1, "bundleID");
    v1 = (void *)objc_claimAutoreleasedReturnValue();

    if ((MRMediaRemoteApplicationIsSystemMediaApplication((uint64_t)v1) & 1) != 0)
    {
      v2 = kMRMediaRemoteSystemMediaApplicationDisplayIdentifier;
    }
    else if ((MRMediaRemoteApplicationIsSystemPodcastApplication((uint64_t)v1) & 1) != 0)
    {
      v2 = kMRMediaRemoteSystemPodcastApplicationDisplayIdentifier;
    }
    else
    {
      if (!MRMediaRemoteApplicationIsSystemBooksApplication((uint64_t)v1))
      {
        a1 = 0;
        return a1;
      }
      v2 = kMRMediaRemoteSystemBooksApplicationDisplayIdentifier;
    }
    a1 = *v2;
  }
  return a1;
}

- (id)_processedIntent
{
  void *v1;

  if (a1)
  {
    v1 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    objc_msgSend(v1, "_setAirPlayRouteIds:", 0);
    objc_msgSend(v1, "setMediaItems:", 0);
    objc_msgSend(v1, "setPlayShuffled:", 0);
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

- (id)_processedIntentWithRouteIdentifiers:(uint64_t)a1
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  if (a1)
  {
    v3 = *(void **)(a1 + 32);
    v4 = a2;
    v5 = (void *)objc_msgSend(v3, "copy");
    objc_msgSend(v5, "_setAirPlayRouteIds:", v4);

    objc_msgSend(v5, "setMediaItems:", 0);
    objc_msgSend(v5, "setPlayShuffled:", 0);
    if (-[MRMediaSuggestion _originatedFromSystemMediaApp](a1))
    {
      objc_msgSend(v5, "privatePlayMediaIntentData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_alloc(getINPrivatePlayMediaIntentDataClass());
      objc_msgSend(v6, "appSelectionEnabled");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appInferred");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "audioSearchResults");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "privateMediaIntentData");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appSelectionSignalsEnabled");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appSelectionSignalsFrequencyDenominator");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "immediatelyStartPlayback");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "isAmbiguousPlay");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "isPersonalizedRequest");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "internalSignals");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "entityConfidenceSignalsEnabled");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "entityConfidenceSignalsFrequencyDenominatorInternal");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "entityConfidenceSignalsFrequencyDenominatorProd");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "entityConfidenceSignalsMaxItemsToDisambiguate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "alternativeProviderBundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "ampPAFDataSetID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v20, "initWithAppSelectionEnabled:appInferred:audioSearchResults:privateMediaIntentData:appSelectionSignalsEnabled:appSelectionSignalsFrequencyDenominator:shouldSuppressCommonWholeHouseAudioRoutes:immediatelyStartPlayback:isAmbiguousPlay:isPersonalizedRequest:internalSignals:entityConfidenceSignalsEnabled:entityConfidenceSignalsFrequencyDenominatorInternal:entityConfidenceSignalsFrequencyDenominatorProd:entityConfidenceSignalsMaxItemsToDisambiguate:alternativeProviderBundleIdentifier:ampPAFDataSetID:", v23, v25, v24, v19, v18, v17, MEMORY[0x1E0C9AAB0], v22, v21, v16, v15, v7, v14,
                      v8,
                      v13,
                      v9,
                      v10);
      objc_msgSend(v5, "setPrivatePlayMediaIntentData:", v11);

    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_intentForQueuePlayback
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  if (a1)
  {
    -[MRMediaSuggestion _processedIntent](a1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc(getINMediaItemClass());
    objc_msgSend(v1, "mediaContainer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringByAppendingString:", CFSTR("&includePlaybackQueue=true"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "mediaContainer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "mediaContainer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v18, "type");
    objc_msgSend(v1, "mediaContainer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "artwork");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "mediaContainer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "artist");
    v3 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "mediaContainer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "mediaContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "namedEntities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "mediaContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "privateMediaItemValueData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)v3;
    v11 = (void *)objc_msgSend(v16, "initWithIdentifier:title:type:artwork:artist:topics:namedEntities:privateMediaItemValueData:", v22, v14, v13, v2, v3, v5, v7, v9);
    objc_msgSend(v1, "setMediaContainer:", v11);

  }
  else
  {
    v1 = 0;
  }
  return v1;
}

- (dispatch_queue_t)_callbackQueue
{
  NSObject *v1;
  dispatch_queue_t v2;

  if (a1)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = dispatch_queue_create("com.apple.mediaremote.MRMediaSuggestion.callbackQueue", v1);

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)playWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  MRMediaSuggestion *v11;
  id v12;

  v4 = a3;
  -[MRMediaSuggestion _processedIntent]((uint64_t)self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__MRMediaSuggestion_playWithCompletion___block_invoke;
  v9[3] = &unk_1E30C6878;
  v10 = v6;
  v11 = self;
  v12 = v4;
  v7 = v4;
  v8 = v6;
  -[MRMediaSuggestion _playIntent:completion:]((uint64_t)self, v5, v9);

}

void __40__MRMediaSuggestion_playWithCompletion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", a1[4]);
  v6 = v5;

  if (!v3)
  {
    _MRLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = a1[5];
      v9 = 138543618;
      v10 = v8;
      v11 = 2048;
      v12 = v6;
      _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "[MRMediaSuggestion] %{public}@ began playback after %f seconds.", (uint8_t *)&v9, 0x16u);
    }

  }
  (*(void (**)(void))(a1[6] + 16))();

}

- (void)_playIntent:(void *)a3 completion:
{
  id v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  v6 = v5;
  if (a1)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __44__MRMediaSuggestion__playIntent_completion___block_invoke;
    v7[3] = &unk_1E30C69B8;
    v7[4] = a1;
    v8 = v5;
    -[MRMediaSuggestion _confirmIntent:intentHandler:](a1, a2, v7);

  }
}

- (void)playOnDeviceWithUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MRAVLightweightReconnaissanceSession *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  MRAVLightweightReconnaissanceSession *v19;
  _QWORD v20[4];
  MRAVLightweightReconnaissanceSession *v21;
  MRMediaSuggestion *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  MRMediaSuggestion *v29;
  id v30;

  v6 = a4;
  v7 = a3;
  -[MRMediaSuggestion _processedIntent]((uint64_t)self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MRAVLightweightReconnaissanceSession);
  -[MRMediaSuggestion _callbackQueue]((uint64_t)self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __52__MRMediaSuggestion_playOnDeviceWithUID_completion___block_invoke;
  v27[3] = &unk_1E30C6878;
  v28 = v11;
  v29 = self;
  v13 = v6;
  v30 = v13;
  v14 = v11;
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __52__MRMediaSuggestion_playOnDeviceWithUID_completion___block_invoke_13;
  v20[3] = &unk_1E30C68A0;
  v21 = v9;
  v22 = self;
  v23 = v8;
  v24 = v10;
  v25 = v13;
  v26 = (id)MEMORY[0x194036C44](v27);
  v15 = v26;
  v16 = v10;
  v17 = v8;
  v18 = v13;
  v19 = v9;
  -[MRAVLightweightReconnaissanceSession searchForOutputDeviceUID:timeout:reason:queue:completion:](v19, "searchForOutputDeviceUID:timeout:reason:queue:completion:", v7, CFSTR("Searching for output device to play MRMediaSuggestion."), v16, v20, 5.0);

}

void __52__MRMediaSuggestion_playOnDeviceWithUID_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", a1[4]);
  v6 = v5;

  if (!v3)
  {
    _MRLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = a1[5];
      v9 = 138543618;
      v10 = v8;
      v11 = 2048;
      v12 = v6;
      _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "[MRMediaSuggestion] %{public}@ began playback after %f seconds.", (uint8_t *)&v9, 0x16u);
    }

  }
  (*(void (**)(void))(a1[6] + 16))();

}

void __52__MRMediaSuggestion_playOnDeviceWithUID_completion___block_invoke_13(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(id *)(a1 + 32);
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    objc_msgSend(v5, "endpoint");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7
      && (v8 = (void *)v7,
          v9 = -[MRMediaSuggestion _originatedFromSystemMediaApp](*(_QWORD *)(a1 + 40)),
          v8,
          v9))
    {
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(void **)(a1 + 48);
      objc_msgSend(v5, "endpoint");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRMediaSuggestion _playIntent:onEndpoint:queue:completion:](v10, v11, v12, *(void **)(a1 + 56), *(void **)(a1 + 72));
    }
    else
    {
      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(void **)(a1 + 48);
      v15[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRMediaSuggestion _playIntentRemotelyWithAirPlay:destinationDevices:queue:completion:](v13, v14, v12, *(void **)(a1 + 56), *(void **)(a1 + 72));
    }

  }
}

- (void)_playIntent:(void *)a3 onEndpoint:(void *)a4 queue:(void *)a5 completion:
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a1)
  {
    v20 = CFSTR("MREndpointConnectionReasonUserInfoKey");
    v21[0] = CFSTR("MRMediaSuggestion");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __61__MRMediaSuggestion__playIntent_onEndpoint_queue_completion___block_invoke;
    v14[3] = &unk_1E30C68F0;
    v15 = v11;
    v19 = v12;
    v16 = a1;
    v17 = v9;
    v18 = v10;
    objc_msgSend(v18, "connectToExternalDeviceWithUserInfo:completion:", v13, v14);

  }
}

- (void)_playIntentRemotelyWithAirPlay:(void *)a3 destinationDevices:(void *)a4 queue:(void *)a5 completion:
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v9 = a2;
  v10 = a5;
  if (a1)
  {
    v11 = a4;
    v12 = a3;
    +[MRAVLocalEndpoint sharedLocalEndpointForRoutingContextWithUID:](MRAVLocalEndpoint, "sharedLocalEndpointForRoutingContextWithUID:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __88__MRMediaSuggestion__playIntentRemotelyWithAirPlay_destinationDevices_queue_completion___block_invoke;
    v14[3] = &unk_1E30C6990;
    v16 = v10;
    v14[4] = a1;
    v15 = v9;
    objc_msgSend(v13, "setOutputDevices:initiator:withReplyQueue:completion:", v12, CFSTR("MRMediaSuggestion setting output devices."), v11, v14);

  }
}

- (void)playWithAirPlayRouteIdentifiers:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  MRMediaSuggestion *v13;
  id v14;

  v6 = a4;
  -[MRMediaSuggestion _processedIntentWithRouteIdentifiers:]((uint64_t)self, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__MRMediaSuggestion_playWithAirPlayRouteIdentifiers_completion___block_invoke;
  v11[3] = &unk_1E30C6878;
  v12 = v8;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v8;
  -[MRMediaSuggestion _playIntent:completion:]((uint64_t)self, v7, v11);

}

void __64__MRMediaSuggestion_playWithAirPlayRouteIdentifiers_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", a1[4]);
  v6 = v5;

  if (!v3)
  {
    _MRLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = a1[5];
      v9 = 138543618;
      v10 = v8;
      v11 = 2048;
      v12 = v6;
      _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "[MRMediaSuggestion] %{public}@ began playback after %f seconds.", (uint8_t *)&v9, 0x16u);
    }

  }
  (*(void (**)(void))(a1[6] + 16))();

}

- (void)playOnEndpoint:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  MRMediaSuggestion *v19;
  id v20;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isLocalEndpoint"))
  {
    -[MRMediaSuggestion playWithCompletion:](self, "playWithCompletion:", v7);
  }
  else
  {
    -[MRMediaSuggestion _processedIntent]((uint64_t)self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __47__MRMediaSuggestion_playOnEndpoint_completion___block_invoke;
    v17[3] = &unk_1E30C6878;
    v10 = v9;
    v18 = v10;
    v19 = self;
    v20 = v7;
    v11 = (void *)MEMORY[0x194036C44](v17);
    if (-[MRMediaSuggestion _originatedFromSystemMediaApp]((uint64_t)self))
    {
      -[MRMediaSuggestion _callbackQueue]((uint64_t)self);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRMediaSuggestion _playIntent:onEndpoint:queue:completion:]((uint64_t)self, v8, v6, v12, v11);
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(v6, "outputDevices");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "arrayWithArray:", v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v6, "isProxyGroupPlayer"))
      {
        objc_msgSend(v6, "designatedGroupLeader");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeObject:", v15);

      }
      -[MRMediaSuggestion _callbackQueue]((uint64_t)self);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRMediaSuggestion _playIntentRemotelyWithAirPlay:destinationDevices:queue:completion:]((uint64_t)self, v8, v12, v16, v11);

    }
  }

}

void __47__MRMediaSuggestion_playOnEndpoint_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", a1[4]);
  v6 = v5;

  if (!v3)
  {
    _MRLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = a1[5];
      v9 = 138543618;
      v10 = v8;
      v11 = 2048;
      v12 = v6;
      _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "[MRMediaSuggestion] %{public}@ began playback after %f seconds.", (uint8_t *)&v9, 0x16u);
    }

  }
  (*(void (**)(void))(a1[6] + 16))();

}

void __61__MRMediaSuggestion__playIntent_onEndpoint_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__MRMediaSuggestion__playIntent_onEndpoint_queue_completion___block_invoke_2;
  v9[3] = &unk_1E30C68C8;
  v10 = v3;
  v5 = *(id *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v15 = v5;
  v11 = v6;
  v12 = v7;
  v13 = *(id *)(a1 + 56);
  v14 = *(id *)(a1 + 32);
  v8 = v3;
  dispatch_async(v4, v9);

}

void __61__MRMediaSuggestion__playIntent_onEndpoint_queue_completion___block_invoke_2(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  else
    -[MRMediaSuggestion _playIntentRemotelyAsPlaybackQueue:endpoint:queue:completion:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 64), *(void **)(a1 + 72));
}

- (void)_playIntentRemotelyAsPlaybackQueue:(void *)a3 endpoint:(void *)a4 queue:(void *)a5 completion:
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id v18;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a1)
  {
    -[MRMediaSuggestion _intentForQueuePlayback](a1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __82__MRMediaSuggestion__playIntentRemotelyAsPlaybackQueue_endpoint_queue_completion___block_invoke;
    v14[3] = &unk_1E30C6968;
    v18 = v12;
    v14[4] = a1;
    v15 = v10;
    v16 = v11;
    v17 = v9;
    -[MRMediaSuggestion _confirmIntent:intentHandler:](a1, v13, v14);

  }
}

void __82__MRMediaSuggestion__playIntentRemotelyAsPlaybackQueue_endpoint_queue_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  void *v6;
  MRClient *v7;
  void *v8;
  MRClient *v9;
  MRPlayerPath *v10;
  void *v11;
  MRPlayerPath *v12;
  void *v13;
  void *v14;
  MRPlayerPath *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  MRPlayerPath *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), a5);
  }
  else
  {
    objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteOptionSystemAppPlaybackQueueData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = [MRClient alloc];
      -[MRMediaSuggestion _identifierForQueuePlayback](*(__CFString **)(a1 + 32));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[MRClient initWithBundleIdentifier:](v7, "initWithBundleIdentifier:", v8);

      v10 = [MRPlayerPath alloc];
      objc_msgSend(*(id *)(a1 + 40), "origin");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[MRPlayerPath initWithOrigin:client:player:](v10, "initWithOrigin:client:player:", v11, v9, 0);

      v27 = CFSTR("kMRMediaRemoteOptionSystemAppPlaybackQueueData");
      v28[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(void **)(a1 + 48);
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __82__MRMediaSuggestion__playIntentRemotelyAsPlaybackQueue_endpoint_queue_completion___block_invoke_2;
      v21[3] = &unk_1E30C6940;
      v24 = *(id *)(a1 + 64);
      v21[4] = *(_QWORD *)(a1 + 32);
      v22 = v12;
      v23 = *(id *)(a1 + 56);
      v15 = v12;
      MRMediaRemoteSendCommandToPlayer(122, v13, v15, 1, v14, v21);

    }
    else
    {
      _MRLogForCategory(0);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v26 = v17;
        _os_log_impl(&dword_193827000, v16, OS_LOG_TYPE_DEFAULT, "[MRMediaSuggestion] %{public}@ did not receive queue data. Falling back to AirPlay path.", buf, 0xCu);
      }

      v18 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(*(id *)(a1 + 40), "outputDevices");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "arrayWithArray:", v19);
      v9 = (MRClient *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(*(id *)(a1 + 40), "isProxyGroupPlayer"))
      {
        objc_msgSend(*(id *)(a1 + 40), "designatedGroupLeader");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[MRClient removeObject:](v9, "removeObject:", v20);

      }
      -[MRMediaSuggestion _playIntentRemotelyWithAirPlay:destinationDevices:queue:completion:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 56), v9, *(void **)(a1 + 48), *(void **)(a1 + 64));
    }

  }
}

void __82__MRMediaSuggestion__playIntentRemotelyAsPlaybackQueue_endpoint_queue_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  MRMediaRemoteErrorFromCommandStatuses(a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    _MRLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v12 = v6;
      v13 = 2114;
      v14 = v7;
      _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "[MRMediaSuggestion] %{public}@ successfully sent as queue to %{public}@.", buf, 0x16u);
    }

    v8 = (void *)objc_msgSend(objc_alloc(getINInteractionClass()), "initWithIntent:response:", *(_QWORD *)(a1 + 48), 0);
    objc_msgSend(*(id *)(a1 + 32), "bundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __82__MRMediaSuggestion__playIntentRemotelyAsPlaybackQueue_endpoint_queue_completion___block_invoke_23;
    v10[3] = &unk_1E30C6918;
    v10[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "_donateInteractionWithBundleId:completion:", v9, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __82__MRMediaSuggestion__playIntentRemotelyAsPlaybackQueue_endpoint_queue_completion___block_invoke_23(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _MRLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 32);
      if (v6)
        v7 = *(_QWORD *)(v6 + 32);
      else
        v7 = 0;
      v13 = 138543874;
      v14 = v6;
      v15 = 2114;
      v16 = v7;
      v17 = 2114;
      v18 = v3;
      v8 = "[MRMediaSuggestion] %{public}@ failed to re-donate intent %{public}@ with error %{public}@";
      v9 = v4;
      v10 = 32;
LABEL_10:
      _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
    }
  }
  else if (v5)
  {
    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
      v12 = *(_QWORD *)(v11 + 32);
    else
      v12 = 0;
    v13 = 138543618;
    v14 = v11;
    v15 = 2114;
    v16 = v12;
    v8 = "[MRMediaSuggestion] %{public}@ re-donated intent %{public}@";
    v9 = v4;
    v10 = 22;
    goto LABEL_10;
  }

}

- (void)_confirmIntent:(void *)a3 intentHandler:
{
  id v5;
  Class (__cdecl *v6)();
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v5 = a3;
  if (a1)
  {
    v6 = (Class (__cdecl *)())getINCExtensionConnectionClass;
    v7 = a2;
    v8 = (void *)objc_msgSend(objc_alloc(v6()), "initWithIntent:", v7);

    objc_msgSend(v8, "setRequiresTCC:", 0);
    v9 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __50__MRMediaSuggestion__confirmIntent_intentHandler___block_invoke;
    v15[3] = &unk_1E30C6798;
    v10 = v5;
    v16 = v10;
    objc_msgSend(v8, "setInterruptionHandler:", v15);
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __50__MRMediaSuggestion__confirmIntent_intentHandler___block_invoke_2;
    v12[3] = &unk_1E30C6A30;
    v13 = v8;
    v14 = v10;
    v11 = v8;
    objc_msgSend(v11, "resumeWithCompletionHandler:", v12);

  }
}

void __88__MRMediaSuggestion__playIntentRemotelyWithAirPlay_destinationDevices_queue_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  else
    -[MRMediaSuggestion _playIntent:completion:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
}

void __44__MRMediaSuggestion__playIntent_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (a5)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    -[MRMediaSuggestion _handleIntentWithProxy:completion:](*(_QWORD *)(a1 + 32), a3, *(void **)(a1 + 40));
}

- (void)_handleIntentWithProxy:(void *)a3 completion:
{
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v5 = a3;
  v6 = v5;
  if (a1)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __55__MRMediaSuggestion__handleIntentWithProxy_completion___block_invoke;
    v7[3] = &unk_1E30C69E0;
    v8 = v5;
    objc_msgSend(a2, "handleIntentWithCompletionHandler:", v7);

  }
}

void __55__MRMediaSuggestion__handleIntentWithProxy_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "underlyingError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v10 = *MEMORY[0x1E0CB3388];
      objc_msgSend(v5, "underlyingError");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:userInfo:", 172, v8);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __50__MRMediaSuggestion__confirmIntent_intentHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v7 = *MEMORY[0x1E0CB3388];
    v8[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:userInfo:", 173, v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __50__MRMediaSuggestion__confirmIntent_intentHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "reset");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __50__MRMediaSuggestion__confirmIntent_intentHandler___block_invoke_3;
    v7[3] = &unk_1E30C6A08;
    v8 = *(id *)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    v9 = v5;
    objc_msgSend(v9, "confirmIntentWithCompletionHandler:", v7);

  }
}

void __50__MRMediaSuggestion__confirmIntent_intentHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  objc_class *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "underlyingError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v22 = *MEMORY[0x1E0CB3388];
      objc_msgSend(v7, "underlyingError");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:userInfo:", 171, v10);
    objc_msgSend(*(id *)(a1 + 32), "reset");
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

LABEL_13:
    goto LABEL_14;
  }
  getINPlayMediaIntentResponseClass();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v5;
    if (objc_msgSend(v10, "code") == 1 || objc_msgSend(v10, "code") == 4)
    {
      v12 = *(_QWORD *)(a1 + 40);
      v11 = *(_QWORD *)(a1 + 48);
      v13 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v10, "nowPlayingInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, uint64_t, void *, _QWORD))(v11 + 16))(v11, v13, v12, v14, 0);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "reset");
      v21 = *(_QWORD *)(a1 + 48);
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:format:", 171, CFSTR("Intent cannot be handled by extension. Expected response code INPlayMediaIntentResponseCodeReady or INPlayMediaIntentResponseCodeSuccess, got %ld."), objc_msgSend(v10, "code"));
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v21 + 16))(v21, 0, 0, 0, v14);
    }

    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 32), "reset");
  v16 = *(_QWORD *)(a1 + 48);
  v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v18 = (objc_class *)objc_opt_class();
  NSStringFromClass(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v17, "initWithMRError:format:", 171, CFSTR("Expected response of type INPlayMediaIntentResponse. Got %@."), v19);
  (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v16 + 16))(v16, 0, 0, 0, v20);

LABEL_14:
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 8), a2);
}

- (MRArtwork)artwork
{
  return self->_artwork;
}

- (void)setArtwork:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
