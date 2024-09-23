@implementation PKPaintAreaViewSurface

- (PKPaintAreaViewSurface)initWithPaintSurface:(id)a3 dispatchQueue:(id)a4 device:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKPaintAreaViewSurface *v12;
  PKPaintAreaViewSurface *v13;
  uint64_t v14;
  NSMutableArray *textureSet;
  int64x2_t v16;
  _QWORD v18[4];
  PKPaintAreaViewSurface *v19;
  id v20;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PKPaintAreaViewSurface;
  v12 = -[PKPaintAreaViewSurface init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_surface, a3);
    objc_storeStrong((id *)&v13->_device, a5);
    objc_storeStrong((id *)&v13->_dispatchQueue, a4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
    v14 = objc_claimAutoreleasedReturnValue();
    textureSet = v13->_textureSet;
    v13->_textureSet = (NSMutableArray *)v14;

    v16 = vdupq_n_s64(0x7FF8000000000000uLL);
    v13->_previousPoint = (CGPoint)v16;
    v13->_oldEraseLocation = (CGPoint)v16;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __68__PKPaintAreaViewSurface_initWithPaintSurface_dispatchQueue_device___block_invoke;
    v18[3] = &unk_1E7777440;
    v19 = v13;
    v20 = v9;
    -[PKPaintAreaViewSurface dispatchSyncOnSurfaceQueue:](v19, "dispatchSyncOnSurfaceQueue:", v18);

  }
  return v13;
}

double __68__PKPaintAreaViewSurface_initWithPaintSurface_dispatchQueue_device___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double result;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  objc_msgSend(*(id *)(a1 + 40), "paintSurfaceDrawingSize");
  v2 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v2 + 136) = v3;
  *(_QWORD *)(v2 + 144) = v4;
  objc_msgSend(*(id *)(a1 + 40), "paintSurfaceTextureScale");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) = v5;
  *(float64x2_t *)(*(_QWORD *)(a1 + 32) + 24) = vrndaq_f64(vmulq_n_f64(*(float64x2_t *)(*(_QWORD *)(a1 + 32) + 136), *(double *)(*(_QWORD *)(a1 + 32) + 112)));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 75) = objc_msgSend(*(id *)(a1 + 40), "paintSurfaceIsMipmapped");
  objc_msgSend(*(id *)(a1 + 40), "paintSurfaceDrawing");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 128);
  *(_QWORD *)(v8 + 128) = v7;

  v10 = *(void **)(a1 + 40);
  if (v10)
  {
    objc_msgSend(v10, "paintSurfaceStrokeTransform");
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v13 = 0u;
  }
  v11 = *(_QWORD *)(a1 + 32);
  *(_OWORD *)(v11 + 168) = v13;
  *(_OWORD *)(v11 + 184) = v14;
  result = *(double *)&v15;
  *(_OWORD *)(v11 + 200) = v15;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[PKController teardown]((id *)&self->_drawingController->super.isa);
  v3.receiver = self;
  v3.super_class = (Class)PKPaintAreaViewSurface;
  -[PKPaintAreaViewSurface dealloc](&v3, sel_dealloc);
}

- (id)CIImageFromTexture:(id)a3
{
  id v3;
  CGColorSpace *DeviceRGB;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v5 = *MEMORY[0x1E0C9E120];
  v9[0] = *MEMORY[0x1E0C9E110];
  v9[1] = v5;
  v10[0] = DeviceRGB;
  v10[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CGColorSpaceRelease(DeviceRGB);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDC8]), "initWithMTLTexture:options:", v3, v6);

  return v7;
}

- (void)dispatchSyncOnSurfaceQueue:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *dispatchQueue;
  int v6;
  void (**block)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  dispatchQueue = self->_dispatchQueue;
  block = v4;
  if (dispatchQueue)
    goto LABEL_5;
  v6 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v4 = block;
  if (!v6)
  {
    dispatchQueue = MEMORY[0x1E0C80D38];
LABEL_5:
    dispatch_sync(dispatchQueue, v4);
    goto LABEL_6;
  }
  block[2](block);
