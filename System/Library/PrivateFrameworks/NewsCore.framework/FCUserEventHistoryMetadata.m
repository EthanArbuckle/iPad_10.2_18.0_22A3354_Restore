@implementation FCUserEventHistoryMetadata

- (FCUserEventHistoryMetadata)initWithAggregateStoreGenerationTime:(int64_t)a3 aggregateTotalCount:(int64_t)a4 meanCountOfEvents:(double)a5 sessionsOnDiskSize:(int64_t)a6 standardDeviationOfEvents:(double)a7 totalEventsCount:(int64_t)a8 headlineEventCount:(int64_t)a9 headlinesWithValidTitleEmbeddingsEventCount:(int64_t)a10 headlinesWithInvalidTitleEmbeddingsEventCount:(int64_t)a11 headlinesWithValidBodyEmbeddingsEventCount:(int64_t)a12 headlinesWithInvalidBodyEmbeddingsEventCount:(int64_t)a13 eventCounts:(id)a14 aggregateStoreData:(id)a15
{
  id v23;
  id v24;
  FCUserEventHistoryMetadata *v25;
  FCUserEventHistoryMetadata *v26;
  objc_super v29;

  v23 = a14;
  v24 = a15;
  v29.receiver = self;
  v29.super_class = (Class)FCUserEventHistoryMetadata;
  v25 = -[FCUserEventHistoryMetadata init](&v29, sel_init);
  v26 = v25;
  if (v25)
  {
    v25->_sessionsOnDiskSize = a6;
    v25->_aggregateStoreGenerationTime = a3;
    v25->_aggregateTotalCount = a4;
    v25->_meanCountOfEvents = a5;
    v25->_standardDeviationOfEvents = a7;
    v25->_totalEventsCount = a8;
    v25->_headlineEventCount = a9;
    v25->_headlinesWithValidTitleEmbeddingsEventCount = a10;
    v25->_headlinesWithInvalidTitleEmbeddingsEventCount = a11;
    v25->_headlinesWithValidBodyEmbeddingsEventCount = a12;
    v25->_headlinesWithInvalidBodyEmbeddingsEventCount = a13;
    objc_storeStrong((id *)&v25->_eventCounts, a14);
    objc_storeStrong((id *)&v26->_aggregateStoreData, a15);
  }

  return v26;
}

+ (id)emptyWithSessionsOnDiskSize:(int64_t)a3 personalizationAnalyticsEnabled:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = objc_alloc((Class)a1);
  v7 = v6;
  if (a4)
  {
    +[FCUserEventHistoryEventCounts empty](FCUserEventHistoryEventCounts, "empty");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCUserEventHistoryAggregateStoreData empty](FCUserEventHistoryAggregateStoreData, "empty");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithAggregateStoreGenerationTime:aggregateTotalCount:meanCountOfEvents:sessionsOnDiskSize:standardDeviationOfEvents:totalEventsCount:headlineEventCount:headlinesWithValidTitleEmbeddingsEventCount:headlinesWithInvalidTitleEmbeddingsEventCount:headlinesWithValidBodyEmbeddingsEventCount:headlinesWithInvalidBodyEmbeddingsEventCount:eventCounts:aggregateStoreData:", -1, -1, a3, -1, -1, -1, -1.0, -1.0, -1, -1, -1, v8, v9);

  }
  else
  {
    v10 = (void *)objc_msgSend(v6, "initWithAggregateStoreGenerationTime:aggregateTotalCount:meanCountOfEvents:sessionsOnDiskSize:standardDeviationOfEvents:totalEventsCount:headlineEventCount:headlinesWithValidTitleEmbeddingsEventCount:headlinesWithInvalidTitleEmbeddingsEventCount:headlinesWithValidBodyEmbeddingsEventCount:headlinesWithInvalidBodyEmbeddingsEventCount:eventCounts:aggregateStoreData:", -1, -1, a3, -1, -1, -1, -1.0, -1.0, -1, -1, -1, 0, 0);
  }
  return v10;
}

