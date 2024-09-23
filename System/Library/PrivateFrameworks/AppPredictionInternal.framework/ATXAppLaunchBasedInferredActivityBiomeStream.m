@implementation ATXAppLaunchBasedInferredActivityBiomeStream

- (ATXAppLaunchBasedInferredActivityBiomeStream)init
{
  void *v3;
  ATXAppLaunchBasedInferredActivityBiomeStream *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXAppLaunchBasedInferredActivityBiomeStream initWithInferredModeSessionStream:](self, "initWithInferredModeSessionStream:", v3);

  return v4;
}

- (ATXAppLaunchBasedInferredActivityBiomeStream)initWithInferredModeSessionStream:(id)a3
{
  id v5;
  ATXAppLaunchBasedInferredActivityBiomeStream *v6;
  ATXAppLaunchBasedInferredActivityBiomeStream *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXAppLaunchBasedInferredActivityBiomeStream;
  v6 = -[ATXAppLaunchBasedInferredActivityBiomeStream init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_modeSessionStream, a3);

  return v7;
}

- (id)sessionPublisherFromStartTime:(double)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[ATXAppLaunchInferredModeSessionBiomeStream publisherFromStartTime:](self->_modeSessionStream, "publisherFromStartTime:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mapWithTransform:", &__block_literal_global_73);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mapWithTransform:", &__block_literal_global_5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __78__ATXAppLaunchBasedInferredActivityBiomeStream_sessionPublisherFromStartTime___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "eventBody");
}

id __78__ATXAppLaunchBasedInferredActivityBiomeStream_sessionPublisherFromStartTime___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  ATXUnifiedInferredActivitySession *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;

  v2 = a2;
  v3 = [ATXUnifiedInferredActivitySession alloc];
  objc_msgSend(v2, "startTime");
  v5 = v4;
  objc_msgSend(v2, "endTime");
  v7 = v6;
  v8 = objc_msgSend(v2, "inferredActivityType");
  objc_msgSend(v2, "confidence");
  v10 = v9;

  return -[ATXUnifiedInferredActivitySession initFromStartTime:endTime:source:activityType:confidence:](v3, "initFromStartTime:endTime:source:activityType:confidence:", CFSTR("appLaunchInferredActivity"), v8, v5, v7, v10);
}

- (id)transitionPublisherFromStartTime:(double)a3
{
  void *v3;
  void *v4;

  -[ATXAppLaunchBasedInferredActivityBiomeStream sessionPublisherFromStartTime:](self, "sessionPublisherFromStartTime:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXUnifiedActivityStreamConversions transitionPublisherFromSessionPublisher:](_ATXUnifiedActivityStreamConversions, "transitionPublisherFromSessionPublisher:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeSessionStream, 0);
}

@end
