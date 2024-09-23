@implementation FigSubtitleCALayer

- (id)actionForKey:(id)a3
{
  objc_super v6;

  if ((objc_msgSend(CFSTR("hidden"), "isEqualToString:") & 1) == 0
    && !objc_msgSend(CFSTR("contents"), "isEqualToString:", a3))
  {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)FigSubtitleCALayer;
  return -[FigBaseCALayer actionForKey:](&v6, sel_actionForKey_, a3);
}

+ (id)defaultActionForKey:(id)a3
{
  objc_super v6;

  if ((objc_msgSend(CFSTR("hidden"), "isEqualToString:") & 1) == 0
    && !objc_msgSend(CFSTR("contents"), "isEqualToString:", a3))
  {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___FigSubtitleCALayer;
  return objc_msgSendSuper2(&v6, sel_defaultActionForKey_, a3);
}

- (FigSubtitleCALayer)init
{
  id v2;
  _QWORD *v3;
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  __int128 *v8;
  __int128 v9;
  __int128 v10;
  int v11;
  uint64_t v12;
  dispatch_queue_t v13;
  uint64_t v14;
  objc_super v16;
  char label[256];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)FigSubtitleCALayer;
  v2 = -[FigSubtitleBackdropCALayer init](&v16, sel_init);
  if (!v2)
    return (FigSubtitleCALayer *)v2;
  v3 = malloc_type_calloc(1uLL, 0x140uLL, 0x10E00406081BCC0uLL);
  *((_QWORD *)v2 + 6) = v3;
  if (!v3)
  {
LABEL_11:

    return 0;
  }
  v3[1] = v2;
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  *((_OWORD *)v3 + 1) = *MEMORY[0x1E0C9D648];
  *((_OWORD *)v3 + 2) = v5;
  *(_OWORD *)(*((_QWORD *)v2 + 6) + 48) = *MEMORY[0x1E0C9D820];
  v6 = *((_QWORD *)v2 + 6);
  *(_OWORD *)(v6 + 88) = v5;
  *(_OWORD *)(v6 + 72) = v4;
  v7 = *((_QWORD *)v2 + 6);
  v8 = (__int128 *)MEMORY[0x1E0CA4AD8];
  v9 = *(_OWORD *)(MEMORY[0x1E0CA4AD8] + 32);
  *(_OWORD *)(v7 + 152) = *(_OWORD *)(MEMORY[0x1E0CA4AD8] + 48);
  *(_OWORD *)(v7 + 136) = v9;
  v10 = *v8;
  *(_OWORD *)(v7 + 120) = v8[1];
  *(_OWORD *)(v7 + 104) = v10;
  *(_BYTE *)(*((_QWORD *)v2 + 6) + 168) = 0;
  v11 = FigSubtitleRendererUseCoreTextRendererByDefault();
  v12 = *((_QWORD *)v2 + 6);
  if (v11)
  {
    *(_DWORD *)(v12 + 184) = 1;
  }
  else
  {
    *(_DWORD *)(v12 + 184) = 0;
    if (setupFCR(v12))
    {
LABEL_14:
      FigSignalErrorAt();
      goto LABEL_11;
    }
    if (*(_DWORD *)(*((_QWORD *)v2 + 6) + 184) != 1)
      goto LABEL_8;
  }
  objc_msgSend(v2, "setDelegate:", v2);
  if (setupCoreTextRenderer(*((_QWORD *)v2 + 6)))
    goto LABEL_14;
LABEL_8:
  objc_msgSend(v2, "setEdgeAntialiasingMask:", 0);
  __sprintf_chk(label, 0, 0x100uLL, "com.apple.coremedia.FigSubtitleCALayer.messagequeue<%p>", v2);
  v13 = dispatch_queue_create(label, 0);
  v14 = *((_QWORD *)v2 + 6);
  *(_QWORD *)(v14 + 176) = v13;
  if (!v13)
    goto LABEL_11;
  if (*(_DWORD *)(v14 + 184) == 1)
  {
    CMNotificationCenterGetDefaultLocalCenter();
    if (!FigNotificationCenterAddWeakListener())
    {
      objc_msgSend(v2, "setHidden:", 1);
      *(_BYTE *)(*((_QWORD *)v2 + 6) + 171) = 1;
      return (FigSubtitleCALayer *)v2;
    }
    goto LABEL_11;
  }
  return (FigSubtitleCALayer *)v2;
}

