@implementation CPChunk

- (CPChunk)init
{
  CPChunk *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPChunk;
  result = -[CPObject init](&v3, sel_init);
  if (result)
  {
    result->shrinksWithChildren = 1;
    result->bounds = CGRectNull;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPChunk;
  return -[CPObject copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (id)copyAndSplitChildrenAtIndex:(unsigned int)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CPChunk;
  v4 = -[CPObject copyAndSplitChildrenAtIndex:](&v6, sel_copyAndSplitChildrenAtIndex_, *(_QWORD *)&a3);
  self->dirtyBounds = 1;
  *((_BYTE *)v4 + 81) = 1;
  if (-[NSMutableArray count](self->super.children, "count"))
    -[CPObject recomputeZOrder](self, "recomputeZOrder");
  if (objc_msgSend(*((id *)v4 + 2), "count"))
    objc_msgSend(v4, "recomputeZOrder");
  return v4;
}

- (void)accept:(id)a3
{
  objc_msgSend(a3, "visitChunk:", self);
}

- (float)opticalLeading
{
  return 0.0;
}

- (void)add:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CPChunk;
  -[CPObject add:](&v5, sel_add_);
  -[CPChunk resizeWith:](self, "resizeWith:", a3);
  -[CPObject updateZOrder:](self, "updateZOrder:", (int)objc_msgSend(a3, "zOrder"));
}

- (void)add:(id)a3 atIndex:(unsigned int)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CPChunk;
  -[CPObject add:atIndex:](&v6, sel_add_atIndex_, a3, *(_QWORD *)&a4);
  -[CPChunk resizeWith:](self, "resizeWith:", a3);
  -[CPObject updateZOrder:](self, "updateZOrder:", objc_msgSend(a3, "zOrder"));
}

- (void)addChildrenOf:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPChunk;
  -[CPObject addChildrenOf:](&v4, sel_addChildrenOf_, a3);
  -[CPChunk fitBoundsToChildren](self, "fitBoundsToChildren");
}

- (void)remove:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPChunk;
  -[CPObject remove:](&v4, sel_remove_, a3);
  if (self->shrinksWithChildren)
    self->dirtyBounds = 1;
}

- (void)removeAll
{
  objc_super v3;

  if (self->shrinksWithChildren && -[NSMutableArray count](self->super.children, "count"))
    self->dirtyBounds = 1;
  v3.receiver = self;
  v3.super_class = (Class)CPChunk;
  -[CPObject removeAll](&v3, sel_removeAll);
}

- (id)newTakeChildren
{
  objc_super v4;

  if (self->shrinksWithChildren && -[NSMutableArray count](self->super.children, "count"))
    self->dirtyBounds = 1;
  v4.receiver = self;
  v4.super_class = (Class)CPChunk;
  return -[CPObject newTakeChildren](&v4, sel_newTakeChildren);
}

- (id)newTakeChildrenAmong:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CPChunk;
  v4 = -[CPObject newTakeChildrenAmong:](&v7, sel_newTakeChildrenAmong_, a3);
  v5 = v4;
  if (self->shrinksWithChildren && objc_msgSend(v4, "count"))
    self->dirtyBounds = 1;
  return v5;
}

- (void)setChildren:(id)a3
{
  NSMutableArray *children;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;

  children = self->super.children;
  if (children != a3)
  {

    v6 = (NSMutableArray *)a3;
    self->super.children = v6;
    v7 = -[NSMutableArray count](v6, "count");
    if (v7)
    {
      v8 = 0;
      do
        objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->super.children, "objectAtIndex:", v8++), "setParent:", self);
      while (v7 != v8);
    }
    self->dirtyBounds = 1;
    self->super.zOrder = 0;
  }
}

