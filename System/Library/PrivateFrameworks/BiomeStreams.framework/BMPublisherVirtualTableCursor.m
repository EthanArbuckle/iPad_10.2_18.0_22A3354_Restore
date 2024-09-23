@implementation BMPublisherVirtualTableCursor

- (BMPublisherVirtualTableCursor)initWithVirtualTable:(id)a3
{
  id v5;
  BMPublisherVirtualTableCursor *v6;
  BMPublisherVirtualTableCursor *v7;
  id rowObject;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BMPublisherVirtualTableCursor;
  v6 = -[BMPublisherVirtualTableCursor init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_virtualTable, a3);
    rowObject = v7->_rowObject;
    v7->_rowObject = 0;

  }
  return v7;
}

- (void)reset
{
  -[BMPublisherVirtualTableCursor resetWithOptions:](self, "resetWithOptions:", 0);
}

- (void)resetWithOptions:(id)a3
{
  id rowObject;
  id v5;
  void (**v6)(_QWORD, _QWORD);
  id obj;

  rowObject = self->_rowObject;
  self->_rowObject = 0;
  v5 = a3;

  -[BMStreamVirtualTable publisherBlock](self->_virtualTable, "publisherBlock");
  v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v6)[2](v6, v5);
  obj = (id)objc_claimAutoreleasedReturnValue();

  if (BPSPipelineSupportsPullBasedPublishers())
  {
    -[BMPublisherVirtualTableCursor _resetWithPublisher:](self, "_resetWithPublisher:", obj);
  }
  else
  {
    objc_storeStrong((id *)&self->_publisher, obj);
    -[BPSPublisher subscribe:](self->_publisher, "subscribe:", self);
    -[BMPublisherVirtualTableCursor advance](self, "advance");
  }

}

- (void)advance
{
  id rowObject;

  rowObject = self->_rowObject;
  self->_rowObject = 0;

  if (BPSPipelineSupportsPullBasedPublishers())
    -[BMPublisherVirtualTableCursor _advance](self, "_advance");
  else
    -[BPSSubscription requestDemand:](self->_subscription, "requestDemand:", 1);
}

- (void)close
{
  BPSSubscription *subscription;

  subscription = self->_subscription;
  self->_subscription = 0;

}

- (int64_t)receiveInput:(id)a3
{
  id v4;
  id rowObject;
  id v6;
  BMPublisherVirtualTableCursor *v7;
  int64_t v8;

  v4 = a3;
  rowObject = self->_rowObject;
  if (rowObject)
    rowObject = (id)(self->_rowID + 1);
  self->_rowID = (int64_t)rowObject;
  v6 = self->_rowObject;
  self->_rowObject = v4;
  v7 = self;

  v8 = *MEMORY[0x1E0D02400];
  return v8;
}

- (void)receiveSubscription:(id)a3
{
  objc_storeStrong((id *)&self->_subscription, a3);
}

- (void)cancel
{
  -[BPSSubscription cancel](self->_subscription, "cancel");
}

- (void)subscribeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_storeStrong((id *)&self->_publisher, a3);
  -[BMPublisherVirtualTableCursor publisher](self, "publisher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startWithSubscriber:", self);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (!v6)
  {
    -[BMPublisherVirtualTableCursor requestNextEvents](self, "requestNextEvents");
    v5 = 0;
  }

}

- (void)receivedEvent:(id)a3
{
  id v4;
  id rowObject;
  id v6;

  v4 = a3;
  rowObject = self->_rowObject;
  if (rowObject)
    rowObject = (id)(self->_rowID + 1);
  self->_rowID = (int64_t)rowObject;
  v6 = self->_rowObject;
  self->_rowObject = v4;

}

- (void)requestNextEvents
{
  void *v3;
  void *v4;

  -[BPSPublisher nextEvent](self->_publisher, "nextEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[BMPublisherVirtualTableCursor receivedEvent:](self, "receivedEvent:", v3);
    v3 = v4;
  }

}

- (NSString)description
{
  id v3;
  uint64_t v4;
  BPSPublisher *publisher;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  publisher = self->_publisher;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_rowID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_rowObject == 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p> publisher: %@, rowid: %@, finished: %@"), v4, self, publisher, v6, v7);

  return (NSString *)v8;
}

- (BMStreamVirtualTable)virtualTable
{
  return self->_virtualTable;
}

- (BPSPublisher)publisher
{
  return self->_publisher;
}

- (BPSSubscription)subscription
{
  return self->_subscription;
}

- (id)rowObject
{
  return self->_rowObject;
}

- (int64_t)rowID
{
  return self->_rowID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscription, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_virtualTable, 0);
  objc_storeStrong(&self->_rowObject, 0);
}

@end
