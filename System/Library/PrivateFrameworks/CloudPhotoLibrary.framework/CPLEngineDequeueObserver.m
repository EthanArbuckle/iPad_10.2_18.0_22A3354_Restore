@implementation CPLEngineDequeueObserver

- (CPLEngineDequeueObserver)initWithClientWillAcknowledgeBatchBlock:(id)a3 clientDidAcknowledgeBatchBlock:(id)a4 changePipeDidRemoveChanges:(id)a5
{
  id v8;
  id v9;
  id v10;
  CPLEngineDequeueObserver *v11;
  uint64_t v12;
  id clientWillAcknowledgeBatchBlock;
  uint64_t v14;
  id clientDidAcknowledgeBatchBlock;
  uint64_t v16;
  id changePipeDidRemoveChanges;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CPLEngineDequeueObserver;
  v11 = -[CPLEngineDequeueObserver init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    clientWillAcknowledgeBatchBlock = v11->_clientWillAcknowledgeBatchBlock;
    v11->_clientWillAcknowledgeBatchBlock = (id)v12;

    v14 = objc_msgSend(v9, "copy");
    clientDidAcknowledgeBatchBlock = v11->_clientDidAcknowledgeBatchBlock;
    v11->_clientDidAcknowledgeBatchBlock = (id)v14;

    v16 = objc_msgSend(v10, "copy");
    changePipeDidRemoveChanges = v11->_changePipeDidRemoveChanges;
    v11->_changePipeDidRemoveChanges = (id)v16;

  }
  return v11;
}

- (CPLEngineDequeueObserver)initWithClientDidAcknowledgeBatchBlock:(id)a3
{
  return -[CPLEngineDequeueObserver initWithClientWillAcknowledgeBatchBlock:clientDidAcknowledgeBatchBlock:changePipeDidRemoveChanges:](self, "initWithClientWillAcknowledgeBatchBlock:clientDidAcknowledgeBatchBlock:changePipeDidRemoveChanges:", &__block_literal_global_7850, a3, &__block_literal_global_87);
}

- (CPLEngineDequeueObserver)initWithDequeueSignalBlock:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  CPLEngineDequeueObserver *v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __55__CPLEngineDequeueObserver_initWithDequeueSignalBlock___block_invoke;
  v13[3] = &unk_1E60D9538;
  v14 = v4;
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __55__CPLEngineDequeueObserver_initWithDequeueSignalBlock___block_invoke_2;
  v11[3] = &unk_1E60D9538;
  v12 = v14;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __55__CPLEngineDequeueObserver_initWithDequeueSignalBlock___block_invoke_3;
  v9[3] = &unk_1E60D9560;
  v10 = v12;
  v6 = v12;
  v7 = -[CPLEngineDequeueObserver initWithClientWillAcknowledgeBatchBlock:clientDidAcknowledgeBatchBlock:changePipeDidRemoveChanges:](self, "initWithClientWillAcknowledgeBatchBlock:clientDidAcknowledgeBatchBlock:changePipeDidRemoveChanges:", v13, v11, v9);

  return v7;
}

- (id)clientWillAcknowledgeBatchBlock
{
  return self->_clientWillAcknowledgeBatchBlock;
}

- (id)clientDidAcknowledgeBatchBlock
{
  return self->_clientDidAcknowledgeBatchBlock;
}

- (id)changePipeDidRemoveChanges
{
  return self->_changePipeDidRemoveChanges;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changePipeDidRemoveChanges, 0);
  objc_storeStrong(&self->_clientDidAcknowledgeBatchBlock, 0);
  objc_storeStrong(&self->_clientWillAcknowledgeBatchBlock, 0);
}

uint64_t __55__CPLEngineDequeueObserver_initWithDequeueSignalBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __55__CPLEngineDequeueObserver_initWithDequeueSignalBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __55__CPLEngineDequeueObserver_initWithDequeueSignalBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
