@implementation _EDMessageItemIDCollector

- (_EDMessageItemIDCollector)init
{
  _EDMessageItemIDCollector *v2;
  uint64_t v3;
  EFScheduler *scheduler;
  uint64_t v5;
  NSConditionLock *collectionLock;
  NSMutableArray *v7;
  NSMutableArray *messageItemIDs;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_EDMessageItemIDCollector;
  v2 = -[_EDMessageItemIDCollector init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.email._EDMessageItemIDCollector._scheduler"), 9);
    v3 = objc_claimAutoreleasedReturnValue();
    scheduler = v2->_scheduler;
    v2->_scheduler = (EFScheduler *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 0);
    collectionLock = v2->_collectionLock;
    v2->_collectionLock = (NSConditionLock *)v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    messageItemIDs = v2->_messageItemIDs;
    v2->_messageItemIDs = v7;

  }
  return v2;
}

- (id)collectItemIDsWithQuery:(id)a3 messagePersistence:(id)a4 hookRegistry:(id)a5 remindMeNotificationController:(id)a6 searchProvider:(id)a7 errorString:(id *)a8
{
  id v14;
  id v15;
  id v16;
  NSString *errorString;
  EDMessageQueryHelper *v18;
  NSConditionLock *collectionLock;
  void *v20;
  void *v21;
  __CFString *v22;
  uint64_t v24;
  id v25;
  id v26;

  v26 = a3;
  v25 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[NSConditionLock lockWhenCondition:](self->_collectionLock, "lockWhenCondition:", 0);
  -[NSConditionLock unlockWithCondition:](self->_collectionLock, "unlockWithCondition:", 1);
  -[NSMutableArray removeAllObjects](self->_messageItemIDs, "removeAllObjects");
  errorString = self->_errorString;
  self->_errorString = 0;

  BYTE2(v24) = 0;
  LOWORD(v24) = 0;
  v18 = -[EDMessageQueryHelper initWithQuery:initialBatchSize:maximumBatchSize:messagePersistence:hookRegistry:searchProvider:scheduler:remindMeNotificationController:delegate:shouldReconcileJournal:shouldAddMessagesSynchronously:keepMessagesInListOnBucketChange:]([EDMessageQueryHelper alloc], "initWithQuery:initialBatchSize:maximumBatchSize:messagePersistence:hookRegistry:searchProvider:scheduler:remindMeNotificationController:delegate:shouldReconcileJournal:shouldAddMessagesSynchronously:keepMessagesInListOnBucketChange:", v26, 100, 15000, v25, v14, v16, self->_scheduler, v15, self, v24);
  -[EDMessageQueryHelper start](v18, "start");
  collectionLock = self->_collectionLock;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 10.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a7) = -[NSConditionLock lockWhenCondition:beforeDate:](collectionLock, "lockWhenCondition:beforeDate:", 2, v20);

  if ((_DWORD)a7)
  {
    v21 = (void *)-[NSMutableArray copy](self->_messageItemIDs, "copy");
    v22 = (__CFString *)-[NSString copy](self->_errorString, "copy");
  }
  else
  {
    v22 = CFSTR("Timed out");
    v21 = 0;
    -[NSConditionLock lock](self->_collectionLock, "lock");
  }
  -[NSConditionLock unlockWithCondition:](self->_collectionLock, "unlockWithCondition:", 0);
  if (a8)
    *a8 = objc_retainAutorelease(v22);

  return v21;
}

- (void)queryHelper:(id)a3 didFindMessages:(id)a4 forInitialBatch:(BOOL)a5
{
  NSMutableArray *messageItemIDs;
  id v6;

  messageItemIDs = self->_messageItemIDs;
  objc_msgSend(a4, "ef_compactMapSelector:", sel_itemID);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](messageItemIDs, "addObjectsFromArray:");

}

- (void)queryHelperDidFindAllMessages:(id)a3
{
  -[NSConditionLock lock](self->_collectionLock, "lock", a3);
  -[NSConditionLock unlockWithCondition:](self->_collectionLock, "unlockWithCondition:", 2 * (-[NSConditionLock condition](self->_collectionLock, "condition") == 1));
}

- (void)queryHelperNeedsRestart:(id)a3
{
  NSString *errorString;

  errorString = self->_errorString;
  self->_errorString = (NSString *)CFSTR("Query helper requested restart");

  -[NSMutableArray removeAllObjects](self->_messageItemIDs, "removeAllObjects");
  -[NSConditionLock lock](self->_collectionLock, "lock");
  -[NSConditionLock unlockWithCondition:](self->_collectionLock, "unlockWithCondition:", 2 * (-[NSConditionLock condition](self->_collectionLock, "condition") == 1));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorString, 0);
  objc_storeStrong((id *)&self->_collectionLock, 0);
  objc_storeStrong((id *)&self->_messageItemIDs, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
}

@end
