@implementation PDFTilePool

+ (id)sharedPool
{
  if (sharedPool_onceToken != -1)
    dispatch_once(&sharedPool_onceToken, &__block_literal_global_6);
  return (id)sharedPool_singleton;
}

void __25__PDFTilePool_sharedPool__block_invoke()
{
  PDFTilePool *v0;
  void *v1;

  v0 = objc_alloc_init(PDFTilePool);
  v1 = (void *)sharedPool_singleton;
  sharedPool_singleton = (uint64_t)v0;

}

- (PDFTilePool)init
{
  PDFTilePool *v2;
  PDFTilePoolPrivate *v3;
  PDFTilePoolPrivate *v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  dispatch_queue_t v8;
  PDFTilePoolPrivate *v9;
  OS_dispatch_queue *workQueue;
  dispatch_semaphore_t v11;
  PDFTilePoolPrivate *v12;
  OS_dispatch_semaphore *workQueueThrottle;
  NSMutableDictionary *v14;
  PDFTilePoolPrivate *v15;
  NSMutableDictionary *surfaces;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PDFTilePool;
  v2 = -[PDFTilePool init](&v18, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PDFTilePoolPrivate);
    v4 = v2->_private;
    v2->_private = v3;

    if (GetUseWhippet())
    {
      v5 = 0;
      v2->_private->surfaceType = 2;
    }
    else
    {
      v2->_private->surfaceType = GetUseIOSurfaceForTiles();
      v5 = MEMORY[0x24BDAC9C0];
      v6 = MEMORY[0x24BDAC9C0];
    }
    dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_USER_INITIATED, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("PDFKit.PDFTilePool.workQueue", v7);
    v9 = v2->_private;
    workQueue = v9->workQueue;
    v9->workQueue = (OS_dispatch_queue *)v8;

    v11 = dispatch_semaphore_create(4);
    v12 = v2->_private;
    workQueueThrottle = v12->workQueueThrottle;
    v12->workQueueThrottle = (OS_dispatch_semaphore *)v11;

    v2->_private->surfacesLock._os_unfair_lock_opaque = 0;
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v15 = v2->_private;
    surfaces = v15->surfaces;
    v15->surfaces = v14;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  os_unfair_lock_lock(&self->_private->surfacesLock);
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_private->surfaces, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_44_0);
  -[NSMutableDictionary removeAllObjects](self->_private->surfaces, "removeAllObjects");
  os_unfair_lock_unlock(&self->_private->surfacesLock);
  v3.receiver = self;
  v3.super_class = (Class)PDFTilePool;
  -[PDFTilePool dealloc](&v3, sel_dealloc);
}

uint64_t __22__PDFTilePool_dealloc__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "releaseSurface");
}

- (int)tileSurfaceSize
{
  return 1024;
}

- (void)setTileSurfaceType:(int)a3
{
  self->_private->surfaceType = a3;
}

- (int)tileSurfaceType
{
  return self->_private->surfaceType;
}

