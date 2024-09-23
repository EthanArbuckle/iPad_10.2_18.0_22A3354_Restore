@implementation FigSubtitleWebVTTRegionCALayer

- (FigSubtitleWebVTTRegionCALayer)init
{
  FigSubtitleWebVTTRegionCALayer *v2;
  char *v3;
  __int128 v4;
  dispatch_queue_t v5;
  objc_super v7;
  char label[256];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)FigSubtitleWebVTTRegionCALayer;
  v2 = -[FigBaseCALayer init](&v7, sel_init);
  if (v2)
  {
    v3 = (char *)malloc_type_calloc(1uLL, 0x50uLL, 0x10A0040DD8530F3uLL);
    v2->layerInternal = (OpaqueFigSubtitleWebVTTRegionCALayerInternal *)v3;
    if (!v3)
      goto LABEL_6;
    *(_QWORD *)v3 = v2;
    v4 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    *(_OWORD *)(v3 + 24) = *MEMORY[0x1E0C9D648];
    *(_OWORD *)(v3 + 40) = v4;
    v2->layerInternal->var2 = 0;
    v2->layerInternal->var4 = 0;
    v2->layerInternal->var6 = 1;
    -[FigSubtitleWebVTTRegionCALayer setMasksToBounds:](v2, "setMasksToBounds:", 1);
    v2->layerInternal->var5 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
    if (!v2->layerInternal->var5
      || (__sprintf_chk(label, 0, 0x100uLL, "com.apple.coremedia.FigSubtitleWebVTTRegionCALayer.messagequeue<%p>", v2),
          v5 = dispatch_queue_create(label, 0),
          (v2->layerInternal->var1 = v5) == 0)
      || (CMNotificationCenterGetDefaultLocalCenter(), FigNotificationCenterAddWeakListener()))
    {
LABEL_6:

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  OpaqueFigSubtitleWebVTTRegionCALayerInternal *layerInternal;
  objc_super v4;

  layerInternal = self->layerInternal;
  if (layerInternal)
  {
    if (layerInternal->var2)
    {
      CMNotificationCenterGetDefaultLocalCenter();
      FigNotificationCenterRemoveWeakListener();
      layerInternal = self->layerInternal;
      if (layerInternal->var2)
      {
        CFRelease(layerInternal->var2);
        layerInternal = self->layerInternal;
      }
    }
    if (layerInternal->var1)
    {
      dispatch_release((dispatch_object_t)layerInternal->var1);
      layerInternal = self->layerInternal;
      layerInternal->var1 = 0;
    }
    if (layerInternal->var5)
    {
      CFRelease(layerInternal->var5);
      layerInternal = self->layerInternal;
    }
    if (!layerInternal->var4 || (CFRelease(layerInternal->var4), (layerInternal = self->layerInternal) != 0))
      free(layerInternal);
  }
  v4.receiver = self;
  v4.super_class = (Class)FigSubtitleWebVTTRegionCALayer;
  -[FigSubtitleWebVTTRegionCALayer dealloc](&v4, sel_dealloc);
}

- (__CFString)getContentID
{
  __CFString *result;
  _QWORD context[2];
  __CFString *v4;

  v4 = 0;
  context[0] = self->layerInternal;
  context[1] = &v4;
  result = *(__CFString **)(context[0] + 8);
  if (result)
  {
    dispatch_sync_f((dispatch_queue_t)result, context, (dispatch_function_t)getContentIDDo);
    return v4;
  }
  return result;
}

- (void)setContent:(__CFDictionary *)a3
{
  OpaqueFigSubtitleWebVTTRegionCALayerInternal *layerInternal;
  _QWORD v5[2];

  layerInternal = self->layerInternal;
  v5[0] = layerInternal;
  v5[1] = a3;
  if (layerInternal->var1)
  {
    dispatch_sync_f((dispatch_queue_t)layerInternal->var1, v5, (dispatch_function_t)setContentDo);
    layerInternal = self->layerInternal;
  }
  updateRegionDisplay(&layerInternal->var0);
}

- (void)setRenderer:(OpaqueFigSubtitleRenderer *)a3
{
  NSObject *v3;
  _QWORD v4[2];

  v4[0] = self->layerInternal;
  v4[1] = a3;
  v3 = *(NSObject **)(v4[0] + 8);
  if (v3)
    dispatch_sync_f(v3, v4, (dispatch_function_t)setRendererDo);
}

- (void)setViewport:(CGRect)a3
{
  OpaqueFigSubtitleWebVTTRegionCALayerInternal *layerInternal;
  OpaqueFigSubtitleWebVTTRegionCALayerInternal *context;
  CGRect v6;

  layerInternal = self->layerInternal;
  context = layerInternal;
  v6 = a3;
  if (layerInternal->var1)
  {
    dispatch_sync_f((dispatch_queue_t)layerInternal->var1, &context, (dispatch_function_t)setViewportDo);
    layerInternal = self->layerInternal;
  }
  updateRegionDisplay(&layerInternal->var0);
}

- (void)setNeedsDisplay
{
  NSObject *var1;
  objc_super v4;
  _QWORD block[5];

  var1 = self->layerInternal->var1;
  if (var1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__FigSubtitleWebVTTRegionCALayer_setNeedsDisplay__block_invoke;
    block[3] = &unk_1E2F88548;
    block[4] = self;
    dispatch_sync(var1, block);
  }
  v4.receiver = self;
  v4.super_class = (Class)FigSubtitleWebVTTRegionCALayer;
  -[FigBaseCALayer setNeedsDisplay](&v4, sel_setNeedsDisplay);
}

CFIndex __49__FigSubtitleWebVTTRegionCALayer_setNeedsDisplay__block_invoke(uint64_t a1)
{
  CFIndex result;
  CFIndex v3;
  CFIndex i;
  void *ValueAtIndex;

  result = CFArrayGetCount(*(CFArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 64));
  if (result >= 1)
  {
    v3 = result;
    for (i = 0; i != v3; ++i)
    {
      ValueAtIndex = (void *)CFArrayGetValueAtIndex(*(CFArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 64), i);
      result = objc_msgSend(ValueAtIndex, "isDirty");
      if ((_DWORD)result)
        result = objc_msgSend(ValueAtIndex, "setNeedsDisplay");
    }
  }
  return result;
}

- (void)setReLayout
{
  NSObject *var1;
  _QWORD block[5];

  var1 = self->layerInternal->var1;
  if (var1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__FigSubtitleWebVTTRegionCALayer_setReLayout__block_invoke;
    block[3] = &unk_1E2F88548;
    block[4] = self;
    dispatch_sync(var1, block);
  }
}

uint64_t __45__FigSubtitleWebVTTRegionCALayer_setReLayout__block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 72) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

