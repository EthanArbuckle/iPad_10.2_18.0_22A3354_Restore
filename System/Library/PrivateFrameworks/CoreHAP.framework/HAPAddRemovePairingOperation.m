@implementation HAPAddRemovePairingOperation

- (HAPAddRemovePairingOperation)initWith:(int64_t)a3 identifier:(id)a4 publicKey:(id)a5 admin:(BOOL)a6 queue:(id)a7 completion:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;

  v9 = a6;
  v14 = a8;
  v15 = a7;
  v16 = a5;
  v17 = a4;
  -[HAPAddRemovePairingOperation setOperation:](self, "setOperation:", a3);
  -[HAPAddRemovePairingOperation setIdentifier:](self, "setIdentifier:", v17);

  -[HAPAddRemovePairingOperation setPublicKey:](self, "setPublicKey:", v16);
  -[HAPAddRemovePairingOperation setAdmin:](self, "setAdmin:", v9);
  -[HAPAddRemovePairingOperation setQueue:](self, "setQueue:", v15);

  -[HAPAddRemovePairingOperation setCompletionHandler:](self, "setCompletionHandler:", v14);
  -[HAPAddRemovePairingOperation setOperationExecuting:](self, "setOperationExecuting:", 0);
  return self;
}

- (int64_t)operation
{
  return self->_operation;
}

- (void)setOperation:(int64_t)a3
{
  self->_operation = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
  objc_storeStrong((id *)&self->_publicKey, a3);
}

- (BOOL)admin
{
  return self->_admin;
}

- (void)setAdmin:(BOOL)a3
{
  self->_admin = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)operationExecuting
{
  return self->_operationExecuting;
}

- (void)setOperationExecuting:(BOOL)a3
{
  self->_operationExecuting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