- (void)setBounds:(CGRect)a3
{
  self->bounds = a3;
  self->dirtyBounds = 0;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if (self->dirtyBounds)
    -[CPChunk fitBoundsToChildren](self, "fitBoundsToChildren");
  x = self->bounds.origin.x;
  y = self->bounds.origin.y;
  width = self->bounds.size.width;
  height = self->bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)adjustToPointBoundary:(CGRect)a3
{
  CGFloat height;
  double width;
  CGFloat y;
  CGFloat x;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect v15;
  CGRect v16;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a3.size.width < 0.0 || a3.size.height < 0.0)
  {
    v15 = CGRectStandardize(a3);
    v8 = v15.origin.x;
    v10 = v15.size.width;
    v15.origin.x = x;
    v15.origin.y = y;
    v15.size.width = width;
    v15.size.height = height;
    v7 = trunc(COERCE_DOUBLE(CGRectStandardize(v15)));
    v16.origin.x = v7;
    v16.origin.y = y;
    v16.size.width = width;
    v16.size.height = height;
    *(_QWORD *)&v9 = (unint64_t)CGRectStandardize(v16);
    width = v10;
  }
  else
  {
    v7 = trunc(a3.origin.x);
    v8 = a3.origin.x;
    v9 = v7;
  }
  v11 = ceil(v8 + width) - v9;
  v12 = v7;
  v13 = y;
  v14 = height;
  result.size.height = v14;
  result.size.width = v11;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)renderedBounds
{
  uint64_t v3;
  CGFloat width;
  unsigned int v5;
  CGFloat x;
  CGFloat y;
  CGFloat height;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect v23;
  CGRect result;
  CGRect v25;

  if (-[NSMutableArray count](self->super.children, "count"))
  {
    if (-[NSMutableArray count](self->super.children, "count"))
    {
      v3 = 0;
      width = 0.0;
      v5 = 1;
      x = INFINITY;
      y = INFINITY;
      height = 0.0;
      do
      {
        objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->super.children, "objectAtIndex:", v3), "renderedBounds");
        v25.origin.x = v9;
        v25.origin.y = v10;
        v25.size.width = v11;
        v25.size.height = v12;
        v22.origin.x = x;
        v22.origin.y = y;
        v22.size.width = width;
        v22.size.height = height;
        v23 = CGRectUnion(v22, v25);
        x = v23.origin.x;
        y = v23.origin.y;
        width = v23.size.width;
        height = v23.size.height;
        v3 = v5;
      }
      while (-[NSMutableArray count](self->super.children, "count") > (unint64_t)v5++);
    }
    else
    {
      height = 0.0;
      y = INFINITY;
      width = 0.0;
      x = INFINITY;
    }
  }
  else
  {
    -[CPChunk bounds](self, "bounds");
    x = v14;
    y = v15;
    width = v16;
    height = v17;
  }
  v18 = x;
  v19 = y;
  v20 = width;
  v21 = height;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (id)describeBounds
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CGRect{{%f, %f}, {%f, %f}}"), *(_QWORD *)&self->bounds.origin.x, *(_QWORD *)&self->bounds.origin.y, *(_QWORD *)&self->bounds.size.width, *(_QWORD *)&self->bounds.size.height);
}

- (CGPoint)anchor
{
  double x;
  double y;
  CGPoint result;

  x = self->bounds.origin.x;
  y = self->bounds.origin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (float)clusterGapTo:(id)a3
{
  int v5;
  int v6;
  int v7;
  double v8;
  double v9;
  float v10;
  float v11;
  float v12;

  -[CPChunk fontSize](self, "fontSize");
  v6 = v5;
  objc_msgSend(a3, "fontSize");
  LODWORD(v8) = v7;
  LODWORD(v9) = v6;
  +[CPChunk chooseReferenceFontSizeFrom:and:](CPChunk, "chooseReferenceFontSizeFrom:and:", v9, v8);
  v11 = v10;
  -[CPChunk absoluteGapTo:](self, "absoluteGapTo:", a3);
  return v12 / v11;
}

- (float)advanceDeltaAfterSpace
{
  return 0.0;
}

- (float)absoluteGapTo:(id)a3
{
  float v5;
  float v6;
  double v7;
  float v8;
  double v9;
  double v10;
  double v11;

  objc_msgSend(a3, "advanceDeltaAfterSpace");
  v6 = v5;
  -[CPChunk advance](self, "advance");
  v8 = v7 + (float)(v6 * 0.5);
  objc_msgSend(a3, "anchor");
  v10 = v9;
  -[CPChunk anchor](self, "anchor");
  return v10 - v11 - v8;
}

- (float)referenceAdvanceWidth
{
  double v2;

  -[CPChunk bounds](self, "bounds");
  return v2;
}

- (void)fitBoundsToChildren
{
  uint64_t v3;
  uint64_t i;
  void *v5;
  CGRect *p_bounds;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  BOOL *p_dirtyBounds;
  CGRect v12;
  CGRect v13;

  v3 = -[NSMutableArray count](self->super.children, "count");
  if (v3)
  {
    for (i = 0; i != v3; ++i)
    {
      v5 = (void *)-[NSMutableArray objectAtIndex:](self->super.children, "objectAtIndex:", i);
      if (i || !self->shrinksWithChildren)
      {
        p_bounds = &self->bounds;
        objc_msgSend(v5, "bounds");
        v13.origin.x = v7;
        v13.origin.y = v8;
        v13.size.width = v9;
        v13.size.height = v10;
        v12 = CGRectUnion(self->bounds, v13);
      }
      else
      {
        p_bounds = &self->bounds;
        objc_msgSend(v5, "bounds");
      }
      *p_bounds = v12;
    }
    p_dirtyBounds = &self->dirtyBounds;
  }
  else
  {
    p_dirtyBounds = &self->dirtyBounds;
    if (!self->dirtyBounds)
      return;
    self->bounds = CGRectNull;
  }
  *p_dirtyBounds = 0;
}

- (void)resizeWith:(id)a3
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGRect v17;
  CGRect v18;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CPChunk bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    objc_msgSend(a3, "bounds");
    v18.origin.x = v13;
    v18.origin.y = v14;
    v18.size.width = v15;
    v18.size.height = v16;
    v17.origin.x = v6;
    v17.origin.y = v8;
    v17.size.width = v10;
    v17.size.height = v12;
    self->bounds = CGRectUnion(v17, v18);
  }
  if (self->super.parent)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CPObject resizeWith:](self->super.parent, "resizeWith:", self);
  }
}

