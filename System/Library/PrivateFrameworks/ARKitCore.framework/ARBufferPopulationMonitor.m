@implementation ARBufferPopulationMonitor

- (ARBufferPopulationMonitor)init
{
  return -[ARBufferPopulationMonitor initWithDelegate:](self, "initWithDelegate:", 0);
}

- (ARBufferPopulationMonitor)initWithDelegate:(id)a3
{
  id v4;
  ARBufferPopulationMonitor *v5;
  ARBufferPopulationMonitor *v6;
  uint64_t v7;
  OS_dispatch_queue *delegateQueue;
  uint64_t v9;
  ARBufferPopulationRegistry *bufferPopulationRegistry;
  uint64_t v11;
  OS_dispatch_queue *surfaceNotifierCallbackQueue;
  ARBufferPopulationMonitor *v13;
  objc_super v15;

  v4 = a3;
  if (+[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.bufferPopulationMonitor")))
  {
    v15.receiver = self;
    v15.super_class = (Class)ARBufferPopulationMonitor;
    v5 = -[ARBufferPopulationMonitor init](&v15, sel_init);
    v6 = v5;
    if (v5)
    {
      objc_storeWeak((id *)&v5->_delegate, v4);
      ARCreateNonFixedPriorityDispatchQueue("com.apple.arkit.bufferPopulationMonitor.delegateQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      delegateQueue = v6->_delegateQueue;
      v6->_delegateQueue = (OS_dispatch_queue *)v7;

      +[ARWeakReference weakReferenceWithObject:](ARWeakReference, "weakReferenceWithObject:", v6);
      v6->_weakReferenceForSurfaceNotifierCallback = (void *)objc_claimAutoreleasedReturnValue();
      v6->_bufferPopulationRegistryLock._os_unfair_lock_opaque = 0;
      v9 = objc_opt_new();
      bufferPopulationRegistry = v6->_bufferPopulationRegistry;
      v6->_bufferPopulationRegistry = (ARBufferPopulationRegistry *)v9;

      v6->_surfaceNotifier = (__IOSurfaceNotifier *)IOSurfaceNotifierCreate();
      ARCreateNonFixedPriorityDispatchQueue("com.apple.arkit.bufferPopulationMonitor.surfaceNotifierCallbackQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      surfaceNotifierCallbackQueue = v6->_surfaceNotifierCallbackQueue;
      v6->_surfaceNotifierCallbackQueue = (OS_dispatch_queue *)v11;

      IOSurfaceNotifierSetDispatchQueue();
    }
    self = v6;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)dealloc
{
  NSObject *surfaceNotifierCallbackQueue;
  objc_super v4;
  _QWORD block[5];
  _QWORD v6[5];
  id weakReferenceForSurfaceNotifierCallback;

  if (self->_surfaceNotifier)
  {
    IOSurfaceNotifierSetDispatchQueue();
    CFRelease(self->_surfaceNotifier);
  }
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__5;
  v6[4] = __Block_byref_object_dispose__5;
  weakReferenceForSurfaceNotifierCallback = self->_weakReferenceForSurfaceNotifierCallback;
  if (weakReferenceForSurfaceNotifierCallback)
  {
    surfaceNotifierCallbackQueue = self->_surfaceNotifierCallbackQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__ARBufferPopulationMonitor_dealloc__block_invoke;
    block[3] = &unk_1E6672490;
    block[4] = v6;
    dispatch_async(surfaceNotifierCallbackQueue, block);
  }
  _Block_object_dispose(v6, 8);

  v4.receiver = self;
  v4.super_class = (Class)ARBufferPopulationMonitor;
  -[ARBufferPopulationMonitor dealloc](&v4, sel_dealloc);
}

void __36__ARBufferPopulationMonitor_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

- (unint64_t)count
{
  os_unfair_lock_s *p_bufferPopulationRegistryLock;
  unint64_t v4;

  p_bufferPopulationRegistryLock = &self->_bufferPopulationRegistryLock;
  os_unfair_lock_lock(&self->_bufferPopulationRegistryLock);
  v4 = -[ARBufferPopulationRegistry count](self->_bufferPopulationRegistry, "count");
  os_unfair_lock_unlock(p_bufferPopulationRegistryLock);
  return v4;
}

- (unint64_t)countWithLabel:(id)a3
{
  id v4;
  os_unfair_lock_s *p_bufferPopulationRegistryLock;
  unint64_t v6;

  v4 = a3;
  p_bufferPopulationRegistryLock = &self->_bufferPopulationRegistryLock;
  os_unfair_lock_lock(&self->_bufferPopulationRegistryLock);
  v6 = -[ARBufferPopulationRegistry countWithLabel:](self->_bufferPopulationRegistry, "countWithLabel:", v4);
  os_unfair_lock_unlock(p_bufferPopulationRegistryLock);

  return v6;
}

- (id)description
{
  os_unfair_lock_s *p_bufferPopulationRegistryLock;
  void *v4;

  p_bufferPopulationRegistryLock = &self->_bufferPopulationRegistryLock;
  os_unfair_lock_lock(&self->_bufferPopulationRegistryLock);
  -[ARBufferPopulationRegistry description](self->_bufferPopulationRegistry, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_bufferPopulationRegistryLock);
  return v4;
}

- (void)trackDataBuffer:(__CVBuffer *)a3
{
  -[ARBufferPopulationMonitor trackDataBuffer:withLabel:timestamp:signpostType:](self, "trackDataBuffer:withLabel:timestamp:signpostType:", a3, CFSTR("Unlabled"), 0, 0.0);
}

- (void)trackDataBuffer:(__CVBuffer *)a3 withLabel:(id)a4 timestamp:(double)a5 signpostType:(int)a6
{
  uint64_t v6;
  id v9;

  v6 = *(_QWORD *)&a6;
  v9 = a4;
  -[ARBufferPopulationMonitor trackSurface:withLabel:timestamp:signpostType:](self, "trackSurface:withLabel:timestamp:signpostType:", CVDataBufferGetIOSurface(), v9, v6, a5);

}

- (void)trackPixelBuffer:(__CVBuffer *)a3
{
  -[ARBufferPopulationMonitor trackPixelBuffer:withLabel:timestamp:signpostType:](self, "trackPixelBuffer:withLabel:timestamp:signpostType:", a3, CFSTR("Unlabled"), 0, 0.0);
}

- (void)trackPixelBuffer:(__CVBuffer *)a3 withLabel:(id)a4 timestamp:(double)a5 signpostType:(int)a6
{
  uint64_t v6;
  id v10;

  v6 = *(_QWORD *)&a6;
  v10 = a4;
  -[ARBufferPopulationMonitor trackSurface:withLabel:timestamp:signpostType:](self, "trackSurface:withLabel:timestamp:signpostType:", CVPixelBufferGetIOSurface(a3), v10, v6, a5);

}

- (void)trackSurface:(__IOSurface *)a3
{
  -[ARBufferPopulationMonitor trackSurface:withLabel:timestamp:signpostType:](self, "trackSurface:withLabel:timestamp:signpostType:", a3, CFSTR("Unlabled"), 0, 0.0);
}

- (void)emitStartSignpost:(int)a3 surfaceID:(unint64_t)a4 count:(unint64_t)a5 timestamp:(double)a6
{
  if (a3 <= 4)
    kdebug_trace();
}

- (void)emitEndSignpost:(int)a3 surfaceID:(unint64_t)a4 count:(unint64_t)a5 timestamp:(double)a6
{
  if (a3 <= 4)
    kdebug_trace();
}

- (void)trackSurface:(__IOSurface *)a3 withLabel:(id)a4 timestamp:(double)a5 signpostType:(int)a6
{
  uint64_t v6;
  id v10;
  uint64_t ID;
  ARBufferPopulationRegistry *bufferPopulationRegistry;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *delegateQueue;
  id v18;
  _QWORD block[5];
  id v20;
  uint64_t v21;

  v6 = *(_QWORD *)&a6;
  v10 = a4;
  ID = IOSurfaceGetID(a3);
  os_unfair_lock_lock(&self->_bufferPopulationRegistryLock);
  bufferPopulationRegistry = self->_bufferPopulationRegistry;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", ID);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARBufferPopulationRegistry registerBufferWithSurfaceID:label:signpostType:timestamp:](bufferPopulationRegistry, "registerBufferWithSurfaceID:label:signpostType:timestamp:", v13, v10, v14, a5);

  -[ARBufferPopulationRegistry surfaceIDsForBuffersWithLabel:](self->_bufferPopulationRegistry, "surfaceIDsForBuffersWithLabel:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  -[ARBufferPopulationMonitor emitStartSignpost:surfaceID:count:timestamp:](self, "emitStartSignpost:surfaceID:count:timestamp:", v6, ID, v16, a5);
  os_unfair_lock_unlock(&self->_bufferPopulationRegistryLock);
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__ARBufferPopulationMonitor_trackSurface_withLabel_timestamp_signpostType___block_invoke;
  block[3] = &unk_1E6674800;
  v20 = v10;
  v21 = v16;
  block[4] = self;
  v18 = v10;
  dispatch_async(delegateQueue, block);

}

void __75__ARBufferPopulationMonitor_trackSurface_withLabel_timestamp_signpostType___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bufferPopulationMonitor:didIncrementCount:withLabel:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)updateBufferPopulationRegistryWithReleasedSurfaceID:(unsigned int)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  unint64_t v10;
  NSObject *delegateQueue;
  _QWORD block[5];
  id v13;
  unint64_t v14;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_bufferPopulationRegistryLock);
  -[ARBufferPopulationRegistry labelForBufferWithSurfaceID:](self->_bufferPopulationRegistry, "labelForBufferWithSurfaceID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ARBufferPopulationRegistry signpostTypeForLabel:](self->_bufferPopulationRegistry, "signpostTypeForLabel:", v6);
  -[ARBufferPopulationRegistry timestampForSurfaceID:](self->_bufferPopulationRegistry, "timestampForSurfaceID:", v5);
  v9 = v8;
  -[ARBufferPopulationRegistry unregisterBufferWithSurfaceID:](self->_bufferPopulationRegistry, "unregisterBufferWithSurfaceID:", v5);
  v10 = -[ARBufferPopulationRegistry countWithLabel:](self->_bufferPopulationRegistry, "countWithLabel:", v6);
  -[ARBufferPopulationMonitor emitEndSignpost:surfaceID:count:timestamp:](self, "emitEndSignpost:surfaceID:count:timestamp:", v7, a3, v10, v9);
  os_unfair_lock_unlock(&self->_bufferPopulationRegistryLock);
  if (v6)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__ARBufferPopulationMonitor_updateBufferPopulationRegistryWithReleasedSurfaceID___block_invoke;
    block[3] = &unk_1E6674800;
    block[4] = self;
    v14 = v10;
    v13 = v6;
    dispatch_async(delegateQueue, block);

  }
}

void __81__ARBufferPopulationMonitor_updateBufferPopulationRegistryWithReleasedSurfaceID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bufferPopulationMonitor:didDecrementCount:withLabel:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (ARBufferPopulationMonitorDelegate)delegate
{
  return (ARBufferPopulationMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_surfaceNotifierCallbackQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_bufferPopulationRegistry, 0);
}

@end
