@implementation FigBaseCALayerHost

- (FigBaseCALayerHost)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigBaseCALayerHost;
  return -[CALayerHost init](&v3, sel_init);
}

+ (id)defaultActionForKey:(id)a3
{
  return 0;
}

- (id)actionForKey:(id)a3
{
  return 0;
}

- (void)setSublayers:(id)a3
{
  objc_super v3;

  if (!self->_preventsChangesToSublayerHierarchy)
  {
    v3.receiver = self;
    v3.super_class = (Class)FigBaseCALayerHost;
    -[FigBaseCALayerHost setSublayers:](&v3, sel_setSublayers_, a3);
  }
}

- (void)addSublayer:(id)a3
{
  objc_super v3;

  if (!self->_preventsChangesToSublayerHierarchy)
  {
    v3.receiver = self;
    v3.super_class = (Class)FigBaseCALayerHost;
    -[FigBaseCALayerHost addSublayer:](&v3, sel_addSublayer_, a3);
  }
}

- (void)insertSublayer:(id)a3 atIndex:(unsigned int)a4
{
  objc_super v4;

  if (!self->_preventsChangesToSublayerHierarchy)
  {
    v4.receiver = self;
    v4.super_class = (Class)FigBaseCALayerHost;
    -[FigBaseCALayerHost insertSublayer:atIndex:](&v4, sel_insertSublayer_atIndex_, a3, *(_QWORD *)&a4);
  }
}

- (void)insertSublayer:(id)a3 below:(id)a4
{
  objc_super v4;

  if (!self->_preventsChangesToSublayerHierarchy)
  {
    v4.receiver = self;
    v4.super_class = (Class)FigBaseCALayerHost;
    -[FigBaseCALayerHost insertSublayer:below:](&v4, sel_insertSublayer_below_, a3, a4);
  }
}

- (void)insertSublayer:(id)a3 above:(id)a4
{
  objc_super v4;

  if (!self->_preventsChangesToSublayerHierarchy)
  {
    v4.receiver = self;
    v4.super_class = (Class)FigBaseCALayerHost;
    -[FigBaseCALayerHost insertSublayer:above:](&v4, sel_insertSublayer_above_, a3, a4);
  }
}

- (void)replaceSublayer:(id)a3 with:(id)a4
{
  objc_super v4;

  if (!self->_preventsChangesToSublayerHierarchy)
  {
    v4.receiver = self;
    v4.super_class = (Class)FigBaseCALayerHost;
    -[FigBaseCALayerHost replaceSublayer:with:](&v4, sel_replaceSublayer_with_, a3, a4);
  }
}

- (void)removeFromSuperlayer
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)FigBaseCALayerHost;
  -[FigBaseCALayerHost removeFromSuperlayer](&v2, sel_removeFromSuperlayer);
}

- (BOOL)preventsChangesToSublayerHierarchy
{
  return self->_preventsChangesToSublayerHierarchy;
}

- (void)setPreventsChangesToSublayerHierarchy:(BOOL)a3
{
  self->_preventsChangesToSublayerHierarchy = a3;
}

@end
