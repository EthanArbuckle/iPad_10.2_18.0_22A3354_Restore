@implementation _CDIntentSpotlightIndex

- (void)knowledgeStorage:(id)a3 didInsertLocalEventsWithStreamNameCounts:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = a4;
  +[_DKSystemEventStreams appIntentsStream](_DKSystemEventStreams, "appIntentsStream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "countForObject:", v7);

  if (v8)
    -[_CDIntentSpotlightIndex triggerIndexIncludingAdditions:completion:](self, "triggerIndexIncludingAdditions:completion:", 1, 0);
}

- (void)triggerIndexIncludingAdditions:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  _CDIntentSpotlightIndex *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  BOOL v15;

  v4 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[_CDIntentSpotlightIndex setIncludeAdditions:](v7, "setIncludeAdditions:", -[_CDIntentSpotlightIndex includeAdditions](v7, "includeAdditions") | v4);
  if (v6)
    -[_CDIntentSpotlightIndex setCompletion:](v7, "setCompletion:", v6);
  objc_sync_exit(v7);

  +[_DKThrottledActivity standardInstance](_DKThrottledActivity, "standardInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDIntentSpotlightIndex delay](v7, "delay");
  v10 = v9;
  -[_CDIntentSpotlightIndex activityQueue](v7, "activityQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69___CDIntentSpotlightIndex_triggerIndexIncludingAdditions_completion___block_invoke;
  v13[3] = &unk_1E26E4F50;
  v15 = v4;
  v13[4] = v7;
  v14 = v6;
  v12 = v6;
  objc_msgSend(v8, "performWithDelayInSecondsOf:name:queue:activityBlock:", CFSTR("com.apple.coreduet.intent-spotlight-index"), v11, v13, v10);

}

- (void)setIncludeAdditions:(BOOL)a3
{
  self->_includeAdditions = a3;
}

- (BOOL)includeAdditions
{
  return self->_includeAdditions;
}

- (double)delay
{
  return self->_delay;
}

- (OS_dispatch_queue)activityQueue
{
  return self->_activityQueue;
}

- (_CDIntentSpotlightIndex)initWithKnowledgeStorage:(id)a3
{
  id v5;
  _CDIntentSpotlightIndex *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *activityQueue;
  _CDSpotlightIntentIndexerDataSource *v11;
  _CDSpotlightEventIndexer *v12;
  _CDSpotlightEventIndexer *indexer;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_CDIntentSpotlightIndex;
  v6 = -[_CDIntentSpotlightIndex init](&v15, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_UTILITY, 0);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = dispatch_queue_create("com.apple.coreduet.intent-spotlight-index.activity-queue", v8);
    activityQueue = v6->_activityQueue;
    v6->_activityQueue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_storage, a3);
    v11 = -[_CDSpotlightIntentIndexerDataSource initWithKnowledgeStore:]([_CDSpotlightIntentIndexerDataSource alloc], "initWithKnowledgeStore:", v5);
    v12 = -[_CDSpotlightEventIndexer initWithDataSource:]([_CDSpotlightEventIndexer alloc], "initWithDataSource:", v11);
    indexer = v6->_indexer;
    v6->_indexer = v12;

    v6->_delay = 2.0;
    v6->_batchSize = 200;
    -[_DKKnowledgeStorage addKnowledgeStorageEventNotificationDelegate:](v6->_storage, "addKnowledgeStorageEventNotificationDelegate:", v6);

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[_DKKnowledgeStorage removeKnowledgeStorageEventNotificationDelegate:](self->_storage, "removeKnowledgeStorageEventNotificationDelegate:", self);
  v3.receiver = self;
  v3.super_class = (Class)_CDIntentSpotlightIndex;
  -[_CDIntentSpotlightIndex dealloc](&v3, sel_dealloc);
}

- (void)knowledgeStorage:(id)a3 didTombstoneEventsWithStreamNameCounts:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = a4;
  +[_DKSystemEventStreams appIntentsStream](_DKSystemEventStreams, "appIntentsStream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "countForObject:", v7);

  if (v8)
    -[_CDIntentSpotlightIndex triggerIndexIncludingAdditions:completion:](self, "triggerIndexIncludingAdditions:completion:", 0, 0);
}

- (_DKKnowledgeStorage)storage
{
  return self->_storage;
}

- (_CDSpotlightEventIndexer)indexer
{
  return self->_indexer;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (void)setActivityQueue:(id)a3
{
  objc_storeStrong((id *)&self->_activityQueue, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_activityQueue, 0);
  objc_storeStrong((id *)&self->_indexer, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
