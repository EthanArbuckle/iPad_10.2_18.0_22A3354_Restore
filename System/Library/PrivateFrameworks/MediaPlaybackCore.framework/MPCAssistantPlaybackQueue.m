@implementation MPCAssistantPlaybackQueue

- (MPCAssistantPlaybackQueue)initWithContextID:(id)a3
{
  id v4;
  MPCAssistantPlaybackQueue *v5;
  uint64_t v6;
  NSString *contextID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPCAssistantPlaybackQueue;
  v5 = -[MPCAssistantPlaybackQueue init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    contextID = v5->_contextID;
    v5->_contextID = (NSString *)v6;

  }
  return v5;
}

- (void)getPlaybackQueueWithDestination:(id)a3 completion:(id)a4
{
  void (**v5)(id, id, _QWORD);
  _MRSystemAppPlaybackQueue *v6;
  id v7;

  v5 = (void (**)(id, id, _QWORD))a4;
  v6 = -[MPCAssistantPlaybackQueue createRemotePlaybackQueue](self, "createRemotePlaybackQueue");
  objc_msgSend(MEMORY[0x24BDDCB88], "queueWithMediaRemotePlaybackQueue:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v7, 0);

}

- (_MRSystemAppPlaybackQueue)createRemotePlaybackQueue
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *ExternalRepresentation;
  _MRSystemAppPlaybackQueue *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  NSObject *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__13843;
  v20 = __Block_byref_object_dispose__13844;
  v21 = 0;
  +[MPCAssistantRemoteControlDestination nowPlayingApplicationDestination](MPCAssistantRemoteControlDestination, "nowPlayingApplicationDestination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __54__MPCAssistantPlaybackQueue_createRemotePlaybackQueue__block_invoke;
  v13 = &unk_24CAB56F0;
  v15 = &v16;
  v5 = v3;
  v14 = v5;
  -[MPCAssistantPlaybackQueue getPlaybackQueueWithDestination:completion:](self, "getPlaybackQueueWithDestination:completion:", v4, &v10);

  dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  v6 = objc_retainAutorelease((id)v17[5]);
  objc_msgSend(v6, "_mediaRemotePlaybackQueue", v10, v11, v12, v13);
  ExternalRepresentation = (void *)MRSystemAppPlaybackQueueCreateExternalRepresentation();
  v8 = (_MRSystemAppPlaybackQueue *)MRSystemAppPlaybackQueueCreateFromExternalRepresentation();

  _Block_object_dispose(&v16, 8);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *contextID;
  id v5;

  contextID = self->_contextID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", contextID, CFSTR("ContextID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldOverrideManuallyCuratedQueue, CFSTR("ShouldOverrideManuallyCuratedQueue"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldImmediatelyStartPlayback, CFSTR("ShouldImmediatelyStartPlayback"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_siriRecommendationID, CFSTR("SiriRecommendationID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_siriAssetInfo, CFSTR("SiriAssetInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_featureName, CFSTR("FeatureName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_queueGroupingID, CFSTR("QueueGroupingID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_siriWHAMetricsInfo, CFSTR("SiriWHAMetricsInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userIdentity, CFSTR("UserIdentity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_homeKitUserIdentifier, CFSTR("HomeKitUserIdentifier"));

}

- (MPCAssistantPlaybackQueue)initWithCoder:(id)a3
{
  id v4;
  MPCAssistantPlaybackQueue *v5;
  uint64_t v6;
  NSString *contextID;
  uint64_t v8;
  NSString *siriRecommendationID;
  uint64_t v10;
  NSString *siriAssetInfo;
  uint64_t v12;
  NSString *featureName;
  uint64_t v14;
  NSString *queueGroupingID;
  uint64_t v16;
  NSDictionary *siriWHAMetricsInfo;
  uint64_t v18;
  ICUserIdentity *userIdentity;
  uint64_t v20;
  NSString *homeKitUserIdentifier;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MPCAssistantPlaybackQueue;
  v5 = -[MPCAssistantPlaybackQueue init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ContextID"));
    v6 = objc_claimAutoreleasedReturnValue();
    contextID = v5->_contextID;
    v5->_contextID = (NSString *)v6;

    v5->_shouldOverrideManuallyCuratedQueue = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ShouldOverrideManuallyCuratedQueue"));
    v5->_shouldImmediatelyStartPlayback = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ShouldImmediatelyStartPlayback"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SiriRecommendationID"));
    v8 = objc_claimAutoreleasedReturnValue();
    siriRecommendationID = v5->_siriRecommendationID;
    v5->_siriRecommendationID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SiriAssetInfo"));
    v10 = objc_claimAutoreleasedReturnValue();
    siriAssetInfo = v5->_siriAssetInfo;
    v5->_siriAssetInfo = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FeatureName"));
    v12 = objc_claimAutoreleasedReturnValue();
    featureName = v5->_featureName;
    v5->_featureName = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("QueueGroupingID"));
    v14 = objc_claimAutoreleasedReturnValue();
    queueGroupingID = v5->_queueGroupingID;
    v5->_queueGroupingID = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SiriWHAMetricsInfo"));
    v16 = objc_claimAutoreleasedReturnValue();
    siriWHAMetricsInfo = v5->_siriWHAMetricsInfo;
    v5->_siriWHAMetricsInfo = (NSDictionary *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UserIdentity"));
    v18 = objc_claimAutoreleasedReturnValue();
    userIdentity = v5->_userIdentity;
    v5->_userIdentity = (ICUserIdentity *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HomeKitUserIdentifier"));
    v20 = objc_claimAutoreleasedReturnValue();
    homeKitUserIdentifier = v5->_homeKitUserIdentifier;
    v5->_homeKitUserIdentifier = (NSString *)v20;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v4 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[MPCAssistantPlaybackQueue contextID](self, "contextID");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v5;

  *(_BYTE *)(v4 + 8) = -[MPCAssistantPlaybackQueue shouldOverrideManuallyCuratedQueue](self, "shouldOverrideManuallyCuratedQueue");
  *(_BYTE *)(v4 + 9) = -[MPCAssistantPlaybackQueue shouldImmediatelyStartPlayback](self, "shouldImmediatelyStartPlayback");
  -[MPCAssistantPlaybackQueue siriRecommendationID](self, "siriRecommendationID");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v7;

  -[MPCAssistantPlaybackQueue siriAssetInfo](self, "siriAssetInfo");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v9;

  -[MPCAssistantPlaybackQueue featureName](self, "featureName");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v11;

  -[MPCAssistantPlaybackQueue queueGroupingID](self, "queueGroupingID");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = v13;

  -[MPCAssistantPlaybackQueue siriWHAMetricsInfo](self, "siriWHAMetricsInfo");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(void **)(v4 + 56);
  *(_QWORD *)(v4 + 56) = v15;

  -[MPCAssistantPlaybackQueue userIdentity](self, "userIdentity");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = *(void **)(v4 + 64);
  *(_QWORD *)(v4 + 64) = v17;

  -[MPCAssistantPlaybackQueue homeKitUserIdentifier](self, "homeKitUserIdentifier");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = *(void **)(v4 + 72);
  *(_QWORD *)(v4 + 72) = v19;

  return (id)v4;
}

- (NSString)contextID
{
  return self->_contextID;
}

- (BOOL)shouldOverrideManuallyCuratedQueue
{
  return self->_shouldOverrideManuallyCuratedQueue;
}

- (void)setShouldOverrideManuallyCuratedQueue:(BOOL)a3
{
  self->_shouldOverrideManuallyCuratedQueue = a3;
}

- (BOOL)shouldImmediatelyStartPlayback
{
  return self->_shouldImmediatelyStartPlayback;
}

- (void)setShouldImmediatelyStartPlayback:(BOOL)a3
{
  self->_shouldImmediatelyStartPlayback = a3;
}

- (NSString)siriRecommendationID
{
  return self->_siriRecommendationID;
}

- (void)setSiriRecommendationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)siriAssetInfo
{
  return self->_siriAssetInfo;
}

- (void)setSiriAssetInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)featureName
{
  return self->_featureName;
}

- (void)setFeatureName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)queueGroupingID
{
  return self->_queueGroupingID;
}

- (void)setQueueGroupingID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDictionary)siriWHAMetricsInfo
{
  return self->_siriWHAMetricsInfo;
}

- (void)setSiriWHAMetricsInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (ICUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (void)setUserIdentity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)homeKitUserIdentifier
{
  return self->_homeKitUserIdentifier;
}

- (void)setHomeKitUserIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeKitUserIdentifier, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_siriWHAMetricsInfo, 0);
  objc_storeStrong((id *)&self->_queueGroupingID, 0);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_storeStrong((id *)&self->_siriAssetInfo, 0);
  objc_storeStrong((id *)&self->_siriRecommendationID, 0);
  objc_storeStrong((id *)&self->_contextID, 0);
}

void __54__MPCAssistantPlaybackQueue_createRemotePlaybackQueue__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
