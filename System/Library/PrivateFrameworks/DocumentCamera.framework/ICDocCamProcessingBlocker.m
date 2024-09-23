@implementation ICDocCamProcessingBlocker

- (ICDocCamProcessingBlocker)initWithDelegate:(id)a3
{
  id v4;
  ICDocCamProcessingBlocker *v5;
  ICDocCamProcessingBlocker *v6;
  NSMutableSet *v7;
  NSMutableSet *blockerSet;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICDocCamProcessingBlocker;
  v5 = -[ICDocCamProcessingBlocker init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    blockerSet = v6->_blockerSet;
    v6->_blockerSet = v7;

  }
  return v6;
}

- (BOOL)blocked
{
  ICDocCamProcessingBlocker *v2;
  void *v3;
  BOOL v4;

  v2 = self;
  objc_sync_enter(v2);
  -[ICDocCamProcessingBlocker blockerSet](v2, "blockerSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  objc_sync_exit(v2);
  return v4;
}

- (void)addBlockerOfType:(id)a3 clearRectangles:(BOOL)a4 clearQueue:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  ICDocCamProcessingBlocker *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a5;
  v6 = a4;
  v12 = a3;
  v8 = self;
  objc_sync_enter(v8);
  -[ICDocCamProcessingBlocker blockerSet](v8, "blockerSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v12);

  if (v6)
  {
    -[ICDocCamProcessingBlocker delegate](v8, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "clearRectangles");

  }
  if (v5)
  {
    -[ICDocCamProcessingBlocker delegate](v8, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "clearQueue");

  }
  objc_sync_exit(v8);

}

- (void)removeBlockerOfType:(id)a3
{
  ICDocCamProcessingBlocker *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[ICDocCamProcessingBlocker blockerSet](v4, "blockerSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v6);

  objc_sync_exit(v4);
}

- (ICDocCamProcessingBlockerDelegate)delegate
{
  return (ICDocCamProcessingBlockerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableSet)blockerSet
{
  return self->_blockerSet;
}

- (void)setBlockerSet:(id)a3
{
  objc_storeStrong((id *)&self->_blockerSet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockerSet, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
