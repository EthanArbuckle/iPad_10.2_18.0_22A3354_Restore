@implementation NRMockXPCStuff

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__NRMockXPCStuff_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EE5CE2C8 != -1)
    dispatch_once(&qword_1EE5CE2C8, block);
  return (id)_MergedGlobals_1;
}

void __32__NRMockXPCStuff_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_opt_class();
  v0 = objc_opt_new();
  v1 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = v0;

}

- (NRMockXPCStuff)init
{
  NRMockXPCStuff *v2;
  uint64_t v3;
  NSMutableDictionary *mockListeners;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NRMockXPCStuff;
  v2 = -[NRMockXPCStuff init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    mockListeners = v2->_mockListeners;
    v2->_mockListeners = (NSMutableDictionary *)v3;

    v5 = dispatch_queue_create("com.apple.nanoregistry.mockxpc.stuff", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_mockListeners, 0);
}

@end