LABEL_6:

}

- (void)drawingBegan:(id *)a3 activeInputProperties:(unint64_t)a4 inputType:(int64_t)a5
{
  uint64_t v9;
  PKController *drawingController;
  PKController *v11;
  dispatch_semaphore_t v12;
  PKController *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  PKController *v17;
  double a;
  double b;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _OWORD v36[8];
  _QWORD v37[5];
  id v38;
  CGAffineTransform v39;
  CGAffineTransform v40;
  _QWORD v41[4];
  PKController *v42;
  dispatch_semaphore_t v43;
  CGAffineTransform v44;
  _QWORD v45[8];
  _QWORD v46[5];
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v62;

  -[PKPaintAreaViewSurface setIsDrawing:](self, "setIsDrawing:", 1);
  if (!self->_drawingController)
  {
    -[PKPaintAreaViewSurface _setupPKController](self, "_setupPKController");
    memset(&v62, 0, sizeof(v62));
    -[PKPaintAreaViewSurface strokeTransform](self, "strokeTransform");
    CGAffineTransformMakeScale(&t2, self->_textureScale, self->_textureScale);
    CGAffineTransformConcat(&v62, &t1, &t2);
    v54 = 0;
    v55 = &v54;
    v56 = 0x3032000000;
    v57 = __Block_byref_object_copy__10;
    v58 = __Block_byref_object_dispose__10;
    v59 = 0;
    v48 = 0;
    v49 = &v48;
    v50 = 0x3032000000;
    v51 = __Block_byref_object_copy__10;
    v52 = __Block_byref_object_dispose__10;
    v53 = 0;
    v46[0] = 0;
    v46[1] = v46;
    v46[2] = 0x3032000000;
    v46[3] = __Block_byref_object_copy__10;
    v46[4] = __Block_byref_object_dispose__10;
    v47 = 0;
    v9 = MEMORY[0x1E0C809B0];
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __71__PKPaintAreaViewSurface_drawingBegan_activeInputProperties_inputType___block_invoke;
    v45[3] = &unk_1E7779C98;
    v45[4] = self;
    v45[5] = &v54;
    v45[6] = v46;
    v45[7] = &v48;
    -[PKPaintAreaViewSurface dispatchSyncOnSurfaceQueue:](self, "dispatchSyncOnSurfaceQueue:", v45);
    drawingController = self->_drawingController;
    if (drawingController)
      drawingController = (PKController *)drawingController->_rendererController;
    v11 = drawingController;
    v12 = dispatch_semaphore_create(0);
    v13 = self->_drawingController;
    v14 = (void *)v55[5];
    v15 = (void *)v49[5];
    v41[0] = v9;
    v41[1] = 3221225472;
    v41[2] = __71__PKPaintAreaViewSurface_drawingBegan_activeInputProperties_inputType___block_invoke_2;
    v41[3] = &unk_1E77793A8;
    v44 = v62;
    v42 = v11;
    v43 = v12;
    v16 = v12;
    v17 = v11;
    -[PKController setDrawing:imageTexture:completion:]((uint64_t)v13, v14, v15, v41);
    dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);

    _Block_object_dispose(v46, 8);
    _Block_object_dispose(&v48, 8);

    _Block_object_dispose(&v54, 8);
  }
  if (!-[PKPaintAreaViewSurface eraserBeganAtLocation:](self, "eraserBeganAtLocation:", a3->var0.var0.x, a3->var0.var0.y))
  {
    -[PKPaintAreaViewSurface strokeTransform](self, "strokeTransform");
    CGAffineTransformInvert(&v40, &v39);
    a = v40.a;
    b = v40.b;
    -[PKPaintAreaViewSurface surface](self, "surface");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "paintSurfaceDrawing");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "newStroke");

    -[PKPaintAreaViewSurface paintAreaView](self, "paintAreaView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "tool");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "ink");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_setInk:", v25);

    if (!a5)
    {
      -[PKPaintAreaViewSurface paintAreaView](self, "paintAreaView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "traitCollection");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "forceTouchCapability");

      if (v28 == 1)
        a3->var1 = -1.0;
    }
    -[PKController inputController](&self->_drawingController->super.isa);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __71__PKPaintAreaViewSurface_drawingBegan_activeInputProperties_inputType___block_invoke_3;
    v37[3] = &unk_1E7777440;
    v37[4] = self;
    v30 = v22;
    v38 = v30;
    objc_msgSend(v29, "drawingBeganWithStroke:inputType:activeInputProperties:inputScale:start:", v30, a5, a4, v37, sqrt(b * b + a * a));

    -[PKController inputController](&self->_drawingController->super.isa);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = *(_OWORD *)&a3->var9;
    v36[4] = *(_OWORD *)&a3->var7;
    v36[5] = v32;
    v33 = *(_OWORD *)&a3->var13;
    v36[6] = *(_OWORD *)&a3->var11;
    v36[7] = v33;
    v34 = *(_OWORD *)&a3->var1;
    v36[0] = a3->var0;
    v36[1] = v34;
    v35 = *(_OWORD *)&a3->var5;
    v36[2] = *(_OWORD *)&a3->var3;
    v36[3] = v35;
    objc_msgSend(v31, "addPoint:", v36);

  }
}

