@implementation NPKWorkQueueItem

- (NPKWorkQueueItem)initWithTransaction:(id)a3 work:(id)a4
{
  id v7;
  id v8;
  NPKWorkQueueItem *v9;
  NPKWorkQueueItem *v10;
  uint64_t v11;
  id workBlock;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NPKWorkQueueItem;
  v9 = -[NPKWorkQueueItem init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_transaction, a3);
    v11 = MEMORY[0x2199B6780](v8);
    workBlock = v10->_workBlock;
    v10->_workBlock = (id)v11;

  }
  return v10;
}

+ (id)itemWithTransaction:(id)a3 work:(id)a4
{
  id v5;
  id v6;
  NPKWorkQueueItem *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[NPKWorkQueueItem initWithTransaction:work:]([NPKWorkQueueItem alloc], "initWithTransaction:work:", v6, v5);

  return v7;
}

- (NPKOSTransaction)transaction
{
  return self->_transaction;
}

- (id)workBlock
{
  return self->_workBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_workBlock, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
