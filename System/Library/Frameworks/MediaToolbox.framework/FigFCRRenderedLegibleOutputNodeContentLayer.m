@implementation FigFCRRenderedLegibleOutputNodeContentLayer

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E38], "null", a3, a4);
}

- (FigFCRRenderedLegibleOutputNodeContentLayer)init
{
  FigFCRRenderedLegibleOutputNodeContentLayer *v2;
  OpaqueFigCaptionRendererRenderedLegibleOutputNodeContentLayerInternal *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FigFCRRenderedLegibleOutputNodeContentLayer;
  v2 = -[FigBaseCALayer init](&v5, sel_init);
  if (v2)
  {
    v3 = (OpaqueFigCaptionRendererRenderedLegibleOutputNodeContentLayerInternal *)malloc_type_calloc(1uLL, 0x10uLL, 0xA0040BD48D6D6uLL);
    v2->layerInternal = v3;
    v3->var0 = v2;
  }
  return v2;
}

- (void)dealloc
{
  OpaqueFigCaptionRendererRenderedLegibleOutputNodeContentLayerInternal *layerInternal;
  objc_super v4;

  layerInternal = self->layerInternal;
  if (layerInternal)
  {
    if (layerInternal->var1)
    {
      CFRelease(layerInternal->var1);
      layerInternal = self->layerInternal;
    }
    free(layerInternal);
  }
  v4.receiver = self;
  v4.super_class = (Class)FigFCRRenderedLegibleOutputNodeContentLayer;
  -[FigFCRRenderedLegibleOutputNodeContentLayer dealloc](&v4, sel_dealloc);
}

@end
