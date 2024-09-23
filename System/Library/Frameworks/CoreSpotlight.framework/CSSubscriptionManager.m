@implementation CSSubscriptionManager

+ (id)sharedManager
{
  if (sharedManager_once != -1)
    dispatch_once(&sharedManager_once, &__block_literal_global_0);
  return (id)sharedManager_mgr;
}

void __38__CSSubscriptionManager_sharedManager__block_invoke()
{
  CSSubscriptionManager *v0;
  void *v1;

  v0 = objc_alloc_init(CSSubscriptionManager);
  v1 = (void *)sharedManager_mgr;
  sharedManager_mgr = (uint64_t)v0;

}

- (CSSubscriptionManager)init
{
  CSSubscriptionManager *v2;
  void *v3;
  objc_class *v4;
  PSSSSubscriptionManager *v5;
  PSSSSubscriptionManager *internal;
  objc_super v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v8.receiver = self;
  v8.super_class = (Class)CSSubscriptionManager;
  v2 = -[CSSubscriptionManager init](&v8, sel_init);
  if (v2)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v3 = (void *)getPSSSSubscriptionManagerClass_softClass;
    v13 = getPSSSSubscriptionManagerClass_softClass;
    if (!getPSSSSubscriptionManagerClass_softClass)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getPSSSSubscriptionManagerClass_block_invoke;
      v9[3] = &unk_1E2401140;
      v9[4] = &v10;
      __getPSSSSubscriptionManagerClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v10, 8);
    v5 = (PSSSSubscriptionManager *)objc_alloc_init(v4);
    internal = v2->_internal;
    v2->_internal = v5;

  }
  return v2;
}

- (void)registerSubscriptionWithInfo:(id)a3 expirationDate:(id)a4
{
  -[PSSSSubscriptionManager registerSubscriptionWithInfo:expirationDate:](self->_internal, "registerSubscriptionWithInfo:expirationDate:", a3, a4);
}

- (void)unregisterSubscriptionWithInfo:(id)a3
{
  -[PSSSSubscriptionManager unregisterSubscriptionWithInfo:](self->_internal, "unregisterSubscriptionWithInfo:", a3);
}

- (void)unregisterAllSubscriptions
{
  -[PSSSSubscriptionManager unregisterAllSubscriptions](self->_internal, "unregisterAllSubscriptions");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
}

@end
