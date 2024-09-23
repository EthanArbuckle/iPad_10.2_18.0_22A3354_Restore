@implementation PKMetalRendererController

- (void)setSixChannelBlending:(uint64_t)a1
{
  NSObject *v2;
  _QWORD block[5];

  if (a1)
  {
    if (*(unsigned __int8 *)(a1 + 493) != a2)
    {
      *(_BYTE *)(a1 + 493) = a2;
      v2 = *(NSObject **)(a1 + 24);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __51__PKMetalRendererController_setSixChannelBlending___block_invoke;
      block[3] = &unk_1E7776F38;
      block[4] = a1;
      dispatch_async(v2, block);
    }
  }
}

- (void)setInvertColors:(uint64_t)a1
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[5];
  char v5;

  if (a1 && *(unsigned __int8 *)(a1 + 492) != a2)
  {
    *(_BYTE *)(a1 + 492) = a2;
    if (*(_BYTE *)(a1 + 16))
    {
      v2 = *(_QWORD *)(a1 + 592);
      if (v2)
        *(_BYTE *)(v2 + 934) = a2;
    }
    else
    {
      v3 = *(NSObject **)(a1 + 24);
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __45__PKMetalRendererController_setInvertColors___block_invoke;
      v4[3] = &unk_1E7778538;
      v4[4] = a1;
      v5 = a2;
      dispatch_async(v3, v4);
    }
  }
}

- (void)setDrawBitmapEraserMask:(uint64_t)a1
{
  NSObject *v2;
  _QWORD v3[5];
  char v4;

  if (a1)
  {
    if (*(unsigned __int8 *)(a1 + 494) != a2)
    {
      *(_BYTE *)(a1 + 494) = a2;
      v2 = *(NSObject **)(a1 + 24);
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __53__PKMetalRendererController_setDrawBitmapEraserMask___block_invoke;
      v3[3] = &unk_1E7778538;
      v3[4] = a1;
      v4 = a2;
      dispatch_async(v2, v3);
    }
  }
}

- (void)setBackgroundColor:(uint64_t)a1
{
  CGColorRef v3;
  NSObject *v4;
  _QWORD v5[6];

  if (a1)
  {
    v3 = CGColorRetain(color);
    v4 = *(NSObject **)(a1 + 24);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __48__PKMetalRendererController_setBackgroundColor___block_invoke;
    v5[3] = &unk_1E7779358;
    v5[4] = a1;
    v5[5] = v3;
    dispatch_async(v4, v5);
  }
}

- (void)initWithPixelSize:(char)a3 actualSize:(void *)a4 pixelFormat:(double)a5 sixChannelBlending:(double)a6 metalConfig:(double)a7
{
  PKMetalConfig *v15;
  char *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  void *v22;
  unsigned __int8 *v23;
  dispatch_semaphore_t v24;
  void *v25;
  dispatch_semaphore_t v26;
  void *v27;
  PKMetalRenderer *v28;
  void *v29;
  void *v30;
  id *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE *v38;
  BOOL v39;
  PKStrokeGenerator *v40;
  void *v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  void *v45;
  __int128 v46;
  objc_super v48;

  v15 = a4;
  if (a1)
  {
    v48.receiver = a1;
    v48.super_class = (Class)PKMetalRendererController;
    v16 = (char *)objc_msgSendSuper2(&v48, sel_init);
    a1 = v16;
    if (!+[PKMetalUtility isMetalAvailable](PKMetalUtility, "isMetalAvailable"))
    {
      v16[96] = 1;

      a1 = 0;
      goto LABEL_21;
    }
    if (v16)
    {
      +[PKMetalUtility clampedPixelSize:](PKMetalUtility, "clampedPixelSize:", a5, a6);
      v18 = v17;
      v20 = v19;
      *((_QWORD *)v16 + 65) = 0x3FF0000000000000;
      v16[493] = a3;
      v16[494] = 0;
      if (!v15)
        v15 = objc_alloc_init(PKMetalConfig);
      objc_storeStrong((id *)v16 + 1, v15);
      -[PKMetalConfig renderQueue](v15);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)*((_QWORD *)v16 + 3);
      *((_QWORD *)v16 + 3) = v21;

      v23 = (unsigned __int8 *)(v16 + 48);
      do
        __ldaxr(v23);
      while (__stlxr(1u, v23));
      v24 = dispatch_semaphore_create(0);
      v25 = (void *)*((_QWORD *)v16 + 5);
      *((_QWORD *)v16 + 5) = v24;

      dispatch_semaphore_signal(*((dispatch_semaphore_t *)v16 + 5));
      if (_UIUpdateCycleEnabled())
      {
        v26 = dispatch_semaphore_create(0);
        v27 = (void *)*((_QWORD *)v16 + 60);
        *((_QWORD *)v16 + 60) = v26;

      }
      if (-[PKMetalRendererController initWithPixelSize:actualSize:pixelFormat:sixChannelBlending:metalConfig:]::onceToken != -1)
        dispatch_once(&-[PKMetalRendererController initWithPixelSize:actualSize:pixelFormat:sixChannelBlending:metalConfig:]::onceToken, &__block_literal_global_27);
      v28 = [PKMetalRenderer alloc];
      -[PKMetalConfig device](v15);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKMetalConfig resourceHandler](v15);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[PKMetalRenderer initWithDrawingPixelSize:actualSize:device:resourceHandler:sixChannelBlending:pixelFormat:]((id *)&v28->super.isa, v29, v30, v16[493], a2, v18, v20, a7, a8);
      v32 = (void *)*((_QWORD *)v16 + 74);
      *((_QWORD *)v16 + 74) = v31;

      v33 = *((_QWORD *)v16 + 74);
      if (v33)
      {
        *(_BYTE *)(v33 + 935) = v16[494];
        v34 = *((_QWORD *)v16 + 74);
        *((_QWORD *)v16 + 63) = a2;
        if (v34)
        {
          v35 = *(id *)(v34 + 192);
          if (v35)
          {
            v36 = v35[56];
            goto LABEL_16;
          }
LABEL_24:
          v36 = 0;
LABEL_16:
          *((_QWORD *)v16 + 64) = v36;

          v37 = *((_QWORD *)v16 + 74);
          if (v37)
          {
            v38 = *(id *)(v37 + 192);
            if (v38)
            {
              v39 = v38[429] != 0;
LABEL_19:
              v16[489] = v39;

              v40 = objc_alloc_init(PKStrokeGenerator);
              v41 = (void *)*((_QWORD *)v16 + 66);
              *((_QWORD *)v16 + 66) = v40;

              v42 = MEMORY[0x1E0C9BAA8];
              v43 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
              *((_OWORD *)v16 + 41) = *MEMORY[0x1E0C9BAA8];
              *((_OWORD *)v16 + 42) = v43;
              *((_OWORD *)v16 + 43) = *(_OWORD *)(v42 + 32);
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v44 = objc_claimAutoreleasedReturnValue();
              v45 = (void *)*((_QWORD *)v16 + 11);
              *((_QWORD *)v16 + 11) = v44;

              *((double *)v16 + 13) = v18;
              *((double *)v16 + 14) = v20;
              *((double *)v16 + 15) = a7;
              *((double *)v16 + 16) = a8;
              v46 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
              *(_OWORD *)(v16 + 424) = *MEMORY[0x1E0C9D628];
              *(_OWORD *)(v16 + 440) = v46;
              goto LABEL_21;
            }
          }
          else
          {
            v38 = 0;
          }
          v39 = 0;
          goto LABEL_19;
        }
      }
      else
      {
        *((_QWORD *)v16 + 63) = a2;
      }
      v35 = 0;
      goto LABEL_24;
    }
  }
LABEL_21:

  return a1;
}

void __101__PKMetalRendererController_initWithPixelSize_actualSize_pixelFormat_sixChannelBlending_metalConfig___block_invoke()
{
  void *v0;
  uint64_t v1;
  double v2;
  _BOOL4 v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  int v28;
  __int128 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  mach_timebase_info((mach_timebase_info_t)&dword_1EF55D0AC);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "maximumFramesPerSecond");

  v2 = 1.0 / (double)v1;
  *(double *)&_MergedGlobals_108 = v2;
  *(double *)&qword_1ECEE5FF8 = v2 + 0.001;
  v3 = v2 < 0.01;
  v4 = qword_1BE4FCC10[v2 < 0.01];
  v5 = qword_1BE4FCC20[v3];
  qword_1ECEE6000 = 0x3F50624DD2F1A9FCLL;
  qword_1ECEE6008 = v4;
  qword_1ECEE6010 = v5;
  v29 = xmmword_1BE4FCC50;
  v30 = 372777383;
  v27 = xmmword_1BE4FCC64;
  v28 = -858079590;
  if ((MGIsDeviceOneOfType() & 1) != 0)
  {
    _MergedGlobals_161 = 257;
    qword_1ECEE6008 = 0x3F85CFAACD9E83E4;
    qword_1ECEE6010 = 0x3F70624DD2F1A9FCLL;
    byte_1EF55D0A8 = 1;
  }
  v30 = -340360463;
  v29 = xmmword_1BE4FCC78;
  v27 = xmmword_1BE4FCC8C;
  v28 = 1605231531;
  if (MGIsDeviceOneOfType())
    HIBYTE(_MergedGlobals_161) = 1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults", &v27, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("PKFinalRenderMaximumMidFrameTouchWaitTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleForKey:", CFSTR("PKFinalRenderMaximumMidFrameTouchWaitTime"));
    qword_1ECEE6008 = v10;

  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("PKFinalRenderMinimumMidFrameTouchWaitTime"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12 == 0;

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleForKey:", CFSTR("PKFinalRenderMinimumMidFrameTouchWaitTime"));
    qword_1ECEE6010 = v15;

  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", CFSTR("PKFinalRenderFirstTouchWaitTime"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17 == 0;

  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleForKey:", CFSTR("PKFinalRenderFirstTouchWaitTime"));
    qword_1ECEE6018 = v20;

  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKey:", CFSTR("PKFinalRenderInitialMaxDelay"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22 == 0;

  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "doubleForKey:", CFSTR("PKFinalRenderInitialMaxDelay"));
    qword_1ECEE6008 = v25;

  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  byte_1EF55D0A9 = objc_msgSend(v26, "BOOLForKey:", CFSTR("PKAlwaysRenderLiveStrokesAsPreview"));

}

- (_QWORD)device
{
  _QWORD *v1;

  if (a1)
  {
    v1 = (_QWORD *)a1[74];
    if (v1)
      v1 = (_QWORD *)v1[3];
    a1 = v1;
  }
  return a1;
}

- (_QWORD)commandQueue
{
  _QWORD *v1;

  if (a1)
  {
    v1 = (_QWORD *)a1[74];
    if (v1)
      v1 = (_QWORD *)v1[4];
    a1 = v1;
  }
  return a1;
}

- (void)setPixelSize:(double)a3 actualSize:(double)a4
{
  NSObject *v10;
  _QWORD block[9];

  if (a1)
  {
    -[PKMetalRendererController cancelLongRunningRenders](a1);
    v10 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__PKMetalRendererController_setPixelSize_actualSize___block_invoke;
    block[3] = &unk_1E77792B8;
    block[4] = a1;
    *(double *)&block[5] = a2;
    *(double *)&block[6] = a3;
    *(double *)&block[7] = a4;
    *(double *)&block[8] = a5;
    dispatch_async(v10, block);
  }
}

- (void)cancelLongRunningRenders
{
  NSObject *v2;
  unsigned int *v3;
  unsigned int v4;
  uint8_t v5[16];

  if (a1)
  {
    v2 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v5 = 0;
      _os_log_debug_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEBUG, "Cancel long-running render.", v5, 2u);
    }

    v3 = (unsigned int *)(a1 + 32);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 + 1, v3));
  }
}

void __53__PKMetalRendererController_setPixelSize_actualSize___block_invoke(uint64_t a1)
{
  uint64_t v2;
  unsigned int v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint8_t v10[16];

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2 || (v3 = atomic_load((unsigned int *)(v2 + 36))) == 0)
  {
    v4 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v10 = 0;
      _os_log_debug_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEBUG, "Drawing setPixelSize:actualSize:", v10, 2u);
    }

    v5 = *(_QWORD *)(a1 + 32);
    if (*(double *)(v5 + 104) == *(double *)(a1 + 40) && *(double *)(v5 + 112) == *(double *)(a1 + 48))
    {
      *(_OWORD *)(v5 + 120) = *(_OWORD *)(a1 + 56);
      v7 = *(_QWORD *)(a1 + 32);
      if (v7)
      {
        v8 = *(_QWORD *)(v7 + 592);
        if (v8)
        {
          v9 = *(_OWORD *)(a1 + 56);
          *(_OWORD *)(v8 + 248) = v9;
          *(double *)(v8 + 264) = *(double *)(v8 + 224) / *(double *)&v9;
        }
      }
    }
    else
    {
      *(_OWORD *)(v5 + 104) = *(_OWORD *)(a1 + 40);
      *(_OWORD *)(*(_QWORD *)(a1 + 32) + 120) = *(_OWORD *)(a1 + 56);
      -[PKMetalRenderer updateActualSize:pixelSize:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 592), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 40), *(double *)(a1 + 48));
    }
    -[PKMetalRendererController resumeLongRunningRenders](*(_QWORD *)(a1 + 32));
  }
}

- (void)resumeLongRunningRenders
{
  NSObject *v2;
  unsigned int *v3;
  unsigned int v4;
  uint8_t v5[16];

  if (a1)
  {
    v2 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v5 = 0;
      _os_log_debug_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEBUG, "Resume long-running render.", v5, 2u);
    }

    v3 = (unsigned int *)(a1 + 32);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 - 1, v3));
  }
}

- (void)teardown
{
  dispatch_semaphore_t v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  NSObject *v8;
  _QWORD block[4];
  NSObject *v10;
  uint64_t v11;

  if (a1)
  {
    -[PKMetalRendererController cancelAllRendering](a1);
    v2 = dispatch_semaphore_create(0);
    dispatch_get_global_queue(0, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__PKMetalRendererController_teardown__block_invoke;
    block[3] = &unk_1E7777440;
    v5 = v2;
    v10 = v5;
    v11 = a1;
    dispatch_async(v3, block);

    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __37__PKMetalRendererController_teardown__block_invoke_2;
    v7[3] = &unk_1E7777440;
    v7[4] = a1;
    v8 = v5;
    v6 = v5;
    dispatch_async(v3, v7);

  }
}

- (void)cancelAllRendering
{
  NSObject *v2;
  uint8_t v3[16];

  if (a1)
  {
    v2 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v3 = 0;
      _os_log_debug_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEBUG, "Cancel all rendering.", v3, 2u);
    }

    atomic_store(1u, (unsigned int *)(a1 + 36));
  }
}

