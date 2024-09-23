@implementation ECTransferUndownloadedMessageAction

- (ECTransferUndownloadedMessageAction)initWithBuilder:(id)a3
{
  void (**v4)(id, ECTransferUndownloadedMessageAction *);
  ECTransferUndownloadedMessageAction *v5;
  objc_super v7;

  v4 = (void (**)(id, ECTransferUndownloadedMessageAction *))a3;
  v7.receiver = self;
  v7.super_class = (Class)ECTransferUndownloadedMessageAction;
  v5 = -[ECTransferUndownloadedMessageAction init](&v7, sel_init);
  if (v5)
    v4[2](v4, v5);

  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ECTransferUndownloadedMessageAction;
  -[ECLocalMessageAction description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = -[ECTransferUndownloadedMessageAction transferType](self, "transferType");
  -[ECTransferUndownloadedMessageAction oldestPersistedRemoteID](self, "oldestPersistedRemoteID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR(", transfer type = %ld, persistent ID limit %@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)updateWithCompletedCopyItems:(id)a3
{
  self->_transferType = 3;
  objc_storeStrong((id *)&self->_itemsToDelete, a3);
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

- (NSString)oldestPersistedRemoteID
{
  return self->_oldestPersistedRemoteID;
}

- (void)setOldestPersistedRemoteID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)itemsToDelete
{
  return self->_itemsToDelete;
}

- (void)setItemsToDelete:(id)a3
{
  objc_storeStrong((id *)&self->_itemsToDelete, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsToDelete, 0);
  objc_storeStrong((id *)&self->_oldestPersistedRemoteID, 0);
  objc_storeStrong((id *)&self->_destinationMailboxURL, 0);
  objc_storeStrong((id *)&self->_sourceMailboxURL, 0);
}

@end
