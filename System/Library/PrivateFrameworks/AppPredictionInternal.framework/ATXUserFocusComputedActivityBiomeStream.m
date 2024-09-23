@implementation ATXUserFocusComputedActivityBiomeStream

- (ATXUserFocusComputedActivityBiomeStream)init
{
  void *v3;
  void *v4;
  void *v5;
  ATXUserFocusComputedActivityBiomeStream *v6;

  BiomeLibrary();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UserFocus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ComputedMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ATXUserFocusComputedActivityBiomeStream initFromUserFocusComputedModeStream:](self, "initFromUserFocusComputedModeStream:", v5);

  return v6;
}

- (id)initFromUserFocusComputedModeStream:(id)a3
{
  id v5;
  ATXUserFocusComputedActivityBiomeStream *v6;
  ATXUserFocusComputedActivityBiomeStream *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXUserFocusComputedActivityBiomeStream;
  v6 = -[ATXUserFocusComputedActivityBiomeStream init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_computedModeStream, a3);

  return v7;
}

- (id)_transitionPublisherFromComputedModeStreamPublisher:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "filterWithIsIncluded:", &__block_literal_global_170);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mapWithTransform:", &__block_literal_global_5_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL __95__ATXUserFocusComputedActivityBiomeStream__transitionPublisherFromComputedModeStreamPublisher___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "eventBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

id __95__ATXUserFocusComputedActivityBiomeStream__transitionPublisherFromComputedModeStreamPublisher___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  double v5;
  ATXUnifiedInferredActivityTransition *v6;
  double v7;
  double v8;
  id v9;

  v2 = a2;
  objc_msgSend(v2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "semanticType");
  BMUserFocusInferredModeTypeFromBMUserFocusModeComputedSemanticType();
  v4 = BMUserFocusInferredModeTypeToActivity();
  if (v4 == 14)
    v5 = 0.0;
  else
    v5 = 1.0;
  v6 = [ATXUnifiedInferredActivityTransition alloc];
  objc_msgSend(v2, "timestamp");
  v8 = v7;

  v9 = -[ATXUnifiedInferredActivityTransition initFromTransitionTime:isEntryEvent:source:activityType:confidence:](v6, "initFromTransitionTime:isEntryEvent:source:activityType:confidence:", objc_msgSend(v3, "starting"), CFSTR("computedModeActivity"), v4, v8, v5);
  return v9;
}

- (id)sessionPublisherFromStartTime:(double)a3
{
  void *v3;
  void *v4;

  -[ATXUserFocusComputedActivityBiomeStream transitionPublisherFromStartTime:](self, "transitionPublisherFromStartTime:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXUnifiedActivityStreamConversions sessionPublisherFromTransitionPublisher:](_ATXUnifiedActivityStreamConversions, "sessionPublisherFromTransitionPublisher:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)transitionPublisherFromStartTime:(double)a3
{
  BMStream *computedModeStream;
  void *v5;
  void *v6;
  void *v7;

  computedModeStream = self->_computedModeStream;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMStream atx_publisherFromStartTime:](computedModeStream, "atx_publisherFromStartTime:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXUserFocusComputedActivityBiomeStream _transitionPublisherFromComputedModeStreamPublisher:](self, "_transitionPublisherFromComputedModeStreamPublisher:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)transitionPublisherFromStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 lastN:(id)a6 reversed:(BOOL)a7
{
  void *v8;
  void *v9;

  -[BMStream atx_publisherWithStartTime:endTime:maxEvents:lastN:reversed:](self->_computedModeStream, "atx_publisherWithStartTime:endTime:maxEvents:lastN:reversed:", a3, a4, a5, a6, a7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXUserFocusComputedActivityBiomeStream _transitionPublisherFromComputedModeStreamPublisher:](self, "_transitionPublisherFromComputedModeStreamPublisher:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_computedModeStream, 0);
}

@end