intptr_t __37__PKMetalRendererController_teardown__block_invoke(uint64_t a1)
{
  intptr_t result;

  result = dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 96) = 1;
  return result;
}

intptr_t __37__PKMetalRendererController_teardown__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[5];

  +[PKRendererVSyncController sharedController]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRendererVSyncController removeRendererController:]((uint64_t)v2, *(void **)(a1 + 32));

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__PKMetalRendererController_teardown__block_invoke_3;
  block[3] = &unk_1E7776F38;
  block[4] = v3;
  dispatch_sync(v4, block);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __37__PKMetalRendererController_teardown__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  CGImage *v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 328);
  *(_QWORD *)(v2 + 328) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 320);
  *(_QWORD *)(v4 + 320) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 592);
  *(_QWORD *)(v6 + 592) = 0;

  v8 = *(CGImage **)(*(_QWORD *)(a1 + 32) + 336);
  if (v8)
  {
    CGImageRelease(v8);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 336) = 0;
  }
}

- (void)dealloc
{
  objc_super v2;

  if (!self->_isTorndown)
    objc_exception_throw(CFSTR("PKMetalRendererController was not fully torndown before dealloc."));
  v2.receiver = self;
  v2.super_class = (Class)PKMetalRendererController;
  -[PKMetalRendererController dealloc](&v2, sel_dealloc);
}

- (void)setup
{
  NSObject *v1;
  _QWORD block[5];

  if (a1)
  {
    v1 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __34__PKMetalRendererController_setup__block_invoke;
    block[3] = &unk_1E7776F38;
    block[4] = a1;
    dispatch_async(v1, block);
  }
}

uint64_t __34__PKMetalRendererController_setup__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (v1)
    atomic_load((unsigned int *)(v1 + 36));
  return result;
}

- (void)signalVSyncSemaphore:(double)a3 presentationTime:(unint64_t)a4
{
  atomic_flag *p_readyToBeginRender;
  unsigned __int8 v7;

  atomic_store(a4, &self->_lastPresentationTime);
  atomic_store(0, (unint64_t *)&self->_skipRendersUntilTime);
  kdebug_trace();
  atomic_store(*(unint64_t *)&a3, (unint64_t *)&self->_lastFrameDuration);
  if ((_UIUpdateCycleEnabled() & 1) == 0)
  {
    p_readyToBeginRender = &self->_readyToBeginRender;
    do
      v7 = __ldaxr((unsigned __int8 *)p_readyToBeginRender);
    while (__stxr(1u, (unsigned __int8 *)p_readyToBeginRender));
    if ((v7 & 1) == 0)
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_canBeginRenderSemaphore);
  }
}

- (void)resumeLongRunningRendersAfterAllWorkIsDone
{
  NSObject *v1;
  _QWORD block[5];

  if (a1)
  {
    v1 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__PKMetalRendererController_resumeLongRunningRendersAfterAllWorkIsDone__block_invoke;
    block[3] = &unk_1E7776F38;
    block[4] = a1;
    dispatch_sync(v1, block);
  }
}

void __71__PKMetalRendererController_resumeLongRunningRendersAfterAllWorkIsDone__block_invoke(uint64_t a1)
{
  -[PKMetalRendererController resumeLongRunningRenders](*(_QWORD *)(a1 + 32));
}

- (void)setPresentationLayer:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(NSObject **)(a1 + 24);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __50__PKMetalRendererController_setPresentationLayer___block_invoke;
    v6[3] = &unk_1E7777440;
    v6[4] = a1;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

void __50__PKMetalRendererController_setPresentationLayer___block_invoke(uint64_t a1)
{
  uint64_t v2;
  unsigned int v3;
  NSObject *v4;
  void *v5;
  id v6;
  id WeakRetained;
  __int16 v8[8];

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2 || (v3 = atomic_load((unsigned int *)(v2 + 36))) == 0)
  {
    v4 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v8[0] = 0;
      _os_log_debug_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEBUG, "Set presentation layer.", (uint8_t *)v8, 2u);
    }

    +[PKRendererVSyncController sharedController]();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRendererVSyncController addRendererController:]((uint64_t)v5, *(void **)(a1 + 32));

    v6 = *(id *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 568));

    if (v6 != WeakRetained)
      objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 568), *(id *)(a1 + 40));
  }
}

- (CGImageRef)renderStrokesSync:(_OWORD *)a3 clippedToStrokeSpaceRect:(CGFloat)a4 strokeTransform:(CGFloat)a5 imageClipRect:(CGFloat)a6
{
  id v21;
  __int128 v22;
  CGImageRef v23;
  uint64_t v24;
  _OWORD v26[3];

  v21 = a2;
  if (a1)
  {
    v22 = a3[1];
    v26[0] = *a3;
    v26[1] = v22;
    v26[2] = a3[2];
    -[PKMetalRendererController _drawStrokesAfterClear:clippedToStrokeSpaceRect:strokeTransform:useLayerContext:progress:](a1, v21, v26, a4, a5, a6, a7, 0, 0);
    v23 = -[PKMetalRenderer newCGImageWithClipRect:](*(_QWORD *)(a1 + 592), a8, a9, a10, a11);
    v24 = *(_QWORD *)(a1 + 592);
    if (v24)
    {
    }
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (uint64_t)_drawStrokesAfterClear:(_OWORD *)a3 clippedToStrokeSpaceRect:(CGFloat)a4 strokeTransform:(CGFloat)a5 useLayerContext:(CGFloat)a6 progress:(CGFloat)a7
{
  id v16;
  id v17;
  NSObject *v19;
  id v20;
  __int128 v21;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  _OWORD v26[3];
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v16 = a2;
  v17 = a9;
  if (a1)
  {
    if (atomic_load((unsigned int *)(a1 + 36)))
    {
      a1 = 0;
    }
    else
    {
      v19 = os_log_create("com.apple.pencilkit", "Sketching");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v28 = objc_msgSend(v16, "count");
        _os_log_debug_impl(&dword_1BE213000, v19, OS_LOG_TYPE_DEBUG, "Draw clear and clipped commands %ld.", buf, 0xCu);
      }

      v20 = *(id *)(a1 + 592);
      v21 = a3[1];
      v26[0] = *a3;
      v26[1] = v21;
      v26[2] = a3[2];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __118__PKMetalRendererController__drawStrokesAfterClear_clippedToStrokeSpaceRect_strokeTransform_useLayerContext_progress___block_invoke;
      v23[3] = &unk_1E7779330;
      v24 = v17;
      v25 = a1;
      a1 = -[PKMetalRenderer clearAndRenderStrokes:clippedToStrokeSpaceRect:strokeTransform:stopBlock:]((uint64_t)v20, v16, v26, v23, a4, a5, a6, a7);

    }
  }

  return a1;
}

- (void)renderStrokes:(__int128 *)a3 clippedToStrokeSpaceRect:(void *)a4 strokeTransform:(double)a5 imageClipRect:(double)a6 completion:(double)a7
{
  id v23;
  id v24;
  void *v25;
  __int128 v26;
  _QWORD v27[5];
  id v28;
  double v29;
  double v30;
  double v31;
  double v32;
  __int128 v33[3];

  v23 = a2;
  v24 = a4;
  v25 = v24;
  if (a1)
  {
    v26 = a3[1];
    v33[0] = *a3;
    v33[1] = v26;
    v33[2] = a3[2];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __109__PKMetalRendererController_renderStrokes_clippedToStrokeSpaceRect_strokeTransform_imageClipRect_completion___block_invoke;
    v27[3] = &unk_1E77792E0;
    v27[4] = a1;
    v29 = a9;
    v30 = a10;
    v31 = a11;
    v32 = a12;
    v28 = v24;
    -[PKMetalRendererController _drawStrokesAfterClear:clippedToStrokeSpaceRect:strokeTransform:useLayerContext:renderCompletion:](a1, v23, v33, 0, v27, a5, a6, a7, a8);

  }
}

void __109__PKMetalRendererController_renderStrokes_clippedToStrokeSpaceRect_strokeTransform_imageClipRect_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  int v4;
  CGImage *v5;
  uint64_t v6;
  CGImage *v7;
  CGImageRef v8;
  CGImage *v9;
  uint64_t v10;

  if (!a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_13;
  }
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(unsigned __int8 *)(v3 + 493);
  v5 = -[PKMetalRenderer newCGImageWithClipRect:](*(_QWORD *)(v3 + 592), *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72));
  if (!v4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    if (!v5)
      goto LABEL_13;
    v9 = v5;
    goto LABEL_12;
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    v7 = *(CGImage **)(v6 + 592);
  else
    v7 = 0;
  v8 = -[PKMetalRenderer newSixChannelMultiplyCGImageWithClipRect:](v7, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (v5)
    CGImageRelease(v5);
  if (v8)
  {
    v9 = v8;
LABEL_12:
    CGImageRelease(v9);
  }
LABEL_13:
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 592);
  if (v10)
  {
  }
}

- (void)_drawStrokesAfterClear:(__int128 *)a3 clippedToStrokeSpaceRect:(char)a4 strokeTransform:(void *)a5 useLayerContext:(double)a6 renderCompletion:(double)a7
{
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  id v21;
  __int128 v22;
  id v23;
  _QWORD block[5];
  id v25;
  id v26;
  id v27;
  double v28;
  double v29;
  double v30;
  double v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  char v35;

  v17 = a2;
  v18 = a5;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", objc_msgSend(v17, "count"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __126__PKMetalRendererController__drawStrokesAfterClear_clippedToStrokeSpaceRect_strokeTransform_useLayerContext_renderCompletion___block_invoke;
    block[3] = &unk_1E7779308;
    block[4] = a1;
    v21 = v17;
    v28 = a6;
    v29 = a7;
    v30 = a8;
    v31 = a9;
    v22 = a3[1];
    v32 = *a3;
    v33 = v22;
    v34 = a3[2];
    v35 = a4;
    v25 = v21;
    v26 = v19;
    v27 = v18;
    v23 = v19;
    dispatch_async(v20, block);

  }
}

- (void)buildRenderCacheForStrokes:(uint64_t)a1
{
  id v3;

  v3 = a2;
  if (a1)
    -[PKMetalRenderer buildRenderCacheForStrokes:](*(_QWORD *)(a1 + 592), v3);

}

uint64_t __126__PKMetalRendererController__drawStrokesAfterClear_clippedToStrokeSpaceRect_strokeTransform_useLayerContext_renderCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  __int128 v9;
  _OWORD v11[3];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v5 = *(double *)(a1 + 64);
  v6 = *(double *)(a1 + 72);
  v7 = *(double *)(a1 + 80);
  v8 = *(double *)(a1 + 88);
  v9 = *(_OWORD *)(a1 + 112);
  v11[0] = *(_OWORD *)(a1 + 96);
  v11[1] = v9;
  v11[2] = *(_OWORD *)(a1 + 128);
  -[PKMetalRendererController _drawStrokesAfterClear:clippedToStrokeSpaceRect:strokeTransform:useLayerContext:progress:](v2, v3, v11, v5, v6, v7, v8, 0, v4);
  objc_msgSend(*(id *)(a1 + 40), "count");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

BOOL __118__PKMetalRendererController__drawStrokesAfterClear_clippedToStrokeSpaceRect_strokeTransform_useLayerContext_progress___block_invoke(uint64_t a1)
{
  uint64_t v2;
  signed int v3;

  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);
  v2 = *(_QWORD *)(a1 + 40);
  if (!v2)
    return 0;
  v3 = atomic_load((unsigned int *)(v2 + 32));
  return v3 > 0;
}

void __51__PKMetalRendererController_setSixChannelBlending___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  CGColor *v4;
  CGColor *v5;
  uint64_t *v6;
  _QWORD *v7;
  PKMetalRenderer *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  id *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CGImage *v23;
  id v24;
  _QWORD *v25;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v2 = *(_QWORD **)(v1 + 592);
    v24 = v2;
    if (v2)
    {
      v3 = v2[122];
      v4 = (CGColor *)v2[30];
    }
    else
    {
      v4 = 0;
      v3 = 0;
    }
    v5 = CGColorRetain(v4);
    v6 = (uint64_t *)(v1 + 592);

    v7 = *(_QWORD **)(v1 + 592);
    if (v7)
      v7 = (_QWORD *)v7[24];
    v25 = v7;
    v8 = [PKMetalRenderer alloc];
    v9 = *(double *)(v1 + 104);
    v10 = *(double *)(v1 + 112);
    v11 = *(double *)(v1 + 120);
    v12 = *(double *)(v1 + 128);
    if (v25)
      v13 = (void *)v25[54];
    else
      v13 = 0;
    v14 = v13;
    v15 = -[PKMetalRenderer initWithDrawingPixelSize:actualSize:device:resourceHandler:sixChannelBlending:pixelFormat:]((id *)&v8->super.isa, v14, v25, *(_BYTE *)(v1 + 493), *(void **)(v1 + 504), v9, v10, v11, v12);
    objc_storeStrong((id *)(v1 + 592), v15);

    if (*v6)
    {
      *(_QWORD *)(*v6 + 976) = v3;
      v16 = *v6;
    }
    else
    {
      v16 = 0;
    }
    -[PKMetalRenderer setBackgroundColor:](v16, (uint64_t)v5);
    -[PKMetalRenderer setLinedPaper:](*(_QWORD *)(v1 + 592), *(void **)(v1 + 536));
    v17 = *(_QWORD *)(v1 + 592);
    if (!v17)
      goto LABEL_24;
    v18 = *(unsigned __int8 *)(v1 + 490);
    if (*(unsigned __int8 *)(v17 + 932) != v18)
    {
      *(_BYTE *)(v17 + 932) = v18;
      v17 = *v6;
      if (!*v6)
        goto LABEL_24;
    }
    *(_OWORD *)(v17 + 1024) = *(_OWORD *)(v1 + 608);
    v19 = *(_QWORD *)(v1 + 592);
    if (v19
      && (*(_BYTE *)(v19 + 931) = *(_BYTE *)(v1 + 491), (v20 = *(_QWORD *)(v1 + 592)) != 0)
      && (*(_BYTE *)(v20 + 934) = *(_BYTE *)(v1 + 492), (v21 = *(_QWORD *)(v1 + 592)) != 0))
    {
      *(_BYTE *)(v21 + 935) = *(_BYTE *)(v1 + 494);
      v22 = *v6;
    }
    else
    {
LABEL_24:
      v22 = 0;
    }
    v23 = *(CGImage **)(v1 + 336);
    if (v23)
      -[PKMetalRenderer setPaperTextureImage:](v22, v23);
    CGColorRelease(v5);

  }
}