void __71__PKPaintAreaViewSurface_drawingBegan_activeInputProperties_inputType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  objc_msgSend(*(id *)(a1 + 32), "surface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paintSurfaceDrawing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(*(id *)(a1 + 32), "surface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "paintSurfaceTexture");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v11
    && (unint64_t)objc_msgSend(v11, "width") >= 2
    && (unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "height") >= 2)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  }
}

intptr_t __71__PKPaintAreaViewSurface_drawingBegan_activeInputProperties_inputType___block_invoke_2(uint64_t a1)
{
  __int128 v2;
  __int128 v4[3];

  v2 = *(_OWORD *)(a1 + 64);
  v4[0] = *(_OWORD *)(a1 + 48);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 80);
  -[PKMetalRendererController setStrokeTransform:](*(_QWORD *)(a1 + 32), v4);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __71__PKPaintAreaViewSurface_drawingBegan_activeInputProperties_inputType___block_invoke_3(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;

  -[PKController didStartLiveInteraction](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  if (v2)
    v2 = (_QWORD *)v2[8];
  v3 = v2;
  -[PKMetalRendererController drawingBeganWithStroke:forPreview:]((uint64_t)v3, *(void **)(a1 + 40), 0);

}

- (void)_setupPKController
{
  PKController *v3;
  PKController *drawingController;
  PKController *v5;
  void *v6;
  PKController *v7;
  PKController *v8;
  id v9;
  PKController *v10;
  PKMetalRendererController *v11;
  PKMetalRendererController *v12;
  PKMetalConfig *v13;

  v13 = objc_alloc_init(PKMetalConfig);
  v3 = (PKController *)-[PKController initWithPixelSize:actualSize:singleComponent:sixChannelBlending:metalConfig:]([PKController alloc], 0, 0, v13, self->_pixelSize.width, self->_pixelSize.height, self->_drawingSize.width, self->_drawingSize.height);
  drawingController = self->_drawingController;
  self->_drawingController = v3;

  v5 = self->_drawingController;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, self);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = self->_drawingController;
  if (v7)
    v7 = (PKController *)v7->_rendererController;
  v8 = v7;
  v9 = objc_retainAutorelease(v6);
  -[PKMetalRendererController setBackgroundColor:]((uint64_t)v8, (CGColorRef)objc_msgSend(v9, "CGColor"));

  v10 = self->_drawingController;
  if (v10)
  {
    v11 = v10->_rendererController;
    v12 = v11;
    if (v11)
      objc_storeWeak((id *)&v11->_delegate, self);
  }
  else
  {
    v12 = 0;
  }

}

