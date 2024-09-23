@implementation CPTableCell

- (CPTableCell)initWithBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CPTableCell *v7;
  CPTableCell *v8;
  $7CC6510369D8EF2E8A10342DF5B8A8F0 *v9;
  uint64_t v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)CPTableCell;
  v7 = -[CPChunk init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->cellBounds.origin.x = x;
    v7->cellBounds.origin.y = y;
    v7->cellBounds.size.width = width;
    v7->cellBounds.size.height = height;
    v7->rowSpan = ($5CFEE62CA76FAE445C6F9DBCEE669C70)CPRangeNull;
    v7->columnSpan = ($5CFEE62CA76FAE445C6F9DBCEE669C70)CPRangeNull;
    v9 = ($7CC6510369D8EF2E8A10342DF5B8A8F0 *)malloc_type_calloc(4uLL, 0x38uLL, 0x10A0040575B0D7CuLL);
    v10 = 0;
    v8->borders = v9;
    do
      v8->borders[v10++].var0 = CGRectNull;
    while (v10 != 4);
  }
  return v8;
}

- (void)dispose
{
  uint64_t i;
  $7CC6510369D8EF2E8A10342DF5B8A8F0 *v4;
  CGColor *var1;
  unsigned int var2;
  id *var3;
  unsigned int v8;
  uint64_t v9;
  CGColor *backgroundColor;
  id *backgroundGraphics;
  unint64_t v12;

  if (self->borders)
  {
    for (i = 0; i != 4; ++i)
    {
      v4 = &self->borders[i];
      var1 = v4->var1;
      var2 = v4->var2;
      var3 = v4->var3;
      if (var1)
        CFRelease(var1);
      if (var3)
      {
        if (var2)
        {
          v8 = var2 - 1;
          do
          {
            v9 = v8;

          }
          while (v9);
        }
        free(var3);
      }
    }
    backgroundColor = self->backgroundColor;
    if (backgroundColor)
      CFRelease(backgroundColor);
    self->backgroundColor = 0;
    backgroundGraphics = self->backgroundGraphics;
    if (backgroundGraphics)
    {
      if (self->backgroundGraphicCount)
      {
        v12 = 0;
        do

        while (v12 < self->backgroundGraphicCount);
        backgroundGraphics = self->backgroundGraphics;
      }
      free(backgroundGraphics);
      self->backgroundGraphics = 0;
    }
    self->backgroundGraphicCount = 0;
    free(self->borders);
    self->borders = 0;
  }
}

- (void)finalize
{
  objc_super v3;

  -[CPTableCell dispose](self, "dispose");
  v3.receiver = self;
  v3.super_class = (Class)CPTableCell;
  -[CPTableCell finalize](&v3, sel_finalize);
}