uint64_t __53__PKMetalRendererController_setDrawBitmapEraserMask___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (v1)
  {
    v2 = *(_QWORD *)(v1 + 592);
    if (v2)
      *(_BYTE *)(v2 + 935) = *(_BYTE *)(result + 40);
  }
  return result;
}

- (void)setPreviewStrokeAlpha:(uint64_t)a1
{
  NSObject *v2;
  _QWORD v3[6];

  if (a1)
  {
    if (vabdd_f64(*(double *)(a1 + 584), a2) >= 0.00999999978)
    {
      *(double *)(a1 + 584) = a2;
      v2 = *(NSObject **)(a1 + 24);
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __51__PKMetalRendererController_setPreviewStrokeAlpha___block_invoke;
      v3[3] = &unk_1E7779358;
      v3[4] = a1;
      *(double *)&v3[5] = a2;
      dispatch_async(v2, v3);
    }
  }
}

double __51__PKMetalRendererController_setPreviewStrokeAlpha___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  double result;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v2 = *(_QWORD *)(v1 + 592);
    if (v2)
    {
      result = *(double *)(a1 + 40);
      *(double *)(v2 + 1000) = result;
    }
  }
  return result;
}

- (void)setPreviewStrokeMaxPoints:(uint64_t)a1
{
  NSObject *v2;
  _QWORD v3[6];

  if (a1)
  {
    if (*(_QWORD *)(a1 + 576) != a2)
    {
      *(_QWORD *)(a1 + 576) = a2;
      v2 = *(NSObject **)(a1 + 24);
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __55__PKMetalRendererController_setPreviewStrokeMaxPoints___block_invoke;
      v3[3] = &unk_1E7779358;
      v3[4] = a1;
      v3[5] = a2;
      dispatch_async(v2, v3);
    }
  }
}

double __55__PKMetalRendererController_setPreviewStrokeMaxPoints___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  double result;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v2 = *(_QWORD *)(v1 + 592);
    if (v2)
    {
      result = (double)*(unint64_t *)(a1 + 40);
      *(double *)(v2 + 1008) = result;
    }
  }
  return result;
}

- (void)setLiveStrokeMode:(uint64_t)a1
{
  NSObject *v2;
  _QWORD v3[5];
  char v4;

  if (a1)
  {
    if (*(unsigned __int8 *)(a1 + 490) != a2)
    {
      *(_BYTE *)(a1 + 490) = a2;
      v2 = *(NSObject **)(a1 + 24);
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __47__PKMetalRendererController_setLiveStrokeMode___block_invoke;
      v3[3] = &unk_1E7778538;
      v3[4] = a1;
      v4 = a2;
      dispatch_async(v2, v3);
    }
  }
}

uint64_t __47__PKMetalRendererController_setLiveStrokeMode___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;

  v1 = *(_QWORD *)(result + 32);
  if (v1)
  {
    v2 = *(_QWORD *)(v1 + 592);
    if (v2)
    {
      v3 = *(unsigned __int8 *)(result + 40);
      if (*(unsigned __int8 *)(v2 + 932) != v3)
        *(_BYTE *)(v2 + 932) = v3;
    }
  }
  return result;
}

- (void)setLiveStrokeMaxSize:(double)a3
{
  NSObject *v4;
  _QWORD block[7];

  if (a1)
  {
    if (*(double *)(a1 + 608) != a2 || *(double *)(a1 + 616) != a3)
    {
      *(double *)(a1 + 608) = a2;
      *(double *)(a1 + 616) = a3;
      v4 = *(NSObject **)(a1 + 24);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __50__PKMetalRendererController_setLiveStrokeMaxSize___block_invoke;
      block[3] = &unk_1E77771C0;
      block[4] = a1;
      *(double *)&block[5] = a2;
      *(double *)&block[6] = a3;
      dispatch_async(v4, block);
    }
  }
}

__n128 __50__PKMetalRendererController_setLiveStrokeMaxSize___block_invoke(uint64_t a1)
{
  uint64_t v1;
  __n128 *v2;
  __n128 result;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v2 = *(__n128 **)(v1 + 592);
    if (v2)
    {
      result = *(__n128 *)(a1 + 40);
      v2[64] = result;
    }
  }
  return result;
}

- (void)setFadeOutStrokesMode:(uint64_t)a1
{
  NSObject *v2;
  _QWORD v3[5];
  char v4;

  if (a1)
  {
    if (*(unsigned __int8 *)(a1 + 491) != a2)
    {
      *(_BYTE *)(a1 + 491) = a2;
      v2 = *(NSObject **)(a1 + 24);
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __51__PKMetalRendererController_setFadeOutStrokesMode___block_invoke;
      v3[3] = &unk_1E7778538;
      v3[4] = a1;
      v4 = a2;
      dispatch_async(v2, v3);
    }
  }
}

uint64_t __51__PKMetalRendererController_setFadeOutStrokesMode___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (v1)
  {
    v2 = *(_QWORD *)(v1 + 592);
    if (v2)
      *(_BYTE *)(v2 + 931) = *(_BYTE *)(result + 40);
  }
  return result;
}

- (void)setLiveStrokeStrokes:(double)a3 animationBounds:(double)a4
{
  id v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v11 = a2;
  v12 = v11;
  if (a1)
  {
    v13 = *(NSObject **)(a1 + 24);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __66__PKMetalRendererController_setLiveStrokeStrokes_animationBounds___block_invoke;
    v14[3] = &unk_1E7779380;
    v14[4] = a1;
    v15 = v11;
    v16 = a3;
    v17 = a4;
    v18 = a5;
    v19 = a6;
    dispatch_async(v13, v14);

  }
}

__n128 __66__PKMetalRendererController_setLiveStrokeStrokes_animationBounds___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  __n128 result;
  __int128 v7;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 416);
  *(_QWORD *)(v3 + 416) = v2;

  v5 = *(_QWORD *)(a1 + 32) + 424;
  result = *(__n128 *)(a1 + 48);
  v7 = *(_OWORD *)(a1 + 64);
  *(__n128 *)v5 = result;
  *(_OWORD *)(v5 + 16) = v7;
  return result;
}

- (void)liveStrokeParticlesToFrame:(double)a3 strokes:(double)a4 startTime:(double)a5 duration:(double)a6
{
  id v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;

  v15 = a2;
  v16 = v15;
  if (a1)
  {
    v17 = *(NSObject **)(a1 + 24);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __83__PKMetalRendererController_liveStrokeParticlesToFrame_strokes_startTime_duration___block_invoke;
    v18[3] = &unk_1E77793A8;
    v21 = a3;
    v22 = a4;
    v23 = a5;
    v24 = a6;
    v19 = v15;
    v20 = a1;
    v25 = a7;
    v26 = a8;
    dispatch_async(v17, v18);

  }
}

void __83__PKMetalRendererController_liveStrokeParticlesToFrame_strokes_startTime_duration___block_invoke(uint64_t a1)
{
  double x;
  double y;
  double width;
  double height;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  size_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  char *v27;
  char **v28;
  char *v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  _QWORD *v39;
  char *v40;
  uint64_t v41;
  char *v42;
  char *v43;
  char *v44;
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t k;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  uint64_t v57;
  float v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  id obj;
  uint64_t v64;
  uint64_t v65;
  uint64_t j;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE *v71;
  char *v72;
  char *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  void **v78;
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;

  v81 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v6 = *(id *)(a1 + 32);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v74, v80, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v75;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v75 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
          objc_msgSend(v10, "_pointsCount");
          objc_msgSend(v10, "_bounds");
          v84.origin.x = v11;
          v84.origin.y = v12;
          v84.size.width = v13;
          v84.size.height = v14;
          v82.origin.x = x;
          v82.origin.y = y;
          v82.size.width = width;
          v82.size.height = height;
          v83 = CGRectUnion(v82, v84);
          x = v83.origin.x;
          y = v83.origin.y;
          width = v83.size.width;
          height = v83.size.height;
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v74, v80, 16);
      }
      while (v7);
    }

    v71 = 0;
    v72 = 0;
    v73 = 0;
    v15 = objc_msgSend(*(id *)(a1 + 32), "count");
    v16 = v15;
    if (v15)
    {
      if (0xAAAAAAAAAAAAAAABLL * ((v73 - v72) >> 3) >= v15)
      {
        bzero(v72, 24 * ((24 * v15 - 24) / 0x18) + 24);
        v72 = (char *)(24 * ((24 * v16 - 24) / 0x18) + 24);
      }
      else
      {
        if (v15 > 0xAAAAAAAAAAAAAAALL)
          std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
        v17 = 0x5555555555555556 * ((v73 - v71) >> 3);
        if (v17 <= v15)
          v17 = v15;
        if (0xAAAAAAAAAAAAAAABLL * ((v73 - v71) >> 3) >= 0x555555555555555)
          v18 = 0xAAAAAAAAAAAAAAALL;
        else
          v18 = v17;
        if (v18 > 0xAAAAAAAAAAAAAAALL)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v19 = (char *)operator new(24 * v18);
        v20 = 24 * ((24 * v16 - 24) / 0x18) + 24;
        bzero(v19, v20);
        v71 = v19;
        v72 = &v19[v20];
        v73 = &v19[24 * v18];
      }
    }
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    obj = *(id *)(a1 + 32);
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
    if (v21)
    {
      v22 = 0;
      v64 = *(_QWORD *)v68;
      do
      {
        v65 = v21;
        for (j = 0; j != v65; ++j)
        {
          if (*(_QWORD *)v68 != v64)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * j);
          v24 = (uint64_t)v71;
          v25 = objc_msgSend(v23, "_pointsCount");
          v26 = (_QWORD *)(v24 + 24 * v22);
          v28 = (char **)(v26 + 1);
          v27 = (char *)v26[1];
          v29 = (char *)*v26;
          v30 = (uint64_t)&v27[-*v26] >> 3;
          if (v25 <= v30)
          {
            if (v25 >= v30)
              goto LABEL_43;
            v47 = &v29[8 * v25];
            goto LABEL_42;
          }
          v31 = v24 + 24 * v22;
          v32 = v25 - v30;
          v35 = *(_QWORD *)(v31 + 16);
          v34 = v31 + 16;
          v33 = v35;
          if (v25 - v30 <= (v35 - (uint64_t)v27) >> 3)
          {
            bzero(v27, 8 * v32);
            v47 = &v27[8 * v32];
LABEL_42:
            *v28 = v47;
            goto LABEL_43;
          }
          if (v25 >> 61)
            std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
          v36 = v33 - (_QWORD)v29;
          v37 = v36 >> 2;
          if (v36 >> 2 <= v25)
            v37 = v25;
          if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFF8)
            v38 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v38 = v37;
          v39 = (_QWORD *)v34;
          v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v34, v38);
          v62 = v41;
          v61 = v40;
          v42 = &v40[8 * v30];
          bzero(v42, 8 * v32);
          v43 = *v28;
          v44 = (char *)*v26;
          v45 = v42;
          if (*v28 != (char *)*v26)
          {
            do
            {
              v46 = *((_QWORD *)v43 - 1);
              v43 -= 8;
              *((_QWORD *)v45 - 1) = v46;
              v45 -= 8;
            }
            while (v43 != v44);
            v43 = (char *)*v26;
          }
          *v26 = v45;
          *v28 = &v42[8 * v32];
          *v39 = &v61[8 * v62];
          if (v43)
            operator delete(v43);
LABEL_43:
          v48 = objc_msgSend(v23, "_pointsCount", v61, v62);
          if (v48)
          {
            for (k = 0; k != v48; ++k)
            {
              objc_msgSend(v23, "_locationAtIndex:", k);
              v52 = *(double *)(a1 + 48) + *(double *)(a1 + 64) * ((v50 - x) / width);
              v53 = *(double *)(a1 + 56) + *(double *)(a1 + 72) * ((v51 - y) / height);
              v54 = v52 - v50;
              v55 = v53 - v51;
              v56 = sqrt(v55 * v55 + v54 * v54);
              if (v56 > 100.0)
              {
                v52 = v50 + v54 * (1.0 / v56) * 100.0;
                v53 = v51 + v55 * (1.0 / v56) * 100.0;
              }
              *(float *)&v57 = v52;
              v58 = v53;
              *((float *)&v57 + 1) = v58;
              *(_QWORD *)(*(_QWORD *)&v71[24 * v22] + 8 * k) = v57;
            }
          }
          ++v22;
        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
      }
      while (v21);
    }

    v59 = *(_QWORD *)(a1 + 40);
    if (v59)
      v60 = *(_QWORD *)(v59 + 592);
    else
      v60 = 0;
    -[PKMetalRenderer generateLiveStrokeCachesForStrokes:destinationLocations:startTime:duration:](v60, *(void **)(a1 + 32), (uint64_t *)&v71, *(double *)(a1 + 80), *(double *)(a1 + 88));
    v78 = (void **)&v71;
    std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v78);
  }
}

- (void)setLiveStrokeElapsedTime:(uint64_t)a1
{
  NSObject *v2;
  _QWORD v3[6];

  if (a1)
  {
    if (*(double *)(a1 + 544) != a2)
    {
      *(double *)(a1 + 544) = a2;
      v2 = *(NSObject **)(a1 + 24);
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __54__PKMetalRendererController_setLiveStrokeElapsedTime___block_invoke;
      v3[3] = &unk_1E7779358;
      v3[4] = a1;
      *(double *)&v3[5] = a2;
      dispatch_async(v2, v3);
    }
  }
}

double __54__PKMetalRendererController_setLiveStrokeElapsedTime___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  double result;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v2 = *(_QWORD *)(v1 + 592);
    if (v2)
    {
      result = *(double *)(a1 + 40);
      *(double *)(v2 + 1016) = result;
    }
  }
  return result;
}

- (void)setResourceCacheSize:(uint64_t)a1
{
  NSObject *v2;
  _QWORD v3[6];

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 24);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __50__PKMetalRendererController_setResourceCacheSize___block_invoke;
    v3[3] = &unk_1E7779358;
    v3[4] = a1;
    v3[5] = a2;
    dispatch_async(v2, v3);
  }
}

void __50__PKMetalRendererController_setResourceCacheSize___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  id *v3;
  uint64_t v4;
  _QWORD *v5;
  id *v6;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
  {
    v2 = (_QWORD *)v2[74];
    if (v2)
      v2 = (_QWORD *)v2[24];
  }
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  -[PKMetalResourceHandler strokeRenderCache](v3);
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v5[8] = v4;

}

- (void)purgeRenderCachesForStrokes:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = (void *)objc_msgSend(v3, "copy");
    v6 = *(NSObject **)(a1 + 24);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __57__PKMetalRendererController_purgeRenderCachesForStrokes___block_invoke;
    v8[3] = &unk_1E7777440;
    v8[4] = a1;
    v9 = v5;
    v7 = v5;
    dispatch_async(v6, v8);

  }
}