- (void)drawingEndedWithDetectedShape:(id)a3 completionBlock:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  _BOOL4 v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  PKPaintAreaViewSurface *v12;
  void (**v13)(_QWORD);
  BOOL v14;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = -[PKPaintAreaViewSurface isDrawing](self, "isDrawing");
  -[PKPaintAreaViewSurface setIsDrawing:](self, "setIsDrawing:", 0);
  if (self->_isErasingObjects)
  {
    -[PKPaintAreaViewSurface eraserEnded](self, "eraserEnded");
    if (v7)
      v7[2](v7);
  }
  else
  {
    if (v8)
      self->_waitingForStrokeToEnd = 1;
    -[PKController inputController](&self->_drawingController->super.isa);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __72__PKPaintAreaViewSurface_drawingEndedWithDetectedShape_completionBlock___block_invoke;
    v10[3] = &unk_1E7779D00;
    v11 = v6;
    v12 = self;
    v14 = v8;
    v13 = v7;
    objc_msgSend(v9, "drawingEndedEstimatesTimeout:completion:", v10, 0.1);

  }
}

void __72__PKPaintAreaViewSurface_drawingEndedWithDetectedShape_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v14[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 32);
    if (v6)
    {
      objc_msgSend(v6, "strokes");
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v7;
    }
    -[PKController addNewRenderedStrokes:wasAddedEarly:hidden:preDrawingChangedBlock:](*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), v5, 0, 0, &__block_literal_global_35);

  }
  if (*(_BYTE *)(a1 + 56))
  {
    v8 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
    if (v8)
      v8 = (_QWORD *)v8[8];
    v9 = v8;
    -[PKController inputController](*(_QWORD **)(*(_QWORD *)(a1 + 40) + 8));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __72__PKPaintAreaViewSurface_drawingEndedWithDetectedShape_completionBlock___block_invoke_4;
    v12[3] = &unk_1E7777B08;
    v11 = *(void **)(a1 + 48);
    v12[4] = *(_QWORD *)(a1 + 40);
    v13 = v11;
    -[PKMetalRendererController drawingEnded:finishStrokeBlock:]((uint64_t)v9, v10, v12);

  }
}

void __72__PKPaintAreaViewSurface_drawingEndedWithDetectedShape_completionBlock___block_invoke_2()
{
  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_227);
}

void __72__PKPaintAreaViewSurface_drawingEndedWithDetectedShape_completionBlock___block_invoke_4(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __72__PKPaintAreaViewSurface_drawingEndedWithDetectedShape_completionBlock___block_invoke_5;
  v2[3] = &unk_1E7777B08;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

intptr_t __72__PKPaintAreaViewSurface_drawingEndedWithDetectedShape_completionBlock___block_invoke_5(uint64_t a1)
{
  id v2;
  intptr_t result;
  uint64_t v4;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  objc_sync_enter(v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
  objc_sync_exit(v2);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    result = (*(uint64_t (**)(void))(result + 16))();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 73) = 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v4)
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v4 + 80));
  return result;
}

- (void)drawingCancelled
{
  BOOL v3;
  PKController *v4;
  void *v5;
  PKController *v6;
  _QWORD v7[5];
  PKController *v8;
  BOOL v9;

  v3 = -[PKPaintAreaViewSurface isDrawing](self, "isDrawing");
  -[PKPaintAreaViewSurface setIsDrawing:](self, "setIsDrawing:", 0);
  if (self->_isErasingObjects)
  {
    -[PKPaintAreaViewSurface eraserCancelled](self, "eraserCancelled");
  }
  else
  {
    v4 = self->_drawingController;
    -[PKController inputController](v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __42__PKPaintAreaViewSurface_drawingCancelled__block_invoke;
    v7[3] = &unk_1E7778440;
    v7[4] = self;
    v9 = v3;
    v6 = v4;
    v8 = v6;
    objc_msgSend(v5, "drawingCancelledWithCompletion:", v7);

  }
}

void __42__PKPaintAreaViewSurface_drawingCancelled__block_invoke(uint64_t a1)
{
  id v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  objc_sync_enter(v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
  objc_sync_exit(v2);

  if (*(_BYTE *)(a1 + 48))
  {
    v3 = *(_QWORD **)(a1 + 40);
    if (v3)
      v3 = (_QWORD *)v3[8];
    v4 = v3;
    -[PKMetalRendererController drawingCancelledForPreview:]((uint64_t)v4, 0);

    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v5 + 80));
  }
}