- (void)layoutSublayers
{
  OpaqueFigSubtitleWebVTTRegionCALayerInternal *layerInternal;
  unsigned int var6;
  int v5;
  __int128 v6;
  NSObject *var1;
  uint64_t v8;
  NSObject *v14;
  objc_super v15;
  _QWORD v16[6];
  _QWORD block[6];
  int v18;
  uint64_t v19;
  float64x2_t *v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;

  layerInternal = self->layerInternal;
  var6 = layerInternal->var6;
  if (var6 != 2)
  {
    if (var6 == 1)
      layerInternal->var6 = 2;
    v5 = -[FigSubtitleWebVTTRegionCALayer contentsAreFlipped](self, "contentsAreFlipped");
    v19 = 0;
    v20 = (float64x2_t *)&v19;
    v21 = 0x4010000000;
    v22 = &unk_19339E166;
    v6 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    v23 = *MEMORY[0x1E0C9D648];
    v24 = v6;
    var1 = self->layerInternal->var1;
    v8 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__FigSubtitleWebVTTRegionCALayer_layoutSublayers__block_invoke;
    block[3] = &unk_1E2F8B0D8;
    block[4] = self;
    block[5] = &v19;
    v18 = v5;
    dispatch_sync(var1, block);
    __asm { FMOV            V2.2D, #0.5 }
    -[FigSubtitleWebVTTRegionCALayer setPosition:](self, "setPosition:", vaddq_f64(v20[2], vmulq_f64(v20[3], _Q2)));
    -[FigSubtitleWebVTTRegionCALayer setBounds:](self, "setBounds:", v20[2].f64[0], v20[2].f64[1], v20[3].f64[0], v20[3].f64[1]);
    v14 = self->layerInternal->var1;
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = __49__FigSubtitleWebVTTRegionCALayer_layoutSublayers__block_invoke_2;
    v16[3] = &unk_1E2F8B100;
    v16[4] = self;
    v16[5] = &v19;
    dispatch_sync(v14, v16);
    v15.receiver = self;
    v15.super_class = (Class)FigSubtitleWebVTTRegionCALayer;
    -[FigSubtitleWebVTTRegionCALayer layoutSublayers](&v15, sel_layoutSublayers);
    _Block_object_dispose(&v19, 8);
  }
}

void __49__FigSubtitleWebVTTRegionCALayer_layoutSublayers__block_invoke(uint64_t a1)
{
  double RegionBounds;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  RegionBounds = FigSubtitleRendererGetRegionBounds(*(const __CFDictionary **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 56), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 24), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 40));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(double *)(v3 + 32) = RegionBounds;
  *(_QWORD *)(v3 + 40) = v4;
  *(_QWORD *)(v3 + 48) = v5;
  *(_QWORD *)(v3 + 56) = v6;
}