void __57__PKMetalRendererController_purgeRenderCachesForStrokes___block_invoke(uint64_t a1)
{
  -[PKMetalRenderer purgeRenderCachesForStrokes:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 592), *(void **)(a1 + 40));
}

- (void)setPaperTextureImage:(uint64_t)a1
{
  CGImageRef v3;
  NSObject *v4;
  _QWORD v5[6];

  if (a1)
  {
    v3 = CGImageRetain(image);
    v4 = *(NSObject **)(a1 + 24);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __50__PKMetalRendererController_setPaperTextureImage___block_invoke;
    v5[3] = &unk_1E7779358;
    v5[4] = a1;
    v5[5] = v3;
    dispatch_async(v4, v5);
  }
}

void __50__PKMetalRendererController_setPaperTextureImage___block_invoke(uint64_t a1)
{
  uint64_t v2;
  unsigned int v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[16];

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2 || (v3 = atomic_load((unsigned int *)(v2 + 36))) == 0)
  {
    v4 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_debug_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEBUG, "Set background image", v7, 2u);
    }

    CGImageRelease(*(CGImageRef *)(*(_QWORD *)(a1 + 32) + 336));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 336) = CGImageRetain(*(CGImageRef *)(a1 + 40));
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      v6 = *(_QWORD *)(v5 + 592);
    else
      v6 = 0;
    -[PKMetalRenderer setPaperTextureImage:](v6, *(CGImage **)(a1 + 40));
  }
  CGImageRelease(*(CGImageRef *)(a1 + 40));
}

void __48__PKMetalRendererController_setBackgroundColor___block_invoke(uint64_t a1)
{
  uint64_t v2;
  unsigned int v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[16];

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2 || (v3 = atomic_load((unsigned int *)(v2 + 36))) == 0)
  {
    v4 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_debug_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEBUG, "Set background color", v7, 2u);
    }

    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      v6 = *(_QWORD *)(v5 + 592);
    else
      v6 = 0;
    -[PKMetalRenderer setBackgroundColor:](v6, *(_QWORD *)(a1 + 40));
  }
  CGColorRelease(*(CGColorRef *)(a1 + 40));
}

- (void)setLiveRenderingOverrideColor:(uint64_t)a1
{
  CGColorRef v3;
  NSObject *v4;
  _QWORD v5[6];

  if (a1)
  {
    v3 = CGColorRetain(color);
    v4 = *(NSObject **)(a1 + 24);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __59__PKMetalRendererController_setLiveRenderingOverrideColor___block_invoke;
    v5[3] = &unk_1E7779358;
    v5[4] = a1;
    v5[5] = v3;
    dispatch_async(v4, v5);
  }
}

void __59__PKMetalRendererController_setLiveRenderingOverrideColor___block_invoke(uint64_t a1)
{
  uint64_t v2;
  unsigned int v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[16];

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2 || (v3 = atomic_load((unsigned int *)(v2 + 36))) == 0)
  {
    v4 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_debug_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEBUG, "Set live rendering override color", v7, 2u);
    }

    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      v6 = *(_QWORD *)(v5 + 592);
    else
      v6 = 0;
    -[PKMetalRenderer setLiveRenderingOverrideColor:](v6, *(CGColorRef *)(a1 + 40));
  }
  CGColorRelease(*(CGColorRef *)(a1 + 40));
}

- (__n128)setStrokeTransform:(uint64_t)a1
{
  __int128 v2;
  __int128 v3;
  NSObject *v4;
  __int128 v5;
  __n128 result;
  _QWORD block[5];
  __int128 v8;
  __int128 v9;
  __int128 v10;

  if (a1)
  {
    v2 = *a2;
    v3 = a2[2];
    *(_OWORD *)(a1 + 672) = a2[1];
    *(_OWORD *)(a1 + 688) = v3;
    *(_OWORD *)(a1 + 656) = v2;
    v4 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__PKMetalRendererController_setStrokeTransform___block_invoke;
    block[3] = &unk_1E77770D0;
    block[4] = a1;
    v5 = a2[1];
    v8 = *a2;
    v9 = v5;
    v10 = a2[2];
    dispatch_async(v4, block);
  }
  return result;
}

double __48__PKMetalRendererController_setStrokeTransform___block_invoke(uint64_t a1)
{
  _OWORD *v1;
  __int128 v2;
  __int128 v3;
  uint64_t v4;
  __int128 v6;
  __n128 v7;
  _OWORD v9[2];
  __int128 v10;

  v1 = (_OWORD *)(*(_QWORD *)(a1 + 32) + 360);
  v2 = *(_OWORD *)(a1 + 40);
  v3 = *(_OWORD *)(a1 + 72);
  v1[1] = *(_OWORD *)(a1 + 56);
  v1[2] = v3;
  *v1 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (!v4)
    goto LABEL_4;
  if (!atomic_load((unsigned int *)(v4 + 36)))
  {
    v4 = *(_QWORD *)(a1 + 32);
LABEL_4:
    v6 = *(_OWORD *)(a1 + 56);
    v9[0] = *(_OWORD *)(a1 + 40);
    v9[1] = v6;
    v10 = *(_OWORD *)(a1 + 72);
    v7.n128_u64[1] = *((_QWORD *)&v10 + 1);
    v7.n128_u64[0] = *(_QWORD *)(v4 + 344);
    *(_QWORD *)&v2 = -[PKMetalRendererController _updateRendererStrokeTransformWithTransform:offset:](v4, v9, v7, *(double *)(v4 + 352)).n128_u64[0];
  }
  return *(double *)&v2;
}

- (__n128)_updateRendererStrokeTransformWithTransform:(__n128)result offset:(double)a4
{
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  CGAffineTransform v10;
  CGAffineTransform t1;
  CGAffineTransform v12;

  if (a1)
  {
    CGAffineTransformMakeTranslation(&t1, -result.n128_f64[0], -a4);
    v6 = a2[1];
    *(_OWORD *)&v10.a = *a2;
    *(_OWORD *)&v10.c = v6;
    *(_OWORD *)&v10.tx = a2[2];
    CGAffineTransformConcat(&v12, &t1, &v10);
    v7 = *(_OWORD *)&v12.c;
    *a2 = *(_OWORD *)&v12.a;
    a2[1] = v7;
    result.n128_u64[0] = *(_QWORD *)&v12.tx;
    a2[2] = *(_OWORD *)&v12.tx;
    v8 = *(_QWORD *)(a1 + 592);
    if (v8)
    {
      result = *(__n128 *)a2;
      v9 = a2[2];
      *(_OWORD *)(v8 + 288) = a2[1];
      *(_OWORD *)(v8 + 304) = v9;
      *(__n128 *)(v8 + 272) = result;
    }
  }
  return result;
}

- (void)setContentZoomScale:(uint64_t)a1
{
  NSObject *v2;
  _QWORD v3[6];

  if (a1)
  {
    *(double *)(a1 + 520) = a2;
    v2 = *(NSObject **)(a1 + 24);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __49__PKMetalRendererController_setContentZoomScale___block_invoke;
    v3[3] = &unk_1E7779358;
    v3[4] = a1;
    *(double *)&v3[5] = a2;
    dispatch_async(v2, v3);
  }
}

double __49__PKMetalRendererController_setContentZoomScale___block_invoke(uint64_t a1)
{
  uint64_t v1;
  double result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 592);
  if (v1)
  {
    result = *(double *)(a1 + 40);
    *(double *)(v1 + 968) = result;
  }
  return result;
}

- (void)setLinedPaper:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = objc_msgSend(v3, "copy");
    v6 = *(void **)(a1 + 536);
    *(_QWORD *)(a1 + 536) = v5;

    v7 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__PKMetalRendererController_setLinedPaper___block_invoke;
    block[3] = &unk_1E7776F38;
    block[4] = a1;
    dispatch_async(v7, block);
  }

}

void __43__PKMetalRendererController_setLinedPaper___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(_QWORD *)(v1 + 592);
  else
    v2 = 0;
  -[PKMetalRenderer setLinedPaper:](v2, *(void **)(v1 + 536));
}

- (__n128)setPaperTransform:(uint64_t)a1
{
  __int128 v2;
  __int128 v3;
  NSObject *v4;
  __int128 v5;
  __n128 result;
  _QWORD block[5];
  __int128 v8;
  __int128 v9;
  __int128 v10;

  if (a1)
  {
    v2 = *a2;
    v3 = a2[2];
    *(_OWORD *)(a1 + 720) = a2[1];
    *(_OWORD *)(a1 + 736) = v3;
    *(_OWORD *)(a1 + 704) = v2;
    v4 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__PKMetalRendererController_setPaperTransform___block_invoke;
    block[3] = &unk_1E77770D0;
    block[4] = a1;
    v5 = a2[1];
    v8 = *a2;
    v9 = v5;
    v10 = a2[2];
    dispatch_async(v4, block);
  }
  return result;
}

__n128 __47__PKMetalRendererController_setPaperTransform___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  __n128 result;
  __int128 v6;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    if (!atomic_load((unsigned int *)(v1 + 36)))
    {
      v3 = *(_QWORD *)(a1 + 32);
      if (v3)
      {
        v4 = *(_QWORD *)(v3 + 592);
        if (v4)
        {
          result = *(__n128 *)(a1 + 40);
          v6 = *(_OWORD *)(a1 + 56);
          *(_OWORD *)(v4 + 1072) = *(_OWORD *)(a1 + 72);
          *(_OWORD *)(v4 + 1056) = v6;
          *(__n128 *)(v4 + 1040) = result;
        }
      }
    }
  }
  return result;
}

- (void)setViewScissor:(double)a3
{
  NSObject *v5;
  _QWORD block[9];

  if (a1)
  {
    *(double *)(a1 + 624) = a2;
    *(double *)(a1 + 632) = a3;
    *(double *)(a1 + 640) = a4;
    *(double *)(a1 + 648) = a5;
    v5 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__PKMetalRendererController_setViewScissor___block_invoke;
    block[3] = &unk_1E77792B8;
    block[4] = a1;
    *(double *)&block[5] = a2;
    *(double *)&block[6] = a3;
    *(double *)&block[7] = a4;
    *(double *)&block[8] = a5;
    dispatch_async(v5, block);
  }
}

BOOL __44__PKMetalRendererController_setViewScissor___block_invoke(_BOOL8 result)
{
  uint64_t v1;
  uint64_t v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  uint64_t v8;

  v1 = *(_QWORD *)(result + 32);
  if (!v1)
    return -[PKMetalRenderer setViewScissor:](0, *(CGFloat *)(result + 40), *(CGFloat *)(result + 48), *(CGFloat *)(result + 56), *(CGFloat *)(result + 64));
  if (!atomic_load((unsigned int *)(v1 + 36)))
  {
    v3 = *(_QWORD *)(result + 32);
    v4 = *(double *)(result + 40);
    v5 = *(double *)(result + 48);
    v6 = *(double *)(result + 56);
    v7 = *(double *)(result + 64);
    if (v3)
      v8 = *(_QWORD *)(v3 + 592);
    else
      v8 = 0;
    return -[PKMetalRenderer setViewScissor:](v8, v4, v5, v6, v7);
  }
  return result;
}

- (void)setBackboardPaperMultiply:(uint64_t)a1
{
  NSObject *v2;
  _QWORD v3[6];

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 24);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __55__PKMetalRendererController_setBackboardPaperMultiply___block_invoke;
    v3[3] = &unk_1E7779358;
    v3[4] = a1;
    *(double *)&v3[5] = a2;
    dispatch_async(v2, v3);
  }
}

double __55__PKMetalRendererController_setBackboardPaperMultiply___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  double result;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    if (!atomic_load((unsigned int *)(v1 + 36)))
    {
      v3 = *(_QWORD *)(a1 + 32);
      if (v3)
      {
        v4 = *(_QWORD *)(v3 + 592);
        if (v4)
        {
          result = *(double *)(a1 + 40);
          *(double *)(v4 + 976) = result;
        }
      }
    }
  }
  return result;
}

- (void)setCombineStrokesAllowed:(uint64_t)a1
{
  NSObject *v2;
  _QWORD v3[5];
  char v4;

  if (a1)
  {
    *(_BYTE *)(a1 + 495) = a2;
    v2 = *(NSObject **)(a1 + 24);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __54__PKMetalRendererController_setCombineStrokesAllowed___block_invoke;
    v3[3] = &unk_1E7778538;
    v3[4] = a1;
    v4 = a2;
    dispatch_async(v2, v3);
  }
}

double __54__PKMetalRendererController_setCombineStrokesAllowed___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  double result;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(_QWORD *)(v2 + 592);
  else
    v3 = 0;
  *(_QWORD *)&result = -[PKMetalRenderer setCombineStrokesAllowed:](v3, v1 != 0).n128_u64[0];
  return result;
}

- (void)setIsPDFCanvasForAnalytics:(uint64_t)a1
{
  NSObject *v2;
  _QWORD v3[5];
  char v4;

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 24);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __56__PKMetalRendererController_setIsPDFCanvasForAnalytics___block_invoke;
    v3[3] = &unk_1E7778538;
    v3[4] = a1;
    v4 = a2;
    dispatch_async(v2, v3);
  }
}

