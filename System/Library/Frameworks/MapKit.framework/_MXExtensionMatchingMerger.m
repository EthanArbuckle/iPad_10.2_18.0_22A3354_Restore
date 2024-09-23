@implementation _MXExtensionMatchingMerger

- (_MXExtensionMatchingMerger)init
{
  _MXExtensionMatchingMerger *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *lock;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_MXExtensionMatchingMerger;
  v2 = -[_MXExtensionMatchingMerger init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.maps.ThreeLegsMerger", v3);
    lock = v2->_lock;
    v2->_lock = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (id)receiveExtensions:(id)a3 withIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *lock;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  _MXExtensionMatchingMerger *v17;
  id v18;
  id v19;
  unint64_t v20;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  lock = self->_lock;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __58___MXExtensionMatchingMerger_receiveExtensions_withIndex___block_invoke;
  v16 = &unk_1E20DB3C0;
  v17 = self;
  v18 = v6;
  v19 = v7;
  v20 = a4;
  v9 = v7;
  v10 = v6;
  dispatch_sync(lock, &v13);
  v11 = (void *)objc_msgSend(v9, "copy", v13, v14, v15, v16, v17);

  return v11;
}

- (void)clearExtensions
{
  NSObject *lock;
  _QWORD block[5];

  lock = self->_lock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45___MXExtensionMatchingMerger_clearExtensions__block_invoke;
  block[3] = &unk_1E20D7D98;
  block[4] = self;
  dispatch_sync(lock, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentUIExtensions, 0);
  objc_storeStrong((id *)&self->_intentNonUIExtensions, 0);
  objc_storeStrong((id *)&self->_mapExtensions, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