- (void)setInsertionOrder:(int64_t)a3
{
  self->insertionOrder = a3;
  if (self->super.zOrder < a3)
    self->super.zOrder = a3;
}

- (int64_t)insertionOrder
{
  return self->insertionOrder;
}

- (void)sortUsingSelector:(SEL)a3
{
  -[NSMutableArray sortUsingSelector:](self->super.children, "sortUsingSelector:", a3);
}

- (int64_t)compareAnchorY:(id)a3
{
  double v4;
  double v5;
  double v6;

  -[CPChunk anchor](self, "anchor");
  v5 = v4;
  objc_msgSend(a3, "anchor");
  if (v5 < v6)
    return -1;
  else
    return v5 != v6;
}

- (int64_t)compareCommonAnchorX:(id)a3
{
  double v4;
  double v5;
  double v6;

  -[CPChunk anchor](self, "anchor");
  v5 = v4;
  objc_msgSend(a3, "anchor");
  if (v5 < v6)
    return -1;
  else
    return v5 != v6;
}

- (int64_t)compareAnchorYDescending:(id)a3
{
  double v4;
  double v5;
  double v6;
  int64_t v7;

  -[CPChunk anchor](self, "anchor");
  v5 = v4;
  objc_msgSend(a3, "anchor");
  if (v5 <= v6)
    v7 = 0;
  else
    v7 = -1;
  if (v5 < v6)
    return 1;
  else
    return v7;
}

- (int64_t)compareInsertionOrder:(id)a3
{
  int64_t v4;
  uint64_t v5;

  v4 = -[CPChunk insertionOrder](self, "insertionOrder");
  v5 = objc_msgSend(a3, "insertionOrder");
  if (v4 < v5)
    return -1;
  else
    return v4 != v5;
}

- (int64_t)compareZ:(id)a3
{
  int64_t v4;
  uint64_t v5;

  v4 = -[CPObject zOrder](self, "zOrder");
  v5 = objc_msgSend(a3, "zOrder");
  if (v4 < v5)
    return -1;
  else
    return v4 != v5;
}

- (int64_t)compareZDescending:(id)a3
{
  int64_t v4;
  uint64_t v5;
  int64_t v6;

  v4 = -[CPObject zOrder](self, "zOrder");
  v5 = objc_msgSend(a3, "zOrder");
  if (v4 == v5)
    v6 = 0;
  else
    v6 = -1;
  if (v4 < v5)
    return 1;
  else
    return v6;
}

- (int64_t)compareXBounds:(id)a3
{
  double x;
  double v4;

  x = self->bounds.origin.x;
  objc_msgSend(a3, "bounds");
  if (x < v4)
    return -1;
  else
    return x != v4;
}

- (int64_t)compareLinearBounds:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = fmax(self->bounds.size.height, self->bounds.size.width);
  objc_msgSend(a3, "bounds");
  v6 = v5;
  objc_msgSend(a3, "bounds");
  v8 = fmax(v6, v7);
  if (v4 <= v8)
    return v4 < v8;
  else
    return -1;
}

- (int64_t)compareY:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  int64_t v8;

  -[CPChunk anchor](self, "anchor");
  v5 = v4;
  objc_msgSend(a3, "anchor");
  v7 = vabdd_f64(v5, v6);
  v8 = -1;
  if (v5 >= v6)
    v8 = 1;
  if (v7 >= 0.0001)
    return v8;
  else
    return 0;
}

