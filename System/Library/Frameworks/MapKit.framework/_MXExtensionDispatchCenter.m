@implementation _MXExtensionDispatchCenter

- (_MXExtensionDispatchCenter)initWithExtensionProvider:(id)a3
{
  id v4;
  _MXExtensionDispatchCenter *v5;
  _MXExtensionDispatchCenter *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *lock;
  uint64_t v10;
  NSHashTable *handlers;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_MXExtensionDispatchCenter;
  v5 = -[_MXExtensionDispatchCenter init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_extensionProvider, v4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.maps._MXExtensionDispatchCenter", v7);
    lock = v6->_lock;
    v6->_lock = (OS_dispatch_queue *)v8;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v10 = objc_claimAutoreleasedReturnValue();
    handlers = v6->_handlers;
    v6->_handlers = (NSHashTable *)v10;

  }
  return v6;
}

- (void)dispatchExtensions:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *lock;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD block[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__15;
  v21 = __Block_byref_object_dispose__15;
  v22 = 0;
  lock = self->_lock;
  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55___MXExtensionDispatchCenter_dispatchExtensions_error___block_invoke;
  block[3] = &unk_1E20D7E10;
  block[4] = self;
  block[5] = &v17;
  dispatch_sync(lock, block);
  v10 = (void *)v18[5];
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __55___MXExtensionDispatchCenter_dispatchExtensions_error___block_invoke_2;
  v13[3] = &unk_1E20DB3E8;
  v11 = v6;
  v14 = v11;
  v12 = v7;
  v15 = v12;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v13);

  _Block_object_dispose(&v17, 8);
}

- (id)addExtensionsUpdateHandler:(id)a3
{
  void *v4;
  NSObject *lock;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  _MXExtensionDispatchCenter *v15;
  id v16;

  v4 = (void *)objc_msgSend(a3, "copy");
  lock = self->_lock;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __57___MXExtensionDispatchCenter_addExtensionsUpdateHandler___block_invoke;
  v14 = &unk_1E20D8238;
  v15 = self;
  v6 = v4;
  v16 = v6;
  dispatch_sync(lock, &v11);
  WeakRetained = objc_loadWeakRetained((id *)&self->_extensionProvider);
  objc_msgSend(WeakRetained, "_currentExtensions", v11, v12, v13, v14, v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    (*((void (**)(id, void *, _QWORD))v6 + 2))(v6, v8, 0);
  v9 = (void *)MEMORY[0x18D778DB8](v6);

  return v9;
}

- (void)removeExtensionUpdateHandler:(id)a3
{
  id v4;
  NSObject *lock;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  lock = self->_lock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59___MXExtensionDispatchCenter_removeExtensionUpdateHandler___block_invoke;
  block[3] = &unk_1E20D7E58;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(lock, block);

}

- (_MXExtensionProvider)extensionProvider
{
  return (_MXExtensionProvider *)objc_loadWeakRetained((id *)&self->_extensionProvider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_extensionProvider);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
