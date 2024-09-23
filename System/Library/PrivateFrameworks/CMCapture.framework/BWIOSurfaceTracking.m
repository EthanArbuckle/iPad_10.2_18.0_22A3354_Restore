@implementation BWIOSurfaceTracking

+ (void)initialize
{
  objc_opt_class();
}

+ (void)trackPixelBuffer:(__CVBuffer *)a3 surfaceUseCountIsZeroHandler:(id)a4
{
  uint64_t v6;

  if (a4)
  {
    if (CVPixelBufferGetIOSurface(a3))
    {
      v6 = +[BWIOSurfaceTracking defaultSurfaceTracking]();
      -[BWIOSurfaceTracking trackPixelBuffer:surfaceUseCountIsZeroHandler:](v6, a3, (uint64_t)a4);
    }
    else
    {
      (*((void (**)(id))a4 + 2))(a4);
    }
  }
}

+ (uint64_t)defaultSurfaceTracking
{
  objc_opt_self();
  if (defaultSurfaceTracking_sOnceToken != -1)
    dispatch_once(&defaultSurfaceTracking_sOnceToken, &__block_literal_global_57);
  return defaultSurfaceTracking_sDefaultSurfaceTracking;
}

- (void)trackPixelBuffer:(uint64_t)a3 surfaceUseCountIsZeroHandler:
{
  IOSurfaceRef IOSurface;
  BWTrackedSurface *v7;
  _QWORD v8[8];

  if (a1)
  {
    IOSurface = CVPixelBufferGetIOSurface(pixelBuffer);
    v7 = -[BWTrackedSurface initWithSurface:handler:]([BWTrackedSurface alloc], "initWithSurface:handler:", IOSurface, a3);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    objc_msgSend(*(id *)(a1 + 16), "addObject:", v7);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __69__BWIOSurfaceTracking_trackPixelBuffer_surfaceUseCountIsZeroHandler___block_invoke;
    v8[3] = &unk_1E49273B0;
    v8[4] = a1;
    v8[5] = v7;
    v8[6] = a3;
    v8[7] = IOSurface;
    +[BWObjectLifetimeTracker trackAttachmentBearer:deallocHandler:](BWObjectLifetimeTracker, "trackAttachmentBearer:deallocHandler:", pixelBuffer, v8);

  }
}

+ (void)noteSurfaceIDInUse:(unsigned int)a3 byClient:(id)a4
{
  uint64_t v5;

  v5 = +[BWIOSurfaceTracking defaultSurfaceTracking]();
  -[BWIOSurfaceTracking noteSurfaceIDInUse:](v5, a3);
}

- (void)noteSurfaceIDInUse:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = *(void **)(a1 + 16);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          if (IOSurfaceGetID((IOSurfaceRef)objc_msgSend(v10, "surface")) == a2)
            objc_msgSend(v10, "setClientUseCount:", objc_msgSend(v10, "clientUseCount") + 1);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }
    os_unfair_lock_unlock(v4);
  }
}

+ (void)noteSurfaceIDNoLongerInUse:(unsigned int)a3 byClient:(id)a4
{
  os_unfair_lock_s *v5;

  v5 = (os_unfair_lock_s *)+[BWIOSurfaceTracking defaultSurfaceTracking]();
  -[BWIOSurfaceTracking noteSurfaceIDNoLongerInUse:](v5, a3);
}

- (os_unfair_lock_s)noteSurfaceIDNoLongerInUse:(os_unfair_lock_s *)result
{
  os_unfair_lock_s *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  os_unfair_lock_s *v13;
  uint64_t v14;
  os_unfair_lock_s *v15;
  void *v16;
  os_unfair_lock_s *lock;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    lock = result + 2;
    os_unfair_lock_lock(result + 2);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v4 = *(void **)&v3[4]._os_unfair_lock_opaque;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = 0;
      v9 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v4);
          v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (IOSurfaceGetID((IOSurfaceRef)objc_msgSend(v11, "surface")) == a2)
          {
            objc_msgSend(v11, "setClientUseCount:", objc_msgSend(v11, "clientUseCount") - 1);
            if (objc_msgSend(v11, "owningPixelBufferDeallocated")
              && !objc_msgSend(v11, "clientUseCount"))
            {
              if (!v7)
                v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
              objc_msgSend(v7, "addIndex:", v8 + i);
            }
            if (!objc_msgSend(v11, "clientUseCount"))
              objc_msgSend(v11, "owningPixelBufferDeallocated");
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        v8 += i;
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }
    if (objc_msgSend(v7, "count"))
    {
      v12 = (void *)objc_msgSend(*(id *)&v3[4]._os_unfair_lock_opaque, "objectsAtIndexes:", v7);
      objc_msgSend(*(id *)&v3[4]._os_unfair_lock_opaque, "removeObjectsAtIndexes:", v7);
    }
    else
    {
      v12 = 0;
    }
    os_unfair_lock_unlock(lock);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    result = (os_unfair_lock_s *)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (result)
    {
      v13 = result;
      v14 = *(_QWORD *)v19;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v15);
          if (IOSurfaceIsInUse((IOSurfaceRef)objc_msgSend(v16, "surface")))
            +[BWIOSurfacePoller trackSurface:useCountIsZeroHandler:](BWIOSurfacePoller, "trackSurface:useCountIsZeroHandler:", objc_msgSend(v16, "surface"), objc_msgSend(v16, "handler"));
          else
            (*(void (**)(void))(objc_msgSend(v16, "handler") + 16))();
          v15 = (os_unfair_lock_s *)((char *)v15 + 1);
        }
        while (v13 != v15);
        result = (os_unfair_lock_s *)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        v13 = result;
      }
      while (result);
    }
  }
  return result;
}

BWIOSurfaceTracking *__45__BWIOSurfaceTracking_defaultSurfaceTracking__block_invoke()
{
  BWIOSurfaceTracking *result;

  result = objc_alloc_init(BWIOSurfaceTracking);
  defaultSurfaceTracking_sDefaultSurfaceTracking = (uint64_t)result;
  return result;
}

- (BWIOSurfaceTracking)init
{
  BWIOSurfaceTracking *v2;
  BWIOSurfaceTracking *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWIOSurfaceTracking;
  v2 = -[BWIOSurfaceTracking init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_trackedSurfacesLock._os_unfair_lock_opaque = 0;
    v2->_trackedSurfaces = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWIOSurfaceTracking;
  -[BWIOSurfaceTracking dealloc](&v3, sel_dealloc);
}

void __69__BWIOSurfaceTracking_trackPixelBuffer_surfaceUseCountIsZeroHandler___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t v4;
  BOOL v5;
  int v6;

  v2 = IOSurfaceIsInUse(*(IOSurfaceRef *)(a1 + 56));
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(*(id *)(a1 + 40), "setOwningPixelBufferDeallocated:", 1);
  v3 = objc_msgSend(*(id *)(a1 + 40), "clientUseCount");
  v4 = *(_QWORD *)(a1 + 32);
  if (v2)
    v5 = v3 < 1;
  else
    v5 = 1;
  if (v5)
  {
    v6 = v3;
    objc_msgSend(*(id *)(v4 + 16), "removeObjectIdenticalTo:", *(_QWORD *)(a1 + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    if (v2)
    {
      if (v6 <= 0)
        +[BWIOSurfacePoller trackSurface:useCountIsZeroHandler:](BWIOSurfacePoller, "trackSurface:useCountIsZeroHandler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 8));
  }
}

@end