- (void)requestPDFTileSurfaceForTarget:(id)a3 forPage:(id)a4 withRenderingProperties:(id)a5 atZoomFactor:(double)a6 frame:(CGRect)a7 transform:(CGAffineTransform *)a8 tag:(int)a9
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  PDFRenderingProperties *v19;
  id v20;
  id v21;
  TileRenderRequest *v22;
  PDFRenderingProperties *renderingProperties;
  PDFRenderingProperties *v24;
  __int128 v25;
  __int128 v26;
  NSObject *workQueue;
  TileRenderRequest *v28;
  _QWORD v29[6];
  _QWORD v30[5];
  TileRenderRequest *v31;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v19 = (PDFRenderingProperties *)a5;
  v20 = a4;
  v21 = a3;
  v22 = objc_alloc_init(TileRenderRequest);
  objc_storeWeak((id *)&v22->target, v21);

  objc_storeWeak((id *)&v22->page, v20);
  renderingProperties = v22->renderingProperties;
  v22->renderingProperties = v19;
  v24 = v19;

  v22->tileFrame.origin.x = x;
  v22->tileFrame.origin.y = y;
  v22->tileFrame.size.width = width;
  v22->tileFrame.size.height = height;
  v22->zoomFactor = a6;
  v26 = *(_OWORD *)&a8->c;
  v25 = *(_OWORD *)&a8->tx;
  *(_OWORD *)&v22->matrix.a = *(_OWORD *)&a8->a;
  *(_OWORD *)&v22->matrix.c = v26;
  *(_OWORD *)&v22->matrix.tx = v25;
  v22->tag = a9;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__1;
  v30[4] = __Block_byref_object_dispose__1;
  v31 = v22;
  workQueue = self->_private->workQueue;
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __111__PDFTilePool_requestPDFTileSurfaceForTarget_forPage_withRenderingProperties_atZoomFactor_frame_transform_tag___block_invoke;
  v29[3] = &unk_24C25CFD0;
  v29[4] = self;
  v29[5] = v30;
  v28 = v22;
  dispatch_async(workQueue, v29);
  _Block_object_dispose(v30, 8);

}

void __111__PDFTilePool_requestPDFTileSurfaceForTarget_forPage_withRenderingProperties_atZoomFactor_frame_transform_tag___block_invoke(uint64_t a1)
{
  NSObject *dsema;

  dsema = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16);
  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(*(id *)(a1 + 32), "_renderTileForRequest:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  dispatch_semaphore_signal(dsema);

}

