@implementation CPTable

- (CPTable)initWithBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CPTable *result;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)CPTable;
  result = -[CPChunk init](&v8, sel_init);
  if (result)
  {
    result->tableBounds.origin.x = x;
    result->tableBounds.origin.y = y;
    result->tableBounds.size.width = width;
    result->tableBounds.size.height = height;
  }
  return result;
}

- (void)dispose
{
  CGColor *backgroundColor;
  id *backgroundGraphics;
  unint64_t v5;

  if (!self->disposed)
  {
    free(self->rowY);
    self->rowY = 0;
    free(self->columnX);
    self->columnX = 0;
    backgroundColor = self->backgroundColor;
    if (backgroundColor)
      CFRelease(backgroundColor);
    self->backgroundColor = 0;
    backgroundGraphics = self->backgroundGraphics;
    if (backgroundGraphics)
    {
      if (self->backgroundGraphicCount)
      {
        v5 = 0;
        do

        while (v5 < self->backgroundGraphicCount);
        backgroundGraphics = self->backgroundGraphics;
      }
      free(backgroundGraphics);
      self->backgroundGraphics = 0;
    }
    self->backgroundGraphicCount = 0;
    self->disposed = 1;
  }
}

- (void)finalize
{
  objc_super v3;

  -[CPTable dispose](self, "dispose");
  v3.receiver = self;
  v3.super_class = (Class)CPTable;
  -[CPTable finalize](&v3, sel_finalize);
}

- (void)dealloc
{
  objc_super v3;

  -[CPTable dispose](self, "dispose");
  v3.receiver = self;
  v3.super_class = (Class)CPTable;
  -[CPObject dealloc](&v3, sel_dealloc);
}

- (void)setRowCount:(unsigned int)a3
{
  double *rowY;

  self->rowCount = a3;
  rowY = self->rowY;
  if (rowY)
  {
    free(rowY);
    self->rowY = 0;
  }
  self->rowY = (double *)malloc_type_calloc(a3 + 1, 8uLL, 0x100004000313F17uLL);
}

- (unsigned)rowCount
{
  return self->rowCount;
}

- (void)setColumnCount:(unsigned int)a3
{
  double *columnX;

  self->columnCount = a3;
  columnX = self->columnX;
  if (columnX)
  {
    free(columnX);
    self->columnX = 0;
  }
  self->columnX = (double *)malloc_type_calloc(a3 + 1, 8uLL, 0x100004000313F17uLL);
}

- (unsigned)columnCount
{
  return self->columnCount;
}

- (CGColor)backgroundColor
{
  CGColor *backgroundColor;
  CGColor *v4;

  backgroundColor = self->backgroundColor;
  if (!backgroundColor)
  {
    if (self->backgroundGraphicCount == 1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v4 = (CGColor *)objc_msgSend(*self->backgroundGraphics, "fillColor");
      if (v4)
      {
        backgroundColor = v4;
        CFRetain(v4);
        self->backgroundColor = backgroundColor;
      }
      else
      {
        return self->backgroundColor;
      }
    }
    else
    {
      backgroundColor = CGColorCreateSRGB(1.0, 1.0, 1.0, 1.0);
      self->backgroundColor = backgroundColor;
    }
  }
  return backgroundColor;
}

- (void)setBackgroundGraphics:(id)a3
{
  id *backgroundGraphics;
  unint64_t v6;
  unsigned int v7;
  unint64_t v8;

  backgroundGraphics = self->backgroundGraphics;
  if (backgroundGraphics)
  {
    if (self->backgroundGraphicCount)
    {
      v6 = 0;
      do

      while (v6 < self->backgroundGraphicCount);
      backgroundGraphics = self->backgroundGraphics;
    }
    free(backgroundGraphics);
    self->backgroundGraphics = 0;
  }
  self->backgroundGraphicCount = 0;
  if (a3)
  {
    v7 = objc_msgSend(a3, "count");
    self->backgroundGraphicCount = v7;
    if (v7)
    {
      self->backgroundGraphics = (id *)malloc_type_malloc(8 * v7, 0x80040B8603338uLL);
      if (self->backgroundGraphicCount)
      {
        v8 = 0;
        do
        {
          self->backgroundGraphics[v8] = (id)objc_msgSend(a3, "objectAtIndex:", v8);
          ++v8;
        }
        while (v8 < self->backgroundGraphicCount);
      }
    }
  }
}

- (id)backgroundGraphicAtIndex:(unsigned int)a3
{
  if (self->backgroundGraphicCount <= a3)
    return 0;
  else
    return self->backgroundGraphics[a3];
}

- (void)incrementUsedGraphicCount
{
  ++self->usedGraphicCount;
}

- (unsigned)usedGraphicCount
{
  return self->usedGraphicCount;
}

- (CGRect)tableBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->tableBounds.origin.x;
  y = self->tableBounds.origin.y;
  width = self->tableBounds.size.width;
  height = self->tableBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)rowY
{
  return self->rowY;
}

- (double)columnX
{
  return self->columnX;
}

- (unsigned)backgroundGraphicCount
{
  return self->backgroundGraphicCount;
}

@end
