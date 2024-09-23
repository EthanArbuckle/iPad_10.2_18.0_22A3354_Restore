@implementation FigCDSCALayerOutputNodeLayer

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E38], "null", a3, a4);
}

- (FigCDSCALayerOutputNodeLayer)init
{
  FigCDSCALayerOutputNodeLayer *v2;
  OpaqueFigCDSCALayerOutputNodeLayerInternal *v3;
  FigCDSCALayerOutputNodeContentLayer *v4;
  FigCaptionBackdropLayer *var2;
  OpaqueFigCDSCALayerOutputNodeLayerInternal *layerInternal;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FigCDSCALayerOutputNodeLayer;
  v2 = -[FigBaseCALayer init](&v8, sel_init);
  if (v2)
  {
    v3 = (OpaqueFigCDSCALayerOutputNodeLayerInternal *)malloc_type_calloc(1uLL, 0x18uLL, 0x80040D6874129uLL);
    v2->layerInternal = v3;
    v3->var0 = v2;
    v4 = objc_alloc_init(FigCDSCALayerOutputNodeContentLayer);
    v2->layerInternal->var1 = v4;
    -[FigBaseCALayer addSublayer:](v2, "addSublayer:", v4);
    v2->layerInternal->var2 = 0;
    if (!+[FigCaptionBackdropLayer isSupported](FigCaptionBackdropLayer, "isSupported"))
    {
      layerInternal = v2->layerInternal;
      var2 = (FigCaptionBackdropLayer *)layerInternal->var2;
      if (!var2)
        return v2;
      goto LABEL_4;
    }
    var2 = objc_alloc_init(FigCaptionBackdropLayer);
    layerInternal = v2->layerInternal;
    layerInternal->var2 = var2;
    if (var2)
LABEL_4:
      -[FigBaseCALayer insertSublayer:below:](v2, "insertSublayer:below:", var2, layerInternal->var1);
  }
  return v2;
}

- (void)dealloc
{
  OpaqueFigCDSCALayerOutputNodeLayerInternal *layerInternal;
  OpaqueFigCDSCALayerOutputNodeLayerInternal *v4;
  objc_super v5;

  layerInternal = self->layerInternal;
  if (layerInternal)
  {

    v4 = self->layerInternal;
    if (v4)
      free(v4);
  }
  v5.receiver = self;
  v5.super_class = (Class)FigCDSCALayerOutputNodeLayer;
  -[FigCDSCALayerOutputNodeLayer dealloc](&v5, sel_dealloc);
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id var2;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(self->layerInternal->var1, "setBounds:", x, y, width, height);
  objc_msgSend(self->layerInternal->var1, "setPosition:", width * 0.5, height * 0.5);
  var2 = self->layerInternal->var2;
  if (var2)
  {
    objc_msgSend(var2, "setBounds:", x, y, width, height);
    objc_msgSend(self->layerInternal->var2, "setPosition:", width * 0.5, height * 0.5);
    objc_msgSend(self->layerInternal->var2, "setHidden:", 0);
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  v9.receiver = self;
  v9.super_class = (Class)FigCDSCALayerOutputNodeLayer;
  -[FigCDSCALayerOutputNodeLayer setBounds:](&v9, sel_setBounds_, x, y, width, height);
}

- (void)setPosition:(CGPoint)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCDSCALayerOutputNodeLayer;
  -[FigCDSCALayerOutputNodeLayer setPosition:](&v3, sel_setPosition_, a3.x, a3.y);
}

- (void)setContents:(id)a3
{
  objc_msgSend(self->layerInternal->var1, "setContents:", a3);
}

@end
