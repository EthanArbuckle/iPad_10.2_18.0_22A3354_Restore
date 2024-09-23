@implementation CCUIStatusUpdateQueue

- (CCUIStatusUpdateQueue)init
{
  CCUIStatusUpdateQueue *v2;
  NSMutableArray *v3;
  NSMutableArray *queuedIdentifiers;
  NSMutableDictionary *v5;
  NSMutableDictionary *latestUpdateByIdentifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CCUIStatusUpdateQueue;
  v2 = -[CCUIStatusUpdateQueue init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    queuedIdentifiers = v2->_queuedIdentifiers;
    v2->_queuedIdentifiers = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    latestUpdateByIdentifier = v2->_latestUpdateByIdentifier;
    v2->_latestUpdateByIdentifier = v5;

  }
  return v2;
}

- (void)removeAllStatusUpdates
{
  -[NSMutableArray removeAllObjects](self->_queuedIdentifiers, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_latestUpdateByIdentifier, "removeAllObjects");
}

- (void)enqueueStatusUpdate:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v9 = v6;
  -[NSMutableDictionary bs_takeObjectForKey:](self->_latestUpdateByIdentifier, "bs_takeObjectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[NSMutableArray removeObject:](self->_queuedIdentifiers, "removeObject:", v7);
    if (objc_msgSend(v8, "type") == 1 && objc_msgSend(v9, "type") == 2)
      goto LABEL_8;
    if (objc_msgSend(v8, "type") == 2 && objc_msgSend(v9, "type") == 1)
      goto LABEL_8;
  }
  if (v9)
  {
    -[NSMutableArray addObject:](self->_queuedIdentifiers, "addObject:", v7);
    -[NSMutableDictionary setObject:forKey:](self->_latestUpdateByIdentifier, "setObject:forKey:", v9, v7);
LABEL_8:

  }
}

- (id)dequeueNextStatusUpdate
{
  void *v3;
  void *v4;

  -[NSMutableArray firstObject](self->_queuedIdentifiers, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_queuedIdentifiers, "removeObjectAtIndex:", 0);
    -[NSMutableDictionary bs_takeObjectForKey:](self->_latestUpdateByIdentifier, "bs_takeObjectForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestUpdateByIdentifier, 0);
  objc_storeStrong((id *)&self->_queuedIdentifiers, 0);
}

@end
