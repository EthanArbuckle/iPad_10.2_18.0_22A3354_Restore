@implementation ATXProactiveSuggestionClientModelEvaluatorPublishers

- (ATXProactiveSuggestionClientModelEvaluatorPublishers)initWithStartTime:(id)a3 endTime:(id)a4
{
  id v6;
  id v7;
  ATXProactiveSuggestionClientModelEvaluatorPublishers *v8;
  uint64_t v9;
  NSNumber *startTime;
  uint64_t v11;
  NSNumber *endTime;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXProactiveSuggestionClientModelEvaluatorPublishers;
  v8 = -[ATXProactiveSuggestionClientModelEvaluatorPublishers init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    startTime = v8->_startTime;
    v8->_startTime = (NSNumber *)v9;

    v11 = objc_msgSend(v7, "copy");
    endTime = v8->_endTime;
    v8->_endTime = (NSNumber *)v11;

  }
  return v8;
}

- (BPSPublisher)shadowCandidatePublisher
{
  void *v3;
  void *v4;
  void *v5;

  +[ATXCandidateRelevanceModelDatasetGeneratorConfigApp candidatePublisherWithStartTime:endTime:](ATXCandidateRelevanceModelDatasetGeneratorConfigApp, "candidatePublisherWithStartTime:endTime:", self->_startTime, self->_endTime);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXCandidateRelevanceModelDatasetGeneratorConfigMinimalAction candidatePublisherWithStartTime:endTime:](ATXCandidateRelevanceModelDatasetGeneratorConfigMinimalAction, "candidatePublisherWithStartTime:endTime:", self->_startTime, self->_endTime);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orderedMergeWithOther:comparator:", v4, &__block_literal_global_135);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (BPSPublisher *)v5;
}

uint64_t __80__ATXProactiveSuggestionClientModelEvaluatorPublishers_shadowCandidatePublisher__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "timestamp");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "timestamp");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

- (BPSPublisher)uiPublisher
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "publisherWithStartTime:endTime:", self->_startTime, self->_endTime);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (BPSPublisher *)v4;
}

- (BPSPublisher)clientModelCacheUpdatePublisher
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "publisherWithStartTime:endTime:", self->_startTime, self->_endTime);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (BPSPublisher *)v4;
}

- (NSNumber)startTime
{
  return self->_startTime;
}

- (NSNumber)endTime
{
  return self->_endTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end