uint64_t __56__PKMetalRendererController_setIsPDFCanvasForAnalytics___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 488) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)drawStrokes:(void *)a3 intoTile:(uint64_t)a4 renderCount:(char)a5 offscreen:
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  _BOOL8 v13;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v9 = a2;
  v10 = a3;
  v11 = v10;
  if (a1)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    v12 = *(NSObject **)(a1 + 24);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __72__PKMetalRendererController_drawStrokes_intoTile_renderCount_offscreen___block_invoke;
    v15[3] = &unk_1E77793F8;
    v15[4] = a1;
    v16 = v10;
    v19 = a4;
    v17 = v9;
    v18 = &v21;
    v20 = a5;
    dispatch_sync(v12, v15);
    v13 = *((_BYTE *)v22 + 24) != 0;

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __72__PKMetalRendererController_drawStrokes_intoTile_renderCount_offscreen___block_invoke(uint64_t a1)
{
  uint64_t v2;
  unsigned int v3;
  unint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (!v2 || (v3 = atomic_load((unsigned int *)(v2 + 36))) == 0)
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
    {
      if ((*(_BYTE *)(v4 + 83) & 1) != 0)
        return;
      v4 = atomic_load((unint64_t *)(v4 + 16));
    }
    if (v4 == *(_QWORD *)(a1 + 64))
    {
      v5 = os_log_create("com.apple.pencilkit", "Sketching");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v20 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v25 = v20;
        _os_log_debug_impl(&dword_1BE213000, v5, OS_LOG_TYPE_DEBUG, "Draw tile %@.", buf, 0xCu);
      }

      v6 = objc_msgSend(*(id *)(a1 + 48), "count");
      v7 = *(_QWORD **)(a1 + 32);
      if (v6)
      {
        if (v7)
          v7 = (_QWORD *)v7[74];
        v8 = v7;
        v9 = *(unsigned __int8 *)(a1 + 72);
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __72__PKMetalRendererController_drawStrokes_intoTile_renderCount_offscreen___block_invoke_29;
        v21[3] = &unk_1E77793D0;
        v10 = *(void **)(a1 + 40);
        v11 = *(void **)(a1 + 48);
        v21[4] = *(_QWORD *)(a1 + 32);
        v12 = v10;
        v13 = *(_QWORD *)(a1 + 64);
        v22 = v12;
        v23 = v13;
        -[PKMetalRenderer updateTile:strokes:clear:waitUntilCompleted:offscreen:stopBlock:]((uint64_t)v8, v12, v11, 1, 1, v9, v21);

        v14 = *(_QWORD *)(a1 + 32);
        if (v14)
          v15 = *(_QWORD *)(v14 + 592);
        else
          v15 = 0;
        -[PKMetalRenderer purgeOriginalBackFramebuffer](v15);
        v16 = *(_QWORD *)(a1 + 32);
        if (v16)
        {
          v17 = atomic_load((unsigned int *)(v16 + 32));
          if (v17 > 0)
            goto LABEL_21;
        }
        v18 = *(_QWORD *)(a1 + 40);
        if (v18)
        {
          if ((*(_BYTE *)(v18 + 83) & 1) != 0)
          {
LABEL_21:

            return;
          }
          v18 = atomic_load((unint64_t *)(v18 + 16));
        }
        if (v18 == *(_QWORD *)(a1 + 64))
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
        goto LABEL_21;
      }
      if (v7)
        v19 = v7[74];
      else
        v19 = 0;
      -[PKMetalRenderer clearTile:waitUntilCompleted:](v19, *(void **)(a1 + 40));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    }
  }
}

uint64_t __72__PKMetalRendererController_drawStrokes_intoTile_renderCount_offscreen___block_invoke_29(_QWORD *a1)
{
  uint64_t v1;
  int v2;
  unint64_t v3;

  v1 = a1[4];
  if (!v1 || (v2 = atomic_load((unsigned int *)(v1 + 32)), v2 <= 0))
  {
    v3 = a1[5];
    if (!v3)
      return v3 != a1[6];
    if ((*(_BYTE *)(v3 + 83) & 1) == 0)
    {
      v3 = atomic_load((unint64_t *)(v3 + 16));
      return v3 != a1[6];
    }
  }
  return 1;
}

- (void)updateTiles:(void *)a3 withNewStrokes:(void *)a4 completionBlock:
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = *(NSObject **)(a1 + 24);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __72__PKMetalRendererController_updateTiles_withNewStrokes_completionBlock___block_invoke;
    v11[3] = &unk_1E77773A0;
    v12 = v7;
    v13 = a1;
    v14 = v8;
    v15 = v9;
    dispatch_async(v10, v11);

  }
}

void __72__PKMetalRendererController_updateTiles_withNewStrokes_completionBlock___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v5);
        objc_msgSend(*(id *)(a1 + 32), "lastObject", (_QWORD)v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        -[PKMetalRenderer updateTile:strokes:clear:waitUntilCompleted:offscreen:stopBlock:](*(_QWORD *)(*(_QWORD *)(a1 + 40) + 592), v6, *(void **)(a1 + 48), 0, v6 == v7, 0, 0);
        v8 = *(_QWORD *)(a1 + 56);
        if (v8 && v6 == v7)
          (*(void (**)(void))(v8 + 16))();
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v3);
  }

}

- (void)renderImageTexture:(__int128 *)a3 imageTextureTransform:(void *)a4 withTiles:(__int128 *)a5 tileTransform:
{
  id v9;
  NSObject *v10;
  __int128 v11;
  __int128 v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;

  v13 = a2;
  v9 = a4;
  if (a1)
  {
    v10 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __94__PKMetalRendererController_renderImageTexture_imageTextureTransform_withTiles_tileTransform___block_invoke;
    block[3] = &unk_1E7779420;
    block[4] = a1;
    v15 = v13;
    v11 = a3[1];
    v17 = *a3;
    v18 = v11;
    v19 = a3[2];
    v16 = v9;
    v12 = a5[1];
    v20 = *a5;
    v21 = v12;
    v22 = a5[2];
    dispatch_sync(v10, block);

  }
}

void __94__PKMetalRendererController_renderImageTexture_imageTextureTransform_withTiles_tileTransform___block_invoke(uint64_t a1)
{
  uint64_t v2;
  unsigned int v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  void *v8;
  void *v9;
  __int128 v10;
  _OWORD v11[3];
  __int128 v12[3];
  uint8_t buf[16];

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2 || (v3 = atomic_load((unsigned int *)(v2 + 36))) == 0)
  {
    v4 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEBUG, "Render tiles.", buf, 2u);
    }

    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      v6 = *(_QWORD *)(v5 + 592);
    else
      v6 = 0;
    v7 = *(_OWORD *)(a1 + 72);
    v12[0] = *(_OWORD *)(a1 + 56);
    v12[1] = v7;
    v12[2] = *(_OWORD *)(a1 + 88);
    v8 = *(void **)(a1 + 40);
    v9 = *(void **)(a1 + 48);
    v10 = *(_OWORD *)(a1 + 120);
    v11[0] = *(_OWORD *)(a1 + 104);
    v11[1] = v10;
    v11[2] = *(_OWORD *)(a1 + 136);
    -[PKMetalRenderer renderImageTexture:imageTextureTransform:withTiles:tileTransform:waitUntilCompleted:](v6, v8, v12, v9, v11, 1);
  }
}

- (void)renderTilesIntoTiles:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(NSObject **)(a1 + 24);
    block[1] = 3221225472;
    block[2] = __50__PKMetalRendererController_renderTilesIntoTiles___block_invoke;
    block[3] = &unk_1E7777440;
    block[4] = a1;
    v5 = v3;
    block[0] = MEMORY[0x1E0C809B0];
    v7 = v3;
    dispatch_sync(v4, block);

    v3 = v5;
  }

}

void __50__PKMetalRendererController_renderTilesIntoTiles___block_invoke(uint64_t a1)
{
  uint64_t v2;
  unsigned int v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  uint8_t v11[16];

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2 || (v3 = atomic_load((unsigned int *)(v2 + 36))) == 0)
  {
    v4 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v11 = 0;
      _os_log_debug_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEBUG, "Render tile into tile.", v11, 2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "keyEnumerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nextObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      do
      {
        objc_msgSend(v5, "nextObject");
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = *(_QWORD **)(a1 + 32);
        if (v8)
          v8 = (_QWORD *)v8[74];
        v9 = v8;
        objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKMetalRenderer renderTiles:intoTile:waitUntilCompleted:]((uint64_t)v9, v10, v6, v7 == 0);

        v6 = (void *)v7;
      }
      while (v7);
    }

  }
}

- (void)drawTexture:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(NSObject **)(a1 + 24);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __41__PKMetalRendererController_drawTexture___block_invoke;
    v6[3] = &unk_1E7777440;
    v6[4] = a1;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

void __41__PKMetalRendererController_drawTexture___block_invoke(uint64_t a1)
{
  uint64_t v2;
  unsigned int v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[16];

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2 || (v3 = atomic_load((unsigned int *)(v2 + 36))) == 0)
  {
    v4 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_debug_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEBUG, "Draw texture.", v7, 2u);
    }

    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      v6 = *(_QWORD *)(v5 + 592);
    else
      v6 = 0;
    -[PKMetalRenderer renderTexture:](v6, *(void **)(a1 + 40));
  }
}

- (void)flushMemoryIfPossible
{
  NSObject *v1;
  _QWORD block[5];

  if (a1)
  {
    v1 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__PKMetalRendererController_flushMemoryIfPossible__block_invoke;
    block[3] = &unk_1E7776F38;
    block[4] = a1;
    dispatch_async(v1, block);
  }
}

void __50__PKMetalRendererController_flushMemoryIfPossible__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (!v1)
    goto LABEL_5;
  if (atomic_load((unsigned int *)(v1 + 36)))
    return;
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    -[PKMetalRenderer flushMemoryIfPossible](*(_QWORD *)(v3 + 592));
  else
LABEL_5:
    -[PKMetalRenderer flushMemoryIfPossible](0);
}

- (void)purgeOriginalBackFramebuffer
{
  NSObject *v1;
  _QWORD block[5];

  if (a1)
  {
    v1 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__PKMetalRendererController_purgeOriginalBackFramebuffer__block_invoke;
    block[3] = &unk_1E7776F38;
    block[4] = a1;
    dispatch_async(v1, block);
  }
}

void __57__PKMetalRendererController_purgeOriginalBackFramebuffer__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (!v1)
    goto LABEL_5;
  if (atomic_load((unsigned int *)(v1 + 36)))
    return;
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    -[PKMetalRenderer purgeOriginalBackFramebuffer](*(_QWORD *)(v3 + 592));
  else
LABEL_5:
    -[PKMetalRenderer purgeOriginalBackFramebuffer](0);
}

- (void)drawStrokesAfterClear:(__int128 *)a3 clippedToStrokeSpaceRect:(char)a4 strokeTransform:(void *)a5 useLayerContext:(double)a6 completion:(double)a7
{
  id v17;
  id v18;
  void *v19;
  __int128 v20;
  _QWORD v21[4];
  id v22;
  __int128 v23[3];

  v17 = a2;
  v18 = a5;
  v19 = v18;
  if (a1)
  {
    v20 = a3[1];
    v23[0] = *a3;
    v23[1] = v20;
    v23[2] = a3[2];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __119__PKMetalRendererController_drawStrokesAfterClear_clippedToStrokeSpaceRect_strokeTransform_useLayerContext_completion___block_invoke;
    v21[3] = &unk_1E77773C8;
    v22 = v18;
    -[PKMetalRendererController _drawStrokesAfterClear:clippedToStrokeSpaceRect:strokeTransform:useLayerContext:renderCompletion:](a1, v17, v23, a4, v21, a6, a7, a8, a9);

  }
}

void __119__PKMetalRendererController_drawStrokesAfterClear_clippedToStrokeSpaceRect_strokeTransform_useLayerContext_completion___block_invoke(uint64_t a1, char a2)
{
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  char v7;

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __119__PKMetalRendererController_drawStrokesAfterClear_clippedToStrokeSpaceRect_strokeTransform_useLayerContext_completion___block_invoke_2;
  v5[3] = &unk_1E7779448;
  v6 = *(id *)(a1 + 32);
  v7 = a2;
  dispatch_async(v4, v5);

}

uint64_t __119__PKMetalRendererController_drawStrokesAfterClear_clippedToStrokeSpaceRect_strokeTransform_useLayerContext_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (double)_latestLatency
{
  NSObject *v1;
  double v2;
  _QWORD v4[6];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;

  if (!a1)
    return 0.0;
  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v1 = *(NSObject **)(a1 + 24);
  if (v1)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __43__PKMetalRendererController__latestLatency__block_invoke;
    v4[3] = &unk_1E7777418;
    v4[4] = a1;
    v4[5] = &v5;
    dispatch_sync(v1, v4);
    v2 = v6[3];
  }
  else
  {
    v2 = 0.0;
  }
  _Block_object_dispose(&v5, 8);
  return v2;
}

double __43__PKMetalRendererController__latestLatency__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 560);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)drawingBeganWithStroke:(char)a3 forPreview:
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  char v10;

  v5 = a2;
  if (a1)
  {
    v6 = *(NSObject **)(a1 + 24);
    block[1] = 3221225472;
    block[2] = __63__PKMetalRendererController_drawingBeganWithStroke_forPreview___block_invoke;
    block[3] = &unk_1E7778560;
    block[4] = a1;
    v10 = a3;
    v7 = v5;
    block[0] = MEMORY[0x1E0C809B0];
    v9 = v5;
    dispatch_sync(v6, block);

    v5 = v7;
  }

}

void __63__PKMetalRendererController_drawingBeganWithStroke_forPreview___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v2 = qword_1BE4FCC30[*(double *)&_MergedGlobals_108 < 0.01];
  v3 = *(_QWORD *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(v3 + 224));
  *(_QWORD *)(v3 + 152) = 0;
  *(_QWORD *)(v3 + 160) = 0;
  *(_QWORD *)(v3 + 216) = v2;
  os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 224));
  v4 = *(_QWORD *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(v4 + 312));
  *(_QWORD *)(v4 + 240) = 0;
  *(_QWORD *)(v4 + 248) = 0;
  *(_QWORD *)(v4 + 304) = v2;
  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 312));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 457) = *(_BYTE *)(a1 + 48);
  *(CFTimeInterval *)(*(_QWORD *)(a1 + 32) + 472) = CACurrentMediaTime();
  objc_msgSend(*(id *)(a1 + 40), "ink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 464);
  *(_QWORD *)(v7 + 464) = v6;

  v9 = *(_QWORD *)(a1 + 32);
  if (!v9)
    goto LABEL_6;
  if (atomic_load((unsigned int *)(v9 + 36)))
    return;
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    v12 = *(_QWORD *)(v11 + 592);
  else
LABEL_6:
    v12 = 0;
  -[PKMetalRenderer drawingBeganWithStroke:forPreview:](v12, *(void **)(a1 + 40), (*(unsigned __int8 *)(a1 + 48) | byte_1EF55D0A9) != 0);
}

