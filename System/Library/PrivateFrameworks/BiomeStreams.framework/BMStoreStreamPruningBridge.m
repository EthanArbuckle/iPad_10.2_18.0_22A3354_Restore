@implementation BMStoreStreamPruningBridge

- (BMStoreStreamPruningBridge)initWithStreamIdentifier:(id)a3 domain:(unint64_t)a4
{
  id v6;
  BMStoreStreamPruningBridge *v7;
  uint64_t v8;
  BMBFSDeletePropagator *bfsDeletePropagator;
  BMComputeTombstonePropagator *v10;
  BMComputeTombstonePropagator *computeTombstonePropagator;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BMStoreStreamPruningBridge;
  v7 = -[BMStoreStreamPruningBridge init](&v13, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D01BE0]), "initWithStreamId:", v6);
    bfsDeletePropagator = v7->_bfsDeletePropagator;
    v7->_bfsDeletePropagator = (BMBFSDeletePropagator *)v8;

    v10 = -[BMComputeTombstonePropagator initWithStreamIdentifier:domain:]([BMComputeTombstonePropagator alloc], "initWithStreamIdentifier:domain:", v6, a4);
    computeTombstonePropagator = v7->_computeTombstonePropagator;
    v7->_computeTombstonePropagator = v10;

  }
  return v7;
}

- (void)willPruneEvent:(id)a3
{
  -[BMBFSDeletePropagator willPruneEvent:](self->_bfsDeletePropagator, "willPruneEvent:", a3);
}

- (void)didPruneEvents
{
  -[BMBFSDeletePropagator didPruneEvents](self->_bfsDeletePropagator, "didPruneEvents");
}

- (void)didWriteTombstone:(id)a3 timestamp:(double)a4 account:(id)a5 remoteName:(id)a6
{
  -[BMComputeTombstonePropagator didWriteTombstone:timestamp:account:remoteName:](self->_computeTombstonePropagator, "didWriteTombstone:timestamp:account:remoteName:", a3, a5, a6, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_computeTombstonePropagator, 0);
  objc_storeStrong((id *)&self->_bfsDeletePropagator, 0);
}

@end