- (id)_createTileSurfaceForRequest:(id)a3
{
  id *v4;
  PDFTileSurface *v5;
  PDFTileSurface *v6;
  unsigned int v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  int type;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  const __CFDictionary *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[6];

  v29[5] = *MEMORY[0x24BDAC8D0];
  v4 = (id *)a3;
  v5 = objc_alloc_init(PDFTileSurface);
  v6 = v5;
  do
    v7 = __ldaxr((unsigned int *)&gPDFTileSurfaceCount);
  while (__stlxr(v7 + 1, (unsigned int *)&gPDFTileSurfaceCount));
  v5->tileId = v7;
  WeakRetained = objc_loadWeakRetained(v4 + 2);

  objc_msgSend(WeakRetained, "document");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v6->pageNumber = objc_msgSend(v9, "indexForPage:", WeakRetained);

  v6->type = -[PDFTilePool tileSurfaceType](self, "tileSurfaceType");
  v10 = -[PDFTilePool tileSurfaceSize](self, "tileSurfaceSize");
  v6->tileSize = v10;
  type = v6->type;
  if (type == 2)
  {
    v26[0] = *MEMORY[0x24BDD8FD0];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v12;
    v26[1] = *MEMORY[0x24BDD8EB0];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v13;
    v26[2] = *MEMORY[0x24BDD8EF8];
    v14 = (void *)MEMORY[0x24BDD16E0];
    if (MGGetBoolAnswer())
      v15 = 1999843442;
    else
      v15 = 1111970369;
    objc_msgSend(v14, "numberWithInt:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x24BDD8E30];
    v27[2] = v16;
    v27[3] = &unk_24C27D760;
    v18 = *MEMORY[0x24BDD8EF0];
    v26[3] = v17;
    v26[4] = v18;
    v27[4] = &unk_24C27D748;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 5);
    v19 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (type == 1)
  {
    v28[0] = *MEMORY[0x24BDD8FD0];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v12;
    v28[1] = *MEMORY[0x24BDD8EB0];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v13;
    v28[2] = *MEMORY[0x24BDD8EF8];
    v20 = (void *)MEMORY[0x24BDD16E0];
    if (MGGetBoolAnswer())
      v21 = 1380411457;
    else
      v21 = 1380401729;
    objc_msgSend(v20, "numberWithInt:", v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29[2] = v16;
    v28[3] = *MEMORY[0x24BDD8E30];
    v22 = (void *)MEMORY[0x24BDD16E0];
    if (MGGetBoolAnswer())
      v23 = 8;
    else
      v23 = 4;
    objc_msgSend(v22, "numberWithInt:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28[4] = *MEMORY[0x24BDD8EF0];
    v29[3] = v24;
    v29[4] = &unk_24C27D748;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 5);
    v19 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

LABEL_18:
LABEL_20:
    v6->ioSurfaceRef = IOSurfaceCreate(v19);

    goto LABEL_21;
  }
  if (type)
  {
    v19 = 0;
    goto LABEL_20;
  }
  v6->cgImageRef = 0;
LABEL_21:

  return v6;
}

- (CGContext)_createContextForTileSurface:(id)a3 ofRequest:(id)a4
{
  id v5;
  int v6;
  CGColorSpaceRef DeviceRGB;
  CGColorSpace *v8;
  int v9;
  void *BaseAddress;
  int v11;
  size_t v12;
  size_t v13;
  void *v14;
  size_t v15;
  size_t v16;
  CGColorSpace *v17;
  uint32_t v18;
  CGContext *v19;
  uint64_t v20;

  v5 = a3;
  v6 = -[PDFTilePool tileSurfaceSize](self, "tileSurfaceSize");
  if (MGGetBoolAnswer() && *((_DWORD *)v5 + 5) == 2)
    DeviceRGB = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF278]);
  else
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v8 = DeviceRGB;
  v9 = *((_DWORD *)v5 + 5);
  switch(v9)
  {
    case 0:
      v8 = CGColorSpaceCreateDeviceRGB();
      v12 = v6;
      v14 = 0;
      v15 = v6;
      v16 = 8;
      v13 = 0;
      goto LABEL_17;
    case 2:
      if (MGGetBoolAnswer())
      {
        if (getIOSurfaceContextOptions_onceToken != -1)
          dispatch_once(&getIOSurfaceContextOptions_onceToken, &__block_literal_global_95);
      }
      else if (getIOSurfaceContextOptions_onceToken != -1)
      {
        dispatch_once(&getIOSurfaceContextOptions_onceToken, &__block_literal_global_95);
      }
      v20 = CGIOSurfaceContextCreateWithOptions();
      goto LABEL_22;
    case 1:
      IOSurfaceLock(*((IOSurfaceRef *)v5 + 3), 0, 0);
      BaseAddress = IOSurfaceGetBaseAddress(*((IOSurfaceRef *)v5 + 3));
      v11 = MGGetBoolAnswer();
      v12 = v6;
      if (v11)
      {
        v13 = 8 * v6;
        v14 = BaseAddress;
        v15 = v6;
        v16 = 16;
        v17 = v8;
        v18 = 4353;
LABEL_18:
        v20 = (uint64_t)CGBitmapContextCreate(v14, v12, v15, v16, v13, v17, v18);
LABEL_22:
        v19 = (CGContext *)v20;
        goto LABEL_23;
      }
      v13 = 4 * v6;
      v14 = BaseAddress;
      v15 = v6;
      v16 = 8;
LABEL_17:
      v17 = v8;
      v18 = 1;
      goto LABEL_18;
  }
  v19 = 0;
LABEL_23:
  CGColorSpaceRelease(v8);

  return v19;
}

