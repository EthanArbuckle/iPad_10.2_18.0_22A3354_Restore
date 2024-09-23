@implementation FigSubtitleBackdropCALayer

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E38], "null", a3, a4);
}

- (FigSubtitleBackdropCALayer)init
{
  FigSubtitleBackdropCALayer *v2;
  OpaqueFigSubtitleBackdropCALayerInternal *v3;
  dispatch_queue_t v4;
  objc_super v6;
  char label[256];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)FigSubtitleBackdropCALayer;
  v2 = -[FigBaseCALayer init](&v6, sel_init);
  if (v2)
  {
    v3 = (OpaqueFigSubtitleBackdropCALayerInternal *)malloc_type_calloc(1uLL, 0x38uLL, 0x108004000F36631uLL);
    v2->bdLayerInternal = v3;
    v3->var0 = v2;
    *(_WORD *)&v3->var2 = 0;
    v3->var4 = 0.0;
    __sprintf_chk(label, 0, 0x100uLL, "com.apple.coremedia.FigSubtitleBackdropCALayer.messagequeue<%p>", v2);
    v4 = dispatch_queue_create(label, 0);
    v2->bdLayerInternal->var1 = v4;
    if (!v4)
    {

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  OpaqueFigSubtitleBackdropCALayerInternal *bdLayerInternal;
  dispatch_object_t *v4;
  objc_super v5;

  bdLayerInternal = self->bdLayerInternal;
  if (bdLayerInternal)
  {

    v4 = (dispatch_object_t *)self->bdLayerInternal;
    if (v4[1])
    {
      dispatch_release(v4[1]);
      v4 = (dispatch_object_t *)self->bdLayerInternal;
      v4[1] = 0;
    }
    free(v4);
  }
  v5.receiver = self;
  v5.super_class = (Class)FigSubtitleBackdropCALayer;
  -[FigSubtitleBackdropCALayer dealloc](&v5, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  NSObject *var1;
  objc_super v6;
  _QWORD block[6];

  var1 = self->bdLayerInternal->var1;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__FigSubtitleBackdropCALayer_setDelegate___block_invoke;
  block[3] = &unk_1E2F8AEF0;
  block[4] = self;
  block[5] = a3;
  dispatch_sync(var1, block);
  v6.receiver = self;
  v6.super_class = (Class)FigSubtitleBackdropCALayer;
  -[FigSubtitleBackdropCALayer setDelegate:](&v6, sel_setDelegate_, a3);
}

uint64_t __42__FigSubtitleBackdropCALayer_setDelegate___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 40) + 48) = *(_QWORD *)(result + 40);
  return result;
}

- (void)setCornerRadius:(double)a3
{
  OpaqueFigSubtitleBackdropCALayerInternal *bdLayerInternal;
  NSObject *var1;
  objc_super v7;
  _QWORD block[8];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3052000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  v20 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__2;
  v13 = __Block_byref_object_dispose__2;
  bdLayerInternal = self->bdLayerInternal;
  v14 = 0;
  var1 = bdLayerInternal->var1;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__FigSubtitleBackdropCALayer_setCornerRadius___block_invoke;
  block[3] = &unk_1E2F8AF18;
  block[4] = self;
  block[5] = &v21;
  block[6] = &v15;
  block[7] = &v9;
  dispatch_sync(var1, block);
  if (*((_BYTE *)v22 + 24))
  {
    objc_msgSend((id)v16[5], "setCornerRadius:", a3);
    objc_msgSend((id)v10[5], "setCornerRadius:", a3);
  }

  v7.receiver = self;
  v7.super_class = (Class)FigSubtitleBackdropCALayer;
  -[FigSubtitleBackdropCALayer setCornerRadius:](&v7, sel_setCornerRadius_, a3);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
}

