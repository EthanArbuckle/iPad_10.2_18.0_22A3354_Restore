@implementation NPSDomainAccessorFilePresenter

- (NPSDomainAccessorFilePresenter)initWithDelegate:(id)a3 domainURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NPSDomainAccessorFilePresenter *v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *presenterUnderlyingQueue;
  NSOperationQueue *v14;
  NSOperationQueue *presenterOperationQueue;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  objc_super v21;
  uint8_t buf[4];
  NPSDomainAccessorFilePresenter *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("delegate: (%@)"), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "exceptionWithName:reason:userInfo:", v18, v19, 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v20);
  }
  v8 = v7;
  v21.receiver = self;
  v21.super_class = (Class)NPSDomainAccessorFilePresenter;
  v9 = -[NPSDomainAccessorFilePresenter init](&v21, sel_init);
  if (v9)
  {
    v10 = nps_domain_accessor_log;
    if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v23 = v9;
      v24 = 2048;
      v25 = v6;
      v26 = 2112;
      v27 = v8;
      _os_log_impl(&dword_1B5280000, v10, OS_LOG_TYPE_DEFAULT, "self: (%p); delegate: (%p); domainURL: (%@)",
        buf,
        0x20u);
    }
    objc_storeWeak((id *)&v9->_delegate, v6);
    objc_storeStrong((id *)&v9->_domainURL, a4);
    v9->_current = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.nanoprefsync.frmrk.filePresenter", v11);
    presenterUnderlyingQueue = v9->_presenterUnderlyingQueue;
    v9->_presenterUnderlyingQueue = (OS_dispatch_queue *)v12;

    v14 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    presenterOperationQueue = v9->_presenterOperationQueue;
    v9->_presenterOperationQueue = v14;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v9->_presenterOperationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setUnderlyingQueue:](v9->_presenterOperationQueue, "setUnderlyingQueue:", v9->_presenterUnderlyingQueue);

  }
  return v9;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  NPSDomainAccessorFilePresenter *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl(&dword_1B5280000, v3, OS_LOG_TYPE_DEFAULT, "self: (%p)", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)NPSDomainAccessorFilePresenter;
  -[NPSDomainAccessorFilePresenter dealloc](&v4, sel_dealloc);
}

- (id)synchronizeForReadingOnly:(BOOL)a3 handler:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  NSURL *domainURL;
  id *v10;
  id *v11;
  id v12;
  NSObject *v13;
  NSURL *v14;
  id v15;
  _QWORD v17[5];
  id v18;
  uint64_t v19;
  _QWORD v20[5];
  id v21;
  uint64_t v22;
  uint8_t buf[4];
  NSURL *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v4 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!v6)
    -[NPSDomainAccessorFilePresenter synchronizeForReadingOnly:handler:].cold.1();
  v7 = v6;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3600]), "initWithFilePresenter:", self);
  domainURL = self->_domainURL;
  if (v4)
  {
    v22 = 0;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __68__NPSDomainAccessorFilePresenter_synchronizeForReadingOnly_handler___block_invoke;
    v20[3] = &unk_1E68E5E10;
    v20[4] = self;
    v10 = &v21;
    v21 = v7;
    v11 = (id *)&v22;
    objc_msgSend(v8, "coordinateReadingItemAtURL:options:error:byAccessor:", domainURL, 1, &v22, v20);
  }
  else
  {
    v19 = 0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __68__NPSDomainAccessorFilePresenter_synchronizeForReadingOnly_handler___block_invoke_2;
    v17[3] = &unk_1E68E5E10;
    v17[4] = self;
    v10 = &v18;
    v18 = v7;
    v11 = (id *)&v19;
    objc_msgSend(v8, "coordinateWritingItemAtURL:options:error:byAccessor:", domainURL, 0, &v19, v17);
  }
  v12 = *v11;

  if (v12)
  {
    v13 = nps_domain_accessor_log;
    if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
    {
      v14 = self->_domainURL;
      *(_DWORD *)buf = 138412546;
      v24 = v14;
      v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_1B5280000, v13, OS_LOG_TYPE_DEFAULT, "Failed to file-coordinate URL (%@) with error: (%@)", buf, 0x16u);
    }
    v15 = v12;
  }

  return v12;
}

uint64_t __68__NPSDomainAccessorFilePresenter_synchronizeForReadingOnly_handler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = result;
  return result;
}

uint64_t __68__NPSDomainAccessorFilePresenter_synchronizeForReadingOnly_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = result;
  return result;
}

- (BOOL)isCurrent
{
  NSOperationQueue *presenterOperationQueue;
  void *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  presenterOperationQueue = self->_presenterOperationQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__NPSDomainAccessorFilePresenter_isCurrent__block_invoke;
  v6[3] = &unk_1E68E5D18;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSOperationQueue addOperations:waitUntilFinished:](presenterOperationQueue, "addOperations:waitUntilFinished:", v4, 1);

  LOBYTE(presenterOperationQueue) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)presenterOperationQueue;
}

uint64_t __43__NPSDomainAccessorFilePresenter_isCurrent__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

- (NSURL)presentedItemURL
{
  return self->_domainURL;
}

- (NSOperationQueue)presentedItemOperationQueue
{
  return self->_presenterOperationQueue;
}

- (void)relinquishPresentedItemToWriter:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  id WeakRetained;
  int v7;
  NPSDomainAccessorFilePresenter *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v5 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = self;
    _os_log_impl(&dword_1B5280000, v5, OS_LOG_TYPE_DEFAULT, "self: (%p)", (uint8_t *)&v7, 0xCu);
  }
  self->_current = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "filePresenterDidBecomeNonCurrent:", self);

  if (v4)
    v4[2](v4, 0);

}

- (BOOL)presentedItemNeedsWatching
{
  return 0;
}

- (NSURL)domainURL
{
  return self->_domainURL;
}

- (void)setDomainURL:(id)a3
{
  objc_storeStrong((id *)&self->_domainURL, a3);
}

- (NPSDomainAccessorFilePresenterDelegate)delegate
{
  return (NPSDomainAccessorFilePresenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setCurrent:(BOOL)a3
{
  self->_current = a3;
}

- (NSOperationQueue)presenterOperationQueue
{
  return self->_presenterOperationQueue;
}

- (void)setPresenterOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_presenterOperationQueue, a3);
}

- (OS_dispatch_queue)presenterUnderlyingQueue
{
  return self->_presenterUnderlyingQueue;
}

- (void)setPresenterUnderlyingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_presenterUnderlyingQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presenterUnderlyingQueue, 0);
  objc_storeStrong((id *)&self->_presenterOperationQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_domainURL, 0);
}

- (void)synchronizeForReadingOnly:handler:.cold.1()
{
  __assert_rtn("-[NPSDomainAccessorFilePresenter synchronizeForReadingOnly:handler:]", "NPSDomainAccessorFilePresenter.m", 66, "handler");
}

@end
