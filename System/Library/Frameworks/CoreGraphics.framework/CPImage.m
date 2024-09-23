@implementation CPImage

- (CPImage)initWithBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CPImage *result;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)CPImage;
  result = -[CPGraphicObject init](&v8, sel_init);
  if (result)
  {
    result->super.super.bounds.origin.x = x;
    result->super.super.bounds.origin.y = y;
    result->super.super.bounds.size.width = width;
    result->super.super.bounds.size.height = height;
  }
  return result;
}

- (CPPDFImage)imageData
{
  return self->imageData;
}

- (CGRect)renderedBounds
{
  double y;
  double x;
  double v6;
  double width;
  double height;
  CGRect result;

  if (!self->renderedBoundsComputed)
  {
    y = self->super.renderedBounds.origin.y;
    if (self->super.renderedBounds.origin.x == INFINITY || y == INFINITY)
      -[CPImage recomputeRenderedBounds](self, "recomputeRenderedBounds", INFINITY, y);
  }
  x = self->super.renderedBounds.origin.x;
  v6 = self->super.renderedBounds.origin.y;
  width = self->super.renderedBounds.size.width;
  height = self->super.renderedBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = v6;
  result.origin.x = x;
  return result;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->super.super.bounds.origin.x;
  y = self->super.super.bounds.origin.y;
  width = self->super.super.bounds.size.width;
  height = self->super.super.bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)recomputeRenderedBounds
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double y;
  BOOL v12;
  CGPath *v13;
  const CGPath *v14;
  CGPath *Mutable;
  CGPath *v16;
  CGRect *p_renderedBounds;
  int v18;
  const CGPath *v19[3];
  CGRect v20;
  CGRect v21;

  v19[2] = *(const CGPath **)MEMORY[0x1E0C80C00];
  self->renderedBoundsComputed = 1;
  objc_msgSend(-[CPObject page](self, "page"), "pageCropBox");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (self->super.clipIndex
    && ((y = self->super.super.bounds.origin.y, self->super.super.bounds.origin.x != INFINITY)
      ? (v12 = y == INFINITY)
      : (v12 = 1),
        !v12
     && (v13 = CPPDFGetClipPathIntersection(objc_msgSend(-[CPObject page](self, "page", INFINITY, y), "PDFContext"), self->super.clipIndex, &v18)) != 0))
  {
    v14 = v13;
    Mutable = CGPathCreateMutable();
    CGPathAddRect(Mutable, 0, self->super.super.bounds);
    v19[0] = v14;
    v19[1] = Mutable;
    v16 = CGPathCreateMutable();
    CGPathAddIntersection(v16, v19, 2u);
    p_renderedBounds = &self->super.renderedBounds;
    *p_renderedBounds = CGPathGetPathBoundingBox(v16);
    if (v16)
      CFRelease(v16);
    if (Mutable)
      CFRelease(Mutable);
    v20.origin.x = v4;
    v20.origin.y = v6;
    v20.size.width = v8;
    v20.size.height = v10;
    *p_renderedBounds = CGRectIntersection(v20, *p_renderedBounds);
  }
  else
  {
    v21.origin.x = v4;
    v21.origin.y = v6;
    v21.size.width = v8;
    v21.size.height = v10;
    self->super.renderedBounds = CGRectIntersection(v21, self->super.super.bounds);
  }
}

- (void)accept:(id)a3
{
  objc_msgSend(a3, "visitImage:", self);
}

- (BOOL)isVisible
{
  CPPDFImage *imageData;

  imageData = self->imageData;
  return !imageData || imageData->var7 > 0.0;
}

- (CPImage)initWithPDFImage:(CPPDFImage *)a3
{
  CPImage *v4;
  CPImage *v5;

  v4 = -[CPImage initWithBounds:](self, "initWithBounds:", a3->var0.var0.origin.x, a3->var0.var0.origin.y, a3->var0.var0.size.width, a3->var0.var0.size.height);
  v5 = v4;
  if (v4)
  {
    v4->imageData = a3;
    v4->super.clipIndex = a3->var0.var2;
    -[CPChunk setInsertionOrder:](v4, "setInsertionOrder:", a3->var0.var3);
  }
  return v5;
}

@end