void __49__FigSubtitleWebVTTRegionCALayer_layoutSublayers__block_invoke_2(uint64_t a1)
{
  CFIndex Count;
  int v3;
  uint64_t v4;
  double v5;
  double RegionDefaultFontSize;
  double v7;
  uint64_t v8;
  void *ValueAtIndex;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _QWORD *v16;
  double v17;
  double v18;
  int v19;
  double v20;

  Count = CFArrayGetCount(*(CFArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 64));
  v3 = objc_msgSend(*(id *)(a1 + 32), "contentsAreFlipped");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(double *)(v4 + 40);
  if (v3)
    v5 = v5 + *(double *)(v4 + 56);
  RegionDefaultFontSize = FigSubtitleRendererGetRegionDefaultFontSize(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 24), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 48));
  if (Count >= 1)
  {
    v7 = RegionDefaultFontSize;
    v8 = 0;
    do
    {
      ValueAtIndex = (void *)CFArrayGetValueAtIndex(*(CFArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 64), Count + v8 - 1);
      objc_msgSend(ValueAtIndex, "setViewport:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56));
      objc_msgSend(ValueAtIndex, "setDefaultFontSize:", v7);
      objc_msgSend(ValueAtIndex, "getSuggestedBounds:", 1);
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v16 = *(_QWORD **)(a1 + 32);
      if (v8 || *(_DWORD *)(v16[5] + 72))
      {
        if (objc_msgSend(v16, "contentsAreFlipped"))
          v17 = v15;
        else
          v17 = 0.0;
      }
      else
      {
        if (objc_msgSend(v16, "contentsAreFlipped"))
          v17 = 0.0;
        else
          v17 = v15;
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 72) = 2;
      }
      v18 = v5 - v17;
      objc_msgSend(ValueAtIndex, "setCuePosition:", v13 * 0.5 + v11 + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), v15 * 0.5 + v18);
      objc_msgSend(ValueAtIndex, "setNeedsLayout");
      v19 = objc_msgSend(*(id *)(a1 + 32), "contentsAreFlipped");
      v20 = -0.0;
      if (!v19)
        v20 = v15;
      v5 = v18 + v20;
      --v8;
    }
    while (Count + v8 > 0);
  }
}

- (void)handleNeedsLayoutNotification
{
  OpaqueFigSubtitleWebVTTRegionCALayerInternal *layerInternal;
  NSObject *var1;
  _QWORD block[5];

  layerInternal = self->layerInternal;
  var1 = layerInternal->var1;
  if (var1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__FigSubtitleWebVTTRegionCALayer_handleNeedsLayoutNotification__block_invoke;
    block[3] = &unk_1E2F88548;
    block[4] = self;
    dispatch_sync(var1, block);
    layerInternal = self->layerInternal;
  }
  updateRegionDisplay(&layerInternal->var0);
}

uint64_t __63__FigSubtitleWebVTTRegionCALayer_handleNeedsLayoutNotification__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 40) + 72) = 1;
  return result;
}

@end
