@implementation CUIPSDLayerEnumerator

+ (id)enumeratorWithPSDLayerGroup:(id)a3
{
  return -[CUIPSDLayerEnumerator initWithPSDLayerGroup:]([CUIPSDLayerEnumerator alloc], "initWithPSDLayerGroup:", a3);
}

+ (id)enumeratorWithPSDImage:(id)a3
{
  return -[CUIPSDLayerEnumerator initWithPSDImage:]([CUIPSDLayerEnumerator alloc], "initWithPSDImage:", a3);
}

- (CUIPSDLayerEnumerator)initWithPSDLayerGroup:(id)a3
{
  CUIPSDLayerEnumerator *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUIPSDLayerEnumerator;
  v4 = -[CUIPSDLayerEnumerator init](&v6, sel_init);
  if (v4)
  {
    v4->_layerGroup = (CUIPSDLayerGroupRef *)a3;
    v4->_currentIndex = 0;
    v4->_isImageFile = 0;
  }
  return v4;
}

- (CUIPSDLayerEnumerator)initWithPSDImage:(id)a3
{
  CUIPSDLayerEnumerator *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUIPSDLayerEnumerator;
  v4 = -[CUIPSDLayerEnumerator init](&v6, sel_init);
  if (v4)
  {
    v4->_layerGroup = (CUIPSDLayerGroupRef *)a3;
    v4->_currentIndex = 0;
    v4->_isImageFile = 1;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIPSDLayerEnumerator;
  -[CUIPSDLayerEnumerator dealloc](&v3, sel_dealloc);
}

- (id)nextObject
{
  unsigned int v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  CUIPSDLayerGroupRef *layerGroup;
  uint64_t v9;
  int v10;
  id v11;
  void *v12;

  v3 = -[CUIPSDLayerGroupRef numberOfLayers](self->_layerGroup, "numberOfLayers");
  if (!v3)
    return 0;
  if (!self->_isImageFile && self->_currentIndex >= v3)
    return 0;
  v5 = -[CUIPSDLayerGroupRef layerRefAtIndex:](self->_layerGroup, "layerRefAtIndex:");
  if (objc_msgSend(v5, "isLayerGroup")
    && (v7 = objc_opt_class(CUIPSDLayerGroupRef, v6), (objc_opt_isKindOfClass(v5, v7) & 1) != 0))
  {
    if (objc_msgSend(v5, "isGroupEnd"))
    {
      layerGroup = self->_layerGroup;
      v9 = self->_currentIndex + 1;
      v10 = 1;
      do
      {
        v11 = -[CUIPSDLayerGroupRef layerRefAtIndex:](layerGroup, "layerRefAtIndex:", v9);
        if (objc_msgSend(v11, "isLayerGroup"))
          v12 = v11;
        else
          v12 = 0;
        if (objc_msgSend(v11, "isLayerGroup"))
        {
          if (objc_msgSend(v12, "isGroupStart"))
          {
            if (!--v10)
              goto LABEL_20;
          }
          else
          {
            v10 += objc_msgSend(v12, "isGroupEnd");
          }
        }
        v9 = (v9 + 1);
      }
      while (v11);
      v9 = 0xFFFFFFFFLL;
LABEL_20:
      v5 = -[CUIPSDLayerGroupRef layerRefAtIndex:](self->_layerGroup, "layerRefAtIndex:", v9);
    }
    else
    {
      LODWORD(v9) = self->_currentIndex;
    }
    self->_currentIndex = v9 + 1;
    if (!objc_msgSend(v5, "isLayerGroup") || (objc_msgSend(v5, "isGroupStart") & 1) == 0)
      -[CUIPSDLayerEnumerator nextObject].cold.1();
  }
  else
  {
    ++self->_currentIndex;
  }
  return v5;
}

- (id)allObjects
{
  id v3;
  unsigned int currentIndex;
  id v5;
  id v6;

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  currentIndex = self->_currentIndex;
  self->_currentIndex = 0;
  v5 = -[CUIPSDLayerEnumerator nextObject](self, "nextObject");
  if (v5)
  {
    v6 = v5;
    do
    {
      objc_msgSend(v3, "addObject:", v6);
      v6 = -[CUIPSDLayerEnumerator nextObject](self, "nextObject");
    }
    while (v6);
  }
  self->_currentIndex = currentIndex;
  return v3;
}

- (void)nextObject
{
  __assert_rtn("-[CUIPSDLayerEnumerator nextObject]", "CUIPSDLayerEnumerator.m", 123, "layerGroup.isLayerGroup && layerGroup.isGroupStart");
}

@end
