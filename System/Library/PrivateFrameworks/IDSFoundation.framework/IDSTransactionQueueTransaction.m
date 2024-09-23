@implementation IDSTransactionQueueTransaction

- (IDSTransactionQueueTransaction)initWithItem:(id)a3
{
  double v3;

  return (IDSTransactionQueueTransaction *)objc_msgSend_initWithItem_readyToExecute_(self, a2, (uint64_t)a3, v3, 1);
}

- (IDSTransactionQueueTransaction)initWithItem:(id)a3 readyToExecute:(BOOL)a4
{
  id v7;
  IDSTransactionQueueTransaction *v8;
  IDSTransactionQueueTransaction *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IDSTransactionQueueTransaction;
  v8 = -[IDSTransactionQueueTransaction init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(&v8->_item, a3);
    v9->_readyToExecute = a4;
  }

  return v9;
}

- (BOOL)readyToExecute
{
  return self->_readyToExecute;
}

- (void)setReadyToExecute:(BOOL)a3
{
  self->_readyToExecute = a3;
}

- (id)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong(&self->_item, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_item, 0);
}

@end
