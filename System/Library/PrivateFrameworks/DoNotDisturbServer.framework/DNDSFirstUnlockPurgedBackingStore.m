@implementation DNDSFirstUnlockPurgedBackingStore

- (DNDSFirstUnlockPurgedBackingStore)initWithUnderlyingBackingStore:(id)a3 keybag:(id)a4
{
  id v7;
  id v8;
  DNDSFirstUnlockPurgedBackingStore *v9;
  DNDSFirstUnlockPurgedBackingStore *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DNDSFirstUnlockPurgedBackingStore;
  v9 = -[DNDSFirstUnlockPurgedBackingStore init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_underlyingBackingStore, a3);
    objc_storeStrong((id *)&v10->_keybag, a4);
    -[DNDSKeybagStateProviding addPriorityObserver:](v10->_keybag, "addPriorityObserver:", v10);
    objc_msgSend(v7, "setDelegate:", v10);
  }

  return v10;
}

- (id)readRecordWithError:(id *)a3
{
  return (id)-[DNDSCachedBackingStore readRecordWithError:](self->_underlyingBackingStore, "readRecordWithError:", a3);
}

- (unint64_t)writeRecord:(id)a3 error:(id *)a4
{
  return -[DNDSFirstUnlockPurgedBackingStore writeRecord:writePartition:error:](self, "writeRecord:writePartition:error:", a3, 1, a4);
}

- (unint64_t)writeRecord:(id)a3 writePartition:(BOOL)a4 error:(id *)a5
{
  return -[DNDSCachedBackingStore writeRecord:writePartition:error:](self->_underlyingBackingStore, "writeRecord:writePartition:error:", a3, a4, a5);
}

- (void)purgeCache
{
  -[DNDSCachedBackingStore purgeCache](self->_underlyingBackingStore, "purgeCache");
}

- (id)backingStore:(id)a3 migrateDictionaryRepresentation:(id)a4 fromVersionNumber:(unint64_t)a5 toVersionNumber:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;

  v10 = a4;
  v11 = a3;
  -[DNDSFirstUnlockPurgedBackingStore delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "backingStore:migrateDictionaryRepresentation:fromVersionNumber:toVersionNumber:", v11, v10, a5, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)keybagDidUnlockForTheFirstTime:(id)a3
{
  id WeakRetained;

  -[DNDSCachedBackingStore purgeCache](self->_underlyingBackingStore, "purgeCache", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "cachedBackingStoreDidPurgeCache:", self);

}

- (DNDSCachedBackingStoreDelegate)delegate
{
  return (DNDSCachedBackingStoreDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_storeStrong((id *)&self->_underlyingBackingStore, 0);
}

@end
