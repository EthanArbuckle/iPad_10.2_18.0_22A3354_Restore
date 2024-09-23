@implementation FigSubtitleWebVTTCueCALayer

- (FigSubtitleWebVTTCueCALayer)init
{
  FigSubtitleWebVTTCueCALayer *v2;
  char *v3;
  __int128 v4;
  dispatch_queue_t v5;
  objc_super v7;
  char label[256];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)FigSubtitleWebVTTCueCALayer;
  v2 = -[FigSubtitleBackdropCALayer init](&v7, sel_init);
  if (v2)
  {
    v3 = (char *)malloc_type_calloc(1uLL, 0x48uLL, 0x10A00401FA4BE4CuLL);
    v2->layerInternal = (OpaqueFigSubtitleWebVTTCueCALayerInternal *)v3;
    if (!v3)
      goto LABEL_5;
    *(_QWORD *)v3 = v2;
    v4 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    *(_OWORD *)(v3 + 24) = *MEMORY[0x1E0C9D648];
    *(_OWORD *)(v3 + 40) = v4;
    v2->layerInternal->var2 = 0;
    v2->layerInternal->var4 = 0;
    v2->layerInternal->var5 = 0;
    __sprintf_chk(label, 0, 0x100uLL, "com.apple.coremedia.FigSubtitleWebVTTCueCALayer.messagequeue<%p>", v2);
    v5 = dispatch_queue_create(label, 0);
    v2->layerInternal->var1 = v5;
    if (v5)
    {
      -[FigSubtitleBackdropCALayer setDelegate:](v2, "setDelegate:", v2);
    }
    else
    {
LABEL_5:

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  OpaqueFigSubtitleWebVTTCueCALayerInternal *layerInternal;
  objc_super v4;

  layerInternal = self->layerInternal;
  if (layerInternal)
  {
    if (layerInternal->var2)
    {
      CFRelease(layerInternal->var2);
      layerInternal = self->layerInternal;
    }
    if (layerInternal->var1)
    {
      dispatch_release((dispatch_object_t)layerInternal->var1);
      layerInternal = self->layerInternal;
      layerInternal->var1 = 0;
    }
    if (!layerInternal->var4 || (CFRelease(layerInternal->var4), (layerInternal = self->layerInternal) != 0))
      free(layerInternal);
  }
  v4.receiver = self;
  v4.super_class = (Class)FigSubtitleWebVTTCueCALayer;
  -[FigSubtitleBackdropCALayer dealloc](&v4, sel_dealloc);
}

- (void)setCuePosition:(CGPoint)a3
{
  NSObject *var1;
  OpaqueFigSubtitleWebVTTCueCALayerInternal *context;
  CGPoint v5;

  context = self->layerInternal;
  v5 = a3;
  var1 = context->var1;
  if (var1)
    dispatch_sync_f(var1, &context, (dispatch_function_t)setCuePositionDo);
}

- (CGRect)getSuggestedBounds:(unsigned __int8)a3
{
  __int128 v3;
  NSObject *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _QWORD context[3];
  __int128 v10;
  __int128 v11;
  CGRect result;

  v3 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v10 = *MEMORY[0x1E0C9D648];
  v11 = v3;
  context[0] = self->layerInternal;
  context[1] = a3;
  context[2] = &v10;
  v4 = *(NSObject **)(context[0] + 8);
  if (v4)
    dispatch_sync_f(v4, context, (dispatch_function_t)getSuggestedBoundsDo);
  v6 = *((double *)&v10 + 1);
  v5 = *(double *)&v10;
  v8 = *((double *)&v11 + 1);
  v7 = *(double *)&v11;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (unsigned)isDirty
{
  NSObject *var1;
  unsigned __int8 v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  var1 = self->layerInternal->var1;
  if (var1)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __38__FigSubtitleWebVTTCueCALayer_isDirty__block_invoke;
    v5[3] = &unk_1E2F8AFB8;
    v5[4] = self;
    v5[5] = &v6;
    dispatch_sync(var1, v5);
    v3 = *((_BYTE *)v7 + 24);
  }
  else
  {
    v3 = 0;
  }
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__FigSubtitleWebVTTCueCALayer_isDirty__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 48)
                                                                            + 64);
  return result;
}

- (__CFString)getContentID
{
  __CFString *result;
  _QWORD context[2];
  __CFString *v4;

  context[0] = self->layerInternal;
  context[1] = &v4;
  result = *(__CFString **)(context[0] + 8);
  if (result)
  {
    v4 = 0;
    dispatch_sync_f((dispatch_queue_t)result, context, (dispatch_function_t)getContentIDDo_0);
    return v4;
  }
  return result;
}

