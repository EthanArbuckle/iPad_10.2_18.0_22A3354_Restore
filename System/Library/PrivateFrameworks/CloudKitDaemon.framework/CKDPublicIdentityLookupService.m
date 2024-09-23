@implementation CKDPublicIdentityLookupService

- (CKDPublicIdentityLookupService)initWithContainer:(id)a3
{
  id v4;
  CKDPublicIdentityLookupService *v5;
  CKDPublicIdentityLookupService *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  CKDIdentityCache *cache;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKDPublicIdentityLookupService;
  v5 = -[CKDPublicIdentityLookupService init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_container, v4);
    objc_msgSend_publicIdentitiesDiskCache(v4, v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    cache = v6->_cache;
    v6->_cache = (CKDIdentityCache *)v9;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.cloudkit.PILSQueue", v11);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v12;

  }
  return v6;
}

- (void)scheduleRequest:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  NSObject *queue;
  _QWORD block[4];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v5 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v4;
    _os_log_debug_impl(&dword_1BE990000, v5, OS_LOG_TYPE_DEBUG, "Starting lookup for request %@", buf, 0xCu);
  }
  if (objc_msgSend_isCancelled(v4, v6, v7))
  {
    objc_msgSend_finishWithError_(v4, v8, 0);
  }
  else
  {
    objc_msgSend_configureRequest_(self, v8, (uint64_t)v4);
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BEBC7BCC;
    block[3] = &unk_1E782EA40;
    v11 = v4;
    dispatch_async(queue, block);

  }
}

- (void)configureRequest:(id)a3
{
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  id v25;

  v25 = a3;
  objc_msgSend_container(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serverConfig(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerID(v7, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_maxBatchSize_(v10, v14, (uint64_t)v13);

  if (v15
    || (objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v16, v17),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend_maxBatchSize(v18, v19, v20),
        v18,
        v15))
  {
    objc_msgSend_setFetchBatchSize_(v25, v16, v15);
  }
  else
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v16, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, self, CFSTR("CKDPublicIdentityLookupService.m"), 61, CFSTR("Batch size is zero, we won't make any progress"));

    objc_msgSend_setFetchBatchSize_(v25, v24, 0);
  }

}

- (void)removeCacheForLookupInfos:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CKDIdentityCache *cache;
  id WeakRetained;
  const char *v13;
  const char *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        cache = self->_cache;
        WeakRetained = objc_loadWeakRetained((id *)&self->_container);
        objc_msgSend_removeCachedValueForLookupInfo_container_(cache, v13, v10, WeakRetained);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v14, (uint64_t)&v15, v19, 16);
    }
    while (v7);
  }

}

- (CKDContainer)container
{
  return (CKDContainer *)objc_loadWeakRetained((id *)&self->_container);
}

- (CKDIdentityCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_destroyWeak((id *)&self->_container);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
