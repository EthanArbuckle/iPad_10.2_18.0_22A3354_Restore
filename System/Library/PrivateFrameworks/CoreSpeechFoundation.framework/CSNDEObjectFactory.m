@implementation CSNDEObjectFactory

- (CSNDEObjectFactory)init
{
  CSNDEObjectFactory *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSNDEObjectFactory;
  v2 = -[CSNDEObjectFactory init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSNDEObjectFactory", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)createNDEObject:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  void **v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__CSNDEObjectFactory_createNDEObject___block_invoke;
  v9[3] = &unk_1E6880D18;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_async_and_wait(queue, v9);
  v7 = (void **)v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)destoryNDEObject:(void *)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__CSNDEObjectFactory_destoryNDEObject___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  dispatch_async_and_wait(queue, block);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __39__CSNDEObjectFactory_destoryNDEObject___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return nde_destroy();
  return result;
}

uint64_t __38__CSNDEObjectFactory_createNDEObject___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes");
  objc_msgSend(*(id *)(a1 + 32), "length");
  result = nde_create();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_sharedInstance;
}

void __36__CSNDEObjectFactory_sharedInstance__block_invoke()
{
  CSNDEObjectFactory *v0;
  void *v1;

  v0 = objc_alloc_init(CSNDEObjectFactory);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

@end