- (void)setContent:(__CFAttributedString *)a3
{
  NSObject *v3;
  _QWORD v4[2];

  v4[0] = self->layerInternal;
  v4[1] = a3;
  v3 = *(NSObject **)(v4[0] + 8);
  if (v3)
    dispatch_sync_f(v3, v4, (dispatch_function_t)setContentDo_0);
}

- (void)setRenderer:(OpaqueFigSubtitleRenderer *)a3
{
  NSObject *v3;
  _QWORD v4[2];

  v4[0] = self->layerInternal;
  v4[1] = a3;
  v3 = *(NSObject **)(v4[0] + 8);
  if (v3)
    dispatch_sync_f(v3, v4, (dispatch_function_t)setRendererDo_0);
}

- (void)setViewport:(CGRect)a3
{
  NSObject *var1;
  OpaqueFigSubtitleWebVTTCueCALayerInternal *context;
  CGRect v5;

  context = self->layerInternal;
  v5 = a3;
  var1 = context->var1;
  if (var1)
    dispatch_sync_f(var1, &context, (dispatch_function_t)setViewportDo_0);
}

- (void)setDefaultFontSize:(double)a3
{
  NSObject *v3;
  _QWORD v4[2];

  v4[0] = self->layerInternal;
  *(double *)&v4[1] = a3;
  v3 = *(NSObject **)(v4[0] + 8);
  if (v3)
    dispatch_sync_f(v3, v4, (dispatch_function_t)setDefaultFontSizeDo);
}

- (void)layoutSublayersOfLayer:(id)a3
{
  NSObject *var1;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  NSObject *v23;
  NSObject *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  _QWORD v30[6];
  _QWORD v31[5];
  _QWORD block[5];
  CGRect v33;

  var1 = self->layerInternal->var1;
  v6 = MEMORY[0x1E0C809B0];
  if (var1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__FigSubtitleWebVTTCueCALayer_layoutSublayersOfLayer___block_invoke;
    block[3] = &unk_1E2F88548;
    block[4] = self;
    dispatch_sync(var1, block);
  }
  -[FigSubtitleWebVTTCueCALayer getSuggestedBounds:](self, "getSuggestedBounds:", 0);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(a3, "bounds");
  v18 = v17;
  v20 = v19;
  v21 = v15;
  v22 = v16;
  if (v16 <= 0.0 || v15 <= 0.0 || fabs((v12 - v15) / v15) >= 0.02 || fabs((v14 - v16) / v16) >= 0.02)
  {
    v23 = self->layerInternal->var1;
    if (v23)
    {
      v31[0] = v6;
      v31[1] = 3221225472;
      v31[2] = __54__FigSubtitleWebVTTCueCALayer_layoutSublayersOfLayer___block_invoke_2;
      v31[3] = &unk_1E2F88548;
      v31[4] = self;
      dispatch_sync(v23, v31);
    }
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  if (!pthread_main_np())
    objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", 1);
  v24 = self->layerInternal->var1;
  if (v24)
  {
    v30[0] = v6;
    v30[1] = 3221225472;
    v30[2] = __54__FigSubtitleWebVTTCueCALayer_layoutSublayersOfLayer___block_invoke_3;
    v30[3] = &unk_1E2F8AEF0;
    v30[4] = a3;
    v30[5] = self;
    dispatch_sync(v24, v30);
  }
  v33.origin.x = v18;
  v33.origin.y = v20;
  v33.size.width = v21;
  v33.size.height = v22;
  if (CGRectEqualToRect(v33, *MEMORY[0x1E0C9D648]))
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    objc_msgSend(a3, "setPosition:", v8 + v12 * 0.5, v10 + v14 * 0.5);
  }
  else
  {
    objc_msgSend(a3, "position");
    v26 = v25;
    v28 = v27;
    v29 = (void *)objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("position"));
    objc_msgSend(v29, "setFromValue:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:", v26, v28));
    objc_msgSend(v29, "setToValue:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:", v8 + v12 * 0.5, v10 + v14 * 0.5));
    objc_msgSend(v29, "setDuration:", 0.433);
    objc_msgSend(a3, "setPosition:", v8 + v12 * 0.5, v10 + v14 * 0.5);
    objc_msgSend(a3, "addAnimation:forKey:", v29, CFSTR("animatePosition"));
  }
  objc_msgSend(a3, "setBounds:", v8, v10, v12, v14);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

