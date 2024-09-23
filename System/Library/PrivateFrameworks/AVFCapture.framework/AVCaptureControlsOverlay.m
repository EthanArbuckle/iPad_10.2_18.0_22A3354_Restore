@implementation AVCaptureControlsOverlay

+ (void)initialize
{
  objc_opt_class();
}

- (AVCaptureControlsOverlay)initWithSession:(id)a3
{
  AVCaptureControlsOverlay *v4;
  dispatch_queue_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVCaptureControlsOverlay;
  v4 = -[AVCaptureControlsOverlay init](&v7, sel_init);
  if (v4)
  {
    v4->_sessionReference = (AVWeakReference *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF2D50]), "initWithReferencedObject:", a3);
    v5 = dispatch_queue_create("com.apple.avfoundation.controls-overlay", 0);
    v4->_controlsLock._os_unfair_lock_opaque = 0;
    v4->_connectionQueue = (OS_dispatch_queue *)v5;
    os_unfair_lock_lock(&v4->_controlsLock);
    v4->_itemsByIdentifier = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
    v4->_orderedIdentifiers = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    os_unfair_lock_unlock(&v4->_controlsLock);
  }
  return v4;
}

- (void)dealloc
{
  NSObject *connectionQueue;
  CAMOverlayServiceConnection *connection;
  NSDictionary *itemsByIdentifier;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD block[5];
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];

  connectionQueue = self->_connectionQueue;
  connection = self->_connection;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__AVCaptureControlsOverlay_dealloc__block_invoke;
  block[3] = &unk_1E42165A8;
  block[4] = connection;
  dispatch_async(connectionQueue, block);

  os_unfair_lock_lock(&self->_controlsLock);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  itemsByIdentifier = self->_itemsByIdentifier;
  v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](itemsByIdentifier, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(itemsByIdentifier);
        objc_msgSend((id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_itemsByIdentifier, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i)), "control"), "removeObservers");
      }
      v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](itemsByIdentifier, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(&self->_controlsLock);
  v10.receiver = self;
  v10.super_class = (Class)AVCaptureControlsOverlay;
  -[AVCaptureControlsOverlay dealloc](&v10, sel_dealloc);
}

