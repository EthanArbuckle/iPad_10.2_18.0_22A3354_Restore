@implementation GEOMapRequestManager

- (GEOMapRequestManager)init
{
  GEOMapRequestManager *v2;
  NSMutableSet *v3;
  NSMutableSet *requests;
  uint64_t v5;
  geo_isolater *isolater;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GEOMapRequestManager;
  v2 = -[GEOMapRequestManager init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    requests = v2->_requests;
    v2->_requests = v3;

    v5 = geo_isolater_create();
    isolater = v2->_isolater;
    v2->_isolater = (geo_isolater *)v5;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  GEOMapRequestManager *v8;

  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __31__GEOMapRequestManager_dealloc__block_invoke;
  v7 = &unk_1E1BFF6F8;
  v8 = self;
  geo_isolate_sync_data();
  v3.receiver = self;
  v3.super_class = (Class)GEOMapRequestManager;
  -[GEOMapRequestManager dealloc](&v3, sel_dealloc);
}

void __31__GEOMapRequestManager_dealloc__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "cancel", (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)trackRequest:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  geo_isolate_sync_data();

}

uint64_t __37__GEOMapRequestManager_trackRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)requestComplete:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  geo_isolate_sync_data();

}

uint64_t __40__GEOMapRequestManager_requestComplete___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isolater, 0);
  objc_storeStrong((id *)&self->_requests, 0);
}

@end