uint64_t __54__FigSubtitleWebVTTCueCALayer_layoutSublayersOfLayer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateWindowOpacity:", FigSubtitleRendererGetWindowOpacity(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 16)));
}

uint64_t __54__FigSubtitleWebVTTCueCALayer_layoutSublayersOfLayer___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 48) + 64) = 1;
  return result;
}

uint64_t __54__FigSubtitleWebVTTCueCALayer_layoutSublayersOfLayer___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCornerRadius:", FigSubtitleRendererGetWindowRoundedCornerRadius(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 48) + 16)));
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  NSObject *var1;
  uint64_t v8;
  const void *v9;
  __CFDictionary *SubtitleSampleFromAttributedString;
  CGFloat *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  OpaqueFigSubtitleRenderer *var2;
  const void *v18;
  NSObject *v19;
  _QWORD v20[5];
  CGAffineTransform transform;
  CGFloat v22;
  __int128 v23;
  _QWORD block[7];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  CGRect v33;

  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  var1 = self->layerInternal->var1;
  if (var1)
  {
    v8 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__FigSubtitleWebVTTCueCALayer_drawLayer_inContext___block_invoke;
    block[3] = &unk_1E2F8AF40;
    block[4] = self;
    block[5] = &v25;
    block[6] = &v29;
    dispatch_sync(var1, block);
    if (*((_BYTE *)v26 + 24))
    {
      v9 = (const void *)v30[3];
      if (v9)
      {
        SubtitleSampleFromAttributedString = FigSubtitleRendererCreateSubtitleSampleFromAttributedString(v9);
        if (!SubtitleSampleFromAttributedString)
          goto LABEL_15;
        CGContextSaveGState(a4);
        v11 = (CGFloat *)MEMORY[0x1E0C9BAA8];
        v23 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 8);
        if (objc_msgSend(a3, "contentsAreFlipped"))
        {
          objc_msgSend(a3, "frame");
          v13 = v12;
          v23 = 0uLL;
          transform.b = 0.0;
          transform.c = 0.0;
          transform.a = 1.0;
          *(_OWORD *)&transform.d = xmmword_1932FAA90;
          transform.ty = v12;
          CGContextConcatCTM(a4, &transform);
          v14 = 0.0;
          v15 = -1.0;
          v16 = 1.0;
        }
        else
        {
          v16 = *v11;
          v15 = v11[3];
          v14 = v11[4];
          v13 = v11[5];
        }
        var2 = self->layerInternal->var2;
        *(_QWORD *)&transform.a = a4;
        transform.b = v16;
        *(_OWORD *)&transform.c = v23;
        transform.tx = v15;
        transform.ty = v14;
        v22 = v13;
        FigSubtitleRendererDrawSubtitleText((uint64_t)var2, (uint64_t)SubtitleSampleFromAttributedString, (uint64_t)&transform);
        CFRelease(SubtitleSampleFromAttributedString);
        CGContextRestoreGState(a4);
        v18 = (const void *)v30[3];
        if (v18)
          CFRelease(v18);
      }
      else
      {
        objc_msgSend(a3, "bounds");
        CGContextClearRect(a4, v33);
      }
      v19 = self->layerInternal->var1;
      v20[0] = v8;
      v20[1] = 3221225472;
      v20[2] = __51__FigSubtitleWebVTTCueCALayer_drawLayer_inContext___block_invoke_2;
      v20[3] = &unk_1E2F88548;
      v20[4] = self;
      dispatch_sync(v19, v20);
      objc_msgSend(a3, "superlayer");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_14:
        objc_msgSend((id)objc_msgSend(a3, "superlayer"), "setReLayout");
        goto LABEL_15;
      }
      objc_msgSend(a3, "superlayer");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        a3 = (id)objc_msgSend(a3, "superlayer");
        goto LABEL_14;
      }
    }
  }
LABEL_15:
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
}

CFTypeRef __51__FigSubtitleWebVTTCueCALayer_drawLayer_inContext___block_invoke(_QWORD *a1)
{
  CFTypeRef result;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1[4] + 48) + 64);
  result = *(CFTypeRef *)(*(_QWORD *)(a1[4] + 48) + 56);
  if (result)
    result = CFRetain(result);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

uint64_t __51__FigSubtitleWebVTTCueCALayer_drawLayer_inContext___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 48) + 64) = 0;
  return result;
}

@end
