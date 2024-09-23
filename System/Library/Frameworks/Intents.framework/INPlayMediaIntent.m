@implementation INPlayMediaIntent

- (NSArray)mediaItems
{
  void *v2;
  void *v3;
  void *v4;

  -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromMediaItemValues(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (INMediaItem)mediaContainer
{
  void *v2;
  void *v3;
  void *v4;

  -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromMediaItemValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INMediaItem *)v4;
}

- (id)_metadata
{
  void *v2;
  void *v3;

  -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intentMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_typedBackingStore
{
  void *v2;
  void *v3;
  id v4;

  -[INIntent backingStore](self, "backingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (int64_t)_intentCategory
{
  return 2;
}

- (id)_categoryVerb
{
  return CFSTR("Play");
}

+ (id)_ignoredParameters
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("playbackRepeatMode"), CFSTR("expirationDate"), CFSTR("recoID"), CFSTR("proxiedBundleIdentifier"), CFSTR("playbackQueueLocation"), CFSTR("playbackSpeed"), CFSTR("mediaSearch"), CFSTR("buckets"), CFSTR("hashedRouteUIDs"), 0);
}

- (NSArray)buckets
{
  void *v2;
  void *v3;
  void *v4;

  -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buckets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDataStrings(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)hashedRouteUIDs
{
  void *v2;
  void *v3;
  void *v4;

  -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hashedRouteUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromStrings(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (int64_t)_compareSubProducerOne:(id)a3 subProducerTwo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  uint64_t v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "_keyImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_keyImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = -1;
    else
      v9 = 1;
  }
  else
  {
    if (v8)
      v10 = -1;
    else
      v10 = 0;
    if (v7)
      v9 = 1;
    else
      v9 = v10;
  }

  return v9;
}

- (NSString)recoID
{
  void *v2;
  void *v3;
  void *v4;

  -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recoID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (NSDate)expirationDate
{
  void *v2;
  void *v3;
  void *v4;

  -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "expirationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromTimestamp(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (NSArray)alternativeResults
{
  void *v2;
  void *v3;
  void *v4;

  -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alternativeResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromMediaItemGroups(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)audioSearchResults
{
  void *v2;
  void *v3;
  void *v4;

  -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "audioSearchResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromMediaItemGroups(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSNumber)resumePlayback
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasResumePlayback"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "resumePlayback"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (NSNumber)playbackSpeed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasPlaybackSpeed"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playbackSpeed");
    objc_msgSend(v4, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (INPlaybackRepeatMode)playbackRepeatMode
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  unsigned int v6;
  INPlaybackRepeatMode v7;

  -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPlaybackRepeatMode");
  -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "playbackRepeatMode");
  if (((v6 < 3) & v4) != 0)
    v7 = v6 + 1;
  else
    v7 = INPlaybackRepeatModeUnknown;

  return v7;
}

- (INPlaybackQueueLocation)playbackQueueLocation
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  INPlaybackQueueLocation v7;
  INPlaybackQueueLocation v8;

  -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPlaybackQueueLocation");
  -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "playbackQueueLocation") - 1;
  if (v6 <= 2)
    v7 = v6 + 1;
  else
    v7 = INPlaybackQueueLocationUnknown;
  if (v4)
    v8 = v7;
  else
    v8 = INPlaybackQueueLocationUnknown;

  return v8;
}

- (NSNumber)playShuffled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasPlayShuffled"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "playShuffled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (int64_t)parsecCategory
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;

  -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasParsecCategory");
  -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "parsecCategory") - 1;
  if (v6 <= 7)
    v7 = v6 + 1;
  else
    v7 = 0;
  if (v4)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (INPlayMediaIntent)initWithMediaItems:(NSArray *)mediaItems mediaContainer:(INMediaItem *)mediaContainer playShuffled:(NSNumber *)playShuffled playbackRepeatMode:(INPlaybackRepeatMode)playbackRepeatMode resumePlayback:(NSNumber *)resumePlayback playbackQueueLocation:(INPlaybackQueueLocation)playbackQueueLocation playbackSpeed:(NSNumber *)playbackSpeed mediaSearch:(INMediaSearch *)mediaSearch
{
  NSArray *v16;
  INMediaItem *v17;
  NSNumber *v18;
  NSNumber *v19;
  NSNumber *v20;
  INMediaSearch *v21;
  INPlayMediaIntent *v22;
  INPlayMediaIntent *v23;
  objc_super v25;

  v16 = mediaItems;
  v17 = mediaContainer;
  v18 = playShuffled;
  v19 = resumePlayback;
  v20 = playbackSpeed;
  v21 = mediaSearch;
  v25.receiver = self;
  v25.super_class = (Class)INPlayMediaIntent;
  v22 = -[INIntent init](&v25, sel_init);
  v23 = v22;
  if (v22)
  {
    -[INPlayMediaIntent setMediaItems:](v22, "setMediaItems:", v16);
    -[INPlayMediaIntent setMediaContainer:](v23, "setMediaContainer:", v17);
    -[INPlayMediaIntent setPlayShuffled:](v23, "setPlayShuffled:", v18);
    -[INPlayMediaIntent setPlaybackRepeatMode:](v23, "setPlaybackRepeatMode:", playbackRepeatMode);
    -[INPlayMediaIntent setResumePlayback:](v23, "setResumePlayback:", v19);
    -[INPlayMediaIntent setPlaybackQueueLocation:](v23, "setPlaybackQueueLocation:", playbackQueueLocation);
    -[INPlayMediaIntent setPlaybackSpeed:](v23, "setPlaybackSpeed:", v20);
    -[INPlayMediaIntent setMediaSearch:](v23, "setMediaSearch:", v21);
  }

  return v23;
}

- (void)setResumePlayback:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setResumePlayback:", objc_msgSend(v5, "BOOLValue"));
  else
    objc_msgSend(v4, "setHasResumePlayback:", 0);

}

- (void)setPlaybackSpeed:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v5, "doubleValue");
    objc_msgSend(v4, "setPlaybackSpeed:");
  }
  else
  {
    objc_msgSend(v4, "setHasPlaybackSpeed:", 0);
  }

}