uint64_t __35__AVCaptureControlsOverlay_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)updateControls:(id)a3
{
  os_unfair_lock_s *p_controlsLock;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  AVCaptureControlsOverlayItem *v16;
  NSDictionary *itemsByIdentifier;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  NSDictionary *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  NSObject *connectionQueue;
  os_unfair_lock_s *lock;
  id obj;
  _QWORD block[5];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[7];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  p_controlsLock = &self->_controlsLock;
  os_unfair_lock_lock(&self->_controlsLock);
  v6 = (id)-[NSArray copy](self->_orderedIdentifiers, "copy");
  v7 = (id)-[NSDictionary copy](self->_itemsByIdentifier, "copy");
  os_unfair_lock_unlock(p_controlsLock);
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  obj = a3;
  v8 = objc_msgSend(a3, "count");
  if (v8 == objc_msgSend(v6, "count"))
  {
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __43__AVCaptureControlsOverlay_updateControls___block_invoke;
    v42[3] = &unk_1E421D1C0;
    v42[4] = a3;
    v42[5] = v7;
    v42[6] = &v43;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v42);
    if (!*((_BYTE *)v44 + 24))
      goto LABEL_28;
  }
  else
  {
    *((_BYTE *)v44 + 24) = 1;
  }
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
  lock = p_controlsLock;
  if (v11)
  {
    v12 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v39 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "identifier");
        v16 = -[AVCaptureControlsOverlayItem initWithControl:overlayControl:]([AVCaptureControlsOverlayItem alloc], "initWithControl:overlayControl:", v14, objc_msgSend(v14, "overlayControl"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, v15);

        objc_msgSend(v9, "addObject:", v15);
        objc_msgSend(v14, "setOverlay:", self);
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
    }
    while (v11);
  }
  os_unfair_lock_lock(lock);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  itemsByIdentifier = self->_itemsByIdentifier;
  v18 = -[NSDictionary countByEnumeratingWithState:objects:count:](itemsByIdentifier, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
  v19 = MEMORY[0x1E0C809B0];
  if (v18)
  {
    v20 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v35 != v20)
          objc_enumerationMutation(itemsByIdentifier);
        objc_msgSend((id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_itemsByIdentifier, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j)), "control"), "removeObservers");
      }
      v18 = -[NSDictionary countByEnumeratingWithState:objects:count:](itemsByIdentifier, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
    }
    while (v18);
  }

  self->_itemsByIdentifier = (NSDictionary *)objc_msgSend(v10, "copy");
  self->_orderedIdentifiers = (NSArray *)objc_msgSend(v9, "copy");
  if (!self->_visible)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v22 = self->_itemsByIdentifier;
    v23 = -[NSDictionary countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v30, v47, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v31;
      do
      {
        for (k = 0; k != v23; ++k)
        {
          if (*(_QWORD *)v31 != v24)
            objc_enumerationMutation(v22);
          objc_msgSend((id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_itemsByIdentifier, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * k)), "control"), "overlayVisibilityDidChange:", 0);
        }
        v23 = -[NSDictionary countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v30, v47, 16);
      }
      while (v23);
    }
  }
  os_unfair_lock_unlock(lock);

  connectionQueue = self->_connectionQueue;
  block[0] = v19;
  block[1] = 3221225472;
  block[2] = __43__AVCaptureControlsOverlay_updateControls___block_invoke_2;
  block[3] = &unk_1E42165A8;
  block[4] = self;
  dispatch_async(connectionQueue, block);
LABEL_28:
  _Block_object_dispose(&v43, 8);
}

uint64_t __43__AVCaptureControlsOverlay_updateControls___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t result;
  char v11;

  v7 = (void *)objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
  v8 = objc_msgSend(a2, "isEqualToString:", objc_msgSend(v7, "identifier"));
  v9 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", a2), "overlayControl");
  result = objc_msgSend(v7, "overlayControl");
  v11 = v8 ^ 1;
  if (v9 != result)
    v11 = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v11;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  return result;
}

uint64_t __43__AVCaptureControlsOverlay_updateControls___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendControlsIsolated");
}

- (void)rebuildControls
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  AVCaptureControlsOverlayItem *v12;
  NSObject *connectionQueue;
  os_unfair_lock_t lock;
  AVCaptureControlsOverlay *v15;
  _QWORD block[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  os_unfair_lock_lock(&self->_controlsLock);
  v4 = (id)-[NSArray copy](self->_orderedIdentifiers, "copy");
  v15 = self;
  v5 = (id)-[NSDictionary copy](self->_itemsByIdentifier, "copy");
  lock = &self->_controlsLock;
  os_unfair_lock_unlock(&self->_controlsLock);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        v11 = (void *)objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", v10), "control");
        v12 = -[AVCaptureControlsOverlayItem initWithControl:overlayControl:]([AVCaptureControlsOverlayItem alloc], "initWithControl:overlayControl:", v11, objc_msgSend(v11, "overlayControl"));
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v10);

      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }
  os_unfair_lock_lock(lock);

  v15->_itemsByIdentifier = (NSDictionary *)objc_msgSend(v3, "copy");
  os_unfair_lock_unlock(lock);

  connectionQueue = v15->_connectionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__AVCaptureControlsOverlay_rebuildControls__block_invoke;
  block[3] = &unk_1E42165A8;
  block[4] = v15;
  dispatch_async(connectionQueue, block);
}

uint64_t __43__AVCaptureControlsOverlay_rebuildControls__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendControlsIsolated");
}

