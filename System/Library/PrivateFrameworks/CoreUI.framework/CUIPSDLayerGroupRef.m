@implementation CUIPSDLayerGroupRef

- (CUIPSDLayerGroupRef)initWithImageRef:(id)a3 layerIndex:(unsigned int)a4
{
  uint64_t v4;
  CUIPSDLayerGroupRef *v6;
  CUIPSDLayerGroupRef *v7;
  objc_super v9;

  v4 = *(_QWORD *)&a4;
  v9.receiver = self;
  v9.super_class = (Class)CUIPSDLayerGroupRef;
  v6 = -[CUIPSDLayerGroupRef init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[CUIPSDLayerBaseRef setImageRef:](v6, "setImageRef:", a3);
    -[CUIPSDLayerBaseRef setLayerIndex:](v7, "setLayerIndex:", v4);
    v7->_sublayerInfo = (_CUIPSDSublayerInfo *)objc_msgSend(a3, "_copySublayerInfoAtAbsoluteIndex:atRoot:", v4, 0);
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIPSDLayerGroupRef;
  -[CUIPSDLayerBaseRef dealloc](&v3, sel_dealloc);
}

- (BOOL)isLayerGroup
{
  return 1;
}

- (CGRect)bounds
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  id v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  NSRect v19;
  NSRect v20;
  CGRect result;
  NSRect v22;

  x = NSZeroRect.origin.x;
  y = NSZeroRect.origin.y;
  width = NSZeroRect.size.width;
  height = NSZeroRect.size.height;
  v7 = -[CUIPSDLayerGroupRef numberOfLayers](self, "numberOfLayers");
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    do
    {
      v10 = -[CUIPSDLayerGroupRef layerRefAtIndex:](self, "layerRefAtIndex:", v9);
      if (v10)
      {
        objc_msgSend(v10, "bounds");
        v22.origin.x = v11;
        v22.origin.y = v12;
        v22.size.width = v13;
        v22.size.height = v14;
        v19.origin.x = x;
        v19.origin.y = y;
        v19.size.width = width;
        v19.size.height = height;
        v20 = NSUnionRect(v19, v22);
        x = v20.origin.x;
        y = v20.origin.y;
        width = v20.size.width;
        height = v20.size.height;
      }
      v9 = (v9 + 1);
    }
    while (v8 != (_DWORD)v9);
  }
  v15 = x;
  v16 = y;
  v17 = width;
  v18 = height;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (BOOL)_isGroupType:(unsigned int)a3
{
  CPSDFile *v5;
  unsigned int v7;

  v5 = -[CUIPSDImageRef psdFile](-[CUIPSDLayerBaseRef imageRef](self, "imageRef"), "psdFile");
  if (v5)
  {
    v7 = 0;
    CPSDFile::GetLayerSectionDividerType(v5, -[CUIPSDLayerBaseRef layerIndex](self, "layerIndex"), &v7);
    LOBYTE(v5) = v7 == a3;
  }
  return (char)v5;
}

- (BOOL)isOpen
{
  return -[CUIPSDLayerGroupRef _isGroupType:](self, "_isGroupType:", 1);
}

- (BOOL)isGroupStart
{
  if (-[CUIPSDLayerGroupRef _isGroupType:](self, "_isGroupType:", 1))
    return 1;
  else
    return -[CUIPSDLayerGroupRef _isGroupType:](self, "_isGroupType:", 2);
}

- (BOOL)isGroupEnd
{
  return -[CUIPSDLayerGroupRef _isGroupType:](self, "_isGroupType:", 3);
}

- (unsigned)numberOfLayers
{
  return -[_CUIPSDSublayerInfo numberOfSublayers](self->_sublayerInfo, "numberOfSublayers");
}

- (id)layerNames
{
  return -[CUIPSDImageRef _namesOfSublayers:](-[CUIPSDLayerBaseRef imageRef](self, "imageRef"), "_namesOfSublayers:", self->_sublayerInfo);
}

- (id)layerRefAtIndex:(unsigned int)a3
{
  uint64_t v4;
  char v6;

  v6 = 0;
  v4 = -[_CUIPSDSublayerInfo sublayerAtIndex:isValid:](self->_sublayerInfo, "sublayerAtIndex:isValid:", *(_QWORD *)&a3, &v6);
  if (v6)
    return -[CUIPSDImageRef _layerRefAtAbsoluteIndex:](-[CUIPSDLayerBaseRef imageRef](self, "imageRef"), "_layerRefAtAbsoluteIndex:", v4);
  else
    return 0;
}

- (id)layerEnumerator
{
  return +[CUIPSDLayerEnumerator enumeratorWithPSDLayerGroup:](CUIPSDLayerEnumerator, "enumeratorWithPSDLayerGroup:", self);
}

- (void)enumerateLayersUsingBlock:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = -[CUIPSDLayerGroupRef layerEnumerator](self, "layerEnumerator");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(v4);
      v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
      v10 = 0;
      (*((void (**)(id, uint64_t, char *))a3 + 2))(a3, v9, &v10);
      if (v10)
        break;
      if (v6 == (id)++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          goto LABEL_3;
        return;
      }
    }
  }
}

@end
