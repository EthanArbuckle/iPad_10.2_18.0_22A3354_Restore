@implementation NTKDLoadOnceCollectionObserver

- (NTKDLoadOnceCollectionObserver)initWithCollection:(id)a3
{
  id v5;
  NTKDLoadOnceCollectionObserver *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  NSMutableArray *handlers;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NTKDLoadOnceCollectionObserver;
  v6 = -[NTKDLoadOnceCollectionObserver init](&v13, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.nanotimekit.collections.loadonce", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    v6->_hasLoaded = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    handlers = v6->_handlers;
    v6->_handlers = (NSMutableArray *)v10;

    objc_storeStrong((id *)&v6->_collection, a3);
    -[NTKFaceCollection addObserver:](v6->_collection, "addObserver:", v6);
  }

  return v6;
}

- (void)performOnLoad:(id)a3
{
  id v4;
  NSObject *v5;
  NTKFaceCollection *collection;
  NSObject *queue;
  NSObject *v8;
  NTKFaceCollection *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  NTKFaceCollection *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _NTKLoggingObjectForDomain(1, (uint64_t)"NTKLoggingDomainDaemon");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    collection = self->_collection;
    *(_DWORD *)buf = 138412290;
    v13 = collection;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "LoadOnce: Collection %@ got work to do…", buf, 0xCu);
  }

  if (v4)
  {
    queue = self->_queue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __48__NTKDLoadOnceCollectionObserver_performOnLoad___block_invoke;
    v10[3] = &unk_1E6BD00B0;
    v10[4] = self;
    v11 = v4;
    dispatch_async(queue, v10);

  }
  else
  {
    _NTKLoggingObjectForDomain(1, (uint64_t)"NTKLoggingDomainDaemon");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->_collection;
      *(_DWORD *)buf = 138412290;
      v13 = v9;
      _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "LoadOnce: No work provided for %@.", buf, 0xCu);
    }

  }
}

void __48__NTKDLoadOnceCollectionObserver_performOnLoad___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  const void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 32);
  _NTKLoggingObjectForDomain(1, (uint64_t)"NTKLoggingDomainDaemon");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "LoadOnce: Already loaded %@.", (uint8_t *)&v10, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (v4)
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "LoadOnce: Load pending for %@.", (uint8_t *)&v10, 0xCu);
    }

    v7 = *(const void **)(a1 + 40);
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v9 = _Block_copy(v7);
    objc_msgSend(v8, "addObject:", v9);

  }
}

- (void)faceCollectionDidLoad:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _NTKLoggingObjectForDomain(1, (uint64_t)"NTKLoggingDomainDaemon");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "LoadOnce: Collection loaded %@!", buf, 0xCu);
  }

  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__NTKDLoadOnceCollectionObserver_faceCollectionDidLoad___block_invoke;
  v8[3] = &unk_1E6BCD778;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(queue, v8);

}

void __56__NTKDLoadOnceCollectionObserver_faceCollectionDidLoad___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  _NTKLoggingObjectForDomain(1, (uint64_t)"NTKLoggingDomainDaemon");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v16 = v4;
    v17 = 2048;
    v18 = objc_msgSend(v2, "count");
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "LoadOnce: Collection %@ invoking %lu handlers!", buf, 0x16u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v2;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

@end