- (int64_t)compareYBounds:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  int64_t v8;

  -[CPChunk bounds](self, "bounds");
  v5 = v4;
  objc_msgSend(a3, "bounds");
  v7 = vabdd_f64(v5, v6);
  v8 = -1;
  if (v5 >= v6)
    v8 = 1;
  if (v7 >= 0.0001)
    return v8;
  else
    return 0;
}

- (int64_t)compareTopDescending:(id)a3
{
  double v4;
  double v5;
  double v6;
  int64_t v7;

  -[CPChunk top](self, "top");
  v5 = v4;
  objc_msgSend(a3, "top");
  if (v5 <= v6)
    v7 = 0;
  else
    v7 = -1;
  if (v5 < v6)
    return 1;
  else
    return v7;
}

- (int64_t)compareYDescending:(id)a3
{
  double v4;
  double v5;
  double v6;
  int64_t v7;

  -[CPChunk anchor](self, "anchor");
  v5 = v4;
  objc_msgSend(a3, "anchor");
  if (v5 <= v6)
    v7 = 0;
  else
    v7 = -1;
  if (v5 < v6)
    return 1;
  else
    return v7;
}

- (int64_t)compareYDescendingX:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v9;
  double v10;
  double v11;

  -[CPChunk anchor](self, "anchor");
  v6 = v5;
  objc_msgSend(a3, "anchor");
  if (v6 < v7)
    return 1;
  if (v6 > v7)
    return -1;
  -[CPChunk anchor](self, "anchor");
  v10 = v9;
  objc_msgSend(a3, "anchor");
  if (v10 >= v11)
    return v10 > v11;
  else
    return -1;
}

- (int64_t)compareChunkPosition:(id)a3
{
  unsigned int v4;
  unsigned int v5;

  v4 = -[CPChunk chunkPosition](self, "chunkPosition");
  v5 = objc_msgSend(a3, "chunkPosition");
  if (v4 < v5)
    return -1;
  else
    return v4 != v5;
}

- (double)left
{
  double result;
  double v4;
  double v5;

  -[CPChunk bounds](self, "bounds");
  if (v4 < 0.0 || v5 < 0.0)
    *(_QWORD *)&result = (unint64_t)CGRectStandardize(*(CGRect *)&result);
  return result;
}

- (double)right
{
  double v2;
  double v4;
  double v5;

  -[CPChunk bounds](self, "bounds");
  if (v4 < 0.0 || v5 < 0.0)
    *(CGRect *)&v2 = CGRectStandardize(*(CGRect *)&v2);
  return v2 + v4;
}

- (double)center
{
  double v2;
  double v3;

  -[CPChunk bounds](self, "bounds");
  return v3 + v2 * 0.5;
}

- (double)top
{
  uint64_t v2;
  double v3;
  double v4;
  double v5;

  -[CPChunk bounds](self, "bounds");
  if (v4 < 0.0 || v5 < 0.0)
    *(CGRect *)(&v3 - 1) = CGRectStandardize(*(CGRect *)&v2);
  return v3 + v5;
}

- (double)bottom
{
  uint64_t v2;
  double v3;
  double v4;
  double v5;

  -[CPChunk bounds](self, "bounds");
  if (v4 < 0.0 || v5 < 0.0)
    *(CGRect *)(&v3 - 1) = CGRectStandardize(*(CGRect *)&v2);
  return v3;
}

- (float)fontSize
{
  return 0.0;
}

- (CGSize)advance
{
  double width;
  double height;
  CGSize result;

  width = self->bounds.size.width;
  height = self->bounds.size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int)clusterLevelHint
{
  return 0;
}

- (void)orderedInsert:(id)a3 usingSelector:(SEL)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v7 = -[CPObject count](self, "count");
  if ((int)v7 < 1)
  {
    v9 = 0;
  }
  else
  {
    v8 = v7;
    v9 = 0;
    while (objc_msgSend(-[CPObject childAtIndex:](self, "childAtIndex:", v9), "performSelector:withObject:", a4, a3) != 1)
    {
      v9 = (v9 + 1);
      if ((_DWORD)v8 == (_DWORD)v9)
      {
        v9 = v8;
        break;
      }
    }
  }
  -[CPChunk add:atIndex:](self, "add:atIndex:", a3, v9);
}

