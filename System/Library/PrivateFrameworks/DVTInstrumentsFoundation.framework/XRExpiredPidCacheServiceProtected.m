@implementation XRExpiredPidCacheServiceProtected

- (XRExpiredPidCacheServiceProtected)init
{
  XRExpiredPidCacheServiceProtected *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *cacheQ;
  _XRExpiredPidCache *v5;
  _XRExpiredPidCache *cache;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)XRExpiredPidCacheServiceProtected;
  v2 = -[XRExpiredPidCacheServiceProtected init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("Expired Pid Cache", 0);
    cacheQ = v2->_cacheQ;
    v2->_cacheQ = (OS_dispatch_queue *)v3;

    v5 = objc_alloc_init(_XRExpiredPidCache);
    cache = v2->_cache;
    v2->_cache = v5;

  }
  return v2;
}

- (void)_performOnCache:(id)a3
{
  id v4;
  NSObject *cacheQ;
  id v6;
  void *v7;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_222B1A490;
  v15 = sub_222B1A4A0;
  v16 = 0;
  cacheQ = self->_cacheQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_222B1A4A8;
  block[3] = &unk_24EB27CF0;
  v6 = v4;
  block[4] = self;
  v9 = v6;
  v10 = &v11;
  dispatch_sync(cacheQ, block);
  v7 = (void *)v12[5];
  if (v7)
    objc_exception_throw(objc_retainAutorelease(v7));

  _Block_object_dispose(&v11, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_cacheQ, 0);
}

@end