- (void)_recordStrokeStatistics
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  NSObject *v11;
  BOOL v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  int v24;
  double v25;
  __int16 v26;
  double v27;
  __int16 v28;
  double v29;
  __int16 v30;
  double v31;
  __int16 v32;
  double v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 224);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    v3 = *(_QWORD *)(a1 + 152);
    os_unfair_lock_unlock(v2);
    if (v3)
    {
      v4 = PKRunningStat::min((PKRunningStat *)(a1 + 144));
      v5 = PKRunningStat::mean((PKRunningStat *)(a1 + 144)) * 1000.0;
      v6 = PKRunningStat::max((PKRunningStat *)(a1 + 144)) * 1000.0;
      v7 = PKRunningStat::variance((PKRunningStat *)(a1 + 144));
      os_unfair_lock_lock(v2);
      v8 = *(_QWORD *)(a1 + 160);
      os_unfair_lock_unlock(v2);
      os_unfair_lock_lock(v2);
      v9 = *(_QWORD *)(a1 + 152);
      os_unfair_lock_unlock(v2);
      v10 = (double)v8 / (double)v9;
      v11 = os_log_create("com.apple.pencilkit", "Latency");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v24 = 134219008;
        v25 = v4 * 1000.0;
        v26 = 2048;
        v27 = v5;
        v28 = 2048;
        v29 = sqrt(v7) * 1000.0;
        v30 = 2048;
        v31 = v6;
        v32 = 2048;
        v33 = v10;
        _os_log_impl(&dword_1BE213000, v11, OS_LOG_TYPE_DEFAULT, "Stroke latency min: %g, mean: %g, std deviation: %g, max: %g, percentage high: %g", (uint8_t *)&v24, 0x34u);
      }

      *(double *)(a1 + 560) = v5;
      v12 = *(_BYTE *)(a1 + 457) == 0;
      +[PKStatisticsManager sharedStatisticsManager]();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if (v12)
        -[PKStatisticsManager recordLatency:mean:max:percentageOverLatencyThreshold:isInPDF:](v13);
      else
        -[PKStatisticsManager recordHoverLatency:mean:max:shadowEnabled:isInPDF:](v13);

    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    v15 = *(_QWORD *)(a1 + 240);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
    if (v15)
    {
      v16 = PKRunningStat::min((PKRunningStat *)(a1 + 232));
      v17 = PKRunningStat::mean((PKRunningStat *)(a1 + 232)) * 1000.0;
      v18 = PKRunningStat::max((PKRunningStat *)(a1 + 232)) * 1000.0;
      v19 = PKRunningStat::variance((PKRunningStat *)(a1 + 232));
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
      v20 = *(_QWORD *)(a1 + 248);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
      v21 = *(_QWORD *)(a1 + 240);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
      v22 = os_log_create("com.apple.pencilkit", "Latency");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v24 = 134219008;
        v25 = v16 * 1000.0;
        v26 = 2048;
        v27 = v17;
        v28 = 2048;
        v29 = sqrt(v19) * 1000.0;
        v30 = 2048;
        v31 = v18;
        v32 = 2048;
        v33 = (double)v20 / (double)v21;
        _os_log_impl(&dword_1BE213000, v22, OS_LOG_TYPE_DEFAULT, "Stroke latency with prediction min: %g, mean: %g, std deviation: %g, max: %g, percentage high: %g", (uint8_t *)&v24, 0x34u);
      }

      if (!*(_BYTE *)(a1 + 457))
      {
        +[PKStatisticsManager sharedStatisticsManager]();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKStatisticsManager recordPerceivedLatency:mean:max:isInPDF:]((uint64_t)v23);

      }
    }
  }
}

- (void)drawingEnded:(void *)a3 finishStrokeBlock:
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v7 = a2;
  v5 = a3;
  if (a1)
  {
    v6 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__PKMetalRendererController_drawingEnded_finishStrokeBlock___block_invoke;
    block[3] = &unk_1E77773F0;
    block[4] = a1;
    v9 = v7;
    v10 = v5;
    dispatch_sync(v6, block);

  }
}

void __60__PKMetalRendererController_drawingEnded_finishStrokeBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    if (atomic_load((unsigned int *)(v2 + 36)))
      return;
    v4 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v4 = 0;
  }
  -[PKMetalRendererController _logStrokeDuration](v4);
  -[PKMetalRendererController _recordStrokeStatistics](*(_QWORD *)(a1 + 32));
  v5 = *(_QWORD **)(a1 + 32);
  if (v5)
    v5 = (_QWORD *)v5[74];
  v6 = v5;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__PKMetalRendererController_drawingEnded_finishStrokeBlock___block_invoke_2;
  v8[3] = &unk_1E7776F60;
  v7 = *(void **)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  -[PKMetalRenderer drawingEnded:finishStrokeBlock:]((uint64_t)v6, v7, v8);

}

- (void)_logStrokeDuration
{
  double v2;
  NSObject *v3;
  double v4;
  uint64_t v5;
  const __CFString *v6;
  int v7;
  double v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = CACurrentMediaTime();
    v3 = os_log_create("com.apple.pencilkit", "Stroke Drawing");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v2 - *(double *)(a1 + 472);
      v5 = *(_QWORD *)(a1 + 464);
      v6 = CFSTR("YES");
      if (!*(_BYTE *)(a1 + 457))
        v6 = CFSTR("NO");
      v7 = 134218498;
      v8 = v4;
      v9 = 2112;
      v10 = v5;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1BE213000, v3, OS_LOG_TYPE_DEFAULT, "Stroke Duration: %.3f, ink: %@, forPreview: %@", (uint8_t *)&v7, 0x20u);
    }

  }
}

uint64_t __60__PKMetalRendererController_drawingEnded_finishStrokeBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)drawingCancelledForPreview:(uint64_t)a1
{
  NSObject *v2;
  _QWORD v3[5];
  char v4;

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 24);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __56__PKMetalRendererController_drawingCancelledForPreview___block_invoke;
    v3[3] = &unk_1E7778538;
    v3[4] = a1;
    v4 = a2;
    dispatch_sync(v2, v3);
  }
}

void __56__PKMetalRendererController_drawingCancelledForPreview___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    if (atomic_load((unsigned int *)(v2 + 36)))
      return;
    v4 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v4 = 0;
  }
  if (*(_BYTE *)(v4 + 457))
  {
    -[PKMetalRendererController _logStrokeDuration](v4);
    -[PKMetalRendererController _recordStrokeStatistics](*(_QWORD *)(a1 + 32));
    v4 = *(_QWORD *)(a1 + 32);
  }
  -[PKMetalRenderer drawingCancelledForPreview:](*(_QWORD *)(v4 + 592), *(_BYTE *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 456) = 1;
}

- (void)setAlternativeStrokes:(double)a3 alpha:(double)a4 originalStrokeAlpha:
{
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  double v12;
  double v13;

  v7 = a2;
  v8 = v7;
  if (a1)
  {
    v9 = *(NSObject **)(a1 + 24);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __77__PKMetalRendererController_setAlternativeStrokes_alpha_originalStrokeAlpha___block_invoke;
    v10[3] = &unk_1E7779470;
    v10[4] = a1;
    v11 = v7;
    v12 = a3;
    v13 = a4;
    dispatch_async(v9, v10);

  }
}

void __77__PKMetalRendererController_setAlternativeStrokes_alpha_originalStrokeAlpha___block_invoke(uint64_t a1)
{
  -[PKMetalRenderer setAlternativeStrokes:alpha:originalStrokeAlpha:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 592), *(void **)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (void)changeRenderSize
{
  NSObject *v1;
  _QWORD block[5];

  if (a1)
  {
    v1 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__PKMetalRendererController_changeRenderSize__block_invoke;
    block[3] = &unk_1E7776F38;
    block[4] = a1;
    dispatch_async(v1, block);
  }
}

void __45__PKMetalRendererController_changeRenderSize__block_invoke(uint64_t a1)
{
  uint64_t v1;
  unsigned int v2;
  NSObject *v3;
  uint8_t v4[16];

  v1 = *(_QWORD *)(a1 + 32);
  if (!v1 || (v2 = atomic_load((unsigned int *)(v1 + 36))) == 0)
  {
    v3 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v4 = 0;
      _os_log_debug_impl(&dword_1BE213000, v3, OS_LOG_TYPE_DEBUG, "Drawing resize.", v4, 2u);
    }

  }
}

uint64_t __51__PKMetalRendererController__present_setDirtyRect___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  os_unfair_lock_s *v9;
  uint64_t v10;
  double v11;

  result = objc_msgSend(a2, "presentedTime");
  v5 = v4 - *(double *)(a1 + 40);
  if (v5 > 0.0)
  {
    v6 = v5 + *(double *)&qword_1ECEE5FF8;
    v7 = v4 + *(double *)&qword_1ECEE5FF8 - *(double *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = (os_unfair_lock_s *)(v8 + 224);
    os_unfair_lock_lock((os_unfair_lock_t)(v8 + 224));
    v10 = *(_QWORD *)(v8 + 152);
    os_unfair_lock_unlock(v9);
    if (v10 < 10 || (v11 = PKRunningStat::mean((PKRunningStat *)(*(_QWORD *)(a1 + 32) + 144)), v6 < v11 + v11))
    {
      PKRunningStat::push((PKRunningStat *)(*(_QWORD *)(a1 + 32) + 144), v6);
      PKRunningStat::push((PKRunningStat *)(*(_QWORD *)(a1 + 32) + 232), v7);
    }
    return kdebug_trace();
  }
  return result;
}

uint64_t __51__PKMetalRendererController__present_setDirtyRect___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  if (*(_QWORD *)(a1 + 48))
    objc_msgSend(MEMORY[0x1E0CD28B0], "setLowLatency:", 1);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.0);
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 40), "present", (_QWORD)v7);
    (*(void (**)(double, double))(*(_QWORD *)(a1 + 48) + 16))(*(double *)(a1 + 56), *(double *)(a1 + 64));
  }
  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit", (_QWORD)v7);
}

- (void)_renderLiveStrokeAndPresentWithTransform:(uint64_t)a1 at:(_OWORD *)a2 setDirtyRect:(int)a3
{
  id WeakRetained;
  double v7;
  CGFloat v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  __int128 v15;
  uint64_t *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  char v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  double *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  _BOOL4 v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v50;
  _QWORD aBlock[4];
  id v52;
  id v53;
  id v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[8];

  if (a1)
  {
    kdebug_trace();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 568));
    objc_msgSend(WeakRetained, "contentsScale");
    v8 = v7;

    v9 = objc_loadWeakRetained((id *)(a1 + 568));
    objc_msgSend(v9, "drawableSize");
    v11 = v10;
    v13 = v12;

    v14 = *(void **)(a1 + 592);
    v15 = a2[1];
    *(_OWORD *)&t1.a = *a2;
    *(_OWORD *)&t1.c = v15;
    *(_OWORD *)&t1.tx = a2[2];
    v16 = v14;
    CGAffineTransformMakeScale(&t2, v8, v8);
    CGAffineTransformConcat(&v50, &t1, &t2);
    -[PKMetalRenderer renderLiveStrokeWithTransform:renderBufferSize:](v16, &v50, v11, v13);

    kdebug_trace();
    v17 = *(id *)(a1 + 328);
    v18 = *(id *)(a1 + 320);
    v19 = *(void **)(a1 + 328);
    *(_QWORD *)(a1 + 328) = 0;

    v20 = *(void **)(a1 + 320);
    *(_QWORD *)(a1 + 320) = 0;

    v45 = v18;
    if (v18)
    {
      v21 = objc_loadWeakRetained((id *)(a1 + 496));
      v22 = objc_opt_respondsToSelector();

    }
    else
    {
      v22 = 0;
    }
    v23 = (void *)objc_msgSend(*(id *)(a1 + 88), "copy", v45);
    objc_msgSend(*(id *)(a1 + 88), "removeAllObjects");
    v47 = *(id *)(a1 + 592);
    kdebug_trace();
    objc_msgSend(*(id *)(a1 + 528), "latestTimestamp");
    v25 = v24;
    objc_msgSend(*(id *)(a1 + 528), "latestNonPredictedTimestamp");
    v27 = v26;
    v28 = objc_loadWeakRetained((id *)(a1 + 568));
    objc_msgSend(v28, "setInputTime:", v27);

    v29 = MEMORY[0x1E0C809B0];
    if (v17 && v27 > 0.0)
    {
      v30 = 6;
      if (byte_1EF55D0A8)
        v30 = 8;
      if (*(_QWORD *)(a1 + 136) > v30)
      {
        v57[0] = MEMORY[0x1E0C809B0];
        v57[1] = 3221225472;
        v57[2] = __51__PKMetalRendererController__present_setDirtyRect___block_invoke;
        v57[3] = &unk_1E7779498;
        *(double *)&v57[5] = v27;
        v57[6] = v25;
        v57[4] = a1;
        objc_msgSend(v17, "addPresentedHandler:", v57);
      }
    }
    v31 = (unint64_t)_Block_copy(*(const void **)(a1 + 408));
    v56 = *(_OWORD *)(a1 + 344);
    if (v17 && a3 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v32 = *(double **)(a1 + 592);
      if (v32)
      {
        v33 = v32[90];
        v34 = v32[91];
        v35 = v32[92];
        v36 = v32[93];
      }
      else
      {
        v34 = 0.0;
        v35 = 0.0;
        v36 = 0.0;
        v33 = 0.0;
      }
      objc_msgSend(v17, "setDirtyRect:", v33, v34, v35, v36);
    }
    v37 = v23;
    v38 = (v31 | objc_msgSend(v23, "count")) != 0;
    if (v31)
      v39 = 0;
    else
      v39 = v17;
    -[PKMetalRenderer finishLiveStrokeAndPresentDrawable:waitUntilScheduled:]((uint64_t)v47, v39, v38);
    aBlock[0] = v29;
    aBlock[1] = 3221225472;
    aBlock[2] = __51__PKMetalRendererController__present_setDirtyRect___block_invoke_2;
    aBlock[3] = &unk_1E77794C0;
    v40 = (id)v31;
    v54 = v40;
    v41 = v37;
    v52 = v41;
    v42 = v17;
    v53 = v42;
    v55 = v56;
    v43 = _Block_copy(aBlock);
    if (v31)
    {
      dispatch_sync(MEMORY[0x1E0C80D38], v43);
    }
    else if (v38)
    {
      dispatch_async(MEMORY[0x1E0C80D38], v43);
    }
    if ((v22 & 1) != 0)
    {
      v44 = objc_loadWeakRetained((id *)(a1 + 496));
      objc_msgSend(v44, "metalRendererController:didCommitRenderingIntoTexture:", a1, v46);

    }
    kdebug_trace();

  }
}

- (void)pokeEventDispatcher
{
  if (a1)
  {
    if ((_UIUpdateCycleEnabled() & 1) == 0)
      dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_46);
  }
}