- (id)description
{
  int64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  int64_t v13;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int64_t v19;
  void *v20;

  v20 = (void *)MEMORY[0x1E0CB3940];
  v19 = -[FCUserEventHistoryMetadata aggregateStoreGenerationTime](self, "aggregateStoreGenerationTime");
  v3 = -[FCUserEventHistoryMetadata sessionsOnDiskSize](self, "sessionsOnDiskSize");
  v4 = -[FCUserEventHistoryMetadata aggregateTotalCount](self, "aggregateTotalCount");
  -[FCUserEventHistoryMetadata meanCountOfEvents](self, "meanCountOfEvents");
  v6 = v5;
  -[FCUserEventHistoryMetadata standardDeviationOfEvents](self, "standardDeviationOfEvents");
  v8 = v7;
  v9 = -[FCUserEventHistoryMetadata totalEventsCount](self, "totalEventsCount");
  v10 = -[FCUserEventHistoryMetadata headlineEventCount](self, "headlineEventCount");
  v11 = -[FCUserEventHistoryMetadata headlinesWithValidTitleEmbeddingsEventCount](self, "headlinesWithValidTitleEmbeddingsEventCount");
  v12 = -[FCUserEventHistoryMetadata headlinesWithInvalidTitleEmbeddingsEventCount](self, "headlinesWithInvalidTitleEmbeddingsEventCount");
  v13 = -[FCUserEventHistoryMetadata headlinesWithValidBodyEmbeddingsEventCount](self, "headlinesWithValidBodyEmbeddingsEventCount");
  v14 = -[FCUserEventHistoryMetadata headlinesWithInvalidBodyEmbeddingsEventCount](self, "headlinesWithInvalidBodyEmbeddingsEventCount");
  -[FCUserEventHistoryMetadata eventCounts](self, "eventCounts");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserEventHistoryMetadata aggregateStoreData](self, "aggregateStoreData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("User Event History Metadata { aggregateStoreGenerationTime: %lld sessionsOnDiskSize: %lld aggregateTotalCount: %lld meanCountOfEvents: %.4f standardDeviationOfEvents: %.4f totalEventsCount: %lld headlineEventCount: %lld headlinesWithValidTitleEmbeddingsEventCount: %lld headlinesWithInvalidTitleEmbeddingsEventCount: %lld headlinesWithValidBodyEmbeddingsEventCount: %lld headlinesWithInvalidBodyEmbeddingsEventCount: %lld eventCounts: %@ aggregateStoreData: %@ }"), v19, v3, v4, v6, v8, v9, v10, v11, v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (int64_t)aggregateStoreGenerationTime
{
  return self->_aggregateStoreGenerationTime;
}

- (void)setAggregateStoreGenerationTime:(int64_t)a3
{
  self->_aggregateStoreGenerationTime = a3;
}

- (int64_t)aggregateTotalCount
{
  return self->_aggregateTotalCount;
}

- (void)setAggregateTotalCount:(int64_t)a3
{
  self->_aggregateTotalCount = a3;
}

- (double)meanCountOfEvents
{
  return self->_meanCountOfEvents;
}

- (void)setMeanCountOfEvents:(double)a3
{
  self->_meanCountOfEvents = a3;
}

- (int64_t)sessionsOnDiskSize
{
  return self->_sessionsOnDiskSize;
}

- (void)setSessionsOnDiskSize:(int64_t)a3
{
  self->_sessionsOnDiskSize = a3;
}

- (double)standardDeviationOfEvents
{
  return self->_standardDeviationOfEvents;
}

- (void)setStandardDeviationOfEvents:(double)a3
{
  self->_standardDeviationOfEvents = a3;
}

- (int64_t)totalEventsCount
{
  return self->_totalEventsCount;
}

- (void)setTotalEventsCount:(int64_t)a3
{
  self->_totalEventsCount = a3;
}

- (int64_t)headlineEventCount
{
  return self->_headlineEventCount;
}

- (void)setHeadlineEventCount:(int64_t)a3
{
  self->_headlineEventCount = a3;
}

- (int64_t)headlinesWithValidTitleEmbeddingsEventCount
{
  return self->_headlinesWithValidTitleEmbeddingsEventCount;
}

- (void)setHeadlinesWithValidTitleEmbeddingsEventCount:(int64_t)a3
{
  self->_headlinesWithValidTitleEmbeddingsEventCount = a3;
}

- (int64_t)headlinesWithInvalidTitleEmbeddingsEventCount
{
  return self->_headlinesWithInvalidTitleEmbeddingsEventCount;
}

- (void)setHeadlinesWithInvalidTitleEmbeddingsEventCount:(int64_t)a3
{
  self->_headlinesWithInvalidTitleEmbeddingsEventCount = a3;
}

- (int64_t)headlinesWithValidBodyEmbeddingsEventCount
{
  return self->_headlinesWithValidBodyEmbeddingsEventCount;
}

- (void)setHeadlinesWithValidBodyEmbeddingsEventCount:(int64_t)a3
{
  self->_headlinesWithValidBodyEmbeddingsEventCount = a3;
}

- (int64_t)headlinesWithInvalidBodyEmbeddingsEventCount
{
  return self->_headlinesWithInvalidBodyEmbeddingsEventCount;
}

- (void)setHeadlinesWithInvalidBodyEmbeddingsEventCount:(int64_t)a3
{
  self->_headlinesWithInvalidBodyEmbeddingsEventCount = a3;
}

- (FCUserEventHistoryEventCounts)eventCounts
{
  return self->_eventCounts;
}

- (void)setEventCounts:(id)a3
{
  objc_storeStrong((id *)&self->_eventCounts, a3);
}

- (FCUserEventHistoryAggregateStoreData)aggregateStoreData
{
  return self->_aggregateStoreData;
}

- (void)setAggregateStoreData:(id)a3
{
  objc_storeStrong((id *)&self->_aggregateStoreData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregateStoreData, 0);
  objc_storeStrong((id *)&self->_eventCounts, 0);
}

@end