- (FigSubtitleCALayer)initWithLayer:(id)a3
{
  FigSubtitleCALayer *v5;
  OpaqueFigSubtitleCALayerInternal *v6;
  objc_super v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    return 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)FigSubtitleCALayer;
  v5 = -[FigSubtitleCALayer initWithLayer:](&v8, sel_initWithLayer_, a3);
  if (v5)
  {
    v6 = (OpaqueFigSubtitleCALayerInternal *)malloc_type_calloc(1uLL, 0x140uLL, 0x10E00406081BCC0uLL);
    v5->layerInternal = v6;
    if (v6)
    {
      v6->var1 = v5;
      v6->var9 = 1;
      v6->var7 = 0;
      return v5;
    }

    return 0;
  }
  return v5;
}

- (void)dealloc
{
  OpaqueFigSubtitleCALayerInternal *layerInternal;
  unsigned int var12;
  objc_super v5;

  layerInternal = self->layerInternal;
  if (layerInternal)
  {
    var12 = layerInternal->var12;
    if (!var12)
    {
      releaseFCR((uint64_t)layerInternal);
      layerInternal = self->layerInternal;
      var12 = layerInternal->var12;
    }
    if (var12 == 1)
    {
      releaseCoreTextRenderer((uint64_t)layerInternal);
      layerInternal = self->layerInternal;
    }
    if (layerInternal->var11)
    {
      dispatch_release((dispatch_object_t)layerInternal->var11);
      layerInternal = self->layerInternal;
      layerInternal->var11 = 0;
    }
    if (!layerInternal->var0 || (CFRelease(layerInternal->var0), (layerInternal = self->layerInternal) != 0))
    {
      self->layerInternal = 0;
      free(layerInternal);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)FigSubtitleCALayer;
  -[FigSubtitleBackdropCALayer dealloc](&v5, sel_dealloc);
}

- (void)clear
{
  OpaqueFigSubtitleCALayerInternal *layerInternal;
  unsigned int var12;
  NSObject *var11;
  OpaqueFigSubtitleCALayerInternal *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  layerInternal = self->layerInternal;
  var12 = layerInternal->var12;
  if (!var12)
  {
    FigCaptionRendererSessionClear(layerInternal->var14, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
    layerInternal = self->layerInternal;
    var12 = layerInternal->var12;
  }
  if (var12 == 1)
  {
    v8 = 0;
    v9 = 0;
    v6 = layerInternal;
    v7 = 1;
    var11 = layerInternal->var11;
    if (var11)
    {
      dispatch_sync_f(var11, &v6, (dispatch_function_t)updateSubtitleDo);
      layerInternal = self->layerInternal;
    }
    objc_msgSend(layerInternal->var1, "setNeedsDisplay", v6, v7, v8, v9);
  }
}

- (void)layoutSublayersOfLayer:(id)a3
{
  OpaqueFigSubtitleCALayerInternal *layerInternal;
  NSObject *var11;
  _QWORD v5[6];

  layerInternal = self->layerInternal;
  if (layerInternal->var12 == 1)
  {
    var11 = layerInternal->var11;
    if (var11)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __45__FigSubtitleCALayer_layoutSublayersOfLayer___block_invoke;
      v5[3] = &unk_1E2F8AEF0;
      v5[4] = self;
      v5[5] = a3;
      dispatch_sync(var11, v5);
    }
  }
}

uint64_t __45__FigSubtitleCALayer_layoutSublayersOfLayer___block_invoke(uint64_t a1)
{
  CFIndex Count;
  void *v3;
  float64x2_t *v4;

  Count = CFArrayGetCount(*(CFArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 240));
  v3 = *(void **)(a1 + 40);
  v4 = *(float64x2_t **)(*(_QWORD *)(a1 + 32) + 48);
  if (Count)
  {
    __asm { FMOV            V2.2D, #0.5 }
    objc_msgSend(v3, "setPosition:", vaddq_f64(v4[1], vmulq_f64(v4[2], _Q2)));
    return objc_msgSend(*(id *)(a1 + 40), "setBounds:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 16), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 24), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 40));
  }
  else
  {
    __asm { FMOV            V2.2D, #0.5 }
    objc_msgSend(v3, "setPosition:", vaddq_f64(v4[18], vmulq_f64(v4[19], _Q2)));
    objc_msgSend(*(id *)(a1 + 40), "setBounds:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 288), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 296), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 304), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 312));
    return objc_msgSend(*(id *)(a1 + 40), "setCornerRadius:", FigSubtitleRendererGetWindowRoundedCornerRadius(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 208)));
  }
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  OpaqueFigSubtitleCALayerInternal *layerInternal;
  NSObject *var11;
  CGFloat *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  OpaqueFigSubtitleRenderer *var15;
  uint64_t v16;
  const void *v17;
  CGAffineTransform transform;
  CGFloat v19;
  __int128 v20;
  _QWORD block[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  uint64_t v27;
  CGRect v28;

  layerInternal = self->layerInternal;
  if (layerInternal->var12 == 1)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x3052000000;
    v25 = __Block_byref_object_copy__3;
    v26 = __Block_byref_object_dispose__3;
    v27 = 0;
    var11 = layerInternal->var11;
    if (var11)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __42__FigSubtitleCALayer_drawLayer_inContext___block_invoke;
      block[3] = &unk_1E2F8B100;
      block[4] = self;
      block[5] = &v22;
      dispatch_sync(var11, block);
      if (v23[5])
      {
        CGContextSaveGState(a4);
        v9 = (CGFloat *)MEMORY[0x1E0C9BAA8];
        v20 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 8);
        if (objc_msgSend(a3, "contentsAreFlipped"))
        {
          objc_msgSend(a3, "frame");
          v11 = v10;
          v20 = 0uLL;
          transform.b = 0.0;
          transform.c = 0.0;
          transform.a = 1.0;
          *(_OWORD *)&transform.d = xmmword_1932FAA90;
          transform.ty = v10;
          CGContextConcatCTM(a4, &transform);
          v12 = 0.0;
          v13 = -1.0;
          v14 = 1.0;
        }
        else
        {
          v14 = *v9;
          v13 = v9[3];
          v12 = v9[4];
          v11 = v9[5];
        }
        *(_OWORD *)&transform.c = v20;
        var15 = self->layerInternal->var15;
        v16 = v23[5];
        *(_QWORD *)&transform.a = a4;
        transform.b = v14;
        transform.tx = v13;
        transform.ty = v12;
        v19 = v11;
        FigSubtitleRendererDrawSubtitleText((uint64_t)var15, v16, (uint64_t)&transform);
        v17 = (const void *)v23[5];
        if (v17)
          CFRelease(v17);
        CGContextRestoreGState(a4);
      }
      else
      {
        objc_msgSend(a3, "bounds");
        CGContextClearRect(a4, v28);
      }
    }
    _Block_object_dispose(&v22, 8);
  }
}

_QWORD *__42__FigSubtitleCALayer_drawLayer_inContext___block_invoke(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = result;
  v2 = *(_QWORD *)(result[4] + 48);
  if (*(_BYTE *)(v2 + 224) || *(_BYTE *)(v2 + 168))
  {
    result = *(_QWORD **)(v2 + 216);
    if (result)
      result = CFRetain(result);
    *(_QWORD *)(*(_QWORD *)(v1[5] + 8) + 40) = result;
  }
  return result;
}

- (void)_addBoundsAnimation:(id)a3 forKey:(id)a4
{
  uint64_t (*v7)(uint64_t, void *);
  uint64_t *v8;
  id v9;
  const __CFString *v10;
  OpaqueFigSubtitleCALayerInternal *layerInternal;
  uint64_t v12;
  uint64_t v13;

  if (objc_msgSend(a3, "isAdditive"))
  {
    v13 = MEMORY[0x1E0C809B0];
    v7 = __49__FigSubtitleCALayer__addBoundsAnimation_forKey___block_invoke;
    v8 = &v13;
  }
  else
  {
    v12 = MEMORY[0x1E0C809B0];
    v7 = __49__FigSubtitleCALayer__addBoundsAnimation_forKey___block_invoke_2;
    v8 = &v12;
  }
  v8[1] = 3221225472;
  v8[2] = (uint64_t)v7;
  v8[3] = (uint64_t)&unk_1E2F91E68;
  v8[4] = (uint64_t)self;
  v9 = _animationByTransformingValues(a3, (uint64_t)v8);
  if (objc_msgSend(a3, "isAdditive"))
    v10 = CFSTR("bounds.size");
  else
    v10 = CFSTR("bounds");
  objc_msgSend(v9, "setKeyPath:", v10, v12);
  objc_msgSend(v9, "setDelegate:", 0);
  layerInternal = self->layerInternal;
  if (layerInternal->var12)
    -[FigSubtitleBackdropCALayer addAnimation:forKey:](self, "addAnimation:forKey:", v9, a4);
  else
    FigCaptionRendererSessionAddAnimation((uint64_t)layerInternal->var14, (uint64_t)v9, (uint64_t)a4);
}

uint64_t __49__FigSubtitleCALayer__addBoundsAnimation_forKey___block_invoke(uint64_t a1, void *a2)
{
  __int128 v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v10;
  __int128 v11;

  v3 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v10 = *MEMORY[0x1E0C9D648];
  v11 = v3;
  objc_msgSend(a2, "sizeValue");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  if (*(_DWORD *)(v6 + 184))
  {
    getLayoutForAnimation(v6, (uint64_t)&v10, 0.0, 0.0, v4 + *(double *)(v6 + 32), v5 + *(double *)(v6 + 40));
  }
  else
  {
    FigCaptionRendererSessionGetCALayerNodeLayoutForAnimation(*(_QWORD *)(v6 + 200), &v10);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
    v8 = v11;
    *(_OWORD *)(v7 + 256) = v10;
    *(_OWORD *)(v7 + 272) = v8;
  }
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSize:", *(double *)&v11 - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 272), *((double *)&v11 + 1) - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 280));
}

uint64_t __49__FigSubtitleCALayer__addBoundsAnimation_forKey___block_invoke_2(uint64_t a1, void *a2)
{
  __int128 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;

  v3 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v10 = *MEMORY[0x1E0C9D648];
  v11 = v3;
  objc_msgSend(a2, "rectValue", v10);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  if (*(_DWORD *)(v8 + 184))
    getLayoutForAnimation(v8, (uint64_t)&v10, v4, v5, v6, v7);
  else
    FigCaptionRendererSessionGetCALayerNodeLayoutForAnimation(*(_QWORD *)(v8 + 200), &v10);
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", 0.0, 0.0, v11);
}

- (void)_addPositionAnimation:(id)a3 forKey:(id)a4
{
  uint64_t (*v7)(uint64_t, void *);
  uint64_t *v8;
  id v9;
  OpaqueFigSubtitleCALayerInternal *layerInternal;
  uint64_t v11;
  uint64_t v12;

  if (objc_msgSend(a3, "isAdditive"))
  {
    v12 = MEMORY[0x1E0C809B0];
    v7 = __51__FigSubtitleCALayer__addPositionAnimation_forKey___block_invoke;
    v8 = &v12;
  }
  else
  {
    v11 = MEMORY[0x1E0C809B0];
    v7 = __51__FigSubtitleCALayer__addPositionAnimation_forKey___block_invoke_2;
    v8 = &v11;
  }
  v8[1] = 3221225472;
  v8[2] = (uint64_t)v7;
  v8[3] = (uint64_t)&unk_1E2F91E68;
  v8[4] = (uint64_t)self;
  v9 = _animationByTransformingValues(a3, (uint64_t)v8);
  objc_msgSend(v9, "setKeyPath:", CFSTR("position"));
  objc_msgSend(v9, "setDelegate:", 0);
  layerInternal = self->layerInternal;
  if (layerInternal->var12)
    -[FigSubtitleBackdropCALayer addAnimation:forKey:](self, "addAnimation:forKey:", v9, a4);
  else
    FigCaptionRendererSessionAddAnimation((uint64_t)layerInternal->var14, (uint64_t)v9, (uint64_t)a4);
}

uint64_t __51__FigSubtitleCALayer__addPositionAnimation_forKey___block_invoke(uint64_t a1, void *a2)
{
  float64x2_t v3;
  double v4;
  double v5;
  uint64_t v6;
  float64x2_t *v7;
  float64x2_t v8;
  float64x2_t v15;
  float64x2_t v16;

  v3 = *(float64x2_t *)(MEMORY[0x1E0C9D648] + 16);
  v15 = *(float64x2_t *)MEMORY[0x1E0C9D648];
  v16 = v3;
  objc_msgSend(a2, "sizeValue");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  if (*(_DWORD *)(v6 + 184))
  {
    getLayoutForAnimation(v6, (uint64_t)&v15, 0.0, 0.0, v4 + *(double *)(v6 + 32), v5 + *(double *)(v6 + 40));
  }
  else
  {
    FigCaptionRendererSessionGetCALayerNodeLayoutForAnimation(*(_QWORD *)(v6 + 200), &v15);
    v7 = *(float64x2_t **)(*(_QWORD *)(a1 + 32) + 48);
    v8 = v16;
    v7[16] = v15;
    v7[17] = v8;
  }
  __asm { FMOV            V4.2D, #0.5 }
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:", vsubq_f64(vmlaq_f64(v15, _Q4, v16), vmlaq_f64(*(float64x2_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 256), _Q4, *(float64x2_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 272))));
}

uint64_t __51__FigSubtitleCALayer__addPositionAnimation_forKey___block_invoke_2(uint64_t a1, void *a2)
{
  __int128 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;

  v3 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v10 = *MEMORY[0x1E0C9D648];
  v11 = v3;
  objc_msgSend(a2, "rectValue");
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  if (*(_DWORD *)(v8 + 184))
    getLayoutForAnimation(v8, (uint64_t)&v10, v4, v5, v6, v7);
  else
    FigCaptionRendererSessionGetCALayerNodeLayoutForAnimation(*(_QWORD *)(v8 + 200), &v10);
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:", *(double *)&v10 + *(double *)&v11 * 0.5, *((double *)&v10 + 1) + *((double *)&v11 + 1) * 0.5);
}

- (void)handleNeedsLayoutNotification
{
  NSObject *var11;
  uint64_t v4;
  _QWORD v5[6];
  _QWORD block[6];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  unint64_t v10;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0xBFF0000000000000;
  var11 = self->layerInternal->var11;
  if (var11)
  {
    v4 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__FigSubtitleCALayer_handleNeedsLayoutNotification__block_invoke;
    block[3] = &unk_1E2F8AFB8;
    block[4] = self;
    block[5] = &v7;
    dispatch_sync(var11, block);
    if (v8[3] >= 0.0)
    {
      v5[0] = v4;
      v5[1] = 3221225472;
      v5[2] = __51__FigSubtitleCALayer_handleNeedsLayoutNotification__block_invoke_2;
      v5[3] = &unk_1E2F8B100;
      v5[4] = self;
      v5[5] = &v7;
      dispatch_async(MEMORY[0x1E0C80D38], v5);
    }
  }
  updateSubtitleDisplay((uint64_t)self->layerInternal, 1);
  _Block_object_dispose(&v7, 8);
}

void __51__FigSubtitleCALayer_handleNeedsLayoutNotification__block_invoke(uint64_t a1)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = FigSubtitleRendererGetWindowOpacity(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 208));
}

uint64_t __51__FigSubtitleCALayer_handleNeedsLayoutNotification__block_invoke_2(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(*(id *)(a1 + 32), "updateWindowOpacity:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)setCaptionRenderingStrategy:(id)a3
{
  id v4;
  void *v5;
  OpaqueFigSubtitleCALayerInternal *layerInternal;
  __CFString *var13;
  __CFString **v8;
  __CFString *v9;
  __CFString *v10;

  v4 = (id)objc_msgSend(a3, "copy");
  if (v4)
  {
    v5 = v4;
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("CoreTextSubtitleRenderer")))
    {
      layerInternal = self->layerInternal;
      var13 = layerInternal->var13;
      v8 = kFigPlayerCaptionRenderingStrategy_CoreTextSubtitleRenderer;
    }
    else
    {
      if (!objc_msgSend(v5, "isEqualToString:", CFSTR("CaptionDisplayService")))
        return;
      layerInternal = self->layerInternal;
      var13 = layerInternal->var13;
      v8 = kFigPlayerCaptionRenderingStrategy_CaptionDisplayService;
    }
    v10 = *v8;
    layerInternal->var13 = *v8;
    if (v10)
      CFRetain(v10);
    if (var13)
      CFRelease(var13);
  }
  else
  {
    v9 = self->layerInternal->var13;
    if (v9)
    {
      CFRelease(v9);
      self->layerInternal->var13 = 0;
    }
  }
}

- (NSString)captionRenderingStrategy
{
  NSString *result;

  result = &self->layerInternal->var13->isa;
  if (result)
  {
    if (FigCFEqual())
    {
      return (NSString *)CFSTR("CoreTextSubtitleRenderer");
    }
    else if (FigCFEqual())
    {
      return (NSString *)CFSTR("CaptionDisplayService");
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)setPlayer:(OpaqueFigPlayer *)a3
{
  OpaqueFigSubtitleCALayerInternal *layerInternal;
  unsigned int var12;
  OpaqueFigPlayer *var0;
  uint64_t FigBaseObject;
  void (*v8)(uint64_t, const __CFString *, _QWORD, CFTypeRef *);
  CFTypeRef cf;

  layerInternal = self->layerInternal;
  cf = 0;
  if (!layerInternal->var9)
  {
    if (a3)
    {
      if (FigCFEqual())
      {
        if (layerInternal->var12 == 1)
        {
          releaseCoreTextRenderer((uint64_t)layerInternal);
          setupFCR((uint64_t)layerInternal);
          layerInternal->var12 = 0;
        }
      }
      else if (FigCFEqual() && !layerInternal->var12)
      {
        releaseFCR((uint64_t)layerInternal);
        setupCoreTextRenderer((uint64_t)layerInternal);
        layerInternal->var12 = 1;
      }
    }
    var12 = layerInternal->var12;
    if (!var12)
    {
      FigCaptionRendererSessionSetPlayer((uint64_t)layerInternal->var14, (uint64_t)a3);
      var12 = layerInternal->var12;
    }
    if (var12 == 1)
    {
      if (layerInternal->var0)
      {
        CMNotificationCenterGetDefaultLocalCenter();
        CMNotificationCenterRemoveListener();
        var0 = layerInternal->var0;
      }
      else
      {
        var0 = 0;
      }
      layerInternal->var0 = a3;
      if (a3)
        CFRetain(a3);
      if (var0)
        CFRelease(var0);
      if (layerInternal->var0)
      {
        CMNotificationCenterGetDefaultLocalCenter();
        CMNotificationCenterAddListener();
        FigBaseObject = FigPlayerGetFigBaseObject(layerInternal->var0);
        v8 = *(void (**)(uint64_t, const __CFString *, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                 + 8)
                                                                                     + 48);
        if (v8)
        {
          v8(FigBaseObject, CFSTR("LastSentSubtitleSample"), *MEMORY[0x1E0C9AE00], &cf);
          if (cf)
          {
            digestSubtitleSample(1, (uint64_t)layerInternal, cf);
            if (cf)
              CFRelease(cf);
          }
        }
      }
    }
  }
}

- (void)setViewport:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  OpaqueFigSubtitleCALayerInternal *layerInternal;
  unsigned int var12;
  CFIndex Count;
  CFIndex v11;
  CFIndex i;
  void *ValueAtIndex;
  OpaqueFigSubtitleCALayerInternal *v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  layerInternal = self->layerInternal;
  if (!layerInternal->var12)
  {
    -[FigSubtitleBackdropCALayer setBounds:](self, "setBounds:", 0.0, 0.0, a3.size.width, a3.size.height);
    -[FigSubtitleCALayer setPosition:](self, "setPosition:", width * 0.5, height * 0.5);
    layerInternal = self->layerInternal;
  }
  if (width >= 0.0 && height >= 0.0)
  {
    layerInternal->var2.origin.x = x;
    layerInternal->var2.origin.y = y;
    layerInternal->var2.size.width = width;
    layerInternal->var2.size.height = height;
    var12 = layerInternal->var12;
    if (!var12)
    {
      FigCaptionRendererSessionSetLayoutContext_Viewport((uint64_t)layerInternal->var14, x, y, width, height);
      var12 = layerInternal->var12;
    }
    if (var12 == 1)
    {
      Count = CFArrayGetCount(layerInternal->var19);
      if (Count >= 1)
      {
        v11 = Count;
        for (i = 0; i != v11; ++i)
        {
          ValueAtIndex = (void *)CFArrayGetValueAtIndex(layerInternal->var19, i);
          objc_msgSend(ValueAtIndex, "setViewport:", FCRGetVideoPresentationBounds(layerInternal->var3.width, layerInternal->var3.height, x, y, width, height));
        }
      }
    }
  }
  v14 = self->layerInternal;
  if (v14->var12 == 1)
    updateSubtitleDisplay((uint64_t)v14, 0);
}

- (void)setVideosize:(CGSize)a3
{
  OpaqueFigSubtitleCALayerInternal *layerInternal;
  CGFloat height;
  CGFloat width;
  OpaqueFigSubtitleCALayerInternal *v6;

  layerInternal = self->layerInternal;
  if (a3.width >= 0.0)
  {
    height = a3.height;
    if (a3.height >= 0.0)
    {
      width = a3.width;
      v6 = self->layerInternal;
      if (!layerInternal->var12)
      {
        FigCaptionRendererSessionSetLayoutContext_VideoSize(layerInternal->var14, a3.width, a3.height);
        v6 = self->layerInternal;
      }
      layerInternal->var3.width = width;
      layerInternal->var3.height = height;
      layerInternal = v6;
    }
  }
  if (layerInternal->var12 == 1)
    updateSubtitleDisplay((uint64_t)layerInternal, 0);
}

- (void)setSubtitleGravityNonObscuring:(unsigned __int8)a3
{
  OpaqueFigSubtitleCALayerInternal *layerInternal;
  unsigned int var12;
  OpaqueFigSubtitleCALayerInternal *v7;

  layerInternal = self->layerInternal;
  var12 = layerInternal->var12;
  v7 = layerInternal;
  if (!var12)
  {
    FigCaptionRendererSessionSetLayoutContext_Gravity(layerInternal->var14, a3);
    v7 = self->layerInternal;
    var12 = v7->var12;
  }
  layerInternal->var4 = a3;
  if (var12 == 1)
    updateSubtitleDisplay((uint64_t)v7, 0);
}

- (void)updateNonForcedSubtitleDisplayEnabled:(unsigned __int8)a3
{
  OpaqueFigSubtitleCALayerInternal *layerInternal;
  _QWORD v5[2];

  layerInternal = self->layerInternal;
  v5[0] = layerInternal;
  v5[1] = a3;
  if (layerInternal->var11)
  {
    dispatch_sync_f((dispatch_queue_t)layerInternal->var11, v5, (dispatch_function_t)updateNonForcedSubtitleDisplayEnabledDo);
    layerInternal = self->layerInternal;
  }
  if (layerInternal->var12 == 1)
    updateSubtitleDisplay((uint64_t)layerInternal, 1);
}

- (void)setVideoRelativeToViewport:(CGRect)a3
{
  OpaqueFigSubtitleCALayerInternal *layerInternal;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  OpaqueFigSubtitleCALayerInternal *v8;

  layerInternal = self->layerInternal;
  if (a3.size.width >= 0.0)
  {
    height = a3.size.height;
    if (a3.size.height >= 0.0)
    {
      width = a3.size.width;
      y = a3.origin.y;
      x = a3.origin.x;
      v8 = self->layerInternal;
      if (!layerInternal->var12)
      {
        FigCaptionRendererSessionSetLayoutContext_VideoRelativeToViewport(layerInternal->var14, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
        v8 = self->layerInternal;
      }
      layerInternal->var5.origin.x = x;
      layerInternal->var5.origin.y = y;
      layerInternal->var5.size.width = width;
      layerInternal->var5.size.height = height;
      layerInternal = v8;
    }
  }
  if (layerInternal->var12 == 1)
    updateSubtitleDisplay((uint64_t)layerInternal, 0);
}

- (void)setCaptionsAvoidanceMargins:(FigGeometryMargins *)a3
{
  OpaqueFigSubtitleCALayerInternal *layerInternal;
  NSObject *var14;
  FigGeometryDimension right;
  FigGeometryDimension bottom;
  OpaqueFigSubtitleCALayerInternal *v8;
  FigGeometryMargins v9;
  _OWORD v10[4];

  layerInternal = self->layerInternal;
  v9 = *a3;
  if (!layerInternal->var12)
  {
    var14 = layerInternal->var14;
    right = a3->right;
    v10[0] = a3->left;
    v10[1] = right;
    bottom = a3->bottom;
    v10[2] = a3->top;
    v10[3] = bottom;
    FigCaptionRendererSessionSetLayoutContext_CaptionsAvoidanceMargins(var14, v10);
  }
  layerInternal->var6 = v9;
  v8 = self->layerInternal;
  if (v8->var12 == 1)
    updateSubtitleDisplay((uint64_t)v8, 0);
}

- (void)setCaptionRendererOutputOptions:(id)a3 forKeyPath:(id)a4
{
  if (a4)
    FigCaptionRendererSessionSetOptions((uint64_t)self->layerInternal->var14, (uint64_t)a4, (uint64_t)a3);
}

- (void)setCaptionRendererOutputSeparated:(BOOL)a3
{
  FigCaptionRendererSessionSetSeparated((uint64_t)self->layerInternal->var14, a3);
}

- (BOOL)isOverscanSubtitleSupportEnabled
{
  OpaqueFigSubtitleCALayerInternal *layerInternal;
  unsigned int var12;
  BOOL v4;
  NSObject *var11;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  layerInternal = self->layerInternal;
  var12 = layerInternal->var12;
  if (var12 == 1)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v11 = 0;
    var11 = layerInternal->var11;
    if (var11)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __54__FigSubtitleCALayer_isOverscanSubtitleSupportEnabled__block_invoke;
      v7[3] = &unk_1E2F8AFB8;
      v7[4] = self;
      v7[5] = &v8;
      dispatch_sync(var11, v7);
      v4 = *((_BYTE *)v9 + 24) != 0;
    }
    else
    {
      v4 = 0;
    }
    _Block_object_dispose(&v8, 8);
  }
  else if (var12)
  {
    return 0;
  }
  else
  {
    LOBYTE(v8) = 0;
    return FigCaptionRendererSessionGetLayoutContext_Overscan((uint64_t)layerInternal->var14, &v8) != 0;
  }
  return v4;
}

uint64_t __54__FigSubtitleCALayer_isOverscanSubtitleSupportEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 48)
                                                                            + 169);
  return result;
}

