@implementation ASKNetworkQualityInquiry

void __67__ASKNetworkQualityInquiry_investigateNetworksWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  objc_msgSend(v3, "knownNetworks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v25 = v5;
  v6 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v7 = (void *)objc_msgSend(v6, "initWithCapacity:", v23[3]);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v3, "knownNetworks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
        objc_msgSend(v3, "manager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __67__ASKNetworkQualityInquiry_investigateNetworksWithCompletionBlock___block_invoke_2;
        v14[3] = &unk_1E9DC2158;
        v14[4] = v12;
        v15 = v7;
        v17 = &v22;
        v16 = *(id *)(a1 + 32);
        objc_msgSend(v13, "auditableLinkQualityForNOI:reply:", v12, v14);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v9);
  }

  _Block_object_dispose(&v22, 8);
}

- (NWNetworkOfInterestManager)manager
{
  return self->_manager;
}

void __67__ASKNetworkQualityInquiry_investigateNetworksWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  __CFString *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _BYTE buf[24];
  void *v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = v5;
  if (v8 && (v9 = objc_msgSend(v7, "interface"), (unint64_t)(v9 - 1) <= 2))
  {
    v10 = off_1E9DC21E8[v9 - 1];
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __ASKNetworkQualityInquiryReportMake_block_invoke;
    v23 = &unk_1E9DC21A8;
    v12 = v11;
    v24 = v12;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", buf);
    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, CFSTR("interface"));
      v13 = (void *)objc_msgSend(v12, "copy");
    }
    else
    {
      v13 = 0;
    }

    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v13);

    }
  }
  else
  {

  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CFDAF0], "ask_generalLogConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CFDAF0], "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v6;
      _os_log_impl(&dword_1D8328000, v15, OS_LOG_TYPE_ERROR, "Could not determine link quality for %@, reason: %@", buf, 0x16u);
    }

  }
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v18 = *(_QWORD *)(v17 + 24) - 1;
  *(_QWORD *)(v17 + 24) = v18;
  if (!v18)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __67__ASKNetworkQualityInquiry_investigateNetworksWithCompletionBlock___block_invoke_32;
    v19[3] = &unk_1E9DC1D20;
    v21 = *(id *)(a1 + 48);
    v20 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], v19);

  }
}

- (void)didStartTrackingNOI:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[ASKNetworkQualityInquiry knownNetworks](self, "knownNetworks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  if (-[ASKNetworkQualityInquiry areKnownNetworksReady](self, "areKnownNetworksReady"))
    -[ASKNetworkQualityInquiry drainKnownNetworksReadyHandlers](self, "drainKnownNetworksReadyHandlers");
}