- (void)setPlaybackRepeatMode:(int64_t)a3
{
  unint64_t v3;
  void *v4;
  id v5;

  v3 = a3 - 1;
  -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 > 2)
    objc_msgSend(v4, "setHasPlaybackRepeatMode:", 0);
  else
    objc_msgSend(v4, "setPlaybackRepeatMode:", v3);

}

- (void)setPlaybackQueueLocation:(int64_t)a3
{
  void *v4;
  id v5;

  -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((unint64_t)a3 > 3)
    objc_msgSend(v4, "setHasPlaybackQueueLocation:", 0);
  else
    objc_msgSend(v4, "setPlaybackQueueLocation:", a3);

}

- (void)setPlayShuffled:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setPlayShuffled:", objc_msgSend(v5, "BOOLValue"));
  else
    objc_msgSend(v4, "setHasPlayShuffled:", 0);

}

- (void)setMediaSearch:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToMediaSearch(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setMediaSearch:", v5);
}

- (void)setMediaItems:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToMediaItemValues(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setMediaItems:", v5);
}

- (void)setMediaContainer:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToMediaItemValue(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setMediaContainer:", v5);
}

- (void)_setMetadata:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (id)_validParameterCombinationsWithSchema:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)INPlayMediaIntent;
  -[INIntent _validParameterCombinationsWithSchema:](&v23, sel__validParameterCombinationsWithSchema_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INPlayMediaIntent mediaContainer](self, "mediaContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    INDictionaryWithObjectsForKeysPassingTest(v4, &__block_literal_global_97100);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INPlayMediaIntent proxiedBundleIdentifier](self, "proxiedBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v7, "addObject:", CFSTR("proxiedBundleIdentifier"));
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v4, "allKeys", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v4, "objectForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setByAddingObjectsFromSet:", v7);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKey:", v16, v17);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v12);
    }

  }
  else
  {
    v9 = v4;
  }

  return v9;
}

- (NSString)proxiedBundleIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "proxiedBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

uint64_t __59__INPlayMediaIntent__validParameterCombinationsWithSchema___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "containsObject:", CFSTR("mediaContainer")) & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "containsObject:", CFSTR("buckets"));

  return v3;
}

- (INMediaSearch)mediaSearch
{
  void *v2;
  void *v3;
  void *v4;

  -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaSearch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromMediaSearch(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INMediaSearch *)v4;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_intents_preferredScaledImageSize
{
  double v2;
  double v3;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  v2 = 390.0;
  v3 = 390.0;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (INPrivatePlayMediaIntentData)privatePlayMediaIntentData
{
  void *v2;
  INPrivatePlayMediaIntentData *v3;
  void *v4;

  -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "privatePlayMediaIntentData");
  v3 = (INPrivatePlayMediaIntentData *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromPrivatePlayMediaIntentData(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INPrivatePlayMediaIntentData *)v4;
}

- (void)setHashedRouteUIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToStrings(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setHashedRouteUIDs:", v5);
}

- (void)setBuckets:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDataStrings(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setBuckets:", v5);
}

- (INPlayMediaIntent)initWithMediaItems:(NSArray *)mediaItems mediaContainer:(INMediaItem *)mediaContainer playShuffled:(NSNumber *)playShuffled playbackRepeatMode:(INPlaybackRepeatMode)playbackRepeatMode resumePlayback:(NSNumber *)resumePlayback
{
  return -[INPlayMediaIntent initWithMediaItems:mediaContainer:playShuffled:playbackRepeatMode:resumePlayback:playbackQueueLocation:playbackSpeed:mediaSearch:](self, "initWithMediaItems:mediaContainer:playShuffled:playbackRepeatMode:resumePlayback:playbackQueueLocation:playbackSpeed:mediaSearch:", mediaItems, mediaContainer, playShuffled, playbackRepeatMode, resumePlayback, 0, 0, 0);
}

- (id)_intents_backgroundHandlingAssertionForBundleIdentifier:(id)a3 context:(unint64_t)a4 error:(id *)a5
{
  -[INIntent _intents_allowAppToInitiatePlaybackForBundleIdentifier:context:error:](self, "_intents_allowAppToInitiatePlaybackForBundleIdentifier:context:error:", a3, a4, a5);
  return 0;
}

- (id)_titleWithLocalizer:(id)a3 fromBundleURL:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v23;
  objc_super v24;

  v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)INPlayMediaIntent;
  -[INIntent _titleWithLocalizer:fromBundleURL:](&v24, sel__titleWithLocalizer_fromBundleURL_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntent _intents_launchIdForCurrentPlatform](self, "_intents_launchIdForCurrentPlatform");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  INExtractAppInfoFromSiriLaunchId(v8, &v23, 0);
  v9 = v23;

  if (objc_msgSend(v9, "hasPrefix:", CFSTR("com.apple.")))
  {
    -[INPlayMediaIntent mediaContainer](self, "mediaContainer");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      -[INPlayMediaIntent mediaContainer](self, "mediaContainer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "type");

      if (v13 == 9)
      {
        -[INPlayMediaIntent resumePlayback](self, "resumePlayback");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "BOOLValue");

        v16 = (void *)MEMORY[0x1E0CB3940];
        if (v15)
          v17 = CFSTR("Resume %@ radio station");
        else
          v17 = CFSTR("Play %@ radio station");
        INLocalizedStringWithLocalizer(v17, 0, v6);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[INPlayMediaIntent mediaContainer](self, "mediaContainer");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "title");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", v18, v20);
        v21 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v21;
      }
    }
  }

  return v7;
}

