@implementation MPCAssistantStoreTracklistPlaybackQueue

- (MPCAssistantStoreTracklistPlaybackQueue)initWithContextID:(id)a3 storeItemIDs:(id)a4 collectionIdentifierSet:(id)a5
{
  id v8;
  id v9;
  MPCAssistantStoreTracklistPlaybackQueue *v10;
  uint64_t v11;
  NSArray *storeItemIDs;
  objc_super v14;

  v8 = a4;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MPCAssistantStoreTracklistPlaybackQueue;
  v10 = -[MPCAssistantPlaybackQueue initWithContextID:](&v14, sel_initWithContextID_, a3);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    storeItemIDs = v10->_storeItemIDs;
    v10->_storeItemIDs = (NSArray *)v11;

    objc_storeStrong((id *)&v10->_collectionIdentifierSet, a5);
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)MPCAssistantStoreTracklistPlaybackQueue;
  -[MPCAssistantStoreTracklistPlaybackQueue description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ collection=%@ identifiers=%@"), v4, self->_collectionIdentifierSet, self->_storeItemIDs);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (_MRSystemAppPlaybackQueue)createRemotePlaybackQueue
{
  _MRSystemAppPlaybackQueue *v3;
  MPIdentifierSet *collectionIdentifierSet;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (_MRSystemAppPlaybackQueue *)MRSystemAppPlaybackQueueCreate();
  MPShuffleTypeToMediaRemoteShuffleMode();
  MRSystemAppPlaybackQueueSetTracklistShuffleMode();
  MRSystemAppPlaybackQueueSetTracklistRepeatMode();
  collectionIdentifierSet = self->_collectionIdentifierSet;
  if (collectionIdentifierSet)
  {
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", collectionIdentifierSet, 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    MRSystemAppPlaybackQueueSetTracklistCollectionIdentifierSetData();

  }
  MRSystemAppPlaybackQueueSetGenericTrackIdentifiers();
  -[MPCAssistantPlaybackQueue shouldOverrideManuallyCuratedQueue](self, "shouldOverrideManuallyCuratedQueue");
  MRSystemAppPlaybackQueueSetShouldOverrideManuallyCuratedQueue();
  -[MPCAssistantPlaybackQueue shouldImmediatelyStartPlayback](self, "shouldImmediatelyStartPlayback");
  MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback();
  -[MPCAssistantPlaybackQueue siriRecommendationID](self, "siriRecommendationID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MRSystemAppPlaybackQueueSetSiriRecommendationIdentifier();

  -[MPCAssistantPlaybackQueue siriAssetInfo](self, "siriAssetInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MRSystemAppPlaybackQueueSetSiriAssetInfo();

  -[MPCAssistantPlaybackQueue featureName](self, "featureName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MRSystemAppPlaybackQueueSetFeatureName();

  -[MPCAssistantPlaybackQueue siriWHAMetricsInfo](self, "siriWHAMetricsInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  MRSystemAppPlaybackQueueSetSiriWHAMetricsInfo();

  return v3;
}

- (NSArray)storeItemIDs
{
  return self->_storeItemIDs;
}

- (int64_t)shuffleType
{
  return self->_shuffleType;
}

- (void)setShuffleType:(int64_t)a3
{
  self->_shuffleType = a3;
}

- (MPIdentifierSet)collectionIdentifierSet
{
  return self->_collectionIdentifierSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionIdentifierSet, 0);
  objc_storeStrong((id *)&self->_storeItemIDs, 0);
}

+ (id)storeTracklistQueueWithContextID:(id)a3 storeItemIDs:(id)a4 collectionIdentifierSet:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContextID:storeItemIDs:collectionIdentifierSet:", v10, v9, v8);

  return v11;
}

@end
