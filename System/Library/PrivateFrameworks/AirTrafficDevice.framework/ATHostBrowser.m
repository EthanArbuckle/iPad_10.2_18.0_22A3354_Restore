@implementation ATHostBrowser

- (ATHostBrowser)init
{
  ATHostBrowser *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  NSMutableSet *hostsBeingResolved;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATHostBrowser;
  v2 = -[ATHostBrowser init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("ATHostDiscoveryService", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    hostsBeingResolved = v2->_hostsBeingResolved;
    v2->_hostsBeingResolved = (NSMutableSet *)v5;

  }
  return v2;
}

- (void)browseForHostsWithTimeout:(unint64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__ATHostBrowser_browseForHostsWithTimeout_completion___block_invoke;
  block[3] = &unk_1E927DA00;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)cancel
{
  -[NSNetServiceBrowser stop](self->_netServiceBrowser, "stop");
}

- (void)netServiceBrowser:(id)a3 didNotSearch:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__ATHostBrowser_netServiceBrowser_didNotSearch___block_invoke;
  v8[3] = &unk_1E927E148;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (void)netServiceBrowserDidStopSearch:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__ATHostBrowser_netServiceBrowserDidStopSearch___block_invoke;
  block[3] = &unk_1E927E120;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5
{
  id v7;
  NSObject *queue;
  id v9;
  _QWORD block[5];
  id v11;
  BOOL v12;

  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__ATHostBrowser_netServiceBrowser_didFindService_moreComing___block_invoke;
  block[3] = &unk_1E927DA28;
  block[4] = self;
  v11 = v7;
  v12 = a5;
  v9 = v7;
  dispatch_async(queue, block);

}

- (void)netServiceBrowser:(id)a3 didRemoveService:(id)a4 moreComing:(BOOL)a5
{
  id v7;
  NSObject *queue;
  id v9;
  _QWORD block[5];
  id v11;
  BOOL v12;

  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__ATHostBrowser_netServiceBrowser_didRemoveService_moreComing___block_invoke;
  block[3] = &unk_1E927DA28;
  block[4] = self;
  v11 = v7;
  v12 = a5;
  v9 = v7;
  dispatch_async(queue, block);

}

- (void)netServiceDidResolveAddress:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__ATHostBrowser_netServiceDidResolveAddress___block_invoke;
  v7[3] = &unk_1E927E148;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)netService:(id)a3 didNotResolve:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__ATHostBrowser_netService_didNotResolve___block_invoke;
  v8[3] = &unk_1E927E148;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (void)_finishSearchIfComplete
{
  NSObject *v3;
  NSNetServiceBrowser *netServiceBrowser;
  void *v5;
  NSNetServiceBrowser *v6;
  void (**completionBlock)(id, _QWORD, uint64_t);
  int v8;
  ATHostBrowser *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!self->_searchInProgress && !-[NSMutableSet count](self->_hostsBeingResolved, "count"))
  {
    _ATLogCategoryFramework();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = self;
      _os_log_impl(&dword_1D1868000, v3, OS_LOG_TYPE_DEFAULT, "%@ host browse completed", (uint8_t *)&v8, 0xCu);
    }

    netServiceBrowser = self->_netServiceBrowser;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNetServiceBrowser removeFromRunLoop:forMode:](netServiceBrowser, "removeFromRunLoop:forMode:", v5, *MEMORY[0x1E0C99748]);

    -[NSNetServiceBrowser setDelegate:](self->_netServiceBrowser, "setDelegate:", 0);
    v6 = self->_netServiceBrowser;
    self->_netServiceBrowser = 0;

    dispatch_source_cancel((dispatch_source_t)self->_timer);
    completionBlock = (void (**)(id, _QWORD, uint64_t))self->_completionBlock;
    if (completionBlock)
      completionBlock[2](completionBlock, 0, 1);
  }
}

- (void)_handleTimeout
{
  NSObject *v3;
  int v4;
  ATHostBrowser *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_1D1868000, v3, OS_LOG_TYPE_DEFAULT, "%@ timeout expired - ending search", (uint8_t *)&v4, 0xCu);
  }

  if (self->_searchInProgress)
    -[NSNetServiceBrowser stop](self->_netServiceBrowser, "stop");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_hostsBeingResolved, 0);
  objc_storeStrong((id *)&self->_netServiceBrowser, 0);
}

uint64_t __42__ATHostBrowser_netService_didNotResolve___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_finishSearchIfComplete");
}