- (void)vsync:(double)a3
{
  PKController *v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  double v9;
  PKController *drawingController;
  PKController *v11;
  __int128 v12[3];
  CGAffineTransform v13;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v16;

  if (-[PKPaintAreaViewSurface isDrawing](self, "isDrawing")
    || (v5 = self->_drawingController) != 0 && v5->_liveInteraction
    || self->_isErasingObjects)
  {
    memset(&v16, 0, sizeof(v16));
    -[PKPaintAreaViewSurface strokeTransform](self, "strokeTransform");
    -[PKPaintAreaViewSurface textureScale](self, "textureScale");
    v7 = v6;
    -[PKPaintAreaViewSurface textureScale](self, "textureScale");
    CGAffineTransformMakeScale(&t2, v7, v8);
    CGAffineTransformConcat(&v16, &t1, &t2);
    v9 = sqrt(v16.b * v16.b + v16.a * v16.a);
    drawingController = self->_drawingController;
    if (drawingController)
      drawingController = (PKController *)drawingController->_rendererController;
    v11 = drawingController;
    v13 = v16;
    -[PKMetalRendererController setStrokeTransform:]((uint64_t)v11, (__int128 *)&v13);
    memset(v12, 0, sizeof(v12));
    -[PKMetalRendererController renderWithTransform:inputScale:at:]((uint64_t)v11, v12, v9, a3);

  }
}

