@implementation CCSetChangeXPCListener

- (CCSetChangeXPCListener)initWithIdentifier:(id)a3 queue:(id)a4 handlerBlock:(id)a5 batchHandlerBlock:(id)a6 useCase:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  CCSetChangeXPCListener *v18;
  CCSetChangeXPCListener *v19;
  uint64_t v20;
  id handlerBlock;
  uint64_t v22;
  id batchHandlerBlock;
  CCSetChangeQueue *v24;
  CCSetChangeQueue *setChangeQueue;
  void *v26;
  objc_super v28;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v28.receiver = self;
  v28.super_class = (Class)CCSetChangeXPCListener;
  v18 = -[CCSetChangeXPCListener init](&v28, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a3);
    objc_storeStrong((id *)&v19->_queue, a4);
    v20 = MEMORY[0x23B820934](v15);
    handlerBlock = v19->_handlerBlock;
    v19->_handlerBlock = (id)v20;

    v22 = MEMORY[0x23B820934](v16);
    batchHandlerBlock = v19->_batchHandlerBlock;
    v19->_batchHandlerBlock = (id)v22;

    if (v19->_batchHandlerBlock)
    {
      v24 = objc_alloc_init(CCSetChangeQueue);
      setChangeQueue = v19->_setChangeQueue;
      v19->_setChangeQueue = v24;

    }
    objc_storeStrong((id *)&v19->_useCase, a7);
    +[CCSetChangeXPCEventHandler sharedInstance](CCSetChangeXPCEventHandler, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addListener:", v19);

  }
  return v19;
}

- (CCSetChangeXPCListener)initWithIdentifier:(id)a3 handlerBlock:(id)a4 queue:(id)a5
{
  return -[CCSetChangeXPCListener initWithIdentifier:queue:handlerBlock:batchHandlerBlock:useCase:](self, "initWithIdentifier:queue:handlerBlock:batchHandlerBlock:useCase:", a3, a5, a4, 0, *MEMORY[0x24BE0C058]);
}

- (CCSetChangeXPCListener)initWithIdentifier:(id)a3 handlerBlock:(id)a4 queue:(id)a5 useCase:(id)a6
{
  return -[CCSetChangeXPCListener initWithIdentifier:queue:handlerBlock:batchHandlerBlock:useCase:](self, "initWithIdentifier:queue:handlerBlock:batchHandlerBlock:useCase:", a3, a5, a4, 0, a6);
}

- (CCSetChangeXPCListener)initWithIdentifier:(id)a3 batchHandlerBlock:(id)a4 queue:(id)a5
{
  return -[CCSetChangeXPCListener initWithIdentifier:queue:handlerBlock:batchHandlerBlock:useCase:](self, "initWithIdentifier:queue:handlerBlock:batchHandlerBlock:useCase:", a3, a5, 0, a4, *MEMORY[0x24BE0C058]);
}

- (CCSetChangeXPCListener)initWithIdentifier:(id)a3 batchHandlerBlock:(id)a4 queue:(id)a5 useCase:(id)a6
{
  return -[CCSetChangeXPCListener initWithIdentifier:queue:handlerBlock:batchHandlerBlock:useCase:](self, "initWithIdentifier:queue:handlerBlock:batchHandlerBlock:useCase:", a3, a5, 0, a4, a6);
}

- (BOOL)handlesUpdateForSet:(id)a3
{
  id v4;
  BOOL v5;
  BMProcess *v6;
  BMProcess *listeningProcess;
  void *v8;
  NSSet *v9;
  NSSet *readableSetIdentifiers;
  void *v11;
  void *v12;

  v4 = a3;
  if (-[NSString isEqualToString:](self->_useCase, "isEqualToString:", *MEMORY[0x24BE0C058]))
  {
    v5 = 1;
  }
  else
  {
    if (!self->_listeningProcess || !self->_readableSetIdentifiers)
    {
      objc_msgSend(MEMORY[0x24BE0C0A0], "current");
      v6 = (BMProcess *)objc_claimAutoreleasedReturnValue();
      listeningProcess = self->_listeningProcess;
      self->_listeningProcess = v6;

      objc_msgSend(MEMORY[0x24BE0C080], "policyForProcess:connectionFlags:useCase:", self->_listeningProcess, 0, self->_useCase);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "explicitlyAuthorizedResourcesOfType:withAccessMode:", 4, 1);
      v9 = (NSSet *)objc_claimAutoreleasedReturnValue();
      readableSetIdentifiers = self->_readableSetIdentifiers;
      self->_readableSetIdentifiers = v9;

    }
    CCTypeIdentifierRegistryBridge();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIdentifierForItemType:", objc_msgSend(v4, "itemType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      v5 = -[NSSet containsObject:](self->_readableSetIdentifiers, "containsObject:", v12);
    else
      v5 = 0;

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[CCSetChangeXPCEventHandler sharedInstance](CCSetChangeXPCEventHandler, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeListener:", self);

  v4.receiver = self;
  v4.super_class = (Class)CCSetChangeXPCListener;
  -[CCSetChangeXPCListener dealloc](&v4, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<%@ %p> identifier: %@"), objc_opt_class(), self, self->_identifier);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)handlerBlock
{
  return self->_handlerBlock;
}

- (id)batchHandlerBlock
{
  return self->_batchHandlerBlock;
}

- (CCSetChangeQueue)setChangeQueue
{
  return self->_setChangeQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setChangeQueue, 0);
  objc_storeStrong(&self->_batchHandlerBlock, 0);
  objc_storeStrong(&self->_handlerBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_useCase, 0);
  objc_storeStrong((id *)&self->_readableSetIdentifiers, 0);
  objc_storeStrong((id *)&self->_listeningProcess, 0);
}

@end