- (void)dealloc
{
  objc_super v3;

  -[CPTableCell dispose](self, "dispose");
  v3.receiver = self;
  v3.super_class = (Class)CPTableCell;
  -[CPObject dealloc](&v3, sel_dealloc);
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

- (void)setBorder:(int)a3 bounds:(CGRect)a4 graphics:(id)a5
{
  $7CC6510369D8EF2E8A10342DF5B8A8F0 *borders;
  $7CC6510369D8EF2E8A10342DF5B8A8F0 *v9;
  id *var3;
  unsigned int var2;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;

  borders = self->borders;
  v9 = &borders[a3];
  v9->var0 = a4;
  var3 = v9->var3;
  if (var3)
  {
    var2 = borders[a3].var2;
    if (var2)
    {
      v12 = var2 - 1;
      do
      {
        v13 = v12;

      }
      while (v13);
      var3 = self->borders[a3].var3;
    }
    free(var3);
    self->borders[a3].var3 = 0;
  }
  if (a5)
  {
    v14 = objc_msgSend(a5, "count");
    v15 = v14;
    if (v14)
    {
      v16 = 0;
      self->borders[a3].var3 = (id *)malloc_type_malloc(8 * v14, 0x80040B8603338uLL);
      do
      {
        self->borders[a3].var3[v16] = (id)objc_msgSend(a5, "objectAtIndex:", v16);
        ++v16;
      }
      while (v15 != v16);
    }
  }
  else
  {
    v15 = 0;
  }
  self->borders[a3].var2 = v15;
}

- (CGRect)boundsOfBorder:(int)a3
{
  $7CC6510369D8EF2E8A10342DF5B8A8F0 *v3;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  v3 = &self->borders[a3];
  x = v3->var0.origin.x;
  y = v3->var0.origin.y;
  width = v3->var0.size.width;
  height = v3->var0.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGColor)colorOfBorder:(int)a3
{
  $7CC6510369D8EF2E8A10342DF5B8A8F0 *borders;
  id v6;
  void *v7;
  CGColorSpace *DeviceRGB;
  _OWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  borders = self->borders;
  if (!borders[a3].var1)
  {
    if (borders[a3].var2 == 1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v6 = *self->borders[a3].var3;
      if (objc_msgSend(v6, "parent") && (v7 = (void *)objc_msgSend(v6, "fillColor")) != 0
        || (v7 = (void *)objc_msgSend(v6, "strokeColor")) != 0)
      {
        CFRetain(v7);
        self->borders[a3].var1 = (CGColor *)v7;
      }
    }
    else
    {
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      v10[0] = xmmword_1850022A8;
      v10[1] = unk_1850022B8;
      self->borders[a3].var1 = CGColorCreate(DeviceRGB, (const CGFloat *)v10);
      CGColorSpaceRelease(DeviceRGB);
    }
  }
  return self->borders[a3].var1;
}

- (unsigned)graphicCountOfBorder:(int)a3
{
  return self->borders[a3].var2;
}

- (id)graphicObjectOfBorder:(int)a3 atIndex:(unsigned int)a4
{
  $7CC6510369D8EF2E8A10342DF5B8A8F0 *borders;

  borders = self->borders;
  if (borders[a3].var2 <= a4)
    return 0;
  else
    return borders[a3].var3[a4];
}

- (int64_t)compareCellOrdinal:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v5 = -[CPTableCell rowSpan](self, "rowSpan");
  v6 = objc_msgSend(a3, "rowSpan");
  if (v5 < v6)
    return -1;
  if (v5 > v6)
    return 1;
  v8 = -[CPTableCell columnSpan](self, "columnSpan");
  v9 = objc_msgSend(a3, "columnSpan");
  if (v8 < v9)
    return -1;
  else
    return v8 > v9;
}

- (CGRect)cellBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->cellBounds.origin.x;
  y = self->cellBounds.origin.y;
  width = self->cellBounds.size.width;
  height = self->cellBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)rowSpan
{
  $5CFEE62CA76FAE445C6F9DBCEE669C70 *p_rowSpan;
  int64_t location;
  int64_t length;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  p_rowSpan = &self->rowSpan;
  location = self->rowSpan.location;
  length = p_rowSpan->length;
  result.var1 = length;
  result.var0 = location;
  return result;
}

- (void)setRowSpan:(id)a3
{
  self->rowSpan = ($5CFEE62CA76FAE445C6F9DBCEE669C70)a3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)columnSpan
{
  $5CFEE62CA76FAE445C6F9DBCEE669C70 *p_columnSpan;
  int64_t location;
  int64_t length;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  p_columnSpan = &self->columnSpan;
  location = self->columnSpan.location;
  length = p_columnSpan->length;
  result.var1 = length;
  result.var0 = location;
  return result;
}

- (void)setColumnSpan:(id)a3
{
  self->columnSpan = ($5CFEE62CA76FAE445C6F9DBCEE669C70)a3;
}

- (unsigned)backgroundGraphicCount
{
  return self->backgroundGraphicCount;
}

@end