- (void)_sendControlsIsolated
{
  CAMOverlayServiceConnection *connection;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  _QWORD v24[6];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  connection = self->_connection;
  if (connection && -[CAMOverlayServiceConnection status](self->_connection, "status") == 1)
  {
    os_unfair_lock_lock(&self->_controlsLock);
    v4 = (id)-[NSArray copy](self->_orderedIdentifiers, "copy");
    v5 = (id)-[NSDictionary copy](self->_itemsByIdentifier, "copy");
    os_unfair_lock_unlock(&self->_controlsLock);
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v34;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v34 != v9)
            objc_enumerationMutation(v4);
          objc_msgSend(v6, "addObject:", objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v10++)), "overlayControl"));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v8);
    }
    v11 = (id)objc_msgSend(v6, "copy");
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v13 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v30;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v30 != v15)
            objc_enumerationMutation(v4);
          v17 = (void *)objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v16)), "control");
          if ((objc_msgSend(v17, "isEnabled") & 1) == 0)
          {
            v18 = objc_msgSend(v17, "enabledUpdate");
            if (v18)
              objc_msgSend(v12, "addObject:", v18);
          }
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v14);
    }
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v19 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, &v33, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v26;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v26 != v21)
            objc_enumerationMutation(v4);
          objc_msgSend(v12, "addObject:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v22++)), "control"), "overlayUpdate"));
        }
        while (v20 != v22);
        v20 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, &v33, 16);
      }
      while (v20);
    }
    v23 = (id)objc_msgSend(v12, "copy");
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __49__AVCaptureControlsOverlay__sendControlsIsolated__block_invoke;
    v24[3] = &unk_1E421D1E8;
    v24[4] = v11;
    v24[5] = self;
    -[CAMOverlayServiceConnection configureWithControls:initialUpdates:completion:](connection, "configureWithControls:initialUpdates:completion:", v11, v23, v24);
  }
}

uint64_t __49__AVCaptureControlsOverlay__sendControlsIsolated__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (!a2)
  {
    v2 = result;
    result = objc_msgSend(*(id *)(result + 32), "count");
    if (!result)
      return objc_msgSend(*(id *)(v2 + 40), "invalidate");
  }
  return result;
}

- (void)updateControl:(id)a3
{
  NSObject *connectionQueue;
  _QWORD v4[6];

  if (a3)
  {
    connectionQueue = self->_connectionQueue;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __42__AVCaptureControlsOverlay_updateControl___block_invoke;
    v4[3] = &unk_1E4216408;
    v4[4] = self;
    v4[5] = a3;
    dispatch_async(connectionQueue, v4);
  }
}

uint64_t __42__AVCaptureControlsOverlay_updateControl___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateControlIsolated:", *(_QWORD *)(a1 + 40));
}

- (void)_updateControlIsolated:(id)a3
{
  CAMOverlayServiceConnection *connection;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  connection = self->_connection;
  if (connection)
  {
    if (-[CAMOverlayServiceConnection status](connection, "status") == 1)
      -[CAMOverlayServiceConnection applyControlUpdate:completion:](connection, "applyControlUpdate:completion:", a3, &__block_literal_global_19);
  }
}

- (void)_invalidateIsolated
{
  -[CAMOverlayServiceConnection invalidate](self->_connection, "invalidate");

  self->_connection = 0;
}

- (void)_activateIsolated
{
  if (-[CAMOverlayServiceConnection status](self->_connection, "status") != 1)
  {
    -[AVCaptureControlsOverlay _invalidateIsolated](self, "_invalidateIsolated");
    self->_connection = (CAMOverlayServiceConnection *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D0D160], "sharedService"), "createConnectionWithClient:queue:", self, self->_connectionQueue);
    -[AVCaptureControlsOverlay _sendControlsIsolated](self, "_sendControlsIsolated");
  }
}