- (BOOL)overlapsHorizontallyWith:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  -[CPChunk top](self, "top");
  v6 = v5;
  -[CPChunk bottom](self, "bottom");
  v8 = v7;
  objc_msgSend(a3, "top");
  v10 = v9;
  objc_msgSend(a3, "bottom");
  return v10 > v8 && v11 < v6;
}

- (BOOL)overlapsVerticallyWith:(id)a3
{
  double v4;
  double x;
  double v6;
  CGFloat v7;
  double v8;
  double width;
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
  double v20;
  unint64_t v21;
  double v22;
  CGFloat v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  -[CPChunk bounds](self, "bounds");
  x = v4;
  v7 = v6;
  width = v8;
  v11 = v10;
  objc_msgSend(a3, "bounds");
  v13 = v12;
  v24 = v14;
  v16 = v15;
  v18 = v17;
  if (width < 0.0 || v11 < 0.0)
  {
    v25.origin.x = x;
    v25.origin.y = v7;
    v25.size.width = width;
    v25.size.height = v11;
    *(_QWORD *)&v19 = (unint64_t)CGRectStandardize(v25);
    v26.origin.x = x;
    v26.origin.y = v7;
    v26.size.width = width;
    v26.size.height = v11;
    v27 = CGRectStandardize(v26);
    x = v27.origin.x;
    width = v27.size.width;
  }
  else
  {
    v19 = x;
  }
  if (v16 < 0.0 || v18 < 0.0)
  {
    v28.origin.x = v13;
    v28.origin.y = v24;
    v28.size.width = v16;
    v28.size.height = v18;
    v21 = (unint64_t)CGRectStandardize(v28);
    v29.origin.x = v13;
    v29.origin.y = v24;
    v29.size.width = v16;
    v29.size.height = v18;
    *(CGRect *)&v20 = CGRectStandardize(v29);
    v16 = v22;
    v13 = *(double *)&v21;
  }
  else
  {
    v20 = v13;
  }
  return v13 < x + width && v20 + v16 > v19;
}

- (BOOL)geometricallyContains:(id)a3
{
  double v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v10;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend(a3, "bounds");
  v8 = v7;
  if (v7 == INFINITY || v4 == INFINITY)
    return 0;
  v10 = v4;
  v11 = v5;
  v12 = v6;
  return CGRectContainsRect(self->bounds, *(CGRect *)&v8);
}

- (BOOL)boundsEqualsRect:(CGRect)a3 accuracy:(double)a4
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CPChunk bounds](self, "bounds");
  v13 = vabdd_f64(v12, y);
  if (vabdd_f64(v11, x) > a4 || v13 > a4)
    return 0;
  v16 = vabdd_f64(v9, width) <= a4;
  return vabdd_f64(v10, height) <= a4 && v16;
}

- (BOOL)shrinksWithChildren
{
  return self->shrinksWithChildren;
}

- (void)setShrinksWithChildren:(BOOL)a3
{
  self->shrinksWithChildren = a3;
}

- (BOOL)intersectsChild:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  int v8;
  int v9;
  int v10;
  _BOOL4 v11;
  CGRect v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[CPObject count](self, "count");
  if (v8 < 1)
  {
    LOBYTE(v11) = 0;
  }
  else
  {
    v9 = v8;
    v10 = 1;
    do
    {
      objc_msgSend(-[CPObject childAtIndex:](self, "childAtIndex:", (v10 - 1)), "bounds");
      v14.origin.x = x;
      v14.origin.y = y;
      v14.size.width = width;
      v14.size.height = height;
      v11 = CGRectIntersectsRect(v13, v14);
      if (v10 >= v9)
        break;
      ++v10;
    }
    while (!v11);
  }
  return v11;
}

- (void)translateObjectYBy:(double)a3
{
  self->bounds.origin.y = self->bounds.origin.y + a3;
}

- (unsigned)chunkPosition
{
  return self->position;
}

- (void)setChunkPosition:(unsigned int)a3
{
  self->position = a3;
}

- (double)rotationAngle
{
  double result;

  if (!self->super.parent)
    return 0.0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0.0;
  -[CPObject rotationAngle](self->super.parent, "rotationAngle");
  return result;
}

+ (float)chooseReferenceFontSizeFrom:(float)a3 and:(float)a4
{
  float v4;

  if (a3 > 0.0 && (a4 >= a3 || a4 == 0.0))
    return a3;
  v4 = 12.0;
  if (a4 > 0.0)
  {
    if (a3 > a4 || a3 == 0.0)
      return a4;
    else
      return 12.0;
  }
  return v4;
}

@end