id __46__FigSubtitleBackdropCALayer_setCornerRadius___block_invoke(_QWORD *a1)
{
  id result;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1[4] + 40) + 16);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = *(id *)(*(_QWORD *)(a1[4] + 40) + 40);
  result = *(id *)(*(_QWORD *)(a1[4] + 40) + 32);
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) = result;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  OpaqueFigSubtitleBackdropCALayerInternal *bdLayerInternal;
  NSObject *var1;
  void *v10;
  void *v11;
  objc_super v12;
  _QWORD block[8];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3052000000;
  v23 = __Block_byref_object_copy__2;
  v24 = __Block_byref_object_dispose__2;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  bdLayerInternal = self->bdLayerInternal;
  v19 = 0;
  var1 = bdLayerInternal->var1;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__FigSubtitleBackdropCALayer_setBounds___block_invoke;
  block[3] = &unk_1E2F8AF18;
  block[4] = self;
  block[5] = &v26;
  block[6] = &v20;
  block[7] = &v14;
  dispatch_sync(var1, block);
  if (*((_BYTE *)v27 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    if (!pthread_main_np())
      objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", 1);
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    v10 = (void *)v21[5];
    if (v10)
    {
      objc_msgSend(v10, "setBounds:", x, y, width, height);
      objc_msgSend((id)v21[5], "setPosition:", x + width * 0.5, y + height * 0.5);
    }
    v11 = (void *)v15[5];
    if (v11)
    {
      objc_msgSend(v11, "setHidden:", 0);
      objc_msgSend((id)v15[5], "setBounds:", x, y, width, height);
      objc_msgSend((id)v15[5], "setPosition:", x + width * 0.5, y + height * 0.5);
    }
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }

  v12.receiver = self;
  v12.super_class = (Class)FigSubtitleBackdropCALayer;
  -[FigSubtitleBackdropCALayer setBounds:](&v12, sel_setBounds_, x, y, width, height);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);
}

id __40__FigSubtitleBackdropCALayer_setBounds___block_invoke(_QWORD *a1)
{
  id result;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1[4] + 40) + 16);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = *(id *)(*(_QWORD *)(a1[4] + 40) + 40);
  result = *(id *)(*(_QWORD *)(a1[4] + 40) + 32);
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) = result;
  return result;
}

- (void)setContents:(id)a3
{
  NSObject *var1;
  objc_super v6;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__2;
  v12 = __Block_byref_object_dispose__2;
  v13 = 0;
  var1 = self->bdLayerInternal->var1;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__FigSubtitleBackdropCALayer_setContents___block_invoke;
  block[3] = &unk_1E2F8AF40;
  block[4] = self;
  block[5] = &v14;
  block[6] = &v8;
  dispatch_sync(var1, block);
  if (*((_BYTE *)v15 + 24))
  {
    objc_msgSend((id)v9[5], "setContents:", a3);

  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)FigSubtitleBackdropCALayer;
    -[FigSubtitleBackdropCALayer setContents:](&v6, sel_setContents_, a3);
  }
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v14, 8);
}

_QWORD *__42__FigSubtitleBackdropCALayer_setContents___block_invoke(_QWORD *result)
{
  _QWORD *v1;

  *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result[4] + 40) + 16);
  if (*(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24))
  {
    v1 = result;
    result = *(id *)(*(_QWORD *)(result[4] + 40) + 40);
    *(_QWORD *)(*(_QWORD *)(v1[6] + 8) + 40) = result;
  }
  return result;
}

- (void)setNeedsDisplay
{
  NSObject *var1;
  objc_super v4;
  _QWORD block[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  var1 = self->bdLayerInternal->var1;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__FigSubtitleBackdropCALayer_setNeedsDisplay__block_invoke;
  block[3] = &unk_1E2F8AF40;
  block[4] = self;
  block[5] = &v12;
  block[6] = &v6;
  dispatch_sync(var1, block);
  if (*((_BYTE *)v13 + 24))
  {
    objc_msgSend((id)v7[5], "setNeedsDisplay");

  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)FigSubtitleBackdropCALayer;
    -[FigBaseCALayer setNeedsDisplay](&v4, sel_setNeedsDisplay);
  }
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v12, 8);
}

_QWORD *__45__FigSubtitleBackdropCALayer_setNeedsDisplay__block_invoke(_QWORD *result)
{
  _QWORD *v1;

  *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result[4] + 40) + 16);
  if (*(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24))
  {
    v1 = result;
    result = *(id *)(*(_QWORD *)(result[4] + 40) + 40);
    *(_QWORD *)(*(_QWORD *)(v1[6] + 8) + 40) = result;
  }
  return result;
}