- (void)activate
{
  NSObject *connectionQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  connectionQueue = self->_connectionQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__AVCaptureControlsOverlay_activate__block_invoke;
  v4[3] = &unk_1E421D230;
  objc_copyWeak(&v5, &location);
  dispatch_async(connectionQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __36__AVCaptureControlsOverlay_activate__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_activateIsolated");

}

- (void)invalidate
{
  NSObject *connectionQueue;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__AVCaptureControlsOverlay_invalidate__block_invoke;
  block[3] = &unk_1E421D258;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(connectionQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __38__AVCaptureControlsOverlay_invalidate__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_invalidateIsolated");

}

- (void)cameraOverlayConnection:(id)a3 didChangeStatus:(unint64_t)a4
{
  uint64_t v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  if (self->_connection == a3)
  {
    v6 = objc_msgSend(a3, "status");
    if (v6 == 1)
    {
      -[AVCaptureControlsOverlay _sendControlsIsolated](self, "_sendControlsIsolated");
    }
    else if (v6 == 2)
    {
      objc_msgSend((id)-[AVWeakReference referencedObject](self->_sessionReference, "referencedObject"), "handleControlsOverlayInvalidated:", self);
    }
  }
}

- (void)cameraOverlayConnection:(id)a3 didChangeOverlayVisible:(BOOL)a4
{
  -[AVCaptureControlsOverlay cameraOverlayConnection:didChangeOverlayVisible:activeControlIdentifier:](self, "cameraOverlayConnection:didChangeOverlayVisible:activeControlIdentifier:", a3, a4, 0);
}

- (void)cameraOverlayConnection:(id)a3 didChangeOverlayVisible:(BOOL)a4 activeControlIdentifier:(id)a5
{
  _BOOL8 v6;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v6 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  os_unfair_lock_lock(&self->_controlsLock);
  self->_visible = v6;
  v8 = (id)-[NSDictionary copy](self->_itemsByIdentifier, "copy");
  os_unfair_lock_unlock(&self->_controlsLock);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12++)), "control"), "overlayVisibilityDidChange:", v6);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }
  if (a5)
    a5 = (id)objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", a5), "control");
  v13 = (void *)-[AVWeakReference referencedObject](self->_sessionReference, "referencedObject");
  if (v13)
    objc_msgSend(v13, "handleControlsOverlay:didChangeVisibility:activeControl:", self, v6, a5);
}

- (void)cameraOverlayConnection:(id)a3 didChangeActiveControlIdentifier:(id)a4
{
  uint64_t v6;
  void *v7;
  id v8;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  v6 = -[AVWeakReference referencedObject](self->_sessionReference, "referencedObject");
  if (v6)
  {
    v7 = (void *)v6;
    os_unfair_lock_lock(&self->_controlsLock);
    v8 = (id)-[NSDictionary copy](self->_itemsByIdentifier, "copy");
    os_unfair_lock_unlock(&self->_controlsLock);
    objc_msgSend(v7, "handleControlsOverlay:didChangeActiveControl:", self, objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", a4), "control"));
  }
}

- (void)cameraOverlayConnection:(id)a3 didChangeInterfaceReduced:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;

  v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  v6 = (void *)-[AVWeakReference referencedObject](self->_sessionReference, "referencedObject");
  if (v6)
    objc_msgSend(v6, "handleControlsOverlay:didChangeInterfaceReduced:", self, v4);
}

- (void)cameraOverlayConnection:(id)a3 didApplyControlUpdate:(id)a4
{
  os_unfair_lock_s *p_controlsLock;
  id v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  p_controlsLock = &self->_controlsLock;
  os_unfair_lock_lock(&self->_controlsLock);
  v7 = -[NSDictionary objectForKeyedSubscript:](self->_itemsByIdentifier, "objectForKeyedSubscript:", objc_msgSend(a4, "controlIdentifier"));
  os_unfair_lock_unlock(p_controlsLock);
  objc_msgSend((id)objc_msgSend(v7, "control"), "enqueueActionWithUpdate:", a4);
}

@end
