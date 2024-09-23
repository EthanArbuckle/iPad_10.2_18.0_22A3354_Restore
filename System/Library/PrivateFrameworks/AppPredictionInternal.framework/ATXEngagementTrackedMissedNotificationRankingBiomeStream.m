@implementation ATXEngagementTrackedMissedNotificationRankingBiomeStream

- (ATXEngagementTrackedMissedNotificationRankingBiomeStream)init
{
  void *v3;
  ATXEngagementTrackedMissedNotificationRankingBiomeStream *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXEngagementTrackedMissedNotificationRankingBiomeStream initFromCompletedMNRBiomeStream:](self, "initFromCompletedMNRBiomeStream:", v3);

  return v4;
}

- (id)initFromCompletedMNRBiomeStream:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "updateDatabase");
  v6 = -[ATXEngagementTrackedMissedNotificationRankingBiomeStream initFromCompletedMNRBiomeStream:resolutionSource:](self, "initFromCompletedMNRBiomeStream:resolutionSource:", v4, v5);

  return v6;
}

- (id)initFromCompletedMNRBiomeStream:(id)a3 resolutionSource:(id)a4
{
  id v7;
  id v8;
  ATXEngagementTrackedMissedNotificationRankingBiomeStream *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXEngagementTrackedMissedNotificationRankingBiomeStream;
  v9 = -[ATXEngagementTrackedMissedNotificationRankingBiomeStream init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_completedRankingStream, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (id)publisherFromStartTime:(double)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[ATXCompletedMissedNotificationRankingStream publisherFromStartTime:](self->_completedRankingStream, "publisherFromStartTime:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__ATXEngagementTrackedMissedNotificationRankingBiomeStream_publisherFromStartTime___block_invoke;
  v7[3] = &unk_1E82E9EC8;
  v7[4] = self;
  objc_msgSend(v4, "mapWithTransform:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __83__ATXEngagementTrackedMissedNotificationRankingBiomeStream_publisherFromStartTime___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "populateEngagementFromSource:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolutionSource, 0);
  objc_storeStrong((id *)&self->_completedRankingStream, 0);
}

@end