void __48__PKMetalRendererController_pokeEventDispatcher__block_invoke()
{
  id v0;

  objc_msgSend((id)*MEMORY[0x1E0DC4730], "valueForKeyPath:", CFSTR("eventDispatcher"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "eventFetcherDidReceiveEvents:", 0);

}

- (void)renderWithTransform:(double)a3 inputScale:(double)a4 at:
{
  __int128 v4;
  NSObject *v5;
  __int128 v6;
  _QWORD block[5];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  double v11;
  double v12;

  if (a1)
  {
    block[1] = 3221225472;
    v4 = a2[1];
    v8 = *a2;
    v5 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[2] = __63__PKMetalRendererController_renderWithTransform_inputScale_at___block_invoke;
    block[3] = &unk_1E7779508;
    block[4] = a1;
    v6 = a2[2];
    v9 = v4;
    v10 = v6;
    v11 = a3;
    v12 = a4;
    dispatch_async(v5, block);
  }
}

void __63__PKMetalRendererController_renderWithTransform_inputScale_at___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  __int128 *v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _OWORD v16[3];
  _OWORD v17[3];
  __int128 src;
  __int128 v19;
  __int128 v20;

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
  {
    v7 = 0;
    v4 = (__int128 *)(a1 + 40);
    v14 = *(_OWORD *)(a1 + 56);
    src = *(_OWORD *)(a1 + 40);
    v19 = v14;
    v20 = *(_OWORD *)(a1 + 72);
    goto LABEL_6;
  }
  v3 = *(_QWORD *)(v2 + 592);
  if (!v3)
  {
    v4 = (__int128 *)(a1 + 40);
    v15 = *(_OWORD *)(a1 + 56);
    src = *(_OWORD *)(a1 + 40);
    v19 = v15;
    v20 = *(_OWORD *)(a1 + 72);
LABEL_4:
    objc_copyStruct((void *)(v2 + 752), &src, 48, 1, 0);
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      *(_QWORD *)(v6 + 600) = *(_QWORD *)(a1 + 88);
      v7 = *(_QWORD *)(a1 + 32);
      goto LABEL_6;
    }
    goto LABEL_13;
  }
  *(_BYTE *)(v3 + 930) = 1;
  v2 = *(_QWORD *)(a1 + 32);
  v4 = (__int128 *)(a1 + 40);
  v5 = *(_OWORD *)(a1 + 56);
  src = *(_OWORD *)(a1 + 40);
  v19 = v5;
  v20 = *(_OWORD *)(a1 + 72);
  if (v2)
    goto LABEL_4;
LABEL_13:
  v7 = 0;
LABEL_6:
  v8 = *v4;
  v9 = v4[2];
  v17[1] = v4[1];
  v17[2] = v9;
  v17[0] = v8;
  if (-[PKMetalRendererController _renderAheadWithTransform:at:](v7, v17))
  {
    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
    {
      -[PKMetalRenderer getAndRenderNewPoints:](*(_QWORD *)(v10 + 592), *(void **)(v10 + 528));
      v11 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v11 = 0;
    }
    v12 = *v4;
    v13 = v4[2];
    v16[1] = v4[1];
    v16[2] = v13;
    v16[0] = v12;
    -[PKMetalRendererController _renderLiveStrokeAndPresentWithTransform:at:setDirtyRect:](v11, v16, 0);
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
  }
}

- (uint64_t)_renderAheadWithTransform:(uint64_t)a1 at:(_OWORD *)a2
{
  id WeakRetained;
  char v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  double v13;
  CGFloat v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  __int128 v24;
  id v25;
  uint64_t v26;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  char v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  id v38;
  id v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  void *v43;
  double v44;
  double v45;
  NSObject *v47;
  void *v48;
  BOOL v49;
  uint64_t v50;
  uint64_t v51;
  CGAffineTransform v52;
  CGAffineTransform t1;
  CGAffineTransform v54;
  uint8_t buf[4];
  double v56;
  __int16 v57;
  double v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  kdebug_trace();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 496));
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    if (*(_QWORD *)(a1 + 320))
    {
      v6 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v7 = "Already had texture target!";
LABEL_9:
        _os_log_impl(&dword_1BE213000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
    v28 = objc_loadWeakRetained((id *)(a1 + 496));
    objc_msgSend(v28, "nextTextureTargetForMetalRendererController:", a1);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = *(void **)(a1 + 320);
    *(_QWORD *)(a1 + 320) = v29;

    if (*(_QWORD *)(a1 + 320))
      goto LABEL_11;
    goto LABEL_40;
  }
  if (*(_QWORD *)(a1 + 328))
  {
    v6 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "Already had drawable!";
      goto LABEL_9;
    }
LABEL_10:

    goto LABEL_11;
  }
  v31 = objc_loadWeakRetained((id *)(a1 + 568));
  v32 = objc_msgSend(v31, "isDrawableAvailable");

  if ((v32 & 1) == 0)
  {
    v22 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE213000, v22, OS_LOG_TYPE_DEFAULT, "PKMetalRendererController: No drawable available; skipping frame",
        buf,
        2u);
    }
    v26 = 0;
    goto LABEL_19;
  }
  v33 = objc_loadWeakRetained((id *)(a1 + 568));
  objc_msgSend(v33, "nextDrawable");
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = *(void **)(a1 + 328);
  *(_QWORD *)(a1 + 328) = v34;

  v36 = *(void **)(a1 + 328);
  if (!v36)
  {
    v37 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE213000, v37, OS_LOG_TYPE_DEFAULT, "No drawable available, trying discardContents", buf, 2u);
    }

    v38 = objc_loadWeakRetained((id *)(a1 + 568));
    objc_msgSend(v38, "discardContents");

    v39 = objc_loadWeakRetained((id *)(a1 + 568));
    objc_msgSend(v39, "nextDrawable");
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = *(void **)(a1 + 328);
    *(_QWORD *)(a1 + 328) = v40;

    v36 = *(void **)(a1 + 328);
    if (!v36)
    {
      v42 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1BE213000, v42, OS_LOG_TYPE_ERROR, "Unable to setup current drawable", buf, 2u);
      }

      v36 = *(void **)(a1 + 328);
    }
  }
  objc_msgSend(v36, "texture");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (double)(unint64_t)objc_msgSend(v43, "width");
  v45 = (double)(unint64_t)objc_msgSend(v43, "height");
  if (*(double *)(a1 + 104) != v44 || *(double *)(a1 + 112) != v45)
  {
    v47 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      v50 = *(_QWORD *)(a1 + 104);
      v51 = *(_QWORD *)(a1 + 112);
      *(_DWORD *)buf = 134218752;
      v56 = v44;
      v57 = 2048;
      v58 = v45;
      v59 = 2048;
      v60 = v50;
      v61 = 2048;
      v62 = v51;
      _os_log_error_impl(&dword_1BE213000, v47, OS_LOG_TYPE_ERROR, "Drawable has incorrect size: %g %g vs %g %g", buf, 0x2Au);
    }

    v48 = *(void **)(a1 + 328);
    *(_QWORD *)(a1 + 328) = 0;

  }
  v49 = *(_QWORD *)(a1 + 328) == 0;

  if (v49)
  {
LABEL_40:
    v26 = 0;
    goto LABEL_20;
  }
LABEL_11:
  v8 = *(_QWORD *)(a1 + 592);
  if (v8)
    *(_QWORD *)(v8 + 984) = *(_QWORD *)(a1 + 600);
  v9 = *(id *)(a1 + 528);
  objc_msgSend(v9, "eraserIndicatorAlpha");
  v11 = *(_QWORD *)(a1 + 592);
  if (v11)
    *(_QWORD *)(v11 + 992) = v10;

  v12 = objc_loadWeakRetained((id *)(a1 + 568));
  objc_msgSend(v12, "contentsScale");
  v14 = v13;

  v15 = objc_loadWeakRetained((id *)(a1 + 568));
  objc_msgSend(v15, "drawableSize");
  v17 = v16;
  v19 = v18;

  v20 = *(void **)(a1 + 328);
  if (v20)
  {
    objc_msgSend(v20, "texture");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = *(id *)(a1 + 320);
  }
  v22 = v21;
  v23 = *(void **)(a1 + 592);
  v24 = a2[1];
  *(_OWORD *)&t1.a = *a2;
  *(_OWORD *)&t1.c = v24;
  *(_OWORD *)&t1.tx = a2[2];
  v25 = v23;
  CGAffineTransformMakeScale(&v52, v14, v14);
  CGAffineTransformConcat(&v54, &t1, &v52);
  -[PKMetalRenderer renderAheadWithTransform:onPaper:renderBufferSize:destinationTexture:]((uint64_t)v25, &v54.a, 1, v22, v17, v19);

  v26 = 1;
LABEL_19:

LABEL_20:
  kdebug_trace();
  return v26;
}

- (uint64_t)prerenderWithTransform:(double)a3 inputScale:(double)a4 at:
{
  uint64_t v7;
  id WeakRetained;
  id v9;
  void *v10;
  double v11;
  double v12;
  __int128 v13;
  unsigned int *v14;
  unsigned int v15;
  NSObject *v16;
  __int128 v17;
  _QWORD block[6];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  unsigned int v22;
  _OWORD src[3];

  if (result)
  {
    v7 = result;
    WeakRetained = objc_loadWeakRetained((id *)(result + 568));
    if (WeakRetained)
    {

    }
    else
    {
      v9 = objc_loadWeakRetained((id *)(v7 + 496));

      if (!v9)
        return 0;
    }
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "systemUptime");
    v12 = v11;

    if (a4 - v12 > *(double *)&_MergedGlobals_108)
      a4 = v12 + *(double *)&_MergedGlobals_108;
    v13 = a2[1];
    src[0] = *a2;
    src[1] = v13;
    src[2] = a2[2];
    objc_copyStruct((void *)(v7 + 752), src, 48, 1, 0);
    *(double *)(v7 + 600) = a3;
    v14 = (unsigned int *)(v7 + 80);
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 + 1, v14));
    v16 = *(NSObject **)(v7 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__PKMetalRendererController_prerenderWithTransform_inputScale_at___block_invoke;
    block[3] = &unk_1E7779530;
    block[4] = v7;
    *(double *)&block[5] = a4;
    v22 = v15;
    v17 = a2[1];
    v19 = *a2;
    v20 = v17;
    v21 = a2[2];
    dispatch_async(v16, block);
    return 1;
  }
  return result;
}

uint64_t __66__PKMetalRendererController_prerenderWithTransform_inputScale_at___block_invoke(uint64_t a1)
{
  unsigned int *v2;
  unsigned int v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t result;
  int v7;
  uint64_t v8;
  double v9;
  double v10;
  int v11;
  double v13;
  int v14;
  uint64_t v15;
  __int128 v16;
  void *v17;
  char v18;
  NSObject *v19;
  dispatch_time_t v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  double v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __n128 v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  NSObject *v51;
  dispatch_time_t v52;
  double v53;
  unsigned __int8 v54;
  double v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  double v60;
  uint64_t v61;
  uint64_t v62;
  _BOOL4 v63;
  uint64_t v64;
  __int128 v65;
  double v66;
  _OWORD v67[3];
  _OWORD v68[3];
  _OWORD v69[2];
  __int128 v70;

  v2 = (unsigned int *)(*(_QWORD *)(a1 + 32) + 80);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(v3 - 1, v2));
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 && (v5 = atomic_load((unsigned int *)(v4 + 36))) != 0
    || *(_DWORD *)(a1 + 96) && (v7 = atomic_load((unsigned int *)(*(_QWORD *)(a1 + 32) + 80)), v7 >= 1))
  {
LABEL_5:
    _UIMachTimeForMediaTime();
    return kdebug_trace();
  }
  if (HIBYTE(_MergedGlobals_161) != 1 || (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) | 2) != 3)
  {
    if (_UIUpdateCycleEnabled() && (v8 = *(_QWORD *)(a1 + 32), *(_QWORD *)(v8 + 480)))
    {
      v9 = *(double *)(a1 + 40);
      v10 = COERCE_DOUBLE(atomic_load((unint64_t *)(v8 + 72)));
      if (v9 < v10)
      {
        v11 = -5;
        while (!__CFADD__(v11++, 1))
        {
          usleep(0xFAu);
          v13 = COERCE_DOUBLE(atomic_load((unint64_t *)(v8 + 72)));
          if (v9 >= v13)
            goto LABEL_18;
        }
        goto LABEL_5;
      }
LABEL_18:
      v14 = 1;
    }
    else
    {
      v14 = 0;
    }
    _UIMachTimeForMediaTime();
    kdebug_trace();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 592);
    if (v15)
    {
      v16 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
      *(_OWORD *)(v15 + 720) = *MEMORY[0x1E0C9D628];
      *(_OWORD *)(v15 + 736) = v16;
    }
    +[PKRendererVSyncController sharedController]();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PKRendererVSyncController isActive]((uint64_t)v17))
    {
      v18 = _UIUpdateCycleEnabled();

      if ((v18 & 1) == 0)
      {
        v19 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
        v20 = dispatch_time(0, (uint64_t)(*(double *)&_MergedGlobals_108 * 3.0 * 1000000000.0));
        if (!dispatch_semaphore_wait(v19, v20))
          atomic_store(0, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 48));
      }
    }
    else
    {

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "latestNonPredictedTimestamp");
    v22 = v21;
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "systemUptime");
    v25 = v24;

    v26 = mach_absolute_time();
    v27 = v26;
    v28 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 64));
    if (v28
      && v26 > v28
      && (double)((v26 - v28) * dword_1EF55D0AC / unk_1EF55D0B0) / 1000000000.0 < *(double *)&_MergedGlobals_108
                                                                                              * 0.5)
    {
      v27 = v28;
    }
    v29 = *(double *)&qword_1ECEE6000;
    v30 = _UIUpdateCycleEnabled();
    v31 = *(_QWORD *)(a1 + 32);
    if ((v30 & 1) != 0)
      goto LABEL_36;
    v32 = 5;
    if (byte_1EF55D0A8)
      v32 = 7;
    if (*(_QWORD *)(v31 + 136) >= v32)
    {
LABEL_36:
      v34 = *(_QWORD *)(v31 + 592);
      if (v34)
        LODWORD(v34) = *(_QWORD *)(v34 + 632) == *(_QWORD *)(v34 + 624);
      v33 = v34 ^ 1;
    }
    else
    {
      v33 = 0;
    }
    v35 = objc_msgSend(*(id *)(v31 + 528), "inputType");
    v36 = v35;
    if (v33 && v35 == 1)
    {
      v29 = *(double *)&qword_1ECEE6008;
    }
    else if (v33 && *(double *)&_MergedGlobals_108 > 0.01)
    {
      v29 = *(double *)&_MergedGlobals_108 * 0.5;
    }
    -[PKMetalRendererController pokeEventDispatcher](*(_QWORD *)(a1 + 32));
    v37 = *(_QWORD *)(a1 + 32);
    v38 = *(_OWORD *)(v37 + 376);
    v69[0] = *(_OWORD *)(v37 + 360);
    v69[1] = v38;
    v70 = *(_OWORD *)(v37 + 392);
    v39.n128_u64[1] = *((_QWORD *)&v70 + 1);
    v39.n128_u64[0] = *(_QWORD *)(v37 + 344);
    *(_QWORD *)&v40 = -[PKMetalRendererController _updateRendererStrokeTransformWithTransform:offset:](v37, v69, v39, *(double *)(v37 + 352)).n128_u64[0];
    v41 = *(_QWORD *)(a1 + 32);
    if (v41 && *(_BYTE *)(v41 + 490))
    {
      v42 = *(_QWORD *)(v41 + 592);
      if (v42)
      {
        -[PKMetalRenderer finishRendering](*(_QWORD *)(v41 + 592));
        *(_BYTE *)(v42 + 72) = 1;
        v41 = *(_QWORD *)(a1 + 32);
      }
      v43 = objc_msgSend(*(id *)(v41 + 416), "count", v40);
      v41 = *(_QWORD *)(a1 + 32);
      if (v43)
      {
        if (v41)
          v44 = *(_QWORD *)(v41 + 592);
        else
          v44 = 0;
        -[PKMetalRenderer renderStrokes:stopBlock:](v44, *(void **)(v41 + 416), 0);
        v45 = *(_QWORD *)(a1 + 32);
        if (v45)
          v46 = *(_QWORD *)(v45 + 592);
        else
          v46 = 0;
        -[PKMetalRenderer addStrokeSpaceDrawableDirtyRect:](v46, *(double *)(v45 + 424), *(double *)(v45 + 432), *(double *)(v45 + 440), *(double *)(v45 + 448));
        v41 = *(_QWORD *)(a1 + 32);
      }
    }
    v47 = *(_OWORD *)(a1 + 64);
    v68[0] = *(_OWORD *)(a1 + 48);
    v68[1] = v47;
    v68[2] = *(_OWORD *)(a1 + 80);
    if ((-[PKMetalRendererController _renderAheadWithTransform:at:](v41, v68) & 1) != 0)
    {
      v48 = unk_1EF55D0B0 * (unint64_t)(v29 * 1000000000.0) / dword_1EF55D0AC + v27;
      v49 = mach_absolute_time();
      v50 = 0.0;
      if (v48 > v49)
        v50 = (double)((v48 - v49) * dword_1EF55D0AC / unk_1EF55D0B0) / 1000000000.0;
      if ((v14 & 1) != 0)
      {
        v51 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 480);
        v52 = dispatch_time(0, (uint64_t)(v50 * 1000000000.0));
        if (dispatch_semaphore_wait(v51, v52))
          kdebug_trace();
      }
      else if (v50 > 0.001 && v36 == 1)
      {
        mach_wait_until(unk_1EF55D0B0 * (unint64_t)(*(double *)&qword_1ECEE6018 * 1000000000.0) / dword_1EF55D0AC+ v27);
        kdebug_trace();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "latestNonPredictedTimestamp");
        v54 = _MergedGlobals_161;
        if (v53 != v22)
          v54 = 0;
        if ((v54 & (v25 - v53 > 0.01)) != 0)
          v55 = v25 + 0.006;
        else
          v55 = v53 + dbl_1BE4FCC40[*(double *)&_MergedGlobals_108 < 0.01];
        v56 = 330000 * (unint64_t)unk_1EF55D0B0 / dword_1EF55D0AC;
        v57 = v27
            - v56
            + (unint64_t)(*(double *)&qword_1ECEE6010 * 1000000000.0)
            * unk_1EF55D0B0
            / dword_1EF55D0AC;
        while (1)
        {
          v58 = v48 >= v57 + v56 ? v57 + v56 : v48;
          mach_wait_until(v58);
          -[PKMetalRendererController pokeEventDispatcher](*(_QWORD *)(a1 + 32));
          v59 = mach_absolute_time();
          mach_wait_until(100000 * (unint64_t)unk_1EF55D0B0 / dword_1EF55D0AC + v59);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "latestNonPredictedTimestamp");
          if (v60 > v55)
            break;
          v57 = mach_absolute_time();
          if (v57 >= v48)
            goto LABEL_78;
        }
      }
      else
      {
        if (v29 > 0.0)
          mach_wait_until(v48);
LABEL_78:
        -[PKMetalRendererController pokeEventDispatcher](*(_QWORD *)(a1 + 32));
        v61 = mach_absolute_time();
        mach_wait_until(100000 * (unint64_t)unk_1EF55D0B0 / dword_1EF55D0AC + v61);
      }
      -[PKMetalRenderer getAndRenderNewPoints:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 592), *(void **)(*(_QWORD *)(a1 + 32) + 528));
      v62 = *(_QWORD *)(a1 + 32);
      v63 = *(_BYTE *)(v62 + 456) == 0;
      *(_BYTE *)(v62 + 456) = 0;
      v64 = *(_QWORD *)(a1 + 32);
      v65 = *(_OWORD *)(a1 + 64);
      v67[0] = *(_OWORD *)(a1 + 48);
      v67[1] = v65;
      v67[2] = *(_OWORD *)(a1 + 80);
      -[PKMetalRendererController _renderLiveStrokeAndPresentWithTransform:at:setDirtyRect:](v64, v67, v63);
      ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
      if (v14)
      {
        v66 = *(double *)(a1 + 40) + *(double *)&_MergedGlobals_108 * 2.0 + -0.001;
        if (CACurrentMediaTime() < v66)
          atomic_store(*(unint64_t *)&v66, (unint64_t *)(*(_QWORD *)(a1 + 32) + 72));
      }
    }
    else
    {
      kdebug_trace();
      _UIMachTimeForMediaTime();
    }
    return kdebug_trace();
  }
  _UIMachTimeForMediaTime();
  result = kdebug_trace();
  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
  return result;
}

