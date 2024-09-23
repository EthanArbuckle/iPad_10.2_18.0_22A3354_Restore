@implementation _MXAssetStorage

- (_MXAssetStorage)init
{
  _MXAssetStorage *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *lock;
  NSMutableDictionary *v6;
  NSMutableDictionary *storage;
  NSMutableSet *v8;
  NSMutableSet *loadingKeys;
  NSMutableDictionary *v10;
  NSMutableDictionary *fetchBlocks;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_MXAssetStorage;
  v2 = -[_MXAssetStorage init](&v13, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.maps.MXAssetStorage", v3);
    lock = v2->_lock;
    v2->_lock = (OS_dispatch_queue *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    storage = v2->_storage;
    v2->_storage = v6;

    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    loadingKeys = v2->_loadingKeys;
    v2->_loadingKeys = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    fetchBlocks = v2->_fetchBlocks;
    v2->_fetchBlocks = v10;

  }
  return v2;
}

- (void)loadAssetForKey:(id)a3 withBlock:(id)a4
{
  id v6;
  NSObject *lock;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v8 = a3;
  v6 = a4;
  if (v6)
  {
    lock = self->_lock;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45___MXAssetStorage_loadAssetForKey_withBlock___block_invoke;
    block[3] = &unk_1E20D9040;
    block[4] = self;
    v10 = v8;
    v11 = v6;
    dispatch_sync(lock, block);

  }
}

- (void)setAsset:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *lock;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  _QWORD block[4];
  id v17;
  _MXAssetStorage *v18;
  id v19;
  _QWORD *v20;
  _QWORD v21[5];
  id v22;

  v6 = a3;
  v7 = a4;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__15;
  v21[4] = __Block_byref_object_dispose__15;
  v22 = 0;
  lock = self->_lock;
  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35___MXAssetStorage_setAsset_forKey___block_invoke;
  block[3] = &unk_1E20DB460;
  v10 = v6;
  v17 = v10;
  v18 = self;
  v19 = v7;
  v20 = v21;
  v11 = v7;
  dispatch_sync(lock, block);
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __35___MXAssetStorage_setAsset_forKey___block_invoke_2;
  v13[3] = &unk_1E20D7E10;
  v14 = v10;
  v15 = v21;
  v12 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], v13);

  _Block_object_dispose(v21, 8);
}

- (void)fetchAssetForKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *lock;
  id v9;
  void (**v10)(_QWORD);
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__15;
  v19 = __Block_byref_object_dispose__15;
  v20 = 0;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47___MXAssetStorage_fetchAssetForKey_completion___block_invoke;
  v11[3] = &unk_1E20DB488;
  v14 = &v15;
  v11[4] = self;
  v9 = v6;
  v12 = v9;
  v10 = (void (**)(_QWORD))v7;
  v13 = v10;
  dispatch_sync(lock, v11);
  if (v16[5])
    v10[2](v10);

  _Block_object_dispose(&v15, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchBlocks, 0);
  objc_storeStrong((id *)&self->_loadingKeys, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
