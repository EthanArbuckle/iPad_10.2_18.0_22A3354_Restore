@implementation ECTransferMessageAction

- (ECTransferMessageAction)initWithBuilder:(id)a3
{
  void (**v4)(id, ECTransferMessageAction *);
  ECTransferMessageAction *v5;
  objc_super v7;

  v4 = (void (**)(id, ECTransferMessageAction *))a3;
  v7.receiver = self;
  v7.super_class = (Class)ECTransferMessageAction;
  v5 = -[ECTransferMessageAction init](&v7, sel_init);
  if (v5)
    v4[2](v4, v5);

  return v5;
}

- (ECTransferMessageAction)init
{
  -[ECTransferMessageAction doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ECTransferMessageAction init]", "ECTransferMessageAction.m", 60, "0");
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ECTransferMessageAction;
  -[ECLocalMessageAction description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", num items to download %lu, num items to copy %lu, num items to delete = %lu, transfer type = %ld"), -[NSMutableOrderedSet count](self->_itemsToDownload, "count"), -[NSMutableOrderedSet count](self->_itemsToCopy, "count"), -[NSMutableOrderedSet count](self->_itemsToDelete, "count"), -[ECTransferMessageAction transferType](self, "transferType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSArray)itemsToDownload
{
  void *v2;
  void *v3;

  -[NSMutableOrderedSet array](self->_itemsToDownload, "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void)setItemsToDownload:(id)a3
{
  NSMutableOrderedSet *v4;
  NSMutableOrderedSet *itemsToDownload;
  id v6;

  v6 = a3;
  v4 = (NSMutableOrderedSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithArray:", v6);
  itemsToDownload = self->_itemsToDownload;
  self->_itemsToDownload = v4;

}

- (NSArray)itemsToCopy
{
  void *v2;
  void *v3;

  -[NSMutableOrderedSet array](self->_itemsToCopy, "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void)setItemsToCopy:(id)a3
{
  NSMutableOrderedSet *v4;
  NSMutableOrderedSet *itemsToCopy;
  id v6;

  v6 = a3;
  v4 = (NSMutableOrderedSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithArray:", v6);
  itemsToCopy = self->_itemsToCopy;
  self->_itemsToCopy = v4;

}

- (NSArray)itemsToDelete
{
  void *v2;
  void *v3;

  -[NSMutableOrderedSet array](self->_itemsToDelete, "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void)setItemsToDelete:(id)a3
{
  NSMutableOrderedSet *v4;
  NSMutableOrderedSet *itemsToDelete;
  id v6;

  v6 = a3;
  v4 = (NSMutableOrderedSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithArray:", v6);
  itemsToDelete = self->_itemsToDelete;
  self->_itemsToDelete = v4;

}

- (void)updateWithCompletedItems:(id)a3 forPhase:(int64_t)a4
{
  void *v6;
  int *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (a4 == 4)
  {
    -[NSMutableOrderedSet removeObjectsInArray:](self->_itemsToDelete, "removeObjectsInArray:", v9);
    goto LABEL_17;
  }
  if (a4 != 3)
  {
    if (a4 != 1)
      goto LABEL_17;
    -[NSMutableOrderedSet removeObjectsInArray:](self->_itemsToDownload, "removeObjectsInArray:", v9);
    -[ECTransferMessageAction destinationMailboxURL](self, "destinationMailboxURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = &OBJC_IVAR___ECTransferMessageAction__itemsToCopy;
    }
    else
    {
      if (-[ECTransferMessageAction transferType](self, "transferType") != 1)
      {
LABEL_13:
        if (!-[NSMutableOrderedSet count](self->_itemsToDownload, "count")
          && -[NSMutableOrderedSet count](self->_itemsToCopy, "count"))
        {
          -[ECTransferMessageAction destinationMailboxURL](self, "destinationMailboxURL");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[ECLocalMessageAction setMailboxURL:](self, "setMailboxURL:", v8);
          goto LABEL_16;
        }
        goto LABEL_17;
      }
      v7 = &OBJC_IVAR___ECTransferMessageAction__itemsToDelete;
    }
    objc_msgSend(*(id *)((char *)&self->super.super.isa + *v7), "addObjectsFromArray:", v9);
    goto LABEL_13;
  }
  -[NSMutableOrderedSet removeObjectsInArray:](self->_itemsToCopy, "removeObjectsInArray:", v9);
  if (-[ECTransferMessageAction transferType](self, "transferType") == 1)
  {
    -[NSMutableOrderedSet addObjectsFromArray:](self->_itemsToDelete, "addObjectsFromArray:", v9);
    if (!-[NSMutableOrderedSet count](self->_itemsToCopy, "count"))
    {
      -[ECTransferMessageAction sourceMailboxURL](self, "sourceMailboxURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ECLocalMessageAction setMailboxURL:](self, "setMailboxURL:", v8);
LABEL_16:

    }
  }
LABEL_17:

}

- (void)updateWithFailedItems:(id)a3 forPhase:(int64_t)a4
{
  id v6;
  int *v7;
  id v8;

  v6 = a3;
  v8 = v6;
  switch(a4)
  {
    case 1:
      v7 = &OBJC_IVAR___ECTransferMessageAction__itemsToDownload;
      goto LABEL_7;
    case 3:
      v7 = &OBJC_IVAR___ECTransferMessageAction__itemsToCopy;
      goto LABEL_7;
    case 4:
      v7 = &OBJC_IVAR___ECTransferMessageAction__itemsToDelete;
LABEL_7:
      objc_msgSend(*(id *)((char *)&self->super.super.isa + *v7), "removeObjectsInArray:", v6);
      break;
  }

}

- (int64_t)transferType
{
  return self->_transferType;
}

- (void)setTransferType:(int64_t)a3
{
  self->_transferType = a3;
}

- (NSURL)sourceMailboxURL
{
  return self->_sourceMailboxURL;
}

- (void)setSourceMailboxURL:(id)a3
{
  objc_storeStrong((id *)&self->_sourceMailboxURL, a3);
}

- (NSURL)destinationMailboxURL
{
  return self->_destinationMailboxURL;
}

- (void)setDestinationMailboxURL:(id)a3
{
  objc_storeStrong((id *)&self->_destinationMailboxURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationMailboxURL, 0);
  objc_storeStrong((id *)&self->_sourceMailboxURL, 0);
  objc_storeStrong((id *)&self->_itemsToDelete, 0);
  objc_storeStrong((id *)&self->_itemsToCopy, 0);
  objc_storeStrong((id *)&self->_itemsToDownload, 0);
}

@end