- (BOOL)eraserBeganAtLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  y = a3.y;
  x = a3.x;
  self->_isErasingObjects = 0;
  -[PKPaintAreaViewSurface paintAreaView](self, "paintAreaView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tool");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ink");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v9, "isEqual:", CFSTR("com.apple.ink.objectEraser"));

  if ((_DWORD)v7
    && (*(_QWORD *)&x & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
    && (*(_QWORD *)&y & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    self->_isErasingObjects = 1;
    -[PKPaintAreaViewSurface eraseStrokesForPoint:prevPoint:](self, "eraseStrokesForPoint:prevPoint:", x, y, x, y);
    self->_oldEraseLocation.x = x;
    self->_oldEraseLocation.y = y;
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)eraserMovedToLocation:(CGPoint)a3
{
  CGFloat x;
  double y;
  double v6;
  double v7;
  double v9;
  double v10;

  x = a3.x;
  if ((*(_QWORD *)&a3.x & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    y = a3.y;
    if ((*(_QWORD *)&a3.y & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
    {
      v6 = self->_oldEraseLocation.x;
      v7 = self->_oldEraseLocation.y;
      if ((*(_QWORD *)&v6 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
        || (*(_QWORD *)&self->_oldEraseLocation.y & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL)
      {
        goto LABEL_7;
      }
      v9 = -(a3.x - v6);
      if (a3.x - v6 >= 0.0)
        v9 = a3.x - v6;
      if (v9 <= self->_drawingSize.width * 0.5)
      {
        v10 = y - v7;
        if (y - v7 < 0.0)
          v10 = -(y - v7);
        if (v10 <= self->_drawingSize.height * 0.5)
LABEL_7:
          -[PKPaintAreaViewSurface eraseStrokesForPoint:prevPoint:](self, "eraseStrokesForPoint:prevPoint:", a3.x, y);
      }
      self->_oldEraseLocation.x = x;
      self->_oldEraseLocation.y = y;
    }
  }
}

- (void)eraseStrokesForPoint:(CGPoint)a3 prevPoint:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  CGFloat v6;
  CGFloat v7;
  NSMutableArray *v9;
  NSMutableArray *strokesToErase;
  NSMutableSet *v11;
  NSMutableSet *strokeIDsToErase;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSMutableSet *v20;
  void *v21;
  NSMutableSet *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[5];
  id v29;
  uint64_t *v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  v42 = *MEMORY[0x1E0C80C00];
  if (!self->_strokesToErase)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    strokesToErase = self->_strokesToErase;
    self->_strokesToErase = v9;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    strokeIDsToErase = self->_strokeIDsToErase;
    self->_strokeIDsToErase = v11;

  }
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__10;
  v39 = __Block_byref_object_dispose__10;
  v40 = 0;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __57__PKPaintAreaViewSurface_eraseStrokesForPoint_prevPoint___block_invoke;
  v28[3] = &unk_1E7779D28;
  v29 = 0;
  v30 = &v35;
  v31 = v7;
  v32 = v6;
  v33 = x;
  v34 = y;
  v28[4] = self;
  -[PKPaintAreaViewSurface dispatchSyncOnSurfaceQueue:](self, "dispatchSyncOnSurfaceQueue:", v28);
  if (objc_msgSend((id)v36[5], "count"))
  {
    v13 = -[NSMutableArray count](self->_strokesToErase, "count");
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend((id)v36[5], "array", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = +[PKStroke copyStrokes:hidden:](PKStroke, "copyStrokes:hidden:", v14, 1);

    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v41, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v15);
          v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          v20 = self->_strokeIDsToErase;
          objc_msgSend(v19, "_strokeUUID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v20) = -[NSMutableSet containsObject:](v20, "containsObject:", v21);

          if ((v20 & 1) == 0)
          {
            -[NSMutableArray addObject:](self->_strokesToErase, "addObject:", v19);
            v22 = self->_strokeIDsToErase;
            objc_msgSend(v19, "_strokeUUID");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableSet addObject:](v22, "addObject:", v23);

          }
        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v41, 16);
      }
      while (v16);
    }

    if (-[NSMutableArray count](self->_strokesToErase, "count") != v13)
      -[PKController updateDrawingWithErasedStrokes:]((uint64_t)self->_drawingController, self->_strokesToErase);
  }

  _Block_object_dispose(&v35, 8);
}

void __57__PKPaintAreaViewSurface_eraseStrokesForPoint_prevPoint___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "surface");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "paintSurfaceDrawing");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "strokesIntersectedByPoint:prevPoint:onscreenVisibleStrokes:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)_didFinishErasingStrokes:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSMutableArray *strokesToErase;
  NSMutableSet *strokeIDsToErase;
  BOOL v8;
  _QWORD v9[5];
  id v10;

  v3 = a3;
  v5 = (void *)-[NSMutableArray copy](self->_strokesToErase, "copy");
  strokesToErase = self->_strokesToErase;
  self->_strokesToErase = 0;

  strokeIDsToErase = self->_strokeIDsToErase;
  self->_strokeIDsToErase = 0;

  if (v5)
  {
    if (objc_msgSend(v5, "count"))
      v8 = !v3;
    else
      v8 = 1;
    if (!v8)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __51__PKPaintAreaViewSurface__didFinishErasingStrokes___block_invoke;
      v9[3] = &unk_1E7777440;
      v9[4] = self;
      v10 = v5;
      -[PKPaintAreaViewSurface dispatchSyncOnSurfaceQueue:](self, "dispatchSyncOnSurfaceQueue:", v9);

    }
  }

}

void __51__PKPaintAreaViewSurface__didFinishErasingStrokes___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "surface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paintSurfaceDrawing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[PKModifyStrokesCommand commandForErasingStrokes:drawing:](PKModifyStrokesCommand, "commandForErasingStrokes:drawing:", *(_QWORD *)(a1 + 40), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applyToDrawing:", v3);
  v5 = (void *)objc_msgSend(v3, "copy");

  objc_msgSend(*(id *)(a1 + 32), "drawingChanged:", v5);
  v6 = os_log_create("com.apple.pencilkit", "Erase");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = objc_msgSend(*(id *)(a1 + 40), "count");
    v8 = 134217984;
    v9 = v7;
    _os_log_debug_impl(&dword_1BE213000, v6, OS_LOG_TYPE_DEBUG, "Erased %lu strokes", (uint8_t *)&v8, 0xCu);
  }

}

