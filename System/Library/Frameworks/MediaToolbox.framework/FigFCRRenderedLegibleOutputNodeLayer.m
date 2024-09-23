@implementation FigFCRRenderedLegibleOutputNodeLayer

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E38], "null", a3, a4);
}

- (FigFCRRenderedLegibleOutputNodeLayer)init
{
  FigFCRRenderedLegibleOutputNodeLayer *v2;
  OpaqueFigCaptionRendererRenderedLegibleOutputNodeLayerInternal *v3;
  FigFCRRenderedLegibleOutputNodeContentLayer *v4;
  OpaqueFigCaptionRendererRenderedLegibleOutputNodeLayerInternal *layerInternal;
  FigCaptionBackdropLayer *var4;
  OpaqueFigCaptionRendererRenderedLegibleOutputNodeLayerInternal *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FigFCRRenderedLegibleOutputNodeLayer;
  v2 = -[FigBaseCALayer init](&v9, sel_init);
  if (v2)
  {
    v3 = (OpaqueFigCaptionRendererRenderedLegibleOutputNodeLayerInternal *)malloc_type_calloc(1uLL, 0x30uLL, 0x10A0040A33FF621uLL);
    v2->layerInternal = v3;
    v3->var0 = v2;
    v4 = objc_alloc_init(FigFCRRenderedLegibleOutputNodeContentLayer);
    v2->layerInternal->var3 = v4;
    -[FigBaseCALayer addSublayer:](v2, "addSublayer:", v4);
    layerInternal = v2->layerInternal;
    layerInternal->var4 = 0;
    layerInternal->var2 = 0.0;
    if (+[FigCaptionBackdropLayer isSupported](FigCaptionBackdropLayer, "isSupported"))
    {
      var4 = objc_alloc_init(FigCaptionBackdropLayer);
      v7 = v2->layerInternal;
      v7->var4 = var4;
      if (!var4)
      {
LABEL_5:
        v7->var5 = 0;
        return v2;
      }
    }
    else
    {
      v7 = v2->layerInternal;
      var4 = (FigCaptionBackdropLayer *)v7->var4;
      if (!var4)
        goto LABEL_5;
    }
    -[FigBaseCALayer insertSublayer:below:](v2, "insertSublayer:below:", var4, v7->var3);
    v7 = v2->layerInternal;
    goto LABEL_5;
  }
  return v2;
}

- (void)dealloc
{
  OpaqueFigCaptionRendererRenderedLegibleOutputNodeLayerInternal *layerInternal;
  CGImage *var1;
  objc_super v5;

  layerInternal = self->layerInternal;
  if (layerInternal)
  {
    var1 = layerInternal->var1;
    if (var1)
    {
      CFRelease(var1);
      layerInternal = self->layerInternal;
    }

    free(self->layerInternal);
  }
  v5.receiver = self;
  v5.super_class = (Class)FigFCRRenderedLegibleOutputNodeLayer;
  -[FigFCRRenderedLegibleOutputNodeLayer dealloc](&v5, sel_dealloc);
}

