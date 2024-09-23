@implementation _CPLEngineStoreBatchedTransaction

- (_CPLEngineStoreBatchedTransaction)init
{
  _CPLEngineStoreBatchedTransaction *v2;
  CPLTransaction *v3;
  CPLTransaction *dirty;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_CPLEngineStoreBatchedTransaction;
  v2 = -[_CPLEngineStoreBatchedTransaction init](&v6, sel_init);
  if (v2)
  {
    v3 = +[CPLTransaction newTransactionWithIdentifier:description:keepPower:](CPLTransaction, "newTransactionWithIdentifier:description:keepPower:", CFSTR("cpl.store.batchwrite"), CFSTR("batch write"), 1);
    dirty = v2->_dirty;
    v2->_dirty = v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[CPLTransaction endTransaction](self->_dirty, "endTransaction");
  v3.receiver = self;
  v3.super_class = (Class)_CPLEngineStoreBatchedTransaction;
  -[_CPLEngineStoreBatchedTransaction dealloc](&v3, sel_dealloc);
}

- (void)_releaseDirty
{
  CPLTransaction *dirty;

  -[CPLTransaction endTransaction](self->_dirty, "endTransaction");
  dirty = self->_dirty;
  self->_dirty = 0;

}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_dirty, 0);
}

@end
