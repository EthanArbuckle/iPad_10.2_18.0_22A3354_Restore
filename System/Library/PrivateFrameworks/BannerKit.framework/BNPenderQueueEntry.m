@implementation BNPenderQueueEntry

- (BNPenderQueueEntry)initWithPender:(id)a3
{
  id v6;
  BNPenderQueueEntry *v7;
  BNPenderQueueEntry *v8;
  uint64_t v9;
  NSUUID *entryIdentifier;
  void *v12;
  objc_super v13;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNPenderQueue.m"), 194, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pender"));

  }
  v13.receiver = self;
  v13.super_class = (Class)BNPenderQueueEntry;
  v7 = -[BNPenderQueueEntry init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_pender, a3);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = objc_claimAutoreleasedReturnValue();
    entryIdentifier = v8->_entryIdentifier;
    v8->_entryIdentifier = (NSUUID *)v9;

  }
  return v8;
}

- (BNPending)pender
{
  return self->_pender;
}

- (NSUUID)entryIdentifier
{
  return self->_entryIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryIdentifier, 0);
  objc_storeStrong((id *)&self->_pender, 0);
}

@end