- (void)_renderTileForRequest:(id)a3
{
  id *v4;
  id WeakRetained;
  id v6;
  void *v7;
  double MachSeconds;
  uint64_t v9;
  NSMutableDictionary *surfaces;
  void *v11;
  CGContext *v12;
  _BOOL8 v13;
  _BOOL8 v14;
  int v15;
  id v16;
  void (**v17)(_QWORD, _QWORD);
  float v18;
  void *v19;
  uint64_t v20;
  void *v21;
  double v22;
  unint64_t v23;
  double v24;
  id v25;
  _BOOL4 v26;
  id v27;
  void *v28;
  _QWORD block[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id *v33;
  id v34;
  id v35;
  PDFTilePool *v36;
  CGContext *v37;
  int v38;
  char v39;

  v4 = (id *)a3;
  WeakRetained = objc_loadWeakRetained(v4 + 1);
  v6 = objc_loadWeakRetained(v4 + 2);
  objc_msgSend(v4[3], "pdfView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (WeakRetained && v6)
  {
    v28 = v7;
    objc_msgSend(WeakRetained, "hasStartedWork");
    MachSeconds = GetMachSeconds();
    -[PDFTilePool _createTileSurfaceForRequest:](self, "_createTileSurfaceForRequest:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock(&self->_private->surfacesLock);
    surfaces = self->_private->surfaces;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(v9 + 8));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](surfaces, "setObject:forKey:", v9, v11);

    os_unfair_lock_unlock(&self->_private->surfacesLock);
    v12 = -[PDFTilePool _createContextForTileSurface:ofRequest:](self, "_createContextForTileSurface:ofRequest:", v9, v4);
    v26 = +[PDFPage isNativeRotationDrawingEnabledForThisThread](PDFPage, "isNativeRotationDrawingEnabledForThisThread");
    +[PDFPage setNativeRotationDrawingEnabledForThisThread:](PDFPage, "setNativeRotationDrawingEnabledForThisThread:", 0);
    v13 = +[PDFPage shouldHideAnnotationsForThisThread](PDFPage, "shouldHideAnnotationsForThisThread");
    +[PDFPage setShouldHideAnnotationsForThisThread:](PDFPage, "setShouldHideAnnotationsForThisThread:", 1);
    v14 = +[PDFPage isExcludingAKAnnotationRenderingForThisThread](PDFPage, "isExcludingAKAnnotationRenderingForThisThread");
    +[PDFPage setExcludingAKAnnotationRenderingForThisThread:](PDFPage, "setExcludingAKAnnotationRenderingForThisThread:", 1);
    LOBYTE(v11) = GetDefaultsWriteColorTileEdge();
    v15 = -[PDFTilePool tileSurfaceSize](self, "tileSurfaceSize");
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __37__PDFTilePool__renderTileForRequest___block_invoke;
    v32[3] = &unk_24C25CFF8;
    v38 = v15;
    v33 = v4;
    v27 = v6;
    v16 = v6;
    v34 = v16;
    v39 = (char)v11;
    v35 = v28;
    v36 = self;
    v37 = v12;
    v17 = (void (**)(_QWORD, _QWORD))MEMORY[0x20BD1AEB4](v32);
    ((void (**)(_QWORD, CGContext *))v17)[2](v17, v12);
    +[PDFPage setExcludingAKAnnotationRenderingForThisThread:](PDFPage, "setExcludingAKAnnotationRenderingForThisThread:", v14);
    +[PDFPage setShouldHideAnnotationsForThisThread:](PDFPage, "setShouldHideAnnotationsForThisThread:", v13);
    +[PDFPage setNativeRotationDrawingEnabledForThisThread:](PDFPage, "setNativeRotationDrawingEnabledForThisThread:", v26);
    if (!*(_DWORD *)(v9 + 20))
      *(_QWORD *)(v9 + 32) = CGBitmapContextCreateImage(v12);
    CGContextFlush(v12);
    CGContextRelease(v12);
    if (*(_DWORD *)(v9 + 20) == 1)
      IOSurfaceUnlock(*(IOSurfaceRef *)(v9 + 24), 0, 0);
    if (GetDefaultsWriteLogPerfTimes())
    {
      v18 = MachSeconds;
      objc_msgSend(v16, "document");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "indexForPage:", v16);

      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "timeIntervalSince1970");
      v23 = (unint64_t)(v22 * 1000.0);

      v24 = GetMachSeconds();
      NSLog(CFSTR("PDFKit2_LogPerfTime: PDFTilePool has drawn a tile for page %d. Milliseconds since epoch: %llu. Time taken: %0.3f."), v20, v23, v24 - v18);
      NSLog(CFSTR("PDFKit2_LogPerfTime: Used tiles: %d"), -[NSMutableDictionary count](self->_private->surfaces, "count"));
    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __37__PDFTilePool__renderTileForRequest___block_invoke_2;
    block[3] = &unk_24C25CBE8;
    v30 = WeakRetained;
    v31 = (id)v9;
    v25 = (id)v9;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    v6 = v27;
    v7 = v28;
  }

}