- (void)setExpirationDate:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToTimestamp(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setExpirationDate:", v5);
}

- (void)setRecoID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRecoID:", v4);

}

- (void)setAudioSearchResults:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToMediaItemGroups(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAudioSearchResults:", v5);
}

- (void)setAlternativeResults:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToMediaItemGroups(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAlternativeResults:", v5);
}

- (void)setParsecCategory:(int64_t)a3
{
  void *v4;
  id v5;

  -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((unint64_t)a3 > 8)
    objc_msgSend(v4, "setHasParsecCategory:", 0);
  else
    objc_msgSend(v4, "setParsecCategory:", a3);

}

- (void)setProxiedBundleIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProxiedBundleIdentifier:", v4);

}

- (void)setPrivatePlayMediaIntentData:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToPrivatePlayMediaIntentData(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setPrivatePlayMediaIntentData:", v5);
}

- (id)_dictionaryRepresentation
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  INPlaybackRepeatMode v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  INPlaybackQueueLocation v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[7];
  _QWORD v25[8];

  v25[7] = *MEMORY[0x1E0C80C00];
  v24[0] = CFSTR("mediaItems");
  -[INPlayMediaIntent mediaItems](self, "mediaItems");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v3;
  v25[0] = v3;
  v24[1] = CFSTR("mediaContainer");
  -[INPlayMediaIntent mediaContainer](self, "mediaContainer");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v5;
  v25[1] = v5;
  v24[2] = CFSTR("playShuffled");
  -[INPlayMediaIntent playShuffled](self, "playShuffled");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v25[2] = v7;
  v24[3] = CFSTR("playbackRepeatMode");
  v9 = -[INPlayMediaIntent playbackRepeatMode](self, "playbackRepeatMode", v7);
  if ((unint64_t)(v9 - 1) > 2)
    v10 = CFSTR("unknown");
  else
    v10 = *(&off_1E22928B0 + v9 - 1);
  v11 = v10;
  v25[3] = v11;
  v24[4] = CFSTR("resumePlayback");
  -[INPlayMediaIntent resumePlayback](self, "resumePlayback");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[4] = v13;
  v24[5] = CFSTR("playbackQueueLocation");
  v14 = -[INPlayMediaIntent playbackQueueLocation](self, "playbackQueueLocation");
  if ((unint64_t)(v14 - 1) > 2)
    v15 = CFSTR("unknown");
  else
    v15 = off_1E22932E0[v14 - 1];
  v16 = v15;
  v25[5] = v16;
  v24[6] = CFSTR("playbackSpeed");
  -[INPlayMediaIntent playbackSpeed](self, "playbackSpeed");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[6] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)

  if (!v12)
  if (!v8)

  if (!v6)
  if (!v4)

  return v19;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  void *v5;
  id v6;

  -[INPlayMediaIntent _typedBackingStore](self, "_typedBackingStore", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v6, "copy");
  -[INIntent setBackingStore:](self, "setBackingStore:", v5);

}

- (id)_keyCodableAttributes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INIntent _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(v2, "keyAttribute");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeByName:", CFSTR("mediaContainer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithObjects:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)domain
{
  return CFSTR("Media");
}

- (id)verb
{
  return CFSTR("PlayMedia");
}

- (id)_spotlightContentType
{
  __CFString *v2;

  v2 = CFSTR("com.apple.siri.interaction.media");
  return CFSTR("com.apple.siri.interaction.media");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_intents_isExemptFromMulitWindowRequirementForInAppHandling
{
  return 1;
}

@end