- (void)setNeedsLayout
{
  OpaqueFigSubtitleBackdropCALayerInternal *bdLayerInternal;
  NSObject *var1;
  objc_super v5;
  _QWORD block[8];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__2;
  v17 = __Block_byref_object_dispose__2;
  v18 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  bdLayerInternal = self->bdLayerInternal;
  v12 = 0;
  var1 = bdLayerInternal->var1;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__FigSubtitleBackdropCALayer_setNeedsLayout__block_invoke;
  block[3] = &unk_1E2F8AF18;
  block[4] = self;
  block[5] = &v19;
  block[6] = &v13;
  block[7] = &v7;
  dispatch_sync(var1, block);
  if (*((_BYTE *)v20 + 24))
  {
    objc_msgSend((id)v14[5], "setNeedsLayout");
    objc_msgSend((id)v8[5], "setNeedsLayout");
  }

  v5.receiver = self;
  v5.super_class = (Class)FigSubtitleBackdropCALayer;
  -[FigSubtitleBackdropCALayer setNeedsLayout](&v5, sel_setNeedsLayout);
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
}

id __44__FigSubtitleBackdropCALayer_setNeedsLayout__block_invoke(_QWORD *a1)
{
  id result;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1[4] + 40) + 16);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = *(id *)(*(_QWORD *)(a1[4] + 40) + 40);
  result = *(id *)(*(_QWORD *)(a1[4] + 40) + 32);
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) = result;
  return result;
}

- (BOOL)shouldEnableBackdropLayer
{
  NSObject *var1;
  BOOL v3;
  _QWORD block[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  double *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = (double *)&v10;
  v12 = 0x2020000000;
  v13 = 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  var1 = self->bdLayerInternal->var1;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__FigSubtitleBackdropCALayer_shouldEnableBackdropLayer__block_invoke;
  block[3] = &unk_1E2F8AF40;
  block[4] = self;
  block[5] = &v10;
  block[6] = &v6;
  dispatch_sync(var1, block);
  v3 = 0;
  if (v11[3] > 0.0)
    v3 = *((_BYTE *)v7 + 24) != 0;
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
  return v3;
}

double __55__FigSubtitleBackdropCALayer_shouldEnableBackdropLayer__block_invoke(_QWORD *a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1[4] + 40) + 24);
  *(double *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1[4] + 40) + 17);
  return result;
}

- (void)updateBackdropLayer
{
  _BOOL4 v3;
  NSObject *var1;
  uint64_t v5;
  FigSubtitleBackdropCALayerContentLayer *v6;
  FigCaptionBackdropLayer *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[6];
  _QWORD v11[7];
  _QWORD v12[6];
  _QWORD v13[7];
  _QWORD v14[8];
  _QWORD block[7];
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3052000000;
  v26 = __Block_byref_object_copy__2;
  v27 = __Block_byref_object_dispose__2;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3052000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3052000000;
  v16[3] = __Block_byref_object_copy__2;
  v16[4] = __Block_byref_object_dispose__2;
  v16[5] = 0;
  v3 = -[FigSubtitleBackdropCALayer shouldEnableBackdropLayer](self, "shouldEnableBackdropLayer");
  var1 = self->bdLayerInternal->var1;
  v5 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__FigSubtitleBackdropCALayer_updateBackdropLayer__block_invoke;
    block[3] = &unk_1E2F8AF40;
    block[4] = self;
    block[5] = &v29;
    block[6] = v16;
    dispatch_sync(var1, block);
    if (!*((_BYTE *)v30 + 24)
      && +[FigCaptionBackdropLayer isSupported](FigCaptionBackdropLayer, "isSupported"))
    {
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      if (!pthread_main_np())
        objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", 1);
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      v6 = objc_alloc_init(FigSubtitleBackdropCALayerContentLayer);
      v24[5] = (uint64_t)v6;
      v7 = objc_alloc_init(FigCaptionBackdropLayer);
      v18[5] = (uint64_t)v7;
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
      v14[0] = v5;
      v14[1] = 3221225472;
      v14[2] = __49__FigSubtitleBackdropCALayer_updateBackdropLayer__block_invoke_2;
      v14[3] = &unk_1E2F8AF68;
      v14[4] = self;
      v14[5] = &v23;
      v14[6] = v16;
      v14[7] = &v17;
      dispatch_async(MEMORY[0x1E0C80D38], v14);
      v8 = self->bdLayerInternal->var1;
      v13[0] = v5;
      v13[1] = 3221225472;
      v13[2] = __49__FigSubtitleBackdropCALayer_updateBackdropLayer__block_invoke_3;
      v13[3] = &unk_1E2F8AF90;
      v13[4] = self;
      v13[5] = &v23;
      v13[6] = &v17;
      dispatch_sync(v8, v13);
    }
  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __49__FigSubtitleBackdropCALayer_updateBackdropLayer__block_invoke_4;
    v12[3] = &unk_1E2F8AFB8;
    v12[4] = self;
    v12[5] = &v29;
    dispatch_sync(var1, v12);
    if (*((_BYTE *)v30 + 24))
    {
      v9 = self->bdLayerInternal->var1;
      v11[0] = v5;
      v11[1] = 3221225472;
      v11[2] = __49__FigSubtitleBackdropCALayer_updateBackdropLayer__block_invoke_5;
      v11[3] = &unk_1E2F8AF90;
      v11[4] = self;
      v11[5] = &v23;
      v11[6] = &v17;
      dispatch_sync(v9, v11);
      v10[0] = v5;
      v10[1] = 3221225472;
      v10[2] = __49__FigSubtitleBackdropCALayer_updateBackdropLayer__block_invoke_6;
      v10[3] = &unk_1E2F8AFE0;
      v10[4] = &v17;
      v10[5] = &v23;
      dispatch_async(MEMORY[0x1E0C80D38], v10);
    }
  }
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);
}