- (void)setOverscanSubtitleSupportEnabled:(BOOL)a3
{
  OpaqueFigSubtitleCALayerInternal *layerInternal;
  double v6;
  double v7;
  double v8;
  double v9;
  NSObject *var11;
  double v11;
  double v12;
  double v13;
  double v14;
  _QWORD v15[5];
  BOOL v16;

  layerInternal = self->layerInternal;
  if (!layerInternal->var12)
    FigCaptionRendererSessionSetLayoutContext_Overscan(layerInternal->var14, a3);
  -[FigSubtitleCALayer bounds](self, "bounds");
  var11 = self->layerInternal->var11;
  if (var11)
  {
    v11 = v6;
    v12 = v7;
    v13 = v8;
    v14 = v9;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __56__FigSubtitleCALayer_setOverscanSubtitleSupportEnabled___block_invoke;
    v15[3] = &unk_1E2F8B030;
    v15[4] = self;
    v16 = a3;
    dispatch_sync(var11, v15);
    -[FigSubtitleBackdropCALayer setBounds:](self, "setBounds:", v11, v12, v13, v14);
  }
}

uint64_t __56__FigSubtitleCALayer_setOverscanSubtitleSupportEnabled___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 48) + 169) = *(_BYTE *)(result + 40);
  return result;
}

