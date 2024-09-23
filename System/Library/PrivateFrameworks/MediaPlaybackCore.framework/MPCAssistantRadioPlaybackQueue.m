@implementation MPCAssistantRadioPlaybackQueue

- (MPCAssistantRadioPlaybackQueue)initWithContextID:(id)a3 stationStringID:(id)a4
{
  id v6;
  MPCAssistantRadioPlaybackQueue *v7;
  uint64_t v8;
  NSString *stationStringID;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MPCAssistantRadioPlaybackQueue;
  v7 = -[MPCAssistantPlaybackQueue initWithContextID:](&v11, sel_initWithContextID_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    stationStringID = v7->_stationStringID;
    v7->_stationStringID = (NSString *)v8;

  }
  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)MPCAssistantRadioPlaybackQueue;
  -[MPCAssistantRadioPlaybackQueue description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ station=%@"), v4, self->_stationStringID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (_MRSystemAppPlaybackQueue)createRemotePlaybackQueue
{
  _MRSystemAppPlaybackQueue *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (_MRSystemAppPlaybackQueue *)MRSystemAppPlaybackQueueCreate();
  MRSystemAppPlaybackQueueSetRadioStationIDType();
  MRSystemAppPlaybackQueueSetRadioStationStringIdentifier();
  -[MPCAssistantPlaybackQueue shouldImmediatelyStartPlayback](self, "shouldImmediatelyStartPlayback");
  MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback();
  -[MPCAssistantPlaybackQueue shouldOverrideManuallyCuratedQueue](self, "shouldOverrideManuallyCuratedQueue");
  MRSystemAppPlaybackQueueSetShouldOverrideManuallyCuratedQueue();
  -[MPCAssistantPlaybackQueue siriRecommendationID](self, "siriRecommendationID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MRSystemAppPlaybackQueueSetSiriRecommendationIdentifier();

  -[MPCAssistantPlaybackQueue siriAssetInfo](self, "siriAssetInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MRSystemAppPlaybackQueueSetSiriAssetInfo();

  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "featureName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MRSystemAppPlaybackQueueSetFeatureName();

  -[MPCAssistantPlaybackQueue siriWHAMetricsInfo](self, "siriWHAMetricsInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MRSystemAppPlaybackQueueSetSiriWHAMetricsInfo();

  return v3;
}

- (NSString)stationStringID
{
  return self->_stationStringID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stationStringID, 0);
}

+ (id)radioQueueWithContextID:(id)a3 stationStringID:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContextID:stationStringID:", v7, v6);

  return v8;
}

@end