- (void)setContents:(id)a3
{
  objc_super v5;

  if (self->layerInternal->var5)
  {
    v5.receiver = self;
    v5.super_class = (Class)FigFCRRenderedLegibleOutputNodeLayer;
    -[FigFCRRenderedLegibleOutputNodeLayer setContents:](&v5, sel_setContents_, a3);
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  if (!pthread_main_np())
    objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", 1);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(self->layerInternal->var3, "setContents:", a3);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  OpaqueFigCaptionRendererRenderedLegibleOutputNodeLayerInternal *layerInternal;
  id var4;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  if (!pthread_main_np())
    objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", 1);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(self->layerInternal->var3, "setBounds:", x, y, width, height);
  layerInternal = self->layerInternal;
  var4 = layerInternal->var4;
  if (var4 && layerInternal->var2 > 0.0)
  {
    objc_msgSend(var4, "setBounds:", x, y, width, height);
    objc_msgSend(self->layerInternal->var4, "setHidden:", 0);
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  v10.receiver = self;
  v10.super_class = (Class)FigFCRRenderedLegibleOutputNodeLayer;
  -[FigFCRRenderedLegibleOutputNodeLayer setBounds:](&v10, sel_setBounds_, x, y, width, height);
}

- (void)setPosition:(CGPoint)a3
{
  double y;
  double x;
  id var3;
  double v7;
  double v8;
  double v9;
  OpaqueFigCaptionRendererRenderedLegibleOutputNodeLayerInternal *layerInternal;
  id var4;
  double v12;
  double v13;
  double v14;
  objc_super v15;

  y = a3.y;
  x = a3.x;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  if (!pthread_main_np())
    objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", 1);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  var3 = self->layerInternal->var3;
  -[FigFCRRenderedLegibleOutputNodeLayer bounds](self, "bounds");
  v8 = v7 * 0.5;
  -[FigFCRRenderedLegibleOutputNodeLayer bounds](self, "bounds");
  objc_msgSend(var3, "setPosition:", v8, v9 * 0.5);
  layerInternal = self->layerInternal;
  var4 = layerInternal->var4;
  if (var4 && layerInternal->var2 > 0.0)
  {
    -[FigFCRRenderedLegibleOutputNodeLayer bounds](self, "bounds");
    v13 = v12 * 0.5;
    -[FigFCRRenderedLegibleOutputNodeLayer bounds](self, "bounds");
    objc_msgSend(var4, "setPosition:", v13, v14 * 0.5);
    objc_msgSend(self->layerInternal->var4, "setHidden:", 0);
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  v15.receiver = self;
  v15.super_class = (Class)FigFCRRenderedLegibleOutputNodeLayer;
  -[FigFCRRenderedLegibleOutputNodeLayer setPosition:](&v15, sel_setPosition_, x, y);
}

- (void)setCornerRadius:(double)a3
{
  id var4;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  if (!pthread_main_np())
    objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", 1);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(self->layerInternal->var3, "setCornerRadius:", a3);
  var4 = self->layerInternal->var4;
  if (var4)
  {
    objc_msgSend(var4, "setCornerRadius:", a3);
    objc_msgSend(self->layerInternal->var4, "setHidden:", 0);
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  v6.receiver = self;
  v6.super_class = (Class)FigFCRRenderedLegibleOutputNodeLayer;
  -[FigFCRRenderedLegibleOutputNodeLayer setCornerRadius:](&v6, sel_setCornerRadius_, a3);
}

- (void)setWindowOpacity:(double)a3
{
  id var4;

  self->layerInternal->var2 = a3;
  if (a3 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    if (!pthread_main_np())
      objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", 1);
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    var4 = self->layerInternal->var4;
    if (var4)
      objc_msgSend(var4, "setHidden:", 1);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
}

- (void)_addBoundsAnimationToLayer:(id)a3 usingAnimation:(id)a4 forKey:(id)a5
{
  id v8;
  const __CFString *v9;

  v8 = _animationByTransformingValues(a4, (uint64_t)&__block_literal_global_115);
  if (objc_msgSend(a4, "isAdditive"))
    v9 = CFSTR("bounds.size");
  else
    v9 = CFSTR("bounds");
  objc_msgSend(v8, "setKeyPath:", v9);
  objc_msgSend(v8, "setDelegate:", 0);
  objc_msgSend(a3, "addAnimation:forKey:", v8, a5);
}

uint64_t __89__FigFCRRenderedLegibleOutputNodeLayer__addBoundsAnimationToLayer_usingAnimation_forKey___block_invoke(uint64_t a1, uint64_t a2)
{
  return a2;
}

- (void)_addPositionAnimationToLayer:(id)a3 usingAnimation:(id)a4 forKey:(id)a5
{
  _QWORD *v9;
  id v10;
  _QWORD v11[5];

  if (objc_msgSend(a4, "isAdditive"))
  {
    v9 = &__block_literal_global_23_5;
  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __91__FigFCRRenderedLegibleOutputNodeLayer__addPositionAnimationToLayer_usingAnimation_forKey___block_invoke_2;
    v11[3] = &unk_1E2F91E68;
    v11[4] = self;
    v9 = v11;
  }
  v10 = _animationByTransformingValues(a4, (uint64_t)v9);
  objc_msgSend(v10, "setKeyPath:", CFSTR("position"));
  objc_msgSend(v10, "setDelegate:", 0);
  objc_msgSend(a3, "addAnimation:forKey:", v10, a5);
}

uint64_t __91__FigFCRRenderedLegibleOutputNodeLayer__addPositionAnimationToLayer_usingAnimation_forKey___block_invoke(uint64_t a1, void *a2)
{
  double v2;
  double v3;

  objc_msgSend(a2, "sizeValue");
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:", v2 * 0.5, v3 * 0.5);
}

uint64_t __91__FigFCRRenderedLegibleOutputNodeLayer__addPositionAnimationToLayer_usingAnimation_forKey___block_invoke_2(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;

  objc_msgSend(*(id *)(a1 + 32), "bounds");
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:", v1 + v2 * 0.5, v3 + v4 * 0.5);
}

- (void)addAnimation:(id)a3 forKey:(id)a4
{
  objc_super v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(CFSTR("bounds.size"), "isEqualToString:", objc_msgSend(a3, "keyPath")) & 1) != 0
      || objc_msgSend(CFSTR("bounds"), "isEqualToString:", objc_msgSend(a3, "keyPath")))
    {
      -[FigFCRRenderedLegibleOutputNodeLayer _addBoundsAnimationToLayer:usingAnimation:forKey:](self, "_addBoundsAnimationToLayer:usingAnimation:forKey:", self->layerInternal->var3, a3, a4);
      -[FigFCRRenderedLegibleOutputNodeLayer _addBoundsAnimationToLayer:usingAnimation:forKey:](self, "_addBoundsAnimationToLayer:usingAnimation:forKey:", self->layerInternal->var4, a3, a4);
    }
    else
    {
      -[FigFCRRenderedLegibleOutputNodeLayer _addPositionAnimationToLayer:usingAnimation:forKey:](self, "_addPositionAnimationToLayer:usingAnimation:forKey:", self->layerInternal->var3, a3, a4);
      -[FigFCRRenderedLegibleOutputNodeLayer _addPositionAnimationToLayer:usingAnimation:forKey:](self, "_addPositionAnimationToLayer:usingAnimation:forKey:", self->layerInternal->var4, a3, a4);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)FigFCRRenderedLegibleOutputNodeLayer;
  -[FigFCRRenderedLegibleOutputNodeLayer addAnimation:forKey:](&v7, sel_addAnimation_forKey_, a3, a4);
}

@end