_QWORD *__49__FigSubtitleBackdropCALayer_updateBackdropLayer__block_invoke(_QWORD *result)
{
  *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result[4] + 40) + 16);
  *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 40) = *(_QWORD *)(*(_QWORD *)(result[4] + 40) + 48);
  return result;
}

uint64_t __49__FigSubtitleBackdropCALayer_updateBackdropLayer__block_invoke_2(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setContents:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setDelegate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "addSublayer:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "insertSublayer:below:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

_QWORD *__49__FigSubtitleBackdropCALayer_updateBackdropLayer__block_invoke_3(_QWORD *result)
{
  *(_QWORD *)(*(_QWORD *)(result[4] + 40) + 40) = *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 40);
  *(_QWORD *)(*(_QWORD *)(result[4] + 40) + 32) = *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 40);
  *(_BYTE *)(*(_QWORD *)(result[4] + 40) + 16) = 1;
  return result;
}

uint64_t __49__FigSubtitleBackdropCALayer_updateBackdropLayer__block_invoke_4(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 40)
                                                                            + 16);
  return result;
}

id __49__FigSubtitleBackdropCALayer_updateBackdropLayer__block_invoke_5(_QWORD *a1)
{
  id result;

  *(_BYTE *)(*(_QWORD *)(a1[4] + 40) + 16) = 0;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = *(id *)(*(_QWORD *)(a1[4] + 40) + 40);
  *(_QWORD *)(*(_QWORD *)(a1[4] + 40) + 40) = 0;
  result = *(id *)(*(_QWORD *)(a1[4] + 40) + 32);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
  *(_QWORD *)(*(_QWORD *)(a1[4] + 40) + 32) = 0;
  return result;
}

uint64_t __49__FigSubtitleBackdropCALayer_updateBackdropLayer__block_invoke_6(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setContents:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "removeFromSuperlayer");

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setContents:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "removeFromSuperlayer");

  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)updateWindowOpacity:(double)a3
{
  NSObject *var1;
  _QWORD v5[6];

  var1 = self->bdLayerInternal->var1;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__FigSubtitleBackdropCALayer_updateWindowOpacity___block_invoke;
  v5[3] = &unk_1E2F8B008;
  v5[4] = self;
  *(double *)&v5[5] = a3;
  dispatch_sync(var1, v5);
  -[FigSubtitleBackdropCALayer updateBackdropLayer](self, "updateBackdropLayer");
}

double __50__FigSubtitleBackdropCALayer_updateWindowOpacity___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 24) = result;
  return result;
}

