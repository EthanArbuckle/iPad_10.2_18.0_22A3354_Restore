@implementation MPCAssistantCustomDataPlaybackQueue

- (MPCAssistantCustomDataPlaybackQueue)initWithContextID:(id)a3 identifier:(id)a4 customData:(id)a5
{
  id v8;
  id v9;
  MPCAssistantCustomDataPlaybackQueue *v10;
  uint64_t v11;
  NSString *identifier;
  uint64_t v13;
  NSData *customData;
  objc_super v16;

  v8 = a4;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MPCAssistantCustomDataPlaybackQueue;
  v10 = -[MPCAssistantPlaybackQueue initWithContextID:](&v16, sel_initWithContextID_, a3);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    customData = v10->_customData;
    v10->_customData = (NSData *)v13;

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
  v7.super_class = (Class)MPCAssistantCustomDataPlaybackQueue;
  -[MPCAssistantCustomDataPlaybackQueue description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ identifier=%@"), v4, self->_identifier);
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
  void *v9;

  v3 = (_MRSystemAppPlaybackQueue *)MRSystemAppPlaybackQueueCreate();
  -[MPCAssistantPlaybackQueue shouldImmediatelyStartPlayback](self, "shouldImmediatelyStartPlayback");
  MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback();
  -[MPCAssistantPlaybackQueue siriRecommendationID](self, "siriRecommendationID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MRSystemAppPlaybackQueueSetSiriRecommendationIdentifier();

  -[MPCAssistantPlaybackQueue siriAssetInfo](self, "siriAssetInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MRSystemAppPlaybackQueueSetSiriAssetInfo();

  -[MPCAssistantPlaybackQueue featureName](self, "featureName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MRSystemAppPlaybackQueueSetFeatureName();

  -[MPCAssistantPlaybackQueue siriWHAMetricsInfo](self, "siriWHAMetricsInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MRSystemAppPlaybackQueueSetSiriWHAMetricsInfo();

  -[MPCAssistantCustomDataPlaybackQueue identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MRSystemAppPlaybackQueueSetCustomDataIdentifier();

  -[MPCAssistantCustomDataPlaybackQueue customData](self, "customData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  MRSystemAppPlaybackQueueSetCustomData();

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSData)customData
{
  return self->_customData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)customDataQueueWithContextID:(id)a3 identifier:(id)a4 customData:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContextID:identifier:customData:", v10, v9, v8);

  return v11;
}

@end
