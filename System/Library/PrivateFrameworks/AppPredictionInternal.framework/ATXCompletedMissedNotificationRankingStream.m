@implementation ATXCompletedMissedNotificationRankingStream

- (ATXCompletedMissedNotificationRankingStream)init
{
  void *v3;
  ATXCompletedMissedNotificationRankingStream *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXCompletedMissedNotificationRankingStream initFromMissedNotificationRankingEventBiomeStream:](self, "initFromMissedNotificationRankingEventBiomeStream:", v3);

  return v4;
}

- (id)initFromMissedNotificationRankingEventBiomeStream:(id)a3
{
  id v5;
  ATXCompletedMissedNotificationRankingStream *v6;
  ATXCompletedMissedNotificationRankingStream *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXCompletedMissedNotificationRankingStream;
  v6 = -[ATXCompletedMissedNotificationRankingStream init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_rawMNREventStream, a3);

  return v7;
}

- (id)publisherFromStartTime:(double)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[ATXMissedNotificationRankingBiomeStream publisherFromStartTime:](self->_rawMNREventStream, "publisherFromStartTime:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "scanWithInitial:nextPartialResult:", v4, &__block_literal_global_186);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filterWithIsIncluded:", &__block_literal_global_54);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mapWithTransform:", &__block_literal_global_56_0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

_ATXActiveMissedNotificationRankingTuple *__70__ATXCompletedMissedNotificationRankingStream_publisherFromStartTime___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _ATXActiveMissedNotificationRankingTuple *v6;
  void *v7;
  _ATXActiveMissedNotificationRankingTuple *v8;

  v4 = a3;
  v5 = a2;
  v6 = [_ATXActiveMissedNotificationRankingTuple alloc];
  objc_msgSend(v4, "eventBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[_ATXActiveMissedNotificationRankingTuple initWithPreviousTuple:nextRankingEvent:](v6, "initWithPreviousTuple:nextRankingEvent:", v5, v7);
  return v8;
}

BOOL __70__ATXCompletedMissedNotificationRankingStream_publisherFromStartTime___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "justCompletedRanking");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t __70__ATXCompletedMissedNotificationRankingStream_publisherFromStartTime___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "justCompletedRanking");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawMNREventStream, 0);
}

@end