- (void)updateHDRContentState:(BOOL)a3
{
  NSObject *var1;
  _QWORD v5[5];
  BOOL v6;

  var1 = self->bdLayerInternal->var1;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__FigSubtitleBackdropCALayer_updateHDRContentState___block_invoke;
  v5[3] = &unk_1E2F8B030;
  v5[4] = self;
  v6 = a3;
  dispatch_sync(var1, v5);
  -[FigSubtitleBackdropCALayer updateBackdropLayer](self, "updateBackdropLayer");
}

uint64_t __52__FigSubtitleBackdropCALayer_updateHDRContentState___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 40) + 17) = *(_BYTE *)(result + 40);
  return result;
}

- (void)_addBoundsAnimationToLayer:(id)a3 usingAnimation:(id)a4 forKey:(id)a5
{
  id v8;
  const __CFString *v9;

  v8 = _animationByTransformingValues(a4, (uint64_t)&__block_literal_global_20);
  if (objc_msgSend(a4, "isAdditive"))
    v9 = CFSTR("bounds.size");
  else
    v9 = CFSTR("bounds");
  objc_msgSend(v8, "setKeyPath:", v9);
  objc_msgSend(v8, "setDelegate:", 0);
  objc_msgSend(a3, "addAnimation:forKey:", v8, a5);
}

uint64_t __79__FigSubtitleBackdropCALayer__addBoundsAnimationToLayer_usingAnimation_forKey___block_invoke(uint64_t a1, uint64_t a2)
{
  return a2;
}

- (void)_addPositionAnimationToLayer:(id)a3 usingAnimation:(id)a4 forKey:(id)a5
{
  void *v8;
  id v9;

  if (objc_msgSend(a4, "isAdditive"))
    v8 = &__block_literal_global_29;
  else
    v8 = &__block_literal_global_31;
  v9 = _animationByTransformingValues(a4, (uint64_t)v8);
  objc_msgSend(v9, "setKeyPath:", CFSTR("position"));
  objc_msgSend(v9, "setDelegate:", 0);
  objc_msgSend(a3, "addAnimation:forKey:", v9, a5);
}

uint64_t __81__FigSubtitleBackdropCALayer__addPositionAnimationToLayer_usingAnimation_forKey___block_invoke(uint64_t a1, void *a2)
{
  double v2;
  double v3;

  objc_msgSend(a2, "sizeValue");
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:", v2 * 0.5, v3 * 0.5);
}

uint64_t __81__FigSubtitleBackdropCALayer__addPositionAnimationToLayer_usingAnimation_forKey___block_invoke_2(uint64_t a1, void *a2)
{
  double v2;
  double v3;
  double v4;
  double v5;

  objc_msgSend(a2, "rectValue");
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:", v2 + v3 * 0.5, v4 + v5 * 0.5);
}

- (void)addAnimation:(id)a3 forKey:(id)a4
{
  objc_super v7;

  if (self->bdLayerInternal->var2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ((objc_msgSend(CFSTR("bounds.size"), "isEqualToString:", objc_msgSend(a3, "keyPath")) & 1) != 0
       || objc_msgSend(CFSTR("bounds"), "isEqualToString:", objc_msgSend(a3, "keyPath"))))
    {
      -[FigSubtitleBackdropCALayer _addBoundsAnimationToLayer:usingAnimation:forKey:](self, "_addBoundsAnimationToLayer:usingAnimation:forKey:", self->bdLayerInternal->var6, a3, a4);
      -[FigSubtitleBackdropCALayer _addBoundsAnimationToLayer:usingAnimation:forKey:](self, "_addBoundsAnimationToLayer:usingAnimation:forKey:", self->bdLayerInternal->var5, a3, a4);
      -[FigSubtitleBackdropCALayer _addPositionAnimationToLayer:usingAnimation:forKey:](self, "_addPositionAnimationToLayer:usingAnimation:forKey:", self->bdLayerInternal->var6, a3, a4);
      -[FigSubtitleBackdropCALayer _addPositionAnimationToLayer:usingAnimation:forKey:](self, "_addPositionAnimationToLayer:usingAnimation:forKey:", self->bdLayerInternal->var5, a3, a4);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)FigSubtitleBackdropCALayer;
  -[FigSubtitleBackdropCALayer addAnimation:forKey:](&v7, sel_addAnimation_forKey_, a3, a4);
}

@end
