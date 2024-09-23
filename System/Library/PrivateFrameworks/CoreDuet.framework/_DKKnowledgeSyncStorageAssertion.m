@implementation _DKKnowledgeSyncStorageAssertion

+ (uint64_t)assertionCount
{
  id v0;
  uint64_t v1;

  v0 = (id)objc_opt_self();
  objc_sync_enter(v0);
  v1 = _DKKnowledgeSyncStorageAssertionCount;
  objc_sync_exit(v0);

  return v1;
}

- (_DKKnowledgeSyncStorageAssertion)init
{
  _DKKnowledgeSyncStorageAssertion *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_DKKnowledgeSyncStorageAssertion;
  v2 = -[_DKKnowledgeSyncStorageAssertion init](&v5, sel_init);
  if (v2)
  {
    objc_opt_class();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v3);
    ++_DKKnowledgeSyncStorageAssertionCount;
    objc_sync_exit(v3);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_opt_class();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  if (_DKKnowledgeSyncStorageAssertionCount)
    --_DKKnowledgeSyncStorageAssertionCount;
  objc_sync_exit(v3);

  v4.receiver = self;
  v4.super_class = (Class)_DKKnowledgeSyncStorageAssertion;
  -[_DKKnowledgeSyncStorageAssertion dealloc](&v4, sel_dealloc);
}

@end