void __37__PDFTilePool__renderTileForRequest___block_invoke(uint64_t a1, CGContextRef c)
{
  uint64_t v4;
  uint64_t v5;
  const void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  CGRect v11;

  CGContextSetRGBFillColor(c, 1.0, 1.0, 1.0, 1.0);
  v11.size.width = (double)*(int *)(a1 + 72);
  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  v11.size.height = v11.size.width;
  CGContextFillRect(c, v11);
  v4 = *(_QWORD *)(a1 + 32);
  v8 = *(_OWORD *)(v4 + 72);
  v9 = *(_OWORD *)(v4 + 88);
  v10 = *(_OWORD *)(v4 + 104);
  CGContextSetCTM();
  v5 = objc_msgSend(*(id *)(a1 + 40), "copyDisplayList", v8, v9, v10);
  if (v5)
  {
    v6 = (const void *)v5;
    CGDisplayListDrawInContext();
    CFRelease(v6);
  }
  else
  {
    v7 = *(void **)(a1 + 48);
    if (v7)
    {
      objc_msgSend(v7, "drawPage:toContext:", *(_QWORD *)(a1 + 40), c);
      objc_msgSend(*(id *)(a1 + 48), "drawPagePost:toContext:", *(_QWORD *)(a1 + 40), c);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "drawWithBox:toContext:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "displayBox"), c);
    }
  }
  if (*(_BYTE *)(a1 + 76))
    objc_msgSend(*(id *)(a1 + 56), "_colorizeTileEdgesForRequest:context:tileSize:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(unsigned int *)(a1 + 72));
}

void __37__PDFTilePool__renderTileForRequest___block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x20BD1ACC8]();
  objc_msgSend(*(id *)(a1 + 32), "recievePDFTileSurface:", *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

- (void)_colorizeTileEdgesForRequest:(id)a3 context:(CGContext *)a4 tileSize:(int)a5
{
  unsigned int *v7;
  __int128 v8;
  double v9;
  double v10;
  double v11;
  double v12;
  __CFString *v13;
  const __CFAttributedString *v14;
  const __CFAttributedString *v15;
  CTLineRef v16;
  const __CTLine *v17;
  uint64_t i;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[56];
  uint64_t v23;
  uint64_t v24;
  CGRect v25;
  CGRect BoundsWithOptions;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = (unsigned int *)a3;
  CGContextSaveGState(a4);
  v8 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v21 = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)v22 = *MEMORY[0x24BDBD8B8];
  v19 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  v20 = v8;
  *(_OWORD *)&v22[16] = v8;
  *(_OWORD *)&v22[32] = v19;
  CGContextSetCTM();
  v9 = (double)(rand() % 100) / 100.0;
  v10 = (double)(rand() % 100) / 100.0;
  v11 = (double)(rand() % 100) / 100.0;
  CGContextSaveGState(a4);
  CGContextSetLineWidth(a4, 16.0);
  CGContextSetRGBStrokeColor(a4, v9, v10, v11, 0.8);
  v12 = (double)a5;
  v25.size.width = (double)a5 + -16.0;
  v25.origin.x = 8.0;
  v25.origin.y = 8.0;
  v25.size.height = v25.size.width;
  CGContextStrokeRect(a4, v25);
  CGContextRestoreGState(a4);
  if (_colorizeTileEdgesForRequest_context_tileSize__onceToken != -1)
    dispatch_once(&_colorizeTileEdgesForRequest_context_tileSize__onceToken, &__block_literal_global_60);
  if (_colorizeTileEdgesForRequest_context_tileSize__stringAttributes)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), v7[30]);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v14 = CFAttributedStringCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v13, (CFDictionaryRef)_colorizeTileEdgesForRequest_context_tileSize__stringAttributes);
    if (v14)
    {
      v15 = v14;
      v16 = CTLineCreateWithAttributedString(v14);
      if (v16)
      {
        v17 = v16;
        *(_OWORD *)v22 = v21;
        *(_OWORD *)&v22[16] = v20;
        *(_OWORD *)&v22[32] = v19;
        CGContextSetTextMatrix(a4, (CGAffineTransform *)v22);
        BoundsWithOptions = CTLineGetBoundsWithOptions(v17, 0);
        *(_QWORD *)v22 = 0x4049000000000000;
        *(double *)&v22[8] = v12 + -50.0 - BoundsWithOptions.size.height;
        *(double *)&v22[16] = v12 + -50.0 - BoundsWithOptions.size.width;
        *(double *)&v22[24] = *(double *)&v22[8];
        *(double *)&v22[32] = *(double *)&v22[16];
        *(int64x2_t *)&v22[40] = vdupq_n_s64(0x4049000000000000uLL);
        v23 = 0x4049000000000000;
        CGContextSetRGBFillColor(a4, v9, v10, v11, 0.8);
        for (i = 0; i != 64; i += 16)
        {
          CGContextSaveGState(a4);
          CGContextSetTextPosition(a4, *(CGFloat *)&v22[i], *(CGFloat *)&v22[i + 8]);
          CTLineDraw(v17, a4);
          CGContextRestoreGState(a4);
        }
        CFRelease(v15);
        CFRelease(v17);
      }
    }

  }
  CGContextRestoreGState(a4);

}

