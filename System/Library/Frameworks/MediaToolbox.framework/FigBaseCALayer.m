@implementation FigBaseCALayer

- (FigBaseCALayer)init
{
  FigBaseCALayer *v2;
  FigBaseCALayer *v3;
  float v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigBaseCALayer;
  v2 = -[FigBaseCALayer init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[FigBaseCALayer getDisplayScale](v2, "getDisplayScale");
    -[FigBaseCALayer setContentsScale:](v3, "setContentsScale:", v4);
  }
  return v3;
}

- (FigBaseCALayer)initWithDeferredTransaction:(OpaqueFigDeferredTransaction *)a3
{
  FigBaseCALayer *v4;
  float v5;
  objc_super v7;
  CFTypeRef cf;

  v7.receiver = self;
  v7.super_class = (Class)FigBaseCALayer;
  cf = 0;
  v4 = -[FigBaseCALayer init](&v7, sel_init);
  if (!v4)
    return v4;
  if (!a3)
  {
    if (FigDeferredTransactionCreate(*MEMORY[0x1E0C9AE00], (uint64_t *)&cf))
    {
LABEL_6:

      if (cf)
        CFRelease(cf);
      return 0;
    }
    a3 = (OpaqueFigDeferredTransaction *)cf;
  }
  -[FigBaseCALayer getDisplayScale](v4, "getDisplayScale");
  if (FBLSupportAppendDeferredTransactionChangeToSetContentsScaleForFigCALayer(a3, v4, (uint64_t)"-[FigBaseCALayer initWithDeferredTransaction:]", v5))goto LABEL_6;
  if (cf)
  {
    FigDeferredTransactionCommit((uint64_t)cf);
    CFRelease(cf);
  }
  return v4;
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
    v3.super_class = (Class)FigBaseCALayer;
    -[FigBaseCALayer setSublayers:](&v3, sel_setSublayers_, a3);
  }
}

- (void)addSublayer:(id)a3
{
  objc_super v5;

  if (!self->_preventsChangesToSublayerHierarchy
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5.receiver = self;
    v5.super_class = (Class)FigBaseCALayer;
    -[FigBaseCALayer addSublayer:](&v5, sel_addSublayer_, a3);
  }
}

- (void)insertSublayer:(id)a3 atIndex:(unsigned int)a4
{
  objc_super v4;

  if (!self->_preventsChangesToSublayerHierarchy)
  {
    v4.receiver = self;
    v4.super_class = (Class)FigBaseCALayer;
    -[FigBaseCALayer insertSublayer:atIndex:](&v4, sel_insertSublayer_atIndex_, a3, *(_QWORD *)&a4);
  }
}

- (void)insertSublayer:(id)a3 below:(id)a4
{
  objc_super v7;

  if (!self->_preventsChangesToSublayerHierarchy
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7.receiver = self;
    v7.super_class = (Class)FigBaseCALayer;
    -[FigBaseCALayer insertSublayer:below:](&v7, sel_insertSublayer_below_, a3, a4);
  }
}

- (void)insertSublayer:(id)a3 above:(id)a4
{
  objc_super v4;

  if (!self->_preventsChangesToSublayerHierarchy)
  {
    v4.receiver = self;
    v4.super_class = (Class)FigBaseCALayer;
    -[FigBaseCALayer insertSublayer:above:](&v4, sel_insertSublayer_above_, a3, a4);
  }
}

- (void)replaceSublayer:(id)a3 with:(id)a4
{
  objc_super v4;

  if (!self->_preventsChangesToSublayerHierarchy)
  {
    v4.receiver = self;
    v4.super_class = (Class)FigBaseCALayer;
    -[FigBaseCALayer replaceSublayer:with:](&v4, sel_replaceSublayer_with_, a3, a4);
  }
}

- (void)removeFromSuperlayer
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)FigBaseCALayer;
  -[FigBaseCALayer removeFromSuperlayer](&v2, sel_removeFromSuperlayer);
}

- (id)getLayerDisplay
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend((id)-[FigBaseCALayer context](self, "context"), "options");
  v3 = objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CD2A20]);
  if (v3)
  {
    v4 = v3;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CD2728], "displays", 0);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v11, "deviceName"), "isEqualToString:", v4))
            v8 = v11;
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
      return v8;
    }
  }
  else if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CD2728], "displays"), "count"))
  {
    return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CD2728], "displays"), "objectAtIndex:", 0);
  }
  return 0;
}

- (float)getDisplayScale
{
  if (registerOnce != -1)
    dispatch_once(&registerOnce, &__block_literal_global_54);
  return *(double *)&sMaxDisplayScale_0;
}

- (void)setNeedsDisplay
{
  float v3;
  double v4;
  objc_super v5;

  if (registerOnce != -1)
    dispatch_once(&registerOnce, &__block_literal_global_54);
  v3 = *(double *)&sMaxDisplayScale_0;
  -[FigBaseCALayer contentsScale](self, "contentsScale");
  if (v4 != v3)
    -[FigBaseCALayer setContentsScale:](self, "setContentsScale:");
  v5.receiver = self;
  v5.super_class = (Class)FigBaseCALayer;
  -[FigBaseCALayer setNeedsDisplay](&v5, sel_setNeedsDisplay);
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