uint64_t __45__ATHostBrowser_netServiceDidResolveAddress___block_invoke(uint64_t a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  ATHostNetService *v5;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "containsObject:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
    v3 = *(_QWORD **)(a1 + 32);
    v4 = v3[5];
    if (v4)
    {
      v5 = -[ATHostNetService initWithNetService:]([ATHostNetService alloc], "initWithNetService:", *(_QWORD *)(a1 + 40));
      (*(void (**)(uint64_t, ATHostNetService *, _QWORD))(v4 + 16))(v4, v5, 0);

      v3 = *(_QWORD **)(a1 + 32);
    }
    return objc_msgSend(v3, "_finishSearchIfComplete");
  }
  return result;
}

uint64_t __63__ATHostBrowser_netServiceBrowser_didRemoveService_moreComing___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
  if (!*(_BYTE *)(a1 + 48))
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "stop");
  return result;
}

uint64_t __61__ATHostBrowser_netServiceBrowser_didFindService_moreComing___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  double v10;
  uint64_t result;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(unsigned __int8 *)(a1 + 48);
    v12 = 138412802;
    v13 = v3;
    v14 = 2112;
    v15 = v4;
    v16 = 1024;
    v17 = v5;
    _os_log_impl(&dword_1D1868000, v2, OS_LOG_TYPE_DEFAULT, "%@ found host %@. moreComing=%d", (uint8_t *)&v12, 0x1Cu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v6 = *(double *)(*(_QWORD *)(a1 + 32) + 64);
  v8 = v7 - v6;
  v9 = v6 <= v7;
  v10 = 1.0;
  if (!v9)
    v10 = v8;
  result = objc_msgSend(*(id *)(a1 + 40), "resolveWithTimeout:", v10);
  if (!*(_BYTE *)(a1 + 48))
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "stop");
  return result;
}

uint64_t __48__ATHostBrowser_netServiceBrowserDidStopSearch___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1D1868000, v2, OS_LOG_TYPE_DEFAULT, "%@ search stopped", (uint8_t *)&v5, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_finishSearchIfComplete");
}

uint64_t __48__ATHostBrowser_netServiceBrowser_didNotSearch___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1D1868000, v2, OS_LOG_TYPE_DEFAULT, "%@ host browser failed search with error: %@", (uint8_t *)&v6, 0x16u);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_finishSearchIfComplete");
}

void __54__ATHostBrowser_browseForHostsWithTimeout_completion___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  dispatch_source_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  dispatch_time_t v20;
  uint64_t v21;
  NSObject *v22;
  _QWORD handler[5];
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[6];
    *(_DWORD *)buf = 138412546;
    v25 = v3;
    v26 = 2048;
    v27 = v4;
    _os_log_impl(&dword_1D1868000, v2, OS_LOG_TYPE_DEFAULT, "%@ browsing for hosts. timeout=%lus", buf, 0x16u);
  }

  v5 = MEMORY[0x1D8230780](a1[5]);
  v6 = a1[4];
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1[4] + 24), "removeAllObjects");
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  *(_QWORD *)(a1[4] + 56) = v8;
  *(double *)(a1[4] + 64) = *(double *)(a1[4] + 56) + (double)(unint64_t)a1[6];
  v9 = objc_alloc_init(MEMORY[0x1E0CB37B8]);
  v10 = a1[4];
  v11 = *(void **)(v10 + 8);
  *(_QWORD *)(v10 + 8) = v9;

  v12 = *(void **)(a1[4] + 8);
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scheduleInRunLoop:forMode:", v13, *MEMORY[0x1E0C99748]);

  objc_msgSend(*(id *)(a1[4] + 8), "setDelegate:");
  v14 = *(void **)(a1[4] + 8);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", "_atc._tcp", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "searchForServicesOfType:inDomain:", v15, &stru_1E927E4E0);

  *(_BYTE *)(a1[4] + 16) = 1;
  v16 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(a1[4] + 32));
  v17 = a1[4];
  v18 = *(void **)(v17 + 48);
  *(_QWORD *)(v17 + 48) = v16;

  v19 = *(NSObject **)(a1[4] + 48);
  v20 = dispatch_time(0, 1000000000 * a1[6]);
  dispatch_source_set_timer(v19, v20, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  v21 = a1[4];
  v22 = *(NSObject **)(v21 + 48);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __54__ATHostBrowser_browseForHostsWithTimeout_completion___block_invoke_7;
  handler[3] = &unk_1E927E120;
  handler[4] = v21;
  dispatch_source_set_event_handler(v22, handler);
  dispatch_resume(*(dispatch_object_t *)(a1[4] + 48));
}

uint64_t __54__ATHostBrowser_browseForHostsWithTimeout_completion___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleTimeout");
}

@end