- (void)addAnimations:(id)a3 forKey:(id)a4
{
  if (!self->layerInternal->var12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[FigSubtitleCALayer _addBoundsAnimation:forKey:](self, "_addBoundsAnimation:forKey:", a3, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FigSubtitleCALayer_Bounds_%@"), a4));
      -[FigSubtitleCALayer _addPositionAnimation:forKey:](self, "_addPositionAnimation:forKey:", a3, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FigSubtitleCALayer_Position_%@"), a4));
    }
  }
  if (self->layerInternal->var12 == 1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[FigSubtitleCALayer _addBoundsAnimation:forKey:](self, "_addBoundsAnimation:forKey:", a3, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FigSubtitleCALayer_Bounds_%@"), a4));
      -[FigSubtitleCALayer _addPositionAnimation:forKey:](self, "_addPositionAnimation:forKey:", a3, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FigSubtitleCALayer_Position_%@"), a4));
    }
  }
}

- (void)removeAnimationsForKey:(id)a3
{
  unsigned int var12;
  objc_super v6;
  objc_super v7;
  objc_super v8;
  objc_super v9;

  var12 = self->layerInternal->var12;
  if (!var12)
  {
    v9.receiver = self;
    v9.super_class = (Class)FigSubtitleCALayer;
    -[FigSubtitleCALayer removeAnimationForKey:](&v9, sel_removeAnimationForKey_, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FigSubtitleCALayer_Bounds_%@"), a3));
    v8.receiver = self;
    v8.super_class = (Class)FigSubtitleCALayer;
    -[FigSubtitleCALayer removeAnimationForKey:](&v8, sel_removeAnimationForKey_, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FigSubtitleCALayer_Position_%@"), a3));
    var12 = self->layerInternal->var12;
  }
  if (var12 == 1)
  {
    v7.receiver = self;
    v7.super_class = (Class)FigSubtitleCALayer;
    -[FigSubtitleCALayer removeAnimationForKey:](&v7, sel_removeAnimationForKey_, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FigSubtitleCALayer_Bounds_%@"), a3));
    v6.receiver = self;
    v6.super_class = (Class)FigSubtitleCALayer;
    -[FigSubtitleCALayer removeAnimationForKey:](&v6, sel_removeAnimationForKey_, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FigSubtitleCALayer_Position_%@"), a3));
  }
}

@end
