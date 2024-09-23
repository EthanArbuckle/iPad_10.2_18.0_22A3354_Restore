@implementation BCULayerRenderer

- (void)resume
{
  NSObject *v3;
  uint8_t v4[16];

  os_unfair_lock_lock((os_unfair_lock_t)&unk_2540D97B8);
  if (self->_suspended)
  {
    self->_suspended = 0;
    sub_22857BEAC();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_22857A000, v3, OS_LOG_TYPE_DEFAULT, "resuming renderQueue", v4, 2u);
    }

    dispatch_resume((dispatch_object_t)self->_renderQueue);
    -[BCULayerRenderer _processOperations](self, "_processOperations");
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2540D97B8);
}

- (BCULayerRenderer)initWithSuspended:(BOOL)a3
{
  _BOOL4 v3;
  id v4;
  NSObject *v5;
  dispatch_queue_t v6;
  void *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  void *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_super v17;

  v3 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BCULayerRenderer;
  v4 = -[BCULayerRenderer init](&v17, sel_init);
  if (v4)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("BCULayerRenderer.accessQueue", v5);
    v7 = (void *)*((_QWORD *)v4 + 1);
    *((_QWORD *)v4 + 1) = v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("BCULayerRenderer.renderQueue", v8);
    v10 = (void *)*((_QWORD *)v4 + 2);
    *((_QWORD *)v4 + 2) = v9;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("BCULayerRenderer.completionQueue", v11);
    v13 = (void *)*((_QWORD *)v4 + 3);
    *((_QWORD *)v4 + 3) = v12;

    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 517);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)*((_QWORD *)v4 + 4);
    *((_QWORD *)v4 + 4) = v14;

    if (v3)
    {
      *((_BYTE *)v4 + 64) = 1;
      dispatch_suspend(*((dispatch_object_t *)v4 + 2));
    }
  }
  return (BCULayerRenderer *)v4;
}

- (void)_processOperations
{
  NSObject *renderQueue;
  _QWORD block[5];

  renderQueue = self->_renderQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_22857C0AC;
  block[3] = &unk_24F113D98;
  block[4] = self;
  dispatch_async(renderQueue, block);
}

- (BCULayerRenderer)init
{
  return (BCULayerRenderer *)MEMORY[0x24BEDD108](self, sel_initWithSuspended_);
}

- (void)suspend
{
  NSObject *v3;
  uint8_t v4[16];

  os_unfair_lock_lock((os_unfair_lock_t)&unk_2540D97B8);
  if (!self->_suspended)
  {
    sub_22857BEAC();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_22857A000, v3, OS_LOG_TYPE_DEFAULT, "suspending renderQueue", v4, 2u);
    }

    self->_suspended = 1;
    dispatch_suspend((dispatch_object_t)self->_renderQueue);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2540D97B8);
}

- (id)newOperationWithPriority:(float)a3 waitForCPUSynchronization:(BOOL)a4 logKey:(id)a5 renderLayer:(id)a6 completion:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  _BCULayerRendererOperation *v15;
  double v16;
  _BCULayerRendererOperation *v17;

  v9 = a4;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = [_BCULayerRendererOperation alloc];
  *(float *)&v16 = a3;
  v17 = -[_BCULayerRendererOperation initWithRenderer:priority:waitForCPUSynchronization:logKey:layerBlock:completion:](v15, "initWithRenderer:priority:waitForCPUSynchronization:logKey:layerBlock:completion:", self, v9, v14, v13, v12, v16);

  return v17;
}

- (id)newOperationWithPriority:(float)a3 renderLayer:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  _BCULayerRendererOperation *v10;
  double v11;
  _BCULayerRendererOperation *v12;

  v8 = a5;
  v9 = a4;
  v10 = [_BCULayerRendererOperation alloc];
  *(float *)&v11 = a3;
  v12 = -[_BCULayerRendererOperation initWithRenderer:priority:waitForCPUSynchronization:logKey:layerBlock:completion:](v10, "initWithRenderer:priority:waitForCPUSynchronization:logKey:layerBlock:completion:", self, 0, 0, v9, v8, v11);

  return v12;
}

- (void)_startOperation:(id)a3
{
  id v4;
  void *v5;
  NSObject *accessQueue;
  _QWORD block[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_22857F984;
    block[3] = &unk_24F113CF8;
    block[4] = self;
    v9 = &v10;
    v8 = v4;
    dispatch_sync(accessQueue, block);
    if (*((_BYTE *)v11 + 24))
      -[BCULayerRenderer _processOperations](self, "_processOperations");

    _Block_object_dispose(&v10, 8);
  }

}

- (void)_disconnectLayer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v4, "sublayers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
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
        -[BCULayerRenderer _disconnectLayer:](self, "_disconnectLayer:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "setSublayers:", 0);
  objc_msgSend(v4, "setMask:", 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_operations, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_renderQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
