@implementation CPLayoutArea

- (CPLayoutArea)init
{
  CPLayoutArea *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPLayoutArea;
  result = -[CPRotatedRegion init](&v3, sel_init);
  if (result)
    *(&result->super.dirtyNormalizedBounds + 1) = 0;
  return result;
}

- (void)accept:(id)a3
{
  objc_msgSend(a3, "visitLayoutArea:", self);
}

- (BOOL)isSimilarTo:(id)a3
{
  return 0;
}

- (BOOL)isFirstLayout
{
  return *(&self->super.dirtyNormalizedBounds + 1);
}

- (void)setIsFirstLayout:(BOOL)a3
{
  *(&self->super.dirtyNormalizedBounds + 1) = a3;
}

- (void)addColumnBreaks
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[CPObject count](self, "count");
  v4 = (v3 - 1);
  if (v3 > 1)
  {
    v5 = 0;
    do
      objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->super.super.super.super.children, "objectAtIndex:", v5++), "setHasColumnBreak:", 1);
    while (v4 != v5);
  }
  if (v3 >= 1)
    objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->super.super.super.super.children, "objectAtIndex:", v4), "setHasColumnBreak:", 0);
}

- (BOOL)isBoxRegion
{
  return 0;
}

- (BOOL)isGraphicalRegion
{
  return 0;
}

- (BOOL)isRowRegion
{
  return 0;
}

- (BOOL)isImageRegion
{
  return 0;
}

- (BOOL)isShapeRegion
{
  return 0;
}

- (CGRect)layoutAreaBounds
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  v3 = -[CPChunk shrinksWithChildren](self, "shrinksWithChildren");
  -[CPChunk bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if (v3)
  {
    if (-[CPObject count](self, "count"))
    {
      v12 = -[CPObject firstChild](self, "firstChild");
      v13 = -[CPObject lastChild](self, "lastChild");
      objc_msgSend(v12, "leftPad");
      v15 = v14;
      objc_msgSend(v13, "rightPad");
      if (v15 + v16 > 0.0)
      {
        v17 = -0.0;
        if (v15 > 0.0)
          v17 = v15;
        v9 = v9 + v17;
        v5 = v5 - fmax(v15, 0.0);
        if (v16 > 0.0)
          v9 = v16 + v9;
      }
    }
  }
  v18 = v5;
  v19 = v7;
  v20 = v9;
  v21 = v11;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (double)selectionBottom
{
  unsigned int v3;
  int v4;
  double v5;
  double v6;
  uint64_t v7;
  double v8;

  v3 = -[CPObject count](self, "count");
  if (!v3)
    return 0.0;
  v4 = v3;
  objc_msgSend(-[CPObject childAtIndex:](self, "childAtIndex:", 0), "selectionBottom");
  v6 = v5;
  if (v4 >= 2)
  {
    v7 = 1;
    do
    {
      objc_msgSend(-[CPObject childAtIndex:](self, "childAtIndex:", v7), "selectionBottom");
      if (v8 < v6)
        v6 = v8;
      v7 = (v7 + 1);
    }
    while (v4 != (_DWORD)v7);
  }
  return v6;
}

- (void)setHasRotatedCharacters:(BOOL)a3
{
  *(&self->super.dirtyNormalizedBounds + 2) = a3;
}

- (BOOL)hasRotatedCharacters
{
  return *(&self->super.dirtyNormalizedBounds + 2);
}

- (id)properties
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[CPLayoutArea layoutAreaBounds](self, "layoutAreaBounds");
  return (id)objc_msgSend(v2, "stringWithFormat:", CFSTR("layoutAreaBounds=%@"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CGRect{{%f, %f}, {%f, %f}}"), v3, v4, v5, v6));
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LayoutArea[%@...]"), objc_msgSend(-[CPObject firstChild](self, "firstChild"), "description"));
}

@end