- (void)updateCyclePreCACommit:(uint64_t)a1 isDrawing:(char)a2
{
  uint64_t v4;
  void (**v5)(_QWORD);
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  dispatch_time_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  NSObject *v17;
  _QWORD v18[4];
  NSObject *v19;
  _QWORD aBlock[5];

  if (a1 && *(_QWORD *)(a1 + 480))
  {
    v4 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__PKMetalRendererController_updateCyclePreCACommit_isDrawing___block_invoke;
    aBlock[3] = &unk_1E7776F38;
    aBlock[4] = a1;
    v5 = (void (**)(_QWORD))_Block_copy(aBlock);
    v6 = v5;
    if ((a2 & 1) != 0)
    {
      if (*(_BYTE *)(a1 + 490))
      {
        v7 = *(void **)(a1 + 528);
        v18[0] = v4;
        v18[1] = 3221225472;
        v18[2] = __62__PKMetalRendererController_updateCyclePreCACommit_isDrawing___block_invoke_2;
        v18[3] = &unk_1E7776F60;
        v19 = v5;
        objc_msgSend(v7, "whenFinishedProcessingPointsCallCompletion:", v18);
        v8 = v19;
      }
      else
      {
        v16[0] = v4;
        v16[1] = 3221225472;
        v16[2] = __62__PKMetalRendererController_updateCyclePreCACommit_isDrawing___block_invoke_3;
        v16[3] = &unk_1E7776F38;
        v8 = dispatch_semaphore_create(0);
        v17 = v8;
        v9 = _Block_copy(v16);
        v10 = *(void **)(a1 + 528);
        v13[0] = v4;
        v13[1] = 3221225472;
        v13[2] = __62__PKMetalRendererController_updateCyclePreCACommit_isDrawing___block_invoke_4;
        v13[3] = &unk_1E7779558;
        v14 = v6;
        v11 = v9;
        v15 = v11;
        objc_msgSend(v10, "whenFinishedProcessingPointsCallCompletion:", v13);
        v12 = dispatch_time(0, 500000);
        if (dispatch_semaphore_wait(v8, v12))
          kdebug_trace();

      }
    }
    else
    {
      v5[2](v5);
    }

  }
}

intptr_t __62__PKMetalRendererController_updateCyclePreCACommit_isDrawing___block_invoke(uint64_t a1)
{
  kdebug_trace();
  if (dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 480)))
    return kdebug_trace();
  else
    return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 480), 0);
}

uint64_t __62__PKMetalRendererController_updateCyclePreCACommit_isDrawing___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

intptr_t __62__PKMetalRendererController_updateCyclePreCACommit_isDrawing___block_invoke_3(uint64_t a1)
{
  kdebug_trace();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __62__PKMetalRendererController_updateCyclePreCACommit_isDrawing___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)didFinishRendering:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(NSObject **)(a1 + 24);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __48__PKMetalRendererController_didFinishRendering___block_invoke;
    v6[3] = &unk_1E7777B08;
    v6[4] = a1;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

void __48__PKMetalRendererController_didFinishRendering___block_invoke(uint64_t a1)
{
  uint64_t v1;
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  _BOOL8 v6;
  id v7;

  v1 = *(_QWORD *)(a1 + 32);
  if (!v1 || (v2 = atomic_load((unsigned int *)(v1 + 36))) == 0)
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
    {
      v4 = *(_QWORD *)(a1 + 32);
      if (v4 && (v5 = *(id *)(v4 + 592)) != 0)
      {
        v7 = v5;
        v6 = *((_QWORD *)v5 + 79) == *((_QWORD *)v5 + 78);
      }
      else
      {
        v7 = 0;
        v6 = 0;
      }
      (*(void (**)(uint64_t, _BOOL8))(v3 + 16))(v3, v6);

    }
  }
}

- (void)addBlockToCallAfterPresenting:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(NSObject **)(a1 + 24);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __59__PKMetalRendererController_addBlockToCallAfterPresenting___block_invoke;
    v6[3] = &unk_1E7777B08;
    v6[4] = a1;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

void __59__PKMetalRendererController_addBlockToCallAfterPresenting___block_invoke(uint64_t a1)
{
  -[PKMetalRendererController callBlockAfterPresenting:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)callBlockAfterPresenting:(uint64_t)a1
{
  void *v2;
  id v3;

  if (a1)
  {
    v2 = *(void **)(a1 + 88);
    v3 = _Block_copy(aBlock);
    objc_msgSend(v2, "addObject:");

  }
}

- (void)setCanvasOffset:(double)a3
{
  NSObject *v3;
  _QWORD block[7];

  if (a1)
  {
    v3 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__PKMetalRendererController_setCanvasOffset___block_invoke;
    block[3] = &unk_1E77771C0;
    block[4] = a1;
    *(double *)&block[5] = a2;
    *(double *)&block[6] = a3;
    dispatch_async(v3, block);
  }
}

double __45__PKMetalRendererController_setCanvasOffset___block_invoke(uint64_t a1)
{
  uint64_t v1;
  __int128 v2;
  __n128 v3;
  double result;
  _OWORD v5[2];
  __int128 v6;

  *(_OWORD *)(*(_QWORD *)(a1 + 32) + 344) = *(_OWORD *)(a1 + 40);
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_OWORD *)(v1 + 672);
  v5[0] = *(_OWORD *)(v1 + 656);
  v5[1] = v2;
  v6 = *(_OWORD *)(v1 + 688);
  v3.n128_u64[1] = *((_QWORD *)&v6 + 1);
  v3.n128_u64[0] = *(_QWORD *)(v1 + 344);
  *(_QWORD *)&result = -[PKMetalRendererController _updateRendererStrokeTransformWithTransform:offset:](v1, v5, v3, *(double *)(v1 + 352)).n128_u64[0];
  return result;
}

- (void)replaceInkTexture:(uint64_t)a3 image:
{
  id v5;
  _QWORD *v6;
  _QWORD *v7;
  id v8;

  v5 = a2;
  if (a1)
  {
    v6 = *(_QWORD **)(a1 + 592);
    v8 = v5;
    if (v6)
      v6 = (_QWORD *)v6[24];
    v7 = v6;
    -[PKMetalResourceHandler replaceInkTexture:image:]((uint64_t)v7, v8, a3);

    v5 = v8;
  }

}

- (void)setCanvasOffsetPresentationOffsetBlock:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(NSObject **)(a1 + 24);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __68__PKMetalRendererController_setCanvasOffsetPresentationOffsetBlock___block_invoke;
    v6[3] = &unk_1E7777B08;
    v6[4] = a1;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

void __68__PKMetalRendererController_setCanvasOffsetPresentationOffsetBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v2 = _Block_copy(*(const void **)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 408);
  *(_QWORD *)(v3 + 408) = v2;

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 592);
  if (v5)
    *(_BYTE *)(v5 + 933) = *(_QWORD *)(a1 + 40) != 0;
}

uint64_t __45__PKMetalRendererController_setInvertColors___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (v1)
  {
    v2 = *(_QWORD *)(v1 + 592);
    if (v2)
      *(_BYTE *)(v2 + 934) = *(_BYTE *)(result + 40);
  }
  return result;
}

- (void)callBlockOnRenderQueue:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__PKMetalRendererController_callBlockOnRenderQueue___block_invoke;
    block[3] = &unk_1E7776F60;
    v7 = v3;
    dispatch_async(v5, block);

  }
}

uint64_t __52__PKMetalRendererController_callBlockOnRenderQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addInputPoint:(uint64_t)a1
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  NSObject *v6;
  _QWORD block[5];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  if (a1)
  {
    block[1] = 3221225472;
    v2 = a2[5];
    v12 = a2[4];
    v13 = v2;
    v3 = a2[7];
    v14 = a2[6];
    v15 = v3;
    v4 = a2[1];
    v8 = *a2;
    v9 = v4;
    v5 = a2[3];
    v10 = a2[2];
    v6 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[2] = __43__PKMetalRendererController_addInputPoint___block_invoke;
    block[3] = &unk_1E7779580;
    block[4] = a1;
    v11 = v5;
    dispatch_async(v6, block);
  }
}

_QWORD *__43__PKMetalRendererController_addInputPoint___block_invoke(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = result[4];
  if (v1)
  {
    v2 = *(_QWORD *)(v1 + 592);
    if (v2)
      return memmove((void *)(v2 + 800), result + 5, 0x80uLL);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_destroyWeak((id *)&self->_presentationLayer);
  objc_storeStrong((id *)&self->_linedPaper, 0);
  objc_storeStrong((id *)&self->_inputController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_updateCycleSemaphore, 0);
  objc_storeStrong((id *)&self->_currentInkIdentifier, 0);
  objc_storeStrong((id *)&self->_liveStrokeStrokes, 0);
  objc_storeStrong(&self->_canvasOffsetBlock, 0);
  objc_storeStrong((id *)&self->_currentDrawable, 0);
  objc_storeStrong((id *)&self->_currentTextureTarget, 0);
  objc_storeStrong((id *)&self->_postPresentCallbacks, 0);
  objc_storeStrong((id *)&self->_canBeginRenderSemaphore, 0);
  objc_storeStrong((id *)&self->_renderQueue, 0);
  objc_storeStrong((id *)&self->_metalConfig, 0);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 144) = 0;
  *((_QWORD *)self + 27) = 0;
  *((_DWORD *)self + 56) = 0;
  *((_QWORD *)self + 19) = 0;
  *((_QWORD *)self + 20) = 0;
  *((_BYTE *)self + 232) = 0;
  *((_QWORD *)self + 38) = 0;
  *((_DWORD *)self + 78) = 0;
  *((_QWORD *)self + 30) = 0;
  *((_QWORD *)self + 31) = 0;
  return self;
}

@end