- (BOOL)areKnownNetworksReady
{
  NSObject *v3;
  void *v4;

  -[ASKNetworkQualityInquiry queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[ASKNetworkQualityInquiry knownNetworks](self, "knownNetworks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "count") == 3;

  return (char)v3;
}

- (NSMutableSet)knownNetworks
{
  return self->_knownNetworks;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)investigateNetworksWithCompletionBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__ASKNetworkQualityInquiry_investigateNetworksWithCompletionBlock___block_invoke;
  v6[3] = &unk_1E9DC2180;
  v7 = v4;
  v5 = v4;
  -[ASKNetworkQualityInquiry performWhenKnownNetworksReady:](self, "performWhenKnownNetworksReady:", v6);

}

- (void)performWhenKnownNetworksReady:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ASKNetworkQualityInquiry queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__ASKNetworkQualityInquiry_performWhenKnownNetworksReady___block_invoke;
  v7[3] = &unk_1E9DC2050;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (ASKNetworkQualityInquiry)init
{
  ASKNetworkQualityInquiry *v2;
  NWNetworkOfInterestManager *v3;
  NWNetworkOfInterestManager *manager;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  NSMutableSet *v7;
  NSMutableSet *knownNetworks;
  ASKNetworkQualityInquiry *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ASKNetworkQualityInquiry;
  v2 = -[ASKNetworkQualityInquiry init](&v11, sel_init);
  if (v2)
  {
    v3 = (NWNetworkOfInterestManager *)objc_alloc_init(MEMORY[0x1E0DB0680]);
    manager = v2->_manager;
    v2->_manager = v3;

    if (!v2->_manager)
    {
      v9 = 0;
      goto LABEL_6;
    }
    v5 = dispatch_queue_create("AppStoreKitInternal.NetworkQualityInquiry.queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    -[NWNetworkOfInterestManager setQueue:](v2->_manager, "setQueue:", v2->_queue);
    -[NWNetworkOfInterestManager setDelegate:](v2->_manager, "setDelegate:", v2);
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    knownNetworks = v2->_knownNetworks;
    v2->_knownNetworks = v7;

    -[NWNetworkOfInterestManager trackNOIAnyForInterfaceType:options:](v2->_manager, "trackNOIAnyForInterfaceType:options:", 2, 0);
    -[NWNetworkOfInterestManager trackNOIAnyForInterfaceType:options:](v2->_manager, "trackNOIAnyForInterfaceType:options:", 1, 0);
    -[NWNetworkOfInterestManager trackNOIAnyForInterfaceType:options:](v2->_manager, "trackNOIAnyForInterfaceType:options:", 3, 0);
  }
  v9 = v2;
LABEL_6:

  return v9;
}

- (void)drainKnownNetworksReadyHandlers
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[ASKNetworkQualityInquiry queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[ASKNetworkQualityInquiry knownNetworksReadyHandlers](self, "knownNetworksReadyHandlers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++) + 16))();
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[ASKNetworkQualityInquiry setKnownNetworksReadyHandlers:](self, "setKnownNetworksReadyHandlers:", 0);
}

- (void)setKnownNetworksReadyHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_knownNetworksReadyHandlers, a3);
}

void __58__ASKNetworkQualityInquiry_performWhenKnownNetworksReady___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (objc_msgSend(*(id *)(a1 + 32), "areKnownNetworksReady"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "knownNetworksReadyHandlers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
    {
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
      objc_msgSend(*(id *)(a1 + 32), "setKnownNetworksReadyHandlers:", v3);

    }
    objc_msgSend(*(id *)(a1 + 32), "knownNetworksReadyHandlers");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    v5 = _Block_copy(v4);
    objc_msgSend(v6, "addObject:", v5);

  }
}

- (NSMutableArray)knownNetworksReadyHandlers
{
  return self->_knownNetworksReadyHandlers;
}

- (void)dealloc
{
  objc_super v3;

  -[NWNetworkOfInterestManager setDelegate:](self->_manager, "setDelegate:", 0);
  -[NWNetworkOfInterestManager destroy](self->_manager, "destroy");
  v3.receiver = self;
  v3.super_class = (Class)ASKNetworkQualityInquiry;
  -[ASKNetworkQualityInquiry dealloc](&v3, sel_dealloc);
}

- (void)didStopTrackingNOI:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  ASKNetworkQualityInquiry *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ASKNetworkQualityInquiry knownNetworks](self, "knownNetworks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  objc_msgSend(MEMORY[0x1E0CFDAF0], "ask_generalLogConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CFDAF0], "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412546;
    v10 = self;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1D8328000, v7, OS_LOG_TYPE_DEBUG, "%@: Stopped tracking %@, searching for interface again", (uint8_t *)&v9, 0x16u);
  }

  -[ASKNetworkQualityInquiry manager](self, "manager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trackNOIAnyForInterfaceType:options:", objc_msgSend(v4, "interface"), 0);

}

- (void)didStopTrackingAllNOIs:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[ASKNetworkQualityInquiry didStopTrackingNOI:](self, "didStopTrackingNOI:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

uint64_t __67__ASKNetworkQualityInquiry_investigateNetworksWithCompletionBlock___block_invoke_32(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownNetworksReadyHandlers, 0);
  objc_storeStrong((id *)&self->_knownNetworks, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

@end