void __61__PDFTilePool__colorizeTileEdgesForRequest_context_tileSize___block_invoke()
{
  CTFontRef v0;
  CTFontRef v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  _QWORD v8[5];

  v8[4] = *MEMORY[0x24BDAC8D0];
  v0 = CTFontCreateWithName(CFSTR("Helvetica"), 100.0, 0);
  if (v0)
  {
    v1 = v0;
    v2 = *MEMORY[0x24BDC4EE8];
    v7[0] = *MEMORY[0x24BDC4C28];
    v7[1] = v2;
    v8[0] = v0;
    v8[1] = MEMORY[0x24BDBD1C8];
    v8[2] = &unk_24C27DC08;
    v3 = *MEMORY[0x24BDC4F30];
    v7[2] = *MEMORY[0x24BDC4F38];
    v7[3] = v3;
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8[3] = objc_msgSend(v4, "CGColor");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)_colorizeTileEdgesForRequest_context_tileSize__stringAttributes;
    _colorizeTileEdgesForRequest_context_tileSize__stringAttributes = v5;

    CFRelease(v1);
  }
  else
  {
    NSLog(CFSTR("Failed to create font: \"%@\"), CFSTR("Helvetica"));
  }
}

- (void)releasePDFTileSurface:(id)a3
{
  os_unfair_lock_s *p_surfacesLock;
  unsigned int *v5;
  NSMutableDictionary *surfaces;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  p_surfacesLock = &self->_private->surfacesLock;
  v5 = (unsigned int *)a3;
  os_unfair_lock_lock(p_surfacesLock);
  surfaces = self->_private->surfaces;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5[2]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](surfaces, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = self->_private->surfaces;
  v10 = (void *)MEMORY[0x24BDD16E0];
  v11 = v5[2];

  objc_msgSend(v10, "numberWithInt:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](v9, "removeObjectForKey:", v12);

  objc_msgSend(v8, "releaseSurface");
  if (GetDefaultsWriteLogPerfTimes())
    NSLog(CFSTR("PDFKit2_LogPerfTime: Used tiles: %d"), -[NSMutableDictionary count](self->_private->surfaces, "count"));

  os_unfair_lock_unlock(&self->_private->surfacesLock);
}

- (int)activeTileCount
{
  return -[NSMutableDictionary count](self->_private->surfaces, "count");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_private, 0);
}

@end
