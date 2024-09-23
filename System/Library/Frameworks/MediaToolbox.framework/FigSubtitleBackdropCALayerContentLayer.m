@implementation FigSubtitleBackdropCALayerContentLayer

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E38], "null", a3, a4);
}

- (FigSubtitleBackdropCALayerContentLayer)init
{
  FigSubtitleBackdropCALayerContentLayer *v2;
  OpaqueFigSubtitleBackdropCALayerContentLayerInternal *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FigSubtitleBackdropCALayerContentLayer;
  v2 = -[FigBaseCALayer init](&v5, sel_init);
  if (v2)
  {
    v3 = (OpaqueFigSubtitleBackdropCALayerContentLayerInternal *)malloc_type_calloc(1uLL, 8uLL, 0x80040B8603338uLL);
    v2->layerInternal = v3;
    v3->var0 = v2;
  }
  return v2;
}

- (void)dealloc
{
  OpaqueFigSubtitleBackdropCALayerContentLayerInternal *layerInternal;
  objc_super v4;

  layerInternal = self->layerInternal;
  if (layerInternal)
    free(layerInternal);
  v4.receiver = self;
  v4.super_class = (Class)FigSubtitleBackdropCALayerContentLayer;
  -[FigSubtitleBackdropCALayerContentLayer dealloc](&v4, sel_dealloc);
}

@end