- (void)eraserEnded
{
  self->_isErasingObjects = 0;
  -[PKPaintAreaViewSurface _didFinishErasingStrokes:](self, "_didFinishErasingStrokes:", 1);
}

- (void)eraserCancelled
{
  self->_isErasingObjects = 0;
  -[PKPaintAreaViewSurface _didFinishErasingStrokes:](self, "_didFinishErasingStrokes:", 0);
}

- (id)nextTextureTargetForMetalRendererController:(id)a3
{
  NSMutableArray *v4;
  double width;
  double height;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD *v15;

  v4 = self->_textureSet;
  objc_sync_enter(v4);
  width = self->_pixelSize.width;
  height = self->_pixelSize.height;
  if ((unint64_t)-[NSMutableArray count](self->_textureSet, "count") >= 2)
  {
    -[NSMutableArray firstObject](self->_textureSet, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_textureSet, "removeObjectAtIndex:", 0);
    if (self->_pixelSize.width == (double)(unint64_t)objc_msgSend(v7, "width")
      && self->_pixelSize.height == (double)(unint64_t)objc_msgSend(v7, "height"))
    {
      objc_sync_exit(v4);
      goto LABEL_12;
    }

  }
  objc_sync_exit(v4);

  -[PKPaintAreaViewSurface paintAreaView](self, "paintAreaView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegate");
  v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PKPaintAreaViewSurface paintAreaView](self, "paintAreaView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaintAreaViewSurface surface](self, "surface");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray paintAreaView:newTextureForSurface:](v4, "paintAreaView:newTextureForSurface:", v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PKPaintAreaViewSurface drawingController](self, "drawingController");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = *(void **)(v12 + 64);
    else
      v14 = 0;
    v15 = v14;
    -[PKMetalRendererController device](v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 80, (unint64_t)width, (unint64_t)height, -[PKPaintAreaViewSurface isMipmapped](self, "isMipmapped"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextureType:", 2);
    objc_msgSend(v10, "setSampleCount:", 1);
    objc_msgSend(v10, "setUsage:", 5);
    objc_msgSend(v10, "setStorageMode:", 2);
    v11 = objc_msgSend(v9, "newTextureWithDescriptor:", v10);
  }
  v7 = (void *)v11;

LABEL_12:
  return v7;
}

- (void)metalRendererController:(id)a3 didCommitRenderingIntoTexture:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  PKPaintAreaViewSurface *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  -[PKPaintAreaViewSurface dispatchQueue](self, "dispatchQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    v10 = MEMORY[0x1E0C80D38];
    v11 = MEMORY[0x1E0C80D38];
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__PKPaintAreaViewSurface_metalRendererController_didCommitRenderingIntoTexture___block_invoke;
  block[3] = &unk_1E7776FB0;
  v15 = v7;
  v16 = self;
  v17 = v6;
  v12 = v6;
  v13 = v7;
  dispatch_async(v10, block);

}

void __80__PKPaintAreaViewSurface_metalRendererController_didCommitRenderingIntoTexture___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "mipmapLevelCount") >= 2
    && objc_msgSend(*(id *)(a1 + 40), "isMipmapped"))
  {
    -[PKMetalRendererController commandQueue](*(_QWORD **)(a1 + 48));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "commandBuffer");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "blitCommandEncoder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "generateMipmapsForTexture:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "endEncoding");
    objc_msgSend(v8, "commit");
    objc_msgSend(v8, "waitUntilScheduled");

  }
  objc_msgSend(*(id *)(a1 + 40), "surface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paintSurfaceTexture");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v5 = *(id *)(*(_QWORD *)(a1 + 40) + 16);
  objc_sync_enter(v5);
  if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "count") <= 3
    && *(double *)(*(_QWORD *)(a1 + 40) + 24) == (double)(unint64_t)objc_msgSend(v9, "width")
    && *(double *)(*(_QWORD *)(a1 + 40) + 32) == (double)(unint64_t)objc_msgSend(v9, "height")
    && objc_msgSend(v9, "pixelFormat") == 80)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "addObject:", v9);
  }
  objc_sync_exit(v5);

  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "surface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPaintSurfaceTexture:", v6);

}

