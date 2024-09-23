@implementation CTDPSDPreviewRef

- (CTDPSDPreviewRef)initWithPath:(id)a3
{
  CTDPSDPreviewRef *v3;
  CTDPSDPreviewRef *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CTDPSDPreviewRef;
  v3 = -[CUIPSDImageRef initWithPath:](&v6, sel_initWithPath_, a3);
  v4 = v3;
  if (v3)
    -[CTDPSDPreviewRef evaluateSliceGrid](v3, "evaluateSliceGrid");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CTDPSDPreviewRef;
  -[CUIPSDImageRef dealloc](&v3, sel_dealloc);
}

- (int64_t)sliceRowCount
{
  return self->_sliceRowCount;
}

- (int64_t)sliceColumnCount
{
  return self->_sliceColumnCount;
}

- (void)evaluateSliceGrid
{
  _PSDImageInfo *p_imageInfo;
  unsigned int v4;
  int64_t v5;
  void *v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  int64_t v21;
  int64_t v22;
  double v23;
  int64_t v24;
  __int128 v25;
  int v26;

  p_imageInfo = &self->_imageInfo;
  if (self)
  {
    -[CUIPSDImageRef imageInfo](self, "imageInfo");
  }
  else
  {
    v25 = 0uLL;
    v26 = 0;
  }
  *(_OWORD *)&p_imageInfo->width = v25;
  p_imageInfo->isDrawable = v26;
  v4 = -[CUIPSDImageRef numberOfSlices](self, "numberOfSlices");
  if (v4 <= 1)
    v5 = 1;
  else
    v5 = v4;
  self->_sliceCount = v5;
  self->_layerCount = -[CUIPSDImageRef numberOfLayers](self, "numberOfLayers");
  self->_columnWidth = p_imageInfo->width + 10;
  self->_rowHeight = p_imageInfo->height + 20;
  v6 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", self->_sliceCount - 1);
  if (self->_sliceCount >= 2)
  {
    v7 = 0;
    v8 = -1;
    v9 = 1;
    do
    {
      -[CUIPSDImageRef boundsForSlice:](self, "boundsForSlice:", v9);
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;
      objc_msgSend((id)objc_msgSend(v6, "lastObject"), "rectValue");
      if ((unint64_t)v9 >= 2)
      {
        v19 = v18;
        v20 = objc_msgSend(v6, "count");
        v21 = v9 - 1;
        if (v8 >= 0)
          v21 = v8;
        if (v13 == v19)
          v22 = v7;
        else
          v22 = v7 + 1;
        if (v13 == v19)
          v21 = v8;
        if (v20)
        {
          v7 = v22;
          v8 = v21;
        }
      }
      if (v8 >= 1)
      {
        objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", (v9 - 1) % v8), "rectValue");
        if (v11 != v23)
        {
          v7 = -1;
          goto LABEL_25;
        }
      }
      objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", v11, v13, v15, v17));
      ++v9;
    }
    while (v9 < self->_sliceCount);
    if (v7)
      goto LABEL_25;
  }
  v8 = objc_msgSend(v6, "count");
  v7 = 0;
LABEL_25:
  if (objc_msgSend(v6, "count") && !(objc_msgSend(v6, "count") % (unint64_t)v8))
  {
    if ((v7 & 0x8000000000000000) == 0)
    {
      self->_columnWidth += v8 + 1;
      v24 = v7 + self->_rowHeight;
      ++v7;
      self->_rowHeight = v24 + 2;
    }
  }
  else
  {
    v7 = -1;
  }
  self->_sliceRowCount = v7;
  self->_sliceColumnCount = v8;

  self->_sliceRects = (NSArray *)objc_msgSend(v6, "copy");
}

- (BOOL)hasRegularSliceGrid
{
  int64_t sliceRowCount;

  sliceRowCount = self->_sliceRowCount;
  if (!sliceRowCount)
  {
    -[CTDPSDPreviewRef evaluateSliceGrid](self, "evaluateSliceGrid");
    sliceRowCount = self->_sliceRowCount;
  }
  return sliceRowCount > 0;
}

- (BOOL)hasGradient
{
  unsigned int v3;
  id v4;
  BOOL v5;

  if (!-[CUIPSDImageRef numberOfLayers](self, "numberOfLayers"))
    return 0;
  v3 = 0;
  do
  {
    v4 = -[CUIPSDImageRef gradientAtLayer:](self, "gradientAtLayer:", 0);
    v5 = v4 != 0;
    if (v4)
      break;
    ++v3;
  }
  while (v3 < -[CUIPSDImageRef numberOfLayers](self, "numberOfLayers"));
  return v5;
}

- (int64_t)numberOfGradientLayers
{
  unsigned int v3;
  int64_t v4;

  if (!-[CUIPSDImageRef numberOfLayers](self, "numberOfLayers"))
    return 0;
  v3 = 0;
  v4 = 0;
  do
  {
    if (-[CUIPSDImageRef gradientAtLayer:](self, "gradientAtLayer:", 0))
      ++v4;
    ++v3;
  }
  while (v3 < -[CUIPSDImageRef numberOfLayers](self, "numberOfLayers"));
  return v4;
}

- (int64_t)numberOfAlphaChannels
{
  return -[CUIPSDImageRef numberOfChannels](self, "numberOfChannels") - 4;
}

- (int64_t)indexOfDrawingLayerType:(int64_t)a3
{
  id v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = -[CUIPSDImageRef layerNames](self, "layerNames");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "rangeOfString:", indexOfDrawingLayerType__drawingLayerNames[a3]) != 0x7FFFFFFFFFFFFFFFLL)
          return objc_msgSend(v4, "indexOfObject:", v10);
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v6;
}

@end
