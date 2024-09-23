@implementation ATXHeuristicInferredActivityBiomeStream

- (ATXHeuristicInferredActivityBiomeStream)init
{
  void *v3;
  void *v4;
  void *v5;
  ATXHeuristicInferredActivityBiomeStream *v6;

  BiomeLibrary();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UserFocus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "InferredMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ATXHeuristicInferredActivityBiomeStream initFromInferredModeStream:](self, "initFromInferredModeStream:", v5);

  return v6;
}

- (id)initFromInferredModeStream:(id)a3
{
  id v5;
  ATXHeuristicInferredActivityBiomeStream *v6;
  ATXHeuristicInferredActivityBiomeStream *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXHeuristicInferredActivityBiomeStream;
  v6 = -[ATXHeuristicInferredActivityBiomeStream init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_heuristicEventBiomeStream, a3);

  return v7;
}

- (id)_transitionPublisherFromInferredModePublisher:(id)a3
{
  return (id)objc_msgSend(a3, "mapWithTransform:", &__block_literal_global_24);
}

id __89__ATXHeuristicInferredActivityBiomeStream__transitionPublisherFromInferredModePublisher___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  double v4;
  ATXUnifiedInferredActivityTransition *v5;
  void *v6;
  double v7;
  id v8;

  objc_msgSend(a2, "eventBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modeType");
  v3 = BMUserFocusInferredModeTypeToActivity();
  if (v3 == 14)
    v4 = 0.0;
  else
    v4 = 1.0;
  v5 = [ATXUnifiedInferredActivityTransition alloc];
  objc_msgSend(v2, "absoluteTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v8 = -[ATXUnifiedInferredActivityTransition initFromTransitionTime:isEntryEvent:source:activityType:confidence:](v5, "initFromTransitionTime:isEntryEvent:source:activityType:confidence:", objc_msgSend(v2, "isStart"), CFSTR("heuristicInferredActivity"), v3, v7, v4);

  return v8;
}

- (id)sessionPublisherFromStartTime:(double)a3
{
  void *v3;
  void *v4;

  -[ATXHeuristicInferredActivityBiomeStream transitionPublisherFromStartTime:](self, "transitionPublisherFromStartTime:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXUnifiedActivityStreamConversions sessionPublisherFromTransitionPublisher:](_ATXUnifiedActivityStreamConversions, "sessionPublisherFromTransitionPublisher:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)transitionPublisherFromStartTime:(double)a3
{
  BMStream *heuristicEventBiomeStream;
  void *v5;
  void *v6;
  void *v7;

  heuristicEventBiomeStream = self->_heuristicEventBiomeStream;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMStream atx_publisherFromStartTime:](heuristicEventBiomeStream, "atx_publisherFromStartTime:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHeuristicInferredActivityBiomeStream _transitionPublisherFromInferredModePublisher:](self, "_transitionPublisherFromInferredModePublisher:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)transitionPublisherFromStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 lastN:(id)a6 reversed:(BOOL)a7
{
  void *v8;
  void *v9;

  -[BMStream atx_publisherWithStartTime:endTime:maxEvents:lastN:reversed:](self->_heuristicEventBiomeStream, "atx_publisherWithStartTime:endTime:maxEvents:lastN:reversed:", a3, a4, a5, a6, a7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHeuristicInferredActivityBiomeStream _transitionPublisherFromInferredModePublisher:](self, "_transitionPublisherFromInferredModePublisher:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heuristicEventBiomeStream, 0);
}

@end