- (void)drawingChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  PKPaintAreaViewSurface *v16;

  v4 = a3;
  -[PKPaintAreaViewSurface surface](self, "surface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaintAreaViewSurface paintAreaView](self, "paintAreaView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PKPaintAreaViewSurface dispatchQueue](self, "dispatchQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      v10 = MEMORY[0x1E0C80D38];
      v11 = MEMORY[0x1E0C80D38];
    }

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __41__PKPaintAreaViewSurface_drawingChanged___block_invoke;
    v12[3] = &unk_1E7778588;
    v13 = v5;
    v14 = v4;
    v15 = v7;
    v16 = self;
    dispatch_async(v10, v12);

  }
}

void __41__PKPaintAreaViewSurface_drawingChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "paintSurfaceDrawing");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if (v5)
    objc_msgSend(v2, "mergeWithDrawing:", *(_QWORD *)(a1 + 40));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "paintAreaView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v6, "paintAreaView:didUpdateDrawingForSurface:", v7, *(_QWORD *)(a1 + 32));

  }
  v9 = os_log_create("com.apple.pencilkit", ");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412290;
    v11 = v2;
    _os_log_debug_impl(&dword_1BE213000, v9, OS_LOG_TYPE_DEBUG, "Drawing changed %@", (uint8_t *)&v10, 0xCu);
  }

}

- (BOOL)isDrawing
{
  return self->_isDrawing;
}

- (void)setIsDrawing:(BOOL)a3
{
  self->_isDrawing = a3;
}

- (BOOL)waitingForStrokeToEnd
{
  return self->_waitingForStrokeToEnd;
}

- (BOOL)isErasingObjects
{
  return self->_isErasingObjects;
}

- (NSMutableArray)strokesToErase
{
  return self->_strokesToErase;
}

- (NSMutableSet)strokeIDsToErase
{
  return self->_strokeIDsToErase;
}

- (PKController)drawingController
{
  return self->_drawingController;
}

- (PKPaintAreaView)paintAreaView
{
  return (PKPaintAreaView *)objc_loadWeakRetained((id *)&self->_paintAreaView);
}

- (void)setPaintAreaView:(id)a3
{
  objc_storeWeak((id *)&self->_paintAreaView, a3);
}

- (PKPaintSurface)surface
{
  return self->_surface;
}

- (CGSize)drawingSize
{
  double width;
  double height;
  CGSize result;

  width = self->_drawingSize.width;
  height = self->_drawingSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)textureScale
{
  return self->_textureScale;
}

- (CGAffineTransform)strokeTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[3].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[4].b;
  return self;
}

- (BOOL)isMipmapped
{
  return self->_isMipmapped;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (PKDrawingUUID)drawingUUID
{
  return self->_drawingUUID;
}

- (CGPoint)previousPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_previousPoint.x;
  y = self->_previousPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPreviousPoint:(CGPoint)a3
{
  self->_previousPoint = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawingUUID, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_surface, 0);
  objc_destroyWeak((id *)&self->_paintAreaView);
  objc_storeStrong((id *)&self->_strokeIDsToErase, 0);
  objc_storeStrong((id *)&self->_strokesToErase, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_imageContext, 0);
  objc_storeStrong((id *)&self->_textureSet, 0);
  objc_storeStrong((id *)&self->_drawingController, 0);
}

@end
