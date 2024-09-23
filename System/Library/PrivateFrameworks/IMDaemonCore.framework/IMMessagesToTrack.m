@implementation IMMessagesToTrack

+ (id)sharedInstance
{
  if (qword_1ED935D18 != -1)
    dispatch_once(&qword_1ED935D18, &unk_1E922DE10);
  return (id)qword_1ED935E58;
}

- (IMMessagesToTrack)init
{
  IMMessagesToTrack *v2;
  uint64_t v3;
  NSMutableOrderedSet *recentMessageIDs;
  dispatch_queue_t v5;
  OS_dispatch_queue *internalQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IMMessagesToTrack;
  v2 = -[IMMessagesToTrack init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", -[IMMessagesToTrack maxNumberOfMessages](v2, "maxNumberOfMessages"));
    recentMessageIDs = v2->_recentMessageIDs;
    v2->_recentMessageIDs = (NSMutableOrderedSet *)v3;

    v5 = dispatch_queue_create("com.apple.private.Messages.IMMessagesToTrack", 0);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)addMessagesID:(id)a3
{
  id v4;
  void *v5;
  NSObject *internalQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    internalQueue = self->_internalQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = sub_1D158BE80;
    v7[3] = &unk_1E9228750;
    v7[4] = self;
    v8 = v4;
    dispatch_async(internalQueue, v7);

  }
}

- (void)containsMessageID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *internalQueue;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    if (v6)
    {
      internalQueue = self->_internalQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1D158BFEC;
      block[3] = &unk_1E9229170;
      v12 = v7;
      block[4] = self;
      v11 = v6;
      dispatch_async(internalQueue, block);

    }
    else
    {
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    }
  }

}

- (unint64_t)maxNumberOfMessages
{
  return 50;
}

- (unint64_t)currentNumberOfMessages
{
  void *v2;
  unint64_t v3;

  -[IMMessagesToTrack recentMessageIDs](self, "recentMessageIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (NSMutableOrderedSet)recentMessageIDs
{
  return self->_recentMessageIDs;
}

- (void)setRecentMessageIDs:(id)a3
{
  objc_storeStrong((id *)&self->_recentMessageIDs, a3);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
  objc_storeStrong((id *)&self->_internalQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_recentMessageIDs, 0);
}

@end
